Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021B5FED2B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 13:24:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422808.669094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojInf-0002ml-Tw; Fri, 14 Oct 2022 11:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422808.669094; Fri, 14 Oct 2022 11:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojInf-0002kI-Pd; Fri, 14 Oct 2022 11:24:23 +0000
Received: by outflank-mailman (input) for mailman id 422808;
 Fri, 14 Oct 2022 11:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVin=2P=citrix.com=prvs=2797e9ea4=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1ojIne-0002iY-Lm
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 11:24:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be3d8df0-4bb2-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 13:24:21 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 07:24:17 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by PH0PR03MB5864.namprd03.prod.outlook.com (2603:10b6:510:38::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 11:24:15 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::7131:3804:744b:d7cc%6]) with mapi id 15.20.5723.029; Fri, 14 Oct 2022
 11:24:15 +0000
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
X-Inumbo-ID: be3d8df0-4bb2-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665746661;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=fQEj08gaD01M9JSTVcCtLRrvb0mgsY4Auxz3QsW4L3o=;
  b=F1I/unDrvEs2vg257Hh/OusBWRTGJ26qCZDSgWY2fq97ibsT93VQItXf
   IXNOmZunJbJam7eX6HU/s3f6neeEasGKhk04Oar29KGqtmpG40vqQ+Wbe
   O65a7WMCfeiK5ejE1qUlxkq9HD0dfAQ0ih9YAIGeZdSv14jPNwoNRGw+b
   E=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 82722715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:awBAGqPD2efrFCHvrR0IlsFynXyQoLVcMsEvi/8bNLWB5Y4Qp3Zem
 TxOHSzEb+HbITHFz+oGPNy380NS7ZHWmIRgGwtv/CE2QngV8cCYVN3Ecx6qY33LcpebFRg2s
 JtFNNSecp1oRy+Aq0/8buK8/XIl3KvTStIQZAK81gVZHGeIHw992UILd5cFv7NVbfiF7yKl4
 d+rrpaBaAT9i2cvPD8dtqvf8B8x4f6t5T9EswVua/wa4FOGm3crV59OfqvZw1kU4GV3NrXjG
 7ucluHREkfxpUpF5gaNy+6jGqEyaueOe1LI0hK6YoD66jBavCs+z60nA/QVbEZTml2hkst4j
 d5ArvRccy9wVkH3sLlbAkQw/x1WZ/UcouafeCTn66R/8mWdG5fS66Q2ZK0JFdVwFtZfWQlm6
 fEeITYRWRGP78reLGWTE7QEamwLdaEHDatH0p1S5Wix4cUOGPgvd57i995AtArcs+gVdRroi
 2j1XhI0BPjIS0Un1l76k/vSls/w7pX0W2UwRF54OcPbSoUcpeB8+OGFDTbbRjCFbfp7oR+Zg
 VCFw3mnKw1GK/mG8QjY/33504cjnQujMG4TPJuR06cyxXG2mCkUAhBQUkanq/6kjEL4Q8hYN
 0Ef5ispq+416VCvSd7+GRa/pRZovDZFA4YWT7J8tVHLk/KNi+qaLjFsojppR9EhrsA7AxA30
 FuAh/viBCB1sa3TQnWYnluRhWPoZnJPcjZfDcMCZQ4j08PDkd8itBfCXs5cHLLop/T2NS6ll
 lhmqwB73d3/l/Ujx6i9uFzKnT+ojpzIVRIuoBXaWHq/6QF0b5LjYJangXD74PBaPcCmR1+Ol
 HEeno6V6+VmJYuKjyaXR+IOGpmm4v+ENHvXhlsHN4Yl3ySg/TikZ4843d1lDEJgM8JBdTq3Z
 kbW4FtV/MUKZCLsarJraYWsDchs1bLnCdnuSvHTaJxJf4R1cwiEuippYCZ8wlzQraTlqolnU
 b/zTCpmJS9y5XhPpNZue9og7A==
IronPort-HdrOrdr: A9a23:RR45Aq4bRGuEHfapzQPXwX6BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qADnhORICOgqTP2ftWzd1FdAQ7sSircKrweAJ8S6zJ8k6U
 4CSdkyNDSTNykdsS+S2mDRfLgdKZu8gdmVbIzlvhVQpHRRGsVdBnBCe2Om+yNNJDVuNN4cLt
 6x98BHrz2vdTA8dcKgHEQIWODFupniiI/mSQRuPW9p1CC+yReTrJLqGRmR2RkTFxlVx605zG
 TDmwvloo2+rvCAzAPG3WO71eUZpDKh8KoDOCW/sLlXFtzesHfrWG2nYczGgNkBmpDu1L/tqq
 iJn/5vBbU115qbRBDJnfKk4Xid7N9p0Q6v9bbQuwqcneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KIoMxsj+K4KC2Cu3DE1kbKq9Rj+UB3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11Mfi+CETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTNspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCeg1JVsJ6e
 H8uX9jxB0PkhjVeLyzNbVwg2DwaXT4WyjxwcdD4JU8sqHgRdPQQF++dGw=
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="asc'?scan'208";a="82722715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ov7NIXuPeD1tu64Ftg3H3O7D9/UsC30pwMiR2wFLPgyaUgOqilbc2UoZ1ooHINW/ouGauDxxh7vqJZb6eLtA40H606VjFtUkOEQNfDW6thb7Vxx5gGbEqvaJrH2Tf9Lbh32gjHp4H1ay44KjhD5de625phvpuxQwYVbqEqrsjAN2v0fdWImRZ2OuzDhy1qxD+OZzylCpYGu0iuVOfp3B3md+ntiWQQPz1GWpZEJeaJNi7/TkWnuDvAp3jB1buZUaSjl2FmX7wJHbVJ8BbzYwwlMMObpBiOSX38C331uEmJEhgXWB3QHbo3DGB76kf4HvsXvIv1l0odbvY3kn/4yiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO82JN/k5JwpSbIr+NkjYIYpYUlo64z7IT00WZCFuNo=;
 b=gc0XmZrC1o1oKzHAQziM7zf6Vl5BiHPWMg2oPI6SjOLZadS0XDKaUA12G/revVOauI+NfraCk9srxRTL4yXKMcBEinMsw0yovOl9BzZ7Pq3xOUDo+bSyA2EgWaADX0lzdfdp9D2NlmOw1vFETxC6HNnwQd8RO/3WLUbfYpQwtH/HbNsmutfwvFSpwfTiS6uPCG9YQCnYRQLWJLFoUBAeq3IcbFM1ON6dg6BoL167nUH2Mi6vjH+p//WLYSfQa2W1AvmPExPRwkZBMFSPBx4KRjHYIUTX7iCkT2tPcxiix2L/8bjAo0Yvm6QCjwqxlAmB+L5jKDx0DDkiDFrtyAa1Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO82JN/k5JwpSbIr+NkjYIYpYUlo64z7IT00WZCFuNo=;
 b=hliL+cCMeHZHPT83xe0mKXt3OYSttC+Jty0OzaGyhTY6jffxjU4Z/hq7vcoJPYo+jvbBwqWp+iZKCQE8iE4oU/KyEQ875yUGcU+nt9yH/LA/wiDKf/eDp0kkXfTlYXBZkPTNwX/nqh/xjEN9x0IZOF2iH3wiV+v5gxa9o83nv+o=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Anthony Perard <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Topic: [XEN PATCH for-4.17 v5 16/17] tools/golang/xenlight: Rework
 gengotypes.py and generation of *.gen.go
Thread-Index: AQHY3wTwBw4XcUEnKkOCwbXR47HHg64MavwAgAFV8IA=
Date: Fri, 14 Oct 2022 11:24:15 +0000
Message-ID: <C3A38BD5-E338-43BD-9EA1-3600378EE3B4@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-17-anthony.perard@citrix.com>
 <3d5e662c-91b5-a390-c21e-90391961bd45@citrix.com>
In-Reply-To: <3d5e662c-91b5-a390-c21e-90391961bd45@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB5669:EE_|PH0PR03MB5864:EE_
x-ms-office365-filtering-correlation-id: 2eb598ec-5e86-4622-76a4-08daadd6a063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SjU4tggBum3yhDfYQhBMTDi4Wf2Crwgl1834iUMXRLBuEll4bI1dc0BjhRAfh/5pjx6JYhUkQNia6DFGfK+m5PkGjD/dmQmOFA2+bcHkkjqnrdGFGZNGyD78V6vjNfL+ysGxWaRO575GBM/3n4JqzUqFUnRuZ/KcfhFE4ca6PhXXZmO3gD/RYeU3ZsuKc0ZVpmwPRUt+g6XFU0M1SiJI2mY7UpHGRIS9fxXxFQOcDzuad8Aw0cbQXV9A1tbK0Wdf79A79nbgfQr1WLIuNBxmAcz/dHTwQ4DE6amOTMe26xvt+4vR24NSOreZIcA/tVhce1MHJVUGf/s+Z6zT0cTKyHSS6hKKjP8g146akmQacXlW1Pybacc2fM1WbY97BzDtZK2Ak4zUCKPNDcm/2k5wS1dds6w3EXHme/CirnLGPBXg7rOR3oQMvWc7o1hoQv0eXkLsStZnY59SB2A/QZOlkcNWs2//wpOlnNzxI24j2cxdPqFD/a58sdFCL98xHDMBiu9SUiL460hXiDrD+ZvUTto5mGGf5shyzsp3rxZz/Ly9DkYm2Fh9s6W41vrPRX4M2CBL8Y/dwaLRFkzjK9oekgNOl9Ktg13JOczv/TWj4q3Lnb6b3WlG8NPA5LES1YxAQ+/MAdgzVtEaROGJIGlpnfQ+vLMMF0t/FsmBNLKjJrI4lrdnyRd7APAGBJZFZSqagmX2e4jNDHdr+qBKu3cKhzUe70L2ONrLMandnGuTIaG3ZGi5EZB0zbiqujsGuWU54cJJ16/8/Pvp62t8fr3MxVAhgenYceQUNAjn0Co1ZZoRwsdwm9WcL7d/Y55sa/qv
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199015)(36756003)(33656002)(26005)(86362001)(37006003)(4744005)(2906002)(38100700002)(5660300002)(82960400001)(99936003)(186003)(2616005)(122000001)(83380400001)(6506007)(53546011)(6512007)(6636002)(66556008)(6486002)(71200400001)(66476007)(66446008)(478600001)(64756008)(76116006)(91956017)(54906003)(316002)(38070700005)(6862004)(4326008)(8936002)(8676002)(41300700001)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rWfz6L0cguBxFRa9DGIlokKiRdhVsLAq/2SshFc4fc/ge84sunKOC4T0J7kR?=
 =?us-ascii?Q?ifxhrSmH18pmzyOWw1cvKbHDj6/ElDrp0+IUDR5Ezm3F3++PCB/0dsY6aQ67?=
 =?us-ascii?Q?dMhjz2uBJT3pFnh31rT93o4KmA8n1sVASH09OoHDwLg/EpxwxJpfNsro0WEL?=
 =?us-ascii?Q?H/CokqPRMI56+T5JOoNl5KButlqIhtRk2iGUgHoJQVuE+v+r/fssazaV/OYf?=
 =?us-ascii?Q?8E+91tt8k8l89Hbb5ozM1zqd7AM4uicgLhfPsbNC3Ozx1e884cIzVBkykkYw?=
 =?us-ascii?Q?NKjUsWxcmnErJxwYuu+O4Arkcf2+lHlxrnr0TuqxIRowp4n3OxqXY+/ijo9H?=
 =?us-ascii?Q?3aM1dYb9TPV75wAjXenZsuSsqgljDhLtQs+YZ6zp00DYTvjhvwaBGjJptAhO?=
 =?us-ascii?Q?2s8Jej3cvDGchZRSs8pRgNcM2eUrg9fa9iDAPDxxp3mRiA8JK8fC57ChrAr+?=
 =?us-ascii?Q?GXB6YfBkBkcue3P5OoXlwOZY2lxcvKrM6c/GD/gLrNb4xYRfPJyA5Nt/yLjE?=
 =?us-ascii?Q?HU3vCmXvZOH6inu+rBxG/RILXtDlluVyfvoN9By2YZneDoNMmK+MJYDBJ9QO?=
 =?us-ascii?Q?eYPdIeJsIjQMvEyfqRZWQK+8l8P8J8IADH2Veki7cMFeXZHhQzBGdHSTXnIn?=
 =?us-ascii?Q?EFJmB/s4lQpK2/Qqm6q8gfm9qt+8k2GVriL9ccssvtkxGtQaZc3GbcB0maWn?=
 =?us-ascii?Q?pWlrnp9XaiUDfmMaAAWMrzJ4gdjEMHHAwaa8QYq0qBP4xDH0MvhnygfkM4wW?=
 =?us-ascii?Q?+E2Y20STeBCkeQSILCzAik7InMTMMb7KqxLYJmxZ0MlA73SlTw8o6G2Jqfx1?=
 =?us-ascii?Q?mA9NzhkPzefB+Kn26GrMxqnngZjzyu4HzPs8YNyDgefysk+5TJfxS9WZ7QKv?=
 =?us-ascii?Q?3rG3iXDFGSkXW4/8PE7HKbUu7JcvcgwkGYXp7+VzpPH3lleGDd0ksyV+LVEX?=
 =?us-ascii?Q?nq6sIQU80ZliQ8R4POQIztMKaSmSyAa/GIy8bfqDd1iqjTMKaODQtL0WfjuU?=
 =?us-ascii?Q?wmcVB1gInlZoFfLOJthKee3T4+B7fW+6QqaVo7/UtuUAQveJB2rldysHnIIP?=
 =?us-ascii?Q?vVxWP0zqPFBA7wfX+YjKh3RM8J4QKDVSNJIr7aMSYDzLBeMsjuU3V/LDs17x?=
 =?us-ascii?Q?YS//GXYT6995dRVpWwAXXhWYZ4ygFBRVZuGx0NpJD7RETZBoUFW9lQLCe2zY?=
 =?us-ascii?Q?DGX1lfgPasPgaJGTAopsU5+tQoiV/6Idj3C/MgBDbRxVpuVntZWHeN7ybOa8?=
 =?us-ascii?Q?dUd6DVM+DyiQ9fJv1UupQoXcOfyoOCCqIddoO9ViVt+JZUnXVt7DYxz4CsNE?=
 =?us-ascii?Q?Ii8rYt8AY+T71cFLXGjA0dkYXrlw5mvqOVSzawXBFKQA2FTje4ZmPxY9YvOx?=
 =?us-ascii?Q?ss9YklOBtKlw9zPvhir8U5EaV5Fno6SfCaTYQWXQzJVtsjQdmhpO343bjYdR?=
 =?us-ascii?Q?5TefxAGwU4zJ1Bwv84cBfZ53h+wWFnQs4eWS2/vGozoA8hv8cV5LZda9xmuQ?=
 =?us-ascii?Q?midtzbhzycY00PSzsvVSe+w5+ooxifLCU5dw/Gk4f4dCJuKAESqhgHQYgwLW?=
 =?us-ascii?Q?6sZjm4T5wC2aAxQ4rKG2zoDLQXaM4uCpzo+6Tret3lVTkII84woGrm45BGV1?=
 =?us-ascii?Q?VA=3D=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_57BF37BF-0760-42A3-AD2A-18B3ABB8B75B";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb598ec-5e86-4622-76a4-08daadd6a063
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2022 11:24:15.1669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qAk1zIHkkRgb2C3fDkOpGNMHMros7QezZoUzlB3DXey1RiCdWO+cznCM5zxUWYC8sCk/3loeLForhRb+yXB0FkYZL3xNUVAYRQZgTpz6nPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5864

--Apple-Mail=_57BF37BF-0760-42A3-AD2A-18B3ABB8B75B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 13 Oct 2022, at 16:00, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 13/10/2022 14:05, Anthony Perard wrote:
>> diff --git a/tools/golang/xenlight/gengotypes.py =
b/tools/golang/xenlight/gengotypes.py
>> index ac1cf060dd..ff4c2ad216 100644
>> --- a/tools/golang/xenlight/gengotypes.py
>> +++ b/tools/golang/xenlight/gengotypes.py
>> @@ -723,7 +723,13 @@ def xenlight_golang_fmt_name(name, exported =3D =
True):
>>     return words[0] + ''.join(x.title() for x in words[1:])
>>=20
>> if __name__ =3D=3D '__main__':
>> +    if len(sys.argv) !=3D 4:
>> +        print("Usage: gengotypes.py <idl> <types.gen.go> =
<helpers.gen.go>", file=3Dsys.stderr)
>=20
> This breaks with Py2.7.  Needs a
>=20
> from __future__ import print_function
>=20
> inserting at the top.

Out of curiosity, did you notice this by inspection, or  because you =
specifically tested Python 2.7, or because a system you were using is =
still actually using Python 2.7?

 -George



--Apple-Mail=_57BF37BF-0760-42A3-AD2A-18B3ABB8B75B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmNJRtsACgkQshXHp8eE
G+2wFQf/YJ+iOL0r3IPhk0aJ3t8Pm7+Nd3vHucfpD0yhnkQ3S0d/gERP3FixZLWY
vdfv7s8RpxzXuaZZhvUTXrZhzcIZIz87GMb+Nm/nZs5VvJh1YQjwsayopobCUbZ8
hNefjD6C6aa5fAXxgJcGtBdkB45lMdNz77fF4kcx7716jlOKNY+PvnNRzRXpBktq
+h7AQ34BTJSnaywZ/TwdEL4/lw8W186TO4Y/voczF/i+1bSPBlN6rmctSHu8ecut
cqGIpB0QwptbHw0vBHPbw7yXIHVt15DEor6m+Z5BTlmOvjBAO3J6H7qHgY4g0Bxz
vgUpx6GDmuNSB2sjeLZ901to5pm7Nw==
=V68H
-----END PGP SIGNATURE-----

--Apple-Mail=_57BF37BF-0760-42A3-AD2A-18B3ABB8B75B--

