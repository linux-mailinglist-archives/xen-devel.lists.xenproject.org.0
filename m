Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J2lRDjV1LGprRAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 23:08:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F85C67C731
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 23:08:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=ODfdJm8q;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1337026.1598687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY95j-0004Lu-Ft; Fri, 12 Jun 2026 21:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337026.1598687; Fri, 12 Jun 2026 21:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wY95j-0004JG-DD; Fri, 12 Jun 2026 21:07:03 +0000
Received: by outflank-mailman (input) for mailman id 1337026;
 Fri, 12 Jun 2026 21:07:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wY95g-0004JA-QV
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 21:07:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wY95f-009dxM-Rn
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:06:59 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2c74ca-bab6-0a2a0a5309dd-0a2a4508ebc6-36
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 23:06:59 +0200
Received: from [52.101.228.79]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2c74f0-63b5-0a2a45080019-3465e44fd6b0-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 23:06:58 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS3P286MB2184.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:199::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 21:06:53 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Fri, 12 Jun 2026
 21:06:53 +0000
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
 b=FYSkcqVHrSGY+B4iMEoNG6/TouQwJiE56vPb4txCuwuhyetqj1cCFaCU6IrUO6yZtt9e8YMXOcbJXutKOixUegfBkX6qyVr8U3DzUSMeUbj0enn8tBF7P534hWdRoy8dp4alGKopXlYz7L8FYYi26IM2Xc6RM69cKjPUxoEnmCAXe1vu9yKsGymLiONddCtZQBE/ylOQs5+M4enRmItsW+9B+ujpomq7PcED71PI0E5lg5H22LqsJYHz9A99AAoalFDom1b3Am4cMq9qwe2x4B/R674MJhygPXhzVLPIYj21HbirdZwGuxMGNd07g2zRzPzC0xS7iwmrsvZzjNeugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Fqug8LLSf55VgWG/bjbxzFX56/3fnDI3rJq6/BP5uQ=;
 b=XUSWq94+zFju4xh7MleZTpIuh6lXyrb0SOGhOIV3n24W4W6twd/5zlv6eAsaLTlAPM/UClJAcShuAYZM1oPnOH/n+b4rj6ku3WjdcIuMmIAPGVHW+Nxq8disII2b8r6rgPbyRJusB+u9JhEIQNEiXW+Z/fKadPdtus1WrX47Z/5n5ObcdX1SdC1FwIJNMQImSeCIJDrXw3YDA0h8n2f9bbv7AFAIQX+g4kyf/MA/jkdgR9vnSZdTOYPNGolRrgCqXvMSpWsdqTbAJbI4Y/57aVTp2PJ7FOTdZoZFsNN4OdD0Q7ipRbYCpt6jWNkUdzxVoZxI5QouZXV/K22l2/yOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Fqug8LLSf55VgWG/bjbxzFX56/3fnDI3rJq6/BP5uQ=;
 b=ODfdJm8q2HWDDLHsm1oDrGia/xB8EA8coZnJpn6+on29TXvNFNozcjN3IG+poVBgOU400TzDt6f8JVDCY3dmhO33zZLjmuiAr0UNvHmfUIcJVjIrBNd7TYr7hQOep6SNimmojJimLXm1BscYWKl3rDbUol06/9BeC1z2Q1urxSo=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
Thread-Topic: [PATCH 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
Thread-Index: AQHc+Moq7p2vtDgwUEGokWD7Uh66HLY5Z66AgAH4l0A=
Date: Fri, 12 Jun 2026 21:06:53 +0000
Message-ID:
 <OS9P286MB72222F58E04636EF6F12BB0A82182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-4-taka@valinux.co.jp>
 <188b21b9-dd46-4414-861c-20a0ff28c23a@suse.com>
In-Reply-To: <188b21b9-dd46-4414-861c-20a0ff28c23a@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS3P286MB2184:EE_
x-ms-office365-filtering-correlation-id: f0a3d229-2413-49b9-e57c-08dec8c68743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|4143699003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 GmTfMn4y2BhrHed+6S8vH1TZHQ9dEiJ6NcKA0P8T6s4SuZSQ+5Z9eGS2aY1rtQaatpurzkBZxmYRPPUh+ZKrq0ArDiIITAsQGK0gLU3Jm2yfE7FH2e1C5zdJc9b2eU3RYwdszQTDReFw4f38xbVsV4RpgHMk3D8Hpn2IjtxVejtjeYXZlI2eeXnkk4m/QIZMNMmI18osYni3jc/lgauKi99gdo2zQk81LtjaEWQww8ADISqjakpz/NHMikjqBbKO+dGb1xVz7pZrxZXIwRhk8DhEouTZnTjigndBymK+elW2XjqzQwx3jCLHOKXEewyEZN3jRRe2x3pklmFWmv3mAgH26I3YCvNipWW9e58Z8SCt1hPSFzhOk14PQktJkbIpAyz94rx2g2eTaZTGcLbb2X65Psrf7QpGpKkyIZcSrjzJ37pWGHFNQqe7K8v6eoh2g3WLxese0V9DyoXWgPW1cWxxuX6++zj2LzxxzsNnGYLh0VW3AiGx/MQDrUrghPzm08FDj8M5quu4UFIrLulChb5VqOwTavevIDXi3xM9jFJCyJ5DD0mU/JzFsSjAZs1YgxAC5SWrGPTMUL6jy2Fuj8R1vF0NCG6s8YyUDOHcN+OoV8Ssz9BnvnZV9FgSaw9xUVrHHox6V2drPLGe0Tyc38kp/ZtHhHeAs7RUxIbd+h9uQewAr4WG9cxhkCH7l57zyNwIrpJZZLA9Vql26SKaMYgbkHx7O09Q7ge8ZFxX/Vd213z348SAls/ZIRDyBq8Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzRUWUFXOXphbGgvWi9WaVZpMUN4NkJvbDlEbEJOZ3pmbHluNlRPMU85UnBC?=
 =?utf-8?B?dUJCYzNEUkZ6Nmo0ZHo1R1pWaXVxR1I0M3dxclYrYmM4ZmZpbEVSWTh4TjVX?=
 =?utf-8?B?M1dhZ2M4TkUzV1NOYUl3ak8zc0RFWmV0Y2xmZkNxbUlwUWVCRG5HTjgvVXVX?=
 =?utf-8?B?SklJb0J4SkxQYUEzSXo0d21UTG1MdEVZYUJRdjdXS0ozNWlCOWdUQzFFSDdN?=
 =?utf-8?B?TElhNjVXSXB4bkxNUUJZSnc2S05McU4wNFpUWENqRmJpeTZuQUNaQXJDSVZO?=
 =?utf-8?B?eWlOQk93ZlJiSFNXZHJXa2NBaTN5MTBmY3grQThNZHZxSGtNSTNiUXhJSndk?=
 =?utf-8?B?R1FOSHBNZXRqbVJTaXhLL1lZdGR0RzRqeWtnUU12Vk5FdDdpRDN3Z1hwTk9k?=
 =?utf-8?B?d2ZhUjBIY01CYzVPd1pDR2JvZXJVYnhLNjNuc3lmVzdnRG9zdnhlQ3dGU2d2?=
 =?utf-8?B?cnRvQjlYRnZic041d0JPYW14SjkxcGpGaUl0T3RDcytJZXVqSVFQckJsN1lv?=
 =?utf-8?B?R2lZSFRXYzNmNXQ1VW5KM0xzMWcxWG5SZHFYK1V6NnNsSjdIZ3ZEa3d5bmZG?=
 =?utf-8?B?UGlBbFpCNFFsR3BjeHQ1Q0Mrem5HK3VEMVVYcTloRlA1bGd4bGZrOThQYkUx?=
 =?utf-8?B?OEpUK0FydlA3dkRGQ3g4TndzS2hidjNUZzBrOXRGZnc3S2IweVZHSVBQbUdS?=
 =?utf-8?B?NHJPbGlZS1VnYkZ6djNJL00wS21hR1g0OWJIeGNqaFk1a1NUeDdrQnV4RnpK?=
 =?utf-8?B?eXQyTG9qRkVVeWlPV3dPZHZMdGhJVXc4OGkvcHY0bmsrcEpmQkpOc1FYTDVi?=
 =?utf-8?B?aUFqbnRWNXJiUmJUVG4xTmpjaWpua0MvbFlrM3ZBMkp5eWpIT0dJVnlLQmpK?=
 =?utf-8?B?dVI0VW9XdElPanBHTGxvMjlzSm1XY1VZS3ladW1kaGdtMVZtcVFPRXVqMTJy?=
 =?utf-8?B?cDgrcm5LZTRGVkR0N0svSlRtR0lEOGpveU5qY1BYYUpoZVdnVklLaDlmc0JK?=
 =?utf-8?B?RkRreGluMXpUNUpDbUN2TzZIRVZoTGsxYXVrbGxUb1ZsUzgxRkV2N0R0K0t2?=
 =?utf-8?B?R1BXV3FwaVN0ekVQNCsxaUxiMStXc0JnZmhsUitTdFFaR2lmY0ZyZmZOSVlJ?=
 =?utf-8?B?Z0RyWlYzN3o4cFJoOGRUOFJhanI5YzMwbThqdXdXam1GU3VHa1l1NG43M0pM?=
 =?utf-8?B?YVFxeHZGQXhiNXpTcklOSlQ1YkpFZjQ1bzkrdm5nUkdwOENyTFFVenlmTTdP?=
 =?utf-8?B?RVlFUE9wVGN0WEZuQ3VqcmVrN0RKd0gyd2hmY1RuWXAxVVZUZXA2RXVybFdV?=
 =?utf-8?B?ek5aelhxNDduWHVQaEVmNUpHL2pvK0xCS00rVDVoQUliV2JabkJpZTNPc1lt?=
 =?utf-8?B?RDZhRUREYWJTNm1OaEM0UjZWajdLWDR0dHhCcEh6SzlLWmVYajU1SzRKN3dr?=
 =?utf-8?B?R1gxR29aRDhkT1JhbEJQd2U0SS83RkJTKzA1YXJrVjBDZFVOdkt2NW1nODRo?=
 =?utf-8?B?SzA1M0ZhQ2plcHNRc21SYStGc1JlQVdyQUxORk9Za0Vnb2lDODhla2FVbUhv?=
 =?utf-8?B?SmEwVTN2ak1rOUsvWHV6cWllMXBKelgrcmlqWnVqcVpQZHhIcTFmQnIvOEVk?=
 =?utf-8?B?N0NVM1NhdHNVeDhuTTFPeU5qRnh6OVRlSkVTU21iL29vUFdTNE00c1NFY2Zr?=
 =?utf-8?B?eEtkVURkemd5UDZaNllIZGZWS08vZGluQVNDekU5SVJzMnZNaWN1MkpXREJj?=
 =?utf-8?B?L0IrSWk5R2ZJUWp3WFBxWTU2Tzh1Y1B1YVFpRXNmUTRvL2o1VU1tV1MwQUZo?=
 =?utf-8?B?L3RnUi9WWGErZ1BwTHBLUVh1bWhiSzU3T1RoYXNpczdUT1RJMmdjNHhFQzRS?=
 =?utf-8?B?VWRzUlNtdWZMUmx0RXY0RUNUeUFqMWlRaVFEaFR5TUI5M09WaGVtRDJ6UEN1?=
 =?utf-8?B?enRLSm5XaTZ5d0I5OHdHcnFLZzg3QVowdFpVR0lRblpzbHpQVi9yN3JhSmlW?=
 =?utf-8?B?TEFYWFR2ZkkvMERhUVB5cGxLd0NaOFNPc1p0SXBHMEg3R1BzSk9hUHAyWDJY?=
 =?utf-8?B?Q2VTdm5uWmRhWmdreUxwMWxnYlByY0J0eHlHc2ZaWHAzODdzS0x6RmFzYkRC?=
 =?utf-8?B?TUN5VGtYcnJOdTZHU2szdW1uYmFGTy9TU2w0b3hRWFhYS25BaTRJUjlFN2FE?=
 =?utf-8?B?RXFKVHJmZ3ArMG10bnlzR0MzRGNUQmF3L2FiQm9YY0dubHhoLzZaZW9RSmZI?=
 =?utf-8?B?bzhQd2hUQmhSekkrWDNzTTRNTGZMREZxaHlpdUVWcHdnd1RZcGg0a3ZlUXhW?=
 =?utf-8?Q?dYEVWpcMHNRFNCzuS5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a3d229-2413-49b9-e57c-08dec8c68743
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 21:06:53.1512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lCFIs7Z5xNtsCaiI9uxYaZkI7Iga4G8IaBa+7UxEpo/hCCGYA0rVRkE/H8D+Prb4LO/P5qLpEcVJF/jy9RnmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2184
X-purgate-ID: tlsNG-c1860d/1781298419-BC965DB1-23ED12E2/0/0
X-purgate-type: clean
X-purgate-size: 1800
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
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F85C67C731

SGVsbG8sIA0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMNCj4gPiArKysg
Yi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIuYw0KPiA+IEBAIC0yOSwyMiArMjksNiBAQA0KPiA+
ICAvKiAjZGVmaW5lIGQycHJpbnRrIHByaW50ayAqLw0KPiA+IEBAIC04ODQsOCArODY4LDExIEBA
IGNwdV9ydW5xdWV1ZV9tYXRjaChjb25zdCBzdHJ1Y3QgY3NjaGVkMl9ydW5xdWV1ZV9kYXRhICpy
cWQsIHVuc2lnbmVkIGludCBjcHUpDQo+ID4gICAqIEFkZGl0aW9uYWwgY2hlY2tzLCB0byBhdm9p
ZCBzZXBhcmF0aW5nIHNpYmxpbmdzIGluIGRpZmZlcmVudCBydW5xdWV1ZXMuDQo+ID4gICAqIFRo
aXMgZGVhbHMgd2l0aCBib3RoIEludGVsJ3MgSFRzIGFuZCBBTUQncyBDVXMuIEFuIGFyY2ggdGhh
dCBkb2VzIG5vdCBoYXZlDQo+ID4gICAqIGFueSBzaW1pbGFyIGNvbmNlcHQgd2lsbCBqdXN0IGhh
dmUgY3B1X25yX3NpYmxpbmdzKCkgYWx3YXlzIHJldHVybiAxLCBhbmQNCj4gPiAtICogc2V0dXAg
dGhlIGNwdV9zaWJsaW5nX21hc2stcyBhY29yZGluZ2x5IChhcyBjdXJyZW50bHkgZG9lcyBBUk0p
LCBhbmQgdGhpbmdzDQo+ID4gLSAqIHdpbGwganVzdCB3b3JrIGFzIHdlbGwuDQo+ID4gKyAqIHNl
dHVwIHRoZSBjcHVfc2libGluZ19tYXNrLXMgYWNvcmRpbmdseSwgYW5kIHRoaW5ncyB3aWxsIGp1
c3Qgd29yayBhcyB3ZWxsLg0KPiA+ICsgKg0KPiA+ICsgKiBUT0RPOiBBYnN0cmFjdCBjcHVfbnJf
c2libGluZ3MgcHJvcGVybHksIGFuZCBmaWd1cmUgb3V0IHdoYXQgQ3JlZGl0MiB3YW50cw0KPiA+
ICsgKiAgICAgICB0byBkbyB3aXRoIHRoZSBmYWN0IHRoYXQgeDg2X251bV9zaWJsaW5ncyBkb2Vz
bid0IGV2ZW4gaGF2ZSB0aGUgc2FtZQ0KPiA+ICsgKiAgICAgICBtZWFuaW5nIGJldHdlZW4geDg2
IHZlbmRvcnMuDQo+IA0KPiBIbW0sIHRoZSAiYWJzdHJhY3QgcHJvcGVybHkiIHBhcnQgaXMgYmVp
bmcgYWRkcmVzc2VkIGJ5IHRoaXMgcGF0Y2guIFdoeSB3b3VsZA0KPiB5b3Uga2VlcCBzYXlpbmcg
aXQgbmVlZHMgYWRkcmVzc2luZyBpbiB0aGUgY29tbWVudCB5b3UgbW92ZT8NCg0KT2FreSwgSSBz
aG91bGRuJ3QgaGF2ZSBsZWZ0IHRoZSAiYWJzdHJhY3QgcHJvcGVybHkiIHBhcnQuIEkgd2lsbCBk
ZWxldGUgaXQuDQpBZGRpdGlvbmFsbHksIEkgd2lsbCB1cGRhdGUgdGhpcyBjb21tZW50IGJsb2Nr
IHRvIGV4cGxpY2l0bHkgbWVudGlvbiBBUk0ncyANClNNVCB0b3BvbG9neSBhbG9uZ3NpZGUgSW50
ZWwncyBIVHMgYW5kIEFNRCdzIENVcy4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hp
DQo=

