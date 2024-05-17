Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49D8C837F
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 11:30:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723960.1129125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ttc-0007jN-IP; Fri, 17 May 2024 09:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723960.1129125; Fri, 17 May 2024 09:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ttc-0007hg-Fd; Fri, 17 May 2024 09:29:00 +0000
Received: by outflank-mailman (input) for mailman id 723960;
 Fri, 17 May 2024 09:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPUr=MU=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7ttb-0007gt-Kj
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 09:28:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2203afc-142f-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 11:28:57 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 09:28:51 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 09:28:51 +0000
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
X-Inumbo-ID: e2203afc-142f-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs/9wyTk0qOi69I40OuS02bZkkCJbEw8x3fRnAm0Fp8wFmNVLP1x/Q2i7Kkt9zQucgQ5unxitEJ4AFuT9cw6VQCt0PuY0CUel9naT264X55w/wFfL7irAChA6ygiV21MZQEb0T6xKK2onITmlx610cuTSq6B9Q+pfvzjUKExpqlutv4djRHB/xsiwkWjiRp0lr+6iMY9RiChCHweh5OM5FwwBxu/ODpfiKCGAaeqXMMBvTdll39k9iY3209ey5QRTItZd1dafA/9nZUEzAcDat2+R5zRZIlF9i4tAqbWMvyK4fXzOS0KaKYmxFGygaXOe4eHBUMcqiCXKkDug2/e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DRtjy8UEl8ifJ30kOfJdmlhWDEHW6vaTf9cB80QFjbI=;
 b=UMSMAlloqzEq5jD+lsG6LKY4HFUyjG2wotzYExKbYYbZAtMvvfFUWtH9Gozy/cLXQhymD/l1WA3G33e8opI69x52/4hS2jowUKuM/LwALFC67AI3Vi9F3k/2Sdd/g8pj6QCqcUbZZqR2U7gqoe6bln0SoA7lw7W5daULdgUzKsB+sBteWFF0Pl10aK3UrSmoB5TqMYraTqoJbFWxNMQZbKJUTCoVPpLiRUwQvll8+2JzwRCzYhAgExsKsgraZWvPUkFnmXtjmTFupIrmr4EaSe53SOe+4XYSTnm7xCMjyQaZu7Qwy5+Y4xO5KvNICUQJieu/o3l3W5pIr5QOiUGigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRtjy8UEl8ifJ30kOfJdmlhWDEHW6vaTf9cB80QFjbI=;
 b=3kARA8dcJgm46KcjWrrFhu5MsCwftoeH3Z0BmWjUyXqSwKTz5Hvz4Lt8FAnSc6B3WDA6g1xCSWE6mbwD/omoC+B6BN0aLCeopUnm8TnuevjSk+RLwA5MsPVwK4pf+rm2Li5NZRYpa5JKMIqVVGl4KSPKeCvHq3ljvBtBgT/cAYo=
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
Subject: Re: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [XEN PATCH v8 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHap3bYcGtlWtrcpEyRLTK5fjq5SLGZ1UMAgAFwSAD//9GPgIAAlWQA
Date: Fri, 17 May 2024 09:28:51 +0000
Message-ID:
 <BL1PR12MB5849447757191C93B77D19E6E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <20240516095235.64128-2-Jiqian.Chen@amd.com>
 <fb708441-b302-4727-8131-62435a54d99c@suse.com>
 <BL1PR12MB5849FCB53BDAB6968536E5A5E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
In-Reply-To: <cdcbb04d-72e8-4555-a67f-9fd28c5c7743@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7587.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH2PR12MB4133:EE_
x-ms-office365-filtering-correlation-id: d3dec301-32ec-46c8-cc32-08dc7653c353
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|1800799015|366007|7416005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?ejd6WUZaL1FvNWEya2hrWHJaaFdnNCtnV1dvQjFpOW15NEQ5WEt1RFhYa3hl?=
 =?utf-8?B?cXZXNGZMSHlucG9FdFZONCsySEMzaktJYVA5SUZCVTlINjF1eDJpeXRZWEtB?=
 =?utf-8?B?Y2hzYisyUVBMR2ljVXlZZGdZeW4zVlVaK2FwMHI3NkZ3a0dYWG1hdFlMdHly?=
 =?utf-8?B?MWZWemc3Qk5TRWlBN3NzMkYrQ1hvS0VXdWRCNTFSazZxTmRqR2ZSaTFBTnZv?=
 =?utf-8?B?N2tLQkxwRlNkd2xnOFNDTE1yelRrQkduM2w3b3pLQUMzL2pjM2JmMGtrRVhC?=
 =?utf-8?B?Q2prYU5XeEhFT3pjTzJCdWlzd29GaFl4VElyeUd6WlhoRHU1VER5MEkwVUtU?=
 =?utf-8?B?MTdpM1VDNDJFejdRY1pBcHZHRStwWnAvM20xUTQyM2VsYjZ4bWtMelVhZlFX?=
 =?utf-8?B?bklGRHJlSGU5c1poRjJxUDMvcCsxVHVzU1VicXJrUk52ejVpMFpBWWlWZmk4?=
 =?utf-8?B?WTYwb09XQTcrcmxXMFhLVHN3aEJVRE5VREY3VTVDeDlheXNNRmEyT1FoaWF1?=
 =?utf-8?B?c2cvOVkrWVNXOFlpZjNnTnJUUFpvTW1HTU8vU092TGxadUoyNFFBMFg2UEIw?=
 =?utf-8?B?ZjBLMFZ0a3BleXl2NzNWMTJKK1dURkN6akRTazFuTlY2OW5Udzlrd2gwUnMw?=
 =?utf-8?B?Z2NuK3h0Y2F3cGRGQzRyZEtDUSs3QXphMDJCZHdBZTBETHpqK0dpdjl2ZGps?=
 =?utf-8?B?SzhXY3EvajV4ZkttTm9BSG90YlJJdUZ0Z2hHVWdPTmV0a3o2UTYzd1ZZUWIy?=
 =?utf-8?B?UWhEUDVDcHdSdlNNOUg1TzZBSzcwNnNIeTBkVStvQkZhR21xSnN6c1dhYnB4?=
 =?utf-8?B?dkF4cFg2aytndnFPTmNhaTJmeGJUTHFhRnNpQUxEcEdSbDdQcWJtVi91bXpP?=
 =?utf-8?B?OXMyVFFkZFdxa1Q1RmtxSGZaajI1SjIxTkpydnVubHV1ZDB3N0ZlNTA2dGZY?=
 =?utf-8?B?V0lRUVJzZHRpTEdjcHAzRk1kVWlwa0c1c3hFZXBLWURmYzF6b2RnVlRUWE9X?=
 =?utf-8?B?VWVvQjY1WUQva0VCMzBwSkVvcDA3KzJ2aFU1TTRFTXgwdkRZVWk5cmpscTh4?=
 =?utf-8?B?NTJGUWJqcUdUeGlXUFo3M3N0RFprMmlrV2hydnNiaUNqemJIQkZQcjNENFl1?=
 =?utf-8?B?OWN3UkF4QTJrVEdVYzQxMGxiOTRGcDlTMTdlR2N6TEpDLzNwUExBV2hUaldv?=
 =?utf-8?B?M2VLRmhTeG14cW4weWRxbGgxbk1aQ0VFNVF1dHlLWkM3NlkvL0pzakVXdWdw?=
 =?utf-8?B?OHZPNVVZT0hIZ01WbG5STGQrZVlPUFhHNGdpcCtHSXZwbUZReXlhSVpmWGdY?=
 =?utf-8?B?QXIvU3ZwSytwSVlyeWxMcGlHMGQ2eU1ObHIvUjMzN0dKRXpGNDVER3Rkalhl?=
 =?utf-8?B?eFlScjZncjBnQlhMMUJoZlozZFZVVHFUcldDRFBCbUE4d3c5Q2VjVktLOTc0?=
 =?utf-8?B?MGtadU9menlaQVV0UTJwWmw1aENxZkxna3kzVDA0dUFqbnZUNEdaN2MwTWlh?=
 =?utf-8?B?dmwzS0Z1SVhFK2hMR1RzeXJacDlvbkpxT2M2cnNIQllBcHNsU3Budjl4cEFX?=
 =?utf-8?B?NkhRWnMxN2VESUE4SVJGNUxJOC9hMzNpMGcreThBNDNjZEZSdWdwNCticUtU?=
 =?utf-8?B?blFvL1dNMWhNOXFGRVRhTWUzSGkzcHlhUGt4bnJQaFBjcGF4KzFJTCs3T3Bl?=
 =?utf-8?B?bndzVjJRWmRhZTZaVTZqSmJwdkJpL2VaNnE5a2Nlb1NCakJERGl0aVRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eVRSVDlQVERYTm0wankxblErdkNKOGozdkdxWnFUNDV0T2VncG9LdkdEazd1?=
 =?utf-8?B?dzl2MnhXc1NzNFpURzI4SEpWMnloSCtxZGRINTV5VVp3VEcybGducXprQ3Nx?=
 =?utf-8?B?OWFwTkVlSktJTXVMSDlveUJGaENlbGpJNWFIa2ZJQ0FOaS9pY2pNR1ptVHFX?=
 =?utf-8?B?bDJrTi9RaTlFWERvOFJrVmIvTXNobEdPRHFDbTllNXl2cE41TE1rQ2VqeDVS?=
 =?utf-8?B?U1RWbzdlaDVtNnJiRVlrQmhBams0MzBqanNDTmt4RVFSeFdrQlVIekRSNzdW?=
 =?utf-8?B?ZmM2TE1wY1JDdno0QmUwNUNvZHpoZHYwNkFvVFdsUmp5ZzgrMkpucGc1TSs4?=
 =?utf-8?B?RlkxNjBSTXhZaG5Oa3BUZnZMWnFWTW9tL0RDUXdjZkg5WVh5V2k3dmoxUmdU?=
 =?utf-8?B?SEhjWTZWcERCQm1zU3NlSCtNOEFDTWpPRmxlVTVER3FQcWVOZ2M2alZ0UzQ5?=
 =?utf-8?B?ejc5WlZrZE5BWVVEQ0RLWThvdGtrMVRjZUIzMVRBZDVXRlBRa1FBN3BLZ1lt?=
 =?utf-8?B?NDE4VE40OFNTMEVITm1yYTNKWTVFZ0hQWUhMQjlCR1NuVDNORm1naXh4M1Zt?=
 =?utf-8?B?WXNPRDd6QlNMZS8yRmcrdFRCeHU4V1NQaVI0bFpYWkRkRVB3bXh6eHBTSVl2?=
 =?utf-8?B?Y3NQWi9EME9nU09kVnVJMjUxbTZLSTlQU2hLbXk3Y0puaEZWTElhcGw3SXFj?=
 =?utf-8?B?dFdWY2d4dHNWL3JRWHQ0bVc4eU5KYStIL3A3bmU3WUJkNTFRcHZDUU9kR2ht?=
 =?utf-8?B?NlpWYmNFZHowQWhpVWpjOE5CWlUrZWt1RGd2TU1hWkZnUVUxNm9BQmRob1Ur?=
 =?utf-8?B?V01zVDVJeGlqTmdQNG1qSFB2T0pQSFBVTGxodTQ0cWVuYVVhS3NKM3E3cXNt?=
 =?utf-8?B?SEY4UlVXQ1lpTzJxQmJ5cllpa2F6VWxLMTU5WnRHZlh0L1E3VVpXOHFVOFRz?=
 =?utf-8?B?UFBWVXRIRnhNUkxTYnhMM3RWTjEwSmY0b00vSHppaE9WamtoTmZYS05jcHJK?=
 =?utf-8?B?QzV6cjJBQ0lvQmdVZ0owL01GOXg2MVowL0h1UmtDMENGNzZjRVVrMExJcEdl?=
 =?utf-8?B?dVM1ZUhOcmtHcUg0bmU2dDgzZW1MSG1CUUlacXlHMXF4WStVNXoreHZzbndW?=
 =?utf-8?B?Tm81NXk2V25iRlZSQ2N3dSs5NzBPSWJISTZJLzY1d3FvcDgvaHY3aFVxRWNQ?=
 =?utf-8?B?S0FzSjlONTFWVFVEUXk4RFR5TGkxUktxaHFJTlEyQVcxalY2WFdzd29YYVpa?=
 =?utf-8?B?dVROYmpWQ082Y2JRU3VLRVFmbklMQVhWYlFrQzY4OThmWVB5TzRDWk1lbmR1?=
 =?utf-8?B?dWFocGYzUXlxMHh0QWEzTVpQY3hjSDlQQVViamVUcHpvMVRUeHpUVGxycTJW?=
 =?utf-8?B?TUllWjU2NjJUODNYRFVEMEd6UUZzeVJlR2pOOHhmbWdaUExKOWczblNvcTQ2?=
 =?utf-8?B?SFcvTFJCTGhGd0pmVkwwUkN5V0ZqQTRsMVMzSU9ZT1grc0F1dU9mMThOR2NW?=
 =?utf-8?B?WWZsaWVwLzNHOVI5L0xrUUFhbjJpTWlwRktRNHJLcXh3UUNobFZGd1RIOVE2?=
 =?utf-8?B?ZW9ZLzVmOElVUkx3bktvaEx4VnNhOUlNMi8yWkJ5OG1OZWxNUGk5QW9zQVZM?=
 =?utf-8?B?dGhiZ1dlLzBOMXdhR2QrTE1FdzZGL1BjdlNsQjFtR3I4MkxwWVR6ZXI2Smlo?=
 =?utf-8?B?T2RISE5wNk9sODFpUDBOMUUxa1hmOWhvN3dQeldwVUpRK01GbkNFbE1KZVdv?=
 =?utf-8?B?NWZPY0Y2YmhtYUlzckhQVW96QW1qMStVRkg5aXB0OVMxV3V1TWhSOVNkMnpn?=
 =?utf-8?B?MUIzMU5zWVlBeU05bHJ2TTRxREhxSnpWUlplYlhrc3JJb3ZoekJibDQ5RGJn?=
 =?utf-8?B?YlVTVmVPOHhtZXhSV0NnbGpCOEU2S1Q3OUxFYW1SMlVWbUg4NlBQUWlvNnlE?=
 =?utf-8?B?SE1xdVlEdmEyRnp5djNmNWdGZEN5VFR4S0I5anZjeUo4ZW40V2hVejBubzcv?=
 =?utf-8?B?NGtFb015bFBlQVpVTTQvcFUxT3ppVTQ0T0Q2OFIvWk5wWmdWM2U4TlpCZ3JL?=
 =?utf-8?B?Z0t2NmxXMWEvam1DejVwWTdVUG1UaDMwbHpKOXU3V1FNNDNnZXgrT05BT0dS?=
 =?utf-8?Q?TX+E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <780451B5A743C940808C50E7AD6E0BDF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dec301-32ec-46c8-cc32-08dc7653c353
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 09:28:51.1072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Js/3mxymdrcVweLPUoos8+nohpylDk/dNIchhElw8330lyalL7zLm4t6JkIkA7simWeUJt0WO5RNEGm9azjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133

T24gMjAyNC81LzE3IDE2OjIwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDUuMjAyNCAx
MDowOCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNC81LzE2IDIxOjA4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAxNi4wNS4yMDI0IDExOjUyLCBKaXFpYW4gQ2hlbiB3cm90ZToN
Cj4+Pj4gIHN0cnVjdCBwaHlzZGV2X3BjaV9kZXZpY2Ugew0KPj4+PiAgICAgIC8qIElOICovDQo+
Pj4+ICAgICAgdWludDE2X3Qgc2VnOw0KPj4+DQo+Pj4gSXMgcmUtdXNpbmcgdGhpcyBzdHJ1Y3Qg
Zm9yIHRoaXMgbmV3IHN1Yi1vcCBzdWZmaWNpZW50PyBJT1cgYXJlIGFsbA0KPj4+IHBvc3NpYmxl
IHJlc2V0cyBlcXVhbCwgYW5kIGhlbmNlIGl0IGRvZXNuJ3QgbmVlZCBzcGVjaWZ5aW5nIHdoYXQg
a2luZCBvZg0KPj4+IHJlc2V0IHdhcyBkb25lPyBGb3IgZXhhbXBsZSwgb3RoZXIgdGhhbiBGTFIg
bW9zdCByZXNldCB2YXJpYW50cyByZXNldCBhbGwNCj4+PiBmdW5jdGlvbnMgaW4gb25lIGdvIGFp
dWkuIEltbyB0aGF0IHdvdWxkIGJldHRlciByZXF1aXJlIG9ubHkgYSBzaW5nbGUNCj4+PiBoeXBl
cmNhbGwsIGp1c3QgdG8gYXZvaWQgcG9zc2libGUgY29uZnVzaW9uLiBJdCBhbHNvIHJlYWRzIGFz
IGlmIEZMUiB3b3VsZA0KPj4+IG5vdCByZXNldCBhcyBtYW55IHJlZ2lzdGVycyBhcyBvdGhlciBy
ZXNldCB2YXJpYW50cyB3b3VsZC4NCj4+IElmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkgdGhhdCB5
b3UgbWVhbiBpbiB0aGlzIGh5cGVyY2FsbCBpdCBuZWVkcyB0byBzdXBwb3J0IHJlc2V0dGluZyBi
b3RoIG9uZSBmdW5jdGlvbiBhbmQgYWxsIGZ1bmN0aW9ucyBvZiBhIHNsb3QoZGV2KT8NCj4+IEJ1
dCBpdCBjYW4gYmUgZG9uZSBmb3IgY2FsbGVyIHRvIHVzZSBhIGN5Y2xlIHRvIGNhbGwgdGhpcyBy
ZXNldCBoeXBlcmNhbGwgZm9yIGVhY2ggc2xvdCBmdW5jdGlvbi4NCj4gDQo+IEl0IGNvdWxkLCB5
ZXMsIGJ1dCBzaW5jZSAoYWl1aSkgdGhlcmUgbmVlZHMgdG8gYmUgYW4gaW5kaWNhdGlvbiBvZiB0
aGUNCj4ga2luZCBvZiByZXNldCBhbnl3YXksIHdlIGNhbiBhcyB3ZWxsIGF2b2lkIHJlbHlpbmcg
b24gdGhlIGNhbGxlciBkb2luZw0KPiBzbyAoYW5kIGF0IHRoZSBzYW1lIHRpbWUgc2ltcGxpZnkg
d2hhdCB0aGUgY2FsbGVyIG5lZWRzIHRvIGRvKS4NClNpbmNlIHRoZSBjb3JyZXNwb25kaW5nIGtl
cm5lbCBwYXRjaCBoYXMgYmVlbiBtZXJnZWQgaW50byBsaW51eF9uZXh0IGJyYW5jaA0KaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0
LmdpdC9jb21taXQvP2g9bmV4dC0yMDI0MDUxNSZpZD1iMjcyNzIyNTExZDVlOGFlNTgwZjAxODMw
Njg3YjhhNmIyNzE3ZjAxLA0KaWYgaXQncyBub3QgdmVyeSBtYW5kYXRvcnkgYW5kIG5lY2Vzc2Fy
eSwganVzdCBsZXQgdGhlIGNhbGxlciBoYW5kbGUgaXQgdGVtcG9yYXJpbHkuDQpPciBpdCBjYW4g
YWRkIGEgbmV3IGh5cGVyY2FsbCB0byByZXNldCBhbGwgZnVuY3Rpb25zIGluIG9uZSBnbyBpbiBm
dXR1cmUgcG90ZW50aWFsIHJlcXVpcmVtZW50LCBsaWtlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0
YXRlX3Jlc2V0X2FsbF9mdW5jLg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpK
aXFpYW4gQ2hlbi4NCg==

