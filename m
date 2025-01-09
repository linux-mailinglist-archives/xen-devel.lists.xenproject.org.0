Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E376A07312
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 11:28:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868057.1279601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVplU-0004sg-KR; Thu, 09 Jan 2025 10:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868057.1279601; Thu, 09 Jan 2025 10:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVplU-0004pX-Gv; Thu, 09 Jan 2025 10:27:48 +0000
Received: by outflank-mailman (input) for mailman id 868057;
 Thu, 09 Jan 2025 10:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FDwX=UB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tVplT-0004pP-2i
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 10:27:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20606.outbound.protection.outlook.com
 [2a01:111:f403:2606::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5da93856-ce74-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 11:27:45 +0100 (CET)
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6538.eurprd08.prod.outlook.com (2603:10a6:10:23d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 10:27:43 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 10:27:43 +0000
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
X-Inumbo-ID: 5da93856-ce74-11ef-a0df-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcZdPjvvFSeVDjVsjZ7z/VKpehH4SYCQI+qRhp/suM0osbGJoHGCAl7E8qsIPkixh+QHTj4VaG+I4WbLYkLGrVuG63CZW4NpKJfvhn/4IDVUdoG1pUw+h8xEekhgnJWH/+Kty8RYv3NAV9IIFUvneSH6D/DXpnb8QMmaKtZFTTERRsJvxvi7qpset5A8DUlDzMb3QcFlk3vYTQ3GPS7oh2gHa6g7dZr/DD442HTXhz0U5Tm+mlwJGOn2mJG7oBKcIeiZErsedaVs0njk2c4jBnzgBkiZ8Wi6HxXG4nIcSpGHIyxShg+wm2GJefCFB4i3mhuHPITIsmh07Wp0AbFsiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spWB7WZJ3mOOCrxR61K99E1n6pyz4HLiqX8OAGxzrsk=;
 b=PHFpLF/Uo9w27ERHwj+ooeZZS70YfyCLAhtcgHZA2ONDqojMKyPJsxx5/iUOEuQty7oIBD1Z6dlMoSFbAhmzdWzXPSrX+vrXgMso/J0MkY5G0DWS9vrMwI8ZFh9dEq9DnTlBy8mG5IVVkdKMtBMidUpTagWyZU9QRmuCYoHf0Q0zXAQx3cxEsqmftTxwvfhKOAM+AGC52zBm8U1aniV4+rxPZV/vyMDF2EjtK+2QaBGqzg6telDuIAQ7K1ROStD7ETVC8DAwj9bTfZAnIwxMA65i7bOXfhutQSlbw5M//w87LgCV0ADssOdefhWzRyEIrzWARtrJG/mOk9GXiSrIrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spWB7WZJ3mOOCrxR61K99E1n6pyz4HLiqX8OAGxzrsk=;
 b=f1gzy8zkz7SXxJU3b+N41oh69hlEzYXzYXZyenzCVJ6FxmiQBoQTge0wD+oUUH3O1kI88qvkihjQUU0XUoP8idcbB6uhSUcG74/ZX+IZCUVJtwgy/lrI2pK8OP7hBudvLk0oehdZb8BxKQC6EN7K0q+L0wGuwmWMZA68qcy6CkI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
Thread-Topic: [PATCH v2] xen/arm: Fully initialise struct membanks_hdr fields
Thread-Index: AQHbYnjhSKvjiFv/ZkKm32Sq0WkbbrMONdAAgAACYACAAAFJAIAAA8eA
Date: Thu, 9 Jan 2025 10:27:43 +0000
Message-ID: <3F4D5A7A-0999-417C-91E6-3EE2ECD4759A@arm.com>
References: <20250109092816.1619834-1-luca.fancellu@arm.com>
 <e9477b85-1c9a-4aa6-b7fe-90286fcd461b@amd.com>
 <7D68D11E-E4EF-4521-9017-112DAA2B9B11@arm.com>
 <822cde40-a4a2-4d25-90e1-5421caa7b334@amd.com>
In-Reply-To: <822cde40-a4a2-4d25-90e1-5421caa7b334@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|DB9PR08MB6538:EE_
x-ms-office365-filtering-correlation-id: ad30341e-5d6b-42c0-1e20-08dd309840e0
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b2ttVWVsWW1iMkZ1TWZJQVZ6RUtkRk8vS01TbXh4NWxFaFBJLyt2ODRkdFh1?=
 =?utf-8?B?T3VDcWVSTUZMaTcwZ2lOS0hGUDdvTllMa2h3VkVzd1JsMmV2cWFLa2NUZVA3?=
 =?utf-8?B?V1Zvcm9IRFdPSDBwellXRWNNODFvMFkrdkVvM2IrSHU2UVJMUjc3NjBhb0Jp?=
 =?utf-8?B?cmVva01PaXNhcWZsNkFRK3crRldBYVZPTEphazRZMlRzYkRtYTZzZUxuOG81?=
 =?utf-8?B?RUdhNDRsWTZ3NU51OVMzS21vRVozU3doLzhVazdOZUV1ci9ma21JQ29qMlJI?=
 =?utf-8?B?UTZwM0lBenpiU2NldUU5WUtwZ0p4RlZ5SndJTCsyd2MvbXNLaVluMURMM1Aw?=
 =?utf-8?B?d0xPYVM3WUc3c2JraWo3OGFKd1hPRVVPV1k4Z2tWSVl2c2k5cVF2ejViYjRG?=
 =?utf-8?B?anRPaXFwSGhHUS9yc2V3THBKNTNXbmRkRnVweTQ2VS9KTXRQSUlJamt5dlU2?=
 =?utf-8?B?bVB4ME9vbmpMeDZzYWNxbUR0VW14OFIreENrbG1oNnhDb0UvT0Z6dWdxREcy?=
 =?utf-8?B?NzBzSnZtYm8xS1BkZjNHQjdkanF4eDdyK0N2RXhCZkpiaE5VdWk4U1hZNGtj?=
 =?utf-8?B?dWs1aDF2M1QxRmdmWVlMdCtxVUJvc3pVKy9uWmJNdzhnK2N0ZXZteFRWMGZs?=
 =?utf-8?B?WVdpMzI0RjBndTNCWm1YNEdXMGdBcWFMTm9hRzdVSFVTQTMvdUFQWmpFZk01?=
 =?utf-8?B?U2hkMU9ZK2NYa21mdzIwaENNajgyNUN6Q0JsMVhidlkzdldUOFRzemkwcmJ1?=
 =?utf-8?B?Z01PRzkyUU1tTVljN2drVzF5ZUVsOEdraXRhOHJaZUJSbElVWk44QVJjWHk5?=
 =?utf-8?B?L0JhdFoyc0ppQnJGcHUydWgrWG5NSkY3QUU5c2Y0SXBKNHFBazFXTGJOOGFX?=
 =?utf-8?B?OXkzaXd6Rzl2Q3NpWCtyQTFQcmtDMnFYbGtuMGdYOWVXYkxzL0Y2ajBzdU8z?=
 =?utf-8?B?SS9JWVBlbGVSQjRlZXBreXpvOUxOdEdub0NHTDhNQzExWDJ0VVMzWVgzdEQ5?=
 =?utf-8?B?MXVjOGhHc3B0WlppbnJtM2JHOU9jKzUrTE9KeGJ1OHdDOTNsVkNZeUpwK08x?=
 =?utf-8?B?OTYyOWc3NnlMSExQSkwwZW1nL2w1TmJwSWlhVm4yVEdCa21ubnVLZWdUMUc0?=
 =?utf-8?B?Z1dmSE9ZZWd5Uk5NTXlSR3pWNkdSY1l6cWx1Ty9ocDgzbmNPZzIyZE9US3Nh?=
 =?utf-8?B?OFZPREpBMWZkQm15RG1CZnFkeXIrWXAyMmdhOWhzd0d1aTZFTTlLOWZLNlhD?=
 =?utf-8?B?cGx0R2VOcmFrNFNOVnMyTktld0p0dVNQT2FORUJ0aFBxWEhpZ203RjI0QXdN?=
 =?utf-8?B?Z0NhdkwrMFkvT1lWKzA1UjFkMllGOG1ZajNFZmlHRm9lczRncGtUZlVndUQz?=
 =?utf-8?B?RTN5RmxvNzczNE5heE54R0wzQzJMbDczZTR6QmxWaGUxaVJWeGNmcG5hUTZs?=
 =?utf-8?B?RXNITnBmM0RDSTJFZmZyZERQeFgzS0VWRVoxWEJXUmZISUFLSERIcFZYazRR?=
 =?utf-8?B?Z1RLSjRtSFJPQTRPL3I4ZW9raW1jaUdjNlk5VEpMMks4YXI2RU1zVGI5WWVw?=
 =?utf-8?B?YWw2WGZLcUhhbmFlUGtqU1NHclBmd1ZtbzNOZURaN21CZDJvUkkvcHdrSGM4?=
 =?utf-8?B?RzRjdis1Yjd1YnFFWk5aU3hrOWdSSllxaHkrc2RBQTZjRE9YbjBoYTg2RWVV?=
 =?utf-8?B?Y25aeFRCWXdvdkw5WnNSdFRKNHcwRnUvMlBzcUZpUW0zeVQwZm05NnpQaDJs?=
 =?utf-8?B?eXc2Wnk1WUFJSGpXS0FwVWlLQU5Yb0tETTExR0MzN0hDd1RISjErTHFSMjdK?=
 =?utf-8?B?eHFzdyszb3l1VWg1Qm5IQTZYRVhFRWxQdFNHL0VsejRsMnFTUlVDM1ovTXBT?=
 =?utf-8?B?c2FqelRyS2ozSWhTSDhkZ1RMM0wzMjNBeUtOQ3l5V0lqb0Z1ZGw1OFAwVjA2?=
 =?utf-8?Q?L/oSaEO3GuAzFx1tFhgo4jpLsuXcpF3s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWNFQ1ZqeFRvTHhnaWR1cit3R1kzT01EWHdwN3BwNXFudlZZQ0dSRHNsbWhh?=
 =?utf-8?B?M0kyQjlVWDNCaHlLSEo1OUxsUDF2RERwOWhudGZvU25ISkVCa0lqekEwdGp6?=
 =?utf-8?B?UHRrNHJBb2NaV09ZN1hPZGlJNmJJaVAvenNtR3dOZFQxSVZRUnJ5Q2lYYkpN?=
 =?utf-8?B?KzFzOTl6VDhxZzFYeHFFNy8yalRSOS8wMXpoaWY5OFVrSGRPL1FmSWcwanBi?=
 =?utf-8?B?eFpuaGxta2ttSzIvSjBOQUJpOUVzbUxib0Y3VDNyTGRiY2xpQll6R3dZOFBW?=
 =?utf-8?B?OFFrNlIxNForK0FHNnJKWWQrT3FYcWNITjA5bzBvdGNjU2h1eU5Db1FtVHpD?=
 =?utf-8?B?aUZQdGlSZUxjL3l3V0R0VmJQMEEraWxmdmdQYU5KSGlMRG1HanMxYmxLR1lC?=
 =?utf-8?B?TmpRcFlsTlRZUTBtSnpzeTk0UzdFZzBkVXV5NTlPUGJsZ2VsM1R4dlQvcTRQ?=
 =?utf-8?B?a1dmcGxWV0tWZE1rT296TEkvNTFDcjEwL254V3ZLVGpSM1VzSXNZRGVreC82?=
 =?utf-8?B?RDA3WmtwdlRxdW5ha0tyZTA1cWpmYlF4aU1LY2lBM0ZhNzQ0ZkVvWGhTTU1n?=
 =?utf-8?B?VDVZUDYyQ1hNQTY0bmJaSG1Dd1ZuSUNTbUJ3ZnA3NGNOYm8rdWZBZTMwL2Yz?=
 =?utf-8?B?VVlZZGd1VW1yYzNPZnM4NlhaREt3NGNObGJOSEtzN0dGWlROSVVkcHA3eWZl?=
 =?utf-8?B?QVpWeThpNERZMGt5NTRVWXVCcnVvWHN2d2NENmNLZVo2ODlHRnZKRDZxVmIr?=
 =?utf-8?B?S0ZBdnhCYkRjbWZHc014M3JCMW1tcnRaYWJHNmI0VXFRWGVVQWxTNHFJMCsx?=
 =?utf-8?B?YWZIcGZvZWhqYUxYUU5aOFFWT0xMT2hTemNXVUV4VzI0L3F4V1VQb1p5cmFt?=
 =?utf-8?B?NDg2NjkyamZKd1kvYnlhUUtKWVlnd1N5SmhPMFlKd2p1dC9wQ1pIbWVnZzNU?=
 =?utf-8?B?SVlxTnllOG4wNG0yZmFBNFRwOEMxcWFoL20rcXdnODNaRTFXUW9tOFdqNkdq?=
 =?utf-8?B?dDVOUVBsNnBjTGUxdTl5dkc1dFZVVjFRMnFGQ2NwOFhFN3JVaThpM1ZMYmw5?=
 =?utf-8?B?TEpud0drdyt0OVREQjIvUUZGUjU2MkJoTTJBKzBQU2VPY1A3NG5CTThBVGRC?=
 =?utf-8?B?NVZDYTdqVWFXVjJkc25FWXdmZFpSQnFvdkpLUnVPdjU2WkZmbGltdjRnRit1?=
 =?utf-8?B?T3duMlJ3VXpDSjUzRTRZMXI2RHdEd2VGeVN4MDltWEtURFJaeTRodDFWMnUy?=
 =?utf-8?B?S3NWY0k4Skg3YXV4R1cwN3pPL0NOSGZMTW1BSzY3c3hmdnc4WVc3T2V6cUdy?=
 =?utf-8?B?VXVqbXkxRVRTb3ZZUFloRmpQQnd2M2taQ0RzbHN4OVI2cEY4ZGNvUkI5K3Qr?=
 =?utf-8?B?RXFaSkFsVjJLcFpDWjJnVkIzeUNwdDJXWCs2NmVvR29yclVFUEduSzV2K1V2?=
 =?utf-8?B?YjhnL1lmYmM4NG9vWUVrQUtVUkd3WHlING0wdnVRNWVnblFzaW0vVlNlRUxa?=
 =?utf-8?B?K0orckZ1bHdBb0FENDBhc2NDdHVwTkFUSUpvRDR2Q21sYW14Q0xaVzZxQXhp?=
 =?utf-8?B?TWNRa0J6YU11VXJ3MDRvem13aU02U0hSWG1jczNtVnNEVVc5ZEcvemEycFM4?=
 =?utf-8?B?b29Ib01ld3czazg1YzhuRGo0Uk54aVhCUThSdThtWjBOR3JrR1MwbndYNWVV?=
 =?utf-8?B?MVNrajM4MzNXRGFWZ1hZbk8zRXNyeFJvVklSajNYWWtNcU9wT1U4NGphRXdp?=
 =?utf-8?B?SWx3RHJDK3pmR1NaVTE4ZDVaVXgxU0Y4L0h6VzVHUHB1MmJvWkJkTHBDa1Za?=
 =?utf-8?B?aGJFamJUUHd5ZGZLYThON1pZU2NldDFLN0dTdXhUYXJpQXpEQ3lZSHdITEVO?=
 =?utf-8?B?akQ4b0FlYlQvSmtPaTg4aldtMXNrSlJlc08vS29heG9SRGE5a2VUN0hKUlBG?=
 =?utf-8?B?bXYwZ0prRG93aUM4RFpEdDF4b3dtcHp0REZPelpHaDNrellTSjNaUXZFc1V6?=
 =?utf-8?B?VEtHWFdpTG5lalJ1bkxkVGw1L1BCSEF4MGwvWnF1ZXRiMFFMc1N2bHJ0M1FS?=
 =?utf-8?B?UENSWnhOU2hXRndGbkZqUG1VU29USE1MZUFZdDlmS2ZVSFo1NVFDSDNqdC9i?=
 =?utf-8?B?RDJwOWQ5dFlCR2RkS1N5cjQwWlE5VjM1Y2RrMUp4YlVKbDZYM0sxZjJrOTBU?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13CA0D2E8C0A3C4583AFA15E46F009B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad30341e-5d6b-42c0-1e20-08dd309840e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 10:27:43.7518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qM9xOV2SP1UfwXnoLUCfKqiOPI3gsuSEYkPPgYbSS6EwrQYSNoyDfUIyWLjMvLfdugfqyKjNxsn/8VhuhTiFWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6538

Pj4gDQo+Pj4gDQo+Pj4+IC0tLQ0KPj4+PiAtLS0NCj4+Pj4geGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jICAgICAgIHwgMTMgKysrKy0tLS0tLS0tLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20va2VybmVsLmggfCAgNSArKysrLQ0KPj4+PiB4ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVt
LmMgICAgICAgfCAgMyArKy0NCj4+Pj4geGVuL2luY2x1ZGUveGVuL2Jvb3RmZHQuaCAgICAgICAg
IHwgMTYgKysrKysrKysrKysrKysrKw0KPj4+PiA0IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiBp
bmRleCBiMDcyYTE2MjQ5ZmUuLjllMzEzMmZiMjFkOCAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYw0KPj4+PiBAQCAtMTAzOSw3ICsxMDM5LDcgQEAgdm9pZCBfX2luaXQgYWxsb2NhdGVfbWVt
b3J5KHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQo+Pj4+ICAg
ICAqLw0KPj4+PiAgICBpZiAoIGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+Pj4+ICAgIHsNCj4+
Pj4gLSAgICAgICAgc3RydWN0IG1lbWJhbmtzICpnbnR0YWIgPSB4emFsbG9jX2ZsZXhfc3RydWN0
KHN0cnVjdCBtZW1iYW5rcywgYmFuaywgMSk7DQo+Pj4+ICsgICAgICAgIHN0cnVjdCBtZW1iYW5r
cyAqZ250dGFiID0gbWVtYmFua3NfeHphbGxvYygxLCBSRVNFUlZFRF9NRU1PUlkpOw0KPj4+PiAg
ICAgICAgLyoNCj4+Pj4gICAgICAgICAqIEV4Y2x1ZGUgdGhlIGZvbGxvd2luZyByZWdpb25zOg0K
Pj4+PiAgICAgICAgICogMSkgUmVtb3ZlIHJlc2VydmVkIG1lbW9yeQ0KPj4+PiBAQCAtMTA1Nywx
MyArMTA1NywxMCBAQCB2b2lkIF9faW5pdCBhbGxvY2F0ZV9tZW1vcnkoc3RydWN0IGRvbWFpbiAq
ZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykNCj4+Pj4gICAgICAgIGdudHRhYi0+YmFua1sw
XS5zdGFydCA9IGtpbmZvLT5nbnR0YWJfc3RhcnQ7DQo+Pj4+ICAgICAgICBnbnR0YWItPmJhbmtb
MF0uc2l6ZSA9IGtpbmZvLT5nbnR0YWJfc2l6ZTsNCj4+Pj4gDQo+Pj4+IC0gICAgICAgIGh3ZG9t
X2ZyZWVfbWVtID0geHphbGxvY19mbGV4X3N0cnVjdChzdHJ1Y3QgbWVtYmFua3MsIGJhbmssDQo+
Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOUl9NRU1f
QkFOS1MpOw0KPj4+PiArICAgICAgICBod2RvbV9mcmVlX21lbSA9IG1lbWJhbmtzX3h6YWxsb2Mo
TlJfTUVNX0JBTktTLCBNRU1PUlkpOw0KPj4+PiAgICAgICAgaWYgKCAhaHdkb21fZnJlZV9tZW0g
KQ0KPj4+PiAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+Pj4gDQo+Pj4+IC0gICAgICAgIGh3ZG9t
X2ZyZWVfbWVtLT5tYXhfYmFua3MgPSBOUl9NRU1fQkFOS1M7DQo+Pj4+IC0NCj4+Pj4gICAgICAg
IGlmICggZmluZF91bmFsbG9jYXRlZF9tZW1vcnkoa2luZm8sIG1lbV9iYW5rcywgQVJSQVlfU0la
RShtZW1fYmFua3MpLA0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBo
d2RvbV9mcmVlX21lbSwgYWRkX2h3ZG9tX2ZyZWVfcmVnaW9ucykgKQ0KPj4+PiAgICAgICAgICAg
IGdvdG8gZmFpbDsNCj4+Pj4gQEAgLTEyOTMsNyArMTI5MCw3IEBAIHN0YXRpYyBpbnQgX19pbml0
IGZpbmRfaG9zdF9leHRlbmRlZF9yZWdpb25zKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2lu
Zm8sDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IG1lbWJhbmtzICpleHRfcmVnaW9ucykNCj4+Pj4gew0KPj4+PiAgICBpbnQgcmVzOw0KPj4+
PiAtICAgIHN0cnVjdCBtZW1iYW5rcyAqZ250dGFiID0geHphbGxvY19mbGV4X3N0cnVjdChzdHJ1
Y3QgbWVtYmFua3MsIGJhbmssIDEpOw0KPj4+PiArICAgIHN0cnVjdCBtZW1iYW5rcyAqZ250dGFi
ID0gbWVtYmFua3NfeHphbGxvYygxLCBSRVNFUlZFRF9NRU1PUlkpOw0KPj4+PiANCj4+Pj4gICAg
LyoNCj4+Pj4gICAgICogRXhjbHVkZSB0aGUgZm9sbG93aW5nIHJlZ2lvbnM6DQo+Pj4+IEBAIC0x
Mzc0LDEyICsxMzcxLDEwIEBAIGludCBfX2luaXQgbWFrZV9oeXBlcnZpc29yX25vZGUoc3RydWN0
IGRvbWFpbiAqZCwNCj4+Pj4gICAgfQ0KPj4+PiAgICBlbHNlDQo+Pj4+ICAgIHsNCj4+Pj4gLSAg
ICAgICAgZXh0X3JlZ2lvbnMgPSB4emFsbG9jX2ZsZXhfc3RydWN0KHN0cnVjdCBtZW1iYW5rcywg
YmFuaywgTlJfTUVNX0JBTktTKTsNCj4+Pj4gKyAgICAgICAgZXh0X3JlZ2lvbnMgPSBtZW1iYW5r
c194emFsbG9jKE5SX01FTV9CQU5LUywgUkVTRVJWRURfTUVNT1JZKTsNCj4+PiBJJ20gYSBiaXQg
Y29uZnVzZWQgd2hhdCBpcyB0aGUgZXhwZWN0YXRpb25zIGJlaGluZCB1c2luZyBkaWZmZXJlbnQg
dHlwZXMgb2YgZW51bSByZWdpb25fdHlwZSwgbW9zdGx5IGJlY2F1c2UgaXQgY2FuIHBvaW50IHRv
DQo+Pj4gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzIGRlcGVuZGluZyBvbiB0aGUgY29udGV4dC4g
QWJvdmUsIHlvdSBtYXJrZWQgZ250dGFiIGFzIFJFU0VSVkVEX01FTU9SWSAoSSBndWVzcyBiZWNh
dXNlIHRoaXMNCj4+PiByZWdpb24gaGFzIGFscmVhZHkgYmVlbiBmb3VuZCAtIGJ1dCBpbiBmYWN0
IGl0IGlzIHN0aWxsIHVudXNlZCkgYW5kIGh3ZG9tX2ZyZWVfbWVtIGFzIE1FTU9SWS4gU28gSSB3
b3VsZCBhdCBsZWFzdCBleHBlY3QNCj4+PiBleHRfcmVnaW9ucyB0byBiZSBvZiBNRU1PUlkgdHlw
ZSBhcyB3ZWxsLiBBZnRlciBhbGwgYm90aCBod2RvbV9mcmVlX21lbSBhbmQgZXh0X3JlZ2lvbnMg
Y29udGFpbg0KPj4+IGJhbmtzIG9mIHVudXNlZC9mcmVlIG1lbW9yeSAoYWx0aG91Z2ggZm9ybWVy
IGxpc3RzIGhvc3QgbWVtb3J5IHdoaWxlIGxhdHRlciBjYW4gYWxzbyBjb250YWluIGd1ZXN0IHBo
eXNpY2FsDQo+Pj4gbWVtb3J5KS4gQ291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IHRoZSBpbnRlbmRl
ZCB1c2U/DQo+PiANCj4+IFlvdSBhcmUgcmlnaHQsIHRoYXQgc2hvdWxkIGJlIE1FTU9SWSwgbXkg
YmFkISBDb3VsZCBpdCBiZSBzb21ldGhpbmcgYWRkcmVzc2FibGUgb24gY29tbWl0IG9yIHNob3Vs
ZCBJIHNlbmQgYW5vdGhlciBvbmU/DQo+IEkgY2FuIGRvIHRoYXQgb24gY29tbWl0IGJ1dCBmaXJz
dCwgY2FuIHlvdSBwbGVhc2UgYW5zd2VyIHdoYXQgaXMgdGhlIGludGVuZGVkIHVzZSBvZiBlbnVt
IHJlZ2lvbl90eXBlPw0KPiBBdCBmaXJzdCBJIHdhcyBleHBlY3RpbmcgZ250dGFiIHRvIGJlIE1F
TU9SWSBhcyB3ZWxsLiBJIGRvbid0IHNlZSBhIGRpZmZlcmVuY2UgYmV0d2VlbiBhIHJlZ2lvbiBw
cmVwYXJlZCBieSBYZW4NCj4gZm9yIGRvbWFpbiB0byBzdG9yZSBnbnR0YWIgdnMgZXh0ZW5kZWQg
cmVnaW9ucy4gQm90aCBzcGVjaWZ5IHJlZ2lvbnMgb2YgdW51c2VkIGFkZHJlc3Mgc3BhY2UuIEl0
J3MganVzdCB0aGF0IHRoZSByZWdpb24NCj4gZm9yIGdudHRhYiBtdXN0IGFsd2F5cyBiZSBwcmVz
ZW50IGJ1dCBleHRlbmRlZCByZWdpb25zIGRvbid0IGhhdmUgdG8uDQoNClJpZ2h0LCBhdCBmaXJz
dCBJIHRob3VnaHQgZ250dGFiIGNvdWxkIGJlIHJlc2VydmVkIG1lbW9yeSwgYnV0IG5vdyB0aGF0
IHlvdSBwb2ludGVkIG91dCBpdOKAmXMgbm90IHRoZSByaWdodCB0aGluZyB0byBkbywgSSByZW1l
bWJlcg0Kbm93IHRoYXQgdGhlc2UgdHlwZSByZWZsZWN0cyB0aGUgZGV2aWNlIHRyZWUgZ3JvdXBp
bmcgZm9yIHRoZSBtZW1vcnkgYmFua3MsIHNvIFJFU0VSVkVEX01FTU9SWSBpcyBvbmx5IGZvciB0
aGVzZSByZWdpb25zDQppbiB0aGUgL3Jlc2VydmVkLW1lbW9yeSB0cmVlLCBTVEFUSUNfU0hBUkVE
X01FTU9SWSBpcyBmb3IgdGhlICd4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjHigJkgY29tYXB0
aWJsZSBub2RlIGFuZA0KTUVNT1JZIGlzIGZvciAvbWVtb3J5IHJlZ2lvbnMuDQoNCk5vdyBJIHdv
dWxkIHNheSB0aGF0IHdlIGNvdWxkIHVzZSBNRU1PUlkgYWxzbyBmb3IgcmVnaW9ucyBwcmVwYXJl
ZCBieSBYZW4gYXMgbG9uZyBhcyB3ZSBkb27igJl0IG5lZWQgdG8gZGlmZmVyZW50aWF0ZSB0aGVt
IGluDQphIGRpZmZlcmVudCB3YXkgZnJvbSAvbWVtb3J5IHJlZ2lvbnMuDQoNClBsZWFzZSBsZXQg
bWUga25vdyB5b3VyIHRob3VnaHRzLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

