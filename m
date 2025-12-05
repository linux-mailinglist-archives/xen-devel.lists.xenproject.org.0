Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF0CA8519
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 17:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1179257.1502850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNd-0004EJ-Bq; Fri, 05 Dec 2025 16:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1179257.1502850; Fri, 05 Dec 2025 16:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRYNd-0004CV-38; Fri, 05 Dec 2025 16:10:01 +0000
Received: by outflank-mailman (input) for mailman id 1179257;
 Fri, 05 Dec 2025 16:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u3Xi=6L=citrix.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1vRYNa-0003s6-ND
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 16:09:58 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6cc8b35-d1f4-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 17:09:56 +0100 (CET)
Received: from LV9PR03MB8368.namprd03.prod.outlook.com (2603:10b6:408:364::10)
 by SJ2PR03MB7403.namprd03.prod.outlook.com (2603:10b6:a03:55a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 5 Dec
 2025 16:09:51 +0000
Received: from LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3]) by LV9PR03MB8368.namprd03.prod.outlook.com
 ([fe80::d8cc:b839:3d79:59d3%3]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 16:09:50 +0000
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
X-Inumbo-ID: d6cc8b35-d1f4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2AqWTzJRyGbn1bK11oGa2GKqzD8GZqqH65UNkIGsI8EbGPrH8Ye1dE/P6kVfcrd4I7zAmy1eUyPcZs6Uk9FFT6wW7CUe3rtyDCw0ePx6dBv9ct2Rvk44EKDPkwS3UFEtO1kIcLJsKghqpbjCtJZIjEn/J0EHa9NE7CBPHv3JKu6aMIzGzcP/L+stfHAIjMpEvNQlBoLXXgy4QBzhpzytdpdaTEu+hg6s8Ii9RdjVunfYw82xNIjshUqUZc7zvqeY680BIwXuxIhvVdjr5r9y7v7ONzrCoN9l70db81xIq9spdQdrc8Dk6IviSm6nFhtCqDZ8M4sEwjgc6/jnypnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGlOaf4HgTML+Lqr4YUlvbgye1+iOSwZa3NuOxItXFw=;
 b=o5CMHw9ekp+lPZRPSwSdxQadAm8CM5M8EekShshwV+c/CVtAV9vZE6VBhdPUvhNZZoCvP60C/F1YArx8PvJb52D24KS9AiULXXQf+eGFq/SOnXoHanl1Y5obe7RNq/jvrZ3R84juttji+s01Tn+dxvTI6eFr/2s5dmMDEv5lEYhyqNFunWRnAyP8c3ru6VUCbySOyKK4N/i0u4H6G2mwrq7TXWG1xaz0Fr+BBwvhzuV/+f9TWZoPMRyHxVvbhC7qUqkqupq1+0W4leOimW1lC5yzmzdll4mt0x5IFgMcpJjUWPtspqggZmMRb7LMEimmHb2kIVn5xg/4RPcLF6nFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGlOaf4HgTML+Lqr4YUlvbgye1+iOSwZa3NuOxItXFw=;
 b=JZZ9w0ThkctN+vl3Cw4acBSzEZXRVeDt40P9jaxy1Ozv7sRD9Kyl1KHFOLtvnbGRqjIqpWZgwMI3xswKa2Lownenr6X+Ok03l275slnbNJUyRlvob2TkanRIkEm7tRaApFWHSZN9C0ZQT8gpRabuyv4zf6bhjSgboqRQ8qjZa8o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <freddy77@gmail.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v9 1/2] Do not attempt to workaround older binutils
Date: Fri,  5 Dec 2025 16:09:39 +0000
Message-ID: <20251205160942.46694-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251205160942.46694-1-frediano.ziglio@citrix.com>
References: <20251205160942.46694-1-frediano.ziglio@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0037.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::25) To LV9PR03MB8368.namprd03.prod.outlook.com
 (2603:10b6:408:364::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR03MB8368:EE_|SJ2PR03MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 55191a88-700d-4520-42c3-08de3418b83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MpEkseHOlHvX5+lnqdsvtjJRP93LnPK+upmtLXO2Qe+Xjv9Gx6W3tP3mm/Bi?=
 =?us-ascii?Q?NO5oM9oH7W+OjP1AUefgY1XV27tfsQdymlwk1VZW82OXwcu8QJkuQ37JvR4+?=
 =?us-ascii?Q?Z4AA+WQtVQc3ZmccsPNJ+mZ9Cio+QjTaojH24gMiB4bwnGsJZLs73sPGMXlW?=
 =?us-ascii?Q?Fp5J008p37x1yS1waz7U5insJa+ZwM0+/bdfU65BcY8y4vKB+QS2sefAt5H4?=
 =?us-ascii?Q?wuFMjprYBKNVt/U0MrUHRYs/4LaxlLIUowbZSXV1cZCmKDwMJr2uOC+oRTBp?=
 =?us-ascii?Q?Jo6yB57z6JrsyZwhy7MmXL3G5oEbJgLNuEjZMCJlQq3W3uaBZXX8XllJxJXP?=
 =?us-ascii?Q?jIr3kfB9RI5ErZcvbUfqK0oO5XZOc8txJayV/oSateG2C4wckjNQmYPbysEv?=
 =?us-ascii?Q?/ifmEv37a/Q336LZ0HAso1DdJ7QBJfXGp23T3F8q1ZgIfpsMCTqGK7Eq5zwW?=
 =?us-ascii?Q?CpQWCj5cfcHMuEhPbK4oeuFaVKD5y1QgLcJTvchPEVRMEnnVxqnrLTZWLpJH?=
 =?us-ascii?Q?NE8LKpZl0BNJo5L1ZgJauZTBS5CyG5g1ymo49surAL6Jk+7ddk1Ue7txlveD?=
 =?us-ascii?Q?9EhwEgDUWap1W4F6S8M4VHQAd9JjXHeqRgB6AcKAOv78nzm1tZNcf7+QGAPv?=
 =?us-ascii?Q?eakDUH0JeU9XA6b6tYdAwleQNdyuSrTD0EkTcEyxgxUhjTs78Op6UJAoBH82?=
 =?us-ascii?Q?8eSkLMoCTFyMRrF0Ofy62DGtWQRhFeVT9QNXFe16eKHbw5anNE1XvVnEs+fo?=
 =?us-ascii?Q?xBPyG1IlFsSHg409ncyJPYr+MH/LeWbuZjVCIwfX9mZAOxzY7SdwrW0cUlbK?=
 =?us-ascii?Q?8iRbPyRd4D5ImTD5zYTDbqOUGVdQpWc/5G5an/06fmDGoAbuTGn6+7GZpXRt?=
 =?us-ascii?Q?NTTITG7vPNLGmm0s7bW6zu9O/uVd+8MWGAm7kxkjnKD6n23OAKfyds61dORP?=
 =?us-ascii?Q?xNnpRoGREQUOJeE99jJPY+NPsYdIroAJ5hO3tnn/e7yyPIz8mYUsLClbYtYY?=
 =?us-ascii?Q?G23uFfpf5Frcoi+i5K0XCwfiZm1zxruq8cPeciyDxt0I0yxP3OFaZsP8BX9U?=
 =?us-ascii?Q?v1WnLuFreYBDbOK8BwLL8w0epNOn5G7RmCCrP/YrTWGUImzTiS8WK0PqqqpM?=
 =?us-ascii?Q?AxGawIsq+yCtGBX1enS2RipCoepTGndBK1tZB4WsosZRy+8E3g44VfzGBK3/?=
 =?us-ascii?Q?YBiemY4s5k1bT6hsUufpgOfcnH6tWAl19KTUQ7BvhW7O+Z24XoFQ/mgH2dF8?=
 =?us-ascii?Q?yULDUy3R3+7lXjcqJaM4anUNIva37orNtD/N+kP4IT1GFqLoY0/XYQIYDvnX?=
 =?us-ascii?Q?9hzzdZnGQ8ox4kICRkr2tmVlHst2yIVCUNibYYjtq2S/OiD3FHuM4gSPgrNL?=
 =?us-ascii?Q?VsaOC8WVpl2hoeid0ALk9V514JzseiWaq5Vup7q1S3kR2mWMooHHWQXoCKIf?=
 =?us-ascii?Q?qoxAhNt4UMQK6bhjMAiijVHmySD8lAwM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR03MB8368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mOxaQt4cXfjlwFtIb3xGhD7ZBNvuhm59xnM7nJcWMRyzsP42PpUsRwaxRQCC?=
 =?us-ascii?Q?FV9daYJkvk5zADoR0h7cwxiZhLN0D9+KwjajuOD+uRZiyx9OK3nblt3dgjym?=
 =?us-ascii?Q?sfpLixsE6mZSRMaKocCFf9jhvKlkFOAVwBv+dYs2aJY0fHew3yQ3FKmAfQiT?=
 =?us-ascii?Q?EXAnDXS9mldJ3GCCwyt4ItA2fUawRdjopZeY6hoPRpSN6lbZsUg56XjD154Z?=
 =?us-ascii?Q?4tQX68o62oU8D1k93wbBGjnntpQJC+75mf8WZMvJXo2MX+NnX+pl+FIjbM/C?=
 =?us-ascii?Q?PuoAlCUzuR3Xiu2yKyRPX2khuc6pfkbZNQErw7raJRpGdgTGM4FVicDlNvdN?=
 =?us-ascii?Q?KTCaI1fGZNYXj1xK4WgpMNl4x0/iOza7+jT/er6Rz1zFQzVMcSsIV0nsnOoD?=
 =?us-ascii?Q?xMKFmEZvpUpzmo5ECot3ZwkWepOtzbT1KiEireevwlmokwIXlVkq3coin1Dc?=
 =?us-ascii?Q?kAPdp+y8wFofjWVb1/XopGLZ/uSvzQY51IyDyFS3RJ3Dv4+Jw74Vfg7vRkji?=
 =?us-ascii?Q?PvGUbX+eDBLm/dGFsP8pESxx3dZG7wHgAUdP9UmYyO++tRuyCRJkVlssdKHA?=
 =?us-ascii?Q?2Yt0cNuWnmm6hxUzaMubdj0YWEwzyGsqH1IBifl8+TJj1UzkeuEzxK677+6H?=
 =?us-ascii?Q?g6MHF7j+ykms5cSlWVLlGd0045q99yk63AQ7Bi9CzxSWqMTSdHeSIwPbUd9u?=
 =?us-ascii?Q?zQ0Vfj3tlPDs43iJ588Q8K7z5s6DYgqpamUZevUzBw+TjApUHyhN6OScHdGH?=
 =?us-ascii?Q?+Sme1yFH9jy9rDf7l6ZPvgRTHN2PYUo5o/Ga1ulWD0fPLTklqZhT2WaSi1/D?=
 =?us-ascii?Q?rm9jJjL+6iuun1Qk2+2LESfsqHUGheKyCM+v+lL1q4KRP0z7p8Q/3EhlpNph?=
 =?us-ascii?Q?eZ3QVV6SpzeTvL2okj9DFKQLguUxfYjbMzbWZuO3JyBvNCOaTBOpiiuD/pS5?=
 =?us-ascii?Q?ru5SwBF36YWrWsVzAHzEdOEpgyhtHT4Q7JbfR1mTPblmtD4nrCxzdovRWIui?=
 =?us-ascii?Q?qwh0kCDWI+Qa/g1HE35J7r47cY8ZsDET4A5nDUkt5EiMaqSeaSoDAvcZKqJU?=
 =?us-ascii?Q?Wof5w3pDR+8N/0h7DDEklgyNFOF5KuPJSO78DvdtgXAyb4CB7YVxe1QTCWQH?=
 =?us-ascii?Q?Tep4j5PcbyJxSx1m6gFklogV2gWjTH8fEy1kxEoSOwhVVGvOez2MyLu+mgpP?=
 =?us-ascii?Q?ps5vCjE9G/rlKGIrA+LGjhRWf4B39flYACVuyK7wwMwJdWQgMWokU74VpgBv?=
 =?us-ascii?Q?aLvbPfBwStAcUYKFB7WuljHHicc5luMuFBJueaxw7K3NHjpqWnuKDuvC9BvS?=
 =?us-ascii?Q?fyuKAb+lgiPCRf6zk7YusLJKZSFBucR5B82xJ5zQptce0CxRDMpyN4V3eF3+?=
 =?us-ascii?Q?JRAskCyCluA6QgnfvGrmzi66gcA0n23i8CtN7FrwWmWqdchTohUOOQmw2TKp?=
 =?us-ascii?Q?ugBCe72Icfh4/v/PvrahuMVLtF+XiKKKfY19eR38fHwlUEY7V/8mtyt6DJ6b?=
 =?us-ascii?Q?UK1c68UzF2khBAhBMd/w8T+RniEx5C6hl524nUDHIvL93RdBlyl1CVNffMRi?=
 =?us-ascii?Q?I9CWELeFC/af5HTo38dvoy1FnV8Pen999P1Bc9MwvWLWwqR0bwQECoGyxgyL?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55191a88-700d-4520-42c3-08de3418b83e
X-MS-Exchange-CrossTenant-AuthSource: LV9PR03MB8368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:09:50.9476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 781Q4ULz0kV4QWKgxpKuOX0qFFL5j5mddXJkqVV8t7xBkJ88Mldj6rSaaZen0hr94j8KYOIIyFt8ScbbxKml0pfLDNd0jUpC08ofOmMtGs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7403

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Older binutils versions do not handle correctly PE files.
It looks like they could work if they don't produce debug information
but they mess the PE file in other way like putting invalid
flags in sections.
Also different tools will complain about the format (like
objdump and strip).

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/arch.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 16368a498b..10eb8e4292 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -88,13 +88,6 @@ EFI_LDFLAGS := $(patsubst -m%,-mi386pep,$(LDFLAGS)) --subsystem=10 --enable-long
 LD_PE_check_cmd = $(call ld-option,$(EFI_LDFLAGS) --image-base=0x100000000 -o $(efi-check).efi $(efi-check).o)
 XEN_BUILD_PE := $(LD_PE_check_cmd)
 
-# If the above failed, it may be merely because of the linker not dealing well
-# with debug info. Try again with stripping it.
-ifeq ($(CONFIG_DEBUG_INFO)-$(XEN_BUILD_PE),y-n)
-EFI_LDFLAGS += --strip-debug
-XEN_BUILD_PE := $(LD_PE_check_cmd)
-endif
-
 ifeq ($(XEN_BUILD_PE),y)
 
 # Check if the linker produces fixups in PE by default
-- 
2.43.0


