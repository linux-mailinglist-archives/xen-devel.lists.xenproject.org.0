Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60644D46F0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 13:29:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288390.489006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHtR-0004pu-FH; Thu, 10 Mar 2022 12:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288390.489006; Thu, 10 Mar 2022 12:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSHtR-0004nk-B6; Thu, 10 Mar 2022 12:27:45 +0000
Received: by outflank-mailman (input) for mailman id 288390;
 Thu, 10 Mar 2022 12:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE96=TV=citrix.com=prvs=0613c794d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nSHtQ-0004ne-56
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 12:27:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79eff541-a06d-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 13:27:41 +0100 (CET)
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
X-Inumbo-ID: 79eff541-a06d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646915261;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=3qZMNVGZCiP4mGgElYaJw6QWZWK6tEObc9fFLKUfK9s=;
  b=YsB9uAwrUYpLoIKo/gYzkns94zIwhm/pBgz57flyOG/ohwj5MYT2jql+
   m3Rr6hmcZAYU+NOQ4tYCU3KPI/4oLJdC5CFzSGWazEBnCvcg1IEvaQpkj
   Urwu4Y35GSCxF5mzHQpBK5flHxS01inchS6s02ZAIzG7MArR+gPd6U+8C
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65836836
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pR8q9KsdJWCb5TQ2jKqs6eDOeOfnVBVZMUV32f8akzHdYApBsoF/q
 tZmKWyEbP/bZGX9Ld93Pt+0/RsGv5CGzN81QAA+/yBkEygQ+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jU4
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8PYb/cwsocTSADDgZfBPNh2LjFIluG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWQyPE+eM0YRUrsRIIoegOr51kHRSRxZpUC4qrY34Ev3nSUkhdABN/KKI4fXFK25hH2wp
 WXA5W31RA4bMN+3ziCM+XahwOTImEvTX4YfF6ax8PJwt0GC3WwYCBAQVlyTrOGwjwi1XNc3A
 0AT9yAjqYA78UW5Sd+7UxDQiHucuR4YUtFTO+Q/4ROKzOzY7m6xA2sZZjdEYc4hsok6SFQC/
 FKTg8ngAzAplbSPUG+c7Z+dtzb0Mi8QRUcAbyIZSQoO4/H4vZo+yBnIS75LAKOzy9H4Bzz06
 zSLtzQlwaUei9YR0Ke29kyBhCijzrDWSiYl6wORWXiqhitif5KsbYGs7Vnd7N5DIZyfQ13Hu
 2IL8+Cc8eQPAJelhCGLBuIXE9mUC+2taWOGxwQ1Rt94qmrrqyXLkZ1sDC9WAhh7IpwqeCHQO
 1L0mDoPw79UPniJVPoiC26uMPgCwa/lHNXjc/nbaNtSf5R8HDO6EDFSiV24hD60zhV1+U0rE
 dLCKJv3Uy5GYUhy5GfuH48gPakXKjfSLI85bbTy1FyZ3LWXfxZ5op9VYQLVPojVAE5pyTg5E
 uqz1ePXk32zs8WkO0E7FLL/y3hQcxDX4ris96RqmhareFYOJY3YI6a5LUkdU4Jkhb9JsezD4
 2uwXERVoHKm2yGZeVjTMSs7NuOxNXqakZ7dFXZ8VbpP8yJ/CbtDEY9FL8dnFVXZ3LALIQFIo
 wktJJzbX6UnpsXv8DUBd5jtxLGOhzzw7T9iyxGNOWBlF7Y5HlSh0oa9ImPHqXlfZgLq5JBWi
 +DxiWvmrW8rGl0K4DD+M6n0kTtcfBE1xYpPYqc/CoIKKRu2r9QydXCZYz1eC5hkFCgvDwCyj
 m6+KRwZufPMs8ky9tzIjrqDtICnD611GU8yIoURxeze2fXyloZ7/bJ9bQ==
IronPort-HdrOrdr: A9a23:vKpqTaFnd06f0WRPpLqFVZHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdrZJm58erwdZVoMkmsj6KdhrNhcYtKPTOW8ldASbsC0WKM+UyYJ8STzJ8+6U
 4CSdkwNDSTNykDsS+S2mDReLxMoKjlzEnBv5aG854Hd3APV0gU1XYeNu/tKDwQeOApP+tdKL
 Osou584xawc3Ueacq2QlMfWfLYmtHNnJX6JTYbGh8O8mC1/H2VwY+/NyLd8gYVUjtJz7tn23
 PCiRbF6qKqtOz+4gPA1lXU849dlLLau5p+7Y23+4gowwfX+0SVjbdaKvi/VfcO0aWSAWMR4Z
 rxStEbToNOAj3qDyeISFDWqnTdOX4VmgPfIBmj8CPeSIXCNUwH44Aqv/MnTjLJr0Unp91yy6
 RNwiaQsIdWFwrJmGDn68HPTAwCrDv8nZMOq59ls5Vka/ppVFaRl/1swGpFVJMbWC7q4oEuF+
 djSMna+fZNaFufK3TUpHNmztCgVmk6Wk7ueDlIhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKah9GOACS82qDXGle2OFDEuCZVD8UK0XMXPErJD6pL0z+eGxYZQNiIA/nZ
 zQOWkowVLau3iefPFm8Kc7giwlGl/NLAgF4vsulKREhg==
X-IronPort-AV: E=Sophos;i="5.90,170,1643691600"; 
   d="scan'208";a="65836836"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGInGvEVPtBZe5ACQGq3x+TheC5neOefg/xrD7FhDouBKnFuxwmh3JVuEN5F5Zcs1bmsQw9/aQvIWR/kVyZUeFwuLs2h+N4fNfmHH23M8TxIvPUzTP7qEthP38A7DIBRF1ybDB+RV74Ek6/qFV0/dfBIwyZCM42RfwnPPZH4SGtA9pPEpEPO2XA/lXtsopz/m3v2d6aEPvJt/uw3umPr5QLKzIQ9ZbxM+oyYw23HGWX/U2ZtO/ITnEoGfob6UWz/jScpBvN1U3oVBJQihY8bs3zI0sIoCHEqACneNH4AXqt4hwO15i/W86xdhjf1ftyAxClVMjBuoDBkKeAQQdz+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qZMNVGZCiP4mGgElYaJw6QWZWK6tEObc9fFLKUfK9s=;
 b=Qn1URTsC3LZUr6Lo3NI4j95JVaXUUzD+Dda2Tf3MeVmUW//eZJx7bxsulwEL6w8gmjbUU0iV0BFQLdm8bAlocrgJpmiNUHF7WFcvSrM/Ckes03BrjdopQGoUDGwkMCAJQSWzrcBDMOsyLnyj6HTu783Mhzz4SZ5qwGM/YyMYFU/fKQqmySo/S1/PrJha/y5zDy2efACnzwtVev9O4N3NIHp/fcol3d+9x8wF6OFWJ+a6isEEnBNljOwYNb6+NZeMhxxFkU5cQkZ2lkRjhxwd7J2vy82ibF9zAXMxrOkwbVs3yTXpfihhfY9udUtkFkCmRCu3+dPcOXlWvWB2fmwabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qZMNVGZCiP4mGgElYaJw6QWZWK6tEObc9fFLKUfK9s=;
 b=G9i4TrQGk1KwNEA8IE6IN5HxP0hmyVs63bQeM7GzC8XPaDwOFFBP9QmUuZ4M25nScDIECXVot+pzyKmnFeN7trHbZr//jERZ6a8dhIuDTpV+SNTGYW5vTn+G/anD+TeF0poLZ8rpyClwioNrkHb+aKanQsY3A1Xl6Zu9SIer5co=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, "Pohlack, Martin"
	<mpohlack@amazon.de>
Subject: alternatives+livepatch testing
Thread-Topic: alternatives+livepatch testing
Thread-Index: AQHYNHo4adxTGvvXZUC/Revy/sIkdQ==
Date: Thu, 10 Mar 2022 12:27:34 +0000
Message-ID: <09e936c8-1110-a67b-cc67-9cf5ed5a3615@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40ac8bc0-f427-4aa7-01b9-08da02915b2f
x-ms-traffictypediagnostic: SN6PR03MB3952:EE_
x-microsoft-antispam-prvs: <SN6PR03MB39529C75377EB8AA51CACAD3BA0B9@SN6PR03MB3952.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ldHfwolfPc9xBaTCpmtI1v2JRq4R6kniifs9qtAl0rpn4IzylCXpl5ok9WpnNrAQjUMh+58eX1FBaiybSfzmPDUJxpb/4mTo+fZu9HqyWBdCHe973wMeS9HR/c0UaQC7Abj9dN4u2iWbUHE16b9aezs2tDtAptk2DUxs045l9zcWlBZGCHMvKslvxsquLNk8+YOJH2XPrm7VQ1XaY7YzApXU1H5hivdh5dV/pIcUkre19hD09flmFWUkH01QEpfgz/K2L22Zwl31Vy8ewsT5pZTa7g7JgdcSqd92GM1VzseMThU/MXtEO+wx7+nNlKH4e0xL6dIDAvA4q46uKiIGMI2mlzPgIasq7v5Uv/eCrJ6uyZ4FJgsdT5E4XQuR+OW8r/u9reFeOzfn1k9qkIQaDmv8RDWwORzobdkW4HMPmxJzIn2mf4SWraF7QxEOq36W8xHn1RDr2FYL2ei+8lCUfX20NLl53YO4WtJA7a0WdIWM5QDrcf8V2CcYJRlaXcisFK0Q3fars2i2YnZNBvh24y5vEq0NRJdm3gf6t2qZq3UCfY629wehwmNCrfGs0WjqAh1yKynXRikzI8eMKpLZGAFLEx5X2prOoI1dxi5KETSvzvLOezik9vJ+4DlrgfuBZNzE/1OmiKeiQmRNUuOwqDvKbaIeo643WNQ5ELSlYSsjkV55Kr8PF+1+lTOWJg3H7jQS1d3jZCW/n866v+WffsnKVLAP+bNGayXXBubBzOgUygfVwiiQFOWkEkryP9jn2rUvWU3s1tc8B4FEhDjBlrx7Lp8M2eCXwqD1A5j4a0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(8676002)(64756008)(66556008)(86362001)(36756003)(66946007)(91956017)(7416002)(2906002)(66446008)(66476007)(76116006)(2616005)(186003)(26005)(71200400001)(31686004)(83380400001)(508600001)(6506007)(6512007)(8936002)(316002)(3480700007)(31696002)(82960400001)(6486002)(5660300002)(110136005)(38070700005)(921005)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVJLZTRSa3IwYU4vdllSUnhVeCtacmJleU1YOEVrb2prYmtIUkRuditrQlNt?=
 =?utf-8?B?ZzQvK1dsaEJtWWtSRzBqUzFMelQ2RlhYK1d4dTZNcmlnOEQxUEtkMXpoTnV5?=
 =?utf-8?B?N1Y2NGtvTVlnT1F5UGhMcTJTNmUrak56OUJKNFoxdklUYnNGOFBXQnJPOUQ0?=
 =?utf-8?B?bXhkTTFabWZodnZwUjFmMkptczR4bGlKUmIzSUtSenI3bGNYdFVsWjlzTjYw?=
 =?utf-8?B?U3BtOW5JemJBbThjcnE3L2htT2dPZElIZGI0OG85QklLc3hSTk9yajg3NmRi?=
 =?utf-8?B?MDZGOEwzS1lDNjllUzNJNGxyRS9URXBEYnhKb0xBa2txYzFKRitNdUcwbmpj?=
 =?utf-8?B?N3owTm5pRUlyM3BTZURicUhDWjlKU1NkTEZURDR5U3ZIbFkwWHg2WlBaaFR3?=
 =?utf-8?B?c28xMTg4UmRJbURhMG5CQ21yY1lKa3FpZytVTGxSdzNTSXZTRWpkeWhzS3hL?=
 =?utf-8?B?NTdHMVZWNkFMTTU4QndWUUl5WFRXYkt2N2VyN0JzT1VqZ0pwTERRNXMyK3Bt?=
 =?utf-8?B?KzErOXlzU242YlNJdEsyNDQyVzh2SitmYW1BZWMzRXhuSlVIZGFFV3huYWFo?=
 =?utf-8?B?UkthTVFNU1ZGaWQzeUVFZG42WXI3N2JRS3FDNU51eXBXbzhFVE5mV296OTJZ?=
 =?utf-8?B?SkQ4QXYxbFhJd3RNdzNDVUFWaEVhMGxsR01qR2Z2bncrYTRuY3paUGQ1bGhH?=
 =?utf-8?B?MXIyN2hrQ1l3M1lZMUJaWnQzSlZnUkZBT09vbG9Tb0lmM3lKNEYwLzFnOTRx?=
 =?utf-8?B?UFdBRDE1ZVFITzFjUFVCbEROUFBnTGZNQjJ2UmRValcrOWZxdzJXa2lNUkFP?=
 =?utf-8?B?VzRXcGZNL1h0cW5zTTRadXk0elZjVTdHeWdRRVQvQWpvbE1TN1hNbHFYU1FM?=
 =?utf-8?B?V2xSK2ZnUFdTYVRJNVhZMzlleEwrTkkvbFhaVU5ld2V3eHl0c3E4RURaU2Uy?=
 =?utf-8?B?ME9ibTFRdzBjSitRY09mRGd5OURCRkJxYytGSlI2OWU5RDdGOHpZUEhqZTJr?=
 =?utf-8?B?WUhCczVrZFFBVDJac1V2USsxbzdWM09STDFnQ3Nma05OVkdBMzgzU1J0YjFM?=
 =?utf-8?B?Qzh5bVl0Nm1PVW11YTZENGE1OVpVNkJ3aEREeVVGRzh3VmtDYTduMVZQRzhH?=
 =?utf-8?B?cjdpRmczSlBwZ084blhNSGt3TGRBaXY1aC9qSy9BTWNXcE8xTEhxdVFvcmwz?=
 =?utf-8?B?YWFOZTdqUkVJenVTK0wrczA2TE4zRm5JbCtLbkFMSGRxU3ArZmFXc2I1YmVi?=
 =?utf-8?B?VGNaeU5qZjlUclRaSWJIbU9pbkpueUkrY1FXejEzWTRNWVJmN3pOeDNOYTND?=
 =?utf-8?B?eHdjNVRmSllUd1o0TmU0K0FJRFRtOVZMNTVvT3VxQUhmL1poc0J6SERmMVR3?=
 =?utf-8?B?Z0t6RS85WHgyRDV6R0FkYVlLVk11QTFnMm9MaVp4ZEExWkhYMitEa2hJZW9m?=
 =?utf-8?B?dGNaR1BySnBoOENzZ0xMYVYwTFpIQ1M3UXduOGVWNjVnUVNuZzdBdjhZamFs?=
 =?utf-8?B?TmdDeEE3K2VwTC82VXVrSTJMbStqZ2lmOWRVWFltdHo5RDZmTExsd1k1MUhi?=
 =?utf-8?B?ZjFKK1k3bXp1MVVzMm1KSm1hSTVIa1QyUW0rdGszUVNjZ1JBVW1IK3JqNGtp?=
 =?utf-8?B?VTE0ajM3SHRzV0tMbGxKeGtYbmJDeTRmVTh2VWlBZmY3aFNya2V0Z01KN0tk?=
 =?utf-8?B?V3N4RXJRNjJEclB6anJzUW9OUUJsUTByR3dCWE9YRnVwaFN4bWlFOThEOWJq?=
 =?utf-8?B?YXNoTEwxVytQa1liajRsaW1TNDBNZFY5Wkx0ejJ4OUlqaUpqNXV5S00yd2c5?=
 =?utf-8?B?ZDNOQ3FrYXRLMFMwc0l1aXdlRjJ3WG9DNUNyYVpZRDdCcUFWbGplaGhhdWZX?=
 =?utf-8?B?UWtYblpiWjZmWVYvYkJ1NU9XSUdXSDRnczhWRVhGYnRxc2ZJazNsWjhyZ0lP?=
 =?utf-8?B?WklqR0prUWJycDNpaEhjdmZWTTErNGtQb1E4U2d5cjg3UE53bXpJb2EvU2Q3?=
 =?utf-8?B?OFdobVBMVm81czFKaEJobFJ6eHRhemRCbWVsUGwrbU00ZnVCZ1JHOFUrek01?=
 =?utf-8?B?dGllN1ZHUUQva2JYalRlei9QMGNYQm8vcFNrNExub3BXbnpBRlUxNE5OS1Ns?=
 =?utf-8?B?S010NUdMd3ZORUc5WGl4MDA3YVhibFRJbTNOSHM2Sk5lbllEaVhlTTVKY1NU?=
 =?utf-8?B?K3ZvUHlqQVc4ZG15N2RCc3FZdHNDZ3JjNnVnaWloWlRyNlI3MlhpSzhidkZC?=
 =?utf-8?B?bWdPNDIzbFJaUm13ZXB6dHRTd09nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D76FF12039FA394780C3B2205B274DD8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ac8bc0-f427-4aa7-01b9-08da02915b2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 12:27:34.8729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+UK0hb1ZuSUnG1en7VWSK0ocTDV4v2f+c4gKXL9UGh+sAe/XzhjqFo3XfDADkZk4tgCJ43nq5LkWcoJ+aKfJZoP6xV61QHg1HP/sGANK4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3952
X-OriginatorOrg: citrix.com

SGVsbG8sDQoNClRoZSByZWNlbnQgaGljY3VwIHdpdGggQ0VULUlCVCwgYW5kIGRpc2NvdmVyeSB0
aGF0IGxpdmVwYXRjaC1idWlsZC10b29scw0KaGF2ZSBiZWVuIGJyb2tlbiBmb3Igc2V2ZXJhbCBy
ZWxlYXNlcywgZGVtb25zdHJhdGVzIHRoYXQgd2UgZG8gbm90IGhhdmUNCnJlbW90ZWx5IGFkZXF1
YXRlIHRlc3RpbmcgaW4gcGxhY2UuwqAgV2UgbmVlZCB0byBhZGRyZXNzLCBhbmQgZW5zdXJlIHdl
DQpkb24ndCBlbmQgdXAgaW4gdGhlIHNhbWUgcG9zaXRpb24gYWdhaW4uDQoNCkFsdGVybmF0aXZl
cyBhbmQgTGl2ZXBhdGNoaW5nIGhhdmUgYSBudW1iZXIgb2Ygb3ZlcmxhcHBpbmcgdGVzdA0KcmVx
dWlyZW1lbnRzLCBzbyBob3cgYWJvdXQgdGhlIGZvbGxvd2luZyBwbGFuOg0KDQoxKSBJbnRyb2R1
Y2UgYSBuZXcgJGFyY2gvc2NtLXRlc3RzLmMsIHdpdGggc29tZXRoaW5nIGFraW4gdG8gdGhlDQpl
eGlzdGluZyBzdHViX3NlbGZ0ZXN0KCkuwqAgSSdtIHRlbXB0ZWQgdG8gbW92ZSBzdHViX3NlbGZ0
ZXN0KCkgb3V0IG9mDQppbml0Y2FsbCBhbmQgY2FsbCBpdCBmcm9tIGluaXRfZG9uZSgpIChiZWZv
cmUgd2UgY2xvYmJlciAuaW5pdC50ZXh0KQ0KYmVjYXVzZSB0aGF0IGdldHMgc2hzdGsgdGVzdGlu
ZyBpbmNsdWRlZC4NCg0KRXZlbiB3aXRob3V0IGxpdmVwYXRjaGluZywgd2UndmUgZ290IHZhcmlv
dXMgcmVxdWlyZW1lbnRzIHN1Y2ggYXMNCmVuZGJyJ3Mgb25seSBleGlzdGluZyB3aGVyZSBleHBl
Y3RlZCwgYW5kIGdldHRpbmcgY2xvYmJlcmVkIHdoZW4NCnN1aXRhYmx5IGFubm90YXRlZCwgYW5k
IGFsdGNhbGxzIHR1cm5pbmcgaW50byBVRCBmb3IgYSBzdGlsbC1OVUxMIHBvaW50ZXIuDQoNCkl0
ZW1zIG5vdCB5ZXQgdXBzdHJlYW0gYnV0IG9uIHRoZSByYWRhciBpbmNsdWRlIGlubGluaW5nIG9m
IHJldHBvbGluZQ0KdGh1bmtzIGFuZCBTTFMgd29ya2Fyb3VuZHMsIHdoaWNoIHdvdWxkIGFsc28g
Zml0IGludG8gdGhpcy4NCg0KMikgUHJvdmlkZSAoaW4geGVuLmdpdCkgYSBwYXRjaCB0byBzY20t
dGVzdHMuYyB3aGljaCBPU1NUZXN0L290aGVyIGNhbg0KdXNlIGxpdmVwYXRjaC1idWlsZC10b29s
cyBvbiB0byBnZW5lcmF0ZSBhIHJlYWwgbGl2ZXBhdGNoLCBhbmQgYSBuZXcNCmxpdmVwYXRjaGlu
ZyBzdWJvcCB3aGljaCBjYW4gYmUgaW52b2tlZCBmcm9tIHhlbi1saXZlcGF0Y2ggaW4gdXNlcnNw
YWNlDQp0aGF0IHdpbGwgcnVuIHRoZSBzYW1lIGtpbmQgb2YgY29uc2lzdGVuY3kgY2hlY2tzIGFz
IDEpIG9uIHRoZSBwYXRjaGVkDQpjb250ZW50Lg0KDQpUaGlzIGxldHMgdXMgY3JlYXRlIHNwZWNp
ZmljIGNvbnN0cnVjdHMgYW5kIGNvbmZpcm0gdGhhdCB0aGV5IGdldA0KcGF0Y2hlZCBjb3JyZWN0
bHksIHdpdGhvdXQgaGF2aW5nIHRvIHNwZWNpZmljYWxseSBleGVjdXRlIHRoZSByZXN1bHQuwqAg
SQ0KKHRoaW5rKSB3ZSBjYW4gZG8gZXZlcnl0aGluZyBuZWVkZWQgd2l0aG91dCByZWZlcmVuY2Ug
dG8gdGhlIGxpdmVwYXRjaA0KbWV0YWRhdGEsIHdoaWNoIHNpbXBsaWZpZXMgdGhpbmdzLg0KDQpQ
cm92aWRpbmcgYSBwYXRjaCBpc24ndCB0b3RhbGx5IGlkZWFsIGZyb20gYSAibWFpbnRhaW5pbmcg
eGVuIiBwb2ludCBvZg0KdmlldywgYnV0IEkgdGhpbmsgd2UgY2FuIGhhdmUgYSBidWlsZC10aW1l
IHRlc3Qgd2hpY2ggY29uZmlybXMgdGhlIHBhdGNoDQppcyBzdGlsbCBnb29kLCBhbmQgaXQgaXMg
ZGVmaW5pdGVseSB0aGUgcmlnaHQgcHJpbWl0aXZlIHRvIHVzZSBmb3IgdGhlDQplbmQtdG8tZW5k
IHRlc3RpbmcuDQoNClRob3VnaHRzPw0KDQp+QW5kcmV3DQo=

