Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA0C9E2C0C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 20:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848155.1263130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIYbF-0001h4-D5; Tue, 03 Dec 2024 19:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848155.1263130; Tue, 03 Dec 2024 19:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIYbF-0001fM-AQ; Tue, 03 Dec 2024 19:30:21 +0000
Received: by outflank-mailman (input) for mailman id 848155;
 Tue, 03 Dec 2024 19:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uR6h=S4=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tIYbD-0001fG-Hl
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 19:30:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2612::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07679e40-b1ad-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 20:30:18 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS4PR03MB8316.eurprd03.prod.outlook.com
 (2603:10a6:20b:507::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Tue, 3 Dec
 2024 19:30:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 19:30:15 +0000
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
X-Inumbo-ID: 07679e40-b1ad-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Je1CFuVHxhgVtZwLgQcqxk8wxxwuPv7uuMbQGQH56KDcmkrdc7H7SgSUECAGMVcgRfTlDFRNm0PbxDHw10vCUlqpCMpH5BGodRPxFsmaoTIosYgUVtGcawfHIM/0p4E4nTmGu+P1WQFhC4Z1HXX6IGf1fWSavEYt4BcdJ8Lj2JSpgYc64P1Fc3QBp6TaiT1TdK0YBqMRCb6WWP0tu1ZYZI7lbTSfDU+RYEngMjydrpoKIJh7oviR5sZWqVWno2Y5KaRfU194Vyt0pblg0XeQhTv2tCRqUynQsr1r56LcjW1zFdMdb+56TFce+jcrbFh60jbfSpoL/E2oU/Nibp0XBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYIY7CAKecYg8EqSgltMDeirxnVgSPqchNxbYLyRC9U=;
 b=uK3biCUganniBB5BhACXLF0/sW4tPYg3llmesQDfphVf0/K0w1y+r39OT1DOj6bcQ37eLBd/3XPWgx8P9Hdsl/pK1t8VeHgW6cQcpXETk/s3bExwTMHkMQ8gy65iQzsJglh0P2JfnzMScncD57lqtVVGA2dgfsmfmr1UHMqgBkLKY/SVTzgQjvyiDB6mt0R2wQN+FbBpu/AwQkbyuA4xZZRx/xKBnEuO7cnY3rV6tsv4UwL2djZhXQKUQnxKc9H+XTKtdpyKNQzspzSADvov7tR7HrsQZMKGB6gYx7xWcn4RqjeWUhVeeLXL3jC2KX5LOeY1mPCcP1zzmF9yO7uamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYIY7CAKecYg8EqSgltMDeirxnVgSPqchNxbYLyRC9U=;
 b=W0BmRJGkveOHE4IXJMfP+Is2yRP8s617Y29sULP4A+lPGpwmWQOMiBm3m5MkKFdkY5wIr8FvmKigauHHX8aD7mWh25Js7tlwpOhXsPjOtlMzckK1QDNkVaDcgy9py1F7z6+2C5TVXNz5WN28N05IIQfPuGnjUgBmn3cX/nxjuddqEojHvo3piX35Wark0t9OIQ1vBx77ZP19W+OK4o2yoyfoP1a/OggPKg/niqyW45x5B1b/msRch8+ZUDkIdQ0ac8aQs+8zvVF+sFBJoXiRRyGl0cvZ1KgtE/8CbphNxKmea/mnBxSjRhkL8D6grIQ047EjNBr307diyrNGs4vwbg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "oleksii.kurochko@gmail.com" <oleksii.kurochko@gmail.com>
CC: Jan Beulich <jbeulich@suse.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/4] xen: riscv: enable stack protector feature
Thread-Topic: [PATCH v2 4/4] xen: riscv: enable stack protector feature
Thread-Index: AQHbQsSdrqhVO8R3/0W5bnSX25z8yw==
Date: Tue, 3 Dec 2024 19:30:15 +0000
Message-ID: <87ttbk4la1.fsf@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
	<20241130010954.36057-5-volodymyr_babchuk@epam.com>
	<2f92aeb0-bb1f-49d0-9655-8ff93fee8837@suse.com>
	<f6bcf4dac683b1ebd89cdbfa33777c64c2df4637.camel@gmail.com>
In-Reply-To: <f6bcf4dac683b1ebd89cdbfa33777c64c2df4637.camel@gmail.com>
	(oleksii kurochko's message of "Mon, 02 Dec 2024 10:56:04 +0100")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS4PR03MB8316:EE_
x-ms-office365-filtering-correlation-id: 86c32cfd-f2eb-4aa7-853b-08dd13d0ea0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejZaVy9WR3h0VXZ1YVhQRCtsWFF6Y0w5VFlEbGYzcVYwQk90aXhrclBISFZo?=
 =?utf-8?B?U1oxQmZxSW5uWlhKeEtPQWlISFVJODRjNWxJemxqdXVLYVA1dml4N3R2SFU5?=
 =?utf-8?B?dnN2aG00TG05UmVDWE04MVE1Y1IrbjVCcmtoelI5NlpvWll3OFF5MmhxV2Nn?=
 =?utf-8?B?enEzd0QrS1Y3Q0hLMTdkeGRlWk9mUEhrOFpBbFMrU3J0UDBmN2FCVXljRER4?=
 =?utf-8?B?VG1qaHorMkluV3hsZjhxR0paK3ltZ05SVG16TktUTjhCbnJLOFI2NTI5a2hv?=
 =?utf-8?B?dlFPa2Qyc1ZDa0NERWJTY2xWUHUwZmpzZWk0YkhTcjRjbEdWK2lKeHhoQktn?=
 =?utf-8?B?a0VwbGZMNEZyYStDUE04K3RzQkNtNmdHdnlndVp5WEErNDFRRllydjkvTjlM?=
 =?utf-8?B?Si9Za1U0ZE9qekhZUWlra1Q3VmM1OVBkWXJaQSsyL2hBMVdXNU1XTFJiODgx?=
 =?utf-8?B?NGswelByekRHVDZ5NStsSDZvNzhIWXEzSk56UkpwbkJ5bnIxM2ZlRWpXaEJ3?=
 =?utf-8?B?bS9XeHZ1YlcrRURBZ1lxcG5SK3pLSzNhaFZYdnlZYjVGU1M4RExKOXZsa2pR?=
 =?utf-8?B?Y2Y1Vm1jbHQ4TjIzNlpsRVRaQUxQcnBXOTkxOGNUZzZnbVBkTmdPeHdZbm5j?=
 =?utf-8?B?N1l6dmxsQi9IeG91RkdJNlpDc2tQdmdCR3R1Y2h2QmdzMGdObitGaHJ0djRE?=
 =?utf-8?B?TFVlL21CK0JpdkNyNFNJT1lLUk1KY2xUdHhRM09WSVhLLzM5YlhHZjNsNTJv?=
 =?utf-8?B?WkhMUEVaeklwcGFuTUx6MVJzRG0vUWliT1BWS1NxQ1Nra1dIZlJTclUwbzRk?=
 =?utf-8?B?dDM3eWZ3VjFWcFV3YTRiUlFjQStpVU1TTldQdm5OUnJJVHhVMWV2bmkrK0s3?=
 =?utf-8?B?ZUk4OWhJMmp5MEoxcTVpbGYwT09PT1p2UWlRcVZHcWczdEQ0Sk5JbDN3Ump1?=
 =?utf-8?B?SWc3cDU4MkdOSDk1SnRQZHpSaktrUU5JeTJHN3B4T3hiS3BINkYrSGVUS2g3?=
 =?utf-8?B?S3hsR1JhUEExT2N3ZGQ3bzdsTjFnazM0ZzRQU3FZYk5XOUh0TXh1L1BQUXI0?=
 =?utf-8?B?ZEFFYnA0M2d5bVhhTlEvaHdCTUUxdTJvWTN3eUR6c29kN0RabEFJb2NwRjFp?=
 =?utf-8?B?R1pjZC8rR2ZFa3MyRFZQazFRRzRJbHlqTGdWQnZNcmlFbXBVaXRXOTJsZXB1?=
 =?utf-8?B?RmpibEY4Z2w5aHZqU2dHN09RNU84YzE3SVUzV0JLOXpxL0pCWXRTa0RYM1FB?=
 =?utf-8?B?Snp1RTMrR1gxV2VldWozQkFMM0REMTBVOXd6Y3BPcEh1OXovRHpma1ZaaHYw?=
 =?utf-8?B?dHpkeW9kNHU3Z211d3BVSE9mMWtxU2xlQ3dwdGhLSzVFQ2RORnF0OEZUUUxh?=
 =?utf-8?B?dW1hVzB5QVNGTkd1V0NIazJ1T2ZvVWxjOU1CSjFzRGQ1SCs3amtaOFgwNFc2?=
 =?utf-8?B?clQxeHhNYzUzdjBPZnRrQ04rK1hMekM0cXIyYWpTZFJXaGtCNnd4Qi90OWpp?=
 =?utf-8?B?QXNWeDhzM2tDWjM2S2hnTjkvd3oxbVI4bVorZmV0U1dDa2lZNS91dnVkdmFs?=
 =?utf-8?B?czIwUnJIL1FnZXE2QW1IWXMrQ1gxZWx6a1J0N3NnbGZ2NmUwdGx2emd2VnRt?=
 =?utf-8?B?MmVydllwTElXVzRNaDJjN2FGMWVPNlN3QitDNWk4ZTRmRkViNVBtVDZDU2dh?=
 =?utf-8?B?YVF4ZlNOU2p6MEZ2TXk3VmRoNjNiYW9MZWh3VUJWeFVPcGxOY3lBY1Nwb1Fq?=
 =?utf-8?B?UEpQVTAwWWxBVmxlVkpMVjRhcUc5NzhxeUpPRUYxRUt4cFdvUGlVR1NPZjkx?=
 =?utf-8?Q?W4aGtpIzvb6hf8FzULTla22wNEMXMAipJ/TXM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cmJOelZKWmZHMko5SW9DaUt3Y2g1MWxDaFFCUWNyK3h0aldtYXlTTVlZVEJa?=
 =?utf-8?B?REZVenhwUW5HZDhCdFgxd08ycU1md0J4MWtqaEt1OVZEWGZxNmtJeGtmOHlI?=
 =?utf-8?B?SGVSd0FPMjRQcXBvWXlvWXNUdzdGcmQrakhtZlY2UlhxOTh5QkEyNFJXUDg2?=
 =?utf-8?B?emUwbHVNVVQ3VDFDOU96MHVSN0poN0NxMlNGaTRua043YnZlRi81Y28vZ1Ni?=
 =?utf-8?B?RkU1TVhsRkd0N2tJVVlrOHBRM29mUHVzckZpa0JtNUVQZHZwSlVqNTh2OStP?=
 =?utf-8?B?WjU0Y1lPZkxDbU1FZEgzZU5RZ0xDcWRIc01EbitUWWJ1NGFxYUg5MTZtTCs5?=
 =?utf-8?B?ZlgvT3JJcHcvNTNPK0wvZGU3aWVVRHhpdlNLcXluZytnNFpjUktKQWY4RTZ0?=
 =?utf-8?B?T1RFVThpTytMV21raWI0K3VoMktyY2FLZUJmQWM2aldaSVVvQ1prcnJxWCtz?=
 =?utf-8?B?aTVGck5tbXM1UjY5VXVTdDErSFlWU3ZHOHh6Y0d6Q3VrUUthRGVMMk5CblJ1?=
 =?utf-8?B?cDJEWTAxV21oTzNEaTYxUDJFRlRHS2FBTDJ5MSs5RWVTQ0JWVnpsc25zTU1S?=
 =?utf-8?B?T2dXS3NGVGQwVVF5Uno5Y01FOHVpRVZsUTFvQzJ3OUFLbmdzM1VGdG5DVE93?=
 =?utf-8?B?NmRSUVgvL2kzOTlVdStncVdsc29vT1YzTWorRktMNlovTEQ5YkZPMmxVZWNn?=
 =?utf-8?B?QmxuczNNcEdqd0FwY2liblJIWmF1dWhndExZVXZzdlRHVHZWbER0cGNtdXoz?=
 =?utf-8?B?VFY0RXZvUFovQ09mN3pkS1Y0eWN6aCtlL3NsUEdnK1M4bmIvSW5ESnNMaFdO?=
 =?utf-8?B?MTlwQld0aGM4ZVJxdlpwTHdHa2NyZktMcHc4dWl6UllIaDVYRTRFRG5pcHBl?=
 =?utf-8?B?b2pIbVY3RmplcWhSdEJmVDdTV3M4UnhVZmtoNy96aFRic2t4bDU4dzVhSXBj?=
 =?utf-8?B?M0M4ZWljMzlsdmw3MFluYnNtK2JSVkgraXlZRXNmQ005TkJWOFBzRlhNQ1cx?=
 =?utf-8?B?VHZhOStXRGtpczJKNENobS9zU1NkbGlXckE0dStYVnFaK1ZIZlVUMWZvdndL?=
 =?utf-8?B?Kzl0bVpEUHR2UzFGc3BWN1FHVTEvc283WWlJbVh4VTY4QTAwbUhYYXduZDBj?=
 =?utf-8?B?VDJ1RmVBdkFtVklXWlFXWk9tMzZEeWFCeGFzR2cyWHRvN3JacUFxWmRvWXhj?=
 =?utf-8?B?NnFjRTBGdzlPdi9hblFxUUtRKzJpbFFJRTdIa2Z1bWNqNVkrcW03cTB4UTRv?=
 =?utf-8?B?Z3V4MVo1ZjU4SXcyM1FtWVUxdkNtMFFDQ1lCNXVNZFhneGVyVkg0UFg4UnJz?=
 =?utf-8?B?MVYwMmQ2U1V5U1drNDh4RTBNQ2R0VDRQRmxzZTRrVlpDa2Rqc2F0c04wYlNh?=
 =?utf-8?B?aStKVGYxRGhjYjF4WTBDN1BmWUdEME50QzhPNG84dXdjSnVHYmpvcHZta1V3?=
 =?utf-8?B?U3pGdGNwRFZ4aHVvNU9WemtwM0xWWTIyNTZvbjNJZ211Y3N3MDIwZmNkekkz?=
 =?utf-8?B?MWhHMlIxSm5EYUw3NERCVklNSWt3N3BFSjV2YzhiZ3R0dWE3TWNnSkE0UC9M?=
 =?utf-8?B?ZWNmV1B5WWljcG44MTF3anpPWlVHRzd1b3p0cTlxWktmQnU5eW5HSGtZK2Ji?=
 =?utf-8?B?a2crVTZ5MXVONlNxMmFjb1lZeWRpUzZLWU5mMUhqdVl5YWxNVG56MWdFakUy?=
 =?utf-8?B?dUVmY1ZmSDdsNDdjTXJWc2cwTWtnbW01Wm9XWUtnVkRzL3hXc1RmN21HTGVQ?=
 =?utf-8?B?NHBoWE1DZ0dDZUhjT3l3TktJOENJUmdCYlNPVENicjVhMnF1YTJrZ1FzaFlu?=
 =?utf-8?B?WS9TMXBDeEhMRjk4SjVvQmgxRGM0VmI0T3dpWlM0VU5Pck41SUNBSElHdXJ2?=
 =?utf-8?B?SjdJUFhHc01CMmc5bFV3MkRxOXJVWVVUM3M1L2ZDZkhmbU4vNFVZVlZyQVJO?=
 =?utf-8?B?QzViNlNNOUxwb294SDFuQmtQUGhHVGdKRjZQdkh4VGR2RHRHKzl6TURjSS9G?=
 =?utf-8?B?OVM3V3dDaW1ZZ3lYQjAwQzFDM0d3V2N1T1pXekNvemxsSUlJd3FVS3NPR29j?=
 =?utf-8?B?Y2VhYXRXbUhQNWpPOUJzMVQrSTJsbjdFYi9pVUJ0aXlQY0wrK2huQ1E3Y0Za?=
 =?utf-8?B?NE1kcnFsTzB1dUVRdmZtVFFVZjF0SUJoc0U0TzIwWW9EbFg4K1RyMGJQU3lZ?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <862A02E5D708A44EA838148B91DF3A2F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c32cfd-f2eb-4aa7-853b-08dd13d0ea0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 19:30:15.6960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zr39oqUmmaKNIbhca3xAebPwhs/oQfeqb/EjdVpYyVaO/aztD7/JSWYwYasqbaqokKkIxzOaad6SNcs09Kh/LkC4T8twTIR3M9tXYrEjJJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8316

DQpIZWxsbyBPbGVrc2lpLA0KDQoNCm9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tIHdyaXRlczoN
Cg0KPiBPbiBNb24sIDIwMjQtMTItMDIgYXQgMDk6MTIgKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4gT24gMzAuMTEuMjAyNCAwMjoxMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+PiA+
IEVuYWJsZSBwcmV2aW91c2x5IGFkZGVkIENPTkZJR19TVEFDS19QUk9URUNUT1IgZmVhdHVyZSBm
b3IgUklTQy1WDQo+PiA+IHBsYXRmb3JtLiBIZXJlIHdlIGNhbiBjYWxsIGJvb3Rfc3RhY2tfY2hr
X2d1YXJkX3NldHVwKCkgaW4NCj4+ID4gc3RhcnRfeGVuKCkNCj4+ID4gZnVuY3Rpb24sIGJlY2F1
c2UgaXQgbmV2ZXIgcmV0dXJucywgc28gc3RhY2sgcHJvdGVjdG9yIGNvZGUgd2lsbA0KPj4gPiBu
b3QNCj4+ID4gYmUgdHJpZ2dlcmVkIGJlY2F1c2Ugb2YgY2hhbmdlZCBjYW5hcnkuDQo+PiA+DQo+
PiA+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0Bl
cGFtLmNvbT4NCj4+ID4gVGVzdGVkLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1cm9j
aGtvQGdtYWlsLmNvbT4NCj4+DQo+PiBJc24ndCB0aGlzIHByZW1hdHVyZT8gRm9yIC4uLg0KPj4N
Cj4+ID4gQEAgLTU3LDYgKzU4LDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gc3RhcnRfeGVuKHVu
c2lnbmVkIGxvbmcNCj4+ID4gYm9vdGNwdV9pZCwNCj4+ID4gICAgICBpZiAoICFib290X2ZkdF9p
bmZvKGRldmljZV90cmVlX2ZsYXR0ZW5lZCwgZHRiX2FkZHIpICkNCj4+ID4gICAgICAgICAgQlVH
KCk7DQo+PiA+DQo+PiA+ICsgICAgYm9vdF9zdGFja19jaGtfZ3VhcmRfc2V0dXAoKTsNCj4+DQo+
PiAuLi4gdGhpcyBmdW5jdGlvbidzIHVzZSBvZiBnZXRfcmFuZG9tKCksIGVpdGhlciBhcmNoX2dl
dF9yYW5kb20oKQ0KPj4gbmVlZHMNCj4+IHRvIGJlIGltcGxlbWVudGVkLCBvciAoYXMgSnVsaWVu
IGFsc28gcG9pbnRlZCBvdXQgZm9yIEFybTY0KSBOT1coKQ0KPj4gbmVlZHMNCj4+IHRvIHdvcmsu
IFlldCBnZXRfc190aW1lKCkgcHJlc2VudGx5IGV4cGFuZHMgdG8ganVzdCBCVUdfT04oKS4gR2l2
ZW4NCj4+IHRoaXMNCj4+IGl0J3Mgbm90IGV2ZW4gY2xlYXIgdG8gbWUgaG93IE9sZWtzaWkgbWFu
YWdlZCB0byBhY3R1YWxseSB0ZXN0IHRoaXMuDQo+IE9rYXksIEkgdGhpbmsgSSBmb3VuZCB3aGF0
IGlzIHRoZSBwcm9ibGVtIGFuZCB3aHkgbXkgdGVzdGluZyBvbiBzdGFnaW5nDQo+IHdhc24ndCBy
ZWFsbHkgY29ycmVjdC4NCj4NCj4gSW4geGVuL2luY2x1ZGUveGVuL3N0YWNrX3Byb3RlY3Rvci5o
ICgNCj4gaHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vMjAyNDExMzAwMTA5NTQuMzYwNTctMS12b2xv
ZHlteXIuXzVGYmFiY2h1a0BlcGFtLmNvbS8yMDI0MTEzMDAxMDk1NC4zNjA1Ny0zLXZvbG9keW15
ci5fNUZiYWJjaHVrQGVwYW0uY29tLw0KPiApIENPTkZJR19TVEFDS1BST1RFQ1RPUiBpcyB1c2Vk
IGZvciBpZmRlZi1pbmcgc28gdGhlIHN0dWIgdmVyc2lvbiBvZg0KPiBib290X3N0YWNrX2Noa19n
dWFyZF9zZXR1cCgpIGlzIHVzZWQgYW5kIHRoZXJlIGlzIG5vIG5lZWQgZm9yDQo+IGdldF9yYW5k
b20oKSBpbXBsZW1lbnRhdGlvbjoNCj4gMS4gU2hvdWxkbid0IGl0IGJlIC9zL0NPTkZJR19TVEFD
S1BST1RFQ1RPUi9DT05GSUdfU1RBQ0tfUFJPVEVDVE9SID8NCj4gMi4gQ09ORklHX1NUQUNLX1BS
T1RFQ1RPUiBpc24ndCBzZXQgaW4gY2FzZSBvZiBSSVNDLVYsIGF0IGxlYXN0Og0KPiAgICAgICBn
cmVwIC1SbmkgIlNUQUNLX1BST1RFQ1RPUiIgeGVuLy5jb25maWcNCj4gICAgICAgMzg6Q09ORklH
X0hBU19TVEFDS19QUk9URUNUT1I9eQ0KPiAgICAgICA3NjojIENPTkZJR19TVEFDS19QUk9URUNU
T1IgaXMgbm90IHNldA0KPg0KPiAgICBTaG91bGRuJ3QgaXQgYmUgZGVmYXVsdCBIQVNfU1RBQ0tf
UFJPVEVDVE9SICggb3Igc29tZXRoaW5nIHNpbWlsYXIgKQ0KPiAgICBmb3IgJ2NvbmZpZyBTVEFD
S19QUk9URUNUT1InOg0KPiAgICAgICBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQo+ICAgICAgIGluZGV4IDBmZmQ4MjU1MTAuLmYzMTU2ZGJiOWEg
MTAwNjQ0DQo+ICAgICAgIC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZw0KPiAgICAgICArKysgYi94
ZW4vY29tbW9uL0tjb25maWcNCj4gICAgICAgQEAgLTUyMSw2ICs1MjEsNyBAQCBjb25maWcgVFJB
Q0VCVUZGRVINCj4NCj4gICAgICAgIGNvbmZpZyBTVEFDS19QUk9URUNUT1INCj4gICAgICAgICAg
ICAgICBib29sICJTdGFjayBwcm90ZWN0aW9uIg0KPiAgICAgICArICAgICAgIGRlZmF1bHQgSEFT
X1NUQUNLX1BST1RFQ1RPUg0KPiAgICAgICAgICAgICAgIGRlcGVuZHMgb24gSEFTX1NUQUNLX1BS
T1RFQ1RPUg0KPiAgICAgICAgICAgICAgIGhlbHANCj4gICAgICAgICAgICAgICAgIFVzZSBjb21w
aWxlcidzIG9wdGlvbiAtZnN0YWNrLXByb3RlY3RvciAoc3VwcG9ydGVkIGJvdGggYnkNCj4gICAg
ICAgR0NDDQo+DQo+IFdpdGggdGhlc2UgY2hhbmdlcywgSSBjYW4gY29uZmlybSBKYW4ncyBzdGF0
ZW1lbnQgdGhhdCB0aGUgQlVHX09OKCkNCj4gb2NjdXJzIGR1ZSB0byB0aGUgYWJzZW5jZSBvZiB0
aGUgZ2V0X3JhbmRvbSgpL05PVygpIGltcGxlbWVudGF0aW9uLg0KPg0KPiBNeSBzZWNvbmQgdGVz
dCAob24gbXkgZG93bnN0cmVhbSBicmFuY2gpIHdhc24ndCByZWxldmFudCBiZWNhdXNlDQo+IGdl
dF9zX3RpbWUoKSBhbmQgTk9XKCkgYXJlIGltcGxlbWVudGVkIHRoZXJlLg0KPg0KPg0KPiBBc2lk
ZSBmcm9tIHRoZSBjaGFuZ2VzIEkgbWVudGlvbmVkIGFib3ZlLCBJIGNhbiByZS1zZW5kIHRoaXMg
cGF0Y2ggd2hlbg0KPiBJIHN1Ym1pdCB0aGUgcGF0Y2ggZW5hYmxpbmcgZ2V0X3NfdGltZSgpIGFu
ZCBOT1coKSBmb3IgUklTQy1WLiBJZiB5b3UsDQo+IFZvbG9keW15ciwgYXJlIG9rYXkgd2l0aCB0
aGF0LCB3ZSBjYW4gcHJvY2VlZCBpbiB0aGlzIHdheS4NCg0KVGhhbmsgeW91IGZvciB0ZXN0aW5n
IHRoaXMgb25jZSBtb3JlLiBJJ2xsIGRyb3AgdGhpcyBwYXRjaCBmcm9tIHYzIHRoZW4sIHNvDQp5
b3UnbGwgYmUgYWJsZSB0byBpbmNsdWRlIGl0IGludG8geW91ciBzZXJpZXMuDQoNCi0tDQpXQlIs
IFZvbG9keW15cg0K

