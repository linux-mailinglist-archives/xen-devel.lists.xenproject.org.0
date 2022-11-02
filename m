Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF60616947
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 17:38:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.436004.690011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqGjq-0007cq-By; Wed, 02 Nov 2022 16:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 436004.690011; Wed, 02 Nov 2022 16:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqGjq-0007a3-86; Wed, 02 Nov 2022 16:37:14 +0000
Received: by outflank-mailman (input) for mailman id 436004;
 Wed, 02 Nov 2022 16:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+cO=3C=citrix.com=prvs=2981f1107=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oqGjp-0007Zx-83
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 16:37:13 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 978a2557-5acc-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 17:37:09 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Nov 2022 12:37:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6204.namprd03.prod.outlook.com (2603:10b6:408:101::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 16:37:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 16:37:04 +0000
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
X-Inumbo-ID: 978a2557-5acc-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667407030;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HHxh1qINTtfLJ6s66FFQtwwgBK4yFteoIgOu0z7vcyE=;
  b=emWsXVjX0SS6p2efTvmBqDHw260cHMvlkCNbN1h8Qjy730kNNfrxxKDJ
   Zolm1eGGP+VQiJHTqFOe2imDeFLMV71tJkycFByWdbN/buXIz+S6Ykvie
   tpJeTP1QIIo+sTe9UBb30hdzUNp9m4tK/B4R5kKyTFAt9cSvliCLXJ8HA
   4=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 84046484
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:jjP2YqnGfz/0IeZFxYX0yrjo5gxnJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXmrUOqrcY2LxLtoiPIS19EgOvZbVm9c2TQtrr3o1HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7amaVA8w5ARkP6kS5AWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dg5cD4tay6qvLno27Pmd9FPvd5/PvC+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapCSOXkqKI63DV/wEQ5DUQNZXnkgMKnsUSfRex7N
 mIsxwwX+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy65C24eX3h+YdopnMYsQHoh0
 Vrht9H0AT1itpWFRHTb8a2bxRupIjQcJ2IGYS4CTCMG7sPlrYV1iQjAJv58FIalg9uzHiv/q
 xiaoS57i7gNgMoj06Sg4UuBkz+qvoLOTAM++kPQRG3N0+9iTIusZojt7EeB6/9Fdd6dVgPY5
 CRCnNWC5ucTC53LjDaKXOgGALCu4bCCLSHYhllsWZIm8lxB5kKeQGyZ2xkmTG8BDyrOUWKBj
 JP70e+J2KJuAQ==
IronPort-HdrOrdr: A9a23:POiftqtC1kNgFaTCo0H40Scm7skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIYO5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.95,234,1661832000"; 
   d="scan'208";a="84046484"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy5/GEh85eybDI9QnNYNUmlIePhJ3QwLbc5J3VVrej29o3QEsjQMwMMZure1BRRQCgYoX2oAMYZpv3f/BurOXMW560Sn9BHzVLa2/LrECYaY39EOxZHEiKVZAHQXUCWUpzzI84wxpGtcp9/uwb6dqH4lEJFInnNevOtfjdGs5FzXFXD9gNVE2MzDdjKSKdadR0CCsGM8yLftfv9Nt0KwRiww8Iah7k++Xagsg3q6CjO+oNr7YhqwKX3C2Ieke+/riqEd9RfzwtciadMa6jbCIqOTh6qDar6ZissMp8g+1qxW2uEckNWejJY4CRaS2Lb7Mf4K1tbit584R3LP4sJHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHxh1qINTtfLJ6s66FFQtwwgBK4yFteoIgOu0z7vcyE=;
 b=HyDfASdQtVkt7lHx/XA6yZmQ/BBSkyiVpE5W/Wm3M4423aymE3/6JwunYW35LMuuFPnJoAPEqeZzDhS7bZmQtkFoFlvi1wNb7ZrTjc1egQigCGQcsQbQtV7oILiDCjfisyTvolvt4qQxOLhEqDMn2M5c4GoYRa7dcTgZAEBTpdOHdqsVn5LDkgOwiAfa1mV8E9g6LzVhVsUPR+lJmjjmD9jetEZD3Agc8EstfYT0E8qUTupDZ9IPSRNa+Mo57T1hvPkR/yVXJhsSSQQ0CEZ54i8fkrFI1c9dv+Ux6279L4792UqmtViOdnww+3nVp7lt4djOkJm/LKlKr1OSWYZ8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHxh1qINTtfLJ6s66FFQtwwgBK4yFteoIgOu0z7vcyE=;
 b=oJ1VjrwO9CpMu2pLQwIzBwCjjp51Pk73lVcNY9CbxMhdjlWZVuY2KzpyD5sad3VcjytaP1FwlWhBrUdGe60p/lVRKISsuE4zGfZQXw/V7GWOaTlhUcLOlmXViKNlReL9+e1ORLDrcmjMn/9PWKH8vdEc/aZKc6QevaSE2YP0pG8=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Anthony Perard
	<anthony.perard@citrix.com>
CC: Henry Wang <Henry.Wang@arm.com>, George Dunlap <George.Dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH for-4.17 1/4] xen: Add licence information to
 public/errno.h
Thread-Topic: [XEN PATCH for-4.17 1/4] xen: Add licence information to
 public/errno.h
Thread-Index: AQHY7q5SGNNHOrsJDECKUEgTCIsdLq4rmCmAgAA9KAA=
Date: Wed, 2 Nov 2022 16:37:04 +0000
Message-ID: <21012e3b-a30a-57e5-04c2-b49ef45daaa6@citrix.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-2-anthony.perard@citrix.com>
 <bd732008-d3f3-0f84-651d-f6bf64d9f33a@suse.com>
In-Reply-To: <bd732008-d3f3-0f84-651d-f6bf64d9f33a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BN9PR03MB6204:EE_
x-ms-office365-filtering-correlation-id: bc66d309-cc8f-4638-bbb3-08dabcf079b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 bjU4W8nAnLQKVclva2TjdfG7XKNLf9/vomCUhL9ZDs6i7x5aQMdKmCOO/DivhfOLXxnVwLS7Jvi3dlL5FhNbKLrDVU5MMzq5vjE8uchsbAdchF/oRskdv70H2Lq+ktJvOS0FIEYWQ15aQ1uRhc6hxyQwc+4VUD1+NnXVqubOhgVXbRyWo1mhvU5GIRiNTbxAaQHaYOEyweDgpPGZVsTZ4zyTL0XadeSxVF4E1GmLdcNxBb8dgxMIjOGWLuZ6qOgtIXCe3omnqBriYblkA18g6ZByq3Le/5WzcR7OUA5G2zvf6w39f/Ma2WnZ/9rRUAnBkP0dwvtwGrYAfQEa5JNJ7qWC+aR5uxNWzvwnPryUFFg2FKwAeAjwBAuhOTlQ3SBm52iUhVV8kQgv5h/6Cty6WYTupyDpCEwmtp5EmkP1QsMZk+UNC5L75V27Gsjj2jLh6BQ6hVW6caMLQLcNxbtF9teKm78cPAXzdFn7s4utCQArzEC+zcaIz39CaMgyPjmUH8rCR9FkOnFrb6+J42UGLH+aszPNYWB3Dts3MftpsRXCsWI/8+9oC7/qqMLbnvFSLd6lzYuw215lLivxaI/SwaaS50gn51/isQmsNAm0jHJZo1efuvaFhijpFnNY5A4+l+RN5U0CLm/kA1JvoKPb2uJS1FzVMaPjWyP2LbQ7ciJsd2HyDByCxyeX9/ftphzJkG1IKfbK4K0Hj/KGcg6eyPrcPJSkLu7lR0aFXUEXwKH9IxVqqWCTGD56gongFzqFeCHLcId6iih8sUJRO84onL5/09f/8cMiGL7UvhcG9sZP/u2NH7QZdWPTlbKAT4y6uiPinigbWKzd9jJDE6M22w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(31686004)(2906002)(31696002)(6506007)(6486002)(4744005)(38070700005)(82960400001)(38100700002)(478600001)(71200400001)(36756003)(122000001)(26005)(186003)(6512007)(53546011)(91956017)(2616005)(4326008)(316002)(66476007)(66556008)(66446008)(64756008)(8676002)(86362001)(66946007)(110136005)(54906003)(76116006)(8936002)(6636002)(41300700001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1VaR0d1UGRwWTdKMDlRTlVtS2tpcG5oR1VxQ0l3R1IvY2NnZEdIeWYweVRB?=
 =?utf-8?B?M2s2ZHpyZXlPUVozdUNnYlp3YVZ3RXl4R1NLOXR0NzI1N3lHelR0N0EvSjl4?=
 =?utf-8?B?NUloRkxTR3NFdzRidUFzR2ZTemRZR2RtY09nN0t2VkplZmdTc1JmaHVzOVhO?=
 =?utf-8?B?WEhqSHpGZkV6Q1hoNHZ3K2NrdE1SUEdzTWxoTlNYSDd1SGFMcGVUMlI0T0hD?=
 =?utf-8?B?ak9JOUlrVWxSWWRMNzRwaTNUYnJMdFN1bHU1QkZQVVFIbkFYMDF0bmpiRWNl?=
 =?utf-8?B?Ym1NMXU4c1FBZGNUS3lhT1p1Um54ZWVmeC9PNGdqNWpHY0lCWDdrWFlmQ1lv?=
 =?utf-8?B?V1N3bll4dWJiTWVOdHdWTjVKTnNxalUyYWJmMXFIemJ0c3ZpK1VkYnBjV2Ru?=
 =?utf-8?B?ZllzZ0Z2Y05yaUVOTEZjYWFUd2NoOTA2VnQzbjJZYlVzcEVvWThBMTVwcGVX?=
 =?utf-8?B?bURDdDN1QWYxSGN5NWlTWGNaVVlYbW1QbGlZcFd0TUdiNXMxdGYrVWR2UENL?=
 =?utf-8?B?cmhPaGxRN0pvVVJtSGQxcUgrelVHdkIzZFh2WTVPd2tQczZ6SENHUFRZM0Ns?=
 =?utf-8?B?WXhQdzljUStzV0ZDNm5nampDRmZwdmh4MFNNd0lYOUZzSmkxWmxQa1UrRzly?=
 =?utf-8?B?RXVGVHJUTzNiaFkzQitzWXFBb0tHS3NDSXN0Ym9NWDJDV2JibDFHZVVxQzM2?=
 =?utf-8?B?QlNTVnEzY1NLNzlIQWd6aFRSVWhSL25ycjc3R0tFSFBLeCt1MXk0U3NYYlNv?=
 =?utf-8?B?Mjh5NldqcTVBNkFlVGdJK1MvWkpYUHpVUjdncjNFanNsNVlob2hyNzI0VS9B?=
 =?utf-8?B?dUs1Z0JhcldPbEprRlAwcndhc25kc0liN3oxRWxPa1Q5b0YwTWw0SkZZUkVT?=
 =?utf-8?B?Umw2TlFCMisrT0NmUHd0cjNvQ1VoQVAxYlR1cVYwaDdkelkyYWFKQ1hqR2JD?=
 =?utf-8?B?b1hDSmVaMnZuaW4wZGpjcnpyMEpmaWZnNmZzdStsbmF3bk1OUVg5NGVyRkMv?=
 =?utf-8?B?NUUvT0t3ZXhpQnRydzhoekdaQUpvNkdqaGRhZmMzZzlWOHBPdEJKWUdmNDN5?=
 =?utf-8?B?TDV6VXQ0VDBaRHpkRmFGdkZlNDF5eWJYelE1U1hIajRaT2pBMC94bEVBNkxP?=
 =?utf-8?B?dnJtcUFpMEZFUGJyY0IvRFI0VTJjam0zVmNNbUtJZnl1eUFOYkFWQzdwUjN4?=
 =?utf-8?B?S3FTajdDQkpCek1iZ1VzTUY5dEYxSjlFZDlpNWx4NEM0UEloNU41SEtQL080?=
 =?utf-8?B?QjBZbktCcXkwNUtTZng4b1FCUXJQRDhQaW1Ea0U4VS91RDY0MWtxMkJUVmc0?=
 =?utf-8?B?c3VvQUZ0a2ZqaUE1SmpPODVvMEVHb2xHNUNIeVFMT2QyZHFic2VKb2xyVDk2?=
 =?utf-8?B?eW56eFVacUtCL1h5ZWpVMUovMGd5ZDQweTJLNWR0cFQzN0dzL1gxMkFEb3dR?=
 =?utf-8?B?bUkzRjZ2blhPZDR3MFByVXJJbTF4U3B5SEl5Q1ZBSWl4ZmVMUzZEdTJrVEp5?=
 =?utf-8?B?cHNlOGpocXlTWnZWN0tJdGFiemdvTzZwSXJUc3NreG5JRHRjVEhLUlY0c3Zn?=
 =?utf-8?B?dDRqM0xZTWwzZTFSTWVWUTRjckN4QXlSNU84M0luY01CbjNiQ25YUklBdmc0?=
 =?utf-8?B?b3JwN1VsUzRBdjQ0SHNEbFFGdis5eSthOVJ2Ym8rQTRmRFFQNzBQS2FHVWJh?=
 =?utf-8?B?VENPUkFSMVJkTmhWcHNWNHpvY1c1ZXkzUG1CQUtXckFFWTF6ZlVjTkhPYTRN?=
 =?utf-8?B?SjZzcyt5MUxKdEYySWMyMlNLazV1OHNHVGxZR2tXMmMwVmtMbXlBQUhkVTh4?=
 =?utf-8?B?MURreDBIeHZWQnBmbGtqT1JyNDhyTXdhMzJMMjlCY1RRZ3lSL25UNktTTm93?=
 =?utf-8?B?ZUhZYkNCeTZCY2ZIZE1vaXZDQStNSFFwSmo4YUNJRlUxT0FjK3ZQYmlYWUQ1?=
 =?utf-8?B?VE5YdzlSbGhrMEdTcXBsRFZLOG40Vm5qMGlQc2ErSVc4eEZtMVd6bXQzUUpT?=
 =?utf-8?B?Ly9BWjd6eS9tNER6Mjl3K3h3YVNmYTdRWVljNnFmamd6U01NNkQ0eXl2dFVo?=
 =?utf-8?B?SzY0UUlpWjNwdEJ0WnlkR3YxRmUrODA4RUhXb0M2SUtsY3gvZENlSFJKMStV?=
 =?utf-8?Q?M5tAu+u1F7pePw+zbQ02o1IY7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BC1292DE9FAA5489203E028D1F86D23@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc66d309-cc8f-4638-bbb3-08dabcf079b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 16:37:04.6029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fk5jKnrZMO66Ri2Pmtx11Zwb3x5GpNL856a/yz1THefg+cqQTpvszfutaQBkJq86i0cCmJNqfzO7btvUowZPm/JP/vEjWAydi2SrqPsuMZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6204

T24gMDIvMTEvMjAyMiAxMjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDAyLjExLjIwMjIg
MTI6MjgsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPj4gRml4ZXM6IDgxZjU1OWU5Nzk3NCAoIm1h
a2UgZXJyb3IgY29kZXMgYSBmb3JtYWwgcGFydCBvZiB0aGUgQUJJIikNCj4+IFJlcG9ydGVkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+PiAtLS0N
Cj4+ICB4ZW4vaW5jbHVkZS9wdWJsaWMvZXJybm8uaCB8IDIgKysNCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1Ymxp
Yy9lcnJuby5oIGIveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgNCj4+IGluZGV4IDVjNTNhZjZh
ZjkuLjZiZGM4YzUwNzkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvZXJybm8u
aA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgNCj4+IEBAIC0xLDMgKzEsNSBA
QA0KPj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQgKi8NCj4+ICsNCj4+ICAvKg0K
Pj4gICAqIFRoZXJlIGFyZSB0d28gZXhwZWN0ZWQgd2F5cyBvZiBpbmNsdWRpbmcgdGhpcyBoZWFk
ZXIuDQo+PiAgICoNCj4gRG9lc24ndCB0aGlzIHJlcXVpcmUgYXQgbGVhc3QgcGFydCBvZiBTdGVm
YW5vJ3MgIltQQVRDSCB2NCAwLzRdIGludHJvZHVjZQ0KPiBTUERYIiBhcyBhIHByZXJlcT8NCg0K
Tm8uDQoNCkEgcmV0cm9hY3RpdmUgY29tbWVudGFyeSBvbiBTUERYIHRhZ3MgZG9lc24ndCBjaGFu
Z2UgdGhlIHZhbGlkaXR5IG9mIHRoZQ0KdGFncyB0aGVtc2VsdmVzLCBub3IgdGhlIGZhY3QgdGhl
eSd2ZSBiZWVuIGEgc3BlY2lmaWNhbGx5IGFncmVlZCB0aGluZw0KZm9yIHllYXJzIG5vdyAoY29u
c2lkZXJpbmcgaXQgd2FzIExhcnMgd2hvIHNldHRsZWQgdGhlIFNQRFggZGViYXRlIHdpdGgNCmFu
IGV4cGxpY2l0IHllcykuDQoNCn5BbmRyZXcNCg==

