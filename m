Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2175690512
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 11:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492283.761762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Kg-0000YP-JY; Thu, 09 Feb 2023 10:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492283.761762; Thu, 09 Feb 2023 10:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ4Kg-0000WI-GJ; Thu, 09 Feb 2023 10:39:14 +0000
Received: by outflank-mailman (input) for mailman id 492283;
 Thu, 09 Feb 2023 10:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OiHr=6F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pQ4Kf-00082J-4W
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 10:39:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbd729c4-a865-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 11:39:09 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.18; Thu, 9 Feb
 2023 10:39:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Thu, 9 Feb 2023
 10:39:10 +0000
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
X-Inumbo-ID: fbd729c4-a865-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb7TAX9XbHRjntH435Ii1Y/1h1GrE1jI3njwEnd6CLgWQInk4nUM0hx/8y9AgeWvSRmNjH1gBQxwRjc4/OZuASEA+0Zkz3XNQTcTnHivfZ5T426ofjydc0TU65NIqmDAwqV73n5QKDA5t455WYDdFlSKyqWgqicX4cZ7zf3XkJ1kW60vAmzsYJ6gYzjAIWm+4p0u+prf3do1aq5jKPC4hjJxQG6EjcCkmJ287Kwra6cz/SMukIt8f6J+5H2ZyF3zk2edWwEdPI6PK/yd2ss650y3QAX0DhIQtz0aG8OPZZ3k4TYoSEdMusvdKWxXmovpurMve5p34dyTu+a7jYZoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZ6dMhewYflEJz8XfzAjeFgRRV7iuGsvgI4j+vcP/zo=;
 b=PMkgax1bK6bUa2JrdkJZM7CekKC5LxnsOgisHk/OlPNU5pULQlAyoxIdTcizge77fvhpfdxrbEkVVfvjp7XYk1R0H3TfWiFwU7IPHtm9S0H/miKmc2sStDFJBqnEWTfE/SM8G+OYtRI/Ebhv+mQyH8IGOF21QhMYeDECxh/xXHLCpFPq+0nMsx44lQr0UuukS1MIbJedBUfvIotB5PFplambSIN63hwlRGDvef7lYucBn8Ohjc8BjmP08IPNWO22zoHjLtt32m9fAwPXHdzQ5fFbzoTIQDKrDFToN8occB1yxpdgDjBVy1TPLiETh9sqypHwEKlZR+YjROnUpWc8yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZ6dMhewYflEJz8XfzAjeFgRRV7iuGsvgI4j+vcP/zo=;
 b=5q1MTHOd+W1I/BYvBPolA2lWuSa+Cwso0BwX3Apma4GMnZQ50awMWmtVgXLa8e4nQXdmr45evOXQO+7jpupViPFDqE3e5V4VxfxTQozh5sUloGnrDCsF+NHAtDxmYhtTzGFLTmoKKpw+s5ZVnkllATiCUhQJMJbtungeX2F9qEaZP3S33+0PQAMGzjYbOM6m8SiG1HG1w4EuepzBJosPnMsOSdGlCpRTvZvmtWZbVF+BZrMG+8wupqIVARDskUyd7uyChC6xUb2hnioU78uU6DoUHC3uZEIv6bHMaXrXrFpSBSOQGxMpQ0yJV+cFi7X93Uaznf+OyOfY6Vni787klQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68bb1c78-2b6c-4b8d-725d-f1d6a6c92dcb@suse.com>
Date: Thu, 9 Feb 2023 11:39:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 3/6] ACPI/CPER: use standard C types
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
In-Reply-To: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: d13952fa-7d8d-4bec-c235-08db0a89e095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aVZu7CDR3mW+eRsPE8rdamQyutMkNkiE1cfBktYMi4JjoWZPoAka63yxGdeqOb0Eqhzfs+XqUC1bdeEQ1rBU17kSOBjjrMFxAqu4xEEvRS/+lFzqWt8se6zPRXJlVVhQbu6yDmIMgwCUa4cYelgoghrtc60WEe1uzgrvTmyLpOmvUotCWLdjZikkP7+LFQ8ah3MFmocL7LQd2dQyx/Yjzjcq+Sl2W/QvRoXQpum44d0TV0uyLucD6hhnfp2w/9w45SYOA+c5t0UiQZeyu+kN42OprIGpJfWkLB6GAfuARvgAig7F/gdY1MjZ6MC3KlsiPrMSCmk/BWY46NOBquUxCJLEJ1ZKD5vs2bGbw3rrZHUMeiGl4TGQqM4LU0OZ7oHsRCOvbOcXVA/eHDabdmn4ZCfAHm4JqlQRgn6Bqn2JAvGgIiGCKvLuSmoWSa43h9Nug2jMYDfJG+N6DAaN2usaOOozTnZtFlTB0OAYVayzH6QUPmYYCC+s5PC9KPOW3jsalZY8skoBNUeukMticrmq97zfderoO91rwMenRCJleMwc5XMPAGY9EMwAAHdNH+xSCHNDP1TG1lJyj++vi3PAi0v+yhbXVkERZOjgKxBlBLvkAifgsKg6g2k1KU26dIdTA80Or2H0T0NiMxLPljsJer6s1FsdLw+8yR7ffc5jI5gsTp0G+2Mii4p9pjPpgF8iK//h8fZ283nF1ghSaHVX9Etz+jRp68fP+axWe+HOXY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(5660300002)(86362001)(31696002)(186003)(8936002)(2616005)(26005)(38100700002)(6512007)(83380400001)(54906003)(66946007)(316002)(4326008)(41300700001)(8676002)(66556008)(66476007)(6916009)(478600001)(6506007)(36756003)(6486002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0duTkhIMkQra3IwMEgwNGhQRHdraUJuRFNFdG5GcTU2YkU4aDJtdWFUa29i?=
 =?utf-8?B?R3JyWCtpalA2SlJQUmk0YkkxMkIzTW5hRW5seDViY00xZzlpY2thNk52QW9K?=
 =?utf-8?B?RDA3SE1aVnJzV2JjMVZDSXVTTzBsN2hja0YyUmllOG45K0pHcmIzUUI1T2ly?=
 =?utf-8?B?Y2psdzd4RXArc0xtUmsrVkZ3MldqSlp3TDJpMW1NbzduMWxBUExFS3d1Z2M5?=
 =?utf-8?B?bVlmMWFvRVFwSlNWUHYvblpUNWw0UzBITWVmQlgzY2hScU5YS0VJQXJ2Nndm?=
 =?utf-8?B?RC8yVlNYVWdpMmpneDBINndvKzMrZ0ZMOVhveUxSMXNTdVpCN0xYbG00QXVW?=
 =?utf-8?B?R0hKQzNXcDNUaStpYWM1ZkJ0K2ZvcmY1eXhiVnV0Z25GZkFwMG1IVmIvdWVH?=
 =?utf-8?B?Q1ZkTU41MndRUG1RcjI1SFJVWXFhK1VzWVFDczd6cHhlQ01WRkFHSm9zOVhY?=
 =?utf-8?B?MEV6eklsckR1akdNMWN3UFVTY2F2RDhvbXRzcFVVZEtmZm5yeHBadXN3Q1ho?=
 =?utf-8?B?cG1WRWdiZ2pzQ25VREhxQ2VWbi9GdGtZUG8reDhVc1N0aEl3NEZ2M3VSTXNk?=
 =?utf-8?B?dEZXUmM4cFIxVSt5TUp1SWFNSWNUb2dlQzcreFk4ODZhZGg1OE1ZQWdITGNM?=
 =?utf-8?B?bE1Ya0NET0VGUU1ZQlZSTkE3cnZOaDAzK1krbW5qS3lzeVJ5NlQyQ2lLNWoz?=
 =?utf-8?B?OTBpcnpnaWFheUVCR21qNlEzZmloSnB3Y3cxeFZBSU1RcVFnRTh6dTN6aFoz?=
 =?utf-8?B?V2U2ZVB2S0xldGp5UUVOVkZHT29QaXRMVlBwWDQ5cWIxVHRNNGxaOUlmRGM3?=
 =?utf-8?B?eEZKUk1YUHR3eUNIaTNqNVg1N3RKMEM1RXNlUnNQaDhvbFVSeW1LcG8zVHlv?=
 =?utf-8?B?WjVMS3lzbGNmckZSY3JNMlI1RDcvdUZOUUJxMlFPRExrY2tQMGFKUmErbUhj?=
 =?utf-8?B?elFpcW91a2krbVlHWEwrK2FtdktLVG9IKzdXeXMvOHpJdnI1c0F5b3Bmc3BG?=
 =?utf-8?B?c3dpcTNWdUNVWkN2MFk0dk9lS25OK0hRVjlINXVmOEl6eiswemVscUlGUEJm?=
 =?utf-8?B?V0xXT1FnZnlxbFJvUHVCVFNJcFBRV3VRNm5id05xdFM5R2VGNmQzdVpnVHEx?=
 =?utf-8?B?WlYyS2lEZTM5NjJzWDZnb1l4WTN3TytGNmJrWVJoWEFNREJsTmJFVHIrbXlK?=
 =?utf-8?B?UFBWM3FFb2orTEFCYlVWV1Y1TUFBdmlHN0FWY0dMeXE4ZHFnVFc0YWxaWk1x?=
 =?utf-8?B?Rkdxcms4TWVpaVVVRVdkMnZjY2J2dy9rRHNOTUpiZzJUV3I4a3BpOG84Wkpx?=
 =?utf-8?B?MVZOU2JyUUlUVHFqTkhOdy94N2p0czVXZTNlWG1xQUZ4SjZNUkZBY1Bsa3A5?=
 =?utf-8?B?c1BrSVp1OGNrLzdCa0hnUVR0TE9WaUM3bEpoT1FORThBNmw3S3IyOUl6TlR2?=
 =?utf-8?B?VzFIc2h1TVZpRlE3Vm56L2pHeURVZk1XQjRKNHlqRFBPYXJCbGl3MXBha1Er?=
 =?utf-8?B?Wmd2dGFOaUZEa0t2ZjVtakFmUmxsRUV0VUhKV1UyeituR1UxeUc5WXFLSnc4?=
 =?utf-8?B?cDk0U01vMnpTTDcvcXpvUEQzdWF4TFczd25JTUxMc1VqQVlYR2VodlZzTm5Y?=
 =?utf-8?B?RDNXUHk1SFk3b0pNTXBabHc3NlNDMnJHTlArOGwveEk0VUwvbitaOCtmMWJa?=
 =?utf-8?B?KzZwYTR6bXBWZFlpWW1TbW00NUZ3b002Y09KMkZoTExhR0xZQTZSS3I1M3FU?=
 =?utf-8?B?Z0xVMW40ZUJYcmF1Wk1yWmV3YlJKWFFQb0s4THkvVnJPVFlCeFdJS0RROEE3?=
 =?utf-8?B?MkVRYk1HVXR5NDB2a2wrNHovUnNMdEFIY1h6WVVLTi9TSlFmS3hYRXZQaTVt?=
 =?utf-8?B?cFpHVG10VUwvMFVLc1pXcEJaVFArcldlLzY4NnZXcm8zSTE3VDR4Yjl1VVI5?=
 =?utf-8?B?VjZkS2tNWGRJNTJtNmNrWU93NDJuU0xaZUFVY3MyVkpMWlExL1FCcEJtSk91?=
 =?utf-8?B?eXYrb2dsT1ErT2JWWXg1R1pZMEY4MFFtb2JPeU42T3FVMS90WThoRlY2Qy9k?=
 =?utf-8?B?cjJiSjhEWHNuOFBvWFI3OHd5QkhZNzdKVGNiMmlMcWlUcnhtYmYvQ0dHNFEr?=
 =?utf-8?Q?mxfjbZURAoENBDKuqNzNXfrgQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13952fa-7d8d-4bec-c235-08db0a89e095
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 10:39:09.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ij1zuDafS55VRwyH3CfYoxU8FvupoEEmXjhYnPpPix0DEfzIC5cjGFFkla0ndAjpxJQoY6hZuN/BI9/ueMBL/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

Consolidate cper.h to use exclusively standard types.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -27,7 +27,7 @@
 extern unsigned long get_sec(void);
 
 typedef struct {
-	__u8 b[16];
+	uint8_t b[16];
 } uuid_le;
 
 static inline int uuid_le_cmp(const uuid_le u1, const uuid_le u2)
@@ -35,12 +35,12 @@ static inline int uuid_le_cmp(const uuid
         return memcmp(&u1, &u2, sizeof(uuid_le));
 }
 
-static inline u64 cper_next_record_id(void)
+static inline uint64_t cper_next_record_id(void)
 {
-	static u64 record_id;
+	static uint64_t record_id;
 
 	if (!record_id)
-		record_id = (u64)get_sec() << 32;
+		record_id = (uint64_t)get_sec() << 32;
 
 	return ++record_id;
 }
@@ -154,36 +154,36 @@ static inline u64 cper_next_record_id(vo
 
 struct cper_record_header {
 	char	signature[CPER_SIG_SIZE];	/* must be CPER_SIG_RECORD */
-	__u16	revision;			/* must be CPER_RECORD_REV */
-	__u32	signature_end;			/* must be CPER_SIG_END */
-	__u16	section_count;
-	__u32	error_severity;
-	__u32	validation_bits;
-	__u32	record_length;
-	__u64	timestamp;
+	uint16_t revision;			/* must be CPER_RECORD_REV */
+	uint32_t signature_end;			/* must be CPER_SIG_END */
+	uint16_t section_count;
+	uint32_t error_severity;
+	uint32_t validation_bits;
+	uint32_t record_length;
+	uint64_t timestamp;
 	uuid_le	platform_id;
 	uuid_le	partition_id;
 	uuid_le	creator_id;
 	uuid_le	notification_type;
-	__u64	record_id;
-	__u32	flags;
-	__u64	persistence_information;
-	__u8	reserved[12];			/* must be zero */
+	uint64_t record_id;
+	uint32_t flags;
+	uint64_t persistence_information;
+	uint8_t reserved[12];			/* must be zero */
 };
 
 struct cper_section_descriptor {
-	__u32	section_offset;		/* Offset in bytes of the
+	uint32_t section_offset;	/* Offset in bytes of the
 					 *  section body from the base
 					 *  of the record header */
-	__u32	section_length;
-	__u16	revision;		/* must be CPER_RECORD_REV */
-	__u8	validation_bits;
-	__u8	reserved;		/* must be zero */
-	__u32	flags;
+	uint32_t section_length;
+	uint16_t revision;		/* must be CPER_RECORD_REV */
+	uint8_t	validation_bits;
+	uint8_t	reserved;		/* must be zero */
+	uint32_t flags;
 	uuid_le	section_type;
 	uuid_le	fru_id;
-	__u32	section_severity;
-	__u8	fru_text[20];
+	uint32_t section_severity;
+	uint8_t	fru_text[20];
 };
 
 /* Reset to default packing */


