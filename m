Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C2624DC7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 23:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442243.696304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGKL-0002go-Np; Thu, 10 Nov 2022 22:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442243.696304; Thu, 10 Nov 2022 22:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otGKL-0002eJ-Kw; Thu, 10 Nov 2022 22:47:17 +0000
Received: by outflank-mailman (input) for mailman id 442243;
 Thu, 10 Nov 2022 22:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7NKw=3K=citrix.com=prvs=3060ac5da=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1otGKJ-0002eD-SR
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 22:47:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cdf32bf-6149-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 23:47:13 +0100 (CET)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Nov 2022 17:47:09 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6726.namprd03.prod.outlook.com (2603:10b6:303:17d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Thu, 10 Nov
 2022 22:47:07 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 22:47:07 +0000
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
X-Inumbo-ID: 9cdf32bf-6149-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668120433;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HygNMoa1zA5IOSkG7shyTOV+OSbjkPOmrang5ai7tI0=;
  b=cMm5NAskj17LkHW751mUPIw3XC7kR5Q47nWufAeaIyaRR6vL+6O7/ghD
   knFxDb5H23m3JnqYgpK8unP5QCUzSTvrKI9WobmoIFX6dwt6AyV7iwX9r
   e9VpPDpX5G29ZUr93vQiBOXSOA5Hl57p0tIJY7tFVIfNlPovVI1xACYCp
   I=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 84626398
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ss8X8a0rmfWhsHA6XfbD5SBwkn2cJEfYwER7XKvMYLTBsI5bpzdRz
 WVJCm6GOK2NYWfyc41/PIW38xgFsZTWm9RgGwA/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVnPagX1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGyJx7
 +AeGRQ3ciuHrb6y6b/nEsB2v5F2RCXrFNt3VnBI6xj8VaxjbbWYBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6PnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzX+lAtxJRe3QGvhCuHfO5EdMNzEtUUqhqvielmuAAfVON
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQPwrstUnAwMj0
 FChlsnsQzdotdW9UXuA8p+EoDX0PjIaRUcdYQcUQA1D5MPsyKkxhB/SStdoEIauk8b4Xzr3x
 liirjU4wbMajscJ1qCy1VHBnz+o4JPOS2Yd5QjJX2Tj8gJwYqakYZCl7R7Q6vMoEWqCZlyIv
 XxBl83F6ukLVcuJjHbVHLRLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfYfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:MTIDCK/cCID+mZwXOa5uk+GBdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmREXeR
 730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCKlaDPY0LDErXQBeot8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWKwUs4ikWUzxjIiLH47JlOy1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duf22vaIJy4EUbICbQRGrWRQpj9aqpekZD4nSR+
 uzUagmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.96,155,1665460800"; 
   d="scan'208";a="84626398"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCJnHGirYi14b37lekF70Tn19E+qHhRLibEHaKV12xzkRKZaHGaXUT4RlxjmiB5QtGt9UWKDW3Me0m24NKbLi2Qz1Rt+D5TgI43vzZ2KLU9s3c6w3GSBhCiy6g9uHHu0CP49CcVUaZVCwhBux+pboGwBBvL3JZ0PFKWPKiao0DubWYZeR6ikGGb0rCbuuApHiBMqrdOg2vHOASaY7I4Kx6CAt8rWw33GqzyEOyrZXduuz4UKOgrz5I5M8vJJE/rCQOfQxc+e5uC6F4qiLuNlAt3rrYZ+J8xChwveUa3YHb4C6SLlYxzOYl6dONzCBeL92dOq5BKYtKmslVd5kZ2BhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HygNMoa1zA5IOSkG7shyTOV+OSbjkPOmrang5ai7tI0=;
 b=RHg2LYmxVL/4ijOPAxhENOG7h72Cyl4sfXIZxGdGb7ZTlDB77o3c7s7CS+C1DtRN0/ocys1hvbGAB1xHyWd2t/1njNummBiO6b7rRK6XPsy3cYIhzc6m+VJH8wIOjpeSjPt6QI/X+1BsSCMFOHMuIkqRNKyHjQYGnkoLXTb28oiZeMneYxULVC3oZ+We1u9KNjts8g3wfbELZNgyR9Nafw+SuTFmRtkAszwj/fi7BPwHNlF/3w7/6CP0pFjkMYkO9be0csrHxSeHFInSBRfeKdN5YTVBL8W1Dek9oq60RHTB7OoGm6QSABRHEZUL5rvgu30gc1WfkfPRQkqPXyr/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HygNMoa1zA5IOSkG7shyTOV+OSbjkPOmrang5ai7tI0=;
 b=i1tJkCPEC4ifUwngNuHxLCLYKqgQaHtCBM/xTUb2/yaQDHlCte48Pnvj6vaYyN1oZ+fEfPgMOvAwtri7b25mG7V5KlUI3JffG/iyoFuaqxVn670EzwR2rsHoLKafs9LFvuhj2nQvXBNNs+k7pmeVH99FzJsLy7gx/e7LjXZtOLA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Henry.Wang@arm.com" <Henry.Wang@arm.com>, Paul Durrant <paul@xen.org>,
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the APIC
 assist options
Thread-Topic: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Thread-Index: AQHY8GkXjZEVf2M/t0iebvsck9V8qq44y+aA
Date: Thu, 10 Nov 2022 22:47:07 +0000
Message-ID: <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
References: <20221104161815.38007-1-roger.pau@citrix.com>
In-Reply-To: <20221104161815.38007-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|CO3PR03MB6726:EE_
x-ms-office365-filtering-correlation-id: 0eafad21-df8a-44f8-c8b5-08dac36d7f1b
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SlNfYzIqSmb7+FDTirksYMxVxu/NIWp2+lhaPAN1/vwkGKD+A3/ZT6lCOz8bU/hrxgrVaONgz9bWpyuwc9NTypeaWOFQByYmOk+C7tuE/mi0EV7+44X3c2wv3hPxNNVMgT3rIkX1D7b3W3hrHlHj4EwNjbmv9lZkqhMripWTqN8tA9bmfdVfU+66uAYqItKbqZAcZ8GNzp/0wgpcN5gDG+RiSrwvjUZHIE5u/advuR8IE4uw8b3KUzzHLteILQvdQ1NIwSSj+az2sKRP0ELQlzbdxD6gYlsaTxWFV7NN/W8wriC5I/t6VyV7a5S60Us/FF123CkkK/1X1Pxnq4Me5kyltiaL9veHyl6mIwHiHFc/ttAp6YBmZZ53waR7hvcCNt9xTX/iIqRbd9kAaOPhcnCELoEs0z6VD9EPK3MMFRsMsuaDMsrKwk+iCQVW+U0p52hrbMnANZ//krWzrkAWlD62IqRNozBLnL/UnVxjob+InaB5O/7lnriV7O2fm4LLvDK/yrY2xmVyuMByNOIW1hTzxngrL48yel3CLOu8X0t7+gVLwsR/okGXT+HWE9HeLBaeqqTAQ8j6TsV1LNLYmUhK0xEr84gPm1WghhYzbeD2m4yBW2klB6JUzvDW/Q14UKZ+Rv7pN2y9YNXGoHudWEI7kIT37hiYoFI1f2APMT7BtGflIcj6q5eX1Zb9pipcMuonh8wCMxhn6eP55veNPrAFAq1WMNTrge9OlgZyrtVtyyRMBd+rdp/3KZjcq+dY1nOgSl1oWq1+weUsynAefo+CllsSqwzP/x9hJ2vJGnyj0PT378xlIFoxWYG7PQrwPv7zYxiEshSqCvPzFpzixQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199015)(54906003)(8936002)(110136005)(31696002)(5660300002)(2616005)(91956017)(86362001)(66476007)(4326008)(36756003)(66946007)(8676002)(26005)(66446008)(66556008)(6512007)(64756008)(76116006)(6486002)(316002)(83380400001)(41300700001)(53546011)(478600001)(82960400001)(122000001)(71200400001)(31686004)(38100700002)(2906002)(6506007)(186003)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bW4vT21ITTNGWDNGKy8xRXY5OU44VWRiTG4wWVJ0MGxZNHFkMGtHRVJVNTMr?=
 =?utf-8?B?UUZqaDFPaE8yZi9ubCtyK3RMZXhWVDVGYlhsOWZQVE9UemhsanlsYnJZYmg2?=
 =?utf-8?B?T2NnbDFzYmxGRStlQ2U3SXdzOXUzMFlpMVdkR0xCY1d5clU2L2V1NlRVM0la?=
 =?utf-8?B?WTVKbGthMTB6Z0N1ZEhnL21IV3VHc2tQYXhJVnQvRTdiOEtmOGcvUkJOemEr?=
 =?utf-8?B?RWlUREtPcDFMTGN6ZFkyRUx6ZVRJeTJ6Uy95cy9scHl6VFdBUGozbFByaTdS?=
 =?utf-8?B?eUthYW1SMTN4VGhJcUYzZDdYLzY1ZTJPZG0ySzZQWlpDTTl6ckR1Q1QrOHI2?=
 =?utf-8?B?dDNLdVBnYjQrVGpkOUg3eko3U01nNUFaYTAxQzJ3L3VtYTI5eDZ5MDhmSjUw?=
 =?utf-8?B?cHBRdkUyRDQvTzNLNDVGRGE4MFk3bHdQSHZBMGcrMGVETDZYcUdIdHRxVzRB?=
 =?utf-8?B?MlpDVmVTSStPY1FscXQxWFRPYVp4dHZDZXlzamFKdlNVZjNhbkIxM3EvQzVz?=
 =?utf-8?B?QUtEUTlQWUtobU1wc2RqQkhtUGpycStHRkhhWDBDcXRFWWxiYzM5UHZiQ2dC?=
 =?utf-8?B?c2tONDQ3U0F6d0czU2dSUi9wSklDRW92TkJDaXdvdlQwUXZ1Q2pZei9DNEcz?=
 =?utf-8?B?a1NFSWhWR0I2SjRRSitBT0pIL3RHRkExdFV6UzltUy9oL3ZvV01rM2Y1OTlD?=
 =?utf-8?B?TnNUbWJ3MWZDSGV6ZG1rLzRPTFZoekcrZkNyTWgrRTlSb2g5V3h0MXNRd2gw?=
 =?utf-8?B?SDMvdVg2NVdqSVhkYkpGclRKRVJPNjFDaXoyUGV0NTRkNnd1ZDF0bEl5SW9y?=
 =?utf-8?B?OUJuOWYzNXA3SVdJWEI0N3o0aEovV1gxR3pDREZyOE5SSlFiN0huWjM1ZnpD?=
 =?utf-8?B?QVdiRVhsZWZJVWg2anhraWRiVXdnRHRYWmxzbExWWWl2S2l5dXNVSWZiMXVa?=
 =?utf-8?B?OGk4dHBTazFQWG9SWW9RSjdsV3cwOHlvVmVUL0RpSXUraEdWaVBOUVJ4dW9U?=
 =?utf-8?B?d0M3b3ZrUWZpeEZWaWwzTC9QV0lxYk52YWlZOGY0UUF2Qm5zWGlGYWpCRXpJ?=
 =?utf-8?B?aE55bHZQb1Y3WTNYYWFneHJVSytxY3EyS0tTc1VaNnBPd1pEbkNTNVFVMEQ4?=
 =?utf-8?B?cmVJTFZLM1pPNmh2eHMxTWd5UllHQm0vWkxiby9PbitrYXUyOUpESlFLeFRY?=
 =?utf-8?B?eWdqMkV1Zk80ZjZJWWxPUHVqMVp1VXVPcVNYSWQvc1B0S09OTlBjbStKbkNP?=
 =?utf-8?B?c0k5dkM1NjVsZTdUdi9QSnlhTzd1Y2FFb0ZBSzI2M1pBMlRHbHZyUEpPK0Jl?=
 =?utf-8?B?ak92TUI2T1EreWxUcmJ3NFlmQlE0d1ozdnY5anBNRkFLNGpWSGtQTFFuWUNt?=
 =?utf-8?B?MUVFTXpYVTZWWXczdjVBZmQvRmNnUXBSVE5iMWpqSno0ZHk3M1BFVHdZUzIr?=
 =?utf-8?B?KzJ2cVVpbGIyVm5wWFRIVE5Pbk5CNnZmbU9KMCtFUGs0TVYycko2S0Z2WUZN?=
 =?utf-8?B?TnRKRndDaVBQbVdPaC93Rm05UDZLVTRqdkxjcHRUam1OKzlTYWw5bnRFVGVx?=
 =?utf-8?B?QkhjOThqbmV4S1B5U0tBSWQxeU9qV2ZUeWdOSEZpcEJjWnJONXgwT2p4ckZ6?=
 =?utf-8?B?SGxOb01neDQ4VitDWlJaSkw4Nm4xWEFxNXhCZ1hyQ3AvVXU1aG5uSHV2dmpy?=
 =?utf-8?B?Q25vWkxhREgzSnM3NEwzejZ0TWcrNVRqejN6QlVpMEdqRVJmMjZGb1o3WjFM?=
 =?utf-8?B?L1Bmd1V0RFhsQkhtSWRSTEd3MWVuUDlmazd6UDE2c0N3V1FveFkxd3greXFT?=
 =?utf-8?B?dU9oV2ZRblR0a00yb0Z1NHZtTFN4LzJQMHlYK25xNXBCcG5UUG5valJLZ21j?=
 =?utf-8?B?TzRLaUVJZUhiRld3bnZJakdITUZDVG1NWmpySlY3Y3B5MnBJTDc5QitmaENs?=
 =?utf-8?B?MGlVQzY2aWt0ZWUxV3B1NTV6eElibStoZitpQktqb1lCU2NXZEkzcitlN2Vm?=
 =?utf-8?B?VWIwN05RQWcvaFZXdzVkdnZySytmZE1DQmlZMCtTRk1VUXp0ZWRFVDR5Qkl1?=
 =?utf-8?B?ZmVqcVNERUdEOHB2Y2xKa2wxRmhXM1hqVmNHM2NhVjBCR2lBV3ZLSjVLYmd4?=
 =?utf-8?Q?DH1Z1YAeu/vV8vweivAvK4Txf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <399A8C83E6496C4F8946E0917301CEFD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eafad21-df8a-44f8-c8b5-08dac36d7f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2022 22:47:07.7569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JAZdSS0KAUVQIxnoiD5q25BsTtGBhmIlCjALI/C6a8G3HQzCkoHVwozU9STzUYxxt28lQynpz2F6ACjjZB3aRK6NmhdtnBVrQhYeDRl0Kqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6726

T24gMDQvMTEvMjAyMiAxNjoxOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBUaGUgY3VycmVu
dCByZXBvcnRpbmcgb2YgdGhlIGhhcmR3YXJlIGFzc2lzdGVkIEFQSUMgb3B0aW9ucyBpcyBkb25l
IGJ5DQo+IGNoZWNraW5nICJ2aXJ0dWFsaXplIEFQSUMgYWNjZXNzZXMiIHdoaWNoIGlzIG5vdCB2
ZXJ5IGhlbHBmdWwsIGFzIHRoYXQNCj4gZmVhdHVyZSBkb2Vzbid0IGF2b2lkIGEgdm1leGl0LCBp
bnN0ZWFkIGl0IGRvZXMgcHJvdmlkZSBzb21lIGhlbHAgaW4NCj4gb3JkZXIgdG8gZGV0ZWN0IEFQ
SUMgTU1JTyBhY2Nlc3NlcyBpbiB2bWV4aXQgcHJvY2Vzc2luZy4NCj4NCj4gUmVwdXJwb3NlIHRo
ZSBjdXJyZW50IHJlcG9ydGluZyBvZiB4QVBJQyBhc3Npc3RhbmNlIHRvIGluc3RlYWQgcmVwb3J0
DQo+IHN1Y2ggZmVhdHVyZSBhcyBwcmVzZW50IHdoZW4gdGhlcmUncyBzdXBwb3J0IGZvciAiVFBS
IHNoYWRvdyIgYW5kDQo+ICJBUElDIHJlZ2lzdGVyIHZpcnR1YWxpemF0aW9uIiBiZWNhdXNlIGlu
IHRoYXQgY2FzZSBzb21lIHhBUElDIE1NSU8NCj4gcmVnaXN0ZXIgYWNjZXNzZXMgYXJlIGhhbmRs
ZWQgZGlyZWN0bHkgYnkgdGhlIGhhcmR3YXJlLCB3aXRob3V0DQo+IHJlcXVpcmluZyBhIHZtZXhp
dC4NCj4NCj4gRm9yIHN5bWV0cnkgYWxzbyBjaGFuZ2UgYXNzaXN0ZWQgeDJBUElDIHJlcG9ydGlu
ZyB0byByZXF1aXJlDQo+ICJ2aXJ0dWFsaXplIHgyQVBJQyBtb2RlIiBhbmQgIkFQSUMgcmVnaXN0
ZXIgdmlydHVhbGl6YXRpb24iLCBkcm9wcGluZw0KPiB0aGUgb3B0aW9uIHRvIGFsc28gYmUgcmVw
b3J0ZWQgd2hlbiAidmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkiIGlzDQo+IGF2YWlsYWJsZS4g
IFByZXNlbmNlIG9mIHRoZSAidmlydHVhbCBpbnRlcnJ1cHQgZGVsaXZlcnkiIGZlYXR1cmUgd2ls
bA0KPiBiZSByZXBvcnRlZCB1c2luZyBhIGRpZmZlcmVudCBvcHRpb24uDQo+DQo+IEZpeGVzOiAy
Y2UxMWNlMjQ5ICgneDg2L0hWTTogYWxsb3cgcGVyLWRvbWFpbiB1c2FnZSBvZiBoYXJkd2FyZSB2
aXJ0dWFsaXplZCBBUElDJykNCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBJIGZpbmQgdGhlIGxvZ2ljIGluIHZteF92bGFw
aWNfbXNyX2NoYW5nZWQoKSBoYXJkIHRvIGZvbGxvdywgYnV0IEkNCj4gZG9uJ3Qgd2FudCB0byBy
ZXdyaXRlIHRoZSBmdW5jdGlvbiBsb2dpYyBhdCB0aGlzIHBvaW50Lg0KPiAtLS0NCj4gQ2hhbmdl
cyBzaW5jZSB2MToNCj4gIC0gRml4IFZpcmlkaWFuIE1TUiB0aXAgY29uZGl0aW9ucy4NCj4gLS0t
DQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMgfCAgMiArLQ0KPiAgeGVu
L2FyY2gveDg2L2h2bS92bXgvdm1jcy5jICAgICAgICAgIHwgIDggKysrKy0tLS0NCj4gIHhlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni90cmFwcy5jICAgICAgICAgICAgICAgICB8ICA0ICstLS0N
Cj4gIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQo+
DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMgYi94
ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3ZpcmlkaWFuLmMNCj4gaW5kZXggMjVkY2E5M2U4Yi4u
NDRlYjNkMDUxOSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi92aXJp
ZGlhbi5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdmlyaWRpYW4uYw0KPiBA
QCAtMTk3LDcgKzE5Nyw3IEBAIHZvaWQgY3B1aWRfdmlyaWRpYW5fbGVhdmVzKGNvbnN0IHN0cnVj
dCB2Y3B1ICp2LCB1aW50MzJfdCBsZWFmLA0KPiAgICAgICAgICByZXMtPmEgPSBDUFVJRDRBX1JF
TEFYX1RJTUVSX0lOVDsNCj4gICAgICAgICAgaWYgKCB2aXJpZGlhbl9mZWF0dXJlX21hc2soZCkg
JiBIVk1QVl9oY2FsbF9yZW1vdGVfdGxiX2ZsdXNoICkNCj4gICAgICAgICAgICAgIHJlcy0+YSB8
PSBDUFVJRDRBX0hDQUxMX1JFTU9URV9UTEJfRkxVU0g7DQo+IC0gICAgICAgIGlmICggIWNwdV9o
YXNfdm14X2FwaWNfcmVnX3ZpcnQgKQ0KPiArICAgICAgICBpZiAoICFoYXNfYXNzaXN0ZWRfeGFw
aWMoZCkgKQ0KPiAgICAgICAgICAgICAgcmVzLT5hIHw9IENQVUlENEFfTVNSX0JBU0VEX0FQSUM7
DQoNClRoaXMgY2hlY2sgaXMgYnJva2VuIGJlZm9yZSBhbmQgYWZ0ZXIuwqAgSXQgbmVlZHMgdG8g
YmUga2V5ZWQgb24NCnZpcnR1YWxpc2VkIGludGVycnVwdCBkZWxpdmVyeSwgbm90IHJlZ2lzdGVy
IGFjY2VsZXJhdGlvbi4NCg0KQnV0IGRvaW5nIHRoaXMgY29ycmVjdGx5IG5lZWRzIGEgcGVyLWRv
bWFpbiB2aW50ciBzZXR0aW5nLCB3aGljaCB3ZQ0KZG9uJ3QgaGF2ZSB5ZXQuDQoNCkl0IGlzIG1h
cmdpbmFsbHkgbGVzcyBicm9rZW4gd2l0aCB0aGlzIGNoYW5nZSwgdGhhbiB3aXRob3V0LCBidXQg
dGhhdCdzDQpub3Qgc2F5aW5nIG11Y2guDQoNCj4gICAgICAgICAgaWYgKCB2aXJpZGlhbl9mZWF0
dXJlX21hc2soZCkgJiBIVk1QVl9oY2FsbF9pcGkgKQ0KPiAgICAgICAgICAgICAgcmVzLT5hIHw9
IENQVUlENEFfU1lOVEhFVElDX0NMVVNURVJfSVBJOw0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92bXgvdm1jcy5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5jDQo+IGluZGV4
IGExYWNhMWVjMDQuLjdiYjk2ZTFhOGUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3ZtY3MuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMNCj4gQEAgLTEx
MzYsNyArMTEzNiw3IEBAIHN0YXRpYyBpbnQgY29uc3RydWN0X3ZtY3Moc3RydWN0IHZjcHUgKnYp
DQo+ICANCj4gICAgICBpZiAoICFoYXNfYXNzaXN0ZWRfeGFwaWMoZCkgKQ0KPiAgICAgICAgICB2
LT5hcmNoLmh2bS52bXguc2Vjb25kYXJ5X2V4ZWNfY29udHJvbCAmPQ0KPiAtICAgICAgICAgICAg
flNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfQVBJQ19BQ0NFU1NFUzsNCj4gKyAgICAgICAgICAg
IH5TRUNPTkRBUllfRVhFQ19BUElDX1JFR0lTVEVSX1ZJUlQ7DQo+ICANCj4gICAgICBpZiAoIGNw
dV9oYXNfdm14X3NlY29uZGFyeV9leGVjX2NvbnRyb2wgKQ0KPiAgICAgICAgICBfX3Ztd3JpdGUo
U0VDT05EQVJZX1ZNX0VYRUNfQ09OVFJPTCwNCj4gQEAgLTIxNTYsMTAgKzIxNTYsMTAgQEAgaW50
IF9faW5pdCB2bXhfdm1jc19pbml0KHZvaWQpDQo+ICAgICAgaWYgKCAhcmV0ICkNCj4gICAgICB7
DQo+ICAgICAgICAgIC8qIENoZWNrIHdoZXRoZXIgaGFyZHdhcmUgc3VwcG9ydHMgYWNjZWxlcmF0
ZWQgeGFwaWMgYW5kIHgyYXBpYy4gKi8NCj4gLSAgICAgICAgYXNzaXN0ZWRfeGFwaWNfYXZhaWxh
YmxlID0gY3B1X2hhc192bXhfdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzOw0KPiArICAgICAgICBh
c3Npc3RlZF94YXBpY19hdmFpbGFibGUgPSBjcHVfaGFzX3ZteF90cHJfc2hhZG93ICYmDQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X2FwaWNfcmVnX3Zp
cnQ7DQo+ICAgICAgICAgIGFzc2lzdGVkX3gyYXBpY19hdmFpbGFibGUgPSBjcHVfaGFzX3ZteF92
aXJ0dWFsaXplX3gyYXBpY19tb2RlICYmDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAoY3B1X2hhc192bXhfYXBpY19yZWdfdmlydCB8fA0KPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSk7
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfaGFzX3ZteF9hcGlj
X3JlZ192aXJ0Ow0KDQphcGljIHJlZyB2aXJ0IGFscmVhZHkgZGVwZW5kcyBvbiB0cHIgc2hhZG93
LCBzbyB0aGF0IHBhcnQgb2YgdGhlDQpjb25kaXRpb24gaXMgcmVkdW5kYW50Lg0KDQp2aXJ0dWFs
aXNlIHgyYXBpYyBtb2RlIGFuZCBhcGljIHJlZyB2aXJ0IGFyZW4ndCBkZXBlbmRlbnQsIGJ1dCB0
aGV5IGRvDQpvbmx5IGV2ZXIgYXBwZWFyIHRvZ2V0aGVyIGluIGhhcmR3YXJlLg0KDQpLZWVwaW5n
IHRoZSBjb25kaXRpb25hbHMgbWlnaHQgYmUgb2sgdG8gY29tYmF0IGEgYmFkIG91dGVyIGh5cGVy
dmlzb3IsDQpidXQgLi4uDQoNCj4gICAgICAgICAgcmVnaXN0ZXJfa2V5aGFuZGxlcigndicsIHZt
Y3NfZHVtcCwgImR1bXAgVlQteCBWTUNTcyIsIDEpOw0KPiAgICAgIH0NCj4gIA0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92
bXguYw0KPiBpbmRleCBlNjI0YjQxNWM5Li5iZjBmZTMzNTVjIDEwMDY0NA0KPiAtLS0gYS94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Yw0KPiBAQCAtMzQwNSwyNSArMzQwNSwyOSBAQCBzdGF0aWMgdm9pZCB2bXhfaW5zdGFsbF92bGFw
aWNfbWFwcGluZyhzdHJ1Y3QgdmNwdSAqdikNCj4gIA0KPiAgdm9pZCB2bXhfdmxhcGljX21zcl9j
aGFuZ2VkKHN0cnVjdCB2Y3B1ICp2KQ0KPiAgew0KPiArICAgIGJvb2wgdmlydHVhbGl6ZV94MmFw
aWNfbW9kZSA9IGhhc19hc3Npc3RlZF94MmFwaWModi0+ZG9tYWluKSB8fA0KPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChjcHVfaGFzX3ZteF92aXJ0dWFsaXplX3gyYXBpY19t
b2RlICYmDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9oYXNfdm14
X3ZpcnR1YWxfaW50cl9kZWxpdmVyeSk7DQoNCi4uLiB0aGlzIGlzIHN0aWxsIHdyb25nLCBhbmQg
Li4uDQoNCj4gICAgICBzdHJ1Y3QgdmxhcGljICp2bGFwaWMgPSB2Y3B1X3ZsYXBpYyh2KTsNCj4g
ICAgICB1bnNpZ25lZCBpbnQgbXNyOw0KPiAgDQo+IC0gICAgaWYgKCAhaGFzX2Fzc2lzdGVkX3hh
cGljKHYtPmRvbWFpbikgJiYNCj4gLSAgICAgICAgICFoYXNfYXNzaXN0ZWRfeDJhcGljKHYtPmRv
bWFpbikgKQ0KPiArICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnR1YWxpemVfYXBpY19hY2Nlc3Nl
cyAmJg0KPiArICAgICAgICAgIXZpcnR1YWxpemVfeDJhcGljX21vZGUgKQ0KPiAgICAgICAgICBy
ZXR1cm47DQoNCi4uLiB0aGlzIHN1cmVseSBjYW5ub3QgYmUgcmlnaHQuDQoNCldoaWxlIGF0dGVt
cHRpbmcgdG8gZmlndXJlIF4gb3V0LCBJJ3ZlIGZvdW5kIHlldCBhbm90aGVyIHJlZ3Jlc3Npb24g
dnMNCjQuMTYuwqAgQmVjYXVzZSB2aXJ0IGludHIgZGVsaXZlcnkgaXMgc2V0IGluIHRoZSBleGVj
dXRpb24gY29udHJvbHMNCnN5c3RlbS13aWRlIGFuZCBub3QgY29udHJvbGxlZCBwZXIgZG9tYWlu
LCB3ZSdsbCB0YWtlIGEgdm1lbnRyeSBmYWlsdXJlDQpvbiBTS1gvQ0xYL0lDWCB3aGVuIHRyeWlu
ZyB0byBidWlsZCBhbiBIVk0gZG9tYWluIHdpdGhvdXQgeEFQSUMNCmFjY2VsZXJhdGlvbi4NCg0K
DQpUaGlzLCBjb21iaW5lZCB3aXRoIHRoZSBBQkkgZXJyb3JzICgvbWlzZmVhdHVyZXMpIHRoYXQg
d2UgcmVhbGx5IGRvbid0DQp3YW50IHRvIGVzY2FwZSBpbnRvIHRoZSB3b3JsZCBidXQgSSBoYXZl
bid0IGZpbmlzaGVkIGZpeGluZyB5ZXQsIG1lYW5zDQp0aGF0IHRoZSBvbmx5IGFwcHJvcHJpYXRl
IGNvdXJzZSBvZiBhY3Rpb24gaXMgdG8gcmV2ZXJ0Lg0KDQpJJ2QgcmVhbGx5IGhvcGVkIHRvIGF2
b2lkIGEgZnVsbCByZXZlcnQsIGJ1dCB3ZSd2ZSBydW4gb3V0IG9mIHRpbWUuDQoNCn5BbmRyZXcN
Cg==

