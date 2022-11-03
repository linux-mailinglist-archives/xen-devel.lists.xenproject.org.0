Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3888617909
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 09:49:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436157.690238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVtm-0005Pw-7T; Thu, 03 Nov 2022 08:48:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436157.690238; Thu, 03 Nov 2022 08:48:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqVtm-0005MW-44; Thu, 03 Nov 2022 08:48:30 +0000
Received: by outflank-mailman (input) for mailman id 436157;
 Thu, 03 Nov 2022 08:48:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XZPm=3D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqVtk-0005MQ-Jm
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 08:48:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150085.outbound.protection.outlook.com [40.107.15.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4709432d-5b54-11ed-8fd0-01056ac49cbb;
 Thu, 03 Nov 2022 09:48:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8834.eurprd04.prod.outlook.com (2603:10a6:20b:42d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 08:48:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 08:48:22 +0000
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
X-Inumbo-ID: 4709432d-5b54-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PjE8DBIj4LR+RT1euuh+lU+z422amGx86uauBCdOPfxaGIE9+ADF2HY++QUn2fn860xO/fbQ/qjHeTaIdTQpNtNooPGOzrdIMjRMwOPJhC5c7JaIrf4q3fv7dE6rVRVOTS7MsuTXGpxocSOu0HMKlmLoHQr5x+VMUOtbHKv5L5RpEheJBmtGFxG45nqrl5ALfjfkzwMYKpGF+x0rQweGKDPsPHgWX5KmVeospdzTLWFegVddGAyLZIM1OG/HDF2s858J52Ah1WqdAML3q8qBUAM2GVFQ5JnZhRigbEqqCejOrjpjpDupT/hqJV3K5eM9H5LWCdoVVrNMVW2H5QmP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi1pBCMH3iFyLLmMgDBJQHipe45LdC7rPoIOb0Jln7Q=;
 b=LfVIUS9bqcp+Rm0jtVH/DHgrJs++yyL8Gf4cDBVNpMeWLDeTzPfeJqJKH3tTeEkNNPRL+AhQW5moe1nCga46IeUsCCuZoVpGhPVkmx54Qe378vu29dwud4/87uOKlYHRKkP1OCS+bkUULODwW19lz4QRm/q5XTr06oJ748Z2x1e7L4RyoZE72C7YFyc8Uze66eNwr4fWqAyDtYGM7YNbHwa15x3Ss0wALQ1WgHvTRD5E5L+0w5ZrakXKoZkulRJu+V8bhbskIJWY9uMZha5fPNO5Qcoxo8bDqcmPqWTSlezwyVVhADPJkVS9mno9jU3uHIjVrggBeCVHkmUMvYcHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi1pBCMH3iFyLLmMgDBJQHipe45LdC7rPoIOb0Jln7Q=;
 b=14D2/wFah+SYC3M3MYxQULSgIrkm2lrRfoxB43/LRI/j/9zAMQ6ngzbphJoSKHBj4Vo8+ztINd2EGeAxKZb1JuKohPkHYyvjRWxQn7xJFzhZAhJeR9Hi9XGaYpPAdtVB7TcBqvOkhyOPVhKu7FtHEvPAFJgvKlbUy0gf3RMBd7LRRN+RMZ44qpcQg65SyPEkICFJJQYVx8Ofv5VjnRtEN7j17RQYmhnBuKIWsO509dIUNuX4KkBjz0O6niTbYBvfbF/YWYTJCU2eYjeOOspxYwqNqPjEehI0UBPS1eCKE8KQTAFfRAmbVP3cj43f6dyhUTzYJhWPPgHrhp2W59d99w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aea7abb0-0d89-4ba9-fd56-0fb06eebb3e8@suse.com>
Date: Thu, 3 Nov 2022 09:48:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: x86/HVM: Linux'es apic_pending_intr_clear() warns about stale IRR
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7d9022ce-4a46-e0cb-67c3-4124e1c0d2db@suse.com>
 <ee91d4d2-e889-355b-4d5a-b40f3dabf81f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ee91d4d2-e889-355b-4d5a-b40f3dabf81f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcd1651-c23b-45b5-8329-08dabd782a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v2xb+lAeh1E+Zh+1f3A6iL0JTcHuulnY5XUQSzHH+xAkErSejNA7XXEjr3/aE8raFUQ7Th1YThuMupfNgLC3uMewk0nRP85rYO+edlEmYP40kP6mYSlIr4rEbWQl2F18RDTpMi6/Sc6KfBqFsWgoB3Qo/u9PsPp5K06cVpFVbxFweX3CdvXh6qKORAIlLkwrDmEVxDu7rhh/g+PC4laPo8lnNLUMZTH8as1sWXMfLzTb+WruP7o7GmJkEVDPNUsCipi7j7WF9wqFSJLdDpTYH+OWAkBb1KhLSD8lNrjWwdqbMXFhXLdfJ311TpEFwJEE6S3tLziO/EBeVyapDTvenTXq3PeIA1S/QMJITrXqS+QWHqJSs15pAg3WUJMnF+CntU+UaBnPGIYFrF129Byv8Yl4xK3mN3gunS8BNn/aDGucH1IW20j5sMKOx3FT+udZhl1DRh55FLs61evYFwmO1IOQid62NaRDNYbtgj+DqCKt7g6FYu+jGhMCDegAxtWMBkUZpNWbWLqFP+9heD+22HZksvsKtPyaZBq23OoZOJGlaYJC2Wk29IiOJCqY6u+GlOoBTcXkWcS6qQcZ10w61fjPizDuZC4TgAnE/8Y55PlHMQyRLu8KYCvUMaRNKOzFpxQpR37EYQU0FYaNNeyViXx0pF14eFGWdIY6jDYrVrREpeOjbIeP9wmSa2l0yqH2npsi8OLhEAXY8B07R7OGyD4nCzj0TkYbp0LZk4KboIBsycyCyqL1GfVFroz6l1KsUjiLFLBZ0vu3qbxd9pWDC1Rcjsa4JdKtMk8zbk4Vw7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(6512007)(31686004)(316002)(2616005)(6916009)(66556008)(8936002)(8676002)(41300700001)(2906002)(86362001)(4326008)(5660300002)(54906003)(66476007)(66946007)(38100700002)(83380400001)(36756003)(186003)(31696002)(478600001)(6486002)(53546011)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTJQd3lUc1V6K09Jc0ViR3ZpYmkrQU96Y3dIVTBGbC9BMjdaVHNIemJWVkY1?=
 =?utf-8?B?S2pkU3ZhcE9XV0hXYUtIMklmSmk5R1oyb3M0VWYxbE1tNEJEUTNFcHc3NXBX?=
 =?utf-8?B?TjdxTU0wN1hpNDdHcytWaVozTEwyUUZKN2l3ZWVjajdudTBCZ0YvQ3hHWjFO?=
 =?utf-8?B?V3Vhb0c5L2plSEVVUEtTSVFIdVBjUHNYQXpOM09KYU1GZkdMU1dTSXdVd0RH?=
 =?utf-8?B?RGF0SFgyWndGYWNtTnhqZnk0THp5V2lWTFBEbitEYW5DYlBJZ2NYRG5NeHc2?=
 =?utf-8?B?RzhhTmlWT3FDS281U0pYNEFNYnQ2ZTkzNUR6cXVRL1lBeXRWM1NwREhNajBk?=
 =?utf-8?B?bDgxUHpHVmM3UytKSTBrVUxadlFpUDZ5MnNOOGZMUWZwTHFUMW54bzkrS2JY?=
 =?utf-8?B?QlNSRlVTZHVjZmdtdmVPbHZDM013RitIV0xzUjJqTEViVFd3aCs1TU9tUStL?=
 =?utf-8?B?MmVBank5NGlCdGg0OWtQSlhjZ253VFVvTjNENmpUNWVKT3R2ZjBYSFRGT1VQ?=
 =?utf-8?B?dkNxUGlyQlVEUGk5ZEtOR24xSGJOT1NpSm9icndxZWR6L2UxRy9kWG10UVIy?=
 =?utf-8?B?OHZCOXBVRC9SN1RIMU9XMXJnTE1OY2lJUzdlUGlxT3ZHUlRPcWJ5NWZaYU13?=
 =?utf-8?B?UGczWTF5YjZMQTcwZmdjMTRJMDAvaFpmeUt5bFh0WitoenJqL1dWTTExM2NJ?=
 =?utf-8?B?azdzQWJobXRxVktRclM0QVFuQmlQQm9nYzA5bG9QRWNSYW9KbG9RbHF4aHdz?=
 =?utf-8?B?NURJNDkweXJoQXQxNjNkaElIYnRMY3dOdTIrczJmR2V0eFFidld6eE50RDBz?=
 =?utf-8?B?WXdkcTZ1d3paRm5pRlNqemVMNjB6d3VESEZYY2pJMXF1U0tzc3Q0NG9OS3hs?=
 =?utf-8?B?VzlhMTRIdnd3c1R0cm0vSnM2Nm5SdmllSTlkSEVYY0MwSTVuaVVFZmx3V0JR?=
 =?utf-8?B?NHJzWkdDTDh5OTREOWh6b0F3Q0dJekMyb1VzamFYRW14dU1UZnptVCtwelND?=
 =?utf-8?B?S0VRVDhCbVFkOWRPQXdpWmU0TE5hQnFndlhLdERnYW5OT25wTVlveHBvSkJX?=
 =?utf-8?B?SElQMkJwUHEyOUdNdSs2VXdncmV4dEcwZ0VSaG40Zk5NVllteXNiRW1IY1pX?=
 =?utf-8?B?eVNubzY0SVZHdWVKRjB6d2J1WGJZSzFQRnJ3ZFhpLzhnenBZQUdWVlRqWmNp?=
 =?utf-8?B?TnRDQ2U3TWkrNUZkZjB4T3NtY1hmL2MzVTVweU9UdTZiek5YTVBJOFh5QUJq?=
 =?utf-8?B?K0hSdXovS2E4cDFVRXUrQldJT3FmSkZUSmJWZEswbzV6VklDMUluNFAza2VR?=
 =?utf-8?B?MWVRNy9HTjFiUW05TUtuS0s3T29zZnQySzdhNVhzQmxIcW94YXB3THozUFZv?=
 =?utf-8?B?ZnphWFgzeE5iL2N1YXRBbENCQ0JOMUNhc05NaGhsZDN6LzNuUjhPSmNJa2RI?=
 =?utf-8?B?SU90S1VENFRZd2hrTE01MXI2bHZRbkhRa0E3TUhpOGFkMTJ5WGc0T1VDMUR1?=
 =?utf-8?B?QTdJU0o0ZHVObHpLWVNTa0tLbnhPS1Q2UTVBNWw0Mmxpc09IcXlnbG05WVFV?=
 =?utf-8?B?T1lvbGI0aXA1ZGgydGpML0h1Mzh1M1RLbTA5TmNnZXMyM1hBZ2FWVG9MdWlX?=
 =?utf-8?B?UkdlaThITkx3R25Qb0JCb2tFQ3h6ZlJ2VWdGVEQ3ZU14SzNTZ2xaUXlQOFgx?=
 =?utf-8?B?Y0txeDlGSEZuOHRMdnJIQkZJbStHNllvUkphMTVWa3JaY2Q5ZUVsbk1nTHBl?=
 =?utf-8?B?RGF0VE9Da2NGM0tJb0pEMER5TTdxTzAzK3BxMS9kY2FpdlZsbHRTUlcvc3VD?=
 =?utf-8?B?ZFUwQUJoRmVPYTd2SU1CQm8rc1k1dmNCN2ZpTjN2bUV5Z1ltRXdxbU9QMWYy?=
 =?utf-8?B?MWEzYzZrdjRtRll4T0grRUVWMXc3TXorM1ZDT0Q5dXdzR0ZaK1FqbGg3enpz?=
 =?utf-8?B?cmY1YzlGSGhFbGdhOE1ucVBiUXFvaTNGZllxVWw5and2b0djRTJWTk9CSnJ1?=
 =?utf-8?B?eFNwN3FkeEEwZ21ibEpRRkMyTXFLYVJHcDUvMnJaS0RKWGxEemVZMVFsVTZw?=
 =?utf-8?B?aVg5bTlRdExNUFRsaU1WdlJDTWJoNEFYM2VTYVpBUGRQK3JFcG53VzdUQ2d2?=
 =?utf-8?Q?9f/FtOGgOlT3G1NCqGsnq33lM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcd1651-c23b-45b5-8329-08dabd782a0c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 08:48:22.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jyGs6E8owV96dNHMG0pUFgk+rairRo1sJwJ8Z9vnq1JwRuKLYXRA3dzQyUZpjyvzBX3XcJUb2AzRsBawF36aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8834

On 31.10.2022 19:37, Andrew Cooper wrote:
> On 31/10/2022 15:55, Jan Beulich wrote:
>> Hello,
>>
>> quite likely this isn't new, but I've ended up noticing it only recently:
>> On an oldish system where I hand a HVM guest an SR-IOV NIC (not sure yet
>> whether that actually matters) all APs have that warning issued, with all
>> reported values zero except for the very first IRR one - that's 00080000.
>> Which is suspicious by itself, for naming vector 0x13, i.e. below 0x20
>> and hence within CPU exception range.
> 
> To be clear, these are the VM's APs ?

Yes. I'm now also pretty sure this is a Linux side issue, as I've verified
it to be new in 6.0. Debugging is complicated some by the host not being
very reliable anymore - the SR-IOV card has been producing floods of
corrected errors for a long time, but recently apparently uncorrected
errors have been occurring every now and then, resulting in a host reset.
But I'll keep trying to see if I can spot where this behavior is coming
from.

Jan

