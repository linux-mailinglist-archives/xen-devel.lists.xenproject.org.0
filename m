Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D996C860A9A
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 07:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684630.1064615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdOfY-0000RL-5v; Fri, 23 Feb 2024 06:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684630.1064615; Fri, 23 Feb 2024 06:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdOfY-0000Po-10; Fri, 23 Feb 2024 06:04:24 +0000
Received: by outflank-mailman (input) for mailman id 684630;
 Fri, 23 Feb 2024 06:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SdR/=KA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rdOfW-0000Pi-Js
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 06:04:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 624a535e-d211-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 07:04:20 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 06:04:16 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 06:04:14 +0000
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
X-Inumbo-ID: 624a535e-d211-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQZoSsZFK7i+Z0OJkr6Pw9M7wqMJxUyt0McpAIjhsxroK2rRd9iQ6PK5tO10A23vRmi2ufVZrrJN3936YQFST2uWrF1yFNs8oruAz7nB5UKuM6JhGWwwlUusYf7gkxHAA7SxyFOLX0fAuHWj2A2Fg5LYiy9tuRJLoawXkIrEZEJL6EtLN3vIfwZ2p1qAg6HOjpYf/GNjcM1OEQhas+q6NnwfUJyeGYaDPeZPAfu7VedCUyJhoP6pbdaDjAtm36qm4VTWSJnfcFTluI6yBpNMsb83QkcJv0vJwWKbcy8DGcd7D0l5DOFE7nACOkfv5JDcrPKWORoDPMDidk2GKHs08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6h8pS0n132sUF0hKdhZ2d9lg8e0IXpLC/UbvJyNzD50=;
 b=mRm+wW3v3ZlPrD1Tl41MNQ77bIIK4sHXXqMRrmOMEyFbGTU+fA2hIC8FURmAxA14KKW8DG8VQOY0rUk4Vffa0AHRcU62mGZyQh0jDEVaXYEuylgo59y9FlmZF4wlMiXWBk4ZnY2NaNCFclyTbTtBRcnc+LESZYvetnlyhm2WomeQh0pI78MjrjOo728SwsNs23lTWSKOo9looJ9L+5TSeVEIIfTSyIcsLIMLH/oFaaGMuLS83ZJV9wgbAXXxFVzrZfhi0tz4jep7fo80CpfZIg/enaiqeNQStGuG/o1s+FCzKywQG6w+jLlRZK1i5YVteHOu1KkU2TRssZ2MEmdPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6h8pS0n132sUF0hKdhZ2d9lg8e0IXpLC/UbvJyNzD50=;
 b=4mvV7D2lZNVLykxYg7yhll/kNPuxZ6SPVJIvQgehnw0eAKKNB/VOL9kG7c+yuHlQ3RrenTX2zESQwUo8/BDBcgzGuZWzbKz+w8kH9sHp1JEuKBlGHJ3enCuBFjNzUROucDzYISGV/CY3xnlLcDVBAEb+g8VrOQ/9oHUAfRGBvcs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v5 2/5] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
Thread-Topic: [RFC XEN PATCH v5 2/5] x86/pvh: Allow (un)map_pirq when dom0 is
 PVH
Thread-Index: AQHaRR6zD8fXe9R1qEqrvmeKDYHBArEXV7EAgADevoA=
Date: Fri, 23 Feb 2024 06:04:14 +0000
Message-ID:
 <BL1PR12MB58497693D450A36C84EE8B22E7552@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-3-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2402221632170.754277@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2402221632170.754277@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6150.namprd12.prod.outlook.com
 (15.20.7292.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|MW4PR12MB7440:EE_
x-ms-office365-filtering-correlation-id: c133f575-0025-49a1-afdc-08dc34354348
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WloyhT6puv2EpfsGWrCyWDJT454ZClmO9yAsRh8WJvFu4xZw6SYrqMvtiNIap7xC4tIafPoHnOGmBcy5c4IZUnnS0HRNZjqUffOiRUVewg/q6xN2auNVuBGaM/C/buASG8yHSLXxEkAHJIwT9mwwxRBLoDezU++Ir8oqEYOgUdVqGMVD9s2gTQhjBqSBZRazDbSKpAoOVk86ajJ5RP3863kFk+qTz3DULTonRfqqhkuLO1ge6qzsQ7296vRv3iiHzSn4im8yQogWUqbg6l9Rg/8ezx7quz4bFiXXSjb1dSZf5r4iOc5hOmWUeiFu+p745ehj/hxYbsIoT4X6POxjTxzPNvKmsDBF18BD4HjCaSPzX6YvNaLvAriedCdbQ4NyArlPQJ/5iH21CBYYVPScRnJzRD5vi2q3+oN1ZGWLAUY+3xg0YuRcVy7/pmlJIAzYxzpX2HJmLix/Yc9YcVX38Ta168d7GdjwRnC0br4UPrECbvQ+yDkYdGWMicafhDRuqSPeWwoQkRPKlErcpw2QYJ7jRQVKKc6FrxxSWY3s9OmIY/3bavk9GxkwaCRIG+a/4M5jFpz3GUzjnwwbdEyebc2nZnrUScGQ+WIMJbSsXPL+prGixd46HKTk6JHFyO82
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SkxiMVF3WFdlSmZMek9XbzJLd1VQNWpCaE9PNXg2d1NVcnBNWVMwUkZIVnVC?=
 =?utf-8?B?bVloUEtyMmt2RUJJV3h4VzN5eW1WVHgxcW5EZG1MeEJ0Unl0Zmc1alBiMjgz?=
 =?utf-8?B?Sm8xS3ZrNTR1clFEYUFxVXR5VE5LeW04Wk80YndtMVVCUUVPVjFSci9HNEtC?=
 =?utf-8?B?d0VOZ1F6ZzAvaHE5ZlJzNThJMXgrdXJyWGJJNzZLemx4ZWNVS1kvd0djU2NL?=
 =?utf-8?B?UmIyRGYxbmJUMEdXVEV0bDdKSmwzWTFYKzc0d0ludE9KVXZ0VEQwd0RicHFU?=
 =?utf-8?B?eWpXUUpmeDYyVkJDRVVKU01XRjdvWUQrOXZPd3ZCci9YKzlNMEQ3TDhrdExn?=
 =?utf-8?B?QURwRC9WbGlNRkJ0RlJReEdHMHVLd1FoWjhlUkhFL24zZ0hWbVZYaU9aaFNx?=
 =?utf-8?B?STFGODFla0J0RWg1bStnQXpqMnZCMHlVaXA3bXkrWFRBcVNmaWV5NGYyUUtB?=
 =?utf-8?B?SHpISUdSZ2x6eUcyc2theVRnTFFWMzVIVCs2R3lkSXdlS0lOVWROS2czRXVp?=
 =?utf-8?B?VWFCU2hJbjFvbTllcndKSmVPYTVVSDB2cER0ZVhINk5EUC9uMi9hQTE2MFRH?=
 =?utf-8?B?N3dUdXdLZEhUUlBrRUc2S2s3Ky9HMUJxYVBmbHJYSEN4ZWFFN0JuOUNlcjgv?=
 =?utf-8?B?cnlnSkg3ZGpYdHhXMDdGdnltM1JXSWs5ZXVSUW1iem1IVDVnLzV0c0xQWHh5?=
 =?utf-8?B?SG81dVgrdEt2ZEFmbjRMWGZRNndsZGhUdDlpQmx6SFZHNEludjgybVM3UUh5?=
 =?utf-8?B?SytjclNlZDFxd3p4aWFsNkp5Nk16WmN2c3VSdXFSZXdUK3NSYzYwd0Zhamh3?=
 =?utf-8?B?U2hlMUJjQUxWZEJza3NCWnUwSGRicXMvbVh0enZYQ0kzMVRkSXBNNk5UVXRY?=
 =?utf-8?B?WUI4RG9RMG10T2h3REZTVURSOTB0d1ZNSkdRdTFhZ1BQTThhMTVtK3c0Z2w1?=
 =?utf-8?B?ZnFKbUJZNFc5UnIzOFNsT0hVSUpHN0FUaTZVM3F1K29lSWxIczJmTU90Tk4r?=
 =?utf-8?B?d1FLaFhRZXRWUnIwNkp6YW9JWm9NRTdSRElyUkYyeUhmL2Z2eExYVFdiRG5F?=
 =?utf-8?B?TWEwNGJkei90dUVodk1LU0FGYkNaZkc4OGxWSzRXMUtxdnRldURmYi91dmND?=
 =?utf-8?B?UjNGMHQ3dk9ZREYrcnhidGE3Y0NjeUN1YzA0U3l3aG5PUXQ5VFV3aDRoeWR6?=
 =?utf-8?B?VFpvVjFVeGcxLzVKOEZmWmZFVCttajhRSWlwTHFvdnA4eHNiSmVFTVg0VXY2?=
 =?utf-8?B?OWhyQXFXS0dJUXdIa01CUXNiOVRVdUYzYVdCbjZONkZXbzJ5MmNGSFpsNlkv?=
 =?utf-8?B?YTdpSzgzd29qYVJmTjAvTHZJZ0NGeW9MeFF6K0lxcGpndnlFQUtiL3QvUkUw?=
 =?utf-8?B?WE9UWXpld2VaT2p5T2pqTTdJemZYd09PRnViNWtXU0ZtNGU0T0ZQS21VdjVy?=
 =?utf-8?B?NEo3amNVRXZCTWNiUGkvUlQ1UERsT1FPMXVuM2xuOXhldWJEWWV1cTZPU2gz?=
 =?utf-8?B?enNGSnFDdzYzWnc4UGxHakpNZHBLQjJIM0s0U2tyMlcxRTBLUDZGeGxGTFJR?=
 =?utf-8?B?MjVhV1R6OFdEaW5kZmJuMERlVzZ4Kzd0cE1wdGphZzVTam1XakZhWWJPMXRS?=
 =?utf-8?B?RHJIQU55YnN0di9ZR3FJcys1T0kxTFp1UUgraktGWlpBSGdwMFZUOERoeGl3?=
 =?utf-8?B?bUpZODZlZXo5Lzg5WVBqTzZOWGFLMUU4VW5BMnNxdkRISkp1MkVTcE0wT25G?=
 =?utf-8?B?N0EzWUo0SDFUUTFBa2FnQ0doL0lIRU1zWEU0WUpCUUJPM0V2S2xuM01tZVlJ?=
 =?utf-8?B?V0R2aDh4LzdaWVhlWTJvbHAvVGFtSTZNanJIWE1OZDBXMWJlMzh4YkViUDFW?=
 =?utf-8?B?ajM3aGUya1dpZHdLOFBOdVk4b0Q1YlY1TGQzR3ZlWWZhR2lWZDJMQUFqb1VB?=
 =?utf-8?B?QW1GRFAzRXh3NWVCekpkL3VIL0xDcU9UZGFuRHdVaVVEZ0dUYUh1WStMYTNx?=
 =?utf-8?B?cktyZDdvcWs0K3k5dWc5UVB3UDFlRUpXc0NWQjk3T1FVeW5rbU5mSURZc1lq?=
 =?utf-8?B?MWNsYktFUmlZdE9YMTZBMG42aTFLeG5SU0NCMHhzMEVaODc1a2J0bmRFUE9x?=
 =?utf-8?Q?VySM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95985E6D6ED7F748BDC67DEEF2164EEB@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c133f575-0025-49a1-afdc-08dc34354348
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 06:04:14.6085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tk/NZn0GNcirDsb972nYzWPkKEJzyu5sEHQu1O/7KuUBd1DEVoJhaVBgQfghIJa7iIBwB7/UKVXf/Sevdl2pBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440

T24gMjAyNC8yLzIzIDA4OjQwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIEZyaSwg
MTIgSmFuIDIwMjQsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gSWYgcnVuIFhlbiB3aXRoIFBWSCBk
b20wIGFuZCBodm0gZG9tVSwgaHZtIHdpbGwgbWFwIGEgcGlycSBmb3INCj4+IGEgcGFzc3Rocm91
Z2ggZGV2aWNlIGJ5IHVzaW5nIGdzaSwgc2VlDQo+PiB4ZW5fcHRfcmVhbGl6ZS0+eGNfcGh5c2Rl
dl9tYXBfcGlycSBhbmQNCj4+IHBjaV9hZGRfZG1fZG9uZS0+eGNfcGh5c2Rldl9tYXBfcGlycS4g
VGhlbiB4Y19waHlzZGV2X21hcF9waXJxDQo+PiB3aWxsIGNhbGwgaW50byBYZW4sIGJ1dCBpbiBo
dm1fcGh5c2Rldl9vcCwgUEhZU0RFVk9QX21hcF9waXJxDQo+PiBpcyBub3QgYWxsb3dlZCBiZWNh
dXNlIGN1cnJkIGlzIFBWSCBkb20wIGFuZCBQVkggaGFzIG5vDQo+PiBYODZfRU1VX1VTRV9QSVJR
IGZsYWcsIGl0IHdpbGwgZmFpbCBhdCBoYXNfcGlycSBjaGVjay4NCj4+DQo+PiBTbywgYWxsb3cg
UEhZU0RFVk9QX21hcF9waXJxIHdoZW4gZG9tMCBpcyBQVkggYW5kIGFsc28gYWxsb3cNCj4+IFBI
WVNERVZPUF91bm1hcF9waXJxIGZvciB0aGUgZmFpbGVkIHBhdGggdG8gdW5tYXAgcGlycS4gQW5k
DQo+PiBhZGQgYSBuZXcgY2hlY2sgdG8gcHJldmVudCBzZWxmIG1hcCB3aGVuIGNhbGxlciBoYXMg
bm8gUElSUQ0KPj4gZmxhZy4NCj4+DQo+PiBDby1kZXZlbG9wZWQtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNo
ZW5AYW1kLmNvbT4NCj4+IC0tLQ0KPj4gIHhlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgfCAg
MiArKw0KPj4gIHhlbi9hcmNoL3g4Ni9waHlzZGV2LmMgICAgICAgfCAyMiArKysrKysrKysrKysr
KysrKysrKysrDQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMgYi94ZW4vYXJjaC94ODYv
aHZtL2h5cGVyY2FsbC5jDQo+PiBpbmRleCA2YWQ1YjRkNWYxMWYuLjQ5Mzk5OGI0MmVjNSAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+IEBAIC03NCw2ICs3NCw4IEBAIGxvbmcgaHZtX3Bo
eXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAg
ICAgIHsNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfbWFwX3BpcnE6DQo+PiAgICAgIGNhc2UgUEhZ
U0RFVk9QX3VubWFwX3BpcnE6DQo+PiArICAgICAgICBicmVhazsNCj4+ICsNCj4+ICAgICAgY2Fz
ZSBQSFlTREVWT1BfZW9pOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9pcnFfc3RhdHVzX3F1ZXJ5
Og0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9nZXRfZnJlZV9waXJxOg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMgYi94ZW4vYXJjaC94ODYvcGh5c2Rldi5jDQo+PiBpbmRl
eCA0N2M0ZGEwYWY3ZTEuLjdmMjQyMmMyYTQ4MyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9waHlzZGV2LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9waHlzZGV2LmMNCj4+IEBAIC0zMDMs
MTEgKzMwMywyMiBAQCByZXRfdCBkb19waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycTogew0K
Pj4gICAgICAgICAgcGh5c2Rldl9tYXBfcGlycV90IG1hcDsNCj4+ICAgICAgICAgIHN0cnVjdCBt
c2lfaW5mbyBtc2k7DQo+PiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gIA0KPj4gICAg
ICAgICAgcmV0ID0gLUVGQVVMVDsNCj4+ICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZt
YXAsIGFyZywgMSkgIT0gMCApDQo+PiAgICAgICAgICAgICAgYnJlYWs7DQo+PiAgDQo+PiArICAg
ICAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChtYXAuZG9taWQpOw0KPj4gKyAgICAg
ICAgaWYgKCBkID09IE5VTEwgKQ0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7DQo+PiAr
ICAgICAgICBpZiAoICFpc19wdl9kb21haW4oZCkgJiYgIWhhc19waXJxKGQpICkNCj4gDQo+IEkg
dGhpbmsgdGhpcyBjb3VsZCBqdXN0IGJlOg0KPiANCj4gICAgIGlmICggIWhhc19waXJxKGQpICkN
Cj4gDQo+IFJpZ2h0Pw0KTm8uIEluIHRoZSBiZWdpbm5pbmcsIEkgb25seSBzZXQgdGhpcyBjb25k
aXRpb24gaGVyZSwgYnV0IGl0IGRlc3Ryb3llZCBQViBkb20wLg0KQmVjYXVzZSAgUFYgaGFzIG5v
IHBpcnEgZmxhZyB0b28sIGl0IGNhbiBtYXRjaCB0aGlzIGNvbmRpdGlvbiBhbmQgcmV0dXJuIC1F
T1BOT1RTVVBQLCBQSFlTREVWT1BfbWFwX3BpcnEgd2lsbCBmYWlsLg0KDQo+IA0KPiANCj4+ICsg
ICAgICAgIHsNCj4+ICsgICAgICAgICAgICByY3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+ICsgICAg
ICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBy
Y3VfdW5sb2NrX2RvbWFpbihkKTsNCj4+ICsNCj4+ICAgICAgICAgIHN3aXRjaCAoIG1hcC50eXBl
ICkNCj4+ICAgICAgICAgIHsNCj4+ICAgICAgICAgIGNhc2UgTUFQX1BJUlFfVFlQRV9NU0lfU0VH
Og0KPj4gQEAgLTM0MSwxMSArMzUyLDIyIEBAIHJldF90IGRvX3BoeXNkZXZfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgDQo+PiAgICAgIGNhc2UgUEhZ
U0RFVk9QX3VubWFwX3BpcnE6IHsNCj4+ICAgICAgICAgIHN0cnVjdCBwaHlzZGV2X3VubWFwX3Bp
cnEgdW5tYXA7DQo+PiArICAgICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gIA0KPj4gICAgICAg
ICAgcmV0ID0gLUVGQVVMVDsNCj4+ICAgICAgICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZ1bm1h
cCwgYXJnLCAxKSAhPSAwICkNCj4+ICAgICAgICAgICAgICBicmVhazsNCj4+ICANCj4+ICsgICAg
ICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lkKHVubWFwLmRvbWlkKTsNCj4+ICsgICAg
ICAgIGlmICggZCA9PSBOVUxMICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVTUkNIOw0KPj4g
KyAgICAgICAgaWYgKCAhaXNfcHZfZG9tYWluKGQpICYmICFoYXNfcGlycShkKSApDQo+IA0KPiBz
YW1lIGhlcmUNCj4gDQo+IA0KPiBPdGhlciB0aGFuIHRoYXQsIGV2ZXJ5dGhpbmcgbG9va3MgZmlu
ZSB0byBtZQ0KPiANCj4gDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmN1X3VubG9j
a19kb21haW4oZCk7DQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPj4gKyAg
ICAgICAgfQ0KPj4gKyAgICAgICAgcmN1X3VubG9ja19kb21haW4oZCk7DQo+PiArDQo+PiAgICAg
ICAgICByZXQgPSBwaHlzZGV2X3VubWFwX3BpcnEodW5tYXAuZG9taWQsIHVubWFwLnBpcnEpOw0K
Pj4gICAgICAgICAgYnJlYWs7DQo+PiAgICAgIH0NCj4+IC0tIA0KPj4gMi4zNC4xDQo+Pg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

