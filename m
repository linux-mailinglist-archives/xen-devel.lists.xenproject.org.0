Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D90FBCAFAE2
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181448.1504493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvGa-00065k-QB; Tue, 09 Dec 2025 10:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181448.1504493; Tue, 09 Dec 2025 10:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSvGa-00064J-NI; Tue, 09 Dec 2025 10:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1181448;
 Tue, 09 Dec 2025 10:48:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rha=6P=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vSvGY-00064D-W7
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:48:23 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93e6141e-d4ec-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 11:48:21 +0100 (CET)
Received: from AS9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::15) by PAWPR08MB9781.eurprd08.prod.outlook.com
 (2603:10a6:102:2e6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:48:12 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:540:cafe::7) by AS9PR01CA0005.outlook.office365.com
 (2603:10a6:20b:540::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 10:48:16 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Tue, 9 Dec 2025 10:48:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PR3PR08MB5819.eurprd08.prod.outlook.com (2603:10a6:102:92::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:47:04 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::b27c:9593:1074:949d%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 10:47:04 +0000
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
X-Inumbo-ID: 93e6141e-d4ec-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kDK8vclbXjDRh+S3gi7g8BesS6D0y3FWsKEh6xz6MQNgOstEqHgjateXK+j7p0aa/Af0zM/ljYVEz+bJ3nA7wWWXfsgr2a57T9gemgcb4At4DaaTjib7gp6BQiXJLMsE7S1flEy/aNb1GfboFwr/kP8eYTSpe4QVMfHL/RxfqyZ1GWBIu5mSsA9anoTrz1u3rKAOzLBthmxX8o1RmBhhl9XqddRkmPef8fX3asZB+lRs7GjIsZxwHquSHT1YXL1xb8TYq9RgAXQTPKaLT4uAzQEtUDMzU6IOJadMoiL49y9CxZqi/dVn3fLCUhXaSEQK/WBXdERlO5A0beGmb6bcXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9KoBxccSWB3/hnf1bKUsSDoEfA0C6+2JdJw9KFyMkM=;
 b=HVyUJzVToVX1zhhpmxE1MWbPgTc+4UFoa3/QkLDlap7hT4g1JqhaSeQBFCksXbAYYcYlVtsKV2TS4Zf1b/WV1k68x2EGNl2DhA5rPXotskOmRt/hKS2TLFCHiIiWTrX8pWX8tW4q+aMZFWh9tMuHwLK2WiOQ0uWWt/s2g704+fW2+4ppUrezElaY7ysR3VETJMDa+JrAL4Muyh9nWtRCDEyVw1PlDtBrEbLXsJp3rpmfNN1Ff9GKp2G1AoOZ5LsmPn7thHqKdMM14kzVc3OJWA/3nndHy0Vo5hl5Nx+SeVZt9fN3BaNAgZnHvBfvP2AHlRldabj8cw/ka+MxUuvpCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9KoBxccSWB3/hnf1bKUsSDoEfA0C6+2JdJw9KFyMkM=;
 b=op45+4twmf0h5pQM/UqAFmCCvIFtZqrmeZKOZ/siC2GxgkHkF0LiMURwCPTNCZULGdDl/WKs0YA7hNB6oPTMyqixxRpLqtk6GPfRKQJ3S77bCWn48Txqpj9aWAidJN45H8NJVokrgvx8oqt8dLX1hI0qbjvLyztxwork/tyEiLE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKiCGLPjtGmjTTuUuZMmlVkRwf4/jKMKHo66xqrELLfY1LQJNKq2OEBaQUX3kICauLQA8nNXhr6uJmZXJo3VoW69zVo75C44PfvXvpNui0f8tS33qxRwN/7iVxRmgrYFHpq5IyL3RiDLwF6NhoGdIuQ9jb8U2l3mrold+O/SYVAaU7v8GGODPszXMBNDoYwgV7n+L8F+XjLaSA1zDWct3lxpxSI9rOLpThGNwr803jUsXfKSysTh2tEcQ9pJpfrBfvg2B/PdNDof3jYjIQivJIwgjfw/kAib9TLTN8IaumswTQq/+XP0gNPdcHigFhZ/6iyGB6d25C0wGbUJPdlJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9KoBxccSWB3/hnf1bKUsSDoEfA0C6+2JdJw9KFyMkM=;
 b=oXbq13Db6hewKFB/VT6pyUWUa0aQ8r5zFTOZbzUW87DW/spUTLTIXNPtMiuM+YZiHqPfnyXNHByZfmwj+jM8E08H7rx+6tEBhIPcRBWdXIA3Rsbwzmzg2ud36vtUpKCHF0+zaLXo/rH+ZTMEkYWcNDBeRe+i4feJXpUou6ZUqaLgNnaEf9AO79Wk79iwRNWrQ+WZA2GoibZ878/FDqjL8rfwCRLB0avDTC+KBYxe3nhr3ahhQ45pjCWCzJuT1UYLoG2zFjjK6zo3ubP+ptkWulTi/j+NAfhsUJwZ6VfjeI7xcie+bCyPvKO8c4s+JQGCOP+RnAbUn0kofQHbQECnYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9KoBxccSWB3/hnf1bKUsSDoEfA0C6+2JdJw9KFyMkM=;
 b=op45+4twmf0h5pQM/UqAFmCCvIFtZqrmeZKOZ/siC2GxgkHkF0LiMURwCPTNCZULGdDl/WKs0YA7hNB6oPTMyqixxRpLqtk6GPfRKQJ3S77bCWn48Txqpj9aWAidJN45H8NJVokrgvx8oqt8dLX1hI0qbjvLyztxwork/tyEiLE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Topic: [PATCH] xen/arm: Set ThumbEE as not present in PFR0
Thread-Index: AQHcaPfxR2UFZeCxt0WCBuHK00zE1rUZHyaAgAABLIA=
Date: Tue, 9 Dec 2025 10:47:04 +0000
Message-ID: <BEB23694-3E52-4073-9C5F-95666BDE09D2@arm.com>
References:
 <b9e9ec4a393b34b8872a87335db2bde707973c0c.1765276607.git.bertrand.marquis@arm.com>
 <e40b3fba-5ca3-4ab5-9cb1-f285480187d6@amd.com>
In-Reply-To: <e40b3fba-5ca3-4ab5-9cb1-f285480187d6@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.200.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PR3PR08MB5819:EE_|AMS0EPF000001AE:EE_|PAWPR08MB9781:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8fbb7a-e1fb-495e-2131-08de371072f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Ertzk+qCMN7CRVUux8BRN84b0a95gpCnAZHn2R7zpVrB5eBYieBGVhqZZmR8?=
 =?us-ascii?Q?vE6hW4/XIFFRVKuJtWEALa9kwuMSDZsnzWgXBBYQR6N3SwtimlGSIqT3SFsX?=
 =?us-ascii?Q?9rdC9j74BDWRG9WJbwQXc0TqIMCabS/sUl4ivJsynGBXd29aN+6OHTfER6n1?=
 =?us-ascii?Q?vvqFx7CkneHJk+GgP3oIkfitXbjZSdHLKa+BPQlLa7XIGtUskWszQwN/LGub?=
 =?us-ascii?Q?p2K2GnutskVkOGrqYb/lcQDBd8XNdwlD8Ezmnnh7wbNK97uf4F/rqu9GcHRn?=
 =?us-ascii?Q?cFyWm+Nm7L9FiqbVxkSqLsuPzXEGy/fQEjmr83sbkykriF451I4eam2DqyUe?=
 =?us-ascii?Q?KkrQu0e7VFnW5FwM1kyb8ufLCHoBbmCq3bl039wp4i+SupHsDkylWlkCp8hL?=
 =?us-ascii?Q?AxQEM5mbJ0ayq63lEmRVqUD+mwdrCWBIIrNwsllQPueoSxLoLFb+uAkPeDX8?=
 =?us-ascii?Q?M9tYnrytGrChDmOqsDtpS6ne6VwmrewVoWCHONi//unMyBb7IVufMVYQ/x9z?=
 =?us-ascii?Q?fjbWKxn4eMpYwdo2C2Eo3GecJ9GevxFnm2iTc/QCZ8a4EPhnyXkwrXVZXYYJ?=
 =?us-ascii?Q?oPRolKMRQWOdtTbpDEzGJu463ebkEBb7f/jq5l8L7BU0AAobDWISlWctFgda?=
 =?us-ascii?Q?6C+7zskK87kZQZNvKy3OqRMMyHdcpOTMy++8TO4bLa7CbOHQ91RIVAAZikpW?=
 =?us-ascii?Q?/gCM6ZIxeRyEGPigswbsMTbi2vP5LyNiKdf/oPMsjaFHVx/p+u8o7brDBxA9?=
 =?us-ascii?Q?B+hiZNKKFhThn6MaQqC0x0dl8ZS3oMOQBUCyePKfOzRZ1MRtpZtKs4VZ8tkO?=
 =?us-ascii?Q?qSo+LTRUS1JpGe9epfsKM6yXssKwsESbj3ojnyUf1gl9KVmG1tQ8+490SkTP?=
 =?us-ascii?Q?kPLzEjUNiDslJemoI4j21Rm+MIwojDZa+LO0+H32uM/6YS84Ad6jj6HDAqKu?=
 =?us-ascii?Q?r5ecuOFuHYA3xHQRG7OsaPylbsWZHFniHGH7VlzwuoNQ0HLZRydJYzbboAsl?=
 =?us-ascii?Q?A9QtiWKkczzyEeR6dc0XCwRv4AQ5CG5WCEH4L4N2hRuJ5BLgtVAATtUoKhQ/?=
 =?us-ascii?Q?KX4X3KZNquyNJ3Nlps/aUWplE+r4954bDg0vX7TuTHb4ojyT3FmGoAL1Uiql?=
 =?us-ascii?Q?s1NokmCB0mNhJlORHH2yhKVcLQZmjlpIO4pYvWWI4AnX0E+5PDMVUcArQT02?=
 =?us-ascii?Q?8Ybo/csulj5ea9p+Uw/nE8W969V5BYtk7mjQ5gzRsUtUl9JKapt9ncZqG5Qc?=
 =?us-ascii?Q?ZCdQTQS8w5SoY5slvoYgPAxKX5V72ItGTRx9fk4/X+ODseYt+KvWr37cw2C2?=
 =?us-ascii?Q?9whtLu2qNr8JJOHozWX50GOTfRHEQeypqxBhpktaBRtdyRTH3CACjSzt1oge?=
 =?us-ascii?Q?fO5rSedgpj86F9sQIVgcK1V5QOhn6QUBs+jHnE66tYlM7coagXUwryvTQQIq?=
 =?us-ascii?Q?v6kFY37Y7hcbEYQ3c13jk+Bk7jsblpxV7JnJ30rRD5XvcUoTL+l6ygMvjdLH?=
 =?us-ascii?Q?vKLOV9CuOiVt6KMmaSY3Rkez9AwKq4E+o56W?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <311B3329C63F6C458AA5D4D7A48393CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5819
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7278be17-fa76-4f9a-ff5a-08de37104a89
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|35042699022|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uxmPOQX6Kg6AlzxWpiquwHQyutOykt8xLFsHBPO3Pi2jjrgOP+V51TBOXOSO?=
 =?us-ascii?Q?3EtQTa28GT8pB055K3t3evFnesPk07JcEQTC/tQrnWw91r3cx9TCwoAbOvYi?=
 =?us-ascii?Q?1FYH3TZb6BsLhQBjpK/atTM0odZpzRs41+iSs0tI+8DoYU91KxzoQIRjdC0t?=
 =?us-ascii?Q?Y9jyO8U6qVX+WkFeLCkSBjx7O/K9cNgczi1aD36g75t6dfJIEI7VpUvvPe1h?=
 =?us-ascii?Q?JVBYDHSW11yp95/jIHzBp9hjWovmg9e2NouU7RvBCtDJID2kX6z5UuRUP9Oz?=
 =?us-ascii?Q?QrB79XqJJLAS4Egxq/F8a3zBQ3cKlx1jsN/rfvkeTRxD9aBj6wkq5Q9I2eFu?=
 =?us-ascii?Q?UBOx/E5b1AuxncUF5lyiq8HJGcT0/LKLoaj+J23id2WUR9o0EH7wEQId7Ag5?=
 =?us-ascii?Q?T2RxIgKNfTO2hWmp3khpZR0hTsvQgFC72jOl6rtc+hDyseuFZ+eiIB2QYTLd?=
 =?us-ascii?Q?6txT2x5D0QaCITCfrwMWd/wGF+v3V51mclYpwhcueg6GoHqJls2Pywb5ls/1?=
 =?us-ascii?Q?6BnMCg9A0i1xc7Vw8UO6pNdtiQo1tbQHkpkCMYzCXO8Fmv6jLzTbBBLHbGc8?=
 =?us-ascii?Q?cQiRdpysNK9yCt43zkcAlyPIGkcjTAKG46supOa2mQ/R6gBm+hL5ilv5wxzo?=
 =?us-ascii?Q?tIvfdswvjaC0SWnvPrQOwU7Cwf/UHjXJ0c3UQ+Wdsr6WiKr5v+85Pb6gbcu0?=
 =?us-ascii?Q?4DkEp1hKYZECEUZB/klFUlUGthlZg6EWzShfB9yrF+q6wFTYzNhwnqdlARhm?=
 =?us-ascii?Q?XvaJBaW97WxxOMg4vP28hhV7oWg73PCARAx9wBepOMjiw8fNzHSMoXKULXuV?=
 =?us-ascii?Q?4A3zfYlOdcZWaK5HL+LrZs9Kd3ahpzk7rk0mPYeLawA3k2p1R+A3faX06RDp?=
 =?us-ascii?Q?2N0oTZ/3mFMhKSu2NoFitE4uhIJAq3jIxvnfh9DTEawr2P1aBq1E1byqEegb?=
 =?us-ascii?Q?qhfwKtTqDxNhCIlF+FAZJY2Fvboj5hrubfv2o9X5FuJSbXkjZBcSy5lfuEZU?=
 =?us-ascii?Q?zToRP/u0wmDkQrV4IFNcz43twhmsC5+egIUrb1DAQStwQ6xaMJE2b3PfjrXV?=
 =?us-ascii?Q?yIkJIXn/lkURhGPWo5++EelOE7PN24fv+y6kT5QePne+lkO5Ms4Hoaotv8Op?=
 =?us-ascii?Q?iWbSbuOLGRw6NJ4qH/Ntme1wtERTOanj382n7yyXBZajHUhrZeAkdjFhnvgu?=
 =?us-ascii?Q?EiiCf+aUP3qPqRikF12QPJJzPCWtGECMnJtSYqV5r+/hOFUsSFDT6B1w901n?=
 =?us-ascii?Q?tULO2SyZIHguR6yNKiaJdj+AJvC2z9RvBUYoZTyt4tIQDgXZfzY13LUG4o2e?=
 =?us-ascii?Q?lrGPn7lCVBocpWp/BXryhyBQPafH8/LmQ7vfKWSkfQFzXDCAnP+Nx8nL4BH2?=
 =?us-ascii?Q?lhINWlHcgdXgC0cbhJbyD8zTaesnSZjYffpJ3Y4EYGMg4r9vFDzH6nZkkQMH?=
 =?us-ascii?Q?lD9ysLIE5rO+ScYSsgL2fnK7dE6ePuQh+IFOK/B3kXFFyUl7ygHM2816JGVB?=
 =?us-ascii?Q?tdYJ3LgxBY0PDwG3v8r2gCa1yOTLhG9Kxcz1z8cSuIsaVutZ/yDXV49aM5r8?=
 =?us-ascii?Q?4WIavc/6YPpm59iZgMs=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(35042699022)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:48:12.0176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8fbb7a-e1fb-495e-2131-08de371072f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9781

Hi Michal,

> On 9 Dec 2025, at 10:42, Orzel, Michal <Michal.Orzel@amd.com> wrote:
>=20
>=20
>=20
> On 09/12/2025 11:37, Bertrand Marquis wrote:
>> Force ThumbEE support to not available in the version of the PFR0
>> register value we present to guest.
>> Xen does not support ThumbEE and will trap all access to ThumbEE
>> registers so do not report it being supported if the hardware supports
>> it.
>>=20
>> Fixes: 5bbe1fe413f9 ("ARM: Drop ThumbEE support")
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/cpufeature.c | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 1a80738571e3..4cde208e721a 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -225,6 +225,7 @@ static int __init create_domain_cpuinfo(void)
>> #ifdef CONFIG_ARM_64
>>     domain_cpuinfo.pfr64.amu =3D 0;
>> #endif
>> +    domain_cpuinfo.pfr32.thumbee =3D 0;
> Let's not split AMU section. Also, it looks like a convention here to add=
 a
> comment about feature we disabled. With:
>=20
>    /* Hide ThumbEE support */
>    domain_cpuinfo.pfr32.thumbee =3D 0;
>=20
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20

Ack, happy if you fix that on commit.

> that could be done on commit.
>=20
> Do you have a pipeline link?

https://gitlab.com/xen-project/people/bmarquis/xen-ffa-research/-/pipelines=
/2204086293

Cheers
Bertrand


