Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0536E4AC18E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 15:46:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267077.460783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5Gp-0000Lx-O6; Mon, 07 Feb 2022 14:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267077.460783; Mon, 07 Feb 2022 14:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH5Gp-0000Jy-Kr; Mon, 07 Feb 2022 14:45:35 +0000
Received: by outflank-mailman (input) for mailman id 267077;
 Mon, 07 Feb 2022 14:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wO/0=SW=citrix.com=George.Dunlap@srs-se1.protection.inumbo.net>)
 id 1nH5Gn-0000Js-Tp
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 14:45:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e59eea-8824-11ec-8eb8-a37418f5ba1a;
 Mon, 07 Feb 2022 15:45:32 +0100 (CET)
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
X-Inumbo-ID: 98e59eea-8824-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644245132;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/pugh4+jctYEopv1WC2RGw/SQ6WGIWa3Xn5kDAHyWjc=;
  b=ZqsQIOlUi/FZ/548TQ0RUqI9rF+I2EM2rBOTQRtxnsKyCSrsFJoDhTTO
   NsIZx+qaUOFFnjBcucSRgmYKNEY96utPXjJmeUdF8MyhQIUU5cdsZM1qh
   P6dR0DzUf9YWvKtjBzMtj5rO5pY3wTxr3qJU4v1/I89WN/lkB5e/VIjLj
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ha34woI5ICOzLwqm43c++QiipTZ20Mn/Ka2t9Slbr7ZGkQndwe+c9S5R0NEeqcq7pZog1jGl9C
 JwRt0aJ48I9lBefUKu0mkUQ6MLJwKZiwySn+qxpVydEL2lqmC01c0cyrooZhBGKpopKizJaTD+
 RRFaIEufeA5V1/OP7zUdppbp2F1SKGPQcp+FfWa6YUKq1BtseJVr6D8e1Gyi2hxLyeTXCKKCH+
 USFcrX6LX105mM6FSqUQ8tbUyUy/TaRHqZnkLyv63Sjl+jBKJ1aE7B3nttT+RaAr9PPCHe72Aa
 mXCBF+6LAQmj3IMmMw2OHtgI
X-SBRS: 5.1
X-MesageID: 63651125
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d/vyD6mTTnH9RlklpfZ6hsvo5gxfIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXD+EOqneYTDzcot0aoTlph4E6MfUz9FhSQc/+CBjRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NY32YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9c66PtaBk1B6fnm886dQZoLRsuO6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBObmO5kQtzdM0DfdBO4OSpHfWaTao9Rf2V/cg+gQRqiDP
 pNDNFKDajzfUyVPY2cbA64Oo8eDhlnHMANfskiK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzW7xGYeFRkXXluTuuSihwi1XNc3F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc4BBTdJnyR+R86D/4C2+IHc0cAQRbtNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtbABbvzt68owGOlor6p5
 ilspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/IdkBuWggdR0waa7onAMFh
 2eJ6GtsCGJ7ZiP2PcebnartYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7bc6glXyPj+HBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrGnMnKJoNJMcTjn7xETXPjLliCeTcbaSiJOE2A9Ef7Bh7Qnfo1uhaNOkenUu
 Hq6XydlJJDX3BUr8C2GNSJubq3BR5F6oS5pNCAgJw/wiXMifZyu/OEUcJ5uJesr8+lqzPhVS
 fgZeprfXqQTG2qfozlNP4PgqIFCdQiwgV7cNSSSfzViLYVrQBbE+4G4c1K3pjUOFCe+qeA3v
 6akilHAWZMGSgk7VJTWZfujwkmfp38YnO4uDULELsMKIBfn8ZRwKjy3hfgyepleJRLGzzqc9
 gCXHRZH+rWd/95rqIHE3PnWoZ2oHu1yGlthM1PatbvmZzPH+meDwJNbVLradz7qS26pqr6pY
 v9Yzq+gPaRfzkpKqYd1D51i0bk6u4n0v7ZfwwlpQCfLYlCsBu8yK3WKx5AS5KhEx7sfsgqqQ
 EOfvNJdPOzRas/iFVcQIisjb/iCiq5IymWDs6xtLRWo/jJz8ZqGTV5WbkuFhyFqJbdoNJ8on
 LU6s8kM5g3j0hcnP75qVMyPG7hg+pDYb5gaiw==
IronPort-HdrOrdr: A9a23:iujnbq0HEEf4rkIviDVUCgqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.88,350,1635220800"; 
   d="scan'208";a="63651125"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFRjAIN4x2ovsvrwkmnVIs0DmFRQtB3Fj0wNb2JsmpceC4R0rin2InsCP+OPRWuRkcKlcjhXsw3ZvgD8h0xlsgUne/Z/cGgftKlUzmKVFCbMlJbwpWadYFSvOyWjpwdNrS/C06CEvtEQgCgJs6cfZyOjNRyPSqNyP8eKniSuVqF5wGEQfGlK0wWe5hsVXes2SVTWexS6PEhHjUK3nIwu0VdhGKxU/7zfnUS9xETrsTvWcV8hJ1qX/TGQq6almuU5gF+ndHO2cYyyxMqMrw55PxvSQFQto6a3HsIuaxoz6KyfZC0uhiL66PpBvupPtxEA3hOJszQk0GBIpN3RUByNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pugh4+jctYEopv1WC2RGw/SQ6WGIWa3Xn5kDAHyWjc=;
 b=faQ9/4DEXMKQgSrTPAs8dVzZ8DfxtO5nPSomlBHzgXO2G/nZ40wFXjNefTfQ3+y0/tDJovb/zJ9hsL9wJzh7s6d12iStFwFBIL5K7K6VhR6axDcw8y281q7eGuoPx5uKel2Uq3azqEo1w9h2M9EQAAAN0WfZZoYgwnjc/QNgE8DYDtCSE4NZ6iFuo2yl6P2r9Etxa8k7cmhbfC7/+QOUaJRckIFT9BYoJZ8opNMAiUBLyc1vR4+V8+7zcSaYDl4gVz2vGl0lKNOYBOWbFT+M+H86JPU5I9rs5Pg0cyUPzs9xFkyOj1OvOA2TByGAOW33JS9Dz8eR2YlxV2YIfnbsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pugh4+jctYEopv1WC2RGw/SQ6WGIWa3Xn5kDAHyWjc=;
 b=rSPnuOpeWhSJFudfUw4SUbzdU/NwT79xpa08XIBP21RHqPG792k76TGweBw/whmQWKhB3/mZljSWsWP5Ncq8CnpD2to5Me9jwvTZfmbDfXahJNGIAJngN1espbFrnQ5frAVCRQ9s+HFr9lP+lCJjdykjQZ+LlvcpGIXiSq+2dNQ=
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>
Subject: Re: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Thread-Topic: [PATCH 08/16] x86/P2M: PoD, altp2m, and nested-p2m are HVM-only
Thread-Index: AQHXcbg9+9E9Zp3QUEWtGX2TK6aCNayGy30AgAJnLwCAAEyRgA==
Date: Mon, 7 Feb 2022 14:45:27 +0000
Message-ID: <E8945018-F8D5-4930-8E5B-ACBCB039BC2F@citrix.com>
References: <d1fd572d-5bfe-21d8-3b50-d9b0646ce2f0@suse.com>
 <694a6590-0018-223a-c796-3e1469ec354a@suse.com>
 <0C051DFA-9147-42DB-AA36-0DED3D192F43@citrix.com>
 <ccc16e12-2036-d71b-5521-71685f0ab38d@suse.com>
In-Reply-To: <ccc16e12-2036-d71b-5521-71685f0ab38d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab99897e-d2b9-4f04-21d0-08d9ea487b2e
x-ms-traffictypediagnostic: BLAPR03MB5556:EE_
x-microsoft-antispam-prvs: <BLAPR03MB555671D5DEBE73F5D219F9BD992C9@BLAPR03MB5556.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:397;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHzmYmqQC6WezcMOeEOKqtHtSMiaMrmLos46TOAeUhy9I6I9xziCR8nw3vEZuxfBNXKznycIKeTb4dGF0h9p5H+4ImOi0Q7yRfpk912kvsEc0tfvXXnmAiaVZjxd1BqmUG6xxKPPw/N2rU1LP/fHyOBxkOhp0sjloIHc6wxAVK2qDxhp230DH61aKePPDxG4HA+s92JDsO+E91I/7b8s89Ja9MRJYBifuQkGxCKa9SVdLvJDbg8gYhXPn+lCskT7HkQn+Lhk4mRkFJyyECGkPcZV4y8k73NhqlbV+vLNCKKoxs9/AZRcbT54wU+B9bkkUqy728lpr/PPRWrox03i18B1UdZo+G8wpwyQnw1f0ohIGhWg/H/lhB7ha4pI4qc3vW8lANzYL5Wlp3W/I6Nli3J9fUEruwXcHrhe3p/jYKNi3sIzYm9i25l5LjwX3XDCKHw0eEdB448Z5jbgDpP/itTgq81SaLuOhdY0E72bqKqwsauJIsOXxUZOR+7HsbKVmDDEVHSrFRuoGTzjjzshkRnVYjN4Ip1Gdzzq1jfjrfQ68l6OnUE0zBZGVy8xeRKeJcSc20P5hV8imO64MEbz/jD27gdZtoNzFjLF1Lh1huZSRrG6WqeoEcYqDJYl2+JIqHjsMoxuzBQOzSI2u0x3tv6VRyCJedErkyG9IYgDGWuOUvBqieGOKsG7PyDNA6Qr4rf8o97PaJk+gHivZ7cuJBWTem5pZNEJ5nKU9XSOTaOtTtkPTJCUbIbYR+RW6yXh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB5669.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(66446008)(6506007)(2906002)(64756008)(66556008)(66476007)(5660300002)(8676002)(83380400001)(8936002)(4326008)(38070700005)(36756003)(107886003)(66946007)(91956017)(6486002)(6916009)(186003)(2616005)(316002)(26005)(86362001)(82960400001)(54906003)(53546011)(508600001)(33656002)(71200400001)(76116006)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWJUY05IWnhRaVFkaGJCWmNqck55LzNNeWk4T01GMWpaTXhlREVISHVKSFZO?=
 =?utf-8?B?ZnVkL2dTT3lkVjV5c3hUVjdGa3VuUUlIVjVsTjVVR3UwUVNKTEg4SzYrU0JL?=
 =?utf-8?B?NkRpRC9DK3ZtemxnR0N2dWhJYUNkMnUweldYT1YyZER4WHdMd2h4VUQyQTlV?=
 =?utf-8?B?aXFSanRocS95ak0zamR0dVRHeEsyS04zV1paTGtoeWxNZGIxZC9ycEJMdHgw?=
 =?utf-8?B?RTN6SWVneURBeDNVQ0h5aFdxUlJGVWhPRHhFd0lNNU4zekFBaXVWMWd1aU0v?=
 =?utf-8?B?OWZlSnZLdTRBTnFGR2RDVFFRVEluMmNDK0NUZlRUcDFpbSsxcWVZS2FHbTZq?=
 =?utf-8?B?enhRdTdHR0tmbzBNRXNNVkRXa0pRMFJyckhoaWhGOWcyN2F2UEJxWi9lcm14?=
 =?utf-8?B?MHBRNXMweDFBeFVrNUNUMTdEQStTMDNwTnRXNDlDaERqbW5sTXg1cUkxU3g4?=
 =?utf-8?B?RnVCS0tKVlRHQ2NEeVJTbkpKVzVPZkdHR3RyWXI5L0QrZUFrbS9acjJhZnJa?=
 =?utf-8?B?cm40TmVnR3ZEM09PSmF1TTdaNDJyN3NnVXpJVjY5ZDVaTXhYNGltTVFLYUVx?=
 =?utf-8?B?dm00Tkk4RExoaVpodW9VVXdadzJwSjBJQjBHSVVSa1dMMzFBNWN0ak01Um5Y?=
 =?utf-8?B?d3Z4bXRvd2V3M1QyUzcvcTJNNkVwcEpxeVlkcjdjdVBlc1FsL29xc1Nvd2RG?=
 =?utf-8?B?SFFlM1hRZVFMT09JUlJyRDRlT2dTWE9Dd3dybHBJMFU4R1VlOXBYRzk3MCtw?=
 =?utf-8?B?MU16Y2VtU0lPZ2RLMXZCUWNCWDBnbTRUSzIzb3VuYXY0a0x5R1hCVWsybkJW?=
 =?utf-8?B?WHE3RHRGY3R4cmY3bUMySm04OEMyL0d3YkxvUFh2VWZ5bmhXV1FaM3dHc3gx?=
 =?utf-8?B?MkpReXVUQjBqWDhZazdYVVFtU3p0b1NFa2dwamtkL3JCcVR1bEovSFBkZ1Zj?=
 =?utf-8?B?WmwvWXFTNHFzY3FYa0xlNWt6dVJ3eTZVNk1aeHdjMG9oWUZCWUNyYmVmL0ZU?=
 =?utf-8?B?TGVBRHJHb2hNTHBkMEppVjRwVHBJRXZrTHBQb1ZTVVUyU1JuMDhwLzl5c1hi?=
 =?utf-8?B?Qk1VMHRUbXRrbE4rNjZoNjA4Vk85Y0xZc1JNN2I3WkFSRXV6ZGVSZUZiSFY5?=
 =?utf-8?B?OU1YTUc0WEpsWnN6Vkp4Z0ZUVnAvcDJKeUFMMmZ1LzdNdEdXaWVUMUtRMjZJ?=
 =?utf-8?B?TTVnRkxOMFA0MFJnMWRqWml4VU90Q2NjcWJXbGxETy9HbVlWWXBIT1BhZ3g4?=
 =?utf-8?B?WXZQZ2JoaUVwQzJLMkNXTlh1M291UEZoc2I5R290VUxQdG1hQXFyZjE4U1ZK?=
 =?utf-8?B?ZkZxcytJNHc1NXBmc2Zrc0FEL01qMUxxbHNuVk9JVEZxanMxMGl6b0M2a3RB?=
 =?utf-8?B?OVI4L2tnc1pCNlQzNEJrRmhvd0tETXVBdEExb1luUml6bFJmb2duUEk4TWpo?=
 =?utf-8?B?UUVsU3Urc3lHemRuSU0vRXJ5bno1Rkt5UUFYSHRYVS9LQ1ZvaURIanZ6QUdk?=
 =?utf-8?B?NTlEYTFadFdqaC9CeXR6L2FXT3RJdmJpcm5RNWJJRzdRQlpZRE1PZ1BhRUc2?=
 =?utf-8?B?UkoxN1AvM0RxaXVIL3pJdG5MR3h4L2c3V0hlSThMMUNsSlhFaGNtNm4zUGZ3?=
 =?utf-8?B?c0FueGhxWWIwZ0hDeTdZaUdTM0luekJOa2hWbmlCRUkzL2tvOWRmc0lnYWYy?=
 =?utf-8?B?THdGYzI5aDdMNTlPcjdPaFJSNERwWEJFd0pKclVPUnRHeENTbTAzckc4ZmpM?=
 =?utf-8?B?WjE3THlpM3E1Q0xXdFI0b3U2VG92Kzh0STI4dHQ4T05MSGxhcjEyL2FJMDJQ?=
 =?utf-8?B?V0FEdjNka2JQdEdRWDZCNGQ2bHRVZktPSlFrcmlUeEFSVzhEM1pGanBHR2VR?=
 =?utf-8?B?WHlHdkdkdU0ycDM4WTVjNCtSenowb0wyWUdIMTMvckFpYlRDcGtldWtGb3ZV?=
 =?utf-8?B?UkJ6cjc2WFIzTDJGYXFKZkFkWWUyWTBRZm9wZDg3QUNLdTdlbVlabUMyY256?=
 =?utf-8?B?NkNvd1U2TXNwYmdINzhzcUs2NWdTRTZKME05eUJrTktNbnJ0dWZxcDdESklG?=
 =?utf-8?B?SC9QajFUYTJuMXkydzRCWlBlcUpJT2JZemhsQTFVL0FReGFQOWkwcVNteUtP?=
 =?utf-8?B?dWZwUTg4SG9tdVJWaEFQUExKaVIzSW1POUFLK1NCa2JQKytBV0VYZUwxaFl5?=
 =?utf-8?B?YjlQelVqendtcjMyVmFjNnB6SzJYQVQzSzBrTmU0R2dCSDhVZ3pBekJyNVZX?=
 =?utf-8?Q?oan9+oyjAyn+wwX379AI0ESh+8WoZHF1RYnP+yq6L4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BA7D49C6F0ADA4B9A1963E645D33D06@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB5669.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab99897e-d2b9-4f04-21d0-08d9ea487b2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:45:27.3708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1nr9SrGs+TJbP1sN+avKpl9y+YWm31M3xv7iTneIZ0K9MByBEguRwXorkSUMXANmcGucHrKdKCDObov+ZDC16DJz4qJw2neKFabVU0h0G80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5556
X-OriginatorOrg: citrix.com

DQoNCj4gT24gRmViIDcsIDIwMjIsIGF0IDEwOjExIEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDUuMDIuMjAyMiAyMjoyOSwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+PiBPbiBKdWwgNSwgMjAyMSwgYXQgNTowOSBQTSwgSmFuIEJldWxpY2ggPEpC
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXBv
ZC5jDQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1wb2QuYw0KPj4+IEBAIC0xMTM1LDYg
KzExMzUsMTIgQEAgcDJtX3BvZF9kZW1hbmRfcG9wdWxhdGUoc3RydWN0IHAybV9kb21haQ0KPj4+
ICAgIG1mbl90IG1mbjsNCj4+PiAgICB1bnNpZ25lZCBsb25nIGk7DQo+Pj4gDQo+Pj4gKyAgICBp
ZiAoICFwMm1faXNfaG9zdHAybShwMm0pICkNCj4+PiArICAgIHsNCj4+PiArICAgICAgICBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsNCj4+PiArICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pj4gKyAgICB9
DQo+Pj4gKw0KPj4+ICAgIEFTU0VSVChnZm5fbG9ja2VkX2J5X21lKHAybSwgZ2ZuKSk7DQo+Pj4g
ICAgcG9kX2xvY2socDJtKTsNCj4+IA0KPj4gV2h5IHRoaXMgY2hlY2sgcmF0aGVyIHRoYW4gc29t
ZXRoaW5nIHdoaWNoIGV4cGxpY2l0bHkgc2F5cyBIVk0/DQo+IA0KPiBDaGVja2luZyBmb3IganVz
dCBIVk0gaXMgdG9vIGxheCBoZXJlIGltby4gUG9EIG9wZXJhdGlvbnMgc2hvdWxkDQo+IG5ldmVy
IGJlIGludm9rZWQgZm9yIGFsdGVybmF0aXZlIG9yIG5lc3RlZCBwMm1zOyBzZWUgdGhlIHZhcmlv
dXMNCj4gdXNlcyBvZiBwMm1fZ2V0X2hvc3RwMm0oKSBpbiBwMm0tcG9kLmMuDQoNClRoZSBmYWN0
IHJlbWFpbnMgdGhhdCBpdCBkb2VzbuKAmXQgbWF0Y2ggd2hhdCB0aGUgcGF0Y2ggZGVzY3JpcHRp
b25zIHNheXMsIGFuZCB5b3XigJlyZSBtYWtpbmcgbWUsIHRoZSByZXZpZXdlciwgZ3Vlc3Mgd2h5
IHlvdSBjaGFuZ2VkIGl0IOKAlCBhbG9uZyB3aXRoIGFueW9uZSBlbHNlIGNvbWluZyBiYWNrIHRv
IHRyeSB0byBmaWd1cmUgb3V0IHdoeSB0aGUgY29kZSB3YXMgdGhpcyB3YXkuDQoNCklmIHlvdSB3
YW50IG1lIHRvIGFwcHJvdmUgb2YgdGhlIGRlY2lzaW9uIHRvIG1ha2UgdGhlIGNoZWNrIG1vcmUg
c3RyaWN0IHRoYW4gc2ltcGx5IEhWTSwgdGhlbiB5b3UgbmVlZCB0byBtYWtlIGl0IGNsZWFyIHdo
eSB5b3XigJlyZSBkb2luZyBpdC4gIEFkZGluZyBhIHNlbnRlbmNlIGluIHRoZSBjb21taXQgbWVz
c2FnZSBzaG91bGQgYmUgZmluZS4NCg0KIC1HZW9yZ2U=

