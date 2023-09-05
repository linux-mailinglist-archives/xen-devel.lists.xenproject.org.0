Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1ED792151
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595502.929089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS51-0001bJ-8A; Tue, 05 Sep 2023 09:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595502.929089; Tue, 05 Sep 2023 09:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdS51-0001Yf-4q; Tue, 05 Sep 2023 09:10:39 +0000
Received: by outflank-mailman (input) for mailman id 595502;
 Tue, 05 Sep 2023 09:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdS4z-0001W7-7U
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:10:37 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12de11dd-4bcc-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 11:10:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6914.eurprd04.prod.outlook.com (2603:10a6:208:189::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 09:10:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:10:34 +0000
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
X-Inumbo-ID: 12de11dd-4bcc-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvT3XvZBMoNC/fQorQe3PMpMiPPbY7aABKff4Qk+u/YIgBQBsxZ/euA5jsg79+2vtUBkn6O0lVYs4Ofjt11v29CRhWsn9/RwGdNBz89czsF9RFqhqBrtNAopbUw+RQRAFypINAp0f48pDp6pXyXPczXZa4LNj8Ra2JBQ57K5VXfT1Dl4H6kUJRoXe6NuFn9kzny5D3r2pcKMQGmxqpaTjNlg7t38l1vTOg13DKYw9g/FjZok4nyMGBeUw7TGisyzjgr+5ABYpnsMLv+Kjo5cvA7S1Pn2ZDcVguRqbXXuibzLAQ5o3tJzyy4DAfw+DuK/NhzJhFbbWoykYHJfTm7rhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DE7MpGw7Og0CWnJ0nbJklNmp29KoDOwItn08FJ66lgQ=;
 b=U2PIii+a6XBoB/KxE48rTOnAfN8KkhLTwIuQWBZGO0NoPaQHpbqzArvnCj4di6IO82uJHSND6Rdb5T9MVadDUMoYQXzhsuvUs6Z/wZWdMaDcTt9s+WlpfUR7ZR4IRCesLt6y59D7P3RTedX4EKkq2ZyyIfCzYhyXC/bdEnnOzcpRtGp2P6F/AEZuhhS5fQJul44lOjt/XoaMk/WXK0EqYABQmaGjLxAv57y3tT8wm4k/Xz9LrNzBTlRztSJF6K4d/eFFIpbjxc25/COty5r4gp2lJGanEFkPJvNs9Gp1/ZXmiKCFERe2jYrVcyXCPctb5zGEhSwPHmQa4Sq3L/IsWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DE7MpGw7Og0CWnJ0nbJklNmp29KoDOwItn08FJ66lgQ=;
 b=eDzeXpK5Z/CtspS8fP9LdxrmSoC2/dfxNtjnHungaJFEyZb5zSOMzl3CIr+SmhEz47wzmRVum4C0F4kzZoLPnOnklBpEdEVHZtWU4hmbnH2qeQjY1UgJkvGlQTkJR9/uzjDYGCtfmR+OpxWgq69rklqHrbr8xa+XRUP9yk/umGS2eY7fGo26v9BbyHPjeo7BYa9JXr5cB17D/pPjPchRjNrCZ3TrcUC02NwNS7xJjkiss1mYAFKGUuK00UjfqMxk5gsPddEMHNhJChjgGDgU97OKavAhBEkqDJXKhwNYrE7qktn3Gl5yctmks4YrGiecNbbLqgKQXyjtz9QZFDWtEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <882e9427-25b4-244f-ad2e-9efa4e3be076@suse.com>
Date: Tue, 5 Sep 2023 11:10:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: consolidate LDT checks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5406e3-7caa-4108-58d6-08dbadeff607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hwrRWzoshFo3Z7PLRXaYsV+Z4c2lEte/s7pa96Anacqdg9GOlBwJO/++z83J3MwD/Iha2YXvJsPHYIfz6IEaJnpi6uFXqf1vAeIkwS/fCDX4G2pDYeFsEsWTrVLxYbGd5fCn13dJ/Y95k9iEQxCsH+Jf2z+GLeUM6Sfas3QTGTLik8aXdql1Ypxa5lUCrPZc1rGJ0uje/OviXbOHN3OyAbnSvmIQ6d8wZ8nbquddeqnI4O+wIwK/QHGKJ92ZyKjOCduLDa+xUygvCJNBJTIl8qOhDTv8HJ6yXjOzHvcLKA3orDXSyGcE8EMGUyiwLCaJtwGfh3Oj1rzJrbElaHVoJjQupRUF3RPNPlXlOxBcLfG+5IdMUqr97nSFxys0wp3Lh9+BKWt6HZJjEQj6dbxr2mKiviqbMxb86UkTN4qfF5gb9zjgaqVAw9NgZ0WLvl77IO9Nmu26QpS2hQ2VUiPlrr/87Cgc4B/FnYKnSPsH283FLA18TLWLoZ4RZzVzsu0K6zi5+xMTTrDHNmQ64plAy+GOtvvFfkAQMrqHaAmePSbfyCpuIrZgQVr95MrMZnhUti/SYInOCgLt2RoPpV1Sr954Yl2rk+oqorcPufX/nuNhuYaaKfZKr61xYHaUrI9/MW+1U26hb7A26tNZHkAh4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(31686004)(38100700002)(36756003)(5660300002)(86362001)(31696002)(83380400001)(41300700001)(26005)(66476007)(66556008)(54906003)(66946007)(2616005)(478600001)(6666004)(2906002)(316002)(6486002)(6916009)(8936002)(4326008)(6506007)(6512007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3FkODVVWFdrbUthTEozaFF6TWUxSDMxS216bUkrZEJ1QjJDSDdmanhsVEVH?=
 =?utf-8?B?ZU1ralBFSitDWlZ6cTkrVHlEMUQ5bHRMOExVVnZBQ3ZjWEZsSHNVdU43UFor?=
 =?utf-8?B?bEhWOEpmNkg3elJCUUlTdEhWa0hWblVrenVEOUJFWURLUFlMVFp0UjAzaEVp?=
 =?utf-8?B?ZGE0M1Bzc0pVcDZtR2Y4SEI4bkptVTZ0dVIvRlo0SGhnaE1nTndmdm1pbVJM?=
 =?utf-8?B?bStNUmMvL1dmL282RlNWQWhEaEFFNUo4NGl0dFErVVhlbVdkTEdkWE5RS0Uy?=
 =?utf-8?B?VFlDTWJ0Zm02cTBudmNUOFQzKzh2QVdnNWVZQzl4Vjh4WnZjb1Q4dGlUdExl?=
 =?utf-8?B?NVhVcTh1ZDRrMXZ1SjBuaU9lb0hWVUhYdGV2VGEzVlk1WDRGRnVSRWNGU0lN?=
 =?utf-8?B?c2Q0cEl6RUtQOURtYS95ZEJxNGdkVFM0WEZ6RURaU1ZIOWVGTFdzNmhicU1Q?=
 =?utf-8?B?MVRGWW9sTjY3TXZWSE9SakdveWU2SDBJZkdHclVnci9ITllwTWN5UjNjcCtE?=
 =?utf-8?B?TENGeUdSSGtsWFRaWUhjSHczQzFDUkpHSVBjVmRNRE9TbU5VVkxYd1VLM0s5?=
 =?utf-8?B?d1A0TXVBd3BOM2YveFlJZ3hrTEs1NlRKWER4U09IM3B6ZWlhY0tnQW5iWnYz?=
 =?utf-8?B?WVRvSnorOHFVbEM0REFtK2hqU296ZGVkSjl4RlFkUUIvakNyRHB6SFhGOWI5?=
 =?utf-8?B?QVV4U1J6OElPTnJHb2hPbVRRTEdycEM2VjM0eVRlVzJka3kyN3JFVTI2UkM3?=
 =?utf-8?B?dEpGSkpmR3J3MU9QUWxrSU5TaWpkZVFEa3lFTXhseUgvN2FRcEtXM3RlZXVV?=
 =?utf-8?B?L2Z0YVFINGdoWVNTWEllM3VrdnNTc3AvUERXL2tFaGhqTldteG40QkVFeEJI?=
 =?utf-8?B?MjZHWlBmdVMxMDBqdldLTmJIZ01nUW1GdTE3RHdLcUJtbEl3M29WUS95a3Ni?=
 =?utf-8?B?aVcrbkJIUmhhWERUT3F5UVRXMXh4Rk5ZaG5Zc0VRTHRPdGxQVDFySzJDYzBO?=
 =?utf-8?B?dkszOU5oSmMzc2lyMVdTeTA0U1h3MXk0MkhXOU5SWXJ1YkpSQkVNRGlXRFR2?=
 =?utf-8?B?alBoQm1Hd2hyM3ZBcmhlcktaRTNLYUFQVFlIS1NUZk9tZlp6a1ZsVU1UZndr?=
 =?utf-8?B?b3BlTW9HYm5RaHNLUjJKK1M4RTRKVi9hVFZqem42ZkJsLytrby96QlRDcVdw?=
 =?utf-8?B?am1IWGJYbUY3d0NWMHFXNVZuYy9hS0REamlkZzJBek4vdXBWL0lEMlpJOStR?=
 =?utf-8?B?bk5QOTRQamg0RlFmZys4OGx4ZCtyaG9uRDY2YnhHTmQ5eHdqcnFGd28yS2tQ?=
 =?utf-8?B?Y0JPUmx2MWRDb05DQXAvTXNCQnF4Qjlpd3BTL3ZGSC9yWHNoT0JjNU9zRmY0?=
 =?utf-8?B?OWx5TzVEMzBzczV6VTFuc0ZWcXQ0eUdzTmVubU5KOUFlNUhCbW0yTGk3c2hJ?=
 =?utf-8?B?cFZLZmdPYUh0UEFYNEp3S1VGZnpIVERxVXp2cS83ZGdZRXdzU2lmZEVNdWxN?=
 =?utf-8?B?YlZra0pCQmVjQ2xEa1l2VDdvQUx4aXBEWnhaVlhpSnpDNW55VEx6ODN6ZDhS?=
 =?utf-8?B?dXRYa3hPdnVUcHZvb25nNlI5MjJ4RUJOcldrVkdubUUvMTlEWTdHTmpBVmFD?=
 =?utf-8?B?dGhkbjJJc3Z4TGxNckxIMkNvMm8zZWVNZVdNaCtyN0kwVkpyKzUrcHdEQjly?=
 =?utf-8?B?WDVXbnk5cFYwb29kNklUajYrZ3JsYW5SOVhSaW9wRHJkSlZPSy90U2NNbFhv?=
 =?utf-8?B?QUhzQzZZaHp0aWVGampMNWF4b2Q3YmR0QStVSUtYdkMzc1lsYkxXZmNNd2dv?=
 =?utf-8?B?SG1uLzJyZmpHVVFtZTdUYmxOMlU0MGd3S1pmODBYZWQyWDlSMHRjSlVlQWV6?=
 =?utf-8?B?MFpWNEZreVBsdEFxeVZ5Q1hDaFA0ZHU4VXBjcG9RdmJFeFh3WGxML2lCRmNZ?=
 =?utf-8?B?RE5CWTVQbEsxQk9PNkk3M3kzbm5qZnFoREtudTRmOG94NHp5alFMOXVrVXFx?=
 =?utf-8?B?TjRFWWNKMEVUSTNoTGs4N3hISU5WYmJlSmpJRWZ5WHFkUzAzUEFOckhQN3Ev?=
 =?utf-8?B?amVKOFdOOGV1MHIxTkxRL2JsUDNDSlg0VE1SOWhIeVJNQytoQXVyRkhqYm91?=
 =?utf-8?Q?6vMR12NVjGycecvg3OPji7bHi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5406e3-7caa-4108-58d6-08dbadeff607
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:10:34.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SoyjJjUJbHUML67ZF1AK07z5Sbhk5t+6vn0mS7o4jSYfR+7sa/xnSwcu2caM09gGr2arudBcRDNTUahp8F8Kvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6914

Consolidate all hypercall time checking into a single helper function,
checking only static properties. The dynamic properties are already
taken care of by the __addr_ok() check in guest_get_eff_kern_l1e(),
used by pv_map_ldt_shadow_page(), in a formally more "precise" manner
(accounting for the offset into the table).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1081,7 +1081,6 @@ int arch_set_info_guest(
             if ( !is_canonical_address(c.nat->user_regs.rip) ||
                  !is_canonical_address(c.nat->user_regs.rsp) ||
                  !is_canonical_address(c.nat->kernel_sp) ||
-                 (c.nat->ldt_ents && !is_canonical_address(c.nat->ldt_base)) ||
                  !is_canonical_address(c.nat->fs_base) ||
                  !is_canonical_address(c.nat->gs_base_kernel) ||
                  !is_canonical_address(c.nat->gs_base_user) ||
@@ -1100,9 +1099,6 @@ int arch_set_info_guest(
                     return -EINVAL;
                 fixup_guest_code_selector(d, c.nat->trap_ctxt[i].cs);
             }
-
-            if ( !__addr_ok(c.nat->ldt_base) )
-                return -EINVAL;
         }
 #ifdef CONFIG_COMPAT
         else
@@ -1119,8 +1115,7 @@ int arch_set_info_guest(
 #endif
 
         /* LDT safety checks. */
-        if ( ((c(ldt_base) & (PAGE_SIZE - 1)) != 0) ||
-             (c(ldt_ents) > 8192) )
+        if ( !pv_is_valid_ldt(c(ldt_base), c(ldt_ents)) )
             return -EINVAL;
 
         v->arch.pv.vgc_flags = flags;
--- a/xen/arch/x86/include/asm/pv/mm.h
+++ b/xen/arch/x86/include/asm/pv/mm.h
@@ -46,4 +46,14 @@ static inline bool pv_destroy_ldt(struct
 
 #endif
 
+static inline bool pv_is_valid_ldt(unsigned long base, unsigned int ents)
+{
+    if ( !ents )
+        return true;
+
+    return !(base & (PAGE_SIZE - 1)) && ents <= 8192 &&
+           is_canonical_address(base) &&
+           is_canonical_address(base + ents * 8 - 1);
+}
+
 #endif /* __X86_PV_MM_H__ */
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3800,8 +3800,7 @@ long do_mmuext_op(
                 rc = -EPERM;
             else if ( paging_mode_external(currd) )
                 rc = -EINVAL;
-            else if ( (ents > 8192) ||
-                      (ents && ((ptr & (PAGE_SIZE - 1)) || !__addr_ok(ptr))) )
+            else if ( !pv_is_valid_ldt(ptr, ents) )
             {
                 gdprintk(XENLOG_WARNING,
                          "Bad args to SET_LDT: ptr=%lx, ents=%x\n", ptr, ents);

