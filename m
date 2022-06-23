Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CACA557913
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354858.582188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LOO-0005ju-CH; Thu, 23 Jun 2022 11:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354858.582188; Thu, 23 Jun 2022 11:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4LOO-0005gq-92; Thu, 23 Jun 2022 11:53:00 +0000
Received: by outflank-mailman (input) for mailman id 354858;
 Thu, 23 Jun 2022 11:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4LON-0005gk-HJ
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:52:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 050628fc-f2eb-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 13:52:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3523.eurprd04.prod.outlook.com (2603:10a6:208:1b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 11:52:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 11:52:56 +0000
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
X-Inumbo-ID: 050628fc-f2eb-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzLKvHpmFQhkTaNa4Gb4i/K2/P7gr/7zWwtS6ycAtmCI7GR89LBj2Xt/hPJerwy3dvwqDG6i+SZQlPO1fcjCBvcO/vepvmSv1zjOxIOxM5cBLcgv5n7HONXFkNEDdmMKvnMAPbkmf+k5N318WykNhrhDXjpXf69BqUFyViLi3XBZpu9rbh6LejFq/UDgDE4Ae0E5x7VdRCxMgzjfxz0eV5VkxCTvlkc7A/CC6Mah/8/U99/N2tSOlR/E2e4J6TDzFAfs+OxC9YZvC4iWPBBhdllIzx7rZEJBM8mB5/ywai9XHq2wR1znWLlnPatmXp+KzfbtnXb6qhUXCgcamVpERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfA+KoDOZk7fiA1yr/ZaD1BDBKAQ3tEWWMbgEIRy8qw=;
 b=hJsleS8279hdVDknHAWgMkXhaS8/AQ+ucEyYvKrxK+P5Kt5/Q6RLe7D5Lk58jTgaNifeC75vnenwsznI8DhVe2zm1MdmfsgrHjejT1TV44p28V0W7AWwdWOsqgb6LXjEvFsuv47mZVWq2WkNU5XXl2g1fg1VxUsU/UKgq0PD0PeUhiqtSWJCvk2XSsRecIc3dpEjSNYNfEc1Zc0BWZZc3mtDN7TeRaNvR2r6PwL0zqfn38NyTkZs7cPEqkfNoFKapXbccZfHl3C2X/dzsiLBTrkKlZSSmFaQCmmFI6EDgs2EStEEqcG03Hsp89+YLgV8KqLZ0XuWoD5Uc4GL1Noz4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfA+KoDOZk7fiA1yr/ZaD1BDBKAQ3tEWWMbgEIRy8qw=;
 b=s6RUjtgFeHOE4d5rfGtnCOX54zoUfP5Nqd/JpeNR3QN2SwFbQI0bC9c+I9oCV230VZQa3sfzfuqzoBfJupKdRzl4PQZ18D+5CMH/n9BI5tJTmYPbwcbD9LXElpIvByGrJwNhkYsS5uQQxcUZbR19taDN2Qy4puT/6f6vptna6P10dqHcSiq3teRs1z23w1dwyEtDEmuY0EJ8tAlU4Pq2CeAK0+0bISwwuX1H8TpTlsiblPktAd0nj8cQjp2PNpRL0QpzXGHopYsysF97i94CmEGU5sLfUS6C1oJRm2CcbWHf8YowWhuWpv1tJBITZQ6kM+nNkEJ52a6Lm/ipvSnAtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d6c927e-7d7c-5754-e7eb-65d1e70f6222@suse.com>
Date: Thu, 23 Jun 2022 13:52:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/p2m: type checking adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0510.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3bc9484-6a07-41d2-c1a3-08da550ee9bc
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3523:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3523AF7C51512051A3CC6FCAB3B59@AM0PR0402MB3523.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TVnaUEH8/7L0W4Vf6sO9OU9UwUBBQ7qpHfFT00AKb29S0Xq15upd793LWaJOBggo8YadVNAVowVUQVGTOJD43vHnqSLjZNHk5LWCEh65p9ll9FsQ3U/MakNW8F3ue7WCtbIV9XgOZb7LbhSZdC5zfzzKMvGrabI+BW9aRd2NDvtwdZqYcOKO/vzQhuyIXAwz2DqsQGcse8pT/FlTiI1nNA3SH+hPqZUwQoW/VlKi/bmu99Zw5x7BdpzNhAxH303d9fT8fp+8D+V1OExKVR1/h2+ZdA/KJbs7br61cn5JZycZP8PL4m6LzBZQoPCEptURLX85GhSXcK6XaFVxaQveG67JM+dQbbtPINOKnRtYaL6rbp03uHCg7VnfbZsUP/VeTc/xXmHcyRq7lYS0LLi8UyBCY4vzyInJgT73ySKWFKyROISOsDQs5x2M5zIa25stFNQgfOkXx+kPFoU/VXQ2v0XJMjhfJ6UjjXM+OZWrRJpAAgliAMminNS36CxWS3DPJ2vKzIZnx9k2AfNsxYeyHBcLPb402bABc8kSGXzArKs1aD7P3F+vkQqkgzLWCOGiFWWK9H7ZbgcAxB6Ho79PbEsEmUrQqirjurRHuk6GWcDcQ+0dVczzQYqOpZU95gNHC2pXwtMw0F1veDpiH9f6UQC6oAlfwKn5UyLyo+qW88x4ZEDS9JOQZXZ0Htf/iCsal3Z1fhswEfHkwxE8lJFFWL5S0qbVCLy+j1+LgtmriCITFPLADUUBC8OJMsAfjAv+mDZAWCVsMULFdUl29C3cnfYO599Bf47lAvodOQAfRRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(186003)(2616005)(4744005)(5660300002)(38100700002)(8936002)(4326008)(66556008)(8676002)(6486002)(66946007)(41300700001)(2906002)(478600001)(6916009)(6512007)(54906003)(26005)(6506007)(31686004)(66476007)(316002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm5vYjFaYjF4YTk3TDZZdUUrY251QVZ0QStUeWYwY01ONGlsVENtcXd3QVpM?=
 =?utf-8?B?Rm9IcVdLQ21EWTNBaXl2WXFsK3o3emxPMTQ3T2JnRmtiNG5jbXdLOWY1dDBs?=
 =?utf-8?B?OEhrdzY2UDUwRHl4UENCOWxJSGhZd0pmWE8waVBzZkxrZ0c0dGNXSk9tbmxx?=
 =?utf-8?B?MytpZUdEUXZVdU8zOTd6TjVPVjZHaWxWNmx3YmNMa0NTbnVTK2F6c3Y4Wk1R?=
 =?utf-8?B?WDJWQUxWMFdTUDB3Q0xiZjVjaURtSmRZSU1YTmdtWVdFeWRTeFFsNVhGaGZ1?=
 =?utf-8?B?ODNaNG9aY2kzODYxZ05hQmtHcUxHSG9WNU1ucUN5aTlQTFd3RVhKcTllb3VB?=
 =?utf-8?B?Vm9HMGx3bnRRUkJBbzNBdDB5dGFCQzMxdE9tem1HMHpuSXA4b0JSVXZIL1B6?=
 =?utf-8?B?djZWRDJJSm1MR2J3Qjh1eEQyMlFvQ1BRcVZMci93bmw5NkZpMVhOQXR0bnBk?=
 =?utf-8?B?MFQvVmpmbTQ5WWhUd1JnZjFwUDRDMGFyOENpa1RqWkZRWCtEZjlQMVhjZ0M2?=
 =?utf-8?B?YnBBazN4c1pMQ2k1L3BQLzZmVWx1dzE3RVVVWm8zWU9QT0VqZjJvRXB2bngr?=
 =?utf-8?B?US84Y1lsR0NqZjladjA2MEl5ZkNNYmlmeUJ0VHljQzhuRGtBdWpVbVd5TXc0?=
 =?utf-8?B?d2FaRWdIQXVHaVF4OHlqL3NjNS80eDJSUlJFRlVnRUgwS1ZGVWFuOFVjSTBt?=
 =?utf-8?B?dFN4SktmL3VEQWJaZ1NyOGcvUlExb1l2dWt6RGtIT0QzRzkwMFBhVEEyUXdx?=
 =?utf-8?B?MzMvUFRGakhjUVBlSWhwVU5XZXRHd1BVYWx4QjI2Q1RlKzhSYXJJL3RlY1dQ?=
 =?utf-8?B?WlhmamZsOEE2T1NMNmc4QkgyRW0ydGN4eGwvTWM1SGxoQThCZldpditZeGV6?=
 =?utf-8?B?eDlIRWUyZmtkdmc2QkRERmM5ckQ1T1JOZEJuZUV3T0N6MmlpUm1FOStsZnRp?=
 =?utf-8?B?MXc4VXM5NytHejkwM3lEYXM2SktjTVFaQjZLVnhnQ1JzOGFaeWJZWFpXM2lN?=
 =?utf-8?B?c0pJMVhaSFFZcVJ1ZWVYQS9wR21RbnpMZkhzQ2wxK1BhL0lpaFlXaE0zcGhF?=
 =?utf-8?B?NC95czZnaHJmeEwxbENWUmdoeTFCMXB0YlppWXZac3R2TFpoSjRPWW14cERu?=
 =?utf-8?B?a2JTSGJTdldoSW9TSEJaRE5KbzlWTG1lN1FjdEZ1RjJoYzArN0NjK0Z3dmJC?=
 =?utf-8?B?MjlZQ0FxTGRtait4ZEJlUTNGOEx1WXozcnozSnp2dUx4TEVQYjE2VS9DNUZV?=
 =?utf-8?B?bm5QZVRsaVRTMURHWlZPNTYyNmJuSVRTMFJZalJ0cCtXWUhBa2Q1NTdJUlcy?=
 =?utf-8?B?aVV6cDd2TWtrRUdtYUJBT3JHbnBQNG1nbFcxUlFiVm9NOC9SY3lHTW8rSE1R?=
 =?utf-8?B?emkyU1ZYZWd0NTMxYjRSYTdKa0xtWURWdmxDNkhPOFJ6SWZoeE5aUG9Kdjdj?=
 =?utf-8?B?RUVsYUVrai93TDM0SGRmbWRwcXZHSGIzUng5bTdYbXhrQ28xdEVNWHorZkNp?=
 =?utf-8?B?OG5lTUEwZ0dxOEk2NkR2QlgvVDBLc1U4UW5JWGpMWFVubytEb2lnT2ltSDVC?=
 =?utf-8?B?OC9oSS9ldTdLZ2dIZzExeDEwMk53YldxZU9RV3hSWFhTYVZFSVkrcFgrT24w?=
 =?utf-8?B?YXQ1eGpGMFkvdE1Wc2pjSlh1T2JDVkluMVVQZ2RtUXJ3QzlSam9NQ21WZW9H?=
 =?utf-8?B?SmJmem5aUmw5OVh4Vi94MVNsSUpNem1GNjhaazZqOEh1eHZEaGpuU0RMOUM4?=
 =?utf-8?B?REdQUm1WOFErUVJBQzl1Qk9sSDhtVzEvWXkrZ29vdFJub2pSQml4UG1xb2Np?=
 =?utf-8?B?UE9ZcS9WVFppS1JYT0x1LzZ4V0w2bDAzOFlvT0tWNG5BVWp5UmdGQmxOTjVE?=
 =?utf-8?B?V25JVUVhUWE3aWloaXBUYU1obllacWYxb2hJb2twRnJXRkRlV1pvMTlnd0Vj?=
 =?utf-8?B?ekVJVkdwUHkzc3dxalB3QTZFa3lMemtQSVE2THZ3a202T29HQWRGUHdrOENE?=
 =?utf-8?B?Uld3Q3NrUXl0Z1BSeC81Q2h2eUhkUmFpTk9VTGxZWllxcmR5RUVsUDNtc2k0?=
 =?utf-8?B?T1RycGY1Vk1HMmFyL25YNUlndDREYXNCaU0za05pdFM3WEt6Ty9uR3U2V1g2?=
 =?utf-8?Q?wCRW18CjUqjDcTfkbiXN0XOo/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bc9484-6a07-41d2-c1a3-08da550ee9bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 11:52:56.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVro/tx86L3cgqgciKrUlGMEgQG2498xZxzUdz9rVV9ZrEkDawOgemtrUM2duNFzCZU9vurz0JqP4REV26B5UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3523

While the first change is a bug fix (for, admittedly, a case which
apparently hasn't occurred in practice, or else we would have had
bug reports), it already puts in place an instance of what the 2nd
patch is proposing for perhaps wider use.

1: make p2m_get_page_from_gfn() handle grant and shared cases better
2: aid the compiler in folding p2m_is_...()

Jan

