Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBDE64B447
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:36:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460551.718480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53Zd-00034N-8i; Tue, 13 Dec 2022 11:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460551.718480; Tue, 13 Dec 2022 11:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53Zd-00032c-62; Tue, 13 Dec 2022 11:35:49 +0000
Received: by outflank-mailman (input) for mailman id 460551;
 Tue, 13 Dec 2022 11:35:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53Zc-00032W-FA
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:35:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2047.outbound.protection.outlook.com [40.107.14.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a14e960e-7ad9-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:31:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Tue, 13 Dec
 2022 11:35:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:35:46 +0000
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
X-Inumbo-ID: a14e960e-7ad9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGMHQXyQ1ueC6A57xCDdvtXVzv08bYAOM8t5llCZLUQbRel/aO9X2+4JTvxwVKZ7+CwTpfXgJEQYeVi7FZRoMgw7+QqIAIyK5fjmIpFIGTsoQLc8ZZfv/EabPnZeE65LdTkVXuhkIux8IEagE+LEo8d80GJhP2F+WkQnDKZFJvmYoax3qc3Uln53KwtyBXTb8z/IpK3b3HSynBWiBJUKvKUSzyVZ3j7aSSV/vXVotflUkQwi9YFnFlLC2zGiQ92qJviNbvPE0HFDmkP+QP4sYB392mVWyY1i5UGz1MlGfFYwdROx3J992IvUKjcb+0SkkMAC429ZIvYQFH6uR097EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43ZenRijF+5J/r/Cm44hqql35sA/6bKvw9e+vWf6plc=;
 b=j6pOV4sxoiHap1rMsL1LP/77rp9xRp/nAZvIfksUnIKA4qPxkf1rDe3juvwXss/KElK9H0v4nhqyGwQ2PfKvpgd72/2+bhBfFT7b04t/AysZfsXZS1B1a94YJKanUfaXWRGG4r4kyaiaD4z3K1VUfE+2q6YNqbRHhhOAs+Q2DitnKqvJdHuiwbeapdtdV7ztIPeCr5/K9qvqd172hXmI1mgQOUMC5DeqcfsfdMHJj517+32KRw3OuBQvoFu7i6v4HKKPiPboyUtVit8NVJikLSc6YIooDJcsOFyfKPav210SWzgjCa7DDH4gsdeNP2r5uorT3Fp0xTI7pywWDzEWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43ZenRijF+5J/r/Cm44hqql35sA/6bKvw9e+vWf6plc=;
 b=tVChMcBv7V9Tt+57NUBxGyVCN/KcTZCEa57dVZWhKBZnheKdj92IOlE095UQMwN0gluudJPsS3NI3Amd5rHylPU9dGMa0hmOJNUwbCckgiVmZ5KAeiExmVYdl/ubfb5ZkbYgdXTktNd9dTJZCWES8fXzY8OT4C/L6d6kKiKeENxDxSknf6G+AAmTeY7UTId/Kw746RVxe0iPV6KtmErIzJQACOTVf4aDm5q2BCwLO5WAklwBJpbV6fjh//kFfkIPTEDTbXm1ntweRNd8CGZIuKVUIcr2tFlUae4zyBwbsb8U2xY/SCgDuwca+oG2OqHHDOKxJUNksCasxfcMDp2sCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
Date: Tue, 13 Dec 2022 12:35:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] NUMA: phys_to_nid() related adjustments
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 897d9804-7a34-4a66-a9f6-08dadcfe2cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WwrglpvxEc6SSeYQ8msDKZARmo/5GxrI7ncCBXC3YzWEtWuzMiaitsTuAemQPO3ZmqPTaOG+cGOP5PTGcZ53t5UKbzWt1AOb55fLlPiHTwGWO2+M4jEyBUuVjfROgeUmspAJhE2t9EmuZTRTIiVGaxy/mEJeNeGDqqcrakZFoTBBnhRcih/7rx/MB4Ualrj5OCgMylR3bh8SZpSkhtmgKvdy8IQy5hYIH47nhanP2yveMHbOdYBfJ90oHO6ndPT82nLBVNT5pCaIIbJrNaFXf0qlSVhhY5qYOj5W/eLyGxuSUvvnt48n0Ib84siavBFXZhGEcO7dzXIllgZK3EqC773LFY/oDcgGuPYUwpJl1K6fihVkCzOhVCEzUCObpDORIQXU6HrMJdlVRFjE+Sy+JNVAdIf/5NelwrkGuBRBymK+Kqak6YnuhFNvfdfPIhsQP96nsfXXOxwyh7XhlthEjg9Yl+tx6pW7p00/y7CDEOo2kMW3ovzHQqrxpyqJpMLIQOFh9Uo+ckIS9ANHvcNUd7paKfZvfKwkeH0ffOz1raxGSHbZCtPDFen2kSwww5pBaDhKJBmavgi0ATAcyXXVzACSDZ1IPaYaoOrOHQRJIrVsq6n5yc8NesG1u6CigmBiXRcbCkvd5u8y/ouhtRuIyNEmKQ0M1JrB0ZxB0AtZewEBAF3eZWwWZlJcL9OjLDqz4CVcQ5CNpesmmp5mrFh3UdXaYISDG9J0GW3tDt2ma3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(31696002)(86362001)(36756003)(38100700002)(26005)(66899015)(186003)(6916009)(6512007)(316002)(478600001)(6486002)(31686004)(6506007)(54906003)(5660300002)(8936002)(4744005)(2906002)(8676002)(2616005)(66946007)(66556008)(66476007)(4326008)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkJZSUNIck1EczFPRmNuYVRHajFySzB6d3NZMDVVS3JPME13ZFowMzRzL0Ez?=
 =?utf-8?B?cndBa1piVkJKYTdIZ1htbVdQUS8zWUhNVXlDK1FiQ2J3RldvRTlqcUNidDZJ?=
 =?utf-8?B?Y3pVaHZDZ0p1aWJNdlRGMzh1Y0kzbnU5dXBHajdEdldrcEM4WE1Ib1ZYUXMz?=
 =?utf-8?B?ZDJLN3UvdFZqTkFIbTN3YWszRXRVSmR5US9lWDVzcG9nc0lkaHZGUDRocDRy?=
 =?utf-8?B?R0RYTmc3LzNHczdQa0NwOE04ZUNhQ2xkb0w3RzhlUGNERmY3MHRNaEg3UjM0?=
 =?utf-8?B?bEp6dlE5bm9uTWxPNkJPaklNTkdyRkRsZVNlc2hGdmpTRmRYQnVzZFFEZEht?=
 =?utf-8?B?bzhsQnZMQUFldjA1Z2huQVdnSjlKM0RKellIRFlSY2lMb0pMS0JjOVRhWHJ0?=
 =?utf-8?B?eCtsZ3lYczdXNFR2c0VPcnBvNjl5WmVIbjBnL0hEakowR3V2elZ2ZWxHS2JI?=
 =?utf-8?B?OFhPZ2ZqOThBR2w3WVpHZGZHcVZyb29zd2QwdFAxbTFjVE1NZm50Z2pLOUtN?=
 =?utf-8?B?cG1OMjdmbjk3SFUzZkhhNG9xRmttSjdoMG4zdzlzUnBtWGRDbW8rZHAvRHdH?=
 =?utf-8?B?b3MyRVlJemF0SjJEZmZ4QWNOOURBZFJiVURzME0yUHVIaWFBeWlxTmJOK05x?=
 =?utf-8?B?WGpXbGJ5UGtONzY2Z3F6ejd4MUxIcXpmcDZ4dU5ISUt2aWFETnkzckh2cy96?=
 =?utf-8?B?MHdrRGlKTkxteGhpU0JPODRDTDYzeGNDTVlIZERBREVnKzRpOWZUNDFmRzdI?=
 =?utf-8?B?T0dSYnRIb2UxSDBRVys3OFJqU0QrL05UbWlzUlZwcmIvcnppdUx2Vyt2YzZQ?=
 =?utf-8?B?OWl4aS9QM2l0R210ZExlejdMREt4TVdzaW1KczN5N0pQcnhzMmFKS0dqb2VP?=
 =?utf-8?B?MTIyamJTSUd3KzVGNXhnS01WL1IzYURMU1p0b0xVbGtkMWpxYWR6Q0xyQlVn?=
 =?utf-8?B?T0RjOVQwdCsxY0VMc3NDNDZOendIMnFPa1pjRWlnalNCZm82M3ZtRThRbHVR?=
 =?utf-8?B?MmxSdXlHeXRjZnY0NUdiTm5zOTlWVEc3UXJScUdxdVBHOE9KZ01Sb1lOWUlM?=
 =?utf-8?B?ckxNaUF4U1I2UlY0TW5BQThqMTRqMUNNTE04YVRnQnNIV1k0L0JueTlwN1RF?=
 =?utf-8?B?eGdqaW1aNFcrVXp0elA3eXNRdGk3QjZ5UFR4R0g5eWxKZTYrQUVySzdINExu?=
 =?utf-8?B?Y1B5cG44RFFxNXVjelQ5NWhkVmU4cVVDTUJSZlN1RTBtNTN5K2FVQk5VUWx6?=
 =?utf-8?B?NW1oQ1VZRnpjdkRMNW91MzVMdUpTNjJhSmdUS041aVpGS29SRTd4d1RJR0ll?=
 =?utf-8?B?SDVJcXBPTFNBTFo4VWVDMkgrTXBFQkZ5UkpnUGVlU2lTS3J4c091SWRMSGY2?=
 =?utf-8?B?YlpTOWUxclR5SnBHU1d5SjQ4Y0JjQ1dNd2RwVnFneHZWVFJSRTFxVUgyVXQv?=
 =?utf-8?B?ZjU3WlI0dHBWa1ZyelpDREVNeUNDOUtURWpzaS9vbzhSMG4rQ2YvME0yS281?=
 =?utf-8?B?SkVaSUZURDVzMGg5U0FzWEVEaENvSWkxMUlMNUJ2Y1I0bUVTR0V3MW1lOElU?=
 =?utf-8?B?eThkMCt4YUk5eEZXbkhMQlphZmtSWnFNb0xJdUpqZzRQUG54ZDMvS29PNGlz?=
 =?utf-8?B?bzErdXc5Umdlamw0MC82NnVhS2Zzb29pazUxTEswM0ptdnAySkFWODdxUmVO?=
 =?utf-8?B?Tkd1QUw3RXQzeHMzR1dReGM0Q0xmVlZnNEloYStFbzc5MUtsTzNWbHhRbWtQ?=
 =?utf-8?B?aGQ1aHFmNWt4dzF1a0x5elNKZFU5QlVtUis0WTlQZHVXazY4cThZcUEzN3FX?=
 =?utf-8?B?a3FEUStGdWhWa1pYaURIcnEzdlRrbVJyZlpmS25HbkRTMHQwTEdHL3ZrcjZw?=
 =?utf-8?B?SXBXWWZlajRpRUErbWVDQzl5U0x0M296ZU4vd2ErUkR3OVJicEtpNFJIUk9J?=
 =?utf-8?B?d0NnSmFjUGdaNS9UOTRzK2YveDZKN1pPUUZBaWRJWVNidnBZazRHa3g5Zy9a?=
 =?utf-8?B?d0U0cS9WclVVaWYyWjk5QkR5NDlaRkxaQ3F1WnRsb1Z1VXZnRlNDVlozWGlM?=
 =?utf-8?B?UlkzMlBKRTBsdzd4N0dmbFRYdUYxSytDWkZKbW8yUjdmRytOckw3bGZiaXIr?=
 =?utf-8?Q?VIPSNzPYkfU0B2+XB4cV2Ydrq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897d9804-7a34-4a66-a9f6-08dadcfe2cd4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:35:46.0003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bweubIQOcI0uL3p7tINWJR6PpgbTf3VTuBpbvBHqgzcWy46I4TG0G56ZB+EbXoQ88L//5znoj5nJBf0UWsl3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

First of all we need to deal with fallout from converting the
function's previously dead checks to ASSERT(). An approach with a
weakness is proposed on patch 1; see the RFC remark there. Plus
phys_to_nid() has been somewhat inefficient with respect to all of
its present callers.

1: x86/mm: avoid phys_to_nid() calls for invalid addresses
2: NUMA: replace phys_to_nid()

Jan

