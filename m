Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56AAD1A62
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 11:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010177.1388324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYck-0007jl-Bz; Mon, 09 Jun 2025 09:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010177.1388324; Mon, 09 Jun 2025 09:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOYck-0007hL-9J; Mon, 09 Jun 2025 09:16:58 +0000
Received: by outflank-mailman (input) for mailman id 1010177;
 Mon, 09 Jun 2025 09:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Vc3=YY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uOYcj-0007hF-FZ
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 09:16:57 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c60e150-4512-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 11:16:54 +0200 (CEST)
Received: from PA7P264CA0230.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:372::6)
 by AS2PR08MB10295.eurprd08.prod.outlook.com (2603:10a6:20b:647::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Mon, 9 Jun
 2025 09:16:49 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:102:372:cafe::27) by PA7P264CA0230.outlook.office365.com
 (2603:10a6:102:372::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 09:16:49 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 09:16:48 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DU0PR08MB7464.eurprd08.prod.outlook.com (2603:10a6:10:357::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.24; Mon, 9 Jun 2025 09:16:16 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:16:16 +0000
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
X-Inumbo-ID: 7c60e150-4512-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s1yszyKpz8vfsMN66RwDFL3ZuNz4SrKHtF6JmEOJ/tJsw6SgueJINKFvKwGAvgMMC/gRZ3vI+P+cRGHw6LKlMuxnHx4SFbB8YVTR3FWwreKQNvcueQCdIjw5/kQ52JngTaEje5eJSHUxFzxqFpXMlFraIH9RiiHCDP8IhjS94fUxCKW10bDTXVG/tpoqg8B0IHyGIdWlavTXvKZwD88yLrj18BmPOhqtjSfPrth75GVrb/LRVRykMKyf9nm9q0sXyEo0tKp4IuWvz6XhS6h1HQom2AJEALZe31flNF6sYQ50ffVKncgZ1u2U6ZgTLbAqCoDHPBj/KAHLluNSw2WXXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqtYAZbExr7a/SRh+FO9mHhJg2my/N5wz5txP3vo9S4=;
 b=MDl6nrwxkPR7CxB/Xhcjvi9DV6SrdkJ1VmkWJzl4JeEnweAg64nSDY+YOCTXTWyelGF84tJ7akPu/nV9EKUFNx3YXwiex8amFmZ4LIOJ9M3GYQd//cZh4AVYNj+XYOk/Ck5XWw0ibteu4AF6ZHVk3kF2OL1S1allVDQmyTz9Z4e3bX1TV+9CFndOEnlkM4T6c14neFAOhV0nm1SscxiUyoYfUSiL2sDrwuYnjNxDJecysRA/86xUVGC8vzc+KtDG6G3aWVHa5s14xd/KCd84mmPQK0wOGWr3qcnoE9P9yFgmDhdMmsjxTk3/sTTOzibd0WN4SRi+Sdy8gVGI018Tag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqtYAZbExr7a/SRh+FO9mHhJg2my/N5wz5txP3vo9S4=;
 b=MYJb1gJuXQl6a4p7JMNxff3AhmVQVEsFFUrbCpDEK3jQZjJC+GI7Rjzqf/tHzrs8uaKAvFpXP3uz/dpwKvoqWY/7R+R87dJy2coWh92CJz6ENskcf4FEY8STmQFRxwnjiJplSSWCOvs2k6xqMBbBjJ1Ruwl9fMnpcV4aCSKXtdY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRDtCMR2wOffvsZ08AKzjaKeHva/7HncbvbKGz0L0HQhuiprEkMxPg+crXsDgSsBatmryKNmWRBKzjUXnUETWGHMulBdjJan8LzQC8bz9T6+OUdTIBssWtvi6nPCUCGj5kDyydaS++gkIiTZlvN3Q9V35czbX+IryOgSfTkY9iqfBVpA/6vxhJJ/G7he67rtC4uzyZXl/WuMMiVchiSpR5UYMMGfT91/OuN7WwyhwyCkb6cR1grM+SfSbxLJ1LHwy1f7t3MkIemkztQ3Z3m+AsOSlqzgHr8PUhrjZ542FfMo1ZEibwygmE04+Gq3c3fPQidUKRZG93d4jcm4LqM4Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqtYAZbExr7a/SRh+FO9mHhJg2my/N5wz5txP3vo9S4=;
 b=OE1llSExb51uzC+FhYL9Z5U0+FMv3RvJxrqgFfuRm0IxuiRCICrahd21zfpnIdrD4qVV+LRb7AjL/D0E6csZDW0aa1aYUiWX7DJE7apSu3zt8GwWkhDs31t5a/LNIQ9Wbx/OeClXL3AUhM1AWlLhgAlss6SZ/P8dT4fVlZnln1x5cFgdxWIYKbpHjS9RugRQh7H2gc+7EeGl/dhBw0oqFQKHGm5epFSdYuPiBpQJLTvsTjy98fE2siIKah13tV63tTS6dKw/UviPwa0EPWgj1TGVFOxixLDdGRa8SybOGWdQ6DaQmjE0rw/jE7XGB0sSKNnAKi8pSzG+9o2nBP4sDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqtYAZbExr7a/SRh+FO9mHhJg2my/N5wz5txP3vo9S4=;
 b=MYJb1gJuXQl6a4p7JMNxff3AhmVQVEsFFUrbCpDEK3jQZjJC+GI7Rjzqf/tHzrs8uaKAvFpXP3uz/dpwKvoqWY/7R+R87dJy2coWh92CJz6ENskcf4FEY8STmQFRxwnjiJplSSWCOvs2k6xqMBbBjJ1Ruwl9fMnpcV4aCSKXtdY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from the
 C code
Thread-Topic: [PATCH v2 3/3] arm/mpu: Provide access to the MPU region from
 the C code
Thread-Index: AQHb1wMFgqp5jCI+gEaPA46nKsooErP6hW+AgAAKtIA=
Date: Mon, 9 Jun 2025 09:16:15 +0000
Message-ID: <D6ACF9B5-9336-47BA-8A96-75E5AB5E8148@arm.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-4-ayan.kumar.halder@amd.com>
 <CD168290-30D8-4EF1-8F89-95EE597E6C54@arm.com>
In-Reply-To: <CD168290-30D8-4EF1-8F89-95EE597E6C54@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DU0PR08MB7464:EE_|AM2PEPF0001C709:EE_|AS2PR08MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9d947d-0e10-40f7-3a6d-08dda7365d15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?U+HyPelVOUyegyiqr5D52hyTFvpTvDfl5vQGebRS5yiVZNNX5sfkH9zUrlYV?=
 =?us-ascii?Q?Al1U/ZUYw3pjHsiC8QJBCHfYerplKswEsC/R0iCMWuVdS/Mxmro+lHYPF8Mi?=
 =?us-ascii?Q?NuYeyowTTqeEkg2z62eSCExhVHcJoQ/vVAlz6y7+q0EtpK+bZcWYwWIbVVJ0?=
 =?us-ascii?Q?40+NftB7mxCSXhG1Zd5odlZ+52Yixkf9mrzu8MAQEA6U/S/8DNS/7+TohUDd?=
 =?us-ascii?Q?tSuKoGV955woCu+90LsxFp0QK9KlG3Q1fmFsfDSu20jCd+4iRFn2HYXSNZe0?=
 =?us-ascii?Q?dK5GqXiQyxG08BlML0nr617TtnzRdUL2hhPgzBS5ItroA11BAHvTotNQbm7/?=
 =?us-ascii?Q?dv1h5VUae1rrxuPaM9xtz8LZsxSEBqrSIRLaClz/Size6rbh3HO9JPhrC4KV?=
 =?us-ascii?Q?lEjwrjAcCiV6hQ8QyPs+ryNhip96KmtzKKwqhdPTExBy8PxrY62pVCCZuOUa?=
 =?us-ascii?Q?wl8iLDXqWfi4RCemIrlcWHOvOkfYkTCt890VBO93GSuUmCXYEEpcOhRLAOjW?=
 =?us-ascii?Q?FMuxpkOUHYba6WDFYNNPRBl3353gAuaAhVuap9bo15ylBqcqBO9fiAuQVs3s?=
 =?us-ascii?Q?zzwEK0/QflbXhwI2hW97Nma/9x62+ZqYe9m7678kq13yoDOh36tb6JLo6HCR?=
 =?us-ascii?Q?IoH8HREoZ7iUM/v+LH4BMbPvV2JbPE0ecLKVLo3h7rVBUug90mUtpRGTTgqw?=
 =?us-ascii?Q?4sq/4VLljX8S8LWXJ27X/Q8uJ3XL0CeeRk/q0Z1lbtnyRMg506nHMH0ocLQY?=
 =?us-ascii?Q?hy2YhYVpTyGhIwIgk05Hr6I048UFvPEFVYcAVgO1aCTNlCmmaq3KHz44zhi4?=
 =?us-ascii?Q?Gn9XuzUmfAjZpVO8onu6qIbGFRYAQVZl90Ip0pSpKiK50Rk2L2FQM5jvhCnB?=
 =?us-ascii?Q?ikrVgUAqseRh4nUHvkaVlTBEOBLVNiSGeNrqsT22xb0X7hB9WzBE2CUouR7B?=
 =?us-ascii?Q?XDfZWG4l1xkJMKXrov0L3mOgNF8wO5cp3GkWSvmvFCVjwEyWXT6ww6OEWZqs?=
 =?us-ascii?Q?JraHprit4/xFlMB9G0l7JTymIdtuExv+SWeaPrx+2Scsmgx7kj6JMH+T/uI8?=
 =?us-ascii?Q?Phumgsnr8MuyNYc/kgD8HOAVVMHMII1nc7Z8WMX/DzXWKkrTYwbzokQVN9/5?=
 =?us-ascii?Q?myXQZNHVttAgZ+xSzQx2gN7DZYj9COzeuvyN6Onv+Yi1rNNPXaRroGhpW0/s?=
 =?us-ascii?Q?Q96oBXcGDg72hD7cp+EOX3WFuJMj5aqKQtQOmgpUloE1UERXdsm2zNHFmM1d?=
 =?us-ascii?Q?QDnmhmAqJSY7NNAF1VQoeBM2cSQ/ow0S3P6j6tzkp8sz/c2ieNbfH8iCYa2Z?=
 =?us-ascii?Q?B+mV67rxy/bYHO+iII8PmGWqvVNFybhiWtt3Ur+M3db2Y29JIB55+7boeA/S?=
 =?us-ascii?Q?Bq4rAtogjs1zavfTAebAE/VLuzi+FRjIRbpUEf6MnJqxSulQOjaTskBNTpoU?=
 =?us-ascii?Q?nInfJHT8C+L/lgJmTyMSrKRsM2sKrzzBPRAqSmK18xtV/GRImo3AoQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A1C2794F443491408BE994428D021D02@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7464
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9d5c719-b8b8-48cd-7bc5-08dda7364981
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H8cKyiMawnWM7N/5tVxeMeXkd4zyuPbJemDCaTJh6QFcXw85gNEvrx6GApAM?=
 =?us-ascii?Q?O+2GMvtmnxSL1Fk6ljLRAzu7YmxAfROGvZcisGl8Ke334atyaFFppKyAEOhg?=
 =?us-ascii?Q?gKhhzOTh6jq1ehHyix+wscmI1WEhv5r+Tm631cOUxwZ22+Sffwnvhdst20nK?=
 =?us-ascii?Q?AQnBl9C4X7FHQ9Wxi5Cncsy9XmLazBjz3ZQcvxwk1iHZT7DtSVqaa8i5zHBO?=
 =?us-ascii?Q?EkjeNvLRVLZ9grh78CdQrMSKTIpGb44vNBWp6UfAwGF3PlIMmTlPkOzdfkR6?=
 =?us-ascii?Q?TIJ61q3CdEV9kI2CtMedS89khJIt3nWZCnJu982bULJbaZZvOPi+F0StoSah?=
 =?us-ascii?Q?VHHByh8sqt7oYaVMve5lWbMlEzePf32Q0kbB5RBjD71LfPSNsfgHdgMTBVzz?=
 =?us-ascii?Q?IpLl6WbCdHt66MAGobDQ26LlUna+SUciMhcclxgE9u/jbISGYrtqgEUszbSJ?=
 =?us-ascii?Q?TPxLaZHOuVcmoKGswNQdao+svUP6LxpmRq3sjdRS8gvSgQAkCW7sEkZjiHFB?=
 =?us-ascii?Q?S2DB7dgCy7EQfwmlviPxF7LSP5uhWP8aAplwqu0yiksPwX938rEVHlWokTyV?=
 =?us-ascii?Q?yjVZ7I/bY8zi8INg7VoSKydP/aX0EaXeYOvEzskTfpWSiSWjwUF+yWTWiWXe?=
 =?us-ascii?Q?czyDG+94WC95i6jz7iG9JqHGcGcZ314y6XObg3D/nHSjDp1DFkJmmnaGauj1?=
 =?us-ascii?Q?c/mWfn2wyEPcLOMd9hskZa3M1Q2xiZYo57aO+5AJBLiIcoirEZFuca7b3FHr?=
 =?us-ascii?Q?3CjKnG4GlI7wlX2b0NTnRGJgCKn1UATbyf6l2s0FSoC7XUVlGbPSBPzd7kiB?=
 =?us-ascii?Q?aTYXHdo/cBctrQT8Z+LYMNJdDIYNd52qvvKzeWpoQ6yd3SK6X5OnvXSe5dZv?=
 =?us-ascii?Q?g0R8Y19vf90NrMA0e/k46N3n1my+flIpxPvma1qbaS5jXRAIITkhyHUvU2Sb?=
 =?us-ascii?Q?+Xsp29CBDF4jhyvUWjtQuWYvSySeL+iy+8mw97/HI5QP6g+x6KyCkqDi/Rin?=
 =?us-ascii?Q?1FPYxOisV75iL/1RzZgJrx6Q8KyYcCfY2tR/YyChmI2P8rq0rO9n91At6UUe?=
 =?us-ascii?Q?axTc2BqSFZCXgZcwGDOWzMuueruN3coNSfQg15mdIJ8lPZuP+dzQoIG4L3Xh?=
 =?us-ascii?Q?QlhDsQ6j7A3AJFDBkOAL1JCmnsrorWNmn/S6EWZzCcyXRJ0qgTBxlO4xaV/V?=
 =?us-ascii?Q?wMmSy6/2mwlTzCfhlieVUI4aScry/di2t5j5pHtRrG7tJEhsS45jJyZGx6p0?=
 =?us-ascii?Q?DQyHg5XMdyg71e+t5jPqy1ikuOTprJGCXWUnsdqpTeumOs2ERzZGvwzuX2dK?=
 =?us-ascii?Q?cJUYMicO6Z9gnJ6vzSvSgnkIZRTt+Pwe0I0WeeF10Zl3JU3mZZz2alz9Cvk2?=
 =?us-ascii?Q?jlVE+UWZW5B0s4OyNSZT+kGgT8fbwSD53oj8/Rsd0A9lwKNVAoph5qay1sEM?=
 =?us-ascii?Q?S4m9Xqg8lijD/LdIskkSjduAIk/AuPw6OXwNcBa1uaBWVofdZOZLlXSggr2n?=
 =?us-ascii?Q?jkkDAOxP+B8Peb9QDAqZulZF4pyitQfTrOmN?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:16:48.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9d947d-0e10-40f7-3a6d-08dda7365d15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10295

Oh sorry forgot one thing ...
>=20
>> /*
>> * Armv8-R supports direct access and indirect access to the MPU regions =
through
>> * registers:
>> @@ -85,6 +87,7 @@ static void __init __maybe_unused build_assertions(voi=
d)
>> */
>> static void prepare_selector(uint8_t *sel)
>> {
>> +#ifdef CONFIG_ARM_64
>>    uint8_t cur_sel =3D *sel;
>>=20
>>    /*
>> @@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
>>        WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>        isb();
>>    }
>> -    *sel &=3D 0xFU;
>> +    *sel =3D *sel & 0xFU;

this line is not part of this commit, maybe rebase clash?=20

Cheers,
Luca



