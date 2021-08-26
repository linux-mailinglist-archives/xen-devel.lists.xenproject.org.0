Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA33F830B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172699.315136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jB-0006dA-T6; Thu, 26 Aug 2021 07:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172699.315136; Thu, 26 Aug 2021 07:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9jB-0006aY-Ow; Thu, 26 Aug 2021 07:23:09 +0000
Received: by outflank-mailman (input) for mailman id 172699;
 Thu, 26 Aug 2021 07:23:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9jA-0006aO-VF
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:23:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7541dbcc-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:23:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-2gyUMhObPEKumzLvq99ZGw-1; Thu, 26 Aug 2021 09:23:05 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 07:23:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:23:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.6 via Frontend Transport; Thu, 26 Aug 2021 07:23:03 +0000
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
X-Inumbo-ID: 7541dbcc-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF1wv1gdmsz5Xtdqg+XbsQZg1yCtv7jjQCf7Xzg5lVM=;
	b=JI+wYlRqNflAVAU/oGiiTYGyPhrf3v8VnfutBz1+5VDsG98ko/2ZwhnnNWq3oVZn3VLO90
	Fzdiwrv4I92yWRneNsZERCIM07zKeGw+H246U4d6qy7z2Tqwg74oUMezBhD8u0mbrvYGG7
	9BLI1DHWcpzErfFkKRh3ESCdTQ7GyRg=
X-MC-Unique: 2gyUMhObPEKumzLvq99ZGw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuWsx2RdGja91hF+qmMJ4/2Z5xLB1Zx8P0gP0IaLXgNJ8O4Sija4bsO3pISdJQpXFCG1YWdtnFsJUuZSRbOZPaizcIpEhCkiUhtLCHWDD0nzOZdwN+6vmIDXMPmTqYAp+kBCllC7YQllHF+OfzxfpqnvtNnWVz7HB/J4hONPJe4VdG4lh4IUHkRHnyK0PW7suNuA4uUikFLLZSoH8LdaEwTpsAQq/BI4qRV1V/3AU/CZrx9mRMIx4AuJXg0eHy2/WgdV5M5oco1/d5n20I5zkagUK8HxeQCVCd3TECyM7UwS49QTato+NZrMK/sdJKm5LEJsiUTlKCR+iutAMw1n1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF1wv1gdmsz5Xtdqg+XbsQZg1yCtv7jjQCf7Xzg5lVM=;
 b=cv3xNnaw5kPNFQEoq303t49hgqRiVhegNAipT/rIginw5CIk6l1qLHpHf/k/YZAth6QSY8iC0FwuPE1Rb5fHIR6bEUqY4Tlswo8L3oAYauoRNgYdy1i4WB1d8g8MoNF8Ag1RFPNrzcJZm6gvfBD9R/xTKuc7b/vPyA5uxfhQnA2/vx2YWKbomt8gU9I7sO7vugkLdQ2pfzXzp0CLUIghtKs3UaloUZrfQrxD3vZymoR5aHAVNUsBJbXyZq5AZAelF8HNvcAQSOUKwcK0t7wDgEiCZWbpCxSlqdxU+v8KjOgimS1dw7DDmDoZkv2U7gu5rgTVu8vuU2265DPnizfhWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 1/8] AMD/IOMMU: check / convert IVMD ranges for being / to
 be reserved
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <133d60ab-0de6-4831-7387-0ba9cf6efb5b@suse.com>
Date: Thu, 26 Aug 2021 09:23:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b808e0a0-e37c-4b65-8590-08d9686257c5
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304366D7FDD3CB9A46293C8B3C79@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a5h8J6r9SDjLTUSw0vugVlpRN+hL/UIlgyaIY4vLMkYe5bO1xFr/7yzQMQQI5eOvgNuyBa4k60CmSROoFygysF3/f0xYRfuqCPexVPg5Bzn+ACMo9o+o/sKmvmQp2uyAd2m7OAMKM2j+E3Hx6TUZEgzrC6DOM905xjU5Q3Rulpejada9kKds1Yf6K7KKMOg6O8y+v/Jlll2XaCRQgkXs25MvKJMClO3C3DtQzH8/tUnB8X8Jwq9D9JEVhSJRjOyBN4Ruv1SalQqh+vO7Wyrenzt8OKD5P376sklWLuDpsaPg6cw5xv6YQrZAZcTfN2/gTEt8KwcTY+5wVGny+XjE6K1OxgM9+LRnT2lgzfKqRtS7GrKyQqfnNHbtMicrQp7C0ZX4o5ocCDfOYaHBuURkqattqiskjZ7cZKLi6/6ungjh3miEx/EBmiTWmoCd0NgOeC0SiSIjQH9rqa6Ns8Bboa8p6aNiP2vR3lxhHClmE73qyi5ZSj6W8sIU3uPg6wJGkth6Yaja563xtfdZG3hMQ9ypqJMaYpGqp9fACvp42R8FiJzcxQXGcDp4isE3jkU6l5KKFIkh9PRy+HRJL4vtRXyFhX2UIxmZ6uxEmcI1EB/2j8YsSq9Mw0Y5wFy0u2Pt/3UhYgclAQhJqHnKimHtu7S3G3PW/+yJjbzu0T70pEMJ55W5QW/FXHGLs3+XwIXsdttbSH2di2SW0k9K3NwYhGUlfY6HWKGi/XphSI8CkpA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(186003)(36756003)(8936002)(956004)(6486002)(498600001)(66946007)(66476007)(66556008)(8676002)(6916009)(26005)(4326008)(86362001)(16576012)(38100700002)(31686004)(2616005)(83380400001)(31696002)(5660300002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHRYaE45Q1JQYjNDTFY2U1ArWGdsM25xOWVzc2pIcVQ2anZrSW8zQmFJTjRB?=
 =?utf-8?B?c3hpVXRja0trazNnMFBQYVA0cnpkTFVWbWlDYk9Wd2wrVkZYRmhwa1VwSnFR?=
 =?utf-8?B?TExLZ2g5TFNOcFBVV3FUUHJxbW1GL1NqcjBMT3pZYkNvamVUNGFYZnJ1Q20x?=
 =?utf-8?B?K2Z4djd5RGc0WHpBTnp6Y1E2cEo3bU8vaUR0U2VDTW11TzlsQ1pYWjVoTm1u?=
 =?utf-8?B?cTVreHpJSkYzRURleWFaYzVFOGt0NFZvK2w4UDhDR095ejRFbmxTWWp3TWlh?=
 =?utf-8?B?MmhJV1gwN2RXdmxYMmhRcVlxb2VENldEbk4vdnlNVTdoenJIMDE5QXNLY00z?=
 =?utf-8?B?UHllYW1aWUV0UGxmT3A1ZHdkQVRzQVdobWlBRHM2d3VrYzRMQi9QMWEwZjJM?=
 =?utf-8?B?c3VLQnlUNENoWVdPT0R6emJNNjl2eWtMMzRkOWo0REMrK1NwNS9wa1ZtQmJi?=
 =?utf-8?B?b0NVVHRTbm4wQ2RIK0xqMnpxZlFhd2VCVEJYdCtxVVBBU01MTm5POC9YRDVW?=
 =?utf-8?B?cW9EdFd1dzBIVTN4M05RTTY1bHZwTFlCV2UxalFYbjN1UXBSWVpMK1BQVGx4?=
 =?utf-8?B?ZmFGYTJQU1hQVlVpNVMvWXJia1NYd1o1TGRnZEZVMTFRQ1lvaVRmUENDTGd1?=
 =?utf-8?B?M0krK3BrNUZQZE9MRWFFdkVFYTZwTUo1YzVacHFMWDc4MG9nTjA0aFQvdlBH?=
 =?utf-8?B?WGhvMFh2UWNDYlNoTzZCYUNqTHZqeUZvNWYxYkx4ZWJzRnU1cXpaNXdvSlhY?=
 =?utf-8?B?TzhpUkpNK0RUUTdISGZOMFM3TnVObVVwc21yQ2gvNW10c0c3YWZuQ0tWdXBY?=
 =?utf-8?B?QS81ek1nM1R3aGZqcFJwRFZha2doTDFRYzdEZmtIdHR2cXB2WGgrazh5d2xn?=
 =?utf-8?B?eVp4akJLdzRReHo1Q05YSFkyaTJ4UEt0T05lZXZEOXNhSVZMTFpVbERqSE03?=
 =?utf-8?B?M3JPQVRCd1dtb2FqNTF1bVNaUUJpaS9halRFejZIWDFCMk42T0NFUGdwSjl0?=
 =?utf-8?B?VGQzaDFMS1B2NHVjMXZnTHV6K1RPNys4V2dMZDAweFdkYzlFZHcyNUJjU1R5?=
 =?utf-8?B?Yy9tR1RrTHdocFJaNGJpWXpteDJjYUorZG4rTlVzRzI5L2ZQaFNYbzczRU14?=
 =?utf-8?B?WEhTb01KSHU0enpXNlVqeGFFWTkwTWNCczg2Z2xKa1NrNkpLMWZPUUkwbSs4?=
 =?utf-8?B?MStrdys3cUxROEdyRzRsQmtYOU5EbmhUcGppNmVBWE9VR2JxOC9jS2lLRSs5?=
 =?utf-8?B?RmV6Q0dMOGx6Q1h4K1d4NjhvQnZZYitVUHR6aWUwRFpwaFpiUWE1b0Q2Ym94?=
 =?utf-8?B?NS9kakJNT1QvNGtpS1RpNmpGQ292SEdhZW4xTjNwWTlHYXVRL05kNy9mSFgv?=
 =?utf-8?B?SFBTT2pnVUF2Z3dwWWpKNmdSdXdBWFFYdnA5blhhb0V1NDBjWHYrK3h2ZldE?=
 =?utf-8?B?STc1dHl3MUZNbGNIaXJ3aXlLTzhKV0lReXdEc2I2eTlCQVJtYjRVdWJIQktZ?=
 =?utf-8?B?Q0V6OUVsY0FLclcyQVd6K3Rwcyt0SmFNcGx2VFFKS2IzRElaTUVERnRLYUc4?=
 =?utf-8?B?d2hXdzJDZFc3N3JRaUE1WW53Tll1eTIrMmQyZnpUL1NzQjJQeElFdU1pR0lk?=
 =?utf-8?B?YTlTQmoyMWt6N1d2dXlKM2NhNHZBRUhOZTdFMFB6ZlNaZGpMOGU0VjdydlI3?=
 =?utf-8?B?dlJoSlc4R3BhS1dwRnZBcEJGaWtXem5uT2x1dG1wNDROQXk5VmUwVk8vbHFh?=
 =?utf-8?Q?2pFrDqlygYU5sJQ3A8t+Ym0Fi/txgAmNvMt0Ma6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b808e0a0-e37c-4b65-8590-08d9686257c5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:23:03.9331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTD7MxbHyS2DO4/yHv42nth9gLjDe+2A4gj5xMHggse9pu1mo/I8TCGIfRNgLp2R+ELHqNFm3UNLTMjpFnx9+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

While the specification doesn't say so, just like for VT-d's RMRRs no
good can come from these ranges being e.g. conventional RAM or entirely
unmarked and hence usable for placing e.g. PCI device BARs. Check
whether they are, and put in some limited effort to convert to reserved.
(More advanced logic can be added if actual problems are found with this
simplistic variant.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v7: Re-base.
v5: New.

--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -384,6 +384,38 @@ static int __init parse_ivmd_block(const
     AMD_IOMMU_DEBUG("IVMD Block: type %#x phys %#lx len %#lx\n",
                     ivmd_block->header.type, start_addr, mem_length);
 
+    if ( !e820_all_mapped(base, limit + PAGE_SIZE, E820_RESERVED) )
+    {
+        paddr_t addr;
+
+        AMD_IOMMU_DEBUG("IVMD: [%lx,%lx) is not (entirely) in reserved memory\n",
+                        base, limit + PAGE_SIZE);
+
+        for ( addr = base; addr <= limit; addr += PAGE_SIZE )
+        {
+            unsigned int type = page_get_ram_type(maddr_to_mfn(addr));
+
+            if ( type == RAM_TYPE_UNKNOWN )
+            {
+                if ( e820_add_range(&e820, addr, addr + PAGE_SIZE,
+                                    E820_RESERVED) )
+                    continue;
+                AMD_IOMMU_DEBUG("IVMD Error: Page at %lx couldn't be reserved\n",
+                                addr);
+                return -EIO;
+            }
+
+            /* Types which won't be handed out are considered good enough. */
+            if ( !(type & (RAM_TYPE_RESERVED | RAM_TYPE_ACPI |
+                           RAM_TYPE_UNUSABLE)) )
+                continue;
+
+            AMD_IOMMU_DEBUG("IVMD Error: Page at %lx can't be converted\n",
+                            addr);
+            return -EIO;
+        }
+    }
+
     if ( ivmd_block->header.flags & ACPI_IVMD_EXCLUSION_RANGE )
         exclusion = true;
     else if ( ivmd_block->header.flags & ACPI_IVMD_UNITY )


