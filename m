Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2B3086D0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:09:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77753.141023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OqN-00053d-Ar; Fri, 29 Jan 2021 08:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77753.141023; Fri, 29 Jan 2021 08:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5OqN-00053E-79; Fri, 29 Jan 2021 08:09:27 +0000
Received: by outflank-mailman (input) for mailman id 77753;
 Fri, 29 Jan 2021 08:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CEfz=HA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l5OqL-00052y-5A
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:09:25 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d589fe18-b640-4174-8af8-d29cf7458891;
 Fri, 29 Jan 2021 08:09:23 +0000 (UTC)
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
X-Inumbo-ID: d589fe18-b640-4174-8af8-d29cf7458891
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611907763;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=VLk1ilLS/5EiUIcofUgMC8ww4YHHzs1Hhh3RL8LxF7c=;
  b=ZhkZkM2ivJ3lPD5KjJXfz9VwJZ0hrcb68t+3mWYLbBfiayYLs7HKSydD
   iYO+SEzxCwrIw2hGUiQSWfrwJLTonGq8p6ip43ePZ9yNOE1NqJzYA5YRR
   xztTCyNOxfS6oBq15UflCewTZo39du0b/4kFgekdzQMG/EGDJ5LurjPyv
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: K2vthq0ZaUF4BxnPkCkhxY3Li867X2qzmnNnM68up5XF8J5B58gpFNusNNc20X6sl+RmgmFqam
 4hG8972He1QbyQDY2xUQeekZPg84We4281Fmz4e/KFNCXSAm04e41iPRf6eaZtRJsqgeGursCh
 3zoB3PNc1e8LteAC7O5SsN4gDR9wRJAueJl1AoTkm1n9Gvo21bjM5kPpA/qH3XSWtrHyuv7RuN
 UQkdiGc+QaJgq5Ea6McHYEY9QhHj2LlM7O5dyc7mdR4DIByX1wdB0NM+2yIZCMI0GNquRDZ/y0
 4Jo=
X-SBRS: 5.2
X-MesageID: 36094392
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,384,1602561600"; 
   d="scan'208";a="36094392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDqbO8Hl3Gf3HOIigYPbBM3LcLu/U0UnjZMyc6bbwtQMaoa+6Y2+WiDAXqk7/fQcQU3nwFIVreHSpj5S8PoYdR6yW3CmCV+Ms47gB178g/ihR7yOjWNxOyxaSmIBpHQnqXY13cfXd0PyjIM0dOJFrKjtG3Zj9vQ5i2/rCcxXcdGrQlQv7srBs5IRRl9yh4LDpeGmFW4qHJG9FLmsaeii7HC80CBfYzKrVyKlnGLhXgMB6F/Nqe33PhLmijQXtiVSz9jGZVUg7GeYk85bSYaQHoyIWTRrit55rwZLvhhOeh55PE5SclKfcSLZ2gncsUXjzciYCI42fmZsZ+oXXNTGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59IBSPxFJSLPUesTixSDC35C2l3xZdXrRoLPqiJoM6U=;
 b=jjzRY/uDK7aAlF8piL8Lgz4LswTPK+49gDuv3HwM/tlWsyaRlIGymJjKdZeeOhO6cCOb+4CN8ZAgi2EhwvWwbDf55Hl2wa9Q84iLPZytVip2sHqzpLvBFSs7MLHL02eN7bsm/Js8d99lPrzBwyu0tvQMuY5/J+TALDmy+uz5rHappEytHe/fkGEHtq6ga7QhNWTvAEKue4sMzhnLJva089d8UXF61pSYukkXnXW4J8ahNGw87+vlPuYvnlkSYEqSEU0wVh9CyFQAQYjxGHswk6LweVBLBd6GwGCAxS4++3/cqQE+5HeOlpnufeBaXbBNGs6ct4w2nz98RcrqwyjDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59IBSPxFJSLPUesTixSDC35C2l3xZdXrRoLPqiJoM6U=;
 b=jxBlHZi0HcfCxZs/zXLiYv9X7pElHLkPPchvrwuZZmulIWqZrSOd5mQs3w7C+XgOgXnCGg1+LYLGjUv2/jhRoH1WcN/4IlC5uzeW5eT6P7WoHjmFm2vmcxOb0+WmGwaNZyXewVCJXvRHNz7DGzqqElBN0aDavDxIjYJRYYnpcX0=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] libs/foreignmemory: fix MiniOS build
Date: Fri, 29 Jan 2021 09:09:05 +0100
Message-ID: <20210129080905.14517-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 955b3ac5-94e3-4131-9ba7-08d8c42d2c76
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476D7F5E3C33297C002C0F48FB99@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6MJUmOvdyg+V40945+ncTmF+mQqaOBnlPRaxaulq/NXvOL+OY4kFbWBDg1eTHWUuemrYZXKkvGuown9YL+e1xgO2AOyhRn58aIrtUWTgKR4cwrq9WKm4A1a92G3UEc3bkfJKjVmPY2dIt1i3hiKMhv0FoARc8oeZFWltkEcD1QlIp7tn90rg9Q04Pw99jfy93JsWVjcrkNnQrOgsgPt8mpMe6Arma7/USm7bxbOrHk0Ishw4VG/OAB0KyUon/6ZI398y19oRJPifF3U9PeseXbrbFOa00lZmM0XIg0ukULtPhx+LWKPRZ7o3yqr6rOD9IfYbSGz0O8NlEQqSqxUUWeV5WSQQ4WaN+f9d3REa/GlBF27943vfGxqRx7/wowdZHX7MuuJBip1xjYO5+AxB9XYZpz3pmUQPbd6cYm5eA2T4AMSGGQix+hUdD3BPGldGrmErrPUYpOiU60G2KatOx8yIkOV2C2p5RTyFnKfYbrVUT6Hz9uxEJxs0QoVluN7kv2IITFSFXYPkw4/f4DDevQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(6916009)(86362001)(4326008)(8676002)(6496006)(6666004)(8936002)(316002)(5660300002)(26005)(83380400001)(16526019)(66946007)(2906002)(2616005)(478600001)(956004)(36756003)(1076003)(66476007)(66556008)(54906003)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UHhOUFFOU2JnT1pVV2oyQSs5K2VlWlAyMU1sVWM0UjRjV2NLWFMyelVucGc3?=
 =?utf-8?B?VytWQ01kMWlNOU1JcXhWaE9iaVZTZTVvNHZXVVlBekJDeU85V0ZmN1kydGRP?=
 =?utf-8?B?V2o3NEd6M2VVcGxiSXpsSTFaU3ZaTnFESUpMa3RUNjh0Y21ZZlVNbGlweVBI?=
 =?utf-8?B?MzZpaUlqNm10anBvdEREL0JGdGtxa2dPbUsxNWt6ZUxCNnpwTGNmMlNuK2o1?=
 =?utf-8?B?VFJLY2QrazkxTTgrWENHbzJrcjNHZEhvSUhHWWFVbUhpcTI5OEs4U3k2eTJI?=
 =?utf-8?B?RlNaVWt0ekZYOGN5NXVZeTRWcUlkamxOTTZrbUU4VXNmOUtsSkVhMStJTTl0?=
 =?utf-8?B?dUNxZk55QjZHVFdVOWYxdTFOMUlSQThEcW52bjc1YzdKYW9tWnlVMjE1YVpY?=
 =?utf-8?B?a0tIZ2dGdWxzanRUS09Fd0h4QUpJU0Z2RlRXTmNpMnBuY2RqT3pNOEtDeEtu?=
 =?utf-8?B?cEo1VC9IamxpSmd2clNlSVlJeWY4c3ZVTjdzRUFRRUh3dnk3SFVTNFluR05l?=
 =?utf-8?B?ZlpvZzBEZWJJenpNVEc2WFF4aVo4REhIUDRyNjQybE05d1F4Wk9NZzZmeGZo?=
 =?utf-8?B?NjcvMVdvVGNobFJQQkNvQ0ppNGpMVVNpYzJoOTBvTWdqa2c3NW9wRGZCTVJq?=
 =?utf-8?B?Q1Q3Tnp0QzdzQ05tNEJZSWVCeVNRRitZT1ZXQjZQNmJOMDJFVWxYZEt1RmRE?=
 =?utf-8?B?REpMc1dxeFNnbjhZcWl4ZTZxRnN0R1hTenJkT2ovVDJROTl3MFh2K2hQYmxq?=
 =?utf-8?B?eWtsNlo0Q3QyaHRQa0s2U3E0cGkxQXdhRjJkd1Y1RmMvUHQwVmIzMDBDNzI5?=
 =?utf-8?B?MS91VDNMNFRjUXk1L0twR3k1dU01MWhGQjJLSzFsdUcyL1YwNUlJaXRRQWZn?=
 =?utf-8?B?ZVRSS25jMGhPSEp5NGdjUi9MUCtnK1AvdnJwbDk2SGcvd1ZEZmk1RWFFKytJ?=
 =?utf-8?B?eW0wUWp0WDRJR1YzY214UTdyeFRGM3BEVzdsK2pBMk5ZSTcwcFpsMVBYeUhj?=
 =?utf-8?B?V0pKazIwTllhMk1xcTRrQmZBQWNUS0p0WWIrUzh2cGIxUERtOFVrS01WVTFz?=
 =?utf-8?B?c1ZmYUJmQlYvdXVlZmJGY1o1bmZqUXl6QWtraG5aVVNSTWRHbUgxQ0VIU0FW?=
 =?utf-8?B?TDlxVE52VFY0NzlhTGg5TW1GTEpPbnQxMDgxZmV3QkxXNkxkZlFwUVdxSHI2?=
 =?utf-8?B?MWxEZmwwZFFlZmZhaHlqckVEdWhUbDg3MHZZbzdMTnk0RzhhNHlma2V2RUZB?=
 =?utf-8?B?UnpXVVF6S0dUK3BhVkU1cU00Ymt4aW9DSDlpNXUyY1d1aFdOenVSZ3hpOWMr?=
 =?utf-8?B?Um9vbEYvUmxSNXFCNU40eGdWZ2d5WFg4ckhmbzY1OTVGV1lTV1BlRC9TUzNJ?=
 =?utf-8?B?cHlGMWRRaVA3UFVVVWUzUjhsSFBsem5BWnk3Y1k1M1BmQUU4c1p0VWJmM0t6?=
 =?utf-8?Q?lTu29pj5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 955b3ac5-94e3-4131-9ba7-08d8c42d2c76
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:09:17.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGC1YGb1hcdQR4UZLehtg73jAUXFmeUcjyPZKdSxpJQUePbNXl6EhwgKGDFHLXXEOhHByTSyLfIejhZJ6P2dbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

Keep the dummy handlers for restrict, map_resource and unmap_resource
for MiniOS, or else the build breaks with:

ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_restrict':
/home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:137: undefined reference to `osdep_xenforeignmemory_restrict'
ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_map_resource':
/home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:171: undefined reference to `osdep_xenforeignmemory_map_resource'
ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_unmap_resource':
/home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:185: undefined reference to `osdep_xenforeignmemory_unmap_resource'
ld: /home/osstest/build.158759.build-amd64/xen/stubdom/mini-os-x86_64-xenstore/mini-os.o: in function `xenforeignmemory_resource_size':
/home/osstest/build.158759.build-amd64/xen/stubdom/libs-x86_64/foreignmemory/core.c:200: undefined reference to `osdep_xenforeignmemory_map_resource'

Fixes: 2b4b33ffe7d67 ('libs/foreignmemory: Implement on NetBSD')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/foreignmemory/private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
index 7e734ac61e..1ee3626dd2 100644
--- a/tools/libs/foreignmemory/private.h
+++ b/tools/libs/foreignmemory/private.h
@@ -54,7 +54,7 @@ struct xenforeignmemory_resource_handle {
     int flags;
 };
 
-#ifdef __sun__
+#if defined(__sun__) || defined(__MINIOS__)
 static inline int osdep_xenforeignmemory_restrict(xenforeignmemory_handle *fmem,
                                                   domid_t domid)
 {
-- 
2.29.2


