Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C53A711A0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 08:48:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927249.1330009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLUr-0006Fn-FK; Wed, 26 Mar 2025 07:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927249.1330009; Wed, 26 Mar 2025 07:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txLUr-0006EL-CP; Wed, 26 Mar 2025 07:48:21 +0000
Received: by outflank-mailman (input) for mailman id 927249;
 Wed, 26 Mar 2025 07:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hi9g=WN=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1txLUq-0006EF-Fx
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 07:48:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2409::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ade88d5a-0a16-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 08:48:18 +0100 (CET)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 26 Mar 2025 07:48:14 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%6]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 07:48:14 +0000
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
X-Inumbo-ID: ade88d5a-0a16-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vr53OSaIWdcdvTjFTaBdRuXecAGJa36o5YKeyPnWUgwhWmOloFvnSsBVX76v34zDyRP9OwHWMzW0uHp0pqiUMEaOPzdVv0DPz88dw+xdiwPbYc+s839j/Vyi1P2fZoEkP+sDYsP8OcJ+TmIazqp421+jrvUEuVklNnxaC5sKfEzO81qTLa/suoqjdWa+0zFgFLJ1+ddcHR/r1EyMMOkGoCo8+ChCIRPYRafXwlFwWe1E9TWPTG1dDQ0yx0AIUohznr7q4H9n0d6qH7Z2SGmns72EQBf2Z0epZxxUcvDgkb5D1OVy0k5eSUki+VhglnWgF2zEHWAYTahjaHBkUbJcQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUIaV8u84eSga7JIFVouyNEN6ZOXlRJ6LUWX4Hk4PMs=;
 b=ajnnqvPH1z+0IE14aCIMOftJKMHp6VbwKRcnAzVsqOLi0tLNEytLhKAsVy6JpEMIPg94ySSdH+RVqB50Cvgvtdb04pfbFN9VTG6cMpyi1Cw/YULq7wBuzbBew4CEOi1ymYxvJvacqXIxIcH5GKcvaPiJ0H+bp+znkwTW623GsuBQS0vXbA9Rdxwt6tha2STk4lEne8WSBxSzH7TSx1A1cHE5n3Rpm4bPMix4zCCWKo50pgBZBBzcy/jVRRApEgb23auCcqVOdxAnB7EwPyHYxucTTq8lrf8Bqzcxku5tK+CGWzj5X4sxBAPM2tMFE66Z7Gv0gqb+SV9mz/RvLDrfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUIaV8u84eSga7JIFVouyNEN6ZOXlRJ6LUWX4Hk4PMs=;
 b=GX81wRgJY8H8dTqVMIJBQRqztrC00MmdtHmwxA4YuVANIhYjaTxwk3z13FKpOpqCwaFT+f99l/bL0+L1uyx5sD7ZyIvIoBMIquLsxxSsxn/LffMESvrz2ywDEmIGoVcV0Y4478PkJYOUU2JVVLUuf/gGZ2wOjqekDLANW9NQw68=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 04/15] xen/cpufreq: move XEN_PROCESSOR_PM_xxx to
 internal header
Thread-Topic: [PATCH v3 04/15] xen/cpufreq: move XEN_PROCESSOR_PM_xxx to
 internal header
Thread-Index: AQHbjnNrR40wXk683EGoKadAmyFYdLOCgUSAgAKmoLA=
Date: Wed, 26 Mar 2025 07:48:14 +0000
Message-ID:
 <DM4PR12MB84515A8127DB19A052ACB228E1A62@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-5-Penny.Zheng@amd.com>
 <a6010274-d7b0-409f-b9a8-d4dfa0e72974@suse.com>
In-Reply-To: <a6010274-d7b0-409f-b9a8-d4dfa0e72974@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=e8a7f4ce-8224-4fef-aef3-52891d0fbcff;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-26T07:47:18Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|CY5PR12MB6454:EE_
x-ms-office365-filtering-correlation-id: 657ec8ce-8c69-4e38-f19f-08dd6c3a9050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1hvdmlnM0FWcTBDby9mbzdjZGlEZ0VVS0owZmhBdmZBSjBGVkx0WDgrRlFh?=
 =?utf-8?B?aWpqZTQxdHl2SWJqdWZiNUtydXJvc3hYYnoxbFFXQUlla0Z2YXJmY0ZDckZt?=
 =?utf-8?B?N3dFRnNDWGl6cm50UlZ6VXhtaFA4NkpzMGd6enZCbGxpRVpFZVVZMlNWa0FU?=
 =?utf-8?B?dnRuS01KVjJZT3hBcEdNYzZUVStIQ212N2ZBYi9FZm52dXVLM1RrbXE0emNo?=
 =?utf-8?B?MjA1RFEwbG5mMUZMcTZmVXNlT2VvQ2VGanRReGp6Q3A3YkFFTXdsaDBjSms5?=
 =?utf-8?B?ZnNkK3FiWS9WWUFTam5UYmxQVjFiMTVIWjFaYnR0OVFxSlcxSzBOd2EvMGUx?=
 =?utf-8?B?V2FvbmlxYkJUd0JWUjlvR1k3NFVJTGFwUlpMOEU3NGd0WlJJbGxzRFA1dU1V?=
 =?utf-8?B?Q0c2Q05oRWYzWFRTUXZONTNvbFVMai9ncnB4NzdFY0dseWZZSDNwbU5MMFJR?=
 =?utf-8?B?QjloK2YwR3ptSnVQMmFEczVQZ2JaeG9LNnpVbXFxclAwNUY4V052bTFtdFJp?=
 =?utf-8?B?bG5wa1hJam8xVXpLMUlycVkvKzJxWTZmcTlEeHRqYXNObVl4MDJxZ3pLbzRw?=
 =?utf-8?B?Qmkyb1F6c1lZcnQ3Ui8xWVFVYjNxd2lUUWxNQjZ0cTlpcnp0bTVkdng1My9C?=
 =?utf-8?B?SUNOeFlvUGEwZGhBOWJlcEZmQTNqNDk5NTZ3Y1MrUlhVbGJaK3ZBRXpwbGgw?=
 =?utf-8?B?YnFOVWg3bjRBRG90QlRkaG43bmErMXRjYkFvc0dSckhITXJNSjVuV01tZHYv?=
 =?utf-8?B?cjdCUHdWLzRkaSs2dHVrZDhaQUxqQm1kSm1TWHVFbDBDamJxVDZ2N25uL2dN?=
 =?utf-8?B?eTFOSVh5Y0dsNWEvcU91K1Z2UWd3Ukcxcit6eUMzS0dvdWlLZXI3RTZ4RGxL?=
 =?utf-8?B?NGxlN0JmQm1ROU1XR0pwUStIcG9NRjJDWEJDZjFqRU1OMkQ1c1pyV2xkQXRk?=
 =?utf-8?B?Y0pIRzBIR1FDb2kramZCdElRRWFXRS9jNWt4dDZSNnVDS2R4ckJkZnkyeVhm?=
 =?utf-8?B?NzFhRVJrNUpsdjNSZG90VEJBeTZ1c3Q2aE5qQWtiR3gzWURIZ2Y3QlYxaEln?=
 =?utf-8?B?RVh3MXF1b0lKZUhsTkNaaDZqVjZrOGRic29FODYzU1V4cUFiSXlINXI0NmlH?=
 =?utf-8?B?OXZLOWRMM2pPTlJ1djZRZW9ENm1UZnNWQW1YczhaaUJoaHhKWXl1aE5mK2NB?=
 =?utf-8?B?L2RndmlJWXhaVlJUakR0bXJ4bFJ5VjQ3ekN4bGswME1USWg1R1RNSUtwdDVi?=
 =?utf-8?B?a0UrSHBkdHZneWh0aytoZ3VzT2RlLzdFMnRqUUJSUThPK0ovcVk1RlhqRmtV?=
 =?utf-8?B?VE9odTRRRkxkWGtIeXAvZnJLUFVwMnhUVGloaWZLUE1HT3Q2cFBBY3dmaHg0?=
 =?utf-8?B?YWdybkozMURUZGdRSWxLYUZ6dVdQNEVWWGlXclpKUFI1NEpTUXQ5SGxmNGVn?=
 =?utf-8?B?algzU2tSMGdCcnplcHQyZHFNQXFsbEMwZ1hLYUJOQytocUhWeS80ZC95V1dE?=
 =?utf-8?B?RlZNWWIwZWI0MTBJVUk3ZHRkS2RjdzNVSzFRRXhnQlRlRlF5Z2ZOTGtUL0Vk?=
 =?utf-8?B?OHI2Q21McEVrdHE2UmJ4WDdKa2dBWWNtZUdSV3QzdkJHY0JaNGRqN0RsWTdH?=
 =?utf-8?B?aEVXVm5JN0swRTRQV1FJSEQ4aHl3MDlaVkc5V0JmeW5haHdYTGNzSFFVdVVq?=
 =?utf-8?B?ckFPc0ZQMFJZOUxuNWRzUjVJZHV5U0RoZWFQUGQycWU2Z09iWTV1ZkN4YkNH?=
 =?utf-8?B?NkhUQ1BsNWs3SGtkamlGQndWa011b1JCaHI1dHl2OUMrWlZZbEprYWp4cnZC?=
 =?utf-8?B?T3YzQlR1VGppZGZGVjlEMVNNUFMvdG9jazRUTnNBbC9rWEFRUndpMEJGKzAv?=
 =?utf-8?B?bWVvVlZPMzdNUjFiZGJrWUtqZTVOS2luUFdHWlorWGtwRnc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmFSVUNIWnYxRHVaZ1pzNThkQ0xjUG1lSFUxL2oxT1E4ZHVmdk9FbFRKQzc4?=
 =?utf-8?B?VGR2em9yZmFJTFRVbGxhRndkZUpaUnMxYVZGSGpaUnB0bGUwK29PbmdOc21B?=
 =?utf-8?B?TVYzQTFCcFJ5MEIrcG9NMWc0UUZ2dXR2UVFPLzRPQmxFd1B3K0NHZnc4VUhB?=
 =?utf-8?B?YkM1ZGNYWkRyRSt4djA5aXp0ZS9FTEUzYmFUL0lVeWcvZTZxRmc4Z2VjMWZJ?=
 =?utf-8?B?YlczYmR4aXBhNlM2dFl3elFoSmF2NTFSQUVSOEwzL2J3S2Z6UndGaDJRRC9C?=
 =?utf-8?B?ZFM2d2NXRkxWcy95dzdBSTAwNllMQzFjVmdKeVVEVUE4cTlMNzFDcWxUWUVY?=
 =?utf-8?B?T1ZYMDROaDNqVWpuZng0RkJPeFlkenJobU9peDAwRmdtYVd1MU1hYWk0UXRQ?=
 =?utf-8?B?RHZleDhQcDBwdDZreFMrNFZHRSt0dmxZeEtWNTNES1RiYTVncHZSVXFKRk15?=
 =?utf-8?B?bk1ybHMxL0o0a3lCT3c0UnVRNmgrMVNlZGhRZHFjSmwwWEFReFVnMW54QU4y?=
 =?utf-8?B?L2RNcElYbHhZT0l1WGdCcE9UVUFwTnlVc2QwdTVVeHMweCtiUTIwcHNHUHVt?=
 =?utf-8?B?TmJuNmpDUG4ybFIvRTJ4alNZek50RGZDUUdKN1NIT0xvUnU1QVpveGV4Zy9r?=
 =?utf-8?B?WXo5MzVVK2RicXBJaEpkVkplWlpsOFZXc2ZBcGRpdkJQU2Z5akdpbTRQbVVu?=
 =?utf-8?B?WGMrWHpxKzFSU1EzUnQzdHVxcmxTbnYreFlJZzlZc3VuM3Yzakd2cVJENGdh?=
 =?utf-8?B?MjZiamZDbWVwa1VWYmF0WUlldmRMZHZSWGsxbW94MmhJcVp3ekZCekQzL0VO?=
 =?utf-8?B?Q3hZbzRqVlZvZ3VLSHRudEN0YjJZTzZDNHBqUWFyRzFsWGFQcGFZRk1MOVgx?=
 =?utf-8?B?UWxQMDcvdWJKOHBTOW91WGNtVTRxZ0crbWdXOCtMU0N3UEZSdkNqd3RaMjdw?=
 =?utf-8?B?djVQVkVWTkh4Y3h5a2x6Z3JTWGhwamQ1NjM4NTByd1c4MmJTMmlId2pSN0M5?=
 =?utf-8?B?b0hqMG8vV3l3aExVUXZsek14ZStDRkNnL1hZZFJreTFuenpFTXpLMFA5UzU1?=
 =?utf-8?B?UzFiYXpRVlhjS2Y3V2w2cENEYlF3alhXbWR3bnoyNmJqSWVvUXpFUHBuL1h3?=
 =?utf-8?B?akkrR3ZxVlcvWkwydzNFOXpVN25pNUJzcS81NVlDWWJ0SFZVdzY3UFlBY2o2?=
 =?utf-8?B?YVJDS0VjSW5UckRWMUI1WEZqMkxQeGp5eXVleFh6Y0d0cGIvdlZidVdCUHp1?=
 =?utf-8?B?N2Fya1JPTlBvM2wyNHZhRlhCV3ByYkFVSEVwRDZxYkV6bXhCN1FLdElGWWZM?=
 =?utf-8?B?SnFVOEQyQTJiY0p0VFFDYytld2thVFJZOUI4YUlRemhpZmtQYzlQWHpTbEhD?=
 =?utf-8?B?OWpNSEYxNE5DN0FFZkg2aXNPS29LUTRwYkFwTXNXd1JEa0lzUmVhcEgzbk5H?=
 =?utf-8?B?ODhJZC9Pb3NmRjR1WTNvWG04Zmh6THV4UE1RV0ptZGFLQ01JRGRaM3daZ2pX?=
 =?utf-8?B?K05TalRlRmxXMjlzV1E2UTE2b3pOcytlOHl0M01uQ09veWZkZTcyWVA0L0gv?=
 =?utf-8?B?RzJTSHFxK1VwOEQ1ZWpmL2s4eHkxSnVGdDlJc3ZnZXZ0NkFRNlhZZmIyVU9I?=
 =?utf-8?B?YUl0bzJ6TFRGNWNsWHA0WFFrckJvVEY0bnF3QzhhaDBtZFZNRC9GTWNQeVBR?=
 =?utf-8?B?cDNWRzI2Wmo1M1hOTFdvTTJqVktOTHg4ZzZmZ3daVnpFL0h1NkdYWnV1Vldl?=
 =?utf-8?B?OVZBQmJzWVJsZmk0ZnU3cDhjakVSTDN3UmRVU1pZWlBnaHY4QytyRWZNV1pS?=
 =?utf-8?B?a0tteHE2QTJwbFVkc0hWV29OeStqdUhoSEl6WTYvckVNWE9RYm85NWk2NnNR?=
 =?utf-8?B?eFZIc29ycWpsZWpzbmlqTXJoNzlLRlBtamlDMkw3SC9lOU90M0hmcmE0TWJi?=
 =?utf-8?B?aDBtWmszQzd2T0t2V2hsczFTNE8rZlhXWXA2QlRaa0dWVHYveExaSzUzMk1j?=
 =?utf-8?B?TTQyVmF5QkR1UEFuQ3UzSWZFNU5kZ28rTmJRMlZQVm1ycUZ4QktOdldVN0Zo?=
 =?utf-8?B?UlRhNndCN1ZEUUYyKzQyTURvb2FRS2oxejQrOFpaYkU0dHQ1VndGYi9FNHNk?=
 =?utf-8?Q?6Um0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657ec8ce-8c69-4e38-f19f-08dd6c3a9050
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 07:48:14.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WZeXYULW8r6wTujRYkUuW4h/+1Sy7YfPkH5xUTxZpkkZQP2znk93OT6J+8IqMzh8Kh9tg9kF1W2ftAY3u0ycXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454

W1B1YmxpY10NCg0KSGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWFyY2ggMjQs
IDIwMjUgMTE6MTIgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4N
Cj4gQ2M6IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+
OyBPcnplbCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MyAwNC8xNV0geGVuL2NwdWZyZXE6IG1vdmUgWEVOX1BST0NFU1NPUl9QTV94eHgNCj4g
dG8gaW50ZXJuYWwgaGVhZGVyDQo+DQo+IE9uIDA2LjAzLjIwMjUgMDk6MzksIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IFhFTl9QUk9DRVNTT1JfUE1feHh4IGFyZSB1c2VkIHRvIHNldCB4ZW5fcHJv
Y2Vzc29yX3BtYml0cyBvbmx5LCB3aGljaA0KPiA+IGlzIGEgWGVuLWludGVybmFsIHZhcmlhYmxl
IG9ubHkuIEFsdGhvdWdoIFBWIERvbTAgcGFzc2VkIHRoZXNlIGJpdHMgaW4NCj4gPiBzaS0+Zmxh
Z3MsIHRoZXkgaGF2ZW4ndCBiZWVuIHVzZWQgYW55d2hlcmUuDQo+DQo+IFBsZWFzZSBiZSBjYXJl
ZnVsIHdpdGggIm5vdCB1c2VkIGFueXdoZXJlIi4gU2VlIGUuZy4NCj4gaHR0cHM6Ly94ZW5iaXRz
Lnhlbi5vcmcvZ2l0d2ViLz9wPWxlZ2FjeS9saW51eC0yLjYuMTgtDQo+IHhlbi5naXQ7YT1ibG9i
O2Y9YXJjaC9pMzg2L2tlcm5lbC9hY3BpL3Byb2Nlc3Nvcl9leHRjbnRsX3hlbi5jO2g9ZWI2YTUz
ZTk1NzJjMTMNCj4gN2RhNTA1YTdkNDk3MGIxYTViN2UxYzUyMmQ7aGI9SEVBRCNsMTkzDQo+DQo+
ID4gU28gdGhpcyBjb21taXQgbW92ZXMgWEVOX1BST0NFU1NPUl9QTV94eHggYmFjayB0byBpbnRl
cm5hbCBoZWFkZXINCj4gPiAiYWNwaS9jcHVmcmVxL3Byb2Nlc3Nvcl9wZXJmLmgiDQo+DQo+IEVz
c2VudGlhbGx5IHlvdSdyZSBhZ2FpbiBhbHRlcmluZyB0aGUgc3RhYmxlIHB1YmxpYyBBQkkgaW4g
YSB3YXkgdGhhdCdzIG5vdCBhY2NlcHRhYmxlLg0KPg0KDQpVbmRlcnN0b29kLi4uDQpJIG1pc3Vu
ZGVyc3Rvb2QgdGhlIHByZXZpb3VzIGNvbW1lbnQgYWdhaW4uLi4NCkknbGwgb25seSBtb3ZlICB0
aGUgbmV3IFhFTl9QUk9DRVNTT1JfUE1fQ1BQQyBpbnRvIHRoZSBpbnRlcm5hbCBoZWFkZXINCg0K
PiBKYW4NCg==

