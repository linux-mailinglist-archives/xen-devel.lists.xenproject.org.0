Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0560E222
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430577.682424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongPv-0005N8-R0; Wed, 26 Oct 2022 13:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430577.682424; Wed, 26 Oct 2022 13:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongPv-0005K7-MY; Wed, 26 Oct 2022 13:25:59 +0000
Received: by outflank-mailman (input) for mailman id 430577;
 Wed, 26 Oct 2022 13:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ongPu-0005K1-IL
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:25:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8448d3b-5531-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:25:57 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 09:25:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5400.namprd03.prod.outlook.com (2603:10b6:5:2cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 13:25:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 13:25:46 +0000
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
X-Inumbo-ID: b8448d3b-5531-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666790756;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WdoIs1DXYrpf4zH5vaIUGbKvXgnwjwiqcS39NP5sWT8=;
  b=HjkItfbULUPlzSB+rcZeHzy1iPPd836U2aIR9a60ugx/Y4G8q0FWcOhw
   HexhmI72mwrZrsFAB+4fVXu3/7eVi4mVqqpWSDN0o1fENz02N34Z57QyU
   BzxQMH7/BNKTH+3musmi9Jcb8VzCvNmrr0sXVDXdYp59ueNANSdivGzTC
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 86073483
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:viyn66gGVOfnxoHqaeaoadyGX1613hEKZh0ujC45NGQN5FlHY01je
 htvDD+BbvqLYDOnKIoiYI+w9EgHuZPVnYAwTlFl+yE8Ensb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U4HUMja4mtC5AVmP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUJ00
 OAbFyJdVBHd3c+w3ZO7cdFh2Nt2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAurBtpNT+HorZaGhnXJmjA6T0JJDmCVhqC+o3CjBYsFF
 R09r39GQa8asRbDosPGdx+xpnKerwMfc9VVGuw+rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG+7yJtzKuKAAFIGlEYjULJSMnydT+pIA4jjrUU81uVqWyi7XdBjXY0
 z2M6i8kiN07ltUX3q+2+VTGhTOEpZXTSAMxoALNUQqN7B59ZYOjT5yl7x7c9/koBLieSl6Nr
 X0Vgf+05eoFDYyOvCGVSeBLF7asj96PPSfAm1dpE98k/i605n+4VYlK5Xd1I0IBGuYJfyX4J
 nDavwx57YVWenCtaMdKj5mZDs0rye3qE4TjX/WNN95WOMEvJEmA4T1kYlOW0yb1ik8wnKojO
 JCdN8GxEXIdDqchxz2zLwsA7YIWKukF7Tu7bfjGI96PiNJyuFb9pW85DWaz
IronPort-HdrOrdr: A9a23:tV22zam5UPpdXJ+1l7ewZhWyhk/pDfOPimdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcIi7SdK9qXO1z+8X3WGIVY3SETUOy1HYVr2KirGSjwEIeheOvNK1sJ
 0NT0EQMqyWMbEXt6fHCUyDYq4dKbq8ge+VbIXlvhFQpGhRAskOgTuRSDzra3GeLzM2Z6bRYa
 Dsgvav0ADQHEj/AP7aOlA1G8z44/HbnpPvZhALQzQ97hOVsD+u4LnmVzCFwxY3SVp0sPYf2F
 mAtza8yrSosvm9xBOZ/XTU9Y5qlNzozcYGLNCQi/ISNi7nhm+TFcRcsvy5zXMISdOUmRMXee
 r30lMd1gNImjTsl1SO0FnQMs/boXATAjHZuAalaDDY0LHErXoBerZ8bMRiA1XkAgMbza9BOO
 gg5RPni7NHSRzHhyjz/N7OSlVjkVe1u2MrlaoJg2VYSpZ2Us4ZkWUzxjIjLH47JlON1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEz82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBOB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+qKGjMiq9NVlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmccPeEQ==
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="86073483"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGmol2qhwT9DXkyOkzhMJpwjaParVRusXEaAko4TNK8Ko9uEY/mXCCeng0QYCHJtFvbsgcSumFM9N43OnLhfHMrWxa4Hf2Ivi6K2CC1gA9bTn32S7Zq82wMjMNpbbw1AnUtA70x+KYweppKG1Z1y2cAmxQiWEPBHwqO/mqMzADd0LC0mX6WpoEWlNyoebU3Mhy6Xvrk3cfpNFoPvln1vqV3rmYVABpw2hunLPZ+dBwZmXq8jlCuamUqhs//VEjAmKDN9YzgVZJfe0ixBqzdZ2+pfuBIdu8D++3Sb20pESsv9iIXBi57LO1sda2wZdFM4drTTvvSLgal7IccBdwvBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdoIs1DXYrpf4zH5vaIUGbKvXgnwjwiqcS39NP5sWT8=;
 b=JeWbgBDsQIvdi6DZvplyQGnz5NjtWLMQZZv218KDV3QOmdcidj8xByyFCNfKh+NnN17f+zUWcVCYws9G+1GyAJyAeJ4xGBdtjJAGNcTxSfsrWPOqWr9S3S4pqYuA+EFwUDF9wl7CWY2Qjp91mwp8QaZ1FUSeTj6AvYk3GkFSEI9c8m5SgEoacgueHGOiCJeJouu6Dys4hH/kOsKTEK8Jy0KCWeVhbNFC3ujcolkuru5e8k/c2uOC5U54wF7sf77QjegGCatDCUReyiQmNtWPUPghxRL2hZ7b3KnpITp+fsrPRewQXO9t4f6jvthyLHJb8Cq+DlB7K9E0LDA/SmGwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdoIs1DXYrpf4zH5vaIUGbKvXgnwjwiqcS39NP5sWT8=;
 b=CJzWzNnIdV0SWDz6gntpSSRBqFcIwtgcB9T2jJOeZbZPw5mZpP4S1A5EFFRyyWl76MsK/j46B38x0ABsDZVy17VvdDdkE6Xs05l39DktLXaSGUl0PvxZjI9HT0zgUg60fKXHVoul2Pisx/x02khAUkMMyEMoqjXnjt6Ph9WMi9I=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Topic: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
Thread-Index: AQHY6SSlXP4isouqyE+BbtcNRl5Xnq4gqaGAgAAA/YA=
Date: Wed, 26 Oct 2022 13:25:46 +0000
Message-ID: <ce5f35a9-c3d0-5c07-f8e9-d1a53eadb1bd@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
 <20221026102018.4144-4-andrew.cooper3@citrix.com>
 <CAKf6xptnDHePBLxE06bBUEkrgetg5-0X1TFFSDyJqPv4TCvA4A@mail.gmail.com>
In-Reply-To:
 <CAKf6xptnDHePBLxE06bBUEkrgetg5-0X1TFFSDyJqPv4TCvA4A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5400:EE_
x-ms-office365-filtering-correlation-id: 0a103954-37a0-4361-3287-08dab7559741
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 caGyfIXU4k2I0n+RfT+YnUb6h5RWLxcihFCFV05zH4hBzJcAU78yTIpnNja8NGVh3zoLUT/NEmWBd2Sk4y2HrgJmYERR7ifsbEPo2jVQ/9byJmgAqKfZH0mG16Bm7NhTT4+Kb0dom8uZ+5VWbvFdxj2wh74OVwwUrFQGrcBdwcxGSMvRbuGTLCwiG/7rOrTRCMZ079KkK8c+BXS/34UruaiWj+012KzsoD7x/h/6ZBqgd0xCWlamUYB6ofWVol9ylRT2YuUIVxpDojtjciToNM8De+J10yovUNONVHw4uq6Wq4Xnf+0sBuvBTO5ATkgqIPWTsAj2WTy12dCAP0hUst5SWUqVmLgowl6MdT9qjuyqqk9aRJ34fkanaKpjaawM33QR2XqpYi05HnJAY5xv1vFzNl1pv7wCujWAgLF2Bj75umk6fzuARU9q7Tu8RePy+bR0zNCV00j6AdahCQMGUl3W2CrplZiuEDeJPGkxypDRtl2LpYz47gz230rpO7laneeNmjguEkpKJ2euZGtTvUNE1EXGJHCWW5WSGV+4UblWdwgLJpI7oIJzXoGHHY5k8rV5pbcQ6R4818V1e6lRp0036TTxaEsFjhVb5YU5vz84dn2LoK9ZBhQZCMydBxKSA/xd6m6S1MjdCqGhBfL3apITUPLEZvT2T6i7C5GiXN/y6v7FTo/T92ryp61NYR64GrYCFMxrvGGxwMgeo49O4xO3EYpRWFCNgNxoBlqPOk/gbAEjp03QntziWKyJ2JDw/vRoA76j7NUCzeZn07mq1M6jW5Cof5ti35pXc7JFZveO6OA3Yxe/hCFBunEqX7ErBADZxBgGtyQqnkdidPdeIA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(31686004)(36756003)(122000001)(66476007)(76116006)(31696002)(5660300002)(66556008)(7416002)(38100700002)(38070700005)(66946007)(82960400001)(86362001)(186003)(8936002)(66446008)(110136005)(54906003)(71200400001)(26005)(107886003)(2616005)(6512007)(6486002)(478600001)(316002)(64756008)(8676002)(2906002)(41300700001)(4326008)(53546011)(6506007)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dS9oWDRiaGFXdXMxMlZ4S3o4UUk4VG5lOHZBY0IzZ3htL0RLZlEzRzRXeUND?=
 =?utf-8?B?cXdRYkdVTitjQXgyTjgyMjNCVStJZGJscDlvOFF0Qll3R3VSdHBHT2JKRHZv?=
 =?utf-8?B?UHlzcnBtVGJnWFRQZCtGVEoxZWVqaGRoem1xVGpwcTZNQUtBalBTTklNOHpR?=
 =?utf-8?B?dE5aRDFqTFl2OVlMYnBaNm1oWkZ2T3JzdG5mZVhVVkc5M1VKWEUvVVh1VXRl?=
 =?utf-8?B?TU9uUWxYdXlxcTBXUGRYZ2lPdkNjV25DTHgva3VRQVUyUTB6YVNVampjY1hS?=
 =?utf-8?B?blQ4ci9oZXBsZEN0K3lJajhvTnp2QzZjc3RHdStVbWxobTk5S2JyTUR3WHJy?=
 =?utf-8?B?dTVadFQxMEdDU1hNKzNoeis5a0tzenZMT2Q5SUo4RnNGcGN3bFY5QlFWTkNn?=
 =?utf-8?B?bHF4MlNoR2VWaitheC9XY2tJMllCcnhmZzVuSCtKTTVBcnpLUDNMdzVVT0I4?=
 =?utf-8?B?QklyZ0Fpd3ZGYnZldDZoK3RRTjEvcG1lZkZOakZ0VmQwQTdIMjgxOXFtdldL?=
 =?utf-8?B?NDBBR25GWWZWOEgrWDM3dUxuaEdKTThkZTF4MWZBTjh5dFE2Q2FYODVybHN2?=
 =?utf-8?B?TG1CT0dxN2hZcHFGWlBVdUp3eFZRN204QXcxaHFWc2w2eThLRVRLNlc4TGFV?=
 =?utf-8?B?Kyt0VFQzSWZyOGhIMy9jNnE3SXY3WmJ0dUhLUEdsVGRaZXNBNGd6c29FVlFC?=
 =?utf-8?B?SVM2MG5OMkNyRXdHUTVXd0VhSzh3S3Y4R2JNOXFmN2ZLNks1S3VialgveERS?=
 =?utf-8?B?QWFDL2pwY2RINzhtazNPRFF1UkhRTUV2OGFVM3UySWUxSzh0MkVPWTBZMVRX?=
 =?utf-8?B?c1o0OFUxSWpKZFRzeDBvRE1ZckZYWlc4cFUyb0REWWhlV0dwMi9iL1pTUWda?=
 =?utf-8?B?dk5aOTRNWXBuUFlUdmtlZTl3TG90MWRHRmY2MWZ4V0VLR3UrSFJUMk9LZVhS?=
 =?utf-8?B?RCt2ZGdCY1BUVjRxa0RDMENWUGJiUlp6elEza2x3dUFXUDJWRWlmOTZ5bHox?=
 =?utf-8?B?MGphQ1pkVGVsbElTU3N6SWVTcktzK2ZIL3UzWE82MkMxZWVHenpKTDExUTJ5?=
 =?utf-8?B?MGU4SDZuZTZScXYralovL0tEUnViN0Z1MXczYmlwNUE1QklzM3hoYktuVWNR?=
 =?utf-8?B?Yjk5cWJaSlhYM3FqY3JSenFock8xYlY3ZndMZVpNWUMwS3FQMUwwUWI0YllL?=
 =?utf-8?B?SGU3NFExa1R6dGp3L0pSYVNCZVlNYTBNNFMvd0FNVVdIMXUreGNudnlCL2x2?=
 =?utf-8?B?YTliRU5kS2ZYb1Zzei96SVErd3dqcEpZOU1hTEZHOXlMTHk2WVNJZWZhVk5o?=
 =?utf-8?B?YVYzK0JNczFpaTJBeEhxQWt3ZEdYMm9Xbm5KVUFPL281Q1NTUFRCY0hBWGVZ?=
 =?utf-8?B?K2JCTjE0V1VlUFYzS0dydU1Vb2I0b1RWR3lrNFlDNVMyREtGTHJmOG5KaEhy?=
 =?utf-8?B?c0c2VitqREMvZVgzcVd6b3FFU0xGN0dsTVdiaEpGWlVqWVd4ZGdwK202OE1y?=
 =?utf-8?B?Y1lTKzVKUlFQN0Z2eERvV3ZGZTA0SWhaV2U2OUF1NVB1eUhDcVVIV09DUnNj?=
 =?utf-8?B?TmFmZWFIckQ3cHo0emQ0MDQ3NCtKa0pHQktxbEM5ZVRZSWpJUXdURkZwbTVO?=
 =?utf-8?B?QWhjMHpGSGdIZldhUEZhamFGTkE4QnVsMXZhbGlSMWhWUDBPeG16N1RIbzBa?=
 =?utf-8?B?K25YeTlZeXVPcHQrMHB0Nko5ajlSYjVDTE9xSVlObkJVdmZFVWY0OGZSd2dZ?=
 =?utf-8?B?ZHcveGhBTjlMN1ZzeG8yYUpNdTBaY2dBUkFQakk1TFJGY0hVMUtya0xTeVZC?=
 =?utf-8?B?cUpsZzR4YXJPMzR1cU9TNzRpdmxzYmVSWXFWbXdpdHRUa3RXYi9nR1VUcHpO?=
 =?utf-8?B?SmpjT29sU2NjbnlsTVVpdVFXbGx1MFoxTERETjF6Rzd3YVFqNXhyNk9pelBL?=
 =?utf-8?B?aHh3MENOQ2xSNnNsUXdpbUVxaDJnYUxqZWZoSkhsUmJqbDB3MUxQQVpWdlM4?=
 =?utf-8?B?MHBxbEVGdVJJQUFwc2hBRjhnZlY0VCtYK3VCdDU4dm5YYXlLd3V0dXE1dC84?=
 =?utf-8?B?OGtUKzh2bTRNblpTa29ocTlwc3h4S2U5REVJTnYvRkFKTmtpeGxzWkZaWVZa?=
 =?utf-8?Q?oy6R43YZ4V0TPYC4AbAvVlTqM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CE5BFB915087E48AE49E1AB6D063E27@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a103954-37a0-4361-3287-08dab7559741
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2022 13:25:46.3769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0iuwL43tK9jtjRfESGK3MfFMuGioxh8LDjG96I0qyqmuKYMxlAwWJlPkaw3tNZLpL79gjzzdWwDbXfst3Zua7MSSq7eZyIkzZB1RoMp82o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5400

T24gMjYvMTAvMjAyMiAxNDoyMiwgSmFzb24gQW5kcnl1ayB3cm90ZToNCj4gT24gV2VkLCBPY3Qg
MjYsIDIwMjIgYXQgNjoyMSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPiB3cm90ZToNCj4+IFRoaXMgcmV2ZXJ0cyBtb3N0IG9mIGNvbW1pdCBjZjJhNjhkMmZmYmMz
Y2U5NWUwMTQ0OWQ0NjE4MGJkZGIxMGQyNGEwLCBhbmQgYml0cw0KPj4gb2YgY2JlYTVhMTE0OWNh
N2ZkNGI3Y2RiZmEzZWMyZTRmMTA5YjYwMWZmNy4NCj4+DQo+PiBGaXJzdCBvZiBhbGwsIHdpdGgg
QVJNIGJvcnJvd2luZyB4ODYncyBpbXBsZW1lbnRhdGlvbiwgdGhlIGxvZ2ljIHRvIHNldCB0aGUN
Cj4+IHBvb2wgc2l6ZSBzaG91bGQgaGF2ZSBiZWVuIGNvbW1vbiwgbm90IGR1cGxpY2F0ZWQuICBJ
bnRyb2R1Y2UNCj4+IGxpYnhsX19kb21haW5fc2V0X3AybV9wb29sX3NpemUoKSBhcyBhIHNoYXJl
ZCBpbXBsZW1lbnRhdGlvbiwgYW5kIHVzZSBpdCBmcm9tDQo+PiB0aGUgQVJNIGFuZCB4ODYgcGF0
aHMuICBJdCBpcyBsZWZ0IGFzIGFuIGV4ZXJjaXNlIHRvIHRoZSByZWFkZXIgdG8ganVkZ2UgaG93
DQo+PiBsaWJ4bC94bCBjYW4gcmVhc29uYWJseSBmdW5jdGlvbiB3aXRob3V0IHRoZSBhYmlsaXR5
IHRvIHF1ZXJ5IHRoZSBwb29sIHNpemUuLi4NCj4+DQo+PiBSZW1vdmUgQVJNJ3MgcDJtX2RvbWN0
bCgpIGluZnJhc3RydWN0dXJlIG5vdyB0aGUgZnVuY3Rpb2FubGl0eSBoYXMgYmVlbg0KPj4gcmVw
bGFjZWQgd2l0aCBhIHdvcmtpbmcgYW5kIHVuaXQgdGVzdGVkIGludGVyZmFjZS4NCj4+DQo+PiBU
aGlzIGlzIHBhcnQgb2YgWFNBLTQwOSAvIENWRS0yMDIyLTMzNzQ3Lg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0N
Cj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jIGIvdG9vbHMvbGli
cy9saWdodC9saWJ4bF9kb20uYw0KPj4gaW5kZXggMmFiYWFiNDM5YzRmLi5mOTNiMjIxZjFjMWYg
MTAwNjQ0DQo+PiAtLS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jDQo+PiArKysgYi90
b29scy9saWJzL2xpZ2h0L2xpYnhsX2RvbS5jDQo+PiBAQCAtMTQ0OCw2ICsxNDQ4LDI1IEBAIGlu
dCBsaWJ4bF91c2VyZGF0YV91bmxpbmsobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLA0K
Pj4gICAgICByZXR1cm4gcmM7DQo+PiAgfQ0KPj4NCj4+ICtpbnQgbGlieGxfX2RvbWFpbl9zZXRf
cDJtX3Bvb2xfc2l6ZSgNCj4+ICsgICAgbGlieGxfX2djICpnYywgbGlieGxfZG9tYWluX2NvbmZp
ZyAqZF9jb25maWcsIHVpbnQzMl90IGRvbWlkKQ0KPj4gK3sNCj4+ICsgICAgbGlieGxfY3R4ICpj
dHggPSBsaWJ4bF9fZ2Nfb3duZXIoZ2MpOw0KPj4gKyAgICB1aW50NjRfdCBzaGFkb3dfbWVtOw0K
Pj4gKw0KPj4gKyAgICBzaGFkb3dfbWVtID0gZF9jb25maWctPmJfaW5mby5zaGFkb3dfbWVta2I7
DQo+PiArICAgIHNoYWRvd19tZW0gPDw9IDEwOw0KPj4gKw0KPj4gKyAgICBpbnQgciA9IHhjX2dl
dF9wMm1fbWVtcG9vbF9zaXplKGN0eC0+eGNoLCBkb21pZCwgJnNoYWRvd19tZW0pOw0KPiBTaG91
bGQgdGhpcyBiZSB4Y18qc2V0Kl9wMm1fbWVtcG9vbF9zaXplPw0KDQpIbW0sIHllcyBpdCBzaG91
bGQgYmUuDQoNCkFuZCB0aGUgcmVhc29uIHRoaXMgZG9lc24ndCBicmVhayBhbnkgdGVzdHMgaXMg
YmVjYXVzZSBhbGwgZXhhbXBsZXMgaW4NCkNJIG1hdGNoIHRoZSBkZWZhdWx0IHRoYXQgWGVuIHRo
YXQgc2V0cy4NCg0KfkFuZHJldw0K

