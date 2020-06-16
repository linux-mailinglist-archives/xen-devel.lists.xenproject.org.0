Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18791FBB35
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 18:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlEHg-0006YO-HW; Tue, 16 Jun 2020 16:18:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuXX=75=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jlEHe-0006YJ-Tj
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 16:17:58 +0000
X-Inumbo-ID: f0855772-afec-11ea-b906-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0855772-afec-11ea-b906-12813bfff9fa;
 Tue, 16 Jun 2020 16:17:57 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: G+8b9eVKa0+ND22uA0LhmNWg6NgTW1xLPm6OpByyc3zUGAm30oTMCa0JaB1aiogHOLgy7hpo53
 N6BndKAN6LXlGOxvbvnHYEWqvQlRRfeiLHvAshGYDjJM3J8MpqAN+i6TsD8tFfnADOLNjbmhK6
 sWzux4wMv4RhILO8YSD2/KDo152KnOymhPN3bdFt0FlmRIfiWtunmNnfCfVfVLnZC31XAUOa3R
 kFbNp27VaPBwPZLJLu2rJRgLPbDzVipGD7gDaEZlSjX8EL2Bzhb+mwd/enGhoQAMxk3brAvJOW
 9wk=
X-SBRS: 2.7
X-MesageID: 20199082
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20199082"
Subject: Re: [PATCH 8/9] x86/cpuid: Introduce missing feature adjustment in
 calculate_pv_def_policy()
To: Jan Beulich <jbeulich@suse.com>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <20200615141532.1927-9-andrew.cooper3@citrix.com>
 <9e27fb33-91d3-1a20-c956-24a0e0f28764@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab1e33fa-3925-48d3-3974-cfb4dadd1b86@citrix.com>
Date: Tue, 16 Jun 2020 17:17:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9e27fb33-91d3-1a20-c956-24a0e0f28764@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/06/2020 10:40, Jan Beulich wrote:
> On 15.06.2020 16:15, Andrew Cooper wrote:
>> This was an accidental asymmetry with the HVM side.
>>
>> No change in behaviour at this point.
>>
>> Fixes: 83b387382 ("x86/cpuid: Introduce and use default CPUID policies")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with a remark:
>
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -402,6 +402,8 @@ static void __init calculate_pv_def_policy(void)
>>      for ( i = 0; i < ARRAY_SIZE(pv_featureset); ++i )
>>          pv_featureset[i] &= pv_def_featuremask[i];
>>  
>> +    guest_common_feature_adjustments(pv_featureset);
>> +
>>      sanitise_featureset(pv_featureset);
>>      cpuid_featureset_to_policy(pv_featureset, p);
>>      recalculate_xstate(p);
> These four calls are common to all three callers of the function.
> Perhaps them going out of sync would be less likely if all four
> called the same helper to carry out these four steps?

I'm not sure how many of them are going to survive the transformation to
a fully libx86 based world.

I expect it not to look exactly like this.

~Andrew

