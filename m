Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA52339018
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 15:33:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97157.184412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiq2-0001ow-T8; Fri, 12 Mar 2021 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97157.184412; Fri, 12 Mar 2021 14:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKiq2-0001oX-Pj; Fri, 12 Mar 2021 14:32:26 +0000
Received: by outflank-mailman (input) for mailman id 97157;
 Fri, 12 Mar 2021 14:32:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kXEp=IK=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lKiq0-0001oS-If
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 14:32:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4b95671-79bb-4c92-ab0e-2292266d6767;
 Fri, 12 Mar 2021 14:32:22 +0000 (UTC)
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
X-Inumbo-ID: d4b95671-79bb-4c92-ab0e-2292266d6767
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615559541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=F9zmieDEj7O7bFb35FrXJgCrlhxvLbHXtkvrl5oXUds=;
  b=iC6L1hl8y0hQsTbX47mYask4986tGhXq7oYZBMlaU5WfdZoF4v8aWgpX
   pc/LnbLaLGaA0Z3meSyp5QyNFF9b8r4bKNOOWvpAjbR0YNauHS+aZBMBh
   OHqMw+NiWI1MpSZiwbq08nFDyei1CZLhRk+xUc/pNkt0eDjeAfcvpQ14W
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ELN8MqbEK2/pEDkBHR5xbscg+hjKyRSicJj7VxwSIV39R/2a4aeA/tyw2aDA8uioljz1Q5A3c4
 RFqXMHgo6wizQpsKts4wcr7/6Aa464jRdsn3GjbXWbmLdBUZC4FJoxZeiIw/e9wwbPZ1vg1W4i
 0fbksljtl784CinoLVEZ1vzzqn/g7pAHm9JAy3arhDKQ+Dpv3VUVjSv6b2VwdhJpAdBiS0WXEV
 b40KcIju/dRoHuaGYzopifGMiItCDzyA2nP1xdBiF5Tbjp5GKORTdXw5NVKOYzvBbweqC3CvR/
 uew=
X-SBRS: 5.2
X-MesageID: 39519006
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:m+L1QaNFEH4UhsBcT7rx55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfX7B1RikILe6A63D94vzLC8gd2VrM31pk0dKD1CQadm8gt/F0K6PyRNNUd7LLA+E4
 eR4dcCgjKmd2geYMjTPAh4Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uEg9n67Ek7G
 TDjkjF9ryu2svLhSP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUZZ5SspzYwydvfi2oCsN
 6JmBs4OtQ21nW5RBDOnTLI+y3NlAkj8GXjz1jwuwqineXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znmg/BjV3NTGWwpnkUC5uxMZ4JUupkdSTJcEb/tppZEflXklSqsoJj7w64wsDY
 BVfaXhzctWal+TYjT4uWRi0bWXLxIONyqGWUQLt4ip1SFXlhlCviwl7fEY901wlq4Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWlKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGOfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y859ISH9PcQP
 T2HJ5NGffsIS/PFO9yrkjDcqgXDUNbfNweu949VV7LiNnMMJfWuuvSd+uWK6HqFToiR2PjEn
 oOVDX+P6x7nweWc069pCKUd2Lme0T58541OrPd5fIvxI8EMZAJsgV9syX+2ui7bRl59oAmdk
 p3J73q1omho3OtwGrO52J1fh5UDkNf5qT8Q2pHzDV6an/cQPImgZGyaGpS1HyIKltUVMXNCj
 NSoFxx5OawNJyfxScrDtq9KWKEh34PpHaHJq1s3pGr1IPAQNcVH5wmUKt+GUHgDBpugztnr2
 9FdUsZXEPFDyjvjq+klZQQA+nae7BH8V+WCP8RjUiamVSXpMkpSHdeYiWnVtSPhx0yAxBOgE
 dqzqMZiL2cuDqmJGclmt4kOFlUZGn/OsMcMC21IKFv3pHiYkVZUHqDjz3ysWBNRkPas2Epwl
 HHAQLRU/fRGVZZsm1fyc/RgS1JX1TYWVlxZHB8uZB6DkLctB9IoLK2T6KuzmqcbUYDyOkBMD
 fDJSAfOB9q2srf7m/kpB+SUXoh3ZkgJerbEfAqdKzSwGqkLMmSmbgBBOI8xucpCPn+9usCUe
 eSYGauXULFIvJs3wyevXA+PiZo7HEijPPzwRXghVLIl0IXEL7XIF58QascLMzZ52/4R+yQ2J
 E8id4up+O/PiHwbdGBoJunJQJrO1fWoWSsSfsvpo0RtaUutKFrF52eSCDWzhh8rWMDBdaxkF
 lbTLVw4bjHNIMqd8sOezhB9l5skNiUNkMkvgH/H+dWRyBgs1bLe9eSp7bYo7smBUOM4BH9Pl
 SS6CVR9fbIVSnr789TN4sgZWBNLEQs4nVr++2PM5DKAAKxbudZ4R60NGS+fLI1ctnzJZwA6h
 Jhp9eGkO+ce3CmhETevT5nLrlP9GjiS8WoGw6IEfNJ9dv/OVnkuNre3OejyDPsDT28YAAEgI
 cAc0oaZMFKkCMjg406yTLacN2/nms1119FpSh6nVvs0JW86GjVHUtaIRTU668mLwV7IzyNl4
 DZ6uCW23T2/Shd1ZTCHElWeMtSG9J4dPmCEw5+bc4KvLCp+KIzgiNMJBc2ZlRM+wzA4w==
X-IronPort-AV: E=Sophos;i="5.81,243,1610427600"; 
   d="scan'208";a="39519006"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjzsFduRYAyifaGHrYi0zfRHN5cZk5NsexePCSHo5egghXt3GjbhJS8j5RjPjjcFdi5n+faX6bsEAdA7/PmsvDtZuXFGwGxZHJ5eDsRtC29wtMqvkYis22niCJhA8od4XgMslUi8dKePQrYpNrwW/ullb4wYyCwJPei+4HwnqFHaHMZVlBdpVlMAcnwLgvWPRDgtE6Jsk7SW65d/xgoaBn85tQ8wjm5LPVAQnKKZDiHauhciiWlyHjhyt7Ha/zQ761Km8Qx3P5T3QxxzrAhFsJ2+W9KL4HXcHeDmBS15Mvnku+jTBUceVJcNPakEceAmcJJL5HOHnorxlEJKW48/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9zmieDEj7O7bFb35FrXJgCrlhxvLbHXtkvrl5oXUds=;
 b=NjGL6gynPXEP+8XQ7YsvimxUvasf3MqcQCtYhmv9VTnvo3lunPk6tPQz/hBELfA+pUnjPbfIimkMtXJg3LCpqXjEdga9XdRFTnbwqoH15Tony1POG30LN1SKo5+1INm33isBN+Juxu4j4/QAuTxcwGZMntVTsOEDO1UIzMOkQHsBEwUYWWzbT8DSCpj1VvakqaSYhoGGbSUR4g20oO+9Qcsyl4uVYSOSzPsRo2lIRLN5JH1rd+6VWd51nsB72rJIVoWSG3lXxdGyVAvhhsvVHPUCGwEDcg8TOdYNH/PKoD6rXVnFi5OtlVpIecYcgY6V0xD6Kff62d0sk6E5CoIbMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9zmieDEj7O7bFb35FrXJgCrlhxvLbHXtkvrl5oXUds=;
 b=p3gIEk4TtHSm2/pPLbuTDXJkp0XQ7MdLDYNIpd4QMCTYAqbpQa0hSzX9Mk+my0XiDW7CPplN/I+XIIoAmClMm14nE/w6gbE9YmKAYtYLczbA99ktoi7YVJOy46rYAOjE00ZB5AS6O6sNqg3ZRhRaNx6X5Ylag6y4Gx/YtQI6nk8=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Topic: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
Thread-Index: AQHXBE6IzoDpW0Psi0SLnVWLvJvx9Kpa6FyAgCWn/QA=
Date: Fri, 12 Mar 2021 14:32:09 +0000
Message-ID: <63895FAD-B848-461D-8A31-E6C9973B6726@citrix.com>
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
 <b225be0f-3eed-426e-8829-6e7c57cd7635@suse.com>
In-Reply-To: <b225be0f-3eed-426e-8829-6e7c57cd7635@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27fed8c7-d09e-4e28-0d5c-08d8e5639e43
x-ms-traffictypediagnostic: PH0PR03MB5670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB56705A7F6B47DF0B5D6EF642996F9@PH0PR03MB5670.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GthCHZ0H7UcQj6N+upovMMYZaEVsSoJsOJgC66IduUpJGT19rz6ZNxEbooXcv71idQG2ZrhW4xFCv9CETahOB4itcF8pmir7vssTlg39R2T4B2kq7cXN4kkbYmbILqOO/Ba5ZVidTp+e+PIR2srADN5RNTCoKW5yPM6WhnjwLEbnRWVUkviWTtSPUjjbPrkL/I9QmOUiLZs7dQYe8v7YcZ4iyLTYg/oy77XrP0qv5ugVK/Tb/fPttw6Ww08CxFzkHuj4T9Af8ziEnB3S+qCdEiGcHt9GnmfEptZjzAFDvy+W1Gyg8SRzbMiPKS1LZw6Vukuj+Idj5Ex/qXUiYTE7hA+ug/EtbaAJN5DytzayMYzKgfQ5UWW+ivA6P14AFgmaKpzi3jPxdcWUCBMJH9OGiG/fF54ai+huRK1k/Crewn+QMhEZNbUkxmZvV848cvkOHOCgMFIYzpNUJfl6FHMVK0UphH1s4DDPQIbK6WLhLR7Qa8KKvp6p4UH5k/pRCkDbQJfWv3L0scjORQt4EudsBt8il7LytBB7WUdHD4HOmBTsgOPi5OhAf1rFkfmyYakqeAGn24ijlKfHVvhF3lKdTvs9Je9UvLJvt6xwvATi2CSBPjD34udUK2GCoJRNSyAd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(8936002)(26005)(8676002)(316002)(6486002)(71200400001)(2906002)(54906003)(5660300002)(4326008)(91956017)(6512007)(186003)(2616005)(33656002)(66946007)(64756008)(478600001)(76116006)(66556008)(66446008)(66476007)(86362001)(53546011)(83380400001)(6506007)(36756003)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?OUdFUUZ4SFFZaSthZVBJbTFiZ1NPVVBDUXZIUEIyU2ZjcW1OUnFSWnFOOWlH?=
 =?utf-8?B?NGpRWjdtaVNBdGlmMGY5UFZvS1VtSzZKOE1Ld2VMWitMYUIzeGRVc2MzcnB1?=
 =?utf-8?B?V0xzWEJNbHp4R0RLQXBGSW13cVQrMlVhS056RkdiUE1ZRk1zSXFML1M3WnNw?=
 =?utf-8?B?dGhiQVpHWDIzUWM4eHdEa1VMYnl3cjZaUnNFVHg2emhxcUQvM01xQ0dYNkZs?=
 =?utf-8?B?bG43TU8rWlVNS3RTck9NZjhBdzYrOVZFSVh6UGs5Z1JObWZJS3hwVzE3Z2Ns?=
 =?utf-8?B?ZzNiWTVUdU0zaWMrbkNKblVMdmVGSWpiOXNpbFRyZndJNFlVTGlFNFdqNHND?=
 =?utf-8?B?YmJlUG42UUtLTTdVaDRVQWM1NWU4QUN4RGJkcGtwSVZnK29OOC9EajYrUktZ?=
 =?utf-8?B?bmV5Rmg1WmZrUXFTem9GT2g0UnVIcFVyWm1VZXUwSU84M0c4ZUt0MHVyUys0?=
 =?utf-8?B?SWR3V2RiWnJwbUNtZEhoMTIvZG5HQ2s2MnROUkh6ek1TamZGZFRLZmduTFIz?=
 =?utf-8?B?VUZURUJTRWtrcjh3WnRHYkxJMzlDdGQrN1pIbDdkNFVHeUNmTjlhWnFhalNL?=
 =?utf-8?B?V0lIUi9nU1pMQ0RLdmw0bWtmVnNDWnRTaHpsU3UwamhPMWE1VDI5NDhRMDl1?=
 =?utf-8?B?Y0NyK0hJcDNPamVjYm9JMDZEZktmYVhpUHpzQzMzY3FLV0V5UzhCdlN6eFdi?=
 =?utf-8?B?NjB4cWxybERxTEhETm96eFpCd3J3cCtjWXZLSmlESEhEZTJvZUcwRXJxNGhp?=
 =?utf-8?B?bVQ1eXpXcWhwdkw3cVpoUnUzaVVuNUVnUjk3M0VCdnQrN3gvRnlONWkyMmNv?=
 =?utf-8?B?MnJNa0ZZQ1lFM2lKSnVmNUFmTXFpWjlHdFVqbmtLYlRRM2wzQlZ0d2V0bHds?=
 =?utf-8?B?TmoyWVJMT3VoNGdrYTM0bzJ3UXRxUkJyRjhDT05ybkVucENFWmNlS2hWZCtq?=
 =?utf-8?B?TFVGTndlUHRCeTA1V0Z6bGhUVTJiUndrSjdLN3IrRnFCTGpRaVpNSnROSVZK?=
 =?utf-8?B?YWcrcWlyQWozWUo0THZlWndrejI1dnZBOTRPOVpySnRSbjNJY2VlNWR4M2NO?=
 =?utf-8?B?Z2xVOW1Ec2xtdHpYNUhPYmRVVFA5VkxRQy9Ja3h3MVFUSXJpLzcwUjlyNXpF?=
 =?utf-8?B?aXhyZlUwbHJwSzAxYWRXdCtuVis0dldpWW5wOEdudW5uaWZjMmNxU0dkcnBa?=
 =?utf-8?B?T2w5YmkzYjFNT0hiTWxvRHJXK2orVS9zd05YNXhzSzdMV1c1R0ttbnJqV2hF?=
 =?utf-8?B?Q3VtQitVOG9CNEVDYjErbkJDdlAySk9mN1pNU2dma05jNENicHA2WmsyWGhM?=
 =?utf-8?B?L1J2eVVObmJWY2oySm9mMk9DNGRIZ3NkNE5MZnMyTlhBbVVYdUFkR0orM3hC?=
 =?utf-8?B?R2FRa1hrbFl5ZndOeDJ6ZXRyNmZCWmpDNjlvTFRZUTQ1ZS9Nbkd6Z1E0cmpF?=
 =?utf-8?B?SktDMUtJbzlrd3J3M3U3U1lSSjl2R25zNkFVRFZEaUpMSjZVSERuMFJRQXI0?=
 =?utf-8?B?Y1dZTitrSVhlTmF2dk9EdVI4ZkFPOTNncThGbzc2QmV5SDk4SVhHSlpZcXNB?=
 =?utf-8?B?TnNVeTRvbEVmTm55Zm9CRUZKTUlxVTZzWERhNWtySVVWcjFidGhqQTd0dlA1?=
 =?utf-8?B?OTZhd05MRjFhTHdqZ3dPcE85aW44U3RpWjY3NnFDa2lBaVRRVnRuS3M4Y2Fu?=
 =?utf-8?B?TlV3SktnUTFuSFpjaEo0N2FVMjFuSnkrMkhPSk0zbXFjT1VCRUFuNFA3ZDc0?=
 =?utf-8?B?bWlGWHF0UEpvc3RNU2xvWWNmMDdVUEMyZnJWRVdsa3kvTEJaT0FLV1ZGK0VM?=
 =?utf-8?B?QjJDU1VqVHc1cS81enlIdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2924BA54739ECB418C97F87B461A3E9E@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fed8c7-d09e-4e28-0d5c-08d8e5639e43
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2021 14:32:09.1776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlvNgi/vGdlDR1mnJ/kvCCS25FJl7yInXcCw83zJEl/wXp2E/Q8EDKAWlTvlj3lywUNPMZ0sGxqXeu/MXMTPrmLSnywnwEw+cQ8iqISH3dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5670
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDE2LCAyMDIxLCBhdCAzOjI5IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTYuMDIuMjAyMSAxMToyOCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RvY3MvaHlwZXJ2aXNvci1ndWlk
ZS9tZW1vcnktYWxsb2NhdGlvbi1mdW5jdGlvbnMucnN0DQo+PiBAQCAtMCwwICsxLDExOCBAQA0K
Pj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBDQy1CWS00LjANCj4+ICsNCj4+ICtYZW5o
ZWFwIG1lbW9yeSBhbGxvY2F0aW9uIGZ1bmN0aW9ucw0KPj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09DQo+PiArDQo+PiArSW4gZ2VuZXJhbCBYZW4gY29udGFpbnMgdHdvIHBv
b2xzIChvciAiaGVhcHMiKSBvZiBtZW1vcnk6IHRoZSAqeGVuDQo+PiAraGVhcCogYW5kIHRoZSAq
ZG9tIGhlYXAqLiAgUGxlYXNlIHNlZSB0aGUgY29tbWVudCBhdCB0aGUgdG9wIG9mDQo+PiArYGB4
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuY2BgIGZvciB0aGUgY2Fub25pY2FsIGV4cGxhbmF0aW9uLg0K
Pj4gKw0KPj4gK1RoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRoZSB2YXJpb3VzIGZ1bmN0aW9ucyBh
dmFpbGFibGUgdG8gYWxsb2NhdGUNCj4+ICttZW1vcnkgZnJvbSB0aGUgeGVuIGhlYXA6IHRoZWly
IHByb3BlcnRpZXMgYW5kIHJ1bGVzIGZvciB3aGVuIHRoZXkgc2hvdWxkIGJlDQo+PiArdXNlZC4N
Cj4gDQo+IElycmVzcGVjdGl2ZSBvZiB5b3VyIHN1YnNlcXVlbnQgaW5kaWNhdGlvbiBvZiB5b3Ug
ZGlzbGlraW5nIHRoZQ0KPiBwcm9wb3NhbCAod2hpY2ggSSB1bmRlcnN0YW5kIG9ubHkgYWZmZWN0
cyB0aGUgZ3VpZGVsaW5lcyBmdXJ0aGVyDQo+IGRvd24gYW55d2F5KSBJJ2QgbGlrZSB0byBwb2lu
dCBvdXQgdGhhdCB2bWFsbG9jKCkgZG9lcyBub3QNCj4gYWxsb2NhdGUgZnJvbSB0aGUgWGVuIGhl
YXAuIFRoZXJlZm9yZSBhIGJlbmVmaXQgb2YgYWx3YXlzDQo+IHJlY29tbWVuZGluZyB1c2Ugb2Yg
eHZtYWxsb2MoKSB3b3VsZCBiZSB0aGF0IHRoZSBmdW5jdGlvbiBjb3VsZA0KPiBmYWxsIGJhY2sg
dG8gdm1hbGxvYygpIChhbmQgaGVuY2UgdGhlIGxhcmdlciBkb21haW4gaGVhcCkgd2hlbg0KPiB4
bWFsbG9jKCkgZmFpbGVkLg0KDQpPSywgdGhhdOKAmXMgZ29vZCB0byBrbm93Lg0KDQpTbyBqdXN0
IHRyeWluZyB0byB0aGluayB0aGlzIHRocm91Z2g6IGFkZHJlc3Mgc3BhY2UgaXMgbGltaXRpbmcg
ZmFjdG9yIGZvciBob3cgYmlnIHRoZSB4ZW5oZWFwIGNhbiBiZSwgcmlnaHQ/ICBQcmVzdW1hYmx5
IOKAnHZtYXDigJ0gc3BhY2UgaXMgYWxzbyBsaW1pdGVkLCBhbmQgd2lsbCBiZSBtdWNoIHNtYWxs
ZXI/ICBTbyBpbiBhIHNlbnNlIHRoZSDigJxmYWxsYmFja+KAnSBpcyBsZXNzIGFib3V0IGdldHRp
bmcgbW9yZSBtZW1vcnksIGJ1dCBhYm91dCB1c2luZyB1cCB0aGF0IGV4dHJhIGxpdHRsZSBiaXQg
b2YgdmlydHVhbCBhZGRyZXNzIHNwYWNlPw0KDQpBbm90aGVyIHF1ZXN0aW9uIHRoYXQgcmFpc2Vz
OiAgQXJlIHRoZXJlIHRpbWVzIHdoZW4gaXTigJlzIGFkdmFudGFnZW91cyB0byBzcGVjaWZ5IHdo
aWNoIGhlYXAgdG8gYWxsb2NhdGUgZnJvbT8gIElmIHRoZXJlIGFyZSBnb29kIHJlYXNvbnMgZm9y
IGFsbG9jYXRpb25zIHRvIGJlIGluIHRoZSB4ZW5oZWFwIG9yIGluIHRoZSBkb21oZWFwIC8gdm1h
cCBhcmVhLCB0aGVuIHRoZSBndWlkZWxpbmVzIHNob3VsZCBwcm9iYWJseSBzYXkgdGhhdCBhcyB3
ZWxsLg0KDQpBbmQsIG9mIGNvdXJzZSwgd2lsbCB0aGUgd2hvbGUgY29uY2VwdCBvZiB0aGUgeGVu
aGVhcCAvIGRvbWhlYXAgc3BsaXQgZ28gYXdheSBpZiB3ZSBldmVyIGdldCByaWQgb2YgdGhlIDE6
MSBtYXA/DQoNCj4gDQo+PiArVExEUiBndWlkZWxpbmVzDQo+PiArLS0tLS0tLS0tLS0tLS0tDQo+
PiArDQo+PiArKiBCeSBkZWZhdWx0LCBgYHh2bWFsbG9jYGAgKG9yIGl0cyBoZWxwZXIgY29nbmF0
ZXMpIHNob3VsZCBiZSB1c2VkDQo+PiArICB1bmxlc3MgeW91IGtub3cgeW91IGhhdmUgc3BlY2lm
aWMgcHJvcGVydGllcyB0aGF0IG5lZWQgdG8gYmUgbWV0Lg0KPj4gKw0KPj4gKyogSWYgeW91IG5l
ZWQgbWVtb3J5IHdoaWNoIG5lZWRzIHRvIGJlIHBoeXNpY2FsbHkgY29udGlndW91cywgYW5kIG1h
eQ0KPj4gKyAgYmUgbGFyZ2VyIHRoYW4gYGBQQUdFX1NJWkVgYC4uLg0KPj4gKyAgDQo+PiArICAt
IC4uLmFuZCBpcyBvcmRlciAyLCB1c2UgYGBhbGxvY194ZW5oZWFwX3BhZ2VzYGAuDQo+PiArICAg
IA0KPj4gKyAgLSAuLi5hbmQgaXMgbm90IG9yZGVyIDIsIHVzZSBgYHhtYWxsb2NgYCAob3IgaXRz
IGhlbHBlciBjb2duYXRlcykuLg0KPiANCj4gSVRZTSAiYW4gZXhhY3QgcG93ZXIgb2YgMiBudW1i
ZXIgb2YgcGFnZXMiPw0KDQpZZXMsIEnigJlsbCBmaXggdGhhdC4NCg0KPiANCj4+ICsqIElmIHlv
dSBkb24ndCBuZWVkIG1lbW9yeSB0byBiZSBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMsIGFuZCBrbm93
IHRoZQ0KPj4gKyAgYWxsb2NhdGlvbiB3aWxsIGFsd2F5cyBiZSBsYXJnZXIgdGhhbiBgYFBBR0Vf
U0laRWBgLCB5b3UgbWF5IHVzZQ0KPj4gKyAgYGB2bWFsbG9jYGAgKG9yIG9uZSBvZiBpdHMgaGVs
cGVyIGNvZ25hdGVzKS4NCj4+ICsNCj4+ICsqIElmIHlvdSBrbm93IHRoYXQgYWxsb2NhdGlvbiB3
aWxsIGFsd2F5cyBiZSBsZXNzIHRoYW4gYGBQQUdFX1NJWkVgYCwNCj4+ICsgIHlvdSBtYXkgdXNl
IGBgeG1hbGxvY2BgLg0KPiANCj4gQXMgcGVyIEp1bGllbidzIGFuZCB5b3VyIG93biByZXBsaWVz
LCB0aGlzIHdhbnRzIHRvIGJlICJtaW5pbXVtDQo+IHBvc3NpYmxlIHBhZ2Ugc2l6ZSIsIHdoaWNo
IG9mIGNvdXJzZSBkZXBlbmRzIG9uIHdoZXJlIGluIHRoZQ0KPiB0cmVlIHRoZSBwaWVjZSBvZiBj
b2RlIGlzIHRvIGxpdmUuIChJdCB3b3VsZCBiZSAibWF4aW11bQ0KPiBwb3NzaWJsZSBwYWdlIHNp
emUiIGluIHRoZSBlYXJsaWVyIHBhcmFncmFwaC4pDQoNCknigJlsbCBzZWUgaWYgSSBjYW4gY2xh
cmlmeSB0aGlzLg0KDQo+IA0KPj4gK1Byb3BlcnRpZXMgb2YgdmFyaW91cyBhbGxvY2F0aW9uIGZ1
bmN0aW9ucw0KPj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4gKw0KPj4gK1VsdGltYXRlbHksIHRoZSB1bmRlcmx5aW5nIGFsbG9jYXRvciBmb3IgYWxsIG9m
IHRoZXNlIGZ1bmN0aW9ucyBpcw0KPj4gK2BgYWxsb2NfeGVuaGVhcF9wYWdlc2BgLiAgVGhleSBk
aWZmZXIgb24gc2V2ZXJhbCBkaWZmZXJlbnQgcHJvcGVydGllczoNCj4+ICsNCj4+ICsxLiBXaGF0
IHVuZGVybHlpbmcgYWxsb2NhdGlvbiBzaXplcyBhcmUuICBUaGlzIGluIHR1cm4gaGFzIGFuIGVm
ZmVjdA0KPj4gKyAgIG9uOg0KPj4gKw0KPj4gKyAgIC0gSG93IG11Y2ggbWVtb3J5IGlzIHdhc3Rl
ZCB3aGVuIHJlcXVlc3RlZCBzaXplIGRvZXNuJ3QgbWF0Y2gNCj4+ICsNCj4+ICsgICAtIEhvdyBz
dWNoIGFsbG9jYXRpb25zIGFyZSBhZmZlY3RlZCBieSBtZW1vcnkgZnJhZ21lbnRhdGlvbg0KPj4g
Kw0KPj4gKyAgIC0gSG93IHN1Y2ggYWxsb2NhdGlvbnMgYWZmZWN0IG1lbW9yeSBmcmFnbWVudGF0
aW9uDQo+PiArDQo+PiArMi4gV2hldGhlciB0aGUgdW5kZXJseWluZyBwYWdlcyBhcmUgcGh5c2lj
YWxseSBjb250aWd1b3VzDQo+PiArDQo+PiArMy4gV2hldGhlciBhbGxvY2F0aW9uIGFuZCBkZWFs
bG9jYXRpb24gcmVxdWlyZSB0aGUgY29zdCBvZiBtYXBwaW5nIGFuZA0KPj4gKyAgIHVubWFwcGlu
Zw0KPj4gKw0KPj4gK2BgYWxsb2NfeGVuaGVhcF9wYWdlc2BgIHdpbGwgYWxsb2NhdGUgYSBwaHlz
aWNhbGx5IGNvbnRpZ3VvdXMgc2V0IG9mDQo+PiArcGFnZXMgb24gb3JkZXJzIG9mIDIuICBObyBt
YXBwaW5nIG9yIHVubWFwcGluZyBpcyBkb25lLg0KPiANCj4gVGhhdCdzIHRoZSBjYXNlIHRvZGF5
LCBidXQgbWVhbnQgdG8gY2hhbmdlIHJhdGhlciBzb29uZXIgdGhhbiBsYXRlcg0KPiAod2hlbiB0
aGUgMToxIG1hcCBkaXNhcHBlYXJzKS4NCg0KSXMgdGhhdCB0aGUga2luZCBvZiB0aGluZyB3ZSB3
YW50IHRvIGFkZCBpbnRvIHRoaXMgZG9jdW1lbnQ/ICBJIHN1cHBvc2UgaXQgd291bGQgYmUgZ29v
ZCB0byBtYWtlIHRoZSBndWlkZWxpbmVzIG5vdyBzdWNoIHRoYXQgdGhleSBwcm9kdWNlIGNvZGUg
d2hpY2ggaXMgYXMgZWFzeSBhcyBwb3NzaWJsZSB0byBhZGFwdCB0byB0aGUgbmV3IHdheSBvZiBk
b2luZyB0aGluZ3MuDQoNCiAtR2Vvcmdl

