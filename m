Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CE248656
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:46:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81wL-00088a-Qk; Tue, 18 Aug 2020 13:46:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k81wK-00088U-R2
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:46:12 +0000
X-Inumbo-ID: 7d313d87-b9d2-49c9-ac6a-6285bcc2dba3
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d313d87-b9d2-49c9-ac6a-6285bcc2dba3;
 Tue, 18 Aug 2020 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597758371;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=UYm5qFKrAdHhc8LnzP/y7Z7ORm0QjZGff9Hw0OVUKcI=;
 b=cuPT/0bHeWLvT8Os8i/dyzKHMfGv5Q/ln7+IgxAMSHi+GQnuF0Y5qYGX
 0vi1OLGF8m3YUPMbVmA3+SapIgXaY2uAa783tnr0rS3YAoIltlcjCKY7I
 c351XFq1S+R9UMXUAXK5C1mMiZJxepHqDmFxzFp+fV3i5MQlAFR4xc+lX 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AZDZoy4j5Jo38m000PgNkaGgPv2mKyvGyz8xGp5Ugdn5WLVbBf9suWO4TopTGCm5AtrLS20Xd9
 Msyt1gJgsfjducr0cNavOe8NVI/R65qb0UfNC7kAwKhSiszDbLvVLT9BIaDFJNG9WH+wKonbvx
 uveVvs8xJWWRO3rnDLBLOeFK7N/J0cenILXNmanAvneM+ds4msiuaLocYNUjILqG5Kdw63Dtue
 AdS+hPYuT9tPjSKLC/O0KspP41uqQYlCIRfU2HsQ7/ax130jhS/yAC1WUn8kqo9KcYei4Pf1+S
 rDs=
X-SBRS: 2.7
X-MesageID: 25084483
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25084483"
Subject: Re: [PATCH 3/8] x86/pv: handle writes to the EFER MSR
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20200817155757.3372-1-roger.pau@citrix.com>
 <20200817155757.3372-4-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <476eaf39-ba9a-055d-be2f-7900d1762ef0@citrix.com>
Date: Tue, 18 Aug 2020 14:46:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817155757.3372-4-roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/08/2020 16:57, Roger Pau Monne wrote:
> @@ -1005,6 +1013,13 @@ static int write_msr(unsigned int reg, uint64_t val,
>          curr->arch.pv.gs_base_user = val;
>          return X86EMUL_OKAY;
>  
> +    case MSR_EFER:
> +        /* Silently drop writes that don't change the reported value. */
> +        temp = guest_efer(currd);
> +        if ( val != temp )
> +            goto invalid;

break.

The invalid label does write-discard, rather than injecting #GP.

The comment would be clearer as "Reject writes which change the value,
but tolerate no-op writes", seeing as that is the compatibility
behaviour we're adding.

~Andrew

