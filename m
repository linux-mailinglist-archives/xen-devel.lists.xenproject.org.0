Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D86671DF7
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 14:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480628.745133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aE-0005Yk-Bq; Wed, 18 Jan 2023 13:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480628.745133; Wed, 18 Jan 2023 13:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI8aE-0005Vu-6B; Wed, 18 Jan 2023 13:34:30 +0000
Received: by outflank-mailman (input) for mailman id 480628;
 Wed, 18 Jan 2023 13:34:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKO3=5P=citrix.com=prvs=3750e6e72=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1pI8aC-0004x8-LT
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 13:34:28 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d37c940f-9734-11ed-b8d1-410ff93cb8f0;
 Wed, 18 Jan 2023 14:34:26 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 08:34:18 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Wed, 18 Jan 2023 13:34:13 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::a77b:c822:a19b:ef23%3]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 13:34:13 +0000
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
X-Inumbo-ID: d37c940f-9734-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674048866;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=iIHbU7EbGiyP84fRV4JFVvFv4LLq7Uyjvv5HRkkyXmE=;
  b=HJrJRutjrq4mTVM+xN3Lk65R1b3GVvqmT+IJ4o6GPbVIohOI18OIGwYd
   CyRC/+P+bptZzNO0tHQ9o53Mo1IdDCAQEYqAKCis8WBNmLZ3nd+wZT9/C
   UlRLvKsbQ9kWWGT4+DLBbyH8qGLML5xEC2Av7oRnAVRB8oY3gOKxKHTRO
   c=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 92622745
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PLitN68B+l4aOnyGK9cuDrUDvX+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2ROWmrUPayDNGL3Lt0iboS//E1VvpCDzoQxHVRtpHg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKkb5AO2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkVz
 9cBGm8JaiyolrOIw7S/ddhiudkseZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujtABM/KMEjCObc5VhEeDu
 mPP+SL9AxcWNdO3wjuZ6HO8wOTImEsXXapDTuPirKE23TV/wEQLMj08VEClisLkqROARvsPK
 k0b/icH+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRHsrKPTmmG3qyJtj70Mi8QRUcObDEJZREI6N7ipMc0lB2nczp4OKu8j9mwEzegx
 TmP9XI6n+9K0pBN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLtm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:jAVjZqG91ipUi8SNpLqE4MeALOsnbusQ8zAXPhZKOHlom6uj5q
 KTdZUgpHzJYVMqMk3I9ursBEDtex/hHP1OgbX5X43NYOCOggLBR72KhrGC/9SPIULDHl8379
 YFT5RD
X-IronPort-AV: E=Sophos;i="5.97,226,1669093200"; 
   d="scan'208";a="92622745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kf2i97KXE6CV0/DHomVRGZ6Hxz+bYF5TwZ7SDRK7AeFQQNlzsoyfnqSSd6tfYrXgSpZyZti4SczIIwwMosb5m0irYSy6LQ6IKx+NOp7WGELXSbaWoB9m/r3kfSAShgyhN3CEl5Z3QubdeZh0dF+VKJsbKFZbndaqXqrbcgJxpr4MyqxpsWcgrDfTJZrNEPHEMBeW9QrfU20Z7wn0AIMlb0fRUslXCZDHt1E/eG5vYuBceAibQZhjbVLLNIxJSAsED7dD9GRgvnRA7rsQxkJ9T6A0FN45RZK+uggrXizk99l99mKUUILwjyFLVyeipkLamyPzPcJSH+yzWa/zjUTQog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nh+if3ho7GK7CykAU+41RYUAatQCoDUpykcYpBTVRE=;
 b=oOsbVgLAD/bZcabz3bbtydah7jXHTS6hUZoCPc1e6umNvUFlp/is6NZQRqF+7ZbputJsRCAaCcHkKykacNBfsMZwdiScSeVbqLdkWB3jDSDXvR3RGeMj1CeLdiQYR+b+Knk4bZRdO1DIbsjWcT0HIfABrBrixBFCJiDvMylLswKNzc4HlR7YorubS+iLGon725sEJaWQEIoSs0TJ9Em+8o/HTZgIauWuSReGLbHT/eBdh/kQXpzlbQSRxDZPFC9qg0g56qoAF0ufqZCeyarKlbU1kyFxjbWDLylCYWhJP8I0/+RY2C7T6F9mLaYhJOGfSz08eIH31WVVTcAESyXlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nh+if3ho7GK7CykAU+41RYUAatQCoDUpykcYpBTVRE=;
 b=lAtel0v1vgVCSIEe6czs9AkDMyqfkY1fUO1/D3vq7LmlZg9bnInTjuuPoh2ePYiuOH2Tll9ZJ48UIBQTMNYiS+CG1WUBD5FOJKHjWqpHGE5zMqKXdX+OVqJdADCYfCE67GjuQcfQeSdBtYKSKP3UGpS9i3PUlXqggcsmvGS8dBw=
From: Christian Lindig <christian.lindig@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, David
 Scott <dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH 3/6] tools: Introduce a non-truncating
 xc_xenver_capabilities()
Thread-Topic: [PATCH 3/6] tools: Introduce a non-truncating
 xc_xenver_capabilities()
Thread-Index: AQHZKnsh/SnHJk9rC02Qsh/SBqHxSa6kLY6A
Date: Wed, 18 Jan 2023 13:34:13 +0000
Message-ID: <C037D1D3-7718-4F77-BE10-B4EBEEC36F69@citrix.com>
References: <20230117135336.11662-1-andrew.cooper3@citrix.com>
 <20230117135336.11662-4-andrew.cooper3@citrix.com>
In-Reply-To: <20230117135336.11662-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|BN8PR03MB5090:EE_
x-ms-office365-filtering-correlation-id: 87ea2ea3-1332-4ca7-738a-08daf958b04f
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +0ta2KwTPUjcoIobgZ0wbr7hjdeFRy2/173VAG/1kWUm2eYH+/hpMcvoh7Dn0zjSpY4vjRuhr269zjOSy6tcw2p22I/Lk+dieXiL8tlYJ1sEXnGYsTPuSsuAcbnKiGGB194VHff9+eORwjxtBgtx4jTbhGmiAcRLhikuUitRXg8nC0cJj+o6qvpNr6Iu1LgNTgSn37cUMTZNvLpjgYdSHI2lczWeELN7mruCMKHfjgO3iGRDrvUodYOMQEBFGfbigoif4oZrgWeOFCkXgpyw0INVqwZtZmo8b2+zUbIUDkHj2nskyiWORTI7ROBRIyUnnwIKJmWyigOQwY9dwyvH5RPeN42i2GVyQ0J3xNZ11n35uj0K/+UAF725j22L2KX65MvhhAEk8cP0pemJpHRQSLIXs+a0prBhdFXBOuC6ZQAkY72UMjYMsNNFwe2zkWwopB5gd3Ts1rreLbf0QO9trSS5asoybSvJ7OVuXikVOJnDzWeWprVUzMMbnhD43EkoOjrARcnEOzAYAOhoWezPXkqe9Wz4nrKKSIbgKAolxbrFUV2Gh2ijC00U/cN0CQ/z3Frj6oTco3QOAvOKap2NYNZPGaXrEBfzysgwhqSGnmcZaS7n0JdxGqfaXPpFxDgYbLcVyaKJxhLGGh0xxHNhDzF9rIccK6vhihwsnSw8c8BG+TM+Pb2+HKFgS5C/LNSHsFntmwrjQJ3hr79j4tltu+U4WFJmva+6Ii20UERTrQU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(54906003)(6636002)(82960400001)(316002)(37006003)(36756003)(122000001)(5660300002)(8936002)(6862004)(86362001)(44832011)(8676002)(4326008)(2906002)(38100700002)(64756008)(66476007)(66946007)(66556008)(66446008)(91956017)(76116006)(41300700001)(38070700005)(107886003)(6506007)(2616005)(53546011)(6512007)(186003)(26005)(83380400001)(6486002)(478600001)(33656002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TQOrBSHyEfiym066d5X/20pAd/tYKQXanFlvy6TnYUiqOxihUV5cLgiKHB57?=
 =?us-ascii?Q?qcQcn7ozTEUX70zO5KOA55/e1orrGUQczdYbZvQdP/mAGUb0xWg7KpPo5zHu?=
 =?us-ascii?Q?2c+cartM1RzoP1yXwWxwQpoCC7/a/wHEwaSVR0+zCcfH3LYUVPDUURLfWLoY?=
 =?us-ascii?Q?zGntx1CncSPMTtgFBp6q1liEiLT9eAdXXKrop2AtlSWlWmAIYJN9Xss+aEEn?=
 =?us-ascii?Q?yQCE67r6scpRErOLuvKla42czk/vq1u+I5O+YizDH792xfd9NpDPGDoxtM3o?=
 =?us-ascii?Q?geRhIUheXBUP6sBgXGmUqOSRNLJQrrSNjBUC1IIhzJnedOkvwDrK/XKNKEhQ?=
 =?us-ascii?Q?R4ExdQDzq5Ay73dlF9EStln/BXFMIuTQoD/AmAwn9yf2bZ33iwvSm9fKaKGJ?=
 =?us-ascii?Q?NIXshwXnwBPrgIsFWZsRXCusvQk3QmX8G6HZpNE1KbbZVhso2e68uhTfy0Aq?=
 =?us-ascii?Q?l5pRrAGROJcMAkjhTIAT7B7WvgCPM1CA4viit9HhtoUxeTGz2/r0z3qgswON?=
 =?us-ascii?Q?tIbKKxFGFUoLCv4JhJiiU5HXibU4ht6yB1no8UuvLcXwMAWuPfNCLeSJutLD?=
 =?us-ascii?Q?zxisdvXER0NZTVJrJy86bWY54wQh87xHOJGp21F7PBXiVgEi/IO45lkNtDu4?=
 =?us-ascii?Q?bDtuf5VXsQQWXghDlKj9kxf1VqfCe3nml8Q182k1FfevQm+yrcoOdcuh3Nbh?=
 =?us-ascii?Q?b3nBlMCU7BjTNOl0x/fcPAKPrEapB1cy/l3VaKPaPKKNlshEfPEM6Ch+/SyG?=
 =?us-ascii?Q?6Don35vPbvo1O2DNvMAenbWGY3OcW+Zwmh3LpBHjvIW3xiJMfPveMx3A+Wim?=
 =?us-ascii?Q?p6oL7YDd8UHwU3AmHCKcxmHU3F8nYSx3/3kdUthAhJ6hNLlcllldmQ4Kt5/W?=
 =?us-ascii?Q?Hy20sq9HIQZoTwYsOzvbipPt6WRLegP6MtYUWV+F2PRwwEdYOdeFTYCFqfLP?=
 =?us-ascii?Q?04/NbvJcLWEiEactYiYhlEMnwO7PpZjo1o9UF/K3I80jzXx6fQwxZctcVbVO?=
 =?us-ascii?Q?S4DsdVguos0kE1Bvs8QioLvHEnG/Tc6iGMu3OffaTSFUyigXt4vPR7ih8YGw?=
 =?us-ascii?Q?XiASsEFZT6g9lFvU8+MAP0mBhdnutj6kuMlQIv+SDa3qkZ1Tq9OLXDYHtLze?=
 =?us-ascii?Q?uBviPuJCUSVDSynp2hbxl01GSOAuACHu/R5OafTIoB9xGpLpu42G7rlZW4DQ?=
 =?us-ascii?Q?5657wN2XVxcs6fCCdlWuyIUI3Nf65unA5c8wEG516pdegXl3xWg43fOhoLSB?=
 =?us-ascii?Q?Ezu6SuxBvzqh8OsGufjDgFmWrzO6rcum0uV860zr1QHrnS0iR5hgKK5Ienz/?=
 =?us-ascii?Q?R7ZyaauHUR0n/9bRqvu87MFh/Q/5PS2oFusHguYVMjv+GTjM8aNQyJfeRZOF?=
 =?us-ascii?Q?nGGAVbjLn5qRnBgyBXD3LD8zhTKAS/xiy4jT99/OQijVUmR4C7c0QvO29HmP?=
 =?us-ascii?Q?hx6LfL3pDFqq5aGM8tS8fWnIPUyxXCkLqdsDV+ZLWdsFu6ZTBal44+mAa86H?=
 =?us-ascii?Q?EBT+KWDN5RDxdF1r4+Ul7/a+8dS6mBcE3HxNUmtwRGfHbqxUbQ52cGLNpUeE?=
 =?us-ascii?Q?V9HkT60QnwL++Tng5MSAFdOc5yJwsqzkIJ28Ghtte+Gn3MXChwTLZqQw5UWX?=
 =?us-ascii?Q?hzxOY/uelxBViziqULwpt8U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <77708C641A91E541B06233AD81F75CFE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YC9T79eHck56E/jE/Dif570Tv7Us4VXj6oe55Cpbb39EP7xNSLCluRu1nkz6j58xuVxF3Nqdbe5uWknDAmfgLD8Af12rKhgcVgeXPxviH61VaTXYoqKqwECGG+hP0ZA6UNYNTOSiDNiv48/Y8Egj1j4Qjsc2bnslpC3V293+aGNWwfuNdXVKpyUpbMP2MPDi0GY9ho7AjZM1kG0kUFmMRg4uqRDkFIAe9RUtStV6CdiY8kuHBEebIwDEs+qEjoeG+1b22IvYGmS4xHK4WrycS3X/4KaCrAZL73tlRv2OWw/wc/KB51zhmx8tCzAM5wuTgTirptBFYDJ0auL0neXbrjSvy92Yeb+62B4nr6CCCYUw9FcqaLCozf99Oj+lDs21kY74ECBUQmbAqH0p8P2glgouOE7X5LWlMZdfEwnCt5Ht4EVo/2cOaZFVm07Y5uYX0m62Elr9xQ2mBxgAo/uND/6oToBzuZ5UFcz51yhZK3vIjvlTCsR4c0hwkBhKbrEVz+RKZyVpDyReGDHy7u4k0uEUFZokl5cv3btLmyrHxpOKpGMlyRfXL7dhoZtvhPj2DCDceSjcmQwzcPW+azKc5IGKHr4oS07oVH9wqGEHfEH8jP5ex/srKDU90/l1TtnDZ/fiFxF3yJ7T5CkpPrnTnMAAntaWj5iqgLDlnbl8cHsDZO0m8Ue8wz6knv8Hdkuyequ50Qjh9ch6EXvtgvR8Afg8H1MXBgHJ4500HyyOL+hPy3JH1Y6ByOIMZMIKdqHc6tvdEAEYmCL1O1LyDTzThjBnrn9YXtLR0+s5431wIVCv6bvBhXBMiIyxNMxNbgabVrh9001/cOL+q+2ab4uuLPcvEIAhcK6fO6yK7oUt0kc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ea2ea3-1332-4ca7-738a-08daf958b04f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 13:34:13.6000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ysXHeytzIC7c5whheJcUqMrDJDPFHqCo1W652gTmE87xOu70oiLZW96MJKzX7Tt3NeUsJsyphW1kdhXXOsNsRY/9EZrQ/9xy01X1reLqST8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090



> On 17 Jan 2023, at 13:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Update libxl and the ocaml stubs to match.  No API/ABI change in either.
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

> ---
> tools/include/xenctrl.h             |  1 +
> tools/libs/ctrl/xc_version.c        |  5 +++++
> tools/libs/light/libxl.c            |  4 +---
> tools/ocaml/libs/xc/xenctrl_stubs.c | 17 +++++++++++++++--
> 4 files changed, 22 insertions(+), 5 deletions(-)

Acked-by: Christian Lindig <christian.lindig@citrix.com>

>=20
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 1e88d49371a4..279dc17d67d4 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1609,6 +1609,7 @@ int xc_version(xc_interface *xch, int cmd, void *ar=
g);
>  * free().
>  */
> char *xc_xenver_extraversion(xc_interface *xch);
> +char *xc_xenver_capabilities(xc_interface *xch);
>=20
> int xc_flask_op(xc_interface *xch, xen_flask_op_t *op);
>=20
> diff --git a/tools/libs/ctrl/xc_version.c b/tools/libs/ctrl/xc_version.c
> index 2c14474feec5..512302a393ea 100644
> --- a/tools/libs/ctrl/xc_version.c
> +++ b/tools/libs/ctrl/xc_version.c
> @@ -156,3 +156,8 @@ char *xc_xenver_extraversion(xc_interface *xch)
> {
>     return varbuf_simple_string(xch, XENVER_extraversion2);
> }
> +
> +char *xc_xenver_capabilities(xc_interface *xch)
> +{
> +    return varbuf_simple_string(xch, XENVER_capabilities2);
> +}
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 3e16e568839c..139e838d1407 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -583,7 +583,6 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
>     union {
>         xen_compile_info_t xen_cc;
>         xen_changeset_info_t xen_chgset;
> -        xen_capabilities_info_t xen_caps;
>         xen_platform_parameters_t p_parms;
>         xen_commandline_t xen_commandline;
>         xen_build_id_t build_id;
> @@ -607,8 +606,7 @@ const libxl_version_info* libxl_get_version_info(libx=
l_ctx *ctx)
>     info->compile_domain =3D libxl__strdup(NOGC, u.xen_cc.compile_domain)=
;
>     info->compile_date =3D libxl__strdup(NOGC, u.xen_cc.compile_date);
>=20
> -    xc_version(ctx->xch, XENVER_capabilities, &u.xen_caps);
> -    info->capabilities =3D libxl__strdup(NOGC, u.xen_caps);
> +    info->capabilities =3D xc_xenver_capabilities(ctx->xch);
>=20
>     xc_version(ctx->xch, XENVER_changeset, &u.xen_chgset);
>     info->changeset =3D libxl__strdup(NOGC, u.xen_chgset);
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xe=
nctrl_stubs.c
> index f3ce12dd8683..368f4727f0a0 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -1009,9 +1009,22 @@ CAMLprim value stub_xc_version_changeset(value xch=
)
>=20
> CAMLprim value stub_xc_version_capabilities(value xch)
> {
> -	xen_capabilities_info_t ci;
> +	CAMLparam1(xch);
> +	CAMLlocal1(result);
> +	char *capabilities;
> +
> +	caml_enter_blocking_section();
> +	retval =3D xc_xenver_capabilities(_H(xch));
> +	caml_leave_blocking_section();
>=20
> -	return xc_version_single_string(xch, XENVER_capabilities, &ci);
> +	if (!capabilities)
> +		failwith_xc(_H(xch));
> +
> +	result =3D caml_copy_string(capabilities);
> +
> +	free(capabilities);
> +
> +	CAMLreturn(result);
> }
>=20
>=20
> --=20
> 2.11.0
>=20


