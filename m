Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C22A350CD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888114.1297555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGD-0005cK-NE; Thu, 13 Feb 2025 22:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888114.1297555; Thu, 13 Feb 2025 22:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGD-0005am-GN; Thu, 13 Feb 2025 22:00:41 +0000
Received: by outflank-mailman (input) for mailman id 888114;
 Thu, 13 Feb 2025 22:00:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tihGB-0004bW-Gi
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:00:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f546559d-ea55-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:00:38 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7069.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 22:00:30 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 22:00:30 +0000
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
X-Inumbo-ID: f546559d-ea55-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOxm1UISlyebw7mHGnGuPTdIBmEOp3GwCDdj2szcNJC6Mzl973BHYCF1q7FEogzSuImSdMpNnUZxQ8JPkK7IS528Rf0iSmbu/HQbDdR63455DOphrMrpQdbVeuFjBVjph8XLaBNScyrqN2dHadTfacBHs+OxZnxsR1Q5/Cot9ZNB+ZiO3dJRRbqakXc2KF39FzWN09RwRlQenkFFc49P6hURbV/2y1zZ5eH/vBIayyS4a1NGUWHFqHUJ/1U/bWoRxgTvoQSssf8zW4H9uPmjI0Qz8Nuw1bSYSsVcOotK6Fj5NY3CTi4Y70M2sReanqnVF618UEjQWgKEDwTQmvraxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC4E0y7GCBB8QCy6nu9FsWtrUcadfH6fs2ftLDFO9gI=;
 b=T/Nvwqb2kihn+ws/DHYgHXz7MpHUGINv/2X1z/Y4xzoKraEzbDP3/WaIWMKZy5pSDcVM9WHT4UqcpZ2dld7KNHEjYPQ1PRhiM5eQV7Ls+il8QZK5AN7or6xYVGH0FaHhiITOLazb/bRclAhVC+0s8QQy7omHLDISN0gwqGA0x9DlzPQO51/HOF8Pzji7Zp9yL50Y1R7VuNXpWUn2gWULjMlFdX+XtlLBf7FF/TOf8nybH+6NFZbIRHhqow9aUMwiUmaeq7//XVVtjY9e12SUIVKLeE19L/em3dXSIHRZcrL/6DWYypJAOU7Wj33yLcR+sriovZQdDds674RH056APw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC4E0y7GCBB8QCy6nu9FsWtrUcadfH6fs2ftLDFO9gI=;
 b=eBD7Xg9AvJA9XbSr9M/5xAv3viSt9DNtbfffZzU7TlJZt1MU4k8DGV+sKXjPqunIj9K/1J3qE0fZDv8W7btOh4r9x5GKojZEmDFNnruvx/05H0fz8LSsP/pvW2vmBrn4CGct49pLY02m96S5LiI38WfR47jDyxf85Ymma+YhjLbHBk1rSlTuHSyVIkb4TpFbKRNnRHqrZrRjJEoSclOeP2z5x46j3Rh7ziohWca1ZETUWAULEubmYGzc/cAetVMwlQCZRRht7rOUOANSDJJ9yNTUlvmupHWE5zgoFPR2cIpc6gd215A4VaIrbQdRiwSabL2FUOIoZnd6sYiy84g8XA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Topic: [PATCH v5 4/4] CHANGELOG.md: Mention stack-protector feature
Thread-Index: AQHbfmKw/yJjvs5bUE6jn7pI8tvp/w==
Date: Thu, 13 Feb 2025 22:00:27 +0000
Message-ID: <20250213220021.2897526-5-volodymyr_babchuk@epam.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7069:EE_
x-ms-office365-filtering-correlation-id: e53effed-0ec6-4a06-0b7b-08dd4c79d4c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MrB8H5qU73Coekmon0tYIzsaAFp81g4PwXFfZgSdEOCrUtzvh7iRDcgerO?=
 =?iso-8859-1?Q?fIIPMYuTwR1vitq8zkbaZNAqQhwto47T1mWdxLqwIrfjSJW1chMgFV0UMi?=
 =?iso-8859-1?Q?pkVOxcflc38+kiMxub+hjGi4INEydj9zdQiPxt0wagGvfNjBEQ2iM0G5g3?=
 =?iso-8859-1?Q?AbC0vn6WVzAPF/c3RjtzL68i/O/jK2mtq3ORarps9Q5EjpdJwvQT+ukzln?=
 =?iso-8859-1?Q?zOiazHlQpYhL3qXAlMm8mtp1ksZe5bVHkKvjkgSmJvpEm5C22XseM0d/lT?=
 =?iso-8859-1?Q?wzVleYKshXLYl/PfoLQ86JtxPHwkxLLWCXXwXPvSCA25rNFmjNgSI/X0ig?=
 =?iso-8859-1?Q?4zVIaNEOZbYkaK9vx8kywXbrPzP2RpNLeLkb0S2xvpYxZTrjn9BEcP5mB5?=
 =?iso-8859-1?Q?Nj1Ll9mwUDXwPM9Dvvk6mm+vICtbkYBoCWvOBA9fh8s1bvkRlOcCX8Okvq?=
 =?iso-8859-1?Q?G8Q9xttUM+LALXVEFQQuhJEW7KWiQ3qE7brCth/RWapZWry+5O4nDxs253?=
 =?iso-8859-1?Q?yQizXeEHhgLzLv29IT0R9CLt0rkGgR6MCWG+xGLFQm65lq5RM//XE/YlaM?=
 =?iso-8859-1?Q?XM/hWaU5BiNTiutnfoLOylLaumbWyOB0uMvNb64jdWxSrp0i//KwsK1efK?=
 =?iso-8859-1?Q?kPyox0+kT31yvJDeNqu4l/vAzKN8rUQ4uTOu+9He5GvKLXnsLwQ7GAVF67?=
 =?iso-8859-1?Q?UXycfSJmwnD8epRW0jrHop2m9tfIuIpeY21/zy6TecJOQKHePAHXom2lPO?=
 =?iso-8859-1?Q?wCibliFLojQO3y6T29VKL/JeHGA6QWEKk1jJ6AH084uFwQHXkB0u/438kw?=
 =?iso-8859-1?Q?x1CgYlBQc6sOC/KK7S6Mq9yWTPOnhxS82kv+J/8C/4o+925ni9Vkg/9IWS?=
 =?iso-8859-1?Q?2G6p6heKQ7Ssw7oYnJUYd8SRpJ3RcqTjQAqYobUQ5aWiT4AHN3czQI67bN?=
 =?iso-8859-1?Q?v6iGrRQ7OX4mGSGfIyLCuMFM2jghGCZpImV2syTkamS0lSzUS5+crz91pm?=
 =?iso-8859-1?Q?1NntUHAVeHHSfIxtiZZd/7EBKIRnxuNPHc9fu5uk8exd75cC62O9CIemKZ?=
 =?iso-8859-1?Q?0Wl4N4ZDu26tQvLLDgbbetVIJL82DNHlO4W5+kgDt1mxoSHvmUNjf7Sbzi?=
 =?iso-8859-1?Q?oLoi3YO1ykdUfuygMhcoWjF69YPZgZiV0iopbaMUufwobFmYMMy7k8KWx0?=
 =?iso-8859-1?Q?29xRjmdUP+c760COZqnjmYadoY2Fy4feJw3WbtoTS5SiAZi+TeeWgzeh48?=
 =?iso-8859-1?Q?zMnzmigX39Y9GFiDPijKrkbxcTvsqa61PG8RTMyGtxW2fNYV/MZQ3kVaNq?=
 =?iso-8859-1?Q?1nHo1zfSTg5iNVqFQaF2s0WpsYJeEmkPcw12v4THBt9RivJSaE7mYyw/iH?=
 =?iso-8859-1?Q?iYaX2QgqE9M2i4Ce6R9JZYbYuaEC8bliNUDkt++zPNqZPT8YmwS/GjAh+c?=
 =?iso-8859-1?Q?Yv5NR87ZRFcbeitK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KfZKP2NEVB8+xsK97JpXV76PsRd5tNmefkpNaCf1KZTU3FEf4WGdiOlHfs?=
 =?iso-8859-1?Q?coRBO3ELIhKjORcFgs87xUfJirdbxsweAJMGhHHZ5A9oH7dmPFO9cdGBAO?=
 =?iso-8859-1?Q?P6jge780GIiX9cBO4NQQPyOFUOo7fEObXz3ynYz54Rc9u72z5r6P9coLTe?=
 =?iso-8859-1?Q?D3crRhITBx37zgjfnEK8dsz+iYuieMA9aB9yE3ARb7bj4qDtN1fj04ehJ6?=
 =?iso-8859-1?Q?ZAtrY723Tgt2iGMYNA0lsY4I2Ds96R6faTQen0Q6bg4boPazV/el1DZ/Nm?=
 =?iso-8859-1?Q?7kBJ74Ta5haud0K1mt3UVmQLQ0yzba3PXIHi/UoCER2/tZTVRQNp19ZJnZ?=
 =?iso-8859-1?Q?ulnlXiv7FXhaIIFE1HAk+A7RxvJnoi1Mb8MKM5JQjoMs1i+Y4rbqTqsxFI?=
 =?iso-8859-1?Q?+pPE8LF6hNksHwsYNey1XIsEvk36jrE6i7aO1rlGjrB5Vlo8QpTht+yvnT?=
 =?iso-8859-1?Q?0d98R7/o5D3DTt45Aa1dm3IIiLAW7r3/ecZdTlBYc/8x1uhpanfbPZPKoa?=
 =?iso-8859-1?Q?5/u/i07gjoDMvpMqvM7NjyxtJ7TULGucBQpxEJVoStAlcd4sQcHdFBSqNP?=
 =?iso-8859-1?Q?FWf/UcduFc++r6ZArlAiYpZkeEboORa5Kd9DPIQ54UVAQkT8aUjfqVEig9?=
 =?iso-8859-1?Q?qAP6ZgexImFjSi9Z85kPbvBsyDbPfgJDgizmtKxD25oaPJxiRSjNuB+Atz?=
 =?iso-8859-1?Q?+Cjj6nPp/QAzeR8XbrTN3S5nQlyrFsxfpqO0SIjZXNwCYA5IijBtLf2xCO?=
 =?iso-8859-1?Q?BUVxRFLFhouLACzoHTJ5YfqijQD2QkP9iB/UE7dP/ic4NulU/PQu7DfLXf?=
 =?iso-8859-1?Q?KcCwcGlZkrOYLoM23dDGUuoS4RsEqlACxdE1ORtG2eqD4GXnuhU6wdhALt?=
 =?iso-8859-1?Q?Nqlh9tLPBMfZ0EmVHCoBEsksHTcjNs3p0IX/lfsxoDvCJmQ0ej1Kh8N2B6?=
 =?iso-8859-1?Q?rPyjyFfSzvmkD9Dg7EtoOoqiITAxZwEueNbxglSZ/Tt8YZ1LEnJXW8MU5X?=
 =?iso-8859-1?Q?kDwZWOp57/wVzd3TObYSI+MjXSeh8/3YhIjj5A6Eo5ki+5r2v/p4GPjztE?=
 =?iso-8859-1?Q?TKXRt5h0H26MSKb1i81YjT8ctWoQz8zRqhxw1WtxCpE30Ee4n60EZs3ppv?=
 =?iso-8859-1?Q?/lOufJrI2GTqCSLh7j5+Q4e+P9YpBQtWVCfNQvJ1yxI2tt3t919ha9NxBq?=
 =?iso-8859-1?Q?LAqo93tGs3410DiIUAbGM6zpjmauIPxsP6CY/0WmaZHG5DLs4oaWJpm+Ag?=
 =?iso-8859-1?Q?FvHxyciJQG9FsOIHynThweIOvo+clZjWxSRftDdar1V1OU86gCwe0Ww2xT?=
 =?iso-8859-1?Q?1iaFItAVviwRPJljriYWIG9brk1T7A/0YLOruaTm/5yMqXxfsfer8JEZQi?=
 =?iso-8859-1?Q?HbpjGh4MfR09/+33helnPvxR0OjguStI0Ik2HUv/sagoZpAHnNROCzcPTE?=
 =?iso-8859-1?Q?xYk6AZExpSRr+gNHWbR1HxX3EmTARgRbY/E0W0uBeALPQ1nvK/xyRJQqbq?=
 =?iso-8859-1?Q?orrfggoMatjICyoNoc3CzpFHVjOr5Joh92f41xSJefTzrqfcX5gmaMu5AC?=
 =?iso-8859-1?Q?iVP5GoQ7Vh85gE9Lcr27P8pPgNfcAA9Cv8eO6ccDrIJAT8vlFTCkngZiPw?=
 =?iso-8859-1?Q?ed35KDYYFZbDs80OcSd3b1jp/j7YsuVGvtjVVpMW3Cy9q4ystMp9y4xw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53effed-0ec6-4a06-0b7b-08dd4c79d4c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:00:27.6231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FU35gp8gIBJg/7KMUE+lrWqD5Elugm13HC/5q3t8Kim+vtw4UygVaHubSQGLN3m0DjpXK6zNV+SUhuVHWqUVq3uJiKgJFHamQRYGJ2RT/m8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7069

Stack protector is meant to be enabled on all architectures, but
currently it is tested (and enabled) only on ARM, so mention it in ARM
section.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 1de1d1eca1..4cac4079f0 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
    - Basic handling for SCMI requests over SMC using Shared Memory, by all=
owing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Ability to enable stack protector
  - On x86:
    - xl suspend/resume subcommands.
    - `wallclock` command line option to select time source.
--=20
2.47.1

