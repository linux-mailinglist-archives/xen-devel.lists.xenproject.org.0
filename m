Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D99AF9BC1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 22:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033718.1407045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCD-0007Gi-Jh; Fri, 04 Jul 2025 20:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033718.1407045; Fri, 04 Jul 2025 20:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXnCD-0007FD-GN; Fri, 04 Jul 2025 20:39:45 +0000
Received: by outflank-mailman (input) for mailman id 1033718;
 Fri, 04 Jul 2025 20:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSlO=ZR=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uXnCC-0006X7-EQ
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 20:39:44 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 028f53c0-5917-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 22:39:42 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by AS8PR03MB9414.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 20:39:38 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 20:39:38 +0000
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
X-Inumbo-ID: 028f53c0-5917-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqtahM5i7KK1CkiJv8WLM2efR8zcNb+/7NGN+VhmSJlpgyl2le7jIGefoDuPjJwhok3PvWkBVajOMbQLFyI/f2LQOBWF/SscPLpLS0RJeSp9dluT84ttn1eb4iFgcV7AvxVfW22QtwljqRQfQvmBmoDxCZfk5BttgYpp+KhpQL/fK7tW/yXFfDuR5vEM7vAymqZ4Xy3vsl5ljV5ATDd5vSHqRV/8o16kXAsi//hvD6S2yncGLx3viVbOiuvnpQupXGjd2ga1kOUgG6OsfXgmX/QqfRpWCqtlmRYS6LQsGg4/p44lEPCYYdI+YF5oCwi3qmuuMTgxNdrirRfyXts/fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvriup+5D2WBdsWjxZrf1fWKGFJvH+SHsOGJOGyvEEo=;
 b=rB7/PlNxGLKNZvdhM5ir72BXi7WEdSl6Dv1Y09sbRANBNSzSt5E06aH38cKr2Vg9EoUJD8qPj9U6t0X4QzOHpoThqToSAKMHP5KsG57tZtCyRPHi2srn+p2uxP0BvyRSV6ZKXfeeMIpZxdaQFHTwYYap5F/R2Cnoc8Xw48xYlo7uPro/8/q8l8LEihK1duZ8i7cwUST8QVaZvyHhUKM+TNGshx3+TZ9Cy2q9qxrKSFh/C9D4k9/KgLbGcpO74AoWtKVxZGmJxsejRGq+a3RB1ZlVxjMR0j9Y7XWD9G/9p0F7vD7PufKcbJHOUDPrBlcJ0gSzTYymRjtDhu+7w9Kfgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvriup+5D2WBdsWjxZrf1fWKGFJvH+SHsOGJOGyvEEo=;
 b=GG102NcVgCzuTd+8EZeTCnVXlM6kcbA6fuBNTJPY445ylc5lmII6m7gAbVBdhrIua5OUQPGx47isLXMe3aVmBk7PHA9mtkq5c1mWvmBu7bmZ/f8a/eJ23CcLbr5CRVBssRmFA9lAE0exp3cwo+Y2xubMUT3WB0dgHYm0OLZL/eecqfryR8tK+Iqbsnfq+ydTuLhGPPXfzoy07eyTk66hbYpNZdIrIyOvfzg/Ohr0H6IqASSAcf3xv43sO4rENGUBlbei8qBbdVGhcsX+1YVCXT7opfk+IVs+RzkmfUcb2OQGyLreHyjUHMTaLmWNaigP/hmQdQAm4JNylBugJdyEhA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 3/5] x86/irq: address violation of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH 3/5] x86/irq: address violation of MISRA C Rule 5.5
Thread-Index: AQHb7SPCcQgXyJtRukKOfLrFemIDFA==
Date: Fri, 4 Jul 2025 20:39:38 +0000
Message-ID:
 <0e289fdb9187902d59dce3fc7368facf5eafa2ff.1751659393.git.dmytro_prokopchuk1@epam.com>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|AS8PR03MB9414:EE_
x-ms-office365-filtering-correlation-id: d2607316-0a57-4a73-3920-08ddbb3ae515
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WlshR3prhaTMLp3lRQ+JWP9Ng9pVb7TBgJQsOs0p014oL9M0JeikKswQ0Q?=
 =?iso-8859-1?Q?JRjs8YWIFmlWga9FD+ivwkR0GzKJR1Oo44XISpTZGsRKZ/tXICw00TSzlv?=
 =?iso-8859-1?Q?7bS0NDAGmBy8Q3TC3rt55VfMw676hKl/w8YQ1rNYQhGlCcMREJT4A3x8zM?=
 =?iso-8859-1?Q?Zae3Olpl2nVYBC+OaxGGuhjppBWZnq26laUL3/fgy22a/jYJZFFoN9mzEH?=
 =?iso-8859-1?Q?2nVEpR3dwQbJgm/UOvgbBl6uuoF11DqtmLBxt6A5IHwE0VsjVYI/0FB3jo?=
 =?iso-8859-1?Q?foQKqkx5wmD8fvB0WaoteXbL2HB1yZbqQX0yL5aSYZ2fDb6MeyL54MQxep?=
 =?iso-8859-1?Q?UyT5T9g3KN7+3+AdWy2Bhm0/Alh+wJs6zUpuGN59Ggq90+lDx6VULXHPlN?=
 =?iso-8859-1?Q?DgswWNtKFNxUBqMKhma3O8Lilbsojgd93KU6kg/aRm9ZpYBl8w7vVtIDhc?=
 =?iso-8859-1?Q?mIewACm2VrFMkVxPKaUcCzIsYCYYwM43Q1tMKySWcx9UT4zE9Z+XFFW5M3?=
 =?iso-8859-1?Q?utKhNKGMKROvAmutTW60lWmSsQ4mdcbzceVgHEmjiHM2xlKEGmS+79nCJZ?=
 =?iso-8859-1?Q?JWSHlkYnFCpWyspeXsjLSnSl0AucUrdjU9kD8NuBmuvokD8ekS/euQP7/P?=
 =?iso-8859-1?Q?qI4qACRUPvM5HYAErT68ki9BPqL6xFoZgd8zPjLSQAk3cbAwBois8vRRpU?=
 =?iso-8859-1?Q?P4K7YdKJ027ModrWFCileRLbWpLTwicD46TeC0y4SGUJwDloUVUCwwdK4o?=
 =?iso-8859-1?Q?Espd/AQbAiWxn257Nt3NMx4hIKsEkhVrnnPoE/FxdulNl8XueZezI9G1Vk?=
 =?iso-8859-1?Q?HjMWZ6aeSj2c1d8K83AFjfPwgLvtrgmIuyH1sTUzTC3X/sGAnKbGiOa1Cz?=
 =?iso-8859-1?Q?PV93LLQfnONi1jXu3ZHrKSGUtpqM8t92UbqpJSunTim5MMUPWZ6keQ7+EA?=
 =?iso-8859-1?Q?yhGnwbkw7KLUzPiYRDtIQcdE2K1HYs1dLfglqtJN00eJbzHndJA4qgbsMn?=
 =?iso-8859-1?Q?eHL/8P0gsLUM/aKh3y8j8f4UPxDja+duyGv8bclUp/BGx3xuqlNBbXWDlg?=
 =?iso-8859-1?Q?mnxJit367H+bhJum3Xy+UXhLNA3TYPQ6Tkrrba29m7TWTUNvljmlpfDZUU?=
 =?iso-8859-1?Q?Nm0vwme0tVVOk34w48Ju5uK975haQPpmrwjy01nQ7T5oLcjmfuSmGypuqi?=
 =?iso-8859-1?Q?Pk1cWLuQFoo6+DkYKMPAr+diynhg4BGciqkw01hKQqKFy/1qhCQRmV1wWp?=
 =?iso-8859-1?Q?P9I/hYSksScGT23r/Q80H770JDO2Vqwer8QUJ8N+WSuPsqi0VGlfFFkJSX?=
 =?iso-8859-1?Q?Q2mSxUKNjpOnd5OuzwbrwQsepo6w7ZPJQ7Q8pwhkCGoUYrJeZy6/BDzYIq?=
 =?iso-8859-1?Q?ZCnwJu41kJxnDRgfU4KmcZKB0+n87LFM2FH8Oj1PRMGJe6PRYGOpIXX/ta?=
 =?iso-8859-1?Q?RDU1Yam3rDZx4LyU1GZM6A/TuJqDYSG7BvEV3CI6+VHRCO8TxpBzFPA7m/?=
 =?iso-8859-1?Q?44NkLOaSahcqJ9FsolnMM80Dn8po5vReLECKkpLLJK2g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?d1mUEpT08ovKsVQt9MM0q3np+mE7oUb1tZh61lStlmY/zI7pGbNUczt2+j?=
 =?iso-8859-1?Q?mnVAREsct2XvcnxqbL2XRMvLMiruHn1WNwP21IS8AUnBu7R+RtbXrIqoet?=
 =?iso-8859-1?Q?P5BuM39KMc3yXq/9pW/epYaL1gbIKVQXcthz6rWGbZdyZyluiPZc8pYwzB?=
 =?iso-8859-1?Q?CK+J2k04Xg6B34OTlVGDzggNvwAipcIkdL+LwwwqasETxIHhmhXqKBjt3B?=
 =?iso-8859-1?Q?uJBam01UkcBEhMOdlQkaZx1XUUSs9Mpwf2n5xfN8AR6mt0EyFCQSv3dfx5?=
 =?iso-8859-1?Q?Trq/9NN4mj2snt4lMcLLPaxlspreqe/0P9RDc2CfOOt3OHJLkQ985ykQ1n?=
 =?iso-8859-1?Q?9eFOhIgBQcQ9I8q3LaxkQVD7sDl/3+5vP38QX7E8t4lUQUuL3/b8E1QgkA?=
 =?iso-8859-1?Q?0E8m3NkTgk9VYiK/iF2b1KrmzBJY4jxTxUhFtd0KrGO2i64cHGw3ghktTi?=
 =?iso-8859-1?Q?6UHtr69qFMVB99+4CZ5vjpbN+NDjkGDxmvrY7q0zR5RUlr2DCX8C9plqGL?=
 =?iso-8859-1?Q?tKBgBY/6dmIu2obEbtv+nkJEl+KdiiHdy7IOKpAn5ZQ4PCW7HQs980AsU6?=
 =?iso-8859-1?Q?cUi57/3L6GejdLd7BYs1DO1yNHpQ2WJqHsj+MZvAAEmEse8Td7L2lpbJ+m?=
 =?iso-8859-1?Q?NsXSCTJ8fUfoUYoWw9gjEaL0kdh1jEt0vp4fqfpSuAkUmMC6LL7/xelkO8?=
 =?iso-8859-1?Q?27ywajj2Q52ucEsMm6UBd3xemp9HVc3lVg/HnpIEdTx12r3p5sLPMH9adU?=
 =?iso-8859-1?Q?40degZO2eI7MndY67BmcnosZajPDNDWXWUtwIfLVRKtqXDE8QdnFvPKJnf?=
 =?iso-8859-1?Q?2KTh6nEg9MhFcCNXbyiUcCxSoMMZWk0MEXbV3ffOeFL37s3QaT12xfGUJy?=
 =?iso-8859-1?Q?uwWTtiZgzpUQroU8HWJvAFAyPX2Lhe6bfve7e+2ggAil3FRUmEiNUYJWAJ?=
 =?iso-8859-1?Q?5sbuo78752MAqabh5Az/Mra82G2+WPk4dMNbxdshPz/2gdcAIRHCC5i9BQ?=
 =?iso-8859-1?Q?VJ0akbVkeQ8bEeivmaunY87cK/z/Bbqa+596x32B6zt3s78VZpHgx/s6Qo?=
 =?iso-8859-1?Q?A0dS4zA1+7fQmwkJa0B0dvJrLwd/e6PWNby7garr0QYYmqluyWJwvRmMMY?=
 =?iso-8859-1?Q?u8zrRfL063js0HNLz+l2t9K1SwmcFYumpBnIAv+/CUlgyXc3ksm5ZyS++D?=
 =?iso-8859-1?Q?0ciS7nJK7xEFoH5IqZo4kRWC/K5R6/ZsMO56KCo2pafhYZ4is0Xw+cV29u?=
 =?iso-8859-1?Q?yw/ZYfVYJp/d0UtPrdj8jcOsrP1kHyv+H8gFhSp8zbUiDUFqRro/uQNmAn?=
 =?iso-8859-1?Q?a6iBVgZeFHFXCJ+TAteftUEvh9zM+o3v8I311DWbvmJlwjXKTAAk9JteIG?=
 =?iso-8859-1?Q?/TjCktasGFalh/lkgFnkqohsOYbZhQUT1X28++pt85Z8IeIjKahixfd6WJ?=
 =?iso-8859-1?Q?vWB8dUrzwQnfZj/QEBA1bXy1EkFqN591rteq8qdRowY4HUB2BHH7czTOeg?=
 =?iso-8859-1?Q?X4uw2KWGOsGJfptaUraCNYXtbJnp6Eh3B8ejAHMBGFJhOIZ4icvVCz/i4c?=
 =?iso-8859-1?Q?uX06cYNrOt92dxMvAG4te4r/8vYAi59CVgHKoJxcs3Mp721rD43hYWOM/b?=
 =?iso-8859-1?Q?ZFst1D40O9PwnB7LdowWDETgrpHoisjinLdOXiTTWub8mEruTlCMeFHA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2607316-0a57-4a73-3920-08ddbb3ae515
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 20:39:38.1757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gjMry5OHhA7NmqRB8dsMpPv8gJmLjv5rTdALtr76KIlzXeQ+9N8tiXhzF2ufEB6pSjAnLefkPw9Md06gF5pBc/C3Xb3Cako69XlcIlCPfNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9414

Address a violation of MISRA C:2012 Rule 5.5:
"Identifiers shall be distinct from macro names".

Reports for service MC3A2.R5.5:
xen/include/xen/irq.h: non-compliant function `pirq_cleanup_check(struct pi=
rq*, struct domain*)'
xen/include/xen/irq.h: non-compliant macro `pirq_cleanup_check'

The primary issue stems from the macro and function
having identical names, which is confusing and
non-compliant with common coding standards.

Change the function name by adding two underscores at the end.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/arch/x86/irq.c    | 2 +-
 xen/include/xen/irq.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..d61720aa60 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1383,7 +1383,7 @@ struct pirq *alloc_pirq_struct(struct domain *d)
     return pirq;
 }
=20
-void (pirq_cleanup_check)(struct pirq *pirq, struct domain *d)
+void pirq_cleanup_check__(struct pirq *pirq, struct domain *d)
 {
     /*
      * Check whether all fields have their default values, and delete
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 95034c0d6b..02f686a999 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -183,10 +183,10 @@ extern struct pirq *pirq_get_info(struct domain *d, i=
nt pirq);
 #define pirq_to_evtchn(d, pirq) pirq_field(d, pirq, evtchn, 0)
 #define pirq_masked(d, pirq) pirq_field(d, pirq, masked, 0)
=20
-void pirq_cleanup_check(struct pirq *pirq, struct domain *d);
+void pirq_cleanup_check__(struct pirq *pirq, struct domain *d);
=20
 #define pirq_cleanup_check(pirq, d) \
-    (!(pirq)->evtchn ? pirq_cleanup_check(pirq, d) : (void)0)
+    (!(pirq)->evtchn ? pirq_cleanup_check__(pirq, d) : (void)0)
=20
 extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
--=20
2.43.0

