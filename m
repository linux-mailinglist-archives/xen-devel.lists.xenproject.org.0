Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F59B39C29
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 14:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098573.1452585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbNb-0006bo-0i; Thu, 28 Aug 2025 12:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098573.1452585; Thu, 28 Aug 2025 12:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urbNa-0006ZL-Tr; Thu, 28 Aug 2025 12:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1098573;
 Thu, 28 Aug 2025 12:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FxJR=3I=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urbNZ-0006Gw-FQ
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 12:05:21 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4500bb8a-8407-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 14:05:20 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS2PR03MB9221.eurprd03.prod.outlook.com (2603:10a6:20b:5fd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 12:05:17 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 12:05:16 +0000
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
X-Inumbo-ID: 4500bb8a-8407-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC6dNnT3Nc4hThgioGD8uoEagwFrvHHC9VcOOmZCQgHOG8GdjpueEK8QVsmPiIjNi7cZEcwI+kI3GO/pqOZ2+O02/B7BlXFLznItnPQ9lMZoM2en5PaG3b6j8II55NkCKEoo9Vcr4HAELqo6D+Jt26B/PrxKMikSjs1sW6j7pPiHHU/gP5blTzC41W8I7/2yv/LCXNujC+pPnHZtKrAmsilBJcu7TnjpRQjIo3TAgzXzKJz7w5zPkXMRZs8HVcnk0rpJdpcDzv0LY7IA1QQG2hG8PBPlHiLfB/9b+EmpXwyN/K9gHL0WtDgvgEf9LyiFRSIReIklw9ZZMnHAI7gyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAfh/hIesi+y4fr/7jM3iQqJ05X/iVMVOe+kLHUzlG0=;
 b=Osy/Su/YN84GVbz2x0xklP3p4GzSkKVCDmj/krnNDYlxMCNHSEC0o2q+BECwceveyum1cWrQrSI3jPFmFFWoexN1pW3BmWfTWmL7k0vCBwgJ9NPzV3GgK2cb4YkgRaLNObT7egBiJM0urWw/ZV20Yvxue2u2K787ef/jqJs3TVq5dtjhhgZPtpAHaHQaYv2zNk+veQRf2i03w0OC5swt4951cFG7B57RFoDj1fRhm9oxCtq6RC3gojC54t+f6xzUxSjxbtZm/c8zDzpqU2eMf4fTXczyr1Wrbj/OdefZCtPV/dpfSs2eqty0PmsmnlLNHM7InbQAAb++l4GuzWLMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAfh/hIesi+y4fr/7jM3iQqJ05X/iVMVOe+kLHUzlG0=;
 b=nk92V5kTobtm11x8QRtdsAlT4adBn0cGq/Cz3L7GQA1xtQyMoRd4heDLm8+POQRBsTBcv2HF3NNWGOgqZl+yTLu4/LznpqnWVhSBFak+ppddaWXIu4+pbRkr7pwzBEBXJwNCXOTMK5U389vC2JpZ2Q93p6yHtadT6RYM9gAaQJ5sBNcnZUlBrLpHIJOlo2xLiF25rEUvnn+7DPdveR8vfU/1gAE3GP3HSuiDnWijTUy+ASPocO8YqrEYIHStOpSQekr+W3hhHkWpssZ53c6z5CoR8/5DTh4cbNfZDaURibKB3fsgIQ8vspczsYRlJaFiFb5mQ2o7t/tPtO0HnchxoA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: Re: [PATCH v4 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Topic: [PATCH v4 11/12] doc/man: update description for nr_spis with
 eSPI
Thread-Index: AQHcF3/Q0bamE1jhy06ZtBrEohbyn7R3+QgA
Date: Thu, 28 Aug 2025 12:05:16 +0000
Message-ID: <92c16f59-80d3-457e-896c-199a8f9cc6a7@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
 <50cd1899b328e82bd517ae0dd0e400e9cfee0999.1756317702.git.leonid_komarianskyi@epam.com>
 <87y0r4z717.fsf@epam.com>
In-Reply-To: <87y0r4z717.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS2PR03MB9221:EE_
x-ms-office365-filtering-correlation-id: e8dc87bc-3334-4f88-cc8b-08dde62b26f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cm9qYVN6S1lDT2plNGozc3Z4WjJ1NFMyRmFHdHlUcDRISjBGQWIxUW1UYllL?=
 =?utf-8?B?cFpuaTJhYmRETTFPczlsdW50QTk1R0hDejlGTlRSdHFReFd3Ui96VTF0aUtW?=
 =?utf-8?B?T3BHVE5iWXZ0MUs0WWsvQnhNUDZpeFl2a2FiM1Y1SG0rZ3BKWHdEWG5UNG5i?=
 =?utf-8?B?RnlKUFJPdG5LaGErNm9Dc0MxYlUzSXNMS0RpaWYwTXVDckNTU2Y3ZzNVSHBD?=
 =?utf-8?B?eEZWdWpFZjM3Y283VW00MU1RUEc5dWNMZDNLRHkrdFhLZjhtQmJuRFJDa0xM?=
 =?utf-8?B?dTlPSURibkRyNEZzcFcxZjQvYTFCSkJ3Y3o4YmtNTFMzSlNGczREcnlzWWQy?=
 =?utf-8?B?a1MzWHUreTJ1NG1NTEMxNGhzY1p2RFlpTnJ6QUt1dU02c0NBMi8wZWs2N2hV?=
 =?utf-8?B?UjUzNnJuTmtGWW5yby8zdGNTemlmYzVkMjRoTldiQ0hNUVMzWjlXd01JRmtO?=
 =?utf-8?B?R0NGblk3bytsOGx6UDNTSFNXV20zQWZyMzVwcjFCTEkrTE15dFdvZGVEaS9F?=
 =?utf-8?B?Z0NNMkdicmRCVi84dVJiU09kemt1a2Q5cUFoNFF5VlY2Wjl3aWdtc0dIZW5n?=
 =?utf-8?B?M3hYc0FUdy9FYWJhNEN2ZHBITzFsSVNzQlpjanF1SXZLQ0lKQWxEQnVQU3Q3?=
 =?utf-8?B?KzhGUnFHcUVoWVB1Z2M5RVNUUE9wcGF3TzBabFNtYmE3a2VaOThPQUFGNlg1?=
 =?utf-8?B?Tjk2eGZJRW9xZzhScDEvL3I2Z1dpM2xyemlpanhOOE0rZUIvb1Y3dCs0NnRC?=
 =?utf-8?B?U0xicG44MHlMYk9BenhuejNZSDdGNWxvVzdUQll0eFUxVkxQZ09BS1lWeGVq?=
 =?utf-8?B?QmhNSUY2akFjanVmemxnZ2h2Y3dyQlhKWVdOWVQvdk5waWRCQlZLaHhaMjUw?=
 =?utf-8?B?VGVkejJiSWlaeGlCaFNldTdZTW1ZSFI3V3lOWmNqem1TK1A3OFFKK1cyM3Js?=
 =?utf-8?B?NWloOFgzTll2RHBIakI3bWN4QUJBYWJ0ZUs4UmtLcFhMeHFBU2N6emRDTU1M?=
 =?utf-8?B?YkVYYXp2Nm1lb1ViTWpzWndzM2RrWnFQUDVWS2tYTzlsRG1iN1FoazMwTTM3?=
 =?utf-8?B?N2lHbEdLN043eWxsbXpGVDNVbVNsNzhmUVNWWGtNVndKdFR5Q3YwR2p0QUVn?=
 =?utf-8?B?enYrTTYwa09wenZuaUR2ZWN6c25iSjh5MkloaDIxYUlydnBrS1NlQndkcUtE?=
 =?utf-8?B?WVJOTFA2NFBxdGJoeVU0b3lNNy9RTCt1NVg4eUNuWnMzWGVua1MzWEtpQ0NL?=
 =?utf-8?B?Q3dodEtLaC82TUtCQ0NFZ00vMEdXQkF0TCtmUGJ3RHlOcm9TbUE0K2N0dDAw?=
 =?utf-8?B?b3hTTlpBM1k0Rm10OVg5ZjRCNFh4SjRsWS9oNCtmYjRzdkI0Y1BoY0xHWlR3?=
 =?utf-8?B?bGtLVzUwMVgydHdHVCtYQkFJRGxjaGZxa001ck9oTWRNVVRUMldNOTRmT0Qx?=
 =?utf-8?B?b3F3MzltczdESVlwTDNIelQ1UnpZbEl1TUdpRzMybHVSVzVUcXF0aGxmcmQr?=
 =?utf-8?B?R0JtYzAwSEtwS2xSc0NuWmdoZlZnZEl5d0pxUzdwQUtDekdUU05tUGdValM2?=
 =?utf-8?B?MmdaNStBQjBhM0VIUS9sK1B1WlBFbjZjV2hOWE9rSEhoMU40VkNhOWwxVVY5?=
 =?utf-8?B?VXlaenBhL2g4b2U1VnhHYVUrOGRnZlNlSUlLSkJjWm1vRE5lbU1lTEQ1TWtp?=
 =?utf-8?B?bzFYUEFHZi9Yb2tCUFhjQXJER1V3c2JDaXozcU14VWFrNzJMOFVCeHp2NGNO?=
 =?utf-8?B?YUJwTGRvcEd4VmFqSzFLSjJ4QmkwRUxiZ3ZvNlA1N2pMODVUaDNBblVobzhv?=
 =?utf-8?B?Qit4akduL3NMQkdtMXBlSVVHdDZPWXhNdG9YRGxnQURTbjhHOUx3ZkwvOWJO?=
 =?utf-8?B?NTRMNloxZzd3bXg4dGFuazgvMkhrWlJXMnhFbThJblpVTTkzWjJNbnp1ZFVQ?=
 =?utf-8?B?aGNIUkhoZEZEV1ZpdVlDYUlvdFJHWHl5Z3U5d2FibG5zeEtIUCt5NXpmbjN2?=
 =?utf-8?B?QzhNVzZ3TjV3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXlPZnNIck4wTXpZR3dveUhOak9wWm9rYm4wall1WkVrQ3FOWEJGcUlWVmJm?=
 =?utf-8?B?SGhlWjBLd1JObzd2djZqMlorTjVJV1c0bENZYUpWTEtWeUxEcmtGSDR2YXNR?=
 =?utf-8?B?a2xmQzlxSWNXSXRFdTdUTTlEbyt2U01wT1ZMS1RwNHhxOVhVNUYyaGRsMHRO?=
 =?utf-8?B?SWIreVJNL0UzRWF3eGswbjBsTTZiek5GNkRyOUFIOTBCRWc0QkM5QUttTFZT?=
 =?utf-8?B?QUVMWU1IalFsdWl1bWtvcWxTNU43MlZqWC83aWs3czdvSXB2Z3NHOUFweldv?=
 =?utf-8?B?U2NKd2NPQjEzREZTU296aWMrRFQ5eGdGRXRxNjNtZ2grL0twWVN2Yi9DU0R6?=
 =?utf-8?B?bi9TaTFSYmpaUGtEN1lmSnMybVdLS0xaMTdSOW1UWjhoSjduZjRxN0liOWRL?=
 =?utf-8?B?MTQ5dzloRWxtY3ljTk05WkJmV3c4OTFWeWpZM09UcGtBdkNhTkpWMGVjUDlK?=
 =?utf-8?B?WVprR2laQjZJUDA1Y0htV2lmalVyWnpBcCsyeUZwRzh2UEE1OUx5T3AzT3NI?=
 =?utf-8?B?Y2EwZ3RYbWxUOWJvVXIvTVJkUFAyYWFYbmxZMFhDQjJPdm0yVnRNWlN5ZmlC?=
 =?utf-8?B?REJWWTFsN1hUb0xJK2FrL2I3dUxJSzM1a2pjU1F4d0UxUm1ramZMZ1JBR0I5?=
 =?utf-8?B?OTVoN0xmWDNYZTF0U3ZNZUVQLzF3cndVV05Xa1JsUmNlY0pwNnJ5b0gzdStR?=
 =?utf-8?B?bkc5V2ZLbmt0dFB6cGVuaXUzMjlXYlFOcUJQMnFjVHdVdjZQWmVHZGV2RDlo?=
 =?utf-8?B?akZ4UDdiRlpjZm1kSTE2QUJBLzVkOG1rbTI4RytZWUZxMGMyTlpibHVIVTJK?=
 =?utf-8?B?bkx3S1ZDMzVuTUVnNGtGMHVra1VOQThzZlhkVHV1cmJGVkxpQlNpZWczekd3?=
 =?utf-8?B?eEZUQ2NUWUtwM0FLT21razcvMThqZG1uTWJtUXIyK3JFQU9iWGRaUU9XNXEv?=
 =?utf-8?B?V01mbHFnNG1TK0lWaGdZenpaSDNrWlJ0TXhIRG1yRTBsbFk5S2FuYklWZDh3?=
 =?utf-8?B?S3ZqeCtVaHBLNlo0WFd1YTU3RERFaHYvVGlGNjdDRC9tMTNVZ0Y4OWphWHJp?=
 =?utf-8?B?aVZESU51R1hyU3d5cTVzekVrRjM3VmcxMGFabnlIbWRWb3hMTnlKSlF5V3Ja?=
 =?utf-8?B?Y2M1UXNkdXVyYnpXNGxQeWZGd3FGaStoUGxOekFpYWlLZXJzV1VNUHYrdU9L?=
 =?utf-8?B?cXA1WGRja2tSU253VW5NTTFSYmtkRHBoUUxGNk8yMGpmZFpISDNFem5nZ0x6?=
 =?utf-8?B?UGxHdXoxQmVScWVEQ3RFNlFaRlB5eUlVYXhuVXBaSmxWREl4ZXZJK3A1UUEr?=
 =?utf-8?B?UWo0THNxdVZvUkhuVkp5YmIwZnNMVU9WbTlsYkRWOVE5YmRoaVJnSzlJaHps?=
 =?utf-8?B?ZkdpTUQwbnI3Y1pLUklWYlNYUTlQMDk1aHNqSk9mcEpNdTZ1RnluR3o4Tm03?=
 =?utf-8?B?STlTOHovb3ZrWGxEdEt6MnMxdStYTG10UlNzR3R2Ly9zdUFtbjIwU2U2YXVl?=
 =?utf-8?B?eSswQ2wva1FZaUFYYmFWdkNSdXViZTljci9OeTlpM1ZlcHkwaHpXODVEc1JH?=
 =?utf-8?B?M1BnZ3QvcVNpK2U2SklTcHE2bWpLblVIUkZ5dW02Vmo0djVMVExZUHBvVUJK?=
 =?utf-8?B?VEdWL2FoZDJIYk91VkY2NDQ3c3FsazlLdGZWQ0pJY3ZNNlI3WmZWQWJjeUJO?=
 =?utf-8?B?U1RtNjloWHFQSncyd0lFbkh5a1ZkdEhRNlZReUQwbTNBMTNvMzJ0QlcxQW5m?=
 =?utf-8?B?eFlFaE9jcVRBVVBMRnpkQnFiQ2NhYWRrdzRkbEVTaFhYSmFMQ3A5N3k2aXNF?=
 =?utf-8?B?OU1HVkdDdHJvZXNlM2sraTJZek9LbHZiOFl2WEhuN0txY3FVbkNPK2xZWnNk?=
 =?utf-8?B?OEdRQStoejdpQmJsTEhrbzdLbkwxUVlKYmF3cy9xNXB1Y0lqVjZJQWJSTnc1?=
 =?utf-8?B?Vm5VVEN3b0pGRE54QnZKZXlYVWpCYU5QZGgwaE5ocVc2dHJCMWFVcVozZHZP?=
 =?utf-8?B?NkN6RmVNM0hod2FVeExIbkZ0UHZhbTNDZFkzMlY0RkI0WUljTWxRdE00TnVw?=
 =?utf-8?B?SzVmeWdoaUcwS0JQbXg3dC9ZTzJhRnJBWjdSS29tWnhNMVZCWXhwdWlsWkVl?=
 =?utf-8?B?TlhLUUtJZDQ2Wm4xUmRIU0V5bUZZbzFtVjZWT2NPc2o0UUNocDUya3JFUnRr?=
 =?utf-8?Q?As4dEHoJMXYwGjkvKnRgJIM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2FFDAE5EEBBA747B4D1169E71C6D800@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dc87bc-3334-4f88-cc8b-08dde62b26f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 12:05:16.7963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SV553qnpYN3n2Qizm0Fhj221yzO1LYc6kZBFWX+Ys9qwt/lY3tJYKvZQmfj9kn8UfKVx+kTJLSuA/W96Qumq91mXxuWObDdc4mKtyJvTvBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9221

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IGNvbW1lbnQgYW5kIHN1
Z2dlc3Rpb25zLg0KDQpPbiAyOC4wOC4yNSAwMjoyMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6
DQo+IEhpIExlb25pZCwNCj4gDQo+IExlb25pZCBLb21hcmlhbnNreWkgPExlb25pZF9Lb21hcmlh
bnNreWlAZXBhbS5jb20+IHdyaXRlczoNCj4gDQo+PiBTaW5jZSBlU1BJIHN1cHBvcnQgaGFzIGJl
ZW4gaW50cm9kdWNlZCwgdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHdpdGgNCj4+IHRoZSBhcHBy
b3ByaWF0ZSBkZXNjcmlwdGlvbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMZW9uaWQgS29tYXJp
YW5za3lpIDxsZW9uaWRfa29tYXJpYW5za3lpQGVwYW0uY29tPg0KPj4NCj4+IC0tLQ0KPj4gQ2hh
bmdlcyBpbiBWNDoNCj4+IC0gaW50cm9kdWNlZCB0aGlzIHBhdGNoDQo+PiAtLS0NCj4+ICAgZG9j
cy9tYW4veGwuY2ZnLjUucG9kLmluIHwgMTMgKysrKysrKystLS0tLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4NCj4+
IGluZGV4IDUzNjJmYjBlOWEuLjI5MmFiMTAzMzEgMTAwNjQ0DQo+PiAtLS0gYS9kb2NzL21hbi94
bC5jZmcuNS5wb2QuaW4NCj4+ICsrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbg0KPj4gQEAg
LTMwNzIsMTEgKzMwNzIsMTQgQEAgaW50ZXJ2YWwgb2YgY29sb3JzIChzdWNoIGFzICIwLTQiKS4N
Cj4+ICAgPWl0ZW0gQjxucl9zcGlzPSJOUl9TUElTIj4NCj4+ICAgDQo+PiAgIEFuIG9wdGlvbmFs
IGludGVnZXIgcGFyYW1ldGVyIHNwZWNpZnlpbmcgdGhlIG51bWJlciBvZiBTUElzIChTaGFyZWQN
Cj4+IC1QZXJpcGhlcmFsIEludGVycnVwdHMpIHRvIGFsbG9jYXRlIGZvciB0aGUgZG9tYWluLiBN
YXggaXMgOTYwIFNQSXMuIElmDQo+PiAtdGhlIGBucl9zcGlzYCBwYXJhbWV0ZXIgaXMgbm90IHNw
ZWNpZmllZCwgdGhlIHZhbHVlIGNhbGN1bGF0ZWQgYnkgdGhlIHRvb2xzdGFjaw0KPj4gLXdpbGwg
YmUgdXNlZCBmb3IgdGhlIGRvbWFpbi4gT3RoZXJ3aXNlLCB0aGUgdmFsdWUgc3BlY2lmaWVkIGJ5
IHRoZSBgbnJfc3Bpc2ANCj4+IC1wYXJhbWV0ZXIgd2lsbCBiZSB1c2VkLiBUaGUgbnVtYmVyIG9m
IFNQSXMgc2hvdWxkIG1hdGNoIHRoZSBoaWdoZXN0IGludGVycnVwdA0KPj4gLUlEIHRoYXQgd2ls
bCBiZSBhc3NpZ25lZCB0byB0aGUgZG9tYWluLg0KPj4gK1BlcmlwaGVyYWwgSW50ZXJydXB0cykg
dG8gYWxsb2NhdGUgZm9yIHRoZSBkb21haW4uIE1heCBpcyA5NjAgZm9yIHJlZ3VsYXIgU1BJcw0K
Pj4gK29yIDUwODggZm9yIGVTUElzIChFeHRlbmRlZCBTUElzKS4gVGhlIGVTUElzIGluY2x1ZGVz
IGFuIGFkZGl0aW9uYWwgMTAyNCBTUElzDQo+IA0KPiBXZWxsLCB0aGlzIGlzIGF3a3dhcmQgYW5k
IGNvbmZ1c2luZyBub3cuIFlvdSBjYW4ndCBhbGxvY2F0ZSA1MDg4IFNQSXMsDQo+IGJlY2F1c2Ug
bm8gR0lDIGRvZXMgbm90IHN1cHBvcnQgdGhpcy4gTnVtYmVyIG9mIFNQSXMgaXMNCj4gOTYwIChy
ZWd1bGFyIFNQSXMpICsgMTAyNCAoZVNQSXMpID0gMTk4NC4NCj4gDQoNCkkgYWdyZWUgd2l0aCB0
aGlzLCBidXQgZXZlbiBpZiBJIHdlcmUgdG8gdXBkYXRlIHRoZSB0b29sc3RhY2sgbG9naWMgd2l0
aCANCnBhcnNpbmcgSVJRIHBhcnQgb2YgZG9tYWluIGNvbmZpZywgaXQgd291bGQgc3RpbGwgYmUg
Y29uZnVzaW5nIGFuZCANCmF3a3dhcmQuIFRoaXMgaXMgYmVjYXVzZSwgaW4gdGhhdCBjYXNlLCB3
ZSB3b3VsZCBuZWVkIHRvIGRlZmluZSBzb21lIA0KcmFuZ2UgZm9yIGVTUElzLCBzdWNoIGFzIGEg
bnVtYmVyIGZyb20gOTYwIHRvIDE5ODQsIHdoaWxlIGluIHRoZSBEVFMgDQpmaWxlLCB3ZSB3b3Vs
ZCBkZWZpbmUgdGhlIElOVElEIG9mIGVTUElzIGFzIGJlaW5nIGZyb20gNDA2NCAoMHhGRTApIHRv
IA0KNTA4OCAoMHgxM0RGKS4gQWRkaXRpb25hbGx5LCB0aGUgY3VycmVudCBtYWlubGluZSBkZXNj
cmlwdGlvbjoNCg0KID4gVGhlIG51bWJlciBvZiBTUElzIHNob3VsZCBtYXRjaCB0aGUgaGlnaGVz
dCBpbnRlcnJ1cHQgSUQgdGhhdCB3aWxsIGJlDQogPiBhc3NpZ25lZCB0byB0aGUgZG9tYWluLg0K
DQp3aWxsIGFsc28gYmUgaW5jb3JyZWN0IGluIHRoaXMgY2FzZS4NCg0KPiBXaGF0IHlvdSBhcmUg
ZGVzY3JpYmluZyBpcyAibWF4IFNQSSBudW1iZXIiLCBidXQgdGhlIHBhcmFtZXRlciBpcyBjYWxs
ZWQNCj4gIm5yX3NwaXMiLiBJZiB3ZSB3YW50IHRvIGxlYXZlIHRoaW5ncyBjb25zaXN0ZW50LCB3
ZSBlaXRoZXIgbmVlZCB0bw0KPiBkZXByZWNhdGUgbnJfc3BpcyBpbiBmYXZvciBvZiBtYXhfc3Bp
X25yLCBvciBzZXZlcmVseSByZXdvcmsgbnJfc3BpDQo+IGxvZ2ljLCBzbyBpdCBjYW4gaGF2ZSB2
YWx1ZXMgZnJvbSAwIHRvIDE5ODQuLi4NCj4gDQo+IFBlcnNvbmFsbHksIEknZCBwcmVmZXIgbWF4
X3NwaV9uciBhcHByb2FjaCwgYmVjYXVzZSBpdCB3aWxsIGJlIGxlc3MNCj4gY29uZnVzaW5nIGZv
ciBhIHVzZXIuIEkgYW0gY3VyaW9zIHdoYXQgQVJNIG1haW50YWluZXJzIHRoaW5rIGFib3V0IHRo
aXMuDQo+IA0KDQpJIGFsc28gYWdyZWUgdGhhdCBucl9zcGlzIGlzIG5vdCBwcm9wZXIgbmFtaW5n
IGluIHRoZSBjb250ZXh0IG9mIGVTUElzLiANCkludHJvZHVjaW5nIG1heF9zcGlfbnIgYW5kIGRl
cHJlY2F0aW5nIG5yX3NwaXMgaXMgYSBnb29kIG9wdGlvbiwgYnV0IA0KdGhpcyB3b3VsZCByZXF1
aXJlIGFkZGl0aW9uYWwgdXBkYXRlcyB0byB0aGUgdG9vbHN0YWNrLCBkb2N1bWVudGF0aW9uLCBl
dGMuLg0KDQpUaHVzLCBJIHByb3ZpZGVkIGFkZGl0aW9uYWwgdGVjaG5pY2FsIGRldGFpbHMgaW4g
dGhlIGNvbnRleHQgb2YgZVNQSXMsIA0Kd2hpY2ggd2lsbCBiZSBoZWxwZnVsIGZvciB1c2VycyBl
dmVuIHdoaWxlIHVzaW5nIHRoZSBjdXJyZW50IG5yX3NwaXM6DQoNCiA+IFRoZSBlU1BJcyBpbmNs
dWRlcyBhbiBhZGRpdGlvbmFsIDEwMjQgU1BJcyBmcm9tIHRoZSBlU1BJIHJhbmdlICg0MDk2DQog
PiB0byA1MTE5KSBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgZXh0ZW5kZWQgU1BJcyAoR0lDdjMu
MSspIGFuZA0KID4gQ09ORklHX0dJQ1YzX0VTUEkgaXMgZW5hYmxlZC4NCg0KVGhpcyBkZWZpbml0
ZWx5IG5lZWRzIHRvIGJlIGFncmVlZCB1cG9uIHdpdGggQVJNIG1haW50YWluZXJzLg0KDQo+IA0K
Pj4gK2Zyb20gdGhlIGVTUEkgcmFuZ2UgKDQwOTYgdG8gNTExOSkgaWYgdGhlIGhhcmR3YXJlIHN1
cHBvcnRzIGV4dGVuZGVkIFNQSXMNCj4+ICsoR0lDdjMuMSspIGFuZCBDT05GSUdfR0lDVjNfRVNQ
SSBpcyBlbmFibGVkLiBJZiB0aGUgYG5yX3NwaXNgIHBhcmFtZXRlciBpcyBub3QNCj4+ICtzcGVj
aWZpZWQsIHRoZSB2YWx1ZSBjYWxjdWxhdGVkIGJ5IHRoZSB0b29sc3RhY2sgd2lsbCBiZSB1c2Vk
IGZvciB0aGUgZG9tYWluLg0KPj4gK090aGVyd2lzZSwgdGhlIHZhbHVlIHNwZWNpZmllZCBieSB0
aGUgYG5yX3NwaXNgIHBhcmFtZXRlciB3aWxsIGJlIHVzZWQuIFRoZQ0KPj4gK251bWJlciBvZiBT
UElzIHNob3VsZCBtYXRjaCB0aGUgaGlnaGVzdCBpbnRlcnJ1cHQgSUQgdGhhdCB3aWxsIGJlIGFz
c2lnbmVkIHRvDQo+PiArdGhlIGRvbWFpbi4NCj4+ICAgDQo+PiAgID1pdGVtIEI8dHJhcF91bm1h
cHBlZF9hY2Nlc3Nlcz1CT09MRUFOPg0KPiANCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

