Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LPZA5OIz2l1xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 11:29:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4786C392CB4
	for <lists+xen-devel@lfdr.de>; Fri, 03 Apr 2026 11:29:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1272732.1560137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8aqE-0002AO-7n; Fri, 03 Apr 2026 09:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1272732.1560137; Fri, 03 Apr 2026 09:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8aqE-00028U-4p; Fri, 03 Apr 2026 09:29:26 +0000
Received: by outflank-mailman (input) for mailman id 1272732;
 Fri, 03 Apr 2026 09:29:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w8aqD-00028O-8p
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 09:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8aqC-008zKY-Ky
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2026 11:29:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cf885e-2eae-0a2a0a5409dd-0a2a4503ed66-16
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 11:29:24 +0200
Received: from [40.107.159.106]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cf8874-02b3-0a2a45030019-286b9f6a060f-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2026 11:29:24 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by AM9PR03MB7236.eurprd03.prod.outlook.com (2603:10a6:20b:260::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 09:29:22 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 09:29:22 +0000
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
 b=Tv52o/E/BWwJiHAyX6/kyAOn3JhU05z2KNfdXrQy+OwOJzXoxgSifUoY2GarTQTKQ4t5aZ8NeRi2vQz8rqi9aaBO7mP4cnbhma9aMNO9GbBy2aTwPpTVw1KQ1x1EJTfPIwfPKTv3ZNEy6giqcNgr/XT7CRXw/+xhjXWAACiQyROSgrdx1vSIpSnFajm36M2lDdIdHzZuN9VPPX6Tx1iIAAfRE2qSYHeqeqK1O0v56EJRdD2FHsgE67yarhjKoaNGVD2MZTFDjRJfRC0tunB0CGo78DbM8jFX8MCRwpIrMNW0BOwSGAcWiJH3Yy24hTyT5Ucu+g2jqUdmMfhWChNLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9e2KZc+muJukT2Hv/BjeYVECVhK83W83VEOsdy6uUk=;
 b=IwePs3tf7Z9u0Wvr7YEcT5KxNaH87e50Wf11TFdzUfq8LDINskgL6QgWYV5zgUOaDrkWuMry2h/R1HWBYONW85UuGDeVmNKrslFls94pX5uuqwn2wcOpxpIyWexJ1ocQ4T6XPfVEkmAKYhzlaZKmT5N4foElT5+PPBE/pPrD47JEvSEqbXyB63jZPMm2Q7L3sZZb6gbGZjmS3HWgQ9v3El1QsVLc9PQplKZcaa/cRksJUrvMSpKyRB7Z9cB3XvLjghKpKWFG23dGqdCtgRsSGrewK2AjxeVi6K0n8fssW1AENCmB6ekSHHmOxQtYLxh9gxZ53+y6t2GypTpFadRx+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9e2KZc+muJukT2Hv/BjeYVECVhK83W83VEOsdy6uUk=;
 b=t7+GPiP/6qH8fjrmxuIOVlnYVxk3tR3dYvon2d5Zyf+eY2iNogeG7rM9f1O+5nf4vskQkeL7Qvk6DKkYkESU6ucLEKTaBLw5AFaUf5vaAi09ZZ2v+2RVOLUhJfouIo+qpzKEE5u8NyNQXcbYPwPCbYrqr01LzNyXnFo3k0AthAvBC2unmyp3mh0wsWAasTlvRLDCXJbKJ1rF9iBy2HM4Z8RB3JdNgAHC3rQE0CHohM3WHNz1ltfLPSiod+RMYlmaaeOyPI8zKkw6NBP5HVe4RFyHge1jUEiNo/UDy3xo0vIDKo1MLqMfzzhiD7NE7cMnywr6BeYwj5tpWbJrp4fa0g==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
Thread-Topic: [PATCH v2] xen/sched: rtds: re-arm repl_timer after timer
 re-initialization
Thread-Index: AQHcw0xaLi1v6OicGUys1RGy4ug5LA==
Date: Fri, 3 Apr 2026 09:29:22 +0000
Message-ID:
 <548ea03cc3c3287b1f5dcd101b3c2990ebc08089.1775208527.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|AM9PR03MB7236:EE_
x-ms-office365-filtering-correlation-id: 256f5695-61d4-4dbc-a40a-08de91637d82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 gb7nMh7cU+F3wvqt2f4rjOWzmKHONTvq8yWv/sKpX6/WOLGsP5oARRcWaoHLHeg7UtwpOWD/HdwbAP8y4pYxl1kjBZe9QyicPZ4GZ2UWf8zZ4NRApORokOdbQPryrsh4xuu30/3F54fDSiH9RvNetnqVYEI3/HKbCUsSabVw13FEQUNiSND8VQ7Jc2bTU0pIcaxxJXb4GvnYYdylR5R4JIBdFay/HNaj7+kYnWknhSTdvLORHZ0sUIdWEoRb18ifoDLHnsLIQKaTVmEtetnd1DRgHK/Y/wzXvwFbyABmZjRCt0A+d6FM/YUy8yOf2MAsWjNEZZHE7a0EUqct7e5QlfSQw6qq/VMYgQqgH1YP9DVQQfHYRsjunr3oyCdoevoHCIZMkeo9wGeZCAbF8uczyBSUrmMcjWAl+0lEapx2/DqdiBL3Rgc4B1CELALfn4ckYKj0xmSAHPSnMcgNbKcwvdiklzJIrv6YVXyxGAdVkBzO6XCjFZMJpXyRxp686C6zbF6BwOF4UEdxvtnWZ/WbC8AxU71kxy6MOgDRvf4CjIWqPbCSOBLBFdLH7AvR3rL8nJgF16exxq98j5mi7YAczz+eNMYbvJQ9PLa4xjhjJvAvQGU090NUOD0a5YOfFKQgs7rftQtqAqhdiS142lTFkImoH7otIkUfWxMy8Ucg+0bEFPsK8YuDhqqpf83T4T9BHZPqE/6Fv6c5l7QlFZ4M+2SbYmfbeVZ3d0dwYf43fBQ0EjgxvBZwU1pmv7EPSXJxu7kXna4dZ2Z2LEy0F8J/V2Ymzxec9tNUCCLe3fPgI5w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1gAWRpxazIaSn9XhjBbHt8CIYzdwyP/sQrQuQX0Y8fTiKIwwZ+bQSLkHb+?=
 =?iso-8859-1?Q?1AdmXJzIfDjLVIZ512R0SvI7yAhaGXjg/q3cGk12AJdv5JinotfdQSixkl?=
 =?iso-8859-1?Q?OfQ5ziwwdLiWLlgjV1+su2kH1t2VDeomsNhBjQMAuUF+A7NB9+7CDjPHrk?=
 =?iso-8859-1?Q?Yh5QsX1f47/w8/8Z0qwqtVB6aQXxFUe8CTfT24aDUcEJnAn0kukTvVUHfE?=
 =?iso-8859-1?Q?tAf78XzQyYc8iEgkCPwyCzCXZYGt0tzlXuARbPLxUgDuK5XKHyIa5Pbu0e?=
 =?iso-8859-1?Q?C/fQdG2W7lvjQ0U/Vj0Tp/XQqPwzPRW/Op5+w3Nq6cveHolLPRlJrfZEKt?=
 =?iso-8859-1?Q?HwdrSYKGLMFP2N6+r43RQ6ievD8ZbALxSBwvIkiiH32Ol5/unAcI/wqaVC?=
 =?iso-8859-1?Q?eeDmIG/u3lItcJAaEqMKLjS3rioF3RdIn+EVqqsaht381IErbZvJNFgQca?=
 =?iso-8859-1?Q?X/xNu+XfLz3U6rA2g1BlDEDEZledLWSC+6suOO7sa0rgBydfYhgcGW6CPJ?=
 =?iso-8859-1?Q?SsuUQS5ued4Jtj3u6P4T5X5dDpF4Ojz/UUze3TnWvUkCKX7oqcdpB2de5q?=
 =?iso-8859-1?Q?Z3UkJPVZAPAcx1TwK7f8UiVvq9sOvr1lxuss/Qe3s4XCWxoj7+jx6fhGpW?=
 =?iso-8859-1?Q?fDghA9uF5MZGEmXWM5jFsqaF6CRhannyCu6CJbII3z8DCbeod8RRy/mXHW?=
 =?iso-8859-1?Q?gJ9SqhL+b1S6K8PbaP5p9PvUCpMYRePp0Y6Mj6/VHaQUqBJ26Qgz3pCIZ6?=
 =?iso-8859-1?Q?n/BPFp9b2c64J5SbWqjp0DHug1fq77vWhBg3SjQkw4A5etX94Z9RWM8z8U?=
 =?iso-8859-1?Q?ZqBR6TMH0EwbSzy2k/4TEn9Ob59LnjUrxdvpCgJT3bQ9UUt0pfcV0P9JuT?=
 =?iso-8859-1?Q?Rr2Ro81msB63OC/d7O1LbGDqdsDgLKm5wZZwOpOZUZ11sWdUzdkXLHfdox?=
 =?iso-8859-1?Q?PyuZRie8RKTK0W6iqJu23AxK0UFAK/C7fB/RJyv0naqXdbt/SLNh4VI1LC?=
 =?iso-8859-1?Q?YiiQ/bceHUDiVue3rxcJp+OkhKL/PMGT+SdtzFuk1mimpkBLejCZlHAN15?=
 =?iso-8859-1?Q?t7CjN3qeCBFYg494hWjMsLOOZXoGR27B8JhYMgLAMvmb96YU9t1jfhfO2I?=
 =?iso-8859-1?Q?zYtwit9TgRHkqZT2sAVgFg2zIv1f6DVC2NZxjDJfEWik/iXwRsJf4hM6ew?=
 =?iso-8859-1?Q?m8sqMqKAb9NKTlhwgVVwgObW0fJkeLgZqWlyB95IcClHWfztPb3k6F3dg6?=
 =?iso-8859-1?Q?Lq1TxtKbQXMrAuh9e6Od3P+jSmRV5WXgxenoLAvlsHeDfUkOVM+Ytbbhmf?=
 =?iso-8859-1?Q?ne/goxI6P4BB6PqljKvRb0dXsxL92vVlZoQahou9qos4cIUqTO/k3Bf+rQ?=
 =?iso-8859-1?Q?9XcoBNqWWv1QeMS/+EL78/+xMMClX5RMLaODguCFybPT/mascRPws0y7S+?=
 =?iso-8859-1?Q?Wx94cVlJ1Cjm5NHOEwcjlGBDwNHna6PO+pmo/QGwZEwC3X7yxuOpfCtAdk?=
 =?iso-8859-1?Q?pSPaFhCa8EM38vXS8yzHaboMdY0MGf3vM+WNyH9GbUuAmbIKEegQLWQ8Os?=
 =?iso-8859-1?Q?Z+q/S4WPgC4AxXeTz9cACSEB5yA1rOnirlX6xltILLeXOYZQFUAuCI4z/b?=
 =?iso-8859-1?Q?fT7TGbxwZKTzuoZzQl7DPD5gdJTcaMy0NeEYjPGe/H9wNDZn9XKQn6Ge7d?=
 =?iso-8859-1?Q?+c15ImzUFlMbMFr3GxkicIkLWV+192OXqdLQVMwrHbplANcP2klD9dHywd?=
 =?iso-8859-1?Q?7NAb3hp/Vzllw1NH/zapsDG09scSulqVErOGly52XiPiEYn4w/mhcYHyGB?=
 =?iso-8859-1?Q?z3598ujcbUxMKilZWjjMQlqGVNhd80U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256f5695-61d4-4dbc-a40a-08de91637d82
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 09:29:22.6610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pJHEKfU//YA4XFzdNJyLnqX4KLMu5UjYwIh/8ozuEpoqGeR+4pVAp1JG1NZwnUEFz5mOn5+cjdnMzR/tS1HU8DIvYztYlianASNtGGFVx9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7236
X-purgate-ID: tlsNG-33051d/1775208564-C9136C9A-C712BD37/0/0
X-purgate-type: clean
X-purgate-size: 1847
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:dkim,epam.com:email,epam.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Oleksii_Moisieiev@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4786C392CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In RTDS, removing the last eligible pCPU can kill repl_timer.
When a pCPU is later re-added, rt_switch_sched() reinitializes the
timer object, but pending entries may already exist in replq.

Without re-arming from replq head, replenishment can remain inactive
until some unrelated event programs the timer again. This may stall
budget replenishment for non-extratime units.

Fix this by re-arming repl_timer in rt_switch_sched() immediately after
init_timer() when replq is non-empty, using the earliest pending
deadline.

This keeps behavior unchanged when replq is empty.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

Changes in v2:
- update commit description, remove unneeded paragraph

 xen/common/sched/rt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..59021e1110 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -741,8 +741,17 @@ rt_switch_sched(struct scheduler *new_ops, unsigned in=
t cpu,
     if ( prv->repl_timer.status =3D=3D TIMER_STATUS_invalid ||
          prv->repl_timer.status =3D=3D TIMER_STATUS_killed )
     {
+        struct list_head *replq =3D rt_replq(new_ops);
+
         init_timer(&prv->repl_timer, repl_timer_handler, (void *)new_ops, =
cpu);
         dprintk(XENLOG_DEBUG, "RTDS: timer initialized on cpu %u\n", cpu);
+
+        /*
+         * When re-adding CPUs after all RTDS CPUs were removed, replq may
+         * already contain pending replenishment events. Re-arm immediatel=
y.
+         */
+        if ( !list_empty(replq) )
+            set_timer(&prv->repl_timer, replq_elem(replq->next)->cur_deadl=
ine);
     }
=20
     sched_idle_unit(cpu)->priv =3D vdata;
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a=

