Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8953F8528
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 12:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172879.315467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCOx-0001Hj-A7; Thu, 26 Aug 2021 10:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172879.315467; Thu, 26 Aug 2021 10:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJCOx-0001E8-5T; Thu, 26 Aug 2021 10:14:27 +0000
Received: by outflank-mailman (input) for mailman id 172879;
 Thu, 26 Aug 2021 10:14:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJCOv-0001Df-9Y
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 10:14:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46ceefa9-6029-4229-a762-87f61ef532c6;
 Thu, 26 Aug 2021 10:14:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-5n8En-_HOqCMUv-asQSG_w-1; Thu, 26 Aug 2021 12:14:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 10:14:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 10:14:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4PR0501CA0053.eurprd05.prod.outlook.com (2603:10a6:200:68::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 10:14:20 +0000
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
X-Inumbo-ID: 46ceefa9-6029-4229-a762-87f61ef532c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629972863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SOO0Uz6JKbrS1yZPJ6hNqY6uBNulBAyNuDMy+bqqYaU=;
	b=YA2f8EzAROoE4Skq0lKP3BVpDqXbA1SDskpRgmorZjU3/UZ3lyCSCyPVB0qMRWQJS+aGKk
	LF9P2O+WERX4jK8yyXltf5qXFYz2kymP1Fvm2pShwDUbw0HPwpyx7UclOYbw2pyotbGYGV
	mbpTrdR6AnITEe4rxqDcFc75wMd/6uU=
X-MC-Unique: 5n8En-_HOqCMUv-asQSG_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/dmJdQw6bULCjh+qpCvBNj2FVVqN0QC76Sdpzr09K6qzfdmsIscXoLw4Agpu+xXWxxWbjXYc3mWFGebZvf3oYxOtdvzFRGsc0Lx5GJbYWcR4WEU6fgF3ZumXZv53MgCEjfNVka3qUCutCx/rxjFd0zbeOoGZU3PafQzBZ3bTpnkB/ZUzqFsyURxSoq9GLbKrcSq7oaDwaOaF8zBbl+v3ruV4e/eLdVfr7IgsxQXM6P1Bbd0LbN0aJwuJKSnE2RpnmYanhK3FqI+PqTKyUVvVR8NsMegZ0JZ7xohf8ByY2LH3psZzwICLRMoup9WlxKX0IGRu32icxo0oVem6B//+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOO0Uz6JKbrS1yZPJ6hNqY6uBNulBAyNuDMy+bqqYaU=;
 b=SHht04MWiYNuEXvC7JMyO7LEoWATy7MhGHneJzvkCLAGBIZensegriMa8/Jnkh+2dsIB0yJdHYy8J0Ayolc82sJdR3u7z4nYYexxHcWSSriXRNHjndErWTUzcZRZ6GM8NMqr1Wy22q0C9A79RMcsUvwUvq0Q3ieiT6Ns8HhpyPEtPlh7DnKuFYXsY49BlTPS9g4CwF7c8+eleUIgrWZOtIM75aCfTtVjo5q+3OPEPTbNwLVcnPDitJ6UgAmWusbNVZ/CJkGbcKmWeg6rk9JDkMuMJvgjqAJkFVRWkBCS+wvEh7lp5C2NDk3MoHiXmYIw+FzwEHnVrPDIyJ/gkl04ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 7/9] gnttab: no need to translate handle for
 gnttab_get_status_frames()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Message-ID: <ed6a8403-dc91-05c8-25e5-81b5fb706cc2@suse.com>
Date: Thu, 26 Aug 2021 12:14:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0501CA0053.eurprd05.prod.outlook.com
 (2603:10a6:200:68::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899f603f-8edf-4e92-171c-08d9687a4577
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB49421AB3BC91110961FE1130B3C79@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hgl8pmH94Uskr5CQTkMbpLZgoXgunj0TckjOHMcrjV0B/H+Poic/5AGMFC9rS5/0QMKX9CH0x1IN5NmfawJ3s9srPTFVUQoRAAS8EWpVAmDat4KSJ5Jy74Jt//tYBFo3iw9dgr/oZHNBzVAui59TS/QqTrkrjgUnhkq5elo8Fbg1akiakJbxJtKAbgwf/nD2g7fFj/Nuw3PzjFF1yS05f85Kua3SZTAwAtfj73tMAjRK3BgNzuyidDRGsXhkqhl133osqec/0H5VssyfDrxkHufkFcyeUk1iknOWAinpyeQtAqusJRmWcVa5yKQrUhh0IF//wcVz7BTJsBMx/7VMjH0ZU5czLS/Q6mGU5s2b8UDM4aY0/8PLIi5vO151ZxeNEpibKOIm5Ndei+WtFEJPI7xkLgz0GJ5pEl9WF8PKFCBHEoPWJSFj1NSQeiQKL8C1vBS12LZc853mWkGGido5LNddSpwrbmAVxRdptzAAdrZelZ6cUnh0VUDPE9diVTKS2ph5A6Csi+l65EZ9pKQCMRXO4kcKM/KGy+v0aUU7oxIwkOd71WslIiOBqcZT98vhpJHIH757PaCS8louQWSMVj8vPWVUUATILfx+FgKZO/IaU9qOb7PWwvsq0h/s/uX8GFnWYDu7wRqR3Sn5oa20LeDVB5l9xkCB1ogG5d13IanPkND6vQ2t7edf3ziHIqGe5pzPAPXdWqUwApZc2dIr4JtOVOFKQQcPBfob3M/YWjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(396003)(39850400004)(2906002)(2616005)(36756003)(31686004)(8676002)(54906003)(26005)(6916009)(5660300002)(956004)(186003)(4326008)(66476007)(316002)(8936002)(86362001)(478600001)(16576012)(31696002)(38100700002)(83380400001)(66556008)(6486002)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGI4c1lmQWRVdURpRzFubTZnbHZrK2ZmdmpUTEQzQzNha3hGczRheFlweEJH?=
 =?utf-8?B?L21GY1RXTXBWRFFpYUt4TkpIUlZZd29jK1QrOHRiRjc1cUpWREduSytkR0V0?=
 =?utf-8?B?S0JabE1WTzJzNm5CTGlhUzBUKzYvNzVDbkI1NmFwL2dOc1lQUTI3QVVORFBV?=
 =?utf-8?B?V0QreHhwUjZUMjZkOG51ajdqOGxCOWxEYVErMXo3Y2x0bkpQdGVGeFJRQ1hy?=
 =?utf-8?B?RlJ3L3lqZnlTM3F4MCszSnM2MXdWS3p0Um53U1pya1J3aWkycmxPU21HRVo1?=
 =?utf-8?B?bVN0dG1QK1FBQzFQYWpFRHdSbVN1MWR5aFFIOUhVYlAzNzZiZi9GaTA3VkJ3?=
 =?utf-8?B?d0k1U2xHZ0VQR0Rlc1dEdm1jNjJyNkxmS0dYdUlDcHY1bTFESTR1aVVDVFg1?=
 =?utf-8?B?TE1TejdJL2ZJa3pjVFV6Z1hJVFZTMmZoOXJvQTBvOGR1YXJjeXYyK05mLzZH?=
 =?utf-8?B?VklCVUlvemxSUWZmSGhmaWQzamdxUGt1aWxmeG9ad0lNWEk1bGM4WGM3R3Vp?=
 =?utf-8?B?U3VyMllrbHlUcU0yczd0Wm5iMkZ6V3Ivc3NmUjE2MXNkRUZyd0VjN2p2TFYy?=
 =?utf-8?B?NFZlZkN5YmZKRkdTNGdFRlRMNTZGbFhyUDBjRis3VXBKMURVcXlzRDNaMWpT?=
 =?utf-8?B?MkVENVJidGZ0Z1lYQzlwYmJEK2NpbFhTdjdkYUU2YzhXWWNFYmp6WGRROHZi?=
 =?utf-8?B?QzVlK2FKS3J1V2pLamtYT2FlRjhTQi9pdUxQbEVxdmVTZEdiT2QxL3VrM3Jq?=
 =?utf-8?B?cHB6MU9ZTzZVSlpsOEhkYTZvTXhXcXM5T2RtZzE4OElpUVQzZHgxRXJ4b3VF?=
 =?utf-8?B?b2hid2pYTWlkckpyM2lPM1k0VkhKMFN5UHJBUlZvS3JrK2NGUXJTc1pyN0ts?=
 =?utf-8?B?cTErUDMrRlBLRm0rOFExeUU0RkhiN0xGcDR2d2lSdy9udnlUcGFjMngxRUhs?=
 =?utf-8?B?Qk1ka3ZPK3NnM3dzcVpGWm5jK2FWM2l6QzF1TE5pTi9VTGttVjFVZW5MdjF5?=
 =?utf-8?B?NS9yUlFMU0ZONTF1d3Fnbjl2aEt5WUFka2oxckxxTzl5VFFsNGtIa3NmUVJH?=
 =?utf-8?B?eE1sa2NOZlpUR1VoRTdWSHhHK2xCby9GUmxVK2VHUmpmblpyUzlMQ2JDaG1a?=
 =?utf-8?B?UEdHWjl2aHhtMjJNRmxCdzkyNnpwNmplUE11MjBzQ25RQ21YZzQyUXJoNkNH?=
 =?utf-8?B?Nzg2ZHBRWGp4ZG9pb0VlNTdnY2FqMTYweFNNckxYbzFBWVhScEZkaU9PSkp4?=
 =?utf-8?B?ZmZyM0JpcS81NDlBSDk1MGNnc2Uyek1Udm02bnBScE5yNVVXUHl2R2wvcWRn?=
 =?utf-8?B?WkVaME5TQi9vVU1Mb2tQOWFRa2FNOWl1OW9vV3VjcFF3NFJNTzhYcllTT1Nv?=
 =?utf-8?B?WnFwUkRJdlRKRnJmQythQis2UVBDU2dUOGRIWXVnZkNHVU4rQzQ2di8rcDh4?=
 =?utf-8?B?RnVTSHJOVkw1bkdrNE81bHlML3JXSFhjRFBuNGNtSFVJQXZGejlyVXNSUm5J?=
 =?utf-8?B?UHZUL21tb1BWbXN2cU5wVC9rdzVzR09CVnYzREhpZmU1a2JqTnd3bDFsMkZ6?=
 =?utf-8?B?SS9kQlYydFYrZnNEaXdqYmZ5UEFYaFl1K3ZkeHBydldOQ096M1NDa0xBWnVH?=
 =?utf-8?B?bHkzM1JrUEZLRi9vbVJySFZGOUUzU2VSNEVnWVZ4RUp1VE9jTEQ0eStETlhN?=
 =?utf-8?B?MGQ4MTFFQ1ZMeHdMOG0zSnNvbFJydjVtajJ5bFdTb2ZHZ0dJTkZHdEdQeTN5?=
 =?utf-8?Q?J/jldk2rwjQGjxUyLorPE4cM6PsnhAsxml/GYB6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899f603f-8edf-4e92-171c-08d9687a4577
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 10:14:21.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNAYKqg+wz+mCpwXblil+DLDm3YEtVQ5er3XUNGTSpu/A3tUS0l3kpa5LydzOcegqCUofkh6dJVbXNhXxQD6zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

Unlike for GNTTABOP_setup_table native and compat frame lists are arrays
of the same type (uint64_t). Hence there's no need to translate the frame
values. This then also renders unnecessary the limit_max parameter of
gnttab_get_status_frames().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -271,10 +271,7 @@ int compat_grant_table_op(unsigned int c
             }
             break;
 
-        case GNTTABOP_get_status_frames: {
-            unsigned int max_frame_list_size_in_pages =
-                (COMPAT_ARG_XLAT_SIZE - sizeof(*nat.get_status)) /
-                sizeof(*nat.get_status->frame_list.p);
+        case GNTTABOP_get_status_frames:
             if ( count != 1)
             {
                 rc = -EINVAL;
@@ -289,38 +286,25 @@ int compat_grant_table_op(unsigned int c
             }
 
 #define XLAT_gnttab_get_status_frames_HNDL_frame_list(_d_, _s_) \
-            set_xen_guest_handle((_d_)->frame_list, (uint64_t *)(nat.get_status + 1))
+            guest_from_compat_handle((_d_)->frame_list, (_s_)->frame_list)
             XLAT_gnttab_get_status_frames(nat.get_status, &cmp.get_status);
 #undef XLAT_gnttab_get_status_frames_HNDL_frame_list
 
             rc = gnttab_get_status_frames(
-                guest_handle_cast(nat.uop, gnttab_get_status_frames_t),
-                count, max_frame_list_size_in_pages);
+                guest_handle_cast(nat.uop, gnttab_get_status_frames_t), count);
             if ( rc >= 0 )
             {
-#define XLAT_gnttab_get_status_frames_HNDL_frame_list(_d_, _s_) \
-                do \
-                { \
-                    if ( (_s_)->status == GNTST_okay ) \
-                    { \
-                        for ( i = 0; i < (_s_)->nr_frames; ++i ) \
-                        { \
-                            uint64_t frame = (_s_)->frame_list.p[i]; \
-                            if ( __copy_to_compat_offset((_d_)->frame_list, \
-                                                         i, &frame, 1) ) \
-                                (_s_)->status = GNTST_bad_virt_addr; \
-                        } \
-                    } \
-                } while (0)
-                XLAT_gnttab_get_status_frames(&cmp.get_status, nat.get_status);
-#undef XLAT_gnttab_get_status_frames_HNDL_frame_list
-                if ( unlikely(__copy_to_guest(cmp_uop, &cmp.get_status, 1)) )
+                XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_compat_t) get =
+                    guest_handle_cast(cmp_uop,
+                                      gnttab_get_status_frames_compat_t);
+
+                if ( unlikely(__copy_field_to_guest(get, nat.get_status,
+                                                    status)) )
                     rc = -EFAULT;
                 else
                     i = 1;
             }
             break;
-        }
 
         default:
             domain_crash(current->domain);
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3242,7 +3242,7 @@ gnttab_set_version(XEN_GUEST_HANDLE_PARA
 
 static long
 gnttab_get_status_frames(XEN_GUEST_HANDLE_PARAM(gnttab_get_status_frames_t) uop,
-                         unsigned int count, unsigned int limit_max)
+                         unsigned int count)
 {
     gnttab_get_status_frames_t op;
     struct domain *d;
@@ -3292,15 +3292,6 @@ gnttab_get_status_frames(XEN_GUEST_HANDL
         goto unlock;
     }
 
-    if ( unlikely(limit_max < op.nr_frames) )
-    {
-        gdprintk(XENLOG_WARNING,
-                 "nr_status_frames for %pd is too large (%u,%u)\n",
-                 d, op.nr_frames, limit_max);
-        op.status = GNTST_general_error;
-        goto unlock;
-    }
-
     for ( i = 0; i < op.nr_frames; i++ )
     {
         gmfn = gfn_x(gnttab_status_gfn(d, gt, i));
@@ -3664,8 +3655,7 @@ do_grant_table_op(
 
     case GNTTABOP_get_status_frames:
         rc = gnttab_get_status_frames(
-            guest_handle_cast(uop, gnttab_get_status_frames_t), count,
-                              UINT_MAX);
+            guest_handle_cast(uop, gnttab_get_status_frames_t), count);
         break;
 
     case GNTTABOP_get_version:


