Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BD7B52B47
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119615.1464896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcPj-0002BP-Le; Thu, 11 Sep 2025 08:12:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119615.1464896; Thu, 11 Sep 2025 08:12:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcPj-00028h-IG; Thu, 11 Sep 2025 08:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1119615;
 Thu, 11 Sep 2025 08:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcPi-00028b-4N
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:12:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07586ec9-8ee7-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 10:12:17 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBBPR03MB6937.eurprd03.prod.outlook.com (2603:10a6:10:20a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:12:13 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:12:13 +0000
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
X-Inumbo-ID: 07586ec9-8ee7-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlgT2S7DKXfvgsYHxvmdH86OrSpmiqr28ADLVC6fWuwTK0+rZ4kmnLdpdLXvTBxp+cOGsqJuWLTXF9wLEXmp0jF8b9OOii2T+qj258UYgQHhql5U46y5Ul8qGim7I3OHjb27IpyUn8yU9Q4+/daVNxHJnIoaXTJteJww88kBQ4GwSPYbv47rR1jT9F82jpmavRJ/nWNY8juBdANnno6OWZiAmv1mjMoI3G8kc42c+FSZNPAprambIBJKInQmgRZ1mC5+iMKFKc17gQL8gg914JRiV+wSJlJjEnfKoen+0bj22tkPL8YdSEgDmDrBGVs/Dz78jgyXvqUmhUwxCcA7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMls4gkKxWS+SJIDk0QbaAmAryuXbYrLGkm4mbE1DTI=;
 b=wtiKJMnqGzyHCVVO8X53wpF6ztScirqFjbqaG1RupYJKA7i/iSUAwX8L221VfbL1Xmhb3RKVRvgO9IJtgX1qnsSQsKDtW82S8IZZyBMkQV14/QnEDBcrYRKV4wa8uHXiu7ncK9Rx3d0RqSYq9niLiYHGcalQPN4ynmil4r0Ti3hG7HLV13PmQK9j7TihfzHkGC9XLL5By3qOKEX4wRdk5WxO0pfNP4QetYfnFcbQfmZ2mBPdh1o21NRiOahDqrkZcSSh4AtOR/CgJcF0HbpW6VmPRsyW68y9lbSlDSG4JLtcT1OSgvJqNsN2LdH5ta+MWOyn84xrqbcasTyO8TXtnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMls4gkKxWS+SJIDk0QbaAmAryuXbYrLGkm4mbE1DTI=;
 b=lI3Sloaz3Sv8MhKvfa6R3zvORjsPtEW+f0E6FJry0Rb07lJRWeGvaq2gsGLQr08pTziiIm7AKy6mYNOZhR3sGqhXqAstnWeQRjYmDYVUvh/FbriyHrkwlHtI6sWv/U8E5pwXl5JEBuPmPZV8tNXH71R47qF+Bpn8Y6wYQIrSLWhTsPJ5roz0ByV2JjDKM7SRmf2g61dyNBA6IzSirN7ugrY5cJ8XDxndRUEdeMGKC16wpetyIzXlrXRYdTg71CREghX1QPlVvkWbrVtGl1z5fYA4mkVbP4gQW4iPSnzwg8c2ardVW+giv8VTXArnSHsARDZvdvErHaXzNTC07lritQ==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
Thread-Topic: [XEN][PATCH] xen/arm: restrict cpu_up_send_sgi() to arm32
Thread-Index: AQHcIvPHEqUOcNKJLk6tvD5PLd0SYw==
Date: Thu, 11 Sep 2025 08:12:13 +0000
Message-ID: <20250911081213.1323594-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|DBBPR03MB6937:EE_
x-ms-office365-filtering-correlation-id: 43037d70-988f-47fc-55a3-08ddf10aea32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?07VLl/44TfYCphM4x0r9QYPNtAcv4CwIK42qk7EyN/tK1vZ9sKtL28z6/h?=
 =?iso-8859-1?Q?R8RdcInj9LlkGzDquH3cjZucog72It30JwfYSRoK9WzV9+M///VflMylk/?=
 =?iso-8859-1?Q?gY0YVlm8BJJQs9f8fmK9+C+Idc1kT9IPYPjoaMnaQRWx9emedssm9wOUJ6?=
 =?iso-8859-1?Q?OdXqEu6OT3f+w4x/kESY7sVGRsfKx6VTZuUPgFFl0lXnJMwT7a2aKbgsFp?=
 =?iso-8859-1?Q?qrIichnwDTaQKBnXk6GVZXcJNBb3iAmDOc0/1QBZBM084d5g3cVsbs2sje?=
 =?iso-8859-1?Q?lF5cvFLbcb0hAYGNk94bIqwsIYdpimYx8z+5xH8EcACmoqgYRoqpDNRlqc?=
 =?iso-8859-1?Q?YHmkteKhbGTg/b/8IdrcSQ6hJc0Ry68j92E+77C+5mLD79WTpJqO+R+/G3?=
 =?iso-8859-1?Q?ByezC0/X8To3Cj7EQSTOT1Mr1pbImCTTGSttx964p0za6GNCk0FT/YCJ9g?=
 =?iso-8859-1?Q?8k+6TeY98YQFRD19FDiDMs4MKkm/svIgYcdmjKk3fABMgKXGGVbS564OoG?=
 =?iso-8859-1?Q?9uMGytF8a0SGlm3mF9aNv0IrmmVy0YYa3aIDxHEKJg3OVXtfSw4zjTzV6L?=
 =?iso-8859-1?Q?VLot33/cAU8BCnDOc/zjbn6B6/0rsBjHR18zigP7rqT/G9XIm0Ie102tM2?=
 =?iso-8859-1?Q?HTT0Oef4qTfO1lU6avS2Yv7isj8yViabWsurhG4XW9DZhlulL9gExtz3xi?=
 =?iso-8859-1?Q?hwuzkWhbA2G5Z7Yqz1SxcI7WmmaeSH2tGyVS9SZ1Zgta4GoywWuJa/Wy1G?=
 =?iso-8859-1?Q?2XPZjRHZXd2XYC/E9gKHSgwZi4uC6mYDTI0xmJvsW91KN1HO+k7z+lnWgu?=
 =?iso-8859-1?Q?KOBhYb5lIGFXC2GNCieeIthlgD1c2ujIcE+m983TeOho6uszPyANrs9sL7?=
 =?iso-8859-1?Q?NbhmFSOsDjM+bk93cFaM0QnUKlhdA7lk5FVbWOdHWchyaQfoLZib/rsS5w?=
 =?iso-8859-1?Q?g5t0nQdYTjcsyknXPKmUba5lLE7mxf+feVKvQ+278F0PWzikhTqOy+/iKF?=
 =?iso-8859-1?Q?iXBfAsucQVpjk+1uiTP5YJ7g/hqr1k91xN6+LZ/Qfl6r0aXYvhx2apZ5cC?=
 =?iso-8859-1?Q?sc73M5OlQvsnhZ7HdpOIRE7iyRbj0qXSpMHEIH7KlKtnkjIgFfJnFUNSYv?=
 =?iso-8859-1?Q?alO/jNWYEQkXLJclDAE/k3rr/rv8CAm5PFzMgkzhqu3cv4RZyxWWT9N/fv?=
 =?iso-8859-1?Q?WJUM+Kt8/qirBGtN9TQ1b9MfUnSlC+/0PFm3lNLjPv52NiKKctQ51eq7km?=
 =?iso-8859-1?Q?ub+Dv7LUE8RAuBBQN0UtghhUe4seoDpOGTB8EtTKTuIhl5EVyucH7zJ8Vj?=
 =?iso-8859-1?Q?f6IcqsFXOXzxTv7BmJMx3H2nV3tKJ+yatNpTqeA7MoCsu7ODtJq13jUi8s?=
 =?iso-8859-1?Q?5BAE3pmhFBAp1mKxFFRl7HF/342RJt4nCsN8v4un4+k6ygg9Ci0Q616oAb?=
 =?iso-8859-1?Q?+vs0DyAZ29OiczPHZDNbK4I8BudR/Jcf9e9Fidrp1lDRHVMPgN7p9Fs2qA?=
 =?iso-8859-1?Q?7IHLSqI3PSU5jB3c/JZ7RZ9YjKhyDaHAgmMj1a2mwpllOs4Xw8fitbB8sZ?=
 =?iso-8859-1?Q?uhhpTBQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ENOmY0X87n1oMa6m/oG/2g8RwmRtP/cVOB+nsCQvJiNHvEnche9xTtuR8N?=
 =?iso-8859-1?Q?osOSIS5+Y8Ukkj+ZSWmlKti3Vexe7VYOYmnby3P8ds5Efn5hI1WAJjayjW?=
 =?iso-8859-1?Q?SIYye4+iau6qeF7Q4a6aBhsSBsytHeJF/igRLLNnugqU3Ijw85+uBldknd?=
 =?iso-8859-1?Q?cMwQun9KpPQcchKKPjFe2EoCo9Q/nCtK4YDe4EXkLlPOFcfZkcduRDxGyx?=
 =?iso-8859-1?Q?2zy2ClEfkmta7Nl/hAmzGKfvgyIjBArku1cjVPHi4l/TIltjscYaqlQvSg?=
 =?iso-8859-1?Q?XVztH6SClE50QxsV8ruOCvUMsbY5ubZ7Lm8Wd5W7M4G9AHaketlCjfljxn?=
 =?iso-8859-1?Q?REYuBDM9Up0EdPxSzBUZagKwK+TX8f4VX30BZ636IiqRzUvd8aAZoorx86?=
 =?iso-8859-1?Q?DFQYZMqYWA48P1/UBuk2ZWSd6kr0axgOWKtli7oVvES1BFRdT+MNG23o8K?=
 =?iso-8859-1?Q?9zWLIZFFkCLwpfmpzYK2D3E52jrrXuFHluvjhBnsyem9BravsItc7KSrmR?=
 =?iso-8859-1?Q?8tBnprn4/WN8hskIk03QmZRzp5H/5uq2PpzgE23tMcnQ3as5RLuiBJ/ohA?=
 =?iso-8859-1?Q?5G0FFyebMwUOaC5NmD/obO9RZXcfuRVMjasrnuAfx4sdJi57oTp8EMFWNs?=
 =?iso-8859-1?Q?6hzJmk6QKxjpgqGBkEC0+54mppHgG6iJN/jQ+PgkTd15rqWHL4aalZ4QlP?=
 =?iso-8859-1?Q?6BOULNvMqTCkRO3XQeHGv9Oqw/RUdf4iBfMI2WV3POg4wYkDsCJu1QzRPj?=
 =?iso-8859-1?Q?o7OSnluhnI27hFvk5XrljqOQo3WhnkC32/eKsei95bNr3Iq9Qes7TdKT87?=
 =?iso-8859-1?Q?cndpUlJ/OGsfu9MSD+vkXMFYyUbLBWsfHzBSt0Oag5pB3AWFqWJi6ikNez?=
 =?iso-8859-1?Q?Wsm8TStk00Qp900Ga9PDl2qv9pqNfBL3ie0cV6KnCcqcbl8Yhu2W6uBcDt?=
 =?iso-8859-1?Q?0n9u6eaWyt3AZ+0Mgkmvpu5QnYY+hvH/EHSDsPL8ciRCrRdB6G/Z1P/OKj?=
 =?iso-8859-1?Q?tz1E3T4lNcz8eOa4Dh+El/24bcZ8T92ivZKK2zbenl3nZ1r+/6+yZmX+Wp?=
 =?iso-8859-1?Q?jfvmWZZoV+cpVC9jMpnBs3vVwQkxSyUs3V9hyvswS9vX4mnyoptsHksqwk?=
 =?iso-8859-1?Q?ezG5MVjbQ1Y1/2Bq3dA1+rBwVyQucXARrgAkSACrfEfTrmzaNcOOnR2m4G?=
 =?iso-8859-1?Q?XA1RhShWAauJ45iScsQYQP6tFtoLbKmQlGI9/z5eWiPyrBxDBqUzTsPSmZ?=
 =?iso-8859-1?Q?pr3M/ZkK0XNOH2ZgR2EHhTojo5fKlZSm6ogByyHh0qM7xqXjqcW1/ZLOBS?=
 =?iso-8859-1?Q?d2hxlCzTOyFJfjYjqYnwQhsShcEbq5ZJdD0cc7/oRsJoTSOUXwrKiizQqV?=
 =?iso-8859-1?Q?DHqd6SBue7JWF1/W7BUwAVhgW3VqDxNSlhjVmnd3r8Aonc9S8G4srWEUPG?=
 =?iso-8859-1?Q?NL7dyn86oSW6P4g+RwUCcUzCj4IzjpeXjUmRtH63nLa7mclQeBKeswMEIK?=
 =?iso-8859-1?Q?A3iJctITu0zvj6p0vp0hpTV+Ad/7CVbkCwMCSPAzK6bLTuciLCwdhTz2DJ?=
 =?iso-8859-1?Q?u8nHxUNtI9ta1sugO8c6nAT287XhZYjeXcbmTPWD3FmrEjNzHF11IxtwUC?=
 =?iso-8859-1?Q?GEzWuarIfIpMiudxmYLarlmvIV5bjX7zYxPqPszvca2BbvLmAMmsTryA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43037d70-988f-47fc-55a3-08ddf10aea32
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:12:13.7064
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V6XSNSTl/DOF9ieBuGHy/MN0wnid/bapFmggPZhCGfD6+Cs4u0iXvLP6g8JZ5fOGZEsnhXEPaPJAI9zK+i/BJwDfVoUL5cYMaGkFsISoZ9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6937

From: Grygorii Strashko <grygorii_strashko@epam.com>

Restrict cpu_up_send_sgi() function to arm32 code as it's used by arm32
platforms only and unreachable on arm64 (Misra rule 2.1).

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
Logically cpu_up_send_sgi() should be moved in arm32, but source is
"GPL-2.0-or-later" while possible destination is "GPL-2.0-only", so put it
under ifdef for now.

 xen/arch/arm/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812edb..45f3be323687 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -464,6 +464,7 @@ static void set_smp_up_cpu(unsigned long mpidr)
=20
 }
=20
+#ifdef CONFIG_ARM_32
 int __init cpu_up_send_sgi(int cpu)
 {
     /* We don't know the GIC ID of the CPU until it has woken up, so just
@@ -473,6 +474,7 @@ int __init cpu_up_send_sgi(int cpu)
=20
     return 0;
 }
+#endif
=20
 /* Bring up a remote CPU */
 int __cpu_up(unsigned int cpu)
--=20
2.34.1

