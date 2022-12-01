Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF7C63F032
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 13:11:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450665.708041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iOn-0000uy-Ag; Thu, 01 Dec 2022 12:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450665.708041; Thu, 01 Dec 2022 12:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iOn-0000s7-7n; Thu, 01 Dec 2022 12:10:41 +0000
Received: by outflank-mailman (input) for mailman id 450665;
 Thu, 01 Dec 2022 12:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0iOm-0000qu-15
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 12:10:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49b07d39-7170-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 13:04:22 +0100 (CET)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 07:10:36 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7017.namprd03.prod.outlook.com (2603:10b6:510:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 1 Dec
 2022 12:10:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 12:10:34 +0000
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
X-Inumbo-ID: 49b07d39-7170-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669896638;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Zgm3quzPhIrQObII6xGCpYBEErLcJ1x8G3ceXwDUnhE=;
  b=hoB0oR1Tk1aaUqA+f08lmmA+tlfSxhhjNbDeKbjvg1XeEodl2G/tzmnR
   +evsETUzbrMZRrPsmmp7/NXm6ULF7rjDutyyG4dTOJVgIZgjkMJ4Hr+92
   5A7SuNzlxLsb2GVQltVQlQibiyRzImUe0AzV42xTA6LbvxuZsmq0Qeuge
   c=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 85074263
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+lVri6C87kzf1RVW/zXiw5YqxClBgxIJ4kV8jS/XYbTApDh3gTBVz
 DRJW2qCPKuPazT0c4ggOo+28h4E75aHn98wQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1rZ8Kj1E1
 qUiKTlUdE+7pfqQmp6Ec7w57igjBJGD0II3nFhFlW2cKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/uxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr+SxXynAtxJfFG+3vBtqQyd4UwJMUZVbkHhr8uJoFaBVPsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZNYcIrnNU7Tjsr0
 hmOhdyBONB0mLicSHbY86jOqzq3YXQRNTVbOnNCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlddCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:uYukraj8P/fk63v+ThWSgGw6z3BQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="85074263"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmiAAFPLa9UyQ/WDHqviM8DRaZL6T+wa8+zsT0T2ntXP//p0eKumSLrt34uBaaxjoqPSotKb2ved80xu7B9w8dcX5o/fCyLTZdSg+knBnXT9tKZjMU7eMYzUTOTdm6CWv3AVWsmmvg5ye5XRBq5DWlqtQxSvyKHpqCdgeNIba3t38v1fRIXRRxq4zJ/qpAZ2MaVq8fryAhlHl+BdV9OZl60d0PBX4Yl8ScYNVieI57FYJPujp3JqrboGK91l1/+nIUnmBBZq+pcJp/3FQJ2+cEpRFAeNo+xnourVRIRLHt3JqhE3I9oRSaiCF6dokPQIis6G16heHS4Ip9xn/NWMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zgm3quzPhIrQObII6xGCpYBEErLcJ1x8G3ceXwDUnhE=;
 b=kxnnniSNJxMO7+jBABKjnu5265+xkj+nKAu5vCL2mnOHRDYMyXwRfcDNeKMO3V7KE4SkaTXxSUx5CKsUJAFKb1swfi1/PiAkJK2q2Do5ZEBqDHKuSOwRetBG3eez7+BPbjC5o9kqNyMCWWWkbeMBdGHspPeuQbOQBKsqzRWzSMh1wQJk9OhsI1477wyiz06CSnKys52s1vsAH0aQwPqY8mUndysiyPl5bUwZtu6k63wtq4PWvBXY/JmO+bWv6g1x1J1EGujfwn5AetAcSW6kQHXYvo4Q0d2+mGEKUUV606kkt+mwIfeERCUHK/J/y80QuuEBr7bNXhh883XDQWsGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgm3quzPhIrQObII6xGCpYBEErLcJ1x8G3ceXwDUnhE=;
 b=TXeKKuI3dei2CD+YYaPeTOOS+N2fPiHzFIi2Vby4W3mh6eYPrmNiXGb9pZIg7BIHbW/bARt4TaTA6YmPGwjz1O3zqIIRv4xIcrd+HQ37xDeTclOYXW51MHCMafcHsIjjnLu6/wKh9e7TqLV4GnPSCkxRoQNLHbBQ76qqKj2Pexs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Edwin Torok <edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Topic: [PATCH v2 4/6] tools/oxenstored: Implement Domain.rebind_evtchn
Thread-Index: AQHZBNyCDn6uLkqfu0u4eQJKM+z0V65Y5D8AgAAN2oA=
Date: Thu, 1 Dec 2022 12:10:33 +0000
Message-ID: <6c667e15-8a6c-753b-923d-fb5ea7839cc3@citrix.com>
References: <20221130165455.31125-1-andrew.cooper3@citrix.com>
 <20221130165455.31125-5-andrew.cooper3@citrix.com>
 <27ED9DA5-D63E-4F49-824A-74AD7149DA5C@citrix.com>
In-Reply-To: <27ED9DA5-D63E-4F49-824A-74AD7149DA5C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|PH0PR03MB7017:EE_
x-ms-office365-filtering-correlation-id: 6da6276f-5367-4a66-9e3b-08dad3950c7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bDa//QAjIA8guMFLYjm8rActBiRVf+RnFLj9YHaJB6gAFV7abNx/uCwezuxqxJ0ZvOoY88OBP4q0Wvg2hFiGcSNEYLVQpwGS5lhykOTZRFBBfF9jyLQUzDm1rDkIAD+4dXOtP+qiVd2YZ0J6wxFfHcH48LJXZdI/J/eBLnk+pBxw3dP2tlqf3FMwBiDuz3pvbK+cBxIE0UJZ6AThhxQlxFVr1E/gNkVNq2yW8KA9kNgdVf8IYiPApLfCtkFPcr0i0FYfKbB6BzJO8GG/TbOD/CMFEetW+7Z12NnqpRF1Q9ZOPhwTxQTsNDVocJWmj8S9HgKuZjBIXLkM+tmoMk2ILz5Zm0XcFMFlyzqZdPVO0ywNrii8xg7aYGBVOacRxYbTjD7qM5NK9uAfILLzrb840QGpe51CpFU8kJMMzGG/3ccDJMkqeACp/FpkymRAFG3DcvW15MneikQsZ1k02Be8PbouL20nIy5pblfMCXHG5SODInAj1yNEpgoXJlwYXktVeDZ2tMmlrrwTIu0K0diahD0Kag+HY9ZzRffpKSh79M9w25/blamEfeX0SF0I0uq6mjT9+LsD2EAgl4UkMoNn7zZeCFc5LCWpjswT9eh6/02TdKAxkfMgAdL0OGh0kJj1DkApCcPZPd5s96+bh/861wX1fQGZYAeYk9BRWYJ2vZFK0wwFY1T9ObpKCuhPdJONRFU0bwLoTpFrfIRB2nzSD/RjiskE5AeZZHwsL2pl8RekLZQUF9ECB4r7ZGkvM8WkCB4R6bEdVLrtx6DVOzw1UA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199015)(186003)(316002)(53546011)(107886003)(5660300002)(2616005)(6506007)(26005)(54906003)(31696002)(37006003)(36756003)(6636002)(86362001)(6862004)(91956017)(66946007)(71200400001)(4326008)(6486002)(478600001)(66476007)(66446008)(66556008)(64756008)(8676002)(76116006)(38070700005)(8936002)(38100700002)(6512007)(31686004)(122000001)(2906002)(83380400001)(41300700001)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUxRbGpQanFNRE5LNFJYTWQzbU11QTM2K3hNOFdhUGkxRzJZelNEMDVXWllk?=
 =?utf-8?B?cmZxZlh6TVEvLytKZ09SL3pGaUR1NDk2OXN1VE1lS0t4TUViNWdzdmhjTXhT?=
 =?utf-8?B?Rjk2Uy9HNjV1WGlRNTRxOXVkUGZYRTJYLytGM3dKdTlkWTBaZm1pL20rOXVH?=
 =?utf-8?B?TUl5L05laGpIWUJlT1M3TkR5cWZmM0FYVk5EeHpkN25tSU9yU29KelVoZHp3?=
 =?utf-8?B?czRQYm9WNkZrVk4xOUlyQnM1TWx1RStHRU12VnlSbmZNaFlPaGhNT0Vnd1Er?=
 =?utf-8?B?VWF0c2VCT3RyR2E3ak53UVlBUW41NzBZYnZtbVVYNkhudWhHQTN0VUVxWUxx?=
 =?utf-8?B?T2RFN1RDUU8yOFBnOHNIb3ZKQlNpSzd6WnZBSlBwWjFlMnVDOG5FQ1grdCtL?=
 =?utf-8?B?NzVtT2t1Ym0ycWFKNS9MYjRKN0dtbzZIc1ZLYmpHZXE3NVp1V3JYTDhWd1RD?=
 =?utf-8?B?R3Q2OE1qbEdnWTVBOG5PSkxrU3hWZ3pOQkFCbG50N2FxNXdFNExnc0hFY3g2?=
 =?utf-8?B?eEo3RUhVU0lVSmlSZERBbHBLMUE2cVJ6Q3BJbFRHMkoxa2JteC9SWHR6ZFpF?=
 =?utf-8?B?UHd6RVQ1ZW8wQ1VjaElBR3B2ZGNYc1RJZGttSDRQeC8wcnlvOGdYSlkxdi9y?=
 =?utf-8?B?TUtiRG8yei9uTFRIcWZQWEpya2p4VUVHbkpsUE5VSlczTFNnZWdFdW1tcHJH?=
 =?utf-8?B?NVd2dEN5cXFMRkY3R1M0emlRcGZrYmZMTjVvR1VKUis0RDBPTm4rQlltazVI?=
 =?utf-8?B?aTZMMkNoSUIzME9hUm5xSDNWNFV5N25UaGpDeXB2MEVFZW40NjJzSi9ZU1Nk?=
 =?utf-8?B?VWpNT0Z3U1l2OGxDckE4TVo4djRWbEFpSzRleXpWTXRBNFB0a05DMHhIYk04?=
 =?utf-8?B?ZmJUaklKTWRwK2owWjRqZisrcGE5UW00UHRWblliNEdNTEMyOVZuRmtpYWsr?=
 =?utf-8?B?ZUdBV3FVd2sxaHR5dDEyVllKRlpvS3M0U3ZxRjEybHVXWW5FSGlKM0dvaHE2?=
 =?utf-8?B?WjdKelhCblRLN1RIUkNFcnp3SU5PemZoLzFmZkxCOHA3aUVMdjdPT1dEM0JK?=
 =?utf-8?B?TDhNdkpVU21hVU9JcHBxQ2pvbldQY2RVYTdPeTBwaXliQVd5ZGZBU001d3ls?=
 =?utf-8?B?T21OQXpwSVdidVp1MVdaK0VnaDdNc0tqYzNSU0hzRmpaQUxYelhqY0Zhb2ty?=
 =?utf-8?B?WHQvWTRLeXAzRm5JWEVGTWU2TWZPOEhXbnNmRW8yVld2MlR3RHpNcStTYnJB?=
 =?utf-8?B?SzFwT0pmUmlJVHgyK1Zkc01TNUxoOEtFaGhSaktHWnZTTmRGN2o5WkIyUmdy?=
 =?utf-8?B?V0I5K3JPYjA2eEJiYlJORWxrMTIyREVyNGZLdFI1VmJOZDBxbUI3V2lZSGNK?=
 =?utf-8?B?Rm1YM2paQWE3SkNuckhCcHdvUklERUhqcHhCM1dyaXdzdzNwSE1LcWZpVi9o?=
 =?utf-8?B?bFAvREFIRmpDbUpsL0pScjIrV0pCUExUZzJLM25HK1lqODNjNTVkeS9iSjlZ?=
 =?utf-8?B?YjJkNDA0NmNSbDNjN2V5RDlCV2lpR2RxSE5QdjJCQnpQRFQwUlI4dVZZR2RR?=
 =?utf-8?B?VTJLdXVWWXZnY2FSckZQdFd2dTlYdHBZZWNiTXk4emxSTUpkd01RcFpNVXZs?=
 =?utf-8?B?bnFDcFRmQ3BPVmtwVFdicXdMaFp4WEhJakhiMGd3N2FOeW55aUptZmg5VFBp?=
 =?utf-8?B?OG5TRzBLKzRWVVErVHRmRVV6RnV1MFJxaTQ0aW5wczRRclVtcU5MTTJXWEZL?=
 =?utf-8?B?dFBseWVZeFE4SFV4N1VzWjFmczIrN2tXZjVjeHhHODByNzJRQkdFL0Nnc2NN?=
 =?utf-8?B?M2xqZk1tOEtvMDEyWFN0Z0NFRkJaUnlVLzVMeElYdmpweStPbjdaUTMrYy9I?=
 =?utf-8?B?aHFQQ2ZDRllUZWdPc05yZmVKeDBnUW5XaktkSTc4SVdlMGVaYWt4cDZ3U0k3?=
 =?utf-8?B?U3BSeXNKQ0dBUE13aHR2aUNpREhFWFdQN2pUbUhKQWpkQ24ydHVYOExJMTYv?=
 =?utf-8?B?d1pCcGdUNTJkZDdUNGRNQnhMYlZ0VXQ5eVB2eEY1MXBNZ0hmL0JDVGNkRncv?=
 =?utf-8?B?TjNpdXFLREgyOEEvcmI0K3FzV0o3VVkxdVJ0Mk0xTmY5ZWYzcXpwY0QzNVZR?=
 =?utf-8?Q?NG1NVnPIsb5/8icl1MksVuuaq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33B450D82E09AE4992842F4ADCE30ABB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j2N+tsquPXnGizMqOzNC6RutonGyLD6NgKoOKgXSFvDi5WEnd9ZUFuKj+3ISG+Jqep00JsxWUFA+5XYZqp9yXkfx7Lk7zDMcx/+aqfKAEXYg0HrYxtwMLIi4+BcwCFQ/eqpsrcsV0qskEGtjJVH4VrDInGWgqbWKqgIqzp37C/AtpTWBoLgL1tmw6rKlsf5udrkY3qWMOZ1+0CugI0wZIzMYHW0xzXXYtaJVkBuOumHjzCHzPFYO/OGulsiEf1IG0i1JcF9FjyPOinYxjdBrGGSDNDbTCFGK7342KpX601S89bvh3IOH5yNV+ArjwzeXo7lTaxUsZ02ETNg+ew+tY6i+s0rs6UdtZB5uh0UU9N+mxzo3VQlwD+kWROIJ3NtPb8zmYdA372W5cRGoloS3yrXx6PBXO44ECVlrMSwWXLj7m2oV/6qdukMPdQFmFP746p1VqSlE5jugoW8B8sYuMfM7nTHwAbdHk73RrWWHU4hlb4CWgZsOi0RFlcAXS5znlx2CZhxK88s6LwfpaOWZ1yV+pSe4sRcUS6HGohncDTHmiVn42fl62ijKUVfqQcqh4Ni4P9q5f/e9MVfIELpLqtC79mkcdYYcc7X8L6+SlAqv+Rf4/4kArHm60RnPklpaYDVpYaIeIDl5YzZy/tMZ/ykiObuq6UE7rUkKTNkZxD+OE5OiKrHFcN30VcnbHr0Z8+e4rn9dvVV62QPDNA8s4WM02AVC1g8B/I+WIGjtvPCoStAki+9SzwsqT5sKgFZQpRuVniOv4JA3ajL2DyF+jid0CSMnjKL1ErVfjms0TUUfNlzJ39ko8hIkaGL9jPJs
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da6276f-5367-4a66-9e3b-08dad3950c7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 12:10:33.9090
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l8bX5KdUVdQgSQuzmwJXpeQYVp+IAME/OKhnsRdSOmxLxghAOU0uxGQt+mV5jCQTLzV5pCo3UEjLj+F/i09QzJTpkiFh93W/BFKbtuq2QSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7017

T24gMDEvMTIvMjAyMiAxMToyMCwgQ2hyaXN0aWFuIExpbmRpZyB3cm90ZToNCj4NCj4+IE9uIDMw
IE5vdiAyMDIyLCBhdCAxNjo1NCwgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT4gd3JvdGU6DQo+Pg0KPj4gR2VuZXJhbGx5IHNwZWFraW5nLCB0aGUgZXZlbnQgY2hhbm5l
bCBsb2NhbC9yZW1vdGUgcG9ydCBpcyBmaXhlZCBmb3IgdGhlDQo+PiBsaWZldGltZSBvZiB0aGUg
YXNzb2NpYXRlZCBkb21haW4gb2JqZWN0LiAgVGhlIGV4Y2VwdGlvbiB0byB0aGlzIGlzIGENCj4+
IHNlY29uZGFyeSBYU19JTlRST0RVQ0UgKGRlZmluZWQgdG8gcmUtYmluZCB0byBhIG5ldyBldmVu
dCBjaGFubmVsKSB3aGljaCBwb2tlcw0KPj4gYXJvdW5kIGF0IHRoZSBkb21haW4gb2JqZWN0J3Mg
aW50ZXJuYWwgc3RhdGUuDQo+Pg0KPj4gV2UgbmVlZCB0byByZWZhY3RvciB0aGUgZXZ0Y2huIGhh
bmRsaW5nIHRvIHN1cHBvcnQgbGl2ZSB1cGRhdGUsIHNvIHN0YXJ0IGJ5DQo+PiBtb3ZpbmcgdGhl
IHJlbGV2YW50IG1hbmlwdWxhdGlvbiBpbnRvIERvbWFpbi4NCj4+DQo+PiBObyBwcmFjdGljYWwg
Y2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3Rp
YW4ubGluZGlnQGNpdHJpeC5jb20+DQo+PiBDQzogRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9y
Zz4NCj4+IENDOiBFZHdpbiBUb3JvayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4NCj4+IENDOiBS
b2IgSG9lcyA8Um9iLkhvZXNAY2l0cml4LmNvbT4NCj4gQWNrZWQtYnk6IENocmlzdGlhbiBMaW5k
aWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCg0KVGhhbmtzLg0KDQo+IFRoZSBjb2Rl
IG1ha2VzIGNoYW5nZXMgYXJvdW5kIGlmLWV4cHJlc3Npb25zIGFuZCBpdCBpcyBlYXN5IHRvIGdl
dCBtaXNsZWFkIGJ5IGluZGVudGF0aW9uIHdoaWNoIHBhcnRzIGFyZSBjb3ZlcmVkIGJ5IGFuIGlm
IGFuZCB3aGljaCBhcmUgbm90IGluIHRoZSBwcmVzZW5jZSBvZiBzZXF1ZW50aWFsIGNvZGUuIEkg
d291bGQgYmUgbW9yZSBjb25maWRlbnQgYWJvdXQgdGhpcyB3aXRoIGF1dG9tYXRpYyBmb3JtYXR0
aW5nIChidXQgYWxzbyBiZWxpZXZlIHRoaXMgaXMgY29ycmVjdCkuDQoNCkkgY2FuIGtlZXAgdGhl
IGJlaW5nL2VuZCBpZiB5b3UnZCBwcmVmZXIuDQoNCkxvb2tpbmcgYXQgdGhlIGVuZCByZXN1bHQs
IGl0IHdvdWxkIGFjdHVhbGx5IHNocmluayB0aGUgcGF0Y2gsIHNvIGlzDQpwcm9iYWJseSB3b3J0
aCBkb2luZyBhbnl3YXkgZm9yIGNsYXJpdHkuwqAgVGhlIG5ldCByZXN1bHQgaXM6DQoNCmRpZmYg
LS1naXQgYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KYi90b29scy9vY2FtbC94
ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KaW5kZXggYjI5NzNhY2EyYTgyLi4xYzgwZTcxOThkYmUgMTAw
NjQ0DQotLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvcHJvY2Vzcy5tbA0KKysrIGIvdG9vbHMv
b2NhbWwveGVuc3RvcmVkL3Byb2Nlc3MubWwNCkBAIC01NjksOCArNTY5LDcgQEAgbGV0IGRvX2lu
dHJvZHVjZSBjb24gdCBkb21haW5zIGNvbnMgZGF0YSA9DQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxldCBlZG9tID0gRG9tYWlucy5maW5kIGRvbWFpbnMg
ZG9taWQgaW4NCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKERvbWFpbi5nZXRfbWZuIGVkb20pID0gbWZuICYmDQooQ29ubmVjdGlvbnMuZmluZF9kb21h
aW4gY29ucyBkb21pZCkgIT0gY29uIHRoZW4gYmVnaW4NCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgqIFVzZSBYU19JTlRST0RV
Q0UgZm9yIHJlY3JlYXRpbmcgdGhlDQp4ZW5idXMgZXZlbnQtY2hhbm5lbC4gKikNCi3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWRv
bS5yZW1vdGVfcG9ydCA8LSByZW1vdGVfcG9ydDsNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRG9tYWluLmJpbmRfaW50ZXJkb21h
aW4gZWRvbTsNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRG9tYWluLnJlYmluZF9ldnRjaG4gZWRvbSByZW1vdGVfcG9ydDsNCsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW5kOw0KwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlZG9tDQrCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSB0cnkNCg0KSSdtIGhhcHB5IHRvIGFkanVzdCBvbiBj
b21taXQuDQoNCldoZW4gSSBzdGFydGVkIHRoaXMsIEkgdHJpZWQgcmVhcnJhbmdpbmcgdGhpbmdz
IHRvIGF2b2lkIHRoZSAiaWYgZXhpc3RzDQp0aGVuIGZpbmQiIHBhdHRlcm4sIGJ1dCBxdWlja2x5
IGdvdCBpbnRvIGEgbWVzcywgdGhlbiByZWFsaXNlZCB0aGF0IHRoaXMNCmlzIChhbG1vc3QpIGEg
ZGVhZCBsb2dpYyBwYXRoLi4uIEkndmUgZ290IG5vIGlkZWEgd2h5IHRoaXMgaXMgc3VwcG9ydGVk
Ow0KbG9va2luZyB0aHJvdWdoIGhpc3RvcnksIEkgY2FuJ3QgZmluZCBhIGNhc2Ugd2hlcmUgYSBy
ZWR1bmRhbnQNClhTX0lOVFJPRFVDRSB3YXMgZXZlciB1c2VkLCBidXQgaXRzIGEgY29tbW9uIGJl
aGF2aW91ciBiZXR3ZWVuIEMgYW5kIE8NCnNvIHRoZXJlIHdhcyBjbGVhcmx5IHNvbWUgcmVhc29u
Li4uDQoNCn5BbmRyZXcNCg==

