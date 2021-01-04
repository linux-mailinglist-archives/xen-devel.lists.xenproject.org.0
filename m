Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E632E96E6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 15:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61245.107591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQam-0006LC-31; Mon, 04 Jan 2021 14:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61245.107591; Mon, 04 Jan 2021 14:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQal-0006Kn-Uz; Mon, 04 Jan 2021 14:12:15 +0000
Received: by outflank-mailman (input) for mailman id 61245;
 Mon, 04 Jan 2021 14:12:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N5j7=GH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwQak-0006Kh-9l
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:12:14 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84163d97-a449-4934-ae3a-e20dcf19e245;
 Mon, 04 Jan 2021 14:12:13 +0000 (UTC)
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
X-Inumbo-ID: 84163d97-a449-4934-ae3a-e20dcf19e245
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609769533;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=NSaaxbVvnUiO1Syz3t5a59pWoapWR+/G1hH5TRG1Tqs=;
  b=H0jBEhOdQSlYRCsLxGk0figIFG/XvB7O7YErWQL/FtdIHo56MOQV55LD
   ALKgBPK0xYyE469yH8AJaYiFXabEoPXDP1k74D++tlY87/HM4lWA3AKh+
   i79RCWOHHi2JPICr4IZt1k5ha07GF/rH/SxreV78CWKbpE3FxE/yRKZ7J
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /eeFS23n8oQvMNsPPlmyI5zUPaay53VVYU189mClnT1DaD7muhb/FKAiXkkijT52ZVMFxa2sB0
 kzJqWvYNuotkFb8Sed5ARM8Ky33NxIYaIsm/fIkaDjvIuTDKOSkWRO11IEP0Hj3T19/wgeQtjA
 +K+ZtYZgCwZaEBUMQT2lC9fruPDsnRzB3fAWnYO948MUYZ6uSKKBoy1J/vReQwpZOPovjwEETC
 JTrWkKiHPEy167mzeyfmSeE3lj5ddN5nnhZm1Lw3GegiuH3J2PhXLWqjDQv6xKsqGsUbcjpJuy
 dQA=
X-SBRS: 5.2
X-MesageID: 35604120
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,474,1599537600"; 
   d="scan'208";a="35604120"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4wnpVaE5JFKg0lo+6icpJIbGXyfHtXbKavfPI5Wre0uHUI6T1Dv3QDx9Fj0nyWzuHqhaTCVlFOMkXkyHhMw2YP9Q2efONtDI/+kBWpRm+dhbBo9T02RvHpRIazKVLhHsMTgGCkJrPP5rDqUvz1QUsUXtf9mOi1SjL3L2QlXgC5kzPPG6isqdagkISrPGhWipCRCCRB8FwSChOgbpMa5FQ0YgYaOSsgO+q4LyCOO5t1zUjFlWsqh4GSHDCL9+h9M5lXNB7jFVk/ybOETd7SG3mphztMVupTyKJezl2TiZqFRFtntWoJtLx5ZpjjKJNLQjjtl8BhOVgB1hGsZEN4DWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZHsFdt0b4td30Pp+KKcLpYYYNId4lE61/bzgQR+nls=;
 b=YomOvIUJZ3MNs6SFt+LyObQQ+GZ8XcwGgkvXteHTZOC7HEznui5QAyXxlCukJrDx9ehE6TpOfXl1bDzgBqBaT8SG61U7Je4wbt6RKtTReByBSU4T1FkFWFUEJ/gEO2FUOoRjNJvvXwt5T0d0/WYECA83/1zxcfFVOObwuP4MVvSasr/KoIzZffCWqqrFByt6onvn8WNDYl7AyPFQiky8piuWa/gANraTo62nc9HHgxEQ7oqhOrqNWdS2aOQfiWoPf61HR5oirMRDuJ6SVbtr/R23c5qx8txvlMClV2OBVUHaUQn1Wt1HYt3Hdsp7Ee+20kQKmeeabQAg9wSK1dtVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZHsFdt0b4td30Pp+KKcLpYYYNId4lE61/bzgQR+nls=;
 b=VWpY/a7Y/Do1oGzNoa+ftyWRXezxt3n1lEouIhob38sO/YVg2giEDVxt+SmfSroaEO8B7vXDhX+QRSY+LtB/0l/O8AEhDJuoKyBDqZYNcfbfanS3FtV5blZV0vbq6slerV1yyGt3dExuw/ixNXVybeJ5bz4AjeXeCzgBxhj1QPQ=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libs/devicemodel: fix test for DM_OP availability
Date: Mon,  4 Jan 2021 15:12:02 +0100
Message-ID: <20210104141202.71724-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0361.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03ec9adb-8cc0-4fe4-95a1-08d8b0baba20
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3578AC57924FD1EEE62D6FFA8FD20@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7+yYCWKB1U1nLu00Q8YEgFSL5RY2zGHRxjjt9a6/X6Ms3E3+ByLpZcU1D2zxwid4bcMOsz5J2Sy5k8NpRM40yYGMfKcTYmxcvb5/eDiUHFxhmlhBIoP7vBxY4F7xuwDxd9BRJNjnbTHPzVnUtPRQEploDAiaJelSh8Yu0uOKIWHyKW7ky2LKNXr8J8WyVfmy2/aoBMT8XQhY0GAn9+NNFr/8IEznWTd4/MEqD/mR473HKJbsghhXGPCIv0KDn/kJZd689hy53DEytHlR1Ae8r7EP3ukvJpY2FtArUOVT4Qsf4dZRNwnByVT0PI7dTQ/dZRQo4sfYW1Zrkd66TQGylzrRuZXoHbosQeqWWTIajrGaVehXLDpZ8CisRaOfn8yIMWqGQqQOGa62gT3GpO4KtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(66946007)(26005)(54906003)(8936002)(6666004)(2906002)(8676002)(186003)(86362001)(956004)(2616005)(6486002)(16526019)(66476007)(66556008)(6496006)(5660300002)(83380400001)(478600001)(4326008)(36756003)(1076003)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVA2aWVoc0RjOE9oMzlodmtnNVFqZGl2Y1dHZ1BCUXVXUjRsZGJHbXhsR0ZD?=
 =?utf-8?B?YUZvcVIybXM3MlpyNjRXa2VUOGhtdi9yT2drVDRRRmtpL1ZDVXRKWVJtVGMz?=
 =?utf-8?B?akZmb1lncEw5R0x4Nml2dTVUQjMyMnZuaDlSakZOclQyS05KNjhPVjAwcDl6?=
 =?utf-8?B?bzZ0d3RuMzJXVGdwRldLbDF6UUhXTGZKendsdDVEZ2JJQS9tZkNFaWVoS1ZV?=
 =?utf-8?B?SStXSTlyQ3UwQ1dYVWJUOHBTUm5KbDN0eWREM0ltNXJLd294djkrd1hwRmpE?=
 =?utf-8?B?bUlYM2Y0M1lsczZ5YUZOdXo3MHBGemhONDFtelZveHhETjI3dzNjM2RLdE1r?=
 =?utf-8?B?ay9Uc2tCQ2dubGowSGNOd1ZzRHVNU05zV0hhR0VGWkJrSFBqV2NiZjQvQzBU?=
 =?utf-8?B?MEwySzArbzhocGJIZFVyZC9SWTR0bWpMSFRxV1duRGJLd21IakFlVEcrWjFt?=
 =?utf-8?B?WXhrV3l1VzhBb2RDYXpqTmdKbXBJb0NZMm1uWWkwOCswMzBCQ2NjV21vbDY3?=
 =?utf-8?B?VEM0VjFXTkg3a2FQeEsyUm1pWW56ejFtWW5tK2RlZkk3elQ1NWNtclV0YnU1?=
 =?utf-8?B?VXV4cHM3MmtlRDR3eEhPNFJONlBzTlFNdzBoRms3YnJtMSsrVnRFdUFQYldy?=
 =?utf-8?B?ejFGWEZTd25GRitsV2lURGpmUzMyaklXQjkzNnNrb3RlVy9KblVEdGtyVGl5?=
 =?utf-8?B?Mm9QbFlLdFY3UlhKZHZsdGVlYnJpckw3VmZPb3FSQ2hNUnczdSt0UEdDbEVo?=
 =?utf-8?B?aUtKMkZQK2JSTERWNmpVVy9NbFAyWWdoQzMzTDFtMnNKRGxCdUYyWitrUXFw?=
 =?utf-8?B?M2JNQ3REYkpYUjNYL2IyWmpMNDIvd3ROM0t1R2x1TzdhZS8yWjBzQ1RlMnZL?=
 =?utf-8?B?REJxOWtxZE10RDZTeVp0T3FrY0Nwakh0cDBKVDErMnUvNjQ1RHdUYVdNczZJ?=
 =?utf-8?B?dE9aRmJ2aWlZYnBHSmxmcEUyZVRRWTYrK0VoOWJTTGNZN0gyNy8rUzRlZGs3?=
 =?utf-8?B?b2FrNGJEbVJVdGltbSt5UlUrUTZ2czJ0cGg5dSsyTWpxenFabmFJRWUxOThi?=
 =?utf-8?B?S3A2VkVKYjBBeGZSNUV2ejNOSTdUSWZhYkpmOXNIVnV3VExncGs1RnRsM3Mw?=
 =?utf-8?B?UzgrQ0M5WlRuNnBrRy9mQVpHUXlWUnlkb2szNHdPRnF2K25EZUV2ZVZlSWdl?=
 =?utf-8?B?Q2hkR283Q0JJZDE0enh3RXhDV1JFNXFlYlZXeW00MURDUDU0Z1lUY2ZXQngx?=
 =?utf-8?B?NFFxQlUxVW5RZStQSjk2ZVY1MkN1a3dTeFFTN2J3YzJqSk1RTDRqSXduT3FJ?=
 =?utf-8?Q?fmjKfO5gxdGNM5VKxKm+bAZ0+hudF4O0yQ?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 14:12:10.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ec9adb-8cc0-4fe4-95a1-08d8b0baba20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RXYahCwNofskML096QjRfBn8HoQGYbXHUWxubQvNaWblklfJa42z0TUSWe4oTTr8W34PG4kYPdFyf3iA6ouhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

Current check for DM_OP availability in osdep_xendevicemodel_open will
always fail, because using DOMID_INVALID as the domain parameter will
make the hypervisor return -ESRCH, which will disable the usage of
the DOM_OP interface.

Fix this by checking the errno code of the test ioctl against
the privcmd unimplemented errno.

Fixes: e7745d8ef58 ('tools/libxendevicemodel: introduce a Linux-specific implementation')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm not sure when this was introduced, because it seems like it's been
broken from the start, as the hypervisor always had the
rcu_lock_remote_domain_by_id check and the userspace library also
seems to have always just checked that the test ioctl would return
success.
---
 tools/libs/devicemodel/linux.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tools/libs/devicemodel/linux.c b/tools/libs/devicemodel/linux.c
index 0fdc7121f1..35050b493e 100644
--- a/tools/libs/devicemodel/linux.c
+++ b/tools/libs/devicemodel/linux.c
@@ -35,11 +35,16 @@
 #define O_CLOEXEC 0
 #endif
 
+static int get_unimplemented_errno(int fd)
+{
+    return ioctl(fd, IOCTL_PRIVCMD_UNIMPLEMENTED, NULL) == -1 ? errno : -1;
+}
+
 int osdep_xendevicemodel_open(xendevicemodel_handle *dmod)
 {
     int fd = open("/dev/xen/privcmd", O_RDWR | O_CLOEXEC);
     privcmd_dm_op_t uop;
-    int rc;
+    int rc, unimplemented_errno;
 
     if (fd < 0) {
         /*
@@ -54,6 +59,14 @@ int osdep_xendevicemodel_open(xendevicemodel_handle *dmod)
         return -1;
     }
 
+    unimplemented_errno = get_unimplemented_errno(fd);
+    if (unimplemented_errno < 0) {
+        xtl_log(dmod->logger, XTL_ERROR, -1, "xendevicemodel",
+                "privcmd ioctl should not be implemented");
+        close(fd);
+        return -1;
+    }
+
     /*
      * Check to see if IOCTL_PRIVCMD_DM_OP is implemented as we want to
      * use that in preference to libxencall.
@@ -63,7 +76,7 @@ int osdep_xendevicemodel_open(xendevicemodel_handle *dmod)
     uop.ubufs = NULL;
 
     rc = ioctl(fd, IOCTL_PRIVCMD_DM_OP, &uop);
-    if (rc < 0) {
+    if (rc < 0 && errno == unimplemented_errno) {
         close(fd);
         fd = -1;
     }
-- 
2.29.2


