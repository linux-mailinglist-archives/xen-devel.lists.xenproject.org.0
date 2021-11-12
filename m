Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58C44E41D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 10:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225029.388627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAF-0003vh-Hg; Fri, 12 Nov 2021 09:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225029.388627; Fri, 12 Nov 2021 09:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlTAF-0003tr-E4; Fri, 12 Nov 2021 09:48:07 +0000
Received: by outflank-mailman (input) for mailman id 225029;
 Fri, 12 Nov 2021 09:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gYwu=P7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mlTAD-0003th-Bx
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 09:48:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a168f475-439d-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 10:48:04 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-N6Jqk2AONpiKWLYIPehZfw-1; Fri, 12 Nov 2021 10:48:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 12 Nov
 2021 09:48:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 09:48:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0144.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 09:48:00 +0000
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
X-Inumbo-ID: a168f475-439d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636710484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEAtRMfNFzRIgov+4hJ20x/I/cYX3+PllG2qKjsHlbY=;
	b=XXdDAuM/ZLDjAZ6pOIRdw2qZDTP1C7LkQ5MIwmtkp9RkQ/6iNK7pHSU3fm3txh0At81unb
	0HPsFEz571WmIeyyHwiPjs+/nuQlO0Isbw9nZonS7l3r2iUMmxpYtH7QvSYmGBQNvoxKcG
	B6fHTvBYvKRBq3+ieu59CmXHEbTnErk=
X-MC-Unique: N6Jqk2AONpiKWLYIPehZfw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ia4AD7tan9M0ibR4i5R/AvAtYphDG74NPVk9FHJc5jJ+NGS0yzMVbXBNBEA0qbbIfwhVH+vdlLeCyGAw/tzvEyQyO+MmUl7kMkUpCHbs9XbxR/IwIiD5ZSGVFHPLxLRr+RcAo99zgJK8uXPT8R2zmNCL652PnBR1VRRKf3E/Bz8g/12aHuZSqeWndVLotf7HyP8afstB9+BovLZ7nllGZpHKEy6hxcT9SBPpLb3vRt90JoDL47CJthu37PRLKwMYZuoUsUff4nhGcg3+foSF79wbafe2WS/j6wkpx0s3PyarY/rktz8njux0hbc8vbGj14p26ofslinGumt/3pZ+9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEAtRMfNFzRIgov+4hJ20x/I/cYX3+PllG2qKjsHlbY=;
 b=cVQ9nzNWOdB6VJXDlY0Tin/BRBU+zNcLm03Hv0/kXxIerYliPrAchRTawEiBAIA+RKTElrOoSr/6QlVrqPmdRpHAfsu0gmXj/jPw6Hl0GhwZ9nXjnROXLASMh84ICOMMJZRvGDp4dYDIUragnBksqH96EdELIW7VYj7k63pFikPYZRmXxiVf7RQgYQ+VQ8fHENHxpAwq5bIQ/AFixats6eMYbta55ycqtx7xoZqy66kSyAxqnk9N/4bVbq6T3xTQeL2TOUCl67lodHKBYpQYDDO5HfdjldrrxuvCKtXZu945sT11FSSZqrZ4DhIc3SXnULsawiTapVczna1tY0PveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
Date: Fri, 12 Nov 2021 10:47:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
In-Reply-To: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0144.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::49) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6d930f0-2441-457c-6b0e-08d9a5c183e4
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233532B0AFB5E3B86BA70211B3959@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CZsb90AEBbbUKh8IaOvqnFpNkH83kED5XQ/hADwlMJHYyjYK5UT+tmDbM7RpwYBOX9QBFl5ackQvV/GZGs3GKvkRcKzWY3AJG5LbOpU+ibOnbIkJU47CXkOIurGWN8M9qSFRMo+gW83QiNfoWS3unF0f534OimR8IFY4qYhJqnyds/tJVhVuEalnP8BJAnyMjgnsAZ0mHYNNRCD4K1Q6BobZVhnIGLKvCdgGUPezei0Umqn6yjWAYLMdwLmcoEqogxJLKtQS2+Xam4dceh9eEOVpPGgF76XP4QYMuIpvXIwqMHXXWciMbqESzqdCxLiNf4EXTaZOUc2qMciN9zRVsgEFJ9kyF0P/lTny1vmoHo1pdaqccvnEZL+oQ1nC0YYeiD4ivFHlJcScNX31NAm4jSIpCL+imS/lL+hgS0k0/P+SioAHk3snphCzPtiN4uzzbp8102htRNNZQJDxDE2yFvGiNFlx8pZBE4Nzf3hLHQrnQ48sIvr7Yyl/Hdu9RxfwFGW7x896bn/TSygUoZTPxvcdIXBaadIfZWDKLTPUXT0YNcctoLQiM/mMXA+ci/rWd/3DzM62K/7FdIL1orac/eAwYiqlen6LMYdOxGtOrETLitryxbwY8TsESwkVv81L+Qxm0xr9SbrS1umkmNqL6LJVhX26BzcqcjQ4eQKkPCufVWryue7pXa0siP9+qaSZV7keskywUgsbJTnIl1g4lguPCEZB2IyBafaA1eMzZ9c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(4326008)(16576012)(86362001)(956004)(2616005)(316002)(186003)(26005)(31696002)(38100700002)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(508600001)(6916009)(6486002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pUdm5EWkxEdE5meW1ObWowNTdSb3hzZGs2NG9uek90Y1NlOUk4azZMd3lS?=
 =?utf-8?B?cE9yUy9lUG81T09OVmltVUdGdnl2THdqKzZZMDdESWlSOEFTTE9XcitldjN5?=
 =?utf-8?B?UDJBVE9zVG1MRHorcnVNL0pnaVpqRWk5dkRvSTFrTGZHbHVJOE9pZE5XMW1i?=
 =?utf-8?B?cUpmNnB1Y2lMMnZHRzRQMm13WEEzM1UvenlHVDNOMWE0eUFnUWtWbCtSTWNO?=
 =?utf-8?B?NU9RMkhUVW1kMm10WGE3QTRaM044a1NDVkxDOHlxajRJTmo2bW14Y1BJZ28r?=
 =?utf-8?B?L3V2ZUJJdk5Yb1VxSjk0eStYdE5hQWcrb0h0aDQ5bU1TRGNSYVpUU3hONnp0?=
 =?utf-8?B?ZzRWdlJBdlRhY2JrY0xOUkx1bmdxb1NqcllMTGM2WTVjU0F1d1gvNUNJQ1V5?=
 =?utf-8?B?Vlc4NTlLN2lua3BPN25PKzdHS2VvYVJGVEJETW1NeVNLWnNiOHlZNVpnZGU4?=
 =?utf-8?B?dDBiRVZuclViN2hjdWZsdC9OOThRSjRqcXRCQjcrcHY3QnN4WjdsdVMrZzNG?=
 =?utf-8?B?T3NYRDNla1h4R2oycjBoTVpzaUppNVkyajJHOStoNnVnZk1BeEpUUzF0Q0xG?=
 =?utf-8?B?VG1SSVM4OVZXWXJSWmowb3Q4YXV1TloxVXFITHprYmhad1VKRUhoaWZJMTFP?=
 =?utf-8?B?S29lQnhsTVcvVjExb25HaGlUK2FzRlZSclpwL0p2OENncXdoa2FFaU5DbUJn?=
 =?utf-8?B?cUhHU3Y3WHY3S1UybGRoUFltazd3NTFLMVhNNGpiVFU2dmR3bTM3VC9NZ294?=
 =?utf-8?B?L0FiKzR5Zm4rVXJVVmlwVG9Ec1lWb2VHeDBQL0Vhak9ZYWxCaUlja3R2K2Zh?=
 =?utf-8?B?S1NnVDhTRDlJV0xjbTR2eXJqTnVTcmlMM25OTEdWbzl3VzM5N21sbWg0MVpE?=
 =?utf-8?B?WWJTU1BxRXVnaFlWeVhqRnpYL2ZwVWRaTFRzbmhqSlYxQ3Z6Y0dHdjAzaEpX?=
 =?utf-8?B?UE5PeUF2YUQ5TTh3RENyZ05XRVphalByLzJGa0NNNmowQzBnYlE5RDJ2eFdG?=
 =?utf-8?B?bzJqUFk0Mm9ibitGdWl1TFJzQ3RNRVFnbzlCN2ZycnFmM1hKdGdGZmJkV3Fw?=
 =?utf-8?B?NkpwRkw2NUxxSjlKVm0rZUg5dVRQdzRqYjZJVDVwYkh1R3FxYlF0S0Z2azR3?=
 =?utf-8?B?cmhJSFdsOVMxekVRWDh4QVQxRGEzVi9SVGQ2Mk5rc2hpTGtKcWt1MEZ5ZWJr?=
 =?utf-8?B?L2QyL0N1dGV0Tjd6VUZSeTZIUms5eXRLazdBaTdQbUx4VlgwSGtzZUMzM1k5?=
 =?utf-8?B?N1RXQ2R4MkhnaDhWd0NqcDk0TVBSQ0Z1RDRnWSt3TUZvL0txS2EzVStGdm0w?=
 =?utf-8?B?RkIwRVdjWlp1UUJhZStyY3FHbWxicXJ2TmhuZy9CVmR6b0MyTjEwaWVBUkUy?=
 =?utf-8?B?bFh2dU5nbXk1ZUgxRmtsQ1IwYStqYmw2eVRGNVBTUjNHQ3lDbnJwOHlFMTZa?=
 =?utf-8?B?cTdVQjdUQzhKaUJQUDVONU95anZPNHBYMTVGK1RITm1vdVNIbjd2U3NzWmEr?=
 =?utf-8?B?RGhWZmlSVVlHTHBuaTZ0VEx2RzJUM3FJS3BYUnEyQTdXZktvVVBQeWgyOS92?=
 =?utf-8?B?cUVMbkxVRnZ6azRObFNubGxXMlZFbWlIb3hxd0Z1ZjJaYVJ5Vk5iK1J1TFAy?=
 =?utf-8?B?ZThqWFUrTHA4SkEwSkliWitVNUNwdGp1MlFQR0p3MkR2MWRKL25xSElJRXdO?=
 =?utf-8?B?ZzRqaVJ0QXpBenh3N0lOQm9hUjVyZk9PbUkrd05wN1M0NFJLYmtRRkJSS256?=
 =?utf-8?B?UE90WU5iYTA2TEN4UjRad3FMUVpxRXFDd01Xczk1ODZrUEYvRkhuYWpRRFRW?=
 =?utf-8?B?dVYxbTJOK3JsMmgzTHh0aWNpcDFlT0tJbGwxRzQ3NEk0YXcrYzNFcFNIbjRq?=
 =?utf-8?B?cnF1aFZiZnJtMS9OTlZNRjJGMG56dWd3b1VyZnNydW9JdUQ0SHpSSHc5am5I?=
 =?utf-8?B?ak1vNGw0VS9CZ3NPcnJGZDdWOWFFTlhlTDFRZHhvSmw4WDAzZEdvNlZtYWx5?=
 =?utf-8?B?YUUzVWF3RmNOaWdNNWo4dy9wSVcxdG5DN1JIcjRhVk01WE5XcWQ0bFFveklQ?=
 =?utf-8?B?M2s1djZ2bUxsU0c4a1M2ZGtsSFdlZ1ZmMWpHRERTWGRtTlYySjcwZVlpcGU3?=
 =?utf-8?B?Tmg1ZmZpTHN2ZGh4L2xodUNKWjdVVGZ6MEZhWTVHcmFwZFNQNk1RNHBML0Mv?=
 =?utf-8?Q?i3nqfcH3PQ4yrZGxchGq9LI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d930f0-2441-457c-6b0e-08d9a5c183e4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 09:48:01.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qsju1HUcYOrpY0U0zvZpdd4ozh9Wxi8YgViBgeQ52M5vH5IU54XMCxdY0QnOwW9lM9gvP6QvR/oVLSl1EiEgTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

Merely setting bit 0 in the bitmap is insufficient, as then Dom0 will
still have DID 0 allocated to it, because of the zero-filling of
domid_map[]. Set slot 0 to DOMID_INVALID to keep DID 0 from getting
used.

Fixes: b9c20c78789f ("VT-d: per-iommu domain-id")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1257,16 +1257,19 @@ int __init iommu_alloc(struct acpi_drhd_
     if ( !iommu->domid_bitmap )
         return -ENOMEM;
 
+    iommu->domid_map = xzalloc_array(u16, nr_dom);
+    if ( !iommu->domid_map )
+        return -ENOMEM;
+
     /*
-     * if Caching mode is set, then invalid translations are tagged with
-     * domain id 0, Hence reserve bit 0 for it
+     * If Caching mode is set, then invalid translations are tagged with
+     * domain id 0. Hence reserve bit/slot 0.
      */
     if ( cap_caching_mode(iommu->cap) )
+    {
+        iommu->domid_map[0] = DOMID_INVALID;
         __set_bit(0, iommu->domid_bitmap);
-
-    iommu->domid_map = xzalloc_array(u16, nr_dom);
-    if ( !iommu->domid_map )
-        return -ENOMEM;
+    }
 
     return 0;
 }


