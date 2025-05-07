Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFF5AAD3FB
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 05:19:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978140.1364994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCVJ5-0001qH-GJ; Wed, 07 May 2025 03:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978140.1364994; Wed, 07 May 2025 03:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCVJ5-0001oj-D6; Wed, 07 May 2025 03:18:51 +0000
Received: by outflank-mailman (input) for mailman id 978140;
 Wed, 07 May 2025 03:18:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeMd=XX=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uCVJ3-0001ob-Mb
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 03:18:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2414::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc494f36-2af1-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 05:18:46 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 03:18:35 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 03:18:35 +0000
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
X-Inumbo-ID: fc494f36-2af1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiR4K+Pk6mUi4DsPrGf96swfCyJSgFLEK+H0anzJ3j2YgDNto1Xf4L1F1O8Apl8ua26oWWGCSoWmWtHfV4CAhNpi+S2gILBzNVdiyd43/CodEyBkCYzO4X1OEWTTCJZBBre2rOhzyEgktNBikJqBWBKWH1nBPUj5LtZ7yEToTs1Mch6gnXkI+DN2Ilh47ZrhBlAkWoX9vSVRN5nyXgxd3lA8y3dJmz0zDN6gqz5j6+A74sZIqBK+RqgRjPHpF/TwFMEPEiSvmy3mCvFDXxFSPJtvQlNsrlsc4Zk0RD2m2cJ4/XvIP7GIe2yF5Gax2s10Ta8HrJ7ZfVzqLeiu3QvqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4EbJu/FAGSnttB2aaGKs5bKrMdrqPMmiF9bmQQVsJw=;
 b=hAo1xigFWDzkaZuHgudBtkHAdyW7zB1FecUNTxZOy2xxX1EsUGxIUEiVqFfGYvSJFY4t9rS2SNOc1+qo7uFxpj3WzbLABU2m5Ko9ysnc5oV+n60FNPAPQwRAcC2h96S8EKblNMrOLvjD7Z5jZDgzcYP7S8rDV0WjppXCrOeEqeA4TCulyqLOC3adwPHzyY6sQpuot8r85XDQboDJ3KJW95Of9UkRfVkO11lN2XHac7MQQeegJ4MQWpZSIFyVS/c7Gf/etEReWJL4yRBz3tsWDmTtrobgKFvRYRuaeEIbI9WszWSAYQGezJf/FhM4V7wru2U7MqxeypODVf8MfMSNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4EbJu/FAGSnttB2aaGKs5bKrMdrqPMmiF9bmQQVsJw=;
 b=ijBszNwpaR9gkvm2mkhPUUZBZeRuqSP1Z2OWhnN/T6sgd794TXUG04/N72RUVdeAs88DwHamwG3auT02Di7MzwTzLjcYnaWbCm24BQRPbH+KAPirLUlXT6Mw/G/LvCoEac/4dmdVxTttTODjhb03zXuRUfmH43S+zcs5Vrd5f1w=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Topic: [PATCH v4 04/15] xen/cpufreq: refactor cmdline "cpufreq=xxx"
Thread-Index: AQHbrRCkbAdH8T2kS0OlR5huTdSxQbO6ixQAgAATnQCADAI+0A==
Date: Wed, 7 May 2025 03:18:35 +0000
Message-ID:
 <DM4PR12MB845196DB77AC3D6FBCC1C69BE188A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-5-Penny.Zheng@amd.com>
 <2f3702f3-a46b-4161-a890-7aad9bbbcac4@suse.com>
 <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
In-Reply-To: <889d2b2b-db42-43d2-9da0-dcd130d64d9c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=6b72dc6f-99e7-4e0d-865e-c550118b6eb9;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-07T03:18:26Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|BY5PR12MB4258:EE_
x-ms-office365-filtering-correlation-id: e8b6d6f4-9a2c-4953-f5d8-08dd8d15da7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1dIZjMzTmZzTVFoMkM2NlBKYTF5N3lrMnVNVmFQM1BDam4wbkJtbStiUXBm?=
 =?utf-8?B?Mi9Na0xmMlc2QzZZWmJTZGNBMHZ0TUhObG9kbVVZUGdHRXo1MkNZL1d5V0xQ?=
 =?utf-8?B?Q0JBckFaL1dTOWNrT2YzOStEZkFnaHdzV1ZMbm9ubFBsdWtnYTQ3SE5YUWxm?=
 =?utf-8?B?OHU3NC92OXcwYmVha0l2Uk1xTVh5QVZ0N2h2VkVJZXl3MjN6L2Q3WHZCWmUw?=
 =?utf-8?B?TitKbHZZMlRTc1Qycy9XNFRvY1hmaGtJZWJ4aDJveHFnUmIxNFdMVUplV2k4?=
 =?utf-8?B?ckxjVWZrb0lFajhMUnMrcjY3dWZ6RjMwUjdFRmRJWnErVFRmTkFDVWZlVjFB?=
 =?utf-8?B?Q3JtbDdzaWYxVks4NDgyWW5WWCtTNlFTY0pwNzU4VEkxK3F1QmNXN3d4R2lm?=
 =?utf-8?B?MndNR2RRYUpiS1Q2eHIrYXNGOVNaN1NUbzlPZ3QxMnY3TzRXRTVIcDJjU2pV?=
 =?utf-8?B?S0lyVVk5WEZwVjYvRDBpelhuZEwzR0ZGY1N0Q3RoQmlUUm92UExXK2g1UHM2?=
 =?utf-8?B?djRsMkwyY0JOdUgrcnpvY2JjczJGa0t4bE5sby9tVmkzWGVQTEErbXFkSVJ5?=
 =?utf-8?B?RjVFUk16MGppM1Z5Rjd3ZzlybDE5OUhsSGlIdUFoOGpsTlpwTEh1TW9IZUt0?=
 =?utf-8?B?NnRDMjduTlVYRm9mamNwQ2J0VDhDdFhiRkpidFExWGxiT2FhTWF5bnFYaGh4?=
 =?utf-8?B?UDVRdkhNN0h1SUVXZFVXT0xzVkx1N3owaHdRd2pzc2hlQTRMZnVGY1YvNytF?=
 =?utf-8?B?NjhtTk41RmoyOFQ3NUpqRXZrOXg1aGw0d2ZSbUxzNEhnYTNXTVc5MFJJdXky?=
 =?utf-8?B?RDlMeDNMSjFTYXc2NE5iWVQxbGtadkd3ZkJkbktPR2ZGUWxGZXZXcHJkZ2xE?=
 =?utf-8?B?VlNBVXJMY1AwYTdHVXdBbXUwZU51V29KOTFxOFp3Y1h0MXZ6SVRTUUtZOSt5?=
 =?utf-8?B?NmVSQjVkKzcrNWlPYU44ejFxMm5XMU5YSXZoeStpbFJSU0hYV25Lak8rZzZy?=
 =?utf-8?B?djVHZHVqc0JWdCs3Y1JGZ0Q5QVVlQVBrVE1zTUVqOTlydCtUandsZmJRM1dG?=
 =?utf-8?B?Ymd3NE5WT2ZkWHBabmJSRENmRFF4aWlyWjNwa1VwbUUwdnBFVnZ2amRaZkhG?=
 =?utf-8?B?eVZZRmdBRStPd1hCSTNPNTF3QVVGZUtMYzdNVTN5VE5BNytUbFBVc0M1dll5?=
 =?utf-8?B?RzByZzk5NTB4aGxROGs1bmJWYTVjeE5ud0thd082YTY1MEljUnA0ZHQ2RzNn?=
 =?utf-8?B?cTJqUGhSVlFEd1F2YnM3ZCt6OEdjY0VpTzNtUGtEQVdNK1FqSlR3eHRlalc1?=
 =?utf-8?B?dnpaY2NxRkpwajM3c3c1b0VvdHdJRlkvd0ZjN1ZVY2IrRUt3aE9oNW9JZ2dn?=
 =?utf-8?B?aytwVGx0QzN6RWl4NzlnZG11S3IzSUVQbnRwMnFUbEQ4VlBDUWxMcUhrZnQ3?=
 =?utf-8?B?MVUwZG9UUGx1cm9hT0huV3hmT0JFVFd0S3VRZDV0VkpUa2VLRzZOYjNWNk5L?=
 =?utf-8?B?Y0duZWVYVGh5U3RjYmFmY3BQQnN3QThwS3lYMk1Vay9tVVlsQzlCblpKWktk?=
 =?utf-8?B?c0czWTJsV0hmREZLZWlvNFMxaGlaV0xKQm5iQks0aFdQZ0sxejFJcUgxNHRD?=
 =?utf-8?B?WTZFOFZyZWRFVWRvbGhndllBMnZHdkRjNzdDOHg2bTJ4Z1h2dU4zVThJNzZk?=
 =?utf-8?B?WXloRjMyT2hDb1FVWnFhd0IwM0xxdFdlMm12YVkxYVJiUFJYR01kaEFOQmZm?=
 =?utf-8?B?OFZkSTRCNTU4TXpZTVpuRVUyUk1XUHdaVnp6cTlNNlRJUWV1TjBBdllDOEhD?=
 =?utf-8?B?N3BuRmRFQjhKL3pxeWwyUjRqa2p1a2NaNmtpZmUrRS9SSHkvQ2RLaXgzdVFO?=
 =?utf-8?B?SWhRU0VucG1ZU095cjRPcDZMUk9aSFVvcG9GK2hGa2hKSmJsMTllKzFhSEox?=
 =?utf-8?B?d0d5ajlVSDh4eHlaUkFhckxYbmR2VXZhYllqY0pQeDFSNWZuZXVIV2tram5l?=
 =?utf-8?Q?ZYy/0YUsAALPGl+dEx/pGziB9h4N44=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXZBcEdiYnp6UDk4Ym00MHlFb0ZrcjE1eTF0UzQ0cGl3OWhlenZzWFkrWWtQ?=
 =?utf-8?B?eUQ0aVoxZC8xM3laWEJKT0xxeHlYVEQxWHZ0WmR3Zm93eWZVSmk0ZExuck5M?=
 =?utf-8?B?ZVJZTVFTbk1CNE9PQml4Q05iZ01XK2hiRlk1RUx2SmgzL3ZMaGRtY2hFa3Jx?=
 =?utf-8?B?eHZIb1dwWXQwTFE0SnVybFJUYXpVVk5MdjRmTEp4emRCVjZsdVFlTVBsSTg5?=
 =?utf-8?B?MDh6NmxxYnpPS2djZ3ZWYXkwZE5QSy9aNzJnQ2tDYS9IZ2hmT1VXYWJsaTVz?=
 =?utf-8?B?MnJiQnlRWFBOMzVzYi8xM3VsZnJMSzk4WlNJc2RBaTIyVG1sYWhUOStHRTBX?=
 =?utf-8?B?Q3FhRzdVbFFOWmNDN1QzNnBSazltVkVWOTFxVHRVa1RlcDVmN1hocXFkTk42?=
 =?utf-8?B?TUVwLzM2em9yL3dadlpXeDBqT3liREdVdi9RZ1NRN1hlUzZzZWw3am52Mncr?=
 =?utf-8?B?dEZObzYzUVpBMFZlVEpXRm5IOGppcDIwVVM4ZXoyQVArdHRNbnpXR1BaSmxZ?=
 =?utf-8?B?UWhQcytNTFpZWDlRdEZwWS9IcDFZZ0lERlVaWWd0SEZXd2E2UTVYcGExVi9p?=
 =?utf-8?B?bHRmQzdVeTlmV1BwejlCeHF6end6UWRrdm42ckJ3OFQ2M3ZMVmNKbzV1UTJz?=
 =?utf-8?B?UndhSWxaUEw3bU5UVllUMGl4dkswc2dWVzdrV1NBUUhIbUtwdzVRZUpkemtK?=
 =?utf-8?B?ZVlrZ0tqUTVMTzcvSVQ3RnM1VVlPNVR2aXp2aGh5QWxTUWtSSm9SYlZwRER0?=
 =?utf-8?B?T01xa2FSeUhEUVRDWTMzUzZ2dFpFS3V0NEVHYWJ2Zm1aZC9SRUYyTk5DM2ZM?=
 =?utf-8?B?TFU5Mng4WGFhVktCeEtwU01aczRUaHdWK2ZVS0lmUzlPZ2gxaVBvUmlRNHJL?=
 =?utf-8?B?M3lhaXQ2M01QR2NoYncrcHMwaVpkRm9vMzI0R05sdnQwSVZ0c2hkWVVJbVhl?=
 =?utf-8?B?dGE5MmpWR1B4cGx3eUZRckorUEtNaEljZFZvbWF2cG9nQ1hSYWpscmV3S2tn?=
 =?utf-8?B?OW80ZHF5azdMZ040UXp2aFRuUlNlSXYyZVNFK011elNmZk5VWE5Qa0NOdkJL?=
 =?utf-8?B?eFpHaFVPZWR4aW1NcmsxNFVLdVNSbnJ0ZnFQYXVWcU1ZUHRRd21KeVpxcTU0?=
 =?utf-8?B?YWcrUGQyQVVoS2dNQTlsQ3pnQ2tpeXg5ZnBRTUNveFV3MmFkZ3Z6UHNYcElr?=
 =?utf-8?B?K0MvczhheURKcmFhNWYwaFFLc0U4UHlETHl1VXZYS0NZdjZYVytIbTFVVkN4?=
 =?utf-8?B?OVJmQmJLaEVHUzFZcDBDSWRuOCtMS0lDdkdVRy9QeDk2cDBKaUN3ZHprMTdQ?=
 =?utf-8?B?NEE5aURnM0c1TUR2TUhTVENCa1JvdkZURW55UmxnRTh6WXRGUStJUXplcHo5?=
 =?utf-8?B?akl0TXhUWEJtZ1NaTUZsT3FrU2FkL2Q2QWRZZ2k5ZUlFa1VLOVBlR2hKNk9C?=
 =?utf-8?B?SlpaOGVBRTZKcHpKMWFMZGYxSzJvN2NWVENjT1JId0FJWDg1Y20xbXU1dUdW?=
 =?utf-8?B?NDJ6ZUp4MXVySDJMTHNPbWI3TUg0dzV1ejgrK3Y2c09Na0lpSWwweDBHODJ2?=
 =?utf-8?B?K1JDZUdiOVJZQVdlYzhaMXN1TE54ZU9OYkluNzBZcE04YndaYjFMc0VIdnQ0?=
 =?utf-8?B?WmpZSmk2M3kvdm0vaFdlSXZyMWRZRjQrb0kzcWlmdVE2RFBnQ2FsSWN1cU0v?=
 =?utf-8?B?WDBTUXNOZm9Dbk81d0REaFlyTEI5WjZZZTBVSVZueUV0VE1HZ3R5cHlHV0RV?=
 =?utf-8?B?TTM2QnFzSklJTlIxYUVCM1g4TlgrZENQVi9najJUUk41VGZ0RWRBTmpDZFJa?=
 =?utf-8?B?aG41NENGRjlxaVhzN2twZnZtRjBXN1BWVjhzekQrM21IQnQ5NGQ2M0JuT2Q3?=
 =?utf-8?B?eGpWbVhGWHZzdGNTSWM4enNPNy9pTTBXSnEzYmRGSEgvazY2SFZqMFJLSlI0?=
 =?utf-8?B?MHMxanZWYk1ib2xQNm81RmJIVUp4aTk5TnRhNFBYN0pnTFpzL3hldFdFYjZR?=
 =?utf-8?B?Wi9VUnBiZFA4RTE0QjN0WnJFQnQ4akRPQmVYRVdyMU1nL2k3a2E5ejdvM09J?=
 =?utf-8?B?K0VSQ0hsZk5KV05mb3BhOVJjL2ttMGpGMkhJMFhpOUdlV3h4RDZxT1FObEc3?=
 =?utf-8?Q?tnDs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b6d6f4-9a2c-4953-f5d8-08dd8d15da7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 03:18:35.5590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dA1lhl7KdRZCKo1Fog6EmZktE6+7tcejRa05AFzusWDsZ3B5DUfhmeuab5fmUJYHGuI1vCU3I4XEHcBNrhVkvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4258

W1B1YmxpY10NCg0KSGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAy
OSwgMjAyNSA3OjQ3IFBNDQo+IFRvOiBQZW5ueSwgWmhlbmcgPHBlbm55LnpoZW5nQGFtZC5jb20+
DQo+IENjOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA0LzE1XSB4ZW4vY3B1ZnJl
cTogcmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14eHgiDQo+DQo+IE9uIDI5LjA0LjIwMjUgMTI6
MzYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+IE9uIDE0LjA0LjIwMjUgMDk6NDAsIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+PiAtLS0gYS94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYw0KPiA+
PiArKysgYi94ZW4vZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYw0KPiA+PiBAQCAtNzEsNiArNzEs
NDkgQEAgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgY3B1ZnJlcV94ZW5fY250ID0gMTsNCj4gPj4N
Cj4gPj4gIHN0YXRpYyBpbnQgX19pbml0IGNwdWZyZXFfY21kbGluZV9wYXJzZShjb25zdCBjaGFy
ICpzLCBjb25zdCBjaGFyDQo+ID4+ICplKTsNCj4gPj4NCj4gPj4gK3N0YXRpYyBib29sIF9faW5p
dCBjcHVmcmVxX29wdHNfY29udGFpbihlbnVtIGNwdWZyZXFfeGVuX29wdCBvcHRpb24pDQo+ID4+
ICt7DQo+ID4+ICsgICAgdW5zaWduZWQgaW50IGNvdW50ID0gY3B1ZnJlcV94ZW5fY250Ow0KPiA+
PiArDQo+ID4+ICsgICAgd2hpbGUgKCBjb3VudCApDQo+ID4+ICsgICAgew0KPiA+PiArICAgICAg
ICBpZiAoIGNwdWZyZXFfeGVuX29wdHNbLS1jb3VudF0gPT0gb3B0aW9uICkNCj4gPj4gKyAgICAg
ICAgICAgIHJldHVybiB0cnVlOw0KPiA+PiArICAgIH0NCj4gPj4gKw0KPiA+PiArICAgIHJldHVy
biBmYWxzZTsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiArc3RhdGljIGludCBfX2luaXQgaGFuZGxl
X2NwdWZyZXFfY21kbGluZShlbnVtIGNwdWZyZXFfeGVuX29wdA0KPiA+PiArb3B0aW9uKSB7DQo+
ID4+ICsgICAgaW50IHJldCA9IDA7DQo+ID4+ICsNCj4gPj4gKyAgICBpZiAoIGNwdWZyZXFfb3B0
c19jb250YWluKG9wdGlvbikgKQ0KPiA+PiArICAgIHsNCj4gPj4gKyAgICAgICAgY29uc3QgY2hh
ciAqY3B1ZnJlcV9vcHRzX3N0cltdID0geyAiQ1BVRlJFUV94ZW4iLA0KPiA+PiArICJDUFVGUkVR
X2h3cCIgfTsNCj4gPg0KPiA+ICAgICAgICAgY29uc3QgY2hhciAqY29uc3QgX19pbml0Y29uc3Ry
ZWwgY3B1ZnJlcV9vcHRzX3N0cltdID0gew0KPiA+ICJDUFVGUkVRX3hlbiIsICJDUFVGUkVRX2h3
cCIgfTsNCj4gPg0KPiA+IChsaW5lIHdyYXBwZWQgc3VpdGFibHksIG9mIGNvdXJzZSkgT3IgbWF5
YmUgZXZlbiBiZXR0ZXINCj4gPg0KPiA+ICAgICAgICAgY29uc3QgY2hhciBfX2luaXRjb25zdCBj
cHVmcmVxX29wdHNfc3RyW11bMTJdID0gew0KPiA+ICJDUFVGUkVRX3hlbiIsICJDUFVGUkVRX2h3
cCIgfTsNCj4gPg0KPiA+IGZvciB0aGUgc3RyaW5nIGxpdGVyYWxzIHRvIGFsc28gZW5kIHVwIGlu
IC5pbml0LnJvZGF0YS4NCj4NCj4gQWN0dWFsbHksIGl0IGRpZG4ndCBldmVuIG9jY3VyIHRvIG1l
IHRoYXQgdGhlcmUgbWlnaHQgYmUgYSAic3RhdGljIiBtaXNzaW5nIGhlcmUsIHRvby4NCg0KU29y
cnksIEkgbWF5IG5lZWQgbW9yZSBleHBsYW5hdGlvbiwgd2hhdCBpcyB0aGUgInN0YXRpYyIgbWlz
c2luZyB5b3UgYXJlIHJlZmVycmluZz8NCg0KPiBQbHVzIEknbSBtaXNzaW5nIGFueSBhcnJhbmdl
bWVudCBmb3IgdGhlIGFycmF5IHNsb3RzIHRvIHJlbWFpbiBpbiBzeW5jIHdpdGggdGhlDQo+IGNv
cnJlc3BvbmRpbmcgZW51bWVyYXRvcnMuIFdpdGggdGhhdCAuLi4NCj4NCg0KVGhhbmtzIGZvciB0
aGUgZGV0YWlsZWQgaW5zdHJ1Y3Rpb25zLCBsZWFybmVkIGFuZCBJJ2xsIGNoYW5nZSBpdCB0bw0K
ICAgICAgICBjb25zdCBjaGFyIF9faW5pdGNvbnN0IGNwdWZyZXFfb3B0c19zdHJbXVs0XSA9IHsg
InhlbiIsICJod3AiIH07DQpBbmQgZm9yIGluIHN5bmMgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBl
bnVtZXJhdG9ycywgbWF5YmUgd2Ugc2hhbGwgYWRkIGNvbW1lbnQgaGVyZSwNCiAgICAgICAgLyog
VGhlIG9yZGVyIG9mIGNwdWZyZXEgc3RyaW5nIGxpdGVyYWwgbXVzdCBiZSBpbiBzeW5jIHdpdGgg
IHRoZSBvcmRlciBpbiAiZW51bSBjcHVmcmVxX3hlbl9vcHQiICovDQoNCj4gPiBXaXRoIGFsbCBv
ZiB0aGUgYWRqdXN0bWVudHM6DQo+ID4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4NCj4gSSdtIHNvcnJ5LCBidXQgSSBuZWVkIHRvIHRha2UgdGhpcyBiYWNr
LiBUaGVyZSBhcmUganVzdCB0b28gbWFueSBpc3N1ZXMuDQo+DQo+IEphbg0K

