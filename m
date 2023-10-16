Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E7F7CA985
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617572.960278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNiP-0004cm-SU; Mon, 16 Oct 2023 13:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617572.960278; Mon, 16 Oct 2023 13:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNiP-0004aV-P1; Mon, 16 Oct 2023 13:33:01 +0000
Received: by outflank-mailman (input) for mailman id 617572;
 Mon, 16 Oct 2023 13:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsNiO-0004aO-Ih
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:33:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85adf076-6c28-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:32:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7692.eurprd04.prod.outlook.com (2603:10a6:10:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:32:56 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:32:56 +0000
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
X-Inumbo-ID: 85adf076-6c28-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0lWM0aSr0zyDD15fn+Vwfpu64sOL7f6qcsDlx//JZ2kGZUgdSUu6RI8nmn+60ucTUi2xl9+BHQLRiDpNVS9WnrDB4gw1TkVwbbD85834dtmAgNcsu0KCb7EUtDOBGXE2gUzSZf7Id+dakdgK/nG7RIkQjbq+ERoavHvHYLKHA/vxxtKRIfhi2BRnnkbHuC6t+dYBRvotF2/ds8czSKo9VQXQv1DzLKpFkMr+otkFuViT+0UUnevohr5+aiRKfgVdpTg+QjKGqHgsMLEQLN3vsu+qt2RN+nt08bgGHS+8MeA2O+OiP2PbEOY/Q3YGzaxaDrs8gxxgK7ehV+AuvxjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS42fa5xeS8kqa0u0Vn8Vlt1a9nm0+suWp9X85KeMY8=;
 b=Kw/rH26V3nwzpZgXaYAc8wwt0MEkkWfHSYHUJRGd1hrTK0InVA96dqiD/SLlwNZmvLu8belmC9CX00D/27WJjaQj+Ut4lJc9USD7TCBfRSRkkFdTfEvcluT9BGOIhQaH+OMu+zYzzgfuMfCE3+osDaZeYh+VGknY4vsq4FVnR5iP26vyCyQsvj/TgaNXmlQWmZVFZfQBdt2g1+pNcx8mh6t5mrAiVBHxPyx3uaPV8fwc1rp5TRwsSjk1/LLmxixMjmAKKSy0RhsS0RrMCtr5ieI0Lv8cpuECsH1Au0SiIod+m/r0DNJoVVj9QaDaZyfaTa1QSgmylNXJzQsZfQWI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS42fa5xeS8kqa0u0Vn8Vlt1a9nm0+suWp9X85KeMY8=;
 b=wx/YqW63LYHYiZGc7ISklONJ1+vWS+NqLFC6OaxWL/nuRS6nG0mlPVlLlQcPvrnMSQd5kCqd7rtB0h5PSgG/DQkko9xYFH4JfbAm56mtzziU4wEekW9CUyuZkDHeV3t/JBBS3rOpBzmgPTojPaS69pBlKWIbmfZRqAdcPUelqVKCazDPbXbqRe3qnAnwZcvGhe2Yjtcwj0XaCrZdQ2ws+MmV/y2x+6xYpcGdyLHtS54trexwMOxrH/bwhnxqpWnO+uYIlTrzts4oBhVa2Pq18gQwDZuZwBgtqV71nGnFjS2n/A2+4eeET3qlemKUhtTJbEzw0+lFUgW31NsPx+KioQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9aaae72b-fdcc-b48b-1155-e1cb0401d7d1@suse.com>
Date: Mon, 16 Oct 2023 15:32:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 v2] x86/pvh: fix identity mapping of low 1MB
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231013085654.2789-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013085654.2789-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7692:EE_
X-MS-Office365-Filtering-Correlation-Id: b2686f23-c060-463d-28fd-08dbce4c681b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmYbYrnUwtUpUONnLx14cSK/uJrn5if69CMXbkTO0yk4FBErHxVNLjHdKmsnNknGthMYf7JU5+2J8GQHJ974rx3NKy08ZiQqJsPPgZhozN+uVvZ4j5TKuL57jNDgVip+XF7EJ34fdsiUbhyklcXOpurq1mr/N10ddE8/L/80O3Nx2FHvt6VYNLArkcNoxERKt1hMDbaESHrGckC21W5Eo8HjtmdTTU0yfRJvGRcycy5cuQ1mz2g0uPHNMynCfmza2gGJDpcJWMEgfXJ/PoJc9ws0u5wFKUolPy5/qeKYFdjDmIn7oLBdR1nHvU3zwhqs0a6aEQo2BOb9L9W3ZwGDo0nV0ZmHjbyt9HCpzwA/0tsQlQqfp78+Y9ePeBXCarbOGU8JcMUB74t/3Ic/X9i70tLw4Zth1LI3Zzr04vAnfRa6Qeb9yWZjTPSPW1d2AR89gj1ZWWq/5nqipUuyJdcelKJFlqzDQBWVFL/B0vILEFiwSlWqswlJq8F+NQ8YrhHDUNKGw8eMNLYsZNI0O2ovO1kPIYLMkVTxpH6rx2c8nLVPlWSXv5jiCmmiaTBccO3dhMnWfX36G4hmxuAsXFExZojfIpaGRIQuYJMOrUn8zPCCkWKrZCT/WxA8GWAWH0JOKAmyxQY2moOcBaaSw9LOXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(53546011)(5660300002)(2906002)(26005)(36756003)(2616005)(83380400001)(38100700002)(86362001)(31696002)(6512007)(6486002)(478600001)(54906003)(66946007)(66476007)(66556008)(6916009)(41300700001)(316002)(8676002)(8936002)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGJwL3MrSktUUTFGUkVvODY2NTUvMml2M1FxdWdmRElKNHJtc1FBenBzRDhu?=
 =?utf-8?B?QzhlOXRmRUNJOGJEbHVkSFdWRUJhM1FHWVVSWWMraGhHWTk1QXhXZnNoV0l1?=
 =?utf-8?B?OHZDSkQvN1YzWHorMkQ2YUxuOTlJcmxBblkyOUdHYVZYREZmQmZXd2hybDFN?=
 =?utf-8?B?STVveVNFQ2c4NUVqaTVvQjc5aUtOUlFFaXdNZnR6QUZsNWFIbVNyVDNGWFZ1?=
 =?utf-8?B?YVJwRmx6b0hNSHU4R3VBOGJiU1RDVlNpSXQ5VzdFUHZDU0RoMWxRZkZQWko3?=
 =?utf-8?B?SGFsR1FGMHIxRkFLOXk1bVhzSHJUNDh4R0RFNHB1NS93U0xrYmpkNGxHMkNO?=
 =?utf-8?B?WlpBSFJPK21Lb1U5bWdnNXVneXV6MHZYcml0bklsNmk4QVVzRWVpc3NTckVK?=
 =?utf-8?B?L0M5WGVkcjVwa0hvTXJLNTZXU1BiSXFGNll0Nm9CeENla1hqdTFmaEJmeVV3?=
 =?utf-8?B?dW9lTlRzd21XVGZsY3dIcTFleVFSdk9iQzZETkJCT3J0S1pWVXhQTEZyRG94?=
 =?utf-8?B?bHZsb2pyYXRVeDFFdmxrT3A2aG5CMmRMaWxnRC8yQ0hoOEQ4RnVsem5McHdZ?=
 =?utf-8?B?cGdaZzF2bzczM0hWYkQvUm5YNVczU3UzQ2dtejBWblBIZFVTQytrT3JtcUJW?=
 =?utf-8?B?WHlqeEVqOWVQM2lqdElha203aTNmRDNJM0hPTmU2WGI0cXhUWkppcktmcmdE?=
 =?utf-8?B?R212Z2lzc05Fbk02Vm4yeEZnQXZTWk1uMnlabHhKM2dRQ3BJUU9CanhOTUhz?=
 =?utf-8?B?U1NjejlJU2hWNmZGTUlhK2duNGVSUW83MlpuNFJETm93V1BEV1kvNkVLNDNq?=
 =?utf-8?B?eWc2OWhMNDlVdS9XSDdJUkdablFOb2JMUGtHeWUyQzBhTjNNa1IzYjFRU0NJ?=
 =?utf-8?B?ZHBpSFcwSkdreDl2djBaMnFmNklKNWN3TjkvODFhSzNRYXJ2MXp3TC9EN004?=
 =?utf-8?B?eEQ1TXFab2dTVVd2VkJTZnVLNzM2MmVjOEVUSWxyWm9Gc0xaNHUwQVh0ZzFR?=
 =?utf-8?B?cUZ0R2tpOW1HeWwxSkhnUnhoeURPTVV2bTBaMEhkdTNJV0owNmR5VW9EMWw2?=
 =?utf-8?B?ZFAyMW5Ocy9sazRnbGJaVW9HQ1BydExzZks4S0RQRXFWNDRwakZONlYvOUNQ?=
 =?utf-8?B?a1pVV0hsbTh4WHhsV3ZsQndmb1VqdzRCajlta2dYTWZjcy9YY3g2SWpUeTU4?=
 =?utf-8?B?eXFpVm9KYUJsNmNDNituT2Npb3FYemVmcWxHMndTNVFRbDg0dVdYbEVxREJQ?=
 =?utf-8?B?Y3hEbkJDQ2Z6TzBYUnJraWNoMndIN1ZrUUxiVldTVkZYcWJOaVdPODE1clhL?=
 =?utf-8?B?WDc5L1ovWkN1QWNHeis0ZERlQUgwZ2pKNWg5Z3ZYWnpQMEVDYnExUHJsT1lZ?=
 =?utf-8?B?TFVPWmpGRTNudThYT0FsK0RoUVF3MDd2SHB3eVpmaXRoenQrYU1FK1NDQnFO?=
 =?utf-8?B?RWQ5TDhFdE91TU1sSkY4czRaTHIzRTlMdElYRHR1aE5qTWp6dWdBS1JTb0Uy?=
 =?utf-8?B?UVNjQW1IRzYxNDd6WDNOd0Q5ejFFYlRnNDFPaSt3OSs1ejAydm54cXVtMW5O?=
 =?utf-8?B?Y2lKWjVLQWR6VzlUMDRpVWMybDFLcVhhRzdyd213ckJzSTdTYkNGS0hiLzUz?=
 =?utf-8?B?WVNucE5ZdVVwdlhiK2RKcDE5cjFab3ROelpZL0VQMXcyUUxGL0M0QjNvRTZr?=
 =?utf-8?B?VkYwbGc1R244L1lTK0tyOStYc25wT1VOdXpacDlQamw2NWJwSzNuSzBIVWE4?=
 =?utf-8?B?bkVmWTFiMStnSHNOZWpDQXVHS05xa0VsK0dMb21nL0VidWJKbVBOYWlJbXRH?=
 =?utf-8?B?emU4ZzZ0K1NFT2xCV0tXdG92eG5PdUFrdmNRTUE2Rmw2enpLa0NBY2ZxUmxK?=
 =?utf-8?B?NG1LL3Z5SUZpSDdXTkxIaWoyZG84b3FJWWQxN0FyUHVXSnRtRTdGRGRTSEYz?=
 =?utf-8?B?OENhU2hMSTh4bTdVaWRSVWtMK3ZiZWt2UlhjdE9xeFVONXhYemwreDViUUpX?=
 =?utf-8?B?aXhTUEx2MUdUWU41WlV5ejZRYjZzSG1VOFRNRjlYSnBncTI4ZGw2cHVJZUlM?=
 =?utf-8?B?RDkwWDl0NDkrK3J0SGJqU0VKaHNtUUVPbWEwZFpsamNuMys5b2x1S2k3Slkv?=
 =?utf-8?Q?Q2BCrssb2gWF97GQL5YxKhLFi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2686f23-c060-463d-28fd-08dbce4c681b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:32:56.3974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egXdwQGERDp0XOzfaecUAfi//yeddhS3rEw3xXkQhIZsaiN5GdCnuXr0J9nYgxwh97/+Z+c0YqLPxayKHYL8CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7692

On 13.10.2023 10:56, Roger Pau Monne wrote:
> The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> builder code, causing the region to be avoided by the arch specific IOMMU
> hardware domain initialization code.  That lead to the IOMMU being enabled
> without reserved regions in the low 1MB identity mapped in the p2m for PVH
> hardware domains.  Firmware which happens to be missing RMRR/IVMD ranges
> describing E820 reserved regions in the low 1MB would transiently trigger IOMMU
> faults until the p2m is populated by the PVH dom0 builder:
> 
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> 
> Those errors have been observed on the osstest pinot{0,1} boxes (AMD Fam15h
> Opteron(tm) Processor 3350 HE).
> 
> Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> arch init code to create any identity mappings for reserved regions in that
> range (like it already does for reserved regions elsewhere).
> 
> Note there's a small difference in behavior, as holes in the low 1MB will no
> longer be identity mapped to the p2m.

I certainly like the simplification, but I'm concerned by this: The BDA
is not normally reserved, yet may want accessing by Dom0 (to see the real
machine contents). We do access that first page of memory ourselves, so
I expect OSes may do so as well (even if the specific aspect I'm thinking
of - the warm/cold reboot field - is under Xen's control).

Jan

