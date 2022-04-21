Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5C50A60C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 18:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310346.527143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZtL-0004FX-1m; Thu, 21 Apr 2022 16:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310346.527143; Thu, 21 Apr 2022 16:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhZtK-0004Ca-Ts; Thu, 21 Apr 2022 16:42:50 +0000
Received: by outflank-mailman (input) for mailman id 310346;
 Thu, 21 Apr 2022 16:42:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5Hx=U7=citrix.com=prvs=10361b9f4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nhZtJ-0004CU-4g
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 16:42:49 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11d180be-c192-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 18:42:47 +0200 (CEST)
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 12:42:43 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN6PR03MB4096.namprd03.prod.outlook.com (2603:10b6:805:ba::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 16:42:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.014; Thu, 21 Apr 2022
 16:42:42 +0000
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
X-Inumbo-ID: 11d180be-c192-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650559366;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mBsW/ApJfYyBb1g98+1L1ledW7RTkyKYxJpQcL2Hxz0=;
  b=bsAHfJvzzN53r1NykMPuhaCN4ACbg+d183oZ2QCGwMbTXK5N2+Qdm2H5
   Els0AC/8+ikQmo7MvnDN6wu/zHQygPAiTf+R8Rv7anSBcnvV0wKA8kzwY
   hWJkk1i8An/OZqsAJGwmelyVP8d1BkDdq3oltFPI153AcveAod1odM8Og
   U=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 69652845
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:43ZKQKONA/zFn+7vrR3KlsFynXyQoLVcMsEvi/4bfWQNrUolhDAHz
 GZMDWDTbK6OYmr0L9AjboyxoBgA6JSDydRqHAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2Ncw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 vpDh7+XSRYQZqjBiegbWAZjVCVfMvgTkFPHCSDXXc276WTjKiOp5so0SUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HNaaG/uiCdxwhV/cguhnG/rEa
 tVfQj1odBnaODVEO0sNCYJ4l+Ct7pX6W2MJ9g/P9fZqi4TV5FFrzYHdc/WIQPzJH/9PpnbIo
 32dr12sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQpXeFulsZRIBWGuhjsAWVkPOMvUCeG3QOSSNHZJo+rsgqSDc21
 1iP2dT0GThot77TQnWYnluJkQ6P1eEuBTdqTUc5ocEtubEPfKlbYsrzc+te
IronPort-HdrOrdr: A9a23:6dThqq9fRvjcoGThHMNuk+GBdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZtFnaQFrbX5To3SJjUO31HYY72KjLGSjgEIfheTygcz79
 YGT0ETMrzN5B1B/L7HCWqDYpgdKbu8gcaVbI7lph8DIz2CKZsQljuRYTzrcHGeMTM2YabRY6
 Dsg/avyQDBRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmREXeR
 730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCKlaDPY0LDErXQBeot8bMtiA2XkAwBLhqAC7I
 tbm22erJZZFhXGgWD04MXJTQhjkg6urWMlivN7tQ0WbWIyUs4mkWUkxjIdLH7AJlOJ1Kk3VO
 11SM3M7vdfdl2XK3jfo2l02dSpGnA+BA2PTEQOstGcl2E+pgEy82IIgMgE2nsQ/pM0TJdJo+
 zCL6RzjblLCssbd7h0CusNSda+TmbNXRXPOmSPJkmPLtBNB1vd75rspLkl7uCjf5IFiJM0hZ
 TaSVtd8XU/fkr/YPf+q6GjMiq9NFlVcQ6duv22vaIJy4EUbICbQhGrWRQpj9aqpekZD4nSR+
 uzUagmdsPeEQ==
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69652845"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeKV3VigGAfCaNJ3KcVVlK2+jpL3cIfQ7g/AVU91oBursOtYetqT6nkUFbJL4iJ+CT0Zi/02TNz+c5jP9M006MdXebWS91vvmVtcHkUv1mOcOtEteMNhyiBXA8PWwXr2ouiGxtWLFzoDYstFO4KbWrHGOXb66u8xMbMuMAe9JmVUHHk36h8Pt4uHe0oSPyNRFtIgc5pyb3KbQ0aBnr+siKtJXE5wEGwYxXQHHfnRKNPRM+xDYT5dhsm0B4+Y7j3J9HavhoOVAhAozLt2L2F8FCVU8KdJtK6ceTSIAVdCMvpzZfvXd1xm3alN5zyzM1OBbW4c0VeL7vuE0Ob7de+YpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBsW/ApJfYyBb1g98+1L1ledW7RTkyKYxJpQcL2Hxz0=;
 b=mgLALSQs0GfZPpR+Eg2I5+dtfJZmwxcmJIHVCvIj86oCDblNy4d5/n7hSW24JXn5oXFduTguBfZUJPLkNwORVTbq59pJjp9useWXu9K1r7b4sUywJEVnH/7PEd8lt0lunm9wA+lW8YzSLmwlN/Nrbb+3ay6xawiB0vQ1GWKJ3ezfTeE6zmlxukIPYzFyXpR7NOWjJCNMlE/fKJAcl2UCfEc6V9juBnCRcH8l+G831QyW6stNf52dpG+h5jJRG/XBpOX8U0LvTbjrLleAP+8gjNmkAD7PI/B3lRqbY2OeuxAHL8lWJ47KslMYcqL9YOfv/q/G0bL14A11ne29AaaifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBsW/ApJfYyBb1g98+1L1ledW7RTkyKYxJpQcL2Hxz0=;
 b=Ew8yQBf+KGcWEAJMFIxoqDS+whodgmQEJZQIj70rek6m0HDZQ81IUztsPtUPj8/Ihr7R+YksM0yraN/X6vJ2DbicFOWRhcKUY1l5h/JjV81pH3ezqGMNlQ7tm22NNOYITz4wJtu255rwws+a5SfJ1YaFLeUj6iXeGI89WfNbC/Q=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Anthony Perard <anthony.perard@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/build: Fix MAP rule when called in isolation
Thread-Topic: [PATCH] xen/build: Fix MAP rule when called in isolation
Thread-Index: AQHYVZkIemPHAQupqUK7B7t6KIAc2Kz6iS6AgAAJQoA=
Date: Thu, 21 Apr 2022 16:42:42 +0000
Message-ID: <e563c62a-622c-15dd-34f7-57997132649d@citrix.com>
References: <20220421160039.24564-1-andrew.cooper3@citrix.com>
 <b03098dd-7fd4-ed91-cc94-35fd24c46126@suse.com>
In-Reply-To: <b03098dd-7fd4-ed91-cc94-35fd24c46126@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82355762-3584-46cd-3902-08da23b5f44e
x-ms-traffictypediagnostic: SN6PR03MB4096:EE_
x-microsoft-antispam-prvs:
 <SN6PR03MB4096D3110A5798E854897549BAF49@SN6PR03MB4096.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nENlTEo351euw5YexUAWO3BiJLVf7h/QUaXUHwNaL8cwqGN7AqMRwOjNKFxQL8AmiLszWeA2/qV1L8cM+DJVoBj9TzMnreTvFraLymEojKf/gXpddahoKcXhyUPwm9W9p8eYxS0CrAXAKCHN5laXyibNtLrEMqJwfVmILkmToP0/XCvuQYzb+QKTcXXPUl9TpCrHUggxpLZW3pnM2m00T1W1bNWbqtBkTeCQmstBHQDJVWPcQ3CihBU5b3uPFP1KCll09xPO3/dtZCmi4uBqwdmIJiov3MFhQYcegS0YAsUltzSaIeo4YmLR2m2TDkAIscgVs65CdKMWDIGOQhq4n5Y/X4ZFLV6xi34TcqAON1i0wOT4vLJzWp5uEtMUcCFCzcIMZ08EXkDz3a75mdpwRgAuiXVC/rjdbhG5+4b+8vRP6mAiKAj1QnawBGQmvAZEAC+WPLwZvMe7LL1ZV89zfUUDNFzCOXzYJ3rBdB14D3sEd1JnE/K2eHjKnkjUeSYCFr4IXxMqMf5BfjkaR1EzerXkdRB+zCzsuEG6Ya0lcfS9l8zOTsj7uCtgGJdE2TnKcOHa3kIZ3HhqfYwPQ0vjFMvuRkFN4+ERMX+cjqz3eh8GtNhHaSTNr5gu58sjc5a6HfJny9mldGrPyjEZi/BEsKoU3VOEPMDrjJu08LZ0uPyUh6Ti1x6RxhzsRfRcJqI8A+e5TTgo1MzGhLIzwaxF7OIq2UXvOwHcuOtBMrzGHgqrMJo+UKHz4gaS1e9BUHF0fUUQ8l+chRvi54zRvUuyLw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(36756003)(31696002)(66476007)(2906002)(8676002)(31686004)(6916009)(76116006)(4326008)(122000001)(66556008)(6486002)(26005)(54906003)(66946007)(82960400001)(316002)(64756008)(2616005)(6512007)(91956017)(53546011)(5660300002)(86362001)(83380400001)(508600001)(71200400001)(8936002)(38100700002)(38070700005)(6506007)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzdkcWU5NzdSSTFqS2dWTjViUU5LVlo2ei9uSlpGdG5RMm16ZU9BODltTlJk?=
 =?utf-8?B?QzhjWDhKY2pERDhuTDhzWnBIMmc1RDcvc0wrV3JvSFlHV05MTTZjR3VNTnRn?=
 =?utf-8?B?NFJYWStnRm1tcEtxRGdLVlZubEdXMzZvKzJSS3dkdDhhMW1TeEVNSU92eUNP?=
 =?utf-8?B?dVg1Q1laOER4MXZvTHFXS0ZDeVFPS3V1dVhlZTF6Y0d3VGI0Q0VCTWs3VEla?=
 =?utf-8?B?bVR0WUQwNnVUaHdZSzhmR25YWmk0Rk9nRkRLNTlMbVRURlFsc25NQm5Eb1lE?=
 =?utf-8?B?ZmxScUFuRWR0S2gyTEVpZnV4VENzRlZYRkpab01qZDM5dU1sQTlxM3JoM0gv?=
 =?utf-8?B?Q2hSS1JEcDJKY0ZsMXBhV0F0WFhzZzh4eEpiTjZ3NkNOMUpXMXZQU25tZ0dO?=
 =?utf-8?B?RFVYMmI0RjkzeFNaS3NmU2RlMlNUN1VUUVdIQ3pJaG83dWJWdWZaSkZwaXBj?=
 =?utf-8?B?UWMxM256Q1FtSGtBcjRMRlU4T3dKb1drOERIMjBMd2NweDdIUWFCZGZSV0tK?=
 =?utf-8?B?b2d4YmxySlRYMXA4d0NGenJkcmFOUWlocGw5RjMzRzFnc2Q3ZHFBeWRWekF0?=
 =?utf-8?B?YTExTythbmhKRnVkMXBNRE9MRVYwUytKeVBWOGZrQzRVUEpXbUtrSE52Y291?=
 =?utf-8?B?b09UTUlIRWZ3MWlOa1dXRUZDSWRxR0NUelFGL3VWSkFITGNKWWFVYlRTYzVJ?=
 =?utf-8?B?b1VWTXFXQUQ5bllIK0ZGeDBSb3FSSnVWM1F1QjNESmpZWHRQNFQ5Qk9ZK1By?=
 =?utf-8?B?b200YXdvcFJrK0QvckdIV09sNzFXRjRCMkZNcVJqdVBSMkozUXBhZVlxOWV1?=
 =?utf-8?B?a0h2OFMrQmNLSU01ZDF2TWltdGQrcnkrN0lMeW41RTVsdFBjelkrSkJuMXkw?=
 =?utf-8?B?OHdVeVo4YnNzNkNldHN2UUdiRlZQSmtDTi8zUndEbzQ2UmNoL2lFeXpnc3Iv?=
 =?utf-8?B?NVk3UFllQjZaWnZiUXBKdllwUFFDNHBEb25tdzdCL0RXM20xOUZuOEEyaXh0?=
 =?utf-8?B?M2NXU2I1aXY5blp5Ny92QSsxUXZLR3Z3M0QwOUJnZk9aMndQc1JSUlYrTnl4?=
 =?utf-8?B?RGw1cGV6ZTQ0UEFGbVl1NkU0K3ExZk5MRnNQVlRSc0FuSDNyQW92TjJETjdt?=
 =?utf-8?B?MzdPKzVINzE0WkZwNDhRLzIwbERrcXBDc1l1S3BUckxRQUVtUW5obnVQMzNo?=
 =?utf-8?B?L25lSHk3K2xnRjYrNjQ3RlljYjZ1emtEZTIvdTloVHc1eEMydldSVzZwNmUx?=
 =?utf-8?B?VUl6N29XV0tuQlJ5T1RzU2NCWnNnZjFkNEl3bTVOUytpZ2tneCtnYStUSlJu?=
 =?utf-8?B?dWMra21TSXlXTm1CNUR0UWtjM1NmdGp0MWxzYWxjNys3MUxQanYzNW5PSndC?=
 =?utf-8?B?NDErZTA2clFGL0dVUEdtYWxvR1JDdGE1SlVTKzljMEo4YnFUeWZyNklvamlL?=
 =?utf-8?B?b2ZGN1hoUm5VcDFoank3bnpwWjdVMmhGcVBMQUc3QXZEYlN6Q3I0K3dJL2Fn?=
 =?utf-8?B?dzU4MGRwUVhtWnhldmlsdUdQQmh2ZHk3OUxGUlhCN2ZNL2FTem52NlFTZ3pY?=
 =?utf-8?B?KytDNFBaVlNlanRyYmx4UkZTWGI5by9ySGxNaHc3czhBaVVWZjN5SVdFd2h4?=
 =?utf-8?B?NGc3T1VEdzV4dDFzYlp3NnRoSjF5ZmI3bTVtV2pJOVhtcGYyTkFwdk15NTR5?=
 =?utf-8?B?SndmR2Y4VHdOcnFxRXR2cUk2eEUxTG5FdVJ1VGRTc3VVU1EwaGkyTlNvellu?=
 =?utf-8?B?V0xCZGtlZmNoTkFIbEFFUGd5dDFDZWF0ajhaZXdxdFJGU0NSdjJqeXFTTzkz?=
 =?utf-8?B?SnA1ZFRLcXQwVW9LVU5Zc3ArRmZyUUNYaTBnMTF5YXlkRUUzUmNzYmQ0OEJQ?=
 =?utf-8?B?U3BKMjRPVjEwSHZpdmJ2aUg3NzZCY1lHUDZMN2ZnZUJQOTNuN3lTZUpSMisy?=
 =?utf-8?B?MTlkTi9GNlkyZCswVXBvUjZ5dTVEblJabjNiei9XZWJsNW56QlRPcXc5MHd6?=
 =?utf-8?B?cXFEaS8yODdpYkg5bkx0Y1BYcEpmakpjZFp0b0g5aFdFMkI5QjBoQ21keUNZ?=
 =?utf-8?B?d3R1aFlxdVJjdHNvV0Y4Q0doOFlaeHVUZTVJNnVxdWRoSVpTRUdvTWJuUzRa?=
 =?utf-8?B?Qnl0QmgzYThFZklrK3VRYmpPUTM4ekR5WUE4VFNmWUUrUWxlRVA3aTFxUXps?=
 =?utf-8?B?RE1PNVZ0MTdzOENBdjVrd3gwa0hvMVBrdHo1MnorbXlSQnJrVDJKVjB2bHU4?=
 =?utf-8?B?Z0xhKzB1ZGM2WjZNbm9jdVJFUHd4OFpYSjN3d0s2SUZCMXdSeUZYT3RzZzho?=
 =?utf-8?B?d21yallreXoxZytXSzhlZk9ldm5lNElYTllwUGZZOG1LUEg3OEkrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <93C468FCF6517D4ABD8B1DD0F469C30F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82355762-3584-46cd-3902-08da23b5f44e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 16:42:42.0853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdxTZCQrd8QbPrnEQ6iiP3kOpf4kKe1GQbgBYbJ4IU0oSxSNpOF69RUGvLcMbjMqlnPmV6nv/e05vUdjcUDWLIeU4H6ZauDa+29d3xz/pN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4096

T24gMjEvMDQvMjAyMiAxNzowOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDIxLjA0LjIwMjIg
MTg6MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBOb3cgdGhhdCBgbWFrZSBNQVBgIG1pZ2h0
IHJlYnVpbGQgJChUQVJHRVQpLCBpdCBuZWVkcyByZW1vdmluZyBmcm9tDQo+PiBuby1kb3QtY29u
ZmlnLXRhcmdldHMuDQo+IFdoaWNoIHJhaXNlcyB0aGUgcXVlc3Rpb24gd2hldGhlciB0aGUgTUFQ
IHRhcmdldCBvcmlnaW5hbGx5IHdhcw0KPiBtZWFudCB0byBiZSB1c2VkIG9ubHkgb24gYW4gYWxy
ZWFkeSBidWlsdCB0cmVlLCB3aGljaCB3b3VsZA0KPiBleHBsYWluIHRoZSBtaXNzaW5nIGRlcGVu
ZGVuY3kgdGhhdCB5b3UgYWRkZWQgaW4gdGhlIGVhcmxpZXINCj4gY29tbWl0Lg0KDQpJIGNhbid0
IGNvbW1lbnQgb24gdGhlIHByZXZpb3VzIGV4cGVjdGF0aW9uLCBidXQgdGhlIGZhY3QgeW91IGNv
dWxkbid0DQpwcmV2aW91c2x5IGRvIGBtYWtlIC1qNCBidWlsZCBNQVBgIHdhcyBzaW1wbHkgYnJv
a2VuLg0KDQpUaGVyZSBhcmUgYWxzbyBzZXZlcmFsIG90aGVyIGJyZWFrYWdlcyBpbiBYZW4ncyBi
dWlsZCBzeXN0ZW0gd2hpY2ggaXQNCnR1cm5zIG91dCBpcyBmb3JjaW5nIGFsbCBkb3duc3RyZWFt
cyB0byBib2RnZSBhcm91bmQgaW4gd2F5cyB0aGF0IHJhbmdlDQpmcm9tIGdyb3NzIHRvIGRhbmdl
cm91cywgYW5kIHdoaWNoIG5lZWQgZml4aW5nIGZvciBldmVyeW9uZSdzIGJlbmVmaXQuwqANCihF
bWFpbHMgd2lsbCBiZSBhcHBlYXJpbmcgZm9yIHRob3NlIHNob3J0bHkpDQoNClRoZSBjdXJyZW50
IGRlYnVnIHRhcmdldCAoanVzdCBydW5zIG9iamR1bXAgLWQpIGlzIHNpbWlsYXIgdG8gTUFQLA0K
ZXhjZXB0IEkgZG9uJ3QgZmluZCBpdCBhIGNyZWRpYmxlIHRhcmdldCB0byB1c2UgYW5kIHdhcyBw
bGFubmluZyB0bw0KZGVsZXRlIGl0Lg0KDQo+PiBPdGhlcndpc2UgdGhlIGJ1aWxkIGV2ZW50dWFs
bHkgZmFpbHMgd2l0aDoNCj4+DQo+PiAgICAgQ1BQICAgICBhcmNoL3g4Ni9hc20tbWFjcm9zLmkN
Cj4+ICAgYXJjaC94ODYvYXNtLW1hY3Jvcy5jOjE6MTA6IGZhdGFsIGVycm9yOiBhc20vYXNtLWRl
Zm5zLmg6IE5vIHN1Y2ggZmlsZSBvcg0KPj4gICBkaXJlY3RvcnkNCj4+ICAgICAgIDEgfCAjaW5j
bHVkZSA8YXNtL2FzbS1kZWZucy5oPg0KPj4gICAgICAgICB8ICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+DQo+IFdoeSB3b3VsZCB0aGlzIGJlPyBhc20vIGlzbid0IGEgc3ltbGluayBhbnltb3Jl
LCBzbyBzaG91bGQgYWx3YXlzDQo+IGV4aXN0LiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgYW4gZXJy
b3IgYWJvdXQgLmNvbmZpZyBvcg0KPiBhdXRvY29uZi5oIG5vdCBleGlzdGluZywgLi4uDQo+DQo+
PiBGaXhlczogZTFlNzIxOTgyMTNiICgieGVuL2J1aWxkOiBGaXggZGVwZW5kZW5jeSBmb3IgdGhl
IE1BUCBydWxlIikNCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+DQo+PiAtLS0NCj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+DQo+PiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
DQo+Pg0KPj4gQmFja3BvcnRpbmcgbm90ZXMuICBUaGUgb3JpZ2luYWwsIGUxZTcyMTk4MjEzYiwg
d2FudHMgYmFja3BvcnRpbmcgYXMgZmFyIGFzIHdlDQo+PiBjYW4gZ28uICBUaGlzIHBhdGNoIGlz
IG9ubHkgcmVsZXZhbnQgZnJvbSA2YzEyMmQzOTg0YTVlIG9ud2FyZHMsIHNvIDQuMTQsDQo+PiB3
aGljaCBpcyB3aHkgbXkgbWFpbiBkZXZlbG9waW5nL3Rlc3Rpbmcgb24gNC4xMyBkaWRuJ3Qgc3Bv
dCBpdC4NCj4gLi4uIGFuZCB0aGUgY29tbWl0IHlvdSByZWZlcmVuY2Ugc2VlbXMgdG8gc3VwcG9y
dCB0aGF0IGV4cGVjdGF0aW9uLg0KDQpJIGhhdmVuJ3Qgc3BlbnQgdmVyeSBsb25nIGludmVzdGln
YXRpbmcgZXhhY3RseSBob3cgaXQgYnJlYWtzLsKgIEkgZG9uJ3QNCnRoaW5rIGl0J3MgaW1wb3J0
YW50LCBiZWNhdXNlIHRoZSBwdXJwb3NlIG9mIG5vLWRvdC1jb25maWctdGFyZ2V0cyBpcyB0bw0K
c2tpcCBsYXJnZSBzd2F0aGVzIG9mIHRoZSBsb2dpYy4NCg0KfkFuZHJldw0K

