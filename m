Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C58CAD8E0
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 16:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180854.1503965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd2t-0002J5-L1; Mon, 08 Dec 2025 15:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180854.1503965; Mon, 08 Dec 2025 15:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSd2t-0002Gh-I8; Mon, 08 Dec 2025 15:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1180854;
 Mon, 08 Dec 2025 15:21:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZPsC=6O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vSd2r-0002Gb-La
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 15:21:01 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe0072d-d449-11f0-b15b-2bf370ae4941;
 Mon, 08 Dec 2025 16:20:59 +0100 (CET)
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by AS8PR08MB6007.eurprd08.prod.outlook.com
 (2603:10a6:20b:29e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:20:55 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::6d) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 15:21:08 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 8 Dec 2025 15:20:55 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6119.eurprd08.prod.outlook.com (2603:10a6:20b:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 15:19:53 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 15:19:53 +0000
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
X-Inumbo-ID: 7fe0072d-d449-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cWlRSUB3N9d5LZThH7ze9GM7oBx8OrlPlfP3NPnPdNFbFy5R5TkBOuiRCDkneaY7peNpTrGQ/cLPXucfnGkqE7S4o42S9geykBN9X8x2D9Fvun4sgjsvrh20nd/FwXA3eRV5lU+JZhlEy8ZR6DcumiW5IlGQpHK/bL93Fvh3zeA+rYLURajSxwZYQuVPmDAMAV4Rcr1ZGJKM8iEg0TFNY1kcPE09zgDtCTcqcPhi87NBPWuu0pI18GMYnRrdxxGbxOXg9VVQM4LqD9DL9KmFSBr8luejSZMdeuDdEopbDvagAC96p8MRLLas4Ahj3Fl93Y04aJFq4znGgt05q/onaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZglb5GKpkqPRjhl3e5G+9xIPgNinmbvgen4Y5C6SjU=;
 b=smeNDDsK4zWTy9ctOa/SUKQS2rEVma1s5DDy9ZDzC9dGimpXUQP7ulwxcd/p11vhSbVTVWblIOe1ZPLzvSJjWM8xxXelnuG7YO85MENv2hXs6BouyLuPMnoyn/d1o757U9TU49G3Pe7oQpbUaUula8WxUAIOXLROkWKNWTeDneApprurZp8wy6+jEDt8USqPTX0aJfSjtMO5g6ogVsxpZFxQDLFj1fg1cEG8uW7sW4/PRkED0tiRuIDkwbsQVKfrS1CILP+Nod7As2seQujzeCH5oLxlV+bt036ZxrgQh46JkAv3bBsThL6LMdRaUll8SU692+RrMeBagKPt4KpDEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZglb5GKpkqPRjhl3e5G+9xIPgNinmbvgen4Y5C6SjU=;
 b=GqlP/Wd4cQ/lqQFjvgQZKDNg5UhIop1wj62VY2u7xyNTIB9V/s54FC4xeZdW5I6U0y0Qwpgr9cT239rgXoQftxirgtIqsKmKeOk1zFV/2WQB4XKvJYZNmlRC5a7v/UgfdZvhpSAGsRfJirDnaAzZZli+caJYtjm5OdLkxT/Gz3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPYiAEJBIMjYyMYAzoLXAPMGQU+BqO5VcLscRuaUyUDQGHl5jkHVW7hN8K5OgFQfyYb5mGByO/TE/0I9bELpRQXinwdNVwSBRW4eLajmnmj98RjJR6XdzoP08thHHNbLBbuogDBRNrj3aNTvKL540Mi2os6SUx0rNW3b6tFvvmmbQvxkww7mN6FsSCC6pRd8Rosm7okYPOrg84ZiFD+ccWeWVjyeBa90+1xXD7hLfDdLx716RU8hHM/O8JwagpWJiXWnMHxuDSasjc02Qx8q7ZiV4qf2OBwK2bwOlN1VGEY7/u05eAS5bRq5oSiVbCNvl3stfeuKeSgUjpLPpMe5IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZglb5GKpkqPRjhl3e5G+9xIPgNinmbvgen4Y5C6SjU=;
 b=xC1l41p00Y94BSloLG8NDIcSlges9KhxFQ9YKx7vler/Uh7Rsp9YCbHzlHwP3UTv6kLcMR6KY5FipHVcCvCnErmBDWvmX9XEJ8YhGAJPS1HAK51YQ5XKTpDsnHYPEx9t8/n5NdFet+oIjrv31zE7AKvgElkynEHgZJH7NJ7WtUiczSBrK7kjslCNOBtT8RRlwUY0fwtlW6jsrEk1a44EsyDLEUkkwpIoRLptYct+QCHPVi4B5V6URhfZl4bxwH8Rkug5kPSm4UuWn7Px8jbZy1bRFQrDGLhkUeqk0tavrUA/lmMXyirznGNpnKjhE6p8aLgMDHB7J1MpLc6AEoqnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZglb5GKpkqPRjhl3e5G+9xIPgNinmbvgen4Y5C6SjU=;
 b=GqlP/Wd4cQ/lqQFjvgQZKDNg5UhIop1wj62VY2u7xyNTIB9V/s54FC4xeZdW5I6U0y0Qwpgr9cT239rgXoQftxirgtIqsKmKeOk1zFV/2WQB4XKvJYZNmlRC5a7v/UgfdZvhpSAGsRfJirDnaAzZZli+caJYtjm5OdLkxT/Gz3M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/8] symbols: drop symbols-dummy.c
Thread-Topic: [PATCH 7/8] symbols: drop symbols-dummy.c
Thread-Index: AQHcaFHEZgCWYRtzmkm7gvYg23aA3rUX05+AgAABswCAAAYbgA==
Date: Mon, 8 Dec 2025 15:19:53 +0000
Message-ID: <ADB858CD-D8B3-474A-8E1C-1FDB415D51D2@arm.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
 <639fb816-c2f6-45d6-9081-238a6b3c5c08@suse.com>
 <ae96860a-02b2-4ae1-ae98-eba0b749ff90@suse.com>
 <47070C53-9EAE-48F8-BACE-B554BAF2DFA2@arm.com>
 <265bbc9b-d9e6-4e1c-b59d-cf77fb4d6786@suse.com>
In-Reply-To: <265bbc9b-d9e6-4e1c-b59d-cf77fb4d6786@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6119:EE_|DU6PEPF0000B622:EE_|AS8PR08MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbb5109-312d-43ce-accf-08de366d61b5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?2/zzyoqyyhl8UINf3ZKRK0Xl6L4hGgLQmqphjMwsCDVJm2wyF8M5zsRWZE?=
 =?iso-8859-1?Q?+ZiMBJ7EXX7f19iA5Ks07+LSagcRYvQW5oKV5UvidLRdBxqo5HO7L/gEnd?=
 =?iso-8859-1?Q?oLWfjkqNKbFqJBJEr7cJ0tsjKaKmb3FWE4gX3NA95arF1h5r1cgq9fHJCf?=
 =?iso-8859-1?Q?OyMPsEsheBfiKL2zJJ4fWiCznNWAHWAuZOvIW3sSxPDukGaFe9VH794tbW?=
 =?iso-8859-1?Q?A2q2qqbx+Cd6McE0DKF+AlI3EEgeRVqjnL9kV7RUZ0eMVulYWgVel41fru?=
 =?iso-8859-1?Q?WClAjKTkOa2EBhEl/MZJrvlJWp1PFhkmwdsrLm8mctCTVrV/Cc2ulb1Le3?=
 =?iso-8859-1?Q?faUNpE8fSbzvdiFPDbLza0VZNy0iBUrPWg/0/YKbOel+s//A7u5ATKWY7T?=
 =?iso-8859-1?Q?SODh6388LFrlRTJeSsoeS+f+nEofkaX9RbyewtTNMYgNW6oV7JIm3zQ1XO?=
 =?iso-8859-1?Q?BtRB8ScuPBmpJfqD50CpjLteggjEuYLtM78zeGZOF3D3aTzi5kDKXv/uF8?=
 =?iso-8859-1?Q?TGcSSl7b+/PjvcnESLodQrOKZK0qAlktFS2ptdLURs8bNE/lqtF/5QqkAI?=
 =?iso-8859-1?Q?0D7JJLkuOMhweWCdhpN12HEhEuAlBBiDzc4/mB+D0iAq82+nAwU7FGBs36?=
 =?iso-8859-1?Q?mIvx1l/w7Sc1Tz6/lRaB1rFL9u8C1nSEUX2/6dnDJHkhR6zg377BP4Vjzn?=
 =?iso-8859-1?Q?f7tMyh03mFGWB9KEg4xqKTWyYWvyLB8xqZuMuYEqZep/F/nt7Cln8uTz5I?=
 =?iso-8859-1?Q?K0BELaUObIk8cpO31m5rkBevzPXFGom2KK1NdBrTIOLfogSgL0T5/CEsUO?=
 =?iso-8859-1?Q?eL9Pa+5OoUT9VkLQAkxLXKAj9ISVSEROS2Wl/5qhnfvi1LpNK2OCZPH4eR?=
 =?iso-8859-1?Q?szqkFyfIWJt308EhZRyvUMVXLDxsXnZ94Cm4BePx497JrzKqMkqkLeaYQP?=
 =?iso-8859-1?Q?4sxuAWAvI5LxE+IsP/zg+W3ohkEXjVyCHqKRWpJVK3wpsengQkOICpHQDh?=
 =?iso-8859-1?Q?lUcCtu/roKUVal1s/Z7zcfxpaU77rNnydUe6yVGv/VRVqaUOml+M16TkNl?=
 =?iso-8859-1?Q?qoBNMqMV8dYaaxuCcp8ZqijjrOSAu9x+JuLvWO1QaieIKt9eGMqfqGEVUO?=
 =?iso-8859-1?Q?JN+2Ak8K7woC7WWBqRw40JstTC9r3DRtUqsVFe8WROaQIw44rVRLV9rHFY?=
 =?iso-8859-1?Q?XCap/k1fEisdtY3/3GxP9BP9kMRBF4LJCSglHFLuEmMoRo0AdsEXPetOgw?=
 =?iso-8859-1?Q?C6cVOaY44GxhqrcQXPD9tzttrxnCLgcO9Ikr2FHqzojcV9z9dPTgOP67I6?=
 =?iso-8859-1?Q?KThlF3EroBVE1uKXyJ5e6tgOpqHJGu28EUJC6V3KxTQowiHx1V3s9qsGkB?=
 =?iso-8859-1?Q?U1UrxwvvAz2F0bmPyoCxu3amyBUYPSEkglM0eCjM4TchoalhIXeagh5tat?=
 =?iso-8859-1?Q?ggGEU6Rncyg4xonOKjfMD1arDXZD2KPn59qzQ0eKushIa/jqbtEncanbKH?=
 =?iso-8859-1?Q?fw3LYBIVrDKSpntnlGjkNHNcUQUe2xDt6n6JmQRi9IR9uuf5RVFaIwEzHs?=
 =?iso-8859-1?Q?pAk0kBbhh/3b5tB3rhk3JmETWj4O?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <503E3020AFD3DB4384350FB637C20362@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6119
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f12e817-a9da-469d-c1a4-08de366d3cd0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+IAaF9VKXCURqMPLrVnUhDqPLKJRnNVlOG5Jl5FVIrjwRBTB/sQ/apeAlb?=
 =?iso-8859-1?Q?Bq1h5cmOop1ANtc5RwYkqYd/mZcuudoWWvuUEsEiVRM7YreH2/C//SvYrK?=
 =?iso-8859-1?Q?21zXwt1lCJYMlTqCMu8XauUYl68qT62xDOW9cCIPboQ+OljgJBFxzIpin6?=
 =?iso-8859-1?Q?TqaijvVCSmyuX55FGDgs/haGcJtCrcTyp7j8SV0fX5FeKpfqdgPsB206rK?=
 =?iso-8859-1?Q?E0PVDWPnTLDu2q3XF2b6vTlhX4lHgFrLZiRU/6WyFdeSXzD5lpf+Pit0OP?=
 =?iso-8859-1?Q?Dgd0CDyMq048U3XZjq22aVo5wuPXJLbkTmaSQvVMN4/Dh8EqJKwR2l6PDI?=
 =?iso-8859-1?Q?qPSc8BrkmJmQ2asI2i9UYLRGn+Nfm8vZlTfZgrLjPm8sS+aXr6JKHUsuGA?=
 =?iso-8859-1?Q?PjmCaLu4DuQQ0LBs849OFViuGTvpWLzn6Nhwjol4gvlyqJYDIs21FEAKH+?=
 =?iso-8859-1?Q?zBi0NEJcMK06S+zqPKii72tLBjzwBNbfaQp3pkzZYd7cGJpljXL1xiaxgv?=
 =?iso-8859-1?Q?dDBAiqzJ1kBR7s33SL4Y17ZA6l7+WkMcCPfr5FpezrhLKLFPjS7H04nJPn?=
 =?iso-8859-1?Q?GVPcSP/O6q9Y1tOwC7zYowYut4LzG3VvfQscvCz7GTNALJoUx33f5iYfGt?=
 =?iso-8859-1?Q?++n74CoTRLrvVvXro4OBKL66LVaGUC4QEfNVidZVUyN+NWxvdLweOIyhUC?=
 =?iso-8859-1?Q?0Fj7aJbk9Ys3JBzcKYMxwadkLcek4sb7ueUBBtf0yfBDixs2r6P9yBQwwi?=
 =?iso-8859-1?Q?ByzLOCuaGl0usEz53vOIoEqE2IMkQiVoCG/EOBF4qQs3RJHPaJNm8NFheE?=
 =?iso-8859-1?Q?wTuWjOyM08UNKreLfQpIKRd7VDxv5ibLMEKYinluRiEAaTgOZkc6sjWQ1p?=
 =?iso-8859-1?Q?RAF1noFr3ZPzKJOY7g4piWASFD4U+r/yZ7I54dqNnHQt8lgfxxuiZHQP+O?=
 =?iso-8859-1?Q?G0/rFhc39nu599nTZ9q9jSMOx3/QtkSWmMfoTCOre2oNpk6/3/++4fmHw9?=
 =?iso-8859-1?Q?V6aH0X5EG8hHqSValf7rReTOqRYrX+iL/splIwTDb1LlFt4mYMJfncSG9a?=
 =?iso-8859-1?Q?RpGPaB+q/3tSbrQeWxJc2L578VMLF/2eP5lafRVkVwTWVxpugxLXb0Jzw+?=
 =?iso-8859-1?Q?Iz+FSIKq0dRmUEa9IKks6p4NnITuluQbO1B5cIs0Va+eJ1B6QHNWhaIrF+?=
 =?iso-8859-1?Q?Tj1LRY6GnWjPP3S7XM6/nOhudKDdvJNraExyrpzIQq6u7+48/U+RwtIheX?=
 =?iso-8859-1?Q?LMlvuYMD9Sl8CYiZ5vtvn8i2+d1k1mb+TROpvM8xAMPQK3FtnAwijS05VC?=
 =?iso-8859-1?Q?+86jZE9Ba6rdUBk2vH6XWxx0Ad3+GYOZ6qTEnIZN4xqAF6pMymlDYN2DmL?=
 =?iso-8859-1?Q?uiFi62SMDdc9wDn9PdIByZGV/aPllny2FH2kLpycVscBnUj/QtkinK8zst?=
 =?iso-8859-1?Q?RhOZQOrPeowJa2N9WyjtOkcLe6lmPc99D/yGKJkd5fDGC23nT+rssxxbbn?=
 =?iso-8859-1?Q?MzitVTQQliB3Nr1NoinrGVJfdboI2kCr0kRcjhmeug2JpNzWr0n6xfOays?=
 =?iso-8859-1?Q?J1Pk68o5F7f6/xCvcX+wuk30IaSx0bfTzgnol2Qn4pYGptEFxWxtS67qcR?=
 =?iso-8859-1?Q?VP7wk+6BZF2ts=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 15:20:55.0750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbb5109-312d-43ce-accf-08de366d61b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6007

Hi Jan,

>>>>=20
>>>=20
>>> Now this is (to me at least) absurd: I'm removing a file, just to find =
the pipeline
>>> fails because cppcheck doesn't like docs/misra/exclude-list.json contai=
ning a
>>> reference to a non-existing file.
>>>=20
>>> I'll amend the commit with
>>>=20
>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -170,10 +170,6 @@
>>>            "comment": "Imported from Linux, ignore for now"
>>>        },
>>>        {
>>> -            "rel_path": "common/symbols-dummy.c",
>>> -            "comment": "The resulting code is not included in the fina=
l Xen binary, ignore for now"
>>> -        },
>>> -        {
>>>            "rel_path": "crypto/*",
>>>            "comment": "Origin is external and documented in crypto/READ=
ME.source"
>>>        },
>>>=20
>>> but I think such tidying should be optional.
>>=20
>> Can you share the error?
>=20
> + xen/scripts/xen-analysis.py --run-cppcheck --cppcheck-misra -- -j16
> ERROR: Issue with reading file /builds/xen-project/hardware/xen-staging/d=
ocs/misra/exclude-list.json: Malformed path: common/symbols-dummy.c refers =
to /builds/xen-project/hardware/xen-staging/xen/common/symbols-dummy.c that=
 does not exists
>=20

Oh ok I see, seems to me a good feedback from the tool to keep everything c=
onsistent.

Cheers,
Luca


