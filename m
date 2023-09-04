Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C1379113F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 08:09:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594955.928400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd2kv-0004TG-G9; Mon, 04 Sep 2023 06:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594955.928400; Mon, 04 Sep 2023 06:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd2kv-0004Qv-Cb; Mon, 04 Sep 2023 06:08:13 +0000
Received: by outflank-mailman (input) for mailman id 594955;
 Mon, 04 Sep 2023 06:08:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vltW=EU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qd2ku-0004Qp-Aq
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 06:08:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b8ee96e-4ae9-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 08:08:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10073.eurprd04.prod.outlook.com (2603:10a6:800:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 06:08:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:08:07 +0000
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
X-Inumbo-ID: 6b8ee96e-4ae9-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxQrxPZVYOelMPfqGyTZvpVpg7xIpnfuMcdA6T/wZ0lAawthqEDZsDSmKpkNyl6gMFcWRCeBohtqLpgN636OdAp4oCHY/M2oin/kdDEScTdtTuIkEeg6RUr/q/GVJURJjO1ntGqjQJLT3NWYE32zQhrHQN5A0QuZZmp9LbiT/tzjx4x513PkH91ssJYj3mNKRkOByuu1QiW3FqzQePMdgSI1+TEt2QnmygyGgBa8isKvPkRBUZYAdnuvX8szgCu6ojLuUMHd8K9r/qEz/IX7eRIrx3FnBXPUttzrsxD8pvZuZYB+72GI2VksE/k4wxbVFXUkIn/CvZHJRbe/Du6+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTyLGEVhMT3LiaN+QZivDPGH643cuZBoZO8kxVDu6r8=;
 b=VOnlomwL6/FPGdUAL0+w/MP2ivhGlL3XWJzCBi6UanqJ7564tN4zlVwoB9/e77FxsHat6nYwo/NFl0OfcDI1dxkDrW/8iV0+x1GzSLDIMQsbtXfxZXNWCeATDxK4zxPf2RZqXVqn9In3FXa+F+aUcT/ll0xy3bjcAbR0PuXRmuuDJO3aelIgHoupgbMqHVZc1KigP8beDZPQPuubFQIt1sYAQz6rl/p4oQHpH0EziTFed0VU3CG/QgGplOmxKMmJZqqIEl5JxOL5cTpG/OoeBze1/yycdsf3H0SdtkgM6g1xL5aK2zATuWmX/O0txNAJaPDCzcmz9K88sGGEnyAN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MTyLGEVhMT3LiaN+QZivDPGH643cuZBoZO8kxVDu6r8=;
 b=2UEFERUtD1QMSbVckMGB2VxYz2pAxplQJzaXOaCaHvfHRve+pe/872mkWmTb6VgayfqQXd6kbr+vW1c+Uf/n5jWZGwqiKWrywzkpr2BN8kp/sHRs3nQQc6A6VAfXifR41hDzo4rR6Fi+p6n+s/sXeyGh/uwPfJFEj7CBUMQqcGRU3z30Pc5FvoRDo34wCK9hWhnmLej1uAdwHwTBywTueLe0308OWkG1TvuHds33b4dnQbcIigJOZKMmRTu6sReQr8ttwFN6tTWWRBf9tvKX5Wi9MhjHkEJ4BHLsKqgBCojZooaMzYrMo+l4BfEhUCnOM2yc/mnyn3QwhfvZLsIZDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43e29941-8434-06b6-2e5c-d3f0a39b85cf@suse.com>
Date: Mon, 4 Sep 2023 08:08:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
 <e942f853-3536-2033-f214-1beccdfc8240@suse.com>
 <8a9c0fba-132b-1245-caf7-d4a3a670e9d9@raptorengineering.com>
 <cbcf7cff-5832-dcb6-4050-26f5fb10cd02@raptorengineering.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cbcf7cff-5832-dcb6-4050-26f5fb10cd02@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b60320a-77d0-4355-5991-08dbad0d4e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wUXSRcsfbJMauruGcXghxdT/vmOdBp5gt/bys1HhFVtHoBJoI5GrnJLEWwPOs1oTv4n7tiXWXsohpAmp4w8lYuPek3cuVrQu62ufyKeGqicpWuVp0+FE5dw/+zioXgwv7PBYNw2obWfLD+djpu65oMeR5E3aGO0ntFrHTX6eL2CrBBwbuPClTfMQRHJMIlny3Tez3/brRfHSlE6weCT/UensF27T3uH4nExempIvT98Gu7VeI0PzE/AC9DpGNblftd7mq40EfCX8QtpDuLVDOLeo+nSyijkrUopdVPaAceoKtLUu2NJ8xf1I7bcOh/qfzONdHe3R4SkVCgmGJsh0JLSlwHShmEKEASBXDRsCM1F8yHhpcfvpy76vXvu6OGl8eP/bnzTR8vpiKzwLs1YUhOPWmpnzmfowFBSmC3t7Mnrtfec4/mGsfZMJJqD3e6sWgCF7wVDFssyxMhksStaU4D5cX/GIzG8Y2OJmIohRe6eRqttSO4aN+IvUtVYHv0WUrfT+LPYYzoqCy4Syi+XCFvvc6KOK4xHON7KC+/vbZ6WKLrD5+muR1q9oZNxL1FMJK1uTQ2BDZwYUYxksUwNwRhx4UH/NHMHj4onr+2SfpHuh/RtKvuFsM1Lyzeo4WQoYk9vzFxb4+LBpaOtIBfCjtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39850400004)(451199024)(1800799009)(186009)(4744005)(8936002)(41300700001)(478600001)(2906002)(66946007)(5660300002)(8676002)(31686004)(6916009)(66476007)(66556008)(54906003)(316002)(4326008)(6512007)(53546011)(2616005)(6506007)(26005)(6486002)(36756003)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWMvNk1ZZG43SFBJYlpBUkZlbVJodVI0THBDaTlDTncxRDdBeitidHYzTlhE?=
 =?utf-8?B?V2k4QVVMM1o5UzByUGgzbmFSTCt0TkN1TytqMmhqalNYek9XM0dGOGhNSGU2?=
 =?utf-8?B?bzF0M2RIK0h6SDZsZ1lVSlA5dUtrZVozcU5vM2tacEsxd0JoaTlqa3Z1cjRL?=
 =?utf-8?B?b3pjSXdlNmdBTkJJczQydW5Ia3BTQ1RyS2xVNHY4ZFcyOUJldGU5TjU5VUQ2?=
 =?utf-8?B?TzVjcHRpU2pYaWNRdWlPRHpRaUQ5NFZHUG5rWG10L1oyNysyY3h4S3RqSjYy?=
 =?utf-8?B?TnFtU0VRL2ZrTHJWd0VlR0l4Z0dnMy9RTmova1EzSVYvTERhUVpuNExWaTkv?=
 =?utf-8?B?WUpFTmMwQXFtaHJmRnVyREhRVFByZXk5UkFvUVZ0NnZlT1NVeHlQdWNBMCtE?=
 =?utf-8?B?M1hzSWFIY1RlRm43WHA5TktjUnl0VjJJZVR4aHUveWxUc1pSK1gvSVlGMlNW?=
 =?utf-8?B?NXQ1TjRpMEN6K3kyWFdqYTBrSFZYdnZHSk1PaHF1MU1ETm9tamJSQlVOQ2J4?=
 =?utf-8?B?NDBsU05LYXcvRUpnNUJlUndJK3hTSnNTd0owZkIwQ1ZVZ1krOXJqSHZBbTFP?=
 =?utf-8?B?cXlhQ2YvTVlWTkJZQW05TG8xcDluajlHOHBDRjRsdFl1MjNQaURkc1JQZFI1?=
 =?utf-8?B?MGprb1NTQWthSUdVaE85WTdJdjdKS1BwOXU2UXpYVlR3WU9QNE1yZWwwQVoy?=
 =?utf-8?B?dU8wTERLOXFSQnJMMEtKcS96ZEpYY1VneGI0S1lVbXVqSmc4NUFZRTZ2WUhq?=
 =?utf-8?B?TU1jN1lhYlJQbHhOeWd5MFlwVEdDbmwyTGhCUXMyY1A5VjVURkJIWEZwc2hZ?=
 =?utf-8?B?cTVoK3RET2M1dWl2eHhuSG45bDdqODliZDNKYUlyOXg0TmJYMlBTTS9McG0y?=
 =?utf-8?B?R3BUVzNTdys1cWlXaDZsRmV0cFpGUnpHZkVDeWZvMjQ1Zk1RMCtnaGFPQmor?=
 =?utf-8?B?MTkzR1FoUkNmdFl6V1pjWmRMRXZINWw3ejJyK0Z3NTI5bTFtbE1wcWVBMW5r?=
 =?utf-8?B?TWNzYktkMzZIWms0azJTOVhyTHhiT2JkbDcxWUQzS3FCM2hDL1Z3RGVpTnR2?=
 =?utf-8?B?UUJmN0NkaGZPM3dPK2pSTHdiQkxKeUxnbWxnb2hYUE1CMEg3REdmMEc3NXFh?=
 =?utf-8?B?cEgwc1dkZzhPSFI5THBkRE5pRU5FY1VxMGdITW4vNW1VS1pZSHR0emFUUC9C?=
 =?utf-8?B?VFl5OTl6bzJiY0gzTFFNRkl6V3dWS3kxSFpzNUh2RU1heXozNGRYZkEyTDgy?=
 =?utf-8?B?UDZwL09yUkYwVHE0YkYyNE80QVZLNjQwTnlZS0hEeEVsY1JhMEN3RVZ5K2ZW?=
 =?utf-8?B?RHhTMjBwWStSd0FCclJkOGhiOGkxcHdPOVE2RjJjeGdrUUZUZGNYMUYxU1ps?=
 =?utf-8?B?M1MzbTBlN0hwaTRuS1drNER0TnFIMHZmNmlwMDlNVUdHTUhZVHgxa3l3RDV6?=
 =?utf-8?B?STQ3MkRqQWxtb0RUVUxjMlZreUpMajMyRkZMSVg1blJ2Rmh3OHYrb2R3N3Z6?=
 =?utf-8?B?OFBpOHdMVDAxOFdwSGtUNmNRTGd6TGhQRGVMd2xxQXBuTjJ5a2dOUXpBaXBh?=
 =?utf-8?B?RENmZkpWSHJENjJHMWJCc0RHZFR5alVZa29mZFk0WVIwRUNNck9SWVl6K3du?=
 =?utf-8?B?cFRqZ3ZuaUhlMHgraGE5WmdqOWZQdEVYa2FQWnd1T3ZtMjhhSEozVWRRblZm?=
 =?utf-8?B?YkxZZzJjcm04ZjZhc0lncGoxS3ZPcENSQXF1QVpkNUg1dys3Mk9peTg3eWVG?=
 =?utf-8?B?WDlRMnRtTDJHOFJPRzB4ekthOERoSjhKUmxBZFE4QUc5WkxqdERiSUxnY3Ex?=
 =?utf-8?B?WmpZdXE2VURZL0ZRRFNTd0ZqUEdCWmlUTmVaVW5zZDNpTWdETXVURk9XMTRH?=
 =?utf-8?B?akZSb20zckpQN1R1YmhmVmlsbzhqN3BTVnBMVkQ5MFpkQzYvWFZnWWdXUlhy?=
 =?utf-8?B?TFMvRVBmUFNReVVVWUdTNysxNTFaSkFmYUFPa0Z1MjRoZVBhRmJ5Nng3V1kv?=
 =?utf-8?B?T0xjZndSdzkycHZ2YU9TL2hQMGVqRWlja3V6TGZML29KaDFETVdZalZvNmll?=
 =?utf-8?B?eHY0akVTYURudlhzQXBXWTN6c1VCL0tqRng4a0daK3R2L3Z6Q0pGeVpiT0Mv?=
 =?utf-8?Q?cm81VcATbx1vTmABE2RsGnCqs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b60320a-77d0-4355-5991-08dbad0d4e9f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:08:06.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7qJ1YKnOywCvfTs0a7+nZxBUY4mWhgyG4ABoUKZgx2tf8JpY9E8/JDay5wMZGQBSuxawrQdjS3ZaIMmWcICEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10073

On 01.09.2023 19:52, Shawn Anastasio wrote:
> On 8/23/23 12:36 PM, Shawn Anastasio wrote:
>> On 8/23/23 9:04 AM, Jan Beulich wrote:
>>> On 23.08.2023 01:03, Shawn Anastasio wrote:
>>>> Add code to construct early identity-mapped page tables as well as the
>>>> required process and partition tables to enable the MMU.
>>>>
>>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Just a quick ping to see if you are still good to merge this patch. If
> you'd like me to submit a new revision let me know.

Ah, yes, I managed to overlook this (perhaps more than once) because the
earlier two went in already. I'll try to remember to include this in the
next batch to push out.

Jan

