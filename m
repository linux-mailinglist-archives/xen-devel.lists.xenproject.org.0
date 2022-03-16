Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3914DB8D4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 20:24:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291258.494249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUZEm-00074i-0g; Wed, 16 Mar 2022 19:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291258.494249; Wed, 16 Mar 2022 19:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUZEl-00072X-Ta; Wed, 16 Mar 2022 19:23:11 +0000
Received: by outflank-mailman (input) for mailman id 291258;
 Wed, 16 Mar 2022 19:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsrA=T3=citrix.com=prvs=067c1f106=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUZEj-00072R-SX
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 19:23:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 812e1206-a55e-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 20:23:07 +0100 (CET)
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
X-Inumbo-ID: 812e1206-a55e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647458587;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YyJiFnqb2mvWHh6Pi1BTMc8UiOIEWmx0GZL2NWtEag0=;
  b=Abh7pkDsw8dL6ltDvkpK1SW9QZPA/N2mAL049EP9b9A6X4bNOzhsFh0Y
   Ism1401KVysoTK6UKaVgKDPXt9K6scEoCgg6B56Jq5IWnvEAQH1UukUiE
   NC3nVX5GxeNKoYNBkmLQdi/zvpk1kajG7Y75CwLBUe6r0vUsF4QYgTjiL
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66425336
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zY1T4KCaUdaRLRVW/xTjw5YqxClBgxIJ4kV8jS/XYbTApGx332MHn
 GBNWG+AaPuJZzTxKd9zPIji9U0O75GDy9MyQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vg3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhyx
 /FurJWQVT4JYJfNvMZaTAVjSj1XaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4QQayDP
 JFHAdZpRBr5QCUUNwc7MZMvv6SBhn7wTjZajk3A8MLb5ECMlVcsgdABKuH9f9WQQMxPk0Wwp
 2TY/n/4CBUXKNyezzWe9numwOTImEvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2QW8Cczqak59GSwU8LwGRa/pRasoRo0S9dWVeog52mwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhnNzNJiVmkKGsaSyn95O26iyuAnEJBDpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlRtjjg7SF5J+e+QiGSNQ4WzoWbW4v9bRGpyZgnQ5
 SNU8yRyAQ1nMH1sqMBvaLhVdF1Kz6zcWNE5vbKJN8J5n9hK0yT/Fb28GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510kfe6RI68DKCNNIAmjn1NmOmvp3gGiam4hTyFraTRuftnZ
 cfznTiEUB729piLPBLpHrxAgNfHNwg1xH/JRICT8vhU+eH2WZJhcp9caAHmRrlgtMus+VyJm
 /4CZ5ri40gOC4XWP3iImbP/2HhXdBDX87it8JcJHgNCSyI7cFwc5wj5mupwJdY6w/wLyo8lP
 BiVAydl9bY2vlWeQS2iYXF/crL/G5F5qHMwJys3Oli0nXMkZO6SAG03LvPboZFPGDRf8MNJ
IronPort-HdrOrdr: A9a23:Dr9hSajuNFXE30z1DMOo4pTusXBQX3p13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3IwerwRJVpQRvnhPpICRF4B8btYOCUghrWEGgE1/qi/9SAIVywygc578
 ZdmsdFeaXN5DRB/KTHCUyDYqsdKbq8geCVbIXlvgxQpGhRAskKhWoYe2Wm+w9NNXN77PICZc
 ChD6F81l2dkAEsH72G7w4+Lo7+TrPw5ffbSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkiTij5/T8M2T+1v57Sv+/p5WkNzuxp9oH8qXkPUYLT3ql0KBeJlhYbufpzo4ydvfqmrC0e
 O85ivIDf4DrE85TVvF5ycFHDOQiQrG3kWSjWNwR0GT+fARCghKUPapzrgpDCcxo3BQze2Ulp
 g7gl5x/qAnfi8p1k7Glqj1fgAvmUyurXU4l+kPy3RZTIsFcbdU6ZcS5UVPDf47bWjHAa0cYa
 FT5fvnlb1rmJKhHgfkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4EvB/lq
 j5G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJNG6JO1zoGKwOJnqIoZ/q57c+4v2sZfUzvdYPsY
 WEVEkduX85ekroB8HL1JpX8grVSGH4RjjpwtE23ekxhlQ9fsucDcSuciFaryL7mYRsPiTyYY
 fGBK5r
X-IronPort-AV: E=Sophos;i="5.90,187,1643691600"; 
   d="scan'208";a="66425336"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJw2r4XtmMoKdpqtLP5XoLOrOD9Asx3dVV4BBExi7/ga2NxNHs6y26M/eoR7lSZVxpFQxjjchp7Sk7LAF5skdtUEncmd1Ako+/S/qFiv/gj7BWSgzSKD3eAiwHXpQSbImsfXUIaVVpb52cb1OeJ63S9oLoAb7YUOhqApjeIYCdLHgDiyGPE/VMegFb9xAQZpoJc0tA/AJ9xdJ/j9lbuQtLTM9/DF/PFRu/wzaTx/SnfBy8u0jwXPIaVC4yzxkVt8OE9+Q5XZLVjXEYayUCRMPNDhGvP4n0oXpKBGzZ4wqTazWVKDJ2IsCXjjK8v6w7KTKjpOvlkTDBS/vRBKfSuBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyJiFnqb2mvWHh6Pi1BTMc8UiOIEWmx0GZL2NWtEag0=;
 b=JpEwGILQyFmhck9k6rwE9gzMau09NDCw0W3ytre8Kg76haIIYs+Nr0UxL3xGawk9xUDpvNl6nJ9TTE7jRttHQf1Nk7xNrPQgYxB9eqS5gVPYhkRAD9klbae9Vn6qaWd+FNYSV2oGNRL8kd1eGmx7OIa7ArUe1OiVkVcpnWt35RDRwlwkKXTt5tT7CAy1fVc5ZfXHPSjV/lL0QJpIBQu27qf1OSKHArcbAqlhlSGFJnzAJSgNzXncxBuQ/eOiinYrJjnM6qrrldeCl5SLLg9qcF7owCM3KSW+sUpbn7M2Uxq94voURgaC9xLn9HeiKOdz85IxX6TSuSAXfLWzgm23iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyJiFnqb2mvWHh6Pi1BTMc8UiOIEWmx0GZL2NWtEag0=;
 b=LRFP89mFHenQIoB8eIwqIjBDzV3loaNY5GjQIaWi5Ah6YzODF2fNcGhj+9XKM6I1yHzeojr+6E9sIgqMKMAhks5BuAxeV3RHntPSQcrSX4QSDjk1SuRnea5+bmZZDs4kZ9LwRQ44FY79QgFjJNa3KHFuzaRHbUPdv5rYQUD9yIs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Topic: [PATCH] x86/cet: Remove writeable mapping of the BSPs shadow
 stack
Thread-Index: AQHYOI1bRL6jiuzp4UWoineooRKJ46zBsAOAgAC1YIA=
Date: Wed, 16 Mar 2022 19:23:00 +0000
Message-ID: <101d1e70-51c7-036d-c5e2-fd382a2be7a8@citrix.com>
References: <20220315165340.32144-1-andrew.cooper3@citrix.com>
 <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
In-Reply-To: <345b2f17-5fba-5dba-f7f5-c1634fc69a6e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 397e0a45-28ff-45be-977a-08da07826282
x-ms-traffictypediagnostic: SN6PR03MB4078:EE_
x-microsoft-antispam-prvs: <SN6PR03MB4078598796B79066C5396EBFBA119@SN6PR03MB4078.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fp85IrIMMz0krlfDVfijbDCOYubVTnP6aYF7HuyUHQRlM7zGNpHpJtZH9exAZM/1aKFbcqU2KvI3Q45tcibeu46Tq4+yODC6PVzsjx0B8B90sq34fDhIBVljlK1cNJY90IKXQhZaeTaEjm1QNvETamXoa4ZgdDUDZYlgFQZXBENE/BiR4HT18ilyHucj4BprlrE4aUbDJtKgsEriNgO7tdhTXAqsn8TvB8WzgQ5FmvjebeevAmxJTIKwDdDVv5rbSik7P3lePIyFRMmihw4FAwD6yqkIuszKvsd44D4p2d3JN1yAqE3LO9gGAU3LpfhnyjfXvRlR3SUy7iIVywIlOybME8tmipZLqzPqkKG8McqgNn2oyhYBmp4sFzejnQlW5p0+O5cqgh06QJMTp344oInWMJbJmC89LLZRiMb2ACPwOgutyKHgmWFfnpuXA/S/Vsenw2PzJLrwRX5t2pSw6jOle5IlDZ4Bk8gFjE3YzKxpdNJFtiliTq66Vpiknfxix4hdzfWGRu778yPGks7RPXAcfhcl8OFuxLXRc7EDzUkXWiMO5wuDJdWXlCcSkWu2CRhey1V7icq1xTJiUQxUZ68cOHRQdW43G4T3+liSYvUY/SW40X7G/kM91y/8g0i1MbfK5g0/7sMeIcmNzKhiyl0iXeEZuWESE3PvHJtJp8g8NMtDThGZGPlAm5WpDl+wDcfrJHAGuYYCzCLfhoa5NJAQoZIlVUeIsm+rukrvmCWsNbKLK8bimIR6JlBQcEKv13W19hks+CZD03QSMEXPfA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(38070700005)(186003)(26005)(83380400001)(36756003)(31686004)(2906002)(5660300002)(8936002)(64756008)(54906003)(66476007)(66446008)(6916009)(66946007)(76116006)(508600001)(66556008)(91956017)(8676002)(53546011)(2616005)(31696002)(6512007)(316002)(6506007)(86362001)(82960400001)(38100700002)(122000001)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVlLK1ZZMG5jK3UxcDFhdVBkNlVKa3d4UnZvd0dkSUtNQ2ZFcVMvbXNVcmsy?=
 =?utf-8?B?VURwdm5jUHY5SURkWEIwb3VOVjVOaU1QWFkzeURtbllkLzExbTI5U1ZrOTU1?=
 =?utf-8?B?NHNmcnhwMjJSdG1PRERlczJNSU9WMUNpQVF6TUNST0FrN0Q4N0dlOU9jVncr?=
 =?utf-8?B?QkJxWXViVVJRQWdvZDl2cVpYNnY5U2V3SVVBWHNEN3hJYkVadFpNbWtRRnZa?=
 =?utf-8?B?MkRBT1ZZUWN6V1lNRDgydXVicVd4YjIzNzZDUGVKWUNvMTVRb3Q3ZHFSWWNH?=
 =?utf-8?B?RUhnWEFwKzVicWZjVnBhZzZOUi9tSHZhNW5tUWloYld1bjZwRUg5MXY2Rmps?=
 =?utf-8?B?TkxxT1VyM0Zwc2JQWEwzUWVzWDArS3VDckpWOE5YWHM1UDZMWG81Tkh2VXdo?=
 =?utf-8?B?Nmh6ZHlvcHpYcHBGQ2JIU2JkcmV0eWNRRXVWSFpickxSVXo4em13b2YyM1Uz?=
 =?utf-8?B?bmJlNFhYMUVaVlVYSlBDaTE1bEQrQjVFdDRNeFF0blNhK0J0eTRtUmdzNHF4?=
 =?utf-8?B?c2w2SGhpbGVBaHpIckFjZzV6MXZuaGlscG1XdFo5eGJpUFlRYndqZzBnZDVX?=
 =?utf-8?B?N3BmMUlwNzJVZmRCNVhRVTVMdThoZlgveWtDaCtoYWFNZ0YrT2o0ZUJtN2hn?=
 =?utf-8?B?VEZtc1RQT3lVR3ZkME1JaDJRYnp4Y2Z6T2dqRVpIWUNRTDE4YndSWmRvT0Fx?=
 =?utf-8?B?dEszcm1LcFZralJkL2lSQ3lzckV6OTRDeERDempxUXY2Q2tpR1NDQzJjMEQ1?=
 =?utf-8?B?ektWNWRIMTllUGJhcEhQZUxDNVF1bUtlZ0N0K2dsMEEvbURpMjhYTjM4TVRv?=
 =?utf-8?B?K1ozdGMzcHVCSWxWUVEvUitRMEIrVEFmd1Q5TVFWZmVwODMzUUh6RXpGbG1v?=
 =?utf-8?B?dS9sYnFzZkdDcm5IUlJmd3lqd2JWTElLUnp1Mm1DWXVEY2NhV3R6YnNsTDls?=
 =?utf-8?B?R201RHNLOEpKT1Y3cWZ3Y2hRWlk0d0ZxenVDUkhwdXY5bnMwYy9pc1FBVFRK?=
 =?utf-8?B?T3oyc2g1dG40aGFXME0wblJrQ1JNVkFEM2MrS3dxSFBhWkJQaG83WWoydllR?=
 =?utf-8?B?azcwTWdSSTZYMVFJVXRkYWtITkZZMkVneWtoNGFJMHhOMERzM1RtWVhhZUdF?=
 =?utf-8?B?Y3VsZnFZVDZpSWNWUmExbzR6UWdrN3g5dHBncW8ra2Z3TW9SL09BcWpqL21X?=
 =?utf-8?B?YlcxKzdMTGZoQmlkNGM1dFhWZE9KRkRZL3VZVVArNW5WUnlRWTJJTVlaakZi?=
 =?utf-8?B?TWVpaW8vcnYwMEJSQ095QXlEaGFLcXZkcmkwMG5PNEZITlJhV2d5eUUxbWJF?=
 =?utf-8?B?eHFQRDVSWGhsdFIzTkhVL2VvejJITHRJVXpCakJEQmhSSjcrajJheHcza2FV?=
 =?utf-8?B?OVBlZlNzMW9ERjZRRjhDM0dHeHpFM01WVWNFZWRxYngySFl1REpoUGhscHVT?=
 =?utf-8?B?Rit4NlJ1Rll4aDhjaWZxaDEyd0N0RUh3Tk9vOCtPcytVSTlNbUJsay8rSnAv?=
 =?utf-8?B?dTdzVE5RZWpJOENLSkp5dzcycWpGL0YyUnRneXVzVEplWitJeGRUSWViaFZS?=
 =?utf-8?B?YUtBMTB3VThPKzhPbnRSaFFCK3JkemlOSnZnOWtmdTZZMDBmb0pudUxQQm4w?=
 =?utf-8?B?eFJCOWQ3SDR3RGJ2K1hkOWwwY0lRRFVSNWsvU2ptYXVxNWl5eWFYakJtWDF1?=
 =?utf-8?B?UXlTOTdpelRnaUI3WFc2Wi9sWlBJZVdlWUVPdjQ1WFdqdEcyNVAreUMrbzFh?=
 =?utf-8?B?VU1XYktnWHhZM042bEdVd0NmVzRuTU5McmdXaEJaWXpQRGlmZmRaT1g1RlI4?=
 =?utf-8?B?Vi9LdnhiQVQ1QnZnRmh0SklPalNzVW1NK3VwcG1aVERtd21jYnN4bkorWHNG?=
 =?utf-8?B?S200VVB2eStlM05Id2RhRmxoTDVmN0ZlNjdyYkUwZWdJMEVQdGJlUHBWaVl4?=
 =?utf-8?Q?9e2jp0PPWMKu3mE1u+OQeuqX+kZMV4eD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F8A9B5A7C72FC4BB1F512F04308CED6@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397e0a45-28ff-45be-977a-08da07826282
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 19:23:00.3558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9DGvcQciPeEXwFQHQaM8xZsBtH7G+DR80r50XHKEe+wDjWTm5l4j/pZLsde6vjhYqrwcInzjs+T18W3+Aib+db6QCu1qOjIRghySn5yStUc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4078
X-OriginatorOrg: citrix.com

T24gMTYvMDMvMjAyMiAwODozMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE1LjAzLjIwMjIg
MTc6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBBbiB1bmludGVuZGVkIGNvbnNlcXVlbmNl
IG9mIHRoZSBCU1AgdXNpbmcgY3B1MF9zdGFja1tdIGlzIHRoYXQgd3JpdGVhYmxlDQo+PiBtYXBw
aW5ncyB0byB0aGUgQlNQcyBzaGFkb3cgc3RhY2tzIGFyZSByZXRhaW5lZCBpbiB0aGUgYnNzLiAg
VGhpcyByZW5kZXJzDQo+PiBDRVQtU1MgYWxtb3N0IHVzZWxlc3MsIGFzIGFuIGF0dGFja2VyIGNh
biB1cGRhdGUgYm90aCByZXR1cm4gYWRkcmVzc2VzIGFuZCB0aGUNCj4+IHJldCB3aWxsIG5vdCBm
YXVsdC4NCj4+DQo+PiBXZSBzcGVjaWZpY2FsbHkgZG9uJ3Qgd2FudCB0aGUgc2hhdHRlciB0aGUg
c3VwZXJwYWdlIG1hcHBpbmcgLmRhdGEvLmJzcywgc28NCj4+IHRoZSBvbmx5IHdheSB0byBmaXgg
dGhpcyBpcyB0byBub3QgaGF2ZSB0aGUgQlNQIHN0YWNrIGluIHRoZSBtYWluIFhlbiBpbWFnZS4N
Cj4+DQo+PiBCcmVhayBjcHVfYWxsb2Nfc3RhY2soKSBvdXQgb2YgY3B1X3NtcGJvb3RfYWxsb2Mo
KSwgYW5kIGR5bmFtaWNhbGx5IGFsbG9jYXRlDQo+PiB0aGUgQlNQIHN0YWNrIGFzIGVhcmx5IGFz
IHJlYXNvbmFibGUgaW4gX19zdGFydF94ZW4oKS4gIEFzIGEgY29uc2VxdWVuY2UsDQo+PiB0aGVy
ZSBpcyBubyBuZWVkIHRvIGRlbGF5IHRoZSBCU1AncyBtZW1ndWFyZF9ndWFyZF9zdGFjaygpIGNh
bGwuDQo+Pg0KPj4gQ29weSB0aGUgdG9wIG9mIGNwdSBpbmZvIGJsb2NrIGp1c3QgYmVmb3JlIHN3
aXRjaGluZyB0byB1c2UgdGhlIG5ldyBzdGFjay4NCj4+IEZpeCBhIGxhdGVudCBidWcgYnkgc2V0
dGluZyAlcnNwIHRvIGluZm8tPmd1ZXN0X2NwdV91c2VyX3JlZ3MgcmF0aGVyIHRoYW4NCj4+IC0+
ZXM7IHRoaXMgd291bGQgYmUgYnVnZ3kgaWYgcmVpbml0X2JzcF9zdGFjaygpIGNhbGxlZCBzY2hl
ZHVsZSgpICh3aGljaA0KPj4gcmV3cml0ZXMgdGhlIEdQUiBibG9jaykgZGlyZWN0bHksIGJ1dCBs
dWNraWx5IGl0IGRvZXNuJ3QuDQo+IFdoaWxlIEkgZG9uJ3QgbWluZCB0aGUgY2hhbmdlLCBJIGFs
c28gZG9uJ3QgdmlldyB0aGUgb3JpZ2luYWwgY29kZSBhcw0KPiBsYXRlbnRseSBidWdneS4gKEp1
c3QgYSByZW1hcmssIG5vdCBhIHJlcXVlc3QgdG8gY2hhbmdlIGFueXRoaW5nLikNCg0KVGhpcyBp
cyBwcmFjdGljYWxseSBhIHRleHRib29rIGRlZmluaXRpb24gb2YgYSBsYXRlbnQgYnVnLsKgIFVz
aW5nIG9uZSBvZg0KYSBudW1iZXIgb2YgZnVuY3Rpb25zIGluIFhlbiB3aWxsIGVpdGhlciByZWFk
IHV0dGVyIGdhcmJhZ2Ugb2ZmIHRoZQ0Kc3RhY2ssIG9yIGNsb2JiZXIgdGhlIHN0YWNrIGZyYW1l
IGFuZCBtb3N0IGxpa2VseSBhIHJldHVybiBhZGRyZXNzLCBhbmQNCnRoZSByZWFzb24gdGhpcyBo
YXNuJ3QgZXhwbG9kZWQgaXMgbHVjaywgbm90IGRlc2lnbi4NCg0KPg0KPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3NldHVwLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jDQo+PiBAQCAtMTQ4
LDcgKzE0OCw3IEBAIGNwdW1hc2tfdCBfX3JlYWRfbW9zdGx5IGNwdV9wcmVzZW50X21hcDsNCj4+
ICANCj4+ICB1bnNpZ25lZCBsb25nIF9fcmVhZF9tb3N0bHkgeGVuX3BoeXNfc3RhcnQ7DQo+PiAg
DQo+PiAtY2hhciBfX3NlY3Rpb24oIi5ic3Muc3RhY2tfYWxpZ25lZCIpIF9fYWxpZ25lZChTVEFD
S19TSVpFKQ0KPj4gK2NoYXIgX19zZWN0aW9uKCJpbml0LmJzcy5zdGFja19hbGlnbmVkIikgX19h
bGlnbmVkKFNUQUNLX1NJWkUpDQo+PiAgICAgIGNwdTBfc3RhY2tbU1RBQ0tfU0laRV07DQo+IEkg
Z3Vlc3MgdGhlIHNlY3Rpb24gbmFtZSB3YXMgbWVhbnQgdG8gc3RhcnQgd2l0aCBhIGRvdCwgbWF0
Y2hpbmcNCj4gdGhlIGxpbmtlciBzY3JpcHQgY2hhbmdlPyBZb3Ugc2hvdWxkIGFjdHVhbGx5IGhh
dmUgc2Vlbg0KPiAtLW9ycGhhbi1oYW5kbGluZyBpbiBhY3Rpb24gaGVyZSAuLi4NCg0KSXQgZG9l
cywgbm93IHRoYXQgSSd2ZSByZWJhc2VkIG9uIHN0YWdpbmcuDQoNCg0KPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUw0KPj4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUw0KPj4gQEAg
LTIxNSw4ICsyMTUsOSBAQCBTRUNUSU9OUw0KPj4gICAgfSBQSERSKHRleHQpDQo+PiAgICBERUNM
X1NFQ1RJT04oLmluaXQuZGF0YSkgew0KPj4gICNlbmRpZg0KPj4gKyAgICAgICAuID0gQUxJR04o
U1RBQ0tfU0laRSk7DQo+PiArICAgICAgICooLmluaXQuYnNzLnN0YWNrX2FsaWduZWQpDQo+IE5v
IHJlYWwgbmVlZCBmb3IgdGhlIEFMSUdOKCkgaGVyZSAtIGl0J3MgdGhlIGNvbnRyaWJ1dGlvbnMg
dG8gdGhlDQo+IHNlY3Rpb24gd2hpY2ggb3VnaHQgdG8gY29tZSB3aXRoIHByb3BlciBhbGlnbm1l
bnQuIEltbyBBTElHTigpDQo+IHNob3VsZCBvbmx5IGV2ZXIgYmUgdGhlcmUgYWhlYWQgb2YgYSBz
eW1ib2wgZGVmaW5pdGlvbiwgYXMgb3RoZXJ3aXNlDQo+IHRoZSBzeW1ib2wgbWlnaHQgbm90IG1h
cmsgd2hhdCBpdCBpcyBpbnRlbmRlZCB0byBtYXJrIGR1ZSB0byBwYWRkaW5nDQo+IHdoaWNoIG1p
Z2h0IGJlIGluc2VydGVkLiBTZWUgYWxzbyAwMWZlNGRhNjI0M2IgKCJ4ODY6IGZvcmNlIHN1aXRh
YmxlDQo+IGFsaWdubWVudCBpbiBzb3VyY2VzIHJhdGhlciB0aGFuIGluIGxpbmtlciBzY3JpcHQi
KS4NCj4NCj4gUmVhbGx5IHdlIHNob3VsZCBjb25zaWRlciB1c2luZw0KPg0KPiAgICAgKihTT1JU
X0JZX0FMSUdOTUVOVCguaW5pdC5kYXRhIC5pbml0LmRhdGEuKiAuaW5pdC5ic3MuKikpDQo+DQo+
IFdoaWxlIEkgY2FuIHNlZSB5b3VyIHBvaW50IGFnYWluc3QgZm9yY2luZyBzb3J0aW5nIGJ5IGFs
aWdubWVudA0KPiBnbG9iYWxseSwgdGhpcyB2ZXJ5IGFyZ3VtZW50IGRvZXNuJ3QgYXBwbHkgaGVy
ZSAoYXQgbGVhc3QgdW50aWwNCj4gdGhlcmUgYXBwZWFyZWQgYSB3YXkgZm9yIHRoZSBzZWN0aW9u
IGF0dHJpYnV0ZSBhbmQgLWZkYXRhLXNlY3Rpb25zDQo+IHRvIGFjdHVhbGx5IGludGVyYWN0LCBz
dWNoIHRoYXQgLmluaXQuKiBjb3VsZCBhbHNvIGJlY29tZSBwZXItDQo+IGZ1bmN0aW9uL29iamVj
dCkuDQo+DQo+IFRoZW4gYWdhaW4gLSB0aGlzIGJsb2NrIG9mIHplcm9lcyBkb2Vzbid0IG5lZWQg
dG8gb2NjdXB5IHNwYWNlIGluDQo+IHRoZSBiaW5hcnkuDQoNCkl0IGFscmVhZHkgb2NjdXBpZXMg
c3BhY2UsIGJlY2F1c2Ugb2YgbWtlbGYzMi4NCg0KPiAgSXQgY291bGQgdmVyeSB3ZWxsIGxpdmUg
aW4gYSBAbm9iaXRzIC5pbml0LmJzcyBpbiB0aGUNCj4gZmluYWwgRUxGIGJpbmFyeS4gQnV0IHNh
ZGx5IHRoZSBzZWN0aW9uIGlzbid0IEBub2JpdHMgaW4gdGhlIG9iamVjdA0KPiBmaWxlLCBhbmQg
d2l0aCB0aGF0IHRoZXJlIHdvdWxkIG5lZWQgdG8gYmUgYSB3YXkgdG8gbWFrZSB0aGUgbGlua2Vy
DQo+IGNvbnZlcnQgaXQgdG8gQG5vYml0cyAoYW5kIEknbSB1bmF3YXJlIG9mIHN1Y2gpLiBXaGF0
IHdvdWxkIHdvcmsgaXMNCj4gbmFtaW5nIHRoZSBzZWN0aW9uIC5ic3MuaW5pdC5zdGFja19hbGln
bmVkIChvciBlLmcuDQo+IC5ic3MuLmluaXQuc3RhY2tfYWxpZ25lZCB0byBtYWtlIGl0IGVhc2ll
ciB0byBzZXBhcmF0ZSBpdCBmcm9tDQo+IC5ic3MuKiBpbiB0aGUgbGlua2VyIHNjcmlwdCkgLSB0
aGF0J2xsIG1ha2UgZ2NjIG1hcmsgaXQgQG5vYml0cy4NCg0KTGl2aW5nIGluIC5ic3Mgd291bGQg
cHJldmVudCBpdCBmcm9tIGJlaW5nIHJlY2xhaW1lZC7CoCBXZSd2ZSBnb3Qgc2V2ZXJhbA0KbmFz
dHkgYnVncyBmcm9tIHNob290aW5nIGhvbGVzIGluIHRoZSBYZW4gaW1hZ2UsIGFuZCB0b28gbWFu
eSBzcGVjaWFsDQpjYXNlcyBhbHJlYWR5Lg0KDQpGdXJ0aGVybW9yZSwgd2UncmUgdGFsa2luZyBh
Ym91dCBpbml0ZGF0YSBoZXJlLsKgIFNpemUgaXMgbm90IGEgY29uY2VybiwNCmVzcGVjaWFsbHkg
d2hlbiBpdHMgNy05IG9yZGVycyBvZiBtYWduaXR1ZGUgc21hbGxlciB0aGFuIHR5cGljYWwgc3lz
dGVtcy4NCg0KVGhlIGNob2ljZSBoZXJlIGlzIGJldHdlZW4gYmV0d2VlbiAodGhlb3JldGljYWxs
eSBidXQgbm90IGluIHByYWN0aWNlKQ0KZXh0cmEgc3BhY2Ugb24gZGlzaywgYW5kIG5vdCByZWNs
YWltaW5nIDMyayBvZiBpbml0IGRhdGEgYWZ0ZXIgYm9vdC4NCg0KPj4gLSAgICAgICAuID0gQUxJ
R04oUE9JTlRFUl9BTElHTik7DQo+PiAgICAgICAgIF9faW5pdGRhdGFfY2ZfY2xvYmJlcl9zdGFy
dCA9IC47DQo+IEFzIGEgY29uc2VxdWVuY2UsIHRoaXMgQUxJR04oKSBzaG91bGRuJ3QgZ28gYXdh
eS4gVGhlIG9ubHkgcHJlc2VudA0KPiBjb250cmlidXRpb24gdG8gdGhlIHNlY3Rpb24gaXMgYXMg
bGFyZ2UgYXMgaXRzIGFsaWdubWVudCwgYnV0IHRoYXQncw0KPiBub3QgZ2VuZXJhbGx5IGEgcmVx
dWlyZW1lbnQuDQoNCkl0IHdvdWxkIGFjdHVhbGx5IGJlIGEgc2V2ZXJlIGVycm9yIGZvciB0aGVy
ZSB0byBiZSBhbnl0aGluZyBpbiBoZXJlDQp3aXRoIGxlc3MgdGhhbiBwb2ludGVyIGFsaWdubWVu
dCwgYmVjYXVzZSBvZiBob3cgdGhlIHNlY3Rpb24gZ2V0cw0Kd2Fsa2VkLsKgIEJ1dCBJJ2xsIGtl
ZXAgdGhlIEFMSUdOKCkgaW4uDQoNCn5BbmRyZXcNCg==

