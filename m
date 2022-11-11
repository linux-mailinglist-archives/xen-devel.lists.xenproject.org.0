Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6558E625496
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 08:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442337.696434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otOjV-0000hr-1w; Fri, 11 Nov 2022 07:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442337.696434; Fri, 11 Nov 2022 07:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otOjU-0000eu-U4; Fri, 11 Nov 2022 07:45:48 +0000
Received: by outflank-mailman (input) for mailman id 442337;
 Fri, 11 Nov 2022 07:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otOjT-0000eo-7w
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 07:45:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d958d46c-6194-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 08:45:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6769.eurprd04.prod.outlook.com (2603:10a6:208:17f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 07:45:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 07:45:42 +0000
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
X-Inumbo-ID: d958d46c-6194-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csb4OnKo7CR8/RmlcqfwUHh8SZJQl+9cMudikig7efwKmQNHIiKcxdWPO6p3Rwj0x6oDdUEcCL+9R43NEIb8RG9KsscqH4uRAafLnwLcD3s01RSV+OA/La6xyJn10v9PzIgmEkzwDhxi9nzJNA1uVfuoGP5pdTSwv3M3v9nuxVdHI+JDGJytBqFP8/TG78nOCW6r1tZAg0pkiWocP1ocpXYmwSaxjpD76GR+OS3TWR67CkNIGkUZCL5BLCAiW/NYCcCcg444Uou+BamZi2IUc7QHLmSI+uF29F65h6HsplrhX28jZIYBsu6T2EYp2xA5xlDpgn0seOjhati76Q91Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM0Si6t+vEsHgvIJc9kYQOKQoFI7uNYZTr7nOJuTpLE=;
 b=E/i3m2rOig+Z/P3jiGDuQNZ/4e8f18myQLR3MxWNFnWtWVi1OEPapYJeSvkd5xE2euaZ2Ujn9ArRHUnewP/nZDPOh8zToggBCq8rAijs8SR37tGJUDVCdAd+kR5aPc4FrwcEx1wd8oR1TvUo/K6Rk4r9JbKsjvzIWz3c4qSAlYD8FKqT/JxCUtTwXtfjRU7p+weisUquTV+ztoAxFFJDU3RV3wn7xyztNugsJXaZxTaY5I8ssmobktK4lryJgE+y7FEa/fIKs/NoU/lSUUGeCpzb+C9j/u9oycHKac/BnTBox+tsC+EW3/dDdgXwmWzceEyLYxF83DPxPDCYLOZ3mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM0Si6t+vEsHgvIJc9kYQOKQoFI7uNYZTr7nOJuTpLE=;
 b=f01CR1L74L5J7cNRDeB0ZYCYZCh0L7GzZy0k4Ae/2jfzv/jWmdj2KxQ5ADoHlsW9A6iHCIXouvzpRGuQ0EgUgxviHDg1/TdHNLICyLeHHWv2ToKzB4UDTQxEO2/tbaDs/GTSyDlwNkUfRhypZs2Wyuw+qY3d3NgleIyZhzLkTrINN2CaLEJ08HmVQg7g5AoDYCWxHDgNuHqmfnyfOChknMTolZqkYEPCWuEKizKUDJyZUMyhM087zo5mdA1vJfIuw3J/pAlYFQw4AF1HRRnK7tsRuRLPAvna0rPzN6CUqIeFAQclREriW734t9lZOz5BHnzVVSo2uNptJti70z9+Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
Date: Fri, 11 Nov 2022 08:45:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 478f6dc6-2ffb-4aeb-8a54-08dac3b8bc11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	whRglS81c0JytezXxvjmuS5yE9IcXA7lcJQGBSKzUAJun+KYhIyDkpFpXyY2D6rC1JCNfkqfuOdR8loIov5EJAFpmXFctJg8DGYKe1sJ3bXDH+FhjmKoAHKVUMcaU4L4qC65qQJUQ92JoWi72lbtDr5JNxyEvU/aTX2FkDahWKSQh6IKynWGby5i9VyNK22leREwfNY0kgS/HNXpAsX5/akbg8le7K/I4ZCvRjOVqdQTatZN5ndx4cJUoiIXXnGDMfncPURrCk9Hz7YqsqSUhvQnmIary3QhrnzcEx9xqsE515tQOoJAc4cyso3sD5GnbrxXtO2+sbgUdTMpLgwjAjZ74WGIyeZCmEpVl9PfCqGtg8f7o1nqx2lyQhVgo+PE+7ou+XdhRPalsL9WHQp2dkl9unsTjR/698IrwRUQ03zvP/zEFE0HjVtuMBAuGsK8u+Gmp7wZhgcBaptyjscco8OxsIik0WKsibd6ljQ7L5GNXzulIAn7YGaDyzWk8oHgCIgWiI4WMP4qYMrMJK2QKXouYeEfmsBgJ3aFddUKZtLooEZZY7kyinA8lnAs6BGkL/cp3yB/vjJyK95z0ZZqQ1G2t1EF3fk6K2eIwdIoBACHO87FjsWxi3Xqu5kqfbK1EFbrp5okkAMEOadBf3eGDIJq6AEFdDI5kBB+4ryzzZBKXzQBqRCwz2LS4Ze0siJzXGnjsuLJsWwR67DF4cPCqh8t4EUZTYTnatE04Cm9rMv0AFSrtFVXB/wkDgSjdSSjEBjwX2gd794/+PYaxWEdTYC9vuO0ArdZ1eoLt0tQKF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(83380400001)(6486002)(8936002)(478600001)(41300700001)(5660300002)(4744005)(186003)(316002)(6506007)(4326008)(38100700002)(6512007)(36756003)(26005)(31696002)(86362001)(2616005)(31686004)(2906002)(8676002)(66556008)(66946007)(53546011)(6916009)(66476007)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEdLT0N2VkQrcHBaR3p4NTJRVm92ekd5TkhrcVUraFB1bjJMYlhwY2htZ0sr?=
 =?utf-8?B?TUw4RmdnWDJ2QytZVWJ0M3VDY2RpQy9SZnhQU05EUjY4ZnYxVFowOEd3aWlj?=
 =?utf-8?B?Rmd0NWV1QXI4WVYzaXVLVnpUMlRwbVZ5RlRIMGRmc0FuTjZtd3F0MnI4RmhF?=
 =?utf-8?B?VFpSaVR2U2ZKakZZSUFNMjJJVjBTRFZJMnVHNEdNck84WklHN1hvczRONzNZ?=
 =?utf-8?B?eEo3R2pxdzZtOUlETmpSVUY2eFBBOWtrWGNSdVhRM3RMQ1NaUDYyYmNUdU9K?=
 =?utf-8?B?ajdUaWtCNXo2d0RmZ0ZUQmJFdzM1TDVZNlN4eEdKbnlTM3dJSlhhS2Ryd1Fo?=
 =?utf-8?B?ajZQZ2IrY2pIa2orMW0yYWRtSGNoK1dQenJPeGhKWllCbVRrUHI4S0M0TzQ4?=
 =?utf-8?B?VnNWZ3dMUlhUd1AxR1g5MkpLUlhHSDE5Y0JNcUZUUnZabXorczV2N0c4cXB6?=
 =?utf-8?B?eFZPaURhRnVqWWMyV2NIbzZyNk4zYUNxU0UrdzBRZXNUcWhmY1NFckJld2dE?=
 =?utf-8?B?Y0FNVDdFVGM0NTJ6WVhjQmU1NWhZQTQ1Q1hxVHBaYU1lbW9oaHZqTnBtZlNa?=
 =?utf-8?B?QXFvR2NtRUE0NnNkUjRHSHI3dkgxWEhnQVRDaStoL2c3RTBxcjVvSmM3cDYx?=
 =?utf-8?B?R0tsMURRL1lkY1dmQXpTTWRwNGN0d3d5WWxUcUFwV1hIMUhCUk44bFErYjl6?=
 =?utf-8?B?T3h5aDN0dXlsMzA5cmNGTWRNdy9OeVVxRFpRV0p1WXF6RGNqc1R0aEhHL0tk?=
 =?utf-8?B?NzNONlRJRjRUSTZ4YjRvUENOU29rQWxDVC9pSlVNYlh1MkxrZ1o4TGFmdGdV?=
 =?utf-8?B?VFNnWTd5WkljMGVmdmNRQmhRWlhZU21RVzBiMkJRTkpIUE9KWGFBOEhGNWRH?=
 =?utf-8?B?ZjNSZld3czZ6MWlFb1QxRXc4MDJta1ovOFM0cHZkeDluR2Qxc01QK2Z4S2lM?=
 =?utf-8?B?bnpvYStXYjlHdEFvNm1RUVdFalQra2pRanZsbGsveVZUcHREK051VDhnNFNU?=
 =?utf-8?B?Qi9CVzRZTERONFNoZDNOYksvRncwWC9YVm9rRnJmNlJRbVF1cFJiS2NUZ2xG?=
 =?utf-8?B?RTdIVWtOQjE3c0doYWpWdS9CbkkyWkU0SHdESExRL2pRSERCdGVWZk9NYkFW?=
 =?utf-8?B?RjdUZm9FUEhBb1E5anczMTg1dXVuWURVRnlwSGxWZmc0NDdKc2ZGRlB6dWhE?=
 =?utf-8?B?TnJncnp3QUk2NjZ3VHZZYXppUk0vODlNZHZRR1QzT1ZmcTM0NzhqUjZGQzlQ?=
 =?utf-8?B?bjMwVjVReWRDcjNmcFEzMTVUc0RrUURQbktCUnB4Qk4xc08veVpvSUNCeG9s?=
 =?utf-8?B?Tzd5ejNCMkVrYU02RVRYNmhOUjIzanZhQmxDaERaM3kwOHpSZzUvOE5qMUZw?=
 =?utf-8?B?alMzYXJ0S0kzVHA1VTFjY2k1SVFVc0IrRWpxS0NlNkd2WDhYOVBvRXNIczd5?=
 =?utf-8?B?RFpTYlJ1VDAwUlVYem9GTm54YWtFRWluSTFIZDc0ZHQrWW5ZS2ZJeE9xbnN2?=
 =?utf-8?B?ME5UTFduUDlHWHlvQU9CVmdYV0NwakZyL2JxbnBYUWlrK3JqdFFOSTA1OGgw?=
 =?utf-8?B?L1ExK3pHRSs4RE1HNnE4K0pHZzliZXkvVmF4N2tIK01jaVN1aithN0RUNjMz?=
 =?utf-8?B?Z0RScnpiRi9JWmlzWEhzYTNlMUc4UUtoRkZlUFpSaUUxUisyd3lOczY4UWtM?=
 =?utf-8?B?cGVmR201cCtLelpVSE12WDc2Um1TUnlOdHpMbys0a1ZOSklSaW4xTDE0M1RP?=
 =?utf-8?B?YThhK00rek1SRGIva1hQcTBVZWRFbDNqUnZ3WmlxQzFqVmp0ZWR6eW5PRXZL?=
 =?utf-8?B?dUZINGNJbWRSb1FhTDIxbjZGbmxwcDkrcnFLVUpQUnljQ1VDcEtIaHNndVNv?=
 =?utf-8?B?SWI0dEp6MVR5eHB2b1I5c3dUei9qTFBueTNPanNmYjkzYngwNU5aVmJvdzBC?=
 =?utf-8?B?a1NWdysvTzM2YXMvVnRwVElOSUdnMitqRlNkK0dLN1F2dlhyL21JVkZiVmpu?=
 =?utf-8?B?Z21oQWk4aUhhV2h3bjdqSG1lcGJxNUpQM0FrSHE0Z1pVQzZkNC9Jb25janNR?=
 =?utf-8?B?UEpWSDJDWlh4UHM0VzY3aTFHMzIvdUc0cjRaNHl1eTkxWEs1NkxLN3cxRGQy?=
 =?utf-8?Q?HLfWxIgz2F3c2/nqdNKMrlan3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478f6dc6-2ffb-4aeb-8a54-08dac3b8bc11
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 07:45:42.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCZspe0k7UlW6Jj6uf0Bed69k8qPnThxkZJrtcV4qRS+CjYSIZWsRHyc6UUX6E5DsjAlHbH3UZ9cOR2g+QeKzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6769

On 10.11.2022 23:47, Andrew Cooper wrote:
> On 04/11/2022 16:18, Roger Pau Monne wrote:
>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>> @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>          res->a = CPUID4A_RELAX_TIMER_INT;
>>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
>>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
>> -        if ( !cpu_has_vmx_apic_reg_virt )
>> +        if ( !has_assisted_xapic(d) )
>>              res->a |= CPUID4A_MSR_BASED_APIC;
> 
> This check is broken before and after.  It needs to be keyed on
> virtualised interrupt delivery, not register acceleration.

To me this connection you suggest looks entirely unobvious, so would
you mind expanding as to why you're thinking so? The hint to the guest
here is related to how it would best access certain registers (aiui),
which to me looks orthogonal to how interrupt delivery works.

Jan

