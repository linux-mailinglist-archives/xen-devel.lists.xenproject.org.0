Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9910B6E9954
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 18:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524331.815190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppWwm-0002SB-RJ; Thu, 20 Apr 2023 16:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524331.815190; Thu, 20 Apr 2023 16:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppWwm-0002PQ-O5; Thu, 20 Apr 2023 16:15:48 +0000
Received: by outflank-mailman (input) for mailman id 524331;
 Thu, 20 Apr 2023 16:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IO+W=AL=citrix.com=prvs=467e7f66c=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ppWwl-0002PK-2e
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 16:15:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 985cab62-df96-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 18:15:43 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2023 12:15:01 -0400
Received: from DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15)
 by BL1PR03MB6150.namprd03.prod.outlook.com (2603:10b6:208:31e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 16:14:56 +0000
Received: from DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::4418:2c5d:f218:e58]) by DM6PR03MB5372.namprd03.prod.outlook.com
 ([fe80::4418:2c5d:f218:e58%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:14:56 +0000
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
X-Inumbo-ID: 985cab62-df96-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682007342;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5qYw18nuoylvmGWA8A6EOst6p1DtVudzE1QBsL1wGH8=;
  b=dUZxL6dboTBhHboJiNrn1wvsQMilA7pXXFhfs4dgaNEJ4htqi98eyqCa
   hcxffn3R5y1FGtDHkLxXGPiIBWId+klFuVt8bUacpmZ5KAza9Ehphz13W
   UEHDX6vbKAyyU/439sOsFcksxtTfTEBH9wVL9U5zhFER0VzYWd+g0xny5
   4=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 106308308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hbWLT6rxK0V2P/A7xO5krmcLwgleBmI/ZBIvgKrLsJaIsI4StFCzt
 garIBmPO/yPNDb9c99zaIqwoBgDvMOBzdFgQQc5+Sw1QyxDpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzSFNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAG4BdFO+u/K2+bO6ZK5pgJ8DdsTxYKpK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwv
 GXd5CL9Cx4XLsOWzT6t+XOwnO7f2yj8Xer+EZXhrqAx2A3Injx75Bs+e2a9jeW72hWCRNdcC
 nEF/BVypqtp3Rn+JjX6d1jiyJKehTYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 lyOmcngCXpwsbmWYXWH/7yQoHW5Pi19EIMZTSoNTA9A6d+zpog210vLVow6Tv/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQOFhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:MbtWUa67x+r5N42g1wPXwOrXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwX5VoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eB3OBjKadZ/DBbytHPuQ4D9QYXcei1UdAc0+8XYjzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3Ajq9DaWtoOPXz2xWN4UIapKYx6It7fmee8UvAI3a?=
 =?us-ascii?q?5CEguTbvOaQWd4v9Nxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AUXY0yQ6ApIvbZMsSg6UwTuNYxoxG3qKCFEJdyqk?=
 =?us-ascii?q?ZvsqlCD12BGuWj2+eF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,213,1677560400"; 
   d="scan'208";a="106308308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjpzLjh2DlQQl+TspiHwKVVl5R/i7owrGn97wrSak2wbj9jC5IhGk6/cWepv3RJQdyLKkRnmOaHtWdoKBfDEKNKLlWQ8E3+QqICCM4UkpLNCYdpbHqnQK2TLidOGyJTWzsiq9AsjKq2nkO34AIDs/lnLqNFnLMjmWkf40zTCjaXBSKPOQIMIt+y5CO5fbzjc+Oz1yq+B80cgy6rge3GwlJ6AsugsWV97jPSGIK9WG7eAlVWlLrQpMHv4GKdxVsbmc6dXK45UKt11BEvh09mymJT+NzBi1hPe4qy3Aw10ZHSHrxhYZ1aHGAucA+8xw989SMP+yn0kQ2+09y6sUXZvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qYw18nuoylvmGWA8A6EOst6p1DtVudzE1QBsL1wGH8=;
 b=ZoBt7tCildVaKnke2inakBiB7CVNBS7l6GL4LWhhQvAogrGvcAPzWbWB3Zdvkx8z0f4SJxF9U3vKCjddKi7xz52tWrUY96SKyE44+YsZH3eLmw21kBUU/MHZCotNFR7vD8SlnjkzlLRaONe0JMnkoGjM0Wbk9c5CxJ2WGgVvdsq8JFTWrMj2ZBUtzCzaEyrmqwkEKUQgZaaKEA4R7CoMhp9dPDdCzrb+qpd1bY6VEBJEaZPEuch2GhcANsGiAi2ip3dhnK+mwrMXnN4j/isDSfyyLxdBpCHwTLWhpr0OpwbGQjsehKFbs9MYB/4fji1VAQX+5nW/QHonzvyGrD9GwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qYw18nuoylvmGWA8A6EOst6p1DtVudzE1QBsL1wGH8=;
 b=sET5pzYrAq2/P/JWfeOFAq1Shw6aMvnjsL8qsf4SqXLw0UB5MIkF14klYCDrt1SXZuCnFfb5IxqZ67xH84cgit29r1I7shF3sUdFyMMtzrUMg/oihXa7j2ShIe2ZejaCOaWiWeng2bK1gHXn1PMwv4Ea7O84yWiozWY/4WwW3ng=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v2] livepatch-tools: remove usage of error.h
Thread-Topic: [PATCH v2] livepatch-tools: remove usage of error.h
Thread-Index: AQHZaHyz8c+PPcqCtEm6H34gcW31tK80dMV2
Date: Thu, 20 Apr 2023 16:14:55 +0000
Message-ID:
 <DM6PR03MB53728797915DB90C57CE03B2F0639@DM6PR03MB5372.namprd03.prod.outlook.com>
References: <20230406114106.54735-1-roger.pau@citrix.com>
In-Reply-To: <20230406114106.54735-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB5372:EE_|BL1PR03MB6150:EE_
x-ms-office365-filtering-correlation-id: 67b3d50d-4bf7-48af-5b18-08db41ba619a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +dWh4rs6FNIv1vMHiY7EMwEDVWeefxjhb781Uxzyf/p8e6h77Zclt8ZDKldv0uYbrTacTrCvRyCFnLCsD/9Ud3gGZtXNCRRYLU066oJPGViciSxCZVdiVILZVfsjY6XPC1/pDFIlqF3HPj6AOutUd1fjiWuADDH3CQdUQkuGi7FA+khlJUVH45Jtq3PIJMdF2iq7AnROMFRpj49cNMCQGvmQkW4+LePN7rzd5K7iNnzV/J50hwJV5Xw7hawBfC03wvGEV4BVJ2Rrj1uvMcgh4Q7xNNnBKcmwRLKcH+W9bpqO5zb0g9Y9afq+/yQjId4WMuuyHzlIGFf8YYCPasHrZ+GjGY3H4n7iClrLbDnv2yHtC3lxlzUaBZpZ+A3an4zFX5iWg1EHRTHa++MlVBFBL3qfCFmDiD6grA1npIp0F6AUfsscWZSRei0ooqKt2Amkg1PrIqOCHfjrvY6wSQvqyH0oTSwKqgAtHCaisBsNAN+3xiFTBOSmL3vbSeV9tIe/fDj6ZK8l8qdjcuBerMxVdfxF4lNFC71tr7l7LqM1T8BfQOhrCEo7wDA+5wN8JhMfK3dqRHTRwCkjO+OaXGGEZdxedqiNNYu3alm8yyOmEg8KMYO2E9amXP/kBYUVaklf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5372.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(33656002)(4326008)(110136005)(316002)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(91956017)(7696005)(478600001)(71200400001)(55016003)(8936002)(5660300002)(41300700001)(8676002)(52536014)(2906002)(44832011)(38070700005)(86362001)(122000001)(38100700002)(82960400001)(26005)(6506007)(53546011)(9686003)(83380400001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gP98pwC5tySQ4A9F29jNc6CnCzzgRz7O0FqC9gp5YxkUL8Hzmwf9bhYw8N?=
 =?iso-8859-1?Q?Srrmyjsbe2w6DCxyNVa+bP4KewW1D2szeooZ7irA9GrbAjiu3T1FI1DkZs?=
 =?iso-8859-1?Q?hLvfdhYhqThAI6JMLn4uu3B+8fhWRtA2p4GpecREoKNHJD4PoVV21XOGtf?=
 =?iso-8859-1?Q?BfJd30ujh2+Opg1xaKDJ4VilOzpYVR++1Q/fdWu58I3eF8oyAA2TGGu3O4?=
 =?iso-8859-1?Q?vbrdVT+j/NrIt5mvMgSOQN/+NcMsOTslKCf8lYDpzHfkipFOivLZzJsxKz?=
 =?iso-8859-1?Q?MYRwfVlnZjQl37orgl6bZD1bGQ1UvohPBqlvPcCSKIXxmrClglN3EGkhdO?=
 =?iso-8859-1?Q?BXOD7I5h5LmWVmGttuD81BdkVNce4z9u8hA5Hu22mS+HNlIIaOoDo/xVDY?=
 =?iso-8859-1?Q?29FJUCkS4PI9GKSi8BUB3+lTo4CjSmUHtiyHQdL25Miuqyg5Cfcu0eoBcL?=
 =?iso-8859-1?Q?OKHLv1IV6JQMxzV5UlFAjWOiL1awAL15+2jQwdBRQnuPYsVyx39BKv+sUV?=
 =?iso-8859-1?Q?wVVOYnp9ktNxbxHIOsGioK4KL37XV1XSUWfyx0VEp25l+5aVaJJv2L1xMw?=
 =?iso-8859-1?Q?ih9jsatUmA8l8ysRdfdjqoZJB/mEfmvR4CqXVMToM6txvUprh/5sur72Cg?=
 =?iso-8859-1?Q?v0uvt+FBe8AAjYmTagKM/E0NhVSUtvIV8S1ER0tmxMqBugjk2Ns4WAm7BY?=
 =?iso-8859-1?Q?JsG0DIbxunhug2IdZyQIOmvpSZ0+jqAWog8V2CWkxkfQXHa3estolYiM5p?=
 =?iso-8859-1?Q?kjXRjPgOsPJY78gfXe+IR0kOripQrXviwqyIBj4nTvQi7d1fVgVxpbg42E?=
 =?iso-8859-1?Q?y0qv7qOgSjppz/f7khPuySaFsGC+wYr5Rt6c/rlvq+vMgbNYd+VegJnTVj?=
 =?iso-8859-1?Q?HQYG1Im/uBUVbnpIRhi8wZ1tw5Elqc8hIR12cRoJ6dW7+xQybn2/DzFr22?=
 =?iso-8859-1?Q?YAx/cZiKHttBtVjo3vB0C38lDlJiHqnwRiBrCd/QgaIxOaJre6J2wxnPUn?=
 =?iso-8859-1?Q?27oWO8optDJgiKTVsz8DFQIdgDvcyrKe4ukR+dmSdbZ88z7dQubvyfLHVi?=
 =?iso-8859-1?Q?aQs+Ym8184lLPxsUwgS2B4fVUg3ycA7+YCb0yWS4DnfoyFMlouUIwIkl+0?=
 =?iso-8859-1?Q?hcQPUS5P0lFc039pWjmOhMh46mXEzfY06KzbGL8/rwyewbqvzJ9AJJaxls?=
 =?iso-8859-1?Q?yQFXsyGUhY5PE50awOVa1RuM+WWA/xfO/LDL9yCQJpq/Yso7Q9zU62WkZA?=
 =?iso-8859-1?Q?SDwgu9Cb6fiQkOC49h1WdvQm3f1LpNBwERNBWsElzxfvtyFHZ+wd/jjmRH?=
 =?iso-8859-1?Q?10D3ZmuWflue3keC9JsQWxppRlU2++doUyA5e/qDTR/+3P5XRwcLQZq+Tk?=
 =?iso-8859-1?Q?fW0wcI5RtJZ7hYjj7JBh63MR3GJnOy7a08e813C3WklD/wTMRAS7OKpQ6x?=
 =?iso-8859-1?Q?rPoUzdDAjeJBKyV/R3C8FRUO7QOBcAfjQiCoXpBvbDBPeNmyTA8fe2ZaFa?=
 =?iso-8859-1?Q?8v9j8chodkKcj2SusMDq/wH0L1t3/Ddugns33XsAr5ie9xceRBj2GkmfgZ?=
 =?iso-8859-1?Q?IhcS6uQ+rpLqKnO3cm5iCDl+d++vxsqAVi9KHMxL0J1B5N8qX1yyPCql9E?=
 =?iso-8859-1?Q?8CoeI7C2VzBSezVRulv3JHuSI8CtLfPs5s?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7ZMkqTsO/snJtAJAupYpvvjnlWj1jUQBLZj4nm+mDYQlCO5dl+gVke3gkQVN0IoBQVtrHcwIHMEXF3vcRqpWs4k2K7NlpftmrRL/o/FMBwbR60BraGl/TSiJY6ZNq/gJ9qY2rsstpkAMtaUFTKVcDr9dWruYzrZOgHS8YkwpM6oyTpKbQuwP9DO1X6JK36mv3ZDkODDyMoLB1FwhHi4dO9Dy75oBqq+UjpDt2o77Zx+rujQRf8xAJGDNV9PXbA74ep7rztoGbIXW6GLuq4hROm9kib4qtvsawbsB26a39vnyJj+OVHYY4RuBN50xCv4aoT0kU2C8fshnqYXmPEb4dmZiMpUqWFYSWwJAY9yxlA+xtWiVvGNsE7z1NooZnntVfjUQ8mD24QCvnyBB0jZ4EjICursrPhR/KKXuRnLxxst2GDDDpIebCJ2KHR+KaQdgRFbFPgZIy4HIpS4yTjvea1mBHN+gqMTzFzLQLeO+8U/lljcbBi09okvGB7NMvZRIRTEjJ115rlha3HAz3xBPMoQ3/lLgbozIcBz+aHYSDL7pqIZ/Tq+5NxtzVSCcJncnl4L8WzCGGdnfT9st7Og9OUia0DLYf7UG5zE+iH+SNRy/pCzVDC9+bPwCG+rZlhRRPgF4N6Z4vYb8ywLXfTfbNp+gavyn5htFLmb9rIRWb5hMf76fqjLIcD8HTw1hEun4sqIHgND3ozVo4Tc49NoMBp9Xn+IDF3YdFkKizZnBnR0NO1Z1wE15VTkW2/RWP1Fn5AGrRJkvg2r3pUyTEzFCG5OuWnKU9Q8X7de1CHAlMpv8sVb2IzjsaAjBho6wQzJd
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5372.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b3d50d-4bf7-48af-5b18-08db41ba619a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:14:56.0032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1AoaiNdVwhRa56V97vrmpc8ke/mA95pxbIVg0B17j/tx66zr6PcUwrI3aLEIZN3CJbkB3KVcRbInu8vR8CN7blc+8lJyUdzbFE0sQF/Sbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6150

> From: Roger Pau Monne <roger.pau@citrix.com>=0A=
> Sent: Thursday, April 6, 2023 12:41 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Roger Pau Monne <roger.pau@citrix.com>; Konrad Rzeszutek Wilk <konrad=
.wilk@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH v2] livepatch-tools: remove usage of error.h =0A=
> =A0=0A=
> It's a GNU libc specific header which prevents building on musl for=0A=
> example.=A0 Instead use errx() in ERROR() and DIFF_FATAL() macros.=0A=
> =0A=
> Signed-off-by: Roger Pau Monn=E9 <roger.pau@citrix.com>=0A=
> ---=0A=
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> Cc: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> ---=0A=
> Changes since v1:=0A=
> =A0- Use errx().=0A=
> ---=0A=
> =A0common.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 9 ++++++---=0A=
> =A0create-diff-object.c | 1 -=0A=
> =A0lookup.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 7 +++++--=0A=
> =A0prelink.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1 -=0A=
> =A04 files changed, 11 insertions(+), 7 deletions(-)=0A=
> =0A=
> diff --git a/common.h b/common.h=0A=
> index 9a9da79..bbaa950 100644=0A=
> --- a/common.h=0A=
> +++ b/common.h=0A=
> @@ -1,18 +1,21 @@=0A=
> =A0#ifndef _COMMON_H_=0A=
> =A0#define _COMMON_H_=0A=
> =A0=0A=
> -#include <error.h>=0A=
> +#include <err.h>=0A=
> =A0=0A=
> =A0extern char *childobj;=0A=
> =A0=0A=
> =A0#define ERROR(format, ...) \=0A=
> -=A0=A0=A0=A0=A0=A0 error(1, 0, "ERROR: %s: %s: %d: " format, childobj, _=
_FUNCTION__, __LINE__, ##__VA_ARGS__)=0A=
> +({ \=0A=
> +=A0=A0=A0=A0=A0=A0 fflush(stdout); \=0A=
> +=A0=A0=A0=A0=A0=A0 errx(1, "ERROR: %s: %s: %d: " format "\n", childobj, =
__FUNCTION__, __LINE__, ##__VA_ARGS__); \=0A=
> +})=0A=
=0A=
Did you mean to add "\n" here? Wouldn't that result in a double new=0A=
line?=0A=
=0A=
With that removed (can be done during commit),=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

