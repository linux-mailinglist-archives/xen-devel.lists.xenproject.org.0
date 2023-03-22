Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D66C4674
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513216.793915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuoF-0006mp-Hg; Wed, 22 Mar 2023 09:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513216.793915; Wed, 22 Mar 2023 09:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peuoF-0006kN-Dy; Wed, 22 Mar 2023 09:31:07 +0000
Received: by outflank-mailman (input) for mailman id 513216;
 Wed, 22 Mar 2023 09:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peuoD-0004un-Rf
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:31:06 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe12::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4485e1aa-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:31:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:31:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:31:03 +0000
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
X-Inumbo-ID: 4485e1aa-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1IiNBsBdlo4foZeR8pnDoNaioAiU7VLDHMbczRpuRZOFpcMi8U+mZirtjMUhJH1Xvm3W0uiETffAAVdao+LNf/K3ysRmsIWz/6FCXw0BY4LnY4WzaiFMNSxhv3QepTMKBuvu8ltu/iDgSgMqnhKzcNRnGgJ9ODuKEGQeWlOSl4pOwb9jsqYThjL84svzMvFNAq3vgo69PVT/N3eF2IG79xZdwkdmHS+OFszlmCsynpfEkPwYcbUZOkHmUlXtItEqmR9AvFNgSVGIX17bU4zSo963BNkbsKk0dL3EOFAtXT16gSHEbmNmthb95BsB+j9fcwekkB2BV6AW/hynkd3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESu5hhSEBf0LX1s1TTJhGHS0ZDtmxQNcokmLQmAE+sw=;
 b=jAlbLKTSRfw/Ud7NF129cwEPLUHDB6xvuY+b/82YQlw0wTcHDdPiv0wpMr1spNyoOoOp0SYw44Y3ye47DmlQOJm2teor+2zpgpVp42y2TtIrly4HhDTBLhQYnofYll7cWfQmPXKCqaxPuZ546x3Vb4WAY0/YKUyPu4NoCObewhz6GmjAOsVAKpmmAMa/9uTmhJ7mfqWBQKsI41hrs5yt2D1dC3cASy7bDzhWVVD7e5Sg1tibSAUDBOyvdMF50g/LO/Uo3X5ce4WDflTxxngXs2xesDYvy8mAN2txU7490fR/iiKjrZs245yvqNrZhTVpx/+H49wbZ4NVFMWSulKocA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESu5hhSEBf0LX1s1TTJhGHS0ZDtmxQNcokmLQmAE+sw=;
 b=fr2fjT10c511QWTcBEPUFzbJyHdGXmU3gF4b4b2J8ReDMxDq40GnjfAp5UgUSpzgfvy5nIXsgVWndXf+PzPz7XmwGHWyq4NHNJhUcZjUgfbVz8YGBhVkRkFRWFeN+S//7z4s5R0dmZf7QUkGoGgOKc7ZHFtP2knfw6wNOxGiHGHePCl28PiDY9IFLaDSvlvwkN14aHt6ySiyqgDvME8ris7q6Zf3/lawJ4/j3YcmAjTixVoZhabQOCJQLTRZCuBx4rB9eWq84LDgtLGUDaNdyzhSKryoLYRpqtBu26fwLwlc+ckDNsxOyfHjtm3NYPebVrqJmsyCgkdSBItVIFDp5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <54e7a146-6f86-95a7-7b3b-0ba5dd418949@suse.com>
Date: Wed, 22 Mar 2023 10:31:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 03/16] x86/shadow: drop redundant present bit checks from
 SHADOW_FOREACH_L<N>E() "bodys"
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
X-ClientProxiedBy: FR3P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: d9252a38-16dc-47db-8b25-08db2ab827c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vTiJfmHyT3x73tmtKB1UaVEqLGhyeucjpuhVn6GascHsgFTskymfK0imIGHlKC8NEQbcjqnCEAdQYeut01W/VIQzEpi19Jldroo3BbqZ4KaftuWr2Kl6CW/tFyp34dauOMV1zFWb9mvRw/rS0x+lQFBU4HUq6K9pp+k6CmU3oKT43C3afAg6Ciq+sMITj/vfx+8AIBtS1HuaJmXmEy0CDYcU42vmSPW/iJ0HdhpHzqmYJeCF2xluaUeTe24etLwHtjG2t/oNlxJQP00urmdktsvW0in8MOtTXa7Neeb6M2igjbGXYVqjQJRskAy8rkAJyXoXCvEli9aICmrJM2F77oCcTdOPsEZnLD1i2a1WwiRG/vGsHvq5frB7anhvg8zQ1eiqjt2hZN+wx3pCGk8WC4ORN8if77Or/Mpdc0H/zlMR8jiUP3Tn6xbpaD8Skd3jW9LHv+FEl0YZXSQhtjSydDVcxymVzVYCt+WB3BHX71BaPaS7G+ODGhQzj9MI3sX1M++EAqEF2Syav7KVHO93SLsNKRfEJMVdoGu0scc4XOw/JjeQA9XN+Bida6ET5SzxJn8p9FIcIz9+k9NWYpY1ajweYxeuerzA9QVki975R7aTJ1MeuPZKmbgQE/KyizqUtRXBujLiXba19i5yznBerCNT84QuzQY8hNG5qXN9cFK3lSU395GMWtVmujjFKMd+scgQv1pg9PEMZTldpHqO6RJqad/C2XSmw2zQ9ZqJH40kJTOy63B4u6ZPsfc2hVYWEd0BtTR/Etvz23a0UDE6T7CYCYWkFaKA3mq88CJS2BwuFcfauNLIyyKTdu/5nRVJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(66476007)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66946007)(6916009)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(478600001)(186003)(83380400001)(31686004)(45980500001)(43740500002)(414714003)(473944003)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2JOZlpBeDhudi8vQVJyK25VOWRGVlB3dmJCdGdUNENtV29XZVMybEkwY2xC?=
 =?utf-8?B?NVJiT2RuQ2RQczBxSnJqcVN5N21nS3pzNEVvV3ZIZHd2QXBWMVMwWHRjalBa?=
 =?utf-8?B?eHd6NXg4RkY0UmFINnVPd244SFJCTzBVZFV2dVR2TlJUWkNSWWxSdEVqTHVP?=
 =?utf-8?B?aXZMYStEbDM2K1g0cHRKY2FXaFlSakphaXppN2VodzFZYzZvNXBTQmsvcmJR?=
 =?utf-8?B?Vkpya1p6V1MyYXdPUnpOc0xEUi9ueUlkY0ZoTi8rbXhsRUpMSmxLRlRvNDNF?=
 =?utf-8?B?S2R6aDNSbDZRam5XdDM1d0dqOTJBZkpzSjhBOXQzeFZVak5NNENCK3FxQ2tn?=
 =?utf-8?B?bEVWWmlZMWx1b2wrMG51MGxOdTk1TjI5SkxkT2xBTVplMDNQek1CQU1yY3Nr?=
 =?utf-8?B?UlBTQVQrckloa1U3TXhxbXBOTEhKWFUxL0pDSHdNU3BhNE40U2VUOHc0L2dZ?=
 =?utf-8?B?bEY5UXJQZFZicFpibWprZG53U1k1UVEvKzVldFVBQys1QjNxVGoyNnkrNFZT?=
 =?utf-8?B?UDJXK015aEtaRVF1VDR6RmxLTGdDWlZTU0ZiWmxNbUtVMEEwc0NjcElDSXFq?=
 =?utf-8?B?aEI0NjVwcWZ0eVczeGlvZlVmSE5YMVd6djVMZXpva25NSTlTcHRjdm9QbTR0?=
 =?utf-8?B?WS96WVZaZlZ0b2JYVEl0YVVwWjlzcGJrNjExbnVQd2ZMUlVON0dGa3IzNDNQ?=
 =?utf-8?B?V0xua0lRUE1vVTlQMWYrM1RJK3ZqeXIxVTM0TFZOczF4QURUS0Q3eDhrY0pa?=
 =?utf-8?B?TXBlaEhRaWVVRXBPamMvR2x2NXVaNXFiaTJyQy9lb0RHSGJoS0E2QlIrTERq?=
 =?utf-8?B?aktOc3FoamUxWlF4STZoc0JFUmVNUXo4WStUUmV2Y3RPM3Jad3BDRGI5NWw0?=
 =?utf-8?B?SVdwNFJ2UDNLWnZNZCt5SC9lSStkVzJIUnBYVmtaZ3o5QkpIVFc2c1c3cTRM?=
 =?utf-8?B?b0J5emd1SEFqNkxYeU5SdU1JSU5aWXRGTnFCN0htMG1hMDlxZTYwbmV0K3V0?=
 =?utf-8?B?MHVzblh4Y1FOak5vamRuaUpna3Bjb1BtWmhaam5uRGJ3emdWTElvYUFDWlZM?=
 =?utf-8?B?ZEE4VHlEaUQ3T3hCbm10ck1pdVNZZlNNU1ovbDQ3L3JrUVE2SzJNY2k0STQ0?=
 =?utf-8?B?RzR4aDE5ZG1FNCtxYWhrZVl6T2ZZUHpneGczaVAwOUF6dVdBeDA3aUFiRUZw?=
 =?utf-8?B?ZXpvTk1kVmtZNlJpRVdBdFBwNnRXRll0K1lKKzVoZ2VrSXpOR2tzK3FSNlNh?=
 =?utf-8?B?dTBXeGdDaXdoRHNWaHo0ajh0ZFJzZFI2b0J3d3Z2aGRDVEhCSkFWUG9jQ3Iy?=
 =?utf-8?B?cUxZNlFUaXlhS0RqLzQrL0hTaDdFK09IaFBzTzVDTlQydmRJc1RFK3ZiK3Qz?=
 =?utf-8?B?NlNkSUEyR3FBd0NPZ3Rxa2dpOW05RGJxbERqK29NMTZEendtallYZEVaeTBy?=
 =?utf-8?B?YVl5ZmtwMlpjaUM5U1FIUGRKSHQyYWJkNkt3WUhQd2ZOdkF6N0FPQVd6MHR4?=
 =?utf-8?B?SWFqZDZhWXZnRzllekpIVG9WQXI0RkdWNUg1eC9jd1pCYUN4M1o3RGIvV2d2?=
 =?utf-8?B?ZXNPQ3Y4Tm1oTlJQZjg3cEFiZnpXZi95S0phbkZMTHZXbEhxbFN6dnAzTWox?=
 =?utf-8?B?UE9JdkJ4WVhZT0ljMWwwN1AwbHJXbkdydmpwZVY0K0NKN0VJa1Q0U095UlV2?=
 =?utf-8?B?bi81YTd3RzlQMFYzWGc2dWh3a1NBMUt4b3RxT2FJT1pWdFd6UUc2a3lXTCtP?=
 =?utf-8?B?RnV2WDQvQXdWdFd2WE1aQWZZamJZY2ZuYUVqSEprMXlKajNXekVMUjFPZ1px?=
 =?utf-8?B?OE1tU3VDb3NnZ0xoNmliZFVKbklBTkpaaUt3RWJLK0k4TWcyd2V4U1BGSnFN?=
 =?utf-8?B?elBKQ2tJcHJKd3BIeHZOWVVicks0S2lnQ1dHRXR3WjB5SDJGMlN5TGZ4VFE2?=
 =?utf-8?B?akZJVVpwbWRRaFc4YVZKZnNYVENqbzFMZVlGYit4WjdQSzZtR2NtSm1qeENF?=
 =?utf-8?B?bmpTdDJuL0oxNjVYTW5aeEZJVEtFdUpsZng4cFJ6ZS9nQ0pBenRJSVVoeFJa?=
 =?utf-8?B?UlJIWjBTeVFtT0x1MTZCSFR1QWRtbEhhNHphcEo2TC9DeldtcTdXVlJkK01V?=
 =?utf-8?Q?1FUmj0r6vvAsQ+6hbt+EhuDU7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9252a38-16dc-47db-8b25-08db2ab827c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:31:03.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMJZgR2biyeaVO1x11gb56lfoCxvgSqxNq/we+VigUSdZoovPjlh3AEgQyxIUwdSvn/h1tcU7zD4kNvVGDCmMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

SHADOW_FOREACH_L<N>E() already invokes the "body" only when the present
bit is set; no need to re-do the check.

While there also
- stop open-coding mfn_to_maddr() in code being touched (re-indented)
  anyway,
- stop open-coding mfn_eq() in code being touched or adjacent code,
- drop local variables when they're no longer used at least twice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1289,12 +1289,8 @@ void sh_destroy_l4_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl4mfn = smfn;
     SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
-        if ( shadow_l4e_get_flags(*sl4e) & _PAGE_PRESENT )
-        {
-            sh_put_ref(d, shadow_l4e_get_mfn(*sl4e),
-                       (((paddr_t)mfn_x(sl4mfn)) << PAGE_SHIFT)
-                       | ((unsigned long)sl4e & ~PAGE_MASK));
-        }
+        sh_put_ref(d, shadow_l4e_get_mfn(*sl4e),
+                   mfn_to_maddr(sl4mfn) | ((unsigned long)sl4e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1320,10 +1316,8 @@ void sh_destroy_l3_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl3mfn = smfn;
     SHADOW_FOREACH_L3E(sl3mfn, sl3e, 0, 0, {
-        if ( shadow_l3e_get_flags(*sl3e) & _PAGE_PRESENT )
-            sh_put_ref(d, shadow_l3e_get_mfn(*sl3e),
-                        (((paddr_t)mfn_x(sl3mfn)) << PAGE_SHIFT)
-                        | ((unsigned long)sl3e & ~PAGE_MASK));
+        sh_put_ref(d, shadow_l3e_get_mfn(*sl3e),
+                   mfn_to_maddr(sl3mfn) | ((unsigned long)sl3e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1352,10 +1346,8 @@ void sh_destroy_l2_shadow(struct domain
     /* Decrement refcounts of all the old entries */
     sl2mfn = smfn;
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
-        if ( shadow_l2e_get_flags(*sl2e) & _PAGE_PRESENT )
-            sh_put_ref(d, shadow_l2e_get_mfn(*sl2e),
-                        (((paddr_t)mfn_x(sl2mfn)) << PAGE_SHIFT)
-                        | ((unsigned long)sl2e & ~PAGE_MASK));
+        sh_put_ref(d, shadow_l2e_get_mfn(*sl2e),
+                   mfn_to_maddr(sl2mfn) | ((unsigned long)sl2e & ~PAGE_MASK));
     });
 
     /* Put the memory back in the pool */
@@ -1390,11 +1382,10 @@ void sh_destroy_l1_shadow(struct domain
         /* Decrement refcounts of all the old entries */
         mfn_t sl1mfn = smfn;
         SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, 0, {
-            unsigned int sl1f = shadow_l1e_get_flags(*sl1e);
-
-            if ( (sl1f & _PAGE_PRESENT) && !sh_l1e_is_magic(*sl1e) )
+            if ( !sh_l1e_is_magic(*sl1e) )
             {
-                shadow_vram_put_mfn(shadow_l1e_get_mfn(*sl1e), sl1f,
+                shadow_vram_put_mfn(shadow_l1e_get_mfn(*sl1e),
+                                    shadow_l1e_get_flags(*sl1e),
                                     sl1mfn, sl1e, d);
                 shadow_put_page_from_l1e(*sl1e, d);
             }
@@ -3559,7 +3550,6 @@ int cf_check sh_rm_write_access_from_l1(
 {
     shadow_l1e_t *sl1e;
     int done = 0;
-    int flags;
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     struct vcpu *curr = current;
     mfn_t base_sl1mfn = sl1mfn; /* Because sl1mfn changes in the foreach */
@@ -3567,10 +3557,8 @@ int cf_check sh_rm_write_access_from_l1(
 
     SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, done,
     {
-        flags = shadow_l1e_get_flags(*sl1e);
-        if ( (flags & _PAGE_PRESENT)
-             && (flags & _PAGE_RW)
-             && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(readonly_mfn)) )
+        if ( (shadow_l1e_get_flags(*sl1e) & _PAGE_RW) &&
+             mfn_eq(shadow_l1e_get_mfn(*sl1e), readonly_mfn) )
         {
             shadow_l1e_t ro_sl1e = shadow_l1e_remove_flags(*sl1e, _PAGE_RW);
 
@@ -3596,13 +3584,10 @@ int cf_check sh_rm_mappings_from_l1(
 {
     shadow_l1e_t *sl1e;
     int done = 0;
-    int flags;
 
     SHADOW_FOREACH_L1E(sl1mfn, sl1e, 0, done,
     {
-        flags = shadow_l1e_get_flags(*sl1e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l1e_get_mfn(*sl1e)) == mfn_x(target_mfn)) )
+        if ( mfn_eq(shadow_l1e_get_mfn(*sl1e), target_mfn) )
         {
             shadow_set_l1e(d, sl1e, shadow_l1e_empty(), p2m_invalid, sl1mfn);
             if ( sh_check_page_has_no_refs(mfn_to_page(target_mfn)) )
@@ -3647,13 +3632,10 @@ int cf_check sh_remove_l1_shadow(struct
 {
     shadow_l2e_t *sl2e;
     int done = 0;
-    int flags;
 
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, done, d,
     {
-        flags = shadow_l2e_get_flags(*sl2e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn)) )
+        if ( mfn_x(shadow_l2e_get_mfn(*sl2e)) == mfn_x(sl1mfn) )
         {
             shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
             if ( mfn_to_page(sl1mfn)->u.sh.type == 0 )
@@ -3670,13 +3652,10 @@ int cf_check sh_remove_l2_shadow(struct
 {
     shadow_l3e_t *sl3e;
     int done = 0;
-    int flags;
 
     SHADOW_FOREACH_L3E(sl3mfn, sl3e, 0, done,
     {
-        flags = shadow_l3e_get_flags(*sl3e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l3e_get_mfn(*sl3e)) == mfn_x(sl2mfn)) )
+        if ( mfn_x(shadow_l3e_get_mfn(*sl3e)) == mfn_x(sl2mfn) )
         {
             shadow_set_l3e(d, sl3e, shadow_l3e_empty(), sl3mfn);
             if ( mfn_to_page(sl2mfn)->u.sh.type == 0 )
@@ -3692,13 +3671,10 @@ int cf_check sh_remove_l3_shadow(struct
 {
     shadow_l4e_t *sl4e;
     int done = 0;
-    int flags;
 
     SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, done, d,
     {
-        flags = shadow_l4e_get_flags(*sl4e);
-        if ( (flags & _PAGE_PRESENT)
-             && (mfn_x(shadow_l4e_get_mfn(*sl4e)) == mfn_x(sl3mfn)) )
+        if ( mfn_x(shadow_l4e_get_mfn(*sl4e)) == mfn_x(sl3mfn) )
         {
             shadow_set_l4e(d, sl4e, shadow_l4e_empty(), sl4mfn);
             if ( mfn_to_page(sl3mfn)->u.sh.type == 0 )


