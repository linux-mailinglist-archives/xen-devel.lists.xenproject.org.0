Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DC76C4673
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513214.793905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peunv-0006KQ-98; Wed, 22 Mar 2023 09:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513214.793905; Wed, 22 Mar 2023 09:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peunv-0006Hq-5W; Wed, 22 Mar 2023 09:30:47 +0000
Received: by outflank-mailman (input) for mailman id 513214;
 Wed, 22 Mar 2023 09:30:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peunu-0004un-5l
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:30:46 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe12::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38ce9073-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:30:45 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7042.eurprd04.prod.outlook.com (2603:10a6:208:1a2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:30:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:30:44 +0000
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
X-Inumbo-ID: 38ce9073-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMEVpWZ5a17Me0naj91/hRGfJRC1CH74xRtZF4R8cwF4olCmeiOwKEL8Pa+BxRO7MpV/EZG4XuGkF7bU4FSw5shaNPSx9oZKinV29cdtIzpvPZmgijNVexBflTn00ndqcUo6UwxYW2OmsWwl5eEjRtG3xTztWBbsc1dHW5qN44hZ+y6Pg/dNLroAB/OvmhK2upGzKpdaJ/sMN6VO2nHfBalcL97VEYfZ0Uep6dxvYGYJ5Mr9BrxW+FAsKgNfrFsNXwGejnhPWtXgv63QoL6p4X4lRTZkTJNdHK2d5EJSFyu0E8VSWGul29XehgYd5i8PeK5XBt1e7fJwI+92/l2KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+ld8GTQwB22a2rHLDTz7JUGbxwAP+yxpl3HqWacg5w=;
 b=mT7beBVdH237/nDwF/zBggZ+YYF/bmMJnFn/+0Ba/aIX5vGA5LKVlw7iShk1pjmMUUMTI0pm77v8fmS9zMck00zK1hkYNBuUnZDQlG+wkqZDpEVau81Ejp3JqHocbpdcG2O0P2Zp56WbUlopfcpw8+I4pKnTLR83MoUhSpLNwDRBKfYLHj33mst9MDmT7OBdGV8Eip/RZrupZcFJPDQaQW8c5H3ylI3Z+7MCm8qbP2MdwiHsKEvpWOJAaUWqBOEgoNm0ZFPUd4qzvs0pLnrBDLqRQRTgghbgnT/H9C4UrdKVANNhdv4tSQLeVVekm4s125kXwatl+e2giS4POBa+xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+ld8GTQwB22a2rHLDTz7JUGbxwAP+yxpl3HqWacg5w=;
 b=Vt2ZCHheNfJH1HRNFBtYbBEkI7baZD8j7Odleh+MbXjGEgmgTvyllrKRgOnBEPlpCtNperQTa6Sd/eG19Ou0aPTSWQ7Zuy92eRN8LLA1I9JMKFJLzF1cVcl5BShRyscVZnF8P2CpG8DGfyjLQblYSkQTnuQJray6PzeZNGFFKbrgYHOLuS9L6b4T1UanX0BJpPXWOmIEyeN+rCSxa/foMYis8PO8G/WUH6COTFXMUEenIXRNdsApL1zPM+dfSOteMzXPvpdiinKbZDafVb39cBykoOw4E+oHx8WGF4iR3WwCQ22sF6+XOloHG6lle85+2GPvkSgLqQxFQmo1boDFtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b632fcd2-6b02-9bbb-0041-922f18c837f6@suse.com>
Date: Wed, 22 Mar 2023 10:30:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 02/16] x86/shadow: fold/rename sh_unhook_*_mappings()
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
X-ClientProxiedBy: FR3P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 0323c33b-e074-4abb-0ae0-08db2ab81c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HHDUtE1y8auT2HFOn/GkPZlK8Hn9/K2Fc4U1HvYkSTEQKYjMovn4NgToyewZHSqIE7Owio/BTWKd7R1wfOTRy0WDCAz6tDAhZH2SyAerld2AbN9f8OhHHWk/uN/Rs+FQcZmbOEY5d9ZzL0FzFLCi4cG33YZsYv0DGbSzOwBJ4NeV2VeJoSPRErcaMHs8wzpC/JBhcYwCS11nGHipH+ckOEmZHbhzABwSb8D/BWjY2GONzalyIg9jb9nso8s48oRkh3XyNTJJcNq3qC1T8Ff/h1UyNqol2sXpT7Qk13tBwShrKYL9+RMQZxe8OQLgEpkOuoo+fwjlOfu/ZqKMORhrdBmiLa08gIe8nYmChqopSY6oNcs/UWsGzA4cf0S/njqvM5RRm+glLMx9M/50EY0+cNOjGodpcidtj4jMr/4r2MP0ly1EgTA/eHUftU1sSNooyDoNHsKHIXlW1BKBpMAoJVYOnLoIgnKK0Hk5FdnI6EPF7/uWjJDqDXKbjhmJ+x8AJ5N7HXX5yfNpeLT5imLr1u34DB6XdyxJU1fwfM9BkyHI4hScrkK40XQVhyvfbWnd6JDUsyyCPk/Hos+Q2TPFbRfHm+agOIgtn6kEi0abNgQZ6Vok9/+zh75ccO1z8bzN5hVTnbStYWIhze/VCgJv608c0GqxeVdJt9D+NquwARsgulel/unKcDpNr++AUUo7cutHZLvLuRp5tU8R7zY9qrf4uhFEYMHyJsPuu2opnqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199018)(2616005)(6512007)(54906003)(86362001)(38100700002)(31696002)(66476007)(8676002)(36756003)(2906002)(8936002)(4326008)(66556008)(66946007)(6916009)(41300700001)(5660300002)(6486002)(6506007)(26005)(316002)(478600001)(186003)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVBUTlZ4cDV2Nmk5cXBOcjl1TGdYQVV5OGk0STBEcWxOTkgzaHBGckpJbDVG?=
 =?utf-8?B?dVFXRW5GK1pNNmRIYTZYd0J6RmRxM1BYTlJZT3dMNlRMUjFoMk1id3liTHJv?=
 =?utf-8?B?OVpjNTF2L0xwQjRqUWYzbVdZZ1pmdFRUOFdwb3JuOUwzZVoxUzRtcWl3cUdO?=
 =?utf-8?B?RHR1MGZtQThxeW11NjRCZkp5dmxOb3psYjhmRVRtUjEreXE4aFdUMjZHdW9Y?=
 =?utf-8?B?NG1XTG91ZkRFUkp4TGlBY1VCYjBjbkJtdXhBQlo4bE9PeFUwZmZEUSs0NWlJ?=
 =?utf-8?B?TXR2TWRJSlppcmRIb2xYMjRVLzB1RERUMWFCckJEU3hlL0ROTDJVWnVENFZU?=
 =?utf-8?B?MzJHMU4wTDFvUk1DTUZHNE56Z1Zrelluelp4blVBbVYzZ25oYkh6NXJkenhD?=
 =?utf-8?B?L3RyNTRwRCtONDQwOXpzaWoyc0JjY0dHd1ZEZHc4WVhuZ1VZQ0xpQmY1Ti94?=
 =?utf-8?B?bForM3lTSmI4UW1YY29xVWFTMktFWGhSUWJOMTJ0VnBSaEs5RVM0TDdUZ2hO?=
 =?utf-8?B?b0ZKbFUyaFZNVmZ6ZUc4N2tOVkVZdTUrOGl2U3RvK2FaZFlSVUZIaWliTmN1?=
 =?utf-8?B?Yk9EdUd6NW9UVktnVTRmRzdNQTlQZjhUd0FvaGpseXoxU1lRM1Axa3JLeTBY?=
 =?utf-8?B?WTVOWU5SekRoR1VxRkZGSzk0UERSWDJFNnBWMkxBQm5ZVkNlWXFJRVRvNVRu?=
 =?utf-8?B?U0VoS3VwR05KcWZDTHVQVTdza0RWWEV5THJNeS9DN2xEVk9zeHd4QmxVVXFC?=
 =?utf-8?B?OFc1SCtuVzczUGdnM21HVkJhUGZqMEh2RDk4YmZYRTNxNWczMkdaU0s0UVVE?=
 =?utf-8?B?cFp0RVpnNFZYVDgzaFdCRVVzMWJWUm81c0RocmVCeUpxNjgzNURNM3hPNmVo?=
 =?utf-8?B?WTF5TE5SNmtpNDcxU0x2SEhaYk5mb2ZmVWZ5ZWxxVHJYdzVVYm9oSDg1Ym5R?=
 =?utf-8?B?TFJOWDQzUDR4ekVsVVBOYnhJTkZHYUk5Q3RkRVpDczJoaTlmN2xqMGpjWG9V?=
 =?utf-8?B?clJ2aGczUVJLYmsrNCtTZ3RrMWIyaGx5bWMzNjhsTzIwM291VWlJUk9oak1X?=
 =?utf-8?B?MDZndFcrUVVSYU9ESU9VYVc1aHZQaXc3QnZ5NFBFVHBqZkZvUUpXMUdlMjhz?=
 =?utf-8?B?OW5QL09mRzlUaUpvUkZ4SXdZNTFmVWZzZDloVUYrbW5rVHQxVjF6enFpbUpr?=
 =?utf-8?B?RTJLc2tXTGg0RU1ZaFJ6ak1YREZGam1TNk5nNkFRT2dCUGEwQklyZ2Nhd0lv?=
 =?utf-8?B?WC9uclBUYkdueE9FMC9jNUxLd3JpN1g5OTJ3V3JnOUpMOGdNUkdXa3gyOUdt?=
 =?utf-8?B?QVZVK2xWZ2YxdEp0blhud0NGejl4TFIxM2ZKcGdud01scFkzQWV3dlZ6RUVT?=
 =?utf-8?B?NDlJU0U3YmpJN1drS2lXdlpXeDNIZ3hRdWsvRmVnQnVESnc2V21SaVdwNWNv?=
 =?utf-8?B?NWczVGFRQWdncGhyRFp6SzBCa2FmTE1yajVQMDI0aDRFRnoxRnliWk85Y2Ey?=
 =?utf-8?B?V1pXQWpvR2RUcHAxVitIbU9FR2lQV0M0TDM0NXNXcTFPYWkyVXg1NU5rVFJV?=
 =?utf-8?B?N0k1SDc5cHN3MDk3M2NxbGVqT0FaY3BZSmpnTWphUW5RbEZlRWFuTlBMT3VP?=
 =?utf-8?B?a3VJYU85SGpBbS9PSXEwdmdUQUp6WTNzdXJOTmt2U1lGZmVlRHlQL1pQOXh6?=
 =?utf-8?B?a2EydzF3dFZFejJIY0Fsa2cyZjNoYS9meEUwSjBWajNiNUhRWUQ5dldwMW9B?=
 =?utf-8?B?MWp1ZWRxa3lNc2xVWnd0cjFmY29vRzFDRjZtUTZCMFlXMnlkRGhaZ0pWb2J3?=
 =?utf-8?B?SEd5akhveUcrQXVqcFdCaG8rUmVRTEQzZlBkL1lxcTFCWVRKU1ltNm56ek5F?=
 =?utf-8?B?d2VSVDdxdUovYjNscTVqRkdIUzdyTVdsaFd4RExKRjJOU0FvWnlFSDd2Mzd0?=
 =?utf-8?B?STB6Z0dDSXBIYXo1RDZzWmVsYkNGcW94ZWlCYy83Nm5paHd5VytUQ3ZtQ1Mz?=
 =?utf-8?B?ZWFpQUFmekc4UDJ0SjRVNzBJTVdibFJJNUtPU0U3UjREamw0OWNvdG03bWhI?=
 =?utf-8?B?V2tOakRSQ0g1L0Z3aEd1bk9SNEtGRm5rWFFEVGloemZPVmNmM0QvQU9zblcv?=
 =?utf-8?Q?tBquUU09ZeAOuwjpUuw38blEf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0323c33b-e074-4abb-0ae0-08db2ab81c2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:30:43.9344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGrR5EmvPPG4u7Gl1a7+npt+VU0m/NjEmOIWYz1tVXSlO7WlX3cii5OSmY2n+rDM5WjGD0pivgao6BhWlBaNCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7042

The "32b" and "pae" functions are identical at the source level (they
differ in what they get compiled to, due to differences in
SHADOW_FOREACH_L2E()), leaving aside a comment the PAE variant has and
the non-PAE one doesn't. Replace these infixes by the more usual l<N>
ones (and then also for the "64b" one for consistency; that'll also
allow for re-use once we support 5-level paging, if need be). The two
different instances are still distinguishable by their "level" suffix.

While fiddling with the names, convert the last parameter to boolean
as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
As long as the backing functions don't need to invoke each other, the
infixes could arguably also be dropped altogether. Every mode has
exactly one such function. (Thinking of it, unhooking at L4 is kind of
pointless for PV32, as the guest controlled root is L3. The only time
where we might want to unhook from L4 is when we clean up after the
guest. But even that's not strictly necessary as that would also be
taken care of by sh_detach_old_tables().)

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -898,14 +898,14 @@ void shadow_unhook_mappings(struct domai
     {
 #ifdef CONFIG_HVM
     case SH_type_l2_32_shadow:
-        SHADOW_INTERNAL_NAME(sh_unhook_32b_mappings, 2)(d, smfn, user_only);
+        SHADOW_INTERNAL_NAME(sh_unhook_l2_mappings, 2)(d, smfn, user_only);
         break;
     case SH_type_l2_pae_shadow:
-        SHADOW_INTERNAL_NAME(sh_unhook_pae_mappings, 3)(d, smfn, user_only);
+        SHADOW_INTERNAL_NAME(sh_unhook_l2_mappings, 3)(d, smfn, user_only);
         break;
 #endif
     case SH_type_l4_64_shadow:
-        SHADOW_INTERNAL_NAME(sh_unhook_64b_mappings, 4)(d, smfn, user_only);
+        SHADOW_INTERNAL_NAME(sh_unhook_l4_mappings, 4)(d, smfn, user_only);
         break;
     default:
         printk(XENLOG_ERR "Bad top-level shadow type %08x\n", sp->u.sh.type);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1416,21 +1416,9 @@ void sh_destroy_l1_shadow(struct domain
  * This implementation is pretty crude and slow, but we hope that it won't
  * be called very often. */
 
-#if GUEST_PAGING_LEVELS == 2
+#if GUEST_PAGING_LEVELS < 4
 
-void sh_unhook_32b_mappings(struct domain *d, mfn_t sl2mfn, int user_only)
-{
-    shadow_l2e_t *sl2e;
-    SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
-        if ( !user_only || (sl2e->l2 & _PAGE_USER) )
-            shadow_set_l2e(d, sl2e, shadow_l2e_empty(), sl2mfn);
-    });
-}
-
-#elif GUEST_PAGING_LEVELS == 3
-
-void sh_unhook_pae_mappings(struct domain *d, mfn_t sl2mfn, int user_only)
-/* Walk a PAE l2 shadow, unhooking entries from all the subshadows */
+void sh_unhook_l2_mappings(struct domain *d, mfn_t sl2mfn, bool user_only)
 {
     shadow_l2e_t *sl2e;
     SHADOW_FOREACH_L2E(sl2mfn, sl2e, 0, 0, d, {
@@ -1441,7 +1429,7 @@ void sh_unhook_pae_mappings(struct domai
 
 #elif GUEST_PAGING_LEVELS == 4
 
-void sh_unhook_64b_mappings(struct domain *d, mfn_t sl4mfn, int user_only)
+void sh_unhook_l4_mappings(struct domain *d, mfn_t sl4mfn, bool user_only)
 {
     shadow_l4e_t *sl4e;
     SHADOW_FOREACH_L4E(sl4mfn, sl4e, 0, 0, d, {
--- a/xen/arch/x86/mm/shadow/multi.h
+++ b/xen/arch/x86/mm/shadow/multi.h
@@ -50,14 +50,11 @@ SHADOW_INTERNAL_NAME(sh_destroy_l4_shado
     struct domain *d, mfn_t smfn);
 
 extern void
-SHADOW_INTERNAL_NAME(sh_unhook_32b_mappings, GUEST_LEVELS)
-    (struct domain *d, mfn_t sl2mfn, int user_only);
+SHADOW_INTERNAL_NAME(sh_unhook_l2_mappings, GUEST_LEVELS)
+    (struct domain *d, mfn_t sl2mfn, bool user_only);
 extern void
-SHADOW_INTERNAL_NAME(sh_unhook_pae_mappings, GUEST_LEVELS)
-    (struct domain *d, mfn_t sl3mfn, int user_only);
-extern void
-SHADOW_INTERNAL_NAME(sh_unhook_64b_mappings, GUEST_LEVELS)
-    (struct domain *d, mfn_t sl4mfn, int user_only);
+SHADOW_INTERNAL_NAME(sh_unhook_l4_mappings, GUEST_LEVELS)
+    (struct domain *d, mfn_t sl4mfn, bool user_only);
 
 int cf_check
 SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, GUEST_LEVELS)
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -232,9 +232,8 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define sh_destroy_l3_shadow       INTERNAL_NAME(sh_destroy_l3_shadow)
 #define sh_destroy_l2_shadow       INTERNAL_NAME(sh_destroy_l2_shadow)
 #define sh_destroy_l1_shadow       INTERNAL_NAME(sh_destroy_l1_shadow)
-#define sh_unhook_32b_mappings     INTERNAL_NAME(sh_unhook_32b_mappings)
-#define sh_unhook_pae_mappings     INTERNAL_NAME(sh_unhook_pae_mappings)
-#define sh_unhook_64b_mappings     INTERNAL_NAME(sh_unhook_64b_mappings)
+#define sh_unhook_l2_mappings      INTERNAL_NAME(sh_unhook_l2_mappings)
+#define sh_unhook_l4_mappings      INTERNAL_NAME(sh_unhook_l4_mappings)
 #define sh_paging_mode             INTERNAL_NAME(sh_paging_mode)
 #define sh_audit_l1_table          INTERNAL_NAME(sh_audit_l1_table)
 #define sh_audit_fl1_table         INTERNAL_NAME(sh_audit_fl1_table)


