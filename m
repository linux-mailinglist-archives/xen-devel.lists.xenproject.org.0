Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C8AF8AEB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032987.1406398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbY8-0007bR-Vc; Fri, 04 Jul 2025 08:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032987.1406398; Fri, 04 Jul 2025 08:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbY8-0007Zd-SD; Fri, 04 Jul 2025 08:13:36 +0000
Received: by outflank-mailman (input) for mailman id 1032987;
 Fri, 04 Jul 2025 08:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXbY7-0007ZX-6u
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:13:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c61e1f87-58ae-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 10:13:33 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Fri, 4 Jul 2025 08:13:29 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:13:29 +0000
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
X-Inumbo-ID: c61e1f87-58ae-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyJnAccjFkpYQkHqE1Hjrzso1qb2Q7kZgeslw5Hds9ep5wVYLbTx9kNWf4mghAVZLqSCzosXFgGdXwEXhwyAzmVrcx/qbMFmw/TK2DqKdZ/HevE2nn5N6f6/tYYrFMGdVBO7JreTDMzBg7Xh7pEo7N4N8RTuhZiaAMIFAVTWIuy65UJyoiYBTTxlffVA53xOIF6iUKzedzlPGpxZhnSXy0cSMi0IbfJEMke9L1NwxRRCVCnicmMYFSNYLlmMqQDd3Pkzf2g1LKehsgLLzmDTibzvOk/366HLXZx0PPlqmYm/imP0ql1ne8BH4Vw42oZPXkkS5mfQoJq/0KJaV4Eojw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBIwO7+OOnTjhipSD5adCf4hsQnylgERGlNEZY02FXY=;
 b=QqCqnXF/voY53iZtBHoXt80DZH8Uw0XJqgYZ99KDY36xgSzzK8zjMf1DY3mGcFqhi4mv7vuCziXADyjQ8h/480zs9hC08VJYhIZc/lnBO5TPqIg7zFQsVqsn8bkJkdXVHvXH6sBpUscvebOxt2UUYdz9nyUhDT+VYnwjVX12uQrBEVxpK2arH+v0xsCcumw8zJNbaw8ASG6xmWQy3+xgwKtg8tHTrBht+aJ/W/mBxv3eCvaxCiAm1YiZv+jHeIKhU3tFNQkNWUt/rna6avMkM7y8LRjw1FY4+e8dGlxuXyDj9rYOJVZYiqQN66NjEi89O7bZa2N49P+rR+eq0RNj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBIwO7+OOnTjhipSD5adCf4hsQnylgERGlNEZY02FXY=;
 b=Eydsy1MgheQlAARuPIBOBGfTylvk2nLtAzxTXSDRfGF//NHr7FJyJdLjQ+HMZFYplG4zhmEUHoy8iHJOu37k1p2OUgY975xaU8fuRy+R3xAMgFp16BDcmOmYgWR3tEGrbv7da3B5NYsZPRHgwzmbqcukjhlvTzo2Dj4y/1U7mMg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Topic: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Index: AQHbzuRKQ5+TGdD3B0+TZYuot60QS7QHQcCAgBqT2LA=
Date: Fri, 4 Jul 2025 08:13:29 +0000
Message-ID:
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
In-Reply-To: <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T08:13:15.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS0PR12MB7559:EE_
x-ms-office365-filtering-correlation-id: de7312c9-7faf-41ef-340d-08ddbad2a8a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aTRPK1BBV3B4Vm85dlVhVnptV3BnVlVTY2NjUjlwN1lMR2UrS3J3SExZaWxM?=
 =?utf-8?B?UFh5TVFXK2NrZmEwZ3Z1blg0ODFjK0RIRzR3cXoxckhjYzAvdFRxcW1ha3Ex?=
 =?utf-8?B?L2JYOXorUVRMWGlQaDh4VUdRaXkweW1MMThBK3V3WWc1WmpEamhHazZ5Mktq?=
 =?utf-8?B?THFyVE45aDVaRnJpZU5kMmlvQ2Z5WHBxTTV3MTU2b04vOWJDakpaSXRSN3Fr?=
 =?utf-8?B?NDRLV3FKTXExbXV4cm1ONVhKcnZZR2FvMlROd1BpZjN0bGwvcnBlSnZ1aHhT?=
 =?utf-8?B?dEdJeHdkdFE3NjRocDhxVUoybGovbGVCcVV2QkdjY3hreGsxeWVWZHJ0ZnVJ?=
 =?utf-8?B?akhUYUZaREoxcE90TFdTTldTdHlCMmtHWUY0aFRHNXdJOC84RVdzclVZT1Rm?=
 =?utf-8?B?eGVRNEp1bEZEY2ZWbnM3TkJkYzdJTUVoQUtzZ1ljTlhXQ3hOejdGdUdEbDR6?=
 =?utf-8?B?RFVFc01aOGZ5eTJCNXd4ZFk2NHV4UUJ1VXlYS1BXQmkySzZNektQM1QrT3lB?=
 =?utf-8?B?MERiUXVoVFRHMjBETFI5NWZqOEpadkU1YWlLREl2T2FrcmNlbzc4RG9aWEkw?=
 =?utf-8?B?TWhxMVI0TzZGL05MZ2FPS2ZNUjgzeG4wYW9SbDUxNVh3NlMwdU1pWlJMT0hr?=
 =?utf-8?B?eVJ5d3h0d20xMGtsTmZZbEZLa0hSYVRvVFJVbkpqSlRmS2ZTVDBONUVwN2Fr?=
 =?utf-8?B?anljQS9XM2RmWnc1a2NyRm9aNHNkQmM5OTZ3WWFXc0U5VXhzTU1pV0QvSnc5?=
 =?utf-8?B?NGhCK1IwUXBUaHZCUjdzOE1jRGpIcFZWTlQxMUNNSGwxR2d3bk0xbVYxZ3E0?=
 =?utf-8?B?bk5PSHRXSkdWSG5Cek40aFdwaXA4d2VSNUphOTZlZWtGcHFzdTZjZjlmQmNi?=
 =?utf-8?B?TUxXS3lFalBib0txSEozN1J3TTAvYmZHanFTVHFxRmg5Z3ZjNkJmN2czU24z?=
 =?utf-8?B?eU1qeWVndmN2Q3kyRlZ5VFFRelRVVjRKanFkWCtWNm1uYmhJaXRkQ0lXbGNm?=
 =?utf-8?B?UE01bnF4QTByV2V3UXRPbWpWMHliUjNVT3FyWGlmdEtSUzJzK1Uzc1c5QmlN?=
 =?utf-8?B?SmdtcnV3SEpNcXVXb3d2TDNtUjhObyt3c3hKcnNuNkZLbDI1R2JwTVpzRVdS?=
 =?utf-8?B?ZHIrUzJRUHltS0hYVDZqd0ZvZHExSTIrektOR3pWR21uR0QxK2p6MG5ab2lU?=
 =?utf-8?B?OGJDdXNhRktoM0xHWnZ2U09JM2x1ZHMvRVVuTFJPVHNBeGc5MjVjQVJDaEFh?=
 =?utf-8?B?NjVFcjJobjRGZ0E3MXpnYkhaZDNOQjFNdnJXdzBYNFRpTGVmVzFkUE5WOWEy?=
 =?utf-8?B?UUxsOUJvdVp2SlNTZ1BRbnlPaDNMSlpQMmsxTWRMQS9lSFdZMzlsUjJkeDlW?=
 =?utf-8?B?VGs2YklvQW9NKzJYcGt0dkNWa3JNOHhCQWJ4Y0V1YjNiMXgwc2hWV0IzMEgv?=
 =?utf-8?B?eFFRTVlNOVlVY1poSS8vNWI2Yy9rY21xU1BjRlZoSUk3dDdQdlBFN29PdHBF?=
 =?utf-8?B?T3lPOURvVGVPQ3U3aDA2YVRSNlh6S0RvMU5LNjlxQll2QStOakJNQjN4bXUw?=
 =?utf-8?B?dXZ5bVJsQm9Leis2WFZRVXFDd3BPWFpldHVlKzJsQW81SDhRdU1rNjJLdG56?=
 =?utf-8?B?YjN3L1VBVXB6czBMV1lVOFNsZGxUVHpES0hVZk85Ty9VdXZpdEVlMVozbEZ2?=
 =?utf-8?B?dmExbVJRekp0RFVQUDdFRVpORndaVmVLdFV5NCtwSG11b2dkNnlsZzNBWFRl?=
 =?utf-8?B?Y0tsUU50NmpmMHUvYlliUEdGcGhUM2wrQ2JBL1VLYzFTNGZjUGRjcWxJOU9T?=
 =?utf-8?B?K0N5WUlrS3JqY0hLTXkxeGVPNHZjT2NXYUNadDZmTGhiWGtIdVBTQTJrbk9D?=
 =?utf-8?B?RnlDenpsOGg1Y016bHpZREsvV1RNa0dGZ2VEQVBsaVlxQ0dKRnloVzMwSm1F?=
 =?utf-8?B?Wks4ci9BMU5WYkpvb1d1aUQ3MHRsRUdJMFI1NWFNZHB0MDNiYTlLU0ZtNUk3?=
 =?utf-8?Q?0aRGaKm84jwZJlODGXb8jKExk3qSdo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUozWERXVWQrY25yanhyZjhGbVNOQjlBMGRtUjVqdWRlV1I1QzRSeVllTTAx?=
 =?utf-8?B?MERHMHFIVzUwZnFGUWpEaThleFhtTHNiUVQ3MzdCWHlHRjd1REt4akc1Rlc4?=
 =?utf-8?B?bElaazNPVm5FaUhWeDRpV3ViTnc5ZUVKNzNVQU1iOVVsUVBWYmY5ZGltS3Zw?=
 =?utf-8?B?MTJkMmlKckViejltN2d5ZWx1Z3hvWm1oSHBkK2FGU29UMUhmdElpOGJibFVR?=
 =?utf-8?B?dlNrVkloZVBWV1ZMQkpPQ0JmbXd0bStsc1NwU0Q4d0ZEdkREWDErU1FJK29p?=
 =?utf-8?B?SFNmSnZpdmhjRUhGNTlJMk9WNmhKcjdGRVkzeC9vTDlqQU5lbVczQm1YZ3Qw?=
 =?utf-8?B?eTFIRCs1NFM2T0lBMzdoU0Via3d1MjlxZE9yaTZIcVg1alpKUjBFNUZET1NJ?=
 =?utf-8?B?bTlNQVZET1g4SHQ2NWNramJyWmd2Y21qazJwT0VMSjlhb3JBNDR0U2F4YVdP?=
 =?utf-8?B?eWpRWEZyOVhzZzd3T3FJWkpZTGhURkdmM1dORVBEZUhvU3FkQnl6a2JZOFVw?=
 =?utf-8?B?b0pHVU8xa1JpQU9Jb1YzdnZGdkwwWXVsYS8rR0FtNEJOeDFSeGttdjNqTXE2?=
 =?utf-8?B?dzNNZDVic0YxTHVqRm5EYVU3T2NweWlpd015RGVtQXJBRTVXVktLME1vVzUv?=
 =?utf-8?B?TjJiSzlPWFhJNUxpaGE0UkFmQzdZQjZFRTBjQnRTaHMwdGk5d3JOT21zVXNh?=
 =?utf-8?B?ZjVKVm9RSFBPelVsWGpVRWdGdWEzTkY3dXcrS09LY0Y0U2VWTkR5bWJHRHE4?=
 =?utf-8?B?SUNPQXNPWUkyRFFiS21TZGVSa2E0eHZORnhtblJETEQwNEZtRGRhazFpcE1W?=
 =?utf-8?B?Q1B5aFhyamdpOThSYVV4VmtpRXR4dzl4Um5mS2R3cHh6Njl5bVpGd0ZTZEwv?=
 =?utf-8?B?enpmeU5mdFY2VmZucFQ5U0Q5SnRCYmg1NUVYRG9tdUYrMnJXNEt3NjBUNUlS?=
 =?utf-8?B?R3NJb0tMdjJoa0NnQkpadi94bnloTVFiY01vMFVNR1N3ZUhnYm5TUk9tOW5i?=
 =?utf-8?B?L1VTa09tSnZXY1BzU2RadFNSanpxVTZlRHRIK2dzakZWelFCL3dOWFJBVk1U?=
 =?utf-8?B?UG1OeHBjeDVFaUFITE40dFNzK0FwOWlmN0VvRi90MlFlQUs2cFBZY2JOOUdP?=
 =?utf-8?B?ZGQxRzBLYUt0ZnN3R1V1KzdjWERRS3pDcWtUaWJ0QVJGUTdDaDZ5YVdKS3Z4?=
 =?utf-8?B?TytWLzdxM3MzQnFoeC9zZ0FaSTVjTGtZNXVMUDdnYUg1N2NpVE5kd1g4Mlg4?=
 =?utf-8?B?bWh6R2FpbUxzRnlTT0JpVGRxUitldngrZzlCZWp0bUcxUE5zeDVPQ0NURFBW?=
 =?utf-8?B?YTlla01XZ1ZiQUFtWDNRbERwRzVxeGZtNEhqZVVUOWE0alEvNmhRdE8xUmtQ?=
 =?utf-8?B?WFo1QkRrdWgrcnVLOW1WVXdYL1prT25HL0RSOG95bE5OMkRVemErcXFPaUxk?=
 =?utf-8?B?Rk9vdTd0OHZHMFMvUk9yS21CK1hLMTN5NjNBL0xldzNkR25qbmxNY3BqODlT?=
 =?utf-8?B?T1A1ZVJvT2Uxd2I5NGVGbXNKTHVBQ3RSdjhoN2NwYi9kUHYyazROWHNmTmxU?=
 =?utf-8?B?YjRTaXpNOTA1b0U5UEFqMEF0cndIR2pQREtVSmpKM1lQeFVEUGU1c1FTT3l3?=
 =?utf-8?B?anlUWXRwSytvb3czREhQZnFqNHlUMTJjdlJBTHgzU0dnZ3VKL2VDV0dvZHNQ?=
 =?utf-8?B?TEtiRjFNT0ljNlRDVVZaY0hHQ0pTcVBIQW9udy9MZTBXWTU5R2dkSkdiSjIv?=
 =?utf-8?B?bVhFNXhtb1hCSzhyaU95MjdRS1RrK3JXSjdMZkU2NUppbjluV1VhWWJuNVhq?=
 =?utf-8?B?OVFOL2hIWUU2ZUZ1VzZIcDBtamlZWE9zTU1lVDlqYWRCb0hHREYxaDZnVTZz?=
 =?utf-8?B?cG5vK0ducXJteXdRQXhoYmsvTDJQbzJqQnF5OTJyMjVlcmJyNytkWENON1Vt?=
 =?utf-8?B?WWdxOFhhQ3pOZ1ZtbksxQ1RJSnR1TjM0RzhRVUtGd0hRRUpLc2xRZGhTOGI5?=
 =?utf-8?B?c045bVZVeDFsRk5xQTVZRExSMkc2cEJjeS82d2ZlLzVJMzdSU1BkM2lGa2FB?=
 =?utf-8?B?MmxuSTBQUkN3aFl4ejdlMG5GbnJxdnBDYkUrVzdNcEFCVk1oQ0NwNjB0aWVX?=
 =?utf-8?Q?Sef0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7312c9-7faf-41ef-340d-08ddbad2a8a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 08:13:29.1322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YrgRX+fYZqnBSDiuXbjz6B26QigI2r1lQsZiEP96DGzXAp8zFWNW85k+MbP6rFEZQlC99LrHuyCjZCXaujfg2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUg
NjowOCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50aG9u
eS5wZXJhcmRAdmF0ZXMudGVjaD47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IEFu
ZHJldw0KPiBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBPcnplbCwgTWljaGFs
IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47DQo+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFN0ZWZhbm8NCj4gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDE0LzE4XSB4ZW4vY3B1ZnJlcTogaW50
cm9kdWNlIEdFVF9DUFVGUkVRX0NQUEMgc3ViLQ0KPiBjbWQNCj4NCj4gT24gMjcuMDUuMjAyNSAx
MDo0OCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEvdG9vbHMvbWlzYy94ZW5wbS5jDQo+
ID4gKysrIGIvdG9vbHMvbWlzYy94ZW5wbS5jDQo+ID4gQEAgLTY5LDYgKzY5LDcgQEAgdm9pZCBz
aG93X2hlbHAodm9pZCkNCj4gPiAgICAgICAgICAgICAgIiBzZXQtbWF4LWNzdGF0ZSAgICAgICAg
PG51bT58J3VubGltaXRlZCcgWzxudW0yPnwndW5saW1pdGVkJ11cbiINCj4gPiAgICAgICAgICAg
ICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXQgdGhlIEMtU3RhdGUg
bGltaXRhdGlvbiAoPG51bT4gPj0gMCkgYW5kXG4iDQo+ID4gICAgICAgICAgICAgICIgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9uYWxseSB0aGUgQy1zdWItc3RhdGUg
bGltaXRhdGlvbg0KPiAoPG51bTI+ID49IDApXG4iDQo+ID4gKyAgICAgICAgICAgICIgZ2V0LWNw
dWZyZXEtY3BwYyAgICAgIFtjcHVpZF0gICAgICAgbGlzdCBjcHUgY3BwYyBwYXJhbWV0ZXIgb2Yg
Q1BVDQo+IDxjcHVpZD4gb3IgYWxsXG4iDQo+ID4gICAgICAgICAgICAgICIgc2V0LWNwdWZyZXEt
Y3BwYyAgICAgIFtjcHVpZF0gW2JhbGFuY2V8cGVyZm9ybWFuY2V8cG93ZXJzYXZlXQ0KPiA8cGFy
YW06dmFsPipcbiINCj4gPiAgICAgICAgICAgICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzZXQgSGFyZHdhcmUgUC1TdGF0ZSAoSFdQKSBwYXJhbWV0ZXJzXG4iDQo+ID4g
ICAgICAgICAgICAgICIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb24gQ1BV
IDxjcHVpZD4gb3IgYWxsIGlmIG9taXR0ZWQuXG4iDQo+ID4gQEAgLTgxMiwzMyArODEzLDcgQEAg
c3RhdGljIHZvaWQgcHJpbnRfY3B1ZnJlcV9wYXJhKGludCBjcHVpZCwgc3RydWN0DQo+ID4geGNf
Z2V0X2NwdWZyZXFfcGFyYSAqcF9jcHVmcmVxKQ0KPiA+DQo+ID4gICAgICBwcmludGYoInNjYWxp
bmdfZHJpdmVyICAgICAgIDogJXNcbiIsIHBfY3B1ZnJlcS0+c2NhbGluZ19kcml2ZXIpOw0KPiA+
DQo+ID4gLSAgICBpZiAoIGh3cCApDQo+ID4gLSAgICB7DQo+ID4gLSAgICAgICAgY29uc3QgeGNf
Y3BwY19wYXJhX3QgKmNwcGMgPSAmcF9jcHVmcmVxLT51LmNwcGNfcGFyYTsNCj4gPiAtDQo+ID4g
LSAgICAgICAgcHJpbnRmKCJjcHBjIHZhcmlhYmxlcyAgICAgICA6XG4iKTsNCj4gPiAtICAgICAg
ICBwcmludGYoIiAgaGFyZHdhcmUgbGltaXRzICAgIDogbG93ZXN0IFslIlBSSXUzMiJdIGxvd2Vz
dCBub25saW5lYXINCj4gWyUiUFJJdTMyIl1cbiIsDQo+ID4gLSAgICAgICAgICAgICAgIGNwcGMt
Pmxvd2VzdCwgY3BwYy0+bG93ZXN0X25vbmxpbmVhcik7DQo+ID4gLSAgICAgICAgcHJpbnRmKCIg
ICAgICAgICAgICAgICAgICAgICA6IG5vbWluYWwgWyUiUFJJdTMyIl0gaGlnaGVzdCBbJSJQUkl1
MzIiXVxuIiwNCj4gPiAtICAgICAgICAgICAgICAgY3BwYy0+bm9taW5hbCwgY3BwYy0+aGlnaGVz
dCk7DQo+ID4gLSAgICAgICAgcHJpbnRmKCIgIGNvbmZpZ3VyZWQgbGltaXRzICA6IG1pbiBbJSJQ
Ukl1MzIiXSBtYXggWyUiUFJJdTMyIl0gZW5lcmd5IHBlcmYNCj4gWyUiUFJJdTMyIl1cbiIsDQo+
ID4gLSAgICAgICAgICAgICAgIGNwcGMtPm1pbmltdW0sIGNwcGMtPm1heGltdW0sIGNwcGMtPmVu
ZXJneV9wZXJmKTsNCj4gPiAtDQo+ID4gLSAgICAgICAgaWYgKCBjcHBjLT5mZWF0dXJlcyAmIFhF
Tl9TWVNDVExfQ1BQQ19GRUFUX0FDVF9XSU5ET1cgKQ0KPiA+IC0gICAgICAgIHsNCj4gPiAtICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGFjdGl2aXR5X3dpbmRvdzsNCj4gPiAtICAgICAgICAgICAg
Y29uc3QgY2hhciAqdW5pdHM7DQo+ID4gLQ0KPiA+IC0gICAgICAgICAgICBhY3Rpdml0eV93aW5k
b3cgPSBjYWxjdWxhdGVfYWN0aXZpdHlfd2luZG93KGNwcGMsICZ1bml0cyk7DQo+ID4gLSAgICAg
ICAgICAgIHByaW50ZigiICAgICAgICAgICAgICAgICAgICAgOiBhY3Rpdml0eV93aW5kb3cgWyUi
UFJJdTMyIiAlc11cbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICBhY3Rpdml0eV93aW5kb3cs
IHVuaXRzKTsNCj4gPiAtICAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgICAgIHByaW50ZigiICAg
ICAgICAgICAgICAgICAgICAgOiBkZXNpcmVkIFslIlBSSXUzMiIlc11cbiIsDQo+ID4gLSAgICAg
ICAgICAgICAgIGNwcGMtPmRlc2lyZWQsDQo+ID4gLSAgICAgICAgICAgICAgIGNwcGMtPmRlc2ly
ZWQgPyAiIiA6ICIgaHcgYXV0b25vbW91cyIpOw0KPiA+IC0gICAgfQ0KPiA+IC0gICAgZWxzZQ0K
PiA+ICsgICAgaWYgKCAhaHdwICkNCj4gPiAgICAgIHsNCj4gPiAgICAgICAgICBpZiAoIHBfY3B1
ZnJlcS0+Z292X251bSApDQo+ID4gICAgICAgICAgICAgIHByaW50Zigic2NhbGluZ19hdmFpbF9n
b3YgICAgOiAlc1xuIiwNCj4NCj4gSSdtIG5vdCBzdXJlIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGFs
dGVyIHdoYXQgaXMgYmVpbmcgb3V0cHV0IGZvciBnZXQtY3B1ZnJlcS1wYXJhLg0KPiBQZW9wbGUg
bWF5IHNpbXBseSBtaXNzIHRoYXQgb3V0cHV0IHRoZW4sIHdpdGhvdXQgaGF2aW5nIGFueSBpbmRp
Y2F0aW9uIHdoZXJlIGl0DQo+IHdlbnQuDQoNCkh3cCBpcyBtb3JlIGxpa2UgYW1kLWNwcGMgaW4g
YWN0aXZlIG1vZGUuIEl0IGFsc28gZG9lcyBub3QgcmVseSBvbiBYZW4gZ292ZXJub3IgdG8gZG8g
cGVyZm9ybWFuY2UgdHVuaW5nLCBzbyBpbiBwcmV2aW91cyBkZXNpZ24sIHdlIGNvdWxkIGJvcnJv
dyBnb3Zlcm5vciBmaWxlZCB0byBvdXRwdXQgY3BwYyBpbmZvDQpIb3dldmVyIGFmdGVyIGludHJv
ZHVjaW5nIGFtZC1jcHBjIHBhc3NpdmUgbW9kZSwgd2UgaGF2ZSByZXF1ZXN0IHRvIG91dHB1dCBi
b3RoIGdvdmVybm9yIGFuZCBDUFBDIGluZm8uIEFuZCBpZiBjb250aW51aW5nIGV4cGFuZGluZyBn
ZXQtY3B1ZnJlcS1wYXJhIHRvIGluY2x1ZGUgQ1BQQyBpbmZvLCBpdCB3aWxsIG1ha2UgdGhlIHBh
cmVudCBzdHVjdCB4ZW5fc3lzY3RsLnUgZXhjZWVkIGV4Y2VlZCAxMjggYnl0ZXMuIFNvIEknbSBs
ZWZ0IHRvIGNyZWF0ZSBhIG5ldyBzdWJjbWQgdG8gc3BlY2lmaWNhbGx5IGRlYWwgd2l0aCBDUFBD
IGluZm8NCkkgY291bGQgbGVhdmUgYWJvdmUgb3V0cHV0IGZvciBnZXQtY3B1ZnJlcS1wYXJhIHVu
Y2hhbmdlZC4gVGhlbiB3ZSB3aWxsIGhhdmUgZHVwbGljYXRlIENQUEMgaW5mbyBpbiB0d28gY29t
bWFuZHMuIE9yIGlzIGl0IGZpbmUgdG8gZG8gdGhhdD8NCg0KPg0KPg0KPiBKYW4NCg==

