Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dA5GDOylUGp02wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:57:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55326738351
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 09:57:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=UwwSG76Z;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1358858.1612735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi66q-0005IX-NK; Fri, 10 Jul 2026 07:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1358858.1612735; Fri, 10 Jul 2026 07:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi66q-0005Ey-Kc; Fri, 10 Jul 2026 07:57:20 +0000
Received: by outflank-mailman (input) for mailman id 1358858;
 Fri, 10 Jul 2026 07:57:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wi66p-0005Es-00
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 07:57:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi66n-00G9Qc-Pc
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 09:57:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a50a5d9-5cb7-0a2a0a5109dd-0a2a4505a732-28
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:57:17 +0200
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <taka@valinux.co.jp>)
 id 6a50a5da-4f1d-0a2a45050019-34657d5b9714-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 09:57:16 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6288.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:332::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 07:57:09 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 07:57:09 +0000
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
 b=fkZili+YsvbUXTZfE1HLH47odFwZNVAwU6o89DB36czJdE35HWIVGv9cTapDFL/3xongNU6cXkZH7zHxBrhLp+c7CjOTIYC3QguX7lhMxE5lw4llUX5FNdBG827g2WLHegMPH1d1O85sHWXSreIPmGNfgraPVrF48pIV1AozuW3FgGPi9XcCMyncklQcnUv/s7vageXZYRlkr9Ex13z+sEjaiLZnxGw06S6TgqXZd3rXJtWN0bbzVUU2T/zGHxqPJ2fSQtm+85M2DBUnJ88nfr43F52YXSSHZaVQx7q9lDYaysX/XhlgB15IRp6qXFxW359OgcvZ2hQJxzyQRnx8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUjxcg8ljp7x7N7BOOfF25+5H+4safU3iatwgkFjZc4=;
 b=kA9+s2QY2rMYx3VkhQPiIvRdCcxRhYLR3DikeBQ1hAmO9nx/CQcn/3KjZHXZbFuV7ZS1DR3ecXQUpUKCtrG/++nNNcQPSoyvdAKT97D5HeGYjv5mNPDh0Z8QBwwZxOSd5mMclmX6HqPC1oR3OJbEloHW/8PDU0t024FYOdwDlCM6C4YS29mymSLIwSJr2LFoA1FChldEBR7beTRRbGXJqaMVcGCFh3muLnkNOtesOvtN/CoJtq8cWYIr41cw5bA9Dl+C6Pv/PJu/5aJwe1scJuV2FeV7k0XIzFb3HgFl0zwzkuKh7i4QhW0+/1U1qRq0HSWU+REt0EjiSrRbtSABsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUjxcg8ljp7x7N7BOOfF25+5H+4safU3iatwgkFjZc4=;
 b=UwwSG76ZEyMUaGO5HiqOKGa3CRfyKnZ0RfMLwiTwEHKfc77U2BiD3Ng+whr/m8YO9la1pkyJGJ9p7kMsQXXh8UGNgic4onPYaxda9HuxSyqnSPIwG8eyxPqrh4tEgTsirKFs+hSOYerby+mEjDSK+G33tBUmjhYTpYtyL2JZrkY=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v5 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v5 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdD+8qCEcYr5xaQEuU6MvjqTt1ZLZmWryAgAAAb0A=
Date: Fri, 10 Jul 2026 07:57:09 +0000
Message-ID:
 <OS9P286MB7222926F2CD3A2E43ABCAC2582FD2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260709220552.646462-1-taka@valinux.co.jp>
 <20260709220552.646462-2-taka@valinux.co.jp>
 <0fe60f59-ce48-4d0f-96f7-16bbae05a81f@suse.com>
In-Reply-To: <0fe60f59-ce48-4d0f-96f7-16bbae05a81f@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB6288:EE_
x-ms-office365-filtering-correlation-id: e1092a2d-1dea-460e-da7c-08dede58d804
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 Jmsw3TTmSt/VYtGHfmQUeOafr2Qnlao6mg47ufidi9j/xRGKnFpHg9udxuTIdtQMmsIZYgtvczbEVoiEeLZssrmUe9ODRcJkKOOMHIMo5IbPdop3yOl8fGOOyaBpCMwF8Wodc70PRI3Jw5UI53wLZulmjePBZS/4ETaZDb8nhLAj5zI0xhsj4BrgR7kukB0zlVhfVpnVdrbGfIRraFBLo2WLOJmn5x/Qd4V7TAvC3N0SfcirIKhFD0E1L4AbaZ1n0wcFQjLqf3C4naZXYJZjgeaYcjuAkHVyCroBKEiaRHEV2emwi//qo29oXyJnJzkaTwaGaF+3CXkjlt26jFyYHR81SQXuv1e8A+z0em2De3l5Q7mj+yneHGx/2wMvK4W4hyD0kJfSxjst/DRItPHrivkaVsvahZqRiNTHixQKSk2L8a1gaWZtM0AsW0+SiIMWDLsYwxS3/6wKx8zfNzaOoK6R8kSpcHdxA5JkniflvQDKBZJbIOInTikLMcwmVpHnvj2KPb1mWHMBKSRhec9Gx8JeqtF8cmMNc4sXk1/8vvplywz0GayoWHrUpBrPUrvAsT0PBpgnhRKfw+0SozutPUVDPSDTcz+N7O0/YOWqEabC4wknNKRGz3lStBdFaY/ROhyMDgYklHvdtn/WxwWGkjLMT2pyYVGNWTIE4sB+La1ZLU4LOQauPknHaOR/7pGKaDflMszsQ64XafyUfsoVL5WYpeHcultJFmb8Nt4MNBM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHJDOVV4WFRJUWtod3JrVnNjT1BXNTdvM1l6VmdQd0I1cWYvS1pCRlR5K0R4?=
 =?utf-8?B?cGVZMlFHbXA2alJSTi9yWDdHMnl0YW53MjBPN2FVdksvWkp1dDlYK0FHRW54?=
 =?utf-8?B?VzIzTnNtQlkwYnFUODZRWFdpSS9SWDhKajRDRU80VTZtcGFJQTFPNUFBRjhv?=
 =?utf-8?B?b1Exbjc5QkR3dmhxSVNIVHIvV2tUUnhlZ2k1WkFiN29tdUR5RnlqUXIydHRK?=
 =?utf-8?B?Zit1eUcxTjI1N3UxUzhRcFlOamVhd2dYc0lXQnJxK0NhSzdOR2R1WXhwanl5?=
 =?utf-8?B?c0VmWS9tcWRSbkNNVmRqS1VGWXN4a0puUTZWMDBndmhjbWpkdFJEYjNWalB3?=
 =?utf-8?B?QlJsUkZNcWNiKzU3L29ibm50dVVqS3FhZUlxT0VyaExnQWR6K2JONTVQbVFz?=
 =?utf-8?B?TDQveURzSFpObmV0UyswL1JCRTFjeXN4b1FVWjF2YzVhTjcrTzltaXNMZGV5?=
 =?utf-8?B?WVhUS0svR0I0ZkgyOGsrUFZ5dVJtQ0F6THZ3RjJKSm9FUEkybnZSVlM1MDQ1?=
 =?utf-8?B?K1JRUFBIendFK3JHY2tSOTMrY1pOME5tekM0MzdHelNoTXh5MGgrYU1MNjNn?=
 =?utf-8?B?ZFdKcWN1dm1namhpR0QzWENBczZSMFJRRXI1TGtlWm1yRVdudm84RVphbVhK?=
 =?utf-8?B?VzNsYXZoOGtTZmY5Vit4QmRxY2lTc0F4WWpjdDJPYnJSRy8wVCtSdkUyVjJm?=
 =?utf-8?B?eHNzb0xIOGFvMWZmRis0NHAxalZMUEErdm9mRU8yKzhmL1ppQkl1dndobnZB?=
 =?utf-8?B?Z0pOdDZRbkJ2WjJBTTVJa2NqL0NHRzZEL2dNdnE4ZUJ0a0pEOEtOTU9DNE5p?=
 =?utf-8?B?WDV2S2s0SFZYZUxnNUtYUEV3MnhoWXFYUkVWQ3N2WjRqaFdOTzlVRG9HYzk4?=
 =?utf-8?B?NGlobXo3azBQWEM1WmRsQU5TbFhwbXVPWnZjYUU3NjBrRmQvMzYrOG9xSXRj?=
 =?utf-8?B?ZzdhSWVSREVaVmpSeTR0ZzV5OUFPZzJlSkJEcm1FUUhBY2JNc2tvTlk3ZjFE?=
 =?utf-8?B?Vm1uaEd4L05oREs0K0J5V0tDbm8yUTZpckFlT1Rnc0hQVzMxTktRY2hhMVYv?=
 =?utf-8?B?Wm9ncjJKVkQzSGlkRHFMczEyenVqZFpPRjNrRWRzWG5HNTRzTUZZMkk4VjZU?=
 =?utf-8?B?OFoxNWp1NXpadForZWhYR0c1QmhxUHJkbHpZTkc1MVE5Wk8wYUlIMlBZL3R4?=
 =?utf-8?B?UFAyL1BGQUR3UjlYekN5cExpYzZDRXZPeGlpb0NmNnNBSFhGZkdYRTQyckc4?=
 =?utf-8?B?RklXUWZNY28zTUVZUUJuMkcxZTZPbE9iU1Bac05HQ2VzZzVEODdBVEhUL3Fy?=
 =?utf-8?B?ZFl4QWZwaXp3cy9iYUNSR3V5dy9HNTlaRnZ2THlHY0M4M1B0T2h3bUU3bzFi?=
 =?utf-8?B?S2dCZ3Y3eXI4S3JDS05OenJRbjd5SWFlWUpPR1RnUlEzZmZkU2U2ZzdtNUpz?=
 =?utf-8?B?NDczV0ptdjkvS09lbVMvZjZEd1VqQkFLWENMb01lNHdBeFhyQTFNUWM0RjNT?=
 =?utf-8?B?YXNaRmhKTHdTLzFESFVzUDJWUVgzcHN2RGt5bU8yQWdFc1g5WHNHWjJOVzAr?=
 =?utf-8?B?Z3F1aDlNR0x5SVRUNFpDVUpkQ0JJaHNFd3dkZk4rRHE0a3k1SDhnUXJ4emtS?=
 =?utf-8?B?Q0haRXRCWVowS1B6NzF4aWdRMFhpSmY0L3BZR1VqcUtMdVB6ckVzQzF6ZmNp?=
 =?utf-8?B?czUwQytwcFhYMlkyYmgxVUd6NW1NSlFWbXpjU2NzMDhZYXNnaWRzR0g3UEJn?=
 =?utf-8?B?UFBkclpBWUp4R2xLQWM0bC9hOENNR3NPTjg2dzd4MTByTERoQ3UvSmxHV2Nj?=
 =?utf-8?B?N1F2MmxXdWZPOGdtOTVabXZ5ZlltdGw5MjYwTUNBNmtBdjNzcUZYM3dYOVh0?=
 =?utf-8?B?aFl0bVJWRGhaMFVjYnROMnpGVzVoNW1VbWE2SjBYWlg5NTBBMjVmeTVrQW5K?=
 =?utf-8?B?YmJHZ3lzMG5Fb3crY1ltL1VqUWpXRE94U3l1ZXlSSWZyRFdhSFFseXcxL0RR?=
 =?utf-8?B?bHpEdE1RM3U5OXMzSGlrS2M4RHRHbmdLL2VhL1lKVm1oQm9VSHdOaFp0UmZs?=
 =?utf-8?B?dkJ3KzdJVXFWeThuQ005dm5GVUZiZ2lSMFRGQmM4Q3lkdytTR1V6UkVmRjFm?=
 =?utf-8?B?cFdjSGF4QkFhUllwbDJWeXY2b3czMTUweFJSNTZMSmZ1U0dVZlVwUHJUeXhS?=
 =?utf-8?B?aU80eXBmcHhYaVlyOGlZeUlLUCtMdXZYVGRlTHlNTmdrdGduSjdSd3hXWmpG?=
 =?utf-8?B?WEloS054dDhUSVFIVlJLN2N2SnQvTEtkbHJ3MnhxNEZab0RyenNURzZpN1NZ?=
 =?utf-8?Q?Xj+w+KoKOOKuc35DNM?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1092a2d-1dea-460e-da7c-08dede58d804
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2026 07:57:09.4998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQU/oJSybXGiKwADpRGgZy+rGuRJG9vjOOGA/vNjooGe9SAKAKC6uvuDYfXdi9WJaP6vE/O7FRGxT35uAO+Crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6288
X-purgate-ID: tlsNG-c201ff/1783670237-18A2012E-ED4A82FA/0/0
X-purgate-type: clean
X-purgate-size: 1934
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.09 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:from_mime,valinux.co.jp:dkim,OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM:mid];
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
X-Rspamd-Queue-Id: 55326738351

SGVsbG8sDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9h
cmNoL2FybS9LY29uZmlnDQo+ID4gQEAgLTIzLDYgKzIzLDcgQEAgY29uZmlnIEFSTQ0KPiA+ICAJ
c2VsZWN0IEhBU19TVEFDS19QUk9URUNUT1INCj4gPiAgCXNlbGVjdCBIQVNfU1RBVElDX01FTU9S
WQ0KPiA+ICAJc2VsZWN0IEhBU19VQlNBTg0KPiA+ICsJc2VsZWN0IEhBU19HRU5FUklDX0NQVV9U
T1BPTE9HWQ0KPiANCj4gUGxlYXNlIGluc2VydCBhdCB0aGUgYXBwcm9wcmlhdGUgc3BvdCBvZiB0
aGlzIGxpc3QsIG5vdCBhdCB0aGUgYm90dG9tLiBXZQ0KPiB0cnkgdG8ga2VlcCBzdWNoIGxpc3Rz
IHNvcnRlZCAoYm90aCBmb3IgZWFzaWVyIGxvb2t1cCBhbmQgZm9yIHJlZHVjZWQgcmlzaw0KPiBv
ZiB0d28gcGF0Y2hlcyBjb2xsaWRpbmcpLg0KDQpPa2F5LCBJIHdpbGwgZml4IGl0IHNvb24uDQoN
Cj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4gPiArKysgYi94ZW4vY29tbW9uL0tjb25m
aWcNCj4gPiBAQCAtMTkxLDYgKzE5MSwyMSBAQCBjb25maWcgVk1fRVZFTlQNCj4gPiAgY29uZmln
IE5FRURTX0xJQkVMRg0KPiA+ICAJYm9vbA0KPiA+DQo+ID4gK2NvbmZpZyBIQVNfR0VORVJJQ19D
UFVfVE9QT0xPR1kNCj4gPiArCWJvb2wNCj4gPiArDQo+ID4gK2NvbmZpZyBEVF9DUFVfVE9QT0xP
R1kNCj4gPiArCWJvb2wNCj4gPiArDQo+ID4gK2NvbmZpZyBHRU5FUklDX0NQVV9UT1BPTE9HWQ0K
PiA+ICsJYm9vbCAiQ1BVIHRvcG9sb2d5IHN1cHBvcnQgKFVOU1VQUE9SVEVEKSIgaWYgVU5TVVBQ
T1JURUQNCj4gPiArCWRlcGVuZHMgb24gSEFTX0dFTkVSSUNfQ1BVX1RPUE9MT0dZDQo+ID4gKwlz
ZWxlY3QgRFRfQ1BVX1RPUE9MT0dZIGlmIERFVklDRV9UUkVFX1BBUlNFDQo+ID4gKwlzZWxlY3Qg
QUNQSV9DUFVfVE9QT0xPR1kgaWYgQUNQSQ0KPiA+ICsJaGVscA0KPiA+ICsJICBSZXRyaWV2ZSBD
UFUgdG9wb2xvZ3kgaW5mb3JtYXRpb24gZnJvbSB0aGUgZGV2aWNlIHRyZWUgb3IgdGhlDQo+ID4g
KwkgIEFDUEkgUFBUVCB0byBvcHRpbWl6ZSB2aXJ0dWFsIENQVSBzY2hlZHVsaW5nLg0KPiA+ICsN
Cj4gPiAgY29uZmlnIE5VTUENCj4gPiAgCWJvb2wNCj4gDQo+IEkgY2FuJ3QgaGVscCB0aGUgaW1w
cmVzc2lvbiB0aGF0IG5vbmUgb2YgbXkgdjQgY29tbWVudHMgd2VyZSB0YWtlbiBpbnRvDQo+IGFj
Y291bnQuIEFuZCBub3QganVzdCBoZXJlLg0KDQpJIGFtIHZlcnkgc29ycnksIEkgY29tcGxldGVs
eSBvdmVybG9va2VkIHlvdXIgZmVlZGJhY2sgb24gdjQuIEkgd2lsbCBhZGRyZXNzIGFsbCBvZg0K
IHlvdXIgY29tbWVudHMgcmlnaHQgYXdheSBhbmQgZW5zdXJlIHRoZXkgYXJlIHJlZmxlY3RlZCBp
biB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

