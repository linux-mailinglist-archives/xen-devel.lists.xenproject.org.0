Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4B3BC157
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150429.278140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R6N-0001pJ-LP; Mon, 05 Jul 2021 16:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150429.278140; Mon, 05 Jul 2021 16:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0R6N-0001mD-Gv; Mon, 05 Jul 2021 16:05:43 +0000
Received: by outflank-mailman (input) for mailman id 150429;
 Mon, 05 Jul 2021 16:05:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0R6M-0001lp-Nh
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:05:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d889d61a-ddaa-11eb-844d-12813bfff9fa;
 Mon, 05 Jul 2021 16:05:41 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-4-yQsuM0daNaiDx4oti__Xcw-1;
 Mon, 05 Jul 2021 18:05:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 16:05:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 16:05:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0021.eurprd09.prod.outlook.com (2603:10a6:101:16::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 16:05:38 +0000
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
X-Inumbo-ID: d889d61a-ddaa-11eb-844d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625501141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4RpaDeng9lWcvFK84pEeyS4Y5FUQv/CbdN7CkzTyrQ=;
	b=UwLRjneZU9oyXtDDwHpcs07V4LSnMf1PAC9Tuk0pVNzXezv8a6HgWyMwnHVYZ6ZOneKyO5
	M9NbW02SSyxzbmXqJ6pL0+Bklc1ZCCmv/p995zI0XQz7Wyz/vi6RbCqABuCToDynKrLLqJ
	JFQPWHAwK07+N7wvGMvGamxRb3YF4SQ=
X-MC-Unique: yQsuM0daNaiDx4oti__Xcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaY/l8CgDOuH0MeNIF51p8UC1Tx9HVuDubP00DOtFBgbMgYjpZxd4kwV6BDfn322YXzEsexjNqdMm5XBYn/meQWoOdMs6FGsxMTm13+myZTFCviDX5FP5Avadcs5ho/+o9+Bb+yXBxsSiYynSY5P3ev7NAEkb878mDNA5ZiIHt4gLgmNzscqapfpMXjkanQjKnmjYeuw04pobKp/ai5TegCUfB/5Ovm3YT4NRK7oNMK1PzzN54JWuNaG9upIBSXtBJmbJLadAF4oBfZgNOoCdSXs+3E1FZ/UqeZ92PZsx8mME2xYgwPFu868zD4MkgPJGEcj22n7cvgFusTC0R4l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z4RpaDeng9lWcvFK84pEeyS4Y5FUQv/CbdN7CkzTyrQ=;
 b=iKscJRJE5NMYs8pB1ESmibOFyxOJPuSSmfIOGrEgsT/zejvqjPITVm4FNWQOwgMjQaSuEvwzvk5aiDijctUKaM9x/aU2JnouzjLxM9lQRIVMGew3Kh4PQ8kNrtSkdXjNGTJw8IlXYtDKBvgjpyvn2UC7zu5E9ZxFl5hQimppWMtyeSriDIsU2s05DgZdtAwH9GAOEbm/33vVQ4M4P0m3eI81btLgzW/CyddjmFW0KjW5QIcov6oXqqc81MTVLf/LqqjnIj0ETVYtHGbm/ZlqUQRx6mjnp5JIU+3uKx/iYi5Y/j9RlYbXyuqfSfH4RWFCBJyeFzW3j4vNx2IqpLl3Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 01/16] x86/P2M: rename p2m_remove_page()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Message-ID: <fc340862-6842-3db4-1093-d2df44c1aa9c@suse.com>
Date: Mon, 5 Jul 2021 18:05:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0021.eurprd09.prod.outlook.com
 (2603:10a6:101:16::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb5d391c-3b65-4826-aa72-08d93fcebb29
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6861D44689BD7C2DF25C6661B31C9@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wEbP80NctPr/Lc+EQsq/uLfvi2N2W7lO0llBUJcQjsOdQ4lnQpnIzbq05aRRhdmHxwRoWG6KoAr+0sSSAAfsTAcjd2TVEbGmTl5xHCscrZD5RI4or8n1CKfhz0OWVzEmB3AJN5L3fIcI7U4O/3vdgNDVbA1OV/lYXrjDsb1MMXThgDC17bZFPBnNISC6Ts/tHpHfdL3uZoVeKPoL6r+AySPKa9Jlxd9IDcqDheqaCBA+zTwCUC/+2MnxqF2L/FXB3OiqqAamJCi3vWIhagzZ7D8xZ/9gYzE4pqSKbeNBSVc0BDP64UZ/SBTCv1SLPSbRRB0W5O3+E8nvOOd15XXqjAu35gW+S6oZeueqUFVV3DaXe1SFZMjDcJdL0jlhF1b/vTf1rW5enoGKfLX5dzfe6mukPWT4BB/FRPUFjnAALD6EfQz9uSUkzRGE319WKMJfauusew/xd0REeV0OSp+LipVBMwjSWAJtOtOAeir8tXAxsFz05DXXAscmSDcx0S5py0AE/tbIno7CsiU0YeZP90PQatTNjlAQbXhH4IByCYKtdy57nXxBkiLvGCRButjP/HzaCwaCl2gUwwrQAOHzfH9K8tuXMVHW/Ire/VidLUU2VEu8ewLPRAsHPOG4w8XW2DYDe0UILUXutFpJqX1u0GkBJys/4tH4gDINpBg0dX28EYTKijdhFB8R6iJkhPQVx3NOVesy8VkUdhFaqmq9f7bsN1YvaBT+zDNY9hU8c00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(39860400002)(136003)(346002)(396003)(66556008)(66476007)(86362001)(66946007)(5660300002)(16526019)(31696002)(31686004)(38100700002)(26005)(36756003)(186003)(2616005)(83380400001)(54906003)(478600001)(6486002)(316002)(16576012)(956004)(4326008)(6916009)(2906002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0VHZEwxQkZSOWZkTXo1L0MxREVJN3N6bFRsTGRqVFpNaHhESlhJMkRIUWM2?=
 =?utf-8?B?M1ZISzllWVRSaUxGZEd6YkN5Y3ptM2g0K3R1L04vcXphMVFMdzRETjJacms5?=
 =?utf-8?B?Vy9mTmNjaFgwZlJ1amhWUUN1TmJoZjkxdDZnZVkyZUxLM3U3NWlETFVIQUkx?=
 =?utf-8?B?ZGIvSjNLV0dsODlsbEN2ZWhua1ZlYU1qWERIVTB4NUV1aHZOUzZFZkI1dUxB?=
 =?utf-8?B?V2NGcnhCZVlaTmd0bUpKdCtXL01ZTjFvbDhFa2paVnhwTEE3VHEraXZadDdE?=
 =?utf-8?B?VEhoelFPMWxUK3loc1R4cVhRMUEwT2k0VWRGQnJCblhDS0o3UERoRXFjRW5r?=
 =?utf-8?B?R3ZqNUl6RU40MERNYVZTTjUxYkFUbkNCWG1EL3FWbFJkSTM4bldjRDVyYTBv?=
 =?utf-8?B?RGd2N21kVUozK1VsK2VuZHRsaHZ1OXJlOEdPcjVERTBDWnkrMzczSmJEYmlI?=
 =?utf-8?B?cjN4M2RXeXZzbmtRQ0Z3eDZFNzFuSVJhcE91M2Mwbk0vc1lkc1p4ejRQTU1Y?=
 =?utf-8?B?eTVjNTNDVG5kNkc2UnFveDBnTzlIVnpzWHhWS1ZtVHM4QTh6SlcwRlZuVnpl?=
 =?utf-8?B?cDZtL2t0OEVLWjczeElKZ1hYWFc2R1ZwdlpjY29pWTZXWUVnVHdxUkhiZDFK?=
 =?utf-8?B?QjdCMjQxNXI0eG1oc1I0WlBOMVFUOFFOQVc4M0laK0pMZHVmT1FDUWpQaFVF?=
 =?utf-8?B?bWlzWDIwMFkxV3A1V2p1NkQ3TGMrLzdHMFlGSXF5TGJwRHdqQXQ3aWp3Q05k?=
 =?utf-8?B?emJYbFJuajZCRlBpMlJNaXFicnNXRmI2c1duY3ZlOHdGckgwYjdTTlVSUUNp?=
 =?utf-8?B?clJtYUw0RytsSDQyR2d0R2VHajhEbk5CMElhejNqQ3VPd0xucXFpQTZGZDl1?=
 =?utf-8?B?em8xRDEvdnh0RGk1dTkreTB0NmU3eGowUUEzZ3pQRkF5TVBQMWMwSTZtVTNW?=
 =?utf-8?B?YnZNT0RjN2I2eGhtYnl2YkpxcEFtTG5BYTlrd3paR2hUNTZHSTY3ZjRZMngr?=
 =?utf-8?B?ai9hSC93bUNRNHNsOXpGb3daN3M4THhSV2grUXI2OXFnS2QvTEZmNCtyVnk2?=
 =?utf-8?B?TU9WUHpZaXNscitDek1DaEFkak5JbFU3WTc1cVBVSi96RUVTMDBMeHkxR1h6?=
 =?utf-8?B?Q2JTbmFaZmxBSm5GRjZGVnVuZDVHUWIwNGxuK2JrUkIyYm5QaFFRQjRDODVq?=
 =?utf-8?B?ZHBwUlVaODlrei9Zc2hDcWlQWDlpMG1WMWMvYk5wcHB4RUFrcUZsRGNzcUNG?=
 =?utf-8?B?ZER5MEFYLzBZRVRSQWhkZkVOOGE5MW5VRTh3OEVEd1NGNkEvRTkzWWYxWEpj?=
 =?utf-8?B?dUxNY3hQN1lvZGowOGZybURpNXZoc2tSMkdPQVdaK0xHMG9oZlNwd2phNWF1?=
 =?utf-8?B?ZUdqWjYwWndYalpWaUNzT1U1ckRHZTRnRjhBWGM0TXNsSE95N0s5clg3bm51?=
 =?utf-8?B?MDd6QnFDZTBEVTZaMkRadFhjdU15VEJiS1dtU3ZEdW9vVjFwb1REYjI3TUg1?=
 =?utf-8?B?dUNVSWJ1QWMyekFZL1NkckViZTR3dGVIVHZyTzFSWUdvdTdFWGhMSU4ydVBw?=
 =?utf-8?B?TnFFaTQycHBHZmY5c0NBczlpL0dJT0txSjdFQWVJUlBRaTZYQ0ZHSUhHRmRq?=
 =?utf-8?B?cEtQUHlDcEpRWDZ2eWdvci8xcU5mVGl2eiswOVpuOG53VSthQk9ZN29KTUNm?=
 =?utf-8?B?TjN3MFhwRmw3RFNOTmlXRDlRY01kQytVbSsvanAzeUtFVmVDSU9WTXZxeitv?=
 =?utf-8?Q?Gj7pVI6ufU6KDQn+Bb+uoFappoEx0gI1NcDKetV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5d391c-3b65-4826-aa72-08d93fcebb29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 16:05:38.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zOFLAA2APgav0dUOZlIWgUnGAelljeprCzswQbtb5GggJyAeJ7HpgkCyoGqSkyEXSQSXFaU7in2jUnEicS9oZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

This is in preparation to re-using the original name.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -788,8 +788,8 @@ void p2m_final_teardown(struct domain *d
 #ifdef CONFIG_HVM
 
 static int __must_check
-p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
-                unsigned int page_order)
+p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
+                 unsigned int page_order)
 {
     unsigned long i;
     p2m_type_t t;
@@ -840,7 +840,7 @@ guest_physmap_remove_page(struct domain
         return 0;
 
     gfn_lock(p2m, gfn, page_order);
-    rc = p2m_remove_page(p2m, gfn, mfn, page_order);
+    rc = p2m_remove_entry(p2m, gfn, mfn, page_order);
     gfn_unlock(p2m, gfn, page_order);
 
     return rc;
@@ -1009,7 +1009,7 @@ guest_physmap_add_entry(struct domain *d
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
                 if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
-                     (rc = p2m_remove_page(p2m, ogfn, omfn, 0)) )
+                     (rc = p2m_remove_entry(p2m, ogfn, omfn, 0)) )
                     goto out;
             }
         }
@@ -2382,7 +2382,7 @@ int p2m_change_altp2m_gfn(struct domain
     {
         mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
         rc = mfn_valid(mfn)
-             ? p2m_remove_page(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
+             ? p2m_remove_entry(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
              : 0;
         goto out;
     }


