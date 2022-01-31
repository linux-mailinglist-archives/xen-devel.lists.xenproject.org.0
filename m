Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B324A4B15
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 16:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263177.455796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZ1C-0007Q1-IE; Mon, 31 Jan 2022 15:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263177.455796; Mon, 31 Jan 2022 15:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEZ1C-0007Nq-Ee; Mon, 31 Jan 2022 15:55:02 +0000
Received: by outflank-mailman (input) for mailman id 263177;
 Mon, 31 Jan 2022 15:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ9D=SP=citrix.com=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nEZ1A-0007Nk-RM
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 15:55:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 229cf4d6-82ae-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 16:54:58 +0100 (CET)
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
X-Inumbo-ID: 229cf4d6-82ae-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643644498;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Prv3EJWTyPHuaPriPZoNxCaQPiKljE0vKS0RDs5UYVc=;
  b=MZvVf30lhSVI6Kf2yoHHgoJEEf3nQ9H3jdD3X21rCjOsyqzRR98VvQEF
   JG5Jx0dMbcHK5b+z1RHAV+KdGsHgmGKv6Wy29ZcJI9QRMEBv2Tm2x9Ser
   VNsyUDh3pr21XUpau+zAE5Ys4hkcA8IbdE2jUrFUzqffIGBYU0eKwT9ZE
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /XB4q8+4zDo8zUTsuFlOmFO29N2XgvNV9ozG4t8DjYO+MR+SGI9scRgqRHBpHKgBUeOsYuBDS7
 yTITJGE6EaY0Q79cF2PQ+70NyUvOgZpi3EJB/P8ZGzHV48fFZC/Ug/8w3APe4IlI5/NPbu8YOS
 bEotkPyx3i3qvhP2Ur0hbpP+JXt35rdn3W33tIwZsXv96BOYm+j8NZfnf6vat+J5X4ySJq9HdX
 W5wZ2nqlahPHABzxhiyQQSSMyIyabkSnpGjvlCJcZNioSJbVgql2h1rMnluY8nGyjw6MkYYeJJ
 1egILrm/H6dqQeotaVC9yWMZ
X-SBRS: 5.2
X-MesageID: 63548975
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WHwztqLymK8yTC/QFE+R0JMlxSXFcZb7ZxGr2PjKsXjdYENShWMCm
 2MZXm6Pa/jYNmHzLYxzaIq2o00G7MKAx4IxHVNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Us4wrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ypMBfw
 epGraC8CiYJN4P0neMPaglXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFOj8IuauziOIobs3dt5TrYEewnUdbIRKCiCdpwgmxt2pAfQqu2i
 8wxORBgdD7ffh52BHQQOMgzl/uapEDZbGgNwL6SjfVuuDWCpOBr65DTN97Sds2PVN9itE+Sr
 WLb/Ez0GhgfcteYzFKt6Wmwj+XCmSf6XoM6F7Ci8PNuxlqJyQQ7AhAMSUGyp/X/j0ekQs9eM
 GQd4C9opq83nGSoQ8f8WVukoXeClh8aR9dUVeY97WmlyLfSpQCQBWEGTztIQN0gqMIyAzct0
 zehgNfBFTFp9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseIa3gcfyAirY2
 C2RoW41gLB7pcwW06S2+3jXjjTqoYLGJiY37AjKWmOu7itieZWoIYev7DDmAe1oddjDCAPb5
 T5dxpbYvLtm4YyxeDKle94dMriW7O65PH79oVdBJ5wm5Q299Cv2FWxP2w1WKEBsO8cCXDbmZ
 k7PpA9cjKNu0GuWgbxfONzoVZlzpUT0PZG8D62PMIISCnRkXFLfpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/p7imlXxLMpLEPRZ5rIvp1nPUNIjVC4vf+G3oH
 y53bZfi9vmmeLSWjtPr2YASN0sWCnMwGIr7rcdaHsbafFY9RTF+U6+PkO9wE2CAo0izvr2Sl
 p1achQAoGcTeFWdcVnaApydQO6HsWlDQYITYnV3YAfAN4kLaoez9qYPH6bbjpF8nNGPOcVcF
 qFfE+3ZW6wnYm2ep1w1MMehxKQ/KkXDrV/ebkKNPWlkF7Y9FlOhxzMRVla1nMX4JnDp5ZJWT
 nzJ/l6zfKfvsCw7Up6ONqrzngzg1ZXf8corN3b1zhBoUByE2KBhKjDrj+9xJMcJKB7ZwSCd2
 RrQChAdzdQhaadsmDUQrazb/YqvDcVkGU9WQzvS4bqsbHGI9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6ReklZuEkLUYgn5EbhnOHSHg5VC7/Uf2r9DtAKqc
 UuT4d0Ga66RMcboHQdJdgooZ+iOz98OnTzW4ahnKUn2/nYvrrGGTV9TL1+HjykEdOl5N4Ysw
 OEAvs8K6lPg1kp2Y4je1i0NrjaCNH0NVakjp6o2Oo6zh1p50ExGbLzdFjTyvMOFZeJTPxR4O
 TSTnqfD2ehRnxKQb3opGHHR9uNBnpBS6gtSxVoPKlnVyNrIgvg7gE9Y/TgtF1kHyxxG16R4O
 3RxNl0zLqKLpm86iM9GVmGqOgdAGBzGpRChlwpXzDXUHxuyS2jADGwhIuLcrkkW/lVVciVf4
 LzFmn3uViznfZ2p0yY/MaK/RycPkTClGtX+pf2a
IronPort-HdrOrdr: A9a23:CeI3pazlHzq9sBo3KprCKrPxj+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9IYgBcpTiBUJPwJE81bfZOkMcs1MSZLXXbUQyTXcBfBOrZsnLd8kjFmNK1up
 0QCpSWZOeAbmSSyPyKmjVQcOxQgOVvkprY/ds2pk0FJWoBCsFdBkVCe32m+yVNNVN77PECZf
 6hD7981lydkAMsH6OG7xc+Lor+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdPapzbgpDCcxrXBQ4e2UmZ
 g7rl6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuIoO5ArZviX+9Pa1wVB4S0rpXW9
 WGzfuskMp+YBefdTTUr2NvyNujUjA6GQqHWFELvoiQ3yJNlH50wkMEzIhH901wuK4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+yBnbWSRzBPWqOKRDsFb0BOXjKt5nriY9Fqd2CadgN1t8/iZ
 7BWFRXuSo7fF/vE9SH2NlR/hXEUAyGLH3QIwFllu5EU5HHNcnW2By4OScTepGb0oUi6+XgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.88,331,1635220800"; 
   d="scan'208";a="63548975"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eatEvmeJ/T27iyGG8l/tyfH+zuR3chfDOXknneR86N8tO21RrCH/m+ifyvWeavJWJMNe2erOgG74BUyM4tG/UdkoLFCkaMf9rTAurejO/C3I6dzp7hKUb+0AaWkaGun6fKRJSpUURfXRAt10gku1yK1GksOT/Pv5vAFvURhZ3fTITMaTizrqlb/p/9algc6hNfpjpBwOIsiFss/0DBFs2aOB8IDLl2518l3Yjq70mAXQCqcblmPXM/esKw7V83Xc3t9BKONxpfFCi0FVwMJOwz4X7fBKvqDmKf/8IEmnS9XeGWJTXAOYWrFmo4Z6OZtSEesC2PKCE8XI4OZB3a+cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Prv3EJWTyPHuaPriPZoNxCaQPiKljE0vKS0RDs5UYVc=;
 b=c6NL4rHnHYqo7iFMMXVG2vdLkPPl5ZobUDDGQ3vrxmeVctRYh+CsiTrccUDVO+G8GPugY4YGLlLO9wuWcSJ5YdYNO9wjtQPxu+fG6M1GYh9MXTQU1ZIDNisVPziC+6O0+3dre6PcZLlF9q6iTk4OHsZCdKzBigKTNZF1pcdPUuDS+deOf/yGJ8YkGjGNn8atqx9cZIWKZq1te8r81hsjmK+8nhuzAtPOEt+RdjrgH5mFLHHL4BtKE4TcbaunmVanohexMJ2F3fY+pzowdDxiJMwrHvEJxpau8+NUm+NBdK5vPJxZHXSOCY3zc+ruo9fu3aawhIOAcdDSg58q5cbfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Prv3EJWTyPHuaPriPZoNxCaQPiKljE0vKS0RDs5UYVc=;
 b=Ec8cLAvCPuV+M+a4LxLBX8RUjEJzRvYVbwWhh1ClxPa58OmDZK9afA78bYrSYK2vvAIakLmcrkvCO+oS/8OvehkC142hFT8gT9PgZi5lENOjFODbjE/xXr3ud529XOcoEQIl7T5kRZJBCsgwUCTJ+VYEyGXqtdIhvcFBmos9KBM=
From: Jane Malalane <Jane.Malalane@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "George
 Dunlap" <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] xen+tools: Report Interrupt Controller Virtualization
 capabilities on x86
Thread-Topic: [PATCH 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Thread-Index: AQHYE5d4GSao6/4dAkKp8GGbQShiJax4qxGAgASjWoA=
Date: Mon, 31 Jan 2022 15:54:21 +0000
Message-ID: <997de807-4d73-c1a1-3ac9-883fc0e33efd@citrix.com>
References: <20220127160133.11608-1-jane.malalane@citrix.com>
 <20220127160133.11608-2-jane.malalane@citrix.com> <YfQiIzxNMVDAGz7p@perard>
In-Reply-To: <YfQiIzxNMVDAGz7p@perard>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e373945-d321-45c9-7c28-08d9e4d1f25a
x-ms-traffictypediagnostic: BN8PR03MB4802:EE_
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
x-microsoft-antispam-prvs: <BN8PR03MB48021646C76137068009A78C81259@BN8PR03MB4802.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZY9Dz98eMVw1hqFXPlJFnBJdXTP623l+TppKUL4UML2I9zeN79IM2Ql/mL2izEeg9H61gp/jjkEoX82c7AWQLgB8aw+NFhyd17p1uQuQ/aRs5b5CpMw0TacXPbhFfRuuSE9Ryv69hn/XIPjb5zPFBS3Ti7NqKcNJlcdQLCiSqem1tDSsnVPB/lfuU+I2/o5fFbaJLWBfst/Ph34+0WtcG133Ehoi6QmTcE7hh9EDmg07gjTMFdRDwywOigS/rFrQBd9t8YS/Q925v0HVJw8moO6D1kMSlVWy+MMvS+L6Unf4cTJrNWkYcHrjTd+vdoDVUv7FBzz3X9OEWJvsMxHI8wugU30lfRoz/kESSp7MRqrJqrEIjfrMrv5MZ7fcfRPrAyoCs0JPKpCGqM54LrzT2/JhCEppgrADObMXOijU3wXLFGbseq5BYeVa5L4+8IJKrWvo+2KCThNp1+K6c7M6bc9cHd/r/9ebRrcXxDFAUmQf19YmwnrjIpc8ubOXrTv9KSdfGzVOG8OtwoTZCkPT9KJB+utQB9y3nNUKSbR4LRSKLufKnQeSqxLRlk4YiA+oXNTzmi85Q+wdxBOrtLxvMMorIc5P+vxK6IhUCmBrPXaxwxBDqbvCgLka6LtFtjG5y/8NLMlsfXpPxw51PW4hDXH0VAZNxpWtlB5I2z0jY+Kpxkm68RV9ffP5teYH3uazSYwSWUcgNeMIk+w0796KwsGtErqBlk/qT+3N38kPuw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR03MB3386.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(86362001)(31696002)(38070700005)(122000001)(82960400001)(66556008)(64756008)(66476007)(66946007)(8936002)(76116006)(6862004)(8676002)(66446008)(71200400001)(55236004)(4326008)(53546011)(5660300002)(6512007)(6506007)(508600001)(36756003)(6486002)(37006003)(6636002)(91956017)(54906003)(316002)(7416002)(2616005)(2906002)(107886003)(186003)(26005)(31686004)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REg4cGdCTVhMb2NJYzROOWNKdHUxUldVV1QwSU1WOXBGOHpoczdhZDZhRTdz?=
 =?utf-8?B?WEZEa3pDUXdSbEljY3ovWUJjdHBZWlpkWW1IR2ZZLzVZV21hZXRQU2lDUkNM?=
 =?utf-8?B?cEovV3IwbmpSWkFSTi8xcHhJNDRJMjlDbFVpaDJrcUd2Z0Q0NklKWmdOamFV?=
 =?utf-8?B?SHRhY3VndE13YmN5MGczS24wbGFwcjVaeDhmeDlKTFE0MUdTWjliWmlUWVJq?=
 =?utf-8?B?bEw1TFVIZWVOcUtybUJacU1SYWZxSlRBKzVnanFQZmVVUlIyVGpjcFh0TGt0?=
 =?utf-8?B?cW81aGE4ZUtkbmIxRitKNXdPb3loaDBMN3RBMGJmUERVV0hsdUNTWnc3M2VB?=
 =?utf-8?B?T0paV09XZ3FmbkZ4bzZFeUljalF1N1Q1bUFWM2xIbHhhaDVrNFg1OHlBL1Fh?=
 =?utf-8?B?R3BXRHFvQzEvWHhHS2JBU29KNUZ3YldzcjB2WWlHUlY0TDRUUlRIcGFRSk9q?=
 =?utf-8?B?Qyt2ZFV2MU1odVQyKzNLa3pGdVJvTmFRdy9WSnppdHlCVE5VV2lmVGZGWC95?=
 =?utf-8?B?aTRhRXUwWU8xNk51WkliMElQVTV6b3FndXhsS1FvNHlKcmp0K3U1N2ZwamVP?=
 =?utf-8?B?Y1UwYWNOQzljdm9VYWIyZTFVenJOZ1RzN2szVDFmVjVrNWNYTVNaWlFReGl2?=
 =?utf-8?B?UjJweFZCekF5WlpiRWsvT004YkFrL3FuaXZRVng2NkRPTGdLQkd6QU54dWc0?=
 =?utf-8?B?SDF0a0JpejhiN1FoSjFzK01ldGV4ZHBONlB5ZzdFelYrbFVVUzRLdW5xKzAw?=
 =?utf-8?B?VWVsZUV4OFIzQU1ZOGhMSzJmZHpoekRiSDBEZmcrQUFicE0xcUxjcXZOa3A1?=
 =?utf-8?B?aU9Qa2VpVGp6bDUzQkplMDN0eVdYSEtrUUJ4K1BQMzBESUsxYm03dUZtS3Nq?=
 =?utf-8?B?SGNrS1RzU1VvWi9nK2tIYzErT2hiaElSbnkrZ05Yb09JcWdBSHBKZjE5Z1F6?=
 =?utf-8?B?WEtOL3gxN2h2dHVCK0Z6WXBGeFFvUXJ1ODZlcThFM0FFdjI1ci9SRXZTa0xa?=
 =?utf-8?B?WWxJZ3VBOTNoRExiNWJXaTd4QkYzZm5LYXdRUkh4UlljbVRMM01CNjFTTjR1?=
 =?utf-8?B?K0VHa3JBYi9pb3lnUHdXUGNGVWphRTdEaFdGZktmeGIveXFaWTVNUmJ4QUVM?=
 =?utf-8?B?SlpYWWpMUkRRUlZPYm0xWnhtanpYemVpMjRtVzViVklhbVdxQ1VhVEhuRXdv?=
 =?utf-8?B?bFFVQUxoOGx3MUw0Y1BBWmdhcnVnNlpTS2hjV0JUbTBVY2E0TUp0bk9tTEF2?=
 =?utf-8?B?cjVhTjF1SFFCOXoxRmg4MTFST2YwMjJHeXF6cjRWTzEvSHZoQUM4cEljbGxW?=
 =?utf-8?B?NFl2TUkrYnNBak96UWMvMnlER3A4MVlnZzdNYjBSWDM5OERsOEhlQjJkK0Y4?=
 =?utf-8?B?TVhJOEw4UXZ6OXBEMWM5bUN2UGxYRit6K1l3MzdMb1ZrbG5Ycm5RMWZsa245?=
 =?utf-8?B?VzdZWkN0ZlN3dEJZTzkyQThxYS9JTHBvQnVBcUM0V2tTOEhGamo3TXhOZCtF?=
 =?utf-8?B?MWFNeWZvTndTamZlaW5GUXRGVGhwRzhMZ1ZNWEJDbXpOVnFwbXpXeXI0OVR0?=
 =?utf-8?B?d0trMVdQMXk0eXRoSU1KaGZVOHI1RGFiaGdQalpQT3NpaHZIWWtUSldMZS9w?=
 =?utf-8?B?OGptTCs5eXliNjJjN1VvQUNvckFTcnFMYS95ZUlTcDBmSWdJMFdnUlMxcmpT?=
 =?utf-8?B?VzR5VXAySk91TUVsVTlTeU9VRHBpdXlEUktXWHVUVndvbUhUS2VscFpLQnJG?=
 =?utf-8?B?QkFvSURLRTVCM09mR21kMW5Ed0JYamxBci9RKzJYQ0Z4a2V0NklUT0lXYlFQ?=
 =?utf-8?B?TnhzQy9OQk9QN04vTllwSHRhR2J4QWsvSFhReGJ3dXlrd096aEI3ZlIyMVNQ?=
 =?utf-8?B?SmpkUkxXcVA2SXU1aENhU2Q1a05SQTVjQkNEckVBbmMrMHAvZWt5VUdFWGNT?=
 =?utf-8?B?bGJLUkVieXo5SlFYM1NWYmh3TVZaaVd2eGtKRURWM1p5MkM3Zm04UmtydVVx?=
 =?utf-8?B?NFZDQW80b1Q1ZDBCTWM2Y01iYXhCb2p0K0pscHJEVVJuaTRwMTgxMEM5cHlz?=
 =?utf-8?B?ZFh0cVNTbFUvYXd0ZERGYy9jZTBCYys0ck9HRllpVnpucnlYNUYyaDd6YVlE?=
 =?utf-8?B?bHRESDl4WUhWRVlxOU9NWENyUXBIZEtPZEp4UG1XRUJJOGJhRGNXeFBLT3Nn?=
 =?utf-8?B?STZHWFhmQWlycU5Pa251L3BINUZkKzd3QkI1ajh6RnZLSW00Ry9UUHkxWStZ?=
 =?utf-8?Q?wxxGi6tPcU/oMLRz8RbP4nbf3kqt61vatYvXc7wEMY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33569358B237FE4C8B654831F309D2C2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR03MB3386.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e373945-d321-45c9-7c28-08d9e4d1f25a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 15:54:21.4324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f0rw3hhkv6+Hufq1n8HkIoYrD8w2o8Y07BuM4N8KxLQG6CXK3UYwzWwa5WXzv76Zwg/PMD1vRyT9VQTgsM7vj5hrxg+rr/gyO2+vPL3WXdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4802
X-OriginatorOrg: citrix.com

T24gMjgvMDEvMjAyMiAxNzowNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIFRodSwgSmFu
IDI3LCAyMDIyIGF0IDA0OjAxOjMyUE0gKzAwMDAsIEphbmUgTWFsYWxhbmUgd3JvdGU6DQo+PiBB
ZGQgWEVOX1NZU0NUTF9QSFlTQ0FQX0FSQ0hfQVNTSVNURURfeGFwaWMgYW5kDQo+PiBYRU5fU1lT
Q1RMX1BIWVNDQVBfQVJDSF9BU1NJU1RFRF94MmFwaWMgdG8gcmVwb3J0IGFjY2VsZXJhdGVkIHhh
cGljDQo+PiBhbmQgeDJhcGljLCBvbiB4ODYgaGFyZHdhcmUuDQo+PiBObyBzdWNoIGZlYXR1cmVz
IGFyZSBjdXJyZW50bHkgaW1wbGVtZW50ZWQgb24gQU1EIGhhcmR3YXJlLg0KPj4NCj4+IEZvciB0
aGF0IHB1cnBvc2UsIGFsc28gYWRkIGFuIGFyY2gtc3BlY2lmaWMgImNhcGFiaWxpdGllcyIgcGFy
YW1ldGVyDQo+PiB0byBzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mby4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBKYW5lIE1hbGFsYW5lIDxqYW5lLm1hbGFsYW5lQGNpdHJpeC5jb20+DQo+PiBTdWdn
ZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+PiAt
LS0NCj4+ICAgdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvIHwgIDQgKysrKw0K
Pj4gICB0b29scy9nb2xhbmcveGVubGlnaHQvdHlwZXMuZ2VuLmdvICAgfCAgNiArKysrKysNCj4g
DQo+IE5vdGUgZm9yIGNvbW1pdHRlcnM6IFBsZWFzZSByZWdlbmVyYXRlIHRoZSBnbyBiaW5kaW5n
cywgdGhlcmUgYXJlDQo+IG91dC1vZi1zeW5jIHdpdGggbGlieGxfdHlwZXMuaWRsIGF0IHRoZSBt
b21lbnQuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfeDg2LmMg
Yi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3g4Ni5jDQo+PiBpbmRleCAxZmVhZGViYjE4Li4zM2Rh
NTFmZTg5IDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF94ODYuYw0KPj4g
KysrIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF94ODYuYw0KPj4gQEAgLTg2Niw2ICs4NjYsMTcg
QEAgaW50IGxpYnhsX19hcmNoX3Bhc3N0aHJvdWdoX21vZGVfc2V0ZGVmYXVsdChsaWJ4bF9fZ2Mg
KmdjLA0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+PiAgIA0KPj4gK3ZvaWQgbGlieGxf
X2FyY2hfZ2V0X3BoeXNpbmZvKGxpYnhsX3BoeXNpbmZvICpwaHlzaW5mbywNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB4Y19waHlzaW5mb190IHhjcGh5c2luZm8pDQo+IA0KPiBJ
dCBtaWdodCBiZSBiZXR0ZXIgdG8gcGFzcyAieGNwaHlzaW5mbyIgYXMgYSBwb2ludGVyLCBvdGhl
cndpc2UgSSB0aGluaw0KPiBhIGNvcHkgb2YgdGhlIHdob2xlIHN0cnVjdCBpcyBtYWRlIHdoZW4g
Y2FsbGluZyB0aGlzIGZ1bmN0aW9uLg0KPiANCldpbGwgY29ycmVjdCB0aGlzLCB0aGFua3MuDQo+
IA0KPiBJbiBhbnkgY2FzZSwgdGhlIHRvb2wgcGFydCBvZiB0aGUgcGF0Y2ggbG9va3MgZ29vZDoN
Cj4gQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPg0K
PiANCj4gVGhhbmtzLA0KPiANCg0KSmFuZS4=

