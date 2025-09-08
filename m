Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9306B48C22
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 13:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115139.1461864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uva2g-000408-Vl; Mon, 08 Sep 2025 11:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115139.1461864; Mon, 08 Sep 2025 11:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uva2g-0003yd-SA; Mon, 08 Sep 2025 11:28:14 +0000
Received: by outflank-mailman (input) for mailman id 1115139;
 Mon, 08 Sep 2025 11:28:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TToE=3T=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uva2e-0003wI-LB
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 11:28:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2414::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5c774a5-8ca6-11f0-9809-7dc792cee155;
 Mon, 08 Sep 2025 13:28:10 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Mon, 8 Sep
 2025 11:28:07 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 11:28:07 +0000
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
X-Inumbo-ID: e5c774a5-8ca6-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktKrC/W+jM7OQU0krCxwTM3kG+tJpKHL0MDaf3R5+ihBegPSO/dD7XuEFkh69o/xENEK99VDESPLGUbsObJ39pja+VvnwMzYZUYeEu61Y4TKLIwkxk/E30CtpdE6/f91Py3gg2uP+G/x3T1o0LSTmScvNZYqV4ohnMgRiqVGio48HcTRxlbAVZUIIGwx6sTlZWh3Yn0hKAYrEMnJhdPxW/IkpQ51jnyogykspVYaY+eKLns1WhSWUhg0sJ+QSkI5unbAOplDU6ShmHAqvwS1mx5da/cPqafclR7YWOz5Z2xppkFzBvRHV6aQVZpRI52RRDwUTwU+unxS8hoFD5nQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoyQ8x6p+g7RdYaUQhtMj32/uMJDm9PKSEEcEs6idxU=;
 b=sj9QD2VPg97KDE2eYmTS5ONyguCBDn/212ZoCwJGpH8VGzmlo+18BgdDcEa1qH8ssgUsJXvZSIxcTBwdADURsRrcwuEGAVSQN2qVxcbpLBS3b+sKZPrXtAyl/cHlg7CI2H9w3NCsLQOEUDGMzAkDd5sbBgUDuaDeXnklfuWCfcrBAOXVt3VjZK/gpLmFk4XzGhOE9B9etEaIZ+M/8xwYMQb6GCMkqjxsz0hYP6OgOF+o1P0B8NxlT9FXz1d1bcM/imPzXn49piZywqw/nwF5u0EiQHNcIQxltBvTVSq+uqzUwAt+sDL4nIcSjaQWL13bR0Z4MBPJPCUKEZcYy1G6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoyQ8x6p+g7RdYaUQhtMj32/uMJDm9PKSEEcEs6idxU=;
 b=rdMnglztLVf/D+2utui4yOB2O5yvkna1YNKJJFscjMNMd8Whjvuf8y5QvASg9aNuiY63/XlE1ZohKPTr4HF6xxinn1N8jQuh34knvmXR+wq0f5zIIijrhKiDrA9g0FZ2dzz6j4PJmZeaINfIKE61MvxrJ4MOdFzn+TbOXoH3hMg=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Andryuk, Jason" <Jason.Andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
Thread-Topic: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct
 cpufreq_policy{}
Thread-Index: AQHcHWYoX5yLBs91qkCeYarmDUxFSLSC6XqAgAD6+DCABTACAIAADuWA
Date: Mon, 8 Sep 2025 11:28:07 +0000
Message-ID:
 <DM4PR12MB8451B46BE82513603E1CA5B8E10CA@DM4PR12MB8451.namprd12.prod.outlook.com>
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
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-08T11:27:56.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CH3PR12MB7716:EE_
x-ms-office365-filtering-correlation-id: 6579c82f-1b58-4308-faae-08ddeecac88b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnQ4RGVZd2dzMWR5c3VQdGpYU1pNWHZvS2tjdXhSY2FMVUdKQUlSb2xqNi9y?=
 =?utf-8?B?eXVjS2x1ZEF5dVIrVC82bUFsK2ZjQTBqM2hCZnhzcjlqZVF6T2VybHNhY2dU?=
 =?utf-8?B?a2JUYWZEdExpNmtlUmN2Q3FCRlVRMy9zOXcvdXI0dnZUMVlJMEZrR0pvazc4?=
 =?utf-8?B?YWxUcjBBa3VyTTBqZmUrL1ZaK2kzN1JqYVpIYncyY1VDblZxS01MdFhQS3o5?=
 =?utf-8?B?OFlSbVFIcE9sMnFxZGpyMzdLNm1JaGQ3dmVESjNSbVc1ZWtYSWh2OXRLVzFv?=
 =?utf-8?B?SWJNbE4rbDQzWWpRcVh2Znk2VGdITFNva0xpVjMxM0MxT0lHcnFkcnYyUDdo?=
 =?utf-8?B?amNrcnAvbXFnVVFiN1pRc2ZQMXpzeEZVellsSnlhOTFmMFc1WFppTC9kQnVS?=
 =?utf-8?B?QXpUZlBmRnhYSTBRNmw3Z0ZMR1dYWHF5RC9JSkEyRjFhTTduU3BCLzJRMmtO?=
 =?utf-8?B?R0o1UjhjUHRrMFVDS1hxU0tlMi8wM3p3VU1Yc3lZckxUUHlnSUJoNUpyQnRw?=
 =?utf-8?B?V2gwbmdqM2xHNllpTFVETEc1a0dkazcwUWpSbjNYRjJKTmhJeEtmN29HZkFr?=
 =?utf-8?B?UEd6VTNyY1d6d2Ezb3owbDMvM2dxakVWTE1QeU9EV3F6NXlQK2dKb3Nmc3I3?=
 =?utf-8?B?cmpVbU1BN2toNnZUWlpzNS9ENURITnlnRjhUajJXNkJOcFd5dmJmUFhPY3Ev?=
 =?utf-8?B?UWd5am93MXVScFRyKzk3b0M3dzZaUjJoa1Z0b0I4N2dkV2xkQjZRYXJNWjVK?=
 =?utf-8?B?Umt0RUo2TUpYUlkwRktiQlA5dmZEaEJEUkREZTNzdjNwRC9QRTh2M0ErQzNx?=
 =?utf-8?B?cEpSc3dYUEpVT01LWFFKVUhyQVJ6d0h1ajBxb0ozWjcvZ3FyMWg2RTZLd0F1?=
 =?utf-8?B?OXI4UERzREVxckxmUmp5U2haMHhZeFRGdndGZm81VVpkVFBubm9vTU1YaXBU?=
 =?utf-8?B?Y1JZR05qQU5IZkpsRXZ5NzAwTy9hbGN4V3EyVDFzL1dZTFRFd1R3QTVxb0Z4?=
 =?utf-8?B?RVNPYVJpYVpmK3kyZEtnUlhZWjZUK1Fqem1ZNmF4UEhNbDBNNWFjS21yNWpx?=
 =?utf-8?B?UUtTelJqN2h2Ylh0RndBZnI4cUNRZXFIb1Y0NTdBQ21qOHAvMzB3NWovaFBz?=
 =?utf-8?B?ZEdFUFR0bGJRS3VHbDUzbS9wVldTTGxyc1lseTJnU0JCRk5aVmtHSVUxSlFQ?=
 =?utf-8?B?WVZxekpycUhYUmRlWlROM2hxS0Z5UTZIOEh5SmIvNDFoc3l3SFk1NHFUNlli?=
 =?utf-8?B?Smo1S3dhREF1OFl5aHpjbE9VekNJN01hU2trdXhGZTJIckNmTE90M1JEZ0ZS?=
 =?utf-8?B?b3F5T2x4Yk0yR0pQYkpYS1EzWDgyMDkxbHdYUndaUVkrcmkraU82ZDFlQVBF?=
 =?utf-8?B?ZmxLRHd2SkFsK2dDMkxzM2xFQlh4VHdha0tERkp6eW54UlpuRXdiU1MvaEN0?=
 =?utf-8?B?YnZRU3lEQnd2WGs3aHFBYjhid3RkblU1NTVxNWNSdGxheDZqMXkxNUFVQVY0?=
 =?utf-8?B?V3JFNjN3ZEEyVXlST3dqb2VqenIzSmpXSlJCOUNRV084NEMvQXNjeEVhcStC?=
 =?utf-8?B?dzNSeXJmNmI1T0JGUXlsQWJSVUNiR0NSakdGc3VZVUEwV0Q3VjVTOU9Jay9W?=
 =?utf-8?B?em9JdUNoYjBCTzVrNTJqMWUrNHVNc3M2T01GcG5oNW5RV3FHN3RBTjhGODRF?=
 =?utf-8?B?ZStjV2cyd0pZblhyU3dKcUQ5dWV6Ri9QcHBkSE0zUU8xWno1N20vTG9qOWI3?=
 =?utf-8?B?NVBvUmRpblFYUEtoeVVsTjk4bEkzRjgrZEIrZVYyN1poVmd3L3JGMGswSk5L?=
 =?utf-8?B?T3IrbUNJSVlsbEIxSUorL2FCeTdDdzZDdUhkQ0Z3cUxyUlFHSXZVYVJWbmtH?=
 =?utf-8?B?aWpkL0dhSUpoU3h0OUtRWHBKa2lHNkxwbFBVUVZJYkVHdnFTOEplbVRqOWZP?=
 =?utf-8?Q?E5yKydR3wFc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVZSd3VSTmtlemE4ckNDalBFbWtVWFZ5YjBxRlJmOEZ2ZWZHRkZySmNjckhW?=
 =?utf-8?B?Q1pvU2dLQTFQNng3cXU5VFhUNkE1MGlta29QRVladGdVc3RlZ2ZGWXFQWUxK?=
 =?utf-8?B?RWhheTAwZC9WTEJscDNEb3hvV1FJdDNQaldHQmp3a1ppbnZaSDczellVenVH?=
 =?utf-8?B?ajM3Q0hBbW40emY3NVVZNFBRcmtFdDBUeFFHYjJpMmZUTXNqMzE0aEJWajFa?=
 =?utf-8?B?MzJFUUhvbno0S1M4bTFVTXltYXlmMlU3ejd6UThWU1laVW4wdUpNTk9WTGJr?=
 =?utf-8?B?R2RScnFINmhuL2tDcjJaUTFoQXVSN3AzSGRYWThZUFY4aWtNR1VtSE84QlQz?=
 =?utf-8?B?emtYamxaYlVpdVpFZ1VFaWE3U0NuWTBTM0YzR0VWK3M1Q3FPS0Q4VUM2MTQ2?=
 =?utf-8?B?WjhkOE5CUENKd2F5anBVU3Mxd0ZaYVE2V3pTcDBCcnEvamFvYTVxWXVJWW9T?=
 =?utf-8?B?OEFpTmF5Qm9hOGx5c1JWZTJ5RkY5OE90MzhQdDg1dS9JYnA2eDBJdmNCMFZ1?=
 =?utf-8?B?VzYvQkJnSEFuSFJNNUVNYndwUXRScDFXTytZaEx1ODZvOGFmMzYvU2tMeWha?=
 =?utf-8?B?U3NzQ0gwVnE4MEZpbVVzdHUrS29QRHA4blJBOUFjQlFyalhzeGtRZEdBaG5N?=
 =?utf-8?B?Wmx1NjNsVDc1TmJiRFRsY2JIcVRHTXJzVTh5QU9mMEpPeGRTaGRMV1ZPZE43?=
 =?utf-8?B?eWgwL0JxM0ZZQ0Y0SHJ5MDV5L0RiZVFUVHNuMmlvQzZFYXdOOG5qQ0tSQnUv?=
 =?utf-8?B?VTJMYnRZWUYvTjltUGprTDVocXM5QTgwS3RPNk81MHp0L2tIeGF1ZzFaRzJR?=
 =?utf-8?B?MU9ibXp4Znl4b0pRMUVnUzhXb2tCaDYwQk84L29uNTVwS3YvOHFQK1VEY05W?=
 =?utf-8?B?bGxta2JmYnROUm5XNE1jL3JjbUlyZWx2Nm0rUVpZcnVIdmNId0gwN08zYnly?=
 =?utf-8?B?V3Z4cDJoV1lWZU1rMTZaM2FYQ2lpNEdLYTFDQzVOdWJsc1FQWXA2aExJclg4?=
 =?utf-8?B?ajl5SkE2enhvMnJTSFpEaGdHMW9tN0kraXV1S1NDZlB3YVhQekYyMkJTcEZy?=
 =?utf-8?B?d0pYK3lCbFEvQURGV2RiRVZCMVBUcE9wU3NOdzlIc0xKdXdMVERCakFYd2cv?=
 =?utf-8?B?ZTBmOGJEWWlLUklGVHZsUk11by96TXYvOVlwaHNkUjl0UXY4a2dWYmtMclAr?=
 =?utf-8?B?Z3EycWt0alRZYkFBN0pkUnhEQkZKelprd2hVc2oyZFV1UmRQRm03RHNkdnZ0?=
 =?utf-8?B?YXlhNFZzQ1FpbHBpNTJUQUpHTURNTUtpdjF2Nm9TcTVmZmczekZpK3J1TmlR?=
 =?utf-8?B?TFVXRjE1eTZvQ2kyMEJlckNkMWhKTklRS3NIa0VOdi9jSXJhQVArbUFVQi9a?=
 =?utf-8?B?eTNPUU5DbjIyU2orbjBFczBOSUI3VUNMZGJaRDJxY1lMaG1GTHdBYWlxc2RS?=
 =?utf-8?B?UzVTSXlaN29QbUxhZlpBNmdzTnFBUHd6T1hJbEp1MDdCc0VwV2tvVnAwU2NS?=
 =?utf-8?B?V2dIYVQ1cGRESkNJNnNyRzgzSmNKUUV2TUlXQ0dQTCtVR3d2NnZUVWN6cEtK?=
 =?utf-8?B?aXUzaW45WUJNREdhbEdTMm9iK2JQaTZZc2MxVDh0ZmkvS1hkOWo3YnZLOWlE?=
 =?utf-8?B?ZlJPcDhSSEcrS2FJQktoSEVKbWtPTzZyQ1Z0YVVaakVROGpkS1BKY3B0QWhk?=
 =?utf-8?B?cU9MQUlhLzQ2N1dNZlMxRVo2cUhCRWVlaVVRM0pqUURFY21nVFNPcDU5MFhj?=
 =?utf-8?B?c2FaYlBIL3U5MjQ3SWI0dUs0L0pQUkExMjNnZlJ4ajcwVXNObTY0VjV4V2tx?=
 =?utf-8?B?V251eUxiSVFOVnZPWXJRVGZsQlpEcWtoeXdGWkN6MWg1WTRsTm4wSm5VWlNT?=
 =?utf-8?B?dzJiRGtYdTNwS3hSQkN6eC84WWQxcTRxRDJpcnVJZ1VsTVZCTDFiZmczUFhq?=
 =?utf-8?B?ZTE4SXBZQ0wrb3RocDV4Y2plTmR3WGc1dG0rWmtuQ3dIbmw5L2NaTy83YWhV?=
 =?utf-8?B?eG91dm9laFNjL21vUUNDUUhKMDBFNGNReUxIYWR2ci8rcWZhOUdiczMxbkhL?=
 =?utf-8?B?NnBLT00yTi9yYisvV1NLbUV2cVFYSHM0ZVNjSFR4TzQ1RVpQdHNqUTIwcGc0?=
 =?utf-8?Q?Qu+8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6579c82f-1b58-4308-faae-08ddeecac88b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 11:28:07.1695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9vAk5xjWLK1Ur+8P7JT11t5hXWpv76dvwAigs1kLjjDMksS16GD2s3T0R0dBz5UxdrhtUnNH3xqN5bV5RuXRHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDgsIDIw
MjUgNjowMiBQTQ0KPiBUbzogUGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBD
YzogQW5kcnl1aywgSmFzb24gPEphc29uLkFuZHJ5dWtAYW1kLmNvbT47IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDEvOF0geGVuL2NwdWZy
ZXE6IGVtYmVkIGh3cCBpbnRvIHN0cnVjdCBjcHVmcmVxX3BvbGljeXt9DQo+DQo+IChyZS1hZGRp
bmcgdGhlIGxpc3QpDQo+DQo+IE9uIDA1LjA5LjIwMjUgMDY6NTgsIFBlbm55LCBaaGVuZyB3cm90
ZToNCj4gPiBbUHVibGljXQ0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVGh1
cnNkYXksIFNlcHRlbWJlciA0LCAyMDI1IDc6NTEgUE0NCj4gPj4gVG86IFBlbm55LCBaaGVuZyA8
cGVubnkuemhlbmdAYW1kLmNvbT47IEFuZHJ5dWssIEphc29uDQo+ID4+IDxKYXNvbi5BbmRyeXVr
QGFtZC5jb20+DQo+ID4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAx
LzhdIHhlbi9jcHVmcmVxOiBlbWJlZCBod3AgaW50byBzdHJ1Y3QNCj4gPj4gY3B1ZnJlcV9wb2xp
Y3l7fQ0KPiA+Pg0KPiA+PiBPbiAwNC4wOS4yMDI1IDA4OjM1LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4gPj4+IEZvciBjcHVzIHNoYXJpbmcgb25lIGNwdWZyZXEgZG9tYWluLCBjcHVmcmVxX2RyaXZl
ci5pbml0KCkgaXMgb25seQ0KPiA+Pj4gaW52b2tlZCBvbiB0aGUgZmlyc3RjcHUsIHNvIGN1cnJl
bnQgcGVyLUNQVSBod3AgZHJpdmVyIGRhdGEgc3RydWN0DQo+ID4+PiBod3BfZHJ2X2RhdGF7fSBh
Y3R1YWxseSBmYWlscyB0byBiZSBhbGxvY2F0ZWQgZm9yIGNwdXMgb3RoZXIgdGhhbg0KPiA+Pj4g
dGhlIGZpcnN0IG9uZS4gVGhlcmUgaXMgbm8gbmVlZCB0byBtYWtlIGl0IHBlci1DUFUuDQo+ID4+
PiBXZSBlbWJlZCBzdHJ1Y3QgaHdwX2Rydl9kYXRhe30gaW50byBzdHJ1Y3QgY3B1ZnJlcV9wb2xp
Y3l7fSwgdGhlbg0KPiA+Pj4gY3B1cyBjb3VsZCBzaGFyZSB0aGUgaHdwIGRyaXZlciBkYXRhIGFs
bG9jYXRlZCBmb3IgdGhlIGZpcnN0Y3B1LA0KPiA+Pj4gbGlrZSB0aGUgd2F5IHRoZXkgc2hhcmUg
c3RydWN0IGNwdWZyZXFfcG9saWN5e30uIFdlIGFsc28gbWFrZSBpdCBhDQo+ID4+PiB1bmlvbiwg
d2l0aCAiaHdwIiwgYW5kIGxhdGVyICJhbWQtY3BwYyIgYXMgYSBzdWItc3RydWN0Lg0KPiA+Pg0K
PiA+PiBBbmQgQUNQSSwgYXMgcGVyIG15IHBhdGNoICh3aGljaCB0aGVuIHdpbGwgbmVlZCByZS1i
YXNpbmcpLg0KPiA+Pg0KPiA+Pj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQo+ID4+DQo+ID4+IE5vdCBxdWl0ZSwgdGhpcyByZWFsbHkgaXMgUmVwb3J0ZWQt
Ynk6IGFzIGl0J3MgYSBidWcgeW91IGZpeCwgYW5kIGluDQo+ID4+IHR1cm4gaXQgYWxzbyB3YW50
cyB0byBnYWluIGEgRml4ZXM6IHRhZy4gVGhpcyBhbHNvIHdpbGwgbmVlZCBiYWNrcG9ydGluZy4N
Cj4gPj4NCj4gPj4gSXQgd291bGQgYWxzbyBoYXZlIGJlZW4gbmljZSBpZiB5b3UgaGFkIENjLWVk
IEphc29uIHJpZ2h0IGF3YXksDQo+ID4+IHNlZWluZyB0aGF0IHRoaXMgY29kZSB3YXMgYWxsIHdy
aXR0ZW4gYnkgaGltLg0KPiA+Pg0KPiA+Pj4gQEAgLTI1OSw3ICsyNTgsNyBAQCBzdGF0aWMgaW50
IGNmX2NoZWNrIGh3cF9jcHVmcmVxX3RhcmdldChzdHJ1Y3QNCj4gPj4gY3B1ZnJlcV9wb2xpY3kg
KnBvbGljeSwNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgcmVsYXRpb24pICB7DQo+ID4+PiAgICAgIHVuc2lnbmVkIGludCBjcHUgPSBw
b2xpY3ktPmNwdTsNCj4gPj4+IC0gICAgc3RydWN0IGh3cF9kcnZfZGF0YSAqZGF0YSA9IHBlcl9j
cHUoaHdwX2Rydl9kYXRhLCBjcHUpOw0KPiA+Pj4gKyAgICBzdHJ1Y3QgaHdwX2Rydl9kYXRhICpk
YXRhID0gcG9saWN5LT51Lmh3cDsNCj4gPj4+ICAgICAgLyogWmVybyBldmVyeXRoaW5nIHRvIGVu
c3VyZSByZXNlcnZlZCBiaXRzIGFyZSB6ZXJvLi4uICovDQo+ID4+PiAgICAgIHVuaW9uIGh3cF9y
ZXF1ZXN0IGh3cF9yZXEgPSB7IC5yYXcgPSAwIH07DQo+ID4+DQo+ID4+IEZ1cnRoZXIgZG93biBp
biB0aGlzIHNhbWUgZnVuY3Rpb24gd2UgaGF2ZQ0KPiA+Pg0KPiA+PiAgICAgb25fc2VsZWN0ZWRf
Y3B1cyhjcHVtYXNrX29mKGNwdSksIGh3cF93cml0ZV9yZXF1ZXN0LCBwb2xpY3ksIDEpOw0KPiA+
Pg0KPiA+PiBUaGF0J3Mgc2ltaWxhcmx5IHByb2JsZW1hdGljIHdoZW4gdGhlIENQVSBkZW5vdGVk
IGJ5IHBvbGljeS0+Y3B1DQo+ID4+IGlzbid0IG9ubGluZSBhbnltb3JlLiAoSXQncyBub3QgcXVp
dGUgY2xlYXIgd2hldGhlciBhbGwgcmVsYXRlZA0KPiA+PiBpc3N1ZXMgd291bGQgd2FudCBmaXhp
bmcgdG9nZXRoZXIsIG9yIGluIG11bHRpcGxlIHBhdGNoZXMuKQ0KPiA+DQo+ID4gQ2hlY2tpbmcg
dGhlIGxvZ2ljIGluIGNwdWZyZXFfZGVsX2NwdSgpLCBvbmNlIGFueSBwcm9jZXNzb3IgaW4gdGhl
DQo+ID4gZG9tYWluIGdldHMgb2ZmbGluZSwgdGhlIGdvdmVybm9yIHdpbGwgc3RvcC4NCj4NCj4g
WWV0IHdpdGggSFdQIGFuZCBDUFBDIGRyaXZlcnMgYmVpbmcgZ292ZXJub3ItbGVzcywgaG93IHdv
dWxkIHRoYXQgbWF0dGVyPw0KDQpJbiBDUFBDIHBhc3NpdmUgbW9kZSwgd2UgYXJlIHN0aWxsIHJl
bHlpbmcgb24gZ292ZXJub3IgdG8gZG8gcGVyZm9ybWFuY2UgdHVuaW5nLg0KSW4gQ1BQQyBhY3Rp
dmUgbW9kZSwgeWVzLCBpdCBpcyBnb3Zlcm5vci1sZXNzLCBob3cgYWJvdXQgd2UgZGlzYWJsZSB0
aGUgQ1BQQy1lbmFibGUgYml0IGZvciB0aGUgb2ZmbGluZSBjcHVzPw0KDQo+IHN0aWxsIGJlIGVm
ZmVjdGl2ZS4gV2hpY2ggaXMgYWxzbyBjb21wbGllcyB0byB0aGUgZGVzY3JpcHRpb24gaW4gX1BT
RCBBQ1BJIFNQRUMgZm9yDQo+ICJOdW0gUHJvY2Vzc29ycyIgWzFdOg0KPiA+IGBgYA0KPiA+IFRo
ZSBudW1iZXIgb2YgcHJvY2Vzc29ycyBiZWxvbmdpbmcgdG8gdGhlIGRvbWFpbiBmb3IgdGhpcyBs
b2dpY2FsIHByb2Nlc3NvcuKAmXMgUC0NCj4gc3RhdGVzLiBPU1BNIHdpbGwgbm90IHN0YXJ0IHBl
cmZvcm1pbmcgcG93ZXIgc3RhdGUgdHJhbnNpdGlvbnMgdG8gYSBwYXJ0aWN1bGFyIFAtc3RhdGUN
Cj4gdW50aWwgdGhpcyBudW1iZXIgb2YgcHJvY2Vzc29ycyBiZWxvbmdpbmcgdG8gdGhlIHNhbWUg
ZG9tYWluIGhhdmUgYmVlbiBkZXRlY3RlZA0KPiBhbmQgc3RhcnRlZC4NCj4gPiBgYGANCj4gPiBb
MV0NCj4gPiBodHRwczovL3VlZmkub3JnL3NwZWNzL0FDUEkvNi41LzA4X1Byb2Nlc3Nvcl9Db25m
aWd1cmF0aW9uX2FuZF9Db250cm9sDQo+ID4gLmh0bWw/aGlnaGxpZ2h0PWNwcGMjcHN0YXRlZGVw
ZW5kZW5jeS1wYWNrYWdlLXZhbHVlcw0KPiA+DQo+ID4gSSBrbm93IHRoYXQgQU1EIENQUEMgaXMg
b2JleWluZyB0aGUgX1BTRCBkZXBlbmRlbmN5IHJlbGF0aW9uIHRvbywgZXZlbiBpZg0KPiBib3Ro
IENQUEMgUmVxdWVzdCByZWdpc3RlciAoY2NkWzE1OjBdX2x0aHJlZTBfY29yZVs3OjBdX3RocmVh
ZFsxOjBdOw0KPiBNU1JDMDAxXzAyQjMpIGFuZCBDUFBDIENhcGFiaWxpdHkgUmVnaXN0ZXINCj4g
KF9jY2RbMTU6MF1fbHRocmVlMF9jb3JlWzc6MF1fdGhyZWFkWzE6MF07IE1TUkMwMDFfMDJCMCkg
aXMgUGVyLXRocmVhZCBNU1IuDQo+ID4gSSBkb24ndCBoYXZlIHRoZSBoYXJkd2FyZSB0byB0ZXN0
ICJzaGFyaW5nIiBsb2dpYy4gQWxsIG15IHBsYXRmb3JtIHNheXMgIkhXX0FMTCINCj4gaW4gX1BT
RC4NCj4NCj4gQWl1aSB0aGF0J3Mgbm90IG1hbmRhdGVkIGJ5IHRoZSBDUFUgc3BlYywgdGhvdWdo
LiBQbHVzIEhXX0FMTCBzdGlsbCBkb2Vzbid0IHNheQ0KPiBhbnl0aGluZyBhYm91dCB0aGUgc2Nv
cGUvc2l6ZSBvZiBlYWNoIGRvbWFpbi4NCj4NCj4gSmFuDQo=

