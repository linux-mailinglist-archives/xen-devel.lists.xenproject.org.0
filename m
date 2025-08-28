Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A8B39270
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 06:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097410.1451750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urTuL-0007o3-48; Thu, 28 Aug 2025 04:06:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097410.1451750; Thu, 28 Aug 2025 04:06:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urTuL-0007mG-1H; Thu, 28 Aug 2025 04:06:41 +0000
Received: by outflank-mailman (input) for mailman id 1097410;
 Thu, 28 Aug 2025 04:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urTuJ-0007mA-40
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 04:06:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2416::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63457aa1-83c4-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 06:06:36 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 DS2PR12MB9568.namprd12.prod.outlook.com (2603:10b6:8:27c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.20; Thu, 28 Aug 2025 04:06:32 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 04:06:32 +0000
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
X-Inumbo-ID: 63457aa1-83c4-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnwe7ljv+zReZlxkCUyvJOPdo86fO/+q3GIDM+yTMixU5bVNZ0BJbAT5Tl8bYtShq1+MUWFp+9R/fi8eNhJAvK55cfjR5vbliKu8qCHCWGPhJe/G7HpAWNd/Q02RSSMX/NFM8vgz3m8QPHbg6wRUJaX3f2ZsyuNtQ8I0z5StPnGwipBYn2WSJIL7BxunIcyMNZWxQe2QI+kzjMvTDtgY/c2SH+FYsjajyFVPrZci7CWiJI2mvzncctyvy5xOzNVwqgG1aKliD9lyZWdqbMukwleoQlrhaW7gQABO+Rp9hCJXNTBmMLFvgOJZyJOYkL8BKPKyp/pOXhzd0IHUCQ1c5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSlLeeYDhJHR/RwvS2xUqV7ZvJzVthNx3e4DV2yY0f0=;
 b=N5opMK+rk+19qoyRU1kqNYVWZfpglKvq47eoWrZ7ReQzKoxBA9NBgk5dAtizm9tkMTUJHsROb7/rPcMgOobiuA2BU83OvvuB9fuVZGugg9kPc/cfvEl8YEyjMmZk2oMFYqH67PYqpiZMWVemkyUdfxQdnmB6WP5Mleg2rSre31oCfyWfLcLDPxneb9bIsMAA0s6vw1vUUxht4EgmlPE5B6X2OGBExyLkjTU6zR5bLgHKjsoeFSUiF2FwAjnE32nXAkHHWtKDM7MZOZuGnka2AbcLBtMaQUaVogwSFh+nbvj/tAjP+9G9fNsYExZAVu/CcWuVB+oSgh+WkW0Nw2bwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSlLeeYDhJHR/RwvS2xUqV7ZvJzVthNx3e4DV2yY0f0=;
 b=k7vxq1CZxR5khRjBjtkVr1GCXOOmQV2A+i5IxNoYqA5lTREsP/5IgUneXjWNOn+ijKTFbVRRea+hvngH6rXi7jIvkpZ7JuL3L1XrYJqcJqPYQwF2rjoM7D3/4yumiTKakYop3MTBg3xe6yPbPw9e6gkZGngLBO8/UUPXgb8Zri4=
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
Thread-Index: AQHcE1L0WO8OIJho60KGV8JFR/QspLRzjMCAgAJSvzA=
Date: Thu, 28 Aug 2025 04:06:32 +0000
Message-ID:
 <DM4PR12MB8451CFF93199B96578D96F88E13BA@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
 <20250822105218.3601273-14-Penny.Zheng@amd.com>
 <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
In-Reply-To: <f27c17e6-8c88-42f3-b0e2-874aa02597c5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-27T06:36:58.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|DS2PR12MB9568:EE_
x-ms-office365-filtering-correlation-id: 719e9424-1446-4282-f6fe-08dde5e845dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUtVb1Z4M3dINy8wL3l6WU8vbHlNUkRHbzR1RVgzUnprM1Frc0VxNnNhRWh2?=
 =?utf-8?B?S1VWS3RPdFpsZEVZc0hUcTlFK3NXNlQyd3lwbU16d0lRYXkycktKWUErSGYx?=
 =?utf-8?B?allzRW9xU3BVRE5rWStqVGFIdlNUY21JVUo5anNRZnl2THI5K3phNTMrU2lS?=
 =?utf-8?B?OFdIRXRiMUNPS04wVGtDUXQ3dDJCcnlqZm1vUnloOGpVeGx0WENRTk5RdHFq?=
 =?utf-8?B?TGE0K1gyVzNuMGZrTkdxanZhKytITFJzM2lvZE00VlZUVTQ2TFJqdWtWd0VF?=
 =?utf-8?B?L01jRWZsTFZuNWlVaFpBWlZwNlQrWmM3RDRqSEhKWWQvVVI5SUpjUGpPYndn?=
 =?utf-8?B?UG03ZEFQcGR4ODVCM0JrTDl3WXFEVXorWi8wQWpFbWpGQmFhRGtoMEZJcTZT?=
 =?utf-8?B?WC8wUjN6U3JPaGJtcEw0YU8vKzZEVXR3MzU1M1VuWU0yYlNjc2ZSTmZ6dUl4?=
 =?utf-8?B?LzJuR0NBQjM0dERBZnhBWWdLbzZJNUk1V1A4U2RXMWVhK1pOTS8ycmJ2VEVq?=
 =?utf-8?B?MHpvVUFmQ1pUYzdSTXJ1ZGNjNCt2T2V6M0wyWGZsM2VWWER1WlFNSjBtTitP?=
 =?utf-8?B?TlBNRFA2Z29Qb0ZIN0xtU1Zib0FNMjJIYmxRM1VmRHJMYzJDdWNYYW4yRVNn?=
 =?utf-8?B?ZklIY3VSVHhvME0yQ2x3Zkx1Y3NPbHBvaVBsUDBuNjc3SlBkOER2SzlEY2xt?=
 =?utf-8?B?L2xHS1JvQm44by9CeldUTW1HNk9wRkVGbUVXT0piU0ljNXh1czFManZ2UERU?=
 =?utf-8?B?Y2Y0QnloUlFTVTd5M29PMjA5Mmt2VEptSjM1Yk50ckJFOElKcFF3UndhM2pq?=
 =?utf-8?B?Q2lKRmdYdlNxMmZJK0dOWGpxMTZyS3o5RElXSHB1NXdleDdNQS9lZDFsY3da?=
 =?utf-8?B?bEN2WkloOGZybVJQNzBWK2lKNzVicUwwTkVwK2dUdi9INUUzcGZnbHIyZHJB?=
 =?utf-8?B?WHc3bExGOUpJbHBTSWpvRFhWb01ZRU9RTlZxREI0Y3U3VDM2MzMxb1pLOVhq?=
 =?utf-8?B?S0pMWnp2QWUvemtPZGRBNWNaWVBNWjd1T2VxRVVhTlc3OC9EZEtPeElVNXpa?=
 =?utf-8?B?a2trMTdWdktsc0Y5d0R4ZTlxckM5ZXhNOWFlRWpGbm1TSDZqUFljS3Qwd0Iy?=
 =?utf-8?B?MCsxemd1MzNHc3dSOFhOU1F3cExvYlZhak5BMWIva2tWRXNIdmlLM1dBbUYy?=
 =?utf-8?B?aktJdWppajBJakNsRFdzVzVKZ01ZTkRXT3RQaFZmSTg1QXZKd2JZd2pTY2Fm?=
 =?utf-8?B?bGV0WTM3VXZkM1NLZ1JpRVNhWk13Rm9jNXkwMUZFR0Z2TXQ4elJWMVo1YnlL?=
 =?utf-8?B?MTBjd2hzSG1zS0RsdllNd2YyV3ozR1dCRkl2cWZlTGR5SHJUaXZOeTJRZVlT?=
 =?utf-8?B?SkthWXg2bVZudnJ1dEM1dDBRZWpYcUdBZkxZVW5UYzYvOFF2MHJXMmFXN1FB?=
 =?utf-8?B?bzl3MWRvaDNFV3htb21qMHRTWEZBN0lGUTJhMnNiQTVLdnZmYzM4UWdFd3JF?=
 =?utf-8?B?V0NIWnF2empFNEFFMXYzY2lNeC9NaG11WTRFdFVIZVk5M3dKaURjaVJ2QkhP?=
 =?utf-8?B?MW1wc3BqTXBOTDI4SDYzMTZpRHB0Z2tXNjRPdjhZb0VHMzBvYms3bjZuY0ln?=
 =?utf-8?B?UXR3NkVIQlM2ZUVxRTlmdCtodEtYdVFoWS85anJxbVc0Ym95enRQWXB5OXBC?=
 =?utf-8?B?Q0xpMFVMaVZMOUlZd2hIWEFvU3pQM0JFdHJqWkNYREZOWTh2c256SkpwOG9i?=
 =?utf-8?B?MElMMk12bmtrTVZvVEN1azA2Y04rZjRlQXpHblFPVEp6NjRxUklhbFdjMDlm?=
 =?utf-8?B?ZURscGZhUG5tNGtKT21pOGljSTlEQzRzSVFVRzJpcDdrREtJSVlOM0pHUFpY?=
 =?utf-8?B?Y2VVNHMxKzlyWjVKWEtTaUhabnBFM1Nzb2MxWVJzU240ZnEzQ2dwYno0MHZt?=
 =?utf-8?B?eFhqUE5KRkkzdFZ2VC80Q2g2cEQ1MXFvckhGMXNZa1VZVUZnZnRzR3hXb0pR?=
 =?utf-8?B?STF3WGowOVJRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bStFUS9pcHNYUnVEYXQ5VEljaWtUMEJLZGlrblNwWTVZOGNYOWwxbVdCWUwv?=
 =?utf-8?B?U2NtY2J5cTN2QTVEc203TFpHTCtIbUt6Qzk4V3plTHVpK1g0NjVyMldEejg5?=
 =?utf-8?B?VUJ0UzlXK2FITmJkRUcrUk4wQjRKS2FlNjZFS05tR2dkRVBpZDFuVFNnTExY?=
 =?utf-8?B?ZS9LUmNkK1lWVVA2OFlUQk9HVVhpeHhIazIyRFI1b2REK2tqOUlqbGZXeFha?=
 =?utf-8?B?NnJtaTQ2aGVpVUhSYjNWWnlFcVRKYUpWdGw5NDJhS2VMcHRvNXR3YXlZVldr?=
 =?utf-8?B?M3JIQmFMSm5MTlVSL0VXQmw5RjRYQmdIWU5LTUJHc1dZZk5ha3crQmswZ0Nu?=
 =?utf-8?B?aFAvV2hVUllGbndSZXhQN2ZPWmlVcTBPUDJIeW1CSFhTenRXR2dTbDZRVUY0?=
 =?utf-8?B?enl0Y3VhTTBnYjBPWnhYTnZJVXdDSG94TFdaZzNBWmwvUEM3L2NDVnFIclZ6?=
 =?utf-8?B?WVV0SDludm5IRSt5TWlWcEliZzhoek43U2dPK3hYNDRpU053YURwZUtBd3ky?=
 =?utf-8?B?S3hmc1VUcUxPN2xtMHJsYVJVaEtDa2kvZ3N4TWF2bG4yelQxYUx6STl3R2VL?=
 =?utf-8?B?WUVYTnlMQmhQUGRKc3dVcUZoWFJ6S2NvWWJhNHdrTUFsNkxPQjk3MGd6VE5k?=
 =?utf-8?B?VTIxT2VRZlVib1c5RW5TS1VqNVJxLzRHZzRhelYvUnZhLzRDZUhxbFZ1bHc5?=
 =?utf-8?B?OFp3ZUxDNWdsWGxrWlhJOVpVV2s5ZXZuUFlUT2VYazFqRS9zbFljSFJPZEp3?=
 =?utf-8?B?MGowT1BuMk1DcXc3ZjNUZVVwOTZheFVDeTRRVHBSaTVmTjVNU3ByMkdSd1Q0?=
 =?utf-8?B?MVRXM1p4Y2hhdW5kUEZuOVQ4UzRScW1JMHF5VG43Y25vdzBPTEtvY245bFF5?=
 =?utf-8?B?SGMvSG8zVEhkZHVsTU0rRW1YUThhRC9kM3pWcXhuYnVRN0l5TDREOGJ6QklW?=
 =?utf-8?B?aTlrSS8vK2lKRTUwTHdLOGQzZHQvL3ZYRm1ldDRqbEkyNDlBbVJBUnhkb2RX?=
 =?utf-8?B?Nm9UUjM0SkxRZmFkQUJTSXhCc2V0YnF4emdFUGoydm9idFlFcFlBSEFrbjJE?=
 =?utf-8?B?N1M0amduV04vYWVrenMrdkQ0WE5pZDF5d1ErNERqL2w2UVpOTXQybXNwcFhS?=
 =?utf-8?B?KzJlMXp3TThsQnpldGpYOWg0bS9wNFZjajErRUE2czRYY0dONC9adFRBa083?=
 =?utf-8?B?aExPRjFZQkt6d0V3RlpZL1FWVTZnYVpOT3Jhamt1V3A2OXBnZFR6bU5kT08w?=
 =?utf-8?B?azdkUzAxc0tGS25LaEVOdWk5WDE4VElaNElCcStJWnJBWWd2NytsamZHNWV3?=
 =?utf-8?B?SlFnRjRKRmloUklEcWxmV3BhK1h3eTI1dHovVlFrVVFuU1BHOFRNSkszbEUv?=
 =?utf-8?B?R00zN2sweE1BNllWTFNTNEs5VmZBZnVkdHphalYvMjhoS3RPVDVPdlRtNXRu?=
 =?utf-8?B?MnVSOHo4Vk91T3A5eW9NSmMvbTl2VjlTN3BnRVFMYUVSVzEzVkl2TTEwbEJ5?=
 =?utf-8?B?bnFJSURHaHJwNUhYUGdzaGhFdUxmVkx2bWpXWFc3WUdvNUZUam5SWkFhaEpt?=
 =?utf-8?B?RWZTb25EWmJiZndqa0FSZ1FEUFoxRWozY0p4YkhHeGVBbU5zcFhjcFNQMUpn?=
 =?utf-8?B?WHpGNjJES3BJM3FsS1JCQnR6TzlpS0txZ01RS2RZTjBMQ3A0NUVUUGZRN1I0?=
 =?utf-8?B?cVBCQlFmRnQrREh2VjM1WEZRdEFrc2c1d05EdnV4REZRSkJCU1lUU3RRMEor?=
 =?utf-8?B?NW5oTHhaWU5QMS81eml0amp0TTl4cktiOXg2N3JzczF3NTNmalFxbWlFcUtB?=
 =?utf-8?B?dDZDanFOQ25QWjYrOVlZOFZ5bGlQWGFlV21XMGpkOFFlL21BNFRBTTdCUC9W?=
 =?utf-8?B?RDB5eGw0Wm50Q0FYUmxsMjdYOVExZHlVNXNHVU9vUTZRc3ExQzh4QTdFcmw3?=
 =?utf-8?B?MDlkdWVsRnlSbzdjODdieExxV0IxRG1PeldnZjJvZUcvVXExN3R1RW9RTGRD?=
 =?utf-8?B?dTYrSkdkeGo4eWRWQ2JwVVJPd1NNZ3RqYk5IVFBIWGEyQXZ4ZzRPWWNIQXk4?=
 =?utf-8?B?cFBnU3lOOXFIK01wdTRwNWZTMmttTlpycDdtTEQzQ2pQUVlndFF1eDQwampI?=
 =?utf-8?Q?F9t0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719e9424-1446-4282-f6fe-08dde5e845dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 04:06:32.3715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rfkYUABAh7T74AislRwhllOj7vBiQndnccEKaggbrzXb7gBwgiNc8hfK5ZfH/Onibqg+oxgt/XWUiWv6W4mxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9568

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAyNiwgMjAy
NSAxMjowMyBBTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBBbnRob255IFBFUkFSRA0KPiA8YW50
aG9ueS5wZXJhcmRAdmF0ZXMudGVjaD47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Ow0KPiBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+OyBSb2dlcg0KPiBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47
DQo+IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHY3IDEzLzEzXSB4ZW4vY3B1ZnJlcTogQWRhcHQgU0VUL0dFVF9DUFVGUkVRX0NQUEMNCj4geGVu
X3N5c2N0bF9wbV9vcCBmb3IgYW1kLWNwcGMgZHJpdmVyDQo+DQo+IE9uIDIyLjA4LjIwMjUgMTI6
NTIsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZy
ZXEvYW1kLWNwcGMuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNw
cGMuYw0KPiA+ICsgICAgLyogT25seSBhbGxvdyB2YWx1ZXMgaWYgcGFyYW1zIGJpdCBpcyBzZXQu
ICovDQo+ID4gKyAgICBpZiAoICghKHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NUTF9D
UFBDX1NFVF9ERVNJUkVEKSAmJg0KPiA+ICsgICAgICAgICAgc2V0X2NwcGMtPmRlc2lyZWQpIHx8
DQo+ID4gKyAgICAgICAgICghKHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NUTF9DUFBD
X1NFVF9NSU5JTVVNKSAmJg0KPiA+ICsgICAgICAgICAgc2V0X2NwcGMtPm1pbmltdW0pIHx8DQo+
ID4gKyAgICAgICAgICghKHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZU0NUTF9DUFBDX1NF
VF9NQVhJTVVNKSAmJg0KPiA+ICsgICAgICAgICAgc2V0X2NwcGMtPm1heGltdW0pIHx8DQo+ID4g
KyAgICAgICAgICghKHNldF9jcHBjLT5zZXRfcGFyYW1zICYNCj4gWEVOX1NZU0NUTF9DUFBDX1NF
VF9FTkVSR1lfUEVSRikgJiYNCj4gPiArICAgICAgICAgIHNldF9jcHBjLT5lbmVyZ3lfcGVyZikg
KQ0KPiA+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPg0KPiAuLi4gYWxsIHRoZSBlcnJvcnMg
Y2hlY2tlZCBoZXJlIGFyZSB0byBiZSBpZ25vcmVkIHdoZW4gbm8gZmxhZyBpcyBzZXQgYXQgYWxs
Pw0KPg0KDQpZZXMsIHZhbHVlcyBhcmUgb25seSBtZWFuaW5nZnVsIHdoZW4gYWNjb3JkaW5nIGZs
YWcgaXMgcHJvcGVybHkgc2V0LCB3aGljaCBoYXMgYmVlbiBkZXNjcmliZWQgaW4gdGhlIGNvbW1l
bnQgZm9yICJzdHJ1Y3QgeGVuX3NldF9jcHBjX3BhcmEiDQoNCj4gPiArICAgIC8qDQo+ID4gKyAg
ICAgKiBWYWxpZGF0ZSBhbGwgcGFyYW1ldGVycw0KPiA+ICsgICAgICogTWF4aW11bSBwZXJmb3Jt
YW5jZSBtYXkgYmUgc2V0IHRvIGFueSBwZXJmb3JtYW5jZSB2YWx1ZSBpbiB0aGUgcmFuZ2UNCj4g
PiArICAgICAqIFtOb25saW5lYXIgTG93ZXN0IFBlcmZvcm1hbmNlLCBIaWdoZXN0IFBlcmZvcm1h
bmNlXSwgaW5jbHVzaXZlIGJ1dA0KPiBtdXN0DQo+ID4gKyAgICAgKiBiZSBzZXQgdG8gYSB2YWx1
ZSB0aGF0IGlzIGxhcmdlciB0aGFuIG9yIGVxdWFsIHRvIG1pbmltdW0gUGVyZm9ybWFuY2UuDQo+
ID4gKyAgICAgKi8NCj4gPiArICAgIGlmICggKHNldF9jcHBjLT5zZXRfcGFyYW1zICYgWEVOX1NZ
U0NUTF9DUFBDX1NFVF9NQVhJTVVNKSAmJg0KPiA+ICsgICAgICAgICAoc2V0X2NwcGMtPm1heGlt
dW0gPiBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVyZiB8fA0KPiA+ICsgICAgICAgICAgc2V0X2NwcGMt
Pm1heGltdW0gPA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAoc2V0X2NwcGMtPnNldF9w
YXJhbXMgJg0KPiBYRU5fU1lTQ1RMX0NQUENfU0VUX01JTklNVU0NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgID8gc2V0X2NwcGMtPm1pbmltdW0NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgIDogZGF0YS0+cmVxLm1pbl9wZXJmKSkgKQ0KPg0KPiBUb28gZGVlcCBpbmRlbnRhdGlv
biAobW9yZSBvZiB0aGlzIHRocm91Z2hvdXQgdGhlIGZ1bmN0aW9uKSwgYW5kIHNlZWluZyAuLi4N
Cg0KTWF5YmUgZm91ciBpbmRlbnRpb24gaXMgbW9yZSBwcm9wZXINCmBgYA0KICAgICAgICBpZiAo
IChzZXRfY3BwYy0+c2V0X3BhcmFtcyAmIFhFTl9TWVNDVExfQ1BQQ19TRVRfTUFYSU1VTSkgJiYN
CiAgICAgICAgICAgICAoc2V0X2NwcGMtPm1heGltdW0gPiBkYXRhLT5jYXBzLmhpZ2hlc3RfcGVy
ZiB8fA0KICAgICAgICAgICAgICAoc2V0X2NwcGMtPm1heGltdW0gPA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAoc2V0X2NwcGMtPnNldF9wYXJhbXMgJiBYRU5fU1lTQ1RMX0NQUENfU0VUX01J
TklNVU0NCiAgICAgICAgICAgICAgICAgICAgPyBzZXRfY3BwYy0+bWluaW11bQ0KICAgICAgICAg
ICAgICAgICAgICA6IGRhdGEtPnJlcS5taW5fcGVyZikpKSApDQpgYGANCg0KPiA+ICsgICAgY2Fz
ZSBYRU5fU1lTQ1RMX0NQUENfU0VUX1BSRVNFVF9OT05FOg0KPiA+ICsgICAgICAgIGlmICggYWN0
aXZlX21vZGUgKQ0KPiA+ICsgICAgICAgICAgICBwb2xpY3ktPnBvbGljeSA9IENQVUZSRVFfUE9M
SUNZX1VOS05PV047DQo+ID4gKyAgICAgICAgYnJlYWs7DQo+ID4gKw0KPiA+ICsgICAgZGVmYXVs
dDoNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4NCj4gTXVjaCBv
ZiB0aGlzIGxvb2tzIHZlcnkgc2ltaWxhciB0byB3aGF0IHBhdGNoIDA5IGludHJvZHVjZXMgaW4N
Cj4gYW1kX2NwcGNfZXBwX3NldF9wb2xpY3koKS4gSXMgaXQgbm90IHBvc3NpYmxlIHRvIHJlZHVj
ZSB0aGUgcmVkdW5kYW5jeT8NCj4NCg0KSSdsbCBhZGQgYSBuZXcgaGVscGVyIHRvIGFtZF9jcHBj
X3ByZXBhcmVfcG9saWN5KCkgdG8gZXh0cmFjdCBjb21tb24NCg0KPiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9zeXNjdGwuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwu
aA0KPiA+IEBAIC0zMzYsOCArMzM2LDE0IEBAIHN0cnVjdCB4ZW5fb25kZW1hbmQgew0KPiA+ICAg
ICAgdWludDMyX3QgdXBfdGhyZXNob2xkOw0KPiA+ICB9Ow0KPiA+DQo+ID4gKyNkZWZpbmUgQ1BV
RlJFUV9QT0xJQ1lfVU5LTk9XTiAgICAgIDANCj4gPiArI2RlZmluZSBDUFVGUkVRX1BPTElDWV9Q
T1dFUlNBVkUgICAgMQ0KPiA+ICsjZGVmaW5lIENQVUZSRVFfUE9MSUNZX1BFUkZPUk1BTkNFICAy
DQo+ID4gKyNkZWZpbmUgQ1BVRlJFUV9QT0xJQ1lfT05ERU1BTkQgICAgIDMNCj4NCj4gV2l0aG91
dCBYRU5fIHByZWZpeGVzIHRoZXkgc2hvdWxkbid0IGFwcGVhciBpbiBhIHB1YmxpYyBoZWFkZXIu
IEJ1dCBkbyB3ZQ0KPiBuZWVkIC4uLg0KPg0KPiA+ICBzdHJ1Y3QgeGVuX2dldF9jcHBjX3BhcmEg
ew0KPiA+ICAgICAgLyogT1VUICovDQo+ID4gKyAgICB1aW50MzJfdCBwb2xpY3k7IC8qIENQVUZS
RVFfUE9MSUNZX3h4eCAqLw0KPg0KPiAuLi4gdGhlIG5ldyBmaWVsZCBhdCBhbGw/IENhbid0IHlv
dSBzeW50aGVzaXplIHRoZSBraW5kLW9mLWdvdmVybm9yIGludG8gc3RydWN0DQo+IHhlbl9nZXRf
Y3B1ZnJlcV9wYXJhJ3MgcmVzcGVjdGl2ZSBmaWVsZD8gWW91IGludm9rZSBib3RoIHN1Yi1vcHMg
ZnJvbSB4ZW5wbQ0KPiBub3cgYW55d2F5IC4uLg0KPg0KDQpNYXliZSBJIGNvdWxkIGJvcnJvdyBn
b3Zlcm5vciBmaWVsZCB0byBpbmRpY2F0ZSBwb2xpY3kgaW5mbywgbGlrZSB0aGUgZm9sbG93aW5n
IGluIHByaW50X2NwdWZyZXFfcGFyYSgpLCB0aGVuIHdlIGRvbid0IG5lZWQgdG8gYWRkIHRoZSBu
ZXcgZmlsZWQgInBvbGljeSINCmBgYA0KKyAgICAvKiBUcmFuc2xhdGUgZ292ZXJub3IgaW5mbyB0
byBwb2xpY3kgaW5mbyBpbiBDUFBDIGFjdGl2ZSBtb2RlICovDQorICAgIGlmICggaXNfY3BwY19h
Y3RpdmUgKQ0KKyAgICB7DQorICAgICAgICBpZiAoICFzdHJuY21wKHBfY3B1ZnJlcS0+dS5zLnNj
YWxpbmdfZ292ZXJub3IsDQorICAgICAgICAgICAgICAgICAgICAgICJvbmRlbWFuZCIsIENQVUZS
RVFfTkFNRV9MRU4pICkNCisgICAgICAgICAgICBwcmludGYoImNwcGMgcG9saWN5ICAgICAgICAg
ICA6IG9uZGVtYW5kXG4iKTsNCisgICAgICAgIGVsc2UgaWYgKCAhc3RybmNtcChwX2NwdWZyZXEt
PnUucy5zY2FsaW5nX2dvdmVybm9yLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJwZXJm
b3JtYW5jZSIsIENQVUZSRVFfTkFNRV9MRU4pICkNCisgICAgICAgICAgICBwcmludGYoImNwcGMg
cG9saWN5ICAgICAgICAgICA6IHBlcmZvcm1hbmNlXG4iKTsNCisNCisgICAgICAgIGVsc2UgaWYg
KCAhc3RybmNtcChwX2NwdWZyZXEtPnUucy5zY2FsaW5nX2dvdmVybm9yLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJwb3dlcnNhdmUiLCBDUFVGUkVRX05BTUVfTEVOKSApDQorICAgICAg
ICAgICAgcHJpbnRmKCJjcHBjIHBvbGljeSAgICAgICAgICAgOiBwb3dlcnNhdmVcbiIpOw0KKyAg
ICAgICAgZWxzZQ0KKyAgICAgICAgICAgIHByaW50ZigiY3BwYyBwb2xpY3kgICAgICAgICAgIDog
dW5rbm93blxuIik7DQorICAgIH0NCisNCmBgYA0KDQo+IEphbg0K

