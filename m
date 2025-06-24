Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E58EAE60F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023494.1399476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU05i-0004Vo-2V; Tue, 24 Jun 2025 09:37:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023494.1399476; Tue, 24 Jun 2025 09:37:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU05h-0004TN-W0; Tue, 24 Jun 2025 09:37:21 +0000
Received: by outflank-mailman (input) for mailman id 1023494;
 Tue, 24 Jun 2025 09:37:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uU05h-0004TH-BC
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:37:21 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2009::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a1d2a9-50de-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 11:37:17 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Tue, 24 Jun
 2025 09:37:13 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 09:37:13 +0000
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
X-Inumbo-ID: d0a1d2a9-50de-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcE9haBs2am8ni3f7+9r1kBICDBXsC0FiaurQduXbvxcQMH37Rc752oZGPxvU7kBcYKp6hjH3tBL43d75I7MY/ylhT5KWAXcxyOGcl3yp3hf/H29kvXRVHEAY82Qbm30LRLO+NiZ/zkPOy0OPqUtFpiyyuhanUha9SiK6vWmaRksSQI5eKZatfE16lA7m99pw2i1xMnGn+sqdqD1LrH982B2OwxjMiXgDNfGQb65qRvNRxNmM9W1v8vEl0Szi5N0GyZz3S+dx3fsKZXpugjgUker1/aRSO5sS5/zmBeF7kEqwfDQ4OkqsR2PDGEnFO4AtnzUx0QrHqMAD/8Nbr55wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fptTgdbhLrjlnkw5z6nGSycRPV02lARyQEKGVV1iGs8=;
 b=NpZZFk+Kmpwri3cjED5VAqTrWyHxwT0KuECUnCthSoaBCcOuqHZWR1CsN5pIwNYduD9Z6zTO0EqRY4yIbBJ5R9rl+7SrldaqVwMAlbAYyGQypiq3arwKBcmF1XxpioVf2aa2JItoQXCUBOKMZXeTyXtChm+Wpj2mcjdJrXLk5+OkQt2LvZoogzi+qR0B96JdkM7Pq9tLzjyiIF/+5Io0foh1SHxR8mLhbAE3E44F3jyaUhWQAN6s4OGavZ6PT3SeZECWfmOcSHkItfagfkpc6Zg3WHvyGXGNtDq/tWDCNPO9Onm/8QeRZyjp6eavSRTtAULyj+gbnrDvf5LDLT2Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fptTgdbhLrjlnkw5z6nGSycRPV02lARyQEKGVV1iGs8=;
 b=qZDyNlr0vwAis9Gt8AY73tsXkUC5kjK+hUOEh96yZxJGud0KjEKo45FQuGWf8GkpzHqBNBW7YwsfqyuFNehQFVbSlTQS/Lr+8GL/FEkQbYVxZqQUTNmuaKmAdwhm80X1vMB1BVhu4kioe2zHyygDnrF3b8wBC/zrD8aCTEWF3o4=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 4/8] vpci: Hide extended capability when it fails to
 initialize
Thread-Topic: [PATCH v6 4/8] vpci: Hide extended capability when it fails to
 initialize
Thread-Index: AQHb23ycT0X2vA9tYE2cHa4M+crvOLQJAzsAgAmiH4A=
Date: Tue, 24 Jun 2025 09:37:13 +0000
Message-ID:
 <BL1PR12MB5849D6DEB4AA4343D57D72DCE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-5-Jiqian.Chen@amd.com>
 <816dd3fc-e6fc-40f6-b7c9-29d2411b52e5@suse.com>
In-Reply-To: <816dd3fc-e6fc-40f6-b7c9-29d2411b52e5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7704:EE_
x-ms-office365-filtering-correlation-id: b960f6d1-0759-4fd6-f836-08ddb302b2fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aStuTnlFTWN4dFg5OTkwOE9aSWNCZWVYTHkzQ0pMSnZLV3VHUkFmeXVPVXV0?=
 =?utf-8?B?ZG1VdktFc1hTeGxjZFFWYXBrNnVUaE1nM1NBUnRqS0w2allQTnkvMy9TOTF3?=
 =?utf-8?B?VDEyNEx4THE3ZlJIUitjakpvd2VRaDJHU0xtOFdlNXdqZjdGZDZETzlmYURl?=
 =?utf-8?B?QzNyWGUzOWtXZjFYd1JkUzJTeGM4VmpnWFhVWE9qeXI5WHJVSHg3STdLVTk1?=
 =?utf-8?B?ZUV4eHY5c1BMVHM5Q1hNOVQxVmx3YTZWNjFtVXpNMGh3cG15eWFxMGhUaTBj?=
 =?utf-8?B?MWdHZHk0YVlzMmZ6YzdoQlNLaFpRSXM3MWF1bW1aQUhXeVlzb21nUkNaeGhF?=
 =?utf-8?B?Tmg3amlFUjJPTE9FTHlVdDdZc2NkTUQvc3lScjNNTzFNSFlrT2JYMkVDMVJm?=
 =?utf-8?B?cVNGdVBjUmJYSmN2WnRLL3AveU84WTRxMm5yelVlUmYrQS9NUDFGQjVCOGZz?=
 =?utf-8?B?cExGR210azBjNzRwRHo5WUQzeXZZRk1sdzVLM0xSOHVXZTJ0SlQxQ2NEZGh2?=
 =?utf-8?B?Tk1xOVBCVVE5Zno5OHM5L0N5ZkhMYjRmQk1TZWtpRUhrcjljSU80dzZSeDRx?=
 =?utf-8?B?TG1jbXQ4SDRaaFczSTFHWUVxV2hlY3JBY2hwMDhpcVVNTnVrTThmVXBnTCth?=
 =?utf-8?B?eWdRK0JSNlVhYkk2RUgyRmRoS1NrLzlTTDQ2UGF6UWdtUzBIQUJ2Z3lnNGVD?=
 =?utf-8?B?Zmg3aVhZK21QYTlDNWdIVlFMZzNDUW40MWhRSVpJODQ5Y3g2QlNSSDFZc21W?=
 =?utf-8?B?OE93VU1jbEQxUFd6ZTFPU3ZtK21QbkFRekd6NVVvVFY0SUYxSHppZHNDUzUz?=
 =?utf-8?B?T0FiaXQwRTVQd25SOXhNZXB0NnJ3M2EyTDdxSGlTUEFSMTNyWXNjeEN6d0Vw?=
 =?utf-8?B?dDVsc25Yc0lNTzFGdTNuRElHcm5lbXE5akVESERucG5wbXJXOGprcjE3NUVu?=
 =?utf-8?B?SHNmNDVUajlCdDhQQkUrWXpua2s5V2QyZzFIWDlUVzJwZDBlMzNadURwZTRa?=
 =?utf-8?B?b1hjbitpRVorcTFDUm1vSUVTOWlOcE9NMktDVUNJNlNFS0hWYTFZTy9PQndO?=
 =?utf-8?B?QlpsdThjb3RZczFoQWpzdTk5azZ1ZlFRMUtncTNjVlNsOXRqYlFWNVIwR0Jl?=
 =?utf-8?B?QXFTQmZMaVZseSt1M3JTZFZKYnFiVzA1QTNiZmxqb3pKRmx0NksxMkt3c2RY?=
 =?utf-8?B?cGpQOHM5K0tKQ1JSVXp5N1hzbG5NN3BEdjNTMWJqcTREcldneDRYeE95akd6?=
 =?utf-8?B?QzA4MlNURENLdHA0RmtEWHBKbzJYRGpRVEkzMmFlTnBkd1poY2x0dzloYnBm?=
 =?utf-8?B?Vll1eDAvWnhjK21SbU95VEFXc216bVpxdGlUZ3c0elBlMzhmTm5iRUVnaGJL?=
 =?utf-8?B?dCtKWHVZeHlxMTAwTWk0L3VyRFpxait4U3pKR0U3bEl4Qit4ek13MVlyZ2Nx?=
 =?utf-8?B?ZGZ0cXEvVS85U0pSMlpkZDZKcTR2REVGQ3NDNjBQdnFoa2FtWnRBYWZTSUhJ?=
 =?utf-8?B?bjZnWEJLNmhidEdQSTNKN1ZuTXBQQmYyUFVZelZwZU9pRDcvOHIxb1oyV29x?=
 =?utf-8?B?cUpJbTJPWmg0TTJYRk16a1RPZGRtUERUL2JvZFBva0Frb1crbTdqZXZjYXoy?=
 =?utf-8?B?bkpDQzVueDBQSVpvR2M2YmRXQXVHcFpCYkdoRGtxcHB5ZTI2UVBYL2pvQXhp?=
 =?utf-8?B?R0xJdjhQeEFqUU04QXJJdXFpL2Rua2szQXNVSXFKaEVKVXB6K3ZjbEdtRTFI?=
 =?utf-8?B?NnNsUjVHbjBGVExKZ3pkOUZqZXJ2MXJ4QTlhdlJHcklIMXlWY2daSkdJdUhX?=
 =?utf-8?B?d1ptQ3pCT1AxdWk4M0FvREYwU242bEtPNEpvU1BLQU5lbWpBVGJwc0JabFRr?=
 =?utf-8?B?dnovQ3JvcFNyL240TGFieVZDbXlsdWVLenhKUy9BQWM4V0k5T1ovSmpHZFZC?=
 =?utf-8?B?bWMxR2xJRjVzejI0VUVIaitadmZOT0FCV3RBOXdvYjVJUHVUei9LUjUwOUVN?=
 =?utf-8?Q?2TX+tyyprv9h4YETitj/N/WpU+k+/8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SjczRFZESTFVdXVSMUhUWG1TT1BkcG8yT3dEVnRYUE55YWgzVzlqc0ljdUg5?=
 =?utf-8?B?UzJRYUpHUDdIQk5WalVhYWJ2b0FKenRFTFNFN3FpS25rbVllQXBIamhmUWxr?=
 =?utf-8?B?bXMxSlZZOEF3VXBJd1gyNHdtMTY4WDZuUXlYcTNQenA0Lzd3Rmh1MVJRTzh5?=
 =?utf-8?B?WnBKSHRNU1NDZDBsQW1tSWdUNnZ6K2pLTWZIeU9FYjN2QU1ibnNCbWRrdytl?=
 =?utf-8?B?WVdCeWQ4UEJ4VVB0WjNPUFgwUXMxQk1aL2k2NXZseGduUjRHQWVXbmtKL3hk?=
 =?utf-8?B?bHBXdkxwSVVRdUVkY09oejZXRUtXZGNFb2h1ZWpUQk9PVEphZ0dIL215SjQz?=
 =?utf-8?B?ZFU1OTJGeVUveklnWEk2T1FNbTAvRWs1UjgyY0c2N0gyL01TRlBzSFFHUzdG?=
 =?utf-8?B?OFZaSVNheFlmQnJQSXBXSGFZTDVmWEQ5QmlQOWpBWTRiS08xOFhHY0FlbnJl?=
 =?utf-8?B?dThrVERpWjB2b0FNcGNpQ2VDbXZqTENkNVk1elBRTFV4aXVrWHRuMHpTOUpj?=
 =?utf-8?B?MFJRWUpwK0pUOHRHb0w1ZFA5dDVYRXcxNzhXRXk1UW1XYUxXUVp0T3A2ODJW?=
 =?utf-8?B?Z3NhQUhkZXhMU2JhSk1jbEhZWVRqUTc3akc5b3lmOFhsM1RNb1I3WnprSG9F?=
 =?utf-8?B?eE0wQ21MclptSWVwcW1kZ2FGaktXaHp0eFJHY0kvbTh3azdtODd1a2MyZzVJ?=
 =?utf-8?B?VUo5Znh0R1NPWVIyMUljSVF2ektqaHF4UUEvYzgxTnVBOHl5S2NQWHNzbFVr?=
 =?utf-8?B?S1poNEE4alNmZ21yc01mK0hvVklzTTV5cGNOalN0V3Y2UTc4N3JybEJGZnBm?=
 =?utf-8?B?dUlCWlQza21nTnphUVFKZzJ4U1VmYmpnNWFVY1ZaT28rL3hFQXl3T0ZQT3NJ?=
 =?utf-8?B?UmwyZ2xMdzRBRDlWdU41cXNkU0lkSHpGdThkaEhYZ29lYzRhcXljREVJUmpD?=
 =?utf-8?B?QklNWTlEQmV1OVVteTQ3dFNBd2d5Y3I5T0crRjN2bEZVUm00OUJ0WFFOeGk4?=
 =?utf-8?B?Tk1KVm1pMGMxWU05cjcrUTBIZTZhdFplZFdTV1JQMkEyWG5PakIwUzVuWWZW?=
 =?utf-8?B?TGZZQ3BQMXNOMDNqcnNyUWUxRmxYNkozL0c0VWFBZzdkOFlFNWVEcDdTQ0c2?=
 =?utf-8?B?ZmtwTTZ4KzhuSHdQT1N2VGNPNjBlV3c5K0NYbVFLT1R4Um9xSit3eXczTG5D?=
 =?utf-8?B?RTJEclVVN1A5ZzZ3UUE3alNnRzJsdDBHdzZQRGJEa21EUS9GWVFrdVRablY2?=
 =?utf-8?B?K1hXendrNzk1WGlhMW5FQ2hmU0JZamRuVFdHeGlsejhmTjZGYXlUWklBRHJT?=
 =?utf-8?B?bEY5NS9WRERnUmVFN0FxcURFZmlLRVZNdnQ0N2tTMEpvYWZBMWNnQWN2MUEv?=
 =?utf-8?B?VnFTeEZRRlZndG0rYVVIMWZGWlhkR0UraS9Mc0pqOEpyOE13OVU1T0U4Q0FE?=
 =?utf-8?B?Ym1zSTdEdnJieXhSSjYrQk5Udk9Ra2tndkhhVllBUmpkaEFTOTBvMTc3WUpq?=
 =?utf-8?B?Q3AycHF4NERzdkVxUHZrd1BxYWRpUjgzTU56YUliMFg5RnZaVTlnMWhqQ0Vj?=
 =?utf-8?B?R2RIWlFuNXpTcElFZm00R0tJLzQ5dk1CaXJFbVRka2xrUmwydXVnZ1RkcGRG?=
 =?utf-8?B?MThZWE9mS2FYQmsxLzZFb1N4M29YZE9PVy9Tak5ZdXVFYWdWQ1YvNmltMGlr?=
 =?utf-8?B?aG9COVNJeDVTa21PT1VNT3QzRmgxS3F3SlUwZ0tsUjAzZ2FlazhkZG5qQTdl?=
 =?utf-8?B?a0Z3ZE5aTlhHK2FsNjBDS3BWMncwYVhvQmlIT1I0a3VIR1JjS0g1VmxlSTJG?=
 =?utf-8?B?ckdtSXY5em1LU1FPemFtRlRMRHJqMWlQRXdkUWhCeDZKSFlkR0V6em1DZkhE?=
 =?utf-8?B?aHM1UXJGTlBTS3hYQ3daTWk4a3ROTjJIMlpabmtJRTFQMFgwa0NpRnM0WTl3?=
 =?utf-8?B?cHp3bGN3cUZ6Y2xGR2lIWCtBM1FmbDhNRmxPUWordDR5WkhLeXlCcnQrZVU4?=
 =?utf-8?B?dndXZkMrMFV2THNWcUhhT2tEbWYzZklvclVrSnBkaC8xSFM1Q1NjSFIvY2hn?=
 =?utf-8?B?QjNoL1R5WW0zR0p0Z1loV2U2UEJING1UOE1qMlBxUlZ6WmIvSm44V0VYdHg4?=
 =?utf-8?Q?VC/A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4360FD69A6C5B64C8ADE9409D4BE0483@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b960f6d1-0759-4fd6-f836-08ddb302b2fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:37:13.0238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnQ+UuTs5phEm1taPaEI0pklBUvcjs1lsy62aGsxCFt6ZztT19Q+86zaiPjNFlO7O9UTQFxRPdDAhDz+QvwYKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704

T24gMjAyNS82LzE4IDIyOjI3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNSAx
MToyOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiArc3RhdGljIGludCB2cGNpX2V4dF9jYXBhYmls
aXR5X2hpZGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBjYXApDQo+PiArew0K
Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgb2Zmc2V0ID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxp
dHkocGRldi0+c2JkZiwgY2FwKTsNCj4+ICsgICAgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnIsICpw
cmV2X3I7DQo+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+dnBjaTsNCj4+ICsgICAg
dWludDMyX3QgaGVhZGVyLCBwcmVfaGVhZGVyOw0KPj4gKw0KPj4gKyAgICBpZiAoIG9mZnNldCA8
IFBDSV9DRkdfU1BBQ0VfU0laRSApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOw0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsg
ICAgc3Bpbl9sb2NrKCZ2cGNpLT5sb2NrKTsNCj4+ICsgICAgciA9IHZwY2lfZ2V0X3JlZ2lzdGVy
KHZwY2ksIG9mZnNldCwgNCk7DQo+PiArICAgIGlmICggIXIgKQ0KPj4gKyAgICB7DQo+PiArICAg
ICAgICBzcGluX3VubG9jaygmdnBjaS0+bG9jayk7DQo+PiArICAgICAgICByZXR1cm4gLUVOT0RF
VjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBoZWFkZXIgPSAodWludDMyX3QpKHVpbnRwdHJf
dClyLT5wcml2YXRlOw0KPj4gKyAgICBpZiAoIG9mZnNldCA9PSBQQ0lfQ0ZHX1NQQUNFX1NJWkUg
KQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBpZiAoIFBDSV9FWFRfQ0FQX05FWFQoaGVhZGVyKSA8
PSBQQ0lfQ0ZHX1NQQUNFX1NJWkUgKQ0KPj4gKyAgICAgICAgICAgIHItPnByaXZhdGUgPSAodm9p
ZCAqKSh1aW50cHRyX3QpMDsNCj4+ICsgICAgICAgIGVsc2UNCj4+ICsgICAgICAgICAgICAvKg0K
Pj4gKyAgICAgICAgICAgICAqIFRoZSBmaXJzdCBleHRlbmRlZCBjYXBhYmlsaXR5ICgweDEwMCkg
Y2FuIG5vdCBiZSByZW1vdmVkIGZyb20NCj4+ICsgICAgICAgICAgICAgKiB0aGUgbGlua2VkIGxp
c3QsIHNvIGluc3RlYWQgbWFzayBpdHMgY2FwYWJpbGl0eSBJRCB0byByZXR1cm4gMA0KPj4gKyAg
ICAgICAgICAgICAqIGFuZCBmb3JjZSBPU2VzIHRvIHNraXAgaXQuDQo+PiArICAgICAgICAgICAg
ICovDQo+PiArICAgICAgICAgICAgci0+cHJpdmF0ZSA9ICh2b2lkICopKHVpbnRwdHJfdCkoaGVh
ZGVyICYgflBDSV9FWFRfQ0FQX0lEKGhlYWRlcikpOw0KPiANCj4gQ2FuIHdlIHJlbHkgb24gT1Nl
cyByZWNvZ25pemluZyBJRCAwIGFzICJqdXN0IHNraXAiPyBTaW5jZSB0aGUgc2l6ZSBpc24ndCBl
bmNvZGVkDQo+IGluIHRoZSBoZWFkZXIsIHRoZXJlIG1pZ2h0IGJlIGlzc3VlcyBsdXJraW5nIGhl
cmUuDQpJIHdhcyBub3QgdmVyeSBjb25maWRlbnQgYWJvdXQgaG93IHRvIGhhbmRsZSB0aGlzIHNp
dHVhdGlvbi4NClRoaXMgdmVyc2lvbiB3YXMgbW9kaWZpZWQgYWNjb3JkaW5nIHRvIFJvZ2VyJ3Mg
c3VnZ2VzdGlvbnMuDQpNYXliZSBSb2dlciBjYW4gZ2l2ZSB5b3UgbW9yZSBleHBsYW5hdGlvbi4N
Cg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

