Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B7501BEE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305082.519932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf58T-0001mO-Bg; Thu, 14 Apr 2022 19:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305082.519932; Thu, 14 Apr 2022 19:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf58T-0001jT-7H; Thu, 14 Apr 2022 19:28:09 +0000
Received: by outflank-mailman (input) for mailman id 305082;
 Thu, 14 Apr 2022 19:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nf58R-0001jN-CG
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:28:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00acf739-bc29-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 21:28:04 +0200 (CEST)
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
X-Inumbo-ID: 00acf739-bc29-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649964484;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y8zqh3+zgPXkgwMgdXb2YVMZEeAqe9RHrQMmSlDBnDA=;
  b=Rqd0oPKzRcwMOqpXWxe4JRW7mECOcHy6RgZWUAoi4UUzwO6A7THYjt+B
   rm51JP/5fY37O2CsMR5nXvliFM7cy/BiSXeK/DvpIB9trxOqI97rJU6El
   PKn1Y+Hjkxn+d1iwjrqBsiUn76AS/bkviqXCRsHZX5PAwRnvJv6Lqobud
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69404497
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:mzn/gKiueNCqzi0D7PZMKAnxX161chAKZh0ujC45NGQN5FlHY01je
 htvUG7SPK6Jamv1f95zYdzi80wE7ZaEn9dlHlA4r31gQXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1rR4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YRwMGqHxvPo/bz0GDwJefqQa/Pj5BHfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2szNEicMkIn1lE/FZkuu9qhj3DFfh5Wila4lbUe5FOD5VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPS94zeY9nOnhsfUgDj2HokVEdWQ5vNsxVGe2GEXIBkXTkeg5+m0jFakXNBSI
 FBS/TAhxZXe72TyEIO7BUfh5ifZ4FhMALK8DtHW9imW747Y3iKHJFQgECJiSJ8v6Mtxexklg
 wrhc8zSORRjt7icSHS4/7iSrC+vNSV9EVLudRPoXiNevYC9/dhbYgbnC486TfXr1oGd9STYm
 WjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsK4owGWxFADpU
 J04dy62trFm4XalznLlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYKG+zO
 BaN5VgKufe/2UdGi4ctMupd7Oxwk8Dd+SnNDKiIPrKinLAsHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZKdA5RfClnX82uwyGVH8baSjdb9KgaI6a56ZsqepB/nrQTkeHN/
 3qnXVRfxka5jnrCQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:rzsGE6zE6pZ0qh/GOOtTKrPxoeskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9xYgBspTnuAtjnfZqxz+8X3WBzB8bvYOCFghrQEGgK1+KLqFeMek3DH4ZmpO
 NdmsNFebjN5C1B/KHHCX6DYrIdKbe8gcKVbM7lvgxQZDAvT5slwxZyCw6dHEEzbhJBH4AFGJ
 2V4dcCjya8eFwMB/7LSUUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8DlyxwgoeaTVS2r0vmF
 K13TARp5/T8s1T+CWslFM73K4m2ucJ/+EzRPBl0KAuW0/RY0iTFcFcsva5zUgISamUmSsXeZ
 /30lAd1o1Img/sljTcm2qS5yDwlDkp8HPs0lmenD/qptH4XiszD45biZteaQax0TtpgDhQ6t
 M844uijesfMfoAplWJ2/HYExVx0kakq3srluAey3RZTIsFcbdU6YgS5llcHpsMFD/zrNlPKp
 glMOjMoPJNNV+KZXHQuWdihNSqQ3QoBx+DBkwPoNac3TRalG1wi0EY2MsclHEd849VcegO28
 3UdqBz0L1eRM4faqxwQO8HXMusE2TIBQnBNWqDSG6XY53uExr22u/KCJxc3pDURHXJ9upHpH
 3saiIqiYdpQTOfNSSn5uw4zizw
X-IronPort-AV: E=Sophos;i="5.90,260,1643691600"; 
   d="scan'208";a="69404497"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ea+AF9XuZ1yb1133L90EeNB7GBHfP25r+V8dubaYFCmm/CoCnStW8wfBM3VaDqEkasZucuu+0RPMa66TFQ5uw/kS1FgxseGiXXFfhqPIWeSaNJmfs6TtZvbv/Hvz503LK8kDFvu5L/qeb+saV9peQtuqmgRookYHVijBZ9AkGsH979mobyKTe/i9Ssjr0e4BcgPSsemfOqYxA0ff2j/K4W8nEY1acaeBCE/EFbq/298t56R4rZt9wlsyNQWd86vhpuNAGU1P5bTUXiqn9m3/6lJu34IyjMC/qMaUEEEjbZ1cpgv7g+bQGBDwHZwJ6QDMQWzuOwPvtF1aixs5ui8I4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8zqh3+zgPXkgwMgdXb2YVMZEeAqe9RHrQMmSlDBnDA=;
 b=Ur+MA03VKWE396zHdoIVLVDI7kTCk7cVZgIbTK2GPuHWuy+VOfEPXqeshs+DYbkXf/5xb2RlpMIJsptsekpe+bvnLS+kCpspg2Mpi2NL0RbC3AlNLBt7bnd8lAQlIsoQ7yhSTEbXlFSeUP2hTyfRuoUcSJIUJSj2lHPx5cVLRfuu1dfqwpUOleOjgB+D/SMRzDgrlelLoisADs6byDykbL/9hIIT3pskzbGCbtKJIBq8h80VYu/eeE6n9ITm+3cAAxoKHafF3/auBQXIZliSAC/hs14TavZeyJScPzbMo5fHv+T6E5z51iiC7OThNONRF5GU4dSuhvu8d1S5ZbisNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8zqh3+zgPXkgwMgdXb2YVMZEeAqe9RHrQMmSlDBnDA=;
 b=jCs3GtcMSpyHq0a+QxKMlfVmDgyUl7P5d+fg8CMFSpW1BzrXN65xicRIVwwoNN2TcFbFKLGPCdqSk24s8NRhK+lfJQ+Wu0LpFET3lbUwVepFhWDstG2zeU1eBWaF5kYsAYbFdWGbHUjuELiXNK4U1eG13+W6jaVZw3A2kMnndNA=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 3/3] x86/build: Clean up boot/Makefile
Thread-Topic: [PATCH 3/3] x86/build: Clean up boot/Makefile
Thread-Index: AQHYT/V67Id16NtaEUioBH+FcJmIEKzvrtSAgAAcvQA=
Date: Thu, 14 Apr 2022 19:27:56 +0000
Message-ID: <c65d5641-7c09-ca90-a2fd-9808d02a44df@citrix.com>
References: <20220414114708.4788-1-andrew.cooper3@citrix.com>
 <20220414114708.4788-4-andrew.cooper3@citrix.com>
 <YlhdoQsE10j+VSQg@perard.uk.xensource.com>
In-Reply-To: <YlhdoQsE10j+VSQg@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b82e0ff-aa5d-418b-d95b-08da1e4ce147
x-ms-traffictypediagnostic: SA1PR03MB6385:EE_
x-microsoft-antispam-prvs: <SA1PR03MB63856936189F22E9B49D5C22BAEF9@SA1PR03MB6385.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cGNpuFo/6NDOUdp4Qg+BRLQFMqPwhkQame65GO/qsMxLS0hwnxA/tCB6oN+sF8hz0iIfssV7aqSUFtu5adYxkjR9MlxhkyK7w4A3H+inLRT0qGiTGFITxZsqCQfBcqAC62R+dujRI1DNIyEOTfCaOAS3pqo+njOl7DEUuBWllURs+X+XNY9T1pSs0UUjwCP7WVuipphtELp6qusQftTgbfyLJrane74SyZIjinljXkwBGikhGbxN3qsN2menrF5BBXO2zfH8WPXXGSL0+VZ0FgoKpJV20JJC0EKGf+6Ke5pLflRlw/thUwB7sTAHf8jyOhGFwFiBIwS1SMZh/8riad8iTjeGSA7dr4SoNtqtgbIuyS5gS8kDlQGYGZ8ClSEZs3UsjMSFD7VS1i12vPaVCNlIfeWAIQajsPidfhllklC4jzHrx6/s1n+OqMi5H6lpHs1SxXfEU6QxnDOM2z29oAb7uAZMldrfMTLlj4TDzSc28B9U+GJ2yTBLrgM4/qGDBk8UmDsTfdsI5pIgfDr4aMynoxRqx9NYLCC64WCNtgVAyj9M+9ZRtg4O4LVVL5YRCt0DXPSw1jbBc8TLqKNzMl7tsP+Hd7Cb3rv2p/adaoj5SlbXgOxnbTzAbq2FYqbCDOMY6mUKnf+n9WQYTG1ZozgIlfiVDS5CbBeqD/YLVtwici1cIy2uqetxP5CY49RPDffGIXXZb7sPbaLhexhEfnQcJRFCKi916SUdQP4NRUWwtTtjCamz5yW3bHn6OY9Fwa3qDUm+S9J74R/meOcSaA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(316002)(64756008)(38070700005)(8676002)(6862004)(5660300002)(83380400001)(82960400001)(86362001)(91956017)(53546011)(31696002)(76116006)(6512007)(4326008)(6506007)(26005)(508600001)(66556008)(54906003)(66446008)(38100700002)(6636002)(66476007)(36756003)(186003)(2616005)(71200400001)(31686004)(2906002)(6486002)(8936002)(37006003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yk45aktQY0NkakJpY3IzUFNVVDQwTGJWcUZRcWx3R2crbUxtTlgvdC8zZUVB?=
 =?utf-8?B?UHBIT1ptcHBhVmZqS1dHWlVUblluUUc2Q1ZpWkZnVVpacGtHVkRmeTRKVS9z?=
 =?utf-8?B?a0liQWlSQnBXUVRPY2F6YktvRDlYQmg1MTNpSTl1alhaOFFSZ1YxaXhERlg5?=
 =?utf-8?B?RER5NnFLSFhBVWdyNFB4SlY3N1MwYUpYTW9ZTXFZcUxRc3N5MDFUcm44cDU5?=
 =?utf-8?B?R3prY3p6WWx3SlBIN1RmWXYxR0NtOTMzcHpDa29WSFVTTEhMWEJTZldlSm5y?=
 =?utf-8?B?S3NORU13emg3RGtHdGdnbVdFZmhDcWdWL25KZkV2emJSM3FpczRZcEdjalBu?=
 =?utf-8?B?UlJiMXp4RDRUQnhGWmNNZXphTTJHRXR0SDF4R1dtM1ZjNjlPVDlobThYTUxT?=
 =?utf-8?B?Y0w3UytTRFNQQ0M0WE80c1hRODdJZThKVkJLVlBRd0hpenBLcVpZREpyY1Vu?=
 =?utf-8?B?SEl3ck9abm45YkFodU1lMzNRUkxGU2ZhM282emNDU243WCtCVnY5TnYrMXNm?=
 =?utf-8?B?Zm9jRm90aHJlQzcrVVdqUTBGL2ZrS2pKWGd5Z2YzRUdjVFE0di9KOUFaQTVI?=
 =?utf-8?B?cWp2T2kwM2NDU0tWMGxZeTRxblpVak1LdkhFaDhXbWRrWTJuckc5YnA1akJm?=
 =?utf-8?B?MStpQUtBcndFUDlqTkxid3licDFMNEx4c0pKUGc5dVZrd3VpRktxdzFlb2Jz?=
 =?utf-8?B?Vmg1bUhuZ2RzbDVHTkFFUEUvekpiU0JZUTVQSTNzc0xWampnTnIrWXluYTU2?=
 =?utf-8?B?V2lnM2NMYnlHRGdjcjl2Wk5BeWdDclNVclo2ZjhHcTZWZlhDKzZxazZ6VVJn?=
 =?utf-8?B?RFlHazJIejRUUjZyWFg5U3l3WVJ0c0xVTXpHYVFrenAwQWVIamFBeFluSlEw?=
 =?utf-8?B?UkZqUVFxN2krdjRYbStBVXloVDZsZzluRUlHQXhCbnRrZit2N1htM0Nsc21Q?=
 =?utf-8?B?ODF5L25Ob2RrUkM4OFlsNnVnbnBQdk1GRVpTNlFNV3hMRkgzS0toWWpNYmdJ?=
 =?utf-8?B?NE1aR1BBLzhRRklNaWJ4YW50YTBTTEo3N29zRjIzUWJmemNlUC9aMkV2Y05Z?=
 =?utf-8?B?Tkprc1ZwL1ZsZVU5U0w0ckFZWGdBa2FkbWxUT0cxTTNFQ284Rk1hTTc3cnJw?=
 =?utf-8?B?UHpvakpiaTZBcksxZURjZ29DV3cwTXZWUVlabC8rcmVkM211RTJOMUg2R0xu?=
 =?utf-8?B?QWd0UURHK2c1Vk1MYmljbVhqaWNVbjQyZTBSckwyeFpLUXZXSWJ1a1ZreU1a?=
 =?utf-8?B?eE5WWTY3TjAzblRmVmtSSy85cFVGL2tjdEJmQTNza0xSV2Q0eTkrR2tLZWw0?=
 =?utf-8?B?dEd5Ym1ySmxQeFdudWJuZFoydEJ2RTJMSmF1ams4dzlORXFmQ2d5YnNtV01n?=
 =?utf-8?B?NUJYdHdWQkROYWozSzg2OU5HaFJLQ25xMEMrSGYvRWx1eUJnQVhlamlHYlBQ?=
 =?utf-8?B?d2gzYjhwUzRKa0YyRjJtRW5CRVRBS0t0cU5Da1VHMVhHK2Z5ajNRa1JxenZx?=
 =?utf-8?B?SE9TZmxZMFRPRFhBVzgzT0Nydy8xcE1hczlXY1E3RTR3Uy8vWnVCdDZLdlp0?=
 =?utf-8?B?OFNBNTJHVVBTdXhBd3VtRFR0aEtrc1NhMGl1bEowcjdobjU0SXZ0NCtncnR5?=
 =?utf-8?B?UXdqYkc5TnBEUkgxUEVVaFJUQ3VpZ3B5dEpWS2NUN1BBSnJ5UU15YVJxNDVs?=
 =?utf-8?B?QkFmYTBmcDZLKzJLTWkycGo5NkhJVGRnNDZ3SFNQTklKaVozRnpQbTFzbjRv?=
 =?utf-8?B?L29QaWFONnVVTytSYVd2cExVT1RkTTdUVkhaQ0dmYUtxUlpONWNCNEU4NlFw?=
 =?utf-8?B?R3d6YkRhNW9RdjhVVHhBWHd6dXRkZyt4VG53V0lqTnprM3h2MGtTWlhUQm8v?=
 =?utf-8?B?YUpZMG55VTJneFlFVklpSEJxNlBiK2dPSEk1VzlwV3Q3Sk52WUwvWTVlU242?=
 =?utf-8?B?bGJub0FUcjEwME5WeEovT2dRdE95QTJMWTZ3YmVkdW4vZHdwVnRFRTB4d1Rh?=
 =?utf-8?B?Tnl0MUVHZUVMVmUvbndnWXB0RTk1MURuMGVBa29MOW5obTBoUWF2aEhOa0Zy?=
 =?utf-8?B?WE8rWktOQndhSFZhT0VIRWIzT2hEZ1RzMFZtZ0dHb1AvdDBYdG04aktBTDVM?=
 =?utf-8?B?ZUF6T2dQaWJoYkY1bUhzUUxUOEtRT0VpZmRDSnhld1lKOWpkM2FlWGpodkQ2?=
 =?utf-8?B?ZEtSNGZidGRyZ0ZzaUZGbGVwQ24yaHJDZVpEeFpYZ21oYU1LeU82dVhDVzlB?=
 =?utf-8?B?RlV5Qit1a29aWkpSTUNVNXhaNW4yeEw5QTIybSt2T3Z4eHMxSVBqYnVRZzNw?=
 =?utf-8?B?YU9VVUl0NExVUVYraWJLWXdQZDMyVGFoL2l0NVJhWUdWNFVudU5XQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F929282FBC2E6E42ACCE380A0703F532@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b82e0ff-aa5d-418b-d95b-08da1e4ce147
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 19:27:56.9151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYaWIfFNnGibYBRABR/0BDkPAEyTmRUWfuKxq6AjwIW6/3fH9uTjMipkWAvKO3ReaSUsLH10Vdl4tEBVWPsUtj8zZldc76DUSALrcSIz028=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6385
X-OriginatorOrg: citrix.com

T24gMTQvMDQvMjAyMiAxODo0NSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFRodSwgQXBy
IDE0LCAyMDIyIGF0IDEyOjQ3OjA4UE0gKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBU
aGVyZSBhcmUgbm8gLlMgaW50ZXJtZWRpYXRlIGZpbGVzLCBzbyByZXdvcmsgaW4gdGVybXMgb2Yg
aGVhZC1iaW4tb2Jqcy4NCj4+DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBU
aGUgcGF0Y2ggbG9va3MgZmluZS4NCj4NCj4gUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPg0KPg0KPj4gLS0tDQo+PiBJJ20gc2xpZ2h0bHkgLTEg
b24gdGhpcywgYmVjYXVzZQ0KPj4NCj4+ICAgaGVhZC1iaW4tb2JqcyA6PSAkKGFkZHByZWZpeCAk
KG9iaikvLCQoaGVhZC1iaW4tb2JqcykpDQo+Pg0KPj4gaXMgc3Vic3RhbnRpYWwgb2JmdXNjYXRp
b24gd2hpY2ggSSdkIHByZWZlciB0byBiaW4uDQo+IEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGRv
IHNvbWV0aGluZyB0aGF0IEtidWlsZCBkb2VzLCB3aGljaCB3b3VsZCBiZSB0bw0KPiB0ZWFjaCB0
aGUgYnVpbGQgc3lzdGVtIHRvIGxvb2sgZm9yICIkKGhlYWQtb2JqcykiIG9yIG1heWJlDQo+ICIk
KGhlYWQtYmluLW9ianMpIiB3aGVuIGl0IHdhbnQgdG8gYnVpbGQgImhlYWQubyIuIFRoYXQgc29t
ZXRoaW5nIHRoYXQncw0KPiBkb25lIGluIEtidWlsZCBJIHRoaW5rIHRvIGJ1aWxkIGEgbW9kdWxl
IGZyb20gc2V2ZXJhbCBzb3VyY2UgZmlsZXMuDQo+DQo+PiBBbnRob255OiBXaHkgZG9lcyBkcm9w
cGluZyB0aGUgdGFyZ2V0cyArPSBsaW5lIGludGVyZmVyZSB3aXRoIGluY3JlbWVudGFsDQo+PiBi
dWlsZHM/ICBXaXRoIGl0IGdvbmUsICouYmluIGFyZSByZWdlbmVyYXRlZCB1bmNvbmRpdGlvbmFs
bHksIGJ1dCBJIGNhbid0IHNlZQ0KPj4gd2hhdCB3b3VsZCBjYXVzZSB0aGF0LCBub3Igd2h5IHRo
ZSBub3JtYWwgZGVwZW5kZW5jaWVzIG9uIGhlYWQubyBkb24ndCB3b3JrLg0KPiBUcnkgdG8gYnVp
bGQgd2l0aCAibWFrZSBWPTIiLCBtYWtlIHdpbGwgZGlzcGxheSB3aHkgYSB0YXJnZXQgaXMgYmVl
bg0KPiByZWJ1aWxkICh3aGVuIHRoaXMgdGFyZ2V0IGlzIGJ1aWx0IHdpdGggJChpZl9jaGFuZ2Vk
LCApDQo+DQo+ICQodGFyZ2V0cykgaXMgdXNlZCBieSBSdWxlcy5tayB0byBmaW5kb3V0IHdoaWNo
IGRlcGVuZGVuY2llcyBmaWxlcyAodGhlDQo+IC5jbWQpIHRvIGxvYWQgYW5kIG9ubHkgbG9hZCB0
aGVtIGlmIHRoZSB0YXJnZXQgZXhpc3QuIFRoZW4gdGhlDQo+ICQoaWZfY2hhbmdlZCwgKSBtYWNy
byByZXJ1biB0aGUgY29tbWFuZCBpZiBwcmVyZXEgYXJlIG5ld2VyIHRoYW4gdGhlDQo+IHRhcmdl
dCBvciBpZiB0aGUgY29tbWFuZCBhcyBjaGFuZ2VkLiBXaXRob3V0IHRoZSAuY21kIGZpbGUgbG9h
ZGVkLCB0aGUNCj4gbWFjcm8gd291bGQgY29tcGFyZSB0aGUgbmV3IGNvbW1hbmQgdG8gYW4gZW1w
dHkgdmFsdWUgYW5kIHNvIHJlYnVpbGQgdGhlDQo+IHRhcmdldC4NCj4NCj4gTm93LCB0aGUgKi5i
aW4gZmlsZXMgYXJlIHJlZ2VuZXJhdGVkIGJlY2F1c2UgY21kbGluZS5vIGlzIGJlZW4gcmVidWls
ZA0KPiBtb3N0bHkgYmVjYXVzZSBtYWtlIGRpZG4ndCBsb2FkIHRoZSByZWNvcmQgb2YgdGhlIHBy
ZXZpb3VzIGNvbW1hbmQgcnVuLg0KDQpJJ20gbm90IGNlcnRhaW4gaWYgdGhpcyBjYXNlIGlzIGEg
bWF0Y2ggd2l0aCBMaW51eCdzIG1vZHVsZSBsb2dpYy7CoCBUaGUNCm1vZHVsZSBsb2dpYyBpcyAi
Y29tcGlsZSBlYWNoIC5jIGZpbGUsIHRoZW4gbGluayBhbGwgdGhlIC5vJ3MgdG9nZXRoZXINCmlu
dG8gb25lIC5rbyIuDQoNCkluIHRoaXMgY2FzZSwgd2UncmUgc2F5aW5nICJ0byBhc3NlbWJsZSBo
ZWFkLlMgdG8gaGVhZC5vLCB5b3UgZmlyc3QgbmVlZA0KdG8gYnVpbGQge2NtZGxpbmUscmVsb2N9
LmJpbiBzbyB0aGUgaW5jYmluIGRvZXNuJ3QgZXhwbG9kZSIuwqAgSSBndWVzcyBpdA0KZGVwZW5k
cyBob3cgZ2VuZXJpYyB0aGUgIiRYIGRlcGVuZHMgb24gYXJiaXRyYXJ5ICRZJ3MiIGV4cHJlc3Np
b24gY2FuIGJlDQptYWRlLg0KDQpCZXR3ZWVuIHRoaXMgcGF0Y2ggYW4gdGhlIHByZXZpb3VzIG9u
ZSwgSSd2ZSBjbGVhcmx5IGdvdCBtaXhlZCB1cCB3aXRoDQp3aGF0IGV4YWN0bHkgdGhlIHRhcmdl
dCs9IGFuZCByZWd1bGFyIGRlcGVuZGVuY2llcy4NCg0KVGhlIGNvbW1lbnQgc3BlY2lmaWNhbGx5
IHJlZmVycyB0byB0aGUgZmFjdCB0aGF0IHRoZSBvbGQgI2luY2x1ZGUNCiJjbWRsaW5lLlMiIHVz
ZWQgdG8gc2hvdyB1cCBhcyBhIGRlcCBpbiAuaGVhZC5vLmNtZCwgd2hlcmVhcyAuaW5jYmluDQpk
b2Vzbid0LsKgIChOb3Qgc3VycHJpc2luZywgYmVjYXVzZSAtTSBhbmQgZnJpZW5kcyBhcmUgZnJv
bSB0aGUNCnByZXByb2Nlc3Nvciwgbm90IGFzc2VtYmxlciwgYnV0IGl0IHdvdWxkIGJlIGhlbHBm
dWwgaWYgdGhpcyBsaW1pdGF0aW9uDQpkaWRuJ3QgZXhpc3QuKcKgIEFzIGEgY29uc2VxdWVuY2Us
IHRoZSBkZXBlbmRlbmN5IG5lZWRzIGFkZGluZyBiYWNrIGluDQpzb21laG93Lg0KDQpGcm9tIHlv
dXIgZGVzY3JpcHRpb24gYWJvdmUsIEkgYXNzdW1lIHRoYXQgc2ltcGx5IGJlaW5nIGxpc3RlZCBh
cyBhIGRlcA0KaXNuJ3QgZ29vZCBlbm91Z2ggdG8gdHJpZ2dlciBhIHJlY3Vyc2l2ZSBsb2FkIG9m
IHRoZSAuYmluJ3MgLmNtZCBmaWxlDQoobm90IHRoYXQgdGhlcmUgaXMgb25lKSwgd2hpY2ggaXMg
d2h5IHRoZXkgbmVlZCBhZGRpbmcgc3BlY2lhbGx5IHRvIHRhcmdldHM/DQoNCkFzIEkgaGF2ZSBz
aW1wbGlmaWVkIHRoaXMgdG8gKGFsbW9zdCkgbm9ybWFsIGJ1aWxkIHJ1bmVzLCBzaG91bGQgd2Ug
YmUNCmV4cHJlc3NpbmcgaXQgZGlmZmVyZW50bHkgbm93IHRvIGZpdCBpbiB3aXRoIHRoZSBuZXcg
d2F5IG9mIGRvaW5nIHRoaW5ncz8NCg0KfkFuZHJldw0K

