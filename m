Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INCVKX208WmwjgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 09:34:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2549085E
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2026 09:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1297051.1573179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzQp-0002zb-Ti; Wed, 29 Apr 2026 07:34:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1297051.1573179; Wed, 29 Apr 2026 07:34:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHzQp-0002xi-Qj; Wed, 29 Apr 2026 07:34:03 +0000
Received: by outflank-mailman (input) for mailman id 1297051;
 Wed, 29 Apr 2026 07:34:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wHzQo-0002xc-4U
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:34:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHzQn-00BXbo-2d
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 09:34:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f1b461-5cb7-0a2a0a5109dd-0a2a4504e63c-30
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 09:34:00 +0200
Received: from [40.93.198.32]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69f1b467-1dec-0a2a45040019-285dc620bc10-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 09:34:00 +0200
Received: from LV3PR03MB7707.namprd03.prod.outlook.com (2603:10b6:408:28b::21)
 by DS2PR03MB8466.namprd03.prod.outlook.com (2603:10b6:8:333::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 07:33:58 +0000
Received: from LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf]) by LV3PR03MB7707.namprd03.prod.outlook.com
 ([fe80::97e8:ef9c:9031:e2bf%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 07:33:57 +0000
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
 b=i4vUdG/q5PMZc6lR6SLWMm3JOQ056zM/S8pl2VHl8hMF0B8C/eUILtoeZT+efrT+9T8kVnTTNR07TPneTmiE24Nfg112TsqlboE9oinOjrL4YYjYmmKGjrM1dHYig66MHgSsuJDR04W/AdQOMmxFoNHvVTvnv+NkORbhym9m4i3mj3xJTOPKDdmki9etiqrTusN26OyIsIqoPv7YSg+h/qjk7VkmysNPz7kmq8jzWSjHKxpwVE5opt20DKGtHJ+xuzOh3bRAJqIchAJnLt3m5Mp06p5JJsfLfDPO0K6i8CJ9iZSBFtHNkSRqctzkCkYAwMyC5c86zvRqjM1/7dUMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gd8n0gVGRnwJgk5/jNLaNpWwMkUJDhbZWIsAqyGDX9E=;
 b=dpw5NyxELGWmBH5ehW1vlLr0EOJsaSEI9AjbJMxqeiWcJgujsQtk4V6ae8YKyAEbHZlay6tr7WOEll3w8DLUZJ8reA4295O/TkgmTn+WYDgerNSNnMe7h6C6kJDQ/LMG6v9IHvFZYlBkqYnF8pIAJn13TVCMWtRXo5usGLEcvrVnVmrvcCmkhg2tKdzGTKDaMOwQm/YgunkaFXFywvZmj8hIy9c9iLn0Lg6FWSJJy0Nk6FPVORS9r2DlwunNXCLLhknmjbOJpeCotsY5Ad1BgR+p+TjX/lmEj4lr/YGQau2TlKPMbkeoWN9joWjTgOWiwZwTCz/IeBvmJR28Z7Yi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd8n0gVGRnwJgk5/jNLaNpWwMkUJDhbZWIsAqyGDX9E=;
 b=WJu2uafX60QyisKeTqE/08xLYOOx7HgnRcnt6Asy54w1xIwLcxChavTlbqTOw/flNJWjsbL+pWQvPwh7j1w8VmD4UyAYuAlzqaKiUU8M7Iv0sAqW2T0ZyTa1715LINrjirgDKpbIxHOzykK95M0F4m07I6Njcco2tsh3Y4sSrPc=
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH] docs: Format (void *) to fix reStructuredText emphasis
 warnings
Thread-Topic: [PATCH] docs: Format (void *) to fix reStructuredText emphasis
 warnings
Thread-Index: AQHc1z20FhXjWBnhSUiHAkPe/4C6NrX06uYAgAAAwNA=
Date: Wed, 29 Apr 2026 07:33:57 +0000
Message-ID:
 <LV3PR03MB7707443378FA9C843ADE372587342@LV3PR03MB7707.namprd03.prod.outlook.com>
References:
 <05b61bdfce381176a6c4b8844db1fba3fa0982ce.1777401225.git.bernhard.kaindl@citrix.com>
 <a5b035c721707c53756b45e48ad473ee@bugseng.com>
In-Reply-To: <a5b035c721707c53756b45e48ad473ee@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR03MB7707:EE_|DS2PR03MB8466:EE_
x-ms-office365-filtering-correlation-id: 649ecf22-c712-4aa2-6d1a-08dea5c1acb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 RxtmR2lcYpC6cdUpbDLV5VrYEUpL0ftGPZT3bLyYb1hbBkPt4PmNUT1qTmatrwOKVrf8r6ZIyJlqRvI7kf7eiBi5+A680kuEfIt/ZMoXai3cCOwpK3SNVYUOfvIvY3cya0w1anNFRzh8m2lWH0Y2eFYawPDrhbji1EjZiIXPYTOxh/KpazvIIVyViSHvvJse8KA+IjrrK6ErpRYp9iAuyyzUNTNzRsh1FmzTC1DPXIYvXpKfZqM4FAvT/GdQrZDoygyrp+XCYapOv1HMlfkIOj/tJ4bXvHk7xeFiP3oYJouID10/d8AHp6ZEZSd3t8F96QwJRop0y66DJBm1aYI68oddFLKBgB+UuivVgIMXCiryhEMbxpOJYKN15S+5zplK1WLEnp55hTW1lqiqG7BI/l5Qdr5qO4Ee/HSlWBMCHnKVcB+1enRPlz9Y2/JmETG9QcJJ3c32n25XHnP4LPRib+Cm9rcFYIC6oRZkPDXwg3aUv3tV23FaC6bcYLsi08yA3dqTuHbXhu+SY1fI+Qf0DDlNdvRuPDn6AsPCY9VoaCokTfQQqSKUnZ/6IzMBAbUVmEKpG6XshqbKNhJg7yCBbSHhAX8hotfb5+Ev2J0yNm1K+MmX87p20+F/1to9XlvCCjr3U8h8cIOnZEjkw8blO+q3xsLCEEmL0Zc1mZ7ChcgCs8bndR0NFz9fue08J3NImIjeubJELmIlC84eKoW4wsrr0QyfVuI2k46Up44dXqZsrUCWGtNmMaHW3F9hp3k6lA1+53vUybMLO47ik+xZhzSJBM+xHH4z6lc8yJXNiGY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7707.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aXE2TWEyUm5UcUhuMmRRR09OU3h4U042eG9WdlRCK1dCS29UdW1CZnh1WWd5?=
 =?utf-8?B?NnVhM0h1TmhGVFY5bkJ4VTJoN3NjVlpFWkdaV3pEQWJWWjJ0OE1TT2hvRGwy?=
 =?utf-8?B?eXllVUs3dnZBUmVnRU1lM2hhVDMxbVFBYnBUM1pzS3RQM0RZRjZYOE16emJL?=
 =?utf-8?B?UXBBQmI0YjhRYkJBK1hCSHB1Sk82WXJPUEdiQzFyT1BvNW8xbmp2QVkrZXk4?=
 =?utf-8?B?UExTRXdkaG0yV3BFOGFmdkVMWjFvMEVIMUdHSkZUL045YjdBUWRtRnVuL1hw?=
 =?utf-8?B?L1pNdVhEVHczeWpRYmFYMVkrc2YwMU9PK3VlMlM5ZU1ieGVYWWc5ZkR2aUpZ?=
 =?utf-8?B?Z25vY3NMZUZqTXhFSS8zRmhDeXo4U3kyNzdQY0txbE1pd05WbFBUZGJ4S1JX?=
 =?utf-8?B?QW1XSUEzNk9JbUpaWmRxZS9Vd3Q3K0Z2U1RTOGZOT1I1RDh5Y0s4NkYvZFFZ?=
 =?utf-8?B?WFRLeCsyYk9NQTJVTEFHbktGOE5YN05nL04xZUF1UWw2bEFQVEQ1WDVyb1l4?=
 =?utf-8?B?Ri90WEg3K2dhZXg0MUNhVkx1b01uTXgyQmpCSjNQYmMremZCVENsTWpwWmkz?=
 =?utf-8?B?QVNOZ0txU1dvYnB1WlJqZ1loQ2UvQlpPaTE1M0dLbG1PSDhWTyt4Zjl6REJH?=
 =?utf-8?B?VVVXUXpYV21LMUFxUlloZzF6UzFnb2pYcHZLQVN0V1ZvWVFtSFhvbzM0SWlM?=
 =?utf-8?B?dnVEZTFQWGV1MVB3YUFBbVUrTjlvVTNJWFlGZFZYZWpPRVUzdFNZMGs4Y3h4?=
 =?utf-8?B?Q3BXZXdHajYveHo5UEl0bTJNYVpNNjVHZ3cxTGMydktDYW43dWl6a1VtS2lj?=
 =?utf-8?B?SlVUUWJxSk5YM1FWTU50WkN2cVhmRjR0MndtZ3NPNEdUVFBZOUZodWZmeVht?=
 =?utf-8?B?d2NxNHhhTDJ2WWZiZ1ZKTFJwTWZRY1NNTmJhRFh1R0o5aVNWVFc4MmROOGNV?=
 =?utf-8?B?Ylkwa3drZ3o4Y25yTG5aQU9vWXZvVko0cElab21ZSTVsY3FMelU3Z013bjQ0?=
 =?utf-8?B?RHZ0eTBZOGp5SjVWMGRMM1dROWpBenNvQVArc1UwbnN3SkVseERYS3JXNDlq?=
 =?utf-8?B?ZlpYWUsyZUwrQXBpY3pqOGVtTTUwQ0ZUMmVsalNSQ01ZM1NBemN0QzdKU3p2?=
 =?utf-8?B?U2MydkxBUXdqOVFEVU9FVkNVV2V4V2lieU9MSkpoUVNoNUZUNUU2U1VNeC92?=
 =?utf-8?B?WlJZemdBekZyTkRMVVRwNzBmUklNbkF6TEtnemhLSFhmSG5EcHlaakdiOEdY?=
 =?utf-8?B?K1B4MmRoYUpXN29TOW41ZGRvaHErWG9MZmVZWXJXTmEzRVM0WnNnWDBTUGpL?=
 =?utf-8?B?TVlvQmdFVGEyVnBodTRTZ1FteFA2aUF0Mlp6SXlXTm9yeDQwUFRra1FXYXhS?=
 =?utf-8?B?Tk91dEh6K3BoUDdhS3ZUVHNqNWFyUVB4VDR3YTRSNTV4OERIcjBORFV0ejZj?=
 =?utf-8?B?RzIxUFF5ZUQ2b3RwYzR2alVqSUl6NHdENm9EMEZZVmJPWXFaSXkzcGYxQkpr?=
 =?utf-8?B?RWNyclhmMHZ5d2p0VDE3K2RjYXlxSThoMWh1cDRIYzJ3SUpvQmNDakt1bXN6?=
 =?utf-8?B?YkV3S1VDY21YOEJzdVRzNkY2N2FKVzVadmRFY1FqcjhrR08zU2V4czNiTENo?=
 =?utf-8?B?dHpFMzhURlVJZkNJdUFsR2xyeFdZSUVVSUJveGQxNCtPSjZHdnF6N21EQ0hv?=
 =?utf-8?B?ZzA5RHJpVTJpYWVtUElpbXZKTHZ5SWI1WWdLc1pRd3dSNjhQQVE3Q2NMTDlq?=
 =?utf-8?B?THRQM2J2UE1oSmUyYkVBNFRrMWpSYnRuc0hiaytHN2Y4MGFpZHBkYVZ4WnhS?=
 =?utf-8?B?aUpDak5oOHZXUXBmU1YxZGxGTHFmVnpqMDhOajl2RWhZa3lLNFd6OEpURnZV?=
 =?utf-8?B?MlFTTEY3R1p6WXhzbFhiVzZuVjNMQUNiSGNrL3FMdld1dThCZHNhNUUvbHVG?=
 =?utf-8?B?YmpkM0dkbW9UUGx4cHpLTWJ5V1lzd1BiQnc1YmNkNTByUVRIUm1jWEFDbVlB?=
 =?utf-8?B?NmJGK00vM25oZHU3UWh4aC9HL1pxT2Zpc05adjNQRUsrMHJPVTV1Q2Yzemlw?=
 =?utf-8?B?cG1NRGRwTzlwNXBrbVZvM2FFcUo4NmVuTUU0ZUE2MTBRU3l1T1pYU3NUZmF4?=
 =?utf-8?B?ZTliMFhod29RQ2NCWnhYUHhVRzdJNjUyRm11M0hVVzBUMW1QMTlJajdXdzNk?=
 =?utf-8?B?SW1jRDJMYmx5ZzhicjViS3UyM2pKUHZYRmFOMnZIUnVGMlNYcGlKTXNBNmtX?=
 =?utf-8?B?ZGVVSWdpM0F3akJXVzNlWFMzYys5emUxNmhORHZ6bFlkb0pTUHNWdHFMbUpx?=
 =?utf-8?B?RDZQL1kzeXVZUkVaUUcwQVNyaXpmdlFPTyt3V0txanUvditkelJHQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7707.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 649ecf22-c712-4aa2-6d1a-08dea5c1acb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 07:33:57.7683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AI0y3nDuukQYEW/XiCl2+662H/s8ffqvwvfKvuUsZoFcZ4jstLcuDScn2oKiZm6pYumOngm4vYsXfBUuZAGVNkjs+My6zrHQfX3jeNcCVB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8466
X-purgate-ID: tlsNG-ebf023/1777448040-312463FF-3932AF74/0/0
X-purgate-type: clean
X-purgate-size: 2632
X-Rspamd-Queue-Id: 0AE2549085E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,LV3PR03MB7707.namprd03.prod.outlook.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

Tmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPiB3cm90ZToNCg0KPiBS
ZXZpZXdlZC1ieTogTmljb2xhIFZldHJpbmkgPG5pY29sYS52ZXRyaW5pQGJ1Z3NlbmcuY29tPg0K
DQpUaGFua3MhDQoNCj4gDQo+IFNlZSBuaXQgYmVsb3cNClsuLi5dDQo+IA0KPiBUaGVyZSBhcmUg
ZnVydGhlciBpbnN0YW5jZSBiZWxvdyB3aGljaCBzaG91bGQgc2ltaWxhcmx5IGJlIHJlbmRlcmVk
IHdpdGgNCj4gYSBtb25vc3BhY2VkIGZvbnQsIGFzIHRoZXkgYXJlIGNvZGUNCj4gDQo+IGUuZy4N
Cj4gDQo+IFRoZSBjb252ZXJzaW9uIGZyb20g4oCYdm9pZCBub3JldHVybiAoKiko4oCmKeKAmSB0
byDigJh2b2lkICgqKSjigKYp4oCZIGlzIHNhZmUNCj4gYmVjYXVzZSB0aGUgc2VtYW50aWNzIG9m
IHRoZSDigJhub3JldHVybuKAmSBhdHRyaWJ1dGUNCg0KQ29ycmVjdCwgdGhvc2Ugd291bGQgYmUg
ZnVydGhlciBUT0RPcywgYnV0IHRoZXkgZG9uJ3QgY2F1c2Ugd2FybmluZ3MuDQoNCj4gUGVyaGFw
cyB0aG9zZSBkb24ndCBjYXVzZSB3YXJuaW5ncywgYnV0IGlmIHdlIHdhbnQgdG8gdmlzdWFsaXpl
IHRoaXMgYXMNCj4gY29kZSBpbiBhIG1vbm9zcGFjZWQgZm9udCwgdGhlbiBpdCBwcm9iYWJseSBz
aG91bGQgYmUgdW5pZm9ybWx5IHVzZWQgaW4NCj4gdGhlIGRvY3VtZW50LiBXZSBoYXZlbid0IGJl
ZW4gMTAwJSBjb25zaXN0ZW50IHdoZW4gd3JpdGluZyB0aGVzZQ0KPiBkb2N1bWVudHMgb3JpZ2lu
YWxseTsgcGFydGx5IGR1ZSB0byB0aGUgZmFjdCB0aGF0IGRpZmZlcmVudCBwZW9wbGUgd2VyZQ0K
PiBpbnZvbHZlZCwgYnV0IHRoaXMgY291bGQgYmUgYW4gb2NjYXNpb24gdG8gcmVtZWR5IHRoYXQu
DQo+IA0KPiBCdXQgcGVyaGFwcyB0aGF0IGlzIGJlc3QgZG9uZSBpbiBhIGZvbGxvdy11cCBwYXRj
aCwgc28gZmVlbCBmcmVlIHRvIHRha2UNCj4gbXkgci1ieSBmb3IgdGhpcyBwYXRjaC4NCg0KWWVz
LCB0aGV5IHNob3VsZCBiZSBmb2xsb3ctdXBzLiBJIHNhdyB0aGlzIGFuZCBvdGhlciBmdXJ0aGVy
IFRPRE9zIGJ1dCB0aGluaw0KdGhlc2UgYXJlIGJlc3QgY28tb3JkaW5hdGVkIHdpdGggeW91Lg0K
DQpUaGVyZSB3b3VsZCBiZSBhIGxvdCB0aGF0IGNvdWxkIGJlIGRvbmUgaW4gdGhhdCB3YXkgYnkg
b3RoZXJzICh0aGF0IGRvZXMgbm90DQpoYXZlIHRvIGJlIG1lKSBhbmQgdGhleSBhcmUgcXVpdGUg
c2ltcGxlLg0KDQpPdGhlciByZWFzb25zIHdoeSB0aG9zZSBzaG91bGQgYmUgZm9sbG93LXVwcyBh
cmUgdGhhdCB0aGVyZSBpcyBhIGxvdCBvZiBncmV5IHpvbmVzDQphZnRlciB0aGF0LCBlLmcuIGEg
c2VudGVuY2UgdGhhdCBtZW50aW9ucyAndW5zaWduZWQgbG9uZycgbWF5IGJlIGZvcm1hdHRlZCBh
cw0KYGB1bnNpZ25lZCBsb25nYGAgZm9yIGNvbnNpc3RlbmN5IHdpdGggYGB2b2lkIG5vcmV0dXJu
ICgqKSjigKYpYGAgKGFuZCBzbyBvbikuDQoNCkJlcm5oYXJkDQoNClBTOiBBbGwgY29tYmluZWQs
IHRoYXQgY291bGQgbWFrZSBmb3IgYSB2ZXJ5IG5pY2UsIGltcHJvdmVkIGRvY3VtZW50LCBidXQg
dGhhdA0Kc2hvdWxkIGlkZWFsbHkgYmUgZG9uZSBieSBzb21lb25lIHdobyBjYXJlcyBmb3IgdGhl
IE1pc3JhIERvY3VtZW50cywgb3IgYXQgbGVhc3QNCmluIGNsb3NlIGNvb3BlcmF0aW9uLCBJIHRo
aW5rLCB0aGUgZWZmb3J0L3RpbWUgc3BlbnQgaXMgbWVyZ2VkIGluIHRoZSBlbmQuDQoNCkkganVz
dCBzdWJtaXR0ZWQgc21hbGwgc2V0IG9mIGltcHJvdmVtZW50cyBmb3IgY29kZSBibG9ja3MgYW5k
IGZvcm1hdHRpbmcgbGl0ZXJhbHMNCmZvciBkZW1vbnN0cmF0aW5nIHdoYXQgY2FuIGJlIGltcHJv
dmVkIGluIHRoaXMgZGlyZWN0aW9uOg0KDQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QveGVuLWRldmVsL2xpc3QvP3Nlcmllcz0xMDg3Mjg4DQoNCg0K

