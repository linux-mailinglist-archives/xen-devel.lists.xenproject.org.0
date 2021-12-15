Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE32475899
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 13:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247353.426507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTA5-0003Gp-4y; Wed, 15 Dec 2021 12:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247353.426507; Wed, 15 Dec 2021 12:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTA5-0003Ej-1z; Wed, 15 Dec 2021 12:13:33 +0000
Received: by outflank-mailman (input) for mailman id 247353;
 Wed, 15 Dec 2021 12:13:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tZ4=RA=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxTA3-0003Ed-A4
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 12:13:31 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 694c1d7b-5da0-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 13:13:29 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44218)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxT9x-000za2-0t (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 15 Dec 2021 12:13:25 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 0FBE61FB86;
 Wed, 15 Dec 2021 12:13:25 +0000 (GMT)
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
X-Inumbo-ID: 694c1d7b-5da0-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <1d937a49-e0a2-58a2-b51c-495a957adb0d@srcf.net>
Date: Wed, 15 Dec 2021 12:13:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211214211600.2751-1-andrew.cooper3@citrix.com>
 <b187ef25-bbfa-1880-0a10-462c2ba64e72@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86/cpuid: Introduce dom0-cpuid command line option
In-Reply-To: <b187ef25-bbfa-1880-0a10-462c2ba64e72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/12/2021 08:34, Jan Beulich wrote:
> On 14.12.2021 22:16, Andrew Cooper wrote:
>> Specifically, this lets the user opt in to non-default for dom0.
>>
>> Split features[] out of parse_xen_cpuid(), giving it a lightly more
>> appropraite name, so it can be shared with parse_xen_cpuid().
> With the latter one I guess you mean parse_dom0_cpuid()?

I do, yes.  This is a copy/paste error.
>> Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply it
>> to dom0's policy when other tweaks are being made.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Daniel Smith <dpsmith@apertussolutions.com>
>>
>> RFC, because I think we've got a preexisting error with late hwdom here.  We
>> really should not be cobbering a late hwdom's settings (which were provided in
>> the usual way by the toolstack in dom0).
> For ITSC I think also covering late hwdom is at least acceptable. For the
> speculation controls I'm less certain (but as per the comment there they're
> temporary only anyway), and I agree the command line option here should
> strictly only apply to Dom0 (or else, as a minor aspect, the option also
> would better be named "hwdom-cpuid=").
>
>> Furthermore, the distinction gets more murky in a hyperlaunch future where
>> multiple domains may be constructed by Xen, and there is reason to expect that
>> a full toolstack-like configuration is made available for them.
> Like above, anything created via the toolstack interfaces should use the
> toolstack controls. If there was something dom0less-like on x86, domains
> created that way (without toolstack involvement) would instead want to
> have another way of controlling their CPUID settings.
>
>> One option might be to remove the special case from init_domain_cpuid_policy()
>> and instead make a call into the cpuid code from create_dom0().  It would have
>> to be placed between domain_create() and alloc_dom0_vcpu0() for dynamic sizing
>> of the FPU block to work.  Thoughts?
> As said above, I think the ITSC special case could stay. But apart from
> this I agree.

So I disagree with keeping the ITSC special case.

I do agree that a non-dom0 hwdom probably wants ITSC, but ITSC
explicitly can be controlled by the toolstack, and therefore Xen should
not be overriding the toolstack's decision.

IMO, this really does want to remain dom0-cpuid= rather than
hwdom-cpuid=.  It is specific to the domain which Xen creates as part of
bringing the system up.

In a future world with hyperlaunch/dom0less/etc, there is (or should be)
adequate provision to specify settings like this for all created
domains.  In this case, perhaps hyperlaunch declares that dom0-cpuid=
gets ignored, because we probably don't want random command line
settings impacting one N'th of the carefully curated system configuration.

(Also, any Xen constructed domains in a hyperlaunch world probably want
ITSC, but I'll again argue firmly that Xen should not be special-casing
this one feature.)
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -801,6 +801,22 @@ Controls for how dom0 is constructed on x86 systems.
>>  
>>      If using this option is necessary to fix an issue, please report a bug.
>>  
>> +### dom0-cpuid
>> +    = List of comma separated booleans
>> +
>> +    Applicability: x86
>> +
>> +This option allows for fine tuning of the facilities dom0 will use, after
>> +accounting for hardware capabilities and Xen settings as enumerated via CPUID.
>> +
>> +Options are accepted in positive and negative form, to enable or disable
>> +specific features.  All selections via this mechanism are subject to normal
>> +CPU Policy safety logic.
>> +
>> +This option is intended for developers to opt dom0 into non-default features,
>> +and is not intended for use in production circumstances.  If using this option
>> +is necessary to fix an issue, please report a bug.
> You may want to state explicitly that disables take priority over enables,
> as per the present implementation. Personally I would find it better if the
> item specified last took effect. This is, as mentioned in other contexts,
> so one can override earlier settings (e.g. in a xen.cfg file used with
> xen.efi) by simply appending to the command line.

Order of enabled/disabled I feel is an implementation detail.  Perhaps
what to put in the docs is that specifying both forms is unsupported,
but "this is for developers only" is already a fairly big hint.

The only way to make a latest-takes-priority scheme work is to use
string_param() (creating an arbitrary upper bound limit), and parsing
the list during dom0 construction.  For a developer-only option, I
really don't think the complexity is worth the effort.
>> @@ -97,6 +98,73 @@ static int __init parse_xen_cpuid(const char *s)
>>  }
>>  custom_param("cpuid", parse_xen_cpuid);
>>  
>> +static uint32_t __hwdom_initdata dom0_enable_feat[FSCAPINTS];
>> +static uint32_t __hwdom_initdata dom0_disable_feat[FSCAPINTS];
>> +
>> +static int __init parse_dom0_cpuid(const char *s)
>> +{
>> +    const char *ss;
>> +    int val, rc = 0;
>> +
>> +    do {
>> +        const struct feature_name *lhs, *rhs, *mid = NULL /* GCC... */;
>> +        const char *feat;
>> +
>> +        ss = strchr(s, ',');
>> +        if ( !ss )
>> +            ss = strchr(s, '\0');
>> +
>> +        /* Skip the 'no-' prefix for name comparisons. */
>> +        feat = s;
>> +        if ( strncmp(s, "no-", 3) == 0 )
>> +            feat += 3;
>> +
>> +        /* (Re)initalise lhs and rhs for binary search. */
>> +        lhs = feature_names;
>> +        rhs = feature_names + ARRAY_SIZE(feature_names);
>> +
>> +        while ( lhs < rhs )
>> +        {
>> +            int res;
>> +
>> +            mid = lhs + (rhs - lhs) / 2;
>> +            res = cmdline_strcmp(feat, mid->name);
>> +
>> +            if ( res < 0 )
>> +            {
>> +                rhs = mid;
>> +                continue;
>> +            }
>> +            if ( res > 0 )
>> +            {
>> +                lhs = mid + 1;
>> +                continue;
>> +            }
>> +
>> +            if ( (val = parse_boolean(mid->name, s, ss)) >= 0 )
>> +            {
>> +                __set_bit(mid->bit,
>> +                          val ? dom0_enable_feat : dom0_disable_feat);
>> +                mid = NULL;
>> +            }
>> +
>> +            break;
>> +        }
>> +
>> +        /*
>> +         * Mid being NULL means that the name and boolean were successfully
>> +         * identified.  Everything else is an error.
>> +         */
>> +        if ( mid )
>> +            rc = -EINVAL;
>> +
>> +        s = ss + 1;
>> +    } while ( *ss );
>> +
>> +    return rc;
>> +}
>> +custom_param("dom0-cpuid", parse_dom0_cpuid);
> I wonder whether it wouldn't be better (less duplication) if the bulk
> of the code was also shared with parse_xen_cpuid(). In return moving
> features[] wouldn't be needed then.

I wondered the same, but couldn't think of anything I liked.

I suppose an always_inline parse_cpuid(void (*cb)(feat, val)) wouldn't
be too bad.  We'd need 5 functions in total, but it will optimise back
to 2 with no function pointers.

~Andrew

