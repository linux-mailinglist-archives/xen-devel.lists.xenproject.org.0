Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593CB201B8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077069.1438157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNog-0001RN-AZ; Mon, 11 Aug 2025 08:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077069.1438157; Mon, 11 Aug 2025 08:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNog-0001Od-6o; Mon, 11 Aug 2025 08:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1077069;
 Mon, 11 Aug 2025 08:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NowU=2X=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ulNof-0001OX-6D
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:23:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:240a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a1c1fb-768c-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:23:32 +0200 (CEST)
Received: from DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) by
 SJ0PR12MB6967.namprd12.prod.outlook.com (2603:10b6:a03:44b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.17; Mon, 11 Aug 2025 08:23:27 +0000
Received: from DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d]) by DM4PR12MB8451.namprd12.prod.outlook.com
 ([fe80::b04e:2da5:7189:4c4d%7]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 08:23:27 +0000
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
X-Inumbo-ID: 76a1c1fb-768c-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tA2OlXwQ8tKOTKBpWzjrNJC+Yb2Vn4Kfd0sPziw0tn9qBAA21mFolZrCZ3DGzdUHc60cRk54Gn6SUvYn1Neg9axN2cCwhrFHib8H8nHwaKvMZw84BA/4PmUbM23iRByOb8NrHJiADIw1CHji9TcU1S758bFVjDOmrrwUq39Ak0tZkR17XhNR/Ob6WOO5vu40vk6HL1HEIAE3BJmpl2qiIiTiBZcbJ3KH9UPegSwNmZu01SIgnsl/kylM/M4VTUQ8TJOAQmhwLrvo2Q6tlYwuUuQJhGgjfIDwVm9SHjWfXFigFrm+bWW10mqG82kKv0g784HB+49qTJIb+/EuAeMcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA+6qBJFfAcU6uUPUx/xX6ZfMwWuHXFgNARnbW/qYaM=;
 b=Q2tL/CeafFjnUuQ0W0bWHy7NAl6a378bjByDF4A3il2BdEfwiCr+KHGY6R+vY/ds00Fg9BqBB9KAurtfi7UqOECfdSNP6JYWqum87HXzYsV+i3hkfAEtD/8JdiTur/ZyTsl43mLU8FrHlHKsvjsV8BCeFSJBn2kJN2zFNo9Xgn2gl/97XRcGQmrgTMGK2Rot5Ua+J/L/8pBsD8N4ZQVCOHKy4GVdIRgdLF1sRCqEhEj3bfzu9AiyshT6Ll8NmZYlLwiG0hAhrMgIYDvTdxeE2r/4fXEfpWWmy+AmKMzKiacw/MHCHO8Yp9UX2LK31Pl2myH4AU5NhxmcLMjr3hXVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA+6qBJFfAcU6uUPUx/xX6ZfMwWuHXFgNARnbW/qYaM=;
 b=gt5AsRYEjfDjAxDCrbOsfU1jnBWswbfTGChDsEDKxC2XrhZ2gaeD+BwbIhpQL4D2hDJ2MJj9TErhrZqJHMuG7EefSQtpUqXfaWSW1jfXfrukINCHubvYUOnzDq7vA10D8v2MohPCG0H/wVdEvGjNyFtpDE+YOchmYIVlzRHs2hc=
From: "Penny, Zheng" <penny.zheng@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Huang, Ray" <Ray.Huang@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Orzel,
 Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 12/19] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
Thread-Topic: [PATCH v6 12/19] xen/cpufreq: implement amd-cppc driver for CPPC
 in passive mode
Thread-Index: AQHb8hcm/2j2N+pZoEenN2J+6s0qPrQ2T+AAgCb91HA=
Date: Mon, 11 Aug 2025 08:23:27 +0000
Message-ID:
 <DM4PR12MB8451D773D2D9823E4CC03E30E128A@DM4PR12MB8451.namprd12.prod.outlook.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
 <20250711035106.2540522-13-Penny.Zheng@amd.com>
 <1899ebd0-c64a-4bb8-bf3d-0bf90f2b6299@suse.com>
In-Reply-To: <1899ebd0-c64a-4bb8-bf3d-0bf90f2b6299@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-08-11T08:23:21.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB8451:EE_|SJ0PR12MB6967:EE_
x-ms-office365-filtering-correlation-id: 4ae9c1a4-0548-445a-89dc-08ddd8b058f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZEVVWm5BcXhwMzhoQllZMFBvZEliTnNxMUVKeWRRSmw4d2JxMGxSa1p6SG5E?=
 =?utf-8?B?VlFQK3Y2bWtCWUlDZWdwc3BGc0dPdmk0enRDSDd4OXFEZk9SekRyWEl2aVNk?=
 =?utf-8?B?VWdWSkZPWWhkQ3RLc2h5VVpLczF4dy9hM3lDZFAyRjhJVERmUUNKekQrM0gz?=
 =?utf-8?B?a0hYUHhmeVVIK0plWGxVdTIvbDV4VE1scnMzVzJJMGg5THZPVWFtUkw3Wm5F?=
 =?utf-8?B?bzhkZzVESEk3eUIvUmNxcFJ3emRIUjRKekFBK3p0UzhPZlA4RWZPWWNmTG5z?=
 =?utf-8?B?WmQyVGgvVlRhelFvRVBlNkF3MGNpSm1yVmkxOEF1ZzdiQWdRcERnYjI0c2dI?=
 =?utf-8?B?ZkU4ZGhjM3YrWjlpSVFDK3Z4TExhN1RZdmdGYkd2VHJ2ekdWQnZ1aDhPRXJx?=
 =?utf-8?B?VDYxU05Fbzl3eWxyemMybFNGeTZ0T0FVYjFxYkZsanlJTlRBV1JTcXBwcXJX?=
 =?utf-8?B?aXBnQkpVeEZPZmtOd2hCNVQ1WUh0N1dOTlF4eXhKa1p4aGVnS2YyeUR5aU00?=
 =?utf-8?B?bDIxWERDSmlLa2xFSnVYOERhSmFEMXpuWHgwNjQzZFJnbzZYbWdtM2pyM05y?=
 =?utf-8?B?NUVCdjZTeVZOUVN6ZjBVaG9SSXpWc3dUYUJPYW8vWEJ4Y0t4TWw0eUJOUU1Q?=
 =?utf-8?B?TkdBMnFUUzhTMUV6Y1g4a3hHV0h4VUJhWFJDVzJOVWJ0ajF1clJUd3ZEMG5C?=
 =?utf-8?B?RUFMdGpQZ2ErdVk0VXRiNG9QNitPeXpwaytQV3FPc3pGbVg4MW9nbmZVekU2?=
 =?utf-8?B?MFhoUG1wcGFPV29meUlFK2EyWXZTaERHMTlVcE1yVm80NTM5cUs4aUF2WCsz?=
 =?utf-8?B?UGtsV0gyM01MSEpPVG9XNVoyYTZCQnc4WlppZkdjRy9YTlNSVWJoR1drTlpu?=
 =?utf-8?B?aHJaYk0vNytzazV2ank3cGhjSXgzM0VVN1J1dnJMMUV2VEhyRVVwZ2w0ZXpq?=
 =?utf-8?B?cUt5OEorVStmN0xlMjU3WkVTL3FCSGdEYk5FNXdCMlF0RzZYM1lxdmNRa3Rx?=
 =?utf-8?B?dDN2NGI3OXdtdGZJZlZERUFRYVVlWWxqbytFWnk3TXZMRjdZUDNVTGZFaWxK?=
 =?utf-8?B?UDZ1YlRGVW5lVEg1cVRYd2x6SFJsSkZTczlZRXhhRGc5N2ZXQmRFNUVhQVdE?=
 =?utf-8?B?TVcvT0xmdFExZnR2eDZCNDdiRm96L0VTOGNKb0JqaUZPeGN0SThBRFJ4bm0v?=
 =?utf-8?B?Rk1OZTl2ZVNWRm0yZjlFbVYxaHkvNGVyQnd4NmhNbFFGbXBYVTZaQkhaSms5?=
 =?utf-8?B?SFk5ZGxwVnNvZk1ranppcjdTZm5qZmNudlhXTWo0MXVZbWhSNzJyTk5jeWs5?=
 =?utf-8?B?THBiSHhTQU1Fc0xPK0FncUV0MnJoU0ZYb1NCOS95YWZPSzNRelNic1VBd1g2?=
 =?utf-8?B?NXFMajE0QkZyQkRCNVhuaEZnK0FURkFmbEpMNkZBYW0rZGs4Y3dnVXIwTzJk?=
 =?utf-8?B?Q2hwaVdiRzZ3U24vanJQS3VpdE5UMmV4VEdKck9YbU5KTklSTWhjUFRoZ0xZ?=
 =?utf-8?B?N2JsQ2RCTXF3aDRzWVJoYVNsaWJQc0liZUxhemo5eTZGTndBa2VFRXN0dE9O?=
 =?utf-8?B?YWFkR3R3VDY4WTRscmhGSUhJbUxKdXJjeGw1cDV3bEo1VHo0aVQ2SEVENDl4?=
 =?utf-8?B?QldnS0MzcCs4anFjdldzSkgrYW9sQ2Y1Tldzc2VuTlNxVEV6aFl0cCtCM2w4?=
 =?utf-8?B?RWs3WU5hS1pieGZqcStQQk1WTU9LVERZemlDemJhcXMzelBhdTg3YlUvZFVz?=
 =?utf-8?B?QzVlWjF1UnBqVHFaaW1EcVdMWk5WTWFueFcyRFQ4NCsrektSaWFSbjdodWZY?=
 =?utf-8?B?YUpuRy9ERG9LOWdmSURwdG91SWJneXVTRHFhOUpwSVlwUVRBK0ZRL2hNWVFT?=
 =?utf-8?B?Rk1IRitqaEsyMlkzM0hFd2tTelo0SGhVUWtXV0UrY1lLQXVpUlNrdWhGRGwz?=
 =?utf-8?B?YjZHanIxZGZjVll1V1VnRGJ5QzlCbzk0RC81dkdWaUpmRlR6aVUzNTNlRDBW?=
 =?utf-8?Q?/kjB3+bv0YLMln6MK2nd/TWcLQLV7g=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB8451.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZHZka0ZzY3p0aXdPZkJSVGxxNkxMRU1SdmVRa2s5cU5sQTdXQ0M2Vk14ZjRv?=
 =?utf-8?B?cHczWVVYSHBiMno2ZWFkTDYwU2xSSkhwZGcwTHJYTHRSOCtYdUJ1OXA0Z2U3?=
 =?utf-8?B?aFppYjNsR2pZdjc1N3lOVGhJUHJyWE5iUDRyelNVWUJOU1pJQ1N1VEpUQW1W?=
 =?utf-8?B?bm8vRHRjeDdiUnpuSGtMOEEwUTFuMnljdXZiMm90bm94K29TQ0RFc2RYYkNT?=
 =?utf-8?B?YWJXT3F1T25FSmRPU1JiWG9OblZ5aUxBVm9ON3U0Nkt6TFNXWXp3NG0wS2d1?=
 =?utf-8?B?N2V1THlrVEdWMUZ6N3EzcVQ0ZkpuaEdlZzJZYjlqOU1EbXp6MVlpVDU2cFZw?=
 =?utf-8?B?b0xKdUQzWTFRYm5OUUlxWEtKVHlsREJLanFuQVpsamdWbDR6ZEI3MFNvaStP?=
 =?utf-8?B?NGhML3JiRHV0cTJ5ZmNFMGliNmg1OGZCWkxrSmR6b045KzZOSW9wL2x6VWo5?=
 =?utf-8?B?NCszRlMzaTFQTjloeWZwSDdQZ0xwM3BqcDNudE9ka3ZYd0p4TDVLVHNxbWRo?=
 =?utf-8?B?ZHAva25Cdk8raUNKczk0bUF6dis1ODdBMStuSUJHMnBDdFhJL2psVEUxK2V3?=
 =?utf-8?B?Yk5tTEM0VG1oS2JCeUlOdFhsT01jQkRKVlNaS0pPSjlmQUZyQ1IwYnUyMERG?=
 =?utf-8?B?QXRxZ2RXOHYxei9zUUhvNmRodTgyNFJZdXcyZi9Md0U5L2dYWVBwUVRaR043?=
 =?utf-8?B?ZFNncnZPdUcxRzZiL2I0S1NlMVptSnVkQlovR0pBSi9KaHhPL1JQdnlOK1Fn?=
 =?utf-8?B?bmViVWJZdDZwL21aZjUrbm02S3Q4aWk5bEdEajJVenlBeUJEZTRITWJLdjkz?=
 =?utf-8?B?eXBkUmdzRXVaYVJLVVFaSUJDRWovUUVaSllzY01YOGtKQnRmYU9iZFRnRDJB?=
 =?utf-8?B?WGRVVW5HUzg1MThCdnkweHRKZ3VZUzhESC9mZGtXSU0vaWtNNDRDTTArc1Bz?=
 =?utf-8?B?S2tZcjBLamZPbVJLYXBUbHJWSklRWmp4bFYyTGpEV2dyekpPdmNwQzViZ2hw?=
 =?utf-8?B?emJHQnNNTmVnQmVvL3pTdUpJazdCME4yNkd6Yy9FbmFvVzdjQ3FWSURYTStj?=
 =?utf-8?B?aGYrL3R6SUZxczVKejhFVysyUVNKL2F4OTJXMStjcFZReklBVGg1NFR5QnV1?=
 =?utf-8?B?WVE2ajJjZndyMTBVK2JBOGMzQWIweU5ZMStodGJJVmM1ZUc1clJ5N010OXNG?=
 =?utf-8?B?dmUwZ1JpYVUySzdPQ2ZLbkFRWDNZRGpKcEtVQU0yc21nMkFSSGtrT0VGanZF?=
 =?utf-8?B?UTd6T1dhOXFCNXpVdXo4Z1FjTWdPaG15V0VrTXFGMXhRRXJydG5RWjBvTWVa?=
 =?utf-8?B?dmhxM1FoemdHM1JYbHdsU2NTYkZrY1NJZkhKTFhPeC95eUpqRFhmTWNHZmxL?=
 =?utf-8?B?WGRaTHJmNlRYN0QydDdzdHplS0ZRQzkwcG9iRU9QZFB6eVFKOFpKY1lnUTNI?=
 =?utf-8?B?NXV1WVpUVWdMTXE2dXdNbEI2VUxnaTByRlpPR1o5UHJQbmFpcVlFUTYzWmlB?=
 =?utf-8?B?YW1JMWtlWEJyZ24za0dkWjg0akFDSEgwaUpKbnVKNWRISE9lQlVWc055bUFn?=
 =?utf-8?B?MkdINk1oMm9ON3F3NjQydnJmSGFKbitvN3BJa0tpenZyTXNRZkVmZ05vY000?=
 =?utf-8?B?VlJWUW9QeDROekgrdGl2VzgxcE5FbTNCb0pGdERtbERMZXJlV3BYd3dsMHQv?=
 =?utf-8?B?a1RWLzR6Ym8wcGMxTDQvelUvU2g3SXdvWVhxVHB6NmRKUDBXY0FyV043Z2po?=
 =?utf-8?B?NWNhdWhuSk5qa3B2Sk10QTB4UTE4L3RsVXdxdGZNVXFnMTJDaG96aXZMc3ln?=
 =?utf-8?B?Uk4rWFFldmcxM1JqdzRZNWRLaEpESmRxbnU4S2NsNm1rNkhjdUNMTHhjeHNu?=
 =?utf-8?B?TXlOQ3NZVm1RRUdCVlQxZEY5OUx2QmJrTWdYS2x1WExkbWk1WklFQ1I5aVl6?=
 =?utf-8?B?bkJ1OVBnVzNob3ZpVEd0cU5HZUdXZU9oNlBwQ2JOWHNOVm9CcGdpbHUyMFQv?=
 =?utf-8?B?VzlKa3hRNmVsc2pBc0w3eUlydVZ6eVJSOTN5QmlzV3pOUG9uUVdLNFlHY2J6?=
 =?utf-8?B?VHY0YXpiV2JxRE82dTloVmhJTERQMjEwZmVqTWdJdUlkUCtIVmZYMXdmUlNV?=
 =?utf-8?Q?p+T8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8451.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae9c1a4-0548-445a-89dc-08ddd8b058f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 08:23:27.4725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DliUUkfoOMAfTu3cAL7PCf2TPPXLHZ1GgqRm7K80k979kXyYt3uOMHNRKWCW/xZc7KIPVvGO9Zj2b9bZZSlfOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6967

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDE3LCAyMDI1
IDg6NTUgUE0NCj4gVG86IFBlbm55LCBaaGVuZyA8cGVubnkuemhlbmdAYW1kLmNvbT4NCj4gQ2M6
IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPjsNCj4gQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQHZhdGVzLnRlY2g+OyBPcnpl
bCwgTWljaGFsDQo+IDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
NiAxMi8xOV0geGVuL2NwdWZyZXE6IGltcGxlbWVudCBhbWQtY3BwYyBkcml2ZXIgZm9yIENQUEMN
Cj4gaW4gcGFzc2l2ZSBtb2RlDQo+DQo+IE9uIDExLjA3LjIwMjUgMDU6NTAsIFBlbm55IFpoZW5n
IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0K
PiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL2NwdWZyZXEvYW1kLWNwcGMuYw0KPiA+ICsgICAg
aWYgKCByZXMgPCAwICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGtfb25jZShYRU5M
T0dfV0FSTklORw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICJQZXJmIHZhbHVlIHNtYWxsZXIg
dGhhbiBtaW5pbXVtIHZhbHVlIDA6ICVkXG4iLCByZXMpOw0KPiA+ICsgICAgICAgICpwZXJmID0g
MDsNCj4gPiArICAgICAgICByZXR1cm4gMDsNCj4gPiArICAgIH0NCj4gPiArICAgICpwZXJmID0g
cmVzOw0KPg0KPiBDb25zaWRlcmluZyB0aGF0IGFtZF9jcHBjX2luaXRfbXNycygpIHJlamVjdHMg
cGVyZiB2YWx1ZXMgb2YgMCBhcyBpbnZhbGlkLCBpcyAwDQo+IGFjdHVhbGx5IHZhbGlkIGFzIGFu
IG91dHB1dCBoZXJlPw0KPg0KDQpZZXMuLi4gd2UgYXJlIHJlamVjdGluZyAwIGluIHRoZXJlLiBN
YXliZSBJIHNoYWxsIHJldHVybiAtRVJBTkdFIGhlcmUgaW5zdGVhZA0KDQo+IEphbg0K

