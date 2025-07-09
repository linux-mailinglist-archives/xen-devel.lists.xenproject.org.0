Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54847AFDF4C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 07:34:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037671.1410215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNS3-0002lH-0Y; Wed, 09 Jul 2025 05:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037671.1410215; Wed, 09 Jul 2025 05:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZNS2-0002ih-U2; Wed, 09 Jul 2025 05:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1037671;
 Wed, 09 Jul 2025 05:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJyx=ZW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uZNS1-0002ib-VR
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 05:34:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:2418::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64423bf3-5c86-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 07:34:32 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA1PR12MB8987.namprd12.prod.outlook.com (2603:10b6:806:386::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 9 Jul
 2025 05:34:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 05:34:28 +0000
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
X-Inumbo-ID: 64423bf3-5c86-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnW+DJKncr/na6tDjKgyGEfN/He+2uXZoNDKwMDnWS36/rsF9IMzw8VB7heTr/Ss1UrelWr/LdniqhrBCwOZcHMeIXrvMZLw47MrB0rzQmidl/bE8nr41ZUEV3YPhx8/YahL0i9AmPCmc+0HrmJtTJOCsM/dheaO57jqBjo4lsouhPjH/7YTzz1VRQlcm9VYr1vbM54QmITNHRpaR/m8BYs1lOHVanw7cTNtbI+KyNNLZlQcPDSyB5gJjNEpIKXNscuhqvxhRsQPJ1pnyQ9i+pHiZWZeha2CYKyxZlkC2etgZ56UQLgqOV8N+pvayFxGcWHVHqgCWFAmabCPX9MXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kezi6cbAF8Zyc4ZSB5FVxJGKYVwaqGHrP6ptpIXTPRw=;
 b=yJbX56VCtSZX86xAmcz8JOhlaBozj4wQowHvo51T7bm8onrVV3CHXDH7RH4yL8DvlvBmEFxudXuD+u/Icmq1B30vUBZgZ9hyvO7d3UXpbb1xks26hr8YgteI+M/LtZznJvxRdsOSkPjXJkLBIFEJZRTgpq8wcJm2SBDUQdVezu/uWcp5pjTSyJM6pHPAB6LBU/RWTHzMwBOoO8XvbasAhosqoXrnlehR1I2OaDNDKHqEZa5T2jxF6AnO3fTxvSEK2Pn2drsGddCiu90G9kOVHahpcAWwhqTbAy05OZAD6y3MhJhx62/SDHVCpfpeSaqLeYqnrZqKYpbWVIfh0gFYrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kezi6cbAF8Zyc4ZSB5FVxJGKYVwaqGHrP6ptpIXTPRw=;
 b=4IjTDaKpIEMSL1v6Ct7VNfnnlm/fsSVIEEI3Lngt2K5F9Pcs53QcuDdY7ozVJyZUFxHT2zW8abPvfcpgWO5GT0tr1UEusvJMw7uSTShkO7smVNUpUiTD4R9KB373ZJ4EjNyabDMQSRM0RlKnORuxvN6L8ZSkKMwKYvQw2eKZ2+A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Topic: [PATCH v7 1/8] vpci/header: Emulate extended capability list for
 dom0
Thread-Index: AQHb7LJxCAe3dwZ41UCqlD5sc7if87QoStWAgAGGGID//3tSAIAAhoUA
Date: Wed, 9 Jul 2025 05:34:28 +0000
Message-ID:
 <BL1PR12MB584906633E31701F71330325E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250704070803.314366-1-Jiqian.Chen@amd.com>
 <20250704070803.314366-2-Jiqian.Chen@amd.com>
 <dd44b55a-eb9d-454a-836b-25dc7195a5ac@suse.com>
 <BL1PR12MB5849CD51AE6C1D7DE46EAD89E749A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <49c5ba24-e1fd-4b55-b230-1af2b22c1b18@suse.com>
In-Reply-To: <49c5ba24-e1fd-4b55-b230-1af2b22c1b18@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8901.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA1PR12MB8987:EE_
x-ms-office365-filtering-correlation-id: 95b891b4-0335-4dd7-5c99-08ddbeaa4626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NGZTSjVEYW5XeGdjRXFCVkNDM3JsbkJYWlp5Tmo3eWpPenptYXg1aW9pL3BZ?=
 =?utf-8?B?WmdITUJuaXljeTNON2N1OU5JSzFCcUlDNklyc3ZHN2lrOU9vNlI3Rm96dTAy?=
 =?utf-8?B?bW41L0RxLy9DclhzT3BYVU1EQUhzV0JGaGs5QWhHU24rKzBuOGZidmFsd3FN?=
 =?utf-8?B?a1E0S3lFYXVLclJOcFM4VzNnaSt5cXJKL0IzZXprb1gvbU8xUUVnRis4K2NC?=
 =?utf-8?B?ZGZLeXM3OVc0MHJyS3RzeERPU2hzcHFEYU1NNm5mQldYZE9aM2pCSmtvbDBr?=
 =?utf-8?B?dmZ6MUdHeUMzQXlnMmo3eVhzaU5uTnRKZ1R5ZjQ4QWtvZjdMd0NGN1FrSllL?=
 =?utf-8?B?aU4rUzB4a2hMb0pXNDYwcHhpM1F3TnY2Q0tGQXVRajhoWVg2d21FRWI5Nnlp?=
 =?utf-8?B?eDJ6ZVlpV0dtS2tPUnlvNWpvc2ZFQmxOWWNDbkJxS2JiejdoSmw5WUpSWWxv?=
 =?utf-8?B?N1pSSjFqZ2JZMU5NbDRaVDR4aTNrYnNzNjlScUhFSzRzaEVJc2ZEQis0R01G?=
 =?utf-8?B?cWNBWTZEcFRxNFo5YjczNnBBZHU1TkJVMEtyY0xOUHZJZ2prU2w3RG5pamNC?=
 =?utf-8?B?VGUvVkVldnc5Y3JxQVl1ZU1BYUR1ME9SbS9LZStCNjI1N2NEaUpZQXVRQmxW?=
 =?utf-8?B?azZyYlBoamtUNWRPU09mWUJDYnRCTFFZSUZ3ZFUxUGRhcmhhYk81d0YxT3Bv?=
 =?utf-8?B?eEJaTW9wYlhremhIUGRTMWdGRlpkRzAxc1ZEM3dzeUhyY1hlM3ltRUhNbVhX?=
 =?utf-8?B?bVZyY3RMKzRWT1QrekFIcUF6SlNoZGRpTDFtekNIc0F5SE1ZcExnNzhVSGc5?=
 =?utf-8?B?RWVGMWJPSkhTRWNLZDZ3ekVrUTAwZFBKVTEwMk5STFZTNEpoT3EvWUlKdTRx?=
 =?utf-8?B?NXlmSjROWjZ6aWllaVN5Wkk1S1h2ekU2eExLVGU3Z0lYRjZ6S2trQ1d4NDlT?=
 =?utf-8?B?eWVybDY5dTNiQ2VpcGNERVhCSThCRERERWVvYzNsZGdCVlBlTDNZSEtTT2lm?=
 =?utf-8?B?bTBzZkpXc0JMaE8wNHB1emhPZFh6QUxXYTNTbmJZd2REZzZzZWlmMFV5R2E1?=
 =?utf-8?B?OUVsYk9mUjJrcUtLTHBuUVBqTGdNUGk1cTA3b3V0dk5TL2ZCekNJQVk2MlZk?=
 =?utf-8?B?WmM0S2xQVHZsUUNsTWNSeU54V2lXbkgvRU9YQ1lJaEJ1VkJTN2lSV0xaNmhz?=
 =?utf-8?B?ZmtBNnpqSUd0aUpnMW1mVEpWblVMRDZSNks5SUlKUFprSWdSN1hqL3Y3TGl3?=
 =?utf-8?B?Q1hTVnFrM213N1lJN2pLeERVUWFYVGFKcU94NVVmeGhkaWc2eUZYTTBLbjRs?=
 =?utf-8?B?SGVLNHJiK0NlUnhIZHRUK3Q0dXgyRDVzR1R3WmZKNnkvUnlZQmxrSkZXSFpp?=
 =?utf-8?B?WlFZU2k3WjZTVW4xeURFaVl4UUlzUVN5WnV0TmZLQm50RWZnWE5mSEprTGpM?=
 =?utf-8?B?OVltTlJ1QnhENDhlc2w0dDUrdytWTDlGNnZnZkc0UEkxYmxuOVdWN0VyaEcv?=
 =?utf-8?B?MGovcWt6eFplYW9FS0dHeHpCcmhFNXVpMjB1T3ozYTF5ZldrU1h1dTRZVVp4?=
 =?utf-8?B?cmQzQ3U1dHZrNFdhSHpyM0RpUDB6TlBIbmt3STZuU0VQV2lBYWRQbmhOeDJq?=
 =?utf-8?B?TW1tVmFCUXhFSlRaaW9uYVdvb3hBTlNkZWVTMnUyTFhISmdtZzIxMU54M1NS?=
 =?utf-8?B?LzdpSzZrYTRGTmF0UkZNM2ZIdHptb1V0b2tZWDl3Sy9hK3h0THJXU204ZnVr?=
 =?utf-8?B?dXd1U3dYVzdod0NsMm1WaWVjZ1ZnazJqOHh5UjNjUHhJcCtuaFJDQ0p4UFdB?=
 =?utf-8?B?WSs2Ny91bFhrVk1IYVpJU3phTGpFMUI1NjFmbG83SWJIbVN2dE1uMUZFTlZ4?=
 =?utf-8?B?MndlOTRMM01oa1RmalN2bFRZbEhWWkZoVkttVFhGWlpSY1V2SU1tNkREeEdG?=
 =?utf-8?B?M1ZwZ3dpM00wUk1CTDlFNG9iU3hOckwxRjJiTG1MaXZmRnU5bUxjaW1kTi9z?=
 =?utf-8?Q?TCjxjLlRnoIoFu0BWUNh6SvOhly3ZY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjlNakxZY0M3Ym5OZWM5OWpTODVwY1AzUlZDUHozakdGS3grcXFKZnd2dVRa?=
 =?utf-8?B?OHkxTy9YQ1JxTHQ0SVZOc3pMaS9sT0VVYWNoSUtKRUo3ZXV4YVVWRVdhR3JH?=
 =?utf-8?B?VlF3QVd4OE9hRnFveDhJeWIrRUNxS0htendKelE1d1NvQmlTc1ZHWS9xR0E5?=
 =?utf-8?B?Mi8xV0pYU3Rsb0o0dmlMclZ5LzN0b0pSTWU5SlFBVWxDK0ZTajVlY2tiKzJl?=
 =?utf-8?B?dXorUnRWVlFYZ1FkcWUxRkx0TUhvbG1oL3o1MFZ0WXVNLy9JSmFVL3Q4TnNm?=
 =?utf-8?B?Z200WVhmV3JnTFRoaXVzbEt6MWlrQWQwQVlOS3ZJNjhmQnJBV1hkaGtwYnpI?=
 =?utf-8?B?UVpTMDRjUFpVbkZpcmJnOHdsQmsyb2lYSUphU0dGNithWW5VL0UwbkhpWGUw?=
 =?utf-8?B?d2FSUnQ4SmFVT2NwRFJpbTZ0eFlmNTZlNWJUR0MwTnBVV0hnK1dFRlJ3V0Zy?=
 =?utf-8?B?YkdSUU1qUU9meXEvYlVLYnQ5OXB1TmZ1TUtnVW1IZFprVEtNUTkvTWFTRGNK?=
 =?utf-8?B?QzZBdW10MGpQTkNhZzg2eHluNW14N0l1N1AycTVrY3BxSkx5WnRuOHcvZzN2?=
 =?utf-8?B?TkU1ekZIa0ZNNkhENWtNc29lWS9mdU5WZDFmalQybHZia1NsS0g0aXZqR3o2?=
 =?utf-8?B?SFdzdUtqeVdTY1IxWkUyYndaYTJ1MUU0UEUyUWdQcG91dXdQZmxEak9CVlVs?=
 =?utf-8?B?dmgwZllmbjdSVXlhNXdXZ0o3NmF3eFc3K0UraUJKb1BIWGhTSm42Nk9hZW1D?=
 =?utf-8?B?bTFDQ0xCTlRJZGhjNm15SkdLTUtGYzRYcnhDeUZoRlB2ZzNBNGRXUmtBQVJX?=
 =?utf-8?B?M3ZCdXMrZ3ZWazkrRjU4OXpabTBZS1Z3YkorbDZJYmlPVHJXNWhhYWFOSGJz?=
 =?utf-8?B?R2VKSlZrOXNyaFpwSUFESldrdjhFQjZJQklJcGxNY2IzVk1hTCt5VEhMVGhm?=
 =?utf-8?B?bmxVN3J2THNPK0kraFA5QjVjT05wSXBialk5VXlxeThMS0FRZjgvUXdUSGpX?=
 =?utf-8?B?ajN0Yk1jYTFqSENGTTc0eDVibktxQW1tekhlc3J6SUgvWVYzdWNPUWNzUGFa?=
 =?utf-8?B?VTIzRjIrSHArMEwrZnBvSzl5cGRqQy9lam8zRTV1bUp4Zk9DeE1CR3h6TDg1?=
 =?utf-8?B?eXYwdW9VWWJMRCtuS1MwYUdRMzBUeGIxSC9kNWEya0NTQjVhNVJUdGZxSWdD?=
 =?utf-8?B?N2g5RCt1TzcyTGQ5TmNDRzVUNzZDcFJMVVdTZTFod04xV05qVDF1QUtRNjhK?=
 =?utf-8?B?Uyt6eWlLVDExbDU2NTVETXZTRkZBWXVMN2JNbVdqUHcrRE9OWkVwR1g5UlJh?=
 =?utf-8?B?cG9lZnBoVEVMWEJUY2ZRNE5aSndydFFDZCt5QXUxR3RDNlBSYjlweHVibnRt?=
 =?utf-8?B?YzBkTGxaNVBlR2xrOHpkSS84Wk0vTG5xL1ovKzM3c0NuaENzV1ZvdXlHU3di?=
 =?utf-8?B?UUhqTU5FL1JlWmE3aUFDdFN1OW9KSElnNnhUdmx2Z1hmdlgrWEhoU09yeFBq?=
 =?utf-8?B?Vjk4TGx6QStZMFMxOVJ2ZWFYTWFBempTYzcxQzRUVDRlKzJ0aHV0WnNvSmd1?=
 =?utf-8?B?eDY4K09VWEFnbkpvYzhrb0hobmQ1RitZYTNwVCtPdFVPR2ZCem14UlVYczdI?=
 =?utf-8?B?RDdGbnZoOElOWUw5UjJxRlN3ZFI4NTdhTWkwNGhZWlJZZWl3UTdSVWNzZEdK?=
 =?utf-8?B?aHJRNDR4eTN2M3haZnN4dWxFdkpVRkdJQTNMNVdFMWlFVzB6YkdtWGNXZzZS?=
 =?utf-8?B?ZTI2d0NJS1N3MVZ4SjJrZS9kSHJjbC90aTVBaVJuQStveXlIaStTRzRCSXh1?=
 =?utf-8?B?QThBamNzYVZ4eE85WTdPTFdTem8zelRJVGE4WXFzdE05TCs2RWl1M0hrY2FJ?=
 =?utf-8?B?RXBRdDQyY0Y3VTNNdEIzUDdDZFZkWWxQSnpvV3pNSmp1RjZEcjNyVHp0Q2Jj?=
 =?utf-8?B?NFZ4WFhjREFzL2hFanIrZnh5WUhNbU11K3c0V1pyQzFhTkNocGNtTFp6VFJK?=
 =?utf-8?B?eURuTU1mZzBNTnFQQWNpYTFjK296eVViMDRJeU1ncEpYczErdkpVenc5QTVV?=
 =?utf-8?B?ZmwrZXhzM0ZnMXN1SkRRejIwKzUvUDQ2K2dOV3pNTDdGM2E4NmFaUW9tTlpT?=
 =?utf-8?Q?jYKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5BAA1DF3E6ED24B9D6B53ADBBD94BD5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95b891b4-0335-4dd7-5c99-08ddbeaa4626
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 05:34:28.6636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jsv5K7NYMC6dYFI4U6axqjh99vwycYq7aInC/OVkMSPcUsBO8kzjD1yiRw2Vh6GZzYFguyd0WP3WkyEVRhrnPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8987

T24gMjAyNS83LzkgMTM6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wNy4yMDI1IDA3
OjI5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+PiBPbiAyMDI1LzcvOCAyMjoxMCwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4gT24gMDQuMDcuMjAyNSAwOTowNywgSmlxaWFuIENoZW4gd3JvdGU6DQo+
Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYw0KPj4+PiBAQCAtODM2LDYgKzgzNiwzOSBAQCBzdGF0aWMgaW50IHZw
Y2lfaW5pdF9jYXBhYmlsaXR5X2xpc3Qoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NUQVRVU19SU1ZEWl9NQVNLKTsNCj4+
Pj4gIH0NCj4+Pj4gIA0KPj4+PiArc3RhdGljIGludCB2cGNpX2luaXRfZXh0X2NhcGFiaWxpdHlf
bGlzdChjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICB1bnNp
Z25lZCBpbnQgcG9zID0gUENJX0NGR19TUEFDRV9TSVpFOw0KPj4+PiArDQo+Pj4+ICsgICAgaWYg
KCAhaXNfaGFyZHdhcmVfZG9tYWluKHBkZXYtPmRvbWFpbikgKQ0KPj4+PiArICAgICAgICAvKiBF
eHRlbmRlZCBjYXBhYmlsaXRpZXMgcmVhZCBhcyB6ZXJvLCB3cml0ZSBpZ25vcmUgZm9yIERvbVUg
Ki8NCj4+Pj4gKyAgICAgICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZw
Y2lfcmVhZF92YWwsIE5VTEwsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwb3MsIDQsICh2b2lkICopMCk7DQo+Pj4+ICsNCj4+Pj4gKyAgICBkbw0KPj4+PiArICAgIHsN
Cj4+Pj4gKyAgICAgICAgdWludDMyX3QgaGVhZGVyID0gcGNpX2NvbmZfcmVhZDMyKHBkZXYtPnNi
ZGYsIHBvcyk7DQo+Pj4+ICsgICAgICAgIGludCByYzsNCj4+Pj4gKw0KPj4+PiArICAgICAgICBy
YyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfcmVhZF92YWwsIHZwY2lfaHdf
d3JpdGUzMiwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MsIDQsICh2
b2lkICopKHVpbnRwdHJfdCloZWFkZXIpOw0KPj4+DQo+Pj4gSWYgaXQgd2Fzbid0IGZvciB0aGlz
IHVzZSBvZiB2cGNpX2h3X3dyaXRlMzIoKSwgSSdkIGJlIGhhcHB5IHRvIHByb3ZpZGUgbXkNCj4+
PiBSLWIuIEJ1dCB0aGlzIGNvbnRpbnVlcyB0byBsb29rIGJvZ3VzIHRvIG1lOiBXaGF0IHVzZSBp
cyBpdCB0byBhbGxvdyB3cml0ZXMNCj4+PiB3aGVuIERvbTAgdGhlbiBjYW4ndCByZWFkIGJhY2sg
YW55IHBvc3NpYmxlIGVmZmVjdCBvZiBzdWNoIGEgd3JpdGUgKGluIHRoZQ0KPj4+IHVuZXhwZWN0
ZWQgZXZlbnQgdGhhdCBzb21lIG9mIHRoZSBiaXRzIHdlcmUgaW5kZWVkIHdyaXRhYmxlKT8NCj4+
IE9oLCBJIGdvdCB5b3VyIGNvbmNlcm4uDQo+PiBXaGF0IGRvIHlvdSB0aGluayBhYm91dCB1cGRh
dGluZyB0aGUgaGVhZGVyIHZhbHVlIGFmdGVyIHdyaXRpbmcgdG8gaGFyZHdhcmUgaW4gd3JpdGUg
ZnVuY3Rpb24/DQo+IA0KPiBUaGF0IHdvdWxkIGltbyBiZSBhIGxheWVyaW5nIHZpb2xhdGlvbi4g
T25jZSBhZ2FpbiB0aGF0J3Mgc29tZXRoaW5nIHRoYXQgeW91DQo+IHByaW1hcmlseSB3b3VsZCBu
ZWVkIFJvZ2VyJ3MgaW5wdXQgb24uDQpPSywgd2FpdCBmb3IgUm9nZXIncyBpbnB1dC4NCg0KPiAN
Cj4+IE9yIHlvdSBwcmVmZXIgdG8gcGFzcyBOVUxMIGhlcmU/DQo+IA0KPiBZZXMsIHRoYXQncyB3
aGF0IEkndmUgYmVlbiB0cnlpbmcgdG8gYXJndWUgZm9yLg0KPiANCj4gSmFuDQoNCi0tIA0KQmVz
dCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

