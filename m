Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A9B4E7B29
	for <lists+xen-devel@lfdr.de>; Sat, 26 Mar 2022 00:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294983.501945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXthR-00085k-LP; Fri, 25 Mar 2022 23:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294983.501945; Fri, 25 Mar 2022 23:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXthR-00082n-Hj; Fri, 25 Mar 2022 23:50:33 +0000
Received: by outflank-mailman (input) for mailman id 294983;
 Fri, 25 Mar 2022 23:50:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CWi7=UE=citrix.com=prvs=076b843e0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nXthQ-00082h-EK
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 23:50:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58f91e94-ac96-11ec-8fbc-03012f2f19d4;
 Sat, 26 Mar 2022 00:50:29 +0100 (CET)
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
X-Inumbo-ID: 58f91e94-ac96-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648252229;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qE4pthaGuDkSZ1zDJ3dzRVNawZch0wJtxvh0ZBdLHmw=;
  b=cS/muvYXuQuVLJZu6iJW2nd4yeR11hdA4D38KEqIvffLG7B7xHqqYSpY
   ID0dokuoSF2BI1lkbkff+FR57wvUIaN+cBDu4LvGnfV3UxwTjWJJs5WeW
   XLovJ9Nk39527zQvrMh1Hs5pGUT+rGvblPjj7KubAsnXuJzL/GHMb4SGH
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 69599438
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PskbTqO1lK8zLzHvrR1Cl8FynXyQoLVcMsEvi/4bfWQNrUoj0GEBz
 WJJXG2FMv2PajD2ftp+a4q0809VvsTUy4cySgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2NMw2rBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 fJOhNuccjcQYqSWttQtS0NdTjBeFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQTKuPN
 pZCOVKDajzlMzESGUg6Eqtkkcm5o3X7WBZItne88P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTRI8ZFJW/7vNsikafgGsJB3U+UFKhpPCjh02WWtRBK
 lcV8C4jsagz8kOwStD3GRa/pRastR4GWsF4Feg35ACEjKzZ/26xCmUBTxZAbsInr848QTE21
 l6PkMjtDDYpu7qQIU9x7Z/N82n0Y3JMazZfO2lUFmPp/uUPvqkaqRH+CfpYIJfph4fbKQHom
 TXXvQgX0uB7YdEw6423+lXOgjSJr5fPTxIo6gi/Yl9J/j+Vd6b+OdX2tAGzAeJoad/AEwLf5
 CRsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iQsJGeBj
 Kz741o5CHpv0J2CNP4fj2WZUZhC8EQYPY65Ps04lOZmbJlrbxOg9ypzf0OW1G2FuBFyzfFmZ
 MrGL5f3Vy1y5UFbINyeHrZ1PVgDnH1W+I8ubcqjk0TPPUS2OhZ5tovpwHPRN7tkvctoUS3e8
 spFNtvi9vmseLaWX8UjyqZKdQpiBSFiXfje8pULHsbeclsOMDxwUJf5nOJ+E7GJaowIz4/g5
 G+mYEZExTLX3DufQel8Qis4M+2HsFcWhS9TABHAyn71giB6Otz+tf13mlleVeBPydGPBMVcF
 pEtU86BHu5OWnLA/TEcZoP6t4tsaFKgggfmAsZvSGFXk0JIL+ARxuLZQw==
IronPort-HdrOrdr: A9a23:RoAM06wwEASlKBJVpvW+KrPxguskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMYs1MSZLXXbUQyTXc9fBOrZsnHd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgeVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVJ77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10zDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/wzd4dvfqmrCou
 O85yvIDP4DrE85uVvF5ycF7jOQlQrGLUWSkGNwz0GT+fARDwhKdPapzbgpDCcxrXBQ5u2UmZ
 g7r15w/fBsfGL9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQho+bo7bWvHAbocYa
 FT5QDnlYJrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd8AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlauXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wa9iif3ekPhlTRfsuYDcTYciFcryKJmYRrPvHm
X-IronPort-AV: E=Sophos;i="5.90,211,1643691600"; 
   d="scan'208";a="69599438"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlZx7vYc4JP/Clop3qsYP1TPEoym7Axu1gl08/KQNamiyto1HQSRa6IGeIMALg7nxPiO42ix+pj3++R8MQWjRfX+uUv6TjDBzOU+GDcCOmoJAffpNl+44BzsQ4EdLrTMNWREF676wSjdSsWx4JzwmkT1L6ojtuTFQBhAtvo9UGAwK4G0nYhIu8+rU1mEdhw5265ZbcJmdW7bP0ZWnXxjFhK5B5ObCh/OHlSG35lYAZal8E+h+gktXOKr7tqH19ang7leX2gYT9i4+xvYFtJSPW72NknY5WQKGiGm3lOAoVKFpYX4vpl6cLAv+AdMALFZbXdQPtztMkH2NQ2H/755EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qE4pthaGuDkSZ1zDJ3dzRVNawZch0wJtxvh0ZBdLHmw=;
 b=cpn3/z5lrgbthFqeluT0Q3Za4V2v2FgU31QHfTzTnz/UZFPdOKH1EqHO52PHjQZ2VfurHT/U0eIXgJttzNrxBFVCDILXtl/goCmGxhdcUSmxgvbm+IA/Xrf3HB6/XgwjHOQuiXIg1DkJ2q24cZadS1aw0fZWRREn/nCiU5zxoPPTfBnf0evdouWfaH7Gr4vifoS8Q+Ni9b6UnPAt8FSndeTyl+zogbkmYFB8oBzM0pvpk7xsKrzkM7lJ0zgsEWSRPZeEj5CT5kajROTHpR/R355tbOm7dm595opnVZDFM6hDzinOndqPPmQ9UjWHZ5H6WlMp+BUvN6iX7uWMCJu8CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qE4pthaGuDkSZ1zDJ3dzRVNawZch0wJtxvh0ZBdLHmw=;
 b=FXwFrN2bxRSpCym0UTd+VP70VAx4W/61H+A7ZnH4P4+ac32gTtFt5rkvPMpKmHQNebTSX//oiq+ICY9YdQtS8OYl9OGCJM5TjJozC6kRYxE3hHSNKHkL3/1jMOjKrjeBLkZ/Dx00PNvNro7gaYJbZD6tnBWPbmOGREhMwL9q1OQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Chris Cappuccio <chris@nmedia.net>, Demi Marie Obenour
	<demi@invisiblethingslab.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Marek Marczykowski-G?recki
	<marmarek@invisiblethingslab.com>, Xen developer discussion
	<xen-devel@lists.xenproject.org>, OpenBSD technical mailing list
	<tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
Thread-Topic: Security support status of xnf(4) and xbf(4)
Thread-Index: AQHYQGN+XBaov1qn+kGEeGg+qt+r9qzQsngAgAAS8IA=
Date: Fri, 25 Mar 2022 23:50:24 +0000
Message-ID: <b9aff6a7-5cf6-5106-310a-2317f85e602a@citrix.com>
References: <Yj3qW/y20htoSvuK@itl-email> <Yj5FXBj7qKIvs94O@ref.nmedia.net>
In-Reply-To: <Yj5FXBj7qKIvs94O@ref.nmedia.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a698f82f-7319-4d5d-929b-08da0eba3b0f
x-ms-traffictypediagnostic: CH2PR03MB5336:EE_
x-microsoft-antispam-prvs: <CH2PR03MB533631F4ED7D8DEC406A190CBA1A9@CH2PR03MB5336.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: crwi+dDdKZcRWkCIZMEmvsmvU9RGvyzuro2omVVq99ZONlYRLXrcHhMHbXo4PtHrV2EYr53WmtCtZwImjJdRZ04R/xdxXP334WSFb0Ff5fc/zocSM6tFLKbXeROKZixXQ56FmS+Et97rawzxwxFTymqbKFdZaz9hbos/lOovPT4A8g/7YIx++LXVDJFxxZBAzAe8RViPBNZXSsAWdPEW2f7sq3RrtK3WT9CH0Szz/K0/de+YvdghpOXb9K6x/k39lnXHehJezCOw1jdyrJbuVaqjbXjI3foax6SZwRjrwFqBsAM2mp+E5ALi/x7b3ZxGSjer/khrTmeK3FpIx+S/vJz0dn8sCyqclds1K+ykxxafCFr+HKX6Mi/wZfNYMjETMF9MMttTnt0slNhBDAXKUzXEpeMjg+ffS0++Sbo8HBD9E04sePTCK/nAz4YHnvvfk1jHnpM9z9k+weKtmcABSq1p5wv1Ss7p67x/33w+kCcN/43uH54TjJ/Nm5EN4yv/k7tg24HStK5GprbTkkvMG8l2WJ85JdTuMhhesGskJ4S5Ynd4r8t0ckiAutPklriiD02rdfQQMrCGXRg2stbx452t+CQTT5VtYwAxaviXxygIApGXAFJat2LmaNuAt8CqzQcDcGimp6ybCqQAkC2ZM15F3sP1Ahra/3aPsRTnmONHZA48koaW3A2LAhLD+lrQeCqd1cEKmHSKpcmQddB0boGVbT7k1vrNqO8yxUNH5NhSJeOLFq7weWgfLPVnk/wsOWxgV1F+p2PQY8nlbLdh9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(31696002)(82960400001)(5660300002)(54906003)(38100700002)(38070700005)(316002)(122000001)(110136005)(26005)(6512007)(55236004)(508600001)(6506007)(53546011)(15650500001)(91956017)(4326008)(8676002)(8936002)(6486002)(83380400001)(31686004)(66556008)(71200400001)(86362001)(76116006)(66946007)(36756003)(2906002)(186003)(64756008)(66446008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTV6WDBuQXB6VGVEeXhpYTBYYjUyTDcvb1pYWXVHTnNvSDNVOUZieFFHUm5z?=
 =?utf-8?B?RkppYnU1V2U0Uzdoanlkc1RaU1ZJYnlscGNHRXdzU3FEVU9obzBaa2lXaXdV?=
 =?utf-8?B?VFZpL2ZwUzhMTEljVjhoWHB0T1Y3NmtyUGxYVHczNlNUVGl3VWI1eHd2aHk0?=
 =?utf-8?B?UytWY0R1SDUyeWR5dzlSRzFVZHp1WkFReG8wTFNxN0FxYnBwbTBNWVZHYUJI?=
 =?utf-8?B?aUVLY1JFNklBSTZPSVp2anI1bHlLNW1DSVYxSnJoeHZhaTZhY0d6SUpLRG5K?=
 =?utf-8?B?VUpRR3JXcGY5S21YbWFTcU1Xc1BVNGlWQmprSEszbEdHcy9pQWFMdmw2MUZI?=
 =?utf-8?B?Y2g5MndHaWpteFgrV2dBY2NiTWRmbVpqalN6dWI1d0RoUmlhNVBWd3dGc1ZZ?=
 =?utf-8?B?TTI3UVE0T0hLdmRsQ2dtUGh6WTJ6NWdPMVBKQThiNE5SNWUxV2hvY1NUR0Z1?=
 =?utf-8?B?VGhsYkFrUlM0K25YM1JxM0ZPZExpRUs1a1BmZVduUmRIZzVDU3hReENES1U1?=
 =?utf-8?B?cWhIMDJOc1l2T0ZYSWFsVzc4eHVCZGZVanlHYllhUTlXVWptdkV2THZiaDhm?=
 =?utf-8?B?elNSZkR5SC9DWHJaYmdYeFlGUklpUEhuNEQ0VUNNU3Zkd3RJU1NzWTBFbnNL?=
 =?utf-8?B?aFg4RkZxQTlqMEZhOGE0N0NQN2M3eDNDSFI3V1B5a3FFTkpTYVVvek9jMDVJ?=
 =?utf-8?B?eUZueSs1NG1wZmdzeEZEdk5SOFMrenhrOWZXeGQxZU1DMUs3QzRydWlUdXk5?=
 =?utf-8?B?TEtYQWdwT0huRGtWNlk2U2RQU0sxVjlxMW85SU1TZkRnUktvTmhMS3Z3bTBQ?=
 =?utf-8?B?SloxQnZ6ZTNCSGREcy9TSWthNHNJQnZ6V1dLc3VlRWtMRXRSUUhNaTNUSFlI?=
 =?utf-8?B?YUsxNVEzSG8rQmFkaURzMC9MNktVMENrLzZueXYybkZqenF2ZmhjSUJTbmNl?=
 =?utf-8?B?ZDVSNDN5TllKRmh5YjFMWVNVdXJFSUY3ZXBHMWpuS1RzY3BJUitIaGZrVEtH?=
 =?utf-8?B?R2ZjTkhwWUJwMHQ1cDVFQlVCTEN0bUV4ak5KTVloOFNaVk5yL1hVK1FHSlFz?=
 =?utf-8?B?QzlPZ3NuVzNNUEwzdVdYSmtzV21aVTA3RHFBNVZ4cXNxeEhXZWNPSXFyNUg2?=
 =?utf-8?B?VlF5WGd4ZEl3RlJkRXlYYmJmUm1tWk9PNWhOZTBsM0I5dTRVd0lkRjdIdlB2?=
 =?utf-8?B?ZGZnU3JtTW1XSXZ0cGxRZFB0TjZxQ2F0TVBMd1BZdHFTQjAxYytkQk5IL0tZ?=
 =?utf-8?B?OFZpUFJuTm5rbDF5Y1h2TTdxU3BFU0dHK1RTbGo1cWx0NTM1d3VEN0UwNi9w?=
 =?utf-8?B?dlJRNzRqT1BNOGZUZWFkbmJ3MHBhNzJHeWUyd01WQkhTeGpYYUpzOVFGTzhG?=
 =?utf-8?B?bmtPbkNMWjFxRG4xaWsrM240RTlpdjlVeFFLZ3NmOW5jZnh6MjMvQmlTdTJE?=
 =?utf-8?B?UjNSSVJNVHBXK0VBVmNiQTJPK1g5YnFzQ1pSc3hSQzgwVVY1NFdPaVovUFRH?=
 =?utf-8?B?K21JeEIvSkZHSlcvZ0I5aWNSZGhsdWM5a1JXT1RpM1ZMeHoxOWkxRW9lUGpq?=
 =?utf-8?B?VXB0aUhJN01jK2tWRDd3ek0wVGZCSmxQK0h5bStUWk16NWF5RlBCeitmcGJH?=
 =?utf-8?B?UE5mMlpNaUFTWGFzNHVSMEZ3U0s5MlBmaVNQWXBXd2xzRE56V2t2T1NWb1FM?=
 =?utf-8?B?eUp4NVdwWWVTeGRNVXdOSFJMT3VONVVYVXlQcG9vbCtOMkZ5RmxaSTZJT0tn?=
 =?utf-8?B?TWFJMktXQXJuWDl1VjhnQmZsd3VOMThTUGJFVlZJRTA3aG0xYVhIZEFTazBh?=
 =?utf-8?B?RXp6VC84QVIzUVYrcjFmdkpLM2ZGeEYwazNiRFBSREdmUlh6OW1GRW1TOVZx?=
 =?utf-8?B?S3JwbjNabFg4d0FKNEUwSFBOUGUwV3FWdC9ITDJMazFub3hWakNHRU90K3g1?=
 =?utf-8?B?TDlRUit5MEhrbU5GM0VWMU40VlB4MEkvZmNtYUY4ZUx1NFU0QXJjNHRaNEoz?=
 =?utf-8?B?eVBUaTFsRUw1V293VmhlcHBxVGIrZ0Erc1BoazR3enpHZTB6ZnRPcU9PYkNx?=
 =?utf-8?B?Y3huOStONjVMOGVYWVJFMUdsa3k4NEVzYS9pVk5wRlZ6TjV5V0ZGWHEyZ0Yy?=
 =?utf-8?B?QXAyUTNNZmxWVERmb04zcTlrdlVsei9vOVFGT3NBcWpzYUREWEQvVkFESjcr?=
 =?utf-8?B?Z2RJd1ZFdFF6M2VQd1gvM3JCbXEvMDg3UUhhNHk3RkhWTllVcmY2b1dVOXla?=
 =?utf-8?B?dURkbmxIcDVVaDY4V3NkcDZRa0xWMFU5RlR6dDNFMHFCVmx0eC85WU9SMitT?=
 =?utf-8?B?MDJROHAwanRrQVkrSWxIdmg3dGpKNjFTUENKTEpBbk1hc3RQSi9QZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34611DE0CEAD3546B8D4940D4FE35D68@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a698f82f-7319-4d5d-929b-08da0eba3b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 23:50:24.3147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Txh8l0M4kdBFGVXIcPojBAXC4uOdVTlqnam+jLrbD07MaGE2PIdopAsbZ7YehmewcSV8J1aYqbw3SyXbksvXgLeMN9n3YUc9GqTay+r8l+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5336
X-OriginatorOrg: citrix.com

T24gMjUvMDMvMjAyMiAyMjo0MiwgQ2hyaXMgQ2FwcHVjY2lvIHdyb3RlOg0KPiBEZW1pIE1hcmll
IE9iZW5vdXIgW2RlbWlAaW52aXNpYmxldGhpbmdzbGFiLmNvbV0gd3JvdGU6DQo+PiBMaW51eD8/
P3MgbmV0ZnJvbnQgYW5kIGJsa2Zyb250IGRyaXZlcnMgcmVjZW50bHkgaGFkIGEgc2VjdXJpdHkN
Cj4+IHZ1bG5lcmFiaWxpdHkgKFhTQS0zOTYpIHRoYXQgYWxsb3dlZCBhIG1hbGljaW91cyBiYWNr
ZW5kIHRvIHBvdGVudGlhbGx5DQo+PiBjb21wcm9taXNlIHRoZW0uICBJbiBmb2xsb3ctdXAgYXVk
aXRzLCBJIGZvdW5kIHRoYXQgT3BlbkJTRD8/P3MgeG5mKDQpDQo+PiBjdXJyZW50bHkgdHJ1c3Rz
IHRoZSBiYWNrZW5kIGRvbWFpbi4gIEkgcmVwb3J0ZWQgdGhpcyBwcml2YXRlbHkgdG8gVGhlbw0K
Pj4gZGUgUmFhZHQsIHdobyBpbmRpY2F0ZWQgdGhhdCBPcGVuQlNEIGRvZXMgbm90IGNvbnNpZGVy
IHRoaXMgdG8gYmUgYQ0KPj4gc2VjdXJpdHkgY29uY2Vybi4NCj4+DQo+IEEgbWFsaWNpb3VzIGJh
Y2tlbmQgY291bGQgY29tcGxldGVseSBjb21wcm9taXNlIHRoZSB2aXJ0dWFsIGhvc3QgaW4gYW4N
Cj4gaW5maW5pdGUgbnVtYmVyIG9mIHdheXMuDQoNClhlbiBQViBmcm9udC9iYWNrIHBhaXJzIGhh
dmUgaGFkIGZhciBiZXR0ZXIgc2VjdXJpdHkNCnByb3BlcnRpZXMvZ3VhcmFudGVlcyBmb3IgbG9u
Z2VyIHRoYW4gdmlydGlvIGhhcyBleGlzdGVkLsKgIFVuZGVyIHRoZSBYZW4NCmFyY2hpdGVjdHVy
ZSwgdGhlIGJhY2tlbmQgaGFzIG5ldmVyIGhhZCB0aGUgYWJpbGl0eSB0byAiRE1BIiB0byBhcmVh
cw0Kd2hpY2ggYXJlbid0IGV4cGxpY2l0bHkgcGVybWl0dGVkIGJ5IHRoZSBmcm9udGVuZC4NCg0K
SWYgYSBmcm9udGVuZCBoYW5kbGVzIGl0J3MgZ3JhbnRzIGNvcnJlY3RseSwgdGhlbiBpdCBuZWVk
IG9ubHkgdHJ1c3QgWGVuDQpidXQgbm90IHRoZSBiYWNrZW5kIGZvciBhbnkgcHJvYmxlbXMgYmV5
b25kICJiYWNrZW5kIHJlZnVzZXMgdG8gdHJhbnNtaXQNCmRhdGEiLg0KDQpUaGUgYmFja2VuZCBj
YW4gb2YgY291cnNlIGNlYXNlIHRyYW5zbWl0dGluZyBkYXRhLsKgIFRoYXQncyBtaXRpZ2F0ZWQN
CndpdGggbWFya2V0IHByZXNzdXJlcyBvZiAiT0sgSSdsbCB0YWtlIG15IGNyZWRpdCBjYXJkIGVs
c2V3aGVyZSIuwqAgRGF0YQ0KaW50ZWdyaXR5IGlzc3VlcyBjYW4gYmUgbWl0aWdhdGVkIGJ5IHVz
aW5nIGVuY3J5cHRpb24gdGVjaG5pcXVlcy4NCg0KV2l0aCB0aGUgYWR2ZW50IG9mIGVuY3J5cHRl
ZCBWTSB0ZWNobm9sb2dpZXMgKEFNRCBTRVYtU05QLCBJbnRlbCBUWFQpDQp0aGUgVk0gbmVlZCBu
b3QgdHJ1c3QgWGVuIGFueSBmdXJ0aGVyIHRoYW4gIndpbGwgY29udGludWUgdG8gc2NoZWR1bGUN
CnlvdSIgd2hpY2ggZXF1YWxseSBpcyBtaXRpZ2F0ZWQgd2l0aCBtYXJrZXQgcHJlc3N1cmVzIHJl
bGF0ZWQgdG8gbW9uZXkuDQoNCn5BbmRyZXcNCg==

