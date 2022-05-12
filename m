Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97C5257C6
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 00:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328006.550903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npHIz-00042b-Bf; Thu, 12 May 2022 22:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328006.550903; Thu, 12 May 2022 22:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npHIz-0003ze-8Y; Thu, 12 May 2022 22:29:09 +0000
Received: by outflank-mailman (input) for mailman id 328006;
 Thu, 12 May 2022 22:29:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oUmD=VU=citrix.com=prvs=124635f48=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1npHIx-0003zY-Cl
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 22:29:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed2f22b3-d242-11ec-a406-831a346695d4;
 Fri, 13 May 2022 00:29:05 +0200 (CEST)
Received: from mail-dm6nam08lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 May 2022 18:29:02 -0400
Received: from PH0PR03MB5669.namprd03.prod.outlook.com (2603:10b6:510:33::16)
 by CO3PR03MB6775.namprd03.prod.outlook.com (2603:10b6:303:175::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Thu, 12 May
 2022 22:28:56 +0000
Received: from PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082]) by PH0PR03MB5669.namprd03.prod.outlook.com
 ([fe80::6149:243e:e6cd:3082%6]) with mapi id 15.20.5250.013; Thu, 12 May 2022
 22:28:55 +0000
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
X-Inumbo-ID: ed2f22b3-d242-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652394545;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xHv0F81zpuI/E7Fihu2/1vFvM/ZpcGPFFBSBKe4NX/4=;
  b=fISPncUdQ0KLdf9GTkV8euIIovwc1wjvtPKbvtq0a6PcOiTdJi28LyhU
   veM3Fzr2lJYvORB/QhtyeypCxykeh682uFodx6L52nxmK9m3cDHRNW1dI
   AOpivnz8MJ8tpuz83jGgS6F5oSQZ2RFNWopaq10bpzf/oGPnq2+08dJd2
   U=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 71201830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4b/ucK2nWq5+GL4czPbD5b5wkn2cJEfYwER7XKvMYLTBsI5bpzIHy
 mccDGnXO6uDZGP9eNEnPYWypB5U78DSy9YyGwU4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx24Dia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0WvqK3WRsIMJHTs9Q5cTxlCCEnLIdZreqvzXiX6aR/zmXgWl60n7BCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B8+YBfmQjTNb9G5YasRmMvvZf
 cUULxZyahDJezVEO0sNCYJ4l+Ct7pX6W2IB8grM9fFvi4TV5D4o1rPkbfaORvetFPgWjGi0/
 z6cz2usV3n2M/Tak1Jp6EmEnuLVhirmQqodEbS58rhhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHAswaQpXeFulsQXoRWGuhiuAWVkPKIuUCeG3QOSSNHZJo+rsgqSDc21
 1iP2dT0GThot77TQnWYnluJkQ6P1eEuBTdqTUc5ocEtuLEPfKlbYsrzc+te
IronPort-HdrOrdr: A9a23:TGrOR6wzglDMIuaweOWSKrPxdegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMUs1MSZLXPbUQyTXc5fBOrZsnDd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadv/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZfbxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESutu/oXvUiZ1SxhkFwnAid0idsrD
 AKmWZnAy1H0QKVQohym2q15+Cv6kd315ao8y7kvZKqm72EeNt9MbsBuWsRSGqm12Mw+N57y6
 5FxGSfqt5eCg7Bhj3045zSWwhtjVfcmwtrrQaC50YvLrf2RYUh27D3xnklWavo3RiKmrwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23wO9UoJhXcw1YgahDMN5Zg9Q55L66
 DNNblpjqhHSosTYbhmDOkMTMOrAijGQA7KMmiVPVP7fZt3cE7lutry+vE49euqcJsHwN87n4
 nASkpRsSood0fnGaS1rep2G9D2MRGAtBjWu7FjDsJCy8zBrZLQQF6+YUFrlde8qPMCBcCeU+
 qvOfttcoreEVc=
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71201830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWPOEisWjlP4JAGdsOIiTZS0c08FTOvupA3TdF2xmB7SbdVVdWcXntmvUCsMerNUYhapdB/tIWYmq7tCfJ4exosN/jvC1S/oJa9GL+O4v2tzRKasBkD81EFc0LULOY0JK+NZNWui2ex8ZrtiWsdyyWpe2CVxAu/9c1XOLVF6LXyMU7MOV9R5kmpVEG9ivzX76WVxrOt4A59x/7GBP4x8nhHdsQExb1hNly8Rfx3U18jXi0v0Ix5cWbO9/hC87YK38ixfG0AECYNvpxgqHZhhAtCXpo/oXO4m1xNm0uwXn1T1Eg1UzQdp/ECHpLz2EJHoz96ka+pmnB+8qw/rkuI/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHv0F81zpuI/E7Fihu2/1vFvM/ZpcGPFFBSBKe4NX/4=;
 b=TLC8vD41bFMiJWZdbLd83QgYn2d6cr06eOOC01IECWc6dWIOpxhNCKgRj/ujuPdG6EGXbExBUpDmhu+A2or3ryT9DDJvh++/x0fGy41hD1he+kwq78B2hM32giPQM3iVgbNWRCq/kLA/Z3A9k3OUS8+DSnBpTFILbxf22gwypW8SIl/RucQQattcA0pflikjqohMqzoGrHtW+O+HYXa85UMqb1O7tu/eDxpqh4sVyxcIOHiXyYVKMNVSosWbLzyFuyEdjZjRoI9O9g9VJgtdxE59AbmJQ8xSpQXP3kywTPNCfOaUoLXD2UHPtJ9omU7vZ4QrQzb5Vjl8pxdkEVozMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHv0F81zpuI/E7Fihu2/1vFvM/ZpcGPFFBSBKe4NX/4=;
 b=dK6dGDtXvUSGSPD1+wJ68WsrDgdSa92R9rIqqAbcEHdniEJbZ0pkBuR8yXUeSUBRuWVHuHmpi10w2EyWrX1fFPY29MugGZaKoFr9SqO4wMpEFQe60ZSHRDn4ED70edhm6BYl0ukwtjPqEZIcDwIA9jiCUnOQx9y8kZnEESlhPZI=
From: George Dunlap <George.Dunlap@citrix.com>
To: Rich Persaud <persaur@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: PROPOSAL: Delete www-archive.xenproject.org
Thread-Topic: PROPOSAL: Delete www-archive.xenproject.org
Thread-Index: AQHYUBdKGkaQLBb2wkOW+P2/BX0raa0bkOkAgABAY4CAAC3TAA==
Date: Thu, 12 May 2022 22:28:55 +0000
Message-ID: <40C36445-9161-4D2C-B613-D2ED150EFC32@citrix.com>
References: <8DD705C9-2878-4F22-BEEC-82619857C702@citrix.com>
 <915413E2-1E4C-46F5-8A23-F24967E78401@gmail.com>
In-Reply-To: <915413E2-1E4C-46F5-8A23-F24967E78401@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79a51cd-b73f-4ece-3118-08da3466cd20
x-ms-traffictypediagnostic: CO3PR03MB6775:EE_
x-microsoft-antispam-prvs:
 <CO3PR03MB6775FFAB188A2B8FB9A3F8D399CB9@CO3PR03MB6775.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tCSVlCQtDBTe8cjQHVlQcM4D1a/VhY2jPPMR+MVn2vQVQBd4GRPdgIT+yv5k21gtapzPFSFZKyAgvtchx1GnZywGZl8qzdW6CfKXI5AS75oqzCU0HvsOiY+4BiXdM6e9Rll2My1s27ylQ1OJVPmsZY6fD15dH6EqK/QTvw0JkRscyivzNimEYosM59kDbD+d9xiiQeTUnPhCJQgbt55kz0+L9mQLTYM4oWNgfVm+Utx5dmklBSqH83aSzXqH+e+lr3JndqgjvAK8caNxCmwxFk4ILtSdxBxNkJ9UbuWwpzQy+QqFpkv0CeBAjiKAv9yrgn6mLS0zRsPjfTwG7QCc3zHjFO/Xo4KzqYXNDnDWELyrcZXv0I9D9wYz3xkAquG+NQ1Y8LQuN1PHrj4x5GmQbZHgyWpwYhIYYhzrpUTjqMDVRaOi3Zp1n8IBNv+/o9vS+z46+s/pgayWATX4I58RMu+dU8+QN7tqb/mv3I9WGZGI2u72SK2v2l5QIKdKss67TNkHpLtHKO+xxH0ydltooDYEIscqvwpeICkiccZdOf4WeXmIkODmBy1/MzDC9YPThgMO9izXWYBN647bG6H2Xmx6ZaBrtWLT02SGgNg2BMHyEx5xYR0eXVO9sZmIRl29pd4FPyBOYBGYdzDlXGZNcrsN/FWPA4w+6I4MmfDW05YCz+PGX35IgPYsIB0oLg9vvxlOw5nPzfDWS/el4XEBHp3grq+nJoKlZtyQKO6mLhnAff36rMgGAZMG87qUpxEl1Kd6vs21bUTV5McUEYl01g==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(82960400001)(91956017)(53546011)(122000001)(83380400001)(36756003)(8936002)(33656002)(6916009)(8676002)(64756008)(66556008)(66446008)(66946007)(66476007)(4326008)(76116006)(38070700005)(38100700002)(6512007)(6486002)(316002)(71200400001)(66574015)(508600001)(2906002)(5660300002)(186003)(86362001)(6506007)(2616005)(26005)(200143007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RXM1WWNkbzRyc2pMRUZJakNSVll1VW5FSzBoK0M5TGRGVktEYThheG95ZlEx?=
 =?utf-8?B?UE91cHp3bG81aDYxS0czbVJINEJzbXNQZkVOZGRXdkRVa3NZMFhzN2ROdHYr?=
 =?utf-8?B?UTJEeDFSVGhLNkJGSzRYTklnSkxmTXh2TGMxcGQyeU13RUJVYkM0czZBVWRn?=
 =?utf-8?B?VnJwZGRsTWIyNlNwSlczUXM0L092dGVnL1ppMlFNUm04L29GNVoxSmFTR1gw?=
 =?utf-8?B?RnFQeG41Q2ZmQkF0eVNCRlJZODRzb01IRXoyT290OVdOWlBmazI4NUV0d3Jh?=
 =?utf-8?B?cGg0WjVNU0lwM0ZoUnFYT1FkUlhjR1ptblozV1VFR0dvZzJEdURySGRZUmZj?=
 =?utf-8?B?NTN6cys1MHpFMnZNVEFibmlwbmxicE13eGtrRUZQQVVEUjFZNk82bmxMT05t?=
 =?utf-8?B?WDRtM1pyM3IzNlgzdTFHVG9FcFM2MnRXT2R4bS9ITyt5ZForZFVRZUJtTC85?=
 =?utf-8?B?eVcwUGpjK2p4VXQ0SDR1QmZxM2QwTndEMHY5azNQQ2t0SzJkdGhEdGE5U28x?=
 =?utf-8?B?bEVBamdTWDk2YjFlaUF6TmVVUFRTRmgzbHM2R1oxbEk3ZXZ6UEFBeFpPc2NV?=
 =?utf-8?B?QUpvUTNJc0VZVGtyT0QxWGpnN1hoZUhwZEdSSXVtNTZoYkVreDM2d041RXFO?=
 =?utf-8?B?ZnFFZ3oxOS9DL3lkeXFvN2YwRW1kTCtxdEZPdDdLTHQzOHRDaE1ia1doREpw?=
 =?utf-8?B?YmRKdXNmUWFNNjAyMHZaRVl0VUJINzgrTml1T08zTGxrMTZmcGdmUjZVemtV?=
 =?utf-8?B?MGxpOE5JbzdHYkp0eDRvV1VYQ3JWRW9NOFRBOFhEMWVMZU11bHU1ZUNTLzFK?=
 =?utf-8?B?a1pvQlc0cnZEeUo4MXkyNlB2RXRqMXdGNEIwaGFLRkhGYUgzZFE0cW5Ec2x5?=
 =?utf-8?B?OG8yRXpiUytEMVJoRGxFanhsaWlUYXlFTjVNeUNKd0ZBekpsWGVzVVNaVzdQ?=
 =?utf-8?B?S0FnZzEvYnVlVTVNcjhlTHBCeWtWeXFDeWdhTUFBaXVhNnZLcDJ4L2lsamp2?=
 =?utf-8?B?MURNazBHcmc0T3lyWEhGQUdwVG5vUmE5U0tvZHRpbEgxbmFaNlk0TVRzTXBv?=
 =?utf-8?B?NDVQcUExcG00WE43ZDVhbExUSTVJNlBxQXdlNWJmeFB5ZWtZRXk4WmREM2hr?=
 =?utf-8?B?N0JCekQ0R3Mxa2ZNUVFudDNpZFBYSVFOdDVidDJmMzlScmJlTDBRTUx0VThn?=
 =?utf-8?B?T05YM3NxYzJ5N3E3R2dvVlROMkx2VkllUElONFBndVNyclpYcGlGWXhuVmRJ?=
 =?utf-8?B?Nm9KaTV4UTJ1K0JqMjhYRkNRY3ZxR1p1cnZBN0lVdXNSYllqZ1hKZ0c3endP?=
 =?utf-8?B?MFl0U1Q3SkpPVzR6RzlrVktxeXFZWm5Bc2RrNFRxVG9leGczQ0tmcEg1YStw?=
 =?utf-8?B?aTljSVd0TUFjMlpGaTBmU1JFNklpM05ZRk5UVDlJN0FPdjlMNHc2dkhabUpr?=
 =?utf-8?B?bHdYd3NYZklMdHFnOUxtb01VcWQrS29NTXNJYkhQc0dTMkRsZzRuN3crWnAw?=
 =?utf-8?B?NVVnK3JkaC9OS0MyeCtzeDJkVm9CYUw3UHRLTjQzVXhaY0JyYmx6UlhrQ3BY?=
 =?utf-8?B?WnFPMlFLSU5FSW9aTDBOb3J4RXpoSEtYZWM4dXBrTXBOZElEZFBEVjhRcHdn?=
 =?utf-8?B?VzRuVEVLUnZhZUlmQVBkZGh1NWIxZHBnbmt0cjRHMjJ6OEtxRGZNYlJXUlEv?=
 =?utf-8?B?RmlsTlRzdDI2d1pKZDFQWUt2bGJmMWNYdnZvMmhkc3RtS0plTWxRbkNPRi9H?=
 =?utf-8?B?UVIxODFTZXdrWGZ4WDVSc0R0VmhacHk1d1dPTDd1TUFPa1l5K2FLMm04SGxs?=
 =?utf-8?B?eUc5Q3VwT0NrMURRN3R6WjZJMHhtemF4V2tJbFMvRGI1Wk9Zb0x5c0pZcDg4?=
 =?utf-8?B?b1BrVHRQQnkvT1BXeWlBL0ZLbTNJbko1SmF2Vm83OWhiOXpQdTUrTk5pQXFU?=
 =?utf-8?B?VS9EYTJjbmw4VExEUWg0TTVxVmpZS3paVkZDYkxUN2lqS216eEoreWVSeXNQ?=
 =?utf-8?B?ZURBUGN3VHZxTXVWM1Q5akp4OG5uOHp2M3RrblpvdU9zcnNnb3J5UUwxbEpX?=
 =?utf-8?B?NGcyam9iRzBVd3l0U2FqdUg3NjV0ZVVXVk1VYnl0eHlkY016N2dsdW9qMDdY?=
 =?utf-8?B?ZFhtcWUzSVNmdjlEYmJEOUNQNWJGRTBYQWhTbGMzcEFRM1hmRnNuZjV3SmJp?=
 =?utf-8?B?aVl4WUQ1cEhoZDRUYU5GUnVHZ2NxZE0rcnY0TWIxWE14RUpvOVdGRDJxKytT?=
 =?utf-8?B?a2VDWENaNm95RGk0NitNWHdLNkdHUW1LUytwZlJoY0w2bU9XU3Z4b2RCVGgr?=
 =?utf-8?B?NzRCTFVwbUNWdHg0cHhIM3hGdU1tTkJxaFl1TEY5d1VpNGpubzNLNSt1SDY1?=
 =?utf-8?Q?redW3T7+Giun8Y6U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12D2877663CFC54D8E9E6BB0C98F653B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79a51cd-b73f-4ece-3118-08da3466cd20
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 22:28:55.8457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVCekL1Fsw2lm54NDXAWxmx3PlCwFZI7KfG08MCfsW0wzOa98/jozTA/tq1N18ICuoP5+xe5oaHRs6wab/h/KdxS6U+nSVwCYc1BTMp7TuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6775

DQoNCj4gT24gTWF5IDEyLCAyMDIyLCBhdCA4OjQ0IFBNLCBSaWNoIFBlcnNhdWQgPHBlcnNhdXJA
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1heSAxMiwgMjAyMiwgYXQgMTE6NTUgQU0sIEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+PiDvu78NCj4+
PiBPbiBBcHIgMTQsIDIwMjIsIGF0IDQ6NDkgUE0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gSeKAmW0gcHJldHR5IHN1cmUgd3d3LWFy
Y2hpdmUueGVucHJvamVjdC5vcmcgaXMgYXQgbGVhc3QgTi0yIGZvciB3ZWJzaXRlczsgbGFzdCB1
cGRhdGVkIG5lYXJseSA5IHllYXJzIGFnby4gQXMgZmFyIGFzIEkgY2FuIHRlbGwgdGhlcmXigJlz
IG5vdGhpbmcgdGVycmlibHkgaW50ZXJlc3Rpbmcgc3RvcmVkIG9uIHRoZSBzaXRlIGl0c2VsZi4g
SeKAmW0gZ29pbmcgdG8gcHVyc3VlIGRlbGV0aW5nIGl0IHdpdGhpbiA0IHdlZWtzIHVubGVzcyBz
b21lb25lIG9iamVjdHMuDQo+PiANCj4+IEkgaGF2ZSBpbnN0cnVjdGVkIENyZWRhdGl2IHRvIHRh
a2UgdGhlIHNpdGUgZG93biwgYnV0IGtlZXAgaXQgaW4gYSB0YXJiYWxsIHNob3VsZCB3ZSBldmVy
IG5lZWQgdG8gcmVjb3ZlciBhbnl0aGluZyBmcm9tIGl0Lg0KPiANCj4gSXMgYWxsIG9mIHRoZSBo
aXN0b3JpY2FsIGNvbnRlbnQgZnJvbSB3d3ctYXJjaGl2ZSByZXBsaWNhdGVkIG9uIHRoZSBjdXJy
ZW50IHNpdGU/IFRoYXQgY29udGVudCB3YXMgaW5kZXhlZCBieSBzZWFyY2ggZW5naW5lcyBhbmQg
bGlua2VkIGZyb20gb3RoZXIgcGFydHMgb2YgdGhlIHdlYi4gQXJlIHRoZSBleGlzdGluZyBsaW5r
cyBnb2luZyB0byBicmVhaywgb3IgYmUgcmVkaXJlY3RlZD8NCg0KVGhlIGJsb2cgY29udGVudCBo
YXMgYWxsIGJlZW4gcG9ydGVkIG92ZXI7IHlvdSBjYW4gc3RpbGwgc2VlIHBvc3RzIGZyb20gMjAw
OCBvbiB4ZW5wcm9qZWN0Lm9yZyBpZiB5b3UgaGF2ZSB0aGUgcmlnaHQgVVJMLg0KDQo+IEhvc3Rp
bmcgc3RhdGljIGNvbnRlbnQgaXMgZXNzZW50aWFsbHkgZnJlZSwgZS5nLiB0aGUgZW50aXJlIHNp
dGUgY291bGQgYmUgaG9zdGVkIG9uIEdIIFBhZ2VzLiBJcyB0aGVyZSBhIGNvc3QgdG8ga2VlcGlu
ZyB0aGUgY3VycmVudCBzaXRlIG9ubGluZT8gSG93IGxhcmdlIGFyZSB0aGUgdW5jb21wcmVzc2Vk
IEhUTUwgZmlsZXMgYW5kIGltYWdlcz8gV2UgZG9uJ3QgZGVsZXRlIGhpc3RvcmljYWwgbWFpbGlu
ZyBsaXN0IGFyY2hpdmVzLCB3aHkgZGVsZXRlIGhpc3RvcmljYWwgd2ViIHNpdGUgYXJjaGl2ZXM/
DQoNClRoZSBtYWluIGNvc3QgaXMgdGhhdCB0aGVyZSB3YXMgY29udGVudCBvbiB0aGVyZSB0aGF0
IHdhcyBvYnNvbGV0ZTsgc3BlY2lmaWNhbGx5LCBvbmUgb2YgdGhlIHRvcCBoaXRzIGZvciDigJxY
ZW4gUHJvamVjdCBUcmFkZW1hcmvigJ0gd2FzIGEgUERGIG9mIGEgdHJhZGVtYXJrIHBvbGljeSB0
aGF0IHdhcyBvYnNvbGV0ZWQgYnkgdGhlIDIwMTMgbW92ZSB0byB0aGUgTGludXggRm91bmRhdGlv
bi4NCg0KPiBXaGlsZSBvbiB0aGUgdG9waWMgb2YgaGlzdG9yaWNhbCBjb250ZW50LCBkbyB3ZSBo
YXZlIGEgc2VsZi1ob3N0ZWQgbWlycm9yIG9mIHNsaWRlcy92aWRlb3MgZnJvbSBmcm9tIFNsaWRl
U2hhcmUsIFZpbWVvIGFuZCBZb3VUdWJlPyBNb3JlIHRoYW4gb25lIHB1Ymxpc2hlciBoYXMgZm91
bmQgdGhlaXIgY29udGVudCBkZWxldGVkIGR1ZSB0byBwb2xpY3kgY2hhbmdlcy4gSXQgd291bGQg
YmUgcHJ1ZGVudCB0byBoYXZlIG91ciBvd24gYmFja3Vwcy4NCg0KV2UgY2VydGFpbmx5IGRvbuKA
mXQgaGF2ZSBhICpzZWxmLWhvc3RlZCogb3B0aW9uLCBpbiB0aGUgc2Vuc2UgdGhhdCBhbnlvbmUg
Y291bGQgZ28gYW5kIHZpZXcgdGhlbS4gIEhhdmluZyB0aGVtIGJhY2tlZCB1cCBzb21ld2hlcmUg
d291bGQgaW5kZWVkIGJlIHBydWRlbnQ7IGl04oCZcyB3b3J0aCBjaGVja2luZyB0byBzZWUgaWYg
d2UgaGF2ZSBhbnl0aGluZyBhbnl3aGVyZSwgYnV0IGlmIHdlIGRvLCBJ4oCZbSBub3QgYXdhcmUg
b2YgaXQuDQoNCiAtR2Vvcmdl

