Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1EB05700
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 11:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043919.1413966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcFH-0001Mp-MU; Tue, 15 Jul 2025 09:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043919.1413966; Tue, 15 Jul 2025 09:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubcFH-0001K3-Jc; Tue, 15 Jul 2025 09:46:43 +0000
Received: by outflank-mailman (input) for mailman id 1043919;
 Tue, 15 Jul 2025 09:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXV7=Z4=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubcFG-0001Jx-MB
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 09:46:42 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a76e52c-6160-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 11:46:38 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by PA4PR03MB7086.eurprd03.prod.outlook.com (2603:10a6:102:e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Tue, 15 Jul
 2025 09:46:35 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Tue, 15 Jul 2025
 09:46:35 +0000
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
X-Inumbo-ID: 9a76e52c-6160-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWEDYT8RIJNRQQt8ldrdlKmNZ2NzoRBV3IJDRIPWbdZGmvuA301PvOmJok5xoQvnEjgKF1SlbF2qJIYFiyW3d9YrmckF/1RoB+Ddk0YDGXBAEx+czfyHQXMxlSL3Z9zJ64JFaPwVDUK6FlsoqGUsT37n4Qe1i89S6k/tfCMOznVGUUG5CFi4oeQ+OSgFn0X8NHmHeUQ+EdScxCC8H2G27u7pWvlAJXbj9iY4sM6LDhIoUeX+PG9KkLfqGvO9WF983ki7nX9T12M2P+Za0QqJQMSrJiYWkf7IHKVEjmIl2kJmgDYSw9LX8a5qyCJXrCJU8UpL9ye2VsOmTmJseoP+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvJObUxjYilri80yHwI2yt6KuAa+o4R5PdUWPp6kku0=;
 b=E/mi1779gFHJXxhOzhbaRjOOzvz/LUjPsGOpFc4iECX4gLCREplIjPdDoJ4/Q59MrY06jX9Pm9gXbhXlMAdQK0dHMkp0wjmEc433YQUyT3y4G4AWpE50hVK74SWcXUxdvSs9IkvAiSD9cpuTqrhZLeOD1zeu2CXlbk1XhUnK1Mfn4J+ELU03PdjIKZlQ1PKDXLjqdsiBEGAlI77+O8R587+G8vqXZR2kJzOMsutq2Gp45D3bpwqJgs4lRMUWyEyisSLYO7QApkzSMOFHtPXBmEZqCHgodqYL/m1VntUK06tH+xyVSXDWhVdSf0WvPkuIN0ao9797iHciRjlFL9bZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvJObUxjYilri80yHwI2yt6KuAa+o4R5PdUWPp6kku0=;
 b=TaZQ2pI07QoouwqcjbXVYD91HDKe1NYOLsuzQql0uFb9mmNH8DPy6cKjk76GjUOPnSQ9FBLh8wVUgxznRnx8amIhVQtNoOHgbM2y//j8vEB8GSNXJWQUyhwDudgM3+BOGnHjOrgXi1q4xApkRvEem7kHeN4MzZq1gRoFcRPPae/c4Gwab5R6CTm99Ha4lf4Y0e05+QraiuNFurUhMMTUBgicjYNLWrHqurQKudeLJzva8wB+dhYlsy5Bfj4TyCibBgRL/dDyZnADHzSluqV0KbE3XHacw4gjaHAAw8a3ZCCo400bT/7ctFOk1sCXu7uzzs/9ptw291BLoan2nZXBeA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQ7QsmXCAgAEYpgCAA5T3AIABsXIA
Date: Tue, 15 Jul 2025 09:46:35 +0000
Message-ID: <d8e714ad-e1a9-4d9d-9a2b-8eb796f21e04@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
 <b5759332d598ec9b3d7df520735d9dbe@bugseng.com>
 <alpine.DEB.2.22.394.2507111712120.605088@ubuntu-linux-20-04-desktop>
 <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
In-Reply-To: <bd89ecfe-83b3-471b-8455-83b9974bdaf2@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|PA4PR03MB7086:EE_
x-ms-office365-filtering-correlation-id: b2e0cbbd-111e-4106-cce5-08ddc3847ca7
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|42112799006|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajR1S2tHUzdoQ0dDVytGMUZHSytrYzRPK1dzVmxjTGtzcnMwOVZrTFhoSnBF?=
 =?utf-8?B?TW1xdExSa2Jra2ZQSHF5Qi8rSlMwOWxseXE2QkN1TEY1Um55TkpSY05PbWdY?=
 =?utf-8?B?cXhEVVo0WG16NlVCM0hpdWFTdjJsVmYrd3VHS3VVVnZiL0l3ZG8rY3RhRlJk?=
 =?utf-8?B?bXExMFl2QjdySkd3YU5kZ2Y3MTNFV29ZRW5jZ1l0a3NuS1BVOVpYT01tUnVY?=
 =?utf-8?B?V0IweGhXQkw0U2licUpjZHZCWXF5UDdUREFSbTkxdG1abWhxRUhjYVNoZzkw?=
 =?utf-8?B?Zkp5bzNvSzJwVCtpb3p6MmVOcHc4dHBvQkJCS3BNbFNsdVJ1SWZndjFIcWVN?=
 =?utf-8?B?YnhMUEVaODVadUJUcVVxMERkNTZHRFNSWng1Mi9Ec0NGSE10NVBTN0Q1U2s3?=
 =?utf-8?B?ZzJ5YXZWKzB0eFVHWnA0bjEyZEEwTTdaK3JJakpvNkRFYU9TV0dremFUSXJp?=
 =?utf-8?B?MWk5TVVMVk00dGd3L3FrU0VObThPUVhVNkpOK0RZMlNFbTdOMGREcUNEcytC?=
 =?utf-8?B?T1llVjR0OFNvYUxBbStXNGhpdVl3S3lsejBBbE9SZHczeXZBZGJlUFBMVjk1?=
 =?utf-8?B?QmloNDh1N2MyK29QV3BKL1dHREZCOWZmSWt1NGkwSUpEazFKb2hmRnc5S1dP?=
 =?utf-8?B?c0JrRDVkQ3l3V1dFTGpaN0lXUmxQSWErQkRLUlV2bDZiS3dacFV1aEtFL3Fq?=
 =?utf-8?B?WXBSWDVqSUIzdzUzMG9sSlA3cDV4VTVDbm9pNW9GdnJ6R3hYeHd5VjRxOVFL?=
 =?utf-8?B?Sk0waExsYnk3dUtBYVFRUmZlNjJrNUlGMEdGblFrcU50V2FzTUxSOU5HZVlP?=
 =?utf-8?B?Q0h5V0U1Z1NxVDVqRnVoMmdjdFNHOTFDSURrOFRGSy9RdnFDOWdVQnhXdDRj?=
 =?utf-8?B?RDY4L1dKajZzVklNdkF2U2FoV2dVM3RUU1lTWktDalpKS2FyRytFWkM3SDF0?=
 =?utf-8?B?TmN0cFgyVWRsclROdVN4ZGlzeFhZdnI5SEZHZitqQ0Z4VkI3TjdGOTA1WUNz?=
 =?utf-8?B?cU45Uk53dzBwVFcxRDBzMHpRWlNjWHhLNDl2RzRFUENuLzVHRGJhSEdpUDVv?=
 =?utf-8?B?cmVpREZIUCszZ2trZ3FXN3ExdjMraXBtMlc5eWhwekgxQ3E1dXU3RXFvcTJD?=
 =?utf-8?B?WW56cS8zeTRrdUc5QkJIMEdpcnlmcVE3cC8yalpMMFdWSTh3WDFld25nblZD?=
 =?utf-8?B?V25YM1kwTlNQbDl2cDlrbG5LN0JPSE5mbFpOd3NKNHdvTXdvUlpyQ0VhV1FU?=
 =?utf-8?B?cE5xZGN4RzBTT3NteWRYL3VVM0hFYmhqTWcwbTQ4N1NjcXh6Y0hOdUdXcHJK?=
 =?utf-8?B?VWVUSlkvZVVBb2pqbFZZZzEwSjcxZDdnWlBlcmUwOVBTeitKZlA5YUpuVXVY?=
 =?utf-8?B?STZOVVRYWnVUZDlqYmg2RzI5eERwMHhCY3F3SklJRnRId0N6alFLa1Bka0dx?=
 =?utf-8?B?VXV0RGR4UCt2bkZ6bldtMzRUNjZVeDFpZ2g5UUgwaVc1R3drRE0veVIyNit5?=
 =?utf-8?B?QmpQVTlERmNuMXBGN1VZT1hGb2dYWWZ4REFQZkRyWVNqc3RhemlvTm0zSVEx?=
 =?utf-8?B?OStyYnRWUDgrbHFpTGVDcWVQd2Z1aXVKTnVmUFdXMlVPNTBGbk5EMDYvTHhL?=
 =?utf-8?B?d1psOCtOTVlTY3dTUjN6TTExa3dIaWo3UE1YQ0FldzZPMWZkNXVUa1VUbzcw?=
 =?utf-8?B?ZU1wNDFZSHN1N1AyR0podWxxYW92VlZjSWRtWWVBaEJybGZUcWhzUTN2QXJo?=
 =?utf-8?B?UWFHcWpLcjhRMS8xcFU0RWV0K0lEK2FicG5EQktiRnFPTzZDRFdGNHRzd1Ra?=
 =?utf-8?B?aUxxdzBSRjVDQWFpeVFwSmZ2RGNKeTc0WGpWbXdnSllya2E4Z0F1TmpEL2xn?=
 =?utf-8?B?N1RwSlROUVBEdEpHWFZIUXBROWE3NXdOOVFibDhWc3praXRwMHZtTVdKOWlT?=
 =?utf-8?B?Z0Z1NUtFTjd4REkyVEpIUTA2b2JTclF4R0UveDM3a2xkcDVScllOcGpqNzFm?=
 =?utf-8?B?KytodU1FeGJ3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(42112799006)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmRaUk1NL29MZ1prYmxqc2ZNZU1VOWNMdWwvZ0FwUkRWZHJGQThKcnFycXdH?=
 =?utf-8?B?U21vSjJBbVJCUWtNQkpzY0lIMG9RWlFZOGtxTW5OMUU0YVJpYnhBMjdwZDBS?=
 =?utf-8?B?b3ErRVdSRjNXSnBDQVl2SFNWaytCYlFwcDk1Nm91SkNNMW96Q2FjR3lHREFT?=
 =?utf-8?B?RTErWHFxdCtYYmFHdDNYeW5hZ1BLVnRveWVtRWR6MGRPOEU3UnpjcjZRZlM3?=
 =?utf-8?B?YmFwWVNEVnI4RVJBYUNtT1lSY3FQQ2ZEZWNWalpWTzhRRHViNmhiR2ZYMjFD?=
 =?utf-8?B?Wi9HOGlFOUFLbzdlS0s4ZDMvdFR1Qm4rdERFZGprc0ZkazE3OHdnNU9VNDRE?=
 =?utf-8?B?c05MOEVSdnd4cytBbFY4Zjd6ZWkxalJCRk13OUphSlpUenUzRkJWeGxrRjZR?=
 =?utf-8?B?ZERWNHBFRG02VmhMYjhVSk01Q2krWkJPOUh4b3NsUW9nSmExSktmc2p5NGpL?=
 =?utf-8?B?NkdZOUIxY1VDYngxcFllSmNjU1pvOFp2ODk3b29naytoaWFWNVRDK3NzcGFj?=
 =?utf-8?B?RlRuQ2ZOVk1HWE40UXhua2p2aXNBREVmeDdjbEs2M05HK1N1UjcxRW9wVFBI?=
 =?utf-8?B?N3c5Uzl3Nzh1MmFYUmJpcEtHN1ZPaVRKTWlYMTYycnJ4bWttVjE3SS92VWN5?=
 =?utf-8?B?a3p2azNZRGdaM2xVUjlOZk9pU3U3Qy9zYVhrRWExNlduQWk2eG1HWlV3STRV?=
 =?utf-8?B?N2ZBQXNNdVAxUDQ3TzNlZTNlUWhqVjg0SE4yRDM2SGo2TlFPQWRTUUptK0I0?=
 =?utf-8?B?OVR6VjhqM2pZYkNvY1M1QjdzWE05eXp1djFaWnBkQ0NxelJvbXpkWHhoWlBU?=
 =?utf-8?B?UlF6TzZjdjROdStiYzltSmdEOFo4cXZqNVpzQjNSVHptYzBHWlFiZmNGWkly?=
 =?utf-8?B?Q2NhQUdUVVZHQkNxd3pLTmV0dDRQbUQxRSt2eWZSRzhtR1FTYnJwS0dsSXd2?=
 =?utf-8?B?VHNxbFQ2NnlLa1ZpUmtlSGFUNTZtaGJ6ZjRMOXBRcGhaajM0UkZSVEd5cVJK?=
 =?utf-8?B?RjFOZVl1WkhnQmlHME5nZ2tvbVhzZWwvVXZXand2MU93UTJ2VHNJWjJLVkln?=
 =?utf-8?B?MjFsWC9nYU1xNFNoZUZwUXRhZ1BoNXFuMkk1bzN5eDhCWmx6R2JKYWJxTzY5?=
 =?utf-8?B?NTA4NWh1cGlEVEtWbVI2TlpQeUVhSzV3MTNZVEpkZzkwVXpqTVdzVEhGWU5E?=
 =?utf-8?B?TDV6S2Q0K3NuMzdCK2lCNzIydlRBNjZEN0hSZUdiWXFhNzRsWHNYUFMzMGxy?=
 =?utf-8?B?dWwzRUNFZTV3WTNRRXdKOXZqWWcvTHNvM0k1YXYrR09ydFg3L3lFb2N5cnE3?=
 =?utf-8?B?blE1RGt1RTZNem1peXhnN2NSQ1hBTkt4N3YreEp2cGdVSnp2M0pFMVc0ajVu?=
 =?utf-8?B?eGdIUU5kOERTUG5pTFZHMk9PL1U4V0x3Ujl6WVRhakxDNHowY2lPZTZtZHIy?=
 =?utf-8?B?bjlGakFaK0NnRUtnZE5COFo4T2JHS2NiTHA2RWlnTjhVUmFEOEhJKzNvUUtX?=
 =?utf-8?B?QzRRY3lFTjhWZEtWYjJDMEpRSWpVb2ZlVFZsTVVycDJ4azdwQXdHNFNTTHh6?=
 =?utf-8?B?dlJwR0R2VDkrZ0R3WVhnTnJMa3cwWHh6dG9DRjFYRkV6WUJhdzZ2MndKajZj?=
 =?utf-8?B?bzAybkRNVllHZGorSHp6SjMzQ2U1emhSbnl5aFEvbHFZMTM0N2dpalJhamRr?=
 =?utf-8?B?VDZWUFhjVWJ5OTNPYWxsVkdLSzBVQWRnaG5Ua3Z4eG94STdsNjFBcmU2T1da?=
 =?utf-8?B?TjFxbzRlbDExSk5xMTZoUi9ZdjJONmN0aldpbHg0ZExCVWRjWnhsOHlFTXJa?=
 =?utf-8?B?K1dHR2x2Zk83eUJSNDJ5ckRuK0FjOVhuSmFhSDQxTVU1K2hUeWJJc0lTZWlH?=
 =?utf-8?B?REtXTmFhckxjaG9EYndvMExKUmRXd3VLOHVpWU80OGEvbWxkM2FCRmpBSkh4?=
 =?utf-8?B?RXR0c3ZMb0I3RGZCcXdMbHRCKzdoblNEaTJnV1lMSzNub2VtbUcyTHEwc3Jx?=
 =?utf-8?B?UUx1YTRLQy9aYTM2K2pOakE5cmNibDhQSm16MDIwUHc3WC9CNEF4aS9YVVIv?=
 =?utf-8?B?RGhLc3o5UURsb1k4bFNBTkdWOWw2YUJaZXdKQ0JCWW5UeWF5U0xVUXZQcWh5?=
 =?utf-8?B?UXBseFBlZkFQc0xOQlhpV1cyT0xsUE5ieDJ6UTIrUHlneVZiWkpYZEJRZnN1?=
 =?utf-8?B?REE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <184637E0BAF62D4C9FBBA7678A7862BF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e0cbbd-111e-4106-cce5-08ddc3847ca7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 09:46:35.0562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dF+MQSfn2sJotvPdyvLssjvegPNMqI8rCpzeOStq2AFrUEQ6M74yc9ljKvr3su9/lZg00A1YaO8pbqUT4A85IhxJMQ2aImNOQi1gflpLuwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7086

SGkgSmFuIGFuZCBTdGVmYW5vLg0KDQpDb3VsZCB3ZSBwcm9jZWVkIHdpdGggQVJNIGRldmlhdGlv
bnMgb25seSBzbyBmYXI/DQpJIHVuZGVyc3RhbmQgU3RlZmFubydzIHByZWZlcmVuY2VzLCBidXQg
aXQgY2FuIHVuYmxvY2sgbWUgdG8gYWRkcmVzcyANCm5leHQgQVJNIHZpb2xhdGlvbnMuDQoNCkJS
LCBEbXl0cm8uDQoNCk9uIDcvMTQvMjUgMTA6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAx
Mi4wNy4yMDI1IDAzOjEzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+PiBPbiBGcmksIDEx
IEp1bCAyMDI1LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+PiBPbiAyMDI1LTA3LTA5IDIzOjM4
LCBEbXl0cm8gUHJva29wY2h1azEgd3JvdGU6DQo+Pj4+IE1JU1JBIEMgUnVsZSA1LjUgc3RhdGVz
IHRoYXQ6ICJJZGVudGlmaWVycyBzaGFsbA0KPj4+PiBiZSBkaXN0aW5jdCBmcm9tIG1hY3JvIG5h
bWVzIi4NCj4+Pj4NCj4+Pj4gVXBkYXRlIEVDTEFJUiBjb25maWd1cmF0aW9uIHRvIGRldmlhdGU6
DQo+Pj4+IC0gY2xhc2hlcyBpbiAneGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oJzsNCj4+Pj4gLSBj
bGFzaGVzIGluICd4ZW4vaW5jbHVkZS94ZW4vaXJxLmgnOw0KPj4+PiAtIGNsYXNoZXMgaW4gJ3hl
bi9jb21tb24vZ3JhbnRfdGFibGUuYycuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERteXRy
byBQcm9rb3BjaHVrIDxkbXl0cm9fcHJva29wY2h1azFAZXBhbS5jb20+DQo+Pj4+IC0tLQ0KPj4+
PiAgIGF1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbCB8IDgg
KysrKysrKysNCj4+Pj4gICBkb2NzL21pc3JhL2RldmlhdGlvbnMucnN0ICAgICAgICAgICAgICAg
ICAgICAgICAgfCA4ICsrKysrKysrDQo+Pj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+Pj4gYi9hdXRvbWF0aW9uL2VjbGFpcl9hbmFseXNp
cy9FQ0xBSVIvZGV2aWF0aW9ucy5lY2wNCj4+Pj4gaW5kZXggZThmNTEzZmJjNS4uYTVkN2IwMDA5
NCAxMDA2NDQNCj4+Pj4gLS0tIGEvYXV0b21hdGlvbi9lY2xhaXJfYW5hbHlzaXMvRUNMQUlSL2Rl
dmlhdGlvbnMuZWNsDQo+Pj4+ICsrKyBiL2F1dG9tYXRpb24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJ
Ui9kZXZpYXRpb25zLmVjbA0KPj4+PiBAQCAtMTE3LDYgKzExNywxNCBAQCBpdCBkZWZpbmVzIHdv
dWxkIChpbiB0aGUgY29tbW9uIGNhc2UpIGJlIGFscmVhZHkNCj4+Pj4gZGVmaW5lZC4gUGVlciBy
ZXZpZXdlZCBieSB0aGUgYw0KPj4+PiAgIC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVs
aWJlcmF0ZSwNCj4+Pj4gImFueV9hcmVhKGRlY2woa2luZChmdW5jdGlvbikpfHxhbnlfbG9jKG1h
Y3JvKG5hbWUobWVtY3B5fHxtZW1zZXR8fG1lbW1vdmUpKSkpJiZhbnlfYXJlYShhbnlfbG9jKGZp
bGUoXnhlbi9jb21tb24vbGliZWxmL2xpYmVsZi1wcml2YXRlXFwuaCQpKSkifQ0KPj4+PiAgIC1k
b2NfZW5kDQo+Pj4+DQo+Pj4+ICstZG9jX2JlZ2luPSJDbGFzaGVzIGJldHdlZW4gZnVuY3Rpb24g
bmFtZXMgYW5kIG1hY3JvcyBhcmUgZGVsaWJlcmF0ZSBmb3INCj4+Pj4gYml0b3BzIGZ1bmN0aW9u
cywgcGlycV9jbGVhbnVwX2NoZWNrLCB1cGRhdGVfZ250dGFiX3BhciBhbmQNCj4+Pj4gcGFyc2Vf
Z250dGFiX2xpbWl0IGZ1bmN0aW9ucw0KPj4+PiArYW5kIG5lZWRlZCB0byBoYXZlIGEgZnVuY3Rp
b24tbGlrZSBtYWNybyB0aGF0IGFjdHMgYXMgYSB3cmFwcGVyIGZvciB0aGUNCj4+Pj4gZnVuY3Rp
b24gdG8gYmUgY2FsbGVkLiBCZWZvcmUgY2FsbGluZyB0aGUgZnVuY3Rpb24sDQo+Pj4+ICt0aGUg
bWFjcm8gYWRkcyBhZGRpdGlvbmFsIGNoZWNrcyBvciBhZGp1c3RzIHRoZSBudW1iZXIgb2YgcGFy
YW1ldGVycw0KPj4+PiBkZXBlbmRpbmcgb24gdGhlIGNvbmZpZ3VyYXRpb24uIg0KPj4+PiArLWNv
bmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLA0KPj4+PiAiYW55X2FyZWEoYWxs
X2xvYyhmaWxlKF54ZW4vaW5jbHVkZS94ZW4vYml0b3BzXFwuaCQpKSkifQ0KPj4+DQo+Pj4gQml0
b3BzIHZpb2xhdGlvbnMgYXJlIG5vdCBpbnNpZGUgInhlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaCIs
IGJ1dCByYXRoZXINCj4+PiAieGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2JpdG9wcy5oIg0KPj4+
DQo+Pj4+ICstY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+Pj4+ICJh
bnlfYXJlYShhbGxfbG9jKGZpbGUoXnhlbi9pbmNsdWRlL3hlbi9pcnFcXC5oJCkpJiZjb250ZXh0
KG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSYma2luZChmdW5jdGlvbikpKSJ9DQo+Pj4NCj4+PiBJ
IHdvdWxkIHJhdGhlciBkbyAodW50ZXN0ZWQpDQo+Pj4NCj4+PiAtY29uZmlnPU1DM0EyLlI1LjUs
cmVwb3J0cys9e2RlbGliZXJhdGUsDQo+Pj4gImFsbF9hcmVhKGRlY2wobmFtZShwaXJxX2NsZWFu
dXBfY2hlY2spKXx8bWFjcm8obmFtZShwaXJxX2NsZWFudXBfY2hlY2spKSkifQ0KPj4+DQo+Pj4+
ICstY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsDQo+Pj4+ICJhbnlfYXJl
YShhbGxfbG9jKGZpbGUoXnhlbi9jb21tb24vZ3JhbnRfdGFibGVcXC5jJCkpJiZjb250ZXh0KG5h
bWUodXBkYXRlX2dudHRhYl9wYXJ8fHBhcnNlX2dudHRhYl9saW1pdCkmJmtpbmQoZnVuY3Rpb24p
KSkifQ0KPj4+PiArLWRvY19lbmQNCj4+Pj4gKw0KPj4+DQo+Pj4gc2FtZSBhcyBhYm92ZQ0KPj4+
DQo+Pg0KPj4gVGhhbmtzIE5pY29sYSEgVGhlIGZvbGxvd2luZyBkZXZpYXRpb25zIGFyZSBlbm91
Z2ggYW5kIHN1ZmZpY2llbnQgdG8NCj4+IHplcm8gdmlvbGF0aW9ucyBvbiBib3RoIEFSTSBhbmQg
eDg2Og0KPj4NCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFu
eV9hcmVhKGFsbF9sb2MoZmlsZSheeGVuL2luY2x1ZGUveGVuL2JpdG9wc1xcLmgkKSkpIn0NCj4+
IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVhKGFsbF9s
b2MoZmlsZSheeGVuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2JpdG9wc1xcLmgkKSkpIn0NCj4+IC1j
b25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVhKGFsbF9sb2Mo
ZmlsZSheLiovY29tcGF0XFwuYyQpKSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMr
PXtkZWxpYmVyYXRlLCAiYW55X2FyZWEoYWxsX2xvYyhmaWxlKF4uKi9jb21wYXQvLiokKSkpIn0N
Cj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFueV9hcmVhKGFs
bF9sb2MoZmlsZSheeGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLy4qJCkpKSJ9DQo+PiAtY29uZmln
PU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbnlfYXJlYShhbGxfbG9jKGZpbGUo
Xnhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9nZW5hcGljXFwuaCQpKSkifQ0KPj4gLWNvbmZpZz1N
QzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKHBhcnNl
X2dudHRhYl9saW1pdCkpfHxtYWNybyhuYW1lKHBhcnNlX2dudHRhYl9saW1pdCkpKSJ9DQo+PiAt
Y29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5h
bWUodXBkYXRlX2dudHRhYl9wYXIpKXx8bWFjcm8obmFtZSh1cGRhdGVfZ250dGFiX3BhcikpKSJ9
DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShk
ZWNsKG5hbWUocGlycV9jbGVhbnVwX2NoZWNrKSl8fG1hY3JvKG5hbWUocGlycV9jbGVhbnVwX2No
ZWNrKSkpIn0NCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFs
bF9hcmVhKGRlY2wobmFtZSh2aXJ0X3RvX21hZGRyKSl8fG1hY3JvKG5hbWUodmlydF90b19tYWRk
cikpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxf
YXJlYShkZWNsKG5hbWUoc2V0X3B4X3BtaW5mbykpfHxtYWNybyhuYW1lKHNldF9weF9wbWluZm8p
KSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2Fy
ZWEoZGVjbChuYW1lKHNldF9jeF9wbWluZm8pKXx8bWFjcm8obmFtZShzZXRfY3hfcG1pbmZvKSkp
In0NCj4+IC1jb25maWc9TUMzQTIuUjUuNSxyZXBvcnRzKz17ZGVsaWJlcmF0ZSwgImFsbF9hcmVh
KGRlY2wobmFtZShjcHVfaGFzX2FtZF9lcnJhdHVtKSl8fG1hY3JvKG5hbWUoY3B1X2hhc19hbWRf
ZXJyYXR1bSkpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9e2RlbGliZXJhdGUs
ICJhbGxfYXJlYShkZWNsKG5hbWUoY29weV90b19ndWVzdF9sbCkpfHxtYWNybyhuYW1lKGNvcHlf
dG9fZ3Vlc3RfbGwpKSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41LHJlcG9ydHMrPXtkZWxpYmVy
YXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKGNvcHlfZnJvbV9ndWVzdF9sbCkpfHxtYWNybyhuYW1l
KGNvcHlfZnJvbV9ndWVzdF9sbCkpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9
e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoZWRkX3B1dF9zdHJpbmcpKXx8bWFjcm8o
bmFtZShlZGRfcHV0X3N0cmluZykpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1LjUscmVwb3J0cys9
e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoY3B1X2hhc19hbWRfZXJyYXR1bSkpfHxt
YWNybyhuYW1lKGNwdV9oYXNfYW1kX2VycmF0dW0pKSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41
LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKHBhZ2VfbGlzdF9lbnRy
eSkpfHxtYWNybyhuYW1lKHBhZ2VfbGlzdF9lbnRyeSkpKSJ9DQo+PiAtY29uZmlnPU1DM0EyLlI1
LjUscmVwb3J0cys9e2RlbGliZXJhdGUsICJhbGxfYXJlYShkZWNsKG5hbWUoZG9fcGh5c2Rldl9v
cCkpfHxtYWNybyhuYW1lKGRvX3BoeXNkZXZfb3ApKSkifQ0KPj4gLWNvbmZpZz1NQzNBMi5SNS41
LHJlcG9ydHMrPXtkZWxpYmVyYXRlLCAiYWxsX2FyZWEoZGVjbChuYW1lKGRvX3BsYXRmb3JtX29w
KSl8fG1hY3JvKG5hbWUoZG9fcGxhdGZvcm1fb3ApKSkifQ0KPj4NCj4+IEphbiwgYXJlIHlvdSBP
SyB3aXRoIGl0Pw0KPiANCj4gRm9yIG1hbnkgb2YgdGhlbSB0aGUgc2NvcGUgKGFsbF9hcmVhKSBs
b29rcyB0byBiZSBmYXIgdG9vIHdpZGUsIGVzcGVjaWFsbHkNCj4gZm9yIGFib3V0IGV2ZXJ5dGhp
bmcgaW52b2x2ZWQgaW4gY29tcGF0IGhhbmRsaW5nLiBJIGNhbiBvbmx5IHJlcGVhdCB0aGF0IEkN
Cj4gdGhpbmsgdGhhdCB3ZSB3b3VsZCBiZSAoZmFyKSBiZXR0ZXIgb2ZmIG5vdCBoYXZpbmcgd2lk
ZXIgdGhhbiBuZWNlc3NhcnkNCj4gZGV2aWF0aW9ucy4NCj4gDQo+IFRoZXJlIGFyZSBvdGhlcnMg
d2hpY2ggSSBtYXkgbm90IHVuZGVyc3RhbmQsIGUuZy4gdGhlIGdlbmFwaWMuaCBvbmUuIElPVyBJ
DQo+IGZ1cnRoZXIgdGhpbmsgdGhhdCBzdWNoIGEgY2hhbmdlIHdvdWxkIG5lZWQgdG8gY29tZSB3
aXRoIGEgZmFpciBiaXQgb2YNCj4gZXhwbGFuYXRpb24gLyBqdXN0aWZpY2F0aW9uLg0KPiANCj4g
SmFuDQo=

