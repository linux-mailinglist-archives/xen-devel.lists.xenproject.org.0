Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D99B56F04
	for <lists+xen-devel@lfdr.de>; Mon, 15 Sep 2025 05:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124104.1466632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy0De-0001C5-TD; Mon, 15 Sep 2025 03:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124104.1466632; Mon, 15 Sep 2025 03:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uy0De-0001Ae-NN; Mon, 15 Sep 2025 03:49:34 +0000
Received: by outflank-mailman (input) for mailman id 1124104;
 Mon, 15 Sep 2025 03:49:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0kbA=32=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uy0Dd-0001AX-R2
 for xen-devel@lists.xenproject.org; Mon, 15 Sep 2025 03:49:34 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2406::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb94ad67-91e6-11f0-9809-7dc792cee155;
 Mon, 15 Sep 2025 05:49:31 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.19; Mon, 15 Sep 2025 03:49:26 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 03:49:26 +0000
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
X-Inumbo-ID: fb94ad67-91e6-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+IeRCbPZZ7ngm4APNBQIleokgnNXTSOgBnWBQX7Y0qz0grUD+09T6nCPraFMfvColTWzkVPMKMavU6O2P+uEkLv7J+bSt3VfDgOSegXCqD/aSCwsvEfTq2Xep1Jgk3lmn/CiPPk0TL8FWJjzwcHhZuezeVPGJfGXbKykJQ/WexbG4DObkxTtjKHZbDVobYg7RSFN5YKCM+yeNN7tbaTjoLoTEXoP/yYYtR2ocVbqcvzY3VwEP7E6qUGMCRxIHbn0vzC2zOYkT3ffqQKRhaaSNgPq5qW5oU4SZwP4ZY5uBlq3R5U+ASiar9mo+dm9OVQ1t/QeBjTCrjiDBGfZJDquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkSSqu4YI08dqY4Va5eTOo1UDxeCudbje/fjLRUGmNw=;
 b=ZLMyQkIQ4MB0XrG9gJdAXwghQgkW44sB5xb+Vwn8jOCf534Q8yz0jqwjXoko0+3mVd++Ge39VshPH+l6lVsjusnbFqmTfa5fTjOixctS2t2W3zjgh34pJYu7scv3H2EcjOUmfoh9qTB2FM57DN804F2VxdhM5+4aymIe3thQG6EV9NjnMBfJ2O4i+sz41v+gdkQN9YfCNe2UeBDcR/LxRm+vJ23wPNKkFjvi5vzoAVqp0QRXkQmjkyWkpg9UMBbwlN5c7XbU/eiYqbA4bUYzdm+W0ZpEaxtTWqLwE3gz1O1DfCHxinXx6hX+dc7L8m6HZK6q/YNasRgOBXd437XgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkSSqu4YI08dqY4Va5eTOo1UDxeCudbje/fjLRUGmNw=;
 b=GO+nx4jqgTkc7D6UvNvOjxaebbxqNpvbHIn+t54aG7sZblxpe0Vj3b3pRjgxRQjPhuVy0sNWO+32yPBYo3WJYcdc0UgmiSi/P7R0l3wPk47E/jvmKgJQC+tAbiZISPqL9pcJgcq8kHn0f+Q9dMaPX4M+9gdkuwdcAIKFigH9aZg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Andryuk, Jason" <Jason.Andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Huang, Ray" <Ray.Huang@amd.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
Thread-Topic: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
Thread-Index: AQHcHWYoX5yLBs91qkCeYarmDUxFSLSC6XqAgAD6+DCABTACAIAKkulw
Date: Mon, 15 Sep 2025 03:49:26 +0000
Message-ID:
 <DM4PR12MB84517C725A32419A97B9F5A1E115A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
 <20250904063518.2097629-2-Penny.Zheng@amd.com>
 <849f73f1-4004-4d17-a7a9-d755fb0f889b@suse.com>
 <DM4PR12MB8451C5D54EFEC8F6E0B76E43E103A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a76aa498-512e-4797-b6d7-b7045cffa21b@suse.com>
In-Reply-To: <a76aa498-512e-4797-b6d7-b7045cffa21b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-15T03:30:49.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|IA0PR12MB8746:EE_
x-ms-office365-filtering-correlation-id: 5f8fa64f-e7b1-42d5-6b9d-08ddf40adde3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?TDBGR1NTL0VkSWIvNGsyRVN4SVloOFRWeFkxOG93U2VXME5CVFhlZ0dtOGxr?=
 =?utf-8?B?R01uU1V5M09tVXJ5Q2JtNmcvUGlXV3dwSXdxeFR4d1p6Q0NOKzlEWmpBNGFJ?=
 =?utf-8?B?cnpoWVBTK0VESExKWjM1eC9pTTlUQjVncDJQUlRTZGkrdFlLRUdYYi9NNUVB?=
 =?utf-8?B?bFZQVXc3MlBJRnlwck1QaWhjK0FGNGxVdllwdW5hUklXTlF0T3NNU3MvRWts?=
 =?utf-8?B?TXpiL1owVEd0a0ZQS0lRVFFUZEhHWmpGNUd5Q0V1dWV1WTgwYVdCOWFlVCtF?=
 =?utf-8?B?QnJwOW1HQnQ1NEdMbkJDL3R4Nnp4S0tGVFkvaTRDVWVkNU1nRU5YandvWnQ1?=
 =?utf-8?B?STlMVEJqblJxSFlWVlB0Z1JRVjlnRStjQjJQbVd3TjJIMHZXYnpMOFFnc01D?=
 =?utf-8?B?dG8raDdkK0lnYjNTbEF6Z2FTS3RTUGpHamVUMjloTTR1ZGxjUkJIdjZ6Wlh3?=
 =?utf-8?B?Z0RIVjd5WG82VWlPOVV5MVZ5dXNjVUZlYTdjVm5oRFJ3dW8yWTFwdHQ5NGpl?=
 =?utf-8?B?LzlKT3V6anEzTEYzSk1STitYVTVrbzBoTCtad3hDRVlJQWlSSUhTU3JxcXpU?=
 =?utf-8?B?TGJjWWJoelkvN2piaUl2RGxkNzFiL1pjaXpVbngrMGpJRGU2K2QwL3NxS0ti?=
 =?utf-8?B?aG5SV0VFN3Z5MXZMbVhVdllUMFlWSW84QTZUWmVYRzRqbURCK0FWNFJna0pY?=
 =?utf-8?B?NTFWd0czQmRvdHZ0elZRSGQyRzh6Ry9xdjk5QnJrL0tMZHJ4ZE9FU0Vtbmgz?=
 =?utf-8?B?bjM3ZmQ4ckhlZkZnK2wyZ1ZKeTROVnpQUE9qY2dyekhNSkVCakVZRnVDVXJI?=
 =?utf-8?B?Y2tyVENTbDBrNC9qR1BxeGRBbUh3R3J0dnh5NFJFb2IwWmNlMzZET2JVY3dU?=
 =?utf-8?B?dTBxVmFiRmZQRW5lSnhlS1oyQ0VMekVEbXZ5dzgrSFJFSkxWQ0hxYlB1Rk5V?=
 =?utf-8?B?TzBTRG9YNWorTFRZNStKV1pFZzY5RnV0VDlmT0tBbzUvR3gyY1VCaWVveW5s?=
 =?utf-8?B?dXlaOTRSYlpjMnZVTFJyd1NMUzFqKzBqVkRWS2lDL3pjQzhaTDg3L0d1SlV6?=
 =?utf-8?B?a21WUXd6eDQ4MzE5cDhVallSd1VRVmlRbE9kcWw0eE1YVjlER0xhL1RJaW4y?=
 =?utf-8?B?RHB6eEs4aFpuZ05VdWk5M0dNS2xlQjlpU3NOWlRVQkY1L0krYW5KYTFEWDNS?=
 =?utf-8?B?emdCWncvcHpDLzMrNnZHN0VNbVRjNGppWVpTSTI3UU50R1Q3WVpSVkoxanNH?=
 =?utf-8?B?bVErbHZkaTViQnlpaVF5dU5zNzNYUmNua3RleVNIQXl2amFGSC9PZGZYL1Fl?=
 =?utf-8?B?WnR1UUZud3lGb3Jub21Ha0c1WnZVcjNFdWR2b2dhaHdtVVFBNWFRQXNZaTBh?=
 =?utf-8?B?T2EzRkgyRmNqV01LYXlCNmFoSkZ1eHUxZ1NjaGVNMzlQcU03QXlZVGdRVG1X?=
 =?utf-8?B?MjdnL01WanMxTmJmM2V1aVJhUGVocFlGaUhsbS9GWnVpUlh5dnlsZytIRytC?=
 =?utf-8?B?QmxGcGF0aUZTWFVhbU9veS9wL0hCZHhNR2tOaWtRak1tMk5IcExGc01BUHlw?=
 =?utf-8?B?Vzl1ZFNBdStEMEJDc0t0aGNOOVd3elVXM1B6dldydzlCQ3ZWdHZva2lGdlli?=
 =?utf-8?B?VTgrN2RDU1pESys3QzVhY1MxdHRyL2o4dUhoWE1kSGFDWkZ5WmkrMXp6Z25Z?=
 =?utf-8?B?RW5ib2VKR1F5NFBPRnNHVXJhekxlN1gwYjlHc2l1VmR4ZEc2ZzRRdStQVVk3?=
 =?utf-8?B?MWRTeWRTVmhLa3Q5VnBkUENVZ1E2dEdaankyc1gwamxheSt5S1RWU3cxOGxk?=
 =?utf-8?B?bkkwZXhjd3VQRWp1d1hUMFRha05SLzlXazgwbkNkOWVEQUhxMEpkdnBFMFZn?=
 =?utf-8?B?OTNxZERDNXNYdDl1MlJQR2gvUmpGV0ZkUmV5VUFBMEVqbWlZbjkzeEFvd3Vm?=
 =?utf-8?Q?VBmDldkY+0I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWtFYTl6b2ZCVThmVDltT0xJK3NzL1hLVmM4RVM4WVRyU1dWZzJXUWJLQito?=
 =?utf-8?B?bDBRelk3c29sRjJ4clA4dUNFR3l1SUVNZ1IxMXBkTXlWU2N3RTBzMUxxakxY?=
 =?utf-8?B?NnBMbG1zRDZnQXdnVllzL1A0eHBiT2M2QzRDNVl6MG1lcVVZN1B0dmw1RjUy?=
 =?utf-8?B?VzY0cUJGUnk3TGpJTDFWM3VGeEd3bUR5Z1ZIZXdJMWZHcDlJcFYxTlhta3Fp?=
 =?utf-8?B?Z0tObWJPc3pOeXg3VEJCZDYxakN2UGc0WGZ6VnloczJiMVVOVGdHTDRXZWJD?=
 =?utf-8?B?RVd5RXcwd3ZicG1SVE0ra1JJeUFCV0hIK2M3bmVrNSt5YzRsenE5V3BVTHFH?=
 =?utf-8?B?YnJ4SjlVSFhVaFhqVmtsTnpUckdDUGN4V0sxQlFBcXFCM0tnOFlDbEtrTlJC?=
 =?utf-8?B?Zm5BM1ZxU0hBMkhFQlpmV3B6OHlJckxBd21KaGNYVTk2d3NqdW5jTWlUK2w1?=
 =?utf-8?B?VGNKZzJ0bzBieCsvV3BoekZZVjhtUDBrSmFhc3VRYkxWNU5yWW5KaUh6Qlk1?=
 =?utf-8?B?UXpPSGpwbFJSTzFHUjVzTTExUG1EWXBzYzZOTWdJcm8yVkNUVWZYNTdEL29m?=
 =?utf-8?B?OXUwSDViVnUxTVY4NkJ5UFR3d0FaWlk5K3R2QkkxNGNMNGRIMm9RR2JoWFpC?=
 =?utf-8?B?ckFZSEFPSXBNWFpjSUtQOGJReEdIVm5YMndJR1gwUnlsME9SOTZIQWc3UGE3?=
 =?utf-8?B?UFd6eXA4cmRRRTdxY1dNT2ZzbWJpUWRDd2tlQTE3NkgyVGJqNUp5VmQxUVA4?=
 =?utf-8?B?ZjhsQmxXZVpsMVhiNUdrN0NDZ2JRZ0pRTDJzN2xuYzBqUTRkMm9RS0RqdHE5?=
 =?utf-8?B?bVVFaHFUU2NHbVNoNzl3QzJxY1lxeklCanVYTk9HVnU2ZURkVGdYMUQybjly?=
 =?utf-8?B?ZCtRM2NoOWJ1NWFkL2ltbEVmSm9SenBXQVE0VkZLRUltVDBLTCtnRkN6T0kv?=
 =?utf-8?B?ODNDdU1iZ09TMEE1dWFpRHhKL1FNWkd4cDBEdjJOWm9ZRFVYYnFJK3M2c2JD?=
 =?utf-8?B?Z3VQQ1RDZ1h0ZCt5RGlwOThFSU1VUEtWOHFKaU5LMkxNY204bHc5VG4zR1JX?=
 =?utf-8?B?TmlCbks1cUIwSEdMZjFkUEd6UjlwMW8xUDNCQzJDSlM1RlJHaG9oUEVCdzBz?=
 =?utf-8?B?MUpKR0w1bmZYQzdsQzluZnZTTllJRzJMeWxBMVdlY3NLaU9NMTB5d1g0eDE5?=
 =?utf-8?B?NXY1OXlPbVJvL3F2Slc0dFd6dmRlU20wWmlndEo2eUd1SU1KVC9keXJMc2hT?=
 =?utf-8?B?V0o1Q0VuWXRJWjJjcmpIekhUeFVQTmthMVdvdUUxbllTYnBIWEtNdjBoZjdv?=
 =?utf-8?B?SWZhaEFnM3A5eHhKeUFFQkVNVjVKVDQwVUl1L05sZHRmWFY2Z0RZMTZMU2RI?=
 =?utf-8?B?cFJwTTlPcDFYVmpoRkRRb0VQVDlxeDZSUDdFRHgxUUMwMHp0UVM5Zzh2QzFC?=
 =?utf-8?B?ZzczcDd5bjh4V0dYZEhiTitrUmhuR25qak9GbUdqeHF1R0tyMEdud1hmMXZr?=
 =?utf-8?B?VGNabkkwV2FEckk4SExRS2FQNGZ2cjJLemlCeXY2Q2JTWVFJUys3YVdLYkRL?=
 =?utf-8?B?UzF1TnBKK1VoS1JpMmxTcEFKSzYzSXY1bnF5bFlyYyt4WjNsNkFmZ0RRM0lW?=
 =?utf-8?B?R2lsa3BkTjR0M252Nms1ZlBNYTB6azVmT2EzbWlacTZudUZCK0VNLytyMDNO?=
 =?utf-8?B?b25wNnl6UmlQY01oOUt2WjdsOUVKNG52YjFtUEFmTDVJOXczODNzaEw5dkhR?=
 =?utf-8?B?RkIySWpYRlhORGlpSDVTNllrYjIrVUZIdEFXSDRFQ3E2a0I0eUpkZngxcFY5?=
 =?utf-8?B?UUFXRjgydEdWR2xwZU9RcmJUODUxQ0szMEdmZnc5QWMzajZEUVFnZGhBUm5Q?=
 =?utf-8?B?aHMxa2pETjRtaWVrYlRWWHV0bGxBRzR5Y3FuZTBuc3hZSm9UV2RMKzhIYVR0?=
 =?utf-8?B?SVJ2K00rNldCMnV3RkpmUzdKYmpWVHlVV0d4cG9EQW81WVNDejlnQkxEODhm?=
 =?utf-8?B?WUxvcWxjdzZ1NGdYMHltOU96SHZFZXFQdkVFNGtvSUVTZjBlVDBHSkJyLzhk?=
 =?utf-8?B?cHBsTnA0T2JhMnF0WHZOaXoxREZBM1BTaHJ5VENsWjZiSThZUFZwTHBvdFlM?=
 =?utf-8?Q?DzOA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f8fa64f-e7b1-42d5-6b9d-08ddf40adde3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2025 03:49:26.5413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLMQU4kU/Kqbni3G2ejM+sFqh/Er7nWZWkJJK+RciiYbwp+OzxzPDvg4hV/h2emQau7Q/qSZlB+kxsdlmCs06Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDgsIDIw
MjUgNjowMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNvbT47IHhlbi0NCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAxLzhdIHhlbi9j
cHVmcmVxOiBlbWJlZCBod3AgaW50byBzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3l7fQ0KPg0KPiAocmUt
YWRkaW5nIHRoZSBsaXN0KQ0KPg0KPiBPbiAwNS4wOS4yMDI1IDA2OjU4LCBQZW5ueSwgWmhlbmcg
d3JvdGU6DQo+ID4gW1B1YmxpY10NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IFNlbnQ6
IFRodXJzZGF5LCBTZXB0ZW1iZXIgNCwgMjAyNSA3OjUxIFBNDQo+ID4+IFRvOiBQZW5ueSwgWmhl
bmcgPHBlbm55LnpoZW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNvbg0KPiA+PiA8SmFzb24uQW5k
cnl1a0BhbWQuY29tPg0KPiA+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djkgMS84XSB4ZW4vY3B1ZnJlcTogZW1iZWQgaHdwIGludG8gc3RydWN0DQo+ID4+IGNwdWZyZXFf
cG9saWN5e30NCj4gPj4NCj4gPj4gT24gMDQuMDkuMjAyNSAwODozNSwgUGVubnkgWmhlbmcgd3Jv
dGU6DQo+ID4+PiBGb3IgY3B1cyBzaGFyaW5nIG9uZSBjcHVmcmVxIGRvbWFpbiwgY3B1ZnJlcV9k
cml2ZXIuaW5pdCgpIGlzIG9ubHkNCj4gPj4+IGludm9rZWQgb24gdGhlIGZpcnN0Y3B1LCBzbyBj
dXJyZW50IHBlci1DUFUgaHdwIGRyaXZlciBkYXRhIHN0cnVjdA0KPiA+Pj4gaHdwX2Rydl9kYXRh
e30gYWN0dWFsbHkgZmFpbHMgdG8gYmUgYWxsb2NhdGVkIGZvciBjcHVzIG90aGVyIHRoYW4NCj4g
Pj4+IHRoZSBmaXJzdCBvbmUuIFRoZXJlIGlzIG5vIG5lZWQgdG8gbWFrZSBpdCBwZXItQ1BVLg0K
PiA+Pj4gV2UgZW1iZWQgc3RydWN0IGh3cF9kcnZfZGF0YXt9IGludG8gc3RydWN0IGNwdWZyZXFf
cG9saWN5e30sIHRoZW4NCj4gPj4+IGNwdXMgY291bGQgc2hhcmUgdGhlIGh3cCBkcml2ZXIgZGF0
YSBhbGxvY2F0ZWQgZm9yIHRoZSBmaXJzdGNwdSwNCj4gPj4+IGxpa2UgdGhlIHdheSB0aGV5IHNo
YXJlIHN0cnVjdCBjcHVmcmVxX3BvbGljeXt9LiBXZSBhbHNvIG1ha2UgaXQgYQ0KPiA+Pj4gdW5p
b24sIHdpdGggImh3cCIsIGFuZCBsYXRlciAiYW1kLWNwcGMiIGFzIGEgc3ViLXN0cnVjdC4NCj4g
Pj4NCj4gPj4gQW5kIEFDUEksIGFzIHBlciBteSBwYXRjaCAod2hpY2ggdGhlbiB3aWxsIG5lZWQg
cmUtYmFzaW5nKS4NCj4gPj4NCj4gPj4+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+Pg0KPiA+PiBOb3QgcXVpdGUsIHRoaXMgcmVhbGx5IGlzIFJlcG9y
dGVkLWJ5OiBhcyBpdCdzIGEgYnVnIHlvdSBmaXgsIGFuZCBpbg0KPiA+PiB0dXJuIGl0IGFsc28g
d2FudHMgdG8gZ2FpbiBhIEZpeGVzOiB0YWcuIFRoaXMgYWxzbyB3aWxsIG5lZWQgYmFja3BvcnRp
bmcuDQo+ID4+DQo+ID4+IEl0IHdvdWxkIGFsc28gaGF2ZSBiZWVuIG5pY2UgaWYgeW91IGhhZCBD
Yy1lZCBKYXNvbiByaWdodCBhd2F5LA0KPiA+PiBzZWVpbmcgdGhhdCB0aGlzIGNvZGUgd2FzIGFs
bCB3cml0dGVuIGJ5IGhpbS4NCj4gPj4NCj4gPj4+IEBAIC0yNTksNyArMjU4LDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBod3BfY3B1ZnJlcV90YXJnZXQoc3RydWN0DQo+ID4+IGNwdWZyZXFfcG9s
aWN5ICpwb2xpY3ksDQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IHJlbGF0aW9uKSAgew0KPiA+Pj4gICAgICB1bnNpZ25lZCBpbnQgY3B1
ID0gcG9saWN5LT5jcHU7DQo+ID4+PiAtICAgIHN0cnVjdCBod3BfZHJ2X2RhdGEgKmRhdGEgPSBw
ZXJfY3B1KGh3cF9kcnZfZGF0YSwgY3B1KTsNCj4gPj4+ICsgICAgc3RydWN0IGh3cF9kcnZfZGF0
YSAqZGF0YSA9IHBvbGljeS0+dS5od3A7DQo+ID4+PiAgICAgIC8qIFplcm8gZXZlcnl0aGluZyB0
byBlbnN1cmUgcmVzZXJ2ZWQgYml0cyBhcmUgemVyby4uLiAqLw0KPiA+Pj4gICAgICB1bmlvbiBo
d3BfcmVxdWVzdCBod3BfcmVxID0geyAucmF3ID0gMCB9Ow0KPiA+Pg0KPiA+PiBGdXJ0aGVyIGRv
d24gaW4gdGhpcyBzYW1lIGZ1bmN0aW9uIHdlIGhhdmUNCj4gPj4NCj4gPj4gICAgIG9uX3NlbGVj
dGVkX2NwdXMoY3B1bWFza19vZihjcHUpLCBod3Bfd3JpdGVfcmVxdWVzdCwgcG9saWN5LCAxKTsN
Cj4gPj4NCj4gPj4gVGhhdCdzIHNpbWlsYXJseSBwcm9ibGVtYXRpYyB3aGVuIHRoZSBDUFUgZGVu
b3RlZCBieSBwb2xpY3ktPmNwdQ0KPiA+PiBpc24ndCBvbmxpbmUgYW55bW9yZS4gKEl0J3Mgbm90
IHF1aXRlIGNsZWFyIHdoZXRoZXIgYWxsIHJlbGF0ZWQNCj4gPj4gaXNzdWVzIHdvdWxkIHdhbnQg
Zml4aW5nIHRvZ2V0aGVyLCBvciBpbiBtdWx0aXBsZSBwYXRjaGVzLikNCj4gPg0KPiA+IENoZWNr
aW5nIHRoZSBsb2dpYyBpbiBjcHVmcmVxX2RlbF9jcHUoKSwgb25jZSBhbnkgcHJvY2Vzc29yIGlu
IHRoZQ0KPiA+IGRvbWFpbiBnZXRzIG9mZmxpbmUsIHRoZSBnb3Zlcm5vciB3aWxsIHN0b3AuDQo+
DQo+IFlldCB3aXRoIEhXUCBhbmQgQ1BQQyBkcml2ZXJzIGJlaW5nIGdvdmVybm9yLWxlc3MsIGhv
dyB3b3VsZCB0aGF0IG1hdHRlcj8NCj4NCj4gPiBUaGF0IGlzIHRvIHNheSwgb25seSBhbGwgcHJv
Y2Vzc29ycyBpbiB0aGUgZG9tYWluIGFyZSBvbmxpbmUsIGNwdWZyZXEgZHJpdmVyIGNvdWxkDQo+
IHN0aWxsIGJlIGVmZmVjdGl2ZS4gV2hpY2ggaXMgYWxzbyBjb21wbGllcyB0byB0aGUgZGVzY3Jp
cHRpb24gaW4gX1BTRCBBQ1BJIFNQRUMNCj4gZm9yICJOdW0gUHJvY2Vzc29ycyIgWzFdOg0KPiA+
IGBgYA0KPiA+IFRoZSBudW1iZXIgb2YgcHJvY2Vzc29ycyBiZWxvbmdpbmcgdG8gdGhlIGRvbWFp
biBmb3IgdGhpcyBsb2dpY2FsIHByb2Nlc3NvcuKAmXMNCj4gUC1zdGF0ZXMuIE9TUE0gd2lsbCBu
b3Qgc3RhcnQgcGVyZm9ybWluZyBwb3dlciBzdGF0ZSB0cmFuc2l0aW9ucyB0byBhIHBhcnRpY3Vs
YXIgUC0NCj4gc3RhdGUgdW50aWwgdGhpcyBudW1iZXIgb2YgcHJvY2Vzc29ycyBiZWxvbmdpbmcg
dG8gdGhlIHNhbWUgZG9tYWluIGhhdmUgYmVlbg0KPiBkZXRlY3RlZCBhbmQgc3RhcnRlZC4NCj4g
PiBgYGANCj4gPiBbMV0NCj4gPiBodHRwczovL3VlZmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1By
b2Nlc3Nvcl9Db25maWd1cmF0aW9uX2FuZF9Db250cm9sDQo+ID4gLmh0bWw/aGlnaGxpZ2h0PWNw
cGMjcHN0YXRlZGVwZW5kZW5jeS1wYWNrYWdlLXZhbHVlcw0KPiA+DQo+ID4gSSBrbm93IHRoYXQg
QU1EIENQUEMgaXMgb2JleWluZyB0aGUgX1BTRCBkZXBlbmRlbmN5IHJlbGF0aW9uIHRvbywgZXZl
biBpZg0KPiBib3RoIENQUEMgUmVxdWVzdCByZWdpc3RlciAoY2NkWzE1OjBdX2x0aHJlZTBfY29y
ZVs3OjBdX3RocmVhZFsxOjBdOw0KPiBNU1JDMDAxXzAyQjMpIGFuZCBDUFBDIENhcGFiaWxpdHkg
UmVnaXN0ZXINCj4gKF9jY2RbMTU6MF1fbHRocmVlMF9jb3JlWzc6MF1fdGhyZWFkWzE6MF07IE1T
UkMwMDFfMDJCMCkgaXMgUGVyLXRocmVhZCBNU1IuDQo+ID4gSSBkb24ndCBoYXZlIHRoZSBoYXJk
d2FyZSB0byB0ZXN0ICJzaGFyaW5nIiBsb2dpYy4gQWxsIG15IHBsYXRmb3JtIHNheXMNCj4gIkhX
X0FMTCIgaW4gX1BTRC4NCj4NCj4gQWl1aSB0aGF0J3Mgbm90IG1hbmRhdGVkIGJ5IHRoZSBDUFUg
c3BlYywgdGhvdWdoLiBQbHVzIEhXX0FMTCBzdGlsbCBkb2Vzbid0IHNheQ0KPiBhbnl0aGluZyBh
Ym91dCB0aGUgc2NvcGUvc2l6ZSBvZiBlYWNoIGRvbWFpbi4NCj4NCg0KU29ycnkgZm9yIHRoZSBs
YXRlIHJlcGx5Lg0KSSBoYXZlIGRpc2N1c3NlZCB0aGlzIHdpdGggaGFyZHdhcmUgdGVhbSBub3cs
IHRoZXkgc2FpZCB0aGF0IHdlIHNoYWxsIG5vdCBleHBlY3QgYW55IHZhbHVlIG90aGVyIHRoYW4g
IkhXX0FMTCIgZnJvbSBfUFNELCBpZiB3ZSBoYXZlIF9DUEMgdGFibGUsIGFrYSwgQ1BQQyBlbmFi
bGVkLiBNYXliZSBleGNlcHQgZm9yIHNvbWUgaW5pdGlhbCBpbXBsZW1lbnRhdGlvbnMsIHdoaWNo
IG1heSBvciBtYXkgaGF2ZSBub3QgcmVhY2hlZCBwcm9kdWN0IHJlbGVhc2UsIHRoaXMgbWF5IHN0
aWxsIG5lZWQgYSBmZXcgdGltZSB0byBsb29rIGZvciBjb25jbHVzaW9uDQpBbmQgaWYgaXQgaXMg
SFdfQUxMLCBpdCBtZWFucywgaW4gY29kZXMsIHdlIGFyZSBpbnZva2luZyBwZXItY3B1IGNwdWZy
ZXFfZHJpdmVyLmluaXQsIGFsbG9jYXRpbmcgcGVyLWNwdSBjb3B1ZnJlcV9wb2xpY3ksIGFuZCBl
dGMuIEluIEhXX0FMTCwgT1NQTSBjYW4gbWFrZSBkaWZmZXJlbnQgc3RhdGUgcmVxdWVzdHMgZm9y
IHByb2Nlc3NvcnMgaW4gdGhlIGRvbWFpbiwgd2hpbGUgaGFyZHdhcmUgZGV0ZXJtaW5lcyB0aGUg
cmVzdWx0aW5nIHN0YXRlIGZvciBhbGwgcHJvY2Vzc29ycyBpbiB0aGUgZG9tYWluLg0KDQo+DQoN
Cj4gSmFuDQo=

