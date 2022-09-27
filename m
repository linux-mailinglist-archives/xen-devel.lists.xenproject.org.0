Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF85EC617
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412656.656036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBai-0002YM-00; Tue, 27 Sep 2022 14:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412656.656036; Tue, 27 Sep 2022 14:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBah-0002W4-TV; Tue, 27 Sep 2022 14:29:43 +0000
Received: by outflank-mailman (input) for mailman id 412656;
 Tue, 27 Sep 2022 14:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0TW=Z6=citrix.com=prvs=262f03aef=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1odBag-0002Vy-Dx
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:29:42 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d13e75fa-3e70-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 16:29:40 +0200 (CEST)
Received: from mail-bn1nam07lp2044.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 10:29:37 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5416.namprd03.prod.outlook.com (2603:10b6:5:2c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 14:29:35 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::56c6:613e:cc95:d028%6]) with mapi id 15.20.5654.027; Tue, 27 Sep 2022
 14:29:34 +0000
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
X-Inumbo-ID: d13e75fa-3e70-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664288980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RdKa9YppLrZ/GksXmmNlTC4WrT092sYpChMVJNDGWMk=;
  b=gImTs+vMaPa4j3wMFcQ5LjlxxYDqmshMUhHW73Gde5oPoiu38M9JQZM+
   PW11CHe4YaXVwkuc1BBUsTAZg8bO6nvwcAl8r+jco9nTKAmYfM/OD517z
   gf+UqmO/ydoyVhSFXIzrb9Oba6rZCi1HMjySXX/MZ2CDdHJIAQKXJ+sYT
   g=;
X-IronPort-RemoteIP: 104.47.51.44
X-IronPort-MID: 81871296
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UTLpKaoDPG+GWr1TTrhdsn3h849eBmKdZBIvgKrLsJaIsI4StFCzt
 garIBmHa/iOamryeNlwao2/8h9TvZTdy9QwSQQ9rC82HiIa9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+55wehBtC5gZkPaER4weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mx
 PtEGSIxXiK5qe+974yJUeg9vdQGM5y+VG8fkikIITDxK98DGcqGaYOToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OlUotjNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNtCS+Tip6ACbFu7xUIPCzE2DkGHgOCFjFyvQtx6G
 0oL5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRUcAeCsFQA0t89Tl5oYpgXrnVc1/GaS4itn0HzDYw
 D2QqiU6wbIJgqYjyaK/+lzWhiO2kZLARAU1+wb/U3qs60VyY4vNT4al80TB5PBMaoOQVECcv
 WMsktKbqusJCPmweDelRewMGPSj4a+DOTiE3lp3RcF9q3Kq5mKpep1W7HdmPkB1P80YeDjvJ
 kjOpQdW45wVN3yvBUNqX7+M5w0R5fCIPbzYujr8NbKivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:1uaICqERehGfCodfpLqFS5HXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNNICPoqTM2ftW7dySeVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj2Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnY4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlUFtyssHfqWG1SYczGgNkHmpDq1L/sqq
 iKn/4UBbUw15oWRBDynfKi4Xi47N9k0Q6e9bbRuwqenSW+fkN1NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2PwqT+GLEXQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81871296"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmCFxFqJwvB3JqcAfVR6MbByxnN2fLRxGsVGVTG5esQmosZOYlmlL7NVENOHuFWxyEXzFgRl14jO4QGqSamh7ZJSJwmYA9JOomGEGV8XmD0zkxJDGO918IyYQmxvVwiDA/VJUtwc2YF+P0m4L082k23R5CQWpgNhGtAUnJ7skIlqM/YQHGRsXH6aOahXitnJmGg6vFXnSwNB0rWJAJtUFKDAZ8z9xfSWBcUhk6sRPYie/qjKfnFNWKBKnSU+Gw+zit8evfX5PBZYNv0XLSvvFygtB9GG/f5KWidjlKh/mQgiLmcLnl/6wL+tT1MbKe5Do/OLciiZUuUa+suEKjM1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdKa9YppLrZ/GksXmmNlTC4WrT092sYpChMVJNDGWMk=;
 b=PDvlcv9BESkuVXzQBUy4o+90uwyNVQcs6OlXsQnUC555bhtfxauVXN9PlbGM1XXcKl0dyjjF9iL6yyPbAam+tkpUzYfWD93+sJxsBuYk9v8dE7ZgS4aSBF1+mE8qEPhHz4tvemrdbyYJz9kiDT5e0S1SPN6qt3yzieIjlTk9SebN1tFzVVQLKYvfZO+NJ21ppdpQlGg031f3FDoW5C3ZuS67bff1A3khR0EyklT/dJX9FIOdhfOGIXbabbH1EZyhhhBM8oQAmOMaALE4O5/aUtEMdLb+LEiOaM4mpyUsF8FLtuok/2EasmDlkXh6SUMvi+KTOckau65SB8zUPDA+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdKa9YppLrZ/GksXmmNlTC4WrT092sYpChMVJNDGWMk=;
 b=A4CHVWOWE4H5QK5A7eaFiEGwrIPF6mA2Lnw3yow1oxIEbdi07znf408QlyQ/vFuGbtW0jQdNn+aqFzrAd4iv8HBBHu9J0wq6YqTz1BXgSQDcgu2k9i0B3y9QhxMp1SLUCSbWyAQY/coiWFEW1w7WTVKAgfWL9OAjeMJ6tNhwIhQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Thread-Topic: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Thread-Index: AQHYxBz9vXThIyLw8kuRIj7v9n8AEK3zbpOAgAAEUwA=
Date: Tue, 27 Sep 2022 14:29:34 +0000
Message-ID: <7eab9645-0c7e-e171-870b-814c330fac08@citrix.com>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
 <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
In-Reply-To: <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5416:EE_
x-ms-office365-filtering-correlation-id: 997ec622-d1c2-4990-0c23-08daa094b317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4NFX7nJpxFgxU417oIN2wqG311akvk2Q7b/oyLW5g5NxPY/OA8ZqNPk60+bGTmZHT0/w5kxbEX5cki8Qf6338SztOX3lkdsTAu1hKH4HNzg/KbaW5lXRTlv1w6WBE+hC6mvjVSSOaldABk5lB5QZkd1HVrWi1OJNOL8pEloJqwWHxVrcuxynXlJSJxGhQI+CidpNfVKp2Dsr9jmXNPupjLPdOCC4tiwxb+hQXZL2p6tvV2pOQoTDLaUQlNiCWZ7Bx0E7OZFznJCTfDCCvpzGyXkrJOILbSAsbzWegKVY/OQ2PZkBcRXRUaEy4KI1K/C99LHGhL1Hkzi0yLz8xeLt/nQE/V6FS0qX2pvoE8CAUfr4NX1bSknoJfoDRHziT5PzZ36kBu+Pv0T2suZtF8SKdiyRSTujbQehIGHkXgBKVWw/q8P7RiGc2TY97tuCB3ERkfC/Q2E4gp71linuYoM/DTaw9MoYrMP3gy8ivaS6K9rf/j72b6YWAM53MAN4pf0odkHaTT9zxsST4TN8rXHrrGzOigMHBdcewtdOYPYeetoYdSb1v8ANibxjO0C6jCfkkb1vjZWKefCgvdgnEvIYNt5c7YLKB4fdwIAxTJeJL+ELHs6yAo4BeMoLDjm4WG1uVG2Yh9qkLTT/O7WoHlPFIQcrVWB8eaDvHDAgIvPc00IkZPL7wdsN87PYV1UUpeDBNQyNugDhphu0oV08kNP5zi1rBHqIS2PQgs+67PquCpInpSnoaARRwDzaZzvPAap06TKWfnV8E8rkO6IzlhSji3qKuqZlKk8UXQlfzkB95E0KaUh3z+WMD3FXXCo/UaWWXFIx/vHPQ09G14Ug5gXrOQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(451199015)(107886003)(122000001)(38100700002)(38070700005)(82960400001)(91956017)(76116006)(66946007)(4326008)(8676002)(66446008)(64756008)(66476007)(66556008)(54906003)(110136005)(5660300002)(2906002)(8936002)(186003)(2616005)(478600001)(83380400001)(71200400001)(6486002)(6506007)(53546011)(316002)(6512007)(41300700001)(26005)(31686004)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1hNUDhya2xjRGdrbnBNVmhMdExKUmYydjd4anVoNUNDVHNrL29vYWE4TVdT?=
 =?utf-8?B?WmZjVHZVbkt0SzVZVFNLaTIvbnYxd0duWkluTzFaTzdkUjdIVlRmZ3ZtYUpQ?=
 =?utf-8?B?bmM0VFNVaEpMblhNdnd4OVVkcXBDdXNqSjF3RncvRGlhV3VXTVFsNzdHSmRa?=
 =?utf-8?B?c0Y4MW8xU3lPZDFYSVYyRk85bTIwbUdwV3NyclpCY2N4dDNzcW8vaEpLMDE3?=
 =?utf-8?B?MUlQckdHT3lYRXVhMXlkb3E5R0graDA4aFF1MWVOUzZmRENocnZyck1CYU1I?=
 =?utf-8?B?N1dZZmlNTUluK3FJSDFxaDEvaWFTWG9mRzNGL0R2Rm5seGNNUHQrdXhIemxT?=
 =?utf-8?B?UDExMVJxbFhmRHZMc1U5OUU0NTROL1FMVEk1dlVQOHNaaEJNUmd4czFJcGFu?=
 =?utf-8?B?Vm5RSjRHWUwzRUFFbndGbGZ0ZXVjWEN0S1pDSS8zeWhwRTQzVE1CK3dOR2pU?=
 =?utf-8?B?NmtsdG5Cb1NQOTFzNysveUl4cDlWQ1YrSFgvekpIOTZ1bkk4bndjUHhGSEFq?=
 =?utf-8?B?OW5Pa2MrdUZjZG10cUIwNzlHQTFoaUtOa1pFTjhqd2hZNFhPTE90MS96U1pW?=
 =?utf-8?B?dnlsVm5wd3k5VnBOemlBYmJaUVFkemU2N1FVUEtXZlRPY1NjYmxadXd0eEhz?=
 =?utf-8?B?WkV6aVdONXFqNENYbjNQL25xdG9DTTVzUVNZM3VYYVQ3azFCZGN1QUdQQWpj?=
 =?utf-8?B?MWt1M0QrRWlxd2lmazBjZDZvM0g2Si9jZlVmVW5yZVJGSXRSQkRuU1JnSURK?=
 =?utf-8?B?dWtoYkY4emhPVXErTGR4KzFOZFBPckZyKzdYV3JLaHhtZDFpNkxxb3lUVkhs?=
 =?utf-8?B?enJLS2xHakhvSnVOVEEzN3R1UTFyOHZOMHpzVFIvT2d6TlhKczdUOUtodWps?=
 =?utf-8?B?ZEhOUnRDRFRvNzdZYnVneG9lQ0NjOFU2bUVOdk9JM1V6TWQwQmxacVIzL05J?=
 =?utf-8?B?SzlGZmY3NlA2ZklHN1BxVW9ma3FpaGhKR2lJY1dWWEdtVHdjN0dVUDRsQzhl?=
 =?utf-8?B?K1Y3SE1QS21ueVdDWFRxQjRhRWtwVDJHRDNXSXMrWGx5V0RtV3dXOUhlL0F5?=
 =?utf-8?B?ZHhHaGhPMzRKRytkRGxTVTk4bTZQZEpGQUNCV2NlOEQ0Y3BaQ2w0N21nWWpL?=
 =?utf-8?B?Vi9LNHdXUWlENUVEUWtIbVFZU3QyTTduc1VjUHE4ZXE5eVBrbzFPbzd4RXZS?=
 =?utf-8?B?ckJ5dWkzMGJmUWhWR0h6VEM2bUFPSUZJNUVXY2QzSE15aU5kbC9ET21ZOHF1?=
 =?utf-8?B?YWZ6TUZqMWxjckY3anEzRUNvR21ZNHpHa25Rd1ZPYTdzV2UwYndGUEZPR3lO?=
 =?utf-8?B?ZUtWREFQbjcreWNQOTZsRkw5Z1NoZFY3c2JwdENWdHRHam5xQ0RTcnIwdC9Y?=
 =?utf-8?B?NlVUUlEvUHlYeVVBdFVKMmpTZHN6aDFDaHZZQkFkdjFoQ1o0aW5RMVBDRTBD?=
 =?utf-8?B?WnFENlBOdTFva0Y0bzFMZ2NJUDFiUkpTY1ZBN1FKWml3eER2azZpc1Z4NkFj?=
 =?utf-8?B?eEFzU3RMRjhtdklidm5nTHEydXE2NDVUN2JRM0c5WkFMWFpuTk5nbTFhbXV0?=
 =?utf-8?B?b3FUVkcyR00zUGFxeW5ESUE1blVURGJINW1iMjVGcGRxa2lXSGJZa0QyVlJp?=
 =?utf-8?B?TGkySHpGQi94dFVjNjlocnRHV1g2MzVXWlpkRW9MblBkeHJCRzBCSm95T28x?=
 =?utf-8?B?SWMya3YyNFJkNG1EcE1naHhFVTFYb3dhY3JSZUh0MmtuU1Y0a0VlU1BvRk1F?=
 =?utf-8?B?QnJSVWUxUDJFWk9ZMGljZHVtWU5laXNYZ0RSbHVxbGFxaUZkdUdDTTZkb1hL?=
 =?utf-8?B?U09Ec1FqWWZQeFMwM0FIRW1ZRVcrVXFLNWg1ZEdWOEZQaThnUHRCQWNVRHhH?=
 =?utf-8?B?NCtENzVmZThRR0ZFZVVjTkYvNTI2ZVMydTM4Z2I4ZzdHY09UZVpJajdwOU4z?=
 =?utf-8?B?OWJnWVlFeXBqMVJHQUZRU3FTc3VialZObWRSdDg2MnArT0xaamNZUmdKMDhr?=
 =?utf-8?B?WTdSR1JkSVpYdFowdjEwRmZVTUxxMWd3QzNEazhOckJkQUtGeWdMQ0ljcjFn?=
 =?utf-8?B?UjMyd29xTGxEbnBHNnpYc2FSMUZxcnVVTnpweG04Y2g5a2pWZU8xb29VZzlE?=
 =?utf-8?Q?91rW62N1VZqnGwLqzgiOXeAsU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37227DF63CAEB44F919FCA6E694E4C25@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997ec622-d1c2-4990-0c23-08daa094b317
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2022 14:29:34.6113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bk6lIq2buOeXZ+dw2NyLf1vINgEmQJ85h0aNdwpxkn0se246cvbiAG9lDuv554+6LrMkB07jSlybBIC57TcC4lOJTOGnjlMJJ37++CinaB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5416

T24gMjcvMDkvMjAyMiAxNToxNCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBPbiBGcmksIFNl
cCAwOSwgMjAyMiBhdCAwOToyMjo1MkFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IFdo
aWxlIEkgd2FzIHN1c3BpY2lvdXMgb2YgdGhlIGNvbXBpbGVyIGlzc3VpbmcgYSBkaWFnbm9zdGlj
IGFib3V0IGFuDQo+PiB1bnVzZWQgbGlua2luZy1vbmx5IG9wdGlvbiB3aGVuIG5vdCBkb2luZyBh
bnkgbGlua2luZywgSSBkaWQgY2hlY2sgdGhpcw0KPj4gd2l0aCBhIGNvdXBsZSBvZiBnY2MgdmVy
c2lvbnMgb25seSwgYnV0IG5vdCB3aXRoIENsYW5nLiAoT2RkbHkgZW5vdWdoIGF0DQo+PiBsZWFz
dCBvbGRlciBDbGFuZyB2ZXJzaW9ucyBjb21wbGFpbiBhYm91dCB0aGUgdXNlIG9mICctbm9waWUn
IG5vdyB0aGF0DQo+PiB3ZSBhY3R1YWxseSB1c2UgJy1uby1waWUnLikgRmlsdGVyIG91dCB0aGUg
cHJvYmxlbWF0aWMgb3B0aW9uIGluIGFsbA0KPj4gY2FzZXMgd2hlcmUgdGhlIHZhcmlhYmxlIGlz
IGNvbnN1bWVkIGZvciBjb21waWxhdGlvbiBvbmx5ICh3aGljaCByaWdodA0KPj4gbm93IGlzIGV2
ZXJ5d2hlcmUpLg0KPj4NCj4+IEZpeGVzOiBlY2Q2Yjk3NTk5MTkgKCJDb25maWcubWs6IGNvcnJl
Y3QgUElFLXJlbGF0ZWQgb3B0aW9uKHMpIGluIEVNQkVEREVEX0VYVFJBX0NGTEFHUyIpDQo+PiBS
ZXBvcnRlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4gLS0t
DQo+PiBBcmd1YWJseSB3aXRoIGFsbCB1c2VycyBvZiBFTUJFRERFRF9FWFRSQV9DRkxBR1MgdXNp
bmcgdGhlc2UganVzdCBmb3INCj4+IGNvbXBpbGluZywgdGhlIG9wdGlvbiBjb3VsZCBiZSBvbWl0
dGVkIGZyb20gdGhhdCB2YXJpYWJsZSByaWdodCBhd2F5Lg0KPj4gQnV0IGlmIGFueSBjb21waWxl
LWFuZC1saW5rLWluLW9uZS1nbyB1c2UgYXBwZWFyZWQsIHRoZXJlIHdvdWxkIGJlIGFuDQo+PiBp
c3N1ZS4NCj4gSXMgaXQgZmVhc2libGUgdG8gaGF2ZSBjb21waWxlLWFuZC1saW5rLWluLW9uZS1n
byBpbiBvbmUgdXNlIGZlYXNpYmxlDQo+IHdpdGggd2hhdCB3ZSBjb25zaWRlciBlbWJlZGRlZCAo
ZmlybXdhcmUgb3Iga2VybmVsIGxpa2UgYmluYXJpZXMpLiAgSQ0KPiB3b3VsZCBleHBlY3QgdGhv
c2UgdG8gYWx3YXlzIHJlcXVpcmUgYSBsaW5rZXIgc2NyaXB0IGFuZCBhIHNlcGFyYXRlDQo+IGxp
bmtpbmcgc3RlcC4NCg0KQXMgSSd2ZSBleHByZXNzZWQgc2V2ZXJhbCB0aW1lcyBwcmV2aW91c2x5
LCB0aGUgZW50aXJlIHZhcmlhYmxlIGlzIGJvZ3VzLg0KDQpKdXN0IGJlY2F1c2Ugd2UgZG8gaGF2
ZSBzZXZlcmFsIHRoaW5ncyB3aGljaCBhcmUgYnVpbHQgYXMNCm5vbi1mcmVlc3RhbmRpbmcsIGRv
ZXNuJ3QgbWVhbiB0aGV5IHNoYXJlIGEgY29tbW9uIENMRkxBR1MgZW52aXJvbm1lbnQuDQoNClBJ
RSBpcyB2ZXJ5IHNwZWNpZmljIHRvIHRoZSBpbnRlbmRlZCB1c2UsIGFuZCBibGluZGx5IGRpc2Fi
bGluZyB0aGUNCnN0YWNrIHByb3RlY3RvciBpc24ndCBzYWZlIGVpdGhlci7CoCBJdCBvbmx5IHdv
cmtzIGJlY2F1c2Ugbm9uZSBvZiBvdXINCmZyZWVzdGFuZGluZyBlbnZpcm9ubWVudHMgaGF2ZSBn
b25lIHRvIHRoZSBlZmZvcnQgb2YgYWRkaW5nIHN0YWNrDQpwcm90ZWN0b3Igc3VwcG9ydC4NCg0K
LWZuby1leGNlcHRpb25zIGlzIGZ1cnRoZXJtb3JlIGJvZ3VzIGluIENMRkxBR1MsIGFzIGl0cyBh
IENYWEZMQUcgb25seS4NCg0KQW5kIG5vLCB0aGlzIG1lc3MgY2FuJ3QgcGxhdXNpYmx5IGJlIHVz
ZWQgZm9yIGEgY29tcGlsZSBhbmQgbGluayBpbiBvbmUNCmdvLsKgIEZpbHRlcmluZyBvdXQgYSBu
b24tQ0ZMQUcgZnJvbSB0aGUgY29sbGVjdGlvbiBhdCBldmVyeSBjYWxsIHNpdGUgaXMNCm5vbnNl
bnNlLg0KDQp+QW5kcmV3DQo=

