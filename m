Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422E4EBE97
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:22:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296209.504158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVSc-0002ob-C9; Wed, 30 Mar 2022 10:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296209.504158; Wed, 30 Mar 2022 10:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVSc-0002lt-8i; Wed, 30 Mar 2022 10:21:54 +0000
Received: by outflank-mailman (input) for mailman id 296209;
 Wed, 30 Mar 2022 10:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ0c=UJ=citrix.com=prvs=08136f46d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZVSa-0002ln-Qk
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:21:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35eddb9e-b013-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 12:21:51 +0200 (CEST)
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
X-Inumbo-ID: 35eddb9e-b013-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648635711;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3ZDWJS0J58z/gJjr6hAsHu6lpYZcEoDOLVNt7kl+IqU=;
  b=HkNBtPr6L0oMIeJTJKWcRwJgRrWc9S88uxZWDY20BU6rh5E0hWlMwOXs
   spZjzOx388oucpLMM2aUcie2ZVOJJt3TnaAw1zMY2Qc/MpORYVaHHl/9H
   vRPxR3rEb6Che98C2UvyiOROC0Z4cyF6FjWRIrDXNxmqjgIsgRQczUPbP
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66966293
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QGCM7a7evOS8E5jBpSGh2gxRtATHchMFZxGqfqrLsTDasY5as4F+v
 jNND2uCPa7bZjOhedx+b9nlpkIDsZbWnYUwS1Y4rH1mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPiW1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurStey0kN7zvtN87QkR+ORBvPvVF9afIdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ6eAO
 ZBIMlKDajzOaBkSZV0OA64cge2Bu0jALxtF8E+K8P9fD2/7k1UqjemF3MDuUt6XQcRYmG6Iq
 2SA+H72ajkBL8CWwzeB9nOqh8fMkDn9VYZUE6e3ntZ1hHWDy2pVDwcZPXO5q/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWIe1iQ/6a3gQiUKHUzB14TZncHQBMKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWW0bb1HRcBJG9GRF5iLJ9o4DNZWfhoBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66IPoceOMErLFXfoEmCgHJ8OUi3yiDAdollZ
 P+mnTuEVy5GWcyLMhLoLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtazOzghQCxPrc+m39q
 o8HX+PTkkk3eLCuM0H/rN9IRXhXfCdTOHwDg5EOHgJ1ClE9Qz9J5j646e5JRrGJaIwIz7+Rp
 SvsAxUwJZiWrSSvFDhmo0tLMdvHdZ1+sWg6LWorO1Op0GIkeoGh8OEUcJ5fQFXt3LULISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:kIDg1KN78/xee8BcTgWjsMiBIKoaSvp037BZ7TEKdfU1SL3gqy
 nApoV+6faZslcssTQb6LK90cq7MBXhHPxOkO4s1N6ZNWGMhILrFvAA0WKI+UyEJ8SKzJ8n6U
 4PSchD4IKZNzdHZdGW2mSFOudl5PSs35qpi/33wnpgQGhRGtxdB6MSMGim+zVNNXF77TtTLv
 ahz/sCnSOpfTAvdcKwCmMeU+Wrnbf2qK4=
X-IronPort-AV: E=Sophos;i="5.90,222,1643691600"; 
   d="scan'208";a="66966293"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evSvxFuwi/uB90GdzrR7g7WGwFuVmNdTGWUvKjPhtr4oCKE+l0p9db432s1zP9umvvKUnhppH6P9oQR3/79s3breRwmmWHKW6DEsLPfKF32YJLYOHeH/twLaq8OTvqyawHhvUtaxjt2l9nxxqssej8g/Rc2N2F8KOGzA5fNscbUh1zDY+r4zLv6kbKR+7AzWfuNkCe7nC+6PLX+v8Qo0RIKQ2bv4N05Cn1zZKtXn9QyzCtNej1wDXxeaIO8/1VEVH5Dj0FBqxHPnfOaBlM39moZ7CQCFBDFsTn1/g21ZI9ex3ywNHsTIKuC4tssnNgZJBJbz7fyLH5t6z0cGRqKazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3zJ+G2N482nbFETHG8zLPVpn0gXvfSjvMLnJRlVqrZE=;
 b=lun6qe25Lv/KS7a0LspLruK1rnPe5Pyglod0Y/4Z4cV/pkMR5l5IwQ+cE/AQ376XlxzsK7aQNCjMDdmEqAX/OqWoEdij0OKSQTj/OdgBNQFjC+BW8GSuwJS8b9MDIWFyc272SmIJGlwo7pGf4E6z0R9SKIjyJ19N7cnPqwIBhP4griyNtoxU3ue5tXBU6XFaPIzs3i65eRPLI6YWyHapKkp26mjLrDQYjfFGTuTestd494dwmZvYKaCGJCuekLghzafv/3w7Hw3mrJddCn484SBr8jlkjUpruCMDHa2IeCtfCA6VsGAobiGXnAN8hF8Ge4cJYjLMtBN1e/fT9ys59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zJ+G2N482nbFETHG8zLPVpn0gXvfSjvMLnJRlVqrZE=;
 b=xQghCkNXzi9l3Lxq10gn0Q+SqC8zH7hRSKhwG7kXlQFOF8rwq8NZJlEBdxhCMkKrFUvN5z8krsMMOl96QL+EU85VEucEJBaFx7Usgo0iVOlLNVc7byi+WaRbzFaZnTT/ctnjvupcKMtYuz5DXaqrFThY4+a9upt+UtKhfolY71s=
Date: Wed, 30 Mar 2022 12:21:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 0/3] retpoline: add clang support + Kconfig selectable
Message-ID: <YkQvNR8uVQT4jiqP@Air-de-Roger>
References: <20220218143416.34475-1-roger.pau@citrix.com>
 <9500afea-3ca0-deb9-9d48-4983454b1c4f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9500afea-3ca0-deb9-9d48-4983454b1c4f@citrix.com>
X-ClientProxiedBy: LO4P123CA0465.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f0e3e3a-3543-4f40-ecb0-08da1237182d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4583:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB458388717AB02834847A539C8F1F9@BYAPR03MB4583.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z/FaOouXQfYQN0pS9haMeM6817/qBJTBCNDqhjC+YGMtjyZ21sFGfxrb0kVVkX25lJ1cz1zqeAPl6H1CNAGQcZOiPsuur3D+mooCIoVObf8HmgGsIQQX2RWF0P3os3razy57n9N6z0ya5x45S31YiP0P+D/5eiw1TyQSs0GH3yAUfBtZt2uT2YUhKqmxShxziib3DaQHaChslll8CSeOlCRqlVi6PJJ5qf3VTZW5kSxDMlSGJgx6obFHcAV8AmP8dNvylCydtg0HvHJMGL+u9u8HIo3R7na2Y4PkJAuLkRWncS3AOQLJFGmBxHTV5LJtnlhOMWaj7e8FgG/ZO37D/9oiyFb163fadJzV6pF2egirDUbY+zexQycycRLh/k6VhM3jEMECmoz+47ggzI/RhixLQ7s1fLARsGkQkas8+bqCZQ5mqcF+fn34UMAMdU4Q1YtAinJzTdhzmALuHEnX5x1ZE2NWnShyK4XLhnq0/F69p2hzzqrwVFuLUVezxXFIo5ZZ2dMlObzeXx8g4droT+nTG+9K/xBuQ79ncMON8zTdPxPr2Pfmkt0Esyzt2MTbw4lfHVa4npjPUWtwj91qssaKNcyWUNd9rNlK1aL0urkM1DOgZQlz3qKO8lrGPJy+ynpq+DjRCJXHayfHBPaU2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(86362001)(2906002)(9686003)(6512007)(6666004)(53546011)(66556008)(66476007)(8676002)(4326008)(85182001)(316002)(33716001)(66946007)(6916009)(54906003)(6506007)(5660300002)(508600001)(82960400001)(6486002)(4744005)(26005)(8936002)(186003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3MxRGxCb0Y2Mk0rNXN0aUR3dHJsR3VKM2lkN2hJLzNIZkpiZnpUeVF3dldw?=
 =?utf-8?B?dXAzT3lDMTRXTXJ4cHgyTXUzYlZLTWRHMWVLZGlGQmhlWjlBMFNCT1RrK1oz?=
 =?utf-8?B?dDh3aDBHZEUyNUhQa2ttb1NTODM0Q1RWQ0sxMTY2eUswK2dCcGJLSm5sUHZ4?=
 =?utf-8?B?czgvaXE0UHRUbUFzakl1cjlCOTdHWldGbXdaajVsU3Y3U0cyakFQNTdxSWoy?=
 =?utf-8?B?dFoxSmE5ZnovaFJpUkNNcDU4cEcvSlBhNEFuV1NrVWsrVjBWanRaY05mWFpG?=
 =?utf-8?B?SHpnZm9wNWdjK2NZejdKVkhVanV5YVRVVWpTVnpieGMva1l4Z3dwZ1VRMHNv?=
 =?utf-8?B?QkN1eFNSanh2MmI4RHgzR3FocHJoTHdwYitLNnd5SXpMQVhpN1kxaDhSdEVB?=
 =?utf-8?B?dWRxYnlqQ2hpOUZuM0xWVVhNZEkwNnFoZXJrUmJxTllHekdGQ1hXOHRIYjEv?=
 =?utf-8?B?NGtFQ0xkcERhZTJJV3JPRDBZSEFMRmR2ditDNDUwWUkrZkgyWUJKekNLdkNv?=
 =?utf-8?B?YXF6WUtZR2RmR2ZpSDB0TmJuNUhlVmxUTjNlVGJTVmdaR3NXNFJaZk9LcEo1?=
 =?utf-8?B?eWRtNnJ1OWttcFM3clR1a25NdFVSOVhpdWI2ZU9ndm52WUxCVDA4citPMFow?=
 =?utf-8?B?V3dCMW5oV2FscGdhTXVNVXo0WW9WMk11cFowTFk2RldGR3Awb3lNdWIvSWZ2?=
 =?utf-8?B?YjZKRDBiQkZvWnZtR3ZVZ1NDbUZBeHFjRkozbTlFUU8xejdXTktZdGtVOHQw?=
 =?utf-8?B?WEhpVDFvdklyaUt4NUpqQnNua2trbjNNYk04VUNNbmx2RktaS3didHJqYnlX?=
 =?utf-8?B?c3ZPbUh5K0Q2UmcrOU9iZFBmVE9pTDJ3bE1qYVBnbmxqdHYyNkU5cUFYRW40?=
 =?utf-8?B?eU9MUDZMZTMyMVdBTlp6eDRBZ2htZmJLL21MOUFBaDFPVnFKQjNXNDJtL0lM?=
 =?utf-8?B?cXRFTlNIOHpzYjNGMkdsOWgyRUpYRE9VVUNBT2cyeDlkd1MxQnBXWW5qV3pk?=
 =?utf-8?B?MEN0Qkk4VzJXTEpjby9oZTZlcE16RHo2Y2dtcmpUbmRVQm9qTWFXaXNKdHBS?=
 =?utf-8?B?bEZVL0NQSy93Z1EvV3JyVUcwb29QWjJVSXVBNmxsY0k4ZnNmck1oRkd4TWdL?=
 =?utf-8?B?cHZXenlDVmMxdHlYa0MzSy8wbVd3SXJURzhDM3F5ZktUZG1MaGNsT2lieHVL?=
 =?utf-8?B?YzcydkEwOHNJZ09JUDVpVjJWd1V5VyswaHVLNUNGUkFwRTk1UFJ5c3ZVR1NC?=
 =?utf-8?B?VmdRdzA1bkRFb01yTWpGMWgrZGhkeHpSeEU2aDdaTHRKUHY4TUtWbmF4Wlht?=
 =?utf-8?B?YjVQL0grVnA5TGRqT1l5T05ZVUVIeERSaWlZVzRGb2xLdzAvYjlORjdwTzU3?=
 =?utf-8?B?NitacWdET2UwSnpUaHNqdXNxcnVOREdNdHZnSnNWY2FmemZkUGxBMEpmMk5v?=
 =?utf-8?B?UEo3SzZqZHBsbmh5N0ZyYUQzY3NaMW04NW5Fdk5yaFlDdWFVMGRaa0txVEpt?=
 =?utf-8?B?WEJ6SFd2dFQraXJ3WG1OcTVQb0JBSjRHRmQvai9GRFJsRWMxMk9JOXJ3N1do?=
 =?utf-8?B?djRadGNCTHRTdDF3M2dPZjlFU1ZHcTNUNVI0RHpoRjdPU1NGNGxoVVlsOTN3?=
 =?utf-8?B?OWZzVEFEdktLd3RUcjNLT3ZUQ0lFdjBWZHFDY0VuVlZQend6Q0xVYnRMNlNr?=
 =?utf-8?B?R0ppdVBzT1JaU1BCZ0kxdzNteWUyTkJSVlR0VE5zVXpIRmV0TFBjYTJYSlVF?=
 =?utf-8?B?d1hyVms5V3U0TmlKL0xsVWMwOHV2cHhBUnR0K2FkaTRwWFZHR3UwcWZybkQv?=
 =?utf-8?B?VlQ4cmd6MTJZSmk1TnNEdzUrek9aOVdJVHBHbDB1SXN5SlMvaEFCaStPMWtF?=
 =?utf-8?B?Q29KbU1HdjU2RllZSkJ4TjFmWkFRUVVoMFJieVZqYklwd012TzFoSVdSZjVo?=
 =?utf-8?B?WkpsUC9tNG9UNGVHMXlHeXNrNi9jU1MzcG5mOUdhZ0Vaa1A2dUFxa1h5Q2t1?=
 =?utf-8?B?eS9mcmtqeW1lZWRaSU1ndzNzTTF1ZDUyODl0cU4rWWFsQ212MStLVTlpQTNw?=
 =?utf-8?B?eTVhdktEaE9pT0JlUGpBRXVQdlRnSDhzUGxKcjNUaTcxbXZsWmxtamR1V2th?=
 =?utf-8?B?SDRxcXJXa3lRN3cyOWVlektzSnJYbVFFM2NHejE1UW13WFVzMzlIUjg3bTA0?=
 =?utf-8?B?cVVCZTE4Mm9ZbHlvRzFnbS8wVURkME1xNlNqSUZST1I0RHM0S1VoT0x2YVFS?=
 =?utf-8?B?aFh1OERVVlNGbExUcjlETTNRWEg1Vkl3K3dabXBaT09MQnQ3NWtRL3NNMnZk?=
 =?utf-8?B?WG9wSG51RXZqY1h3RWFVWGE4OTJqUlM0bGcydDUxZzNhSkw2Y1JaY2k3bUs3?=
 =?utf-8?Q?8nRvwWqqIvJ6YP0s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0e3e3a-3543-4f40-ecb0-08da1237182d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 10:21:46.6697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFycYJ2tPqJA4EpoVEC1qe55ZYmDOpmjr3a9vaorS25nhrkHNzCSUCOrpUC1qRx4pZdk1Ay2GF4WNYf1PHWl7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4583
X-OriginatorOrg: citrix.com

On Fri, Feb 18, 2022 at 03:45:12PM +0000, Andrew Cooper wrote:
> On 18/02/2022 14:34, Roger Pau Monne wrote:
> > Hello,
> >
> > The following series adds retpoline support for clang builds, and also
> > allows the user to select whether to enable retpoline support at build
> > time via a new Kconfig option.
> >
> > I've tried adding a suitable description to the Kconfig option, but I'm
> > sure there's room for improvement.
> >
> > Thanks, Roger.
> >
> > Roger Pau Monne (3):
> >   x86/retpoline: split retpoline compiler support into separate option
> >   x86/clang: add retpoline support
> >   x86/Kconfig: introduce option to select retpoline usage
> 
> Thanks.  I think that's looking much better IMO.
> 
> One thing, we want CC_HAS_* for consistency.  I can fix this on commit.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Could the patches be backported to stable-4.16?

Thanks, Roger.

