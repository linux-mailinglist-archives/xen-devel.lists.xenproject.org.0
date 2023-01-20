Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 570EC675C86
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 19:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482065.747383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvvc-0003hn-RQ; Fri, 20 Jan 2023 18:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482065.747383; Fri, 20 Jan 2023 18:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIvvc-0003eh-NY; Fri, 20 Jan 2023 18:15:52 +0000
Received: by outflank-mailman (input) for mailman id 482065;
 Fri, 20 Jan 2023 18:15:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIvvb-0003eb-KP
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 18:15:51 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7637b674-98ee-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 19:15:49 +0100 (CET)
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 13:15:45 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5249.namprd03.prod.outlook.com (2603:10b6:a03:21b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Fri, 20 Jan
 2023 18:15:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 18:15:38 +0000
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
X-Inumbo-ID: 7637b674-98ee-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674238549;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZEsfnBZrPpNi72sXbq3Xf9959Zyg3A6HDpx493rqq44=;
  b=SYAlv/Hk/wDGWa4P/VCmTO0H6VBJOfrfLILHkB/24QgYOKdzIbnJ6weA
   +p/Oa1Hm8JqyB2HtMXhqhVC9xVaQspDETKBULFhNCLNyvJH/WCiz2EuwW
   6EqmLPYHyczK+K+bheNzracy0o89eJQ0gtLPVcKo56muHTwGh7EpIjEZu
   w=;
X-IronPort-RemoteIP: 104.47.70.109
X-IronPort-MID: 93527064
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Qdas9K4krxv2LDtYFKa6IQxRtPLGchMFZxGqfqrLsTDasY5as4F+v
 mBLWWiGPKqCZmX9fYgkO4nk80sEu8OBmoA3SAZtpC1nHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPakR5AeF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 9UoJygyQyK6t+O8nra3acJIquA+I5y+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOmF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNJSefnrqA26LGV7jEpVQcMZWOCmMaatkGRUOhVG
 0kPxAN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywSEAmkJSBZRZdpgs9U5LRQxz
 UOAld7tAT1psZWWRGib+7PSqim9UQAKKUcSaClCShEKi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1VXOgjbprJ6WSAcwv13TRjj8tlI/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8BJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:+kP74qh3+RN9Hex1fpwBC8qlGnBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-IronPort-AV: E=Sophos;i="5.97,233,1669093200"; 
   d="scan'208";a="93527064"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuwyGfaOKcdpmd/KXsWuzF6mpy4e59LfRkvTFlEtJvJectjdw6mF1tjkanuGkbBqlTDuneWRpE/02iyWJV4Myr2igsUzmXZXpEe6FqbydXn9O+gEK/DsADIhJWP2EONLsBUWlLWbHAdF/p5n6Yj93O92LzdH1Selhe+//Uf5hu9HQH4r3F0RKetRSkPZLJ0IqqwIYhuaQFk6tYu+8rn5o0uN4a21U/fmJn6oKSGt2XRXwek4Rj1vuLlQYk8arm0QXTLIK1DRiB5JNeBhjMbxvwWyT0/xIFHwvaQVLv9iaNTQqlZmo8YTnxiio/YVXxh3PEFIdoLwI6/llLX5mJMfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEsfnBZrPpNi72sXbq3Xf9959Zyg3A6HDpx493rqq44=;
 b=Br0snCQqtt9NfupWEY9zDZG6AVZPpwhq6S7CJ667ReTH6GHbDipZXiQBXVBz9OmaCq3m6TMWbv4l3tP/EpUIBJGWvzdF/L9SeDqW7quQH4uiQO0iVBAFtPjK5oDYbuwPMvmXSpN2nh3meD7lmNkLsKrtWDztqE1VFYdqw48UtADOrPnvI4GH8+Rg29XdYFVWZNd+lsY/L766nN9WtlaHoIhrUEKPYTS6EQmm5ajE3d6nNZ+xbnhtl4ChqW6i5rk/j5QW6fAvZE5y09LUzT27IF+B8/1dWqa8sN9FZqtsHJVgmh2mMVmQm/IcVctjeBbULZCXZkDvfPeaTo+/JHjuoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEsfnBZrPpNi72sXbq3Xf9959Zyg3A6HDpx493rqq44=;
 b=p0HEFNcbLTiWRAk9UZf8K9Q7qBVjuLD+O3QXjUU33dpy0r5oyecfB1PyBteDBT7eDhCqSVJb7Kv87KE4ZNMu72RP43WWTXyOVpI0jXAou2KpbT/Kd42+//BqhQ0nKJkeBfp0Cwwes5z6WU6RZirjmx5HpbER6GA2V0Y16nTbNHM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Topic: [PATCH RFC 07/10] domain: map/unmap GADDR based shared guest
 areas
Thread-Index: AQHY4457jyaOcvAnhkOdTNwMDM8hXq6juEqAgADGjACAA7ByAA==
Date: Fri, 20 Jan 2023 18:15:38 +0000
Message-ID: <978b098a-d052-09cc-442e-9aafc816feee@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <5a571fd9-b0c2-216e-a444-102397a22ca0@suse.com>
 <ed4d8d85-2ba5-74c1-7c65-0ae65bf0ee06@citrix.com>
 <24a2f51b-e69d-7a44-5239-79f5f526ef01@suse.com>
In-Reply-To: <24a2f51b-e69d-7a44-5239-79f5f526ef01@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|BY5PR03MB5249:EE_
x-ms-office365-filtering-correlation-id: 013086ed-176d-4b4c-ef3e-08dafb125583
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 +4TxtvnHrWuiV8fIq3WjRDJ0GXrBuh0dNgKNVm80IPhk/9jWdpybAd8e+CLSF+Ch0/fZiRL0Oo4tTgROKHMUap9/2U4x3kgOmUGlrotOhnnEsjN4O7KC+EXY6PKhFdmW/4EBALbDnJiQD0NvFnY2ePB1KRy1JWg1a4YfRPMcm2LqVWCc3i9Tfot6Dutya/lnygp5h7Z2C1eVwHPR3IIXmXVt2pr6fn+rv8siwNHjTxnpxrtCASzJ6ypWJpEsfvYRcK12kzXpULK1OVpGEiLDo8R9HCktz57qoRCjB0wGxu6AY1hsvr8UkBRe9iyBV4Z6aIKYAi2npa5w+XSH2yMxqkB2/Z+g5Zbf+dtTplUSRCqIjz64wWZHudk90BUfhBni9i+V/Xkqre3pxkkAVJU5/1cmEYNeIESaXcoguPc8iwZ8lU3KmvYZ4kK9ePvbGnkllgsqvvwouIUFoEE351iMDjINdnMc1yyKzIVygFMnfjKoMIWC7E12ajTnAop8QYsZr+qhdtnSVn3vzfb+xKKYLhsED/dnWBLKGpZ25QiMnxOlQwLKLaA2KpyqwhlOnr9R6txPqyHDciIjEKs2jocb8GDWFei2HChgGhZ8fugOsF+70ZhsQjwN/yXXHpCoML+bj4SusjCtnLTFrt9dnnoLX2+hfj0VIHzx5Mij7WNJy75kF8FXcxtQZFbWdJwBpKei4kFb1sujYddzBy6ntjiNTVbJqB9feB6Ypd2l39r+zjE/zph3rjQOtGdefvFuhIZ+Fg01GIFBV/SfIfvzH9KJGQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(8936002)(66946007)(6916009)(76116006)(91956017)(5660300002)(64756008)(4326008)(82960400001)(66476007)(66446008)(36756003)(66556008)(2906002)(478600001)(86362001)(6486002)(71200400001)(41300700001)(316002)(54906003)(38070700005)(186003)(26005)(53546011)(6512007)(6506007)(31696002)(38100700002)(122000001)(83380400001)(8676002)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXpITmM2bXZRcU9kRUdpOWphbXNUeUJkM1JrakR3NVM1WldwVGVIYVhKdk03?=
 =?utf-8?B?OE9pM3NXV2Q5VC9QQlExRXc2bWFPUXhyc0xTeVcxMis5cDdnRnRFUTRvc3Uw?=
 =?utf-8?B?cWllb0p2c2t4VVUvY3Q4bEdGRnI1am52TWFKK2xzSG90cnZINzZnSE1EMWNl?=
 =?utf-8?B?RGQxYVg3ckpWbDM4T2hiaXk5ZVgzMHNaV1lland2d3FnQ2U3YldoRXR3R1hi?=
 =?utf-8?B?MXQzOHEyNXNFaVEyajI2MWx0WUJNbHFlSlhNRkhkNjdBRlkzK09KZ2g2cHVh?=
 =?utf-8?B?cW9tVzdiM21NOS9jbHZ3YTdtV3hNd0l5T2pLMk82alY4cCtYa1MwVGpMNWxM?=
 =?utf-8?B?bWQwaktNMFo1dGQvakxPMUk2RXI5Z2VxQUxoTkRlZE43N05rcnFaazF4TUE5?=
 =?utf-8?B?R2tQTjgwakEzTXJwbFFScnFydVk5R2tWbnBZL0NudmE1dmNLRnBOOTJ0bFRn?=
 =?utf-8?B?WWlpUWRXQWE5cXIrVFJRV2VOYW1PZGtLRHlWNWJFVEVMek9yZmxISVZFVXRk?=
 =?utf-8?B?MDZkWVllOENZR2JDRHJCRk93cFFxNDZpbkRqemhNYlNGa3p6Zk1nMThOL2to?=
 =?utf-8?B?ZndyWmc5UUlKdDRaVjNGM1dZcnNvN1ZCZFZvMCtHWDNibzJtK1ppUjVhR1Rv?=
 =?utf-8?B?blpqT0EzR0psb29KVnRTZm02Vit0RUliSWszQjFOOUZ6RjVYRmRDZ2V3SXM3?=
 =?utf-8?B?eE1KQUFzbk5YR1p4aFhpS0xIbEU2WXlSQjhjZWZsR3ExdVFJM29ib3llSFdw?=
 =?utf-8?B?VElBd3pKd2dyZFdLRC9FVHJuVVlSdlJXQWd5YUptOVlSd1hvTGhwVG1QQlpJ?=
 =?utf-8?B?Y1YrN2t1dEVIQjNvOEJzcFR1ejlrV0Q2M1N6YWdKQlgydjhrN3B1em9QSkMw?=
 =?utf-8?B?NHo1QXNSMVRHTXJmMmJNems3cFE1Nm5BU0NBNjdWK3FrQTVhSlJKYWJtMisx?=
 =?utf-8?B?c1RxYWwzbGtuc1hHenc3cVJXYllPdXNkSFlmaU9jTFVjdmRVWi9mWHlYVnBQ?=
 =?utf-8?B?OUlreDNrSlZnNlRhbzhib2RtVzdLczVZWjFlMDFITXIrRUdXck5pRm1hTTI0?=
 =?utf-8?B?bkh5SnMvekgwUGY3QktrN2lmVDVOei90NWd2a1VoUjhHNkszNWswdWFjZTV2?=
 =?utf-8?B?Yy9EUk9naGVxYlU0UEkwcFJzNnpWaXdkcUt1U05tVlRnOU9PRjVXeFFJdlE0?=
 =?utf-8?B?dks1bkYvYTl5T09sNDFnQVAzTWVyc2krK1ZMd2ZmRm9vby9BYmZRaFJmOWlJ?=
 =?utf-8?B?ZjlnRzR0ZzNWeFdkQ3lIbDhvTkp1Tktyd1ZXRjRqc040d1Y5QnduQ2Q1UUFV?=
 =?utf-8?B?c1hSNFlwaWk0WStsYlZCT1cwbjZlcFNvMnNZTlhLNzhTcVdRQk9RUnpqWm51?=
 =?utf-8?B?WnVnTEdpU3R3VzhtaXEvVmsxVDUxdFdDTUh3SGtlVXBiU000d29XVk9hb0Ft?=
 =?utf-8?B?THR1cGFRbGErZlFIVlltS2tJN3AxNW5uQlZJZlB3a21GaDVERmtmSVZneWpU?=
 =?utf-8?B?cVVZM015RGovcEFNQmtmYjFmT1Q0d2NPU0tyaTVJaDc2RittKzRVZ0pESHda?=
 =?utf-8?B?WmoyM0paSWtMaEFQWVNWMFJySDMwOG5VN01Zd3NsclRwLzVxa2F1TUtsbG5v?=
 =?utf-8?B?K1ZQeUdDTFJwRVJLeWcwOHcwOS8wbTN6UFFNVDlZbEs1Qis4ODArcXk5djFo?=
 =?utf-8?B?alVDQTNzdkNuRXE3cU5ySmUva3hybDVQNDRXQTJTcGpmdTBoV0RocWdwdzgx?=
 =?utf-8?B?S2hhVjRuaXZ3MGp0c0lVVFBFbWNuTXZEMUJjZmF0NitNaStTbm9mUW03N0hz?=
 =?utf-8?B?M1V4dElJNGcvblo4bTc3Z05vdDlPbmtiVHBKa2M4RU1VeFFTZER2d0g0Wjkx?=
 =?utf-8?B?VXpsNTFRQkN5MGlQSURiTHN2bTB1bjA0ckt1OFVJdFI5NU1jZ2JhZEhBWWlG?=
 =?utf-8?B?NzQ2NHVHUU5kblNHdjJJZ3h4bmg2TktDVUgwRFVlNkN0UzdGNGNrZTVmNmY4?=
 =?utf-8?B?bnVBTUZQM0FiWlN5c3JKUTF5Y2ZjMXh3cVNFMFFIdStmSkNBWGVYd0VKTnRB?=
 =?utf-8?B?VFoxdkRNYis3N0M5LzllVnk5MDV2Q2srRFVsQlJsdVhEazI2WFdETnljd2Y5?=
 =?utf-8?B?QnpxT3RoYm5HRGpzR2oza0txUzZLUWNkQm9GUC8zR1JEWFdhbmpLSENubTlK?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7120D662B08B94480C9CC00DA46305E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FLtX1TkEsRhnEaCUJzt/KjrIClBPi+hYgWOCSmhR3mtKK/7eGbt2UCfrCfKdPa84yDlMVWIak5rfd+euNC0c/SePEQ0LKgc+orMqOtP/F1NCwGHpWbTygkrmBEoX95vHgl5puf3cjaU+X2KK+qwHtT70YkRkJoQwnF9mZiBLFHVfnmEWHIgs2LWpkV1oezTDTJxb0uvTjviNvB6IiNxZzkIF1rjNYuPWRvx8VqktxWl+fXZKnQwTlVu2r9/GKmLYXUqLO4PB0heSuUCNFTYQmdn+Faho50tPAsdBbgWlny0FHKvx7mHybXuokFS7yG3j6zJVTpFqOPWRcws1wxb84qEdyUpgOhodfyTIgJwUPdqq+i5YR0qtaFjOHtzrkRk/G5vNUhQRHHNWIyNWhsjBl/E7B9tnPAOZBzZGHt6bKhhWEhp+TichQ7FV5j1HOG0f9+OR5h/Xt1qyS7kJswHMdv+yQbZDVH1SdbWxcx2O5NiYDJZlMEjmUTN6ghF3KKjff2YwHg20WpwalJSD3pyo3ygI26+oe2bAQVsevqLe+7ZxBnl83c/Bmf4GJlokKgUl4OT2lsg51mJdZX/hruIFnpm0DT0UP0u2kJ2Mfh6JQ5H9jGgWkPSYuDr0tvv+5KaNibVoKjRHOJrewHnW9cDVw56tVSDbxcSFVm9aNcjR4lwwtyACcv/gbH3F7fHKFf8j3nR0+vldU1fshsMAhanmikSW9UrWPlTUvQEv01abbIO6MFn8/rrKFci+Q6KR6QxcYg5fqKy/URc17vsTBbDLcRhNOkegHtaeg7UW+vNmakTTQFByTq62sZiy/5qtdkcqqYBLhUGdwrzs5xKcbWCrvyUOu8Ns+JmXDZUrRCU24iM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 013086ed-176d-4b4c-ef3e-08dafb125583
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 18:15:38.8883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 13DFUMIwraVtTzRE/NfbdCJBkRSslxO5zdQr/QcrfLTf4QW4oxmMQqqNotgQ2knHDnm5PTV8i+IlbzMREcQx2qMBcSPdIW7/OEoeuN0/M0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5249

T24gMTgvMDEvMjAyMyA5OjU1IGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTcuMDEuMjAy
MyAyMzowNCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDE5LzEwLzIwMjIgODo0MyBhbSwg
SmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gVGhlIHJlZ2lzdHJhdGlvbiBieSB2aXJ0dWFsL2xpbmVh
ciBhZGRyZXNzIGhhcyBkb3duc2lkZXM6IEF0IGxlYXN0IG9uDQo+Pj4geDg2IHRoZSBhY2Nlc3Mg
aXMgZXhwZW5zaXZlIGZvciBIVk0vUFZIIGRvbWFpbnMuIEZ1cnRoZXJtb3JlIGZvciA2NC1iaXQN
Cj4+PiBQViBkb21haW5zIHRoZSBhcmVhcyBhcmUgaW5hY2Nlc3NpYmxlIChhbmQgaGVuY2UgY2Fu
bm90IGJlIHVwZGF0ZWQgYnkNCj4+PiBYZW4pIHdoZW4gaW4gZ3Vlc3QtdXNlciBtb2RlLg0KPj4g
VGhleSdyZSBhbHNvIGluYWNjZXNzaWJsZSBpbiBIVk0gZ3Vlc3RzICh4ODYgYW5kIEFSTSkgd2hl
biBNZWx0ZG93bg0KPj4gbWl0aWdhdGlvbnMgYXJlIGluIHBsYWNlLg0KPiBJJ3ZlIGFkZGVkIHRo
aXMgZXhwbGljaXRseSwgYnV0IC4uLg0KPg0KPj4gQW5kIGxldHMgbm90IGdldCBzdGFydGVkIG9u
IHRoZSBtdWx0aXR1ZGUgb2YgbGF5ZXJpbmcgdmlvbGF0aW9ucyB0aGF0IGlzDQo+PiBndWVzdF9t
ZW1vcnlfcG9saWN5KCkgZm9yIG5lc3RlZCB2aXJ0LsKgIEluIGZhY3QsIHByb2hpYml0aW5nIGFu
eSBmb3JtIG9mDQo+PiBtYXAtYnktdmEgaXMgYSBwZXJxdWlzaXRlIHRvIGFueSByYXRpb25hbCBh
dHRlbXB0IHRvIG1ha2UgbmVzdGVkIHZpcnQgd29yay4NCj4+DQo+PiAoSW4gZmFjdCwgdGhhdCBp
bmZyYXN0cnVjdHVyZSBuZWVkcyBwdXJnaW5nIGJlZm9yZSBhbnkgb3RoZXINCj4+IGFyY2hpdGVj
dHVyZSBwaWNrIHVwIHN0dWJzIHRvby4pDQo+Pg0KPj4gVGhleSdyZSBhbHNvIGluYWNjZXNzaWJs
ZSBpbiBnZW5lcmFsIGJlY2F1c2Ugbm8gYXJjaGl0ZWN0dXJlIGhhcw0KPj4gaHlwZXJ2aXNvciBw
cml2aWxlZ2UgaW4gYSBub3JtYWwgdXNlci9zdXBlcnZpc29yIHNwbGl0LCBhbmQgeW91IGRvbid0
DQo+PiBrbm93IHdoZXRoZXIgdGhlIG1hcHBpbmcgaXMgb3ZlciBzdXBlcnZpc29yIG9yIHVzZXIg
bWFwcGluZywgYW5kDQo+PiBzZXR0aW5ncyBsaWtlIFNNQVAvUEFOIGNhbiBjYXVzZSB0aGUgcGFn
ZXdhbGsgdG8gZmFpbCBldmVuIHdoZW4gdGhlDQo+PiBtYXBwaW5nIGlzIGluIHBsYWNlLg0KPiAu
Li4gSSdtIG5vdyBtZXJlbHkgc2F5aW5nIHRoYXQgdGhlcmUgYXJlIHlldCBtb3JlIHJlYXNvbnMs
IHJhdGhlciB0aGFuDQo+IHRyeWluZyB0byBlbnVtZXJhdGUgdGhlbSBhbGwuDQoNClRoYXQncyBm
aW5lLsKgIEkganVzdCB3YW50ZWQgdG8gcG9pbnQgb3V0IHRoYXQgaXRzIGZhciBtb3JlIHJlYXNv
bnMgdGhhdA0Kd2VyZSBnaXZlbiB0aGUgZmlyc3QgdGltZSBhcm91bmQuDQoNCj4+PiBJbiBwcmVw
YXJhdGlvbiBvZiB0aGUgaW50cm9kdWN0aW9uIG9mIG5ldyB2Q1BVIG9wZXJhdGlvbnMgYWxsb3dp
bmcgdG8NCj4+PiByZWdpc3RlciB0aGUgcmVzcGVjdGl2ZSBhcmVhcyAob25lIG9mIHRoZSB0d28g
aXMgeDg2LXNwZWNpZmljKSBieQ0KPj4+IGd1ZXN0LXBoeXNpY2FsIGFkZHJlc3MsIGZsZXNoIG91
dCB0aGUgbWFwL3VubWFwIGZ1bmN0aW9ucy4NCj4+Pg0KPj4+IE5vdGV3b3J0aHkgZGlmZmVyZW5j
ZXMgZnJvbSBtYXBfdmNwdV9pbmZvKCk6DQo+Pj4gLSBhcmVhcyBjYW4gYmUgcmVnaXN0ZXJlZCBt
b3JlIHRoYW4gb25jZSAoYW5kIGRlLXJlZ2lzdGVyZWQpLA0KPj4gV2hlbiByZWdpc3RlciBieSBH
Rk4gaXMgYXZhaWxhYmxlLCB0aGVyZSBpcyBuZXZlciBhIGdvb2QgcmVhc29uIHRvIHRoZQ0KPj4g
c2FtZSBhcmVhIHR3aWNlLg0KPiBXaHkgbm90PyBXaHkgc2hvdWxkbid0IGRpZmZlcmVudCBlbnRp
dGllcyBiZSBwZXJtaXR0ZWQgdG8gcmVnaXN0ZXIgdGhlaXINCj4gYXJlYXMsIG9uZSBhZnRlciB0
aGUgb3RoZXI/IFRoaXMgYXQgdGhlIHZlcnkgbGVhc3QgcmVxdWlyZXMgYSB3YXkgdG8NCj4gZGUt
cmVnaXN0ZXIuDQoNCkJlY2F1c2UgaXQncyB1c2VsZXNzIGFuZCBleHRyYSBjb21wbGV4aXR5LsKg
IEZyb20gdGhlIHBvaW50IG9mIHZpZXcgb2YNCmFueSBndWVzdCwgaXRzIGFuIE1NSU8oaXNoKSB3
aW5kb3cgdGhhdCBYZW4gaGFwcGVucyB0byB1cGRhdGUgdGhlDQpjb250ZW50IG9mLg0KDQpZb3Ug
ZG9uJ3QgZ2V0IHN5c3RlbXMgd2hlcmUgeW91IGNhbiBhc2sgaGFyZHdhcmUgZm9yIGUuZy4gImFu
b3RoZXIgY29weQ0Kb2YgdGhlIEhQRVQgYXQgbWZuICRmb28gcGxlYXNlIi4NCg0KPj4gVGhlIGd1
ZXN0IG1hcHMgb25lIE1NSU8tbGlrZSByZWdpb24sIGFuZCB0aGVuIGNvbnN0cnVjdHMgYWxsIHRo
ZSByZWd1bGFyDQo+PiB2aXJ0dWFsIGFkZHJlc3NlcyBtYXBwaW5nIGl0IChvciBub3QpIHRoYXQg
aXQgd2FudHMuDQo+Pg0KPj4gVGhpcyBBUEkgaXMgbmV3LCBzbyB3ZSBjYW4gZW5mb3JjZSBzYW5l
IGJlaGF2aW91ciBmcm9tIHRoZSBvdXRzZXQuwqAgSW4NCj4+IHBhcnRpY3VsYXIsIGl0IHdpbGwg
aGVscCB3aXRoIC4uLg0KPj4NCj4+PiAtIHJlbW90ZSB2Q1BVLXMgYXJlIHBhdXNlZCByYXRoZXIg
dGhhbiBjaGVja2VkIGZvciBiZWluZyBkb3duICh3aGljaCBpbg0KPj4+ICAgcHJpbmNpcGxlIGNh
biBjaGFuZ2UgcmlnaHQgYWZ0ZXIgdGhlIGNoZWNrKSwNCj4+PiAtIHRoZSBkb21haW4gbG9jayBp
cyB0YWtlbiBmb3IgYSBtdWNoIHNtYWxsZXIgcmVnaW9uLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+IC0tLQ0KPj4+IFJGQzogQnkg
dXNpbmcgZ2xvYmFsIGRvbWFpbiBwYWdlIG1hcHBpbmdzIHRoZSBkZW1hbmQgb24gdGhlIHVuZGVy
bHlpbmcNCj4+PiAgICAgIFZBIHJhbmdlIG1heSBpbmNyZWFzZSBzaWduaWZpY2FudGx5LiBJIGRp
ZCBjb25zaWRlciB0byB1c2UgcGVyLQ0KPj4+ICAgICAgZG9tYWluIG1hcHBpbmdzIGluc3RlYWQs
IGJ1dCB0aGV5IGV4aXN0IGZvciB4ODYgb25seS4gT2YgY291cnNlIHdlDQo+Pj4gICAgICBjb3Vs
ZCBoYXZlIGFyY2hfeyx1bn1tYXBfZ3Vlc3RfYXJlYSgpIGFsaWFzaW5nIGdsb2JhbCBkb21haW4g
cGFnZQ0KPj4+ICAgICAgbWFwcGluZyBmdW5jdGlvbnMgb24gQXJtIGFuZCB1c2luZyBwZXItZG9t
YWluIG1hcHBpbmdzIG9uIHg4Ni4gWWV0DQo+Pj4gICAgICB0aGVuIGFnYWluIG1hcF92Y3B1X2lu
Zm8oKSBkb2Vzbid0IGRvIHNvIGVpdGhlciAoYWxiZWl0IHRoYXQncw0KPj4+ICAgICAgbGlrZWx5
IHRvIGJlIGNvbnZlcnRlZCBzdWJzZXF1ZW50bHkgdG8gdXNlIG1hcF92Y3B1X2FyZWEoKSBhbnl3
YXkpLg0KPj4gLi4uIHRoaXMgYnkgcHJvdmlkaW5nIGEgYm91bmQgb24gdGhlIGFtb3VudCBvZiB2
bWFwKCkgc3BhY2UgY2FuIGJlIGNvbnN1bWVkLg0KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJz
dGFuZC4gV2hlbiByZS1yZWdpc3RlcmluZyBhIGRpZmZlcmVudCBhcmVhLCB0aGUNCj4gZWFybGll
ciBvbmUgd2lsbCBiZSB1bm1hcHBlZC4gVGhlIGNvbnN1bXB0aW9uIG9mIHZtYXAgc3BhY2UgY2Fu
bm90IGdyb3cNCj4gKG9yIGVsc2Ugd2UnZCBoYXZlIGEgcmVzb3VyY2UgbGVhayBhbmQgaGVuY2Ug
YW4gWFNBKS4NCg0KSW4gd2hpY2ggY2FzZSB5b3UgbWVhbiAiY2FuIGJlIHJlLXJlZ2lzdGVyZWQg
ZWxzZXdoZXJlIi7CoCBNb3JlDQpzcGVjaWZpY2FsbHksIHRoZSBhcmVhIGNhbiBiZSBtb3ZlZCwg
YW5kIGlzbid0IGEgc2luZ2xldG9uIG9wZXJhdGlvbg0KbGlrZSBtYXBfdmNwdV9pbmZvIHdhcy4N
Cg0KVGhlIHdvcmRpbmcgYXMgcHJlc2VudGVkIGZpcm1seSBzdWdnZXN0cyB0aGUgcHJlc2VuY2Ug
b2YgYW4gWFNBLg0KDQo+Pj4gUkZDOiBJbiBtYXBfZ3Vlc3RfYXJlYSgpIEknbSBub3QgY2hlY2tp
bmcgdGhlIFAyTSB0eXBlLCBpbnN0ZWFkIC0ganVzdA0KPj4+ICAgICAgbGlrZSBtYXBfdmNwdV9p
bmZvKCkgLSBzb2xlbHkgcmVseWluZyBvbiB0aGUgdHlwZSByZWYgYWNxdWlzaXRpb24uDQo+Pj4g
ICAgICBDaGVja2luZyBmb3IgcDJtX3JhbV9ydyBhbG9uZSB3b3VsZCBiZSB3cm9uZywgYXMgYXQg
bGVhc3QNCj4+PiAgICAgIHAybV9yYW1fbG9nZGlydHkgb3VnaHQgdG8gYWxzbyBiZSBva2F5IHRv
IHVzZSBoZXJlIChhbmQgaW4gc2ltaWxhcg0KPj4+ICAgICAgY2FzZXMsIGUuZy4gaW4gQXJnbydz
IGZpbmRfcmluZ19tZm4oKSkuIHAybV9pc19wYWdlYWJsZSgpIGNvdWxkIGJlDQo+Pj4gICAgICB1
c2VkIGhlcmUgKGxpa2UgYWx0cDJtX3ZjcHVfZW5hYmxlX3ZlKCkgZG9lcykgYXMgd2VsbCBhcyBp
bg0KPj4+ICAgICAgbWFwX3ZjcHVfaW5mbygpLCB5ZXQgdGhlbiBhZ2FpbiB0aGUgUDJNIHR5cGUg
aXMgc3RhbGUgYnkgdGhlIHRpbWUNCj4+PiAgICAgIGl0IGlzIGJlaW5nIGxvb2tlZCBhdCBhbnl3
YXkgd2l0aG91dCB0aGUgUDJNIGxvY2sgaGVsZC4NCj4+IEFnYWluLCBhbm90aGVyIGVycm9yIGNh
dXNlZCBieSBYZW4gbm90IGtub3dpbmcgdGhlIGd1ZXN0IHBoeXNpY2FsDQo+PiBhZGRyZXNzIGxh
eW91dC7CoCBUaGVzZSBtYXBwaW5ncyBzaG91bGQgYmUgcmVzdHJpY3RlZCB0byBqdXN0IFJBTSBy
ZWdpb25zDQo+PiBhbmQgSSB0aGluayB3ZSB3YW50IHRvIGVuZm9yY2UgdGhhdCByaWdodCBmcm9t
IHRoZSBvdXRzZXQuDQo+IE1lYW5pbmcgd2hhdCBleGFjdGx5IGluIHRlcm1zIG9mIGFjdGlvbiBm
b3IgbWUgdG8gdGFrZT8gQXMgc2FpZCwgY2hlY2tpbmcNCj4gdGhlIFAyTSB0eXBlIGlzIHBvaW50
bGVzcy4gU28gd2l0aG91dCB5b3UgYmVpbmcgbW9yZSBleHBsaWNpdCwgYWxsIEkgY2FuDQo+IHRh
a2UgeW91ciByZXBseSBmb3IgaXMgbWVyZWx5IGEgY29tbWVudCwgd2l0aCBubyBhY3Rpb24gb24g
bXkgcGFydCAobm90DQo+IGV2ZW4gdG8gcmVtb3ZlIHRoaXMgUkZDIHJlbWFyaykuDQoNClRoZXJl
IHdpbGwgYmVjb21lIGEgcG9pbnQgd2hlcmUgaXQgd2lsbCBuZWVkIHRvIGJlY29tZSBwcm9oaWJp
dGVkIHRvDQppc3N1ZSB0aGlzIGFnYWluc3Qgc29tZXRoaW5nIHdoaWNoIGlzbid0IHAybV90eXBl
X3JhbS7CoCBJZiB3ZSBoYWQgYSBzYW5lDQppZGVhIG9mIHRoZSBndWVzdCBwaHlzbWFwLCBJJ2Qg
Z28gYXMgZmFyIGFzIHNheWluZyBFODIwX1JBTSwgYnV0IHRoYXQncw0KY2xlYXJseSBub3QgZmVh
c2libGUgeWV0Lg0KDQpFdmVuIG5vdywgYWJzb2x1dGVseSBub3RoaW5nIGdvb2QgY2FuIHBvc3Np
Ymx5IGNvbWUgb2YgZS5nLiB0cnlpbmcgdG8NCm92ZXJsYXkgaXQgb24gdGhlIGdyYW50IHRhYmxl
LCBvciBhIGdyYW50IG1hcHBpbmcuDQoNCnJhbSB8fCBsb2dkaXJ0eSBvdWdodCB0byBleGNsdWRl
IG1vc3QgY2FzZXMgd2UgY2FyZSBhYm91dCB0aGUgZ3Vlc3QNCihub3QpIHB1dHRpbmcgdGhlIG1h
cHBpbmcuDQoNCn5BbmRyZXcNCg==

