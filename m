Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868C1632193
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 13:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446567.702188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5ZT-0007yn-Oa; Mon, 21 Nov 2022 12:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446567.702188; Mon, 21 Nov 2022 12:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox5ZT-0007vg-Lk; Mon, 21 Nov 2022 12:06:43 +0000
Received: by outflank-mailman (input) for mailman id 446567;
 Mon, 21 Nov 2022 12:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ox5ZS-0007va-Rp
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 12:06:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe13::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5544e8d-6994-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 13:06:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7171.eurprd04.prod.outlook.com (2603:10a6:208:19c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Mon, 21 Nov
 2022 12:06:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.011; Mon, 21 Nov 2022
 12:06:40 +0000
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
X-Inumbo-ID: f5544e8d-6994-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYlUCWHbOHLKXVcGDhYsLpn2aHWqmBfHlxEMSVxBn24JH8VkBrA479gklJF+jmVP6pXVlDleJvyYfOUOMEJBWVkT2qbM5GE2s02tgaCXggrujQMYK3ZfVg7AJ3fUHBgZlcYUyPnhBNE60cc1Pp42kh0FAhaCAaqB+Z0tFkKuX6IHOXoRCJymSmh7AO7NgYKmuWDpme7wOzdNo8g2iOWE4CXGphnB5wIygVEGH/XYphl/cTtVQtvO+/nF1MKWvd+E7oQK6gJADND/UXISJZ+bSh0ljcjzZB2C3n2HGnn9mMRguAtAWbNEL9TuVMOfuXkF5JrhUag9l5ibwzdYYZZ0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfWqe8txZ8pTIPnXFfeSBoTDiYmJpnxz5DrlDj77Cnw=;
 b=WBG/7GBqKkPWICmg21vzuubj89rkqJ3eIP5SA3sV2Y8mH+5FqGyYd6nhWDxEbcx/srYSsdg/k0DfgESkUJT6eofR6kfOKMGum7KIgc3AYChYW8PXUUJhCyRAP5g1VcDLxAcDtMJUFcm3nQVxV04bWuoaVlVhm8fDwz+XHKMcU7Y0ucCzSlw33UiVOyAvckc5dhxk79y6bEpqI8IZ1b4kQch/D8/Q00WXP5aeIDzjRQUklwrUWjDXb4Fo0CNToGVZewYSmZVP4dNW5PfTcEcYTHm1Yw34T585KuO4mt+RvyENq/N345K3s8QQrB/TgnTrgfFs88eDOlUqAGxgyEw3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfWqe8txZ8pTIPnXFfeSBoTDiYmJpnxz5DrlDj77Cnw=;
 b=40pI6Ikh+hICoZWEIh9lZ6OjRFDp205xGWt25BCQ1uTDOzptEfvHwiZjk0Qk7h0fWQ3ho1hl3zMXxzCOI3NTEvCL5/p7p+/L1yFNnXJmlmKUIiuFlAfovKk83oasP25/ajThCpXKXt+5LCYhkIsqXSWoeXaqQB5iJIHZ4DBUllz2067aQfuJN0aVVzdaob3y8iMkU92egwvnlL66eqvC7CuvBCKRJjy6WxKG931fTND7NNmDMWJYv5NkoI+ov3dB0RhArSlaFd2hGjnagdk7Jx95/PtRQR/u4EsvGlkaAA3xdnFlWXKz1NdX/u7rN6pjZun1sujXtpQdlhmdF5jASg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cb8b2175-7d7d-8cb9-269b-f76d68369edc@suse.com>
Date: Mon, 21 Nov 2022 13:06:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <Y3eWISfCCW/ktjB+@Air-de-Roger>
 <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
In-Reply-To: <3add150d-ab4d-9147-005e-3f3160ec9667@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 23ea07b1-2abb-4689-fa8b-08dacbb8d8df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	655GfqNVrbFS6y3/tzvYYbaHvvvv3ystyEV1cdyOrNzt+NfNLkReDhpoFmg5BLoB1RFyicc8G32LeLOyuayWYTZpHKU4GTXJaTtn/br33++Gip0nToshLCxz0Fm4HqpBcKwTdO235gv8mFE/BK27zBuG/9yo6Z0UejIObeKQ5WLuIOoFo5lGkbWIYUttwUhzFiA6GwvjnObmHLDt+m9NWzGJf3D82XYrmcz8jsQ+psAzdrwAjWZ6Dwknc7zFHhLowONG5a8FBeCUi7oQ7LqH1k+CPXWHPFKs/r3JAJQ+H7X1Sn41AGuvOVtW66TVW3C4X8Ao/XVRZbFL1vsR1GrTSlOq8vFA8ebqdhx+35yqjajhXTQXuf1B6U6/04SwxClWqBSmO1o8BaYIagD8vCFWMVQ+UWhsedAU5kDCeOBj73PJ9BPcYn2GXb1bIn0tySfBnBCIhN7TJ6k8odjWMvBUQCC6aUTxgdlIAlofccm17TzVAvCLHKZYLuekyE/69BFmfT4oStQzHFSavomUsjFir6TF/eh4cNC8PC0DAwB/aqk2tBgQNmUg2fhjUeMydVAjGlqN+sw+YQgIA+8NMdVEqISAWDJEdtUiT+JIchdZmUPuBj3MaDACbmysMpUVT8+h9o4bNY1Q5CEU4QXovQUASVLm2YpZtdlZM+tK2T5zuRGMycc3rgb9RiIsiI6WfZdys3Ph5egkU8b7a7rPlJLTOx4XoUlf99uXx2dGet1GD3Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(6512007)(2616005)(8936002)(53546011)(186003)(26005)(4326008)(5660300002)(4744005)(478600001)(38100700002)(36756003)(316002)(31696002)(86362001)(6506007)(6486002)(54906003)(6916009)(41300700001)(66556008)(66476007)(66946007)(8676002)(31686004)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1FIZjVkTXNIWjVpNmk1NnFhSDBnQUsvUkN3QXFVZW5nZHVHeUc1MnphcVhI?=
 =?utf-8?B?KzJYSHlQODF3UFZ5UWlYNlFaMmcvZG5jYzQ5VXdoNElueksrVndvVWpNb05l?=
 =?utf-8?B?NG9NZXVOL0d1UDVLakNIQnR2SjRWQVZtc1ZZOTBUSXg4Y2pEQUlsWlg3RmM0?=
 =?utf-8?B?TXVRdUtPRCtHZUEyaWFlaUh0U2w3R0V3U1BnNTc5eHVTOHhyaG9KemlHMUxs?=
 =?utf-8?B?bVBzak1pSFcyM2tLMjUxeEpJNkpQTkZUOU9TVWp2bUlNby9XbUFlZ3UrdnlQ?=
 =?utf-8?B?UGQzbjJwWW9NVllFam13S1hwenZ1NHdudDNqRWp6TzB2Y2YyU2JIRXMyVTVx?=
 =?utf-8?B?VWU4eU5TclU5L1haeVQ2MlRrQ0MxMjFIQmRJNXRWb29rN0pjL0ZTTWVnK3c2?=
 =?utf-8?B?NVhoS0E3NERIc1BYUjNjNXF1N1IxZ2wyOUVOS09RZnJDTFRaU09rLzJPZ0NW?=
 =?utf-8?B?TXo3dUZlQ2prMHdQb3BCcit0ZTNYSUpudGNwWWJ0KzB1SW94aUtnR0dpb3hR?=
 =?utf-8?B?V0lNSzVuREpKMWF5Qi9xbEhOVElFWm5oRG1LMlB4YzkxTGQzbjRvWC8vd1Fs?=
 =?utf-8?B?bjBYUDBBczM1dllZUmVmUHFPTGVBWitDYUpCTkF5Mmo4R2NnK1ZLSVd6WUln?=
 =?utf-8?B?RVUxdFRTdmxkbGhSMzdxcEdtdi9ybzdpZkw0NUM1NDM0MHdEazdqQkYyTllm?=
 =?utf-8?B?VnFZcXQrTTl5TVZ5Q0g4ZHJEMVNkMjlCWHpoak5LRUpiQ0tYSE42OVFuSDYx?=
 =?utf-8?B?VW9wenBheWpHaHJNZmVoT2xIU0VFOGJPKzVjWUU2d3UwcXJvMHJaTDhFa3Bz?=
 =?utf-8?B?cXR3am0rM0dRcUdCbTZhdEhLcUp4TmJBTjR4TW9MUG1XTitKM1VQdmIzZHR1?=
 =?utf-8?B?c3dRYllkUDJkajBld25sbTZoOE5kSnc3L09IL243Q1lGSEtoTEpNSGMza3pL?=
 =?utf-8?B?c2NLcUUvUC84Z3dtbi8wSVdzc2pQVVFsbXpnTDY1c1VxNm03YWpBOTE2OFcv?=
 =?utf-8?B?SUxGcFNuWVovUWJtbkZDNE13UitPQ25NWWRLV1NNb2JieThrR1Exb0VVM25u?=
 =?utf-8?B?elFrdU96dXZPQlVKMG02SXAyMU52d2UvenZqbm9sRnRSMDdSOXNsalRXYWp3?=
 =?utf-8?B?RW5UR1pBQnpEdUhmZ2IwUHpmWXR0Wml1cUJZWUt6VlpjMzdvTUpHWitEM1p0?=
 =?utf-8?B?Q2lwVFAzMml6d2JTTys2SVhwUGZiMG4wanJZYzdINTl2RHJ6dE9TZHFKMmNp?=
 =?utf-8?B?QWxLRDRPcHRRWDB0aFlVOVJmK3B5YU0rVlRtTFZrSjF3ZktiVWdJVXIrd2ts?=
 =?utf-8?B?ZnVpTWhHTDRPdzczRTVkNEE1NlY1eTZjejhLNzJKL0ZpcG5tZ1BRbHdtbEpW?=
 =?utf-8?B?WEdkdE9pWklOdktsaVBzZ0pNRVVUTTcyTFpxYzBsRXdyeUtVSmluM1lpbC9n?=
 =?utf-8?B?ZjF3azRZSFlReWlvelJxRlRBODJ6eFQ3SE9HMnBxVmQvY0xCRWoycTlhSW5t?=
 =?utf-8?B?NkpuZUpXb3VYS3h3Si85Tnl4dktIL0M0enR6ckZwWC9XOVFoSTVVQU9zSU1v?=
 =?utf-8?B?cWpNaS9HY3NWaHZnMi9qYWM5UzBiMmoxL3pzS21VY3B1ZW9XZmcrbUd0ZlFP?=
 =?utf-8?B?TjNQejNMUVZEQk5MbkV1N1pUN25RMVByK3NvSFJjemE3dFZyS0VVQ3Z5d1dS?=
 =?utf-8?B?czdoOFlCVkl4UmYvc0FiSmE0S3J2RG9LVHJrS2Zwb3ZTTDVBYk9KUHp6aGdv?=
 =?utf-8?B?dmF0bzFjVU8rbEF4N2ZXcUQ0eXM3SGY1TzlTWnBGUHJuQkZCZGY5cU9DbVM0?=
 =?utf-8?B?UG5lVjVBVUFlTGNSZ0Qza2doWGUxSEhMdmloMkNoZkRKbUFyUGxsd3hiZmkr?=
 =?utf-8?B?bTh4WE5BSGJicUFldWxCaDFGZWd6eXNKejRaVDU0LzZFWjhOUitwTDUyNHht?=
 =?utf-8?B?OFY5MlZaSlEwQXNKZUdBNXJrUWNlWmNZMWh5QzJYWXVaWU1CVjVlWkMrWEJN?=
 =?utf-8?B?aHlWS1VVUnFvTi82WisxQitHS09QZDJwZTFYa0hKeExyd0lTNkx5d3pFNE9K?=
 =?utf-8?B?aDUvMTNVOWRjWmZXeFcrZlN4MWgxYnFBZ3Nuc0xxdlVINHZLYXdHMWQ5ZXZO?=
 =?utf-8?Q?Jca2ghZA6LwR2nt8ToHgNs6PU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ea07b1-2abb-4689-fa8b-08dacbb8d8df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 12:06:40.0418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbOb4x7A1E3YX39a0OVVH1wupCzXFMAiBkg+x+Ss8NG5k2SI3D4gmaMbmn2TBbj/sM1yPzvjqx/jlFfTMwl1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7171

On 21.11.2022 09:33, Jan Beulich wrote:
> On 18.11.2022 15:26, Roger Pau Monné wrote:
>> Maybe best to add an ASSERT in vlapic_set_irq() to be sure the lapic is
>> enabled, as other callers already check this before trying to inject?
> 
> Perhaps, yes (once we've fixed paths where the check is presently
> missing).

Actually - no, such an ASSERT() would then be racy against the vLAPIC
being disabled elsewhere at this very moment. It would at best be valid
when done on the vCPU in question. The SDM also provides for this: "The
reception of any interrupt or transmission of any IPIs that are in
progress when the local APIC is disabled are completed before the local
APIC enters the software-disabled state." We don't follow this to the
letter, but you get the point.

Jan

