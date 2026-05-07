Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FdZJA8N/WmFXAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:07:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4D4EF938
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 00:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303098.1576645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL6rq-00073o-As; Thu, 07 May 2026 22:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303098.1576645; Thu, 07 May 2026 22:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wL6rq-00071H-7Y; Thu, 07 May 2026 22:06:50 +0000
Received: by outflank-mailman (input) for mailman id 1303098;
 Thu, 07 May 2026 22:06:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1wL6ro-00071B-O1
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 22:06:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wL6ro-00544V-4z
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 00:06:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd0cec-e002-0a2a0a5209dd-0a2a450bdefe-40
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:06:48 +0200
Received: from [52.101.66.140]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69fd0cf7-212f-0a2a450b0019-3465428cc5f8-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 00:06:48 +0200
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AMBPR03MB11797.eurprd03.prod.outlook.com
 (2603:10a6:20b:77b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 22:06:46 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%4]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 22:06:46 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsKJWlSrobOh9ZuZYw1HtEnHBXoqnt+T54NOOpQr5tTuIGKx24iKaIUBHVbL2dUQkbKYjEQl1GRtY4CIFqvcgoE42YU4GeoZQuJbdOKWqLa7zVgVFNc0xZTmTQCPg6O3U05q2W0ZfqwbCeyn433DXMJsrWAFf8cHcAcxhnwYD/LXuYe4GTdhYHr721rlAGT4OELqklrwQn+vyOq6W1/ZJqUJsP00ePPi6EFG3x615LEI3ZZJ4Ap6Qy2TuM2K3x8JTQVI56z5d4FjjLrZ1EgLa45/zlOr+gHpPn8vGZu6K0XFEUFYqM2dqSl+cQRl5ikO+yX9f8GwAI6niLAzZAr6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKMahXZMeizvn2uXxNNtiXd1jfRfvyGi2cDqkfLqGGk=;
 b=yIEuCT7HED7h4jwcujEHaxndrGnU1NLcf7NHvFhZahb9TxMXtbhpCtNiBNmBvI2Y66Y8TC619Bp+y3IosbPrKOErt+wxRUBocbTby7ku6bNQz+9KIk1qZS1YAfDeEIzbONuOEnQUJ8WBGB8D1PbDFLDsFhFgKLWIZA/wwSbm6mT9vZkOQh/+sWTA0WkeeQ85VTg7+cIxmGlXkyUGyxEpAYybHwtWCscWf5mx2ttN2PSWXpzr4fnb5cJl2n870QQKsR3ST4er17eKpQ/LfnEHBt+BWFhoTYL9MX+fdAmFHS4gbvWyZekJwfptZ56O7W6qQbOdES6rgSmybIlcWoAUCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKMahXZMeizvn2uXxNNtiXd1jfRfvyGi2cDqkfLqGGk=;
 b=B4f+2HzaS+ZxYTZL+vOczeJsuqz5QJpx6x0iUCC3PnXKsf+0lWL4iMsEjpA5wDGmlEkZeIezY+NidUhvvRnRXpaN1qvE9S4ZBUeIYbQtaJ6bDwUAY0MkOXNRwj2CdmFZcUTxlSmnztipAWUyBq3Re4B5Wy1zULX8yJOeqEkgidV8sLrYMJa/JGekAx7sNcGlDKThI+H9Tv0Br4vnn72Y44nyC0TBLmNL+5tCvq+mvbz8ltKJsrQkg7A8gec4lV35ZPE19BlLJCsLpG4qJqZ1mJuETpcTqYpbqZTVpW1svfoAdCqMt+sfxbkh6VpAFGVQ4AHYpB2KXBn3qimSBK5rog==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Topic: [PATCH v8 10/13] xen/arm: Resume memory management on Xen resume
Thread-Index: AQHcwo4hrz/Zb3wCRUyCL/cJypc6rg==
Date: Thu, 7 May 2026 22:06:45 +0000
Message-ID: <873402ub63.fsf@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
	<02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
In-Reply-To:
 <02b55a02f329d09c9f8b15d97ca9176b3c33017a.1775125380.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Thu, 2 Apr 2026 13:45:11 +0300")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AMBPR03MB11797:EE_
x-ms-office365-filtering-correlation-id: 1dac22a1-1244-4094-8641-08deac84edeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Tm6GVJ4C7VMQQ9ScVm1RZiBawQxnlGnj9MwDw3bxoPzdTAkEKDdU4AqUOMdfbql9x7ySKFqZ7JcPv9ZEFeRCzLKuMqVqaxQupQ+GDf0bx/Y3E9+17tv4U+xMYGVRd4g6q9dH1LAQWamEmkEbYVYF4OYKheADIh6wXjfgbdL5ut+wCcwD0sSi7AIF7q8gmzJ2Augz2ImoeNEO+UPMCOFxsLaqtH6x4zMfRkTKMFKPeyTwbi2riIkB0T8Oh0jQdw4N9qEMXW4JAyMpQgwoXWXHevNNlFdXd/zzU2eUdhRYBoqTRq+Efsib+i/x/09QTz6aParRNaFVIYWGx9tkr+74oVSvT6AGCi+l8wpK5rZPVQ1/4GmMBJW6BmUsZdZyKeDbIZwF0nLDuw7B86yf48HBA9xdVF1l6Woy1P3pkduVJ/2d46zfEWucSxXe4/LSHdCiW6/leu7lIPWDy0YNgiIjl9JdopFhd9QCkXHLWmB81H7cCGEuEyVEVBQvYib+xT+m3ThySPOQdC+xMvV2TDPomkMt1mVPNqFQZ7MLJwx8oa9AHjHcw8YPdsgKHzkMeAmAk+U4hR/ZqKDwHbDnRQlpI3UflbHruqD/3HpM87TIDDmoSHIlEozf36kLXKxldqhVsVQkIndnxDP2xBCl0v6LyuZ29IWTOy4KPckpIiSSbsscaxclNJyUT4BbrrNtUczMgBmpC+n+fvXmsrqNRhq7wvpx4KV0ppzPtrTw+4Km1N+YL1A3B6UEfAFQVdWgHLkI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J0ycifZXGdD+q99P+lyK7RrlCnbFcvosBilY9VmFocOVrDictR5IE+jMqH?=
 =?iso-8859-1?Q?TpcbzEqjx6cX2LTARu80VtJOwrtVVLPz91l12gKtbVend875JEeIOkJYTX?=
 =?iso-8859-1?Q?HOet+Ki3WABXqdj/jI6AbpKp+o9+Avmcyp8k8ltCuSkczgkp+wNuOr5Le1?=
 =?iso-8859-1?Q?xtiNDXPgs7mMY/+W57ZWX12yH4n6sP/bGl6Hqe1a5PCInEVadvGrVb1eSO?=
 =?iso-8859-1?Q?45564+5uRzSX7xHys0M3zNy4IgQJPKldgiXhXtAlmZBiLK5G1LaTijTz5E?=
 =?iso-8859-1?Q?ash6YXKdQ4llo3Jb2N9M8tlMSXoAIAHpIMAMl8XicybDRW//CNr/R9ZDaU?=
 =?iso-8859-1?Q?ODEyYGo5QSAIrvqlZMPVIOOXtxI5JAwJNjaDcp9qIR+ublzBWm8M1f3HsV?=
 =?iso-8859-1?Q?e+37pbRoZ5LkWvJfCfSBmy+pk1xxnK5VP06dWvERQIXBZJ/bYhJdZUrvRP?=
 =?iso-8859-1?Q?5Dk1WkTi7U8F03oM1rdJwjQ9G7kUSCy6jJNXn90CweJGMQRJxQBscKmzXk?=
 =?iso-8859-1?Q?TsxN+YgMlpwP5teEXg2JnHQVRoDaJVDlZ1FJVN4LmcuUzIbkW9HRN5PikA?=
 =?iso-8859-1?Q?jTRAPLNLUIeT6RJShaOwfJkgdy1sfOETRwBK1g+v802RsmprYuQFA9vzXy?=
 =?iso-8859-1?Q?c//kCzEyn/l3yWnNJ+qSnqulcvkQDBbuDa9pnM/PiLB8KPROE6ELx1Ore7?=
 =?iso-8859-1?Q?p+nqXwFm2nVIJppl1Qi+xFrwRp/24Jul3uqAWHsO8CP+usPXaGXEE40isI?=
 =?iso-8859-1?Q?7aEhBbe/5mYFnjjr6dRpCHQQFH4njWROVQrA4jpr/flArM1qis3rBRbsxT?=
 =?iso-8859-1?Q?TlZxF69DdWCnrdSIC5RNbVi2U+KupNwT/+9ob+r/WwIOMtPUIN0UB6CZwk?=
 =?iso-8859-1?Q?qFgP+Ct3iv3aKRSq/YS2OP/VC524OiZlVNvmv5FhRjUPM7fdRBt1LHcWcK?=
 =?iso-8859-1?Q?qZSddFVlCJHXyKBfJ9ghxymvybTFew8ZPHOSLRaAd/T345knqfRE8Exazx?=
 =?iso-8859-1?Q?o0bPjR8FdhktQKyUvXnZbDQxhXCcv/1/RW4mvuZ6HQ/xRrF7TrFt2YUr6B?=
 =?iso-8859-1?Q?H93Jo/6uwDji4KfqOFT0tOpWn0c/cJlnsmWxSpWYlC/df6YwgrL2xWhNWb?=
 =?iso-8859-1?Q?vPp4CahE6HOG446FEjJCA+b5AX9fXVNbORWbPAOqDNMgRyAkFiLHjpo38C?=
 =?iso-8859-1?Q?Hh2zKWSMekMLxFNurINC/tm8NpKvsHv5qKK04FZCkyrD0hHy54XlldTKXW?=
 =?iso-8859-1?Q?BmI+xoqskrjT58+aM5dLF2rEoELRbT6dqOgW8eVjUFzyx4BYSKIDSQfXud?=
 =?iso-8859-1?Q?e7BG04qrxTY+XYDilPXGopubBM1iykhRiLvOGJ3PsWctPuegm9IgkB37K/?=
 =?iso-8859-1?Q?gQxAsqFkcyv5BH7GhwJs340WSaYCoA3IZelhj79uBoIPCMgljU0HLul2oF?=
 =?iso-8859-1?Q?BeVGxxjAM5e800+I6Hy1dpJgJasDrk69wek7rMRikn2xnH2ApvX/1Zpz7l?=
 =?iso-8859-1?Q?uclTXK0ozZZKbeoidN3F6z+i8IQUOGXqY990RO4BIvy9r6KXKfL04esbMj?=
 =?iso-8859-1?Q?O2ukcLmJjj4JnIGyEhG3HqvTEPUZLWyNePs/fqC08+pS4mbS+eAbXeEAQ7?=
 =?iso-8859-1?Q?ONuDVUt/lz7EGJVKutS8DHeRk5NuJjoYYMUxY0gAgo4hp2RGe0uevkRizX?=
 =?iso-8859-1?Q?5OGTsCJGp9FQf9edKpJJ0MZLm5EOcH085mBEKEZabCxn+CxP1ABuwgEta9?=
 =?iso-8859-1?Q?cm1saRZNTy4vS+aSiFCk+n3MukdurDnsWIS8jGhlUV/9nfVbkUQFR57LPE?=
 =?iso-8859-1?Q?Hn2q+WL7ZMgeONAFQv0EO7wshGWhB44=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dac22a1-1244-4094-8641-08deac84edeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 22:06:45.9904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zrP1uSZM1bqsUBMlzfQ0E7RF4OqZmLXW+8nwJoPdFVNHAfngPOaB7B4eWxQJbz+ww82E5oEDHgWqpTw7Zo6GJ/cCcOjP1SvkGgVn8XymVxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11797
X-purgate-ID: tlsNG-42698a/1778191608-13979F3B-22283C5B/0/0
X-purgate-type: clean
X-purgate-size: 2134
X-Rspamd-Queue-Id: F3C4D4EF938
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[epam.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mirela Simonovic <mirela.simonovic@aggios.com>
>
> The MMU must be enabled during the resume path before restoring context,
> as virtual addresses are used to access the saved context data.
>

I agree with Luca, this patch does not makes sense as is. I don't see
why it should be separated from the rest of the resume path that is
added in the next patch

> This patch adds MMU setup during resume by reusing the existing
> enable_secondary_cpu_mm function, which enables data cache and the MMU.
> Before the MMU is enabled, the content of TTBR0_EL2 is changed to point
> to init_ttbr (page tables used at runtime).
>
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v7:
> - no functional changes, just moved commit
> ---
>  xen/arch/arm/arm64/head.S | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 72c7b24498..596e960152 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -561,6 +561,30 @@ END(efi_xen_start)
> =20
>  #endif /* CONFIG_ARM_EFI */
> =20
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +FUNC(hyp_resume)
> +        /* Initialize the UART if earlyprintk has been enabled. */
> +#ifdef CONFIG_EARLY_PRINTK
> +        bl    init_uart
> +#endif
> +        PRINT_ID("- Xen resuming -\r\n")
> +
> +        bl    check_cpu_mode
> +        bl    cpu_init
> +
> +        ldr   x0, =3Dstart
> +        adr   x20, start             /* x20 :=3D paddr (start) */
> +        sub   x20, x20, x0           /* x20 :=3D phys-offset */
> +        ldr   lr, =3Dmmu_resumed
> +        b     enable_secondary_cpu_mm
> +
> +mmu_resumed:
> +        b .
> +END(hyp_resume)
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>  /*
>   * Local variables:
>   * mode: ASM

--=20
WBR, Volodymyr=

