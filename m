Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 228BAB39474
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 08:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097603.1451871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWa1-0001Hs-LO; Thu, 28 Aug 2025 06:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097603.1451871; Thu, 28 Aug 2025 06:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urWa1-0001Ei-Ic; Thu, 28 Aug 2025 06:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1097603;
 Thu, 28 Aug 2025 06:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRvb=3I=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1urWa0-0001Ea-5N
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 06:57:52 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f4da7b8-83dc-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 08:57:49 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AS2PR03MB9837.eurprd03.prod.outlook.com (2603:10a6:20b:60a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Thu, 28 Aug
 2025 06:57:47 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 06:57:47 +0000
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
X-Inumbo-ID: 4f4da7b8-83dc-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtN+WICcO+jVbPCki5tHYxUZairXtjtFskdSThW6UFUF/JZ+Rsup2jgDNUn2iJswWfsw03rccueh6vnieUTy9oO0pPPkS+/8s9KnnAoG5GG3oWFypdsF/ud3MGP6zGIs6ulXSZs6Tzk8Rzn5GWf9vXEd1fyUUVcFYaI1/MI48lhIHPxU0VHDexHRsVkutFedisCajCR+53UU8dNsOEMMOVGJCbZphh46vAlfknNWsytGEKkIL/v2kx4F5xdpszV4TuXIxGwudja/xaMki9b4iZzMZZ6KEIaQyfd9y7y5qHX+cSTqn5SkCStfistBfMBV83z/yZG4tDlzkrGFHDN5Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZsbZ24vS3rG+xfPUBb489470z9KNa3fH6cDTw3lSxc=;
 b=itxa9Um2uoaRo3vyX995vbT7705tSI+AQJ3uejFbygz+j48j+bVjq8FO2kGOpo0F6VI/DMtT6qU6KnYvWD8HxqXAmTfRUgHvfvZE+4RuSL+6tZVLUtTxl9TQf3iaP+hYY2sXGPcfEKGYfch+YdVt2DUUuPnkjMUdSoTZirYENAsFd6MLivtSnLDcomnuoGSBNMLZFgciEaA85PL/LhKFmOcMcvV6RfHCM3XEttYzUHZHFxyCY0AGQ9ktX+jR/bSud15PB7ci6FwFHshHytQm1I3xTlbJFDsloH1cMwKjLWrFAvyzM3iW/dmK+XWgTdcnE8LAbrud9LZQok1F6qms6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZsbZ24vS3rG+xfPUBb489470z9KNa3fH6cDTw3lSxc=;
 b=O+qKiXzMTAgUeqOjHI3j1yG0f14dBzpUmRuhQrWPRb3uLRC4dNnUDicumdHxaNcOio6dvvMwfYjzk4MZq2d7RWRw7jAKnulMcvyRPXjZZ9RsfBH8n3ephGh1/2/Q8uPfBV56K+pv/1r5pQL4alY6d9jznOk4HgStzWuTpPzZ7k2brEoSY9xL9w7TfD/DM3IekduZOAe+pX98X9DkzseMSDJztw6Lhz8IlXZ9A+Du5n+fmDc0oUH9vyXM2gXlMzSWPpRg4rYM24KxCGIS+JiQakUBH4Y4PhFApiDBMX5CvZdccTSscq6I2KsmYrPXjpAhszW0lXAB1w0ilaKocOGj4w==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3] misra: add deviation of Rule 17.7
Thread-Topic: [PATCH v3] misra: add deviation of Rule 17.7
Thread-Index: AQHcF+kPfUt2YGXFDECwb77KUjWXzg==
Date: Thu, 28 Aug 2025 06:57:46 +0000
Message-ID:
 <5e4d56c195119b2aed48db8ee85aa283c024ebdd.1756364138.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AS2PR03MB9837:EE_
x-ms-office365-filtering-correlation-id: efe988ef-71e2-476f-0ed1-08dde6003205
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6sRsR8ejCeAhc87YNyEqLr7UYUWtMhsF+3opMqv7yAwZXYLzvDg5zQfRGZ?=
 =?iso-8859-1?Q?yjlFbnYjXXB0W9ZsNI24vrzcOJo218urEYHl+tIddnHh66Jg4Ukx5iKRGw?=
 =?iso-8859-1?Q?ehstfyL9zqZ7GX/55cgxYROzr8BgXczexMkJR1YOnoFPXSWks/ryeboO2R?=
 =?iso-8859-1?Q?DlhGxE9jfWSM7JX7nG0UY+2ME3QKmfsNkzMu1XRL6hb6v3LJE2/jKftaIx?=
 =?iso-8859-1?Q?DCx+uboWg4I5tw/iMtTvVWjc6OoMwjCo4zut8ZyX/1vkXm52gknBMj7Z3a?=
 =?iso-8859-1?Q?B4kc03HPERRTvfbQQ3RxXRAp+3tJpARwT3BFfGuGDQp6GB6PbaYZSW4D0s?=
 =?iso-8859-1?Q?PLmb9oe2vxh6onIgZN9TA+CjNMvmcAk+Y7L3MF+6N1qopemTgc9d6W7Bhh?=
 =?iso-8859-1?Q?GZO+OvNXkKk3vm6mZG85UXzrW1TsOTTKdiH4K9WDKtqHdDiUXQ+sBZh8on?=
 =?iso-8859-1?Q?mHjnR3cpQR8O9y24ixKEvD6JJgt6M1utLYc9+edXlvpR61qtrPeVDP78jj?=
 =?iso-8859-1?Q?AC7WxyaYvaryp5uZKuXEIszGlXU1/7SywbpXVR4pJAKe2jCNxH5OxPyOBr?=
 =?iso-8859-1?Q?0de2RtCDkRIp7nIxX3+ANkU8xpTW9SD8/HttUFBcBrFYc7zC6qLXqZflVK?=
 =?iso-8859-1?Q?wgba+G4WC9KzAEIJhQxwmZmnuhID+XlYTCQZkRpKcNy5QrbT6Oj5O+SChI?=
 =?iso-8859-1?Q?qlfaZ9HhgGmXxHnF2HKxmVrLmZstz6PLjJ78tYOUKOfRdOLOHm9Qq+jMLe?=
 =?iso-8859-1?Q?HXZkpVbm3DALhOAbfupJ6iHog47Wg8mcvuhT8xcFg/XM/VTCt14Y9N8zxO?=
 =?iso-8859-1?Q?2ZPJz7QXkCme2AH23UC6Y6QszLpWE+jQz3lwusUH3etyW5Pk6UxdoRMrlI?=
 =?iso-8859-1?Q?IbcwkY7GNgGWVQ/+LE29F9UIGEfaC/Q27ViWtVCMFhD37KZMKYy9OhYbEa?=
 =?iso-8859-1?Q?A5MwNNAZbrwzXY2crqTibrKRBDtIZPQKi0Gn+fgSxXrIaTUY7GJp92+rNb?=
 =?iso-8859-1?Q?KIHNbfzJ3LUpxDYln3wuGZ7zkFhtyoPmGFtrfqAOqb3CJk0Po0MuWHKynV?=
 =?iso-8859-1?Q?oR4pblbpzS88aLA7VR+7kUJfkPG8MTAhVHSyT/pcni3PqTyxMyJ3bW9OM6?=
 =?iso-8859-1?Q?9fRw7/MHQOoJG2Y7Bbx/5Ar1q78hPkRUm8+LYw6CgoG/3iXR78gByE/KVk?=
 =?iso-8859-1?Q?/9S0YyrvUMgjzYaoNQ3TsIXaM7Tk8Lk+y1hnrQRc944AS82fXUK4KhgAx7?=
 =?iso-8859-1?Q?Rt1zJRHX+Rl3VOH9Noe0yc4aCQdYm0ElHEg28NQpEd/3YKrOrH/tvCUgTf?=
 =?iso-8859-1?Q?Z7k6qPGUQqTW94N0ihmAhFIExTfr8kAaABYoBQjENmlnJvrz1ZDW0GyVqn?=
 =?iso-8859-1?Q?I70RxVLnUYODSl9wYgBtxAa2h37MJUKqfxP2q6VUuXTiT5Z6oOKI6edIeu?=
 =?iso-8859-1?Q?ItXTrxscOTRw9lel4gt/R4S1ZrhcLN2bINF3F9cvI5uGEtET5YNAg5E2dU?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iDiEPSijQUvmesOW3NM1DDx2Xn+xfdn7+16eLZHhPLM0MrOwz2EV4MNjnP?=
 =?iso-8859-1?Q?nfPbHc1cHEsS4AXGsVbbA8+uZXRrKyu+kTzpUZE8XpPb+46bXv+lt6YWMw?=
 =?iso-8859-1?Q?cSjjz0/gfVjzybq8nDw3NjKRvp3ftC5np1bFyoJ5/j2nj6dc7r59xZHyEH?=
 =?iso-8859-1?Q?zEvJboIoafpmHBjt/qznZXyugrwC4naJ4zECC5ryc6uQKK/Mn1jsI0x0xQ?=
 =?iso-8859-1?Q?BiVug7n2MAvAN/fib4IpWPcEXpFDsRxgyUtLX3YI2M1lVCHK/i/msIrAcm?=
 =?iso-8859-1?Q?6TcPd0NLigiwd30OHiewDtYvclyVH9c3t4n2KSNuZav0VsfiD262p/8oHw?=
 =?iso-8859-1?Q?MBv4oiGj9WixU7aZqNBIMn30c2LLd1YR0k+xb6KcB4ZtbQC3PrApXk2Fay?=
 =?iso-8859-1?Q?vtLPZWlmUaE1EBdkhox2+mCqgT010Q3to63ZesL69CW+EzuST2/9+A4pBt?=
 =?iso-8859-1?Q?Abu9mXGGPXbRWCfVPFq/Rb2Io1DdPUT2EUUzr8XOq+1+7trCEQGFVnoNoU?=
 =?iso-8859-1?Q?gNXrtHoaBz+78i7RGQHGNaddIsAymoYlBX/8HYK8S8JUHQlJYLUSxPBLOC?=
 =?iso-8859-1?Q?m8qo6V1DwdMy/7Abu5gz9RkkE48EKUjTBWiyS97zcefiEqSJkdm6KTiXSE?=
 =?iso-8859-1?Q?17OPCsubNAtrS2f919VtSwH97ZCa8ZK7JT1RqGNUEu5yu1np3BMtlGYoGf?=
 =?iso-8859-1?Q?unmLuHZlXGzUbbuLpMnqr/l+mNAn+CXth5KVUE0WyJMg9bsy2dwc66wNKM?=
 =?iso-8859-1?Q?xiXo2vLL9jD7clUXTTFcaLmcFVD965wvbpr7WWhzcjs43UAxK/znC+6KBS?=
 =?iso-8859-1?Q?PPrmj7gVgLtjkb8O6pWRQQxdOox77/xgxySMUu6LiC6kRSbMc47dP9mOaL?=
 =?iso-8859-1?Q?LYyjfjGW3ZQw53f8FypRVOj74jh7nVll2ZnpjTw79NxW+4LNkFkGfd+G6V?=
 =?iso-8859-1?Q?PHwrYa5XgpK7Eaz64+LrlG5Kj9OOVDQ8DkFMY2Tu8ge0TUHDWWcoNQ9eJS?=
 =?iso-8859-1?Q?s86BAvaiZZgNU7lHpCLhJhBivRMYw06ACllWUL2bn29oxmLM3cvxLC0tS5?=
 =?iso-8859-1?Q?kUlU0AOKEapauqtsr9ls4E1cqU/s+8XW2J1z1+yFZwddzx8+QmI5qCOMoU?=
 =?iso-8859-1?Q?VHwvSR52AevjCCVoHA8pBbYk3ccgK37UNkzD+I8cTP6A0UbDKdxeKuyakg?=
 =?iso-8859-1?Q?+Rqo2QYwdaWmlj7UB6scfWg9ucTOasqGWBs7sM/iLeuiqH7aJB9gR5A8wr?=
 =?iso-8859-1?Q?M1h3tFWrgN6WUmp8dlhNhyga5pmxPqMooeJ286WECOFgPY6mfRV9dTQOS/?=
 =?iso-8859-1?Q?hzUcm4DzabjONHMXWbsQVHfFCGZqpGH4sc74WkY5Uk3vA5Fio+bNF1Y8aC?=
 =?iso-8859-1?Q?gAvrrHf6sioaN7ULp6G80b/eHR0hBCA8DbfWnMQiXvBvAd0GMEhU/IpZSk?=
 =?iso-8859-1?Q?/6t5Huj2hpherxwD7tDoemVZityYxurvKlfTWE84XGfJZO3NRP2Jkr9Uyb?=
 =?iso-8859-1?Q?zM9nVqTEfbYpDwlqQ5e5n1Y6dUgq4XR4BiimMeb6YlyEVzHqy+JSKcRvsV?=
 =?iso-8859-1?Q?+SqqLzL7esD4trc0v/nhdqDYPHEONC2kybS5wfu4ndCS6+tMtHcEnS5ryy?=
 =?iso-8859-1?Q?mYTlBUmL3MYeNb38iCczyEij5V0Czq9jBxDZL37Tky+LjEL/06CJrwxw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe988ef-71e2-476f-0ed1-08dde6003205
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 06:57:46.9811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0IpGfybdlxX2kGu+l76f/pspGmlbHjVwo02T1U5kG8lSnlZkNriADVjbrap1sIj1GLAxl4XODBIUgOpmS9YvnFZt7ZgjmkAzZvKhOQk1mqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9837

MISRA C Rule 17.7 states: "The value returned by a function having
non-void return type shall be used."

The functions 'memcpy()', 'memset()', and 'memmove()' return values
primarily for convenience. The core functionality of these functions
(memory manipulation) remains unaffected, and their return values
are generally non-critical and seldom relied upon. Therefore,
violations of this rule due to these functions are deemed safe.

Update 'deviations.rst' file accordingly. No functional changes.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v3:
- changed the last sentence in wording
- added Nicola's Reviewed-by tag

Link to v2:
https://patchew.org/Xen/812b78119cee801662a31d39b556cb453aa69508.1756192362=
.git.dmytro._5Fprokopchuk1@epam.com/
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33..f410eafad6 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -575,6 +575,13 @@ safe."
 -config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(__builtin_memcpy=
||__builtin_memmove||__builtin_memset||cpumask_check))"}
 -doc_end
=20
+-doc_begin=3D"The functions 'memcpy()', 'memset()', and 'memmove()' return=
 values primarily for convenience.
+The core functionality of these functions (memory manipulation) remains un=
affected, and their return values
+are generally non-critical and seldom relied upon. Therefore, violations o=
f this rule due to these functions
+are deemed safe."
+-config=3DMC3A2.R17.7,calls+=3D{safe, "any()", "decl(name(memcpy||memset||=
memmove))"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 2119066531..8e086d989f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -576,6 +576,14 @@ Deviations related to MISRA C:2012 Rules:
          - __builtin_memset()
          - cpumask_check()
=20
+   * - R17.7
+     - The functions 'memcpy()', 'memset()', and 'memmove()' return values
+       primarily for convenience. The core functionality of these function=
s
+       (memory manipulation) remains unaffected, and their return values a=
re
+       generally non-critical and seldom relied upon. Therefore, violation=
s
+       of this rule due to these functions are deemed safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R18.2
      - Subtractions between pointers where at least one of the operand is =
a
        pointer to a symbol defined by the linker are safe.
--=20
2.43.0

