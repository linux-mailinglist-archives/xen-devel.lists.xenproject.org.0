Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7004E3B444F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147206.271188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwllN-0002xW-PD; Fri, 25 Jun 2021 13:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147206.271188; Fri, 25 Jun 2021 13:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwllN-0002vN-Kv; Fri, 25 Jun 2021 13:20:53 +0000
Received: by outflank-mailman (input) for mailman id 147206;
 Fri, 25 Jun 2021 13:20:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwllM-0002tn-3q
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:20:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b86b4ba-cd7a-4470-9898-3a480f334781;
 Fri, 25 Jun 2021 13:20:51 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-WP_4OA7iOjy6fcDkb_KXcQ-2; Fri, 25 Jun 2021 15:20:49 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5901.eurprd04.prod.outlook.com (2603:10a6:803:e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:20:46 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:20:46 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0179.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 13:20:45 +0000
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
X-Inumbo-ID: 1b86b4ba-cd7a-4470-9898-3a480f334781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvKtEXrYuF/DSgjrdaM5MapZ8LS8e8Zco99pDWWMsA4=;
	b=c/Q6J/nUYSzwxX7NBA/OMo6A6vGPIdTSW+Su0JtFreuFZ+Zc+t747yrNr29fCCz2me1NdP
	kMPi3O4Tek4ILFqb0NOv/kqJivd0bBP4HQCk75UIAcQyMjdjuspIdL7fdMW6zQAeNrbvKb
	HuWE8RH10H4Ec/gEmHHMrrtCF7NLH+Y=
X-MC-Unique: WP_4OA7iOjy6fcDkb_KXcQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni/JXLQdRCsYcOxDYex6MwWXkC+IifuACj6K27FusDd9SNwfX48oKUBtnds2IwnHXH07mGA/oy+EBL9nkBT1SM8K9QKZW2IJ1KuDtXTRxjqtS33uGNDYQ55WrAIsSzZoM24uLdWtSwzpbxOQXSNaOnCXenq3i7AVyLJJbcxh8qWCzOigIS6jpVfHB0OGJse4vE3x2dcky/VVroVmwMytsB3AvG0uD4QyrCUORGzcBFm8ahsD1mspDcl4P5dTgKI8JdiDrB+C5XQjOeJUiCdc7mYzwhSEzS/LN+eJSjUc0fgNXQ8+zJUfwN5QcjEHUDDZKR7NHB/sOd7ssBGP7b8r9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvKtEXrYuF/DSgjrdaM5MapZ8LS8e8Zco99pDWWMsA4=;
 b=PFo+5meOm4Sv4mh7wBmEGf71hOSaN4Ohxn1v4QFwI/bXv+CJVaB/JvPdm1PI2lFFsv+AdeOkO6YdXWhNe6Z50hjBNPUC5SOKM4povXMCHDs+AKnJlx0Si7Y5MSk1WUKj0SXh/1uGDP5fIfEhSGWlOrJ12DV8mwgvQpbkWPn88ueiHVn4fLcXi/xmDqfsFJDUtyXZ8hoj/a9MrPdz/YkmioFAD8qw29G6im+gvZ65tUk6ZUsGb3WCTaJpoEJtD1H7a8suFjsJiURATt2L5xxBNvWgj9u8F5oLRPARxKcH+D/pakPkFpQxGmHzPCfbfW/4/zUtJuB+FLsGS/A2ihiP0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 07/12] libxenguest: fix off-by-1 in colo-secondary-bitmap
 merging
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <cec4594f-f346-c951-b0aa-55d7a56cefbc@suse.com>
Date: Fri, 25 Jun 2021 15:20:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0179.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4070a9d4-0855-4e2e-bd13-08d937dc0aa7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5901:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5901B279EDD648B0B37D6832B3069@VI1PR04MB5901.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gaRmmRlmj6cS10H2cq4aQfPEKAb/2vgRv5+FiciYO8zj4dc1il1q2g1x7oIql/3twKel/fWtOXMlY1/3m3q1vtfT2U6cQTm6JpjGMIH4XasHBd6c+vhvwfE1fmZNNa+/60Da67fE6iAa00c5QLU72Zmo89h42UPwP1O/cbfkv5W3lwypQcM8PUbpzL6VpGuCL6JmAcVqtihK8cvDLo1wq/YI1+G+L0FKvao6cQusVmgahkA+NKwz3XtCKebC6DskZH1XtO+dL+Mq1LNPN24J3PtuMQUJ/gEHQl/AISRdaviZesE/A7GpeUteOSbHtU/7S5O2Vo3/UytnAwrunVGywHwiyp6LUmSsOs7dif6mtAOz58iOWa0EMfLp9uXRBPDDXkXdeR0VG/geyLwJdX+U39QBBXdRKdcAM+iW/2ILB+J25BBZQeDJpWwC0EED6R1JEBzc6NsxWjNSU+QkG/OAcG6f9Rc/Te+DMRUxkzmpZmmeXSkeqYjcfhhBBvBAonbnH+Xepp4TRDUMlzoFjGqLo4Mvn2NVc6IzcgNfF8GajlkHhEGYo0g6jhkWLrZEnugxFp+9bhbmJdgFJV4OzOFrQMaKEvuL4RKgrvRm8YdR1rCeq9pupdMAod6cEbruWXbCR5KIl6DOOo2RHjLTyvZAhoCB7ULkNW80T1SQTmur8GcRaUyF9fLT2wdDUOt+gAMv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(2906002)(66556008)(66476007)(2616005)(956004)(31696002)(86362001)(31686004)(66946007)(36756003)(186003)(16526019)(26005)(16576012)(316002)(8936002)(8676002)(6486002)(6916009)(4744005)(5660300002)(478600001)(54906003)(38100700002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGJhUGszQnJoSFY2WWF2NnhOVzRzQVJMdE5kb3N5R04vbStjcVdWTktZbnNJ?=
 =?utf-8?B?QUJzTUFlRlNDYU93NUcwWXViQjljbWpwMWRyTzZMUWRuVG5OYUN1aEdpL1BY?=
 =?utf-8?B?OUptWHpaMUVtYzNHL28rdmVRVU9iSUI2eVhuWmMxOTVqOWZoSHBOWUtLQ1ZG?=
 =?utf-8?B?QzVCS2ZjQzUwaEs2M1ZwekRVU0hvblJMRE02TW4vL3lVNFE3aDNuZFB4N0M4?=
 =?utf-8?B?eGVtT1ZMTkpiK3JibjdNZzlqdVhUeU9Ray9SZnE4N29EY1R5ZG1GaDM1SHI1?=
 =?utf-8?B?bVJWSlloaFVMbWt0S1lwUzIzWjhFamFTeXo3MTQyTWhySzZKalRJUUc0Z2Y0?=
 =?utf-8?B?MlRpWndZVGZBemEwemIwNG9mcVhFMmgwQWwwcEFMNUM5M08yZWh6RDJSUFli?=
 =?utf-8?B?bFBreHZwSHZ3dzNqNUxlMHgzaHZ1TzgyOGVSME1MaGF6VUhubHM4NUNmUUxZ?=
 =?utf-8?B?SXNpbitTRU5xMUZJSTNvdlpBNHhpaGkyZUIrNFYyR2RNYWdjSC80QlQ2a280?=
 =?utf-8?B?MDFtNXBzTU12S0FOZWtHT0JqT0h6ZXlvLzN3aldPeTNMRWltb21kM0VrZGhh?=
 =?utf-8?B?Z0pOSENJTzR3bG9BY3h0RjFBdFNaNVY5bWxVOU13QXVVQ2N4MkhOcnVBNGcy?=
 =?utf-8?B?WWErdGs0MGRZQ204d1FoV0lWR0xsRGpmdDQ5RlhNR2ovTTVxZ3E2VVR1amJI?=
 =?utf-8?B?NjdxSm9NM2c1ZTNIWWk3L3N2RDV6U2ZsUGV4dC9tK0k2Ykc0elAzSmpzVEVI?=
 =?utf-8?B?UmZTRmpjUmltdmlhcldhSFNKSVM3ZzZxK29yV2xCTytISGtzcWhEQllDeFVF?=
 =?utf-8?B?L24wSXJ6Zm83dGdiV2RqamdIQ2RCbnowWXNPRS9oYjB4VDcxWG1Uc2xRbk1j?=
 =?utf-8?B?dWZhTXU1WnF2ZjBSNEYrNTM3YlRGVVZJUVJoTHhXcG1ubHV0eG90SUdEVGNp?=
 =?utf-8?B?aHB5WmxhTTZTVW9CU2l5WERncy9xWmJRc3ZtdXF6L1hpL1htNGc3TTNmL2xa?=
 =?utf-8?B?N2M1bGJnSWpTS21pVHFDZ2k5Ylp3QWdEd0hraWpRRmU0elZseFFZaG1UOXZT?=
 =?utf-8?B?WC95d3JieGxTK1FpMkZBRGFvM0NUN1JvL1JkTWYxbno0c2RuKzZlanVVM3JS?=
 =?utf-8?B?cXhOSm92aGNTaEw4TEZ3Q2NXQnJTQzZNempQcFZ2Q2I4UFZ6RmsvMDkzR0lG?=
 =?utf-8?B?eTZlejNWN0oxY2ZwTG10NjhzWldoQzRWSXUvcy9hSk1rWERFTWNZUkFuY2lu?=
 =?utf-8?B?VElUeHlBaTM4YjVYRWpsNnpOMXplMjRrSnRqYUp5Z1FIVWVaOUxacFAxWVp6?=
 =?utf-8?B?TXg3Rit5K2Q1a2pJZzJuU2QyVTFNNjhGd1BVWGxzaFZiSkZzWDJmZWVudUtj?=
 =?utf-8?B?VEc3NCt2MUpjblVTM2xOZ25WSUp2QkM0d1JkL0pkMFo4aFdWcmEwaCtiZUFJ?=
 =?utf-8?B?TEdGL3Q5ZGZIQzlBWjIwQ3FLR0JOMWtjYkxCS3I5RjYyNHlDMGo0V2sxV2I4?=
 =?utf-8?B?MTNhekNnb1pxY1ZlSCs5YWg0QUg2SURFN2E5MmlWZlYvK3hyNzFDTDRRSkxo?=
 =?utf-8?B?ZU9MQkFkeEJPaWM2MkFlQlJYZ0xlYjBkdGZMQmNKamg5ZnoyNU9lOGdtM0N2?=
 =?utf-8?B?M2JDY0RrKzVxNkJWcVBmem1tUWUxQTUxY1RtWnprQkN3TVFkbzhlWUk1NGY1?=
 =?utf-8?B?NHRTWk1iM1QzMk9BNlJvdnByZXo2TTdlTGIveFg5KzhDMjdYZkhqMHpLOHNL?=
 =?utf-8?Q?o717k4t/vunOPL82vAqfYzcFaCjab/c/CRVwt0w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4070a9d4-0855-4e2e-bd13-08d937dc0aa7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:20:46.2272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqVylmF7/0hpWbws4BBiDivHjPX7xmBt0pkbMRsYH8qk41pmU2YVJhtG4J2phSEhaK8R211biXSUmE4eY0IlJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5901

Valid GFNs (having a representation in the dirty bitmap) need to be
strictly below p2m_size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -614,7 +614,7 @@ static int colo_merge_secondary_dirty_bi
     for ( i = 0; i < count; i++ )
     {
         pfn = pfns[i];
-        if ( pfn > ctx->save.p2m_size )
+        if ( pfn >= ctx->save.p2m_size )
         {
             PERROR("Invalid pfn 0x%" PRIx64, pfn);
             rc = -1;


