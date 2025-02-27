Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2669A47619
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 07:55:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897794.1306423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnXmU-000250-6M; Thu, 27 Feb 2025 06:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897794.1306423; Thu, 27 Feb 2025 06:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnXmU-000230-2j; Thu, 27 Feb 2025 06:54:02 +0000
Received: by outflank-mailman (input) for mailman id 897794;
 Thu, 27 Feb 2025 06:54:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vf79=VS=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tnXmT-00022u-4F
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 06:54:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e33517a-f4d7-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 07:53:59 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 06:53:54 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 06:53:53 +0000
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
X-Inumbo-ID: 9e33517a-f4d7-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5NtBCPM9ry2gvjTCBZROTYJD2GVmDIlWv4bNIdZe1XefRbyUgrcGp6XDnvx/w2fT9YX+fZ4OLQ9U0XI66cN0JDqjITIyCBzrcKolKjnCP2/d/I3Z/8ds/rh+kTB21Iy9gYyYfSxvlvs5Tuu0/+oU3FBI7DZwQhPkdJk1iZkZ3DabsvKGEsnHHiYNaiczdyDcs7oixnsyCFVdbfINfUa/Wfou7/bz+kv6hFi9CQUYZdlVyfJtvIT8caaIzIY7fob43CRnoy1RpNJOJI7gMuRjxMb/8LDq/XPt3gvqT+TvVqZXn6web86Y6vk9MvXGy3+Hc9qP8EgijVBOJe9GAwXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVkitbJsKQoQLTTlQPgS7n8Cmo78g4N7NvRa0cmyOv4=;
 b=GUAKkfDlfV9J+bGb0AgB/iKeLIJQ9+aTVpId8lDbiz9VqUatvx7mdpP2ZIOY5d0vTeDzYSYtJiAj2KPcInoTHz11f51JgIIJkVBNQOsTVrvOhJvKoz86luFxvEB0ys3khpjnTcah57QEPhTihIahcg2qy7YJN5u24o5dWeQQ/vSLiBBpFLuMOUj8DjolWo1F8Hb24cqOelIA1HAacN1HbSTUbLaOMAqBMSfBdLTqO962PFD5UrzR2/qaBuHdB+ZbpnKod9ajsqdKUex3zPcisexc2jkfWDCJNa/YvB43VXpxIS7Cs5Hg8EVQUaxa/KcOYXMYLOqnPnupRGr3wC3ahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVkitbJsKQoQLTTlQPgS7n8Cmo78g4N7NvRa0cmyOv4=;
 b=MMOQ/Q6zKSai8keMQm1rvwsDCCURSY0zOqC5T+cBVdG4hPE1EYgWrknvLt3NR/kjcAH4Jo5nlCWez3TS4JeOPadKGzK3gSBvN5PGgdYFHaca68FIW0wwuksT1bpyRhrTY5VuGhAr4W7k1y3p44p6OjvGrzH6SpVtWQH5oYZ7m0E=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "Andryuk, Jason"
	<Jason.Andryuk@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Topic: [PATCH v2 05/11] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
Thread-Index: AQHbeHHP6s77OhtOyESwm9UCfT4CR7NCV/0AgBh3PRA=
Date: Thu, 27 Feb 2025 06:53:53 +0000
Message-ID:
 <DM4PR12MB8451A44498B3B0E990DED17CE1CD2@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-6-Penny.Zheng@amd.com>
 <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
In-Reply-To: <0fe9e3b1-3d2c-4ddf-87c4-b0de2a586182@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=058cab87-2639-4e39-b779-31cdd51ff91a;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-02-27T06:23:10Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH7PR12MB5877:EE_
x-ms-office365-filtering-correlation-id: bf95d3d6-a661-47cc-4477-08dd56fb7fe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHJKTDBIaWZ1N2pKbStWN2h4OUl4ZXV2dkFBbVViSDVFS2RTQU9NU0FLZEdH?=
 =?utf-8?B?K3dZc2N4VVR1bWd6dDdJUnpFTGFMMkxoVGpkaGZzN2ZabEZhNmwxWEhvcUt5?=
 =?utf-8?B?WnBEYmF1UmZDZUF0Q1hYdHYrTFZKdWpydVRhQitsRmwwVkhtdFZyTld2a0cy?=
 =?utf-8?B?S2ovRjg4dCtVeUlldDFDU2VHaktHaHY3bjAzQnNJNGRVQStFZm9SVnlQMUZD?=
 =?utf-8?B?Y3o4NlRucm11WG9XNUhtdjVQZ2oxajhzZzYxaDlZZ0Y2WDlJVkJrSnNTNUMv?=
 =?utf-8?B?bFpqRithQVNjWkZITTNyVXNlaXFlamtYbGNoNkpqT1ZpQVp4eWVJQmR5MTlh?=
 =?utf-8?B?cis5Sk1ra3UwQ3Rmbm5mNG1QU3lyeTZ4RkF3RU83bzVQSVIzNERVb2hZMXEv?=
 =?utf-8?B?U0IwdDd5aFg5dlcxYkU5c0ZIeGhDQlY2Q3NOTjFZMlZ5VmlpSk1kbzlvWGVm?=
 =?utf-8?B?WVhBdHBvNkpHc0YzZlI4NmhsWU44ZGgrRXVFVkNWUCsyYVB5YWdPVTMxNXdS?=
 =?utf-8?B?ZGFXc2gzUjRkNXRRbFQyMHh3RnR4OWxOY2w2dytKdWlrb3FpNXp6QWZSSGo1?=
 =?utf-8?B?UHVlbVM2bG84VXpEdTJDOWlCa0R5RjQxdjBZZ21USVhDQ3BpZ2JoTjhCL1Jy?=
 =?utf-8?B?ZXJkTGptWkU4aDVjZVdLNVcyV1lJc1hUc3B3WGtIMUljY0RUNGE4MmZvWDVY?=
 =?utf-8?B?WXgySEJ5R2c4TUVsQ21sZ3M5REJ4c3pJTzUwTXpqQi9KWjhsSXVReE1OQkxR?=
 =?utf-8?B?LzVRSVBUWmh1L28wbFpzb0R1N0FqdVVwR29mR0RaWEJzUXdldHU3UnJRbDR0?=
 =?utf-8?B?Z1ZZMFNFZHFXeWJDeUZyNGplZGY5MCttRlhpU2ZiQmdzSFhaSG9NT010NnZy?=
 =?utf-8?B?SWtWOGtSNndCRTAyZ2NrMVcwNHM4MEtEd0JvZFNSeEg0L3ZJdzR0VFpNYWVH?=
 =?utf-8?B?Q2kyUmNudG5DUDhXanFIMHk3eXZzcHpFRlhNVmpKRVIzQnhhb3pydDE4WGFT?=
 =?utf-8?B?dkF2VUhJRmQzR1VXTjRWby8zSWh5Uk56UUFQeFo5MElqdmNQTkhyRDFSMktS?=
 =?utf-8?B?VC9kTEkvczJOSGZCU2dNTE52bkdFb3d1WWFoWVNCWHFTR2xkMEwwWXY1dCtw?=
 =?utf-8?B?MENKWG9yckQzNWVvckRmbzJoR2ZSNStxTnA0K3BTT0VnZGRQWnd0TkpYeWcv?=
 =?utf-8?B?ME1YeDhLS25VeklFcFNVSUNHY3YwUG4wQStRWnY1RmJhL0p5NTZ1eWV3S04w?=
 =?utf-8?B?amhGc0EyVEl4ZVk3WEdOc1FmUjVXZGxzTmphMDVhTURPZUppcUJwS3JTdzM3?=
 =?utf-8?B?SW1GYWpyaDZtVlpua0czZUtUeHZuNWRsVlpTbXdON3h4M3JPbmFmNCtlc1hR?=
 =?utf-8?B?c21QZWtUSlZKMDRIRnZ0K0czYnJRNytuZlVzWG5nNU9Yd0dBV3FXT1JBeXpX?=
 =?utf-8?B?Kzc5YTh4SUp2R3dNdkdPVHVoU3hOOTYydmhualBTczg0TEppUzhqVnd5Z0Vm?=
 =?utf-8?B?WDJzQmhIR2lTMG94eC9ZMk5aZ0JkZ0cvUHBIemtvSngwQzRiM1M3WUNqKzFO?=
 =?utf-8?B?aUVzWDBBVU5uTjBuRmdHaGNlRG83N2xpNW9NTk5ZcFM3bVVFeDRVb01PY3VX?=
 =?utf-8?B?SmNTck5hS0xtWFJhOVAvTFQvT0FPaE5VZjg5SVRNVzIrVWxvSWtsU3lrbmQ0?=
 =?utf-8?B?YmE4eDdibUhXQzBZNFY0S1RNYSt0R1duWk9XMWlUdXZ0TjNibXl1UkRwa2FL?=
 =?utf-8?B?cWFFT0N3Yi9UTGJ5S2cxUXBwMkJEbDl4SlpGRFdTM2NQSUNZOHM0SUN5ckNp?=
 =?utf-8?B?UGs4N2YrVk1CaEx2elhpWlRSOVhwR05VdWJNc0dVd0hpamtaNTNVcjAzdG83?=
 =?utf-8?B?TUh1TkQ5YjVuNjhxWFB6Sm93VXFoc2pIL0lDcDM2VXY4cjNFcUFnZFJBVFky?=
 =?utf-8?Q?WjkUHwhY2A8NWIxHiQ3njXgWbbkcDnSd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVJyTkdWTEp2azN4T2VOdktQakpHWnk2Mks2Um9TVjV3bHk0SFFjNEtZS3lH?=
 =?utf-8?B?WVp4QndmOXVUSit2cUV4WE5wRzdSdXZmVXZVT0VGRGV2MEQ0NEdEK1FGYkZY?=
 =?utf-8?B?N2JyL2V1cDRMK09xYm0rVHdsSkxwZWJPZmtwSXpoTWN1UmpyQ0JWWmtaZHdJ?=
 =?utf-8?B?a05MOEtxSDBVVFR5TnJLalJNUDE5MFc1eG9DNS9pNlJkVkh2Z2FreXJoK1dr?=
 =?utf-8?B?MUNWbzFMWDBGcTB5aXVPa3NYQnVwSHNxNzFFRGVEMm5qTFo3ZG9RVERFeW9Y?=
 =?utf-8?B?N2UyNVlKc0I1SWN1OHJxd1B1U1lrNzl2cVc0OVN3NElwUEYrMXM1djZac1k4?=
 =?utf-8?B?ZXNmT1k1MlY0QjlSVE1LN0VuZUlvaEo2Z0d5VWp5N3k4WlNWTSs3UHBtZU4y?=
 =?utf-8?B?UFpJNWF3OCtMQnZqMEQyb0xaT0YyT0ptRFJwaTFZRzBpeXArOXNOZ3VhbjV3?=
 =?utf-8?B?RnRtTnQ1QVpwRERnNk4xNzhwV0F3NElVbkZoZmdERXZQYlBZYVpNd2xaMFJX?=
 =?utf-8?B?cCsrNGJEWU9Qc0MvR3ZESm9nVFZaVjZNZE92c1FCbjFBVmIzTTBPclRPNnJR?=
 =?utf-8?B?RjV6ZnNXZXQzbnR4eGJNYTl6eFNRazJEdXU2UUUya3VneWZNdU5IWlRtN3ps?=
 =?utf-8?B?eThVY2s1bjZVLzdKa2p0dzQyREovMmhoZVNMOTNtcm5CMnlubmd3NFVvaEhO?=
 =?utf-8?B?UHA0MlhiU1MraVpId2NLSTVtV2d6aTJibWwwNk1IbUd4a0FQWmJyckdKZlVo?=
 =?utf-8?B?ZGptSVNHU1N6Q2dFUXVQaGFRSGFNSzZjcitSdFdxSTgydjloK25QZDVrUW5j?=
 =?utf-8?B?aE9mb1dKSEtZWU5OVXBXZnFPRWQ2S0Erbi90cjgybWJ5MVE4L3Ftd3oyaWZP?=
 =?utf-8?B?WWVkUkJxQ01lYWd2UXNhYkV4WCtJMkUzdDJMM1JxOTB0RjZPU055WFhDaXVP?=
 =?utf-8?B?ZWd0UTdaU0ZpOU1IMHpoU3U4L1VIYk41MTdoL0N3ZE9NajhEclRoNkkydjNS?=
 =?utf-8?B?UmRlNXE0TDEzdmlZc2s2ZlNNbEthWC8wT0szRUoxUks1RGExZVRSSjVPdm5C?=
 =?utf-8?B?TzBHak5qYkgvb1UzWlR1TlRtKzljSU5RdHdxVWtEYTB1ODB3dng3SERQNURv?=
 =?utf-8?B?Ly9rL1FtemtPZWVaZFozUWlwUDU2RGhWdWhUY3JsTTZjdDZBa2UwaWVXV0wr?=
 =?utf-8?B?SkNTUzdscEVWeldyTXhpRVI2MmhVR0FCOUlET1I0ZElHVDI5c1kxNDIrVnBL?=
 =?utf-8?B?WjhkUHFjUEk1RWgrYzRXbmwrQ2ZsaEtHdGV3dDRkcjFsMWcyNVN2ZHJsaERV?=
 =?utf-8?B?MHFkZ3lib2tmcktPSmY0YXIxYjRyeUpMcEtpQzd0S2RQTlB4citjQWE0T1FI?=
 =?utf-8?B?MjV3dExweVlhdUViUVk4R3JFN1BIZVB3aFovT1ljWXZnWU1QOUtnUlBZanh4?=
 =?utf-8?B?OXVlTTFSVnFlYk5iUitpNTNaVU1rOFFXRmozYUtXZ01uQis5dkYvYllVa29P?=
 =?utf-8?B?Ums2anJ2Vk91NVhURkUraXdPL2MwcUxXb0pSdVNDd0EwdXRwaWoxT3Y5WHQ1?=
 =?utf-8?B?U0JLYStNcmxCSjlIbDlaRkRBV2sxMEMrZXNCa3FHcGQyS0hzc0o4VjJic1Iw?=
 =?utf-8?B?UWUrSTRwcjBha3hJVzVIQy90RmhzakhmRGt3OWhYVG1EWnAxbXlnNEdsR1Rt?=
 =?utf-8?B?MUsrR29kVGRhMVB0Z3A4VDI3bGdUZnk1eXZjMmxqcWFrczg5TDY3SU1udzhD?=
 =?utf-8?B?QzNjdkJvOU1RNWhVOVMwM0RRSmx2QndHQ0RPU0pUZUVMSzBvZk52S01HSmIv?=
 =?utf-8?B?OHhubkpwbHUrd0tTWTUrSmlrYVJxRVJ5cytxbDFkTHpONWx5dWtIMk81blJQ?=
 =?utf-8?B?cjhXbEFKMGdBeWpwQU9QaE5Nd2NsMGRxNU9yb1crNllYVFZXaVAvK1ZVMEpX?=
 =?utf-8?B?ZTc3ZklKSnh0ZldKSlpyTFZnZ01KS1I3WEdqWDM2eU5GNDNoQU9zNDRWTCty?=
 =?utf-8?B?My9VQy9nTllVeFJqMEtDVXVveVo5Y3A4UE1pOTRFbUtvbEN1aFVVdTN4SFBH?=
 =?utf-8?B?b28yd05MTmFnMjNVUGZYdTV0WFczOFh4dW5TMjlyeTNCTmFGdXBpcURwVk5S?=
 =?utf-8?Q?ebh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf95d3d6-a661-47cc-4477-08dd56fb7fe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 06:53:53.8743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3mRMC5Oh8ti+ihDej1yXZ3dp4lzpwqEGq+a9kYWiv7C8ezFwlm5cTwvL/nHMRWni5Nimacz95qK+vw4EztnLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877

W1B1YmxpY10NCg0KSGksDQoNClNvcnJ5IGZvciB0aGUgY29uZmlkZW50aWFsIGhlYWRlciBiZWZv
cmUuIEkgZmluYWxseSBsZWFybmVkIGhvdyB0byByZW1vdmUgdGhlbS4uLg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAxMiwgMjAyNSAxMjo0NiBBTQ0KPiBUbzog
UGVubnksIFpoZW5nIDxwZW5ueS56aGVuZ0BhbWQuY29tPg0KPiBDYzogSHVhbmcsIFJheSA8UmF5
Lkh1YW5nQGFtZC5jb20+OyBBbmRyeXVrLCBKYXNvbg0KPiA8SmFzb24uQW5kcnl1a0BhbWQuY29t
PjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47DQo+IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDUvMTFdIHhlbi94ODY6IGludHJvZHVj
ZSBhIG5ldyBhbWQgY3BwYyBkcml2ZXIgZm9yDQo+IGNwdWZyZXEgc2NhbGluZw0KPg0KPiBPbiAw
Ni4wMi4yMDI1IDA5OjMyLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vYXJjaC94
ODYvYWNwaS9jcHVmcmVxL2FtZC1jcHBjLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9j
cHVmcmVxL2FtZC1jcHBjLmMNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBjZl9jaGVj
ayBhbWRfY3BwY193cml0ZV9yZXF1ZXN0KGludCBjcHUsIHVpbnQ4X3QgbWluX3BlcmYsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGRlc19w
ZXJmLCB1aW50OF90DQo+ID4gK21heF9wZXJmKSB7DQo+ID4gKyAgICBzdHJ1Y3QgYW1kX2NwcGNf
ZHJ2X2RhdGEgKmRhdGEgPSBwZXJfY3B1KGFtZF9jcHBjX2Rydl9kYXRhLCBjcHUpOw0KPiA+ICsg
ICAgdWludDY0X3QgcHJldiA9IGRhdGEtPnJlcS5yYXc7DQo+ID4gKw0KPiA+ICsgICAgZGF0YS0+
cmVxLm1pbl9wZXJmID0gbWluX3BlcmY7DQo+ID4gKyAgICBkYXRhLT5yZXEubWF4X3BlcmYgPSBt
YXhfcGVyZjsNCj4gPiArICAgIGRhdGEtPnJlcS5kZXNfcGVyZiA9IGRlc19wZXJmOw0KPiA+ICsN
Cj4gPiArICAgIGlmICggcHJldiA9PSBkYXRhLT5yZXEucmF3ICkNCj4gPiArICAgICAgICByZXR1
cm4gMDsNCj4gPiArDQo+ID4gKyAgICBvbl9zZWxlY3RlZF9jcHVzKGNwdW1hc2tfb2YoY3B1KSwg
YW1kX2NwcGNfd3JpdGVfcmVxdWVzdF9tc3JzLA0KPiA+ICsgZGF0YSwgMSk7DQo+ID4gKw0KPiA+
ICsgICAgcmV0dXJuIGRhdGEtPmVycjsNCj4gPiArfQ0KPg0KPiAuLi4gaW4gdGhpcyBmdW5jdGlv
bi4gVGhlbiB0aGUgZmllbGQgd291bGQgYmUgd3JpdHRlbiB0byAoYW5kIHRoZSBjYWNoZWxpbmUg
Y2hhbmdlDQo+IG93bmVyc2hpcCkgb25seSBpbiB0aGUgZXJyb3IgY2FzZS4NCj4NCj4gQXMgdG8g
dGhlIGZ1bmN0aW9uJ3MgcGFyYW1ldGVycyAtIHdoeSdzIHRoZXJlIGEgcGxhaW4gaW50Pw0KPg0K
DQpBcmUgeW91IGFza2luZyB3aHkgImludCBjcHUiIGhlcmU/DQoNCj4gPiArICAgIC8qIFBhY2th
Z2UgbGV2ZWwgTVNSICovDQo+ID4gKyAgICBpZiAoIHJkbXNyX3NhZmUoTVNSX0FNRF9DUFBDX0VO
QUJMRSwgdmFsKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgYW1kX2NwcGNfZXJyKHBvbGlj
eS0+Y3B1LCAicmRtc3Jfc2FmZShNU1JfQU1EX0NQUENfRU5BQkxFKVxuIik7DQo+ID4gKyAgICAg
ICAgZ290byBlcnI7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAq
IE9ubHkgd2hlbiBFbmFibGUgYml0IGlzIG9uLCB0aGUgaGFyZHdhcmUgd2lsbCBjYWxjdWxhdGUg
dGhlIHByb2Nlc3NvcuKAmXMNCj4gPiArICAgICAqIHBlcmZvcm1hbmNlIGNhcGFiaWxpdGllcyBh
bmQgaW5pdGlhbGl6ZSB0aGUgcGVyZm9ybWFuY2UgbGV2ZWwgZmllbGRzIGluDQo+ID4gKyAgICAg
KiB0aGUgQ1BQQyBjYXBhYmlsaXR5IHJlZ2lzdGVycy4NCj4gPiArICAgICAqLw0KPiA+ICsgICAg
aWYgKCAhKHZhbCAmIEFNRF9DUFBDX0VOQUJMRSkgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAg
IHZhbCB8PSBBTURfQ1BQQ19FTkFCTEU7DQo+ID4gKyAgICAgICAgaWYgKCB3cm1zcl9zYWZlKE1T
Ul9BTURfQ1BQQ19FTkFCTEUsIHZhbCkgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAg
ICAgYW1kX2NwcGNfZXJyKHBvbGljeS0+Y3B1LA0KPiAid3Jtc3Jfc2FmZShNU1JfQU1EX0NQUENf
RU5BQkxFLCAlbHgpXG4iLCB2YWwpOw0KPiA+ICsgICAgICAgICAgICBnb3RvIGVycjsNCj4gPiAr
ICAgICAgICB9DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgaWYgKCByZG1zcl9zYWZlKE1T
Ul9BTURfQ1BQQ19DQVAxLCBkYXRhLT5jYXBzLnJhdykgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAg
ICAgIGFtZF9jcHBjX2Vycihwb2xpY3ktPmNwdSwgInJkbXNyX3NhZmUoTVNSX0FNRF9DUFBDX0NB
UDEpXG4iKTsNCj4gPiArICAgICAgICBnb3RvIGVycjsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4g
KyAgICBpZiAoIGRhdGEtPmNhcHMuaGlnaGVzdF9wZXJmID09IDAgfHwgZGF0YS0+Y2Fwcy5sb3dl
c3RfcGVyZiA9PSAwIHx8DQo+ID4gKyAgICAgICAgIGRhdGEtPmNhcHMubm9taW5hbF9wZXJmID09
IDAgfHwgZGF0YS0+Y2Fwcy5sb3dlc3Rfbm9ubGluZWFyX3BlcmYgPT0gMCApDQo+ID4gKyAgICB7
DQo+ID4gKyAgICAgICAgYW1kX2NwcGNfZXJyKHBvbGljeS0+Y3B1LA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAiUGxhdGZvcm0gbWFsZnVuY3Rpb24sIHJlYWQgQ1BQQyBoaWdoZXN0X3BlcmY6
ICV1LA0KPiBsb3dlc3RfcGVyZjogJXUsIG5vbWluYWxfcGVyZjogJXUsIGxvd2VzdF9ub25saW5l
YXJfcGVyZjogJXUgemVybyB2YWx1ZVxuIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgZGF0
YS0+Y2Fwcy5oaWdoZXN0X3BlcmYsIGRhdGEtPmNhcHMubG93ZXN0X3BlcmYsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGRhdGEtPmNhcHMubm9taW5hbF9wZXJmLCBkYXRhLT5jYXBzLmxvd2Vz
dF9ub25saW5lYXJfcGVyZik7DQo+ID4gKyAgICAgICAgZ290byBlcnI7DQo+ID4gKyAgICB9DQo+
ID4gKw0KPiA+ICsgICAgZGF0YS0+ZXJyID0gYW1kX2dldF9taW5fZnJlcShkYXRhLCAmbWluX2Zy
ZXEpOw0KPiA+ICsgICAgaWYgKCBkYXRhLT5lcnIgKQ0KPiA+ICsgICAgICAgIHJldHVybjsNCj4g
PiArDQo+ID4gKyAgICBkYXRhLT5lcnIgPSBhbWRfZ2V0X25vbWluYWxfZnJlcShkYXRhLCAmbm9t
aW5hbF9mcmVxKTsNCj4gPiArICAgIGlmICggZGF0YS0+ZXJyICkNCj4gPiArICAgICAgICByZXR1
cm47DQo+ID4gKw0KPiA+ICsgICAgZGF0YS0+ZXJyID0gYW1kX2dldF9tYXhfZnJlcShkYXRhLCAm
bWF4X2ZyZXEpOw0KPiA+ICsgICAgaWYgKCBkYXRhLT5lcnIgKQ0KPiA+ICsgICAgICAgIHJldHVy
bjsNCj4gPiArDQo+ID4gKyAgICBpZiAoIG1pbl9mcmVxID4gbWF4X2ZyZXEgKQ0KPiA+ICsgICAg
ew0KPiA+ICsgICAgICAgIGFtZF9jcHBjX2Vycihwb2xpY3ktPmNwdSwgIm1pbl9mcmVxKCV1KSBv
ciBtYXhfZnJlcSgldSkgdmFsdWUgaXMNCj4gaW5jb3JyZWN0XG4iLA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICBtaW5fZnJlcSwgbWF4X2ZyZXEpOw0KPiA+ICsgICAgICAgIGdvdG8gZXJyOw0K
PiA+ICsgICAgfQ0KPg0KPiBBbmQgbm9taW5hbCBmcmVxIG5vdCBiZWluZyBiZXR3ZWVuIHRoZSB0
d28gaXMgb2theT8NCj4NCj4gPiArICAgIHBvbGljeS0+bWluID0gbWluX2ZyZXE7DQo+ID4gKyAg
ICBwb2xpY3ktPm1heCA9IG1heF9mcmVxOw0KPiA+ICsNCj4gPiArICAgIHBvbGljeS0+Y3B1aW5m
by5taW5fZnJlcSA9IG1pbl9mcmVxOw0KPiA+ICsgICAgcG9saWN5LT5jcHVpbmZvLm1heF9mcmVx
ID0gbWF4X2ZyZXE7DQo+ID4gKyAgICBwb2xpY3ktPmNwdWluZm8ucGVyZl9mcmVxID0gbm9taW5h
bF9mcmVxOw0KPiA+ICsgICAgcG9saWN5LT5jdXIgPSBub21pbmFsX2ZyZXE7DQo+DQo+IEhvdyBk
byB5b3Uga25vdyB0aGlzIGlzIGNvcnJlY3Q/IE9yIGRvZXMgaXQgc2ltcGx5IG5vdCBtYXR0ZXIg
YXQgdGhpcyBwb2ludD8NCj4NCg0KSSBuZWVkIHBvbGljeS0+Y3VyIHRvIGJlIHNldCBmb3IgY29y
cmVjdGx5IHVzaW5nIG9uZGVtYW5kIGdvdmVybm9yLg0KQXMgd2UgZG9uJ3QgaGF2ZSBhbnkgTVNS
IHJlZ2lzdGVyIHRvIHJlZmxlY3QgcnVudGltZSBwZXJmL2ZyZXEgdmFsdWUgdW5kZXIgQ1BQQyBj
b250cm9sLA0KSSB3aWxsIHN1Z2dlc3QgdG8gdXNlIEFQRVJGL01QRVJGIGF2ZXJhZ2UgZnJlcXVl
bmN5IGFzIGN1cnJlbnQgZnJlcSBoZXJlLg0KDQo+ID4gKyAgICAvKiBJbml0aWFsIHByb2Nlc3Nv
ciBkYXRhIGNhcGFiaWxpdHkgZnJlcXVlbmNpZXMgKi8NCj4gPiArICAgIGRhdGEtPm1pbl9mcmVx
ID0gbWluX2ZyZXE7DQo+ID4gKyAgICBkYXRhLT5ub21pbmFsX2ZyZXEgPSBub21pbmFsX2ZyZXE7
DQo+ID4gKyAgICBkYXRhLT5tYXhfZnJlcSA9IG1heF9mcmVxOw0KPg0KPiBJcyB0aGlzIGRhdGEg
ZHVwbGljYXRpb24gYWN0dWFsbHkgbmVlZGVkPyBDYW4ndCBkYXRhLCBpZiBuZWNlc3NhcnksIHNp
bXBseSBoYXZlIGENCj4gYmFjayBwb2ludGVyIHRvIHRoZSBwb2xpY3kgZm9yIHRoZSBDUFU/DQo+
DQo+IEFjdHVhbGx5LCBhcmVuJ3QgdHdvIG9mIHRoZSB0aHJlZSB2YWx1ZXMgYWxyZWFkeSBhY2Nl
c3NpYmxlIHRocm91Z2ggdGhlIGNwcGNfZGF0YQ0KPiBwb2ludGVyIGhhbmdpbmcgb2ZmIG9mIGRh
dGE/IFdoaWNoIGluIHR1cm4gbWFrZXMgbWUgd29uZGVyIHdoeSB5b3UgZ28gdGhyb3VnaA0KPiB0
aGUgZWZmb3J0IG9mIGNhbGN1bGF0aW5nIHRob3NlIHZhbHVlcy4NCj4NCg0KY3BwY19kYXRhLT5s
b3dlc3Qvbm9taW5hbCBmcmVxdWVuY3kgY29tZXMgZnJvbSBBQ1BJIF9DUEMgZW50cnksIGFuZCB0
aGV5IGFyZQ0Kb3B0aW9uYWwgZmllbGRzLiBTbyB3ZSBuZWVkIHRvIGNhbGN1bGF0ZSB0aGVtIHdo
ZW4gdW5hdmFpbGFibGUuDQpXZSBuZWVkIHRoZW0gdG8gc2V0IHBvbGljeS0+bWluL21heCwgd2hp
Y2ggYXJlIHJlZmVycmVkIGluIG9uZGVtYW5kIGdvdmVybm9yLg0KQnV0IHlvdSdyZSByaWdodCwg
YXQgbGVhc3QgaW4gdGhpcyBwYXRjaCwgd2UgYXJlIG5vdCB1c2luZyBkYXRhLT5taW4vbWF4L25v
bWluYWwgYW55d2hlcmUNCg0KPiA+ICsgZXJyOg0KPiA+ICsgICAgZGF0YS0+ZXJyID0gLUVJTlZB
TDsNCj4gPiArfQ0KPg0KPiBBdCB0aGlzIHBvaW50IHlvdSBtYXkgaGF2ZSBzZXQgdGhlIGVuYWJs
ZSBiaXQgYWxyZWFkeSwgd2hpY2ggeW91IGNhbid0IHVuZG8uDQo+IFdoYXQgZWZmZWN0IHdpbGwg
dGhpcyBoYXZlIG9uIHRoZSBzeXN0ZW0gd2hlbiB0aGUgZXJyb3IgcGF0aCBpcyB0YWtlbiBoZXJl
Pw0KPiBFc3BlY2lhbGx5IGlmIHdlIHRoZW4gdHJ5IHRvIGZhbGwgYmFjayB0byBhbm90aGVyIGRy
aXZlcj8NCj4NCg0KT24gY3VycmVudCBjb2RlIGxvZ2ljLCB3aGVuIHRoZSBlcnJvciBwYXRoIGlz
IHRha2VuLCBhbWQtY3BwYyBjcHVmcmVxIGRyaXZlciBmYWlscw0KdG8gaW5pdGlhbGl6ZS4gQW5k
IHdlIHdpbGwgYWxzbyBub3QgZmFsbCBiYWNrIHRvIGFub3RoZXIgZHJpdmVyLg0KQXMgd2UgY291
bGQgcmVnaXN0ZXIgKm9ubHkgb25lKiBjcHVmcmVxIGRyaXZlci4gSWYgYW1kLWNwcGMgaXMgcmVn
aXN0ZXJlZCBwcm9wZXJseQ0KYmVmb3JlLCB0aGVuIGxlZ2FjeSBQLXN0YXRlcyB3aWxsIG5vdCBn
ZXQgcmVnaXN0ZXJlZC4NCkluIGFtZC1jcHBjIHJlZ2lzdHJhdGlvbiBjb2RlOg0KYGBgDQoraW50
IF9faW5pdCBhbWRfY3BwY19yZWdpc3Rlcl9kcml2ZXIodm9pZCkNCit7DQorICAgIGlmICggIWNw
dV9oYXNfY3BwYyApDQorICAgICAgICByZXR1cm4gLUVOT0RFVjsNCisNCisgICAgcmV0dXJuIGNw
dWZyZXFfcmVnaXN0ZXJfZHJpdmVyKCZhbWRfY3BwY19jcHVmcmVxX2RyaXZlcik7DQorfQ0KYGBg
DQpDUFBDIGZlYXR1cmUgTVNSIGdldHMgY2hlY2tlZCBiZWZvcmUgdGhlIHJlZ2lzdHJhdGlvbiwg
d2hpY2ggaXMgdG8gY2hlY2sgd2hldGhlciB0aGUNCmhhcmR3YXJlIGhhcyBDUFBDIG1zciBzdXBw
b3J0Lg0KDQo+IEphbg0KDQpNYW55IHRoYW5rcywNClBlbm55DQo=

