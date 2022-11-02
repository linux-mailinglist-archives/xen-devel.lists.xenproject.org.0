Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546C6615FC9
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435713.689415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqA6d-0002uB-Rv; Wed, 02 Nov 2022 09:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435713.689415; Wed, 02 Nov 2022 09:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqA6d-0002ri-Ov; Wed, 02 Nov 2022 09:32:19 +0000
Received: by outflank-mailman (input) for mailman id 435713;
 Wed, 02 Nov 2022 09:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/HA=3C=citrix.com=prvs=2988f804c=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oqA6b-0002rb-M5
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:32:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4cb807-5a91-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 10:32:16 +0100 (CET)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 05:32:13 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by DM6PR03MB4972.namprd03.prod.outlook.com (2603:10b6:5:1e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Wed, 2 Nov
 2022 09:31:11 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa%5]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 09:31:11 +0000
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
X-Inumbo-ID: 3c4cb807-5a91-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667381536;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2DhY5H+/0wbCMl95XLJ2Ekls9iBh3MHnpW/yKvtLgaM=;
  b=NAcDWTcLOgDqiGreyFZ2g9K2twCxpRW8WY3jNdcLpqLv11dC/xUc+WhG
   QDCOm7VC1f7M/Pv8Csuz+mbvIfsKAi8tuKSTgt3jzlEETLOk9a7bsnTb+
   Oxm9OP5eHGyC3HFpGVQ/b8Obw/f1osYtXxKkoL5A1cDDwEgSyz/2W0Nug
   0=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 84416478
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V82CsqprHmY+0XFbSp6y3nBwt25eBmI8ZBIvgKrLsJaIsI4StFCzt
 garIBmDOa3cY2f0LtAkPdnlox5T7MeGy95lS1A6+X88ES5G8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W5wUmAWP6gR5gaHzyNNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABRSb0yi3f3t+/GQGvtNgeQvccLMZZxK7xmMzRmBZRonabbqZv2WoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+OrbIW9lt+iHK25mm6Vq
 nzH+SLlBQsdN/SUyCaf82LqjejK9c/+cNJOSOTmqqE66LGV7kJUUCQqbUOWm8KCpGOkWs1aC
 RYpoiV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc6TCIn/
 kWElNToAXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog21k7LVow7TPHzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:kAA6FK4np4yXttbTIgPXwWuBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc0AxhI03Jmbi7Scq9qeu1z+853WBjB8bZYOCAghrlEGgC1/qp/9SEIUHDH4FmpM
 BdmsRFaeEYSGIK9foSgzPIXOrIouP3lpxA7N22pxgCcegpUdAY0+4TMHf4LqQCfngjOXNPLu
 v42iMonVqdUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWStGNwyUGT3fARAghKRfapzLgpDCfx+g4uuspx37
 lM2H/cv51LDQnYlCC4/NTQUQp2/3DE6EbLAYYo/gNiuKYlGchsRLYkjTVoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4eo+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QSqvCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx9HR6svM7z64HRmyGG/fIzmZ0Wd9ih33ekIhpTsALz2LCaEVFci18O9vvR3OLyoZ8
 qO
X-IronPort-AV: E=Sophos;i="5.95,232,1661832000"; 
   d="scan'208";a="84416478"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXKatotv+pKx1Y/04ERK2tzaxPOg/hIgMHNVAIOL/xFMaYZYLPpZePZgMBqms+xmU71LUQywCapNPu070KgN9PMDcKx8gQsVeWJcRwmcTfU8VSFFsy4fjuTopJk1dvO+TT6tX8no7gRN9HV8o4j2KgB10VRjbwlyE/vv4M1nrpIu53jQNdEZECSrAlaN2Gpg9FT7ULRSaevjBG7f+bLvIt0zAjPM7GmYpqA2dCG8fyN1xw6jgho0cKTNQbu7dp2iqYnb0IqeR4gz1mdSr4LQcbnXXgdYUSPwRGdlzto3UvHaKKurgBwhnvJekV9BhmN9v15pSFESOGH8wIQuhzyy2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DhY5H+/0wbCMl95XLJ2Ekls9iBh3MHnpW/yKvtLgaM=;
 b=QGrSISuxwoLjZlxdGZu2Zggem5/jNPtje5RpXgKXJXdeFNdIWKbWnEP4JnqCRNmjj97H/Y14pK//WAUFAUYTVQltwZXpOzsTiF7zX9pjG9CWuXTKYxXwgiPMRKIPSWA6qGy0sgteo2rYrvybcH04S5ubsXqSeyej4WxUMxCvZexGLSUa7NeY/tC5Z4tjOvaNd5QlyouijV44xSeTOBaeFjuCZGdpxHBEi6XLVzPMm2Y1WpCoXLVQIRgMWvS8ux+pyZdUw3ybLidsx0O8hEpzanPKL2oTQ05027LMrzM5AvyYF+DY7fQoJ6d4lcPrUxDtd/Z5fdYpSLez97gc9q0rew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DhY5H+/0wbCMl95XLJ2Ekls9iBh3MHnpW/yKvtLgaM=;
 b=m61A+Lk3i2U8IGsjSSTxtLpFZp2cMK9qBhBwOECX/uxzVapkjqe+Hit+vCh0/j3+fewAldKQDB+9sQIG/2k8YR77f+O2YXViLJQlUtnJqv4h1cokxhKYH/CBZrhZrWlFnIh/d3aaeArafvH4cE9QXGMzo8Wu16ZDcs9dlO/ASFg=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Pau Ruiz Safont
	<pau.safont@citrix.com>, David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Topic: [PATCH for-4.17 v1 0/2] xenctrl.ml: improve scalability of
 domain_getinfolist
Thread-Index: AQHY7hu6Hfeu3cnxk0m/6L4xh+MTgK4rWegAgAAFhIA=
Date: Wed, 2 Nov 2022 09:31:11 +0000
Message-ID: <068F2C45-AC7C-407E-B6D7-90D4E98FBB76@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
 <1FD039A8-AE3A-4D6E-A2E9-F446FD6653DD@citrix.com>
In-Reply-To: <1FD039A8-AE3A-4D6E-A2E9-F446FD6653DD@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|DM6PR03MB4972:EE_
x-ms-office365-filtering-correlation-id: e8298f17-7105-4185-410e-08dabcb4faf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AM4bbTnQlajEHd2Lfi3FnMVqsAvtxWhE9UZ3HD5XZHmHzIrQPvo46Kc7UeXx7pFEQKcUDfg86GJm5VSnUwV4sbibtjNSFwQIGgjPO6qBVn0UtPrWpZFzZ6PkVh1P15sRcpMebjR/zwTvVGDrq5ANfGcmW8PKxhwqx7GoZB905joK5//aN2aDuuKtpiD4Xow6TsKpAwusVAUjhSijGIZhBEp/YXEZerL1GVcCrYglQK9ZWPULHpSIuBXwUpXst+VGmUFj2h8N/dAU2l9R1JxY8KUefCixGNhLWtPeVowVjNteYv0G0keRxHem6xAOt361mzl3rnDUF6jYQ0K7QpdT3uD0qYeKf76WjE7dQsS1OUmWfkmJBxnW3nfkN27U5+K/0dsrN4+2w1OiHnWzyZEJtNe3J6IaApu8HmDM59j5AmJ3eVxB3zRdL8mFxeUyxQnwIkMX2uiThXxDA2DkEiF1M5FeLl25mOWVfGwdSrkRkw1pv6TcW50nWlj1dwO1LxL2+AJhTIAGMvk4YYiq1PDl3G2QTGVeGfowqbwGplcEqiN1xfYlx1qivqKnAKoUnZd0FXL89aX+iZ6lQRSAEHZbjk4i7A5XvBi097ioNYHfXDmq/ux+9gZzTeI27yxxsBRGlGtkYMJXVRhCaCEAd9E9v4lgiHVoTUdjsE/kcj8rKWIurjxONxmCPD7zej3xY0AH/XYvyDodpx8apstKQM4x30fZsFyl1BM0kW8Xrcfxw8/Zn1O4pgGrxDthycrIjLRGu/xVecoPkoEymB5GSu6KD93yuGgUvhfAck6346n8QjQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(376002)(396003)(451199015)(38070700005)(122000001)(83380400001)(33656002)(38100700002)(86362001)(66946007)(82960400001)(8676002)(76116006)(91956017)(66556008)(37006003)(66446008)(64756008)(4326008)(71200400001)(41300700001)(6862004)(2616005)(478600001)(66476007)(54906003)(6636002)(316002)(6486002)(186003)(66574015)(6512007)(2906002)(8936002)(5660300002)(53546011)(26005)(107886003)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0wxRkQ5V1Jmd0FVNGpWMkp3YVQ3RFhJWUFyOHZ2QXR2RzdQV0RKckZUbjVn?=
 =?utf-8?B?YjA1RHQ4S0V3TXB5V3RmZmVJVXFZa25DMFgyb0VzTnZIVjEwUVJlSm4wTlUy?=
 =?utf-8?B?djIybU14Nityd05ZTFdmRVdZT2pKakZza1VwNUNFSEZCb3RwazRvbW9yYVRU?=
 =?utf-8?B?ZC9jU0tQNUlSOTB0M25NMlVuN1FFaFVRZDBnR1k3NDlXTWVoZDVkS3JsUE1T?=
 =?utf-8?B?cDZyUzAwbXlsOXJrdEpRYmsra2NTZGcrRnFyYktrVHlLSFB1UXIrcnJrSUlN?=
 =?utf-8?B?NncveEFCVTRUQjhXUnR1YWFDbk10dXFDZGN2Sk4xaFVEWDB4Q1lCeEF4dy81?=
 =?utf-8?B?M3djbE0wa1FTWXpROUpJU3BFNThvdEtDN0NPVzhkMkRvK0xUOG04aG5pbk9X?=
 =?utf-8?B?VjM2Qkp3d0tsTTRmNnZQV2I0TFZlK3hDc2cyMWxyU1ZxZFJnbXNWRDZKaS9Z?=
 =?utf-8?B?aVM4WGlUbnpVR2VBZEJhOGdweGdnekxqNWY3Qmd1S1k5ZUNqVFMyL2FiWFZF?=
 =?utf-8?B?Y0ZtSDVOL0F6OFZNckpRb0lzWXpoVDhjZ0ZiSTJUODJlZUNrMHF0R0NNOUJG?=
 =?utf-8?B?V0RnVXd1YVY1a2l2WnhiTHoydmIrR21kMTNqcEV6OWtQYUNFL0E5V2k4T3V1?=
 =?utf-8?B?RU9iUVhrTmhZeXQrbDNKNDhYYVp6azljcE1Wc0xBNnExWE9SeU9hRWlUQUcv?=
 =?utf-8?B?M1hKME93UDRJSXAxd0labHlyL1JXQks2S0wybWVtZXVvV2x4TzFHaDdQS2dR?=
 =?utf-8?B?ZllFQ2VCZHNFYUk2WHZKeWdLMW40RzN2SUJvRjEydkZVb2VKaDNPYm44L0xE?=
 =?utf-8?B?VE50SXBKOXNlMHRqcHc3SEJLRjdhQ3FUNlB5SFdDRVd2Z0ZDTVJ4V1VwbW1G?=
 =?utf-8?B?R3lBcTVOTVhMSmdMRzkxQmtQYittbWwyV2RaL0sxTlpUTmRKY09TSFUyRkQ5?=
 =?utf-8?B?enBiaGpSUExrd0NSalhyeEhNUjFURXBHTG41eDh3UVg0dHRLMHBpalpsbmc5?=
 =?utf-8?B?c20rdWdvR1U3c09BV2ExSDVUdkdMQzF6V0FWWmxOQ0FoR3J4VzhUaFhYckFi?=
 =?utf-8?B?OHh3Y3hZbXBQS3dQUzE4WlRXUU1hWllRVlFRdDFKOTdkRk9nVkdoOW00cWQ0?=
 =?utf-8?B?SVZEczM4WTd4ZlVqR3FLVmNvMUYzZkdoYUNJSlF4dEFTNEUvL2wvTHg1UEt4?=
 =?utf-8?B?ZGNkVDU2RXZxUStKeWw5eEhJNE8xVnVObXZLeDNEVlJLSmV1VUloSmlOYVY1?=
 =?utf-8?B?QnpHWUNMbFlkeEl3MHdVRDIxL0ZXREROb2VBRE4xdlRlZEV6SG9oK1FWb01r?=
 =?utf-8?B?MUc3cCtOQTBWeTg2K2ZLQ1pOMjZkTUcxeU03dFFTcUdldzJjRms1Rm5QejVm?=
 =?utf-8?B?SGF1UkxuZlJseEZRM0E4OWlnVFVwTEpWd29ZM3ovWGdzZksxbEFaYlRkTWpL?=
 =?utf-8?B?aUcrYU80S2ZocXVjQTBhakppRUtUb2JpQThpOFIvNHdhRWV6VVBoY2pTZlpy?=
 =?utf-8?B?dktvbmplMHJsMm13S2tEVTdzR0lrWHhtRUhvQTViYlN3YjI2RUtESWhjTThk?=
 =?utf-8?B?MzVrZldTcm5qbkFxd2tVLzJXSnRlQlBtcExUNitpdW9mVEx6cE5tdXNuL1Fl?=
 =?utf-8?B?ZG82YWdWYmhQd1JKSmZkRnV0aGc1aWE0alhWQ2V3eFlHK3djTDFvUDc0R0dn?=
 =?utf-8?B?K2V5NWRnTXgrbXpMeGZKN09uczNyK2ZIdWpNc0FNZDFBMmZGOTJTemk1Tk5X?=
 =?utf-8?B?L0FYYnpJWWJ6dWozcENDNkowUlJ6QTAwbGVDUW9pQ1p0ZGxkTE5Wb1o3SVN3?=
 =?utf-8?B?RHY0MTUyUlNXaGlINDdvK29DQTRoaTZxWXBXZHoyczhFdjZ2amhBQlVnZWZm?=
 =?utf-8?B?amh2T2QzT0Ryak5JZW9YNFpoNlVxOUI1alpsL3pPWnBBaU9IVFVlckR5SEJx?=
 =?utf-8?B?T1RYdXRwMHV5Tm5oZlRVcUhSeTRncWIvZmwxbmltSXUrRlVzaVY0NWVmbllj?=
 =?utf-8?B?ekovemczeTJpbHJtVGt3U1VaS2YwN0FjTURqUTVMYWtGU1B3RmV0QWpMSG9K?=
 =?utf-8?B?TGhEdFl4UWxjcmx2WEg5S0dFTWdrU0g3NHhnUE9qNlRDYnRYSmRaeFR1MmVG?=
 =?utf-8?B?aVdwUU9Cb28vRldUbFd1bWxnaWlKamdLcTFDTHRLWlljRktaQkNSVEZjSHZN?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04650B8CDCD38641B909FAC469ABF46B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8298f17-7105-4185-410e-08dabcb4faf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 09:31:11.6127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZIlphXd7uBT+YfqO2fbB/WJgTAerpeXNLQ36NezV5hV4kX9h9X8kshUfrnd3cMjnsNmZiELCywlSPmdrbq+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4972

DQoNCj4gT24gMiBOb3YgMjAyMiwgYXQgMDk6MTEsIENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlh
bi5saW5kaWdAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiAxIE5vdiAyMDIy
LCBhdCAxNzo1OSwgRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4gd3JvdGU6
DQo+PiANCj4+IA0KPj4gRWR3aW4gVMO2csO2ayAoMik6DQo+PiB4ZW5jdHJsLm1sOiBtYWtlIGRv
bWFpbl9nZXRpbmZvbGlzdCB0YWlsIHJlY3Vyc2l2ZQ0KPj4geGVuY3RybDogdXNlIGxhcmdlciBj
aHVua3NpemUgaW4gZG9tYWluX2dldGluZm9saXN0DQo+PiANCj4+IHRvb2xzL29jYW1sL2xpYnMv
eGMveGVuY3RybC5tbCB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4+IDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gQWNrZWQtYnk6
IENocmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gDQo+IA0K
Pj4gSXQgd2FzIGNhbGxpbmcgdGhlIFhlbiBkb21haW5mb2xpc3QgaHlwZXJjYWxsIE4vMiB0aW1l
cy4NCj4+IE9wdGltaXplIHRoaXMgc3VjaCB0aGF0IGl0IGlzIGNhbGxlZCBhdCBtb3N0IDIgdGlt
ZXMgZHVyaW5nIG5vcm1hbCB1c2UuDQo+PiANCj4+IEltcGxlbWVudCBhIHRhaWwgcmVjdXJzaXZl
IGByZXZfY29uY2F0YCBlcXVpdmFsZW50IHRvIGBjb25jYXQgfD4gcmV2YCwNCj4+IGFuZCB1c2Ug
aXQgaW5zdGVhZCBvZiBjYWxsaW5nIGBAYCBtdWx0aXBsZSB0aW1lcy4NCj4gDQo+IEFyZSB0aGVy
ZSBhbnkgYXNzdXJhbmNlcyBhYm91dCB0aGUgb3JkZXIgaW4gZWxlbWVudHMgcmV0dXJuZWQgYnkg
ZG9tYWluX2dldGluZm9saXN0PyBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgY2hhbmdlIG1haW50YWlu
cyB0aGUgY3VycmVudCBiZWhhdmlvdXIgYnV0IGFyZSB3ZSBldmVuIHJlcXVpcmVkIHRvIG1haW50
YWluIHRoYXQgb3JkZXI/IEJlY2F1c2Ugb3RoZXJ3aXNlIHdlIGNvdWxkIHJldHVybiB0aGUgcmV2
ZXJzZSBsaXN0IGFuZCBzYXZlIG1vcmUgd29yay4NCg0KDQpNYWludGFpbmluZyB0aGUgY3VycmVu
dCAocmV2ZXJzZWQpIG9yZGVyIGluIHRoZSBDIHN0dWJzIGlzIHVzZWZ1bCB0byBiZSBhYmxlIHRv
IGV4dHJhY3QgdGhlIGxhcmdlc3QgZG9taWQgc28gd2Uga25vdyB3aGVyZSB0byBjb250aW51ZS4N
Ckhvd2V2ZXIgd2UgZG9uJ3QgbmVjZXNzYXJpbHkgaGF2ZSB0byBtYWludGFpbiB0aGUgb3JkZXIg
b24gdGhlIGhpZ2hlciBsZXZlbCBmdW5jdGlvbiBhdmFpbGFibGUgaW4gdGhlIC5tbGksIGl0IGp1
c3QgaGFwcGVucyB0aGF0IGByZXZfY29uY2F0YCBnaXZlcyB1cyB0aGUgcmVzdWx0cyBpbiB0aGUg
b3JkZXIgdGhhdCB3ZSB3YW50Lg0KDQpBbHRob3VnaCBwZXJoYXBzIHVzaW5nIGFuIGFycmF5IHJh
dGhlciBhIGxpc3QgaGVyZSBtaWdodCBiZSBiZXR0ZXIsIGFuZCB3ZSBjb3VsZCBtb3ZlIHJlc2l6
aW5nL3JlYWxsb2NpbmcgdGhhdCBhcnJheSBpbnRvIHRoZSBDIHN0dWIsIGFuZCBoYXZlIGp1c3Qg
YSBuaWNlciAoYW5kIHBlcmhhcHMgZmFzdGVyKSBpbnRlcmZhY2UgaW4gdGhlIEMvT0NhbWwgQVBJ
LA0KYnkgcHJvZHVjaW5nIGxlc3MgZ2FyYmFnZSB0aGFuIGxpc3RzIChhIHNpbmdsZSBBcnJheS50
IGFsbG9jYXRpb24gcmF0aGVyIHRoYW4gTiBsaXN0IGVsZW1lbnRzKS4NCihBbHRob3VnaCBJIGRv
bid0IHVzdWFsbHkgbGlrZSBwdXNoaW5nIGNvbXBsZXhpdHkgbGlrZSB0aGF0IGludG8gQyBzdHVi
cywgZm9yIG5vdyBJJ20gaGFwcHkgd2l0aCB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlIGNvZGUgYXMg
aXMpLg0KDQpUaGVyZSBhcmUgbW9yZSBpc3N1ZXMgaW4gdGhlc2UgQyBzdHVicyBpbiB4ZW5jdHJs
LCBJJ2xsIGJlIHBvdXJpbmcgb3ZlciB0aGUgY29kZSBhbmQgdHJ5IHRvIHNlbmQgYSBmZXcgbW9y
ZSBwYXRjaGVzLg0KDQpCZXN0IHJlZ2FyZHMsDQotLUVkd2lu

