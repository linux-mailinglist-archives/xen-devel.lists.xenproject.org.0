Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F36489D87
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 17:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255426.437695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xWs-0006VH-8b; Mon, 10 Jan 2022 16:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255426.437695; Mon, 10 Jan 2022 16:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6xWs-0006Se-5E; Mon, 10 Jan 2022 16:28:18 +0000
Received: by outflank-mailman (input) for mailman id 255426;
 Mon, 10 Jan 2022 16:28:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6xWq-0005qR-JR
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 16:28:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fd8d5e3-7232-11ec-9ce5-af14b9085ebd;
 Mon, 10 Jan 2022 17:28:15 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-73I9e9TXPbOAhgOZrlGPRA-1; Mon, 10 Jan 2022 17:28:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 16:28:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 16:28:13 +0000
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
X-Inumbo-ID: 4fd8d5e3-7232-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641832095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qB6MbDDkCONYgo9EX6LU19rDEi9Bdn4h06LKMktQeMs=;
	b=IYp9+8y4/cTbUcv9tH2JKXvkVrZqBTbCSZOlzQNd9RrlgqWLSZkJFBb6rv9aNYd8xvBD44
	AqlkVfhycXMaHnZYWLkV4rBqAVAuglWQrfwyyznrVyeM6XaB9GkQdqzZawWzNJmCYsUuml
	5opeS12Iwf19sgbBkryETND9L+hwMeA=
X-MC-Unique: 73I9e9TXPbOAhgOZrlGPRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip72PSS7ZW8/RG1+ea1+8VRHcBpuTZzhb56K3AM0OMptOAGhMvnx3KpdOKpHMhk20hf+C4HymV4I+yWvZ5yBmQvUemG0kRumruwVMC3DasZq5NeZxOXlpn52Uyh3f1A7VzG29yTIi+0cLRUM7Z7AFQPPiORbACvaK6ojpkZB9ODTq3m4+rb3JrgADwiaW5zqk7CBExSHikZWjPm/jVYkwVO/NqI0C6dhhYdRsBApPQ5FOgy8DyOYYeI5YES6VZW/WcKxoZCXNQc7YU0LjhVe/4aGuABFAzyeCIAFHAazZb4WEKRBzmtj7zwHrjTdKTXMGJuJ+ZAtDdtNsBCYuza9Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB6MbDDkCONYgo9EX6LU19rDEi9Bdn4h06LKMktQeMs=;
 b=FNwHQbQIZ4ikLLERbTqCOH1CtQWpg8bd9oJjaUF24qoobhlmK7p/zmEkZrnMCBCdRcKe9fvF76Wc/SgSpMosUf/mdmB+jfE/Tbendri2frWnuHTy3VidBnUnV1tCkHSqwuGbq7CEHpOhBwbWNz4Lu0mc+e0eGNFUBbOKZy/SyBCn8MjnWw6txPOBqleScnJ8uDI4Mj2cV5n2HwkI+8zATb2KjnWZf59Sk11x0ZEFt8ShcO+CYml/T/Nn/U2/kopLS3Lox7w2thRnbGAfo/boxVRjMHBFhzPffSos2vPRPX+aBqxWYl938mmzjK/qQSk8x+/aaZyKZ5ozviUim6xNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <813a9e33-943d-a3d2-7aa6-a01b3611c095@suse.com>
Date: Mon, 10 Jan 2022 17:28:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: [PATCH v3 08/23] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
In-Reply-To: <76cb9f26-e316-98a2-b1ba-e51e3d20f335@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa4524b2-0f8e-4569-1d24-08d9d45632c0
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244675AE149785CE889898E1B3509@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SsLuFbklBcN+pIfs5se/jVHQSiYZO1ymxyQQlbeMCmCaS76lHcoUFqd6I7T4EwojLpN48rjTRWwjjHZgYnPqfoFG83F06UEmggf/kEJIAkrsuanGI2aKrgG/dsQduCl/Ez8LMc0S4rMkSOanHz5Q49Ohzd1+4AZlp8DdE7eZ9UjUkFNN9wozZRi5gDxyztx0aKx+6sEoOxF2ewOVp4d4KodTvFpSuoDtf6QC34ZUScAPXoK01pn8/opqO8MeVO9xhYauo7rMhrHFo/SffGZMJg2byB2apgPZiN7dnrEv4Y66AOYqutZgK5vBqoSNk//5hXjsFZfJ2mSo6GbA0vqIbZmMVOZjS8frTD5D7ZWVoCi7NO5yDpPMgZJLGnZszsQ3LS+trhZuHoR1hXNmVM2IXmGqKqFegLxDxMGp8UdFcRTEBw9QVqvkzU27VtTlMa9VA9bSh2dKpxIpuGZucctWeWq2rTJ+0ta/bw4UvBe0XsxRxqVWeXOSVygtuoWrAntsw3ja6P4LVeNwm73dQMQ3PhALIdTIdkD12JFZoxV3ZsApzcD1/ZsrQMabCILeOU/TCSKxmYn+G20cedxm5arHrF0GyS2Di6cgMy97gpbD8XdCcY62kkbKwRJLehNZfcMonNqwdcfo9e/lc6Dr2aa2fzIDTLtUWAZUBxu5DZUrHFnNH0nV5xyOt06aoc1EcfQoLaza+PtEolxcVbKJ4gojG/C4DQz+59PKN/GxYke+eao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(2906002)(66556008)(6916009)(66476007)(66946007)(316002)(6506007)(8936002)(186003)(38100700002)(31696002)(6512007)(26005)(31686004)(54906003)(508600001)(4326008)(2616005)(83380400001)(86362001)(5660300002)(8676002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alpnMjRRZjVDRzAwOWo1dHBwSFlCTDJHdVFLM1JMb2VHMFBIM0RRUTREUzNG?=
 =?utf-8?B?UnRGM0tHU1ZVUEQzWlYxTnZ2SitFV0RmOTEwRldCNC9FZUVCS3QxN1QyT0o3?=
 =?utf-8?B?b29saWhqaUJSUllyR3RQNFFOdVVhY3lNUFhPT3crdXB4MmdXQzRxclYzNWl3?=
 =?utf-8?B?dkh6dm1LYllRQlU4SnlsbUZJTTBoODhGNDA3LzRsSmt4aUV6RXpYKytTbjlS?=
 =?utf-8?B?WkR2cWdON05JSzdnRmlXOGRaK1FnN3ZyZUJEamVUcjF3YlU2bklpeUdSY2cz?=
 =?utf-8?B?R21Qcy9aRUJtdnRNQVUzUFRHVkxwK1p6NTgvVnk0NnBrWHVyNWdJWVNNSmdP?=
 =?utf-8?B?L3ljeWtuakg4cnQ0NG5kMU5xaXVVb3FjWWJYWHRsclBBVFJzRDNHaWNTajlF?=
 =?utf-8?B?ZHZ2cnZ6QUEvUTNOMng2WWN3T2xWWCtsaUlEQ0x6ZHpORGYyQjkxTmNodG92?=
 =?utf-8?B?UTdXRUUzNFE2eFVaeElrMUwvZExXaHlidWNmZHlrTWJsZTBxNFE1clY1cEFk?=
 =?utf-8?B?UWpRMHVKTE1ERVliTitvVlhKUk9mV2Jjby9Qemh1enFrWVdvc2JmMHZ4V3c1?=
 =?utf-8?B?amRUeDViWlc3U1lkeU9kMmFkc1Vrby9Vems1WFZCejluWU9kdEZTeE5mallF?=
 =?utf-8?B?UjJWK1ljYUw2dU9pN0tTaDAyUXFnaEtQN1paeHFySTRuaTdTbnlyT1pCeGxZ?=
 =?utf-8?B?WW9yQ1Zibm41aDBCRUxRNThkRlFHNERIL2txRVIxejVQODl1Y0orbG5sMjdB?=
 =?utf-8?B?TDZ3T29TSm1sbWFwZzdyYmNMV29uSWZPNi9TQW53QmZ5cVhCMGJUK2NYblR6?=
 =?utf-8?B?MzZxK1ZadFZkclVpanpyZXRrRDg4RWJRVEdhNjVWcmtkU2ExbnQ3bmZQNVVh?=
 =?utf-8?B?R202SnRyaTd4M2JQbW9RMThFYTNmUDFkT2JlenppSWdzRHUxMmE4aXBZZW93?=
 =?utf-8?B?ZmVuM1ZuUjVqamp5VCtGbksxbWY1NzUzeXNGQlBsSzE1eUF3T2tabjF5Rk9t?=
 =?utf-8?B?Q2tKZDgyd2NhaXVTV3JMcjZrSU8vY0lJdmZCZDdDNlRVK0tLVXl5OEdmNFBL?=
 =?utf-8?B?YW5UVUx3UEtTRnp1bHBmVGxGeGtpQlFTSWlYakoxWlJyZk52MUo3TkxmNnVv?=
 =?utf-8?B?SE5COUdkdnNSbVNBMS9ObndQQU5OMzkwSUlYcGIyMWErVVovUzd4NEhuODRR?=
 =?utf-8?B?SWZRdGx3clN0d1pDeXV0SWYvYlZWdEgzZjZmWFpNVVJIaUNESkExQ21UOGd6?=
 =?utf-8?B?dU1WL0R1ckdTUzdaeGVTUlJEckd1Q2w5blNoN1NTZk56T0ZDODdPQTJWUk85?=
 =?utf-8?B?Y3VWUFRYOVZVeXBnZzluVDhQTEx2dVdCMlNRbW9zYWw3dWpWRDB0ZFJNSGkv?=
 =?utf-8?B?Z3pqU0ErYW1HTktxcVRvQjVhVXFydUl4UnBqaldBelVzaVZFTWFpN3RXREJQ?=
 =?utf-8?B?dUx4R0pyb2crcGxVMmRaN1Q5d3FDSUcrL2ppV2J0aGpqMjMvV0pseWFNQStB?=
 =?utf-8?B?Q1hMYzk0Tzk4dmZ4NjlmbzA2QTNjVC8xc0NYbWZXY2ZlazIyelNSa2FMa09J?=
 =?utf-8?B?aEE4UzJJeEVxZjh5UjgzVmpneEJOZnhsanlOZkFMMHdXOGZ4VXBkb0tBMUN5?=
 =?utf-8?B?SytySGxwOGJKWXhmVTRUcERwQ2owUS9lQnBnR2ozMlRXV0VWR0xyZEM3L1la?=
 =?utf-8?B?RmJRdU8wdHZBVXZhc1B1bk5Td2I5VVRnZ0YyT2tWVWVjQTJCN1hZMkNjR1pC?=
 =?utf-8?B?L244b3hpZnpJU1BVVm9IRStCbXBoNVdvdkNTekhtYU9WeFFLMWVzTkpvVEhv?=
 =?utf-8?B?YXE4UmJxQnJsWUJhbk9mMms0ai82VHpmWmNpckR5Y1g2VytvWitUcjRveWhM?=
 =?utf-8?B?N2FWMDZ2bERoejNRUGpMcXhIcFpzRGZvOUluL2w5MkE2eUFZNnpNTUlJbTNp?=
 =?utf-8?B?ZUNUb0crQ0dJTXV6aGV0M3BEcEIydEdpWGQrcjZGdFJiU3JvVDVuTkFFNFNt?=
 =?utf-8?B?aW5wRVZKMGpVUXRxaitYNVRjU21xS0FGUEY0RkRJL0VBcWpLbGZhRDg0eGh0?=
 =?utf-8?B?MXp3NjZKVER5SjZsbGozdHJhYTVRKy9IN2tmVGpQK2x2YUpkOTRyZ3BTeXp1?=
 =?utf-8?B?RE8wQVR4L2J3Uk1CVThvTUp1aTlKbjd6dGxucWJteTRVVno2RG5iQXFEOG9S?=
 =?utf-8?Q?EZ5EPoX2e3l6RV5/KohyCjk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa4524b2-0f8e-4569-1d24-08d9d45632c0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:28:13.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRNcBs78n58PU4utrIGhhihMo15iVCiYJf2LSaXHEM5Dqk2kzQWwLWR6Stjf44lZlvE/FBv0Tadz4uhS94o6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

While already the case for PVH, there's no reason to treat PV
differently here, though of course the addresses get taken from another
source in this case. Except that, to match CPU side mappings, by default
we permit r/o ones. This then also means we now deal consistently with
IO-APICs whose MMIO is or is not covered by E820 reserved regions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
[integrated] v1: Integrate into series.
[standalone] v2: Keep IOMMU mappings in sync with CPU ones.

--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -274,12 +274,12 @@ void iommu_identity_map_teardown(struct
     }
 }
 
-static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                         unsigned long pfn,
-                                         unsigned long max_pfn)
+static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
+                                                 unsigned long pfn,
+                                                 unsigned long max_pfn)
 {
     mfn_t mfn = _mfn(pfn);
-    unsigned int i, type;
+    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
 
     /*
      * Set up 1:1 mapping for dom0. Default to include only conventional RAM
@@ -288,44 +288,60 @@ static bool __hwdom_init hwdom_iommu_map
      * that fall in unusable ranges for PV Dom0.
      */
     if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return false;
+        return 0;
 
     switch ( type = page_get_ram_type(mfn) )
     {
     case RAM_TYPE_UNUSABLE:
-        return false;
+        return 0;
 
     case RAM_TYPE_CONVENTIONAL:
         if ( iommu_hwdom_strict )
-            return false;
+            return 0;
         break;
 
     default:
         if ( type & RAM_TYPE_RESERVED )
         {
             if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
-                return false;
+                perms = 0;
         }
-        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
-            return false;
+        else if ( is_hvm_domain(d) )
+            return 0;
+        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
+            perms = 0;
     }
 
     /* Check that it doesn't overlap with the Interrupt Address Range. */
     if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return false;
+        return 0;
     /* ... or the IO-APIC */
-    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
-        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-            return false;
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
+                return 0;
+    }
+    else if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there, so it should also have such established for IOMMUs.
+         */
+        for ( i = 0; i < nr_ioapics; i++ )
+            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
+                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
+                       ? IOMMUF_readable : 0;
+    }
     /*
      * ... or the PCIe MCFG regions.
      * TODO: runtime added MMCFG regions are not checked to make sure they
      * don't overlap with already mapped regions, thus preventing trapping.
      */
     if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return false;
+        return 0;
 
-    return true;
+    return perms;
 }
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
@@ -367,15 +383,19 @@ void __hwdom_init arch_iommu_hwdom_init(
     for ( ; i < top; i++ )
     {
         unsigned long pfn = pdx_to_pfn(i);
+        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
         int rc;
 
-        if ( !hwdom_iommu_map(d, pfn, max_pfn) )
+        if ( !perms )
             rc = 0;
         else if ( paging_mode_translate(d) )
-            rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
+            rc = set_identity_p2m_entry(d, pfn,
+                                        perms & IOMMUF_writable ? p2m_access_rw
+                                                                : p2m_access_r,
+                                        0);
         else
             rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
-                           IOMMUF_readable | IOMMUF_writable, &flush_flags);
+                           perms, &flush_flags);
 
         if ( rc )
             printk(XENLOG_WARNING "%pd: identity %smapping of %lx failed: %d\n",


