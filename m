Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEAB35C442
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108929.207851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu2A-0007Yx-Ub; Mon, 12 Apr 2021 10:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108929.207851; Mon, 12 Apr 2021 10:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVu2A-0007YW-RG; Mon, 12 Apr 2021 10:43:10 +0000
Received: by outflank-mailman (input) for mailman id 108929;
 Mon, 12 Apr 2021 10:43:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7uB=JJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lVu28-0007YO-LK
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:43:08 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cf36ec1-4fdf-4504-9697-49290507f3d9;
 Mon, 12 Apr 2021 10:43:07 +0000 (UTC)
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
X-Inumbo-ID: 9cf36ec1-4fdf-4504-9697-49290507f3d9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618224187;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=Zr8Bkt/mCHYg8RkLaIu1QzEOYALm8KfbC+7ZCm9+6kk=;
  b=P7+Rs5TPmLT9TCIubRvszxq61z678YIsQP9CMMMAB5+9wuzfkvRCBAth
   Y6+NgZVKaeiwsudZBji23vu278juxluG/EYzXrHFm82vrqyOEZSi06Xq3
   CAXbYN5NgzLWmxoM8OvcyNzxcfq2Ezp+yXwZ6LN7ywqBo5EC2msnwSwyX
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: t3JHziossGiwfXxl14US9k20+8kk/XVnHWzWNRxwGFkAN0jzlp01XOGhbuS2K0vQUGqbJG6ZX3
 BmYUqrSDwfUQbumkbp0FbvY9qfPBrBh/sVHHPWNiZ0nDKJ+4JHyD3llBXruHxJOWYwJXuTRoQo
 iQJ/7TQRAtmzcs6OJhH9gCa3RcWyPtDlR1ZEpK7j6Hlml5NVo39TAhhyQkyead5PHFFfwRzWwK
 irUoroP4o42eZdk/0dalo56uPiC3yyJZwIy4ZVwiTu0XzbT8ItVfJJWHA1WEYG6pQCt/9e39Xm
 RCM=
X-SBRS: 5.1
X-MesageID: 41217537
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3PYkMqtohnCS5/Arl4WiXxDn7skCkoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOjrU5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qw6Y
 5JSII7MtH5CDFB4PrSyBWkEtom3dmM+L2pg+Cb9Ht2UQR2cchbjjtRICzzKDwTeCBtA50lGJ
 2Aovddrz27dngNKui9DH8JX+/Mzue77q7OSxgAGhIh9U2ynSqlgYSKaCSw8zU/d3d0wbkk+X
 XYiACR3Muemtyy1xO07R600714g93ko+EzZvCkrugwBnHShh2zZIJnMofywgwdhO208l4lnJ
 3tjn4bTr1OwkjcdG20vhfhsjOIuF1Fiw6AuC+lqEDuvNDjQ3YCA9dB7LgpDSfx0VYqv913zc
 twrgWknqdQZCmw+RjV1pzjUhFnkVeMunwykeIfpGw3a/pjVJZh6aMY509bC5EGAWbT750mCv
 BnCIXm6O9Rak7yVQGSgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i28V3tYWkHss/I80IqM0qt
 jsA+BNrvVjX8UWZaVyCKMqWs2sEFHARhrKLSa7PUnnPLtvAQOCl7fHpJEOoM26cp0By5U/3L
 7bVklDiGI0c0XyTeWTwZxw9AzXSmnVZ0Wj9uhuo7xC/pHsTrviNiOODHo0ldG7nvkZCsrHH9
 mpPpZ7BOLiMHvOFY5F0xaWYegTFVAuFOku/vorUVOHpczGbqfwsPbATfrVLL3xVRYoM1mPQU
 crbXzWHoFt/0qrUnj3jFz6QHX2YHHy+pp2Dez/9+gXw44dC51UvmEu+BaEz/DODQcHnr09fU
 N4Lr+iuLi8v3OK8WHB6HgsHRZBEEBP4vHFX2lRrQEHd2P4GIxz9+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQFENKoMmWTilMJv3KUR5IgmqmOjP2VO68QP9IDYuhcBA/LHxt6lUJBs2
 FYcjIJQUfZC3fTk6m/tYcVA+vebtF4pw+uLadv2DfinHTZgftqamoQXjaoX8LSpQo1XTJbim
 d89LIljKOalSyiLnY+h+oEIERBAV7ncY5uPUCgXsF5i7rrcAZ/QSOxiTuWhwoaV0Dq+08R71
 aRZBG8SLXuOB5wq3pY2qHl/BdIbW2bZVt3cW0/m5Z6D376tnF61vKraqK/33CKUEYLxvgQPV
 j+EH8vCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N57UwXGgJeSz5NU7Ns4R2KwgEt/gsuUGC7
 3CPyCUKS71EOMv1Ui+oG0/NCx9tXkjlrfJ1XTenRqF9U96JcCXBlJsA4w/CZW7yUPPQv6Typ
 V3jd4vp4KLQxPMQ+/D7ZuSViJJLxPYnHW/QO4po61FpK5ajsoBI7DrFR/zkExd1BowLM3IhF
 oTbaRy7rfGIJJudaUpCldk12tssNyOKUcx2zaGetMWTBUIj3XBOcmO7KeNgb0zAleZrA+YAy
 jWzwRtu9PEVTCEz7gUFuYZJnlXclE17DBH8PmZf4PdTCWseOcrxivwDlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27A4z/r1AELVZ5mwiKAWsO9AAWFBO5O/ZibAD2389aXyf/2qiz2Rzu9Y1kfnq
 tfeyUrH4N+tgU=
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41217537"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gF+MFOwNmQfh7YDPxo76pBmpO1Z6BXM93CdPBwfwzAbwB+prwBzmJh7/UXrhNk3hppoawQj77Ld+2y31RDmFJVIpShYnp8TOIF1rrhLAcWPkntPGuLgDOLWmhg9uBdRbY4krVZpJSKR6qxJqvtV24j2ETKKigcHEFIBpwm4qwRiai4t2THJd0Y9+A/2n8WYeu5YKau06eYOTN0I4MRzJRyMAS8sZGojs+3InJ979AyTzZWqQpZjJXZ6NdzhqRXycX2POTgHpTDnvPsUy2z7UgSWvLQlHnmKHbIFOjd8O/iVJCSUns4He/HW7BUVtlmpfKYoQHss20sxwXXM9DT2qOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TfYkMazFoPwSmsA3zJBnONMpB2uqqzL4jIxg4luJb8=;
 b=SkoL4Tc3un9GEMEolzLImF6VsvhLdeiG4mLKpV53zw9VA6Qley1M5rXM0mX0BFR0Sg1R25ncGAj4zJpU4IE+tLt7vK9AyBmBVK0AOXTkeO0AitCPI/aK67ccgsdK+GtvBUZFkwYjqXOREo4QgO7zUiTB5anbq1p+ArqnBnfhY2ggMCawSEoDNsO3ixLfM/Wi9Ky1BEszPe5MbFd6EV4QVGympJRSWYyhOK5GW5OgqYnA1ebRsmGiV4rbOz9CFNt0hJAeB7k8RnCnh2iAElXkGxYhqGDwDGdeCTEPA/BwjP6fiZMPif5sSqqBZh7YL73TOb18sbqeGmCnncefETGnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TfYkMazFoPwSmsA3zJBnONMpB2uqqzL4jIxg4luJb8=;
 b=fm1MCWuVjYOsiqYFXvX5YBRJkqg/941gNFhPwA/wPgB83NgTE2ISYDJy1UX6bw8Y95JJk4U7Nlebxan4KINuu/XBEWFO8NoQsNoUwEQK5C7Iz1L9h79eXzM2l4j9Jt7Cnfo2TrfMdNLi40U21wt5QUSN/nxiHUWQMO5JInAdd4g=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] iommu: remove read_msi_from_ire hook
Date: Mon, 12 Apr 2021 12:42:53 +0200
Message-ID: <20210412104253.54690-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4f6745f-c931-40c5-22ee-08d8fd9fc023
X-MS-TrafficTypeDiagnostic: DM4PR03MB6190:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB619037A22F0898A041D4ED238F709@DM4PR03MB6190.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:81;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4gedZCG0lJBY8qnSueJdVPKgRHqkbt/C0K1XIVggMcM36s3TchkdEYtOFQhNvOFKqb/tcy6gqacq8xuJTE4JYbiZ/YCyeo82v0ePBYFLYHnh3mXKvO7FvXinH08pRs+oDxgJ8Fx59GKviRgBVkt/dNIbbo/bNvbqm5CAuhv7W0Dr2Rf+lLlRjj2rAznQNgIPsLu4PryGX4+7iMkaO2zc46vI3VwOpOsjyqMxXr52Nug+ZMaH2/ccrtQH3IHyDHdRAf6P6xcEDSIWjlY8p79PKniJhWpfVG9pcV8VDkg0Y7ttnk+o2DYoz9PBWNGBJkieqjQDMMyTLQiri9vSRO/5vPPFF8+6nwp4V8T6jm6F1bs5MoyMU6p6oTY/DsTNWuw7bOAPHdbFyAzRFe7+K1/+63TlFx4m0hd+teUnSTRaQ0YjinemKmKoKG4SCCF0Iww+Bu6X4QBmK9S0OyDv1hpYgRL1NLiO7GWUOe3z5dUBcZ8hfmxqZ+Ua1KBCHEY5rvapoHsSoBH7zcnpnvEtXU8IAxxy+s+ZMvrx7uVzMFrbVBoKA9Ye543W8KETv/8O2qxlk8I1wuQPsNDkU9JV+DeBpBxuv+Mp+o72o3EEczhtp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(8676002)(16526019)(66946007)(956004)(6486002)(86362001)(186003)(2906002)(4326008)(2616005)(54906003)(316002)(26005)(478600001)(6666004)(6496006)(1076003)(66476007)(38100700002)(83380400001)(36756003)(8936002)(66556008)(6916009)(4744005)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmJFb0tUeG1NblNhRTRxTkZ4Ynd0YjQxbVFTWEZQcXV3NFlkZ2pINThLRXVa?=
 =?utf-8?B?cmtlSXN6enIrQ0o2cFg1VWdFSGJhZ1BYMjhzN2d0dm9rRVRnU3JvMzE0SEJW?=
 =?utf-8?B?WWtMbE80ZTIwOE5MUEZzU29JUnlGMEpNY1pvNTBOWHFBTXJuTzRHbFIzQ29O?=
 =?utf-8?B?M25GcDFIQlo1aVZxbUVxMExSMzZLc0VNd2ZPUXdOYW5IUldycGtRa2pTbllm?=
 =?utf-8?B?QVQzWDFtV3ZUc3ljb1B0aWxzcldGZEFNWUE0SU83N3VXcUh5c3pnd3dPWmM4?=
 =?utf-8?B?M0JtWE5lRnBXUDdjbm9QaUVJMzNPSUNJLzdEZUx3MzEyTmlOMTJGOEdUeFpZ?=
 =?utf-8?B?Qm5EZTZZY2lhSGNQaTdyeC9haEtuQTZ4RlFvWEFKMG1sY2VKZVNhMWo4elMv?=
 =?utf-8?B?TWFTeUp0SmxZTmM1a3BsQnMzV1AveGxwbjRVREFTWWhoRElGV0grb2hLS1ZE?=
 =?utf-8?B?YTVHYmJ4SDM0S3JML3N0UWNiUFYyZGtkeXhOaVZ1Mnc4dGNXZDduWlJLOUtx?=
 =?utf-8?B?YW5JS3UwdnE2d1YyQTQyWmtoMEdVWFlmbUNUYlZ4S0hiSkRMOVJMeFliMWF3?=
 =?utf-8?B?L0l1dDBqY0ZVM3NYZERQeFI3MlE4WThqS1Q1MDlWam1PcHN0MHhseGJibzB2?=
 =?utf-8?B?UFlDaUtmRit1eHpJemR1RUcvMk5DcHlEQ0F4cmFOcmVqOE5DUjdpa0RRNnBU?=
 =?utf-8?B?OUZLNUlRRWJ2d3BQZGhweVNCS3F4WjNPaGV2VlFaODNOdUowWXh3QTh2NkE3?=
 =?utf-8?B?WTZqNTkxUTl5MGgyMmVPT1k0Z1BzT1NWeTZldk5mc2VNeU95ZjR6SWNpa1lh?=
 =?utf-8?B?NWhSQjBlTTgzR2RGREF5cytWYldlL2N4L2RoR2FVVDlieW9EclZoRmVoc1o3?=
 =?utf-8?B?ZWFYYVFxSVVOVVZRS01BWEtPcjBzMzVsN3IvanIrMXJTNHJldUNDNHo1RStQ?=
 =?utf-8?B?Znp0SmE1c2FsWGFwS0J1UCt2azk2eGxLK2NOYlltOTlXc2QycWRpVk56dE85?=
 =?utf-8?B?L1czQzN0ZDdldStyamprQmxXSXNiT3cvWkdnYkZ6cyszc1JkQ2J6eFY2OVJu?=
 =?utf-8?B?WXNNS28ybTFKQ0xtdjVZUC9TTzdKVkg2c1k3YStuUTBvTThTc0NWQ244NmZI?=
 =?utf-8?B?ZTdmVGZkdnNOVTNLR2xPOHV4YVg5dUNtNENBdkd2VGV4TDJvNGRaTkNNYUcy?=
 =?utf-8?B?KzV4TnFaOTdFa0tveWI0RUdwdWxlMnZkRXBjZGxHbzhjNTFnekdvMkJtUjUr?=
 =?utf-8?B?emxBNndwRmVaa0k2YTdDTndBL3AxOThEc1drZlRZZm0ySWtpUUFNQ2xLZkxC?=
 =?utf-8?B?ZnVyWWx3YkVYYTdEWWd5WkhmQitTSGUvazRGOWxsTmFkeGhyeTMzbmpyZTN3?=
 =?utf-8?B?UWNRcXlFL29zSU1jQ2kwalcrMGtKRHlvcmJGbkQ0VkY2YXNJd2lhOURCQjVH?=
 =?utf-8?B?VWtLWEJJMGRNMzVHR0l1d0RQN042aEpBUTJxZ0VKbmQyL0V4VHA3N0ZqREZ1?=
 =?utf-8?B?SC9aNlNZQ2IrRThlN3dPencrWHdPWlU0Y3NVRnpmY1RiVEdsVFlSanp3WXV1?=
 =?utf-8?B?VTNValNYVVdMdDd6U2NSclo2NDRnWDRieVlqNzJ3V2ZwRXdEd01DaHRBdlhT?=
 =?utf-8?B?QXNVcWo3OXZiN2dwWmxnNzVPT0NqN2dKbGZnSmJpS2dyeUFsamVsR2JyZm5D?=
 =?utf-8?B?RlpWZm9ZRVF3MFU4aTQ2YTZkMDJ4UFlUOTlnZ0o1ZklESEdlM2htVVBlUjlV?=
 =?utf-8?Q?uFmCUGZDS8dF8brGHwloKwHRf41BUPlcO3Qz+9E?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f6745f-c931-40c5-22ee-08d8fd9fc023
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2021 10:43:03.8792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXfKyhL6YGeReJewvnklMAQSUhtF4b3TJl0raIQH8HyvXanaTq7iThHJlC1ql6XQzKwzt3LCAl6lzghzNm1+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6190
X-OriginatorOrg: citrix.com

It's now unused after commit 28fb8cf323dd93f59a9c851c93ba9b79de8b1c4e.

Fixes: 28fb8cf323d ('x86/iommu: remove code to fetch MSI message from remap table')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/iommu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index d59ed7cbad4..ea0cd0f1a2a 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -244,7 +244,6 @@ struct iommu_ops {
 #ifdef CONFIG_HAS_PCI
     int (*get_device_group_id)(u16 seg, u8 bus, u8 devfn);
     int (*update_ire_from_msi)(struct msi_desc *msi_desc, struct msi_msg *msg);
-    void (*read_msi_from_ire)(struct msi_desc *msi_desc, struct msi_msg *msg);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
-- 
2.30.1


