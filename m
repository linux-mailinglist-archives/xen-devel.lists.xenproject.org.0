Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI0ZIqCjeGmGrgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:38:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D393AF6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 12:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214291.1524664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhOQ-0002Fi-Qr; Tue, 27 Jan 2026 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214291.1524664; Tue, 27 Jan 2026 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhOQ-0002EI-Nk; Tue, 27 Jan 2026 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 1214291;
 Tue, 27 Jan 2026 11:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvRA=AA=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vkhOP-0002EC-GU
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 11:37:57 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f4c8006-fb74-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 12:37:56 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:37:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:37:53 +0000
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
X-Inumbo-ID: 9f4c8006-fb74-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mubmgtz88Mw7kT4RhNqW14kt4tnos65dl3a0CsgXXG1HWYJVyWKLHLLXEN+tEE6fDn74h4d6U87VOZAti9vizYRXPBuHzq3nonSQFG4r7rkX6GO0l/6WWuBcsNrNpHMd0iWMalnlxWD9Z6gqW4BG4paevryFQ8yRyYnfxfdlJHlb1Zp2bH+uFh7pHwnzc9bMyW15weIu3catLgSMOYQaeK0Ot3purjIdmdag3DlcRq++nSzixova3qD0slWUfgOg7arC5FZfoxPR2GXDjUtq8LQSZX+7D0uSqVbVKrSd5tnYLEZ69ts9u3v0Of+wQoJ3U2fvSb4goXzPSlMpkUhuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NFuY4wQwzadNaJ563PeByDTQIkjF147Fzxoc2wrBL4=;
 b=qL8qA/ND2gjcBYHmy/U8KqO2DdiKMayGxEOAh6swf/MGT/TXNWdEGZBRRJV1ET3JxkfFOP+aeJAzDtq7WbFRwLrMZlFJNpnTGeZTiYfRGsuVQybaO3JU6WubbBC02U1/iwoTF9+3CtHQRONW51y3ldFE9nKuh3mdEy++9sNrT2fhqmItsqOcEY/8mPCMndEaf5WPD05mYJZAKwNhlwSk0MbkLGg8uqsQonXFA42NkobVaCfWGc8DSRkBWyUxMAh+gJ/hKRMjl77dEoDnjzIIsbrEM0Ap9jY0YDflE6wf9SNMSbBtIPxkvH+dU0tlY13OHWH+CiuMGnboNohzqa7DYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NFuY4wQwzadNaJ563PeByDTQIkjF147Fzxoc2wrBL4=;
 b=TqZTtOhRa1dHhXSD4Z+Cdw0IGXbXf+u+YGvbfNO2QIHuoa1tHWfUvv2eGZge9opkBAZgNhs2ZOyCkSnZLN1tyx6f95aTS1O+8UAapsVVlKlVLjedY81brnlvkmOuDtXXJYAJm7kqILAx24FX4DNePSjILjAPFDg8UQDCnY9esuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
Date: Tue, 27 Jan 2026 11:37:49 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julian Vetter <julian.vetter@vates.tech>
Subject: Re: [PATCH 00/16] x86/cpu: Cleanup for NX adjustments
To: Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0625.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::23) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff901c1-df3b-4dec-739c-08de5d98820b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2VlMTZ1cFBHSnViTHdXRDFZZlRVT1hvemN0c3pwUHZncXdOb0lETFFQeFlX?=
 =?utf-8?B?TUVhTWVWaTg1L0szczhDZU5TdFlUV0FuUmhlUWFRNVJlS3hNcnlLN1U0blRS?=
 =?utf-8?B?RU9NV3RzRFBpcmZYdGFpTmFIcUVrZjh4alBrbXNXKzdzZVNtR1Z5dDBmQXpi?=
 =?utf-8?B?TDFUNFA5ZUZLZG5SeVZlNUVaNjhxa1E1NVkxNkRWbS83WGdqd1hTQ0VsbE5Q?=
 =?utf-8?B?c082S2tMV2JrWnp1eGxEMSsyZUlJZUZHcnhaM1dxVFl1eVIwazQyRFdqZlRx?=
 =?utf-8?B?WWdRYVZIMjdCTkQyWGs3ekRvdFY3ZW41elRpUnRFZmlZS0VDdjAyV1lzM3U5?=
 =?utf-8?B?Q0ZZSDJ5bmdCejFkZGlXekpsa3hwMmZJa3MvMG5RdXErVnRFWGI1ZWZjMWJZ?=
 =?utf-8?B?ajZhMWFmUVlVZFlSSlZwN2VDamxzMytjcllTK0svM2ZPOEw5MjBEREMrdU9z?=
 =?utf-8?B?VmQ3Z3lxUXVPMUFzNVRGOVFEZG8xVGprTHZ3ZERQazJCaVpDNnJhL3ZxSlVk?=
 =?utf-8?B?WUp6OHVWdEhyRm9hZXFjdzVmV1gvdmsrdjNaek91Qld0bVVJbHhVN1B6ajdj?=
 =?utf-8?B?MDExTFI4MDBvcFAzaWNwbytnUFI4S1RBNkxUSzl1dW1IcVBjSTYzdlBROFZr?=
 =?utf-8?B?eVlnVFhNWGZLSHp3VEtySFNMc0xSbW5VMEpUd0F3cy9uOUtFTEFDQ2REVzRa?=
 =?utf-8?B?SlgwUkx4K24zK1BlN00vR3NMZHROd1hyRHF6bTE2WjVpRVpncGFtRkViV0hU?=
 =?utf-8?B?MmdWbERtdmxwVmtNcE9GR2VmdFhpL21WVHUzeEdlZFRiaHlTemFUdlVucW5L?=
 =?utf-8?B?ZmZ0dkQ0ZFBZY1FGakFyV0JXVFhpREdjb2hkbFQzeFFaYW5BdVd6Sk11MWNW?=
 =?utf-8?B?SGluelZqdnplSWkrZU1RZ3RiTytNUGJQKzY2OXlOc2wzL2xLMnFjc2lLOWhs?=
 =?utf-8?B?UWJiSDhlSjVicXc2QzlzTUJSN3BPWnpYZW54aENzaHgzby9yUjFGd25uSnFm?=
 =?utf-8?B?WWpVcXg1cU92M3VWOEhDWnZWVktRdmtaSXp4QlFYc0wweDE2M0phOW11MnF2?=
 =?utf-8?B?eGxuUWJ1eUw2b1FXVmRnZE44R3hmOUoxSnZhTmtDRHJ3UUZlUFdaZjNpWHlL?=
 =?utf-8?B?M1dOOU9QelRqUGVML1NkVnhEeHNjVy9hc2R3dmVqaG9TMmFmSHQ0OHdob000?=
 =?utf-8?B?czdjTDdHNkxlQUNjYlV6K3FaMk9raThDMjJSemxMVk0wNWsyV0d2akZZdmhE?=
 =?utf-8?B?VkliOFJNdDhWSlZEYVQ0MTNJMk1NU0NDNlRpcllWQ2pvRXJGS1ErQVg0Rk00?=
 =?utf-8?B?MENoWGFBRW1FamFCNm4yK3YyL2RxR1l1eEdRZHdHNHhCRjNUTDZITWhXU1lo?=
 =?utf-8?B?M0wyYnlhclF1dGs1VTNjLzdEbHFjeXd4bHFvZnlxTk1VNzlUd0pTU1hqbHRR?=
 =?utf-8?B?b3M3aU9kbWN1UzIzWDFPSDFBUUg0dE0wWDZJb3VINXZBaEU0MWR5WDdZeXFX?=
 =?utf-8?B?TkJuaWNnbFFyV2FLV0o0bG9aZXE3ZnBUWFgyaDNkaXovNy8xeGx5cSs5Q2p1?=
 =?utf-8?B?OVdIRGhxRGM1Y2RoSUUrYkw2d1ZneDRKMXo3aFZPUmVUQUFRYVNYNVhJWDVE?=
 =?utf-8?B?ZW8vMEMyVkttU0E2V1VTM0JMWFMwSFgvOHRodDhTbndJdEE1VEMvSCthVTg2?=
 =?utf-8?B?ckNuK2k3YkRDVHJPQjRyTGs4cDAxMUNNMzJjYXFnTjcrcCs4YXd2S3hta3pk?=
 =?utf-8?B?SGJPTUF2SnJESnE2Y3h0YWRPMWJRTmJYaDZMN3VTdVg2dlBvcE5pSjNLY0E1?=
 =?utf-8?B?R2RFMjVPUDhYU2oyMytVdGZlSndnZ1NvN2oyOHNRVkRrMUI4bVVvMUtjWEpU?=
 =?utf-8?B?S3E0WXgrQWVXVTdEd0wxSXpUNENWSHk5TTV0MFB4azY5ZFBwdytpVXdmQk1j?=
 =?utf-8?B?SDZSSmdKWWdrYTVpTlB0Skk0Skxic2cvZjFWVnZ2ZCt6OC9RT1Y1SzFPNU9V?=
 =?utf-8?B?UEF3QUdCd2FjdXpDeHM2WFlCZVA3NXVTcFUrMWpHYnFsTG5qZDZtdTRWeFhv?=
 =?utf-8?B?MGpmOG5HdG1idXppU3B6YVo0MVQxWU5uajdwWFFWZW8zUW5OWEZxU205RTB5?=
 =?utf-8?Q?o7/A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFN2NXpZbkVLMmZQMUtJWTc1NGQwSWljWHJyUkx2U0dOem03UFlaUXUvcUM1?=
 =?utf-8?B?VWFnbkdqMk9HYXA4MWVKcVZCejlCUG5weEU0MndTR0VpQy9lSDVDbWlhS1Zk?=
 =?utf-8?B?NU5yUXlMZWNrWW9KaGx0a00wWEo1VE1ON3NCempMeDJXL2ZJQzlOd0V5UTBP?=
 =?utf-8?B?elNseFQxdENoczZJMDNTNFAyLzB5WFYzQWZaVG51Z3docnJ0U3JEK0dTa3Rm?=
 =?utf-8?B?cmZvY0xWbWxuU1Y0Smp4aU9RK3dnODdndlp6Skc2L2JmUzY2bVMxYUh4Z2xq?=
 =?utf-8?B?VlE3QTN5MElCM1RWbU5tUGJuck5IY1BJc2RkUlNkYXBKR25DYTdMOHBQN2hr?=
 =?utf-8?B?YU41NlkxREtqRUlOK0xaZjZRVVoyMUJXTWtoNklndUFOcEx3MkFBV0ZSTVV1?=
 =?utf-8?B?MGhOVDBWUlhkcFpGY2gxT3dGeFRua2dPdEpEZ3lyMndjZS9uVVg2SmVvckVr?=
 =?utf-8?B?azAvWm5WSk5YWlZua3RLQnUwSS9uelUzWlN4UExOZlJKSUFHVUhIQW5DMllO?=
 =?utf-8?B?NytzdmhyQmd4SzQ1NkZJSDlZUWR3WVpuSUljQWFZUU9yRE91ZFgxV3A5Ylha?=
 =?utf-8?B?VE1jNkJ1NThBRXdzcTZMV1VwNFVac2prVS9XTVkxSXBlUVJnOGExUjMydGVW?=
 =?utf-8?B?eUZ3NEw1MVV4d01aZWtTemdaL2I3ZlBha0UwS243ZDgrS3VvRlArYXdnZlZr?=
 =?utf-8?B?cWc2bmFUalIxRmlWMEZIN3dHT1libkFod2JnS3VoR3VNczl1aHVsaTZaUnow?=
 =?utf-8?B?cjNzcmNpU0ExUCtDRFJVUDJoVG9lbmJmL1BwYm1GSS9zejQreDVjdjFXcnFN?=
 =?utf-8?B?ZVFkc1p4eGtpTXVVdXFVUHZPRmtNd1owNlg5UHFtNTZ0TDlQR1RwTEJsRlNo?=
 =?utf-8?B?VkVqR0s4TXg4QzZHWGVyVXo4OVVlZE1yRzR6SFRtR2NqdzJZV3FIcktzR3dh?=
 =?utf-8?B?ZldtcW4vbFFtSjZubEZlVnUyRjF3ZURWWGQ3LzJWS250NzhsYlQ4aVNIQXla?=
 =?utf-8?B?dmR3QlFwYWhhOCtsSzVQVys2VVlIVWcwMGpid0w2MjJoWnZ0VmFqdnJPdG4v?=
 =?utf-8?B?V3FoeW5Ja3R1TS9VMkhGZ1h1a25GN3U2TXlZT1pLdko0czdKSG5KV2Q1b2xl?=
 =?utf-8?B?RTUxa3hTQ01YUFBSdkhLMTBJcm9hVStOZTJZOXp2SG5xa21wdkQzNFdjZGZS?=
 =?utf-8?B?VUFSNUlMSDF3Y2kyK3pDWDZXT29mczZGUlIxTzIyMDJwdGdOWjJPTGRhTlNS?=
 =?utf-8?B?cTBzN05neVZKR1gvRXZ0RldyYWRxWkVOcHAzS2JEWHR5Q21BUlRSNnVDN1BQ?=
 =?utf-8?B?YXlSd09EQ0xsNldiQXNuMG1NR1ZIZll6NmhnMmFEeDlmZS9IaWNEaXBnaE5T?=
 =?utf-8?B?dkxKT1l5dzdNTU9FWklWUElZVXVueHA3NlYxYTlxM2FLa1ZiWkJUM0hZTERY?=
 =?utf-8?B?L0p2YzRzZlRoY1V6VE5jRytvbW9RUVdoYXpqNmRQSER5czlQTTNrMEJSbW5m?=
 =?utf-8?B?R2FUQ2xWQk52Z0JFa2gzazhnY0tWYm5oQ0lTd1ZsZk16aFFMUDV5di9sVG92?=
 =?utf-8?B?dWorWnJMUmRHWmUydytudFZLWVJ6OFZ6V1BzL0x5Wk9TT2IzaUxqdVVRWGZU?=
 =?utf-8?B?SnM2T3BYNjE5VXFHQ3MwV0hVaEtMYThHdmsxMXVwWjQ2SzY3akswYzIwcFRU?=
 =?utf-8?B?MXVya0RaeHNrdXgrVXdXM0RidTlYYkFCRHMyeFpIN0xycVFDdGZPSCtsa054?=
 =?utf-8?B?RE04QmZMenFjRXNJSWJTcDdNQTBCZWlacXBSWmFsL0hEbFY0Vm1KQzk0L3hS?=
 =?utf-8?B?aXhiMkZlc0NjSW9TTHUxcWVHNXp0b0dXeGxTNUl2MldWTjZTVHdMK0tvZDc2?=
 =?utf-8?B?dzVTQ2crVjg5eG15V1M2UnJCOGM0UytJdjBRYXlCWUFIU1hqSFpJZ3lmYjdr?=
 =?utf-8?B?WWZLcU5yU1NSK1pBM3h2aG92QmJoKzdFYmlUTmFVSzJxVmt1WHVVaU1EcjhD?=
 =?utf-8?B?YWduNldQbmZ4d3owcXBrNThxVmNUa3pmU1VZaTM4Y0hUL3lNUzlSTnZ6dEdp?=
 =?utf-8?B?WjdicTJ1ZGdEeURxcW1MZktHODFtTTFLYm9rOTRvNUNXZGZnYWJaUTBGa3pr?=
 =?utf-8?B?cE12VERmZTU5a3V4UDFjemxKSW9GTW5mQk1EdjR2c0w1eXAyT1ZKU0hxRHJU?=
 =?utf-8?B?bUJtampvZDhndlVnY3dNcjFBbzd1ZnhSTGhZN3BDZ3MzZDR2NmhrMS9vdHdN?=
 =?utf-8?B?eHg4Mm5oNDdFRDhRZHllbDEwTVg0VCt6dkVTajRIZnkxZzBTWXVvWUtYYTk3?=
 =?utf-8?B?Vnc5ZUxRZ0tnMjVzOTlESzg4NFJsVEtPVGY2cTB1aGoxUkZPQkVTZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff901c1-df3b-4dec-739c-08de5d98820b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:37:53.2910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IzQ3xLKKMZQmJqe4NAxwZSQs0uoO5gl5nTeQ9UpEs2Qgj0dA0TX6KIAbvGVz5Kx3Fk5fd0C/oMCSixj4mf6vzdRjjyr0GDdpSUNSiigplY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5937
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,citrix.com:mid,citrix.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ED3D393AF6
X-Rspamd-Action: no action

On 27/01/2026 11:23 am, Teddy Astie wrote:
> Le 26/01/2026 à 18:56, Andrew Cooper a écrit :
>> I was hoping this to be a patch or two, but it got out of hand...
>>
>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078891
>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>
>> The branch has one extra patch to fake up the firmware settings being set to
>> Gitlab CI, not included in this series.
>>
>> Julien: This ought to suitable to rebase your cleanup on to.  In the end, I
>> did the AMD adjustment mostly because I needed it to test the correctness of
>> the prior cleanup.
>>
>> The final 4 patches are tangential cleanup which I've kept out of the prior
>> work in case we wish to backport it.  Everything prior is relevant to
>> untangling, and mostly for the benefit of the AMD side.
>>
>> The early patches are hopefully non-controvertial.  Later patches are a little
>> more RFC, and in need of further testing.
>>
>> <snip>
>>
> Tested on a Intel machine with "DEP" disabled, and "Require NX support" 
> disabled, I get a pagefault in hpet code

From above:

> Julien: This ought to suitable to rebase your cleanup on to.

This is cleanup only.  I've not got the bugfixes for EFI boot yet, so
the behaviour you see is still expected for now.

Although, thinking about it, it might be better if I try to merge the
two series, so everyone can test the end result.

Thoughts?

>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) 15.2.0) debug=y Tue Jan 27 12:06:46 CET 2026
>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>> (XEN) re-enabled NX (Execute Disable) protection
>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (raw 000306c3)
>> (XEN) BSP microcode revision: 0x0000001a
>> (XEN) microcode: Bad data in container
>> (XEN) Microcode: Parse error -22

As a tangent, what's going on here?

This is the first time I've seen the error outside of my own testing. 
Is it a container you expect to be good, or some leftovers on a test
machine?

~Andrew

