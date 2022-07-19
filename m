Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998D57937D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:51:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370388.602127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh4t-0007SU-4E; Tue, 19 Jul 2022 06:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370388.602127; Tue, 19 Jul 2022 06:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh4t-0007Pn-09; Tue, 19 Jul 2022 06:51:31 +0000
Received: by outflank-mailman (input) for mailman id 370388;
 Tue, 19 Jul 2022 06:51:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDh4r-0007PT-6F
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:51:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36764033-072f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:51:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4864.eurprd04.prod.outlook.com (2603:10a6:803:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:51:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:51:26 +0000
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
X-Inumbo-ID: 36764033-072f-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbiE3zWVC5WVler8SD89pel9wCvicZ9R1afzRi8659kChHWxmLiiaYpi3rsRei5wW/QBNodj8k6PXqKHMdHYbSBDW7H+GLBpO2XcoGFb26Zv934WYXq8yOpdK8vMLi0qjfmxiJXYwVenQD8S2KFjv5HIDmfUEgb5UBOM6m2Z39m2ZySD152/aGRdnlHTQ/+Uqc4FWiP3bAyxuheuHt+cRdH/HJrEysdMdZCCBXwoGKyH5JyCglrFaKb/b6Yuy1DSBuVxUtA7v8VuE2Xd07Ado6B4gz+/oF/8P3ZDII5NmpHWoSIvq8H7CNumRGL5JK3yfgXVa5/SNia8K2YPGPx9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=paHBxFxNPQQaCR96HVsNx65Tk5J0VvsjBSY4OoT4Sio=;
 b=Hoh3lq6XiDGPbxbdRPnX4ZUDdj9Bw3XDgWqBsQsBiLHGOXvMMRm+1hRGxU+fXVE11h9gMqFLTXEJdHcXvO+GJ8D/t1nL2Zf3swuS8/yl1NA43RxfDZBDYC6hb98rihtD1dGCLN38rB26jqwp1p6iT9IB2eqL/e/7T+L5ODoIf+YCTxVljja1hgTsSFMv4mr2VI8FA+on2Qs/EfLwq0HzYgdNOuH77j/I65SM3j9+xpgAW/mmPvcSyUmiifS3MaTIpRPO9T6WqRqzCI3v3Cz931Dox/KHvXiGE4+Vie/mDy1CLOj0BtgRFwlUvwpHlC+03/R9m/BpuEeYxyCr6WlUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=paHBxFxNPQQaCR96HVsNx65Tk5J0VvsjBSY4OoT4Sio=;
 b=1XGyKKJEsBeixiiMEm00aG6kStOlKbmVNdIyRbbTiN6ZfWvygDIfv+nZWP/1TVyt+YnOBXyP1IKgSz2Hq4GKwdTK/ORRu/fwdLOvbDzO9VCDIAoah9bWDN/cB9fHaHOckko3v4CCzHQeIiBKLPLAkn/4szkQ+F+NGjYnXpxcL//fFZJuDwQbYSLAdocZ2pGXs5/Z9TbC7OC8pGE4+Ks5fM4QmsFVs+WTrzNyZDg8jTnon3AXeIedHrjCkKe4Ls/FvFKIB+HwhocMixwzlee8OgnIk9OLtVq9dY9sLdLGZzDDeGyLezpiZCfMBgaPzF6oiwnI2GV0FbAtZacJxltw3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b55e3048-7414-1b8c-67b0-83669190c985@suse.com>
Date: Tue, 19 Jul 2022 08:51:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH v2 1/4] x86/shadow: slightly consolidate
 sh_unshadow_for_p2m_change() (part I)
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
In-Reply-To: <1c14781b-e1a2-e049-c0ea-a12585f74e7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87e014f8-376a-4d6a-631d-08da695319de
X-MS-TrafficTypeDiagnostic: VI1PR04MB4864:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mVHgulCKwys5y/cLt2vGebB7vgdTFuGxVRrMhC0FIBsC0ndpq1z4GZ1hqw8RHTEbgxsbMToSK86AkRNiERLLGnCy/m8FfCTWx1aLgKjQ8nonJub/SNI/2/qQF9EcL9whovZuPypyR/JgHx9+3/KAppuHwTncD4JbwchRpNUYTy9GOJLMllrUyw4Dlw17B3lpegYdukwDUH4d8x9+P/cdrVLuOCGGSQZzx/FfXTAnMacATM8vYwwO3TEig9Y/bw+UdfIY1bVkycxjoAhKUzVXF786fnFATYqnq9VhZtfKAxJt3GRDUmBn6Xm0/dj/bhWEXqADVxLj1xsr4RDlevc38PVK/E0f0VTI2W18p+kp3Xra8ttmyt67zLV+3/JYle/AG9nqRAR0oOZ3AhHxhtgprQaz+glnxVJB//JreGOh5Vj3Pt4c7KiDzRZ77HJ/uj0fmpVuRQGFOOqjW8SX/LkzgKAZQVPhPRGpHi48X/1U0nuhrBJVxSR/pGZmzLQS2qwSgLby2mkpXlbRCkNwXrlgaKRU6CzHJ3cmXKS2TOjxQi2FcreiNv+sockyC55xzUCWljrvb9s6mu45t66VAz5InC5jTt5o99Tf+L8uGg2bsHgLp66sCuceDjtV2nvuPODi3ZdmMLrIeDrEmTHesxB3Y6S/r9iyw9qTFXBmTtYyumbWw/378ExHLBFHXMQwcbNwjvHTbqxBZivWIcYBRrOBQyXpdpZYANYKwWeQLMT3PLtYyInVunD5Wa6CDCVFfJjA9cR+EpVTJwYgznT7Q6dH6zPMrr0V0Og++W3gHBTidvpKAqANYb3rfupL2HenqG72YxogLzks4mxFTVpyuEPcem+oQ2LQXlqwAxriwaepu8k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(316002)(6486002)(478600001)(36756003)(31686004)(41300700001)(6506007)(2616005)(8676002)(6916009)(6512007)(186003)(5660300002)(8936002)(4326008)(4744005)(66946007)(66556008)(66476007)(26005)(38100700002)(2906002)(86362001)(31696002)(54906003)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEYvSDA0S2REUEFuOXZaVEdLMSt3a3JDN05MQ2VBRVgrRkJpUzlHRGpUMUFs?=
 =?utf-8?B?QjFjQm0vWWh0UWRzOWJOK3hhdFZvQ1hSU2EwRzNzV3A1NTIzNlQ3eVJ1K0ZB?=
 =?utf-8?B?bWtJUk5uU2N2dXE5eXVCNnhoalZacVQzZ0tCVWFpTGp5RlljUk9UdFJUQUE0?=
 =?utf-8?B?akQ5dGFTYkVobm9td2FISUUvUGowd01tNGwvSDZIeGF2dy9jM2l1bmRxMDJH?=
 =?utf-8?B?TUR6VDdPTEI2SFY0aUpCZ2RDdWxTNTlXS2I4TWJ3LzZGZmFDeHdVNWJQUGNE?=
 =?utf-8?B?aXZxYVlFVWxJSmtUY1hkYlVYY3prOUdKM0ozeEY3OHJCYWRhK3J4MmF2cXg0?=
 =?utf-8?B?MGs2RktoWkpwUFQydjAwMXJBSVFsNy9QcWtmaVRVc2xJV0NySWFoSS9qZmE2?=
 =?utf-8?B?Q3UzQmx5NWpDVnFyMjNDcys5bkRMc1E2NElrLzQ4U2t0N01LdDFrcWVHZVJq?=
 =?utf-8?B?YVBaNjJwdUdXcW9nWUVpZ215MGUrWGFCd29HVHB6ZUhweUloZjFOOHlUSkcz?=
 =?utf-8?B?RlkwYjFJY1JTNTZ5SHl2YTd1b0NtbnRLdXV5alhjTGNHalJRWEExcktJSDFY?=
 =?utf-8?B?NUF2amFaZ1lhZ01maWpPazJKUElXdUFzMkRnOUcrNlVzZ3V0THpjOVVPdWFN?=
 =?utf-8?B?c1luMXpYdTJNL3ZjVlgxdW5kMEx0WDkzZ09SYVd6cU9QdXJYc3dJTVFJbGha?=
 =?utf-8?B?QVhqQ3BDMzFoOHNCTE9mYVAzajU1bWdDbnhrVWtpMFltNzlOYStZNEc0dVlh?=
 =?utf-8?B?Vk9ZZHcvRndJcVRkdUJtN2ZyUVQvTVY5WUcwWDBPaWo5Y01XNWVjUnkyMUxE?=
 =?utf-8?B?bnYwTWpnOTA2YWhZQmZyRE51NEpZbVJMbGxVQUR5cTB2dlorbmRZdHh5NjBG?=
 =?utf-8?B?OHhRLzNuYzJEcVM4WTdrNHgrTGRRelIwNmxMQndBNmE5QmZjNUVtZ2xGdHVN?=
 =?utf-8?B?MlRaWUhrK2s0bUtybVlVTThOZXNNdnhkNzFZT1NlUHREbWk3MUNrbUFncGV5?=
 =?utf-8?B?bXNCZEpzZmZKY2NxRjcySllTT203Ykw0MkdJVExUM2FQRWlBK2FQemp4NTdC?=
 =?utf-8?B?cjYxb2JLbW9kR3h4K1RtNU1aSStsQVVwTzBFQlpmWWp1MElGWEttSjVIbDY5?=
 =?utf-8?B?b1hWdGhOR0xUNU1VQ0FndU9PUjNyZVExYlJ2MUhwaU9MTUJUYXFnSU9MaVNU?=
 =?utf-8?B?T1dQUmg2QzRLb1FFUFdwOUZLYlRsTmk4d3BXaWZicDdtOUlCQkFBSGd5SUR2?=
 =?utf-8?B?OHpQMzcrT1l3L3hUT29LOXVjUTgvM1FDZDh1dDI2TzFxMjU0NVZkbWUrTlZI?=
 =?utf-8?B?VlZuT2lhOWpjai9JNnBWa3kwamZ1ZzlVa0xneHdyKzJyZ08rSzZobWN0KzZK?=
 =?utf-8?B?OHpFVnJoSFM1ZTFzczB1OVlJYm14aU15cmhrTVB3UjVsU2twdlhoYjZNdm1a?=
 =?utf-8?B?Z0czOW1PVXF3K2kwd2xST1IxaXNrN1VwZG1EZDJ5NTBQTmszbG9aVnN1SHVB?=
 =?utf-8?B?MnI0Qk1RMUtlWmE3dE05K292WERCcElLbXpDc0NXcDBmKzJiVERxbE83SWty?=
 =?utf-8?B?N2pvRGJ5dmpoNjBHYlM2QTZOM09WMzVjUEhnblhmU2NLTGhFK2Y1WHkrcVRD?=
 =?utf-8?B?NDFSa2FyQS84Tkc5dzdYaVlkbHJYZzlrM09sT2oycXZQWlJ5dDdBcStvWGNV?=
 =?utf-8?B?d3ptSkphSXVjRHNTekxnZmcreXBhZ0QzL0d0cVdHb2YzMXVJWExlSGNveitt?=
 =?utf-8?B?cFQzZnhxL3RUNStUb2NaeElWQ1ZrY0RibEZSaXBIK0YvbFdtWXgwU1duNUlJ?=
 =?utf-8?B?M1ByRmF1TkRNRVdxcW1BOS9JK2xzeFlVWCsvUVpSeUxaeFNFTUtwT3psU3hM?=
 =?utf-8?B?QTlKNzdLaHpLVGJ1bnd1bzdyUDZtUGdnZXhreFIyV1c3OHZrd1Vqd1haVk5X?=
 =?utf-8?B?M2g4QmVuNTlFblZOUGd2YklJS09pVzQ1ZVd2L2xNMU9UL2lBZlF1MG5iK296?=
 =?utf-8?B?NVJJUHZMWkFPTmM1ZHF4SHJrMHQySlpvN2U2T3VDVlcwSldZNS9VS3NaS1pp?=
 =?utf-8?B?VFdUR05vcGtXTjlKSzFPNDByNEZncGhVOVk1SjJOYnlqQkV6UVp4NHNLdmEy?=
 =?utf-8?Q?vbMuBQPf0/u4bLl/afNx6BUYy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e014f8-376a-4d6a-631d-08da695319de
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:51:26.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7k6zspi0qjbCukCaEefeeFZ/JIVbXv7Teb2Mmah6Bbq2fg/eRNNOzyulegGstxpIaEFYQjHs+gV+VtvH/LXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4864

Replace a p2m_is_ram() check in the 2M case by an explicit _PAGE_PRESENT
one, to make more obvious that the subsequent l1e_get_mfn() actually
retrieves something that really is an MFN. It doesn't really matter
whether it's RAM, as the subsequent comparison with the original MFN is
going to lead to zapping of everything except the "same MFN again" case.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Split from previous bigger patch.

--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -856,7 +856,7 @@ static void cf_check sh_unshadow_for_p2m
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
             {
                 if ( !npte ||
-                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
+                     !(l1e_get_flags(npte[i]) & _PAGE_PRESENT) ||
                      !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
                 {
                     /* This GFN->MFN mapping has gone away */


