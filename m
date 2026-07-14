Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V9+lAqipVmqP/wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 23:27:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA7758FB8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 23:27:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=o9JD7HLt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1362571.1614381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjkdZ-0003RV-NU; Tue, 14 Jul 2026 21:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362571.1614381; Tue, 14 Jul 2026 21:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjkdZ-0003Ou-Kg; Tue, 14 Jul 2026 21:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1362571;
 Tue, 14 Jul 2026 21:25:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wjkdX-0003Ok-1f
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 21:25:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjkdW-0028J1-7h
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 23:25:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56a8ef-bab6-0a2a0a5309dd-0a2a45058186-46
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:25:52 +0200
Received: from [52.101.125.78]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a56a95d-4cb1-0a2a45050019-34657d4e3057-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:25:52 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6353.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:335::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 14 Jul
 2026 21:25:46 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 21:25:46 +0000
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
 b=ZzU9oSXCPAJ6sMxNuy5pf/Mt9jnWaPir9NqHrdKzy4OI2ZqfriiyO1qoOoMzOrJaIfDx7EGvSj3cJPezGR6fNUerL8cpZg2a/LKqaa8uf1AtARRtFh3i+XWWpTje7zrLRNmItUDBTKnbRIEqn2DolhhkWhK4NmQHmN3gVJkpwQHhAxT9rOrGCqBl0IDyhcnJ0vfithtGwVwknx4BjKy+MuZXAdQ1BY4VoqJx42Pdo78JxOx5qHC27mUDT5WLJwNIb5ISencJz/jDncs51XbfSuUs7ZO0Hp+bzDtY6/QkJudNmciDS48O3kJKm1bir0cdNvxyoYfGvIXXb3GRLAAMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0/u/pfinWTBoJJN7oUTBocdgcK7gmqRKa077vo9mjg=;
 b=b+DVtRrzQoTeDPAyZ2xA1ckcwfj7+aGhF+pvsGcfelB8gckW+/vvwxau7NUoEj+GGcPzXhDL/bjZc9NGPh+8qiLH+xSvDT/9qcR5W3NmM0mjElbIgSzW4uFCjQHBAYcj3DLlwENdxerG8EaEvTDIaUf0p1wONriGY+UL2ZVkq1y/KHf8djRwWXeeI7JbjapEbKKVlGKKM9PJgIovju63mBcQp6ro6Gx37QuKxM2T32F6oHGG91NOesCRRpd15UCmm4AJ69whuztECPA1BbLUPjPKhAgS7yciYuPHrTAeWZAYbc9yMi61stBsdHOYa3hEWvyeDmdtDQqxSUaArbr3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0/u/pfinWTBoJJN7oUTBocdgcK7gmqRKa077vo9mjg=;
 b=o9JD7HLtz88NwRdrG+fzlj1YEgkZsfIiON2xBC6CYbpAOamRUl4iKS3OFG3ULtgtmokC4ppQ7X2yr6GdrpfOWIi32bHl/iX9fjW/ZO/zga4un0YRBSwCBfEtTqSKgjwDe3zFcGPtxyXFKBOqRjmp2c5mNB1VYnmq8JLXSgTne4o=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdE336EabuJxSEHUSo4bExE1f467ZthrLg
Date: Tue, 14 Jul 2026 21:25:46 +0000
Message-ID:
 <OS9P286MB7222D458C3248E908695F2DB82F92@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-6-taka@valinux.co.jp>
In-Reply-To: <20260714104445.919830-6-taka@valinux.co.jp>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TY4P286MB6353:EE_
x-ms-office365-filtering-correlation-id: 1db3f518-7b83-4c64-de72-08dee1ee781f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 Cpzr5KlN/71FEoOoe7ymj2QyAw0YXVXa2tCSV5ayW8hfOYX8DT2euW3suwjLAoVgXdu0TbH7oJnYiSXgaIeLn+ZOpqvV6viV4+4rcrTPHHMvCpiOl06N180rYSWcXro+WyCUzPZvCeYi5MGjdqLM6ibP1T564z1I0i/c9/VkPwcQqkacTZD1ckbyBt5QTZ8ZQ+G3SMTEY7XdklBxHtLRvaD2v+HlpMf0Qf5Dn5A00FyTM6IcRNNMm0j3JAPJ5eZn58nCHr331nug2n4aqcuGAX6AU+YiB3Rm3XPQxKeEn8tIprIMIbqJjFxsU8GqYJmugj0KSHOOEiaXCLVxy/8T4wIP0eSzx43Bc6WbmbKR3aeytvY9T2445oqhGYaXSdqjMqqhbRUeqH38KVjeMvHefIKAqb0R72pXdbHsHo9XFtDhv9AKs7LZjVQY339hvCIehCa6//krib6SorrzzyD1aRc59vSwRPSlngdjivQi3vocU43q8pVmpZ2GGxlvQr5VPwMfP2P7iQIsYVTO7OT0gDWRm+2L0roW4y59YyeT0MwLGLX8BFQfwDQD64EdJaihxnP2cWh0oPdlmMBxXqk1goBwbVnr71O6ZLH9VcqFQdzSMa0GGnw7+GRLlqcyklQ1wya1h72w0nzBAp1CG2Aib8dK81gvuEemGQr0JpqhEXvohThmktdc84YHEvdnCpH3wfGxFvWRfcjPvWVU2J1bBQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AC/BBReb4WeBoTFBzJDtXVxhEIiaxwi3nTuC92jR8RBtQvZhIcZDbQ9L83?=
 =?iso-8859-1?Q?+AacA29o+rDBgFfFJOZhmFtpHyyZ+YFSAhDJmoE6zQr0zIwkGsrN5YeDhc?=
 =?iso-8859-1?Q?3FcSjbnogBqtqxmyV+k3xh9x1lFNPTod3Ran9znXC2cl0RLG2guiZiWVbm?=
 =?iso-8859-1?Q?3cm6LzWvovBasAxzTOBGz3Ts2iXXas1AGr/1ka2u9D+BaSFa6g3QpRwTtw?=
 =?iso-8859-1?Q?MqjM10FzWAQZ0iCkTxyqt7Q7vyT+WC3mWSOqyrMU+5ra0FCvfGwcZ+1FbY?=
 =?iso-8859-1?Q?IxV9bMdSMC6aD2mtzmUWrSv4XLXarf0U7dYEnEQfMiLQxzTlsY/Fa1iJHb?=
 =?iso-8859-1?Q?Nbf1aBrImixQLgLKVN0H/zkpGJIjTF2x22Kij2vBhS573DK1Rr9YRQ0Wh1?=
 =?iso-8859-1?Q?VSxaMRylgdCPi0d43+ayhDb2XATGeigPXwptQrOCoSqZmpd6t5os4C0WOS?=
 =?iso-8859-1?Q?xRIwbfQOdAumKncYX5Rq7Oh8vAfLnv7+N76CzijVPw3bbJfFqTmJngcEmM?=
 =?iso-8859-1?Q?id29lS9TXQq4CoswJ0lSK2bp5A3xRpJYz1FB8Gnsw3lkO0zO643yzjs2QP?=
 =?iso-8859-1?Q?B1UEL9mcJXqRyAGJcU8chNw5v+RkWcREgXtV62e5qHwhjFPL3FUYC2dVlk?=
 =?iso-8859-1?Q?EKOvSpi4gWBJ72yD/3kLddb+VdclDkVAa5txtCnobQbCSmijita+i84lOk?=
 =?iso-8859-1?Q?cPfkeY506xfaxZaXSvbkHcOxKtw6DRwKQyWDROrL+o3i1e6MhC4nAdj7Ih?=
 =?iso-8859-1?Q?PlBh1UWCCcd+Ls3c5v5u046BYiIlPt0GhLq//gR5HaL31kPlVwS/3IC+Rw?=
 =?iso-8859-1?Q?PGdfpIZDRzE0BHtJxoRXSpVq5SfCps8ddOttcvriL1oOtE7l7yqiVX7Fr0?=
 =?iso-8859-1?Q?a5GXDbLskfSGJSjv1AiSUY30zkV3+cD+BopTOZOpjxs/QIWCiWGPQrKGxF?=
 =?iso-8859-1?Q?+ZghgpipXuFZ25imHnrFRrCWMLY0X2nrbWr2EZ7jAZjTSwVPtTZYWY97sX?=
 =?iso-8859-1?Q?fEjXdjb+lKqJgCKDQzjpMIkvbo6cpUDpHRJR+hum2dQsdztis6341VqMYt?=
 =?iso-8859-1?Q?f+71QXC16iZNGwiEj6Hr9VgMBpTzDCFp0KChH5dV1J4J/B9CNRTOcjKMjz?=
 =?iso-8859-1?Q?a9YzmKtuiPc20KtY4pWaNUvnV7ylus55+AX7iaBJkdMTdXNzFvbyX4+2dg?=
 =?iso-8859-1?Q?F1oxB8FGzYUeYhsZqP1hayY7s3z1P/aP3V7FHMu/jDk7PB5CVBcIEz1hAZ?=
 =?iso-8859-1?Q?YQgWqZUh1PIZgsn2cugRTXxlQ2SO9h9+cAOn1X+a9O1nie+/dpH0ZB+YwG?=
 =?iso-8859-1?Q?3ZIVsNl36ngfz6f4qV33WI3lP4wQaesuxZMvfcHQJT2yAE2NCkJeGYtokk?=
 =?iso-8859-1?Q?QKbP1lFOD2w8k1vlSc+AgPfXs0qCivr7fYQZYq6VRtlCdY4RWIA50egbNE?=
 =?iso-8859-1?Q?RG7d1pFAGVnMGh0zMFEf19mMiV09LBhj3pSirnid9cCyjrTYNamiMOcuhk?=
 =?iso-8859-1?Q?x3wlo7dtRHp1WxtDnJSpu+H13eX5WGtNUgeXK+miSWJYhpf+dPIGd7qLB9?=
 =?iso-8859-1?Q?tYrphCjc1vuYIblGcSpj+iY57C0FvtDZydlTw+3zL1xHIoS2WfbwJPDW/M?=
 =?iso-8859-1?Q?q1V9b9ABDpGqHJEw1IX8oqB1Je97R87j8OycHaNqDEQUkbWyI8miRRQ5so?=
 =?iso-8859-1?Q?VPT8Jc81LRqjWKhg9WGv85ecSg9+J9Iw4Ba/mSshJTvpwBF5Pwj5bX0+Xk?=
 =?iso-8859-1?Q?rlIyFZsKUlwwWaQUwk5qZFN0cVyVkbNGoev3xiASbfQw52?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db3f518-7b83-4c64-de72-08dee1ee781f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 21:25:46.6563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMam7ejRwDtFADRjupZLsAGKHIv/svhjW1x6VQ2SSdmDhkteIbkk4oEmPLobrzgndZuebzh+2deF29hlmaNSyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6353
X-purgate-ID: tlsNG-c201ff/1784064352-F46A52A1-3C500CC2/0/0
X-purgate-type: clean
X-purgate-size: 826
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3EA7758FB8

Hello,

> diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
> index 56fcfa4945..e6dea527a6 100644
> --- a/xen/drivers/acpi/topology.c
> +++ b/xen/drivers/acpi/topology.c


>  int __init acpi_init_cpu_topology(void)
>  {
> +    acpi_status status;
> +    struct acpi_table_header *table_header;
> +    const struct acpi_table_pptt *pptt;
> +    unsigned int num_sockets =3D 0;
> +    unsigned int num_clusters =3D 0;
> +    unsigned int num_cores =3D 0;
> +    unsigned int *socket_map =3D xmalloc_array(unsigned int, nr_cpu_ids)=
;
> +    unsigned int *cluster_map =3D xmalloc_array(unsigned int, nr_cpu_ids=
);
> +    unsigned int *core_map =3D xmalloc_array(unsigned int, nr_cpu_ids);

These have to be xzmalloc_array().
I will fix it in v7.

Thank you,
Hirokazu Takahashi.


