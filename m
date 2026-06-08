Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0w++BnVFJmrBUAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 06:30:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338E652988
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 06:30:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=JS9FytL7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1331380.1593948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWRc1-0003xo-Dt; Mon, 08 Jun 2026 04:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331380.1593948; Mon, 08 Jun 2026 04:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWRc1-0003v5-6M; Mon, 08 Jun 2026 04:29:21 +0000
Received: by outflank-mailman (input) for mailman id 1331380;
 Mon, 08 Jun 2026 04:29:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wWRby-0003uz-AE
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 04:29:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWRbw-00CqvJ-A4
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 06:29:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a264508-2eae-0a2a0a5409dd-0a2a4506df0e-8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 06:29:15 +0200
Received: from [52.101.229.93]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a264518-7371-0a2a45060019-3465e55d1e57-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 06:29:14 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7051.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:430::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 04:29:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 04:29:09 +0000
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
 b=uuSuHHg18A+uY04w7O+JwdlBkypS3CGqDqsct7HbqNA272ZVXn+Bd5gm24YXC20JpZUSTbUIDXdMmtAp7WhjXJgLee1d3wrn//YO1toV4GVCHvqcUEgIU+9Ey2sHYVDljG/wNK+6nfvn2G4y8L85NBpbTpiDkRDifbPsoVVjGgM1WU0eNY2W4VPAhKbSkvemGUCspKQF3d69WcgmGB2cXP0Eie0EWmOltNuEq+xlbQJUpXVivzC8hIMDoRUw/6hvnCqyMDrWfAo9Wzd1J2PQKGPsihAi4FZ9RDNHPhW0Uk/sjejsJSYcCLQpBUVxh0YCzTJYddkaMfkH+a/5vTSPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7WXOu4c6g1XYn8ts0jOO/F3hUDL48Mqd3nfgigfKd8=;
 b=MIS0yaOrQhN3VnEqokZ0Cgvn4k0tlfy76nPHiwJ0dcEW0S69w6+STEBwXOJ2zhPTyOywfmw0NNnHlpYn6wI5OfJusV7DNVUb3AUJD8Wsn7Emx1VTDapt/9blkF+IgarT4EI3DFRU3WZsYLR2rvPnash/ZtovHmtWC5qOEIgaqFQcxLnyGUtZnMSMmhbigvKG5D5OBn7BZ+NMutbIvuOsTwcg4J+z/yPkIDZ/Pp3ReY6YYwMfvuvzji6iUq76/pM2IrmGwKfhVJU4JXBrdiwKVUuEIWPXnDYrEFok2/bvDVIXy1k2XxQoBH4db5vkLkex3n8XcSVV2uncJi9Y7F87mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7WXOu4c6g1XYn8ts0jOO/F3hUDL48Mqd3nfgigfKd8=;
 b=JS9FytL7xieTGWTCIYTtkVcOqp0ZnjBfglOMg/ROOJ/HD6hlSXm4yzMAndxE7Z6gqE4L/QDhYpWYoPoX5413Zrg3Wmvfs7uPp2d/uQxXHeKHclcMc9+6lIs39fPOIU7yglCkFYKsS1qi0btCEk4TW9oZvOaZIF7AJDpnmjGaDY0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v2 07/24] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHc8U+PsZhvkHY9vEqKRtt8NHnfGrYrBomAgAF93dCAADBuAIAHZqKQ
Date: Mon, 8 Jun 2026 04:29:09 +0000
Message-ID:
 <OS9P286MB722248146D5D4ED0DB17DC5A821C2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260531224755.9481-1-taka@valinux.co.jp>
 <20260531224755.9481-8-taka@valinux.co.jp>
 <7040c58f-2d4c-48f2-854f-c874efdcefbd@suse.com>
 <OS9P286MB72221F0A5D5195C7A4CAFD4082132@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
 <2de402eb-fc62-44ec-bf2d-73db4afbc0f7@suse.com>
In-Reply-To: <2de402eb-fc62-44ec-bf2d-73db4afbc0f7@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS7P286MB7051:EE_
x-ms-office365-filtering-correlation-id: 9317925a-6ac7-4eb7-dd9d-08dec5167c38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|4143699003|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +fFjx5jTcedArMFsZ1wVGyNGbQpgo/yOelhNMowON7Zr+VBeUqpBI7FLTXkDMjvwjf6M1Eh8pRnOImKxQmgXBDqfvNYG3bGKxm8ZfEJ4SCVfMLCfrcTDXNstGaUxniZnktZ+thqpiMJ2Gs2hO8o8oKX3iox89Z8sE/3SIkFBt9foQUfo9qEPmNtLjfvUBsYSYNVmkbfUzdeJ2ae9GlrDlVCBFli637H5EgdP6E7giPrYsTV57loUmefJTCH5TRvcBMDBwsaBiZ4tsOnWI6GXtUjXay47YkdxY6jpqhQyMLNKPz9bDvocvm8RhCr0eQeWXvpiGTT1Hr4AoWsZOqSlypLHL1shVd9MtCKEZ5D3YSVLu2gPbwuLQCMsL9u5bobtMCnx77upYwR+J0chsaqxMESA7tfce61/2oUT9SSdqs3FciCgNgRpWdDbZKvSTnMf1pIv473FaCtKQ97hUN9VsfrPHQIe3avX3CK/ZDvOx5nyIZZKwGXDR/ue0MQkRZCsmSrE5KQjAMQPTs8P2JJEjrEaI9h2MI0dbjBKN5eyPYw/pT3HQPw4eWcDYBicWQUd5yJN7yTQB9uPyCJPfDiLN34A8pat2HGLHJmK+8VzULkvPFIb1rCu14A+rXHnlgTsIv5FkA4XvaqOd+HGukSktbM1EmOuBsNXrcgapvVirjFoGNqHG5Xqmc0VulfO4kYmzhL0b9S0YOH0vCg406kN+KVBY4V05tgTiV88wdzMQl5MhfFA4HPWELaGwsBxIqjz
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(4143699003)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1JMWG8xeTMrUHZiSDFBYVNvdkpnNUtpek5wczNJTCtpQlVBYiswSnBVcWc5?=
 =?utf-8?B?c2hEaTByM0h1blVGY0kyTnNyejB5NlB3YlZKZGkvTUlQUkdrS292K0liamZT?=
 =?utf-8?B?b0xrYzNSQTNMQ1M3dGg4Ym13Z1RLdUpOS05ZUUV5bHljREloUVJGWGQycEMv?=
 =?utf-8?B?SXBCcWVHZHpDNmF2TVNrTU5DR0c5QWZUY3NLQmdCYk5hVUFlSmQrdjIrQXhX?=
 =?utf-8?B?RytDVnlrVTlmb054WUFLc1hIRWdqZUZHSTVUcmRuNStueXl1UjdkTGdZOUVw?=
 =?utf-8?B?aWoxU1RVNjlDUTZNektRYW1MbHVkREw3YzRhNTFUTWMrSVZvRGxDQkxrKzdv?=
 =?utf-8?B?VWF1aW1LanIxdWFDelRmS1BtOW13alowUzcxQURzejlrcTYxbHQ1Vm5rS2lG?=
 =?utf-8?B?QXFERHVDYnBuUk03YmFyRFBqRkI0bXM2Zno3eXRiVGZMdlphRjh4bHlBaUZF?=
 =?utf-8?B?WHN4ZytRa0k2NjFCd3NobnQ3Sk5zZmNNbEJTMi9wYmhSNDlOUCtIbXlwOWFC?=
 =?utf-8?B?bXVxQ1BPUHMySUNNQk4zSTdUMUo1Vy9ISXhOM0h0clNYS1NBU3Z1TVJEUG01?=
 =?utf-8?B?RzliNUMvSTgxVnFBTzdSZkswYThGN2k1TUQxNW5CaUpvd2kzNHk5VXh5NU9n?=
 =?utf-8?B?NU1rWW5CUkZvQlFqc083ZlozN3loSEJRcFFWbFd1aWlGRE1hcEVTVXJZRVlY?=
 =?utf-8?B?QVFITERsTHJGRExldEFuTEp4WmNWVVRHMCs0TEZ5VGtCWXFiVXA1eU0yZ29r?=
 =?utf-8?B?cDlZUmFyWWpSWkFtVzBSVS9lMno1Tk1IVDRMUHBGWWNnRzluVlRyeWhPa2Zr?=
 =?utf-8?B?R3dYaytTeHI1VVBMbWxXYTJwOEVNTHJjRzlaa3piY2w1M3hzajNpWXZ0S3l2?=
 =?utf-8?B?c25IQUNiQjdERXVmTnlWQW44dFhLYXZMZzc1MDJJR09LRmVQTit1L2R2N2pG?=
 =?utf-8?B?anFXY2xJVEloVEtoS1V2QWR5QUdnQmVLckdaNlpyVmd4Ukw5alJtTUVvQ01Q?=
 =?utf-8?B?SS9jd0VjQjd0V0Qvd1BOYlpMeGFML2lWRFN0QkJENzJsZHZGUk5USlhSbitv?=
 =?utf-8?B?bnJXU0padVNvRlVPTURhUFJnL0NxS1h1NVFSZjkyWHBjL1lIRnRwOVJlMURr?=
 =?utf-8?B?SE5LWDJOQmlOK1FLUFZITWQ3YnljVmhQL0xCdDVZQ3pnNFhnUmhadzUvdHN2?=
 =?utf-8?B?NS8xdll0c3l4Z3h0Nkw5ZkYxamN0emF1bFoxN1lobU1aUG5UcFJJK0xBb2Jm?=
 =?utf-8?B?WHZGNHFHdjY1RTk3YUU4eUo5SERXZVhrMDRHdFRHUXJNODUzeEpJYVUwajNZ?=
 =?utf-8?B?TmpNTkk2blBZQUppQ2tUWjBlOEgwYUpRVC84SU1QTUFnS2tySk9ralRrSlA5?=
 =?utf-8?B?NDRETTh2bGM0UVkyMFhlWGVjdTk3VFkvb1NZU0ROV2pLTUpqTm5XcFdDa0lO?=
 =?utf-8?B?cmsvWHJaNVgvdm9sd1JRM1hJeisxZW1JVVBwb1g4cjJKZmdkSWdEVEZVRUZG?=
 =?utf-8?B?aWVjVCs0TlE2ZzcrMEFST2ViVTdMNXZoYmc2ZDQ2RkNrQjR2M3V6VU5xQnFu?=
 =?utf-8?B?eThMMGdTOEJsUEdqdC9RRUNRazRnTk1vcjltZmEzamN0c2d3bW5GbVdYS2dt?=
 =?utf-8?B?S3M4ellwTitERS8yczcrSHhBMDZtTnRvTHozbWoyUEFGZjVYUlVleGxBWDJR?=
 =?utf-8?B?NXM5ZjNIMTMwdk02MmZyK2RRVUJyd0x4QmNYRzRQbzU0eFhXQVhYWXYrdlEv?=
 =?utf-8?B?Y2VabTF3VCtpWlh4Mk10ZGVBTWRWWXFKa3NEcHNTR09vR2UxSXMvaE00d0dY?=
 =?utf-8?B?R3Z5bzlSVm1LZlU5N1dkSDV1ZXV0NlRwSzFoTktIaXhWV2JRT1Jhc1NBUDN6?=
 =?utf-8?B?cEpFMEg3U0pEV3ZWVFdXSG1yNGhhNjZOdlZ1YVdTZGtYeUJhOXR2TE1ERUpa?=
 =?utf-8?B?TG1mUUN4OWk5YUROT2haNVl5eTBVcEIrRGlsbVVUVDFkeDZ2S1dlVjFWUExs?=
 =?utf-8?B?cVhKMWE3UG9uSkxIWlFmcUdxOWU2YU13VWdueHNZQ0dTajhFUUVJck13djFp?=
 =?utf-8?B?ZFJLTmxPNEhiYWZmSWsvZVFXZVMrU0RmRDZ4L24yR3JxeURVa1d2Q0tocXV6?=
 =?utf-8?B?UkV2bml1b29XYldnemswWEltcXhycjNUalRFbWlrZFU3MjNNV2pkcnZKZmlW?=
 =?utf-8?B?THVOTktONU9HYjlZbUpRUzdvSkJVdllaZFliQXhNY2Z0QVNYSENpLytOSTNF?=
 =?utf-8?B?YlBTaXV5OElNUnA1enlDVXJlK05JQkhSNjhVR00wRDdMNmJ5VWhSK0ZIb0VL?=
 =?utf-8?Q?KsWG3kzRJFE0e4duFf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9317925a-6ac7-4eb7-dd9d-08dec5167c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 04:29:09.7192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJz7D25NGSwMarOQmQUk+XCciYvpbt02DoeXA+yTUNw8tEoajV/9NCOOhBNtku+NZYeplu4R6Cv0yN4ijVBJ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7051
X-purgate-ID: tlsNG-16d1c6/1780892955-87D7AD75-5202DA16/0/0
X-purgate-type: clean
X-purgate-size: 1512
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:from_mime,valinux.co.jp:dkim,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3338E652988

SGVsbG8sDQoNCj4gPj4+ICsjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+ID4+PiArI2luY2x1ZGUg
PHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+Pj4gKw0KPiA+Pj4gK3N0cnVjdCBjcHVfdG9wb2xvZ3kg
ew0KPiA+Pj4gKyAgICBpbnQgdGhyZWFkX2lkOw0KPiA+Pj4gKyAgICBpbnQgY29yZV9pZDsNCj4g
Pj4+ICsgICAgaW50IGNsdXN0ZXJfaWQ7DQo+ID4+PiArICAgIGludCBwYWNrYWdlX2lkOw0KPiA+
Pg0KPiA+PiBDYW4gYW55IG9mIHRoZXNlIGdvIG5lZ2F0aXZlPyBJZiBub3QsICJ1bnNpZ25lZCBp
bnQiIHBsZWFzZS4gSWlyYyBJIHNhaWQgdGhlDQo+ID4+IHNhbWUgZWxzZXdoZXJlIG9uIHYxLiBQ
bGVhc2UgYXBwbHkgc3VjaCBjb21tZW50cyB0aHJvdWdob3V0IHRoZSBzZXJpZXMuDQo+ID4NCj4g
PiBUaGVzZSBtZW1iZXJzIGNhbiBhY3R1YWxseSBiZSAnLTEnIHRvIHJlcHJlc2VudCBhIG1pc3Np
bmcgZW50cnkgd2hlbg0KPiBwYXJzaW5nIHRoZSBEZXZpY2UgVHJlZSdzDQo+ID4gJ2NwdS1tYXAn
IG5vZGUuDQo+IA0KPiBZZXQgdGhhdCBzZW50aW5lbCBkb2Vzbid0IG5lZWQgdG8gYmUgLTEsIGRv
ZXMgaXQ/IEFueSB1bnNpZ25lZCB2YWx1ZSBncmVhdGVyIG9yDQo+IGVxdWFsIHRvIE5SX0NQVVMg
d2lsbCBkbywgSSBzdXBwb3NlLg0KDQpPaywgSSB3aWxsIG1ha2UgdGhlbiB1bnNpZ25lZCBpbnQu
DQoNCj4gPiBTaW5jZSBJIGltcG9ydGVkIHRoaXMgZGlyZWN0bHkgZnJvbSBMaW51eCBrZXJuZWwg
Ny4wIChzcGVjaWZpY2FsbHkgZnJvbQ0KPiBpbmNsdWRlL2xpbnV4L2FyY2hfdG9wb2xvZ3kuaA0K
PiA+IGFuZCBkcml2ZXJzL2Jhc2UvYXJjaF90b3BvbG9neS5jKSwgSSB3b3VsZCBsZWFuIHRvd2Fy
ZCBrZWVwaW5nIHRoZW0gYXMgJ2ludCcNCj4gdG8gbWluaW1pemUNCj4gPiBhbnkgZGl2ZXJnZW5j
ZSBmcm9tIHRoZSBvcmlnaW5hbCBMaW51eCBpbXBsZW1lbnRhdGlvbi4NCj4gDQo+IExpbnV4IGlz
IHF1aXRlIGEgYml0IG1vcmUgbGF4IHRob3VnaCB3aXRoIHVzZSBvZiAoYXBwcm9wcmlhdGUpIHR5
cGVzLg0KDQpJIGFncmVlIHdpdGggeW91IGF0IHRoaXMgcG9pbnQuDQoNClRoYW5rIHlvdSwNCkhp
cm9rYXp1IFRha2FoYXNoaS4NCg==

