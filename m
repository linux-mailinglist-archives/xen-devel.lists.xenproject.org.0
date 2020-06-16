Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865751FBBA8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:27:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEQK-0007Sd-IY; Tue, 16 Jun 2020 16:26:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlEQI-0007SY-Ez
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:26:54 +0000
X-Inumbo-ID: 3019b562-afee-11ea-b7bb-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3019b562-afee-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 16:26:53 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jFRHlA2SqXJTd1GAldKrz5PtrKSPhCaMf1yu+89Kqb4P3k9+/P/brE/QqcIkSM8CrHdOh5Ov3r
 lM8K4lC/Xy+E5AMPxQTsvIRS1z9Ah7EQ54yB3OIt2NUjtT5zNEG3tSDPTX3FlVppWOvVF1d3t7
 ZQbHMSCrMzMVqTS65oJBO5Wx/3ZS2V+EkPQMOYyrQI2Vs9PL4isneHm9C5O0RwmulotXSHpEVL
 tRV62YjPbB98ys6BC80m2n8gN9Wti+M+WvFVAiNzixAmFZ6L1Ej4Bm1oA0QAq43+/E0UqwGLU9
 G8k=
X-SBRS: 2.7
X-MesageID: 20965500
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20965500"
Subject: Re: [PATCH 9/9] x86/spec-ctrl: Hide RDRAND by default on IvyBridge
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-10-andrew.cooper3@citrix.com>
 <a0733b2c-da6b-e5bc-3041-de30002bcb47@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <00db98fd-d268-71ae-fad1-fb59d2f1eba1@citrix.com>
Date: Tue, 16 Jun 2020 17:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a0733b2c-da6b-e5bc-3041-de30002bcb47@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Paul Durrant <paul@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 11:00, Jan Beulich wrote:
> On 15.06.2020 16:15, Andrew Cooper wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -512,11 +512,21 @@ The Speculation Control hardware features `srbds-ctrl`, `md-clear`, `ibrsb`,
>>  `stibp`, `ibpb`, `l1d-flush` and `ssbd` are used by default if available and
>>  applicable.  They can all be ignored.
>>  
>> -`rdrand` and `rdseed` can be ignored, as a mitigation to XSA-320 /
>> -CVE-2020-0543.  The RDRAND feature is disabled by default on certain AMD
>> -systems, due to possible malfunctions after ACPI S3 suspend/resume.  `rdrand`
>> -may be used in its positive form to override Xen's default behaviour on these
>> -systems, and make the feature fully usable.
>> +`rdrand` and `rdseed` have multiple interactions.
>> +
>> +*   For Special Register Buffer Data Sampling (SRBDS, XSA-320, CVE-2020-0543),
>> +    RDRAND and RDSEED can be ignored.
>> +
>> +    Due to the absence microcode to address SRBDS on IvyBridge hardware, the
> Nit: "... absence of microcode ..."

Fixed.

>
>> +    RDRAND feature is hidden by default for guests, unless `rdrand` is used in
>> +    its positive form.  Irrespective of the default setting here, VMs can use
>> +    RDRAND if explicitly enabled in guest config file, and VMs already using
>> +    RDRAND can migrate in.
> I'm somewhat confused by the use of "default setting" here, when at the same
> time you talk about our default behavior for guests. Aiui the two "default"
> mean different things, so I'd suggest dropping that latter "default".

Ok, done.

>
> This raises a question though: Is disabling RDRAND just for guests good
> enough? I.e. what about Xen's own uses of RDRAND? There may not be any
> problematic ones right now, but wouldn't there be a latent issue no-one is
> going to notice?

I was sorely tempted to delete all of Xen's use of RDRAND, seeing as its
not even safe to the AMD issue.

What we don't have is a "no-xen" concept for CPUID features, so I can't
stop Xen using it without hiding it from all guests, which in turn would
render the point of this series useless, and reintroduce the migration
problems we're trying to code around.

I was planning to leave the Xen uses as-are for now.

>
>> --- a/tools/libxc/xc_cpuid_x86.c
>> +++ b/tools/libxc/xc_cpuid_x86.c
>> @@ -503,6 +503,9 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>       */
>>      if ( restore )
>>      {
>> +        if ( test_bit(X86_FEATURE_RDRAND, host_featureset) && !p->basic.rdrand )
>> +            p->basic.rdrand = true;
> Same question as before: Why do you derive from the host feature set rather
> than the domain type's maximum one?

Answer the same as previous.

Although I do see now that this should be simplified to:

    p->basic.rdrand = test_bit(X86_FEATURE_RDRAND, host_featureset);

which I've done.

>
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -340,6 +340,25 @@ static void __init calculate_host_policy(void)
>>      }
>>  }
>>  
>> +static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>> +{
>> +    /*
>> +     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
>> +     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
>> +     * compensate.
>> +     *
>> +     * Mitigate by hiding RDRAND from guests by default, unless explicitly
>> +     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
>> +     * default setting, guests can use RDRAND if explicitly enabled
>> +     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
>> +     * previously using RDRAND can migrate in.
>> +     */
>> +    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
>> +         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
> This is the first time (description plus patch so far) that the issue
> gets mentioned to be for and the workaround restricted to client parts
> only. If so, I think at least the doc should say so too.

I've updated the command line doc, and patch subject.

~Andrew

