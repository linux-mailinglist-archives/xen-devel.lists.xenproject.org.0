Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F14665D1A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475355.737033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbYd-0006Rn-2t; Wed, 11 Jan 2023 13:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475355.737033; Wed, 11 Jan 2023 13:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbYc-0006OY-Us; Wed, 11 Jan 2023 13:54:22 +0000
Received: by outflank-mailman (input) for mailman id 475355;
 Wed, 11 Jan 2023 13:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbYb-0004QI-0J
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:54:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2085.outbound.protection.outlook.com [40.107.13.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 711636b6-91b7-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:54:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8551.eurprd04.prod.outlook.com (2603:10a6:10:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:54:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:54:17 +0000
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
X-Inumbo-ID: 711636b6-91b7-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/X6hsId14TLdqMovZn6xfbBMq9Vy09EQsW1KtOfE2uZQDRAyfmaFzLkyz3ViIM9A4QhMuDNDyTatk7lgQVqwG/pVCRsBf98lIbuOkmrlLCxHZU4w8rZqVKWu64hR4X/Qpua7y5EGND5muVzYm4UmopsNZl7V0t3Ae2dSxmYKPdc9o2oG0GO7L3h6yYw71BWgxaSn15KxyGmIuwC8ZYOhLV5crDK1M9ctSP3kPMSIaFzrEaVKsrUSXuZml4Vkn5wT0yGQYG73ExU+nui66hoEE4LPM/OAUvjp8yasAlSzqeQyxXqt672K0XwcFejgfZPwt7z4numTwZvT+czRSkxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzqulTEtucE5QZgMYqiUHlGTP59ie28OePbEzibohCE=;
 b=bfrmh5bfC8MStwAB4C97185IwRk+kJrSjopibru4g4Q0kOZwASoaireZ6dJmnbMNyOgEQJJYQALADPzukl38VdYun6Lorpq8LdlpygLEejqMNh03ewDRt12YU2oq9JRos+qqck1MMuawxxU8v4Ufw9JADOJ8UroPdVuZzdDsvq85SEW42CK0vtdKxTz4QYvmNvHM4FGLlsNaIur81DkvDc9kgx4LUt5b9YsrGKM4ta3v89T2po8mDaCT/8YsX+0hjy5reZ2aCiVGJDC/75YsETO/mCQcvYF/xwTHj041VkFQZ9XvniJv0BnmyZTSwS2w04PNKCDiB5QNYkIHOu6IbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzqulTEtucE5QZgMYqiUHlGTP59ie28OePbEzibohCE=;
 b=wCS9rReg0rpAQ9wiZ7XZRXdBoF/mZkkw+nJC/tq9uC7yQwZq6rUez8dJsa1odzHCxvhrx4YbJwMhOmcFTIEU2f40HUIGkq1Cyl6eXiT9QzAnL5b07Qy1jTBMqVJDIwA8MitB3yjnX4Idd7uo9SpwiK4d1eryLFR0lKRp8I2X0wHb8ynN4ox79woRaghbMNznGo9ZB+6wlPrVwekVy7K1NBaAhMopvP0cpLOzvNQrFLyDcisHAi8q9UCOtm/OY7RdzkY6HMjEzd7RMzR2jUBySg811E+A0nXMS+hrEF8Lhxg/8CBMnR1H7s/e3VWVEd+f6uYjRzFaFQLmb61qHozDiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af8ca228-473a-6777-4a4c-a474a5faec1f@suse.com>
Date: Wed, 11 Jan 2023 14:54:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v2 5/9] x86/shadow: L2H shadow type is PV32-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
In-Reply-To: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: b48130e9-32de-49a3-54e3-08daf3db54e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QhQC/dFlDo4JO9JDWJrG26/1RoDmxezYZQwk3Tp7EvGVrpjotE8XQ1cvkWp36KUSxrgiT2t1paRU1980GqV2OzyoSIPpdViL1aoyXSRFZOCOPbUqFm925eV1CQ0i4l3U5G0o0EM3Ywk+VyEw4RjL1bNyzYDvXdrv+AVqEqVvUg/HO5DcN3Km9STK51lh/6YrI2dSvpmMn/+A/RSVmklO6VvQhcV2zYsF/JRsrogDporW4N8WhaGTKgsiwTLstrg29tGggBUb/BJBVrDOlOvsyANhs3HlOPehYlG0wJ5HH2TAW1opRzBdGvmvuprBXmGhmIORhqQZyUY50szDysVrpGYzQ0CyF04fksBvkct9XcN79Zw9hS4Myk//NC8W5mGGti+LSdqt6+IR+7gz2jFubQEfXLPI7+FkkHT0Tgn9lTkWoTgUluzZntIKapiJJ/I4Toz8WEIj80P+gJGW/aGpmAivVctgodpdqfWPMKKDo2aZKwXdei1hk/NO/7Fl69Eh+JvK4jq5OCtTmz1YfJJc1QC+Gd3kVfuHWTx7Kk/2QG4VkpN9mlFZrRSGjnrcujcY5eqUviySqewL/3hAx7qxRs4VNlY/1C/yD8lYYhZR66rDKz2B0L1NKoMRiHsjQWSx94fBUNdOFVJu44UX0AXRiEWunTH7ZVJYcXXr5sclcDGuzcQa3Bq4KXh6elBVpSVEe2ERodGjxzbXw3wvBAk0C17UP3sP/a6Q+CLdTzj/QVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnhUVXBUVjN1SHJ1SjQ4VjdTZGNlaHBTc3IzSUpYUURTb3hqUzhZdUZacWhv?=
 =?utf-8?B?blhrRFJIU0QvbVR5Z3hZOUNNTkR2bDZBbzNjelJkVjlzK3d6cXZ6RDhQdElx?=
 =?utf-8?B?MHV5d1RtdjNtZncycHNkL2ZJY1MxLzFQbGZTbzZjMVhKbk8xMEFLQTFlRVVz?=
 =?utf-8?B?dXdqTVppYk1NTFBmQmlsZDRIMEpJcCtQbkxPN05xSWFrWTVKYWZEMXFHemMv?=
 =?utf-8?B?Ukp3aW1lTzcwdEhrQ0dCbm45eER3Mk1jR2lmUGY4bTRMR0I4L3lwckFWaGYw?=
 =?utf-8?B?S1I1b01uTTFtbzU3UDNiK1NRQ3FLUllNQW5wS2I0OEt3SXpQcXBON2NSU1F2?=
 =?utf-8?B?Q2tQTXoybG9rQnJDRXRUaG83NXpvRzUvUlgxcTlWMWJIUDUrMHByMzN4V1hE?=
 =?utf-8?B?Rm1uTkM0QVYyWkJwN2pUNnU1VllSVzVCTHRyYkE4SFZ4cld1bnVkZTNyY01x?=
 =?utf-8?B?a2FDVk9UbXVDNEVMKytrb2hpSVJoaWRPTVZJZGZhU3NFZmhpbE4wcTdVc3FF?=
 =?utf-8?B?UjNSYnMzQlV1UkJYQVJabWthRC9qNzArYXlDVEg0NVNBL0RaN2tGak83QmdZ?=
 =?utf-8?B?VG1CN0t4L1VKTlNwcFROeXA1KzBPY29ieXRndDRWMWtiSDFvcWNQUTRjYTd3?=
 =?utf-8?B?UVY1c3VMQzU5R0xwR0tIYWpmUFVxQUFRY01USlZzendEdkFRWEF3YVo5OGdI?=
 =?utf-8?B?cUViNlNBYVJoM1NDci8wbEJJUmpQMm9NcDhTMm1CaEU1OU9Ld1ptMkROWDdZ?=
 =?utf-8?B?WjFBU2laOHkza1p6Lzhlb2tCYUNzcHlid2pTY3J2ZVp0aDZZckg2a2dRYjVV?=
 =?utf-8?B?VFN1MHdoS1NnMFhPYlBEMHRJNVIzaERwcDV5M0I3dEE5RHhMZG5tUjUxQ3ZL?=
 =?utf-8?B?UnVVRTlPNW1UblpCZmJJSVpzQ1IyZHBaVzVickZDQ0JORkY0eWgyMHZ0bkkv?=
 =?utf-8?B?UmtZcmJWcW5hMEMvRkhRTURCVENhK1hEWkN2S29YS2VZME9RNjA0TmhRM1VV?=
 =?utf-8?B?dEs4OXlTVjN5cHhXOTF5WGxjZmRWSGt5VnV4SFQvSTNNRlduRVkvMktnaVBv?=
 =?utf-8?B?dS9mSGVjc3E2MWV0VkVEazIrNlBCUkl5WGF2SVFRdnFNUWJ0MG9TM2cvdGtL?=
 =?utf-8?B?MzdBeHo0UHpZQmp1S0ZXWnpCZnVPeVZVZ2JkOUpJaXpTSVpkZ04yRUlNSFYv?=
 =?utf-8?B?STRqSFVQaFFWRElQb3JGL1ZGYzM3Y3JxWHJBRStXUWRzYWVEamp0QTBrK0R4?=
 =?utf-8?B?RVpHNkdYZEN1SE1jb0xheCtMRTFNRVpnVDBaeTJRYlQrdVNmaUg2dkc2QjA0?=
 =?utf-8?B?Si9uUHM4SkR5WG1sTVgwRXlaV2lGTlNzcG8vSDZIYmlDcjQxQUlMRWEzZHND?=
 =?utf-8?B?RkhEOTlObWlSZFpVYVI0UXArS2xtdmZUVnlkenNBZ1FMTDRsemVBS0pXdXRt?=
 =?utf-8?B?VEhWWEY2UW83Q0RjZTd0UTBmRTJabjA0ZXZSRXB1VWFKZ2J4Q2llcytQZmY1?=
 =?utf-8?B?ZmlNNVRGMzdOQVVEckVicVhYemhFOG1mZGVPbjVta0QwQTJhYUsySG1TbzBS?=
 =?utf-8?B?eGNtd1JrUGRrRjdGSEZYeWliZzV2MnltK2lVSS9NZHlYQVJicHQrNkNQUitB?=
 =?utf-8?B?QWk4T0wzUTExZDhXc1I2d0lyOHVkTFJNd1RTZjB1bVVMY0xFdlcrRllaMVRK?=
 =?utf-8?B?SGZ5TVllVXY4TUk4L0ZsQUV1enYyLzRBZmRhaEtIVmJRbG0xek0welp3K0FO?=
 =?utf-8?B?dU5SZnpmVVd4aTYwRFBENVBIejA4c3R4Vml1bzhGcDY4ckJYaTdwM2RJVG0y?=
 =?utf-8?B?SWtCWXVlb1JteXpXd0dLMnp4VUVXRXJGWE1obHhOR0MrQ2JPaDJjNkxHcENP?=
 =?utf-8?B?SHJEc2I0eGtqZkE4Vi9vWXp4cHdpY3QvbGNXTDFPTE9lYXdWd083Rmt2SWM3?=
 =?utf-8?B?UFUrRkJQY05CQ3EzZ0xnM3J0UlgrMTVzaXBBMmxhZnU3NW9mcUtBUXJQbWVV?=
 =?utf-8?B?cTFlT1lXUUZJKzQyWTJqTWRHSnRESTFZaFVIUzFtR2ZsbUtUZE5LQ2NXcjJr?=
 =?utf-8?B?MDZDekQ5OFhSVGFGeWJlaXlFNmlmcE92eXIzdmpraDBKVVFIMXBtYjBPVWF2?=
 =?utf-8?Q?U19HL2/vndxWdWVUXBwToLwbs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b48130e9-32de-49a3-54e3-08daf3db54e0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:54:17.4815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuP8aE6jpW9NB/8eKpEaOGtNz9K0RdyoeXP/NdoOeawDu7gh95jKzC66swtjXMssOA0sexxtBgIh0rUQ7t8Ahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8551

Like for the various HVM-only types, save a little bit of code by suitably
"masking" this type out when !PV32.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't really sure whether it would be worthwhile to also update the
"#else" part of shadow_size(). Doing so would be a little tricky, as the
type to return 0 for has no name right now; I'd need to move down the
#undef to allow for that. Thoughts?
---
v2: Merely comment out the sh_type_to_size[] entry.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1740,9 +1740,11 @@ void sh_destroy_shadow(struct domain *d,
     case SH_type_fl1_64_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l1_shadow, 4)(d, smfn);
         break;
+#ifdef CONFIG_PV32
     case SH_type_l2h_64_shadow:
         ASSERT(is_pv_32bit_domain(d));
         /* Fall through... */
+#endif
     case SH_type_l2_64_shadow:
         SHADOW_INTERNAL_NAME(sh_destroy_l2_shadow, 4)(d, smfn);
         break;
@@ -2095,7 +2097,9 @@ static int sh_remove_shadow_via_pointer(
 #endif
     case SH_type_l1_64_shadow:
     case SH_type_l2_64_shadow:
+#ifdef CONFIG_PV32
     case SH_type_l2h_64_shadow:
+#endif
     case SH_type_l3_64_shadow:
     case SH_type_l4_64_shadow:
         SHADOW_INTERNAL_NAME(sh_clear_shadow_entry, 4)(d, vaddr, pmfn);
@@ -2133,7 +2137,9 @@ void sh_remove_shadows(struct domain *d,
         [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
 #endif
         [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 4),
+#endif
         [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l2_shadow, 4),
         [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l3_shadow, 4),
     };
@@ -2146,7 +2152,9 @@ void sh_remove_shadows(struct domain *d,
 #endif
         [SH_type_l1_64_shadow] = SHF_L2H_64 | SHF_L2_64,
         [SH_type_l2_64_shadow] = SHF_L3_64,
+#ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHF_L3_64,
+#endif
         [SH_type_l3_64_shadow] = SHF_L4_64,
     };
 
@@ -2210,7 +2218,9 @@ void sh_remove_shadows(struct domain *d,
 #endif
     DO_UNSHADOW(SH_type_l4_64_shadow);
     DO_UNSHADOW(SH_type_l3_64_shadow);
+#ifdef CONFIG_PV32
     DO_UNSHADOW(SH_type_l2h_64_shadow);
+#endif
     DO_UNSHADOW(SH_type_l2_64_shadow);
     DO_UNSHADOW(SH_type_l1_64_shadow);
 
@@ -3175,7 +3185,9 @@ void shadow_audit_tables(struct vcpu *v)
         [SH_type_l1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 4),
         [SH_type_fl1_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_fl1_table, 4),
         [SH_type_l2_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
+# ifdef CONFIG_PV32
         [SH_type_l2h_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l2_table, 4),
+# endif
         [SH_type_l3_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l3_table, 4),
         [SH_type_l4_64_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l4_table, 4),
 #endif
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -56,7 +56,7 @@ const uint8_t sh_type_to_size[] = {
     [SH_type_l1_64_shadow]   = 1,
     [SH_type_fl1_64_shadow]  = 1,
     [SH_type_l2_64_shadow]   = 1,
-    [SH_type_l2h_64_shadow]  = 1,
+/*  [SH_type_l2h_64_shadow]  = 1,  PV32-only */
     [SH_type_l3_64_shadow]   = 1,
     [SH_type_l4_64_shadow]   = 1,
     [SH_type_p2m_table]      = 1,
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -97,6 +97,13 @@ static void sh_flush_local(const struct
     flush_local(guest_flush_tlb_flags(d));
 }
 
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
+#define ASSERT_VALID_L2(t) \
+    ASSERT((t) == SH_type_l2_shadow || (t) == SH_type_l2h_shadow)
+#else
+#define ASSERT_VALID_L2(t) ASSERT((t) == SH_type_l2_shadow)
+#endif
+
 /**************************************************************************/
 /* Hash table mapping from guest pagetables to shadows
  *
@@ -337,7 +344,7 @@ static void sh_audit_gw(struct vcpu *v,
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2_shadow))) )
             sh_audit_l2_table(d, smfn, INVALID_MFN);
-#if GUEST_PAGING_LEVELS >= 4 /* 32-bit PV only */
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
         if ( mfn_valid((smfn = get_shadow_status(d, gw->l2mfn,
                                                  SH_type_l2h_shadow))) )
             sh_audit_l2_table(d, smfn, INVALID_MFN);
@@ -859,13 +866,12 @@ do {
     int _i;                                                                 \
     int _xen = !shadow_mode_external(_dom);                                 \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
-    ASSERT(mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow ||\
-           mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2h_64_shadow);\
+    ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
     for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
     {                                                                       \
         if ( (!(_xen))                                                      \
              || !is_pv_32bit_domain(_dom)                                   \
-             || mfn_to_page(_sl2mfn)->u.sh.type != SH_type_l2h_64_shadow    \
+             || mfn_to_page(_sl2mfn)->u.sh.type == SH_type_l2_64_shadow     \
              || (_i < COMPAT_L2_PAGETABLE_FIRST_XEN_SLOT(_dom)) )           \
         {                                                                   \
             (_sl2e) = _sp + _i;                                             \
@@ -992,6 +998,7 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
         }
         break;
 
+#ifdef CONFIG_PV32
         case SH_type_l2h_shadow:
             BUILD_BUG_ON(sizeof(l2_pgentry_t) != sizeof(shadow_l2e_t));
             if ( is_pv_32bit_domain(d) )
@@ -1002,6 +1009,8 @@ sh_make_shadow(struct vcpu *v, mfn_t gmf
                 unmap_domain_page(l2t);
             }
             break;
+#endif
+
         default: /* Do nothing */ break;
         }
     }
@@ -1123,11 +1132,13 @@ static shadow_l2e_t * shadow_get_and_cre
         shadow_l3e_t new_sl3e;
         unsigned int t = SH_type_l2_shadow;
 
+#ifdef CONFIG_PV32
         /* Tag compat L2 containing hypervisor (m2p) mappings */
         if ( is_pv_32bit_domain(d) &&
              guest_l4_table_offset(gw->va) == 0 &&
              guest_l3_table_offset(gw->va) == 3 )
             t = SH_type_l2h_shadow;
+#endif
 
         /* No l2 shadow installed: find and install it. */
         *sl2mfn = get_shadow_status(d, gw->l2mfn, t);
@@ -1337,11 +1348,7 @@ void sh_destroy_l2_shadow(struct domain
 
     SHADOW_DEBUG(DESTROY_SHADOW, "%"PRI_mfn"\n", mfn_x(smfn));
 
-#if GUEST_PAGING_LEVELS >= 4
-    ASSERT(t == SH_type_l2_shadow || t == SH_type_l2h_shadow);
-#else
-    ASSERT(t == SH_type_l2_shadow);
-#endif
+    ASSERT_VALID_L2(t);
     ASSERT(sp->u.sh.head);
 
     /* Record that the guest page isn't shadowed any more (in this type) */
@@ -1865,7 +1872,7 @@ int
 sh_map_and_validate_gl2he(struct vcpu *v, mfn_t gl2mfn,
                            void *new_gl2p, u32 size)
 {
-#if GUEST_PAGING_LEVELS >= 4
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
     return sh_map_and_validate(v, gl2mfn, new_gl2p, size,
                                 SH_type_l2h_shadow,
                                 shadow_l2_index,
@@ -3674,7 +3681,7 @@ void sh_clear_shadow_entry(struct domain
         shadow_set_l1e(d, ep, shadow_l1e_empty(), p2m_invalid, smfn);
         break;
     case SH_type_l2_shadow:
-#if GUEST_PAGING_LEVELS >= 4
+#if GUEST_PAGING_LEVELS >= 4 && defined(CONFIG_PV32)
     case SH_type_l2h_shadow:
 #endif
         shadow_set_l2e(d, ep, shadow_l2e_empty(), smfn);
@@ -4124,14 +4131,16 @@ int cf_check sh_audit_l3_table(struct do
 
         if ( SHADOW_AUDIT & SHADOW_AUDIT_ENTRIES_MFNS )
         {
+            unsigned int t = SH_type_l2_shadow;
+
             gfn = guest_l3e_get_gfn(*gl3e);
             mfn = shadow_l3e_get_mfn(*sl3e);
-            gmfn = get_shadow_status(d, get_gfn_query_unlocked(
-                                        d, gfn_x(gfn), &p2mt),
-                                     (is_pv_32bit_domain(d) &&
-                                      guest_index(gl3e) == 3)
-                                     ? SH_type_l2h_shadow
-                                     : SH_type_l2_shadow);
+#ifdef CONFIG_PV32
+            if ( guest_index(gl3e) == 3 && is_pv_32bit_domain(d) )
+                t = SH_type_l2h_shadow;
+#endif
+            gmfn = get_shadow_status(
+                       d, get_gfn_query_unlocked(d, gfn_x(gfn), &p2mt), t);
             if ( !mfn_eq(gmfn, mfn) )
                 AUDIT_FAIL(3, "bad translation: gfn %" SH_PRI_gfn
                            " --> %" PRI_mfn " != mfn %" PRI_mfn,
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -209,6 +209,10 @@ extern void shadow_audit_tables(struct v
 #define SH_type_unused        10U
 #endif
 
+#ifndef CONFIG_PV32 /* Unused (but uglier to #ifdef above): */
+#undef SH_type_l2h_64_shadow
+#endif
+
 /*
  * What counts as a pinnable shadow?
  */
@@ -286,7 +290,11 @@ static inline void sh_terminate_list(str
 #define SHF_L1_64   (1u << SH_type_l1_64_shadow)
 #define SHF_FL1_64  (1u << SH_type_fl1_64_shadow)
 #define SHF_L2_64   (1u << SH_type_l2_64_shadow)
+#ifdef CONFIG_PV32
 #define SHF_L2H_64  (1u << SH_type_l2h_64_shadow)
+#else
+#define SHF_L2H_64  0
+#endif
 #define SHF_L3_64   (1u << SH_type_l3_64_shadow)
 #define SHF_L4_64   (1u << SH_type_l4_64_shadow)
 


