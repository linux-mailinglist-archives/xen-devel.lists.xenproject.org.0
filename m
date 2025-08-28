Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3DB39452
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:55:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097586.1451860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWXE-0000eO-4p; Thu, 28 Aug 2025 06:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097586.1451860; Thu, 28 Aug 2025 06:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWXE-0000cF-1r; Thu, 28 Aug 2025 06:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1097586;
 Thu, 28 Aug 2025 06:54:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urWXD-0000c9-2E
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:54:59 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2413::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e79f75ae-83db-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:54:56 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ2PR12MB8110.namprd12.prod.outlook.com (2603:10b6:a03:4fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 06:54:52 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 06:54:51 +0000
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
X-Inumbo-ID: e79f75ae-83db-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3hHZyj9wmVtUJzhYvYOpg6Rm6yok5lp4RBYMYH+SmqYJn0xua6iu4tE2SWA+z2pB5+UFXyJvs1JgmVVvOsq38ZcYg+/4jOn9MnO6KGRrqB/D0O0lec4He3EhWRCPRO/WwAC5YCuxUOvQRMLAV7Am0yRqF2/cYBn8MggTXS8B22fR/IyJZj/uJWmPBeuOdZ3n6JGNq1alhVJc2qpHBo9mfcxiq7BwJvFRwzeHr22eZTh4+S597kfxKVhIo0Q3mupdIkR4nEvViWn8Uf4MaQkzXt4Gy7x1EwnIAWr6MxkNIkDdQTSmIJBSccRf9ZBsC8hCkGdZc/TYPPrTwIOAWuNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5b2RcW5DPXDHKuYhkUTFxeAdka2rwDX+xN0phHlQ8c=;
 b=OTgSh7w6hyz8fjtS9M6Ea12P0ZzdVxgEmVU8inBtWmjyn1yljk8BRms95ik6txmPc2RIdWDu45yXgm0DfswE5sLxorFfyUakd0+sRoCg/TLkDMiwhGXmZmIp8r4/a85OstIBS0GAlIVDf3g8wb/MKOJ5pqJbwcoVQ+1ggJS112GgEKz1ylqKh/12gvZQR5qlAdm651gBHLmBsE+3Ssb5asDYqQ6M3Lr2emCieBYNrbxfZARXb0We8gDFPFC8wtP5MFeqDpemGTt4d3dUCv2jHJuNqRWLTEn5+pZimhvbQE7vc8mRVcBRYh9vn+iBT4n7DBL+M7SaJt0jdGhNRNuidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5b2RcW5DPXDHKuYhkUTFxeAdka2rwDX+xN0phHlQ8c=;
 b=UfrUi8JvSKp6c/37t9Xpzni1RlIojw5/6yqWXvP7ezbBCFif3k+wg4zkeya0x7CEifnbfjNPi5/aFCZQjFJ1cf7MoLwHPdhm4z+vLTM3/3OiE+m/p92+x0IC3mKX9WViMwX1xNcRGqANRzWTSXL9vDtc3Sjn/mIr8lV3eMiWetM=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Topic: [PATCH v7 13/13] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC
 xen_sysctl_pm_op for amd-cppc driver
Thread-Index: AQHcE1L0WO8OIJho60KGV8JFR/QspLRzjMCAgAJSvzCAAcXZgIAAAHmAgAACEFA=
Date: Thu, 28 Aug 2025 06:54:51 +0000
Message-ID:
 <DM4PR12MB8451BD022E0150D6D784CDBFE13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
 <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
 <DM4PR12MB8451CFF93199B96578D96F88E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
 <a877ad1b-1628-465b-9b38-dce347ba8ba1@suse.com>
 <fa8f951f-610c-484f-a9c4-9b76b8f399cc@suse.com>
In-Reply-To: <fa8f951f-610c-484f-a9c4-9b76b8f399cc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-28T06:54:36.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ2PR12MB8110:EE_
x-ms-office365-filtering-correlation-id: 3c53b950-8758-459f-e501-08dde5ffc99d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3hyZnZqRjA2RDlna29JL0lUb0lkTjN0UzcvVm1uakNQV1pTYWlRTENwb2VD?=
 =?utf-8?B?NU5PTVNjUlcwQkliT3ZsUVVzb0c5ZFE0WDBuTEZTNWZwbFZzbFE4S0FraTNC?=
 =?utf-8?B?Zm1CZjY3cXUrZmRoUFhzMlVqaEdTbS9HeW1hVDdRZ1Jhd2dPbUxvWXJ2ZnJp?=
 =?utf-8?B?YzY0SlB5ZWFYcXdLTTZBUjVzS2xXTTg4Um4vbHZaM1JUWnVLd0IwbXZ4cTZU?=
 =?utf-8?B?USs3NzJ2SGRjaVRGa0NFYi9tMXJVTTlDbGdsVjlGSk9HTkNPMk1pTnpvZ1Bn?=
 =?utf-8?B?WUJzUGtJZG56YXlVQVRNSXNIL0QrOWxxLy9paHpUcVBBOVRTeE53TlNpdXhZ?=
 =?utf-8?B?eUFyS2FVMjRsUk1JM3preGZDbFZpSE1OU1A1TTRvMm5IRWJ3Z3BUdEg1bVFy?=
 =?utf-8?B?cmxad0VRa2FBYTkwSU1JQmxmMjBBZWtmR1RIR3M2YjdHOExRUEgxdzVtcmRB?=
 =?utf-8?B?QitXdEEwcWFLdU50WFdkQmtRVWVJQTRYRzBaN3A4T0l6VFh5VHk0NU5ObVNB?=
 =?utf-8?B?Y1gxaGx6R2VIbUNDQ2pyR0RrU2hUSkZydEduVWMwSkpVb1ZuS1RENFIwSGZB?=
 =?utf-8?B?VVNyNkRGOW43YWhvNndBTFQvb0g3U0hlUTVrRDRyajAvTzU5ZVg3bkllb0Fj?=
 =?utf-8?B?MG92YVJYOG1tR09ZbjQ3RlJyWkR5bEwxc2pvSjVsTVBuVEdBYlRIQlNTVWVF?=
 =?utf-8?B?d1ZwVTNXbFR2VGwyNFdkRlVvVXZWNGU5Y2VhYzBObmdDSXZGcGlLTzJIRkxI?=
 =?utf-8?B?MENDUUJ1R2NKbHVRbXNzWUNkWFV4SG01VHlESGZCbG1EWlc3WW43eWV6NnNv?=
 =?utf-8?B?RitKN1Q3YWdBOEZ3clNCUUdNcDhpK1JhMy9rbi9YRXNUVmhJMXJzWmJvbW15?=
 =?utf-8?B?RkxublBoSnV0L1lpOVpyZGFTTm1xOGdSL1dpQjRCRzFtWW4rZGtYVlUrOFEz?=
 =?utf-8?B?cisxbzdBUkFuQkxWS2N6VWZyZ2VMYjFPK21XYnYyTnZSMHRLdWZIODBzRFRV?=
 =?utf-8?B?K0xDUFZlemNKckZqSG83QXkyQ3hLOGkwUTRjUDdLbk02ZjVlNmhZY1lwYi9V?=
 =?utf-8?B?YzZiOXZVaDBTWjdkWUd6bGJEUUFQbGFNaU9MVStzczVINGFYREpjNkcxODAx?=
 =?utf-8?B?QzgzY1lMVUg2UEsvczdtc0lFanBhTGgxQXllRkd4SUpzUXRBSDRqbEV5OHpV?=
 =?utf-8?B?bkwyWktVdnZvZE9TNGVpcjZRUlJ1Nnh2Mm0va0lIQTdESlQ1Q0p2VGRzcDNM?=
 =?utf-8?B?ZEpxMlJjMVd1dXAxZEs3KzFsM05vNHlkaFZHRlNyODFWVjkycXozWThEUVd5?=
 =?utf-8?B?UTQrVUlmYVBSdm0rUDhDcGE3cTlZalVPUmNnL3pENUY1cllMcEYvakhadHZa?=
 =?utf-8?B?aXAzR2FKTVlmbFhVdHFIUU9Kd3pCNVByb2poZnJtWW93YUpoR1doOTNjUkNw?=
 =?utf-8?B?QlpQNVgwN1BlekRIMjU3cnZNQmNwTk1yNjdDQ05YWmgwYXFybUQwMTNKNzlU?=
 =?utf-8?B?QWtjUnh6dVQrOE9PNnBtbWVaaDF3b3lEOTJ1cFBQVUJ4OWI3WFR2SitHTmVy?=
 =?utf-8?B?SWpOOURVUHVtYnpLKy9GV2FsaFhlREhZTUxibjZIUUVQd0UzdGtSdHl0TXVx?=
 =?utf-8?B?em5hTDVISGZEQ3BJU3MvUGwxUk9DT0Y4dXYrUXE3WkNIYkw5OXJwREFiQWFq?=
 =?utf-8?B?Z2VleDZmVkFydE1xL0J6eEduSHFRZ3ZQak5yR2xudk5UZXJwcnJiMEZxdHd0?=
 =?utf-8?B?a01rd0xOYisrYm8wVi8vckxVVzZaTkoxRjh3SzV1UjllZ2xVRWZQTm9mQnRR?=
 =?utf-8?B?RU4vZGhwQXA2OW95LzRKYWR3RnVFd1dwU2J0eGFUeG5RYnFBaWRzLzYyNllT?=
 =?utf-8?B?TFpTM1c2MUVWUkQ5UDBmMXh4SUdZY1h3M09GRklIYWZ1YzNvdXVwVVVwZnli?=
 =?utf-8?B?a2p5dEV2bmhLRkYzVmJkRjBkaFh5R28zdlV1RXJmckZDREVsaUJDRTV6QkYz?=
 =?utf-8?B?UVJ3SDgxNmF3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q09wbkpjSUZJQ0VHY0MwZjN3UU4rT295bkd3cm12bjBRdWhuNlRXbHQ3ZFNK?=
 =?utf-8?B?TkdJRWVTNm5teXJwNVVxS1BNVlV3TFBVUjFQTEcvSkpCS3RTY1IwejVRdExr?=
 =?utf-8?B?b281RkJpcmh5NzljSWpwM2ZGTkJTNnpGTm1MZnFOTTBGN2hUb2lmVDdwdnZ2?=
 =?utf-8?B?QjFvUE9pWWNZMUs2OU80UVhEWXFmaTBUd3NIdWV4OFNjdlNKell3QXpCRm5Y?=
 =?utf-8?B?VFcxUzY0RkpVNkt2N2habzZ4ZG9nT2xwVXJOYSsxcU1Zd1NYRGZ0dFRsSTJX?=
 =?utf-8?B?SWloOVE1eE5rU004aHdNTWJ6Vy9vbzNLdFl6RlIyTUdhS3lKdjdibmhhOVZX?=
 =?utf-8?B?TlFzancreWhNT1NQTEtNckpPMmxHRHU5MWQ1dWhEcm9xaE5Da2dFZHZENnZj?=
 =?utf-8?B?clZzaXpnTGptTjgwcEtDVEduMEJRYXgxYnE4RkZWcHZOUDkxZFVzRGRaaTJr?=
 =?utf-8?B?bXdwU0pGT3NvR01ESGJiZSsweGkxMTJpZnljTitpTzVCS21LdnJxRDMrcW56?=
 =?utf-8?B?Z2xDRUpTYWthWDBGY3BkNUJITWFYKzVXaFpPbDVYV0htN2E3NWkzdmR0bEYy?=
 =?utf-8?B?VzhEcUppNk9UTXArTlhzaXUxKzJFSVd5Ri9kbmYxclFRTENiTlQwK0lrVm5F?=
 =?utf-8?B?emh0UHlNWTZtQVVkd05zQ1JER01KUkY2MDB6US91cDFaMkVoeTJ2ZXA3WkRS?=
 =?utf-8?B?NGxuYTZRSUI4VzY1clVuaFI0Y0pLRktkYjBWWGExeVhST3ZOaVZFQjA3VVZR?=
 =?utf-8?B?R0FrZ1IwSDNBZklaMWJtTWY0L3lNeWdQR29ZNXNmdC9qUDdkeDRWZ1FjZGkw?=
 =?utf-8?B?ajFFQkJDZ280a0pzZjR2OUxhUnpXT1hDSDBlWkRPNUFCUHFkdmJEeERhc2J0?=
 =?utf-8?B?VzcxbENjcE9nZWVxOCt1a3BDV3FGU0ozcTNBWHVNZFdCUUU1ZGFTK0RVN2s3?=
 =?utf-8?B?K25ZcDJoQUNjd1N4Tit0STgwT0lHUTZjVmgzU3VkV0Nqc2lPelB1ZzhZbE9U?=
 =?utf-8?B?aFdnTG5iaU0rWVhES3RWMDJSVzlrd29obzhCcFFKdnNsV1ZROUx4dHdCbkJ0?=
 =?utf-8?B?RVYrdUNlVzRFYVhoeXJIZ3dJeW1pcWpyODJjN3d4YnZjbHFyYkZwc0dITkVN?=
 =?utf-8?B?TGtyQ00yL1JadHQrT1pGRFJFemY2RUhQVE5MS1ZhR0w5dVEvV2FLWS9EamZm?=
 =?utf-8?B?aXp1bzJUdnFvMHhHTmRtdXZNM0dFMG9YeWpjdlg0S3FPeGhUaGYwYUEybGhS?=
 =?utf-8?B?MUxpWjZMbzlFNTl0REUydldDMUVmcVRyT2RtaDJhTlRBMTEzUDRNdzVxNjNk?=
 =?utf-8?B?TEx2ZGtxMjBYdEgvNXcwb05xb2JMa3dBUXgxWlBDK0o1dUhqTno3WGxXRkw3?=
 =?utf-8?B?MVdQQzdqcGdOU1J6YnYxYjVaTks5MlJ4RUsrVmlCSXd0citKOHZhUCs3Umxk?=
 =?utf-8?B?NEd4UE9XQXB0UmN2enpMMG80Z0ovcUJvRU5oT1loZ0RxZFZaZW9VdXp4SUlj?=
 =?utf-8?B?TVZwZHBSQndsa21TWnVqcGNJQXJ4bUxHZ0lXaDl5VXBtVTNaT09hVUpBanRo?=
 =?utf-8?B?ZlhyNVJUL0RENFAyekRTZTJnQkNMbjRyN2NLamZHcmVYWmpMbXE4WHVLRXcv?=
 =?utf-8?B?RXlzYXUxN0xCNW04Mm9hVnpQMnFXcDlUMGxEUit1VTNBRUkxOUFmZC9qRVJ2?=
 =?utf-8?B?OGYzVE9sckNIaTV6MVludTROV2hEczVQdXZaTTMxOWR0ejRoeHdScnFHYW0r?=
 =?utf-8?B?VnM4MEZibWVnU1RaWThxVGdXcmppa3Arb21MUUtxcllBT3BrYTNGMC84aXF6?=
 =?utf-8?B?RFA0QzQ5SlhNc1JYemRuNnhOV3k0R21kVW5MZGpZNHNmUmRXYy94Z3l6LzRo?=
 =?utf-8?B?bmNKM2xjUStXQlpiaXJkdllOQWdKQ1UxSEdNOFJoKzJIWTk5S1JFRTk0SUk5?=
 =?utf-8?B?V2dzTnVNQWlvVHlwWGIrWkVVc0doQnQ2WW9Pc0YvR2liZ2N6eHd0cGNXS2hq?=
 =?utf-8?B?bm8yam43cFBpWUZ2bjlnRE8vTk4wWEkwVkQ0WldlQ1BiQ0tWbmlMalJnK0pM?=
 =?utf-8?B?V3pUcTJndnAwMGRPZUxyOE5SNS8zUjAyYjBRM3p1K0FUTmhaaUVHMmdyQXND?=
 =?utf-8?Q?BB8g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c53b950-8758-459f-e501-08dde5ffc99d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 06:54:51.8042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unY4k56JJsv/vKrPHFnzbWe6mm5hJ7ijmOpSLhUvRDQUVWtyMFOf/9BU0nbdiSHs/8l42FseGC9u94XWz8/cUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8110

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMjgsIDIw
MjUgMjozOCBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlciBQYXUNCj4gTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NyAxMy8xM10geGVuL2NwdWZyZXE6IEFkYXB0IFNFVC9HRVRfQ1BVRlJFUV9DUFBDDQo+IHhl
bl9zeXNjdGxfcG1fb3AgZm9yIGFtZC1jcHBjIGRyaXZlcg0KPg0KPiBPbiAyOC4wOC4yMDI1IDA4
OjM1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAyOC4wOC4yMDI1IDA2OjA2LCBQZW5ueSwg
Wmhlbmcgd3JvdGU6DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJv
bTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+Pj4gU2VudDogVHVlc2RheSwg
QXVndXN0IDI2LCAyMDI1IDEyOjAzIEFNDQo+ID4+Pg0KPiA+Pj4gT24gMjIuMDguMjAyNSAxMjo1
MiwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3N5
c2N0bC5oDQo+ID4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oDQo+ID4+Pj4g
QEAgLTMzNiw4ICszMzYsMTQgQEAgc3RydWN0IHhlbl9vbmRlbWFuZCB7DQo+ID4+Pj4gICAgICB1
aW50MzJfdCB1cF90aHJlc2hvbGQ7DQo+ID4+Pj4gIH07DQo+ID4+Pj4NCj4gPj4+PiArI2RlZmlu
ZSBDUFVGUkVRX1BPTElDWV9VTktOT1dOICAgICAgMA0KPiA+Pj4+ICsjZGVmaW5lIENQVUZSRVFf
UE9MSUNZX1BPV0VSU0FWRSAgICAxDQo+ID4+Pj4gKyNkZWZpbmUgQ1BVRlJFUV9QT0xJQ1lfUEVS
Rk9STUFOQ0UgIDINCj4gPj4+PiArI2RlZmluZSBDUFVGUkVRX1BPTElDWV9PTkRFTUFORCAgICAg
Mw0KPiA+Pj4NCj4gPj4+IFdpdGhvdXQgWEVOXyBwcmVmaXhlcyB0aGV5IHNob3VsZG4ndCBhcHBl
YXIgaW4gYSBwdWJsaWMgaGVhZGVyLiBCdXQNCj4gPj4+IGRvIHdlIG5lZWQgLi4uDQo+ID4+Pg0K
PiA+Pj4+ICBzdHJ1Y3QgeGVuX2dldF9jcHBjX3BhcmEgew0KPiA+Pj4+ICAgICAgLyogT1VUICov
DQo+ID4+Pj4gKyAgICB1aW50MzJfdCBwb2xpY3k7IC8qIENQVUZSRVFfUE9MSUNZX3h4eCAqLw0K
PiA+Pj4NCj4gPj4+IC4uLiB0aGUgbmV3IGZpZWxkIGF0IGFsbD8gQ2FuJ3QgeW91IHN5bnRoZXNp
emUgdGhlIGtpbmQtb2YtZ292ZXJub3INCj4gPj4+IGludG8gc3RydWN0IHhlbl9nZXRfY3B1ZnJl
cV9wYXJhJ3MgcmVzcGVjdGl2ZSBmaWVsZD8gWW91IGludm9rZSBib3RoDQo+ID4+PiBzdWItb3Bz
IGZyb20geGVucG0gbm93IGFueXdheSAuLi4NCj4gPj4+DQo+ID4+DQo+ID4+IE1heWJlIEkgY291
bGQgYm9ycm93IGdvdmVybm9yIGZpZWxkIHRvIGluZGljYXRlIHBvbGljeSBpbmZvLCBsaWtlIHRo
ZSBmb2xsb3dpbmcgaW4NCj4gcHJpbnRfY3B1ZnJlcV9wYXJhKCksIHRoZW4gd2UgZG9uJ3QgbmVl
ZCB0byBhZGQgdGhlIG5ldyBmaWxlZCAicG9saWN5Ig0KPiA+PiBgYGANCj4gPj4gKyAgICAvKiBU
cmFuc2xhdGUgZ292ZXJub3IgaW5mbyB0byBwb2xpY3kgaW5mbyBpbiBDUFBDIGFjdGl2ZSBtb2Rl
ICovDQo+ID4+ICsgICAgaWYgKCBpc19jcHBjX2FjdGl2ZSApDQo+ID4+ICsgICAgew0KPiA+PiAr
ICAgICAgICBpZiAoICFzdHJuY21wKHBfY3B1ZnJlcS0+dS5zLnNjYWxpbmdfZ292ZXJub3IsDQo+
ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIm9uZGVtYW5kIiwgQ1BVRlJFUV9OQU1FX0xFTikg
KQ0KPiA+PiArICAgICAgICAgICAgcHJpbnRmKCJjcHBjIHBvbGljeSAgICAgICAgICAgOiBvbmRl
bWFuZFxuIik7DQo+ID4+ICsgICAgICAgIGVsc2UgaWYgKCAhc3RybmNtcChwX2NwdWZyZXEtPnUu
cy5zY2FsaW5nX2dvdmVybm9yLA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgInBl
cmZvcm1hbmNlIiwgQ1BVRlJFUV9OQU1FX0xFTikgKQ0KPiA+PiArICAgICAgICAgICAgcHJpbnRm
KCJjcHBjIHBvbGljeSAgICAgICAgICAgOiBwZXJmb3JtYW5jZVxuIik7DQo+ID4+ICsNCj4gPj4g
KyAgICAgICAgZWxzZSBpZiAoICFzdHJuY21wKHBfY3B1ZnJlcS0+dS5zLnNjYWxpbmdfZ292ZXJu
b3IsDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAicG93ZXJzYXZlIiwgQ1BVRlJF
UV9OQU1FX0xFTikgKQ0KPiA+PiArICAgICAgICAgICAgcHJpbnRmKCJjcHBjIHBvbGljeSAgICAg
ICAgICAgOiBwb3dlcnNhdmVcbiIpOw0KPiA+PiArICAgICAgICBlbHNlDQo+ID4+ICsgICAgICAg
ICAgICBwcmludGYoImNwcGMgcG9saWN5ICAgICAgICAgICA6IHVua25vd25cbiIpOw0KPiA+PiAr
ICAgIH0NCj4gPj4gKw0KPiA+PiBgYGANCj4gPg0KPiA+IFNvbWV0aGluZyBsaWtlIHRoaXMgaXMg
d2hhdCBJIHdhcyB0aGlua2luZyBvZiwgeWVzLg0KPg0KPiBBbGJlaXQgLSB3aHkgdGhlIGNvbXBs
aWNhdGVkIGlmL2Vsc2Ugc2VxdWVuY2U/IFdoeSBub3Qgc2ltcGx5IHByaW50IHRoZSBmaWVsZCB0
aGUNCj4gaHlwZXJjYWxsIHJldHVybmVkPw0KPg0KDQp1c2Vyc3BhY2UgZ292ZXJub3IgZG9lc24n
dCBoYXZlIGFjY29yZGluZyBwb2xpY3kuIEkgY291bGQgc2ltcGxpZnkgaXQgdG8NCmBgYA0KICAg
ICAgICBpZiAoICFzdHJuY21wKHBfY3B1ZnJlcS0+dS5zLnNjYWxpbmdfZ292ZXJub3IsDQogICAg
ICAgICAgICAgInVzZXJzcGFjZSIsIENQVUZSRVFfTkFNRV9MRU4pICkNCiAgICAgICAgICAgICAg
ICBwcmludGYoInBvbGljeSAgICAgICAgICAgICAgIDogdW5rbm93blxuIik7DQogICAgICAgIGVs
c2UNCiAgICAgICAgICAgICAgICBwcmludGYoInBvbGljeSAgICAgICAgICAgICAgIDogJXNcbiIs
DQogICAgICAgICAgICAgICAgICAgICAgICAgIHBfY3B1ZnJlcS0+dS5zLnNjYWxpbmdfZ292ZXJu
b3IpOw0KYGBgDQoNCg0KPiBKYW4NCg==

