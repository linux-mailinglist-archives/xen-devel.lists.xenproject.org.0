Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95097671E00
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480649.745155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8ay-0007EQ-0g; Wed, 18 Jan 2023 13:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480649.745155; Wed, 18 Jan 2023 13:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8ax-0007BV-Ta; Wed, 18 Jan 2023 13:35:15 +0000
Received: by outflank-mailman (input) for mailman id 480649;
 Wed, 18 Jan 2023 13:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKO3=5P=citrix.com=prvs=3750e6e72=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1pI8aw-0004x8-RS
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:35:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee2a207b-9734-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:35:12 +0100 (CET)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 08:35:09 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 13:35:07 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 13:35:07 +0000
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
X-Inumbo-ID: ee2a207b-9734-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674048912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HsT86MbsP11ALcUY7CsF2JFD+dHzsaEKtwJwQc9uT0A=;
  b=Fd0xNUQOwpakPov1mtlqCo86LifONXGp8EPKZBzWPBHX1Lm4Pu5Xof24
   GFflaaqf5LS1PX+8Lm3EYhg5rSXzttL8lYmBMu18Z1V9KGXh7TPSvJz5p
   dDglvX80iGUwlaL7JdiLAA6OaUyVtbdWOAZjFeNhSXxLI7NojhhQrlu2z
   Y=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 92622832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:T+AwNqBnbpCUSRVW/xTiw5YqxClBgxIJ4kV8jS/XYbTApD9w1TdTy
 GAeXzyHOPveMWWhfo1zO4q0/BlQvJ/SyNFkQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB7gRiDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwuaVPPW5B3
 6YjMjUyVxqipOzmwJCjRbw57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTm7IA9ZidABNPLeesaLXtlUl0Deo
 mPA82X2KhobKMae2XyO9XfEaurnzHmlAthCT+fQGvhCr2e8+GgdLjwve3CDrbqmil+iC/1nA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDht9HmHzt0q5WOVGmQsLyTqFuaNSELIEcYaCQDTA9D5MPsyLzflTrKR9dnVaSz3tv8HGiqx
 yjQ9XZvwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBe8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:o9eI+q0CudJa8JxF+5ywDgqjBLokLtp133Aq2lEZdPUCSL38qy
 nIpoV46faUskdzZJhEo7q90ca7LE80maQY3WBzB9eftWvd1ldARbsKheDfKlbbehEWmNQz6U
 /QGJIObOHNMQ==
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="92622832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtjfvgzrwkI2QywwcbmLcAwY13p7RVbWxX5megmxlKJWZRaOrWpIGC2wWRFfz+zEH3D44/tONk7bkAwvv0/QiSJee49FDCAaEa+nxglhhvK3E8rOSKXKeMoAyv0wLAR8x9Qm61YopYRaQFFx9tJQNix5DxAdldBHfY7+IHvx5sGGOUc6lyhbtiWXTpl6MK1XuRx+egYFpXft0ccjLQVUur+3wSWB6PgytxTNl3Jm4E2xLHFFgu4CVQrEOY0Xl5b2cQPaO1UCr5XuxIx2ag2wycVZbMWxOB0oyTZAyoCwjcnPKY5aTGbaI++F27y1TEmpfZ9BcukvbItXmdounUwTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LD1tWbftmkRjFPtPgfou7M08XKpMsZ7prFIdojMsm8c=;
 b=DjQkfGqXT7sNum+APTp7PYqr6ZEoTcf994ZhQXLyzlqPokf4+LViFq05abxYO7TGSSN1lrkHKGTDuM1HhlbM/PrhfJWaLWVUmdnZRqdZXfPKsjKV0sl8dCUyvpRDwWvYYxMmtWqU+8efyLiXANiKz4WOoBP561QuC4M6y78t46pEra5ZirBnTRAV1gxmJjc3Yjaf6Qken6jA1k7ozd3/3R7bkCkd1R6gfle1ovsdZSQHStqAICZPoGIGw/3Pc0V3gX0aj+M5ron46diCVD3LS/Vs6beJ9y0ynZsvvF4651AmxG/kkkebiAJKEP8k9kJgFS65Su1h1I7WJCPC3ba89w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LD1tWbftmkRjFPtPgfou7M08XKpMsZ7prFIdojMsm8c=;
 b=Oa50r+MVkeMV9DakL/2xY9GG3UtZFYfs5Ot/UuAF9eHzyMZpjXjiOasLJjAQwA+J66homoQ8XQomPjciPFkCcktRDbkrEI+tx2NZCGTiw2PmGLqstxT5VtnmYqYNK2rsYqJ7+5mBFuZ21N8wih+QqZ3dNQCqZId9eCazycqDoAs=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David
 Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 2/6] tools: Introduce a non-truncating
 xc_xenver_extraversion()
Thread-Topic: [PATCH 2/6] tools: Introduce a non-truncating
 xc_xenver_extraversion()
Thread-Index: AQHZKnsgoIAIvLZD2kO3NYPKMb1VtK6kLLyA
Date: Wed, 18 Jan 2023 13:35:07 +0000
Message-ID: <C4766A45-3923-4A4B-9FAA-547F66E7402E@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-3-andrew.cooper3@citrix.com>
In-Reply-To: <20230117135336.11662-3-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BN8PR03MB5090:EE_
x-ms-office365-filtering-correlation-id: 95894d0a-73d1-4d13-969b-08daf958d08a
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 jeyIZzKSHvi2Uw91FZFpbRgfw3JH5a92x7PlRW2EHDZV4trPlwECGRTo70x5SDqikttz3c3Eb1kjKpJSEJGHDLKgSh/7OGOYYh2kvY1zs19bNi79sjdu1uAKEI7zzlXo/aFb+ezexOtORXD+cHRMgZhBfWA0+DMEZOal2FK+23HuqK0LsZpA4uNjUKN8sLJec1uvc99R9YDIU7r8lsGXgc1LSDSny3vJx0zm4fIz2Q//0UFa6UW9w2rpgLqoTDwL5VwFWUBQfqmI4xdN6l53fjU8NndxoecTpvPuaBrwJHLRxq+C65We9OeJTKcvSSjtLi7F2e7ncS0xNO187D3WD6g/YktuP78p/UgnWKkb88k0b9ynHlPciRRfClqP0jGXGGI2lJk3LXj/U+l91vht4p9jAsaDII9NHsAM8gBfFBZMWI8a3bhrOhmvbUU2vzy91APg5ej1qW4noLaSJl6L6ESjElTw/Kcp5CGuRnsvo+PHkC1/Lr55vt2BP0NXMr174z7FPJvCPrD5hVnyFWKCIAftrBbUz7Pwm5M781J3Tmr2elkCiEJXk7wTN5G+xEBJlLCDr9V+A/iNqZDG1w9nRPcKetkGki2EpotPRKGO+X2F1Q8geBSF3MtmVywtPm0LZopxBGy/oa1TPfH1Owh4ML211uyDjmpmIx+0pJKv2t4da8WGbOtn2lET7zxk4BYw+PxksYoXQUdJcx7g16c/YnRhAY7vufGIrdz5vdYJ8GU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(54906003)(6636002)(82960400001)(316002)(37006003)(36756003)(122000001)(5660300002)(8936002)(6862004)(86362001)(44832011)(8676002)(4326008)(2906002)(38100700002)(64756008)(66476007)(66946007)(66556008)(66446008)(91956017)(76116006)(41300700001)(38070700005)(107886003)(6506007)(2616005)(53546011)(6512007)(186003)(26005)(83380400001)(6486002)(478600001)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?607/gNNiP7zNfoKVBDqApCUkFHw2kaJRpG2dqpXwcuvNdWfALB90jvykudUJ?=
 =?us-ascii?Q?E/KI7/AxBh49zvGDHaeNhBEgu27C0yCJW72dpwFqeBcCej3X4ovTzks/2BOg?=
 =?us-ascii?Q?x7Mhp6ohp0mHCuZs/1Fkw3QL07c+r+rLm5x4DbpH8C1fSdKAZEpzch034X6d?=
 =?us-ascii?Q?z+TTkKEx/bj9+tlk/P9lPoyU+9IXAz3i5XHzY89CBvlDx098AL3g0mJusHOy?=
 =?us-ascii?Q?sJ5zAf2E4PBnkEF8CaQF+GhiLc0TmYkuuLAalxb0XelLhW9TjVNjlSQW09c4?=
 =?us-ascii?Q?tqHUPUesG0MIg5dzkJXMN/ICso15MdPrEhBWQhff2lRSQ+lVu53XkY9Mn0zD?=
 =?us-ascii?Q?vUe3PDNsNWcWZ2uDtduarHxnExGbH9cDN4qUt+0C4Vys2Ref7BCjZbeDcmnC?=
 =?us-ascii?Q?+5rCIaSRZRgt0yopkQpt1TxlX3Di0iHnx1hfcXfyN1cMZkx0Fq3FggoGkifj?=
 =?us-ascii?Q?vQZ66eezhrRQnAeZ3hXQ3byDHpQbUHYCRjQvzEBj5eomyCXMB0nM6FFIB+UC?=
 =?us-ascii?Q?4BTlpDv3BCaO2wCeQ0+g/F2S8OhTU45EsZQM4HoIRsJEXLY1hpB6gGKoALYI?=
 =?us-ascii?Q?rpD7yUKceQkKCoVbkfbLAeBlvjFzeEf9CYOln7DpCnRSPeagXn4Cmua8qZ0N?=
 =?us-ascii?Q?6SH8dMyqfsrtC/frfeQEW5lHRMU6iLdwKCr8eM+cVAiBuQKP07lf9Vkny+Os?=
 =?us-ascii?Q?QdLCvmgC6fu3eXaZHKhWVH0rRkWlV5w0Q+v5Pc3mul+4xCMHh4oZcP23Nib8?=
 =?us-ascii?Q?xcUSxoal+9NHRxltUqb3sW1WcioilX77PPeiAaqh1U2ry9xQLAdnuK83CVQh?=
 =?us-ascii?Q?YAkVH/zGNTVzQzn1FtHIFrthaKjJeyPNjlw//UF5RFryPgj0m8npnHPhrdek?=
 =?us-ascii?Q?wsdB88xwy8EYcIS5LbM2bJdccwT0UcIlIi00dEcz7VNwahF8NbaU/OuUiv4y?=
 =?us-ascii?Q?Uw9LG6rYE3tgxAjaqhNok39OxOOsiuO5/YH/eZb/oBSa6wh1EJfaE6l0MuNY?=
 =?us-ascii?Q?Ns2A/ASTK7agjH2OwkekBPJh5PWDCIUYDk21oj9sSJGJAj1RbFQqNQVJsj1d?=
 =?us-ascii?Q?9eEm0JFWbYRUNIVe4L37Qn2gODKbzbC0djVNBHSoQTtc1dgZQraqhtrRukAS?=
 =?us-ascii?Q?le/+KqenhCO2/PQJzIRJIlrSao2URPk+ziOYrHB6+8S0zS+HCXBBYjiV1Rsf?=
 =?us-ascii?Q?f2PzCa7WOC8cHbLxt/91D+nxrIQGKTB6K7FAM5OZq1MozfnykL0z4YHGWYyR?=
 =?us-ascii?Q?mSBB0eEmfUvo5lHjCmRfhC73DjKAdMR1qRUTZAwjYK5tt8CiLmPgPhHJJ0p/?=
 =?us-ascii?Q?18dKQ91Q4kaDFshi+PYGIfuouidxgXyiKrlax0J89nPeiqCCArhMNoz9+EOk?=
 =?us-ascii?Q?Wm+DK8I8NLGh8ht84GJPhyHWVPC8+LFcMzgkPq6bV7Bdqs+29tDUvRZm59Rv?=
 =?us-ascii?Q?U5AtPsz68Uy/Slmqw3Q4u5Za1TBKqKYGSq92ILVXOCbnfvdTjwbWVXeuthQC?=
 =?us-ascii?Q?VEM4ioLpa+P82kr7Wbp3mvBZI+yd+X24MI5mjOHJhv6c6bW7JRiUblB/xCov?=
 =?us-ascii?Q?rqAki9hlw/z480Xcl3KuNYc6BzYoM4cDzLIEv1CH4sWBlf8C4dX+OP+ssurY?=
 =?us-ascii?Q?3L1CnVBZ/jQ0MepM7gw6nZo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A42B9DC4866CF544951C9C79DCCE2E63@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7Fmk46zbSiWg+4w29aWxz3Ao1qkQkHVxMvnbLLK9fDJiduBQnUTcjTf+aMKj0H4rG6mZjbPgEU2/43dQpI46JpMG06cPZDbnRT6Llf223HY/GPR7Yb70ZmJ98sEVSfaePfDNbvFz7+r9WVi5skZE+aIi3x9cS2C76u89gRZIBrI7cXD1vj6ndeWdad4yFruOLc+Rppjw8yNIPTMIx49ZhCXVcczAPRJq9sB133Bl51dJzf/FVJdKp/4JMqk9rGkdm866djpopbHfnlMVUrbdsMhcadQQlTjnBKZuNnRdzrjv1lWq6FBy37hC+inNNQxbCiC6vdHQRtheZ2nGcz/Dcdty/Lm3swspheH6OwkHzBScM8uBOCq7EAvFMRGYP6nVWX00NNZMFA5LwKd8W+V38kP6ge5NF3mffkYSxdtjmDSmmWeF5+jJmoTxqwFJ6Oh2LVGnwyQu/ggH1LPJMpIbn3DJspDIkHO7BlzB+Hr7VUUYItMy86y51D35a4/5KlVSYZaO6iTMerCnnrXHs80VYlzriOi6s0WFSB5BSboYXPKCJ1q/Ba32s/HjESof/PQ4LgZdEUTwsrxLWss4xfBSh2q54ms86C5Wwj+QRziPANFmB8938ZNbIaVXt9BqqD7wpmWblcfwtszkVNDSFDQ+8qBzciZvozJJ4chOFDo3bWsQx3XMFPO4MaUFxnINJFauL+BA7mqBMkVNOxgP2rbVIffkk+VdR6MbonczUtouRV9heyiVeO4Ts1nHr0EvZTAUePgkqhAybSKiAwgaeGevIwZwKafWdJYiRkIZbn0YQuqgdSHWSa8en5GFTM2IT0W2rSW3krJzuRdvHcc7CfYGDd2QtvdpWY12Rh+cq/gjaxk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95894d0a-73d1-4d13-969b-08daf958d08a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 13:35:07.7059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ap61KV5HuiwHz5a3cjhuDGyxk3Q7MY4iwrao3Nsttii+BhVom7t67M/cAi8UVAEzjE/qjsyeI7cb0vTrw27PwH7L74/NdJBxxUaGFMhgCSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090



> On 17 Jan 2023, at 13:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> ... which uses XENVER_extraversion2.
>=20
> In order to do sensibly, use manual hypercall buffer handling.  Not only =
does
> this avoid an extra bounce buffer (we need to strip the xen_varbuf_t head=
er
> anyway), it's also shorter and easlier to follow.
>=20
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
>=20
> With this change made, `xl info` can now correctly access a >15 char
> extraversion:
>=20
>  # xl info xen_version
>  4.18-unstable+REALLY LONG EXTRAVERSION
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>

Acked-by: Christian Lindig <christian.lindig@citrix.com>

>=20
> Note: There is a marginal risk for a memory leak in the ocaml bindings, b=
ut
> it turns out we have the same bug elsewhere and fixing that is going to b=
e
> rather complicated.
> ---
> tools/include/xenctrl.h             |  6 +++
> tools/libs/ctrl/xc_version.c        | 75 ++++++++++++++++++++++++++++++++=
+++++
> tools/libs/light/libxl.c            |  4 +-
> tools/ocaml/libs/xc/xenctrl_stubs.c |  9 +++--
> 4 files changed, 87 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 23037874d3d5..1e88d49371a4 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1604,6 +1604,12 @@ long xc_memory_op(xc_interface *xch, unsigned int =
cmd, void *arg, size_t len);
>=20
> int xc_version(xc_interface *xch, int cmd, void *arg);
>=20
> +/*
> + * Wrappers around XENVER_* subops.  Callers must pass the returned poin=
ter to
> + * free().
> + */
> +char *xc_xenver_extraversion(xc_interface *xch);
> +
> int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
>=20
> /*
> diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
> index 60e107dcee0b..2c14474feec5 100644
> --- a/tools/libs/ctrl/xc_version.c
> +++ b/tools/libs/ctrl/xc_version.c
> @@ -81,3 +81,78 @@ int xc_version(xc_interface *xch, int cmd, void *arg)
>=20
>     return rc;
> }
> +
> +/*
> + * Raw hypercall wrapper, letting us pass NULL and things which aren't o=
f
> + * xc_hypercall_buffer_t *.
> + */
> +static int do_xen_version_raw(xc_interface *xch, int cmd, void *hbuf)
> +{
> +    return xencall2(xch->xcall, __HYPERVISOR_xen_version,
> +                    cmd, (unsigned long)hbuf);
> +}
> +
> +/*
> + * Issues a xen_varbuf_t subop, using manual hypercall buffer handling t=
o
> + * avoid unnecessary buffering.
> + *
> + * On failure, returns NULL.  errno probably useful.
> + * On success, returns a pointer which must be freed with xencall_free_b=
uffer().
> + */
> +static xen_varbuf_t *varbuf_op(xc_interface *xch, unsigned int subop)
> +{
> +    xen_varbuf_t *hbuf =3D NULL;
> +    ssize_t sz;
> +
> +    sz =3D do_xen_version_raw(xch, subop, NULL);
> +    if ( sz < 0 )
> +        return NULL;
> +
> +    hbuf =3D xencall_alloc_buffer(xch->xcall, sizeof(*hbuf) + sz);
> +    if ( !hbuf )
> +        return NULL;
> +
> +    hbuf->len =3D sz;
> +
> +    sz =3D do_xen_version_raw(xch, subop, hbuf);
> +    if ( sz < 0 )
> +    {
> +        xencall_free_buffer(xch->xcall, hbuf);
> +        return NULL;
> +    }
> +
> +    hbuf->len =3D sz;
> +    return hbuf;
> +}
> +
> +/*
> + * Wrap varbuf_op() to obtain a simple string.  Copy out of the hypercal=
l
> + * buffer, stripping the xen_varbuf_t header and appending a NUL termina=
tor.
> + *
> + * On failure, returns NULL, errno probably useful.
> + * On success, returns a pointer which must be free()'d.
> + */
> +static char *varbuf_simple_string(xc_interface *xch, unsigned int subop)
> +{
> +    xen_varbuf_t *hbuf =3D varbuf_op(xch, subop);
> +    char *res;
> +
> +    if ( !hbuf )
> +        return NULL;
> +
> +    res =3D malloc(hbuf->len + 1);
> +    if ( res )
> +    {
> +        memcpy(res, hbuf->buf, hbuf->len);
> +        res[hbuf->len] =3D '\0';
> +    }
> +
> +    xencall_free_buffer(xch->xcall, hbuf);
> +
> +    return res;
> +}
> +
> +char *xc_xenver_extraversion(xc_interface *xch)
> +{
> +    return varbuf_simple_string(xch, XENVER_extraversion2);
> +}
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index a0bf7d186f69..3e16e568839c 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -581,7 +581,6 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
> {
>     GC_INIT(ctx);
>     union {
> -        xen_extraversion_t xen_extra;
>         xen_compile_info_t xen_cc;
>         xen_changeset_info_t xen_chgset;
>         xen_capabilities_info_t xen_caps;
> @@ -600,8 +599,7 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
>     info->xen_version_major =3D xen_version >> 16;
>     info->xen_version_minor =3D xen_version & 0xFF;
>=20
> -    xc_version(ctx->xch, XENVER_extraversion, &u.xen_extra);
> -    info->xen_version_extra =3D libxl__strdup(NOGC, u.xen_extra);
> +    info->xen_version_extra =3D xc_xenver_extraversion(ctx->xch);
>=20
>     xc_version(ctx->xch, XENVER_compile_info, &u.xen_cc);
>     info->compiler =3D libxl__strdup(NOGC, u.xen_cc.compiler);
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index 2fba9c5e94d6..f3ce12dd8683 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -929,9 +929,8 @@ CAMLprim value stub_xc_version_version(value xch)
> {
> 	CAMLparam1(xch);
> 	CAMLlocal1(result);
> -	xen_extraversion_t extra;
> +	char *extra;
> 	long packed;
> -	int retval;
>=20
> 	caml_enter_blocking_section();
> 	packed =3D xc_version(_H(xch), XENVER_version, NULL);
> @@ -941,10 +940,10 @@ CAMLprim value stub_xc_version_version(value xch)
> 		failwith_xc(_H(xch));
>=20
> 	caml_enter_blocking_section();
> -	retval =3D xc_version(_H(xch), XENVER_extraversion, &extra);
> +	extra =3D xc_xenver_extraversion(_H(xch));
> 	caml_leave_blocking_section();
>=20
> -	if (retval)
> +	if (!extra)
> 		failwith_xc(_H(xch));
>=20
> 	result =3D caml_alloc_tuple(3);
> @@ -953,6 +952,8 @@ CAMLprim value stub_xc_version_version(value xch)
> 	Store_field(result, 1, Val_int(packed & 0xffff));
> 	Store_field(result, 2, caml_copy_string(extra));
>=20
> +	free(extra);
> +
> 	CAMLreturn(result);
> }
>=20
> --=20
> 2.11.0
>=20


