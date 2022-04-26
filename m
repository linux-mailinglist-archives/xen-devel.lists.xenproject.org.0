Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B250FA3D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313690.531373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njILX-00073L-Iy; Tue, 26 Apr 2022 10:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313690.531373; Tue, 26 Apr 2022 10:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njILX-00070P-Ew; Tue, 26 Apr 2022 10:23:03 +0000
Received: by outflank-mailman (input) for mailman id 313690;
 Tue, 26 Apr 2022 10:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njILW-0006S6-JL
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:23:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9bec955-c54a-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 12:23:01 +0200 (CEST)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2058.outbound.protection.outlook.com [104.47.9.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-6J0kHTrZPsScE7Om-U38Cw-1; Tue, 26 Apr 2022 12:23:00 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:22:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:22:57 +0000
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
X-Inumbo-ID: d9bec955-c54a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2Oz0ufU5ia0z18sXCTR49UR80Yr0jdm8EcVB0xMZ4o=;
	b=Cfh/VbTx+tWH7JWKLbmOS5f5sNk/jTyS2KA0yfOLjoA7jnLuonyqcfa8i/DT3IK8sxSmUL
	Kd28uVNOGwQsMz3zETMsMODoykfIpGCvGmxnfeBW6TLfjbV4Gxh/OD1KR/EtbNvd7oZgJQ
	dqHQ8kqw9y8V4T6l8DfXAvi4ZDN/e5A=
X-MC-Unique: 6J0kHTrZPsScE7Om-U38Cw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6y6d2WGVl1MPJyg5hlOK5lOLKJ2xMQgRCHBfCG4utAIiS4GtyNOBk3kQbYS+RLcVvt88M1AvwqOuqCcqHhT/pDV9H7o+fWjBvWHeDqq31zR7cuD8bBstXgajaeq1RxAgq0/A02a+Qaf2krgB8OZgb6DhcFPEiLlxs9xgEQBSyMzMHJJuMBunc6u60SQ9hxalXc7OJFkFHetTIOVd98JyDFfuoMediXffgpxl/gLbeDXnyZfV30yWS8niajOhFC5NA42t8Bgb5d7Qw3qK7Uu6q4C/Gqv7GTzmIQyot8qI30qeK7D+cYCCUS1wKpJ66MrusbXEWOPDJq2WtvNrqDjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2Oz0ufU5ia0z18sXCTR49UR80Yr0jdm8EcVB0xMZ4o=;
 b=MFMy+yHGcm0SjH8qUbzBLYTFhi9CaHs7lwpy9lMLkJSVAD5li8GgWUtzMcy8015hYuSCyU5ZPS7GUUikYlYyd6BuNEhCA7nxu99QEdmzOTih+og64JxEd3uEV2OmPD3vdXn9iJgSsB/2t/owIzfQg6tpo08kNNaTP+EkHrjjz3dC+R3VipgUJudRD5z/D++MOUfor4st3BiUJbP1osEX61Mgp+KGMX8/si0M1ka/+/ZxSua4Z6/PyFDQgd6a8S/ePA74aWuQmFLAKttN6P/gJKauRUxRCsBfDSNwW5DXqIuN/D/w1kWgPj3NLZ8relthi7Xf7sK2bREgdrPkItxitA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f89601c-3226-d604-5681-aada9b3421d2@suse.com>
Date: Tue, 26 Apr 2022 12:22:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v3 2/8] libxenguest: avoid allocating unused deferred-pages
 bitmap
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
In-Reply-To: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0104.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::45) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f56708a-076f-4bef-02a1-08da276ebbce
X-MS-TrafficTypeDiagnostic: AM7PR04MB7157:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB7157EB3956A4EFD089601397B3FB9@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XEejfc+DVGCnsWMm5hkNE2oyxQhLwA4Fl0icFZCn+AUXoW/vGIUX7Fh/eC2SpfgPOa4UaZyAx4NPfVLp+y65VrnV1YzxDXFjYcMxutukbCYoE5DVOjZ4jmYgU2AbBZvGlzPoUGXYB3GV4Gd/EAkqDN6Y++cKOQCYe2GCmZAKv+AZOzq+eeeDI7vyjuN+mI+X27LZ8rfGlDkQbwo/bLTES7whwGaEGp50L5ZnLPD0ZaNt4c4Ftya4G18N4M/hOUL1na1Fi1PpvGutKe/wqBG3cVvvZksAqZoFOcZMnQcrSE9sOyfUk6TonqadBaGpzJb0gzGWwuhYz4wldEtraXIWituB4jj9PNTKsYvR5Q85kw5eJ1N0ck/8HZ/zGHDTcc/oEo6pWedOiRSWHE2ecvCh4N51cnokin96UaAHC+BhUZnJ13LekbYR7AwJ7RhBwdBAwlDXTgdejAxcV3/02Ei1rZpQUh53+SrFgDaoSf7XexiUYhYrtrrpxyYRiwcCuyua1TCw1n45IOhQT9ehs1aO1pogQub1M13DMZjipWmV03I1TM+XgfdIibjegG7C/270hqrncbqw8ZwPM7/BCJmqXfJwmnqcYNeTbDjOI1uOe1Xen9Dbj+zG0TSOrkCiTMhPWn/S8358cMKlyKvmKgzbBFfJIKGmVgUX4B2X+l/0B9LncTIoA2WN79pOIehogX0ep0vOhg58X4SYmvRgq8mdxESCR9AKf7EEEmPMPX/NABJfYxOKBXq2C9gQOHYrYHZG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(66946007)(508600001)(316002)(6916009)(8676002)(4326008)(31686004)(5660300002)(8936002)(38100700002)(6506007)(86362001)(31696002)(66476007)(66556008)(6486002)(6512007)(186003)(26005)(36756003)(83380400001)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFJ0bnBEZnNKM2N5STJlVDZWbEpaVXdmdmYxVEhPbUJRS29abWxja0k1RTlv?=
 =?utf-8?B?Q29YbCtJZlRyaXYxT0dWeDlrd05SaU5aUTduTW01dTdzVFR0WktTS3RTOGlJ?=
 =?utf-8?B?bGR0NmRhWHFJY3l4bE80ZXhoaGxTN0gzMGx5a1ZNT2g1OUZpUmxtYXFEZ2hU?=
 =?utf-8?B?MWdlcHV4RCtzbU1uM0ZGc0NKTko0blZmYzBGVjlWL3hCWSsySE9xRmNiNUc3?=
 =?utf-8?B?NWVWUSsxTW9sYzZXbUhKTVlqSlJodVNCR28rMkU4aFJtSS9jWDNHRVFubmFr?=
 =?utf-8?B?NW1IRFREemNRdHpFQ25LRko5WmdWbGJSU3BLVVY5RkdPLzVCSThuWFJleW1Z?=
 =?utf-8?B?Sys3c1ZSaWVjN2NTVElQVk9uWk9kVkQzVGNLSmhyeXh0dER5NUxzTSs1UVA5?=
 =?utf-8?B?L0VUaGhPV3JvTDJXSWhzZitIUE9yYjNDb0xpVHlLTSthaHJQVlo4RlRic3RB?=
 =?utf-8?B?YlNFTkhqRzVBNkhRY1J0dTN5cUpMaGtvWk0zRDlsSld3TG5TTEtHT2F4bWJh?=
 =?utf-8?B?S1N2RDQ5SFFzRzFwRk03dDRUMGVrT1dJaWV5ckJLUllDQlk2emoxajlndy9z?=
 =?utf-8?B?d3RBTkJFM3NkWU9sYjhnbHlYSlJTcktuT2l6ZUNmUXdiYlpLbFo4dkk1VlJ4?=
 =?utf-8?B?bmhjNU8wVENxVTBKMjZVdkF4VTZzZkY1WndUQ1g3MlgvVUNMRVFrak1NNGNJ?=
 =?utf-8?B?WUcxOURoRzQ4SmZTY2xOOWxTejA2a1pxTXBrTXZtbXZWZFVrdFVzQ0pYbGVV?=
 =?utf-8?B?em5qTGEzRjByZEh3cTlSZkdZRGNNR29GTko0b3RnUzh4WUhBQ3NuNzRQMU1P?=
 =?utf-8?B?dlFQc1Y2eTgrVU0yZS9iZ0kwQktiOWpQSUJ0eXRqU09yNkcxU0UxK3c3a2Fn?=
 =?utf-8?B?QURXb0JXVFZHTFN2M0xMK3J1NGFvNWx4N3VseUZkaXlOUkRoY2tDRStPTGp0?=
 =?utf-8?B?UTUvUFNoeDFPbnpDR2Rrc3NHTGhIL0l2ck9VT09jM2wvcFQrNXM5YlVWYklX?=
 =?utf-8?B?R0txWFdGcHNsc21vMmNmNzRJRm1uMGUxQ2NBUXg1bHhqUlJZVWdyM0VuM1dv?=
 =?utf-8?B?bmoyVXUrbXNUeko1cGtzQ0E2cUxudHhMNVViVlZvOWhzbGVYM0NDRU96UnJ5?=
 =?utf-8?B?RGhkR1BnajdneEZmOGt6NlpiL3A5M2JNTkVhVm1TenpTblorVk1iNHU5dHMw?=
 =?utf-8?B?STA5WFpDUDBxV1pkVERsVUxIV01tUDI5MWJNSEJNYnhrUWJaR0pSY25PKzNj?=
 =?utf-8?B?ZEtEL0wrRk9vNy82Q25jNHd4QlpQZStZb0pBamlmaFFxQWtqRGFzVlU1ZjFk?=
 =?utf-8?B?UGlPVC9XK1liZU9LUWZLZkl5TCtyT3ZoWGc2VDRVMElvdHZLS1JPRENXYklI?=
 =?utf-8?B?R0oyMWY2OWhQdU1QN1I5cFp4UXFOaEROVmV5TFJqT3craDBTcGhiQ3lnUHRJ?=
 =?utf-8?B?N0NySEZ3NWhLYXl1bk53Z1lYOE50ZVJKb2o2TWxOZklVYm9kakN3cnIwalNV?=
 =?utf-8?B?Yi9rSmk3cEwvaDFaVnNOcVpHM3RCbVM2ck9WSE5hTWhFOUpjaWtMMXJvaUZG?=
 =?utf-8?B?UkJpU1dWVktMRVdoZ0t1L3VtQmhWRkgvRGlET1VZNEo4QkZ5L3hROGd4cXZo?=
 =?utf-8?B?b0ZJYmNPWE9vSFVsUmx2VVZ1QTNGVUhRS2pHWnNpU2Z0SE5TZWdzTXR4c1NL?=
 =?utf-8?B?OVBYWHNKWUxmVUN5eU9heTFWaVVHSkRDWmlpNzV1QmdYR1NNbk9qV2VrUE81?=
 =?utf-8?B?U0M2UmZZYXRBSzlScW1OajVDajRhSkE2WDZxNVdocDFpQ1ZEWStxYmZoZXFr?=
 =?utf-8?B?aGJBZmJiYkovK1dXaDBVY2VJWmU3MllxTk9XS2RtRGlIUENuVnZ0VG1HTW1i?=
 =?utf-8?B?NzBJYVg3aDErVWRPRkdTTk5vblh3WGVibDIvU1V5S2RGWGZOcE9pb0NkSWFX?=
 =?utf-8?B?SHZmdUJ4eFpNL1dnNWNJR3ZWOVZSM0JrM2doUjhuL1BmZi9RYkdnYTAwUWFh?=
 =?utf-8?B?cWJSQXI1UE1WTFRkT1ZzS1lvY3Z1dlJ0dXB0MzNRajN4U1pUclN0akFTQXVH?=
 =?utf-8?B?MUdtVXZlQkMvM21xa0FhbjJJTDM5elFJUEZUWnlGWnVmUTZVVmRSK3FOZUF5?=
 =?utf-8?B?aThYUUdLWnRWOGZlaXZIb080eVIvMDhwYjROeVhVZndPdE5lVFBRd0pUb29u?=
 =?utf-8?B?NUlTV1pTNS96bis4TmwvT0JxdFM5b0orTUlIMUk3Ny9xQjlUOXU1UFRIVTc1?=
 =?utf-8?B?VFBZRnVFcWZ0dXZtUm5HMnVJUGZUODFZdGw0ZksrOWgxeGFMNGZUZGdqb0dK?=
 =?utf-8?B?bUF0SUhyL0ZGS0pvRXF6aVkvU2ljdFpSanhwc01pWDQvdWNLSkFmQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f56708a-076f-4bef-02a1-08da276ebbce
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:22:57.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIPhLCoUEr6SNGg0CyemDOFdLzvL8fkkIgoF9ou7Q541UVBe4QiPK/NXuaEXlSDhhDVBATYMSjsyC9R0CT02zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

Like for the dirty bitmap, it is unnecessary to allocate the deferred-
pages bitmap when all that's ever going to happen is a single all-dirty
run.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Juergen Gross <jgross@suse.com>

--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -130,7 +130,7 @@ static int write_batch(struct xc_sr_cont
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN )
+        if ( mfns[i] == INVALID_MFN && ctx->save.deferred_pages )
         {
             set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
@@ -192,8 +192,12 @@ static int write_batch(struct xc_sr_cont
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
+                    if ( ctx->save.deferred_pages )
+                    {
+                        set_bit(ctx->save.batch_pfns[i],
+                                ctx->save.deferred_pages);
+                        ++ctx->save.nr_deferred_pages;
+                    }
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
@@ -659,7 +663,8 @@ static int suspend_and_send_dirty(struct
     else
         xc_set_progress_prefix(xch, "Checkpointed save");
 
-    bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
+    if ( ctx->save.deferred_pages )
+        bitmap_or(dirty_bitmap, ctx->save.deferred_pages, ctx->save.p2m_size);
 
     if ( !ctx->save.live && ctx->stream_type == XC_STREAM_COLO )
     {
@@ -676,7 +681,8 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
+    if ( ctx->save.deferred_pages )
+        bitmap_clear(ctx->save.deferred_pages, ctx->save.p2m_size);
     ctx->save.nr_deferred_pages = 0;
 
  out:
@@ -785,24 +791,31 @@ static int setup(struct xc_sr_context *c
 {
     xc_interface *xch = ctx->xch;
     int rc;
-    DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
-                                    &ctx->save.dirty_bitmap_hbuf);
 
     rc = ctx->save.ops.setup(ctx);
     if ( rc )
         goto err;
 
-    dirty_bitmap = ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN
-        ? xc_hypercall_buffer_alloc_pages(
-              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)))
-        : (void *)-1L;
+    if ( ctx->save.live || ctx->stream_type != XC_STREAM_PLAIN )
+    {
+        DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
+                                        &ctx->save.dirty_bitmap_hbuf);
+
+        dirty_bitmap =
+            xc_hypercall_buffer_alloc_pages(
+                xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
+        ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+
+        if ( !dirty_bitmap || !ctx->save.deferred_pages )
+            goto enomem;
+    }
 
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
-    ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.batch_pfns )
     {
+    enomem:
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
         rc = -1;


