Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8146AB31897
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 14:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090111.1447498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRMI-0000In-6Q; Fri, 22 Aug 2025 12:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090111.1447498; Fri, 22 Aug 2025 12:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upRMI-0000Fl-3N; Fri, 22 Aug 2025 12:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1090111;
 Fri, 22 Aug 2025 12:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jNg=3C=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1upRMG-0000Ff-PL
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 12:59:04 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78e22d5-7f57-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 14:59:03 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DB9PR03MB7568.eurprd03.prod.outlook.com (2603:10a6:10:2c5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Fri, 22 Aug
 2025 12:59:01 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 12:59:00 +0000
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
X-Inumbo-ID: c78e22d5-7f57-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/JQUN0w0OXe8zaN/GrZ48gHLFq4M4D708tL7L+shMavLbM8yylN0BdVL+EdyCIaPv8qcbrRFDYju2dSbBm0Tkf6umL2vYUIsYGRmGYMJm27x/bYqSSL03NNWDvGp9q/UwgiqnBO646ecOlYa4raL3h9QE8N3FftC46tY8hSiQxml5uvFekZxkIxjcedqT1sE5fI7spYAtpeDCmoMSsnVxyDon7LczNspqfWJduq35CvDXIvwW3N8enQpJBqoOCOQGzEACmLsD4my5/5VBrYaCsKPHR14EJsh5+8Bu9zrZg++r9g50b09U5xeRSaSfdeymh0opHk7vesyoV14pbLCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHedGuKS2bhUMtFBahuGk9BLOG5XpLi9acD4fL166p8=;
 b=oeSSVW1F7lEfRuNZr3VZwheViQ3hyYPN1SA8WkZQngq8XbjBPaQQyxohQykD3fYbRdb48dAyoulbpNSxMozbfacafU0q/GwG3ksqOahoZC1zTQjP2QckKbS9wle3cfjqLuCxYSy3+F93rQNEj5AeSoranGvS/1p5qKdht1Oh7LEYQxFb9/IRH+2h/J+Lt/ZyfOGXitoFjADJjaG5z4+SPkVY9X/Yi0ZECz0TuiAA6/IUdtWJt4L3EZiB0yKrStFh/avp3kmxBDS0aq/qkdz8F3lp0PVYMdZULB5ojq/CGLGwcX+25Hk2L3j6vJp6U5pinsQ6M+nmxQwHnAfr9p80Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cHedGuKS2bhUMtFBahuGk9BLOG5XpLi9acD4fL166p8=;
 b=EwhTTWWv9qwrYo09nVjr5PwPrTzFKxWIGjcw66QaL/r0Gd7jsg5EZNpHES2yBVADWsfUFeLscQM+pzbEc3bm8iACHuu/5LqFeFZRe4Rn03lzaMBEqAojmnyFyiKyF72x6Csk0YON9F0/svPTveUACJzNENKoS7fVsBHtHFhgUVdMXUk+s1ssGp7PYNM0maQ2ICFdum9hmwroCLEwMRiuHNYmGGG+56vKpnaoCX0EKAmnuCSa3P+fx5Gh9wUpOE9LjOFRqmSgFc9Hzf/PXWH6BACxEsusstq1GaAO4elAKdU7JZezuhS5lpudIECcdOjNgZrdX2/PALWFVMbDH/vojQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Topic: [PATCH v2 04/10] xen/arm/irq: add handling for IRQs in the eSPI
 range
Thread-Index: AQHcB5d7kgaRrTB4eUK2JDUmO9y7H7Ruud8A
Date: Fri, 22 Aug 2025 12:59:00 +0000
Message-ID: <839b9c79-1a5d-4e08-ab09-3be95f2f943e@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <418e7e8082fa8f7b6659ff8cae3beb773803ca47.1754568795.git.leonid_komarianskyi@epam.com>
 <87ms7sekdx.fsf@epam.com>
In-Reply-To: <87ms7sekdx.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DB9PR03MB7568:EE_
x-ms-office365-filtering-correlation-id: 0f146568-7eca-4528-9a37-08dde17baa32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TjArTzRwL1JoaVp5bUYzYVRUSkdNa0ZVMm9wTHlYanBBMXZGR3pNWCt5U1dv?=
 =?utf-8?B?Tm91T1ovNWp5VlBOQUw2QXU5eFpZcTU3RG1xc2o1dHhYaE9JQTZXUEpOcndB?=
 =?utf-8?B?a281Q2dIVWtXTEJoaDNTUFJ0S3J1V29NNUZqQlVuQi93ODQyRnZ3ckdDSmVD?=
 =?utf-8?B?d0VSWnVNclBCaGhjYTdBY0ovdXpWSGswcEFtU1p4YWI0L2hZUGpHYjBNUEpD?=
 =?utf-8?B?UHByZE1nT3RRVTNURDZkM0VsWDlCcjZvaDFZYkhXQ2pKU3dvRHViL3hDcXYx?=
 =?utf-8?B?cUhFQnU1WlZLSEFJL0Fvd3lWZGVydXQrWHY3SFVYZTVtSUNkbkg4SEM0Ukcw?=
 =?utf-8?B?WWliUWtid2hHb2FWS1hkWlU1b2kra2xKZDhlZk5LMFdwWGM5V2VKOCtFSEZI?=
 =?utf-8?B?d0tzTWZ3OUlBR05vNnlkRmR6NDU5dmFPeU9NZHVkVmdWZ0dkWmw1OHp0NWhx?=
 =?utf-8?B?SFQvcUthd1R4RS9SMUs2R1FncHorTmJBV2oyaVNheXpXY0VPam95eXFSSXly?=
 =?utf-8?B?a1ZTVm9vL0JsUk0yOWpVTStPRklDQVIzOGRTQ2NZUk5LeWFXQ3lOQzdZTUcy?=
 =?utf-8?B?Ti85bzFFYk14RVZCbkgzZmxkTExWaFFQS1pyeThXRERIbEREWnN1NE0xOUdG?=
 =?utf-8?B?ek01UnppQXZvcUF0UStjNVhxZXRjMStQUFFpc2l6clU3NGNFbTR5NWpZMXdT?=
 =?utf-8?B?WDFCRnFueENDTE1HWVF6YUYxZWNVcVdOaWNrVFlpeGZ0SEZya29ZNnNlbkpP?=
 =?utf-8?B?NW9IOC82Nks4a3I2SmduaXR1UGpIWjBoelRVcEZiaGxDOXpnUFdBRm85ampq?=
 =?utf-8?B?NWM3dEU0VmN1Z0RUSDZEdmhwUVd2RXU0bHRDc0huNDFaenBaWnZCRzFlU3lK?=
 =?utf-8?B?V3VBMGpYR1Q3ZVFVMkY1QVc3MnNYMmpXK0x1M0JycmF0dHBjdU9VWUJUK0Fk?=
 =?utf-8?B?NExvaUNvWDR5SXd4L2l1VmMzVEUrczBsc0RJMGk4Uk5XQnAvMzlOVUtDV0ht?=
 =?utf-8?B?OU9Ia2hLRlVzb2pXU1VzNjFIOEU3TTVWQXkyY3k4UXhQVExnN1J2YjFvTTJR?=
 =?utf-8?B?dWVwblQxQU83dkVjYmtSaEpDaVh4VXM0R1RXV2dwa0ZBTnBGR0IxUGM0d2pH?=
 =?utf-8?B?dkR2aERaUEc2NTlJOG1vN1RvU0pJaTU1bEUxNUdQRDZ0aGYwT1NZQXBiK3Fq?=
 =?utf-8?B?bjAvZE5zVC9sWGhLWmEyRVlCSVpwTFlLNzQ1NGRLRXRZTzFvSVM2NnY4Z2pn?=
 =?utf-8?B?Q252bEdZTUsrUWNTNDFDOVYyQm9QaW1lc2YwWFVNOEZkR1VuZzhLMTBtNzAy?=
 =?utf-8?B?aSs1KzE4akVxTjFVcDhvSHl0bWtuVmQyOWZQNHJzZ0N4NWlSYVpEWExCV2s2?=
 =?utf-8?B?TUo0bU5kNXh0MkdBUnJ2THVCSXRTcFFGdjM4OFhpS0RTdHpJUGV0dnA2Yko2?=
 =?utf-8?B?Z1kvTGtYVk1sL3dxZEkvb2NTRHJ0TmFvUklZaXBUVnBWOHdmU0NwOCt3N3F0?=
 =?utf-8?B?Zlp0WnF3VXVNQVplSXVldzdDb0h1a1VrUjl1WVJVVmczTUJBMWI4cUlwSGRn?=
 =?utf-8?B?bVB6bzU1SnVzZWRPYmZFYnpEZUh6L25YV1oyejVPNGlYWWMwZFZMakNtdkYr?=
 =?utf-8?B?N1g5RW1nOXgxb29aenh6SSt3b2JxTFBIa25WVi9SSVFSeFVSRzNRNEVmdjlw?=
 =?utf-8?B?ODRQNDFSeFJ3TGV4czBDaWpCWkRESjZPT0tXSDF6cTJiWFFkdXdlOWRxYldU?=
 =?utf-8?B?UXhGYllQS1hNSERNWDc3aUJDRC9DaGNtMjQwU3FHTzZjODBnTU9PS0R1OXdi?=
 =?utf-8?B?OG9pVkRvc0JZRzFPSWJqVVI5ekVqcDd5QUlySTZaRUhPS0poSnhHR0ZVQUp4?=
 =?utf-8?B?ZGI2T0MrSkVickpYKzVVZVNJejNZVzdzajhRTU44THp6R1U1bDdtSno3VmpZ?=
 =?utf-8?B?a1hFdis0Qm1nMzU3enJtdU1nR1JIbHZpZG9uWm9XcW0vaDZ5ZjZxeDlpc1F1?=
 =?utf-8?B?WXA2TkRNNTVBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzUreFl5YTBYMG5RUFRmYk8wQ0JqSGVyb0JvOHRjTVBMR3lUL0NJTkhYcEdC?=
 =?utf-8?B?bGFVMFE4anpuWWVJcHZGMFNBOHlHNi9Ta1pNZFZ3K1lwMDRyYXNpNHB6eTR3?=
 =?utf-8?B?TytWZmF6VEZzN3J0R2dHL1ZEcFA1UGM5WDVFcnptQnBmZjhUQjlyU294ZjN2?=
 =?utf-8?B?K0QwazFQNEFjcGlCMTdPTG1sNWNhNENFeUpGMFFEamJjcVNrTy96Y2NvMkQv?=
 =?utf-8?B?SFZNMDBjeHIrdWdReUZ1SGpMR1NsUDVrcm5sYVk5OTRWZWZ2Y0MrU2kwWUxC?=
 =?utf-8?B?VGVqc1FNcS9GOHJ3ZFduc2NudGQyME11R0M4bWYxUnkzbXdqZmlaSWcrRTBJ?=
 =?utf-8?B?U0xlYkdNRTRZOHpqdnM0akpMMVFDNyswVzJYUjl3QnRTQTZyWFY5aTJJbnB0?=
 =?utf-8?B?aVRsb3NCdkN6eWtvNFZrdFNyd2VFVUhPODEwQzBpei9BRVc1cHYrMlkzVzlJ?=
 =?utf-8?B?RHFzNkN6WTVLaG9JSHFMQjBoKytsWkRLQ1lmYmFxYXNiR2R0RjZCbDB6S2p3?=
 =?utf-8?B?NTQ1MGk3eWQ4YmVtK0xxb2Nkd016L3pmdFJBZks0eTFaVXQzeHY3cDZMa0xj?=
 =?utf-8?B?VUEwTnhEMzk1NEtwdFBuNzBsVUpSZ1B4bDJaVkxwTzh1WVRIK0V5eUtZa09t?=
 =?utf-8?B?Q3FTejVYUVNENDVOSHlhSEJmaDlhaENEa09jbTNMQWtyRFZKbzRyZVFqZDV0?=
 =?utf-8?B?ek9hUTNHM0NLZDd5ZHdIcSs4bC84VjVDbHNFSjVNMWozVzIxVmRlMUZoSDNh?=
 =?utf-8?B?WnJsMXNGK1MyNDNMRC95K2NYSnA4TFgvN0N3emNNVmRYUy8zeTdYc29VSjg5?=
 =?utf-8?B?MDRvN05hOWEybzJaZ0ZqS0lsNnVqd2M1WnpRQmhNNlBOSS90dFBXRHlqbmZN?=
 =?utf-8?B?MWwzSzdYSDNDSU4zbkRNWUdxdVNuZTdEai9CbDE0TCtrLzNpUThiMmxhQU9X?=
 =?utf-8?B?a1pTbS9IS0lsME5oWjZyb0hENDJvcjNiQW8xNGxXYmJ5NHU5akwrUzNuVDkr?=
 =?utf-8?B?NFNiN3EyQXRXQ2g2UmpHbnBHbS9jN0o4Z0MxckZwY0VXNGxrSHAwSHFjK3pE?=
 =?utf-8?B?WGg3Y2ZKclU3WXZYWVNqU1VDeWtFc3NyOWh0RU1TODhyc1JENVhML1R2aElu?=
 =?utf-8?B?OTEzWVgyWG5vaDlGcnZNTlpXTTVnbi9YWCtTN25KY25VaFBNRUZaeG5sWERH?=
 =?utf-8?B?WE9CZTh1RGdINkhBRGU0REJ0T21LMS9xWHhDZDNxSFBQR1pBaXE5ZWhPVlc2?=
 =?utf-8?B?Z0hNcjRxMWhScDF0WEZxSkpXTlZ3YlMyc09zUUlSME9TM1l5em1PQStWOUlV?=
 =?utf-8?B?TXc2NmdrYXlHNmtLOUlxWmV1L0MxZFBLSDIxczkxZmlNM3R5WFowY0N4dnF2?=
 =?utf-8?B?dTNrMDRZOGtEcVQ1d2pNcnovOUgyajZKWEJWVW1WUlhiTzU3MG5TUDFnQVZG?=
 =?utf-8?B?K3piQTRjOGpXdDF3YjN3cWxxYk8vc1hISTNXSzNpVnFzeFJHWHprQ3pwdnFR?=
 =?utf-8?B?eXJ6RXZUUExHQkhwL1pFcTZyZGJwaFV0VE9BdmVMSXdDRktlS0ViNjhJcjdm?=
 =?utf-8?B?b0dVQ2ZwdkVBcGZIdUhqbkdObjlWOHJ0N2ZYNVVPSlVtMW5RRGxBMGRmZ09V?=
 =?utf-8?B?S3FKeU9ubWtidTJBY0VNRXJ4MUlFS2Z4QnlkKzZpQm1Kb05mditiczFISHRu?=
 =?utf-8?B?cW5DNGdJZEVHSmRPRkc2cFE5ZXJOWkxUNUZEK2J3Vno4RkVWTlhrbjNOcGNt?=
 =?utf-8?B?dHFTY2VHMHIwczBVdkxSVVc1ZWNSYXdCSjE1Z3RUK014QlVkK0xXeVJIczBi?=
 =?utf-8?B?bFV3RHU0Qm12Qnl1WE1RVkJ1M24xRTBKbHdpNmhmQ0RwRFRIbFVFaWZ5RGh5?=
 =?utf-8?B?YjQrZlZmT1VjUWZLOHlZRytnYTVCQnhiK3FNbklOUi9WUFowTFNvTTJJSDgr?=
 =?utf-8?B?eXZJYVpSTDV6K0hpZmd3ZlhTRXFmVHg0RFgzcTFlS21KTDZlamw4eTZIMmNj?=
 =?utf-8?B?aUk4YUgvZVd0NE0rYjVYeEFDMWNwT3J1SDZHZ1FaSUlSM01VYVFudkdpRmxM?=
 =?utf-8?B?S2lwb081VWc4Zmd5UUx1RnhSNHg1dTlHWUFXMUdrWWRNZzk3aVRyTU83eGRu?=
 =?utf-8?B?SWpNZ0p5VEdSSWtsZzIrakluWnpOV2pndmZQaXFBRUJzMFNOTTQ3VndZek1y?=
 =?utf-8?Q?g+eS9BjK0xtz89wyuZh/KME=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D218479FAF5D749A292875E18CBAFE0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f146568-7eca-4528-9a37-08dde17baa32
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2025 12:59:00.8768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQe7iCyPkjjQuy3gpP1tI184nZ0HnoSfwCbQuJHfAVbJoFJfhKcRKSFojdxpGaEkNDntFFPzKmX0P/fut5h5a/3gW9cXVIcA7I3Yk6X1qm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7568

SGkgVm9sb2R5bXlyLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiAyMS4wOC4y
NSAxODo1OSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+IExlb25pZCBLb21hcmlhbnNreWkg
PExlb25pZF9Lb21hcmlhbnNreWlAZXBhbS5jb20+IHdyaXRlczoNCj4gDQo+PiBDdXJyZW50bHks
IFhlbiBkb2VzIG5vdCBzdXBwb3J0IGVTUEkgaW50ZXJydXB0cywgbGVhZGluZw0KPj4gdG8gYSBk
YXRhIGFib3J0IHdoZW4gc3VjaCBpbnRlcnJ1cHRzIGFyZSBkZWZpbmVkIGluIHRoZSBEVFMuDQo+
Pg0KPj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgc2VwYXJhdGUgYXJyYXkgdG8gaW5pdGlhbGl6
ZSB1cCB0bw0KPj4gMTAyNCBpbnRlcnJ1cHQgZGVzY3JpcHRvcnMgaW4gdGhlIGVTUEkgcmFuZ2Ug
YW5kIGFkZHMgdGhlDQo+PiBuZWNlc3NhcnkgZGVmaW5lcyBhbmQgaGVscGVyIGZ1bmN0aW9uLiBU
aGVzZSBjaGFuZ2VzIGxheSB0aGUNCj4+IGdyb3VuZHdvcmsgZm9yIGZ1dHVyZSBpbXBsZW1lbnRh
dGlvbiBvZiBmdWxsIGVTUEkgaW50ZXJydXB0DQo+PiBzdXBwb3J0LiBBcyB0aGlzIEdJQ3YzLjEg
ZmVhdHVyZSBpcyBub3QgcmVxdWlyZWQgYnkgYWxsIHZlbmRvcnMsDQo+PiBhbGwgY2hhbmdlcyBh
cmUgZ3VhcmRlZCBieSBpZmRlZnMsIGRlcGVuZGluZyBvbiB0aGUgY29ycmVzcG9uZGluZw0KPj4g
S2NvbmZpZyBvcHRpb24uDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgaXQgaXMgYSBnb29kIGlk
ZWEgdG8gaGlkZSB0aGlzIGZlYXR1cmUgdW5kZXIgS2NvbmZpZw0KPiBvcHRpb24sIGFzIHRoaXMg
d2lsbCBpbmNyZWFzZSBudW1iZXIgb2YgZGlmZmVyZW50IGJ1aWxkIHZhcmlhbnRzLg0KPiBJIGJl
bGlldmUgdGhhdCBydW50aW1lIGNoZWNrIGZvciBHSUNEX1RZUEVSLkVTUEkgc2hvdWxkIGJlIHN1
ZmZpY2llbnQsDQo+IGJ1dCBtYWludGFpbmVycyBjYW4gY29ycmVjdCBtZSB0aGVyZS4NCj4gDQo+
Pg0KPj4gU2lnbmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFu
c2t5aUBlcGFtLmNvbT4NCj4+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4gVjI6DQo+PiAtIHVzZSAo
RVNQSV9NQVhfSU5USUQgKyAxKSBpbnN0ZWFkIG9mIChFU1BJX0JBU0VfSU5USUQgKyBOUl9JUlFT
KQ0KPj4gLSByZW1vdmUgdW5uZWNlc3NhcnkgY29tbWVudCBmb3IgbnJfaXJxcyBpbml0aWFsaXph
dGlvbg0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL2FybS9LY29uZmlnICAgICAgICAgICB8ICA5ICsr
KysrKysrKw0KPj4gICB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vaXJxLmggfCAyNSArKysrKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgIHhlbi9hcmNoL2FybS9pcnEuYyAgICAgICAgICAgICB8
IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNjAg
aW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vS2NvbmZpZyBi
L3hlbi9hcmNoL2FybS9LY29uZmlnDQo+PiBpbmRleCAxN2RmMTQ3YjI1Li4wODA3M2VjZTFmIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL0tjb25maWcNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9LY29uZmlnDQo+PiBAQCAtMTM1LDYgKzEzNSwxNSBAQCBjb25maWcgR0lDVjMNCj4+ICAgCSAg
RHJpdmVyIGZvciB0aGUgQVJNIEdlbmVyaWMgSW50ZXJydXB0IENvbnRyb2xsZXIgdjMuDQo+PiAg
IAkgIElmIHVuc3VyZSwgdXNlIHRoZSBkZWZhdWx0IHNldHRpbmcuDQo+PiAgIA0KPj4gK2NvbmZp
ZyBHSUNWM19FU1BJDQo+PiArCWJvb2wgIkV4dGVuZGVkIFNQSSByYW5nZSBzdXBwb3J0Ig0KPj4g
KwlkZXBlbmRzIG9uIEdJQ1YzICYmICFORVdfVkdJQw0KPj4gKwlkZWZhdWx0IHkNCj4+ICsJaGVs
cA0KPj4gKwkgIEFsbG93IFhlbiBhbmQgZG9tYWlucyB0byB1c2UgaW50ZXJydXB0IG51bWJlcnMg
ZnJvbSB0aGUgZXh0ZW5kZWQgU1BJDQo+PiArCSAgcmFuZ2UsIGZyb20gNDA5NiB0byA1MTE5LiBU
aGlzIGZlYXR1cmUgaXMgaW50cm9kdWNlZCBpbiBHSUN2My4xDQo+PiArCSAgYXJjaGl0ZWN0dXJl
Lg0KPj4gKw0KPj4gICBjb25maWcgSEFTX0lUUw0KPj4gICAgICAgICAgIGJvb2wgIkdJQ3YzIElU
UyBNU0kgY29udHJvbGxlciBzdXBwb3J0IChVTlNVUFBPUlRFRCkiIGlmIFVOU1VQUE9SVEVEDQo+
PiAgICAgICAgICAgZGVwZW5kcyBvbiBHSUNWMyAmJiAhTkVXX1ZHSUMgJiYgIUFSTV8zMg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaCBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9pcnEuaA0KPj4gaW5kZXggNWJjNjQ3NWViNC4uYWNlYmMzZDQyZiAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9pcnEuaA0KPj4gKysrIGIveGVu
L2FyY2gvYXJtL2luY2x1ZGUvYXNtL2lycS5oDQo+PiBAQCAtMzIsNiArMzIsMTQgQEAgc3RydWN0
IGFyY2hfaXJxX2Rlc2Mgew0KPj4gICAjZGVmaW5lIFNQSV9NQVhfSU5USUQgICAxMDE5DQo+PiAg
ICNkZWZpbmUgTFBJX09GRlNFVCAgICAgIDgxOTINCj4+ICAgDQo+PiArI2lmZGVmIENPTkZJR19H
SUNWM19FU1BJDQo+PiArI2RlZmluZSBFU1BJX0JBU0VfSU5USUQgNDA5Ng0KPj4gKyNkZWZpbmUg
RVNQSV9NQVhfSU5USUQgIDUxMTkNCj4+ICsNCj4+ICsjZGVmaW5lIEVTUElfSU5USUQySURYKGlu
dGlkKSAoKGludGlkKSAtIEVTUElfQkFTRV9JTlRJRCkNCj4+ICsjZGVmaW5lIEVTUElfSURYMklO
VElEKGlkeCkgICAoKGlkeCkgKyBFU1BJX0JBU0VfSU5USUQpDQo+PiArI2VuZGlmDQo+PiArDQo+
PiAgIC8qIExQSXMgYXJlIGFsd2F5cyBudW1iZXJlZCBzdGFydGluZyBhdCA4MTkyLCBzbyAwIGlz
IGEgZ29vZCBpbnZhbGlkIGNhc2UuICovDQo+PiAgICNkZWZpbmUgSU5WQUxJRF9MUEkgICAgIDAN
Cj4+ICAgDQo+PiBAQCAtMzksNyArNDcsMTUgQEAgc3RydWN0IGFyY2hfaXJxX2Rlc2Mgew0KPj4g
ICAjZGVmaW5lIElOVkFMSURfSVJRICAgICAxMDIzDQo+PiAgIA0KPj4gICBleHRlcm4gY29uc3Qg
dW5zaWduZWQgaW50IG5yX2lycXM7DQo+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+PiAr
LyoNCj4+ICsgKiBUaGlzIHdpbGwgYWxzbyBjb3ZlciB0aGUgZVNQSSByYW5nZSwgYXMgc29tZSBj
cml0aWNhbCBkZXZpY2VzDQo+PiArICogZm9yIGJvb3RpbmcgWGVuIChlLmcuLCBzZXJpYWwpIG1h
eSB1c2UgdGhpcyB0eXBlIG9mIGludGVycnVwdHMuDQo+PiArICovDQo+PiArI2RlZmluZSBucl9z
dGF0aWNfaXJxcyAoRVNQSV9NQVhfSU5USUQgKyAxKQ0KPj4gKyNlbHNlDQo+PiAgICNkZWZpbmUg
bnJfc3RhdGljX2lycXMgTlJfSVJRUw0KPj4gKyNlbmRpZg0KPiANCj4gRG9uJ3QgaW50cm9kdWNl
IGRlZmluZXMgdGhhdCBsb29rIGxpa2UgdmFyaWFibGVzLiBJIGFtIHN1cmUgdGhhdCBNSVNSQQ0K
PiB0ZWFtIHdpbGwgYmUgdW5oYXBweSBhYm91dCB0aGF0LiBCdXQgd2hhdCB5b3UgY2FuIHJlYWxs
eSBkbyBpcyB0bw0KPiBpbnRyb2R1Y2UgdmFyaWFibGUgbnJfc3RhdGljX2lycXMsIHdoaWNoIHZh
bHVlIHdpbGwgZGVwZW5kIG9uDQo+IEdJQ0RfVFlQRVIuRVNQSSBhbmQgR0lDRF9UWVBFUi5FU1BJ
X3JhbmdlDQo+IA0KDQpUaGlzIGlzIGEgZ2VuZXJpYyBkZWZpbmUsIHdoaWNoIGlzIHByZXNlbnQg
aW4gYWxsIGFyY2gtc3BlY2lmaWMgaXJxIA0KaGVhZGVycyAoeDg2LCBQUEMsIFJJU0MtViwgQVJN
KS4gSSB0aGluayBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gbWFrZSANCnRoaXMgYSBjb25zdCB2
YXJpYWJsZSBvbmx5IHdoZW4gQ09ORklHX0dJQ1YzX0VTUEkgaXMgZW5hYmxlZCwgd2hpbGUgaW4g
DQpvdGhlciBwbGFjZXMgaXQgaXMgYSBkZWZpbmUuIE1vcmVvdmVyLCBJIGNsYXJpZmllZCB3aXRo
IG9uZSBvZiBvdXIgDQp0ZWFtbWF0ZXMsIHdobyBpcyBlbmdhZ2VkIGluIE1JU1JBIGZpeGVzIGZv
ciBYZW4sIGFuZCBoZSBjb25maXJtZWQgdGhhdCANCnRoZXJlIGlzIG5vIHZpb2xhdGlvbiBvZiB0
aGUgTUlTUkEgcnVsZSBoZXJlLiBUbyBzdW1tYXJpemUgYWxsIG9mIHRoYXQsIA0Kd291bGQgaXQg
YmUgb2theSB0byBsZWF2ZSB0aGlzIHBsYWNlIHVuY2hhbmdlZD8NCg0KPj4gICANCj4+ICAgc3Ry
dWN0IGlycV9kZXNjOw0KPj4gICBzdHJ1Y3QgaXJxYWN0aW9uOw0KPj4gQEAgLTU1LDYgKzcxLDE1
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19scGkodW5zaWduZWQgaW50IGlycSkNCj4+ICAgICAg
IHJldHVybiBpcnEgPj0gTFBJX09GRlNFVDsNCj4+ICAgfQ0KPj4gICANCj4+ICtzdGF0aWMgaW5s
aW5lIGJvb2wgaXNfZXNwaSh1bnNpZ25lZCBpbnQgaXJxKQ0KPj4gK3sNCj4+ICsjaWZkZWYgQ09O
RklHX0dJQ1YzX0VTUEkNCj4+ICsgICAgcmV0dXJuIChpcnEgPj0gRVNQSV9CQVNFX0lOVElEICYm
IGlycSA8PSBFU1BJX01BWF9JTlRJRCk7DQo+PiArI2Vsc2UNCj4+ICsgICAgcmV0dXJuIGZhbHNl
Ow0KPj4gKyNlbmRpZg0KPj4gK30NCj4+ICsNCj4+ICAgI2RlZmluZSBkb21haW5fcGlycV90b19p
cnEoZCwgcGlycSkgKHBpcnEpDQo+PiAgIA0KPj4gICBib29sIGlzX2Fzc2lnbmFibGVfaXJxKHVu
c2lnbmVkIGludCBpcnEpOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hl
bi9hcmNoL2FybS9pcnEuYw0KPj4gaW5kZXggNTBlNTdhYWVhNy4uOWJjNzJmYmJjOSAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2lycS5j
DQo+PiBAQCAtMTksNyArMTksMTEgQEANCj4+ICAgI2luY2x1ZGUgPGFzbS9naWMuaD4NCj4+ICAg
I2luY2x1ZGUgPGFzbS92Z2ljLmg+DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfR0lDVjNfRVNQ
SQ0KPj4gK2NvbnN0IHVuc2lnbmVkIGludCBucl9pcnFzID0gRVNQSV9NQVhfSU5USUQgKyAxOw0K
Pj4gKyNlbHNlDQo+PiAgIGNvbnN0IHVuc2lnbmVkIGludCBucl9pcnFzID0gTlJfSVJRUzsNCj4+
ICsjZW5kaWYNCj4+ICAgDQo+PiAgIHN0YXRpYyB1bnNpZ25lZCBpbnQgbG9jYWxfaXJxc190eXBl
W05SX0xPQ0FMX0lSUVNdOw0KPj4gICBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKGxvY2FsX2lycXNf
dHlwZV9sb2NrKTsNCj4+IEBAIC00Niw2ICs1MCw5IEBAIHZvaWQgaXJxX2VuZF9ub25lKHN0cnVj
dCBpcnFfZGVzYyAqaXJxKQ0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgaXJxX2Rlc2NfdCBp
cnFfZGVzY1tOUl9JUlFTIC0gTlJfTE9DQUxfSVJRU107DQo+PiArI2lmZGVmIENPTkZJR19HSUNW
M19FU1BJDQo+PiArc3RhdGljIGlycV9kZXNjX3QgZXNwaV9kZXNjW05SX0lSUVNdOw0KPiANCj4g
VGhpcyBpcyByZWFsbHkgY29uZnVzaW5nLiBTaG91bGQgaXQgYmUgc29tZXRoaW5nIGxpa2UgZXNw
aV9kZXNjW05SX0VTUElfSVJRU10/DQo+IA0KDQpTdXJlLCB0aGF0IHdvdWxkIGJlIGJldHRlci4g
U28sIEkgd2lsbCBhZGQgdGhlIE5SX0VTUElfSVJRUyBkZWZpbmUgaW4gDQpWMy4gT2YgY291cnNl
LCBpZiBJIGFtIG5vdCBhYmxlIHRvIG1ha2UgYSBkeW5hbWljIGFsbG9jYXRpb24sIHdoaWNoIGlz
IA0KYmVpbmcgZGlzY3Vzc2VkIGluIHRoZSBzdWItdGhyZWFkIGZvciB0aGlzIHBhdGNoLiA6KQ0K
DQo+PiArI2VuZGlmDQo+IA0KPj4gICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoaXJxX2Rlc2NfdFtO
Ul9MT0NBTF9JUlFTXSwgbG9jYWxfaXJxX2Rlc2MpOw0KPj4gICANCj4+ICAgc3RydWN0IGlycV9k
ZXNjICpfX2lycV90b19kZXNjKHVuc2lnbmVkIGludCBpcnEpDQo+PiBAQCAtNTMsNiArNjAsMTEg
QEAgc3RydWN0IGlycV9kZXNjICpfX2lycV90b19kZXNjKHVuc2lnbmVkIGludCBpcnEpDQo+PiAg
ICAgICBpZiAoIGlycSA8IE5SX0xPQ0FMX0lSUVMgKQ0KPj4gICAgICAgICAgIHJldHVybiAmdGhp
c19jcHUobG9jYWxfaXJxX2Rlc2MpW2lycV07DQo+PiAgIA0KPj4gKyNpZmRlZiBDT05GSUdfR0lD
VjNfRVNQSQ0KPj4gKyAgICBpZiAoIGlzX2VzcGkoaXJxKSApDQo+PiArICAgICAgICByZXR1cm4g
JmVzcGlfZGVzY1tFU1BJX0lOVElEMklEWChpcnEpXTsNCj4+ICsjZW5kaWYNCj4+ICsNCj4+ICAg
ICAgIHJldHVybiAmaXJxX2Rlc2NbaXJxLU5SX0xPQ0FMX0lSUVNdOw0KPj4gICB9DQo+PiAgIA0K
Pj4gQEAgLTc5LDYgKzkxLDIwIEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRfaXJxX2RhdGEodm9p
ZCkNCj4+ICAgICAgICAgICBkZXNjLT5hY3Rpb24gID0gTlVMTDsNCj4+ICAgICAgIH0NCj4+ICAg
DQo+PiArI2lmZGVmIENPTkZJR19HSUNWM19FU1BJDQo+PiArICAgIGZvciAoIGlycSA9IEVTUElf
QkFTRV9JTlRJRDsgaXJxIDw9IEVTUElfTUFYX0lOVElEOyBpcnErKyApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHN0cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7DQo+PiAr
ICAgICAgICBpbnQgcmMgPSBpbml0X29uZV9pcnFfZGVzYyhkZXNjKTsNCj4+ICsNCj4+ICsgICAg
ICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsNCj4+ICsgICAg
ICAgIGRlc2MtPmlycSA9IGlycTsNCj4+ICsgICAgICAgIGRlc2MtPmFjdGlvbiAgPSBOVUxMOw0K
Pj4gKyAgICB9DQo+PiArI2VuZGlmDQo+PiArDQo+PiAgICAgICByZXR1cm4gMDsNCj4+ICAgfQ0K
PiANCg0KQmVzdCByZWdhcmRzLA0KTGVvbmlkDQo=

