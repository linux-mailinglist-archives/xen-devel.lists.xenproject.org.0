Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C3F310AFD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 13:20:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81669.151019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l805a-0002mC-Ug; Fri, 05 Feb 2021 12:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81669.151019; Fri, 05 Feb 2021 12:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l805a-0002ln-RF; Fri, 05 Feb 2021 12:19:54 +0000
Received: by outflank-mailman (input) for mailman id 81669;
 Fri, 05 Feb 2021 12:19:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cB+w=HH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l805Z-0002li-CG
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 12:19:53 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 84997aa5-a3f6-4916-a0d3-82379f7e9a80;
 Fri, 05 Feb 2021 12:19:52 +0000 (UTC)
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
X-Inumbo-ID: 84997aa5-a3f6-4916-a0d3-82379f7e9a80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612527592;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=vD7gtRp67wc93VIMFNu6NWMTgUtulnuGQomOx0lsWvs=;
  b=Evz1kYQ6WyTiCDSbCgqwTj9y0javz3m/7W555GX7t5TmhMtVapgpziOu
   pjl1Ikk+y5zvAIDGzUeN4l4oBQeEAgMFfIEHRZtoZv8xxnkPBmzMemY7v
   IMANUg8ypYofbfUsZmaC7yDNpNraFWtBPjsBRVJqrTr9SrGZ9SebZBfER
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Wz5BbAfAl7dQ7HaTfG8L+snBoa4T1d3gCxdYDCzPoFOnuw3gy3UNNfNOKuDWDDpxmuIVFq/N/X
 LhflLMA/eI3eYerk8jWk0Y+EgRimtsLiIGTZxs4JwOPKo/oaYsRlsOwX7WPopJ+8mfoMdtLEYZ
 2J5saNOlJJVTb3TZ5l105054uCcTTjR/P56lDN075QdQE/0ySjir82VCvSjEhAowJXFBUxaeLp
 aENImUmVuBYT/4QvB3p8MGFzJy+GD/tqx0ZoP5WCaGJs6PJvf+KWh1+Sa1crniipCaOWqxE96N
 OoE=
X-SBRS: 5.2
X-MesageID: 36667251
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,154,1610427600"; 
   d="scan'208";a="36667251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnFOM6v5W7e6bokJLMEBuneGnW1mhOqSs8vTDmawHNFEMK4tWUzqbTJcqZvyFQu3tuPlt0qkFnNhKyzs/CKhmtBSYh4P8Tm4u8UnnqhaH5zqTS8GqFYP37lnrzrk9XZ+ShHht+MPmMTMZwje4ZFPbt0IDglP6tt8xk+y2mtAu/spmmmtjDlC0dh1j0G6iM5LtMP0P91M4suJFlfPjIsVQcQsOM16tlttP08kW77NcEZ8fsKIiuCLBabEKKmC5Aon7arJAa5i3uCgnwkdpwTwDXwLZwpZ3ZNd3IJzYUZNknyhAARM0hEm2RrAaY9RHB9Ft/DJtAbYrvrSQZ/WdfzAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV5n6nH1iEwsFQQCZRAUmnKqYBOrhumq+1ERLJqmQgY=;
 b=FNTMfKGAwT1iHlr3ESpyr9Bi7ik/L09kdBx5mZlh6Cn77F3ThmaPqnvWTU1cPlZCPKQOi+kTXm9Tq0lLQCbhYdHKevvhhEXsS1YRchwowVwxLy/8Es2UajmvLXxt71HAVZmizxDkdChTFB6t6mgvLdzuXBfQ3eqdhjC74vkYVIx3qcuLTRIbNEO1Miwkx1FDOY75fgXNt5+Z3ebNFHyvnqp6UavgenKAASh5N0ThEmrdssDZ81WxPLNEvAuLRady92qbfWz8Unc7z9eHfSqpuS5L/HePSHfrnBTYs+lPC3fLon415U8UPNZ0xxD5cTMw+70EFhm3fgLVyYTffgqcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UV5n6nH1iEwsFQQCZRAUmnKqYBOrhumq+1ERLJqmQgY=;
 b=GNHz1UpOD8wAcOSYqxmYdOJtfADV0lXxtdg7anyPRdBd+7u4O3FzixjjwyfNubXDheEK2SSFcMowLKcR76LeeGI9szv6bhPmFCrGE8/TMSOlLl0xrxTosboA5saNRIEqTGRSdoIkt3AkQixOS0ZCDILA/t2Yfqbvb8hozpTbsms=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.15] tools/tests: fix resource test build on FreeBSD
Date: Fri,  5 Feb 2021 13:19:38 +0100
Message-ID: <20210205121938.4636-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::40) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c3b659-bfe5-416e-7ba8-08d8c9d053c1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4684:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4684411AAEA6AF8FB7E70A2A8FB29@DM6PR03MB4684.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVgu7sq9XJ6doZGsYSE4tuurk8Ktq+XjDxArq2wjOzNYRdn1cWrY7Fimgr4LPt1brp9z8Pjuu15fDffXCXPiiklvyyaHySMpgi80nt4H1V7inIUCaGWsc9lOwsdyf4PqMb0B4K0XUrLr6LMNpRM26wJa7EL7TnI6ZXTEMD7dS3+si0MasnpfCUUkLWsBRlSEmrpFeL+RCwxN3FehcrYi6CDYXDYJI/9EDqlNDoRbsgIeQrFFPDSKxEk7r5cKCdCLNBFTPKOr0aX5sCUurl6ke9binkJ4JAAWGtNcgiMHnxsqO7E2KhD8VewSrD2Gv5Mh/6aNzkwAfDXw4h6M0d0kMaaQlA2HdIMeXb/+yiFL/AmTz/K8kGrWXWAoVuqO0vva/s28bNMx21S43jtbwjTBXj6AEYMHdS0PUO/tqvthIOF2Wth/C1i/zt6QixIdgZBkzwSDUqBsjrwsICGTJknQx0VvWWFOnJO1dQfZqA8SGRdnNl/N1lYcAAcnnwQ2LhJhkJiBPufAQbKYCPaBT822Hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(6666004)(54906003)(4744005)(478600001)(1076003)(316002)(66556008)(26005)(956004)(6496006)(5660300002)(66476007)(86362001)(6916009)(2906002)(8936002)(83380400001)(186003)(6486002)(2616005)(66946007)(8676002)(4326008)(16526019)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RUhZSmhjV1AyODJPdm1iZDlCdjhyQUJkUzdjVGh5RERESXVxY1ExOFFSc2du?=
 =?utf-8?B?RVFueE1NZVE5NXovRnFJRUpoTmVkUy91M2l3NmZxYm05Unh5ZWh2WFZrU3BQ?=
 =?utf-8?B?WGFCUStPWCsxNnpObmFpSkYvUnZWdUdjNGJYRTZSV1h5WDdKYmNqQ3JjYjNG?=
 =?utf-8?B?aVBUS0Q3RFlHVlFHeTFRc2FtcUM3L25JSTBWYUlkcERHQnM4cjFuZ2lXaXB1?=
 =?utf-8?B?aDlJbUkycDloajZpdkNORmxFV2dPby9CNSt0V1dKY1Y1WGQ2TVNYaGxnSTN3?=
 =?utf-8?B?ZHV0bzREbzF6M1VMTnRVU0c5Vys3ak9xVVd0aTcrdVB5YXhiWUFMVEhxbXQ5?=
 =?utf-8?B?V2VJSHlyOTJpRURDalFEZHNHWFRtdVdJUG12SE5WNXI2dmpNZk93S094ZG9O?=
 =?utf-8?B?am4wSEdMaHROTUpaVEplSGQ3d2RyaWFYSS9qeWhNbUorZ0NibWRFdTlrdDlF?=
 =?utf-8?B?SnBMYm4vbVRDNklzVXJPRTVBN1NGSmtaRHhZWEF6emRkeG9kUkFrZzB3Rkc2?=
 =?utf-8?B?NU9wa1FJQ1ZCYVIxUEtQZzZWa2RmRWVJMGdMb05LSTdXRUk1MGFyRVFWWFow?=
 =?utf-8?B?OUZKcU9UaTU0dEJmQ3lPcWtjTUJQZGFGQ0Z2MWFHWWM5cGczbWpsNkdiNXZO?=
 =?utf-8?B?Rm9lZDRsTVZjMVNZdzRNR0hkOHhyQXRWdUtRTW5Nd1I1WjNjbGkramRVb0JW?=
 =?utf-8?B?emhDNGwySmwrTXBEdlUyYThaU296NmdONGZtUkIvTWxabE1qeVdDd3BkR3lG?=
 =?utf-8?B?dERKL25IRDliNS9RYnllTlJ5UTVwb1JtcUQvOGJuU3lpem1FYk9kYkFGRjZk?=
 =?utf-8?B?OTVNUjlWVlBGWWRBeWxOajZBV3FXSml6bS9KMmNGZzNsTHo3Y3V4a2xScGE2?=
 =?utf-8?B?UFc3RWluUDY1eGxBWlcycTR3UE5RNG1TRHl0S2JVRFI3a0lTTGVJR0dNWGxa?=
 =?utf-8?B?ZVRUS2NtL0w5aTBHc0JYZTluNzJSRGhBWFdWcldLYTNiY2diQkJpNitCa2hD?=
 =?utf-8?B?ZW03MXVKRjRIWkcwb2h6cEVhL0VRRnpSaDJuYk9CVWtrY3J2R1hkbVhzYS9X?=
 =?utf-8?B?ajNkOEtpME1PMkJJV2M4a2d5d0xlWFhrMDBIMlRjbjFEVGJLN1NhRjEyNXdD?=
 =?utf-8?B?WVA0bGRjSEpZY3Yrd1o4b2piZFZxNWgwUlZnY045aWo2VzF3a093SUlJaXJ2?=
 =?utf-8?B?OGg0ZkJVY200RDcwTXQxODRMOTdSSDd0WjV1WW82WFFrVDVmL0NDdThxUUN4?=
 =?utf-8?B?WmRVUHBHZHNYd2MyLzFNL3JNYzdUT2NKMG1qWDNtblI5dmZ2ZGhoYmhXclJO?=
 =?utf-8?B?ektFNHVpQjJOTGUrSDFmbXpkSFJnWFFXWDZ0T0d5aFZSOTNmdFB0L2ZXY2NZ?=
 =?utf-8?B?NUxEeDdSdTNCUGFLYnJ6aHpJd29URG04VG9NcmV1cWJpQ3JOWE5CaUt0cXVL?=
 =?utf-8?B?aTY1ZCtDTkZvMjZiT1huWnlQY2gvbDE5WFZDMmVuMDdnazF6U0Q3QkhwNnlI?=
 =?utf-8?B?UTBYcU5sT3ErUWpxM29qTlo0RGJuUHE2QmI5MWZlV3p3YitxU2tRdVBsRlRQ?=
 =?utf-8?B?TnRjYTIzQ3lnVUpKVmcrOThCMzdESjdHOEJZelM3aWJTaUJ0UW9ERUp4NDdP?=
 =?utf-8?B?aVJTeGFNM3VpcEQvd0pyU3lKQjhpTFhpVGNSNnpIS3FVdEEzWm93WUdWUjZN?=
 =?utf-8?B?cDZvejNhbXFST0lEdFhiSGFvTndON0t0M3pCZGZJOENXaHJqV1NRU29Za0Fw?=
 =?utf-8?Q?9z716ilUxSwEpcxLQuTMd1j98U+ZM7XJIdeKE0s?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c3b659-bfe5-416e-7ba8-08d8c9d053c1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 12:19:46.9550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qqxKVD6KaceaV9aJ2uDMIHqJAC/C//PaTdt84O//rf9NyysKIcA0wTwH7iydMAVAJOkELdMiLyGnc43Us7HJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4684
X-OriginatorOrg: citrix.com

error.h is not a standard header, and none of the functions declared
there are actually used by the code. This fixes the build on FreeBSD
that doesn't have error.h

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Build tested on both Linux and FreeBSD. The risk would be breaking the
build, but it's already broken on FreeBSD so there's not much to lose.
Build breakages on Linux will be spotted fast by either osstest of the
gitlab build.
---
 tools/tests/resource/test-resource.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/tests/resource/test-resource.c b/tools/tests/resource/test-resource.c
index a409a82f44..1caaa60e62 100644
--- a/tools/tests/resource/test-resource.c
+++ b/tools/tests/resource/test-resource.c
@@ -1,6 +1,5 @@
 #include <err.h>
 #include <errno.h>
-#include <error.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/mman.h>
-- 
2.29.2


