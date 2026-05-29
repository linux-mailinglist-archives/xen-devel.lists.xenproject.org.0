Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKU7BdfVGWpmzQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 20:07:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B06C6070B3
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 20:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322725.1588981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wT1bY-0003jP-Rd; Fri, 29 May 2026 18:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322725.1588981; Fri, 29 May 2026 18:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wT1bY-0003i3-OS; Fri, 29 May 2026 18:06:44 +0000
Received: by outflank-mailman (input) for mailman id 1322725;
 Fri, 29 May 2026 18:06:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wT1bW-0003hp-O1
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 18:06:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wT1bV-00EjwM-SY
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 20:06:41 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a19d59c-2eae-0a2a0a5409dd-0a2a450aedd8-8
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 20:06:41 +0200
Received: from [52.101.69.112]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a19d5b1-56b3-0a2a450a0019-346545703c2b-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 20:06:41 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by DB9PR03MB8047.eurprd03.prod.outlook.com (2603:10a6:10:2ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 18:06:39 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 18:06:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WucSQbYYOwHVVWwJw/e/21051DxBHf+A32WrZrrmA/8HQjmE9dIkxml4IMkjFu+eumbFtRJYazTeg+YEwGqijGbFsNSIclhsZKOKhAIZVy068JbHHEK5Z2OD3kN2+DZl6oPqxXWhJZoIHVktEK3kwJZrvpDztoFhFrlkjYAsG/HZaw4B+gmjUSwmoC6NMzTNAqhrAdCq+8bvJOwTwOxO+Mat+ClON1lvuP+tSVJ6V4OOlb6cTaK/FosmQ3G89i1Ugm5H5pHfO1saf+ktNHUFSROg43AtJyhiTRvDWh28SVqrgD9CgCVjF9x5Q+vGKNdehGYJ8Nj23yjO+iKr6kM4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVpRs2eWXA/trL/i6q59BpF/yGCdOXjnszLojN66LUQ=;
 b=DPQ2S/Ps/eYdUEegJEUDGfTSw5HWZGQdBimbkZPqAySUYjmepmrHZ1+tA8RR//AkDcIB0hC+uJhf+kNUeFMP7oxyf1L5FsmCCCDqaaH2zxw8j4R1cDsPECKE56HBq1v4dPpQSYwEI/kCyG8m35+uCA/OP17fzxfMnICLHoRal32ntD9pKjrUDxP7ifaxRrO6+TM8Ta6c54sYkkSdUAuQxjfBR+B/BEufy6bqNKy65IAJzr5/ccQB7a6SfZA/lM3hHa567YVV3sJFaA/oW/+lH9PB20nGC0/LFnPvxtE3Q1j6elRxZHHgRkK16umSSyKxOiJk3urtknUxqXOsUVYNcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVpRs2eWXA/trL/i6q59BpF/yGCdOXjnszLojN66LUQ=;
 b=WH0laqN7rNSofecJEU2VeWr6/970750svmAtsu0N1X6wmx8c3cgvDYVuF8UfctU+V7+NbJ7htBOzTaMmXiknErEbZwRm7aU89a/TSJmzqFmgfLriiZwEQS7Vru7iY8+YZPnUlc+/7R4lIFBHXpd6PEkNkRrzaYKR5Sy9oNePfr2CsyvaCq4ZYLPU7XWmTgWfmknBeliD7voA8uYnQBYQ3Nh0p+q8WCPO/FG683qKjgMHFAGpCB6iU3ikqL1ETWQperBhMb5yiHbvrGQjH1HSgodNXf6TKzHyPTiHKqAYFR97X7r4ReUPVhOwJmn46fAhjPwVRcxZt9p1V8GGxmyG1g==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] coverage: place GCOV-generated .text.startup section
 in init text
Thread-Topic: [PATCH v2] coverage: place GCOV-generated .text.startup section
 in init text
Thread-Index: AQHc70ifTHJ2JaDHW0i9kIm+tvP8M7Yk0PEAgAB8SIA=
Date: Fri, 29 May 2026 18:06:39 +0000
Message-ID: <1b3ea08c-e0e0-44f8-8150-af7509047eb6@epam.com>
References:
 <fb154ba84ed01a060c6617194080d7cd77f9144d.1780044400.git.dmytro_prokopchuk1@epam.com>
 <095aa162-a397-46dd-b34f-5c9c1b15e149@citrix.com>
In-Reply-To: <095aa162-a397-46dd-b34f-5c9c1b15e149@citrix.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|DB9PR03MB8047:EE_
x-ms-office365-filtering-correlation-id: be7ae11d-67c1-4034-c073-08debdad082b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|42112799006|38070700021|4133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 wqfGGgHQxq3lOxjBOuajSmIGdumcuifIBSt4BViyMimXNoLtTEpSIA1EUQ1cPtzEBt2gL+SC6lg7AgaRg0AwAaimn+KgQDkPq/qXKcxS0fmY6965lf1u6BhbNMluGvajUSLTEhKqdQ7e7uDEIAccSJEAjKRCblVz5fZNLtenTT5A87XLbFnBnNYeQ2bj3R/8gXEjleboFqDrX2v0Pc4mnSiiBVYDIYgC0Kr7IpvfKEwsuieQbrZMiNV5Dt2lxROXRHAZipIQmyJafQw0k/gRVPe4YgVrFvGqtvu7myAGzlk9nfRUXRNjrXNrRLmpIiSVk16WxoI+R66z1HqL+V5RKlwLEqaWECtUVFITR/tajU6cCW5DKJA5SvLltOctxayTYdWYAG0bcPByrs5EI4xMCIh1DhR0wGAst9plbswQVs8syO7MXlQiAidR01+pDclKDcsXcprBD5exvJIAvE4eNvkafznjZodLPBlPivuyJITvfNRyzPlorHIDPSA407Bwq4T15n/+yLPtYXNv+5H2nidJavIllcgkHi9gbNDVAXlvVGOjANYOMndV76uOD9aC33vfQJT3091AvhQJbZZiIV7Gqhnm+SgnytgO2TwfuqM1di/FfqQo0FP44+KF6iG+UWtJiEbaLp+JBuJ/Y1doCyD6PT9hqQaqoLzl08mDQxK1FsyZM2/HUNKWJ7DfjpXabYxRlIjFvXlrUkZqcSooLA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(42112799006)(38070700021)(4133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eU9OYUQvSVVjMnYvdCtDTGV6SjRXWW4vVnJZUWZFUDVlTUN2WWpEUkJ5aDA1?=
 =?utf-8?B?UTZwQi9QaFZCUVZKUUF2Zzl2bTR4TDJSNmNPTUlyREdQemVwTEt0UURGbU9v?=
 =?utf-8?B?NU9KNnJiUlB0YVRZb3JaeUY3TS9pTW5VY3lSOW9xd0JMZzRwZEkrZzZ4YmhN?=
 =?utf-8?B?KzlOc04zZnJud3ZDd3JKUFJrS3JGM0ZYNmtXcFQ5NzBrY2t6ZUlNakJhRDIx?=
 =?utf-8?B?U1RTL1Y4Q2xQc3dpSUxLcm5mNXZSdzBocVBHdkVqV3VMRlAzbG43aDhJcUFq?=
 =?utf-8?B?aytsVjRVMnplV3doVEFENDFUbWhHTUR6QmFheSthR1Rsb1NiNGhjYW9JNEFm?=
 =?utf-8?B?M1RpYlptYksyLzNiYlgxMThRa0Y0aHhDRVNDSXlJVXRWUEdqbTRBcUZ1UVRk?=
 =?utf-8?B?WkRpdStpbWZEZVg4ZmRvdXFoY1lDNVVsc2R4M29PYitzMEFjZnJyZ1NCTnBq?=
 =?utf-8?B?MnFxWDVCTVFqcGR6MS9VUW94SGM3OFNId1IrZXVLQlZBY1ZXNDZrMzU0KzFv?=
 =?utf-8?B?YWdaMWNzVVZWb25adEpQTkhwM0FSanBtMk1RbUJCeGhqdGJhK1gyRnQ0RTV5?=
 =?utf-8?B?N243TnNoT0NaWm8xcmNIa2xTalNnd0NwbWNVWEhXS295WGFxd2hROGlrYS8v?=
 =?utf-8?B?RjdYODBVQ3BhamlSandub3VRNm9xb3g0TVB6aWFQV0JOUGRCRS9Eb3ZpTVFa?=
 =?utf-8?B?Z2VxbVJRWXFkdHRUODEzZy8xZndua2JxNFB5TG52ODdtU0t5RGwrQVV1bnho?=
 =?utf-8?B?SDFzamxQd0dpNlFsLys1VGxETTBqY2Z0aS9WamJqMThidmFNWDRFaXdHODBU?=
 =?utf-8?B?bTU4RUtsQzNWdThpaEtqVFkwWjIrckRBd2NRTFRBamhxeFBjQ1NtZjF1Tklu?=
 =?utf-8?B?K29udkVPUkREUHl5S1dyZ21vVFZQRGFRYm5mbW9adTE0UkpjNk43eE1nRmU3?=
 =?utf-8?B?eUtaRkRrVC9YNFdYTTlGRmozSndoU3BTVmNweEE1aEFKR3lpL0srV014bkFw?=
 =?utf-8?B?dHRiMHR6cGxOaDlDSm53RUo4U1ZKWmcxWU5ES0VwSkFyYno2M2NuVHIvVTIv?=
 =?utf-8?B?TXVMQVhkVndpWi9sb3hHVmlyaWhEN2VsOHlybWRVcDlTQmxoM21PVDZQT3Zx?=
 =?utf-8?B?VEVFMjQyaFpXdTdPV2RNNzZxbGRYU0ZaMkIzdWtVd3hMWHZmM293UHdFSElD?=
 =?utf-8?B?QlM5eGVaY1dPdUpTTVlBNGx6U1BaeUJDZUtiL2JiaDdjY0hXVnFvQjBpZER5?=
 =?utf-8?B?c1owQk01WUtBb2xjKzlWS2lTVTdHSGFlazB5TERiVTVLTlJPL25xUnlRMXdy?=
 =?utf-8?B?Zzk2K1czRVV1eFRkOHY4WUtNeEpxME4rVXhzSnJvcGVac1NDcWdKUVBCMU5O?=
 =?utf-8?B?UVIzUmtmVTRTR21pR1FvZGdKeXd6QmJPS3VzcEJVb0tWYURsd25QTEZGV09z?=
 =?utf-8?B?bVNnU2tYRlZlc3ppcWpXTHZwMzlWZTZ5bUluNnQ2OUlqNmpJY1FNMHIzWmNm?=
 =?utf-8?B?eUpkOEsra1NGcEpsV2RGeUZMc25hTitla3lkY1JBZ3B1TVRuczR2V0Z0RDBq?=
 =?utf-8?B?Z2xOWDdELzN2djZKQVhzaGRVWm9laGN2YnpBeWpEOWRla0lWamdYeTBtbXdX?=
 =?utf-8?B?L1lML2hsb250aCtEUVNQNk5nR3RuUXNYc1lsZUhkRVZkNU1LVlg0TWl1am56?=
 =?utf-8?B?WkFoOXhEcTl2K0krdzlnVHdaQ1Y0R3dybjZwME9QQ2ZkUWpQbGVnQUl1Wm5J?=
 =?utf-8?B?VW01dVhPVXlmWHkrdFhkVGxGUm9IMGZNbTBWdEl5UXVuemtVWFNpMEVqeXRH?=
 =?utf-8?B?WFJ4bjVKdEdlbHZMbnJJTmhjMVVSNCtzOXU4TEYxM2NyYzNxcDRmREZIMEZT?=
 =?utf-8?B?bmQybXByNkVaWjFqejQ1QUxzV3I2YWdNdmFXNGxPQTFQckR2M1NMSDdmWE9C?=
 =?utf-8?B?b1VjaW55RDBxOWlZNVk4bW5SVzBTUHYyZ0dRWkFkWWVSZkJTVnNXT2xReURT?=
 =?utf-8?B?dVU5dUY1RTExeDJlemVrUUhVMlpZcldLaE4wMlhFaXJOSTVhQjhZN2gxWW9l?=
 =?utf-8?B?ZHdxTVdNMXBsSFJZeWFJS2FpN2JFT25LOU4wUmVReG1nejdaUWFrekFnQVV1?=
 =?utf-8?B?bUtkQ0VXS2JsOUFNUXp0am9pNGpxdkgwRDhYRHgrVTVQT1NBQVNlRDNOek1E?=
 =?utf-8?B?VTB6eHpsSkRkSXpMMTNSMkxaZk5YK2R3bFVuTVRYZlNPS0FGaVdBWUJzV3ZS?=
 =?utf-8?B?eHUzK3NsZkowQ2sraVg3Sm5jTGdmL1hra1BaSmw2dVdYVUpORDlZWlFaZ210?=
 =?utf-8?B?amcrV214OE93ZVR3VUptdWR1QVBRY205SmpPY1owQVJGZFNoa2JITTlWUUlt?=
 =?utf-8?Q?XCuoDz2twDHVDkbs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <415B797740733348A8C4281FBFB9DD18@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7ae11d-67c1-4034-c073-08debdad082b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 18:06:39.6736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCGBx9l5g56ugzHxDeDCJ55+fVwe2TnsZlN3Ahxs5GbFH9w2NK6ON4k1qiLn3FqJ7C7VvajBeN6LJRFm3Jkxe5r3nz1DKLnfqisuF0ahPdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8047
X-purgate-ID: tlsNG-4011c0/1780078001-7D5868B7-6CEC8257/0/0
X-purgate-type: clean
X-purgate-size: 1060
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,raptorengineering.com,wdc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:mid,epam.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.979];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6B06C6070B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DQpPbiA1LzI5LzI2IDEzOjQxLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gTGluayB0byB2MToN
Cj4+IGh0dHBzOi8vcGF0Y2hldy5vcmcvWGVuL2NiOGMxZTA4NjJhNTU0ZjdhMjgzNDdmNTQ5ZTlj
ZmQwYjBkNmRiMmYuMTc3OTgyOTU0NS5naXQuZG15dHJvLl81RnByb2tvcGNodWsxQGVwYW0uY29t
Lw0KPg0KPiBXaGF0IGFib3V0IG15IGZlZWRiYWNrIHRvIHYxIHdoaWNoIHNob3dlZCB0aGF0IC50
ZXh0LnN0YXJ0dXANCj4gc3BlY2lmaWNhbGx5IGlzIGJ1Z2d5IGluIHg4NiwgYW5kIHByb3ZpZGVk
IGEgc3VnZ2VzdGlvbiBvZiB3aGF0IHRvIGRvDQo+IGFib3V0IGl0Pw0KPg0KPiB+QW5kcmV3DQoN
CkhlbGxvIEFuZHJldywNCg0KSSBhZ3JlZSB0aGF0IHRoZSBMaW51eCBURVhUX1NFQ1RJT04tc3R5
bGUgY2xlYW51cCBpcyBtb3JlIHByZWZlcmFibGUuDQoNCk15IGdvYWwgd2l0aCB0aGlzIHBhdGNo
IHdhcyB0byBmaXggdGhlIG9ic2VydmVkIENPTkZJR19DT1ZFUkFHRSBib290DQpmYWlsdXJlIHdp
dGggdGhlIHNtYWxsZXN0IGNoYW5nZS4NCkFuZCB5b3VyIHByb3Bvc2FsIHJlcXVpcmVzIHdpZGVy
IGxpbmtlci1zY3JpcHQgcmV3b3JrIGFuZCByYW5kY29uZmlnDQp2YWxpZGF0aW9uLg0KDQpVbmZv
cnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBlbm91Z2ggdGltZSB0byB0YWtlIG9uIHRoYXQgcmlnaHQg
bm93Lg0KSSdsbCB0YWtlIGludG8gYWNjb3VudCB5b3VyIGZlZWRiYWNrIGFuZCB3aWxsIHJldHVy
biB0byB0aGlzIGxhdGVyLg0KDQpCUiwgRG15dHJvLg0K

