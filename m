Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEs6EQMCg2l8ggMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:23:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002FE316E
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:23:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220201.1528908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYAO-0007AV-Kz; Wed, 04 Feb 2026 08:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220201.1528908; Wed, 04 Feb 2026 08:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnYAO-00078u-IO; Wed, 04 Feb 2026 08:23:16 +0000
Received: by outflank-mailman (input) for mailman id 1220201;
 Wed, 04 Feb 2026 08:23:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfmY=AI=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vnYAN-00078l-7f
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:23:15 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be3498e2-01a2-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 09:23:11 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 08:23:06 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9564.007; Wed, 4 Feb 2026
 08:23:05 +0000
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
X-Inumbo-ID: be3498e2-01a2-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVpgNAj+5REmJPhGROVm2FU/MuurmvkVDeyYnPqVHOptJsfhGVSCn62mOAy2/BNmrMj/abTkCKynT9iB3fDAq8s1Oi9RnI4lsrfAHdlm5HJUNiRX5TlnnxAf/QIJ1li+sgbjXoNX3iS3186o7g5GN7vLSZJ4JFfNqO5pAByVOTAVhX473AEFk6QTaYbHK+8SlZL1SYK6fPtfXAYnTfzrc1tK+TJ3ATNiAdeJpDNr9PFLLTLrm2LqlwCTbKcdmYfYHq6M55e/OP5a2+vgD/qcmHEIQwAwsq3BOHjLbwUv80CugEwy22bpaE2qmsdmDPl7PoNskIym87YBI4rXvJDaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBrDKcPbqxsi+b7VbLUJ8fHJFRVNrRw/EiDbnpN6R1U=;
 b=mwN+qawjwnb+nZKhCYzUpJ1+263K8N9M2ubgxWq2BWqYFbkbEQXuOMMfvqhaimSpKt0MNJuPfLBeRxvg4mvJkHTG8CEB9cvFnnu5mXVcGv44+6nXqI8eMeysoBvswVGl9i4aEqS5H3NkMAB3hGfB/6W/Mp9f47hXc+J/WGmnGe7ftYvm1txXRKVjr+psmQR7yzyOk4vEPOvj45UjDTeNPK0aITsoyX1bM86INh2xb9tuitYvOfJly+imY4dC0KCijMKIU2dU3YMZaKyKPO8gsOE2GmKRcdFGja4Su5F356kXYOwg/oyQnYWw12wYDJI6oAYpmbYqr92eUToMEsbFSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBrDKcPbqxsi+b7VbLUJ8fHJFRVNrRw/EiDbnpN6R1U=;
 b=cO1LS1vZpkvC0+P5OESG4ZJkRcGNrZaTgtqNeM7QNQs9KQ8GmGBfXZNIZcaHH53kaguo01Vr7j2pco7x8fSyOkZEUSodFLDcYjwUU9cLZw7l6VmBwGIMskvMPtJweHQSRgnEnOPvuzSfv6dqiQ6OcjYauBtchKXFjYEKfs6y9bc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "grygorii_strashko@epam.com"
	<grygorii_strashko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Garcia
 Vallejo, Alejandro" <Alejandro.GarciaVallejo@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>
Subject: RE: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
Thread-Topic: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related
 domctl op with CONFIG_MGMT_HYPERCALLS
Thread-Index: AQHcWtXdwWaFTRetvk29bNPbH/CVXLVylQnwgAAQSACAAABkEA==
Date: Wed, 4 Feb 2026 08:23:05 +0000
Message-ID:
 <DM4PR12MB84517BAB14591F2D46BF082FE198A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
 <DM4PR12MB84517CB58BD82B676DD25AE9E198A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <bdda8006-6361-4e79-b3ef-19409bf98587@suse.com>
In-Reply-To: <bdda8006-6361-4e79-b3ef-19409bf98587@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-04T08:23:00.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|MW4PR12MB7384:EE_
x-ms-office365-filtering-correlation-id: 1945254d-b25b-4ada-944c-08de63c69f2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkJDRFNWeWkveHRWUy9oeHNzL2JZYjJmbW9adXYxZnZLeTZVblhoaEJIeDYw?=
 =?utf-8?B?ZG9NNjhUVjJiVUlxZ1Q0amdaWUpLSjJOaHY1a3JwUVJhbjNHcHRSMkR0cWpi?=
 =?utf-8?B?emtTdDE2VTAwVEw0STVZZTBaS05EcmYrUkJLMDNQZFh0K2h3UkVTWXpnaGNF?=
 =?utf-8?B?K2JkKy9GTm5OQk5oa3Bzajd3ay9aY2NRRDZ5YWJzLzdEYU1WaFBtSUs5VE83?=
 =?utf-8?B?eVJ3aWtyVmJRSGFxcURpWnhZdkg1enh3Y2FBR1gzNGpuTmRjOHd2Vmhzc3BJ?=
 =?utf-8?B?MG9nMkxpOUdSc2dvVm5pTXNzaDlIZmw4aTJPWjF3NVRoVElNMU5SMDVzRVVK?=
 =?utf-8?B?MnA5WjJuSytXZFdvRlpkNUFOMmlmY2N3cy8vN3hNdzI5MllCdlpMN1djRmdz?=
 =?utf-8?B?UXdEOWUwaTBhUU50QlZ3ZnJWdFFxaHh2bk1qRDFYaldIQktnNXJHWHU4YjlQ?=
 =?utf-8?B?WWtCZnp3YksrSGIzVFhmTTh1Qkx5WlhLekYrbkpyMXBucm9MUmQrMFdHeW1q?=
 =?utf-8?B?VDZObjdrbFA5UGhHUFJCSmdaTzZQa1ZWLzZRSlk4dnVWN0hoUlZGUTNwQVd5?=
 =?utf-8?B?R2VuMy8zWWpwWHNwSTVhK1BRR0w2ZzRJSk1HVFA0c2xTWS9HU1hVU0JlMUox?=
 =?utf-8?B?SVVUYit1bEJMVVFHd0NGcENONWtnR1daYzd0U2tjc0tYTUk4OVZZM0JDcWNv?=
 =?utf-8?B?T0xTOExlT1djZm5Edi9TT2ZKcEw0RTFUL2xjbmtQTkpXd2FQUHN1SUlKbnhY?=
 =?utf-8?B?cENkTlU1M0t3VnlMamhqVkFGOW1SRTc2eGtHVEdpQnJVUlpmWXBWS1FTdUZQ?=
 =?utf-8?B?MmN6cjhTZFNodzJ0S1dKMUE2OTg4bEc1NkxEUzR5c1FJTnJOeUJJaDNaK240?=
 =?utf-8?B?UXQyUkRSaURsbFVqWnVCeGI0UktuMUIwZXk5N2VPY2lyc0x0eFhDM1ByZHdh?=
 =?utf-8?B?V1ZzVCtvZkJGQkFYTWx3WVJqdGt3QXkzVHg5M01WVk1tZVpDL3VjS1R3MjNh?=
 =?utf-8?B?TWZmald5RGIzdUh1TDhmeEtpV0FLa3E4cy96WFk3ajBIWlh5YnJLTXFveHZZ?=
 =?utf-8?B?RFVFOW9jVEg0MzhTNjRPWGpZNFp5OUZlbi83bGFFYWNHeUJaYnhJWDFlcjg4?=
 =?utf-8?B?WkViRjN3VS9hSVQ3SzR2eFdVNmQ3bTZ5bmhpbGwzRHRrSEJubndSWW9qdFZ0?=
 =?utf-8?B?Ym54MzNaVGJHWUJWbU5Cb2c4MTZlQnNIS1hVa3FLTUVOMTNTU2VHSStneTI2?=
 =?utf-8?B?TjNkQ2cxeWkwNTRiM1h6MEpEWnRXSnpWa0UxVk9nWmxFNHpnWjM1c1dpUThC?=
 =?utf-8?B?UXM5Qm9QU3ZNME5UL0hidHpvNzFtZ1dnWkZ4aDMzTmFiQytITE1iOFFZczZq?=
 =?utf-8?B?OUt1UWdkVklqL1VDNXdYL1praTJ2TDMvZlFNZWFhTi9MZSs5UExIOWE0YU1Y?=
 =?utf-8?B?cjBGREZpbVRMRjlOL25ubTc4ME1SZDgvNVFJQmh3RHF2ZG1GajB3TnZ3d2lj?=
 =?utf-8?B?Rml2eWw1VzF6cklhOWtWeEtSaXVTWTc1elFuUzBMZ3lneDkyd1dyaEh6ZXhn?=
 =?utf-8?B?akhrRi8vQUg4bXNBVVdST3pJVjhOaHEwbVF2QWZKZldaWW15NStsalJKRWNJ?=
 =?utf-8?B?d2poMTNVb2x2U08wMmgrek0yTmNiaVk2eEV2dmpqK2tsWVhGRzNEMG1sQkxD?=
 =?utf-8?B?LzQxWEt3VThzdVk4SlhkRXQxcHhET09saWl6cHlaRWlXdVFiVjNteU95Y0FC?=
 =?utf-8?B?QU40QXNWNEhjSFRmTEpsY0dpeE1WTm4wNmRDWXRNbmFtbHo1QWk3TGFLLytu?=
 =?utf-8?B?d0xOTnFLWFFhQU13R3g2cEFuR0x2T2xtcEcvQzF4WVNqOStKNHZpbi9HOEJI?=
 =?utf-8?B?ZWxMQkF5MWtkRWcvNjlFblB2T0h2UFR2QWVIUXdMSU5JSWdxOHVPcEkyekhB?=
 =?utf-8?B?NkI5RzVsWFZUWUREOEJIRGtFYktmMW03bmVLdi9OSlByZVlUQW5SNXYrdCta?=
 =?utf-8?B?R09IV2haQ3I5K0JZOVp0cUE5ZEVPQW44WE53Z0JneTdZWjF2VThHaGlUU01D?=
 =?utf-8?B?WWVWdDR4RGJiWWt5bnVTa3orRVdZVlZBUnNNTytRM1dvbXo0UzROZG5qZHlG?=
 =?utf-8?B?d1NxR3FJTmJWdUVPVkJSNGRIc3lnMitTZkN1S3ZvOWFKR3YrejVJK3N3cDNz?=
 =?utf-8?Q?gEMzrvXRtVy8pQ8rWY7V/Ws=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?KzdoUG5TRC8yMDhxZmFuYkFLSlM3S3NEeVoyK2NaNTR2TDJYWUZOL2IyZG13?=
 =?utf-8?B?MGMrMDRCb2M1RUVrUDFUd3h2ZlVFcGJpanFxVWs0SUNjd3l6Z1hrdGxvT2Rw?=
 =?utf-8?B?QTFpSTRTQ05hNVEzTzNGUWs4NTNyYnhZWnhnZXovcllWUzZQM09KSWJYUUQ0?=
 =?utf-8?B?SXpsWXdIOFVpS21OWEl6dkM1bklTc2g5WnNlMFc2K09JMHdxajYxbi9CQTFC?=
 =?utf-8?B?dEhkSVFERU1oUlRZQU5pN1h5MU8wWlJXTXVic29YdU9RVFNnRVNpYThQS1Rm?=
 =?utf-8?B?SFYwZ0g2RjZtTnhqTE5WaGY2YjA0eUtzN0haQTJyMFJTRkVJRXFOYldWOGtR?=
 =?utf-8?B?VUZyMlR0OVNMaWk4L0E3VXdyZGx2Ky81OWNudjZZOWxxR0NNR1J2MWFCVlFU?=
 =?utf-8?B?UnI1UURuNDZmYlMwQzhyTE4xRldnbFpGQ045QlI0MThhK01xbkVRa2lLNU9v?=
 =?utf-8?B?QTd4ZWNXL0dPbUVGcEIrOXEvWk5FV3VhN2tYNDlHQndUdjJsYW4rRUwvci94?=
 =?utf-8?B?M2dDcTM0TWtWZWZMMjU2YUxBb1pRY0ZraFQvdnpwQ0JDa2Q2UURkZDVac0FB?=
 =?utf-8?B?akYvUzU1bFFLMlNyVEFZcDFPaEJ2SFFXTzBxYkdIeGdBSkVqU00vTkNLbW8z?=
 =?utf-8?B?aFpnRzN5WGRXeVVkSGcrZkdETGhXcUpOSzlrdG15T3hBQ2dUcWV6Z2FEQzJ5?=
 =?utf-8?B?UC8wcERrQ3Ivd0tRZ2pkdExOVHd2UVZkUGVmaityOTFXdERWZTc5dTBYQWZk?=
 =?utf-8?B?cUFzTklKYU80SzVoMU1paVhYSC8wdWk1bmVoSWZOaGp5dHZRaW1PUXpTQnNv?=
 =?utf-8?B?czRGRG9Yc1BRUGJwZWxjS21CYXY3bEV3OTBTQ2xKaVBZZzN2ZW52c0Q3TGlR?=
 =?utf-8?B?MHBnT2pFYVhncGpLSEthWnlGektjZWNsR05rQmx2TWxDVGdCM2JZT2N6MStz?=
 =?utf-8?B?QTNvZ21Eakw4cXRsWDg2T2ZzSCtVbnZ3UWJ0WlFIOHgwNks3SEN0SWZ0Nldi?=
 =?utf-8?B?NlUvbm9SMHR2WlBBOHZ2QmFLTGlwNDVVcXMzbTViNmE4MmNyZ2xMTlNlL1RQ?=
 =?utf-8?B?QTBhL0oxZjBqTlM2MVpaUUJjV3VSWE8vT3l6M1ZPeEJJNlpsWkxUczlTMkJF?=
 =?utf-8?B?VWc0MXRxRWtUU0dEdi9TMlJpRVlYMTNPZE1rN0JXVW5jdlJUbDF3enUvK21w?=
 =?utf-8?B?WCtRMGIyVlFmR2JaeDRabFNMcThrc0VkTXkwblZ4R0grVWhVeEtoMzlEK2ZT?=
 =?utf-8?B?d1RwUXJnUjNvaC9QVnRxWlFrZ2RVbDJLSkxESnVZT1ZwU0VuNXBNSHcwbk5H?=
 =?utf-8?B?NUJ0cGVvQ1g3Ly9WeDZGWkxHN0hvNnVsY3dvb0pYeSs1VTZ4bCtUekhma2hT?=
 =?utf-8?B?TDdYWnAzbmVVdUJxK3JGbGFUb0FRZjIyS2hNa2tuU0F4elR1N3dqUGVSR0pG?=
 =?utf-8?B?dlQyemdFK2RldktveVdGYWNQYTdSbHlsTEJ1QmNqczMzU1Exc2h2d3YzUS9G?=
 =?utf-8?B?bG1EeWo5VC9PMm1kZTlySTFDNlRQUnE1dlJ6WFFxVVVzSmhVVzRwbUw3VTVZ?=
 =?utf-8?B?SXpnR0pPTldKSmxNbllPRkJqVWNaamFKUmNrcmt3UGZTZk5RbS9aREF3OXpj?=
 =?utf-8?B?THFKMUpDc2FCZjJmVW1VTEZ0disxN2ZwbWl2UlVaN2d5Z2ZxYUhBeHR6OXhO?=
 =?utf-8?B?Vk5PVFI2WnBQRUE5RUdXYy9LZENTakE5U3JUMTAxNi8raUVINUFjY1JtUHhW?=
 =?utf-8?B?OG5kZHRsZlBDdUladU5vM3lNM1lPK0k4Vkxsd2x5SXZtMkZmN0llV3dOODB6?=
 =?utf-8?B?THZEbzBKM1RuYlZYVTJTVUVJdk9peDJDWldBV21wZGdramJtRnUvcmxyRUNE?=
 =?utf-8?B?Q1R3c2RHZFFMSXVka2NVbjczUmIwWjc2ZmR3SFVrcjcyNEYwUkxyRFR3UFZv?=
 =?utf-8?B?U1IySUQwTFFtV3JQSWpOV1ZPazF2dGNFSC9jdDlCclVqdWFicHA4NC82bWtB?=
 =?utf-8?B?dkFFMnNQUnJ5eTh3NHVaVEtkaG15czVvWURBK1ZqQVNNUHMvSjNDZ1N5bjBw?=
 =?utf-8?B?ZWdwTGdrOTNoNUVLL1NLelJWTzQ2S0NMVDh0UkpOTDVteEx6NFdJQ1BCYUxi?=
 =?utf-8?B?TUxUK0QwVFJ4YW9wdTk2MWJGT21sV3VLRTdFY3I4SmVDbVNCZVIzcXhNc3pG?=
 =?utf-8?B?Q3I5dkpzcmpJSXAzR3ZjZVJvcFpjbm5QT0hsc1VWeXlwMzQ4OVdlSzJDeFhx?=
 =?utf-8?B?RHZDaUF1QkVDOUpGUkRJTVBnZEliMXlPTFJNYStvYXlGc3FaVmxsT2UyRWZM?=
 =?utf-8?Q?gMTheo5Y6wxatcFLyl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1945254d-b25b-4ada-944c-08de63c69f2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 08:23:05.7983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RBIhF9k8IjqUI9OngP+3QtE4z/LE5SC9/8wRxNxW221ofEoPYlYrar+ebHxndX2focSk2E8jXKiuAIuasEJhCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Ray.Huang@amd.com,m:grygorii_strashko@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Jason.Andryuk@amd.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,DM4PR12MB8451.namprd12.prod.outlook.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,apertussolutions.com:email,xenproject.org:email,amd.com:email,amd.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7002FE316E
X-Rspamd-Action: no action

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgNCwg
MjAyNiA0OjA5IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IGdyeWdvcmlpX3N0cmFzaGtvQGVw
YW0uY29tOyBBbmRyZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ow0KPiBBbmRyeXVrLCBKYXNvbiA8
SmFzb24uQW5kcnl1a0BhbWQuY29tPjsgRGFuaWVsIFAuIFNtaXRoDQo+IDxkcHNtaXRoQGFwZXJ0
dXNzb2x1dGlvbnMuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBHYXJjaWEg
VmFsbGVqbywNCj4gQWxlamFuZHJvIDxBbGVqYW5kcm8uR2FyY2lhVmFsbGVqb0BhbWQuY29tPjsg
U3RhYmVsbGluaSwgU3RlZmFubw0KPiA8c3RlZmFuby5zdGFiZWxsaW5pQGFtZC5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTQvMjRdIHhlbi9kb21jdGw6IHdyYXAgcGNpLXN1YnNldCBp
b21tdS1yZWxhdGVkIGRvbWN0bA0KPiBvcCB3aXRoIENPTkZJR19NR01UX0hZUEVSQ0FMTFMNCj4N
Cj4gT24gMDQuMDIuMjAyNiAwODo1MCwgUGVubnksIFpoZW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5n
QGFtZC5jb20+DQo+ID4+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjEsIDIwMjUgNjo1OCBQTSBb
Li4uXQ0KPiA+PiA3NzIsMTQgKzc3NCwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29w
cw0KPiA+Pl9faW5pdGNvbnN0X2NmX2Nsb2JiZXIgIF9pb21tdV9vcHMgPSB7DQo+ID4+ICAgICAg
LnF1YXJhbnRpbmVfaW5pdCA9IGFtZF9pb21tdV9xdWFyYW50aW5lX2luaXQsDQo+ID4+ICAgICAg
LmFkZF9kZXZpY2UgPSBhbWRfaW9tbXVfYWRkX2RldmljZSwNCj4gPj4gICAgICAucmVtb3ZlX2Rl
dmljZSA9IGFtZF9pb21tdV9yZW1vdmVfZGV2aWNlLA0KPiA+PiAtICAgIC5hc3NpZ25fZGV2aWNl
ICA9IGFtZF9pb21tdV9hc3NpZ25fZGV2aWNlLA0KPiA+PiAgICAgIC50ZWFyZG93biA9IGFtZF9p
b21tdV9kb21haW5fZGVzdHJveSwNCj4gPj4gICAgICAuY2xlYXJfcm9vdF9wZ3RhYmxlID0gYW1k
X2lvbW11X2NsZWFyX3Jvb3RfcGd0YWJsZSwNCj4gPj4gICAgICAubWFwX3BhZ2UgPSBhbWRfaW9t
bXVfbWFwX3BhZ2UsDQo+ID4+ICAgICAgLnVubWFwX3BhZ2UgPSBhbWRfaW9tbXVfdW5tYXBfcGFn
ZSwNCj4gPj4gICAgICAuaW90bGJfZmx1c2ggPSBhbWRfaW9tbXVfZmx1c2hfaW90bGJfcGFnZXMs
DQo+ID4+ICsjaWZkZWYgQ09ORklHX01HTVRfSFlQRVJDQUxMUw0KPiA+PiArICAgIC5hc3NpZ25f
ZGV2aWNlICA9IGFtZF9pb21tdV9hc3NpZ25fZGV2aWNlLA0KPiA+PiAgICAgIC5yZWFzc2lnbl9k
ZXZpY2UgPSByZWFzc2lnbl9kZXZpY2UsDQo+ID4+ICAgICAgLmdldF9kZXZpY2VfZ3JvdXBfaWQg
PSBhbWRfaW9tbXVfZ3JvdXBfaWQsDQo+ID4+ICsjZW5kaWYNCj4gPg0KPiA+IEZXSVMsIEFsZWph
bmRybyBoYXMgY29tZSB1cCBhIG1vcmUgY2xldmVyIHdheSB0byBEQ0UgdGhlc2Uga2luZHMgb2Yg
b3AsDQo+IHN0YXlpbmcgY29uZGl0aW9uYWxseSBhcyBjYWxsYmFjay4gSGVyZSwgSSBqdXN0IHRv
b2sgdGhpcyBjb21taXQgYXMgZXhhbXBsZSB0byBzaG93DQo+IHRoZSBtZXRob2RvbG9neToNCj4g
PiBgYGANCj4gPiAgICAgICAgICAuYXNzaWduX2RldmljZSAgPSBJU19FTkFCTEVEKENPTkZJR19N
R01UX0hZUEVSQ0FMTFMpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgID8gYW1kX2lvbW11X2Fzc2lnbl9kZXZpY2UNCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgOiBOVUxMLCBgYGAgVGhlIGNvbXBpbGVyIGhhcw0KPiA+IGVub3Vn
aCB2aXNpYmlsaXR5IHRvIGtub3cgdGhhdCBzdGF0aWMoYW1kX2lvbW11X2Fzc2lnbl9kZXZpY2Uo
KSkgaXMgdXNlZCwgYW5kIGlzDQo+IGRyb3BwYWJsZSB3aGVuIE1HTVRfSFlQRVJDQUxMUz1uLiBT
byB0aGVyZSBpcyBubyBuZWVkIHRvIGRvIGlmZGVmLXdyYXBwaW5nDQo+IGFyb3VuZCB0aGVzZSBz
dGF0aWNzIG5vdy4gTGF0ZXIgd2hlbiBqYXNvbidzICItLWdjLXNlY3Rpb24iIHBhdGNoIHNlcmll
IGluLCAgLS1nYy0NCj4gc2VjdGlvbiB3aWxsIGhlbHAgbGlua2VyIGlkZW50aWZ5IHRoZW0gdW51
c2VkIHdoZW4gTUdNVF9IWVBFUkNBTExTPW4sIHRoZW4NCj4gcmVtb3ZlIHRoZW0gYXV0b21hdGlj
YWxseS4NCj4NCj4gSSBmZWFyIEkgZG9uJ3Qgc2VlIHdoeSAtLWdjLXNlY3Rpb25zIHdvdWxkIG1h
a2UgYSBkaWZmZXJlbmNlIHdoZW4sIGZvciBzdGF0aWMNCj4gZnVuY3Rpb25zLCB0aGUgY29tcGls
ZXIgYWxyZWFkeSBpcyBpbiB0aGUgcG9zaXRpb24gb2YgcmVtb3ZpbmcgdGhlIGZ1bmN0aW9ucy4N
Cj4NCg0KSSBtYXkgbWlzdW5kZXJzdGFuZCB0aGUgRENFIHByb2Nlc3MuIFdpdGggdGhpcyBjaGFu
Z2UsIHdlIGRvbid0IG5lZWQgdG8gcHV0ICNpZmRlZiBDT05GSUdfTUdNVF9IWVBFUkNBTExTIGFy
b3VuZCB0aGUgc3RhdGljcyAoZS5nLiBhbWRfaW9tbXVfYXNzaWduX2RldmljZSgpKS4gU28gcHJl
cHJvY2Vzc29yIHdpbGwgbm90IGhlbHAgdXMgcmVtb3ZlIHRoZW0uDQpCdXQgaWYgd2UgZW5hYmxl
IC0tZ2Mtc2VjdGlvbnMgZmxhZywgaXQgd2lsbCBoZWxwIHVzIHJlbW92ZSB0aGVtIGluIGxpbmtl
ciB0aW1lLCBXaXRob3V0IC0tZ2Mtc2VjdGlvbiwgdGhleSB3aWxsIGJlY29tZSB1bnJlYWNoYWJs
ZSBjb2Rlcy4NCg0KPiA+IElmIHdlIGFsbCBhZ3JlZWQgdG8gdXNlIGFib3ZlIG1ldGhvZG9sb2d5
IHRvIGRvIERDRS4NCj4gPiBBbGVqYW5kcm8gYWxzbyByZWNvbW1lbmRlZCB0aGF0IHNpbmNlIHdl
IHdpbGwgZG8gdGhpcyBhc3NpZ25tZW50cyBpbiBlbm91Z2gNCj4gcGxhY2VzIGluIHRoaXMgcGF0
Y2ggc2VyaWUsIHdlIHByb2JhYmx5IHdhbnQgc29tZXRoaW5nIGxpa2UgTUFZQkVfT1AoKQ0KPiBz
b21ld2hlcmUgaW4geGVuL21hY3Jvcy5oOg0KPiA+DQo+ID4gI2RlZmluZSBNQVlCRV9PUChjLCBm
bikgKElTX0VOQUJMRUQoYykgPyBmbiA6IE5VTEwpDQo+ID4NCj4gPiBJJ2QgbGlrZSB0byBsaXN0
ZW4gZnJvbSB5b3VyIG9waW5pb25zIG9uIHdoZXRoZXIgSSBzaGFsbCBkbyBzdWNoDQo+ID4gdXBk
YXRlIGZvciB2NSwgc2luY2UgaXQgaXMgcXVpdGUgYSBiaWcgdXBkYXRlDQo+DQo+IFdlbGwsIGFs
cmVhZHkgdGhlcmUgSSBkaWQgcmFpc2UgbXkgY29uY2VybiBvZiBsZWF2aW5nIGFyb3VuZCBmdW5j
dGlvbiBwb2ludGVyIGZpZWxkcyBpbg0KPiBzdHJ1Y3R1cmVzIHdoaWNoIHdpbGwgb25seSBldmVy
IGJlIE5VTEwuIElmIHJlc3BlY3RpdmUgZmllbGRzIGFyZSByZW1vdmVkIGFsdG9nZXRoZXIsDQo+
IHRoZXJlJ3Mgbm8gcmlzayB3aGF0c29ldmVyIHRoYXQgYW4gYWNjaWRlbnRhbCB1c2UgbWF5IGJl
IG92ZXJsb29rZWQgLSB0aGUgYnVpbGQNCj4gd291bGQgc2ltcGx5IGZhaWwgd2hlbiBtYWtpbmcg
c3VjaCBhbiBhdHRlbXB0LiBDYWxscyB0aHJvdWdoIE5VTEwgYXJlIHByaXZpbGVnZQ0KPiBlc2Nh
bGF0aW9uIFhTQXMgd2hlbiBQViBndWVzdHMgY2FuIHNvbWVob3cgbGV2ZXJhZ2UgdGhlbSwgYW5k
IHVzZSBvZiBhbHRjYWxsDQo+IHBhdGNoaW5nIHdvdWxkIHN0aWxsIG9ubHkgZG93bmdyYWRlIHRo
ZW0gdG8gRG9TIFhTQXMuDQo+DQoNClVuZGVyc3Rvb2QuIENvbmRpdGlvbmFsIE5VTEwgcG9pbnRl
ciBmaWVsZHMgYXJlIGJldHRlciBiZSBlbGltaW5hdGVkIHdheSBkb3duIHRvIHRoZSBzdHJ1Y3R1
cmUgZGVmaW5pdGlvbiBzdGFnZS4NCg0KPiBKYW4NCg==

