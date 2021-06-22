Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07923B089D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 17:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145921.268417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviCC-0002X1-80; Tue, 22 Jun 2021 15:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145921.268417; Tue, 22 Jun 2021 15:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviCC-0002UQ-4X; Tue, 22 Jun 2021 15:20:12 +0000
Received: by outflank-mailman (input) for mailman id 145921;
 Tue, 22 Jun 2021 15:20:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RtyV=LQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lviCA-0002Tt-Ky
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 15:20:10 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 253937bb-8550-4922-98f7-4079fef71411;
 Tue, 22 Jun 2021 15:20:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-5rTlzz3pNXOZEdWPCLCoPw-2; Tue, 22 Jun 2021 17:20:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6478.eurprd04.prod.outlook.com (2603:10a6:803:12a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 15:20:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 15:20:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0022.eurprd09.prod.outlook.com (2603:10a6:101:16::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Tue, 22 Jun 2021 15:20:03 +0000
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
X-Inumbo-ID: 253937bb-8550-4922-98f7-4079fef71411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624375208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Og7xcSihKTx4mD8l0odbkYhE4SgiX50KQmBwymR7sNw=;
	b=h4Ng03j4luCQoddfREkTDPaZQQbDw8aI8iV95OOYKLe+PunZwHWrrfOj9J53QjITZDARZr
	+LQA6aNtprN0yl137yQBpJZhIPchfozO8MvGGU6iOds5+UMPsQyjgRz8IeJP2Q+ZFkONhc
	A8DuOMHbHayTqLtVgg/PbL8cC7Rshks=
X-MC-Unique: 5rTlzz3pNXOZEdWPCLCoPw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIpdHQwhCtZK++gMEWTkSAUTnkXJpzi6L1GXgGrXrdqlUmPJGlqKM7zQKCBVEm073rDNPuwQPIuDwYoM5c9HIY5u/0jBeKMCIrG3gPSyliuVCQ3cdg+FJhXoa4J3HnnEX0I9BNubhV0iMnwNZ9O2vFqR3uLyLeRg/nv/7Cxr/CugSl/pDdXXTAu2pjITRDPQJv7OV8l8nHBj0yrMNCQGVJ3M98lYyy3srIgQMrDoRV6TGgCGjexODvvJ+RUYkxc/Kbq03Irn5+RbmJRKITCS/Zmrv5WS0UmciqFCzLy+oOe9p9vWL7diR9U+saPe2x72NSnjYnEE6VQTtNrFYTSyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og7xcSihKTx4mD8l0odbkYhE4SgiX50KQmBwymR7sNw=;
 b=Ftx7AgSXqBg3UyQldkqjCDigyWEJlD4fwpwGF5k64oo/M3vFArsX2E9LulU66b8UigNokjtJWuolEETZyUlFPJgFc1uYCVY1suxN/WwPRKDQpfZ+r/M8FN8oRK0Ak+ZGZD8Pl1NF0qZMA19y7P7TniplBBsAKabD/bGy393Uzh2FnKsnRD7E2Ig6CYfKOynGO/v3gPDbuB1y10zxXf9TpkxxnkwxgiXPu9kvDiuDe/ZNlXHbcah9sqtJC3wFqhORKanv0JkdzakfOxSeWzx4tqKclN9SKgXD/QT0xCs5bd0Sz/0hKI8O5wHnaZPg0j/woQudMeATW9IAE4cW7/9Xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH v2 6/6] libxc: make xc_domain_maximum_gpfn()
 endianness-agnostic
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Message-ID: <fed4cdad-950d-6d39-d372-37f88dcc2819@suse.com>
Date: Tue, 22 Jun 2021 17:20:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <6c532607-c2a3-d0ab-e4e5-428f85f4a045@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0022.eurprd09.prod.outlook.com
 (2603:10a6:101:16::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b1f91f6-246f-4bd0-07cf-08d935913620
X-MS-TrafficTypeDiagnostic: VE1PR04MB6478:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6478D58883008457C30F0F9FB3099@VE1PR04MB6478.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cFyWxvbp+oMFkbut65Pk5jFUjlvVpICzlfRRJzWYKH5EDLxvo3JOMnIDfaiIsAB6j+xUpZ3hgpT3K86HdOmC1KOTG23/q7zqxPuILwf3OooU8/xlCrFmdquw9qseTnEFvqNFeqEs0uK+vFC/51zeJpDM3drWI8T3ujQo/3jOS40RDIeW79ZZpWk/fk8I4Nlas10EoKcvmUTolLbrRRoVApPQ6KgDFYSN85R0pL5zm3JPe4YWF+KbAzheZjGLbn+72WwMc6LxyWx0/dRtiu3736VzWoIQcUnkFLCncyIWrjQJjIK+u22RlgBSqfH79uRHoz6r7meqL9hKsPccq4T1bSnExYyPsyGZaRQGuE+LHp7m1o28QxuzVIpk7i0pSz/1muxBe/810sbuFRYU2Etp22U4INrzEd9tG4nqEFg5tKaw7/kweQj4JdettXftCzK+7pSY3iSkx5mTliRfbkhrtDrJmsUTygcILhZTsopeIBVAnO4xEJrHiIfJGK0nmBb6RujOUvRA9qqerdloYKVKoaX+UsDo27s4NJXO9sLya6yIogLSNi8Y1wQyHmp7XPczrQGtlX8DmYXOAwpzv1/XRp8cL4ttpLO/1AWeepKb39LDGBOqagVpuGDyD9IHtnsQwLo7S8S1VILjWutO4N7RCFo55Tb3ssrxcBcIbdxKpzc4gRo0CBJizBmCW0pXPRuY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(39850400004)(376002)(396003)(366004)(26005)(186003)(5660300002)(4326008)(16526019)(36756003)(38100700002)(2616005)(316002)(956004)(54906003)(16576012)(2906002)(31696002)(66946007)(8936002)(86362001)(83380400001)(6916009)(478600001)(6486002)(8676002)(66556008)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGVMNnlBVUEwa2tXRlc0UzhGaTl1WXBmSEl2QjhTK0cyNEJIdzNuMTNIa24v?=
 =?utf-8?B?VzluWDNkb0Q0RkhtM1Y5MkVPandSTnpYSGJjS0dHcFFZd1J6cXVWTFcwVjZ3?=
 =?utf-8?B?R2hJS3ozZi9jenZYOURnNG1ZZTlCSmJPVkdBRlVUM3RTK3VnTk85MTA2R0hr?=
 =?utf-8?B?VkdTUXhuSFQybS84V3E4QktCc0d4QVV6K1cxdHpock9rUzZ5cTZnUUpvbWZr?=
 =?utf-8?B?VkFqUG5EV09vODBtKy9hZENtbDRwSnlOYURvd2VBVkRGeTBqWjJZTEVBWWtN?=
 =?utf-8?B?d3hRUldwUlpJdkt5MndRZWtYQXpuRE1FRUdSNHlrMS9vSmdqLzdidWJ5Mjlr?=
 =?utf-8?B?OVZKak1WWm5BQWEvL1hLWnFFbTdvTlFQbkJFMExGUDhVc3Fjd3pSbFkyMmIz?=
 =?utf-8?B?a1k1YVlIV28vdXhZNU9MblVrL3hTL3l3YzRaNGZLT295RUFtdFJCTDRaSGNU?=
 =?utf-8?B?S2xjNlJCMFVuWk9OZjgyOE93OHFNRTJZRm9kRlRzc3ptQTNuM21Wcy8zd2k4?=
 =?utf-8?B?S01wTlBTKzM3Qkw5T2N0U3hhRlZTQTNrK2tKbzU1RUptQXY0TDZjaXBrS21L?=
 =?utf-8?B?ZmJQbGdidk5ZdXNEbGlIekp4bk1DcG1Qc0dNd0pZcTRkQVFEYkl2c3FBYmpT?=
 =?utf-8?B?d0RuK3d1T3BCQk01MFZ2M3JSblZ5aUtSQWVIWjVqM3JKWjBKbXppVmFPbGty?=
 =?utf-8?B?aHc3bHhvRDB1cE1adVhqNjlFTVhpb2xaZ2pzTUk5RGxhNk9GdnUwOXFLMmNQ?=
 =?utf-8?B?MXYwMHcxdXFTeEtxSnhvVmZQbFVnMlFvb0h4MGQ5bmVLZkxRbDJWWUdxNGI1?=
 =?utf-8?B?NVBHcFhWTEp1eVQ4V0dnZHZlQlFuQkF1eVJwd0J5YkdEY1RHbHNZZmM1dlAz?=
 =?utf-8?B?WjF2Rm5LOUFpU2pScnRVNTcrOGF6cE1lNHdUTDc2c3U1SFlKV1JicHZuNnRZ?=
 =?utf-8?B?SG55dTJ2TGNxdjk1RVBKdWJ0RVZzalZERDdQai9mYWpVOE1jcWUzdmVEVW15?=
 =?utf-8?B?L1RXZFhwR2JkZHFVMlNhUStMWGpxeG5tTUh6QmRlOW51cHJIeFE0ZHczUWFv?=
 =?utf-8?B?bXVxeENhKzhiZFpLOCt4Z256M0JnVkNnSjZBSEFYNVZySHhtSmt1UXpSMEJR?=
 =?utf-8?B?U0Q1N0V4RHFHOFhaL0NsK1k0Q25TcWdRY2ZpUkFBZ05IemU1ckpoUUFKYkVO?=
 =?utf-8?B?dXBTbmprQUNwdkpUamRaZGtSMDA4aHcxamdPWGhFSU1OU05PRWpodm5tZk9o?=
 =?utf-8?B?WE9kSC9xQXlha2cwbE0wRFVuWVVWOGhqRWErOURoWWoyUm1qaG52ckhXUncw?=
 =?utf-8?B?eTcza01GL0ZXWkVnRjduemtZT1NzS2gxcWdFN2NYRGw5a3M2UUJwWkZWc2E1?=
 =?utf-8?B?TXdIR093bWRSWkNMblhYYlh0eHpBNHU2ZVNzVS80UFRYcThDcXpaVk91Vksz?=
 =?utf-8?B?YThJUC9ITlFGSno2dnNNYW9EME9JRW5KM09iZmQ4a1FuSmxIKzVKTzRlZ3E1?=
 =?utf-8?B?TTFwdGEvZFY5VkNpZVRScnJUZ3hlSEpLYUtBY2RhMjEzOVBINkx6cGlqbkVY?=
 =?utf-8?B?aFNaNm9seU5mQXk2K2ZpVkJXRmRRVE1ZOVN3a3BSUlFMWGJpS3VWSDRmZVBF?=
 =?utf-8?B?WkM2aUJ0bVJncFhiOXpTRjFSU0ZBdGduS2xwdGoxazlMMWVYWEpPeG9pckZs?=
 =?utf-8?B?ZDVRWUR4Ti9BMTNPYUs5djNqMXJscXFZSlZ1ZitNSG9xaWM3UFRqaVhvSzFk?=
 =?utf-8?Q?OFG8x0bm9o7KssZ4VyQqAcga1zlUza3ofbwj126?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1f91f6-246f-4bd0-07cf-08d935913620
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 15:20:04.5803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1c42363XXMi6dBvJRmVnKEADMwNB6dDjrtTIXFhSAtPOphvay9MPzbmKZ077tz3B2q8nYiHAR6B5J31IA+QkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6478

libxc generally uses uint32_t to represent domain IDs. This is fine as
long as addresses of such variables aren't taken, to then pass into
hypercalls: To the hypervisor, a domain ID is a 16-bit value. Introduce
a wrapper struct to deal with the issue. (On architectures with
arguments passed in registers, an intermediate variable would have been
created by the compiler already anyway, just one of the wrong type.)

The public interface change is both source and binary compatible for
the architectures we currently support.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Ian Jackson <iwj@xenproject.org>
---
v2: Introduce wrapper struct in public interface.
---
Together with the comment change I was half tempted to also rename the
sub-function identifier to XENMEM_maximum_gfn. But I then decided this
would go too far here.

--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -856,7 +856,8 @@ int xc_domain_get_tsc_info(xc_interface
 
 int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
 {
-    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &domid, sizeof(domid));
+    struct xen_memory_domain dom = { .domid = domid };
+    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &dom, sizeof(dom));
 
     if ( rc >= 0 )
     {
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1351,7 +1351,6 @@ long do_memory_op(unsigned long cmd, XEN
     long rc;
     struct xen_memory_reservation reservation;
     struct memop_args args;
-    domid_t domid;
     unsigned long start_extent = cmd >> MEMOP_EXTENT_SHIFT;
     int op = cmd & MEMOP_CMD_MASK;
 
@@ -1452,13 +1451,16 @@ long do_memory_op(unsigned long cmd, XEN
     case XENMEM_current_reservation:
     case XENMEM_maximum_reservation:
     case XENMEM_maximum_gpfn:
+    {
+        struct xen_memory_domain domain;
+
         if ( unlikely(start_extent) )
             return -EINVAL;
 
-        if ( copy_from_guest(&domid, arg, 1) )
+        if ( copy_from_guest(&domain, arg, 1) )
             return -EFAULT;
 
-        d = rcu_lock_domain_by_any_id(domid);
+        d = rcu_lock_domain_by_any_id(domain.domid);
         if ( d == NULL )
             return -ESRCH;
 
@@ -1486,6 +1488,7 @@ long do_memory_op(unsigned long cmd, XEN
         rcu_unlock_domain(d);
 
         break;
+    }
 
     case XENMEM_add_to_physmap:
     {
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -148,16 +148,23 @@ DEFINE_XEN_GUEST_HANDLE(xen_memory_excha
  */
 #define XENMEM_maximum_ram_page     2
 
+struct xen_memory_domain {
+    /* [IN] Domain information is being queried for. */
+    domid_t domid;
+};
+
 /*
  * Returns the current or maximum memory reservation, in pages, of the
  * specified domain (may be DOMID_SELF). Returns -ve errcode on failure.
- * arg == addr of domid_t.
+ * arg == addr of struct xen_memory_domain.
  */
 #define XENMEM_current_reservation  3
 #define XENMEM_maximum_reservation  4
 
 /*
- * Returns the maximum GPFN in use by the guest, or -ve errcode on failure.
+ * Returns the maximum GFN in use by the specified domain (may be DOMID_SELF).
+ * Returns -ve errcode on failure.
+ * arg == addr of struct xen_memory_domain.
  */
 #define XENMEM_maximum_gpfn         14
 


