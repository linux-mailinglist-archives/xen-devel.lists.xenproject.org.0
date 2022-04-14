Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0D5500CC8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 14:07:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304688.519375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyFv-0005xv-Ib; Thu, 14 Apr 2022 12:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304688.519375; Thu, 14 Apr 2022 12:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neyFv-0005w5-Fb; Thu, 14 Apr 2022 12:07:23 +0000
Received: by outflank-mailman (input) for mailman id 304688;
 Thu, 14 Apr 2022 12:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNZz=UY=citrix.com=prvs=096427a9b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1neyFt-0005vz-LH
 for xen-devel@lists.xen.org; Thu, 14 Apr 2022 12:07:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cc2a718-bbeb-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 14:07:19 +0200 (CEST)
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
X-Inumbo-ID: 6cc2a718-bbeb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649938039;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=KmiJwyoJOj/Acz81QFt4uoGVDQVACfz8D5fVFYKwPfg=;
  b=IyGFn//GZ1TJeitC20/wu444ugTIBhsDyC3AzW/YtEdnHouSVXJRlXtk
   jU6yW2/yCCrfhaKbCLRHLLbTyJAGfvvfgw0gf4/vUSCaaVUyLFJI94JTO
   E0cIWclcl9QLM3Z78vTWhbR5KIu5mevvs6ogx3BttykIC3Q9a3sqcrgI1
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68354730
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bqZgsqwxisRDw3S6s+Z6t+dUwSrEfRIJ4+MujC+fZmUNrF6WrkUCz
 zZJDW7QOPzYYGHxL4gjYIi2/BhQuJfSydc3TFM5+SAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllqHvdxkAD6L3pvkUDQRCGHo5Oaka9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AN
 5FENWU0NHwsZTVxOnYFLL4anN6RhyPGVi1m722b/oketj27IAtZj+G2bYu9lsaxbdtUmE2Vo
 H6A8Hn4Hg0dKPSbyDyM6HXqgfXA9Qv+UZ4SFbClsOZtgUeSy3Y7DBwQXEG85/K+jyaWXtNcJ
 goU/S4roLMa8E2tR8P6GRqirxastRcGV91dO+Yz8g2Kx+zf5APxLm8AQz1adM09tOc5QDUr0
 hmCmNaBLSdzvbOcT3Xb7audpz62PSkTLEcSZCsFSxtD6N7myKktjwjCVdYlE7Owh8fdHTD2y
 iqN6i8kiN07ksojx6i9u1fdjFqEvYTTRxIy/UDbU3yN6Rs8YI++e5fu7Vnd5OxHaoGDQTGpt
 XwJi46U4eYIAJylkC2LSf8KWraz6J6tIDDaxFJiAZQl3zCs4GK4O5Bd5nd5PkgBDyofUWa3O
 gmJ41oXvcINeivxBUNqX26vI+cXkpb+POXqbc7JZ4RTeJMqMwuDoC47MCZ8wFvRuEQrlKg+P
 7KSfsCtEWsWBMxb8damewsO+eR1n35jnAs/Ubi+lk36iuTGOBZ5XJ9faDOzgvYFALRoSek/2
 /JWLIO0xhpWS4USiQGHoNdIfTjmwZXWbK0aSvC7lMbeemKK+0l7Upc9JI/NnaQ/zsy5cc+So
 BmAtrdwkgaXuJE+AVzihopfQL3uR41jinkwIDYhO12ls1B6P9r+vP1HLsVrJuJ6nACG8RKSZ
 6NUEylnKq4RIgkrBhxHNcWtxGCcXEnDaf2y09qNP2FkIs8Iq/3h8d74ZAr/nBTi/QLs3fbSV
 4aIj1uBKbJaHlwKJJ+PNJqHkgPg1VBAybkadxaZfbFulLDErdECx9rZ1aRsfanh6Hzrm1On6
 uphKU5B+7Kc8tNvrYGhaGLth97BLtaS13FyRgHzxb23KTPb7iykx4pBW/yPZjfTSCX//6DKW
 Amf56iU3CEv9LqSj7dBLg==
IronPort-HdrOrdr: A9a23:AQf41q6wOiXNpT8XwwPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDiexPhHPxOj7X5VI3KNGOKhILCFuBfxLqn7zr8GzDvss5xvJ
 0QFpSW0eeAbmSSW/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.90,259,1643691600"; 
   d="scan'208";a="68354730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vynw71iQchQxbG4KSRbi97GCUzSmI8joHsJ8n3N/bleS47BBIVZRFVR/CdnrkLNCkDqML3yaB49ulvv+NQ41EH2CnP2WrVNIBw0jnG5FL1Wqbjrkiv6zkzQ6isXjpqV1OPCHD5FvLnoy2PpiLApWgB/JoTsW7BWrfX2CzH73hXdr8pPxQwstBDLKg64HqM2YSZTMgHOs89Cu3Lx8jbCgDXq7G5nY7OS5zzKvEgGgnOnzBA4OrX9KPoXnIZlKblR/Tdk5nYPozx8BoFRg3O8KtPkvFDVA/CRjsWS0fX7apw6JYycpNWhIw1tGanzZE134+8+K8X2QrywoA9S2I1g8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmiJwyoJOj/Acz81QFt4uoGVDQVACfz8D5fVFYKwPfg=;
 b=QDTCmUGXhw6ihZzoj57nP48BQFVs1RueTnzr9PRJ7dZmrqiubhzbI8zpY0p32D7Vhi94ghhQhxruB9fsWcN1DqPm+x8t+rIkrrVK1973sjxO9JgLMqbqvzzDBuqtHvaYRQvujjmOfJbyEpQdnJzbBx11f5ogdmOT2BiY0qKGhiOmOa0FQcTiJfiQL7TSoj6veb+2fqHMpf+OhjPhlaOA3lCA9nyJ+IJAmZNQKVGFFxfSI+AZ+A37S+A/e53C4gbknIZTKNMO3L5NAS2klTVARBN6Sc0yEpWrFR2cjJqzjE8UOpM78gC+6TZoktYyfEygXIWNLhKbqzoxe7c0YOXijg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmiJwyoJOj/Acz81QFt4uoGVDQVACfz8D5fVFYKwPfg=;
 b=TO2CKPGFaqidQk7DwpexIuLh2MFkcvFitvVVem7wYMsOdjMzG+qpnHpL+S0DXCVjzHFJufd0TU3ojVKvoEcxXhgCCgGFGQyfqaiYejg4j2vElTV7gYa+Do+YoIE3kAA5eaH8lh/SWqk0xvam3UvEJx2V4RG7/Y3C7zveBJQR39Y=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Wei Liu <wl@xen.org>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
	=?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Mathieu Poirier
	<mathieu.poirier@linaro.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Mike Holmes <mike.holmes@linaro.org>, Oleksandr Tyshchenko
	<olekstysh@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Virtio on Xen with Rust
Thread-Topic: Virtio on Xen with Rust
Thread-Index: AQHYT+F3VJeAyJ3qtUWdcwuAq4aFpazvSqWAgAAF7gA=
Date: Thu, 14 Apr 2022 12:07:10 +0000
Message-ID: <2a735486-a464-3997-642a-3b0660b11b9e@citrix.com>
References: <20220414091538.jijj4lbrkjiby6el@vireshk-i7>
 <20220414092358.kepxbmnrtycz7mhe@vireshk-i7>
 <20220414114557.4myrs4ud4qi2hnrz@liuwe-devbox-debian-v2>
In-Reply-To: <20220414114557.4myrs4ud4qi2hnrz@liuwe-devbox-debian-v2>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c1ab664-787a-4419-6643-08da1e0f4e51
x-ms-traffictypediagnostic: MN2PR03MB5070:EE_
x-microsoft-antispam-prvs: <MN2PR03MB50704E91003BB40DA57F4209BAEF9@MN2PR03MB5070.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: skQIHsY9izbfinBfH2LkhbQs/4eU3ly/qFA0FFjxLwxU1fooGVtSp8PZn40AcTBlVjIbK+f3PYx7GZRY55zfkgjHSPQvbgUvbdyGVyX6cXeqGLudZILiI7T09iPSohfOHl+vbL/vgvOgclfQ49jm+UfVujtz2hxp4IYwUcLZQtnP80LOygUYOVorqYAC1Gzy5+yI9P9ud152e4mKl1Vtct7/ywC72OToz+BX38/HJTE1MJM6IHUEujL2NNs3GDFNm71b0BcranPihNjvnlxuVVPwkuguKI3J/tFTXo8Emr5TZXkFYf1SNwzhBfGipaOSX4t2dHDuTirn//SEHQZUh1ganepAIGePNUnTA9vNOJJiM6hBi7NTH0ODaixhDh/eyhfg4PENpPb45xe9PhCZtkJlLDkWWhHRcfytaA1SK06uecvaJAWqh7k6xXw8P03OKldUldFzQUr1EpW3IGCxe9vjPhwyaSfc/VS27kX/krdpsA82ET4kE3LS+Cy2aR+1Rv2zN1aJU98X+sZPiy8eT0lPO0fmzdCAgqxFCJPwf8Ei4unGrMBxKOYpEKSbuYfdZBkz+TOnCr3ADDo4cAQYDAupyXfO1VMPKtnpkf8oEZQVIYJLwNLCv11xfTlGdYUEbfA77ZQevQP0oaLtliZ8dUQtIWtrBysSeKM2zSXn3C506K1ODeILwe49oiXRbFjyjSEAp9yR5a/1JD3ee+MFpAhmUX3a6Xf+KmFFITzjq0as4paaWwY/A4hodc7/iWj3E1+gpqlIlczSiwhYJ7n7hm9l8jcHlGz3oGHHf2BerQuv8ci9K1RhDxrzYs5mOjgbCf5y3GGwVTeBZXBjbt6dFk6yyDZ0mUtexyLZ/PrH8o2lFof/6qRYWMWoBP+MZD9cY7j0/0b5gt7/CzHjumcZUQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(31696002)(122000001)(82960400001)(38070700005)(38100700002)(8936002)(6486002)(966005)(508600001)(5660300002)(7416002)(316002)(54906003)(110136005)(66946007)(8676002)(64756008)(4326008)(66446008)(66476007)(66556008)(71200400001)(76116006)(91956017)(83380400001)(186003)(26005)(6512007)(6506007)(2906002)(53546011)(2616005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2FNcGd2R3ZpdlVubWFndjVjU2pGNFA0SGFaQXFSMTlzeFdyUkxyaHErWWhM?=
 =?utf-8?B?SjM1Y3RzUTVEbmYxV3dtdmxYNlhzcTViRmNZNkRoeXV2MFUwK1BSNFJVWUFJ?=
 =?utf-8?B?SVdzVVU0WlBvZzBGV1pyVDNEWExVeGNBT1hLZ2FjbkQyZkhGUFdYdWthWm44?=
 =?utf-8?B?WVVTR1Rrbm1maUNBRDFxcHJDQndrT2lJZXZxT1RnYmZQRTdjT2FPbkM4ZGdL?=
 =?utf-8?B?b3o4UiszeUZPWmowY1JNUnhtL1BvM2lSRmRiQitzZmg4RkRSOUFBKy9FdGdj?=
 =?utf-8?B?dkZzWjVUSEdTcENNbWl2enB2MjF3YTZZMmdmS29IOEhYSGxZZXRCOVVyVGh3?=
 =?utf-8?B?SkhHd1lHaXdremI2QTEyVnJSbThCdWZTTXUxZ2d2YTFCUnFFd080L2pvSzNl?=
 =?utf-8?B?ZlhiUWgzdUg2cExscTM5QjE0bnZlbWJ1QU1GRFpJbDlDK0lGMTlqWTFJcDN1?=
 =?utf-8?B?NFZBcUFLZWN4d1AvaU04cGdoRjM2V1I5bUF2bzk4Y25lOFBxWll4Y0FmM3Zh?=
 =?utf-8?B?R0hpTnR2MnV4SGxZZFhNTkNNc3ZDOW9XNHZ6SWxpZmFmekZEQ3llZjlKaWEx?=
 =?utf-8?B?RGY1WEZTZjVoUkdpVGhXaHFkYXZmeTFQVnA5d1FOTHdBd1FISjdkVjR6RWdX?=
 =?utf-8?B?bzF3U28wandMZ1FFaXo5a1J1c2FJMzM0RFFWZGNVV1hxc1BEU3BNYUIycmlv?=
 =?utf-8?B?VG1mWUUrMy9RWHhTK0VwRk9oRjVVM3IyTDdROTNaWnc5OFo3cXFOWUllZm1Y?=
 =?utf-8?B?VXlEUUIxUDdZMFo0d3UyRTM3K0w4bFEvdWJZZUNsdHQvLyszQ0NuU1FITzZ5?=
 =?utf-8?B?NHZiUU1ROXRIdzZ6NUhWNW9kalNFMlg5eGprZDF1YmtsRGkzcVArZTBVRzJa?=
 =?utf-8?B?YjdGdnZJYXh6aTJNbG80czFqbzZCUy9aYXNrVEJaZGlvUm1pdGJVeStGeGM1?=
 =?utf-8?B?UEVNTUprSVpEemUzSnNjTjl1bWcyb3hDb0FEUEtLQzZmS0wzQmdzNXBuNE96?=
 =?utf-8?B?eFZVSnlIc0VsVDJueGhtUURxR3BFSUs5R1VrWWl4UFVFbGhjeGM2bHMzWng1?=
 =?utf-8?B?OWtLZFhlQnZPb1VCZkk4MUdDUEZlTDV2Tkt3UkFGUTNWdWdXekVmbHBZRHB1?=
 =?utf-8?B?emJuU280TEQ1UDVlSkUxeFpuaFNVYzhYRk1YRS8waDM3QVJiRURZemJtbWNH?=
 =?utf-8?B?T3liTWZFVkcvMFhpMFZUZ24zYmU4TklGcTVDMEx3ZUtwS0prRXpaNW9TREVo?=
 =?utf-8?B?b2tUd2QybEd0eDMrZkpKWGI1S3ZBVi9kc0o3N0VHOGEyK2VzemxZYU5NNUlO?=
 =?utf-8?B?RCtHbUVxbGNtOWswbFBlRDhEZCtJYTArbDNSOGNwMTlHKy9xRlNnL0w3OFlx?=
 =?utf-8?B?YTFMZkhTUGFHWmp3bFFlMEo2UHZTOE5CNmY0VVV1TGVnMXdMVDlabklJSHBj?=
 =?utf-8?B?Zmg4Z2JwVTIvU1ptNFBPWVdtaTA5UHk1SW5GUHg1U1d6RHBHcW1ENjFuMHRZ?=
 =?utf-8?B?SlR0c1BBK3orK3c5eDJUVHJCNkFiU2dtR2pSUWtaV09ucGtJMjBuc2QyRUlt?=
 =?utf-8?B?aUVabFlmeFZQU1ArUUM2L2FWQ0hrUnAvNks0ZnB6cGZSV205dmRGRlY2dkdE?=
 =?utf-8?B?NmJOSmU3ejBaZUwvRm03cml1VTZZM0h0dEM1bWRuMnhiYlIwenczRktrTTgz?=
 =?utf-8?B?Zkh5SThhVVFoSEhrSEhyTHJaSXJPak1pSnBmQUdWc3ljUEdtYXRBa0w1SWN5?=
 =?utf-8?B?RWVKVUtGZzNZV28zY3pPbWhlTmJQZncrYUZOOFFlSENsYXZ5dUFqRHJ5djVI?=
 =?utf-8?B?OXRaUEQyTC9vQWFHbDBhb1RYSGNBcDF5S1FJRkI2VTRvTGkyN1B1MEk4aEhY?=
 =?utf-8?B?bXI3czVHWHc2aThOTGFPUGpBdDgvemZPMXRrSTlvL1VsMFpKdU9XdTl3cjIy?=
 =?utf-8?B?cmE2bVZ4RE9KNDlRSnJwbndGek43bkRDT3pqQXoxZ2lPMDlacXpsL0Vod0Yy?=
 =?utf-8?B?dWZQZmlpZTNXbWlaOEx2UUZ3bVlFdW11UXdZM2g2ZWtUakM0Tm0vdkRxdnd6?=
 =?utf-8?B?WjIxOVNSV0FyUVVXcHBUMGcrdW1GM0pDb1RsNCs1cWtmZnZjckxYWnRJZnRj?=
 =?utf-8?B?SFRBdW5GRldFcDZoeklSMVF3UW40VDZ1M2N2ZnY2NXFWeUxPQWdWOER5czFU?=
 =?utf-8?B?NXFPS1FFM3lLOXQ2VVI3Y3RpQmpDdjJibmFDZ05XMkxCeEtpQjdqc0JQcmt1?=
 =?utf-8?B?OElTTlpQa0V2eDBiUVhiK1p0UFkvZ2dtUDJMNTJTQWl1Qk9yWUdVL3Rka3FR?=
 =?utf-8?B?QTVwUHZvZXd5dEt0SlRHWU1DSlNDUzhXZC9pS3I4QVlXMDNkczJSUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF8E202673C5EB4CBEBA6E67B9C0D1FE@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1ab664-787a-4419-6643-08da1e0f4e51
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 12:07:11.0209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjVq9eKmH4RgYAAu6pfSTGO1sg58Nqw63HdWtM0+SlI4MSbWjsEy5RADwu7nA2HDG/56bQKTbx6x+cY6ZSNRUvqWXqR6HBeQSywt976VZKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5070
X-OriginatorOrg: citrix.com

T24gMTQvMDQvMjAyMiAxMjo0NSwgV2VpIExpdSB3cm90ZToNCj4gSGkgVmlyZXNoDQo+DQo+IFRo
aXMgaXMgdmVyeSBjb29sLg0KPg0KPiBPbiBUaHUsIEFwciAxNCwgMjAyMiBhdCAwMjo1Mzo1OFBN
ICswNTMwLCBWaXJlc2ggS3VtYXIgd3JvdGU6DQo+PiAreGVuLWRldmVsDQo+Pg0KPj4gT24gMTQt
MDQtMjIsIDE0OjQ1LCBWaXJlc2ggS3VtYXIgd3JvdGU6DQo+Pj4gSGVsbG8sDQo+Pj4NCj4+PiBX
ZSB2ZXJpZmllZCBvdXIgaHlwZXJ2aXNvci1hZ25vc3RpYyBSdXN0IGJhc2VkIHZob3N0LXVzZXIg
YmFja2VuZHMgd2l0aCBRZW11DQo+Pj4gYmFzZWQgc2V0dXAgZWFybGllciwgYW5kIHRoZXJlIHdh
cyBncm93aW5nIGNvbmNlcm4gaWYgdGhleSB3ZXJlIHRydWx5DQo+Pj4gaHlwZXJ2aXNvci1hZ25v
c3RpYy4NCj4+Pg0KPj4+IEluIG9yZGVyIHRvIHByb3ZlIHRoYXQsIHdlIGRlY2lkZWQgdG8gZ2l2
ZSBpdCBhIHRyeSB3aXRoIFhlbiwgYSB0eXBlLTENCj4+PiBiYXJlLW1ldGFsIGh5cGVydmlzb3Iu
DQo+Pj4NCj4+PiBXZSBhcmUgaGFwcHkgdG8gYW5ub3VuY2UgdGhhdCB3ZSB3ZXJlIGFibGUgdG8g
bWFrZSBwcm9ncmVzcyBvbiB0aGF0IGZyb250IGFuZA0KPj4+IGhhdmUgYSB3b3JraW5nIHNldHVw
IHdoZXJlIHdlIGNhbiB0ZXN0IG91ciBleGlzdGluZyBSdXN0IGJhc2VkIGJhY2tlbmRzLCBsaWtl
DQo+Pj4gSTJDLCBHUElPLCBSTkcgKHRob3VnaCBvbmx5IEkyQyBpcyB0ZXN0ZWQgYXMgb2Ygbm93
KSBvdmVyIFhlbi4NCj4+Pg0KPj4+IEtleSBjb21wb25lbnRzOg0KPj4+IC0tLS0tLS0tLS0tLS0t
DQo+Pj4NCj4+PiAtIFhlbjogaHR0cHM6Ly9naXRodWIuY29tL3ZpcmVzaGsveGVuDQo+Pj4NCj4+
PiAgIFhlbiByZXF1aXJlcyBNTUlPIGFuZCBkZXZpY2Ugc3BlY2lmaWMgc3VwcG9ydCBpbiBvcmRl
ciB0byBwb3B1bGF0ZSB0aGUNCj4+PiAgIHJlcXVpcmVkIGRldmljZXMgYXQgdGhlIGd1ZXN0LiBU
aGlzIHRyZWUgY29udGFpbnMgZm91ciBwYXRjaGVzIG9uIHRoZSB0b3Agb2YNCj4+PiAgIG1haW5s
aW5lIFhlbiwgdHdvIGZyb20gT2xla3NhbmRyIChtbWlvL2Rpc2spIGFuZCB0d28gZnJvbSBtZSAo
STJDKS4NCj4+Pg0KPj4+IC0gbGlieGVuLXN5czogaHR0cHM6Ly9naXRodWIuY29tL3ZpcmVzaGsv
bGlieGVuLXN5cw0KPj4+DQo+Pj4gICBXZSBjdXJyZW50bHkgZGVwZW5kIG9uIHRoZSB1c2Vyc3Bh
Y2UgdG9vbHMvbGlicmFyaWVzIHByb3ZpZGVkIGJ5IFhlbiwgbGlrZQ0KPj4+ICAgeGVuZGV2aWNl
bW9kZWwsIHhlbmV2dGNobiwgeGVuZm9yZWlnbm1lbW9yeSwgZXRjLiBUaGlzIGNyYXRlcyBwcm92
aWRlcyBSdXN0DQo+Pj4gICB3cmFwcGVycyBvdmVyIHRob3NlIGNhbGxzLCBnZW5lcmF0ZWQgYXV0
b21hdGljYWxseSB3aXRoIGhlbHAgb2YgYmluZGdlbg0KPj4+ICAgdXRpbGl0eSBpbiBSdXN0LCB0
aGF0IGFsbG93IHVzIHRvIHVzZSB0aGUgaW5zdGFsbGVkIFhlbiBsaWJyYXJpZXMuIFRob3VnaCB3
ZQ0KPj4+ICAgcGxhbiB0byByZXBsYWNlIHRoaXMgd2l0aCBSdXN0IGJhc2VkICJveGVydW4iIChm
aW5kIGJlbG93KSBpbiBsb25nZXIgcnVuLg0KPj4+DQo+Pj4gLSBveGVydW4gKFdJUCk6IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9tYXRoaWV1cG9pcmllci9veGVydW4vLS90cmVlL3hlbi1pb2N0bHMNCj4+
Pg0KPj4+ICAgVGhpcyBpcyBSdXN0IGJhc2VkIGltcGxlbWVudGF0aW9ucyBmb3IgSW9jdGwgYW5k
IGh5cGVyY2FsbHMgdG8gWGVuLiBUaGlzIGlzIFdJUA0KPj4+ICAgYW5kIHNob3VsZCBldmVudHVh
bGx5IHJlcGxhY2UgImxpYnhlbi1zeXMiIGNyYXRlIGVudGlyZWx5ICh3aGljaCBhcmUgQyBiYXNl
ZA0KPj4+ICAgaW1wbGVtZW50YXRpb24gb2YgdGhlIHNhbWUpLg0KPj4+DQo+IEknbSBjdXJpb3Vz
IHRvIGxlYXJuIHdoeSB0aGVyZSBpcyBhIG5lZWQgdG8gcmVwbGFjZSBsaWJ4ZW4tc3lzIHdpdGgg
dGhlDQo+IHB1cmUgUnVzdCBpbXBsZW1lbnRhdGlvbi4gVGhvc2UgbGlicmFyaWVzICh4ZW5kZXZp
Y2Vtb2RlbCwgeGVuZXZ0Y2huLA0KPiB4ZW5mb3JlaWdubWVtb3J5KSBhcmUgdmVyeSBzdGFibGUg
YW5kIGJhdHRsZSB0ZXN0ZWQuIFRoZWlyIGludGVyZmFjZXMNCj4gYXJlIHN0YWJsZS4NCg0KVmVy
eSBlYXN5LsKgIFRoZSBsaWJyYXJ5IEFQSXMgYXJlIG1lc3MgZXZlbiBpZiB0aGV5IGFyZSB0ZWNo
bmljYWxseQ0Kc3RhYmxlLCBhbmQgdmlvbGF0ZSB2YXJpb3VzIGNvbW1vbmx5LWFncmVlZCBydWxl
cyBvZiBiZWluZyBhIGxpYmFyeSBzdWNoDQphcyBub3QgbWVzc2luZyB3aXRoIHN0ZG91dC9zdGRl
cnIgYmVoaW5kIHRoZSBhcHBsaWNhdGlvbnMgYmFjaywgYW5kDQpldmVyeXRoaW5nIGdldHMgbW9y
ZSBzaW1wbGUgd2hlbiB5b3UgcmVtb3ZlIGFuIHVubmVjZXNzYXJ5IGxldmVsIG9mIEMNCmluZGly
ZWN0aW9uLg0KDQp+QW5kcmV3DQo=

