Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5B5EFFB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 02:15:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hipLw-0004qf-Cx; Thu, 04 Jul 2019 00:11:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0JfK=VB=wdc.com=prvs=081f8cefc=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hipLt-0004qa-To
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 00:11:54 +0000
X-Inumbo-ID: 51743388-9df0-11e9-ae81-7bda8ed8fd33
Received: from esa3.hgst.iphmx.com (unknown [216.71.153.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51743388-9df0-11e9-ae81-7bda8ed8fd33;
 Thu, 04 Jul 2019 00:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562199110; x=1593735110;
 h=from:to:cc:subject:date:message-id:references: mime-version;
 bh=89ZgTdvjd6A7ZHbYqqnF/80zng6OFVR8eQKz4awpUQw=;
 b=USXMQmK2jtnCH0Y8FN6NPsDX3oM+9/xYx0J4gI7T74eDLockSgn0xl1S
 G9HsfvAFLXrsalpAyVpofpXO94zMGZC5sHuLfe1Qi5Y5OddnHCOS73/G+
 WV9CKt+USuX2bh9fg+VMTRHGDNuby1OaJ3fcUSwTz73WX/ARomZiDepVu
 FATXqL9TPpAkathZ9+N1htXFW9QB+oQHCOEaYxo0f+vhL3qJ6ZvLrtGz+
 92WpkisLmcjwSaXazCMMqE4x1KGWF2z7d8BNFmhCErXFD++dCclzeVtjE
 vZf7lUyDZOM6I1ZyOfciJHynmfGWv1ABGTBxqZ+n4XjRxiIEJk4dWt7Cv g==;
IronPort-SDR: BI77c5fPdfAZbOsjqqGEE6JaY8TKWOHvpO5ORfcaxZvXz4SzYEDvRb5c2qCFqgRVHupQMI3kde
 KNPLT31ePLREZ+BxF8MfVZBGP7P7sRQWZP6XJArVe5c2ITee0nCUeF1o3uJz3blpKMouqT3sfq
 Jnh+9ACBgFdWyVfr9k45gXorbtJ/lpVe6XPQGqsLaYbZU5JWZBLZ/N3KI1RdJzTuupt/J4nLGM
 jv7h+MooX4mVsKuivKp3hGglZKbBTcFhmCT4dMHw89wF9cwl9YuGToUG6e41sJ5JZ+yvVNnE+z
 o5o=
X-IronPort-AV: E=Sophos;i="5.63,449,1557158400"; 
 d="scan'208,217";a="117024713"
Received: from mail-by2nam01lp2050.outbound.protection.outlook.com (HELO
 NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.50])
 by ob1.hgst.iphmx.com with ESMTP; 04 Jul 2019 08:11:49 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89ZgTdvjd6A7ZHbYqqnF/80zng6OFVR8eQKz4awpUQw=;
 b=IkMg+OgKKogZQA2IO6jIbsMyL8AdECKadfzJJ/WypdSUVUeEnJK6Xo6K1VD8fQjpmGydMxcBB7e8OJribdfY4CuCQXYvWdhDxeKqFuQg/cmhXriid/PXr3+JIarngdOX5Zw/MgkjjE0hczBrjfeKmov77lljKXfj+SPKE289kA0=
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.58.26) by
 BYAPR04MB3974.namprd04.prod.outlook.com (52.135.215.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Thu, 4 Jul 2019 00:11:48 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
 ([fe80::8025:ccea:a0e6:9078]) by BYAPR04MB5749.namprd04.prod.outlook.com
 ([fe80::8025:ccea:a0e6:9078%5]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 00:11:48 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Bart Van Assche <bvanassche@acm.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>
Thread-Topic: [PATCH V3 1/9] block: add a helper function to read nr_setcs
Thread-Index: AQHVMP2RKOODus9yTU+34ZedLdZ1Iw==
Date: Thu, 4 Jul 2019 00:11:48 +0000
Message-ID: <BYAPR04MB57492202BACDEE2991620E4D86FA0@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20190702174236.3332-1-chaitanya.kulkarni@wdc.com>
 <20190702174236.3332-2-chaitanya.kulkarni@wdc.com>
 <26917678-fd82-b6c8-761e-220bc7d3b179@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [2605:e000:3e45:f500:b8d2:4d45:f4cb:6e09]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a455854-8b4a-4bfb-3aae-08d7001434f6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB3974; 
x-ms-traffictypediagnostic: BYAPR04MB3974:
x-microsoft-antispam-prvs: <BYAPR04MB3974BB4CFFFE7818ADEF421486FA0@BYAPR04MB3974.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(199004)(189003)(55016002)(2501003)(8936002)(25786009)(6116002)(9686003)(2906002)(68736007)(4326008)(81166006)(5660300002)(33656002)(81156014)(46003)(229853002)(558084003)(54896002)(6436002)(446003)(52536014)(478600001)(102836004)(7696005)(53936002)(86362001)(486006)(7736002)(71190400001)(73956011)(66946007)(76116006)(71200400001)(476003)(66446008)(64756008)(66556008)(66476007)(72206003)(53546011)(6506007)(74316002)(99286004)(186003)(316002)(14454004)(8676002)(6246003)(7416002)(256004)(110136005)(54906003)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB3974;
 H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ce5/jR8k/NKvsxv+3uEl1OyymL7iiH5L074mPXa5kbS0hvbSP4NGc7XCzvFdAEELalRRXbTKEMJpB+QO5KPjmWS56IgSQWCmnWWb7PmfWR9wo/SlsI+EeSYbEP3yPGtTnZaOE3OaM5ouTPpiM1L64tuf0XsMRIUTWyxMzFMlRPaigNsaZjNC9vTd6MnPshBS1aGtOaujEU2WcqdMdmruIbYl+N0Z3noF1JrbuJjS9apzpyBACqSUUEBBbJaCDgBnv96Y35QizpaSxP1ZBTYZyrYYynaN0NG2aSrnFUB9NS3yzhJxJ4fq83FQY966SWfITSvJ48fdb2UWCDT8GuSfu20DN1uQ8AGUgJ+FViMQq8AqLIGx3wN+5lulAg9j92lRIPwIb2hO8neCuZy28EusT7LUPSc7nl+uu5XU+nklZhg=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a455854-8b4a-4bfb-3aae-08d7001434f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 00:11:48.2623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Chaitanya.Kulkarni@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3974
Subject: Re: [Xen-devel] [PATCH V3 1/9] block: add a helper function to read
 nr_setcs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-btrace@vger.kernel.org" <linux-btrace@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "yuchao0@huawei.com" <yuchao0@huawei.com>, "colyli@suse.de" <colyli@suse.de>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "kent.overstreet@gmail.com" <kent.overstreet@gmail.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8352981984950808594=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8352981984950808594==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BYAPR04MB57492202BACDEE2991620E4D86FA0BYAPR04MB5749namp_"

--_000_BYAPR04MB57492202BACDEE2991620E4D86FA0BYAPR04MB5749namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 7/3/19 8:03 AM, Bart Van Assche wrote:

+}


Is the comment above bdev_nr_sects() really useful or should it be left out=
?

Thanks,

Bart.



Sure, let me send V4 without the comment.

--_000_BYAPR04MB57492202BACDEE2991620E4D86FA0BYAPR04MB5749namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<div class=3D"moz-cite-prefix">On 7/3/19 8:03 AM, Bart Van Assche wrote:<br=
>
</div>
<blockquote type=3D"cite" cite=3D"mid:26917678-fd82-b6c8-761e-220bc7d3b179@=
acm.org">
<blockquote type=3D"cite" style=3D"color: #000000;">
<pre class=3D"moz-quote-pre" wrap=3D"">&#43;}=0A=
</pre>
</blockquote>
<pre class=3D"moz-quote-pre" wrap=3D"">Is the comment above bdev_nr_sects()=
 really useful or should it be left out?=0A=
=0A=
Thanks,=0A=
=0A=
Bart.=0A=
=0A=
</pre>
</blockquote>
Sure, let me send V4 without the comment.<br>
</body>
</html>

--_000_BYAPR04MB57492202BACDEE2991620E4D86FA0BYAPR04MB5749namp_--


--===============8352981984950808594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8352981984950808594==--

