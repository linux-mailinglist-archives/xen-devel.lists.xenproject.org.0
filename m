Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGnVLn/NgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DAFCEC67
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:14:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218797.1527712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZd-00029H-2H; Mon, 02 Feb 2026 16:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218797.1527712; Mon, 02 Feb 2026 16:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwZc-00025J-M9; Mon, 02 Feb 2026 16:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1218797;
 Mon, 02 Feb 2026 16:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hK3N=AG=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1vmwZb-0000fY-1a
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:14:47 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4889f7fa-0052-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:14:42 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AMBPR03MB11643.eurprd03.prod.outlook.com
 (2603:10a6:20b:731::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 16:14:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 16:14:40 +0000
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
X-Inumbo-ID: 4889f7fa-0052-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q450fKKkg4LSlSJSytyfbtUyZNCuCpzAS3FDSOJQjwX3vtU5qUJasUbho55zCwDeJkqB10zPe6JqDRj9q5dY9E33nJ1J/dhkcQLXP6HeuHXY2pM+hyUPHJY/cuO4w1Q35svkAiCSBLHCjjp2RubGPUyflEzw7C03vr4enF5Cro8vnI4dxEFzLP/bqIFEo+d7ztH7cm2jt7rhVrHY9SPJgSomcn/vLMVnjj6cLWF+7n26XnsUvzyW1Enh0M33ap7GQXy6s8owhYghV8WtoQcya9TRvzTrkk0FC/Om9VhiVu0vgLr4w01AU2g/oIt4pol0uAuVx+mxCL/d2cIc6kMo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrajxwpLkTzUo5qZ0TpducYW59HMKLxEeoenAEYJQaI=;
 b=JKK6VO/tulvUEQ0y6VVjTWSV1Z21Gci4+ZiPI/CDr4YSWQgxBFiRZa/CzLMoU6ZrzXJZgy4hxswI70tFb1PFo5O+wHSnjbdU2Cw5jwTZbuH5n4d2Aroa6Vu8Gzc2Sw3y2EJUejnEjihsDIUBuVP/Q3MwHxb18V1l6Y7E7vpvZCmStTUNin6IiTMl8XZAJGwmGsAuMOuBWq4Do3JlK6QCT5F5TBDFIAht1k8RIROUJ1Z0kDxFZoxGNyO0kGtjygCGwhJhTthtZ32UGqb4ds2JvawuQbozuj6gdImBT8j8IgY9wnswiFbdqEluEdl4EDY8wkunQNd+qj1TA60VMo1lSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrajxwpLkTzUo5qZ0TpducYW59HMKLxEeoenAEYJQaI=;
 b=S7bpXBSla6IQIpe+8Mr9nx3S4H5jdhqK/NsrnPjhc3CYCZo9CRb6CgObiFn3gYQpgZCgAw91i9RUOQYjR/pDUtroN2lRVoJ44ThsU/R80+aIYRoxJwi0msRGjDEySDF27rNv6fMCgksOz59PgIza9ZQ8gXFSPk8oSutL9oXBgaDYmXt+CedVz59Db6E+hvHQhp2ITUpm0OikdVgEIx58zbxM6f06fvkpzfdeMwzPlsqggQECmCf4dXQThKBsJDiiv+TaIQmOr8SDDqwfEXrvkxYxZd6pBNYUtv76bC1yRvSZsZPjBbgTyIs8zDtKcNGtUWaf/ygRDT4EJIfHmjC7Pg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "xakep.amatop@gmail.com" <xakep.amatop@gmail.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [RFC PATCH 07/19] xen/domain: Alloc enough pages for VCPU struct
Thread-Topic: [RFC PATCH 07/19] xen/domain: Alloc enough pages for VCPU struct
Thread-Index: AQHclF8IVNXzRYHYv0KDWbwmI64RGA==
Date: Mon, 2 Feb 2026 16:14:39 +0000
Message-ID:
 <a34c89037c29728943d0a15168e7c87e2ed50630.1770046465.git.mykyta_poturai@epam.com>
References: <cover.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1770046465.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AMBPR03MB11643:EE_
x-ms-office365-filtering-correlation-id: e2363123-0f4c-4f69-26b3-08de62762b05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HhRGTW30olY7AahcpalqXteC807MuCBY+FdTcAG6E2O9PQ2gtPZms0DIWZ?=
 =?iso-8859-1?Q?w1+PgfJJuKgliQLrR6wo5N8er479xZIXVGjeVbBQCaZxqG21caI2elHtq6?=
 =?iso-8859-1?Q?QT8cWtUo1gWgugFCfdfvMXmeZOYkOabcyjGzPoc08TumhhGZqTHbW7eMkc?=
 =?iso-8859-1?Q?JEFR2k2gqqgXIfGh3aiPaJ4oQxxDlVUtMGreJrAqqNUrEhC+YnEUUBy9KL?=
 =?iso-8859-1?Q?fNik5glgsh39uMcONECvlQQuzvU4at0YNFRx1AIwTFLuXMM63MWbLB75ih?=
 =?iso-8859-1?Q?zfWQM4IKkg1UeuBIDC9Jmw1yrqHGAezzkfzQnj5VJEcjiAu9LlvMdZYXVD?=
 =?iso-8859-1?Q?oCDvtHsOZYUygsK60MdXQ/FuyruttYhToYgB/f/qEQpdmatREFTZxRQcBX?=
 =?iso-8859-1?Q?YHT89uC+vl4S/zxQQcZC1tynztxq6QslzAtzczdgHRJEjc4xFQRiSuZR1d?=
 =?iso-8859-1?Q?MLbMNV4mxanqc8GJmblXd/g5gYbV3ffwayqbSVJLgRev0/PVVYtfb0UfL+?=
 =?iso-8859-1?Q?dKLx0kRRbLxMxU48+tbGQayRp7yoHxerc6MctbnToX2yw6bT4H47AQfpT/?=
 =?iso-8859-1?Q?Fedrz1jEKGhFRPBhj86Q40udDjXnWjcv9bhzft2tz+Zpi4i1WHSHpOSmlb?=
 =?iso-8859-1?Q?P7JQ4unc+YUgSJaLLSK7ox5KnsqGiel4Ysl91prvUsqKLcrjXNFXXMQN5F?=
 =?iso-8859-1?Q?iX7VgY45PFXK4OAlqHvqu9KkkR7X8FS4fXcIurbcsyS4FItuVIOGekdIBg?=
 =?iso-8859-1?Q?MZi0WFyHxsPhHkfbUB6g1Y0INpYst0r6f7Mh05qx/5I8q7IpcJ3hyHX/IK?=
 =?iso-8859-1?Q?znbqeCkSw8aq2lbfuiSvZkWYMrL2yOd4JiozLUMTmqkCL5NZyyXN7VLaIb?=
 =?iso-8859-1?Q?qGm5+PwdwJXty5s+O1Z9xytYsERszyMeM7Uns3S/KPZvdUJhiE5DDFC7Vx?=
 =?iso-8859-1?Q?I8tNvKRylVpWfHsPu+6r6zrhe4CUOuXNMRWRHafg6wdXKTccuxds/4bctL?=
 =?iso-8859-1?Q?0fo55bobKBl+qBOhiXZYYAKaEWfMHP9QoxkBnoVrOLF21AfrWDRCUpPwQq?=
 =?iso-8859-1?Q?Yz9sY+0kCmOob99vaXMWyGSRH9QGvt6DCnxTRSSPFYMTw26s7+M5BMp6No?=
 =?iso-8859-1?Q?QWqKuMKYTAp2jn2QOwlSnPXlwwkQr5h84arSQJSCOPex+j27o43hJ/YXfQ?=
 =?iso-8859-1?Q?6hZuzgl0WgJx3NP4WIcQTdOy24xIQWtopO87MSi18wURsK1b9lQ68fSIUX?=
 =?iso-8859-1?Q?w1pqglfLa8KwnBkV3EXVavjiG2G39bHrUqbnSOKWs87s8vXI+mt2f81+5V?=
 =?iso-8859-1?Q?Ol6Md+mN1Z+j+CFigdEXDbi9CWpKZP1JUAS9rS9s3OTVM1963FnAy/Qn86?=
 =?iso-8859-1?Q?9kKfYcId/+n7X7NjRMXG4KvCpwb+FqQlUM1sTKt3YfEYKNDO6J3SKjo98d?=
 =?iso-8859-1?Q?kKx5J5n/1jDe2AkkwFvN9p6JkNh0UJa1xh+bqJNe6haDTjIGwJ9x5qG0Gu?=
 =?iso-8859-1?Q?xWZqlBCEM5obWqeu0CN8vBVSMTb1lEaPjj2Ho6nENqjclPP92Z2YROxl0R?=
 =?iso-8859-1?Q?8YDaOinNjGNf2jdTUJcjB+xRhLao8I18pa4igmVVElzMLaG+DwThirmyi/?=
 =?iso-8859-1?Q?k/cH/EJGRUyJ9FOC2gJnX31dWMd04MA5Mmbdn4x98bYxQns+jQR80DY/Xh?=
 =?iso-8859-1?Q?SOhRSD23ZOkqkk8HxCI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tDp2khFUQNCp/cmexPs8VxIiN1S/bGFDG60Yp96AyDyGMZCTggMkl+9+1u?=
 =?iso-8859-1?Q?kiMpJPEvBsHgOYd+GYSgwxGHC8TgR9SwWu1LeTfek8nhCl5NzYMFXTDK6U?=
 =?iso-8859-1?Q?1zJ52nqOsJ5H4CBaLoRtIApGFPl5vXj7vVS+xhPotgt6fZyp7ORCeWSfIL?=
 =?iso-8859-1?Q?ekSnXS1xiM24ktf4awBzFIqApVXdpLf4B68GzwNWqb1/X/E7AmiXF+dwa/?=
 =?iso-8859-1?Q?7+LB4lnDkhxAPv13Ge9cFYHeZUikG+GgOuAVRIm/ZQ2GglybCf4zdDl2hp?=
 =?iso-8859-1?Q?Tg5lkJ7pQ9FESXbLR1HD9dx68rq/HlE+YMrUOZCC7ttKOroB8pWO58DCHh?=
 =?iso-8859-1?Q?YX9qi7AkMHqoX2E2VxqQQbKweZTjOze7DAHRlnqRtDaMTtt9SABQnqjKpv?=
 =?iso-8859-1?Q?auD9teJgc8w/GEVyuIhCgkTR4g0Pf+qcu/T5PvGHIFUEMU9sHchzZaPnOY?=
 =?iso-8859-1?Q?9VcfEzU9GSRahgBj5E1d8lHJOqrwXJLnDOZEytJrmBN7AxUTFOh2kWu58o?=
 =?iso-8859-1?Q?QhP8UeJRl+UQletthfklA0fO9Zc+kYt4zsNILYbCwMuChIm2dT7O3B4ePp?=
 =?iso-8859-1?Q?3ucaOYGdWeh6EQC7Ody4mnPpJBs6LDjBnutVWmr0Fv/HRYKMKXnc09suiZ?=
 =?iso-8859-1?Q?fEB7uuZeK7VD4LD+G7ESm0o6euTQQT/jeHbMkmg+1BajkU15+d5iIyIwSV?=
 =?iso-8859-1?Q?6OGNTgsQNieynhx2VWjIrDf+YP5Hlr4F7KEQ/nunEnhC3uHf2PT0gYHVTg?=
 =?iso-8859-1?Q?nYE25BUv4udFVF1TGHdXt455R6HInHoFepO7SbZTa6leih0TBaqyixq66R?=
 =?iso-8859-1?Q?NQNa8gw8raMJi0qLz47p5llNdpJf0vN98PpbnHszsgOkOUTzt52VG9Cx4A?=
 =?iso-8859-1?Q?jmV1CJ9zyJ7XDVmq6Koz18QfC8HpNVenTNSCKT9Sg1bl5J/0FOhx0/0ap+?=
 =?iso-8859-1?Q?l7hP0Bmk/muaAYXUEXyxaZliQMceH6JP/xrcxev5ZR7Y1QoF7lX0mDcP4x?=
 =?iso-8859-1?Q?i3rnRjp3UXusqyEWr/SSa964yRS7eKeyzQRVHh9IZ1r7vt5YmqUOfzZRoE?=
 =?iso-8859-1?Q?bE12/VS8qjGCswaaGqWLKSDZTifU0Qfn4uEbmDmGDkhpqLa32RCvr6p6XR?=
 =?iso-8859-1?Q?vpS9K3G5hSLimxuvc2xnsD4lVntCSmCZBlzjCcadVyxuZENRRx7rzxZU5M?=
 =?iso-8859-1?Q?YJ61MosZBrXa117pmd3kwzGXsRYkmm3Meo3+UqTwzc1KD2KkHAoXwSw8qB?=
 =?iso-8859-1?Q?j7ivutQZ0lwMUCKdriPxIkLynw5DAUMvBj77s4NHy3yjrZbgSvDaX0QoyX?=
 =?iso-8859-1?Q?OHb2phUbU5No1ZVAiz/x2hmWuGaX/4bOhSWY9KDMHLXeZnkV1Hs1RMvcg3?=
 =?iso-8859-1?Q?SapCWBa0zt3D6tFFEtJeMvTwwKyGasNx+ov2GLA4Vz+hYMgqPWB61sJM67?=
 =?iso-8859-1?Q?EXLKYm/yM6s3b10JMYMsEAf4U6TXmOrLY8WP0AhZKGQLSYuoMwMFQWb+OV?=
 =?iso-8859-1?Q?aHLc3jjXAplo3mBOt+NGi2YaSCDb7UrH9usBphvQzi0aRgCqnhiRc3dyXo?=
 =?iso-8859-1?Q?WKxMDaf9/qfS6efJ9FiHW20zaZbRafoHAlv7cZPemAF4AUeGMDh2G8k1e/?=
 =?iso-8859-1?Q?T8KHBGroEyTaq3KVaowoVVcFheDR4JMLSOmJnxt+g2wWGScBIy65MZgRQp?=
 =?iso-8859-1?Q?1zZfN5NeYKjn0O1vIgqH63aU5ID+KKgngA+c4b0gbgLyO1FHRgjvsaiGZA?=
 =?iso-8859-1?Q?ZipFiDXM4SV0sL6rdU2WQ0ZTTmHuyU1PhuaKSQIYQFeACL6MAocUMgakYj?=
 =?iso-8859-1?Q?vptP5a0/iw0pP7IExVJYJiG2m5WtfU0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2363123-0f4c-4f69-26b3-08de62762b05
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 16:14:39.9917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wu0KAP3jH3N2OAa7PO/65z0iRG8jeTglU4fY1NIRD0BleoMcBljWSRwN0t879yB0ZPrD6o4x3v6/VbqHdfaHMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11643
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:xakep.amatop@gmail.com,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:dkim,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67DAFCEC67
X-Rspamd-Action: no action

With introduction of GICv4 the size of struct vcpu can again be more
than one page. Modify struct vcpu allocation to request enough pages
again.

Don't reintroduce the MAX_PAGES_PER_VCPU check.
As per commit b77d774d8274183c2252f5fbc9fa3b3b7022ba06
> It turns out that beyond efficiency, maybe, there is no real technical
> reason this struct has to fit in one page

Since there is no technical reason to limit struct vcpu size to one page,
there also seems to be little reason the fiddle with 1 or 2 page limits.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/common/domain.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 376351b528..c791fb5033 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -342,18 +342,24 @@ static struct vcpu *alloc_vcpu_struct(const struct do=
main *d)
 # define arch_vcpu_struct_memflags(d) ((void)(d), 0)
 #endif
     struct vcpu *v;
+    unsigned int order =3D get_order_from_bytes(sizeof(*v));
=20
-    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
-    v =3D alloc_xenheap_pages(0, arch_vcpu_struct_memflags(d));
+    v =3D alloc_xenheap_pages(order, arch_vcpu_struct_memflags(d));
     if ( v )
-        clear_page(v);
+    {
+        unsigned int i;
+
+        for ( i =3D 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
+            clear_page((void *)v + i * PAGE_SIZE);
+    }
=20
     return v;
 }
=20
 static void free_vcpu_struct(struct vcpu *v)
 {
-    free_xenheap_page(v);
+    unsigned int order =3D get_order_from_bytes(sizeof(*v));
+    free_xenheap_pages(v, order);
 }
=20
 static void vmtrace_free_buffer(struct vcpu *v)
--=20
2.51.2

