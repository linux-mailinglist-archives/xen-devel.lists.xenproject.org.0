Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93315AD66D7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 06:35:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012329.1390789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPZfB-0003zy-8J; Thu, 12 Jun 2025 04:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012329.1390789; Thu, 12 Jun 2025 04:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPZfB-0003yX-4b; Thu, 12 Jun 2025 04:35:41 +0000
Received: by outflank-mailman (input) for mailman id 1012329;
 Thu, 12 Jun 2025 04:35:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p7z=Y3=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uPZf9-0003yR-AI
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 04:35:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2414::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae5d541d-4746-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 06:35:34 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Thu, 12 Jun 2025 04:35:24 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 04:35:24 +0000
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
X-Inumbo-ID: ae5d541d-4746-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8D/1o7eBGXlb25LSg2f1wHeDd7J/b/+Iyfzu9jyuIrEkYpSYCnLqpypWyK5qe1iQnzkuRYnC+mGIkHcDLNkaiaFrPD3ugEvdwaCLO2WjRzTIo/ZubdB3pWlnh+x6ZQbgB7F/FAnYB5drN1NwvHUPC+HWZWMflxRYaAlerb+BzLPSQsuTqdb0YGI3flRBmf8bCGEWsBiN3Sli8j7taCLcjXnsxwzbIgCYFUO7rbV8cl50eDTTybcMPWtBg55L5AUd4dfB0vYqU1ff5HDxlxExs24epPCsYfeaDl2R6LBFOfgwp7tOZ7/UNs+QcNy/7x4XRvXtDb6hCMX7NWEZTposg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxbX+SoLoQCjzgydUxWRdLWIxdR320fOfMNtNbN7zms=;
 b=QRkQahJSC60RnYnsxS8VKXDGur6bjjwdecnH/R7f1ISuXMNR/xUYmWkry97DPFM0Fpm77rxLyv9OVUE5koG9y8PZaEQV57OROZWIl9MFtKAJ4ByCYHKVlOn4t9vjxxNy+xsQKmw6J7tQ+VZRh/XG6noNZrnr6tPkEwTxTvqMpZj5+0R5yvVH73OWX9qW0rt9mO6JHH24iJos3dwCM9O5n50dvaFcJyO2X3yslXWNmwDzDKAS/SjpR6pEfc68J0R1bcQ0gU/RL4JvOY397GL7abTzpXpO7I2sOj5mJFXW82aOeVVA6hqVjqCFEhXrgd+m8znIvXA43//lzAhF3xNrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxbX+SoLoQCjzgydUxWRdLWIxdR320fOfMNtNbN7zms=;
 b=LqvOt/f3hxeuQFkgeH7qteoo8Ik6COhT2o8zk9eQLeyBTmQ/bsMB0N3ty3s3nVFAXK2yn14LPpZMlqA4eAmUGLm2kfd8b3LR5SAqltHjqJKA3KHv3d6//p7gmk90DQNS5T5q3cyeRQYRjpCka2c/baTgHi0j+lkuJ/eAKYK+YI4=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Stabellini, Stefano"
	<stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, "Orzel, Michal"
	<Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
Thread-Topic: [PATCH v4 04/20] xen: introduce CONFIG_SYSCTL
Thread-Index: AQHbz7FloXiAMULpdEeddWt/MAojzbP8cUqAgAKQbAA=
Date: Thu, 12 Jun 2025 04:35:24 +0000
Message-ID:
 <DM4PR12MB8451169A7B4D80FFE38A62FDE174A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
 <20250528091708.390767-5-Penny.Zheng@amd.com>
 <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
In-Reply-To: <51fde0e2-abca-43c8-9cfa-734219431970@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-06-12T04:35:17.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6345:EE_
x-ms-office365-filtering-correlation-id: a120e2fe-778b-4803-f210-08dda96a8ca3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WFRhcTdZYjJIbUFTZE45eWRxMGljTWZlb0FmdzhBOG5VOU4vb2s0c1hNQVJQ?=
 =?utf-8?B?YTVGVVlTcmFDRzFvWWg2TSs2dTZPS3NnVzJkWE45M3dBT2d5Kys2S1g5V3M4?=
 =?utf-8?B?dVRIU1pPc2w4ZWRMQTBQcFBJVGpyK1lRdFhrQlV1bmFucENrQkFkZ3Axd0lu?=
 =?utf-8?B?anZ2OE5qM3dMdkMvZDRlb0F6N0lBZ1VqeXZ1Z1Q3aUJxSzVaR25Veml5ekdG?=
 =?utf-8?B?TmI5UXl4LytPVWs3Q3gwcE5QYmxJZjB3d3lFVEIrUEFWTjY3RHR0emRUMmZw?=
 =?utf-8?B?cUthOE9JWG10cTUvZXB2czAvVTRqRGpQeVBFL2d6ZXJvOUdvQXdWYWRpN3lJ?=
 =?utf-8?B?UFprU3ZLdFoxYmxVY0JPSzM2YTlnTkk0NzBlQTNPNUh0M2ZqUUtJaGZFVVQy?=
 =?utf-8?B?eUZET0NjckhJWStPSWtxN0NhL2RxRjhpRSt1bnMwd3VaYU80S2JjWEpGNWxJ?=
 =?utf-8?B?R3ZZV3hxNmcyeTBWZkFxVHRYUngxTnU0a2dIOENXUTQxa2lQV3hLdzArZ2g2?=
 =?utf-8?B?M3h6ZVZpWENzTk5HZkJaZUIyY1ZYODkrWWxCaXF1aHpwUjlmNmpoVVF1dm1I?=
 =?utf-8?B?Ukhqa3lneW1pRUVqU3dDaTJOM1hXREF1UFU2K2VGUVUxNnpDY3pOZnpRbWln?=
 =?utf-8?B?SmdtTWZ3aGZ0bG1ubGpaT0hIcitxamppY3V2eDdNNWRnTnNYMFJCNXhyWmJG?=
 =?utf-8?B?NGJUR21pWkdDQzRXOUczWTY1SUNza2FKaE9jaHp3WE1Db3VOc3l1SGZCcktY?=
 =?utf-8?B?QTZ4NjNDYS8wSGxuQ2psMG5pbGsxTVh3Wm5HK0ZrTGYyeU9udFJabVNiQTRj?=
 =?utf-8?B?RGhMdm56TjVrYmVDWTlkd1U3dkowcVNsWXoyTjlqaDR2Z2xWU2MySEVMLzhI?=
 =?utf-8?B?bmYrVnlBM2swWHhkODRqbW0vSURFZTlrd3dydlVsK1E5ZmxCay9wVDJFTHhz?=
 =?utf-8?B?ZHVSbVZGTHJkYmdWMitiL2lxVkMxT3pFVEdKTUVacEZhUkFkTG9oZHhjbDlK?=
 =?utf-8?B?V05ldXlBZlEyb3VUdThEazdhd2VMZHFydUg5WHVQZGtyRXlpTFBRcVcwUkxh?=
 =?utf-8?B?d0VtZWNPTmZZWU5YbE1Zd0VsOU9BaFAwRGZlWUxOZnhueVcvc2VKTlE5YWhj?=
 =?utf-8?B?RElwMnExc1dNNUg2R3YxZkJQcEtqQmQ0OVRIOXNONEhQVEFDZXhaclJPMTZE?=
 =?utf-8?B?Q21ESzVhT3JKZVo4RWxJVUErUDhhNFVkSnhDaktuT0pnY2R0T3Y4eDdZQjk3?=
 =?utf-8?B?VWFNZzZGYmlzSzQ0QmRjdUFlWWkyQ1E3QW14VkE0Y2dudWRRSCtCZmNKdGF5?=
 =?utf-8?B?cW5yck9pbW93QzRYMFBWTWpsaEhjTU94RkwyTFpYa0lTZWt5cHlFV2lIMXAv?=
 =?utf-8?B?S1BsYi9qNzgwYmZWNzluTjNVbGk1TDhIcG5mL3RXdHN2VUEvSktnWWxkekxs?=
 =?utf-8?B?L21ncEt6SW9NMjJhSngzUU9vZzFQcmdZRngzbThvR2s4ZDh2dlNNdTUxVi8w?=
 =?utf-8?B?ekIvT0RTZXhTTmEzRlZIaW1SaGlSSHFDTm91Mk9ydzZUZmZ4TUw3OGJWSVVF?=
 =?utf-8?B?ZFB4Y250OTF1aHh3UXFyaHhOU2hhUThVSUZXREJNK0U1N2NtaHBiQUY1VGM5?=
 =?utf-8?B?Vkl3RWlEcHJocENpS1FUcTZ1YlRHY00rSitSVjRWekV3N2JQcFVDcjJLMmtx?=
 =?utf-8?B?azMxUFVsTXhYVk5CTG8ySmNVcC9oMWJENVZzbElFRmU5R0luc0VVclpjZjl1?=
 =?utf-8?B?WXJPbGgrL1BrYXlwVkpGc3ZibTZQTWtnSE5WVUw0WVVTK0w5MW40ZStvbTNy?=
 =?utf-8?B?ZC9hM1FJUkpVQWlMV2x4SVNzWUM0MWxxN2E3M2NFUURGUkJVZ3ZnVklialFR?=
 =?utf-8?B?cUZtMjBRc3lqWGFSRlFrWlBzMk51cnJwaW8vWCtPazEyazYrWXhxSk5QTnFE?=
 =?utf-8?B?d3hvWWdlNU9qS0txTlBhdUt3YUVZQ1NHbkxiRmN2TGg2bm1vVzVtMWhxN1hN?=
 =?utf-8?Q?FzQSenzPIEcY8sweFroTcjlpfydhio=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0kvaGxUeFUxL2ZsZUgxNnMwMXJUK0FhcUhxSFhNS1p1dENTeEhheWdpNHda?=
 =?utf-8?B?M2Z4dyt3Njc1aEhnbnZVOCswMTJpOFVWdHlOMWczYkdRQXF4eDZlS3hmTW9u?=
 =?utf-8?B?Y0pvdFZwck5FTlo1dHlwOFkwOGVDdmx0VlNsSS9uSHM3cFdSTHNyYmp1b2Q3?=
 =?utf-8?B?SmlrNTc1QVZRMUJzb0tCQ3ZQVzIxZGpZQXdaeFF6QlM3WmsyL2tnQkRnOXpa?=
 =?utf-8?B?a0VKU0x5VkorcjlOU1dVYzc4ZkFBdVdjV3o4SWdJbUFPK0g2cmlvMTN5MEhq?=
 =?utf-8?B?RlZnWDFEREx4eUQzeEdrVHUxaWpDNWZiUlpDRFBwam9oU2Vmai9XLyt0aGhO?=
 =?utf-8?B?d2pzQXVVSGRzNm9MWWVwcnBCaStuZWpzcDByeE4wczE3ZDZ1blhwMDY1bk1a?=
 =?utf-8?B?S05Rc0dhSXFVWndtQ0hHK0d6UmFOa0ZDL2dtNXBTWGRyWTNjOGRHd0tCbFJS?=
 =?utf-8?B?OFpMTmJoVzdWUmkydk1mbTQxeEpITnpJSmdhMThsT0NCS0NGUFE0M1dUTG9O?=
 =?utf-8?B?SjBRa2lGNGNVbnhQSUdvQmZXa1B0VUZva1VXTnVGNW9iRENWb1JzNmYyZ3ZI?=
 =?utf-8?B?OWxxd1g5QXYwYTdzOEFjS2xYWkM2TTRsUmVteDdkTUduT055MTNxcFQvcnpJ?=
 =?utf-8?B?aXN3WDNEQjN4L2tBSWptRG4wTzJyTWdpMGhCOXdHZ2hCZlVZRHljS1EzNVZu?=
 =?utf-8?B?eU5ZejJnTVNGdGFwdTBHeVhYZE9IZDV1VXNOYUN6OGJ3MExoV2hkU1RHMDg5?=
 =?utf-8?B?Q2JZV1F5bTZYemxsaitlZnMzb3dVNi83enpMS3ZieGlXTHJjdHNWbk9EdG5M?=
 =?utf-8?B?eXkxQ291WE5jZVFyT3FLQWU4eGIxQTFwZ3VjN2JrbXJybUhHajNGYVdXTVpO?=
 =?utf-8?B?VFNhdkQrK0RNVDRvS1Y4OXJ6OHo2M2x6WVl2MWxDK0tGSnN5ODE0VzBJZG1i?=
 =?utf-8?B?dmZGQjN4TWMvaGpkbjVmeE5mTVdldE1lVHkybXZxZGVpMXprUHA3SVZQZ2FQ?=
 =?utf-8?B?TzJDMWl1S1dPR3NCb1FWMWlwTXZBdStXNnJ1RUNjTmRBbExKNjhQUWh1eDNL?=
 =?utf-8?B?citiOGRwaHB2cHhvVHJNVzZoSTFYYjlXb21Mdk4wMHN5cyt3c21VMHdYOFJl?=
 =?utf-8?B?ZmFYUUZkODhvMmViaUtJcHBPWjRNc1VXbzY5Sk9tYlhGZWE5bjNxMmNKRTM4?=
 =?utf-8?B?ZkJXRzJZZzhTSFlQczhwamhDS1hUZzFIblBFdVQwU0V0V0dpMGkwMDZ1cXNp?=
 =?utf-8?B?SVlURlU4K0huNU9xbVhQU2dqT1JLTnNOUGJkMkpWengvaUpVdVpBejV2YVNk?=
 =?utf-8?B?MkJpUThWYXhXZkRhQTJkT0JHNE5rN2ZidWxWS1NJU1YxOFJLMUlBc3B3bFRG?=
 =?utf-8?B?YzZna0JiSXFIalNEbjdOMm43OW9iQmk0S0ttY0o1ZFk1cnZJaWtQNFVVQjJk?=
 =?utf-8?B?U0NIQ3E2Vys5UWVwdUtUZTVwVjdoSUp0NHViK2YxNTNxSW9qSkF1V3dlRHRH?=
 =?utf-8?B?T3REL0R1MGdZdDdVU29OcnJ3TXE2SnAxQk5QeDVFcWRYa1lLd0JoNUlQNHVx?=
 =?utf-8?B?VVAwNEVXd2JpUm56Y05KUG1YR29xOGhiTTRjdVJFSVNxRmQ4SlZYZWlZK3lq?=
 =?utf-8?B?cGY2VEVjdnVhY3FCcTZOQ0hRWm5LYSsvblJwY1ZFeG1lQ3U0UXpiRG9vK0Mx?=
 =?utf-8?B?aWt5bGtlbkN6SHFGdlhHTnJUWmt2WmFqVTR1eUxaTzAvZHZ1enRYUkZuUFZq?=
 =?utf-8?B?UTU4aVJXaDVRZjdVMDA4RVNjWTU3MERCcGI3eWlwZ09xTEVOY25nV1h4T0dM?=
 =?utf-8?B?bHp1M2t6U2JRbnNxYUlCeUQvUVR1S2VES1B4Z1o3NmU4Q1phSWNONXZ6ZU82?=
 =?utf-8?B?VmVSM1Z0VTAvWk5WZE9GWXp1WGErZG14RVJoQTNkZ1N3K3dMbkdUbmdwV29C?=
 =?utf-8?B?TjZDM21WcGZFcUdHNzM5amNRVTRVM0V1bVNOY3h0akxJNW9RWW00TDJ1SzYw?=
 =?utf-8?B?ZGpSNlVxWEIzTDlwalV3cmYzeTVDNWRvTGdDalUxWkJyd0ZZcE42OWRTeUt4?=
 =?utf-8?B?QTZUSkN2bUtRdXBrWmxZai84Q1FJeTN3NWwwMWxtVEw0YVRITDlJS3BPV2Jy?=
 =?utf-8?Q?LhkY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a120e2fe-778b-4803-f210-08dda96a8ca3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 04:35:24.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yaKCbl2/GnQeEnOtFaSq8iCKVVIHhXvGm1kAoODTMDJPYFptbbcs906a28qreGdqj4LFL6XKDHM+KKVFgUTv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTAs
IDIwMjUgOTowNSBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0K
PiBDYzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBTdGFiZWxsaW5pLCBTdGVmYW5v
DQo+IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT47IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+Ow0KPiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAdmF0
ZXMudGVjaD47IE9yemVsLCBNaWNoYWwNCj4gPE1pY2hhbC5PcnplbEBhbWQuY29tPjsgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
U2VyZ2l5IEtpYnJpaw0KPiA8U2VyZ2l5X0tpYnJpa0BlcGFtLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDA0LzIwXSB4ZW46IGlu
dHJvZHVjZSBDT05GSUdfU1lTQ1RMDQo+DQo+IE9uIDI4LjA1LjIwMjUgMTE6MTYsIFBlbm55IFpo
ZW5nIHdyb3RlOg0KPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxs
aW5pQGFtZC5jb20+DQo+ID4NCj4gPiBXZSBpbnRyb2R1Y2UgYSBuZXcgS2NvbmZpZyBDT05GSUdf
U1lTQ1RMLCB3aGljaCBzaGFsbCBvbmx5IGJlIGRpc2FibGVkDQo+ID4gb24gc29tZSBkb20wbGVz
cyBzeXN0ZW1zIG9yIFBWIHNoaW0gb24geDg2LCB0byByZWR1Y2UgWGVuIGZvb3RwcmludC4NCj4g
Pg0KPiA+IE1ha2luZyBTWVNDVEwgd2l0aG91dCBwcm9tcHQgaXMgdHJhbnNpZW50IGFuZCBpdCB3
aWxsIGJlIGZpeGVkIGluIHRoZQ0KPiA+IGZpbmFsDQo+DQo+IE5pdDogcy9maXhlZC9hZGp1c3Rl
ZC8gPyBJdCdzIG5vdCBhIGJ1ZywgYWZ0ZXIgYWxsLg0KPg0KDQpVbmRlcnN0b29kLg0KDQo+ID4g
cGF0Y2guIEFsc28sIHdlIHdpbGwgYWxzbyBzdGF0ZSB1bnNldHRpbmcgU1lTQ1RMIGluIHB2c2hp
bV9kZWZjb25maWcNCj4gPiB0byBleHBsaWNpdGx5IG1ha2UgaXQgdW5hdmFpbGFibGUgZm9yIFBW
IHNoaW0gaW4gdGhlIGZpbmFsIHBhdGNoLg0KPg0KPiBFdmVuIHdpdGhvdXQgdGhlIGRvdWJsZSAi
YWxzbyIgdGhpcyByZWFkcyBvZGQuIEJ1dCBpdCdzIGFsc28gdW5jbGVhciB3aGF0IGl0IGhhcyB0
byBkbw0KPiBoZXJlLCBub3Igd2hldGhlciB3aGF0IGlzIGJlaW5nIHNhaWQgaXMgYWN0dWFsbHkg
Y29ycmVjdC4NCj4NCg0KSG1tbSwgSG93IGFib3V0ICAiDQpUaGUgY29uc2VxdWVuY2VzIG9mIGlu
dHJvZHVjaW5nICJDT05GSUdfU1lTQ1RMPXkiIGluIC5jb25maWcgZmlsZSBnZW5lcmF0ZWQgZnJv
bSBwdnNoaW1fZGVmY29uZmlnDQppcyB0cmFuc2llbnQgYW5kIHdpbGwgYmUgYWxzbyBmaXhlZCBp
biB0aGUgZmluYWwuIg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gKysrIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQo+ID4gQEAgLTU3OSw0ICs1NzksMTUgQEAgY29uZmlnIEJVRERZ
X0FMTE9DQVRPUl9TSVpFDQo+ID4gICAgICAgQW1vdW50IG9mIG1lbW9yeSByZXNlcnZlZCBmb3Ig
dGhlIGJ1ZGR5IGFsbG9jYXRvciB0byBzZXJ2ZSBYZW4gaGVhcCwNCj4gPiAgICAgICB3b3JraW5n
IGFsb25nc2lkZSB0aGUgY29sb3JlZCBvbmUuDQo+ID4NCj4gPiArbWVudSAiU3VwcG9ydGVkIGh5
cGVyY2FsbCBpbnRlcmZhY2VzIg0KPiA+ICsgICB2aXNpYmxlIGlmIEVYUEVSVA0KPiA+ICsNCj4g
PiArY29uZmlnIFNZU0NUTA0KPiA+ICsgICBib29sICJFbmFibGUgc3lzY3RsIGh5cGVyY2FsbCIN
Cj4gPiArICAgZGVmX2Jvb2wgeQ0KPg0KPiBXaHkgZGVmX2Jvb2wgd2hlbiB5b3UgYWxyZWFkeSBo
YXZlIGJvb2wgb24gdGhlIGVhcmxpZXIgbGluZT8NCj4NCg0KQWNrLCB0aGVuIGhlcmUgbWF5YmUg
YSBzaW1wbGUNCiINCmNvbmZpZyBTWVNDVEwNCiAgICAgICAgZGVmX2Jvb2wgeQ0KIg0KIGlzIGVu
b3VnaC4NCg0KPiA+ICsgICBoZWxwDQo+ID4gKyAgICAgVGhpcyBvcHRpb24gc2hhbGwgb25seSBi
ZSBkaXNhYmxlZCBvbiBzb21lIGRvbTBsZXNzIHN5c3RlbXMsDQo+ID4gKyAgICAgdG8gcmVkdWNl
IFhlbiBmb290cHJpbnQuDQo+DQo+IFRoaXMgaXNuJ3Qgb3Zlcmx5IHVzZWZ1bCAoYnV0IHBvc3Np
Ymx5IG1pc2xlYWRpbmcpIGFzIGxvbmcgYXMgdGhlIHByb21wdCBpc24jdCBnb2luZw0KPiB0byBi
ZSB2aXNpYmxlLCB5ZXQuDQo+DQoNClVuZGVyc3Rvb2QsIEknbGwgcmVtb3ZlIHRoZSBkZXNjcmlw
dGlvbiBoZXJlIGFuZCBhZGQgaXQgaW4gdGhlIGZpbmFsIHdoZW4gcHJvbXB0IGlzIHZpc2libGUN
Cg0KPiA+ICtlbmRtZW51DQo+DQo+IEJsYW5rIGxpbmUgcGxlYXNlIGFoZWFkIG9mIHRoaXMgb25l
Lg0KPg0KDQpBY2sNCg0KPiBKYW4NCg==

