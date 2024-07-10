Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0292CC56
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 09:57:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756591.1165247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSBK-00022y-HI; Wed, 10 Jul 2024 07:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756591.1165247; Wed, 10 Jul 2024 07:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRSBK-00020A-E5; Wed, 10 Jul 2024 07:56:06 +0000
Received: by outflank-mailman (input) for mailman id 756591;
 Wed, 10 Jul 2024 07:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEHK=OK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sRSBJ-000204-A6
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 07:56:05 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9069f30-3e91-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 09:56:02 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.31; Wed, 10 Jul
 2024 07:55:56 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 07:55:55 +0000
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
X-Inumbo-ID: d9069f30-3e91-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G77QlfIa/xtgA4zh7HKPCGWA0Cz0Hhugv8ZXRd/HJkqQCMPdk7uXVyHw7i2044m5LvKpKad4eNer4cCpixo575y2ZnZNDWD3U0gOANiCqZA++8aEjWHWnB1RHEyEPtT0rPul/5RvxYdBxHjpHE2rwgaWcgzxwFWaci6DvBusMdMFjLPtD+U88EpvRno+E9pH+63Lf+rnEX+w45dKt49zz3hNpwUprnLr4OG8IfKADvflnVoDUKGcz8wI/1xRNJKqg2P8YzMeNfh9ifW5hjcksfFkR7xJdYHVYCEolCvDXVIg/yNOUAlJlC5K4vNm7xxaYk96d0vYvJAaX9dS1uh/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ajnEzrrKGjS7l85KtlTHR2ygfRnlByyiI5RJ9G4wFM=;
 b=QBDot/z/n1QRzKRBzHPRUmT7RCDHOfH9YunkVWfT3RYPQ2Lgg+9FGg7G9VpSpYyZ8y/i+rXHiqBi3viRTqTrgAtL9oh0hRnRML/i66db51lyJKHh9Oi/JTeeO1EWu45zFzuwdTs75CPDAYJ6rI75HRd4kB0pNqXT34SE9yrYKuyJnYLnN9DTS1pJyikgVbSYP6FIZrSz6+EL7VqMuBaxyQSsNth8d074PffMZZKr9bytA7xDx1wkBCgckJbxd3CQlOD4nLV2wcpQ+HCwF9zdJuhP14qcNJ9qSDoXkmmSHgSKuo6CxvTxCKYp1CxYISsfEJ9Wm2x1Qbo8KZl50SfjRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ajnEzrrKGjS7l85KtlTHR2ygfRnlByyiI5RJ9G4wFM=;
 b=0nmjWFU5oG/L73o8qcK65NMuK/PvJK7VFQKDbR7E5Wrg0X5t88U/0oUdVDZAj1jDRD64Xz9sHRcY6OBXml7Fx+gRvNls3KokC3DjNr3C8mPAAMGZUVdQwEmtsTEgaZF1rgKA7qqZzmVZl8246r+zH+o0G/tTdW2ClCrNyv9urnU=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Marek Marczykowski
	<marmarek@invisiblethingslab.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [XEN PATCH v12 5/7] tools/libxc: Allow gsi be mapped into a free
 pirq
Thread-Topic: [XEN PATCH v12 5/7] tools/libxc: Allow gsi be mapped into a free
 pirq
Thread-Index: AQHa0Svafwo2bv438kGdFzvtwO21aLHuZOCAgAGXbAA=
Date: Wed, 10 Jul 2024 07:55:55 +0000
Message-ID:
 <BL1PR12MB584930ED5755FB4BBD91351DE7A42@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-6-Jiqian.Chen@amd.com>
 <ef611901-03bf-4aa9-9de7-ac6d4fd82d05@suse.com>
In-Reply-To: <ef611901-03bf-4aa9-9de7-ac6d4fd82d05@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.7762.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7120:EE_
x-ms-office365-filtering-correlation-id: 6f9c47f3-6b3d-49ab-60b4-08dca0b5ba28
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VE5JQlRPVFluMEdrc1g0d3ZjcytiTWUyb1hoZ1ZEYkNCWXpyY0FpYmZSVEJa?=
 =?utf-8?B?NFlBc3NDMHR2SnhzU29VdjNKU29EL2pQdGtic0h1MjZGTlFZWDU1MlFYeE8v?=
 =?utf-8?B?NTFxWUJjRzRmdUhzcUdaNk5kZzhrMUJxODFLcGI1OXNncUdSRWI1TU1pMnlG?=
 =?utf-8?B?MzY0d0RGRlpTUXhhMTFSdG03UCs4S2daak5OWGJoY2pNTE1aU0RtWUdZUTNk?=
 =?utf-8?B?ak1Jcm5yNW9KQUlITW40WUZVOEo1YndtQWE2NWVKZkNSaEhKMmRyUHBjd1NY?=
 =?utf-8?B?MkxsNnpLMzBLVi9YVXptVElxcUkwVC9CUkIzOFo2Y1NzczMzUFY0dkM2eDUv?=
 =?utf-8?B?bnpQeXZBMVp3TlFjakhrait0d1ZENzJhd1VkSEFvMXpVSE8zUE92NkV1Z0pV?=
 =?utf-8?B?VmdSbUMvUkdvZWIybVQyUU1udjBHUW9JdE1CZC9wcUwrWjdyaFpIczJjbkM2?=
 =?utf-8?B?SlkxMlE5YzcvVnJjc0w4Z1prMmUxNjY5Nlh5YVNqYjVpN2JDRGU2VkU2bm9x?=
 =?utf-8?B?MWE0SGJmWnJGY01QNTZqaHhVZXRMWjcrK1dHSEN6ZkRSNkdaekpVQ3RSRVR4?=
 =?utf-8?B?UHVPQUNzaFZ5VDlBZGhQSllydWFqUVV1RE8zYlUxZXJ6TEd4TGd1WjlxcXVu?=
 =?utf-8?B?cU9kWkxRck16MHFsKytxMHptcUFlSDh1ZmhZR3FKQzRMM0FNSzcwV2JMUjJQ?=
 =?utf-8?B?WTZsRzVtNzBuUVFEU2FzcGZCQ0RqSjlTdE9CZ3FpK00zb0lWbC9vKzRoYjZR?=
 =?utf-8?B?SHFNaW5Vb3VpNktSWnVxcGFMTDIycDVLZWNHTjNJbUVoWWZjeDBxZitOdi9W?=
 =?utf-8?B?UGordFBZVDFJN1BZNUZwa29ockM2MWJxN3pYWUtCQ2VnYVFPMC9jZm1mS01C?=
 =?utf-8?B?QzU0ekVkalBuaWlYNnVsa2s5NE1sN3JNZzRodkhCL3VBT0ppSkh6SFBTNlVT?=
 =?utf-8?B?L2VEQlYyeW9IWERSZDVmN3Jsa2RaNndhYnh3T3hablVYWElMUVA1S2ZMUFBv?=
 =?utf-8?B?OVRLYWJYb09FMkVNVFFOMklqMDMzWi91STFidWhQRGtBM21RMUZRTExYSXc3?=
 =?utf-8?B?cFZvQTJMNHZvRkxmMHRiZllIdU1RRU1hRVcyTnkvdzV1Y2xnTDZYcXpOOTNa?=
 =?utf-8?B?YjY3ZUNBY2xhWGIvWVZPOUtwUUdmVEI3ejVGWGkxeVgxVTRvbXVITlZHU2dY?=
 =?utf-8?B?TEVHQUFqQWVwN0I3VWdLZk5SSzFTMlBkaXRmeStLRk5YQ1ZRV2Q0N2pDYzdr?=
 =?utf-8?B?R0FnMHJFZUViOGJ4MFZOQjVIVnRvYUZzTG1vVnN6UmM1ZDdRMzFoaEE1MDgr?=
 =?utf-8?B?alFURTAyKzdaeVR2ZzBjU2J2b1l0c3lSRmU5YXF6a3VYNHFPRHo1RUhmQTNw?=
 =?utf-8?B?TjFYMXo1ckl3UmhHZWs5UFhJejUvbldCYVdLR0h0NmhZTWlvTWZFbzZMVFdL?=
 =?utf-8?B?RGw4cG5adFl0cEU2ajd4V3R6dEpCU2R1cy9BTm9GcjNoZkZyZVBVK3N4Tktt?=
 =?utf-8?B?T1FpUWJhM2hRbngxOGhSa3dxSlZ4VlAwakErOVRRcHAvS1hKeGpUYktJRFpR?=
 =?utf-8?B?VSsrRS8yYTZXV01uc3V5eDVuRGRQSkl2ejZ4VGFwd3poZ0NBL3BzWitXOHc1?=
 =?utf-8?B?N0F6bUM5bGVTOG5BQnNOUWY1U2tZTlBGUmdFZURydXBSTlRBUnBiMUd6SS9X?=
 =?utf-8?B?dW04bnJjS2NzSUo1YTZNTUlxU2xQVXhhOU8wRk80UmZoU0dYNmx6WE11bytS?=
 =?utf-8?B?L3o3ZEY5bFRJUm1HL0RUWUxoUlFiQ2hLVjkzVVd4b25BNzlHbXFQZVplMTd3?=
 =?utf-8?B?cUpBK0Vqb0NodHJ6d0x0ajdUdDFvbTZlMVFXd1dWUHF6SW94dlNOZzg5Zmxo?=
 =?utf-8?B?dVdvT0t5b2FHZnppZzBhY3V1N05sVVlhSytHc0YyMnp4QkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RTBGbGttYTBUa1VFOGdkaWgrODFjWm9NaEVjOU0wZTlEK2t6aUlZdUMzSTFP?=
 =?utf-8?B?M0ZFZi9jOVR6cjRqMjBRcGQ0M0N6VHRyellGVDdvZnkyVnNsVzhNcmFTYWR4?=
 =?utf-8?B?TEg4UlJleGVqM3MvbU01WVN5a3FEYmxxUlNuNm5lak4wZ3dEVkJvZTFSRDdq?=
 =?utf-8?B?azNZM2pyZ1l0aGZnbmtORzZPM1d5dVovcVlVY3czRHA1bjNnclhGb1c2WEdG?=
 =?utf-8?B?a1VSZTNEQ3NrMHp0YnZLZklzMHdUbGFTSTJoSkdkb2VUOHhpRTUvZDExOVQz?=
 =?utf-8?B?QnpMcUlBSTBUck5yZTBUQzFxVkhhWWFlYXYzRW5RYmdqTnVNejQ2UG9GaTV6?=
 =?utf-8?B?N1JISUxmTldmeUE0alBXdWNGQStka2dGU3JUNlpTT1BLNndBSk5TQWVDYnh2?=
 =?utf-8?B?ZE9pWjFMUGVpRVdyVlR3Y0o1U0E2d1BvUG9CZFBoV3haZ1UySTBMMEUzbmJt?=
 =?utf-8?B?eEpZMkJmd3kzMVQ1ZVdaTXZ1SWhXYmNQY3FoQ3NpVnZpNFRreUJZaTk1RnU5?=
 =?utf-8?B?eDYxQlhSK1ZsTktMaUUxS0ZWNS9rcGN0VDR4TzNrdzEyL2pnd2M5ZWx1TE56?=
 =?utf-8?B?N2ZRZFEwWExqQ1RhbXIzcEFDaTJPMTZ5elBJVWowdzluQm1IZTgyZ1pCelgw?=
 =?utf-8?B?TmJvZVRNMW9EWFBjT2V6SytaR2JRemlyQmNWWXRUU2M4K3RRMG1mL0ZhMzhh?=
 =?utf-8?B?a2NPRE90dUVJc1pFS3ZCSXcwSkZqUk5KZlNldnJGK2JOYWRSck9QcnkraEZJ?=
 =?utf-8?B?Zm94ckZxdkV0c1RseHpqTGFXOFdSMjArZFVXWEQrVDFLZlZVVk5JOXFOM3A0?=
 =?utf-8?B?cm44ZURIYW5qQ2p6ZmdtREc1NTVOdE81VFFuOXduRUMyZXZQQWFPZGt3T1ZG?=
 =?utf-8?B?akF4WENVOGpaKzFsZ0NibWpPcmlpdnNJUVlnWnBiUHpnR2Nnek1JOUd6aitJ?=
 =?utf-8?B?bTZKMEZ4T1FMMmJuNnpwQ3JISEtBNldzZlhLa0d3VzFOTUltTWdYM3NXY09i?=
 =?utf-8?B?K05pRXNVY3VMOEJMVVN3Z25yNFZGSVFROG9DOFVFVEVUUVBqNlJyK1FpNkJS?=
 =?utf-8?B?NUcyWi8vMEczR3lENDMvTi9mQlV5NUpGNm5ZYThNYVQwd0J1ckNHT056eXcw?=
 =?utf-8?B?V0VPU2VoYWJUWk10U1l1cXN0K2NHWHdJNERsVTJqb0JHNE56cVNoOEhOdGV6?=
 =?utf-8?B?d2V3TEZidFQrUENZOFRPOUJlcDVHaFdmSlBjSWVFbDZKUWVISzhpU1dlQjZ1?=
 =?utf-8?B?bmJZV1FKdU10ZjcybFg3THphTnhKWStad1F6NHd5S1hKcFFEejlZaWdJNkxi?=
 =?utf-8?B?a2dYbGEybUZTUzd2L003RXRXcTNyUVFnQmdGcVM0YWR6MWprU3V3N0Q0NDRk?=
 =?utf-8?B?MzlOV2Q3SlZ3eXh6eXg2c2hraVpmSmFTQ1lleVJBeE83UGMrRWljVDZQRk9G?=
 =?utf-8?B?bXJYT2t1enkzRU93Z2VwUkJKemVSR1phOWZyZ1ZvZWY2UENIdDEzUTZXSUFT?=
 =?utf-8?B?T0tiT2JWYWZtdnRwQ1ZLeUtiQ3VieGQ1SjRPN2JrQjE0bVJTVVNkcERQc21H?=
 =?utf-8?B?cmlBKzlFSFNnSlNoWTZaa1Q3UUU1dkpabTlsajdmOG0yRnNpSFFHaWJOUEpN?=
 =?utf-8?B?Q0Rwb0xyd2VxMEx0TTdRTFhJZk1pUVgzWHVBUHRBeUVCT0x6QmVDNU96b2RY?=
 =?utf-8?B?eWZVT3dVeldnVnR6RjNXeXVqaUN3SlRKK0ZBRGJ4b2JNS211VmNnY1FzVHY4?=
 =?utf-8?B?YVJMeTYwUzlPZXV5bHIrRTZXVHpHYmtPU21RU1ZkOE5FK0NQUEZuMHJ2cG94?=
 =?utf-8?B?cG81YkdGbjNDTUxuNVFTaXUwQUdLL1lOUzc5ZFN6TU5VdVRIbnFwREtDQi8v?=
 =?utf-8?B?bEFmUUlXTG0zMXlXNktobGxVZFVaQmkxNlpvc3BoK3NSTG9PQ094bUJLdEY2?=
 =?utf-8?B?aUNJQ0llUHZJcXJFYU83TE1pVVVGZkN0T3BuUE9vaUdxanU4a0FPTi9FeUk3?=
 =?utf-8?B?R0ZrT2JkeFZIODdidHQzN0YwY090cDVFUURUdVlERzF6WDdBUFRLaGpkOFl0?=
 =?utf-8?B?OFNxTGFUUTdUY3U2eVNyM3dubFZ5NjlGcTNmWHFoazYvWjhDS3VJNy9mTmpN?=
 =?utf-8?Q?3WYg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <21408DC98B68874FBDFBB687E871D5F1@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9c47f3-6b3d-49ab-60b4-08dca0b5ba28
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 07:55:55.1937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RqRdd85YO6lMVWxZUhwMJteIyM3x+rbXGM8rKlCLdME+vf5wgdbv4hVWEeQS09G3LpYuCqIHtjkalW8XmLfPDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120

T24gMjAyNC83LzkgMjE6MjYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOC4wNy4yMDI0IDEz
OjQxLCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IEh5cGVyY2FsbCBQSFlTREVWT1BfbWFwX3BpcnEg
c3VwcG9ydCB0byBtYXAgYSBnc2kgaW50byBhIHNwZWNpZmljDQo+PiBwaXJxIG9yIGEgZnJlZSBw
aXJxLCBpdCBkZXBlbmRzIG9uIHRoZSBwYXJhbWV0ZXIgcGlycSg+MCBvciA8MCkuDQo+PiBCdXQg
aW4gY3VycmVudCB4Y19waHlzZGV2X21hcF9waXJxLCBpdCBzZXQgKnBpcnE9aW5kZXggd2hlbg0K
Pj4gcGFyYW1ldGVyIHBpcnEgaXMgPDAsIGl0IGNhdXNlcyB0byBmb3JjZSBhbGwgY2FzZXMgdG8g
YmUgbWFwcGVkDQo+PiB0byBhIHNwZWNpZmljIHBpcnEuIFRoYXQgaGFzIHNvbWUgcHJvYmxlbXMs
IG9uZSBpcyBjYWxsZXIgY2FuJ3QNCj4+IGdldCBhIGZyZWUgcGlycSB2YWx1ZSwgYW5vdGhlciBp
cyB0aGF0IG9uY2UgdGhlIHBlY2lmaWMgcGlycSB3YXMNCj4+IGFscmVhZHkgbWFwcGVkIHRvIG90
aGVyIGdzaSwgdGhlbiBpdCB3aWxsIGZhaWwuDQo+Pg0KPj4gU28sIGNoYW5nZSB4Y19waHlzZGV2
X21hcF9waXJxIHRvIGFsbG93IHRvIHBhc3MgbmVnYXRpdmUgcGFyYW1ldGVyDQo+PiBpbiBhbmQg
dGhlbiBnZXQgYSBmcmVlIHBpcnEuDQo+Pg0KPj4gVGhlcmUgYXJlIGZvdXIgY2FsbGVyIG9mIHhj
X3BoeXNkZXZfbWFwX3BpcnEgaW4gb3JpZ2luYWwgY29kZXMsIHNvDQo+PiBjbGFyaWZ5IHRoZSBh
ZmZlY3QgYmVsb3coanVzdCBuZWVkIHRvIGNsYXJpZnkgdGhlIHBpcnE8MCBjYXNlKToNCj4+DQo+
PiBGaXJzdCwgcGNpX2FkZF9kbV9kb25lLT54Y19waHlzZGV2X21hcF9waXJxLCBpdCBwYXNzIGly
cSB0byBwaXJxDQo+PiBwYXJhbWV0ZXIsIGlmIHBpcnE8MCBtZWFucyBpcnE8MCwgdGhlbiBpdCB3
aWxsIGZhaWwgYXQgY2hlY2sNCj4+ICJpbmRleCA8IDAiIGluIGFsbG9jYXRlX2FuZF9tYXBfZ3Np
X3BpcnEgYW5kIGdldCBFSU5WQUwsIGxvZ2ljIGlzDQo+PiB0aGUgc2FtZSBhcyBvcmlnaW5hbCBj
b2RlLg0KPiANCj4gVGhlcmUgd2UgaGF2ZQ0KPiANCj4gICAgIGludCBwaXJxID0gWEVOX1BUX1VO
QVNTSUdORURfUElSUTsNCj4gDQo+ICh3aXRoIFhFTl9QVF9VTkFTU0lHTkVEX1BJUlEgYmVpbmcg
LTEpIGFuZCB0aGVuDQo+IA0KPiAgICAgcmMgPSB4Y19waHlzZGV2X21hcF9waXJxKHhlbl94Yywg
eGVuX2RvbWlkLCBtYWNoaW5lX2lycSwgJnBpcnEpOw0KPiANCj4gVGhlcmVmb3JlIC4uLg0KPiAN
Cj4+IC0tLSBhL3Rvb2xzL2xpYnMvY3RybC94Y19waHlzZGV2LmMNCj4+ICsrKyBiL3Rvb2xzL2xp
YnMvY3RybC94Y19waHlzZGV2LmMNCj4+IEBAIC01MCw3ICs1MCw3IEBAIGludCB4Y19waHlzZGV2
X21hcF9waXJxKHhjX2ludGVyZmFjZSAqeGNoLA0KPj4gICAgICBtYXAuZG9taWQgPSBkb21pZDsN
Cj4+ICAgICAgbWFwLnR5cGUgPSBNQVBfUElSUV9UWVBFX0dTSTsNCj4+ICAgICAgbWFwLmluZGV4
ID0gaW5kZXg7DQo+PiAtICAgIG1hcC5waXJxID0gKnBpcnEgPCAwID8gaW5kZXggOiAqcGlycTsN
Cj4+ICsgICAgbWFwLnBpcnEgPSAqcGlycTsNCj4+ICANCj4+ICAgICAgcmMgPSBkb19waHlzZGV2
X29wKHhjaCwgUEhZU0RFVk9QX21hcF9waXJxLCAmbWFwLCBzaXplb2YobWFwKSk7DQo+IA0KPiAu
Li4gdGhpcyB2ZXJ5IG11Y2ggbG9va3MgbGlrZSBhIGNoYW5nZSBpbiBiZWhhdmlvciB0byBtZTog
KnBpcnEgaXMNCj4gbmVnYXRpdmUsIGFuZCBoZW5jZSBpbmRleCB3b3VsZCBoYXZlIGJlZW4gcHV0
IGluIG1hcC5waXJxIGluc3RlYWQuIFdoaWxlDQo+IHdpdGggeW91ciBjaGFuZ2Ugd2UnZCB0aGVu
IHBhc3MgLTEsIGkuZS4gcmVxdWVzdGluZyB0byBvYnRhaW4gYSBuZXcNCj4gcElSUS4NCj4gDQo+
IEkgYWxzbyBjb25zaWRlciBpdCBxdWVzdGlvbmFibGUgdG8gZ28gYnkgaW4tdHJlZSB1c2Vycy4g
SSB0aGluayBwcm9vZiBvZg0KPiBubyBmdW5jdGlvbmFsIGNoYW5nZSBuZWVkcyB0byBhbHNvIGNv
bnNpZGVyIHBvc3NpYmxlIG91dC1vZi10cmVlIHVzZXJzLA0KPiBub3QgdGhlIGxlYXN0IHNlZWlu
ZyB0aGUgUHl0aG9uIGJpbmRpbmcgYmVsb3cgKGV2ZW4gaWYgcmlnaHQgdGhlcmUgeW91DQo+IGlu
ZGVlZCBhdHRlbXB0IHRvIHJldGFpbiBwcmlvciBiZWhhdmlvcikuIFRoZSBvbmUgYXNwZWN0IGlu
IHlvdXIgZmF2b3INCj4gaXMgdGhhdCBsaWJ4YyBpc24ndCBjb25zaWRlcmVkIHRvIGhhdmUgYSBz
dGFibGUgQUJJLg0KPiANCj4gT3ZlcmFsbCBJIHNlZSBsaXR0bGUgcm9vbSB0byBhdm9pZCBpbnRy
b2R1Y2luZyBhIG5ldyBmdW5jdGlvbiB3aXRoIHRoaXMNCj4gaW1wcm92ZWQgYmVoYXZpb3IgKG1h
eWJlIHhjX3BoeXNkZXZfbWFwX3BpcnFfZ3NpKCkpLiBJZGVhbGx5IGV4aXN0aW5nDQo+IGNhbGxl
cnMgd291bGQgdGhlbiBiZSBzd2l0Y2hlZCwgdG8gZXZlbnR1YWxseSBhbGxvdyByZW1vdmluZyB0
aGUgb2xkDQo+IGZ1bmN0aW9uICh0aHVzIGNsZWFubHkgYW5kIG5vdGljZWFibHkgYnJlYWtpbmcg
YW55IG91dC1vZi10cmVlIHVzZXJzDQo+IHRoYXQgdGhlcmUgbWF5IGJlLCBpbmRpY2F0aW5nIHRv
IHRoZWlyIGRldmVsb3BlcnMgdGhhdCB0aGV5IG5lZWQgdG8NCj4gYWRqdXN0IHRoZWlyIGNvZGUp
Lg0KTWFrZSBzZW5zZSwgYWRkaW5nIGEgbmV3IGZ1bmN0aW9uIHhjX3BoeXNkZXZfbWFwX3BpcnFf
Z3NpIGlzIG11Y2ggYmV0dGVyLCBhbmQgaXQgaGFzIHRoZSBsZWFzdCBpbXBhY3QuDQpUaGFuayB5
b3UgdmVyeSBtdWNoIQ0KSSB3aWxsIGNoYW5nZSB0byBhZGQgeGNfcGh5c2Rldl9tYXBfcGlycV9n
c2kgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gLS0tIGEvdG9vbHMvcHl0aG9uL3hlbi9sb3ds
ZXZlbC94Yy94Yy5jDQo+PiArKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMN
Cj4+IEBAIC03NzQsNiArNzc0LDggQEAgc3RhdGljIFB5T2JqZWN0ICpweXhjX3BoeXNkZXZfbWFw
X3BpcnEoUHlPYmplY3QgKnNlbGYsDQo+PiAgICAgIGlmICggIVB5QXJnX1BhcnNlVHVwbGVBbmRL
ZXl3b3JkcyhhcmdzLCBrd2RzLCAiaWlpIiwga3dkX2xpc3QsDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmZG9tLCAmaW5kZXgsICZwaXJxKSApDQo+PiAgICAgICAg
ICByZXR1cm4gTlVMTDsNCj4+ICsgICAgaWYgKCBwaXJxIDwgMCApDQo+PiArICAgICAgICBwaXJx
ID0gaW5kZXg7DQo+PiAgICAgIHJldCA9IHhjX3BoeXNkZXZfbWFwX3BpcnEoeGMtPnhjX2hhbmRs
ZSwgZG9tLCBpbmRleCwgJnBpcnEpOw0KPj4gICAgICBpZiAoIHJldCAhPSAwICkNCj4+ICAgICAg
ICAgICAgcmV0dXJuIHB5eGNfZXJyb3JfdG9fZXhjZXB0aW9uKHhjLT54Y19oYW5kbGUpOw0KPiAN
Cj4gSSBxdWVzdGlvbiB0aGlzIGNoYW5nZSwgeWV0IHdpdGhvdXQgQ2MtaW5nIHRoZSBtYWludGFp
bmVyIChub3cgYWRkZWQpDQo+IHlvdSdyZSBub3QgdmVyeSBsaWtlbHkgdG8gZ2V0IGEgY29tbWVu
dCAobGV0IGFsb25lIGFuIGFjaykgb24gdGhpcy4NCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVn
YXJkcywNCkppcWlhbiBDaGVuLg0K

