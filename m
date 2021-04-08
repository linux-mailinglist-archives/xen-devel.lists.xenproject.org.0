Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5143588E8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 17:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107426.205381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWy3-0001NC-Ad; Thu, 08 Apr 2021 15:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107426.205381; Thu, 08 Apr 2021 15:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUWy3-0001Mn-7W; Thu, 08 Apr 2021 15:53:15 +0000
Received: by outflank-mailman (input) for mailman id 107426;
 Thu, 08 Apr 2021 15:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3iLd=JF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lUWy1-0001Mi-Il
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 15:53:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea6da4e3-635a-4bca-84b8-7028da3e8a69;
 Thu, 08 Apr 2021 15:53:12 +0000 (UTC)
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
X-Inumbo-ID: ea6da4e3-635a-4bca-84b8-7028da3e8a69
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617897191;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4AVvUw3P9tx0CsXiOj0V7wg72fSLg9LydjAHKVtc7uc=;
  b=IH2Xiosth++D6pbP0c8Mp4VH0zDLvvQT8845A9w+ZeiNvXhBZ0dEiLhi
   FvW/J0QkKL4TF6FZ1RaiJ0Huw7jMiveVrZq2ZHvUJX7Cn3Z6cKcZ0Ui3p
   XxtaLZwQ/NSLwnZuDGo45PSIIEVGcPDy6rPKMLYJaZYHx7ouhAVZQVp9k
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SRe07+MtLgJcvxu5IuTCZ/S6BeF7zteNFUxrEN3nkVSE0SUnGRyVBe/9JNgBNxbinw2k///+bA
 rjEb10dWH9rDaHLZ3pmE2XCI5KC1iNGwaVhNFEocBEhqOY+IliCMzSmLl9JeLwS/s8zFKq0qsG
 1sbcCqQWR8gxnKJYNWpPRBr6j6KDysqC5d5s4udLDiEIzjbX7X2fs34KTOi4h3WGNwdc4jGHsK
 hqXu2vI+dC3pW8v1yzE77NxWa3osT3uMCKK2WaA7sheT5FaGTuzVJXZvBjvFRqFRgL1Rne25zW
 M2U=
X-SBRS: 5.2
X-MesageID: 41320741
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:H9xnsa/6xF9K8qi+3hJuk+ECdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnb8oN45pRUAKe6UGDdyQ6VBaxBza+n+T3vHCXi6vVQvJ
 0LT4FSAMD9ZGIUse/U+w+9euxP/PCi0ISFwdjT1G1sSwYCUdAD0y5cBhyAGkN7AClqbKBYKL
 Om6sBKpyWtdB0sB6zWOlA/U/XevNqOrZr6YHc9bCIP0hWEjj+j9dfBYnul9yoZOgkv/Z4StV
 Lrvia8zaWlvvG9xHbnphXuxqUTovTN4J9uAMSNj+IcNznjjB25Db4RJoGqjXQOj8yErHosjd
 nQszcsVv4Dl0/5TyWOjjbGnynmzTo05HfpxTaj8ATeiP28fh0WIY5lp+tiA3/kwntlhv5Q+u
 Z3+ljckJxtARbJjE3GlqD1fiAvrGWYiz4fi+IJ5kYvNrc2WftqgqE02lhaK5sEFDKS0vFdLM
 BeSPvR4/tbajqhHhbkl1gqxNStW0I6FQudTn4DvdSI0yNXkGoR9Tpg+PAi
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41320741"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flg/6oLmIRx1go6ZkbihDtFibqDgH6HOCPwtRkCrNwYCD+rv4YrrUwcjy85MnRwpUdD/+ss24lJ/8H7F67VIPP9sbZvgHKMTVo87PxwtW7ys3bGhFRCYj3qs1RsVsX4dXlj3oaQWlLUpVyYH8vsLxz8/wMorlic75BDHU1q43BYpvsW2fL7SkpH3y498wwBqWo1nQHepJcZu7E5nWmLQkHC52fnB2yk0ae5I5rs6kHnjgn6XYS0B+8GR8unFu77LLgHo5c4QUF3Is2m7ogdnNCQ3jENQ2c99+Zcil/bbV9v31s2ByA00GzVJwcABEzhUmHcST6jq+IT5Jai7HbFzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mHiU/9g+uKx083BG3uqnISBZrvhcoCpPsdv1/QY3bk=;
 b=F2erjNj6SEWEL2HUNA2ICDGAlkHWs6pUcO3dFJRHKZ1SmRNs+DyBJRxqaWQMNjqxFbaQ3Wta6zfabhZWDwT9g92X+UXq2RtKh0YRPy09wqKKfrcs6jFBz4yt8cUlItI4AAHvWLIqbS8HFDXk9cZ2RKOST0ao30XIopqa8drxs2et93al+zpuodDWakpC9gJYKyNvduRVvZA4tzRKJH/wuHMoTmcnZoym9LVXwWC1sm4f0CqkoRZ6gKDGC9jI7WCf38FXJ/vdcGWfXtz/HkbJQt+FjxMcOobyQeRGChGnP34VXucgT3k0j8BOZI3RPcMfxxbF70UvIencBlCnYaTjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5mHiU/9g+uKx083BG3uqnISBZrvhcoCpPsdv1/QY3bk=;
 b=qchTCG+ZZ/1c1uTTbzEzNDZaZQtiD+Q1evO/rzgqbidfDf1X5zGQtvVpWFVKn2rBiCWuGISEyOtfW59zAMlRyKjrMce3Sz1m8fI6lAFUhA+BUVlKEBkjrl2GCGvxz8+ZOC8cZRYSisaxW0kWuvVLoFjOky45LDy0KQ/urbgAqWY=
Date: Thu, 8 Apr 2021 17:53:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH 09/21] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Message-ID: <YG8m4LbLyDXKumAA@Air-de-Roger>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-10-roger.pau@citrix.com>
 <bb7b8cd2-97ae-09d9-61c8-1f84616256f5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bb7b8cd2-97ae-09d9-61c8-1f84616256f5@citrix.com>
X-ClientProxiedBy: MR1P264CA0024.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75b5c113-c720-4a08-5005-08d8faa66829
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB609642D15E974CAF6D4276958F749@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: THpC7owhZx8t721/YiWe4AlbIb1LIIIspshc9ZVhBiFlURsYN9v43g+Ba7Je4F4yAwe+Cktx8czaDmdR0ki+NC3hWOPRLGGMKBlGclifklUGoIQfBcufUBI5zFGGT0zuraFboVrCIwh7NOdXjlSrGGItlpQqqfmlMdTt/ktKyXUzpxXeJQ3AfPxojaEi/cwoIEu86k3qqNuToSS//9JDaveATyGkoEroNOUM8EzL1f9wB4R45edVENcfcuhEEcNprmp+hJYPkyl6XUd7iV85MrB8lfUjMkqKQTYxEji6dIIfj84E5AEm8b31dM609oE2RGz8Uu9QiUxaAVZt0F4gQYgaxnQQuQrYXn2bX9tTiJqeSmO9dN0wjtPXJg07TWopQZTeeTYzorWKrvDfB/JEehh/iY92+ZjLuTgoQE06mwtVX9DK4/caP5AEIz3pLQ3o53TTZXIiduG4LtF5ovyaxqo2r0UMkSQKwnSh2U1Wb8XfF7/d6jYdXE9xCESV3+JlJApxfDxqNSMUlceALnK7HLXg+fCjD4ru1O15HrOMN6q5kTaPZMze8nmSPeRmnxG0TYzKokMKEOMdubYi/deuac51DOV6OicQSRa9vRBZLt1EBsl4dxEwRUQlpEIIHIebLGvoMsNwTX9S7/Cdd7jD4cENY7hLvrbziyHcHAuzSow=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(376002)(39860400002)(346002)(136003)(366004)(53546011)(86362001)(8676002)(66476007)(6496006)(8936002)(66946007)(66556008)(478600001)(956004)(6486002)(6666004)(9686003)(186003)(16526019)(85182001)(2906002)(6636002)(5660300002)(38100700001)(83380400001)(4326008)(33716001)(6862004)(54906003)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkRZblFMR1FoOUJKaldhdG9mOG8vaTdaMWw2aG1veFkzakVQQTd6ODU0dVZn?=
 =?utf-8?B?dFE2a0xyaExGNjRIOEt6Q1d0SjJWYzdVdktLOGcrMnVnVlhRZ1g3YkgveSt2?=
 =?utf-8?B?anA1Tis1cHJRRVBkM3RPYXNEQzNNdWd4OWJQNDB6NlNPbWkyQ1QvNENEd2VW?=
 =?utf-8?B?UTAySGVzTVJ6N3VEeG5YWERFc1hoV21jaGRadU1PN2ZzeU9HU1Mva3o3cWFL?=
 =?utf-8?B?Z0wxZlFlTndFTWNiVXhTclIyN0I3cEpUcmFXNEptUWxJVzU2d0pMWWV0S0Zq?=
 =?utf-8?B?a2FreVNGTHNpT3lqSlM4Sm1XK3p4MytaVTZpN0xVSi9tcmQ5ZG13a0Q1WUtU?=
 =?utf-8?B?b3ZUY1ZDZnNxS0RnVi9xSW50ZEVDRWlWckhTYmxoZUIrN3pvcUcvNVZZZnlq?=
 =?utf-8?B?d1k4VEszYzQwTjhFVFA1VHJ2OUxPSWlBSG5PdnlwM29sRWorRkUxMmdMRlZY?=
 =?utf-8?B?am1lZVhhVnlxdHVnbXU5cmFCMElIUk40ek9aRzdacUU1ZEcwQW00NGJzVFR3?=
 =?utf-8?B?VWVlQ1dqSVVRdERCZHJjbk92RWtmMkVOK2xWNXAvcUQ2dGVrR3QzZ2N4VUVm?=
 =?utf-8?B?UUQ1dWYwc0YrTVgyS3hERS9kM2RLZ3diTTROTzNSeVlOYjZxZVFTNVhaSGMr?=
 =?utf-8?B?dDdBWU9JcGRGUjVkemJ1MjZiSWgxeEI1OUhpNERhSEdwbWtOVVREYWFVSXhX?=
 =?utf-8?B?WHlHc0kvUnNibFdjN2RhUmxLYll4YmswQnFXc1p0SWFwMXo5U2tEQXNlTVVn?=
 =?utf-8?B?RTNXSEFRaEdDWFlFWXhvNHA4SzZ5Z0F1Q2hMdTEvZ0Myd0RqMlV0UC9sNnlW?=
 =?utf-8?B?RFYrQnV5TUxIMXZ0akRSQnBYY1NEeHV0c2pTSFQ5NmlnQ1g2bzlsZGYxUWlz?=
 =?utf-8?B?bzArWjFNRFNlcWpLWFRheUlnMzd6ZHQrWE5wYTFnNnFJUXhOa28vaFNPWjQ0?=
 =?utf-8?B?OHlpYWhNRkFLQmZ1RjF0WTBCSklSblhYbHMzdEt6WFRDYWNHUGRlL2lFRTl4?=
 =?utf-8?B?dHRFZ3FmYW1RYjBGbVdrZ0VhbDUyRlJHeDJTcGZITnhsN0IzRCs0Nk5GUTdN?=
 =?utf-8?B?NGFMSHdMcXVDcktpTitJUkhxNjNnSlZqOTk3bFFIcHVoaXQxTHhqZ1RZaTlU?=
 =?utf-8?B?T3lFcitwRTJQVlZkdGEzUDRvZEwyRnViT2ZpVkVnd1orYVZEaWFHSmxETkE3?=
 =?utf-8?B?bGdhbUZQdE9aYUtKVjl0aFlLUUwydGhaTjJDc0ZNVy9UZTg0clJjWGNIem1i?=
 =?utf-8?B?NHcrNXV4bTFzYUdjYXc5QVBYM01TMTBGZi9xcW1FV2ZleEZMNUdQM2tEa2xV?=
 =?utf-8?B?U3NBU1BTNVVVb1NCOS9WeHR6d0hmd0F6Q1RsSXNPMTN3YS9iMm9MSzBBSFRX?=
 =?utf-8?B?MExrMFFDMVNrMHhUQ2FKMk5sVS9lVkcveFI4YVNCQkJjL2lnUkU1MmhKTXF4?=
 =?utf-8?B?U3RlRHFJL2hJT2UxaDN5aEZIU3dtS2I1SjN4RU5iTXhXKzB3MVNEVEN0dzRC?=
 =?utf-8?B?bUovR0pSWnIvNHhjSWVuc2lYY1IwMFJkRzNpMzhZZ3ZpQ3k5RGdaR0l0WS85?=
 =?utf-8?B?c0hBaUYwZEk3d3JJeENDelBUVGR5b0FJWEJ3dUs0bFEwaUMyTU5PaE1ORGJ2?=
 =?utf-8?B?K2dlR05EdzVJM1pIck45VVp3eUZDQ1BaS0I3OFZjK2Z5SHNNNWFhL2NrcTAz?=
 =?utf-8?B?ZUpnTzBXVityTWVjY1hwd3UwZWtnOW5HazY4Q1BSNEwvdExCYmduVGlXcW94?=
 =?utf-8?Q?z+LUPB+jYf8DRcawq591gIcY6hw9UnsbGg+q6Tk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b5c113-c720-4a08-5005-08d8faa66829
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:53:09.3566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixdwvLxjopATS0WQVQv//Bfpo3GB6xyNaVNM+0P3tuKkB0diOKCztRvRo1dCOylF+3Sz37yTR1okrxrWJ/jKDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 03:47:20PM +0100, Andrew Cooper wrote:
> On 23/03/2021 09:58, Roger Pau Monne wrote:
> > diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
> > index 48351f1c4c6..a1e1bf10d5c 100644
> > --- a/tools/libs/guest/xg_cpuid_x86.c
> > +++ b/tools/libs/guest/xg_cpuid_x86.c
> > @@ -883,3 +883,45 @@ int xc_cpu_policy_serialise(xc_interface *xch, const xc_cpu_policy_t p,
> >      errno = 0;
> >      return 0;
> >  }
> > +
> > +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
> > +                            uint32_t leaf, uint32_t subleaf,
> > +                            xen_cpuid_leaf_t *out)
> > +{
> > +    unsigned int nr_leaves, nr_msrs, i;
> > +    xen_cpuid_leaf_t *leaves;
> > +    int rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
> > +
> > +    if ( rc )
> > +    {
> > +        PERROR("Failed to obtain policy info size");
> > +        return -1;
> > +    }
> > +
> > +    leaves = calloc(nr_leaves, sizeof(*leaves));
> > +    if ( !leaves )
> > +    {
> > +        PERROR("Failed to allocate resources");
> > +        errno = ENOMEM;
> > +        return -1;
> > +    }
> > +
> > +    rc = xc_cpu_policy_serialise(xch, policy, leaves, &nr_leaves, NULL, 0);
> > +    if ( rc )
> > +        goto out;
> > +
> > +    for ( i = 0; i < nr_leaves; i++ )
> > +        if ( leaves[i].leaf == leaf && leaves[i].subleaf == subleaf )
> > +        {
> > +            *out = leaves[i];
> > +            goto out;
> > +        }
> 
> Please adapt find_leaf(), probably by dropping xc_xend_cpuid and passing
> in leaf/subleaf parameters.
> 
> Serialised leaves are sorted and there are plenty of them, so a log
> search is better.
> 
> How frequent is this call going to be for the same policy?  With the
> arrays embedded in a policy, they're still around, and serialise is an
> expensive operation.
> 
> I wonder if it makes sense to try and keep both forms in sync, so we can
> avoid redundant calls like this?

I think we would then need to call xc_cpu_policy_serialise whenever we
update the CPUID policy in order to re-generate the full serialized
version, as I expect changes to a specific leaf can affect others
leaves, and thus the helpers should not try to update the serialized
version manually.

Hence I'm not sure it's worth to try to keep both versions in sync, as
it seems easier to load the policy, modify the policy object and then
serialize back only when needed to upload to Xen or to export.

Thanks, Roger.

