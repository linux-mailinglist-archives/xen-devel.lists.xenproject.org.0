Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2AB0D876
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 13:42:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052278.1420890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNS-0002To-JH; Tue, 22 Jul 2025 11:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052278.1420890; Tue, 22 Jul 2025 11:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBNS-0002RS-Dn; Tue, 22 Jul 2025 11:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1052278;
 Tue, 22 Jul 2025 11:41:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibko=2D=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1ueBNQ-0002RD-Dg
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 11:41:44 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d68e3cfb-66f0-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 13:41:42 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by VI2PR03MB10809.eurprd03.prod.outlook.com (2603:10a6:800:272::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 11:41:37 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.8943.025; Tue, 22 Jul 2025
 11:41:37 +0000
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
X-Inumbo-ID: d68e3cfb-66f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZ3+LMMJBrju9/W3FL2ms/ws2baTIcCCdZe4BMug1BOr7Eh2Hi2CcgJIimfdYqWnIOxrsIi/E/160c4qf4Kh7uWIPOkUy4ndp0oRZZSwV2gZgSmwcbw1rZgV63H+FSn8tW2ixK3GNMRYziIkcmVCZri5Y6aKZdmI4PU1VYlItp2GpLQvJobHZjTEguyJVgwLF/l9SVfyO1t/hWpOMO4lrde2W5MhVCZ1refW1rhk3Wx7Af7EF1VdMc8AAMKyFp+YmN01Wf8yR5c14qV6RIf1BBsuR9umB3hU0YI6XQ0FLPLSDwUWnQHGj/eovwMNjo9VYIxSHwL+Z9opqErkpeUhFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/L2ocVouHgCkKmG9kikSQ4qW/LXXRvS2zSFG7NETu8=;
 b=FG+6S8FIFFX3c/LtBVUF3Gr+o0nuP1kE0jAJHyY//3Y9lbE/0ozV/FvmcsZqZrm9CUm1BHYlLIkD+pj0mfvjPp/ukVixNA+PDDxFDs8xoSRxuu50nPE474ovEjffyQE0OfdbHs7MfG0DYrCrD3aER22hs8SMuozrfW0aSja4Tq54QiChTf+NUunddH3Gmo1Zk7wOLBXExO8klquU9zZ++L521wyjMr8DX6Cdw3+qQ/OOaX1anZsTfj0qcgGqdIE3QjvBJXFQjcdh/8/zVEz035XaAVSousFlCJVb4ID448VXCCIVZ5dGX2QloXmtazlp8KBg6sysjUGnwYIu2hrlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/L2ocVouHgCkKmG9kikSQ4qW/LXXRvS2zSFG7NETu8=;
 b=rl1fssRO8neQ99B9V3zL6ksddwVGIx/HNy8jg8JySixTWkpr6UKlLzfM0wbn03maIg/qds/Oe/MPwJQSBxKHmCV9BVoEtLid4FLBqUkFR+5Fs+zErM3nLKd4yAX0LOXgmZvlQzuI0cgwUXGmaVwT1d4BsGp87ql9rHQq0tWKUZ9IIm7jF7eSMhuEOzOcW4OydAfXhIYvah3Fi0R7rn2PqerDvc1m6Sd7zYJhCUJLUHrbPasyNoxQCaNbU4iIlzAbV1GHgM4XcZeqpPOwurm/0Gu1AeLK894PmY9TpM71bVrKYW/96ZnqLBbBPeEvD/cFu2gf8hLRno7iAYa2NOObiA==
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
Subject: [RFC PATCH v5 00/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
Thread-Topic: [RFC PATCH v5 00/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent support
Thread-Index: AQHb+v2VYJM++98Y2ku7DWB5wHJSnw==
Date: Tue, 22 Jul 2025 11:41:37 +0000
Message-ID: <cover.1753184487.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|VI2PR03MB10809:EE_
x-ms-office365-filtering-correlation-id: 04089d94-ac99-4afd-4272-08ddc914b7ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MCZ95R/3sEX2NSyBMAxRwEgCbIYe3vrR9PwA6hBRCXbINfLFNxCXGVZjK6?=
 =?iso-8859-1?Q?zOU4rlXzJa8GAB66gyaS/ocWHu8N5xgpZRVVSs8UA2//V3B8vP3sjMkfHr?=
 =?iso-8859-1?Q?J+JRGIhn5ufpOR1x1UC3z4Sqs+ksDirXNni8q+YaJ3c6d6i3W7f8kKrqWw?=
 =?iso-8859-1?Q?bfh2d9PlFqxzTVxkE4yCNgVs6GHC2X7PicezsKs3tIc6n65IBXR0MmPYPP?=
 =?iso-8859-1?Q?Z+o8Ot0vLuNj9nvjt/XLluy4j5e6GvcukDJnFDPSBYXSFi8IDLywvi3T4y?=
 =?iso-8859-1?Q?StUGqLtY2uP2m/vmI8+kgugNmoxK2WImTje/SxmFgTId2UnvtoeKUyvZPf?=
 =?iso-8859-1?Q?P8UsbDtU1tBqyY5sddCTdmHTRL4GFkVO8K2qyOdTjmqn+UP1PmGJBgoYI/?=
 =?iso-8859-1?Q?bLubNnbzEdFdjF5h7rfYOe3Iaj0wjvQF9OXDXZmYNKwX0REU/rkPtbC+AV?=
 =?iso-8859-1?Q?pmfP743YepZ2hx7ouoeVVhDKsexa0bXLTEnTf58b0yz+5guqCMI+oK/fSE?=
 =?iso-8859-1?Q?nUtNuNYpr0CVUjDzBYwrxvlFfunI90QdxKOwkYv477MJSanz9OVCaiFrpr?=
 =?iso-8859-1?Q?y88AgQLtOU4cMzWPnN9i8DSYzqr8GJUQuJ4amssmF6ckY5rNQy/F3LxAB9?=
 =?iso-8859-1?Q?gwSGw3Cou7z92AIj+rC46l16kZ1hO52HdDQkWfnoLI21qeAK7NlodnrTB4?=
 =?iso-8859-1?Q?YZJvPdNmL02G/BUox+FELdTdVCzNFLoolYvB23PsY8ZOMJxo4fdev0U9Vh?=
 =?iso-8859-1?Q?MI0jV+esZ1PRkiI/6a4dSUaBS4PcEe8V0xByCU5EHD+squtCxPfYb/g8Gt?=
 =?iso-8859-1?Q?hZb2dzYX5CIhoZ2Ndbpo6adkW6CSZvO6lGesPqjbdm6c+Xjlhhy+DiRSzT?=
 =?iso-8859-1?Q?7e14EdgEP6nkL6umh7QwLzw8cPpmLeH9vmlupYHTik9Jei5OcHE+SOLgR5?=
 =?iso-8859-1?Q?ooaTwRPlew4y6c7M3a8lC/JzQNeeGGPqCNzzpi9mjLmWZfo6kqqscFLnm9?=
 =?iso-8859-1?Q?EH8e/Fw2FyLYjEoPH3CdQIFqSJbe5AELfc5vNaJTexp4THnCpfD+Qznh3v?=
 =?iso-8859-1?Q?CmmyyADbpM4tpM7hirpWJKon56zrgDzphz9lWFQHrLnrb+GxVEUMmr79v8?=
 =?iso-8859-1?Q?9wBP/zElCX9JpRt6mX8S9Tkog2ZLUJbi4wXiwzF1Ya1h8OhHW4hIPzDABw?=
 =?iso-8859-1?Q?J+mIdaFKDp0wURhsE6MYrD0y56PgOdP9DJIqMrgAXQ8iIW7v41QVwdpdCv?=
 =?iso-8859-1?Q?ka4IdUtO3jonnIWeCO1pwgRri28vKN0cq/a3nyZyXWbNJXJsMfA66lfOTC?=
 =?iso-8859-1?Q?PQ3IkG5IWOY3oQbHrLzdJ0lfxGtvynMyiXezKzuA/sVV2aahdWUUe10n3k?=
 =?iso-8859-1?Q?xan59rNnbMXGkgXNbyNJwx1MHlIuGA328pK7d4/RacT0Y4RMUvrJkpnUuv?=
 =?iso-8859-1?Q?p2m+Bzltv+5fi9Ji9DoHPCS5MUPiOkNoSHPsYFaHOAhBCbkHH1EOop52Sk?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TTL8Vd+0PstRR1qJ2ePs4bAgQvuZLeURGR5wt6tQ2n/23MjKrRWamcg9AF?=
 =?iso-8859-1?Q?zEp5hXbY6SUqigh8LlaOOi3JoQAXVVNaeCc/XeRLnntVdRUv76ekTvJt8l?=
 =?iso-8859-1?Q?0gXlYLZz7tt58/VLdGA2ma+24CG8c0P/ENp+TKin+X1V4eEHvNP95AVoKk?=
 =?iso-8859-1?Q?H/KQmFquqYKrh+iHFhctFA6SuDQnXZEUG3p4J2qrd7dMP6UCVL9CL1MEML?=
 =?iso-8859-1?Q?KkLV47zD2Nv/Hqj5NqQhLgjRpp3I04tfohDmmH835nMEpy3U/DiqaODLl7?=
 =?iso-8859-1?Q?pCwzUr5B8YLgzKtXJLe/JySLAiGX8Jjbxh7Lh/PG2hKfySZnWOkCcgR6LU?=
 =?iso-8859-1?Q?nAKFx7+6LD4ZZSCo6mKQkIvljodz5QFRiP4abo0tPKCU1xBAzGEM93Mh1J?=
 =?iso-8859-1?Q?KrEV09mUQ2rDCjvO0QL0hUOjzoxnAtDEIJPg7NC8Vi9zvIgHBk0ztbrP3P?=
 =?iso-8859-1?Q?/xovxqClEsoPWFjGS5UqsN/XtY/jSIHUQC5co+T5ybHIEGKhxwNdWlQqUC?=
 =?iso-8859-1?Q?mHgJmG/jSIsFkNuzssaMVZocQb1XmKvwq0LcpR76JNiLoOvfqc7O1NTavz?=
 =?iso-8859-1?Q?cPJvl10JbMjZvlxYEz3RvRDZ+NisYQbXbH5oYu9WuoF6icHJU+1InrsXn6?=
 =?iso-8859-1?Q?jLKJEimG8JCVUM6HJRbotJltk9Sa4hhmP8eF4r7D72KWAW5ZZuGXJzityE?=
 =?iso-8859-1?Q?57vQDb2716qrqnG4t2ctJY4EEP0WRKkOq2lqfZIRyiRIaTa6p9IP4eXIno?=
 =?iso-8859-1?Q?NHbZCORpu66NvqjLVcG/59NG/CBnsOCsw5bZEnPLTsq+79h20Fpdcjk31o?=
 =?iso-8859-1?Q?OQi0bfJpZ1fpmyT+yOr+HJbb3+t3JYn+kMZTZGBtToeBa3pas7n82AvHip?=
 =?iso-8859-1?Q?TzRgFIgs/AIYSWNfcVsNKL5Qj+Tihu0lE1yaFSlf8xX0dmDhomc9YakbXG?=
 =?iso-8859-1?Q?kVwzF3MalftbrL8viYIFLqCHF5n7ScwCeZQMT++fGVjBj9t85bnTOvcVZt?=
 =?iso-8859-1?Q?8RIvyaU0fH3g/+EkZFk/mPtMLTB/bcqlWrZvAp1XJFOBeT0NId8GgdiM3B?=
 =?iso-8859-1?Q?My8Htsemz3HfH8SouHfH0FrvgxjYr5GRVgRMAvEQnF2PwVCcRf2H9AYjSv?=
 =?iso-8859-1?Q?gosz8MtMmzgbuRSBxj4BWhWtise8GyD+7u+2bfGFFIPFF0EgSi7fh9Wwcb?=
 =?iso-8859-1?Q?YMC5r7vBtbV4yVk4LZ8qQBecSRLKYKfKyT4pg1TvWhnmzuHRysc8pqMKiX?=
 =?iso-8859-1?Q?rEpM8IoJiDjs0JN/IsQuEYSwlf4dzZ3rO+NOnK226uPJtzik+GkTiPp1g0?=
 =?iso-8859-1?Q?4f6ezip867UrHCnLmU/rS3bCdjt7tx0nqjEENgWqLsl/qYFi12Ukq2BLdm?=
 =?iso-8859-1?Q?QasvSaPC9DpleKVQ/1z1k5s5ClR6u32G/BpIsRd+WEyb6qbVxeAJmCAKOT?=
 =?iso-8859-1?Q?INGiHn9r5HCF34fYNm0QO+/5PnGFtIS4qwH/xY2Pd4LRDzp+kaW2l4gc4j?=
 =?iso-8859-1?Q?YV7RKkiC2bOP5vBYMZyRV5L06G3y+BYLkbQplJqtB9Zq0ZaU8tVPm2K9Fn?=
 =?iso-8859-1?Q?a3QWLk8EBTC1O+wmhdna/tyGGvmjgROJDjFIO/7G/+kM+X17TLtF6xhKEl?=
 =?iso-8859-1?Q?5HTEWKC+oJraDnoOyRaaH3VHDbvkZ9GCOmZo65WsjJxankVo+RLPxD1g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04089d94-ac99-4afd-4272-08ddc914b7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2025 11:41:37.4901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMiD1rPA8Ps9v9IvDKsQwmolLqupLf1jbkyZkC/bjpu+Gx/qywiembxt3D5y0PesZYJAeb35yUg8+VTnySXunGaYVJPd43O5jMFmNctyqM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10809

Inroducing V4 RFC patch series  on top of the Xen version 4.20-rc2
which includes implementation of the SCI SCMI SMC multi-agent support.

Patch 1 "xen/arm: add generic SCI subsystem"
- rebased and refactored
- introduced DEVICE_ARM_SCI DT device class and used for SCI drivers probin=
g
instead of custom,
  linker sections based implementation.
- added SCI API for Dom0 DT handling, instead of manipulating with ARM arch
dom0 code directly.
- RFC changes in XEN_DOMCTL_assign_device OP processing
- Introduce arch_handle_passthrough_prop call to handle arm specific
nodes

Patch 2 "xen/arm: scmi-smc: update to be used under sci subsystem"
- update driver introduced by commit 3e322bef8bc0 ("xen/arm: firmware: Add =
SCMI
over SMC calls
handling layer") be used under sci subsystem.
- no functional changes in general

Patch 3 "xen/arm: scmi-smc: passthrough SCMI SMC to guest domain
This is new change which allows passthrough SCMI SMC, single agent interfac=
e to
guest domain
cover use case "thin Dom0 with guest domain, which serves as Driver domain"=
.
See patch commit message for full description.

Patch 4 - docs: arm: add docs for SCMI over SMC calls forwarding
driver
- add documentation section for Simple Arm SCMI over SMC/HVC calls
forwarding driver.

Patch 6 - xen/domctl: extend XEN_DOMCTL_assign_device to handle not
only iommu
- add chainged handling of assigned DT devices to support
access-controller functionality through SCI framework.
Change was done in two parts:
 - update iommu_do_dt_domctl() to check for dt_device_is_protected()
 and not fail if DT device is not protected by IOMMU
 -add chained call to sci_do_domctl() to do_domctl()

Patch 9 - xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver
- added "scmi-secondary-agents" and "#scmi-secondary-agent-cells"
  property to "xen,config" node in "chosen" to inform SCI SCMI
  multi-agent driver about available agents and their
  configuration. It defines <agent_id> to <smc-id,scmi_shm> map.
  This option is Xen specific as Xen is the only one entry in the
  system which need to know about SCMI multi-agent support and configuratio=
n.
- each guest using SCMI should be configured with SCMI agent_id, so SCMI
  FW can implement Agent-specific permission policy.
  -- dom0: dom0_scmi_agent_id=3D<agent_id> in Xen command line option
  -- toolstack: arm_sci =3D "type=3Dscmi_smc_multiagent,agent_id=3D<agent_i=
d>"
  -- dom0less: "xen,sci_type", "xen,sci_agent_id" properties in
"xen,domain" nodes.
- factored out SCMI generic definitions (re-usable)
- factored out SCMI shmem code (re-usable)
- the SCMI passthrough configuration for guest domains is similar to any ot=
her
HW passthrough cfg.

Patch 10 - docs: arm: add SCI SCMI SMC multi-agent driver docs
- add SCI SCMI SMC multi-agent driver documentation.

Add separate SCMI DT node for Xen management agent under "xen,config"
node under chosen.

All Xen-specific configuration provided under "/chosen" node. This
approach allows to isolate modifications to Host DT only under
"/chosen" node.

This approach provides the following device tree (DT)
parameters (placed under xen,config node):

- "scmi-secondary-agents": A Xen-specific parameter under the
  "/chosen" node, which describes the SCMI agent configuration for
  the domains.
- the SCMI configuration for Xen (privileged agent) and the shared
  memory configuration for all agents are provided under the "/chosen"
  node and are used strictly by Xen for its initial configuration.
- the scmi_shm and SCMI configuration for Dom0 are placed in the
  "/firmware/scmi" node so that they can be moved to Dom0 without
  any changes.

This configuration allows the use of Xen-specific nodes to provide
information strictly needed by Xen while using the default SCMI
configuration for Dom0 and other domains. As a result, no additional
bindings need to be introduced to the device tree.
This simplifies the Xen SCMI multi-agent configuration and utilizes
generic device tree bindings for the domains.

NOTE: Haven't added RB tags for patch 1 and 2 because rebase and some
minor changes were done.

Code can be found at:
https://github.com/oleksiimoisieiev/xen/tree/scmi_upstrv5

[1] RFC v2:
http://patchwork.kernel.org/project/xen-devel/cover/cover.1644341635.git.ol=
eksii_moisieiev@epam.com/
[2] RFC v3:
https://patchwork.kernel.org/project/xen-devel/patch/20250311111618.1850927=
-1-grygorii_strashko@epam.com
SCMI spec:
https://developer.arm.com/documentation/den0056/e/?lang=3Den

SCMI bindings:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/access-controllers/access-controllers.ya=
ml

Reference EL3 FW:
RPI5: https://github.com/xen-troops/arm-trusted-firmware/commits/rpi5_dev/
Renesas v4h:
https://github.com/GrygiriiS/arm-trusted-firmware/commits/rcar_gen4_v2.7_v4=
x-scmi_upd/

base-commit: dbe60f244c (Update Xen to 4.21, 2025-02-21)

Changes in v5:
- update Maintainers file. Set role as a Reviewer
- rebased on the latest master branch
- Introduce arch_handle_passthrough_prop call to handle arm specific nodes
- rename dom0_scmi_smc_passthrough to scmi_smc_passthrough
- rename dom0_scmi_smc_passthrough in documentation
- set error code to -ENXIO when iommu is disabled
- return -EINVAL if mediator without assign_dt_device was provided
- invert return code check for iommu_do_domctl in
XEN_DOMCTL_assign_device domctl processing to make cleaner code
- change -ENOTSUPP error code to -ENXIO in sci_do_domctl
- handle -ENXIO return comde of iommu_do_domctl
- leave !dt_device_is_protected check in iommu_do_dt_domctl to make
code work the same way it's done in "handle_device" call while
creating hwdom(dom0) and "handle_passthrough_prop" call for dom0less
creation
- drop return check from sci_assign_dt_device call as not needed
- do not return EINVAL when addign_dt_device is not set. That is
because this callback is optional and not implemented in single-agent drive=
r
- move memcpy_toio/fromio to the generic place
- fix device-tree example format in booting.txt, added ";" after "}".
- update define in scmi-proto.h
- update define in scmi-shmem.h file
- scmi_assign_device - do not ignore -EOPNOTSUPP return
code of the do_smc_xfer
- remove overwriting agent_channel->agent_id after
SCMI_BASE_DISCOVER_AGENT call
- add multi-agent files to the MAINTAINERS
- add SCMI multi-agent description to the SUPPORT.md
- handle ARM_SMCCC_INVALID_PARAMETER return code and return -EINVAL
for smc call
- updated collect_agents function. Set agent_id parameter as optional
in scmi-secondary-agents device-tree property
- introduce "#scmi-secondary-agents-cells" parameter to set if
agent_id was provided
- reanme xen,scmi-secondary-agents property to scmi-secondary-agents
- move memcpu_toio/fromio for the generic place
- update Xen to get management channel from /chosen/xen,config node
- get hypervisor channnel from node instead of using hardcoded
- update handling scmi and shmem nodes for the domain
- Set multi-agent driver to support only Arm64
- rework multi-agent driver to leave Host Device-tree unmodified

Changes in v4:
- fix SPDX-License
- rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
- move XEN_DOMCTL_assign_device code in separate patch
- Add documentation for SCI SCMI drivers
- xl.cfg doc
- fix comments from Stefano Stabellini
- fix toolstack code as sugested by Anthony PERARD
  - use MATCH_OPTION()
  - move arm_sci struct and cfg params in "arch_arm"
- add SCMI passthrough for dom0less case
- toolstack comments from Anthony PERARD
- added dom0less support
- added doc for "xen,scmi-secondary-agents"

Grygorii Strashko (5):
  xen/arm: scmi-smc: update to be used under sci subsystem
  xen/arm: scmi-smc: passthrough SCMI SMC to domain, single agent
  docs: arm: add docs for SCMI over SMC calls forwarding driver
  xen/domctl: extend XEN_DOMCTL_assign_device to handle not only iommu
  docs: arm: add SCI SCMI SMC multi-agent driver docs

Oleksii Moisieiev (5):
  xen/arm: add generic SCI subsystem
  drivers: iommu: change error code when iommu is disabled
  xen: arm: smccc: add INVALID_PARAMETER error code
  lib/arm: Add I/O memory copy helpers
  xen/arm: scmi: introduce SCI SCMI SMC multi-agent driver

 MAINTAINERS                                   |  10 +
 SUPPORT.md                                    |  11 +
 .../arm/firmware/arm-scmi.rst                 | 516 +++++++++++
 docs/hypervisor-guide/arm/index.rst           |   9 +
 docs/hypervisor-guide/index.rst               |   1 +
 docs/man/xl.cfg.5.pod.in                      |  47 +
 docs/misc/arm/device-tree/booting.txt         | 103 +++
 docs/misc/xen-command-line.pandoc             |  18 +
 tools/include/libxl.h                         |   5 +
 tools/libs/light/libxl_arm.c                  |  18 +
 tools/libs/light/libxl_types.idl              |  12 +
 tools/xl/xl_parse.c                           |  48 ++
 xen/arch/arm/device.c                         |   5 +
 xen/arch/arm/dom0less-build.c                 |  51 ++
 xen/arch/arm/domain.c                         |  12 +-
 xen/arch/arm/domain_build.c                   |  11 +-
 xen/arch/arm/firmware/Kconfig                 |  37 +-
 xen/arch/arm/firmware/Makefile                |   2 +
 xen/arch/arm/firmware/sci.c                   | 189 +++++
 xen/arch/arm/firmware/scmi-proto.h            | 164 ++++
 xen/arch/arm/firmware/scmi-shmem.c            | 112 +++
 xen/arch/arm/firmware/scmi-shmem.h            |  45 +
 xen/arch/arm/firmware/scmi-smc-multiagent.c   | 803 ++++++++++++++++++
 xen/arch/arm/firmware/scmi-smc.c              | 191 ++++-
 xen/arch/arm/include/asm/domain.h             |   5 +
 xen/arch/arm/include/asm/firmware/sci.h       | 214 +++++
 xen/arch/arm/include/asm/firmware/scmi-smc.h  |  41 -
 xen/arch/arm/include/asm/smccc.h              |   1 +
 xen/arch/arm/vsmc.c                           |   4 +-
 xen/common/device-tree/dom0less-build.c       |   4 +
 xen/common/domctl.c                           |  19 +
 xen/drivers/passthrough/device_tree.c         |   6 +
 xen/drivers/passthrough/iommu.c               |   2 +-
 xen/include/asm-generic/device.h              |   1 +
 xen/include/asm-generic/dom0less-build.h      |   9 +
 xen/include/public/arch-arm.h                 |   8 +
 xen/include/xen/lib/arm/io.h                  |  15 +
 xen/lib/Makefile                              |   1 +
 xen/lib/arm/Makefile                          |   1 +
 xen/lib/arm/io.c                              |  80 ++
 40 files changed, 2744 insertions(+), 87 deletions(-)
 create mode 100644 docs/hypervisor-guide/arm/firmware/arm-scmi.rst
 create mode 100644 docs/hypervisor-guide/arm/index.rst
 create mode 100644 xen/arch/arm/firmware/sci.c
 create mode 100644 xen/arch/arm/firmware/scmi-proto.h
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.c
 create mode 100644 xen/arch/arm/firmware/scmi-shmem.h
 create mode 100644 xen/arch/arm/firmware/scmi-smc-multiagent.c
 create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
 delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
 create mode 100644 xen/include/xen/lib/arm/io.h
 create mode 100644 xen/lib/arm/Makefile
 create mode 100644 xen/lib/arm/io.c

--=20
2.34.1

