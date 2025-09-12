Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC58AB5483D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 11:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121713.1465840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0N7-00031Q-9n; Fri, 12 Sep 2025 09:47:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121713.1465840; Fri, 12 Sep 2025 09:47:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux0N7-0002yK-6x; Fri, 12 Sep 2025 09:47:13 +0000
Received: by outflank-mailman (input) for mailman id 1121713;
 Fri, 12 Sep 2025 09:47:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CX/n=3X=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ux0N5-0002wh-B2
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 09:47:11 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71395213-8fbd-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 11:47:06 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU0PR03MB9615.eurprd03.prod.outlook.com (2603:10a6:10:422::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 12 Sep
 2025 09:47:03 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 09:47:03 +0000
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
X-Inumbo-ID: 71395213-8fbd-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNiJRa2VinkPYWdAVUwWUq3XaS+MaBJL641atsfsDxQxwQdf8JM8PYn1HQdYzegFdeX/eAIno/TWOSAYwcwxO8i8ARzQoTIS1XURG/9YLpvp8gY8qYHGxYrk/cpJ0FR7m8uFNwW881ZJLD0dKEAfjURA/ECvdexUOCYDvPpUOhFhHnZBDNMGTrS2hP21ms3WRh9Dk776Dy/nAb1REPxdnKRf+Stlh1Cn/ZkMX0iXO6Z8mwMJ8PKNarFc8JnLJ00oWJpRodXpoS9HMKpLdGspZxrwWDzx+nhziTCQFp/NwocFR0IlQO1pHnURI9KaPFOR5ggVYxXNaku4rFbJ286H/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3cXhSVaQPKt/puKFM1lKoxFGYP+UyaXGv6+MogjbpM=;
 b=V5nf1BgftrDk/j2eEa8pgHvz6B9ZSIoZZrs6uHg2BOg8x6VnHCcyXvYEWcfJTTd4MveMSnxzjixuKuBX9vvNiHIzE3zr8+sGFYcDN6AMX1t2dxTKH2eXT0gw+AXJDZh/Pu+jzt0SyvnXqNayKaRgw94fxI4DmoSKp4jgYIZqgSQhNkL4hPUmzHdFkaP6FFBuIlBXaxrpGiLE7TzEoKJQlE85nS7XCq0AZadRHVQv3YbCcUDnJtBH6LWo4ElajlIwFwfq0/YOdiu0YijR6ftTUX1tFInA+3fUTYA8xrnRgOcde83d3P9bTyxqmAxM9jVXUukgGfhZXcmC9fBBhsSz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c3cXhSVaQPKt/puKFM1lKoxFGYP+UyaXGv6+MogjbpM=;
 b=X2MHmuPkXCw7R09KfilDFrGjpAYpM2jwKZ9rt0GpJnXxKGxIfxo10NNRjjxe697h2EhBmkdO8+uAIHzDQew5xUxw6FvExSWXAK7u4RXoZlkcIN+8HA17oWp4wP/Ru9Xth9xkuVxEdmBVEslhFb4IcxmXICRXeznsM6Zyhloyf0fkaPA5ERcWOQOyUjC48KrhLElhEkP+gb/BhvPVW3cW3RoLUV/0k6TYWBQx2B9Zov1wehAThwrZjn+fYulBwru5Kq8o71+uRHtN1xWFedwkEPH00bupIWlZywXTdLid2gCcLrw21lxrRI1ccvTMsG66srA4PbmrqjsIu0Y0KHNI0g==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [XEN][PATCH] x86: hvm: hypercall: use define instead of const in
 hvm_hypercall()
Thread-Topic: [XEN][PATCH] x86: hvm: hypercall: use define instead of const in
 hvm_hypercall()
Thread-Index: AQHcI8oxX/I/itfE00GCxamYjAZC5A==
Date: Fri, 12 Sep 2025 09:47:03 +0000
Message-ID: <20250912094702.1654772-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DU0PR03MB9615:EE_
x-ms-office365-filtering-correlation-id: f6d2372b-dfff-4d23-bcc8-08ddf1e153e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Sxr2Ntcz8B0O2xpH5HNIuuv07c6oBP48PnejSU/5uKd6SU6PR6rWLrMfaj?=
 =?iso-8859-1?Q?Iv2rbyTLdrpPlIdzEle+YD7QcQO01SxDgLlHAApxfNt2rJ4PypumFJvur6?=
 =?iso-8859-1?Q?+EMFxApGaCPgpqVriZku0QZNPvBrCqnsfJNx9Ukhba4d34OmrOtAxUovSW?=
 =?iso-8859-1?Q?53l9Uq0aFIuFIYEPNE00OU9bJWie4teys8y6wR327uWoza8A5GhOhFIUM6?=
 =?iso-8859-1?Q?40eaQnL3iY60kQGyQTM9LmOS3jjwyRb5FLn4//cqDgyQ/K7xertn6Z3x7e?=
 =?iso-8859-1?Q?DWQi5WOLNKt44ZVx4IquppEItE0OcnI1oEJj/Uw7FmOK9v7veAnspSOhud?=
 =?iso-8859-1?Q?ep9cxrvULCcA3YY0+oTnV1HqmtGKBTxiSACwO00oXKQrOLKtZ3qrUHS2GT?=
 =?iso-8859-1?Q?WvhL6V90/ftyxHgM7hj7E2mkC4aRKLapZAsUV67OpfsDEWHrs8zZ8UH/8R?=
 =?iso-8859-1?Q?Wa5mwIX3THYb41uD4OM6VTNPkSNbQ635JTYzFWtA8s3+jxM60ynadr6Px1?=
 =?iso-8859-1?Q?CzoT7F4bmEPJ1IDQZXOnMlQv6HjmTOrL+LgvT4TnP3/tqzyUYNG0xAgZOy?=
 =?iso-8859-1?Q?1AC5YvNcwfpRB/HFI0G1qF08sA35kXRLDGQJu1/Hrs+dkWw9Y7edrcyqoF?=
 =?iso-8859-1?Q?g3rRF7kN4L5UVUb6ccNQWSYPlJEQRrtxnPl9nX3XTAM8sAGNJDY4kqS7lI?=
 =?iso-8859-1?Q?oBic9fFPrOO11PamO7kL6gMnPKsdbuw83I+sUXOOzfKK+V3sp40XqfHEcH?=
 =?iso-8859-1?Q?/av3waCWVIgjmHS7xAj8ssnIdN1ZFkMxHLRp5dXqBP1G/jpTJHP3IiWmPM?=
 =?iso-8859-1?Q?GkcUuKIpAptSCq1SiBg1umPekdZu6TZ6AwJ50ZN+Y0XvgoRAAKpqfESvr7?=
 =?iso-8859-1?Q?+jLzOAHLm531xtEikQ6sRLv4i5TjmXztPx6x+dsXExq7mgtf7nJz5i/+PA?=
 =?iso-8859-1?Q?9aOMqAQpcIK+tzzom7WhSLJyMeai5ndUgmXwsKFHBMgDvcayhHh+Z7EbDj?=
 =?iso-8859-1?Q?X/9AY0jN0FBV5O2FgkVxruEtZg9FTVCTAb7ksj3DQC8rsS+Nly/dymR8kF?=
 =?iso-8859-1?Q?x/ebYbPWQihaTsFJ1x5nCJQnIPb9zjF/RuSvTWw7RxHquMqkON0KSkmfUt?=
 =?iso-8859-1?Q?S98dO4X6jNv6Cs16EgRxNm/wvnZm/5+W9eVkM5+PLmGZSojr8ZXyQ+Yp9D?=
 =?iso-8859-1?Q?rIF6zSMPe5ZyLsH6e23+TUfCLKv8bpJQSZ8zmeBtAoHMDGE5w9dRgZFsW+?=
 =?iso-8859-1?Q?I2+JhMZPBiwIYuzAqZvU1cjVh57y3L8FZvPuCwNS0wUd4hfUd04LVTIdbW?=
 =?iso-8859-1?Q?wqqUuoajJurc3p6NFjNNG/n6FVdy+iAwTdVn+Gvy8NK5hml514628DnwqY?=
 =?iso-8859-1?Q?gDs/4XddxvBIfs/PUJdwXWldQHahbQgmHM9Q3WUdt52RIlz3BHHqpnH6cD?=
 =?iso-8859-1?Q?jt54nHHKh+4x2p3TevdllQkmVKdPLyEl2jSPX1Av/r84QYs5KJWR1sg54L?=
 =?iso-8859-1?Q?Ph4BGV6Fsw/q+xbclsd9bD/J5rd64OzYPbH6hnpsQ1BCVUi9bVdIlSB0IZ?=
 =?iso-8859-1?Q?Psdjo7o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AL9bCaAn4NXKRxsVFCPYtju+sJAgqiBYjBqZqEgf7XQsIcf8GBuy9be88B?=
 =?iso-8859-1?Q?MsIHAaZKDuU+M/lE22JdE/luWUsCXSAf2pwX3seqoRK9HChFd8W5KsYDJM?=
 =?iso-8859-1?Q?2CFNwdBtLoVGpwJ59BZKGf141tjZcjdPqwlvPZy517TqUEtNa3JObm0Rjt?=
 =?iso-8859-1?Q?ChlAb1dLB2675ZIBwhUDxypnleB6a8SevQimc0oQ/XjG2FScPhqvRhhv6g?=
 =?iso-8859-1?Q?IN2rYgl/z2MbzhI/fIyWSzXynqqcyefaGjTF2rxELUIgnl6mJWg6tS4hCp?=
 =?iso-8859-1?Q?7c9iliaycN6V1/ImXltS7RU3Mym2qCfrTtTUjJ2b7zB+unpbhMf5DfyTJp?=
 =?iso-8859-1?Q?4FTh4Nyapofkbj1sOFqPbvtf2bF99R6rTzDfSHtS6Rca8K2nBw+1+IpI8a?=
 =?iso-8859-1?Q?T+Vwl5i5I0qnPZ7fXC/H7Dtl+hRM02wGJJtMR2Rw5+tOEFgUFmjZBHNMAd?=
 =?iso-8859-1?Q?ZLhvNwK1+qFrUZ+yoigBu7CV/UgZ3WQcMJRuEXn0CBobiHOR1VyIJxumE1?=
 =?iso-8859-1?Q?2DORQvp9wQuorcBfPYp7vti5eEuEkMGpgyQsP0Vx8jWsIeiUz+BnuzlCBr?=
 =?iso-8859-1?Q?tCmD3Iac0oQe9FVh/eYprGqdiLqhwy/N6DHUtUz7jBsx6+ngpHmJI0DHH0?=
 =?iso-8859-1?Q?HB6QPOhdeg46mYCNLZI7TElDNqCaaediso75SlQcgxwUagrXUEH+YY68Vg?=
 =?iso-8859-1?Q?EBZg/pIGZplh3euqsRsf1CmQYGup2VdpnBujA62a7CSmZCkm9jnHRJTCJG?=
 =?iso-8859-1?Q?E05MF2FU+ACL2QU3xbg/Rw4rwp41BsiY+Mqc6mb6dS28u3I3kFH+kaQZ4x?=
 =?iso-8859-1?Q?+m2+YSiT0+wUh3gJqXlzPT102Dr6GIY0kIJ3mR+LE+z6wMOHdWtYIZXGlb?=
 =?iso-8859-1?Q?cdCBDPsTiAv1slr2ufcUhnvRXuAJ6X2dSErg5/WkU9VFuSzD07je+vvUw0?=
 =?iso-8859-1?Q?Rf2JfN+HXtqIOuAEFTr7LdhOe3c6SNIGdETuHW9nZFO+SjnPBR7dVl7a3+?=
 =?iso-8859-1?Q?hldvJokWpJy6mJA8fumGEoMRt+KeVrVNA2ODLhPomnYUzem+mng/2W/BCD?=
 =?iso-8859-1?Q?zTt222Q7XmpxykbYd3Z1FktWBBDuUVVKPFFN7VX8JRvyL9X0+zzxJ/48gs?=
 =?iso-8859-1?Q?2YmyonEtqBRAksDPAnLJkYHCbPuTUqAxRrzCcssRg47RCJmxXcfPKYjGHw?=
 =?iso-8859-1?Q?qWRLJiioZ1e8qsltVCJzXmIehv7PvYr/3g9vNocxLqOy0xS3bRSgy0Zd5o?=
 =?iso-8859-1?Q?BRFZ0DHLFVSN7xN/xrvmzqtprNMeCs9EeD6+iwJ0gXGKWQR9I9hw2n8/f3?=
 =?iso-8859-1?Q?/cCWCmgigGmFUZrBFA1n1zpeCfwbzx8X6Ip70mrL8N52S0afsIhM9FHx9D?=
 =?iso-8859-1?Q?oRVD9GqUb+zypjeB8tZ2GYLoxhBNjkVuYIFpHbk76ErX4dmvdP9dlPu1KJ?=
 =?iso-8859-1?Q?dhyZ3+Mw1MkQif7UFDInnVoHcm84HiQ2ITAhvnlzXhP6kSKjgC9qyj/yX0?=
 =?iso-8859-1?Q?izpW57hYWRfbxNfIbJLbpWnJ4P9heZ5d0nEk9SuYGEM3UVAkV3SPuyez1L?=
 =?iso-8859-1?Q?JicANKFr8Chyug4RdMfBZFBS8cqpV5asFdT6Zgzm/fijL7gDbkdnWJ4UYw?=
 =?iso-8859-1?Q?mDj3rqCBik1ck5b1BWak+OqsqbWMNpsM63yyyFWB5Ud36aY6oIbwdclg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d2372b-dfff-4d23-bcc8-08ddf1e153e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 09:47:03.3344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Z9eAu3LSkc/SsrlOerHvmrjSJO5QfCN03k74S5+C1U0dsWb5tuQNti8Cez1w5P9z5b6F20Mj8LSMSokzoSeUCo4JRozeBuRuhuL9U3Dbkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9615

From: Grygorii Strashko <grygorii_strashko@epam.com>

Use define X86_MODE_64BIT instead of constant in hvm_hypercall() for "mode"
conditional check to improve code readability.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/arch/x86/hvm/hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6f8dfdff4ac6..b254b3e2f7d6 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -155,7 +155,7 @@ int hvm_hypercall(struct cpu_user_regs *regs)
=20
     curr->hcall_preempted =3D false;
=20
-    if ( mode =3D=3D 8 )
+    if ( mode =3D=3D X86_MODE_64BIT )
     {
         HVM_DBG_LOG(DBG_LEVEL_HCALL, "hcall%lu(%lx, %lx, %lx, %lx, %lx)",
                     eax, regs->rdi, regs->rsi, regs->rdx, regs->r10, regs-=
>r8);
--=20
2.34.1

