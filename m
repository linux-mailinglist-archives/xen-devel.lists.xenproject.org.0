Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF6A4F75C1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Apr 2022 08:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.300389.512341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLMU-0001Sa-ND; Thu, 07 Apr 2022 06:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 300389.512341; Thu, 07 Apr 2022 06:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncLMU-0001P5-J4; Thu, 07 Apr 2022 06:11:18 +0000
Received: by outflank-mailman (input) for mailman id 300389;
 Thu, 07 Apr 2022 06:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncLMS-0001On-BJ
 for xen-devel@lists.xenproject.org; Thu, 07 Apr 2022 06:11:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86b0c26a-b639-11ec-8fbc-03012f2f19d4;
 Thu, 07 Apr 2022 08:11:13 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-2gvv9xDFNYuVpzB2ZjNOIw-1; Thu, 07 Apr 2022 08:11:11 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5596.eurprd04.prod.outlook.com (2603:10a6:10:a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 06:11:09 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 06:11:09 +0000
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
X-Inumbo-ID: 86b0c26a-b639-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649311873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JnE8xJC6aHLf7QxEU8ahXxNaM953sp4uj3NcYFvGw4w=;
	b=UTuyyBMXvuPlzy6qO41800MS3mTPFHrBC7aGPYs+242oJNxt9gibvALqrLHx5tR+CsK14W
	p8UakZTE4jOOsFKUWDwBsWlNxkqe0rdhbjt/2WsdvE+57SyCLShSwYxk9iG/Wp+PbSqlIM
	+pGkwqf7ssi/KapnGMTVYG9DbwnqaZA=
X-MC-Unique: 2gvv9xDFNYuVpzB2ZjNOIw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYJHfxJYTvjphDtDwU6kA7rmjWtZzKsk8cSc9pLYxxVdlrqo1e0AP/z2JDQzpxTp6/GDr6gaxYsEgeOFRz7SF3flwDt0eCjHB1dU/6+UWswvDGYGJcCH74IJgF8OCMrQ4iv+umqR5DwBe0/Z3MSfmapQRyu9ODnqeHuhDa0Ovq8k56oGa+F53BaRVZHVFZly5oafX0T5cUnf4kQA6XRSd318Lo3TgEoVQvmUD+E5Vj4LUYSzRYAQW53y0dYlbLfIFD+5KFCRk6QrgT18ugEhhAKEbbEluAGeiwwMjkBXSHdH6HjxRThvp3RwhOeS3liHhhhQOVuETgTXPYINXpeCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnE8xJC6aHLf7QxEU8ahXxNaM953sp4uj3NcYFvGw4w=;
 b=MFXTtBz1LsvLiHp2vezzPitN4GvehIZ+gJ/dx3GkArn5Jh+vMsGkXiJdHM6lgFNADhA7r6/7e1jyDxNjJvhuJQrsK90T4Aeoe757O1fRUKyOqpr/CtjES7eXKreFmF3JXOZfOvVUsvwLpmQAIhn+o6DxaeNGNbcjguCoUZgkt420ly8k9N3QhUgBQnI6AAE0F4vAKk2i7WdD1ksxgROb6aaCIbtXXnjnr4cJtKaVjZXY8I9CaG96QoqHbziksYKr/Lmaty1nP/5lu47fRIOO+yy8svBihtEWDZmitodJLHZ+QUU/z1gCCpM82+gCKQp1XfNAM3Mhl+GAEcA6Sc8SRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
Date: Thu, 7 Apr 2022 08:11:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 1/2] VT-d: avoid NULL deref on domain_context_mapping_one()
 error paths
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
In-Reply-To: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0008.eurprd07.prod.outlook.com
 (2603:10a6:203:51::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f80f7f91-a89c-440c-bd95-08da185d682e
X-MS-TrafficTypeDiagnostic: DB8PR04MB5596:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB5596BC14F52B543D7ACB789FB3E69@DB8PR04MB5596.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m7qoYDeR6Im35qJmRYTm8ZXmzSGUE8WGGjvKMOegZUelOh/Rv0gXNWXES2ywt8FUWRR3LYdW5Tgq6EfAdWAb0i1OK+1E87KyQnFLFUP5r+/yT/X02gLFu3u3vA/6OZ10je4sCCJMh0rn2Lci6KftlcIvl+/g3qtw9cENvE92lByKMnz0konBz3OVLfyPKCSTNG6TFts+J0MaXmj56eK12UT3A6TMNiIaKRcUaGYZXlIiGnXGD+e90+EA8mHHCVQCQ9kYS66wjs0vupqQqgezeTga9Z0vOfEV15pqb+eA1OCbaih1XWKIYshedhULqllGXFyEmLyXnURPE+YH+oez4eJ7ahBlJspjFmLA2zalMP4xAV6cK6fF24usJILztVVcVHrhtZHJxKJqSSBBRRYqMgq0WerLk0E4/EwCQLXzWA8+RklLNb1/iFl388UV+J0I/rq0Oiz/1NW9ieelCDVFBLAmcTqGCdpp5r43Go5UjeBG2GPoTTDXJHC6cNoz/+h70bFRGsKJ4s/JOKHDBGC/uttqqGq7CIEGw7B/akWYPFC5WbfCGMYnFG6Vdf8/C0AdpzfbkGy0/BL2EbKrc2YcYKHXQJYr0yLn37QVx/fUOUfEmP7L6rYVwUFobeBphypJp1iM6DekkhN3vwty7tWXazCVx8fhlX4Q6RmnVnqx/7lj/BzltfWjyBmhbZLrCgT+mhKbEw3YyXWVGKTfAEyBNX60PDOkgrMUIhzddPyahKBEAQkQJd3+PbHbjiAVXZ77
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(2616005)(6486002)(54906003)(26005)(186003)(38100700002)(5660300002)(6916009)(316002)(36756003)(66946007)(8936002)(31696002)(6506007)(6666004)(508600001)(31686004)(8676002)(4326008)(86362001)(66476007)(6512007)(66556008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzBYbGgvN2dMMThDMDFsaUR4T3VhdGhxdTNwOHVxeXJMQUtLOVlsMldGYkEw?=
 =?utf-8?B?aTVpdTEzM3JENHd0Nm9Od05raXNmSHhiWDBUTjhKRUZGOU1yazQrbDFUZnUv?=
 =?utf-8?B?S2pmTzZ6am1WQ1NuN1pXblpxc3V0QVdVdy9TaXRkZ3B3VlNrMzZvdWJVeGZi?=
 =?utf-8?B?N3BRSFFhY3k5Y3FjbTFYTkZJNHFvRjJtVjFLeS9wUmhVanlMNUJNQ0Fxc0Y2?=
 =?utf-8?B?ckY4WGdpN0pGU2lLaVRUeVAvazZQTU9nanNyeU1tcXBGSjBOM3QzWnh0Tkky?=
 =?utf-8?B?ZHBXaS9pM3M0UWdJeHZITm01OGVoaXJCd0dCVWJkYVNtRDVQblhXbnVNcUN4?=
 =?utf-8?B?YzFZeHJoY3M0emhZaGJtLzRwN3hFbEF6KzB0TGJEeHN3SEhVUVNaSE5NVDdj?=
 =?utf-8?B?ZEJLY3pYOEswMG5yaFo5bHRockZONzZJOG16aHJVZXcxWGdMNXV3SEZ3YldU?=
 =?utf-8?B?dzlEOFppcFFQRjZ1cWF5NFVmb2RkRGJWSXhkWnZiRkZXMVNrcmNvL01MUkRL?=
 =?utf-8?B?WnZsdDhrc1p5Y3JpcmZwdnN2ajJqSGx5czE2cE92OXZnRVlUbWlpL0JPTjND?=
 =?utf-8?B?TzdLdzZHNkd6cXpTOFppSExHTWVFQVJQTTJnUS9yejZGcGlCeUpNY2R0b0Na?=
 =?utf-8?B?emNrUjM5aHYzZ1Ixc0tQR3ZNejEwOGxLRVErNGd2THhwdmdWeFg3WUpQbmtO?=
 =?utf-8?B?RTAwQjlKV1FaKzhBeGV2ZTgzSDVtK2NwaFIxSmpwTnp2dmp0NXgrRGk1NXRr?=
 =?utf-8?B?YTFkT3FPWUpTdUR0MzlKUXRUcUF2dllVS2VUSmVwYVEwQW50bnBvc1FwZjBR?=
 =?utf-8?B?MVFBU1FsYnd2Z2xBRlJXWU9SYmdGYzlBOGwzTGxBMlVpcE9xZmQzSjVZaUM5?=
 =?utf-8?B?VE9qR2txaG10MGdmbWFpVFFHVmJaN2h1U0p0Vk9VbjBoOVc2VlljMnU3bnlT?=
 =?utf-8?B?WVVIc3laWWtRazMyT0xpd2s0ckRpR3JJRGpIY3BhYXVjSXlLa29ZK0s5R1ZF?=
 =?utf-8?B?c1dvZVZvcGJhWndDeWl6b3FtMGgwL0cvQnBpaUhyeFZVL0lpMEtZUHV4b2VN?=
 =?utf-8?B?aTZJSW5IendhNnBzZVRETGtDK2hFQWQ1Sk9YUFpqR2ZwSGFka25XUUs1SXFB?=
 =?utf-8?B?ZW5BT3p3c2lzUEx0REJmWDl6cUZFV1YraURieWMwdVdyR0hRMHduelVmQzdL?=
 =?utf-8?B?T2UwVjBTdFcyTnN4Q2FYK1dWaW5LUHBSNi9hNmUwemlteDJ3b0VqbzQwbzVE?=
 =?utf-8?B?R3l5YXJvQ2xxK1NxNnBobkd4dTdrN0QwYlhGalYzajZ2eTRuY2FtKzA4OUhp?=
 =?utf-8?B?V2pmQysrcEo1VHEvb2t4RkJiK0xxaVFyU1pqNHdxUEkrQ0RkOGdBYVVrcHhF?=
 =?utf-8?B?NGdqYVNzL2diMnVFSGNQMTVBQjlQRGd0Mk1SamFldi9MZlpsTjdCU1VlOHN3?=
 =?utf-8?B?MmtLTnRlaktuVE45TEhadUo0ZDErRU9haXFuN2NPditBdzBVdmlZK2duTXhm?=
 =?utf-8?B?ZU54TXBaWWNOWk9SSXhiZ2xZNEJ1eWQ5MjJKaWpxVTNTWUJwTzI5eEY0L2Fv?=
 =?utf-8?B?VFBLQ09ybFB6WVU3bWhhZnE3TEsvYnY3N1lhY0JTZnFUTXpmTnhOdHhSQVZn?=
 =?utf-8?B?MGNmclA3UVh2WUlSZHUxbXpqSGI2cXpsSFVtZFpaWVNoM3RFSUZrY0R5cWF1?=
 =?utf-8?B?SGtpWVBhVXNyVVZYUnBNZFVWTWtHSHlpcGpiZjVYdEpXdTdUN0lQV2oySkVu?=
 =?utf-8?B?S05UUEVqbnhUREcvYWwxZnM4V2VQS1VmRzdia05JVFBBSDdYQm1hNUVrU1E5?=
 =?utf-8?B?OG84a2FRc0pyNWY2b2RVU1lqWHkvTDNOaHNmQlZXUnJ5aE04cjdocjYzc3lV?=
 =?utf-8?B?V0hYK1FZazFmNjMrSHpkSVhGeUVSTkFReXRJRlJ1WWsraGxsZmF0TmJKY09v?=
 =?utf-8?B?akp2OExMZWdkWXBramM5ZnJuZFRRelFkcHdZamtSZFNRME1RQWJKSE15T3Nu?=
 =?utf-8?B?UWpNSHgxcFZMZm5KSmtnMjJOQnhDWkQ4YVUrdWxJZWFMUHNHN2N2MVhaOWRJ?=
 =?utf-8?B?VkNHNCtta0lvallwendCcTU5UEwzZ0ZGRWFadjQ1WlNQQ3dxVlJBeDhEalJv?=
 =?utf-8?B?d0RsSWNZSTB6Qkc0d1dnbkNiN0tIWmFlbFVtQmlmUDJ0VTRlTDNkWS8wSnNK?=
 =?utf-8?B?ZU40N05SVWtuNU8rVytJeEVsRzU5VGJ5alNVdmJObEJKdXQzazdmRlpqanB2?=
 =?utf-8?B?SFh2U1NZWHRvZzJ5Q25YK0JTeDFJQy9qK2oxK1A2aXVEMys4V01GRFJveXdw?=
 =?utf-8?B?bmFWNHFWcDFCeEswME1ZWU1FNUdHZXFmclp3ZmtNeHY3bEVmUWtxZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f80f7f91-a89c-440c-bd95-08da185d682e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 06:11:09.3701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4efavg+Hg4fLY5etLUBzC+Q5RIyjjnBWQdsk087jaC7pldJQKJzi7iNf9UT2rDjcVsqb2Tj64GyXflnBw9wxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5596

First there's a printk() which actually wrongly uses pdev in the first
place: We want to log the coordinates of the (perhaps fake) device
acted upon, which may not be pdev.

Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
device quarantine page tables (part I)") to add a domid_t parameter to
domain_context_unmap_one(): It's only used to pass back here via
me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again.

Finally there's the invocation of domain_context_mapping_one(), which
needs to be passed the correct domain ID. Avoid taking that path when
pdev is NULL and the quarantine state is what would need restoring to.
This means we can't security-support PCI devices with RMRRs (if such
exist in practice) any longer.

Fixes: 8f41e481b485 ("VT-d: re-assign devices directly")
Fixes: 14dd241aad8a ("IOMMU/x86: use per-device page tables for quarantining")
Coverity ID: 1503784
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop SUPPORT.md addition. Adjust comment. Extend another comment.

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -85,7 +85,7 @@ int domain_context_mapping_one(struct do
                                const struct pci_dev *pdev, domid_t domid,
                                paddr_t pgd_maddr, unsigned int mode);
 int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
-                             uint8_t bus, uint8_t devfn, domid_t domid);
+                             uint8_t bus, uint8_t devfn);
 int cf_check intel_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt);
 
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1533,7 +1533,7 @@ int domain_context_mapping_one(
                 check_cleanup_domid_map(domain, pdev, iommu);
             printk(XENLOG_ERR
                    "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF3(pdev->seg, pdev->bus, devfn),
+                   &PCI_SBDF3(seg, bus, devfn),
                    (uint64_t)(res >> 64), (uint64_t)res,
                    (uint64_t)(old >> 64), (uint64_t)old);
             rc = -EILSEQ;
@@ -1601,9 +1601,14 @@ int domain_context_mapping_one(
 
     if ( rc )
     {
-        if ( !prev_dom )
-            ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                           DEVICE_DOMID(domain, pdev));
+        if ( !prev_dom ||
+             /*
+              * Unmapping here means DEV_TYPE_PCI devices with RMRRs (if such
+              * exist) would cause problems if such a region was actually
+              * accessed.
+              */
+             (prev_dom == dom_io && !pdev) )
+            ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         else if ( prev_dom != domain ) /* Avoid infinite recursion. */
             ret = domain_context_mapping_one(prev_dom, iommu, bus, devfn, pdev,
                                              DEVICE_DOMID(prev_dom, pdev),
@@ -1744,7 +1749,9 @@ static int domain_context_mapping(struct
          * Strictly speaking if the device is the only one behind this bridge
          * and the only one with this (secbus,0,0) tuple, it could be allowed
          * to be re-assigned regardless of RMRR presence.  But let's deal with
-         * that case only if it is actually found in the wild.
+         * that case only if it is actually found in the wild.  Note that
+         * dealing with this just here would still not render the operation
+         * secure.
          */
         else if ( prev_present && (mode & MAP_WITH_RMRR) &&
                   domain != pdev->domain )
@@ -1809,7 +1816,7 @@ static int domain_context_mapping(struct
 int domain_context_unmap_one(
     struct domain *domain,
     struct vtd_iommu *iommu,
-    uint8_t bus, uint8_t devfn, domid_t domid)
+    uint8_t bus, uint8_t devfn)
 {
     struct context_entry *context, *context_entries;
     u64 maddr;
@@ -1867,7 +1874,8 @@ int domain_context_unmap_one(
     unmap_vtd_domain_page(context_entries);
 
     if ( !iommu->drhd->segment && !rc )
-        rc = me_wifi_quirk(domain, bus, devfn, domid, 0, UNMAP_ME_PHANTOM_FUNC);
+        rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, 0,
+                           UNMAP_ME_PHANTOM_FUNC);
 
     if ( rc && !is_hardware_domain(domain) && domain != dom_io )
     {
@@ -1916,8 +1924,7 @@ static const struct acpi_drhd_unit *doma
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
             disable_ats_device(pdev);
 
@@ -1930,8 +1937,7 @@ static const struct acpi_drhd_unit *doma
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
-        ret = domain_context_unmap_one(domain, iommu, bus, devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( ret )
             break;
 
@@ -1954,12 +1960,10 @@ static const struct acpi_drhd_unit *doma
             break;
         }
 
-        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn,
-                                       DEVICE_DOMID(domain, pdev));
+        ret = domain_context_unmap_one(domain, iommu, tmp_bus, tmp_devfn);
         /* PCIe to PCI/PCIx bridge */
         if ( !ret && pdev_type(seg, tmp_bus, tmp_devfn) == DEV_TYPE_PCIe2PCI_BRIDGE )
-            ret = domain_context_unmap_one(domain, iommu, secbus, 0,
-                                           DEVICE_DOMID(domain, pdev));
+            ret = domain_context_unmap_one(domain, iommu, secbus, 0);
 
         break;
 
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -427,7 +427,7 @@ static int __must_check map_me_phantom_f
                                         domid, pgd_maddr, mode);
     else
         rc = domain_context_unmap_one(domain, drhd->iommu, 0,
-                                      PCI_DEVFN(dev, 7), domid);
+                                      PCI_DEVFN(dev, 7));
 
     return rc;
 }


