Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5BB402840
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180953.327858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZtP-0000RZ-Ku; Tue, 07 Sep 2021 12:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180953.327858; Tue, 07 Sep 2021 12:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNZtP-0000PQ-Gw; Tue, 07 Sep 2021 12:07:59 +0000
Received: by outflank-mailman (input) for mailman id 180953;
 Tue, 07 Sep 2021 12:07:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNZtN-0000ML-Sa
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:07:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38d5356a-0fd4-11ec-b0eb-12813bfff9fa;
 Tue, 07 Sep 2021 12:07:52 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-mTLXMExqNMKKhs3PsuV5vQ-1; Tue, 07 Sep 2021 14:07:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 12:07:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:07:49 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 12:07:48 +0000
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
X-Inumbo-ID: 38d5356a-0fd4-11ec-b0eb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631016471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5oNHcbLsqo9M2lUcfhAAuumf4VaC3DcQDQUojVuRYU=;
	b=G9E91MBOpVZjxwi18BVIxBH8gw+UsdRqt/pYQuVCDK2SKrJYE14LIndIDn+v9/t5oDx5NV
	rfJO8Mq6MFvU03WtBz4se15bUdbwPNxKsw66rMm15z4h5AJXHuNNcOEIAKA7MpIyPrSScW
	vUE4/n0++y/m5L6GfPYpls5wEFCAwWE=
X-MC-Unique: mTLXMExqNMKKhs3PsuV5vQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbjHdUoBL+11rFy2gY9B7/5mScKhF6tDW8jzwh1MY89QgITtmyPuTtKBW0xg0Vu5cMuSraCSMBABO1E2hXH+30s+8L6rwE2hVLfRVeNDJx/I/zvguIlsa3RWLK1qaiZf43GUfrhsA+On0iuek9DjDTbnx2mL+TgUGnQPXjw2orNJ3zCLRz1ML/2WdmiyQ3uhws1+F1ngN0cWzsSwnk6uv4+opDLPzCW4OwKNmKTIP42kGvU4XDG5toyu7ES825sr59QPhB+buDuo9v8t8OWS8QbsAcUKg0KNL3ibMPAeblCDggQV3uRWL2ocXD7wyJb1BJOigXbJy5nPdRB3iQHxwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=/5oNHcbLsqo9M2lUcfhAAuumf4VaC3DcQDQUojVuRYU=;
 b=OYZsiqHbMNHHvzMyUyXzyeazn7kelTM4uQq6MtiiWZxOX6jf2C5kbafG/gmmVLOt0qu2gDfVbiTdyDWPRsrfuBXYTEV1BuHWocO2tolkw2gvouu7XIdzHPaEuS0Vr8Mn3yrx3eQFA6fcNA5lZglT9DtdoZsg3t1gO04cdF/Hu+hjJg++yxteefVe98DrGI6Wm3U4fnVsL4/XjcLDI2HtzFaQ1KR0E9JUVnAISYO/5Y7dj35MUZMpsmnUlcSUrDpC0tvcd1GtzOBglkN0mR2firbjOfEct+BCrCfZR9XJgVCoOj+B1dUKIGIY/UxJtUg6GtvnJwwh0b9Yeqbe4OIYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH 09/12] swiotlb-xen: drop DEFAULT_NSLABS
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Message-ID: <15259326-209a-1d11-338c-5018dc38abe8@suse.com>
Date: Tue, 7 Sep 2021 14:07:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::19)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef7924f7-8733-4ea4-740e-08d971f81c50
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2335403C43EFB474C5E60388B3D39@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P0wJiu3kiYlboYr2V/LGfu1A/YJF5KRBBcMhqlGVoTiAr0Vu5FfvfS8TSTyBnK1SyjAtdi3AIWl4NwOE3poSa+zGquSb/JwTvR3yeTkOKcRauRful66g22/Klc4GTLEfGu/VeZqi2Lnrpt04Bywau/h1f874QuFscuwt+0tsKwMeMmmGoBVW3MernkWTi98XvfS8BM0o1rcIWaVrNTZszjhlncLspkrs8fI4dGGy/wbhCdJIHchJN1Ql9o4SvjTX2DAELjMIUcg4euHK/PEMUpSM9b3oZrB8gkozpNyohgHb9HNklrIGGeEDDbwVNHfplXTD/lr1luNtFY9d8a8Pxfzlc9fYiQjcDp+83eZMqvaneoLypJM+WETb86IA6WWN2Rj6fmq+JI0sIPOTTKUbgb/cMKQRY3FFeNRBXj/jcYvaMraRbgQvTrUHpZ/xR3rPdx3LJWLkzzVMx3wy2KoarEzQtBu+oElfcSqxal+hc/HiPhetAFqC2zKml92pyFS6WYS7xEemWZl4GA7eF+AZ6XCOqoUtSzAvlbpNI3GBYb2vMEnal2ltc6IQWncRlaPTjMEUgSkFVhZMqk14pHSyylv5/oLGi86ZrmyqYjl4Bo2M7W/yPaDfhBAR7ILdSp1J21z1qoY0IuVyM1I5OJDsyCQCq0VcNsaIjBL70K7oZ/eqWC3J45us2gxG6eEiohB6YZJGylwRaKCOidfwVcqUAe5sv2Oj/sR2LZNjC1dKCLU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(2616005)(8676002)(5660300002)(38100700002)(54906003)(110136005)(956004)(66476007)(66556008)(66946007)(4744005)(26005)(316002)(6486002)(31686004)(8936002)(16576012)(36756003)(4326008)(2906002)(478600001)(186003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTdRcll3RnQvVlhlWElSakw0S2NidjhxQXF5dkVHd1J6bm1KVnM3N3kxclM1?=
 =?utf-8?B?YzZ6NzNOTHNjYlA0MEMzTy9FK1ZSc1hhZkdJcWw2SG5sdks1cGsrRnlGYjlw?=
 =?utf-8?B?YzB3UXRrRTBqS3ZiMDIzZ1BNclp3UWo0TG5MS1dIRDBVbE5uNkxUWFpQbVBj?=
 =?utf-8?B?UG1OVml1NExEQ1JYL0hMdHBjU1UzU3N5RWVQay9yZURjOG4wc09JVG5pdFNa?=
 =?utf-8?B?VXRCeGxwUnBHYUhaRWNMTEFEWTk3U2hrSzNBZzhEQStVVXVqTk9kaW9MSkJP?=
 =?utf-8?B?aXN3UENzSHc4ckYvdEREbWdQM1lWVEVBaXI1eEdzRTdvTEQ2SG5MVmVEN2tW?=
 =?utf-8?B?YXBOYTZhQ1Byc3ZzOUpRU1FQMkZjYkwxaGptdHlpRXFQNDZiMjNSZnFFUVUw?=
 =?utf-8?B?NElNbHVmeFd0djdRY0tUaTZNdHBqbUxYUzhDaFJ5bmh0M3BnbW9ERXdya2RW?=
 =?utf-8?B?Y3FGQXFYZ0toM2N5ZlRadTJ4YWhsbXJDaHhrTlB0L3QyQlV5R29Ec0Z0aHVP?=
 =?utf-8?B?TDZ0SitoeFdZQjhhU0pxZUNRUjhUbEp2WmpIYjJhbEo3MTFOMSt6Nm9IVGxI?=
 =?utf-8?B?K2xSQ1hGL2trakVaUGNzYVVPSXNibGo0MUNUMDA0MldOa0U2Nmp1VWptMUFa?=
 =?utf-8?B?cnFwZzVSblEya1VGS3pCd0FtNGRUWUhyMVkrSXdYeFNob2FoNHB5NUlobCtF?=
 =?utf-8?B?SW90SndlNW4vNEJDcXNiTTR2RTQwMnRxTmpKT2pmRE0yOHBvL3B3cHRyQWI4?=
 =?utf-8?B?dGZNVUN1VzN5YmkxSU5lY2xmSDI5SEt0NlVmbmwwUjl1TXlvUjdlSHdzM2pU?=
 =?utf-8?B?Z3k2bkxELzBmZDY0bEVrVVh3bE1taVBYTDZOcExNVUsvaDU0Ti9YV3RhWnJl?=
 =?utf-8?B?R1ZtbThnSDNDWno0MXVvejFRdm1xN0JtN0Z0VW4rT2MzSlR0RWFTKzFhanlU?=
 =?utf-8?B?c1ZUeFc4T0Z6bG84eDdkdDV6ZVgxbFpXK2M5cGtJaHpYREg5bVFiYTFPemZj?=
 =?utf-8?B?TWFucjNXOUJPTkcveERORS9qQitYMHZZak5GMmJSNVpkRnZsYXNDajhDbUJQ?=
 =?utf-8?B?RlNLZ2loczUvbVdERVU3aHM0SnpwR09NaFBkVFJDbXZmQTMyRjJXT09pRU5o?=
 =?utf-8?B?Sk9NMDlHMytXMDBBVDVKdjM4U0tUM00rc1JuYVd4Tk5rdTl2Sm93M29icjh0?=
 =?utf-8?B?MnJmV1ZvY0syLzBnZHdXcG5ZQlBDUFR3V014SUZZMHRialczZFFwVy9NMU9W?=
 =?utf-8?B?dzVPdVYzS0tnVWE4NUxPVjFVK3B2alpIWWk4eXhkZldHQXBFaU0rVnZOVVZW?=
 =?utf-8?B?VnhDWDJ5eUtCZEFyU3ZGTE8rWENkcHdJZ1VkZ0JZMzJ5QUNManpSVTNzSTMv?=
 =?utf-8?B?dW5vNE5EamNyY0RKVXhWeEdVNC9ITkhqOEp3Sk16MkxSVytXamlrWmVjZzM0?=
 =?utf-8?B?TWVlbWk2ZDBhVzQwVS92RW9wMGtjV2FxVnZrS1UwK0k3dzFiaFNZcGorZ0tN?=
 =?utf-8?B?TG5oRHFKSS9ycFBiV1J3eDJ6eG5OUDNlVlFGNnlPY1BwejlxallMUU5lM3kv?=
 =?utf-8?B?MTlINWFvOGtWbWxsR2p3dDBCWXZsN1p5dWRIeU5FT1EzVElyYjlBZlZ0dU5u?=
 =?utf-8?B?VURUczRiSkRlaGFwVGovc1A3QVhFR3F5aDZjY3FaTHBUNUI2ODA3c2xkSDU3?=
 =?utf-8?B?QnZLQXBkTHl4L1dDeUI1UlZwY0c5Um5TSWJPSFYrb01TSStXNFoyRVN5S2o3?=
 =?utf-8?Q?iqC3YEIiT/tUSyh4haYpCigcaQNQuviBwl0CqEP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7924f7-8733-4ea4-740e-08d971f81c50
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:07:49.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8BKWMzefbSY0LRJXWx2Zs2vQu7Is952TijJ4DX9+OI2nh3NvAJsJ3ZUUGA7RR2sYEu0sj7615QNzEj5OnFIiUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

It was introduced by 4035b43da6da ("xen-swiotlb: remove xen_set_nslabs")
and then not removed by 2d29960af0be ("swiotlb: dynamically allocate
io_tlb_default_mem").

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -152,8 +152,6 @@ static const char *xen_swiotlb_error(enu
 	return "";
 }
 
-#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
-
 int xen_swiotlb_init(void)
 {
 	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;


