Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36923F252
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 19:54:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k46Z9-0000v2-Of; Fri, 07 Aug 2020 17:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1r1P=BR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k46Z8-0000ux-AW
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 17:54:02 +0000
X-Inumbo-ID: 44207fe7-28eb-420d-9be1-f51a810eab98
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44207fe7-28eb-420d-9be1-f51a810eab98;
 Fri, 07 Aug 2020 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596822841;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=iD617Y6OVoROGJrkQRY9v/hlsFrigV94JtMP9NuHCvI=;
 b=fwkG5I6mnuTGykbQ9PyCbMZs4sFup9TGticFlP9k94NSI34VhLLPESii
 zccgXJwNTBUiJ6ne4tqkQAZm0wu/qworVTMgZ2eLS87gdcAzzqVVfHzp+
 ElfkLZhpGnObHSiwaCkFjbA2YuvnCD05iO9YwfA4tI8Rjb5SRDBc8ICKo M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qbVREyPxdTMHWS4OYhkrlBB8iXSdsAwKaqB77aYthwjcwveIAGYNhkdWUmYljsuxCzG7i67yca
 2K6jGy/ExXYt9er851wyViNH4HwZYx42iDll9usL4nDG///8LYjMQYjEKZvZ4Ap2P/RPci8Aaz
 o2jyr8hYVYb0U602nnOakPceSwpz2FPKM6zJJM5iP9B/dDn+8KJxw+przWvUYKCcOM3eYBxKZm
 kMo2IqaiBmlLgoY6DDJ2xm3wz07woH0cj7dONptuLXHwAyTFv2VNIkY5k5GmRyYPWKo1Lu5kk7
 /QM=
X-SBRS: 2.7
X-MesageID: 24257184
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,446,1589256000"; d="scan'208";a="24257184"
Subject: Re: [PATCH v2 5/7] x86: move domain_cpu_policy_changed()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <f954ab7b-9743-a7a8-33bc-e70301cd88ce@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c8be060-bbbb-b41e-23d9-a665561d6988@citrix.com>
Date: Fri, 7 Aug 2020 18:53:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f954ab7b-9743-a7a8-33bc-e70301cd88ce@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/08/2020 12:34, Jan Beulich wrote:
> This is in preparation of making the building of domctl.c conditional.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

