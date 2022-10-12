Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAC85FC0E9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420785.665804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVXT-0000zw-6c; Wed, 12 Oct 2022 06:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420785.665804; Wed, 12 Oct 2022 06:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVXT-0000we-39; Wed, 12 Oct 2022 06:48:23 +0000
Received: by outflank-mailman (input) for mailman id 420785;
 Wed, 12 Oct 2022 06:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVXS-0000wY-CT
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:48:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130074.outbound.protection.outlook.com [40.107.13.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc6b93d1-49f9-11ed-91b4-6bf2151ebd3b;
 Wed, 12 Oct 2022 08:48:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9568.eurprd04.prod.outlook.com (2603:10a6:102:26e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 12 Oct
 2022 06:48:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:48:19 +0000
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
X-Inumbo-ID: dc6b93d1-49f9-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa1bQg0Yc9WlAZtzyTSWBkqLkKAksy+j+0RzmJ6vVpALXRhF/5BBK/IVzhD4XnTKbLXut81xYG8bU6MXI3ipvJmB6pkmLR61+6pjb2glmSdzEAWpsszUbIIjvF+bgCUVXjcxsOil5qAw+Alt4b0fYCa25Gx95Xu2/Mcl3HUQwTE9n08xB/iHJgv+stiG4MpoJu8mSEo6e43sdU6o+oBeAvZEBgTsK4Wi0cpUcCmZc2yldi79W+qyPqWwbv2Sn0xGK3rmYQbN/ZKoeJ4wfMKwHS8ikVAWWDt2p7TsfFNkNNy3S81HK/mh7AHRGIdMfnjFbtH8EBjAbc7sHtKAe6bXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjKEDje4nY+oSuLik7PY4Gm+zFBTltU1BPC2buuTfjo=;
 b=di59K9raWGbgqontxefxPTsz8fyDe+fSOsGTCwcuOzs4h94QWiwC10pk9W2XCI3ibgCO+1dkxYxVnlzyUwOQvmwM23LUptQEadiV0gdWCMQJa11H1933Vim7aM2mU0TzKNBBiBQZ30n7/D142RPG2ByMSw+r7pF8LToAa5PozFmWGatWu4ld95uGdv6/Kng19kN/sC49mEaVtZdSvWMljRvpKHLfjgp5RdCLaizwbt7SsDeNXKIRg6WB0AbnLnnsOSsdFVCzNPqMmWM3CSLw1t3Bf2dS+TWDcbSmAzgUhOvWb3tNNDd0OoQweJ5KOISh7VDIAh9I0pF34W9TP0B2kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjKEDje4nY+oSuLik7PY4Gm+zFBTltU1BPC2buuTfjo=;
 b=rYWsNHIvm4D2RLquVfHrRMY5rK9FlIB9NezKiGC5fnEl6hBJJT6vekMjuYwVuipps8daFsJQN6/Lou6sOIRomUdTx4iTNd9W+Wwk2ha09jnyrpM+2uNchDxyfFEL5Q89gheYtFpReIpfs+5EsCh0tqcmoItAyy0Y3Nw+vDOS/lv/A++JyQJ/WRkmoh1vT3tpXcbFzZQEfMEasCK63aG45tTgZ0Gue7EovFFWZw7x4hlqZSQTiG7qsdX7uwHDeqck9puETNV4jT8FBivKD/R69IcTVK55M0eDTzH8gWLtXLy5QSiXkLro0EknZ7Ns1pc2URYC2w2i91NlQFgalcI1Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b0f71b0-1190-1a5a-fbf1-6c651e4f4745@suse.com>
Date: Wed, 12 Oct 2022 08:48:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [xen-4.15-testing test] 173498: regressions - FAIL
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: Julien Grall <julien@xen.org>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-173498-mainreport@xen.org>
 <AS8PR08MB79914E7F4F60378327C271D692229@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d048659-aad7-7c86-9f41-94489d9d90f0@suse.com>
 <AS8PR08MB79914768F6ACA39D7791BF4892229@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79914768F6ACA39D7791BF4892229@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9568:EE_
X-MS-Office365-Filtering-Correlation-Id: 23741176-a940-4ae4-e2a8-08daac1dbfb1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jPP9ei6CxTn+m2wjWZLXAQeYW2yJAKBS2qeFRJtZ4ixDQm290oZulOCpGGdwn5i4IT5rONihwycQxB45CPN10l87TA0TxA6T5RbDpXHjAU+sFUn4VCgfdOml5TNOiY+CHXytmFOHetVy4Q9GnDCZctNbG3f+vw8+PRCx8O9ZZ3EzNFBi7jGPmk3hmOK2O8EIYJrFprPuw+BnaEZL7BlUqWM82CVfG1UpHSyx70AiAgVnRrsnWoV72rrhjOYzJYo+O7kK6jktRvcaJHX+h8g0lnuE0o6dzVQdn8JXVTS0NGemfN10ujBVpyb2x9U+sKfaF+/DkQZEHHf9mKmltX7rSg+SKYQH8RN1EE2E1rTI4XZmYzBqDJrXMlI7VNH5peRi9EgE3nvy5vt3qpvlnoPE6XfcK6MeBHYC7AoBM3h6yKMHbdZUbLQ2G2lNnMrgDaN2XleEh3E5dQB5i67/zNmjKQPDIKKfKjBGhXnIf1RjFjgi3Qa/zAQ6RBMxYMGuKPc0qowO4qmTq+l7AvCgZtvAEgNRIy0DPWPRkobnxqs9qNvwW/Mxr3golEtb+eBiEGULuxm+XT2qg8KtFg9n3432DBC06ZHcnfXAx9IPGMlMvuWQwJ6wOupsG6iqXes8FCYdznooJROiUAg0tdjbn3kL8tDblA+Di2J8md6Yj/fpyIWOhcWDBQRXnAs7PCRO52BiLvveoWI6xbVy6y6RDyxscYRamWMTa0pA1JZTKNWP7g7O9Ej4G74zxC5dEFKXQrruQ3Kx+llAk2ZXmDvMLVsxoTXTvgnXjeReeeacJ2cxmVnVp+PzoznMjOzyMK3fMjhPktRNqA7ZxOwdu8w3r2e4Ug==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199015)(36756003)(38100700002)(316002)(6486002)(54906003)(110136005)(8676002)(66476007)(2906002)(8936002)(5660300002)(66946007)(66556008)(41300700001)(4326008)(83380400001)(2616005)(478600001)(966005)(6666004)(31696002)(186003)(53546011)(6506007)(86362001)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzFpbDBGR3ZIbENyb29RZWQvbHNHNVFkbU0rN0pTVklJQXZPMWYzMVlYcUlC?=
 =?utf-8?B?ZTFsNG1yTFZadVJ0c1R2Z2hKZzZ1VW5pbFltOWxTdTZjVU8rSlViamVKRlFu?=
 =?utf-8?B?M2VpVGdoQkxSMHNCRjZ0U2tQYUdCYkEvSndZZXBFR3J1allrNzYyOHd6VEUw?=
 =?utf-8?B?V1hvMDZ0WEdmbUlwN0JBeWo4M2pqT2R3NXgvb0pIWUlMSHZZTFNGbWsvcGJk?=
 =?utf-8?B?UFJuKzAzaGVjOUxmY0JRU3NYekdnNWp2K3JCQUIrOFExVFZYR3RvTld1MnVR?=
 =?utf-8?B?aHppQkxaV0UyaWh4em9SVm5TMFpTMWZveXB2RExaYTVMODNxZ3kxZk42Qndo?=
 =?utf-8?B?VVJqK0Mrc0VLTC84SDRmOGhtSTlkSk5reFdCa2hpMmFIT2hqaE5DQ0hOaExs?=
 =?utf-8?B?UkkrenFaNlB5dzVCNFlBdFl6azgwYkJzMjhzOG1ZN0FETmh3NzRRbkZ2RURu?=
 =?utf-8?B?RStXeHNWcVlXTjhqZktFME9ocStsbkg3ZHRramFxM3FsRTgwbEI1UXh4MzZZ?=
 =?utf-8?B?QUhLTlVESERhWkE2Tm5LcklFcHZLRWYreE9tZFVmOTRFeTdsejJrekhHLytx?=
 =?utf-8?B?QnNSRTN5azdxcTRCU2JCTi9GSmV6ZXRqUFJmdFgxV2E5aFZzZW41cjFDSFV6?=
 =?utf-8?B?ZmhnR2lZUitmVmhJbUJhU01Ma3puOGRZdHRXUGFVcGcwU00rNXphc1Y2TlZs?=
 =?utf-8?B?MVliRW8wWkpySzV1YzlWRGVxSlRKRHZTUklEcVBuMkxBZ2FTcFF0aWhGN2xw?=
 =?utf-8?B?THQvbUdlNEVlbUxpSGEycWNYZi9Qd2tCL0tET2lCc3RMM3pDdHNtTGE3OUh5?=
 =?utf-8?B?Y2JBM2oyRzJhSWxpQ0NLU1VaUWdiVnpIbkloK1lyeWVUcGc2TnA3S2JlWGR1?=
 =?utf-8?B?VzlKRGZiM3dFbzNNblBIeXBxN091RUE2M2RvWGpQSXVXV3BNK2NKbEp0c1pv?=
 =?utf-8?B?a0kxK3JJd3dHeTlxblRMa0JOZHlNc211bzk5elF5aC9iMFU2V2pKMnR3ZERW?=
 =?utf-8?B?Q2U1V1N2dVdVemVXUnMxdXdnMnZUNVdjMjdiTmNTVnFUZ3FXc05sOWlaeks1?=
 =?utf-8?B?TjBJdEpEV1hiMERTMUxBVk5GbGZFQytObFE3djlJRjBwWlNXZ1g4Qks1T1Vx?=
 =?utf-8?B?b0NZc0tLVHNJd0ZLQ1NWZE54Y0FWTU9MZ3gvUzNWVmRBZVVRSzBnNEVadE9k?=
 =?utf-8?B?elJsR29RYmdxY3pBczExNkk4SHhXbDl0d28zbDJVeGxUVnJZMGpadWVSbzZs?=
 =?utf-8?B?WDZCVE9QZm53TjI3YVcwSGZmdVFBd0ZlZmRRZzlxaG5OMW0yckpxMGw4U2tW?=
 =?utf-8?B?QVJKYXJsdUM3cDRkUUdJKzZVUXVSb1JwbC9kQldlQjBMdU5nM3NndVYxS05P?=
 =?utf-8?B?NnpFMTFuQTBLMzl3Szc0U1J0VW43SlB1VitLS1g5TFZxdkdPald2NlVaTi90?=
 =?utf-8?B?TjNQTnJsYjdpa0RQUHlwb09GTkFuUk9hdWN2M0paZERrSDlkd21DU242Z3NQ?=
 =?utf-8?B?NlB4RWozYXR5dytwWXFzNm5lQnVNdlRIZXpsR29lZkExZDlIeTI2cnZac0Mr?=
 =?utf-8?B?SkNVRU1Vam5Mdnd3bEt3SWJNRTFsRmFQa1NaZzNnalZMYk5pL0JEZ0V2d0NF?=
 =?utf-8?B?RkJ2OHNMWFY2bnNaNVNDR0loZ3Fuby9lRy9hWHR4a0YyZHVtbFhtK1AyYVdS?=
 =?utf-8?B?SzR6K1RUTG1ZaWY1VVlDcWZGU0VobEdpRFRrN3BwQk9XcGh2STZGUk1yNE40?=
 =?utf-8?B?OVc2elAzWVQ0ZHBhUUQyOTNSWXlBc1QxMmg4TUtHWTdMZDQ3L2NsNnlSZThP?=
 =?utf-8?B?bW1ZU0hiMXZBZFV3QWRQWkRFdm14NnQwYUw1SlkvejBKL3BzK1BPLy9tSWVK?=
 =?utf-8?B?Rk1PMS9yWGNUSEk3eW9yZGdBZmxyZ1ZsSzRscVZlR25DbVluUy9McytiUThh?=
 =?utf-8?B?a0Z0aUo4NHNQOHRrbE1mM21ybTFhTFE5dFNxQnRKaS9xWnAwSGdoT2ZFOWNV?=
 =?utf-8?B?cDNNc1Z6STdXWTZIUHhzQ1FwMWVLWTR1ZUcxRk1xbWk5LzVrUzdMRW5MQ08x?=
 =?utf-8?B?R01ZYWhoV3Y5dUljZWxzWm1PQmp5WHBjS0E2cUNONlF1TlVycjc2THc4OEpO?=
 =?utf-8?B?MTVrNFFmeU1JWUlEZ3p5dEwwWFB5SDZrUmlnZDJldFNJVUhNdDZ6WHdsa1BF?=
 =?utf-8?Q?tQO5kbPVysnuYgqVSnB+UyYpKTDl1smBnzt/MpsbBoFX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23741176-a940-4ae4-e2a8-08daac1dbfb1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:48:19.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HG0xqwVoOiNOBEuVqYZo06LNZ/BRfu6A1Vp990F53emAhYKi7Ts7sVUzl/d4cKSxnvwQP86HV91ntujhrVS5Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9568

On 12.10.2022 08:42, Henry Wang wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [xen-4.15-testing test] 173498: regressions - FAIL
>>
>> On 12.10.2022 04:42, Henry Wang wrote:
>>>> -----Original Message-----
>>>> Subject: [xen-4.15-testing test] 173498: regressions - FAIL
>>>>
>>>> flight 173498 xen-4.15-testing real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/173498/
>>>>
>>>> Regressions :-(
>>>
>>> I think these regressions are from the backporting happened yesterday,
>>> see below...
>>>
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  build-arm64                   6 xen-build                fail REGR. vs. 172547
>>>>  build-arm64-xsm               6 xen-build                fail REGR. vs. 172547
>>>>  build-amd64                   6 xen-build                fail REGR. vs. 172547
>>>>  build-armhf                   6 xen-build                fail REGR. vs. 172547
>>>
>>> ...The arm/arm64 regression is from the backporting of commit:
>>> xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm
>>>
>>> The issue is:
>>> In 4.16, commit
>>> 2107cc76db3a libxc: split xc_logdirty_control() from xc_shadow_control()
>>> changes the prototype of xc_shadow_control(), and hence the calling of
>>> xc_shadow_control() in 4.13, 4.14 and 4.15 does not match the calling of
>>> xc_shadow_control() in 4.16 and after.
>>
>> So did I commit a wrong patch, or were the patches for the older branches
>> wrong already in xsa.git?
> 
> I think the latter. For this commit I think the patch for master branch was picked
> for the 4.13-4.15 backporting, without noticing the xc_shadow_control()
> prototype change in 4.16.
> 
> I can send a fix for this. If we don't want to backport the
> "libxc: split xc_logdirty_control() from xc_shadow_control()"

I don't think we should backport that extra change, but Anthony would have
the final say.

Jan

