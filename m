Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9B5816F7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 18:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375509.607948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN3i-00062q-S0; Tue, 26 Jul 2022 16:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375509.607948; Tue, 26 Jul 2022 16:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGN3i-0005zZ-My; Tue, 26 Jul 2022 16:05:22 +0000
Received: by outflank-mailman (input) for mailman id 375509;
 Tue, 26 Jul 2022 16:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGN3h-0005zG-Jo
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 16:05:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf7e644f-0cfc-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 18:05:20 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7532.eurprd04.prod.outlook.com (2603:10a6:10:207::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 16:05:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Tue, 26 Jul 2022
 16:05:19 +0000
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
X-Inumbo-ID: bf7e644f-0cfc-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fU5YvNEHqQNoOuJjEs+mMOo71ElNLgyJi/GwyLshbhKUcXohr6Spx4BewGX1c5mDfe0skvVVIyJ6tCnW7DNt3f1f2iXBjM7PkAPDgNtL5XmYnYIEDGUJEPpUz7xFENoVPS061rSJ0TRmOnMUe6hADh18LZsEj78FCB/fGurqMYUQtkm5lCxc4BZuVxHHyLCRmPMxW+RapinPpcg1rCq6J3VfX8sezXsFZEjQulUFsO2iRWZLO+9eZJVngeCkID1MzMSXSdWmgYIZ6c0MeMDl8Nq0Hjuftv/uXm/C5zKv4MfEwoZTizvGVWTEVdZAaPLNO4GhMTCdEM7HWIz/eAcp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNV26NOfufeFyGjTdaxcVFoXazfc7X52s6BuntjbBgI=;
 b=Mm3mHhVvjuQjo90oBhYOf40r3acid5scgEX6jx2GfMzgycg2n2heHb0MOSRtYRJHvkeYWuMfhTFnkaNMkMB+xyXBc/geyNA7/gkzyDyvQlst9KIq3Fv7yPTsc0dtP5fCSLuBCN1WtaSl3SMM/JaFFrcQ3zTAHhFk1YRaOgO4KQl0CxlqlGnI5abxOZx+e7v1VvrPIq1aeJ3a9SwnQs9qegmh3OlN3ySqBBy5CoxLfvTsI6boxNjiid3oZW9135OX7uR+DhjsxaSJBCfbWS7sTm4nxCM4QJCyQf66EXRsTkk7wgCKVDHacbr6OEe6BI68aTNuzTHVcktt3wCALqnzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNV26NOfufeFyGjTdaxcVFoXazfc7X52s6BuntjbBgI=;
 b=LZVRVnvcQfYhCvisa4qFlBSJlTHwWP7zEyTIYuNGqEp0v12NpWnvYwUobRzOvUSloJoLZd1rwClWVYVoHmdPc6eajpIArkHtWfpLJMGiUPfhVqgwAWFM4kRqZwq/gOcknhX7iuy7PMZ7MdGH2oFsj7DB4MrZ5oZxyOGvdGOqpfINK3oG/jWU7X1Jz7Gx4iZrKetPa0C3zsXA45uzAw0t9DqRaGyennIa2aTlir7RkQIg37WvGeRPPW2Czx2EBbILgKsEsn1P206zibUJ7CistZ+3rw1v8WE55+XyklnroAOJaXuhVFW3G46Svbilvae5V/4wZUrBUlddEZ3MznZJrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75dd380e-5dab-8d19-b9da-b59188bc4997@suse.com>
Date: Tue, 26 Jul 2022 18:05:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: [PATCH 4/8] x86/shadow: exclude HVM-only code from
 sh_remove_shadows() when !HVM
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
In-Reply-To: <3fdfad2a-7891-0b08-5541-3b226e0555e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 504a1d27-1975-47eb-f324-08da6f20a30a
X-MS-TrafficTypeDiagnostic: DBBPR04MB7532:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mvF2OrRIAG55LmR7cH/h5/AnxvuNQSOWST55yuaOhiLeGl/OO0WrheiEE+ck+Ce7VzKJWSP6Un/N1CGUe85OyRjP3u+STSAPhfilJ6GxWLIg8R0tQza1u8Mh+6QGUx10UHWuw7rE+vqKz81+4O5PcwPWMc9tfMk6l2/5tzYmAKa05Qt0ns/yLrtnC4elXg44O2eEJ1tAyU+VIfLuqG1SSmHZ5LfrARL4KpisQepj5BXuisG743p+TzKOAp2wx3hF8m0K/t5pZW7hanKdBOjpZCi/ynqgb5DVaVMeT/eIzrQ5gWtgFbY0M7uIwVFNRrTH6ahShUPp+mlugnd1qmEHI/xe8njtyOEGjgqzcksGY8HbwS4tEalb2rYtTJXgAO8rDhDp+dCjbfo7PoYipnB6z1bCcSNdIjEfoMquqlRCENAkjTMjQJXmKNtphtrb+TBJnbObF5MvzyyDFo607bSj/TlBcwJn5WlL+rL1r27XHHK4oPYQ/W+RbbzdP+2ZvUJ7gPZuunrdFlqFVXL2g8Hgi12CnUPKgFCTwr+SiGKwPouxrVPQhD5+AkzenzNFVUJQoTeHcqokfRKEzM33KT1uKyxWdUZGKRN1IwlH31Chp/azUxZs6QLGmUtsD2gKAgN2C5NPjKhtz58TP2Q8uSxSo+eXbaW3DDayiZWyo6T9I66E+5qsfDlgrZ1fpgA4/9Q4kP93wgpehXLitVG8OqCPCMrCipQoZyGnxmIXkVRD6AePJLbReeW+bpCsn88840Zz4i2nffZNbuzvxgeVDeFz4RDouVv9Q4FXY+WjQvYRLB3NNYSwdhDuSMo6OIYTOsuwr35P0wQx229F99n7ArWeYQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(346002)(376002)(136003)(39860400002)(2616005)(316002)(8936002)(38100700002)(2906002)(4744005)(36756003)(41300700001)(31686004)(6486002)(5660300002)(478600001)(6916009)(26005)(6512007)(54906003)(31696002)(66556008)(8676002)(66476007)(4326008)(86362001)(66946007)(186003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wko0dUdoOGg3bmxUeFdGV0cxZmZHZnMwKzBNOThERWwxZSs3UENxQmFOV0gr?=
 =?utf-8?B?ZVVpS0Z1TDRpcjZEOVpLWmUvY3NYSDhaWnordWZ3SjBqV0FwK2g1NDJHQXZj?=
 =?utf-8?B?OEN6TVRKelFyZ2EzV3AySmxlMUJoYWJqdWlJRS9MWU9SOW5VdVpYcko5VGJi?=
 =?utf-8?B?UXBYbFRLei9DcEViejFnWjMxTm9mWnYrTlVOMk9XSDBSREw1K3pyVlNYZWVE?=
 =?utf-8?B?amFiR1hvZVlsSDFYOW9kV3FBQ0JVdkFwSTJBK1ZlaVRsb1JKWU9VRHA5VUw4?=
 =?utf-8?B?N2ZSdXhKcThQNER2VFp6QktCSjJkUjJVT1ZxZkVvUjdadjNQTDRPOEZpUFNG?=
 =?utf-8?B?SW5TaGYvUGhId0o5enJiWmdET1hOWVhKak5YNzhBQVFpQkZIa1V1WWhoMXlx?=
 =?utf-8?B?ZHIrUy9kTy9QMnVud0t1c0tzbFFkek52TjhteGs3T3pqaFllVGdZK0VDMEhT?=
 =?utf-8?B?Z3JjbytBcC9OQkdvNEU5MEVib1NDMmE3RTRVZTBJeWp5dDlTSWxSMktDWWxh?=
 =?utf-8?B?TE9KU2pMV1Y4MTZud0hJdW9oOGErVnZxa0hzWjE4VlpaM3lkOTZqcHBjN05O?=
 =?utf-8?B?SEM4Zkc3RzlhWHpENmJvVjd1Y2tFb3RuSHFTT054eFI4Szk2NkZzQ3ZtQVFT?=
 =?utf-8?B?czhkeWw2UXkzLzVJeWlsT0hacTRrcG92Ymlzb0tRWXRHUWF0bE9DaU9YTmQv?=
 =?utf-8?B?T3Y1UUE2VGZxTU1JalJ6dkkwZmJhS2RjcEU5T2cwVW10WEt2NklROWI3VG96?=
 =?utf-8?B?blZrc1hINkVRYXI5Njd6c1FTYk1Kai9sck9jMXBLZXZnMW5kZk1EK2dIcUFF?=
 =?utf-8?B?dWJ4N21xMVl1eFZkcjd3a1plMld4eFRmM0xmTndkdlN4Qi8ySnhOdmRtWU4w?=
 =?utf-8?B?RkRnemh5eks5amxMaTZHWERyUEJGYk5OcVJzS25IdjMxdnZKVTNkNTN4NTZM?=
 =?utf-8?B?dmt3bnQzdUZKaTdRNlhTcHg4UDN4S2pWc05GZzFrb1hvSFc2T2ljMDdhQjdD?=
 =?utf-8?B?MmhLTXZOalpBR2QvR3BHVTBtZWwwSXp3ckJBWG1Ld3pOb3d2eVJ3bnpLTEgw?=
 =?utf-8?B?dFpzdmU4aG90U1ZRZWpSTTM4VEQxYlJGb3prWG1MNjJWUnpjNjFIeG9xSDlp?=
 =?utf-8?B?cjhIZWhPOXhXRE1oUnZuNm1KeWorMTkwekNzUlFQcHIwTkpBckZVVnh2cVMv?=
 =?utf-8?B?Z2VicnYwNXZQR3VCNi9pcGY4QjMyR0xwQ2cvY1FheFZnVjNjYmNkWXR3ZW1o?=
 =?utf-8?B?WkpOeWZzaXhtV2RNV25samhOYi9TR0xsZ2NTc2VWTEVHZkZ3MU9lU2d1K2FQ?=
 =?utf-8?B?K1ArSlZwc0JocDMvV3hzc08vWjV5Qy81bVNZM000Nk1CZEVKKzVtcXBLZFVx?=
 =?utf-8?B?bUF5aXJYK0l2R3BTS3ZnR2hDS1ZsWVdncVQ1K05Zc0RmTFQxRXIxZmpGZ3hu?=
 =?utf-8?B?aU9YTkF5NVBqZzZOdDljOWF0RFlDWVhuUjhmZmRQb2VObEJiK0x4K3d2SEZT?=
 =?utf-8?B?WmNueUg0dStUanY3bW5HM01RWk41dCtTRVFPd0FnbjhQMDJHeWI3eWNhOEFq?=
 =?utf-8?B?YjZTU0dBYmkxamxFU0g4NEMxNmdsdDh3bUNQTThhZHFkVWcyR1RtZHE2NGdz?=
 =?utf-8?B?cEpuZjVWZmtUZnk3SU5naENNV2hqcks3T1diYUJLVGxYM1ZkVzVQdXBZckpz?=
 =?utf-8?B?amhqUXpXQ1BqRkNaN1NvTXJncUFCckxOcXBBRk9WRnZsTkFEZXVCMmIzVFhr?=
 =?utf-8?B?RkJiRWNpSUNvV3hiWUVEcThBMnhrZW5HSm5rcmU5UjYvVzVQNFdseWE5Z2FC?=
 =?utf-8?B?QjQ1VlN0NklGQmlqZEo5T1VpWmlab3VyeDAzamFzWXlSQmhvUlVNb1puOGRh?=
 =?utf-8?B?U0NTb2YxSDJvVGxOZmkwSjBHMjlMR3k1cm5obXdOa3BEUDB3MTFJak1XQ1JW?=
 =?utf-8?B?dVNGT1dtT3BvYjlsalZ0UCtHWS9iSFhTZ3IvZnNrdFB6bmdqM0JES0pZWkkv?=
 =?utf-8?B?YkJYNmc0SWRBRnp2Y3NaOHRtbmZnZUxSUzJQQWlMUjU2dGZkNFo3NXJURDFy?=
 =?utf-8?B?TnpKSStSUHNXY2wrUzk5UVVDelJldVcxbXBpUVZDdHZUajRnUFFTa3BjYjVE?=
 =?utf-8?Q?H6ZDJ/9bK3Z+uA/zXE70gCxY5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504a1d27-1975-47eb-f324-08da6f20a30a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 16:05:19.2168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWn/Ob8IMMiZoclI88lLaLwc5TnK22xzdab/7d0nLMNkZbv8jDcFJKCbDDpUnZIFUSr2gGF9U61rs6h47wNgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7532

In my (debug) build this amounts to well over 500 bytes of dead code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2240,10 +2240,12 @@ void sh_remove_shadows(struct domain *d,
     }                                                                   \
 } while (0)
 
+#ifdef CONFIG_HVM
     DO_UNSHADOW(SH_type_l2_32_shadow);
     DO_UNSHADOW(SH_type_l1_32_shadow);
     DO_UNSHADOW(SH_type_l2_pae_shadow);
     DO_UNSHADOW(SH_type_l1_pae_shadow);
+#endif
     DO_UNSHADOW(SH_type_l4_64_shadow);
     DO_UNSHADOW(SH_type_l3_64_shadow);
     DO_UNSHADOW(SH_type_l2h_64_shadow);


