Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4B64B44C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 12:37:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460559.718491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53al-0003dy-Iq; Tue, 13 Dec 2022 11:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460559.718491; Tue, 13 Dec 2022 11:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p53al-0003b2-FY; Tue, 13 Dec 2022 11:36:59 +0000
Received: by outflank-mailman (input) for mailman id 460559;
 Tue, 13 Dec 2022 11:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F6Pn=4L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p53ak-0003Zb-CY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 11:36:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2054.outbound.protection.outlook.com [40.107.21.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb1a4143-7ad9-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 12:32:15 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7338.eurprd04.prod.outlook.com (2603:10a6:102:80::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Tue, 13 Dec
 2022 11:36:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 11:36:55 +0000
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
X-Inumbo-ID: cb1a4143-7ad9-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN4/pZmTQgWw1txxYV+1LbB33sHqWNIwsIblBjA55NZGUPEQnoYGKfpNwOuJwdKPtXJJTYf9lc/zv2Bhq2IJiziHvExkRL7HaOy2noyATpR2gVIGV+niCj8dzckT03WiaxdnvD4rTDmDeOTBXvpNkZoKmozG3tyUDroo+xGV7jXwk28BOKBVUfpuBQjwVFLG59WFrnVCOuF8u09DfOmlCrfwb0eJTOQ5+0oJltxCrPGvP6tONJkM00y1u3rbrTDCS4q1pZvh4sGnjhoy0itUQwkiwAQigxmBDsFkMQ1N/cf8M6rmuWNO+dTF9zd6fQwZ2jrZ8E4UKc/gt2Fr6pC4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI5yJpzzZtco6iDYZtvKt6sm4LVJzPtpRGFeBOoz680=;
 b=KjfyiTAk82DkBCrWwROjKYsgVUI5sUvr0ZR6t4FONez6HHAMheFVBKVOcy8ScADPWTRJ1/GNK/jCBrF/0ZnKwYlzJwF9huCVMSELIs7MyNZjorXAzTBWxDYUFWtA/Xo7CgT0aIIWCUqStdud5oNkzEsj7uvs+ZyspyMBnDe2aKXoNXT3hexYt+N/yH5bmKH7GJ/mQKFc0NiVFqLTCwS32kjlR/kfo/4eNJndcwWpc2BjmtXpCOBm3LtiSwO0+lgur62KqzwUzkvTQkRuB3T1VA2qZOC/TXxQW5NYSb+v4FysqoZHglAV45BM4Ek7IbKb8mKx4eyXhXL6IvEt7+uhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI5yJpzzZtco6iDYZtvKt6sm4LVJzPtpRGFeBOoz680=;
 b=bkEEYaYgSJTXLNsIqGj6g/db+KhPCmHmKJGWMsueOwFN6HEzUxmO/vOXa9cYbsmcV2F5Jzsl4qvfZM64dpvuCGVuzwJg73dKJcsHXsuceZoY9EdmcxYvxIZHaZwywDE3IvR2UZTJ/awgykfvYEeQeviuWiZOJXuecqUjynwLv8FuW/i3q7Gq1NRv4YnjAGcLwdQGWkOIyjDc8d6DyeyaXvgpXuYYNPcgLJoZ9/pYRXq4y4xxoUD6KjKB42hmgGdy2omNtuzSySIuUrnhHGO4diQkTAUaup6gZNXFd0tR6WAPTA5SOHk1rW0yweJHZS7uEEZwVB9NNfc4E0S4dsLiLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d503a684-1689-ef60-23e8-5eb6b33ab5c8@suse.com>
Date: Tue, 13 Dec 2022 12:36:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 1/2] x86/mm: avoid phys_to_nid() calls for invalid addresses
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
In-Reply-To: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7ce60c-faca-4cae-28fc-08dadcfe564f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m3Sjf1HhILvpZMt6A0mEKHw4jP9Daq19apmaCvmO/ngfvnBm8bQvm1Jmv6xJiAgEMfnwW9a36ZNFJhdd0zZK+EkLyKQbsqOOEC89Rl4QEurl2qCBykcV97JXGzvddgjojBZdGbDmDgcV5HQ5UMEy8vCp30M4pl9fp1M4nTMNpN5aIiL0O7nC2Gz2b+9HF4ZIhACwZnoKk8XtzGk6VNllM0JXwEfK0lpE1DLl0pV7VdxLMgASsfKFxlAfpTcAIebDHKzOlqwwQ8Grtd2IrZjWQzfhxLEpFlc5t/f0sFwG4U4dUC1BWi5W7sDLeirBay00To5ZTsDPSEj36LPhG+cROA09Ga+h7q3uIhkSi7oM+gAIJetpo5WS4SohBi+5eY8BGA+LdYrSyjYZ9xBUUFEL0j2db6mcFwaAiPZTjhRb5a5Zaw+znX9I8zyFvlphWhHjV59jxma2s09LfXIQzU9ZsumtUGlE/8KPt0IwFbQ64Ta3Bb6d2ZQwPV91+zypiylJMTZvBAIXU+CQnpSC1cRZprFoilaHssbRgOwilgOXvcTo9TJA3NihE9arEk/vQ7ZhBUFXguzr9zcwvgWE+vYDoomfmKqH4W8GfDtrYlrX7GM3HKlVtx7oxc7v1XfBD+ic936FieyfS3w0dx/cba8i+JPLRoHnushM2Fe4Ir6/2smFN8XrNvQ2D1TTlDvyfPYsjmydFnhFARRDK/r40gBdicu582GJloInQ1gYBZXIcFo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(38100700002)(83380400001)(31696002)(86362001)(8676002)(66946007)(66556008)(41300700001)(66476007)(54906003)(6916009)(316002)(4326008)(2906002)(8936002)(5660300002)(26005)(6512007)(186003)(2616005)(478600001)(6486002)(6506007)(31686004)(66899015)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRWRDhCSE8zcXBRcUNCZS9IcXVNc0c3S3FyR3RHZWNsYldxTVdrcjUxd0Qw?=
 =?utf-8?B?Zzdta1Y5RUdCeHloZFpVNTNlKzdJVWxZRHpwSkU0c1Fvdk80L1JCbjBkYWRL?=
 =?utf-8?B?aFpFeDcwUG9hWkgxc1AycllPN0MxeUdocmFBVUhLdlN3VDNuYUZsTHUyRXJQ?=
 =?utf-8?B?N0JnS1ZXSHVtdm1qK0o4bDFJWUZaM0pFUUxvT2x2V1hINTljUkJyME9uLzBu?=
 =?utf-8?B?ak9HbDdXRitnM0lRejFnYW9JVkp6QzlubGpaYUM2TFUxcUdiZjNqYVNJNWhW?=
 =?utf-8?B?bDFqRkw2RERWcnhyWGMxT0YrdDJuakhSZnhhVS8zbEU3Z3RRcUpydzFRZ2NE?=
 =?utf-8?B?aE5OUjE3bEFkM1BTOFJJVHNkMkozR0FOaDBtdWZVNlFab3hKU3NDR29ha1k5?=
 =?utf-8?B?Vk9wdG9SSklCYitQRjc0VDVBUDhOMUtQVTREU0NKd3BoZjBYNXhLYTlXWVlv?=
 =?utf-8?B?MTZ5K1pMZGdMQmlhSVhZVjhDbWhhbkJsaE15eGUwY0R5SzB1amhSN1VLUGgy?=
 =?utf-8?B?bWJSd0M1RVd4ZGtyekhhZ1NITHJIZzREME9oNjYza0l4emJJU3ZsMmExOFVl?=
 =?utf-8?B?YzBZenRIZEhpT1B6QmdVSmNDS29kUHNiR3prVjRLb213Q1pWTUEyTFYzWWMy?=
 =?utf-8?B?UHE5eStKZ1pVdEkzVTl2WU1nVVVRTkRtaXQ0THd6anFETjBqMmtEU2xQKzRj?=
 =?utf-8?B?NUJMMHZLOTdmSXQ5UnZlZVJkNUpvcTB1S2JYT09nb0Q5SHdBZ0lQOE1zY2c2?=
 =?utf-8?B?TlJtM3NSUmkwVkZwT3BlNDNKcHdoaGxySS82S0JFQTY0YjVna1h0b2FvVEsx?=
 =?utf-8?B?WFhTUUVmeEg0V3ZLeWp1NEtXLzhUN3BDTm53RGp0K3ZaSUJmejJZRFB5MDdB?=
 =?utf-8?B?UGl3dFArczNNRmpXKzdxaUxGSWIwWEs0Qm5vKzR3bE01L3hGcEhTbm43ZHZY?=
 =?utf-8?B?ckQreW02T1Q3V04rTXQwd3V5KzV2bTNqeHFncWJvTlNaZ1daK1NibldvZE1j?=
 =?utf-8?B?a3JnRStIUkhWeDBPVzVVS2dzSzdCY3U3RUhqenZaMDFFcjRHMDNLdS9WNHh2?=
 =?utf-8?B?dUV5Z3RWeWxTZE9RTGZnTW5FZ3UvUVE3T0I2MmJBZWpscHA2eXZpVXFqd3A1?=
 =?utf-8?B?cVFYWVl5SloydUdPS1k3cmNvTmE4RGJVYmFTaDNOVHJSYlFOS09YcmNaL0Rx?=
 =?utf-8?B?SURYRCszMTZvMzNhb0tKQ2oxK3FGOVpWaHhHL015UzhDM1o2clhrdGdaWERR?=
 =?utf-8?B?ZVJjdFp3QVJwYzBrKzJZNklzbHcwWDZkcFhPSHVTR1BiQ1cwTFBxNkFtSnR3?=
 =?utf-8?B?ZkpraDFpS2xMZzhsTDZZV0UrVlY0TXVya04wUE9STXlDN2VZa1U1aW56Nzhq?=
 =?utf-8?B?alExRVR1WHI5a3U3OElWZUhzdlJNRW42ZGcySTBXVGJUQW44Y0U4QWc5aXR6?=
 =?utf-8?B?L3FxV1czdU45TXVvNzJ5Q2VtYnZVcnR2cWtrUnZPQ1AycDBOc1VxS2dkOFZT?=
 =?utf-8?B?SnR5VmFiRUc4K1U4MVBNWmpuSTNidW81NzRCc3NuaEYxZkdjNHdJQnlhZEZI?=
 =?utf-8?B?ZW1CYzVSNWkxbmVpZ1dseFFlUVhHVkEzSmNHaGNvMDB1NjFJRXovMnJ6Q1Rx?=
 =?utf-8?B?QnRJWWhERFYxcFUvZVR2S09mMGZVa0xoZ0x3RXRISC9rcFZTYUI2amJjT2Vn?=
 =?utf-8?B?RWIwQWZZVXhOcldKZzYyMjJqRXlCR3lyeUpzVHBWR0hPTEtPN2xrVHVjdTRX?=
 =?utf-8?B?cTY5VnpXUWVFeGRhYmdvM1Q0MkUvSW9YQ0pzc3VHdUt1bTZVUWR6SlV0emto?=
 =?utf-8?B?eVRkWmhyTUlGYy9KdGZkZzBIU3lyN1AzU25LWW5sM3IxOTMzZmIxRk5QSjdM?=
 =?utf-8?B?bE45Szl0U1pnbUxYajB0a1B4R3FXdU9kUkdNT2JpbWdNRHY4cmVYc24wZzl4?=
 =?utf-8?B?NklId3kyMWtldHk5QmpxdHBPdktFRjROczdIN244YThzQ3VrQ2ZxYU9NLzZy?=
 =?utf-8?B?SmFXS0hWNEgwQ3ptWFNtQ1VTbERjbUg3cU5sOHZQMENtTWI3RUxUZW5KL1NT?=
 =?utf-8?B?dGROK1lRRjhEcUFOS3lNeHVoamwzZGdYTndiY0ZvMmN5d0svZHlMb0ppUkh5?=
 =?utf-8?Q?mLN6Ixaw03gkbgwsui8+D7JRV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7ce60c-faca-4cae-28fc-08dadcfe564f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 11:36:55.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofVMM9FV7JGgDo3i+iSk+XDQnprzSOAfTqmhBhmxTsbtcjGU+KaUfp2jSpjfjoxzsmGrcqeUi147fxfYHSmUnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7338

With phys_to_nid() now actively checking that a valid node ID is on
record, the two uses in paging_init() can actually trigger at least the
2nd of the assertions there. They're used to calculate allocation flags,
but the calculated flags wouldn't be used when dealing with an invalid
(unpopulated) address range. Defer the calculations such that they can
be done with a validated MFN in hands. This also does away with the
artificial calculations of an address to pass to phys_to_nid().

Note that while the variable is provably written before use, at least
some compiler versions can't actually verify that. Hence the variable
also needs to gain a (dead) initializer.

Fixes: e9c72d524fbd ("xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON for phys_to_nid")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: With small enough a NUMA hash shift it would still be possible to
     hit an SRAT hole, despite mfn_valid() passing. Hence, like was the
     original plan, it may still be necessary to relax the checking in
     phys_to_nid() (or its designated replacements). At which point the
     value of this change here would shrink to merely reducing the
     chance of unintentionally doing NUMA_NO_NODE allocations.

--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -498,7 +498,7 @@ error:
 void __init paging_init(void)
 {
     unsigned long i, mpt_size, va;
-    unsigned int n, memflags;
+    unsigned int n, memflags = 0;
     l3_pgentry_t *l3_ro_mpt;
     l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
     struct page_info *l1_pg;
@@ -547,8 +547,6 @@ void __init paging_init(void)
     {
         BUILD_BUG_ON(RO_MPT_VIRT_START & ((1UL << L3_PAGETABLE_SHIFT) - 1));
         va = RO_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT);
-        memflags = MEMF_node(phys_to_nid(i <<
-            (L2_PAGETABLE_SHIFT - 3 + PAGE_SHIFT)));
 
         if ( cpu_has_page1gb &&
              !((unsigned long)pl2e & ~PAGE_MASK) &&
@@ -559,10 +557,15 @@ void __init paging_init(void)
             for ( holes = k = 0; k < 1 << PAGETABLE_ORDER; ++k)
             {
                 for ( n = 0; n < CNT; ++n)
-                    if ( mfn_valid(_mfn(MFN(i + k) + n * PDX_GROUP_COUNT)) )
+                {
+                    mfn = _mfn(MFN(i + k) + n * PDX_GROUP_COUNT);
+                    if ( mfn_valid(mfn) )
                         break;
+                }
                 if ( n == CNT )
                     ++holes;
+                else if ( k == holes )
+                    memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
             }
             if ( k == holes )
             {
@@ -593,8 +596,14 @@ void __init paging_init(void)
         }
 
         for ( n = 0; n < CNT; ++n)
-            if ( mfn_valid(_mfn(MFN(i) + n * PDX_GROUP_COUNT)) )
+        {
+            mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
+            if ( mfn_valid(mfn) )
+            {
+                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
                 break;
+            }
+        }
         if ( n == CNT )
             l1_pg = NULL;
         else if ( (l1_pg = alloc_domheap_pages(NULL, PAGETABLE_ORDER,
@@ -663,15 +672,19 @@ void __init paging_init(void)
                  sizeof(*compat_machine_to_phys_mapping));
     for ( i = 0; i < (mpt_size >> L2_PAGETABLE_SHIFT); i++, pl2e++ )
     {
-        memflags = MEMF_node(phys_to_nid(i <<
-            (L2_PAGETABLE_SHIFT - 2 + PAGE_SHIFT)));
         for ( n = 0; n < CNT; ++n)
-            if ( mfn_valid(_mfn(MFN(i) + n * PDX_GROUP_COUNT)) )
+        {
+            mfn = _mfn(MFN(i) + n * PDX_GROUP_COUNT);
+            if ( mfn_valid(mfn) )
+            {
+                memflags = MEMF_node(phys_to_nid(mfn_to_maddr(mfn)));
                 break;
+            }
+        }
         if ( n == CNT )
             continue;
         if ( (l1_pg = alloc_domheap_pages(NULL, PAGETABLE_ORDER,
-                                               memflags)) == NULL )
+                                          memflags)) == NULL )
             goto nomem;
         map_pages_to_xen(
             RDWR_COMPAT_MPT_VIRT_START + (i << L2_PAGETABLE_SHIFT),


