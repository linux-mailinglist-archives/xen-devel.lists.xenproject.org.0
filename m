Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF268F0F3
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 15:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491847.761184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlaG-0006xr-Eh; Wed, 08 Feb 2023 14:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491847.761184; Wed, 08 Feb 2023 14:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPlaG-0006vs-B8; Wed, 08 Feb 2023 14:38:04 +0000
Received: by outflank-mailman (input) for mailman id 491847;
 Wed, 08 Feb 2023 14:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/8R=6E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pPlaF-0006Jc-9R
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 14:38:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 302e92b4-a7be-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 15:38:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9343.eurprd04.prod.outlook.com (2603:10a6:102:2a7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 8 Feb
 2023 14:37:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 14:37:59 +0000
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
X-Inumbo-ID: 302e92b4-a7be-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxytKhLHogxVaSy3rKMjoRZ0tuZ3VcYuYGU8TL1+BcV73hlkqzuvN4VwLWOJ6w33yl7sC9AyPe6+ybCXsK56rSfH6h124wk1mtb5UJlPfa4/tqaLKboobi/HS0qrlRkFnoZXGeKJFsgDdyS82i6ueQw0fyktE7CftDs8Ut/b3X6i7ef0sWha/IfoUnCNWAEcLvjffdgQNcOlJC3RXEcwL6hnDwfL0JmJxqfgf1uBBbNNW/xpQ3BUaJHl8C0g+Q1ooWo5AfEnVzNzVPDPhIUvhOodJI+gujk0gRSFqh9kJAfgzece7jAYLsrlz3CHRGSaGqpUNQmLYg8r2fio9ppmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4ux/6tWNQBcW4wZFr0MDeGUcIrrS8cZY8coYVotxL8=;
 b=lahJGM0c92A3RJ5cL722RF5FWN9y5saT+j7OK1LG706wD0KJXHjUHpiE009k1Q0fWrUmmAQ44quGjt9WAdnY1FlJeCHorzqIIBxeCf5PkmfTpXqeCOXK3gBAaZLY6nG94kbFr4JATJ15feL7NjpqYkrlKh7M6xjEPw+UbGK1pfiv9eNGCAg7bgOOiIxKU6LTnlb/m8KPihjPWoJxWHxEygFjF0Z4mMxLqnF52L9NYetb24T3eaCPM0BjV0V+5ifw0k5NLzEVmoL6+hDMnWGVH/q6u/2b4/9zCq5665xFs/sTLFcaJd+FZXv4uyXmRLMzwVvljClA/6OnyKVaySbmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4ux/6tWNQBcW4wZFr0MDeGUcIrrS8cZY8coYVotxL8=;
 b=po9kfWLv26qWv9anAv+kougLog3B3orii9DwzrVE0G9vlMwF0EVh2LHHBLxYw7rtucxq02Qe3bYRrYqczKUozlZfFzC7WD6uXUSJF4u9kyjJJ/gaBGYrrzo6egh6wNzJH/3LJwLo4dpvsL0DvSdRMly7f/zFqkIH3k5835cT7EbdhhiyxMcObf3f2RAL9EsuJ7DSax62uVAhp+p39TIqRE4rN9HAQUkg0gjYbpwQbWmpud5J74lt3UEuO+ndVqUV86r6+R80j7Bg7ILNColX10asArZlzNeoknUzkm7shoMrSvzgbn5ztiM95mNOaUM/4o9j1TL9tbB2FH2rFX0eAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7071737-896f-91f0-0fa8-c5cd30494c10@suse.com>
Date: Wed, 8 Feb 2023 15:37:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH v3 3/4] x86/shadow: rename hash_domain_foreach()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
In-Reply-To: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe2301b-5c59-42b9-cce7-08db09e21359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WpmEtlNKVRqR0IDDeaRC3+KhsB3O89G4fgdPGJ9ShZ1RToQY7jI1qIb0avMWi7B/bAK8mYc80WO7WvzM6aaXYS9RvuQmUAXqSBfoSkBOWvDFQHgCsXwhcvPozVDJCw01sT/QFbP43iWE3sSK8SW6e8521d6mN+zRITMatLVmfgT+bHZu94MEysRgOsW59dv6J+mJ7pzE4CrCXUIHTh6/kRPadUkPD1RfSGtY2yCPVMtfcwz+iLnsadLOtlX01Hx8kf05942nxr6HIZH87jTPRUAGWaMHxl7m3YqdHTCzb8tmWJBsySipHNvWhmvKdLNyVcDL6FTmcTw85cEFQ08KnHoKUq+g44YFv9Flk1cyCWbrg6NhOoEoDGwLY4b+gCaLCA0RnbV/oxJIW5z6YIJKvlVQpl+s31b+ZybMc/HxCmZyGe/tr5d5FWyR0ICtkOJqDzwcPqhL7zzcQXp0K5fk0LRU3i8lv3o/43gzkOw4AH85Qe06ed/fD+YRUqqSW+9ERlZ4vOpadoZiWkzAVAXZ0KPAsKGARkFm1+8s9X0F2/O5bQ0yl6oQOJxOYcuVeSuKRPv9Gfe1EpKBJAMLWfVffDvgegqIY4hwG5l6zsndBmAbcME95uFb6Y5iLqbWBCsENh4nFBfYPoC1Jg9dtHWPF3CCQnpckZcrqFUzkAwmB83zVdEfqNWWjDXynqqWxKulo8hi1Vx31KB9uyKwIVlQPAZTemU4bocbuvLR1jSEqAY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31686004)(83380400001)(6486002)(36756003)(5660300002)(2906002)(26005)(186003)(31696002)(478600001)(6506007)(6512007)(41300700001)(54906003)(86362001)(38100700002)(2616005)(316002)(66946007)(4326008)(6916009)(66556008)(8676002)(8936002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My93aksxZWpQT0htUmZCOHFuaVRHa2MwQnVTMkdPcXhZdUFpNldObXhDU29F?=
 =?utf-8?B?QkROTGtEYTJMZ0R6N2xDcnZHbExTRnlwNVZjVUZHeGFyaVVPbyswMUc0Wk5V?=
 =?utf-8?B?UDBkamZVSjJQMEgvajFoQnpsSjZxdmsrODdvRlJRWi94YUNZaFllbTB1bUMr?=
 =?utf-8?B?K2hkOGxvcEdoRXBlS2lkZlhTeCtNOTV3amdQQS9pMjlQVkJYekI2Z1hkc2hD?=
 =?utf-8?B?VGlBQVdoanUwVGdtSS9GeWlmdGJodlRtWXp3Ty9NZEh4L1QxNHo2SzNETUhW?=
 =?utf-8?B?b21iSkkzSncwMFdzdGJ2NUVZQ2p1Z3VuRDJrU2dITlNLUVdKZ1R0VFZVWGxp?=
 =?utf-8?B?RVhzbjZ2a1dzU0UxeTNIbFdiUVUxbHA3aktOeGdOSGhZZnl3REdMaWV5b3pC?=
 =?utf-8?B?dUZ1MEl0ZkVMK0tHQXViOE9URlhZcC9lQ3Bxdlh1aWR1T3R0WWN0RkNyMms0?=
 =?utf-8?B?TTQ2a2twZjlMbVhDQ3B5RU5rNGxGbjl2MFFtZUxuQWF3NFVTcTN0UHZzNE9W?=
 =?utf-8?B?bi92UDNqS1h3QmFRSzR1NW04ZjVXVkRWQUxXUEo2dEFuRWdKTTdEbWtRQlpu?=
 =?utf-8?B?aXRJZXlpT2hvdTUzU0U3K2srUVZSM2VZNU11MkFkRGl2cnlTVmx4R29IakJ4?=
 =?utf-8?B?Q3c3SjU0VmdBQVdxVFV3Q3hZUTlQd0JqMXRDeEVJTlJ2cUloREEzZUdGVEY4?=
 =?utf-8?B?M1B5ZVJpZDN2cW1yeGt3WVVpOFpBWndPUCtheFUxUVhhOEpYTVd4d2RtaFVV?=
 =?utf-8?B?RloyN1BXQXg2S3VzTDhoWVVkb3VOcUFGK1FndjlMM1pkSmFxdXFqem1OQ1Ny?=
 =?utf-8?B?L1dkZzJsVWdmYzZ0Z2lvR3FGRk85dG5WbFBtWjVTbndiNEZKcFd6T0JUSk1H?=
 =?utf-8?B?ZmUzWnZURGxOZ09PMW8zU3BERW9lR0I5UUN5a2RWOU9NLzMrMkp2WER5RHkz?=
 =?utf-8?B?SlBjVHI0UlRBcThIWUpDcHpRRVcrd0tHRmVHM3dMOE1FK1QxZm9GTUcra0VR?=
 =?utf-8?B?bjdzM0VINDNZYVhUK0xSRm5aamxJL0ZINWUvaXo2TGlOUEJ2SGFsMUNLc0Zw?=
 =?utf-8?B?dWVzNXMvcVdSOS8rQjh6NjZFOVdxZ2swRHJnMTl1NThCeXZjNlBzTEg2NWxD?=
 =?utf-8?B?U0RzSnBRUzBHOVRmQVBwRnpQQjVuc3R3WHpMS0VJdkpUZUpmTVg0eWRJeUFu?=
 =?utf-8?B?UTBYRXpueTVTTG51Ulg3cFBLVElSQ1NNWnNHWS9RUE90U1RwZytkMzI4Rk1r?=
 =?utf-8?B?QUsxOFoxaFVSQnNNSitwMmRVby9sZkwvVDJleWljYm9rQnVNRGdKdUhpenUy?=
 =?utf-8?B?ZkYzRnNzQVIyV2NMWDdrVmpUdm9zdUNNNDFSMkt1Sy9GNWM2dlRvQU0zaUNo?=
 =?utf-8?B?WDlrOEhpTW9xRFBsRng5cWRZSWpVWnhRV0M0NFZtNkZxMlM5VEJwcUFaRzVR?=
 =?utf-8?B?ZDZuWGJBY1ZqRHNTNjk0WnNvamJrQWtpYXZ1VVUyOGtWZStsTnc0ZE5DZTQ4?=
 =?utf-8?B?MFpoSVNkc3FSWkdzc28rWFR3TFg0YnJwVDlvaTBUSnZKUWIyZ2JXd2ovODhx?=
 =?utf-8?B?YUZzSytySWV2SUwwTEtMc29XQk9VNUc1a3BycmtZOU1YUmdnZlR1d0w3d0VY?=
 =?utf-8?B?OGFKQkhpQmxKMmhkWFpDN1p5ZytpMDFBd204aGxoQnhTaVVwV3p4ZGZ5YlRY?=
 =?utf-8?B?NmN2RXZUT044eS9SVHQzaVBVbWljMXNkbktnbHBqTW0wMGZXbWpsZ0ZaOEg0?=
 =?utf-8?B?NGVTTzhGTHp1NGpoZG04Z09NbEYrMHJsejZoUURQR1gvRUJLVm5iT0ZEbHB0?=
 =?utf-8?B?U3dNYmxEZjRzK2RZam5pSnNZOGFINGh6c1BRc04yUUIweFBXTHVnYk9TeW13?=
 =?utf-8?B?ZlZuTHNCMStRek9WTjhROHZueHE5M3RlS0o3b3VuYzhneXIxYVhkdk9ZdDBJ?=
 =?utf-8?B?NmRibWNzQ1VDRXdIWUdlaDVHeGVnOFhWTTlOMUNmOGNsa0ZDV1h6TWxRYkt6?=
 =?utf-8?B?U0ptVkYvRkFqZG1keS8reXdVSjZxQ2haQW5YTG00WWd0TDlYcTJzanRydUUx?=
 =?utf-8?B?NXMwTkpOQ0xNTldqdC9ZMGhkcXJRNTI3V29uNG9waElYd3MwZ3dQeHErMi9h?=
 =?utf-8?Q?Dj+UxdSBtFpMoayvRQGqtVQQX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe2301b-5c59-42b9-cce7-08db09e21359
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 14:37:59.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeEM17TOsMTIMM0ousfCsmt1LLExf16Kotwef5emK+xXBuhQ2D6X51rfWX6OxnJnNTFDHuPycXqjgNcMMpsPkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9343

The "domain" in there has become meaningless; drop it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1680,15 +1680,15 @@ bool shadow_hash_delete(struct domain *d
     return true;
 }
 
-typedef int (*hash_domain_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
+typedef int (*hash_callback_t)(struct domain *d, mfn_t smfn, mfn_t other_mfn);
 
 #define HASH_CALLBACKS_CHECK(mask) \
     BUILD_BUG_ON((mask) > (1U << ARRAY_SIZE(callbacks)) - 1)
 
-static void hash_domain_foreach(struct domain *d,
-                                unsigned int callback_mask,
-                                const hash_domain_callback_t callbacks[],
-                                mfn_t callback_mfn)
+static void hash_foreach(struct domain *d,
+                         unsigned int callback_mask,
+                         const hash_callback_t callbacks[],
+                         mfn_t callback_mfn)
 /* Walk the hash table looking at the types of the entries and
  * calling the appropriate callback function for each entry.
  * The mask determines which shadow types we call back for, and the array
@@ -1826,7 +1826,7 @@ int sh_remove_write_access(struct domain
                            unsigned long fault_addr)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_write_access_from_l1, 2),
@@ -2011,7 +2011,7 @@ int sh_remove_write_access(struct domain
     else
         perfc_incr(shadow_writeable_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, then there's some non-pagetable
      * mapping -- ioreq page, grant mapping, &c. */
@@ -2039,7 +2039,7 @@ int sh_remove_all_mappings(struct domain
     struct page_info *page = mfn_to_page(gmfn);
 
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_fl1_32_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 2),
         [SH_type_l1_pae_shadow] = SHADOW_INTERNAL_NAME(sh_rm_mappings_from_l1, 3),
@@ -2063,7 +2063,7 @@ int sh_remove_all_mappings(struct domain
     /* Brute-force search of all the shadows, by walking the hash */
     perfc_incr(shadow_mappings_bf);
     HASH_CALLBACKS_CHECK(SHF_L1_ANY | SHF_FL1_ANY);
-    hash_domain_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
+    hash_foreach(d, SHF_L1_ANY | SHF_FL1_ANY, callbacks, gmfn);
 
     /* If that didn't catch the mapping, something is very wrong */
     if ( !sh_check_page_has_no_refs(page) )
@@ -2172,7 +2172,7 @@ void sh_remove_shadows(struct domain *d,
 
     /* Dispatch table for getting per-type functions: each level must
      * be called with the function to remove a lower-level shadow. */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #ifdef CONFIG_HVM
         [SH_type_l2_32_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 2),
         [SH_type_l2_pae_shadow] = SHADOW_INTERNAL_NAME(sh_remove_l1_shadow, 3),
@@ -2221,9 +2221,9 @@ void sh_remove_shadows(struct domain *d,
 
     /*
      * Lower-level shadows need to be excised from upper-level shadows. This
-     * call to hash_domain_foreach() looks dangerous but is in fact OK: each
-     * call will remove at most one shadow, and terminate immediately when
-     * it does remove it, so we never walk the hash after doing a deletion.
+     * call to hash_foreach() looks dangerous but is in fact OK: each call
+     * will remove at most one shadow, and terminate immediately when it does
+     * remove it, so we never walk the hash after doing a deletion.
      */
 #define DO_UNSHADOW(_type) do {                                         \
     t = (_type);                                                        \
@@ -2247,7 +2247,7 @@ void sh_remove_shadows(struct domain *d,
          (pg->shadow_flags & (1 << t)) )                                \
     {                                                                   \
         HASH_CALLBACKS_CHECK(SHF_page_type_mask);                       \
-        hash_domain_foreach(d, masks[t], callbacks, smfn);              \
+        hash_foreach(d, masks[t], callbacks, smfn);                     \
     }                                                                   \
 } while (0)
 
@@ -3232,7 +3232,7 @@ int shadow_domctl(struct domain *d,
 void shadow_audit_tables(struct vcpu *v)
 {
     /* Dispatch table for getting per-type functions */
-    static const hash_domain_callback_t callbacks[SH_type_unused] = {
+    static const hash_callback_t callbacks[SH_type_unused] = {
 #if SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES | SHADOW_AUDIT_ENTRIES_FULL)
 # ifdef CONFIG_HVM
         [SH_type_l1_32_shadow] = SHADOW_INTERNAL_NAME(sh_audit_l1_table, 2),
@@ -3281,7 +3281,7 @@ void shadow_audit_tables(struct vcpu *v)
     HASH_CALLBACKS_CHECK(SHADOW_AUDIT & (SHADOW_AUDIT_ENTRIES |
                                          SHADOW_AUDIT_ENTRIES_FULL)
                          ? SHF_page_type_mask : 0);
-    hash_domain_foreach(v->domain, mask, callbacks, INVALID_MFN);
+    hash_foreach(v->domain, mask, callbacks, INVALID_MFN);
 }
 
 #ifdef CONFIG_PV


