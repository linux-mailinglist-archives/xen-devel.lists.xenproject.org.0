Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676950FA59
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313705.531405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njINK-0000QT-JN; Tue, 26 Apr 2022 10:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313705.531405; Tue, 26 Apr 2022 10:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njINK-0000Oa-GA; Tue, 26 Apr 2022 10:24:54 +0000
Received: by outflank-mailman (input) for mailman id 313705;
 Tue, 26 Apr 2022 10:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njINJ-0000OM-9R
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:24:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bb3dfa3-c54b-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:24:52 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2055.outbound.protection.outlook.com [104.47.9.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-1QHNAdYYNG6iJ4FVQXsp7Q-2; Tue, 26 Apr 2022 12:24:50 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB4245.eurprd04.prod.outlook.com (2603:10a6:209:4f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:24:47 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:24:47 +0000
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
X-Inumbo-ID: 1bb3dfa3-c54b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFvLQFBwZFZ943lsxU2fJYaMKf9GbC+9+84gYPaYpQU=;
	b=B8oenL1GHZZ1IRScLfbi/hpPVXwtIX/wpmNWpPGbEQ9VOm4yKtqFZrgGUkii1L/G5P2fog
	cwfe+xgCCfrwPKW0LZEgxqcM/eqFTGbCfH5t7jx+W+eNgRUeJP24ymNvSQRQltB/sntEod
	sDBVscdGsOFK/DO852pCMh9fjdGM47o=
X-MC-Unique: 1QHNAdYYNG6iJ4FVQXsp7Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJMZb0YFQg6Vgc3dr0BrFVZO2A3Ertnoj0WIucML22+TaT11MvOL5v7QM9D0Ts5wJy3KrhAlfziIKk5UIUNEjqzQYhhpvNb3D5UYs1tIyxM/joTcao2L4gJCm/uMr6NPtbnlfTgnfjxSN9wQveKvCuBfxykbfCWi1gbTuaDn38uaCxr9Fn50TOCMP/0uQNy6uROVnUnrk+lA1ur1ns6KO8phOB+3ftdvAJE9PpNyhB/gB4pmI2sqHhnOzBagM01NTvAgAMwU7XIGO3LqXWu6IShqEm42CHjj1r2T02VcbYwH993a6kqoavJBLvbj+tPBhY1A+wXhN46+e+Qe8vYmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OGFK6t8lL7gQvWrJvHU3Kqh9Nzt0xlpqwNOIjr8wDA=;
 b=Oo6mlrmHOaj738rt5GqDGWjfTcaNdVAhl6sMXmzbPxctPETg0SLMwOmNNUSoc91OFQEYSSCcYU0+P/zh/YMKh3OXsHqSmgIuTpmxb6koLDcPE2dyR0Mum/Xn2N5WCJKW6LhA18A61hH90WEi3O3RIwheyzGS5VyQBoyGbbK9L62dJX4zRVyBC2TJ7+DFhgMpIdwCBLPIx5hfKfZleRuKPMsY3g0F4Xsa0L03G+VkrI803ZovA4Y4ox/z393VUK6emoQ0Wkg+pdzQx6IBDi3PtLYBAbKiapXHzCI2XAzOTPHOswBE+e3V1xxLLF4b9Q5mxdb4IQ2TH8QqRajjqBXRkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b24d2b5-14ff-6e4f-6fa5-d91d75e315a4@suse.com>
Date: Tue, 26 Apr 2022 12:24:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 5/8] libxenguest: deal with log-dirty op stats overflow
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b10f9922-ef7d-45e7-9214-08da276efd38
X-MS-TrafficTypeDiagnostic: AM6PR04MB4245:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB42454F87500EE5696AD2BEB1B3FB9@AM6PR04MB4245.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n9X5T8hx4jB60E3PWHnxpf1XsKPUTIChMdEwHdRsZBJyTOnMKS5dOi8bJ+lq22Zw3TjrL4oMNagIje2ISBNi59yIdhRtK/FxdSMGlsQq/sTW1/2x7/Kt3cRcLA2eBM52lmwWuOBF4c5yP0uXuC3XSRHZD7rvQVW75aRHcgldhbmb7RrHCG5NYyJNRtz1tTSNKwMEzLKtvBMRDbGOEcfUGjEDKNtb7QuXkzaDPwFYk3cpK/WQhPvIx+iYQw2NEG2pO/BZPnTaDFt5Uf1k2VXNIsVsIQRaumGpImAxlGtMz/m5OXIazTFqEegHcrv1H9mLoNb6ZBcQxv34mrp7igOW+6gMy9ZamPrp/Caalo4k8Yc4NlD9UPD8bQ8ZJIZAGseVLAn1jTYln45iUyYZz5RvcCraz/45MR+/PvEVGS0PNTvIb5h0vzrQpvXrxvFBEHWKYQ0tnoTE2vqraKzLCyfP3mMTJkmJLJBKrcbsk7zxKhyafOXMBJhwKb+D7SsMP8pTyADasbuhPDhYtoZbrZySosHK0qLIZHLFlD1PWNTIf1Z/wM5+bjV/znPHOLqnD9VZEG0SxmbWU8KV2ww/wVIZLen39hKBAlkNs9MQfchhGC0bDe88mKjy9CWlLh9UQTMF00kxpk6KgwPVJZS5TJJ9uF3pekoO4lUnm3b4Of7dy1u1lNsSg3oAMCsIwiqsaeizUy2BT+Y1oGWHnmnkn/+BZrSlswTtk4vnruG+FhGU270BfVhif6D2Ndo8rdm9GssY9ajnNfb+8GqrCtu6UAE4gQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66574015)(2616005)(31696002)(508600001)(6506007)(6512007)(6916009)(86362001)(186003)(36756003)(31686004)(8936002)(4326008)(38100700002)(2906002)(5660300002)(66556008)(66476007)(66946007)(26005)(316002)(54906003)(6486002)(83380400001)(8676002)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c89B0axlDoAn2GDpXRrBO8yToGYF7KXCSXzo9CmM7XclDj5bj5jgZXzd9X4F?=
 =?us-ascii?Q?ahOM9AfN/Ov6MjbzghE09iLMDR5bryTh4fF4kHC1ERTj70DsGWEXLyoyheCI?=
 =?us-ascii?Q?cS/D/Cul57xToipyg/TupECtsRjS6Xu+qYJN0pQFv6RZqARx6mWsesJmW26U?=
 =?us-ascii?Q?g9uTqOt5w/cnw5ud0v4VnWPT+/eGbJyCK6MX8xv4PDHGjpD5f7Or0FTFI2mh?=
 =?us-ascii?Q?MsXpLtq7FM+Gc9NL3J3+t65Sd7pAyp1cI3JpLDQxMXAbs3Y0zom3ieQqS2uQ?=
 =?us-ascii?Q?VVRWOszxQKX5jEM6JVpx1ScdKsKvjk8+pftayP6xOwAk2VZA/fOfHTq4XO7f?=
 =?us-ascii?Q?f820dUMn7iz96FUnaN7uFa7khbhbL3bJ4VcMmXL4W1CtdlxgJegTfLKewr8w?=
 =?us-ascii?Q?Jizg8TAJU1esAfgOtsS9uhbN9LvGMl1QPObT3UpuxcbhyROlaBw31y0c0gSu?=
 =?us-ascii?Q?ZDDrrUjd4JinhETzu2n5v+/Lj8hq4n9QcyJBomdX/nZf2FGIvZ+y6HsD4mmc?=
 =?us-ascii?Q?TZyEuTmor4Cld8CNzKImM1+qBEw/1Gj/Bj1drt1V5AFNNyl3FviYDcTp8aOP?=
 =?us-ascii?Q?yM7XVJL0iWLD21sehKZd9evihcqi388zTwE4Z2X9TnWXkIrpK6p43z1iqUCO?=
 =?us-ascii?Q?MN5Ca5MNONsWzwHA31H7ER3zsk4DgTkSK5QUPHa0z09FGXMRbpaAgPeE/LdT?=
 =?us-ascii?Q?arOTQdqFs8zmfJJCBs53GaY3J5u0t55ALYKLSSDuMeYuYKgkm/mu/1RgZA/O?=
 =?us-ascii?Q?SSJ/gqVH1sd4m7fAGSYFpsz+2yorpB0JdP5xV8QcKohxuJLNoMy6fOgcUuPE?=
 =?us-ascii?Q?rQEbfXgDeZOrDxBBtSHi304sGLI8yJ+mltoF8s7JKQuKgw8FB5O1Zz+0Z5fh?=
 =?us-ascii?Q?+C7sM/r/CoyiUBWpCCxIm+9MRv3xoaBuFZtIMG1ndK2AXTB10hPmas2Qqv8q?=
 =?us-ascii?Q?jUeiTnN3cbsIJuHcO7NnbwS3r3pwBi8cUOxAbsPoUbOFH7fsOspwQmAX8Wbr?=
 =?us-ascii?Q?tqkOGIqh5tpBvXZ+zShlEBCgpUo1/OzjndQXtefnmBXeneBPFmsLa7O/juSX?=
 =?us-ascii?Q?xaLc/I8QRGv9KkyYCmFTCCSS6EXpz0Qks7GuyQk4TNeq6jU2eZUyv5aSiRIv?=
 =?us-ascii?Q?CjBPyjqJluWFiIFa7o/nE1FSDMqsblrU0zIhaZv/eClRQhHrYcTyPu/x0Wfo?=
 =?us-ascii?Q?/zlWnOxGqxLa75lhn/2FKVvQ5EU63no17TMGtLonaLmRWVO0G1Ob7+na3Mxo?=
 =?us-ascii?Q?AeZSmLAkIZRkDstPwt23wONYlSnP04OLuzac434ZuYZxQ5tbWiQ6BL1uhxpA?=
 =?us-ascii?Q?03partCZlgsfQLJIopQijDNjkRUnyjW3HR8q2rcSl25TdymGIDORYX7t31hb?=
 =?us-ascii?Q?z5oqZrG4EJ3WT5SwhUgjzK8YBzVeKbI7x2PC5qN3+gs89gAodHGtp8ae9JVX?=
 =?us-ascii?Q?cPUpnt2wYXnCq8hwlhnSX+/qmPWvAJCLf4PMvsTozyz+ncgIpbQ0st6qJ0t4?=
 =?us-ascii?Q?e3ksSAY6Js6ez2skiEHyaBT9rTLxSFhisogbZv9Eh6guEBjDIm5UTfxMYYQL?=
 =?us-ascii?Q?ZKjQQJuf2Y4WS9CgkuSMsLj4QQCujn1FgRSP8Q1nFxn1DPrWP419dkgbKvvj?=
 =?us-ascii?Q?YSbPmgtz+KUmrhmdk1UVQou4MZVNOBci3tpCvsqsVOvFmCWc7P+S1s/78oc/?=
 =?us-ascii?Q?POjZMfAas8UQcjF3yNxdfSH77MzGY729OB2HJamJmvs/4405/T7q8M1fwUYG?=
 =?us-ascii?Q?C9xFt3Ywig=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10f9922-ef7d-45e7-9214-08da276efd38
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:24:47.7387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNFZxoShOn2H5jv/F0NglxLAcX4RnlxBbhVkdkTMDnCmjlmVvB6+w7FqPat3sMubNKwGHPfZ5CTLMPb/DN069A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4245

In send_memory_live() the precise value the dirty_count struct field
gets initialized to doesn't matter much (apart from the triggering of
the log message in send_dirty_pages(), see below), but it is important
that it not be zero on the first iteration (or else send_dirty_pages()
won't get called at all). Saturate the initializer value at the maximum
value the field can hold.

While there also initialize struct precopy_stats' respective field to a
more sane value: We don't really know how many dirty pages there are at
that point.

In suspend_and_send_dirty() and verify_frames() the local variables
don't need initializing at all, as they're only an output from the
hypercall which gets invoked first thing.

In send_checkpoint_dirty_pfn_list() the local variable can be dropped
altogether: It's optional to xc_logdirty_control() and not used anywhere
else.

Note that in case the clipping actually takes effect, the "Bitmap
contained more entries than expected..." log message will trigger. This
being just an informational message, I don't think this is overly
concerning.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: To address Andrew's objection, J=C3=BCrgen suggests to widen struct
     xen_domctl_shadow_op_stats'es fields; yet within this same series
     we had settled on there not being a need (17e91570c5a4).

--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -427,7 +427,6 @@ static int send_checkpoint_dirty_pfn_lis
     unsigned long i;
     uint64_t *pfns =3D NULL;
     struct iovec *iov =3D NULL;
-    xc_shadow_op_stats_t stats =3D { 0, ctx->restore.p2m_size };
     struct xc_sr_record rec =3D {
         .type =3D REC_TYPE_CHECKPOINT_DIRTY_PFN_LIST,
     };
@@ -437,7 +436,7 @@ static int send_checkpoint_dirty_pfn_lis
     if ( xc_logdirty_control(
              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             0, &stats) !=3D ctx->restore.p2m_size )
+             0, NULL) !=3D ctx->restore.p2m_size )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -495,7 +495,9 @@ static int simple_precopy_policy(struct
 static int send_memory_live(struct xc_sr_context *ctx)
 {
     xc_interface *xch =3D ctx->xch;
-    xc_shadow_op_stats_t stats =3D { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats =3D {
+        .dirty_count =3D MIN(ctx->save.p2m_size, (typeof(stats.dirty_count=
))~0)
+    };
     char *progress_str =3D NULL;
     unsigned int x =3D 0;
     int rc;
@@ -511,7 +513,7 @@ static int send_memory_live(struct xc_sr
         goto out;
=20
     ctx->save.stats =3D (struct precopy_stats){
-        .dirty_count =3D ctx->save.p2m_size,
+        .dirty_count =3D -1,
     };
     policy_stats =3D &ctx->save.stats;
=20
@@ -633,7 +635,7 @@ static int colo_merge_secondary_dirty_bi
 static int suspend_and_send_dirty(struct xc_sr_context *ctx)
 {
     xc_interface *xch =3D ctx->xch;
-    xc_shadow_op_stats_t stats =3D { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats;
     char *progress_str =3D NULL;
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
@@ -694,7 +696,7 @@ static int suspend_and_send_dirty(struct
 static int verify_frames(struct xc_sr_context *ctx)
 {
     xc_interface *xch =3D ctx->xch;
-    xc_shadow_op_stats_t stats =3D { 0, ctx->save.p2m_size };
+    xc_shadow_op_stats_t stats;
     int rc;
     struct xc_sr_record rec =3D { .type =3D REC_TYPE_VERIFY };
=20


