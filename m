Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DD3D20A2D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 18:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203595.1518713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4zx-0007H7-Nt; Wed, 14 Jan 2026 17:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203595.1518713; Wed, 14 Jan 2026 17:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg4zx-0007E6-L6; Wed, 14 Jan 2026 17:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1203595;
 Wed, 14 Jan 2026 17:49:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=47rf=7T=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vg4zx-0007Dy-1D
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 17:49:37 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 632e7e3b-f171-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 18:49:35 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB7774.namprd03.prod.outlook.com (2603:10b6:8:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 17:49:30 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 17:49:30 +0000
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
X-Inumbo-ID: 632e7e3b-f171-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDmHelmiWweNUJbqt36DUNe5GpZjq0zUNCkF2R/zSWeOXS60zWn+EI+rsRbgi14Q90fVsLSx4pKoEo3yqA/7eKsX3P/2qM/GAd3YAdkABw+CEOLg6D1QRTsM2ljQ8Tn66Jjh91PVugfgxaOuoii/V9eUnxha8eEzSlcdOj1N+bPXd8qt2V+6Oyz9hfG+BCavohbwzcQZF+COK/k155zDeq460XNRoY0xy1omkhz/mMPVefAiGKcnGa/oxP1BRRo9gllK69/6QRG5IV5Kw1LU841rZwzgrYN8vHoU8NUSHgWvUMDMZNpauvWJefPKFKzp+t3IRLLvph41eppgdGasOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFzcPAKGUAvK2cxgErxT80xhhcqjeqxpEU7KH9F/ZmY=;
 b=V5aDr2kqWnfj5NvmnbZxybS2SN84hedoQ/gpUEIoHFs+FJb/sFhOSUgSR7Hb2Bt1EeeBFwoVKf93F7TbNJF/33gcRtzQrzzRjkZCSCLGY5asiPlXR3Nj+/VzT2nfsyScMYtjMaYkC04ZHLcJNGyvzLl/ECCQAorP0Pm+UEl1I1YsHut1cZ94KY1SvTYfsaNFZAwUKfgdmmGySMfmqcOkppw1EMGnDCdY7ZpjmjD50WdklCVC8RthrgVAaBzuiI8xftYLQYdKKNwyEl62BO69eOQaqoFLSYgIBTpMpKD2u3X/WWQumi+EiyEn1PQiQeSLLVOf5ty67JrS494By/gtBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFzcPAKGUAvK2cxgErxT80xhhcqjeqxpEU7KH9F/ZmY=;
 b=N3Z5Izb3hSKStLbgB0cB1khxL24ndIic/OkrRc4ZUPsWbJ5uyUrAyH/+foKkf0/Qw7GxGHG4Eh9IlNrznEN0+qPdod34wAXb+lDL94yVZPUsfYOrXxjLu+NRl+iP0WNw6G5er0hY/dswieDlQI/dhbd5V77Qx5BRAxiNPft2+w8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 14 Jan 2026 18:49:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Subject: Re: [PATCH 1/5] x86/time: deal with negative deltas in
 get_s_time_fixed()
Message-ID: <aWfXJk90Sh7B-qi7@Mac.lan>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
X-ClientProxiedBy: PA7P264CA0228.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: c772f90e-eb85-4e49-cd79-08de539544cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHVDWWJKNnB5ZlBoS1UrT3grOUE4WWVHN244aWN3Nk1LMTNFSmVQWWVoWTRS?=
 =?utf-8?B?YU5USWlYZVpWL1lQZkdKV2FOMUpyc25DMnVhUVJ4L1A5aHBhSUV5WTYwWXpn?=
 =?utf-8?B?UndKakZlRWdGVUZUcU5JODZuZ3VKc2YxVnJQVUlPdXNKNU1RRXFNYkYzMlVs?=
 =?utf-8?B?dzBWZWRGN2ljaXVUcGRabzNwUE4rcEVCaEVLdDdoaGFENmlTcWNSb3orZWwx?=
 =?utf-8?B?USsxZGVlNS9LU0htTWltUFBRWjNWZmNoa3pNNnphZTh5UXpVYTA3a0xuUzVR?=
 =?utf-8?B?T0dtdThBZzZzYU9JL1FhbC9INmxPZlhVSDhVSkpqY0ExZ2UyTE1rWkFDNkg5?=
 =?utf-8?B?SllEVzBTNERGN3VUN29majJHK0k3VFQySmU1NG5oK0VWZURaTm5keUlseEkx?=
 =?utf-8?B?bU5zQ1NNRjhtQTZVRFA5OURTeXZGUDgvaldCbmdGcFlpeXdxc3Q5ZGxrQkFZ?=
 =?utf-8?B?b1FNeENiU1BMMzZJN21CWkRDR2pLOTJBNEN6M3phZUpKbVVYMjN0TUR0UWNz?=
 =?utf-8?B?VVpjREJvaTM2azVjdGRkc3dHZ0dVQ1JQWWVoQzcxa0hGakdEWG9RMEZiN0pL?=
 =?utf-8?B?V1VvZkxqVGJ3YXMza2hrSG9xRGVsQXFPUlVFbzFpa1Fnd1gzSmU3bE5Dc25v?=
 =?utf-8?B?MERYN3FWcXZqTkZPRThUTkZFMDNEVS9EVmc1dDE2QmZWUlp0Z1FTS2xEbXl4?=
 =?utf-8?B?TmtJY1AzcHJ6TVlMaFQ1SHBHcVN0QmlGY0FLanptL1pwWEJ4T0oxMCtlVCtD?=
 =?utf-8?B?cjhLcEY3Z3MwRTRGK2JUR2lLdU5mbTYydVUxd3U4RlVyMk9vck90QlVoTjRt?=
 =?utf-8?B?RWxaR2sveHRsTmJrTTJCeGVHcjREbHhOMEZCanZxNHQrQ1N3b25pS3QybVZC?=
 =?utf-8?B?eUZBRHlrTmp6emZ5REo3UW5MdUt2MEdMZHNOYUozZlorRnM5ek4vUkFUT2Vr?=
 =?utf-8?B?OFl4NG1pdjBadjZPMUR2Mkx5dGY5QjFtN2lodUdNMWNML1hSQUs3bDYrRk43?=
 =?utf-8?B?empQT1RnN0pacEc1eXc0OXR3eUtKWlNoWEU5WnY4K2d0a2hwV1FnL2dxMFRH?=
 =?utf-8?B?WTdkZEMvdFdZeTUwU3ovUFFvZXdpcXR5WDNzdWVYeDM0WEdxUDF3M3E4SXBm?=
 =?utf-8?B?ZEJIWVMrVUk5ZUdDaHMyREk0ekNBRG91M1NXZi9yR05CVE5kU05NdktiR3dW?=
 =?utf-8?B?NFpIZmpnMW42OWtucmhkUXlSVDgzQ3crNVNJcVZ5QmRuN3NJcnFDb3VJU0M4?=
 =?utf-8?B?dmxaRHd6Yk1OMFVGdmdMOWJadURqRUovcXc5UTVaSDd6L0VlZDE4aXYxbFJv?=
 =?utf-8?B?MjBZSjBmeHFQWUs1RngvenI4UGIxQXRTcEV2RzJBWFAvMFYyUjVPa0EwdlFQ?=
 =?utf-8?B?eGZVcU1WWWZzN013aDcxYjhSVFlSVjRsUDFKeERwN2NmcklqMmJDU1hnZERk?=
 =?utf-8?B?SE1BWHlTZTFJK3k2UmxGcmJ5VFRvajYzRkhoSGo1aSsyclE0aFhLY0JlbkJM?=
 =?utf-8?B?Ni83TWMzODFYaEo4aEV0RHNNMFlvK1FHVTZtK0RCbWMrSWNjNXh3MnlVdlg1?=
 =?utf-8?B?bG5LMkJJMEZqR1hyZ3pnWDVNSW9TMDF0UjFRcGdhZlgrS0poRlFnaE9IV0Jn?=
 =?utf-8?B?R3NzM2xVSHBxa09tVTlPY2RPZlAwZU5Nby9PdXM5UFdDU1orZStWQmJ3Y3lw?=
 =?utf-8?B?NHkyQTRhQUdoZlVQdkMyMVlGWkdINDBudHV5RGMrMldwQlh0a2Q4d2pDaXdL?=
 =?utf-8?B?N2VqaEJBUmdoTXhnOXRpbE9BZ3dkazFCRitCOHZicGRocEVXVTc1a3loM29R?=
 =?utf-8?B?bThKYW5kOG9wOHl5dTh4OW9zZ3BEa09MNlptZDZteVZJaUt5Tks4Vlh1Tyti?=
 =?utf-8?B?Q0N5ZXVycTNSa3lRTStLUU9VMThIZ3BvVUxHbmY5aFN2bVFuNVFrMGp4Vnh3?=
 =?utf-8?B?ZWFXWFhRYkxwM0xZL09xb0lJNmxUNnkyb2VaNmxIanNwNW55cVprUjd0eWFt?=
 =?utf-8?B?NDViNHl3QU9iK2hoUDRsZ29Vc0FSOUd6cjRPeU5lcnU3dnZua0VhV3NsUzhE?=
 =?utf-8?B?NWtoWENTWDlFQlVUc2lxa2xBcGJNVVZkVngyeEpzTC9oSHZQZzhqZTV4bENl?=
 =?utf-8?Q?2M+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNHUmQ2dGZYeDBxT3R4QnNTWTZQVTVlSU4wdGJpMWZ4dUZLSkJNR2sxQUxq?=
 =?utf-8?B?L2I0N29aRitqVDdvWXp6RWZPZWZEUi85TUVSUkgyQ3BOb05yTXZPTWxQS013?=
 =?utf-8?B?WXFGYUYzR1VSVU9KM1pYOHp2S0IxYzFrRy9FUWxnOXhRck5EYTd6ZmlpK09P?=
 =?utf-8?B?Q253NnpUd3YxZER3RGFFZ2pkbCtFZkYzbDJHOHpuWWFwUE02ZHhUbm93THhC?=
 =?utf-8?B?Y1llTThyanhmRkpNMDJKODFzT2daTUphWXl3ak93TmRrcllBWWpoR24xUGQ4?=
 =?utf-8?B?eFJqU2FvcWk5c0JHTEdmamJuUUdSNkNtbTlnTmE2K1lzQ1ZRamdVVW54dUNa?=
 =?utf-8?B?U05qZEk3cWc0VlVIelFTOEQ1SDdVYVZXMjJVeDRqeVhCWnFmRjlwTWUvWE5K?=
 =?utf-8?B?bjdHN05QMC9rbUwySTd2Smgzb3lQaHBUZEUzUG9MK2lEaTBrQi9wa2tMUGo2?=
 =?utf-8?B?dW9Xb3RNY3pteC8rNEZwUU4wTGlNWHB1cE5TUVJFSXdqbUhFeFE1U0dPQlpx?=
 =?utf-8?B?TDJkRVE3QVR3d2dVREZQN3dOSjJRWGNGcTl6Qjc3WUdlM2VQTktpRkl3ODFW?=
 =?utf-8?B?ckRpa3p3RkZIMitKQmZSOTYyODdMNXFvd25VV0MxMEZWTzVheXBCVXJxZ21m?=
 =?utf-8?B?MjVSWEpQaUxNNDdSOE5OTTZnenZjYjRGaFFrcmpXRDdDbjBTR3pkcE14UGEr?=
 =?utf-8?B?V25jNHhWejJScm9oOWFSeEdYeTFieHlNNzVQeDhUcEQ4ZWZ6SGFRNXFxMUVZ?=
 =?utf-8?B?UzluS1dJMDhScFhkT1RyZWt3RllkclptVHlma282dDd3RFNlVmJiVEhEMmlx?=
 =?utf-8?B?QzZJaHhrc2VoYVNZM0ZpSjduOXF6V2s2ekYvRi9WNEFSSGRPUDhUejZva1Ez?=
 =?utf-8?B?NDJnN2gzRTF3cnAxSVFlcEp1VXh6OEk2eWhsSmcvbGkzcngwb0llZVBCOHg5?=
 =?utf-8?B?UzlMYjRFKytwS2RDdXFob1pTK1BZb0tHeGp4WmdsUUhSd2p3UWxHNWorS3hF?=
 =?utf-8?B?M1FvTUllUzJ6RWs0SGFzdUtqN2lzcndzc25oRmwwM2MyTnhOb1V2d29xdUtS?=
 =?utf-8?B?allvZzFlMUFXZWVPU3RTYlB3NThjMFp0bVhrNkxxTUNZL0ViUndVanlYOGdQ?=
 =?utf-8?B?NzBjY2xzMWpkWE5hN3NWYkJLbE5NZ1YrbHRPNWtYWlIycW9TOXRaMUd0TUQ4?=
 =?utf-8?B?MTUrVFJLa05oNDd4VmVaSWxLbHRsOGlEeGRKU1dJYjBTVTBVL3FSMllLQ3dw?=
 =?utf-8?B?aHJVSDV4VHhRbTd6bnVuUGJReG9HMkI5Z0hYUkdXWGlJb05SQ0hxSGhGT1dY?=
 =?utf-8?B?d1JGYVpKQ3ozeHJ4dzZFWUtWMkZxZlphY09DN0ZONi9Vd21TditqZlVVSHlk?=
 =?utf-8?B?blIwdjdoR1kvMEJJVmcvbVBmakh3ZGlaUmovZDgzOUpjQW4rWUtWK3RUZy82?=
 =?utf-8?B?WXBXak94YWk2ejJBbVQyaDd0bld6ME0wWXVJbWFlL3Z4WXdBbFdPem4rZWJk?=
 =?utf-8?B?UEhPWVNpVGZYejJDb3VWRFFCb0NreW56VTg3dHdrRlhRR0R5c3QzK2J4UXRC?=
 =?utf-8?B?eHgrdDNDMVYyQ3IrL0RIZEJ5WDQ1VjY1OGtSVXJDWTRCakhxZHE4MC9lWUE3?=
 =?utf-8?B?aVFaSmQrblV4d2haMS9DMjJCVjFOL0l0SEV4aDdMd0ZKNFBPbmNWbXVtUmZU?=
 =?utf-8?B?c1hxOUVNeFREa1RJcHpubjRPQUJxd01XNTNheUNWZCtLTStyc0hxeVY1R0dP?=
 =?utf-8?B?TzMzcS9wd0lraXhJM2JuOXhvV1NSWTN2NVJ2YVBGYnJhSlR0VWJ1T3V3MGtV?=
 =?utf-8?B?cWxGb2s0NFdkOVdZVHFYK1kyNlJoZWJnNTRsNEhKbGp1NFhZYkkzR3J0Rjh3?=
 =?utf-8?B?R2hiSmFRMWxqTHFxaUdtMVg2UW5oT295Qm9iRk1GeTZUVCttc2c0dTV6cEo4?=
 =?utf-8?B?Sk9ZNnBJazV3dWVySytOaG42dmdid0Z2U2dGNVE2MGc0cHB4VitLYjVwLzNm?=
 =?utf-8?B?QTVBaEdXclU3Y2htcVhTZ0VuOExDV214NmF6TnlnMTQyRS9ITWduRU96NC9N?=
 =?utf-8?B?M1dxYklWdFFLbG1TWHI3bXdDSWNxNUU3cEY5VVYzTElPaFJDWWV0VEMyUkph?=
 =?utf-8?B?NGZVSVFHTE13UC9rOStOMVdxQlJGN3hQY3ZlQXNPYS9WNnJQMUxubVZmV0N2?=
 =?utf-8?B?OTdkNmNXcEx3aVZWaU0yaXY4bWJjRFNJZFhxSzhDWEZMVWx6Si9OSGMvLzRl?=
 =?utf-8?B?SEpkSnF1MXI0ay80YVo2Z1hOVlBmK2g4d1gyRlpEYVRtSmVPdUZSYURCNEJ6?=
 =?utf-8?B?K1lvN2VQb1FMeTBPM1hMdGdySEVVZmJ3VHVrMklQL1ZNTUo0a1UyQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c772f90e-eb85-4e49-cd79-08de539544cc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:49:30.4683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhNBJ4cjUpikblgJn0kHYFdjOXZ7AZDPBV31UQ1EZ1kH6gyooRrHVkB70WI99eU6XhFyXEazEQIaHRtbZ7mSGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB7774

On Tue, Jan 06, 2026 at 02:58:11PM +0100, Jan Beulich wrote:
> Callers may pass in TSC values from before the local TSC stamp was last
> updated (this would in particular be the case when the TSC was latched, a
> time rendezvous occurs, and the latched value is used only afterwards).
> scale_delta(), otoh, deals with unsigned values, and hence would treat
> negative incoming deltas as huge positive values, yielding entirely bogus
> return values.
> 
> Fixes: 88e64cb785c1 ("x86/HVM: use fixed TSC value when saving or restoring domain")
> Reported-by: Антон Марков <akmarkov45@gmail.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> An alternative might be to have scale_delta() deal with signed deltas, yet
> that seemed more risky to me.

I won't go that route, the caller can figure out the signedness of the
result as needed.

> There could likely be more Fixes: tags; the one used is the oldest
> applicable one, from what I can tell.
> 
> A similar issue looks to exist in read_xen_timer() and its read_cycle()
> helper, if we're scheduled out (and beck in) between reading of the TSC
> and calculation of the delta (involving ->tsc_timestamp). Am I
> overlooking anything there?

If we are scheduled out in the middle, and the ->tsc_timestamp is
updated, ->version would also be bumped, and hence the loop will be
restarted.  I don't think there's an issue there.

> stime2tsc() guards against negative deltas by using 0 instead; I'm not
> quite sure that's correct either.

Hm, we should likely do the same for stime2tsc() that you do for
get_s_time_fixed().  Given the current callers I think we might be
safe, but it's a risk.

> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
> comment towards the TSC being "sane", but is that correct? Due to
> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
> calling tsc_ticks2ns()?

amd_check_erratum_1474() runs after early_time_init(), which would
have cleared any TSC_ADJUST offset AFAICT.  There's a note in the
initcall to that regard:

/*
 * Must be executed after early_time_init() for tsc_ticks2ns() to have been
 * calibrated.  That prevents us doing the check in init_amd().
 */
presmp_initcall(amd_check_erratum_1474);

> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
> whether we shouldn't subtract boot_tsc_stamp.

I would expect tsc_get_info() to also get called exclusively after
early_time_init()?

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1649,8 +1649,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
>          tsc = at_tsc;
>      else
>          tsc = rdtsc_ordered();
> -    delta = tsc - t->stamp.local_tsc;
> -    return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
> +
> +    if ( tsc >= t->stamp.local_tsc )

Should we hint the compiler this is the likely path?

> +        delta = scale_delta(tsc - t->stamp.local_tsc, &t->tsc_scale);
> +    else
> +        delta = -scale_delta(t->stamp.local_tsc - tsc, &t->tsc_scale);
> +
> +    return t->stamp.local_stime + delta;

LGTM:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

However I see Anton still has concerns that this patch doesn't fully
fix the issue he reported, and I'm afraid I don't really understand
what's going on.  I will have to take a more detailed look at the
thread, or possibly attempt to reproduce myself.

Thanks, Roger.

