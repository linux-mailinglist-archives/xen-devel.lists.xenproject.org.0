Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0667AFB0F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 08:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608669.947299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO0m-00081I-BE; Wed, 27 Sep 2023 06:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608669.947299; Wed, 27 Sep 2023 06:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlO0m-0007zc-8U; Wed, 27 Sep 2023 06:27:04 +0000
Received: by outflank-mailman (input) for mailman id 608669;
 Wed, 27 Sep 2023 06:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlO0l-0007zW-0Z
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 06:27:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda91c67-5cfe-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 08:27:00 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAWPR04MB10032.eurprd04.prod.outlook.com (2603:10a6:102:38d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 06:26:31 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 06:26:30 +0000
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
X-Inumbo-ID: dda91c67-5cfe-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUb9GbHx1sarjI/1yaiNSrPR6i+L34vRB0gTQBdXAJmbT3jc4SeFSjcBtViMsoHUu+3WJtTIenXAG8uxmfIhiF0TfcuVnoQ9Rkv+3/HlDWFfSprYjrkwnXU7XE5IYFKb435FFC28sPH3lLZdjPSo8pdUHUt5Dp8FGyh1tmRfKyUemg4do5CLmzkSaknrgegfQIe/XNo5zsLuIfUbstr/T8//l5P0A/NHE4fuIG5vhQDCI1EIYB8GaG13MtNnKfH5PDnvDd6T5GJblpRg6ymA2KoxogEjUaBpKtVKg3L5PrTewHk/RhZc7JjrUNPtaC1lqbCDbx7ep3F42KxmcP1Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DApTZA/MHF903HYZK8jWLnadYC9Z4R+vG6Xs8rVACOI=;
 b=ERbvcXiB/Py6nH852Ml79sgpTzKCfZXgavyqFiMYs3IKrPecMFXsTw2DbhE9DlStyIeMF1uchUXdgegCBNvgybOM1ZwcseG6QYQgbOuiiZjY02lLH189QJFfSI/eyHuA3Q5JWWzG5DYfLB+SB1ZbCZVNSQ0EeYicm0Cx600i7SFqyCo+4Dycd8Z1i/LbcnWmBywQi0liITRDkRrZh33iUdrAGufC7Slc5QYAHRwFs/6/r27gNTovQEPItAaH1DpfFw2HDqRHDQYesKLNRpOhk258TJmULcFbKeTVEBdZcGM/zP9OCgtsDzfC6YoAwjcPosKcxVb1eblpGUO8oJVrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DApTZA/MHF903HYZK8jWLnadYC9Z4R+vG6Xs8rVACOI=;
 b=W1U5sduDeVP2u5X2Mt8tG4Y7rvWbL2MlgCAt7iqn2BvwP/2csZy9hy4Fy4sQqzIYXHBjbK2DmQgoW1ZhqIJ1BMF50JIQ1bZaxGztmUzmYFlaxufyT/OzCFazD/nSx1tQ+oaIEn1IX803R6FPrG4z1ICaR7u2RMYM0ahDjE4FVxcw9bJTnLXGgAyMKWQ3agCyfbrOKg+HtZOcBfpn6sL7u2gwQu4rDuHACKleFTHsFmnsMPOUYMcU/7xk5duqzOuCYWrR+OdXFsEaB2X95PVI2s7vYao+6APigXGCOcvFjjIvlEOPAKN8fNM08eInSxK7eipFJHap3jFncsj/pPO1pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <27507e44-79a7-7ccb-091e-6356531274e1@suse.com>
Date: Wed, 27 Sep 2023 08:26:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/3] automation: Drop ppc64le-*randconfig jobs
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <76d21ac8a0de7d5ebac8b39a8d552b931a6302a3.1695681330.git.sanastasio@raptorengineering.com>
 <6856be3e-1f06-6c5a-5d0b-7ca72200d456@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6856be3e-1f06-6c5a-5d0b-7ca72200d456@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAWPR04MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2f918d-6ef9-40ac-7e3b-08dbbf22afeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	79jT8S/FFo+XE/V8QrbSDhlvFc8OTI6dsKrOScEaD1JoNPGMHKXk5MBXphO6mkC02kWPMhLvIAIdBs7nlws57ocsvVNao2FEBLnJtONKcURaFz9R4Qb28nlNnGJ4rNBDDPHEpjV+AZk5MOPnMRYaTX2yNk9KTGwkDhd4+xmWbGJUe2SBv6qiagbZUucEwqzgiZyeKna1qmrlJGc0c3VSFJJnUrz7smaa9V4Wq725bZlcNc7tYbO548CVnx6rIBbuIvBAwBB9/GVpUkCdzT4a74btGsA43XS0jmlMzhilf+9J5W/pfqrz0s5yaqjYCmMldI7nqCNuelIStXAHMISS5jd9+BltqzwI0GIyatenbH/foMu2ray291SVBmNq8k+IkN/I3OCzEvStNiNEF2YA1cvHjD+lxODky8qvGZjQOnyXrVeIpMghDbbUIpwOd0zi1+1pkDUSn+P7kdYDl4cMcdhDSSKZ1wB1ins79hAUbIoCVPG+5Nm38kgamJP2jrpKqXejzI1nEuG/8P+WdFBTw7XUq/QU/leQkSLKWp74nMk4KggojKQZ5u3dc6BQTh8vfsMiSb2LhrVL82X3mYVWpbJAgEDoW2qEvgSD9TmNskInKU8j4HGdm4A9byNJZP8jjbsJ01BPegwsfyQibzhRLw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(2906002)(6486002)(6506007)(2616005)(6512007)(38100700002)(53546011)(54906003)(31696002)(86362001)(66946007)(478600001)(83380400001)(66476007)(26005)(6916009)(5660300002)(36756003)(66556008)(316002)(41300700001)(8936002)(8676002)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3EwVDJvdWN1NHRWblpJcllOYWlIVnN0ekNPWktnN0pvbi84d2JSUEJybTg3?=
 =?utf-8?B?UGJaQ0tOZnJoS1lWMVpKVGNyUHNWeWZEK2JsbmwyYjlmYlZ1MGphbkJYcFVF?=
 =?utf-8?B?TWFCdkJaS0RyZTNrR2hvUXd0dDc3a2NWUkpqS3FyQjhhd1RaNGROdjMxME10?=
 =?utf-8?B?L2loeE1LZnJFelNqaThEL2JscjNscGpRUGZqZkJjckJnMTNBTjFlUnlLWWhy?=
 =?utf-8?B?L1Q3NmJBSk1ZRmdEL2tLQnNiV01iemhZOFJLWUhJMjRkU3VwSTJhRXdYeWR1?=
 =?utf-8?B?VXRIVnZvdHZRTFZkbXBuQWxSano4UERzR1VTR2FFaWVJWlRjeDYvd1lMVlFR?=
 =?utf-8?B?R1pTRWtkcEp2ZmZhUkY2SU9aR0EvUVloM0FKRWZTbmNad2wrZmNYRG1pZFZ3?=
 =?utf-8?B?bTAvZTA3elpXZlU4NDVTODBzZHJRWHRlNVVwVjIwa3ppOUxyYlZDTnUzM3lp?=
 =?utf-8?B?cTB3M2JzeWZlT29JWE1JVFdzamdxemF2WkpvYnhJbWh1U0lINkxwelI5RXI4?=
 =?utf-8?B?VHNSek1JZjRNMUkvL0F0UU1zcExvTDRMcGd0bmRYWWZJT2E3YnhGZ3lNOXJY?=
 =?utf-8?B?bitMeGZwR204NmgyM1oyRDdkUFVpUjlrb242RjRHQVdhaEN6dTB3b1dZN2s2?=
 =?utf-8?B?NDRUc1lqOGhjcmRibkVtVlM0YlBzdDJTbGdTYlU5OUVNbzlGdEV4bjVUOFln?=
 =?utf-8?B?U2h0bTFqZ1A4V2FLbG1pOXpwdm9OVGdPRDR4aVRoODRNemo4SS9zL0lIV2lk?=
 =?utf-8?B?QUtUcytDa0o0c1RRZ2c1TjJTRUZoR2ZCSUlwREVKUlNEWnRXNDM0TGI1S0dx?=
 =?utf-8?B?YjBQcXZHejVwcjJyUG13SjhaYXFENEhIQjJaWHY3MXA5ZDF1akthYVE2S0Rv?=
 =?utf-8?B?UkUvdjdnMHh1Umc2NWtQaUdhRWc2SCtlQlJJYUJ6ZERYb3l5S0l0OS9iSGpY?=
 =?utf-8?B?cVdYTW1Cc3c1aVcxOVZOc0EzcWNPS2thdlZTeU01MW8yQXdlZjdGOXFPWlBV?=
 =?utf-8?B?cEtXbnBaY2Z0aUJmcFk0ZHZJZXE2YWhuNmZ2aThZTjFkUDZxcEJHbHRreWF6?=
 =?utf-8?B?OUMwWmF0aDZwTTVWSFRrcnlPYjhoTnFOQXRjUTY5U3pFS3J5RVdQYjJVb1JY?=
 =?utf-8?B?MUNhZFRFTlJnektwK254ZVBwZ0F5bzJ4cVJ1MUE1N3VOV0FoN1RvWXd5SkdQ?=
 =?utf-8?B?Q1VoWWJoQmswL3I5bHp6dlN2dUNOakRoelV0UENMRERWZmFhVHIzOVd0UmtZ?=
 =?utf-8?B?THpxaUpZUnUzWUtTcnVtbEhlOHVkNnloZVF6aE1ZMFdrUkFRaTFDZGlPZWtj?=
 =?utf-8?B?T0RRam8wd2hPbW5tY21WU01WQXY1ZGl5ZU51UjJXN0Q4NlhXemZ4WmNlRXNv?=
 =?utf-8?B?R0kzby9uaXV6ZVl6aW5zM3oyVGlYVlc2VDc1QkticCtXNHp1eGt0WU5vNG1o?=
 =?utf-8?B?Z2E3d3ZyK05MdU9uRW9aM0Q1dVhPSGxCQ0hCSTVKYjB5MWQyUVgwdUJnNXVD?=
 =?utf-8?B?RGpldzBuTmY5bHR4Y1Awb2JERStHWGhnbzBtYTNxcHJNcTJDRUtPbkx1WU91?=
 =?utf-8?B?b3crbXc1dDBVdW5DQkh1MEhXZHV2dnA2MU9lNHdzZ1IvcUtReStyU3R2dTJJ?=
 =?utf-8?B?N2ZlV1J1d0U4WmxJbWw0clNIWlBDR3lQak9RODN5cWpXclBWS3ZSdit5QWVu?=
 =?utf-8?B?ekZpRHIzYTJ2TEs4RW9EVHo0dFdwU3hyVEdUTjdWQXFINzdnVUw1WnA0Ynp0?=
 =?utf-8?B?ZGN4MVAvWE5OSEMxeGVZV0Q3K0dFTFNqajk5a0I2b09DVUQvZTZjOER6aUZN?=
 =?utf-8?B?Tnp1eXMzaUtHeHN0QkE2MllZbGdrMi9IR1BKQTQrcHluN0FPa0p1Zm83MTFM?=
 =?utf-8?B?Njg0bjJZQkdEZ3I1akJ4KzhWS0FkMjlCK3lNRklTN3NPNXU2NTlIa1hkOFFr?=
 =?utf-8?B?T1VMMWNYMnB2VkJTZHhCeWJqSCtWOHh1RFBVcUR1UklCK2ZOVVFKN1JXNkNW?=
 =?utf-8?B?T0pWeWpjQTEvQ21PUk9vUDNkRjRYMW1nTGZMaGhMZW16ODhvdlBNZjdXTW5B?=
 =?utf-8?B?K0RjR1lGd21MVmVVM2VtZ05HV0poZm9DcmR5cXYzdngrMmcvaFZLRlR5cWZP?=
 =?utf-8?Q?pCdjQHcSGhgrO6XF9TZi8ClpF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2f918d-6ef9-40ac-7e3b-08dbbf22afeb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 06:26:30.6633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14uX4HN6sbCPDCSbnmbqkCRCtL+gtsFuuAU+AXt5v54b3q/QLecACo/B3+2ePQoC9UAcpdl0jSeARE+a4w7ATg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10032

On 26.09.2023 21:49, Andrew Cooper wrote:
> On 25/09/2023 11:42 pm, Shawn Anastasio wrote:
>> Since ppc64le is still undergoing early bringup, disable the randconfig
>> CI build which was causing spurious CI failures.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>  automation/gitlab-ci/build.yaml | 18 ------------------
>>  1 file changed, 18 deletions(-)
>>
>> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
>> index 1619e9a558..32af30cced 100644
>> --- a/automation/gitlab-ci/build.yaml
>> +++ b/automation/gitlab-ci/build.yaml
>> @@ -563,24 +563,6 @@ debian-bullseye-gcc-ppc64le-debug:
>>      KBUILD_DEFCONFIG: ppc64_defconfig
>>      HYPERVISOR_ONLY: y
>>  
>> -debian-bullseye-gcc-ppc64le-randconfig:
>> -  extends: .gcc-ppc64le-cross-build
>> -  variables:
>> -    CONTAINER: debian:bullseye-ppc64le
>> -    KBUILD_DEFCONFIG: ppc64_defconfig
>> -    RANDCONFIG: y
>> -    EXTRA_FIXED_RANDCONFIG:
>> -      CONFIG_COVERAGE=n
>> -
>> -debian-bullseye-gcc-ppc64le-debug-randconfig:
>> -  extends: .gcc-ppc64le-cross-build-debug
>> -  variables:
>> -    CONTAINER: debian:bullseye-ppc64le
>> -    KBUILD_DEFCONFIG: ppc64_defconfig
>> -    RANDCONFIG: y
>> -    EXTRA_FIXED_RANDCONFIG:
>> -      CONFIG_COVERAGE=n
> 
> I know this has been committed, but it shouldn't have been.  Randconfig
> is important to have even at this point in the bringup.

Well. As so often you only comment when it's too late. The question whether
randconfig is sensible to have in the bringup phase was raised earlier. You
could have said "yes, keep it" there. With there not having been any comment
on the suggestion to drop this (and I similarly think for RISC-V, which is
likely to be similarly affected the moment the full build is enabled there),
I didn't expect any opposition to the patch, and hence went ahead committing
it.

> For options which are known-incompatible, append them to
> EXTRA_FIXED_RANDCONFIG, just like COVERAGE already is.

But in this early phase that merely means re-stating some/all of what the
default config states (which may in fact state a few too many fixed
settings).

> However, it was only grant tables which showed up as broken, and ought
> to be easy to address.

It may only be grant tables right now (that's what CI had spotted), but
other settings are likely to become (transient) problems as well. See
e.g.

#define smp_processor_id() 0 /* TODO: Fix this */

which imo might lead to the compiler spot bogus constructs, just because
at the same time NR_CPUS > 1.

Jan

