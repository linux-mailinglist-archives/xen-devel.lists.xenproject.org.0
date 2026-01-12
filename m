Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2CD123A0
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:18:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200109.1516113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFwW-00035V-La; Mon, 12 Jan 2026 11:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200109.1516113; Mon, 12 Jan 2026 11:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFwW-00033x-Iq; Mon, 12 Jan 2026 11:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1200109;
 Mon, 12 Jan 2026 11:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j+ET=7R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfFwV-00033p-5C
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:18:39 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 706a21af-efa8-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 12:18:38 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6038.namprd03.prod.outlook.com (2603:10b6:208:312::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:18:34 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 11:18:34 +0000
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
X-Inumbo-ID: 706a21af-efa8-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaM6qaGFDXu6WRuE7hbY03NU1HrmQm7QlnQIe5qKKE9H90Lj5MG1oSRwtrGqMr0mY8/eZcCdIRJjpQxBSHVn7ptkX7+gECmm/NoqLnGzDyeLKb/0+YI8VkR5tGNBdTPayMTaUvslECrjOaVwj0m5lb1nBTbyQFTnBDMmITk/scOXoS5mRcPkV1kZAZOTCW8DjmVczDrDm+bUGmzwO0c4d45QwK5u11B2S62DwXUTpBtzYi7huNfhj6fHAKJhI5O+kkI2RAhZbQmVWPreBRkiLn2coicDEJ6+eisph+ml0r0cdoctdYPpaMyTN0CIKpx05x9weF/3NFmKTNQmbq8aZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tD9iY4rSE7EyT600PIX6S3WDj8tSiSxjNJoP/AQQt14=;
 b=Sic8I8A2M3iVvACiKja8iuRYBGAEiSCLZYKF5kbplr5oP75uH5b88cD5j+o8+EXR9eGbs+rSgSxjVQgwN6UZR1szqze4vFKVvEPB3oDCYiY6gFOtvaeZTbJS62U0JhQy5XgwbGqEOTPZf9FAMYKOiBbqom8+vUbgsC0WcRp/E3BabiVSssLETL4L3HnUc2BHEvAXfVI1cf4mbfhoaDLaialMXaHuI/yViJat/JcIoWHSMvoCFD5sP2MGZ8yJZqygiLdYlHUqpVoWL7Fd0eQqTEFGoxm9sByHG9/3k7HM0kqIXfv3bOD1Eef6uoLfNQr8/TROeQhXUG43MidtbkrFXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tD9iY4rSE7EyT600PIX6S3WDj8tSiSxjNJoP/AQQt14=;
 b=kBJ66QnowHc4EEKLrGOEakZq/PQCxmNz1w6iD26kcGnRxSiFk3vnMETDkpJp6apehxkAXmlSh3dKMTwIyPDVKr3Vwe4iVdHGqkbfg6hHDLarq/FzR60SGox3GchwPI7Q9OerulQ360pcDQamHYFqF/pnMyZI3C7QK6zJYFVRHNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
Date: Mon, 12 Jan 2026 11:18:30 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor
 ap2m->default_access
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Petr_Bene=C5=A1?=
 <w1benny@gmail.com>
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 50af8d50-f9a9-41f3-cf0c-08de51cc52ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1dTTHNlOUhiTmVqTTZGSFhIdTdTbnZvOGx1bE5MS3prTmplMmEyVHFMRnJW?=
 =?utf-8?B?Mm02RnFSNE5XQ0ticHExR0J1OCtkcXArc3poNlNpNXdCMy9PelJWZmdQME5r?=
 =?utf-8?B?Z2pCcGN6SlBxbFBJcU1Scmw3TGxuZ0pnN3lUS2hXV1U4bjZMdlNVK0UxNWZv?=
 =?utf-8?B?NDhocEViWTg4dmlQQklSQ3h4NGZUcXAyN3kwWTk2ckgxQURZRHh0NlQrWHFr?=
 =?utf-8?B?UTJLdXJNT0ZHcFN5NjFLMlIyZ3pkNktra0U1YmtpczBzMUtIeldLS3ozeFJh?=
 =?utf-8?B?M3h3QkVLZHZyTkRkVWxRMHF1M2hTZEM5S0hlVy9oSkd2OVdJVlRIM3lla1kv?=
 =?utf-8?B?QkVRSkV0TnB6ekpQQmpobVBrcjVMSTdmSmNSSnAweldUaFJ5cnhXMlF2OVhx?=
 =?utf-8?B?ZEtyK1BUM090b1JSSll5KzFVRHpoRXZtOW1HTGVTVEJWQ3dSTmRiS2l3dTZP?=
 =?utf-8?B?K0QyNFNZdjlUcmJOd1NrVVdxdDc1OWN0emVrdXU3YWoxMDJyQnlRVkFScGNv?=
 =?utf-8?B?QVNHM0xRc1lCanJPT08xQ0dBZjRlRFgwL3ZESUlCVmsvdVFEeWk3UWp6cmxC?=
 =?utf-8?B?dDM0S1QyMkhNcGlVT25HMnYyNUlKV1hGR0x3bGIyeFF1MVNYajFQRUp5dDZN?=
 =?utf-8?B?d3BHMDZWOVpsTk9mY1IzRmVlZ0c2NEFVSzNrUlNMOUIxYjBrSnNERE1UTGdy?=
 =?utf-8?B?MzhuaUlzaks0SHp6NVN4djlCdFY0VmdPM1N2SHk0OWZPeWtudU4wQmYzQVoy?=
 =?utf-8?B?TDFodHVSZlBQUndsa3hDdzVjZ0RRYTFIbnVxTHdYOXBmR2JVNElCSjJMa2Fm?=
 =?utf-8?B?ZnJmQVpvUENYWjRhOVU1dTlXbjFMSkp3dWpwYmtpZHhKdnE5Y2R5V25XVGxT?=
 =?utf-8?B?aW1NdWVVdHhxbVZydEdPWnF6VWpydkU3bCtTdWJVOU9kMUwzUGtPVXd3TFBq?=
 =?utf-8?B?eWFNS0pvenQzVDFlb3J1OXpTdDhUQnd5NG9UT051dHhFekZlNHViWXlSK2s5?=
 =?utf-8?B?UnptQW1JdGh4WDR2ZlcxZmlGdUNjRVdBTjd1aWlCamhNdzJRbkxlRGhiVVJR?=
 =?utf-8?B?WitGcVVWckhCYndRTHBuTWdhblovT2NuWDZacEFvM0ZRNWl0ZUZpMFpwdlRV?=
 =?utf-8?B?Q05XVWZpTnpJTVV0djFoN29LV2Rwa3R5WlJPT0lyVzB0R04ySlF6SXNPOHo0?=
 =?utf-8?B?NExUc0RrWnF5Z0o5S0FWcTlRTkpVdmdLbSszZTdEK3hqb0Ric0lSZ2k2Z3ow?=
 =?utf-8?B?KytvaUFYT0JVZkpBbEhwaGdTQXZlN3RLN2NhN1RwQnJzWGUrcWhYa3BVQWE3?=
 =?utf-8?B?N21DWXBFUnFMN2hpUmkzZHRWK2ZtZXE2NnI4UVF2UEdYM0l0MXlxWnJqYW1v?=
 =?utf-8?B?MmpQL3dNTkhhZWkxa3hudkswNC9pYzF2eElLZUJadDBkdnkzdnQ5bGN4QWdY?=
 =?utf-8?B?VXdKSCtlVXBNRFk5dEFXdWN3RUhCNUU1ZGxJbU4yOEJqVS9OZ3JjR3g4U0xG?=
 =?utf-8?B?MHFKMFVXMmREQnJQR3E5czFkRXdaZGJxTmJSVHBpSnBwVDBtREJBT0txT1Iy?=
 =?utf-8?B?SjduZFFJYm0waTJMaXNyMk1OZWFxdG8zU1d2emxpVm8zNFJjMDJKS0pSa2I3?=
 =?utf-8?B?OU5yZDY2T0dkc1JmL1hBaHAzMk9QYm5CN0FaU0RsSjg5WVUxeTlSenREZ3BU?=
 =?utf-8?B?cXAxTngySUVrQ3BYYzRLaUpvdkVCTlpqTWlnY2xXdlNMMk5wUlBDaWM3YjlH?=
 =?utf-8?B?RnVEN1NYNkJzdXQ0MXZjd04zejFDbFRhQWQrU0RaWTIyRjFCUEIwSjlUVGQ2?=
 =?utf-8?B?WnFkVU5LZGQ5VUJtVy9kclg0ci9kOURCTUVuVU5FdHprY3lacjNlbnRrdGF1?=
 =?utf-8?B?bEtFK2FPVy9sd0VLUGhBbmJ6NFpMSDVCaENnU0ZUYXNPOHZYR25iVHFaclBQ?=
 =?utf-8?Q?S9BGYWe50FqDPnM3BJ8z3XdYd+tc5d40?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlY3ck5BYlZwdFF2S1N0em8xUldUbHpqMVp2T2trdk5oVzQxaVA1RW1VaGQw?=
 =?utf-8?B?Q3hhazU3VlIvV2JmNmNxZ3BXc3RtUWhVMDZyYzhiQkpaT0ZGZUlwaTVKUkVm?=
 =?utf-8?B?T1A5c2Fmb0s0aE1Lbk1ycG1xWGJxMnpIT2FXanN0ZlNZaGJsWkE2b3QvKzlk?=
 =?utf-8?B?eWZzeHdTbFdubFdsZ2pPU0Q4NzkzS2RNOXpIUzVSa01yNEcrYk1hRFVBdmlz?=
 =?utf-8?B?VDlMQXVQa2lMM3M1ZWtXRnZYaDVyby9mSnB6dC8yYURndU1HVDN4ajVEcmE5?=
 =?utf-8?B?NU16dWN2d0Fma0JNcXh5aHk5UExkV0l6N0YwK0tra0dBR3lrc1lYc0hRWmxS?=
 =?utf-8?B?ckRPdFBuOFdESHB6Y1JzZDZDNC9kL3ZqenFGL2xVeU81M0l3Y2tWTlZxMC9u?=
 =?utf-8?B?ZE9Kb1A1SS9iQWVOcGVnZlRFVEtWUzVpQ3k2bXhxODVWM3AyNXAyQnUxVUpz?=
 =?utf-8?B?M1Z2eEFNRVFoeDJOcVdxdDFUSzR1cEM5VUtXcU5aRVhjaUNlT3RHczEweVFM?=
 =?utf-8?B?K3ZrMU44WUNRdityRUVsK0JqaFdEVUJ1VUk1bWVkSDc5S3k2eXpKWUJHZjdN?=
 =?utf-8?B?UGdLdy9udzZYL3RrTkg4eVdUN2w1aXBtVm5ZeTRacEJ1cnV2cWRNdmxMRkcx?=
 =?utf-8?B?UFhnd1h1aWloQm1sMzhtVXc0ckx1bWdDUDByazIrQ3NMOUNCN092NVdrVnZR?=
 =?utf-8?B?ajZrdW41UkZZTXA1WkVDNkZzNW92RE8wR0ZOZUErSDNlT1ArSm1ManlTN0FE?=
 =?utf-8?B?cFI1aHFoaUlZYjdvSEZ5SE1KTjZtclVtM21wTUVHc3RwaXVGK3ozQmZ1N3Y1?=
 =?utf-8?B?KzQrUi83YXlwVEFsVTgzWVJoZXRFTXorUWdsem5mQ29oR2RYOElJZUxVRGNL?=
 =?utf-8?B?N2Y5TlZQTHBEWmE5U3lVSDUxYXBBaWdqTFZOZ0U2T3JNSHFWb21YdG9JWFYx?=
 =?utf-8?B?UiswdWlHb3pQOWVYS1BJWFhldHJObFJKTTd6YmpKSDRxd21URzdoWmZrQ1lS?=
 =?utf-8?B?NkxJUXUyMEN6bUZZbldSVWJjZG1FQmxFWDFLQWMxN09EQWRHSXYxc2pPK2xZ?=
 =?utf-8?B?MFpUT3pLSUt0bmRmSGpud2IvRzdWOTVKSEtOM2xLZUFHamZDSERzdmU3OEUz?=
 =?utf-8?B?cjQ5ZEl5KzlJOVpLWndmdUliZENCZ2JnQ2N5Mjc3dUhjRGRHaFc1cTRpSmNl?=
 =?utf-8?B?V1pPZkFnYVYrWW15Nnh0SGhLaWJiTWhnaFliMisrcTJaeGxaTmd5YldMUjZK?=
 =?utf-8?B?d2MzM1o5Rk5laVN1UVhybUxPNllzaG5oMDBsMkxQTDU4aXB6SXdtNVNvV083?=
 =?utf-8?B?OHJ6amRzbW9mTlJ5S0Vkbjc0S1dOQmxKNWFZdDc2dVhBVkVac1VXc3FWSW5H?=
 =?utf-8?B?aDVzYk5yWi9SSCtuU0tHZ01WeXNmQWVlNW5qWjBJTTF1TWZ2aTNCUG1EVXhZ?=
 =?utf-8?B?cHhtR3p6VHQzbGdQRWFtSjMyb2VmZmt0eW1OTlpkbDV6TnBOK1FqWnhXQjY0?=
 =?utf-8?B?NkJnQlJpTmpoRFpyZ3AwNmQ4dUlWM2hISDNEYnJ3MFBJOG91djlhY1BMdjhj?=
 =?utf-8?B?WXduREkwc09XZjgwWWpMYll5VFZ3U0F1NEhoamFxMG00NHFua3JGejNTRHgy?=
 =?utf-8?B?ZGR6dUNTclRtLzVBbEtPcTBUWG55Y3p4eU9rYVplQ3ZwRlRoakkvSW1wTjhT?=
 =?utf-8?B?Y3prR2p0UmExcXp6VGVYYmJNNVlVcVczSG96Z1NmNWt1ajBDWVoyM1pCZ3kv?=
 =?utf-8?B?bXFhNENOWUtlTFNzOXpEOGhPc3lPNFlRajJ0YmVLcjFrcXJHRnBXMklHSjdX?=
 =?utf-8?B?SmN5dG5MUjhXaWwyWkhwNnRMN2tCZmxkSTdySFp2VXZRZ296M0daN21vd0cx?=
 =?utf-8?B?QmNWdThhenF5cW53MHg3LzBPK2VMU2lQTjJlWGRsNU9HMHZLc1REQWhBNUFX?=
 =?utf-8?B?VytQdDlHRVkveC9OKy8raHpnNWI2UDJ2ZHNRU0lPbVNHMDgzbGVPWEtaaHlC?=
 =?utf-8?B?R1NORTg1cHd6cVhtdjF1NU1Qc3EyM2pTckM3aVYyQWVQUHRFL3FSeVkwa1NX?=
 =?utf-8?B?blFxMWlTNFNsMlhJK0NQa05rMGVFOVhjMm94aWkxZ09NQXZaTjBuSlg3TFBC?=
 =?utf-8?B?M0J1VzFXckROS3N4REtFcGdpQzNzYXp6K3VHdHRKaHgxTUw4YW0yVVhycGRH?=
 =?utf-8?B?Z0dlRjNERXV5M0xwVzNMMWtVRXBPSlA3L3ZKZFJ4L3d0Y0x2Y044MXlJT0dT?=
 =?utf-8?B?ZDlJbC92OWk1anRIZi9oaHVid2xiM0ZQcTgzU08xc05TZDEyVkNBa1RYS21q?=
 =?utf-8?B?bHFmMVZiT0U5clNuSjRCaGl6UHdDN2tZTTJOMG1VQXRQSTgzTUF3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50af8d50-f9a9-41f3-cf0c-08de51cc52ec
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:18:34.0265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKR5+q4xVktAiQBwJq/aP/LXO0Qubx4rcaY3JAABs6Iqbx/QG9RdLfTr5NRzA/0zNI538NM4YuT8GiQ/oh9fFlRI/+ixcAWcS22sEbfNKlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6038

On 12/01/2026 11:09 am, Jan Beulich wrote:
> On 09.01.2026 19:28, Petr Beneš wrote:
>> From: Petr Beneš <w1benny@gmail.com>
>>
>> Commit 7e5b662 fixed p2m_altp2m_get_or_propagate() to use the altp2m's
>> default_access when propagating entries from the host p2m. However, the same
>> fix was not applied to altp2m_get_effective_entry(), which has the same issue.
>>
>> When altp2m_get_effective_entry() prepopulates a superpage from the host
>> p2m, it incorrectly uses the host p2m's access permissions instead of
>> the altp2m's default_access. This causes problems when the superpage is
>> later split (e.g., when setting mem_access on a specific 4K page): all
>> 512 entries inherit the host p2m's access rights instead of the altp2m's
>> default_access.
>>
>> This issue became apparent after commit 50baf2d, which causes the host p2m
>> to use superpages more frequently. Before that commit, the host p2m
>> typically had 4K entries after VM restore, so the prepopulate branch was
>> rarely taken.
>>
>> Symptoms include memory-access events firing for unexpected pages when
>> using VMI tools with altp2m, particularly after VM resume.
>> The issue can be worked around by booting with "hap_1gb=0 hap_2mb=0".
>>
>> Fixes: 7e5b662 ("x86/altp2m: p2m_altp2m_get_or_propagate() should honor ap2m->default_access")
> You didn't even Cc Tamas, who I think once again will need to ack this.
> Already with the referenced change I didn't quite understand the
> reasoning.
>
> However, two formal points: Please use 12-digit hashes, as demanded by
> sending-patches.pandoc. Plus I don't think Fixes: is quite right here.
> That earlier change of yours didn't mean to do more than it did, by its
> title and description. We relatively recently introduced Amends:, which
> may be a suitable fit here.

I beg your pardon?  Fixes are and Amends are synonyms.  You cannot use
them like this, and you absolutely cannot expect contributors to know
your personal interpretation of the words.

~Andrew

