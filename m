Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A2EC68FF4
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 12:10:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164618.1491538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJb5-0007no-Tr; Tue, 18 Nov 2025 11:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164618.1491538; Tue, 18 Nov 2025 11:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLJb5-0007lU-QY; Tue, 18 Nov 2025 11:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1164618;
 Tue, 18 Nov 2025 11:10:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+ix=52=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vLJb4-0007fg-Et
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 11:10:06 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c893a7-c46f-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 12:10:04 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.22; Tue, 18 Nov 2025 11:10:00 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::6d8e:2499:8a0a:7eb2%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 11:09:59 +0000
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
X-Inumbo-ID: 21c893a7-c46f-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlIftc1HajgTQ80Is/S9esTMEN7cHsimhH5ZQF+qC8SRBy8Ho45LUwvuTqsl2VKjzOFJ0aZlRyw+qzLHvVKBLJC1xrS67Trj+pAUHMigLP1ELPjvzLd+n8efcz1uYDfKVfY12Fz1qsBzHdLzLNjvXobuERbEMo7xtVr73ce+7C5mr4FhUeZAk0IBUmJhSfJ9jLPJjAKxMKS+dh+J/0HQejvspR4jvMsgY5LIBOSMhExnWeQOEkR5ZMfiPgLlkvk0vHGiSCNurqHIxH0WO/B2BbYKKFYkUY/Y8emGttfyd1v639Lyd/h1d89mZ2tNbT+BRLViVY1+3Q/V6zdpU0Piwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/OTzoMSwHOPWwMKqSo/6wKsXqvkDRnA0J7b0zg9BIc=;
 b=F0ueVUr0wPiQe96du7jJ50oH/w08Ct8SAbHkDPke/+l9zsn6jNfcsEnRhYf7LwVFavCqsmra4hpJH4rl41bklW+gppqttTVRGH9mAS/qcgTE/SZX2Yc1qYHX1hZPQvkY/2XHanw0LrWCH3f7X7/orb3xX/n5NDDlyTiDs8jUFKmijB3s1DqM4qWDo/swxCrbHkHJC4NHEUhAq62x3ZY8qzeW1Do9HzzAjiaIINfjcLVegG4lM/WxxXd69w/a3dFJGHJeXRh/9qMAyRA8TyCYpnatqW0vNRO0BCCGBYgaI3aeygg0ffliO5XkSVlppC1PEfXPuHn2fJJJCYFsu/3S8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/OTzoMSwHOPWwMKqSo/6wKsXqvkDRnA0J7b0zg9BIc=;
 b=UgXR+q0YcqpWLW7bj6HFaH4aKbMzp2ydV1EKpQoR5JQXoBoXZf+171Ey212n6gXBz+XARKv/vMBd99iX+uzAtd20pTx/yNdkAinmVr7n/gOnirRGRAIFT9NDG5eJYHStSRm6a5vn70sh2BGmALCLZy0ImD3MSaStI6e9n4oPCOQ=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to
 altp2m.h
Thread-Topic: [PATCH v1 5/7] xen/x86: move declaration from mem_access.h to
 altp2m.h
Thread-Index: AQHcVEwAn1Hu22XaJ02mYEVUbE68oLTwWQCAgAf1+hA=
Date: Tue, 18 Nov 2025 11:09:59 +0000
Message-ID:
 <DM4PR12MB845171D6D974E63DDF6D4D6DE1D6A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20251113031630.1465599-1-Penny.Zheng@amd.com>
 <20251113031630.1465599-6-Penny.Zheng@amd.com>
 <136416d6-ea2b-444d-b331-8aef1881ed91@suse.com>
In-Reply-To: <136416d6-ea2b-444d-b331-8aef1881ed91@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-11-18T11:09:51.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DM4PR12MB7552:EE_
x-ms-office365-filtering-correlation-id: 5aa3cb44-93c7-4872-b254-08de2693039e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MC9HeWswRExVaEhtVThsNnh3U2d2K3BjSFRWeDM1b1N5MVVvU05uaVR5QUFD?=
 =?utf-8?B?bWdTK2Z3RXo4S25haHRsY2hmL1hsUlBxU09BZkp5SnQ3MmwxcEtidERxL1lp?=
 =?utf-8?B?RjFYdHpLZUVZVUlVdDh1K1Y4YStxeER2VWZYb2VUazFWcVM4NVBmSVkyNklt?=
 =?utf-8?B?MTRyYnRydXF2WXBrNWRSaVZHd2JXQVIvbloyY0ZraTJMZXBQK29JUVNLb2F5?=
 =?utf-8?B?dWZPSUFwdTl1SzBHaFROV3EyVjRvZ1pBVHNWandCc0N1aFBpMDhFcmE5WTJU?=
 =?utf-8?B?bWVqVzNoQU5OdnVQRE1WRTIvZUhNM0tmT0x0N3BTWVRkOXdsVjJUS2RwTWFF?=
 =?utf-8?B?VmVRMXZQRjFBZElITFhmWW42aHdZckEvQjFBVXRhRWFrdlRJdElkWVJoZkpR?=
 =?utf-8?B?dmRSYTN4aXJwTlRVaWVvZURvZ21pTldSVGVFZ2VzTmZVUnVJblVUR1V6QzN6?=
 =?utf-8?B?aTZMZm8rdVVPMzl2QytWMkhPNXc3NEhUeU1UaDFpY0hoTFc3QTJjSCtWZW9I?=
 =?utf-8?B?bUJNanlQcFhldk9zOGQ2SVFHRVlXWFgzUktwS2tUbXRlcE02K2o3eS93UU5n?=
 =?utf-8?B?dUsveUdVRFBlT0VmeklNOTFWUjd5K29aZjJ2bnBNdFp6dHZRa2llMWx1Qytt?=
 =?utf-8?B?SGlZNlowTHk0bWhQWHZXc2lSbUdmWHQ2TFd0ZWdEdWEzeFJUVGtzS2h0R1hk?=
 =?utf-8?B?bDJ1ZEVWMllLTmVxQVBMbjlLUHRlckhQOFFyc2tQL3dZQWNnQ01XVS8wVFJ6?=
 =?utf-8?B?RGZad1U1MDF6ZEc1Z3Jnc2lnRzZNUXdlam1VMUZBOGp2NW01d2l0aWszNnpS?=
 =?utf-8?B?Zm5rUWlZcjI4b0dnaWJrQXZwT2VDREVaT1pIc0hCQVRNSVdtTHVrZUk3UXY3?=
 =?utf-8?B?RXlNWGJ6VlQreDlIQ1JFZmYrZG1RbkFJM0RMTDlQaDcxKzhDSTQwWHUzN3Bj?=
 =?utf-8?B?VWRlVnY5N0RHenFEOXpzNTRoeWFnOUxObTVtVU1HRW1xTm4rb1pSdFhod3Vr?=
 =?utf-8?B?dWY0VFErWnNLYWk0aEh1TUdweURVRVFkT2xwbUNDYkpBRURwQ3VuWTc2TGk0?=
 =?utf-8?B?TXYyTnB6cWlGL0J2YjVIMnZTUG9ZK1BJL3RleVlPTzNkY3gxTU10c1BrVk1J?=
 =?utf-8?B?KzhUdm5heHkyR2lORXNvR3NKbFc4TDdJQ2ErcWxlSjh0bFE1RDQ3Wkh3NnJH?=
 =?utf-8?B?Yy9uSVkzb3BFNFJ5UC9NSzY1OGhZRTdmZ0tqcTNpdm5OWmljaTMyU1RLWUpy?=
 =?utf-8?B?aXdvdWd6Z0RmUXcxRU0zK3NPKzAwMC82cnVwd08xaHZTVDFSUHJ3SitBVlRE?=
 =?utf-8?B?Sk5ZWWtJKy9kQ2RDZTFwQWVka3ZDeVgrVlhHS3dxV1ZXeVczUWQvUjBuc1JC?=
 =?utf-8?B?NUs5NklIYVAyVzdTRGJMaUZJYTRsUnRzKzVjQSszR2g0aW9taWdHM2RMVW1u?=
 =?utf-8?B?THoycHkwS1dweVVqcmhpTXJCMTN1YzVkRUtkZlhHYXVVRmQ0cjhGcnRnSVJX?=
 =?utf-8?B?VXpZUk9BWFQwbzlpanhCOXd1TVArTGk5eFRocmxkK1Z1ODJ4VGMyMVdqSW9R?=
 =?utf-8?B?aXlrN01zL3lBZnhXbE5IaVRneFRMWWVTTGluVTlaSlpqbDRUaWZoMEtZWlVM?=
 =?utf-8?B?ckJTTElwcmhqdm9OSDJ4LzE4N3BIMDFDRUVrT2RuZHVqNTBBMnB2Rk5ZdlJZ?=
 =?utf-8?B?SzhReXU0bDNUd2h0WkxQcDM5ZERHZXZPMCt0WmZsaEFWZlFKT2s0UXRCc1Ns?=
 =?utf-8?B?SVBBSXJ4Ni9KWVdtTDQ4NXptNEFtSmNYcHdaTHpaNHh1NVlZU2FrUmF0WWZk?=
 =?utf-8?B?UzZ0eDlVMXZKL0Q4MUhTRGdzWngxdlEyZE1jckY1bWwreis4cjBzYzdUTGp1?=
 =?utf-8?B?Ri9temduWnhMWHRGN0t3aDZtNWxBUjNLNXNtRFlHMnhFa3Z6czJOaG94Tjht?=
 =?utf-8?B?UytzMGRiV2JzMWQrclRGZXZNVGZLNXdLR0lCZVppTElvc0JuNlQxU2FpVCtm?=
 =?utf-8?B?eklDdTlkNFpFOW9OT2VxTXRFYVF3K3hPbkNKT3JsMDUrSm1zbXpPR3hqanB1?=
 =?utf-8?Q?H/yW78?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkpnMG9IM2l0Z2hTT2RBZGdrMmR2VkM0dGhVU1NIaTcvaFdUaHdCVmMxRElo?=
 =?utf-8?B?ZWVsU1JMcDVKdEppYlE4YXdIdjhKeFFBbUpDTVhnWHhrekN0SkJKOE1sc2xr?=
 =?utf-8?B?TVRVOEVya1pHK3R2WWVOd3ZtWVJLYlVzd1dnMVNRY3k5NHk5V29OcksySHJt?=
 =?utf-8?B?TEM0SFgvVEVKNHRraWlYTGpuV0ZxenN1YzB3U25uTmlhbXBCTHhUQ2Z4Z3ZL?=
 =?utf-8?B?K2tSSVc1ejZXbmlTMjlnenFaWk1aOWUzMGxjUmhrNmhxWm1WVXRFOEhic0FI?=
 =?utf-8?B?emk1L0p0bjAxWGN4dzd0Rzl0d2ttRVJ1a1JKTW1ob3lneXhHZGhhTU85U25T?=
 =?utf-8?B?SU13MGM3TEhCREcrQ0hEdFBUWGgvNXhVRGlUQURoRk4vNDZ3dlp5THhqQTNk?=
 =?utf-8?B?eXVmRS9YNEUwNGpZZG9Xcm90YnhBeVBDU1VURDV6Y0xtaG45b3MxMkJ3WjVM?=
 =?utf-8?B?K0RoRkNUdW9KK1Z6UXE5cU5qamFJZmZWb21YQnNQZi9oUkh3YVFzbXFRQmF2?=
 =?utf-8?B?MFZiYkN4emIrVWpKeGxGcktrK0V4TlRycnBCd0NxU1NiOXQzb0w2d2VwcWYw?=
 =?utf-8?B?WVlhMytYOGxGZEorRjZqY2hkV1dVWnh2NGxmQ0NxL2crV2pRQ2FLRHVlNWxK?=
 =?utf-8?B?a3FXRjlVZzlMNzhqRWRDelBxcDd6VHI3UFEzRzdYSmI5bnAybjlVWE0xZTlr?=
 =?utf-8?B?L3BsaytKbUo3bHNMNG1Nd294MzlNZTBURlQydWF1c0hjS2QxNmdKbnRLSGdM?=
 =?utf-8?B?aXlzdEY3Tk5BYnhES2RBV3A2ZDFpSm5zTEdzWkRsaFRNU3pUTXRaaUN5SjRS?=
 =?utf-8?B?V2xPUVdWc1RZeCtWaXNCNzQ1bllMY21oNXI0ckY4WFdydmRwMWRva3o5TmU1?=
 =?utf-8?B?dmNQNTI0VUM3VFYvU00ydm5tMDBUWm1nY2JnTElnd0t3SnlFM2FIQzlrZloz?=
 =?utf-8?B?bTdYd0w4bXp6TjdGdlEyQkM3ZWdVK2VjUkJVVE9FOHVqYkd2alg3RjJMbWEz?=
 =?utf-8?B?WEloWHNjWFNSNmNLR1pqaWpNNk15MldMeUhaaG1VSmQvTU4vVDgvVVJWZytx?=
 =?utf-8?B?d05yZkdzM1BqVnBxUkRKTC9Ba0ZiQ1c1QVRXbTVKcnFnY3BTSHRXeXlKY1o0?=
 =?utf-8?B?YnhLTCtaTjVIYnRvQUtWRkMxT2wxUWFZMzN2Y1dtbHFpSXoyTzc2cFBnaEFa?=
 =?utf-8?B?NXp2bWp2ZTA3Wm5MSUJhdGkvWFFQTEc3eDVuUXU1L3ZqZC9KcnpXeFJlL3A0?=
 =?utf-8?B?Um4rT1czMHNLb1hoSHJoQlZNb0VsR0N2Y085bERTajFMTlJBMm9EdjljYzdW?=
 =?utf-8?B?a25xeC9DNkZwUmVRZnlGMG1YRU9hcllmOU96Z09RdW5JMTJSOTk2WXhMODJl?=
 =?utf-8?B?Nkl6VnZpOWRJSnlYNVBoV2c5TVNVQVRWY0NUanVCOENSVjZWbm5kVVoxSVk3?=
 =?utf-8?B?V0Y0YmtWZmlkOHRZOVlpRDJuZDVVTzlSaSt3N3FZQTNFRjRnV0tCWTVndHd1?=
 =?utf-8?B?N2xvNjI2SzVQcEwvVlBzYytKTFlqcXFjQzRzRDJxQ0VTZzUzYmM3bnVrR2NV?=
 =?utf-8?B?bGJaOStFUlRmT0wvdDM4cjBCWFVJQit5cTJrVWJTOUl6R0FFQVNvQ1ZWNlhQ?=
 =?utf-8?B?WktRRkhJa2tYOFhEbGJ5bDhTWU9ic1d2bTJWbkdtYTUyaUFFNGtGNEtEaEI4?=
 =?utf-8?B?Q3c5cG93RkRrMDdsVEhyb0lUSkY5emNFbExVZFkrNWJ1bHQ0bWpzai8xUit4?=
 =?utf-8?B?bjRuWUZOaFVPME5zMHFPSkJvNmVkMFNMWlNUem81ZzFpVkh5enN3REIxSUU0?=
 =?utf-8?B?a3dLaTFFY0xrSHAyREhicWs5ZGk4Q1JRREtSM2dyWVRuRnZGd2grdUxvNGMx?=
 =?utf-8?B?d3lGeUFDb2RhTjh5NHkvSW9LQnlIOXo5bVIwUWdoQ240S0F5d21mYlNXZlN0?=
 =?utf-8?B?Nk05ZE5nZHB6dHRRWW9QSUVlSWpyTnllemxCVnFLS2lTVTJVN3A0NUxoblpU?=
 =?utf-8?B?SXFZeVJJZGJrS3pLajZIelhTWkJFUVNpSE1EZlpYTjdrVmhQREpocllwNVY5?=
 =?utf-8?B?b3h1Z0h2QVdwdFN3M0hQZ1dDV2Z6aTRjK0lFWTlUVkNpVllHZWp0U0JRRVp4?=
 =?utf-8?Q?YUI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa3cb44-93c7-4872-b254-08de2693039e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 11:09:59.5034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYw8uCsBovOdCxRctar0qUJGTuFA4XV0EHZigFJC1g4F4grbWBs8fETYvEiO75mv5UUE5SbqNpJSEVvY+ee3Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxMywg
MjAyNSA1OjM1IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+DQo+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1
IE1vbm7DqQ0KPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBUYW1hcyBLIExlbmd5ZWwgPHRhbWFz
QHRrbGVuZ3llbC5jb20+OyBBbGV4YW5kcnUNCj4gSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT47IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Ow0KPiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSA1
LzddIHhlbi94ODY6IG1vdmUgZGVjbGFyYXRpb24gZnJvbSBtZW1fYWNjZXNzLmggdG8NCj4gYWx0
cDJtLmgNCj4NCj4gT24gMTMuMTEuMjAyNSAwNDoxNiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
TWVtb3J5IGFjY2VzcyBhbmQgQUxUUDJNIGFyZSB0d28gc2VwZXJhdGUgZmVhdHVyZXMsIGFuZCBl
YWNoIGNvdWxkIGJlDQo+ID4gY29udHJvbGxlZCB2aWEgVk1fRVZFTlQgb3IgQUxUUDJNLiBJbiBv
cmRlciB0byBhdm9pZCBpbXBsaWNpdA0KPiA+IGRlY2xhcmF0aW9uIHdoZW4gQUxUUDJNPXkgYW5k
IFZNX0VWRU5UPW4gb24gY29tcGlsaW5nIGh2bS5vL2FsdHAybS5vLA0KPiA+IHdlIG1vdmUgZGVj
bGFyYXRpb24gb2YgdGhlIGZvbGxvd2luZyBmdW5jdGlvbnMgZnJvbSA8YXNtL21lbV9hY2Nlc3Mu
aD4gdG8NCj4gPGFzbS9hbHRwMm0uaD46DQo+ID4gLSBwMm1fc2V0X3N1cHByZXNzX3ZlDQo+ID4g
LSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpDQo+ID4gLSBwMm1fZ2V0X3N1cHByZXNzX3ZlDQo+
ID4gUG90ZW50aWFsIGVycm9yIG9uIGFsdHAybS5jIGFsc28gYnJlYWtzIE1pc3JhIFJ1bGUgOC40
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFtZC5j
b20+DQo+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
DQoNClRoeA0KDQoNCj4gVGhpcyBsb29rcyB0byBiZSBpbmRlcGVuZGVudCBvZiBhbGwgZWFybGll
ciBjaGFuZ2VzLCBhbmQgaGVuY2UgY291bGQgZ28gaW4gYWhlYWQgb2YNCj4gYW55IG9mIHRoZW0/
DQoNClllcywgaXQgY291bGQuDQoNCj4NCj4gSmFuDQo=

