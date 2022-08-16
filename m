Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A059530B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 08:52:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387996.624516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqQX-0000N0-4Z; Tue, 16 Aug 2022 06:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387996.624516; Tue, 16 Aug 2022 06:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNqQX-0000LA-1d; Tue, 16 Aug 2022 06:51:49 +0000
Received: by outflank-mailman (input) for mailman id 387996;
 Tue, 16 Aug 2022 06:51:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNqQV-0000L4-Ob
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 06:51:47 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20065.outbound.protection.outlook.com [40.107.2.65])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df1120d5-1d2f-11ed-924f-1f966e50362f;
 Tue, 16 Aug 2022 08:51:36 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3321.eurprd04.prod.outlook.com (2603:10a6:7:8b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.22; Tue, 16 Aug
 2022 06:51:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Tue, 16 Aug 2022
 06:51:44 +0000
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
X-Inumbo-ID: df1120d5-1d2f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilikxP7MDh8YfRG1d84Sh1E60GFBGj95FYNFIqVAzUx3401Ba6Iy1HEpFY4UaeWjBbYOLSsJGz7LzMCyYRcvB/cF+jhZSZzfKt95zt9UQ4GdMBhGb/U0iqPu3A1DmPmp0u59fxSZyt35uZN5YPnn6VR6BCk/2XJ7KGsf5Se2h6CLcZl5OiyrcmChc746hdVZf7OymsgRzFoeYet1BrFwHJ+boJcT/Bv5Tr1DWmhgDNK/tKcl2FZ3LwR5+HoQpk9tkB+YrUzsdf8288Hx2nariW2Jgay4/bXiAUUp8I30vy5/X3CCvbOdY9awPOAtoc9fJe3bJbbs60Ay3YcRWu219Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04tBr9NPFZN0zCrNrrglsMrlMB32SkuRGR9UgyuH/jM=;
 b=bgu+fISGoqvnz2PoLtpfaBvtVLc+/QsatBBtu5+ghub/ycVOjQBiMGjjjlikiScMjYV3I5Dbv4LzblPcoO3tUmRNVFo6QdkmqHt8tMHir/G0qTL/97LLXYnUg2W7R/X1P6wP93eC3b8NJAdkya1EN2CKLE3ZSSQfkeYVJrzFszJRftMWOX9GiXtoBOKDJlLi3w+CtvhRQ8y8D73XbGMhOQXTMi0N1V43eOct7Irva2rYoMWLF7EfWDn8jop0uqaJOcO0IGWPbJ0KjwOozOCjH373/9Trwh21pVFXGaeoRnTxYsEJ+aTagnn/tF93jErdMEdmySR0vw8Eda5nK2ugaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04tBr9NPFZN0zCrNrrglsMrlMB32SkuRGR9UgyuH/jM=;
 b=DBWYZBQlDFFooaLN6xJFxCIucUKoHiAy7LpAn31vvJSpvw7P3nj36f4cP1kKKQSpzjBOmsCL3hXbeKlud39LMZsPtjSLKuRdjEbkRix2tKybhkbDPd9xGxt9GTAZlaClSFW/5SwdSYnaXgPD3mzPR89izddj3bqNAOPnSIr26/BG2q9UNcnR7SghcaAHuseDeVqDwAndXyleUOy+OqvSCcLzBzWJAakH7uSrMBE8jNFsxns0Hl7asCLUsFAUgoh9Y2/bxCZsOWI2oHGGL1zHUs2Gs8uwcPJ1ATBCPW/tvoZGfysA6M115hpVsAwoX5Xa6tlQ3AfLBZLgil6kaBU77A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd319ac0-0f17-5461-5508-d383dfe07308@suse.com>
Date: Tue, 16 Aug 2022 08:51:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>
Cc: Wei Liu <wl@xen.org>, Community Manager
 <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
 <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
 <3a975638-9675-9a95-fead-91120edefee1@suse.com>
 <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f27df5b9-3c64-4b10-0dec-08da7f53c7ee
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjK7cXoSalOSoby8ZOBhwq3PG4jNzB534UcAs2KdxaxrZQ6YAh7KRHLibh/vb+VzNxWdzeUAR7M8QC7roh4tJOpNHV/dqKRatAg8E63l+6kSfWcHYVBWzpzARJZZhvQjuujc1Vmvrlbj0ZP5RatRnhEcwI1NSc7gxgEvy30WGR37ebMSvmAJiKVZ35z1M83LgdDfvHX/akecjrzvU+p9x//oyJqK/pu14ipTrSuaIKhigHp5kTbs9hkWYEddrJcpk56/XJBgzGu1uUmx7ZdclYnKHbpgTTyXBMVzz5UP3KFcDpwMow6mDhcHFksuPlI45PbpaPJ3JS1u6gCAZbKlzviF0dhDkMSAzW5u0J23DiEst731x+SUocVVb/8CabQiqHjgFQvi6f/et6A/FvVmMvrikdH6Yw6RalDSIkqwehmAS/BaTAF0Nv9vPlsrMhWOFrlIo9js5dAGsaVtXBvxGWUiPNXW8/qcXQMSe2O0dqeFbafnHOUv0FNNkCvr5RtYcITvVKsi7URm4xtTELILpnwgd9nBIUsmnEpUUIYF6q3K7iVuwAzdjOIcWdpSFxANA4FhaWeYdRgSBEY4NVDkd6t2h1Gj6pqN+snshvemJo3DLGNZ/jS49RNxgoUHAPnQaemvY6gkkbEFtNlhhItPv9N1UWlaZGnIYrCJy05QhN2YkOB8ONoWHxdiKEUFjuWeQ73ld5U4BYMwpdZ1SVCLQqGyuN81gq7ukoeYT8U3WrmKJEN6JsqmNUyHjQjyn/kBUk744m2BRXC82H1ou4/k8mBTIJBPwq3/TXLbvzWzW8e4ba7rLJRosHydyKYMm3hpvDlY1J1AuuyC1Od9if4I/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(396003)(346002)(39860400002)(83380400001)(31696002)(86362001)(38100700002)(316002)(6486002)(4326008)(8676002)(478600001)(66476007)(66556008)(66946007)(53546011)(110136005)(54906003)(26005)(6512007)(6506007)(41300700001)(2906002)(36756003)(2616005)(186003)(8936002)(31686004)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNnUUppVWF2WXN1SGdzb3lOVEg0TUk4SHVLUE9QMVlCNitpOWhQZWUxczdr?=
 =?utf-8?B?Zlk0dC9lcWNWMlNETjQ1SFZEdGlzc29tRXF5NWsrSUU0OEIwS3RPSThVYkF3?=
 =?utf-8?B?cXJXWnluOTlhaHE4aE1QbHExSkdYSUtnbktKZHZWMlY5SVdCSkhhZk9MMUN4?=
 =?utf-8?B?MXdoS3Z0aG4rbkE0MXdweTlOZ0RLOWVOODIyY1JEMHNPbVI4SWhiaVV6NXpj?=
 =?utf-8?B?SHkwejhMMGV4c1dQWlVuTUh4djV0NTdYY29LRzg5SXB2WERrY083cmExRXRq?=
 =?utf-8?B?aXg0Ykx2b0o0c01DNldBTFUzak4vRWtLdy9UKzlERmdZcnMwTk5BSFloSy9J?=
 =?utf-8?B?TTJFM0sySGZCTmJxMEFDeEpJc2pZRXZmcmFlRnFiQzJ0dkp5S0puQStOSHlq?=
 =?utf-8?B?ZVNUaUV3Q1pTZkU5cmJpNXpWZGZBL1M0ZiszZ3NEVldTUVA0VmpjL1FwNVNn?=
 =?utf-8?B?bVVaWlk0SldXSWpBVGZQVlc4TUIyWkdiSUVEdWNObnNiOTRManowRnpBN1Fo?=
 =?utf-8?B?ZDY3R3RsMGlvS05ReEtNbGZEWTU2Tll1MXc4NVppcml6Zy90aDdPT3pYTTBY?=
 =?utf-8?B?U1lqQWlZVXRGNzJLM0JqRk5SdUUwNHFsM01xSENHYkRheTJDNldzRXY4ZXQ0?=
 =?utf-8?B?Nm1WV2dqWG8zV2MwNzFJanZOcDR6d3BGbXQzdEZBYS9aQ3RocDltOWthZ0wr?=
 =?utf-8?B?OHZML2lVRDdHajZTZlBpNkFCTHk5R29PbmJRZFR3c1djeEVTelkvZUcrdi9w?=
 =?utf-8?B?a2NGblU1OVBlby9jZmNWeVhKUjJBOWlvMFIyZ2pDTU0yU3R1U1Rnc3BzSzJj?=
 =?utf-8?B?ZDZHaDhRRjZvdnJsak9qekJwbktjRDZjNVNMM3l5a2tXbExRVzZjdzFSOVJw?=
 =?utf-8?B?bFB5SFBDYUEzd0Zhb2pVK0xieDFHTHRMNHd0SStqSkFiVDVPd3YxM3l5bmtQ?=
 =?utf-8?B?L1dURzkyUENkd0pxYm4vR0dwRkxVdW5LQ2dyTGxmVkV2QlpnOEgyUEhwZDZN?=
 =?utf-8?B?enNPQ0V6b3VwVzRSSG5xUFJFdXZnelo3Q3RXNi8yUzgrL2R0T01qYVMxYTRo?=
 =?utf-8?B?TkcxMi9Ya1BOdnZ0a3FkSDFoeU16dDRueEMrYXRHbkw0UnQwOEVGaHZXNTJx?=
 =?utf-8?B?RERRNm9DK3hjWFpnOHBpdXBMZi9xbStGT0Rjd1BwdU9xL04zTEJaOHAvajRP?=
 =?utf-8?B?Slg0S3dMSE5BVFRMNUNkQnphaEIxaGUyck1ZSi9vKzZ2TFV5OE1yeVlQVkla?=
 =?utf-8?B?OVJuMHlPOGVaZkU5b3N6bk5JYUlYWTQwZGdBUzVLc3l6cmttenFxcVhQTTg2?=
 =?utf-8?B?Tkx3SHJXZVlpVWJGNG9WQW5vYlRUTjVhRkdhRFJuMlMwTmlVZktRNzdBV3hR?=
 =?utf-8?B?Z0tpdFNRTFBhM2UwVTNqUEdKbzZ0c2lYN0xsTnVLNU5qTXdzTFM2WXdpS3lV?=
 =?utf-8?B?SkN2RjRMY1UvTWhVUVhEQ1dQMmxxTUNFQTF1WXdNay8yZGxaTThqN0pRQzFw?=
 =?utf-8?B?RG50a1lQZlpoMUJSdFI1RXJjTEFzS3NpR3JnNm1ORDVhL28wVlpGTWhwRUt1?=
 =?utf-8?B?WndWT011a2lIYnpISVlBRytIZmZJMlgzVDMzRTVyZ1I1T3ArK3VQaHE1SzFW?=
 =?utf-8?B?RWJLdWk5YmVoZDRIZ2xYTlM3YnF4ZS9wRzVRVWY2bTZWLy9NMTZ3TlZJV3VP?=
 =?utf-8?B?dnlRQjdNMU1TaDZEdUJBaDdoakJBTTRic2VwSWNMWUlRKzJDYzA5M3lCUDFL?=
 =?utf-8?B?NnMxY25sbGdwZGFON1JtYzR6ZXEydXg1L3QrUk1MQzA3L1E2ZWlMWE5YY2Vy?=
 =?utf-8?B?YXFhSHg1dSs5c2RuZ3dYUEZJYW1oTk53UmFxVFpyemc3M1l5Vk9kek55VUs5?=
 =?utf-8?B?NVJTMk81UC9ldXRsTEJHWGNSQm9UelFCcnJtdEwyckNrMWFueEZRMXdpQzQ4?=
 =?utf-8?B?SUpvT1pKZko4V3k0M2F1N0pucWJXak1OYmhhYWtIYkh3YlE0YklESE5VRThH?=
 =?utf-8?B?VFR2NnRTelRSNTlIOTdQaTVRbExIb0p5S3lkSFFmellCNmN5Ym5Kb3YwaHVO?=
 =?utf-8?B?YkUvVGZpTUFSKzRCTWJTZzNrS2JBSW9aK0cyY2lUbGc0TkpRYjRoWkx4NmUw?=
 =?utf-8?Q?BrJUHaOQ5OIh1OOdHJWY1CH9W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27df5b9-3c64-4b10-0dec-08da7f53c7ee
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 06:51:44.0720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bqfa0cKqBFa3pMEMByHZcmP+kuWqMglKlE2GMexVSifgAF9AgCTbUyH40l2s8p1i/vDO/YS44Z+9IOdNspYKDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3321

On 15.08.2022 20:49, Andrew Cooper wrote:
> On 15/08/2022 10:14, Jan Beulich wrote:
>> On 15.08.2022 10:15, Andrew Cooper wrote:
>>> On 15/08/2022 09:01, Jan Beulich wrote:
>>>> On 17.05.2022 17:31, Roger Pau Monne wrote:
>>>>> Roger Pau Monne (3):
>>>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
>>>>>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>>>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
>>>> I came to realize that I had announced that I would commit this about a
>>>> month ago. I've done so now, but there was quite a bit of re-basing
>>>> necessary, to a fair degree because of this delay that I did introduce
>>>> by oversight. I hope I didn't screw up anywhere.
>>> Revert them, or I will.
>> There is no basis for reverting
> 
> You have falsified tags from me, which is a consequence of the series
> not been reviewed correctly.

Andrew, please, come on. I have not added any tags from you, hence I
cannot possibly have falsified any. The Suggested-by tags had been
there all the time. I also cannot see any evidence of "the series not
[having] been reviewed correctly". Please can you support your claims
by actual facts?

As to the series itself and its possible reverting (or fixing) - can
you please reply with technical comments on the problematic patch(es)
of the most recent version?

Henry - you may want to add this to your list of things to monitor.
The situation will need resolving one way or another, but obviously
we first need to determine the most suitable way.

Jan

