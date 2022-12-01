Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E8763F3B7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 16:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450864.708366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lOi-0008Ty-Ju; Thu, 01 Dec 2022 15:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450864.708366; Thu, 01 Dec 2022 15:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0lOi-0008Qq-Gj; Thu, 01 Dec 2022 15:22:48 +0000
Received: by outflank-mailman (input) for mailman id 450864;
 Thu, 01 Dec 2022 15:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pMaK=37=citrix.com=prvs=3274cb7b8=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p0lOg-0008PQ-V3
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 15:22:47 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 009379cd-718c-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 16:22:45 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 10:22:36 -0500
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by SA1PR03MB6532.namprd03.prod.outlook.com (2603:10b6:806:1c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 15:22:34 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::fc0e:731b:b539:94b%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 15:22:34 +0000
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
X-Inumbo-ID: 009379cd-718c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669908165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JfzbJ2pe6k8UEDrM4FxEATsyss9SGGeoHCIRW8Ii3so=;
  b=VD500UEAVRDoQubJ3NSfq07tTK69wt+psw04pnij7SjqNdYEcJu0zJFA
   9kONGdZt7bWTBfBQ9zPlVIsPU4vow77qfAqJszAevA4nNjZQd215MzdGD
   86LKcE7k7Tu+n61wQIlpeqSyegMX9ZO9dLTO3KDRN4MlTaQ3Y7C88vBBP
   0=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 88607549
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:q/83IqMlXbMbanTvrR22lsFynXyQoLVcMsEvi/4bfWQNrUongWcHm
 zFJXm2OOq3cNGD3LY0jYNnj9hlS68fdm9RiHQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sMrWn8Ny
 tk4FAgmNAiEh72byrOwUNA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujePpOBy+OGF3N79d9CURMMTgkGCo
 WHu9GXlGBAKcteYzFJp91r81rGXwn6nCer+EpWV6OZUx1+59lYuNwI1V2GfjPCY11GXDoc3x
 0s8v3BGQbIJ3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsQjdfZfQ8ucQxRDhs0
 UWG9+4FHhRqubyRDH6YqLGdqGrrPTBPdDBeIygZUQEC/t/v5pkpiQ7CRcpiF6jzicDpHTb3w
 HaBqy1Wa6gvsPPnHp6TpTjv6w9AbLCTJuLpzm07hl6Y0z4=
IronPort-HdrOrdr: A9a23:Ih4jo6jPL1KET/qVzBYFCcjh+HBQXrkji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx9ZJhNo7q90cq7IE80i6Qb3WB5B97LYOCMggeVxe9Zg7ff/w==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="88607549"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7jxA0sxyh4moKUTCR99onNPLDKR4/IOdr4pUI6NfhII/BMhg69NIv27AAk6lb8s40nCqeAeGaX6nIEPSp0HeSYqUowym1h9l8ZdBbF0O5hBbRXsVx3bxxuiTgKbEJ4CjWtG/oNO/jApZIlW4+vj8hJ7odEEq/tgdpVdeRk6zwYD82pmtDKJDHRbHF+WZwk+imYOqKnsTEuJxnNsEkk3uYHk0sn+TiuuK6t0R/9uPoVnKu6LAXtGNEjG808xD51BBW5FDHqS6C2h7Gmx3Iu/JxWiba7qpOO3kmQCL6t6HXSg2XTaHiSjvVGEElalrXAyJ2tOdyNYJkwq0cb6cC0+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TatEI5b8263TgZ3IJUXoVjUTdmc3FB2dmBSpE34JqNU=;
 b=oReEpoXrF9NHhQD/BnsWBeLPmvBZRRG1rVjXTJVLodsk2lHQIcth+U8189EKgJNnhutZwlZg33dpHs46QaqWrxmxvHz/WW+sd6h0JFi1nE3GyWTlbBpw96gky0Zho2ur3uYlF7d3XuDzVs3+KJ0xlvW1I3jjE4H5qxp2VwzPPNK3T+rQPNwa8oe8d0tPKvX2byaoFoWPGgi1iuZuTr4jA/WSiDwLxRhwQDC6EB16yISaGvWUNbhYAjlpBn8EbEJtqTXHR7lFsbXIk/Dn2rMW4QZ895v3qraqnG8IaEz4x+I/T/HoU1EucdkYchL7uSV8J/8b8QZfUtWiGZZDuZLfxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TatEI5b8263TgZ3IJUXoVjUTdmc3FB2dmBSpE34JqNU=;
 b=iuFIACPjTYJ82J7NTHCekNUnwqUKNqWbgr4m+PX4EeTgKnShVzsJbW+KgUuO0lTIHSUeL1/L7dpozDWJXpoW3cU6wzUt00oCmE7o4jfiCaQjXP8WBWwMX8c9xuAbsRjiKKYDH/IzOZ5u8VpH/a4m7BpzCwj6FuDeDevm1YSuLP0=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Christian Lindig <christian.lindig@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling to
 use port_pair
Thread-Topic: [PATCH v2 5/6] tools/oxenstored: Rework Domain evtchn handling
 to use port_pair
Thread-Index: AQHZBNyG3A7uJdJD7k6750yETnX6R65Y7uIAgAAoLICAABCkgA==
Date: Thu, 1 Dec 2022 15:22:33 +0000
Message-ID: <0F78C27F-8DC2-409A-84B1-E795518650FF@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-6-andrew.cooper3@citrix.com>
 <B01EB9B0-2E59-460E-9F1B-04F2406C788B@citrix.com>
 <b94f7928-c420-43ec-5ed5-8de004ac8f3c@citrix.com>
In-Reply-To: <b94f7928-c420-43ec-5ed5-8de004ac8f3c@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|SA1PR03MB6532:EE_
x-ms-office365-filtering-correlation-id: 3a423166-9b57-47f0-05eb-08dad3afdefe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9bp8RDeHp5kZoxRWkacmIGpMHUONnw6lwM1DIRES01w7w3FTXCS5m2Z1snl44yrdjvW1FlXJzOIa/j3NqufnJlBsGXvH6UpNcywmiCWwLqGX72pFWtj5D8F09gYeWaTzCK8vdSF1cYjxnrNjDAY78mKl755yiqz2LZARliuQj0gOqfrLyhK/rUdf33ZlJ39KRvpqJp0zUtkTRXcg6RmVhoKKWvEHKJNjUJwv/yNWY4rBR3zmVsi5weLLS3IjG+e/uRFMOG6xNTLEFbByqrHSxIzBVBDih2LvH/zs5ebMz9bbrdlk1X8mtscorBDSOiLCbi5rLAlOGMokj8xk7KuckRDehXkGZEymtCqb4rwgHPYv9I05xxASbR09fjYzQj01QdcTTIaWcIyQzZ9/lFW5tu32o5xL7ZwwTkkDiwQHyMh6M0hDpO8IpnL+0IIJPVHt9vnd6w3sZyjISUeifscd/NGgDLmFuu5Hc33UhysoAwCMLIDAYGhL7CU9DQw3Pmwqe+ZPP7J5NQ4QSRGkgjJzBaGwOHDIFdNtn47nHqtppMG5iPd+P2onqDwtj0pdhevUDsHxFcByWZWqGxX+JEwzts94YRvkyQUBA186qUMukduh4t88QfqTUBVmb05pJRhrEn+Me0kRjreCdgk5WIgV25QFaqapU2U948TA8kMz0UGk9rNtRwgxCRoB8IPKPQfVHG94twDr2KqjPAX22KsQ3Cwp66dN241ucnkU+xhQ5HU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(86362001)(107886003)(478600001)(6486002)(71200400001)(38070700005)(2616005)(36756003)(2906002)(186003)(122000001)(38100700002)(6512007)(82960400001)(33656002)(53546011)(83380400001)(91956017)(6636002)(5660300002)(6862004)(76116006)(26005)(316002)(6506007)(66556008)(8676002)(66446008)(64756008)(37006003)(66946007)(66476007)(8936002)(54906003)(4326008)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oihrI8pn+XGeW0zvbHDEVWubBOTBb3E0QGOP/RFEpk/HT0QnfgGFaJd72ohZ?=
 =?us-ascii?Q?iBY161SlERJ81oCo+rCqOOeKJAqIyJNsf8MYbqZUd0Kjp/52k1qSIPlsqFwM?=
 =?us-ascii?Q?VaSAH+a1HRg7ARyGMAGcYSjXVYBiwlmF2wrUcJkgNzeDdkBz5P5koNcMN+EJ?=
 =?us-ascii?Q?Pq02S7OrTYap4mwHxj0InhxZNcpex4azYLdHn1tyVmQZ2CD+QOTaumMpP5Nf?=
 =?us-ascii?Q?GsGy7lw+fYwSa/LlzoxsPrrYJUPJw/fOkDmt+JEBkKYWiuE/qBVKIYJc5JOC?=
 =?us-ascii?Q?Sg27CFpIsnqVtkOrWN9hYrjQjvcXoXcnGxQmv5P74I53BH5Puv7YmNKcow2T?=
 =?us-ascii?Q?awMXGXRAkfW63fYN0W/buKHE+97siGTUvN4TafsmPqKdCT+6KGEST/YThG2O?=
 =?us-ascii?Q?owfPY/h28fZVRBgUNAntUOpF5EzS2/nufMDR9T92FkoXvyR6AZzBreK6IFl1?=
 =?us-ascii?Q?C08aT97/c5TRNLUTaVxE+55opg5W2WV/obUlf5MmDdWR4BBUvNP4u7MaOVdt?=
 =?us-ascii?Q?YWt2tA1OFxwWa+RV6yz7HV2iCpKVL/FwXL9WJ6JK5NRxQ/IUUwWW2UMMTM3r?=
 =?us-ascii?Q?7IZwXm0wvEX+AfpQWhyzVuzdteW0ZUHZm6xtcTFc9fMPQc6COOE4eF8EWJcZ?=
 =?us-ascii?Q?QqxEkBZPLo73SGuY1TiDZL0+UtfsAbhLJ5AFpBbm7AEs6Fu39krQvO6vxUDk?=
 =?us-ascii?Q?+ZfwMrSBloSNVttIxqJEeh2Kadf7KCtDo7wxxO0fq0f6jx17YRtenKTnRKCx?=
 =?us-ascii?Q?5E7pq6APyl46gG41WpROcu93todigr592wLP+GSwtySD57+JHjb8Djqt4bi+?=
 =?us-ascii?Q?806SJHU1q8i0G7ucGXkl6QnOZwYEYHbrfzSSwtwAA++G0ryCGfOc4ZPAQxMU?=
 =?us-ascii?Q?Z8bQKbjcR8dldAVGd6PBhTc1c4cJkf9qMCnw7xMrJW5zcjxiUh53TvQQ12T0?=
 =?us-ascii?Q?zY0E2Di4LPvMVCJ+U0rlUoL7GQ81/Co9tVaklVpeTTW2vafAUx2/pkzeLQv5?=
 =?us-ascii?Q?XuKknaCvrI/AYPhsDqojX4+VLCrV4yyIQn7v1Gzsrvq1IVBx9C3Pw/Zzgfjl?=
 =?us-ascii?Q?bG/aCA4zTyfJhQBeqOYhXWv2vRKPWMLzI34/PHxwC4vszdPeFV2o0ZukOhCL?=
 =?us-ascii?Q?I4ChQfSoLz13uiOKfNBg9nBsPA+k4an8Kvirddrgl3u9/bYQJFg4McRoRYhV?=
 =?us-ascii?Q?mI0K+kdkPtep5L41M3kie36pC2ufgaVGyfyk1hFnt0oWYRFGsksy1bPbjq/v?=
 =?us-ascii?Q?F6lI+qmUw7btQDFXo5sEF4zXbhYE6c3zbNm8j6f/53sSGlOU3o+bqJMpcAod?=
 =?us-ascii?Q?mRFq4fTmx54DXM62QYfPMrZzvlH4j82NDWo/0o0LorDkYNKx0BeqYDeO31w8?=
 =?us-ascii?Q?xenZhww7B2mGfi7MCPnmn5euMRDE3q7KIVtVVQyU+ekeFxIZ0T9dSQrCm6FP?=
 =?us-ascii?Q?puZC0PmB9XycuisCfqog3LzhDWGw0LoZwTL3d1jmHjhTIu9/6IcXYm9SZnYW?=
 =?us-ascii?Q?ubRoUmXYO/2XRzhI1NMoxVrGB3BZY3aO1tp3YLiuvi1QGwaGIyWCpZz2tDvD?=
 =?us-ascii?Q?ZZ3HUzsOK+TC2czonsLLy2igAaHUD+3dGfNitbzwgZgKf2o+jDG/tPR3HJ/6?=
 =?us-ascii?Q?gQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <641160ADD0FB224FB68C7BD1738CD077@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FaK5MnnWpFun795PWrN6k0b32orGjAVIUOYel5GCMv85H3C1e+oYsbU7eKc3bWk9i/ud9tqgW4doHbo34My+XT/EOKIKpeADWUp89u7F5YzLxOugMQb1SlaPjwSjeQt1ExD9OlbdF0DYBkcBuXTcAxpS+rR6QIig2NJIQHZnKup6IgackZ5hcnPKCAJTzJ+VTWxRhBCc2SF/i3XgoTHX8BCtwVfDuaMIDx6RfB2KZBvkQdT1gHN+ahd/Hzl1B/gmbo8IMtNXox2i7fNA+LKADaj+aI6e2qYI8b+UMsJyMCd7+iygDDm0RCeFVrkGifdPuTuC2LPSglRLpkF/GhNL7deYb7huh+AScxi1mHN1ZOb4bi4bjz82rHkTLnDG97CP6R8GrmHjXb6uQSD0LEUyxkQptclU4vR3SB+nIWcuWNBjZvhotOCmrAcexzCpqqw3l1V5l9eIUH4txL0zjbZbAan7+U0F8rrTOb/XbtE1X6ThkXgtH3KhyxhGxh4J7N007qXc3YucPJdYw4ajlRFtEUPFpJj2KVv1Hx/3KMi4b1/9TvawdyYXoNy3LgDlyyWEH74XRI0eAPEhkBG/VEopt34g2BJK8beK81aMlcNYrHyZdgJ8Xqwrb/XdSywSzaH8OrpuxNcxWR/+YLUjY7uhNzn5eLpmNAE3I9fRc6YjHGVBjHgJ7qvBnhFqBb1xiFUF/+XATMs4QKvczw+QMvruqCZ3acFmPcPzaVmbnIuZvgyVJcEScr78l1o/BZqA+/EDlQt1HG7e1EkImO+TeJjr/Xc8GYyruXDN1jXUb4UvtjMaw/YHXyJ15aGBMYpqu4P9
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a423166-9b57-47f0-05eb-08dad3afdefe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 15:22:33.9804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPZvaZtD+w7W0lrg7BPqU38Qx4Qg+Pv2IubywHEkI+GOchoHKqP/EGOlrZ6FGGyBjfyVYLyU7ai1QOCkR7BIqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6532



> On 1 Dec 2022, at 14:22, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>=20
> On 01/12/2022 11:59, Christian Lindig wrote:
>>> On 30 Nov 2022, at 16:54, Andrew Cooper <Andrew.Cooper3@citrix.com> wro=
te:
>>>=20
>>> Inter-domain event channels are always a pair of local and remote ports=
.
>>> Right now the handling is asymmetric, caused by the fact that the evtch=
n is
>>> bound after the associated Domain object is constructed.
>>>=20
>>> First, move binding of the event channel into the Domain.make() constru=
ctor.
>>> This means the local port no longer needs to be an option.  It also rem=
oves
>>> the final callers of Domain.bind_interdomain.
>>>=20
>>> Next, introduce a new port_pair type to encapsulate the fact that these=
 two
>>> should be updated together, and replace the previous port and remote_po=
rt
>>> fields.  This refactoring also changes the Domain.get_port interface (r=
emoving
>>> an option) so take the opportunity to name it get_local_port instead.
>>>=20
>>> Also, this fixes a use-after-free risk with Domain.close.  Once the evt=
chn has
>>> been unbound, the same local port number can be reused for a different
>>> purpose, so explicitly invalidate the ports to prevent their accidental=
 misuse
>>> in the future.
>>>=20
>>> This also cleans up some of the debugging, to always print a port pair.
>>>=20
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Christian Lindig <christian.lindig@citrix.com>
>>> CC: David Scott <dave@recoil.org>
>>> CC: Edwin Torok <edvin.torok@citrix.com>
>>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> Acked-by: Christian Lindig <christian.lindig@citrix.com>
>=20
> Thanks.
>=20
>>=20
>>> v2:
>>> * New
>>> ---
>>> tools/ocaml/xenstored/connections.ml |  9 +----
>>> tools/ocaml/xenstored/domain.ml      | 75 ++++++++++++++++++-----------=
-------
>>> tools/ocaml/xenstored/domains.ml     |  2 -
>>> 3 files changed, 39 insertions(+), 47 deletions(-)
>>>=20
>>> diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstor=
ed/connections.ml
>>> index 7d68c583b43a..a80ae0bed2ce 100644
>>> --- a/tools/ocaml/xenstored/connections.ml
>>> +++ b/tools/ocaml/xenstored/connections.ml
>>> @@ -48,9 +48,7 @@ let add_domain cons dom =3D
>>> let xbcon =3D Xenbus.Xb.open_mmap ~capacity (Domain.get_interface dom) =
(fun () -> Domain.notify dom) in
>>> let con =3D Connection.create xbcon (Some dom) in
>>> Hashtbl.add cons.domains (Domain.get_id dom) con;
>>> - match Domain.get_port dom with
>>> - | Some p -> Hashtbl.add cons.ports p con;
>>> - | None -> ()
>>> + Hashtbl.add cons.ports (Domain.get_local_port dom) con
>> I would prefer Hashtbl.replace. Hashtbl.add shadows an existing binding =
which becomes visible again after Hashtabl.remove. When we are sure that we=
 only have one binding per key, we should use replace instead of add.
>=20
> That's surprising behaviour.  Presumably the add->replace suggestion
> applies the other hashtable here (cons.domains)?  And possibly elsewhere
> too.


Yes:
* Hashtbl.add -> Hashtbl.replace
* Hashtbl.clear -> Hashtbl.reset

Using anything on the left is almost always an indication of a subtle bug (=
e.g. Hashtbl.clear won't release the memory used by the buckets, and the on=
ly time that is useful is if you'd immediately fill the hashtable with lots=
 of elements again, really code should always use Hashtbl.reset but that on=
ly got introduced in OCaml 4.0.0, so older code won't have it).

And the use of Hashtbl.add can lead to "space leaks" (eventually OOM) unles=
s one really knows what they are doing (i.e. there are only a finite number=
 of add calls ever).

In XAPI we have a "quality gate" that counts the number of problematic func=
tions/etc, and makes it a hard build time failure if any new usages are int=
roduced (and we strive to reduce that to 0).
I don't think these 2 Hashtbl calls are there yet, but they probably should=
 be.

Best regards,
--Edwin


