Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC838B914CC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 15:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127794.1468376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0gIG-0002n2-OQ; Mon, 22 Sep 2025 13:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127794.1468376; Mon, 22 Sep 2025 13:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0gIG-0002ku-LM; Mon, 22 Sep 2025 13:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1127794;
 Mon, 22 Sep 2025 13:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n98p=4B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1v0gIF-0002km-Di
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 13:09:23 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57fa19b3-97b5-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 15:09:18 +0200 (CEST)
Received: from AS9PR06CA0176.eurprd06.prod.outlook.com (2603:10a6:20b:45c::14)
 by AM7PR08MB5319.eurprd08.prod.outlook.com (2603:10a6:20b:dc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 13:09:15 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:45c:cafe::a8) by AS9PR06CA0176.outlook.office365.com
 (2603:10a6:20b:45c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Mon,
 22 Sep 2025 13:09:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 22 Sep 2025 13:09:14 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com (2603:10a6:102:33e::18)
 by VI0PR08MB11503.eurprd08.prod.outlook.com (2603:10a6:800:2fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:08:42 +0000
Received: from PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3]) by PAWPR08MB9005.eurprd08.prod.outlook.com
 ([fe80::d65b:a08:278:38e3%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 13:08:42 +0000
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
X-Inumbo-ID: 57fa19b3-97b5-11f0-9809-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=atzh8oNQ7pVfmvbyA3HwfcV3R6nfcC0nYYODh7DGFLO6XhEIdr7AdB4qTR8Bx0sEF62zkK/pt8a34PtJ2pcgNzKudbMsgCfac9br114UyFy4hQ2gUwEoiobB/rXer9qIoKsYbbzkID/C6XsmJwG5w5/1Uel47gGY1j/veFxbFcisG9BuFy5Fq9OqaFwZF1e44w6rW9DLrd1Ir+p5PfE8oLReRVJRqw2avpJI40eMkxh54GCLc8k2uL/ntVkTNBumIEfxsWmzbmm/8Ft1MZhvVGjhueThAsii+sv1BgTsRMOGu0jl7tVtN/z4zCtmOChldDmU1xU4DZ6Hg4EAlxeAtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBqqU/+eKkIaSTMxva89/A1k/FmamY9z6GnWyO0ZZFM=;
 b=n96K4WNhv7U1tuznI+NTlrg82kPygZKZgFl+NKR/o/vTDJg8OSRKfs6d5013HD2hSbqSI9dRqJ/nlTD1IyjPP22B+L9psH9hErOLqTdGZuGKOJuyc7RRSx+DRdsoYX2MAR2v4HKLVbnkV76h9yfGQk6xfDrY9SEYR5amir2ZvmSNw2iIZE8XhQzQ8SGZS3KFBhb4sJVTK6yX/hFpJXyjqk5z1DqaMhGxtToxCtd+9+hdZ1rmb6/ZJx1EcjdGVIWoJGhLwoWdwbVsSXvDeNR1Ysg+H3e5hY9I8e6SIYuI9S/X4VFpeDVtNIIQaJn88HdQK3ZgNXtZd+oOZwAQGm67+Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBqqU/+eKkIaSTMxva89/A1k/FmamY9z6GnWyO0ZZFM=;
 b=UgidHKUq2uarevsdWYxjKHCf0vSTE+YZsLmnEbHjsxHzucFNjYRxSpkjGKIL4Q8GkZMkkyHyNY9hJHdJtwmU+vtIfbfjqqiQH6DZCvwQmY1bcMVBfOFlsOuONarM/RqRJtUbDQSY6Et7Ivi3zOhTRK6l9L1Y+HrkZ4Rl+nJJm2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8utCSFQmekJ2+FDXLjB5nWvGPj+7xUICYiV3OQHIspXQ5mN8z1eX2+le5Pj4r0RYi2c0nULYVFBOEYU6WahKZVsLuAi0zisyuSZLVR1W2Jr/tfrkJndP3xA0Y5VCrmT/b51AtxUTl+mEsK365tu3tq5PyLsFCHYl2BmtplGlQvRLZGUjXuouN1inHWejw6rjHLoX+DHNX6ey2HFj2Llls5u6l491xGw6ErxYe0FPHcHOWrwUoZm9ApZPjBZSO7bKE+CnsTRh1eGWW68yFKA8h5+uAqNLhyB5R9sQPMs5/uG1K4C0KBHp4QqTZ5lpQb6BTVidKNX7iSErcIEmQZzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBqqU/+eKkIaSTMxva89/A1k/FmamY9z6GnWyO0ZZFM=;
 b=U0bPEHsWH2WAx+gAaBbTl2iCYd4dO1KvCIb22H5eQKPqL89VRSU7/RadG3EP25bsfrlUbhXlR2IpydRRAsicnu+VeIWB73DkXm4hljpUAouTFPoPOv1vx6pWbfCQFdMbJFjX9q8aVTlYx9Z4SXXv54zfyL0tXGMeLLhoyPti3KzBJ1LSy+Gfh2kVxpkOmNa3bDS2VsrCQMKdg95v7mNljXFjEB+ZgFmROxejGfOszFZeFRnp6WZMDWvYO1zSrBfYCtIK+aQCsFrrBwjO8RJRGp2Mo1SwUhosYRfaUVm/IwatDRWudTTqe4PYUokD+xJ6lrbM2QhI3nLf12iOcjm6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBqqU/+eKkIaSTMxva89/A1k/FmamY9z6GnWyO0ZZFM=;
 b=UgidHKUq2uarevsdWYxjKHCf0vSTE+YZsLmnEbHjsxHzucFNjYRxSpkjGKIL4Q8GkZMkkyHyNY9hJHdJtwmU+vtIfbfjqqiQH6DZCvwQmY1bcMVBfOFlsOuONarM/RqRJtUbDQSY6Et7Ivi3zOhTRK6l9L1Y+HrkZ4Rl+nJJm2g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v4 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v4 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHcEPw+d611kJLkXEyjl3BM2lUCU7SfYgSA
Date: Mon, 22 Sep 2025 13:08:42 +0000
Message-ID: <FBC13343-C6B3-44F6-92F9-CF58EB10F7EE@arm.com>
References: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAWPR08MB9005:EE_|VI0PR08MB11503:EE_|AM4PEPF00027A63:EE_|AM7PR08MB5319:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d2de23-cc85-4bc4-c9af-08ddf9d93ad3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EiGbZ+hZG2a8UQEPTdnr9zBUuqDaEHZWz0PeG1G5qsy7HBa15+tIkBw2ib2Z?=
 =?us-ascii?Q?gKlAUQFpGN7usu98qUvpEGgI6ByXBzJsi6pDgUmSs6bqiYSY+OZc8/AN6z2A?=
 =?us-ascii?Q?JBVNeo7vzJBdrwVt7dFlwWfaHTbcOkEYgWROeEmx8LxEuJuqlXEtMefg7K3Z?=
 =?us-ascii?Q?Wb55H4o5rNodQMLnnJqiG7TQCihntH9UXvGsv4b9fMnUoB1yAZ9US07BjScb?=
 =?us-ascii?Q?S7tQ5gc/2OtNa+DrWU51y6laxGXT6jplDB0FtN2nK+onU51bTHUjRQzOcc4G?=
 =?us-ascii?Q?0nSl7Y+qBoFWWXazKhHYkdOVKDyylTawUlKVpERtE23Ic/x8DH+GvnghQGz2?=
 =?us-ascii?Q?dk9uHj24eDbl2FEZwrwKYOrvq52A68EjC7W/eZth3JwMR1Keg4aUqxs/Ngao?=
 =?us-ascii?Q?X2UmV+mRVMBbHOxpawPyGuI9G7LtCD3yxawh30E1aHU/Ea/KBACUqlt+h5AQ?=
 =?us-ascii?Q?hAExQS0XpRUh089jU+8Up9wicaniktwOCL3rggebW1ztYhguIY3Gjfy3QAyU?=
 =?us-ascii?Q?uZWczjM/kok+/Sce259zEP1kCMTbhn2v4HGO6ObMwqPQQ1VXlOYB7Pq4+OBE?=
 =?us-ascii?Q?atVzPXpDkO9Fg4tbTHtAvbOa6cDHk/YQYT4VrB5el8B9mc+HpsphPbsapxZh?=
 =?us-ascii?Q?rlgTj4k7MholS9rErmv+LXBMX+7YmZ3BEk58L2G1bPPULL7VkWx5iglAVu9s?=
 =?us-ascii?Q?XcxzWZTM9rtQgwZx54F5WgNOdyIH+M69jsjSq/yVkG+qrX1PRyQnFti/8PCo?=
 =?us-ascii?Q?AnGL5J6C0JpF/spS2hoEK7iXfWOA65a6ZFLujGkwVwEsoUSKsApfRQZkYeSo?=
 =?us-ascii?Q?7odHhZZp0y4JDSf0WZIT+lUK4C7RsUH673ct9Q1vbKCaXfM8V6TSOSLg7T2U?=
 =?us-ascii?Q?nlPU+4lobWotyMUsP90nLlK/8tnAqQ44tD9fAW1502nuVxYvkYQXKjKE8nf1?=
 =?us-ascii?Q?G+7aNUz6KxH0OhYgGZQK8doSMcj3LRorj6sopiA20AoaFPPJbkm31bkcXp/3?=
 =?us-ascii?Q?LNHZhzyVZNwLt+eS8lew7dBLVxlpa/l5FVfC4A5CIZ+dPzrwQWKvbbd4wVfz?=
 =?us-ascii?Q?ypb+E19tO/+cINuWWUCgZzHUmqvOo+9xh58BJsGT0U2wZQI0Y2ZTA1nt5wb4?=
 =?us-ascii?Q?y/DUm0C2KJZmiYJ2akwqqDAKmD308q3dDCabRUPRAbb7MxImRjebd96sjqV1?=
 =?us-ascii?Q?ddjlC2E236qOsD2rlQLBmCFdlaYocftmRONqIwMSeRZKmqJ8u9/IUuiAgeXo?=
 =?us-ascii?Q?5LCeUybwb94EL22/AUgpUj8v/+1cH1kRQKDr9xD/wLmzfqAKoTw6VHho/OR1?=
 =?us-ascii?Q?eJTT2AtJoR7tBklVrZd8ncTXO6JseTm+bFeJP4faXZLvW7WUhp0/QkmqFIgY?=
 =?us-ascii?Q?7o8jw/2C2qf2I7TyRDWL8aF3rmyfVoaFbC/7q5dYhyaa9KI7IS2CR7LZoQn5?=
 =?us-ascii?Q?ZFlwYL6h3s4kXFbIEfIr+MzhA+fZTw/ySCn8Iyk2UrtTydAKaorg3A9yOHDR?=
 =?us-ascii?Q?O9C6xlZFBsU3t7w=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB9005.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9AEDE525879DF74088692331758F65C1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11503
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3744521-46eb-4b21-7f58-08ddf9d9277d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|14060799003|82310400026|376014|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?myI+NjuBWVKznoO89IWpMlT3aD93IDjbZ4qpMwIq8teSzIn96cPrkvtsuYoi?=
 =?us-ascii?Q?xUrawKTN+wkQqkd0jK9axJkJ69BmlxOZgN6mAanhLAwXiH97A0Pmm2mafZ24?=
 =?us-ascii?Q?DMmu7FEcvL01NsJppFd7Ih4NILWpnJCh98EY+oDCnBDTZJaC5ZVKCAJZco9L?=
 =?us-ascii?Q?MHlQ9w/BIsPIspARlBEvvow4N3J3/TVgaqiD7PDv7Kh2A41nrG/4b9Vq2w8p?=
 =?us-ascii?Q?fv19qEYeIBzHTR68ueb1C+Vz/h1pwGgJ6Kwv29llFRbZZFt3rO+9+pfHAvsg?=
 =?us-ascii?Q?dDZjYrr76o4X1oIxwp7NMMe8mSyT4ygqNs6fbpbADqoT1bbBIJf0v2dYXdqo?=
 =?us-ascii?Q?ulIz1TAny7ylW1UZXykvNrOWOYOjPn0gewNcGWCG9SphbnsrluHrNAKvA6on?=
 =?us-ascii?Q?PEze2BnNNuy8BCpZqbvfItdXjeploRv2UdIZ/U5VzdIYRE8c7pzwNkx1e40X?=
 =?us-ascii?Q?5K2Muzxadw4bkC9t8k0X8lf9Zwyt2YBC1YuF/5Kuta5fICC6vtse1RtsFUh9?=
 =?us-ascii?Q?tMXUXdyH1eylWI3fD/XBZxZTyAma48viwQslh6V69eo4ZFqLkoajs6iJTVpm?=
 =?us-ascii?Q?m8XvDlo7gl60l7zMOqOSTXVGd6+Ky9QgURwABnkODujI0ZGHtcxy614MVua8?=
 =?us-ascii?Q?i/rmqZB9O6P8b5w2p5MLNeuwnNewIBnsL5SP6V0u3ao+qRUIBBCRk0Io1bJo?=
 =?us-ascii?Q?FlTenCdzT9bwnb8AGOrNP4VPb6nw9P9DX9exWaoQcf3uXCY7zLlHZnOg8KJT?=
 =?us-ascii?Q?RCgA+aMak6Exi1ALQYFZtxl8RGo0mjujELEErSIE1PBVikzYNZ5q19R1o8pG?=
 =?us-ascii?Q?lskpG6KM64iw9+M5oVwkwGBdZI5vxKxfj/Qc8/W49nisXD2B+Dy6LjWxNVqT?=
 =?us-ascii?Q?uRFglxh0+eQAx/QmsUPCcutvtfeEPlYC8PkFqS81NJC9vVmdL9KY2PtwTpuQ?=
 =?us-ascii?Q?+2HBUP4I8IAtE2Seq7A7b4RiGleM3gKoyXg10MPB/5tnlzP0e1iugwvuMeE+?=
 =?us-ascii?Q?RQJWO5t3U+jUfBZHiwOEqKQY+JShZaICe606L3EPgEWaXgJuXZGkeJTgqlCi?=
 =?us-ascii?Q?igpy6EUavGn7H2TqW6JX0UqMOR7fknJjYnA1DP0pR5q/cRQXQrh5alL63k7b?=
 =?us-ascii?Q?zHeMHQ5Tgl+OCL0nL1odPklsg7ksbQ8IiRMQdCwLmRU412LcJJt6RN1ymQY+?=
 =?us-ascii?Q?aY37e1K9o35J3MvWoFMxposoW5h7PWVcQ63cgBZrANla3dJhp1xvSnb73Ms7?=
 =?us-ascii?Q?fIxL7iGfbzILtxDqOYWEpDaXgOyvx3TUBqpKlv65yAx5bZi8THrGCWPYUcQE?=
 =?us-ascii?Q?WK3Mnbuh/RkUSEH/INMLY0P4bHRcVOCba97tWQKxnGWdYQz3Vtzi/kObl8LN?=
 =?us-ascii?Q?5k45s+PBpjOGE/d24PbkgUqsGdWc/fSCaIXJZMcV62mugCtYkWitqpGBezJn?=
 =?us-ascii?Q?IXAC+40i9bAcAcgftTmltyZRLAk1QUQD5SbFrEJkXJ1QdJRPSB0nB2nKxQcx?=
 =?us-ascii?Q?SdBZo3pOt2wOhm7Qk1erxDnYrKtOotfNKqZD?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(14060799003)(82310400026)(376014)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:09:14.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d2de23-cc85-4bc4-c9af-08ddf9d93ad3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5319

Hi Ayan,

> On 19 Aug 2025, at 13:27, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> Define the requirements which are common for all the commands.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Looks good

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from -
>=20
> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not=
 return
> 0 for success in all the cases.
> 2. Reworded the requirements so as to write them from Xen's perspective (=
not
> domain's perspective).
>=20
> v2 - 1. Specified the register details.
> 2. Specified the type of buffer.
>=20
> v3 - Fixed some wordings to make it precise (eg register details, bit fie=
lds).
>=20
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 60 +++++++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 42 +++++++++++++
> 4 files changed, 120 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> new file mode 100644
> index 0000000000..82ecf690a3
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -0,0 +1,60 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Instruction
> +-----------
> +
> +`XenSwdgn~arm64_hyp_instr~1`
> +
> +Description:
> +Xen shall treat domain hvc instruction execution (with 0xEA1) as hyperca=
ll
> +requests.
> +
> +Rationale:
> +
> +Comments:
> +Hypercall is one of the communication mechanism between Xen and domains.
> +Domains use hypercalls for various requests to Xen.
> +The exception syndrome register should have the following values :-
> +ESR_EL2.ISS should be 0xEA1.
> +ESR_EL2.EC should be 0x16.
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Parameters
> +----------
> +
> +`XenSwdgn~arm64_hyp_param~1`
> +
> +Description:
> +Xen shall use x0 - x4 core registers to obtain the arguments for domain =
hypercall
> +requests.
> +
> +Rationale:
> +
> +Comments:
> +Xen shall read x0 for the first argument, x1 for the second argument and=
 so on.
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Hypercall number
> +----------------
> +
> +`XenSwdgn~arm64_hyp_num~1`
> +
> +Description:
> +Xen shall read x16 to obtain the hypercall number.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 1088a51d52..d8683edce7 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,5 +10,7 @@ Requirements documentation
>    market-reqs/reqs
>    product-reqs/reqs
>    product-reqs/arm64/reqs
> +   product-reqs/version_hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> +   design-reqs/arm64/hypercall
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 2d297ecc13..7e3912c8f8 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -79,3 +79,19 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Version hypercall
> +-----------------
> +
> +`XenMkt~version_hypercall~1`
> +
> +Description:
> +Xen shall provide a hypercall for the domains to retrieve Xen's version,=
 type
> +and compilation information.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..b824c539b0
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +First Parameter
> +---------------
> +
> +`XenProd~version_hyp_first_param~1`
> +
> +Description:
> +Xen shall treat the value stored in x0 as the command number for the hyp=
ercall.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Second Parameter
> +----------------
> +
> +`XenProd~version_hyp_second_param~1`
> +
> +Description:
> +Xen shall treat the value stored in x1 as a domain virtual address (mapp=
ed as
> +Normal Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in d=
omain's
> +memory.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> --=20
> 2.25.1
>=20


