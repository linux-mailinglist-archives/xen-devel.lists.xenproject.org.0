Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A2A2C15E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 12:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883546.1293506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMGC-0003v8-Ad; Fri, 07 Feb 2025 11:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883546.1293506; Fri, 07 Feb 2025 11:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgMGC-0003sI-7z; Fri, 07 Feb 2025 11:11:00 +0000
Received: by outflank-mailman (input) for mailman id 883546;
 Fri, 07 Feb 2025 11:10:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMDZ=U6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tgMGB-0003sC-4d
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 11:10:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d1dd25-e544-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 12:10:57 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 11:10:54 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 11:10:54 +0000
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
X-Inumbo-ID: 33d1dd25-e544-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erIVb+16wgq1nn5tQu45zheGGY+NxksASScwBg1pu8z8pkhu0ZoxNmnuDBsVPwcX8V6aZcfVjtN3AQtOIO9HP11kvuYqlrJxoOg2Fah4ucA5PBsPw1gPWnjazHabpPT3y7LRf7/CV9fi9M1nVgokkFBwUla5pPi+xsRJFl2EdBqcVFSvPlux1a8Cyl21mSmjfMYa+JJZQnTwm4nrvHiFUJzKLmhhMV0jCAA/+QNytKcC/yYoSKATWApbqrrnBG0QRwVD6kykHfc0yt2w3st2HIlYEdvTB5HlA/78Er2MMvmCFcsrpsSYP6ygsZZ/HldSupPziDaLq2piiRX3FSaR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKZrFFRO0E0PIi9tvB7WeaMqhf4SKIUY0el4WGf3yEY=;
 b=jac1G53NZ38VHSZSa2MPuyNirqt3+wwomzqw5m9G3Jei8ZRO3voT3tcCFOv3k9lQJ2kDEBltGYjyaOrPKwsagNrd19I7D4hVzga553hbyLVtWJWf5rl0j+bMf2WQPdc3enCvD99byEfH1XRnsoH4ujV5JZOZvYBBRWZEK9WkO8J8REcOkLw4d9ySJbnfhJ9gtTYpGXX6Lwan4Olo2RMFQGOzHEJGK2zfqM34Ya3IqmjxF6jA6mL67s21az1W2qT/4rSHQ5qTq8rTRlAa0kqdsrKD55IUWgTQ0RyEl0kjnP9QT3IR/7I4FK4AxmPsKT7MVeo0eFsil789KdQuTPCKUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKZrFFRO0E0PIi9tvB7WeaMqhf4SKIUY0el4WGf3yEY=;
 b=gdhp09DQxn1oRmnhnaAqc2KVqRS1z5W/qR6RdPGT1aKAvQ32pXOiboIF40YfhjkZVCVRmyeOon7nmdzp85JNHjANz2+9M3XQ3223e51o3ZJXyFfV9f7C/LPi5fFzsGIdc+3dxGDHzoXqWy5+47tFFYHGbTxof3XbsXwp7kMNKuw=
From: "Orzel, Michal" <Michal.Orzel@amd.com>
To: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"bertrand.marquis@arm.com" <bertrand.marquis@arm.com>, "julien@xen.org"
	<julien@xen.org>, "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	Henry Wang <xin.wang2@amd.com>, Alec Kwapis <alec.kwapis@medtronic.com>
Subject: Re: [PATCH v6 2/7] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
Thread-Topic: [PATCH v6 2/7] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
Thread-Index: AQHbeQMghub2t/SQJ0SB0U0fJ2L5b7M7r+GA
Date: Fri, 7 Feb 2025 11:10:54 +0000
Message-ID: <0a5e6096-70a3-43d8-8d76-7eadf62a9aa1@amd.com>
References:
 <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
 <20250207015341.1208429-2-stefano.stabellini@amd.com>
In-Reply-To: <20250207015341.1208429-2-stefano.stabellini@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5273:EE_|IA1PR12MB9064:EE_
x-ms-office365-filtering-correlation-id: 8a7116aa-dddf-4e91-bb98-08dd476816f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WEhWcFRjcVFacXc5enFmNFpCVGNpVzZqS210M3NvdE91My9MMmZUZGw0c1Yx?=
 =?utf-8?B?TWRLSkxEMnF6a2FyZEQ3aDljcjJ1cmdKSVdhNzRCYnFCd1lWVG5tU1hlMmtm?=
 =?utf-8?B?emJ4UmFjSTVwNlN5bmk3YkQ0YjFBQU9LNStHdmJWVVhmYXNZZk9IbWdvTmc3?=
 =?utf-8?B?RmQ5dXZqVmplR1VvYVo5a3VWYk5jYjVVSkVORHoxTTJ2ZXUyY0dHVkZTWWxV?=
 =?utf-8?B?UEdQcG9tQVVKQURWSFBRUHJiSmJRM2JxcHpTR3JncFJpY0VoYVVlajhGWGpG?=
 =?utf-8?B?amJ2aVNtVTI4S3p6OEdTWENZUnBPRUJRYTBRbms3NUhNWWJMM0hMR3RMR2RS?=
 =?utf-8?B?VkFFT3k2cFlhcTJETjFEQTg2VXdNZDVpNjAvUUtybnNndUhaN0VoK2R5Syt5?=
 =?utf-8?B?QnBLVnNWVzkxdWpyQTQ1Q2QwdHF6QzdOcnE0VHhkZ1hXRnM0KzkvMklvNVF4?=
 =?utf-8?B?dVZoc09zdEZIeTlzQ3hERUFXbW5tWWpQTFRNZkZZM1hCNnVvNWR5TmY3Zk5y?=
 =?utf-8?B?dGVkYTgzZStCdWdzTDNLT0VEalZ2VEpSeU0vOG5vY3hqb1VUanJ3enBzd283?=
 =?utf-8?B?bE9UNXpESXZkZWZCTGh2aEN2QkwwditKazQ0VHA5akJRMGR3WHF5TmxPVFg2?=
 =?utf-8?B?eUhFRTNoRHpySVo0SkVkbmZPM2ovZmxXTmxBZ2Rwb2N6VE1YWXhDSnhzWmFX?=
 =?utf-8?B?NFpVeldGS0E4bEpEY1A2aXRQTm5USmdWN3VMLzNWYlRqS0xJMUlnNXpVLzNU?=
 =?utf-8?B?NWRMR1hxSytGaXo1b0FhTkxKc0xBMVBCYzk0QnQzdnJRUnpVS0xsaitYOFg5?=
 =?utf-8?B?VDdTcjJ3VW0yL1ZSR3l5NzVLZ3YzVEVpYXNCd1hudFRCb1ZxaUxDMU1vYjBx?=
 =?utf-8?B?V2FyYXNOd1J2TjRNK2ZkRDZSYlJuM1lsTEJyZnNwb2lVUjZJbEhXN2diam5o?=
 =?utf-8?B?ZHh3b2I0QmhzOVZSQjd3UUU2Nm1FV0xPclJ6bHFNZkl4Q2x3NU1YbVlWTllm?=
 =?utf-8?B?dElqcStqK0R0RHE2U1pCTTNOY01PRkVPamRMMENpeDJOR2FRQmNCT1ZwOS9o?=
 =?utf-8?B?M2FUNzZzM01NVDd3MHB1SXFlVnNOSGZRaDlsd25XUHhVTjZ5aisrQThFa0E5?=
 =?utf-8?B?SEc5OEJwTUZKMDhZUUYzQjlObFdIenFlcmNKbGtBWGdiWGJmanl1d2Q5a2Vs?=
 =?utf-8?B?MUtuZ2FyZ20zUjRTTUFVeEtQYnNzQlBtUkw4TkNrWVRhSlNqMFlyREZZcG11?=
 =?utf-8?B?SGZOTEVkd0YzdnhtUWpXait4eU9MNE1OcXVwOUxjL0Q5bWYxL1drUDRzMjRk?=
 =?utf-8?B?b0ZEZHlRbmZZOVczKzl1Ym9CL1pzSHdRV3lGaWhCOHE1VVp4M1hWQjBlZkx3?=
 =?utf-8?B?QWRVQkxENC9mbWtmUnpHVnkyQ1RhMURvTXVKaGUwcVFvZktRdUdhMWxNMEE0?=
 =?utf-8?B?cVVLUjBmbEphODlXd21QRk5FUVd6Q0lUZy92RWQ5elZNV0tZT2dtbkRFTmIy?=
 =?utf-8?B?UWlxRHpFRXdvY0N2VnFRa2dBaHNYNGJHOGhpTzZjVlNBZkR3NzdwYjJwMEpE?=
 =?utf-8?B?U2pWTWgzQ3hYSzg4eVJlTUd0a1FLbnptMDhEY0F3Y2I1cWdRWkZHRC9LMnN2?=
 =?utf-8?B?alpITFBDb3o5bWtWRGV4aUtRdWxBdW5pOFJ1STJCSytlSy9Ob2k2VHluaU9U?=
 =?utf-8?B?N1dER3JsS1BncE03eExnMFI2TTk4QVBOSk1tYXlBSVNoUzBTdzk0TVV2T3ZI?=
 =?utf-8?B?bTBJQXFLb2xrYmxhS3pnejFGZUV3UTc2d2l1UWMyeWFFMmxoVWRZeE55ZUNk?=
 =?utf-8?B?eWNVbldiWkFianFESU80aFNwa2tvL21YNTVkUmwyTmc4RGZjV3hCbUovSmV0?=
 =?utf-8?B?dmRTa3J4NTdMdVhtblNRQzlFT1l4ZjV1R3ZZWVM1K3ZmU1ZmcmtobEtzd1pX?=
 =?utf-8?Q?SRAnhuyJPvrZ8+cz85PwdWzLWmvlfIEx?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnp3djgyUnJPMmJkUlVHWVB1ODZHYTN2NE1IWVhwQ1pQWEtuNVIzbkpBT3VX?=
 =?utf-8?B?QlVhcEVLK2p1ais4MHFVL21heHhWamV4MUc2Z0NFT1kxcVlQSWFSVyt4VWRa?=
 =?utf-8?B?VENkQWVLSzdubTB1dW9WNTFqcVhXMDRHVGh6amJmM0tRa2N1VGtCY2Iwb3By?=
 =?utf-8?B?RmdDREZYaVZQN3JwTU1BalZIT2c1blNvalJJM2V0OEQxZlNNMGNnMWI1dzg2?=
 =?utf-8?B?L0xNZ0Z4QUVLQzBXVFlZNXM5VlJDRDhnakJ5WGNQUnJ4K2RDVTBKejBOVkNT?=
 =?utf-8?B?Nm9GcnF0NUY4TzdpTGdSdVQzMG93bnZSaWhHcXV6QmlIR2R2eVFQMTFPZ3ZO?=
 =?utf-8?B?MGlvV1R4OU45Zm1RYS9BRnFiMVA3OWpnR2hGMmNtbm9OSFNGOTluUGhGcjBW?=
 =?utf-8?B?YzVma05uZSthdUZpNWtTdWlBbjJzYUJTOUt0SWZveWs4dUNHTXlsbmJjZ3Q4?=
 =?utf-8?B?SFlsTFRTVkFONFJ1aER5YVh0YTgzQ3R0NFF6YU9Ea04veFBvSW0yUnAzcDRz?=
 =?utf-8?B?U0U1NXJ6ekxvN2VlMjQyQUdQMXRrYWNtL2hlUm5Sbm11cldDRk1lUUhpZDhM?=
 =?utf-8?B?TlNBclY2eDRjQ09ITWNDbjhiZ0pKSkYyQXRmRFB6YzFQUElMZmhyS1RMSWtI?=
 =?utf-8?B?dEpBeE1aRnd2c1RoZzhQYVJEMVJnU3pWRlRFSU1RazNOQk9ra0lkV2RtZk9N?=
 =?utf-8?B?Y3V0K1ZOYnVNNnlqNlFwUldKVmVZYm5JOWpqTUR0OWhHZW9xMVlteE5xUHBX?=
 =?utf-8?B?Um40QjZtSDZXZUZMLzZpTis3MFZHbUJuZXBLWmlkZjFieFdtSXUrOUdtRnFX?=
 =?utf-8?B?TXBvWldsOG9BdnBTNi9sOEViRDZMVENuZjY2M1B4L01JekcyNlI4REdwczlJ?=
 =?utf-8?B?M3YwUUgrSE1TZmc1d0NFUGJrUnNyTXc4R1cxU29zMncweTE1OG4wTlZSbGk4?=
 =?utf-8?B?TkdwdXZyMnNiWERYZm1IeUFNT3FmK0hHQUhNdE0yS0NVSCtKejNMNThGWlhj?=
 =?utf-8?B?L0ZMcHc1akZKY1dhT0NKNG1RUHRQRXR2Ujd5T2dLejBaYmJSRDdIcU8va3l5?=
 =?utf-8?B?TnJHZ3hOTlAxSVp0MnVtUnpFQ05UWXBOVkdybjlPc1ppWVBXRnVVVnoyc2s1?=
 =?utf-8?B?MmpnYmtsdnlVaDlkLzEwRjJNbjNDcGhsa3NGTzZJa1czWXJEbmF5Nm94S1Aw?=
 =?utf-8?B?dldDbzlvRGF5aWd1ckY0YXJQaUNYT0JDRTZOUC9zWm5Sd3lRdmxvaE1LTnhE?=
 =?utf-8?B?M2puN1dLOHNDUlNSb3QwTHpTcHBndjZpUE9jZlVnRVA3NnpOcTRQUmsrUVlE?=
 =?utf-8?B?cHNna1ozUUVUYUVlUHo4M1VXdkRtYW01eVdFTEFHMURTWnpNenRYbXR6M2R0?=
 =?utf-8?B?Q0FUS294dXRrRXFuLzlhaVpXTFMrRjEyeDhpR01sNHEwb1psdW9RK2p3K2Rl?=
 =?utf-8?B?M1FsSzdHbFltbXhCUEtNMlZFN3IvRGZJR25kZGlON1hIc1k0dTJ5MVd2NHM1?=
 =?utf-8?B?K1dnL043Qk1KenN2NDVzWlgvTUs4QldtY2tUbC9mczg3Mi9MdWdjWUdyWmhK?=
 =?utf-8?B?UmlwSVd3YmpZUDFHV3RocFI2d2hqNFNlVW5uU1NFWDNhQlpCTXRGUTkvNWtl?=
 =?utf-8?B?SFNVSGVmWkh5T2xqQlpIQnlZVGo1aXJERnk1dXdSVTBmNWhXNE5xOXU0a2N0?=
 =?utf-8?B?bG83T29BVDZiUm0wcEZ6WGFpVHFuRFpSRDZzZzBSYnhEeG9teWYrbTBiQitu?=
 =?utf-8?B?RUpmSVRBc2ZaM3lyOXJIRS9yVDhieXVpY2VvUUZoMmo0NjQzVWNPbUw4ZjJT?=
 =?utf-8?B?K1RIMjFyMkxsT2pkL3lrSGNlNi82cUhmNXd3WkNwWmtRZk51T3hUVTdESkQr?=
 =?utf-8?B?ZUVrVDJ4OWlmc3Juckx1bGN4MkgzbFl6aERLSnRGRUtrNnlSYWFUVlRFZWFS?=
 =?utf-8?B?K2dRSGxrVzMrVWZDalVMR0xxUXgxbllvdHZQR2J6OHZBT1I2SUQ3UG1GV0hQ?=
 =?utf-8?B?ZTZiUUllMWJOOStvSGFTcVNtd0s5dlN6Tm5XZHdweGdteUJWUjVROVFSbFdk?=
 =?utf-8?B?d1h4ekpOZms5WmZWeng3d2lUaGNWVVp3Qy9USGFVVmw0Q3ZqYUhwSm0yY0U2?=
 =?utf-8?Q?Dsh0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE00F7C0928E0B46A51CBCA1784CF457@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7116aa-dddf-4e91-bb98-08dd476816f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 11:10:54.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZ4e5HvRo8EtJOfNsNBhn62R+Adi/rjv9aVeYz/fL/WLFcmixjCO/P6sBP4hyP64
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064

DQoNCk9uIDA3LzAyLzIwMjUgMDI6NTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gRnJv
bTogSGVucnkgV2FuZyA8eGluLndhbmcyQGFtZC5jb20+DQo+IA0KPiBUaGVyZSBhcmUgdXNlIGNh
c2VzIChmb3IgZXhhbXBsZSB1c2luZyB0aGUgUFYgZHJpdmVyKSBpbiBEb20wbGVzcw0KPiBzZXR1
cCB0aGF0IHJlcXVpcmUgRG9tMGxlc3MgRG9tVXMgc3RhcnQgaW1tZWRpYXRlbHkgd2l0aCBEb20w
LCBidXQNCj4gaW5pdGlhbGl6ZSBYZW5TdG9yZSBsYXRlciBhZnRlciBEb20wJ3Mgc3VjY2Vzc2Z1
bCBib290IGFuZCBjYWxsIHRvDQo+IHRoZSBpbml0LWRvbTBsZXNzIGFwcGxpY2F0aW9uLg0KPiAN
Cj4gQW4gZXJyb3IgbWVzc2FnZSBjYW4gc2VlbiBmcm9tIHRoZSBpbml0LWRvbTBsZXNzIGFwcGxp
Y2F0aW9uIG9uDQo+IDE6MSBkaXJlY3QtbWFwcGVkIGRvbWFpbnM6DQo+IGBgYA0KPiBBbGxvY2F0
aW5nIG1hZ2ljIHBhZ2VzDQo+IG1lbW9yeS5jOjIzODpkMHYwIG1mbiAweDM5MDAwIGRvZXNuJ3Qg
YmVsb25nIHRvIGQxDQo+IEVycm9yIG9uIGFsbG9jIG1hZ2ljIHBhZ2VzDQo+IGBgYA0KPiANCj4g
VGhlICJtYWdpYyBwYWdlIiBpcyBhIHRlcm1pbm9sb2d5IHVzZWQgaW4gdGhlIHRvb2xzdGFjayBh
cyByZXNlcnZlZA0KPiBwYWdlcyBmb3IgdGhlIFZNIHRvIGhhdmUgYWNjZXNzIHRvIHZpcnR1YWwg
cGxhdGZvcm0gY2FwYWJpbGl0aWVzLg0KPiBDdXJyZW50bHkgdGhlIG1hZ2ljIHBhZ2VzIGZvciBE
b20wbGVzcyBEb21VcyBhcmUgcG9wdWxhdGVkIGJ5IHRoZQ0KPiBpbml0LWRvbTBsZXNzIGFwcCB0
aHJvdWdoIHBvcHVsYXRlX3BoeXNtYXAoKSwgYW5kIHBvcHVsYXRlX3BoeXNtYXAoKQ0KPiBhdXRv
bWF0aWNhbGx5IGFzc3VtZXMgZ2ZuID09IG1mbiBmb3IgMToxIGRpcmVjdCBtYXBwZWQgZG9tYWlu
cy4gVGhpcw0KPiBjYW5ub3QgYmUgdHJ1ZSBmb3IgdGhlIG1hZ2ljIHBhZ2VzIHRoYXQgYXJlIGFs
bG9jYXRlZCBsYXRlciBmcm9tIHRoZQ0KPiBpbml0LWRvbTBsZXNzIGFwcGxpY2F0aW9uIGV4ZWN1
dGVkIGluIERvbTAuIEZvciBkb21haW4gdXNpbmcgc3RhdGljYWxseQ0KPiBhbGxvY2F0ZWQgbWVt
b3J5IGJ1dCBub3QgMToxIGRpcmVjdC1tYXBwZWQsIHNpbWlsYXIgZXJyb3IgImZhaWxlZCB0bw0K
PiByZXRyaWV2ZSBhIHJlc2VydmVkIHBhZ2UiIGNhbiBiZSBzZWVuIGFzIHRoZSByZXNlcnZlZCBt
ZW1vcnkgbGlzdCBpcw0KPiBlbXB0eSBhdCB0aGF0IHRpbWUuDQo+IA0KPiBTaW5jZSBmb3IgaW5p
dC1kb20wbGVzcywgdGhlIG1hZ2ljIHBhZ2UgcmVnaW9uIGlzIG9ubHkgZm9yIFhlblN0b3JlLg0K
PiBUbyBzb2x2ZSBhYm92ZSBpc3N1ZSwgdGhpcyBjb21taXQgYWxsb2NhdGVzIHRoZSBYZW5TdG9y
ZSBwYWdlIGZvcg0KPiBEb20wbGVzcyBEb21VcyBhdCB0aGUgZG9tYWluIGNvbnN0cnVjdGlvbiB0
aW1lLiBUaGUgUEZOIHdpbGwgYmUNCj4gbm90ZWQgYW5kIGNvbW11bmljYXRlZCB0byB0aGUgaW5p
dC1kb20wbGVzcyBhcHBsaWNhdGlvbiBleGVjdXRlZA0KPiBmcm9tIERvbTAuIFRvIGtlZXAgdGhl
IFhlblN0b3JlIGxhdGUgaW5pdCBwcm90b2NvbCwgc2V0IHRoZSBjb25uZWN0aW9uDQo+IHN0YXR1
cyB0byBYRU5TVE9SRV9SRUNPTk5FQ1QuDQo+IA0KPiBTaW5jZSB0aGUgZ3Vlc3QgbWFnaWMgcmVn
aW9uIGFsbG9jYXRpb24gZnJvbSBpbml0LWRvbTBsZXNzIGlzIGZvcg0KPiBYZW5TdG9yZSwgYW5k
IHRoZSBYZW5TdG9yZSBwYWdlIGlzIG5vdyBhbGxvY2F0ZWQgZnJvbSB0aGUgaHlwZXJ2aXNvciwN
Cj4gaW5zdGVhZCBvZiBoYXJkY29kaW5nIHRoZSBndWVzdCBtYWdpYyBwYWdlcyByZWdpb24sIHVz
ZQ0KPiB4Y19odm1fcGFyYW1fZ2V0KCkgdG8gZ2V0IHRoZSBYZW5TdG9yZSBwYWdlIFBGTi4gUmVu
YW1lIGFsbG9jX3hzX3BhZ2UoKQ0KPiB0byBnZXRfeHNfcGFnZSgpIHRvIHJlZmxlY3QgdGhlIGNo
YW5nZXMuDQo+IA0KPiBXaXRoIHRoaXMgY2hhbmdlLCBzb21lIGV4aXN0aW5nIGNvZGUgaXMgbm90
IG5lZWRlZCBhbnltb3JlLCBpbmNsdWRpbmc6DQo+ICgxKSBUaGUgZGVmaW5pdGlvbiBvZiB0aGUg
WGVuU3RvcmUgcGFnZSBvZmZzZXQuDQo+ICgyKSBDYWxsIHRvIHhjX2RvbWFpbl9zZXRtYXhtZW0o
KSBhbmQgeGNfY2xlYXJfZG9tYWluX3BhZ2UoKSBhcyB3ZQ0KPiAgICAgZG9uJ3QgbmVlZCB0byBz
ZXQgdGhlIG1heCBtZW0gYW5kIGNsZWFyIHRoZSBwYWdlIGFueW1vcmUuDQo+ICgzKSBGb3JlaWdu
IG1hcHBpbmcgb2YgdGhlIFhlblN0b3JlIHBhZ2UsIHNldHRpbmcgb2YgWGVuU3RvcmUgaW50ZXJm
YWNlDQo+ICAgICBzdGF0dXMgYW5kIEhWTV9QQVJBTV9TVE9SRV9QRk4gZnJvbSBpbml0LWRvbTBs
ZXNzLCBhcyB0aGV5IGFyZSBzZXQNCj4gICAgIGJ5IHRoZSBoeXBlcnZpc29yLg0KPiANCj4gVGFr
ZSB0aGUgb3Bwb3J0dW5pdHkgdG8gZG8gc29tZSBjb2Rpbmcgc3R5bGUgaW1wcm92ZW1lbnRzIHdo
ZW4gcG9zc2libGUuDQo+IA0KPiBSZXBvcnRlZC1ieTogQWxlYyBLd2FwaXMgPGFsZWMua3dhcGlz
QG1lZHRyb25pYy5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdhbmcgPHhpbi53YW5nMkBh
bWQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3Rh
YmVsbGluaUBhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVs
QGFtZC5jb20+DQoNCkkgdGVzdGVkIGFsbCAzIGNvbmZpZ3VyYXRpb25zOiByZWd1bGFyIGRvbVUg
YW5kIHN0YXRpYyBtZW0gZG9tVSB3XG8gZGlyZWN0IG1hcDoNClRlc3RlZC1ieTogTWljaGFsIE9y
emVsIDxtaWNoYWwub3J6ZWxAYW1kLmNvbT4NCg0Kfk1pY2hhbA0KDQo=

