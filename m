Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLN8KA316Gl3SAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:19:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03066448741
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 18:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290878.1570327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFaHx-0001am-Te; Wed, 22 Apr 2026 16:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290878.1570327; Wed, 22 Apr 2026 16:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFaHx-0001YT-Qw; Wed, 22 Apr 2026 16:18:57 +0000
Received: by outflank-mailman (input) for mailman id 1290878;
 Wed, 22 Apr 2026 16:18:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFaHw-0001Xv-Dv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 16:18:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFaHv-008FX4-QV
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 18:18:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8f4e6-e002-0a2a0a5209dd-0a2a450cb2a4-24
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:18:55 +0200
Received: from [40.107.201.50]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8f4ed-62f1-0a2a450c0019-286bc9322078-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 18:18:54 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by CY1PR03MB8121.namprd03.prod.outlook.com (2603:10b6:930:106::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 16:18:51 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9846.019; Wed, 22 Apr 2026
 16:18:51 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEMzqtywbgOdSbvboskv/unqJgADlWRDtLxXbZwD8S0S/nrMqy80JLv+r5iujz0Eb6k56ezdG8WgGIwTGVWKfnGtKgCPmYM8EjNeLedbK6wRNMiiHL/TXix0LLsNrn7LjO7tagVHYBPjmnRAjLlvHJm0+D6ljY19xachFA+jx318YorvuD9WQgKXKmezjEMuTpfT1/6f3v+M0hBjSQckvFVL55HK5oLzQF3JYaWA+b2keUBbZcfKTXctO5iGKowgwKX3KO8Us23HdepZaQkTH1zO+x1hJsCIBkDkuZ3QBmIX/PuuoQYxxpGBoCzU1nxNnf13750Ia/v3yjyDBPB/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dhHE4C2V+S7vfTWecnNFpItzw+ypjnH2myp4j86ApY=;
 b=cKAJ2wrMXuPFYUXi2rMNzkuuUsBw4VyPUoFrbVCLGDCc5CDkAMVKg1/abbgf8YB2Ufqf01C03g8TBRO7+ao0ex1rECLNnNXwp/+ty+kDtGWF3jG8jZu6khdujtnNoRxaZGjbBkVRxwv9dZSnCScGttfBXuTGqkkblT21LB0p5Wn58/fASOyu+zjUEjEPYSF53JfCQbq3YWl4dK2Ki67U08ZkpmFQ4QfVXNEC0dTBNbYfCMNrXF5h90Jeumfz0/1LFqNkWVbxEnasP9tDXl7O9LN6HAgNoCKcA+56GNLOca0D7eKNULLpQzyxXtsYUpn47Y9h3nbMSPZMfW7iEnk16w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3dhHE4C2V+S7vfTWecnNFpItzw+ypjnH2myp4j86ApY=;
 b=GuURv9JDW5bo8Pt9KpHkcA2xDWTbhaRSZIYPyOfRsb3Hn1TN+9vyTHgafHrCg4/2HWNSLPOyW0Miwh+ZmpagY7Fi/yKA+C2e8BTpl7gvT9jHfVTtaGAX6vH6+7utlXYxiFPHqf4QIiVyA69z5MgeBzjF64hIkt4PBq/VErRZJLQ=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Topic: [PATCH v6 1/7] xen/mm: Refactor claim deduction for later
 functional changes
Thread-Index: AQHczBIVjQaUKhelwUCYpZQxzVcChrXqzwoAgAB242A=
Date: Wed, 22 Apr 2026 16:18:50 +0000
Message-ID:
 <LV3PR03MB77073133E13DA7F0CE5CA983872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
 <5302d33e7e896347acc7a8212df4f28ea098e28e.1776172526.git.bernhard.kaindl@citrix.com>
 <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
In-Reply-To: <3df7352b-7502-4c2a-bc3f-0cb4fa7014cf@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|CY1PR03MB8121:EE_
x-ms-office365-filtering-correlation-id: 703b5426-2240-45e6-36e1-08dea08ad73f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 b2kcKnB9QX4ARusuevpiWLTIDmwqDi//VFxUGCpzboq2odhZdRrNC67t0/9GpB3gQz1Vb5Jti+Kir8EBLOv8vbD77agAu2/mzHhrDbPVy75FHD8lDk8Vg+U2lFKg2GqM0hSf2G5BTc8jJtesp173yygykwHEMKdeNI9MSuBpeYeDn26bRGm5aRNA9f0FCal7vZj1eGbk0F5jLgq2ORJlAIXbLr2fLM3/VyiH5K3CpgGz3/ELZ3R009zlzb1DNrqWQtRX3728+29Hf9Jj7hP69Mivj5i2rfEa5AtL1OiBobXn6mqko4Xx+kbz+9n7LL/pfL4eBA66gpBY8GCqU28LA0IAQpWLoM0+hc1N5ECETHI9+D4Hux8FHzOlWIeP20Tz7t7HqB+FS8RbLTjl+e6oBrfyHHhqNkz5Am683MUjJj/bX8cwUPLMXg9Pe+T3Roub5Dkml+oA/+kHomiE48d65KF2+8ebf/yLN94M0dlAYlGaBh6uEU/Ffi+8g+8zFMX0I4EYF6TqbdXc7U8EB7NaiB4gyjwYVF1MPHiHaLZrLKRq4CER8CU1lCIEuL/u3zvDM+1QqAaBw5GpucFik8d8kmNrUKwq1LY6bAwyO7a6nXwBGQ7t6u2V/e5Y1D8pAmxuEsTwCDK/Uqnb7FLhnh+T9LoupvtkzCAVHRU4+gkO8vRQd61FOCYKzP2I4spI3AfnyWmctncuKXW1lfaNOMJJXCQNfI2pMIVEltlPMfOIuB+NDMh+xhtRbK22qtGQuzTCOCzfk94piFFG/VP/eukEVgmkb+Yrci16d5i0JveZSHo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVhEVUVLTVErTHI1L1pyLzFsZVdSU0VQdG9hT2lMVDBFZXpYMDdLRmp2a1Ax?=
 =?utf-8?B?TDJpKzZKa2JzRWU2bzFrUjZlSGoxTDVwMG15eTQ2QXRZaGMzTjF0bkNna05s?=
 =?utf-8?B?NE5mMjErbEx5ajZCNllxK1oxOHdWUkQ3alVJeXBsMXo3Q3hOMnZhZlNYaEhv?=
 =?utf-8?B?VFJ4d3ZKSkVqTlNQTGNjSmkzampVZG9OWVI3ZmlJZzV1YTJZNVZzeW4xUTVn?=
 =?utf-8?B?TXBEOUQ5U3lLNUgwTjJKWVVMVkJkVi9UVFFBNmxSaHR5c0lPZExBNDFJQy9T?=
 =?utf-8?B?QnEycmtXckNvdEhzcS9aaDlWZllSaVdmekVMaitRa0lpemIwcVpmOEtsZW0w?=
 =?utf-8?B?RVpsaFArcTVQaWFjRHdRRDdTNDdiU3dlS2Jva2pURUoybzl6YzBWeUxFdzNT?=
 =?utf-8?B?dThBL3FVR0kzelNKbmxuRkxnYnQza0F2L1JSbEl0L2ZpSXZWZlVSczlRQkRp?=
 =?utf-8?B?NXVTQ3BMT1phMkNOejBnWElkb2w0Z25QdHJ3U3grTG1uQkVMSFdHd1lodFY3?=
 =?utf-8?B?TG9Rc0xvSDd2RTY1aTYyR2hNeFJsaW9vVUliN05LeitXVjZPVkZVVmZjSG1M?=
 =?utf-8?B?b2xZNGJjcld5QzM0TExLR1UyU214K3VnQjI4Mkl6MkVvZHlwRFVMMWZleUNz?=
 =?utf-8?B?TnYydXhrL1VYWHZNM2FxUEhpbldrczJUTTQwakpTeW0wT0FHMld3Ky8zZTZH?=
 =?utf-8?B?cjUyZ1Izb2wzc2xjTERMRFRwQnhEVllFd1VxaFVWb2s4MTEvNGs5QUhNM1lF?=
 =?utf-8?B?S2djeWVwY1BGOWpMQzFsYWMyWTZ0dC9vNHE0czVNaCthTGV3Ykh3SGVBRUhs?=
 =?utf-8?B?Sy9vdnVPWWswaTFZN1FBdFVuOE9NU3BQZmFxT1NiQUxRKytWY0xremlRZ0Vy?=
 =?utf-8?B?aGY5MWRBbFRXeG1EWGNUbjRoV2M0Z3lmUm83bGszTTluMHh5alMvbEJ2RkhW?=
 =?utf-8?B?cEYreXBFS2Z1Q0JHZDdnRFh0Mmx1NzRYalRWZHd2ZHl4bGZzV2xMUjJmZmN2?=
 =?utf-8?B?RTUrUXcrQlhBUWJEVzBQVHAySVBGZFVod2JSbkZYNW9kanB5OEwvN24vYXpp?=
 =?utf-8?B?QzFyNm5hcFZJT29zaHNFeTZnSnFZbUs5UTZvbE9QVE1VMnFLQXZHUGxTQ0dr?=
 =?utf-8?B?MURhZkszSXBHbGdDTEthOUNpYUxTY3V1ejJxSmlqbFRpWkRXM1N1eW8zZmIy?=
 =?utf-8?B?UzUyQlNmOFRqQnhYcDQvUy9yM0R2dU1SeURPM2pQN0VidlN2eUZ2aFo0amE1?=
 =?utf-8?B?bWtOeWQzRTlpMlZ5bzladDB2cldxanhqZGFoQ1pmSHdRc3NCY25sZHgweXJS?=
 =?utf-8?B?SkZweTNwRjNTbVFVcDRxbnI2ZkVzNlM3c2ZKL2Q5bFJtYXU3b3lHNzZwWTgz?=
 =?utf-8?B?NXV1T2gwUmpyRmtLMnpSY0VnQnp6WjlmdlNKNDQxT0p0ek13MEV6cTVEOHVv?=
 =?utf-8?B?OXR4L2JpY3YvVEhDMmxSalBRSjI2cDc0NlhGd3dDSm5iU0RhcDU0VmxRako0?=
 =?utf-8?B?b1FJNmdYZENmSjdkK3dKa0FqdDdCT1paQUhTQkQ1VW5oSFlOaTVZMVFsVWVn?=
 =?utf-8?B?cWUyQ0NCN0x3SmZjY3J1MFh2MDg1ano2NUxFN21udlRrdEtNMWs0cmIza0Nv?=
 =?utf-8?B?am9xSVZ5dmo3R0NSaW5TbTd0bjJHYlFNUG93OE5JM2N1a0FHVk5DSUg5RjRM?=
 =?utf-8?B?bHM3bmVlQmRYYU1xOFFzakpNcXZSYWlVQ3lySm1YOThGZXVnajJPVHRadldm?=
 =?utf-8?B?UksycnBDLzlLdHVucHBZc1hQNFZaRmV4ajJTMFQ3aWxVUTlCVlZML1ZhUGJF?=
 =?utf-8?B?c1Z2U2puZ3p4enpMVGFaT2NFL1EzWDhLdjNad0NQeU52eVpoeFE3ZjArNEpm?=
 =?utf-8?B?Slg2RHBLM1FYeEVEK0R5UzRFYm5DQkVGdW5TODVrMGFGTzRDcWNaSWNHMDFZ?=
 =?utf-8?B?akprNTBZdlI5UnZCWFNUbHkrT0loWk1jdWZCVlNwMFc5bHhLcHpManBLcVkz?=
 =?utf-8?B?T2xNVFEzOEhIbk10aFoxTnozeFZFY3pBV1NTek15VkJrREpScWxoYWxJVk5T?=
 =?utf-8?B?Z0YwSEFCTU8zbTZrOVc5ZFlhZ093aHlHeDRHeE1oSGxVN243N2owZHVwYVlZ?=
 =?utf-8?B?cTh2WG9kaGVRMVRlei9MKzZVWG1iRU1laVJVWVJ6bkdSb3M0N1haUHlWc1pR?=
 =?utf-8?B?TTlvQytDbXJLV1gzNnFDSmZab3RtSE5EaE1ZU3VibURaWEdGdXVZbm5ONEV1?=
 =?utf-8?B?OUkyTkVxNzFPS2cwa1kwa0syYk1YOUZyRVBQaStVVFRUSFJqaHRWZ1Q0WEN3?=
 =?utf-8?B?L3ZGZDQrcEhRWXZsUGVtVzNBNTl0V2Nocmo5NGNsdjczakovOGNpbXFhU3Ny?=
 =?utf-8?Q?6ZVNJPeXj74WjwjRLHM2Kn4xrn/4U9R+oEMWatum64Wd3?=
x-ms-exchange-antispam-messagedata-1: qP28DKMwqzLAhw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703b5426-2240-45e6-36e1-08dea08ad73f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2026 16:18:51.0109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nLzh2XrdYyN8OEgRxFQPml/EVzButmtF0rfOAJW5+9vKpawJz5h/n7Od1H0fSNUZ+uYnzCEzw90sh+65ZT53LOLYGkGjA7I8vAaTc9hdER8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB8121
X-purgate-ID: tlsNG-d25034/1776874734-6D76ECF5-C7B82B23/0/0
X-purgate-type: clean
X-purgate-size: 1084
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,xenproject.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 03066448741
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuLA0KDQogICAgVGhlIG1peCBvZiB1bnNpZ25lZCBsb25nIHZzIHVuc2lnbmVkIGludCBm
b3IgcGFnZSBjb3VudHMgaXMgY29uY2VybmluZy4NCiAgICBbLi4uXQ0KICAgIEkgd29uZGVyIGlm
IHdlIHdvdWxkbid0IGRvIG91cnNlbHZlcyBhIGZhdm9yIGlmIHdlIGZpcnN0IG5vcm1hbGl6ZWQg
YWxsIHRoYXQuDQoNCkkgYWdyZWUuIFdoaWxlIEkgb21pdHRlZCB0aGlzIGZyb20gdjUvdjYgdG8g
a2VlcCB0aGVzZSBjbGFpbXMgc2VyaWVzIG1pbmltYWwNCihJIGhhZCBpbiBpbiB2NCksIGFkZHJl
c3NpbmcgdGhlIHR5cGUgaW5jb25zaXN0ZW5jeSBmaXJzdCBpcyB0aGUgY2xlYW5lciBwYXRoLg0K
DQpJIGhhdmUgc3VibWl0dGVkIGEgc3RhbmRhbG9uZSBwcmVyZXF1aXNpdGUgcGF0Y2ggaGVyZToN
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAy
Ni0wNC9tc2cwMTEzNC5odG1sDQoNCkFzIG5vdGVkIGluIHRoYXQgc3VibWlzc2lvbiwgdGhpcyBj
b252ZXJ0cyB0b3RhbF9hdmFpbF9wYWdlcyBhbmQgb3V0c3RhbmRpbmdfY2xhaW1zDQp0byB1bnNp
Z25lZCBsb25nIGFuZCBhZGp1c3RzIHRoZSBBU1NFUlQoKSBsb2dpYyB0byBhY2NvdW50IGZvciB0
aGUgbW92ZSBhd2F5IGZyb20NCnNpZ25lZCB0eXBlcy4NCg0KT25jZSB0aGUgc3RhbmRhbG9uZSBw
YXRjaCBpcyBhY2NlcHRlZCwgSSBjYW4gc2VuZCBhIHY3IG9mIHRoZSBjbGFpbXMgc2VyaWVzDQpi
dWlsdCBvbiB0b3Agb2YgaXQuDQoNCkJlc3QgcmVnYXJkcywNCkJlcm5oYXJkDQoNCg==

