Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E955AE7F36
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024650.1400480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNLQ-00059v-0B; Wed, 25 Jun 2025 10:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024650.1400480; Wed, 25 Jun 2025 10:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNLP-000586-Tn; Wed, 25 Jun 2025 10:27:07 +0000
Received: by outflank-mailman (input) for mailman id 1024650;
 Wed, 25 Jun 2025 10:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PEPZ=ZI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uUNLO-000580-2z
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:27:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2416::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea7385b-51ae-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:27:03 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BL4PR12MB9723.namprd12.prod.outlook.com (2603:10b6:208:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 25 Jun
 2025 10:26:57 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8835.027; Wed, 25 Jun 2025
 10:26:57 +0000
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
X-Inumbo-ID: eea7385b-51ae-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkmMEaSxKt2TTm+kZ8AX5XbgC6QmwsBzaOmNWumUoi4Xew9fI2Q38h74n/lihAnU4W6d2faq6MQ4yyJ3wLsHgSQBwPLHAtGvPT7STY11Uv4peewCQ6BFqwMXjf8LIX/DzS81136XjnrHhKMR7KEyvPTDCJNbTEjGuUPsV4KCbtTncb5O2hzeRKh7j/+kGoi+wLJ+mJc64aI1vEZ8AkViXkwUd35TbomMYjTjxtzZbicrot3+GC+2nurWkaM8V303DCdWRnTd29qUc1+x8uS8Dr70uhNnG6pOd4x0hFEZogxMGHJ79HTJjN+0nxbkgc5g2/eTc6//1GHX8h4K8g7o2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io2TwqX1crxotawNmhDF7I+Z3FoCJZvQSMAHAUAtCsw=;
 b=R3o9bOQeY4ZsyUNL/RdnodBkxgJoyNEx2euxn22bbSQYsJsS9Tia3KXPxOUgxfRGb7vJPvcL4ibJfqHS4Wz5OHuhaXPSwCZle1VQ7HRgpx6OUB3zNHX+k2bTlPiBKESZaKPibk6HHrhR7Pq2eD2gZIUNgTngyHNMCGLL/+klwsNZ3O/seEsN6PTz0QbXUyQ3/MHS7Rnm1LWcjq1zgwoXC8VAfDefU88fDRart4p4XphrLX8LzO1K1omCoOMgfJoEWFY/OefCKoyFWsiy2DScGB+zCqGXRd4085yHAagNuGWxBaVhC/vzn6B4TOzQTQaBBRDwGHHj3WB9Os3t6uFPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io2TwqX1crxotawNmhDF7I+Z3FoCJZvQSMAHAUAtCsw=;
 b=2N6o9x8CQW+eXDxZpWz2ZuqTHM+u6mS98U5z+kw+VQHyO3dbq4vZeKLDuzCXiYFRAguJKVyVziW8nntsuUPWAe5ykjte8GDR/PEncgOaCwjyZoLs9BKJKjukPjfH0oDzjUed0ClWy8W+r+I9eBnwIwmEYFBI+Q76tONtLpBcPYg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi() fails
Thread-Topic: [PATCH v6 7/8] vpci/msi: Free MSI resources when init_msi()
 fails
Thread-Index:
 AQHb23yeMT8YFCMR3kaLDqQP1+DTK7QJCD4AgAme+gD//4QlAIAB4iSA//+e0YCAAIz0gP//gkiAABEx5YA=
Date: Wed, 25 Jun 2025 10:26:57 +0000
Message-ID:
 <BL1PR12MB5849851F7EF0AA4C7BDA3703E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20250612092942.1450344-1-Jiqian.Chen@amd.com>
 <20250612092942.1450344-8-Jiqian.Chen@amd.com>
 <773c448a-d814-458f-ad83-e9740e724408@suse.com>
 <BL1PR12MB584989B1F9DF290C15CD2F9EE778A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <c9cdbb69-4b68-4b77-bcca-feacc800e3d6@suse.com>
 <BL1PR12MB58499585BA47004587A34C93E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <f03f33a9-4073-4a28-9c33-884baa098e29@suse.com>
 <BL1PR12MB58491B943176F970AA61F310E77BA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <a128b6b7-1930-46f2-a696-02ce5432f9ec@suse.com>
In-Reply-To: <a128b6b7-1930-46f2-a696-02ce5432f9ec@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BL4PR12MB9723:EE_
x-ms-office365-filtering-correlation-id: 3f6014e8-9133-4f0c-d3cd-08ddb3d2d062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cElWbWs2cXp4bDFqVHNETnR3MGMyNVhwT1NFN0pPenhOMHdaaVNHZjJNcmJK?=
 =?utf-8?B?N3BSeVhQZEhiYVF1dmZZTjhpRjFVQ3l4WHc5ckNJZmZpUXdGY3g5U3ZkU1Fx?=
 =?utf-8?B?ZXRqellzcllzNklyMkczbWRLbFE2Mlo2L0NoU1FoTmJYQXdITWhZdEJZMDZQ?=
 =?utf-8?B?SmdmZjM3MUZlTjZwNU5hbjRMQ0hzb0t2cFZxMnpmdXo0Rm9ZcVBTbzFmWjA3?=
 =?utf-8?B?bzhGTzA2bUg4cXdubWFUSHFpQ3hYb01HVGRZYW9ZSS8rTkpzTEs5Tm1XQkJY?=
 =?utf-8?B?aHY1WlFFZlJOMHY3c0NjZGFVOEFJNlRhWmU0REpSbWNKaWhJV0pxVEdhU1Zx?=
 =?utf-8?B?Z2dWUHhsZ0I1OWNKZ0hWV2c3bi9JdUFDKzdQVk8vRVVnLzh2ZWlDZURuQUtD?=
 =?utf-8?B?elZrRlZGcEdpZ29lRG96OUdraTc4OXBlR3A5Z2wvRzQ4amJrNWFtN0FZRFFG?=
 =?utf-8?B?MlZ5SEZKWmhSMWt6eXVFcU1BY2tubENUTlVxM2FBdWhlVTU0aTB4QnY2YmVz?=
 =?utf-8?B?ditPMWU2M2ZMQnhEYXZpakJKU3R3UDBWcnp3cGFadXY2dEtFT3N6MXBmQnVs?=
 =?utf-8?B?YkExOGRHU0l2bm1TSjh3N3VWbS9JZHN2djgwSm9LYnJoQ0x2YlBLSFJ2MHE4?=
 =?utf-8?B?MGVvS2UxbnNVYUNMbURGVnBoUzFDdGpLU2pxQUFCZUxyV2EzREFESXFJcnJs?=
 =?utf-8?B?Si9DcUJWZjAzWXhGZE1kR214cEZSbU1KNTJzSXZhV3AwaVFCWTV3bWJVT2dw?=
 =?utf-8?B?ajFRck1GbGtybmt2SHY4K3BMdmdKREJXN2NZSXdPdmVEcVhlVGpRNSsyd2tv?=
 =?utf-8?B?SFF4NnZzc3FYRUF0djM5VTNCMmFEVXB4aEFKNXl2elNTV2k0UjU2MGpwUjd6?=
 =?utf-8?B?TUx2cW9NSGx0MnZpYjViS28wQ3hKclRtKzhNcUlzWGdNNVMzaXRDeG9OT0U2?=
 =?utf-8?B?Nkd4aXV0VnQ4VG9nbWMycVU3YnVqYW9jWnFrSDRLb2NmcG5EKzBPb2g5TElQ?=
 =?utf-8?B?SzVwMEdmUlhFWTg0eWZQSFFNdkU2Q2kvMlVFck50QVdDWmJtYkZJM3Rva2lr?=
 =?utf-8?B?NzI2NGpBRzhDNS9tUmd1elBqeGVwcUFFeVlyRjN3ZU4xM3k3SmZyY2pjTzcx?=
 =?utf-8?B?THBKcGpXUy9aRnlVRTdZdGk2S2tYQnVCbDNDUmZuc3VjeDdrSzNZWUFNQTNt?=
 =?utf-8?B?Q1lxcFU4OXFTSHBpVEs0TWdGR1Yvc21jK1ZWa2xPbDJIQW1QQUY5OTZqZ2Q4?=
 =?utf-8?B?MlN2SWdzZkIvdjFpQkJGblB6MlNxbGQ1bmdxUXdydXBUc2xjSURCeklpZDVu?=
 =?utf-8?B?SGxKZjc5MkhZMEdBeTRZOFd6N04waCsyU3h2THlTa1E1RWlWZS9aT0E0NHhw?=
 =?utf-8?B?NXQ2blVOVkM1SGxvWmhsUkVsa0J2c1hEd01COGxTV3pLbTdDK1VwR25XSnVO?=
 =?utf-8?B?V0Fwb2pxc0xSWElKdHFDSEJEQ3dWUnBiVlRyek9vZE14cHNHMU8rQkNud2Zj?=
 =?utf-8?B?akNZMkVqaFhrcFNJajVsRFhLMGpPdnRLSE5waVJBdHFYWTVPVUUybUF4L1Nh?=
 =?utf-8?B?MDk4TmR1V2Vabk9iTUlkUmJsTlBuT1B2UXR3bEViUTdsM1phR2wyR1VmZ1Ba?=
 =?utf-8?B?dUdUWTdxVkhnckIzMjRTQXZBSUY1YU9FT2daU0IwaHFQeC9wVFVKRTlpL3J3?=
 =?utf-8?B?Qzc0TW9Tck9qRHpOTndZV29sbmlCdjRsNFQxdkl0czJaa2xud09qM2UwYy8x?=
 =?utf-8?B?d04xNkMrVVNSQkRYaTlVRTlSRlRyTFUvR1ByQjh0UFh5OGhOL0VDQjdOREJH?=
 =?utf-8?B?QzVqNUtvaTBZTGxYS0ZiOSthTGcxUVNLcHpuMnZwZE1uN281RENXdjhlQk41?=
 =?utf-8?B?Rlg5M1YzcEErTm9Wdy9Cc3ZKb2xlR0xDdEFCOHMwSmR6NHdINHRIQUdiOEM2?=
 =?utf-8?B?dWxteFFvQ2tqeG54OWJMd01HdnUyQlROTkhyUHBTaDhiR2gzbkxmV1l0NDVN?=
 =?utf-8?Q?DdF3HxJg8bleFoUJ/Xv9yw6pSHI+2E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTI2SHNWajhub0plWDQ1a3VzYk5kNDBvYlJWSlUvMTQ2NUV1ZWlqS2l1NWtF?=
 =?utf-8?B?UVF4NFk3aHpTT0Nxb1I4SDErc3VPc2h1N3pNbVMrdDdmbFpoeUZ1bHdDemF4?=
 =?utf-8?B?SzFJUEJ3b1dWeGRTVHRkY0VxYmRZbzAwbUl2T0Nzd3dOb3NLTGh2a2VxdHZG?=
 =?utf-8?B?eUNIditCUDAxUEtUVnNidldSV3BSamJRazMvR05QT2loWHBlNjM4SXlCU3JO?=
 =?utf-8?B?SWdDeHVUQjkxWDFJN3N3cWdwMUVBV0ZNLzlhQ3VLNitaRTh0T2V5SG8zSEhS?=
 =?utf-8?B?bG9kZVVUbU1aU3hSUG9HcWIvZUg2RGQ3TkVaL292U25OY1IwTFJuMkx6VHM0?=
 =?utf-8?B?bVdPTmVDNmlOQnVleGlnTzZQSitLRWdCNzV3aC9kMFBEdHVrc1JMQzBMdE15?=
 =?utf-8?B?QUZValdnVDUwRDZxUS91OGptQnJndFRYK1F6L0ZWbmxOdzF5T3BKMWxvbGZW?=
 =?utf-8?B?dUFKTFM2MFJDUGxJRmdQZFVKYWNkYWNhK2NPYzZDNDBPcE8vVDY5QlJpWksv?=
 =?utf-8?B?ZGF5blplTFE1T3dBR2E2R2FMMlhBWkM5V2VoNzRlTEk2ZXVXM0dUMmxYbCtB?=
 =?utf-8?B?VTcxTUZqVGhRbHd5cnNrUU5JU2N4V3huRlgvYWJLcG5oQUZVLzJDNXZvNVFO?=
 =?utf-8?B?LzNVc3gwOXJkcWxqSzVuY0lhNzFwOHRtd0JvRTZnTVJFSTRwbWJBSTlNVzBO?=
 =?utf-8?B?ZE9ud2JYeWNCSXYyTk5FMDRvNTV3Si9FQVFnOXpyM1YyanI4S01XRWVEZFBZ?=
 =?utf-8?B?azNmMVc5b0hCK05UbDk1OFA1TjVabGxuWGIrbGE4V1V0dHV4Y1NhV29LY0NP?=
 =?utf-8?B?WENUakVFVjRtQURObkliN0JZYlA2STVjaUJzUnRPNlgzOTQ5c3hoVlBKT2J4?=
 =?utf-8?B?d1dXczVxZWtEckxwMUJYUWh2S3NsaGV2ekoyTVJ1dFNCMGJIem9SakpDSzIw?=
 =?utf-8?B?MVV0bDc1ckFpTGs5SEM3Vkk2MjBJY1RyOVVTYjFVRTh6MWllNGhMUHMrSXV4?=
 =?utf-8?B?OHlvcmZwYlJvZHlHNjZGRTlpK2s0dWNzeFF1bkp0ajdnL2R2SUlsTURZWXY1?=
 =?utf-8?B?Vk5qVnY0TlJuOTZsd3Z4dVVDWUVVa2l2WTRxWGJtRGcyWlZ3NDhrOXRDRWJi?=
 =?utf-8?B?Zk5zcDZhT0F5ZnVDWkVEM2xMamNnNmRWSzY4SXgzSEU3VTMyd2hlR1pDSFgv?=
 =?utf-8?B?ZzFQMGFrQk9qbXFFd0NpREVqcTkyUU9rTTVjREVyWU9aV0NUQ2RWTDUrd1dy?=
 =?utf-8?B?UWxZRHVnT1hiS0ZCN2xnWlk1b1JRZWlZTU1TNE04RjIwZUlpS3FWOUFvYnc5?=
 =?utf-8?B?b2xjOGUreFhLbFlnaHlZS2FBeDd1Qkw0NVcxZTFzYVpXOEc0dWV5RE5aN29F?=
 =?utf-8?B?RExGdnlQSklaMDRIQllydW4yb1JuNjdoenhYcGZ1cldWNWVMc2huR2ROY1FR?=
 =?utf-8?B?eTNLT28wcVROSCtjN2xKTnlSRHJoWmNvN3FVdHMyd0hFQTV6YmZ0NDJxeEFw?=
 =?utf-8?B?WGdmdkFyd1FCbmFFT0VvM2ptNy9iS3RiVU40T2F0eGh6SHRtc0ZuUUkxNWNa?=
 =?utf-8?B?MHVkN1lWbjRBL2ZEeUFhV2w2d0dTMmE4NklEbXZNMGR5WDRraWR4SFNuMURt?=
 =?utf-8?B?OE5vQURycXZYU0hGRlNzMDVjNlY3U0V1SUhoNjlFek5tRnZEeHpjTlRpZWdk?=
 =?utf-8?B?ZC9PRkJLbjZUVG53cU1jRG5pSHVtVDRkWXUxVEJZN2VNVVRkeDdTUkJMMEtX?=
 =?utf-8?B?YXY5Z0ZaUlhpdGl2S0Zua3JDTkxwWEUvYlRaejFGZzlFUnZ5blhkOFNCcGpy?=
 =?utf-8?B?ZEl2TWZCRnZjN0p1MXVUMC9XYmVkQUJZWjh3dmhTM3FETUYzaVVFTGMvT3A0?=
 =?utf-8?B?MndqeGdEWkN2b2MvWWF6UHJvQWNpaERObzdqUG94TXBoblBhd2plalFra2I2?=
 =?utf-8?B?aHIxTlZPVlRIY09vdVB0dFdEVDd2dGVQUDY4Yng4Mnh3MkxMcmVZc0pTMkJW?=
 =?utf-8?B?MzVKaCtub0FIYzVuNUxrS0J2bEtQZ1lQbndvVzJKQVFRZEM3ak9FSVJOUDlV?=
 =?utf-8?B?UTZ5V3pkaGN4aUlzOUs2V2JHR2ppOHNZc1dKc2RLTlo3V0RVQThVT3lETWsw?=
 =?utf-8?Q?MLt4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E4BF00CE9A3814FAEE7D85E08FE583A@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6014e8-9133-4f0c-d3cd-08ddb3d2d062
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:26:57.6567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CSaymvZI73dywLnwVvn3nX8VbisrQHae8GOHsH2edUlC2TF+oU/GkAqalgGziEo2OsgdiNBe5eMc3NicZdqcLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9723

T24gMjAyNS82LzI1IDE4OjA5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjUuMDYuMjAyNSAx
MTo0NywgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4gT24gMjAyNS82LzI1IDE3OjE1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+PiBPbiAyNS4wNi4yMDI1IDA5OjE2LCBDaGVuLCBKaXFpYW4gd3JvdGU6
DQo+Pj4+IE9uIDIwMjUvNi8yNCAxODoxNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAy
NC4wNi4yMDI1IDExOjQ5LCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+Pj4+Pj4gT24gMjAyNS82LzE4
IDIyOjQ1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMTIuMDYuMjAyNSAxMToyOSwg
SmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL21zaS5j
DQo+Pj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL21zaS5jDQo+Pj4+Pj4+PiBAQCAtMTkz
LDYgKzE5MywzMyBAQCBzdGF0aWMgdm9pZCBjZl9jaGVjayBtYXNrX3dyaXRlKA0KPj4+Pj4+Pj4g
ICAgICBtc2ktPm1hc2sgPSB2YWw7DQo+Pj4+Pj4+PiAgfQ0KPj4+Pj4+Pj4gIA0KPj4+Pj4+Pj4g
K3N0YXRpYyBpbnQgY2ZfY2hlY2sgY2xlYW51cF9tc2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
Pj4+Pj4+PiArew0KPj4+Pj4+Pj4gKyAgICBpbnQgcmM7DQo+Pj4+Pj4+PiArICAgIHVuc2lnbmVk
IGludCBlbmQsIHNpemU7DQo+Pj4+Pj4+PiArICAgIHN0cnVjdCB2cGNpICp2cGNpID0gcGRldi0+
dnBjaTsNCj4+Pj4+Pj4+ICsgICAgY29uc3QgdW5zaWduZWQgaW50IG1zaV9wb3MgPSBwZGV2LT5t
c2lfcG9zOw0KPj4+Pj4+Pj4gKyAgICBjb25zdCB1bnNpZ25lZCBpbnQgY3RybCA9IG1zaV9jb250
cm9sX3JlZyhtc2lfcG9zKTsNCj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+ICsgICAgaWYgKCAhbXNpX3Bv
cyB8fCAhdnBjaS0+bXNpICkNCj4+Pj4+Pj4+ICsgICAgICAgIHJldHVybiAwOw0KPj4+Pj4+Pj4g
Kw0KPj4+Pj4+Pj4gKyAgICBpZiAoIHZwY2ktPm1zaS0+bWFza2luZyApDQo+Pj4+Pj4+PiArICAg
ICAgICBlbmQgPSBtc2lfcGVuZGluZ19iaXRzX3JlZyhtc2lfcG9zLCB2cGNpLT5tc2ktPmFkZHJl
c3M2NCk7DQo+Pj4+Pj4+PiArICAgIGVsc2UNCj4+Pj4+Pj4+ICsgICAgICAgIGVuZCA9IG1zaV9t
YXNrX2JpdHNfcmVnKG1zaV9wb3MsIHZwY2ktPm1zaS0+YWRkcmVzczY0KSAtIDI7DQo+Pj4+Pj4+
PiArDQo+Pj4+Pj4+PiArICAgIHNpemUgPSBlbmQgLSBjdHJsOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4gKyAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lzdGVycyh2cGNpLCBjdHJsLCBzaXplKTsNCj4+
Pj4+Pj4+ICsgICAgaWYgKCByYyApDQo+Pj4+Pj4+PiArICAgICAgICByZXR1cm4gcmM7DQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFRoaXMgaXMgYSBkaWZmaWN1bHQgb25lOiBJdCdzIG5vdCBhIGdvb2QgaWRl
YSB0byBzaW1wbHkgcmV0dXJuIGhlcmUsIHlldA0KPj4+Pj4+PiBhdCB0aGUgc2FtZSB0aW1lIHRo
ZSBoYW5kbGluZyBvZiB0aGUgcmVnaXN0ZXIgd2UncmUgdW5hYmxlIHRvIHJlbW92ZSBtYXkNCj4+
Pj4+Pj4gc3RpbGwgcmVxdWlyZSBlLmcuIC4uLg0KPj4+Pj4+Pg0KPj4+Pj4+Pj4gKyAgICBYRlJF
RSh2cGNpLT5tc2kpOw0KPj4+Pj4+Pg0KPj4+Pj4+PiAuLi4gdGhpcy4gVGhlcmUgbWF5IHRoZXJl
Zm9yZSBiZSBtb3JlIHdvcmsgcmVxdWlyZWQsIHN1Y2ggdGhhdCBpbiB0aGUNCj4+Pj4+Pj4gZW5k
IHdlJ3JlIGFibGUgdG8gLi4uDQo+Pj4+Pj4+DQo+Pj4+Pj4+PiArICAgIHJldHVybiB2cGNpX2Fk
ZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNpX2h3X3JlYWQxNiwgTlVMTCwgY3RybCwgMiwgTlVM
TCk7DQo+Pj4+Pj4+DQo+Pj4+Pj4+IC4uLiB0cnkgdGhpcyBhdCBsZWFzdCBvbiBhIGJlc3QgZWZm
b3J0IGJhc2lzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBNb3JlIGdlbmVyYWxseTogSSBkb24ndCB0aGlu
ayBmYWlsdXJlIGhlcmUgKG9yIGluIG90aGVyIC5jbGVhbnVwIGhvb2sNCj4+Pj4+Pj4gZnVuY3Rp
b25zKSBtYXkgZ28gZW50aXJlbHkgc2lsZW50bHkuDQo+Pj4+Pj4gRG9lcyBiZWxvdyBtZWV0IHlv
dXIgbW9kaWZpY2F0aW9uIGV4cGVjdGF0aW9ucz8NCj4+Pj4+DQo+Pj4+PiBOb3Qgc3VyZSwgc29y
cnkuIEJ5ICJtb3JlIiBJIHJlYWxseSBtZWFudCAibW9yZSIgKHdoaWNoIG1heSBqdXN0IGJlIGNv
ZGUNCj4+Pj4+IGF1ZGl0aW5nLCByZXN1bHRzIG9mIHdoaWNoIHdvdWxkIG5lZWQgd3JpdGluZyBk
b3duLCBidXQgd2hpY2ggbWF5IGFsc28NCj4+Pj4+IGludm9sdmUgZnVydGhlciBjb2RlIGNoYW5n
ZXM7IHNlZSBiZWxvdykuDQo+Pj4+Pg0KPj4+Pj4+ICAgICByYyA9IHZwY2lfcmVtb3ZlX3JlZ2lz
dGVycyh2cGNpLCBjdHJsLCBzaXplKTsNCj4+Pj4+PiAgICAgaWYgKCByYyApDQo+Pj4+Pj4gICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUiAiJXBkICVwcDogcmVtb3ZlIG1zaSBoYW5kbGVycyBmYWls
IHJjPSVkXG4iLA0KPj4+Pj4+ICAgICAgICAgICAgICAgIHBkZXYtPmRvbWFpbiwgJnBkZXYtPnNi
ZGYsIHJjKTsNCj4+Pj4+Pg0KPj4+Pj4+ICAgICBYRlJFRSh2cGNpLT5tc2kpOw0KPj4+Pj4NCj4+
Pj4+IEFzIEkgdHJpZWQgdG8gaW5kaWNhdGUgaW4gbXkgZWFybGllciByZXBseSwgdGhlIGZyZWVp
bmcgb2YgdGhpcyBzdHJ1Y3QgaXMNCj4+Pj4+IHNhZmUgb25seSBpZiB0aGUgZmFpbHVyZSBhYm92
ZSB3b3VsZCBub3QgbGVhdmUgYW55IHJlZ2lzdGVyIGhhbmRsZXJzIGluDQo+Pj4+PiBwbGFjZSB3
aGljaCBzdGlsbCAod2l0aG91dCBhcHByb3ByaWF0ZSBjaGVja2luZykgdXNlIHRoaXMgc3RydWN0
Lg0KPj4+PiBIbW0sIGJ1dCBhbGwgaGFuZGxlcnMgYWRkZWQgaW4gaW5pdF9tc2koKSB1c2UgdGhp
cyBzdHJ1Y3QuDQo+Pj4+IFNvIGl0IGRvZXNuJ3QgZXhpc3QgdGhlIGNhc2UgdGhhdCB3aGVuIGFi
b3ZlIHVuYWJsZSB0byByZW1vdmUgYWxsIGhhbmRsZXJzIGFuZCBzdGlsbCByZXF1aXJlIHhmcmVl
IHRoaXMgc3RydWN0Lg0KPj4+DQo+Pj4gV2VsbCwgaW4gdGhlIGVuZCB5b3Ugc2F5IGluIGRpZmZl
cmVudCB3b3JkcyB3aGF0IEkgZGlkIHNheSwgaWYgSSB1bmRlcnN0YW5kDQo+Pj4gY29ycmVjdGx5
LiBUaGVyZSBhcmUgc2V2ZXJhbCBvcHRpb25zIGhvdyB0byBkZWFsIHdpdGggdGhhdC4gT25lIG1p
Z2h0IGJlIHRvDQo+Pj4gaGF2ZSB0aG9zZSBoYW5kbGVycyByZWNvZ25pemUgdGhlIGxhY2sgb2Yg
dGhhdCBwb2ludGVyLCBhbmQgYmVoYXZlIGxpa2UgLi4uDQo+Pj4NCj4+Pj4+PiAgICAgLyoNCj4+
Pj4+PiAgICAgICogVGhlIGRyaXZlciBtYXkgbm90IHRyYXZlcnNlIHRoZSBjYXBhYmlsaXR5IGxp
c3QgYW5kIHRoaW5rIGRldmljZQ0KPj4+Pj4+ICAgICAgKiBzdXBwb3J0cyBNU0kgYnkgZGVmYXVs
dC4gU28gaGVyZSBsZXQgdGhlIGNvbnRyb2wgcmVnaXN0ZXIgb2YgTVNJDQo+Pj4+Pj4gICAgICAq
IGJlIFJlYWQtT25seSBpcyB0byBlbnN1cmUgTVNJIGRpc2FibGVkLg0KPj4+Pj4+ICAgICAgKi8N
Cj4+Pj4+PiAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3Rlcih2cGNpLCB2cGNpX2h3X3JlYWQxNiwg
TlVMTCwgY3RybCwgMiwgTlVMTCk7DQo+Pj4NCj4+PiAuLi4gd2hhdCBpcyB0cmllZCB0byBiZSBw
dXQgaW4gcGxhY2UgaGVyZSAoYW5kIGxpa2UgIm5vIGhhbmRsZXIgaW5zdGFsbGVkIg0KPj4+IGZv
ciBvdGhlciByZWdpc3RlcnMpLg0KPj4gQWNjb3JkaW5nIHRvIHlvdXIgc3VnZ2VzdC4gV2hhdCBJ
IGNhbiB0aGluayBvZiBpcyB3aGVuIHZwY2lfcmVtb3ZlX3JlZ2lzdGVycygpIGZhaWxzLA0KPj4g
dGhlbiBsb29rdXAgdGhlIE1TSSByZWxhdGVkIGhhbmRsZXJzLA0KPiANCj4gV2hhdCBleGFjdGx5
IGRvZXMgdGhpcyBtZWFuPyBBaXVpIGlmIHZwY2lfcmVtb3ZlX3JlZ2lzdGVycygpIGVuZHMgdXAg
ZmFpbGluZywNCj4gaXQgbWF5IGJlIHRoZSBsb29rdXAgd2hpY2ggaXMgdGhlIHByb2JsZW0uIFdo
aWNoIGlzbid0IHdoeSB0aGlzIHdhc24ndCB3aGF0DQo+IEkgc3VnZ2VzdGVkLiBJbnN0ZWFkIEkg
c3VnZ2VzdGVkIHRvIG1ha2UgdGhlIHJlc3BlY3RpdmUgaGFuZGxlcnMgZGVhbCB3aXRoDQo+IHRo
ZSBjYXNlIG9mIHZwY2ktPm1zaSBiZWluZyBOVUxMLiBXaGljaCBvZiBjb3Vyc2UgaW4gdHVybiB3
b3VsZCByZXF1aXJlDQo+IHBhc3NpbmcgcGRldi0+dnBjaSB0byB0aGUgcmVzcGVjdGl2ZSB2cGNp
X2FkZF9yZWdpc3RlcigpLCBub3QgcGRldi0+dnBjaS0+bXNpLg0KDQpMaWtlIGJlbG93Pw0KDQpA
QCAtMzcsNyArNDIsMTMgQEAgc3RhdGljIHVpbnQzMl90IGNmX2NoZWNrIGNvbnRyb2xfcmVhZCgN
CiBzdGF0aWMgdm9pZCBjZl9jaGVjayBjb250cm9sX3dyaXRlKA0KICAgICBjb25zdCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywgdWludDMyX3QgdmFsLCB2b2lkICpkYXRh
KQ0KIHsNCi0gICAgc3RydWN0IHZwY2lfbXNpICptc2kgPSBkYXRhOw0KKyAgICBjb25zdCBzdHJ1
Y3QgdnBjaSAqdnBjaSA9IGRhdGE7DQorDQorICAgIGlmICggIXZwY2ktPm1zaSApDQorICAgICAg
ICByZXR1cm47DQorDQorICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaSAqbXNpID0gdnBjaS0+bXNp
Ow0KKw0KICAgICB1bnNpZ25lZCBpbnQgdmVjdG9ycyA9IG1pbl90KHVpbnQ4X3QsDQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMXUgPDwgTUFTS19FWFRSKHZhbCwgUENJX01TSV9G
TEFHU19RU0laRSksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGRldi0+bXNp
X21heHZlYyk7DQpAQCAtMjM5LDcgKzI1MCw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9t
c2koc3RydWN0IHBjaV9kZXYgKnBkZXYpDQogICAgICAgICByZXR1cm4gLUVOT01FTTsNCg0KICAg
ICByZXQgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCBjb250cm9sX3JlYWQsIGNvbnRy
b2xfd3JpdGUsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zaV9jb250cm9sX3JlZyhw
b3MpLCAyLCBwZGV2LT52cGNpLT5tc2kpOw0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBt
c2lfY29udHJvbF9yZWcocG9zKSwgMiwgcGRldi0+dnBjaSk7DQoNCj4gDQo+PiBhbmQgc2V0IHRo
ZSByZWFkL3dyaXRlIGhvb2sgdG8gYmUgdnBjaV9pZ25vcmVkX3JlYWQoKS92cGNpX2lnbm9yZWRf
d3JpdGUoKSwNCj4gDQo+IEJ1dCB2cGNpX2h3X3JlYWQxNigpICE9IHZwY2lfaWdub3JlZF9yZWFk
KCkuDQo+IA0KPj4gYW5kIHNldCB0aGUgcHJpdmF0ZSBkYXRhIHRvIGJlIE5VTEwuDQo+PiBJcyBp
dCBhY2NlcHRhYmxlPw0KPiANCj4gQWx0ZXJpbmcgYWxyZWFkeSByZWdpc3RlcmVkIGhhbmRsZXIg
cHJvcGVydGllcyBmZWVscyBwcmV0dHkgZnJhZ2lsZSB0byBtZS4NCj4gDQo+IEphbg0KDQotLSAN
CkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

