Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B743FB2D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 13:05:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218508.378976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgPgg-0004Aj-9Q; Fri, 29 Oct 2021 11:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218508.378976; Fri, 29 Oct 2021 11:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgPgg-00048L-5L; Fri, 29 Oct 2021 11:04:42 +0000
Received: by outflank-mailman (input) for mailman id 218508;
 Fri, 29 Oct 2021 11:04:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slsI=PR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgPge-000485-5H
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 11:04:40 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c20d8c5a-88b6-4101-be31-9d7761d3ca68;
 Fri, 29 Oct 2021 11:04:37 +0000 (UTC)
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
X-Inumbo-ID: c20d8c5a-88b6-4101-be31-9d7761d3ca68
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635505477;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8GGuKprvlV/fRhiaW5ZpJ7fLCJim6s5Rur380aIpYvU=;
  b=Xf1pcNZyKRs0S+aUv7vo0lWpgAGAtpuaeDvx4dZ5RCAxfksu7alwQ1m1
   YVI3BGb52COfEEv08HNM0fKe3rCKtkdP12rEx5mQM1Fgp3OF9rgtE7AJm
   x1z7rUYS9WeFk2I+fTs5gDTXnzuvGNwM+LZ2TTTq4+S55bmGPcMJgjkNU
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Ose0NfwTPiRvjnyOJZM0BHFppAlkQfbtbXHRBOwuMOvvgVslMwrA8uC1zrxNzMC3Cp8qWBi4Iy
 wD22FaOuSXfFsxfcvx0ZZxaLdqIQrf+iNA9QnoSztYZAbrlUj5pO41kyFk8rI3vtC+0ZOsgFpi
 CqIMMg4Fca8aMcxZdOvAM6yyRRMfi+PL3Czqt8Oq3q/hU3hXjmNJn/oV7j245/hLmS497RlO0B
 zNMUwfMVk3miyWzsjWdWJJZboFPDj2UyH/No349/n04ivxdGr4Lcxcgbwrpq5r6CHJlcJ6pJW6
 PjXuzS2sUfGKX77piruTeJpL
X-SBRS: 5.1
X-MesageID: 56188328
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t0DtQKJTA+R1kof9FE+RjZMlxSXFcZb7ZxGr2PjKsXjdYENS0DZUz
 zAcDzzQbvmON2fye48iPNywpx8Cu8fdz4MwTVZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eo5yrZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2ogOJ0+
 olPlqWUUAd2G6DUt+0RahVXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsF2gcsuNo/zNZ43sXB81zDJS/0hRPgvRo2Xu4YIjGxq1qiiG97FX
 9E6YhxkXC/iegJwME4sL8hvsL+R0yyXnzpw9wvO+PtfD3Lo5AB4zrXFKtfefd2OA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlqtme3njS79QJgVFrCz6rhtmlL77lIUDBoaRF6qu86Tg0S1W89cA
 0EM8y9opq83nGSwVcX0VRC8pH+CvzYfVsBWHul87xuCooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcGRwYY59jooKkokwnCCN1kFcadkdndCTz2h
 TeQo0ADa6471JBRkf/hpBae3mzq9sOhohMJChv/f32X6zElZq2cQ5Wotn3W9dlJIL+VQQzU1
 JQboPS24OcLBJCLsSWCRuQRAb2kj8q43C3gbU1HRMZ5qWz8k5K3VcUJumsmfRY2WioRUWaxO
 Be7hO9H2HNE0JJGh4dMaIWtF99i86HkEdn0Phw/RosTOsYvHONrEScHWKJx44wPuBRz+U3cE
 c3CGSpJMZr8If46pNZRb7xEuYLHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyLq
 IsDa5XXlkUGCLeWjszrHWg7dw1iwZ8TXsmeliCqXrTbfloO9J8JUqe5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3RAk2PnIjHBM4lxVpiZHREFQ/xhxALPNb+hI9CJsBfVeR2q4ReIQtcE
 qBtlzOoWa8UFFwqOl01MPHAkWCVXE/621PRZnD1MGRXklwJb1Whx+IItzDHrUEmJiG2qdE/s
 /un0AbaSoAEXANsEIDdb/fH8r97lSF1dDtaUxSaL99NVl/r9YQ2eSX9guVue5MHKAnZxyvc3
 AGTWE9Kqe7Iqo4z0d/ImaHb8Nv5T7ogRhJXTzvB8LK7FSjG5W7/k4VOZ/mFIGLGX2Tu9aT8O
 egMl6PgMOcKlUphupZnF+o51ro34tbi/ucIzgltEHjRQU6sD7dsfiuP0cVV7/Ufzb5FowqmH
 EmI/4ACa7mOPcrkFn8XJRYkMbvfha1FxGGK4K1sckvg5SJx8L6WamloPkGB2H5HMb94EII52
 uN96sQY3BOy10gxOdGcgyEKq2nVdi4cU78qv40xCZPwjlZ50UlLZJHRB3Ok4JyLbNkQYEAmL
 iXN2fjHjrVYgEHDb2AyBT7G2u8E3cYCvxVDzVkjIVWVm4Wa2q9rjUMJqTlnHB5Iyhhn0v5oP
 jk5PkJ4EqyC4jN0iZURRGurAQxAWEWU90GZJ4HlT4EFo51EjlDwEVA=
IronPort-HdrOrdr: A9a23:AyBKCKANHsyHsUzlHeg2sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHK9JfjJjVWPHlXgslbnnlE422gYytLrWd9dP4E/M
 323Ls5m9PsQwVcUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZvzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDj1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyEfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW92/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ghMCjl3ocUTbqmVQGagoE2q+bcG0jbXy32DXTqg/blkwS/xxtCvg8lLM92pAZ3yHtycegC2w
 3+CNUbqFh5dL5gUUtMPpZzfSKJMB25ffvtChPbHb21LtBNB5ryw6SHlIndotvaPqA18A==
X-IronPort-AV: E=Sophos;i="5.87,192,1631592000"; 
   d="scan'208";a="56188328"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3XdZ7sIXQPHZl6hDDL37RO9ZNyLYsR19IhofmM7GMN1U9Zwv8pDBeWm7oJESi/fwfkRIEpAZBWMnd9kj5l7aeFyYDKH5KWQO/0rFp7ZsmS6Nj29Z7NVwP41uSeIv8exAbwZSaDwfXMdvrNBF/acGM9EKblB73sNSUXlOg35vnPs18LJEdk0H5mpPX5CWB1UK5+jO3Etk06/nEUGwJ+zru6rfgka03vzIc3+RcooC2xwVIylp/aWLtf8r/VW7/XVkbs954QH4SAESOzOeurNyrrX/eS5gfChYv4dcnAgttF9mxvtUCK0f8IE5ftcQByU3EUVktk7kpQPQpIYF0P2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkmFxWAVPJ5VUqgBkfUGg8iQeZPlKe9heBr3gRjkk5I=;
 b=lfWDLr4VuVhFBuXarQqC5qnNEFQP3htlr1k9PYwvoEjYxd/os28QqsMfEshMNUqPb0TYNsv+YwOfz9FFCwEDCLAEgjiSzBXHoMFuswzATfalz+BSAVoPM1XqK9Xyz+c3XRrY5TOW5Gzxr7t5hwHw3vabwqe3MJeX2vlakP9JWGOCwo9mINEIvH4++rhCy4JgTtRyypiUHwxzE6kWUUY74+n+TqY/05IMqAXNIc63+r8ETqavPuc9M6UbhigdwlwXIW1hcJhzRjFTKNO5WJP/ygdSn1vP4Agy7ltX+X3WFb750tGw46tQr/eQ5mjF6qFtAOIyf6bXRnOjGFWx+8avhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkmFxWAVPJ5VUqgBkfUGg8iQeZPlKe9heBr3gRjkk5I=;
 b=u4ekk4ycZtmzwHLdEkMe4J0C67NBKU48DNbeFSx93Ka24X/gbIj8h1txJMW/q5WWageUIWmD2t2eRqXf268JkyGNCYT0t4ONV3eA35NjHrBlObEFf626OE5Lv+juH0M5u6bKCyC1c7xos6M6vJti8ZUgTUxN6x0a4SJhL0QzEWI=
Date: Fri, 29 Oct 2021 13:04:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian
 Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <YXvVN0cecMMPdgmh@Air-de-Roger>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <2e198e53-e3fb-4ea6-0c44-f326b5e5f5fc@xen.org>
 <YXvBz4OdpcmVRAGM@Air-de-Roger>
 <09995bd2-0924-74bf-508f-5692b3250532@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09995bd2-0924-74bf-508f-5692b3250532@xen.org>
X-ClientProxiedBy: PAZP264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fd::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d58301a2-118f-4f00-2005-08d99acbe08e
X-MS-TrafficTypeDiagnostic: DM4PR03MB6095:
X-Microsoft-Antispam-PRVS: <DM4PR03MB60957581E58C63FBFAC2794B8F879@DM4PR03MB6095.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SCSqA2tW3xiFUS4QH+EJktK8NLxvm/cPtgUp5J6BeEeo18o0CAJR0vSMfdjeCK89lBHrDcSElLv631qTZlMcNeaKHi9IJO/rvzo3H7RFLQdMquFXi68yjSnWVosPd43vJo4ZjdFtvS0pCyeMu2y9hVzQsWjGgOxzkU83veJaUB1lYIo2EjX5o1+ZQ/AxijIIN6IopVRWLSZREe5Toff3TzKh8YhiDD/ySojYhtK3b3uRYuGRpKAIErVYFN/QEyVYrYSGFrZwlfvB8a9gAMP9WpJl49aGhveDMQWGmqPNjSlTU0B6H+UwWZs5mCZegv/cftF/JoBm7h7ppaKNqc1IR/CoR+Qhr3iVcQl97TxqaxhVYanb42Uv/nbN8mN6rK0obhBAuQp3CGuk6pZD5eT/Goodkl5hfKdl19x63skEpgI8RCQBGwPSGrnwakXYdz01pqQEFMhmfBVy3CbMldh8yzmYz+QXy+kA7kFyV+wEtwtMTVTcAJzslCHJ/57tjMid2oB1G8YQYRlB814gnk/BcQjRHY2Fbfewgnok1vBNMWntkVk6mcePkNgLmarSBytl3DzEb8y/Tlf98keA1LlTD4zhKI4jmTuOSGd6gnUIRhpbBOoN4xZnTbr9lr9vuOYfJDc7nJ79lheZEt+Feivfzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(4326008)(316002)(2906002)(86362001)(6916009)(85182001)(83380400001)(82960400001)(956004)(508600001)(54906003)(6666004)(8936002)(66946007)(6496006)(8676002)(53546011)(26005)(66556008)(66476007)(33716001)(38100700002)(5660300002)(9686003)(6486002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXdyYlpyakNqOGNUTzJueWZuRUw4cjNBalFFYnRoL3FQc09PemxYa3BuNWZo?=
 =?utf-8?B?eW5yZ1U0Z2I5MDNkbE84ZG9YanJPK3kzL1pEMGpGUUphRWliT1M4VEgzeit1?=
 =?utf-8?B?QzMxdjlicHN2alg3OU5GTFlVYUdvNEI1bnpOc2Z2N2JpbHRva2VpY0xERHM3?=
 =?utf-8?B?U2xWemI3cWFkalRpcURVNVdMdllWYUJQTUdFaS9RYWw2TDFySXFMWERNbkR6?=
 =?utf-8?B?Zk1mbmNCQXF1NWkzcTZ4Z1hBRGx6TGlIRjU4cGYrSTZDazM3bWgwemFZbXNS?=
 =?utf-8?B?VjkyOEU0RFF5REVjWUw4QTZmcEQrRzZtcXo0SFdYc0ZiQkVhdHIxM3JqSUJS?=
 =?utf-8?B?QlhaYmJ2WlNONG9oRWNzVEZub2FaVlNqRGdCVTlRSnk5Wm5HRERNQ3pXTitG?=
 =?utf-8?B?L3ZwTHNIS3BHanpDQ0NCcldmUmlzQWZrVFFobGkrVDZlRkRZQTUwWS9ndFJH?=
 =?utf-8?B?cUgycDQ1cHRWdXpIbVNHTDFjRjB2RkhDaUdJZHVkdUJGOFN6aEh5M1Z5VE1W?=
 =?utf-8?B?SVpQWFN6dEViQ1lkTzArQkhFTU5mMEhwcWE4YTJQcGE1ejYzeDhISjFQMDNP?=
 =?utf-8?B?U1ExMHEyd3E1SUlHVHp4VHpjRnVidU5rQWNOYTl0MXE2cUtVQVBObUFQVzNS?=
 =?utf-8?B?elJHRkxpN2dHQk8wMC8xZkdsSUR1NXJtRVFvOElJelgwYzVVTDRyTUxjM2Z0?=
 =?utf-8?B?S3ZHMHllaS9GelFqS0lpNzY2Mll2YjdqeUxPTk11Qzh5MUpJbVcxbkNPQUJJ?=
 =?utf-8?B?dEIwaTVNOWNVNkdPdkIwK1p4RkNiZW1YcktncnNYazUvR1RJd3B2NDdkQkt5?=
 =?utf-8?B?V29QM1JuQ2JPaWNxNVFPVEw4b1IxVUU3Z0NIRnVMckJMWk56TjVHS1ZkbFF1?=
 =?utf-8?B?SnVLKzhFSTBPTlRWRWduVGo1bVFwT2VTVGtRUVQvb095RmN6aTFobEt0bDVR?=
 =?utf-8?B?SGQ2eVBLNm9zbERIeHE4ZHZyM1p4T0F3MGRBVGhGUHZnb0pTamc2YUZwTi9N?=
 =?utf-8?B?NHRXd2RVTkJUcWVkRURnRUtMY04wNTNka1BhUFlpM0MrbUpHMkhnVkpDdzBt?=
 =?utf-8?B?S0taMEpBYTlPbkdnK3lMTy9zblJUY040b0lLSGFsYUZMLy9nOGdwWGV1Lyt2?=
 =?utf-8?B?UXFSMGRuWE4wanN6djZ1TkJubkQ4VTFPb0ZlOGkvek9OWER1eDNMa1Z4eVRr?=
 =?utf-8?B?a3VIa0kxRzh2V3hBWjBUMjRWcnFVVEhDNjE2Z0lPbEdJUDNZaDVwS1FTVEtS?=
 =?utf-8?B?WkwxSWJ0THRRMFQ3UDZJNnpoaVRCU3JZR2FCQWRhbXBYVzNDY2ZOZnpIODhK?=
 =?utf-8?B?Nnh5YkUyNWkzd3JUVzJOMWVNMWR1SVBnZ0F1cXFmR1JMZU1CQU02OUx4bDVL?=
 =?utf-8?B?SXFZamxoSHhqUmJsT3dnZXYydVY5bXZ4ZGxuSEtPSDJSSmN1VkRVb3hXYURv?=
 =?utf-8?B?SDdOaUN0K2ZyVFFVenJnakFkZGkxMlo5MnFyMmd2U1VUTFhodGZzbW9zUUZs?=
 =?utf-8?B?RG5idlovajJDNjdvWmUrS2FrMFVvaC83TzUwSjA2L1pUTk9YalZWM0ZEeXNx?=
 =?utf-8?B?dm00a2ZVR2dLOFRxdFVFUEZXTFR5b3lkbWNKMlQrRlc5bFd5cWFxTXlDMWUv?=
 =?utf-8?B?OE53a0FqclNFL1I5MkZEV1JxUzZ3elFFSmFvK0dwK3V3TllmWU1YVDl5cE1D?=
 =?utf-8?B?bHJXWUxYVWw2MXV2MnNJL1AxMFY4SFpmUDNQQXcvSzJXditQRkxaU25CWGky?=
 =?utf-8?B?OHd0NHBEY0dyRDB5d1lSbExjeEZzaGZTYVQ1M1JLVTBiQ2lhUzBrUHROaC8r?=
 =?utf-8?B?aGVlK2I0OW91TGhJRkprQkl5dmlRL21aTnlKM0hBcjl1d0Z4RzNXZmY4QWcv?=
 =?utf-8?B?MzNxTnJNMXhwaGhPVktTM3RTWUJpUG5SNHRYRkN3VG5sU0pCWU9Xa2xwT01k?=
 =?utf-8?B?ZjlyU1R1ZndSR29OeDIzUmg0Tjg4b01RaW9NS3dDVk5MdTJ0N1gzalpaQTBo?=
 =?utf-8?B?bnUrMVhXVnQ4UU5Yc2ZCbnBjZUdsN1c2UWloeVVzR25nbm13RDNpSVBZTitC?=
 =?utf-8?B?aWhldndhOEszZnQwZHN3b3dvM29yZnFoUktLbURodUxqUXBLTHhyc24wWDhX?=
 =?utf-8?B?UE4zVFd3a0dmTlk0MnFNL1I4VEpZN2w4eHA2dUlxZ2VPbjVNQ0wxR00vM25k?=
 =?utf-8?Q?pFGxOhcbJ7rCQsMtnpikrrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d58301a2-118f-4f00-2005-08d99acbe08e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 11:04:28.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT++WdQOwIAERWq5izK09KT1s2coTFMe+abxPrlggjxR/+UPefuhZ71K916EnzhQ/jeY96TAKPaYbT7o6k7zvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6095
X-OriginatorOrg: citrix.com

Hello,

On Fri, Oct 29, 2021 at 11:01:29AM +0100, Julien Grall wrote:
> 
> 
> On 29/10/2021 10:41, Roger Pau Monné wrote:
> > On Fri, Oct 29, 2021 at 09:58:55AM +0100, Julien Grall wrote:
> > > Hi Roger,
> Hi Roger,
> 
> > > On 29/10/2021 08:59, Roger Pau Monne wrote:
> > > > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> > > > index e510395d08..f94f0f272c 100644
> > > > --- a/xen/common/grant_table.c
> > > > +++ b/xen/common/grant_table.c
> > > > @@ -53,6 +53,7 @@ struct grant_table {
> > > >        percpu_rwlock_t       lock;
> > > >        /* Lock protecting the maptrack limit */
> > > >        spinlock_t            maptrack_lock;
> > > > +    unsigned int          max_version;
> > > >        /*
> > > >         * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
> > > >         * values are invalid.
> > > > @@ -1917,11 +1918,33 @@ active_alloc_failed:
> > > >    }
> > > >    int grant_table_init(struct domain *d, int max_grant_frames,
> > > > -                     int max_maptrack_frames)
> > > > +                     int max_maptrack_frames, unsigned int options)
> > > >    {
> > > >        struct grant_table *gt;
> > > > +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> > > >        int ret = -ENOMEM;
> > > > +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> > > > +        max_grant_version = opt_gnttab_max_version;
> > > > +    if ( !max_grant_version )
> > > > +    {
> > > > +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> > > > +                d);
> > > > +        return -EINVAL;
> > > > +    }
> > > > +    if ( max_grant_version > opt_gnttab_max_version )
> > > > +    {
> > > > +        dprintk(XENLOG_INFO,
> > > > +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> > > > +                d, max_grant_version, opt_gnttab_max_version);
> > > > +        return -EINVAL;
> > > > +    }
> > > > +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> > > 
> > >  From my understanding, the limit for the grant table v1 is based on the page
> > > granularity used and the size of the fields.
> > > 
> > > So the limit you add is valid for 4KB but not 16KB/64KB. Therefore, I think
> > > it would be better to use:
> > > 
> > > 'max_page >= (1U << 32)'
> > 
> > I'm slightly confused. Isn't Xen always using a 4KB page granularity,
> 
> Yes. We only support 4KB today. But most of Xen is agnostic to the page
> granularity. I have actually started to look to allow 64KB/16KB page
> granularity for Xen on Arm in my spare time.
> 
> > and that also applies to the grant table entries?
> The page granularity for the hypercall interface is whatever the page
> granularity Xen is using. So...

I've somehow assumed that the current hypercall ABI was strictly tied
to 4KB pages, as that's for example already hardcoded in Linux
as XEN_PAGE_SIZE.

> > 
> > I don't think it's possible to use correctly use a 16KB or 64KB page
> > as an entry for the grant table, as Xen assumes those to always be 4KB
> > based.
> 
> ... if you build Xen with 16KB, then the grant table entries will be using
> 16KB.
> 
> So I would like to avoid making the assumption that we are always using 4KB.
> That said, the worse that can happen is a spurious message. So this is more
> to get an accurate check.

I don't have strong objections to using max_page >> 32, it might even
be clearer than checking against TB(16).

It's just that the check would be wrong if we allow Xen itself to use
a different page size than the one used by the grant table interface
to the guest.

> > 
> > > Furthermore, it would add a comment explaining where this limit comes from.
> > > 
> > > Lastly, did you check the compiler wouldn't throw an error on arm32?
> > 
> > I've tested a previous version (v2), but not this one. I assume it
> > doesn't build?
> 
> I haven't tried. But I remember in the past seen report for always
> true/false check. Maybe that was just on coverity?

Hm, possibly. It seems like debian-unstable arm32 gcc is building OK,
but I've got no idea if different compiler versions could complain.

Thanks, Roger.

