Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B51B0EAD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:39:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXZr-0007M6-Rp; Mon, 20 Apr 2020 14:39:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQXZq-0007M1-IL
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:39:14 +0000
X-Inumbo-ID: b42767de-8314-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b42767de-8314-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587393554;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=S486ude860vDA8QaHxqW7zJSFV8McnAWmJdpiHJaYTI=;
 b=FZYBg2PidIJdLuc/VAPDPYe+7NujJ84xeevZjw+C46DeKhVqOhwy9s6S
 o3Lu0dr/LzZVQVR5izdTI0AWxTiZyagvPljGbbT9c4DsAnI52j6R/dp6/
 8jCMP7wruHGn18j3zUQTJVf9GJBmLl6otmzwR+Px+/b8947dLf+5VQNtT 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GCvJ214p2L2UKCmiUyX3IHFMciauSDgcEU2OJooAW5i+7MFPHm1onAT9uza/eDigefxG4/kAWS
 VS/f7hZVysZOtLBBWFJtwiiFt6jFbbhUqs+3m7PSj1uD0vD+kstyHx/l0/KFmsrfPenYPqMnrQ
 Lma9TYykOgD6VBx59vi3PY3xmnqRYtd4Xdle3Qp//+gF64zoLTvh2fbGGKF/l4ptmM/qweGrnV
 MfSGrLNAqHePpo7z5ESUkEBlv+TsGghhvVK+QxZTWLTLg+knlGAB/aFsfvc1hjTp2jk0Qpnhwn
 VKA=
X-SBRS: 2.7
X-MesageID: 15958555
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15958555"
Subject: Re: [PATCH 3/3] x86/pv: Compile out compat_gdt in !CONFIG_PV builds
To: Jan Beulich <jbeulich@suse.com>
References: <20200417155004.16806-1-andrew.cooper3@citrix.com>
 <20200417155004.16806-4-andrew.cooper3@citrix.com>
 <3c8eee8d-c2ce-d262-4056-a5d2c9f843cb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <acffe7f9-3265-e999-34ce-30891535897b@citrix.com>
Date: Mon, 20 Apr 2020 15:39:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3c8eee8d-c2ce-d262-4056-a5d2c9f843cb@suse.com>
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

On 20/04/2020 15:12, Jan Beulich wrote:
> On 17.04.2020 17:50, Andrew Cooper wrote:
>> There is no need for the Compat GDT if there are no 32bit PV guests.  This
>> saves 4k per online CPU
>>
>> Bloat-o-meter reports the following savings in Xen itself:
>>
>>   add/remove: 0/3 grow/shrink: 1/4 up/down: 7/-4612 (-4605)
>>   Function                                     old     new   delta
>>   cpu_smpboot_free                            1249    1256      +7
>>   per_cpu__compat_gdt_l1e                        8       -      -8
>>   per_cpu__compat_gdt                            8       -      -8
>>   init_idt_traps                               442     420     -22
>>   load_system_tables                           414     364     -50
>>   trap_init                                    444     280    -164
>>   cpu_smpboot_callback                        1255     991    -264
>>   boot_compat_gdt                             4096       -   -4096
>>   Total: Before=3062726, After=3058121, chg -0.15%
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> The increase in cpu_smpboot_free() appears to be a consequence of a totally
>> different layout of basic blocks.
>> ---
>>  xen/arch/x86/cpu/common.c |  5 +++--
>>  xen/arch/x86/desc.c       |  2 ++
>>  xen/arch/x86/smpboot.c    |  5 ++++-
>>  xen/arch/x86/traps.c      | 10 +++++++---
>>  4 files changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index 1b33f1ed71..7b093cb421 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -752,8 +752,9 @@ void load_system_tables(void)
>>  
>>  	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
>>  			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
>> -	_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>> -			 sizeof(*tss) - 1, SYS_DESC_tss_busy);
>> +	if ( IS_ENABLED(CONFIG_PV32) )
>> +		_set_tssldt_desc(compat_gdt + TSS_ENTRY, (unsigned long)tss,
>> +				 sizeof(*tss) - 1, SYS_DESC_tss_busy);
> Wouldn't this better be "if ( opt_pv32 )"? Also elsewhere then.

Doing it like this specifically ensures that there is never a case where
things are half configured.

I don't think it is wise to suggest that making opt_pv32 runtime
configurable might work.

~Andrew

