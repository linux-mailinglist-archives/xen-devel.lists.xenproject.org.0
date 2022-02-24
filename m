Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1B4C33D7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 18:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278559.475863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNI60-0001EO-Nf; Thu, 24 Feb 2022 17:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278559.475863; Thu, 24 Feb 2022 17:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNI60-0001Aj-Jh; Thu, 24 Feb 2022 17:40:04 +0000
Received: by outflank-mailman (input) for mailman id 278559;
 Thu, 24 Feb 2022 17:40:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNI5y-0000o8-JF
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 17:40:02 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c935afb9-9598-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 18:40:00 +0100 (CET)
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
X-Inumbo-ID: c935afb9-9598-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645724400;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ho9uvsjSBrvHeOUTDVh9znup132sGvMrXoNo/3/hFJw=;
  b=YhJ3wg/1j3+h88fuHOkUcHt/E1PVCokQeJIGq2RbX1K0zlZNsYBfenby
   sz5enUpeTXZbk5KDjHGM4IbHcvxtMYfAasrXaLo+DqTZ8yOXn53daG3oP
   8niS1nEtxN79NbL7ogzBl/RVRaaxqNL8STcNB9gEMBmZ90o54eCc3wzYW
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64363116
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:38e7/a4P/89H1e4X1pU99AxRtCrHchMFZxGqfqrLsTDasY5as4F+v
 mIYUGqDb/mKMTTxKo9yPNmy/R5VsJLSzoM1SFZprHhnHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YLjX1vW0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSXEgIQPJHyp9hHShdIQyU9L/Zt3LvYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RFMmQ0NU2eC/FJEmwzAaM7ocuCvVnyLCRRt0PSvqcuwmeGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYDUUX1ampfiyimalRslSb
 UcT/0ITQbMarRLxCIOnBlvh/SDC7kV0t8ds//MSz1qI86jo3TmlXHEKXm5FK859n+syWml/v
 rOWpO/BCTtqubyTbHuS8LaIsD+/URQowX8+iTwsFlVcvYS6yG0npleWF4s4Tvbp5jHgMWyom
 1i3QD4Ca6L/ZCLh/4Gy5hj5jj2lvfAlpSZlt1yMDgpJAu6UDbNJhrBEC3CGtZ6sz67DFzFtW
 UTofeDEsoji6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJpZJ2OzP
 BWI5lsKjHO2AJdMRfUpC25WI553pZUM6Py/DqyEBjawSsIZmPC7ENFGOhfLgjGFfLkEmqAjI
 5aLGftA/l5BYZmLOAGeHr9HuZdyn3hW7TqKGfjTkkT2uZLDNSX9YepUbzOzghURsfrsTPP9q
 I0EaaNnCnx3DYXDX8Ug2dRNdQtTdSBjX/gbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:mjlBBK/XYxG9HENtLktuk+F2db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQwdcdDpAtjkfZtFnaQFrrX5To3SIDUO31HYYr2KjLGSjwEIfheRygcz79
 YYT0ETMqySMbE+t7eB3ODaKadg/DDkytHRuQ629R4EJmsKC52IrT0JcTpzencGHzWubqBJcK
 Z0k/A3wQZIDk5nCfhTaEN1PdTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mEryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczAgNl1mpDs1L8Zqq
 iJn/4SBbU115oXRBDynfLZ4Xik7N/p0Q669bbXuwq6nSWzfkNENyMIv/MmTvKe0Tt7gDg06t
 M644rS3aAnfC/ojWDz4cPFWAptkVfxqX0+kfQLh3gaSocGbqRNxLZvt3+9Pa1wVR4S0rpXWN
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wua4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Frt2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLELQIwFllu9EU5HHNcjW2He4OSMTeuOb0oAiPvE=
X-IronPort-AV: E=Sophos;i="5.90,134,1643691600"; 
   d="scan'208";a="64363116"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP+58IS9lKmMoz1Zq3I4JLjIdKgWZ6E81j8iW5nhWK8PgEe3gZ2GJHDPFMXKeJZ8R1CLD0WHW7THvsM5bu5iuLye26rcZe7S+Gq28ALj667MpZwmgzO7vu+cjLFejJsnPqTyU7fa6IlFKd6VvSTmTuxRMTNoAewxFsHTWhK5oU3pxlfmIg+Z6VyO94ZQgOGY9XwVc8OjJpi+wqRt5E/+fXVPMxnpDCp9Y7pXBYdb/7I1dXgigA+jf/Y1ZUs0Jp5oIPE0IM+tEC5YFPx5qjJMoG24sZ8+rqKCMp4HqWQxpmNIkt8YbIaIFd9YvUZlaMSXa8KHS78oC1/zPyCkp3I6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ho9uvsjSBrvHeOUTDVh9znup132sGvMrXoNo/3/hFJw=;
 b=TzbFthydbEX5QvzkPDrIAiUNKke42bT38nAgv4bbiwBbm/E6k4HTmF3rkmOvy+y9TloZN/hV1LRftFkoR0Rdm7nXyTKDbz0rpa7ec29W3rYlY/6wlr0sEHEv82Pp0lWqzVinxGxHHtvsCMS+CY1CUqHuy3ZrSFfF+uE1UIxLX+TExjSMYmK7py21Xo5MAIsIYGuyeLg1rtbEtHYw5WN+5H91vcrcev2AA8prQpQ+B4IyXPjHMc74E4OCbGjH1nCu3DxzQTnq9GXKoYKtIXC46n3EJw/LUNVsp1GRhkcD8esa4gafmsBfW2PbTST9S5iwdOi4TZiKJltRt95NbAA7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ho9uvsjSBrvHeOUTDVh9znup132sGvMrXoNo/3/hFJw=;
 b=vhIQ7VPEW+GntZssDeDdIomcJd7L60IQ1s9JKrWCFAzMHUgq9VLl4GYsV2pmfH8PP/8PH7y2gZR93xOFSST3kj4tXGFlRJpSgSQ38WpRkgzNvovBKRgwKEwZvQOVUbnLHm8l2yq54QigGTpgCSICo5O1cus8Ct824KMVOhncTqU=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: Ping: [PATCH v2] x86/time: switch platform timer hooks to altcall
Thread-Topic: Ping: [PATCH v2] x86/time: switch platform timer hooks to
 altcall
Thread-Index: AQHYCH/zSGV6zWhCDUW+2oPSoHYB06yi0XUAgABomoA=
Date: Thu, 24 Feb 2022 17:39:54 +0000
Message-ID: <822a757b-a9a3-e677-4cc4-3879125f9f24@citrix.com>
References: <5f1f49e6-1380-73bf-d68f-6eb9dd05cad6@suse.com>
 <68d40be4-9ced-01bf-8bc3-585f11827504@suse.com>
In-Reply-To: <68d40be4-9ced-01bf-8bc3-585f11827504@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a637f285-0574-4776-10aa-08d9f7bcaaf0
x-ms-traffictypediagnostic: CY4PR03MB3333:EE_
x-microsoft-antispam-prvs: <CY4PR03MB3333CC298E9659423F2B55D5BA3D9@CY4PR03MB3333.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jdsp4dC67PiLIDYn/ggH223uXqeTlYc7XJAd0L64zlcTuUhmasaJ5fJnDjb2Wxk+pyFpMd7BBZj8+QbqCxueThG/JQFuBTsbKuLL3mFLr24GL6bccL35X6j8lUwk2/kT29ghqUnoCqTczxAj11PgwPbe9jWst0yVCc+clR2zd3iAEzmmnfx6LcXsyKHeJSLgA3yxeCbMv+BZmlFXdecjra8Dv4UJCtKlb6Ule5JWJ0JOwsy+T40yQJm4UUNYuNd4T2wAAcH9FURli+lebHw9kk6ptxOi5BeiLVNIKv0A0Q9d43y3q21KaX95iNDrmvtLqIW3Xip27MQs/jJScg+X2V89dAIkJr4hCD2scJVnJS40xSzLre6t77vipLaaHKqazkmmdPphoTVlqqgodZxLY3Os/Utark4JFxHDPshs40XO82MxtoiChB46z16rgRNd7yJuCBb5zGTXLT2VL7c1XqDBgx12lDc+RK6Z1F0vua+lDz1eqS09AY22P+sf9bSnQDDOZ1zLuGjhOWDSwjnPNLyob5nO5NJUx2sSh7WNThGgGdJUkPP25EQe+mTIJZggBPUsE5kyAp9vX0/7giJAOjg8eW+yiAKyTl/w7ljU1prFJt6b6uDgx7+OXggWe1ODPRZc1gTL0eDfeKrPumftBCuEASvoovcvQUidiCuQWarH+ObeVWsaaC9O8ZO6E56LOk+xGKydzPT2zqlXvamCQe6A/rOOQzQO5ooM7n4CWBfY6yU5PG11J/90Dv2tnGiuTdOq/C9DNp9xE5tzWJ9s4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(91956017)(8936002)(4326008)(8676002)(66446008)(64756008)(76116006)(66946007)(107886003)(31696002)(66556008)(38100700002)(122000001)(5660300002)(26005)(2906002)(82960400001)(31686004)(36756003)(2616005)(316002)(71200400001)(6512007)(83380400001)(186003)(38070700005)(6506007)(54906003)(6486002)(508600001)(86362001)(53546011)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUNOV3EvOGVJVWtTUVhhK3F6YnBTeXVEbEdxUDFvTlcva2ZsRSt5eW9ibisr?=
 =?utf-8?B?eE1hSEhud2dwRWNxY210aXlxSlBoWUlTRlBpWmJVR3VrNUU2d2dyaDF4WWFo?=
 =?utf-8?B?dStwaUI0L09qcEcrWDE3aWZFTFVGSHo2ZmQwME9DUlZ6dHdMNHVtWDY2dktP?=
 =?utf-8?B?K0VzdUc1dXJ2MlgyeCtNNjRGQnBBckphSDhxVU1tWEhLQTdUdnpQbE9ZRUNK?=
 =?utf-8?B?dTh6bCtSVGJDN3JmYTQzUTB6NUlaaU8zelB6OE83R0ZXTlR2Q3diQnZtQjlO?=
 =?utf-8?B?aXlKQWVVdGtJZTA1Qkl1Qkt6c01GdXlZWnVMRWZOU0tYUGFONzhkbWtCT21Z?=
 =?utf-8?B?NXlJanlaTHgwMVorYjFhaUVxbDk2aDlFcjR4TjJrS01CaVcxenRUYkxhRUNs?=
 =?utf-8?B?cVVXWllOTG1GQnowZkw2RXVWTnJNKzY1ZnNVYWhtTUUxNlNadWZxUTNpcStM?=
 =?utf-8?B?WHJxTUNTTjdrSHRuMjlubW5mR0VmVjNzK1ZWVVZ4YkZIUm1QdDNEalVjN2Zq?=
 =?utf-8?B?U0NTQjRKSWRqRmJGSkJHdXplQi9LMVJlSWtCb2tFSjJ1ZmIzOC9ycDR2L1gv?=
 =?utf-8?B?SDhCN3Q4WmZndkFNeUUwSHpGOFZldmtoSlU4OGVqVmFWMW04NHU1NVdlY3lO?=
 =?utf-8?B?VDVjWU1wUVBESW9EaDFMVzNSN0szaVUvWjA4TFI3SmZQNVVSTGYzdHZsMnNZ?=
 =?utf-8?B?K1p4a29MZjdZLzhCSEl5TElUWVBSNFIrL1dDZ0d2TUVnNklZRXlmbHFyQ1lS?=
 =?utf-8?B?UmVMTmVZbTNqTjdQeDIzVW93Y1VSbUxhY2VDbzd0eHdha0h3enhOV1hzR0JD?=
 =?utf-8?B?aCtYNHhBRXlncGtVUHdBR3BnNGpySzRhQmZYYXBQNitkVnpzSmZ2UlNwSWpF?=
 =?utf-8?B?L2kyS2pYOFgzWnNkS2FpUkIzTVRTWTErYzZBTTZZeU5sL0JGSVNpWUsvemlD?=
 =?utf-8?B?K2NvbHRqRmk1MmltcWduL0xFYnpRTU92VmV5ektNRzkwckR6LzZsNnNlWWZQ?=
 =?utf-8?B?ckRhM1RxQkgyWFhMU0o0QzNXblZEaDQ4YlFqRkdxRE1odkdWakttTjFoVkdU?=
 =?utf-8?B?K1pDT3AvZUlkc2hhZUd5YjFrYzdtMTFUV2c1S0VEcVhZNEgrTEZ2VDBQaEJJ?=
 =?utf-8?B?cTBLWGQxV1QxQ3lBRUlBckJBUlFOQ0V5OUxzS3dkR2hjanZIRysrOFBNNGJs?=
 =?utf-8?B?RkZ5aGlIbWJkM1dxZFZWb3NkQXMzZU1QdjdmQzlXMi8wU3ZiNnM0Y1RkQ000?=
 =?utf-8?B?eVRuOE5KVE92QXZTNzVtUmNJQVVEek5FSmt5bzFTMDFtTWRIVGd2cmtHdlQw?=
 =?utf-8?B?Q1NLSkhMUTkxMEVvM2R4YXRyd1RyaEtwZ3BWRTZoaEJRbVFjOTlxd3d4U09r?=
 =?utf-8?B?QVNrcEtQZTVIMDJTRG83QThka2tYNEl2U2NDR2dqQTNYdnFNdHRZREhOV3hO?=
 =?utf-8?B?VFYwMFk0aXQ3by9xeHFKcWMzTWVueUNTakliRWNoMjAySnlXcmVvYmQ5UGxW?=
 =?utf-8?B?Kyt5aXdaUGo4VnhXZ3FwOVVGUkdsSHJOcG5XaHNDb1krc21paU5Ra1VESTBT?=
 =?utf-8?B?ODFFaTFDS3d0U1o5RkNtVjFmODVmbkFuakhFcDVSSVhkNFJhVjRJaHdobnlU?=
 =?utf-8?B?ZEFMak5tTHVPdTNodEpUK0tVUkRQd1o4NUJGZHhydWx2YXMwKy9lVlZtNUpt?=
 =?utf-8?B?eFBMSjZRai9mOXVQT3NYNUZqR1Y0WjJaZ05KaS9ESTIrNmhaTDJSK0FOWDE5?=
 =?utf-8?B?YXVaNWs1d280WFZxT0swd0ppYmN5Q0tYUmZpdUpXcjBrU1RzTW1EMlN1dkxj?=
 =?utf-8?B?US9Oc2N4RUg3d1BUcTR0ZlVBMEdHaFVJRVFNY2l0Q3dxTTczYjFTSkFpSlhm?=
 =?utf-8?B?V2MyWm5ZRmJjOEdiL3VSK1E1K1ZOeW5ZVE1IVHcvaXIwUDJjN3ZSdjJKRzBV?=
 =?utf-8?B?YncxelprendUc2k2SFdnY0JPcHgrS0ZJUldXRkNRbUxtclE5OW4rUFo3Ym14?=
 =?utf-8?B?NjREdmw1ZzRVRFhUQlRyU2hiNmNUZUxyQVo1Z1RzZE5OakJJUGVHMS9IRDlG?=
 =?utf-8?B?aC9XRnNJTW1zam4wMnVUdDNSaXFMWHFZNEhDWWJEb1Fnc0JMbDQ1eUFacVE2?=
 =?utf-8?B?V1YrcjVMVENLdlZTUEVaWnpEeGRnTUFLdmMyaGpISDBUSWFzZU1hcTM1ZmdC?=
 =?utf-8?B?eFkzaTVFV3RvMlIrZjVCVmlNVDRpKzBlMkxONlZqTGhPZHIvUG5nSXdMN0NY?=
 =?utf-8?B?eGhocmFQMTNONHhDbzIrL01LbmJRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1EAE667346C5164CAA81E8EBAC2B3AA1@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a637f285-0574-4776-10aa-08d9f7bcaaf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 17:39:54.2314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwdWDWEr1TS8ykP4EWTNmuZNYv9xszSlLcwMEBZi9OBLTbqdycjyLCG3gpvV7lbaAfHolAHx1apKyl7IHtTmbJvs7/7R3doD3B3iP/H4xlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3333
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxMToyNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjAxLjIwMjIg
MTQ6MTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gRXhjZXB0IGluIHRoZSAiY2xvY2tzb3VyY2U9
dHNjIiBjYXNlIHdlIGNhbiByZXBsYWNlIHRoZSBpbmRpcmVjdCBjYWxscw0KPj4gaW52b2x2ZWQg
aW4gYWNjZXNzaW5nIHRoZSBwbGF0Zm9ybSB0aW1lcnMgYnkgZGlyZWN0IG9uZXMsIGFzIHRoZXkg
Z2V0DQo+PiBlc3RhYmxpc2hlZCBvbmNlIGFuZCBuZXZlciBjaGFuZ2VkLiBUbyBhbHNvIGNvdmVy
IHRoZSAidHNjIiBjYXNlLCBpbnZva2UNCj4+IHdoYXQgcmVhZF90c2MoKSByZXNvbHZlcyB0byBk
aXJlY3RseS4gSW4gdHVybiByZWFkX3RzYygpIHRoZW4gYmVjb21lcw0KPj4gdW5yZWFjaGFibGUg
YW5kIGhlbmNlIGNhbiBtb3ZlIHRvIC5pbml0LiouDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBBcyB0aGlzIGFjdHVhbGx5IGFtZW5kcyB0
aGUgSUJUIHdvcmssIEkgd291bGQgaGF2ZSBob3BlZCBmb3IgaXQgdG8gYmUNCj4gdmlld2VkIGFz
IHVzZWZ1bC4NCg0KU29ycnkgLSBpdCBmZWxsIHRocm91Z2ggdGhlIGNyYWNrcy7CoCBEZWZpbml0
ZWx5IHVzZWZ1bC4NCg0KPiAgT2YgY291cnNlIGlmIGFjY2VwdGVkIGluIGdlbmVyYWwsIGl0IHdv
dWxkIG5vdyB3YW50DQo+IHRvIGhhdmUgX19pbml0Y29uc3RfY2ZfY2xvYmJlciBhbm5vdGF0aW9u
IGFkZGl0aW9uIGluY2x1ZGVkLiBBbGJlaXQNCj4gdGhlcmUncyBhIHNsaWdodCBjb21wbGljYXRp
b246IFNvbWUgb2YgdGhlIHN0cnVjdHVyZXMgYXJlIHdyaXR0ZW4gdG8sDQo+IHNvIHRob3NlIGNv
dWxkbid0IHJlYWxseSBiZSAiY29uc3QiLg0KDQpUaGUgLmluaXQuY2ZfY2xvYmJlciBzZWN0aW9u
IG5lZWRzIHRvIGNvbnRhaW5lciBhIHBvaW50ZXIgdG8gZXZlcnkNCnRhcmdldCBmdW5jdGlvbi7C
oCBGb3IgdGhlIGN1cnJlbnQgb3BzIHN0cnVjdHVyZXMsIHdlIGp1c3QgcHV0IHRoZSB3aG9sZQ0K
b3BzIHN0cnVjdHVyZSBpbi4NCg0KRm9yIGluZGl2aWR1YWwgZnVuY3Rpb25zLCB0aGUgYmVzdCBw
bGFuIEkgY291bGQgY29tZSB1cCB3aXRoIHdhcyBhIG1hY3JvDQp3aGljaCBlbWl0czoNCg0KLnB1
c2hzZWN0aW9uIC5pbml0LmNmX2Nsb2JiZXIsIGEsIEBwcm9nYml0cw0KLnF1YWQgZm4NCi5wb3Bz
ZWN0aW9uDQoNCndyYXBwZWQgdXAgaW4gI2RlZmluZSBjZl9jbG9iYmVyKGZuKSwgc28gdGhlIGVu
ZCBjb2RlIHJlc3VsdCBvdWdodCB0bw0KbG9vayBsaWtlOg0KDQpzdGF0aWMgdm9pZCBmb28ocGFy
YW0gKmJhcikNCnsNCsKgwqDCoCAuLi4NCn0NCmNmX2Nsb2JiZXIoZm9vKTsNCg0Kc2ltaWxhciB0
byBjb21tYW5kIGxpbmUgcGFyYW1ldGVycy4NCg0KDQpUaGF0IHNhaWQsIGluIHRoaXMgY2FzZSwg
Y2FuJ3Qgd2UgY2ZfY2xvYmJlciBlYWNoIHBsYXRmb3JtX3RpbWVzb3VyY2UgP8KgDQpJdCB3b3Vs
ZCByZXF1aXJlIGFsdGNhbGwoKWluZyB0aGUgcmVzdW1lIGhvb2sgdG9vLsKgICh0aGUgaW5pdCBo
b29rIHdvbid0DQptYXR0ZXIgZWl0aGVyIHdheS4pDQoNCn5BbmRyZXcNCg==

