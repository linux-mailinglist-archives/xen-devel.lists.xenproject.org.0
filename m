Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA21AB5778
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 16:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983002.1369378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqri-0002LI-JX; Tue, 13 May 2025 14:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983002.1369378; Tue, 13 May 2025 14:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEqri-0002Ig-Fy; Tue, 13 May 2025 14:44:18 +0000
Received: by outflank-mailman (input) for mailman id 983002;
 Tue, 13 May 2025 14:44:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rp1i=X5=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uEqrh-000280-6z
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 14:44:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f403:2614::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be7ac4e4-3008-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 16:44:16 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DBBPR03MB10343.eurprd03.prod.outlook.com
 (2603:10a6:10:53b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Tue, 13 May
 2025 14:44:14 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 14:44:13 +0000
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
X-Inumbo-ID: be7ac4e4-3008-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTvwUvzlv74lvGYoV139le4+snn0Og8kOdo0oOB39TP4vXS2l4BbLerJ6ax4gCXqkcbiuqPq4qc2PhGjpT3+xAPueVa94cmRdihFQFu/dl2+wKwLMcm73GUuxyY055swN8BmzFVxgD3yRkm5apiY5lJvjTRDylNykjPedgkTbTcAI8edkSgSB4Jz3zufhf132AypAXFYqlhDlROO7srejM/HOWLhspBiogGLhO0iNJ3OY4rSJZA7ZzANqXEPk9Eh1Wqd4wAkpsQZicqA2nH4c4PqeCHVfCQJne1fq6Dr7EHmHSJpSyVOTAA3aKxi2EYiT5hu7FTV3lGaYkP8XShNpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvsUbw6ZWIkiwoWdJV8DBzxgo1doyQWkVTwGoW/fpWo=;
 b=qs32OIO7yJ1Q1rAstxKtqusE/RWc8kv+132lIK4bWvpGsk54FZ312zkxZSwXiDiBO69YI32saqzV+QjR0GitO2GHNe1NTp8XfyPJ19mmSDfVPZTaizQW0t5KYwjnVofp7HRQhQXzxWGv+Al+Io3/TLgjVE87csNZqyi83LuUvi7+EB2i3bz8m9baQS1zy2cLT9ZZP4B1IjGeYc06uI/J4Amj8yDpnzsyR4YwafyIlnla1JDxuP6GYRXx4aRdlIjoElsp1ujw0oMzq3tZs2EmKLanVY7fCUpiNbkZFdoSBA8UcbdXxmPIfBRTuks3cVr6VkQg5HXsqJUyHdggbPSWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvsUbw6ZWIkiwoWdJV8DBzxgo1doyQWkVTwGoW/fpWo=;
 b=uO6pxWqSHANrOkX2dbrqrwoTTgAzocgNhzNnoC2ZPt6kLRQD81mI8r/rtG0+mL4wY0ftaouSrMgmgzb3qjY0UPP1097vHB+OJUhz+j9AsE2T4NHXjcxlCY3a/jv4vhebF7zf9on1q0IJ6mIUKwlRNhKVaXcBuw/53sIR0cBuJ2ybRd6ZJUIrlFBlRiNYztYQsuTec9JDFPb4ae9GK/RuazaZry0AOLhWVWwO5ww6+Wi+AT/i+kdHt5Nrvb2oc8hiFkHGEezoc7yGf+jpriVkFeveoPAtcVjoJmM7q8wsfqmWhwaOGxOk0+JZQUhsz8thVCdlCnstOvDgE6BdVOwePw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Topic: [PATCH v4 4/4] xen/arm: add support for R-Car Gen4 PCI host
 controller
Thread-Index: AQHbtD/+f1IljlTzAkG+gkmGFEbJELOzM/oAgB2OgoA=
Date: Tue, 13 May 2025 14:44:13 +0000
Message-ID: <834e50d5-977f-4a41-9184-06605c8de191@epam.com>
References: <cover.1745402473.git.mykyta_poturai@epam.com>
 <98c8e00a77800e8b1163ab1efa9a60f1bced0fb9.1745402473.git.mykyta_poturai@epam.com>
 <3d2555d7-83c0-438d-8d61-ac622a662384@amd.com>
In-Reply-To: <3d2555d7-83c0-438d-8d61-ac622a662384@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DBBPR03MB10343:EE_
x-ms-office365-filtering-correlation-id: 892d7d1d-a56c-44dd-f174-08dd922ca146
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1lBZGQ2cWt3M3NYVVR6MEJYOTJDdVFOS3hhalJvL0s2c1phQ1c0M0xKRWhX?=
 =?utf-8?B?K3dteGNJcnVvMTZsaHV6UE1YdndTNzlFUHV4LzZhNUFSVkhxZXE4bW56MmRH?=
 =?utf-8?B?aDZOZG4vbFY4eUFwR3BEaElKc3N3NnlqdGlUT3JheEpwazZERmFqdzkxaWNW?=
 =?utf-8?B?TWo5ZHErT1Q3RzNNZ3ZuSXV5RWVGUjdwQ2NjWGFCazlPU3puWmU1SFhBOGpO?=
 =?utf-8?B?cmpwQTN0R2hwdzRkMEh6bE51aUhCSXk2ZVFLQUQ3QVJuemZqV0c1Yy9zT3RL?=
 =?utf-8?B?VjBVN241azR3QlljN29HMlU1NlBQSlNLK1FBNUdMUDhZNlN1TytJNjNJL25K?=
 =?utf-8?B?VklZaDVOOXlPV2JDWWxmM3kxVVF0SXBsV0VkUVlKc1g3NUZpaHZQUmJiZFE4?=
 =?utf-8?B?SGR5WVZtdEl3Vi94aUxrdlNUNjVnN1M1L2dzN21Od2U0MEF1ZXJYNnUzLyti?=
 =?utf-8?B?aVpaL0xweXRwR2NNbE5yNlhiS2RTL3B1V1hvdUtiMlp0RXZYb3FVSDBRN1lD?=
 =?utf-8?B?RzhLV1lwSHNKeUlqYXVIY1NHL2NLSzBJbWgzTFNTRGJGc2F5R0dJYTVOMU9L?=
 =?utf-8?B?SGdDbEpLN1ZXSXdZS2lXNFdnODJvZFMwc0lvUmFvdStBQmgzVFZsckJ3OGZM?=
 =?utf-8?B?am9Oc2dJUlVYbTV2U29XMU8yQ3pvZys5T21IZUJIbjBoNjlHNisxN2FvV0dp?=
 =?utf-8?B?UFYySFhzOHFoeXlocmxCekVFekNHY0QyaTk5UmFEcDZleGhvUVpMdE1nN0lT?=
 =?utf-8?B?SHBwZ0Y1RVQxM3ExR3NuQWNqZ0o4RXNISytVZmphbEtRKzVnUGwxd0RMVzlO?=
 =?utf-8?B?TlBibmJMRXJIZFdnRXBzY2crenJCbmNsdGw0SDBubmxtaEZPYVhvSWFuWVY4?=
 =?utf-8?B?Nm9NZVNlN25FM0orTnovUk90VjQ0ak9EYis4TDRiT2Y0RmZ4TVNpZmdvbEpK?=
 =?utf-8?B?YXMycXVELzZQQTdiZUxCekp2b3Nza0VsRFJzWWpTbUE1UVFkbzN4dzVmS09r?=
 =?utf-8?B?QmlHVHFZaW8yaXE3TmovSnFqbkkwMy8wTG1DY2FuSWtsN1ZEaWV3a0d2TTd6?=
 =?utf-8?B?ZUdKUnN1NkkvU0lCRnF2NkErZ3BCbmducHRCamRMOTg5ajB3N08yNjg4Y3V2?=
 =?utf-8?B?bm45UU1GOVRBdE5rZ092K2l6U3dTTnhLRUZobmpHS1h0Q2NSNXlIb3Z1c1ZI?=
 =?utf-8?B?VWdqZ0txYUxrK1lMeDhDSHR4cEZ3N0RESjNUL1ZORWtvMWlwdU1PNEx2Q0hr?=
 =?utf-8?B?bjBaMEJEdkhkVFcwaWhwQkVUdDZkdFRla0Q2WVpaaUhEUFI3R2h4OG1vdlpX?=
 =?utf-8?B?RHJYeUlKVHJldng5SkIvVVQ0SGsvWWJnVHlkNmlFSU5KVEJDS0RYeENqczlG?=
 =?utf-8?B?L1BPRU9tOWc3SGlGWi95LzBveVlUZ3B0MWRtSWFTL0pqU1RacHVzU3U3a0N2?=
 =?utf-8?B?YzhOUEQrVWRvWkNpQkttWFQwRjluT0tSOEZicm5OSG81Y2Vqay81SENUMXBl?=
 =?utf-8?B?NVRvblFkcjB4SVNMTHVEUFB0b0VaODYyTXE5MWNUV0lKSXZBU0NrOWtWUVQ0?=
 =?utf-8?B?dS8za0l3U2NIbkpxZ2pjQkJTVUVUZmVqSWttN3kvQlB2UTJJSEh2bzMxZXNO?=
 =?utf-8?B?THJBYytqZ3lVbVBRU0ZTcU9ZdE5SYlVuNklnSnkyZkQ0eW9NemFjR1VZWU1j?=
 =?utf-8?B?aTNmYmFuWldtb3pMTDBPU3BrVWxjY2ZtT1I1cXJJZVNkeU43T1F4MU5aZDM1?=
 =?utf-8?B?dHRCY2d1akFMQ2k3NHdvRExpZHk1RHVmaGxNM2NVdHVWVkwvbFJQWS8wM05j?=
 =?utf-8?B?K25YeU9jT25RbzVXMm9RZTlacU96UTNmSWpqZUZpY2RTR2lIdGdsUnV0OHAw?=
 =?utf-8?B?aU4wa1lhNEM0RGhHS05SM2kxaVcrdTZWVUZWeDZiLzdDZHVkZERGK01VTWVB?=
 =?utf-8?B?TjN4dVBkT2p3WHlCNXVaUEpBRUpDcHVqTUwvWmMyNldoSTdPbDZwREV0Y3E5?=
 =?utf-8?B?S24zeEhlbVRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M2RlVlZzQ2lHN3I5SlFZM2JDUmUrVU91QkoyaVc5bHJxRERQbXdCZ3RjYXRG?=
 =?utf-8?B?VFNBNkxsSFhaMVZDTjNZbnllajZHdjZVSFhaZHJhczdNcEJUS1RpVVpwbFE3?=
 =?utf-8?B?Q0FuZDdDd0hybzRXREZsRThWZWhzejFvZEdqMmM3eXlvd2tZbUMyVTlZSWtG?=
 =?utf-8?B?NHVzaFBNSFg2ZGcwZHJEbldYM0VRQWg3bGlvKzJXU1lLcDlTbDZFak9vME1H?=
 =?utf-8?B?eDl3UXlWZUU3c0NBRnpVK1E5MVVqR2xMd2ZOL05NTWVUSVowd0h5bXBXWnFW?=
 =?utf-8?B?TmM3R3lHcm00QWlDTXBqYWxNb0NZb294cDFIOGxhTnVodWR1cVBSUExPVFdv?=
 =?utf-8?B?TW9tWmgvNTZuMjBSaXY2dG9ITUpOMERMKzM3cDliN1BhSEQ2WlJOdExqNzla?=
 =?utf-8?B?OGZjaG1YMmdleDdNSVZURHgxSkxoSDZyWUZDMnRIRlM4UmxpOFVnZEZtbGFS?=
 =?utf-8?B?K3F4Tmowell0dzNudTc1Tk90MTl6dHN1aitrOXJCbFJuR1ZJWjBvdWJpN0FP?=
 =?utf-8?B?eExhcCtFY21VYlZ4d0NOdDhDZFdGTm5tc2VITmloSG9naVJKbGVnOGlETUsw?=
 =?utf-8?B?eG5TM0liREdqY28xQktsVjFDWEpYUThyc0NIUHVDMzY1c0VZeHh0Y3JNWm83?=
 =?utf-8?B?bThXQ1ZYMFVCdWpja2lSRHVkaFVIQ3lZdGxRUWhlNGs0VWZUaDV3ZERHWFlG?=
 =?utf-8?B?a1grZUhEeDNmVnRGeFZDd1lmVjBkOGI2b3NYT2RTTUtkTmw0M0EycXpYNFJW?=
 =?utf-8?B?RE5ZU0V4TTF5Q3lMWXJ3ZTA1WGR3eHpLL1dVdm9XdzhzZ1VSZ3orckwrZ3hs?=
 =?utf-8?B?U1NWeU4wa2lPalMwb3NKSUJPbjhVSkFFZnFZVytndXdwV0xOcTkzcTYzRXV2?=
 =?utf-8?B?cXBHZHNmL2FiZzFTL0lxdEdEdW1CSUNwSkZCTGo5cFpuMDluK2MvVkhiUWpo?=
 =?utf-8?B?Z3h6WmFLd2ZIamdsRklhZzE3QTM4OUJzQ05HT3JVNjhCaDMzaFBOU2NUSFg2?=
 =?utf-8?B?bS9HSlJKL1NmTi8vck1KY0QrVnJWUUpneWJCOUNoSTZNYmp3cnNLbzVUSnhm?=
 =?utf-8?B?K3IxclBGeDBmYWY5SmV4OEN1UDIzNzdWU1p2SUhvMzlpSFNJZlkzRTdEMDZO?=
 =?utf-8?B?eXgyK3Byc005UDNyS25weHZ6U2wvekZLOHJNM01nRDl4RjN4UjJvV0grNWRM?=
 =?utf-8?B?K1BPaCsxeXJQd0tPUFFRVFV5bHo0M2lHNVp2QmRsU1hGcHZ3aTJwOWVqWEVS?=
 =?utf-8?B?cmozZERtRjVZN21ra25wR04zM1l1WFJHbDFuQWZGWEZJVURsTi9qZktMY2Y1?=
 =?utf-8?B?MnRJWTZOMm5BQXpnVjMvZTB4QlVyWDUzODlNSlBqUFhLK3NiNm5La25NOE1S?=
 =?utf-8?B?L1htVUJhNW5WSVltL0JHL2VoTHNrR2FzbGh3aTlNSWFKN1Q5MlFtSWcwdVhn?=
 =?utf-8?B?K3djQmh0NFM0N3J5UGpiays5RzRJbkNENmYyMm1tYmpjNDhJWFFnTDRBaTE1?=
 =?utf-8?B?c09mYnJ2QkRzWkNVNFJKdmliamVyUGdjU3I4MVNCQ1RWRzN4QzUwWGpGSUFm?=
 =?utf-8?B?c2lDekNvR21EKzVqSzdFUnp5elBXc01vTmo1bTZQN0p2OVJpNm5SYmh0ZnBK?=
 =?utf-8?B?K2p6VzluOFIwWkIyUmZvbHRNK2RLKzBMK0ZEbURlTkxGR0RYVU0wOVVISlJt?=
 =?utf-8?B?ak5abjEvOWwzUHIvYzdsZ3pwYkZYMmZ4bnZFMWFrU3FtUnBzb3VyOXllWkNH?=
 =?utf-8?B?VE94ZGNraE5xZFpYZENYNW5CbEliOXFUN2NkV3JHcjUrazBqc3l5eDFKckE2?=
 =?utf-8?B?VWZic3VyMjdtZVBYSExxTEpCajN0S1puSjRmTE52OTRhNDFPaDdQQ1JRdENP?=
 =?utf-8?B?OENXajBuRmt2OEhjNmJMS2VwaFRHTE9mUTdwbzZhZ0kxYUM0eklqblY3VXhL?=
 =?utf-8?B?aEdWaWF5cWw4elBBY21kSTlkNXNmWmM3d2o3QTJFSERyZHJzSlFmenloRFVR?=
 =?utf-8?B?TmZvaGJyTXVWZG9EODJZYUYwc2hXWVlJMDJJTDRsQ1JTamVKSGdOWmhpQWRh?=
 =?utf-8?B?dWhQSllncmFramZBRFZKVitVeGp0K0x1TGZpWm8zK3FvNm1LZ1lNVlNYUTgr?=
 =?utf-8?B?Y1k4am1WQTBQNTRvMlNwdE5oWVFUSnc2N0VhUFpsZ3dac0tHRjJwY0hGQnp5?=
 =?utf-8?B?MUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB5661D7B418514DBEA2071C26326BF5@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892d7d1d-a56c-44dd-f174-08dd922ca146
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 14:44:13.8280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMpelzSrli6ZecAWcJybSi9G/WuhsEvE2uMH04WJ4AhJLzhpOwlYRwjK8VB83yArKwdayeoPrifGGH9YWlHiUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10343

T24gMjQuMDQuMjUgMjI6MjIsIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToNCj4gT24gNC8yMy8y
NSAwNzowOCwgTXlreXRhIFBvdHVyYWkgd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQWRkIHN1
cHBvcnQgZm9yIFJlbmVzYXMgUi1DYXIgR2VuNCBQQ0kgaG9zdCBjb250cm9sbGVyLCBzcGVjaWZp
Y2FsbHkNCj4+IHRhcmdldGluZyB0aGUgUzQgYW5kIFY0SCBTb0NzLiBUaGUgaW1wbGVtZW50YXRp
b24gaW5jbHVkZXMgY29uZmlndXJhdGlvbg0KPj4gcmVhZC93cml0ZSBvcGVyYXRpb25zIGZvciBi
b3RoIHJvb3QgYW5kIGNoaWxkIGJ1c2VzLiBGb3IgYWNjZXNzaW5nIHRoZQ0KPj4gY2hpbGQgYnVz
LCBpQVRVIGlzIHVzZWQgZm9yIGFkZHJlc3MgdHJhbnNsYXRpb24uDQo+IA0KPiBJbiBhIHN5c3Rl
bSB3aXRoIGRvbTAsIEkgYXNzdW1lIGRvbTAgcHJvZ3JhbXMgdGhlIGlBVFUsIGFuZCB3b3VsZCBk
byBzbw0KPiBiZWZvcmUgaXNzdWluZyBhbnkgUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkIGh5cGVy
Y2FsbHMgb3IgUENJIGNvbmZpZw0KPiBzcGFjZSBhY2Nlc3Nlcy4gSXMgdGhhdCBhIGNvcnJlY3Qg
YXNzdW1wdGlvbj8gSWYgc28sIHdoYXQgaXMgdGhlIHVzZQ0KPiBjYXNlIGZvciBpQVRVIGluaXRp
YWxpemF0aW9uIGluIFhlbj8gRS5nLiBpcyBpdCB0byBndWFyZCBhZ2FpbnN0IGENCj4gbWlzY29u
ZmlndXJlZCBvciBicm9rZW4gZG9tMD8gRG8gZGlmZmVyZW50IGlBVFUgc2V0dGluZ3MgbmVlZCB0
byBiZQ0KPiBhcHBsaWVkIHdoZW4gcnVubmluZyBhcyBhIFhlbiBndWVzdCB2cyBub3Q/DQoNCmRv
bTAgY2FuIHByb2dyYW0gaUFUVSwgYnV0IGZvciBndWVzdHMsIHRoZSBwcm9ncmFtbWluZyBzaG91
bGQgYmUgZG9uZSBieSANClhlbi4NCg0KPiBGdXJ0aGVyLCBpcyB0aGlzIGRyaXZlciBzdWZmaWNp
ZW50IHRvIGluaXRpYWxpemUgdGhlIFBDSSBjb250cm9sbGVyDQo+IHdpdGhvdXQgZG9tMCBpbnZv
bHZlbWVudCAoZS5nLiB0byBlbmFibGUgZG9tMGxlc3MgUENJIHBhc3N0aHJvdWdoKT8NCg0KSW4g
dGhlIGN1cnJlbnQgc3RhdGUgbm8uIFdlIGFyZSBwbGFubmluZyB0byBhZGQgc3VwcG9ydCBmb3Ig
aXQgaW4gdGhlIA0KZnV0dXJlIHRvZ2V0aGVyIHdpdGggWGVuIGRldmljZSBlbnVtZXJhdGlvbiBi
dXQgaXQgd291bGQgYWxzbyByZXF1aXJlIA0KY2hhbmdlcyB0byB0aGUgYm9vdGxvYWRlcnMgdG8g
ZGVhbCB3aXRoIHRoZSBpbml0aWFsIGhvc3QgY29udHJvbGxlciANCnNldHVwIChjbG9ja3MsIHJl
c2V0cywgcGluY29udHJvbCwgZXRjKS4NCg0KPiBUaGVzZSB3b3VsZCBhbGwgYmUgdmFsaWQgdXNl
IGNhc2VzIElNTywgYnV0IEkgd291bGQganVzdCBsaWtlIHRvDQo+IHVuZGVyc3RhbmQgdGhlIHJh
dGlvbmFsZS4NCj4gDQo+IA0KPiBkd19wY2llX2NoaWxkX3ttYXBfYnVzLGNvbmZpZ19yZWFkLGNv
bmZpZ193cml0ZX0sIGFuZCB0aHVzDQo+IGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHV7X3Vucm9s
bH0sIHdvdWxkIHBvdGVudGlhbGx5IGJlIGNhbGxlZCBvbiBldmVyeQ0KPiBndWVzdCBQQ0kgYWNj
ZXNzLCB3aGVyZSB0aGUgZC0+cGNpX2xvY2sgbWF5IGJlIGhlbGQuIEl0IGRvZXNuJ3Qgc2VlbQ0K
PiBhcHByb3ByaWF0ZSB0byBoYXZlIGEgYnVzeS13YWl0IHN1Y2ggYXMgdGhpcyBpbiB0aGF0IGNv
ZGUgcGF0aC4NCj4gDQo+IElmIHRoZSBidXN5LXdhaXQgaXMgbmVjZXNzYXJ5LCB0aGVuIHBlcmhh
cHMgaUFUVSBjb25maWd1cmF0aW9uIHNob3VsZA0KPiBoYXBwZW4gZHVyaW5nIGluaXQvcHJvYmUg
KGFzIHlvdXIgRklYTUUgbm90ZSBiZWxvdyBzdWdnZXN0cyksIG5vdCBhcyBhDQo+IGNvbnNlcXVl
bmNlIG9mIGd1ZXN0IFBDSSBhY2Nlc3MuDQo+IA0KPiBTYW1lIGNvbW1lbnQgYXBwbGllcyBiZWxv
dy4NCj4gDQo+IA0KPiBEb2VzIGlBVFUgY29uZmlndXJhdGlvbiByZWFsbHkgbmVlZCB0byBoYXBw
ZW4gb24gZXZlcnkgZ3Vlc3QgUENJIGFjY2Vzcz8NCg0KSXQgaXMgcG9zc2libGUgdG8gaW1wbGVt
ZW50IHNtYXJ0ZXIgYWxsb2NhdGlvbiBvZiBpQVRVIHdpbmRvd3MsIGJ1dCBpdCANCndvdWxkIHJl
cXVpcmUgYXQgbGVhc3QgYSBmdWxsIGNvbnRyb2wgb3ZlciB0aGUgUENJIGhvc3QuIEZvciBub3cg
d2UgYXJlIA0KZG9pbmcgdGhlIHNhbWUgYXBwcm9hY2ggYXMgaW4gTGludXgsIG9mIHVzaW5nIHdp
bmRvdyAwIGZvciBkeW5hbWljIA0KY29uZmlnIHNwYWNlIGFjY2VzcyBhbmQgdGhlIHJlc3QgZm9y
IHN0YXRpYyBtYXBwaW5ncyhjb25maWd1cmVkIGJ5IA0KZG9tMCkuIEJ1dCBvdmVyYWxsIHRoZXJl
IHdpbGwgYWx3YXlzIGJlIGEgbmVlZCBmb3Igc29tZSBkeW5hbWljIA0KY29uZmlndXJhdGlvbiBi
ZWNhdXNlIHRoZXJlIGNhbiBiZSBtb3JlIGRldmljZXMgdGhhbiBmcmVlIEFUVSB3aW5kb3dzLg0K
DQpJbiBwcmFjdGljZSB3aXRoIGFsbCBvZiB0aGUgaGFyZHdhcmUgd2UgdGVzdGVkIG9uIHRoZSBB
VFUgYWx3YXlzIA0KY29uZmlndXJlZCBpbiBvbmUgcGFzcyBvZiB0aGUgd2FpdCBsb29wLCBhbmQg
dGhlIGNvbmZpZyBzcGFjZSBhY2Nlc3NlcyANCmFyZSBub3QgdGhhdCBmcmVxdWVudCBzbyBpdCBz
aG91bGRuJ3QgaGF2ZSBhIGJpZyBpbXBhY3Qgb24gcGVyZm9ybWFuY2UuDQoNCj4+ICsNCj4+ICsg
ICAgLyoNCj4+ICsgICAgICogRklYTUU6IHdlIGNhbm5vdCByZWFkIGlBVFUgdW5yb2xsIGVuYWJs
ZSBub3cgYXMgdGhlIGhvc3QgYnJpZGdlJ3MNCj4+ICsgICAgICogSFcgaXMgbm90IHlldCBpbml0
aWFsaXplZCBieSBEb21haW4tMDogbGVhdmUgaXQgZm9yIGxhdGVyLg0KPj4gKyAgICAgKi8NCj4g
DQo+IElzIHRoZXJlIGEgcGxhbiB0byBhZGRyZXNzIHRoaXM/DQo+IA0KDQpXZSB3aWxsIG5lZWQg
dG8gYWRkcmVzcyB0aGlzIHRvIGVuYWJsZSBQQ0kgc2NhbiBieSBYZW4uDQoNCg0KLS0gDQpNeWt5
dGE=

