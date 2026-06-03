Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ISN0N/RDIGrlzQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:10:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE96638FA8
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:10:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=dybpI2aZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1326774.1592111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnEa-0007BL-Lt; Wed, 03 Jun 2026 15:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326774.1592111; Wed, 03 Jun 2026 15:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnEa-00078X-Fl; Wed, 03 Jun 2026 15:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1326774;
 Wed, 03 Jun 2026 15:10:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUnEY-00078R-Er
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnEX-003lKh-D1
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:10:17 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2043d1-5cb7-0a2a0a5109dd-0a2a4502932a-28
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:10:17 +0200
Received: from [52.101.85.33]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a2043d5-af86-0a2a45020019-34655521515a-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:10:15 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CH3PR03MB7315.namprd03.prod.outlook.com (2603:10b6:610:1a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:10:11 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:10:11 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHVX0raYosYzKRJvkuJLDj8ObmSU02Qtg+TASlck58UkzfTicuqeqE6F5mKdOgXMy18N2yJuLTNtH1HD6yztzRLuUXji0GVUR0TEUTlxQI+0gH4GXwPwOVb8YSpQyJiujUSoSfrspRHwXRHCQ42J05gtHsDhAnfeODwxvafSfOXVqO3URuUO5byXgBGTrttGYDxL/wVJ4lJbqhkJJfzY0xni2Khue5zHyT7sy/gJmgPkk/Tbyp4K3EQCmpI1qcFCSgg9OziQOF5o2ymlh0gPf3P8zRbMCYZSVpD+fkyMNLK0nJCD2hv4DWV6157IRtI4CYySm2vcA37GKX5ArcD5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSbnSA9m+kS1M57IBUPBBLOQqunbSfWY6mjuPHpdsGk=;
 b=Jd9VdpLfXrkfCMsWGzUiB8+xOo0PaYUSHTgs3+RawVy1TvRaSUNAWyW5aD/eVb/vH2j1mdYjGO7gZZo6s6wgbyvpjGcFpQhflGsnopmjK8IXscSiJYTG/JdpQx4aMYEQEIc/qRobg7dRRU2X60x98+aThMWxCI2qSY8c7iC/WQd+MxeHlWX7eNhZ4tKE/6ET3HaJnOdJBA1qZd0bRKi/yzbXabBn9THF3lDqFHJHROqOhHYgV92xKq3NuMGXV1f0WCu6gRVEXjIDnzRPR5A27lbn5XJ5prCtgSd662519AbS7BzAdG6KhFb+3Mv33ImoCqk41+Y0ybCP0Wi3WM3M2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSbnSA9m+kS1M57IBUPBBLOQqunbSfWY6mjuPHpdsGk=;
 b=dybpI2aZ4fJxHDR8rL9J6NzS1qDsta3X2cClbXII7HAq8T/iOs9I9FkMiYuDlEG3EDtyS4f/m4pzyMY7fOVZyP87YO+18U4SumZ8lQTdtqcs9dYbYQmekA57o/GHIAusV94eHF/U5byBUxU2x8YyGBRZ48RsC+uxC9fW5vEzD3Y=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Julien Grall
	<julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Thread-Topic: [PATCH 2/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Thread-Index: AQHc7rLUQyi7qO4hw0W6XhkhVW8evbYrc6cAgAF7bZA=
Date: Wed, 3 Jun 2026 15:10:11 +0000
Message-ID:
 <LV3PR03MB7707736F964A13CE51AD06D587132@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1779980244.git.bernhard.kaindl@citrix.com>
 <9ffee13184b4499218fc80544bd3ee1a06aa2898.1779980244.git.bernhard.kaindl@citrix.com>
 <528ca4ba-7b3d-4cff-b05a-5b9307f5604a@suse.com>
In-Reply-To: <528ca4ba-7b3d-4cff-b05a-5b9307f5604a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|CH3PR03MB7315:EE_
x-ms-office365-filtering-correlation-id: 57118aba-9847-49a2-a117-08dec182352f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700021|18002099003|22082099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 a5uaDMipy1Kep8gQ92tDdjlUMb42zJo4rFpp9bv2uwGNwCUUqAmpJs1fCrobX8vBfezJ1Opx/dGdiY6Kg280ZXnxijPBxgeK+LVUNI24uQzygw10FHEAkTKhVmECJTSJACtoDCR5DatKZ/4dNFXV6fo8Oyr6ATq5LMjc715Iq1e8MR57UhAIUC+Q6rcF5CYsBQDdA4JIsgvEyx3XkRDaanswR/hJJFjVIpwTNM3qwvaT+6nS/wKZy2gD51xbc5ORnknt6ZEZ2m45cCdkBj9AHwlggmAvD4YyAP1+S3PjoWQUa6dPn1gtPSwUMhZ7Qntbwnf0zQz+JnfMmj+Uyjiiaqc/jRcv43FZJpMFs9aV3MUQCe2RC6mAXV4/PN5IA/I7XHw+jjIH/oB/sWbDvMVvSAeWOL7R0RBBeu+wA1CSG792Kb5h4cfcy7lSMtxDHIa5E2cne7Fy2OKYQRADVWHYk4QlC1+IBIe19R6Kn+8h27DDOXfg1qybc0KCDqM/eG/cLJkSHsnnOCmS8GcI2s+8np0M6nxITuXc3jTwWWwg+f7De3FzhRIodKHIsWSKhHkJb3FR3DJy+R5HwWzqxpOpeZJzJI/aS3L/9jR2RmtbT1G7xE8S9TJYqzcUo3djOHrYJLoYXNTJEVmEG+FgivHAEFph39k9Cl84E9VUyQQnUzICk0qnuoCu6DQRcpHMCuNMUYSO9axdtsY9zqBwNETxDyH+68Vm5OlCd7Q8JmR2rhYav7gvNEmaoOjGNP2YHAlK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEI3T0ZUbU9LQWJ5ZmZZK3ZJUmFrWENFVXFDa3d0b293SDJLeWVtQXdkRkRR?=
 =?utf-8?B?ZGllcmJkc0p1cGtMTmlCTkVHRXRrWDZibi9OSHVBMEJ2Z0hHeXZaakNQVDNI?=
 =?utf-8?B?d3RXaWJkS3llVG1jZ1NDVllEUW5GTnZ2aU56ZVhGOXNwV1YzVUxsN0lrLytn?=
 =?utf-8?B?blEwZkZqMXc3bWNUeUoxV21pV0UwMXdxcXgwbDFVWk5UT2xOeWppanhzU0R5?=
 =?utf-8?B?eExvS3dsWHpKUy9QTTRndjRVaTdXcytyWmxkY1hGWmN2T09Cck9ET1hmQk9z?=
 =?utf-8?B?cTBkelU5aTFQVUJRam5wU3kzdmkzUlBKZUxEandSajNuVWtOYnQvaHVrSlA1?=
 =?utf-8?B?VHJkT0FYZHRINi81VDB3aEFkVkNKd3VMVThCMEZqbnM2TGdYc25RRzV3OWEz?=
 =?utf-8?B?bUhkY1RFVUJVSXY5ZWZYcHM1Yk9nQ0Vxdm4xN0RNVGZvRGhTTG5EMHM3ZDVn?=
 =?utf-8?B?Z1krZDFyTHd6ZkZsek9sRDZVMjcyZzNORWlqK3NqZXNrb1NLeXVhUWdlb2tl?=
 =?utf-8?B?YjlQaEVTUlE3RS9NRHpqNi83RnFKcTAwZU41UnYvWDljaTFzUC9JZWNPVkhN?=
 =?utf-8?B?Z21GUlZCaXhod1ROOTF4TUV0MU1EQlVkN0tCNUdZdnFWMXJFSkZuWHo2ejFX?=
 =?utf-8?B?dWhEZGFQQ0hIVDRnVjlkS1phSTdBUDRFcWh0a2NCcGk2WnQ1d3NzekZ5QjNy?=
 =?utf-8?B?RzdnSWNiaDlwTERzSmNDQTYyZlVDeXRrekhEYzZ4eXVxT085M3ROWGhtZkpY?=
 =?utf-8?B?N2NrN1cvTXM2NUYyWHAwc2w4OHRnLzJyS0ZDeWF0M29YM2Q3aHBOeW95UURa?=
 =?utf-8?B?R0l1anB3TTVrcGp1eFJYODhwSnF4Q2ZWQmZkNGNUenZDbzFqRWNpM2RzYzdw?=
 =?utf-8?B?eUdyRGg5TE1ZR05wM1B1bUlNQ1YwUzVqM2owdTNpcC9UaW55MUZOZVlmeTRY?=
 =?utf-8?B?eEZKVVFGQlRIdzRUYi9XK2ZGZ1IwdEE1ZHY1V2hwM1pEU2RTNEsvbHNUR2d6?=
 =?utf-8?B?elZGOVJxNUFVYXZLVnF2Nnl1cytmNjZSS20vMkN5WVFac1pRUkJEY0l3cVRG?=
 =?utf-8?B?VXFYQWIvSmtxNzA3TUFJK21CV3V3NUUwN1Z5TFJEMkhUKytKRGJQZ2t1c3hs?=
 =?utf-8?B?T3U2TDErd2F4MlRhSUZJTjd6S0ZycnF1TlAzSUxva1h2OGNUaWo4bVhvYmgz?=
 =?utf-8?B?MEYvTjJSR3pCR1VmVVNyKzdvQWpwdm9uQVhBZzlGT0JzUVU2bjFiMmJaQVl4?=
 =?utf-8?B?RTBsVldvYTFOa1hmYitTTmRnVkNpSTZZQ0Y1VGI1UE42YlNRaTBxWmk3RDV5?=
 =?utf-8?B?THdSK20vZUIzVVd0UmdlN3BaMWVoZHBFRk03d3EwcHhKdDNYYU5vTVN4WUMz?=
 =?utf-8?B?QjBZelg3SldtVGU5bGVCRE5TdWs0TVM4NUdYZjBxUkRDcVk5cHVOWDM2b0RP?=
 =?utf-8?B?YlJpTEpxdVpOMm9FcjRLSnBtdnZrNUJYcXdjaVN3M01FUWZBQXVRMDJkU2lw?=
 =?utf-8?B?dXpuOXBIOHBtdENJb2gvWXYwVVU0VkVuNTNmemlBbUgvMXZjVEtvay9TcDdD?=
 =?utf-8?B?YXFnVHFnU1V2bk9WNlA4SEUxVk04Kzd5eEM3d1ZqZk42MjZtZVpEZjNwY29S?=
 =?utf-8?B?RFJXYkE1dm1ETnpObTlQTnRrVHkyRHBqWTFwMzhmVUdlblEzWEI0SWxwcjI1?=
 =?utf-8?B?bnZHbzZic0JaMlZrS3JIU3ZEeWxaR3BwZ2RUd05hcm04ZEVsaE4wN3NsVXhl?=
 =?utf-8?B?cEo4N0dNdks5dlcxMnlubDZtSDY1WGJ1M3JEVnN4RGphVGFMcXc0d1MxQUZW?=
 =?utf-8?B?MldvcXpiWXVoWXYzQ3BrV1JkVTV3N21WV0hMS0x6dTVUc0lqZzFZcExvenlM?=
 =?utf-8?B?QnZrUHBrNVQ3R1BoQ1hMN0FxN1VqSjg0cW1LeTRDUks1aGNUZHVJeXlGN29p?=
 =?utf-8?B?MTIwUG5PdnBXcDhTaGR0aU5OZXhyMlh5c201M2ZKK1o2MVhwZXNHRnJXcEpy?=
 =?utf-8?B?RWxCNzF4dzJSb2JCMmwwR2hxTFI1UEFySHNrZnBvVGdwa0pROTRYd2xQVGY3?=
 =?utf-8?B?a2FuQ0VHd0dyWmswbnQvQnVkc3hXdFhUZE82cFRBQXlscHpUR2FhVWZkay9N?=
 =?utf-8?B?SXhjb2NLaEN6ZXhPTUEwSGRNcE1SRWk3RU5HRVZ2MjY3VnVzVGtQMkhiTDJB?=
 =?utf-8?B?UjNiUElCRmlZclpiZnVKYWt2MnVVckJOa1ZtUzYrT1FCWFBYWlhibHQyamRR?=
 =?utf-8?B?N0JsYmNYejZoZkIrZ0tCa2YwUk81NVAybGV4K3gwYnRscE1MVWJTeUU2WnVO?=
 =?utf-8?B?ODZJcmpreG05dnhsTHdYb3dTT1BhMVB2QnVrTDhYNHZXR0YwN2NodlRpd3dM?=
 =?utf-8?Q?Aga98XGI/nmUaQD8cI1MfWR8Xj8eT2/KV84aEMmemXC+z?=
x-ms-exchange-antispam-messagedata-1: BCny49XRG1Judg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57118aba-9847-49a2-a117-08dec182352f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 15:10:11.4873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iu2pK240xhDe+uycvEcmveM+paNU0A3F6ToQfQ4N3BIn6n8Gsl3ce99nlST2/A/Y+IrYMvaGoiA61Jv+9gD7jf20pTvpbSJdNQ4ZyxFOohQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR03MB7315
X-purgate-ID: tlsNG-720697/1780499415-81D77161-C536C786/0/0
X-purgate-type: clean
X-purgate-size: 424
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:andrew.cooper@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AE96638FA8

Wy4uLl0NCj4gQWdhaW4sIHdpdGggdGhpcyBzZXBhcmF0ZWQgZnJvbSBhbmQgbW92ZWQgYWhlYWQg
b2YgdGhlIG5ldyB0ZXN0Og0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KDQpBY2ssIHRoYW5rcyBmb3IgdGhlIHJldmlldyENCg0KTGlrZSBiZWZvcmUsIEkn
bGwgc3VibWl0IHYyIHdpdGggdGhlIHNhbWUgY2hhbmdlcyBtb21lbnRhcmlseS4NCg0KQWxzbyBh
cHBsaWVkIHNldHRpbmcgJ1BGTl9PUkRFUihwZykgPSAwJyB1bmNvbmRpdGlvbmFsbHkgYXMgc3Vn
Z2VzdGVkLg0KDQogICBCZXJuaGFyZA0K

