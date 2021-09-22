Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1528414605
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192435.342871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzK7-00065o-VM; Wed, 22 Sep 2021 10:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192435.342871; Wed, 22 Sep 2021 10:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzK7-000635-Rd; Wed, 22 Sep 2021 10:17:55 +0000
Received: by outflank-mailman (input) for mailman id 192435;
 Wed, 22 Sep 2021 10:17:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSzK6-00062x-5B
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:17:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5890668c-1b8e-11ec-b96a-12813bfff9fa;
 Wed, 22 Sep 2021 10:17:53 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-or5aBoWwPqO6SHe-yooqcw-1; Wed, 22 Sep 2021 12:17:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Wed, 22 Sep
 2021 10:17:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 10:17:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0131.eurprd06.prod.outlook.com (2603:10a6:208:ab::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 10:17:49 +0000
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
X-Inumbo-ID: 5890668c-1b8e-11ec-b96a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632305872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=or78mkWgiZ0tw8GzqU9/omJtttnIwfRDs2Aq8lzGU1U=;
	b=MbKhPPGrz6A1M2QEqZIo91Seij94xONIDj+pFzlHq4axePAz0a4g6OawxZJ25IpClJqRMg
	WAlnVRUTgvP+JrG/r9JPAw3RsM4ZaKd1b5Lx/qrOZ8qPguSDdurWj5NoK27FRO6zqN66xf
	R+sOWsRIfaAkhlUiFlb+oN0CqNaYha0=
X-MC-Unique: or5aBoWwPqO6SHe-yooqcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pq42DDIJGOaxdlRTTXAtesDsX61o5He5iwNuSu1IvKWr0//tUA49NeO6CQT6mok2F9w2uUgT95mIo2bWc+QthDBNOZ9RrPgsE2ZZTcNaPxDLqhW6jvvpA+Xt9cB2/0kgIAIAV7BfZl7jwbxb0pDFBMTXmdXwYs2ZHCCWWg7ELb4EU+Ii+Vv7BGSh4ZXWQkt9qGbTEQU1A/MKN4z3PeAa2FDjlpu0G/fobBkaWR7fz2lLILbIHbkqBU1OzzdX54azdsqw77FJWvl28VtC7mcBxKxVcd71KoavNsSXo++W5HqPgMJl3EUngfT4PoRc1LTbyoJZuOPUXmJOPtih5bH4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=or78mkWgiZ0tw8GzqU9/omJtttnIwfRDs2Aq8lzGU1U=;
 b=Bh9cC/Eybp/sXaq0Me5/3lkwwy1yg+YY1GdaRptkJWHjBn8N/n4qEQMdHtz/iWFRPawgyolq3PcNJK2S9oJr00CgEEl1sR6sMbI6GADZqqWp3komYglF2DJcWsRnDGoHw8AMdm1dXrCNEEWpAnPvs10V5fXYCpvKHeNxaavQAJd6pgVgES/75bJzZwGDTokP4XwPMlHOVqXI6ceUB+ilIf563CLbVp2H0dm/iESvC9DCQSvYCcyUUpaheUwfrv6ctfspK1BNtQ5iYs7H5nvYw/QZmtqJMfNmxjz7AZLg1RPQ7ifVJdaa+1yXa95xlvg64f6uW+0GKkny2tHPW7/tJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/3] xen/privcmd: fix error handling in mmap-resource
 processing
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Message-ID: <aa6d6a67-6889-338a-a910-51e889f792d5@suse.com>
Date: Wed, 22 Sep 2021 12:17:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0131.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1b81141-4f67-4f24-d285-08d97db23af0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4190F549AAEC8D89F27F8061B3A29@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vzmey8F4XxSEclZIYX0Y/bNPxOlwfO6kBi7n9FD6Z2d5z3q40SidvZQrCrNEe3cC3cyulWDOOcrQ+YQWCJ9QMzNQKsKsSJzBLfNZoWV6bv///Cppt/hGv0pBGSLA6Gk0k76ordvSQnP0ZrC1xlTREKbcrp3AXocLJQo7Yqupl43qoHfBc8XP4nwojsLXrPcjQTwy6RWzRqULJjsenaBqvm87S4s+c0K3smgBT4EEF00qAwUDxo698Wz2D53jVzBZBz+Q4swHDWHO1K+O+Sv9WCbjKYc+5iHwiH0W53QsJJm3WGXie9PS2zZs/3ZHU5HleOSYEBrlF0JteYDahY2YjWlpnhlT8Q8PNpIbifWXS0GZ/sFyvG3tDUU/rQXvbK/63vyrhTX1yVWGOxvVEos0rqAwxMM54U1I9V+XPm/MmF4vOoMZbwT0j7xG63ew1KUoyyi8kTLM0mM2inbfMqBjn2YlHUqJN/TindTWXrOpNv5aLeM9vTvWfvj+JB9IpqXv3mVLu118U8ndLYR7KHVW1mF+caDM7gLCf41a/OvExgPyB95cXXBqxZVwYrSppNy3qVnqYtd2u025kSrH7kbEZoQb802zipUuYSIYH0iU5B9WJ7HUctsdhH/oIW7EBkQ8gCbclDMv4RM2gctJnguKsmVS9RLhhqsjETnScHpiaa5g4j+P5m/czEu6QX3a6yhhsOtUfho5zcQvfVRu7sIhxCKvjhxb88WwvwEs7M+zhT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(316002)(26005)(8936002)(110136005)(31696002)(8676002)(6486002)(16576012)(186003)(508600001)(5660300002)(54906003)(31686004)(66476007)(36756003)(38100700002)(66946007)(86362001)(66556008)(2906002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXVraHVkZ3VMVEt5bFFlWllWSEpVUjMwQ1RpWXZqUCs5SWtYblNuMGd0ZkJJ?=
 =?utf-8?B?dndQQW9nN2NpRyt3NllkSGRqTWZFUXZoYkIwVzNEZWlOWnZpSUtWM1pCRTBZ?=
 =?utf-8?B?OVpHbk1xeGtGMzRvNnpObHUyNWZUVnNydFdvRlYxaXl3YkFselRHNWQ4Y3hl?=
 =?utf-8?B?Qy92VEVWc1BRT2VwU204T0xSSTNjZERXUUViN3d4WTNxNnFDRjVoVE1rcmNF?=
 =?utf-8?B?WU9WaklqZDdRWVFRRGtNVnA1Ykk4TEd3L3ZMaHVzUW10aElTU0dmd2RYVExl?=
 =?utf-8?B?aDFkSThNUzZrQkVZbHRkQ1I5b3A0THVnMVlIRkIrc3dBMjFYdTBEK3JlNG1N?=
 =?utf-8?B?QjJSbENTTWYxOXNaUTJxaEdEUjloQzVQc3o2QTIranVwaVlhc1FHNEtXd0RX?=
 =?utf-8?B?SGhKY2V1MXRwN1c1U2t5QStwOGhNaDlWamRvTlFEQjhVQ2pCU2xjWFpldnBU?=
 =?utf-8?B?dnpPSWR6UjUyU25zaFdVa2NteXowd2dLMHprdE8yVHlzblVlRzNsTndhMU53?=
 =?utf-8?B?clpEZGlvaHdvTUdZcVgzbDdYVy9NbFEyZ1dZSmZxOVVvN3ZXY1ZSQ3hkZS9m?=
 =?utf-8?B?WWlML2swd0E5M1VJTHVzcEZ5NUVVSU8wNllKZW9abEZwdGpBU25KQ0xPZVdy?=
 =?utf-8?B?R3dQMFMzN01EL3Nrd01HakI5aUR2V3hXcmp6U3VsaXhjZkVxZlY0NXozRnJG?=
 =?utf-8?B?RitoZzVwRUJIQkVYWHRRVXU4Y3F6bmg5c0UrdENrU1JqeERMVmFybkEvc1Mz?=
 =?utf-8?B?NWtPSXh1RE51aDFpOVlEMlpRRFRvTllrVk9SczJUQjRLd2lzbGZ6azNnTGow?=
 =?utf-8?B?TXhTeXROMW5DbmFVNTFsWWZtdE16QkNIRHNDRjNhbXdieEk0TW1sK1Rhd0ln?=
 =?utf-8?B?VlFuZGViSnVpcDhVMVEwdThnRVFLRzAyU2d0ZEw1c1kxYmZjZWdmOVVGVysr?=
 =?utf-8?B?V3FpL1FxK1hoL1ZpQS8yaU1PeDVZVExZeklzNTZTTkczRFRndWQzZGhObGdq?=
 =?utf-8?B?T1o2Rjk1SWc4NGk0R0tlbDFReFFzS2dUNzQ4VURkUENKclVMV0M5ZjU1WmVl?=
 =?utf-8?B?eHpydFV3cWxSbmVqSGJubm1BMjYzN0ttelNLNjVQd21KRnllc1hNU2hFSFJF?=
 =?utf-8?B?c09TOFFldlhSTGYzT3ZmakV3TklkbEZDVUcrZGJiS3ZTaGJ4TW5JS096VEFG?=
 =?utf-8?B?VnUvcDgrampoQUpXOXhPc3NaMjhQS3lWOU0zYzlmSHoxUEY4YmFKcWs2SUc0?=
 =?utf-8?B?QmdFaVVpd04wUWRDQ2lzN2VkeGRCR0ZjeVdxeElmRk9ZckYxQjlxNmFzRTJM?=
 =?utf-8?B?c1pRNVhDSmRkYUcrY0ZrendUY0V1WVkzMFdBdXhBYktQMFhwT244U292Q1lN?=
 =?utf-8?B?NVlrNDZhVitVKzcwTGRrVGV3bmZ2UnlwUzB5UEg2TEt3L05UZHdyMVBVU0tx?=
 =?utf-8?B?aVk3cVQ0MkhJdDRDM3oyZ0lsYmJmY2JnSGpMSDczWUpFaXNKNnZIWUF5clIw?=
 =?utf-8?B?K1R3Qk9oUjNtL1hUMDIyNzJGTTBGVlV3MUNzSUNHbEVGaFlwc29ORHNEQUxu?=
 =?utf-8?B?SHh1VnRXR3FTMTAra3M0d1lnMDZMTUFDeCsrUWg0RjFCaTdoRXZhNlZ2c0tW?=
 =?utf-8?B?UzZDeFZVTjIwUWc4R2s5UHAyWlE3MlBEZUl4bVVUbnlseEhOYTRBVTlwUngz?=
 =?utf-8?B?UzcrUm82MkNWSk5hUlA0MThKYzEwTW9YQ285b2V2VW9xNGk0bWJPWVB3SjNt?=
 =?utf-8?Q?1pwRx5AGXYRigAASodJvomU/3WYKujQZgMSnw4I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b81141-4f67-4f24-d285-08d97db23af0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:17:49.7196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDo1bw6H6EUu5BGCJ1Go3BIGApuV6ybSkpmaX66Us4ciSMCt68Qt/1TjQbAqHv81H+OmiaLXjUSECrn3AZGO6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

xen_pfn_t is the same size as int only on 32-bit builds (and not even
on Arm32). Hence pfns[] can't be used directly to read individual error
values returned from xen_remap_domain_mfn_array(); every other error
indicator would be skipped/ignored on 64-bit.

Fixes: 3ad0876554ca ("xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE")
Cc: stable@vger.kernel.org
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -803,11 +803,12 @@ static long privcmd_ioctl_mmap_resource(
 		unsigned int domid =
 			(xdata.flags & XENMEM_rsrc_acq_caller_owned) ?
 			DOMID_SELF : kdata.dom;
-		int num;
+		int num, *errs = (int *)pfns;
 
+		BUILD_BUG_ON(sizeof(*errs) > sizeof(*pfns));
 		num = xen_remap_domain_mfn_array(vma,
 						 kdata.addr & PAGE_MASK,
-						 pfns, kdata.num, (int *)pfns,
+						 pfns, kdata.num, errs,
 						 vma->vm_page_prot,
 						 domid,
 						 vma->vm_private_data);
@@ -817,7 +818,7 @@ static long privcmd_ioctl_mmap_resource(
 			unsigned int i;
 
 			for (i = 0; i < num; i++) {
-				rc = pfns[i];
+				rc = errs[i];
 				if (rc < 0)
 					break;
 			}


