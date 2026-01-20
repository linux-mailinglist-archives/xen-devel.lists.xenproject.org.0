Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P6DOmbIb2mgMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 19:24:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A749677
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 19:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209274.1521342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGOV-0000rZ-DX; Tue, 20 Jan 2026 18:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209274.1521342; Tue, 20 Jan 2026 18:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viGOV-0000oS-AY; Tue, 20 Jan 2026 18:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1209274;
 Tue, 20 Jan 2026 18:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4D5=7Z=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1viGOU-0000oM-42
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 18:23:58 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c3304e0-f62d-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 19:23:52 +0100 (CET)
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 (2603:10a6:20b:6cc::22) by GV1PR03MB10775.eurprd03.prod.outlook.com
 (2603:10a6:150:200::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 18:23:48 +0000
Received: from AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb]) by AM4PR03MB11152.eurprd03.prod.outlook.com
 ([fe80::ef31:b87:b7b4:ddbb%4]) with mapi id 15.20.9520.006; Tue, 20 Jan 2026
 18:23:48 +0000
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
X-Inumbo-ID: 2c3304e0-f62d-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOoSJ9HC/OhTECCzqe3Q5u5fOsymJmCrpUWQLjiBaS+AH9yjXsY5iFYnKOxnVugeXJbxmOIsnGgUGqLCsYr8NW/8awAqUgdT4A4a/hji3WVp/0CgqkcZqmi3TNuQxvS6mFwvFI88JP17ECTMwpZnNYOuP+TdhWV8W6sBQ9EDdybUYBvubGYQP5jfp5QZKQ5nYU8fTUAA/mFk6+nECkk4byOEUsnWTaQUAWrPyRwXDYQQ8ftCj3JYhy41/d2moueQbOCYLT3UL1O8I8Qz4Eo3vpmy279gWjHBnLubwPYGprUcCxnDZnyMkf85uz83Sn4ThyyryvOaVjls9hBQrPa/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbWEWJU/0bw/0f2OVvUtHrkNhgI03KuSe4SeOEOT50w=;
 b=jv3TnyHqqXa4QzUuUN6zYfEFcDkhfeOM+u2CCsGjzRQyZc9tjmk93HTGlaHJFQDWagiVotgJ2aZzNJ+bPvTgILpqb6mSaK64+CN2g12iM3AMWMjbXKZkbrPq/6yGDE/CqnzZNX810IKOMktTmJxumqg6kM+Hk/D4ro4BXYCaidyoF/Xtu1c3SHb9I0dpmSLft2tUvebNAe/xRLCKhBq3NahaYw08tD50t+jyYxPZ2zCl11yxhzCzBHI0UNGqIIBOyGtg+JMTlCc6JO5oxJJh15o+9RDrpIPY9yE6rNzWL5iBm/y6GhL4Xv+T9pXL7hoGaAALnKBTxWuxtg9OvyPI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbWEWJU/0bw/0f2OVvUtHrkNhgI03KuSe4SeOEOT50w=;
 b=aDFAk3cgb4tvFQhgLP4g2j4JUTlE9BhDa55QTT+MwZDLPzrdPlGxB/hbf+xCVgbh77prnKnQAg2ohQ5xYpjhY4+xJyN+tEUveTjywxt4IC+eataIKnimaMDWGNJzUVYyHDFb8VMw6TrR5jXxdgEIOlwBaMvrpDh+YZbYO1bLxvHcgmHVckgjIcutsJtStXLDwX9tk/VDb9qKd93p/wLM2GzAHi8+W79HFZr3wV4lFhwZcq6UsnM7cjnUblGVl9IvMIfBGGbnYlrmXIsycQdjRb85bjUe0RpUbf69uyPkBL07fL4CQhQw3/Xc+2QSwugoRPaEZV/+L1KZlSb35wi+pg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [ImageBuilder][PATCH] uboot-script-gen: Add support for specifying
 domain P2M pool size
Thread-Topic: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 specifying domain P2M pool size
Thread-Index: AQHcijnrd0sgeuOEFUiPnDmCo+f/yg==
Date: Tue, 20 Jan 2026 18:23:48 +0000
Message-ID: <20260120182346.114435-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM4PR03MB11152:EE_|GV1PR03MB10775:EE_
x-ms-office365-filtering-correlation-id: 14d53995-e042-47ab-7fc2-08de58510dd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RdrRH5nYxpTeMLLO0Q81cmFOCRCUQaLG59t3wI8iYlNgkEC41LJNwDxFB9?=
 =?iso-8859-1?Q?txSGjTOoUcJoe7b+wCctp+I+oop26w8x/acivNvwYZjy5+CETztfLFXjkH?=
 =?iso-8859-1?Q?brnQV1espqUgqsHSSTWvinvLgqjRB/ENJhho221ERA3OzZ+hPwC6iaToNb?=
 =?iso-8859-1?Q?r61jk5fVuBF+P9qrce9siuMDPU4KSKNCSSrynGAOLBLid6LBaQg0D32833?=
 =?iso-8859-1?Q?7Z5fbuUVVdaNYoblhCkpNbWrjLR/ZHfdaQXe1PEKHKjibx5wtN+bfGmL38?=
 =?iso-8859-1?Q?zyCmOWQjpARKKsnDGR/VImMrX0t6epwpBVUD0Dd8aHtNFKk1qH/qdOxEOf?=
 =?iso-8859-1?Q?LWIJDmUSt3IpcixtnlSMNF6SGdDLG6NBwbvmq3Jh6opcWiOMoTBC5AgocX?=
 =?iso-8859-1?Q?qIchGhWS7SB5Qmem+qVPaBaS1uZdVWbxITVschjtCQu4NwpwtSOkYN4+4i?=
 =?iso-8859-1?Q?3/fleijwKFVszXdbHJEDvh5piyC95qDAbtY/khsPcxWinfzeIrt4JAwoYZ?=
 =?iso-8859-1?Q?IjWhaaK74SklAwDl67Kc5RxDUkuzsMwvr8mpvjOEGurFU+1UV1KsmbIN/l?=
 =?iso-8859-1?Q?L7FJ3dQC5pTBgUqInf7x2f2vNopxdR4em4i4QARl7LLoNUytmuOvSJqFg8?=
 =?iso-8859-1?Q?4vrBNI/3NDqAdHcGPukT+Xx8RXFX+CT5PkfXd/tnTg5k868gAE+SC9YPfP?=
 =?iso-8859-1?Q?hAGYZquEbqpl/0lS/Mv3yDkjGDm3Pq025x3DlnqkkXM613hGqvzmNot3s6?=
 =?iso-8859-1?Q?dQsaG5tjCs+aODXzmLS4MG0JWYY++lUeCgEe4krX6uoAXe3xFisLhyNGb1?=
 =?iso-8859-1?Q?aBvgLUH8Sflxh7qcshCoZyK9tpUqZ2qtn7Q4yiloSt/H1E1Sz9Src6fZQ9?=
 =?iso-8859-1?Q?ovA4QNYI4EsAJKhXqTgN2UUmUffT2AdWkmnRXMbfvPh7xL1Zoy1MEGfL0K?=
 =?iso-8859-1?Q?ql0gbkdARDynZd+AWUfOztmTttzvsFa+FnOgZN9YWSSkQLLLzvhI8KP5+a?=
 =?iso-8859-1?Q?bS7ja4ONcHpPKe3DmqIOzI7dhDwtelSTLLqA0dr52PVIqgQDOyy3mMtFLE?=
 =?iso-8859-1?Q?/eABGFaAMfNTKM7D/6ETh3zgBn8oEoGwgB76kRNv6myZUtPbCy5s5K33/a?=
 =?iso-8859-1?Q?7J3HQf5KiVW5R4w33Z7cZk9IXuUmt0QSCLBvBzfcv8SZCRQ7m/5tkBuh1H?=
 =?iso-8859-1?Q?XJyPIhfB2O1hXTEwWCr1SboFD1kVGY6n51154KZ4yJ9m+J5/5y+SkrHbSB?=
 =?iso-8859-1?Q?fU1s5oOIezNXHMSGxw8XDe2NsKApX8uAVYJX/rKi2i8G907bFwks7Nyp4A?=
 =?iso-8859-1?Q?igol/Hci8fSuuPt5sV5QWEEdhjdzWDYYVCkfeLSFzsFV2dVAIgMQGHKaX8?=
 =?iso-8859-1?Q?9369FQYnHeO6WqI5rK4xr1Rs5RvBL5Hhutl5eI+5zzpcwySeyXUcq5f0XP?=
 =?iso-8859-1?Q?SlFCuW9ALSoWKZtF41dSUYTVnRxtqnSPgQceXAMJEebv9Nu4zZ0IDKMDqh?=
 =?iso-8859-1?Q?jI1DoR5cwXlMHUVz9Y+OP9CXAdg+aK7jpN25RE/CBLC2JOD831Zd8BP/i6?=
 =?iso-8859-1?Q?6oUUgF8gpu/NAbkyb+rs9c5jIAgYAw8N+wfY/ZlIjje9Uqhgw30jWaI7rN?=
 =?iso-8859-1?Q?ABvJlrjHjIrBGF+Y+FgA8GX5KcMkthLFZPSX9I47vX08wqbHBPuc31wKJ9?=
 =?iso-8859-1?Q?V8gAPMW5HYfsGM+wyd4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR03MB11152.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Kwj9R3sOpxmdAvam29Pe/Qdg4dqgIZ4y0UdFbdT+P240If49DzDR4a1Pmf?=
 =?iso-8859-1?Q?ox0fWdvgZJyp6nS7POnOn96YGeBmAkCGH4gfaHYBx34aPqAKf3VzH0EXz6?=
 =?iso-8859-1?Q?ouA7vhBz1TRl8SSiGCOxI3wiiYxJbBq6CcKwhcZYelydcjFEzu1UFJPnK+?=
 =?iso-8859-1?Q?UOfCIOa7dRqdzxa36B0w/kasx59MqKJX5ukm27VgZ+TPTllUkjcPiZ10BM?=
 =?iso-8859-1?Q?e2QU2RqKfnkSO7WYDem2XNj8mCcSy8rsQmBGq2Ek7+dDnYQ4BKRGfcnUn8?=
 =?iso-8859-1?Q?nbruKx5XZgnnCafmKVi4KUkP3E+1xWz+qkj9I1XEaLWbJP/Rdvp0+bOxwS?=
 =?iso-8859-1?Q?D7IzKb72f84B1hLBxz3/nWXJP32+iXs9U2sfRin58vRcuRhB6JIc8D5nLK?=
 =?iso-8859-1?Q?p18srn9DCQ2XqrZrdu8UV0e3s9hK59fbUU6k50uEl9cU5m1lBoFAGYHYvj?=
 =?iso-8859-1?Q?jtro/1pxUXXtSnxXM0GX0wWWKDcW6qesgj34xUyqvbeBM1G+VbM/BSifOR?=
 =?iso-8859-1?Q?pR6kYYJKbq3jiwp1yNffdng8w+o01rsj+Z+VGRClxzg9PbnxIgV1RnR/3x?=
 =?iso-8859-1?Q?CHH8EuLmkIMPegTO/sCldvrkvYU54MO3qvYOuzf/RbP8Zmmdd52mlmeWb3?=
 =?iso-8859-1?Q?a+Ok5Jh4D76rPfDojCSkS+77GHbW6pB814cIPSZibRbH9qS/Alp1drvEnv?=
 =?iso-8859-1?Q?HqjNnTULrlNMMV3ljxO10e6L63zz8R59w49n4nDvuj1q9GRzmxkWK1acmn?=
 =?iso-8859-1?Q?tlDEx18XCbyAk/tWEH4Ud7PyTIQjI0WRiBcGhGBGkUGH0+uwaRHwd41Zid?=
 =?iso-8859-1?Q?NSMsldFlWaJP1UfgxCo70uYrt+LVBu4TkBykcJfWXeUyQgYfWtoj6E1KqO?=
 =?iso-8859-1?Q?tYHS9RL3q65urpFmzhaV+jRCdR4yI84YhgH7p+QG/TaKaKxm9D9M35u2sG?=
 =?iso-8859-1?Q?0NjjYitAx2yR71lU7QyH4u8FFNhXi84hPKKS9yUXvUNl42tczQapT1Qy+m?=
 =?iso-8859-1?Q?UU0MW/zoH5p1svq3PPD+1UMXjsu4xfL6kC7KF2MF5Cgb6NimUCBOkWxtUA?=
 =?iso-8859-1?Q?8sSI0bUbOfLFKumsAHRMs3UYUnBwYmtKFsdJWCvayl/NU3OWeIoFqMrMBd?=
 =?iso-8859-1?Q?erCm8dLbRTEP0DfCIPbkisKe+eUKR2JhJcJdftDdUaV/qyJDc0cvugkKaq?=
 =?iso-8859-1?Q?wRfjOm8KipePCZJUlnzBgoiq7+XsvepRLEGog3tTTvHC1PYi/l9zAw68sA?=
 =?iso-8859-1?Q?yZDMiCDwCDY7M33CASrN1efimPqh59Ki5SmKhc3sdO8cHIRIgfyeZMKZRN?=
 =?iso-8859-1?Q?O1PMw4xQlK39tUDyqbOqQ3nne9xgJADvzmhS8f5yXkapu881zOmz6d0aID?=
 =?iso-8859-1?Q?BF8INPphC93IuX7KZrau4cQ8KOwx5oscH4ltoBbBi/uxlLRuMwMMHCvwVM?=
 =?iso-8859-1?Q?RCluKmbXCfr09j2T2oYyK1Y2a+kNbo+hL2gpmD7LeDmH59tm0lFmcnuJ9O?=
 =?iso-8859-1?Q?ztwEqVZuuDbss7sIxNa8mEAt/UeIOsTPo/xdG8K3apFmQWcHYmcssDc8Li?=
 =?iso-8859-1?Q?AnjOzlaC5YNIL5xrTf3ZLnBId0RFkm5whjsfKl03z25R2xRizScfiRpcxT?=
 =?iso-8859-1?Q?vQgGztUqBhDz/KxplEM+JmzIKNq9fxpfCi5QoOS7sljxK7pRFyiC9fsaOv?=
 =?iso-8859-1?Q?S/j4KGZcIpwe1CVoBxRa5TtUkqcX4eS1rMrE2uAu1i5nn8nazdh9dseLyz?=
 =?iso-8859-1?Q?sUNQpVi9sbILePgzKgW6N8Pt56GhdlxNLOvAcJboZuB60GFpEhfBshhWuT?=
 =?iso-8859-1?Q?eQOOWv43UvJ86qjYSZ3Rz1XnU1/1xDY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR03MB11152.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d53995-e042-47ab-7fc2-08de58510dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 18:23:48.0584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7BRcf+Iy8aINJkgMrJleYVmZLFHqTTImhUGm28bY+2dDWM9FNGZ5tJhlFYasqxTzUoCBEKkwAI/A1VgTVIep1ed1cYkXe6WhjEeRMFey9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10775
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,readme.md:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:ayankuma@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Oleksandr_Tyshchenko@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 362A749677
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DOMU_P2M_MEM_MB configuration option is used to specify
the amount of megabytes of RAM used for the domain P2M pool.
It allows users to manually define the memory size reserved for
P2M structures in non-hardware domains, overriding the default
value calculated by Xen.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 7 +++++++
 scripts/uboot-script-gen | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/README.md b/README.md
index 983cbbc..c7ae98e 100644
--- a/README.md
+++ b/README.md
@@ -203,6 +203,13 @@ Where:
   NOTE that with this option, user needs to manually set xen,passthrough
   in xen.dtb.
=20
+- DOMU_P2M_MEM_MB[number] is optional 32-bit integer specifying the amount
+  of megabytes of RAM used for the domain P2M pool. If not set, the defaul=
t
+  size is calculated by Xen.
+  Note that the P2M pool is used to allocate pages for P2M structures for
+  non-hardware domains. For the hardware domain, P2M pages are allocated
+  directly from the heap.
+
 - DOMU_MEM[number] is the amount of memory for the VM in MB, default 512MB
=20
 - DOMU_VCPUS[number] is the number of vcpus for the VM, default 1
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index d18ac55..0c86c2d 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -514,6 +514,11 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "passthrough" "str" "enabled"
         fi
=20
+        if test -n "${DOMU_P2M_MEM_MB[$i]}"
+        then
+            dt_set "/chosen/domU$i" "xen,domain-p2m-mem-mb" "int" "${DOMU_=
P2M_MEM_MB[$i]}"
+        fi
+
         if test -n "${DOMU_SHARED_MEM[i]}"
         then
             add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_S=
HARED_MEM[i]}"
--=20
2.34.1

