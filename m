Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA87D4F79
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 14:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621875.968750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGDK-0004wn-NO; Tue, 24 Oct 2023 12:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621875.968750; Tue, 24 Oct 2023 12:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvGDK-0004tz-Kh; Tue, 24 Oct 2023 12:08:50 +0000
Received: by outflank-mailman (input) for mailman id 621875;
 Tue, 24 Oct 2023 12:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvGDI-0004sF-K1
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 12:08:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1517da70-7266-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 14:08:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 24 Oct
 2023 12:08:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 12:08:44 +0000
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
X-Inumbo-ID: 1517da70-7266-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Btf8EcXTGLrv2g06U/W+lNV714+G0oVsb7oX21k41NNsdVCVhd/BqPNWAOxWYMqaMLRVvgTDioY87sYI478EMFLeGdT/yQLJ3iHTW3KXjsUuywx9fY7yAjaU7hLO7e4sTav5EYIfyjTcCnrnenvqrC6MvOVs+F9bRf8lf92WKTVyin6uLCc1AQe1WRg6HNxkjrj4o7rJ9He3cMbfdfthZUmKdCpooj60KK1qSVPWz4xts886fvshwE7Oq8JqpsuOz65qqLiip8OpEKI5WSnWexa8DI36fmQEDXBVtiIUQ7nlk3AOEeJzBT4Gnuty/PjG9Tmty+xRuuc8mymJ0vF4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfvGQFI1qnwP5ZqYU9NNsF2DQG1OqoIoiobGJYLGaI4=;
 b=VplEni5DwqQj2wsHojks/bS8SX3DhoRngFi0j63zynL/sN5errztq6hpPhPIIUxdaCODpGr/5Hw5y/cPq6CoYBvSmVi9BX38z7CaZ3CSTwNklN4gFzvMad5E7vPaU5L0S4SksKTfRpTe9dbUcYdlHbee46bJTBpDSTu1eGLGEU3dhbEvRfeWS1cq1Aynrlz+3vZeryxOYV8OCXirvmnb0/CBbWdaZ/Dbz8sUYeXx7kyfQhezY4uiUnD3b5t52oLHtfnwGyo/++rpjxXhiu9g5G+gFOWgLPMKtGNejced3GfGaOGlmAH9r/brC/8IpmGauFGaVG2ltUb0++eyF++SOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfvGQFI1qnwP5ZqYU9NNsF2DQG1OqoIoiobGJYLGaI4=;
 b=sMT7422wW4KKYvy0UH6ILn8oSAxx0lWxJfItqJBsX5lS2BqMLEEUnLuBM02BpVVnSNranS9oO9HReUYwZuIpEMbsTIWInHcRiUENN/Lynnu071aeVI9m+iy0ha9OJ6b/rtGlkoAtOWY+7GxuxLldeHCkD/uEip5sSJl6mmxjOcBlYhRCu9CGCCUOsfC60cd7vw1b4h+XaRlj1QjjaDY3feaRObGLBSyMDtTYAGXg4akxWh3zZGpVl6KGtyuQhvB7m1oO54EzKnLf0KKu1+4DYvAjIcRKCj33B7X3ZxU3jKTYKkZK2X08RAmcOa7xh3yCQ20tZ3kYgoMzaUR2ryzetA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36e76621-01ac-d5a1-9359-30544bb916ef@suse.com>
Date: Tue, 24 Oct 2023 14:08:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com> <ZTeY6JNbNfTVCpib@macbook>
 <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com> <ZTesLTIulycE1s5d@macbook>
 <c11b0ace-f2b7-8d59-0112-fed6a5de0d03@suse.com>
In-Reply-To: <c11b0ace-f2b7-8d59-0112-fed6a5de0d03@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c113d0-30ac-4860-92a7-08dbd489f835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b0EiMJ+xNvdbaRayQg/f8hNp7vGuBbONsiax44mgdfj+JiHRrwDlGrkxJfkwyEg3xd4QbNSle8Tri7DG+0e3plaYlZ/RZ4JfunPYnlvhRjX0tJbQRMoZoTBJR0T1y29SX+VWkV1nsryKeX+XK4TRhc3mKEXRZgXY3iDBDjfrky1PGeLw4Fi5+olUDZaozMoa93SNVVReDaXsytKmKl305+pBuBqUmd9eO+H8MvhkpBArW4WaFPnX5n3/JXC0K1sWgyOfLu0n06T5qfIFDbNFEcGQW8P2o8CRXoamWYXvTMv5lFj4TbjCgyti61BLl5xuGNXOwAbsKOGEPfA++jgXFRy7SorjOVApayiKGKXnlRhphZCBWJtxdB7q1MfqE6pt8KOgnsYZhFo3JVc5HRjywd9VxOM805zx+Gg/q4m6GPdoz6TtIx9zh+mseYLtNr2yx+M7TdxHyM044/mUHNI6kIdrrAR+UrgsuszMEtOBmuOhjfoxRuZe6RBdvK6ddC9mejrZzjfm5SA0ZycUydM59jm6qmNaoWc0YbBlhs2yo2xok4Okaz2OHyWm2RsfuDzxQMy1Lfl7pn6g0BiTjIHDjcQ338qRPyuIdYbOp0G1bs575brESt7nl/pcbKjvd0JSPROX68oUjOMB+7PBwXYKlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(396003)(366004)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(26005)(31686004)(66899024)(38100700002)(41300700001)(2906002)(4744005)(86362001)(31696002)(36756003)(5660300002)(8936002)(8676002)(4326008)(2616005)(6506007)(478600001)(66946007)(66476007)(54906003)(6916009)(316002)(66556008)(6486002)(6512007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0R3bG4vVHhZRDRmVk5xV2UyQ2RBVU8xcUJIZURWRUgrMEdrallHY2hGeUti?=
 =?utf-8?B?TVJaTmFCdGlLUGd0ak5OZk03WGZUeXF5SlRmenFGeTU2MHhib3BTL2JxTnFZ?=
 =?utf-8?B?QjhCRlExVWpodC9Ed3ZsQUMyVXJmVEpzOHJjYzdtcXU5NmRxVDJIOEJJYTVu?=
 =?utf-8?B?aEVuNnpPUHpydTIrK05JYXpRVVpscVZiZFVWeThYcTlUREtrNHpuMGFEVVps?=
 =?utf-8?B?Q1lyUHIyM1Jpb1J4RlJVbkxOMytDT0ZqNjl5ZzdiTFAvOFRqMVh4R3hQN3dV?=
 =?utf-8?B?elZJSFNWSE5OWHl3eG5TSHlDb3pmSkxJSVZoQVpiQm5HbU4rbjFhL3JKUkVC?=
 =?utf-8?B?NVlvZjdXRUt0dmU0aTlQNEtBdXc2b3MzWVUwdDlXUUV3MVF2M09PYTVBSzE4?=
 =?utf-8?B?ZVZEbWhualkveFdGSHdVU1VtdHRzdE9BYkkwK1NHMU1ocWFpM0Jub2lOVXM1?=
 =?utf-8?B?dFlRVGhFWVhkeTU3ZkJidXRFY2RtZkRQMllYNTZ0dVIyVU5IU1VJS2d3eVZk?=
 =?utf-8?B?MXUxVkNWWVZjRFQ4UlNMRnpzV0RmakJkN1F6SDR1MFh4QTkxV2dDb2s0bE1l?=
 =?utf-8?B?bjdWNTJjcyt3dVV0NytaMFp5alVQclJFaHJiRE1FcEsvMjlKZjR3SzMzTmFu?=
 =?utf-8?B?clJWVW9CSnlJTWhXTFlFM0lkOVF0K0dCQ2JoYzJtNXpQTVNISVk3UE5oZHJo?=
 =?utf-8?B?NGhINVdxVFJGejcxaVVjdDdtTUszQXRkazhkekhPZTJRNE5sWGVOODgrRGRF?=
 =?utf-8?B?eHBmb3RjNmY0S3RabWo4andsUjQ2STZLY0lneTEzZGxydnFqMEIwUmNDTEFW?=
 =?utf-8?B?b2lSanl3WlRiZ25Lck1Ray9FQ004S3JaMmlPK3piUms3T0JJcHNMM2xlaSt3?=
 =?utf-8?B?YXJQektMMlJ3aDVJM2lReFRjQ1htTkZodDF5Y3Z3MXVQcktlcGg3YlZsV0dD?=
 =?utf-8?B?TlhTMmxqNnAwYWx4OGpvbnk5OHBvcXdTR0xBbmhyZFhhSk91bUJwbEJUeS9q?=
 =?utf-8?B?ZllmZzcrNVFzOHhsbkJROU1yUXExTVpNcUo4MFQ1MXRqSkdRWnJzTmM2OXgx?=
 =?utf-8?B?SWVPNi9haFc1aEFaL1cvU3NuTHVKV1RHZU9qTWpIVlNlL3IxbmlWeHFHVFdV?=
 =?utf-8?B?cE01ZUJ6cTg1WXYzcmlEWFNycGdCcUg4dlpZcWVhM1B3MFVaMGRlQUtiSEUy?=
 =?utf-8?B?V3ptcERDdnFpN0JKZHZIOUxzS0V3RTZNeFhQRVV5aG9WRmVkMTN4Qng1ek0w?=
 =?utf-8?B?MHpoLy9kbHhUWjFIdEMvVDdXbHpWamtweVpIWmcrZjk1QmpvNWRWa3pQbDRG?=
 =?utf-8?B?Tjl3d2RsejF1U29sbXdrMmRPSUlqVE5TY3BLWERpTmVwTkhNQjNib215TFFE?=
 =?utf-8?B?NGxBMzBuZHIyaGNzMTYvTjNmVEhHa1RTTlJxa3FUdytFdUIrbGFDTStNUnE3?=
 =?utf-8?B?VWRTOVhPUHA4clhRRW5ZM3VXd0hEaXd1MnQ4S1pNbzNyLytWeWxESFBJUXBq?=
 =?utf-8?B?SnRWTTVpS29ZckxBaFk2UTlZKy9HcnM3b0FFQlIwSXhaVkdGSHNjMGJDcGpa?=
 =?utf-8?B?YkhGS1hUNTlkUUpobzN5Y2NJQ0lXbFY4NmxmT3BlOHRpS1Z0ZjZpMDdHT2dh?=
 =?utf-8?B?aldGWXNPRFRaSWsxVndSemhaNkl5VlpiclF6UW5SUmt2K01zYndKREVWR3Fm?=
 =?utf-8?B?YzgyZmpNU1FaYkNiMnNKcGdrSDBzc2hKeUJnSitOZytCa3lJcHBYSTFPR0Ju?=
 =?utf-8?B?MFJiblNCK2NPaTdSd0RNRU1tMGwvOUVxZE1CZWVRemZYelFpRWgvaDIrN3Bh?=
 =?utf-8?B?WkNwaTFCWW5zbjV3V1E1Z3Y0M25KaWNQckUrN3AxNitFZG9yRUI2ekt1N01p?=
 =?utf-8?B?QWpKSlAzWmNxY2liYmJzWmg0NlpWZ2l2eHF5bmFUOCtBdzMwSkNNdWphdmZJ?=
 =?utf-8?B?TGRlUmp3YkoyVkc5dVdDbVlFTENmWkowWmlNN1JmZE40RjZpd3dqZWJTU3RI?=
 =?utf-8?B?dWNZY3AwRFIxRHh5bHpvZS9pNUJCeFNuRUtET0I1SDdEcjlaa1RTcndoaDZ0?=
 =?utf-8?B?Rk9uMEZGejZNZXJlM3FlaktrUkg5Z2FMVmVITGlzaEdndjRtWDhQS0h0ZUsr?=
 =?utf-8?Q?c7BEogd86/tP8+4A3Mmm9BDSl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c113d0-30ac-4860-92a7-08dbd489f835
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 12:08:44.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqiGlA/YlD9lywnAwfpCObzcMiBWfVJZ50X49fA919O7NOSCQJpEU0SUVrEFH+TZ8SUgrg57m2UYSKpWqjR+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512

On 24.10.2023 14:06, Jan Beulich wrote:
> On 24.10.2023 13:36, Roger Pau Monné wrote:
>> What is your reasoning for wanting the smp_processor_id() check in
>> the caller rather than bogus_8259A_irq()?  It does seem fine to me to
>> do such check in bogus_8259A_irq(), as whether the IRQ is bogus also
>> depends on whether it fired on the BSP or any of the APs.
> 
> bogus_8259A_irq() shouldn't be concerned about the CPU it runs on; it
> should solely deal with 8259A aspects.

Or to put it differently: The function is supposed to tell whether an
IRQ is bogus from the pov of the PIC. The caller decides under what
conditions to actually invoke this checking.

Jan


