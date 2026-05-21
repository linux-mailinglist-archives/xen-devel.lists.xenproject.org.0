Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGEMDNtoD2qKLAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:19:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890FF5ABB3E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315891.1585537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9qs-00068Q-4P; Thu, 21 May 2026 20:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315891.1585537; Thu, 21 May 2026 20:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ9qs-00066G-1h; Thu, 21 May 2026 20:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1315891;
 Thu, 21 May 2026 20:18:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmytro_prokopchuk1@epam.com>) id 1wQ9qq-00066A-Ew
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:18:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ9qp-0004AJ-Qz
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:18:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0f6854-5cb7-0a2a0a5109dd-0a2a450ad7b4-38
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:18:39 +0200
Received: from [40.107.159.141]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6a0f689f-56b3-0a2a450a0019-286b9f8dccd0-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:18:39 +0200
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com (2603:10a6:20b:3de::17)
 by FRZPR03MB11686.eurprd03.prod.outlook.com (2603:10a6:d10:1cb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 20:18:38 +0000
Received: from AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba]) by AM9PR03MB7526.eurprd03.prod.outlook.com
 ([fe80::904d:5820:80e1:41ba%3]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 20:18:37 +0000
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
 b=GvA71mX+s4y4gopJoSIC6LqBJfuMbTLgdh8oM+1Z+gL3GkmR/nmPlG8mX8HWp3IvgbVXwvHq402yK5miQDqvqAO8KhWXCEWfANjyaCDZM8O3PXPk3SwY53A/x0JpEvzT+tZr0e82JTOCxWh23AxIU+JR1SwhIcNN6ZtXDjWoJPOFs/EumDDnMWPVYm+ewdmkpXH2XtpbBChPdXvJmNjB4b6cGAJIeqd0zEgEm+eaZleakABnT8eye3plc6TBD4V7F4ed/8NwxS/lYhaS8YeTMOMA/Mq2aCvh5FD/3MTzqaZP6LpnNGNhVAC9LIvQxH0U50DNrX1LSR9n7nl6f55dPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfmyFn6PmUG0aFO2tfoAng6JltGb0x4H5SvYYBHyxQQ=;
 b=WxXWRvLPjUEFMwqLmGUU43knGFr8K74w80KKmh+i3SEmKCa3WZNQtvKlFnfK7gTFBu9W6Avsc55kgqismRiE3fQ1jF3nmRuRwoHMe/Xw2vL5NL4x4qdrSI6AVRJPFjBVAdK6cF+KZvhqBsVwNPHAePvTQfs4YGxnLsa+iNqmpCws6J79t9V3mTUL6/mBXAoN8R0T0fQJ5b//Xpnuz9l77n/2Mpe6dfw5AJ6n2x77/OTcDaYNAByiCE4pHpRWq9Z8rPX4d8xBRIG9RqjFY9MYamTM4SqZdvV7p5MI26lk2BK08eEiW+9Ci3dVYbF6joiE0oz0l/uc7i7THwrNG8pXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfmyFn6PmUG0aFO2tfoAng6JltGb0x4H5SvYYBHyxQQ=;
 b=lr3uTVUcm7i1FqE9rkdHs186IwiSCqELMvS67fNkrFZXi02SAHBUHFCQOx5wPXPzdALufBzKghQWWsejs3fUouHqGfj0Xiqv8Ue2e2vIu5TLpDtl8LAw4ayker3DY71ZECbSzdGAi9lp0a7ceTRl2QE7HGJaY7aKBq1DxdzTVjisZZlxYb4P/LGdbwP2l7+T1uhqlc7izqb7Uudw6TUCw1Plh193CDTxGeKApq2jwMbfbdzdXc5SK9qOtd9GWzU3AXX4Gsiqoyyb8xCkrXmbCd8hoolE3E/UK4GdYPaeVwObzcvD3uC/06YiRCn6iqBFavFpJJKeGyZIDT7WI+ZYpQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Topic: [PATCH] xen/decompress: resolve MISRA R5.5 identifier/macro name
 conflicts
Thread-Index: AQHc6V8B/lHbglNK/EOVvgWJnFkvvQ==
Date: Thu, 21 May 2026 20:18:37 +0000
Message-ID:
 <69ef81a2f85b35e6231ae389bf271cad2bbd7dfc.1779394622.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR03MB7526:EE_|FRZPR03MB11686:EE_
x-ms-office365-filtering-correlation-id: f7535493-ee34-46d0-6557-08deb776246c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700021|11063799006|18002099003|56012099003;
x-microsoft-antispam-message-info:
 o1JH+wM8XVwzyCFq7qRUbyPl2u/lkx0hk7trsr4zZrXEmpLvx4Bp2EdxT0m+ylyyXCIubEGEnKlX7QP9AVOyebRVBDuPzu8zZQHd7g50lzTlBSYKYTybN8vM3BMjMJzo/ZEaAWZzhm1A5NrCHTDx9jsWSUS4tT3iRrESBfWwEty4K8cuKz+9MiAVEvf14WN7PNPpDiRXU4rgciya1avzTlV2eLahbnBrwj48ktHfaZm7UaFx4/lOrNcV+uPW8uSHpErkiEp7YDE4dyLf1RocH4W0mqn9+bE5c6xvjr5J1aFocaLK9RG9H0E90Z8pQ2A4QH+zKrkq4SbZrJ8yX99uqtCkESG7Im5PUUNeU9plNPNfC/j8Du9EQR1k3jQ/OiFpxXBNGbsE8HdT/7EkVDR6Fo8oOE72mUNt7gGT6pZKqT67lRqxgOjdL/GP8hayt09cUV6T/Ht3kr8uAJXRlSt7LpYuXT5gA/InRlwrgmanGgPjN6qTejYoAX9+jnKFVgnRHvlOn2geXRS0GI01GNbeOnx8a/mKfRzryLrFJJ2z1ETyye9QsrEDZtIxOjYm/lM4dXsZAe8J6jRYj5jmmoQpiZ2KtLQjFmqdgML1N2+UiQ4PaF+K70aBHfftYq5OPOnrnBpOQG/+rs64FzFMopdNp98eu1OrTduLPW9hp3vq2/zm7bNjgR9FG10P+FQH6e1Q0Qx8g68Ah4mBRQaNgu2x7YNeM5EJ5+Dp1ffkRBKHoh/ZdRB95GEJ7ssQdmqBPa8v
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7526.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700021)(11063799006)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/sRH0ZUkdM55jJZswrwqx9Y6ooAdhhmLr6vEbGkUIrv8MvOzx8ZdrO+IAF?=
 =?iso-8859-1?Q?D6xjxz2owZnZOao6wKA2xrs+Fle1SByNF3Q7/g+tFtk3cdidWyEjvsBMKT?=
 =?iso-8859-1?Q?QSjz9em/eFSMJCqWcQNjHzDve0iOSLLsXKXWHWqFhKn3Yz2NeGv1FijP5x?=
 =?iso-8859-1?Q?tWuhnQsIbM6NCRueu7Z27DWC9VDCBANYEcV8yeGICCjDsKj1AF+95da7RM?=
 =?iso-8859-1?Q?VOHr/kFd0nglLMI5meret8XmJLPijp9ozxAIao59Wy0t17ZlW776isNbpp?=
 =?iso-8859-1?Q?1RP3eKkAG1w4JS4vGUIgz2OtRF1g3Z3v8ks9eJXMPXJRVZkB4faS0LZgEC?=
 =?iso-8859-1?Q?CkgCmCs5IR5ZeiYDErg8P7gOgDC8ZpZsyAUAx04VonhWPMQuNOML2yVGaK?=
 =?iso-8859-1?Q?y5Pcu9Y8VCqHFWSpVwUtw9kye+TSijnaNIQ6NThsZnZAYCtezcdxwz/xeH?=
 =?iso-8859-1?Q?CDFX08dxoRgIixSEW/hDxz5CaEESqz0Eb0qtq1DX+lfhFmFCyL4h4StBcc?=
 =?iso-8859-1?Q?sXfNLrflYSkj5ougD+CBcxaI8vqnXSHHxfpHizBIDHAdL1qfxC8CA9FY96?=
 =?iso-8859-1?Q?/aYqKpPzhVhzacgmWWtu6RRKftpOxRs7qUCiX9xgjuH4TGmaYN9wehGjpD?=
 =?iso-8859-1?Q?jX52F4JLMOsKvCrPjYxFARL0+b6NVMvK0XFgyuNocOMwtKPb3dBkTpTl+y?=
 =?iso-8859-1?Q?q3Y27XHpdCp6DI0Zrs3LeC+VeH1d/cr+32gld+0smRqc+aErtAehNg4P58?=
 =?iso-8859-1?Q?P7/33q8P7JdAy9ISjzbEa25FYcI8nREawE5JZc27W2iimWrETSjanCqMhO?=
 =?iso-8859-1?Q?iwLiLBYDt22mGZF2KyBCNqC942ptcp613ULKudPXT4AB2pSMyx3MtcYICO?=
 =?iso-8859-1?Q?WqOwYccnbOQ50gd2tydcPzN34vyvw1w6q4qL+wLDHamrGI8nGMFbrLTRpp?=
 =?iso-8859-1?Q?zAlZAaLlkiFJXoh9aE44yCmBfz5oVWZt4b2qfSWrYOo7Hcpv66CIlJF/iT?=
 =?iso-8859-1?Q?4MNqldTbdG7ubk6pSWPiTk3nj0FF0MS4sk4pfITzruzsoTF5YsCa5NuLPx?=
 =?iso-8859-1?Q?I9QYcdGFXj+X/cK1FKpEAUwDvbJX28Ao8nyiUXZNVvPW4ky0ELEGrWj1oU?=
 =?iso-8859-1?Q?9XBCvhucawrsbHZE5b8AE28NbW8TozG+zjHSIY/c1zracqyz6gQ0bpwdjo?=
 =?iso-8859-1?Q?6Qwo+v7xxcdYSm643LaSFnjZFznpqlLbGAFn+5QpKR1bl5fbtVcJQ/eQAX?=
 =?iso-8859-1?Q?HXhf/xLjVb1ZZ7c++OmBjuEAwqn2POIjrJXPPtrlvmkqP0hPi7qD7qBSGT?=
 =?iso-8859-1?Q?bYPDxOGcO78GUgJn2RQfc0dj2ZBOPhvB92Qb/WQ3F2B3RnVJxg629XXJQm?=
 =?iso-8859-1?Q?VW6QY7WieuBQ7OQHpWxCnaNuZWOd6wL9yaIXTRpg61ImKrhESzAmlpSX8m?=
 =?iso-8859-1?Q?rGUtejgIjpNw9pm49zNx82BdlGuol4y4dl5WHh8qjoxRrfBtd+HD6exjHC?=
 =?iso-8859-1?Q?lxmfEOTmuildo1JVhUcaaM1LeHtjHTPictzm1sJ4e2J+LHZ0yqFgTUqxWg?=
 =?iso-8859-1?Q?6xdHwLPSBafDfHgiWqE2jDw1O2AJp/xwuUpQAOEkygJwriBmzqk1+YYkiw?=
 =?iso-8859-1?Q?tElmvc4lyJH1OhSql0mFnxEFOegSslEi4lbUJcxUdwJlI6SgvgEkL9pEwy?=
 =?iso-8859-1?Q?eyjqPEZRfDDZZzyOAEnkcg0uiOOT1ESpsitfXOf13/oyVdMafzQDofk0be?=
 =?iso-8859-1?Q?OuBslQhpXepwh8sDbJr4+1AO65DdqU3CuU9ImRDelfyR4ooOxq+VGUDfA1?=
 =?iso-8859-1?Q?xCbBigfunGveHGeJSg0C9fnfcqSaAEU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7526.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7535493-ee34-46d0-6557-08deb776246c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 20:18:37.8252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34sOWjYVwCMz8iyJSNhLiKszTXzoT67QwsOF1rrq6Sr+Dt9arpozrILVgX5zHU523BhJUwFY1b6Tmjfl5eg4RWuangKePX3yNtaZWAZT6Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR03MB11686
X-purgate-ID: tlsNG-4011c0/1779394719-70D608B7-34FC9976/0/0
X-purgate-type: clean
X-purgate-size: 1085
X-Spamd-Result: default: False [0.81 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,epam.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dmytro_prokopchuk1@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 890FF5ABB3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert 'malloc' and 'free' macros in 'decompress.h' from object-like
to function-like form.

The object-like macros '#define free xfree' perform unconditional text
replacement, causing conflicts with struct field 'free' in 'page_info'
unions. Function-like macros only match when followed by parentheses,
allowing 'free' to be used both as a macro and as a struct field without
conflicts.

Applying function-like form to both 'malloc' and 'free' ensures consistent
macro style.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 xen/common/decompress.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index 034c833665..df9fb9234f 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -9,8 +9,8 @@
 #include <xen/types.h>
 #include <xen/xmalloc.h>
=20
-#define malloc xmalloc_bytes
-#define free xfree
+#define malloc(a) xmalloc_bytes(a)
+#define free(a) xfree(a)
=20
 #define large_malloc xmalloc_bytes
 #define large_free xfree
--=20
2.43.0

