Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cApYCh/1w2lZvAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:45:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AB132705C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 15:45:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262476.1554954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PU6-0000DN-ML; Wed, 25 Mar 2026 14:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262476.1554954; Wed, 25 Mar 2026 14:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5PU6-0000B4-Jd; Wed, 25 Mar 2026 14:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1262476;
 Wed, 25 Mar 2026 14:45:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Volodymyr_Babchuk@epam.com>) id 1w5PU5-0000Ay-Cl
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 14:45:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5PU3-00D49e-6G
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:45:24 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69c3f504-bab6-0a2a0a5309dd-0a2a4504a65a-0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:45:24 +0100
Received: from [52.101.69.120]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Volodymyr_Babchuk@epam.com>)
 id 69c3f504-c823-0a2a45040019-346545788383-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 15:45:24 +0100
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB8245.eurprd03.prod.outlook.com
 (2603:10a6:102:26e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 14:45:20 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::4484:fcf4:18ec:fbf3%7]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 14:45:20 +0000
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
 b=O04MiYQlHz/LvWGjIBc8OitlXkgP1YlsQRUCfZnmDkMs8qEmULLzj4XCyvtr6Smpu/NCB3QK72anIUVGbWRiwi/Ki1YdH6MGVFbAEO2AynLeL/aUjvLdjMGVnAmm2dNXbjQtuvbtgs7TJINvlUbwy42Xyu//LemlwrC/alPkbaQrldoBxXPryKuopRsxXveBz/eMS+CYt+DviRdKQWJGo7epEv+tjdzfR5jTCZ3Uuo1bRJCLzgiJ0NtCz37YTbzoyiFGRStzt+7XyFrJGAviMFEW9hz+whnVwxiZyHzqfcFjDCj7CR1p86mPLYxDhBLb8P85yByBlfnRq1z3nMRjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbEni8vswSWmayvLOdrlJNVIlOh1EX8ez+dkbyHhEdg=;
 b=zS+ABbGfImc4KJvswhvkNQqpCrW0XN20EOxSL37X/H5efVz7taSfk1c1ePxKrFCBPMLkqH/kwMgT6FCv+opi5ukNdHMgLn2FODETCpbGcnNRfVOceR1nuDoDRchCoMHmnFdpk2gP2mAjmKypxsMyVa2YNluojP2to7qPyv2DqJ3JFDTYrH0NjjwR4iUGCKhbj+zOdIeU8XM4s1wi3M1PfSYDGhzRJ0OlXvZ43Mfae0PfT5QSS/TXx7jY3hyCqi7EkMbRID/5mPD6idPD62LHEjAAWKf3TJq/LnwJfXxnQqFI98pRYhbMeX6/cRiS1X4XKQZMOlvuv7T6pBKOVPk4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbEni8vswSWmayvLOdrlJNVIlOh1EX8ez+dkbyHhEdg=;
 b=iGtIvjvVO1ihJ63x3rCAWdmEytPwNE92TvOTTHaGzehs8I2LEz1UEJqVIhqoU6KGXD6KyhTp+qd3TOEGRhbcWFfv2Boq81XW+ns/TF2Acr8xkYcDDjj4f2QnPrGNZ2f3yR7HTZ4BcPow6udxmkYKia7EiVXDaKMekEdX3i+XUTg7oUOogzLNCuxKk7tj4GEgMhQjFhqTpe5idhqpr+nknUuSTQQPJbkk9VgYh/bOf4sPSeBuHHB53LZAmjAGRfZADX0SFDjb/eBE741VCRtpvOlflcfafhSYLQXN5Dy/dGte32wKbx6JvQ4m3WjaDCpVsGTe5+sMo505uiITWoTETQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <Mykola_Kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Topic: [PATCH 2/4] xen/arm: its: add platform match callback for ITS
 quirks
Thread-Index: AQHcvEPkvPnBPPoH7U6Wnzsnt2hLeg==
Date: Wed, 25 Mar 2026 14:45:20 +0000
Message-ID: <87341ovugw.fsf@epam.com>
References: <cover.1774431310.git.mykola_kvach@epam.com>
	<10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
In-Reply-To:
 <10da5cf38dded9c3373c4b0ba54d7f7a7b2fd98f.1774431311.git.mykola_kvach@epam.com>
	(Mykola Kvach's message of "Wed, 25 Mar 2026 12:38:31 +0200")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB8245:EE_
x-ms-office365-filtering-correlation-id: 72dac3a5-ffb2-4f7a-ae64-08de8a7d23b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 XCQiEmdxnMcSW6K4Q8qRF+CxZ/bd5ATXHgjDmta+VCLoDCqw0MHp7KKZ1g7vJdCUyXxZI0Mzjo4fNhdoFNrF9z1MdFfKjs63654a2CuEzEN5o5ITQxAqNKrMUeZwkIRAvWcNYb2hPXLxsAkQG8I7PImUYgXODfFAUYv+pIH4FIyAsiF3YMEEoeSOSSIyRjzKovVoQRGU+yhh+ZLKkpR3KWsmwLisjkTWC3NeReePBRRFEfqZFK+A4ytAdsH+HwDb97zjmCHVHZEWVaYT1AkIbdlJNXGwh7SIJmghICYGw8AbUBusLq0rpA9xc8tq6pJ2gt301tNoDBVFmeFpCqebBAVAhG1CvSW2+rzgOwvtpo9yKZcRFRlvdrKOsABSigxgUd7KphD4ontc8hJ6HqgxlFkgTykWtERM/WKEoaaZ2NQmvYGsPMow1agXXDFHEt7Q6esoqHpB52Fk3JHGWfj7LTs39PTyBsnsofMGBBbuYfgIHvdzcw+DKfEXHNaWynXEewlQblDi4JhvCGStsw83yTW4WM0bURtnseC2f3YWMYbk3NftLY3RvRjcKI2bW/c8bguPfBd22S6Qp+PQK3lPWboX8iiBSvB52Nmx9iyMPI04brzbSifw43kZSdxegIiKPrdZbvkLalGBke244xlBoQ0rJ0D8b7Y/t9MT88vDDNVqlj55esB7Bz01fadZ0M2y0H9W6X2DnP1/UXG1+3WCl7XvWGxlFrvim6gm4x8uoM/JTG9OBFr/vALy02pUjS41Lo4WDF6LF1EmTY62gv8A7OM12ZGWX4qP/M6EZRbrcIc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ajIRtKbrA9hAuVcDMrx/WvthzLMUvyXP64jjdfNtkcpA0Ycx8KPlWL2SAA?=
 =?iso-8859-1?Q?MaYNNqrPCc92k2Nu+fooQk46zheftRkimp+GIHXGCRf6eMVyrSaXbNMxum?=
 =?iso-8859-1?Q?3JfmKSHOFC7wFkdGb69lGnjvpieZg66z5mNKHCRZSCyZnKnXOI62hrSxKB?=
 =?iso-8859-1?Q?9EY3lVbwoOfGSwow0NdM9mcdGdWrixWL5LhAaRaXP8mfyf4VfTTlEdaioM?=
 =?iso-8859-1?Q?VoXrpfKg7pFYb3ZiNc7OwT7idwUY4bnp5eLoE2+B4N3aJh3HE3PryBL9bm?=
 =?iso-8859-1?Q?WhoGSXQh0yWSYhgDlX3Aa1fUaVnY4Zhr+x/u4V2iBoGbND3GsXuHsJlm26?=
 =?iso-8859-1?Q?onnx2hDffc1B88LxNEgb3A2O4M/s1CZxHiAeWGyrAaPCRr41Q9W2xbClgc?=
 =?iso-8859-1?Q?KJm1Oe05Bz8unC7zzNdod9CPYf93BHZCukM+HmWkb4txXXlirhsZKiPpQ6?=
 =?iso-8859-1?Q?22qQLEmQRnwRHK1cR+upm5qztrO6LsO75AkwvN6VrGE4U8fHdwBQCkXdbW?=
 =?iso-8859-1?Q?f0Mr6fFK/zK7vh5QkCW2BR3a2H0z2TkKaxVZPHFyS9acWStEV3UAHUv0+z?=
 =?iso-8859-1?Q?Fl9FrgA4Aam5Qh8rDTXxuZV3FDLQkVynnB4/d0oevdGRGZsZDB4nMH3XNb?=
 =?iso-8859-1?Q?PABqdltgN3hXxyzFdgtpSHqWOsSJmIf3aMlLdNJ5KHAxAMDq6Db7kkMGne?=
 =?iso-8859-1?Q?vJ7x2ZOlFQevh7x1XPO7wxhuTn3asXekLiuzYnqy+0fbFAHDoqihz2tNhR?=
 =?iso-8859-1?Q?r2LKuhWspv+fon2t92S3oUMsKbQGgjAemU8qroEPyjs4JUG7vxK4NxEjb5?=
 =?iso-8859-1?Q?Hg9HeGyCkGzVH+ehS/m/XGbUNOv7/I3KqiOGQqaonkzGlz2+zMvuLJPoKa?=
 =?iso-8859-1?Q?cqBjdhfWIVyvfAg2N++MhSTz2i6D4t9180ncI97UZTdEwq4ZY0G0NQJ1+d?=
 =?iso-8859-1?Q?DZlTOzTcA1m8kpjVmsjGqUo+0whwSXtFatMTVrrGs4BdtKPwpAu7GsLOfC?=
 =?iso-8859-1?Q?dq8rZucFMIT3WIW9pVthW562QHp8Vt+NJGeW0bNCPC0KbWAZ8w9zRWptsg?=
 =?iso-8859-1?Q?+6vvqnH3r6dyZao4/3HLthok3RqEi3zl9uQtK8+/A4EEdhUFfPwkrITMGf?=
 =?iso-8859-1?Q?pEpiaX1a2v7zBVVMoYVZfO87dGFUUDCXIXVZxce3PIDb8GgdKQbA2xFlI5?=
 =?iso-8859-1?Q?LULrwsIknotK947DTmaivgF4rmLnjo7qqyDia++SSsjDDSu8yic8g5TISJ?=
 =?iso-8859-1?Q?ZIG3MBop7eFyqpNDjjAgkTAaMkCzYpBFZe+cYqGfKxwMd0ZsZZzMCD1elL?=
 =?iso-8859-1?Q?7frcRLRe1uIKERIAU/q30jLuTI/XNU9/kbz76dkzo2eR8fWxaMgTdsWJp5?=
 =?iso-8859-1?Q?zVwO8jfwkRLKEfxH2LfuY5jGQAxRwjA5ZIAu03V/Unw/55swcRY91NBShP?=
 =?iso-8859-1?Q?SJd4PlgeceXHkfq7ildHFLdVxOY9jmLqM5KVBy3vYoNqZnG+r31qRO11cP?=
 =?iso-8859-1?Q?VwIY5+wHQsrV4AJsou1+0u9faEmbyiBOges2dxLv7ok0taWwG3jVsU7bTx?=
 =?iso-8859-1?Q?dd+4scVyi3DrvSnzNcuxe6ZNbcucrp8mVV08XmAoCDxUjlGNdkn60ndEsj?=
 =?iso-8859-1?Q?KZl1sGATOKSCfW/1LoNGjFl5il0CfkTA8N7olYSlh6yZrGjfoEoIh5+qmB?=
 =?iso-8859-1?Q?GAHm/YNb+sUDdabKwWBq15TbHw00j1T4Zl5dE3WzuzIgZonsjNNbhUGV13?=
 =?iso-8859-1?Q?FUKSizr8MkDE6FOQyUnTj3W4ra/qNluwcx0uuLDOt6j6NKdGCk/ughFzEi?=
 =?iso-8859-1?Q?G9TAnYndrL7gA8kAYi8TP9vZmMrRdwk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72dac3a5-ffb2-4f7a-ae64-08de8a7d23b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 14:45:20.7589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QCfpOAqEukxYetInEK7UhgxGc3ptbTB/Hb8oICHeQPm/NraKRxjahMFdymghqwWQ5sx1jhN69QHBN/RzLnmtXBAtkHmJ9iNfkg2hvQdwsxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8245
X-purgate-ID: tlsNG-ebf023/1774449924-B38979D1-0E0A07DB/0/0
X-purgate-type: clean
X-purgate-size: 3003
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:Mykola_Kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[epam.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Volodymyr_Babchuk@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86AB132705C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mykola,

Mykola Kvach <xakep.amatop@gmail.com> writes:

> From: Mykola Kvach <mykola_kvach@epam.com>
>
> Extend ITS quirk lookup with an optional match callback so that
> platforms sharing the same IIDR can still be distinguished.
>
> Use the board compatible string to positively identify Renesas R-Car
> Gen4 before applying ITS workaround flags, preventing false matches
> on other SoCs that happen to use the same GIC IP block.
>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/gic-v3-its.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index 00524b43a3..c40629731f 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -57,6 +57,7 @@ struct its_device {
>   */
>  struct its_quirk {
>      const char *desc;
> +    bool (*match)(const struct host_its *hw_its);

If you are introducing match predicate, then why do you need...

>      uint32_t iidr;
>      uint32_t mask;
>      uint32_t flags;

these? You can use a predicate function to match against iidr

> @@ -64,11 +65,24 @@ struct its_quirk {
> =20
>  static uint32_t __ro_after_init its_quirk_flags;
> =20
> +static bool gicv3_its_match_quirk_gen4(const struct host_its *hw_its)
> +{
> +    if ( !hw_its->dt_node )
> +        return false;
> +
> +    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
> +         !dt_machine_is_compatible("renesas,r8a779g0") )
> +        return false;
> +
> +    return true;
> +}
> +
>  static const struct its_quirk its_quirks[] =3D {
>      {
>          .desc  =3D "R-Car Gen4",
>          .iidr  =3D 0x0201743b,
>          .mask  =3D 0xffffffffU,
> +        .match =3D gicv3_its_match_quirk_gen4,
>          .flags =3D HOST_ITS_WORKAROUND_NC_NS |
>                   HOST_ITS_WORKAROUND_32BIT_ADDR,
>      },
> @@ -77,7 +91,8 @@ static const struct its_quirk its_quirks[] =3D {
>      }
>  };
> =20
> -static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
> +static const struct its_quirk *gicv3_its_find_quirk(
> +    const struct host_its *hw_its, uint32_t iidr)
>  {
>      const struct its_quirk *quirk =3D its_quirks;
> =20
> @@ -86,7 +101,8 @@ static const struct its_quirk *gicv3_its_find_quirk(ui=
nt32_t iidr)
>          if ( quirk->iidr !=3D (quirk->mask & iidr) )
>              continue;
> =20
> -        return quirk;
> +        if ( !quirk->match || quirk->match(hw_its) )
> +            return quirk;
>      }
> =20
>      return NULL;
> @@ -99,7 +115,7 @@ static uint32_t gicv3_its_collect_quirks(const struct =
host_its *hw_its,
>      uint32_t flags =3D 0;
>      uint32_t iidr =3D readl_relaxed(hw_its->its_base + GITS_IIDR);
> =20
> -    quirk =3D gicv3_its_find_quirk(iidr);
> +    quirk =3D gicv3_its_find_quirk(hw_its, iidr);
>      if ( quirk )
>          flags |=3D quirk->flags;

--=20
WBR, Volodymyr=

