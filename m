Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F461B12AE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 19:09:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQZua-0004Sw-Tj; Mon, 20 Apr 2020 17:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQZuZ-0004Sr-9w
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 17:08:47 +0000
X-Inumbo-ID: 9805e07a-8329-11ea-9081-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9805e07a-8329-11ea-9081-12813bfff9fa;
 Mon, 20 Apr 2020 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587402526;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=GNY2F0NFC6sGM7lIxG+sAWuDe6O9jnHgOvJP/u9aHAI=;
 b=O6+BPkjzvbAXssvnrM1SkjZJNzJIgf80DH6FB1TGHEtfoAqyM5B+MHdz
 eZ5PlS6N3QyUOw555Ov6rK5dIr9i5cpRZZNTiZFzGVE3y9W3hCyoizy1j
 0kDbRzqqgg+shruLX0ZLPFpWDUciKCm4acdSgigHqbOd+WbwdviHAqnz3 o=;
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
IronPort-SDR: xsVnqzQmV5FI2h8OaFQVY2KG5TX0yoT9zqvfaGsdjfz3y6b06pUKSXmHK2VRU+jF8YaBphzUhW
 Vs5wTp3srl0B+wz/shhIJejLrMyJF25zDcNsPq0Mkna7gjSOqwKh+UgXm3ayN1+/Khdtbt0N4s
 W9uAOQ6wGA21vASDZCcexUIGsytO5bA/YQOBSzB3OZmK2DWo9dewTkBv0jxTrYYJrPSgcuMd/H
 wKXZELNQzrOV0V5VLH0P6r04HhB0OHglL4xLMSkdCb8InJbQwmUqttWXDBnke0Xw/wv9atEB9P
 Ad4=
X-SBRS: 2.7
X-MesageID: 16269190
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="16269190"
Subject: Re: [PATCH 3/3] x86/pv: Compile out compat_gdt in !CONFIG_PV builds
To: Jan Beulich <jbeulich@suse.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-4-andrew.cooper3@citrix.com>
 <3c8eee8d-c2ce-d262-4056-a5d2c9f843cb@suse.com>
 <acffe7f9-3265-e999-34ce-30891535897b@citrix.com>
 <cb6fcbd0-1b0a-d105-30ce-e0a6215f4904@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e5a208df-94f0-56e7-e801-06fb0933f02e@citrix.com>
Date: Mon, 20 Apr 2020 18:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cb6fcbd0-1b0a-d105-30ce-e0a6215f4904@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 16:47, Jan Beulich wrote:
> On 20.04.2020 16:39, Andrew Cooper wrote:
>> On 20/04/2020 15:12, Jan Beulich wrote:
>>> On 17.04.2020 17:50, Andrew Cooper wrote:
>>>> There is no need for the Compat GDT if there are no 32bit PV guests.  This
>>>> saves 4k per online CPU
>>>>
>>>> Bloat-o-meter reports the following savings in Xen itself:
>>>>
>>>>   add/remove: 0/3 grow/shrink: 1/4 up/down: 7/-4612 (-4605)
>>>>   Function                                     old     new   delta
>>>>   cpu_smpboot_free                            1249    1256      +7
>>>>   per_cpu__compat_gdt_l1e                        8       -      -8
>>>>   per_cpu__compat_gdt                            8       -      -8
>>>>   init_idt_traps                               442     420     -22
>>>>   load_system_tables                           414     364     -50
>>>>   trap_init                                    444     280    -164
>>>>   cpu_smpboot_callback                        1255     991    -264
>>>>   boot_compat_gdt                             4096       -   -4096
>>>>   Total: Before=3062726, After=3058121, chg -0.15%
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Wei Liu <wl@xen.org>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> The increase in cpu_smpboot_free() appears to be a consequence of a totally
>>>> different layout of basic blocks.
>>>> ---
>>>>  xen/arch/x86/cpu/common.c |  5 +++--
>>>>  xen/arch/x86/desc.c       |  2 ++
>>>>  xen/arch/x86/smpboot.c    |  5 ++++-
>>>>  xen/arch/x86/traps.c      | 10 +++++++---
>>>>  4 files changed, 16 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>>> index 1b33f1ed71..7b093cb421 100644
>>>> --- a/xen/arch/x86/cpu/common.c
>>>> +++ b/xen/arch/x86/cpu/common.c
>>>> @@ -752,8 +752,9 @@ void load_system_tables(void)
>>>>  
>>>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>>>> -	_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>>>> -			 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>>>> +	if ( IS_ENABLED(CONFIG_PV32) )
>>>> +		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>>>> +				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>>> Wouldn't this better be "if ( opt_pv32 )"? Also elsewhere then.
>> Doing it like this specifically ensures that there is never a case where
>> things are half configured.
> But this way you set up something in the GDT that's never going
> to be used when "pv=no-32". Why leave a TSS accessible that we
> don't need?

Defence in depth.

Having it only partially set up is more likely to fail in a security
relevant way, than having it fully set up.

This particular example is poor.  There is no need to have the TSS in
either GDT after the `ltr` instruction at boot for 64bit, because we
don't task switch, but ISTR you requesting that this stayed as-was for
consistency.  (For 32bit Xen, it was strictly necessary for the #DF task
switch to work.)

However, the other logic, particularly the cached l1e pointing at the
percpu compat_gdt is more liable to go wrong in interesting ways.

~Andrew

