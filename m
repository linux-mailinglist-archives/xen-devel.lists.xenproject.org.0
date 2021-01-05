Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3CB2EA8AC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 11:30:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61784.108840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjbD-00074d-1Z; Tue, 05 Jan 2021 10:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61784.108840; Tue, 05 Jan 2021 10:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjbC-00073x-U3; Tue, 05 Jan 2021 10:29:58 +0000
Received: by outflank-mailman (input) for mailman id 61784;
 Tue, 05 Jan 2021 10:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onuC=GI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kwjbB-00071R-BN
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 10:29:57 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86e1b714-0b99-41f0-be13-a78e65a220c6;
 Tue, 05 Jan 2021 10:29:54 +0000 (UTC)
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
X-Inumbo-ID: 86e1b714-0b99-41f0-be13-a78e65a220c6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609842594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ZJE3c1sH8M7f29FSP6zWyrqpO+hO9epJCo+tyAhCKVg=;
  b=eCoGbLV+s8QljVqpbscCOH3PPQjXNt6A1VMicPv4rfcYDgGy3e1PElzr
   QF+4Yjk4KvpnVYnC7Unpemi0M9iR88bMAcjiHWrOyKYtUD915S+jQZoLK
   07Kzdcz5xGTcyJjzONZZL+nSD/9NFgmnfu2wZC5UDyhVu9IN+Qy+6U+i7
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ho8BAJ21+zox3nbzfUMXrKAjZ74+9VqpxwBkdXww9gAvD2J1TP2NhCNvpp5lFtwtllJIXy7Vca
 OCFkV2EPmLI0oMOIRp7EmEuLokihZHKJ7VsFlWE5RxigXCYplAuV0bPBAw2/GqyiEKpOtSyA/L
 QhUWDl3Dhm6361qZQmBgGfVnV43qXrWrRUBL8aqcwRSR/nqsrsltUoj02dJW7X+yO6rC9/8KHs
 UdX0JzCdzZcUkvHeZP5ed9oMWrVcc/RPWj+6PRge0vMMW7906GUFgBDUoYmDYRBphMJ1dw9wpI
 Wos=
X-SBRS: 5.2
X-MesageID: 34631391
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,476,1599537600"; 
   d="scan'208";a="34631391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0OSQuudgdjmCos59IfdGeCkYC8vBhspB+puOfRWlujDvapBBHPKiWTBrEmJtX/UDdV7Fbm3HcNAYPo7glp4DGPM0FX4tPg0I+GixCmcqSsoOcZihAX8H8gctxZZus0Lm9KghxaBEZY6K6YOWD5r1U6TBXkLM66HQ/PMFFThNGveV6oiVLYA8cfDEWahDtQv4SGwXHn/aARg/SQZSctUilyZ6EU1cOpVHJMC8GWQaXW70KjA1AO2UQR5TGFRwO8iUcrRhsVUoLdOjalrLFVi1WYuJnkLFc4J7RA9ZInKScV5iUsg10OWptCeUU6tAVLKQYLY+qi76k8L+Ip3URN1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn1x1xofG0i+QAYYSC/0bk22fkyzrXgwirO+IHzjkEE=;
 b=EanZ0ut6MqaQiNMj216Z/kGTfGswPAnZyONRrCwrcwId92tBB7grFehPrnriBsjL0Yd5UQO3xrYhjhCsGNrQcQ0RI6EOpx+jrSB/J6XUHNHpKbmiC37EMgdiUNnQVFfv2TarSf6QgnwznLUHFcKeenlaaHRl/vdqCtaUspen5MGWqybOGOfNPsKd3EzjX7imjr7Bgh20zxQQSfwxjD9UXXPQ8F1orawaN8N2sNY13P6cMMeDXES7yBwf7zz3Cnid1GR+I3QqB26NT75nhCi3ZJB+RQBxomq9QuWrGi2zbCPvsGfmFrl8ZI/E31E4mT57mzDCKw52OLpEo+fGgxZkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn1x1xofG0i+QAYYSC/0bk22fkyzrXgwirO+IHzjkEE=;
 b=I2pe1F/qdSNzBPb9mCvK9Aaky2uE4NMFBIgi/blU8MvnuO4RF5sOlBoWSOyHVN9GmREHFVUAxQIytOGLH0r9oetBYDFyZISJZcQK5RN7tUR/Vn/FS2/LUOgFS/FcA6+L8dMrOh/rkUGJ6PXoPecwwSFuQBQ2HgCLVVLn28JleTg=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] libs/foreignmemory: implement the missing functions on FreeBSD
Date: Tue,  5 Jan 2021 11:25:45 +0100
Message-ID: <20210105102546.88462-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105102546.88462-1-roger.pau@citrix.com>
References: <20210105102546.88462-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05b41701-ad47-41ac-04e9-08d8b164d626
X-MS-TrafficTypeDiagnostic: DS7PR03MB5525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5525727EC5DD6450D65BBE8D8FD10@DS7PR03MB5525.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFKXX+AQztlw5qBZOpEnwh6AxLNFubHOINcsmPkX7+4NEZPY3jMPeunnimH3YSVzFqkuL8BAL0QrqTdi8ZN8Ms0l5TMxdaatRlE10+7kpMJLTkMlX57IAa5j1+nW0+OtP5aP4z+MZHaNHI2fseebn1c684iPXqEyoQEWBt3HcVfZ8j4czXzNBH8/REdG+h9kLOh1jUdX9LtF/jvVJzA9Fi3C/A1+O0KFpG+BMSvJZ1NQehJsmDxbqM8CyBdOpxtsIN7vTuDdhnDx3jWmrHchb8uvm4wSBg0463WTUVvA9AuhYZF7D1YC7jkvxlTLX1YYGMdbkZzBiPElJ+D5yhR4j5MK1srhk8ofEH0G/OGSfnq1s36R8BPR3nji90YKdq6A
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66476007)(8676002)(16526019)(478600001)(6916009)(186003)(26005)(4326008)(2906002)(1076003)(6666004)(66946007)(5660300002)(66556008)(956004)(2616005)(36756003)(6496006)(8936002)(316002)(83380400001)(54906003)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXJwcUtseEVXUW44ODZ3UVdqbTJRTDgwY1ovN2lBQStLcXZDbTZROWFRKzRz?=
 =?utf-8?B?ZGVVbWd3OWo3OG9ydW44eTJoeTYrTXRnUXNuNjZTVDhhVlVvMHNFVUdMNzBt?=
 =?utf-8?B?NjUvU2hzY1Y4NStuQVFmcHYyRlBqVlFQOE5aMmNEekJabGJDRjJXcFlJK1Qv?=
 =?utf-8?B?MVkralhvYzhKdG1BUHZrbDI3bTJ1VzZ6WG1XN1B5YkpUTHoxZ1VjV2dQQzh5?=
 =?utf-8?B?ODRqZ3FhTFg3QzhIS3R6elBIazhuclZVRHlEMThnTmoxaDd3dkM2MDUyREFP?=
 =?utf-8?B?OW9wWGtMVVNjd2tQMUlnODNvTE5ZQXN3Y1MyeUZJZWRCalFaQXpPK1JuZFRW?=
 =?utf-8?B?YUcxYTdoZUlBOHZZZlVmSU5FQUVHUWk4NmdHSXRuaE9HSDFsWnNvT1dvMmJj?=
 =?utf-8?B?ZTRvOWN4MGhxeEFkUkN1TlRiWjUyYkFhalBpaU5HMWdUekZLMGZEWklGT0FD?=
 =?utf-8?B?SWcwNjlGQUl4a0l2Vi9IRWd4Z2h1ODdBZnFVTjVCbnQyL1kvTk1Ycy81L0VM?=
 =?utf-8?B?V29CejBIN3B3WUhPNG1HTitnbm12QWFxa2pnS0VGOVoyaXB4S1lKVmN3S09t?=
 =?utf-8?B?MkduemFXVjFGTjhHdlVxRUR6NFE1akVJRTFHWk45WkorQ2d2RUVCWXdFR1lV?=
 =?utf-8?B?Z3JxS0ZSeEpPMjgvOU5CYkxaTi94STM3M0FNdHhVMDRKU0NVbVA3WHQ2MFIz?=
 =?utf-8?B?WTdFc1Q2Uy80VWV5NjRzQXJGNlpTeWlhMlZ2YlNDU1hKbzBXcE5pZHFvSFVo?=
 =?utf-8?B?SWtZR2QyTWRPYk0xc00zOHZLRWFOazB4aWIvL2hzdFZKSEhZcjI1ZjFFRXlp?=
 =?utf-8?B?SnRoakVpbHZPczBCSEdLa2gvRE9aMFZNTHlYR0VoQ2ZRZDhVTHN0Vm0wcjl0?=
 =?utf-8?B?clJrb3c5eGFTcjl2QjFWUEhoV3RFZjhFMnY0Tk1LZEJrdnhMWWJ3MEUrSDQz?=
 =?utf-8?B?TEQyTkJFaWwxRlhoQ1IyZ0trYkcvRENYZTRzcW9CNHMzbXVOODVaeGtRcnN6?=
 =?utf-8?B?RnovS3JlM2ZrN2FJMkhrODNkQ1pEQlhzdFR6RjRpQ1ZHbndyMFQ3Z2gwaE5K?=
 =?utf-8?B?QURnWDVNcGxlUy9EOGJGR2JoQ0o5WEozRW1HMFpISGVUVTZxc0ZoZTdXeGJI?=
 =?utf-8?B?VUlZallzWURsc051TmVEQVdrM0FTblZDdmVVZmVwQTNUWmRrSDErUEM2QlJE?=
 =?utf-8?B?V2xYaXYycytKZWcwL1VJZWhMQU5IWE9DTmlWaWhMaEM0MkRtQUVLWU0zL3BL?=
 =?utf-8?B?a0NUYkVmdHEvL3ZRL0pVbWNmM0lEWUZMdXVqQ1pJSFhYcFpFditQWHRwM0do?=
 =?utf-8?Q?OHkFt4ccL2l7N3Vouep6S+tMhVJXhERhd2?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 10:29:51.9661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b41701-ad47-41ac-04e9-08d8b164d626
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRsPSLuBFX/DaNGvGjGsWs2fU4npddhMd1P2t/x9mbW10IQhF6rxo5nVnfvCqAEIMm0sbt11AEh5QBp/v66Uzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5525
X-OriginatorOrg: citrix.com

Implement restrict, map resource and unmap resource helpers on
FreeBSD.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Note the implementation is fairly similar to the Linux one, so could
likely be merged with some ifdefary. Note sure it's worth it given
that we already have a split file.
---
 tools/include/xen-sys/FreeBSD/privcmd.h | 14 +++++++
 tools/libs/foreignmemory/freebsd.c      | 51 +++++++++++++++++++++++++
 tools/libs/foreignmemory/private.h      |  2 +-
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/tools/include/xen-sys/FreeBSD/privcmd.h b/tools/include/xen-sys/FreeBSD/privcmd.h
index cf1241f039..603aad67d5 100644
--- a/tools/include/xen-sys/FreeBSD/privcmd.h
+++ b/tools/include/xen-sys/FreeBSD/privcmd.h
@@ -56,9 +56,23 @@ typedef struct privcmd_mmap_entry {
 	unsigned long npages;
 } privcmd_mmap_entry_t;
 
+struct ioctl_privcmd_mmapresource {
+	domid_t dom; /* target domain */
+	unsigned int type; /* type of resource to map */
+	unsigned int id; /* type-specific resource identifier */
+	unsigned int idx; /* the index of the initial frame to be mapped */
+	unsigned long num; /* number of frames of the resource to be mapped */
+	unsigned long addr; /* physical address to map into */
+};
+typedef struct ioctl_privcmd_mmapresource privcmd_mmap_resource_t;
+
 #define IOCTL_PRIVCMD_HYPERCALL					\
 	_IOWR('E', 0, struct ioctl_privcmd_hypercall)
 #define IOCTL_PRIVCMD_MMAPBATCH					\
 	_IOWR('E', 1, struct ioctl_privcmd_mmapbatch)
+#define IOCTL_PRIVCMD_MMAP_RESOURCE				\
+	_IOW('E', 2, struct ioctl_privcmd_mmapresource)
+#define IOCTL_PRIVCMD_RESTRICT					\
+	_IOW('E', 4, domid_t)
 
 #endif /* !__XEN_PRIVCMD_H__ */
diff --git a/tools/libs/foreignmemory/freebsd.c b/tools/libs/foreignmemory/freebsd.c
index 6e6bc4b11f..3d403a7cd0 100644
--- a/tools/libs/foreignmemory/freebsd.c
+++ b/tools/libs/foreignmemory/freebsd.c
@@ -95,6 +95,57 @@ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
     return munmap(addr, num << PAGE_SHIFT);
 }
 
+int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
+                                    domid_t domid)
+{
+    return ioctl(fmem->fd, IOCTL_PRIVCMD_RESTRICT, &domid);
+}
+
+int osdep_xenforeignmemory_unmap_resource(xenforeignmemory_handle *fmem,
+                                        xenforeignmemory_resource_handle *fres)
+{
+    return fres ? munmap(fres->addr, fres->nr_frames << PAGE_SHIFT) : 0;
+}
+
+int osdep_xenforeignmemory_map_resource(xenforeignmemory_handle *fmem,
+                                        xenforeignmemory_resource_handle *fres)
+{
+    privcmd_mmap_resource_t mr = {
+        .dom = fres->domid,
+        .type = fres->type,
+        .id = fres->id,
+        .idx = fres->frame,
+        .num = fres->nr_frames,
+    };
+    int rc;
+
+    fres->addr = mmap(fres->addr, fres->nr_frames << PAGE_SHIFT,
+                      fres->prot, fres->flags | MAP_SHARED, fmem->fd, 0);
+    if ( fres->addr == MAP_FAILED )
+        return -1;
+
+    mr.addr = (uintptr_t)fres->addr;
+
+    rc = ioctl(fmem->fd, IOCTL_PRIVCMD_MMAP_RESOURCE, &mr);
+    if ( rc )
+    {
+        int saved_errno;
+
+        if ( errno != ENOSYS )
+            PERROR("mmap resource ioctl failed");
+        else
+            errno = EOPNOTSUPP;
+
+        saved_errno = errno;
+        osdep_xenforeignmemory_unmap_resource(fmem, fres);
+        errno = saved_errno;
+
+        return -1;
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 8f1bf081ed..ebd45c4785 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -54,7 +54,7 @@ struct xenforeignmemory_resource_handle {
     int flags;
 };
 
-#ifndef __linux__
+#if !defined(__linux__) && !defined(__FreeBSD__)
 static inline int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
                                                   domid_t domid)
 {
-- 
2.29.2


