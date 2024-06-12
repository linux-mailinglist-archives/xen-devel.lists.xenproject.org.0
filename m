Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416189050EE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 12:55:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739196.1146170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLdU-0000yc-AJ; Wed, 12 Jun 2024 10:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739196.1146170; Wed, 12 Jun 2024 10:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHLdU-0000wE-7e; Wed, 12 Jun 2024 10:55:24 +0000
Received: by outflank-mailman (input) for mailman id 739196;
 Wed, 12 Jun 2024 10:55:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAc7=NO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sHLdS-0000vz-UJ
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 10:55:23 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f960f6-28aa-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 12:55:20 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Wed, 12 Jun
 2024 10:55:15 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 10:55:14 +0000
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
X-Inumbo-ID: 41f960f6-28aa-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKCnIN2XqW6IUPnL8GCczhwFeayFDfHYorGKGSGZDF9S7qW6S0JK66gZgjlFtVivLTQ+MJhx4RomAyLqSHUOo3SdoeGFUTNbOPWGKk69txfF5RhRFkI4IJGs5ZtutqC/favhH3DNZYfCCuAn9DHcAuJ5rY9UsUuFdk/jNQFmfsy703UW2DR8ys4OwWC2UHVbPBJnchjqoA+SQLoKDHiNvqw8HvTT+ZWpZOGbS2o/VU5fjrBYcd9KDTgcIxDevk4ckfq6B5tgCYW+0EcFATELYOJ8O5DC9X9KvNoVasRa157c1+Qrd+lTJmvtGRBoq6ST+WMG6q5j+5fkoy2A/Jfx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lmlbwjIzoh+1fOGTk+gBrxq5g3NNwL8TlImwiNgls8=;
 b=BeJVWgMO8VYYoMvz2m0znrm3X71yd1I/SbMsbtyT64q9AzSPMDjRw3o4IoBeUVw9jrI5sjUgjpumTuoWATraInKw818L14QrBQi97by0/fxkHIlZxD/u9xXA31Soi7YMrOM6eXCzS6r8IF8ey3gZG/e94he+5gl7dZFz8ACDE7ngEFtxlflRAzK23oc01ijH3lT7HzIV/8U2W7NIn4j4VySZFqVWkDOe8N6M3W/UELGSylwNA4FlpkWvRbdxuRLYU5jb06yz7DynTRS71JRLHj3Zr3DQ3aVVIyMVNd8h9utcqFNbqTbW8+gXZPLVKccej7UzR1eoTzX/Gav/gCqB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lmlbwjIzoh+1fOGTk+gBrxq5g3NNwL8TlImwiNgls8=;
 b=MiWSKpuiQkADDxi1RbThbPAUgeT9N90us7xPASx74a9h8t6+HzLFrp5vyJrDUccaXiRrD/GloFReOLN+q2XmWGSirxujLgn8dIUpWbGZdCc/l0wTyEg3oXcf0JN32mTiBq10oCvNu0+bZY73kT87ehAtRhZHeC1ryskVvEbj34A=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Topic: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
Thread-Index: AQHauLJn3FT0TCW9KkmRq1iRWqwBt7HCqQ8AgAG9m4D//5AdgIAAiWiA
Date: Wed, 12 Jun 2024 10:55:14 +0000
Message-ID:
 <BL1PR12MB5849652CE3039C8D17CD7FA6E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
 <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
 <BL1PR12MB5849FF595AEED1112622A98DE7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
In-Reply-To: <c2a5b9cd-2a85-4e01-8b8b-31b85726dbd4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7633.034)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BY5PR12MB4194:EE_
x-ms-office365-filtering-correlation-id: 8870a766-651d-4bfe-8441-08dc8ace23c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230032|1800799016|366008|376006|7416006|38070700010;
x-microsoft-antispam-message-info:
 =?utf-8?B?emZKOTE0K3l5a2lFMGZYNEtiSSs1eTgrc0lyWWlLelM4ckRtVExlOEJucVBE?=
 =?utf-8?B?VkRsYjhrS1JpV1JqSis3clF2SHZoNTFjNTh1MlJYR2pXQXlkWkppaWtXMHZL?=
 =?utf-8?B?djlMbXBDbjIrMndZUmFmeFNLUFowMlFsSTVtazczSlNIb2k2UlZBcXlKcVpk?=
 =?utf-8?B?cHNEb3NLL0dJRkpzcDIvY0xNdTIyMU1TbHV2cW8vZzJCdWJoc0N3Z3NCTzl0?=
 =?utf-8?B?aFdmNUVCQWh5bGh6RUlOY0poSFBYTnZlMjFMdi8xelV0NUJyck5Gekx3cFdh?=
 =?utf-8?B?QzBkOEJLWG9VSXZNaHh6UlFsRTZ6Qm44Vk1DV3ZBa2t0R2VlV2FzTHAxaC9w?=
 =?utf-8?B?eTBoUzMwMEpUMVE1ZWJ2YVVsN3dzRzFvY0dZc2ZTaGgrajl4OXBxZHJEMWR0?=
 =?utf-8?B?NnJObHdtaXRxeTRrZG1jSEZ5cXA4VlpSSmM4T0hLQWJGWGJOclh3V2tnTjFj?=
 =?utf-8?B?b3JKS0xxU3ZYclJHSDM3QVVITS9udGhWei8zYytDQ1ZtNUdpZVkrcXpZV0ZM?=
 =?utf-8?B?VVA4Um95YzlJdHFkUENFRWVHWDFTMEpEUzZUVDVqL2NmRHF4YUNYdFdNNWZq?=
 =?utf-8?B?YkpCSGNMM0pkNHRVTlRPbHVrekRVWWIzckkrbVBqdEgwWUxYdWl2NHhTZGZC?=
 =?utf-8?B?K1lFK0JKOHd0M0k1ZnNkaDdsNS9wWG54UzJpQm1TaWljVVVDOVl2RGEwQnVQ?=
 =?utf-8?B?ME9SSGxsZ1l3WVlIdi8zK1hWekZYQW53ZUVUUkhFRmdUUTcwUHVha0JZOGhW?=
 =?utf-8?B?UXF1NkhuZ09LbVFOeXdjTzJ0dDdscDFsUWdDMmRURk5BdHFOdzlOUDdiNnJG?=
 =?utf-8?B?TCsyQnRsZlcyK3RNMmRTKzN3WlNzWGlUcm94TWJ1TWZtWTZ1eWNDWnZwN0Ny?=
 =?utf-8?B?U2l0bU5ZMGlTaUhob3pwU2JrTGxWSlk4ajBBU2YyMjNpQTZNRXRwdjFKdmZZ?=
 =?utf-8?B?Mm9BUE15UnJFV2RaOXVFQVFDR3FJNi85UXhOMDVrWU5rb0RqL0Yrd3hDRTJE?=
 =?utf-8?B?eEpRaUV0TTQwVk9RV29wUkI0NlJnVWIzNFE5NTNrdGw2OVJldTBjWWJCWW4r?=
 =?utf-8?B?WnRSSnpQRmEyZzk3OW1DZnFGcEthaFMyTkhtaTBUdFVNUVhqRSs2WXI1NC9w?=
 =?utf-8?B?RGdaVk9UOHR6SncvNHJNOXJEWkR6ZnF4d2dMRHZaLzhoWDQ4OHpId3JQN253?=
 =?utf-8?B?NTZtVnFNcXlocHFRRjhKaVlFc3BNWWNwUmEwQ3BOWGttQ1pJVjJZaHlFS3l4?=
 =?utf-8?B?NXh6UWNReWtwTG1ndzQ2aDUvQkdsZ2dCbWxYcWpGRWZpd3M0aGJCUWVNWVdC?=
 =?utf-8?B?TEN6MGRuYkM3YVFBVFNyVTNYQjFCRE5tU2luUmlHSERxSFJEZjhLRVdTS2pm?=
 =?utf-8?B?allsL1NWNmFQaTc1N3lsd01DTEpqWFhEdTVpWHpDbnErYjVvcHBDcVU3Vysz?=
 =?utf-8?B?VTZrN1ZZb3o4eExwN2xWaWVWUWduWnY2TnpQM0VVLzkrSDE3Zy9ITXRMR1BE?=
 =?utf-8?B?MFBEWkxRb3V2ZG80aXZ3dXZNKzdheGlNbVdvOUJyelNqZFF3V1VHWWVYSFk4?=
 =?utf-8?B?ZXZxNDYzU3FnMGF1R3lGdENwZW45eU44MW5ZcEpBYjZNNTczdEF0aGRSV013?=
 =?utf-8?B?UW1nSEs4ZDZTVzJnRExLYVFpbXRTOVZhcnRXa3JHc3JsVExBc2xBNjdtb0pY?=
 =?utf-8?B?UndPcWdGd0VVeEk5OXh5TVpNWXJWRnFIWGx0N254b1lFOGljcmRWSmFEWUNJ?=
 =?utf-8?B?QUY2N1liYkcwVklTbklWWkVnY0NRUi9sVXM4WjN2YzN0M0dYZ2hwVmFhSEVn?=
 =?utf-8?Q?1MliGRA9NBOXNh101ctM3tKlbV0+tdk5L/81c=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(7416006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHo4anRRTXFiMGd6Q2RrZ3VnVHpWTVNQL3A2SXB3akREa3dVQnZ3LzBmWWQv?=
 =?utf-8?B?eENKWGx6bW5KOFMrMHl0aGp5WVV6eW1xRDNWNytJNTVOVnltYmVIR09CSnl4?=
 =?utf-8?B?UG9XSjRnWGFwdTNSb1ZYMUJLTkt1WHFCMjZjN2M1ZEFvS1lFbUR5MStuZ3Q5?=
 =?utf-8?B?V0xYNEFManVUYWZlc1EwYUZidHRUZUVZaC9Kd3MzQ0paWDYwVFZmekhCZUow?=
 =?utf-8?B?Q2RpWmZZYmhNSlR1OXJ3RUxoSHRzTXNBMVBuWS9LWEpLQlRQR3J3YncrdmhU?=
 =?utf-8?B?cU1wTVRmVzE0WWhabkFLRWRoZi82Rk0vemQ3d0dtWGhOamhRL1A3SjVmTzUx?=
 =?utf-8?B?aDQyMU1ZQThKUFZUclFUZTQySnp6RXlnZHdZb1pWYXBMWnR6b0RYbENtejNj?=
 =?utf-8?B?bGN5TXEraytMY05yQ0grbW9xSWJKVWtKa3pScC9DQlRYNU9CRDhKUGZMbnVt?=
 =?utf-8?B?MmtVS05lcHVGY081VGtNWGI3MDdHU29xVHNyaGd4THNiWkN1dEFBV3paMVFm?=
 =?utf-8?B?cU9sNklGRVA3Ym42VUVNQ3RDdnNlNTIzb0FNcnkxMkY1RVFGQkJoK1k5YmhD?=
 =?utf-8?B?cFJSR1pDZ3R2S3M5WFc4bUh6V0wySVVWb1liZjlwVUkreUpqOXBxYk13T1da?=
 =?utf-8?B?UkMvOXVYcFhvWjFEazB6UGdPVTZqQ3JHUzhkUUJYNFhRbkx6c2tWQWpxWDd5?=
 =?utf-8?B?R3A2VmMxMzluS3N2UDNlOVJIZXNSb0hVbU50SFkzN2w5ZjNUdTBUUUdsMzdH?=
 =?utf-8?B?NXJWcHVpdFZqTWFNNWc4MW9IdUJLVW9Pc0RldGsrankvM0VRTGdSazNwd2Vo?=
 =?utf-8?B?dmtDNW51SStKOS85SzR0c2lMeUJDUTBaeWNJZEFpelFZMjJmWFh6VWh6eFRl?=
 =?utf-8?B?UTY1K2EwNmFQOE9VUEo4L1BBVEFpZHc3cTZBRlNYbWtOWnhEMzB1SzA4Z29N?=
 =?utf-8?B?YVNpdE1jYTdKMkJmZnQ4aW9jODFRUThIVWRzdWhPcExDMVhrckdmSWw2Uklz?=
 =?utf-8?B?eTVOdG9sRVJnckVGZVdhbk9ycnJBU3JHSVhVRitQYUp0cGJ6UEV1KzFaeHRr?=
 =?utf-8?B?ZmJ5U1p5N29aZjkrVFk0eDV4NFAzVDJTeElBUmZLWnBTekc3YTJhL1doc2ky?=
 =?utf-8?B?bktKWUVFVWJjTG1wcVZJWDlKcXVtVnJrUlNDZm0wb09wYUVaUXZ6WCtiMnpF?=
 =?utf-8?B?OHhpU3o4amR1dXhTRTNZdHh0RUIremVTMHRzVEdJR1JucUR3UDZmdHBzWnJ0?=
 =?utf-8?B?akUyam9zYlZ0YkFmSzIzdWtZVzY4aFR1UG00N1hsUmlaVVZlRXk2MWFHdzBx?=
 =?utf-8?B?UmNYd1ozYWhVZzlTaE1tZ3hsMlJxMEYzdzJ4N0VPUnlDWlV5cHZ0TlQvRUly?=
 =?utf-8?B?aUt2U0xsSmxubWpmK0sxcVdiQ2E5MWxzbnJhZGZSZWNQUGdONlFBRUl6cTEy?=
 =?utf-8?B?aFQ4anFFeU9yZUhwTWlla1Z3VzA0aitraytkQXpoZFdudDAvRmc5Mk1PYUtw?=
 =?utf-8?B?VEFtUXgzYlRwYnk0dlRYeTBSNExXQkdyS0wzVytzNFA0TFhTektGNnpocUxT?=
 =?utf-8?B?clNqYk9wU1F6SmlsbGxaeHltUWJ4ZTJlRTRQRUhmbzV3eE50Z1lvT2Y5YVUz?=
 =?utf-8?B?bStzclZqMi9LSG96NjVJeGxCR2NKc3IyNVRRSmFDQldRMHVyMkpqYVBEbnVC?=
 =?utf-8?B?ZWhsNjBjMERSQnltNER3R2lqNTkvOUtpcGQyd1R3OFNSUXdLOUdUMHdLWC9V?=
 =?utf-8?B?bTNUZEV1VFZIRC9zVGVreVhkM1pHMFZGdHN4cEwyUmhmMGkrellVSm5JS293?=
 =?utf-8?B?ZXc4djlkM1EwelhhSjZqcEdNNm9SUGx3K29QTEFHMnVnaUpMWmRMLzVPaTFX?=
 =?utf-8?B?OWgxdHlSTmt5bmNvdk9qVXFXdkd3NEw1WFdjQmVIaE9NVEdGSXJNczlYZ01h?=
 =?utf-8?B?OTZrMC9ob1UrR29KZGN2b2QzYmQvRHgwUW9pNUxLRGNNK0Q2YlltdTNXUmlT?=
 =?utf-8?B?bk5UMW1UYlF0di9wVVowcm9xdkZnWlgybVllWk9pSXdITVRJZE1ZY2dyTDR3?=
 =?utf-8?B?UHhnRzZha2hEZzdGdHd3ZGdxVTdoeURvaXpFN0Y2ZVBZSEFCRTRVNHNvRDZk?=
 =?utf-8?Q?k2q4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0314608A686E3418F08E7F596D77606@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8870a766-651d-4bfe-8441-08dc8ace23c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 10:55:14.7720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yVj97751tn4lLMDkS/mrpj+kVrZ8Z/RvMGt7zL3cPPsm6D+fBgAjXX6NN6RduC9hC9vgEl0z1HwO0K0zINCljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194

T24gMjAyNC82LzEyIDE4OjM0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTIuMDYuMjAyNCAx
MjoxMiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC82LzExIDIyOjM5LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAwNy4wNi4yMDI0IDEwOjExLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gU29tZSB0eXBlIG9mIGRvbWFpbiBkb24ndCBoYXZlIFBJUlEsIGxpa2UgUFZILCBpdCBk
byBub3QgZG8NCj4+Pj4gUEhZU0RFVk9QX21hcF9waXJxIGZvciBlYWNoIGdzaS4gV2hlbiBwYXNz
dGhyb3VnaCBhIGRldmljZQ0KPj4+PiB0byBndWVzdCBvbiBQVkggZG9tMCwgY2FsbHN0YWNrDQo+
Pj4+IHBjaV9hZGRfZG1fZG9uZS0+WEVOX0RPTUNUTF9pcnFfcGVybWlzc2lvbiB3aWxsIGZhaWxl
ZCBhdA0KPj4+PiBkb21haW5fcGlycV90b19pcnEsIGJlY2F1c2UgUFZIIGhhcyBubyBtYXBwaW5n
IG9mIGdzaSwgcGlycQ0KPj4+PiBhbmQgaXJxIG9uIFhlbiBzaWRlLg0KPj4+DQo+Pj4gQWxsIG9m
IHRoaXMgaXMsIHRvIG1lIGF0IGxlYXN0LCBpbiBwcmV0dHkgc2hhcnAgY29udHJhZGljdGlvbiB0
byB3aGF0DQo+Pj4gcGF0Y2ggMiBzYXlzIGFuZCBkb2VzLiBJT1c6IERvIHdlIHdhbnQgdGhlIGNv
bmNlcHQgb2YgcElSUSBpbiBQVkgsIG9yDQo+Pj4gZG8gd2Ugd2FudCB0byBrZWVwIHRoYXQgdG8g
UFY/DQo+PiBJdCdzIG5vdCBjb250cmFkaWN0b3J5Lg0KPj4gV2hhdCBJIGRpZCBpcyBub3QgdG8g
YWRkIHRoZSBjb25jZXB0IG9mIFBJUlFzIGZvciBQVkguDQo+IA0KPiBBZnRlciB5b3VyIGZ1cnRo
ZXIgZXhwbGFuYXRpb25zIG9uIHBhdGNoIDIgLSB5ZXMsIEkgc2VlIG5vdy4gQnV0IGluIHBhcnRp
Y3VsYXINCj4gdGhlcmUgaXQgbmVlZHMgbWFraW5nIG1vcmUgY2xlYXIgd2hhdCBjYXNlIGl0IGlz
IHRoYXQgaXMgYmVpbmcgZW5hYmxlZCBieSB0aGUNCj4gY2hhbmdlcy4NCk9LLCBJIHdpbGwgYWRk
IHNvbWUgZGVzY3JpcHRpb25zIGluIG5leHQgdmVyc2lvbi4NCg0KPiANCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
SmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4NCj4+PiBBIHByb2JsZW0gdGhy
b3VnaG91dCB0aGUgc2VyaWVzIGFzIGl0IHNlZW1zOiBXaG8ncyB0aGUgYXV0aG9yIG9mIHRoZXNl
DQo+Pj4gcGF0Y2hlcz8gVGhlcmUncyBubyBGcm9tOiBzYXlpbmcgaXQncyBub3QgeW91LCBidXQg
eW91ciBTLW8tYiBhbHNvDQo+Pj4gaXNuJ3QgZmlyc3QuDQo+PiBTbyBJIG5lZWQgdG8gY2hhbmdl
IHRvOg0KPj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+
IG1lYW5zIEkgYW0gdGhlIGF1dGhvci4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+IG1lYW5zIFJ1aSBzZW50IHRoZW0gdG8gdXBzdHJlYW0gZmlyc3RseS4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPiBtZWFu
cyBJIHRha2UgY29udGludWUgdG8gdXBzdHJlYW0uDQo+IA0KPiBJIGd1ZXNzIHNvLCB5ZXMuDQpU
aGFua3MuDQoNCj4gDQo+Pj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+
Pj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYw0KPj4+PiBAQCAtMTQxMiw2ICsx
NDEyLDM3IEBAIHN0YXRpYyBib29sIHBjaV9zdXBwX2xlZ2FjeV9pcnEodm9pZCkNCj4+Pj4gICNk
ZWZpbmUgUENJX1NCREYoc2VnLCBidXMsIGRldmZuKSBcDQo+Pj4+ICAgICAgICAgICAgICAoKCgo
dWludDMyX3QpKHNlZykpIDw8IDE2KSB8IChQQ0lfREVWSUQoYnVzLCBkZXZmbikpKQ0KPj4+PiAg
DQo+Pj4+ICtzdGF0aWMgaW50IHBjaV9kZXZpY2Vfc2V0X2dzaShsaWJ4bF9jdHggKmN0eCwNCj4+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWlkIGRvbWlkLA0KPj4+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpLA0K
Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBtYXAsDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKmdzaV9iYWNrKQ0KPj4+PiArew0KPj4+PiAr
ICAgIGludCByLCBnc2ksIHBpcnE7DQo+Pj4+ICsgICAgdWludDMyX3Qgc2JkZjsNCj4+Pj4gKw0K
Pj4+PiArICAgIHNiZGYgPSBQQ0lfU0JERihwY2ktPmRvbWFpbiwgcGNpLT5idXMsIChQQ0lfREVW
Rk4ocGNpLT5kZXYsIHBjaS0+ZnVuYykpKTsNCj4+Pj4gKyAgICByID0geGNfcGh5c2Rldl9nc2lf
ZnJvbV9kZXYoY3R4LT54Y2gsIHNiZGYpOw0KPj4+PiArICAgICpnc2lfYmFjayA9IHI7DQo+Pj4+
ICsgICAgaWYgKHIgPCAwKQ0KPj4+PiArICAgICAgICByZXR1cm4gcjsNCj4+Pj4gKw0KPj4+PiAr
ICAgIGdzaSA9IHI7DQo+Pj4+ICsgICAgcGlycSA9IHI7DQo+Pj4NCj4+PiByIGlzIGEgR1NJIGFz
IHBlciBhYm92ZTsgd2h5IHdvdWxkIHlvdSBzdG9yZSBzdWNoIGluIGEgdmFyaWFibGUgbmFtZWQg
cGlycT8NCj4+PiBBbmQgaG93IGNhbiAuLi4NCj4+Pg0KPj4+PiArICAgIGlmIChtYXApDQo+Pj4+
ICsgICAgICAgIHIgPSB4Y19waHlzZGV2X21hcF9waXJxKGN0eC0+eGNoLCBkb21pZCwgZ3NpLCAm
cGlycSk7DQo+Pj4+ICsgICAgZWxzZQ0KPj4+PiArICAgICAgICByID0geGNfcGh5c2Rldl91bm1h
cF9waXJxKGN0eC0+eGNoLCBkb21pZCwgcGlycSk7DQo+Pj4NCj4+PiAuLi4gdGhhdCB2YWx1ZSBi
ZSB0aGUgY29ycmVjdCBvbmUgdG8gcGFzcyBpbnRvIGhlcmU/IEluIGZhY3QsIHRoZSBwSVJRIG51
bWJlcg0KPj4+IHlvdSBvYnRhaW4gYWJvdmUgaW4gdGhlICJtYXAiIGNhc2UgaXNuJ3QgaGFuZGVk
IHRvIHRoZSBjYWxsZXIsIGkuZS4gaXQgaXMNCj4+PiBlZmZlY3RpdmVseSBsb3N0LiBZZXQgdGhh
dCdzIHdoYXQgd291bGQgbmVlZCBwYXNzaW5nIGludG8gc3VjaCBhbiB1bm1hcCBjYWxsLg0KPj4g
WWVzIHIgaXMgR1NJIGFuZCBJIGtub3cgcGlycSB3aWxsIGJlIHJlcGxhY2VkIGJ5IHhjX3BoeXNk
ZXZfbWFwX3BpcnEuDQo+PiBXaGF0IEkgZG8gInBpcnEgPSByIiBpcyBmb3IgeGNfcGh5c2Rldl91
bm1hcF9waXJxLCB1bm1hcCBuZWVkIHBhc3NpbmcgaW4gcGlycSwNCj4+IGFuZCB0aGUgbnVtYmVy
IG9mIHBpcnEgaXMgYWx3YXlzIGVxdWFsIHRvIGdzaS4NCj4gDQo+IFdoeSB3b3VsZCB0aGF0IGJl
PyBwSVJRIGlzIHB1cmVseSBhIHNvZnR3YXJlIGNvbnN0cnVjdCAob2YgWGVuJ3MpLCBJDQo+IGRv
bid0IHRoaW5rIHRoZXJlJ3MgYW55IGd1YXJhbnRlZSB3aGF0c29ldmVyIG9uIHRoZSBudW1iZXJp
bmcuIEFuZCBldmVuDQo+IGlmIHRoZXJlIHdhcyAoZm9yIGUuZy4gbm9uLU1TSSBvbmVzKSwgaXQg
d291bGQgYmUgcElSUSA9PSBJUlEuIEFuZCByZWNhbGwNCj4gdGhhdCBlbHNld2hlcmUgSSB0aGlu
ayBJIG1lYW53aGlsZSBzdWNjZWVkZWQgaW4gZXhwbGFpbmluZyB0byB5b3UgdGhhdA0KPiBJUlEg
IT0gR1NJIChpbiB0aGUgY29tbW9uIGNhc2UsIGV2ZW4gaWYgaW4gbW9zdCBjYXNlcyB0aGV5IG1h
dGNoKS4NCk9LLCB3aWxsIGNoYW5nZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+Pj4+ICsgICAg
aWYgKHIpDQo+Pj4+ICsgICAgICAgIHJldHVybiByOw0KPj4+PiArDQo+Pj4+ICsgICAgciA9IHhj
X2RvbWFpbl9nc2lfcGVybWlzc2lvbihjdHgtPnhjaCwgZG9taWQsIGdzaSwgbWFwKTsNCj4+Pg0K
Pj4+IExvb2tpbmcgYXQgdGhlIGh5cGVydmlzb3Igc2lkZSwgdGhpcyB3aWxsIGZhaWwgZm9yIFBW
IERvbTAuIEluIHdoaWNoIGNhc2UgaW1vDQo+Pj4geW91IGJldHRlciB3b3VsZCBhdm9pZCBtYWtp
bmcgdGhlIGNhbGwgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPj4gWWVzLCBmb3IgUFYgZG9tMCwgdGhl
IGVycm5vIGlzIEVPUE5PVFNVUFAsIHRoZW4gaXQgd2lsbCBkbyBiZWxvdyB4Y19kb21haW5faXJx
X3Blcm1pc3Npb24uDQo+IA0KPiBIZW5jZSB3aHkgY2FsbCB4Y19kb21haW5fZ3NpX3Blcm1pc3Np
b24oKSBhdCBhbGwgb24gYSBQViBEb20wPw0KSXMgdGhlcmUgYSBmdW5jdGlvbiB0byBkaXN0aW5n
dWlzaCB0aGF0IGN1cnJlbnQgZG9tMCBpcyBQViBvciBQVkggZG9tMCBpbiB0b29scy9saWJzPw0K
DQo+IA0KPj4+PiArICAgIGlmIChyICYmIGVycm5vID09IEVPUE5PVFNVUFApDQo+Pj4NCj4+PiBC
ZWZvcmUgaGVyZSB5b3UgZG9uJ3QgcmVhbGx5IG5lZWQgdGhlIHBJUlEgbnVtYmVyOyBpZiBhbGwg
aXQgcmVhbGx5IGlzIG5lZWRlZA0KPj4+IGZvciBpcyAuLi4NCj4+Pg0KPj4+PiArICAgICAgICBy
ID0geGNfZG9tYWluX2lycV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBkb21pZCwgcGlycSwgbWFwKTsN
Cj4+Pg0KPj4+IC4uLiB0aGlzLCB0aGVuIGl0IHByb2JhYmx5IGFsc28gc2hvdWxkIG9ubHkgYmUg
b2J0YWluZWQgd2hlbiBpdCdzIG5lZWRlZC4gWWV0DQo+Pj4gb3ZlcmFsbCB0aGUgaW50ZW50aW9u
cyBoZXJlIGFyZW4ndCBxdWl0ZSBjbGVhciB0byBtZS4NCj4+IEFkZGluZyB0aGUgZnVuY3Rpb24g
cGNpX2RldmljZV9zZXRfZ3NpIGlzIGZvciBQVkggZG9tMCwgd2hpbGUgYWxzbyBlbnN1cmluZyBj
b21wYXRpYmlsaXR5IHdpdGggUFYgZG9tMC4NCj4+IFdoZW4gUFZIIGRvbTAsIGl0IGRvZXMgeGNf
cGh5c2Rldl9tYXBfcGlycSBhbmQgeGNfZG9tYWluX2dzaV9wZXJtaXNzaW9uKG5ldyBoeXBlcmNh
bGwgZm9yIFBWSCBkb20wKQ0KPj4gV2hlbiBQViBkb20wLCBpdCBrZWVwcyB0aGUgc2FtZSBhY3Rp
b25zIGFzIGJlZm9yZSBjb2RlcywgaXQgZG9lcyB4Y19waHlzZGV2X21hcF9waXJxIGFuZCB4Y19k
b21haW5faXJxX3Blcm1pc3Npb24uDQo+IA0KPiBBbmQgd2h5IGRvZXMgUFZIIERvbTAgbmVlZCB0
byBjYWxsIHhjX3BoeXNkZXZfbWFwX3BpcnEoKSwgd2hlbiBpbiB0aGF0IGNhc2UNCj4gdGhlIHBJ
UlEgaXNuJ3QgdXNlZD8NCkkgZGlkbid0IGV4cGVjdCB0aGF0IGludHJvZHVjaW5nIHBjaV9kZXZp
Y2Vfc2V0X2dzaSBjYXVzZXMgc28gbWFueSBjb25mdXNpb25zLg0KSSB3aWxsIHJlbW92ZSBpdCBp
biB0aGUgbmV4dCB2ZXJzaW9uIGFuZCBtYWtlIG1vZGlmaWNhdGlvbnMgZGlyZWN0bHkgaW4gcGNp
X2FkZF9kbV9kb25lLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4g
Q2hlbi4NCg==

