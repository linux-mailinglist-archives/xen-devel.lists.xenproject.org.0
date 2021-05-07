Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028B376449
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 13:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123986.234032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKl-0007fV-Ln; Fri, 07 May 2021 11:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123986.234032; Fri, 07 May 2021 11:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leyKl-0007ar-Aa; Fri, 07 May 2021 11:07:51 +0000
Received: by outflank-mailman (input) for mailman id 123986;
 Fri, 07 May 2021 11:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HO4=KC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1leyKj-0006BB-AC
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 11:07:49 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e83dcd7a-a08d-402d-ba4d-1137a022d6f3;
 Fri, 07 May 2021 11:07:44 +0000 (UTC)
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
X-Inumbo-ID: e83dcd7a-a08d-402d-ba4d-1137a022d6f3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620385664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kRHn8rtOSU6R7rJjGVkU/jbvyzLsjPcrTWylK9efHNg=;
  b=C30Lv6qVaITbQxVUfM+kpI4WHE2E+mw8Hoz1QpLeqWYzyvDWP4i9Mdbd
   1W401rJnu8MOkOzluUi1W9Ro71/cavF0Wn4pAALwxDkNc7Ge4KCC0GFHP
   A3vz9u+rpE1rJ9UcQXj0Im2rNTOoWBlkLlNQo7c5wlB1kt5s6VoNNMY/d
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 6YwB6C8YKZQ4983hdCzyEI5GbzrjOKmyaIGAPD/MX5wEnFxsQQc5uB6+9R6gAmaE86mOPOqxcz
 LfJH6l7lpq9FS/BdLeo4GBeYM7kZbWfQQXWQkYe3EgUONNyj4B3nfYW7qxPDrbx6q8zKANzaho
 EFgXaBO1K8HyEAW96cQs7sL3Hkm7w3FXY7dbKOLZQ8cPD9xIypZ1aNP7gGoDUMM83i8S0tEPyj
 9z0iCs8DXfpFZmNEn8fcWyisx/wv8QEfVtLtQx1OJEryhptoCvwgxFnbjCaOU3mBXcbFhvu1V7
 +Vw=
X-SBRS: 5.1
X-MesageID: 43286703
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LWAzX6P1HSFLssBcT/P155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8Ar5K0tQ4uxoWZPwCk80kKQY3WB/B8bHYOCLggqVxcRZnPLfKl7bamfDH4xmpM
 BdmsFFYbWeY2SSz/yKhjVQeOxQo+VvhZrY4Ns2uE0dLz2CBZsB0y5JTiKgVmFmTghPApQ0UL
 CG4NBcmjamcXMLKuymG3gsRYH41pH2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8F
 LCjxfy6syYwr6GI17npiHuBqZt6ZvcI+h4dY+xYw8uW3fRYzOTFcVcsnu5zXUISa+UmRIXeZ
 L30m0d1oxImg7slyeO0FbQMkDboUoTwm6nxlmCjXT5p8vlADo8FspanIpcNgDU8kw6obhHod
 R2Nk+ixu5q5Cn77VPADhnzJmJXf0GP0DMfeC4o/gliuK4lGfdsRKAkjTJo+aY7bVDHAdocYZ
 dT5ennlYZrmH2hHg/kglU=
X-IronPort-AV: E=Sophos;i="5.82,280,1613451600"; 
   d="scan'208";a="43286703"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYyQw1WYCvzj+RuO9/5EVmK2pFDLlFrFqNG28lAvJOotKMy+a7pDNJAt8Td5tJBMhQexZYcLQOFRukT1uTv3l/m4TsAfm1Dqcor+9tkTcExSdKPz800ZoVyNUZ5EZJVeJU357hduPXGlFvFpxWVCKo1Mv/I8HJ86xII9Jhe180EYwhKroXQRrdcaPvWQiBgfcSrCpm8rwtFxZG7IdtaMgSsIYA8lQAKzj8cxfDQAycATuqLxxw2opr/XRMSby7jXPxUdh1kRQ8VzczRU27MoCHZY6GjdV5AoP4OVp0QSq74CtfjOcd9n62fJrR0axn7/fudO3GqvcIYhZgM8VSdp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j8xIBD2PCCfKzL4UmHaXF4HJIPd/gVUnY3X5MNUNFM=;
 b=gACgwAELYeoTbLFkYOybt3AE+y5ZO9+kYIJfkTXQTcFNjuG3JebQy/iuNFr8g+2NDJ2RJtNGZIvDH/clUO0NSm2/n6r7H9EMs8maXbJxgRBCsKCOpRvdtxBRBio2vqzqTsb0bw7vYcUQaS8h8XwDwDyEfLhOhgXlV9LdU7IZirWSxb0xN2UkB0wmqG3CFAoJ1YWyHcqixEIlHBJsHJa0WJH5BYHAi0UiHzCX6bi7RcrEf4jipyaeAMxvLfsutZL3mwvcXgUwzfJgPXJ/SXjkiVYSozY5RVdWmhU/eUozI6TdkbobZp/T8t+SjoqxtzM6uNuLcEXZjOyFBu9Q08nIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0j8xIBD2PCCfKzL4UmHaXF4HJIPd/gVUnY3X5MNUNFM=;
 b=NBSEpIHX1CCE4U5iQkyVcPVKl4eGwOKzEJERupLWq/9Z57Lj0xMpwyHhDWELZGLkFeOs0B30NOg7H4UYX0X/77CwSGE1I9TFOHMxvbSmtXL51SGPhgyJK2IJ376vpvuL9KMeP49hb1DcevkmfB4EtrS4bsjpaMPTGe84GZAn1qg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 10/10] libs/guest: (re)move xc_cpu_policy_apply_cpuid
Date: Fri,  7 May 2021 13:04:22 +0200
Message-ID: <20210507110422.24608-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507110422.24608-1-roger.pau@citrix.com>
References: <20210507110422.24608-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0180.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::19)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cef9262e-8699-4ac0-25be-08d9114854c4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4683:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4683BD97B7B7A3CB045193388F579@DM6PR03MB4683.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uiz4KtnoHjaEGWI03B6cV6r9dFQm5S156UCWfpd/WEErYYzrVq8OmghiiCK5b5F6GCH3m4jNdOlisYbx581ov9WLHy+z55EbmWqg6Atka83tXv87FCVcCqlc1eU9sGRAXvMZcRu3+B24ycY5oLXUJQengvdnx57QEkDxh0okIGSENCkFGilzrP+M7AYeqswNBPTCz+9JNys6qX4Sxm4kXRDdUnmaH9G8GH+LYP/lgZZqrVyscIIlvQVtJgue0d/054mBI26b8ze3c9za1ZeLf44VQDrdOls9sW61n/V76M74ZrcXNextz5fizrr5xF7GHUQukkZFmpduW17Qe2NfR7fWFo2zwQo9me++utOmTm+E2uyBtGyFLXHZwr3WiJAvK1MvrSDdc1hxuN4qjvitxcCd9++C8tUBocv+aZOHLaSUsSnJ4pVfMIiRdtZouP7f+RKnwvFivPDW5w8dY64WbVq4jzCv6PA2KvnGRm/p2x5ftve1a8h4iYJc6cV4SzH4RJo8BNq1oObH2jXURph2EKJgIS0Z30uK7d0dJdMKCqd9P/DmzSvaC+OcZXQx/ihYzSuRWzJ7NLy8a4vzhy0PLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(8936002)(478600001)(6666004)(956004)(2616005)(2906002)(6496006)(6486002)(26005)(30864003)(1076003)(8676002)(16526019)(38100700002)(5660300002)(6916009)(316002)(66476007)(66556008)(83380400001)(66946007)(186003)(54906003)(107886003)(4326008)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEFtSEFUckZ0Ly9vT2FmNFl2OTVEbmQvOGdITDJoWWlUMFc3d3hzZTNrVGJi?=
 =?utf-8?B?S2hEemRFeEdyZVpGVkU5RTRVQ3hxdnptZGduMnlVWnFGYkNGUWF3ZW9JQThD?=
 =?utf-8?B?UXhRc0pMV3B0SmlobGNNUnZ2ZFFGT0JWYW5LcGVnUzRVNFpNU0NpdWlweGJO?=
 =?utf-8?B?cllOczJQRVFsd1VxWlhuai9aK1JiQUdwTlJNdDg5N1FIVGNCazgzQ1VxQ0tR?=
 =?utf-8?B?ZmloUFNQOFZ3bER6OGJlMTExa2JQK0JmOWxNYWVSWnNtdktKa2lLQjJCZFI1?=
 =?utf-8?B?Q3VlT3hYakNEQ3AvclNSU1lQT0ljNnFiRmQ3WnR5aWJ3KzBkUk9rcUFnZzhM?=
 =?utf-8?B?R205a1ZzK3YzT3FESE5Rbk9FNmQvMmh0Zno0UEYwL3dvUmV6V2NKWGhrR1Na?=
 =?utf-8?B?Q1BqcXZrS0poU3pyZ1FJV2Npa3gzQVBHalpRbWNVSFloMzJteUJlT3Q3Qzk5?=
 =?utf-8?B?SzBqVDljTVlPRW5XaGRub3E5VTB2bXR2K1YwR25FWlh2OFliSENkSzQrRlFN?=
 =?utf-8?B?eFRiRWdjMkhCZmR1RkVDajNqdmJybTdDYUI0R0t0R1JqMWpkMVlDVzVLMDdX?=
 =?utf-8?B?eTVDV3h0NDJ2UE1xU1ZiazZmSkVDWW5RYXMwS2xHUDlUZGtaNWFnbXJUMklT?=
 =?utf-8?B?NTdvcXM1TXB6TTByQUhDWU15TFVmZWVaNVhSbnVKZC9IdkxVNVR0S1I2ZUc0?=
 =?utf-8?B?UnVWZlhueWJITHdQcWhsRzdYMXZvQ0oycnVQdUFhc3RFOWVaNUFJUXBNYTM1?=
 =?utf-8?B?cTltMjkyNW92RHUvZmNnQW5Cc3g0OHA4UmY2Z1pyNDZWYURwb0lMVEFBQmFp?=
 =?utf-8?B?SkR4THpzVTdBUE5vVHdaamJKdFk3RGxNa29hMDFYWC9JV05ROFFvV3hKMkI1?=
 =?utf-8?B?dkZtenFMZzF3TFgwV0RpS29oM2t0bkdoemZ3UGhSVTJ0QXp2b293M2hHelVy?=
 =?utf-8?B?NHU0bFNZeE5rSnlTOE5Gc0hyREQyQ0lmTDdSRzc5Zkx5TFljVnM0UkdMamQx?=
 =?utf-8?B?MUVHZThTYis1M2hibHFwUnVpZnZMcU5uQ3pPSC9EZXlvbFppSkk3UlNOTzg1?=
 =?utf-8?B?QzNYYzdvaE9YdGl5c3lobys1ODhwZTd3N2FaOFFWakJub24rcTJZTHhJQUly?=
 =?utf-8?B?VTlRa0ptMk10N0FXNW4yV1kySTgrNXRNd2tXYkRXeGttTUVSZ0ZOZU1RRkJp?=
 =?utf-8?B?Nk5QVHdqdXg1VVZITnM1bFJmcE5yWHVKMlp5dUFLd0pOem51MWVoS3hmOFJX?=
 =?utf-8?B?THMwU3p0Ky91eWZpSWFPNFIwSkI4eVVkcTAzVnJuUk9BS0ttTExHdytydEZ1?=
 =?utf-8?B?dXpwU1owbmltaGZvTnVibitONVdRak9jYko4TGlFak5lMGgxUDBHUGo3eFZx?=
 =?utf-8?B?Y2JxTk8wait0NVpybVg0NFR3bnVEa1BkZzRaRGxadkwwRFhQMzVjQ2NyU1hH?=
 =?utf-8?B?Nmw0WURtbVR2ZEJrQm5BQzYyRlY3VmRyMFZwd3gybTFwQ3UvZ1Q4c2ZUN09Z?=
 =?utf-8?B?cWJmNEtDTVFkcGpaWmlDcGpQVVRRVmNoYjlIWHVsNkFHQnFQdWtzcjUrWVhN?=
 =?utf-8?B?RXVmaTZZMHJSVzF0ZjAzRHBFaVhzOXo3YlFQNURwbXNjS1VMRDJxNDVLRktB?=
 =?utf-8?B?aU1QR3ZNeHJtTitJRHMrWk5xbVl3S0VncURjekdNRGQ3bVFQalQ5enp6emQ4?=
 =?utf-8?B?TkVPZm1NY0R5YjZKdnhKczFpUCtRQU5uZ0p0RitRcmY2WkUwTmk0elNHUHdl?=
 =?utf-8?Q?NRBntv1Y8kMNGVluGFZdaGTZIWkj5Tzo12yk/DV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cef9262e-8699-4ac0-25be-08d9114854c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 11:07:40.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r/zga9Nt+m2kmvOyBpbeT+ZZTfOCrbgy/JbXJvKKXAleDyGjc4+TdqDF21RGj7ocMlWBody3ruYPLRC5FvKLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4683
X-OriginatorOrg: citrix.com

Move the logic from xc_cpu_policy_apply_cpuid into libxl, now that the
xc_cpu_policy_* helpers allow modifying a cpu policy. By moving such
parsing into libxl directly we can get rid of xc_xend_cpuid, as libxl
will now implement it's own private type for storing CPUID
information, which currently matches xc_xend_cpuid.

Note the function logic is moved as-is, but requires adapting to the
libxl coding style.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
Changes since v2:
 - Use LOG*D.
 - Pass a gc to apply_policy.
 - Use 'r' for libxc return values.
---
 tools/include/libxl.h             |   6 +-
 tools/include/xenctrl.h           |  26 ------
 tools/include/xenguest.h          |   4 -
 tools/libs/guest/xg_cpuid_x86.c   | 125 --------------------------
 tools/libs/light/libxl_cpuid.c    | 142 ++++++++++++++++++++++++++++--
 tools/libs/light/libxl_internal.h |  26 ++++++
 6 files changed, 165 insertions(+), 164 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index ae7fe27c1f2..150b7ba85ac 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1375,10 +1375,10 @@ void libxl_bitmap_init(libxl_bitmap *map);
 void libxl_bitmap_dispose(libxl_bitmap *map);
 
 /*
- * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
- * libxc may not make assumptions about xc_xend_cpuid.
+ * libxl_cpuid_policy is opaque in the libxl ABI. Users of libxl may not make
+ * assumptions about libxl__cpuid_policy.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
+typedef struct libxl__cpuid_policy libxl_cpuid_policy;
 typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 17fa3734800..30c2a5f5284 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1864,32 +1864,6 @@ int xc_domain_debug_control(xc_interface *xch,
 
 #if defined(__i386__) || defined(__x86_64__)
 
-/*
- * CPUID policy data, expressed in the legacy XEND format.
- *
- * Policy is an array of strings, 32 chars long:
- *   policy[0] = eax
- *   policy[1] = ebx
- *   policy[2] = ecx
- *   policy[3] = edx
- *
- * The format of the string is the following:
- *   '1' -> force to 1
- *   '0' -> force to 0
- *   'x' -> we don't care (use default)
- *   'k' -> pass through host value
- *   's' -> legacy alias for 'k'
- */
-struct xc_xend_cpuid {
-    union {
-        struct {
-            uint32_t leaf, subleaf;
-        };
-        uint32_t input[2];
-    };
-    char *policy[4];
-};
-
 int xc_mca_op(xc_interface *xch, struct xen_mc *mc);
 int xc_mca_op_inject_v2(xc_interface *xch, unsigned int flags,
                         xc_cpumap_t cpumap, unsigned int nr_cpus);
diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 134c00f29a0..414baa30171 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -762,10 +762,6 @@ int xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 int xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                   bool hvm);
 
-/* Apply an xc_xend_cpuid object to the policy. */
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm);
-
 /* Apply a featureset to the policy. */
 int xc_cpu_policy_apply_featureset(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const uint32_t *featureset,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 8c62c3ac360..e0fff98fe77 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -263,131 +263,6 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
-                              const struct xc_xend_cpuid *cpuid, bool hvm)
-{
-    int rc;
-    xc_cpu_policy_t *host = NULL, *def = NULL;
-
-    host = xc_cpu_policy_init();
-    def = xc_cpu_policy_init();
-    if ( !host || !def )
-    {
-        PERROR("Failed to init policies");
-        rc = -ENOMEM;
-        goto out;
-    }
-
-    /* Get the domain type's default policy. */
-    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
-                                           : XEN_SYSCTL_cpu_policy_pv_default,
-                                  def);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
-        goto out;
-    }
-
-    /* Get the host policy. */
-    rc = xc_cpu_policy_get_system(xch, XEN_SYSCTL_cpu_policy_host, host);
-    if ( rc )
-    {
-        PERROR("Failed to obtain host policy");
-        goto out;
-    }
-
-    rc = -EINVAL;
-    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
-    {
-        xen_cpuid_leaf_t cur_leaf;
-        xen_cpuid_leaf_t def_leaf;
-        xen_cpuid_leaf_t host_leaf;
-
-        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
-                                     &cur_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get current policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
-                                     &def_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get def policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
-                                     &host_leaf);
-        if ( rc )
-        {
-            ERROR("Failed to get host policy leaf %#x subleaf %#x",
-                  cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-
-        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
-        {
-            uint32_t *cur_reg = &cur_leaf.a + i;
-            const uint32_t *def_reg = &def_leaf.a + i;
-            const uint32_t *host_reg = &host_leaf.a + i;
-
-            if ( cpuid->policy[i] == NULL )
-                continue;
-
-            for ( unsigned int j = 0; j < 32; j++ )
-            {
-                bool val;
-
-                switch ( cpuid->policy[i][j] )
-                {
-                case '1':
-                    val = true;
-                    break;
-
-                case '0':
-                    val = false;
-                    break;
-
-                case 'x':
-                    val = test_bit(31 - j, def_reg);
-                    break;
-
-                case 'k':
-                case 's':
-                    val = test_bit(31 - j, host_reg);
-                    break;
-
-                default:
-                    ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          cpuid->policy[i][j], i, cpuid->policy[i]);
-                    goto out;
-                }
-
-                clear_bit(31 - j, cur_reg);
-                if ( val )
-                    set_bit(31 - j, cur_reg);
-            }
-        }
-
-        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
-        if ( rc )
-        {
-            PERROR("Failed to set policy leaf %#x subleaf %#x",
-                   cpuid->leaf, cpuid->subleaf);
-            goto out;
-        }
-    }
-
- out:
-    xc_cpu_policy_destroy(def);
-    xc_cpu_policy_destroy(host);
-
-    return rc;
-}
-
 xc_cpu_policy_t *xc_cpu_policy_init(void)
 {
     return calloc(1, sizeof(struct xc_cpu_policy));
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 6d17e89191f..6c11b7a7c1f 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -298,7 +298,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     char *sep, *val, *endptr;
     int i;
     const struct cpuid_flags *flag;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
     unsigned long num;
     char flags[33], *resstr;
 
@@ -376,7 +376,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     char *endptr;
     unsigned long value;
     uint32_t leaf, subleaf = XEN_CPUID_INPUT_UNUSED;
-    struct xc_xend_cpuid *entry;
+    struct libxl__cpuid_policy *entry;
 
     /* parse the leaf number */
     value = strtoul(str, &endptr, 0);
@@ -426,6 +426,137 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
     return 0;
 }
 
+static int apply_cpuid(libxl__gc *gc, xc_cpu_policy_t *policy,
+                       libxl_cpuid_policy_list cpuid, bool hvm, domid_t domid)
+{
+    int r, rc = 0;
+    xc_cpu_policy_t *host = NULL, *def = NULL;
+
+    host = xc_cpu_policy_init();
+    def = xc_cpu_policy_init();
+    if (!host || !def) {
+        LOGD(ERROR, domid, "Failed to init policies");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the domain type's default policy. */
+    r = xc_cpu_policy_get_system(CTX->xch,
+                                 hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+                                     : XEN_SYSCTL_cpu_policy_pv_default,
+                                 def);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain %s def policy",
+              hvm ? "hvm" : "pv");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    /* Get the host policy. */
+    r = xc_cpu_policy_get_system(CTX->xch, XEN_SYSCTL_cpu_policy_host, host);
+    if (r) {
+        LOGED(ERROR, domid, "Failed to obtain host policy");
+        rc = ERROR_FAIL;
+        goto out;
+    }
+
+    for (; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid) {
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
+
+        r = xc_cpu_policy_get_cpuid(CTX->xch, policy, cpuid->leaf,
+                                    cpuid->subleaf, &cur_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            r = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, def, cpuid->leaf, cpuid->subleaf,
+                                    &def_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+        r = xc_cpu_policy_get_cpuid(CTX->xch, host, cpuid->leaf,
+                                    cpuid->subleaf, &host_leaf);
+        if (r) {
+            LOGED(ERROR, domid,
+                  "Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+
+        for (unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++) {
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
+
+            if (cpuid->policy[i] == NULL)
+                continue;
+
+#define test_bit(i, r) !!(*(r) & (1u << (i)))
+#define set_bit(i, r) (*(r) |= (1u << (i)))
+#define clear_bit(i, r)  (*(r) &= ~(1u << (i)))
+            for (unsigned int j = 0; j < 32; j++) {
+                bool val;
+
+                switch (cpuid->policy[i][j]) {
+                case '1':
+                    val = true;
+                    break;
+
+                case '0':
+                    val = false;
+                    break;
+
+                case 'x':
+                    val = test_bit(31 - j, def_reg);
+                    break;
+
+                case 'k':
+                case 's':
+                    val = test_bit(31 - j, host_reg);
+                    break;
+
+                default:
+                    LOGD(ERROR, domid,
+                         "Bad character '%c' in policy[%d] string '%s'",
+                         cpuid->policy[i][j], i, cpuid->policy[i]);
+                    rc = ERROR_FAIL;
+                    goto out;
+                }
+
+                clear_bit(31 - j, cur_reg);
+                if (val)
+                    set_bit(31 - j, cur_reg);
+            }
+#undef clear_bit
+#undef set_bit
+#undef test_bit
+        }
+
+        r = xc_cpu_policy_update_cpuid(CTX->xch, policy, &cur_leaf, 1);
+        if (r) {
+            LOGED(ERROR, domid, "Failed to set policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            rc = ERROR_FAIL;
+            goto out;
+        }
+    }
+
+ out:
+    xc_cpu_policy_destroy(def);
+    xc_cpu_policy_destroy(host);
+    return rc;
+}
+
 int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
                         libxl_domain_build_info *info)
 {
@@ -541,10 +672,9 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
     }
 
     /* Apply the bits from info->cpuid if any. */
-    r = xc_cpu_policy_apply_cpuid(ctx->xch, policy, info->cpuid, hvm);
-    if (r) {
-        LOGEVD(ERROR, domid, -r, "Failed to apply CPUID changes");
-        rc = ERROR_FAIL;
+    rc = apply_cpuid(gc, policy, info->cpuid, hvm, domid);
+    if (rc) {
+        LOGD(ERROR, domid, "Failed to apply CPUID changes");
         goto out;
     }
 
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 44a2f3c8fe3..f271a729fa7 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -2052,6 +2052,32 @@ typedef yajl_gen_status (*libxl__gen_json_callback)(yajl_gen hand, void *);
 _hidden char *libxl__object_to_json(libxl_ctx *ctx, const char *type,
                                     libxl__gen_json_callback gen, void *p);
 
+/*
+ * CPUID policy data, expressed in the internal libxl format.
+ *
+ * Policy is an array of strings, 32 chars long:
+ *   policy[0] = eax
+ *   policy[1] = ebx
+ *   policy[2] = ecx
+ *   policy[3] = edx
+ *
+ * The format of the string is the following:
+ *   '1' -> force to 1
+ *   '0' -> force to 0
+ *   'x' -> we don't care (use default)
+ *   'k' -> pass through host value
+ *   's' -> legacy alias for 'k'
+ */
+struct libxl__cpuid_policy {
+    union {
+        struct {
+            uint32_t leaf, subleaf;
+        };
+        uint32_t input[2];
+    };
+    char *policy[4];
+};
+
 _hidden int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool retore,
                                 libxl_domain_build_info *info);
 
-- 
2.31.1


