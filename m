Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA235ABC31C
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 17:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989965.1373969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lh-0006P7-QB; Mon, 19 May 2025 15:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989965.1373969; Mon, 19 May 2025 15:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH2lh-0006JU-IW; Mon, 19 May 2025 15:51:09 +0000
Received: by outflank-mailman (input) for mailman id 989965;
 Mon, 19 May 2025 15:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWXC=YD=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1uH2lf-00055d-Pa
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 15:51:08 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20625.outbound.protection.outlook.com
 [2a01:111:f403:260e::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12aab7cd-34c9-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 17:51:05 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB9023.eurprd03.prod.outlook.com (2603:10a6:20b:5b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 15:50:58 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%4]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 15:50:58 +0000
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
X-Inumbo-ID: 12aab7cd-34c9-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+LixnOzErXoe9vOhFNbjwBMYj0ImXWY/bX8L8BgaHgtiSRhrI45NROOWupKXcofNYmAZYr4kkzauuzn/L86bq2RoAJdyG+FnJ6YDfJj32X3FIAPTWE5QThAn/d5dUH3XBBXcaKFZQXdKZ4EWCE4uRdeoauHVjls6ky4REwDbNn1nsSYrKO9JoHfKptt0Cjvnksk6vzRwL9MnT8wfmrGtqxN+9sIUHseMDyBYGMILKQQf3sxzoL++RRZOWmdjWZeCMHXS4hVn5sr6CQ++TnaO0QiL1auUIOkFvdGqmgzAWl2p/D++p78SMzfPjzwXH2acV5/U4odZr7WG38fEnLJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T95PAVbCzhHKP7RYhZufYK99SRLDzb3IXsU04ArQbxs=;
 b=YMS+rf692s1SjaRHChDcEJ2D3ygiax1GcfxGziDsD//kTJuWKSqRsj57sHEVhBX4Ktr4HShttnEmdIswr5ukeeBXZ2+QwWdWEPyO88F1rVvUD1ms5wzqtS4F6NZrBtQvf+NaZmVVwpahpI6eItqyz0B18zZ4LjtKtXi5o8f+jmHIoYLkw2KrWDsOIzdbvpIrtuzoLi2m7TH01JOGovwIBkwQxLW9mrAD6EA9plKVLlfu1zWSH7Sm22OyCw3JEi5t6dG7XGdCid3A/VsxSbj0AS5pv1QrwYlqdkzvcdlJAvI2UrGjH14VV40/orPBWO13hL8rUyp0ddwFLfQNHEsNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T95PAVbCzhHKP7RYhZufYK99SRLDzb3IXsU04ArQbxs=;
 b=iFLy/SvxwbZr65v5iegU0aRE0KTemVy853sFIpFLRk8xrbuf1L/hFTQKho3utDK73KAcsRc7WqZAc37LOeG3cSLhQ14Ys7T977kORapDsHl+fLNBz/jgozxM4EAAK5CPSaZSGL/vgodoJujClSExP2QMvgprpyfKPzww0uPAVKlRq2B0CUmvB7Qd8KI5LvuhixCxcKBEu/fTfCiCsV0ZhZJMvukjmGzv1sFKS8XoI0LE8V6x6kv+Vh9CsXN0eGHkuVUdLPQ7huXXcMB2cjGzqSXXDsKonksonVf7wImp/EPEPXYZhpi4AR7Gkgq9KEn7BuNeasu//M2H652Xc8ZYuQ==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Oleksii Moisieiev
	<Oleksii_Moisieiev@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
Thread-Topic: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Thread-Index: AQHbyNXPHUV4T01ZEEC9Uxm0LaLKHQ==
Date: Mon, 19 May 2025 15:50:57 +0000
Message-ID:
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1747669845.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB9023:EE_
x-ms-office365-filtering-correlation-id: f2c928e0-13ca-48f0-5537-08dd96ecf2d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d7lB4ovUmioDg3SccrXN98XKvMbJKTQcG3LC0ncbZIXKkQ6n7NMm1JcoaU?=
 =?iso-8859-1?Q?lwRX10fUCy0UxOWXEg2b/iHMEUYPHUa4I6AYCyhYm4XiGe6l2SMPQNtrGe?=
 =?iso-8859-1?Q?7c26iCKeBoKOn+lmn7ym0cphmljAobn4+Raf85ikUAYQm2OWxd4kXRdsdO?=
 =?iso-8859-1?Q?OWZtRxb2eid+YFjJ92Y/NFPunc7CkKDPSbMwX+PGokSyRvsat2xscwQbuK?=
 =?iso-8859-1?Q?tt/6fz+xc/FFHncF+dGL5SeCgrzNtXy68jv3Oo/Fo0l356dbl4yFPvMCbH?=
 =?iso-8859-1?Q?FcyW5O16R2hr1dWal423xIoRtvcpuAA+FSGUBsg5cMTDkaY8GJXx79FH+n?=
 =?iso-8859-1?Q?iGECuyXaWMVOk41CyjzBsE9GZUyb1rRq18x1W1lfFRHSkaPHZY7albNoDp?=
 =?iso-8859-1?Q?AtGXFp4r+W8maIM89G9WZ0E/s5mN0T5f+Z+ZJ3EQwoGqmVU0X4/4Ygh64F?=
 =?iso-8859-1?Q?Fptlx//ywG+Ud6CIT9uBF15UFjd73+p+7YfzN1775Llb/zrgi6FdYZgGHn?=
 =?iso-8859-1?Q?0/ItzsNraEdisLmONEVoZGs1nchrZbhWV4/YTpQLG1b08Mt/V1ZVI0ryU3?=
 =?iso-8859-1?Q?kmnoYm2dQ1D+UBvIc7RySKCbpc28JZs/0TgyEB2hwLvT19M2DXubAWaLbW?=
 =?iso-8859-1?Q?aooMdTEShn7MWI6GFoP59ntbBgRZVNeLp7Baal3WhgyYL1TtzwyFC3kFas?=
 =?iso-8859-1?Q?MNbXzi/Nf0dbjoB6uO6BOClY7T7HKrNJGZpqqiyvFKdrznftUIY6W0awqy?=
 =?iso-8859-1?Q?tT1fuTzhJePc/47fSaixzcbbf/FqwNGgq+PUU2YNVYvuSAbk3rR6PZpnvG?=
 =?iso-8859-1?Q?CQhQBO8c7aG9u3gIbOgW82z28GEAsVvutiiWG7paWo7NG375zRM0Tw2CLv?=
 =?iso-8859-1?Q?4gb0O3oic6WuYXfFmzM+ZEg76SAIdEKlGCQI1FeL2ZhOX3JVV/gsiv3kmj?=
 =?iso-8859-1?Q?GmQ3kTAMKnfxYvKSpIhHoSseuSffx7oeY8jTpSQNxOfLxeq4kTpEaYeRvz?=
 =?iso-8859-1?Q?M87VikGQ/ilPfExnr14WDvtqoBMsJ+J44xoW9TAqI8/8n2x714GmWjyUlm?=
 =?iso-8859-1?Q?nW59U9NsGUKb+ZCD6IXcj7Uxig1oY3GuS/g/c+B0ODuUxsxwcotcRlziXR?=
 =?iso-8859-1?Q?4aNBcT/SsugI/gyYJVvJLDFGpiRfxwp0+dwKCkCNJf7hUJNXy13aE9YVko?=
 =?iso-8859-1?Q?I0cw/HOZZae31OPwGQYcSvQ6b4iz8gGsHLXi0ZDIhca5lbP/oG47qlYQla?=
 =?iso-8859-1?Q?ZGIqtuT/uIDav3kAZqbARffLd3B1Ub2ZexXDN2QT6fJT5PzboHFPwCaM05?=
 =?iso-8859-1?Q?u0/CAi09CjoIDe0IjkvKH+EHoNLTMW5JFDNU80ebS/MDU26WRAtInc8eNF?=
 =?iso-8859-1?Q?Olh6N/9K0FliBdNQFQ0McLPufH9L/3A4bTS0+oTN7NDv6fUpaRIHaLHrBB?=
 =?iso-8859-1?Q?s1amDPnxtozgXuvPUgFKBkURMtkcs/0ZnPQ8SN+h56jCZQga2bm51oFyO4?=
 =?iso-8859-1?Q?w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Oip3u8uQMcD9avsLLj3/jjXNDaB9aGmWdmwbM5ExdMatVG/Ni/g99B6/8J?=
 =?iso-8859-1?Q?GvO8miS2U93l/MOtqytjPdCTHduSnSmIoNIf7c/8ExF5U3oCayO2s1hoEl?=
 =?iso-8859-1?Q?dOHAoLoi7RQMaQbV1PQeDfQtqL4VWgzRbQ+sEu7yLKzO/sR94NOVlKYQEj?=
 =?iso-8859-1?Q?ACZpeIROlppe6JJSgLm4NZ1OQF9iJm9sh1AgUl9EDsC1v2RkxmOUJWx6dq?=
 =?iso-8859-1?Q?01MfGfU4TzjY2y1KUdyqYfqfGxNbCLKD1x+QVFpNXNYC4zORDZwrXJv5Fx?=
 =?iso-8859-1?Q?tytDZHKKjX44soE+4oiELzPydNKS1F2ZuCP+ah2Hn160Iq4GK/8mZ4dKbP?=
 =?iso-8859-1?Q?laSnbdpD1Qo2eNef6brQ9OYlkHP+E6sI6acSyKH7pTVAQ87v2L01Cja6HV?=
 =?iso-8859-1?Q?6uQIjzwHg0Tsfr/2xvaJOzveLuA/+KxzNLo8DOjkj9lG7VoGUlvs6uIDYZ?=
 =?iso-8859-1?Q?+vIlgNPRBLu7H4h40SE2xgDujeP2CLSD9vkyMQk//WLQHSWbjz2Hs3jyQf?=
 =?iso-8859-1?Q?reN4f3aF5ygQnmPo3mvSDbmgfH1xDHhSRD/13k2BeyDGLln4pGjcUVbpEh?=
 =?iso-8859-1?Q?e6bPS5k1WeEKL7onvFAqA6+8o5tvZSI72SuYbljFLB95KGlZmHUiu/90mf?=
 =?iso-8859-1?Q?CpIPEVd0OfHKbov1m0Y6leTewgy4ZUUYJP0tnOLVgHsIMOYQESdB1cmIta?=
 =?iso-8859-1?Q?KuDQW52phaVv1ECUovzSi8/1o733kzbtdJDHOKcqqvSZ5BC/E8JjtO3Erq?=
 =?iso-8859-1?Q?pj8zTbqiC6MAq+XwvLsqQK/vOeF0QeJV1gq3+xoEI6qiqznsgLij+x2Vfe?=
 =?iso-8859-1?Q?E9MyFBD8g8HVpAGihMcTCg0VX/kkpWiiJ+8jY3q5AA7TEktoWLl/uw6gRm?=
 =?iso-8859-1?Q?Gf26VOoNixL3XSZ4OcdsCSSnTtwG+xsZpThsHiShLmSAdr/7Ja2xYF3hIR?=
 =?iso-8859-1?Q?bXvFREVafFWgKyTGG0WMQYznKkbiTtsqCQEGsxc4MIMmoiZDhhbKrHdMBp?=
 =?iso-8859-1?Q?259TS9/GKjHLBjlA9RtM6GmiiHtieyglbVV6+HN3GTNUuSdIvL4caZkVyH?=
 =?iso-8859-1?Q?mFkVVVM9jBJ0N0ykkFvHzXwH6XQ4UkteA0XHgtzKXNdFemfiqD6vz5ZWSk?=
 =?iso-8859-1?Q?9kP/zar4Q6juamJqGr4IZZO/EqSZpCUUe1fFNKjwuF5VDkNubDRsc5+TNI?=
 =?iso-8859-1?Q?jokdV9bLapDWMpmVKFkAnSK/dSyyqs/2fR0i++qIA7RmxTfwZptguzIQi7?=
 =?iso-8859-1?Q?QlRFFrdjQ0GwGpDjFrVtfpq7kONm6JNIWwOfjT1f5xidwMLT48rt3bLyQR?=
 =?iso-8859-1?Q?Gk8M1X8tgZU7dFkurhznYr1+hIZTAv+Y5F0n4POx2i+hontAFL+3ZlK4n4?=
 =?iso-8859-1?Q?YZx/2n6OZc1QpRNWBydMi57ptVMG0q2wdUvOhg/ik1MgDZLXFwTDEgXL+Y?=
 =?iso-8859-1?Q?F116R0gf9NGksnSBpUkwrZPds1Z9kWMSx1gDngWYa6ky5rYCrZxn357tRr?=
 =?iso-8859-1?Q?PffLxbhVpLYS+66AKqPmGIrts6bHUuUZB88097J9jj6EuKhmRe/pZJhv0S?=
 =?iso-8859-1?Q?076BjtF6+jtKLnveo9+DRBbJa7RSaaEeAtdMmFsI7TtVjYmomR24bhUwt3?=
 =?iso-8859-1?Q?klBWo9Rf67r4RSBPH+7IIlWv/oNCzJVqfICZRfhi5UmFtFDqTYUtYgNA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c928e0-13ca-48f0-5537-08dd96ecf2d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 15:50:57.7394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ZN2yV/Dgc1AZ5XoiZ4C+AJMCk5coysW6Ydddhf2krFNKd9ig8WTbhPSYF1+F1m6m1BcWfEvWsKOKHyQzK9LCJQAzFxnvc4LxYZzUls+S0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9023

This patch introduces SCI driver to support for ARM EL3 Trusted Firmware-A
(TF-A) which provides SCMI interface with multi-agnet support, as shown
below.

  +-----------------------------------------+
  |                                         |
  | EL3 TF-A SCMI                           |
  +-------+--+-------+--+-------+--+-------++
  |shmem0 |  |shmem1 |  |shmem2 |  |shmemX |
  +-----+-+  +---+---+  +--+----+  +---+---+
smc-id0 |        |         |           |
agent0  |        |         |           |
  +-----v--------+---------+-----------+----+
  |              |         |           |    |
  |              |         |           |    |
  +--------------+---------+-----------+----+
         smc-id1 |  smc-id2|    smc-idX|
         agent1  |  agent2 |    agentX |
                 |         |           |
            +----v---+  +--v-----+  +--v-----+
            |        |  |        |  |        |
            | Dom0   |  | Dom1   |  | DomX   |
            |        |  |        |  |        |
            |        |  |        |  |        |
            +--------+  +--------+  +--------+

The EL3 SCMI multi-agent firmware expected to provide SCMI SMC/HVC shared
memory transport for every Agent in the system.

The SCMI Agent transport channel defined by pair:
 - smc-id: SMC/HVC id used for Doorbell
 - shmem: shared memory for messages transfer, Xen page aligned,
 p2m_mmio_direct_nc.

The follwoing SCMI Agents expected to be defined by SCMI FW to enable SCMI
multi-agent functionality under Xen:
- Xen manegement agent: trusted agents that accesses to the Base Protocol
commands to configure agent specific permissions
- OSPM VM agents: non-trusted agent, one for each Guest domain which is
  allowed direct HW access. At least one OSPM VM agent has to be provided
  by FW if HW is handled only by Dom0 or Driver Domain.

The EL3 SCMI FW expected to implement following Base protocol messages:
- BASE_DISCOVER_AGENT
- BASE_RESET_AGENT_CONFIGURATION (optional)
- BASE_SET_DEVICE_PERMISSIONS (optional)

The SCI SCMI SMC multi-agent driver implements following functionality:
- It's initialized based on the Host DT SCMI node (only one SCMI interface
is supported) which describes Xen management agent SCMI interface.

scmi_shm_0 : sram@47ff0000 {
    compatible =3D "arm,scmi-shmem";
    reg =3D <0x0 0x47ff0000 0x0 0x1000>;
};
firmware {
    scmi: scmi {
        compatible =3D "arm,scmi-smc";
        arm, smc - id =3D <0x82000002>; // Xen manegement agent smc-id
        \#address-cells =3D < 1>;
        \#size-cells =3D < 0>;
        \#access-controller - cells =3D < 1>;
        shmem =3D <&scmi_shm_0>; // Xen manegement agent shmem

        protocol@X{
        };
    };
};

- It obtains Xen specific SCMI Agent's configuration from the Host DT,
probes Agents and build SCMI Agents list; The Agents configuration is taken=
 from:

chosen {
  xen,scmi-secondary-agents =3D <
		1 0x82000003 &scmi_shm_1
		2 0x82000004 &scmi_shm_2
		3 0x82000005 &scmi_shm_3
		4 0x82000006 &scmi_shm_4>;
}

/{
	scmi_shm_1: sram@47ff1000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x47ff1000 0x0 0x1000>;
	};
	scmi_shm_2: sram@47ff2000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x47ff2000 0x0 0x1000>;
	};
	scmi_shm_3: sram@47ff3000 {
		compatible =3D "arm,scmi-shmem";
		reg =3D <0x0 0x47ff3000 0x0 0x1000>;
	};
}
  where first item is "agent_id", second - "arm,smc-id", and third - "arm,s=
cmi-shmem" for
  this agent_id.

  Note that Xen is the only one entry in the system which need to know
  about SCMI multi-agent support.

- It implements the SCI subsystem interface required for configuring and
enabling SCMI functionality for Dom0/hwdom and Guest domains. To enable
SCMI functionality for domain it has to be configured with unique supported
SCMI Agent_id and use corresponding SCMI SMC/HVC shared memory transport
[smc-id, shmem] defined for this SCMI Agent_id.
- Once Xen domain is configured it can communicate with EL3 SCMI FW:
  -- zero-copy, the guest domain puts SCMI message in shmem;
  -- the guest triggers SMC/HVC exception with smc-id (doorbell);
  -- the Xen driver catches exception, do checks and synchronously forwards
  it to EL3 FW.
- the Xen driver sends BASE_RESET_AGENT_CONFIGURATION message to Xen
  management agent channel on domain destroy event. This allows to reset
  resources used by domain and so implement use-case like domain reboot.

Dom0 Enable SCMI SMC:
 - pass dom0_scmi_agent_id=3D<agent_id> in Xen command line. if not provide=
d
   SCMI will be disabled for Dom0 and all SCMI nodes removed from Dom0 DT.
   The driver updates Dom0 DT SCMI node "arm,smc-id" value and fix up shmem
   node according to assigned agent_id.

Guest domains enable SCMI SMC:
 - xl.cfg: add configuration option as below

   arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D2"

 - xl.cfg: enable access to the "arm,scmi-shmem" which should correspond as=
signed agent_id for
   the domain, for example:

iomem =3D [
    "47ff2,1@22001",
]

 - DT: add SCMI nodes to the Driver domain partial device tree as in the
 below example. The "arm,smc-id" should correspond assigned agent_id for th=
e domain:

passthrough {
   scmi_shm_0: sram@22001000 {
       compatible =3D "arm,scmi-shmem";
       reg =3D <0x0 0x22001000 0x0 0x1000>;
   };

   firmware {
        compatible =3D "simple-bus";
            scmi: scmi {
                compatible =3D "arm,scmi-smc";
                arm,smc-id =3D <0x82000004>;
                shmem =3D <&scmi_shm_0>;
                ...
            }
    }
}

SCMI "4.2.1.1 Device specific access control"

The XEN SCI SCMI SMC multi-agent driver performs "access-controller" provid=
er function
in case EL3 SCMI FW implements SCMI "4.2.1.1 Device specific access control=
" and provides the
BASE_SET_DEVICE_PERMISSIONS command to configure the devices that an agents=
 have access to.
The DT SCMI node should "#access-controller-cells=3D<1>" property and DT de=
vices should be bound
to the Xen SCMI.

&i2c1 {
	access-controllers =3D <&scmi 0>;
};

The Dom0 and dom0less domains DT devices will be processed automatically th=
rough
sci_assign_dt_device() call, but to assign SCMI devices from toolstack the =
xl.cfg:"dtdev" property
shell be used:

dtdev =3D [
    "/soc/i2c@e6508000",
]

xl.cfg:dtdev will contain all nodes which are under SCMI management (not on=
ly those which are behind IOMMU).

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/Documentation/devicetree/bindings/access-controllers/access-controller=
s.yaml
Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---

Changes in v4:
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

 docs/man/xl.cfg.5.pod.in                    |  13 +
 docs/misc/arm/device-tree/booting.txt       |  60 ++
 docs/misc/xen-command-line.pandoc           |   9 +
 tools/libs/light/libxl_arm.c                |   4 +
 tools/libs/light/libxl_types.idl            |   4 +-
 tools/xl/xl_parse.c                         |  12 +
 xen/arch/arm/dom0less-build.c               |  11 +
 xen/arch/arm/domain_build.c                 |   3 +-
 xen/arch/arm/firmware/Kconfig               |  11 +
 xen/arch/arm/firmware/Makefile              |   1 +
 xen/arch/arm/firmware/scmi-proto.h          | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c          | 173 ++++
 xen/arch/arm/firmware/scmi-shmem.h          |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c | 860 ++++++++++++++++++++
 xen/include/public/arch-arm.h               |   3 +
 15 files changed, 1371 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 1ccf50b8ea..302c46d8bc 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -3122,8 +3122,21 @@ single SCMI OSPM agent support.
 Should be used together with B<dom0_scmi_smc_passthrough> Xen command line
 option.
=20
+=3Ditem B<scmi_smc_multiagent>
+
+Enables ARM SCMI SMC multi-agent support for the guest by enabling SCMI ov=
er
+SMC calls forwarding from domain to the EL3 firmware (like Trusted Firmwar=
e-A)
+with a multi SCMI OSPM agent support. The SCMI B<agent_id> should be
+specified for the guest.
+
 =3Dback
=20
+=3Ditem B<agent_id=3DNUMBER>
+
+Specifies a non-zero ARM SCI agent id for the guest. This option is mandat=
ory
+if the SCMI SMC support is enabled for the guest. The agent ids of domains
+existing on a single host must be unique and in the range [1..255].
+
 =3Dback
=20
 =3Dback
diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-t=
ree/booting.txt
index 8943c04173..c8923ab8b2 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -296,6 +296,20 @@ with the following properties:
     Should be used together with dom0_scmi_smc_passthrough Xen command lin=
e
     option.
=20
+    - "scmi_smc_multiagent"
+
+    Enables ARM SCMI SMC multi-agent support for the guest by enabling SCM=
I over
+    SMC calls forwarding from domain to the EL3 firmware (like ARM
+    Trusted Firmware-A) with a multi SCMI OSPM agent support.
+    The SCMI agent_id should be specified for the guest with "xen,sci_agen=
t_id"
+    property.
+
+- "xen,sci_agent_id"
+
+    Specifies a non-zero ARM SCI agent id for the guest. This option is
+    mandatory if the SCMI SMC "scmi_smc_multiagent" support is enabled for
+    the guest. The agent ids of guest must be unique and in the range [1..=
255].
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
=20
@@ -764,3 +778,49 @@ The automatically allocated static shared memory will =
get mapped at
 0x80000000 in DomU1 guest physical address space, and at 0x90000000 in Dom=
U2
 guest physical address space. DomU1 is explicitly defined as the owner dom=
ain,
 and DomU2 is the borrower domain.
+
+SCMI SMC multi-agent support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+For enabling the ARM SCMI SMC multi-agent support (enabled by CONFIG_SCMI_=
SMC_MA)
+the Xen specific SCMI Agent's configuration shell be provided in the Host =
DT
+according to the SCMI compliant EL3 Firmware specification with
+ARM SMC/HVC transport using property "xen,scmi-secondary-agents" under
+the top-level "chosen" node:
+
+- xen,scmi-secondary-agents
+
+    Defines a set of SCMI agents configuration supported by SCMI EL3 FW an=
d
+    available for Xen. Each Agent defined as triple consisting of:
+    SCMI agent_id,
+    SMC/HVC function_id assigned for the agent transport ("arm,smc-id"),
+    phandle to SCMI SHM assigned for the agent transport ("arm,scmi-shmem"=
).
+
+As an example:
+
+chosen {
+    xen,scmi-secondary-agents =3D <
+        1 0x82000003 &scmi_shm_1
+        2 0x82000004 &scmi_shm_2
+        3 0x82000005 &scmi_shm_3
+        4 0x82000006 &scmi_shm_4>;
+}
+
+/{
+        scmi_shm_1: sram@47ff1000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff1000 0x0 0x1000>;
+        };
+        scmi_shm_2: sram@47ff2000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff2000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff3000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff3000 0x0 0x1000>;
+        };
+        scmi_shm_3: sram@47ff4000 {
+                compatible =3D "arm,scmi-shmem";
+                reg =3D <0x0 0x47ff4000 0x0 0x1000>;
+        };
+}
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 8e50f6b7c7..bc3c64d6ec 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1091,6 +1091,15 @@ which serves as Driver domain. The SCMI will be disa=
bled for Dom0/hwdom and
 SCMI nodes removed from Dom0/hwdom device tree.
 (for example, thin Dom0 with Driver domain use-case).
=20
+### dom0_scmi_agent_id (ARM)
+> `=3D <integer>`
+
+The option is available when `CONFIG_SCMI_SMC_MA` is compiled in, and allo=
ws to
+enable SCMI functionality for Dom0 by specifying a non-zero ARM SCMI agent=
 id.
+The SCMI will be disabled for Dom0 if this option is not specified
+(for example, thin Dom0 or dom0less use-cases).
+The agent ids of domains existing on a single host must be unique.
+
 ### dtuart (ARM)
 > `=3D path [:options]`
=20
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 28ba9eb787..7712f53cd4 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -229,6 +229,10 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
     case LIBXL_ARM_SCI_TYPE_SCMI_SMC:
         config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
         break;
+    case LIBXL_ARM_SCI_TYPE_SCMI_SMC_MULTIAGENT:
+        config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_M=
A;
+        config->arch.arm_sci_agent_id =3D d_config->b_info.arch_arm.arm_sc=
i.agent_id;
+        break;
     default:
         LOG(ERROR, "Unknown ARM_SCI type %d",
             d_config->b_info.arch_arm.arm_sci.type);
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_type=
s.idl
index aa2190ab5b..11e31ce786 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -553,11 +553,13 @@ libxl_sve_type =3D Enumeration("sve_type", [
=20
 libxl_arm_sci_type =3D Enumeration("arm_sci_type", [
     (0, "none"),
-    (1, "scmi_smc")
+    (1, "scmi_smc"),
+    (2, "scmi_smc_multiagent")
     ], init_val =3D "LIBXL_ARM_SCI_TYPE_NONE")
=20
 libxl_arm_sci =3D Struct("arm_sci", [
     ("type", libxl_arm_sci_type),
+    ("agent_id", uint8)
     ])
=20
 libxl_rdm_reserve =3D Struct("rdm_reserve", [
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index bd22be9d33..81aa3797e3 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1306,6 +1306,18 @@ static int parse_arm_sci_config(XLU_Config *cfg, lib=
xl_arm_sci *arm_sci,
             }
         }
=20
+        if (MATCH_OPTION("agent_id", ptr, oparg)) {
+            unsigned long val =3D parse_ulong(oparg);
+
+            if (!val || val > 255) {
+                fprintf(stderr, "An invalid ARM_SCI agent_id specified (%l=
u). Valid range [1..255]\n",
+                        val);
+                ret =3D ERROR_INVAL;
+                goto parse_error;
+            }
+            arm_sci->agent_id =3D val;
+        }
+
         ptr =3D strtok(NULL, ",");
     }
=20
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 0a00f03a25..43d21eb889 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -835,6 +835,17 @@ int __init domu_dt_sci_parse(struct dt_device_node *no=
de,
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
     else if ( !strcmp(sci_type, "scmi_smc") )
         d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC;
+    else if ( !strcmp(sci_type, "scmi_smc_multiagent") )
+    {
+        uint32_t agent_id =3D 0;
+
+        if ( !dt_property_read_u32(node, "xen,sci_agent_id", &agent_id) ||
+             !agent_id )
+            return -EINVAL;
+
+        d_cfg->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA=
;
+        d_cfg->arch.arm_sci_agent_id =3D agent_id;
+    }
     else
     {
         printk(XENLOG_ERR "xen,sci_type in not valid (%s) for domain %s\n"=
,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 36d28b52a4..0c9274a2b3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -616,7 +616,8 @@ static int __init write_properties(struct domain *d, st=
ruct kernel_info *kinfo,
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-start") =
||
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-size") |=
|
                  dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-siz=
e") ||
-                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver=
"))
+                 dt_property_name_is_equal(prop, "linux,uefi-mmap-desc-ver=
") ||
+                 dt_property_name_is_equal(prop, "xen,scmi-secondary-agent=
s") )
                 continue;
=20
             if ( dt_property_name_is_equal(prop, "xen,dom0-bootargs") )
diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
index 5c5f0880c4..6b051c8ada 100644
--- a/xen/arch/arm/firmware/Kconfig
+++ b/xen/arch/arm/firmware/Kconfig
@@ -29,6 +29,17 @@ config SCMI_SMC
 	  driver domain.
 	  Use with EL3 firmware which supports only single SCMI OSPM agent.
=20
+config SCMI_SMC_MA
+	bool "Enable ARM SCMI SMC multi-agent driver"
+	select ARM_SCI
+	help
+	  Enables SCMI SMC/HVC multi-agent in XEN to pass SCMI requests from Doma=
ins
+	  to EL3 firmware (TF-A) which supports multi-agent feature.
+	  This feature allows to enable SCMI per Domain using unique SCMI agent_i=
d,
+	  so Domain is identified by EL3 firmware as an SCMI Agent and can access
+	  allowed platform resources through dedicated SMC/HVC Shared memory base=
d
+	  transport.
+
 endchoice
=20
 endmenu
diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefil=
e
index 71bdefc24a..37927e690e 100644
--- a/xen/arch/arm/firmware/Makefile
+++ b/xen/arch/arm/firmware/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_ARM_SCI) +=3D sci.o
 obj-$(CONFIG_SCMI_SMC) +=3D scmi-smc.o
+obj-$(CONFIG_SCMI_SMC_MA) +=3D scmi-shmem.o scmi-smc-multiagent.o
diff --git a/xen/arch/arm/firmware/scmi-proto.h b/xen/arch/arm/firmware/scm=
i-proto.h
new file mode 100644
index 0000000000..3f4b9c5d6b
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-proto.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
+#define XEN_ARCH_ARM_SCI_SCMI_PROTO_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHORT_NAME_MAX_SIZE 16
+
+/* SCMI status codes. See section 4.1.4 */
+#define SCMI_SUCCESS              0
+#define SCMI_NOT_SUPPORTED      (-1)
+#define SCMI_INVALID_PARAMETERS (-2)
+#define SCMI_DENIED             (-3)
+#define SCMI_NOT_FOUND          (-4)
+#define SCMI_OUT_OF_RANGE       (-5)
+#define SCMI_BUSY               (-6)
+#define SCMI_COMMS_ERROR        (-7)
+#define SCMI_GENERIC_ERROR      (-8)
+#define SCMI_HARDWARE_ERROR     (-9)
+#define SCMI_PROTOCOL_ERROR     (-10)
+
+/* Protocol IDs */
+#define SCMI_BASE_PROTOCOL 0x10
+
+/* Base protocol message IDs */
+#define SCMI_BASE_PROTOCOL_VERSION            0x0
+#define SCMI_BASE_PROTOCOL_ATTIBUTES          0x1
+#define SCMI_BASE_PROTOCOL_MESSAGE_ATTRIBUTES 0x2
+#define SCMI_BASE_DISCOVER_AGENT              0x7
+#define SCMI_BASE_SET_DEVICE_PERMISSIONS      0x9
+#define SCMI_BASE_RESET_AGENT_CONFIGURATION   0xB
+
+typedef struct scmi_msg_header {
+    uint8_t id;
+    uint8_t type;
+    uint8_t protocol;
+    uint32_t status;
+} scmi_msg_header_t;
+
+/* Table 2 Message header format */
+#define SCMI_HDR_ID    GENMASK(7, 0)
+#define SCMI_HDR_TYPE  GENMASK(9, 8)
+#define SCMI_HDR_PROTO GENMASK(17, 10)
+
+#define SCMI_FIELD_GET(_mask, _reg)                                       =
     \
+    ((typeof(_mask))(((_reg) & (_mask)) >> (ffs64(_mask) - 1)))
+#define SCMI_FIELD_PREP(_mask, _val)                                      =
     \
+    (((typeof(_mask))(_val) << (ffs64(_mask) - 1)) & (_mask))
+
+static inline uint32_t pack_scmi_header(scmi_msg_header_t *hdr)
+{
+    return SCMI_FIELD_PREP(SCMI_HDR_ID, hdr->id) |
+           SCMI_FIELD_PREP(SCMI_HDR_TYPE, hdr->type) |
+           SCMI_FIELD_PREP(SCMI_HDR_PROTO, hdr->protocol);
+}
+
+static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t =
*hdr)
+{
+    hdr->id =3D SCMI_FIELD_GET(SCMI_HDR_ID, msg_hdr);
+    hdr->type =3D SCMI_FIELD_GET(SCMI_HDR_TYPE, msg_hdr);
+    hdr->protocol =3D SCMI_FIELD_GET(SCMI_HDR_PROTO, msg_hdr);
+}
+
+static inline int scmi_to_xen_errno(int scmi_status)
+{
+    if ( scmi_status =3D=3D SCMI_SUCCESS )
+        return 0;
+
+    switch ( scmi_status )
+    {
+    case SCMI_NOT_SUPPORTED:
+        return -EOPNOTSUPP;
+    case SCMI_INVALID_PARAMETERS:
+        return -EINVAL;
+    case SCMI_DENIED:
+        return -EACCES;
+    case SCMI_NOT_FOUND:
+        return -ENOENT;
+    case SCMI_OUT_OF_RANGE:
+        return -ERANGE;
+    case SCMI_BUSY:
+        return -EBUSY;
+    case SCMI_COMMS_ERROR:
+        return -ENOTCONN;
+    case SCMI_GENERIC_ERROR:
+        return -EIO;
+    case SCMI_HARDWARE_ERROR:
+        return -ENXIO;
+    case SCMI_PROTOCOL_ERROR:
+        return -EBADMSG;
+    default:
+        return -EINVAL;
+    }
+}
+
+/* PROTOCOL_VERSION */
+#define SCMI_VERSION_MINOR GENMASK(15, 0)
+#define SCMI_VERSION_MAJOR GENMASK(31, 16)
+
+struct scmi_msg_prot_version_p2a {
+    uint32_t version;
+} __packed;
+
+/* BASE PROTOCOL_ATTRIBUTES */
+#define SCMI_BASE_ATTR_NUM_PROTO GENMASK(7, 0)
+#define SCMI_BASE_ATTR_NUM_AGENT GENMASK(15, 8)
+
+struct scmi_msg_base_attributes_p2a {
+    uint32_t attributes;
+} __packed;
+
+/*
+ * BASE_DISCOVER_AGENT
+ */
+#define SCMI_BASE_AGENT_ID_OWN 0xFFFFFFFF
+
+struct scmi_msg_base_discover_agent_a2p {
+    uint32_t agent_id;
+} __packed;
+
+struct scmi_msg_base_discover_agent_p2a {
+    uint32_t agent_id;
+    char name[SCMI_SHORT_NAME_MAX_SIZE];
+} __packed;
+
+/*
+ * BASE_SET_DEVICE_PERMISSIONS
+ */
+#define SCMI_BASE_DEVICE_ACCESS_ALLOW           BIT(0, UL)
+
+struct scmi_msg_base_set_device_permissions_a2p {
+    uint32_t agent_id;
+    uint32_t device_id;
+    uint32_t flags;
+} __packed;
+
+/*
+ * BASE_RESET_AGENT_CONFIGURATION
+ */
+#define SCMI_BASE_AGENT_PERMISSIONS_RESET       BIT(0, UL)
+
+struct scmi_msg_base_reset_agent_cfg_a2p {
+    uint32_t agent_id;
+    uint32_t flags;
+} __packed;
+
+#endif /* XEN_ARCH_ARM_SCI_SCMI_PROTO_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.c b/xen/arch/arm/firmware/scm=
i-shmem.c
new file mode 100644
index 0000000000..dd613ee0b5
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.c
@@ -0,0 +1,173 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/io.h>
+#include <xen/err.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+/*
+ * Copy data from IO memory space to "real" memory space.
+ */
+static void __memcpy_fromio(void *to, const volatile void __iomem *from,
+                            size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)from, 4) )
+    {
+        *(u8 *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        *(u32 *)to =3D readl_relaxed(from);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        *(u8 *)to =3D readb_relaxed(from);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+/*
+ * Copy data from "real" memory space to IO memory space.
+ */
+static void __memcpy_toio(volatile void __iomem *to, const void *from,
+                          size_t count)
+{
+    while ( count && !IS_ALIGNED((unsigned long)to, 4) )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+
+    while ( count >=3D 4 )
+    {
+        writel_relaxed(*(u32 *)from, to);
+        from +=3D 4;
+        to +=3D 4;
+        count -=3D 4;
+    }
+
+    while ( count )
+    {
+        writeb_relaxed(*(u8 *)from, to);
+        from++;
+        to++;
+        count--;
+    }
+}
+
+static inline int
+shmem_channel_is_free(const volatile struct scmi_shared_mem __iomem *shmem=
)
+{
+    return (readl(&shmem->channel_status) &
+            SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE) ? 0 : -EBUSY;
+}
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len)
+{
+    int ret;
+
+    if ( (len + sizeof(shmem->msg_header)) > SCMI_SHMEM_MAPPED_SIZE )
+    {
+        printk(XENLOG_ERR "scmi: Wrong size of smc message. Data is invali=
d\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    writel_relaxed(0x0, &shmem->channel_status);
+    /* Writing 0x0 right now, but "shmem"_FLAG_INTR_ENABLED can be set */
+    writel_relaxed(0x0, &shmem->flags);
+    writel_relaxed(sizeof(shmem->msg_header) + len, &shmem->length);
+    writel(pack_scmi_header(hdr), &shmem->msg_header);
+
+    if ( len > 0 && data )
+        __memcpy_toio(shmem->msg_payload, data, len);
+
+    return 0;
+}
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len)
+{
+    int recv_len;
+    int ret;
+    int pad =3D sizeof(hdr->status);
+
+    if ( len >=3D SCMI_SHMEM_MAPPED_SIZE - sizeof(shmem) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of input smc message. Data may be invalid=
\n");
+        return -EINVAL;
+    }
+
+    ret =3D shmem_channel_is_free(shmem);
+    if ( ret )
+        return ret;
+
+    recv_len =3D readl(&shmem->length) - sizeof(shmem->msg_header);
+
+    if ( recv_len < 0 )
+    {
+        printk(XENLOG_ERR
+               "scmi: Wrong size of smc message. Data may be invalid\n");
+        return -EINVAL;
+    }
+
+    unpack_scmi_header(readl(&shmem->msg_header), hdr);
+
+    hdr->status =3D readl(&shmem->msg_payload);
+    recv_len =3D recv_len > pad ? recv_len - pad : 0;
+
+    ret =3D scmi_to_xen_errno(hdr->status);
+    if ( ret )
+    {
+        printk(XENLOG_DEBUG "scmi: Error received: %d\n", ret);
+        return ret;
+    }
+
+    if ( recv_len > len )
+    {
+        printk(XENLOG_ERR
+               "scmi: Not enough buffer for message %d, expecting %d\n",
+               recv_len, len);
+        return -EINVAL;
+    }
+
+    if ( recv_len > 0 )
+        __memcpy_fromio(data, shmem->msg_payload + pad, recv_len);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-shmem.h b/xen/arch/arm/firmware/scm=
i-shmem.h
new file mode 100644
index 0000000000..2f8e23ff76
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-shmem.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Arm System Control and Management Interface definitions
+ * Version 3.0 (DEN0056C)
+ * Shared Memory based Transport
+ *
+ * Copyright (c) 2024 EPAM Systems
+ */
+
+#ifndef XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
+#define XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_
+
+#include <xen/stdint.h>
+
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE  BIT(0, UL)
+#define SCMI_SHMEM_CHAN_STAT_CHANNEL_ERROR BIT(1, UL)
+
+struct scmi_shared_mem {
+    uint32_t reserved;
+    uint32_t channel_status;
+    uint32_t reserved1[2];
+    uint32_t flags;
+    uint32_t length;
+    uint32_t msg_header;
+    uint8_t msg_payload[];
+};
+
+#define SCMI_SHMEM_MAPPED_SIZE PAGE_SIZE
+
+int shmem_put_message(volatile struct scmi_shared_mem __iomem *shmem,
+                      scmi_msg_header_t *hdr, void *data, int len);
+
+int shmem_get_response(const volatile struct scmi_shared_mem __iomem *shme=
m,
+                       scmi_msg_header_t *hdr, void *data, int len);
+#endif /* XEN_ARCH_ARM_SCI_SCMI_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/firmware/scmi-smc-multiagent.c b/xen/arch/arm/fir=
mware/scmi-smc-multiagent.c
new file mode 100644
index 0000000000..e023bca3a1
--- /dev/null
+++ b/xen/arch/arm/firmware/scmi-smc-multiagent.c
@@ -0,0 +1,860 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCI SCMI multi-agent driver, using SMC/HVC shmem as transport.
+ *
+ * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
+ * Copyright (c) 2025 EPAM Systems
+ */
+
+#include <xen/acpi.h>
+
+#include <xen/device_tree.h>
+#include <xen/init.h>
+#include <xen/iocap.h>
+#include <xen/err.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/param.h>
+#include <xen/sched.h>
+#include <xen/vmap.h>
+
+#include <asm/firmware/sci.h>
+#include <asm/smccc.h>
+
+#include "scmi-proto.h"
+#include "scmi-shmem.h"
+
+#define SCMI_AGENT_ID_INVALID 0xFF
+
+static uint8_t __initdata opt_dom0_scmi_agent_id =3D SCMI_AGENT_ID_INVALID=
;
+integer_param("dom0_scmi_agent_id", opt_dom0_scmi_agent_id);
+
+#define SCMI_SECONDARY_AGENTS "xen,scmi-secondary-agents"
+
+#define HYP_CHANNEL 0x0
+
+struct scmi_channel {
+    uint32_t agent_id;
+    uint32_t func_id;
+    domid_t domain_id;
+    uint64_t paddr;
+    uint64_t len;
+    struct scmi_shared_mem __iomem *shmem;
+    spinlock_t lock;
+    struct list_head list;
+};
+
+struct scmi_data {
+    struct list_head channel_list;
+    spinlock_t channel_list_lock;
+    uint32_t func_id;
+    bool initialized;
+    uint32_t shmem_phandle;
+    struct dt_device_node *dt_dev;
+};
+
+static struct scmi_data scmi_data;
+
+static int send_smc_message(struct scmi_channel *chan_info,
+                            scmi_msg_header_t *hdr, void *data, int len)
+{
+    struct arm_smccc_res resp;
+    int ret;
+
+    ret =3D shmem_put_message(chan_info->shmem, hdr, data, len);
+    if ( ret )
+        return ret;
+
+    arm_smccc_1_1_smc(chan_info->func_id, 0, 0, 0, 0, 0, 0, 0, &resp);
+
+    if ( resp.a0 )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+static int do_smc_xfer(struct scmi_channel *chan_info, scmi_msg_header_t *=
hdr,
+                       void *tx_data, int tx_size, void *rx_data, int rx_s=
ize)
+{
+    int ret =3D 0;
+
+    ASSERT(chan_info && chan_info->shmem);
+
+    if ( !hdr )
+        return -EINVAL;
+
+    spin_lock(&chan_info->lock);
+
+    printk(XENLOG_DEBUG
+           "scmi: agent_id =3D %d msg_id =3D %x type =3D %d, proto =3D %x\=
n",
+           chan_info->agent_id, hdr->id, hdr->type, hdr->protocol);
+
+    ret =3D send_smc_message(chan_info, hdr, tx_data, tx_size);
+    if ( ret )
+        goto clean;
+
+    ret =3D shmem_get_response(chan_info->shmem, hdr, rx_data, rx_size);
+
+clean:
+    printk(XENLOG_DEBUG
+           "scmi: get smc response agent_id =3D %d msg_id =3D %x proto =3D=
 %x res=3D%d\n",
+           chan_info->agent_id, hdr->id, hdr->protocol, ret);
+
+    spin_unlock(&chan_info->lock);
+
+    return ret;
+}
+
+static struct scmi_channel *get_channel_by_id(uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    bool found =3D false;
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            found =3D true;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+    if ( found )
+        return curr;
+
+    return NULL;
+}
+
+static struct scmi_channel *acquire_scmi_channel(struct domain *d,
+                                                 uint32_t agent_id)
+{
+    struct scmi_channel *curr;
+    struct scmi_channel *ret =3D ERR_PTR(-ENOENT);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    list_for_each_entry(curr, &scmi_data.channel_list, list)
+    {
+        if ( curr->agent_id =3D=3D agent_id )
+        {
+            if ( curr->domain_id !=3D DOMID_INVALID )
+            {
+                ret =3D ERR_PTR(-EEXIST);
+                break;
+            }
+
+            curr->domain_id =3D d->domain_id;
+            ret =3D curr;
+            break;
+        }
+    }
+
+    spin_unlock(&scmi_data.channel_list_lock);
+
+    return ret;
+}
+
+static void relinquish_scmi_channel(struct scmi_channel *channel)
+{
+    ASSERT(channel !=3D NULL);
+
+    spin_lock(&scmi_data.channel_list_lock);
+    channel->domain_id =3D DOMID_INVALID;
+    spin_unlock(&scmi_data.channel_list_lock);
+}
+
+static int map_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->paddr);
+    channel->shmem =3D ioremap_nocache(channel->paddr, SCMI_SHMEM_MAPPED_S=
IZE);
+    if ( !channel->shmem )
+        return -ENOMEM;
+
+    channel->shmem->channel_status =3D SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE;
+    printk(XENLOG_DEBUG "scmi: Got shmem %lx after vmap %p\n", channel->pa=
ddr,
+           channel->shmem);
+
+    return 0;
+}
+
+static void unmap_channel_memory(struct scmi_channel *channel)
+{
+    ASSERT(channel && channel->shmem);
+    iounmap(channel->shmem);
+    channel->shmem =3D NULL;
+}
+
+static struct scmi_channel *smc_create_channel(uint32_t agent_id,
+                                               uint32_t func_id, uint64_t =
addr)
+{
+    struct scmi_channel *channel;
+
+    channel =3D get_channel_by_id(agent_id);
+    if ( channel )
+        return ERR_PTR(EEXIST);
+
+    channel =3D xmalloc(struct scmi_channel);
+    if ( !channel )
+        return ERR_PTR(ENOMEM);
+
+    spin_lock_init(&channel->lock);
+    channel->agent_id =3D agent_id;
+    channel->func_id =3D func_id;
+    channel->domain_id =3D DOMID_INVALID;
+    channel->shmem =3D NULL;
+    channel->paddr =3D addr;
+    list_add_tail(&channel->list, &scmi_data.channel_list);
+    return channel;
+}
+
+static void free_channel_list(void)
+{
+    struct scmi_channel *curr, *_curr;
+
+    list_for_each_entry_safe(curr, _curr, &scmi_data.channel_list, list)
+    {
+        list_del(&curr->list);
+        xfree(curr);
+    }
+}
+
+static int __init
+scmi_dt_read_hyp_channel_addr(struct dt_device_node *scmi_node, u64 *addr,
+                              u64 *size)
+{
+    struct dt_device_node *shmem_node;
+    const __be32 *prop;
+
+    prop =3D dt_get_property(scmi_node, "shmem", NULL);
+    if ( !prop )
+        return -EINVAL;
+
+    shmem_node =3D dt_find_node_by_phandle(be32_to_cpup(prop));
+    if ( IS_ERR_OR_NULL(shmem_node) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Device tree error, can't parse reserved memory %ld\n=
",
+               PTR_ERR(shmem_node));
+        return PTR_ERR(shmem_node);
+    }
+
+    return dt_device_get_address(shmem_node, 0, addr, size);
+}
+
+/*
+ * Handle Dom0 SCMI specific DT nodes
+ *
+ * Make a decision on copying SCMI specific nodes into Dom0 device tree.
+ * For SCMI multi-agent case:
+ * - shmem nodes will not be copied and generated instead if SCMI
+ *   is enabled for Dom0
+ * - scmi node will be copied if SCMI is enabled for Dom0
+ */
+static bool scmi_dt_handle_node(struct domain *d, struct dt_device_node *n=
ode)
+{
+    static const struct dt_device_match skip_matches[] __initconst =3D {
+        DT_MATCH_COMPATIBLE("arm,scmi-shmem"),
+        { /* sentinel */ },
+    };
+    static const struct dt_device_match scmi_matches[] __initconst =3D {
+        DT_MATCH_PATH("/firmware/scmi"),
+        { /* sentinel */ },
+    };
+
+    if ( !scmi_data.initialized )
+        return false;
+
+    /* always drop shmem */
+    if ( dt_match_node(skip_matches, node) )
+    {
+        dt_dprintk("  Skip scmi shmem\n");
+        return true;
+    }
+
+    /* drop scmi if not enabled */
+    if ( dt_match_node(scmi_matches, node) && !sci_domain_is_enabled(d) )
+    {
+        dt_dprintk("  Skip scmi node\n");
+        return true;
+    }
+
+    return false;
+}
+
+/*
+ * Finalize Dom0 SCMI specific DT nodes
+ *
+ * if SCMI is enabled for Dom0:
+ * - generate shmem node
+ * - map SCMI shmem MMIO into Dom0
+ */
+static int scmi_dt_finalize(struct domain *d, void *fdt)
+{
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    struct scmi_channel *channel;
+    int nodeoffset;
+    __be32 *cells;
+    __be32 val;
+    char buf[64];
+    int res, rc;
+
+    if ( !sci_domain_is_enabled(d) )
+        return 0;
+
+    channel =3D d->arch.sci_data;
+
+    /*
+     * Replace "arm,smc-id" with proper value assigned for Dom0 SCMI chann=
el
+     */
+    nodeoffset =3D fdt_node_offset_by_compatible(fdt, -1, "arm,scmi-smc");
+    if ( nodeoffset < 0 )
+        return -ENODEV;
+
+    cells =3D (__be32 *)&val;
+    dt_set_cell(&cells, 1, channel->func_id);
+    res =3D fdt_setprop_inplace(fdt, nodeoffset, "arm,smc-id", &val, sizeo=
f(val));
+    if ( res )
+        return -EINVAL;
+
+    /*
+     * All SCMI shmem nodes should be removed from Dom0 DT at this point, =
so
+     * the shmem node for Dom0 need to be generated from SCMI channel assi=
gned
+     * to Dom0.
+     * The original SCMI shmem node from platform DT is used by Xen SCMI d=
river
+     * itself as privileged channel (agent_id=3D0) to manage other SCMI
+     * agents (domains).
+     */
+    snprintf(buf, sizeof(buf), "scmi-shmem@%lx", channel->paddr);
+
+    res =3D fdt_begin_node(fdt, buf);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,scmi-shmem");
+    if ( res )
+        return res;
+
+    cells =3D &reg[0];
+
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_C=
ELLS,
+                       channel->paddr, SCMI_SHMEM_MAPPED_SIZE);
+
+    res =3D fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "phandle", scmi_data.shmem_phandle);
+    if ( res )
+        return res;
+
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    /*
+     * Map SCMI shmem into Dom0 here as shmem nodes are excluded from
+     * generic Dom0 DT processing
+     */
+    res =3D iomem_permit_access(d, paddr_to_pfn(channel->paddr),
+                              paddr_to_pfn(channel->paddr +
+                                           SCMI_SHMEM_MAPPED_SIZE - 1));
+    if ( res )
+        return res;
+
+    res =3D map_regions_p2mt(d, gaddr_to_gfn(channel->paddr),
+                           PFN_UP(SCMI_SHMEM_MAPPED_SIZE),
+                           maddr_to_mfn(channel->paddr), p2m_mmio_direct_n=
c);
+    if ( res )
+    {
+        rc =3D iomem_deny_access(d, paddr_to_pfn(channel->paddr),
+                               paddr_to_pfn(channel->paddr +
+                                            SCMI_SHMEM_MAPPED_SIZE - 1));
+        if ( rc )
+            printk(XENLOG_ERR "scmi: Unable to deny iomem access , err =3D=
 %d\n",
+                   rc);
+    }
+
+    return res;
+}
+
+static int scmi_assign_device(uint32_t agent_id, uint32_t device_id,
+                              uint32_t flags)
+{
+    struct scmi_msg_base_set_device_permissions_a2p tx;
+    struct scmi_channel *channel;
+    scmi_msg_header_t hdr;
+    int ret;
+
+    channel =3D get_channel_by_id(HYP_CHANNEL);
+    if ( !channel )
+        return -EINVAL;
+
+    hdr.id =3D SCMI_BASE_SET_DEVICE_PERMISSIONS;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.agent_id =3D agent_id;
+    tx.device_id =3D device_id;
+    tx.flags =3D flags;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret =3D=3D -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static int scmi_dt_assign_device(struct domain *d,
+                                 struct dt_phandle_args *ac_spec)
+{
+    struct scmi_channel *agent_channel;
+    uint32_t scmi_device_id =3D ac_spec->args[0];
+    int ret;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    /* The access-controllers is specified for DT dev, but it's not a SCMI=
 */
+    if ( ac_spec->np !=3D scmi_data.dt_dev )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+
+    ret =3D scmi_assign_device(agent_channel->agent_id, scmi_device_id,
+                             SCMI_BASE_DEVICE_ACCESS_ALLOW);
+    if ( ret )
+    {
+        printk(XENLOG_ERR
+               "scmi: could not assign dev for %pd agent:%d dev_id:%u (%d)=
",
+               d, agent_channel->agent_id, scmi_device_id, ret);
+    }
+
+    spin_unlock(&agent_channel->lock);
+    return ret;
+}
+
+static __init int collect_agents(struct dt_device_node *scmi_node)
+{
+    const struct dt_device_node *chosen_node;
+    const __be32 *prop;
+    uint32_t len, i;
+
+    chosen_node =3D dt_find_node_by_path("/chosen");
+    if ( !chosen_node )
+    {
+        printk(XENLOG_ERR "scmi: chosen node not found\n");
+        return -ENOENT;
+    }
+
+    prop =3D dt_get_property(chosen_node, SCMI_SECONDARY_AGENTS, &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING "scmi: No %s property found\n",
+               SCMI_SECONDARY_AGENTS);
+        return -ENODEV;
+    }
+
+    if ( len % (3 * sizeof(uint32_t)) )
+    {
+        printk(XENLOG_ERR "scmi: Invalid length of %s property: %d\n",
+               SCMI_SECONDARY_AGENTS, len);
+        return -EINVAL;
+    }
+
+    for ( i =3D 0; i < len / (3 * sizeof(uint32_t)); i++ )
+    {
+        uint32_t agent_id =3D be32_to_cpu(*prop++);
+        uint32_t smc_id =3D be32_to_cpu(*prop++);
+        uint32_t shmem_phandle =3D be32_to_cpu(*prop++);
+        struct dt_device_node *node =3D dt_find_node_by_phandle(shmem_phan=
dle);
+        u64 addr, size;
+        int ret;
+
+        if ( !node )
+        {
+            printk(XENLOG_ERR "scmi: Could not find shmem node for agent %=
d\n",
+                   agent_id);
+            return -EINVAL;
+        }
+
+        ret =3D dt_device_get_address(node, 0, &addr, &size);
+        if ( ret )
+        {
+            printk(XENLOG_ERR
+                   "scmi: Could not read shmem address for agent %d: %d",
+                   agent_id, ret);
+            return ret;
+        }
+
+        if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+        {
+            printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+            return -EINVAL;
+        }
+
+        ret =3D PTR_RET(smc_create_channel(agent_id, smc_id, addr));
+        if ( ret )
+        {
+            printk(XENLOG_ERR "scmi: Could not create channel for agent %d=
: %d",
+                   agent_id, ret);
+            return ret;
+        }
+
+        printk(XENLOG_DEBUG "scmi: Agent %d SMC %X addr %lx\n", agent_id,
+               smc_id, addr);
+    }
+
+    return 0;
+}
+
+static int scmi_domain_init(struct domain *d,
+                            struct xen_domctl_createdomain *config)
+{
+    struct scmi_channel *channel;
+    int ret;
+
+    if ( !scmi_data.initialized )
+        return 0;
+
+    /*
+     * Special case for Dom0 - the SCMI support is enabled basing on
+     * "dom0_sci_agent_id" Xen command line parameter
+     */
+    if ( is_hardware_domain(d) )
+    {
+        if ( opt_dom0_scmi_agent_id !=3D SCMI_AGENT_ID_INVALID )
+        {
+            config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_S=
MC_MA;
+            config->arch.arm_sci_agent_id =3D opt_dom0_scmi_agent_id;
+        }
+        else
+            config->arch.arm_sci_type =3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
+    }
+
+    if ( config->arch.arm_sci_type =3D=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE )
+        return 0;
+
+    channel =3D acquire_scmi_channel(d, config->arch.arm_sci_agent_id);
+    if ( IS_ERR(channel) )
+    {
+        printk(XENLOG_ERR
+               "scmi: Failed to acquire SCMI channel for agent_id %u: %ld\=
n",
+               config->arch.arm_sci_agent_id, PTR_ERR(channel));
+        return PTR_ERR(channel);
+    }
+
+    printk(XENLOG_INFO
+           "scmi: Acquire channel id =3D 0x%x, domain_id =3D %d paddr =3D =
0x%lx\n",
+           channel->agent_id, channel->domain_id, channel->paddr);
+
+    /*
+     * Dom0 (if present) needs to have an access to the guest memory range
+     * to satisfy iomem_access_permitted() check in XEN_DOMCTL_iomem_permi=
ssion
+     * domctl.
+     */
+    if ( hardware_domain && !is_hardware_domain(d) )
+    {
+        ret =3D iomem_permit_access(hardware_domain, paddr_to_pfn(channel-=
>paddr),
+                                  paddr_to_pfn(channel->paddr + PAGE_SIZE =
- 1));
+        if ( ret )
+            goto error;
+    }
+
+    d->arch.sci_data =3D channel;
+    d->arch.sci_enabled =3D true;
+
+    return 0;
+
+error:
+    relinquish_scmi_channel(channel);
+    return ret;
+}
+
+int scmi_domain_sanitise_config(struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_NONE &&
+         config->arch.arm_sci_type !=3D XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC=
_MA )
+    {
+        dprintk(XENLOG_INFO, "scmi: Unsupported ARM_SCI type\n");
+        return -EINVAL;
+    }
+    else if ( config->arch.arm_sci_type =3D=3D
+              XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA &&
+              config->arch.arm_sci_agent_id =3D=3D 0 )
+    {
+        dprintk(XENLOG_INFO,
+                "scmi: A zero ARM SCMI agent_id is not supported\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int scmi_relinquish_resources(struct domain *d)
+{
+    int ret;
+    struct scmi_channel *channel, *agent_channel;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_reset_agent_cfg_a2p tx;
+
+    if ( !d->arch.sci_data )
+        return 0;
+
+    agent_channel =3D d->arch.sci_data;
+
+    spin_lock(&agent_channel->lock);
+    tx.agent_id =3D agent_channel->agent_id;
+    spin_unlock(&agent_channel->lock);
+
+    channel =3D get_channel_by_id(HYP_CHANNEL);
+    if ( !channel )
+    {
+        printk(XENLOG_ERR
+               "scmi: Unable to get Hypervisor scmi channel for domain %d\=
n",
+               d->domain_id);
+        return -EINVAL;
+    }
+
+    hdr.id =3D SCMI_BASE_RESET_AGENT_CONFIGURATION;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    tx.flags =3D 0;
+
+    ret =3D do_smc_xfer(channel, &hdr, &tx, sizeof(tx), NULL, 0);
+    if ( ret =3D=3D -EOPNOTSUPP )
+        return 0;
+
+    return ret;
+}
+
+static void scmi_domain_destroy(struct domain *d)
+{
+    struct scmi_channel *channel;
+
+    if ( !d->arch.sci_data )
+        return;
+
+    channel =3D d->arch.sci_data;
+    spin_lock(&channel->lock);
+
+    relinquish_scmi_channel(channel);
+    printk(XENLOG_DEBUG "scmi: Free domain %d\n", d->domain_id);
+
+    d->arch.sci_data =3D NULL;
+    d->arch.sci_enabled =3D true;
+
+    spin_unlock(&channel->lock);
+}
+
+static bool scmi_handle_call(struct cpu_user_regs *regs)
+{
+    uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
+    struct scmi_channel *agent_channel;
+    struct domain *d =3D current->domain;
+    struct arm_smccc_res resp;
+    bool res =3D false;
+
+    if ( !sci_domain_is_enabled(d) )
+        return false;
+
+    agent_channel =3D d->arch.sci_data;
+    spin_lock(&agent_channel->lock);
+
+    if ( agent_channel->func_id !=3D fid )
+    {
+        res =3D false;
+        goto unlock;
+    }
+
+    arm_smccc_1_1_smc(fid,
+                      get_user_reg(regs, 1),
+                      get_user_reg(regs, 2),
+                      get_user_reg(regs, 3),
+                      get_user_reg(regs, 4),
+                      get_user_reg(regs, 5),
+                      get_user_reg(regs, 6),
+                      get_user_reg(regs, 7),
+                      &resp);
+
+    set_user_reg(regs, 0, resp.a0);
+    set_user_reg(regs, 1, resp.a1);
+    set_user_reg(regs, 2, resp.a2);
+    set_user_reg(regs, 3, resp.a3);
+    res =3D true;
+unlock:
+    spin_unlock(&agent_channel->lock);
+
+    return res;
+}
+
+static const struct sci_mediator_ops scmi_ops =3D {
+    .domain_init =3D scmi_domain_init,
+    .domain_destroy =3D scmi_domain_destroy,
+    .relinquish_resources =3D scmi_relinquish_resources,
+    .handle_call =3D scmi_handle_call,
+    .dom0_dt_handle_node =3D scmi_dt_handle_node,
+    .dom0_dt_finalize =3D scmi_dt_finalize,
+    .domain_sanitise_config =3D scmi_domain_sanitise_config,
+    .assign_dt_device =3D scmi_dt_assign_device,
+};
+
+static int __init scmi_check_smccc_ver(void)
+{
+    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
+    {
+        printk(XENLOG_WARNING
+               "scmi: No SMCCC 1.1 support, SCMI calls forwarding disabled=
\n");
+        return -ENOSYS;
+    }
+
+    return 0;
+}
+
+static __init int scmi_probe(struct dt_device_node *scmi_node, const void =
*data)
+{
+    u64 addr, size;
+    int ret, i;
+    struct scmi_channel *channel, *agent_channel;
+    int n_agents;
+    scmi_msg_header_t hdr;
+    struct scmi_msg_base_attributes_p2a rx;
+
+    ASSERT(scmi_node !=3D NULL);
+
+    INIT_LIST_HEAD(&scmi_data.channel_list);
+    spin_lock_init(&scmi_data.channel_list_lock);
+
+    if ( !acpi_disabled )
+    {
+        printk(XENLOG_WARNING "scmi: is not supported when using ACPI\n");
+        return -EINVAL;
+    }
+
+    ret =3D scmi_check_smccc_ver();
+    if ( ret )
+        return ret;
+
+    if ( !dt_property_read_u32(scmi_node, "arm,smc-id", &scmi_data.func_id=
) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read smc-id from DT\n");
+        return -ENOENT;
+    }
+
+    /* save shmem phandle and re-use it fro Dom0 DT shmem node */
+    if ( !dt_property_read_u32(scmi_node, "shmem", &scmi_data.shmem_phandl=
e) )
+    {
+        printk(XENLOG_ERR "scmi: unable to read shmem phandle from DT\n");
+        return -ENOENT;
+    }
+
+    ret =3D scmi_dt_read_hyp_channel_addr(scmi_node, &addr, &size);
+    if ( IS_ERR_VALUE(ret) )
+        return -ENOENT;
+
+    if ( !IS_ALIGNED(size, SCMI_SHMEM_MAPPED_SIZE) )
+    {
+        printk(XENLOG_ERR "scmi: shmem memory is not aligned\n");
+        return -EINVAL;
+    }
+
+    scmi_data.dt_dev =3D scmi_node;
+
+    channel =3D smc_create_channel(HYP_CHANNEL, scmi_data.func_id, addr);
+    if ( IS_ERR(channel) )
+        goto out;
+
+    ret =3D map_channel_memory(channel);
+    if ( ret )
+        goto out;
+
+    channel->domain_id =3D DOMID_XEN;
+
+    hdr.id =3D SCMI_BASE_PROTOCOL_ATTIBUTES;
+    hdr.type =3D 0;
+    hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+    ret =3D do_smc_xfer(channel, &hdr, NULL, 0, &rx, sizeof(rx));
+    if ( ret )
+        goto error;
+
+    n_agents =3D SCMI_FIELD_GET(SCMI_BASE_ATTR_NUM_AGENT, rx.attributes);
+    printk(XENLOG_DEBUG "scmi: Got agent count %d\n", n_agents);
+
+    ret =3D collect_agents(scmi_node);
+    if ( ret )
+        goto error;
+
+    i =3D 1;
+
+    list_for_each_entry(agent_channel, &scmi_data.channel_list, list)
+    {
+        struct scmi_msg_base_discover_agent_p2a da_rx;
+        struct scmi_msg_base_discover_agent_a2p da_tx;
+
+        ret =3D map_channel_memory(agent_channel);
+        if ( ret )
+            goto error;
+
+        hdr.id =3D SCMI_BASE_DISCOVER_AGENT;
+        hdr.type =3D 0;
+        hdr.protocol =3D SCMI_BASE_PROTOCOL;
+
+        da_tx.agent_id =3D agent_channel->agent_id;
+
+        ret =3D do_smc_xfer(agent_channel, &hdr, &da_tx, sizeof(da_tx), &d=
a_rx,
+                          sizeof(da_rx));
+        if ( agent_channel->domain_id !=3D DOMID_XEN )
+            unmap_channel_memory(agent_channel);
+        if ( ret )
+            goto error;
+
+        printk(XENLOG_DEBUG "id=3D0x%x name=3D%s\n", da_rx.agent_id, da_rx=
.name);
+
+        agent_channel->agent_id =3D da_rx.agent_id;
+
+        if ( i > n_agents )
+            break;
+
+        i++;
+    }
+
+    ret =3D sci_register(&scmi_ops);
+    if ( ret )
+    {
+        printk(XENLOG_ERR "SCMI: mediator already registered (ret =3D %d)\=
n",
+               ret);
+        return ret;
+    }
+
+    scmi_data.initialized =3D true;
+    goto out;
+
+error:
+    unmap_channel_memory(channel);
+    free_channel_list();
+out:
+    return ret;
+}
+
+static const struct dt_device_match scmi_smc_match[] __initconst =3D {
+    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
+    { /* sentinel */ },
+};
+
+DT_DEVICE_START(scmi_smc_ma, "SCMI SMC MEDIATOR", DEVICE_FIRMWARE)
+        .dt_match =3D scmi_smc_match,
+        .init =3D scmi_probe,
+DT_DEVICE_END
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 095b1a23e3..30e46de6d7 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -329,6 +329,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
=20
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
+#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC_MA  2
=20
 struct xen_arch_domainconfig {
     /* IN/OUT */
@@ -355,6 +356,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t arm_sci_agent_id;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
=20
--=20
2.34.1

