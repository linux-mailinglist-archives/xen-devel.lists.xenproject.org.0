Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC28216A5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 04:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660539.1030018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKVYM-0004AB-SM; Tue, 02 Jan 2024 03:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660539.1030018; Tue, 02 Jan 2024 03:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKVYM-00047a-P7; Tue, 02 Jan 2024 03:34:54 +0000
Received: by outflank-mailman (input) for mailman id 660539;
 Tue, 02 Jan 2024 03:34:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IX2N=IM=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1rKVYL-00047U-E0
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 03:34:53 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2b84986-a91f-11ee-98ee-6d05b1d4d9a1;
 Tue, 02 Jan 2024 04:34:51 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB9571.eurprd04.prod.outlook.com (2603:10a6:102:24e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 03:34:48 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::ff06:bbb2:c068:5fb3%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 03:34:48 +0000
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
X-Inumbo-ID: e2b84986-a91f-11ee-98ee-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQn6GgkfighoJbZqRNEs2KkyLOsDOy/CbNVOWD9pZe08+lU/q54TcyaSKkP33m8npMePzKbsJnQVevURRO7BMGXjUf98S/ywEL64zxWZ0AbVeDlcMJjaRwY8Ah8MNPjCUR5eBYK0zfQz3d5Ikj+Lmn5qx/XfGYI+DF6ipOYIq1gZnYfVVbkRnZKEiGcGB7qtoBVRQlyj2jLhHwxPJ87F1SEY+g4Z5hahIowMVcSPxvKhh+Fd56A26BEp6sQS6Z+k9vsccCeXXdPcijpkvKnWG7QlzjQeWSmPLyhlzURMsceSOJyHmV6faMxKyBdrg3ubSC/VF/1yPiV9whbQb8jlOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXyV6Bzac3MDIZ10EZTk98WGpEcNSLyE8GxaVCnSTUg=;
 b=gT6RDUaXAi0V1HdGUSuts/cTrGsuLs5yKD6JEQL6Ifcb0u/k3g/jteY2WspWzsLW7PSVtGmOpiMiXDQlArkTHlBpdZ7M8pp1C2yg/XnFcWA/OjhmH8g6qxaa051zEoCMSnDhmUib4J9SAjs8a+0wM+n2Nx1mK8P7DDX5wRwMXLf1A+Z4fFt37tC2eNGUXeFiPkXhtCgPNkTjbgJJm867VleWRBcNLYSpA7MpYe9JvaAdOpcNki8agTw4bNgTYIe0yWr7PDXTVWENN/WeP39axWySzvPUfRzikfI5v159U2ZQeONunU7T1LJIJPYg1IIbAKrPqz7zxI/RYsX9bSGgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXyV6Bzac3MDIZ10EZTk98WGpEcNSLyE8GxaVCnSTUg=;
 b=NKro5KDM2YxFKhqboV8R3PtsYICvETx/VOc3PTY1ZCrF/kwMYk2IZJiWAKPR3uUXY1iBxPo4DQIIJ1WtXoWBQzpcOLsFtvOuxH1UBqkNU/ScaqfRzSl0Z6L7mSmuHAIejcwITtPMKmBXpS0v4iELtLQ+40jJrRJYMexlPA/4gQI=
From: Peng Fan <peng.fan@nxp.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Oleksii Moisieiev
	<oleksii_moisieiev@epam.com>
Subject: XEN virtio question
Thread-Topic: XEN virtio question
Thread-Index: Ado9Jqd+1Kgsx7mlTliX2A2ozl2Qzg==
Date: Tue, 2 Jan 2024 03:34:47 +0000
Message-ID:
 <DU0PR04MB941725CE43965686FD8B9A948861A@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB9571:EE_
x-ms-office365-filtering-correlation-id: 197af49d-2b81-4c0f-4cf8-08dc0b43c532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dBewbvnW7yYRlM7+lTuhqc1uqVgp8hRGSiHYGkF9MmoidW1IC86nseU7QKMBRU25+qHTAoWSXNGGZJ97JyPKph0oOJTPeS3AprmECAGKwjKe/AD19Mg/KgqLPJWD+RGH+9vn2gQnUz648ckvynE7B1H+wZt/Z1GCYjkKMsaZxPszaXKfB9eumBPUIFaIHl2bSuU48bJ3pjjddL9+3NlygwryjV9qYAR1CE7kgUbN91Nrwevr9OrjFkad49yssy3x5ELj5pWRlnWQs5RKesy8anhCYpH4LIahzOdMxRj0YvMV8OrZa0Np34cRgKbKJECyJfNqeNTsWzGfDJfwrEWUSoU5sXcrZplGNFNnSiyyp/Dck8HKAw9HgTCSAmxV3d6i7ADYVHs769yUaY3fz7OCcjMXsKq6ynxgHN0nmYyvyGrm+UED/jf8RK1yaWY4Tq8QqUhjPgsQ3jOWvlbkbif1KWubGtjWg+3YCHdLCWXtOl1uVY0LaO2sff6t+hgX9nGnPJfBqGyDSrwQfyW1qadoSM/LtQ6ChlVBV87JzJmffTyo+BcbXSD0YKNdxhWtHR+0J6irCLgqzRYLQAKGNV6I26OjiKJmbx39hN7hD/WyI5qj/f+tgoGGI1BEDPdhkEZ7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(64756008)(76116006)(66446008)(66476007)(66556008)(66946007)(7116003)(52536014)(44832011)(316002)(110136005)(8676002)(8936002)(26005)(478600001)(71200400001)(9686003)(6506007)(7696005)(5660300002)(2906002)(4744005)(41300700001)(33656002)(38070700009)(122000001)(38100700002)(3480700007)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KSnTt5EjQrYrLOTk2BAXjWDjXfcXpDEf4Qdn0QHQp9CL0OAF7sUhQmMWsiEK?=
 =?us-ascii?Q?PgqK73cEOEQAI/+WdO9J0B1gtvMxCLWsYkTA9af0G5XBSg6vP8GtlzWcfrVE?=
 =?us-ascii?Q?WNcPG68VHlAxs2yZ7u909QzL8AkDTN4lSSLxcK8mXgDJNFG2aC9x9Y/+V9IR?=
 =?us-ascii?Q?GHlPIYxdYArSQLPno5U+R2lyGLfi//p+saMjfe/5WV3SEbG6Kkiqf361kWM/?=
 =?us-ascii?Q?H7Cdn4RU3gGFo2jxG6f978q9Smc1uVWyV5+lPkOOLcZlJzrhOSRk4r6wvgck?=
 =?us-ascii?Q?EHzmaNY/V4I1vJbg5D1FrsRb43MLOiAFomLxixRNZf/w1dBCghlz9eppcnAi?=
 =?us-ascii?Q?QwUWYVYmRv9P+fqSjZw7Z7XLQtlPpOAnTLK4yX+ZlGUUftqOC0wYy9MEKp70?=
 =?us-ascii?Q?C4Ru0sMP7MIjP2y5PdJXg5MjFFooiCXm+vS93X04kcrjb6hKiHk5PySa0xBi?=
 =?us-ascii?Q?I2mKPuhM5z8Tsua+9h3K9T1N2BsFeNLriM8NXKeXBrBJ6xaKDJJeseEPaqFl?=
 =?us-ascii?Q?VxgF97p2t44dNAr0593XeMRQ+ciF8mETCmMPNEqQw0+ePPmhVheVpEUAu8QY?=
 =?us-ascii?Q?nL4wCw28BtpjigNO+/fGDAiRFzE1/HTIuallx+jvS6idUwKs0nOUmfHNHyF5?=
 =?us-ascii?Q?M8XerljlWVTzc1GIwwkoqnJsuPYfoucU4Wm6Qj3rT+HdLRN6mhEz86Owa5C5?=
 =?us-ascii?Q?96UNnGXnlr6Qd46+AL4rxBD8qIFDwNy4XONKc39cDE17ldf1ckvuanDjd/a5?=
 =?us-ascii?Q?teYHBi70CWdk9Z+ORvDoJqUraFMhtjaLdZ4i3GjrzpEyrwGCc+MGL+3zesVa?=
 =?us-ascii?Q?EdHwBUsCqynqV2K0eqjG653t6uoMCs+UAKcvniGkVkCp0rnzie7XLf8eXVV/?=
 =?us-ascii?Q?70/o8gQwMqOsFscjwl+vKN72O0uMJFDzTCatJ9expvRwRwjzrO3uzddBNqEO?=
 =?us-ascii?Q?JbmIff1BbUUjIytA8zfdqvkW0c6hFJUNMBgYPcAVYXjrl3KMIfxyLXUfXtcl?=
 =?us-ascii?Q?LBptsUnJVAqB47v+pJao+acThEXCWMjgjd1Nsaea5KDaxJZ9VbIgtuiZC9Cw?=
 =?us-ascii?Q?eYbmu+MMmT748tkJ3SbVAgeDtWkIYm7wwg1S4oMpsHbIa+K9P45UJRhLyQLC?=
 =?us-ascii?Q?e3JT4l+E2AneJo086fh4RvlECuldIImvua1cB4jEBvtqQdWnplLo18wmaYy3?=
 =?us-ascii?Q?+3e/K0J2K/OvwlKzCW+3xSsj9fUr8TH5c8oUK8MYTxrRLrAzVFx1Nrs7MKa+?=
 =?us-ascii?Q?DVnpgJSfCw+yNCCbs6hjA9hUBZLlk1n0gyDx+6ajXeD60q0UnXUqWLk0LQt5?=
 =?us-ascii?Q?DMvcjP72eTim5d2h1ksiZ70Cb1ml5pX2eF2s/olItS7/SMTCvy2nboTblBXB?=
 =?us-ascii?Q?jXdLJtQH4MXSp2LgHSe02N8BzraD8Mh+g/B1jx3F4LNp0S1eIXR45eGvDRhi?=
 =?us-ascii?Q?df5tsHl3/OG9qtYuzAF3kIvw9m4F93fWK8oHMg8B2TuFOcKtR74BcETGkZws?=
 =?us-ascii?Q?3rvBwJqFQsS41wf/T8GlxuA7xLm+dGfv+jVvQN55ucKgqfiF1fcu1jFEXbHb?=
 =?us-ascii?Q?NKgqihb+xQMgE//Mi40=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197af49d-2b81-4c0f-4cf8-08dc0b43c532
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2024 03:34:47.8516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XALXKeKEKL1AVW1X/3Kr7nljCcIQElQXmKgnlLzzrPkVpeTb/Ske/gSwaHBYv4bPWgPSpY8nDGVRGcdOSkC2jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9571

All,

I am trying to setup xen virtio on NXP i.MX9, but when build xen tools,
I always met qemu build error, such as:

In file included from ../qemu-xen-dir-remote/hw/xen/xen-operations.c:16:
/home/Freenix/work/sw-stash/xen/upstream/tools/qemu-xen-dir-remote/
include/hw/xen/xen_native.h:5:2: error: #error In Xen native files,=20
include xen_native.h before other Xen headers
    5 | #error In Xen native files, include xen_native.h before other Xen h=
eaders
      |  ^~~~~

Anyone met this?

BTW, do u build qemu together with xen or build standalone qemu out of
xen repo? Does the default qemu-system-i386 built out works well
for virtio trying?

Thanks,
Peng.

