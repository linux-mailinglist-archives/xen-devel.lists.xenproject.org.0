Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457906F5B94
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 17:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529326.823629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEp9-0002ee-N7; Wed, 03 May 2023 15:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529326.823629; Wed, 03 May 2023 15:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puEp9-0002cg-In; Wed, 03 May 2023 15:55:23 +0000
Received: by outflank-mailman (input) for mailman id 529326;
 Wed, 03 May 2023 15:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1puEp7-0002MD-Cz
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 15:55:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2081.outbound.protection.outlook.com [40.107.13.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e783c349-e9ca-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 17:55:19 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DU0PR04MB9658.eurprd04.prod.outlook.com (2603:10a6:10:31f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Wed, 3 May
 2023 15:55:13 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 15:55:13 +0000
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
X-Inumbo-ID: e783c349-e9ca-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEn3SZamiUh+LaSGxz7RnHnIzh7e18dlWlHCy6dICRCUkgBM67J5anVsw931BjnKX8w6H//1huTXHaVGCrETzaU8iCB8BnGBYf5CKCHOJJtHOlSvq6fSMBCVPQ1dPLsBggoDbDnebGqreSCtdlEGCkYSFCN1daVdyQiILjqWCnmfys425MrGCfxubl+Rvq402iZ1BgOAfU+TPF0yAZszO+E+ARa0EnFd3el7zYAjuRoXGvAwbzVIfczwjA7BIqnp5RqH6VgfyREUulfmvevLsMGgJZz6MVyFZFE8e0Xgcri5jcdFDH8aZZpXyVdeaqX9SiFXWl5ZUA2SPvYAXJOupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6yjHr0PfftdPO6Ee88aaSu+J8Pv7p1vKjlZEcGgTTw=;
 b=Dm7r90AHXe+maGSyqlOiRafIFF2DFnW0tjdci60DDSWPXn1M/7k+oxTXOv8Q9x8NgbZFAv3BSStJ7LNwzU4QqrPE3Qy7kPe0otAn27OIOaYaouyMKz97IfSpI1fPs9giMnwyDOhzr52YCKS7V01tVEmjxNHJLg+Qyz/F0TmxKsEGQNQOeC0Sc83RpTHWFPDVp74egokb6Hudpzv0C2DjJ3q9SlTVLAc1orgA7MDgtU98NixXr3Ua4JCuTCjpWBjHXvPIVRP9E9VCSGQNf/RnpoLksRInNSBDW/nwtx6QTklvj+F0/h3s8LTSb0cUuC9fT53v0tJyvnzRJTDANe0BcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6yjHr0PfftdPO6Ee88aaSu+J8Pv7p1vKjlZEcGgTTw=;
 b=D1GYqkZTkOLEKzzmIi9q5uEAvCEJvrZ4Ee7Vz9DOw+kX+RMHfUlVqsRkRtyletxBp5UEcr4QNT10qq74FJ/C4t7cM+PEKMCB0S548RE7Dc1eRF+bb7Cx3QQkIihY0kiWME6gpwOGqgJB1iIxNnFN6ppbYEWjf3KG9+N3egQvkfPNCMXa3jTcfxw8MPOzVPQrnkR5OztHV9rPcv0hBcB1HbFugURuKzEMUECBX1P/CtMt4ocFKKd/Y/crFfAJ6UPUgnZjQFpDwu9byx7mTgxmzt1bQXusauj4LbSfHMBUxJBoVeL0BSY2HwbNVJoEK07JXCBFB5PQbabyqFKN+SW9bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <65893a9e-e2ae-6853-7c4d-54f2bf19b17b@suse.com>
Date: Wed, 3 May 2023 17:55:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v3 2/8] domain: update GADDR based runstate guest area
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
In-Reply-To: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DU0PR04MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: 595c3862-ac38-43d7-4e5b-08db4beec7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tEUd3Jv42yDnr32vQG7G5osjlauYf2E+lSNMeMo3iDIKhunZm7E5ZTcJlYbLwPoQg6rojBIuVrR03F4KMm2Hm54eE3yrDet0U8jPMV/LkOypAxJvfmPFFujWDyZZL/49O8W8+XIEdyhunFKKcP8vvqSFEVk47N2XMJZoSwFZfZwLNnsBYfvblWBYsTOjFDqLg+0P8pSekEOYoRUp3dbIPiM3e9kobI2IPkIvA+m23wDVYO7rvGxnufNgjJjI8+3+RsbM6SsBUu4RmHmKVgF+r31hfeuFphD4GfSRvZDmflSk3SXJ281ELse1YcsFXXWGLgM4lKxupQzrh/rdbG51eTPHELC64ycV5145CkHpTn7eP3uX0JfuLbaRrY2+ORI0xWc3mBnqkhZh85Mtk7qAoeX+1JPGqnFTVdcJDTFGoDx2RfVpZZH042Ciq9FQoK673hrwx+1Pun8L88P4LLroQuNPj/gMA1bkp9WLUD2MBxyXSrVWrY/lTIYBjV6snkLeN/BOZAmBKM25qpvplSF2+9zE3LfbMDSaW87DBjTLs6yShAR35soTP5Ta1BzaDZgFBsHE6kITp0dJj+uLBD5Ttk0EQ97LJk2/0O3hDUEsZljBYS2/Gh83/5IYjsBDtPaQkl4No9twnHINvF5z4AxyCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(31686004)(66946007)(6916009)(66476007)(6486002)(316002)(66556008)(41300700001)(54906003)(4326008)(86362001)(31696002)(36756003)(5660300002)(83380400001)(26005)(6512007)(6506007)(2616005)(15650500001)(8676002)(2906002)(38100700002)(186003)(8936002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0dtWkJ3UnBhaDRleEdFeFlxVGlabFR6NVlTcTBMdGx4TndqK0lTOFpaUVp0?=
 =?utf-8?B?QVlVakdVYlArcnRkanNhenZVUTBlYnFCT1krZHpIS2dVdGhrV2JBRmcrTFF0?=
 =?utf-8?B?S1V4aUNuOC9qa1lCb3dWTDIvZ3hQaVlkSkN4RHhEaVB5TGpTc2tHVnlzNEcw?=
 =?utf-8?B?bnM2dG90dWdkVHhlcitVOUlqT3dzeVgxSWpUU21yekQ4bjZkSHdpd3RBeUl6?=
 =?utf-8?B?R0NkRHRaMTNTNWVrSUd4QUxsTndLakg5akZ0aUpzM2xSUk9oRU9TUDJPZ3Q5?=
 =?utf-8?B?K2RjMEJzUVlhdUZQVlQ2ZEU0UnFpdldpYmxvQWpnYWtSYWsyMzZBclk3NVA2?=
 =?utf-8?B?dG1VejdMdXE4MFgxd1VIUmEzci9VSjJTQU9FSC9qTXdZcUQ5QkNnUGdia1Yw?=
 =?utf-8?B?THkrczVpVFNFeUU1eEZ5Y3duSzQwK1FpdWI1cEZxQ21ET2dzS3ZQa1Q0blhF?=
 =?utf-8?B?ZWhtUlQzRHI2Y1ZjRlhGRkhpMGZteDVSdVI2N1h1SEN0K2FHYm9kZ1dXSlVZ?=
 =?utf-8?B?Ykt1NkxVOTAxSTJIM0hoMDdiamxNMU1HeWx6S1lMbUx0ZjZka3Y2UG1HcnpN?=
 =?utf-8?B?VzdzQXJZeHJYRGxtSEo1WUpBU2xrenJUeVIxNXMxaTJqMC9idXh0SWQrbXBi?=
 =?utf-8?B?LzFKSEduTEpFTWp0TUZrcUs2a2c5MWxMQ2lnQmNMVUw4L2taelhGMzhOdDRw?=
 =?utf-8?B?SzZVNU90Sm5HZFJjWjBGNHRsNXJCa1YrYmg2OU1xSTZWU09NWTFzZFhJUS9o?=
 =?utf-8?B?K2FRaXY0bnMzWEFHVXNRVUVxYUxHYUhOM0VlYXJWdFNubVBmOWtucEp4ZlA2?=
 =?utf-8?B?VlVtaEpuNVVzN1RzVGcxZmZTUkd1dC92WTZUbDN6T2ErN2F1UnpjZjNjc3lG?=
 =?utf-8?B?YTdiMlZ0dHp0TWxZc2ZPd2h0MGdwMzh2Sk5WOEVNR3RyVDlTUndrYVZGYzMz?=
 =?utf-8?B?UkNObFZPVWlDRzdNVkc3WVpGTVpXL29XcU80ZmJGMFE4Ui9uQlVaN3JVcmdo?=
 =?utf-8?B?ajgvTkpobjNQUWVNcDVMcWRTOVQ2dmY2N2lTQUR6bGV2RkFZYlZJY0llTTBS?=
 =?utf-8?B?bFBPR1JVUWFtZjhhd0o4WVc0NU5rUWJYU2daRkJmVTE5TDNMNTA1Q0IzTDBU?=
 =?utf-8?B?Ymc0OWFaSkhTV2lLUkgvNndEcWtSNXE0QTduUHhsb0ZQRGM3TG9EWDBhd2Mw?=
 =?utf-8?B?TlhDQzBLRXNCdXYva2wxT2kxakkzOE1Qc0Uvb2hLWlBxaGZpZ0NITjRINDdy?=
 =?utf-8?B?c2R6blBXOTFySjRLWXdGZDlCNzNiVU4yRzVLbDIrTDBhMjdNNEpuRGYzNmE2?=
 =?utf-8?B?T1lxYlUvVFZvR3l0SmhQd0FDRjVFLzgwTXdxM3cxSjRqYXRMVU1nWmV0SWQr?=
 =?utf-8?B?cDFueEwrL1NRdGhhUkdGZ1cxb3c1VjhlMGRLSDFOT2pIdEtIeWdwZngrcXhz?=
 =?utf-8?B?T0todFlIVC9lUllncWUwbFZtMEhJMk5wdVMyRHE4dEFQUjI0OGxQVW0xaUs3?=
 =?utf-8?B?c2phOVdaWjRlVHY4Uk91a0xiNjBKMFR6c2thT2Z6YzZqTkdKRDdyQWkzS0s5?=
 =?utf-8?B?NHFncXllT3RaOTB0UXBnVmFHN2V2K0podFVYeEl6cFFKSkxEbThkd1ByN1N2?=
 =?utf-8?B?dU5Ta0NCZnRJTVljM2ZVSDB0bDVlMFYxZHJ5aUMxS3V3OEh5SlNLWkM1ZHpX?=
 =?utf-8?B?NkNubEhySk9ZbDg1SVpWV2xGSEdBSXJxWi9zSlV5L0dJMXpJRGdsNkhkak1U?=
 =?utf-8?B?ektaLzJDWWpqWjhMenFsMlUxaDBFODlnUEk0WG9VV2ZSZ3cwdE13MnJYNk5w?=
 =?utf-8?B?QThxRnZVMHhRekhkY0tKcER4SW1GUDkzRENHcVVoNzZzcWY4VENBWWZWZnAx?=
 =?utf-8?B?K1hyZWl4MlRUT055cjJMS1VlZW1ibEQ2Z2I2Y25PZFhkME5yRE1sWWxlNC9W?=
 =?utf-8?B?RHUwMmw2YnBkK2p6MVJtbWZLL2VsQlpJNFdsR3FyZmVrSGs3N1NIL1pEUHVz?=
 =?utf-8?B?eFBzT0F3VzAvblVrQ0VjcjhydGlRaXRzMW1WV2tXNHBQZTZkWHJPVkJEVVox?=
 =?utf-8?B?aEUrUWZlUjNHaTdkUU9YR1FqN0VJWDJ0QmczWHZqaHdsbklBcjRRQ1JDeFps?=
 =?utf-8?Q?Y8F2vNbsBwPE3QPpkzYckBWo3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595c3862-ac38-43d7-4e5b-08db4beec7fc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 15:55:13.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqEp816xcAml/2VFrs3XPNY+k5XyBRnNeAN8RSnOPqHEHmWcbOuoQRbm2ZtlHRJWzMgL/6gPcyul4t3ZhVhkgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9658

Before adding a new vCPU operation to register the runstate area by
guest-physical address, add code to actually keep such areas up-to-date.

Note that updating of the area will be done exclusively following the
model enabled by VMASST_TYPE_runstate_update_flag for virtual-address
based registered areas.

Note further that pages aren't marked dirty when written to (matching
the handling of space mapped by map_vcpu_info()), on the basis that the
registrations are lost anyway across migration (or would need re-
populating at the target for transparent migration). Plus the contents
of the areas in question have to be deemed volatile in the first place
(so saving a "most recent" value is pretty meaningless even for e.g.
snapshotting).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: HVM guests (on x86) can change bitness and hence layout (and size!
     and alignment) of the runstate area. I don't think it is an option
     to require 32-bit code to pass a range such that even the 64-bit
     layout wouldn't cross a page boundary (and be suitably aligned). I
     also don't see any other good solution, so for now a crude approach
     with an extra boolean is used (using has_32bit_shinfo() isn't race
     free and could hence lead to overrunning the mapped space).
---
v3: Use assignment instead of memcpy().
v2: Drop VM-assist conditionals.

--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1615,15 +1615,52 @@ bool update_runstate_area(struct vcpu *v
     bool rc;
     struct guest_memory_policy policy = { };
     void __user *guest_handle = NULL;
-    struct vcpu_runstate_info runstate;
+    struct vcpu_runstate_info runstate = v->runstate;
+    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
+
+    if ( map )
+    {
+        uint64_t *pset;
+#ifdef CONFIG_COMPAT
+        struct compat_vcpu_runstate_info *cmap = NULL;
+
+        if ( v->runstate_guest_area_compat )
+            cmap = (void *)map;
+#endif
+
+        /*
+         * NB: No VM_ASSIST(v->domain, runstate_update_flag) check here.
+         *     Always using that updating model.
+         */
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            pset = &cmap->state_entry_time;
+        else
+#endif
+            pset = &map->state_entry_time;
+        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+        smp_wmb();
+
+#ifdef CONFIG_COMPAT
+        if ( cmap )
+            XLAT_vcpu_runstate_info(cmap, &runstate);
+        else
+#endif
+            *map = runstate;
+
+        smp_wmb();
+        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+        write_atomic(pset, runstate.state_entry_time);
+
+        return true;
+    }
 
     if ( guest_handle_is_null(runstate_guest(v)) )
         return true;
 
     update_guest_memory_policy(v, &policy);
 
-    memcpy(&runstate, &v->runstate, sizeof(runstate));
-
     if ( VM_ASSIST(v->domain, runstate_update_flag) )
     {
 #ifdef CONFIG_COMPAT
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -231,6 +231,8 @@ struct vcpu
 #ifdef CONFIG_COMPAT
     /* A hypercall is using the compat ABI? */
     bool             hcall_compat;
+    /* Physical runstate area registered via compat ABI? */
+    bool             runstate_guest_area_compat;
 #endif
 
 #ifdef CONFIG_IOREQ_SERVER


