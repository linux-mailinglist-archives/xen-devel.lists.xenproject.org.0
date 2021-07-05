Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA543BBEB0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 17:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150312.277938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QHD-0002kx-GG; Mon, 05 Jul 2021 15:12:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150312.277938; Mon, 05 Jul 2021 15:12:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0QHD-0002ib-DA; Mon, 05 Jul 2021 15:12:51 +0000
Received: by outflank-mailman (input) for mailman id 150312;
 Mon, 05 Jul 2021 15:12:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m0QHB-0002iP-GL
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 15:12:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74c9d2d1-dda3-11eb-844b-12813bfff9fa;
 Mon, 05 Jul 2021 15:12:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-DElJ5Ev7NLic4a7_EVn6KA-2; Mon, 05 Jul 2021 17:12:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 15:12:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 15:12:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Mon, 5 Jul 2021 15:12:42 +0000
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
X-Inumbo-ID: 74c9d2d1-dda3-11eb-844b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625497967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSF+8ncpJENw+5ko2Cel0fh192iyYi0fqzxuUE451AI=;
	b=VFP4zJ8vLVZfJkyKQR+DqxiIBh7FvyUZD4uwGOiq6YDjOBMjJgtANH4kT1ksyXB+4rdzse
	+kUICmp47KL9UHv7BJujR1mQOr7wsj8bJAbN2L71GaiTUUtynTKK/3gKl+MZF6ljxvIRmq
	odZx/l99yx/j2UOwxAz6dTBBAEJUP0w=
X-MC-Unique: DElJ5Ev7NLic4a7_EVn6KA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX7pewv2J/SAi6O+8CXw3kZ2afdsOcPEBeZXPBRdjfEnKHkPGc3qGIdNtnH5XLHJxtSC/3DDjpSD7AHvpQlUR1Hyk5oZqFuno3q7kiXXWok+M936SdY5B/ogxdLN38zIqE84dMPHyMLjfWYATKMx1j7ax4Fbags34gJQV2x72j83gtdOvRGQXBAsT+21XjT1WpWC9gh7VDgS07IpeHdHaz8mzHm2nLJK98zxxSNRt7ILGcNH4m8cko2GbPdJCVzJ+FcbOKLUOaSxGzelsOF7X38ZkUe9oDIJKLC/2rO8zMEFN46qpGFpCtI8zAQJxzXvIfrtpE+ccRXqUHJeusZvuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSF+8ncpJENw+5ko2Cel0fh192iyYi0fqzxuUE451AI=;
 b=i1+duneueEgIyI5hQ1G3Ss8COpSV+AxOlMH1IEJ3rLmkM+s7hnJj/W70ic+XdZqPV6COVPxb/nlLvUG8ilhWbLxDWo2Kl+oTxHYpeyhCVDPz8hjrwwpN6Kn2IUMxyd+ckCPqkFkT+N6fgzhZCp4gf2fkDQO0zwzGOdsPsNiNaWQHTkis8pqbMfzqRB+T9KLwDbJxxlqlPiY2f33RgodtdnWs0uOPOvlxEG/wcQ/V4tKmI5qUbnEIJ9Y3MB82K2/8LYhZhdttBM8tHDQxu5+qB3dksKW7syhhUeGY1Hr3KLllSQvbGsVk8/RyukGxkAhVeJ+mDjKZZenTl7BOBEHzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: invisiblethingslab.com; dkim=none (message not signed)
 header.d=none;invisiblethingslab.com; dmarc=none action=none
 header.from=suse.com;
Subject: [PATCH v2 02/13] libxc: split xc_logdirty_control() from
 xc_shadow_control()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Anthony Perard
 <anthony.perard@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Message-ID: <4b68233b-259c-3308-3292-82e991e1e108@suse.com>
Date: Mon, 5 Jul 2021 17:12:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR1P264CA0034.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4af11203-6bcb-4f94-ea2d-08d93fc756a7
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57432FD56FB8A6F014A50C04B31C9@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:109;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2Pi/QJeHpblpF7Ws4tWqv7ijzwJeKxVcM2juk7CnuJvEyy0ntuMAOySBa6quAwF9mAjhaxZQnXCtd8q3xC6NoDBE6IKXKuHt0vZrFEk7oggY8NgRcH1zss0eBcs5IyCO9nsCDpi5C4Vfi85bVk0ANzdE1ntdkh6oro8xADoR+Ev3eeIU/WwUCiktSI2Je4B6c529masBlb2jgO/a3Xus1MJ5Iwj4wF3Xj7pItGh0m1E3kVpe51W52+EVQ0ozTie7YNbd1Zno9gI4YBLtYFJFMqm5Ix+UAeQrJIfNuVKyb+Cwa8ExtoU3WEfBxEWftoHmFMznsegKu1+eOv3gqKqEPT3LcXbSLaSmPqNEbNcXpRUfUPegCtHQTWu+ZsP23GEAOKRc27snLKOflpz0LTdw+zy0fzF1wPQK3Diyr5IV6YhEmL3ozE9XPAMjip4Vt28MInzJm4Xti5FTr7fhj3/bvEBXcNYsLOSAgyJ/NWIDtKutJAft320bWL+XFbM8ghsHlzWbIi+8Fyn6PMweHSBCH03EcgbLm6/IDRu7N0hAodAAEEMvQx6pL4C/gT72LOSPHeRXjCmdTmJ2maFtO/7edyN95ghmPQHZvVJj4qFw8+aGbTHkb72mFKvWIhtiR6Pavh/ZCv7KiZZP1Nu/uJvKS9Gl3KOCF9iKZzfwyYRV8MFp1p9WFCalprfENKzDx8l7sXVvcpUXt4P+nB818Llo9jaZvyRSebgmn3yN8KYTUhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(366004)(346002)(16576012)(83380400001)(6486002)(16526019)(6916009)(4326008)(8936002)(8676002)(186003)(36756003)(478600001)(316002)(38100700002)(26005)(86362001)(31696002)(2906002)(66946007)(5660300002)(31686004)(66556008)(54906003)(66476007)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU9tcmx5RUxxQVNIWm1PRkVPNXZOOGthdUhUNEJxSmxidWJvTENGZElXYTlW?=
 =?utf-8?B?WktSWllQRkZWUUtrZ3BsZU5JZktnbzFwMXZBTDR4S0luaEEwV2h5M0s5U25V?=
 =?utf-8?B?S1Qzd3VmcHlRalJMU3E3UDJBcmttZjNwellzQXlZRElrY0hSVFk4MGowMmZC?=
 =?utf-8?B?RzE5TXJ4K3I2R3Rjdk1IZHhiR0ZMbkxYT0VhS1NrUmVESVRyMXRSV0dpZnlv?=
 =?utf-8?B?eVZkUkpnWUxDRDgxWDlRR3JqQWhvTm01S1RYOVVUdWp2cVdqeXNRdDQ3UXVi?=
 =?utf-8?B?NzgxQzhzUzhaQWdTYllubUt0cDcwbjVCWVA0SExhblNFM2hwSEtzeGZKcHN4?=
 =?utf-8?B?aE1KWHZFdWxnOG43eEZUa3pOZGNxNlh2RG9vZDlCTzNsSDZjTTRBb2xVbENE?=
 =?utf-8?B?VDFNV0VaVmNCTis4R1c2bHh2Yk02dTN5YzJ0OWs1Qm9WMjdEUVhoUFBMVnZk?=
 =?utf-8?B?YkcwbnZ4NjdXN1lQV0JZeWdzZXdsVk00L0ZySjJ2Nk93UDY0S0liZENwb0c4?=
 =?utf-8?B?MkRPV1FnVWNRWGVSWnBPL1dFa3d0UitCYWNwd1VLMStDbkNubENZYVdYQytN?=
 =?utf-8?B?NVRhQWJyYnhaalROVVh5OVMvSmRqTzlRVzhscUNQZ2lJUFc1Q3B5K0M1R0NR?=
 =?utf-8?B?SWdMcitZbGFOZEpDdlpOdDhjNm9sanhKZnVNTGlvNWNPZERFZkdPbkFNbGp1?=
 =?utf-8?B?VmlVM2VqL1FaWi9aQjV6N0xLeElhSHJxZ1RrN2tmdlJUSkh1d0Z0aU5BSXpr?=
 =?utf-8?B?VlFrc0RzNTdSNGRXMVZRcndwaTVxRm50T1FmUHRTRHRyakdleVFsMS92d1lO?=
 =?utf-8?B?MzZISnV6WFhFSjdvUSt4Mm5yWmhSblQzanlLT3NGUnRaeFY0QzBXUEJPeU1S?=
 =?utf-8?B?WjJzU1hWRmFSRmtUV3pES0NwZjMwT3A0T3EyeXJwRXI2bFZlelZyTVEyTHpT?=
 =?utf-8?B?ZEZDSmdVT3ZnK3Z4TlAyNWZ5WVEzU0tkSk5iM01mTVZSRmFIQ1lyOVZ0a3Z2?=
 =?utf-8?B?aHJ6WXNHQnNPVGV3UjhGT0hsakhBaEhpeHlzZGtDNVRwRzQxcS9WMUo3dk9R?=
 =?utf-8?B?SGh2Ym1ZdXB6WHpuWTBESDZzdTZGekY0WUNna1pIQjJ2ZGRmUUgwQzF1dnRz?=
 =?utf-8?B?c08rcVdpVnZpM1RSWURrM2FxRHpwZXpqWmZwTUdFM2xCMWpSZVFDUmNCZDY0?=
 =?utf-8?B?cGdGTUJoTGlQaTU1OExvakNuVzVLdUF2UWhheGJMZ0NDNk9ST1NwTldJU05T?=
 =?utf-8?B?alJpcE1sMUIyTjdySlRyend6cnlwdUxDM3AwQzQzR284N2EwamhyME1iWjBF?=
 =?utf-8?B?ajZOS2xhQXpWMDJucFVSRmI5ZGkza0dJeTBXVHhGR2FBV05BalBMRng0ajFX?=
 =?utf-8?B?ZW0vTkRVMlZOekZMV0krNHR2OS9hd1FOaThwR2xEZmVDeGd5WU9zS2hnSVRo?=
 =?utf-8?B?R2NvM25Qb3ZlYzRRUy8xSGJHL3lRNU13eHZQRFNCZHpyc1VOUWdaRnVtd1ow?=
 =?utf-8?B?a2MyN2gyZFN0N1pkMXFhOTN3RnhsU0RoMlpZZTJqUlRXcGx2RVgzU3BVVExm?=
 =?utf-8?B?MVg3UkFBZDkyMjB0elh3eDdKTStTbllHR2xIQWcwWUJLcXh3dk1tQ3hCRVJK?=
 =?utf-8?B?R05Cc2phVEltcXF0MzBuYWZSRkJDUVlJb3hZdXAzU2NaRXlySk11K2NHams2?=
 =?utf-8?B?Vy84QVJ0Ry9Ea21sVXdOUjdJOW15RXpCbWpYM0NvRi82MTFBaDIzMnFtaWxJ?=
 =?utf-8?Q?JuWJtertdyClIws3XQyItkpvNVyNKNQqYvVQQ8z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af11203-6bcb-4f94-ea2d-08d93fc756a7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 15:12:43.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoHXPffcNrMgIL9BzanjV1L8BenLzH1H5efyuJK6kxx9x9bbT78qH/1TQ/EhYi3AcwAEeCz1q617A2Thu4P6IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

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
Acked-by: Christian Lindig <christian.lindig@citrix.com>
---
v2: Avoid new use of DECLARE_DOMCTL. Re-base over error handling fix to
    libxl__arch_domain_create().
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
@@ -650,25 +650,49 @@ int xc_watchdog(xc_interface *xch,
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
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_shadow_op,
+        .domain      = domid,
+        .u.shadow_op = {
+            .op    = sop,
+            .pages = pages,
+            .mode  = mode,
+        }
+    };
+    DECLARE_HYPERCALL_BUFFER_ARGUMENT(dirty_bitmap);
+
+    if ( dirty_bitmap )
         set_xen_guest_handle(domctl.u.shadow_op.dirty_bitmap,
                                 dirty_bitmap);
 
@@ -678,9 +702,6 @@ int xc_shadow_control(xc_interface *xch,
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
@@ -529,15 +529,15 @@ int libxl__arch_domain_create(libxl__gc
         xc_domain_set_time_offset(ctx->xch, domid, rtc_timeoffset);
 
     if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
-        unsigned long shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
-                                              1024);
+        unsigned int shadow_mb = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
+                                             1024);
         int r = xc_shadow_control(ctx->xch, domid,
                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
-                                  NULL, 0, &shadow_mb, 0, NULL);
+                                  &shadow_mb, 0);
 
         if (r) {
             LOGED(ERROR, domid,
-                  "Failed to set %lu MiB %s allocation",
+                  "Failed to set %u MiB %s allocation",
                   shadow_mb,
                   libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow");
             ret = ERROR_FAIL;
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


