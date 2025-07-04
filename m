Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D8AF89FF
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032926.1406339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbCy-0000w7-TA; Fri, 04 Jul 2025 07:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032926.1406339; Fri, 04 Jul 2025 07:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbCy-0000t0-Pz; Fri, 04 Jul 2025 07:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1032926;
 Fri, 04 Jul 2025 07:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXbCx-0000su-80
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:51:43 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2406::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8549161-58ab-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:51:40 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 07:51:36 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 07:51:36 +0000
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
X-Inumbo-ID: b8549161-58ab-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lP7R4nGmZO+vULSzOreC6ybkhDkg4glsvBl64YJ9rDsvVU2/X4kZHSr4eaK6fgPF0Bu/Q1hGawhHgJHZ1+StL59GABR6l+9VF9VZcOvxXHLxKE5EHfWe6bzOjn6eBD+sbC80Z+1VNm90r+QGGWHc8ot0D1HUNy2D2YOANng7R2DYvi4tO8+HGh0GfyNuEhnzrh1X91HJmKw/12tJMkbeTDfu9b7sZjriDw2EzzN2NinkraHgvOxsHC/ax3ldUXdvl1RtSvkGPL//8YCCxoclTxja4cU0Z6U6ZYF9IYMLKbTlPQdKszNpIEFHRV7SLm24GwtlWBZzEN6ltDReeVvrBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyHSJfzn+ipkF5/AqtgIE+CIZfU6+kdYzRwITGjyb4Y=;
 b=rGUvfsq2NTUacWihfzfn+TB7zovSxzvhr8ExNxVkV1/iESwdSOBRdu8Vrzi1VV7hpa6Y4h6ywKYJiP998b9n42atzx49Gv8RrAOzik9yBIEb8kPzcSy/Y0msRGUK3CH0ba++zQfjNprwp2PJ8xh6uWBMzHUxW5444wxXXLdlfY3y53UyCYcDbmjuoQ9S8wi5ZLbE/elM2Cm1UMKYpc4rfJc57ylERqewnR4K3DntqLDVp+HzDLg5Ndu65dbknXjwhdGOFtMsFKg8nBeQr2LAfHucYK9Svd3kvzzkWi49Km5AHqF8EoAOMTF377nWy0lI87+rB+nw8bpzw3GCd0Sxgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyHSJfzn+ipkF5/AqtgIE+CIZfU6+kdYzRwITGjyb4Y=;
 b=fJhQUoYTWrHBIQjK2yzbnfL0BVzXY+HawtMLgufKOn9GtkWlzlMEllECx7o0qunxGZ2iACpKiPtaDynEktp/cv76pxw8PmXqRGETkWmZvLuFxlM67I/7gsQCnPHLIIaIWCiUKB7qzu9xiorXhVGkAnvh8zCm0srDz09MscHCrZ0=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 12/18] xen/cpufreq: get performance policy from
 governor set via xenpm
Thread-Topic: [PATCH v5 12/18] xen/cpufreq: get performance policy from
 governor set via xenpm
Thread-Index: AQHbzuRGFA8e3uaaJU21iUm/xgVX/bQGF+yAgBuzwDA=
Date: Fri, 4 Jul 2025 07:51:36 +0000
Message-ID:
 <DM4PR12MB8451401F33E538209B1CBFB6E142A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-13-Penny.Zheng@amd.com>
 <0a5c9445-904a-4321-8406-8618fd82313b@suse.com>
In-Reply-To: <0a5c9445-904a-4321-8406-8618fd82313b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-04T07:51:16.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|PH0PR12MB8176:EE_
x-ms-office365-filtering-correlation-id: 6a52cdd4-3634-4d0b-d48b-08ddbacf9a2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UWpEUUh5clNUREJDSVgxZjNxK2w0YlBrQ292VmswSzUxbnRaR2VEZWk4Q0NX?=
 =?utf-8?B?MVl3TjNGbEpmNnh0MkRGeWlwUGtZc3B6Y1BQd3BNT08zeW1sOUlBdmV3UitP?=
 =?utf-8?B?MEhkNE51S1ZFS3JQdk5MQnR0ZTZoSHN0REhlbTJiRFRTZ1hKU2NwTFYvQndu?=
 =?utf-8?B?OEdkVmMvVmpwVjUrS1U0NkNYaU4vblZoYXdWWkVLM25jaHllOUdrTm9DWUg1?=
 =?utf-8?B?alowYVQ4NkVETXJpS3BmakRQbVNEdUtlMkNQeW0zOWUySkthd2o4N1FyNTRR?=
 =?utf-8?B?bVpKSU1hZHFjYUd1Qmt0RWdYYk9RMkN6Tkp4NUtFMlZsNHVjRWJHSklXMFJ0?=
 =?utf-8?B?RzlaL2Q2aXA2VkNCTVdNSnRIVUE5bFRzMWR0dC9weSs1SEJjanVYa21QeGF5?=
 =?utf-8?B?RU05c2Y5ay85a0hkV1ZZRFJGWE5EVzcrQU9CM1c1YzArNlNvcm9hM1hURUFV?=
 =?utf-8?B?VlhPbzZYKy9WWEpMeDRIZXduMTcrRFF2dlJWSXF1Z2ZkbjFxRjgyMnJ1Y3pR?=
 =?utf-8?B?RGVvOVBlTGJvTkp6MnBMYVQxTHRlQ01QT1lyK21LVWR3YXJLQ0NCNnhwK0w0?=
 =?utf-8?B?bUdnc1Z0YmxwMmlWelpJZnhnS1l6UVZzVGlyN2RuYWpmNWtsaTk1czM4OEtZ?=
 =?utf-8?B?Rm84aWpES0dRU3gybVFuMjJmUXc5cjlqYlNmRkgyZkpRS2MyYkJGbjNqMFhD?=
 =?utf-8?B?eFRhVkxtemY2T1FGODdzUTBUWjZqVHl2bWJxdmYvck5LcHA5M21iSGdLUDRQ?=
 =?utf-8?B?REpkai91TEhKNitWR2xETVpDZjhHZzBvdmhwb1ZWam52QTIwcGMyS2hMTmxn?=
 =?utf-8?B?REhQWnplelFja2dNanNwRFZ5Vk0xMzRtNnFOejh3bUFucUdPSkRlRlNHZC8x?=
 =?utf-8?B?UTVJRWpISWpUeFNJWUowYjJIRFJMMkI5cEZNRXAyQ2pORCttMFU4emFJdWNa?=
 =?utf-8?B?S2NNWXRJMWx0QzdhMmt0bFNRd2lvWWtGK0VkOWtKaDA4Ylh5TkxsNnh3eHRP?=
 =?utf-8?B?Zi9ZMjVwSmhyRi8yeTExejR0VzdXS0ZYKzhnVXBQZXFmQm50R0hTams4S01y?=
 =?utf-8?B?S3QwRWhMaUtIWXlydGk3anRyQ3o4TFMzY3BpWGxrUzc0Kzh2UnBaSnpoMDlt?=
 =?utf-8?B?bmlFbGdnZ1ZERlN1aitwYWZIT0swbTdHWVZ0YVVRUTVZbHNJRjlUanZOQkYr?=
 =?utf-8?B?dkJkVlppSmZHSjZ5WE1vWFpMNnd4S0JvUzMzK2ZvOXVJWWNqaUdTWWw2QWtZ?=
 =?utf-8?B?Sk84NzM0TUZnRk0rMHh5andRRVlXRVFPKy84ZkVWSi9NaFNmNU9ZT2FVUDVt?=
 =?utf-8?B?UU1wR0M4OGFwMVRiNm1ZYW5sQ25ZQ1ZyVkNDTXAyLy8wSWVVQ2ZiN1dxM2Zq?=
 =?utf-8?B?M1pRYUVkUnhvSVZuUFBtTnM0aTI5WGJKM3JhVWttSUwvU09DbzFKdkZuUXl0?=
 =?utf-8?B?N05xQW5SMG1QMnFkdmZnaG50ZC85RUNZWnFjc2RlR09nY0ZhdkxKcWVCQ00x?=
 =?utf-8?B?cXpaZ0RvK2h5emtTTllUV252QVVINDRCNU5OQTdBQXMzYnEwTFlXbmJRdGRU?=
 =?utf-8?B?WEF1dnErUndMZHF6WFkwd09pMndXSEpuWW9TbjZqY1hQZDZ4VjI5OWp1ak9n?=
 =?utf-8?B?aDYwVzVRUVd6ajNkd0xtMWtiMEhaeVdWOHlSa3VvdDgxVkZ6WmpqVmlOYjRa?=
 =?utf-8?B?RW1LU1lOY2ttNStRZzhBdkFPVy9GSG81N0VWeU8zR1Jxc056S2RxUmppb24v?=
 =?utf-8?B?Nzg5VXIwUzUvZmVrdSsyZ3JFZFNHcTBXSVQ4Z3JJaDRrQzZ1cUJIanlpdTNQ?=
 =?utf-8?B?S1BiRVY5R21kMGE1ZlNCUy8xVnJCR1duamk3ZGYrL1ZjSER6QUdzTWJzaERG?=
 =?utf-8?B?dU5ZWDV5cnBpS1NrdzZ6SXh0M3BTOTNkc0o4djZaVTlLWkRObC9DVTBCS25o?=
 =?utf-8?B?RnRBZUFUWXB2Q3loUGo4dFBXUk5Ka0VpR2lhYy9ManNhSjZuT1VuQlliYm1r?=
 =?utf-8?B?TzlwSzNaV053PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RzRreGovRGZGZW5kUjdoTVJOY3diajE1c1ltMjNXZlJSNXl2a0tYZEFMUkti?=
 =?utf-8?B?eDFTcGRTNHF1K2RVdXJCMlNocHBBUkQrUDRYL1RZMEZKOFNJMlRHQ0xCdXhl?=
 =?utf-8?B?VVNoTlEweHBOT05nTFFnRlpoa3NrdUxKT1IrRXJQTGZFeCtmQUlRYmVWaHcy?=
 =?utf-8?B?ajFzbGhMU2I5Y1BsVmxEamRybkkyUE9RRlRBUEZhNkJZV1FNSHM4azA2UU1F?=
 =?utf-8?B?Wm1PRzNSVTFWbTcwcXpCY3NzeHRBYjFmUDN5ZjJMWTk1c3VIb25rZXJJNmYx?=
 =?utf-8?B?N0FsQjFkVWRlNEs2eHFtaStEdlVxL1BkVXFRWVptbW56Z2l4Sk0vNjRoeVFO?=
 =?utf-8?B?bVlVZVhKRUJqWXlpTWdCRUExcXJ6Q1ZVL2lBKzVOeHQvZGZxaEtsZ3FvWHlw?=
 =?utf-8?B?bkxpMTJGV202Z3N0dnplWWYrRlBrWmlvVHA0Mmd0L0N6empoWW8zR3FFZm9H?=
 =?utf-8?B?N2FKWjgxQnpVWE9Ta1V2TVdUM0JsWVFaM2ZIekltNVpvM245UzVneFBYcTVv?=
 =?utf-8?B?OGNNc1p1MmQ0QVhvcmkyN0xHc3MxbmpIVktpTmt2NGhOOU1YYzYwK3QrRWVo?=
 =?utf-8?B?WW9PUks5emRYMkMrZ0pXaG9ZaWZzU3Z1WDRFRFYrKzNpVk5wOE4xV0ttYy9v?=
 =?utf-8?B?eVVHL2ROdzZLZ2swVFpqNVY1U0FyWUtXSnFtckZmT3V1b2NFN2hhSmpXZ0Uy?=
 =?utf-8?B?VmNMTWxvQTNURWF1K2ZTcE1xalQ0eHYxN3hlWjdGRjZIY2JtTExOQlRKY0t1?=
 =?utf-8?B?dnBQaS82UUwvYW1ydFJhN1lwRUkwSCtQUW1GZ1ZDWGlKQ25mVE1IbGRLcjBp?=
 =?utf-8?B?MW5DUUxBWTlVNWpPSDA2ZnZkQWVjRXhhVnJHL3FFcmVlalBQNXp3RUdpekNr?=
 =?utf-8?B?OC80SlhodHlLbU9TN2lMc0ZadFBzYlRmY2RQOXFtNkZVMnBaeE9RUEFvcnRY?=
 =?utf-8?B?bzNIMFpkYkFTWmJsMU9QWmFRVmtPMW9wa0s4b1cycDB5d0NUOTFJNlZWMlVE?=
 =?utf-8?B?dXlNTWdscDJ6SnM5VWZDQmU4dGRsbFFid2FrVlZUUDh0dmNPUEJCWW42Mmpy?=
 =?utf-8?B?SnJ0andhbjg0N05sOE5md0FiNGoxUlpITDRwNHMzaS9QU2pBM2tuSnBmaHRT?=
 =?utf-8?B?Ym5NcThvWExQQ2xnNmtrLzZpbGtIWDZycU5RYVFzRGsrY0gyTmpiMEhXbDdS?=
 =?utf-8?B?M3praVNEQkZndVV6RlZZMmNZejdDbzRhRC9GTGd5enhnOStaWjJ0RGYwaUVo?=
 =?utf-8?B?dWpxd0JVSjVzbHZHV1BPL3ZsSzlQcldSNEdRR1hxZWgyeVBPM2M0SHh6VUxF?=
 =?utf-8?B?Q1lOdWF4MmNIQ3lyTjRxZ2VaZ3dXdzBaMlNic0VjMUxFb2tmTlFEMndFRW1v?=
 =?utf-8?B?WGtTb0pTMERDNlFDSTJhekNteEtuR0lQV2JDMU5sbVNzazhySWNrcTVrMHV0?=
 =?utf-8?B?b0tSS3kzWExYdDRqbGw0Y1h5aTRnVlBUTDZIMmVadWhXNllzaDBqaTcwQjhP?=
 =?utf-8?B?ekp3bzYxN0ZKZlhXVlp6UHhmZkVSTnpSSTY3dFE1Yng2dEllQTRvMmNDbzYv?=
 =?utf-8?B?Snk4NTROeEtveTVsRGU0MWVYU0k3VmNWclhvalFiWitaQ0MzQ2RmVHVXWk52?=
 =?utf-8?B?YTFHbXByMTlZUjkxVUc0dHZVc2dOdUJUYjhmbFJ6ZzlmSXIxNUM3eFVhaEFq?=
 =?utf-8?B?ay81d0srQnlzdDNEckFMQnUzcTlUUUtTQmxLbkFOa2hGa3NUSzBESGgwdGVp?=
 =?utf-8?B?ejgvbXNXSTBxMkUzVkJmQk03bkRxa1JUVUpNV0dqbHhXbzQrOEtncnc2S1No?=
 =?utf-8?B?cVAxSnBqMXNlWUFtNitEL2xnbFZuZUJVUVN1cWRPRXZ6dEI2dE1lY0ZNMU54?=
 =?utf-8?B?YTBxZm9Pd2pjSGljVnIya2FtYkhzZlNSblljNzgwKzhabkxzUEZJeGJsYmg3?=
 =?utf-8?B?WU4zYTFZeVZDQkJNbzV4UHhkellVZ0hIMElHWkRteGNYVkxiU1YwaDV2cWlo?=
 =?utf-8?B?TnFHN1JESWNMMGxjbjBZNkRHMk9jeEErdUYvUlM3U1JZNzJFT0g5WGM4VzJk?=
 =?utf-8?B?MVlWTXMvUU02NUhCeUNndlprZjRPZ2lpUnNoVWFuQVNzMjdtNW1FZ2VrSlBh?=
 =?utf-8?Q?Lf4c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a52cdd4-3634-4d0b-d48b-08ddbacf9a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 07:51:36.3992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BMf9Yscojtm7NQN1x6OfEOPbO6TNR7V6Dr9+9c4JovOHyUEyKvtFez3BkkYenBNsrEKA+i83Y2wgnM7ZyQsJzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTcsIDIwMjUg
MTI6MjIgQU0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMTIvMThdIHhlbi9jcHVmcmVxOiBnZXQg
cGVyZm9ybWFuY2UgcG9saWN5IGZyb20gZ292ZXJub3INCj4gc2V0IHZpYSB4ZW5wbQ0KPg0KPiBP
biAyNy4wNS4yMDI1IDEwOjQ4LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiAtLS0gYS94ZW4vZHJp
dmVycy9hY3BpL3Btc3RhdC5jDQo+ID4gKysrIGIveGVuL2RyaXZlcnMvYWNwaS9wbXN0YXQuYw0K
PiA+IEBAIC0zMTksNiArMzE5LDE0IEBAIHN0YXRpYyBpbnQgc2V0X2NwdWZyZXFfZ292KHN0cnVj
dCB4ZW5fc3lzY3RsX3BtX29wDQo+ICpvcCkNCj4gPiAgICAgIGlmIChuZXdfcG9saWN5LmdvdmVy
bm9yID09IE5VTEwpDQo+ID4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiArICAg
IG5ld19wb2xpY3kucG9saWN5ID0gY3B1ZnJlcV9wb2xpY3lfZnJvbV9nb3Zlcm5vcihuZXdfcG9s
aWN5LmdvdmVybm9yKTsNCj4gPiArICAgIGlmICggbmV3X3BvbGljeS5wb2xpY3kgPT0gQ1BVRlJF
UV9QT0xJQ1lfVU5LTk9XTiApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKCJGYWls
ZWQgdG8gZ2V0IHBlcmZvcm1hbmNlIHBvbGljeSBmcm9tICVzLCBhbmQgdXNlcnMNCj4gPiArIHNo
YWxsIHdyaXRlIGVwcCB2YWx1ZXMgdG8gZGVsaXZlciBwcmVmZXJlbmNlIHRvd2FyZHMgcGVyZm9y
bWFuY2UNCj4gPiArIG92ZXIgZWZmaWNpZW5jeSIsDQo+DQo+IFRoaXMgbWVzc2FnZSBpcyBleGNl
c3NpdmVseSBsb25nIGFuZCBpcyBsYWNraW5nIGEgbmV3bGluZSAoaS5lLiBlZmZlY3RpdmVseSB0
d286DQo+IG9uZSBpbiB0aGUgbWlkZGxlIGFuZCBvbmUgYXQgdGhlIGVuZDsgeWV0IGJldHRlciB3
b3VsZCBiZSB0byBmaW5kIGxlc3MgdmVyYm9zZQ0KPiB3b3JkaW5nKS4gV2hhdCdzIHdvcnNlLCBo
b3cgd291bGQgYSAidXNlciIgZ28gYWJvdXQgIndyaXRpbmcgZXBwIHZhbHVlcyI/DQo+DQoNCk1h
eWJlIGNoYW5nZSBpdCB0bw0KYGBgDQpwcmludGsoIkZhaWxlZCB0byBnZXQgcGVyZm9ybWFuY2Ug
cG9saWN5IGZyb20gJXMsIFRyeSBcInhlbnBtIHNldC1jcHVmcmVxLWNwcGNcIlxuIiwgLi4uKTsN
CmBgYA0KDQo+IEphbg0K

