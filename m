Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365651AE62F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 21:46:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPWwg-0002fr-Dr; Fri, 17 Apr 2020 19:46:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9Py=6B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jPWwe-0002fd-CC
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 19:46:36 +0000
X-Inumbo-ID: 251785ce-80e4-11ea-8d8c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 251785ce-80e4-11ea-8d8c-12813bfff9fa;
 Fri, 17 Apr 2020 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587152795;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=i0czuu+bpPt/GLhHiDU/+0/mjatb0g27pfgD9Jof7ks=;
 b=HIm5I9mTtxUoDt3xUi2/5hxhPe6d9f4rboj/90jDE4DTY3Whl3DRVCzA
 bOqumZyFbMSGh9z5xlOsFnN9iUUwmYxv6xbpysrHZtlN8WWTzdVNcsCj8
 inW1J2OnHN7QO6N5UxpKW3AFceAIKO736ozDsUYf6gT+S0XAO3jJzO8bz M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7cya/+90k0nYnj1OsS0J/jXXn2rL19IlElmrqaJGoI0BwG0a/lhCIiZiuB+4OroC85IsYoltjq
 UCBRYJJTNC7X6r+jbeBqyjR3fhRttr71fEVXnfG771laU3YLcaxMb3DvIr7PvMoBXL4BnD+K56
 79jYLyS9UmaSWw885KYkBuOcmKK7/WRgAEUYvJezsCmgffNWgb5wsZRXPFKY39cRQqhPo64zrO
 fLycCuUVlRmZiLPUtou0h3GFw1ZwYC5ZtMEDmQxaGJYwSOZWDX8W9NX+jTmxvrWzcVkxHBIZ0t
 AKc=
X-SBRS: 2.7
X-MesageID: 16180506
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,395,1580792400"; d="scan'208";a="16180506"
Subject: Re: [PATCH 01/10] x86/mm: no-one passes a NULL domain to
 init_xen_l4_slots()
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
 <19d7ad4f-c653-b7b6-59a8-90c9700c9200@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <68542638-b5d5-3261-8088-d0cd6e2dcd74@citrix.com>
Date: Fri, 17 Apr 2020 20:46:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <19d7ad4f-c653-b7b6-59a8-90c9700c9200@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17/04/2020 15:25, Jan Beulich wrote:
> Drop the NULL checks - they've been introduced by commit 8d7b633ada
> ("x86/mm: Consolidate all Xen L4 slot writing into
> init_xen_l4_slots()") for no apparent reason.

:) I'll take this as conformation that all my sudden pagetable work in
Xen manage ended up being rather more subtle than Linux's equivalent
work for KPTI.

https://lists.xenproject.org/archives/html/xen-devel/2018-01/msg00281.html

Specifically, this was part of trying to arrange for fully per-pcpu
private mappings, and was used to construct the pagetables for the idle
vcpu which specifically don't have a perdomain mapping.

Seeing as this is still an outstanding task in the secret-free-Xen
plans, any dropping of it now will have to be undone at some point in
the future.  Is there a specific reason for the cleanup?

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -1696,7 +1696,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t

If we continue with this patch, this comment, just out of context, needs
adjusting.

~Andrew

>       * PV vcpus need a shortened directmap.  HVM and Idle vcpus get the full
>       * directmap.
>       */
> -    bool short_directmap = d && !paging_mode_external(d);
> +    bool short_directmap = !paging_mode_external(d);
>  
>      /* Slot 256: RO M2P (if applicable). */
>      l4t[l4_table_offset(RO_MPT_VIRT_START)] =
>


