Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D8AB9A47
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986904.1372432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsPl-0007wX-Iw; Fri, 16 May 2025 10:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986904.1372432; Fri, 16 May 2025 10:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsPl-0007us-F4; Fri, 16 May 2025 10:35:41 +0000
Received: by outflank-mailman (input) for mailman id 986904;
 Fri, 16 May 2025 10:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q1iX=YA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uFsPj-0007um-2x
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:35:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80453b3d-3241-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:35:36 +0200 (CEST)
Received: from IA1PR12MB8467.namprd12.prod.outlook.com (2603:10b6:208:448::9)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Fri, 16 May
 2025 10:35:30 +0000
Received: from IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e]) by IA1PR12MB8467.namprd12.prod.outlook.com
 ([fe80::1633:cc45:8177:a91e%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 10:35:30 +0000
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
X-Inumbo-ID: 80453b3d-3241-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPjMg96UZQTaWDKEFNOmR9ZH9xruJOkOwvlFTRtFlNnxjWSRBbRtI6F+SjsG1Eki7ilnx8veGyUYXvCcym+4Mg4UkBR84fjAG6JjtIwDOEMxWBt4qQQQbLWs5yLjdvdxdJMjZp15h+Gpi002MqnQ9dTjO8Zv/XsFoFqvxlnrGTPjVy+ckFYCZS1L1rKSblyOfx0oOvESu9q9Gv+oTp1iBDZqFvpNZMwaij0I2tTjv4UXocq/fhXLPipQIQqwhc7u48U8TtRJf+f6F8GSMFC59DteCQfiUoVpu9n70ydgej+YsO9qnW0j9ghRBJf5S0q13tF5atJJ/TzLSzP9ZQq10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO1PhjOK2fmhLrtpYBtEjeTUyUHJHvaSqwq4YTHfA+U=;
 b=VtWpNhnz92IyI7Sts8lTPXoZ8zeepwew6lkILTZRaFd9OCheN8HLY+NbB48N71YxY4TD6TFU1My9+dhKruz3M4DhOFbsfIWLzD4OprrW9rOZUKzEH1K6LPtrh/4zAjXedn7mL0rg29Y3p3Uk1XkTgsU5fUN+N+z6GFHEFTTf7v0XFP+2pDjVeheVVhzzvjawMDm20gLnT5pNwPMuquq2zs2YokNsB8TkeF9yb5nCaa5yNYDX3dnK4zLLXQU7bWu5JOpWeAMvoxDj92uGPhvdaNed/jABtyQuj7ulzOCuLAfKx/j6ViOF8BQrm7Lu0xm5VxeHrkNuPUJeZO3P2U4Gnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uO1PhjOK2fmhLrtpYBtEjeTUyUHJHvaSqwq4YTHfA+U=;
 b=ftRS/104J88Wx1sgqNHjhDJMGdjhhzjysaBGJxVakJe3OoiiiZwQEMhj/5RbL325hMMdKFdNLHc0dxu7hkygwli8Dino+ubqJEmm1LuRphrSrPL/siRCMJF6JnmuSFIRWF91gR01iiMYZgmRKqeSMAvTeVATx52ZyKR+XRhhEuE=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Topic: [PATCH v4 03/15] xen/x86: introduce new sub-hypercall to
 propagate CPPC data
Thread-Index: AQHbrRCmWPNHyarMuUaK4nZ2TXIaALO5UliAgBvrnhA=
Date: Fri, 16 May 2025 10:35:30 +0000
Message-ID:
 <IA1PR12MB84678234717460CB092E671CE193A@IA1PR12MB8467.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-4-Penny.Zheng@amd.com>
 <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
In-Reply-To: <2e1de23f-cc79-4d37-8667-0afd07736db3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=8c18a3d8-a11c-496e-a897-9e0563ae00ed;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-16T10:35:21Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB8467:EE_|IA1PR12MB6017:EE_
x-ms-office365-filtering-correlation-id: c2914a39-5b64-4a9f-5bfb-08dd9465617a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L3ZwVDlzME9QUzE1ZCtuRDVaL3h3SXNVSGhjVTdXUzE3UXQxR0xlQWN3SnBn?=
 =?utf-8?B?TGZGL28vT1BHeFIzYWZBT0hCTnRsb3lmaWhGTTFGWVpEdDJnWE9ZamdCTjlw?=
 =?utf-8?B?TC8vL1BFUkpNYkZJTklzaTFxSjVaVG9waXBHNXJRUC9pYTVpczZwczZwRXdH?=
 =?utf-8?B?cUNGL09MZ2RWYWRBV0M2dGFLZW56dlFlQWZ1UjFmVDFmajM5em52ZlE4dnJ2?=
 =?utf-8?B?am1NTVNXRExha3RBRlV1UjBkTERjT2ZvWGFXMHNqUzJzdzlyL0VUdWpYODRs?=
 =?utf-8?B?c2lBaDdmY3M5VHB5eTlGcDExdVRyZmRIQ1VydFNhNWE5dGlMelU3QXpDNzh0?=
 =?utf-8?B?d2F5MEN5cnlJUlcwdHV2TWM1MFQ4L3k1NG1IRGRtSDBWUGpXaGJPeUVHUnJz?=
 =?utf-8?B?ZFRpdFNIc0FnUzhmWEQ4S29HcUJaNk9pakh2RW9yZXR5MWVoQ20rc3diWm5I?=
 =?utf-8?B?RlBOWWxydDd5YTdHRjQwVHFMNHQ0ZUJQREFrVXJGdS9vc1Y0cVQvU25xQnBD?=
 =?utf-8?B?d0JDU29VYVFyRExpeUpKamw4QTJ5NXZnVWE0MXhUbDFDUWxUbXFsc0FoTHFI?=
 =?utf-8?B?MVMrWEN1Z1Y3TWhFTlIrVko3dkx5K2o1N2w3UEtLNlR1eWpvUWV2ZjA3cllv?=
 =?utf-8?B?eFNjSG5SOW9ZZHRxNkZFK0JyRVp2QTJ0c01LUWVpVUp1SmVpdWVycjZnanV1?=
 =?utf-8?B?aXlUTFYzR1J0eEpxY0dwY3NYaWxiWW9qSm56T2c4YnRHZG1aQUlkUVhVUHRt?=
 =?utf-8?B?NWtTMDdHWVV6Kzc4WUNadFFiU2VUeUpmbjQ5YTZnQk9aZ04vWDhDUDl3cklh?=
 =?utf-8?B?MWVCdDFkbHRRTUdLZVdvdHVBSzVZOHVnWDVhbEZ5WXNBTFdBM3RpQXFma1Rs?=
 =?utf-8?B?a01jaXBYNUVaQ0FaOXBSNEhmQzdpUlhJU3lQRitpVTFXcnBSTCtGdGs2YVBV?=
 =?utf-8?B?RjQvb0tZNktFWGIxYU5pSW5pRnZZKzJnQ1dGeVcvTjc0MzJ1alBBTm1BNGVi?=
 =?utf-8?B?elRkTjAyMjY0TWFVdngvNklKSXlFWGFMNjRYYzNqVjFHek1TTjVoUVpnbnBR?=
 =?utf-8?B?UGJWdFRGQy9mQ0xTaDlISjNrOEQzdEJvcVBueVBwMm0vRUhVSnBYdE9ydXJR?=
 =?utf-8?B?czdPSGZMWG8wbE02Ylc0SHk2cERsUmdrY2V3eGtuSjgyVDh0bWY1cG1wL2Nl?=
 =?utf-8?B?ZVJHNXlKM3psM3JmYXdhSVFlL04zbHVqaGp4azduVTVWcXo4MmViOFdoaXp3?=
 =?utf-8?B?RVN1U2xUV0hVSHNYMDVXeE8zTDk3cTBjZEZ2Z1hIQ1ZiZnAwQUkzSEJ4bVFN?=
 =?utf-8?B?cS9JT01FMEFOSVUxdkFBSnd4OWFzWk9hOFJadGxYelQ0bUZtL3VpY25oN0JE?=
 =?utf-8?B?dFN4ZWZpZElZS3BZdTNMTyt3dkFtVE1kRTRUdmgzcTBCVFlCTVMydmJ4dVBx?=
 =?utf-8?B?WGJkR0pvUzlaN3F5cVd0MnpYU1BIUFBGSHlVT2drdUI5bUxYSjhmWWlxWTNF?=
 =?utf-8?B?M0dhaE54MExXSFpmeWJ1L0ZCMk05UFpmK0Vxd2NmSzVHWDF1M0NUZFRFb2Iv?=
 =?utf-8?B?bGFobm95K1BKOUpzSUx0N1ByWmZlcU1sSzZpcXBPUDUzdWY1OThkRnhra0NW?=
 =?utf-8?B?ZUJLZ1lyWnNFcFFKemFyemZLMHFHWHppd0thRC9IM05lMU1DelVKditydG9v?=
 =?utf-8?B?L05hN1RBbkdZNkwvS0ZqUnJBOFQzUzlJT00yeDhtTWgxdzdjKzJYTUxmYlkr?=
 =?utf-8?B?MjBaVml2VGFsU2l6d3JnZ3FOSHVkdm5WU3phVXRrV1krMGhXZWFhOVZ0b1Z5?=
 =?utf-8?B?WjlQRE14anFDak11WStoZ1BONHo5cXZXQXhFS2JuQncxT0oxcDhXWTJyZzNV?=
 =?utf-8?B?b0c2SFFIYytNa0t2bzdwdGg4QXRGK1B0NUFleGtiZ0Z6bGZNcU4rNmEyUjk5?=
 =?utf-8?B?RENYSTZJckVocTBNMHB3ZW5VeC9YdmhnbHZGNUd4ZExZNzB3SVFwbXBuYWVQ?=
 =?utf-8?Q?HT882ikASJRUVCFj4T0mzxJNvGg+ik=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8467.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aWg5SXFQSkwrOHJRMkl2aHhCaVlGNEx3eENuZVEwYWlCOHJZZGIwTExibUth?=
 =?utf-8?B?K1ZiZG9rblcxVHl1R3RDVHVEdGhmUVZkeHBuZFZqOG5yeGQyRXdZamVsc2pW?=
 =?utf-8?B?M3lBTWh3OHZQa2RBRFhvZ0xaQmFxb21qTUNaQTVOd3Z5Vmc3ek5DOW0wcXZO?=
 =?utf-8?B?cWxmVVVtN2piZ0xmM1c1Y2VWSUI5bXlCTERHZjRveEsvcXpZS0dCSk93MkR0?=
 =?utf-8?B?T3BEY3VScEFZVERlNGtFeEFTQlFxWFF2V1R4TjRvSkJYSnRWZEpIWmdRVW13?=
 =?utf-8?B?UDJiQlZMUDRjamIyV1dzMWppMEJzVWZySDZMY2lrME5wdkV5dHVUdlRBT0tQ?=
 =?utf-8?B?ZkRZbHpQeitGcW44bURpV0MyOVA2MHZQYVlPZG5qZ1ZSdXFxR3JjeUZ2WUMx?=
 =?utf-8?B?S2ExZE9MZlJpL3M2aDNSVlRFU05vTFFiVXhtdVNCT2tON1V3dGVpZW84ZnI0?=
 =?utf-8?B?VVc0bHdMbVBrT0trZlFCZENQN3ZXeWlZbURUeVFOYmF0bkVtcXdGSnNtTjBP?=
 =?utf-8?B?SlhkNEVjbzZSQmZuclcwQVNxNzg4cUNzSTBCd3BUWWp4YzZ5cWo4K01Hd0oz?=
 =?utf-8?B?U0M3TGNsSi9oZEdxSmpXeC9mYlc3ZlZIY2h0U0N0WFJQRkpoNXBDcE55K3Ni?=
 =?utf-8?B?dCtLa21FRWVHQmY2TEpzNjFTRFpLZzNLUVJCWnNaZC81U3pVV1dTeG1Od2Jt?=
 =?utf-8?B?S3lzQ2M3djcyQitRUm5SOUtvcU10dklYdnRnbzNsdlNKSUtMZGtXQ3hVdE5j?=
 =?utf-8?B?U0xsZGJXZnZSV3l1Ym12V0hSQkNtUFdQOGFmVFBvWnVlU2h3MUhXcEpyWHRE?=
 =?utf-8?B?c0MwQ1Y3TTVEVFlRVVRCQy9jTHQvMU5kQW14aXhtTmlheWhtVjREWlFrcHda?=
 =?utf-8?B?eGRYZm8xM2hGR2ptTFN3c1I3K2N6ZU13cFZvMzlZTWFuYVRLTk9MMDhqeXVr?=
 =?utf-8?B?dFdoYzYrOE5Ib3AwbVUwWlhESkhMZC9OSzBNQnh1dVF5aVRGRUVqbXhmamNh?=
 =?utf-8?B?NHRGQzdwVzgyNVNwV3lxQ1dnQnZEL2l2Z2N1cTQveDgvTUx5TEZieHJsUnFL?=
 =?utf-8?B?cjJpRXM2UWd3SmRzTGxYOU5ldFM3d3RHbGgyQVlYdDUzeGQrdDZpN2IzY3Jz?=
 =?utf-8?B?d1BmeDRzYy9rWWlVeUJPYW0rMzBqdVI0QUQzNDVtWWFRYjJ3Yk0xMStGY2hr?=
 =?utf-8?B?YVVmamJ3NUpINStVMUkxUU1mbTkyUjVZRnQwM0VUTUpBNEtITTFFWWN4S3FD?=
 =?utf-8?B?YlN3cExENFBGYUJIOTd1VXduaWo2K09COTZ4ZFZFeTB3aGxOd1JkWWJVb2kr?=
 =?utf-8?B?dmZ4KzRrcDNEVTczTzhTcHhYeEFla2tRVkt0SEU0bDNsUmxVVTBlV0tBSXps?=
 =?utf-8?B?cWRMTWIycjJEaFpNVGtYUWZNOFZRa2ViTTVhVSt0SGlBVDgzYTJ0c0xBM05m?=
 =?utf-8?B?VXpmam85NE9ReWZHeWJEU2pQbDAvcFlDUHZ4MDNTY3ovcDhCSjdjZ1lKUUxR?=
 =?utf-8?B?Mm9NM0FUWXZQZUhhcjIybVJUUlF2RlN0Sk84UEx0OENPZFV5VGN1ZTJyN3NW?=
 =?utf-8?B?d01vbzZjMVptdFYwREY5Y0hjQlNnNEFJTnZOVWpUSUFkZHRybDAya210NVJ0?=
 =?utf-8?B?dk1jNHpsc2tFZW5KdVduWHpUL0JpbHVZUTRIbXk2K0xKRXA2bWpOcjJvbkRw?=
 =?utf-8?B?ZURENXp2VWh3QnEzM2FYbUpXQlJRVVhuck93L3dnS0tTM2hOMmZDcWdtVUhK?=
 =?utf-8?B?WTFaYmN3Zldqay83cGlDcmVGZTBpcnJobkdxYVFZVE1SY2w0NXhrV2VPdDZ1?=
 =?utf-8?B?b1VlY0d4YmQzUTBIaE1MTDA3ZnJLKzNtQ0RjcHZ0WjdsNkJyT00xUkY5SDYz?=
 =?utf-8?B?YitLcWwvVTFnTlEyaXVYRVBpRFVMYkt5akNleGFMWXltd0dBb1dOaDlkSFBM?=
 =?utf-8?B?dlVFb0N6TXAzMlJ4T2o0cVJqUGlFZ1AxOXdVU2Y2N0duRXNPNEtlMDNUTGFu?=
 =?utf-8?B?SXNjQmZXNktUS2g4b2RCbzRKbXp1VDZCWE4zR205NFB1a3pzQ0ltTy9MaDBi?=
 =?utf-8?B?T2ZoNnNXWEtQTTFjKzAvajBUSWhyWjR4b0MyeGxaYkZpbzlvMGd2MFI1aHpj?=
 =?utf-8?Q?Ig1A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8467.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2914a39-5b64-4a9f-5bfb-08dd9465617a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 10:35:30.4063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xziX0exVmyu1ezsGutz7ZoXNlApZ3U28zURId5mP8YQ6alyKloSPTE8/dcuPDGtLZEjcy4BxfS5Alf1Rz8Rl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjgs
IDIwMjUgMTE6NTcgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2NCAwMy8xNV0geGVuL3g4NjogaW50cm9kdWNlIG5ldyBzdWItaHlwZXJjYWxsIHRvIHBy
b3BhZ2F0ZQ0KPiBDUFBDIGRhdGENCj4NCj4gT24gMTQuMDQuMjAyNSAwOTo0MCwgUGVubnkgWmhl
bmcgd3JvdGU6DQo+ID4gQEAgLTQ1OSw2ICs0NjQsMjYgQEAgc3RydWN0IHhlbl9wcm9jZXNzb3Jf
cGVyZm9ybWFuY2UgeyAgdHlwZWRlZg0KPiA+IHN0cnVjdCB4ZW5fcHJvY2Vzc29yX3BlcmZvcm1h
bmNlIHhlbl9wcm9jZXNzb3JfcGVyZm9ybWFuY2VfdDsNCj4gPiBERUZJTkVfWEVOX0dVRVNUX0hB
TkRMRSh4ZW5fcHJvY2Vzc29yX3BlcmZvcm1hbmNlX3QpOw0KPiA+DQo+ID4gK3N0cnVjdCB4ZW5f
cHJvY2Vzc29yX2NwcGMgew0KPiA+ICsgICAgdWludDhfdCBmbGFnczsgLyogZmxhZyBmb3IgQ1BQ
QyBzdWIgaW5mbyB0eXBlICovDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogU3Vic2V0IF9DUEMg
ZmllbGRzIHVzZWZ1bCBmb3IgQ1BQQy1jb21wYXRpYmxlIGNwdWZyZXENCj4gPiArICAgICAqIGRy
aXZlcidzIGluaXRpYWxpemF0aW9uDQo+ID4gKyAgICAgKi8NCj4gPiArICAgIHN0cnVjdCB7DQo+
ID4gKyAgICAgICAgdWludDMyX3QgaGlnaGVzdF9wZXJmOw0KPiA+ICsgICAgICAgIHVpbnQzMl90
IG5vbWluYWxfcGVyZjsNCj4gPiArICAgICAgICB1aW50MzJfdCBsb3dlc3Rfbm9ubGluZWFyX3Bl
cmY7DQo+ID4gKyAgICAgICAgdWludDMyX3QgbG93ZXN0X3BlcmY7DQo+ID4gKyAgICAgICAgdWlu
dDMyX3QgbG93ZXN0X21oejsNCj4gPiArICAgICAgICB1aW50MzJfdCBub21pbmFsX21oejsNCj4g
PiArICAgIH0gY3BjOw0KPiA+ICsgICAgc3RydWN0IHhlbl9wc2RfcGFja2FnZSBkb21haW5faW5m
bzsgLyogX1BTRCAqLw0KPg0KPiBUaGlzIGJlaW5nIGEgbWVtYmVyIG9mIHRoZSBuZXcgdHlwZSwg
Li4uDQo+DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGxhdC5sc3QNCj4gPiArKysgYi94ZW4vaW5j
bHVkZS94bGF0LmxzdA0KPiA+IEBAIC0xNjgsNiArMTY4LDcgQEANCj4gPiAgISAgcHJvY2Vzc29y
X3BlcmZvcm1hbmNlICAgICAgICAgICBwbGF0Zm9ybS5oDQo+ID4gICEgIHByb2Nlc3Nvcl9wb3dl
ciAgICAgICAgICAgICAgICAgcGxhdGZvcm0uaA0KPiA+ICA/ICBwcm9jZXNzb3JfcHggICAgICAg
ICAgICAgICAgICAgIHBsYXRmb3JtLmgNCj4gPiArPyAgcHJvY2Vzc29yX2NwcGMgICAgICAgICAg
ICAgICAgICBwbGF0Zm9ybS5oDQo+DQo+IC4uLiBob3cgY2FuIGl0IGJlID8gaGVyZSB3aGVuIGl0
J3MgLi4uDQo+DQo+ID4gICEgIHBzZF9wYWNrYWdlICAgICAgICAgICAgICAgICAgICAgcGxhdGZv
cm0uaA0KPg0KPiAuLi4gISBoZXJlPyBBbmQgd2l0aCBpdCBiZWluZyA/LCB5b3UncmUgbGFja2lu
ZyBhIHBsYWNlIHdoZXJlIHlvdSBpbnZva2UgdGhlIHJlc3VsdGluZw0KPiBjaGVja2luZyBtYWNy
byAod2hpY2ggSSBhc3N1bWUgd291bGQgY2F1c2UgYSBidWlsZCBmYWlsdXJlKS4NCj4NCg0KVW5k
ZXJzdG9vZCwgSSBzZWUgaXQgYXV0b21hdGljYWxseSBnZW5lcmF0ZXMgQ0hFQ0tfcHNkX3BhY2th
Z2UuIEkgc2hhbGwgY2hhbmdlIHBzZF9wYWNrYWdlIHdpdGggPyB0b28NCkluIG9yZGVyIHRvIGF2
b2lkIGNhdXNpbmcgYnVpbGQgZmFpbHVyZSwgSSBhZGQgInR5cGVkZWYgc3RydWN0IHhlbl9wc2Rf
cGFja2FnZSB4ZW5fcHNkX3BhY2thZ2VfdDsiDQpJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIGNv
bXBhdCBmcmFtZXdvcmssIGlmIGl0IGlzbid0IHRoZSByaWdodCB3YXkgdG8gZml4LCBwbHogbGV0
IG1lIGtub3cNCg0KPiBBbHNvIHdoZW4gbGF5aW5nIG91dCBzdHJ1Y3QgeGVuX3Byb2Nlc3Nvcl9j
cHBjLCBwbGVhc2UgYXZvaWQgdW5uZWNlc3NhcnkgZ2Fwcw0KPiBvciB0YWlsIHBhZGRpbmcgLSBp
dCBsb29rcyBsaWtlICJzaGFyZWRfdHlwZSIgd291bGQgYmV0dGVyIG1vdmUgdXAuIEkgdGhpbmsg
aXQgd291bGQNCj4gYWxzbyBiZSBhIGdvb2QgaWRlYSB0byBtYWtlIHBhZGRpbmcgZmllbGRzIGV4
cGxpY2l0LCBhbmQgY2hlY2sgdGhlbSB0byBiZSB6ZXJvLiBUaGlzDQo+IHdheSB0aGV5IGNhbiBi
ZSBhc3NpZ25lZCBtZWFuaW5nIGxhdGVyIChpZiBuZWVkDQo+IGJlKSB3aXRob3V0IGJyZWFraW5n
IGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5Lg0KPg0KPiBKYW4NCg==

