Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6CACFE7F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008194.1387422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSgK-0005tW-K5; Fri, 06 Jun 2025 08:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008194.1387422; Fri, 06 Jun 2025 08:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSgK-0005qh-HH; Fri, 06 Jun 2025 08:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1008194;
 Fri, 06 Jun 2025 08:44:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg/F=YV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uNSgI-0005qQ-Ke
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:44:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675b8dcb-42b2-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:44:05 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9281.namprd12.prod.outlook.com (2603:10b6:610:1c8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 08:44:02 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8792.034; Fri, 6 Jun 2025
 08:44:02 +0000
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
X-Inumbo-ID: 675b8dcb-42b2-11f0-a301-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV1Wnv0AHnWdznHQGD1RzOI16qSApVICcjPpsvr0t/5LI0WmNXDhR4KggUeDDYWyCpLdUxniyLUrQU48RUrwEYidi6QKg+XH+E66kWnkwxLXZm2yfxUbUSVvXYi2Vc1D66x02ZIHqaB+IIghm/A5Bhqwi85O+7pgpg8MuMAswZYsQxumoSa0UGednUeOLNe4BitVuef0tE/6c3WQOt26pZBhkjiBBDieQ6zlXOsQ7pZ/rbfdApZ1uESA+nMOvL7IKxFUu2KcjtGoziuyjVX9k8k8tzHFy67JEur/f5GWgR5L8e73wFV+z6LTAQp3SRcP47nH07+z4mn0H8g+BVKNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io3dMfdBKgUW1y+TKqfLJgdQwWxKRLi6oYFFFcNT3/w=;
 b=ABcKmXvt6alBurM9+8+wa/vVGadLezhjSwiOSp2D0AuZhkdVu1kY5bYNITfoSWAIuW4NKIFcqIRBwvzsg4Td4DgjxSoUBgY4ee1O7QKHE9wUfFTaDjN8gM+CaXHj5iPJ0ZGqEyrP+0YqifX5YWVHzENllZjm6hgu7pNt17FNdTYAAlcsAeGSiFr1RNWk+3jwzMGQ036DREFTdKkVn4ez2mf6s53S8qfojfogwqc4S13V96dHsBNJ6Hfmhir/BSYl7eIhJkO0W5aOHvkXU2sqAdYGhfXrxyezENXM5g++X+ogkyOTy5bMj9YmySIHsFEI0s8df0xuaYu6U8J9FeDuNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io3dMfdBKgUW1y+TKqfLJgdQwWxKRLi6oYFFFcNT3/w=;
 b=Kad+RJRDSlhNLK/ermAFfkmvhDekUmH3JkScLPwoWnAhQOxXUXsEc4EXBF+FOd34IYSrE40YM+7tMINmALf6pfJxTOTmldfER1CiJnI9S9M+DkEc/qdzH8gOwEC5CTYY2rKc10jNNxMWRwk2J+ZbpdN2acc+zJDuLY/hnV0sHLI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v5 10/10] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Topic: [PATCH v5 10/10] vpci/msix: Free MSIX resources when init_msix()
 fails
Thread-Index: AQHbziMTqeagkRx4hES1pSa65nFeRrP0wkuAgAGlSYA=
Date: Fri, 6 Jun 2025 08:44:02 +0000
Message-ID:
 <BL1PR12MB584978D30E02C9D535AF912BE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-11-Jiqian.Chen@amd.com>
 <aEG482WJWGu_ZHQ6@macbook.local>
In-Reply-To: <aEG482WJWGu_ZHQ6@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8792.033)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9281:EE_
x-ms-office365-filtering-correlation-id: 134a3f3b-3294-406e-da7d-08dda4d64991
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NjJaYWlpMjEzTlhMQ01Ycnd1RU9yN2Uxc0hoNG5hV1VQZGhFeGxhQWdSbURS?=
 =?utf-8?B?Ykl2YjJJUlVySnBsVjVvdmZpakl6NWRpZkxENk53cDJIakRsK2F0MVVwRGVG?=
 =?utf-8?B?MXMxYU9aK21kSWl1Tk1XOTVZdlo4T3NSc2dzTmRGd09IRGJrTDlJODVVdWxN?=
 =?utf-8?B?QzJ6OEIyYkhqUm1XQkN5YTNRQnByNWlsMmNlNFp3bkZZSHhBVkgwUGtMTVp5?=
 =?utf-8?B?YUpRNkpoRUlucmkzZEgwVjFKNDhBWEl3UUUrTzZaM0RlZnFtSU9FQXcxWStk?=
 =?utf-8?B?ZWE2cmpXeElPL1M0RWxSN2FHTG5DNzlJUEo3Tit0Q3JrQXNvNmNoY1h1R0JT?=
 =?utf-8?B?eHc3MHpBM3dSeHhHZ0dsdDdVUHNMYnhsYlAzZWZjdnp4TWJOd3gyUS91RTJ2?=
 =?utf-8?B?QlI2SWcvdUpvVDlEK0JySFVXYkNqamZ6QkI1WUQ2amdxaTQvbWpZUkNEVEdX?=
 =?utf-8?B?V0hLOXMzdnZxTURmNWQ3aFluVzMvdVplWTM4NnZGQy9HVS9SaWphNGlhZEgw?=
 =?utf-8?B?bUlDUEtyN3JtOEkyR0NST0hyVmZmRGdWY09UNnZtOU9xVTRsLzRyMDhmTnpr?=
 =?utf-8?B?RFFYQTZuaEUrbkdsbHdUOXhmdzh1RmV1ZlBEb3hiamRCVWVFcG9EdDY3R2xN?=
 =?utf-8?B?em9oM1RFaWFod0JBOUhVRzJoOWEzWnhlWEk5elFncjhIMXdIMjVnbTd1Wmho?=
 =?utf-8?B?MWR6VzBsV0JXekNIRjdNOVhSeWVmd1RDcWRVN1ZyTzdndjYrMmpJSkN0L25a?=
 =?utf-8?B?VXBsSnFhdGkwZ2h2R2F5YWhWRkZNL3NjS2dnWVdWdG9qNmpPNFNTMU1hNFIw?=
 =?utf-8?B?aDVqT2pQYXRBTjAxL1lEMGEzbzlsT3gzK0dKMXVNUmJmSGFUU3NuRWF0Rm9R?=
 =?utf-8?B?aUdEU1ExRlVnZGs2c0Fha0c1MndMSU5sai8rR29TVGVMWmsyK056UlprQ3Jt?=
 =?utf-8?B?UVJRNkY4MlErb01lMDMxMTdockFLb3lUelVUN2hkbm1JRG9iNVZUSU45Q2di?=
 =?utf-8?B?Y2NNNHN6ZVlVMGZMTVJ2cHpXVnpXZ0ZzSG9idW4zeFBUVUN0Sm9ROEMxNXAr?=
 =?utf-8?B?dEg5SElXM1I4UFd6UWxFaHpGZkg3WExkRmppNjFjek16L25FMnU4QUVRZDE2?=
 =?utf-8?B?bFBvUHhTcWVFdjdKdXBFU2tkR0VtVngybjJtMTZQKy9CQnZSY2lNbmpJdGwx?=
 =?utf-8?B?cXlsTzVMZ3hUQnlCNDhkdGxGeTQrdkdkZjVPQUVNOG80ZjR2T1QwN09MK2Qr?=
 =?utf-8?B?Q0syd3FjbnkwZ2VTaFVHUUZRU1huVVY0bWNkYTlqR3VhU0hvSHJ0WXo4K0NX?=
 =?utf-8?B?TitqeVRUblRsalBhV1pCZlB3L2VrMXlZV2dkOUc4T3V2ZEJOTjBhY0RNeU9L?=
 =?utf-8?B?REdHbklVMnVmbmEzTmdVUjhTaEVNRVlSM0xaYWdFSm9ET0hxazlDQWw1dzdU?=
 =?utf-8?B?ckJnS2U5OERiSkJHQW1IeDhlVzNKaXVRMWUrTmUyRDA2WXBiTkN5aGhnMHZX?=
 =?utf-8?B?ODJIQW4waUVUK0xrWmtwYkluV041MDQ3M0x5aTNwK3MxdVNJT0hCdWVnZmFY?=
 =?utf-8?B?RC8xM253NitrTmVFc05QSFdmemV4M0F5NjM5WnZDSDl3NW5lanNGcm50SXN5?=
 =?utf-8?B?QWM2TlhCblZyV09ROThGVmQyVzBZMVF0QzhyU1d6QzRKbndJd2xZMGJBZ0ZV?=
 =?utf-8?B?M0hGS0VVelkySEZmYzFPcmF5aWc4QkhXK0NwVEg3ajlTS1QvN2hpNVhpeEta?=
 =?utf-8?B?TkhjNmkvSWdhdmo2dE1NUlM1eDRWc254SnY2UVlUdUovU0UveHVvS3YrbkxB?=
 =?utf-8?B?UEtnRVl4UytaK2d2Y3BIN0ViOUgrRFM5Y2Rlbjh6d3NBVEE2b1E5VXVjSXY2?=
 =?utf-8?B?Qi94Z2VoTFZNa1pYeGZad09uTzBrUWlTeVdOck1YajhSWm5KZ2pSc0tHRkxk?=
 =?utf-8?B?bGV3eXMyRGtvVlg0ek12c0c2R1JPU2ZPY29ZWHErUmE0KzBSQnNscFhseVkx?=
 =?utf-8?Q?XWntnhfXHEkKF3klu4uxbVRZaVG4TY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WFlPZkY3dUJQVjd4NU1rZmJqTHQ1cmlpaW05UEcrdlJZWVhkazNxMENRZ291?=
 =?utf-8?B?VEptdTRuci9XQ3pqQU5lTEJXM1JHY1U3a2h2WWdTU2RWSGlIVzBXVk5iOUtY?=
 =?utf-8?B?MUk5RnJnVkEzWFFIeEI0OFJ4MEdwM3ZXMGRRT3lLVUZkMUIwWTgrNkQ1cHdM?=
 =?utf-8?B?VGM5TklRNjN3dEh3V0NFams1T0o3S3pDL2x6V0NvQ3M4akVudHQxWXhLMklL?=
 =?utf-8?B?WGd5Q1pNV0NtMnAySGttLzEyK2prQWV4NlB2Slowelg1UytGVHhaV2tZZFRC?=
 =?utf-8?B?OXZvdXJuRWo3SDN1NDV4U2xMMGNNVlh3amlLUFFEZjZINng3dlZCZE9wcmd6?=
 =?utf-8?B?S3ZCTmIwRncwbVNGRkJxS0xLb25icFF6RXVTbjg5MnFvOUZqV0xGajFoV1RX?=
 =?utf-8?B?QjE5cUUwc1czYXlydVBHWGh4RjRCQkhwTEhuQ01SUE5YS3IzWGxqenpKd0pi?=
 =?utf-8?B?YmZwQ0lxUEZUTnMxNnVwSGgvNS82MzNIZkdKS2FNWSsvUGNIckk1ajFvdHRF?=
 =?utf-8?B?c1dTQ0wySllQb0Y5ZVRHVVJvUElDVkV6b0dmRUNJV1kyeFBKNXA1RW1haU9J?=
 =?utf-8?B?ci9QS29EOUwybjdpcU9PbXBhVnF5VHNrSUNHVEtFbjBreUdXcWVBQ0hiTE1l?=
 =?utf-8?B?YXRKaU5BelZ1QzllUXQyeHdvTVJ0akZMZktIVTg3MVdrb3lFaFErcm1MNGxn?=
 =?utf-8?B?UHp2L1V2SnRFUEY1MXNWUFc2RW9PWi9nSGM1YjRZM2NVWnVqNkFOeGd2WUpD?=
 =?utf-8?B?VE1NTUFOeVZqZ1lncGZLQlpuemVCRlBjRjAzcDdzTFdpenI5QUJxTVVBQzJI?=
 =?utf-8?B?ajhCbHF5cGJkM1A5WkgzZ3NSczRiRFpyWXFNcVpsRytINEJvMktRWjBMaEF2?=
 =?utf-8?B?NTNxSEZmMjhHV0lTM0M4c29VSzNXUTFGZktLbkNKc09oS1puUUFMeUJGWFQy?=
 =?utf-8?B?Q2JwcXVUQzNvK1VFTzI2OUpIZFNtWWlUdWhFekVzdGFSdnpqYUFncjdKbzBY?=
 =?utf-8?B?S25TNURHZTYxclgxejBaRzRxWUtVNGlRWU9Kb1U1amo4bDJUVEExWlByN2ln?=
 =?utf-8?B?c0E0R0JUNTBpZ1hlVG9vUDU1SzI1cDBvMVJyZ3FWd3hSRkthMGN1Q0V5R3Zp?=
 =?utf-8?B?OG9ZOVl1elRvc3dVdW94anZBcXdGVVkxQzcvekZWRXhrK0FENit2T1NocWNv?=
 =?utf-8?B?ajVObEVRTHRXcjZGRkt0U3Z6SXEwTVdGbUwzTnZGU2ttdGdxVXVPQWdkTTUx?=
 =?utf-8?B?aU1PclJwWUdEVE9MSC9MRHl5R21UdXZGdU95MzUzalJ3NjZHOTF0cDVkdmFV?=
 =?utf-8?B?cFFEME9GcFNJVzk1cTg3bkYrR0w0TTdhZnIrU3ZtS2tXV1dWL29WbHBJV2lx?=
 =?utf-8?B?QmYzRlBVNjVrWTg5blNXWTQ1QmMzSHhxY3AzOXlNVFd0cjl6ZjBkTyt0bW12?=
 =?utf-8?B?QUZQMGJDME81OWMrVHlEOTUvRFFOK3ZtbU9nUWJoNGZHU2RGRFc2R0RMdTZ1?=
 =?utf-8?B?bFI4NGYxRENuNWhkM09wd1NBS0kzSDlsOEQwT2c4VDlVM2VLOHg5aHFVbzFa?=
 =?utf-8?B?S09zWmd4OU4zWFhyNXV4VnJiTjdWNEFVVEtHYXVUUE4rNjVMVmRScVUrazF6?=
 =?utf-8?B?emgrNzBOMEsrRTNhV25NY2paM1NuM2hNTEh2NE5hZ1E1SXlnb0hTL1BvL2kz?=
 =?utf-8?B?aFBGTE8wa3pxQnNQM0QraDdmWlp4SjB6TDBGelpwSDVaTENiSmxJbUxaMXNQ?=
 =?utf-8?B?elZaYzJuSm53YksxTk5nUnRVeERRbHIyU2lBVURRT3VOM3BtWDRhTFVJaStl?=
 =?utf-8?B?MmI1cXVubmYvNU40UEhXZWV4MmRFTktRaFpMZGlFTFBDaFowOE1hRStDU1Vs?=
 =?utf-8?B?VVpvWmdnRTRrQUFRM2hvZG5YMVl0L0R5My9zOHNnOGRBbXc5V0VxVUtKMW8w?=
 =?utf-8?B?eURDVnM0MGwrTVc1S3dZNkk0TCt6VksxdWZ6WDBKbFphMkljbEVhYUpOdmtF?=
 =?utf-8?B?aXc3VHRTTlNuNVgvQnRJZGhhTTJnKzZDK2U2U2t5enhFQzRrdHUwdm9zVVps?=
 =?utf-8?B?SXdwZ2NSNEdYajNjNkFINHZLdTRXSjhkQURPNk1TVnBRejNLUTNNZlovN0lT?=
 =?utf-8?Q?O3QQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <89DCB45A0A219743B122B6FA3E669B90@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134a3f3b-3294-406e-da7d-08dda4d64991
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 08:44:02.0635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gG/m0ruOBX1h8QNebW0GUAJBsFrig82iS646+sBW+LTVaRUR6+RSxrJoRAYjbpvf2ZxX3EDvyMIKc8d1ghGcaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9281

T24gMjAyNS82LzUgMjM6MzQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIE1vbiwgTWF5
IDI2LCAyMDI1IGF0IDA1OjQ1OjU5UE0gKzA4MDAsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hl
biBpbml0X21zaXgoKSBmYWlscywgY3VycmVudCBsb2dpYyByZXR1cm4gZmFpbCBhbmQgZnJlZSBN
U0lYLXJlbGF0ZWQNCj4+IHJlc291cmNlcyBpbiB2cGNpX2RlYXNzaWduX2RldmljZSgpLiBCdXQg
dGhlIHByZXZpb3VzIG5ldyBjaGFuZ2VzIHdpbGwNCj4+IGhpZGUgTVNJWCBjYXBhYmlsaXR5IGFu
ZCByZXR1cm4gc3VjY2VzcywgaXQgY2FuJ3QgcmVhY2gNCj4+IHZwY2lfZGVhc3NpZ25fZGV2aWNl
KCkgdG8gcmVtb3ZlIHJlc291cmNlcyBpZiBoaWRpbmcgc3VjY2Vzcywgc28gdGhvc2UNCj4+IHJl
c291cmNlcyBtdXN0IGJlIHJlbW92ZWQgaW4gY2xlYW51cCBmdW5jdGlvbiBvZiBNU0lYLg0KPj4N
Cj4+IFRvIGRvIHRoYXQsIGltcGxlbWVudCBjbGVhbnVwIGZ1bmN0aW9uIGZvciBNU0lYLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPiAN
Cj4gDQo+IA0KPj4gLS0tDQo+PiBjYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4+IC0tLQ0KPj4gdjQtPnY1IGNoYW5nZXM6DQo+PiAqIENoYW5nZSBkZWZpbml0
aW9uICJzdGF0aWMgdm9pZCBjbGVhbnVwX21zaXgiIHRvICJzdGF0aWMgaW50IGNmX2NoZWNrIGNs
ZWFudXBfbXNpeCIgc2luY2UgY2xlYW51cCBob29rIGlzIGNoYW5nZWQgdG8gYmUgaW50Lg0KPj4g
KiBBZGQgYSByZWFkLW9ubHkgcmVnaXN0ZXIgZm9yIE1TSVggQ29udHJvbCBSZWdpc3RlciBpbiB0
aGUgZW5kIG9mIGNsZWFudXBfbXNpeCgpLg0KPj4NCj4+IHYzLT52NCBjaGFuZ2VzOg0KPj4gKiBD
aGFuZ2UgZnVuY3Rpb24gbmFtZSBmcm9tIGZpbmlfbXNpeCgpIHRvIGNsZWFudXBfbXNpeCgpLg0K
Pj4gKiBDaGFuZ2UgdG8gdXNlIFhGUkVFIHRvIGZyZWUgdnBjaS0+bXNpeC4NCj4+ICogSW4gY2xl
YW51cCBmdW5jdGlvbiwgY2hhbmdlIHRoZSBzZXF1ZW5jZSBvZiBjaGVjayBhbmQgcmVtb3ZlIGFj
dGlvbiBhY2NvcmRpbmcgdG8gaW5pdF9tc2l4KCkuDQo+Pg0KPj4gdjItPnYzIGNoYW5nZXM6DQo+
PiAqIFJlbW92ZSB1bm5lY2Vzc2FyeSBjbGVhbiBvcGVyYXRpb25zIGluIGZpbmlfbXNpeCgpLg0K
Pj4NCj4+IHYxLT52MiBjaGFuZ2VzOg0KPj4gbmV3IHBhdGNoLg0KPj4NCj4+IEJlc3QgcmVnYXJk
cywNCj4+IEppcWlhbiBDaGVuLg0KPj4gLS0tDQo+PiAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMg
fCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAy
OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvbXNpeC5jIGIveGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMNCj4+IGluZGV4IDY3
NDgxNWVhZDAyNS4uY2Y3OTMyMGQzYjZmIDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9tc2l4LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvbXNpeC5jDQo+PiBAQCAtNjU1LDYg
KzY1NSwzMyBAQCBpbnQgdnBjaV9tYWtlX21zaXhfaG9sZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+ICAgICAgcmV0dXJuIDA7DQo+PiAgfQ0KPj4gIA0KPj4gK3N0YXRpYyBpbnQgY2Zf
Y2hlY2sgY2xlYW51cF9tc2l4KHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAg
aW50IHJjOw0KPj4gKyAgICBzdHJ1Y3QgdnBjaSAqdnBjaSA9IHBkZXYtPnZwY2k7DQo+PiArICAg
IGNvbnN0IHVuc2lnbmVkIGludCBtc2l4X3BvcyA9IHBkZXYtPm1zaXhfcG9zOw0KPj4gKw0KPj4g
KyAgICBpZiAoICFtc2l4X3BvcyApDQpOZWVkIHRvIGNoYW5nZSB0aGlzIGNoZWNrIGFzIHByZXZp
b3VzIHBhdGNoLCBJIHRoaW5rLg0KDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsg
ICAgcmMgPSB2cGNpX3JlbW92ZV9yZWdpc3RlcnModnBjaSwgbXNpeF9jb250cm9sX3JlZyhtc2l4
X3BvcyksIDIpOw0KPj4gKyAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+
ICsNCj4+ICsgICAgaWYgKCAhdnBjaS0+bXNpeCApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4g
DQo+IFlvdSBjYW5ub3Qgc2hvcnQtY2lyY3VpdCBoZXJlLCBhcyBpdCB0aGVuIHByZXZlbnRzIGFk
ZGluZyB0aGUgZHVtbXkNCj4gaGFuZGxlcnMgZG9uZSBpbiB0aGUgbGFzdCByZXR1cm4uDQo+IA0K
Pj4gKw0KPj4gKyAgICBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZw
Y2ktPm1zaXgtPnRhYmxlKTsgaSsrICkNCj4+ICsgICAgICAgIGlmICggdnBjaS0+bXNpeC0+dGFi
bGVbaV0gKQ0KPj4gKyAgICAgICAgICAgIGlvdW5tYXAodnBjaS0+bXNpeC0+dGFibGVbaV0pOw0K
Pj4gKw0KPj4gKyAgICBsaXN0X2RlbCgmdnBjaS0+bXNpeC0+bmV4dCk7DQo+PiArICAgIFhGUkVF
KHZwY2ktPm1zaXgpOw0KPj4gKw0KPj4gKyAgICByZXR1cm4gdnBjaV9hZGRfcmVnaXN0ZXIocGRl
di0+dnBjaSwgdnBjaV9od19yZWFkMTYsIE5VTEwsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBtc2l4X2NvbnRyb2xfcmVnKG1zaXhfcG9zKSwgMiwgTlVMTCk7DQo+IA0KPiBUaGUg
YWJvdmUgbmVlZHMgdG8gYmUgYWRkZWQgZXZlbiBpZiAhdnBjaS0+bXNpeC4NCk9oLCByaWdodC4N
Ckkgd2lsbCBjaGFuZ2UgdG8NCg0KICAgIGlmICggdnBjaS0+bXNpeCApDQogICAgew0KICAgICAg
ICBmb3IgKCB1bnNpZ25lZCBpbnQgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZwY2ktPm1zaXgtPnRh
YmxlKTsgaSsrICkNCiAgICAgICAgICAgIGlmICggdnBjaS0+bXNpeC0+dGFibGVbaV0gKQ0KICAg
ICAgICAgICAgICAgIGlvdW5tYXAodnBjaS0+bXNpeC0+dGFibGVbaV0pOw0KDQogICAgICAgIGxp
c3RfZGVsKCZ2cGNpLT5tc2l4LT5uZXh0KTsNCiAgICAgICAgWEZSRUUodnBjaS0+bXNpeCk7DQog
ICAgfQ0KDQogICAgcmV0dXJuIHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdf
cmVhZDE2LCBOVUxMLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2l4X2NvbnRyb2xf
cmVnKG1zaXhfcG9zKSwgMiwgTlVMTCk7DQoNCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0KLS0g
DQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

