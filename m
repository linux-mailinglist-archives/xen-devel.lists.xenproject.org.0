Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917CBADE381
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 08:16:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018791.1395649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRm4d-00050L-8X; Wed, 18 Jun 2025 06:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018791.1395649; Wed, 18 Jun 2025 06:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRm4d-0004ya-5u; Wed, 18 Jun 2025 06:15:03 +0000
Received: by outflank-mailman (input) for mailman id 1018791;
 Wed, 18 Jun 2025 06:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fj07=ZB=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uRm4b-0004yU-10
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 06:15:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c6b7800-4c0b-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 08:14:54 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.35; Wed, 18 Jun 2025 06:14:51 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 06:14:50 +0000
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
X-Inumbo-ID: 8c6b7800-4c0b-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSbjTn5g9qD/y7MMFoNLEQ9lebyxJUh+A7joHv/yrEfPlJZWMBWvpvqaYUOo+posQYCuuxs2vMHKUqN3ShO0LXjqtfv0GkpEYXtDU1UCbQuzeQKcYW5+QuD0G35lD8KhE5w5dB32oXZRBqzM4k5JEaWaCppC1NtTSmoCiqZZ0CPxGbu95meKxIRKBDTdgVtcQZArC7mnVSkWvlryJUmYuWbiSo5Xe891eD+9exKFtKV8vT7x8ITSO4h/xXAOIeEeUW3CYEpMuKjiKu4uDXzqVnBWkT6J16PffQYMisVCrgLE/PCDtH3p5Ys8KT7w/nj/smJsL//7dF0BJk3orsSg8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nWrf/BkyrVp/Xubv+mTIZwVfT3na+aymVVlKwCzzgg=;
 b=nQ/Ihezg93PW19Kv46pqejUqIS7TjssAy3wezunRXIgnq1AVW7jXfZPHoZLjWY9QTMp/BShnB6yWypWRpCPnVnrIJiKwhcYwZp/ve7vuRB6uGsWMXy4yAQC5LzrpNMggzov6Sozj5Yv0HRhRuVhVwl24xYFJqIxDVHehzb0R+oChHLGpNU+nAGeTzMJ4VCMtGKXGm5h62zfVm9DZJdOwNbelhagdJiqfLFnECVTkwVW422ixuZQru0vpFLZozPdq014itL28b3+UwJlp/tFnLdGcoeOVWUzIvIhkSwvmV6GdEGN6Wfkysiu8ZDu9lPTZt0mHA2sf5ycSOArCjc97EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nWrf/BkyrVp/Xubv+mTIZwVfT3na+aymVVlKwCzzgg=;
 b=3YljeYv9uX+Xcq1KEbTzmqrVQD0k806w+GPHKizbDqElW6qPBPRnA/0bhtWDanGltDKl2hG9Vp/Rd4OERKzUKnKmdhqKsh5b8wL7v6K7U4l/pBYK0usz2zBqilN1i9RdiJgSqz11FKT9QVYzKnVoqdjF3MnOC1mhJn9l7iCt3qM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 00/18] amd-cppc CPU Performance Scaling Driver
Thread-Topic: [PATCH v5 00/18] amd-cppc CPU Performance Scaling Driver
Thread-Index: AQHbzuQ5QS9t68DsIkSY3rIqCe+mtLQHSw6AgAEwUfA=
Date: Wed, 18 Jun 2025 06:14:50 +0000
Message-ID:
 <DM4PR12MB84518F4F291AA227F0E3D38EE172A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <e5048b21-b1c6-447b-824b-9be7a6909948@suse.com>
In-Reply-To: <e5048b21-b1c6-447b-824b-9be7a6909948@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-18T06:14:33.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS2PR12MB9589:EE_
x-ms-office365-filtering-correlation-id: 06f37197-973c-4c86-94f0-08ddae2f6f16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZFJpZUhUZVYxZXQvVU5PRmRMVERPS3o0L083WWhFeXIxZTAwR2IzM3dzQk90?=
 =?utf-8?B?RW9uNnpaUnRJdUl0bGgzYllab0ppQnI1Y2F0ekNub2EyTjcxbldCVHpacWtK?=
 =?utf-8?B?T1c5ZEg0WWgra1crOXlDUXlxWjUwenpXOWw2SnpzQjhHSEF2RzI3VkVwL2lO?=
 =?utf-8?B?bjNrSisxdmFQZFNhZytHMGVNT0RVVWpLdllGVHVPZnVjOFBiRXZUL1RXckNs?=
 =?utf-8?B?TFJwa3pHUng0VGhOYkFCc2tvMHF2U1dNZ1JRVFVhQmF0TzU0WXRTandTeUUx?=
 =?utf-8?B?WE1rbzE3cnd2SWZETDBiYU9saVdYRzV2K3JCOWpIaXN5Yng1d1ZRVUxvWG53?=
 =?utf-8?B?U0pKNTJSWFlONFNvZ1g0QXpCMkIxcDhBVzJKdmJSclNWelQvQzJYcWZWeXFY?=
 =?utf-8?B?YjBnMTVXc0pLL1NuRGhEbEFIcUk5anZjYVpRNS96MHNTY0hSTW5rSzE0WVhO?=
 =?utf-8?B?NWl6M2VTUmNRN2pWNE1tSVZlYks3WGtWUi9tcDNVaGpoZVF4ay9wWjZGMGdV?=
 =?utf-8?B?T0U0cVhRMWhLaXZxd2hQL3puNXlhVnJFaDhSQVdXZHlMWkZ1MS81WlRSdnZ2?=
 =?utf-8?B?NVJCUFpEN3RPT3V0eFBHYnFNZTdyenlwZHkybE9NVTlRSUJ4QTgwbWlxMUhu?=
 =?utf-8?B?THdFdU95NHRKWXo0eExwNDBrWmtBYUhmdnpTdURBSXBqbVUybkpLMmV1ZmM1?=
 =?utf-8?B?WjhPTWZHZlQ2aXdxbnZZRG1zZDk2TGc5dUFTY3JRK1ZCb1AyNjZzMEU3aUd5?=
 =?utf-8?B?TzAvR1I0dnd0YmNLZjNaUEVsWTRrTGE1M05OanZMamNqdVV3TldMQnFJcmlP?=
 =?utf-8?B?bU5NZGVYN3BzUXM2YSszbHJ2TjkyOGFqNWNKNnB1UnlTK1drVmU3bzlXbW1y?=
 =?utf-8?B?NkV2MWgrSnlndytOZ001a3dmUmFZV1FMRVhXWmVJSldFa3I4Um0zRVdtc3NM?=
 =?utf-8?B?eTVkTTl3akpMclNmM3M4L2V5djZFa3lxZ2pHZTcwdDFQRkVjUWhXUFQzTC8r?=
 =?utf-8?B?RG56anViaDhHU0VxRU5pM2R1VHJRTC9zWkloWTlYQ2RBdWtuaHVQYmFZOW5k?=
 =?utf-8?B?T2Q3T2IrMHpiaUVOUEF6MXFLQ214Y2xmZ0graUJHdHpSQ2pCalBIano5Y3lE?=
 =?utf-8?B?RHJ1Z3c5bndPc3dhZHJ5cXlONTVLMFQ5WjJFanZtd01wZE1jTVQrVFpmMlZr?=
 =?utf-8?B?dmtVZmhoU0p3ZUg2dUxuTFFpUlFQbGxOTEJyeGhWaDFGZTcxakF5MHFjWVlD?=
 =?utf-8?B?V29OK1NIcVZ3ZjNWOVpLQmxvNnJrbm5XNE1wdndqMXRzekNxUldNYXUzQmUz?=
 =?utf-8?B?UEpocDJoSXBqbks1U3JXOWE0SXQ3eEYzWHBYOWZwKzdrdWpmZ2FFRjRMNTJN?=
 =?utf-8?B?d2V0YUZqQ1dWVjVsQnJadkZ5N1FZMTM2SVpWclN0L0JzVzMzK3h4MEhrZThz?=
 =?utf-8?B?MUlrOWVTT1pRbnl4a1AzL0pCamFKUGp2d0hoTUlVSm1JbmtYQWhGVDRNUThL?=
 =?utf-8?B?R2M0YitzaHQyVjJpY01ZaUMvVkZuZmFBM3I1NkZWM3NxSTJRNzZJZmRidWJJ?=
 =?utf-8?B?bzBSRDZybjFBZFE2R0ZsaEd4dEJOd1dkUTJtSm4rSzl2bmxjTC9xQ29YdjJE?=
 =?utf-8?B?V0llQUZSOWJEdWlxd3FzQU5GbVdic2ZGQzR4cDdXTzQrZkZzWFFpaTZxQ1cz?=
 =?utf-8?B?Qllqd2drL3hHL1RXbENPTVF2UzUzZVBkYjdkZkQreEl4ZzVhck1IQ3QzYjFX?=
 =?utf-8?B?NXBmaHFycGo1elZUb0h4c2RlR2d6V0o1SDVaQjJnNFErdHYyV1QwMUdZYjZX?=
 =?utf-8?B?U1FHSTU3WVVOdXVqa2t5aTZZOW1maytrVDZZb2JTc2dxSklpRnVZV1g1TDJD?=
 =?utf-8?B?ZDZSRCs2ZUpseUpUUTZGMWp0MWVzNmdlRk8yYkFDMWNLYVl2VFIvdnZKUDFh?=
 =?utf-8?B?OHBTUGZ5c2Q3MEpvc1IybmNpQmtIMk14U0lpMERyeW9LRjA2S2RjVlVTMEN4?=
 =?utf-8?Q?bl+0605ZJYUCvUKb77+/IBbkptAwX4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ri9Pb21XdlZDU2Mya2x4THNRbWtoQisvS1pIVG95UzVPVzU4RjZNSWxFQ041?=
 =?utf-8?B?eUh6bngzT3paYVZFSE4wekxNcWxTNW1RYVBEV2FFSnRWTkxBRE5KUlcwMkdi?=
 =?utf-8?B?Q3lubnJNdmpNUmFrYUhoSERuREhsSnV3dDRiMzhsL2ZlUm9aYWd4MlB2Uk0v?=
 =?utf-8?B?Qk0yQ1dxM3g1Rk1jOWpEb2xhQmdKZlBuOWFtWTZLNEZtRUVCRWFXNzU5VEN0?=
 =?utf-8?B?OHJ3TzhZRmpQbG9qT1NKcXJzeHltc1JVWmtOZFF6YXd2RkRXU3Z4SFQ4UDMx?=
 =?utf-8?B?UnYzRDJRS25rWlVJRnRMNlUvTXd3ckdETkY3M2todlFGOHNpMTlhOXM1NEQv?=
 =?utf-8?B?SjdDMHJ0YmRCTTA5RWh1NEhHWmNqdm52REZ1dHlLM0NKTW1uWHhITm5ETmND?=
 =?utf-8?B?emxhZjdHNmhoSGhFZkxlZC9hTkpxVmlHanVVV2h5Q2F6NnRzaFRhWFdoSFJr?=
 =?utf-8?B?aGEyb1dpRzJBQ24rbXdGdUY2NnZvSXRkWllTczNWVmJ4RnZXb285N2pIWmh6?=
 =?utf-8?B?NFdvajEwbWpKWC9MYzhrZ0VDMkNLVUVPZFdPMGNhWm40dExsd3hRcVYwaEdZ?=
 =?utf-8?B?QnZEZ0hYTTRONlZYcnN5ZGp3TXc5aS9IUmc5eDgyVGJHL1NPNVIxT05mUGxX?=
 =?utf-8?B?Y1NpYWNhb0dickgxQ3lMV3F0Q1lHQ25JYUhTUlRzWSszTlFvT0V1TEZvMU1P?=
 =?utf-8?B?TnYyaHErMjdIZ1BQUXFQWkd4RkVRUlZ2THlNRGVBWkI5RDI4Wll2UUYvRVVL?=
 =?utf-8?B?TXFlNk8vZUxxU3JKek5uMWRid0IycjE4cGNBc1FTZWxWMnYxV1J2bWtRcjZZ?=
 =?utf-8?B?SVNhZFNnZjUrSHh3Z0cvaHZrSENOVDZkZG5UUDZOUFNGNm5JdHQ0TlZMUC9n?=
 =?utf-8?B?TWpHWFMvRnRDRHhyYVBEL1FUTzNaaGhYbnBwMUtBU0k4bEhiemNQTk5uZWZV?=
 =?utf-8?B?QUJTeS9OYkV0QUljNjZlSkxKVVBJYmZ4WG95Wmh2dW55b0RuSktVMTdvelFP?=
 =?utf-8?B?VUdZcWFWSGdERk83Y1Zkd1BNZEQ1Q0xVRkxPWS9yd0ltRld2ODFjaW1oakdR?=
 =?utf-8?B?UXhmUTdRc1BOaW55Tkx2ZWFRUnhiU0EvZW1TWVVqbE1uQzEzdXdsWWVNYUY0?=
 =?utf-8?B?cjE2bXd3M2dHb2I1UlFMbURudENzY1VuYUZsd3ZUSDJIYXoxbDA1RmFTdWpz?=
 =?utf-8?B?Qk8xcVlVMVJ5aWs0bjlTN1RmZEg3REdXckZ4WE5JOVlBbEpmVlc0czUzQ3BS?=
 =?utf-8?B?ZENZRiszb0pSR1BLV1RIbmlkbjgrK2JYRWQwaENaT0xTN0x3ODJURWNGZGlp?=
 =?utf-8?B?MDN6VFpyRXhUUi9hRFpKdDV1WnJCZmNBOGNEelZldHZHQWJuSXpZNFlvYVFT?=
 =?utf-8?B?MVJOclR3SFFFRzdvdXZEeTIyM2xLSS90dC9JcnNuMlowNG0vSkRjZkZSS2VN?=
 =?utf-8?B?eW9JVngwZzZ1cmRBV0VYR3NGOUsybFBPQ1dDYXVuenR1ZjdOTTRrNTZMS25p?=
 =?utf-8?B?cWpLMWxwU3lWWFh1ZXRJdGIreWV0SXlMWlZ3QjZlMnhQRWwrNytWZHpualNF?=
 =?utf-8?B?SXc0a1ZGeCtkY0dpbmlES3NEb0hUeEZKSDlKQnMrSjFrNzIrWjlqeWlsQWxF?=
 =?utf-8?B?R3k1NjR6VkQ0MVRPK1BKQUtXeGNXeXpNZHdZMXlCNmt1STdCYm9kZzF5SExE?=
 =?utf-8?B?NllYekRqMnBkN0RkQU82ZDY3aytLSDE3RGFwU05LdTl0ZlU1WWM4NU9GTGNJ?=
 =?utf-8?B?WW5vZ1FEQ3R1R2Rtb1daUysydnpVWW8yOGVCUi9UY0xuMVNCcFd0TnVPNXlu?=
 =?utf-8?B?dERURHhLNzhZSWw1ekJDakdEb2luN3ZMc0RHVlYzTG1XY3ZFWlB0VXcxNjFV?=
 =?utf-8?B?SUtOY3JvVWU5THdqTVdwcXNHL1hhcnpCVjhzQ1lxYkpmSDVGbWdqc3BtYWNX?=
 =?utf-8?B?Rm53NWsvNEN6Qks0MFJVYUhkRng3cWxtalFtWGJoTTV6bjZoTVJ0d25qaklI?=
 =?utf-8?B?OHR4ZndJVUNhTUdGSEJRMkoyTXBHT0hEOUk3QkpsTDdtcjV5b0RmY24wVGoz?=
 =?utf-8?B?ZjFrZGlvZm80Z015TlIrVW5uU0paNExJOGpUd2lyVVFTczc0dis0VEJQeDhj?=
 =?utf-8?Q?sclY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f37197-973c-4c86-94f0-08ddae2f6f16
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 06:14:50.6609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uy0p/FYjuRuKOaF0GwhCnahHT1+LT1580uzfabvzjcs5wbR6vhVHxpI866KiH43OHRShJs5QW9cQ0aQfcK4BtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUg
Njo0MiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzog
SHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPjsgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IE9yemVs
LCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5A
eGVuLm9yZz47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMC8xOF0gYW1kLWNwcGMgQ1BV
IFBlcmZvcm1hbmNlIFNjYWxpbmcgRHJpdmVyDQo+DQo+IE9uIDI3LjA1LjIwMjUgMTA6NDgsIFBl
bm55IFpoZW5nIHdyb3RlOg0KPiA+IGFtZC1jcHBjIGlzIHRoZSBBTUQgQ1BVIHBlcmZvcm1hbmNl
IHNjYWxpbmcgZHJpdmVyIHRoYXQgaW50cm9kdWNlcyBhDQo+ID4gbmV3IENQVSBmcmVxdWVuY3kg
Y29udHJvbCBtZWNoYW5pc20gb24gbW9kZXJuIEFNRCBBUFUgYW5kIENQVSBzZXJpZXMNCj4gPiBp
biBYZW4uIFRoZSBuZXcgbWVjaGFuaXNtIGlzIGJhc2VkIG9uIENvbGxhYm9yYXRpdmUgUHJvY2Vz
c29yDQo+ID4gUGVyZm9ybWFuY2UgQ29udHJvbCAoQ1BQQykgd2hpY2ggcHJvdmlkZXMgZmluZXIg
Z3JhaW4gZnJlcXVlbmN5DQo+ID4gbWFuYWdlbWVudCB0aGFuIGxlZ2FjeSBBQ1BJIGhhcmR3YXJl
IFAtU3RhdGVzLiBDdXJyZW50IEFNRCBDUFUvQVBVDQo+ID4gcGxhdGZvcm1zIGFyZSB1c2luZyB0
aGUgQUNQSSBQLXN0YXRlcyBkcml2ZXIgdG8gbWFuYWdlIENQVSBmcmVxdWVuY3kNCj4gPiBhbmQg
Y2xvY2tzIHdpdGggc3dpdGNoaW5nIG9ubHkgaW4gMyBQLXN0YXRlcy4gQ1BQQyByZXBsYWNlcyB0
aGUgQUNQSQ0KPiA+IFAtc3RhdGVzIGNvbnRyb2xzIGFuZCBhbGxvd3MgYSBmbGV4aWJsZSwgbG93
LWxhdGVuY3kgaW50ZXJmYWNlIGZvciBYZW4NCj4gPiB0byBkaXJlY3RseSBjb21tdW5pY2F0ZSB0
aGUgcGVyZm9ybWFuY2UgaGludHMgdG8gaGFyZHdhcmUuDQo+ID4NCj4gPiBhbWRfY3BwYyBkcml2
ZXIgaGFzIDIgb3BlcmF0aW9uIG1vZGVzOiBhdXRvbm9tb3VzIChhY3RpdmUpIG1vZGUsIGFuZA0K
PiA+IG5vbi1hdXRvbm9tb3VzIChwYXNzaXZlKSBtb2RlLiBXZSByZWdpc3RlciBkaWZmZXJlbnQg
Q1BVRnJlcSBkcml2ZXINCj4gPiBmb3IgZGlmZmVyZW50IG1vZGVzLCAiYW1kLWNwcGMiIGZvciBw
YXNzaXZlIG1vZGUgYW5kICJhbWQtY3BwYy1lcHAiDQo+ID4gZm9yIGFjdGl2ZSBtb2RlLg0KPiA+
DQo+ID4gVGhlIHBhc3NpdmUgbW9kZSBsZXZlcmFnZXMgY29tbW9uIGdvdmVybm9ycyBzdWNoIGFz
ICpvbmRlbWFuZCosDQo+ID4gKnBlcmZvcm1hbmNlKiwgZXRjLCB0byBtYW5hZ2UgdGhlIHBlcmZv
cm1hbmNlIHR1bmluZy4gV2hpbGUgdGhlIGFjdGl2ZQ0KPiA+IG1vZGUgdXNlcyBlcHAgdG8gcHJv
dmlkZXMgYSBoaW50IHRvIHRoZSBoYXJkd2FyZSBpZiBzb2Z0d2FyZSB3YW50cyB0bw0KPiA+IGJp
YXMgdG93YXJkIHBlcmZvcm1hbmNlICgweDApIG9yIGVuZXJneSBlZmZpY2llbmN5ICgweGZmKS4g
Q1BQQyBwb3dlcg0KPiA+IGFsZ29yaXRobSBpbiBoYXJkd2FyZSB3aWxsIGF1dG9tYXRpY2FsbHkg
Y2FsY3VsYXRlIHRoZSBydW50aW1lDQo+ID4gd29ya2xvYWQgYW5kIGFkanVzdCB0aGUgcmVhbHRp
bWUgY3B1IGNvcmVzIGZyZXF1ZW5jeSBhY2NvcmRpbmcgdG8gdGhlDQo+ID4gcG93ZXIgc3VwcGx5
IGFuZCB0aGVybWFsLCBjb3JlIHZvbHRhZ2UgYW5kIHNvbWUgb3RoZXIgaGFyZHdhcmUgY29uZGl0
aW9ucy4NCj4gPg0KPiA+IGFtZC1jcHBjIGlzIGVuYWJsZWQgb24gcGFzc2l2ZSBtb2RlIHdpdGgg
YSB0b3AtbGV2ZWwNCj4gPiBgY3B1ZnJlcT1hbWQtY3BwY2Agb3B0aW9uLCB3aGlsZSB1c2VycyBh
ZGQgZXh0cmEgYGFjdGl2ZWAgZmxhZyB0byBzZWxlY3QgYWN0aXZlDQo+IG1vZGUuDQo+ID4NCj4g
PiBXaXRoIGBjcHVmcmVxPWFtZC1jcHBjLGFjdGl2ZWAsIHdlIGRpZCBhIDYwcyBzYW1wbGluZyB0
ZXN0IHRvIHNlZSB0aGUNCj4gPiBDUFUgZnJlcXVlbmN5IGNoYW5nZSwgdGhyb3VnaCB0d2Vha2lu
ZyB0aGUgZW5lcmd5X3BlcmYgcHJlZmVyZW5jZSBmcm9tDQo+ID4gYHhlbnBtIHNldC1jcHVmcmVx
LWNwcGMgcG93ZXJzYXZlYCB0byBgeGVucG0gc2V0LWNwdWZyZXEtY3BwYyBwZXJmb3JtYW5jZWAu
DQo+ID4gVGhlIG91dHB1dHMgYXJlIGFzIGZvbGxvd3M6DQo+ID4gYGBgDQo+ID4gU2V0dGluZyBD
UFUgaW4gcG93ZXJzYXZlIG1vZGUNCj4gPiBTYW1wbGluZyBhbmQgT3V0cHV0czoNCj4gPiAgIEF2
ZyBmcmVxICAgICAgNTgwMDAwIEtIeg0KPiA+ICAgQXZnIGZyZXEgICAgICA1ODAwMDAgS0h6DQo+
ID4gICBBdmcgZnJlcSAgICAgIDU4MDAwMCBLSHoNCj4gPiBTZXR0aW5nIENQVSBpbiBwZXJmb3Jt
YW5jZSBtb2RlDQo+ID4gU2FtcGxpbmcgYW5kIE91dHB1dHM6DQo+ID4gICBBdmcgZnJlcSAgICAg
IDQ2NDAwMDAgS0h6DQo+ID4gICBBdmcgZnJlcSAgICAgIDQyMjAwMDAgS0h6DQo+ID4gICBBdmcg
ZnJlcSAgICAgIDQ2NDAwMDAgS0h6DQo+ID4NCj4gPiBQZW5ueSBaaGVuZyAoMTgpOg0KPiA+ICAg
eGVuL2NwdWZyZXE6IGd1YXJkIHBlcmYuc3RhdGVzW10gYWNjZXNzIHdpdGggWEVOX1BYX0lOSVQN
Cj4gPiAgIHhlbi9jcHVmcmVxOiBtb3ZlICJpbml0IiBmbGFnIGludG8gY29tbW9uIHN0cnVjdHVy
ZQ0KPiA+ICAgeGVuL2NwdWZyZXE6IGV4dHJhY3QgX1BTRCBpbmZvIGZyb20gInN0cnVjdCB4ZW5f
cHJvY2Vzc29yX3BlcmZvcm1hbmNlIg0KPiA+ICAgeGVuL2NwdWZyZXE6IGludHJvZHVjZSBuZXcg
c3ViLWh5cGVyY2FsbCB0byBwcm9wYWdhdGUgQ1BQQyBkYXRhDQo+ID4gICB4ZW4vY3B1ZnJlcTog
cmVmYWN0b3IgY21kbGluZSAiY3B1ZnJlcT14eHgiDQo+ID4gICB4ZW4vY3B1ZnJlcTogaW50cm9k
dWNlICJjcHVmcmVxPWFtZC1jcHBjIiB4ZW4gY21kbGluZQ0KPiA+ICAgeGVuL2NwdWZyZXE6IGRp
c2FibGUgcHggc3RhdGlzdGljIGluZm8gaW4gYW1kLWNwcGMgbW9kZQ0KPiA+ICAgeGVuL2NwdTog
RXhwYW5kIGNvcmUgZnJlcXVlbmN5IGNhbGN1bGF0aW9uIGZvciBBTUQgRmFtaWx5IDFBaCBDUFVz
DQo+ID4gICB4ZW4vYW1kOiBpbnRyb2R1Y2UgYW1kX3Byb2Nlc3NfZnJlcSgpIHRvIGdldCBwcm9j
ZXNzb3IgZnJlcXVlbmN5DQo+ID4gICB4ZW4vY3B1ZnJlcTogaW50cm9kdWNlIGEgbmV3IGFtZCBj
cHBjIGRyaXZlciBmb3IgY3B1ZnJlcSBzY2FsaW5nDQo+ID4gICB4ZW4vY3B1ZnJlcTogaW1wbGVt
ZW50IEVQUCBzdXBwb3J0IGZvciB0aGUgYW1kLWNwcGMgZHJpdmVyIGluIGFjdGl2ZQ0KPiA+ICAg
ICBtb2RlDQo+ID4gICB4ZW4vY3B1ZnJlcTogZ2V0IHBlcmZvcm1hbmNlIHBvbGljeSBmcm9tIGdv
dmVybm9yIHNldCB2aWEgeGVucG0NCj4gPiAgIHhlbi9jcHVmcmVxOiBub3JtYWxpemUgaHdwIGRy
aXZlciBjaGVjayB3aXRoIGh3cF9hY3RpdmUoKQ0KPiA+ICAgeGVuL2NwdWZyZXE6IGludHJvZHVj
ZSBHRVRfQ1BVRlJFUV9DUFBDIHN1Yi1jbWQNCj4gPiAgIHhlbi9jcHVmcmVxOiBieXBhc3MgZ292
ZXJub3ItcmVsYXRlZCBwYXJhIGZvciBhbWQtY3BwYy1lcHANCj4gPiAgIHRvb2xzOiBkcm9wICJo
YXNfbnVtIiBjb25kaXRpb24gY2hlY2sgZm9yIGNwcGMgbW9kZQ0KPiA+ICAgdG9vbHM6IG9wdGlt
aXplIGNwdWZyZXEgYXZlcmFnZSBmcmVxIHByaW50DQo+ID4gICB4ZW4vY3B1ZnJlcTogQWRhcHQg
U0VUL0dFVF9DUFVGUkVRX0NQUEMgeGVuX3N5c2N0bF9wbV9vcCBmb3IgYW1kLQ0KPiBjcHBjDQo+
ID4gICAgIGRyaXZlcg0KPg0KPiBBcyBpbmRpY2F0ZWQgaW4gaW5kaXZpZHVhbCByZXBsaWVzLCB0
aHJlZSBvZiB0aGUgcGF0Y2hlcyBtYXkgYmUgcG9zc2libGUgdG8gZ28gaW4NCj4gYmVmb3JlIHlv
dSByZS1wb3N0LiBTdWJqZWN0IHRvIHdoYXQgSSBzYWlkIGluIHRoZSByZXBsaWVzIChwYXRjaGVz
IDAyLCAwOCwgYW5kIDEzKS4NCj4gUGxlYXNlIGNsYXJpZnkgd2hhdCAoaWYgYW55dGhpbmcpIHRv
IGRvLg0KPg0KDQpGb3IgcGF0Y2ggMDIsIHRoZSBvbmx5IGNvbmNlcm4gaXMgdGhhdCBpdCBpcyBi
YXNlZCBvbiAwMSwgYW5kIDAxIHNoYWxsIGJlIHJlbW92ZWQgYW5kIEknbGwgYWRkIGV4dHJhIGNo
ZWNrIGZvciBDUFBDIHRvIGVuc3VyZSAtPnBlcmYuc3RhdGVfY291bnQgbXVzdCBiZSB6ZXJvIGlu
IGdldF9jcHVmcmVxX3BhcmEoKQ0KRm9yIHBhdGNoIDA4LCBJIGFscmVhZHkgaGF2ZSBhZ3JlZWQg
aW4gaW5kaXZpZHVhbCByZXBseQ0KRm9yIHBhdGNoIDEzLCBvayBmb3IgbWUgdG9vDQoNCj4gSmFu
DQo=

