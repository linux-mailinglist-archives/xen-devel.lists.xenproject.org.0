Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E51F714C
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 02:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjXT0-0007MK-VU; Fri, 12 Jun 2020 00:22:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjXSz-0007MF-B7
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 00:22:41 +0000
X-Inumbo-ID: d1dd3dc4-ac42-11ea-b594-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1dd3dc4-ac42-11ea-b594-12813bfff9fa;
 Fri, 12 Jun 2020 00:22:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2oScPt5XwaGY8m7MiYF+9LVJjQiFNMBR0Zy3DwC7SRdQD2t31fbrjjp5kevnCONTZnzA7laXtUHJtqSE1OrlOOG7J8oODaCrA0y1wV/d2g74R6NV2H7ie2NuSfPiwmySo92HOxvq1pMPuoUv36OJn9hZeKkFZIt6qbXuk21RJyH4ez8q2y0ehaxIszumz20Vw1GiyCSY9cOvzSfCP+tfgeqJ15hqcqM0pvwHBo1qx8C8qWoFEshVCMLLaqpX33d74O7jDa82KvCj5BnfcN6DQ+2kD/Eljza52HBKIt3kR5K29ahjnUJIgVN+j6Zj/6nWgB3Xz2TLmzsv2vL151IQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrWui09u+5cIgvpHZOOFv3CDq05Q0coOiwBD2KZRCAg=;
 b=N3iAARi5JebKkoJfrDmi2uNgsj1IrRE1dmZOmekiqPb+z1ZEyqbwlCOBrPzHRN/Ti91SXUwHq+EFID9S/ziO3HwxooJq1HtGnFTAHyVwDr+HZJZ/jLEogKQ19qV4CTJyHbpWXImTP9jGgyPsSAa2o0Pt/zuw57Jw05cpH0chIMMSo/oKgERlmUD2TpBV+CeX3BA+kYvO2+wImqC/nS/zDfQPJFnJTuvmqrEsLE0ZvPEEofCM+ITQLpiir6SpoRn7F8z63vx4/qqeBaLCiBFHx4zuFbmf4Qaj5XfwrUec+c26Nl4kJg2IwMbFhWHQeQEIR+4zDFrk+nRDFfchGqJRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrWui09u+5cIgvpHZOOFv3CDq05Q0coOiwBD2KZRCAg=;
 b=pJVt1+Bg8+yp6+cmDu0pvx40pqo13/6R4KSINhXgHgpTfabRTXgaj24TA7MHHB/KvsUNW9SQSe3WuuXa6rMGFLq54xk15PU87jSDvu0P37XqUlebVuSqzPVWpDCI1bl20w7iIXa9AThn0XY0aM6FEEWRb1Tr+XALp5OW94NvOhNR1BGpcsHnYSLKu73SqJnn5x97b8rNF3oBnB5ijr6oXPdPaFl22dE+1+O9I8XnmigHzI3RQDc5KkMHaYYcPDQpsKMWELBbURgmMAbnqF4RdgOGe1V75ynFhimJPzoaGFtz/0ge3Aeb8vKtXzPbnYX5gcHjMfaxPs21ie7Q2/yLUw==
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 (2603:10a6:803:23::18) by VI1PR0302MB2654.eurprd03.prod.outlook.com
 (2603:10a6:800:e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Fri, 12 Jun
 2020 00:22:36 +0000
Received: from VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75]) by VI1PR0302MB3407.eurprd03.prod.outlook.com
 ([fe80::a01e:c0b1:7174:4c75%5]) with mapi id 15.20.3088.018; Fri, 12 Jun 2020
 00:22:36 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: [RFC PATCH v1 0/6] Fair scheduling
Thread-Topic: [RFC PATCH v1 0/6] Fair scheduling
Thread-Index: AQHWQE+S5leDZ35sk0y6s2xYl7vsow==
Date: Fri, 12 Jun 2020 00:22:35 +0000
Message-ID: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6a8effd-d698-4e8e-51e5-08d80e66b525
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0302MB2654A8455DD32B8873A84D37E6810@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sdsyCNTH72n9uR9BtfcdpARXH2HVEBGjaVgMHoq+j8FgitrYyTP94IHS/DNnYaq0f6iHVB1f4ec2yHqyVPP3XO4gsUA5ePO4smDFtCd8ORwXK2I7CMWzUGBls+ZFMwlRtBsfWHpCq4pkualS89ZDF8VOOO6Sk2SpZqnHcyYYAqxRgeZZ7LYktSj6Kel4WivDliGED2pluVSDS9NK3ciScLTs9wufZS7cy7S5X/dWvZsS4skclVeh8pRZa5uVqjkDg/C3q36lSBA1D0L7sfskDcEWpM3/g1eoH2bhLeTCjtPvE4YEgUA3iVKgg+GL6BwdvHr+E4eDFr4jQOE+pTj4yoUI0ZlPPAC0Yku6fZ5RNNS5ho3uCPX91MDgI2R2qXH9w6ahNB0lkxW3wPumPTx3KQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3407.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(66446008)(966005)(64756008)(478600001)(66946007)(66556008)(76116006)(66476007)(26005)(91956017)(36756003)(8676002)(86362001)(55236004)(186003)(8936002)(4326008)(6506007)(7416002)(54906003)(6512007)(2906002)(6486002)(316002)(5660300002)(83380400001)(6916009)(71200400001)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: nMrvNiwBMYFs+Yra8qvuEnvpQFNwUTqUMB5yIADK7DlJs6Jc5DyDf/J3j8B/jgMB0oTIytyO41THHHVjDKWc8Sl7Do7V47LeIrrH7Kc5sN0q+ASTsvQEOx3my/3j8cR2mtOTby9CBR5FNBU+XQNdSVpRhdRVmexGp9yJYqCnEvtg5C32BOhSIhVuN6HW8sEivq5OLL539+803OP/AI8fJChNhn/rJAOiI/ZgEfzASZNFb2Vm6ijnVm4uhx94UCmM82OHQ7iNLPQwa8XHNm7PvSMac2uGKQ+TE6WHPlhVkMV+zUBCcamTvovHeRUXyMvZu9/tYqDt9SVRq9lmBlbFVm+i6gNRYC3e5bk6qcIcA4b84ZfW3BxSIgW8Jhou59aGhd2NcRvLn/3L6YCJ9/6+GzIrNDCNZdwoyLPjrBw9Y0It4RpywaSPMLLsbRCI0KXnvv773smjmCSm4yNyO5vxwMmcDbKqGwvczToVPgSPnWI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a8effd-d698-4e8e-51e5-08d80e66b525
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 00:22:36.0100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2bgeTHoKzXiG9OEvH2xASuSqbtxwdOapmy6UaZ+5tQuL118Nr4Dt5xMw+6fSi9O8qjKupn7DPWKEP6vfD752yHUz/ewN/kAxKgVg4Bj2L2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2654
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There was number of discussions about fair scheduling, including latest
one at [1].

In a nutshell, schedulers don't know when pCPU is doing guest-related
work or when it is busy with something else, like running
tasklets. All time spent between two calls to schedule() is being
charged to active vCPU, which can be unfair in some cases.

Andrii Anisov tried to overcome this by counting time spent in
different "modes". But his approach was "entry.S-centric". He tried to
guess correct trap reason as early as possible. This was arm-specific
and quite intrusive. On other hand, it theoretically provided more
precise results.

As a result of that discussion with Dario at [1], we came to
conclusion that for in the first approximation we should not charge
guests for time spent in do_IRQ() and in do_softirq().

This patch series does exactly this. It separately collects time for
IRQ handling and for internal hypervisor tasks. Actually, this
separation is not needed for making scheduling decisions, but it can
prove more information to system administrators.

This is minimal implementation, so it supports only x86 and credit2
scheduler. I chose x86 over ARM because more people can try this
patches. This series provide tracing and xentop support as well, to
ease up experimenting.

I'm open to all suggestions, especially for naming things :)

Those patches also can be pulled from my GH account at [2]

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00092.h=
tml
[2] https://github.com/lorc/xen/tree/fair_sched_rfc_v1

Volodymyr Babchuk (6):
  sched: track time spent in IRQ handler
  sched: track time spent in hypervisor tasks
  sched, credit2: improve scheduler fairness
  xentop: collect IRQ and HYP time statistics.
  tools: xentop: show time spent in IRQ and HYP states.
  trace: add fair scheduling trace events

 tools/xenstat/libxenstat/src/xenstat.c      |  12 +++
 tools/xenstat/libxenstat/src/xenstat.h      |   6 ++
 tools/xenstat/libxenstat/src/xenstat_priv.h |   2 +
 tools/xenstat/xentop/xentop.c               |  54 ++++++++--
 tools/xentrace/xenalyze.c                   |  37 +++++++
 xen/arch/arm/irq.c                          |   2 +
 xen/arch/x86/irq.c                          |   2 +
 xen/common/sched/core.c                     | 110 ++++++++++++++++++++
 xen/common/sched/credit2.c                  |   2 +-
 xen/common/sched/private.h                  |  10 ++
 xen/common/softirq.c                        |   2 +
 xen/common/sysctl.c                         |   1 +
 xen/include/public/sysctl.h                 |   4 +-
 xen/include/public/trace.h                  |   5 +
 xen/include/xen/sched.h                     |  29 ++++++
 15 files changed, 265 insertions(+), 13 deletions(-)

--=20
2.27.0

