Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B65B7633E2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570290.892023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqs-0000vp-UZ; Wed, 26 Jul 2023 10:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570290.892023; Wed, 26 Jul 2023 10:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObqs-0000sT-RQ; Wed, 26 Jul 2023 10:34:42 +0000
Received: by outflank-mailman (input) for mailman id 570290;
 Wed, 26 Jul 2023 10:34:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qObqr-0000pF-94
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:34:41 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe13::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0698903f-2ba0-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 12:34:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:34:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:34:39 +0000
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
X-Inumbo-ID: 0698903f-2ba0-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kki6fVBK4bJS/poodZ3FhNqFU38J2KWcqpy5QhAKDaeYBkVtqlKLOkexGP2M4azXVey2Y9bTYYmO7/G2GdXQyWmsu5VA8vyAgrSNhwlI8AwTZrnGcwqd0uHnfoD36dZ52jEDAwH9fCa5cDFaDINEpUjeNVsqGnzmKFA/HTHluDr9Dh/bDRtvvvGuFx5OPkEdclOdy7m1Kc6uX1x0kU+W2uqF0QbAsBaLRqKZPoEFmR+Qb2XraEfvvZvdKCgp4D+E9dgLd/SiXCNDFr30SESDFUNtZrOUThvq5acRKOIbdFXxxrwUsCW4eeB9hYH5yVZkW4bevBTnqaNO32QDBsveIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bXX4UWXnWt29w89tvGp0cf+LqZaRKTS56ciKBNCO2k=;
 b=b3P2K6SwCJdzJ1CDg60+v4aRD7vZ7uC3BReNRQD222Q8qeJFAhiFGS2oth9oZJFshJvSkFLsk4ijgzhl46LZpUa4KmR3A/wLzweFDFM0bGKI+fkjMmjT6HEAiOpVn519xYJwdTxUiO+uGqCwLIHthhG0Bsm73ZpxJGX+RC9Sop/xj/CU6xWoPlPTnVVAizYjNlm5EoyU/R+G94iaJ7uIFAs113R+B2hnzGIUF3txw5RUnuIqisPxjTF+SM95+6rPXlp3yGL40WA/Z/nZGTW4aNfURKRVnXPEj84GXI8EjuPyW+TuyT8QRFizi57zAXs/181fcomMjXsfJ79QZbIMqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bXX4UWXnWt29w89tvGp0cf+LqZaRKTS56ciKBNCO2k=;
 b=sEar2vZFCtLy4pccu4KzcUj9IsA3ZHTNPo2KD3JPuCwIP3iNB0+5c+SH9BBxPEKGDqO5znCwz7PnZ0fanYbrF7y5gkhCuPMtqWJpFy495sbseMu9mQzG0EEb5j/XJDS69iSHEPt27+cMRGJONn017mTTCopX9H4pny3g9x53+z7jW2GzNq1NUY1llM/fgg97Ueb9HDzWJcTTwD9wJvlUbguELzZpuNvJDp2Y/kK7udRn6JaqafG7+PDMtPKQiPH3kobh/Gdbl7TXvQG/UTkgzFYOFvnoJZmgGG+TBvE4fMxKnAY4S+5awYIIHBhuMPQ1dymbVvudvk+sSxTp4Tq0Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4fdfecbc-0ed3-dc1c-379c-3a556fea8b89@suse.com>
Date: Wed, 26 Jul 2023 12:34:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 4/5] x86: use POPCNT for hweight<N>() when available
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
In-Reply-To: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: ef695472-c47a-4302-3aca-08db8dc3ea20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pXLW/0KF4oJYbWL5xCtn/ARmSF8xBgOhebIURnVwOoKCRONcIQDuH3DLlQqFO5XFWdc0OKtlQAYqEoljrK5WcvcG4cBskCnzerq8eYXmr4VHQwLiuWuEaYe9YPCYJkxczQyoUBJmtV/INqgbw+fSbgQCgzv6baFfMiYGVowSWXjSdbMojCzoLqKsA0/ZS7dclQj6bha3dpJDXoLJXTktZrv57nW1gV4obHQmi2hQrFEO5wQocmE8XQAfQdEwTCRkqK6MaptMLf9FnfCsmWwLu3wy/sbkH1nbbkGJs4JDcC+GG256vx75xN7js6oj4N9MECHZTlfdrBOQUhZETHe1vs8vsQcQuBMcv9D8ShB+JtKAs9sMFm0HvZ4f9qFHQWl39XOZCedc2FSr1ktUzbL1vKIYLk/lzCnFbMWv60EDql9ZZde8kT/1ihooBfFnIQWfDDRLf3zhyDEW592wWbvxVRNjYLc08mOS4J1K8M720TPShgb9yT0DI6sefZ9qc0UsLi8gWab+yQbHMhN3d95SWuZS5X/zxXWVDQxOiuGBFdzfr12D7f6U/a5xwz5X9jr5yoehDHntZNOTJoAoXdXug0kDgIwn1Cs1cKSaX7RpUR/NDN/er+SwSXf4DF/Wc4vrklokYLAeOMK75sG0N/CmzWsxp+ahHWzJX/K22zrJBhu+t2cpkfO2ln5wKoCBgwCB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(6486002)(478600001)(66476007)(2616005)(26005)(186003)(6506007)(2906002)(4744005)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(86362001)(31696002)(36756003)(31686004)(16393002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDFGcjc3YStNbGZRT2YrODhVaEl3WTkxcWJnNVlwazNGeFg4dDdkc3hkRWJ0?=
 =?utf-8?B?cEVyZDhYZDVuN0ZtTFlZRFoza01PYW5jaDcwQ3R3a1V2dEtyUkdBLzVOK2xM?=
 =?utf-8?B?ZVZ4cWFSb0dFaWlJMFAzVHpzZlp0QzgzemFrejJBYU1ENkR5bzhUTWRDQjkz?=
 =?utf-8?B?ZTYrNmxYVllobTFTODBEUENtRjlYcW9EMG5OZGVmSUtlZ2FDaTdlbmFnTEZq?=
 =?utf-8?B?ZFNmaEJTWkFBRC9vdUlqOXZpNGVVSTJUclpCL0hndjBnZFlxU1pISksrUERK?=
 =?utf-8?B?TjlIWCtKRWplclZwTFBjT1ZCK2tuOXdKNjNZSXI3ODBBSXdaOEpLWnpPNjI3?=
 =?utf-8?B?M3NLemp1a2c0M054Vm9ZVVBrZ2dJWGI3YWxiZm13dmtnOEhxVGpvRmd5b3lz?=
 =?utf-8?B?YzQweGs0bFdTZUh2YTlvdzFLS1Z3L0l3a2xqTkpkd1g1ZU9KOWhXbzhJTDBT?=
 =?utf-8?B?cTZoNGNPZlgyajdvUnQ1RXhiaG1NVGpjOC8yQjlKVmpNY3Q3cDcxNGRsT3dU?=
 =?utf-8?B?ZEJkZWZPRjJQQ244RXM2dWo5N1hReTcwdmxML1pablNJUDZsd3FmZ3d6cnFN?=
 =?utf-8?B?eUdQelpaVzNWc1J1QlZoblp0NGFlRGpVNUgwTTRpYXlwNTh2bWdpdEZ1QVpw?=
 =?utf-8?B?UUxXYVJ6NmR2QjhCMkxoSWc1czE3ajZPYTg1Q29MNzBzbzFBa0JPN21zUUl0?=
 =?utf-8?B?ZEd2ZlR2UU5MYWZhZmdtSVpRSERlT3lSUHoyWnU4VnZsdUxUWTdYdmNYM2R2?=
 =?utf-8?B?cm5rbnBxNXo4KzAwQm5NcFdhK0llU2w0UnlWYmZGelRucUxSTlJ5SUgvRTYr?=
 =?utf-8?B?czZpT3duaEU1dS9rZzJIVUVrcTkzSFFhbzFMNGkyaWphcDQwNE03V1RKVFh2?=
 =?utf-8?B?SU00enIvb1dDaFNiRm5SNlh4Qk5ScWFIOXA1aWRKbnpoMXdoWFB3M29IYmpK?=
 =?utf-8?B?aDBHai9FODIwVjNYT1NZN0IwZmdZMG5sVUtURzlId0VpN1RvcTVBa3hiQStw?=
 =?utf-8?B?UmZ0U2RGSk1XQ2hHMllUTEpkS0llWm8rV21zNm5ja1dCZ2p2T2dnNmczbUkr?=
 =?utf-8?B?dC95dTAvSmxRYmI0WHVNMUNOamV0NlRhbzE3ZDBmMkhQdy94blJDRTN3V0w3?=
 =?utf-8?B?VlFvV0xPeUlmQnA5YTVuTmlMR3VSNlN6K1dLUUxwNC8vbHplYzFDUThpMzJ2?=
 =?utf-8?B?YzQ5V1VoYnZ3M0FYdVkrbko0eW1rbWxwb0VIRWZaQ1FEODhVNndoenlzMVF0?=
 =?utf-8?B?RVk4NEdTeWVtKy9OZ1JMVHZNZElBZFM2cFR0OE1JVFQ2S09oSHRadys2SGY2?=
 =?utf-8?B?UE1ZaXlKUmpmT2xxRzU5TkUxbVJKY0pzek9ob2J4Y0lIbnBMVFlhSnpWaHk1?=
 =?utf-8?B?dGNuTnA5N04wNkpac2I1VHpISUZxYkU5Z1dUbUxvWHh2T0JpczVHYmdaK0d3?=
 =?utf-8?B?YnJ6ZzVaaHJ1SGVldFlxbndyU1dQNXJSUFlySHdHaUl2djY4emxSSTFNMmFP?=
 =?utf-8?B?aCtoU3pCZy9HOWJlbnRuL3d3M2tWTU1qdHVuaWxPL0oxN1VSSzJTdzlMKy9h?=
 =?utf-8?B?UVVSRENJME05akVxblBKOHZZa1RoY25nUUREM25Vem1RMUJLbWNEOTA4R2xJ?=
 =?utf-8?B?UmtZMmxFcExFTXNITklSZnhtMERoKzFGWU1MRWtKZjNQUFI5ZzJXR0VCTjlw?=
 =?utf-8?B?VHVRQW14cU9TamNaalM1cTFocGJpd2tXWDE1WStvNzZlT0ExOUZLd2c1NUM5?=
 =?utf-8?B?MXhxY0tHNFNtejVidHp2TnF3TGZTU2dtSU5icGU2MWRMYmNZZjFLc3pxbk54?=
 =?utf-8?B?TGRLV0Vubm9RTFBYNWNoak1Uc1NlNGtiNHBFNWgzekwxekQ3MmZsdEJjajhU?=
 =?utf-8?B?K1ZTSzZoSnVvQnFUVGpYTE9OZ0xsQTRjOGdiV0gvNnlHYVQ0anRKQ1A0UlVu?=
 =?utf-8?B?TWR4VDlJSU1CTUtMV2pTbjNnRmFvZ2lTZGdYTzk3T0wwcXZVTFdnL00xTW9l?=
 =?utf-8?B?OEZkaWdJZURsZ29Jei9oSENtUWxRdGFROWJoUXFEVGlpYS9vRkhXTjZYNk9x?=
 =?utf-8?B?ZDJuem5RN3QvS2NNK2FIcDlsUXJZb3FhMkg1NnQydTYyVGVCYnUwa2daN0lP?=
 =?utf-8?Q?FOYfIYNJDYo26K3A/j3vaxYvF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef695472-c47a-4302-3aca-08db8dc3ea20
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:34:39.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk65ibqpXKDPWL9c04qQzQapaxG+okr/vOFnnayq0JF7IknSqo+DmEZEiuxZa0dWgG1oP7y2hi6vaokGj8IyIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

This is faster than using the software implementation, and the insn is
available on all half-way recent hardware. Use the respective compiler
builtins when available.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -475,9 +475,16 @@ static inline int fls(unsigned int x)
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
+#ifdef __POPCNT__
+#define hweight64(x) __builtin_popcountll(x)
+#define hweight32(x) __builtin_popcount(x)
+#define hweight16(x) __builtin_popcount((uint16_t)(x))
+#define hweight8(x)  __builtin_popcount((uint8_t)(x))
+#else
 #define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 #define hweight16(x) generic_hweight16(x)
 #define hweight8(x) generic_hweight8(x)
+#endif
 
 #endif /* _X86_BITOPS_H */


