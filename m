Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F11649BA6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:05:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459311.717051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fgN-0001aF-PU; Mon, 12 Dec 2022 10:05:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459311.717051; Mon, 12 Dec 2022 10:05:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fgN-0001XP-MO; Mon, 12 Dec 2022 10:05:11 +0000
Received: by outflank-mailman (input) for mailman id 459311;
 Mon, 12 Dec 2022 10:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4fXz-0002iG-5O
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:56:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4031d461-7a03-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 10:56:30 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7768.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 12 Dec
 2022 09:56:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 09:56:28 +0000
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
X-Inumbo-ID: 4031d461-7a03-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NiTG28SA1CoGbHTzDgnX4RjomRWK5A2JjPGLLv3zyHddlUFHjL52EQn47XQyfsB58daPUNx+miRAJHNQ59ZkfmRWH9a32rXt8rSynq246PGNP5z52JT8INOTCjguQSBVf8EcEiVdSfReiCwTDBBpxK0jw3+j/e8Iy9lA57uN4Rtx2s3LmejMOobL9+WpY802a1XHPlxeZLmbhCSzbzgks5CQlBKJycqJKifJ2P5kuVwR0OTxuOkjY6kjSgR6r3+oB8piQfWni3/m1h2rqcPXIJ2FNLzULHe1nRVlcTSOX8f1YUom0qtharDJzfauJddu+/zBEPy8B1iO/mgmWUnGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJj15GFvXZeFxUlDRJPYmS7rYjtIilbGR//bfKeTn2s=;
 b=cbXoxX5rPB/yNF49BoQzxhF+8xJOjjcPfOPPEQplfyIGTq+5dmXslAZPDdrZXF7dlVCrO5c5C0+OK+bETlTBAPVco/GGuMYoV1q/twS4nvtjKU74do5rM2KD27PECB4lWcBvL1l+9g6AnaVdCpTnj/qHgnwVrzx44P76VxYpAhWUO/o8ZGhofGu420RmX83CuSHKKWxjVTcPf529O6K1lDUlKS14zdgIXMrfL0zK7Jb+grd9dhi/ccwIMoqvS+z20HEmTJSzZuyehM7GoK3zkHz2Blz/OfDrBHt1spLZFYzliBkMrg4ci2z4Ltcznw9ohWwTIAeHWMr2BpeLH9KHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJj15GFvXZeFxUlDRJPYmS7rYjtIilbGR//bfKeTn2s=;
 b=NF4arr5yJG60p811OJw/+Ia6UEsZuvsmQH/dcEu7vOe8lPl3fC/8ly7NpSlGPD6Q/j0B8s/EjhZfzTgF0nW3x5W+tnuqa8Yy8niUYydcXogLZLkHfOHAgGOhJcDp6o/PW0Xd66U8VsEoDD6LdN0QK2kMp4uvR3WxT7Mm4hjyHOlm6KHHFbszVbnzKOYWRATWiB5mkcD/JbqCSgQr9AoosLwPOsOFZnibUk8OBfswfBwA5PwRJAG0Y3JCsT4ZEJL8bdtPd0+wKk/8TI1fsHU9GaW9UP8AvzBAiYmLC3H5v73robYRuDLOTe1YUNBv26o6QuQBJ4nvxJUKdCAXf5lyUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17b9c5d0-81c3-1ca4-8602-4c1bc7739de8@suse.com>
Date: Mon, 12 Dec 2022 10:56:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/8] docs/process: branching-checklist: Update it
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "ijackson@chiark.greenend.org.uk" <ijackson@chiark.greenend.org.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221212093410.36289-1-julien@xen.org>
 <AS8PR08MB7991A0C040E47BD98123953792E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991A0C040E47BD98123953792E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5adb11-38fd-4ee7-dd14-08dadc272328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aBoDFFIEu68W/u4hQFXBJL+fgpTdfkiAIlTYG5UMff/fuGWVNhYZYPAYTebF6hJzPxfdUs51BEeqz0I08Ti1Q9K5Lnr0rHj8Hg4OIXY2OjPbrR6vRAY6Pp8SP/WEnd+lm1/aXsPJHJ7f2+7fmikCICPWTIb+Rs5lHqZQBun/8MUwTgsiiCeoudKsAJ6zIkBHFC4ntdZVLnFU9OjCdx/mFpFkajaz/PuLktI0Cs3vuiRcLf6PjJy7PFoWDIuRKRqeRYKJkVtxxfUmOHKNdim1Xhs5VOU3v1ggG8+apIKK/eHjmUVtEYbvWsqzQLQNLtVgvRqsVJ8woo9JTWLg1V6ukptRWrJefsWsM+Ta7WOnl9L9Oov4iRw/OH6gjl3iqJzu2w+sTtfahm8fcT1kBb/2j0jRPI14TzFDrG2NTeZV/BIlROFV8LcHVCNvQwuAEC/1CmjU+r5hvrVPBYFSbpcUURnC7H+Hyyxjz7/taKuspCpHL7lLTWujMo19cDZQ8dcW+xiIZhpzy2LNx76AJdz9gVuNXQhxdOxvZzV9zLKicR3lOQVoVPvm5FjxIoyqPSrzC6fadMRwfjkF3WQJTnU4YrWJKebd3QhMTrLD3Njjt+30+enC/Rox3ffaEXnaQ47TtfmElcy/iNx4HGYK9d0StQ3mj1j8nWuOM2iBTEzVQYRwTKiwiCrGSBXHRayAyB9TmapY9Stom7Fvtj0+8amkQY1o0dSiLrc2aJ7ym8Vccjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199015)(86362001)(31696002)(54906003)(83380400001)(6506007)(110136005)(6512007)(53546011)(26005)(186003)(6486002)(2616005)(478600001)(41300700001)(2906002)(15650500001)(5660300002)(8936002)(66556008)(38100700002)(66946007)(4326008)(8676002)(31686004)(66476007)(316002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHRyMlZXK0FYeXc5RTNDNklyOGFTcmZwUGVZdWNRTTgyckExWEMvSGI5VnQv?=
 =?utf-8?B?MHZaN1RnYm5lOFgwUDhoMkMrblQ5a1V0K3BMb3Z1WnYxRUNmRTdvdkx6Yllx?=
 =?utf-8?B?T2U2TDFKeGtmSDNPeHhPdWJFdUpKaFJGeWJzeExtTFM4VGVLV1Z5M2dUM210?=
 =?utf-8?B?WUtZaW9MSnQyRXpvcHZ5Z2M0UEtLL2J0cmhRNTh4S1BFTEVJbTBLWGYzbDJ4?=
 =?utf-8?B?UGhJTlpleWRGT0VzdExOQjJtRlR5eHFKR3I4cE9GN0ZtRnVSVmRrOWk0cHNG?=
 =?utf-8?B?WjEyY2VsQXZtNVZkTW9YSDA2WWx6NjI1REdCWnhxNTlocDRocUJ4S1JxUWZV?=
 =?utf-8?B?K3FwMkhJcTYxWmEzUGR1MnczQ0tNK3VUbExWWnBiaWtvek5FK1hhcGdZSjA2?=
 =?utf-8?B?KzdLWE4ydldIR3h0SDdBWWFmYzRMblg2UHFBV0FDM2VIY3I3VG96Z1hMZGdS?=
 =?utf-8?B?cVViSnVnTDV3NFpTbnduUW9KcjZRTlg1bWpKMTRFOUk3MEorZUNyakJ1K2Rp?=
 =?utf-8?B?dGxFRU8ydnBOL0doSmk2bE9Oa1hzOUFQUVFqMFA0UnRmMndTQlE0cHQwdDhw?=
 =?utf-8?B?R3FvSjNkaGJ5NEdnZy9KaUJmbXFVZHNOSlJSc3J3WmgvMStJVHdvTFc2RER2?=
 =?utf-8?B?Q05xdm9zaTV5ckMwM29NNktlcDBrS1JNSllKSjgxTnVzdXlsbE9sbksxNHl3?=
 =?utf-8?B?OVltQk9uWkY5TnFPa0hZbDJqaHlDYmNpVUFPanpNUzBuUTJBbmxRK0ZmQ2lm?=
 =?utf-8?B?WEkxMXlZLzdSc3FCTUNVS2NxYzVONHVPeGVXa1F1WFgraUMwSGdKdlJ2ZzdW?=
 =?utf-8?B?RTQzWkFmQ21GZlVtL214R3pES2hBdEY5eVhNc1Y0SUlxRnRZYXp5eGF4bkVa?=
 =?utf-8?B?aVVvMDF1UUJvZ3NuVGN5a1hMUjlxWjNFSElOWm9JQjBBY3dCeG5tckx0eG4v?=
 =?utf-8?B?LzlKY3dPd0VJdVpMcWU1UENQY08yLzhXb1F2UWg2VEh2RVExNXErZWVGT21H?=
 =?utf-8?B?dk1GOTQ1R1N0Z3lsYUFoN25adEp6ZUFvazdUUi9qZmJHb2FkaHMvZElXTE43?=
 =?utf-8?B?cUtFUmpTSStNb0ZiYlR6VFpqcWR3RSs1clgyS243TzJPYStQc3pzUEpmUjI4?=
 =?utf-8?B?S1h1WTJ6RTkyS2krZ2FaeitWcTBFRXVmTzJPMDlwRmRrc21xSjgyRGIxTk9D?=
 =?utf-8?B?UHZHSzVHd2o1b2xhTDJ4Uy92bEREWGdXVHpmd2huZEwwdlZLbjJZSzMvZHl5?=
 =?utf-8?B?ckNaRlM3ZlpnNG0zUHFSK1p3TlZLOXJVejY5endVbDVya1Q1M0JZUEJTUlM1?=
 =?utf-8?B?ZUVlanl4ZS93eGs5ZUZXc2prVURmT2xqSThLa0tKRHZaRkFZTUM3RG9BZVpS?=
 =?utf-8?B?cHgxTkcwUld3VXg4MGwvVkI5T1lveFZkc0s2dHB6eC9tYnVyNE9WUWpHUWxP?=
 =?utf-8?B?dDhiSVo1YmhsZXFISkR2MmdENC9qTXp5c3l5RGQ4MGh0U1JsZ051S1ZmMkZK?=
 =?utf-8?B?SjVNQ1p5UE9Ka09nVUw3Sm44dTlVRnE0WHlPNjcyclkrazhaQlV1WkZZQXph?=
 =?utf-8?B?bytvVDc4TnRrdDlEOVR5d1JHV0ZyOXBjdnZWNjZUb3pBV1pRSFdRY3duTHhH?=
 =?utf-8?B?eHNkZ3Z2S1BxVnZsUHQxNGxZbzN4OGQyejcxMlpJSThidkNPQWxtMko0RUth?=
 =?utf-8?B?UTZXTlNPY08wUUg4V1BOZHNWaG5ETWpLTWRYZDZBeE5NZlI0ak1yNU9ScVhl?=
 =?utf-8?B?Yldta0ZVbjRkcGlldFVTbzBseitpYWpuTDk5TzljYmZaZmlsRU42YmxMaDZ3?=
 =?utf-8?B?cnJlYm50WEhZenIvVS80RG1PR25ZWTVpWnJYUkVjRjV3azhSd21lRkl0S2ow?=
 =?utf-8?B?Y0FhdHNMNzRudWU3WjFNN0RETHUveUh4ZmtZUXh0TUorRnEyL0RsZGlVS1ZD?=
 =?utf-8?B?YkxKaS9sL2ZwN1RLVFp5VXF2K1o1OXJtcjNrTWtaRVFhUDZRYmFmZGZIMTNU?=
 =?utf-8?B?SFI1ZllxN21lNTAvZEljUWo2eXc2a2dwTFVHakJuYndlRHpaVkhoZlAzUjJu?=
 =?utf-8?B?RFl1ZlZ3MnFzZHVYbXJWNERIZ2JnUVE2cndVc2V2a3VlZVJyU21wWDl5MVox?=
 =?utf-8?Q?O3Wcyl3C4YavLcUfPgPcYBIP7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5adb11-38fd-4ee7-dd14-08dadc272328
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 09:56:27.9312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLmTitU6Sp+4fuux+eqVsy7fs0c7X6WM1zihqxhRKbSulwijOe4dNE2IVT0B41IVUCkL7rqEHLBuYMeSR9k6mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7768

On 12.12.2022 10:49, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: [PATCH 0/8] docs/process: branching-checklist: Update it
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> This is a collection of improvement for the branching checklist.
> 
> Thanks for this work! Since from the docs/process/RUBRIC we are having:
> ```
> They are living documents, and no special approval is needed to modify
> them beyond the usual acks for commit.  They should be updated as and
> when it seems expediant.
> ```
> 
> I don't know if my reviewed-by counts but I did go through the whole
> series, so for the whole series:
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Why should it not count? Thanks for taking the time to look through
this series.

>> Julien Grall (8):
>>   docs/process: branching-checklist: Use consistent indentation
>>   docs/process: branching-checklist: Remove reference to qemu-ijw.git
>>   docs/process: branching-checklist: Remove reference to root
>>   docs/process: branching-checklist: Clarify steps to add the branch in
>>     osstest
>>   docs/process: branching-checklist: Reword the section about Config.mk
>>   docs/process: branching-checklist: Remove section about the cambridge
>>     colo
>>   docs/proces: branching-checklist: Update the section "add to patchbot"

Just one nit here: The subject prefix could do with adding the missing 's'.

Jan

>>   docs/process: branching-checklist: Add a list of accounts at the
>>     beginning
>>
>>  docs/process/branching-checklist.txt | 122 +++++++++++++--------------
>>  1 file changed, 60 insertions(+), 62 deletions(-)


