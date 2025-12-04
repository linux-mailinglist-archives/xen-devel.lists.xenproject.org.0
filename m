Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C6CA3353
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 11:24:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177509.1501775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6VJ-0003jQ-Nt; Thu, 04 Dec 2025 10:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177509.1501775; Thu, 04 Dec 2025 10:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR6VJ-0003ha-Jc; Thu, 04 Dec 2025 10:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1177509;
 Thu, 04 Dec 2025 10:24:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VGT=6K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vR6VH-0003hU-8D
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 10:24:03 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 594eea3b-d0fb-11f0-980a-7dc792cee155;
 Thu, 04 Dec 2025 11:24:00 +0100 (CET)
Received: from DU2PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:10:28d::21)
 by FRZPR08MB11072.eurprd08.prod.outlook.com (2603:10a6:d10:13a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 10:23:51 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::73) by DU2PR04CA0196.outlook.office365.com
 (2603:10a6:10:28d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Thu,
 4 Dec 2025 10:23:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 10:23:49 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU0PR08MB8446.eurprd08.prod.outlook.com (2603:10a6:10:406::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 10:22:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 10:22:46 +0000
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
X-Inumbo-ID: 594eea3b-d0fb-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QLuL56jmqP+qqNV8/MfXGmnVNQ1RocjlPf9QpY4ifFsWEZsLCrYHW9vRGjYTVLT9oPvxxMfr/HqL0Ny2xECpErHmSRk1azHnOGZICu3NF+mdK3culxOUg+SBmwvd8twrFg5h9ytab/o0K0VTpw5Q4k1Jdr52couI8AC6Dt93Zt3AGxzRc9PffIxvmH4XtVufwVCFm6gUje1iorMbtHUg1FJ46LMKSnHg0BTE4D4a1P+4CPw9e6tnRrm78FudCYyhs10Rm5uWEqd4kYMeuQQ2SuwSTyzEklSrjqcrpeOyMiH0p497M0bKwSBa5fOVR+rXVKv7NFvv702mXS56oUsG9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsLVfJ9WxCpjPL4WNSGZUsCkleU7OHa9w+Igy9urFs0=;
 b=DWR/M8wqjvmxLEhqbSVETK1bebyH8DpoV4tt2gwSSFeiTUGpmvT+/y5n8soyTLXbA6PVIk3UV564cpodjfiy2MQ8AEzCeMUsmZDyiZmXE6iC2hrX96lm06Tn/xpQkQPUsGwCd7nvyCh33MYQSWzb5Q2xxWmJg2VI5A8brAfT0vAbw5EQeBD3nQxS+LoRbqCagvASXvHD7WXbFWSAUnmJ5Nd9zU9l3GYG1ZKhe71s3/qDcFWJG+NpMyz0cNFc5tleB1mA9n1QQp+JvX54H4pipDvUTI7vpTX9J3BiFEHZHje4Rlf4IvwA236xR+huBXX0nitvYlkJsfHRU5PveUjQ5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsLVfJ9WxCpjPL4WNSGZUsCkleU7OHa9w+Igy9urFs0=;
 b=n8PGWRaRa1SWa+WiVEd8xCdgQXcEb5UJuU2K8yJq3zZUlZMr4+e9yg+GtGdBcvNILSmXQTFjPN4OMI5nqgLvajtLTOSjXnC4BSGDcbPzGmbN5AYw8Ne2+D2J0D/yjSSJhJA48dJyaaIbB9JfwTP+4BVhnvBcb3+8osoKOXBc5Sg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hj4Jt7DhZGnP2Z7Gii+R/GFpBvur8XBPSr8nUKuHKF56lU3B0AQZvl0NZIFeAzcMmFbL7divbE30NX4Lr8fMy3Lz/+gEtivkD4yqL+UYoYXa8yP0dEEk1Yhtm/sF1tQEYElToOh81kfTIHsjWft0oi9iWIU9YCat8n/wpZbAvPpJ4x82uj7RMo30zPmoHiYz9nffTpWvtxilZMsUfAcwPQptQVvm17RYwBVggtIcymHV+ar9FGZwAz8aOYlG/r6dZR8S/HMRb3v/6+BkQHdmfhvJ/q+0iqHCG3y1BpSHpaAZkznY+9FKLk/Sj7fyTo4kgq0JpCFaujAePlM3Ha9ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsLVfJ9WxCpjPL4WNSGZUsCkleU7OHa9w+Igy9urFs0=;
 b=pG9Mz8B6YHSLa+8K8pnt6crjFK+ewjY8ky1hS4KgQISHMMgHyZWxXmBT+Cp9QmfCjfl6BPpOzKMeg1UoNLki0wt+rInMkxbbwHVxWKa1tZ8sYvN34FVNAjd2ePdO3ct7uz5JJt7i6XmSPoLs0Xf0caO7qdZAR3DtYXMKGud/AijiG2yCnQwAT3KRNH/5qXoCMtgG5EeYwZ4gylAbvr/XLzAc4pI32Q+HIMmucNtuR39ymPcrPfOP2FytmcMNs0+pz4DUDc4cuwDj9KjkeP/od5LLmAOi9mt2HyPNrjW9fA+n6QDaJFf/1xdFipLVcf8vLOVZb3RsJC4vlJPWU81vuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsLVfJ9WxCpjPL4WNSGZUsCkleU7OHa9w+Igy9urFs0=;
 b=n8PGWRaRa1SWa+WiVEd8xCdgQXcEb5UJuU2K8yJq3zZUlZMr4+e9yg+GtGdBcvNILSmXQTFjPN4OMI5nqgLvajtLTOSjXnC4BSGDcbPzGmbN5AYw8Ne2+D2J0D/yjSSJhJA48dJyaaIbB9JfwTP+4BVhnvBcb3+8osoKOXBc5Sg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Hans van Kranenburg
	<hans@knorrie.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Michal
 Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>, Maximilian
 Engelhardt <maxi@daemonizer.de>
Subject: Re: [PATCH v2] ARM: Drop ThumbEE support
Thread-Topic: [PATCH v2] ARM: Drop ThumbEE support
Thread-Index: AQHcZQG1izPOHi/67kCiRUDJelIfObURRcsA
Date: Thu, 4 Dec 2025 10:22:45 +0000
Message-ID: <4C8CF7CE-BF53-4D0D-AD35-3C62674401C3@arm.com>
References: <20251204093802.1717792-1-andrew.cooper3@citrix.com>
In-Reply-To: <20251204093802.1717792-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU0PR08MB8446:EE_|DB1PEPF000509F2:EE_|FRZPR08MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: a19b7c05-0766-402a-7160-08de331f3709
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|10070799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?5cH8dmlSQ1CI13h3PKgfKeFOgr+2F6nSGQ/T6kBrd1ylWyp8MEGJaFYXtMjd?=
 =?us-ascii?Q?+nAGrtozM+ZjhYi88fuwgAXuBDJKUZs8StF27rlN47z4xpbtg8pl3NBHTqyk?=
 =?us-ascii?Q?8iGaUxf792L5yzCNxL12+b/5WfMOsZOQl2nauJoY1GsPEiK7kRgSD3v9P4vE?=
 =?us-ascii?Q?ZcX3HNmsXXS5h3tUqP574TTvQU9SfKxttOSQn6lLmfsHjH6I/CeLn8QLBz4S?=
 =?us-ascii?Q?fsPpzQbQr1qUZK8pCVAM08h6HmYZwfCsjc91RbI0UC/9x3Yv8Nii3xQA9VIl?=
 =?us-ascii?Q?49Afvqv7cQDX2W/u9IHym45omAykwmKX/fphvws+HE7FAMILMJjNxtlIedFP?=
 =?us-ascii?Q?n3j7uFlu0k9fTh3JsYERYau0Cspku+T7Jy3ejyLDTh/AS7FGkUeBo65ug2e5?=
 =?us-ascii?Q?XExKJ6FEd+YYX6OSMjpRBz0jWdxS9iVjalMIiRxn3fBBC3W1eWhiXtlQmQWe?=
 =?us-ascii?Q?hww5jegAQf/1TueX6J9gA1mmvlcrtwMBhYx41opRZjJGvbRQr6Is7TWrUWL3?=
 =?us-ascii?Q?gdEqzeVo1TJiKeVL0Zc3N+LlPwBSeN3gW9Lyu/z5wUTxi4WBe156h6+hJ4vO?=
 =?us-ascii?Q?iYrDkuCRcWNm9sRlgbK+uqyOYuA9FRTWKiFspvtROSnggGd8w6RLuH4hvcMn?=
 =?us-ascii?Q?HkjxCexd0QfYd/ClTfZQ2wBZHf55XWfK5o825VSbLGJUmATjCnvvMPbh/Xpu?=
 =?us-ascii?Q?9b0WsrpPBaYqFzvTnj/KHFs+MU8Mvr4AnQNYb3/bADPKNHCtS19HuO7gLtF9?=
 =?us-ascii?Q?Sw3IBd8zqeKH3/yip5TYRB1IPnUvPTWp/JvpvYCWZ7J2Mu1jfroDf5GX3dTe?=
 =?us-ascii?Q?3f0FQmIrJKNafIxL5NeRur+DDbHxHzMIXHjLDUJt7Zk59BNrTBo2fD4cEPct?=
 =?us-ascii?Q?/umnn8YBWKExFCVG8+1241lCGy0eGLTSEb5UHsg26PWPMInVuL6gueegGlC9?=
 =?us-ascii?Q?ggzE7LXJBSuDGCgoJwvWS969MXv3fgW9xyBMXhJMGp0P9qTCeoEDBC2GirP8?=
 =?us-ascii?Q?Vuhg0w2rjNUZ4nichZfhPLmDFcQcCInGpAem5BZICA7J4Q4Ats1dikxOoQ2Z?=
 =?us-ascii?Q?w296ATi1VjlyFAcsd334O1IqlP8x+IeQCR4JVc0/WGyHVjJ0jAn3VnDX8e53?=
 =?us-ascii?Q?GE7ADtQhU/YVTZtMbDa9WgnUSySMpx08WBweYZeAzCgZVP4kC6QHALsu2Uln?=
 =?us-ascii?Q?aYRE27BFaYhPvj4EWID7h8dZxQwgW1Vsda+cmbTNg38AbHidlSenWQZC7Y7g?=
 =?us-ascii?Q?4fsI5RzwJ8KSBz5dDHD4emsDqVxOqon5bJLolk7jg2KYbcaS6UjAnkIZe2ey?=
 =?us-ascii?Q?fXyhPhycfc9CJq6h8aZb8sZJyj1PGiFz9ZTMBydODP01v8ztdGt2tnZ6aJoI?=
 =?us-ascii?Q?Lh909auSun8D3wpIyVrsY/p126Gn2Jbv2ngGyBIKe7W86d6QaC1U4yZ4rm56?=
 =?us-ascii?Q?o7Fbl2CKTrk0Q/Xe0UZDMDjtKkhiQBoAtvOLHlmB2TKwRnEvaSW5hIxZ78p0?=
 =?us-ascii?Q?6KQEI1CajwX0uZ2X3C8QIF18i7WWYUKRMNCb?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B269929AD7725242A021D009420E8E81@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8446
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b63775a2-bcc8-42d9-3c34-08de331f1148
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|376014|1800799024|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dDuLWBoEsuwRH8JFGgcUympIChF5RYGf7ot2qngTLQpS3xu2LLH/OvpyLphU?=
 =?us-ascii?Q?Zfr7v/XIMzPLHH3JL7sxUV4aCgVXzQXjQjE1nTA2n82+72afIrVC4Odyo6Jh?=
 =?us-ascii?Q?wuuNzz5M195IOdLAwBhv5YhOsoBR70m7Kg8v1tbZFP1N8jVIPMIPnpcuCsXJ?=
 =?us-ascii?Q?nSxBpmoEnPqoTuVpZm60asF3pEuk5MqJJrufPv/hSJAUUxdzU70AkrzDxN1L?=
 =?us-ascii?Q?UY+JbO24uH1lM4fV3iPOCKQTF/bZS65Xqq1F5RgATXXp5JV0pFR14YtB2tP1?=
 =?us-ascii?Q?30iXinajY1YfPKgN6Ll/U1Qzh0A4P0XY1TojXo3MB5sYwrsLIBYJYa3P9PKt?=
 =?us-ascii?Q?fRSzPnW/vgtrVbF5U3Yt18jhL49xxtJumSubzCoylYmfVGE59kzNoewg2laj?=
 =?us-ascii?Q?Kd4H0x/xHudGoAtIU8EZIcPCDUSH03tm4wGacEKoOJvE0hk6xyH4X/xGZDr+?=
 =?us-ascii?Q?tOl38DPCqESg7n/AUnSGGkfaAoBCnCfgYK1G17gdmYf89BNrJyMHkGyCtdtd?=
 =?us-ascii?Q?8uWNTC9Ln69BORbGQak9D4F562Q/IyCNrgYHqtCNlZoqy0Qvj+T+cw8M5IqR?=
 =?us-ascii?Q?fpYYdMx9lPGA657TiKGh1/JWI1fdttrQG2kCkle5VkTtIfhEaXmjsMvcuQMo?=
 =?us-ascii?Q?SBjrlfEdXfzeBIurPd2y3QpRBA9/J5pbsvQNrO2W66dlhx/MRsM52RfmTY2v?=
 =?us-ascii?Q?kpgN9K53rMXwStackBPhfxqQzdiPXYzNMhkK32H0yCQJVMvKxZohpeOcKoc3?=
 =?us-ascii?Q?GiDZgCWwbstGRbqF1fTiSG72bf24oh+VVd96TBR3wdWUKzFOPmDeQ7hqekiM?=
 =?us-ascii?Q?2PeUtO+ED5+5wCuVvL1EZrfeQtcTV20uTPC7LMz7eFAjKa1Erz/oPxfe6tRd?=
 =?us-ascii?Q?evxU+XhgngwhA1SnZD2hwhnS9/8WVyePtFk+H6fpulf0J5dvp0nmtbCv8CXk?=
 =?us-ascii?Q?8Ju4ZRkbateGQg/EjuHZ4q5oPdDNwPm2AdZTQ3PM/4ghmjhMBQBCCqqvOZdb?=
 =?us-ascii?Q?9r966UXyt9QIwhaJpzWSt0wD6rabfTAjAawpsonFmcVZ3H7EARuNbsr77+8J?=
 =?us-ascii?Q?bXxKx25ATqH2K7IJNoYTSvXOIpgBMu0pDu+ngThJG65Fn6d0lXI1et97R6Kl?=
 =?us-ascii?Q?2L3mDp/9tiCMCgE1+EP7uTvCmoGEAe6zJls1dzWOi08F4zqTA6Z+me5myRlF?=
 =?us-ascii?Q?vKWpClX9W//pndgik4vDASCjWuisbGN7spzdcBaF0OXWv5aEYZHU2d4BWZVv?=
 =?us-ascii?Q?PmsQerVtgi/mrBi7wz9rl0moezOGEvmqRYSxjLkt5opE3+S3gLrFTbtpBF4a?=
 =?us-ascii?Q?8Ii+alA0X4yKAIPGJbNZTt41JV8TMw8H7D2ghJ93vgSwT+sBvaty0xVMwJO6?=
 =?us-ascii?Q?DX5sStHDkUK//akhkTZ/4oLUPQRQQCQG52hFu5napiRVqg7DZzdOM/XOtFmf?=
 =?us-ascii?Q?nAdN7FC0Unkua+s6UFD2vF97kbu/srQpwvAIEop8A+wGqkGTIHlKkdiInfyR?=
 =?us-ascii?Q?/3zyPIW0J+XTV8ozPhkjg5IWorfntioOeq8dwynRXlPDuyVXTtAm/Zq8V7zf?=
 =?us-ascii?Q?KOAc40ABbmuP+sQnWQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 10:23:49.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a19b7c05-0766-402a-7160-08de331f3709
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11072

Hi Andrew,


> On 4 Dec 2025, at 10:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> It was reported that Xen no longer builds on Debian unstable/sid.
>=20
>  Assembler messages:
>  {standard input}:474: Error: unknown or missing system register name at =
operand 1 -- `msr TEECR32_EL1,x0'
>  {standard input}:480: Error: unknown or missing system register name at =
operand 1 -- `msr TEEHBR32_EL1,x0'
>  {standard input}:488: Error: unknown or missing system register name at =
operand 2 -- `mrs x0,TEECR32_EL1'
>  {standard input}:494: Error: unknown or missing system register name at =
operand 2 -- `mrs x0,TEEHBR32_EL1'
>  make[5]: *** [Rules.mk:249: arch/arm/domain.o] Error 1
>=20
> This turns out to be an intentional change in binutils.  ThumbEE was drop=
ped
> ahead of ARM v8 (i.e. AArch64).
>=20
> Xen supports ARM v7+virt extensions so in principle we could #ifdef
> CONFIG_ARM_32 to keep it working.  However, there was apparently no use o=
f
> ThumbEE outside of demo code, so simply drop it.
>=20
> On ThumbEE capable hardware, unconditionally trap ThumbEE instructions, a=
nd
> drop the context switching logic for TEE{CR,HBR}32.
>=20
> Reported-by: Hans van Kranenburg <hans@knorrie.org>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Looks good to me:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


