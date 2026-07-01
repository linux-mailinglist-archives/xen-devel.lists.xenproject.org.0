Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZEhcG3PmRGo72woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:05:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0C6EBE01
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 12:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="Ocve/Abp";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1349698.1607368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weroo-0005Ow-UF; Wed, 01 Jul 2026 10:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349698.1607368; Wed, 01 Jul 2026 10:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weroo-0005Mo-Qs; Wed, 01 Jul 2026 10:05:22 +0000
Received: by outflank-mailman (input) for mailman id 1349698;
 Wed, 01 Jul 2026 10:05:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1werom-0005Mg-WA
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 10:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werol-002CwG-Pc
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 12:05:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a44e65e-e002-0a2a0a5209dd-0a2a4509b6f2-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:05:18 +0200
Received: from [40.107.74.130]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a44e65c-97e6-0a2a45090019-286b4a82beb2-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:05:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB3916.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 10:05:12 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 10:05:11 +0000
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
 b=yiBl/Dloq9oZDTvzCf1+nSS30GxMqjQSBGRCdtXDS1Q3BiawWOd58BW5HYlci4JJu9bc2F8VASm/5dGwvq8pUQVufB/aLaMZoiacVLmiibfdUu/e3K2wXlva/ClHsolyWnH7rPYshqx6tQh1MMnStY4wfVqzChhssTm3QvYkqmWEcwrWwuSFPKSZfgAK05R+VwR3nc3jKW4pPFGZmUyty84qHm9LxJ9UE7bXnEMg6eKli7eYLM0XxR0j3966hhSierkhalCRmEdi98ZsgNn/tLgsD1IR1thiLnx8dZmSPcc//ZoDnz3uEhe++sN01BZLbeN+fnKOOOQonNUHWeB9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1OEba/foWvHV8Jxg24W6nhI4wu2y86LTQFkMfB1zKg=;
 b=OQHhxza+OXSN/GF9UA4NhO7+9ZlCSVxtTJ0bSgzivAz7T/iFbCcTwrV7EZWeUZwLU1o2rWguCnXsYFqoTMPyfl5cnLKEI+u6rMxDyw/pFOC9d5yDf7Ii+XNwpCxD0rQ2ql5Epocfl3YDS+yAEQ9P7AWlILQNHOgB14EtT2NRVNP0lj8KxW0xeC39fJW9ylAg2dFjltPwOVLulf8g2lOVfsWo0WnjJNYw84fmqgi2BaMSJu+5SSOO/BKPPasvAR7Av65gf3Ge/22ZrDR3Pum3JHhgHkxQPtddMn41FR8CEV2qTyBiADkscpQgbtq5J9mucNsJNNAw5wiK8roky/4Psg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1OEba/foWvHV8Jxg24W6nhI4wu2y86LTQFkMfB1zKg=;
 b=Ocve/AbpErYR94pkCrOloF4BacZMMJ/43+mdX/wQZv6MlyaIo9v2KdJvEknjNtBM2+iauu4ttcCeTZNgDA49bwygnKLWLQS7MCDil/S/d7GaF/d5mPAGTV3l2//i6ieY/yK+BW6Vy2KCEmcyD+k6OPdTg1CJJntIU/PIKqw0sB4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 0/3] xen/arm: Device Tree based CPU topology support
Thread-Topic: [PATCH v3 0/3] xen/arm: Device Tree based CPU topology support
Thread-Index: AQHdCBJft4D5Ks1pD0WlbKl0kB83Y7ZWrjwAgAHDICA=
Date: Wed, 1 Jul 2026 10:05:11 +0000
Message-ID:
 <OS9P286MB7222AABE00E7BDBDB51B04B582F62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <7b0be62a-879b-4fd2-b1aa-5fa8448c7288@suse.com>
In-Reply-To: <7b0be62a-879b-4fd2-b1aa-5fa8448c7288@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYTP286MB3916:EE_
x-ms-office365-filtering-correlation-id: a5f72e40-8e6b-4c95-2698-08ded7583cf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|4143699003|18002099003|22082099003|5023799004|38070700021;
x-microsoft-antispam-message-info:
 AtU+RuocoDTguFtA6jpB58TUBZoakLwtuCmbgIvoNUKb/J3K2ryE+Mndd4HK5kIjUmcCNLxdXSJ8RdNZl7Qzpd4NpNNfx/re7N2q6BTx7jN0TkiIQIkAT+ZxPgzUFR252EtU9kJSiP+5RBviYmOkZDUUS13QdAyMspRxefrIlnI784tPKg5xHjDHa7bwdTeosrDv42Y7Efi5WAVwGWI8d4zOz9kv+iPckAca1RDiGwwPooAIyPNP+qo4272zH4JPuWu9enWEm/gyZJO3Fc0C5ERmVOkAlTnC3PaqNEqQWDcn12OpdBMBK9kGYe3QLHtqnU9qcchLI04eDjjS5dw+375RLlxpcCTx/bsfHl9CbFPPBWEXm3GQN/lg61VLXVWBoDiM5nNjnwzu25mewdgdZztA0m446Mux5DteJX0Ew8EFm8ePdeVl9+1hOsHUDwXvi7f5i1CT4AcnA7j+Zf++O56fzfuRs22wkkpk/JDeoDJvCvGcQjpzWHd63T4F6ssshEFQrEx0x3RyUDx0Iup9zsRjh9w4aONSK/jesyKVPweT6gz4FIa2thcsEWSfVM2pSVN+R8yakdwrYQKkdVvWVvLxiIGtJ8WHv5m5qwPM7Ot4mV2+UDdbhjI6piT1ZzzUtx5cf5B3ebsbrv6TW/YLFZSfIvlIOW10cHeDr8tEOUmCQdr37qEJgyw7XH7OotPo6prlKSLLu1sdmKdz2xxlxCFFdWYacCTr13b1mCj2D2Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(4143699003)(18002099003)(22082099003)(5023799004)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R1VWYVVmUDQrUjkrKzg2ZU42azFKU1I0TVE2Y1N6bVNucCtOK1YvKy96TWdD?=
 =?utf-8?B?aGFldTBUMmNoRlhYWlU2SnMxWk1JOTdpRXl4UVMyVXlGbllrVjJsU3N2ZzRR?=
 =?utf-8?B?d2RKWWRiNTRUK3FhV3NrTllZQWtPamJHRzErSCtmOE9wMUl5bXM4WnlIMmlo?=
 =?utf-8?B?ZzRzbmdneGVLTVFHdWdPVCtWcmRVSkRnMlgyZ0tmNkR1TFBqMzNIbHNITkJM?=
 =?utf-8?B?TmtvWGhDVTNscDNaT1ZJY05HV1pyMGdMVCswSk1LMkt0bmx1WHhkWGNUeFc3?=
 =?utf-8?B?b1BOeUZBam5UZGI2azY2KzlrWTByc29xVHF6QUJKUW13cTVEcFlPNmpRODdI?=
 =?utf-8?B?ZGJsbUJQaVNmZFdhTWtkWXpFeWVnRXJBVFVUZzl2SldudEpodUVjMmZnazZO?=
 =?utf-8?B?YXhrMTI3YWFPTWsvTEZZOEczeXBxK3Y2RGxTMFNwb0lSc0E1cm5nZENUbUUw?=
 =?utf-8?B?bnZGV3FJQXNYc2NmL09kcS9ZL1JVNmJqWStoa1Z0d2Y0K1lwTWh4eGUyTmFy?=
 =?utf-8?B?MkE2OWhYOS9rY2JhNVVuQy9kL3NDNVgxKzJtcEdoUHJMRCtBeHN0VWZ5cGVF?=
 =?utf-8?B?Y3hGTEJXY3dscEpxaXNTMzlHZzlsKzY4OE1CdXc5cnNyY3A2SVV0OElDTC8y?=
 =?utf-8?B?VmxmNFlzY2p0MkllVVJkald0UkJTbk1uM1hVWXhRUm1WeHNnVVUxTFFmNkox?=
 =?utf-8?B?MHB2Wk4zOVd5SEZmUVRNeklWWnBrcFE4dEtWWVArMlp6OWJGQ0JCZ0JydkIx?=
 =?utf-8?B?ZWRXVmFDSzcySUdTbFZSc05ZYzRKOEZmQVRBd1p3ekhUTXJKRlhqOEVYQ2ZQ?=
 =?utf-8?B?Y211a1VXbjRuOW9MNk9BWnV2VmFaWXdpb0VCWnZoaDRjSlFtT2kzcUpGbmZj?=
 =?utf-8?B?Y1l6aG9jblRPWGxKcjhUMU05VEJzU2pHajFmcENTN1lKWEdHeWNOd2dJZGl4?=
 =?utf-8?B?NzV0M2dHMVJ3b3ppaUYvbjgycEhuRnpSTmhmU0I1bDQ3MnVrbER4QkR0S3c4?=
 =?utf-8?B?R0tianZmOEhIQnNQRktlM3pVcjBCNy9pZGZ5ZldCdnhkeEpwZm5aNXhJdC9V?=
 =?utf-8?B?N05FVjVjMVJBaGliVlg1S3RSR3hFbHdqVjNyckZTeTA4YS9MN0dxQlhRY2lY?=
 =?utf-8?B?dzlNTDE5eDdIYng2RmFIM3pqNHNFSlBSMCs4MnRoZXRqTFpqVHVkdWxUS1NT?=
 =?utf-8?B?dkVyUEZJSHJBQ3p6VmF5MlZ5M2V0NE1rZjR2d29ydTBYLzJidTlmVjUrL2E1?=
 =?utf-8?B?cUhwRUNRQkoyalBCdXhYdWFQWno1ZHlObElxMm16L1dvZ2lXRkR1WTBDTDlX?=
 =?utf-8?B?Ny9HUzBISWg0a2QwS21PbzdpQ3BzUXpWZjNGcjc0U1RRRU1BNzh2WWJCWmJE?=
 =?utf-8?B?aWc3QWhmdnYzWGZpWS9VbkJobUNPa05XS002M2FMT0NYcXQwTDMyRVlwMFQv?=
 =?utf-8?B?dXFxdVFmbE1LcWRMM1NOdmRFWEh6VEtOcW54Q0t6ZVBWemZMK09DQlVwWVR3?=
 =?utf-8?B?MUdFdHRPZ01rNTNXdjhwRkhraWxzV0hFejh1YjUrd3Q2Q2RNd0FLM1pkVzVr?=
 =?utf-8?B?UkhlZ051eTBRNWdSUGxNb09pVHVIT3c3cmxWSzJYdXhRUmRDeXA0enNQdFZ0?=
 =?utf-8?B?S0FMeFRjN1dCT1V0RXlIU1VyT3d4YnB0NVBheUx6TExjbzFVeHRGaXdzM2lY?=
 =?utf-8?B?V1BEMStQZHRETHdvRkNVeG1EV3pwMGNUdzY0aHZNSCtXVHJhOC9ZbVJyMkFF?=
 =?utf-8?B?Skx3T0JsWjJ4VE40K1hrVTNPWGhmeHZianVJUVNTL2ZPajZJWHhmQi9hakdq?=
 =?utf-8?B?TWpwQnJ6NHZXNDVLbUZ4RE9COWt5YUJRVjdKcVFlNURBTVRLSGs3UVdjNEZi?=
 =?utf-8?B?T3J6cWFFL21OMUFxcWNHRWdtSTMwYW0rTUNCMTN4d1pnTXp0N1UxOUQ1eTh1?=
 =?utf-8?B?YlZRck45OG42UXVTcXhrdjVJUmFYeXJ1c3YxZUovbnp1eW9mNDhTbUsva1BC?=
 =?utf-8?B?VmRqZVZzc3U1cDhSVFE2eHdqSFBRb2x2emsxMlNkWDUxWUttLzFIQVYxMmRs?=
 =?utf-8?B?ZjYvbVZ4MTc4blhWWW5WWko1TEtPMmVGeUl2aUttN29nS2dTaEUxZlB5VUpD?=
 =?utf-8?B?WjltM2tDTGxaYytQeW1URGkrR1MwdkNKb2I0ditZZ0RVSlBPUHI2NktQMUJC?=
 =?utf-8?B?dXhxbEtVd2M4MmRSTjdWR1I2VGtZZW1JYlFWSzUzOG9VTHhieHNSaXhiU2Nq?=
 =?utf-8?B?bVhzR2F0dHd3TnhJUkJsWkMzOUYwdm5IZUtYNHpSTlcyTGRmTEtTcFdmUGdT?=
 =?utf-8?Q?llxLnPcxKfyW7B1pBV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f72e40-8e6b-4c95-2698-08ded7583cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 10:05:11.2437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsCHrKV6U+yB4ZXtSRkY7KiU5fAbZnJVvTdCcOsVVe604p8n6lrKJpfp7H/bpkbibSdb/NEi2K4idN5cDNOAPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3916
X-purgate-ID: tlsNG-bad1c0/1782900318-47731986-F196BA0F/0/0
X-purgate-type: clean
X-purgate-size: 2066
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,xenproject.org:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: A8D0C6EBE01

SGVsbG8sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDMwLCAyMDI2IDQ6
MDggUE0NCj4gVG86IEhpcm9rYXp1IFRha2FoYXNoaSA8dGFrYUB2YWxpbnV4LmNvLmpwPg0KPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djMgMC8zXSB4ZW4vYXJtOiBEZXZpY2UgVHJlZSBiYXNlZCBDUFUgdG9wb2xvZ3kgc3VwcG9ydA0K
PiANCj4gT24gMjkuMDYuMjAyNiAyMzo1OCwgSGlyb2thenUgVGFrYWhhc2hpIHdyb3RlOg0KPiA+
IENoYW5nZXMgaW4gdjM6DQo+ID4gIC0gVXNlIChucl9jcHVfaWRzIC0gMSkgYXMgdGhlIG1heGlt
dW0gQ1BVIElEIGhlcmUuIFRoZSBmaXggZm9yIHRoZSBzcGFyc2UNCj4gPiAgICBtYXAgbWlzbWF0
Y2ggaXNzdWUgb24gQVJNIFhlbiBoYXMgYmVlbiBzcGxpdCBvdXQgaW50byBhIHNlcGFyYXRlDQo+
IHBhdGNoLg0KPiA+ICAtIFN3aXRjaCB0b3BvbG9neSBzaWJsaW5nIG1hc2tzIHRvIGNwdW1hc2tf
dmFyX3QgZm9yIGR5bmFtaWMgYWxsb2NhdGlvbi4NCj4gPiAgLSBBbGxvdyB0aGUgc3lzdGVtIHRv
IGtlZXAgcnVubmluZyB3aXRoIGEgZGVncmFkZWQgZmFsbGJhY2sgZXZlbiBpZg0KPiA+ICAgIHRo
ZSB0b3BvbG9neSB0YWJsZSBhbGxvY2F0aW9uIGZhaWxzLg0KPiA+ICAtIFJlbW92ZSB0aGUgdGVt
cG9yYXJ5IGRlZmluaXRpb25zIG9mIGNwdV90b19jb3JlKCkgYW5kIGNwdV90b19zb2NrZXQoKQ0K
PiA+ICAgIGZyb20gUklTQy1WIGFuZCBQUEMgcHJvY2Vzc29yLmguDQo+ID4gIC0gTWluaW1pemUg
dGhlIHVzZSBvZiAjaWZkZWYgYmxvY2tzLCBsZXZlcmFnaW5nIGNvbXBpbGVyIERlYWQgQ29kZQ0K
PiA+ICAgIEVsaW1pbmF0aW9uIChEQ0UpIHdoZXJlIHBvc3NpYmxlLg0KPiA+ICAtIENsZWFuIHVw
IHRoZSBjb2RlIHRvIGZvbGxvdyB0aGUgWGVuIGNvZGluZyBzdHlsZS4gUGxlYXNlIGxldCBtZSBr
bm93DQo+ID4gICAgaWYgSSBtaXNzZWQgYW55IHN0eWxlIG5pdHMhDQo+ID4gIC0gVmVyaWZ5IHN1
Y2Nlc3NmdWwgYnVpbGRzIGFjcm9zcyB4ODYsIFJJU0MtViwgYW5kIFBQQyBlbnZpcm9ubWVudHMu
DQo+IA0KPiBIYXZpbmcgdGhpcyBoZXJlIGlzIGJldHRlciB0aGFuIG5vdGhpbmcsIGJ1dCBtYXkg
SSBwbGVhc2UgYXNrIHRoYXQgcmV2bG9nDQo+IGluZm9ybWF0aW9uIGJlIHBlci1wYXRjaD8gSXQn
cyB0aGVyZSB3aGVyZSB5b3UgbG9vayB3aGVuIHJldmlld2luZw0KPiBpbmRpdmlkdWFsIHBhdGNo
ZXMsIGFuZCBoYXZpbmcgaXQgc2VwYXJhdGVkIGFsc28gaGVscHMgdW5kZXJzdGFuZCB3aGljaA0K
PiBpdGVtIGFwcGxpZXMgdG8gd2hpY2ggcGF0Y2guDQoNClVuZGVyc3Rvb2QuIEkgd2lsbCBzcGxp
dCB0aGUgY2hhbmdlbG9nL3JldmxvZyBlbnRyaWVzLg0KDQpUaGFuayB5b3UgZm9yIHlvdXIgYWR2
aWNlLg0KSGlyb2thenUgVGFrYWhhc2hpLg0K

