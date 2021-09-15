Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299040C293
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 11:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187389.336234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQyu-0000va-Lr; Wed, 15 Sep 2021 09:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187389.336234; Wed, 15 Sep 2021 09:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQyu-0000sz-IX; Wed, 15 Sep 2021 09:13:28 +0000
Received: by outflank-mailman (input) for mailman id 187389;
 Wed, 15 Sep 2021 09:13:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQyt-0000is-5r
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 09:13:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b7fb60e-1605-11ec-b4ec-12813bfff9fa;
 Wed, 15 Sep 2021 09:13:21 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-v3woC4z0MwWLON-TAE0nyA-1; Wed, 15 Sep 2021 11:13:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 09:13:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 09:13:18 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR05CA0147.eurprd05.prod.outlook.com (2603:10a6:207:3::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 09:13:17 +0000
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
X-Inumbo-ID: 2b7fb60e-1605-11ec-b4ec-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631697200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32ebYhQya8W1RrUzbbQIk60a77c15WTRh4/23DDxt8s=;
	b=GEfoYrpzH6+wUCKjZaLEnGB/YHaK4jHBzfiovhP4TfWQbysmSfZficSntMm4aQEM4XJKKO
	aHd+mcOJ41EdGVoGkFYKnSaQbQ5BFOdcsFnAWy/Y3wYNQ726309+Wpa1Yb3mc3V38965J6
	gnK6hO+uqJ/kUIfG6lxz/6fqq+CELpY=
X-MC-Unique: v3woC4z0MwWLON-TAE0nyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwRwISbZXLP3toO46IJntMnZTALYvIh2Nj/kLOpH1vKwiqSmrh3NQJonKMwv4QTmJEucidi7aaKQqFlKC7n2adKKQVWLpsW0Y8a4/AhQEtXmBEcMk656rcRKvnvj48F/LBqWI6XLJpk/GVQS5Eyqj2rgizBhyE1o/v9ezqqqKzdIgpu6H4HjCodNdChcWrkyo9oAKylKRo5x6CHEyItfcFKOF7RLR0ZrjjYxzlAsYIxEHkSndiqlsb84FzbASCp9ABL2NeQOTTdHWnQUk7+F1Y6qFdS/noupRXjaHGR8PLZejkZIto1lASP4sfJKGP2cIchQuiWuPZBBSTJ737YVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=32ebYhQya8W1RrUzbbQIk60a77c15WTRh4/23DDxt8s=;
 b=TJORSQ5y9HVkQeOC/H0aqi91f4KSXzWYzac5VRxRMDr/8J53fJwg+nJp8qwinmlt5m0W241SyYpo5F4qFn1HMpY6bxzq8ULOtNRiHJJSQqbYY9Ba662zYaa+dK0ZbEy+38s/H+Z/LWdkfdICjMjldSPH21t8ebrtiEcIS2zPHRP1SN6di7gcUeOK1r40AQOKuNgs7n3qezb9210s7OO94cN34qCxdF4t7TV3VUkotCO8pTCY3saO7eXqZRmShKNtm4/Hcnyq0vxguUIb4OXZSTJ5348ndN2EoixrFzOTGDx6YC9bxBdcul3+CyFDk3Tz8CeRIOXlEfP6Hw2eS5lF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/4] VT-d: skip IOMMU bitmap cleanup for phantom devices
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Message-ID: <57c75e32-df31-c886-b2b2-86d0f82a57d0@suse.com>
Date: Wed, 15 Sep 2021 11:13:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0147.eurprd05.prod.outlook.com
 (2603:10a6:207:3::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1cf6ae7-7974-45dd-ea38-08d978290e66
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46054FD28FB1E7C7A796BBC0B3DB9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UcUyzyXHSPmodqNl3UsUYxFvt4tIaT11ttbfrzxQS4tdgIIFaK8HCsy60MX/UAEFCrwz4C7PEqJQQjD2BQ3XfwEOIFw8rleTLtZjfABusPXvcSmnzM1xfQKAzDU14/wllmhkYqU2rtONV9D1/fR8bmKDK59aX3eyQ8RPZTXP0z/ZXsfJavh6HLpx+IvM9tIq54djPbREzlKCAMqagv6B4VXlOGddrQ44cstZUy4Xrwakp7kadVN2vxz1DG2cbaS60ucOSMRrRmVoTYSbvBTfxfLK0ChkMJBVA4AkRMhlcBuesC/RiiEK8qy78Fg60yjfU6Y9NUdcR84dB8sgO/4jZOQ1MajonIt6uPwDgoSI5AKkU/4WchOCv7SBlAPt0J967rIZ4LIyL4mIzu4PthyqAhOsBwASa2zLBcw8E9sfgCFzl0oVAzhyNXzxXeiYqIbF+FySm8LXo42xmT/GIpDB8SSFXU2sbfu6qd5sZTt2vHXgIjsgIid3tRhpr9GjrfQZKHYYkKa4xKUM0O3H9n3xNVaYwPtawDWVPa8eo/uB11ggz+nFKEN+balQCzr3gChMBFNWfwhdFz0PXgWGUKchJMfQ++zvLwBx5m7J4QOI+FQXzSi+YnIf2maKXfd35Sv4vJQUWC74VLTQRTF90E0wxnnxF96CJa8KzAJIxNTtGF6y29i3PYv4LepMvIMUqHCErHrwdQIDDg+NWpU5EyMnnFNz0tfH60h3TaGI3BYH52M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(346002)(136003)(39860400002)(396003)(2616005)(38100700002)(5660300002)(956004)(86362001)(6486002)(478600001)(66946007)(4326008)(316002)(16576012)(6916009)(54906003)(66476007)(66556008)(31696002)(186003)(26005)(8676002)(4744005)(2906002)(8936002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU4wc2hpT1pyT29STnp2bndUTm9iT0g0SFJGZmoxTGFNWDF3ZzdyZFN6OVNV?=
 =?utf-8?B?dFA4MCt1bGh5alBxY3dMY1IxNjVXYXFFUFRFUmhPakhxRURuTkRsalp0TE5B?=
 =?utf-8?B?Mjl2bXZxcGRrR2N5aHNpSmYxeWE5SDFaWmVQR1ovVDgxbmFyMWFvZkxKR052?=
 =?utf-8?B?MmpoMXlZM2pjR3FKTTNISi9vbUdzRDR1Y0F3elZLNWxtbUpkd24rODAzZHZl?=
 =?utf-8?B?dThtZnpsYlZsQUJRK2VBazRrd2hrcUw4N1ZvSlVKR1pOaDFIRlplQWY5V2Yy?=
 =?utf-8?B?cndRa0NGQWV5V0lQazgrdEFYY0tjTlFXeHFNTy9SUE9XTzZ2L1BFTG05bnQy?=
 =?utf-8?B?N2J2Vk0raXFBUmlXSisvZkVTOHNJWm9MOUtrQjhnSDYzOXM2b0JWSlRselY3?=
 =?utf-8?B?OHZJay9qRWJ1Ry9VUjZZNXR5UlZ3a2FMTUczcW5rUmQ2U0NFMzd5Y3lGSkJh?=
 =?utf-8?B?Mm5pVTIyNld2b0FXdWN6WlFVV0tKUFN0L0JDT2VjYTlpVExkM21sNWJsNHVN?=
 =?utf-8?B?dHVkV3A3SmtJOVJEL3ZYUDF0NERsWHp6MkRqZlhUSFZRUTNYUXRHTmI5TGhw?=
 =?utf-8?B?K2k3Ym5LU2tIZGRNdEZVY2lzUTNZM3RsRnlUdE4yRjdhOHVwUGQzeDc2d3FR?=
 =?utf-8?B?azZUbUNic0xFR1Q3d2puMTJCd0JIYVFqTitRRmE0elg4d25xWVhwbFo0QjhQ?=
 =?utf-8?B?dWZVQmMzQ0dUUFVWY08reDhvYjZvNWZoSnZSaHI4QTJuRllsUEhudEVMT2Jj?=
 =?utf-8?B?ZDJIVWJqNnBtM3FOUCtQWEFoZHVvVUJmMFNkWEVrbEJjaUZ3a1lXZFhGbkpT?=
 =?utf-8?B?bFhHN0lHQ0ZPcnNRRFVFbUZrdi9TNVpwdEJWa0Y5cU1VeTR5QTdGeERGbTVC?=
 =?utf-8?B?L3Q0OWFlaTRNMWladmpzcnRQQ2VVMnE3N1dYV21hL1dNQ1J3Tmlmd1YxUlQ3?=
 =?utf-8?B?blpzUlc5LzBXdjBMaGY3Zm5qY20yWFBQbjZMVmVuMW5Sa1lJc2dvTTNqc1Er?=
 =?utf-8?B?bk5WL0NpT2wzWm1ldDJuSm9HRkJwWUtaUFlYT0N0V0xBUjhZbEpvQUt6SnYy?=
 =?utf-8?B?SGxwTWZWdktUMzB3TUc0M25QSEd5VGJ1TWV0U3lZNllZL1BDV0trMWVjeENi?=
 =?utf-8?B?c1pLZ1FUUWxLRGN3VUFJUGlSeWplT0VHWTVoaVdVcGwzZXUwdUhOL09pczVV?=
 =?utf-8?B?QzQrajREOEtGR2piUkpTRmc4Um5DdXM5ek5kVFR4L1dQNC9zNlB4WVhNckxm?=
 =?utf-8?B?Ui9zMzZjVUE4VFFkUDBQYU03alRjcVZnZTVwdGx1RHJDTUhLclFGU0lVRWl3?=
 =?utf-8?B?b3RUdFZiQmZYUk51S2YyTHVSZWhzNllHR1NYZGJac1ZpaTZaazUwZm1tS3dV?=
 =?utf-8?B?UHBKSkZDQ1FkMmpTM2l6c2NwK0dBKyt1Y3JqczRUNURhU08rSDRMMHFrTlIv?=
 =?utf-8?B?Qko0TWRzZHNaLzVid2JMNG9EVlRJNDc5ZENOSG5RQmlkM2ZMWjNITlppY2dn?=
 =?utf-8?B?ZFNXazR5TzNvYmloRVFmc2tZT1BSZW55NkpzSGNpMUxXMGhubjZXaVJqZGFW?=
 =?utf-8?B?V1IwWHRvTzJacUd6Mkt6L0dHazZyejZvQjlzL0dkcUwwdURBKzIrZlZmUDJ1?=
 =?utf-8?B?UzJNdG9pcEl0VGpIZVVQQXE3UG4weU5UTVpOQ0xncDNIZEh2b0lhaWlVdzBT?=
 =?utf-8?B?cGRXTnNud2M0VHZubHhZYWcxSyt3TUJxTkVHZlR2K0R6SVMyVDE4QlBOMjRY?=
 =?utf-8?Q?qeCV2/ADKOEVhDXR/GrKYkasJ1NdKzZjYlceDb9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cf6ae7-7974-45dd-ea38-08d978290e66
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 09:13:18.0783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKtU3fci0huM32s8PK1/Er8KbcFWG+KyjxkpT3Qo5rSorEgdBFwf4v1xfamLYCyllnDTSNCLx9GaNhZCv2nMmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

Doing the cleanup also for phantom devices is at best redundant with
doing it for the corresponding real device. I couldn't force myself into
checking all the code paths whether it really is: It seems better to
explicitly skip this step in such cases.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1733,7 +1733,7 @@ static int domain_context_unmap(struct d
         return -EINVAL;
     }
 
-    if ( ret || QUARANTINE_SKIP(domain) )
+    if ( ret || QUARANTINE_SKIP(domain) || pdev->devfn != devfn )
         return ret;
 
     /*


