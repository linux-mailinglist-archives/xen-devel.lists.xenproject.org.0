Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FA3464C80
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 12:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235918.409220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNfA-0002nV-1n; Wed, 01 Dec 2021 11:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235918.409220; Wed, 01 Dec 2021 11:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msNf9-0002lU-TP; Wed, 01 Dec 2021 11:20:35 +0000
Received: by outflank-mailman (input) for mailman id 235918;
 Wed, 01 Dec 2021 11:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msNf8-0002lJ-VB
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 11:20:35 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3294761-5298-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 12:20:33 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-noYV7RiEPEKp4BGql6JYqA-1; Wed, 01 Dec 2021 12:20:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 11:20:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 11:20:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM7PR02CA0010.eurprd02.prod.outlook.com (2603:10a6:20b:100::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 11:20:30 +0000
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
X-Inumbo-ID: b3294761-5298-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638357633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uVzkRXmNhEFLnejBb+/P0JNRxNOczXHfjbrfmo5RiEM=;
	b=E2AZEDKGHYI/hYHOVgiz8hJmGESv+Yolo0MN8cfUiOz5kTPAPKxRfLPqMBobJV9swrmNcx
	XIZGE7e3PTQHxBWJ9YQFqbGvoPxZP1hY+WgIVRjEgr3V03nQ227i6WQltOYWXnxHDeUSS7
	GWV6lp3Bb0wTkgSLG48UuU7XRKJqAuc=
X-MC-Unique: noYV7RiEPEKp4BGql6JYqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bgte0DhyRDGnwNBt/cVkzSoKG2OJWsBnFmHS4zKCYfPu5jpcljMx+F4svgWONsfkJpL9fcStYhdOVRFR8XpPFBbEYFoPrvNIUA887Gna5yyItzE98ha4PwhrUiEkWEYmECShSufjZJO9RMkFUzDjB4Gh4QTO/7T18KryIKaF4D7GIpeISZ9OkQvkLpMDMJzfkVCbahOVOQ9Ab53g6CurY6YW1Q0v0/ICrEk7LNPLqD/cXinmbc5h0+zEND5qxmXPVAvJly18FqKOJcGZgLnE8DEBGrQGlR5QhTOKbOFueIBwRDDOj2vckGJhnRHi2oEb5A07Sd7atLAqufvYIB0rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVzkRXmNhEFLnejBb+/P0JNRxNOczXHfjbrfmo5RiEM=;
 b=N5HnvmbqDrUGJeXS3SrBm2tSzr5BGa4jT7e8EbI+C3GAV8K3ifLMpxnBDdyP5hgJnkxhOsvpmHbGFcUwzJ/1EMir+pbg1pirYb+6XwC54ETtcymzCCtEwVlLlYpLtlloXjhDse+5ryqkmf2cNtkzNYGD2CuN6apjp9DAbihpLeCMtjXmcUvI5BLp9weFyfXf9RC7KlaOmJwaqxMKhuv7LKT4oNGbhIdHXg5Fzl4v+OWXi2InICjm+xMpj2iHllACb/0wf6hOFReJpW5/RJY7TRXcfsJkPkx0r9viCmea9K9dfpkNf3LVT/a3/OwBdtjyaQQMxTga1d8Yx/YaEk71Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81a27b5a-99f7-d929-987a-1dcf2433144b@suse.com>
Date: Wed, 1 Dec 2021 12:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: [PATCH v2 1/2] IOMMU/x86: disallow device assignment to PoD guests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
References: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
In-Reply-To: <8bb92e3f-38b4-16a1-0a45-5f393081f230@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR02CA0010.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15f64a15-07c7-43b9-6a27-08d9b4bc95fc
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39362C4220065DDAE4878E75B3689@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	L+iW7oNWzbaCAtNL9/PU83c2pofWk3Geqm6xcjzpd+JxYwXa7sIsqxNEJE4G6hxZK5VRsGUXmkpve+nZujQzEl5/6qGH8S4aqHBElNzStdyNQV7MJh/eqcCG4fpeSjqP644pfKauc/v0JdVWil/ayjjXCl5DgNjiu3GOyukWGe35Q9i2TtTHW0lFMxMaeDklV9SoR7wxXw8sa4V8HZugRJxncFf6f3YkEv6yudDKJD50RFGxF3WRRhT+92om5nRGoPOzi5L0JONy3F1ct8rp0bQ02JPxydtqgE63iIsehzC69gEiGgrP5i1Vyt5E62UQ8we1M8hWQ94BUJ2keGsBwcE23EfrfU709P3TFkHmzhuuY3e9b0UUIfOAnkeFPRkjfNCKyBp2Lmp1i6x+9bxN+j0kkubov4nc/9bpYPjxI0c624T66nIES2nfgCvYBAb/eQ7PFqP6muu30b2qKbVUmP9LZhNeLfSJ77uyJqUWU6k0ah7aFUbZODucFMIpyi53nsWva3kCdPMG+Dxw8sJ8WIFIeidEOIWNtKRLJLPRxkkl5jd6Jd8+dNud8UnyF8my0ezwHqlualiv909HyMzbVg8qwR7J3KjDbS7QSSXSfGaSCsw0QOPsxN6VaUQowphTgdbcI1c1XIWTeOEk83yX4ZH+0nbRMoB4HrnY7zrOJjQveRqB47ngd9yQW88PCwuQgL2JiKxzDpHCwOzDet6WDuPsO/rBlSy2TlZc4GRD6Wc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2616005)(36756003)(6486002)(4326008)(86362001)(5660300002)(6916009)(508600001)(16576012)(54906003)(66556008)(66476007)(31696002)(83380400001)(26005)(66946007)(31686004)(2906002)(956004)(186003)(38100700002)(8676002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZQbzdpZEI3S3h1VW9BQ1ltU1NDOW1MYkx1UXg4Ujc5bWhDYStLQkkxZjJO?=
 =?utf-8?B?ekJqdUdyRlk4RnM5eEtHWGFKSHRLRU5nSVFHTXkybXl6dmpzTDJnbGFCT1lr?=
 =?utf-8?B?eCt5WnhPeFdpVC9iMWl5NFBDbUFQakpoelhLd21ZTVFqMWhka09zWkl5QTRt?=
 =?utf-8?B?cFdaTEtwaEdmekxUa2czUyt6SHE1Y2V6WVQxL01JQ0kxTUlpUno3UjQxVjJ0?=
 =?utf-8?B?OG5wMUQyZGRaVDZLQ0hXM0F0VThHRFN1cnA0dFB3a2NBSmliZEhBOTA5c3Iz?=
 =?utf-8?B?NFhGV2VtNjdhLytDR1dvbGZGTWMxRGJNcStTVkhxdUFUZG8xN3Q0bEdEYlhr?=
 =?utf-8?B?a3lIMVlwUll6U21vSzZneEZGUCtQbVZ3UmQ3eUZkbXk4RFA4OEUwWUFVMFc4?=
 =?utf-8?B?bDkzMnBXWVlEYXd3MFk5SytXSDE4bnYrV01laDA0cnAxbXltemEwSDdiWnc1?=
 =?utf-8?B?OVBrOGFIOGVWUklVUkYyRGJzT3d4clIvNGJMZE1peVlNNXQxTXNPQkdGZHZY?=
 =?utf-8?B?RTg2dUhUOUdmQWMvV1pNdENaYUxrMGhQK1VRc0l2a2VvN281bmZJNXZyeWly?=
 =?utf-8?B?MU1aVUhwZjhwM1BaaEJUaVB2L0tUdWV4bWs2Wkt4RllUUmVWdWRGbVVXY2JM?=
 =?utf-8?B?TTlwU3RiS1JhcytpMnNPdzdZWTlOV01Fb0YxODlnTGEyMWpMRWhVOXc0R1h5?=
 =?utf-8?B?MktVZ00xSVlQRWxBSTlTZlNDSDZkcFRpNk5zbm84WWFmM0dxb09QTzUvOXBV?=
 =?utf-8?B?Yjc5cmlPbHB2c2N3cGZhYVd1MHk2emZ6UHJLTDdzMUF0TzJXdzU4eUh1K2lw?=
 =?utf-8?B?dXQwSEJEVkpPdjU1bm14SlA4cHBQVDRyYWtLeXN2MjlleG5tcUhmK1M5TnJI?=
 =?utf-8?B?MGNUV0ZueFdLb054Z2QrRTFjOWkzZ0MyWGl5OHhVZlU3R3dDaVpidVpIRy94?=
 =?utf-8?B?a3l3STNudzZFcExBV0RsU2k5QlFNYlhNSHZqT1FRdUQrL2hDUlQ3b1o0TUZa?=
 =?utf-8?B?WE1Kb2tST0YwTE81anFWRXMzbkdoK1BCaWZjS3NnNGJsMng3dEZlcERMenpI?=
 =?utf-8?B?NzZxNmgrbUVQV0JYb3VPemRSSnRkalNJc0Zma1ZzdGNCTHpVMk9OekxaNnRU?=
 =?utf-8?B?R2xEVTFHTWRDYnZlSHcwdTdmclRSTG13Qkx3M3E4OW1BRTdESURSYng0MmRT?=
 =?utf-8?B?RWdVU0dFTHBNa0hxMkVVbGo5SGczU0EzQnNhV2sza0dvV1dxb0drMmJiRFpV?=
 =?utf-8?B?UU1IdWVlNXdRNld1c1lLR0VXSjBUWjdsUjJidk45RXAyck0weUZzUE9GT3FT?=
 =?utf-8?B?L3JvQkRNQnQ1QmMxZ2RKaU1scndTZTF0alhYWmgrazVRWEltV0dTd25oQkE1?=
 =?utf-8?B?SWt4bzlMTmI0bTZTRWFGZThFWXZPbnV5bTFrZlZCVlA2Z2RDYU1LWlJJUE1Z?=
 =?utf-8?B?SnJ5S3p4RndidlpyT1REaS9FaEZxeFZzU2UyWERsTDFYbXFLRDNiWmpvdWpV?=
 =?utf-8?B?YlBOTmE4SWgvNC9EOTZSUWN4dm40MFFKQUx6UFR6b0oybFBLUlE5WXlpN0ND?=
 =?utf-8?B?OGFXV1BjalEyMDkxb2RCUmc0MU5Hek1Sa0ZFTFJRS1AvMHpIcGN2dUxvbmtj?=
 =?utf-8?B?ZmFPQ2RvQmxGSkgxR0x6cUpZUEx0TXc4ekZzR1RyU3RjN3JLOGNFNi9VbEFL?=
 =?utf-8?B?YWo1NWhNZndmQmw0UW16VlU2alNqYWxCZHNqdEF6VWdjRVU2TTNBdE8vV1do?=
 =?utf-8?B?a1VpVjU1UExnUnl6YXNaNGpyZkhmY0kyNnQzaHFzYllvMzkwQUVHWUgvRnRN?=
 =?utf-8?B?aHFHc1FRL29Jd0EvR0FmMHFTaStWcmp6ZmtIS29SellYeHhBbTQyU0ROMnhT?=
 =?utf-8?B?MlZCWjF2QkFEK2tnVWZRRnVjRDVzcEtxUFZpdkN1eEJ0bGtrck5qaStWbEpS?=
 =?utf-8?B?T0owM2RKOGtnc1UxbXJFVVp0WGlEQThrdTVnYnN5czlJRFV6cGtiOTNIU2VJ?=
 =?utf-8?B?RU9WbnFvRm1CdDZ3ZkcwVVdRVld6Wjd2ZE9zUnljcXNHZEljU0RsVjNCRWJh?=
 =?utf-8?B?S0F5SVNKVWpjVHZxODV0WVBmT3ZZQWd1ZlMyV0FWRGFmY2tBcjM4RU9tUnlq?=
 =?utf-8?B?NzRzTVZDa2NuQ1YwQ3R2d0pZZUM2SHp2VzRxSFlTQ1VVbzFUc0k5eWpaVmk1?=
 =?utf-8?Q?fYhpZAi8SwVrG+BOn1YaVCo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f64a15-07c7-43b9-6a27-08d9b4bc95fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 11:20:31.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxTrwQZgy3EEZs5z4bq6SKVRXpSGaWDxp3ZMmz4vOytLvUkO9ChykBP/Aht6HfelsToJsGHD2uCDHZQt7JnhbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

While it is okay for IOMMU page tables to get set up for guests starting
in PoD mode, actual device assignment may only occur once all PoD
entries have been removed from the P2M. So far this was enforced only
for boot-time assignment, and only in the tool stack.

Also use the new function to replace p2m_pod_entry_count(): Its unlocked
access to p2m->pod.entry_count wasn't really okay (irrespective of the
result being stale by the time the caller gets to see it).

To allow the tool stack to see a consistent snapshot of PoD state, move
the tail of XENMEM_{get,set}_pod_target handling into a function, adding
proper locking there. At the same time fail such requests for PV guests.

In libxl take the liberty to use the new local variable r also for a
pre-existing call into libxc.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If p2m->pod.entry_count == p2m->pod.count it is in principle possible to
permit device assignment by actively resolving all remaining PoD entries.

Initially I thought this was introduced by f89f555827a6 ("remove late
(on-demand) construction of IOMMU page tables"), but without
arch_iommu_use_permitted() checking for PoD I think the issue has been
there before that.
---
v2: New.

--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1619,8 +1619,13 @@ void libxl__device_pci_add(libxl__egc *e
     pas->callback = device_pci_add_stubdom_done;
 
     if (libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
-        rc = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
-        if (rc) {
+        int r;
+        uint64_t cache, ents;
+
+        rc = ERROR_FAIL;
+
+        r = xc_test_assign_device(ctx->xch, domid, pci_encode_bdf(pci));
+        if (r) {
             LOGD(ERROR, domid,
                  "PCI device %04x:%02x:%02x.%u %s?",
                  pci->domain, pci->bus, pci->dev, pci->func,
@@ -1628,6 +1633,22 @@ void libxl__device_pci_add(libxl__egc *e
                  : "already assigned to a different guest");
             goto out;
         }
+
+        r = xc_domain_get_pod_target(ctx->xch, domid, NULL, &cache, &ents);
+        if (r) {
+            LOGED(ERROR, domid, "Cannot determine PoD status");
+            goto out;
+        }
+        /*
+         * In principle it is sufficient for the domain to have ballooned down
+         * enough such that ents <= cache.  But any remaining entries would
+         * need resolving first.  Until such time when this gets effected,
+         * refuse assignment as long as any entries are left.
+         */
+        if (ents /* > cache */) {
+            LOGD(ERROR, domid, "Cannot assign device with PoD still active");
+            goto out;
+        }
     }
 
     rc = libxl__device_pci_setdefault(gc, domid, pci, !starting);
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/event.h>
+#include <xen/iocap.h>
 #include <xen/ioreq.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -333,6 +334,9 @@ p2m_pod_set_mem_target(struct domain *d,
     int ret = 0;
     unsigned long populated, pod_target;
 
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        return -ENOTEMPTY;
+
     pod_lock(p2m);
 
     /* P == B: Nothing to do (unless the guest is being created). */
@@ -370,6 +374,23 @@ out:
     return ret;
 }
 
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    ASSERT(is_hvm_domain(d));
+
+    pod_lock(p2m);
+    lock_page_alloc(p2m);
+
+    target->tot_pages       = domain_tot_pages(d);
+    target->pod_cache_pages = p2m->pod.count;
+    target->pod_entries     = p2m->pod.entry_count;
+
+    unlock_page_alloc(p2m);
+    pod_unlock(p2m);
+}
+
 int p2m_pod_empty_cache(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
@@ -1387,6 +1408,9 @@ guest_physmap_mark_populate_on_demand(st
     if ( !paging_mode_translate(d) )
         return -EINVAL;
 
+    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
+        return -ENOTEMPTY;
+
     do {
         rc = mark_populate_on_demand(d, gfn, chunk_order);
 
@@ -1408,3 +1432,20 @@ void p2m_pod_init(struct p2m_domain *p2m
     for ( i = 0; i < ARRAY_SIZE(p2m->pod.mrp.list); ++i )
         p2m->pod.mrp.list[i] = gfn_x(INVALID_GFN);
 }
+
+bool p2m_pod_active(const struct domain *d)
+{
+    struct p2m_domain *p2m;
+    bool res;
+
+    if ( !is_hvm_domain(d) )
+        return false;
+
+    p2m = p2m_get_hostp2m(d);
+
+    pod_lock(p2m);
+    res = p2m->pod.entry_count | p2m->pod.count;
+    pod_unlock(p2m);
+
+    return res;
+}
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4777,7 +4777,6 @@ long arch_memory_op(unsigned long cmd, X
     {
         xen_pod_target_t target;
         struct domain *d;
-        struct p2m_domain *p2m;
 
         if ( copy_from_guest(&target, arg, 1) )
             return -EFAULT;
@@ -4786,7 +4785,9 @@ long arch_memory_op(unsigned long cmd, X
         if ( d == NULL )
             return -ESRCH;
 
-        if ( cmd == XENMEM_set_pod_target )
+        if ( !is_hvm_domain(d) )
+            rc = -EINVAL;
+        else if ( cmd == XENMEM_set_pod_target )
             rc = xsm_set_pod_target(XSM_PRIV, d);
         else
             rc = xsm_get_pod_target(XSM_PRIV, d);
@@ -4812,10 +4813,7 @@ long arch_memory_op(unsigned long cmd, X
         }
         else if ( rc >= 0 )
         {
-            p2m = p2m_get_hostp2m(d);
-            target.tot_pages       = domain_tot_pages(d);
-            target.pod_cache_pages = p2m->pod.count;
-            target.pod_entries     = p2m->pod.entry_count;
+            p2m_pod_get_mem_target(d, &target);
 
             if ( __copy_to_guest(arg, &target, 1) )
             {
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -639,7 +639,7 @@ int vm_event_domctl(struct domain *d, st
 
             rc = -EXDEV;
             /* Disallow paging in a PoD guest */
-            if ( p2m_pod_entry_count(p2m_get_hostp2m(d)) )
+            if ( p2m_pod_active(d) )
                 break;
 
             /* domain_pause() not required here, see XSA-99 */
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -451,11 +451,12 @@ bool arch_iommu_use_permitted(const stru
 {
     /*
      * Prevent device assign if mem paging, mem sharing or log-dirty
-     * have been enabled for this domain.
+     * have been enabled for this domain, or if PoD is still in active use.
      */
     return d == dom_io ||
            (likely(!mem_sharing_enabled(d)) &&
             likely(!mem_paging_enabled(d)) &&
+            likely(!p2m_pod_active(d)) &&
             likely(!p2m_get_hostp2m(d)->global_logdirty));
 }
 
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -661,6 +661,12 @@ int p2m_pod_empty_cache(struct domain *d
  * domain matches target */
 int p2m_pod_set_mem_target(struct domain *d, unsigned long target);
 
+/* Obtain a consistent snapshot of PoD related domain state. */
+void p2m_pod_get_mem_target(const struct domain *d, xen_pod_target_t *target);
+
+/* Check whether PoD is (still) active in a domain. */
+bool p2m_pod_active(const struct domain *d);
+
 /* Scan pod cache when offline/broken page triggered */
 int
 p2m_pod_offline_or_broken_hit(struct page_info *p);
@@ -669,11 +675,6 @@ p2m_pod_offline_or_broken_hit(struct pag
 void
 p2m_pod_offline_or_broken_replace(struct page_info *p);
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return p2m->pod.entry_count;
-}
-
 void p2m_pod_init(struct p2m_domain *p2m);
 
 #else
@@ -689,6 +690,11 @@ static inline int p2m_pod_empty_cache(st
     return 0;
 }
 
+static inline bool p2m_pod_active(const struct domain *d)
+{
+    return false;
+}
+
 static inline int p2m_pod_offline_or_broken_hit(struct page_info *p)
 {
     return 0;
@@ -699,11 +705,6 @@ static inline void p2m_pod_offline_or_br
     ASSERT_UNREACHABLE();
 }
 
-static inline long p2m_pod_entry_count(const struct p2m_domain *p2m)
-{
-    return 0;
-}
-
 static inline void p2m_pod_init(struct p2m_domain *p2m) {}
 
 #endif


