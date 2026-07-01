Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MDCiJtWLRWopBwsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 23:51:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE66F1F57
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 23:51:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=j+g6oOP6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1350971.1608341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2pj-0006fV-6c; Wed, 01 Jul 2026 21:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350971.1608341; Wed, 01 Jul 2026 21:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf2pj-0006ck-3Z; Wed, 01 Jul 2026 21:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1350971;
 Wed, 01 Jul 2026 21:51:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wf2pg-0006bO-Hl
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:51:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf2pf-0054vW-J6
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 23:50:59 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a458bb2-bab6-0a2a0a5309dd-0a2a450cbc7c-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:50:59 +0200
Received: from [52.101.229.100]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a458bbb-f399-0a2a450c0019-3465e5649f90-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 23:50:53 +0200
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:363::12)
 by OSOP286MB3905.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 21:50:48 +0000
Received: from TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f]) by TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
 ([fe80::9caa:1ff:d16c:e15f%3]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 21:50:47 +0000
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
 b=Apnt8DqnPB3QP1Pss7XvY9p+0kbdCP7yxn2rrucfvwj1y68FkxLlEYrg1hRhKLRVhyD6qJ6DuvnV1m8FznVx0qbUlsBKftnGQXO6Wo/V+zAqP5PZ8GXbfpNUC5qfyrsM5h60JCsd7LABTNnf5vdeLIN/8Vajq0BLZMJ3UL4qGx5+G68Pt952GHS2r1yYxERDGhqdg/TTmhtUjnc8tBMc19hwFHs36WbhFGm6DSO9p+WK0EuT9rRr+vRF5g48f8MBxt+s+C76qSknaAJY/M+hCBJRI17V3Z7F9NBv5gOhIh0qHJc8qS1XQI128AUOERHzQDbdjdB/ufIEr4h/DLwXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMr+iCYzj+ti+jg9ziJqWr1SMrXbZx3IfO46chyDpn4=;
 b=ypwaOpQDAZrqy15ukHBZ2NWTP4TXHRwj58N2XvSuxWoNtIuwSKRQzXgaCP88hkZdyuEvQEC7ECVV2WotG2ovtzWXoG/73aXh8ARHSbgGFDKUGqK2uM0x29UlONvuh9rhm4rdTMaiTLAj6sy2EzCNX//xmINYyeEZkyN0rAvO+6xpIFftuLUjHBuVhUaBVKtwfbTp4UvpazkxHRGgaK7CkpDybpahAfcc9QJkg5WG9IRfzizC2Zuxz85bIkynuNv/5G8WuQcoJJfBE+lPGmEh9AnRI/o0fPfLcoVVku41mFjgGWCAsMVV5QxjPRYfrrWMBSNglxHOZ99vwTjHcNFdXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMr+iCYzj+ti+jg9ziJqWr1SMrXbZx3IfO46chyDpn4=;
 b=j+g6oOP6ZsUxfXDsGn9GbRB6ocrMsjC8b/6ahfPIdym0Bkp78ohymHbl1dcIQdYM3KO/Q+AAFAvaaaOL1g8R/SNc99kHZapTRA3CUBF5dQcSODc/Kqs4V6XtQbI8jZcw7Jfiodvmngf3ylp984IWAQ/AuUqKRg57/JubZz2UPSE=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 2/3] xen/sched: Link CPU topology to scheduler
Thread-Topic: [PATCH v3 2/3] xen/sched: Link CPU topology to scheduler
Thread-Index: AQHdCBJhHN8gTC0+5k6Ik1hF9MtBXrZWrIoAgAKKNXA=
Date: Wed, 1 Jul 2026 21:50:47 +0000
Message-ID:
 <TY7P286MB72344551C12A6ABB450FA12C82F62@TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM>
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-3-taka@valinux.co.jp>
 <e01e0ce5-b0a0-4942-9018-20ab252abfc1@suse.com>
In-Reply-To: <e01e0ce5-b0a0-4942-9018-20ab252abfc1@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7P286MB7234:EE_|OSOP286MB3905:EE_
x-ms-office365-filtering-correlation-id: 876e0c72-eb2d-4830-10f2-08ded7bacf8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|18002099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 htXm5u4D64e1zN8SIjLm9la6UpcfLBKjUwdgmx/eAnj8mZ/BvIlfWsVykXeKC6eRh8/6Q/0LLKDd3UH0hjR+NIkyCs/9u7DnqO/Hiz3sZdtYkJmeL8ZrdIHMHX2y+CA2vwoK0DRueOG3kz3NxjomY/9O8sUtgoxp6hEzWCDQusX2SengdLoJU+Ybh2H16zMX+KAiVSaIBSS2kpymGE8H9ZKpK8BOBjMWfUe6/QCZJC7FsxhcOhYsyHYcLBRnmndEGAYfqeLXCF0GArEWQciSXi9x0VNCXOx0W8a1HTiu70Mfze/3rxzgAComtG543f5vH3eE06ooQKa6anWDyBAu296iPoqR+H9iCEL6soHZwf7bTpM7j9DVWyDSxWSp0O+gCjM6yWUhyMj4DQFQsrP1JFLl/HXN8JvI1gy4iEfjFHUCkPt+7OOcTzQzIN3KRm0JpgTCsJwTS3ttaQJxtWS/rllevBovJdJhX/SJhP8XLCEBgXbOGiTdSg8BJP4Pf+RDH/6GJAY19gljnKyngHkdCR3Y0hf0U7AaYilsEqc7UMc1FrGNFuvAIqaFzA3kEYKtr+TrCjo2RBrNAsAEbm6nL8qKsHlrFCcnheDe4ghMgo9w+MDCvznkVepXi4g60x/VOHsmPDbr7crzZsD7PzNdyQj97ogotZnQvSunX/lklTpZuU7s8LPsL0cNKxkQ5LzZMNMTlFNU5irBQJ7myhCB/g5gTEgcjxaUTkjuRoy1a04=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M0JzL1VCZzNhdDBGaDZmclRuSzBRNlJvTE9DR1pFK1p5M0F1Rmo0Q2MrWGw3?=
 =?utf-8?B?Zmg3TGl3R3NubnplcDZwa1VhM1J0bVJRZk9ZYVc2ZWM5QW1JVEhBWHZxQ09p?=
 =?utf-8?B?aC9peDFGTGpVNW90RnMrQjRhbVBhdXhtcC8vOWdDZDNUTHByempLamt2RktO?=
 =?utf-8?B?bU9wbVNzeStJR0daNTFyMkZQbVRYZFhCYnkzL3JnSmV1Yk00K3IxUEp1TjBs?=
 =?utf-8?B?WUVEY2d5cSthZGUwZ1ZGc2JzS3VyWEF1ZEpFdmhGeFllOUtjcTBQTnZMK05p?=
 =?utf-8?B?T2RSL3FCdnVFODZBd2p5Tk01ZEFOZlhiNWdaOHM1TVY4ZDd6K3dHQ3FrOFRF?=
 =?utf-8?B?cStQa1RYWW0ycFNXQldBbUkxbk1RdjFYYmcwSjVWMzFwV0RFUGRaaWt4cDhI?=
 =?utf-8?B?Z3pvMXk0dTQ3Q2k0SGhnc292S3RBNUNXRU96OEFvdkI2ZVhMYTZTZHpkc0g1?=
 =?utf-8?B?algyY1JBK0tJSHBma0Y5Si9qTHlWY1ROSkY0SGdxR2ZLZmtOdnBYcldXVDU3?=
 =?utf-8?B?Z3NUQVd5eThhZWZZN1BHenR1SXQxRE1JTHRvb2RBQU9GNUZQWEsrY1R5ME4w?=
 =?utf-8?B?eERuNmdwWkhPQ3AxRXlKd1R4dW5KYU1CUlo3cnVld1g3UW00bE10eGJLVVZZ?=
 =?utf-8?B?dXIweDBadVJ4Q253dDBmbzhUYytIOExMWmJWWUd1MGNlOTRxQzkwcmJkMW9i?=
 =?utf-8?B?UEFDREp3NXp1dExNYlRGMzAzdDNmcit6Sm1CWEduY3lSdlFqbmNaMmRtOUsx?=
 =?utf-8?B?RXpucGpXRURwYnZrVlhWN0xMdVRqY05aYk9ULzdFNUFZbldycDZhMnQrZTVK?=
 =?utf-8?B?b01uRWsrRmhjcTRFMFZ2cnBJbmFlZml5STRzL2JKYUM5NUJseG9zUFRZYUNR?=
 =?utf-8?B?MkVWMHNMVGxESmtGcGRjQWpWaVhhNG9zV2IrVnNRell4eFhSa1k1VSt4bTh6?=
 =?utf-8?B?STd4ZGYxRFBhb1h5a3ExU2Z1NkwwZndrZFJNK2o5NW5VdEl3bmdXWVVjZVVK?=
 =?utf-8?B?NlhrUFA5Y3VSN3VpR21RUUI0bXNPNVQvMXg3SlcyV0ltdU80K2VjNTVTY3V3?=
 =?utf-8?B?U0lWTDgxZ0pieHhZUExreUppM2tyRkhOUGV3b0NhblFCZ21mSWE3SkM3azIr?=
 =?utf-8?B?VEk0Z0o0OEplcElINVpKcVZCWkpURlRzM1MrVEJjL0FYalRidytFQ2x6a2c1?=
 =?utf-8?B?c1drSjA0SkluNFMxMVRxd1dRQVVzR29EN0wrYzNiM1FybElkZVdUMFZMbnFy?=
 =?utf-8?B?Q0JyUWJDdm42N1Zzb0o1YjZ4N0hBSGxBMkl6L1FVb1hEQVVIQnZyQ3dBVnQ2?=
 =?utf-8?B?OGVLZmFnU0Fmb3NyVmRYL3VBTFJUTmxjMWJ4WWpZL1V0a29ldVNHQXZyQ1dU?=
 =?utf-8?B?cnVaK0ZVbTRYc0xsQ0dZSFgyZ085em9xZk9xRkxFTkxyZlFWK1JzdlpqQXZ2?=
 =?utf-8?B?Y1BKZ2FsaGtteUNLa0NKWjJmRjRiUzJLVzhiTThsK09aYmZVOUFqaFBoUVYv?=
 =?utf-8?B?MHdyZU5SSHhncW1hNEQ1V055STk2b3c3Z29CYVEyVjgzT2w4QStBVVBkV01Z?=
 =?utf-8?B?c0VGTzBGR1VwMUdEMXlFc25iYi9EcyszOEdpdy92T1hLTGF2V2JuT0Y5WW1o?=
 =?utf-8?B?dUhKYVN0SEd4amxsaGNvSE5lcUdRMnB4TlVhZWdBWit4ZS9CWUZKMVlGN0Zw?=
 =?utf-8?B?Z0JFZkxQOE5UK2c1RGZxUitpUktxbVc0Tnl6MmdwNC9KRTVZaUEwM2VITXMx?=
 =?utf-8?B?NWowMWR5cXh6a3FHU1VrazNlc3d3cGlSdTd0a0hFb0xyWmZKMjc4QTMxWVJH?=
 =?utf-8?B?WGN0cis3VGprQzhpR3FrN3dCM3duYWNIWFpKVWNQQXJtZmZiS2tQUEExdzNt?=
 =?utf-8?B?VW03aXo0WFpFS1F5Rm1rRXdhK01KSlBIT2NKNXFYTmhVRFpYazhEaFZVNnR6?=
 =?utf-8?B?UzR3R01IRER2WnlpMG9MQnk1ZEVmeXE1bFRHOHRuMloxYkJjZnR0UUJTdXJ4?=
 =?utf-8?B?djBLb05YV3BraWpkcGZyb01nUDlSUEpqdStHU2hwRE1zSW12Mkd5ZUZHWlZW?=
 =?utf-8?B?UENOV0Jvblk5ZElJSUZrbUZTWkNkVm9od3V4eDY5WEMwVk9yV081K2Vib1Rh?=
 =?utf-8?B?dnorYlpscjZYVklNRDQ1TlZoVmxPZGxWdmFsZFJyZ1VPRFhlYXlmcUpseXA0?=
 =?utf-8?B?dGNSU2xKNUZNOVh3dFBDUFR1TVFzMEZ5RHFiQWVnMG0xLy9aOGhCaXFXSUFN?=
 =?utf-8?B?Z3VSWFhZZmxySmdYdkJQODNBbXJVY1Q4L1Mrc3AxVmFteUk1WlMxb0Z2SlM0?=
 =?utf-8?Q?Kqm3xGexICjiFCeGuJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7234.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 876e0c72-eb2d-4830-10f2-08ded7bacf8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 21:50:47.9037
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRYF/KXpEep3E9PAtZ28ju9qPEGZDNLUQU00LZ7HP/884qr+0ohlx5RJTsoFNPkEosXuQjHHfVFkFs4aFcBnaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOP286MB3905
X-purgate-ID: tlsNG-d25034/1782942659-0ED3AD51-A8ECF789/0/0
X-purgate-type: clean
X-purgate-size: 3038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.41 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,suse.com,xenproject.org,lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7BE66F1F57

SGVsbG8sDQoNCj4gPiArI2luY2x1ZGUgPHhlbi9jcHUtdG9wb2xvZ3kuaD4NCj4gPiAgI2luY2x1
ZGUgPHhlbi9lcnJuby5oPg0KPiA+ICAjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiAgI2luY2x1
ZGUgPHhlbi9saWIuaD4NCj4gPiBAQCAtMzcsNiArMzgsOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50
IGNwdV9ucl9zaWJsaW5ncyh1bnNpZ25lZCBpbnQgY3B1KQ0KPiA+ICB7DQo+ID4gICNpZmRlZiBD
T05GSUdfWDg2DQo+ID4gICAgICByZXR1cm4gY3B1X2RhdGFbY3B1XS54ODZfbnVtX3NpYmxpbmdz
Ow0KPiA+ICsjZWxpZiBkZWZpbmVkKENPTkZJR19DUFVfVE9QT0xPR1kpDQo+ID4gKyAgICByZXR1
cm4gY3B1X3RvcG9sb2d5ID8gY3B1X3RvcG9sb2d5W2NwdV0ubnVtX3NpYmxpbmdzIDogMTsNCj4g
DQo+IFNlZSBteSBlYXJsaWVyIHJlbWFyayByZWdhcmRpbmcgdGhlIG9yZGVyaW5nIGhlcmUuDQo+
IA0KPiA+IC0tLSBhL3hlbi9jb21tb24vc3lzY3RsLmMNCj4gPiArKysgYi94ZW4vY29tbW9uL3N5
c2N0bC5jDQo+ID4gQEAgLTI4LDYgKzI4LDcgQEANCj4gPiAgI2luY2x1ZGUgPHhlbi9wbXN0YXQu
aD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9saXZlcGF0Y2guaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9j
b3ZlcmFnZS5oPg0KPiA+ICsjaW5jbHVkZSA8eGVuL2NwdS10b3BvbG9neS5oPg0KPiANCj4gVGFr
aW5nIGUuZy4gdGhpcyAjaW5jbHVkZSwgLi4uDQo+IA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hl
bi9jcHUtdG9wb2xvZ3kuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jcHUtdG9wb2xvZ3ku
aA0KPiA+IEBAIC05LDYgKzksMTAgQEAgc3RydWN0IGNwdV90b3BvbG9neSB7DQo+ID4gICAgICBj
cHVtYXNrX3Zhcl90IHRocmVhZF9zaWJsaW5nOw0KPiA+ICAgICAgY3B1bWFza192YXJfdCBjb3Jl
X3NpYmxpbmc7DQo+ID4gICAgICBjcHVtYXNrX3Zhcl90IGNsdXN0ZXJfc2libGluZzsNCj4gPiAr
ICAgIHVuc2lnbmVkIGludCBwaHlzX2NvcmVfaWQ7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgcGh5
c19jbHVzdGVyX2lkOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IHBoeXNfc29ja2V0X2lkOw0KPiA+
ICsgICAgdW5zaWduZWQgaW50IG51bV9zaWJsaW5nczsNCj4gPiAgfTsNCj4gPg0KPiA+ICAjaWZk
ZWYgQ09ORklHX0NQVV9UT1BPTE9HWQ0KPiA+IEBAIC0xNiwxMSArMjAsMjIgQEAgc3RydWN0IGNw
dV90b3BvbG9neSB7DQo+ID4gIGV4dGVybiBzdHJ1Y3QgY3B1X3RvcG9sb2d5ICpjcHVfdG9wb2xv
Z3k7DQo+ID4gIHZvaWQgaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCk7DQo+ID4NCj4gPiArI2RlZmlu
ZSBjcHVfdG9fY29yZShjcHUpIChjcHVfdG9wb2xvZ3kgPw0KPiBjcHVfdG9wb2xvZ3lbY3B1XS5w
aHlzX2NvcmVfaWQgOiAwKQ0KPiA+ICsjZGVmaW5lIGNwdV90b19zb2NrZXQoY3B1KSAoY3B1X3Rv
cG9sb2d5ID8NCj4gY3B1X3RvcG9sb2d5W2NwdV0ucGh5c19zb2NrZXRfaWQgOiAwKQ0KPiA+ICsN
Cj4gPiAgI2Vsc2UgLyogQ09ORklHX0NQVV9UT1BPTE9HWSAqLw0KPiA+DQo+ID4gICNkZWZpbmUg
Y3B1X3RvcG9sb2d5ICgoc3RydWN0IGNwdV90b3BvbG9neSAqKU5VTEwpDQo+ID4gIHN0YXRpYyBp
bmxpbmUgdm9pZCBpbml0X2NwdV90b3BvbG9neSh2b2lkKSB7fQ0KPiA+DQo+ID4gKyNpZm5kZWYg
Y3B1X3RvX2NvcmUNCj4gPiArI2RlZmluZSBjcHVfdG9fY29yZShjcHUpICAgKDApDQo+ID4gKyNl
bmRpZg0KPiA+ICsNCj4gPiArI2lmbmRlZiBjcHVfdG9fc29ja2V0DQo+ID4gKyNkZWZpbmUgY3B1
X3RvX3NvY2tldChjcHUpICgwKQ0KPiA+ICsjZW5kaWYNCj4gDQo+IC4uLiB3aGF0IGd1YXJhbnRl
ZXMsIG9uIHg4NiwgdGhhdCBjcHVfdG9fY29yZSBhbmQgY3B1X3RvX3NvY2tldCBhcmUgYWxyZWFk
eQ0KPiAjZGVmaW5lLWQgYnkgdGhpcyBwb2ludCwgc28gdGhhdCB0aGVzZSBmYWxsYmFja3MgZG9u
J3QgdGFrZSBlZmZlY3QgdGhlcmU/DQo+IChJT1cgSSB0aGluayB5b3UgbmVlZCB0byBleHBsaWNp
dGx5ICIjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPiIgYmVsb3cgdGhlDQo+ICNlbHNlIGhlcmUu
IFlldCBiZXR0ZXIgbWlnaHQgYmUgdG8gbW92ZSB0aG9zZSB0d28geDg2ICNkZWZpbmUtcyB0byBh
IG5ldw0KPiBhc20vdG9wb2xvZ3kuaC4pDQoNCllvdSBhcmUgY29tcGxldGVseSByaWdodC4gSSB3
aWxsIGZpeCBpdCBpbiB2NC4NCg0KVGhhbmsgeW91LA0KSGlyb2thenUgVGFrYWhhc2hpLg0K

