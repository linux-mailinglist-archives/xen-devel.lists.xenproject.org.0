Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2C6C46A0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513264.794035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuuD-0005NB-Uo; Wed, 22 Mar 2023 09:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513264.794035; Wed, 22 Mar 2023 09:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuuD-0005Kb-Qs; Wed, 22 Mar 2023 09:37:17 +0000
Received: by outflank-mailman (input) for mailman id 513264;
 Wed, 22 Mar 2023 09:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuuC-0004gG-1W
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:37:16 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 212db34b-c895-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:37:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7526.eurprd04.prod.outlook.com (2603:10a6:20b:299::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:37:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:37:14 +0000
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
X-Inumbo-ID: 212db34b-c895-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFvqM1KPxmtdbYXZqIDWhEjl+u3JlLZYGPxUL5a/FAe/RNe37xuwVCz6l0ynHNwSbWx+0yXfS29pdz+M9TMRpVMKRlBbzenxHKO+MD81HCsi0SmyEb23HTYwaQTtjUH1nhn9439XyruHe9ue+/9hFWyY7U9qBf5cEkuzvX81QswMHr5ELh29wNdBVGB6lDfiw260Pl3COJj3smsox0sGj00Bx5Ci50AGKUAv9s1hK05w9FqJzCBivWx68ielPWz4ARoko8CWsKhwojhFAhHMQ/fVBvfGAIDMOeKT7TSzhjujGCxtBNPCLU/GK6XfZy0BVRvyA1D9wjvpSuy/m+8Kkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgsxcZsHQjbNHsFKcOrDGaTeJBLRhJa3sv6jEIQVDaY=;
 b=Uwl8RRsesj6Qairbj6d0oPaeuxxjd6rimp8Md+m1FJEPaaMUH/PKnLGFItGqA2rQVL/C6xhBEwA5PG0pm31S3BFp18OWomjarwOHKR1gtmWHKCo0dK3hsfhFBi17z5sjJHwhFH+l2cujoFM29qpy1RCtyJhNUNngvzTtN/E6oXxKNDmY78aZI6rg1d3Rh7wNZ129dykH4rpw2/P56m+Xgj3RGKSz0UhLhtrk+HzZ98OP6+okBj3eIYxwvTRUBDWJ0DpJMxIkSu59gIHzIqvdX0xijnbLED6XGDs6BN4uqXBTe8RaxaRxcJYuP36L2LtQWwm2Z6CDTTVSRZQ9SZAhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgsxcZsHQjbNHsFKcOrDGaTeJBLRhJa3sv6jEIQVDaY=;
 b=iw9ZssvLVdlscb8P9ZQM8BLWS7BtGEVDw+NXYWE3B+RbUT1q8uAwcdCPspDe93e03wvCP/9ii+0qf6q6Wt5F5mdwGS2/qH4MUHhrSUUrnDRyfVouZQM1IanhtF4P2QGSe9JcdHljj/f1bQX5EYCIoePZ5wv+V+xnqNmNEy+pd3CZ52Hjz/ypEjzczUafUD5Tl9+hJo57dqoJGuWM3iz+jaQIggJxqXWqvGJoPy36JBfbZuDcgpGFFjXD7wu8TqRzAGpPKm/gNm3DPlb/NYvxaf2XHa9ipqbWY4BDwGG0ZD950u/GX4xc1B0+3+OLjUnSt6fscf8qK3UH9ZAZHkNkgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eef2f500-7b77-8120-0c0c-8a8b4fcaac26@suse.com>
Date: Wed, 22 Mar 2023 10:37:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 14/16] x86/shadow: "monitor table" is a HVM-only concept
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
In-Reply-To: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c9d617-39e3-43b8-3589-08db2ab904aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uG8E1IUfvwhw1Uesqg447SrociDesXGcqF7L3UqfxXK9SbPqD0ielDckzwXxvsnTxNWV4r2HjCfaeisJ86h5C13ZLawpm1OjE86fdUdWlCt0pmOnZOddproKTX7TKhfsjyXIr2Xagk+wcSC7KJkFGNYxpgzlgLx6hx7Tc+b+V2ZyoKoJ93zRNDd+Yt2c790LFSoRno8WYfhux8OakE1Zy241dDH6wK+v8Hww4/pkRSM1gDnOHKSk7cW98Je7OrGwN+qYYpw72yGKZZb2KAJyEtM0BeDWuvnN90DGsDMThmzgKhHHT/im/Or++vdBVR8REuiu7RQQlu2iRVjQqlORzXrvMLtvDisiFa+6b4yZKxTNn8xBGyDWoQWj9KMIbWVIUyh1QxrAMn02xcWqvyU3g4YxelZyjQdZEyk7qU1bahcug9HWQ+Y6eRip1bWivIsQfD8GkthKBq3z4VkGG7X/1pdE99dLcYbCVhn84v4JtTxvAbQ4Yay7F7IyqW2qg8eqTD8BjwB/XRcmjOF4q8fdeeoQEjJsr5gU42UVHGgtOwXxsWVnUzg+dbKxF05eqxL7xsgNNonqetZET5ZbK6L9WsW+vLTNVwPLmY0JAA0NCqZvJr126jOadVFMC9oaA1863wmocVAkKuNr42pDc1idOa8DKT6gr3TA699JT6Xh/w6xmhromZGTUpaAf4iwl5rClquGiTu2v/2n8HfxRfvIEzThjfj+zM6Gob1QV9/ySKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199018)(5660300002)(41300700001)(86362001)(38100700002)(8936002)(31696002)(36756003)(2906002)(4326008)(6486002)(478600001)(2616005)(186003)(6512007)(26005)(6506007)(54906003)(8676002)(31686004)(316002)(66946007)(66556008)(66476007)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2dDMXRpdmViWWNScXF3LzJKQ1poY0NYOVBsa2xWRXBPc1hrVnNuQUc2RTBY?=
 =?utf-8?B?L0dOK0hpWlZkTnlhbGhFMURrTTNFRkRQSXh0VnJjNGZCZEZPRlRRSklnN1gy?=
 =?utf-8?B?aEIrQjFBN2NCRUN4UTFRUVhXZEk5TVhHNGdRNmFQWDFxa3VzNmFGNXppVWMy?=
 =?utf-8?B?VUk4VzhUemUwS3RDNmhRZy9BK2txcExOd3lvVFAvK0lRN1BrY1pzSms0YlFn?=
 =?utf-8?B?REJnaG4rWDRIT2p3clhVYlRyTGRjYU9oM3loczFVZjVSUXVtZHljdDF0NnJB?=
 =?utf-8?B?QmtoR0NURmQrczlBRTkzV3FQTHZNTnRlZVRQYXRwQnIwWTY2SldjY3hIcGF6?=
 =?utf-8?B?VktRWnl0OHZxRFpoV1BVcnBMb0pHSWMrRDJXNE9jUUZvYm5GVnBrWU9aME9D?=
 =?utf-8?B?SlMwc3dMQ2Vrd0hUR3BRT3BFNGFma1BUZGdwTithSUlNc0hhQ0ZEdnNtcnJk?=
 =?utf-8?B?SkVMcmpsMlhRT011NDJORmpQUnBwSHJpNnQ2SWgzM2puU3ArU0dLcEhScURX?=
 =?utf-8?B?b1FYK0hzeDBoRkdkL20yNWNrM2RiNEtibnpzdEgwNjYxTTc5VVNXYjJuRzkr?=
 =?utf-8?B?anRrV1JxazdtN1k1cVF0REQzTXdGNGZ0UnRhTVcxZ0FwOHE3aDQrVWp6NE4r?=
 =?utf-8?B?NndwQjIxMTRoTmdwSytkcmU2bUgrUloxQk5odFBSM0Nhc3h3UjFydFhXRkIy?=
 =?utf-8?B?aEFRclNpTko2RzdJTVlFOS9BTWlvQkxNanYrVm4xY1U2dlJicU1ZUzhjTVhr?=
 =?utf-8?B?MlNaL0FuM0lQZDVTS3M1bjFNQmZoNXp5L0ZRbWJTQWVBR2JkY3NuNXlFNUxR?=
 =?utf-8?B?Q05KWE1ySHZLVjc4ZHFDWEJXUDlJU3U2aTdicTRhdk5FUW12c2p2TlEyeER3?=
 =?utf-8?B?b0swd2k1b0JvQW5mN2ZsTVN6L05UMi9xM25COFo1RXRPMGdzKzRqVllUd0VH?=
 =?utf-8?B?LzR6R09DMHJtTk90NEtyeHE1Rmg5VHVrN3dwOUJxMlBmV2c0M3NtRW84Zkht?=
 =?utf-8?B?N2NLMzFHWFQ3V2NQMW0vak41QnhpQlB6UHZYTlJDVmlYNTY2eTZQVmZ4NUwx?=
 =?utf-8?B?amZ2d285MnRZRFZwQTNia2VRVGhDWE8xL3lWejNRKzFaMnpzOVpIS1pPVGZ0?=
 =?utf-8?B?dWkzVGd2OFVoZ2tRZlVwT1d2VEZvVVp4Z0VxckIzVzNNZjNRZmlqajhXNGhZ?=
 =?utf-8?B?cTFEZ0lwQ1AwNzZlcVJETXpOZHBLTHlyc0VVYzI3c3pzTExiRXNwckx1ZWtI?=
 =?utf-8?B?OTFMODVNMElZc3VOMkcwNU9MckhqQmhSUGF4akVqUHgxTTlMdjd4eGMvdXM0?=
 =?utf-8?B?NEJRZFVtTFNvSitJeXNMYk5ReFRxV21Pb3BtT25nV2p5ZW0rQ0F1L0NKekl1?=
 =?utf-8?B?ZVVrM3J2ZXRtNklWeUR1d2c5TFZ2aDR1N1pHY2twb0g3WTdEanhMdzl3eUZq?=
 =?utf-8?B?bi9Zek55bThRNmNsb3NTWUdpTFc5MmFOeEFGbTFVMnNpbGJtNWF3WWRhYURO?=
 =?utf-8?B?N2liQnhWS3hDUS8yZkRWK2h4M0IwS1JPNlZmZ0kzMzJ3SWM4dC9KZXpmTTR3?=
 =?utf-8?B?cjdEbjl0MHFuS0xlVlM3RkdiSHUrbHlyOUxLWC9KMENLSUVMUU9TNEJIY2xY?=
 =?utf-8?B?VGJVazMyUXJ4T1dBOVR2WTdXYzVVZUswNkpCMTk3eUxGNU5DSWU3d1FCTFdu?=
 =?utf-8?B?M2NqdVFCSi9DZXNWYndkcjQzNGhWYlMwN2hNZHJTOVVZOVdqRXEwb1ZUQkNP?=
 =?utf-8?B?TXBJN2NheTd1MEtvN084b3RtZHNhdlpKODRMQWZwNHpiMzJrSTEvcW9iQ0l5?=
 =?utf-8?B?Ym5oSVZKa2RPbTZTTVJiVXptcC9VS202QkdKVjVieTlSU0kwWCt3bXNGOWNT?=
 =?utf-8?B?eW1jN3ZldmdBaVN4eHpQek9TU2tkQVlFOUtXekJ4OWpndW11Q0Vpd1h4SFBa?=
 =?utf-8?B?MS9NcGhvblY3ZW50cEZ1VC9KaWNYemdLdVViNWtBVWFuR1ZtbFNtOFBOOEEy?=
 =?utf-8?B?U2h6eC9LMDlZSTc5dzZDcWNFNmd1SkV1YUwxMHM5V2N1T05CU1E3KzA0MjFt?=
 =?utf-8?B?aDVwQVd2SVRUS1hSNkZPZUdIUHRkeTAwd2xJdEl0SHpXdDJWUnZqUEJkOVNh?=
 =?utf-8?Q?H0uZpJF/0H86rzF2/CUJ/pZDz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c9d617-39e3-43b8-3589-08db2ab904aa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:37:14.0043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIC3/JJsPUSh53OFuXQjaGfR1NkXjDNp8JmtMlTZD1K5xB9NkIReFVDGSHRVcGZnlWnQPcAm1wPrv2/ZoSarfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7526

It looks like in the combination of aff8bf94ce65 ('x86/shadow: only
4-level guest code needs building when !HVM') and 0b841314dace
('x86/shadow: sh_{make,destroy}_monitor_table() are "even more" HVM-
only') I didn't go quite far enough: SH_type_monitor_table is also
effectively unused when !HVM.

The assertion early in sh_destroy_shadow() can have the type dropped
altogether: it shouldn't make it here in the first place. Pages of
this type are freed directly from sh_destroy_monitor_table() only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1190,7 +1190,6 @@ void sh_destroy_shadow(struct domain *d,
     ASSERT(t == SH_type_fl1_32_shadow  ||
            t == SH_type_fl1_pae_shadow ||
            t == SH_type_fl1_64_shadow  ||
-           t == SH_type_monitor_table  ||
            (is_pv_32bit_domain(d) && t == SH_type_l4_64_shadow) ||
            (page_get_owner(mfn_to_page(backpointer(sp))) == d));
 
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -205,8 +205,7 @@ extern void shadow_audit_tables(struct v
 #define SH_type_l4_64_shadow   6U /* shadowing a 64-bit L4 page */
 #define SH_type_max_shadow     6U
 #define SH_type_p2m_table      7U /* in use as the p2m table */
-#define SH_type_monitor_table  8U /* in use as a monitor table */
-#define SH_type_unused         9U
+#define SH_type_unused         8U
 #endif
 
 #ifndef CONFIG_PV32 /* Unused (but uglier to #ifdef above): */


