Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NKKHO59y2mLIQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:55:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AF63658EF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 09:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268553.1557807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TwC-0005hn-5j; Tue, 31 Mar 2026 07:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268553.1557807; Tue, 31 Mar 2026 07:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7TwC-0005fY-2M; Tue, 31 Mar 2026 07:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1268553;
 Tue, 31 Mar 2026 07:54:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Oleksii_Moisieiev@epam.com>) id 1w7TwA-0005fR-0W
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 07:54:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Tw9-000Z8D-Bt
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:54:57 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cb7dce-5cb7-0a2a0a5109dd-0a2a45079ada-18
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:54:57 +0200
Received: from [52.101.66.99]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Oleksii_Moisieiev@epam.com>)
 id 69cb7dd0-fd74-0a2a45070019-34654263a5bd-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 09:54:57 +0200
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com (2603:10a6:10:519::5)
 by DUYPR03MB11873.eurprd03.prod.outlook.com (2603:10a6:10:661::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 07:54:53 +0000
Received: from DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908]) by DU5PR03MB10263.eurprd03.prod.outlook.com
 ([fe80::8c9e:b301:61c0:3908%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 07:54:53 +0000
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
 b=sBy2VgbDohqW7sMd6VULZl699KQ+PMUTxa67A2gSrE5qAIe7MxhY/jdU/grGP1RwPyIzY6g74PAMQjDW9Mc1xT8u6D1WTrPgHQuyExUvW88dYVF/7e3fbO6723pJShDHHDRbgDaVn0g4bIkBYkG9CDv7+noNceyUnjVidp+SXE4Jsl4XKbMuMCKTvuOBoebP07Uok9UokOuGNSSEp8ZnDzR+nqJsCeAfLfY09Tu9vFPHn3YPBIapG5AtIKyAsJr0CNDpXGJVhNhP6E2jWtP6dgjHClglolQP7Ku8ePKqPGFH78opoORww1t5i+JpM/dZS23QpLCY9zu2k909rM3ALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFBEgNcV+FiMSQgiDwvidpNLnWRFRZEGTva0ecCFiMk=;
 b=yh1CyaRTupqFoiiDS9z/Pbj502Ee6Strv1OE/PghzJPPVq2eXqBTdH10+UJGuD0tK+jryM8OvuKRa5SNIq8b0HECIiboU06nvSN3WYtBau18p6WiOg8Ol5AKwMZECpE9fGcJS4pyDm0la4nINBVecm6gujxC+Ha9a7Iebuewg8QLzoL9jHEtUFZbCWhYx08l9R87+sU1KeMMvCDQ6jf2DyjIHr4WgwJc0lrhpeNVQGsuh92h3nkySTVfRl9vlNccIE/I3En4SMNToKisWWZ/YwjJMw/f1X33hmA2nv7HNjQ5rlLHVYXd/m2SVSidy2m2DlabxDV4fCrz9tMbAsLsnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFBEgNcV+FiMSQgiDwvidpNLnWRFRZEGTva0ecCFiMk=;
 b=QWmnjjlseznzSWS0IMY8h2nmjz/s0GDH5ApGbSDIXEIevc/MASk4F+2sHGEDPRJSLN8Z35YKbcfr6WEBNdFt7S3/guRTYOAEzBCYQe3Nv8g9JkkCXmnpD2N8oZcdgblyPPfQVevFEpyDs2HhL3FGk28qFUoWqDdYYDkvtJQFeRTZBZNcNQ1quivKL90IyMFHSEGG/1yKBzEL0JtREp9YUQVvHRmHWsPiKcBHNV4qFeW/t9hZey+mSMNZKGlom8fxY9nbdhXUe+8WmRd0b6Icr82DKANcQAk4SX4V6OPoKyd1LCxglV2tOvMXG7ALADrNQ1uDQDRoU1HcU9T0CSeC5Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
	Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, Oleksii
 Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: [PATCH] xen/sched: rtds: prevent extratime priority_level wraparound
Thread-Topic: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
Thread-Index: AQHcwOOouqGhBaDuRkSxR1FXPcpmPA==
Date: Tue, 31 Mar 2026 07:54:53 +0000
Message-ID:
 <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10263:EE_|DUYPR03MB11873:EE_
x-ms-office365-filtering-correlation-id: 8373d279-2a1c-4c0d-3189-08de8efacb29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003;
x-microsoft-antispam-message-info:
 w4SQoNA7nbfAUoA/KH1SXU9b9VAq1US8Ng2yb9B48jfxxfQ63k439hd+6Bt/i68LM6ewiqj3WEYWXi7qRRNF88AzvDc6rDktez6WjMVWXFR6IFYesIw9tSZeSBTYAzRx0oTdWHui++YWtQvIJEeOFYSI3gUYr1E8nt+9QgEN0tIEiAFqBm39gs2NoK2I/hMcmrFRMuX/SIEvUqTHOovYkwp4gHqTw+3UA2HyXkSP3q1TqPF54PmLq2iVfKcYXmK8M0RoaPx1Roee5rhM1SuFRdl2srINrO2CryN/f6h04/Kta0EU1CA9Rl+NcMoTw2FTetNr+QE5i2S2/C91c9qeqTPiZiu+hDyvyFP7dlxeKQO271LUuwbkWbB4P5E6w5a11R1Tl0+DzAKxMdwLzitufIuv10WKlm1tNHpM20sr2vVJY744Vky6nln7tQC3mpD7tp5caCXLaVyqPmYNNoEnpf8LKc+58IIWrt5MtSsjSGPf0DXwwFSJPJ0j4PjBgK+t+3kZHsJgMHhdg9ORGVpCwYRnyiXSxzUybRywoT8eXjfwwUzq6DSuA2Pie6xDRYf3jf1EFlXL4D47jVNUzs6LyqRJV1AF53f69G3d/GuuQMJc9fAIUmP6Z3cVUrFerEzPjhxCF0lnGvFH/JiAOCSQrn/UX7fo/cc2t78zoz2E2pTiO4wC7mtim71dNHLpe2p33bQqXTGdRHGOzHvrikW0eDKnuoVCkkRsqmu1eQb0V6Of2Qrqmjao9WFfZhS0QkdPMLi6H7H5gFcxiX+EYJkZxFzJGkKUUnWX6EWjAGkEvKo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10263.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GmGEw6+ipF/biz615RY0iWdKrJdxs9lLSLH4TzZhnFCtTokDQ2ZXJhgbzk?=
 =?iso-8859-1?Q?/JDng+rBaz/+Gq4xOca4YtlsgxFw0yRTqj73hbctHvYOy4rdsEn5iylm+e?=
 =?iso-8859-1?Q?iqmSBXaRwQDeU9hTtwR5gmFXnFNeoDs3ZSe6H7p2jJMhplOftzC/xgSA6A?=
 =?iso-8859-1?Q?AmHoK3bVShHl1BEFRChSBnC7/f4CmIzA/jdOfNmdBVwlo05wOVXBb66O22?=
 =?iso-8859-1?Q?i53vOYWO7cusdQpi/wqLMSQyB12NKaf6Z6zLQmXdrsjMl2suV0XFFq17Nj?=
 =?iso-8859-1?Q?uuRlVUPB/jzDmV3kjVkmHJSLVnslW+pNmSZ6AieoARSlWmlN8HxPc5H3F4?=
 =?iso-8859-1?Q?Ag37jhycr/tVfRjvB0rzTXyIls2HeBVM9JbjasRnRtNOnIDiZbOAH7Yzvz?=
 =?iso-8859-1?Q?i4A51EH9z+Zq3Sb79GYPzx+IB8aLPon/LeaaCDPfcKTerVbhqOjiXe/R+N?=
 =?iso-8859-1?Q?ppSRu2DpRE4PkjeZuoMzXuB5Hk1jJDW0/OvAhEgSLZBf2bTOKp0X1YfKOh?=
 =?iso-8859-1?Q?8Br92XSoaxhPXLAov6z7NWEtxJfAp9SZeSEAvUYVgrid9tEo46zR8BkTYb?=
 =?iso-8859-1?Q?ccGHIdCGhGBlbXk346wLzO5ZoIp729mzFFc476srNApVAcoDGcha9wo9ME?=
 =?iso-8859-1?Q?ZrD3MFZwx0EArL+aGSU7jlRuQ2wHP7cmY6s11/m/D3P577Y+AE3Z1OJ2zB?=
 =?iso-8859-1?Q?99bqjO5rVzH/DkbL9du19ybcV1eY9E3GXuSBueC7i3h+S5l7dVGT1D4EZW?=
 =?iso-8859-1?Q?7uDNHaob8CceXnNMWPle/oC/FfLrHXOO3namI5o3oLakI/EVsG42Mw9fjm?=
 =?iso-8859-1?Q?eqsadbMZlfzAri//5rif5feBia+qjulErWqkfkcB+Rgv0uSJHU+ehiZhJV?=
 =?iso-8859-1?Q?sh3qyoQKC175Qi+ZWNvl09BMgPmY9txQL1VJOKLcFMpmcRIvNh5ELIKZJd?=
 =?iso-8859-1?Q?pFjOW2Q8mmOGWhU+uOahDmVzIvv+8QwMXrOdyRBbnsml0b6OUC17clZNCR?=
 =?iso-8859-1?Q?BSDA57MAwW/zJaNYxFrrfN2RX7lLk3az88FObo/xcrBzdKWaBIsrdNGqmO?=
 =?iso-8859-1?Q?/WdrXWyTm9LNEOwIrubhYzc6c+j0sTYa5x2p+gMVACx4Ogm2gxuz4TPI2B?=
 =?iso-8859-1?Q?MMEN9RxdJSVdr9xJM96vT+tLWF3th67BNgm29loYmXXpLBLbq0IXOl8S7y?=
 =?iso-8859-1?Q?tjibojNWVgPKAUbM6GMpD7dd0IrIu04Q8uGFvcusWSocJuU8hDmiAmHJAA?=
 =?iso-8859-1?Q?Y/v2X0qxMAx6FgPflbO7iB02JE6k/CIDy4l9Iwx/cAtIDF9VsP/dOFNXfG?=
 =?iso-8859-1?Q?LqSiywgHBVLFGvF30YXvVWszMSdRFbz+0EX2005qIG/rsxHRbrwgP07bCq?=
 =?iso-8859-1?Q?lxE3YVN+GM9qyiyaQtfCMT22y5U4SwVjWqZiTE/i/rGtzt5wKmnfbbMSLv?=
 =?iso-8859-1?Q?tKwEYR/GJg4JvMSRdq/vheqntPPhdaQc3GnPG/8rM6q5fosQaPv0t9JBji?=
 =?iso-8859-1?Q?q0WkmwppZvMPEVjPmcvzxWgqK43w4T8BBLGTfenf37WjCoas5IprmJMB9H?=
 =?iso-8859-1?Q?yl5oMWMD8bWhgXFMlPMVTPxrpTizuNCUqtcd9ixxQFluDJNTgVaUWB+Gz3?=
 =?iso-8859-1?Q?xvt4xwqnTTLyhnpe+SPZcJmkcQYfzBwkGkv6IjYpS5Wc1lRPE7J1HpXWKa?=
 =?iso-8859-1?Q?X6wmoZ63r4vg02Ds3QOh6DUt/7sz+HHtzIiKv1874Ej44+04Sb2JdzF3ki?=
 =?iso-8859-1?Q?CuXuU1Nar0M7V4r9LeTbDP+eiuUunGf5tUyCe9Mtc7jbVPm5J+l9K7WGF+?=
 =?iso-8859-1?Q?21trzfl2zn6rnQBWTzAIb+Wx7B0VNgE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10263.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8373d279-2a1c-4c0d-3189-08de8efacb29
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 07:54:53.4602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ch7UFithdOItLV3HaedvVLWYPEJRFtBxHEKprDwlLxp66b0L5H0Jwk41gykK9RxDZrg4LKph1ic+evb06qaNKLEoTDMv5+tlmRyydprHTKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR03MB11873
X-purgate-ID: tlsNG-ef75cf/1774943697-4F6A7303-066B712F/0/0
X-purgate-type: clean
X-purgate-size: 1903
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B4AF63658EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In RTDS, burn_budget() increments priority_level for extratime units
whenever cur_budget is exhausted. As priority_level is unsigned and was
unbounded, it could eventually overflow to 0.

A wrapped value of 0 is the highest RTDS priority, so an extratime unit
could unexpectedly regain top priority and preempt units with active
real-time reservations, violating EDF intent.

Fix this by saturating priority_level at RTDS_MAX_PRIORITY_LEVEL instead
of incrementing unconditionally. Budget refill semantics are unchanged.

Normal behavior is unchanged. Once saturated, priority_level remains at
the lowest priority until the next period update resets it.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---

 xen/common/sched/rt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index 7b1f64a779..9c1027c388 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -110,6 +110,12 @@
  */
 #define RTDS_MIN_BUDGET     (MICROSECS(10))
=20
+/*
+ * Maximum extratime demotion level. Saturating at this value avoids
+ * unsigned wraparound back to 0 (highest scheduling priority).
+ */
+#define RTDS_MAX_PRIORITY_LEVEL (~0U)
+
 /*
  * UPDATE_LIMIT_SHIFT: a constant used in rt_update_deadline(). When findi=
ng
  * the next deadline, performing addition could be faster if the differenc=
e
@@ -976,7 +982,9 @@ burn_budget(const struct scheduler *ops, struct rt_unit=
 *svc, s_time_t now)
     {
         if ( has_extratime(svc) )
         {
-            svc->priority_level++;
+            if ( svc->priority_level < RTDS_MAX_PRIORITY_LEVEL )
+                svc->priority_level++;
+
             svc->cur_budget =3D svc->budget;
         }
         else
--=20
2.43.0

base-commit: a7bf8ff218ca05eb3674fdfd2817f6cff471e96a
branch: amoi_rtds_extratime=

