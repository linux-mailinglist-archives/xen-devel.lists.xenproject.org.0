Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09586D0310
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:25:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516622.801036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqOk-00069j-GG; Thu, 30 Mar 2023 11:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516622.801036; Thu, 30 Mar 2023 11:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqOk-00067D-Cl; Thu, 30 Mar 2023 11:24:54 +0000
Received: by outflank-mailman (input) for mailman id 516622;
 Thu, 30 Mar 2023 11:24:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phqOi-000675-7f
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:24:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c5f2507-ceed-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:24:51 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8214.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Thu, 30 Mar
 2023 11:24:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 11:24:49 +0000
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
X-Inumbo-ID: 7c5f2507-ceed-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed5Yb64HBDEojDTjedNMJvcrMEl1ZGkCW/6Uow5ImvTX61u8o5rxNDFZCeI0a2onvnOxBcpLzbgOxVeJL/sLadCfz8TUDOF32EP8ZohsNmCvuj0cXyU2Tgo+Eg3NzDD4y6u6bjk7TGIvj8LOismoCWHW0DJRnBXHAyCB1VlQRaOdEQIiys1PkU5JFDzvbHRcW7j/QqK5sU7J3mke0KD1ngVFiBrbVqdilmp3PGv5L0yw0kcgrm1QkLvLQVOFJuyPBb0Z14zxlFYZo4qSHRjPTmn60Nb1ATBxGMU+fXbb9Xsgb54Qd167SjvQ0FtfHcGaX/yXGwp2cm/cUq8480Xqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXU8ERDT0GGzzL6ivSLQ/bjRaCzv5zsN1CtsZo5Kh5Y=;
 b=bq9zzMcmjNHaQTaJKzNvCF8ksQZQdjVV6PZSae6/eRQRGw9676U/V4dkFvyn5Lm7zPCI4kP7F03AyA4xiSyG1RlbpbmztOsVOs+tCu1llvRJ8Wdzt1xuAOlbxf7J7hKKZMXOzhqf2ath1WopiatS6bneapzIOK33JrPS1DWsx8uciPYY7IVOXihkFmDUi/sTvHKeqYwG+XxmiR2/DcQquJyTLRIIcI2UGfrxlUgOkUubU+6ofE1FXu3NMgtqJbwfVdSmZhPkOhBqQNQ+YBPbbPuu4LAdeC1RcFyOIvZF3J7Fju9T5BI33pFckw/cuzaAIB4roqJHFzuBP857fuP+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXU8ERDT0GGzzL6ivSLQ/bjRaCzv5zsN1CtsZo5Kh5Y=;
 b=1jjis2BQLYgqLLnolxKuGOBtt+jbERMlKBjhSw1VZMcyRoYGNv22x6FA8ZpWWC/qeZdgDu3M3D77XgEl378MaVgRSO69571EXpY0RehC/GSPC999VIuC2ONjz1FYDfofoV+eaYVN/j06Sqs9KM+ZaVkfC/qY4pCTMKLS/QKRdFRAa8dAue5jypfsIDtC33vPTJa7YXvFZ9SNgT/DJP/48XyXkdESAiCIbc9WmUHKEzwXDJK7y5UM9HLSAJprvs5qsoPl7Zvkx/Rr9toAjGkC7oXLhpI+m8PClB0Sqx+NMLLbYIq/PRYlWxwU1fe0sjFQmbsN4rQaCQp8TDVFvkPYUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0b576db-08c3-3e2a-e3fe-7a64db871ae8@suse.com>
Date: Thu, 30 Mar 2023 13:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH v2 01/13] x86/shadow: rename SHADOW_FOREACH_L<N>E() to
 FOREACH_PRESENT_L<N>E()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
In-Reply-To: <fae14dc0-83aa-4647-6755-dd6913b6dba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8214:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a6fa75-b8ba-43bd-ac0a-08db31115fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2twCQSf5zbI+6lLJnnyt3wyYFXaGsXSLlpmrY/2PAVL78yzz+XPGIbjIvdZkLxleZmZI/iRASxqZyCuAj+ZB+mA/1u0mttCRh26XtkDWOFkhZcYSj9D0gfGAdRD+1kFXASmmTjQYQxKZjoNWzdd8ywKvxtsfnzWMQUsfiv67SMsGYV/f+QN6WkdkI2oAkvRrGq4aWt6iijG4DgZZipOSbkJeCurOjg0onPnIwmW+JE/YKN8l4kN7zv+ZDsVBolBvHBgMFIdCc9xSjUgjSnJT2NyznnK3BNkRtiWJXa2u+VFwlUct1U6jYqOiOZFUI7kzXvFeX4MWz6zaI0TPY4Yqa68kHyZBsGmrB7LtK7ryfREcGApUPzjJVjLfSqcmPmpsFBWCAWKu9vVNi51cpK1Jfg4WDKBO2lSP8zWUEbHEw11eOhJxxVAR2efTUMHLQXek2SPRjum6y0FheDUeSpiD/djV4eAQ1TaGMvkhuMBDcRil3yUkflR58e/Uc5ehOHQ7pl4/B1QxE6v742IEGIr0ts8P1+3RWOwqWqcEf5AnYJEi3S8kJkpiEv8nQC7jBOOJldavLnhkBYywlwu0TvTW79S/0k72MGxpJh1dgYZrr0hx1Mx6SpikSp2Uh9LUpV4l/wmpY5jd1kW1/E0mudb1RSKogzXLB752DDU/NP9eDS8z7TvQ4oQ56hJwlPfQm94SEw1Uqq+3vCYcqKd+hD8GkwQkSeTKmge4dxGFasa6cGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(2616005)(186003)(83380400001)(6486002)(478600001)(26005)(316002)(6512007)(54906003)(2906002)(6506007)(36756003)(5660300002)(6916009)(38100700002)(8936002)(66476007)(66946007)(66556008)(41300700001)(31696002)(8676002)(86362001)(4326008)(31686004)(43740500002)(45980500001)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFWRkJKSTFubklFeExPdHg3SEFnVjYwcTJkY2NqSEUvR2wyR05BZms1WlNS?=
 =?utf-8?B?QmJnS0xPQmtNMm1tajA4SE0rSVQ5VUprVUZyS3JabmxlakJKb09Xbjh3dmpz?=
 =?utf-8?B?TU5hK2xuTlRRUU4vR0FLQTRycCtHYm5vRXZ1bFBUY2FZakJaUnYydGRqOWd4?=
 =?utf-8?B?ZWpPbzVwMW1vODdNeU1Oak90bnZMV3pOZHFLMGZjZEtxb0U1UHlCK3I2K1NM?=
 =?utf-8?B?SHRQVnhZM2kyQmxqUWFwaHZtd3BpQ05aNkF6dnliK0Vra3NLMFFYM3VCTVhX?=
 =?utf-8?B?bEh1bHREMWJpdHY1WWt3cDYyRkJzOWR1N0h3NElReWpBWW1TamU3RS9YU055?=
 =?utf-8?B?aVlmTmlnZVhsL1JvVDFyY3RKOEgxWWlPSnFEZlhVakw2L08xWFFEbVNJSHJV?=
 =?utf-8?B?Q2ZDMlVYU2xEZ3Znbnc5cW9hNURzalJadVJxaUhpY0FDbmY5MCtPNWt5ZDBD?=
 =?utf-8?B?b0xBVytZSmZUYm1QRUEvZHlPeGd2ZTZTbSthTkY4NXcyNHZmVW1FQ2h4dWIx?=
 =?utf-8?B?YXFtNzdxejQ4Sk52Ujg0MUMyaHRRRDIyY0ExUk5vNTdDZ3ZFeXk1ZExXMUlM?=
 =?utf-8?B?b3IwQ0NFZUQzdS9ubERPQWZOTmZOZTQyVk1HdUJ6Q25LZTA0akhwa3BBaG9a?=
 =?utf-8?B?N3ovYzVPbVVwVjBLTlNwcFV3ZHdnQnlXOWdRVXJCRFY5SCtTbnR3SnhKRmVY?=
 =?utf-8?B?dWhsM2k2OFZlM2hnMWZhK1JoR1JDaDQ3U3M5WE92MU1NRkJvUHFUcHkzNXN1?=
 =?utf-8?B?TnBVdDg4OTZHMG1ia05pekc4MG9aeFpOeDB4M2hEOTY0NnZWdXkxWUpzOWRI?=
 =?utf-8?B?OGdITkllRXgzNS96L0JmSWdUU2Z3dU1TYlNOV09Fa01LSG9kcitBcStGOXhM?=
 =?utf-8?B?OFpCNUc2MWNTTDQxOFU0VmRhZGkyWHZYV0FZTDhQdHNVMkVHU2taRTNFUWZt?=
 =?utf-8?B?NWFSNS92MU91ZUhzMDNFYzgwL3pLcFF1UXFPM0FFZ1ZYVmMycmpmM3owdzZa?=
 =?utf-8?B?UUFZNXZ5ZG56YzVzK3RHZExtajJVWVVURDFTbERVUGpLUDk3MFhlUG5ZcU1p?=
 =?utf-8?B?dGVWVXNuNFZKbVZVZWIzL1RXMFJKVXpHWEtQQmNwNmtQNElGSEVwOXA2cFBY?=
 =?utf-8?B?YmorSGlrS2ExbXFOVlZ0amU2YVVtem5pbDFmd3Z1b1l5Q3pvZ3Z3Y280czR5?=
 =?utf-8?B?SkI0UnRDWEF0NHczNXBpeTM1aHdLenY2RU9ab0xaZmFWdEY5bkxvNkJuRHZM?=
 =?utf-8?B?Rk9TZDI3SWhSMXJCNjIySmdEb2V5c1RBUUlWUnlGRjQ3R1dTMFdmcHI4TkNL?=
 =?utf-8?B?UU4xNmlSQ1JJdHBUNE5UelJEZTNXZWN1NFNFMEQvRUJkaG9mdHFTdEpjbUts?=
 =?utf-8?B?U3E4dlhKS0dNZlZBNG44REVVMVZFV2ZSaExYRDBuMmdhSDczVTlUdVhmS2RK?=
 =?utf-8?B?Z1lkTWRYc1YrdlBHWHlLdy92eStSUDVlb3JwNnpNZmY0TUVXRnB4UFFCN3Na?=
 =?utf-8?B?UWZJR2YxZ1ZLWEFScHE2YTB1bTF3dThHbUh2VDEyNUJMNStRWUR6OGdJZi92?=
 =?utf-8?B?Y1JGRVZ3RXNObk1PTGtkUmRxakFKaFdZeXM3eXV4Q2FUeC9sVUExVDJqR1Vl?=
 =?utf-8?B?Q2w2NllkVi9PTHluNjFxWXlQWDdoWGxTQ1l3NjRNNC9oVzBDdWF4RHhMbkRR?=
 =?utf-8?B?bUt5Qjl6ejl0S1dBT3lvVktuOTBpWDVKZytEMkZucHBiZmYvWXdZYklKTHV0?=
 =?utf-8?B?bG1DOHEwcnZVWWxYcjBlbEVWSXcyczRURnl6eVlGZjRQaHY3MFlON3dsMnBZ?=
 =?utf-8?B?REVyd2gvYVlrempmaDdJUVk2Y1FDNFZZdnNIcjM1OTdHYUlJU3RlMzNTck1a?=
 =?utf-8?B?VUJuVGpScDlWVmFpWFB5WEZ4TXRGRUUveXlhTSt6V3FOTW1JYm5ZZTdTL1Bp?=
 =?utf-8?B?UTgxdS9YN1hIMkpVQk9peXp4bHlNemt5TnFtVWYvOVcwRXovQ0xDeWNSYjBs?=
 =?utf-8?B?bzhJTlNvUHQvc2xpaG1RYnJiU2o1bjJYaWtzU1I5WWJvTy9LOHVXWjJPRXJ2?=
 =?utf-8?B?amNJRkZMTlBBYmZuSXdwNzFVVWxPV1duWThPZHJ4aHMyckNLSkJ2cm5scnFs?=
 =?utf-8?Q?qke+bixDk/Q9d5LcGPO1Yl1Ne?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a6fa75-b8ba-43bd-ac0a-08db31115fc7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:24:49.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCWgJxjCr/LFGnU4CcNYxCLHeW+RYt1F9H4XWMRgxPmx05qdNdtDmrUdGt8J/rnAPnnhu9AtWAqwqQruwydI6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8214

These being local macros, the SHADOW prefix doesn't gain us much. What
is more important to be aware of at use sites is that the supplied code
is invoked for present entries only.

While making the adjustment also properly use NULL for the 3rd argument
at respective invocation sites.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -777,7 +777,7 @@ static inline void increment_ptr_to_gues
 }
 
 /* All kinds of l1: touch all entries */
-#define _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)        \
+#define _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)       \
 do {                                                                    \
     int _i;                                                             \
     shadow_l1e_t *_sp = map_domain_page((_sl1mfn));                     \
@@ -796,25 +796,25 @@ do {
 
 /* 32-bit l1, on PAE or 64-bit shadows: need to walk both pages of shadow */
 #if GUEST_PAGING_LEVELS == 2 && SHADOW_PAGING_LEVELS > 2
-#define SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done,  _code)        \
+#define FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done,  _code)       \
 do {                                                                    \
     int __done = 0;                                                     \
-    _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p,                          \
+    _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p,                         \
                          ({ (__done = _done); }), _code);               \
     _sl1mfn = sh_next_page(_sl1mfn);                                    \
     if ( !__done )                                                      \
-        _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code);       \
+        _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code);      \
 } while (0)
 #else /* Everything else; l1 shadows are only one page */
-#define SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)         \
-       _SHADOW_FOREACH_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)
+#define FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)        \
+       _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p, _done, _code)
 #endif
 
 
 #if GUEST_PAGING_LEVELS == 2
 
 /* 32-bit l2 on PAE/64: four pages, touch every second entry */
-#define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)     \
+#define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)    \
 do {                                                                      \
     int _i, _j;                                                           \
     ASSERT(shadow_mode_external(_dom));                                   \
@@ -839,7 +839,7 @@ do {
 #elif GUEST_PAGING_LEVELS == 3
 
 /* PAE: touch all entries */
-#define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)      \
+#define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)     \
 do {                                                                       \
     int _i;                                                                \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                        \
@@ -859,7 +859,7 @@ do {
 #else
 
 /* 64-bit l2: touch all entries except for PAE compat guests. */
-#define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
+#define FOREACH_PRESENT_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)      \
 do {                                                                        \
     unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
     shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
@@ -886,7 +886,7 @@ do {
 #if GUEST_PAGING_LEVELS == 4
 
 /* 64-bit l3: touch all entries */
-#define SHADOW_FOREACH_L3E(_sl3mfn, _sl3e, _gl3p, _done, _code)         \
+#define FOREACH_PRESENT_L3E(_sl3mfn, _sl3e, _gl3p, _done, _code)        \
 do {                                                                    \
     int _i;                                                             \
     shadow_l3e_t *_sp = map_domain_page((_sl3mfn));                     \
@@ -903,7 +903,7 @@ do {
 } while (0)
 
 /* 64-bit l4: avoid Xen mappings */
-#define SHADOW_FOREACH_L4E(_sl4mfn, _sl4e, _gl4p, _done, _dom, _code)   \
+#define FOREACH_PRESENT_L4E(_sl4mfn, _sl4e, _gl4p, _done, _dom, _code)  \
 do {                                                                    \
     shadow_l4e_t *_sp = map_domain_page((_sl4mfn));                     \
     int _xen = !shadow_mode_external(_dom);                             \
@@ -1288,7 +1288,7 @@ void sh_destroy_l4_shadow(struct domain
     shadow_demote(d, gmfn, t);
     /* Decrement refcounts of all the old entries */
     sl4mfn = smfn;
-    SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
+    FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, 0, d, {
         if ( shadow_l4e_get_flags(*sl4e) & _PAGE_PRESENT )
         {
             sh_put_ref(d, shadow_l4e_get_mfn(*sl4e),
@@ -1319,7 +1319,7 @@ void sh_destroy_l3_shadow(struct domain
 
     /* Decrement refcounts of all the old entries */
     sl3mfn = smfn;
-    SHADOW_FOREACH_L3E(sl3mfn, sl3e, 0, 0, {
+    FOREACH_PRESENT_L3E(sl3mfn, sl3e, NULL, 0, {
         if ( shadow_l3e_get_flags(*sl3e) & _PAGE_PRESENT )
             sh_put_ref(d, shadow_l3e_get_mfn(*sl3e),
                         (((paddr_t)mfn_x(sl3mfn)) << PAGE_SHIFT)
@@ -1351,7 +1351,7 @@ void sh_destroy_l2_shadow(struct domain
 
     /* Decrement refcounts of all the old entries */
     sl2mfn = smfn;
-    SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
+    FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, 0, d, {
         if ( shadow_l2e_get_flags(*sl2e) & _PAGE_PRESENT )
             sh_put_ref(d, shadow_l2e_get_mfn(*sl2e),
                         (((paddr_t)mfn_x(sl2mfn)) << PAGE_SHIFT)
@@ -1389,7 +1389,7 @@ void sh_destroy_l1_shadow(struct domain
     {
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
-        SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, 0, {
+        FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, 0, {
             unsigned int sl1f = shadow_l1e_get_flags(*sl1e);
 
             if ( (sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(*sl1e) )
@@ -1421,7 +1421,7 @@ void sh_destroy_l1_shadow(struct domain
 void sh_unhook_l2_mappings(struct domain *d, mfn_t sl2mfn, bool user_only)
 {
     shadow_l2e_t *sl2e;
-    SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
+    FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, 0, d, {
         if ( !user_only || (sl2e->l2 & _PAGE_USER) )
             shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
     });
@@ -1432,7 +1432,7 @@ void sh_unhook_l2_mappings(struct domain
 void sh_unhook_l4_mappings(struct domain *d, mfn_t sl4mfn, bool user_only)
 {
     shadow_l4e_t *sl4e;
-    SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
+    FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, 0, d, {
         if ( !user_only || (sl4e->l4 & _PAGE_USER) )
             shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
     });
@@ -1666,7 +1666,7 @@ void sh_resync_l1(struct vcpu *v, mfn_t
     gp = map_domain_page(gl1mfn);
     gl1p = gp;
 
-   SHADOW_FOREACH_L1E(sl1mfn, sl1p, &gl1p, 0, {
+   FOREACH_PRESENT_L1E(sl1mfn, sl1p, &gl1p, 0, {
         guest_l1e_t gl1e = *gl1p;
 
         if ( snp[guest_index(gl1p)].l1 != gl1e.l1 )
@@ -3564,7 +3564,7 @@ int cf_check sh_rm_write_access_from_l1(
     mfn_t base_sl1mfn = sl1mfn; /* Because sl1mfn changes in the foreach */
 #endif
 
-    SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, done,
+    FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done,
     {
         flags = shadow_l1e_get_flags(*sl1e);
         if ( (flags & _PAGE_PRESENT)
@@ -3597,7 +3597,7 @@ int cf_check sh_rm_mappings_from_l1(
     int done = 0;
     int flags;
 
-    SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, done,
+    FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done,
     {
         flags = shadow_l1e_get_flags(*sl1e);
         if ( (flags & _PAGE_PRESENT)
@@ -3648,7 +3648,7 @@ int cf_check sh_remove_l1_shadow(struct
     int done = 0;
     int flags;
 
-    SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, done, d,
+    FOREACH_PRESENT_L2E(sl2mfn, sl2e, NULL, done, d,
     {
         flags = shadow_l2e_get_flags(*sl2e);
         if ( (flags & _PAGE_PRESENT)
@@ -3671,7 +3671,7 @@ int cf_check sh_remove_l2_shadow(struct
     int done = 0;
     int flags;
 
-    SHADOW_FOREACH_L3E(sl3mfn, sl3e, 0, done,
+    FOREACH_PRESENT_L3E(sl3mfn, sl3e, NULL, done,
     {
         flags = shadow_l3e_get_flags(*sl3e);
         if ( (flags & _PAGE_PRESENT)
@@ -3693,7 +3693,7 @@ int cf_check sh_remove_l3_shadow(struct
     int done = 0;
     int flags;
 
-    SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, done, d,
+    FOREACH_PRESENT_L4E(sl4mfn, sl4e, NULL, done, d,
     {
         flags = shadow_l4e_get_flags(*sl4e);
         if ( (flags & _PAGE_PRESENT)
@@ -3924,7 +3924,7 @@ int cf_check sh_audit_l1_table(struct do
 #endif
 
     gl1e = gp = map_domain_page(gl1mfn);
-    SHADOW_FOREACH_L1E(sl1mfn, sl1e, &gl1e, done, {
+    FOREACH_PRESENT_L1E(sl1mfn, sl1e, &gl1e, done, {
 
         if ( sh_l1e_is_magic(*sl1e) )
         {
@@ -3978,7 +3978,7 @@ int cf_check sh_audit_fl1_table(struct d
 
     /* fl1 has no useful backpointer: all we can check are flags */
     e = guest_l1e_from_gfn(_gfn(0), 0); gl1e = &e; /* Needed for macro */
-    SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, done, {
+    FOREACH_PRESENT_L1E(sl1mfn, sl1e, NULL, done, {
         f = shadow_l1e_get_flags(*sl1e);
         f &= ~(_PAGE_AVAIL0|_PAGE_AVAIL1|_PAGE_AVAIL2);
         if ( !(f == 0
@@ -4015,7 +4015,7 @@ int cf_check sh_audit_l2_table(struct do
 #endif
 
     gl2e = gp = map_domain_page(gl2mfn);
-    SHADOW_FOREACH_L2E(sl2mfn, sl2e, &gl2e, done, d, {
+    FOREACH_PRESENT_L2E(sl2mfn, sl2e, &gl2e, done, d, {
 
         s = sh_audit_flags(d, 2, guest_l2e_get_flags(*gl2e),
                            shadow_l2e_get_flags(*sl2e));
@@ -4066,7 +4066,7 @@ int cf_check sh_audit_l3_table(struct do
 #endif
 
     gl3e = gp = map_domain_page(gl3mfn);
-    SHADOW_FOREACH_L3E(sl3mfn, sl3e, &gl3e, done, {
+    FOREACH_PRESENT_L3E(sl3mfn, sl3e, &gl3e, done, {
 
         s = sh_audit_flags(d, 3, guest_l3e_get_flags(*gl3e),
                            shadow_l3e_get_flags(*sl3e));
@@ -4115,7 +4115,7 @@ int cf_check sh_audit_l4_table(struct do
 #endif
 
     gl4e = gp = map_domain_page(gl4mfn);
-    SHADOW_FOREACH_L4E(sl4mfn, sl4e, &gl4e, done, d,
+    FOREACH_PRESENT_L4E(sl4mfn, sl4e, &gl4e, done, d,
     {
         s = sh_audit_flags(d, 4, guest_l4e_get_flags(*gl4e),
                            shadow_l4e_get_flags(*sl4e));


