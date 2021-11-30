Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7870463B57
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 17:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235292.408272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5if-0006qX-R1; Tue, 30 Nov 2021 16:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235292.408272; Tue, 30 Nov 2021 16:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms5if-0006nn-O1; Tue, 30 Nov 2021 16:11:01 +0000
Received: by outflank-mailman (input) for mailman id 235292;
 Tue, 30 Nov 2021 16:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AOGb=QR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ms5ie-0006nh-Dp
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 16:11:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b11b562-51f8-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 17:10:59 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-25-4cwugFaiPOSFvVtxASZV-g-1; Tue, 30 Nov 2021 17:10:57 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 30 Nov
 2021 16:10:56 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 16:10:56 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0244.eurprd06.prod.outlook.com (2603:10a6:20b:45f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 16:10:55 +0000
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
X-Inumbo-ID: 1b11b562-51f8-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638288658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wX2v+CXmZtuqLTLe/ypVZSOZdElCTK6pbhJs32Pc9K8=;
	b=WyngbVEIRSj1KQ4psMMMHtgKOOpK6eYVS2IktLENBzKHv2tUokIj8YjXCT/DEhN9YCNG8Z
	eJbD1tRHpHRD2eFTk4GhQTT4Q9q2bxhF/lKaInDsjOn4t9JhIAq7paqgUw/PmR8pYnmPt+
	t/HL+kd78DLdpBCaNeM+I0q86ff7juA=
X-MC-Unique: 4cwugFaiPOSFvVtxASZV-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RssAVVZ4Zq6/fv68nZe4LU0qehjGdk1CR33nnpNWYPpsJSfKUC9feZGuMLigqqn5BGV7F3aXjVe4xT+IIlpdWiJtIwyquW8PyPDa4XuiKYrDpNoisjjCuTLQFWlDaMpMWKOlZDQ1AAROXysaYuaB7/dITNuB2gT9EwkKLGeSN9KuUV6UYeZU6efAAp1dxaO2IOxkSbaCVK/aownNDjegf/LS2/cFZCDFWA2SxRmuVPV5W5nByGAl8rGgrT28W28yEjQ/0/q8qg2HLJLQARCx437FK9FLjzcR3QYlY6yZGutHOY4wu8KA50rPmc96vdiksnzchZ4FFWWMbcoz8SviQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX2v+CXmZtuqLTLe/ypVZSOZdElCTK6pbhJs32Pc9K8=;
 b=kzeqwOot+TT18VljJv5Mz86LJX0zCfrkPgx7xXr7XsuqTBLKyO09fRm6G8EXTbBivmShlQNeF4t46qVCOg75/m3zyT1Bs56PzKlknmPcb/hff426YHLG/nUv4KejabyhYhMzqHBPGnfGmtGFVIQBbJZHB3rxk+Vb+UuWkxAT0GVTvujUCebZ7LFTsHdU2dj605EgNiA9jThd3aC2onKHGyuoWEK0UjXFeYDilhI/XcoI7X25lXsgmOFM2VQmePCoh2/ROMpSmIM3++fc24U8t0mcSHma0e+0RtzKYiuQP2pLlvAxJitqdi9dE3P6dcQ9KEM835qw+QUEwSZN6UXhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
Date: Tue, 30 Nov 2021 17:10:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/EPT: squash meaningless TLB flush
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0244.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5401fb7d-8295-4fc3-d9be-08d9b41bfd59
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667122AD1E3F0FB562F409AAB3679@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Au62YujUgPkqdbAfN76T75b4l1UL6v0sZhCR+ZkcdxmkE6CR5z52y96zOdInvKb2mO4T2U5jCFUrtT4uyQi0JisGXKddTYAg5UQRunwqi/sNOlbG0AN2Jn13bGtfSa3TycbOxQJioktrr2eFkIsPGhOVht9SU2Kno4OA+fDT6OwviraxR/ItlhUQNp0HkaftZgHHMb4Lr6IJ5aMHpCCh4gGSoEPRGEBozMHkhzMY81baJB6oX5Cmtk0y5aXkbgGZHWYgtW7gKOQd9mpdZqwRDDt6DfF36Q63uw3mAtNRrWe0V1EXUy2OKAg0xXh8XG/sjRnnR6e5X5prGTvu3KHaEQVvO00LxHrcqEXUbVuP3QNgR79+FI/uu7xkSKDy7KSh6WBUWhQld02/PnA6Wy/GNXu0Jo4xfxW1iOBKjy2WjRrmMmfN12eloHyuOi87LcDHbsn0sVFbSYHybANcKjdVLnqF+tyUmP+Bvj7iMdjjiyhY7PWfL9Yx+u+Ucn7oGAaI9dwfyoevM77FuuewQNkh3wdZNot1fM1QBFFd1Sy9Y3L0qB7fRGPEh0ZMan4+Bkmf8xzCqQajrmTtdrr7Kmg5Bks4fkXjaWoiC7DD8s7ZjuGxhxqui2QH/l1jHRGeMpbD7U2lRyFobm3Urjn0rtrSxw59hcwgajMcYllRxopPyLOYLW2qUfrYo2DdvN6reL7y99ENzbAwEmroXaCRVxeIr3Lk8SmVIfslL6kgbKlC3UY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(36756003)(956004)(2906002)(8676002)(66476007)(508600001)(86362001)(4744005)(66556008)(4326008)(31696002)(66946007)(5660300002)(2616005)(16576012)(31686004)(38100700002)(6486002)(26005)(6916009)(54906003)(316002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEk5bTRJSXhzTGdOWlg0SVJBcktKYU1ReWpWdUpPakJxUVU3MUdKd01NMlE2?=
 =?utf-8?B?VUM4MW1vVVk3NXhZN3c2UGEvNWRTTHVtZnFiWktyZUZXcVBkaWkxRlNka0o2?=
 =?utf-8?B?QzR6NVNwc1NzalRCaGtTMmEwYXhnSlh4RVZjMkVrMDE5R1FadzVqSDBwemd0?=
 =?utf-8?B?VkpTMFdaOFVnZGlzYnhsdGZxZld0Vit1bFJ5MEpUMnEvRTlEVndHQlhpam1l?=
 =?utf-8?B?WDBNMjFzZjZ3Qm9GalFDc1hyUmZyejlJREJ6S3FnL2liMjRtV0RocGRyMWNl?=
 =?utf-8?B?eXlXOEE1clp5UzJUaHZwcUk0RVNRUzhBdHROTGRRZlZjM0RnTEptdmh4NUtT?=
 =?utf-8?B?YVB1WE5oZmgyUm9kYWhxc0J6T0gvL2tuZXNxLzQxNi80cjVqVE1ka0dJUVhq?=
 =?utf-8?B?YUk1R2hZaWhHc2F3L1owc1RYOElpTDJjNXloQWJqSExKSzBVWVBWY3NYdVMx?=
 =?utf-8?B?aWxETHBBem9UaWNSZFFhNCtLOWc1RXIxblpBYWkvUkRyZlZSOXVrTW5aVDlz?=
 =?utf-8?B?OGZ4ZDc1TEdiUG9xaGpacjRTYW5wSGl6QlFOYWRBNWRiOWdkZk9PMFJyQWVh?=
 =?utf-8?B?Y0dQTC9mTHFadnZWaExGYWpSVFJJb3JaYk9ISmR5elhFb0ZUTVh4UXo3WmJR?=
 =?utf-8?B?VjY1OW1DbmJaenBHamNueUNwRDhjT3hMYUdRVFhWM0w1UDMvOHRIamgwRlE4?=
 =?utf-8?B?YUlwbmk1aE1oVDljN2dIU0VhZE9RWkRCMjJrRTNibWJHQUNaUW1rSFEwODFR?=
 =?utf-8?B?UUhCMWpPQXNKUTd2cHkxd1AvWlJTOWNZZzUzRk1RVHNubzlPSUo3N203eUhm?=
 =?utf-8?B?OXNNZVRyaTBVL092WHJDNGJlUWsvaXk2cUtYbnJ4SlRoSlVkMkdWYWJnckRZ?=
 =?utf-8?B?UDJjbDM4Ry9HNGIxUWNTYkRsVndHVWZhTldTWWVTeStBVURXaGVpSEVpY0JQ?=
 =?utf-8?B?NWhGcUtHZks5RmVwem1UaWN4Rmk0ZHhUd29NekRRQlNhM2xFbTZRZ3VDSVlk?=
 =?utf-8?B?SVpXcGhSN0l6RXlnMVBqb29HTitPdGlZUVBYNHpEUnB2Q0ZBOUJUcG9YcVZy?=
 =?utf-8?B?THg1R2pFM3JidjFFTmV2N2ZtTjZMZDgxbXJMSW9sb2VnUWkyTjI4amhZbGdB?=
 =?utf-8?B?b3I5d0ROM1QxK1VETzVMMjB6Vy9RdEU0SjhMVTBSUmpXanJGV2xwdXdxTXhv?=
 =?utf-8?B?ejJicG1sc1FuUks4eW1xeXp4aFBnM05JM1lYbDJBZnlVMDdreFVLVXBWQXZT?=
 =?utf-8?B?VXJGT3RDb0kvL1lTTHhxV3ZqMWpzV3ZNQ0d4V2VCV0wvWmkySmFHU2JCaDN4?=
 =?utf-8?B?M2FFbWRJY3JkZy9oanByQUFySHA5MTVHMkZhKytiV24xbDYxTUVzNytlemha?=
 =?utf-8?B?Q29OVmVZTEtvUUpCTno1czlOUWNTYkFIZ0NDajdHRUtRL2kzVUtveWRENmNn?=
 =?utf-8?B?UUNEVkJCSlRaSnZ2dG1HSUtrSUhRd1lMOEhIaTJZTnNrSVV4clVhYkFEMHBq?=
 =?utf-8?B?T0VkVXBhTTA5ZFpydlFvT3h1cFBzV1hpQklEU2dUSWRRTmpvU2VqVjF0ZXVK?=
 =?utf-8?B?M3diaVh3Mjc1RGdWNFA0Y0o4ZDdGTG5zMUg3MFNYaWphVFNYby9jL0h4UDZT?=
 =?utf-8?B?SXVPRSs4MjBLa2h3QnJkMjhRV01KYnR2cDVuTEl0ZW1PWHBaNmlmNmNaYXRJ?=
 =?utf-8?B?TW5UVVZWd1Q5TmNyNGRMQVpya3lmaXhuNG9oMEZLQTBWc2pPcm1FemxVaU85?=
 =?utf-8?B?VmVDYldoR0s0NGN5WHZEMUxXMk5VZ0VyaCtSOFhtT3h3T0RHa044UFNKNmJC?=
 =?utf-8?B?eDFaNUdkZUFkWVdtRjY2eC93a2theVE0aExPdE1zWWlSVzMrTDZrSnpZSW1N?=
 =?utf-8?B?czMzbkkxUkV4ZFhmQ0xGTUpjL1QvRitrV2psK05JWkxTNEFhdlJEemY1V0N0?=
 =?utf-8?B?d2JWRGR3REVDdSt4SVlTcTVuM29CWGE1d3FhTllrOHNibkR4TmF5dXBQZ0JN?=
 =?utf-8?B?VGE4TGhzcmtxdHVRS1cyNVJWKzJiRVNmU1dxZi9ROUkycnF2T2ZzMVZmOGhh?=
 =?utf-8?B?dkpQZFl2OCs4RzE3QkNzYlNMWDlyWk1QaGJyLzY2dUszbG4zNXFlTjVybUhG?=
 =?utf-8?B?MXB0RDVGV25qWmRvQ0F4ellVditlZG43MDN3d0xUNks3NmZvMThiZEdsZkln?=
 =?utf-8?Q?b7zd3juBiAMOwxP7z+jhc58=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5401fb7d-8295-4fc3-d9be-08d9b41bfd59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 16:10:55.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9z/613/ztaqoawVokm8A8DGqoDLG02HNokjAo/mtE4inOQ+IijQHqN/gbZfnFsRkCKVLUplQiqPVHJEknxyuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

ept_free_entry() gets called after a flush - if one is necessary in the
first place - was already issued. That behavior is similar to NPT, which
also doesn't have any further flush in p2m_free_entry(). (Furthermore,
the function being recursive, in case of recursiveness way too many
flushes would have been issued.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -246,8 +246,7 @@ static void ept_free_entry(struct p2m_do
             ept_free_entry(p2m, epte + i, level - 1);
         unmap_domain_page(epte);
     }
-    
-    p2m_tlb_flush_sync(p2m);
+
     p2m_free_ptp(p2m, mfn_to_page(_mfn(ept_entry->mfn)));
 }
 


