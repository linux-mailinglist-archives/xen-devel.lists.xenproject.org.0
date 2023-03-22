Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D056E6C468B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 10:35:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513250.794004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peusY-0003Pe-Vx; Wed, 22 Mar 2023 09:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513250.794004; Wed, 22 Mar 2023 09:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peusY-0003Lp-Sn; Wed, 22 Mar 2023 09:35:34 +0000
Received: by outflank-mailman (input) for mailman id 513250;
 Wed, 22 Mar 2023 09:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peusX-0001jq-VC
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 09:35:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e46c1037-c894-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 10:35:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7641.eurprd04.prod.outlook.com (2603:10a6:10:1f7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:35:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:35:32 +0000
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
X-Inumbo-ID: e46c1037-c894-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jk4BzocS6YVlN0qL+ZZX6UuykIhqxcNobLzV+0YEkKi5lE8vXYOcZWN2TPM+AN8F/ElzJ9umoerGJ0zNqRX0L4UT/jxpyoGSJJdKWy4b1yufGUPqPKuEXOYU2bC7ckJFNMmoDunsyh9F838kmcswalAy69YbxdOFVbEdR11p7hPYR4y0/UpHxy4fVbUX9M7g7G6djBhHAyXSIObQSoS0ahYTtetXHoB4wisSNEHtQgXo9BSYA3KmdVMbB/vYKogdOJu+iL4Db4spQVlcIhBo7KzztyjjXZYqijqvRbfkPfAYrCmKNphVilu3rwkrxvLs4/84Ejpn0mC8savPKEyzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JpaGfQeLkQ56mz4Rxayz90QR0YFr21pkBgPHbqC+ZI=;
 b=Od+oxtFaVuY0sQfATwdaYxL5Yz9WylvuHhtc6kTPS8QSEixhl3iZmpJcHCwQlM9NYs3tJ5+DwPpWV0V3cZJI3kFrq7V+0BMhHIklxZUitz10g67JT5c900ECb54I34wsroJn0K2O4PJfEioapEjgAMYcu5PLeHzkE+yZssSjf/5tmGa1kFxKGRTWsz4b8pdanbrJIE+nF5XXNKgddp0BJIFl48mm9BM3X0ffAPGRdSjHpwV4qxSZlhCFYjCZP7UmnyFWxAT/7sIKv+jckrYus87mpAFf18YSGVwYJQ4ampF0WTUsJ14NvPF8dI2bW9WGulBjfsVhusvgdnbdKbs6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JpaGfQeLkQ56mz4Rxayz90QR0YFr21pkBgPHbqC+ZI=;
 b=1V876pnophvqlIHINHi6Q0IOxFmwr0BZ1ECxazEVNlW7S5oRAOWn6ASNElUigXG4vM1ic+k+TOWDk5M3Aa6MOUETkc7gVcyeY3iaag8boHsp2wK6Xbz06wr3gulUdz4jmUWtH1i+709DH8Lu75j6Be0xWd4xd5hsy6MdT9HjjFxdIHGRAizuovAYSf49PS/IBQjoAhIhZrKg49CDcyzvCymp6L1V28M9Om64mS59+YjV7zjXbtbYn3XPuMxktTpwwb+rnJKZHF20zLCcHrl44Pr6mTEsMGavwxmvXOxVYzGfdnrjob2/xoWbftD/E64t4dgM1QjhWGdfMWESJXCfsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5944a3ea-cddf-7ddb-d167-a0a0aa9b4967@suse.com>
Date: Wed, 22 Mar 2023 10:35:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: [PATCH 11/16] x86/shadow: drop is_hvm_...() where easily possible
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
X-ClientProxiedBy: FR2P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: a8eeb0ad-8aa0-47ab-ee41-08db2ab8c7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZDRYwvzunbBHDUqZ4sKjLOHB/FJ2iMxeylW1uXqSZQkP/hYgzObql3+/wgvFR/R7H75EkZ2aD42uLa0VrEjw/y0CbHd+luD5Ez2V1i/195AaXEKwciE4rJtj/8IEHdrRtRUQW/KwNdgv0mVKOArDEWWnMJO4Pe4rCnqfubg52Swd3en9kxG21ba+zsxCun4uqhcgbyymXIuviwxYxhpNyoMoJbwedW8As66ZhuxKMLB7A7PVTjskhNGE73FZ/2Ab7APVT9k5nhAtauKvwMDylau4W/mElBPNzxGc/iqjntxdNvAShKZCEpNTba9xWCa7htPWLSmiBdu2qtgh+J/d4tZ51BiHk/pRHqUA1Y01moi/YxiCHyUbNhYt6QHuR5aKQPsiqddvApVdgveV63dFHi/84gkgvdahDuQ1blNJ7VN2gMsDKMYaIIRCG54MYQhqM7MHgCDfid7vaPAG7y62ZdC0cfUDZHVXZVKuwaQnS+sBn6vMG2E7dl/FVGkNh1JZtpJaU8NCIg+c69WvNVIJZSvpdmWnsKI7aolxynWo7Htd9WbCHO9DZ/1lzTbEPn5KneIWvpuH7/yHwc0JqzhjCjEw6ZXZ2N5DcJE/Y2EWpGijxDhRtNH+Q+oisArkAyqNqxTBeNMx/x+6Z6xC0x0y55x4Uosgdk/0O/i6tIP3dKl6J5VitveRtG/cPJF/Vf1W5P0WXMFbu6QwroDpHCQhSiG4ojrZfFWqZ6s2hK+9IQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(86362001)(31696002)(36756003)(38100700002)(83380400001)(8676002)(4326008)(316002)(478600001)(54906003)(66946007)(66476007)(6916009)(2616005)(6512007)(6506007)(66556008)(6486002)(31686004)(26005)(186003)(5660300002)(8936002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1R3b3RldUk5Nzc4bHk4bUd0dDBBMmVOVDBYOEdCcWFZUTJiUTVlTDVxNVk1?=
 =?utf-8?B?L2NPRFUyS0FuNmJSdUUxaXI3RnMxUjd2bmUvd0thb0RQbjVLMDVRTTNsVTVu?=
 =?utf-8?B?TU0yTDVLdkZlTDBaczFCcEh1WHB6YkMxcDBMK1EwQ09QRVZrWUZWYU5vS0tq?=
 =?utf-8?B?c2Z2ZWgwamFseUpMVXhPN3VQZTcxbkNXTXQ4Vzh2TjUrc2V6Q0JJWllFSkxY?=
 =?utf-8?B?bmRLUmJLdU5haEI0RmVqOHZpR2U1MzJWejVnZEJubTlRamxRRWpkVWNvemEw?=
 =?utf-8?B?ajZlWEpPaWdqdGdSRm8xZnhkQVFVcTdYN25ucTdCWkxKc0pVUCtRYm9zV25z?=
 =?utf-8?B?Si8zdXhvK0gyWXZCbGcwYThOTmx6Rnp6SDVVbEQwSmxSWmt2VnpXdXdDYVN6?=
 =?utf-8?B?RUJxOWszYnlNeGk1b2o4Y2JBNm42ZG5hK3R5ZUVWSzhxenNNbEZUYWwxVTMr?=
 =?utf-8?B?enFXb3g3ZzJhcFBod25Cc3RaNytiRll0bTRtY3VRWGtwVlpVcytWRU5qZ1M4?=
 =?utf-8?B?MjhuMkNsMVdUc1orbHlXSWtUL0E1QllBOERKTGgwUlVHR0RMVi9NRkh5NXl2?=
 =?utf-8?B?eHlDV3pUbCtlUUtHQ3NIcEtaVWlOZFJTSVVjdzNQUjF1a3loRHFYWkQ3bmw4?=
 =?utf-8?B?dG9EeFFLNDNGMk5ZalZyVDl3aUlsUVk5U3R1MXJ3NE5Cd0tNNVVTZk9BMHh0?=
 =?utf-8?B?S0xaSGFTb2ZCenNDY1I2TzhObUVHZm04M3hGMEZtajhKcHcrWjlKdlAvYytI?=
 =?utf-8?B?ZWdFVFkxU3BlUE1YU2xMK2hmcE1yeCtMaXZJdVhuTFFsbUZQVlJEVjNPSnVQ?=
 =?utf-8?B?ZzY4ZHFDOWhHU2NOaDZJYTlwakgwZGQybHY4YWpSRDJJRTI3R1BDOXdLLyt5?=
 =?utf-8?B?MktCR1NyQ0ZtVWNUQnFlcHlkZ2RYUC9nMWI2bG9oZk9pZUZRU3dQYW9CSUxL?=
 =?utf-8?B?ZXpEOHVtQW1pQW4vbnZic3FVTDJhNkgvcHJObk50bDRJSVdEU1ZvVW5wa0Y2?=
 =?utf-8?B?NE9veUcrN0tqamNVOTNSL0YwdlVJTE5Td3N4bzhSSi8zT2VxVjZ4TmFhMXNv?=
 =?utf-8?B?L2Y4cVNDbDBwUjdWVW9CZUFWZHdrdWhZWXNuNnM3QU9PRXpYQ2E5SlA5N0dT?=
 =?utf-8?B?VkR5MkVjUE84bnRIdXpmTXNHOWhGK2Nycm1sWmV3d1dHZGZWbW1aRlh4a0RY?=
 =?utf-8?B?cWdWdVhtZjErdTU3c2JjeEtHdXlOQ3hRUGU0THlyUXhhZ3RYb1g4ZndiTEpL?=
 =?utf-8?B?OU8xYVlXYWZTNFVBOEMxN3ZxYVhkQWJQNUVUM0dJa0dWMmNkVDE5RitRVlVW?=
 =?utf-8?B?dXN6T3Y4RHlHUDBCRk1lUitBU0hIK0lxVXpOS1hJdFl0WEZsS3lic0dtNVpP?=
 =?utf-8?B?MmUrTSs4T3NyS2NYSHUwUGJLalJwdVZWanhLeVNjcUxPeXU4eDdIZTl4RXpj?=
 =?utf-8?B?d1ZZL1ZxbmxDdnZsSEpFcGc2YnI0bVRLcUNzMHFvaHRGVS9ZbWk1UUN0azds?=
 =?utf-8?B?ZUVNdWdOQmtVT21KaERDODBYTWk3SVRHbDhFODBTYTdoa1BOeHdZQjRudGNm?=
 =?utf-8?B?VmRZbzZFd0syOXU4TWlBajZMb2NaRThhalVEdW5zRm1lL20xVktzb2tUNmY3?=
 =?utf-8?B?bG1CMitoZjg5dFVRVktwOVo4TnFiL2U4dHBYQStNTUJRbmZ0UVJuOFV1UjJX?=
 =?utf-8?B?NURQMWtSZ1hmRXQvQWFzbDR6YjFKR1lWK3VmcjVQeFRMVTJ6a1J1amt0ZlhK?=
 =?utf-8?B?THlNQUpRcC9qRGJqTWh0VGlRdFk1aUl3Q3NLTmJVRVRwNVVIbGRnZkVVUm1q?=
 =?utf-8?B?QlNIOXFRZGFLbEE5QS93WDZEZzVmTzRyLzJ4eXJLREUvZG1aTG03cWJVeEdh?=
 =?utf-8?B?TzBtMllESGJmZ2orQmlXbS9Uai9sSElvN2hpOXNoMUtqRzk3ZzdGRTh0VHFC?=
 =?utf-8?B?VGJuNm83a1lScWRiZmNBc1JuMExKeXZ0Mkw4MUVOZlozNjlqdkc3enArUFZS?=
 =?utf-8?B?L0lTdXoxaVU4c0dYY202MVJyR3dEcDE1MTk5TzNhMTBpY1BaMXFWYWhuSEtN?=
 =?utf-8?B?cXBVT0tkeGwzcDA0Z2NNOC9UTElhb2ZmemlJVkdxMFErZ0VIcjRFNkYrc1R2?=
 =?utf-8?Q?FKn1FulM5z+0Q75Rc26aSHsPy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eeb0ad-8aa0-47ab-ee41-08db2ab8c7e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:35:31.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVH4EUnqt20qmNFlTk9Bp2yCtaNZ6Z8ALOyxEtdVIo5VBisr6Zt+RrmZDHVGptMGMGLg57QagvRE/Y9FxzkyLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7641

Emulation related functions are involved in HVM handling only, and in
some cases they even invoke such checks after having already done things
which are valid for HVM domains only. OOS active also implies HVM. In
sh_remove_all_mappings() one of the two checks is redundant with an
earlier paging_mode_external() one (the other, however, needs to stay).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1522,7 +1522,7 @@ int sh_remove_all_mappings(struct domain
                && (page->count_info & PGC_count_mask) <= 3
                && ((page->u.inuse.type_info & PGT_count_mask)
                    == (is_special_page(page) ||
-                       (is_hvm_domain(d) && is_ioreq_server_page(d, page))))) )
+                       is_ioreq_server_page(d, page)))) )
             printk(XENLOG_G_ERR "can't find all mappings of mfn %"PRI_mfn
                    " (gfn %"PRI_gfn"): c=%lx t=%lx s=%d i=%d\n",
                    mfn_x(gmfn), gfn_x(gfn),
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -204,10 +204,6 @@ hvm_emulate_write(enum x86_segment seg,
     if ( rc || !bytes )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -258,10 +254,6 @@ hvm_emulate_cmpxchg(enum x86_segment seg
     if ( rc )
         return rc;
 
-    /* Unaligned writes are only acceptable on HVM */
-    if ( (addr & (bytes - 1)) && !is_hvm_vcpu(v)  )
-        return X86EMUL_UNHANDLEABLE;
-
     ptr = sh_emulate_map_dest(v, addr, bytes, sh_ctxt);
     if ( IS_ERR(ptr) )
         return ~PTR_ERR(ptr);
@@ -457,8 +449,7 @@ static void *sh_emulate_map_dest(struct
 
 #ifndef NDEBUG
     /* We don't emulate user-mode writes to page tables. */
-    if ( is_hvm_domain(d) ? hvm_get_cpl(v) == 3
-                          : !guest_kernel_mode(v, guest_cpu_user_regs()) )
+    if ( hvm_get_cpl(v) == 3 )
     {
         gdprintk(XENLOG_DEBUG, "User-mode write to pagetable reached "
                  "emulate_map_dest(). This should never happen!\n");
@@ -487,15 +478,6 @@ static void *sh_emulate_map_dest(struct
         sh_ctxt->mfn[1] = INVALID_MFN;
         map = map_domain_page(sh_ctxt->mfn[0]) + (vaddr & ~PAGE_MASK);
     }
-    else if ( !is_hvm_domain(d) )
-    {
-        /*
-         * Cross-page emulated writes are only supported for HVM guests;
-         * PV guests ought to know better.
-         */
-        put_page(mfn_to_page(sh_ctxt->mfn[0]));
-        return MAPPING_UNHANDLEABLE;
-    }
     else
     {
         /* This write crosses a page boundary. Translate the second page. */
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3441,7 +3441,7 @@ int sh_rm_write_access_from_sl1p(struct
 
 #ifdef CONFIG_HVM
     /* Remember if we've been told that this process is being torn down */
-    if ( curr->domain == d && is_hvm_domain(d) )
+    if ( curr->domain == d )
         curr->arch.paging.shadow.pagetable_dying
             = mfn_to_page(gmfn)->pagetable_dying;
 #endif
--- a/xen/arch/x86/mm/shadow/oos.c
+++ b/xen/arch/x86/mm/shadow/oos.c
@@ -577,7 +577,6 @@ int sh_unsync(struct vcpu *v, mfn_t gmfn
     if ( pg->shadow_flags &
          ((SHF_page_type_mask & ~SHF_L1_ANY) | SHF_out_of_sync)
          || sh_page_has_multiple_shadows(pg)
-         || !is_hvm_vcpu(v)
          || !v->domain->arch.paging.shadow.oos_active )
         return 0;
 


