Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0133501CC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 16:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103968.198329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbOU-0000CD-MI; Wed, 31 Mar 2021 14:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103968.198329; Wed, 31 Mar 2021 14:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbOU-0000Bo-IV; Wed, 31 Mar 2021 14:00:26 +0000
Received: by outflank-mailman (input) for mailman id 103968;
 Wed, 31 Mar 2021 14:00:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NSS5=I5=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lRbOT-0000Bj-FM
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 14:00:25 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 85e3dea7-bbce-4f3c-be65-1a420d06b33b;
 Wed, 31 Mar 2021 14:00:24 +0000 (UTC)
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
X-Inumbo-ID: 85e3dea7-bbce-4f3c-be65-1a420d06b33b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617199224;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XN3Z61BUcb4LwkfP+1OsHmAO3If0ZOxnUhhz51L1x08=;
  b=I2CBd1ku+5z2xiZLM142HF6Hm69buVjUxEddssSmc9v+41LfxY51StDG
   WxIaQzLTaTKH5rkawnOTlJjvWKu13frPT1DTdpBYsY+L4supP00xaxh9R
   5/EDb1wuay0918AqowWevL3AR9M8nVlDByVOsAzvJp9MtmM3ICEiEcaGn
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: RFUFnkbk78ExsT18S79ZdaepB3Y3LQ8oQFjtkHrSE/j632kVbxrm+LjQupVDLqclEnuwT5uOYs
 BD3SA4TUbbigz92A4x9NqF5F3Kn7ZSX9x5g9JdoyBhP16tTeYqsUvm+fql5CkMSjUcExL+fo2h
 Xy/gZgew9dVmUhPBtIsyNTB4voEpkDZ9hDyvS4wOsIUBdNxvJ27q+qQxpq4qCG2DMI5CadoFah
 WXaaaHHNGaPNCRy/Gv6/TvPskE3aSjfP2ziSNE6ajGzaXS4ZiYAo6gndhFhxBxE4SkTEg8+qlX
 JP4=
X-SBRS: 5.2
X-MesageID: 40545754
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wWqKl6F2lX6tqU8WpLqFk5XXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJVJxgd/mpCyxFNg9yNeKmZrY+Nv25V0Fd3AOV4hL6QBlBgGHVm1aLTM2S6YRPp
 ya+8ZBun6EcXMYcsy0ChA+LpT+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIP/Z4J92
 /Znwvlopiyqv3T8G6S60b/zbRz3OHgxNxKGdCWhqEuRAnEpw60aO1aKsS/lR8vpuXH0idIrP
 DtpFMaM913+zfteAiO0GHQ8i3B9Bpr1HP401+fhhLY0IzEbRY3EdBIi44cUjax0TtZgPhG3K
 hG332UuvNsZHuq9kWc2/HyWx5njUayq3Y5+NRj9EB3aocCdKRX6bUW4UI9KuZbIAvB9IslHO
 NyZfusgMp+TFKAY3jV+klpzdC8N05DeCuuf0kYtsSZlwVRhXBypnFoo/A3o3FozuNed7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeI6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSeAdAWo7vsby4lyu7X6SrauGzaEUkoSn8yppOhaJcHHRf
 CpOtZzD+X4JWXjXaZFtjeOHqV6GD07aok4q9w7U1WBrobgMYvxrNHWd/7VOf7jCjAhVmTjAm
 YSXTT6Kclah3rbHUPQsVz0YTfAa0b/9ZV/HOzx5O4I0rUAMYVKr0wUhD2Cl4e2AAwHlpZzUF
 p1IbvhnK/+j3Kx53z042JgPQcYCk5U5b7nQm5bvANiCTKsTZ8z//GkPUxC1nqOIRFyC+nMFh
 REmlhx8aWra5qKxS4jDNqjOnmAj2QaoW+LS5t0oNzG2e7VPrcDSro2Uq14EgvGUzZvnxxxlW
 tFYAgYAlPEGij2kqWjhpwMDOTZf91x6T3befJ8mDb6jwGxtMsvTnwUU3qSSsaRmx8pXCcRrE
 Z26bUjjL2JniuPJWMzjP8jCkBFbH2aDdt9fV+4TbQRvoquWQlrCU+WmDSRingICxXX3nRXol
 akEAq5VrXgBEFHtnVRz6DwmWkECFm1TgZXcXB1sYp0CGLcnG18uNX7O5ab23eNa1cE3+EWOC
 zEZzxXOQ9129Wrzneu6Ua/PGRjyZM0MuPHCrM/N7nVx3O2MYWN0boLBvlO4f9eRZ3Tm/5OVe
 qefgOPRQmIet8BykiQpnw/PjNzp2RhmfT02Af95GzQ5g91PdPCZFBnTaocOdeS8iztQOuJyo
 xwiZYwsfGrOmv8Lt6Axqe/VU8IFjrD5Wq3Rfovs5ZaoOY7s6ZyBYDSVX/Qz25ctS9OWvvchQ
 cbWuB28brBMohgc4gbfD9Y5EMgkJCKIFEwugL7D+cidTgW/jPmFsLM56CNpaskA0WHqge1I1
 WZ/iFH9/rOXieI19cheuoNCHUTbFJ55GVp/euEeYGVFR6jcPtb+kGmdnC6a71QRcG+aMIthw
 c/58vNmeCZdyD1gl+N+TR6J79D6GahT4e5BhmWFetB7ty9PhCNj8KRkbuOpSayTSH+bUISwZ
 BBfwgXaM9IjzE5lo050iSoUMXM0wsYukob5Ssij0Ln34it/XzSEk5HOxDIm5k+Z0ggDlGYyc
 DetfWC3Hvz4DJZyYDOGUdZcNZJAcURROHMXlNTANlVuqWp8aopijlCZxlrD3dUskGP499b
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40545754"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HcFr6Ha4VPJHqywRrmkxQ51sZLdPYKDUlMhj9isOR4TRQTPcPMEGN6zINNXTFOBoGMQ+k0h69KfOXKBPeOaInS2R9WYHkfv83a92JsIgASnLlvCNv0ta2VqNBS/MqJ2Hyd42oehZQ7kxL+xbepuE4MtsJXZHAr/wk41jtn9ymNGIG2+KAJ+JMHLSP2kht2vDqPbATyQ4am1Duv3mMeu4Sm4kLjCJIJhAYt5wquSornOmsvN0oT6700lJ4sLXkZUr9SOrZeHy2A+3ByKKNqjkmr4+9QdW+lO7t3w33PEgL/x3lCZswkAkxn+VGpLUfZ8vitmZsh/pbqGkaiLk2yn0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN3Z61BUcb4LwkfP+1OsHmAO3If0ZOxnUhhz51L1x08=;
 b=EXQ3ig6W5av8gWh4hs8hh7Mex1x5pCPwi+O5DOSlodMNS+iHs9HQc9vXpUxSz/o6cwNPRWv6QUBWEsrfVUILwdFvae/I90rbQOx4mE6MO6qKICHTJaNV+Ex2YhrlGkk9apv3Bf41cfMRZ/lpQY4LZohzAH8g9PiT4RcLkUexLWDA4lquE8rULWh+tSvt9Mp5Eqb0DwcVHuj1BmugHLLDsfwmkD7vr1LGQU9gx8vtMay4vEF9t5XYcC5IlNsgamZowLPbiaRHDZ286ch3yORqlo5xE6u63AqFmKX+l9O0Eb1Mua+K/mQloYFtiNMtBGgjfLCJr+dWuvGXZJpxMjdR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XN3Z61BUcb4LwkfP+1OsHmAO3If0ZOxnUhhz51L1x08=;
 b=wnsLc45Leb2sfVEXkyJeLhjPLBuz2WLQL8msuGu0XS52OhgxWGTK8IplvgW9I73NhbACTdq95k9MiRzuhzF4H5mVlhrH5yu0esXZ/XpayzsMKgvFuUd4+1uIL09XPckFLNmKwGg1m+SUBnfihYpUiM5Pt16btW6Lf7A3y+dnryM=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Paul
 Durrant" <paul.durrant@citrix.com>
Subject: Re: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Topic: [PATCH] CHANGELOG.md: Make PV shim smaller by factoring out
 HVM-specific shadow code
Thread-Index: AQHXINLTS489UfL61EKD4pjlwXnfbqqUSZCAgAbMCwCAABhsgIAAEbyAgAEUfwCAAdQ2AIAAAIoAgAABtoA=
Date: Wed, 31 Mar 2021 14:00:20 +0000
Message-ID: <1832DBFA-B215-4CEA-9C8A-F53F2A5321E9@citrix.com>
References: <20210324172608.302316-1-george.dunlap@citrix.com>
 <f41680a0-9415-ea2e-c1e3-db8b0552823c@suse.com>
 <FB9CBC51-5793-41DD-A331-5274E6A82AF4@citrix.com>
 <23461afc-c0e0-eb33-9ed3-52f050b6aef0@suse.com>
 <27ecde00-f0aa-b701-6928-5480ed805064@citrix.com>
 <2A1FCD39-D0C0-468D-A977-2FBF7126FDE6@citrix.com>
 <24676.32400.548088.26254@mariner.uk.xensource.com>
 <1a87cfa9-d6c0-5da5-ea07-eae47186da9a@suse.com>
In-Reply-To: <1a87cfa9-d6c0-5da5-ea07-eae47186da9a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d74b016-ab14-4093-7602-08d8f44d52bc
x-ms-traffictypediagnostic: PH0PR03MB5910:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB59102CE63AC72EA2CE48C392997C9@PH0PR03MB5910.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JGW6iR5LUnW9EKqR+0ZyZNl72fUjMl9H7u8//sytJN14XM0/R6mhg5I0Vt9vT50sOeujdA/dygS5xGusyqQSKbflWeNfulbc0MDePHMm8D1DX4mhxHwozMJab5N/7k+ZIcyh6jK8+RE915HxLB11+wFE67EUjMLR7kHikU5r2wktPMKhUfHWXj0qKdLsRhn1sSZD1A0BBzHYejCMjXbR7f3uuDI1JuRr16aCsGcpU7OFmDufsLbAfnbmOZr7FiTkg4EXLpmxyh/pXsvOzdAKSVuIcoiYsju6hlduFFN+3bkHqwPXKbJEeGYMqeQf11PgtXf9GQyx6jmKNAWgzzWvDD+rDuQlYBc9C5nLkNGy5nKM5cXuLhKy34IMiD+E+Aiql0oKnxpw+HmCoZlCdMNsH5i6h3MdCGEDhgccsX4SjGW/a3/D+e/+OOpbByByx6DagrKwm0+eSHPT3tcpCtlkLYCLyK3C905sBIwf0dvy3EJXTdbM9NfY4Q0RsJhswHE9bLYdgKJoZnUIzbnboWij/83UmhXnDaz/UWTt+z12xyfYY9j2M9BmQ2Q6wJemfGiLJHIlGkcvCqPvIfUg5PRrYJMDIU0QiCRn1wkmOLRT/qEvp0NIrHQng1WqGdnoSSJCe7RV6jEu5ybNYBTnAxREpURbPFOJv8muEfQDvQCpgy8KQujNWJMuz7l304LWJcpsLsEhKaBR2AodrVDltDgdTz70g1/pUa1zqCdBdrHq2mqz0mpmJdrY0sig9N7hsUdf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(76116006)(186003)(8676002)(478600001)(2906002)(8936002)(91956017)(2616005)(66476007)(33656002)(4326008)(107886003)(83380400001)(6512007)(71200400001)(6916009)(66556008)(6486002)(36756003)(53546011)(38100700001)(6506007)(54906003)(316002)(86362001)(64756008)(5660300002)(66446008)(26005)(66946007)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?a1FJVGpnKzNncDF1b2VLc3BMbjBlNHBWd3FzVGRyMHc4WWJKSmJPbis4ZHdW?=
 =?utf-8?B?MVdzZExROWpIVSthZ0IwU1k3d050OHdDTmxMUFFwQjVJNWZ5aEU2QjA4SDNp?=
 =?utf-8?B?MGtUdTNtUzIzNG1zaEVHZVR5bUE0REtpT3ZNQUZGMFlwdmZEUGE0ZnR3Y1pJ?=
 =?utf-8?B?c2hqek5WY3ZQYzk2dzkyNGlTRmZBUStuV0hNN3VkSzFVQklrdnBKbC9VbUV5?=
 =?utf-8?B?OW83YzFjUE5lSHRBS21FKzhERFdpWmRRSWJpcWUxdUllcWR5d094NXVGQVZm?=
 =?utf-8?B?RDdHRWpwbHpIWi9SZC9DbkZPOTh1VDhFaFVHSHYxOFJZOGhhTzg4L2d3VDB6?=
 =?utf-8?B?SERlYUlncFNBOG1xL2xPVE4zRGJjZDRYRGY0M2xSaThTWDREaDE5WjdjT1FJ?=
 =?utf-8?B?V0Q2RnRsckt3V2YxVDVKMEIwOEw2SWdMeFk5elp5SGRWeXBkWHJyWGNDa0NP?=
 =?utf-8?B?VXFIMUpYUytrTUU2alhFWW9EY21JWm5BT2lmblpMWlBvQVB1NkdjdklFUWMx?=
 =?utf-8?B?YmZSUEpTMG94MTZ4WFpTcnRDT2ZvVjZrS1UvdzdQUmtGeXdudWttV1JmZlBJ?=
 =?utf-8?B?em5YYWhJQmR3d244RFdUMVo3V0pFaEY5eHc4ck9kLzUyRTV5NzludkUvZGFk?=
 =?utf-8?B?UG9QaThFRnR4V0R2WjFrTW5pVkRUK0piaTJOUmk0SXgzNnp2VUd3TlNTWXNX?=
 =?utf-8?B?a21BTTUyc3JITzZ6a052NDVRTVMyeThXMkpDQzBBL1paNnRmUkFaZ0J3QUNJ?=
 =?utf-8?B?SE1GcTdxUjJUc1VFc0FJenRadkpYa1hGcTdJYWs3TkExM2VSdlczYnpXZ1Nx?=
 =?utf-8?B?bC9NcFRiNlY1c3B3d01TNDh3VDZnc1pxVVJxVGsvV1pEU0pkK1VKa1lJVnRZ?=
 =?utf-8?B?aUFUaG9DN1BYUFdiTklDR2pnNWxWcjRJNWhzTGFqQ08zMFhLbzZqZ2NOUzhu?=
 =?utf-8?B?aWYzTEpQQVlpTUhSVWFWbVoyN0ZyQitieGE5K21BN2I0VnA4NlZlR3BuQ0NB?=
 =?utf-8?B?QTVGTlFCNUVRZ2NwVmkxaHdXL2VrbnJrTnFOeGMxVnZqZjRWVVVjWmtNbHFQ?=
 =?utf-8?B?Uk9nakJoeFhMWU9PNXFjc29pc1NoNUlXZEx0UW9vdVlSSm4zNFlVWUJqKzFl?=
 =?utf-8?B?M0dyOUZFVzREWXc1TXk5YThKZmtOa1ZIUmxuQ2Uxb1YzajZaZUFQWGhjUGta?=
 =?utf-8?B?YldKdUkyM2FQUFdERElwcjQvQndjWEpIWkdrQmVhYkhLSVJlaHg0T09XZWVo?=
 =?utf-8?B?NXJoUkI1cElnc3BHVnpneGxGM3l0YTJvY2t0YXBhMDBrdzF2TEQyS0FUSnk3?=
 =?utf-8?B?UEhGTTdLNEsyT0hTQ2ZJdWdqUXJRT25KYm01VEZmbnhNUnlOcEtqUmRncUwz?=
 =?utf-8?B?MWJXVy90Ym5NOE1OTlBVcWpiUTdzM0VSeC9YT0RHb1k5SmRvbzBNVmliREd2?=
 =?utf-8?B?cTE2d2FFTlkzOGx4TkcvN2lJR1BJQmdUc29PcDZwM1FCUzZZSlBzUWMvK0g3?=
 =?utf-8?B?SGxRS1JIQTZ4SFA4dWdzUzBNN0ZCSEtLam1wZDhjZmY5TmFnK2xZejU5dEdI?=
 =?utf-8?B?K0FaRHk2ZU9HL09mck9WalJVUVhiS3JyalBId3RRODFXeDloUHF1YytQV200?=
 =?utf-8?B?bXBPRkhtVENEZ0xWVm5lT3ZyNGxYMnBBN1BvZFpFNFVqWnUyNU1lQnlCdXlu?=
 =?utf-8?B?RUhkb3dZdkdKamtRanN4SCtSKytLdlRJQlNWdmNQMDRKallnWmdkUXBrM3Nv?=
 =?utf-8?B?Q0hZZG1oWGdmeWxmSVVNTVBZbkp3MVVLVHFiMFhUa0drSW45Y3pXaWUwd3Nk?=
 =?utf-8?B?OHN6NW1rQnQrL2drdjBldz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69DCBEE1B6F7B54AA03A8EAD1669B5C7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d74b016-ab14-4093-7602-08d8f44d52bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 14:00:20.9790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VlAjnL6ac/H5C9CkqFl3soVcuSD5ps+K7fKS6TJGqcR/5YWo64jme32+v1+2y0ZzOC2HSbpm7MlT7y0ZUa4HmXZZP0P1WhPJVoPcbEy6jAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5910
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDMxLCAyMDIxLCBhdCAyOjU0IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzEuMDMuMjAyMSAxNTo1MiwgSWFuIEphY2tzb24g
d3JvdGU6DQo+PiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIENIQU5HRUxPRy5t
ZDogTWFrZSBQViBzaGltIHNtYWxsZXIgYnkgZmFjdG9yaW5nIG91dCBIVk0tc3BlY2lmaWMgc2hh
ZG93IGNvZGUiKToNCj4+PiBJIGRvbuKAmXQgdW5kZXJzdGFuZCB3aHkgdGhlIHR3byBvZiB5b3Ug
YXJlIGRvd25wbGF5aW5nIHlvdXIgd29yayBzbyBtdWNoLiBZZXMsIHRoZXNlIGFyZSBhbGwgb25s
eSBpbmNyZW1lbnRhbCBpbXByb3ZlbWVudHM7IGJ1dCB0aGV5IGFyZSBpbXByb3ZlbWVudHM7IGFu
ZCB0aGUgY3VtdWxhdGl2ZSBlZmZlY3Qgb2YgbG9hZHMgb2YgaW5jcmVtZW50YWwgaW1wcm92ZW1l
bnRzIGNhbiBiZSBzaWduaWZpY2FudC4gIENvbW11bmljYXRpbmcgdG8gcGVvcGxlIGp1c3Qgd2hh
dCB0aGUgbmF0dXJlIG9mIGFsbCB0aGVzZSBpbmNyZW1lbnRhbCBpbXByb3ZlbWVudHMgYXJlIGlz
IGltcG9ydGFudC4NCj4+IA0KPj4gSSBhZ3JlZSB3aXRoIEdlb3JnZSBoZXJlLg0KPj4gDQo+PiBU
aGVyZSBhZSBhIG51bWJlciBvZiByZWFzb25zIHdoeSBiZWhpbmQtdGhlLXNjZW5lcyB3b3JrIHdp
dGggbGl0dGxlDQo+PiAoaW50ZW50aW9uYWwpIHVzZXItdmlzaWJsZSBpbXBhY3QgYXJlIHVzZWZ1
bCB0byBub3RlIGluIHRoZQ0KPj4gQ0hBTkdFTE9HLm1kLiAgV2l0aCBteSBSZWxlYXNlIE1hbmFn
ZXIgaGF0IG9uIEkgd291bGQgbGlrZSB0byBzZWUsIGZvcg0KPj4gZXhhbXBsZSwNCj4+IA0KPj4+
PiArIC0gRmFjdG9yZWQgb3V0IEhWTS1zcGVjaWZpYyBzaGFkb3cgY29kZSwgYWxsb3dpbmcgUFYg
c2hpbSB0byBiZSBzbGltbWVyDQo+PiANCj4+IHNvbWV0aGluZyBhYm91dCBodGlzIHdvcmsgaW4g
dGhlIENIQU5HRUxPRy5tZC4NCj4+IA0KPj4gSURLIHByZWNpc2VseSwgYW5kIEkgZG9uJ3QgdGhp
bmsgR2VvcmdlIGRvZXMgZWl0aGVyLCB3aGF0IGEgZ29vZCBhbmQNCj4+IGFjY3VyYXRlIHN0YXRl
bWVudCBpcy4gIEJ1dCBJIGd1ZXNzIHdlIHdpbGwgZ28gd2l0aCB0aGUgdGV4dCBhYm92ZSBpZg0K
Pj4gd2UgZG9uJ3QgZ2V0IHNvbWV0aGluZyBiZXR0ZXIuDQo+IA0KPiBBdCB0aGUgdmVyeSBsZWFz
dCB0aGUgcGFydCBhZnRlciB0aGUgY29tbWEgb3VnaHQgdG8gYmUgZGVsZXRlZC4gQXMNCj4gc2Fp
ZCBpbiBhbiBlYXJsaWVyIHJlcGx5LCBhdCBsZWFzdCB0aGUgc2hpbSBkZWZhdWx0IGNvbmZpZyBk
aXNhYmxlcw0KPiBzaGFkb3cgY29kZSBhbnl3YXksIHNvIHRoZSBmYWN0b3Jpbmcgb3V0IGhhcyBu
byBlZmZlY3QgdGhlcmUuDQoNClRoYW5rcy4gIFNvIHdoZW4geW91IHdyb3RlIHRoZSBzZXJpZXMs
IHdoYXQgd2FzIHlvdXIgbW90aXZhdGlvbj8gIERpZCB5b3UgaGF2ZSBhIHBhcnRpY3VsYXIgdGVj
aG5pY2FsIG91dGNvbWUgaW4gbWluZD8gIE9yIGRpZCBpdCBqdXN0IGJvdGhlciB5b3UgdGhhdCB0
aGVyZSB3YXMgSFZNLW9ubHkgY29kZSBpbiBhIFBWLW9ubHkgYnVpbGQ/IDotKQ0KDQogLUdlb3Jn
ZQ==

