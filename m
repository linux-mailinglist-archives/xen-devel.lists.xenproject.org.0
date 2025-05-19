Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE2DABB64A
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 09:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989591.1373603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGv2S-0005TY-Ni; Mon, 19 May 2025 07:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989591.1373603; Mon, 19 May 2025 07:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGv2S-0005RZ-Kn; Mon, 19 May 2025 07:35:56 +0000
Received: by outflank-mailman (input) for mailman id 989591;
 Mon, 19 May 2025 07:35:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vhbn=YD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uGv2Q-0005RT-L4
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 07:35:54 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2406::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4b18542-3483-11f0-9eb8-5ba50f476ded;
 Mon, 19 May 2025 09:35:53 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 19 May
 2025 07:35:49 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 07:35:49 +0000
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
X-Inumbo-ID: e4b18542-3483-11f0-9eb8-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKKDpWkDYGpVmxiZtwJ84borSo1CRHSoQbTQtNcNA5FFXyhEjmXJRJ4apqtxf1OTIjyl+TNdGjq1fczu4dkQL4v3JE87TV/m7A5vAjHFeqayAv/KDB7MB+NkPf0HgbLurvTD8QSYePSGPmjdAfesDgjDfx2QOK5teMTOq+7vJni4tk16snPoS+OKw2yvUMnP0uA7M77w4ViBvWycn0itpjdTNdW6QYZkQVkrv3l64ZzkPJBiD0/nRzQTmDDm1DMp84LUn6aWkWhatX/iyOJXacRUQiqTFHX+PM6hCHAIp+tPrSzKIvgXodu5TTAdCwHtz30xm9x1cxMKuRScUCiMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=491AY4HAQJHrgbjN3sGzes+iq/mHC0r/x4iefrn0KUo=;
 b=vO+SORLzqb6qq9+15SCibgqlqJqiBnuIo3OwltQdDTBmFAkQRAXwg6gaj5vTEWGDIAyItJzwyilki7ewIlCPhFAFHcx60EzRjs1kuDygVHnqSWAMZc1Wd40vUAUKW1chrJ4KAH7tTA2gNV/MpLfUdU2TPSPJ8HjFfcKjBQXplOemB7zr9Jbalb4OlWhZjCeNjsZFpc4izXaBmNtIRHbnayFl76NDd/64us6AhkADKU7dR7eHMFyGozXJ0E2RF3LWoOiSCesnPdQHS8T4+NBML0CkyIPO0v0Zdqfv7+qk1/Y15Gu8qKYRbxBZBOO2bt3z8rV4GdDJxI+EL6W5dAtCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=491AY4HAQJHrgbjN3sGzes+iq/mHC0r/x4iefrn0KUo=;
 b=yhK9GjdpNCTRJ+hcVN7CLLsANJQvqcDNX+2MpCCS7qSIoE2uod0QkUiDgoUlOoYgcUThyDjnbGdJ5fbBMfaPsZEZYAe87xGXgtRe5r9gqGoDVKXPfqKedJveEm5jEllxw8KMuz898I9+BVIxSCq2L42PHdKMD5PEMWfpAV5yZwM=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v4 05/10] vpci: Hide legacy capability when it fails to
 initialize
Thread-Topic: [PATCH v4 05/10] vpci: Hide legacy capability when it fails to
 initialize
Thread-Index: AQHbwMGgfMHCGxGzEUKJiTb14nIoDbPYhTMAgAGdm4A=
Date: Mon, 19 May 2025 07:35:49 +0000
Message-ID:
 <BL1PR12MB5849D19B57CDB80DF65F5CC2E79CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-6-Jiqian.Chen@amd.com>
 <76d58a17-90aa-46eb-bbe8-c6d9400c489f@suse.com>
In-Reply-To: <76d58a17-90aa-46eb-bbe8-c6d9400c489f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8746.028)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SA3PR12MB8439:EE_
x-ms-office365-filtering-correlation-id: eaec111b-597a-4f68-2ebe-08dd96a7c69b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZG5hY2lWV0lpd0RsdjI0SzZJQWZDTkMzUW5ZaG8wS0pDdVN6UGJRTThyNVpW?=
 =?utf-8?B?Y3orMGl1SHpiUklNNjJ4S1FjQlBRNkcrdGNDZmtXNk5tc2F1VmtiaU5FK0FL?=
 =?utf-8?B?RENnVzFjUnRCM3IzZnNhb25NSWhmc0RseXpwTFhDbFdCRFpxc1cvRm5wdUo5?=
 =?utf-8?B?bkNDVFZJaG9wNFdndU5nN0pOdUxlTUZMMlFUTGtkTlB5VXdkRmFVL3pSQTlB?=
 =?utf-8?B?d29XUVl2M2czdlNVUUNtUWpXM1F2anM2MFdsMGhra2crUFZYN1lGMStLbVRC?=
 =?utf-8?B?am0zRmcrYzFVVFc5aFhQV2krU1o3UXlTenZNdGN6SVZNWkZDc1pKaWk2Z0I2?=
 =?utf-8?B?MytOWnR4UmYvUGJWd0pTa1pmTjFIU0NQajZOWnJ5RXJ1SDRqWXl5RmQwWWRz?=
 =?utf-8?B?N0ZsdUh0bG4zOTRyVXJ3SC9BSGN2V2huc1lMbVdkSjcvRWp3R1RXR3FzNTJE?=
 =?utf-8?B?TlI3V1Q3aDVnV1JhYWZrQUhNVFpzcFdMZlBCN0lBNUZQUEQ5VWkvL0hZOUdP?=
 =?utf-8?B?eWROai8vSzhMMUwybkdkL0tuK2d3SFpINlpxQUpURWs3WDJyTmlmVUFkYWQ5?=
 =?utf-8?B?VzNOWmhvZlpBZ0JjdXc1eklncEdSVDdtUGZBeGRaK3dDRURjb0pFb2JBREVX?=
 =?utf-8?B?by8zZkJUdGF2SW4zK3haQ0prZmsvUU5yYTlXV2VMOE1JZzFHY0tFTnF2Nklj?=
 =?utf-8?B?M2RCVFMwdUJKbzBIZ1dPMDBxZWpMWGJuRlM1TFQ3MHJZZmhramtiYkl1ZzhK?=
 =?utf-8?B?SitSNWFQUFIwM21oTDFCbndUZGZob2FNYnZMSExFSWYrdkM1YTk3cDBVYnpO?=
 =?utf-8?B?RDE4UVVrS0hmT0VvbGlCTVVoeW9TRTJqc1IwS2haT3crWUFIY2pJZ3hwSWFE?=
 =?utf-8?B?ZTRkWlplK2Q1R0lNUjY3VVFXNHpMZlZSMitlN0VCcDk1UzM5VDA5YlF3cUp2?=
 =?utf-8?B?Q21IWk83LzhFTFRGN1ovaVdRVHFQdVlMeGlIM2NRLy9EdzlzVzVpVGx6RUVK?=
 =?utf-8?B?VjBKa3FiOWxqWHZiRGNtMURrQkk1K1N2Mk1pTXNncGNUWnp0SUxJQ1I0SEI2?=
 =?utf-8?B?eitmZjhyUXhKRE5DcUFaY1ZpODNRNVdJK2hoQjFlK3VEanA3OXRpTXdDOU85?=
 =?utf-8?B?eUxHQ3FiRjNvNGwwVW0xSlU5a3Z0OUJod3Rqd2NnTHVvcWlYZkVyczFMTXNG?=
 =?utf-8?B?OFV0dzJqTlBqYjQxUjJIWlRwUzZHbXhSbzFiUEZDMk9tdTUzNlZEVzBvby9T?=
 =?utf-8?B?dW9NK3VNRnZlMHgwTU92SjhKZ000YlFYeVdGVDB5N3BIMEJqT2l1MWpzaG5F?=
 =?utf-8?B?VUtoT2U4QnlrZGRRUWxsVFBtaHJnOVkwRzVOaGs3WXViWmJjZXZyMUk0bm00?=
 =?utf-8?B?UUovQzIvdSszdll3M2lmakxqai8zdnpqMDZkeitCMFprTzI2L1NKTDNsVkY0?=
 =?utf-8?B?R1NuQXJLSHhmK3Z4Q0tGZ0ZUZ2VKRlZjVmVlazE5SGk2b2ZNckZPYmh2aitG?=
 =?utf-8?B?aDVMWVRrYnhmbGVBK0tSbU5jSkpHWnNmUGVPY21qdlZ4REZwUW5yeFMyUEF3?=
 =?utf-8?B?UjdiSUNzMlU0c1JWaUlVWnVoZkU2MlhhWmw3dGNSN3NQamYrbzF3Q0IzZjJ4?=
 =?utf-8?B?bUw0aTJqWnJjaHVYa25pK1hPb3FpRXdsOEJIcEYzWEFYOWNsWEkwOERTYmNM?=
 =?utf-8?B?SHlrN1ZHcjkzT0JUNExlK1M1SVVraTZ1ZVYvcndzSHN4YnlCanZ4UnM4VUl4?=
 =?utf-8?B?YWkwd01ZS1ZReWd5Yk5UYTNYbFIrM1Y2QVRHb2ZJUUV1MDhmSEszQW9mOTdo?=
 =?utf-8?B?ZWJScXdzMmc2Ri9hZHJwSUFXb2Myd2hvNTdQSjduSDZqQUovUVJEYXhoY2dT?=
 =?utf-8?B?eHJhSGtYS01wNHk4Z2JVQXZEei8yaGFLOHBkWWk5NHpDK1ljakNRcU9JRndr?=
 =?utf-8?B?SDNOTVY0Tm9hb1BsUkhoNVpwVENvQ2gybmNtUjlYYWhFbDdtZzFBYkdPMHdU?=
 =?utf-8?Q?KukHmGx2/kkXsVtWBS2C1BtiHP/Dsw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjRHWmpTR3VTOWl5SzlEWkFyWHk1SHh1WG5sY094VUJXa3ZsblVGRUoyRDFw?=
 =?utf-8?B?Q0ZTMkZSZU5Zb1BiazBmUk03alBCUWV6aFpXdm1uZk8xeVNxMkJET0Q5Z29I?=
 =?utf-8?B?bXQvbXQ1ZTFuZkRtbUp6b0srRWFFNUQvUEtZYVNhK3E3ZHUrRHVvMTk4Zkxn?=
 =?utf-8?B?MTNpeGNsREplU0piYkhqZkNLLzFVTFU0bEhXSjc2Mlc2d0J6QXUwRkJ6SGo2?=
 =?utf-8?B?N0ZvMUNhZWNnQVR4TXNVVVpwMkZPM1ppQTFDcXBZTDk3NHpHWFo1WUtkaVpN?=
 =?utf-8?B?ZGh2UHZJbzdQRzdYaXJUWW12WTV3cGZITVZsRzNwUXZSRXV1Z1dKVm82VWhv?=
 =?utf-8?B?ZTZEVDhDZU1BK0Q4Q2w0RVF2NnJrU25SUW1Vd2N5eERGQzV6TlNBRWVscUhp?=
 =?utf-8?B?bzZFdkoxU1BIQVNvTVlEMUhyOUl4Nk56OEVxSk1iWE1xa3RiODFmMXlFNmU4?=
 =?utf-8?B?SVhqakF4Sy9OcVZSd0tUNDNpUzRuN09YSXFRMVAzbmt4d1RDd1FqZGRNaHN4?=
 =?utf-8?B?enAwa2RzL3R5bEdBd1ZQczVmR0VwcEcvQjZtdzkwTTJOTFF5ZHBrQlFGRE9B?=
 =?utf-8?B?cHV0UXNDc2ZuUkVUNmhqMWlhcENmNDFHMk5FV1N5dzRvZ2Z2UkZtUGpGNTI3?=
 =?utf-8?B?OUlyVXJWZFpaOGlUbkZlTHRJd2JOdWtyaUREODFWV1l5NExiSEloaE9salNH?=
 =?utf-8?B?K0RRRWdONndCMlBwb3Y0QU1HTERvVzliNmJzaXJ1aEhvaktJSFdNRStKQUFH?=
 =?utf-8?B?aDlRdGNMQ1EzS2ZPZGVZZWtZVU5WMkQzdTQ2d0RaVUE1VEI3c2t4VEhNUWVi?=
 =?utf-8?B?M05rai9YNm1wN0tuUGNleXJMUWN0Q2t4YmlnVFlMazl5dGkxbm9ZSUhQSEFv?=
 =?utf-8?B?QXZvaHQxODgrbnhHZnNkSXZVUGVNM2pwRlR4dHlMMm95VW5Eb09YbDhmK2J0?=
 =?utf-8?B?UHBtdzhDUWZaU0cxNmpEMlNpNVJXRkhtR3RVV0JmMEUyLzVSRUhKS0VHUFVw?=
 =?utf-8?B?RXIxVVdhbUZ3MGppbVVwOHUyelJkRFkvalAyc2lYeVI5WktjSm10L0tjOE4y?=
 =?utf-8?B?dG9ZcllWNTdzZERIazhiMEtIN2oxODdKUzMrK2kyMDFFRHptZHYzclJUVGI0?=
 =?utf-8?B?ZVhtWDFNU243U1kxOTJRQWFvS0JNUnpHMngreld1SDlRMm1FRlVoMzVYOE02?=
 =?utf-8?B?MUpYYUZVU0o4eFhkR3ljYnVneEFTbngvU0V4MFZ6dFdnZ0diZW9GTk1HMHI3?=
 =?utf-8?B?anp0T1p4UlNkY0FJR3VKRHk0dUk1SVhlU0tPL0ErL0FXNDZDcUhDQ3BmUGpC?=
 =?utf-8?B?L2JUbUpXNGdvcGlVcVJ1bXFMR3NBMEdFc2czV2wvZlljdldHWWg0elNzbUhI?=
 =?utf-8?B?elFMZ1Zid3ZSUGR1RDcyQml2WFFtZDVqTmVxRFNFcGpaeHRLbmVUWkdRdzkw?=
 =?utf-8?B?TUlGaW9CVXFMWVpIUEhmVWtDa2VaZzBhdXBaQ2Z2WTVpUlc4WGdFbHVmOG8y?=
 =?utf-8?B?dm5qM3premVtYXF2QmFSd2pzMGcvYTRaVXRTUTlSUGh6Y3ZwR0NuSDRWSWgv?=
 =?utf-8?B?dENqNGo1QUxNSmtJNDdaUEY1SzJJS0M4ekZiU2pkZURRRG00UlM5Y3Qzb2RQ?=
 =?utf-8?B?aHoyN3JZN3hGVXJRVXNZbTF4bE55T0NXMXVrclBENnorY3VWTHRGanV0NmVw?=
 =?utf-8?B?M0V3eU5nSGRNUCtMeUxiMzltN0tQNzJrL3BmUkxMaTFueHdjTmZYMUxpVC9Q?=
 =?utf-8?B?L0c4R1UxMXFtWHZaNmVMS2owVmFZcW0vZm0xblZzdHRGMnB0UTc0UVNyOURn?=
 =?utf-8?B?N0xpQ0NETG5IUUwzYXJXSGtLVk01OEhKRlN4dGdveXFqQ3V0bFIvZllIdjVO?=
 =?utf-8?B?b1kraTlWU3ZXaWUvNHl5bldESHlCT1YrSG9ibXdad21oYjlzaGpVMnNPSkMy?=
 =?utf-8?B?ZnhnZzB6Y2UzUjdXdW1rNkJCVm4zZUpUdUdnK0JGWXAybTZ2Mmtmcm5RdzdJ?=
 =?utf-8?B?YTJjcHdDY2JzY2NrUU1mUDc2bjYzWFBqQXE5Z0trM1hOeU9OaDRaYkJQK2lq?=
 =?utf-8?B?bWVxRzJHUGZjTHJwaWFaVVczeVJBQVVLY0M2VnZCLy83TFcxL3pUWFZORG9y?=
 =?utf-8?Q?gurA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <828D5CEAAEA4464D81B6F30FED741B29@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaec111b-597a-4f68-2ebe-08dd96a7c69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 07:35:49.1631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sDX4DLKLUfMBew6qLDAd9CTlMkZyhV/XHu33rqfBdGyjw34vwqqB/1KNB6I6yJozePXIIgxphk0bOr5jWk59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439

T24gMjAyNS81LzE4IDIyOjQ0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDUuMjAyNSAx
MTowNSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBAQCAtODMsNiArOTksMTAwIEBAIHN0YXRpYyBp
bnQgYXNzaWduX3ZpcnR1YWxfc2JkZihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICANCj4+ICAj
ZW5kaWYgLyogQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQgKi8NCj4+ICANCj4+ICtzdGF0
aWMgc3RydWN0IHZwY2lfcmVnaXN0ZXIgKnZwY2lfZ2V0X3JlZ2lzdGVyKHN0cnVjdCB2cGNpICp2
cGNpLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgaW50IG9mZnNldCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaXplKQ0KPj4gK3sNCj4+ICsgICAgY29uc3Qg
c3RydWN0IHZwY2lfcmVnaXN0ZXIgciA9IHsgLm9mZnNldCA9IG9mZnNldCwgLnNpemUgPSBzaXpl
IH07DQo+PiArICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpybTsNCj4+ICsNCj4+ICsgICAgQVNT
RVJUKHNwaW5faXNfbG9ja2VkKCZ2cGNpLT5sb2NrKSk7DQo+PiArICAgIGxpc3RfZm9yX2VhY2hf
ZW50cnkgKCBybSwgJnZwY2ktPmhhbmRsZXJzLCBub2RlICkNCj4+ICsgICAgew0KPj4gKyAgICAg
ICAgaW50IGNtcCA9IHZwY2lfcmVnaXN0ZXJfY21wKCZyLCBybSk7DQo+PiArDQo+PiArICAgICAg
ICBpZiAoICFjbXAgJiYgcm0tPm9mZnNldCA9PSBvZmZzZXQgJiYgcm0tPnNpemUgPT0gc2l6ZSAp
DQo+IA0KPiBXaGF0J3MgdGhlIHBvaW50IG9mIHVzaW5nIHZwY2lfcmVnaXN0ZXJfY21wKCkgd2hl
biB5b3UgbmVlZCB0byBkbw0KPiB0aGUgImV4YWN0IG1hdGNoIiBjaGVjayBoZXJlIGFueXdheT8N
Ck9oLCB5b3UgYXJlIHJpZ2h0Lg0KV2lsbCByZW1vdmUgIiFjbXAiIGhlcmUgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IA0KPj4gK3N0YXRpYyBpbnQgdnBjaV9jYXBhYmlsaXR5X21hc2soc3RydWN0IHBj
aV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCBjYXApDQo+IA0KPiBXaGF0J3MgdGhlIHdvcmQgIm1h
c2siIGluZGljYXRpbmcgaGVyZT8gVGhlIGZ1bmN0aW9uIGRvZXNuJ3QgcmV0dXJuIGFueQ0KPiBt
YXNrIGFmYWljcy4gRG8geW91IHBlcmhhcHMgbWVhbiAiaGlkZSI/DQpZZXMsIGhpZGUuDQpUaGlz
IGlzIGEgcXVlc3Rpb24gb2YgbmFtaW5nIHByZWZlcmVuY2UuDQpJIHJlbWVtYmVyIFJvZ2VyIHN1
Z2dlc3RlZCB0aGlzIG5hbWUsIGJ1dCBtYXliZSBJIHJlbWVtYmVyIHdyb25nLg0KRm9yIGRvdWJs
ZSBjb25maXJtYXRpb24sIGhpIFJvZ2VyLCBhcmUgeW91IGZpbmUgdGhhdCBJIGNoYW5nZSB0aGlz
IG5hbWUgZnJvbSBtYXNrIHRvIGhpZGU/DQoNCj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJk
cywNCkppcWlhbiBDaGVuLg0K

