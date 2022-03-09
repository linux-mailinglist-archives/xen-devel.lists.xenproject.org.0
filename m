Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F74D3525
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 18:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288019.488421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzrE-0000lF-6h; Wed, 09 Mar 2022 17:12:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288019.488421; Wed, 09 Mar 2022 17:12:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRzrE-0000iA-3R; Wed, 09 Mar 2022 17:12:16 +0000
Received: by outflank-mailman (input) for mailman id 288019;
 Wed, 09 Mar 2022 17:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mata=TU=citrix.com=prvs=06023063e=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1nRzrC-0000i4-Di
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 17:12:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0daaf4cc-9fcc-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 18:12:10 +0100 (CET)
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
X-Inumbo-ID: 0daaf4cc-9fcc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646845930;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AJe1N+BmkN3tSEtYVVOxst4Uy9cViFrxg5wJvYcLItY=;
  b=FbU/fAtij2VFdPs0fyDBi5FPdqSuQZMADycPmdohh+T9PgXw7viDySsh
   EkfsADmBy2WxFdd+XW1oAPSHop57Cwcr7goouovpVcXBU2fzliAG7/8OF
   SKQM/SMF7ye0MZOPPybgIbqy9LCeyKz2avfnWgTrLm4kg6opFoF34lAzc
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68195895
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:y5t3OaB6m5KnqxVW/+rjw5YqxClBgxIJ4kV8jS/XYbTApDwk0jMFz
 GoZUD2CPPzfM2P9e9B2OYzjoBgCvsLdyNBkQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhK8
 8lRuLquFjsyBZ/Ak8NBax1qHRpHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K9LweocWtXx60jjdCd4tQIzZQrWM7thdtNs1rp4eRKeDN
 5tEAdZpRDvjUk1mZUUFMZ03rre4lnugWnpakHvA8MLb5ECMlVcsgdABKuH9f8SNRcFclUWwr
 2fP7WP/RB0XXPSczjyf+37qme7Lngv8QosZELD+/flv6HWWxXE7ARgfR1y95/W04mayXN9VJ
 kg88y8nv680skCmJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3oyvsS+/HzZKEXQ5VyMPalc95+vtm7hm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab4P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsFJG9eFoSfLkWVsDNdWfhkB3iEsI2OBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtKlDZoHs+ORLMgQgBdXTAd4lla
 f93lu72UR4n5VlPlmLqF4/xL5dwrszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnmAx4GkgWj3SObQehIA1g6AI7SsV9EhStTFQQnPEqy2mhlZoCq7awFcIAwc6Vh/+tmpcOYh
 dFfEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:Hl3LvqmzgnirDrjX8uuhU3sEhSfpDfN7iWdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WBjB8bcYOCAghrnEGgC1/qs/9SEIUzDH4FmpN
 9dmsRFeb/N5B1B/LvHCWqDYpcdKbu8gduVbI7lph8HJ2wLGsJdBkVCe3ym+yVNNVJ77PECZf
 2hD7981kOdkAMsH6KG7xc+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdfapzbgpAycxrXBQ5u2UmZ
 g7rF6xrYZYAx/bgSjx0dDUShlhl065pmcVi+IIlXxYVr0fZdZq3Pwi1VIQH5EaEC3g7oc7VO
 FoEcHH/f5TNUiXdnbDowBUsZaRt1kIb1+7q3I5y4eoOvlt7QdE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyUwX2MF7xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3cUPzDs+F2oFN73n2MSiAdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt2zYY
 f7BHuXOY6UEYLDI/c94+SlYeghFZA3arxghuoG
X-IronPort-AV: E=Sophos;i="5.90,167,1643691600"; 
   d="scan'208";a="68195895"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azpBWBr+FUZs4T5G2I4C7S/tLKaK6pTIQdBeUoozr3I7cjcxGb+jruzS/Du1+Rj3ksP7krJwur/neiAgQIohd0LPS7oPk45KjC8Q0Y+3PIBy90Hdm7LwCfCGH8EL/f01paNUV90IOfhulIP+LrZTIBxnxYbJ81ox6IJGLU2vvbpMjPr5kRgVKp7avu8PnEGqjkojDLaol/Sq3yQwIFEiQ0Y9pGgXxb6K1sl1QAMfUMkjeVlqIXObA5oGSEgM5ZlHozR4QQhkLqqNDdJOgjyK79yxd5seaOoEJe3QZQ/dUqlFohOm0mCELtSdT+x1yaUS58u164MIQKptcrYPg5IuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXCHWgR96Dq0l1hW3035Mr/bLkazQ/bxND2RZzQbHO0=;
 b=KmoyTcXuUF7oF0qx2DNjwb5o+Bb3VptR3OPZOo6GoiKq5lK+WPGiFEGD4lccs7ljHukGN/vlrb0sDGUY6SyMA1hQrtqnwbEjcKM86ych4ee1NglDAzgM7sXOlRE1WGKzD0vRuAj5DcRQTeKKyZYRGzUfw3Aw6evCAm0lHfCMXqaq2AULp7o0aYnFem4ASRZejkTbyy3yH+rGmbUnYoX6vLFeDPdEJNNUECC03vHqt/i2CMAsYw7MlNYqouMmeKNR0sl/6CdPGAmmcWNaBpVEbp0GYEm867bfAAtfDYK988sn8X4BguPvVAznntsKq0A14OMqG2fruXFWxSSZUOucBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXCHWgR96Dq0l1hW3035Mr/bLkazQ/bxND2RZzQbHO0=;
 b=rrC7T4NXv9DmPyqIjRQ2JV2/92tKYxs7tmYSsfXDgji+cR99oPQMNYqHAIVIu8pSVZQqcn0CrTxULnBxgrlPQBNjur0T7z8CixxF62HMSqm88guXkcJ4rcCqEdOenGp+zQmIXL4p8m6hlIeCzdpZWHp3t1SX6uGF1n8x8e82+TA=
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Bjoern Doebel <doebel@amazon.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, "Roger
 Pau Monne" <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Topic: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Thread-Index: AQHYM8WNub5GgrUMA0aIU5Ob+nmmXay3SbM/
Date: Wed, 9 Mar 2022 17:12:05 +0000
Message-ID: <PH0PR03MB6382E2AD10AEF1BC48C55093F00A9@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <03798b67ec3a892a302e6be5d87ea676e6376036.1646837462.git.doebel@amazon.de>
 <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
In-Reply-To: <5cdd27addcec926eb48fdeab08ad3371e7c3fd7c.1646837462.git.doebel@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
suggested_attachment_session_id: f77ff0d1-a564-c56b-6576-c0136644f957
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af8eccd3-0f95-4bdd-afc7-08da01efefa1
x-ms-traffictypediagnostic: DM6PR03MB4634:EE_
x-microsoft-antispam-prvs: <DM6PR03MB463450CCC4CC5237900A118AF00A9@DM6PR03MB4634.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qgmg8FE7FHHt8+Lof4ETij73yn0g6e0KQU0eFhltezC4QZCeo8MUtZo8PC1E8uTxBzNNKeonV3QqrSww88teHzgfMgBvC+rgnKzWMdcdHPMhT0cX9fF9NxntYyM/L3ihu3/KWca7aZVHw8OZ0VLjbxSHsCVgt3x5+/zfQe/7aQyTamPLXPNgetL07KyTOll/ekbUJNIZW7Tb29ju6Gfku3Ftg9BYxBKUIZ4hk4Z9trT2Eps6/LmDHHkQnwu7jbN3pCQPKA+VyWth5xRpNRSBRVOYayRcwwlUITqx5uQxTCx1pPV4l9hKVjTeluMkaktGx+ME/3SF9+7iXQ0N6g6a1ocDmWuBBaNhqdcbInBkIdJYVKcFzMcoB1xPDwYCR5QgDrjl0r0kBrkRv/e0+B1Ho1JC/lpB5YVP1SfTzjjWMCXvok8WbKwC9pLxi9NFkMQxq+FSsT4/uENQPAkUHyJncAPIdbmhW8HJylkA6n18ncTu3oAwWjXu/6af0TP4JEiAnQ+COs3mYq9g0UuhBQ5JaRiPtdr9VaDfN7F7YPieQ/oWEICkocMOEPKUPhynMUds0LSTe1lb4tEv2Jl+O48GE8nV14aLESD9FaOhPenLE9dom4CCPr6IvUHj97N7jbeWCWJdHaN11CVbtO7aYWDJgnBUbrf9sTcqHQG3bEzyXhRGJeTRGolIFyLJTENc0O0rzKKVMyv+2iR6/pDsrrR8sA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6382.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(186003)(122000001)(91956017)(38070700005)(5660300002)(38100700002)(26005)(8936002)(66446008)(52536014)(110136005)(54906003)(316002)(55016003)(8676002)(4326008)(66476007)(86362001)(64756008)(66946007)(82960400001)(66556008)(9686003)(76116006)(33656002)(44832011)(7696005)(6506007)(508600001)(2906002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iJ7TeC7F1DkXj4IX5XOGL5nSfjoCBaNyY+Hl126YM6L1pkIzi9c+tn85F8?=
 =?iso-8859-1?Q?BVAkvu+6zJ0vQ4wNvaXsCLkIEwyjI7tIVAlk7aF1EAHEJOdlbnDnMGijbg?=
 =?iso-8859-1?Q?fTSQZgWJUveKaCNolbjqGKY4JsuP8tC+L0Qx2GnwKuEJHwpZA5DdvyS8Ej?=
 =?iso-8859-1?Q?UmtcafG3kYVB0lk+nw6e1O3d6dYGiaV7zBrbJKg3TffxOW+i0OOmQF2+zd?=
 =?iso-8859-1?Q?DILUGXe8DI/5g952qX/gaU/1yolqfAJp8RYYnqiGJPQZ/qorJRBHh2u28G?=
 =?iso-8859-1?Q?TJkm34nocQATj51c0bR1/fKQfTRakVYjgoH3Olcgn86NV4s97gPbrjhoaJ?=
 =?iso-8859-1?Q?jc2d910gVAVk/IKymKgG+mBup8Am7f15Jf/3YRdV2j4UtMpRu3nchj2H78?=
 =?iso-8859-1?Q?AfEG+kBaqhq2mdgT7dCp6ACdIPglvXpD/e9mcPbJtl5sHkVm9JydAZYpkz?=
 =?iso-8859-1?Q?2a8OPHGJXWaHit+0FCSXuXLI0RQ4GQmKelCo0qEl1p4PY2YhO7bWWChOi6?=
 =?iso-8859-1?Q?ZEMnlF6QP1/AzeaKiIP+X9Z1RwrvZhll5UAquJc3faNJKlA12frxefdhHO?=
 =?iso-8859-1?Q?1uRCHh6YDHxmZUC0o6QFsDQsO3TyZCLURul5dgzN7LtJhZA6BJta1oc1Q4?=
 =?iso-8859-1?Q?tAOBtOCPKjIuMGtBost+/PbvPLpoHuttsFaPOXH1UdDeYnLSEnVIMKSAh3?=
 =?iso-8859-1?Q?9wIqJnHUuox23O1jof4SH8vQ0ymxncJ8RXeHb5EoPovs43eoL7fcE3cmlE?=
 =?iso-8859-1?Q?yt0a67prBVwCxfiqzVsKx8aLhafhSXGCCtQ+Hf5FYgYMEwmhkAc9Aa2MMm?=
 =?iso-8859-1?Q?AmB0KWYg45tpo5G6uQ3J+ZMxXhSSL1FRzn9ZBepthEwBOlnjbfJ+4lIQ0n?=
 =?iso-8859-1?Q?jImnvgS1Sjre5mBsqOPEsC0e2ESfmBWGpGbqcYMPS6EdiR0BhE1rhe6rxj?=
 =?iso-8859-1?Q?t05PjdO1amSoTMkwjb8tPe594miWWCpsg+LFRWMXxoPuim6JC0m3D1pILT?=
 =?iso-8859-1?Q?yqGbXL4yuyemn1k8hGO4RLn4RwjCdNkStI36qPGO2RxSWcsgIxl/To+/zM?=
 =?iso-8859-1?Q?KbFH1D8SKRtkpE3wqajY64RioQsVSRlzcja/nGs4W4AoYYx5bZXou328LB?=
 =?iso-8859-1?Q?/z2AvC24bVk/yjxV1GlrkKr0gbZTi0OzCuftDnyCy7yEMTtfI4pvDmlRYK?=
 =?iso-8859-1?Q?9VCejG/wLIcl8NjlvBW61Fsd6HhCVvGdrhwhdrX672Ph5+PaznB3/bEwTv?=
 =?iso-8859-1?Q?lbm+XuZJAywkE0I73/M0ZGBhh8yy0cClA2YjLYvzmyYBWIaa1RK7F/9TVc?=
 =?iso-8859-1?Q?M7hbR0Ejw2lzK1F4XP9Q9GgrU4/3TDOdX5/Rr3vA66RaqvpfOIwjSo/bIP?=
 =?iso-8859-1?Q?CkOCoACy9C9IAzkRYLfENZQqEEQU+evEpcbugrwYC3XkwfYrNfuMTNmsxV?=
 =?iso-8859-1?Q?qNo1pbdwxDKY4bXCszZ3aLTWuYUL8gtaNKLYUwZaRmvlAPr18KtoMjpyHC?=
 =?iso-8859-1?Q?6lt56pygPkajnmZ1WAMN0KLOqE61QhmJ3rkvCWPFNVFFATguunuTgn2tsj?=
 =?iso-8859-1?Q?4d15CqYRILyjo5FBd6J6c5vEew9TZgHATPzeqs4VuUCosjMmR3kg4gi8LP?=
 =?iso-8859-1?Q?M4B5g2PQy/oybW2CNAh+peg3NyyqfqKL6KH80bl2j16fDpsleYWbUZgEIs?=
 =?iso-8859-1?Q?DZeGcyF63kT4DXaptg7tJAItmCotbwJAQgAdV7j7ahElAX3+8FyqpLk/PS?=
 =?iso-8859-1?Q?5cBg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8eccd3-0f95-4bdd-afc7-08da01efefa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 17:12:05.4415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oip8adgyc1/JCIBOCVtdg2MVyi3BY9vPke3GoNh9ivUUi+8xkqfOCWQMTxfG00s/Z5l+DhQbOfd9nbEwK388Fe8roZxJZv3Uf5YfvfHq5DA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4634
X-OriginatorOrg: citrix.com

> From: Bjoern Doebel <doebel@amazon.de>=0A=
> Sent: Wednesday, March 9, 2022 2:53 PM=0A=
> To: xen-devel@lists.xenproject.org <xen-devel@lists.xenproject.org>=0A=
> Cc: Michael Kurth <mku@amazon.de>; Martin Pohlack <mpohlack@amazon.de>; R=
oger Pau Monne <roger.pau@citrix.com>; Andrew Cooper <Andrew.Cooper3@citrix=
.com>; Bjoern Doebel <doebel@amazon.de>; Konrad Rzeszutek Wilk <konrad.wilk=
@oracle.com>; Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Subject: [PATCH v5 2/2] xen/x86: Livepatch: support patching CET-enhanced=
 functions =0A=
>  =0A=
> Xen enabled CET for supporting architectures. The control flow aspect of=
=0A=
> CET expects functions that can be called indirectly (i.e., via function=
=0A=
> pointers) to start with an ENDBR64 instruction. Otherwise a control flow=
=0A=
> exception is raised.=0A=
> =0A=
> This expectation breaks livepatching flows because we patch functions by=
=0A=
> overwriting their first 5 bytes with a JMP + <offset>, thus breaking the=
=0A=
> ENDBR64. We fix this by checking the start of a patched function for=0A=
> being ENDBR64. In the positive case we move the livepatch JMP to start=0A=
> behind the ENDBR64 instruction.=0A=
> =0A=
> To avoid having to guess the ENDBR64 offset again on patch reversal=0A=
> (which might race with other mechanisms adding/removing ENDBR=0A=
> dynamically), use the livepatch metadata to store the computed offset=0A=
> along with the saved bytes of the overwritten function.=0A=
> =0A=
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>=0A=
> Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>=0A=
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
=0A=
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>=

