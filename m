Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08445509DF8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 12:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310023.526611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUKq-0001HN-IZ; Thu, 21 Apr 2022 10:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310023.526611; Thu, 21 Apr 2022 10:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhUKq-0001Fo-EV; Thu, 21 Apr 2022 10:46:52 +0000
Received: by outflank-mailman (input) for mailman id 310023;
 Thu, 21 Apr 2022 10:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhUKo-0001Fi-HO
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 10:46:50 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d8efebd-c160-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 12:44:44 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 06:46:44 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4970.namprd03.prod.outlook.com (2603:10b6:5:1e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Thu, 21 Apr
 2022 10:46:41 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 10:46:41 +0000
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
X-Inumbo-ID: 0d8efebd-c160-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650538007;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5RDebL21nm9Zfvjb2bOzHe0uNQB1+hoUytJwNm1mpGo=;
  b=S+TYsmEzc/xE49viIGkPU8QW2VvH8QfgFozrHOrAGNm8voElyxrs8a3z
   eIvymdy9TDhB0prynU4O5I8C5aYF1F6ps7dfOQQio52xItVTcdjmKlA7+
   SVmaVhhbAb0wTy2zGdSa4DZMYI8kbp//mRcYNXV/r5Ui9TQ2+sZ2lryXe
   0=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 68994097
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yXSLQq5COE/2wTXIQwdEOAxRtEvGchMFZxGqfqrLsTDasY5as4F+v
 mdNCjvXPfiKYGKkeY0ibYS1pkoC7ZPVyNJnT1A6/ClkHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YTjWlvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSweB8KNYLXvdg6VjxIEjxuBbJa3J3+dC3XXcy7lyUqclPK6tA3VAQTAtdd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YAhV/chegXdRraT
 +MfZSBic1LrZBpXN01MIJk/gP2plj/0dDgwRFe9+/pmsjSLnVMZPL7FLdCPa+aqSvdvsVvH4
 Ufbpm/1LCpFHYnKodaC2jf27gPVpgv5Uo8PELyz9tZxnUaegGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gDxh0YLR6gedQ20bFDhIbYV+sNdsHGRzk
 FiUg9nuGDpj9qWPTm6Q/auVqjX0PjUJKWgFZmkPSg5tD8TfnbzfRynnFr5LeJNZRPWscd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:bZcHxKxXm0iz2yfQk0sDKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGbf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.90,278,1643691600"; 
   d="scan'208";a="68994097"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANSiPG4+pAXYWq4mIX1UIKtZCABUt7O8ZuASFZFBixQZhfCC2yPS4ouC1Ql1f2uAqDOkj3+u5FSewf+2HspG/kNd/G/Tiy9nizKT/edZpgdLMFlclZsqWu0D1Edg0Kiqw2czeD86E4nhK/u/p0jvIlN2+27jiN2yzIGiMkX+qok7FTXqIn/KO9A4uvh7w5sy9aziIBVAVO4kGarxKwX7zQlirj8WX8Fxmde9nyZhOhj10E/Q+SVIqKJWdFx/hHDVHQGTznFJ/fgnm1YeBhWxa9Mt214Re99WmUzHd9gg3yGIrFRSqjIvGdhG9kuqGMzK88UYdRGJ5wHw+Qgtlx2aOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RDebL21nm9Zfvjb2bOzHe0uNQB1+hoUytJwNm1mpGo=;
 b=B+ywazXD3oDbyu9TqLnBUhQJta4yXFoDW6xbiwV2dMAJ3hL970cww4Ogn4jwlIaWbRJsNBrk5SFcN5jYwjf5diLnmx/++esLKdH+M6J8K1HaYV6pZx7+csiCfbmYBvjOkH2DWTZASw2CDrYXoez4zkZKo9O07lxFEfzUOhzRo0yUHsQFXuRvwHk4XC6W8ummkOCmFmrKIvoH3qThsB0cfiKcfHjx39eewf+KUh7Hf5DfsNOOiQnAoejXbCtL0ypvlPoyDrsiO2KTv0w1gMSaVce3pQ5f+pu1M36U7JVGDxzaqJ1sUQaNpirXQZjUjZrdsGKfMp+SENg2VS2tQ19BQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RDebL21nm9Zfvjb2bOzHe0uNQB1+hoUytJwNm1mpGo=;
 b=l7KMNrFE6wMGLauxd6c1gSDzEq4AdctzDsY/VJdp8fuf9VDT/+KEu4wpBns/rc546vXGJ8iYjB3XhUpPZLMk+n/sNqum75nf3nIVlXaq7f1IK9n5mkfe080tBc3UNs3tjbyYTWryXFySt7LWT4ffXq971i04XaTxTfH2+g5bDWw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/build: make linking work again with ld incapable of
 generating build ID
Thread-Topic: [PATCH] x86/build: make linking work again with ld incapable of
 generating build ID
Thread-Index: AQHYVWwugs+1XSUuI0uKWiHUrdPYw6z6L1EA
Date: Thu, 21 Apr 2022 10:46:41 +0000
Message-ID: <2f59bb2e-178b-942a-2b1d-5245fa77dcba@citrix.com>
References: <971a1a9a-ab4a-38cd-2c20-534846b440f6@suse.com>
In-Reply-To: <971a1a9a-ab4a-38cd-2c20-534846b440f6@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 567ed62c-0cca-49e6-5d22-08da2384383d
x-ms-traffictypediagnostic: DM6PR03MB4970:EE_
x-microsoft-antispam-prvs:
 <DM6PR03MB4970C9216D08BC4FCEBEA4FBBAF49@DM6PR03MB4970.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9T0/khkV4crG5J2d7BSitL8eJm1fvt0rQ16qLMEHdXrGi9IKYO4y9zFp10LBlRHuSYL9VcbVui+QVZJOKoxvIo8ks2h4RVlbZjbW8o1EndZ/Nm9LZ1GBVz7Boz7DYLhuEsgzrWbFFsgtA/7n8c/nNhcu5H7NGU6AQGSXfgO+1f63/QERMuenQbBZkjceXReDVa7eLMz+4fBYwwchGl9MG54rX5pEC+LpPhqZoizkab7/R0XDs43kmYw6AeKjB9+8Z94S1BmyGxrEU6PShuBt0zW8E/vZALNAxNkKHC+u9k2/JJ3M7Np6ehDOTf57n67HAg+mIztHsysYHF5FT+X/wqy4ODdxvr9MasKaz1uNVty7Lqu9rbsmUKWsP4tmYDPH8QzmAsHUpIBY1f6KVK+pgSHGQGS9BBtuV10lBG1/ORgeMf91bEeuNPP9QFbbZopbWc3wf4AxPZXtFPSBIMu0eF9pIaO+zSWE35d3bbO4XWdh7/uLMmQJ1lPrzkmUdGK5n6cML9dQZ47IxA9g67OhZp0tyBpfmtZLxDWsGB0T/zVWvf1H+KxMpf50hDBEL8rVbxUMkOlah3lOuzAzWFOhDuDMPhgspCYn2wIoE1iKyUw+zIyQ6G2iWog5Xgr88iMC4E9XdohrAaAaIiyvcSxXTsS8mf1IXlifqbBdSbi5iPJXC5UxhUYCj/WUJwoNgom3LjmAt22P7L0TYnuZznaO91lLqGggowEFUgo4pS8VapQr+if6hgBstJxiyIw16OpIFvQSh5Z9z0eCtSfrkTDOhg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(4326008)(8676002)(186003)(5660300002)(54906003)(53546011)(26005)(71200400001)(6486002)(110136005)(64756008)(66946007)(66556008)(66476007)(66446008)(36756003)(31686004)(107886003)(76116006)(91956017)(2616005)(8936002)(86362001)(4744005)(122000001)(38100700002)(38070700005)(2906002)(6506007)(6512007)(316002)(31696002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWorc2RnRnhZZEQ3RnZCeUh5aEZhb252cDZjSEV5bmFmeXI3ZzdYL0p5SGgv?=
 =?utf-8?B?WGU5bUNLbDZiZll5MnJDbmpVa1cweEJvMnc3cnU4N2tuWnNYeVZ5S014Q0JD?=
 =?utf-8?B?YzBTR3lxdEJObjQyMG5kL2Q0ai9nWmNXVHVmSSt2MTM2cTVGTW9xeE1hOTZG?=
 =?utf-8?B?VDcyeG5td2RVTlI5YTcwQlhhcnRZbzUxd2F1UFBiMlp0dGhzSUY3aEVsSWJ5?=
 =?utf-8?B?RXhVU21LRUl1cDhkRGpBRkhISUJPRzhQMzR2UWNVdzFJQVpyTitMaEhNWXdQ?=
 =?utf-8?B?VzJlMDNSWnFyNm9LdjI0VEQ2TXhiUU5yREpJQWh3UGtPbmJaUHdkWU1PZUFw?=
 =?utf-8?B?VjlyNm1LZmptNkVlYkV3Tm5kMXpEbWJ5WnBseEM0OEFVQWczNmI2L01ybFVZ?=
 =?utf-8?B?QWJsbmRHQUhvcnk0ZzZsd0RLaDN3cGJtekR1Z1Z6czlSYnQ3LzNOM21WdUhl?=
 =?utf-8?B?bHViSU04aXBpY05HQzB1SjZMNEdHRWlabG15ZzljV2dIeXV4RFp5S2ZvRUx4?=
 =?utf-8?B?MHViSHhLU2FzcXpGNXBNTXFKSDdFMS94T3hyMHJmTmxSK2g3anlFWUVEUVpY?=
 =?utf-8?B?WkVzZVJoOXk1bkhvZjQ3Rk5aSnp6MTIzUTFHTDBrN1M2bHFxbmJCNTZqYUVP?=
 =?utf-8?B?NUtYbWVqamFxQW1BbGptemRod2xyYTMvVXUxM2hhVFRiR2RhWkRpSkNWYTBp?=
 =?utf-8?B?amN5c3VPQkllMjVlVFducGdTSWxyRGxLR0t0ZzFMTUtTZng4Z3R4RzFxYnFT?=
 =?utf-8?B?UnBieEQ2MGFXeVdJWGlBV2RZVzA4Ui9qQ1BjbWtPbHBiZTNCM21nUVFIbk9l?=
 =?utf-8?B?Z0ZRbUllN2lUdStqSmJYQkwrNWhZMEtuc09IUjhWRXgrc3VCSWdCTmY0QnRY?=
 =?utf-8?B?R2c0RU5CTDF2VHZJZCt0Um5FdVF1ekdUaE5QS0Zia3dXZ2orSGZzMDF6dlpu?=
 =?utf-8?B?MFFWV3F6am4wRVVPbE9HNDJwTzZHRjkyYlBBQXpqbndNNXoxNGtERUJLUWgx?=
 =?utf-8?B?Q0hldTZYTWZ1MUI5YlpTR2k3OWIxaE1ZVDdRbEg1WWZubTVia2ljUnJncGF3?=
 =?utf-8?B?NWxxZ0wvZEMyelBsaDdZY21yVW1id0NyR3UyTzQ2bHlzSVpxMGh1RWpzbTNr?=
 =?utf-8?B?bVpTWkM0MGhvWFhETE5EWThpa1laRm5nOTNxbHBlR3lRV3dpS1YwYWIyZHRQ?=
 =?utf-8?B?b2x1UnA3VjNGNHlvYm9sV0RjbmVDRUNqV3Q5Q0FSdlFMWEJMY2NYL3RCSjVV?=
 =?utf-8?B?MjZwN3RJUnduUEt0ZnhSaUJQTjlXa1BtTUhzWGsvR3JBUkpudDJjQWx0MSth?=
 =?utf-8?B?T0FjdzIzeFR2TlgwUkFXTXNqOXZOL29tR3RzZXo0QjJiTmY3T0Z2ejRPNisw?=
 =?utf-8?B?NWhKR1NXSkNEaDQzQU54aGVnbXlud2JvUVg4bHhQV2RJMW1YMGNDNEk4M0xG?=
 =?utf-8?B?cTVEbDNqQ1VoRUZ5dlEzb2taaTVwM29MTUM2RDU1ZVp2VU9MNW5tbldxUTY5?=
 =?utf-8?B?V3RiVWxYU2w3TWhobEJzT242dVBweThBQWI3ZEJCQTZ5TFh3Y3hVM0FuaHp1?=
 =?utf-8?B?N1gzT2kzT3V0V3dMRW5VVWZFVmlFQTJLc0VTS0ZXMjlWQXFyd0pnaUxtUHRS?=
 =?utf-8?B?VUFpMVdTbnlaY0ZBdGVMeHF4VU9wVCswaGphdDlmYVZ5ankyMUxJZndEUm16?=
 =?utf-8?B?ejBtbmdkYUtkL1JicklqMTZocnArZUlNTHpGNHNZZUhkd3cveGkwdVEvTkR2?=
 =?utf-8?B?dzVaRGF1cmxiTWp1RGxQeFhCbmJoWDJ5N0x2bUUxQ2FsU1dxS0hBNVpBd3Fh?=
 =?utf-8?B?alUwTUpvZXpJdU5tMTVadU1oNUp5TkxxLzlZR3FyR2VMZ2JoZHN3M21jcGQ3?=
 =?utf-8?B?ZVFHVCtMSkxtWVdwZUc4dEszcjVTOTUxaWJoVmZQRnQ4OE5tRC96YXZOenIr?=
 =?utf-8?B?U0txT2Z5OWY2cG5sNGZnVmR0NFhpVEM4YzdQejhYeFNQdm95SEJOTWlsY1pX?=
 =?utf-8?B?ZHFnMDhqaWk2SVJJc0lNc3RBcVBWRTJpTjN5VmxIbFEycmxqbTNmSzRsOW5w?=
 =?utf-8?B?TGNSaWtLQ3pUNVVaTnhhMVlZMzNueXNxakpGVG9wL1NoMHRjSmFsYUc0Z1NB?=
 =?utf-8?B?VE5pbFBnZFR4QnUrdGVpalY2YWc2blVUaHNVQUM1SlRLWEp5NWg1TUxTcmF5?=
 =?utf-8?B?QWtXUFhsMUdOcTUrZ2NLWDEwWUZ0T2twNUxBTVJnc2NMK3M2SHlPMS8vRE9K?=
 =?utf-8?B?SDFkbnR2dmV4TTdXcW5TeEJTV3dtbWl0Rk54TUd5djNqQU1Mb1dzUW9IbDFt?=
 =?utf-8?B?ck5FL0VScnUwY3o1aDY5T1JyM3V3Vzg5eFVjYTlBYXFIa2FFS2VQdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <156C00019D4DC844A4A8AADC4CE29769@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567ed62c-0cca-49e6-5d22-08da2384383d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 10:46:41.2391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8xBILzHzWvYf/vAxjz75m0ckT33fwPUDKXZBUJHQEPs1DWysVPo31yhuHC8CLLYK8iL7RU5dGO+qM+g+N+6//ZQF5UAmgeggYZ1yral0Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970

T24gMjEvMDQvMjAyMiAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSByZXRhaW5pbmcg
b2YgLm5vdGUuKiBpbiBhIFBUX05PVEUgc2VnbWVudCByZXF1aXJlcyBhIG1hdGNoaW5nDQo+IHBy
b2dyYW0gaGVhZGVyIHRvIGJlIHByZXNlbnQgaW4gdGhlIGZpcnN0IHBsYWNlLiBEcm9wIHRoZSBy
ZXNwZWN0aXZlDQo+IGNvbmRpdGlvbmFsIGFuZCBhZGp1c3QgbWtlbGYzMiB0byBkZWFsIHdpdGgg
KGlnbm9yZSkgdGhlIHBvdGVudGlhbGx5DQo+IHByZXNlbnQgYnV0IGVtcHR5IGV4dHJhIHNlZ21l
bnQgKGJ1dCBoYXZlIHRoZSBuZXcgY29kZSBiZSBnZW5lcmljIGJ5DQo+IGRyb3BwaW5nIGFueSBl
eGNlc3MgdHJhaWxpbmcgZW50aXJlbHkgZW1wdHkgc2VnbWVudHMpLg0KPg0KPiBGaXhlczogZGVk
YjBhYTQyYzZkICgieDg2L2J1aWxkOiB1c2UgLS1vcnBoYW4taGFuZGxpbmcgbGlua2VyIG9wdGlv
biBpZiBhdmFpbGFibGUiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0K

