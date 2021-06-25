Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 395DD3B443F
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 15:18:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147182.271121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlii-00073I-Sw; Fri, 25 Jun 2021 13:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147182.271121; Fri, 25 Jun 2021 13:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwlii-00070b-Pk; Fri, 25 Jun 2021 13:18:08 +0000
Received: by outflank-mailman (input) for mailman id 147182;
 Fri, 25 Jun 2021 13:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwlih-00070V-PT
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 13:18:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69681104-e8f7-4c5d-b555-e3c8c279dfcd;
 Fri, 25 Jun 2021 13:18:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-KqQchVhzMAOVMuuGLRSrHg-2; Fri, 25 Jun 2021 15:18:03 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 13:18:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 13:18:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Fri, 25 Jun 2021 13:18:00 +0000
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
X-Inumbo-ID: 69681104-e8f7-4c5d-b555-e3c8c279dfcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624627085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeQBwOgFXz1U60UH22PesVSYD2OW+F4k/D3F8uvruuE=;
	b=eg5wtkpQPFBx06fcBrkFJ01lF04gvcDZoaUs9wYLfgNroC4ru8jFeRSCsKJCjGR74jwigN
	YpHMW5Ny0kiad9vV3eIo6tONH8padz/c5S0Lk/nojkH8MZNK7+ftxWlxRTYqPoU2ZHXO/O
	WyfZ2uxa5SvaC54VWbUpTzSYiII8Sss=
X-MC-Unique: KqQchVhzMAOVMuuGLRSrHg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dseunScbm2NtiRmMFfxv7+JtHsjbkdtXWGzJ0kBVUZa8HdcrkuV9cS3MvJpdqoMXQ7FKcZvd2roi9Kvfam8gnhsigbjvY3Exc3MzxRXYsBAHK3QSVbt5JaqFTIgIIQofiBTvTOjh3z+xmgHSB3/2h9qFvjiFzHS+9v7pcgtmUiIOf5dG6HsAV11PwZ1Ta7twR23LleaabRMymirVbRFBkEnp+ZUgi68UI9O6AWZafmrM8TmpmJG+YZTM+ijipAeeTM4DhOw3Yoc4SoA5CfxKvnoXtlKbCQquEgoSKKXuhq4EWMXjn5CRfZ/KWXb0MVXzbfSK3FafQVIhwhCy5i2Z6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeQBwOgFXz1U60UH22PesVSYD2OW+F4k/D3F8uvruuE=;
 b=D79moY8/s1aYZe0Ko9ixZb0D36RXv+ExIhaiyTbz0AYy2GbuGRQ5a3IegVRr/0T51TiPpiPl/Ddo6C0dHdfTbntBzxCGx0h2dYa8FbHmEZ+Cv3ZJsqoCMHToJlvJjcSXu+68YF4Xj1QDK+vk+XkZODsg6qTQBoTn7nrgynJlXVH453GIXUZ4ciwr1izeFgViSUJUPP2TKBJuYByyeOhydT+LqKWQeab3m6Wqo9Aj//Tdgk00JL6MKMJZgYSgC2gFqTwM7dvyCZlIL99JKFbFd2OlCZTsGbzV3X8/Zvi6JdvCOwPevfXVCmvAmKgBv7/i+g4wk3XVokTFqNv716Ggyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: recoil.org; dkim=none (message not signed)
 header.d=none;recoil.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 01/12] libxc: split xc_logdirty_control() from
 xc_shadow_control()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Message-ID: <e928490c-d13c-8041-0ff7-e8b69ee73d6e@suse.com>
Date: Fri, 25 Jun 2021 15:17:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR2P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e92da259-073f-45a1-d9b7-08d937dba846
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4384A242F8605036A3CE1A6CB3069@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:534;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	It0xrBrFKURpFyrZyygOFZ2nDK2PLUEiY1ql+UpoXtcXZDpSaCuakctF3scLM0XaP9NZDZ0+U2pw4zwsjHQbIc5A1no+/OgZlgcRVWUnWHgORbrODSfvx/e58cGESLhpheA1LDJ83Cegbu+RDuK/uAxK+pe2DqXdRCv+uUe0DGd0k1XfsTDNRHFwaFBD53w6dPAwDcgoiApw/VlUlb8MfcDAVIMYS+HXk0fN47VOqyoHSjDWh5UUe12DjWj9T/zbnBfYmmk7cjYEc4bIaign6Lkd/prxVNLdsS8k1cXLbw7h8M204Dipy9cpT0ac4j3rnjfdOzhEuJyAljAl63EB87LIO5Clv4lmWKI66R5qu7ky8uHBUOp6IItcx8/XpitjbbSJBh0HwCmsU3/67SYeOjGZfhqB5KmJn/Nf3sBqkE+7w1GDBPeR6MqwVsFrUrLHI+R1JFTgUJDyXI3U2LgFErJTDFFbatWk9cdWM6+BPtDhd3NbtdwUMGzlS5Ja1bdEoR0Q5Xn/NeHc8dHb5Ot5CuHsjNkvaChJxUYlwgZazNjvpCeWRWrgbw5goDuC3WzAZnZnwYeajeVfOltuKVi7Viq1xw3r/smga9AtUwf+7wqlFWSt78FywTXsHED05A00e6C3pGKcO9eLv6PfnC6d1qcwcYkLrlEIcDvsUOCTFetSsmPTBmxOltuSjb5R8zdP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(54906003)(83380400001)(316002)(16576012)(2616005)(956004)(186003)(6916009)(26005)(8676002)(66556008)(66946007)(4326008)(16526019)(66476007)(8936002)(478600001)(5660300002)(6486002)(36756003)(38100700002)(2906002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1Y3ZnJ0eUtJNllqL3dpVWNndHNjbDBOejRjTkc5c3RPallPT0t0WG1WMWYz?=
 =?utf-8?B?MHB4eFUrTkswa1UwcmFVL0FnT082U3dsUG12Mm1FSndhWkNOU1c3Ymw0NnR3?=
 =?utf-8?B?cDlGMkw3bmh2R0YrcjRxR29hUHI4bUJKNDFIRC9iRTNPczZpa3h6TXlGYXRY?=
 =?utf-8?B?cWc2SGhNT29GWjAxZ2kvek83YUxqOGM3VXRlSnlCT1VGQTNIeHY0MS85ODdC?=
 =?utf-8?B?VjVDUktPc1FsY05EMmc3UUVSa1lSZHNsM2dYeUFHNDhTaEgzaXFEemk5VzFO?=
 =?utf-8?B?djVxRVgyYXEvbjNUTk9FMGt3VnVOVGxBSFBGVm5IUUh6OGVOaHp3RTk4NGVR?=
 =?utf-8?B?dG5heWpaWkpySGV4V3hMWHllRldSaHo5VU4zZ0lKVVBQdXFwK2VTcGJra05w?=
 =?utf-8?B?WEJOZkhON3dRczM3cm5ZTjVZbUpiRjBuUXRBdi91LzU4L0NoZXF6ZE5KRnE5?=
 =?utf-8?B?QXQxTTVBNUtWNDF3Zlo3ZnpQNEwyMmFpRXN4QTRKN1dFczViZU5RNUYzKzND?=
 =?utf-8?B?WlhDN00yYzdSM2FPdjF1ay9mVjR1alQzNFY3MjdsVFJGZDRqenVmbmVIb2Fi?=
 =?utf-8?B?Z2w4TnM0OGRDQ3FGOVhiN2RQcTQ2aThBR0ZCT0JwYVFlOTVEQTE3bElrQTdF?=
 =?utf-8?B?NnJmaWhveEJMdVBiREUxQytnbEc0SlF1QjVYWHp1TU9RekhHdG9lU1NuemVZ?=
 =?utf-8?B?QmU3MkxveDc1NzJyeHhpWStWK1d5UWZpUnlCQnptNUg2L25SeGtEY3JXQjRN?=
 =?utf-8?B?WEdIMjJlYmhxazFnQ2RIVE8yaStxSjRFc2lBYzJqRHQrNkpSSmQwNnB2djR5?=
 =?utf-8?B?d0JUcU5zaXV1cWNiZ0VNTXBkMlVjTmJKb1ovVWJQd0VuNzJ0R0J2TEVTUS9r?=
 =?utf-8?B?ak4yYkhEUXUzTURRRThrRFc3SDF2NFRERkZLMklNQXFUSURRMzRjcXcwbzNI?=
 =?utf-8?B?S0dKTGNDWFJUMDJPUy9aYnhqVlhwQXA4TzZpOFpDYVduWmZKTmpHZVo2QmV6?=
 =?utf-8?B?QXArSldiaithc0hvVGloSXc0MDhtVWlJMVBzZGc5cXJET2R3eWxwS3RUdWpE?=
 =?utf-8?B?MWwwNm9ydVlLMFpVb2NOWWI4VFl6WWYxMjFkS1orQW50d0JUZjRRK3FxQ2tv?=
 =?utf-8?B?S2MvWTJ1Q3hsUW9oWFBVSWtJQldnRzFnWWhQN3dVdlJKTWFFWkNDazcxL1c4?=
 =?utf-8?B?NHNUWGpTMTVMN05IZDZFOXB4eWNrL05RR3dHakJSN2I3dlFOV0Y2eHVBQTRl?=
 =?utf-8?B?MGxBQnVDTWZtME5mVDFiOHZkZThqY0ZCY3Ewc1NYeGV0cjdMYmUxYmxOSnNl?=
 =?utf-8?B?a3dnRW0vUkh2NVZPVS9IZ1A5QkczSHFHb1ZBcnl2anhobTRGZ3daa1JiWnNO?=
 =?utf-8?B?RktWTFlFTzI5MHZIUEpjdlorVGpWUDFrNndTcXc4Nkh0RkpuaVJ3Tlkyb2l4?=
 =?utf-8?B?QjI1ZjEweW9oZnRnRS81OG5Ic0ZBNmJyaEdKK0ZaenVHU2ZoMWg0YUhxRXFH?=
 =?utf-8?B?eVd1cXJqQnRWRmlncVJYM01qTHM3RDNOUVpPTXdGN0YvN3V5U1ZuU2lIWTdy?=
 =?utf-8?B?cDl5M1pwbnV5NjdaVHFTQWN5Wmd4OHcyT1hnRkpyRWY0WDFBa1psNytBenBy?=
 =?utf-8?B?YURXN1MyalE5NlA4cjhEdWI2aHNReGMyM3dhTlJMQkhGRklHR2hzdDNlT21t?=
 =?utf-8?B?bW84QVJHdGhIMFNpUURFWm96UXliRERwL1U0UlhHS0d6Sm0vU2RtK3hjY0Rm?=
 =?utf-8?Q?mWRSBhPeMcjvzvzH8DOV98BAjRQYtmyScclWGRw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92da259-073f-45a1-d9b7-08d937dba846
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:18:01.1716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LAqQKHfSf7xa/wgithWnWfYS/uMF8U/kxZMYnGIdD0mUoEjVz1QdxEsHY2TnGhC6qWzrGqDw08GhIuZ7nkVNoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

For log-dirty operations a 64-bit field is being truncated to become an
"int" return value. Seeing the large number of arguments the present
function takes, reduce its set of parameters to that needed for all
operations not involving the log-dirty bitmap, while introducing a new
wrapper for the log-dirty bitmap operations. This new function in turn
doesn't need an "mb" parameter, but has a 64-bit return type. (Using the
return value in favor of a pointer-type parameter is left as is, to
disturb callers as little as possible.)

While altering xc_shadow_control() anyway, also adjust the types of the
last two of the remaining parameters.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder whether we shouldn't take the opportunity and also rename
xc_shadow_control() to, say, xc_paging_control(), matching the layer
above the HAP/shadow distinction in the hypervisor.

--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -885,11 +885,15 @@ typedef struct xen_domctl_shadow_op_stat
 int xc_shadow_control(xc_interface *xch,
                       uint32_t domid,
                       unsigned int sop,
-                      xc_hypercall_buffer_t *dirty_bitmap,
-                      unsigned long pages,
-                      unsigned long *mb,
-                      uint32_t mode,
-                      xc_shadow_op_stats_t *stats);
+                      unsigned int *mb,
+                      unsigned int mode);
+long long xc_logdirty_control(xc_interface *xch,
+                              uint32_t domid,
+                              unsigned int sop,
+                              xc_hypercall_buffer_t *dirty_bitmap,
+                              unsigned long pages,
+                              unsigned int mode,
+                              xc_shadow_op_stats_t *stats);
 
 int xc_sched_credit_domain_set(xc_interface *xch,
                                uint32_t domid,
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -650,25 +650,48 @@ int xc_watchdog(xc_interface *xch,
 int xc_shadow_control(xc_interface *xch,
                       uint32_t domid,
                       unsigned int sop,
-                      xc_hypercall_buffer_t *dirty_bitmap,
-                      unsigned long pages,
-                      unsigned long *mb,
-                      uint32_t mode,
-                      xc_shadow_op_stats_t *stats)
+                      unsigned int *mb,
+                      unsigned int mode)
 {
     int rc;
     DECLARE_DOMCTL;
-    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
 
     memset(&domctl, 0, sizeof(domctl));
 
     domctl.cmd = XEN_DOMCTL_shadow_op;
     domctl.domain = domid;
     domctl.u.shadow_op.op     = sop;
-    domctl.u.shadow_op.pages  = pages;
     domctl.u.shadow_op.mb     = mb ? *mb : 0;
     domctl.u.shadow_op.mode   = mode;
-    if (dirty_bitmap != NULL)
+
+    rc = do_domctl(xch, &domctl);
+
+    if ( mb )
+        *mb = domctl.u.shadow_op.mb;
+
+    return rc;
+}
+
+long long xc_logdirty_control(xc_interface *xch,
+                              uint32_t domid,
+                              unsigned int sop,
+                              xc_hypercall_buffer_t *dirty_bitmap,
+                              unsigned long pages,
+                              unsigned int mode,
+                              xc_shadow_op_stats_t *stats)
+{
+    int rc;
+    DECLARE_DOMCTL;
+    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
+
+    memset(&domctl, 0, sizeof(domctl));
+
+    domctl.cmd = XEN_DOMCTL_shadow_op;
+    domctl.domain = domid;
+    domctl.u.shadow_op.op    = sop;
+    domctl.u.shadow_op.pages = pages;
+    domctl.u.shadow_op.mode  = mode;
+    if ( dirty_bitmap )
         set_xen_guest_handle(domctl.u.shadow_op.dirty_bitmap,
                                 dirty_bitmap);
 
@@ -678,9 +701,6 @@ int xc_shadow_control(xc_interface *xch,
         memcpy(stats, &domctl.u.shadow_op.stats,
                sizeof(xc_shadow_op_stats_t));
     
-    if ( mb ) 
-        *mb = domctl.u.shadow_op.mb;
-
     return (rc == 0) ? domctl.u.shadow_op.pages : rc;
 }
 
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -459,10 +459,10 @@ static int send_checkpoint_dirty_pfn_lis
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
 
-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
              HYPERCALL_BUFFER(dirty_bitmap), ctx->restore.p2m_size,
-             NULL, 0, &stats) != ctx->restore.p2m_size )
+             0, &stats) != ctx->restore.p2m_size )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         goto err;
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -428,18 +428,18 @@ static int enable_logdirty(struct xc_sr_
     /* This juggling is required if logdirty is enabled for VRAM tracking. */
     rc = xc_shadow_control(xch, ctx->domid,
                            XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                           NULL, 0, NULL, 0, NULL);
+                           NULL, 0);
     if ( rc < 0 )
     {
         on1 = errno;
         rc = xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                               NULL, 0, NULL, 0, NULL);
+                               NULL, 0);
         if ( rc < 0 )
             off = errno;
         else {
             rc = xc_shadow_control(xch, ctx->domid,
                                    XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                                   NULL, 0, NULL, 0, NULL);
+                                   NULL, 0);
             if ( rc < 0 )
                 on2 = errno;
         }
@@ -556,10 +556,10 @@ static int send_memory_live(struct xc_sr
         if ( policy_decision != XGS_POLICY_CONTINUE_PRECOPY )
             break;
 
-        if ( xc_shadow_control(
+        if ( xc_logdirty_control(
                  xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
                  &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-                 NULL, 0, &stats) != ctx->save.p2m_size )
+                 0, &stats) != ctx->save.p2m_size )
         {
             PERROR("Failed to retrieve logdirty bitmap");
             rc = -1;
@@ -653,10 +653,10 @@ static int suspend_and_send_dirty(struct
     if ( rc )
         goto out;
 
-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_CLEAN,
              HYPERCALL_BUFFER(dirty_bitmap), ctx->save.p2m_size,
-             NULL, XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=
+             XEN_DOMCTL_SHADOW_LOGDIRTY_FINAL, &stats) !=
          ctx->save.p2m_size )
     {
         PERROR("Failed to retrieve logdirty bitmap");
@@ -716,10 +716,10 @@ static int verify_frames(struct xc_sr_co
     if ( rc )
         goto out;
 
-    if ( xc_shadow_control(
+    if ( xc_logdirty_control(
              xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_PEEK,
              &ctx->save.dirty_bitmap_hbuf, ctx->save.p2m_size,
-             NULL, 0, &stats) != ctx->save.p2m_size )
+             0, &stats) != ctx->save.p2m_size )
     {
         PERROR("Failed to retrieve logdirty bitmap");
         rc = -1;
@@ -834,7 +834,7 @@ static void cleanup(struct xc_sr_context
 
 
     xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                      NULL, 0, NULL, 0, NULL);
+                      NULL, 0);
 
     if ( ctx->save.ops.cleanup(ctx) )
         PERROR("Failed to clean up");
--- a/tools/libs/light/libxl_colo_restore.c
+++ b/tools/libs/light/libxl_colo_restore.c
@@ -62,7 +62,7 @@ static void colo_enable_logdirty(libxl__
     /* we need to know which pages are dirty to restore the guest */
     if (xc_shadow_control(CTX->xch, domid,
                           XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY,
-                          NULL, 0, NULL, 0, NULL) < 0) {
+                          NULL, 0) < 0) {
         LOGD(ERROR, domid, "cannot enable secondary vm's logdirty");
         lds->callback(egc, lds, ERROR_FAIL);
         return;
@@ -90,7 +90,7 @@ static void colo_disable_logdirty(libxl_
 
     /* we need to know which pages are dirty to restore the guest */
     if (xc_shadow_control(CTX->xch, domid, XEN_DOMCTL_SHADOW_OP_OFF,
-                          NULL, 0, NULL, 0, NULL) < 0)
+                          NULL, 0) < 0)
         LOGD(WARN, domid, "cannot disable secondary vm's logdirty");
 
     if (crs->hvm) {
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -529,10 +529,10 @@ int libxl__arch_domain_create(libxl__gc
         xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
 
     if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
-        unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
-                                           1024);
+        unsigned int shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
+                                          1024);
         xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                          NULL, 0, &shadow, 0, NULL);
+                          &shadow, 0);
     }
 
     if (d_config->c_info.type == LIBXL_DOMAIN_TYPE_PV &&
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -997,13 +997,13 @@ CAMLprim value stub_shadow_allocation_ge
 {
 	CAMLparam2(xch, domid);
 	CAMLlocal1(mb);
-	unsigned long c_mb;
+	unsigned int c_mb;
 	int ret;
 
 	caml_enter_blocking_section();
 	ret = xc_shadow_control(_H(xch), _D(domid),
 				XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION,
-				NULL, 0, &c_mb, 0, NULL);
+				&c_mb, 0);
 	caml_leave_blocking_section();
 	if (ret != 0)
 		failwith_xc(_H(xch));
@@ -1016,14 +1016,14 @@ CAMLprim value stub_shadow_allocation_se
 					  value mb)
 {
 	CAMLparam3(xch, domid, mb);
-	unsigned long c_mb;
+	unsigned int c_mb;
 	int ret;
 
 	c_mb = Int_val(mb);
 	caml_enter_blocking_section();
 	ret = xc_shadow_control(_H(xch), _D(domid),
 				XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-				NULL, 0, &c_mb, 0, NULL);
+				&c_mb, 0);
 	caml_leave_blocking_section();
 	if (ret != 0)
 		failwith_xc(_H(xch));
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -1192,8 +1192,7 @@ static PyObject *pyxc_shadow_control(PyO
                                       &dom, &op) )
         return NULL;
     
-    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, NULL, 0, NULL) 
-         < 0 )
+    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0) < 0 )
         return pyxc_error_to_exception(xc->xc_handle);
     
     Py_INCREF(zero);
@@ -1208,7 +1207,7 @@ static PyObject *pyxc_shadow_mem_control
     int op;
     uint32_t dom;
     int mbarg = -1;
-    unsigned long mb;
+    unsigned int mb;
 
     static char *kwd_list[] = { "dom", "mb", NULL };
 
@@ -1223,7 +1222,7 @@ static PyObject *pyxc_shadow_mem_control
         mb = mbarg;
         op = XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION;
     }
-    if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0, &mb, 0, NULL) < 0 )
+    if ( xc_shadow_control(xc->xc_handle, dom, op, &mb, 0) < 0 )
         return pyxc_error_to_exception(xc->xc_handle);
     
     mbarg = mb;


