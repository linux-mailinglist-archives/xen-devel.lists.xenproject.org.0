Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FUoMQa4hGnG4wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:32:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8FF4A5A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 16:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222131.1530167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1Kq-0002qc-PK; Thu, 05 Feb 2026 15:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222131.1530167; Thu, 05 Feb 2026 15:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo1Kq-0002og-MM; Thu, 05 Feb 2026 15:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1222131;
 Thu, 05 Feb 2026 15:31:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vo1Ko-0002oa-VC
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 15:31:59 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca60a24b-02a7-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 16:31:50 +0100 (CET)
Received: from DUZPR01CA0290.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::28) by AS8PR08MB8610.eurprd08.prod.outlook.com
 (2603:10a6:20b:564::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 15:31:47 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::59) by DUZPR01CA0290.outlook.office365.com
 (2603:10a6:10:4b7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 15:31:42 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 15:31:46 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AMDPR08MB11481.eurprd08.prod.outlook.com (2603:10a6:20b:719::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:30:44 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 15:30:43 +0000
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
X-Inumbo-ID: ca60a24b-02a7-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=n4/hLdUA6zQnY3OtFHZTi3vFctbjtRklhwSBowrK1doXv8H7mVd2nM5AkXoEB+35KuXQVCXuKehrsNhw4clpvRJnQu8QmPC6A4Fo6QYhy4aIwnjNXYalNMojRi0DtuFj6FfCAUjNPL+bNkwXAOAhJw6Wn4WNY7UJpfB9yQ7g1btPuhFrrHq7gcjT3b1VrOwibzhPLWNc4aB8OEZUtXjvsIs8fNBktMmEMjq6PohJcD+3pJIDUnS4s70KVIkn4gPWTt5kuYxbS7H09nSYYtl4lpa3CmwJPMVPBhJFrrUkECNmzw7SUWgmww02bLT0VKep9j8pI2L9oIM1z9WpZNEJWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXP1RvqiP7E4DrADvgvJikJDMzegwiRMmn+AxR/Tip0=;
 b=px41fnOWfBLNbYi1G+BTkL2n2t7ixzwwVA83iTVKtFpmE4lE4JrpUCdcswqQGWau5BDT0fT+01xMeJ0fhoJHpjWhs412j2jCTZwvX4Dr1WVXS6QhYStZmp2Vf127E+cq6/W5equbfPvOu14v+DIQ47zJfhfr0r7YN24bjkkk+WWLKU1dHTPeGe4AZWWsWeU+kZ3rbn/AztToCq/jxbwynzyAtT6tkWmEQeML+uo/mJ+0f8EWpp19xUyCVueF/P7uvBmQU9taSw1ajl6NX44Woq/FF0UN2Rm035AjdRRNIUSUeT2CuxIyalIZymzhVmpkcDHvXI7LMWtDZXdUf7S/ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXP1RvqiP7E4DrADvgvJikJDMzegwiRMmn+AxR/Tip0=;
 b=ZK1nQ9aCbIcmgKrTEdhGFKBNAwGfehpFOl9/ZncxJfNVCmBnJxhBLtgM9jMECNrAajafkmcVW+9WIR4nVb7Xr1NWDaAyseAHTd79Lb+hYXGSc0mcQsQTSI64RtRMXbpf+tq/YkW8ntk04AMO5mXccdMFL3WTFc9jyzlh0UFwyTo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vd/n7/CSdQq7Chv2KzinR3BuebyIt0YMbJw+BbYCUlBAhOENPUwFLwxwWrQB94UhMYU/kTuVD8y+K8imWUM4aLx0eTAHONRczRbsEIpLQ+8SixKJ9Wj3w6+e+3v3zLomIF5DCMIaEgcBuGapt2aNu5Pr0akf1UE8UCdqjWLr/93B8KuEzIOIESZfTsqC3h8vwQTEduamU4HoEoK2AIqwsNX6qS4DZG4A11ivO+8PhSX+gUXCoYRpbT4r0lxAO79NzFumGNZNt6UQ13OLiW0XeoBKHOAenoNFGz0S7+zBbGoUSrGtOSNOnHMISlL9eBt3LuHe14FacC860UgA2vYEEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXP1RvqiP7E4DrADvgvJikJDMzegwiRMmn+AxR/Tip0=;
 b=QrbEaS4DwhMSytAiBVbddYelqeBmy16VIAmiXK2506Js0S5m+5EkpWmaL+S654Ny6JdOcdtDUVeLurFlRxuduPQkaBCpEviLGWrMYni2yRsyDwZRseXvOhDxvhQ3H6uMzFTxj7xIJbPjkZEFAnVw6+/gvSgFIkzVrVAdCZiu7pC3x7ey1Fmz3bz5rVV8FpsaXbp8o57WUKPpi1oYlh4pZruCjzjsaeu/aXi1KB86eRkg3XSaS41yhE58i5O2++5urksdoUXwmUR6mDmyv9uaSN7UH5l7x+ChDVOOTa/hnIvqAX5lWRWUStrDlC2aL7cTXAO40mXlVY7kaTkS2dl8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXP1RvqiP7E4DrADvgvJikJDMzegwiRMmn+AxR/Tip0=;
 b=ZK1nQ9aCbIcmgKrTEdhGFKBNAwGfehpFOl9/ZncxJfNVCmBnJxhBLtgM9jMECNrAajafkmcVW+9WIR4nVb7Xr1NWDaAyseAHTd79Lb+hYXGSc0mcQsQTSI64RtRMXbpf+tq/YkW8ntk04AMO5mXccdMFL3WTFc9jyzlh0UFwyTo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V0CQWAgAAyjwA=
Date: Thu, 5 Feb 2026 15:30:43 +0000
Message-ID: <2B5080FA-A0F3-491C-954C-A458C6CA2E93@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
In-Reply-To: <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AMDPR08MB11481:EE_|DB5PEPF00014B95:EE_|AS8PR08MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6c8dbb-4e7b-4b4e-ae1b-08de64cbac91
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?zQv/NXRBzkzuu6xHMxDs+pTe9JZ0mFT/EorvxlZpaQa+ZEsab/sb1qSUGg?=
 =?iso-8859-1?Q?hXk0u7yEw5f8qExw+9cYQZDCQT8RcB9AET9oxXZgWtiX4mHN4suKqSZzAR?=
 =?iso-8859-1?Q?6BQ/RDhU7gQ0hL1iHAUsY6Fa7n/pUwZaxnns+yXmVabEotR7HOqXE/6qWr?=
 =?iso-8859-1?Q?wuNJn4538L6hrSgjn1wK1Eo+XtwoZVqEat/uOckVo1t0bpmXdVb1ap1HSY?=
 =?iso-8859-1?Q?Eld3RXC4uvx4DVDsCe7JQ+V5sgSk5HKyg66LpQthjcTkqUmys+ChCHOpPt?=
 =?iso-8859-1?Q?eh5DPkHiuE5ok/DIfxEbwIJdlojRmGebmo/rXjwmW6WwQxtNf5YMYth4a3?=
 =?iso-8859-1?Q?WIlIZyTPUvbhny2meETU7QmHCUxgzy8xjJHMzBPyZAbX/Nx+ZrXDiSSfmC?=
 =?iso-8859-1?Q?G8zQri+JMd4CZH3oJ+8TzY8FeyguZPKnU94azVGr3M3QwGs/EA5AEMh69J?=
 =?iso-8859-1?Q?3r1vfOplRjIigxeGBK95tKWPhBeInqvewC4oWyWgQyAP+uoMPVkR2yLV/J?=
 =?iso-8859-1?Q?29QbFBoAez+H9wzyi0fTdalGGgI8IqAQG8YcBgbfQQxe2x7AEXj11kHY1o?=
 =?iso-8859-1?Q?bpMZKMmyA69/FEXOkfqtXBo06GsRgNpDCIRD3JRyLKeswcv+Dp1G63ylCA?=
 =?iso-8859-1?Q?r0Dxe/v1wb617X5uwH4j2O1cYdaHv+LAtnppol6v9ZwzrDnQAsd4PaUY5O?=
 =?iso-8859-1?Q?pwuEXBkxh+UU5ZTHG3vJtQGjGBe9/aIbMsSYoCI3EV4L/+fjZZr0qehLrL?=
 =?iso-8859-1?Q?EqKD75PuK8S5jChqHzFJX8i0tZvXuqP97uDu0c3uHK+U5tA6psskAsYmXs?=
 =?iso-8859-1?Q?jTo6lOwzEJ1zAffpJCkFznpP11LbcMHaDg7jvV3lzJKISiKdiR9i3QQ6nx?=
 =?iso-8859-1?Q?iqfM1/iO8e4xwqC+MSIA14Ro+aImsMIIMHWxqTZkr8VTTH4tEsrDZoDNfO?=
 =?iso-8859-1?Q?sE1f2ZTb3QzpozPbM8ohe9zoBohkzkGJQPniceQQSAbPiq+tPjmqcLsYwq?=
 =?iso-8859-1?Q?tUanvto+cw0gsd5Dw1yLHZ+yZZVpMYYQHmeVsztkb1eL1LZnxiWDkVPJsu?=
 =?iso-8859-1?Q?YZZi9Pa1OHlL6/tvKM973WTvCtAP/lKVnAEPm0rK0005INyVIfHqlqsyt4?=
 =?iso-8859-1?Q?XOt+L9n8BxUzxuC237GVHezFoleJjbmkaGElUIOjUJVUYzig8b1qI+btH+?=
 =?iso-8859-1?Q?8tVBHfC9q5kDvO2Oy7GIk9PRc1ViG8FyqpJqlEPibzyxr/nXPQsfo8dRr6?=
 =?iso-8859-1?Q?oAia/2YVmXPN5oazMDfl12PWi/92bx0gaePGAH0jRuYhJ2gvRfN0LXuqwj?=
 =?iso-8859-1?Q?6bAd2Ste6ejTwqF+OodyEQinx55XliFvpszJ7RWLgJRXNKfifl+Qmx9jA8?=
 =?iso-8859-1?Q?xkkB4TaKY0Ib9U3ZuZG0oXr2JJ5nGhUDjwpd1LyonhhQwb8DB7CtLaAK4V?=
 =?iso-8859-1?Q?1cqTdRdlAgylK27CRuP/GUL0TeHzWvoQDeMdwYMj0pBRckdQbxt0YKD/4A?=
 =?iso-8859-1?Q?c2iRih4cVmAT8XnnKx0abRVraWo0dIAr2IJynxyVzXFqfVtBFQBaRGMEII?=
 =?iso-8859-1?Q?E6v7yebbM8MxLkl903fFKxhKZrUfsJ394SlT5gQjtPl/DowmVPyTmLSL0M?=
 =?iso-8859-1?Q?f6H/+bVuYELkz0Yly5AbLg5JQbbMPb2lrsJeOiMyHEg0KRUZLeGkPiND7B?=
 =?iso-8859-1?Q?e9XfnkhAbmNnTUh4s0s=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D8ACB741784C6540A60F65B28FF8F3A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11481
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97530a35-41ee-4d23-3da2-08de64cb86ab
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?keHiz7aondX9WUt/cdDv3A5wixif/C18BsEEc08o3SLA8ISwHO8w5LJRND?=
 =?iso-8859-1?Q?cR3uIIwbckLGkBlZx7YPTkfmt6nnhX937ToGNeRnE+U/4NmGwK2tl0/RcG?=
 =?iso-8859-1?Q?waSOhgr+jK1gNoKySZGuCri/xDXQ1/QaOBTOGHzNheindybN1jEG/f/rpl?=
 =?iso-8859-1?Q?9KJQPnfg/FfSheCkuh4jxbua80uEPbBzxIms/eR09pW3PNR4D6MPpLPk6B?=
 =?iso-8859-1?Q?lnicKVGU9X9kPGwnprM7khqqCrK0f21Ql8QrnpHMEAxS0ycciu8UshrGKh?=
 =?iso-8859-1?Q?cTk3TMpJCSuigV2p0zlkuls0i9fkw7F8E7ZxENHNJNQybmPLzzNmlojUkJ?=
 =?iso-8859-1?Q?wmlu2Fj66T4xcMn5G+JkMss9/CWbl9IZ93GvSK/pPklWWHzps64Op6NTcu?=
 =?iso-8859-1?Q?YnbE+YSvCuY/ym9eU2QQBTZH9SsZyNEEAHJE1sXj22gyH/ZkyZNNZh2kQ9?=
 =?iso-8859-1?Q?N1AfjLQfSFZ85GwW1C38gftrPx+7w5DkQLAzOXMCAjJoZA/plkztl5RX84?=
 =?iso-8859-1?Q?U2CAMYO2G4uxntLd5Of/b7MvDCzFM8hGu76dtHzm4HM93T33a+4ot2bZ6R?=
 =?iso-8859-1?Q?s1rhgT0gUH9cIHmwYGa2eShl4WvDNm3qe7L2I6LdV8y1FLL0DVneguZSTn?=
 =?iso-8859-1?Q?xkpmRymU32XESwNn64Nf1vAkhXnA+EFU6IQd/tJ3JQsekj9XhGo8xNHFCX?=
 =?iso-8859-1?Q?WkLS9MMR1k3yD8xDXvxDEd0mAjSaM+M+Jm0t/TBV6C7NMUYx/zck8Sf/H6?=
 =?iso-8859-1?Q?xYxXiUt7hBdWg9Y31dU0Vt1pscs5XwIjCm2iHDh7rk0zgOLZIz+6Y7s8pr?=
 =?iso-8859-1?Q?mSXjMaCnvX5XfFfZLnRnRhxabJSwm56hCAdEp/dK35dEzF7bNAkIgFu51Q?=
 =?iso-8859-1?Q?Mi9M+mfoJtj6bq1wefyG9ruYBeM29kA150c7fn5EyB/ILo8u2I5Bbbq7KF?=
 =?iso-8859-1?Q?/Vq6fkjlpI9kRRqKjKl17XVpgT4cvFaxLygtvsJtVyuY1KOWlfy9w/CMLh?=
 =?iso-8859-1?Q?+2DFGeitEbWTfb5mp194Ge50U2c9j+CS+8zgnFiK5EdWZ/h87BPRkrQmPo?=
 =?iso-8859-1?Q?pOpoXBWVDnAYisDZ4zcd84pi9FGKUi/OWxUzp6GhsJAnEcn99n+yxsvUE9?=
 =?iso-8859-1?Q?Q1ELhiIi3i2RfAdy4B3aaK4eZ72rPuLAoy3jIBYhuhyOmi/LV/Loe8z2dR?=
 =?iso-8859-1?Q?NRsxFEW1rPu2sWMPZ2JqrkZDzRUdyPCTSvyVLj7kFM1Sx5O/0Y9fHVLBzx?=
 =?iso-8859-1?Q?iHVARR9PgYfuB4uZAThQbedFoFtlAfmfbbxaAY6GuoGHEXBdxj9GkVbTo2?=
 =?iso-8859-1?Q?Ap41TUWpJgROvaSluO0uDxVIVuOWtrAg5zt/x51Kal2ew444lX1xyLavy2?=
 =?iso-8859-1?Q?YFnur/0fBVUKI4uQLOZUIyfHarqV9SKup8ErN/IASqLyt2wIwrTsoBMRL+?=
 =?iso-8859-1?Q?+cCaUR1hXEpKYwvSsrhPejJz/jpO6wVAP6rWKzoE46zLqYHDVLPQeCJj1m?=
 =?iso-8859-1?Q?NbHP27NyuvjoMrI0skA9KO/PZkMtsp9NN4527zqoOM34btO0gvNLA8MfOx?=
 =?iso-8859-1?Q?mLjTUTbnXluW3lZobOJP4nVvEtwMn/WcZHbXoK4wYSTb53S2BFfI8MFlBe?=
 =?iso-8859-1?Q?81PekNtt6MJHBxaQ2Aw4bocZz2DtRwN7y31OopKPTXflvxKq7AA36i4gnG?=
 =?iso-8859-1?Q?LaPsQVEUFEJGhSEwI63pjI5vbaDzEMZEvpp35JexsXISqjRWsAlm23aX8Y?=
 =?iso-8859-1?Q?fOkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EnPhuGwaiSVtPHOY360QTWZ4ugM+AMb6s5nER857J7pB655jct731RdvPtQDMrfNcQ2Y69d3cg9iw2XfUZcU8zfbQbcoOri9VGWgwqGFqHaLDyUhMPwl1GcV/FNljbFD1P6qXLGLBHPwSijHzltcI0KvATzwWW+oWW8TZ9CV1dY8zsinJOkwJW/kB8dCBch2hzVSVUcZJeRmse18GO+dEPvvxpIjZAHMAC0Zx7xRBj4Tv9LHzVkL3+dox491VHWOum7siCTJrkccGktJE2RjsXaicj5VdVqwVme5PYXC0c5vA5hFxMAz8zSYBgG2CCL73eDtypBtvT8umWOAvZhAMykJqjmK6mwZOJvTctBMO6a+l+2v+lM4Ut8Xk5cCDwvz1QRNbwcUg4Wrp/nkOEkjOCfh0BoNyDnzqkP2oSVozgOMbjtumRHz31auectPZcZE
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:31:46.8557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6c8dbb-4e7b-4b4e-ae1b-08de64cbac91
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8610
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,suse.com:email,darwin.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 15F8FF4A5A
X-Rspamd-Action: no action

Hi,

With Roger's patch removing the need for GNU sed, it appears that
compilation is also working with Mac OS make.

> On 5 Feb 2026, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.02.2026 12:33, Bertrand Marquis wrote:
>> Xen does not currently document how to build the hypervisor on macOS, an=
d
>> there is no Darwin configuration for selecting a Homebrew-based GNU
>> toolchain. Native builds are not supported; the hypervisor must be
>> cross-built with a GNU toolchain and GNU make/sed.
>>=20
>> Add a minimal Darwin.mk which selects the GNU tool definitions used by
>> the macOS workflow and point to the build guide for required tools and
>> setup. Document the Homebrew cross toolchain and GNU tools needed to
>> build the hypervisor on macOS.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> config/Darwin.mk            |  6 ++++
>> docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
>> 2 files changed, 72 insertions(+)
>> create mode 100644 config/Darwin.mk
>> create mode 100644 docs/misc/build-on-macos.md
>=20
> I'm sorry, I should have paid attention already on the RFC, but: With all
> other Pandoc files in this directory being named *.pandoc, do we really w=
ant
> to have an outlier named *.md there?

Right but this might not be needed anymore as the only thing needed after R=
oger's
patch is only a toolchain so brew is one solution but there are a lot of ot=
hers.

>=20
>> --- /dev/null
>> +++ b/config/Darwin.mk
>> @@ -0,0 +1,6 @@
>> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU t=
ools.
>> +# See docs/misc/build-on-macos.md for required tools and setup.
>> +include $(XEN_ROOT)/config/StdGNU.mk
>=20
> Given Roger's consideration towards possibly using a more MacOS-native
> build arrangement as an alternative, I'm actually not quite sure this sho=
uld
> then be the default mode here. Roger, what are your thoughts?

Even with Mac OS sed and make working, something is still needed here to=20
compile on Mac OS.

What would you suggest the default mode should be here ? Mac OS is not GNU
but everything used correspond to what is defined by StdGNU.mk.

I am only forcing cross compilation here to prevent using the host toolchai=
n.

What do you think i should put there instead ?

I have been keeping that downstream for a while, it is kind of sad that peo=
ple cannot
compile on mac os just because of this file missing.

Cheers
Bertrand

>=20
> Jan



