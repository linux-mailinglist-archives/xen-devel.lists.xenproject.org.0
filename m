Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109145F0EB2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 17:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414287.658483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeHo6-0000Uq-Cd; Fri, 30 Sep 2022 15:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414287.658483; Fri, 30 Sep 2022 15:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeHo6-0000Sr-9Q; Fri, 30 Sep 2022 15:20:06 +0000
Received: by outflank-mailman (input) for mailman id 414287;
 Fri, 30 Sep 2022 15:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ypri=2B=citrix.com=prvs=26571fa51=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1oeHo4-0008Sd-Ie
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 15:20:04 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59e00149-40d3-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 17:20:02 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Sep 2022 11:19:59 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by MN2PR03MB5102.namprd03.prod.outlook.com (2603:10b6:208:1ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:19:57 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::4dc1:6b11:9f99:1eec%7]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 15:19:57 +0000
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
X-Inumbo-ID: 59e00149-40d3-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664551202;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V+BixSDR6+CZUGjA2DhpsAiniclHuPYa3vaa9LickZw=;
  b=QB8a2CZNYytFU0KkmSMLJquAkLt3ciRBDmWrtn0Ftdzp9qTYiQAdPe3p
   ElEgtKoRf3mqA/qCRu0MMfhgTKk2DCFPJ1ZbfgN5YjvuHSzjazm80XZ/S
   MRtH0wHtmGRB+ycJeoLYQdxOVaIC0ZnYz2bslHUk+JBI6WY7855pMBEa3
   E=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 81709137
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cwW69a2ddBVrcW54mPbD5chwkn2cJEfYwER7XKvMYLTBsI5bp2YHz
 WMZCjrSOKmLMDDweN52bdm/8x8OsZHXzYNgSAY+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WhA5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqU+9/hJEz9x/
 sY+ISIWNB6Bod2/4u+SH7wEasQLdKEHPas5k1Q5lHTyKq9jRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/L4/NouQA/zyQouFTpGNfZZN2MA9lShEGbj
 mnH4374ElcRM9n3JT+toivz3r6WxnyTtIQ6Ma+0yvFhugGqxEswWQZLXHmwo92blRvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmQNUDNpctEts84yAzsw2
 TehgNfBFTFp9rqPRhqgGqy8qDqzPW0eKjYEbCpdFA8duYC8+sc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:CNQhE6uIHmrdnONq9OhRnRrz7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.93,358,1654574400"; 
   d="scan'208";a="81709137"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYTFrp4bR1q6M1q2CWU5cm2vGfW7ZR+Uvg1NxEcW2veKbwz7QL03E0ZYo+pUOelzS5Nwv+fWUmYpg1NC5RLA98M6mkFRR4uaYYY3gv6iMBpJs3JAcqlTIt6icpQu3f93dmpi4ggIRxQ20N3GZrom4vP2vbeSjkMVmb9+rf9+dsnoV6b4WWEhMBg2YFts9JW0QVM2ELR3Oq835QPWmQ+LJInVNjOwMMnqlZIfUIMMcUmlKoLkSM+J5FVGJa0kJn3245l9HcUt8fX5wlzw8Pwbh0mhnY2aDhdHFVK3jw/5REaJKHhUw7LjUfkP1As7IOn5yiMJKVxy6fvG6WO46D6YyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+BixSDR6+CZUGjA2DhpsAiniclHuPYa3vaa9LickZw=;
 b=YhQRczJg9DpCCRim52YepDdm4b9Pve4jPnccOFLk36lfF1KuK92NnuoOsQ2rtO96m+T1gcU9Fm1KT2ATAUcEGmrD/bgvp4cLNdyoeHjP/f2LvUSP9e0ywcUN3CrWqxqqH6Kf4sZecgSwmtdMEtjrndBBdtZ8wW3+pWSiChdZIPVJoczkh2klfOoSPKYhA9zckWTYyUl0HFmK7e6eq4tOyMUKcNhwZ42lbVnE1tc5TIZG61/s3mGPJfSQJ4JaqiwJ0+OkMwAeNIj3j60nCQIblLwbJCORwN8zte9RdsM+0n507KNx4XhlWcKId1W4srom0xbajtaDsT3H+5NfhMIEng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+BixSDR6+CZUGjA2DhpsAiniclHuPYa3vaa9LickZw=;
 b=Kpir8Aynzvr/6tmJT0+MqHmj3wSTqzfBgbylVd2+kmweLFUFVQuwrwCobU5zPs9uVKiBF4JMyvQ4miY7DJidmWt7yLNEbUMEvaPqazC/vmCZ286ViPZZQ59iKTw9aWbiaRpHkvHtJLapY7Y9d90/soW2WkcOV/5qwkFX09gJeOY=
From: Edwin Torok <edvin.torok@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, David
 Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Topic: [PATCH v2 4/5] tools/ocaml/libs/xc: OCaml 5.0 compatibility
Thread-Index: AQHY0mKHWIzo/zbfF0KNs+muY99n/a3zc0gAgASifICAAAWpgA==
Date: Fri, 30 Sep 2022 15:19:57 +0000
Message-ID: <6D0F2229-345A-448E-88AC-7B598C534F49@citrix.com>
References: <cover.1664276827.git.edvin.torok@citrix.com>
 <7b88cbda20e068bbce1c5dfb0a18af3f4e4b6865.1664276827.git.edvin.torok@citrix.com>
 <D5BC6A1E-05C8-4044-ADA6-EFA8944CAAD4@citrix.com>
 <18C55ABC-CE37-4740-A516-86D4FCE83EC6@citrix.com>
In-Reply-To: <18C55ABC-CE37-4740-A516-86D4FCE83EC6@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|MN2PR03MB5102:EE_
x-ms-office365-filtering-correlation-id: cc9595a8-468b-467b-4071-08daa2f73c16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gOvJ6QVIWiB9BC8jY2mES6sC8jwxXjTfXfILT5GMy8jNCNadA9vtTliKaHcLuyF0ZFj7WuJZh/4to+ESK1tr9uCpP0va8uopHhaupG4IQx2g36L7pIkPppgNFS5fR+Mkzf+5al5Uw5Qe4Ewmq8MlNTCoEdAePeJEdzlVA8B8RrWPBxUHab6oZnvwExp9qpqoH4V8wyEvjkhOg4RBrq9ub1FRUBx8ZX5lauO1jMVF2Nyd1GbAIJBnywnUq0nF2+ZhBP7BJf82ufU/WTA0V07sdFUC3uyZIQXP6UMlainx+4hO2ja3OBB4iFGcuQDRO4lswFhfRKzJkKbeRiBnDFDGYON17DldjfZ+6PHkCF4+B1a3CdteKMH6/y4CdgwNhEOzRnnpvLCHF2D2XpzlHbA4IlOs7efzuMey10plFyl2QeW+e4FlBuHYyqNOQrYMLAiM3oJoYIPOVm4r1G2cQFkiYNSAHfGxBVpT/KiMT1tWWZwJXmXW/rsP518zQL/0QKND6r1nGlg5xJDR1QNnzABHA1erkuTkgVTCwxshspicLosQD4K9OkrynYHybcmmHgmqqXvzFyqME6ainvO9bnPDyPVb++iehCvwEt3GihOvnPD3aKszkSnlavsxR1+uhF0q8DwfRcKAAeE0KFm3hTQt0/Vp8W1Y/bFtyu4SAPfEoXrvd4UcrdLCuqvotPC6yDNtAINbsLd9n7CxDr7U6gdNgU8x/KvgybqOUyf+F7AYOpILfCphEMae3NhQf2XX3Y+0sQ0kadwgbMZVhmHY6FU3rTkG7pftNZ4fv/l1/b52CEuSGLoDi4PBRRw+a8w6orLrK61a3CM0q9eCgk35s/UQDQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199015)(82960400001)(6636002)(122000001)(91956017)(6486002)(478600001)(66946007)(76116006)(2906002)(66476007)(4326008)(64756008)(66446008)(66556008)(8936002)(6862004)(33656002)(6506007)(107886003)(41300700001)(53546011)(316002)(37006003)(8676002)(36756003)(54906003)(26005)(6512007)(966005)(86362001)(5660300002)(186003)(71200400001)(38100700002)(38070700005)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1kzaFVHemxDSStwTnVndFBYU0phN0VLUk4zNVJ2S2NjT2krU1VWV1hMNVdj?=
 =?utf-8?B?d2ovZ1FKSCt0R0xIZzRFc2NUQ3hTaUxPSXRldlloTVM0TE1SVTJVYTBNN1E1?=
 =?utf-8?B?WnlXYzA4UXVQYndTNFY1MEFONUcxODJSYnhwQjNSV0FUSCtsdHB1cmIwV3hN?=
 =?utf-8?B?TS93S0tPYi8xNzBFODFRYURsOUZKZGFIMnJZQlV6MzZGVHdTaVlIYnBPUlhF?=
 =?utf-8?B?OGwyUDZzeDkzK042N3dlYnZuWThrUWl5K0xpWEYyNEVSa04wUnMzQ3B2ZEQz?=
 =?utf-8?B?YVRKazB4Y0xhamZXeHNkbUtlSnVQWVUxdVZVaFd0RStXejQzOFFrUzdIbXM5?=
 =?utf-8?B?dGpUVTIzcWMwS3VRQzE2RDJOMVRReW56V0ZVYUlnS0pIREtoTU1xSENvT3Iv?=
 =?utf-8?B?YW5VRXFnWCtHbmZJTTNkUWVucXQzdDhUR2dQa2ZXaWlGWmh6SDhOSFFETFJG?=
 =?utf-8?B?YTNRQnM0b3dMY3hXU0hNa1FyUkt2dzhIbTd1elhJSWk3ZFkzcjlLQVkwNGgy?=
 =?utf-8?B?d3F2bytVSzlqUXRPaFl3Nmh4citDcUp1blFqVXZCYXd5MGpHZlJYU3p0VUYr?=
 =?utf-8?B?dkFNLy9WMmVna3BSOHJqYlIzdnNKSUJzU2VrQmMyNUI4c3VYQWR4WURyQVJw?=
 =?utf-8?B?NmxZdUVvQ0lWQTZFS0g1cEpLS0lQMVh1Q2RjZW1FRVN0QjQrdE4vQVhTWDdp?=
 =?utf-8?B?ckx6ZHVIUkxTWGllY29BOUxZN3oydXhPS1FNTHp6T0dycW1tNG9ZdTVuYVNw?=
 =?utf-8?B?MzdWSytndUZpb2hFUStkdjI2WTQ3S0laOHBlRGlUNDQzOGEvRCs4YVQvcUxL?=
 =?utf-8?B?aitONXoxa05pS1V6NXVlV2E0M1ROd2tGMU5Od3JvcU5pZHVjbjJxRWxaK0VI?=
 =?utf-8?B?T0t3bkgyZlFYTWJSSXJUWnJNZ2F2a0NDSm41dFNtQXBmK1BXbUNFR1k5TW1v?=
 =?utf-8?B?T3JKMnJkUldaeDdZbjhveEkwZ0loTHVXTFZTNEJjSGQvdHRvYnRDMXZwSnNG?=
 =?utf-8?B?YTJ0MWlxa2FvOUxMSEtwRHp0cWpBbXBOUzdodmlRaTNoYUdlZEFybmhnR0la?=
 =?utf-8?B?MEpURjMvT1c2V05EaFNSUzl1OTdGOG5mcmNQdEFhNk9DTjFvYkVVTG95MWJh?=
 =?utf-8?B?T1ZCeUxtcHBqWS83ZWdlbFVjLzdKWGd6V2c1M3JTZVZmUUl1U3BJcHA1WTcy?=
 =?utf-8?B?WG9UZnM3WlB5dUd1Qml0TENSV0gza1E3UWlQLzVVRkd1NXF2RDBlN25XZXFS?=
 =?utf-8?B?S0U0aS9xTWtqemI0Y0RWMUlHTisxNkN1ckdyYjlidUg5RHNDQ0hvRk1JOG1S?=
 =?utf-8?B?eXp3anBEa2hnTUZHK1NEcnkxM3VRMU4zaitpWjBmNzdpN0RhT1hwVDV3NEN3?=
 =?utf-8?B?aFp5RGVydy9oTDF6OHArd0lydTJwVEljOHNjZXhUZm1CVkhrQmxBelluZjht?=
 =?utf-8?B?eDdGVGlnU0xtYk82cE9lUUNrQkZwZFJta3FNS1BMZXJsRjNNUFFTYlY0MCtn?=
 =?utf-8?B?Rm4ydFMvRDF5VlVya2hUMnk0WWlkU0t4QXdnNWptMjMwOVRxR1pYNWJvQmJL?=
 =?utf-8?B?b0kvVENXaFhSSW8yZjh1bXpJQ3BwOWhsZjNTeHF3emV0UHI2NXpLS0F4YmdY?=
 =?utf-8?B?dXhvbWRvUUx0a2xuM2ExVGh0YUFBUFkyL2YvR3MzNVYvc2RrYU1vUW1hVFVS?=
 =?utf-8?B?b2pudDZZWmU3bVhPT3o3ZitBM1V1azhqR3hTZ1F2Zzlhb3ovcEpFcnNvVVQx?=
 =?utf-8?B?Tk5tblZGYU0rMFo3SFl0OTRQdnZkT0FVUURnUzdGSFhnRUVGdE1BYk0vcEI4?=
 =?utf-8?B?a2w5Q3FxcTA1T241cC9iMndqOVpCM2lSUWpOcUVDbXQ2NHpZZWJESGFhU3Zz?=
 =?utf-8?B?VDdSV2N6R1VYZEVVMWV1bkxlajhQZnJ4WHE0STV1YUNsS0FxU09YNElOLy9D?=
 =?utf-8?B?aDFPUmlLZ0dVT01sbExGUkhmMEV0dEZhdnhtRVhVOHVkMWk0VzJ2M1hiOW9J?=
 =?utf-8?B?UkRza2JOaE01OE9SemJwZFJlWi81S0JwM3Q3Um9GSXFTalJ4ODBsTjNIR1Ra?=
 =?utf-8?B?d1JWc2lKVGdIMkVNcU5Rd1Y2Y295T2ZFdWZJTG0rcDY0cEZnNWc4T3NsdjAw?=
 =?utf-8?B?UzNXWkpkRm1rWVNqMTBOMnVXUXdXT2tZV1JSVllKaGkrMmVxR20zK1RpZ011?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C6CA076E21DC743922B20CEE084FF8F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9595a8-468b-467b-4071-08daa2f73c16
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 15:19:57.4590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gy8bgY2BktVbmXszyTm7PzPliH1A0cyH7FF/YQEYcBOXgPzTD49fq4PL1Rw38EdYC64Xe3S2IT+HFIJtbq8ruA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5102

DQoNCj4gT24gMzAgU2VwIDIwMjIsIGF0IDE1OjU5LCBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gMjcgU2VwIDIw
MjIsIGF0IDE3OjEzLCBFZHdpbiBUb3JvayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4gd3JvdGU6
DQo+PiANCj4+IA0KPj4gU2VlIGJlbG93IGZvciBhIHBhdGNoIGZvciB0aGF0LiBJJ3ZlIGluY2x1
ZGVkIHRoaXMgcGF0Y2ggaW4gdGhlIGNvcnJlY3QgcGxhY2UgKGJlZm9yZSB0aGUgcGF0Y2ggdGhh
dCBicmVha3MgaXQpIGluIHRoZSBnaXQgcmVwb3NpdG9yeSBhdDogDQo+PiBodHRwczovL2dpdGh1
Yi5jb20vZWR3aW50b3Jvay94ZW4vY29tcGFyZS9wcml2YXRlL2VkdmludC9wdWJsaWMwDQo+PiAN
Cj4gDQo+IA0KPiBBY2tlZC1ieTogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0Bj
aXRyaXguY29tPg0KPiANCj4gSSBiZWxpZXZlIHRoZXNlIGNoYW5nZXMgYXJlIGZpbmUuIFdlIGFy
ZSBub3cgYWxsb2NhdGluZyB0aGUgZXZlbnQgY2hhbm5lbCBkeW5hbWljYWxseSBhbmQgdGhpcyBy
ZXF1aXJlcyB1c2luZyBhIGZpbmFsaXNlciB0byBmcmVlIHRoYXQgbWVtb3J5LiANCg0KVGhhbmtz
LA0KDQo+IA0KPiANCj4+IC1pZm5lcSAoJChNQUtFQ01ER09BTFMpLGNsZWFuKQ0KPj4gK2lmZXEg
KCwkKGZpbmRzdHJpbmcgY2xlYW4sJChNQUtFQ01ER09BTFMpKSkNCj4+IC5vY2FtbGRlcC5tYWtl
OiAkKEFMTF9PQ0FNTF9PQkpfU09VUkNFUykgTWFrZWZpbGUgJChPQ0FNTF9UT1BMRVZFTCkvTWFr
ZWZpbGUucnVsZXMNCj4+IAkkKGNhbGwgcXVpZXQtY29tbWFuZCwgJChPQ0FNTERFUCkgJChBTExf
T0NBTUxfT0JKX1NPVVJDRVMpICoubWxpICRvLE1MREVQLCkNCj4+IGVuZGlmDQo+IA0KPiBJcyB0
aGlzIHRoZSByaWdodCBsb2dpYz8gTW92aW5nIGZyb20gaWZuZXEgdG8gaWZlcSBoZXJlLg0KPiAN
Cj4gSSBhbSBub3Qgc28gZmFtaWxpYXIgd2l0aCB0aGUgTWFrZmlsZSBydWxlcy4gVGhlIGdpc3Qg
c2VlbXMgdG8gYmU6IHdlIGRlcGVuZCBvbiBhdXRvLWdlbmVyYXRlZCBNYWtlIGRlcGVuZGVuY2ll
cyB0aGF0IHRoZSBNYWtlZmlsZSBpbiBnZW5lcmFsIGRlcGVuZHMgb24uIEJ1dCBpbiBhIOKAnG1h
a2UgY2xlYW7igJ0gKG9yIG90aGVyIOKAnCpjbGVhbuKAnSBpdCBpcyB3YXN0ZWZ1bCB0byBnZW5l
cmF0ZSB0aGVzZSBvbmx5IHRvIGxhdGVyIHJlbW92ZSB0aGVtLiBIb3dldmVyLCB0aGVzZSBraW5k
IG9mIHN1YnRsZXRpZXMgYXJlIG9idmlvdXMgZW5vdWdoIHdoaWxlIHdlIGFyZSB3b3JraW5nIG9u
IHRoaXMgYnV0IG92ZXIgdGltZSBhY2N1bXVsYXRlIHRvIE1ha2VmaWxlcyB0aGF0IGFyZSBoYXJk
IHRvIGNoYW5nZS4gU28gSSB3b25kZXIgaWYgdGhpcyBraW5kIG9mIG9wdGltaXNhdGlvbiwgd2hp
bGUgY29ycmVjdCwgaXMgd29ydGggaXQsIGJ1dCBmaW5lIGdvaW5nIGFsb25nIHdpdGggaXQuDQo+
IA0KDQpNYWtlZmlsZSBmdW5jdGlvbnMgY2FuIGJlIGEgYml0IGNvbmZ1c2luZyB0byByZWFkLg0K
DQoiaWZuZXEgKCQoTUFLRUNNREdPQUxTKSwgY2xlYW4pIiBtZWFucyAkKE1BS0VDTURHT0FMUykg
IT0gImNsZWFuIg0KImlmZXEgKCwkKGZpbmRzdHJpbmcgY2xlYW4sJChNQUtFQ01ER09BTFMpKSki
IG1lYW5zIHRoYXQgImNsZWFuIiBpbiAkKE1BS0VDTURHT0FMUykgPT0gIiIgKHRoZSBlbXB0eSBz
dHJpbmcpLCBvciBpLm8udy4gImNsZWFuIiBub3QgaW4gJChNQUtFQ01ER09BTFMpLCB3aGljaCBp
cyBhIGJpdCBtb3JlIGdlbmVyaWMgdGhhbiB0aGUgcHJldmlvdXMgb25lLA0Kc2luY2Ugd2UgaGF2
ZSBhbGwgc29ydHMgb2YgcnVsZXMgaW4gdGhlIE1ha2VmaWxlIChlc3BlY2lhbGx5IGFyb3VuZCBz
dWJkaXJzKSB3aGVyZSAnY2xlYW4nIGlzIGEgc3Vic3RyaW5nLg0KVGhpcyBpcyBxdWl0ZSBzdWJ0
bGUgYW5kIEkgaGFkIHRvIHJlcmVhZCB0aGlzIGxpbmUgbWFueSB0aW1lcyB0b28gdG8gY2hlY2sg
aXQgaXMgY29ycmVjdC4NCg0KVGhlIHJlYWwgc29sdXRpb24gaGVyZSB3b3VsZCBiZSB0byBoYXZl
IGEgc2luZ2xlIG5vbi1yZWN1cnNpdmUgTWFrZWZpbGUgKGFuZCB0aGVyZSBpcyBzb21lIGRpc2N1
c3Npb24vcGF0Y2hlcyBoZWFkaW5nIGluIHRoYXQgZGlyZWN0aW9uIGluIHhlbi1kZXZlbCBwYXJ0
aWN1bGFybHkgZnJvbSBBbnRob255KSwgYW5kIHRoZW4gZXZhbHVhdGluZyB0aGUgImNsZWFuIiBy
dWxlcyB3b3VsZCBiZSBhIGxvdCBsZXNzIGV4cGVuc2l2ZSwgaXQnZCBvbmx5IGhhdmUgdG8gYmUg
ZG9uZSBvbmNlLiBCdXQgdGhlcmUgbWlnaHQgYmUgYSB3aGlsZSB1bnRpbCB3ZSBnZXQgdGhlcmUs
IGFuZCBtZWFud2hpbGUgdGhlc2UgY2xlYW4gcnVsZXMgc2xvdyBkb3duIHRoZSBPQ2FtbCBidWls
ZCB0b28gbXVjaCAoanVzdCBydW5uaW5nIHRoZSAiY2xlYW4iIHRha2VzIGEgbG90IGxvbmdlciB0
aGFuIGJ1aWxkaW5nIHRoZSBlbnRpcmUgT0NhbWwgbGlicmFyaWVzIGFuZCBveGVuc3RvcmVkIHNl
cXVlbnRpYWxseSkuDQoNCkFsdGhvdWdoIEkgb25seSBuZWVkIHRvIHVzZSAnY2xlYW4nIHdoZW4g
dXNpbmcgdGhlIHVwc3RyZWFtIE1ha2VmaWxlcyAod2hlcmUgYWxtb3N0IGV2ZXJ5IGluY3JlbWVu
dGFsIGNoYW5nZSByZXF1aXJlcyBhICdjbGVhbicgaW5iZXR3ZWVuIGJlY2F1c2UgdGhlIE1ha2Vm
aWxlcyBleHByZXNzIHRoZSBkZXBlbmRlbmNpZXMgaW5jb3JyZWN0bHkpLA0Kb3Igd2hlbiBzd2l0
Y2hpbmcgZnJvbSB1cHN0cmVhbSBNYWtlZmlsZSB0byAnZHVuZScgKGEgb25lLW9mZiBldmVudCB1
c3VhbGx5KS4NClNpbmNlIEkgdXNlICdEdW5lJyBmb3IgbXkgZGFpbHkgd29yayBhbnl3YXkgKGFu
ZCB0aGUgbWFrZWZpbGUgaXMgdXNlZCBpbiBvdXIgaW50ZXJuYWwgYnVpbGQgc3lzdGVtKSBwZXJo
YXBzIHRoaXMgTWFrZWZpbGUgcGF0Y2ggaXMgbm90IG5lZWRlZCBhdCBhbGwsIEkgY2FuIGNoYW5n
ZSAnTWFrZWZpbGUuZHVuZScgdG8gbm90IGNhbGwgJ21ha2UgY2xlYW4nIGF0IGFsbCwgYW5kIEkn
bGwga25vdyB0byByZW1lbWJlciB0byBydW4gaXQgaWYgdGhpbmdzIGZhaWwgYW55d2F5IChpdCds
bCBiZSBwcmV0dHkgb2J2aW91cyB3aGVuIER1bmUgc2F5cyB5b3UndmUgZ290IGEgYnVpbGQgYXJ0
aWZhY3QgaW4gdGhlIHdyb25nIHBsYWNlKS4NCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg==

