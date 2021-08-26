Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9C53F8315
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:25:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172723.315191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9kz-00018L-KV; Thu, 26 Aug 2021 07:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172723.315191; Thu, 26 Aug 2021 07:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9kz-00015y-Fy; Thu, 26 Aug 2021 07:25:01 +0000
Received: by outflank-mailman (input) for mailman id 172723;
 Thu, 26 Aug 2021 07:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJ9ky-00015e-DE
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:25:00 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cec7e05-13fe-4038-a763-8081e8adee7e;
 Thu, 26 Aug 2021 07:24:59 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2056.outbound.protection.outlook.com [104.47.9.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-Fq_hmhqoPnGJu_iehU_ixw-1; Thu, 26 Aug 2021 09:24:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3118.eurprd04.prod.outlook.com (2603:10a6:802:a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 07:24:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 07:24:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0089.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:24:55 +0000
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
X-Inumbo-ID: 9cec7e05-13fe-4038-a763-8081e8adee7e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629962698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C5jmK8F3zx3Iim9ZNfcc8Wx+aPZ2lWaNnZCYDGjUo2o=;
	b=Q35TI2PJk5GgCkslvvTCOozHZCzKpWJQwogWKq6xGDrKyHU6dx2w1v+huWoa0VjfkPgkdl
	8SOkNS+tyymUZVyja7qkSJGiwTf+573LQ58wRInnxQMjJpz/aotf2KLkoHWCsPxHbCqjaY
	Fpq2GxWCTG6dfpv2DZ4nrb6MmbivS/E=
X-MC-Unique: Fq_hmhqoPnGJu_iehU_ixw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVEkcYOkL56l2cEpsgh+1wkaUi72wLpxpYWQYmYj2t5f47M4dqhxN031T6JmE35083o3gXjEp96LKmO1CLf05RGzdM5Phz6B88xYlE3ORAsJidSLzbfWLNhf+byduM7zN3AToOG6WUhJXrOV6BVmwN/Bq+Jxw3RlNmtblnuCkfvCRMfGbRSjhKXI5DgErEM+/lFUG+324AgkSmVErBmgTI4JeuiHhEPkmMyUbGwtdrA4R+LnkYcicSvpmgLajnLDjBSyOQG1nAsqKkh82YG3dRzJnLN/t2q/X8Rzaa6VtXwwJqp4hEtBVUWVgtH5r1Bzh7bCRXWcPvm7M+Z40MkCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5jmK8F3zx3Iim9ZNfcc8Wx+aPZ2lWaNnZCYDGjUo2o=;
 b=B8S1xP5A6SsVOGPM4OSuBzZ3sDCek5awFmxxe8CzwOCI0qWkfTbCk6HhnAAi8SQF4PuG+hLa7ZrevbT+b1B2b5hiC7q7Octb1IVEqhNd5ELUOjdMWSYwJ4XfKFROpqc+kBL4hYQPnHPVmLGIhAwxcl46GnERND4qbqRRdZpY6Ic9wohOdEFvXZkjdkZVvWAtJYXsKH5pzAVzmTCMCFUHFbctHUrYn4ue1yoZoOsPT2yscRvrBV1lUfggneLls4iHlas+juyr6dBkMMnzEl04h2M3uj29GvIPdbBjaMGsYYS+wgQHpBWLKCHmKmIN8Y7vogdCpMubs+otAc49l5V3LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v7 5/8] AMD/IOMMU: also insert IVMD ranges into Dom0's page
 tables
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Message-ID: <d3aa4648-282b-9699-05f4-3b010a73ff51@suse.com>
Date: Thu, 26 Aug 2021 09:24:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P189CA0089.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b4226d6-ec38-4b50-baa3-08d968629ab8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3118:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB311835EA1EE17EC301B7A31FB3C79@VI1PR04MB3118.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QHR/AHa26TcQqApFrpY3JaoUpfhQFOE1j8O8O53KbAVW6CBVtRx+7cYy9Vjsitb0mF7TUSn0hyqbpDKQT4gJqeYKsrnDOqtIHQaUjSj6/Or/pMPrY1RpGXrAgxTINvjF9w9ci42bd/De14ixNvbGAOIcoRyEeygTr9/FJVXmWg0tUoyTtfev9BCjYD20bssVJhrhaCd751VuJqTEAN+NZRcwhej/pNu2O1NOITNRSFGyqTUKmSyVdlzqimGT0348ISKnQnuQWrFaqQpzonn2rrDrVmc5urGCYWLv+BWMhRofTL/O7rE/8xLjfo0AQat8NjD4zCJxga89Km/tF7i+FAQ312Asi9imN2wqklczcF92VH7JO40ON4HF8GWPdpXkBIjTXbopBW7j7ejjBVpU3bbEL9s31in4qBVVeIbuLAY7HDL19c+XAkdJeAyxOH+i3pQvQWZtwhwjfWVaHPOgShWIxtg/HcJzpHBNO5j9aufO9TY2jg3XetTNsxlYEQCnwDxLWIqc5SX6nFKhcGgz0KZKoNmJoxiPCo+GlAngM9QCIxdNZQUluUshq72UuWZFq97bptWWb2es7aNEciU59P7fDTW8TpaIgHRu+cA3l0ViEZkQsZQ2OHhxHugOfZA/JiNZjifTF4SPfgdl6tiLqlXMqSunuQ0EWeikWgITBbupDldlRvYmZePCtr8E1bliCT85lg+4J93flOCAyUhNtXnHXZhdDBwCObYASqpyLVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(31686004)(66476007)(956004)(2616005)(2906002)(8676002)(66946007)(38100700002)(498600001)(5660300002)(36756003)(54906003)(16576012)(31696002)(26005)(83380400001)(4326008)(6916009)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QU80ODg1R1F5Q1JLZnNDdXoyVE9VRW1CbXpTT2cvSGZMOU9MZzhNcCs3bjAy?=
 =?utf-8?B?MXBscXp3Q3FZNGdXdzhXY3dYRU8vRFR6WDEzUkZYNjU4TkhGbTN4NzhWZktj?=
 =?utf-8?B?NmN4UVhzUHFmWUlCSU85dllYeGYzVTRDSHB2NUpWWjJjcFh6QXZCUk4xNmh2?=
 =?utf-8?B?ZkM3NkdGUVU5TGxaU292cTNFaFNYYSt1T0xaNlhZaVZ6aFFmYmVwN1pORzRw?=
 =?utf-8?B?bWg3d2ZOZ3drRG56d2ZCQ0FxeWtJeWFPMzQvTklISkpmalFmb1dmcENpcG1I?=
 =?utf-8?B?dG9MM1B0TC9TTTlQOEdIWEo0cEtiWStxVGF2ZjN2d2IyaC9VdTFYNFVlcDZr?=
 =?utf-8?B?TGVMY2RodHFpWjBQUFUwZHpNNEJQbTQzR1g5c0w4ck55bG5DK2lpRjhodmkx?=
 =?utf-8?B?a3phZUY5emZVZWw1aUg0bUxEbTllZDBzcVdmSzEyNXg4ZCtJWjMyQkhzS3VX?=
 =?utf-8?B?cjFRRDFEeHl6Z1AwaURMcHhQejRnTkpUUlQ1cjV3VDY1cE5JeExCczN4UXhp?=
 =?utf-8?B?QVVWRkhiK0xCNEp3cTF6cE1uWFE0dG5FRFc4QlU2SUJaMHFsRHRCZ2JIT25R?=
 =?utf-8?B?RlBFb0MzRzE1VGhBOWgrYzZjWDBhZVdWS3FkcXhSYkNkdUpyd1dicjJzM1l1?=
 =?utf-8?B?SHZxY0kvakJ3UlUyTWhYUTNUeDkybkhtQWdoRG9CUjhiQnJqaTFnekNKRWx1?=
 =?utf-8?B?aGFOQjZtWjRtbDIyeXNqUTh2M0VOeDdmS2NXTVhFaWF0dk9XL1BOYkhMKzgw?=
 =?utf-8?B?UGxWdU9WZ29DQTdyc3V3eGhDdzV2N2VKNHpJSTF4eGZxTjI0Qnprdmh0MDFJ?=
 =?utf-8?B?TkRsYS93OHV2eUNWL0pKWXdRZE9iSmFtRmt0WHBjSDlJRzBhSzB2NEJQTGdB?=
 =?utf-8?B?d3lXbjdaQnMxMDNvT01kMCtvMWxPU2diajE4b1RIWGVRWjZZbUZWZ2g2YTc3?=
 =?utf-8?B?bmNoMUZpR0V5dHZIQjl6WjlSdEpGUTk1WDBsMk1OeC9sV3Z4Tm4wc1ZmMHJ6?=
 =?utf-8?B?K2pvNlN0YXVzd2ZaRFl1OExoR0o5aWZIQWk0WUtRRjNmM3F6aDFvbjczTEZw?=
 =?utf-8?B?Uy8xQUZZNVFWU1lYNm9XRTArRGR3c2pLdnV3bWI1a1hzUmU3UnN4d3lTTmlD?=
 =?utf-8?B?bE9vbUp1ckRxQjRvWWU4NVFXOXhOeEF5aG82aElDQ1dWdS9lbnppTG5yWGJ1?=
 =?utf-8?B?WXQwb3lhTGplczUvMjlCdjIrWEgxejFrUXdCYi9MN0lyNlJjeEd6Z2F5V3hK?=
 =?utf-8?B?RU9yNmowTEg3aElKM0t2a2N3blZYNFZsUXFrQ3dUUXhMQ0NOdkFJbnh1Tld6?=
 =?utf-8?B?cW0wRHg5cTVmV3IzajVnYUNsS1JNNm1GaituRngvMmo3Q0JOUkJUdGdkYkRU?=
 =?utf-8?B?cENjOHJGaEJTVThrN0tYUTJNVGlOK21qTWNUSStHQXRKdUd4cS9FNnpPN3Vv?=
 =?utf-8?B?ek1RYzRPeC9OVm1WRDZha0dHUFJ2NTM0QWNsSUVwSmxRcHNUb01jTFlsSjZw?=
 =?utf-8?B?WlBDdHBmZ2puV2lEOWJKOUJGZngwdXEzVUxueFltd2NDcVJodFEwTEJsdlpX?=
 =?utf-8?B?Y3I2enR4R3BIMWNoRTRCcWdPb2VhT09tUjlMNE9VNE1kZDZiRnQvVERUYkhF?=
 =?utf-8?B?WUwwZEZUOVJyZzgxNjZHck1RelFoZmIxWkNzUEU1Q3ZYTVFRRVFXSm13TlZT?=
 =?utf-8?B?OVhTU0VkQjZiaVpkZ28ra1VQZUlWOXRhVDJyRzlNKzJMZDVWb0hSb0FEODJY?=
 =?utf-8?Q?U5a1Qn/gsIQpuckOWn+ReWbW+1JajgzfPz+DkST?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4226d6-ec38-4b50-baa3-08d968629ab8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:24:56.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Akd19YzvI1woIGGXPMctDVXA2q6rAHyOQCQjpgGhQ9PYDPPngRCBucDPzatV9lMLdzuc5VxCJDo+fsEveuZznQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3118

So far only one region would be taken care of, if it can be placed in
the exclusion range registers of the IOMMU. Take care of further ranges
as well. Seeing that we've been doing fine without this, make both
insertion and removal best effort only.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
v5: New.

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -522,6 +522,14 @@ static int amd_iommu_add_device(u8 devfn
         amd_iommu_flush_device(iommu, bdf);
     }
 
+    if ( amd_iommu_reserve_domain_unity_map(
+             pdev->domain,
+             ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map,
+             0) )
+        AMD_IOMMU_DEBUG("%pd: unity mapping failed for %04x:%02x:%02x.%u\n",
+                        pdev->domain, pdev->seg, pdev->bus, PCI_SLOT(devfn),
+                        PCI_FUNC(devfn));
+
     return amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
 }
 
@@ -547,6 +555,14 @@ static int amd_iommu_remove_device(u8 de
 
     ivrs_mappings = get_ivrs_mappings(pdev->seg);
     bdf = PCI_BDF2(pdev->bus, devfn);
+
+    if ( amd_iommu_reserve_domain_unity_unmap(
+             pdev->domain,
+             ivrs_mappings[ivrs_mappings[bdf].dte_requestor_id].unity_map) )
+        AMD_IOMMU_DEBUG("%pd: unity unmapping failed for %04x:%02x:%02x.%u\n",
+                        pdev->domain, pdev->seg, pdev->bus, PCI_SLOT(devfn),
+                        PCI_FUNC(devfn));
+
     if ( amd_iommu_perdev_intremap &&
          ivrs_mappings[bdf].dte_requestor_id == bdf &&
          ivrs_mappings[bdf].intremap_table )


