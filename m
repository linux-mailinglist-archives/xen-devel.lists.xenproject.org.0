Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC70E26DE7B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 16:43:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIv7f-00066N-G5; Thu, 17 Sep 2020 14:42:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZJEn=C2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kIv7e-00066I-NU
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 14:42:54 +0000
X-Inumbo-ID: 1d352d37-d865-49ca-8457-b549919670d7
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d352d37-d865-49ca-8457-b549919670d7;
 Thu, 17 Sep 2020 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600353774;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=OAYfjzuALTDlog5/DLHpe3UhKtLNYGKFX8MMWUt3Y5o=;
 b=P8tOt7a/fiW2osr71ql7UzsD0zYy0qyKWxf+mzEQf0ShWcwQzOvOKvaI
 Y3lC13OqESsnbLPazlNifhz+BksXko+OFlcLhk874emiLMOT85j87kzNk
 OUQU1CUoEo1tY1geTymdWZ4V5dNDZFC74VRWZQnIrEM1XMQ/dlqN4OOfu 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6L9kOutK+6Ft9R0jF9X0TlyAFXkPA22ZVC5ABuhsdACkJ0NvmHXsCm5Y2PW/r7HcGpYzdaGxGY
 RibI+JpQlXoxkABUjxQ58h7AYaRalE8nwryknIlM4nv3+JuZSTzUIelAIjFuL9Gez+wkqASqwG
 //TkZbBn9oLyjm/TW28Ek2lwxuLJBuf+SYKgzMSH8lpDhfTwzVqzqw09E3qU4lBid4wTkWjM09
 HLSrucldBhvRgWi+AqZZ2z+QHn2pga8iMF6mgrmVSFiiLqPyzRJZ/61m+q38LqC7FTbIC68hux
 xsw=
X-SBRS: 2.7
X-MesageID: 26944639
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,437,1596513600"; d="scan'208";a="26944639"
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 <xen-devel@lists.xenproject.org>
CC: <xen-devel@dornerworks.com>, Josh Whitehead
 <josh.whitehead@dornerworks.com>, Stewart Hildebrand
 <stewart.hildebrand@dornerworks.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <36f7ed35-039c-482b-c04b-0f2348de37f6@citrix.com>
Date: Thu, 17 Sep 2020 15:42:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/09/2020 19:18, Jeff Kubascik wrote:
> +/*
> + * A handle with all zeros represents domain 0 if present, otherwise idle UNIT
> + */
> +#define DOM0_HANDLE ((const xen_domain_handle_t){0})

This isn't accurate.

There are systems where dom0 doesn't have a zero UUID (XenServer for
one), and its easy to create domU's which have a zero UUID.  They are
not unique, and can be changed at any time during the running of the VM.

If you need a unique identifier, then use domid's.

I can't see any legitimate need for the scheduler to handle the UUID at all.

~Andrew

