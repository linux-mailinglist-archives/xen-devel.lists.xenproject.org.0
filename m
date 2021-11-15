Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C61450637
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 15:03:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225934.390288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcZq-00070g-U2; Mon, 15 Nov 2021 14:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225934.390288; Mon, 15 Nov 2021 14:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmcZq-0006xr-Pf; Mon, 15 Nov 2021 14:03:18 +0000
Received: by outflank-mailman (input) for mailman id 225934;
 Mon, 15 Nov 2021 14:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jrjg=QC=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mmcZq-0006xj-1y
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 14:03:18 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7dbd417-461c-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 15:03:17 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:36458)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mmcZo-000JDW-oS (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 15 Nov 2021 14:03:16 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 480DB1FC18;
 Mon, 15 Nov 2021 14:03:16 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c7dbd417-461c-11ec-a9d2-d9f7a1cc8784
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20211112182818.30223-1-andrew.cooper3@citrix.com>
 <20211112182818.30223-2-andrew.cooper3@citrix.com>
 <YZIn78EzYjI7YXC4@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/3] x86/cpufreq: Clean up powernow registration
Message-ID: <97ced890-2475-14d1-0ff0-d2eafcc021a7@srcf.net>
Date: Mon, 15 Nov 2021 14:03:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YZIn78EzYjI7YXC4@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 15/11/2021 09:27, Roger Pau Monn=C3=A9 wrote:
> On Fri, Nov 12, 2021 at 06:28:16PM +0000, Andrew Cooper wrote:
>> powernow_register_driver() is currently written with a K&R type defini=
tion;
>> I'm surprised that compilers don't object to a mismatch with its decla=
ration,
>> which is written in an ANSI-C compatible way.
>>
>> Furthermore, its sole caller is cpufreq_driver_init() which is a pre-s=
mp
>> initcall.  There are no other online CPUs, and even if there were, che=
cking
>> the BSP's CPUID data $N times is pointless.  Simplify registration to =
only
>> look at the BSP.
> I guess an extra safety would be to add some check for the cpuid bit
> in the AP boot path if the cpufreq driver is enabled.

We already have a number of cases where we expect the system to be
reasonably homogeneous, microcode most notably.

Given that we don't currently check this, I don't think it is worth
changing things.
>> While at it, drop obviously unused includes.  Also rewrite the express=
ion in
>> cpufreq_driver_init() for clarity.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/acpi/cpufreq/cpufreq.c  | 20 +++++++++++++-------
>>  xen/arch/x86/acpi/cpufreq/powernow.c | 28 ++++++---------------------=
-
>>  2 files changed, 19 insertions(+), 29 deletions(-)
>>
>> diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/c=
pufreq/cpufreq.c
>> index f1f3c6923fb3..2251c87f9e42 100644
>> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
>> @@ -640,13 +640,19 @@ static int __init cpufreq_driver_init(void)
>>  {
>>      int ret =3D 0;
>> =20
>> -    if ((cpufreq_controller =3D=3D FREQCTL_xen) &&
>> -        (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL))
>> -        ret =3D cpufreq_register_driver(&acpi_cpufreq_driver);
>> -    else if ((cpufreq_controller =3D=3D FREQCTL_xen) &&
>> -        (boot_cpu_data.x86_vendor &
>> -         (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
>> -        ret =3D powernow_register_driver();
>> +    if ( cpufreq_controller =3D=3D FREQCTL_xen )
>> +    {
>> +        switch ( boot_cpu_data.x86_vendor )
>> +        {
>> +        case X86_VENDOR_INTEL:
>> +            ret =3D cpufreq_register_driver(&acpi_cpufreq_driver);
>> +            break;
>> +
>> +        case X86_VENDOR_AMD | X86_VENDOR_HYGON:
> This should be two separate case statements.
>
> With this fixed:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.=C2=A0 I'd actually already found and fixed that bug - clearly I s=
ent
out an old version of the patch.

~Andrew


