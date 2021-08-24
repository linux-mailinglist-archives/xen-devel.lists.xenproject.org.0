Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE323F605D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 16:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171517.312989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXOa-0005W6-LZ; Tue, 24 Aug 2021 14:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171517.312989; Tue, 24 Aug 2021 14:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIXOa-0005U7-Hs; Tue, 24 Aug 2021 14:27:20 +0000
Received: by outflank-mailman (input) for mailman id 171517;
 Tue, 24 Aug 2021 14:27:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIXOY-0005TS-AF
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 14:27:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1bf81538-43f9-4e9c-a227-2471f8545398;
 Tue, 24 Aug 2021 14:27:17 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-9-v6lPtcefM5CDPuJcGu0F9g-1; Tue, 24 Aug 2021 16:27:15 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5586.eurprd04.prod.outlook.com (2603:10a6:208:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 14:27:13 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 14:27:13 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR07CA0104.eurprd07.prod.outlook.com (2603:10a6:207:7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.6 via Frontend Transport; Tue, 24 Aug 2021 14:27:13 +0000
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
X-Inumbo-ID: 1bf81538-43f9-4e9c-a227-2471f8545398
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629815236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekc106SeN5rQ4+mKbVywQpGio0tLIHNqkbPDTkhzXTA=;
	b=WnurmuG/rHc80zSPienleiKbu8WsHcALwZszMfGJ1pXDdJGXsQqnKWs0bZXC+6k+j6mMFD
	VHuBbx+IgNHzdElLPRw7woprQ/9UKaUDh9PXjW8jkww5+Uy53E5wrEIqx1MCTQxvFop5JQ
	6NOwkLAS43Uw9cXu/nwNdzWDx25utZk=
X-MC-Unique: v6lPtcefM5CDPuJcGu0F9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrm3e6A5wvAUsNu83p6gsmlp44wd9x7J22oJaT4Z91czIqCAqQbgKonA/e7eIfH9DHP1uu0QXrDkTWsyK42VftZ0/ssJIGtGKK317BMbfx1ka6OItm5187QU5OTQ81KO61b8tx8kXu/0UD0LmHv8M9t/97y8lZ5tUuoX8AHDSTGTimBIb1BYLh0llKvMTYGtFVIuU2Ps0Zk5o5KnUSaWv2f5Nn2/ZsQqyEIpYJj8Vd5UqlDVeXiW7IoOqcBK6B/hI8g1FIk6O0EqcD4TTrltYoah7Ggmh/atYxO6LekDSdHceahWVnrxf7RPwMpV6f9mm86ybNZ3iYCGHIE9/VvnNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekc106SeN5rQ4+mKbVywQpGio0tLIHNqkbPDTkhzXTA=;
 b=ZtuX8vqgWMuCVBdRDUtVigE0Gva21eFEEYDLPhK1ZDF1wbdtC4pDF0LgWr0t81oPejBMsZ+g6g3uGdI2ZzncUbKIc04IVn+dYN5WrkuXG4KiAeYTkYwLVwMB26m4aXIGrdTtgCLq/L27i/TNTutCWQDpYdFnLyguHmUXTCmGB73HOqU031+n3Th3vxxDG/caKzhUdMRGyNTFc5iMIXFwXxJ8oGQ9CX0TPpUDhLeukwXF2pTwNuYNRg2nFaNd36F05lupZ4sOgWI88STHaruVl2QcPH1s2SiLRyFrTMch+9II9yp1IUDvg7LuaNHflLK7xYK3tzgMp5E2TXJGmJg4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 16/17] VT-d: show permissions during page table walks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Message-ID: <d4619379-3557-05ac-236a-06a169479a4e@suse.com>
Date: Tue, 24 Aug 2021 16:27:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <d955d9a3-33f6-f228-d007-a844ed918168@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0104.eurprd07.prod.outlook.com
 (2603:10a6:207:7::14) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1db4cfe-8a33-4cc0-ad62-08d9670b443a
X-MS-TrafficTypeDiagnostic: AM0PR04MB5586:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB558613EEC3B6E62D97842822B3C59@AM0PR04MB5586.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vi4vuJzXxMxq26AOxxsXIwuoIy8VuFEZomq+bypJ4nvr2w0vdbObSNNMGdta9Vv8+iXjleZndJAkEkXH/OBuTTF0BnWF57tgn+q9Slw9B1nzz26SsD+VbTLrJKz29kRGZP6l6J2meQc8Tze4U6BDPuO0wW2pLLI0rJ/aBuUNdO+0wiSx3d6XUnju9BCt7WqaNu45gZk8k5/v8b8ULI/tf8lH9bPtxNt3V3IpF7uWQcmNPlvd5c7OMns+2mWwP4eOFcH2wT7f3Mwjr1MwERnmljI9j3N3S7uT+7c1n8BYMpt/gssa4e58iCU4Ax6v82PxffB1YI9nqRwIpCw+XRVogjig0DBaO7BbWw8t5cCKLovspMZk7TEjIPoQnpTRiQvAu20oLaTs6ZY1tHXu7eBlpdUwcUIGoiETbc/FPsuDd+QQYsKsRsF0lwHRG4skEvdj025Mne8UQ6Xiqdk+u2WsitfoY4KShCJmIJNnOJ/63DuAV5JiyXpCQRTJ6DAnfV9KMFHY8iLDCkVjnKVxwdEpcNTsCNXA0R7/3yj3iMDp7zRQ3nsYf6aBlTtGCh9s7/jc93GPTw1RsZZfCpUQW7kbRwvNr2cHWTHXbBpEpW9CbiqyDEssPYSZ4nUW8ActCzdPUTXvmy9qO8BSg9TebzSEha+HdzmmDu75RVh+qy37YcWJEdSLpDNiA/gNgNLRr6q3ueW2VoGmYfP6w+Kb8gQVpNqIxi1N2vE9tx7CwrIQLLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(6486002)(6916009)(478600001)(31696002)(956004)(4326008)(36756003)(2906002)(38100700002)(316002)(66946007)(26005)(8936002)(66476007)(66556008)(5660300002)(31686004)(16576012)(54906003)(8676002)(186003)(2616005)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2M4VlNwV0hzZ0FUSHNNa3UrSmZydnZwM24vbWk1QmJlRjdpbzlzVHc0Mlpi?=
 =?utf-8?B?UXpudmFBZ3JOeHBOc3dVeTN3TXJOcDRpUzRRTDJHZm1hTy9rUGxHb2VCLzRi?=
 =?utf-8?B?N3F6VzBrVFg5ekwzZGNMN3FRTVVXamwwai9VWnZWUTlNd0p6dUgrbGdFU0Vs?=
 =?utf-8?B?emVVZHlMa2RnYmRKREZ6OVEwVkdGTDNiYzhtUmtCUEFHWUxKYXRTMmpDZ2ZB?=
 =?utf-8?B?YmNJcisrZnNHQS84eEkrck9PRWZrUVVKalRNOTZjVFhLdHIrc2pkTUVjaVZ2?=
 =?utf-8?B?VlRhVGZIaXlQSHJPUTdCUWQ4T3h1UE1OSGhqM244cmJRNE5SQ2d3QnIwY1VG?=
 =?utf-8?B?QlVCQktLSGRMTzRjTGlBTVpCWXpmNGZSSlFpM254cDV3S2V6L0RRYWZwc25j?=
 =?utf-8?B?L21WY1JtRmdwZ1VFSHFQMDMvdEhxbVBxd1lMWnBxZ0tKTVlFWHBBeWFPejA4?=
 =?utf-8?B?cDQ4WWdZVFJOZnJaVWJrUjJFYjB6cnVjRHptYmFLN1kzeThBSUY4Y2svZVRi?=
 =?utf-8?B?Z3g0V1dCWkFSNUxXcERSb2dZL2g3RFlucFluZy9iZCtTWTEycTFBcG40Z1dZ?=
 =?utf-8?B?dmpUTUw4NVRiNUtaMUNSZ1BldWZ0MWxXbVQ3cTF2aithN1JNVHpmWFR6cWhu?=
 =?utf-8?B?M3pIV3RjM3FpODdROWhPZ1d3TlZtY3FTeUNBcFVSb1dpTFpPRjF6NDl5SVJX?=
 =?utf-8?B?SDFzVWxNU2FyRnBBbnE3aXVDUjJXUlFiQTkxVldRVVRHT3B3NWcxeVZDUmVj?=
 =?utf-8?B?RWxOejhOWHdOZ3dNV1NXWGJtSURPNklMdllDdWVyc2YycFdDNDFsamhrRGxR?=
 =?utf-8?B?QlFPMGt3VVNvaExYZ2pwWDQ2em5JTUdSY0xiTnJZejRJc2w2dXZuZVZjdkd4?=
 =?utf-8?B?MUkxc2s5dUw2bGljRGVTclEwcExEOGlaNmVPY2UvcittYjFsd1lDVW50Ry9G?=
 =?utf-8?B?YWxGRWE4aTEwNzIwWld2L1FSb09xN3hPYVlMUEQwMG9GajdUZnVHT0l3WWhy?=
 =?utf-8?B?Nm52d2FoakR3bitBM2JDRko5SDdXSnU5SXg0bEQ2YTJEWmNoMU1wSW9aWjlh?=
 =?utf-8?B?ZjZJeTNMeE9GQ1d3a1hCMUR6aG5zNmxLcHhtU3krSk5BcHJVQzFFdmdIQ2dQ?=
 =?utf-8?B?RVk5TExYbkxkbmp5STQ2NFIrZ1F5R1NDc2Z4ZXJJV2UzS21ZSHhhSlFVU3h3?=
 =?utf-8?B?THQxaFQ2eVRjYUlFeWJ2dk8vZTlDTm9ETzNJamF1ZDJ5N3hXZ1BaMTkwL2xo?=
 =?utf-8?B?bndUSDhpKzBsNTNLVHdydEc4YU5jbmlWelpZWFJFUjR4ODIvWlpTNGNRRUlM?=
 =?utf-8?B?bGh1MTZaSlUxR0RMY29KZGc3elN5MG9XS0NxRGFnRllFRXpqTUV5bzNVZlZK?=
 =?utf-8?B?bmx4T2lycTJ6Qm9YWWQ0R2RNOGJUUXZabVM3QmYvYk9SVEZFczRGTStMV0s2?=
 =?utf-8?B?NlVKb2loZk9jenVhRlM5Sk1DMUpnb3ZWY1h1b2E2SmxPa09CaE1WUlFzY1Fk?=
 =?utf-8?B?Rk1DRGNZRklaVGJBQlV2cVEra2h0RWtLMXpXTm5HOWdGMCtscTVBR1VCaUVI?=
 =?utf-8?B?NHVqT0xUVWZFY0RUbFNYZmplV29ZOHlqM0JXbktUZ0szcXg4UWlnbzdwSytj?=
 =?utf-8?B?MTA0c0pwME1sdEl2Vi9WVTN3SlNHOWVDRHA5M0ZqQ3pGWnROVW5lbFlUMC9G?=
 =?utf-8?B?VzRCZ1hZTlYzdVJEMnYvUy9EZnIvNTNTOGRtdGRYRDdidXFTZm5sRmpEaDdS?=
 =?utf-8?Q?tZ0GmXkIcf0G6a0zBwoeM/AeTznkkP3bto7fkA9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1db4cfe-8a33-4cc0-ad62-08d9670b443a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:27:13.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48UJ3ztd7+K5HHRdKcxqUamBc1p/uAMa4dxgpy3PxJiYil59IfbCZK30V2OWVngOKvQ4FIwR3uXyHekSa98Rbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586

Besides the addresses this is the next crucial bit of information one
might be after.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2822,10 +2822,12 @@ static void vtd_dump_page_table_level(pa
             vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
                                       address, indent + 1);
         else
-            printk("%*sdfn: %08lx mfn: %08lx\n",
+            printk("%*sdfn: %08lx mfn: %08lx %c%c\n",
                    indent, "",
                    (unsigned long)(address >> PAGE_SHIFT_4K),
-                   (unsigned long)(dma_pte_addr(*pte) >> PAGE_SHIFT_4K));
+                   (unsigned long)(dma_pte_addr(*pte) >> PAGE_SHIFT_4K),
+                   dma_pte_read(*pte) ? 'r' : '-',
+                   dma_pte_write(*pte) ? 'w' : '-');
     }
 
     unmap_vtd_domain_page(pt_vaddr);
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -159,14 +159,11 @@ void print_vtd_entries(struct vtd_iommu
         l_index = get_level_index(gmfn, level);
         pte.val = l[l_index];
         unmap_vtd_domain_page(l);
-        printk("    l%u[%03x] = %"PRIx64"\n", level, l_index, pte.val);
+        printk("    l%u[%03x] = %"PRIx64" %c%c\n", level, l_index, pte.val,
+               dma_pte_read(pte) ? 'r' : '-',
+               dma_pte_write(pte) ? 'w' : '-');
 
-        if ( !dma_pte_present(pte) )
-        {
-            printk("    l%u[%03x] not present\n", level, l_index);
-            break;
-        }
-        if ( dma_pte_superpage(pte) )
+        if ( !dma_pte_present(pte) || dma_pte_superpage(pte) )
             break;
         val = dma_pte_addr(pte);
     } while ( --level );


