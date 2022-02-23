Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A724C17F8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:00:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277480.473996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu3S-00021z-5z; Wed, 23 Feb 2022 15:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277480.473996; Wed, 23 Feb 2022 15:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu3S-0001yt-2I; Wed, 23 Feb 2022 15:59:50 +0000
Received: by outflank-mailman (input) for mailman id 277480;
 Wed, 23 Feb 2022 15:59:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu3Q-000083-HH
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 15:59:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ff2ad84-94c1-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 16:59:47 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-abkoG7xhPoqmV5MEq1IFFQ-1; Wed, 23 Feb 2022 16:59:46 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7277.eurprd04.prod.outlook.com (2603:10a6:800:1b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 23 Feb
 2022 15:59:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 15:59:44 +0000
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
X-Inumbo-ID: 9ff2ad84-94c1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645631987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxOvYBPuwcs53bD4+mtzB6XcLqkGKt/WncfF3FQQLbQ=;
	b=d4ajpPmOPofNs+OPBpiFx0MBBSAzq0z86m1kPc3v1VEf4ywCiXYzkynxSxvaBR0+xVxoPs
	BWGtW7zGL0U2RRsD+UUkkgdNmPAtk1JXnQK2xyIeVpxrec4c7YszryRqq5EFWYywX81Ot2
	9e7+VfWcOBqf6LctQrW+vkZBPV/yQIE=
X-MC-Unique: abkoG7xhPoqmV5MEq1IFFQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqtXOWrC85AhXLlQO37mlPRuNqBbvTpvf8XGeHMXnCB4+B3kKRODde6m9ZbYD0juFpJ5F4LTcRNYrh5tbZynUj51QJh5KmWXSebMvOe5stzvJnbbsuEcuaRlG+BwEVbq+cjKeS9UJnflDfB4Gj7owWOxycDbk06ZyzRYzbikmhyMmdIQ/PIXesyKScnXb9n2AM1LlbNzB8B+w5PAL6so/pBAZ3yZGh5Qcd7QgJX8sguO9jeAiPMq0KCX6sDQW++jyFJi/956V9MlCePPsukpSrEAX8nNTsiIQTN9mp9+iDsSU0VBu/oAalZuahJZYKJOZdD5YHwm+X9y+bP+F8OREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxOvYBPuwcs53bD4+mtzB6XcLqkGKt/WncfF3FQQLbQ=;
 b=k12nXV9WZS0/4y9XCBm0gu2xmJo5TTdnf0pcmp3izAFpPXzUTg3hZJl01UOJyrgUvObpCETUhl4Ph40wBKEFzizbqZBcqs5wvooTzPWZwn6xWkgwHigbYK3TMCPCzKDlfZlqR6VQmsfpnIR6kLDjQbEohju3uN9CeXaiFfI52QxeWha3ce84MYfvBgZh9t90YTDUj7+lBN5J3ybGPYytGFEAoKu3yuhYv56LExrIJDsJxRy3U01u6Q3sTDOjS157KK/aMRyP+sgyMHga93dh0DTRMBYT2gxWYCCjfIvmTWxlK0X+RW9bfHfoOWPEtNW6I64zKnPmW/K0LBE2ipIdtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <69623630-cda7-9b2b-4f2f-09a83d5dc22a@suse.com>
Date: Wed, 23 Feb 2022 16:59:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 04/14] x86/mm: split set_identity_p2m_entry() into PV and
 HVM parts
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0010.eurprd07.prod.outlook.com
 (2603:10a6:203:51::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74362b95-35ae-40e6-5e4f-08d9f6e5822b
X-MS-TrafficTypeDiagnostic: VE1PR04MB7277:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7277923295A8289DB075C890B33C9@VE1PR04MB7277.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O6GhJO9JSlCfTRRpTRHJv96TDo1klnDLYdOiA0zJXOupuPHTJ8P8mihdKjlpFlkRg613p7vjQOgMoujI211QBbg50Dp0HJZ82O2rSdQguftlsfGYr0wzLacOB1xZWIeqneYAOKVSaPUsR7wSTjOLD5L0GT7b53eQ/wYULsAjVffgr1ZYk6vZZDBtpekQoDJKUz4jRRb+dW52MPvxz6f9nVb7V1vL0riq/m7YZvO11l4b2larSMo+9ifXQ3DmY8ae2rAoDPZhxNfZQUqaT8TBcT/yATH9HJmnbovfiKHbth4DHtJVGvORGYs8t8Cv3vn52jnq32Q2E2eouuqhPzbamcvdBlwp4Q0965GJvWQQLGNFIP9xTimnk8nHe52s8h68Bbx5AWGOUuf1A4PqnPlgCg2BjiHN8k9SPHBrLK0bhDahixW1blCHmg4wW8GriPI25RYpzxiIsqrdPdo84vpdwcaLhenE4VCe0s+N8rCbLpYJXDRMBZbkaZvvGAJ8AXDUEMtH33EEKuRw8MjrdDenBXfpfSj+NOPqq2JENIlTmSc3FV4tipc/MHLcr1GhXYYcARx1YysLveYUumEV5HB3tuUzntSWSyrfhgGkpirnEKcNP2rzYXOfpx6QRC7zWt5QO0ryVJ8AbVEd3ovpfWlnWzl6XYc6T3TmIEJPSswBRLCZowlAotB/mkwxrI2YPII/8KLF1wl1I7hePQGyI9fUIK4ewlJxi4/pP0Xp9JieUNdGDbKzH7sugokGMU6ePcFsrcLy06KbpLDNA1enedNCMceth5AzxWZCKTahS+mH7ytS6acBHZmC5KHt/4OcPV8iygo+dwDgxYkfXLSU0JzA9fOTqj4q8ImxbeOgkRsj9Vw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(186003)(2616005)(8676002)(4326008)(26005)(66556008)(66946007)(6512007)(2906002)(6486002)(508600001)(6506007)(31686004)(8936002)(6916009)(31696002)(86362001)(5660300002)(83380400001)(36756003)(316002)(38100700002)(54906003)(70780200001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnlSeVhyVTd4enE5a0VKbFlqa0xMcXdvMThYeFpOYnhMaGZzZkJXcjBteTV0?=
 =?utf-8?B?Z1VnVHFQbDhXUUdRTmd3N3RrZDBrNndDOHpXUFUxTWhUcjNDRkNWNVFENXBZ?=
 =?utf-8?B?OG51V0RTV2piSS9JZ0Ixa3V4djJFOGpCZUlOZlVzNElOOTNPY0JIVTh6N2Va?=
 =?utf-8?B?WTZER0R1b1loZzF5S2VBVFo5Y1Q5bXBBV0d5cXpyMTAxQUM2SjcrZGFZRjlx?=
 =?utf-8?B?YXJjVEVGNzdFYTlVUk15ZWdaMGJpNG94emlGKzBlZk4yNCtGQWZvcE9FT05W?=
 =?utf-8?B?citScGFwZ2RmalRCSm1vTFllNE5TY2NRcDh3NUg2RkdCZ0VvOUU4VFVPckl4?=
 =?utf-8?B?RFo0S3h2VWQwZTZqbUV4d0wzbXI5dHMvbmMvbzdmME9tWERkMTlZUVpSaGI0?=
 =?utf-8?B?VHdRbUdma2hHZXRWMzVNVUI4OXJzUjRBUzBBUHBQc3o5VmRGVWE2NXM4QTRW?=
 =?utf-8?B?aUZpbURWYndSZE4rY2Yyb1lnM1RPMFpqMytodmx2eG1qUjBBUFNmYzBxazY5?=
 =?utf-8?B?UHVwaU9CVEVFamllUkF0UXN6eTFDMnFSTkJ6Y05vMldBSHRSRHZyV2ZUNGNt?=
 =?utf-8?B?bWRTRkVZMFNNMnRuQk5tcWJHczJrWWFoSTF1S3U4MGlyRDNjdHhNMTkvYzk2?=
 =?utf-8?B?MC9sZk56dTFzOHdNTGJCWkJzZXpGbUtsa3lKMmpEUXVrdjVobktEVmY2Ynov?=
 =?utf-8?B?S3ptY3ZWQkRIVlhaR1NDeXpOOUYzQ0tXUDlERzQ2SGNFNkRPTnBTMk1aazBW?=
 =?utf-8?B?L2haZTdIak9MbDhncktMM3dxSXVsZDJpYWRld1dQUk5KK05DQkVxSEpSZEVr?=
 =?utf-8?B?R29sMFZxcjB1bE1JL0FMVWJDRllQTlZTSWw1dVdad2FPOElZbkpTK2xhcEw0?=
 =?utf-8?B?c1htL1V0NFgxTUJvUmsrSnVkMjMrcURoZk9OWGRvWU5qd2JPMkRtWlBubFlW?=
 =?utf-8?B?V1FGdTRIcnlQODgwanY0eTAzVWp2MjM5TDhVL3hoYkJJM09DNDFhKzU2UXkv?=
 =?utf-8?B?c25yUGdjL0k2U3R4NVc2NDNSQWNCQWlCbFJoOFUwSENrMmFrbkpIWnUveWw3?=
 =?utf-8?B?WDRMOWxwNld3RHVockN1b251WVAzZk5qdWlUZnhXZlRwdGhqbFNDZEppZmE1?=
 =?utf-8?B?Uy9jbFR3MnBNWnBxZVlwSnEycCt0MmJkbVNmaWxXd3JabENHVmdYczJYTXZR?=
 =?utf-8?B?ZkNQNUJzMVh6UGtxVEdYL3dnblZYMlZmdXZDQUZyK2tQRG0yTTI5VHBBTElR?=
 =?utf-8?B?SE9SUjcvVGhDRGo4a3UzemtRZ2ZPa0RzUi84M29FZ1QyTVUxeGJJamN5OFhJ?=
 =?utf-8?B?OTVmZytuWXRFN2FDZm9pWURCSkZZQ1dPdEYreVV2TWRML3NqSVdSQ0lIR0h5?=
 =?utf-8?B?N3IrZEt0UElERldBeDRSUTVQaDRUWXdRa0hhU3FKV2kwenpmVmFaUTFsL0xW?=
 =?utf-8?B?cDlBaE1Bd0E0c0hVY2JJUjYrNmxxd3UwR1dOVi80cm5KNGt2V1FvRFc5bWZT?=
 =?utf-8?B?UUFDT1BRdkxMM2dRT2p2dXhsU3g5TzJRKzJNMHdyOHVkeGNSRDA5dC9YR2JP?=
 =?utf-8?B?c0J3OEFHMGlEOHRqRHd0RVpwRTM1WkszVisxSUlxb29ocjhheGJ3ZEExSncr?=
 =?utf-8?B?cW9GcmlUUGhNWSsxa3ZoQSsxRWlGenRYVHAxOVV6aHBjS3BJVlpaTFZlbnUw?=
 =?utf-8?B?OGJYOUxOaEU2RjBhWVlvU3UwVU54dzRTY3VrVlU3TjlYN29ETEJsVWFhRU5v?=
 =?utf-8?B?L1hLRkRxUnJ4ODA1dmRCUE9jUmp3Rzh2WEs5M0xOSWJiUUljb1E1QnZnVmR5?=
 =?utf-8?B?SXJEVlBPQWgrL0o3bkxlREF2UFJYK25DbzQrYUhMLzlKMUpsVWl6a2tQem92?=
 =?utf-8?B?b3doaE9XNzMzNkc4cHBodHFKaEc0bGtSazdKTGduUDdYbXJRZGNRMWJYaUxU?=
 =?utf-8?B?VHpWN0srcmpLaW1VblRLTEVZRnhnSDFnQ1NwUEVoYUlaRG9Pc0RBUTZubXNw?=
 =?utf-8?B?MnRITkxzVldmVFFHYkZzbHhDY3MvTGdocEtKbE0rVVBEdHcyZjRreXNSV0ZK?=
 =?utf-8?B?Zjh2VUdpT08wb0xISmpDS3lWd0E1T0dCelVlenJFUWxNNkxLSi9EbXNEKysv?=
 =?utf-8?B?cXdOMlF6bzY2QjltYUhTVThGU2UyY1NmS090a3FUckw3UElOR0VmdE13NDdY?=
 =?utf-8?Q?F5TEc9PEWV5NpXoOpxWQKkQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74362b95-35ae-40e6-5e4f-08d9f6e5822b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 15:59:44.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb30VvWdbv7CEnZjD0OY3IzCl/JfeLaFI26VUJc7Mrg/7YCmGHTIHD9zAsI3ekiM5ul35AWIK1F5vEvKDBj3oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7277

..., moving the former into the new physmap.c. Also call the new
functions directly from arch_iommu_hwdom_init() and
vpci_make_msix_hole(), as the PV/HVM split is explicit there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@ctirix.com>
---
v2: Change arch_iommu_hwdom_init() and vpci_make_msix_hole().

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1473,12 +1473,9 @@ static int clear_mmio_p2m_entry(struct d
     return rc;
 }
 
-#endif /* CONFIG_HVM */
-
-int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag)
 {
-#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
@@ -1488,13 +1485,8 @@ int set_identity_p2m_entry(struct domain
 
     if ( !paging_mode_translate(d) )
     {
-#endif
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
-                                1ul << PAGE_ORDER_4K,
-                                p2m_access_to_iommu_flags(p2ma));
-#ifdef CONFIG_HVM
+        ASSERT_UNREACHABLE();
+        return -EPERM;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1520,12 +1512,10 @@ int set_identity_p2m_entry(struct domain
 
     gfn_unlock(p2m, gfn, 0);
     return ret;
-#endif
 }
 
-int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn_l)
 {
-#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
@@ -1535,11 +1525,8 @@ int clear_identity_p2m_entry(struct doma
 
     if ( !paging_mode_translate(d) )
     {
-#endif
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
-#ifdef CONFIG_HVM
+        ASSERT_UNREACHABLE();
+        return -EPERM;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1561,7 +1548,6 @@ int clear_identity_p2m_entry(struct doma
     }
 
     return ret;
-#endif
 }
 
 #ifdef CONFIG_MEM_SHARING
@@ -1606,8 +1592,6 @@ int set_shared_p2m_entry(struct domain *
 
 #endif /* CONFIG_MEM_SHARING */
 
-#ifdef CONFIG_HVM
-
 static struct p2m_domain *
 p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
 {
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -21,6 +21,7 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/iommu.h>
 #include <asm/p2m.h>
 
 #include "mm-locks.h"
@@ -75,6 +76,33 @@ guest_physmap_remove_page(struct domain
     return p2m_remove_page(d, gfn, mfn, page_order);
 }
 
+int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
+                           p2m_access_t p2ma, unsigned int flag)
+{
+    if ( !paging_mode_translate(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return 0;
+        return iommu_legacy_map(d, _dfn(gfn), _mfn(gfn),
+                                1ul << PAGE_ORDER_4K,
+                                p2m_access_to_iommu_flags(p2ma));
+    }
+
+    return p2m_add_identity_entry(d, gfn, p2ma, flag);
+}
+
+int clear_identity_p2m_entry(struct domain *d, unsigned long gfn)
+{
+    if ( !paging_mode_translate(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return 0;
+        return iommu_legacy_unmap(d, _dfn(gfn), 1ul << PAGE_ORDER_4K);
+    }
+
+    return p2m_remove_identity_entry(d, gfn);
+}
+
 /*
  * Local variables:
  * mode: C
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -373,7 +373,7 @@ void __hwdom_init arch_iommu_hwdom_init(
         if ( !hwdom_iommu_map(d, pfn, max_pfn) )
             rc = 0;
         else if ( paging_mode_translate(d) )
-            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
+            rc = p2m_add_identity_entry(d, pfn, p2m_access_rw, 0);
         else
             rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
                            IOMMUF_readable | IOMMUF_writable, &flush_flags);
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -409,7 +409,7 @@ int vpci_make_msix_hole(const struct pci
             case p2m_mmio_direct:
                 if ( mfn_x(mfn) == start )
                 {
-                    clear_identity_p2m_entry(d, start);
+                    p2m_remove_identity_entry(d, start);
                     break;
                 }
                 /* fallthrough. */
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -637,6 +637,10 @@ int set_mmio_p2m_entry(struct domain *d,
 int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
                            p2m_access_t p2ma, unsigned int flag);
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn);
+/* HVM-only callers can use these directly: */
+int p2m_add_identity_entry(struct domain *d, unsigned long gfn,
+                           p2m_access_t p2ma, unsigned int flag);
+int p2m_remove_identity_entry(struct domain *d, unsigned long gfn);
 
 /* 
  * Populate-on-demand


