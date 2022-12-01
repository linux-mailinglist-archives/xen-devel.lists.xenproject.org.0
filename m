Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C663EC60
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 10:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450402.707645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0foY-0000ud-QK; Thu, 01 Dec 2022 09:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450402.707645; Thu, 01 Dec 2022 09:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0foY-0000sN-MH; Thu, 01 Dec 2022 09:25:06 +0000
Received: by outflank-mailman (input) for mailman id 450402;
 Thu, 01 Dec 2022 09:25:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/wf=37=citrix.com=prvs=32775c42f=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1p0foW-0000sD-Sj
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 09:25:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0829ee95-715a-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 10:25:03 +0100 (CET)
Received: from mail-bn8nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Dec 2022 04:25:00 -0500
Received: from DM6PR03MB4172.namprd03.prod.outlook.com (2603:10b6:5:5c::23) by
 DS7PR03MB5511.namprd03.prod.outlook.com (2603:10b6:5:2c5::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 09:24:58 +0000
Received: from DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22]) by DM6PR03MB4172.namprd03.prod.outlook.com
 ([fe80::bca9:6c1e:de4c:fa22%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 09:24:58 +0000
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
X-Inumbo-ID: 0829ee95-715a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669886703;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hzSj2mugFf9tKjJfjaQr/zOIO56CUyMyFozxqt89RWY=;
  b=KB0CakjZH5o+8Vs00DBpGheLiFe8POEEBxur0n4cg/oRvUzWrJ1Iy9Kd
   F4LHrHX04xzcs5RaF1aeMC48axZ+lKBER5rfUvdYUlCWi0sS/yGsgEDuA
   0E2lGnXb/oqfXS7vqzdeiJxQb4E3smCUTHye3iXHZEi9y0LSNJowqF0Wc
   0=;
X-IronPort-RemoteIP: 104.47.74.46
X-IronPort-MID: 86014276
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X2ZJjKMVv4HmMo/vrR2GlsFynXyQoLVcMsEvi/4bfWQNrUoigmNRm
 2FND2zUbP/bY2agLdwiad638BkA78LUx94wGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpC5gVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rt4HjxCz
 8EiETMqSRmDg7O6na6eTeY506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvza7IA9ZidABNPLeesaLXtlUl0Deo
 mPA82X2KhobKMae2XyO9XfEaurnzX2jAd5IS+PQGvhCsn7PnncXFScqU0qAiKKUj0OYBv5mA
 hlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQNAvqsIeXzEh0
 V6N2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoOS1sD6ty7/IUr1EqTEJBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:gAsBtK/EloAhuG8p4NNuk+Hwdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrLX5To3SJjUO31HYYL2KjLGSiQEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpkdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NTjj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qi5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 F29lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQFo+dY7bWfHAbIcYa
 5T5fLnlbBrmJShHinkV1xUsZiRt7IIb0+7qwY5y5eoOnNt7Q1EJgMjtbAidzE7hdIAotB/lp
 r5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeg60+Kkke+J3FwZ3pDcRHUz9upFpL
 3RFFdD8WIicUPnDsODmJVN7xDWWW24GTDg0NtX6ZR1sqD1AOODC1zJdHk+18+75/kPCMzSXP
 i+fJpQHv/4NGPrXYJExRf3VZVeIWQXFMcVptE4UVSTpd+jEPyjisXLNPLIYLb9GzctXW3yRn
 MFQTjoPc1FqlumX3fp6SKhL08FunaPiK6YPJKqjNT7krJ9R7GkmjJl+WiR94WMNSBItLAwcQ
 93PK7n+5nL11WLwQ==
X-IronPort-AV: E=Sophos;i="5.96,209,1665460800"; 
   d="scan'208";a="86014276"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkYJ41RrqCp1yOuT5KsQDDU956tQnJxiXMdXlD9pQ827Ks+hwbV6WiwniSOH243/ZCUwx/Maz+pDD+1g964f+FzCcPOUoJ/QYI/evGOQjtJe+OOSkPI6+C8eyFIkes+HB026CG4MVmcx7rO7E5rFqBPewoTIGI6dIl59VRuaztQVwDt2fmGnx4Xe6X+38vc2WUXQ8fQNLJVoaQShhj4/sYgJUtT+BkRcY9BpNEyYB3eRb/0RQyoPNCn2q2+u82T02pl8kG1mn8rZgJiTx5eMFjq6MssojZq89PCseA0fLTDks1rd3KYvo5Q0RkJr3vaX7V5LsTxd7epdJbNq//8Ohw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzSj2mugFf9tKjJfjaQr/zOIO56CUyMyFozxqt89RWY=;
 b=LeZZGmEjDQkQZx6MZ9ugA5isGWr13gzI7nk8qBMp0Yc9TbCQQ94B9Gydnu1iVQkoRiYsF7Rr8NnPYle+cl/sThjmAMHk60TdV78Vwru6hSrSFi8OUQkS1Gt7ZAsa5Z724l1P8MWWcaRYFUqNd7hQJ8dv5J2YamFHe5XrgC7sfdUuxzA4kvuqPVmVmRlKaDqVlfzF/qY9OSOuFJAY2V/FZXWS4Y7FMZu9BrdZ/8ZCVHke8HzhfQfBZXGb3zEucSpc9LFuovxPFbOR1hU40uZg3ReQ79idPUZ9abhMrhEUw2EK5LS0QEVAHhzNg3A6tez/d32tdOu9P4l8g5er55Acpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzSj2mugFf9tKjJfjaQr/zOIO56CUyMyFozxqt89RWY=;
 b=XGfU0gB47AsbzCJnI8aSqD9jPhcT24jekBbPiGycu/9jYXh+Oi3Yi6n4zovK5cKndQyp/IAn9zThkZpeKQMESy59HrnafUdqDb+c8AN6NDeRjaF87l/lZcZwV9rLnDYhKQJrQZxTSUmPzuijGgvhv3d0Ie5HGeEXUx1KuOUzb+A=
From: Christian Lindig <christian.lindig@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Thread-Topic: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Thread-Index: AQHZBOHhPffcYAPaiU+ApitDg9tKRq5Yw8sA
Date: Thu, 1 Dec 2022 09:24:58 +0000
Message-ID: <DE5B27AE-456F-4F46-BD9A-0DB4E7A82A60@citrix.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
In-Reply-To:
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR03MB4172:EE_|DS7PR03MB5511:EE_
x-ms-office365-filtering-correlation-id: 4c8390f6-8924-44b7-3fc9-08dad37deab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cjgFyZvfrXBsgxGlOAMzhi0T6lQJydGQ2x84Eb5hpXgRXIlTLasaGaiFjoI3O/zgVLBT/zavJOsaKnxSV8ijLt6rTh7WOodnHT0dmbt/uDC1tRUsxP1gOT4paV2AeV6612ryD4m3QUuG7o2Gg8Waa4oOYWoiNsXR+00IKC8U5f/TdBaXu3FSWWi3KzI0OoR+AE5YQg5QIfCTHef7tbgbYz50LeH87OuRuVEasooPUlE3E1IBSDkZpUXKkclJ0gBgQtSuZDDXfXe4e/TFK++Nq5onnnayQb81jXOQ2HQTUAtF8XijafUR33jBHstBRHwHgE5HcahRjO/08XC2NSeek3gRFJgkbR4S2eqSdwPeuTG5rRxaPmy9dsb0IVQX2H2Xfu8yfFgGJ+KASqbiHKlRs/7cvgz1lhGSuldyLWFqNzucAhTTC744sbwmJQb5/HkDKLV+rCLSGSNwjqHwq2pLQKOlUqgaur0rQ5VhTRlOHzg7vLlq8bqBqAl3ry/C0XezIuGrOU5z6G2s/sXM+Myxnt0Q/ZP2AbcfFYM7aVgFH1hYF93vx1mlHuk7gZhXqmXL2q5+SCPcQk+wwouO0TpNKN0iZ7OTaF2QOU2Xh6yFOK1HvCchj62ri2Qhyp9cqHFpTF+Rpb+GRYTT26Lommasht3aIvD2Blttj0H3eGwQfxspapM1IaoeoEmrDBj514LlH/4oKzDfMKNp4HLJKT3isAt8Eh2NlagFrGsVZHm4MOoVjPApYycUYh3SCOKx58D1dRfqAwdWhSveDy2m/hqHRg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB4172.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199015)(6506007)(478600001)(86362001)(107886003)(53546011)(6486002)(71200400001)(26005)(6862004)(33656002)(8936002)(6636002)(37006003)(41300700001)(6512007)(5660300002)(316002)(66574015)(4744005)(82960400001)(44832011)(2616005)(38100700002)(2906002)(54906003)(8676002)(66476007)(36756003)(38070700005)(66556008)(64756008)(91956017)(186003)(76116006)(66446008)(4326008)(66946007)(122000001)(142923001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TVVhM3VVWmtpblA0dWNGUW5sbHVXdlpxOGY3ckZSMTVFNjQ2aUc1Y3QwbTdI?=
 =?utf-8?B?U1g3V2lLeHBLQnVPU1c1RWl3aTJ4bk1UZFd4ZjBwK2ZoanJWdUYxNWR0YlFq?=
 =?utf-8?B?bkZOMlM5d2JmZTNKS1NuMWZQb3ZMZ2tOazlGbTN2Mm9KZ1Q3UmZWTng1eGxi?=
 =?utf-8?B?RWJwcXkrbUtvOUJiK09nUGtxOTJqYS9LNFJuSFZuaXNqYzl1Yk5XNHhLYitE?=
 =?utf-8?B?cEltUWtlM25FUDd4QW01T2t2RCs2UkNkSytJV0l1QVdwREVNeklqWDFZUEVP?=
 =?utf-8?B?cWRBbUpGdm1XSGpUa3ZEUUhBTHhCUnIvaXJoTmZoT1Jmc0IyTXFnbkt3RDNZ?=
 =?utf-8?B?UlJZUmVmMUZHKzk0UEcvRWlhYzdJb2UrZ0Z5SExiSE1BOUVMTUFTL1JESnk0?=
 =?utf-8?B?TlZKY1FnS0Y5U0drTWxRdWp0a3hJUU5jVmd1cXdYVG5FTGRpY0IyQkJnL3ls?=
 =?utf-8?B?UmMwQmd5NE9GWXg3eUZVWFc2VlJyUmQxblZ0MFlCODFRSW5XRjltYUFkR0No?=
 =?utf-8?B?OXBST3d0YXZDNXNpOVZpZFB0U3krMWtJNURDQ1FkL1ZCZW9SK1FvZnlSNkJ3?=
 =?utf-8?B?ZzAwQzBTRlphYk0rd3hpdSt6dlNaT3B0NDdEeGI2RlFqRVNjZ1dKOENlSXlI?=
 =?utf-8?B?bjJHVjVkdmlYQXM4aW80SzI1TGgzMSswSVVXbUluRTA2ZC9wTU9VNFdFOVdx?=
 =?utf-8?B?b2FhbmFjVDFyNkJpRy8xR0xWMnJkdGluQm1KV21zaEh4WHBlRE0zeG5qcmZY?=
 =?utf-8?B?RUtQam5Hb2swL1JUUkVQdHdDYnVSa3lrZXZzdDlUdXdmOHg3Nm1rd01ZaHdk?=
 =?utf-8?B?R0hqeE1lMjlnV29OemMzeEhvbDlzYWZkL2MwUGpIdjN2bElBazRpSldxd3hx?=
 =?utf-8?B?dmkxTzBmOExCRkRod25aSEhHS3RoUnZtL2U4MTVPSEZxN3Fsa0tyZjVaTW1M?=
 =?utf-8?B?aWZlRUNrank4NlZVK2xIK2FnRnRvaUZ3R0diR1RkYUtSTERPTWc5Y0ttcWN4?=
 =?utf-8?B?OU13V2xRL1VJSnNlaGNGemFqQjZmbVowY0ZJamlqVHlzTGc4NEVPRU5XSjdT?=
 =?utf-8?B?RTc0cHltVFdLQmxLV2ZNMjdIZjZBSWFvZmtrK2w0eU9ldjlXaUduMzd4VXVI?=
 =?utf-8?B?ZW1HaElMU25jQzdlK1V6ZVk5VXdndjU3ck5OVmxoYkNaa3lSVjB2UCtQSm9k?=
 =?utf-8?B?RDBRbHZxTGtPN2owTURJdWlkYnJmR3RiVFozVkQ3U3pHcFoyRXdqQ2E0NVRF?=
 =?utf-8?B?L0JOeEZMZVFVTkliZnVxTDEzOFdHNCtrVmp3T2c2QmpzdnU0S2p5VW1FTnZE?=
 =?utf-8?B?eWMyczBNeUd2YVliNU1LZTlKVFhTSVF0V1BTNmZJNUViYjlKTzJMbkZXMk1w?=
 =?utf-8?B?WXdJc2FoaHdLS1FSMXpoWVFkWVhFNk1kdHZjdFExcE9leS9VV1Z0SU03Z2g3?=
 =?utf-8?B?VjlPWnE3eVVWNUJZb3lGVUs3WWo1TFp0NGhQYSt2NkVCelBTZ3pHMWI1U1Ry?=
 =?utf-8?B?dWU4LzhZTlJzN05EUmw4eW5NYkNSTy9tR1krQWlIbUVCbkRTV2JKZnFZN3Ba?=
 =?utf-8?B?Qk1pemFjZytvNlpmTjNqb3U0cjdiZEFRQm9GQTdhdDRVZFZnRlNYRndRS3ZU?=
 =?utf-8?B?RVF5YTU2MGo0MmRYVVFjdDhocjluWk5pRWk4a2liVnpPSm5tazhyaWVBaTRJ?=
 =?utf-8?B?M0RPdnJzYi8vNzlaTVk3STNweTRJQ3RndWZFTDRia0tGM2xaeEtTMFJSVkdk?=
 =?utf-8?B?YTNMSXhpVldvNkQ4cXVsUW5iT2dmM0hMeFczWDh3MG9NMWI5UGs0Tm41RnVP?=
 =?utf-8?B?T0JYVmpGL2d1MFZaSmZINGswT0pSMlFqQnJHQi9DajFmdTMrRVltRUl4U3Ro?=
 =?utf-8?B?UjFtdXphNHAyM3pQTDBLL1pSUmI4aThkSFV5dFhBeUx0TnhWUnVhQjBOQXR1?=
 =?utf-8?B?TkkvTG9zQVZCTXlXcnZWQmdOY3A1M1hzMUFiRmNNOVlKMWtORzZlVXVocGwx?=
 =?utf-8?B?SXYvL29XZEt3YXVERGVDZVFMd2V4dHRSaXdqcEZmTGw5d29zcWpKL29GWmlx?=
 =?utf-8?B?bmJ2SkUrYjNnVWdCM241WUVwdGtJdUVQd2JDSi9HY1NsZC9lVkxUVUdUaXFz?=
 =?utf-8?B?ektzUEMyWGcreC9lbGVVOXRFNk15QmIzK2k0aWYwdHBzdit0T2Nta0ZIbVY1?=
 =?utf-8?Q?OGse42EAOx4BV8SMgaXeKuk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32BC79DFAE043D429C9C9A5231BD55E7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4n9HiqMMH2PgfotC1+7spjL6HmdKgLKL7eb9vUwCmRjtOm45DuRK/fy49TBvkadCX5vrBIWJvHG87HhSKSpI1MqHKHm4cwQzWaWdJhR9TrQ13pny2WPpt1buaCeBmHA8TNHyXgtqF4w7X04k8dqSITUYgyMh4TxNfog2KkowG5K+L2SPvfiMtiUTnhw8M6SkSYXSHyfLjOd8OumWm+BI7C+/0L8vSb8ePdZF3HTVCZoreZmKsOCBOBIj+dmi7gJWBNvQQcnMAPmfXuqRSI2kEDHpfyRwxEAd8wAYcVMky6em/8cRRmWPRwTRR8K5AYlOL4fEHPL7ozvMVPsr2INyhW/TXZB/CxdaIoWRgUBSAV9/gU/LmJjg+aS+0TQQVZ2Wxi4E7s0LF4d4tbXtAcP2QJ8zUR+Bfz5ejCAWDITAjT88dqdLrE0vXpTSPqnVknTdTUN6Qp0O/ttBjfkVyq4ST7bOMZHAN4YUONZ5bdKrBh+B07PCu7ruu+XB7i4FXTtOrBz/fs6EIs7ypNBNmKF4xz4Oc6kz6Sdy3hzxpVh6+ODXzoka5Na958uggNu4L99HfcS0Ria+9X24UeYOI6eHgddCmUNygT0Fb7NMqExYvxDUzXTN3qokuXWx85p6RZOwHh/zIpUZ4j8/Ndg8haB9Lf0WAnIN4d8gU+2Kme2UmWPXkFH/zy2EDXsrNERKIT0/eZMRzoec2TK32O7yJg3QWPyML/lh/teqk+EsNZm/p07HN76GfCp6YrATiVVmxj4J9Sa9P4VlZtyr/FWw/jwZlH7IrRZJxBCz93gCGj6K/+nh31WF1AEm3wIdjjmqRuDFvp6Kyq4QbOdkYe+A0OLwzg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB4172.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8390f6-8924-44b7-3fc9-08dad37deab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 09:24:58.7841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: girHOIeZOvgMxedbUL05+rQ/eymhQ4i/XlXVyvd9RGhvdaJOjHV+UyWrBo86Z6nGhuyoQ+vj642qRAggXp5ORW2Iu+TmMoRVUJAlKLCg6Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5511

DQoNCj4gT24gMzAgTm92IDIwMjIsIGF0IDE3OjMyLCBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jv
a0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEFkZCBhIC5jbGFuZy1mb3JtYXQgY29uZmlndXJh
dGlvbiB0aGF0IHRyaWVzIHRvIG1hdGNoIENPRElOR19TVFlMRSB3aGVyZQ0KPiBwb3NzaWJsZQ0K
DQo+IFsuLl0NCj4gRG9lcyBub3QgeWV0IHJlZm9ybWF0IGFueSBjb2RlLg0KPiANCj4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZp
bi50b3Jva0BjaXRyaXguY29tPg0KPiAtLS0NCj4gdG9vbHMvb2NhbWwvLmNsYW5nLWZvcm1hdCB8
IDkgKysrKysrKysrDQo+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL29jYW1sLy5jbGFuZy1mb3JtYXQNCg0KQWNrZWQtYnk6IENocmlz
dGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCg0KSSBzdXBwb3J0IHRo
aXMga2luZCBvZiBhdXRvbWF0aW9uLiAgSSBhbHNvIGFncmVlIHdpdGggdGhlIHByZXZpb3VzIGNv
bW1lbnQgdGhhdCB0aGUgdGl0bGUgc2hvdWxkIGluZGljYXRlIHRoYXQgdGhpcyBpcyBvbmx5IGdv
aW5nIGludG8gYSBzdWJ0cmVlLg0KDQrigJQgQw==

