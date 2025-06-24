Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB6AE5F6B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 10:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023385.1399367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz5I-0003h7-3h; Tue, 24 Jun 2025 08:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023385.1399367; Tue, 24 Jun 2025 08:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTz5I-0003eK-0K; Tue, 24 Jun 2025 08:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1023385;
 Tue, 24 Jun 2025 08:32:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vj6t=ZH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uTz5F-0001zK-W9
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 08:32:49 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2417::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd4e9db0-50d5-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 10:32:46 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 08:32:40 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Tue, 24 Jun 2025
 08:32:40 +0000
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
X-Inumbo-ID: cd4e9db0-50d5-11f0-a30f-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0TfRwBadpRQ0VsfioR97EMC/EEP/I5cueS5zLo5UXWNO0dTsdOQXgjlu3oT5y+0WX2K7Clg1spZuUCV5tZ5IQHaVHQIzfG1W4buTrZHRnAT4M/9Nd9me8w8nt+y+jWc8Q+K6YICQfTp/uWacTEvWTfW7l4GKJiO71//YA6kOzdFXG4qUnMgy8IrP2GyYox60JmIZigVPdXyQ4F1EeUK+fxEBe2CItnWWvPtdplEGshbDR2JzMLHRJPjUYiD30vsTE6cPx9NoniiPKpHAKHlCcPW1SrGXlzGvLFnPk8R8UsjS2FpZv0oHx4UVDyIAbc3lIByPL2YkliVLBtfbmSlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riykvut66DTxk6YJ7YMoyfqs5HLJBG2e0oJy/dPBol8=;
 b=tKoyQGhy1JH8L1juuFwoAoWedcBMBG2MVQ5Yl8H7KJNBRpvaXFQxn54rUruotAuqnZQc2Q4meWOYX+YlxjKCLWuc93JY/6R5A5elEqNKB4TfSY2YhUxkV9d7toOngIibp6IoTZ0FIHAPcmwjVYRDQLgiKUCkntXbJ1LoxEMKE+pDq2rhkbfryj6GWTAGzPz8QNk8kUwigip5IBz0iubw4LuiLVAkkjc/v/U7+GAICd/n8p3W0017YfKlNaZtdaEeht28viAI9A9oNUjkdt1ISg8CLLAECdnL5rcv0BGhtOv/2o834Q97XpTyCCJIu2V8fAyoSE7LZ+efZ3LQe5c6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riykvut66DTxk6YJ7YMoyfqs5HLJBG2e0oJy/dPBol8=;
 b=g0w7vyR78IQfrxm4VczUaiATqxX/SRUOKAO8/R3+9XxRE4rDxph+h+VSiiOnaN5zW5RZRlx+ixQCNLZqxRifxAwKeK7FRo9WYHXi1gt1HFiN9E/hNQ4sqK82kib1Yr/njzXR/IuADclI6FzAoo/7bnzKUq0xfV1pQzWN1gneko0=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, "Orzel, Michal" <Michal.Orzel@amd.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Topic: [PATCH v6 2/8] vpci: Refactor REGISTER_VPCI_INIT
Thread-Index:
 AQHb23yakGdVC9XxvEWnYcnp8zrTt7QJBRKAgAGLVICAARN8gIAG6YaA//98XQCAAIcUAP//fCSAgACGWwA=
Date: Tue, 24 Jun 2025 08:32:40 +0000
Message-ID:
 <BL1PR12MB58497F436C3E127CB9014BFDE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-3-Jiqian.Chen@amd.com>
 <1634c18d-e54e-4105-8b30-6f3085bace22@suse.com>
 <BL1PR12MB5849F7A08629FA6E2555B05FE77DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <23293ec5-7466-400c-87a4-1482577b91fa@suse.com>
 <BL1PR12MB5849CE947DEEBB7B7F6C70D3E778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <0cf4679d-ee86-4666-adae-63a3f9b9b8f7@suse.com>
 <BL1PR12MB5849672813202821C57EAD5CE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <3eaaa6c8-d696-4eca-913e-6e6fd9e618d3@suse.com>
In-Reply-To: <3eaaa6c8-d696-4eca-913e-6e6fd9e618d3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8835.025)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS7PR12MB5815:EE_
x-ms-office365-filtering-correlation-id: 9b51f1cf-fe16-489f-77ac-08ddb2f9aea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWtUMWxmbjMrYjJkK3R0Tk1MUkt3NWpSUUNBUzdtTGJrU0hKUHVWbzZPUkF3?=
 =?utf-8?B?NVJUb2M1d0xaNEtXZ1YzMFBoWTE4dmI2dTVvWkJYd1UzUHpKbVN0SUtadFVB?=
 =?utf-8?B?NTBib1RlWjhzY2llMVFWSHVQRlMyWjJIbXJaSDFLcVprSmMvYXFvd2ZKMFlQ?=
 =?utf-8?B?SlNnaE1aRzJvWElveE1HQ1VNaEVZb05pQ0N3SlQxTjNmQVJwOW9UdjlvYk1D?=
 =?utf-8?B?UU9tYWs1czFleENuOFE2MzFJNzVOQzhkN2lTZEdmdW1wOGNuTjZWZTlXem13?=
 =?utf-8?B?ekIzNVd1VStjK1FCeUU1aTdhVTBBNTNJakRRMlBxVW5rRU1iZkt4MFdKd2xn?=
 =?utf-8?B?RHN5ZkttNTh0NFRHNXVjSW9pc3I3OTJ4UGU1QU00cW1tVlJqV1o5Mno5K01u?=
 =?utf-8?B?bm5iTUxicWpPQ0tHa0RIZTFOcEo0UVdkS2w5VFNVYi82Mm5DYUlDVkNPanh4?=
 =?utf-8?B?ckNXWkNNUDV0R0RUamYvK3haWllFZHVRNitNTFhjTjBCV08xZHJoZlJzQUJV?=
 =?utf-8?B?NWltWXowQ3c0d1Rzai81VEMxQnNITUxjK01VTTdzMGhEMUVXWVBPV1VpQU9n?=
 =?utf-8?B?MEZpZHN4c1U4ZTJuTVI4WGgzOFV0Q3d3UXVPRU1GbVhTVWowSnlET0UzZGRt?=
 =?utf-8?B?cldDRCtpOFlqaFl4SU4zaGMrdm5XQkUwbUV2UTFiWE9QaGZ3VG54ZUwyTnpo?=
 =?utf-8?B?enBQRWdLcWFKNS8vQXFEVU40cmdTeFpkbHNoMUlvaWtUZUdLYWYvNiswOXBU?=
 =?utf-8?B?eDZRVFYzUVhEaUorb3Z6QzV4VUY5aUlDTUJ4anZrbzREQU9XMTJiNDduKzZC?=
 =?utf-8?B?N0lsNnYxc3RoYXZZRUNsNkY3R045djFDdHZrTkN1VmJKUzM2VUswWHNyRXZn?=
 =?utf-8?B?Nys0V05mUDZQRE92QnpFSlpGdHBMRFI0eHJDUCtBb3ZDSk9lVEJkNmRWOWlR?=
 =?utf-8?B?bXNpUTNYYU9pajVXTjBFbUJIQTYrWERXVVZCQ01NaklISGlyNWtKMy9VNVda?=
 =?utf-8?B?cEM4RkJkMFNUUG03Y29Wb1o3WmZjSmIrYlQzOHFOaEVXbkpub3dNYzY5dmE0?=
 =?utf-8?B?b1oxVXBqM1RDMlIrMHc5TDE1MXBLbXNBQlJiT0VBRitJc1p5blVZTHh2VUV0?=
 =?utf-8?B?Y29pMTMvSEVLeDBkYmVyaThxdVlxbVF4RndjKzhZa2NpZmJhY0NSRlpoQ05x?=
 =?utf-8?B?elo4TzRYd2hzWmtrOWhWM0xMYjVJM3RrL3ZWRG02L0FFbzJBZ09oeUYxT2Jz?=
 =?utf-8?B?SUwvbWx1VjVNS29pVlNWRm5Ob1BnSzd6TWw1bUlyb0xoY3ZjNGduWndjUWZI?=
 =?utf-8?B?ZmRIcmpXYzkwcjlPbmJ6Z1pyRXhvV2ZvbjZxNlQwTGRzTFlaOEFQcVRnNGF3?=
 =?utf-8?B?QWRCVkZaTUdZNTBRMXFJZkFUM0M0eHZxV2pyeFdra3RZS1lzMTlkZld6RUph?=
 =?utf-8?B?OWdyZFMyamE0ZnBhU3dLcGJTbUlCMlFLWnhjaHpMTy9ndHQvNTU4VGVKbG12?=
 =?utf-8?B?UjJIVE5sSzBrZVdtVnZPSXh4RnpQS3ZFOHdwcHdSdzErdWVmUWlGTGJpUEsw?=
 =?utf-8?B?Z2xlMk5VU0NwbldSQTVYdjhGbm9Zc2FCNnptY0EycTlYVkh0dUJFOFk1aDVI?=
 =?utf-8?B?S1NNbStaY245eXBPclhmeWhGSzFpdUU2ZVJYUWNKYkdFRkptWEF2Tjd3UG5i?=
 =?utf-8?B?MnBTK0RUcHVPQUhLTWkrMzhGTndGS0RqQUtsMkV6eEVlYVRDeGt4bzNxZmMw?=
 =?utf-8?B?eG01ME9ieVo4ZFdKNGdORXUzWlpzZFpRb3A3cWNVSFpCSnlFcGVwWkRWM2R2?=
 =?utf-8?B?V0JaYklQTnJ4RDhLNlZPd2V1WnlDWkN0Ti9QZFc4dG9tRFNpbWFrK3NpM2to?=
 =?utf-8?B?VVFhOE5wajRjRGxQM2RGOVNUdU9TekU5WTMrNlF3aXUxTm1xOE82dUdQczA3?=
 =?utf-8?B?WGZscUpvbHE3MjJlUVM2QnppdEZCeVVnUzlKTlFhMTR5SUdYUENRVzdlcXB1?=
 =?utf-8?Q?UtaG8oZZotEgRSJxQEGS1EATbVXClU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW1iSjNjVW1TRk96R0hheEsvZHdlaFU5RWZkbGZ6Ujd5dmxaYkpSQVpyVEZl?=
 =?utf-8?B?by9SaTgxM3piMjREWlhpOUNxOFY3dXRSWTRXN1M3TTE5aFNmUjZCWEVoNXo1?=
 =?utf-8?B?aExoSHd2bEZPMkJqNlJkaVBSN2dncVdDdlJnVjA0MmdPdlRQVUJJTy9rTWkr?=
 =?utf-8?B?Vi93b2lVb2FCRWE4bUtYUnhpSUFvTzBqRFQzdDdkVkJjWUltb04wUjh1MVVJ?=
 =?utf-8?B?TkNYcHVnL2tzUEpTbWZKZ1BOd2tFTGJ6NTI2ai9BeVVHbXFXRjhkVXdZU3J0?=
 =?utf-8?B?S1FqWXYzZFdRR2U4WVZuZ2hGOFZPaXF2RkNub1plVk9PR1hQV2pXK2dsR1pZ?=
 =?utf-8?B?Zzd1bW5WUk92WXExU3grc3lPYmNlcHdRN0lLaFVQRUtWYWNLVlMwV3ZEa3hm?=
 =?utf-8?B?dkhFdnU0L0ZTdTFscUtKZDFHeTV2b2RoMTIvYW5KUjNlbE4xRmJBQnlSVXBV?=
 =?utf-8?B?NHVWRDZYdjU4bU5SZUQzb1hLSXUrSFpTMGVPOEdxQ2hlL0lWalMvMjFDdVMw?=
 =?utf-8?B?bUlCNmpVTnk2bm4wWElEbWozczR3d0V1Qit6SlFNTm1ZTUdVcGNFU0xGWVlK?=
 =?utf-8?B?OCswZDE4MTEyR3BJN2N4dmdWdFJuaE5jUmYzOVNYSUpaN1ZSdEtoN2NlKzdl?=
 =?utf-8?B?U2hRYTRYSWczdmpjNlAzS1BndDA2TkhlbnZhRGRmam9DKzhUdmZ2d0F3Zll4?=
 =?utf-8?B?cVlGdnpZTCtTeU94V3Y1cW5IYy9pblhXU1czYWlKZVV3djkwd1I0NUlNUnlz?=
 =?utf-8?B?dEg3N2RlK2ppUFovNXVYOVRWLzlDYnNYbmh0MHBOUHkvN1o2UGdxQlAvMmlh?=
 =?utf-8?B?ZDNNaG9UZUlHRlBRZm1OQ3VZSFVEeUhpNFM0YjFYQk1jbzdoN2M4OE5lb0Vz?=
 =?utf-8?B?WDhKQWpCWGlFYm1VVWprUFhqRW5tY2hhK01XMDI2Y1NKOFV3aGtKNitlbGVS?=
 =?utf-8?B?L1g5b0c1SGRlT09JOXVKMkdOUUxoMnVZbTZGekF4QlNUaUxaaUdDc0dzeXVu?=
 =?utf-8?B?ZWcwMkpaVjNoRlpqOW45UURFTjJXSU8rYWdCMkN2NkVod084bStZNVUyMWln?=
 =?utf-8?B?Mjdvc2c0eVhROEdhNjZUTkFYSzZFdjUxYkR3TFZTUzVhbHArWUcySVRNaWZ2?=
 =?utf-8?B?TllrSys0ZnhqU0tJcG9ha2FoMTF0Vk9ac3Q3cndXMEdpZnpKbWNzZ2ZUaFJO?=
 =?utf-8?B?andXWGhhMEJuaUhjWlBNMXQzTE44aUxZNlRlZUNvdys5ekJBcVJReDR0L1c3?=
 =?utf-8?B?bDFYZzJuaFBFUm5VTGlVaUR1TWI5WUkzS2xUZjhzd3BybFkyeFZtRUhrNFdr?=
 =?utf-8?B?QVNGOTV5ajRkZGIwM0tVRFk5cjVqZUNpV2R4dm1lMHlFbWx3M05sSnc0NUxs?=
 =?utf-8?B?RzVZbjREVWw4L000dFdEcDhFY0dBTW9DN1ZKU3NDL3hQYXQ4bFd5Z05WNHZT?=
 =?utf-8?B?cDRjMVpzYm13N3RvbExoVjVMOWJOOG5aY1lyVUhxNjNrRTlTWVlHU2Qrc2pu?=
 =?utf-8?B?MGFTY2daUE1CazJuTk5aYjhNemlyM0F6dlRwb2pET3hNSU5nMlFiem1MM2NY?=
 =?utf-8?B?OTRvQzMyQVN1NVF0TE5hNUhoSWlaN2Y5NkQzMmFxaXQ5d0NTaS9odVRxSWxS?=
 =?utf-8?B?c3dlMWhUdCs5TmpLdUJVVUY4S3FRKythRXNmM3RHL21iZDZaTkxnK0tHek9a?=
 =?utf-8?B?dXdnNUhKaWtKZW9BUHd5UitpOGhrVlFSUDgyZVV6ckZEQXd6U2Q4UEh6TnNi?=
 =?utf-8?B?Y3NUVFdoUUtXZStoaWxWQVdETE9VSVNwTUkreHRVTG9yVW9Eb0p1VkRqZEds?=
 =?utf-8?B?dVRqd0xGZElJWWlmdlk5dVhvSUxRVXp5U0E0NUcxMGg4R1J2UTdwMGU5eDkx?=
 =?utf-8?B?dFpJTmZvSWkyUFJUbGZUa0FHaXBGczJjSitLazd3b2JvUWlXV2JNc0laOGYw?=
 =?utf-8?B?UkNqSFhMNDdtejJhaVk5M0VibXl0ZXNzL2t5QUhlRWxoNkt3aXZLOEZaK0h0?=
 =?utf-8?B?YjNuRDFYNG9mN1o4YjZwMytwUlpwL3BEbVRuZkE5SkV1aEllV1A4ZzhsK3lm?=
 =?utf-8?B?ejcxcGVLdEt3Z3FDckdRMnprUGdiMDJjU1hQYTZiTTBBYStGTGpJRExqc2ds?=
 =?utf-8?Q?fwR8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F1D50AFCC1FF14F82765F81A9B1CFD6@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b51f1cf-fe16-489f-77ac-08ddb2f9aea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 08:32:40.2792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SE5FEKmIsn3kC0TgmAbhst+g6AJ/LL0DHjp+hIZ6mqBGqSIbt2qyCv6yun9mn5/sd/E5TjjbeKNlOvFvD/KI8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815

T24gMjAyNS82LzI0IDE2OjI4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMDYuMjAyNSAx
MDoyNiwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI0IDE2OjE3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNC4wNi4yMDI1IDEwOjEyLCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yMCAxNDozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAx
OS4wNi4yMDI1IDA4OjE0LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzE4
IDIyOjMzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTIuMDYuMjAyNSAxMToyOSwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiArfSB2cGNpX2NhcGFiaWxpdHlfdDsNCj4+Pj4+
Pj4NCj4+Pj4+Pj4gQXMgeW91IGhhdmUgaXQgaGVyZSwgLi4uDQo+Pj4+Pj4+DQo+Pj4+Pj4+PiBA
QCAtMjksOSArMzAsMjIgQEAgdHlwZWRlZiBpbnQgdnBjaV9yZWdpc3Rlcl9pbml0X3Qoc3RydWN0
IHBjaV9kZXYgKmRldik7DQo+Pj4+Pj4+PiAgICovDQo+Pj4+Pj4+PiAgI2RlZmluZSBWUENJX01B
WF9WSVJUX0RFViAgICAgICAoUENJX1NMT1QofjApICsgMSkNCj4+Pj4+Pj4+ICANCj4+Pj4+Pj4+
IC0jZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfSU5JVCh4LCBwKSAgICAgICAgICAgICAgICBcDQo+Pj4+
Pj4+PiAtICBzdGF0aWMgdnBjaV9yZWdpc3Rlcl9pbml0X3QgKmNvbnN0IHgjI19lbnRyeSAgXA0K
Pj4+Pj4+Pj4gLSAgICAgICAgICAgICAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS52cGNpLiIgcCkg
PSAoeCkNCj4+Pj4+Pj4+ICsjZGVmaW5lIFJFR0lTVEVSX1ZQQ0lfQ0FQQUJJTElUWShjYXAsIGZp
bml0LCBmY2xlYW4sIGV4dCkgXA0KPj4+Pj4+Pj4gKyAgICBzdGF0aWMgY29uc3QgdnBjaV9jYXBh
YmlsaXR5X3QgZmluaXQjI190ID0geyBcDQo+Pj4+Pj4+DQo+Pj4+Pj4+IC4uLiBfdCBzdWZmaXhl
cyBnZW5lcmFsbHkgZGVzaWduYXRlIHR5cGVzLiBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBhYnVz
ZQ0KPj4+Pj4+PiB0aGF0IHN1ZmZpeCBmb3IgYW4gaWRlbnRpZmllciBvZiBhIHZhcmlhYmxlLg0K
Pj4+Pj4+IFdoYXQgZG8geW91IHRoaW5rIEkgc2hvdWxkIGNoYW5nZSB0bz8NCj4+Pj4+DQo+Pj4+
PiBXZWxsLCBpZiB5b3UgdGFrZSBteSBvdGhlciBhZHZpY2UsIHRoaXMgcXVlc3Rpb24gd29uJ3Qg
bmVlZCBhbnN3ZXJpbmcsIGFzDQo+Pj4+PiB0aGVuIHlvdSBvbmx5IG5lZWQgdGhlIC4uLl9lbnRy
eSBvbmUuDQo+Pj4+Pg0KPj4+Pj4gQnR3LCBub3RpY2luZyBvbmx5IG5vdyAtIHdoeSBpcyBpdCBm
aW5pdCB0aGF0J3MgdXNlZCB0byBkZXJpdmUgdGhlIGlkZW50aWZpZXI/DQo+Pj4+PiBXaXRoIHRo
YXQsIGl0IGNvdWxkIGFzIHdlbGwgYmUgZmNsZWFuIChsZWF2aW5nIGFzaWRlIHRoZSBmYWN0IHRo
YXQgdGhhdCdzDQo+Pj4+PiBvcHRpb25hbCkuIEltbyB0aGUgbmFtZSB3b3VsZCBiZXR0ZXIgYmUg
ZGVyaXZlZCBmcm9tIGNhcCwgYW5kIGl0IHdvdWxkIGJldHRlcg0KPj4+Pj4gYWxzbyByZWZsZWN0
IHRoZSBwdXJwb3NlIG9mIHRoZSB2YXJpYWJsZS4NCj4+Pj4gSSBjb25zaWRlcmVkIHRoaXMuDQo+
Pj4+IEkgdGhpbmsgaXQgaXMgZWFzaWVyIHRvIHVzZSBmaW5pdCwgYW5kIGZpbml0IGNvbnRhaW5z
IHRoZSBjYXAgdHlwZSwgYW5kIHRoZSBtYWluIHB1cnBvc2Ugb2YgdGhpcyBzdHJ1Y3QgaXMgdG8g
aW5pdGlhbGl6ZSB0aGUgY2FwLg0KPj4+DQo+Pj4gWWV0IGlkZW50aWZpZXIgbmFtZXMgc2hvdWxk
IG1ha2Ugc2Vuc2UgZm9yIHRoZSBvYmplY3QgdGhleSBuYW1lLg0KPj4gT0suIFdoYXQncyB5b3Vy
IHN1Z2dlc3Rpb24gYWJvdXQgbmFtaW5nIHRoZSBlbnRyeT8NCj4gDQo+IGNhcCMjX2luaXQgb3Ig
XyMjY2FwIyNfaW5pdCBmb3IgZXhhbXBsZS4NCklmIHNvLCBJIG5lZWQgdG8gZXh0ZW5kIHRoZSBw
YXJhbWV0ZXIgb2YgUkVHSVNURVJfVlBDSV9DQVBBQklMSVRZIHNpbmNlIGN1cnJlbnQgY2FwIGlz
IG51bWJlciwgbm90IHN0cmluZy4NCk1heWJlOg0KUkVHSVNURVJfVlBDSV9DQVBBQklMSVRZIChj
YXAsIGNhcF9pZCwgZmluaXQsIGZjbGVhbiwgZXh0KQ0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0
IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

