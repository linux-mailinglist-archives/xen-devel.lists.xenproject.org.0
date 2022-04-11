Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF04FB79F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:36:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302770.516517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqSn-0006lf-5u; Mon, 11 Apr 2022 09:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302770.516517; Mon, 11 Apr 2022 09:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndqSn-0006iM-2s; Mon, 11 Apr 2022 09:36:01 +0000
Received: by outflank-mailman (input) for mailman id 302770;
 Mon, 11 Apr 2022 09:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndqSl-0006iD-Ms
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:35:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb03b92b-b97a-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:35:58 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-z2s000aAO1ufW5CdwQdlfA-1; Mon, 11 Apr 2022 11:35:57 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:35:56 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:35:56 +0000
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
X-Inumbo-ID: cb03b92b-b97a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649669758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2I9BVFSj3uMESwf/DYdlBGh3Zmde/zF778cT9zilJi4=;
	b=NPtpcC/JNv7lD/uQJ42bsDO929J+3z+b1sGpY9Mq1Y7TPXRq0olEzPd4GvmgcAYxqfCq+Z
	Egn4f9RA5yZlTZ5LNIsReXvf45KTSTk0JXTIUke8FNbofytJ1MbWDJqQhQVF1+oMMoJZS/
	TvDRxKOuaDZzK/kUx1T/R2ruVm+EyhM=
X-MC-Unique: z2s000aAO1ufW5CdwQdlfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+uSVko+/BfXswIpZbkuk5xrFvG9G5Xf1E3mK9X9DDwXMlKw2x8fnQWOD3OEWRvk3dZN/tCJtmJmdStaLCUCI1FjmPIO50lLt0u0q3lrkQW7i8po5xZWu77K6L62aEGgwJspR3pIQMnlScLgxkXMr5l+RChada0CVZePlFukExvl4uDUUpxCT7Vv7QS0vsM1BsX6x0d2UsDFk9O6fpfry2Z/7S53htoUaH2pAzKzDszhX+k0jeBcrD4nKiJzTWxgHvMDrnquna8MAr7dij/a05q5lugbv2W1VIZXDN3r4WFUatPT+tKBFgU+dOC+Pl1YXEHsbmDwTlXKelsZn5jl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2I9BVFSj3uMESwf/DYdlBGh3Zmde/zF778cT9zilJi4=;
 b=V6r32wYFX387ulMhJDXYbZQM/Zgt/TdIij3xBU7heFsvc+7gsmUiQ41K3jP3VvULrVJls9bwqphtY0XhVqMQli8Qw9044Vbcspi9QaMngHGKVEOioDuE26T6J2TqHVZZKQ4oHkkQ8APkJbB9oF0H4I0b0cRFIJeQ01SJSfJGs2KPwFK0VqCcWJC/4CBIM4RkxScnldVWO5GlDNy8IBmRfw24agVSuR5i1hu9/78Hv8v3yUqo8i8GJSHTqCiJ/vcQ8a0vX0x3M3DmcksNZ/z9kzVo7DMIjTJy1p0YmjZU5AG3tRb0iwY7wOQNHmUvWSxoJhFL+BTo4AwshR33xQ5CLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
Date: Mon, 11 Apr 2022 11:35:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
In-Reply-To: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0048.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75629b95-c6e4-400e-cf47-08da1b9eade3
X-MS-TrafficTypeDiagnostic: AS8PR04MB8609:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB860976A91AC57E006FF2958EB3EA9@AS8PR04MB8609.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	indCEcykcUve+DJh6IVeBg2ErQ1W9BtYlxR69aU0VYl68vxjXGlvLblMT5xmKouVHLELpoopHlLP9uHFAk9YMPvmIRE5s5ufv2f55fVWsXbi/WAjQvQq6CoYj/PUZJmGS3rxp2UyN7XpzyjU7aH1YnKRGuRKbEKzpwMeSLidkkWE5OuG8DFNqRwv0b/vDGTl33X5DgFqXuSU+KGqLf32IJI7P5QCDcAV1UujOcM9t/OQrLN+HYAAxC06s/KRX8IvSKjTon8yWVVNbs+tKulov7ht9BT6BTwhFke5OlYyzQQeMipDXRZs6jceH6+PVX/EbdCDLhigW2IHDnyKDuX8DSFWUSakHlGhcu55B+xTosmXVZU2iBWerKdAaiM5VMVcOyNXGnV1Pu65xw44fH3XQER+7C12OH3Pt8iD+yo9T9l3AEMESMA+CW31rWn0JF2e7tfaBGOyNb2VjSu0AmT1V0Ei//rB2L6OJbn8Ce9ZwD+fzNi29HTG7b5F3H2aRi/dBmSj/RzASv3lHvUkJf4keWG9ddvIykD6D9hkThWFQ2UWd/Lsmpy3pXWs3Gikd4l+q6LpEGan1Y+irl2p43QhR75HK05UvGQA0ojv6bV5P5GD1Oi3HEfqLXnm2AGzcr+3bhWfH9KYwd0WsjYLOQZGszj+Ma8CV/j1seKTPlQkN8WMf2pfnR1SNdaIyrooOl2RNIHZCwEVWvWw1HajaziH6cabDlAnpZUf9kASE68Zvgc+IXZkzsZ0DslLJEGi/e0H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(8676002)(5660300002)(54906003)(66476007)(66556008)(508600001)(6916009)(38100700002)(4326008)(66946007)(316002)(2906002)(2616005)(83380400001)(186003)(86362001)(31686004)(31696002)(26005)(6506007)(6512007)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEhFamRKeWJlamNIU3l4aW56dlBETlBLcjJaOHNZQk5OREh5ZmJaZ3pIZ09S?=
 =?utf-8?B?d2NQV2pILy9EMlgyeGxxbmcxdFJoNHQ1alNUSkhIQlJnazlTSjBkT1hreTRZ?=
 =?utf-8?B?MGFNeU11dG9YaUFpZ2JDbHRuK2sxWU9ZdWpac1N5MDRBMVE0YzRxSFIwZXRH?=
 =?utf-8?B?b1lOV0VncGpncVlZZ3pmQ2V6R1MrYUt0NFA2WG5GSlVBWnRXMVRTZ212YTNM?=
 =?utf-8?B?bXcycnlPbVhmMmJkRWhtei9FWXhmZTZZSlBuN0xDY0w2WGwybWtjcmd3VjdB?=
 =?utf-8?B?SzArWldJcFI4T0xhNHdMMnBRM3RhQmllSVI5TWE0a292cVVOQTVHZXV1VkFF?=
 =?utf-8?B?R3hNaytkMTJ1WUNidkdHVHhRSDBlZXB0UXlZWWt6SFMzckM0Vlo3WmVOdmV4?=
 =?utf-8?B?em5FRTNXcFZCWi9VbUZoNjFGV2VXRVRiUTZINFhjTHVBQjdxMVlvWkc4THlo?=
 =?utf-8?B?M1lOTXVhTkEvVVdjRWVyUVNBSTlxa3BjcWxZTElMNXVXNjBLdUUrNWRIdWE5?=
 =?utf-8?B?WlNHbnNIa2h1N0M4aDgvbXB0WE0xalZGNk1QQlhjZEhSc0NtcGZCeEphV0RD?=
 =?utf-8?B?K05qaUdFYllnYVNSYU9vVWV2aTZuSlRkZmpRVE1HRk05SmdJcGxEcTJPUW9k?=
 =?utf-8?B?ZUFNcXgzL0JSTUZVSXF5Vm5iTGF5RWlPM2dEZUlZVVEzUnJUNTd5MjNLajZu?=
 =?utf-8?B?TGtVNXdWdG1qTmozb1FVVldOSVJWQ0FNbHEySVZQNGU1VVBnYVIzdUdydU0w?=
 =?utf-8?B?VUR5bm1xanFhSVJLYzVSUGs1UUdZS1ZIR0ovWjR5cXlSaVB0V00ydFE5Y0RH?=
 =?utf-8?B?VUFyN3hVUVBNRWdsSnl1SXI2UFR3VTNqK2dVeVlZKzJMK0JFdjJuRDhTdEMz?=
 =?utf-8?B?MzRNRm90S1JiRCtJOEE1QWVXMXB4am5oemFvV0lxZWplSjAxRGpTMzRpWEZQ?=
 =?utf-8?B?WTQ4eUJ5RFRyQTJSbkh0MEg3L09QSUxqSVFrNE8vZHR2UG1vUXo2dGdOMjNZ?=
 =?utf-8?B?Z1ludStBWktSQ3FVa3p0ZVZQdVBQdlRDWWhaSlY5MEVTL1hFNDVIN2VQK1lC?=
 =?utf-8?B?THFSSXZGWVN6UE50a1MzTUFMamkzdk4yUjFmV3hkZTZjNmk3MFAxMGc0UjdN?=
 =?utf-8?B?eDJpYmRmcS9OODhiVlBVQlpZSmxSN05jem1MSm1MNU03OEY2aXZQRmRkSG9o?=
 =?utf-8?B?aFJGdU1rZy9LbmtCVmQ3Y2ZNckFpOTZsNWl2OWxKNlk3TXNBcE80dHpMSVNK?=
 =?utf-8?B?ck5EVk16L1JBRTNsbllHVXowWnp1cWgwU2loTjJSTzlpK2wvQjVHVDNtdWZx?=
 =?utf-8?B?dGY1UytPY1A4dU92Q0poQVFJcC95MVg4Z0pqbDIrcXdDVXpRTHBid2JCcCtn?=
 =?utf-8?B?VkJSRzlqQm9vOWdJVXRKcE4vUlNxWG92SHJmcFBoTzZkSlRzcjlUNUsxbnhJ?=
 =?utf-8?B?N1B3a2xTckFWU0RBYzNwVldSQUkvZWdwK3VJQ2xPYW04c3dDS0tBaDlOckZh?=
 =?utf-8?B?aktrZkdZTmJFbHBidlNSSHdCS3ZaWjJ3UjlhM2tBanh0MkxIWXBYMVdzU0Ra?=
 =?utf-8?B?QmU2Ukc3bUtZd2ZmUXhCUUw1KzFlZ3YyT2ZBRWRaTnY2VmxHU2pXdUUzR2x2?=
 =?utf-8?B?a3FpTi8zSXhaV0hsSHRDOGkxYk1oU3hUTGlVNDlBbmJZSUZaR3RPcGRHQkVT?=
 =?utf-8?B?YmVDTFUzZXZrS3RFdXdDNzVtdGt4Q2txeUVPK2JPTjFoM3VpZWNQU1h4ZGdu?=
 =?utf-8?B?Q1Z6VVYzZ2Q5SCsyVXAwb3dFN055K1prdnR4ZDVGNFpsOHVIZTM3NkdKdGlH?=
 =?utf-8?B?VUFNallva2FvR2pUQTVnRVZvbnA2N0pRQ2M0dnIxOFdZUHlPM2V2Q0VKOGg1?=
 =?utf-8?B?REQ2VUtuWG5JaXZjdmhvYmNRRmtidzQ0ZnZ3WlkyajRRa2x6dnorQ0k0ckRZ?=
 =?utf-8?B?dlZ2cFVhQko5d094RFlnV3hpMXJtaGxmL0NucGpScThObXdOMzJWTGtxOXRH?=
 =?utf-8?B?Q0swaTFORmhvc0U4SjJmbTgzKzZQNk5ZUk5BUlJyMWJEVjV0MUNBWlN5K3RE?=
 =?utf-8?B?ZFJkR1RUbGs5TjdrYnZ1NlJ0ay81SWIxZk5JZjFWOWgvanZYcS9wU0xFTWFS?=
 =?utf-8?B?c1B2SCtJbGVaemxCTVpIWGRYM0w4RGZaS2V2RjArUnZJYk9uTndMV3lsbTky?=
 =?utf-8?B?ZDV2YTVQaTI1MlRlRFJpWVpyeG1NR04rRGFnRGlQZ21Oa2RNUGxLdXRUZFlY?=
 =?utf-8?B?MWRXY09paW50c3czQVhlNlNiTHl4RmZ4QTZpM3ZhNU9uMTlLbjU2RkRPR0ln?=
 =?utf-8?B?QlZaeElPYURnSXZiZEZsbDFweDRTcHlMT2VsVUxRUFM5YlJzaEZUdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75629b95-c6e4-400e-cf47-08da1b9eade3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:35:56.3298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1796AaLqMAXa+Omo6Pvs370fierqwpmmWJVtAmWfzxTQogaFuddFatWEt0IEQw/dPvbGrQtqvAWbNpNwoidMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

Prior extension of these functions to enable per-device quarantine page
tables already didn't add more locking there, but merely left in place
what had been there before. But really locking is unnecessary here:
We're running with pcidevs_lock held (i.e. multiple invocations of the
same function [or their teardown equivalents] are impossible, and hence
there are no "local" races), while all consuming of the data being
populated here can't race anyway due to happening sequentially
afterwards. See also the comment in struct arch_pci_dev.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -699,15 +699,11 @@ int cf_check amd_iommu_quarantine_init(s
         union amd_iommu_pte *root;
         struct page_info *pgs[IOMMU_MAX_PT_LEVELS] = {};
 
-        spin_lock(&hd->arch.mapping_lock);
-
         root = __map_domain_page(pdev->arch.amd.root_table);
         rc = fill_qpt(root, level - 1, pgs);
         unmap_domain_page(root);
 
         pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
-
-        spin_unlock(&hd->arch.mapping_lock);
     }
 
     page_list_move(&pdev->arch.pgtables_list, &hd->arch.pgtables.list);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -3054,15 +3054,11 @@ static int cf_check intel_iommu_quaranti
         struct dma_pte *root;
         struct page_info *pgs[6] = {};
 
-        spin_lock(&hd->arch.mapping_lock);
-
         root = map_vtd_domain_page(pdev->arch.vtd.pgd_maddr);
         rc = fill_qpt(root, level - 1, pgs);
         unmap_vtd_domain_page(root);
 
         pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
-
-        spin_unlock(&hd->arch.mapping_lock);
     }
 
     page_list_move(&pdev->arch.pgtables_list, &hd->arch.pgtables.list);


