Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60709B31815
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 14:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090100.1447488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upR54-0006rK-QW; Fri, 22 Aug 2025 12:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090100.1447488; Fri, 22 Aug 2025 12:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upR54-0006oq-Mt; Fri, 22 Aug 2025 12:41:18 +0000
Received: by outflank-mailman (input) for mailman id 1090100;
 Fri, 22 Aug 2025 12:41:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upR53-0006ok-CO
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 12:41:17 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b734f5d-7f55-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 14:41:16 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AS8PR03MB8042.eurprd03.prod.outlook.com (2603:10a6:20b:346::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 12:41:14 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 12:41:14 +0000
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
X-Inumbo-ID: 4b734f5d-7f55-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKtURbNZWlv7xaD6PrIZiytozFPcGLX4Bp/y/Ly3aHoFeuFnkwc5tmTt1u5kF2I/jxsclQYg6Rq0Q7c0gi9gSzthkfgdziv+eqTn9zz/FKU7+jqkEnUQ7zeXUz3jMet+rwIYCdRxpXXHnAoEu1yy4nKdeWCqSylKE8jQo+qv6lRaoFtO04gFfz4kpazcXfGznukJaikmz7Wg/dZ7Cu7/F5Zs+W372C/1qoycZb262r9iIubZ9wEX+ypExjbobyKLuN8xiIKbhv6My/WueHSRzMuZzr5YdIsDYzZk/gY6hBZb3C03KJk4yJ3haFc378vKd4uuO6KCm/chtrwDaOEdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCdyXthG6RAW3y6I88QnzFURi9gk/BfMeaPG1HRcPlE=;
 b=jRZ5BZcnyjB8/Yj9bjSoqxXsxnhT+pDDG1beYd1P5t+/AQUFpNK9sctRf8KLqSAAj9urzWx3yIw6MttIQ5Ir+3VnSf45BgpL2P6SVderDxutFHpKm1S+EnV1UeE/V+m1SRxeJzFtE5L+g51OYNefVWyp4M+yJcxX9thvfJP9i5s+lcjo/beL5IkjVHwHxXhr1nUWRKAYD5U6RYDoDxJbZCnjFRPdQfiCOWHmZbU5IK7EKDaTmjg7Pyji/9Y6G1iRtpb9QN+W0FHHjKx84ukNzhVZTJE1voN42OZ7LM06v6V+/7/DC/bWdt1ROaT5AY+xDxm1CFaaEk9iHTZfiUWwzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCdyXthG6RAW3y6I88QnzFURi9gk/BfMeaPG1HRcPlE=;
 b=oxMn5gSsvC4QjYvPcTD9m1ltiA13xyr+qdIBVi3tyiS7Xx0FWlAtG8CEcG5U8nJ1NsBrP+oh1eUhR9K0s3ePWL57OqbXuSwspEZy7muTfNS5cNs/ME3K6S6tpYqbQNF6v2rRT/7ZMcRBLlGdUAdlvgSE7lBnf/wALoSaX95tHJ1psADj2yS6W9QfpBGef+S9L8gwIIYoYARstOJpKGDKI7APCjJjoFuOL+U6gBtq4yHhiAxOxCvlQ7PE3Ued0X1AevoDCYVOEYEtuL4Rxhjvlubf+Q9mlchctwzVmZ90BFhYPw3VM40GEgeoIIpp5LGWQ0X89t3EGDNc7w0x+Zz8fQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcB5d7kgaRrTB4eUK2JDUmO9y7H7RtbrKAgAFGNYA=
Date: Fri, 22 Aug 2025 12:41:14 +0000
Message-ID: <4b42f52a-86fb-4cbd-b3f1-ce7662a24c7b@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
 <87ms7sekdx.fsf@epam.com> <9922f7f1-7249-424e-9bab-3aee2ce3b813@xen.org>
 <87frdkd31m.fsf@epam.com> <20328499-772c-4b32-815e-7527aa6b2cc7@xen.org>
In-Reply-To: <20328499-772c-4b32-815e-7527aa6b2cc7@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AS8PR03MB8042:EE_
x-ms-office365-filtering-correlation-id: 577ddc39-08ef-4ac3-8846-08dde1792e67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Uk02eFh4ZTdNRkoxanJKVDB2M1VMbzF5bjJUU0plM04randTOWFFZDZRYmox?=
 =?utf-8?B?QncwaUVvYkxtd1hpRVFVZlFKNjBNbEt2enc5V05TT1hCeUo2QVIwTlZXSW92?=
 =?utf-8?B?VER6R1BWMUZlYzhPeGo0WnN4Q1lmYVpURGcxaGZsRm1ic0JtcmpkNG80bWNa?=
 =?utf-8?B?VHRKNWJZcGNXUUZQc1F4eTF6aGIvNjVGazVaSnE5UW9pMjF1QWR0aDFCUVhH?=
 =?utf-8?B?cENyWnFTY0JmZmswbGt5bkh6MUdubXhLWUcvT2NxMVd1dzF5YlQ2a3ZqVWMr?=
 =?utf-8?B?Q2FjZk5vT0JKSG1selJnWUF4ZENDSllLdG5TV0V3UFlIdHJPVmMrMWVmVWRT?=
 =?utf-8?B?MW96eEViMFdCSS9JV0kvUkw4aXN6QmF3YWVmNWsxM1FaU2lZZS9BdEo3R1NB?=
 =?utf-8?B?bXY2emQzZDBsOTRHVWdQY2hpS0FQa01iUWJyQnIzQjdPbWYwZmhHMDdiV3Jn?=
 =?utf-8?B?YnZsblVkRlYwUGl0cEtHcEpDeWVWbFludGRTc1lnRmFnUnc0QU5BTWNsanR0?=
 =?utf-8?B?TUJyUlNNdkFHNW5Hbk5nM3R3eVUvZjNjd1FBZVlBUGwwMFhMaVpuVHFOcHZK?=
 =?utf-8?B?Q2RHYUR5RGFFYWk5T2NJY2RjWkRUdUtXRXlvSlk5OXdJYnFOTXkvbmdjWHNJ?=
 =?utf-8?B?ZzVlZlplL0szQUtpY3JzQUQyVU9USFduekkrMkI5NzAwMkZRQTI1OGxBVnBi?=
 =?utf-8?B?QmJ0Z3J6emZ3YVpLTlNOK3g1MUd4ZjFWc2EzN2o1OUk2VWVUeFZORFhZbzNn?=
 =?utf-8?B?YktGY3YwbEZidjIrOVhpdnVJZXdneFkyNlJGNGFLa2VDS2JocEtLMDVJRzdq?=
 =?utf-8?B?TkQzbjBTSERTc0dUeGtMK3hCUmFHaElSNENrWkoyVzUvR09NOER5MFAzalYr?=
 =?utf-8?B?Q01HUk95QmlaZ2tOZVBDM2NxNkxUUFhNcmc3elNHQ25JYzQ2L0ZicTY0b0M0?=
 =?utf-8?B?Z1g3NnBOenZORnlUTVRCOXZxUE54NTY0U1ZralVieFFJTFdvaEl5K3VYTk14?=
 =?utf-8?B?VTNRL1p6Y2kwelQ3b1NuTkl2dGdJaHZyV0d1VEVFajY3Q0dNaUkrRmRYY25N?=
 =?utf-8?B?WE9nOGUvMHJLcUlrM2haTUFWN0cvNFMydjloeWlFOWcxcUtwZ0xqK0w0WjZj?=
 =?utf-8?B?M0t3OUZWTTh1SEtDL0M4Z3dSN0lQRG5QM2wra2Q1a20xUk9YajVMSHVKTUtp?=
 =?utf-8?B?UXlleWxJV1dRQ0NvSWI2d1FmSEFIaXRnZGdtYitxMUhnamJQKzBXUWNFYy93?=
 =?utf-8?B?dHlGVVZJdWRWTDVjcTlFRWxEMVNZdDR1a04vTTJ6TzVjUmR0cGlmMjRVZWI5?=
 =?utf-8?B?eXdKOG1mMkF5bmk5eUo3bVFtbUZSZ1BTeEN3TStJNWZ6KzdzM1NlVDFJQm4w?=
 =?utf-8?B?QmFBSmwzNnd2eTUxenQvaG4xZmVJTzZ0c3dLdUlKUmNKQmMvNFZNcWtVMU1y?=
 =?utf-8?B?ZC9RTVFla3liSWgzZ3FSMmNUMFVsQVhpSnlpU0tjeFVGOFdEYnZldUNEOXVy?=
 =?utf-8?B?ZnBzcTRqdGFTU3hteXNZNjNwcXovVEVCYlZ2WXorQUd3ZnVpVmN4OG5ERFJx?=
 =?utf-8?B?U1UzQmdCNkN0TllFQ3ZXU3NQczFuN3pZUXJqSjVuUUJOMW4yMzNMRzNuVHZX?=
 =?utf-8?B?cDBmZlpLd3FiK0Y1Y0Q2WHhzZ3BLVkNaWU5SZDVjWW54SW9xRVROaTFqc1d6?=
 =?utf-8?B?U3VYVFZ4ZEpwK3ZXaVY2MnhyWHRnRFNVd0FEN044OWpvMkRUU1FNYWlHYTRn?=
 =?utf-8?B?Qmh5SjdKVTV3UENneUJjTmJXcldqek5WUW80bFdZdG4yZExtNzl4cy9jR1Ey?=
 =?utf-8?B?TmJwZXo2QWFpanN0d3RWSVRzQ0dMVWs0WmRscjFHQWlacW5ZTW9EeUVYN0ZM?=
 =?utf-8?B?TmxWWXRrYnZ2WW8wSW5hYktxaGJZaCtDQU9hZG8ydzFTYXpCYzNaRE9EN002?=
 =?utf-8?B?Tk96NUpDUWxJTzRTMTR2bnQxVEhvNmJlaFp4c1hYNnNLVmlaVm9xeXRnWnpt?=
 =?utf-8?B?QjhFRXZkK1dBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3BnTUJvUlFtdit4dzgrSmdlNDdTTVd5cWNQY3c3cHhDR2luWE01SWQyZHNI?=
 =?utf-8?B?UnlFVG5RNURuSFQxemZTZlh1RFVPNnFHdGtBSGYxVjFSdlZHdEdNNWhCaHNZ?=
 =?utf-8?B?WjFYdWg5cDMyaWtFMHJLQ2dYVUlEaURnM2RiSlRqRldZSlZCTDh3OTRFQlV5?=
 =?utf-8?B?bHFPcDg2RmVLSFlyeDJ1MVExd0x4dEE2WCtwRmpnR0lpbjN6MTlGNzMrMDZa?=
 =?utf-8?B?Z1laOXpRWnpUOVR2Ui9HWnErRzhlSnczUEJTUW1nYlJwRlZDakg3K0I1RTkw?=
 =?utf-8?B?OVlHRFZINkdtelE4UE1wc0VvcUpIb1pDZjJncVlrYk9CK21pYTNDZEthdnZB?=
 =?utf-8?B?b3Fwb2NrNGpkSUFsL2ovOS91NWVpcm5zSWNrczl2dXc4Mk8xbDFiaVQ3bC9R?=
 =?utf-8?B?NEdrUHFabldRWmZrbjUwbk1sNFpCZEExMmFNb2VGMGxzVEhqM2psTzJma0pM?=
 =?utf-8?B?cmVONGcrZE54ejJHdERLeFU2eXRrZysxUmZRNkMyTTc0VFBSTW1XSVNyaEZn?=
 =?utf-8?B?M3BGckhjRDVuQTEySlhuUHYxL2NCVEpWeTM4UXVNZkVvc1FlMjFBTDUvUlE1?=
 =?utf-8?B?cE1POVVuWkEreFhvUVJSMXZEd1FIb05TZEFvbjUxQnZscDNpeTVCdWVlVmUv?=
 =?utf-8?B?R0VENWNMZG5FYXVKRElSUkgzODhHalFZMHdnWGVQeVhCTVFVbnZQQy9MN3Yx?=
 =?utf-8?B?c2hYRDlCN1lCZlRvTWJhWFErN1crV2FNL3Y3MlRkcTM0VVR4emQ5OEZTUE9X?=
 =?utf-8?B?cHFGZ3BHbHhQWTFvZmdEM2l5UkVnQkViWDJwQVhLNU9sZWpQTG16TW5SQTNQ?=
 =?utf-8?B?MUhFZmFwc1hXRmcyMmFjWFJXRGk4ZE51cUZrZ1ZxVXoyR3VPNEcrV3JmV2pD?=
 =?utf-8?B?OGljdFpCWnc4WU5rSGIvSWkwMHJMUDlITW5kMnhZcnV3RCszZWZxSjA1azJL?=
 =?utf-8?B?QVNrZG9iN2Yyb21VeXN3REJnSWhPUVFDNGxPVE5sUmd3eGRYYzF3WUJudGt5?=
 =?utf-8?B?QTJUSnhpQXhDMzZYUGhNMFBaanhKVDhGcnpFV25YMVN1MS9nM2h3dVFaQkR4?=
 =?utf-8?B?UkF3Nm9rRnlTL2wydVZLVUxRMFVEYlg2eVZEaVBqVGlVYzVnSjVUbDk2dTVM?=
 =?utf-8?B?S3pZeUxFMWpMTVF1WllMNFNUSWdySExjcVdObFh4L3BhQ1Mrc0kvcjVKVDdk?=
 =?utf-8?B?MmZDM2ZVNi85SGpwZ0VzbHBOSlM5cm9NMS9XZC9uME9CbURyUXBaM20yYk9r?=
 =?utf-8?B?ak44S3pVbTRRd2JhTFpiald4L0pJTFNCOEVZcDdtQUN0MnpYVFowaTIzbTc1?=
 =?utf-8?B?cTRYQnFEZTRDeEFWOUMvelJwb2llWXdBNUdwSDNMaXNFQTRMV2VlQzgwTEJl?=
 =?utf-8?B?aldnWVRiZ0c2VGVGNnlDVDB0RGhQTG9EL1FLdFE2NUlaaHRydk1RcTB5RStp?=
 =?utf-8?B?RWhLTHdKMVBpQjAvdzRDaTBUc1hxT3pnQWdFalNvaXk3a2UxZ0o3RUZFQjMr?=
 =?utf-8?B?bVBDbnNkUkt6Z3d4bXFWS3BIMlNDWWRsOUtFZjlyOUNTZUdqMVB4ZW5HWXll?=
 =?utf-8?B?UmM1YWh4VVI1N0YwWkgyL1JacVV0a0k2dUlFSitOQWxSaHFKTUhSZnh6S0M4?=
 =?utf-8?B?K1E0dHhXcThycmsyNUJtTHFaaDVzaWRlQXlESTNIY0J4WXJFamtKd050WGl1?=
 =?utf-8?B?b1daMkR1VUpVVVZPbXdRSFFFbXFvM3hod3lnTUh3V1F5TlBIQ1FNVk44Z0Qr?=
 =?utf-8?B?SWxveTFQNjIxODBqbjloeVUvVk1lVldRODZKWlZiMEVNNzZRMk8zdjRVdkNQ?=
 =?utf-8?B?eTE0VmVKK3phNWFMRGZ2NVJjQ1E0NS9XRU4rZEpDanE4OEdCaFV2TkJVT0tV?=
 =?utf-8?B?NTU4SGdLblZOWm5qRm1qdFhXd1AyVFNjUG1RL0MzVkZFWSthQmQ3TTdmNVRk?=
 =?utf-8?B?ZjFUUmlwY2dRbjBzSGZ5cUpkbWRtK29sU1E0Y0RNU1lpbnhhOXBqbHR3V2lQ?=
 =?utf-8?B?dXlpWHpEN1ZzRlhwY3JJQVdzQi90SjZHS2hYYWRRZ0JDRWlvb2pKeldHUHZH?=
 =?utf-8?B?Z3BkbWZ5UmxxYi9IUXpOMGw4OUpVZHc3Qno5VFRRSWYvSEhMSXA4Uy9aZitD?=
 =?utf-8?B?WVBzNEo4RXVzMGNIa3ArZk5GTWllNGJ1blk0M3hpMk9jTnlNVVh3Y3lobEpH?=
 =?utf-8?Q?tsYumAEQi2FuZeMZ1k5qiAQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1707AFDC2E4E1446A93F630F27F2510C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577ddc39-08ef-4ac3-8846-08dde1792e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 12:41:14.1959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9HwvoGa+WFxDJqzDf0TAtk2u6NHq7ciSUfc4RlWe4lP/GZf+RsT0aW/pCl8y3n/XAAxe60GNM4cUmTfYLmmyjs9Wvh1oDWhHTYqa+TLumo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8042

SGkgVm9sb2R5bXlyIGFuZCBKdWxpZW4sDQoNClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcgY29t
bWVudHMgYW5kIGZvciByYWlzaW5nIGFuIGltcG9ydGFudCANCmRpc2N1c3Npb24gcmVnYXJkaW5n
IG1lbW9yeSB1c2FnZSBhbmQgd3JhcHBlcnMuDQoNCk9uIDIxLjA4LjI1IDIwOjEzLCBKdWxpZW4g
R3JhbGwgd3JvdGU6DQo+IA0KPiANCj4gT24gMjEvMDgvMjAyNSAxNzo1OSwgVm9sb2R5bXlyIEJh
YmNodWsgd3JvdGU6DQo+PiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cml0ZXM6DQo+
Pg0KPj4+IEhpLA0KPj4+DQo+Pj4gT24gMjEvMDgvMjAyNSAxNjo1OSwgVm9sb2R5bXlyIEJhYmNo
dWsgd3JvdGU6DQo+Pj4+IExlb25pZCBLb21hcmlhbnNreWkgPExlb25pZF9Lb21hcmlhbnNreWlA
ZXBhbS5jb20+IHdyaXRlczoNCj4+Pj4NCj4+Pj4+IEN1cnJlbnRseSwgWGVuIGRvZXMgbm90IHN1
cHBvcnQgZVNQSSBpbnRlcnJ1cHRzLCBsZWFkaW5nDQo+Pj4+PiB0byBhIGRhdGEgYWJvcnQgd2hl
biBzdWNoIGludGVycnVwdHMgYXJlIGRlZmluZWQgaW4gdGhlIERUUy4NCj4+Pj4+DQo+Pj4+PiBU
aGlzIHBhdGNoIGludHJvZHVjZXMgYSBzZXBhcmF0ZSBhcnJheSB0byBpbml0aWFsaXplIHVwIHRv
DQo+Pj4+PiAxMDI0IGludGVycnVwdCBkZXNjcmlwdG9ycyBpbiB0aGUgZVNQSSByYW5nZSBhbmQg
YWRkcyB0aGUNCj4+Pj4+IG5lY2Vzc2FyeSBkZWZpbmVzIGFuZCBoZWxwZXIgZnVuY3Rpb24uIFRo
ZXNlIGNoYW5nZXMgbGF5IHRoZQ0KPj4+Pj4gZ3JvdW5kd29yayBmb3IgZnV0dXJlIGltcGxlbWVu
dGF0aW9uIG9mIGZ1bGwgZVNQSSBpbnRlcnJ1cHQNCj4+Pj4+IHN1cHBvcnQuIEFzIHRoaXMgR0lD
djMuMSBmZWF0dXJlIGlzIG5vdCByZXF1aXJlZCBieSBhbGwgdmVuZG9ycywNCj4+Pj4+IGFsbCBj
aGFuZ2VzIGFyZSBndWFyZGVkIGJ5IGlmZGVmcywgZGVwZW5kaW5nIG9uIHRoZSBjb3JyZXNwb25k
aW5nDQo+Pj4+PiBLY29uZmlnIG9wdGlvbi4NCj4+Pj4gSSBkb24ndCB0aGluayB0aGF0IGl0IGlz
IGEgZ29vZCBpZGVhIHRvIGhpZGUgdGhpcyBmZWF0dXJlIHVuZGVyDQo+Pj4+IEtjb25maWcNCj4+
Pj4gb3B0aW9uLCBhcyB0aGlzIHdpbGwgaW5jcmVhc2UgbnVtYmVyIG9mIGRpZmZlcmVudCBidWls
ZCB2YXJpYW50cy4NCj4+Pj4gSSBiZWxpZXZlIHRoYXQgcnVudGltZSBjaGVjayBmb3IgR0lDRF9U
WVBFUi5FU1BJIHNob3VsZCBiZQ0KPj4+IMKgwqAgc3VmZmljaWVudCw+IGJ1dCBtYWludGFpbmVy
cyBjYW4gY29ycmVjdCBtZSB0aGVyZS4NCj4+Pg0KPj4+IEkgaGF2ZW4ndCBzZWVuIG1hbnkgYm9h
cmQgd2l0aCBFU1BJIGF2YWlsYWJsZS4gU28gSSB0aGluayBpdCB3b3VsZCBiZQ0KPj4+IGJldHRl
ciBpZiB0aGlzIGlzIHVuZGVyIGEgS2NvbmZpZyBiZWNhdXNlIG5vdCBldmVyeW9uZSBtYXkgd2Fu
dCB0bw0KPj4+IGhhdmUgdGhlIGNvZGUuDQo+Pg0KPj4gUHJvYmFibHksIHdlIGNhbiBleHBlY3Qg
bW9yZSBpbiB0aGUgZnV0dXJlLi4uDQo+IA0KPiBXZWxsIHllcy4gQnV0IEkgd2FzIHVuZGVyIHRo
ZSBpbXByZXNzaW9uIHRoaXMgdGhlIHByZWZlcnJlZCBhcHByb2FjaC4gDQo+IFNlZSB0aGUgZGlz
Y3Vzc2lvbiBhYm91dCBkaXNhYmxpbmcgMzItYml0IHN1cHBvcnQgb24gNjQtYml0Og0KPiANCj4g
MjAyNTA3MjMwNzU4MzUuMzk5MzE4Mi0xLWdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tDQo+IA0K
PiAgwqBBbnl3YXlzLCBhZnRlciByZXZpZXdpbmcNCj4+IGFsbCBwYXRjaGVzIGluIHRoZSBzZXJp
ZXMsIEkgY2FuIHNlZSB0aGF0IGNvZGUgd2lsbCBiZSBsaXR0ZXJlZCB3aXRoDQo+PiAjaWZkZWYg
Q09ORklHX0dJQ1YzX0VTUEksIHdoaWNoLCBwcm9iYWJseSwgbm90IGEgZ29vZCB0aGluZy4NCj4g
DQo+IFRoZSBzb2x1dGlvbiBpcyB0byBwcm92aWRlIHdyYXBwZXJzIHRvIHJlZHVjZSB0aGUgbnVt
YmVyIG9mICNpZmRlZi4gSSANCj4gaGF2ZW4ndCBjaGVja2VkIGFsbCB0aGUgcGxhY2VzLg0KDQpJ
IGFncmVlIHdpdGggeW91LCBpdCdzIGEgZ29vZCBwb2ludCB0byB1c2Ugd3JhcHBlcnMgd2hlcmUg
cG9zc2libGUuIEkgDQp3aWxsIHJldmlzZSBhbGwgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGFuZCB0
cnkgdG8gdXNlIHdyYXBwZXJzIHdoZXJlIA0KcG9zc2libGUgdG8gcmVkdWNlICNpZmRlZnMuDQoN
Cj4+DQo+Pj4NCj4+PiBbLi4uXQ0KPj4+DQo+Pj4+PiDCoMKgIHN0cnVjdCBpcnFfZGVzYzsNCj4+
Pj4+IMKgwqAgc3RydWN0IGlycWFjdGlvbjsNCj4+Pj4+IEBAIC01NSw2ICs3MSwxNSBAQCBzdGF0
aWMgaW5saW5lIGJvb2wgaXNfbHBpKHVuc2lnbmVkIGludCBpcnEpDQo+Pj4+PiDCoMKgwqDCoMKg
wqAgcmV0dXJuIGlycSA+PSBMUElfT0ZGU0VUOw0KPj4+Pj4gwqDCoCB9DQo+Pj4+PiDCoMKgICtz
dGF0aWMgaW5saW5lIGJvb2wgaXNfZXNwaSh1bnNpZ25lZCBpbnQgaXJxKQ0KPj4+Pj4gK3sNCj4+
Pj4+ICsjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+Pj4+ICvCoMKgwqAgcmV0dXJuIChpcnEg
Pj0gRVNQSV9CQVNFX0lOVElEICYmIGlycSA8PSBFU1BJX01BWF9JTlRJRCk7DQo+Pj4+PiArI2Vs
c2UNCj4+Pj4+ICvCoMKgwqAgcmV0dXJuIGZhbHNlOw0KPj4+Pj4gKyNlbmRpZg0KPj4+Pj4gK30N
Cj4+Pj4+ICsNCj4+Pj4+IMKgwqAgI2RlZmluZSBkb21haW5fcGlycV90b19pcnEoZCwgcGlycSkg
KHBpcnEpDQo+Pj4+PiDCoMKgwqDCoCBib29sIGlzX2Fzc2lnbmFibGVfaXJxKHVuc2lnbmVkIGlu
dCBpcnEpOw0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hlbi9hcmNo
L2FybS9pcnEuYw0KPj4+Pj4gaW5kZXggNTBlNTdhYWVhNy4uOWJjNzJmYmJjOSAxMDA2NDQNCj4+
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2ly
cS5jDQo+Pj4+PiBAQCAtMTksNyArMTksMTEgQEANCj4+Pj4+IMKgwqAgI2luY2x1ZGUgPGFzbS9n
aWMuaD4NCj4+Pj4+IMKgwqAgI2luY2x1ZGUgPGFzbS92Z2ljLmg+DQo+Pj4+PiDCoMKgICsjaWZk
ZWYgQ09ORklHX0dJQ1YzX0VTUEkNCj4+Pj4+ICtjb25zdCB1bnNpZ25lZCBpbnQgbnJfaXJxcyA9
IEVTUElfTUFYX0lOVElEICsgMTsNCj4+Pj4+ICsjZWxzZQ0KPj4+Pj4gwqDCoCBjb25zdCB1bnNp
Z25lZCBpbnQgbnJfaXJxcyA9IE5SX0lSUVM7DQo+Pj4+PiArI2VuZGlmDQo+Pj4+PiDCoMKgwqDC
oCBzdGF0aWMgdW5zaWduZWQgaW50IGxvY2FsX2lycXNfdHlwZVtOUl9MT0NBTF9JUlFTXTsNCj4+
Pj4+IMKgwqAgc3RhdGljIERFRklORV9TUElOTE9DSyhsb2NhbF9pcnFzX3R5cGVfbG9jayk7DQo+
Pj4+PiBAQCAtNDYsNiArNTAsOSBAQCB2b2lkIGlycV9lbmRfbm9uZShzdHJ1Y3QgaXJxX2Rlc2Mg
KmlycSkNCj4+Pj4+IMKgwqAgfQ0KPj4+Pj4gwqDCoMKgwqAgc3RhdGljIGlycV9kZXNjX3QgaXJx
X2Rlc2NbTlJfSVJRUyAtIE5SX0xPQ0FMX0lSUVNdOw0KPj4+Pj4gKyNpZmRlZiBDT05GSUdfR0lD
VjNfRVNQSQ0KPj4+Pj4gK3N0YXRpYyBpcnFfZGVzY190IGVzcGlfZGVzY1tOUl9JUlFTXTsNCj4+
Pg0KPj4+IEJ5IGhvdyBtdWNoIHdpbGwgdGhpcyBpbmNyZWFzZSB0aGUgWGVuIGJpbmFyeT8NCj4+
DQo+PiBJIGFtIHdvbmRlcmluZyB0aGlzIGFsc28uIFRoZSBzdHJ1Y3QgaXMgY2FjaGUgYWxpZ25l
ZCwgc28gaXQgd2lsbCB0YWtlDQo+PiBhdCBsZWFzdCAxMjggYnl0ZXMuIFRoZSB3aG9sZSBhcnJh
eSB3aWxsIHRha2UgYXQgbGVhc3QgMTI4a2IuIE5vdA0KPj4gZ3JlYXQsIG5vdCB0ZXJyaWJsZS4g
QXMgdGhpcyBzaG91bGQgZ28gdG8gLmJzcywgaXQgc2hvdWxkIG5vdCBpbmNyZWFzZQ0KPj4gdGhl
IGJpbmFyeSBpdHNlbGYuDQo+IA0KPiBJIGd1ZXNzICJiaW5hcnkiIHdhcyB0aGUgd3Jvbmcgd29y
ZC4gSSB3YXMgcmVmZXJyaW5nIHRvIHRoZSBzaXplIG9mIHRoZSANCj4gWGVuIGluIG1lbW9yeS4g
T24gbXkgc2V0dXAgWGVuIGlzIDE0NDhrYi4gSGVyZSB5b3Ugd291bGQgaW5jcmVhc2UgfjklIG9m
IA0KPiByZXNpZGVudCBzaXplLiBUaGlzIHNlZW1zIHF1aXRlIHN0ZWVwIGZvciBhIGZlYXR1cmUg
dGhhdCBpcyBub3Qgb2Z0ZW4gdXNlZC4NCj4gDQo+Pg0KPj4gTWF5YmUgaXQgaXMgYmV0dGVyIHRv
IGFsbG9jYXRlIHRoaXMgZHluYW1pY2FsbHk/IEkgZG8gdW5kZXJzdGFuZCB0aGF0IHdlDQo+PiB3
YW50IHRvIGdldCByaWQgb2YgYXMgbWFueSBkeW5hbWljIGFsbG9jcyBhcyBwb3NzaWJsZSwgYnV0
IG1heWJlIGluIHRoaXMNCj4+IGNhc2UgaXQgd2lsbCBiZSBva2F5Lg0KPiANCj4gVGhpcyBpcyB1
cCB0byBMZW9uaWQuIEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBzdHJpY3RseSBuZWNlc3NhcnkgaW4g
b3JkZXIgDQo+IHRvIGdldCB0aGUgZVNQSSBzdXBwb3J0LiBIb3dldmVyLCB1bnRpbCB0aGlzIGlz
IHNvbHZlZCBDT05GSUdfR0lDVjNfRVBTSSANCj4gKm11c3Qgbm90KiBiZSBvbiBieSBkZWZhdWx0
IGFzIHRoaXMgaXMgZG9uZSBpbiB0aGlzIHBhdGNoLg0KPiANCg0KSSB3aWxsIGNoZWNrIGhvdyBt
dWNoIHRpbWUgYW5kIGVmZm9ydCBhcmUgcmVxdWlyZWQgdG8gc3dpdGNoIHRvIGR5bmFtaWMgDQph
bGxvY2F0aW9uLiBJZiBpdCBkb2VzIG5vdCB0YWtlIG11Y2ggdGltZSBhbmQgZG9lcyBub3QgcmVx
dWlyZSBtYW55IA0KY2hhbmdlcywgSSB3aWxsIHByZXBhcmUgYW4gYWRkaXRpb25hbCBwcmVwYXJh
dGlvbiBwYXRjaCBpbiBWMy4gDQpPdGhlcndpc2UsIEkgd2lsbCBkaXNhYmxlIHRoZSBjb25maWcg
YnkgZGVmYXVsdCBpbiBWMy4NCg0KPj4gQXMgYSBib251cyBwb2ludCwgd2UgY2FuJ3QgbGVhdmUg
dGhpcyBwb2ludGVyDQo+PiBwcmVzZW50IGV2ZW4gaWYgQ09ORklHX0dJQ1YzX0VTUEk9biwgd2hp
Y2ggd2lsbCBzaW1wbGlmeSBzb21lIGNvZGUgaW4NCj4+IGxhdHRlciBwYXRjaGVzLg0KPiANCj4g
RGlkIHlvdSBpbnRlbmQgdG8gc2F5ICJXZSBjYW4gbGVhdmUiIHJhdGhlciB0aGFuICJ3ZSBjYW4n
dCBsZWF2ZSI/DQo+IA0KPiBDaGVlcnMsDQo+IA0KDQpCZXN0IHJlZ2FyZHMsDQpMZW9uaWQNCg==

