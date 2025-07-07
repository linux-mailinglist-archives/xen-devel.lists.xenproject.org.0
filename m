Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B3AFAA41
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 05:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035165.1407393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcZs-0008Jt-Fm; Mon, 07 Jul 2025 03:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035165.1407393; Mon, 07 Jul 2025 03:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYcZs-0008Gj-Bk; Mon, 07 Jul 2025 03:31:36 +0000
Received: by outflank-mailman (input) for mailman id 1035165;
 Mon, 07 Jul 2025 03:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHPz=ZU=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uYcZq-0008GN-D4
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 03:31:34 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2406::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe27b6e-5ae2-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 05:31:32 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 03:31:28 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 03:31:27 +0000
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
X-Inumbo-ID: dfe27b6e-5ae2-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzhqbJefSyxSiTCoywpBZrEFiiks8JAoShLE57UAteO7hDmB6lhoD0N5MsU6UJMQbyoYlAeLBvw2KM/iMGJ17vxUK55XUO4IHI4tSAcpw/4iBdwD6Vs46746yIcFPskM6fdISMRh/EjltTzF+Ci//nT/HKuJ1MR5icdf+6NNFaiwF4z2iBEljSvvsvf0gNZuX0pptIwa5dd7dGV8phsaDUE2zxozE2cLeC81qw9MZYXQ9kOzLi7XKMoVNoMGcQfjfq1AqNm4jS38IRUYUWhMj3UKjl3IbJPogDD+OqHqGhRMd8Sn3cZwhf1GPs7NdS4GcNRLhqryCIRpi098PGwDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+apxICBgcoO+sYjBIwHniyaUc9CXBVd+iYhcRcrcis=;
 b=XsHzeh55BfKaqE+G4GbwVm/XNDsKwTK1bBFQsOPLDiYJMi9X5X452QjYa1lYlHC1sgZKJbj2WrqAlkY9RyHQqB0hee3Irg8/gsuOBWCRLr27KlNEQlTDEaaa5+x3qDumjTLfFuteapOUR4+UxwT/9kbfcGBk0hq5PqLx5ZZGvShuZAo6lxtsLW3s4srIbcmrESgtNJASQg9VIcTkJrPZl/dKynWvsOi86j+46aV2KN2oQltDsdu0aTa30+wJ0pGARBVpoqP8jbL/JHQj0j6mhSylqK1dKM8fSCCjJQrUz3zGGU6rVGTdCEjNDLxjIL5iqGurG7FvJ4pT0HbmlyD+UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+apxICBgcoO+sYjBIwHniyaUc9CXBVd+iYhcRcrcis=;
 b=IDS790W0iJvYw7Dm8JL3UzR0dxRVi9y6/auOzYWRj+gkeQVhNIS2efSDLnIjYBuyJ2mw/GwT5Ug8IEi1O8IfIhTkeZFr4KX7ygGpPCc4kZCPX3HKBoQxcvfFF3B5vbE+5+WteDijF3MrqC9+RqFnUYkHWJ4kVOavWivc3TYPeHM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Orzel, Michal" <Michal.Orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andryuk,
 Jason" <Jason.Andryuk@amd.com>
Subject: RE: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Topic: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Thread-Index:
 AQHbzuRKQ5+TGdD3B0+TZYuot60QS7QHQcCAgBqT2LCAAAkNgIAAAq7QgAAR54CABE2JoA==
Date: Mon, 7 Jul 2025 03:31:27 +0000
Message-ID:
 <DM4PR12MB84514D457CAE4D38EAB47D96E14FA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-15-Penny.Zheng@amd.com>
 <1e3fa4e5-9409-46ec-abba-1bbd14602d79@suse.com>
 <DM4PR12MB845100B73D9AB98E2259BE38E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <85d0b299-b94f-48c1-b4f9-996476db0847@suse.com>
 <DM4PR12MB845185414637BC1CE87A3309E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <b5184b15-018c-4603-8b97-9e6f122d4863@suse.com>
In-Reply-To: <b5184b15-018c-4603-8b97-9e6f122d4863@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-07T03:31:18.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB8108:EE_
x-ms-office365-filtering-correlation-id: 5d9d22e1-2202-42ea-3e5a-08ddbd06c1f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Vnd4Z3NYblRtZlhOaUJKQ0pOejJsS3YxYmlWWlVuSTZpZzdGcHdwUnZCQUcv?=
 =?utf-8?B?aDZUSThaQUVPOHIrMmh6eWFzbWxUK0hFUnpodDVzWlIzOEVwVjdwUm9WdVQ1?=
 =?utf-8?B?ZzFFUDJyUXNGY1MreTFvWmtQcndFVzVhQXVXUGVKcU52cTkvNmoxRHY2L3dR?=
 =?utf-8?B?MGFmYVNkU2Mvbi9qem5DY3c1b0ZwZDNIRTJuWkFiZWlOVEhPdkZkOG1sYjBa?=
 =?utf-8?B?aHM4VEhHTi9XcURBbVp1d3ExVTM1eC9BdFN2WDRUNHc2UHBueVNqQkFsVTNQ?=
 =?utf-8?B?eTdBQnAyOW9OczI5eFpiNE56dG92WkVSalNLTGZ5ZjlTdC9PM1o2dEVCMTF1?=
 =?utf-8?B?a1JBcFFQdmR0MytDNUR6Lzh3cGxuUTlHUW5Rbk8vc2pVb28yUjJKVE9MbFFz?=
 =?utf-8?B?b3dNaTdzK2o1MUllRDA2UXNZeis4Z1NMdEV0SHN6YWpTUzNhUllGRjQ1amIw?=
 =?utf-8?B?a2F6ajVxREI3TzBPVGZlcWZIeXlZTkM3L01GUk1RaGxLTGJ0VGJGR21yblpu?=
 =?utf-8?B?WjZMcTBuaGJOU0ZNbGl0dW1PQ3pwMVgvYkpLZ3dOUnRCeHJ5cStsNG9qbDUr?=
 =?utf-8?B?WkdkT2s1UVdpSkttdkc3bFo1dzRvcEliazdteUpoNUtDUGMweDJ5VkZseDFt?=
 =?utf-8?B?dzlJMU9NbDJRUVJOOEg4VUNjQ2VMMlV3cUdLSW1oY1lBencwWXV2QldoMEpy?=
 =?utf-8?B?c210THN6V0NKbWRkZEFnZ1FrREhDMlpZNkRYU09QUTNQL0pLTjdjdHoxRnZU?=
 =?utf-8?B?SDZodFhYRVk0bnlTWmliTGNaUWhIMnR4bGJPZ0JTWHBzR3F0cDhCY1JNYlk5?=
 =?utf-8?B?TlhrK1hhZVc2Y1VkMTVDdjJtMDVMdWQvNmQ0aHZ2bzVwSTFJU0hZUWZFS1Ji?=
 =?utf-8?B?UDRmTThWK2lScDFlZ2xOVXZTRUt5dlhxSmRObFNMN3l6UjhWMERnWVA4dFJM?=
 =?utf-8?B?dmJ5YlliU3F0MU9iQlVCalZSREh6czNwaitNalduQVRib1c2SEhVM0lPdWZh?=
 =?utf-8?B?RzhOaFVBdTVUbm5oVGg4ZzJYa3doeHhGSXBDWXdIeUFwL2JIdDBmRmlwODh4?=
 =?utf-8?B?VGdOY0owNHkxa0Q1YTdGd09DT0Q4cG5PUlpnZlZyVU9NaDdhWFF0WWM2MEtX?=
 =?utf-8?B?QjI3RW84Z1VxNUFZMXBLL2JBaUJqUHN2MTE0L25BK1EvQzg4TW96cVRHRU4z?=
 =?utf-8?B?SkFQVjh4TGJma0RXc1hIQVEvU3FGZE0zbHpHejh6ODI4bmpmOGx2d25LMWJ1?=
 =?utf-8?B?UFdxUmlNZlRPMG1lRU9LQzVaakVDWmwyYUdjcEc3cVQ1cEc4NSt6VEwwV09H?=
 =?utf-8?B?Z2pVMU96bkJDR2RMYWxwaWpTV054MS9qOGlOVXk4ZDFuSzZhelZPZHp0a20w?=
 =?utf-8?B?M2MrS21rVDRZYjZsc2t2ZkcrRllXTmNSYmpDMGFrYm5lL1Q2TkplMFlGcXU4?=
 =?utf-8?B?bERMNjl6VUZqQU1xcXo3by9IOFc1WDNKK29QWGN6WVVtUldaZVAydHBEKzFj?=
 =?utf-8?B?d3J0bHVoTWJ0ZHhERDMrdkgzNENydlVGYUlTNkhOa1ZVVHZHRlNtb2taZllF?=
 =?utf-8?B?L0doR2lvblNzUTE1dUNnUng4dmd2QU41SUxnT2VsWWdXbW9QZSsrQXpNTHZh?=
 =?utf-8?B?UC9PSmlIa3QrQnNqRThIbmZKK3lzdXp3MDRLTkYyZ3A3SlZhY3hSS3FFMnV4?=
 =?utf-8?B?M1NsZVpoa1BpMDR3YkpsSEFZWUgrWllJUHZzYWIzTGpwdjczS3puOUFLZ0lF?=
 =?utf-8?B?QVZzdktnOHlyYWh0QVR0VjI2cGd6eUdrZ0pPallFTXlpWVFXWTNTbHdtLzl2?=
 =?utf-8?B?ZkxxYnpMczNSMUUrcm5nL1hSQllraGNKa2UyQVZMR0xQZjFFK1ZkelYwSE1r?=
 =?utf-8?B?dExkMld6Mm9UNU1DK21QVWluMDZ6RE5sYUFiZ2d2c0VHRUJocFJDUjFFcHVj?=
 =?utf-8?B?RTcyRXVhN3h4SDZsK2FWOWRVd2NXMEhLc0ZsLzQ1RlcvM0ZCOHhWSFVic09M?=
 =?utf-8?Q?ABRiP3mjLuSCaLV74f2TP3viONlJTM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWpyTERnWmlKNytiS0JqL09DbGpxNU9lL2JDMVM4RTEyS0YvSWluVnhxYVlU?=
 =?utf-8?B?dk5oOXFEa3ptcXhLUzhFdXNORUU2ejJkYTVYaldWNjFwV3NhSExsT0JkUXVU?=
 =?utf-8?B?aFVMYnRkcUE0VkZOUFNnRzQ1MTkxOGQvVkpXajBGMm1qL1AwZ2ovaUZQSDR4?=
 =?utf-8?B?ODU2WXFUdFJvNi9zL1NzSzI4azFjcDNvNTZ4WTNmbTVNc2wwUVNvR1Q2V0RZ?=
 =?utf-8?B?anpkN1NqNkdLQ0JYb2dCM3YwR2c2b1RvNy9vQVJiS0EvYmUwM1ZUdjlrTTV0?=
 =?utf-8?B?NTBRV2lNK1cyMDJLc1hOS1JsL3NpbHBCMEdydWIxUkRSUzFsVEljcHJqWStE?=
 =?utf-8?B?bkw4VmhPRGh5MDB1V09OS3JTdzEvQi8vdGcrYXo2N2k0dGZiclZDQkJZSDhP?=
 =?utf-8?B?QUpSU25aaE9GZEJaRTAvOXNWc0JoM1NsZG5DeEZFakI1ZkF2M2FjQXZrc2ww?=
 =?utf-8?B?OHlodStxOXlZcE1JRmRSOGpQRVhXNjN6Z2crOGIzcmFaKzU0Y3NkOU1RZXZh?=
 =?utf-8?B?MFlXYjN0ODNKMVV1YXE0MDZISkR0cHVSSkRra2drbHNOY3pyOEpITklGbmoy?=
 =?utf-8?B?K0FFRnJib0lyampGcTZoV1dzM2EvSmFzNGlPSkxDUUR1Z0liNUg3QU1tVGRZ?=
 =?utf-8?B?Q21tWmM0YlJIeWZWUkJPVENPNDA4d09mcTgxUDdpa25TQ3grWFZIdHc2NEt5?=
 =?utf-8?B?clpTVzRDVDFJd08ydHBCak10UFJvekVsL0Y5Q2VlYmRRKzBCbVlvSVBEbXBv?=
 =?utf-8?B?QnMzSEQ1ZnMzcWlQa2VYTzhCM3JXZFBHOEx6T0d6WkEvY0M5OWsxY0lEY3o1?=
 =?utf-8?B?OWl0VlZsYkhtUEE5OVh3cnplRkgxQnh5YmZMTTJQQm5XbnFnL3JUdUNkVXgv?=
 =?utf-8?B?SVFPUE5FNWdjOFprTTZjbk9CRHRkSmpWZmJ0amN4RDZxalhuSlpBQkVNQ0h1?=
 =?utf-8?B?OGkzTm1aYmM5dFZtSit3Z0ZBNEorMXFENUlWODZ1Zk1QTXJRZWRqczRYSXVn?=
 =?utf-8?B?VVlPT3NITFNJYW9wR3orWll6YTdCeWpvbmw5SHNMa21JVjRHLzBYcGpLY2dv?=
 =?utf-8?B?QnRUZXYzMlNwbUpIOFFTc1NEWktSaElQVXlLenoxK3pwc1RFVFpadSszT04y?=
 =?utf-8?B?M0dhc1QvTFFkb0pXZ3NqT1NQUm11WUo3bVpNMzdDdVBGZ3pWN25kbEZPa3RC?=
 =?utf-8?B?N0FwYTJUMHhyYWJ4a2RybTB6T1I4cmxFMzloeXlVTGxxVHNFTS81bWE5S3Va?=
 =?utf-8?B?NzBMY3hHSmNiSlVwNXVsTUw2ME1KTkp5OUp3U2wwRUFDTVVlYWFSTFB5dmJS?=
 =?utf-8?B?RVZPNVNidmNvb0RwalpNSC9wbHhjUUhYNjArQWhJSWFHTElOdlo1V3JIY3U5?=
 =?utf-8?B?bTJCc2tMbnFvMERLR2FDeHZRTncrSk9Zdk5tdExtaFUwZ0NPL0tMY2Nhb3A1?=
 =?utf-8?B?OUI2aWl6cWNFNTM5TWZ6aVBIYktFMjB0a2RnUmovdTMwRkJtcnVKNEp4ejdW?=
 =?utf-8?B?Y0dSaWVyZ3lTYXhybnpYanJIZnlaQXdrN1Nad2xoQUowaStsdXd3UlppeWhj?=
 =?utf-8?B?SHNWUFNZOFN5ZndXRlQwcm92VitSc2FCMUp1TEEzQmhEWHhxeGFQbjdFTEE0?=
 =?utf-8?B?azZnMlJCZTUveFR0UFZ5Myt0N1ZtTzh3OFRGb3FmcDJPNlY1ZnE5eklQRkt0?=
 =?utf-8?B?SkNqYkwveTYrWFZLdE91LzZJQnZvZS9Hb25sRmgvWFFQVk8zZFI4a1VaQzJl?=
 =?utf-8?B?clNnMVQ2WFNjcmhQRGE0Qk1GdVFkckN0UlVUSXVtd3FFSWpOb01JbzUzTVpt?=
 =?utf-8?B?SGlJaGtlUmFYejY5eEliUmxITnRlRS8rWVVwQzJWRjZkZ1lSREh5eXBmNXFa?=
 =?utf-8?B?eFdpMjFzeEVlcS9ad1NCUUJ2NVlucWw3MkRQa0RlZXM4TElIdnNSM09DRGNQ?=
 =?utf-8?B?dmJ1bjRLVmxhcVN3ZzNFbmxHZWJqSjRmMmpLUURROTVlWVk5M241UXFYbHJJ?=
 =?utf-8?B?MkZHKzF6ZEpjMmR5WXYzdXpvVnV1TXhrWWJ5akRKdkJpYjdTWURmYzBwRUtL?=
 =?utf-8?B?eVJHaC92bXlzbXgxMmdvVDhJUTdOMldLS2V2aGFiamRVUHc3MTFWUC9OcXhL?=
 =?utf-8?Q?cduU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9d22e1-2202-42ea-3e5a-08ddbd06c1f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 03:31:27.7558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9/xvuje4RJ4pBVxbP2ikjIK4u+jtjXoAlkKfm3/pGbB/hMyM3GDwnTVbWWVu1A6r68HVTl4bNi+EHzILFFi2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVseSA0LCAyMDI1IDU6
NDYgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6IEh1
YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW50aG9ueSBQRVJBUkQNCj4gPGFudGhvbnku
cGVyYXJkQHZhdGVzLnRlY2g+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+OyBBbmRy
ZXcNCj4gQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgT3J6ZWwsIE1pY2hhbCA8
TWljaGFsLk9yemVsQGFtZC5jb20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsg
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBTdGVmYW5vDQo+IFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEFuZHJ5dWssIEphc29uDQo+IDxKYXNvbi5BbmRyeXVrQGFtZC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMTQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgR0VUX0NQVUZS
RVFfQ1BQQyBzdWItDQo+IGNtZA0KPg0KPiBPbiAwNC4wNy4yMDI1IDEwOjU2LCBQZW5ueSwgWmhl
bmcgd3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNl
bnQ6IEZyaWRheSwgSnVseSA0LCAyMDI1IDQ6MzMgUE0NCj4gPj4gVG86IFBlbm55LCBaaGVuZyA8
cGVubnkuemhlbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29uDQo+ID4+IDxKYXNvbi5BbmRyeXVr
QGFtZC5jb20+DQo+ID4+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhv
bnkgUEVSQVJEDQo+ID4+IDxhbnRob255LnBlcmFyZEB2YXRlcy50ZWNoPjsgSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPjsgQW5kcmV3DQo+ID4+IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IE9yemVsLCBNaWNoYWwNCj4gPj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsg
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiA+PiBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+ID4+IDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjUgMTQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UgR0VUX0NQVUZS
RVFfQ1BQQw0KPiA+PiBzdWItIGNtZA0KPiA+Pg0KPiA+PiBPbiAwNC4wNy4yMDI1IDEwOjEzLCBQ
ZW5ueSwgWmhlbmcgd3JvdGU6DQo+ID4+PiBbUHVibGljXQ0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4NCj4gPj4+PiBTZW50OiBUdWVzZGF5LCBKdW5lIDE3LCAyMDI1IDY6MDggUE0NCj4g
Pj4+PiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiA+Pj4+IENjOiBI
dWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IEFudGhvbnkgUEVSQVJEDQo+ID4+Pj4gPGFu
dGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Ow0KPiA+Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBPcnpl
bCwgTWljaGFsDQo+ID4+Pj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdQ0KPiA+Pj4+IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4+PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiA+Pj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMTQvMThdIHhlbi9jcHVmcmVxOiBpbnRyb2R1Y2UNCj4gPj4+PiBHRVRfQ1BVRlJF
UV9DUFBDDQo+ID4+Pj4gc3ViLSBjbWQNCj4gPj4+Pg0KPiA+Pj4+IE9uIDI3LjA1LjIwMjUgMTA6
NDgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS90b29scy9taXNjL3hlbnBtLmMN
Cj4gPj4+Pj4gKysrIGIvdG9vbHMvbWlzYy94ZW5wbS5jDQo+ID4+Pj4+IEBAIC02OSw2ICs2OSw3
IEBAIHZvaWQgc2hvd19oZWxwKHZvaWQpDQo+ID4+Pj4+ICAgICAgICAgICAgICAiIHNldC1tYXgt
Y3N0YXRlICAgICAgICA8bnVtPnwndW5saW1pdGVkJyBbPG51bTI+fCd1bmxpbWl0ZWQnXVxuIg0K
PiA+Pj4+PiAgICAgICAgICAgICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzZXQgdGhlIEMtU3RhdGUgbGltaXRhdGlvbiAoPG51bT4gPj0gMCkNCj4gPj4gYW5kXG4iDQo+
ID4+Pj4+ICAgICAgICAgICAgICAiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG9wdGlvbmFsbHkgdGhlIEMtc3ViLXN0YXRlIGxpbWl0YXRpb24NCj4gPj4+PiAoPG51bTI+ID49
IDApXG4iDQo+ID4+Pj4+ICsgICAgICAgICAgICAiIGdldC1jcHVmcmVxLWNwcGMgICAgICBbY3B1
aWRdICAgICAgIGxpc3QgY3B1IGNwcGMgcGFyYW1ldGVyIG9mIENQVQ0KPiA+Pj4+IDxjcHVpZD4g
b3IgYWxsXG4iDQo+ID4+Pj4+ICAgICAgICAgICAgICAiIHNldC1jcHVmcmVxLWNwcGMgICAgICBb
Y3B1aWRdIFtiYWxhbmNlfHBlcmZvcm1hbmNlfHBvd2Vyc2F2ZV0NCj4gPj4+PiA8cGFyYW06dmFs
PipcbiINCj4gPj4+Pj4gICAgICAgICAgICAgICIgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc2V0IEhhcmR3YXJlIFAtU3RhdGUgKEhXUCkNCj4gcGFyYW1ldGVyc1xuIg0KPiA+
Pj4+PiAgICAgICAgICAgICAgIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBv
biBDUFUgPGNwdWlkPiBvciBhbGwgaWYgb21pdHRlZC5cbiINCj4gPj4+Pj4gQEAgLTgxMiwzMyAr
ODEzLDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfY3B1ZnJlcV9wYXJhKGludCBjcHVpZCwNCj4gPj4+
Pj4gc3RydWN0IHhjX2dldF9jcHVmcmVxX3BhcmEgKnBfY3B1ZnJlcSkNCj4gPj4+Pj4NCj4gPj4+
Pj4gICAgICBwcmludGYoInNjYWxpbmdfZHJpdmVyICAgICAgIDogJXNcbiIsIHBfY3B1ZnJlcS0+
c2NhbGluZ19kcml2ZXIpOw0KPiA+Pj4+Pg0KPiA+Pj4+PiAtICAgIGlmICggaHdwICkNCj4gPj4+
Pj4gLSAgICB7DQo+ID4+Pj4+IC0gICAgICAgIGNvbnN0IHhjX2NwcGNfcGFyYV90ICpjcHBjID0g
JnBfY3B1ZnJlcS0+dS5jcHBjX3BhcmE7DQo+ID4+Pj4+IC0NCj4gPj4+Pj4gLSAgICAgICAgcHJp
bnRmKCJjcHBjIHZhcmlhYmxlcyAgICAgICA6XG4iKTsNCj4gPj4+Pj4gLSAgICAgICAgcHJpbnRm
KCIgIGhhcmR3YXJlIGxpbWl0cyAgICA6IGxvd2VzdCBbJSJQUkl1MzIiXSBsb3dlc3Qgbm9ubGlu
ZWFyDQo+ID4+Pj4gWyUiUFJJdTMyIl1cbiIsDQo+ID4+Pj4+IC0gICAgICAgICAgICAgICBjcHBj
LT5sb3dlc3QsIGNwcGMtPmxvd2VzdF9ub25saW5lYXIpOw0KPiA+Pj4+PiAtICAgICAgICBwcmlu
dGYoIiAgICAgICAgICAgICAgICAgICAgIDogbm9taW5hbCBbJSJQUkl1MzIiXSBoaWdoZXN0IFsl
IlBSSXUzMiJdXG4iLA0KPiA+Pj4+PiAtICAgICAgICAgICAgICAgY3BwYy0+bm9taW5hbCwgY3Bw
Yy0+aGlnaGVzdCk7DQo+ID4+Pj4+IC0gICAgICAgIHByaW50ZigiICBjb25maWd1cmVkIGxpbWl0
cyAgOiBtaW4gWyUiUFJJdTMyIl0gbWF4IFslIlBSSXUzMiJdIGVuZXJneQ0KPiA+PiBwZXJmDQo+
ID4+Pj4gWyUiUFJJdTMyIl1cbiIsDQo+ID4+Pj4+IC0gICAgICAgICAgICAgICBjcHBjLT5taW5p
bXVtLCBjcHBjLT5tYXhpbXVtLCBjcHBjLT5lbmVyZ3lfcGVyZik7DQo+ID4+Pj4+IC0NCj4gPj4+
Pj4gLSAgICAgICAgaWYgKCBjcHBjLT5mZWF0dXJlcyAmIFhFTl9TWVNDVExfQ1BQQ19GRUFUX0FD
VF9XSU5ET1cgKQ0KPiA+Pj4+PiAtICAgICAgICB7DQo+ID4+Pj4+IC0gICAgICAgICAgICB1bnNp
Z25lZCBpbnQgYWN0aXZpdHlfd2luZG93Ow0KPiA+Pj4+PiAtICAgICAgICAgICAgY29uc3QgY2hh
ciAqdW5pdHM7DQo+ID4+Pj4+IC0NCj4gPj4+Pj4gLSAgICAgICAgICAgIGFjdGl2aXR5X3dpbmRv
dyA9IGNhbGN1bGF0ZV9hY3Rpdml0eV93aW5kb3coY3BwYywgJnVuaXRzKTsNCj4gPj4+Pj4gLSAg
ICAgICAgICAgIHByaW50ZigiICAgICAgICAgICAgICAgICAgICAgOiBhY3Rpdml0eV93aW5kb3cg
WyUiUFJJdTMyIiAlc11cbiIsDQo+ID4+Pj4+IC0gICAgICAgICAgICAgICAgICAgYWN0aXZpdHlf
d2luZG93LCB1bml0cyk7DQo+ID4+Pj4+IC0gICAgICAgIH0NCj4gPj4+Pj4gLQ0KPiA+Pj4+PiAt
ICAgICAgICBwcmludGYoIiAgICAgICAgICAgICAgICAgICAgIDogZGVzaXJlZCBbJSJQUkl1MzIi
JXNdXG4iLA0KPiA+Pj4+PiAtICAgICAgICAgICAgICAgY3BwYy0+ZGVzaXJlZCwNCj4gPj4+Pj4g
LSAgICAgICAgICAgICAgIGNwcGMtPmRlc2lyZWQgPyAiIiA6ICIgaHcgYXV0b25vbW91cyIpOw0K
PiA+Pj4+PiAtICAgIH0NCj4gPj4+Pj4gLSAgICBlbHNlDQo+ID4+Pj4+ICsgICAgaWYgKCAhaHdw
ICkNCj4gPj4+Pj4gICAgICB7DQo+ID4+Pj4+ICAgICAgICAgIGlmICggcF9jcHVmcmVxLT5nb3Zf
bnVtICkNCj4gPj4+Pj4gICAgICAgICAgICAgIHByaW50Zigic2NhbGluZ19hdmFpbF9nb3YgICAg
OiAlc1xuIiwNCj4gPj4+Pg0KPiA+Pj4+IEknbSBub3Qgc3VyZSBpdCBpcyBhIGdvb2QgaWRlYSB0
byBhbHRlciB3aGF0IGlzIGJlaW5nIG91dHB1dCBmb3IgZ2V0LWNwdWZyZXEtcGFyYS4NCj4gPj4+
PiBQZW9wbGUgbWF5IHNpbXBseSBtaXNzIHRoYXQgb3V0cHV0IHRoZW4sIHdpdGhvdXQgaGF2aW5n
IGFueQ0KPiA+Pj4+IGluZGljYXRpb24gd2hlcmUgaXQgd2VudC4NCj4gPj4+DQo+ID4+PiBId3Ag
aXMgbW9yZSBsaWtlIGFtZC1jcHBjIGluIGFjdGl2ZSBtb2RlLiBJdCBhbHNvIGRvZXMgbm90IHJl
bHkgb24NCj4gPj4+IFhlbiBnb3Zlcm5vciB0byBkbyBwZXJmb3JtYW5jZSB0dW5pbmcsIHNvIGlu
IHByZXZpb3VzIGRlc2lnbiwgd2UNCj4gPj4+IGNvdWxkIGJvcnJvdw0KPiA+PiBnb3Zlcm5vciBm
aWxlZCB0byBvdXRwdXQgY3BwYyBpbmZvIEhvd2V2ZXIgYWZ0ZXIgaW50cm9kdWNpbmcgYW1kLWNw
cGMNCj4gPj4gcGFzc2l2ZSBtb2RlLCB3ZSBoYXZlIHJlcXVlc3QgdG8gb3V0cHV0IGJvdGggZ292
ZXJub3IgYW5kIENQUEMgaW5mby4NCj4gPj4gQW5kIGlmIGNvbnRpbnVpbmcgZXhwYW5kaW5nIGdl
dC1jcHVmcmVxLXBhcmEgdG8gaW5jbHVkZSBDUFBDIGluZm8sIGl0DQo+ID4+IHdpbGwgbWFrZSB0
aGUgcGFyZW50IHN0dWN0IHhlbl9zeXNjdGwudSBleGNlZWQgZXhjZWVkIDEyOCBieXRlcy4NCj4g
Pj4NCj4gPj4gSG93IGlzIHRoZSB4ZW5wbSBjb21tYW5kICJnZXQtY3B1ZnJlcS1wYXJhIiByZWxh
dGVkIHRvIHRoZSBzeXNjdGwNCj4gPj4gaW50ZXJmYWNlIHN0cnVjdCBzaXplPyBJZiB5b3UgbmVl
ZCB0byBpbnZva2UgdHdvIHN5c2N0bCBzdWItb3BzIHRvDQo+ID4+IHByb2R1Y2UgYWxsIHJlbGV2
YW50ICJnZXQtY3B1ZnJlcS0gcGFyYSIgb3V0cHV0LCBzbyBiZSBpdCBJIHdvdWxkIHNheS4NCj4g
Pj4NCj4gPg0KPiA+IEJlY2F1c2Ugd2UgYXJlIGxpbWl0aW5nIGVhY2ggc3lzY3RsLXN1YmNtZC1z
dHJ1Y3QsIHN1Y2ggYXMgIiBzdHJ1Y3QNCj4geGVuX3N5c2N0bF9wbV9vcCAiLCAxMjggYnl0ZXMg
aW4gInN0cnVjdCB4ZW5fc3lzY3RsIu+8jFRoZXkgYXJlIGFsbCBjb21iaW5lZCBhcyBhDQo+IHVu
aW9uLg0KPiA+IEFsc28sIGluICJzdHJ1Y3QgeGVuX3N5c2N0bF9wbV9vcCIsIGl0cyBkZXNjZW5k
aW5nIHN1Yi1vcCBzdHJ1Y3RzLA0KPiA+IGluY2x1ZGluZyAic3RydWN0IHhlbl9nZXRfY3B1ZnJl
cV9wYXJhIiwgYXJlIGFsbCBjb21iaW5lZCBhcyB1bmlvbiB0b28NCj4gPiBgYGAgc3RydWN0IHhl
bl9zeXNjdGxfcG1fb3Agew0KPiA+ICAgICAuLi4gLi4uDQo+ID4gICAgIHVuaW9uIHsNCj4gPiAg
ICAgICAgIHN0cnVjdCB4ZW5fZ2V0X2NwdWZyZXFfcGFyYSBnZXRfcGFyYTsNCj4gPiAgICAgICAg
IHN0cnVjdCB4ZW5fc2V0X2NwdWZyZXFfZ292ICBzZXRfZ292Ow0KPiA+ICAgICAgICAgc3RydWN0
IHhlbl9zZXRfY3B1ZnJlcV9wYXJhIHNldF9wYXJhOw0KPiA+ICAgICAgICAgc3RydWN0IHhlbl9z
ZXRfY3BwY19wYXJhICAgIHNldF9jcHBjOw0KPiA+ICAgICAgICAgdWludDY0X2FsaWduZWRfdCBn
ZXRfYXZnZnJlcTsNCj4gPiAgICAgICAgIHVpbnQzMl90ICAgICAgICAgICAgICAgICAgICBzZXRf
c2NoZWRfb3B0X3NtdDsNCj4gPiAjZGVmaW5lIFhFTl9TWVNDVExfQ1hfVU5MSU1JVEVEIDB4ZmZm
ZmZmZmZVDQo+ID4gICAgICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAgICAgZ2V0X21heF9j
c3RhdGU7DQo+ID4gICAgICAgICB1aW50MzJfdCAgICAgICAgICAgICAgICAgICAgc2V0X21heF9j
c3RhdGU7DQo+ID4gICAgIH0gdTsNCj4gPiB9DQo+ID4gYGBgDQo+ID4gSXQgY291bGQgZGVkdWNl
IHRoYXQgInN0cnVjdCB4ZW5fZ2V0X2NwdWZyZXFfcGFyYSIgaXMgbGltaXRlZCB0byAxMjggYnl0
ZXMgKEkgdGhpbmsNCj4gYWN0dWFsIGxpbWl0IGlzIHNtYWxsZXIgdGhhbiAxMjgpLi4uLg0KPg0K
PiBBbmQgdGhhdCBpbXBsaWVzIHdoYXQ/IEluIG15IGVhcmxpZXIgcmVwbHkgSSBhbHJlYWR5IHNh
aWQgdGhhdCB5b3UgbWF5IHRoZW4gc2ltcGx5DQo+IG5lZWQgdG8gaW52b2tlIG1vcmUgdGhhbiBv
bmUgc3lzY3RsIHRvIGdldCBhbGwgdGhlIGRhdGEgeW91IG5lZWQuIChBcyBvbmUgb2YgdGhlDQo+
IG9wdGlvbnMsIHRoYXQgaXMuKQ0KPg0KDQpPa2F5LCBJIG9ubHkgZXhwbGFpbmVkIHdoeSBJIGNv
dWxkbid0IHVzZSBvbmUgY29tbWFuZCAiZ2V0LWNwdWZyZXEtcGFyYSIgdG8gb3V0cHV0IGFsbCBp
bmZvDQoNCj4gSmFuDQo=

