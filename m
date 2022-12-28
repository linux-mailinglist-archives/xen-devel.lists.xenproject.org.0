Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683F65861F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Dec 2022 19:57:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469546.728920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbbL-0001JW-CO; Wed, 28 Dec 2022 18:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469546.728920; Wed, 28 Dec 2022 18:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pAbbL-0001Gs-97; Wed, 28 Dec 2022 18:56:31 +0000
Received: by outflank-mailman (input) for mailman id 469546;
 Wed, 28 Dec 2022 18:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfAD=42=citrix.com=prvs=354503da8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pAbbJ-0001Gm-Nr
 for xen-devel@lists.xenproject.org; Wed, 28 Dec 2022 18:56:29 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530bd805-86e1-11ed-91b6-6bf2151ebd3b;
 Wed, 28 Dec 2022 19:56:27 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Dec 2022 13:56:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH2PR03MB5350.namprd03.prod.outlook.com (2603:10b6:610:99::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 18:56:18 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.016; Wed, 28 Dec 2022
 18:56:18 +0000
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
X-Inumbo-ID: 530bd805-86e1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672253787;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W+uRrA/iDxo85Xl86a9zay2C0pqsoRdEUq8wtq3Mzmg=;
  b=NHJ5glpFn7eed4/oz0CJvo5jnR+WQZcxeWLtUsJuzwZPl7s3s7St7mBF
   RGxnU3rYbG6HeCFTb+vZ51quXzSiC3kpYRsAdxlcT+KBt2HO3KMNO6uNC
   LQh6LP0lPRtsElY2AcYuJoojWjp9l+NsnV7/OyjmPepN0JvnEpXLXZC8K
   s=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 90788945
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FespD6D/QTILHRVW/7Hiw5YqxClBgxIJ4kV8jS/XYbTApGl032dVm
 zAZDz+Cb6uNYzb0eowkO4jk/RxT6JTVzt9lQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlC7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxrZ1H0Zc9
 OUiNxNcUzyIpduGx5SgY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6XwnOrCd5PfFG+3u5xrESYyE4/MkIPBHai8NidiVWXR/sKf
 iT4/QJr98De7neDSd3wXAa5oTiHowQbUNpTFMU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnQddqFqqohdTdAzDux
 CuLqiN4jLIW5eYB0K+x7F3cgzaho5HPZgEw7wTTGGmi62tRbYqkfJCh6EKd4+xJKo2YVXGes
 HNCkM+bhMgFCpeLky6BSfsMB5mm4v+ENHvXhlsHInU63zGk+nrmd4YA5jh7fR1tKpxdJmOvZ
 1LPswRM4pMVJGGtcaJ8f4O2DYIt0LTkEtPmEPvTa7Kif6RMSeNOxwk2DWb44ownuBFEfX0XU
 XtDTfuRMA==
IronPort-HdrOrdr: A9a23:2Qf1mqCozG86SajlHenP55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8cjzuSWftN9zYhAdcK67V5VoKEm0naKdirN8AV7NZmfbhFc=
X-IronPort-AV: E=Sophos;i="5.96,281,1665460800"; 
   d="scan'208";a="90788945"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ4s2eFthkrCd5pUqrsvvsoyCSIE34lf1h6GivDRBScKJ45fUjpVmX43APZeZDDDsOdprKuzKQ3L+UqmxmD71ycVPUEgP9v0ivCD3E9Tt36UEHHJ7RtqaxpAcN1UgWl0rMirtkoK4pAR3bpoxiKqSf74IHba01iBbvaQJi3XUshkteBAAVIyl1WQ4RCULvz7uOgAEWwwuZ5LeltwDZzwlvUWVe756n6aJXEjmw5hTRS/MWV2EnQCFJbDSM+gvNBBiTt04rqnOBE0Wg2NA66HW0LrMHX1oZOu0UteZ/mygPlHZ4KXBeI373vUZ69xw31vVww+CRS6AFY7k9tqr8Zp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+uRrA/iDxo85Xl86a9zay2C0pqsoRdEUq8wtq3Mzmg=;
 b=IxbRG3i//01tMyX2VNMp0NLGE7RedYTM1hoR39ES/+KOGo5uTKNlWbdmVfThCiGFEmL/fbs/s28S6FX69bMH/RZICRu+qa52erJjSzj0eb/G3pj7GJjz3A9XZsTseNlgLNxsMEzv84BJ0w7FWs88O1FC1m6+R7WgL7UtPYtiGqSXkJxteVUKugiEQBvQLVsvuo7TgvGQuNs5+ShTCzCnTHWq5YF6bs8fs9mE+amrjv+1Fkb+tEhouvDSABWOQpiBjarOPeoUdWHomhroaoIML/gY072aNEEZSdRlJ15u/LG5VWNkNKi3lzJMz1JhFbBtajd0gelxiUpBk6bL0R6W/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+uRrA/iDxo85Xl86a9zay2C0pqsoRdEUq8wtq3Mzmg=;
 b=KLpieGdeIkBSX2WaQiCKnNlq8/Ryoi10MELtjlq0uRvAO4ZjXDYtYP1RxCUDNVzy6gQ3h4buD0eiJz197KQZv03ZVhW0VKOKKL47CCPvR7teO5hKduSdYQaw7lLCOjzsMvDXZ4P3U/XQ2J+xS2KpyhDk07lENuVHkK5LwomvuxU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida
	<gianluca@rivosinc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Alistair
 Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Topic: [XEN PATCH v1 1/4] arch/riscv: initial RISC-V support to
 build/run minimal Xen
Thread-Index: AQHZFsAJYhXYxlPpRkqmFf35I9Ktpq6DrqGA
Date: Wed, 28 Dec 2022 18:56:18 +0000
Message-ID: <8a32eace-6a7f-8f14-3784-39461db0db0d@citrix.com>
References: <cover.1671789736.git.oleksii.kurochko@gmail.com>
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <5d5ec5fbd8787ed8f86bf84a5ac291d07a20b307.1671789736.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CH2PR03MB5350:EE_
x-ms-office365-filtering-correlation-id: 60113ac6-bbc4-473e-ae88-08dae90533e9
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 oR4LJmLry0kGfL24d+UhpFsnzAeejfV9H3uuT9SZoAKEMGYbxTkza6Pdw0o+6erZavw6JB63IerIHCClssIkkpg4fCK5se9E8ngeAORGmY/6uFCxfCv2o2qlBQ3R9qT+AdFEiAVU0wGy15/utg8Pfi/q9C9C6Xi69JZ0LpcZZN5LFTTUs/GC53SBdxY7oZVkqj7nCXZ1pzUG4E8xYNe3PZgSbnTnjgOQ3Klcwf52nHiQdBnT4+9R8/SOQj9lwRoHFGLcOsjfoB3B0XEGM1vIgTkqIZ60CsY9Pjam6oA8QK1CN6jxPSKOoac+jzd72OjD2Ek9h4XFTuDcnmNPoRI2Sz8l4E/gZzfmUoEaQlTFWRWuoS7fsSIGl8DoMIZ6b7oHFEX2j07mofYSHAjKod+p268T/+596sMtvwdKbqp8OflqgGcDhFq40DI2x9A7SyK0Nks19BuYIarZdxwj3lc1Z39QeWEi6FR3H0Yp6g96ogXYJ9rEg+2lnSj3raLSQYzVII5OFkhde7EXwryxdXR3yTPQp1CKdHdwOWTkVazulQBeJiF3BsYEKdwQsm+DLqoK3UbN7EJJgvD4fv0x0XWXC3L/27s7xF7DEvQGNdRYMm9kVl0sQ74gwj4Hk/AwMYdqqH/q2BNfFsXFbsHcwbUKCwUbfFyl8sieFPNdW4NJ9xpiDQ6YUshxN7ySuAyTBpc/PfVhpc1sD7O2wXVeWjpEuRemyILCbfj0ID0pDZp6AS/8tG3kwYeKI14BBs4134wVu8Ilyc7775MvMVSFEuvE1A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199015)(122000001)(38100700002)(82960400001)(64756008)(76116006)(31696002)(4326008)(8676002)(86362001)(66946007)(91956017)(66446008)(316002)(66556008)(66476007)(41300700001)(71200400001)(54906003)(2906002)(8936002)(5660300002)(2616005)(26005)(186003)(6512007)(478600001)(6486002)(53546011)(107886003)(6506007)(38070700005)(31686004)(110136005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUNFbk80K3VIaWZRVExnNk1GeTRkcmFoSFYyYVZTSzF0YlphK01kYSs3cktn?=
 =?utf-8?B?Q2MwbmZJRlJNdmJvQVEvV0dqZ0JvTlk0dndKVThyMm1HUDFNM25uMVZ5YkV0?=
 =?utf-8?B?NUlyTWtDSHBCNzdYdE4wZ1N4ckZHZW1OWlVDTlRka3VIVUNDRUFBUUhYNjVN?=
 =?utf-8?B?QlVOMFdHWDRaL0hndzk5OEpTSjNYSzhhK01LVlEzeEthOTFKVW1IK2FiTGZu?=
 =?utf-8?B?QmQ1SEs0T2QxTGVzQWw4VmdrcTRFME5oRWpvSXRPNWwwWEYxNUdjT21hdFVF?=
 =?utf-8?B?OW5lVnJSdlZEcFVZSHZScXNqWnY1d3Q4YUtHbW0xMytlcjAwb0MwTUdmUThx?=
 =?utf-8?B?S2I4blpPZmt3VS9vQnNwaDJ3YzJuSXJxWHRJODA3RC9sbmxRSkIycFRXZXNI?=
 =?utf-8?B?TkFobkRlMlpmQy9oK3Y1SFVmMTBOdmhNTGVERUVLUmw1dmE0WjVQdFBHUGM3?=
 =?utf-8?B?RjFudUJVYUxzeEd1T3B6WHhndC9YeHVzUHFmanZLTEt5T0k3K3FWNmpic3NH?=
 =?utf-8?B?NyszNVYwNUE4a001SFVsdFpYUXNIK0ZpU2NyNXRLRDA0b25CYU1sYnpydzQv?=
 =?utf-8?B?Z3I4dFpPS0xabVJhc3JVS2JEZGdKMExpZEh6NFE1Zmd4Z1pDNnRvcmdScTd6?=
 =?utf-8?B?M2JHWlEvUmRhN0ZIUzF0WXR3dWwyWGVCdVF0bDhQWGxmOG5WREVyOWlJNHZa?=
 =?utf-8?B?Si83MGROTjhQWWtXcEV0amNpM0RmOHovaFQ3WXpFZ0p0bVBHOHRpeXUvMllH?=
 =?utf-8?B?TDlLdkNSWnRnR1lTN1BqY0hGOUYzcjIyZEJlV1ZOOWhLZUNVcENyS1NGMmpJ?=
 =?utf-8?B?NVk5WjVJUG9NNDNDbDM4L2I4TXRFbW0zcnpkc0xmZHBKYWw1UThCQTIrRHBK?=
 =?utf-8?B?RFpQenVyV3MvR1FlY2JidlVjWjNNTmVJRkpaQU9aNUs5NVdPL0NuM0o5Ukwy?=
 =?utf-8?B?bjdYSUg3alIrMHFiV2djbVhNaTQ5MVNTd0RVVGlKNzNka2p1b2g0bnBjUE8x?=
 =?utf-8?B?b1VXVlR4T01XbVNsMzl1c0ovSnJGVkE3Rk9LZlZid1JlZzFKeGN1RjRFQmFI?=
 =?utf-8?B?Ry9oVTRqNEJCRE43WEU4eHNpaGY4M2h1eTFzWUJWZ0lFU2d1WTdZdlYyamhv?=
 =?utf-8?B?Z2FreVAwL3kyMTZSK0F6WW90ZDJYTXJPU0V2d0Zsb3pXZlk4VVF3cTB5aEJV?=
 =?utf-8?B?bWZwQTdmYnVOVDNCSVplUyt1aXdXN1h1d09CdVUrTEZvTTFRRi9SVW1LY0Nj?=
 =?utf-8?B?QkhweC9HUFd1bVFiTGtBb3RhYUQ4WHlIMHQ5OFF5SmpQTm53UXZXQmdBNnkw?=
 =?utf-8?B?VXh6NmZHSzRrSnlMcFF4VGRDNlF5RlBGK1NiQ1NrM05TMnV3N1prR0tjeVFL?=
 =?utf-8?B?MDh0QUVOMUY3T3MzUjF4Znc0YVp5djQvV2RweWs0NllyV0U4K2l5RnZTYVZW?=
 =?utf-8?B?MVdkbDVUR2VBcXRjbGpIT2xxQTU5aU1RMWlTTWp5VzI5bFZza0haZnNRai9k?=
 =?utf-8?B?OEljVE9VSHcwV0ttWll4QkMyQ3g2TmZWQnJzVG5RTnE4ZXZvdnZ4LzZabUYy?=
 =?utf-8?B?NFNiUW1PaGxtRjVhRUFuVVVuYnlQUWowVTlQOHlGUDVBQXpxdzJ2NzBpczFS?=
 =?utf-8?B?QTd1ZHVoNFdIcFBheFZHQjVOUE9CZTcvTERDMDhTMlgxYm1aUkpPRys5MXlO?=
 =?utf-8?B?cGJSQlNiTjE0TjE3Y0YxdGNuVWMzMzR3N3U1dkhsK2pzWE1nZ0k4NE9DZ0tl?=
 =?utf-8?B?d1JVOGhFaFJxU0JLY3dlQit1aXF0MEJiSmZvSkp4eHlOVHNiSGY1VEVESUZH?=
 =?utf-8?B?Sk9hZ3l0ajd1a3c1bTY0ZVdNeWp4QXhpSlc3aEZjRmxEZTZ5S0dlV3ErU2Jr?=
 =?utf-8?B?Ulk4dmhKVHhhZ3JYUDQwV2kwcnVTaVdsWmR1ZHFCYnBTZXZvYTBvWXdHbDJM?=
 =?utf-8?B?WmJzc2J0UE1UWi9WL2pVenppRnF6UTZUZy92eFFKUEcvakNvcTZUZXE2aTM1?=
 =?utf-8?B?dTh1d0ViditkaE0yV2hQS2EzUDZCOUF0alQyQ2NJclFudTg3WDk0RUJoaW1h?=
 =?utf-8?B?L2dvbEJGOFV3cFZDQjJOQTBnVWgrNEtFVUk0emUxeW9EUngwam1abWJHNnF5?=
 =?utf-8?Q?/zOcrWGyNyUW502ICaISNfKVJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76138B7AE772E64B83E1FAC66EA554EB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60113ac6-bbc4-473e-ae88-08dae90533e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2022 18:56:18.0938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdxHmpDYo5TT7I5CAXT5o5JECmyb7HmtwU0IAnYROn0mbMCk+SAhBCWba7M/vT7/2Q2Z/TNfwA3KQjZ8fWJ1vcJD1W72Dmd5EeDDDqErA4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5350

T24gMjMvMTIvMjAyMiAxMToxNiBhbSwgT2xla3NpaSBLdXJvY2hrbyB3cm90ZToNCj4gZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3Jpc2N2L01ha2VmaWxlIGIveGVuL2FyY2gvcmlzY3YvTWFrZWZpbGUN
Cj4gaW5kZXggOTQyZTRmZmJjMS4uODkzZGQxOWVhNiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gv
cmlzY3YvTWFrZWZpbGUNCj4gKysrIGIveGVuL2FyY2gvcmlzY3YvTWFrZWZpbGUNCj4gQEAgLTEs
MiArMSwzMiBAQA0KPiArb2JqLSQoQ09ORklHX1JJU0NWXzY0KSArPSByaXNjdjY0Lw0KPiArDQo+
ICskKFRBUkdFVCk6ICQoVEFSR0VUKS1zeW1zDQo+ICsJJChPQkpDT1BZKSAtTyBiaW5hcnkgLVMg
JDwgJEANCj4gKw0KPiArJChUQVJHRVQpLXN5bXM6ICQob2JqdHJlZSkvcHJlbGluay5vICQob2Jq
KS94ZW4ubGRzDQo+ICsJJChMRCkgJChYRU5fTERGTEFHUykgLVQgJChvYmopL3hlbi5sZHMgLU4g
JDwgXA0KPiArCQkkKFNZTUJPTFNfRFVNTVlfT0JKKSAtbyAkKEBEKS8uJChARikuMA0KPiArCSQo
Tk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQpLy4kKEBGKS4wIFwNCj4gKwkJfCAkKG9ianRyZWUp
L3Rvb2xzL3N5bWJvbHMgJChhbGxfc3ltYm9scykgLS1zeXN2IC0tc29ydCA+JChARCkvLiQoQEYp
LjAuUw0KPiArCSQoTUFLRSkgJChidWlsZCk9JChARCkgJChARCkvLiQoQEYpLjAubw0KPiArCSQo
TEQpICQoWEVOX0xERkxBR1MpIC1UICQob2JqKS94ZW4ubGRzIC1OICQ8IFwNCj4gKwkJJChARCkv
LiQoQEYpLjAubyAtbyAkKEBEKS8uJChARikuMQ0KPiArCSQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2
ICQoQEQpLy4kKEBGKS4xIFwNCj4gKwkJfCAkKG9ianRyZWUpL3Rvb2xzL3N5bWJvbHMgJChhbGxf
c3ltYm9scykgLS1zeXN2IC0tc29ydCA+JChARCkvLiQoQEYpLjEuUw0KPiArCSQoTUFLRSkgJChi
dWlsZCk9JChARCkgJChARCkvLiQoQEYpLjEubw0KPiArCSQoTEQpICQoWEVOX0xERkxBR1MpIC1U
ICQob2JqKS94ZW4ubGRzIC1OICQ8ICQoYnVpbGRfaWRfbGlua2VyKSBcDQo+ICsJCSQoQEQpLy4k
KEBGKS4xLm8gLW8gJEANCg0KVGhlIGNvbmRpdGlvbmFsIGVtcHR5aW5nIG9mIFNZTUJPTFNfRFVN
TVlfT0JKIGluIGFyY2gubWsgd2lsbCBicmVhayB0aGlzDQpsb2dpYyBpZiBpdCBhY3R1YWxseSBn
ZXRzIGVtcHRpZWQsIGJ1dCB5b3UgY2FuIGRyb3AgYWxtb3N0IGFsbCBvZiBpdC4NCg0KVGhpcyBz
aG91bGQgYmUganVzdA0KDQokKFRBUkdFVCktc3ltczogJChvYmp0cmVlKS9wcmVsaW5rLm8gJChv
YmopL3hlbi5sZHMNCsKgwqDCoCAkKExEKSAkKFhFTl9MREZMQUdTKSAtVCAkKG9iaikveGVuLmxk
cyAtTiAkPCAkKGJ1aWxkX2lkX2xpbmtlcikgLW8gJEANCg0KaW4gdGhlIHNob3J0IHRlcm0sIEkg
dGhpbmsuDQoNCj4gKwkkKE5NKSAtcGEgLS1mb3JtYXQ9c3lzdiAkKEBEKS8kKEBGKSBcDQo+ICsJ
CXwgJChvYmp0cmVlKS90b29scy9zeW1ib2xzIC0tYWxsLXN5bWJvbHMgLS14ZW5zeW1zIC0tc3lz
diAtLXNvcnQgXA0KPiArCQk+JChARCkvJChARikubWFwDQo+ICsJcm0gLWYgJChARCkvLiQoQEYp
LlswLTldKg0KPiArDQo+ICskKG9iaikveGVuLmxkczogJChzcmMpL3hlbi5sZHMuUyBGT1JDRQ0K
PiArCSAgICAgICAgJChjYWxsIGlmX2NoYW5nZWRfZGVwLGNwcF9sZHNfUykNCg0KWW91J3ZlIGdv
dCBhIHRhYiBhbmQgc29tZSBzcGFjZXMgaGVyZS7CoCBJdCB3YW50cyB0byBiZSBqdXN0IG9uZSB0
YWIuDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbmZpZy5o
IGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gaW5kZXggZTJhZTIxZGU2
MS4uNzU2NjA3YTRhMiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y29uZmlnLmgNCj4gKysrIGIveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29uZmlnLmgNCj4g
QEAgLTM2LDYgKzM2LDMwIEBADQo+ICAgIG5hbWU6DQo+ICAjZW5kaWYNCj4gIA0KPiArLyoNCj4g
KyAqIERlZmluaXRpb24gb2YgWEVOX1ZJUlRfU1RBUlQgc2hvdWxkIGxvb2sgbGlrZToNCj4gKyAq
ICAgZGVmaW5lIFhFTl9WSVJUX1NUQVJUIF9BVCh2YWRkcl90LDB4MDAyMDAwMDApDQo+ICsgKiBJ
dCByZXF1aXJlcyBpbmNsdWRpbmcgb2YgYWRkaXRpb25hbCBoZWFkZXJzIHdoaWNoDQo+ICsgKiB3
aWxsIGluY3JlYXNlIGFuIGFtb3VudCBvZiBmaWxlcyB1bm5lY2Vzc2FyeSBmb3INCj4gKyAqIG1p
bmltYWwgUklTQy1WIFhlbiBidWlsZCBzbyBzZXQgdmFsdWUgb2YNCj4gKyAqIFhFTl9WSVJUX1NU
QVJUIGV4cGxpY2l0bHkuDQo+ICsgKg0KPiArICogVE9ETzogY2hhbmdlIGl0IHRvIF9BVCh2YWRk
cl90LDB4MDAyMDAwMDApIHdoZW4NCj4gKyAqICAgICAgIG5lY2Vzc2FyeSBoZWFkZXIgd2lsbCBi
ZSBwdXNoZWQuDQo+ICsgKi8NCj4gKyNkZWZpbmUgWEVOX1ZJUlRfU1RBUlQgIDB4ODAyMDAwMDAN
Cj4gKy8qDQo+ICsgKiBQQUdFX1NJWkUgaXMgZGVmaW5lZCBpbiA8e2FzbSx4ZW59L3BhZ2UtKi5o
PiBidXQgdG8NCj4gKyAqIHJlbW92ZSB1bm5lY2Vzc2FyeSBoZWFkZXJzIGZvciBtaW5pbWFsDQo+
ICsgKiBidWlsZCBoZWFkZXJzIGl0IHdpbGwgYmUgYmV0dGVyIHRvIHNldCBQQUdFX1NJWkUNCj4g
KyAqIGV4cGxpY2l0bHkuDQo+ICsgKg0KPiArICogVE9ETzogcmVtb3ZlIGl0IHdoZW4gPGFzbS9w
YWdlLSouaD4gd2lsbCBiZSBuZWVkZWQNCj4gKyAqICAgICAgIGRlZmludGlvbiBvZiBQQUdFX1NJ
WkUgc2hvdWxkIGJlIHJlbW92ZSBmcm9tDQo+ICsgKiAgICAgICB0aGlzIGhlYWRlci4NCj4gKyAq
Lw0KPiArI2RlZmluZSBQQUdFX1NJWkUgICAgICAgNDA5Ng0KDQpJJ3ZlIGNvbW1pdHRlZCBBbGlz
dGFpcidzIHBhdGNoIHdoaWNoIGFkZHMgcGFnZS1iaXRzLmgsIHNvIHRoaXMgc2VjdGlvbg0KY2Fu
IGdvIGF3YXkuDQoNCldlIHN0aWxsIG5lZWQgWEVOX1ZJUlRfU1RBUlQsIGJ1dCB3ZSBkb24ndCBy
ZWFsbHkgbmVlZCB0aGUgY29tbWVudGFyeQ0KZXhwbGFpbmluZyB0aGF0IGl0J3MgdGVtcG9yYXJ5
IC0gdGhhdCBpcyB2ZXJ5IGNsZWFyIGZyb20gdGhlIHN1YmplY3Qgb2YNCnRoZSBwYXRjaC4NCg0K
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdHlwZXMuaCBiL3hlbi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3R5cGVzLmgNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwMC4uYWZiY2E2YjE1Yw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3hl
bi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3R5cGVzLmgNCj4gQEAgLTAsMCArMSwxMSBAQA0KPiAr
I2lmbmRlZiBfX1RZUEVTX0hfXw0KPiArI2RlZmluZSBfX1RZUEVTX0hfXw0KPiArDQo+ICsvKg0K
PiArICoNCj4gKyAqIGFzbS90eXBlcy5oIGlzIHJlcXVpcmVkIGZvciB4ZW4tc3ltcy5TIGZpbGUg
d2hpY2gNCj4gKyAqIGlzIHByb2R1Y2VkIGJ5IHRvb2xzL3N5bWJvbHMuDQo+ICsgKg0KPiArICov
DQoNCkFnYWluLCBubyBuZWVkIGZvciB0aGlzIGNvbW1lbnQuDQoNCkhvd2V2ZXIsIEkgdGhpbmsg
d2Ugd2FudCB0byByZWFycmFuZ2UgdGhlIGJ1aWxkIHN5c3RlbSB0byBoYXZlIGEgZmluYWwNCi1J
IG9wdGlvbiBmb3IgeGVuL2luY2x1ZGUvc3R1Yi9hc20vIG9yIHNvLCBzbyB3ZSBjYW4gcHV0IHNv
bWUgZW1wdHkNCmZpbGVzIHRoZXJlIGFuZCBhdm9pZCBoYXZpbmcgYXJjaGl0ZWN0dXJlcyBuZWVk
aW5nIHRvIHByb3ZpZGUgZW1wdHkgZmlsZXMuDQoNCklmIHRoaXMgZmlsZSBpcyBuZWVkZWQsIHRo
ZW4gaXQgbmVlZHMgYSBtb3JlIHNwZWNpZmljIGhlYWRlciBndWFyZCB0aGFuDQpfX1RZUEVTX0hf
Xy7CoCBUaGF0J3MgdGhlIGdlbmVyYWwgZ3VhcmQgZm9yIHhlbi90eXBlcy5oIG1lYW5pbmcgdGhh
dA0Kbm90aGluZyBpbnNpZGUgdGhpcyBmaWxlIHdpbGwgYWN0dWFsbHkgc3Vydml2ZSBwcmVwcm9j
ZXNzaW5nLg0KDQp+QW5kcmV3DQo=

