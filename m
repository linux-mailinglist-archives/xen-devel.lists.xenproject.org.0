Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA654C180C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Feb 2022 17:02:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.277510.474040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu6K-0005k9-G4; Wed, 23 Feb 2022 16:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 277510.474040; Wed, 23 Feb 2022 16:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMu6K-0005ha-By; Wed, 23 Feb 2022 16:02:48 +0000
Received: by outflank-mailman (input) for mailman id 277510;
 Wed, 23 Feb 2022 16:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nMu6J-0004uA-8j
 for xen-devel@lists.xenproject.org; Wed, 23 Feb 2022 16:02:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a9503e7-94c2-11ec-8539-5f4723681683;
 Wed, 23 Feb 2022 17:02:46 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-UhdHrXFQPNGFmR2seDZxmA-1; Wed, 23 Feb 2022 17:02:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBBPR04MB6156.eurprd04.prod.outlook.com (2603:10a6:10:cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Wed, 23 Feb
 2022 16:02:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 16:02:43 +0000
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
X-Inumbo-ID: 0a9503e7-94c2-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645632166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6vAYToK8QO3swRu/19GKo63qRHFt41aiy10HV87R7U=;
	b=FKtt+k/mt/W+HNiCn7IqiNH/mvosaAO0HkT6eWGF+gI3PTZZDpnP85jOD/gac/qvNi+lZW
	T+ZVPiWq2VSNfOdnd1mMfyN33bLItT3TWGabeve+rQVemnuRlcbO3LYIyG7srQiZbHks7H
	A2r7L8XINSNXVCkq+DYZsVv+lt5OkYM=
X-MC-Unique: UhdHrXFQPNGFmR2seDZxmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lE4M7Y/E/EP4dRAhwGVx8/HAqVZLMIdBfzh7Mjn73NQPOCKJX6BDq7NC3euvsWkcOwmW5KoYv7CkEKMnMc43qqz+QrnqxWV6nfOr4dNxLz4b+DZZWTq46++M7ywXhV5GyYL7eniXhlRv5pTgg2c7CHvO7koqLguMMqtg1EOfoLhSyJlayKp6xwQ96vsoQfEIvXnpu4BvZfA0867nyfYKRhaqB5LOWB0vOohh4K7cN7RUjyHfk+919pe5d9ajPyTsBAXlgSBRIou0QjiE3u3BwgPUJOEJHKAC/rclBFX7A94BneWZiNcCHOeChpKw7JENVNqaLm0oVuOzpl/0J3scEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6vAYToK8QO3swRu/19GKo63qRHFt41aiy10HV87R7U=;
 b=anDDHc1VaUb5kZu1bNmewLVkzc8jAVze05qw7bfD3BZADPX4sSWrEMOR3ftTqbl99nvIyIHdvVWgDAO8hIgCLvTmje0WWJrdAdQJoMe7iMPrvhL+qPrB4gdjk/lu6cWQcYDiCN6sBdOMhBwyy18GHG3ElXk1AMXRjlO9k/G/F3Dgzn34vuBlSwjrVjwb6ltr1V+qy5XUaMWyqO0/2lqGIz5Fxpewb2yYP/Cnj2rtOtfIU8EiMbCv8rcHlgnlrm8wJfOvds6ZGywnAZMbLmdzSUXyR4KZ4C13Sw9Cry4M/aYsknq/o0+GaZ6uZAOufhYsRZceW0to5DWVqMDC3es6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04b5ed35-ba53-a0d5-3583-a474f7d08c06@suse.com>
Date: Wed, 23 Feb 2022 17:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 08/14] x86/P2M: p2m_get_page_from_gfn() is HVM-only
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
In-Reply-To: <f4e3bc16-2983-6f5b-37e8-26ac385d4d72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 102f8c07-b6a1-4031-99a6-08d9f6e5ecb9
X-MS-TrafficTypeDiagnostic: DBBPR04MB6156:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR04MB61564711C0CA7E3DCF657100B33C9@DBBPR04MB6156.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AklIItO4QQvKgTTeBw0ZzGpv/xr35tCmmrbmra+xRNjeyaL1RX925QaO8wWp93JWLYGD/GI95oFMtWSeOcNWE2CwpO3UCpdVUJhydtpbSc9CSVUNlR+OWIx7jnS4o7EqQetL56z48n58Eo7F6/koREEmPou2EQoWU2q3us9iWtN4bvD1YpdW2TcMRxfldYPVYxKprlbWYfaPRbYZinJT7YKzzDEK/Q9X8jNkqrKpP1q1SX93GMj661F0MKMGujbzgcA2hCdGQuSGu3MBP4N+8LS23OtR2kPZRjKZ0YAbJa99a4jZKZZdIYG3kJRRCr/pGdeCbL8fHxyTIakqppH0GA9iJXYguUNynKFQYiuj07rLOb05kMNS8imllH3vg9V8AJOF6UVY+SIbzz8P5btiUcQmXrckoUgVfpT46BilGnSuMZy4IEMVcdEE3nZzaPwLJW8tfU3eo1ajnZsLLElvFwBsVz0EHJ1YM5qYtC89opGcXxQmJMwM4IteaPgPNbl8S0/rllQInRtYzzRIS0YlHihmHVwtFM5o57NLyTvi/YnKq84nF1VhPbtZj2KXiaNKoq9citnVrRiocF0Hom/PSNCZ8JlJ+xMdybkjiRFatC4IjsWjSvQ36JEGdF6AsNvGrnPK0GTZR4hZLbn8AHUymA/+LqOd/nu+Vi353Eesj2sHmebMS5U3I0h+VdtAoLmfy3E3xkuFtBq3AV9qendC6hQ3RE/BKCm5JQXtcKr2FfZ19P9S8Ec7XYTYf+UIT9yu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6506007)(2616005)(6486002)(508600001)(31686004)(6512007)(2906002)(38100700002)(66556008)(66476007)(4326008)(5660300002)(54906003)(6916009)(8936002)(26005)(8676002)(316002)(31696002)(86362001)(186003)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2RLM0RTaENxaTJWR29BV3dsWDl6UzBZUHh4bUUvL1owMlBIRzNWWko4cDBj?=
 =?utf-8?B?NzZmYlFCUzNNYWVGeGg2WlhhWlZsS1BOc1p6bHV5SDg3TjVpNFUyc0ZRQnls?=
 =?utf-8?B?UVVuZVhLQm0raTZNL0tlS3V4QzNmenBDeFUyWEEyZVkvWTlEZ1NYMzJ2ZXpO?=
 =?utf-8?B?OG9ybE1oM3NuQzZqbWRVSlBvbHRnT1gwNFJpN0NsZklGYzV0bGRUS3RBTTc4?=
 =?utf-8?B?eHhlWGJ3RWpTOGdDbEdYd0xOV1l0c0dIanJzWllsMUJYN1U0NjB5YkFJck8x?=
 =?utf-8?B?TWJJR0JBVEFoUDZET1A5dXZiWkF2dEE3bm9BWDRCd2trNUcwaFpZVjJicUo4?=
 =?utf-8?B?dW1tREVnRUNrNk0wZ0VMMVV0S0l5bjl1Wlhyc1FlUzJZRVNGcXd4RTBOQllI?=
 =?utf-8?B?TnAwdms0M0hEN3RMZzFmNTV1WHZ5VHpWdTViS1phcEJ6YkNZQ1d0VGVxR0NF?=
 =?utf-8?B?UzZpcFJHMlIrdC9RREtTUEpoZDIxenRwZHgvU0xXS1hEaXhhTC9hL05KZkpQ?=
 =?utf-8?B?SWE0Wkh0dldUOGtzazZkV2ZkQW44ZTN5NE5FQkZ4NisyN3VNbW5yODR6LzA1?=
 =?utf-8?B?V3M4emplcXRyblNWMlNwRmsyT1BkRG1USDN4aHdUMlMzaXRiNlkxRUNiWXky?=
 =?utf-8?B?b2Vyd0N3TTZTd2MrOFpPZ0F2RjVpRHp3cmVmdXE3RVdDM3RQcTAwNEpPMlVM?=
 =?utf-8?B?cENCREd6U1VsMUpBUmtiT01sR1RXdkcrTTZ1enFVRzJBaHhhWStzV29ReW96?=
 =?utf-8?B?TSt6bnlaZlUwRHY5UUFYZGtHSjlESmgyNVEzWk11TkNYdzBSSGhEczhtazkv?=
 =?utf-8?B?UzdwUUxhYmhVRmdvSTBjK3E1THRSNkd3MXB4N3VvcmhucW5tZXYzbkV5R1ph?=
 =?utf-8?B?bTJraWxoYUhDWktBdWtLdXczVS9kSkxNQVBaTnhjRTBoTTdlOUFObzZlTlNE?=
 =?utf-8?B?YWpTN1BmdkV6NnBNM0xuaDA3YVByVzdvK2Q3cTZjWW1GRDY4Z0JZQThyTHcy?=
 =?utf-8?B?VW1tL0wyQm9ubE1UVW5JalBmclBvTUdzSWVBNjlrbHB5SjZhN3hTdDZsandC?=
 =?utf-8?B?aHZxaEltZXpEc0VjejJhMDFyTThrODRCa3NLVEVLUkpuTERVSGdiMWRIcjY5?=
 =?utf-8?B?VXdkcnBVc3FnQklTanZMWDFYczR2Z0pOeW14NUlsSlNEaDNBLzFQaG5lcll2?=
 =?utf-8?B?OWhEaTkzQzVOMXRrcVk4VEpvUFNBR25JYVpvay80Q01QbFA1YlIxUVJaY1R5?=
 =?utf-8?B?c1FkcFI2ekR0N3k3bDNvV3JETDl4TjhnR3o3N0plNldoaWRMc21rTDJKVXJ5?=
 =?utf-8?B?VWljd2ZKcEJqMzJIR3lwQzdUZGk0cDFXSUR5NWZ3eXdJWHZRWUc1bEVEK0c1?=
 =?utf-8?B?dllkSEUzVHNMVVZEMEdrR0FYNFcyRWs3WjNIakJKM3R4OUxOU1RubUcxTWw3?=
 =?utf-8?B?V2tKMXJmQnVVVlptekUxY252WGlCYkFBbGpKeFJoMkhFeVJlbElGaFpmOEts?=
 =?utf-8?B?OWI2ZGl3MjI1QThoUktSRVorblRXNGRIU0FTTGR2VmRONVNvZjl5cEorbk94?=
 =?utf-8?B?RlpaM3grTUdPbVU3K1pWVkFIeSs3V21jYTR3RFhJTmFHODcyU3M1MXovaHRQ?=
 =?utf-8?B?WGpzMEFwSTdvNW9OZ3B0L1BxUkVjYzhxUCtjNnVwZnN5NCtNK08rYVVjaXVa?=
 =?utf-8?B?SjRVZ25Xa21tK2ZJSk0yR3VobXJWSzV2TXNSeG04dG5vU2FLeUxqN1F2SGYx?=
 =?utf-8?B?S2VuZXJkVXVGV2w0Q3ZJKyt3T202NUQ3SFhCdkowVVpYb0U4L1Z0OHZmVk5p?=
 =?utf-8?B?Q3VpeFJseURiTTVxNW5hek5IZUlVOVdkcmhyUG5weTZUWlBNdjJ3Um1LS1J2?=
 =?utf-8?B?bDBGaHZkUXc2NGdKN0VBcFcvTHpGNEw4cm9HWHVHek0xVTlaSVRXZlMvQlFw?=
 =?utf-8?B?Rm1BSXdVOHYxUi9aUVNRVVhKTmRqVmE2YXpWR2hVQXVMa0JJVFFnMG1Na3JP?=
 =?utf-8?B?TU9tUFpoclYvZ3ZXNjZoMGZCVkZrYU9BZFRMMlJ4SkNrRVphTzhKWjBYZFFN?=
 =?utf-8?B?R1RDb0czbk4rVHhJcmNKYTZFUDV5QkxRdXBJSE9PWitvRHNINnBVTEIzZFp5?=
 =?utf-8?B?Sk9NbHdkcS9LYWVPMWczU2gvQnFSeWVmMEtRQ0tvOGp0cG40RWpic1g3ZTNN?=
 =?utf-8?Q?YGh29J4sQ144/W9EYCbJNXY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102f8c07-b6a1-4031-99a6-08d9f6e5ecb9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 16:02:43.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7r7BMLJVeBVTuOyTEHvE65g7wqLrA2T3jp2n7795gWI9ZpKJYqUgcqJtnXvhHieD6KoWE77fspG5YZnxy9DZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6156

This function is the wrong layer to go through for PV guests. It happens
to work, but produces results which aren't fully consistent with
get_page_from_gfn(). The latter function, however, cannot be used in
map_domain_gfn() as it may not be the host P2M we mean to act on.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: George Dunlap <george.dunlap@citrix.com>

--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -551,7 +551,9 @@ void *map_domain_gfn(struct p2m_domain *
     }
 
     /* Translate the gfn, unsharing if shared. */
-    page = p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q);
+    page = paging_mode_translate(p2m->domain)
+           ? p2m_get_page_from_gfn(p2m, gfn, &p2mt, NULL, q)
+           : get_page_from_gfn(p2m->domain, gfn_x(gfn), &p2mt, q);
     if ( p2m_is_paging(p2mt) )
     {
         ASSERT(p2m_is_hostp2m(p2m));
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -357,6 +357,8 @@ void __put_gfn(struct p2m_domain *p2m, u
     gfn_unlock(p2m, gfn, 0);
 }
 
+#ifdef CONFIG_HVM
+
 /* Atomically look up a GFN and take a reference count on the backing page. */
 struct page_info *p2m_get_page_from_gfn(
     struct p2m_domain *p2m, gfn_t gfn,
@@ -422,8 +424,6 @@ struct page_info *p2m_get_page_from_gfn(
     return page;
 }
 
-#ifdef CONFIG_HVM
-
 /* Returns: 0 for success, -errno for failure */
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)


