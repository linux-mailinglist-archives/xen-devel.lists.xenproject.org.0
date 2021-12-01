Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5C4464C28
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 11:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235861.409110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNGA-0002Gg-Ct; Wed, 01 Dec 2021 10:54:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235861.409110; Wed, 01 Dec 2021 10:54:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNGA-0002DK-8s; Wed, 01 Dec 2021 10:54:46 +0000
Received: by outflank-mailman (input) for mailman id 235861;
 Wed, 01 Dec 2021 10:54:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNG8-00029y-0n
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 10:54:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16f9d8f0-5295-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 11:54:43 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-9MX1PPkOPlSCw58qVc7xoA-1; Wed, 01 Dec 2021 11:54:42 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5741.eurprd04.prod.outlook.com (2603:10a6:803:df::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 10:54:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 10:54:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:20b:311::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 10:54:40 +0000
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
X-Inumbo-ID: 16f9d8f0-5295-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638356083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pYFz+VhG8wlpeeBq7xjjYCfhq2Lp5V/iDsZjW/ovDgI=;
	b=imIlm5pRNg84YDoRkPkwItqf8B3QRaqv1lk4kXv4NY2vI0Ku4Vd6LgNxlabALe0RaYoQMV
	05Qp2zHhfGtW3fcsc0La4p5vHhe20s7pVyl1YXW0Fm4goofEqYAnfOZ2jgpjTJSuqk95yb
	pE9m6bgg5hH/SleEnrzJBnSR8olIZQs=
X-MC-Unique: 9MX1PPkOPlSCw58qVc7xoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBBTSpNdiwDZqxh01E8ciNhLj9VUVZqkBGQFcvwb8LSIGNJKSaYOagsI0Cpv4T8H/wSrAZO6fmCEgLfKueeIt52KjhaWWeN9fbGIgDp8/WNpaPalGXEPFGh25XjNwfIEKBC4V4F/CYHlybr8x3nfeEMzRUm2sy8U496u394EkVVzkkzRoO9redw9EuEZA9sRHNn9qxUZYk5V2UOZqh9GgAS53kIkb1KOhK+cU7FdoDrBd+e5kOMquvTZkAP5Zo7lkfSQ5NWRFuXXTyDpcOT6+d9PawPNS7F/0iIeqdJxUsZYipOeneEcPeXcxM5e0nZNiifG+to/6IjB76wh47EjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYFz+VhG8wlpeeBq7xjjYCfhq2Lp5V/iDsZjW/ovDgI=;
 b=ixA8H4aV6ECgiwPYpLv+hTtNNeyECSC2c6wU8FplOlOvbnqnFMPe/6A3LprPoDCQwhv71417lbpfglF9+YKwJzBcl+ObUUwvwmdCBq7JRZsh7ivbGfXbG7ZzJTiuthAVy/Rx0dcM+mS7DGrJHRIr1er8KpJb0RIFVb4XZRFjsR2fNG7R8gTC93q+oItGHHFLn3xWKXkJxUYUOF1GaNgfXOMQBV+ymhR8DMCF5e4MjQajRDiV+T7NdfQ9VxPBVC5edqSbtKNzIak7pLr/osJInorLelTUf/AjJ33kuEk0GW6zICaqNA3JRcvMpQ3+ueCjSzFES2z5S0cyxcF0OOU0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <09aaf19a-b03e-7f41-208e-bfc6bb968049@suse.com>
Date: Wed, 1 Dec 2021 11:54:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH 3/4] x86/altp2m: p2m_altp2m_get_or_propagate() should honor
 present page order
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
In-Reply-To: <21148e89-4750-3112-1096-36119be96c7e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0022.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cafaafff-ce6b-4d2a-dadd-08d9b4b8fa05
X-MS-TrafficTypeDiagnostic: VI1PR04MB5741:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB574126DA5E5FE05B07326268B3689@VI1PR04MB5741.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ko+I2e9g9myVvqGVVesu5g4R5QATjtcMaRgskJ1+mStj8gApCytF7yhQElxKshdg4CVNUJH2ofcJir/Jw/PT/lo/W2g7yEZYKnzuQGpvrM9ZiAEEpa6O9woAAfcgnfZ6a01FZ+sFpAxg7CBICoEG+6Q1yYvjUr5M3TxyoqSYRsGVCymsyuZzlEvmJ/JQnxG4pkOImGn2vnEK2ogLSfccFqVxaKAENI3hnrQg0w98ceRUk3+0SXv6mfHdtDB58cNnre5/MEPHGj7KRSQWOuYg/co8E34IZeOKzAJXlPVHVjs69Q9AY+JvX7vHbA/WB5dcrNbBg6Uss4+0VKm3Lv3QqFllGEjSeHd8AwrXBV22bM6kxqd3sBm1CpvJMnTBmc9CL2SmrpK1pTkmt1Z1iSAb/S5KZEp34UcTsis2s5TiWzN+KICQxfxKXEAq8HBAk5Yi5PoQi7dUu5E9imLRHui/EVUq4TKLxpchuqUTOrYjFw09DY95A+WVm/EYQ9c9VQcbm2HpqM+oQ7zoVuszyZDf4+5C/DRWHIfa4z1qz9VQ2meG9snEQkgkxiUohl9uLak3EVEQgYjwUUjjaOr2RW0T+c+Ck+RyAMslVU9tTUHp9m86F4p6nZrjvkRfQ+LLqFQpH7AtzxdHqPZGtHkPBgEV5TToXHvGK9pj2N80aQFz06HY27RiPwZKsSwaXmkYKBI8e9lv/qpkUn/10EU+J0TtKePEFX81mf2d4KOrlaQPYeF4gjfXF4ycoD+UIP3HA3yr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(66476007)(54906003)(2906002)(6486002)(5660300002)(66556008)(66946007)(8936002)(38100700002)(36756003)(2616005)(31686004)(26005)(316002)(31696002)(4326008)(86362001)(83380400001)(956004)(6916009)(16576012)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjQydEg5T1dRWnF4RGkxaXhKVDRHNXcwMzEwci9qZFl2NFZHWVpXcDNGWjNq?=
 =?utf-8?B?bjJGTEZlekR0bXVnM2lpMFBoc1RPRHZuS3dObXRHSXRKVGpJemVrRUpVQjZ1?=
 =?utf-8?B?ZWtEZnR0S1FoZ1RIai9MYXcvQ0ZLak16Q3I5OEdEL01xdm13QjNOcGdFaUpD?=
 =?utf-8?B?R0l4b3haVFd1R3F0MElBTWRFbEZ5MzFuaU9JUnB1TVZFRlIzM3kwOWpWOUNK?=
 =?utf-8?B?MUFoQ0tOOWZKMUdmODM4bnpOQTJwRFZkclkvMnNwbjE5MjBpYUk2amlJTmhN?=
 =?utf-8?B?VGJ0TXZCa0IweTlGRzNRL2h0VFhWNnVpRCtoSXR2Qk5xakJXN21ubmQ2RW51?=
 =?utf-8?B?SCtDMU1DVFhOWXo4U1FLbjNJZk5JWk95Wi9KNjRPYUwrWTlGNWtTYnp2STNh?=
 =?utf-8?B?aGlYeU15UnMvUmJhMHBXb3JUcXVnWmxEMDFEOUlJWnhEeVJwTGZCMlEwM2hB?=
 =?utf-8?B?ck52NG00bTVxT1BPYklJL1A1Q3dhOEhtd0V4ekcrWkJYajZWdERCVVJwSFM3?=
 =?utf-8?B?UGRqQ0lzeHVoVkhtbEdLS09sWkRKWEVLOFU5azBjZTNUSmtNM3hWT0dJYnQ2?=
 =?utf-8?B?UGhvSWxmVkRXS2hXVnFnRGJhSlZ3ZzVCeVA1UFVwaFpJTFBaUUNjbjA2Z0xa?=
 =?utf-8?B?OU1PVG02blZ4ZmNEME5WS1ByTDZiSkdjaVBNcU5uamFiQTRqUU5XaGdiejhG?=
 =?utf-8?B?bkNFMnVmb1haVWJlakhnaDQwcUZGSFdJVzNTZlZ5K0xlV1RKanBrQlluQTFu?=
 =?utf-8?B?c2xiTlU3dWNMcmE5clM4VFpMT3g1Smg1VWIyNG5vWUJneE8wQ0plaFhVQ1Aw?=
 =?utf-8?B?cHNqajU5cHJ0YjdLaUZuckdZb2tQNjdYVjRFT1RQSjYrbGxTOENnRXprNmZw?=
 =?utf-8?B?M1ZaZUIvWlE4c2RKMEZhaTVNQnZRekxEZVZkVHduT21tNFpUWDZCZFU4ZDdE?=
 =?utf-8?B?V2sveTM3QWpubFJWYnYzL2VOb2Ixc05RTUdxc2ZhZUQrYytlR0tXL0hXdU4y?=
 =?utf-8?B?UllZNGpteWVuNk93VnNIWFhXMWxnY3pnYUIvZk14T09hbFlLakFzWU1wUnRP?=
 =?utf-8?B?aXdkWk83anZEd0EyUWU1U05SQmF4dFdVelZUM1EyRnVCbERDRzdVb1Qra2pN?=
 =?utf-8?B?OXNmNDNPNXRBWmdLOXJKY0o4V2lYd3UvN29iMU9qbEVXS2ZaRzNWNXV6NTZx?=
 =?utf-8?B?V2lWek5LVVdURmRBT2tyMHdNRUdVN05scWllTHhjRnB0Q0l5REF6QTRmYVor?=
 =?utf-8?B?SWx3UGI4bTJsekR5eGdlc0N5WGdmM3Fmd2psWU1RM09rM1d5bkplWVVFUkFB?=
 =?utf-8?B?L0dIK2FtZXNSdFVNMWZTLzRlbkd5ZEcwZi82UlVmbFZ1TmNLMXNHNER6ZlF6?=
 =?utf-8?B?dWIySHNYMTdpV1NwWEFVMUM2emZmR2JBM2I2UVJVc2FRTGZzTjI5S3lGNUtP?=
 =?utf-8?B?WHhQWnBpVDRlUmVOUUxEM01pb3R5OWxyZG5Ed2g3TjFHY1NHc1pzRGx4cEcw?=
 =?utf-8?B?QStuOXlHVlAwWGVzVG51YWpxS1JOR2tmRUxxREYxaUJOVlcwUWw4QUN3cU5i?=
 =?utf-8?B?K3FkMzVBbWdpUzNxT2hONy8ydVpDYysvQ3NhSWR6Q2UrOVN5SE0zalZDTWFK?=
 =?utf-8?B?M2NINmJVb01rUmZWRFBaZnQwMGY1cmY3cU1yN1B6TGFId3JZOFZUa0pLNkRI?=
 =?utf-8?B?SmxLREc5eGhJWmx5MjRqNlJnV0MrU1FUZTVZQ2cvSGRvakdLUlhwT3U0VnRh?=
 =?utf-8?B?TEFQd2ljRDVGd1V0VFFvZXdsaWFyTVZmczAzQmlPOEpCNG41SVVQVys3OG4r?=
 =?utf-8?B?eUFmOE80NGp4aG1Ic2ZtMTVsU21BUlg0eTlIcUZLQ3Y2UWUxZm5uZFh2YnVo?=
 =?utf-8?B?N3Rjdm54RlBjL1VveGhYUXhacFRCb1JDekd3NnBILzk3cnJEaU9OYTZpNXVh?=
 =?utf-8?B?eVhzdGluaHl0VEJBNDl1c3ZETUl0cVFTbU5hR2VOVC90eXpsUzNEeDVVcjFD?=
 =?utf-8?B?UmY5cUdYbzZUNzJGZW5IenJJdkxGTHN2bzJkWVlJRmUrcnhKVmZXWFRjdkRF?=
 =?utf-8?B?cnV1SFVRL0dJU1RtZ21IYUpNNUVvdjlROUV0WFNVYWJFRkJJK3U1NUpHZWhw?=
 =?utf-8?B?L2lvcXdHb3grdE1uaG5IWEU5emhyU2tTMmV1cU8wR0tCbmVWMEpLeTFabUMr?=
 =?utf-8?Q?OmmXtNF5c1wOjwu22Kf3JNc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafaafff-ce6b-4d2a-dadd-08d9b4b8fa05
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:54:41.2405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC2qngut7yEBEc52JlE65ip36VjwAk2iOaCZXA1779do7YI8JB+YKGqSAr2pLIVI2IqeWel7FQhQq4J5z8d/6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5741

Prior to XSA-304 the only caller merely happened to not use any further
the order value that it passes into the function. Already then this was
a latent issue: The function really should, in the "get" case, hand back
the order the underlying mapping actually uses (or actually the smaller
of the two), such that (going forward) there wouldn't be any action on
unrelated mappings (in particular ones which did already diverge from
the host P2M).

Similarly in the "propagate" case only the smaller of the two orders
should actually get used for creating the new entry, again to avoid
altering mappings which did already diverge from the host P2M.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1826,7 +1826,7 @@ int hvm_hap_nested_page_fault(paddr_t gp
          * altp2m.
          */
         if ( p2m_altp2m_get_or_propagate(p2m, gfn, &mfn, &p2mt,
-                                         &p2ma, page_order) )
+                                         &p2ma, &page_order) )
         {
             /* Entry was copied from host -- retry fault */
             rc = 1;
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2198,10 +2198,11 @@ bool_t p2m_switch_vcpu_altp2m_by_id(stru
  */
 bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
                                  mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int page_order)
+                                 p2m_access_t *p2ma, unsigned int *page_order)
 {
     p2m_type_t ap2mt;
     p2m_access_t ap2ma;
+    unsigned int cur_order;
     unsigned long mask;
     gfn_t gfn;
     mfn_t amfn;
@@ -2214,7 +2215,10 @@ bool p2m_altp2m_get_or_propagate(struct
      */
     p2m_lock(ap2m);
 
-    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, NULL);
+    amfn = get_gfn_type_access(ap2m, gfn_l, &ap2mt, &ap2ma, 0, &cur_order);
+
+    if ( cur_order > *page_order )
+        cur_order = *page_order;
 
     if ( !mfn_eq(amfn, INVALID_MFN) )
     {
@@ -2222,6 +2226,7 @@ bool p2m_altp2m_get_or_propagate(struct
         *mfn  = amfn;
         *p2mt = ap2mt;
         *p2ma = ap2ma;
+        *page_order = cur_order;
         return false;
     }
 
@@ -2229,6 +2234,7 @@ bool p2m_altp2m_get_or_propagate(struct
     if ( mfn_eq(*mfn, INVALID_MFN) )
     {
         p2m_unlock(ap2m);
+        *page_order = cur_order;
         return false;
     }
 
@@ -2237,11 +2243,11 @@ bool p2m_altp2m_get_or_propagate(struct
      * to the start of the superpage.  NB that we repupose `amfn`
      * here.
      */
-    mask = ~((1UL << page_order) - 1);
+    mask = ~((1UL << cur_order) - 1);
     amfn = _mfn(mfn_x(*mfn) & mask);
     gfn = _gfn(gfn_l & mask);
 
-    rc = p2m_set_entry(ap2m, gfn, amfn, page_order, *p2mt, *p2ma);
+    rc = p2m_set_entry(ap2m, gfn, amfn, cur_order, *p2mt, *p2ma);
     p2m_unlock(ap2m);
 
     if ( rc )
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -852,7 +852,7 @@ void p2m_flush_altp2m(struct domain *d);
 /* Alternate p2m paging */
 bool p2m_altp2m_get_or_propagate(struct p2m_domain *ap2m, unsigned long gfn_l,
                                  mfn_t *mfn, p2m_type_t *p2mt,
-                                 p2m_access_t *p2ma, unsigned int page_order);
+                                 p2m_access_t *p2ma, unsigned int *page_order);
 
 /* Make a specific alternate p2m valid */
 int p2m_init_altp2m_by_id(struct domain *d, unsigned int idx);


