Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4194347EF1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 18:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101135.193221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP721-00053U-5J; Wed, 24 Mar 2021 17:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101135.193221; Wed, 24 Mar 2021 17:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP721-000535-1s; Wed, 24 Mar 2021 17:10:57 +0000
Received: by outflank-mailman (input) for mailman id 101135;
 Wed, 24 Mar 2021 17:10:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hwg6=IW=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1lP720-000530-BD
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 17:10:56 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 454b9ed6-1c1e-4cec-a6d6-6c599d51e135;
 Wed, 24 Mar 2021 17:10:55 +0000 (UTC)
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
X-Inumbo-ID: 454b9ed6-1c1e-4cec-a6d6-6c599d51e135
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616605854;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=w44HnX+G1THL+iAa42D2itHwpThflFk7bbehM9bSjPc=;
  b=eIEm1hubGIOS6jlaisiUMEIKlUi0EdW7tswGmZEi+PtXobvbVTrDC4sq
   S5h9JxYHNysflGFCFhEL4e8oWnjBXjbw4MPiHK511hK10dyslqpJiUDuI
   Gjz0Tye0zF1zq+MlAi2D9GbdE/ZOQkJOb8GVYHgvkoZHGfmTuM0wL/aaZ
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: E+JpRmQFokoCPQesJCpCq8gYaJeyyOcHTkheDJHMlphPcaq/oT2hafI0/wCQ09NFMzPFE2kbZ9
 uhfVaWaTKZdYgeNvTV6zLivOAKUWRvipMtKU4iU6HvKCxsQZSDBrdA1icKPJyfpHIK/rTuRTFx
 ZFLqMuD24Vz3EF336rrO6xCpAdnzQJf3GSCnMk9PshTwIGDtbwCk6m4t6fQtHwUfbuUXlLxYaC
 Z6Em+/WCGqdLH/UnHnzBjRwBK88TJYzScd56JSDDJJCJ+DJ2+ljv6poXoq6ibtketlketaF4Pa
 TDA=
X-SBRS: 5.2
X-MesageID: 40048640
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:dpvOF6t6EKdjuanuYzG34dOg7skCC4cji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyAOzH888hPyO9661jenTpk0dMT1CQYsI1XYcNi+wFEpqSA5aQboVfa
 Dsp/ZvjTymZHgRc4CfDn4KQ+DMq7Tw5e3bSDQBAAMq7xTLsCih76T0HwPd8hAVVT5OxrlKyx
 mEryXS4KK/v/anjiLNzmO71eUZpPLN6PtmQPaNhM8cNyn2hm+TBbhJdrWesFkO0ZmSwXkwlt
 2kmWZDA+1S7DfrcnixsV/R3WDboUsTwlvD7XPdvnf5u8z+Q1sBeol8rKZUaAHQ5UZlnPwU6t
 Mx40uju5BaDQzNkU3GjrCiPXwL5ymJiEEvnuIJg3tUXZF2Us4qkaUl8F5IC5BFJSrm6ekcYb
 RTJfvB7/Vbe07yVQG/gkBTwcehVnl2PhCKTllqgL3t7xFqnWt0x0Zd+coHnn1ozuNad7B44Y
 3/Q8FVvYALavVTQbN2Be8HT8fyIHfKWwjwPGWbJkmiPL0bOlrWwqSHookd1aWPQtgl3ZEykJ
 POXBdzrmgpYX/jDsWIwdli7g3NemOgRj7go/suoqRRi/nZfv7GICeDQFchn4+LuPMEGPDWXP
 61JdZwD+L8K3DtXaJExRf3VZUXCXR2arxQhv8LH3a15u7bIIzjseLWNNzJIqD2LDoiUmTjRn
 QZWjz+I9hB81CrVnf0jAO5YQKqRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbT1O25ZGJX
 dWEffCqOeWtGO29WHH4yFCIRxGFHtY573mTjdPrQ8OOEXkbKYbt7ykCDhv9UrCAiU6Y9LdEQ
 ZZqVgy07mwNYasyScrDM/iNHmbgXsVrHeDVIwdhaWH+MfgdvoDf9EbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgkIYZH/jFd953gB6iJMldrX63jzTGmegfAl8gGxK+W8+ehggjAwdOjl
 pq6qkFnf6rgjC0M1Yyh+w+LXxBYGmaG6h9EQyAfYlY84qbIj1YfCOvv3i6gwt2Unf2/08S71
 aRUxG8SLXuOB5hnVx2lozt60h5c22BeVkYUAEKjaRNUULcunhy1ueXYLGUyGX5UCpf/sgULC
 zFbTwOIgln2tCw01qPlCyfEGg9r69eTdD1HfAtdare1WiqL5DNnaYaH+VM9JIgL9z2tPQXON
 jvNzO9PXf9A+Mt1xf9nAdUBABk7H0lm+jvwhvr8Syx22M+G+PbJD1dNvsmCsDZ62jvXPCT1p
 plydozoOurK230LtqL07veYTIGKhTdpweNPqwVgIERuaI5r71oGZbHFTPOyXFcxR07aN7ui1
 l2etUz3JnRfot0O8ACcSNQ+VQk0NyJMUswqwTzRuszZ0skgXPXN86AioC45oYHEwmEvk/9KF
 Of+ypS87PeUyyP2aUTBqgwLW5VAXJMo0hK7aeHbcndGQ+qf+ZM8B6mKXe7aqZaU7XAFrMKrB
 p2iuv46dO/Zm79wkTXsjR6KK4VrDriTsO2HQ6WGelHt9a9Ik+Bh6O24Mi1yDf7IAHLH3gwlM
 lAbwgXaM8GlzwpyIsw2SK2Qrbsok0kn0BFiAsX3mLFy8yj+iPDAUpCMQfFmZ1YUjlYL2iQga
 3+gJ2l/WW45CIAxILKG0hRdMxfAtQcToD4KCF1NMgb1YTYiJYHk2BEexchD2k1lTD70adnxN
 6CqYfvZ9E=
X-IronPort-AV: E=Sophos;i="5.81,275,1610427600"; 
   d="scan'208";a="40048640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JcDUiCA72z6n4G2lldtDXQPDkF1cC3IT8o2DKEPITud0lYRtrhIPut5EOrU5VPUfz7IjOF3povm4M1LqNFJSoAMPe9N6dUkv3f5nmWJsYD7x5q4Lr0eVKd/mPxbrMTa6sn6Y7jKgNq/ZGmWgVLZAm39yfiYsn1YAJRpdmbkKGotfXV++UqYZJfXK3E+KxHPpbqVSaxfDh3o9BuNjfxvbRKWpAHw02JIgQ1GsUEZVmJRTl5GFzvmN0GMQWhKzU5wFmG1i2QGgAjVqPmjhhCN1cy2jXWPQp3ZeDlnyvSi0uftkPyCBDTe1tN7lrpY4ABX57uLdG1t0aEMjKCXEGkCIUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w44HnX+G1THL+iAa42D2itHwpThflFk7bbehM9bSjPc=;
 b=mXAd/qm8+gZwGLAfueqtv7CUeqhFC8tR0E+Rg+XEN37ACgP7UyWaTs5V+YUKF1WiHwPsWldnuIMMZpdHfid+3kKjac0byiLN3Z7esvuMg72S0yq6yPQgdFsFTg4US9qOksJcvEN2wcZlANjp6mqx9OaOWSldQT3X7ffiLpzVyFTi76Fo0aONoekaNiePrBBCzZCoLrhjrW2fSNLxIgsEvvPgjK2w+LIAnbdrBbzw5wsNuT8OoY2okM+kH5k+NyY5iU1GM3fmX9ERm63BSxhFijEySkaCLdTIBWJC/Hjdmyh9xPtluji5eGAVrhRADbjkSqMLAWnJGqfqEuT36GhyGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w44HnX+G1THL+iAa42D2itHwpThflFk7bbehM9bSjPc=;
 b=WdAgn7KnDQmT1WNRORTr024ozhevDWkq+py4ed+uQMlcgrvcRiPJEjGfpAmoXvFVDhh2cQkdsiHZUklv8Enl3I+lojPGBY0nrKKeSjndR+IRQwrHNl13WGOPOjUhFCvrAK5XmfWeqhimR+6nIveMp5N0Y4hlxegs1OzV2Iu3f7E=
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH 3/6] CHANGELOG.md: Add dom0 zstd compression support
Thread-Topic: [PATCH 3/6] CHANGELOG.md: Add dom0 zstd compression support
Thread-Index: AQHXIMzuHmhvVTmYrUinzd81rw5tAaqTW6OAgAAD8AA=
Date: Wed, 24 Mar 2021 17:10:29 +0000
Message-ID: <C545E850-7348-4182-937B-3882D9A42BC7@citrix.com>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-3-george.dunlap@citrix.com>
 <1b2710e7-6491-2000-c4b3-e29e8ab5ffd2@citrix.com>
In-Reply-To: <1b2710e7-6491-2000-c4b3-e29e8ab5ffd2@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.20.0.2.21)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d18d8700-4277-426d-4fd5-08d8eee7b9fd
x-ms-traffictypediagnostic: PH0PR03MB5944:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PH0PR03MB59440656C468BED25C71016799639@PH0PR03MB5944.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gM2Xwn/ctGXt8DyjtMl09Rjsa0+klgfXErAhz0/Jj/ErPWEgpiogMp+qbfgSHhr4j/HTf5ZqxQ1Doa/HIQdFghlPpubm/wdfA0h09UGSApUFORC8HLfpyzJIDP9pzQBsdRqvomoQJG/7uLnnIs677Yx5g5Dr2DHaNostRuXNZ/WhL2zG3Pc/OrHrsiS/3OGgkiYwaiKaRURvXdOfartVNNtR0H9IfgZ+njwxeneyd1Fh9NtVou8lvPWJGfVEdKZvkucP1seMBtDtrCOAqGcf/MSpFmjLzAvIzABHAgGGScC7GygLxu0Bkf4EyPh47pVpF3PryCR37YpCZ8ueYxgdAtZ3Zpe/yhLyfBTVmtKbXAX5Is2/Pa1kkJchsL+EWX6SokX+wM0q7rX5SN7rhcLNXWQILJ1Wnn4RYR4FjmH14BBjEbuH4goZNhnGZbNfqy8ggBNJJTZuRrvfCY6lhpz19jv0wRJ4+96b9rfsDY9WzewA6Q74vxIykCiUbgbrR5nPCFGX9zbWHGK3+vSq/LmSORZqsrJ7i1tf2hHOqqbI9WoYjOn7b+mD8+TBVVgyRpX0h46fq8rCelkfkAOFUv7tfLRkoXxTRXWTQ0M7Ekgy3Jos/IpNu6ySSTIVLb9oZZqHYzv07le8RTCUq5yS4kfJReYJlQmlW8A995yfxZDLvGfD4AOVn/q0e/OhPadH1SQBkKflvVW3XXS4MCXHtc9KfnnkBtcx4INBAONUsxZedjCjbPXhXtvDmpbvzU83Vj3LN33AEHQldgmo/Hn2dDUt5KGU1DjjedrD2Y/zk3vA2/WXTkvbp2o8JKjgO7cU4/VP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(64756008)(26005)(316002)(478600001)(6636002)(66556008)(91956017)(5660300002)(186003)(8936002)(2616005)(66476007)(76116006)(6512007)(2906002)(66446008)(66946007)(107886003)(86362001)(6862004)(33656002)(4326008)(6506007)(6486002)(36756003)(71200400001)(8676002)(38100700001)(54906003)(37006003)(53546011)(207903002)(219803003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ejZOQ3cwZDZHdm1YWDVPY0sxOUIvZzNJQi9qRmgyUmRaV0t4ZldTRHhsS1NM?=
 =?utf-8?B?U0FMSkI3S0VWWUJZVjVCbytLVzVRTnpmdksvUzJ0VFdNWHFNcG0yYURLQ2sr?=
 =?utf-8?B?c2tuS0NjVjBmaFErMWNCWFdSK25EYnNYelFnUDVoM2V0UHZxQS9sS1NtWExI?=
 =?utf-8?B?Vkd3aVpScG94WGV5R2djSzFqeFkwRytBeURuZUpjL0F2Q21xcWRnd0VFWGdO?=
 =?utf-8?B?b25FZW9oTE9mT0c0U3RPY296dVRJVysvaEU0ZjRuVWtkRVNDaUl2NlE3Um9J?=
 =?utf-8?B?MTZOTjRiako0Wmt0emJjQUNjN3JMQlR0eGl3RUxmSGNnUkRNMzVmd2JySGpx?=
 =?utf-8?B?QlhaaUlOM3BpQWFqeGwyVXlHWlNFYWh4SlBNNTBVT1lpSVJqclN2dWgzbngz?=
 =?utf-8?B?MlNsM1Y4TVhlRXh4S2dpNGpQdWM5RGlvd2JUZkFtbWJsN3AwcXNXV2tEM0pD?=
 =?utf-8?B?dGJkRzBiQ2ViZW1GYU9BZnBXeEZmdzZnVjE5K0dWUytCYXh0a2UwUHdLRHdU?=
 =?utf-8?B?eStGc2lvQ1lEUDFNL2VZUDU3Uy9mcVhpZEFLOVdkN0d0akpIeXB6T0FQWkxl?=
 =?utf-8?B?Z0JaeDduc2RndWlHNlpKUElEeVZKTC9jeHZjSUdiZUpEeVljTHNnTVMxbUIx?=
 =?utf-8?B?czNnYk9hekxmcE1ZN2diSUNaSFlPbHJwdWxCS1dqeUNNcEYrS3hoNmVKdkhU?=
 =?utf-8?B?NHV0TzVzZFFiZVBHbmRvUWlOcGRPVzJmcEVnZi8xbXN4N09hRDJ0Ky9iUkhm?=
 =?utf-8?B?N05xUUxWKzNhUVlBQjgzd2xmcVp0RjRJdDdtSU5YZmtzVERmb0l4dkh6UEw5?=
 =?utf-8?B?WTFPZVJ2cWdtcGhaRXRibkt6cExSdDJPK2VuNmNKaXRWYWMxSUxLT0lPVmF1?=
 =?utf-8?B?WU4vTGUwbGxSaHV1WFo0aGxUU1MvY0k0UmtLSXNoR00zcURBcG9zS2lqOUtO?=
 =?utf-8?B?YjVZd2tBVG01SG5HTFd2bXZ2N3hJbFQ2ZDdUSkdDckhqTEcxaFNVVm01cHA5?=
 =?utf-8?B?cGQyTFM2Mk0vRjlUTWlWbHY2RlVUT0N5ek5sb3RNRWU5aWV5YVVZRnk1R2lP?=
 =?utf-8?B?NXlkQmVBK1l3L0c3VFloZyswV0c5R2lxS0ZuSnVoQS8rT1dQYnc0ZmRNUUlu?=
 =?utf-8?B?YXVobFRVVk5XYjlyaXg3R1FFaElDL3FtcHM0V3ZHZ1N3bGlXT1h1UDVlZys4?=
 =?utf-8?B?RDJyR3hmdGs1SFFudnkwVGZtMkw2NkoyaVc4dEZrMmJzd2tSTHNlUktaUERF?=
 =?utf-8?B?UHFVNEIzRW1VTmRpcnAyT09qVkd1TVZzQ1orTW82Y1JBYzNNbnhKSlp6TkV3?=
 =?utf-8?B?ZExEblBWZ2ZqdVIyaS80a3kyMEF4eXRTTzNocmhURHpCV09saHJmRnBSNEhF?=
 =?utf-8?B?cHlFSkpqTzRxc0M0WHgweDZuSVR5blVQWFEvTktPVmdGbVBEUnB6RCs5M1RN?=
 =?utf-8?B?Rmg3ZEhPdG5hWWpIcGh4MW8vaDh1NFFnQjJPazFNc253Qm9QOXFFL2ZQQzZI?=
 =?utf-8?B?SFU5ZUk3a1YybHI3TzNoYnc2Z08rK25VbEE3NkVyRWdwSENlSFFaK2ZtMDVx?=
 =?utf-8?B?YSsvdFlQZmd6RFFLU2RiRmxmVXhVckFGUEJpTnhiVHNaa2dKc2ZMWVBUNUJV?=
 =?utf-8?B?Q1VVTWxaL0lURDFaS1FRb1lwR2RzNlBEKzUyTitub3hHcjZ1aWRJUUlHekFl?=
 =?utf-8?B?RFZqZVkvVVBWME1mOWhoVGFiU3lrN2FvdzVPMzhFTHcxSS9SVjREaWdqUm41?=
 =?utf-8?B?bi9SbC9LTTMwZjVROGZ0Q3ZpSTlyV2hWcnJkSnJOSlVlalZlTXExd0VTMmN5?=
 =?utf-8?B?OVRpNENiRXViUEtmeFZuUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33CF0556AFF7614B9399FB7A4E4C7FE8@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18d8700-4277-426d-4fd5-08d8eee7b9fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 17:10:29.6763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z5iGuFTt633EQ10ayYfNpCXK+8k6QPh5sPyFpF4+3wSZRBXv4qfrBx36AC0C6W40Cc8USRStOpNbXLYLoAg0u3wH9Rvoqa+DdQZ9RnxcjcU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5944
X-OriginatorOrg: citrix.com

DQoNCj4gT24gTWFyIDI0LCAyMDIxLCBhdCA0OjU2IFBNLCBBbmRyZXcgQ29vcGVyIDxBbmRyZXcu
Q29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDI0LzAzLzIwMjEgMTY6NDQsIEdl
b3JnZSBEdW5sYXAgd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+PiBDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+
DQo+PiAtLS0NCj4+IENIQU5HRUxPRy5tZCB8IDEgKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspDQo+PiANCj4+IGRpZmYgLS1naXQgYS9DSEFOR0VMT0cubWQgYi9DSEFOR0VMT0cu
bWQNCj4+IGluZGV4IDhjODkyMTJmMTQuLjM1NGYyMTNlODEgMTAwNjQ0DQo+PiAtLS0gYS9DSEFO
R0VMT0cubWQNCj4+ICsrKyBiL0NIQU5HRUxPRy5tZA0KPj4gQEAgLTEyLDYgKzEyLDcgQEAgVGhl
IGZvcm1hdCBpcyBiYXNlZCBvbiBbS2VlcCBhIENoYW5nZWxvZ10oaHR0cHM6Ly9rZWVwYWNoYW5n
ZWxvZy5jb20vZW4vMS4wLjAvKQ0KPj4gIC0gQVJNIFNNTVV2MyAoVGVjaCBQcmV2aWV3KQ0KPj4g
IC0gSW50ZWwgUHJvY2Vzc29yIFRyYWNlIHN1cHBvcnQgKFRlY2ggUHJldmlldykNCj4+ICAtIE5h
bWVkIFBDSSBkZXZpY2VzIGZvciB4bC9saWJ4bA0KPj4gKyAtIFN1cHBvcnQgZm9yIHpzdGQtY29t
cHJlc3NlZCBkb20wIGtlcm5lbHMNCj4gDQo+IEFsbCBrZXJuZWxzLCBJIHRoaW5rPw0KPiANCj4g
VGhlIHN1cHBvcnQgZm9yIGRvbVUgd2VudCBpbiBzZXBhcmF0ZWx5IHRvIHN1cHBvcnQgZm9yIGRv
bTAsIGJ1dCBib3RoDQo+IGFyZSBwcmVzZW50IG5vdy4NCg0KT2gsIGdvb2QuICBJIG9ubHkgaGFw
cGVuZWQgdG8gc2VlIHRoZSBjb21taXQgdGhhdCBpbnRyb2R1Y2VkIGRvbTAgc3VwcG9ydC4NCg0K
PiBUYWxraW5nIG9mLCBJIGRvbid0IHJlY2FsbCBhIHBhdGNoIHRvIHRoZSBSRUFETUUgcGFja2Fn
ZSBsaXN0IG9yIHRvIHRoZQ0KPiBDSSBjb250YWluZXJzLCBzbyBJIGJldCBkb21VIHN1cHBvcnQg
aXMgdW50ZXN0ZWQgcmlnaHQgbm934oCmDQoNCklmIHlvdSBjb3VsZCBzZW5kIGEgcGF0Y2gsIG9y
IHByb2Qgc29tZW9uZSB0byBkbyBpdCwgdGhhdCB3b3VsZCBiZSBoZWxwZnVsLg0KDQogLUdlb3Jn
ZQ0KDQo=

