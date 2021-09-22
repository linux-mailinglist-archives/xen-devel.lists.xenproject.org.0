Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895C9414C3B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 16:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192883.343605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3O5-0004OZ-E4; Wed, 22 Sep 2021 14:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192883.343605; Wed, 22 Sep 2021 14:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT3O5-0004Lr-AA; Wed, 22 Sep 2021 14:38:17 +0000
Received: by outflank-mailman (input) for mailman id 192883;
 Wed, 22 Sep 2021 14:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mT3O3-0004LN-L9
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 14:38:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a290730d-b82a-4d9c-93cb-14917531d40b;
 Wed, 22 Sep 2021 14:38:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-0PX2CnW2O9OHHYZEJFoY4g-1; Wed, 22 Sep 2021 16:38:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Wed, 22 Sep
 2021 14:38:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 14:38:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0171.eurprd02.prod.outlook.com (2603:10a6:20b:28e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 14:38:10 +0000
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
X-Inumbo-ID: a290730d-b82a-4d9c-93cb-14917531d40b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632321493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4OzGEj91QdJC5vdoESTAykpaiWdGj46EwoZ9sMMZn8=;
	b=eRVJHYuSPX7jhAb0P4sKFMEHSz0L1usuj0D6+tBXwciklhM4/GeWhUFJiR/wcI6XRIp4/6
	6bi1xMl78S/RNyDFH2m+n9jPQMA/JqF6Qn90xeLKgZs92Xc7eaDugWIhFlgjq8ZxKyvynN
	wyKZe1Lv/v2igNNKG9F9RMK9GJIkYbw=
X-MC-Unique: 0PX2CnW2O9OHHYZEJFoY4g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc/ksO43unMARgcWrNAODMghjoBwYq0onMQNlotNsMIfjU2jZUA+5pEfyyUepztttEAmCQa/U3kSXEg9EqxFJjTOnjofB+zQmibDftehe38kw0b3ogzLhgr5oLFo3BtX2XcezWzV32SYqXb5hgHklG63a1IrfI8aMfoJaUa22UBSeIpiGlB3lHUDh0tBOBbL5qw5Lwpao+oNS+J/HMsF4SEHaGKrxffLp1InGuD2b+TL5fLdW9IL0ZDCo006yGGaFw9vhnzTiccpN0zygFnQ/MlC6uGIMBDpxaHglV46RfR+/EOhXh3zC0xOChEjfeiY1ZIud+oEuFUz6BjqPMJ4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=L4OzGEj91QdJC5vdoESTAykpaiWdGj46EwoZ9sMMZn8=;
 b=lwUwJSZDUNVr5P2xHsnGjGYmzVxPWT4DBJ76dX6DxO6J0NwxlkOGwEzU4TEjVgvKyT9QSHXjPHJrK+nHJ1bz3Ow0NZQIxqfAXxsQAl2cOBjhk47dLaZlslmhZBctI1OKEvDQfp783HY5ZQQiC2FQ2A8ZrkRORyJ4LaynxQrW6mnNJoQHe4SLTne/0/IxDAUZtVYA1enYGYMH9BTlPJ3Sg6bJ2qNEbt8/hvbkGf7nNRYE58xmN5JOO7A8qi8MNBvuYSz46ZcTsuyJ5mBJFctRFn2KhGRfYqhO5pK4xrRmlaLWdWIG8zaR6I5p7MDVENQRN7qEOE6MzzOscF2bk/9p/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v8 5/6] AMD/IOMMU: pull ATS disabling earlier
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Message-ID: <34c081bd-ac6d-055c-e6c1-eeac62851389@suse.com>
Date: Wed, 22 Sep 2021 16:38:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d249a759-188a-d689-316a-4743922827e5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0171.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a0bd19c-454f-43f6-72d5-08d97dd69a0b
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB70245F229E9EBC1A5C2ACDADB3A29@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WHHKaRBBGCyTAzxb+ZeAonbYdx57SgjqKWPZgfh+06yjnPo7oafVQJVwtTZgOierleiIXe89jsyU7qMnOJUlOFa+sRKVNS4NZ9FT9g+sePZ2yfRaK7XkRjU93ESvhjelIHwE9Z2ppSXGaV3zz/mt5yCuTFDqB98UjInggXRERE+gUfY5vTShc8jzsbUZ23czTxXuFLY7dfS0EzIIOPZDc16OQiRcM+GmQMTivusumZUnngxCNLWsaS+p/NdW/+4q1uovk1RJiuIpUkEoAQ/2+h2MYOofkqonF0HutEksQSqh/Xnc1wb5ZxQ4UyjOQDKODQh/xIgh72l6hVrmGsw71NctKgsFmdTPuWa7UT+scOwTTNtz1hYNiYtmOSCM8Qg+TTCC8OhWe2Yhlx+S7zSX7LB/YXLzu/V3EhLPcY/ZGRp1qJUzy5Q3bYTWHi2HPW/1Z1Gtl+jgOmiwRouW16N56eJEE7vme5vARShrBlbSWlTRCFUKoz4QiQaRrm7PH7T6q6FJVlneGXuIPwQp/9pG0UGDZDy1jgQ93uRD3r0gr4ObpJ2QYukiw6gIg2fpCvlgpvRExiFBb8XB6mo7n0JhqmnAD+lvHHAXsG490DdDQ5v39NUHT7uSK6wR0UXciPbElhzaLZW18g6geXp0xL2KJkzcvGDupHvksemtYBRpgkPjACukRTUHL3S9jA/w+5vxLZVPVFsVsGtFUkjO4fiQz8VaziOL3AfFOu/slvBLuqc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(66556008)(16576012)(2616005)(316002)(6916009)(4326008)(66476007)(2906002)(508600001)(66946007)(86362001)(5660300002)(956004)(26005)(186003)(38100700002)(54906003)(31686004)(31696002)(8676002)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmNhSTR1N3I4aXRrWlpiUDNBdERHd1V5SVozVGVoSENLQjl2KzZpazVKV2JP?=
 =?utf-8?B?N2oyaHN4MC9YeUlVckNTbnNDelA4NGpzbEp3djQ1UFk4SnhCTWVEaWN1V0xC?=
 =?utf-8?B?bmRCUnhPZzJXMkRQdGFWczAzOXZwZGNpSTZrVUZxZ25ZcFRhendQbVpIbHR4?=
 =?utf-8?B?Skt3Y3ZZRmxyV3EzZ3F5ODA0YmNXRkIwN3QyS3JncTduWFZ6d0owNmF6WUVT?=
 =?utf-8?B?WEJFUHZGS0xIelpVT0lQOFkwQlpkTmZQMVpUU0p6WjZQOGZZdFQ5ay9LQzAz?=
 =?utf-8?B?U0hTZGVmYlM1bURNdExNRjIrV2xoczBNbFJ5TXRKdzhhcWVxTDdHM1R5RjFi?=
 =?utf-8?B?Tm5YYjVMeXlvTnV6Wnd1Um54Vkd5YVJDMTR5MFdRR2R6L21VMEUybW5WWlVZ?=
 =?utf-8?B?MHEzclBJa3hKS0hmOEQwUkwwb2V1OFdVY2MzSVN4U3I5eTZNZzc3V0VHTDZx?=
 =?utf-8?B?OUZkZkFnNzl1elFORWtFdmJvOElnQmRJWkUvUExGRXNYb3BXSDcxc1MzWEZL?=
 =?utf-8?B?S2YyYU9tZXRXdzRleWNrdVRoWE5FdVZQTWtwUDg4NVMvbVZyandaMXUrMCtQ?=
 =?utf-8?B?dTZEcW1PMWlWYVlUWUIzVmUrRTliTnlhc0psNU1wWVZGQWlGYURMV2J1Z1FJ?=
 =?utf-8?B?eWVvYXd4TGplV0JpS0dvcTNoVXl0TzlsckI3TktPUHI1anVZWDdoT29tVHBP?=
 =?utf-8?B?WGxNdzZDUDcrZkp2S2dSTDd1ekJrQVE3Z0IxSDVJQlNRZ0ZIRjZZMmQ2M3Mw?=
 =?utf-8?B?REZLQVpBbnlseGJ1RDIrWXlPK3ZRYm1nQjFmQUQ1UEdkUUtRUjk0WnlGbGVC?=
 =?utf-8?B?MkM3QlJYU2YxdG9jS2JCRGMvTXBXZHdDVVVYL0VhQVQ3VFNidWJzOW92ZmhS?=
 =?utf-8?B?dHl0R3U1NGJON2xNa0pwK0hySTlSTWxoVEI1RDBlTU52RzFDYzMvWWNlZ1lp?=
 =?utf-8?B?eVdUQ1Babm1Cbk00ZXBJenBIWmFaZWpzcUVCSUlNTlpabDZIdVFxTU14ZE9w?=
 =?utf-8?B?eWZ1dXZ4endTK1ptc2pyRFFnaUpDL3k4WkJFYUFYbEJrdG9PeDMvUVI1Yng5?=
 =?utf-8?B?dVNTWURPR0hIZjZKRk5qdUpmeGUvUXZMSFJXUlJQMEx6b25xQm1wL3NjYzdS?=
 =?utf-8?B?K1RiZEIvSWdJWjNkaTZCOC9UT0NERkhGVjBUZkF6TDMvc0F4Y1hYMmFCTjBn?=
 =?utf-8?B?anltWDE3L3hndWtGRTRtMzk4OVJhdVZQMzdSRnlIamdTc3VjNGcwVDR0cURm?=
 =?utf-8?B?M01hVUtNVWN0VHZoZVNtUzNVbEpnVVV0aWtZcEUySUlqVWQrL1VjaDAzRzBY?=
 =?utf-8?B?aDE0aXBVS3hLRTFzYm52Y1NtS25iSUV3dU5yTUhCdkdLVmF5MnB2bE5Nams5?=
 =?utf-8?B?NlJwVGJaWGE4Rjk3Q0prb0JjSHNiSlRhM1d5TlA0cFlyQkpjRnU1UkdtdzlV?=
 =?utf-8?B?cVpwK0E2aEFlSlgzMlBwMklnNlBvbDA2R2YyejBtZFY1OFN3aVUvVWUyY2Z4?=
 =?utf-8?B?UDIyUlVwZzRJVnJWYWtVdEtrMzNEME9hTEtUT21QQkZaZU9VY2g0QkVDOFZ1?=
 =?utf-8?B?RkEzUFpnSk9EZGZ0TzZCVTM5UUJPSlZLSEdQMm5BeEVPb1dCc0l3SXQ4VHBm?=
 =?utf-8?B?MWNFRWZtNnRLTCtVM0pZc1N2UkdjNEF6Mkp1LzRiT1Z5c0ZPWER5Q2M3VEc3?=
 =?utf-8?B?RmdENk5nMlJuZGRqTlV6UEk5MGN3ZjZUOWxxUkFtSkl2VWxSM1dNcDZJb2lU?=
 =?utf-8?Q?44S0i8i/gIJBiboW32N1RsOg8J8wLCpAzGLksz/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0bd19c-454f-43f6-72d5-08d97dd69a0b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 14:38:11.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwwRN+RDChHsgpPzEKBSPp5kM7vIOcDMCggOsBmfEZx+e1lRjTZkua321RhAJmAkcoTR5Cvh6Y6tDNA5+QnZxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

Disabling should be done in the opposite order of enabling: ATS wants to
be turned off before adjusting the DTE, just like it gets enabled only
after the DTE was suitably prepared. Note that we want ATS to be
disabled as soon as any of the DTEs involved in the handling of a device
(including phantom devices) gets adjusted respectively. For this reason
the "devfn == pdev->devfn" of the original conditional gets dropped.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: This points out that for phantom devices the ordering in
     amd_iommu_setup_domain_device() may also not be fully suitable: ATS
     would better be enabled on the device only after all involved DTEs
     have got prepared. This would be a less straightforward change,
     though.
---
v8: New.

--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -313,6 +313,12 @@ static void amd_iommu_disable_domain_dev
     if ( QUARANTINE_SKIP(domain) )
         return;
 
+    ASSERT(pcidevs_locked());
+
+    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
+         pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
+        disable_ats_device(pdev);
+
     BUG_ON ( iommu->dev_table.buffer == NULL );
     req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
     table = iommu->dev_table.buffer;
@@ -348,13 +354,6 @@ static void amd_iommu_disable_domain_dev
     }
     else
         spin_unlock_irqrestore(&iommu->lock, flags);
-
-    ASSERT(pcidevs_locked());
-
-    if ( devfn == pdev->devfn &&
-         pci_ats_device(iommu->seg, bus, devfn) &&
-         pci_ats_enabled(iommu->seg, bus, devfn) )
-        disable_ats_device(pdev);
 }
 
 static int reassign_device(struct domain *source, struct domain *target,


