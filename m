Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C36B2D26A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Aug 2025 05:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087142.1445283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoZFe-000711-R5; Wed, 20 Aug 2025 03:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087142.1445283; Wed, 20 Aug 2025 03:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoZFe-0006zA-Mq; Wed, 20 Aug 2025 03:12:38 +0000
Received: by outflank-mailman (input) for mailman id 1087142;
 Wed, 20 Aug 2025 03:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7POT=3A=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uoZFd-0006z4-2H
 for xen-devel@lists.xenproject.org; Wed, 20 Aug 2025 03:12:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2406::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83da0bb2-7d73-11f0-b898-0df219b8e170;
 Wed, 20 Aug 2025 05:12:34 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 03:12:31 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9031.024; Wed, 20 Aug 2025
 03:12:30 +0000
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
X-Inumbo-ID: 83da0bb2-7d73-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4cNxhOZdd4xOGf1Ldy3DeVCZwjHv4iUzn0BYrj8G/CqQ0v6BYTj/hgZWIqRL4KiAelsdW4NMmY/5X1SbwOzC+Cg2m+QjUeIcTXgzV/lrXF/wb10N7CBY8/NVfyERXLTxTdD1gpcm1QWh0wIn8ZM3OhxKdRhetktaZ2pflwAF/P/z2MQzgPpDxKDmqIzUC7h4lc2ViPndtNx6UIHlAYWvAHG7rqLn7I6eDwvhPrxcjXLbMJ9VTgkPd9UGG+Clcs9cX5dwpCYi/i6I0z0whUwySU8qFNdW31Viy4dqi+jAUBvaOROHl+S5OCUUCKGx2zt9b1N718bJZeCpXB5UfhBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iqLUk5MSQDxs/47TA4ZgPyEY2wMaqtduBIj7qxlecI=;
 b=Pp8xTQJY9MCGeigHyfcslsAgnO1qaEWjHwShS/85ERluYfUO8Zxf+0XEJ4uH6aaUw/hhUkykw++E6aJx08Z12xHhgzOjY0AVwJ6MOco29iRt8mJBOI9ahXEzn8DL6fW0JZlo94Bz6YCd+f9jiYdp1pLEpDm4J2ZbaIj+3KrO1X8vqO+1dLVVYrELvC71vIPfuEaxkMlJilE56CAYHap2+h7Z3ZHxqJO+2oWj6Rlx0Cb2QEw1Lx2pPTvFllKML3E1LhR7A7m1VwHN7UUbqohBZSRGVnE5Mp1RulP+wVxfIYmMGuc7KyJpnKXebdagkIjINbYbU+yuBbtxQvrfSxR0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iqLUk5MSQDxs/47TA4ZgPyEY2wMaqtduBIj7qxlecI=;
 b=4WI1/NAWa9r7z0y2+cxhUQZLL3YvYHHyuQSE03w/9pI2A2nL3c/xp3UiYEAmuYRk70W9zTpeSFrQzmk3U6kqBZIZdZ8ulsbNaH4qn0gB+AxR+qmvr1orLrxvy9x1XTVcLe1H5h8y+Rc+PNMGkIMTKPiIj8ee7V/q0bu0Vahqvvo=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Topic: [PATCH] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
Thread-Index: AQHcDc9CvptjGFID1k2o17sSnGSDybRoGVoAgALK9QA=
Date: Wed, 20 Aug 2025 03:12:30 +0000
Message-ID:
 <DM4PR12MB84519FE74D66604440827EA9E133A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250815102728.1340505-1-Penny.Zheng@amd.com>
 <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
In-Reply-To: <fb6f559a-b2aa-4b25-a6d3-401ecc4b4bd5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-20T03:12:24.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB8880:EE_
x-ms-office365-filtering-correlation-id: 0e947f95-1d58-4fe9-d237-08dddf97666e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFVDZzFhbFhlN0k3ZWVvTEFnUk5WeHJRLzhTZGpMVHJwdjdHbGZTYmNzNlRa?=
 =?utf-8?B?OTlFNEk0WXRma3gveEFwNmN2U1pLWWtIeHJmbDdhUkt2VW9WcUtERmpGNkti?=
 =?utf-8?B?VGJQRnBLMjg4ckZnTFFIalg0M2t2RXJFR2RwTDJ1WW9nTWp1bHdreHNxcmlU?=
 =?utf-8?B?b3E5c3czZ2xHTWYxZ0gxNk1Md3dKeEU1ZEhwT3ZPLzhWK000WU1tY1RXeG9a?=
 =?utf-8?B?Wkk0dWt6QlpuQ2FETVAyNzUvb2Uva2NIRjVZczd2aTNIa1V1WEY0RTl5ZVVI?=
 =?utf-8?B?RFhKODdmRG81Mm5jYm42VjNnOWVNaTJyNTNoLzVCNk9DRGFvUEY5djA3U05J?=
 =?utf-8?B?a3ZhZEh6cVptZnJEUHdEYU5oTEJDdDc5TmtDNzFKaXVUZjhQUjdzYXN6b21E?=
 =?utf-8?B?Wnd0K1F3L202VFJYWHFiMXBVeU9MOGt4RGVwOTEzeU5MUGpMeDEwNzlsL3hH?=
 =?utf-8?B?OS95TUpCYm42a2UzRWYrWXVvUkFPZHV4QXVYSnFkSnVBZ3pkQ3NlSGtNVTc3?=
 =?utf-8?B?bWZsZWJOZWpheEdva2ExSnJGc09IbjNjRm5oeWFqbnhYM0R2WGZaa21XYW5h?=
 =?utf-8?B?ZVc2WW9UcFRPRXV5a1A4cmR0UWpKbWdKR1Y4bjQ0dTlZWmZDT2Fzb0xJbE40?=
 =?utf-8?B?WGRqRmpzN2ZJRk1kcUFrQmdGUlFNemhHYXhuaWdDUWFlMlZQVG1UV0Y0M1hY?=
 =?utf-8?B?SU9MellkeHAvbzBzNzVZU2lzQUlZWmdVMDQ1aWNsbXJWU1ZlSllscU4xRFBX?=
 =?utf-8?B?Rlo4UEI4RC96eEp4UVJwdW11blMzdVA1ejN2Qmd0WjRuMFliNkF6ZTljdE5p?=
 =?utf-8?B?MXAxeWJrcHlpNi9teEFSTjNxQ1N5bjNBM2NXbFBvSGRsQWp1OVZCcXpyb00z?=
 =?utf-8?B?WnJ4NDUvb0xtUE12S3ZSUnZlM3lHZElkeWlGZ21SSkszSk02eDE2OExZVmQ5?=
 =?utf-8?B?VzlkZndCdTBwcDhEVUVaWjJJVk9RM1NDVzBRbFN1Tkh0eWpaWnpXa2N3T1c4?=
 =?utf-8?B?STFmZzlmMkkyZUVMV01FYXRmNFhlM0xMREJJQjVXUmtRdHdheXFyQjhHeTY3?=
 =?utf-8?B?dnB0SjVNa1Z3N000QWIyNVhBRFVua1ZsZksxQmRIU2ZtT0l2ZU5CVXphN0g4?=
 =?utf-8?B?STdpVStteUVLQzhRdGpFOGh1SG1tbzVjQTVXKzN4T3NGeTBDOGJmQUFJbk5N?=
 =?utf-8?B?NEZoN3pzQTdYVnhpZGhqVEJNT3VKLzRTYWdseExKUlVpaTFQdHlreTRBTVVR?=
 =?utf-8?B?Mjcvc3M5ZmZrcTZkemNtVkxnbDhTaTloaHhSZVFGSEx4dXBYc082VEc3UWxL?=
 =?utf-8?B?bnVRVEtVbndycFN3Z0dLNHJIK3ZhUkR3K3hSS3VQakhTeVNWaDNvMVNTdjJL?=
 =?utf-8?B?L0VuK28vUUVMOFpadlBsWE9QUDJWWm9qM0JLaUdyRy9RbXhiZFM0UDlPaFRN?=
 =?utf-8?B?SXA5K3hSZ1RMVzlzM080SXMxdy9tOGJnVWh2UUxNYWNWWml0YllLOVp5R2pw?=
 =?utf-8?B?bUZVODZDRmxsblpvYit0QnJsK3FKSStNZ0lvUjVMQ1dvK2tuc29RYkp0eHpJ?=
 =?utf-8?B?Z2JTMUN2RVduVjhuT3g0blkzUWZCQ20yTCtSQ2tYZ0UzaXNrS0UzcXU3aVI4?=
 =?utf-8?B?K2c1QjBXOEtVSnlXTVdtTDgxaFgvQlQ2TER6Z05FeDFXNFBWNXNxYzM5ZzFJ?=
 =?utf-8?B?VFdoaC9NeHNlMDdVK0pyV2ZTR0psYmtWUnVXVTN2UW5ERkMvcDZDbzRaQVRG?=
 =?utf-8?B?MDlzN2NOeFdvMjd2eit4U1Zyamxld09zOThHNi9YTFJKZHZiandFWkprckxq?=
 =?utf-8?B?WkJnZlR3WWN0SzVldGhNY1VYNDROWjJnNSs2R2krWlRvOW5QRWprRnNaNHZH?=
 =?utf-8?B?NHh3cmtLU0xmZDFlU3lOdEpIWnpyMDdUSng3V2JwQThDYzgzK0JUNjFpWS9T?=
 =?utf-8?B?cFc5eDBXTUR0Zmc1ZmtvUHVMZzZDKzRmaGYzUW1uVUhUcko3TCtYak1LUUU5?=
 =?utf-8?Q?N75hANgBn9G+dgGfpHtyLMaDNVHLLM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFZrVVdtSWFsVmJaY2R4YU1Rbk42ZWZFaUpaN0hjbmVVUlFtbHhEOW9xS2JT?=
 =?utf-8?B?UjVwUVptc1JjejA3Wm9GdDIyVTNnamRJeklRMTZlM3FBUVAwb3NmWkd6N3Za?=
 =?utf-8?B?MCtqYithNFNPNE5IVkR4VHRkbVplNU0zTG1zY0pFTXplRjNsL2hYZk01bXZr?=
 =?utf-8?B?dVFMb0dOdlNaNFN5WnhhakZ0VHJYU0k2dWJ4M0w2bm1LSDZydXpuaXRoREV3?=
 =?utf-8?B?YktJSkd4YmRJNytNU1RtU3lyamdpczh1WGR6cEZmcDI0R0F1V3o4bElabFZz?=
 =?utf-8?B?ZGtQY1ZnZzZIbUJhQWJUOTJwMi9xTTRJdlFtZVV1TkFOMEJYZmptNG5Ybk5X?=
 =?utf-8?B?Z1NUYUl5dXpNeVBzM20zSWZ5b29XUHBWQytFOG8wemVJVUFIMDVweFdIcmFv?=
 =?utf-8?B?bkRNMTFsNEZISUpXMzVhWVM4bnNNa0RHdnJ0eHRtZ05NUW1RVnBSU1I5cE5D?=
 =?utf-8?B?M2lPa1FHbUd6YVplZlB5NytiaU8yRi9ETFZ1YUVLMXpOaDhadTRRYlI2Ly9r?=
 =?utf-8?B?UmhTNzdVSDZSQ2hibXQ2YS9scHJIUEVaR2hoa2JLZ1RFWUFRRndOTnJ6bzRD?=
 =?utf-8?B?TjF5N05vaEpTckQ4cEFnZTRhMUNSU3ErZ052ZnlPMXJzK2RYR3lSb2NEZGls?=
 =?utf-8?B?NFhMRXYvNDJoTDJma3RIdE50VlBVR0ZIaFNBanF4NFN4ZnFaVG9PK3hnYm42?=
 =?utf-8?B?OGtSV1NoaEVjbG9FWVFRQTRnVjhtMEw3NGlxSnJ6clpIZ1BnWENNYWRYZlo0?=
 =?utf-8?B?aW1LbUsyTWY5SmMyd2Ntd2EyMnQvbHRYNkg0d3FMRVdwdHU5TmJrd2lHZitK?=
 =?utf-8?B?MEFaSmZiSkNiMnhvd3NWVWhpalFnUjNCSlBEcHl4eERXUEpuWm5yRlZPTm0r?=
 =?utf-8?B?VWFVdDFqSWxOMHYvWHNoQms2NG9CKzdoSVQ0eEk3UEFESFJDL2ZGMHFpSUpC?=
 =?utf-8?B?NmlVNk8rTm0xYjRseitNOVZXYU9EM3ZnUFk4Sy8yOE4zSjZXRE5ibzQ1TW4w?=
 =?utf-8?B?dUdkbUJuSjdWYUJFMmM0UFIwNFB2WGxaSWxXQkJsY01CZnZPQkRYY2x5ZC91?=
 =?utf-8?B?eklmaWtGcll1Q1AreER1dUxUa01mMENFWVc1L1lTZzVFV1BhU3BjUWgrNGJK?=
 =?utf-8?B?UGdjMldxRThDQ3VmS2F3biszOVZ3Ti9PbkcxSkdNYXF5Zm1MeGlySlhPL1U0?=
 =?utf-8?B?MmIybTIwVUlmaXdVMmNrRkE1WWEwOWFJYlA5bk9IQWxnMlhSaHRNY0xBRVhK?=
 =?utf-8?B?SlRtUVlpblJOZFBWN1ZhTlpSVDJmOUJSUHpTNGp0My9ZS0t0UHpldnNMVjll?=
 =?utf-8?B?UTNCRW8wZGJKS05hZEhtYkVKaWFvWWdzLzB5aTVtT2FtVDh0dzUvOURnRUVM?=
 =?utf-8?B?L2JmekRIOUJaVk1uRm9pY0dTcUE5NU42eUNscUkyWmZDWDhhWUxrUjEzM3p6?=
 =?utf-8?B?QTVhRU5VVlRkaXVJWkdGR2xiSm8weDFGMk1XYm1admhkRUJ4RkhrYXVLek9Q?=
 =?utf-8?B?Z2h5VTVUYXNQS2F3dldwZ0tBMlRSblhaTk83ZXhZTWVLenU2L2hyR3JwYlBv?=
 =?utf-8?B?NWZvZ3hpdlB2d3BleUpwY0ZZaFk4V2h4S3hWZjA0RWtrSkw1VEpCbElUVDlB?=
 =?utf-8?B?SUltRlZ5QzJTbUhkZHQzRkd6cTFvRDdiODlFRUVFOHNpUlVpTnRSUEFkeXRj?=
 =?utf-8?B?QW9rend3VDNNU1lWcEl2U25XQ3Z1eWE2QWg1SStVd2N3VUx6QlhGNDZQajRB?=
 =?utf-8?B?L1dLQzJGSitVeGtxUnVFN2xlc3k0QXpIMnRlUmliOVBTc0lVMmRvZkw4c25z?=
 =?utf-8?B?N0Z6VDRzQ0sxbXZzRnNDODJIOG1RZnBHWG5ONUZJUEZjOWNWWHc3Zyt3ZjJh?=
 =?utf-8?B?bDE0THZnODlmWkROOVdHQ28wL3RVSllGc2ZjNkJOaTU5aUlUU0U0M1BnNFVh?=
 =?utf-8?B?M0NlKzdHU0FqelVoeUhvbmdLSHR5U1JwQWphUU1YSGxjazFMQ2pWaFF4RUIr?=
 =?utf-8?B?UWxReERNc3pTeUY5YUhWSmdPSjc3OUlHdUhGYkFQbkVZSzVNM2RGcHFDUW9H?=
 =?utf-8?B?WFdISUFEdXJzRThDdlI5Q3huTU0zWVlaL1NHTHZjYjcycFlWU0ZCL1czbmFR?=
 =?utf-8?Q?1+Mc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e947f95-1d58-4fe9-d237-08dddf97666e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 03:12:30.7459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2yxZUXx8HtJihsiMW0b9oLPSUS5Gz8nqrZVQ1ddVDb0/ywjLWX2jz8oDMCOkrkN/q86dQkcRtKQh4Us9HwnkWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDE4LCAyMDI1
IDQ6MzEgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT47IE9sZWtz
aWkgS3Vyb2Noa28NCj4gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPg0KPiBDYzogSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ow0K
PiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVsLCBNaWNo
YWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4veDg2
OiBtb3ZlIGRvbWN0bC5vIG91dCBvZiBQVl9TSElNX0VYQ0xVU0lWRQ0KPg0KPiBPbiAxNS4wOC4y
MDI1IDEyOjI3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBJbiBvcmRlciB0byBmaXggQ0kgZXJy
b3Igb2YgYSByYW5kY29uZmlnIHBpY2tpbmcgYm90aA0KPiA+IFBWX1NISU1fRVhDTFVTSVZFPXkg
YW5kIEhWTT15IHJlc3VsdHMgaW4gaHZtLmMgYmVpbmcgYnVpbHQsIGJ1dA0KPiA+IGRvbWN0bC5j
IG5vdCBiZWluZyBidWlsdCwgd2hpY2ggbGVhdmVzIGEgZmV3IGZ1bmN0aW9ucywgbGlrZQ0KPiA+
IGRvbWN0bF9sb2NrX2FjcXVpcmUvcmVsZWFzZSgpIHVuZGVmaW5lZCwgY2F1c2luZyBsaW5raW5n
IHRvIGZhaWwuDQo+ID4gVG8gZml4IHRoYXQsIHdlIGludGVuZCB0byBtb3ZlIGRvbWN0bC5vIG91
dCBvZiB0aGUgUFZfU0hJTV9FWENMVVNJVkUNCj4gPiBNYWtlZmlsZSAvaHlwZXJjYWxsLWRlZnMg
c2VjdGlvbiwgd2l0aCB0aGlzIGFkanVzdG1lbnQsIHdlIGFsc28gbmVlZA0KPiA+IHRvIHJlbGVh
c2UgcmVkdW5kYW50IHZudW1hX2Rlc3Ryb3koKSBzdHViIGRlZmluaXRpb24gZnJvbQ0KPiA+IFBW
X1NISU1fRVhDTFVTSVZFIGd1YXJkaWFuLCB0byBub3QgYnJlYWsgY29tcGlsYXRpb24gQWJvdmUg
Y2hhbmdlIHdpbGwNCj4gPiBsZWF2ZSBkZWFkIGNvZGUgaW4gdGhlIHNoaW0gYmluYXJ5IHRlbXBv
cmFyaWx5IGFuZCB3aWxsIGJlIGZpeGVkIHdpdGgNCj4gPiB0aGUgaW50cm9kdWN0aW9uIG9mIGRv
bWN0bC1vcCB3cmFwcGluZy4NCj4NCj4gV2VsbCwgInRlbXBvcmFyaWx5IiBpcyBub3cgZ2V0dGlu
ZyBpbnRlcmVzdGluZy4gV2hpbGUgdjEgb2YgIkludHJvZHVjZQ0KPiBDT05GSUdfRE9NQ1RMIiB3
YXMgc3VibWl0dGVkIGluIHRpbWUgdG8gc3RpbGwgYmUgZWxpZ2libGUgZm9yIHRha2luZyBpbnRv
IDQuMjEsDQo+IHRoYXQgLSBhcyBpbmRpY2F0ZWQgZWxzZXdoZXJlIC0gaXMgbW92aW5nIHVzIGZ1
cnRoZXIgaW4gYW4gdW53YW50ZWQgZGlyZWN0aW9uLiBIZW5jZQ0KPiBJJ20gbm90IHN1cmUgdGhp
cyBjYW4gZXZlbiBiZSBjb3VudGVkIGFzIGFuIGluLXRpbWUgc3VibWlzc2lvbi4gUGx1cyBpdCBs
b29rcyB0byBiZQ0KPiBwcmV0dHkgZXh0ZW5zaXZlIHJlLXdvcmsgaW4gc29tZSBhcmVhcy4NCj4g
SGVuY2UgSSdtIHNvbWV3aGF0IHdlYXJ5IGFzIHRvIDQuMjEgaGVyZS4gSU9XIHF1ZXN0aW9uLCBt
YWlubHkgdG8gT2xla3NpaSwgaXMNCj4gd2hldGhlciB0bw0KPiAxKSBzdHJpdmUgdG8gY29tcGxl
dGUgdGhhdCB3b3JrIGluIHRpbWUgKGFuZCBoZW5jZSB0YWtlIHRoZSBwYXRjaCBoZXJlKSwNCj4g
MikgdGFrZSB0aGUgcGF0Y2ggaGVyZSwgYWNjZXB0aW5nIHRoZSBzaXplIHJlZ3Jlc3Npb24gZm9y
IHRoZSBzaGltLCBvcg0KPiAzKSByZXZlcnQgd2hhdCBoYXMgY2F1c2VkIHRoZSByYW5kY29uZmln
IGlzc3VlcywgYW5kIHJldHJ5IHRoZSBlZmZvcnQgaW4NCj4gICAgNC4yMi4NCj4NCj4gPiBGaXhl
czogNTY4ZjgwNmNiYTRjICgieGVuL3g4NjogcmVtb3ZlICJkZXBlbmRzIG9uDQo+ID4gIVBWX1NI
SU1fRVhDTFVTSVZFIiIpDQo+ID4gUmVwb3J0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYW1k
LmNvbT4NCj4NCj4gTXkgZWFybGllciBxdWVzdGlvbiAod2hlbiB0aGUgcGF0Y2ggc3RpbGwgd2Fz
IHBhcnQgb2YgYSBzZXJpZXMpIHNhZGx5IGhhcyByZW1haW5lZA0KPiB1bmFuc3dlcmVkOiBZb3Un
dmUgcnVuIHRoaXMgdGhyb3VnaCBhIGZ1bGwgcm91bmQgb2YgdGVzdGluZyB0aGlzIHRpbWU/DQoN
ClNvcnJ5LCBtaXNzZWQgdGhhdCwgeWVzLCBpdCBoYXMgYmVlbiB0ZXN0ZWQgd2l0aCBib3RoIGRl
ZmF1bHQgZGVmY29uZmlnIGFuZCBhbGx5ZXNjb25maWcuDQoNCj4NCj4gSmFuDQo=

