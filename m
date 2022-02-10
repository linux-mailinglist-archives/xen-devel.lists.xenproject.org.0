Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65664B1354
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 17:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269926.464073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nICYQ-0000tB-2a; Thu, 10 Feb 2022 16:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269926.464073; Thu, 10 Feb 2022 16:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nICYP-0000pz-Uu; Thu, 10 Feb 2022 16:44:21 +0000
Received: by outflank-mailman (input) for mailman id 269926;
 Thu, 10 Feb 2022 16:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WSD=SZ=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nICYP-0000pt-1F
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 16:44:21 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b037ec67-8a90-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 17:44:19 +0100 (CET)
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
X-Inumbo-ID: b037ec67-8a90-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644511459;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=jnAPNwQQMyD9COZq7rihczUEKGyFhk3h5JAkxSS0Za4=;
  b=cpcf2xj8PMTEbCT1FgLXR2HLg63Jav/oNLjt7KVG5rzwmpwu3B3ZTeMO
   Kmspd9B9VE4uZKpe7KmiX3xVT8a7VCcMYFpaHrawCkC583oJd7lSHowaH
   vmOL8QLAVInRaRhqTCia3DxwahAjOunbB+6agfrAgaZgyjWTIClGJMZSS
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Tyvxnc8Bq5saz9L51uqLhndi0e9jT8Ll3euU3pa6NKQ4xjQw9vx1rIRJWCa0wc1ZuNKAKq3wuo
 MhypfAJrz2LfDM+tr6iK9r3IhvQgVUNZ0Tr/60AXsOgml+vTWv6EuLpaSy3obQCblFTv2/aPSl
 GzHKdKeC0hy3JNeB9wzJ7b9lYZOa5sGZKGHlYzbICDC+tm69UZT5Ptz1c7X9a6ME4y6EIGE8Yy
 J6hUdPk0diDBnuFfJRh1zGKCFzHjlU6Ea8H76aRD7gfW4Tc0UwLxXBRiMhpz6qflPfJd/5u/FE
 tMeccYntJoaaZS9KMNjYrscS
X-SBRS: 5.1
X-MesageID: 63852661
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kOiid6pgx+yaYXPGnVa6ciQKESVeBmJcYxIvgKrLsJaIsI4StFCzt
 garIBnSP/7fNjH9e48lYNyy8U5T6p/dmoVlTAE6qysyFiIW85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dndx4f5fs7Rh2NQw24HhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbKMQyI1eaDoouE6XhxBFHBTZ4lK27CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFKEWvHwm6DjdBPIvR53rSKTW/95Imjw3g6iiGN6AP
 JpEM2QxNXwsZTVBHGcXCLUbnt2Yg1rcdyNirVbNmq8otj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/Hhr5s0lQnnVct4Hei+ididJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjrb1RCspoQjzZGeC4wZgY9+IPaikyleOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4EyvhX1
 XCzK5jEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbAfVNLhht/Pb8W05F
 uqz0ePRkn2zt8WkPEHqHXM7dwhWfRDX+7iqwyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwRFmqZq25AMfEQbuVKLXyWuO5HBAL8CBAXdJ98XQ3ZvNjiewrk7i4VCSSr88A5p
 tWdOsnzG/LvnixuU5TbbuyB1VS0sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfBexARKvoNwHqxF16U749ez9bZWwh49RCfAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoSQdDKhAkY+KP0eAvtgPTtfllcl/n4CJX/aacVRkANRe7lyEAfqB+N5kow
 Ll9tZdOuRC/kBcjLv2PkjtQqzaXNnUFXqgq6sMaDYvshlZ5w11Oe8WBWCr/4ZXJYNRQKEg6Z
 DSTgfOa1bhbw0PDdVs1FGTMgrUB1chf5kgSwQ9QPUmNl/rEmuQzjU9Y/jkARwhIyglKjrBoM
 W9xOkwpfaiD8l+EXiSYs7xAz+2ZOCCkxw==
IronPort-HdrOrdr: A9a23:A3HMX6m+NAvlpqcq3i4RoEEn1/TpDfODimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WGIVY3SEjUOy1HYU72KirGSggEIeheOudK1sJ
 0AT0EQMqyJMbEXt7eZ3OD8Kadc/DDlytHpuQ699QYXcegCUcgJhG0Vanf5LqQ1fng9OXNQLu
 vH2iMtnUvGRZ1jVLXDOpBzZZmkmzSkruOCXTc2QzocrCWehzKh77D3VzKC2A0Fbj9JybA+tU
 DYjg3Q/MyYwrKG4y6Z81WWw4VdmdPnxNcGLteLkNIpJjLljRvtTJh9WoeFoCs+rIiUmRQXeZ
 j30lId1vZImjTsl1KO0F3QMs7boW8TAkrZuBulaL3Y0JTErXwBepF8bMliA2XkAgIbzaBBOe
 Rwrj+kXtNsfGP9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+bo7bWrHAbocYa
 JT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsuYDcSzciFYryL7mYRtPiTyYY
 fHBK5r
X-IronPort-AV: E=Sophos;i="5.88,359,1635220800"; 
   d="scan'208";a="63852661"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK6wEUzNKPwO7/AD10QqV7BPeS6CbwGF1bV0GOfL1mWNlnXKa9BvqNJiPT4mmrKA0FabfBdu1VZAkCuWCXWFSeGZxOoE4MtwB+OxtzctkHY6AAlARNRr6+vbyget9DPTeg5AoTeJsE5Uw430EDqV8a7jfrik6jsnTBhmtYoM3gRbWsbtQkUtPz9KKPpsXhb+R2A883PnndwFSyijDuKvQv+7vDYJKZ7hhur+8WNqFPswUmIAT1LoW3kEc7xbgLkZUoXIxZPQMObefOxI2zEGzspqnCq2oy1zHvrbm+3mihRk0ZYc1GCUQQfninyLxPk0S1L8Udq5jcVY1FSwxFi4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnAPNwQQMyD9COZq7rihczUEKGyFhk3h5JAkxSS0Za4=;
 b=RT1rHm+1IuoGroVDwObZkBv4vMf1zIVwCWFNXnr185j9Z/3E7dKMyKVdpKWWKgjbaLL/nrLtpKQoqjWsIKfFp0R0B3K8CvFA3dO2yfpu9Vhwv1cHlPVX4affM5Gl5k5xFC2LrJYx4fetWjRF48aLU9gsYZrNCCOJxI1d7/+z0SYmZriq7Ad7gwmXoPN1PYZbyFQqoWHyOZLK0swS0MkV6d0d1+V+M9upKoX3n0jruySC9yzS0Ljo2y2quZijifB17ariTL2LG1XeCgrtrJhoszCzIhHLgwtuTmJYZLnZfAicc9rxyXoZ+GP+NGA7WQVV9NdnHXOSHahiolvmWcHIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnAPNwQQMyD9COZq7rihczUEKGyFhk3h5JAkxSS0Za4=;
 b=Eq9fP9fcqc2CDm6isPH/hG4xmCSyDkQMnpa4Rii7cSrG631pGpXsj5FA1fxdo4zpPq9ymlNul9vOr7RPGeNny0dwJSs6nSS9mnj2fpGwrLgFS8grm9UlpyIKA/MJMuhrChi3WW22jXZ9CRcuEmfd4SEyJotIomAUjigi15KXvD0=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Topic: [PATCH v2 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Thread-Index: AQHYHE+bJUKmznundkO+jjEyYTnVA6yMk94AgABuRQA=
Date: Thu, 10 Feb 2022 16:44:13 +0000
Message-ID: <be53fdb6-aa5d-ef6c-aedf-64a8fc1c3d11@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-3-jane.malalane@citrix.com>
 <YgTkRtwqmZsLZIXo@Air-de-Roger>
In-Reply-To: <YgTkRtwqmZsLZIXo@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22dce0d-316e-4078-d58b-08d9ecb491f8
x-ms-traffictypediagnostic: MWHPR03MB2782:EE_
x-microsoft-antispam-prvs: <MWHPR03MB2782029C669A5ED60BA6DF3A812F9@MWHPR03MB2782.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2aYaHtRSVF8nzxYX98IqffVK3hyLcb9MdX5hLyKCW14x5oE4N12bvuB/jZTlquPVQbxS2jr+EWvVgbTf7UhBmi5woj/Uwkq0wa+QqQOUYAWkYYPR+Ta9yFq7IpLSc/StOdqCarQcnC3cmMNzeC3yeplto43+vfMv38BWPoFmuCoUXTkWu5qzHJQSsGpIHemMMFhi/CmqyHWXwAZEoJoiikRrHGdPRM5JMrPq5lmP0Wkk7ZMijY/gwpTmDOieaDTm1WGrv9ntDFZ6d1rvR5dt8stfx1yRBhDRFjJOeTtXnZn0LZJUHvkL0NpRiBLy0QGp1cJXYKn26smv8US2nMjKURljhSzOC2XoWfuiibdJOVsdlQ2hGezuCQhKUxEeg8nxLWN+jsUDAVuvDLv+IQGz404kH51E8riFiEVJKarBVT8SbGzyiB1JRYMaTHWaoG86+bGi+wAIuM9D+hfBBVMaiiLysN7nnEdpREFsVSemooooxzTJgUFwF2FMX8fd0eXflheUUp7DT4dwKh7wywSJInNRJUVbFGOFoqApnve3peEVUah2rMRbBfCPRgMbaoTDp8d+agyyR02PE8djrQ7MmFaH6YO0Qp5U4JhZ5yx+oIxKTFj34TiUg2vrRVm2xmAZOUvKPgBk7k96r8q7VuRqxiBEAkrpX4/yKe1YsU7Orutn4OZ/tAIFRqZXHRMBYbxN/J+ZPq+/Z9LrA6D2gaFr3pdjD3TmdqecL1E5FEh0yT4+D7i8SuUNYPGPdVNNQl6E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2906002)(37006003)(54906003)(71200400001)(316002)(26005)(186003)(2616005)(5660300002)(31696002)(6636002)(8936002)(66556008)(66476007)(64756008)(66446008)(66946007)(8676002)(6862004)(91956017)(4326008)(86362001)(76116006)(36756003)(6506007)(122000001)(6512007)(508600001)(82960400001)(38070700005)(31686004)(38100700002)(53546011)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emY5MG5Rd1hoQUYrWDBQWmJ1KzVVOFBoUjJLUlY1TjQxb0xsT3JHWURkZ1hC?=
 =?utf-8?B?bDVRd1laQXNRb2grdHh5M2RJV0YxVFhkR1QweG9TcTl0Z1lvSVRZVkU1UDJN?=
 =?utf-8?B?YjdjZ3NURFdoR2NORGJkdUNybWVxVXM4VmNjQVBZZXVEL3pndWhMaFhBandY?=
 =?utf-8?B?dzZCblR0dGlCeWlJVnh4ZlpmdExZVkFsNExqazZGTTNEWExlSVgzc1ZFSExU?=
 =?utf-8?B?NE5GazFURmdVQldGTFA2Mk50UjJXbnhGODFhTExNc0NzaHJnaHFMbWlGT3Rr?=
 =?utf-8?B?Qkg4cVRINEJ1M2wxbnNzdzA3eXNPYkQ5WHJFb1pkUnFBR1hmcFhFN3FGWEtD?=
 =?utf-8?B?WDcvWE5MREh6STl6MGpPUHlONnA4YWpiT2c2R25BSGsrOFhkRVFkT3dLck13?=
 =?utf-8?B?RHFTd3FxS084Q29kWnMyUUZuNUxrdFFOOWN4V3IzRXE0RlhCcGxUU2FHa0k1?=
 =?utf-8?B?Z2szRHAvVTl4MnpaeWlHRXUxaWRobEtVNGFMQmkvL3pNaG9IUnQwTXo4bHRJ?=
 =?utf-8?B?dTBmVVJWd3lpeGlVdEJyUjN4UUJveEE5SUx3TCtBNkpaNmQveENWWVhwREI2?=
 =?utf-8?B?NFZJcFpjN3hWdys0UHNIMFdpL3JwVGpHVWcrTjBjWG00SjdaR0NrdWhnNC9R?=
 =?utf-8?B?YnFkWkdtdlpPaGs4NjZadDJlb0lad1l6dVlRMHhMTWNHd3hqYU1WblZxdERw?=
 =?utf-8?B?M0NveGUrMUQ3MVh0K2NmdjJLTnBQZldaSHhLVEl5cXpmOVUvSFJmOGlEL1hz?=
 =?utf-8?B?eWp5MkdSK3l0K3EzUXYrU2RVY215ZTR3N2gwRTkzR05mMjVHaWlvaUFLRll3?=
 =?utf-8?B?UHdJQ0dMQ1d2UTNQZzZBSUxiSHhPQnMxMS92OWJ6RWdONHdQaTlUSWp5Uitq?=
 =?utf-8?B?eGE5VnlCVTJSeTh1R05McDYrZ3M1VkR2Z0Y3QU9ZeEVUQlZ6NzFuWUxMMWNo?=
 =?utf-8?B?RTVUeFZiSjY3bVBrZVAyUUo0THdKSnN4b1dySEE1QkVvMXE4R0pkcnlRSGRu?=
 =?utf-8?B?MytCZXU0ekNRdkIyM3NJTXdYcEYzWFZJT2pyZ09kMjZEQWorYUx6WkQrakRO?=
 =?utf-8?B?KzkrYXZ5dTJrV1VIWHVSNk9pR25Ja0dHZ3pjUzZtV0NOUFNtTEJGeG9EWFd6?=
 =?utf-8?B?UjhiMW5BcGVBUzVOMEliRGlBejd3MDB3RXQyR3dlVGxtT2xEa3NMdDhhd05M?=
 =?utf-8?B?d3pmMm5jalZaMm1hV1NCcVRJUjVKV0VnQndWbWd4MXZ2cFl6RjhQdE9MZ0xn?=
 =?utf-8?B?K2hsN0NkaXlHOGR1b2xSd3B4aDk4bERxR3RCbmVTWGMxQm9pUWFSTisra29T?=
 =?utf-8?B?cm8zanI2L2t6N0hYNnVqOTNhZy95WWExNzQvOGoxRjltcm1HNEhjSExnLzg3?=
 =?utf-8?B?U2FRUUtZMUZJdjZPZHo1WmM2czNCcXQ4czlaZ3F6MHlLc2YrZnNkL1U5OHhU?=
 =?utf-8?B?a04rUTZzbmpNMmNHYXJiUmdJQTBTVFdWeWFFZVJJRlFlcnJ4M2tqbmc3UFpV?=
 =?utf-8?B?d1U5QXZWVk01R202eWdhaEp6TFd1NFpka013dUt6K2xoVVpnSks3WVVCSnJW?=
 =?utf-8?B?S3MxWmd6V0RUZk8rZlRsR3ZHVkxiRUxnSVdRc0tjTmkwTWFvTlMyTGwrOFBq?=
 =?utf-8?B?LzhjeityTWx5V29ubUV3d1hmWGQ5QkR0VmVHOFFJcGJmVGlNcEFnNVZqNTI2?=
 =?utf-8?B?aUdsVXJnS0V6OHV0bko2N1lZLzA4ajR2MW5BbmkraW9GdEVuUTlXMmdZd0lD?=
 =?utf-8?B?c3BndnkyZ3FON0FxOVdVREtsR0RLbFdlM0owYVpYZkk2ZkVvVjRPZXRmb3pj?=
 =?utf-8?B?eWpiOXk1TzRva01HUWl2S0pGaW85NlAwWXNvUXlHdU1zNjFWUGZLUWtaNWlM?=
 =?utf-8?B?eGh6UVd5VFFqT3RDTWc2ZlgvOVlVWHZ4RENSVFhGdFNNcm9UcGE0VEZUQnlR?=
 =?utf-8?B?NFI2QllNMHg2dWIwdW1vOVhBcG1FT29Zc1ljSVVQQ3lKR1RzSGlFTCtHOVNp?=
 =?utf-8?B?TkZSQmdrWUJsYkJ5SjJHbzdBUWtkRUpUdGwySFl2cEM2elRVa2JkVGVZdmVY?=
 =?utf-8?B?ODgveVY0M3UyZ0orM0hnNjhtNFZBZWdEbGxVK2RxcGl2c2tVdlh5N2FZQ280?=
 =?utf-8?B?cnhkUUZSSy82T2xVUGg2WGNGSmNSUTBjdnBJb2Z6YlNGWThxMDBjc0kvWmJ5?=
 =?utf-8?B?MGkyc09DODlpaDA2Y1NvSE1NbEtnbFhkbk55cUdJWmxaYzVnVDhyenBWVWlv?=
 =?utf-8?Q?+B8lVnOW+PzLFRcXB86ZxFPzm0srx+qRGuieT7oz+8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FA8776A79097B4F9C5BAB149B0163E9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22dce0d-316e-4078-d58b-08d9ecb491f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 16:44:13.5970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZeVPCpp42OPXI0ByYw/xdOx/lPo8MwLfL7biQO7+6BS1qBzkrmkATPSkdswthbmB1QsyiJ0+zwdhNP70g1PKO1z5QyB3TtGgZ+UrfLpgeuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2782
X-OriginatorOrg: citrix.com

T24gMTAvMDIvMjAyMiAxMDowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gTW9uLCBG
ZWIgMDcsIDIwMjIgYXQgMDY6MjE6MDFQTSArMDAwMCwgSmFuZSBNYWxhbGFuZSB3cm90ZToNCj4+
IEludHJvZHVjZSBhIG5ldyBwZXItZG9tYWluIGNyZWF0aW9uIHg4NiBzcGVjaWZpYyBmbGFnIHRv
DQo+PiBzZWxlY3Qgd2hldGhlciBoYXJkd2FyZSBhc3Npc3RlZCB2aXJ0dWFsaXphdGlvbiBzaG91
bGQgYmUgdXNlZCBmb3INCj4+IHh7Mn1BUElDLg0KPj4NCj4+IEEgcGVyLWRvbWFpbiBvcHRpb24g
aXMgYWRkZWQgdG8geGwgaW4gb3JkZXIgdG8gc2VsZWN0IHRoZSB1c2FnZSBvZg0KPj4geHsyfUFQ
SUMgaGFyZHdhcmUgYXNzaXN0ZWQgdml0dWFsaXphdGlvbiwgYXMgd2VsbCBhcyBhIGdsb2JhbA0K
Pj4gY29uZmlndXJhdGlvbiBvcHRpb24uDQo+Pg0KPj4gSGF2aW5nIGFsbCBBUElDIGludGVyYWN0
aW9uIGV4aXQgdG8gWGVuIGZvciBlbXVsYXRpb24gaXMgc2xvdyBhbmQgY2FuDQo+PiBpbmR1Y2Ug
bXVjaCBvdmVyaGVhZC4gSGFyZHdhcmUgY2FuIHNwZWVkIHVwIHh7Mn1BUElDIGJ5IHJ1bm5pbmcg
QVBJQw0KPj4gcmVhZC93cml0ZSBhY2Nlc3NlcyB3aXRob3V0IHRha2luZyBhIFZNIGV4aXQuDQo+
Pg0KPj4gQmVpbmcgYWJsZSB0byBkaXNhYmxlIHh7Mn1BUElDIGhhcmR3YXJlIGFzc2lzdGVkIHZp
dHVhbGl6YXRpb24gY2FuIGJlDQo+PiB1c2VmdWwgZm9yIHRlc3RpbmcgYW5kIGRlYnVnZ2luZyBw
dXJwb3Nlcy4NCj4gDQo+IE1pZ2h0IGJlIHdvcnRoIGFkZGluZyBhIG5vdGUgdG8gdGhlIGNvbW1p
dCBsb2cgaW4gb3JkZXIgdG8gbm90ZSB0aGF0DQo+IHZteF9pbnN0YWxsX3ZsYXBpY19tYXBwaW5n
IGRvZXNuJ3QgcmVxdWlyZSBtb2RpZmljYXRpb25zIHJlZ2FyZGxlc3Mgb2YNCj4gd2hldGhlciB0
aGUgZ3Vlc3QgaGFzIHZpcnR1YWxpemVfYXBpY19hY2Nlc3NlcyBlbmFibGVkIG9yIG5vdC4NCj4g
DQo+IFNldHRpbmcgdGhlIEFQSUNfQUNDRVNTX0FERFIgVk1DUyBmaWVsZCBpcyBmaW5lIGV2ZW4g
aWYNCj4gdmlydHVhbGl6ZV9hcGljX2FjY2Vzc2VzIGlzIG5vdCBlbmFibGVkIGZvciB0aGUgZ3Vl
c3Q6IGFzIGxvbmcgYXMgdGhlDQo+IGZlYXR1cmUgaXMgc3VwcG9ydGVkIGJ5IHRoZSBDUFUgdGhl
IGZpZWxkIHdpbGwgZXhpc3QuDQpPaCByaWdodC4gV2lsbCBhZGQgdGhlc2UgdHdvIHBvaW50cy4N
Cg0KVGhhbmtzLA0KDQpKYW5lLg==

