Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157494B5CDB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 22:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272629.467526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJiwJ-0003hK-8C; Mon, 14 Feb 2022 21:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272629.467526; Mon, 14 Feb 2022 21:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJiwJ-0003dp-54; Mon, 14 Feb 2022 21:31:19 +0000
Received: by outflank-mailman (input) for mailman id 272629;
 Mon, 14 Feb 2022 21:31:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qPn=S5=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nJiwH-0003dj-Do
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 21:31:17 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f2f2b69-8ddd-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 22:31:15 +0100 (CET)
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
X-Inumbo-ID: 6f2f2b69-8ddd-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644874275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=CDfkRo9tfiDg+IG+bGq+AYSj/W3U3Qi0b3q7MpT1dz4=;
  b=DiDTD9L39wGSpXXFoHNYXPXGoebQZ4bxN5Es1KixKmyv5GdroZDSX2Dd
   IMabUklhJMojx1T4boiKzA2IzAmRwkwybLg9Pwkcd7Xs+zlROK5K0Mawq
   S89I7uJAijnDRRZoQYRBp24iUj6k6rTFTgHsKRTGiYV/EAlPz8m4ayGQ0
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VpamOoaS6BoOMszqgHq2+itJ/Yp6++HoKiAYQ9pPHGXsx99HeOUygDK9IWkED5/1WBROnqUaFL
 5TabfW4NV+rYX6PAixq303sw+krwI302R5fyNYfFNSSttFeQGkv3F7LWkdbMrmdZ6uApEClprI
 bNv1jaTjkRDSTTj9ePmEq7jmdGalHz9szhfP0tdnYTakE6K9OW37qS9r/pqg9FoSYELjdZSMCT
 SimIBMHTcqZiVWuaj8dnJHYRkCrvouaiVrjOjwE/EcSY/+AGH3sm9CrBxmI/9iAUIW3im2bwWI
 u9fh75bdS1wpJ9yTDKtd9lBX
X-SBRS: 5.1
X-MesageID: 64093813
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lBjkW6JHqlD8YlJDFE+RFZMlxSXFcZb7ZxGr2PjLsTEM7AuW5UVEl
 zVBCC3DeKqUMyGmS21FGIu/oEpSvcTTyYNhSFBr+y4yHygQo5LJDovGckygYijKc8eYEkhsv
 5RHOoOYc5loFS/WrUf2PObqoCQk2PHUS+aU5IIoQsxUbVYMpHAJ1UIz8wJAvrNVvDSZP++sk
 YOu/MfSaQD6gG4sO29I5fjY9hk/7KupsT9E41dvO/4S7QPSz3UbMskSdPq7R5farii4PQIYq
 8LrluzRErbxpk91Yj+dfzKSnnQiGtY+ByDX4pZtc/Xk0kgqShAaiP5hbqJGMBsP0V1lovgqo
 Dlznc3oIesWFvWkdNQ1C3G0xAknYMWqUJeeSZSOmZT7I3/uKhMA8N03ZK0CBqUK+/4fPI173
 adwxAbhzPy0r7neLLqTEoGAjym4RSXhFNt3VnpIlVk1ARu6KHxqrmqjCdJwhV8Nas5y8fn2I
 JAhYitsSEv5QgR/BX0nGa8vsbqxryyqG9FYgAr9Sasf5mHSyEp60aT3McqTcduPLSlXth/G/
 CScpT2/W0xEcozEodaG2ivEauvnsi78Qo0fUpGl8PpjmHWYx3AJCQ1QXly+yRW8ohDiA4MEe
 xVPksYohYgQpReMXuvEZgaf/VSWuQJAVNRdL+JvvWlhzYKLul3EVwDoVAVpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq19KqQrD60ETgYKykFfyBsZQAC5tzivJ0+lAnnXttlCLSyjND+BXf32
 T/ihDc6r6Uei4gMzarT1VHYgRq8q57RVAk36w7LGGW/4WtRYYe/YoWy5Fvz7PBeLZ2YRF2Mo
 HgFnceF6OkES5qKkUSlQu8AAbWo7PatKyDHjBhkGJxJ3ySg/TuvcJ5d5Bl6JVx1KYAUdDnxe
 kjRtAhNophJMxOXgbRfOtzrTZ5wlO65SIqjBqu8gsdyjoZZM1W/9zBtQRGp/nndr2IcgJwuF
 MqCWJP5ZZoFMphPwD2zTuYb9LYkwCEi2G/eLazGIwSbPam2PyDMF+pcWLeaRqVgtf7f/l2Jm
 zpKH5bSk31ivPvCjj47GGL5BXQDNjAFCJ//sKS7ncbTc1M9SAnN5xI8qI7NmrCJfYwIzI8kH
 VnnAye0LWYTYlWdd223hohLMu+HYHqFkVo1PDY3IXGj0GU5bICk4c83LsVrIeZ3pLE+lacvF
 ZHpnvls5dwVFFz6F8k1N8Gh/OSOijz37e5xA8ZVSGdmJMMxL+A40tTlYhHu5EEz4tmf7qMDT
 0mb/lqDG/IrHl06ZO6PMa7H5w7h7BA1xbMpN2OVc4Y7RakZ2NUzQwTrkOQNKt0BQT2agGPyO
 /C+WkxD+4EgYuYdrbH0uExzh9n1QrUuRhIARwE2L9+ebEHnw4Zq+qcdOM6gdjHBTmLkvqKkY
 ORe1fbnN/Mb2l1NtuJB/3xDl8rSPvPj+O1XyBpKBnLOYwj5A79sOCDej8JOqrdM1vlSvg7vA
 hCD/dxTOLOoPsL5EQFOeFp5P7rbjfxEyCPP6fkVIVnh4HMl9rSwTkgPbQKHjzZQLeUpPdp9k
 /shosMf9ye2lgEuboSdlilR+mnVdi4AXqwru4s0GojujgZ3mFhObYaFUn394Y2VasUKOU4ve
 2fGiK3HjrVa50zDb3tsSiSdgbsD3cwD4UkYwkUDKlKFnsv+qsU2hBABoy4qSgl1zwlc174hM
 GZcKEAod76F+C1lhZYfUjn0SR1BHhCQ5mf410ANyD/CV0CtW2HAcD89NOKK8BxL+m5QZGEGr
 rSRyWKjWjf2ZsDhmCA1XBc9+fDkSNVw8CzEmdymQJvZT8VrP2K9j//8f3cMpjvmHdg11R/Oq
 uRd9eptbbH2aHwLqKohBojGjbkdRXho/oCZrS2NKE/RIVzhRQ==
IronPort-HdrOrdr: A9a23:nB4zR6mMVxG98QDeN59Es/kLrazpDfObimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcIi7SdS9qXO1z+8R3WBjB8bfYOCGghrmEGgG1+XfKlLbalTDH4JmpM
 Rdmu1FeafN5DtB/IjHCWuDYq4dKbC8mcjC74a/854ud3AQV0gJ1XYgNu/xKDwTeOAyP+teKH
 Pq3Lshm9PPQwV0Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8ATeSITCNUwH4ox69Nlkm1LimjodlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KQuZ+w2a/puVFZ9l/1WwKpuKuZKIMs60vFSLM
 B+SMXHoPpGe1KTaH7U+mFp3dy3R3w2WhOLWFILtMCZ2yVf2CkR9TpV+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBRjMLGWRK1L6E7xvAQOBl7fnpLEuoO26cp0By5U/3J
 zHTVNDrGY3P1njDMWftac7uywlgF/NKwgF5vsulaSRi4eMM4YDaxfzO2zGu/HQ1skiPg==
X-IronPort-AV: E=Sophos;i="5.88,368,1635220800"; 
   d="asc'?scan'208";a="64093813"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ340nc+21kDQLSfE5ywywusYnzLYLj58W8O2MYCYo9v0oW60+hXnv2g4JHQUfylkFNKH+y0pxvtRKEFffH5cDdmMSd+ZOZ7OwizHQHS5XgvBGQLaRjHPM/vAOjwtqC8FdvrKvA2DRug03tFka74Jy9vGx+2JCaddHU3mIJtYIpRVEidQ5RS2LjEBEti/BxELevXKFaigpzt8t5zBPFVpDi5ve1piQUl7b0ZwmcIm9kFIxnA4nbJAoWex+ZHpJIVvuqlSWcbNKtgei4mgRJ6T6fTZu2vCaZpNKsmxFioJAcS1tGzNKC7pdwuv2/2UU+6xJUzfeU91FkrWPZk9aYYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcJI9aolRJt2kqZTiLW+R2cEOacMt6seQj0BePZvVcY=;
 b=DysxIMDMeVL5T8HXhNLE8Gfezom7f1eJ5a5lU6KPmBCEPI+zdF0phtmP6YIWTwjUNr1/fX729dwYEwBM7D2gAoBeX4803vePoE7z1+3BqPV7rLi6Cw4E+bsvK084eiYbi5p4fvTFQhl2OB1is0VsGlA7UUgfIOwV/vrjSaTagIX8QTJpTwxSnVH7dxzuk7gf+lws0dfIL5q69fyuDirDfyIRH2i9eT593/lPASomitipcqDROmLJWhl0EwC15nyBTJfo9XrIpBi7fqFy+uVeghehxhQZNnhMYcPgkkp+7ersvRM5PFGS7iVqX8Lkg+9XlcFAVgHjIYqzgCCgFPN/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcJI9aolRJt2kqZTiLW+R2cEOacMt6seQj0BePZvVcY=;
 b=frOfN6zpet+7/LfqRC0Q71BFeZ/9AwNiybKwmw7/NZXQzAUDG49SCcaBsqREn2cT6owoSHG5jgWgQkDndWi9/rGknYLZXHJpPF+UYCO41h8BFm8/8eJJSeDT8pqpK1W141CTjLdo6q7HfEtvbbDGd3Vrb5RaVgooOHSQI4zotLo=
From: George Dunlap <George.Dunlap@citrix.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Ian Jackson <iwj@xenproject.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"committers@xenproject.org" <committers@xenproject.org>
Subject: Re: [PATCH] RFC: Version support policy
Thread-Topic: [PATCH] RFC: Version support policy
Thread-Index: AQHXkDev9/QrG+8IgUOEs2JU9EeShqt5JH4AgRuPbIA=
Date: Mon, 14 Feb 2022 21:31:08 +0000
Message-ID: <2C342C85-8CBF-43EF-A6AC-9781D62EAB8E@citrix.com>
References: <20210813113727.6028-1-iwj@xenproject.org>
 <YRzsAvOU5G2O1X2+@mail-itl>
In-Reply-To: <YRzsAvOU5G2O1X2+@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ef43d5e-fb92-467a-4f34-08d9f00150ce
x-ms-traffictypediagnostic: DS7PR03MB5655:EE_
x-microsoft-antispam-prvs: <DS7PR03MB5655A0C56C191B99832C254199339@DS7PR03MB5655.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RMRF5HxiDBBABtf3O1ijhFwJ6PLP9QWMGyNKLItTqI9UgMPa7ZGvH7gpxvsIGJc5lE4HAFuXvFSJIkm/dJV55Jh1nmWr3MxVMvfEeAoSb4efkI1OLXwKEClG7yt4xQg+3v3x2mbYx6FPsWo/bOkaa8uIEMauKxEXMLgmveczEquBKrMpQJxVMrUcs77xZOFIKMFeAusddYrzNtGmehCdXZWOIWDq4cvbeB2MxoF8lJeed2rrOp/0Fdjj9f6qu2ZcOUKrtsDNyO5FQkLyj/nFOQUE+fi+543ylexed9BnbgdLNhEMqWoKpKGsWAoeQ0W/81DaaM4UeHdij+ZjsHDh4qVp7wMVh8USAyP0/g6ZYVFgrNP+I1JUCVgcyZXqLRVHJ4pB4h93+iAte5YgvS+AHVDXlhdoflRl3rCNp/0V+OUGtEBJWi1FWnlCDTFWCOMsVJwRE+AVwne5mWD7xcOC2YQxLMoXVh4oQVw/HeotPAt/JZnuqSgTAlFkYuTHZ2ueaz2d1ingBBFex9ieipRdf5JqWOumhx4U6l/r5o/8RjLz+49LEMjpAK8QmKxWh5yNmqcvARX0W2trDcsHMuCpNFafn9Wdk7ahpXA624OX6cqcC8DhIKNUuf60DblVcwBotO2ZGe+m5W8XtCIlQo7/+EKv8bT5KWwlrfmaSAwt0mnddRiithRFBaAgKsTYclgZmu8GFuNO5vn5crsohmz94d/Bi5Zm10WrGKm7PJHfR5uZsyFXsfrvsh6gncuyDkuL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(6512007)(53546011)(6506007)(2616005)(26005)(186003)(66574015)(33656002)(508600001)(4326008)(8676002)(66946007)(66556008)(66476007)(316002)(36756003)(54906003)(8936002)(64756008)(66446008)(86362001)(6916009)(6486002)(91956017)(38070700005)(71200400001)(99936003)(76116006)(5660300002)(38100700002)(122000001)(82960400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkR4L0h1ZTVXbnYyWVZpK29MWURxbEw0cGg5WkpLc0RlL3lhMHlIZ2gyM3Mx?=
 =?utf-8?B?QjBMZndWMnVwTkF2L0R1eHh0RktIeUNQRHExaWRGS2dNK05DVWJhN0g3dXgv?=
 =?utf-8?B?cDAva0k1RHhnMitPVDdPdkhMVUt1enZnZ2dDdTIvYWl5dU5PVVYzWFYrRGpR?=
 =?utf-8?B?VTVVQTVMcXZSZmpsRWZaNEpEc0tub1dFN0J3T3ZVc252UW5HSHlxTVVtZ3Qv?=
 =?utf-8?B?K2dyVlA3SDIzMExxMXdVQlNzVnZyeTZqQW5oWU54NEY4QWt5R2JVU1FkNUc5?=
 =?utf-8?B?WGpLblhYUldPZ3p1elhKelFRRy9HQlVYeW1GWW9yR0x6WVhxV01aTUZRMDRP?=
 =?utf-8?B?NGp0ZUxoa25wRnZKdFd0SXV2ckdSSEtneXZSUVArS29HM2tUemk5RWlNVE5j?=
 =?utf-8?B?M0F6Z0lXZzVUN1k5L1RuTWtNRUwrSk1JWXFHN0xQemw4SGRTMGE4U1hydFpy?=
 =?utf-8?B?YUQ3QVpUY0FmZERvNzhHWmhsU0ZpUDR0U3J2VXJhck9NR1dkYVdQVHZRNHNo?=
 =?utf-8?B?QnV1OGI4RnhxMmxCVDVXOFRpdndRaG96S2NUMGRYVW1rR3lQV1dGWDc3Ry9G?=
 =?utf-8?B?MVEyVHBBTnM5Vm9rUDhCOUdmVmNLQks4QnI5ZTZ5bHFmaUwxQ08zZUUrU2Vt?=
 =?utf-8?B?ZlUrVmF3dEJBdzEzeTNRcU5pbVlHbmdjVGZXWmtxQ3V3dGk3YUlVdVRXZEQy?=
 =?utf-8?B?a2xkbWtMTGZMRUpHYnRqZjcrdG82elh1ZmlCOWhHekVrV29nVmYwMXdvV3k2?=
 =?utf-8?B?bGZSRVlHa3NkbDZzbm9iUFNQQlRVZ1pqRmlDM2YxQkxXdFFncDRlc1lxS3Zr?=
 =?utf-8?B?TWtXeHpRclhpeUg0VHZtZGV4OGNTVkVrUTc2cWF0WnR3YkxwNmttbWQrTHlI?=
 =?utf-8?B?bVExUUpCVGpYcXM0QkxLOGVhRUYvNlFHaVdmM3pOMGVUc3ArdFQwU2xDS3hq?=
 =?utf-8?B?bFI1QitpbG5hZWExL0dHdTRObmJpckg0aGdPblFaTjZvemF0R2N2ZlRGZTUr?=
 =?utf-8?B?Vno5L255SXpDZkhISm5OTmdkU3RQZ3hudDYyd0lpNnE1NWdhZmZ4dDZ1aXdT?=
 =?utf-8?B?RzhtcitsczlRYTFiNFJCTmNmc3lLS045WG5obHNxblQvdnhJdWlZNkxGa29r?=
 =?utf-8?B?L25sL2I4T20xVzk3RDBkeVM4YkRXSXduSTFJdlY4KzQxTS9SaDZqaHI2VjAw?=
 =?utf-8?B?cVFMbGsxZTJCdzBrc0NvalpNeWtsK2tnRU5UWlh1QXRBaVRBckNCZVNDWDky?=
 =?utf-8?B?NmdkdlJrVjRIcWV5ck9SUWVLcFNOeUcrYmQzTmxGSkxaMVZCQlBhN3VpY0o0?=
 =?utf-8?B?eklsdy9SVmxZeUVFeitrRFlUK3JKNVJ1Y1N3L2RlaHJsOFRXdXNKSWZqSWhr?=
 =?utf-8?B?OXZBVDJrdDVjUjJxQ053dzFZMXkwU21IZXRISUYvLzZDcmg1VVRaelhSZkhC?=
 =?utf-8?B?eVFhcDU2MWd6QWpOOTliU21KcnYxQU5KcGVoSlp6Q0cyRi95MjRsSWNyU3h1?=
 =?utf-8?B?dW83YnExekJvNGg2ZzdJNjd3V2MrMWtlNEEzbkkvcWQ1V3NBMnV5REkvU3RT?=
 =?utf-8?B?V0ZPaFVPTHhtdWk3eUU3L0Zqbk5LODJMS1NQZzJSTmU5UTJxelhTaXUwd3pl?=
 =?utf-8?B?VkZYbHM1UUhIRDdLRjcxdnFOUm16Tkl1OWdieExheGdFQmd1L2ovSzN4Mzh3?=
 =?utf-8?B?ZEU4N204THkzV2ZmMThqazFNMEZvUVJxZDZjb3l6MlZzQnhWVytyYm8xL0ZD?=
 =?utf-8?B?MjZiWUZnVUY2d2prazJlZUF0L0ZlODdXSFNTTlg5VzJVNjdJR1dVc1gxSGR4?=
 =?utf-8?B?NXpWUk5Bd0k5TFpFZ0YweTMrdTVqK2xVeUpod0RRc2c3dC9iRjRub24wWlFC?=
 =?utf-8?B?eXh5NUZnbDNacjk1eDdvd2x6YmpNWURNRmtnU1NEUUpHZ25Qa3BMY1ovbnRT?=
 =?utf-8?B?MG1JK2J1T3E3amV5YnV0SytzVlZQMVpkZytyWjJDb3BkaFNoa2FsaEhja0Fi?=
 =?utf-8?B?STVudXRqSllQcGhPcTdUclZXR0QxbThxcHJRK0YrUEJ1NWlYWkZVRGUyeXhN?=
 =?utf-8?B?MkpmQmZRZEV0dlJZRUJlV1F4UlZaKysxQ3JjZyt6V21ieHMzZTc5QTczUSta?=
 =?utf-8?B?OWRzNG1ud1BmY3Q1TTE3TlE5UWxoUmJxOUx1MUVYTUJBOXVaaFNua2RjRDFm?=
 =?utf-8?B?SVRBbktiSlljZXBRSjRoY3Y5MUd1dTg2QjlMRWZ6UU4zYlBXTG1SUWdqaWl5?=
 =?utf-8?Q?m8QhyFmaNmKxzX1+ySd0c2Oe+dp8xT5xY4abV8TX9o=3D?=
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D97B7FE4-B590-46A8-AEDF-7570EF923B61";
	protocol="application/pgp-signature";
	micalg=pgp-sha512
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef43d5e-fb92-467a-4f34-08d9f00150ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 21:31:08.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opoSZgCuNoPfCf2vqJZ/BKu0VNBSwDgz+7bEHiGJGIqYYvlpOVEeOrLiN2CSXdCwBAfnVRMcIaPMaehsTySwqzrN/gfTkl+/I4LteCbBkV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5655
X-OriginatorOrg: citrix.com

--Apple-Mail=_D97B7FE4-B590-46A8-AEDF-7570EF923B61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Aug 18, 2021, at 12:16 PM, Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com> wrote:
>=20
> On Fri, Aug 13, 2021 at 12:37:27PM +0100, Ian Jackson wrote:
>> The current policy for minimum supported versions of tools, =
compilers,
>> etc. is unsatisfactory: For many dependencies no minimum version is
>> specified.  For those where a version is stated, updating it is a
>> decision that has to be explicitly taken for that tool.
>>=20
>> The result is persistent debates over what is good to support,
>> conducted in detail in the context of individual patches.
>>=20
>> Decisions about support involve tradeoffs, often tradeoffs between =
the
>> interests of different people.  Currently we don't have anything
>> resembling a guideline.  The result is that the individual debates =
are
>> inconclusive; and also, this framework does not lead to good feelings
>> amongst participants.
>>=20
>> I suggest instead that we adopt a date-based policy: we define a
>> maximum *age* of dependencies that we will support.
>=20
> I wonder about another approach: specify supported toolchain =
version(s)
> based on environments we choose to care about. That would be things =
like
> "Debian, including LTS (or even ELTS) one", "RHEL/CentOS until X...",
> etc. Based on this, it's easy to derive what's the oldest version that
> needs to be supported.
> This would be also much friendlier for testing - a clear definition
> what environments should be used (in gitlab-ci, I guess).

This is in fact what I=E2=80=99ve been thinking and talking about =
proposing for a very long time.  As far as an open-source offering, what =
we really want is for the newest version of Xen to build on all =
currently-supported distros.  If the distro maintainers themselves no =
longer want to support a distro, I don=E2=80=99t see why we should make =
the effort to do so.

As you say, this should make testing super easy as well: All we have to =
do is have docker images on gitlab for all the supported distros.

 -George



--Apple-Mail=_D97B7FE4-B590-46A8-AEDF-7570EF923B61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEj3+7SZ4EDefWZFyCshXHp8eEG+0FAmIKyhsACgkQshXHp8eE
G+0uHQf+In1It+p6T7dLqQV10xi4Y0HMavI4yG8aSgdhcDk4PZZWdcz49HKXNa+i
auzu9AS215XRGuRCENAcWETmlCEW9wju2Bk6pxpcwEPNIto285lkMCgWaaiq7dDI
mvhRzyPIFk+Aqre9hgk6f+PDEtownpmdbHq0WaC6rFn+rw0KwhElBtshvOlJ5v/f
vMTPV05GkA0nA9C+TajTwQ6PHluQcLuqmM2N+6Eotx9oQ8l+ceznHH1WeA6aU6Hs
WfYb1UxHKOFveMJdq81oYKUjDybua5xWTLNQkkR4fHNyU493eOS3SlPmUEar+4he
mR1Ya6crBBk7PlzgP4UUEFmx52S7+A==
=32c/
-----END PGP SIGNATURE-----

--Apple-Mail=_D97B7FE4-B590-46A8-AEDF-7570EF923B61--

