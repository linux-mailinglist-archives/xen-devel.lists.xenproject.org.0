Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED24D1CB3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:04:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287154.487008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcK0-0002qf-VF; Tue, 08 Mar 2022 16:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287154.487008; Tue, 08 Mar 2022 16:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcK0-0002o5-Rf; Tue, 08 Mar 2022 16:04:24 +0000
Received: by outflank-mailman (input) for mailman id 287154;
 Tue, 08 Mar 2022 16:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LykH=TT=citrix.com=prvs=059d7c239=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nRcJy-0002nu-Vt
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:04:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695057bd-9ef9-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 17:04:21 +0100 (CET)
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
X-Inumbo-ID: 695057bd-9ef9-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646755461;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Bz9yh7zgs1IE033WKO97YRQC8oeZNSDFRXWb+0ig/NM=;
  b=MU8hZaKH2L2lVsHSW+nb0PT4GoX+Di6L6GXhIgOH0VcVLgMFRZk+Zqpv
   lhK/+pcA5coimY2TE/s6IEGE0RqAKQQKIYmavSAqkwJJUHH6XZm8WoTFD
   QbZy0IArqRksYiKn+FxOgTUT5xggW4lrkhOdk3MlUldHnhxDqB3pGXBwR
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65652360
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kinaWqgjMAqF/0YNlQBNfPXzX161qxAKZh0ujC45NGQN5FlHY01je
 htvXDiEOvuMNjekKNogadu09EJU6MLWzoJgTAJkrSs2Fiwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTcSLJHu29sRaghZKRlGPfF826frfWfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xN2cxMU6bPUUn1lE/VJt5vr+CtFrGUiBA7wytlfssvk+Kw1kkuFTqGIWMIYHbLSlPpW6dp
 X/u9mHwEBYcctCSoRKA6nWsgubEngvyXYsAE7v++vMCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZjJGZdYrsOc/QDU40
 VnPk96BONB0mOTLEzTHrO7S9G7sf3hORYMfWcMaZTs+8eXB474/twPOdO5bEPKPrcXZRS6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hc5
 CBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeR8B3iUsI2aBj
 KrvVeV5vsc70JyCN/MfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZwz/9ga
 crAKJbxVh727JiLKhLsHI/xNpdxmkgDKZ77H8inn3xLL5LEDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg/MOO/B8gu9ylnVcHuVH7xs0UejU+UxP53X7M8fKU99fwlyvhxT
 vIffN6HDOgJQTPCkwnxp7Gh8eSOqDzDadqyAheY
IronPort-HdrOrdr: A9a23:+hCh265K7eYKnG9N5gPXwWiBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc0AxhJE3Jmbi7Sc29qeu1z+863WBjB8bcYOCAghroEGgC1/qs/9SEIUzDH4FmpN
 9dmsRFeb/N5B1B/LvHCWqDYpYdKbu8gduVbI7lph8HJ2wLGsJdBkVCe3ym+yVNNVN77PECZf
 2hD7981kOdkAMsH6KG7xc+Lo3+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwJ85mF
 K10DDR1+GGibWW2xXc32jc49B9g9360OZOA8SKl4w8NijssAC1f45sMofy/gzd4dvfrWrCou
 O85CvIDP4DrU85uVvF+CcF7jOQlArGLUWSkWNwz0GT+vARDwhKdfapzbgpAycxrXBQ4e2UmZ
 g7rF5w/fBsfGP9tTW46N7SWx5wkE2o5XIkjO4IlnRaFZATcblLsOUkjQlo+bo7bWrHAbocYa
 JT5QDnlYFrWELfa2qcsnhkwdSqUHh2FhCaQlIassjQ1zRNhnh2w0YR2cRaxx47hd4AYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yDmDWWxrDPG+bPFyiHqAaPHDGrYLx/dwOlayXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO6RzJSHXVZ0Wl9iif3ekOhlTRfsufDcTYciFdryKJmYRqPvHm
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65652360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBx2G0jxhSZY28HiQRKCmjmZtEoW/gVWPg1P0BqRE3Pfuh6DcEBIZ6VtG0efVWypdeyk4bPfM61rKg6IGxsxC/7ZdRvnTbXkzc7+iH1SW+Eb9Ad5hLvRONvOo/fC64iDWxAQu0rEKhToXZrlThRwb1ejvhApfonhgiz4ltTSPPYM85O1txqh+EPuUdwJpQiFIgfzFGWAoBxdJOA098aPkGHkkzOmRqELMpWvuyrUS1A48VJx3Qc2L/7yW2VKZw48utLgF19kxMnA5Z70O3ank31o/6agt2XRS7g1vpz0l60SVSt8Z36kw5VPqOkzhn9tNFU/LwpUJiH+8qiwF0tFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz9yh7zgs1IE033WKO97YRQC8oeZNSDFRXWb+0ig/NM=;
 b=AkdRV4Hn0fK0NL+cPGYhjmo5urXghRzYBseUo0gWLy0C8hZQAx0rXlqfc1v5P/0hSlMkuPJ9qABWYKZS9665eOPGqyNiliuRwePjLpffChWSrcnYVrQflCFx37vVFmDBPmI+ZLemkg0Tb2RcPQvDBhNKkMQCK6qvb2xZ24HQAFVKzxqn5tT+oLw0ShAt+ISDrO4TEF1prdooBa/hCfFh7W43WiCIsbNgLo+VOb5IF2qbDOgs71q13rdKjJ3faJ5TQK4XQ8ocUmG2NqVyEUBcU4UvOlqx0Iv8UEBVhufGsotFcazcb49CVIPTHQH1eeFGuxgaKfNHRYsroM0KejurgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz9yh7zgs1IE033WKO97YRQC8oeZNSDFRXWb+0ig/NM=;
 b=MLxMNSsFxA9RuITyZO8R8nB3BKVG7H9HIDE711phLwjJMzcQuifHd51JA77qmRUKuTWuI0AFAWLal0gO2K+jcopgelVGFT6vxl9vvrBQxUs8g90pVpa93LpxOQoprPE+ggC8tzKlSrbtdBTCmRAhQxWbnI3Mi3SloBoaYrrgcGk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Bjoern
 Doebel" <doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Topic: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Thread-Index: AQHYMvUk0XiHSYNleUqdwHU2YHv5TKy1jjMAgAALzQCAAASOAIAAB8IA
Date: Tue, 8 Mar 2022 16:03:57 +0000
Message-ID: <48c6720a-070e-85db-f1c3-448714232946@citrix.com>
References: <20220308140126.8815-1-andrew.cooper3@citrix.com>
 <18fb4115-94d8-16c2-e39b-1be895e254f4@suse.com>
 <476a25f8-86eb-0df5-b481-fc4cd5ecbb18@citrix.com>
 <83fa28ce-f2db-2451-356f-0dc0266834f2@suse.com>
In-Reply-To: <83fa28ce-f2db-2451-356f-0dc0266834f2@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d1b7890-5cb1-4677-df5d-08da011d4064
x-ms-traffictypediagnostic: BYAPR03MB3606:EE_
x-microsoft-antispam-prvs: <BYAPR03MB36061096711B8EB832A16C43BA099@BYAPR03MB3606.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q0pRzSYwtlKkfB9rT4T0U6tuDS0LxyCWtbaA8VE3szhF6eqoRaH0hOstMuXlG4dlbMffab8QflLbMLkwQ0qu8vDYrBL940YljENyAdQljoFXNuFDmCVjmWUOuV4lnuHbMUBs9ytqFR5CpKoRtofbFr4WWsdrUZ+r4nY9s0ZUNmG4pgxzKeJorMnii2uYk9cqCeRILY2ZCCjCoUkjIuhG78rF47+4wGCsLorIGm88GFNCFH+93LZbxa4BAlujUucmaMH+FdYzQtRqnKaoapAinpBRhosdMnN9T6YlesPa+rPUqG/92NYKB8X0EDREiVbsOBGcb47TmVLP+Q5kjhj+fgxMzQNIyqLWAaHpEqjwzJKdJGyi0ojgdWb+mlsNB59bMIm5KzTauQGofGP9OdpHMvedFCXGOIabxRP3GphZ68tH9QMAp0Gt3q2emOOqr6dEqIXAQTqa9oWtQLpxzI/wuXz7qX51FTfgz9ujaWRmPeg0Z7SB21bdSTlJEgkYNHhCAL5LLBfNIiTcgZaz+Y3HGoUE/2OCv2CgqfTqOrnTgjNZDkoSUJA4b1J28KDlKFVQnFjI27D5EZVpLXTF+YRPVs+uUAE84F8LaBOa5S44r+TeYgCdWZZkkGlHHddWmZsKDsgbkXd62bLD/25M9MFoHnHVtfIlTG+/HGA86bkFepQAqOydgHsPjGAZqg48Y5ne9+FdvZgGZenMQ9EDlCdXGYpJGSLIUIhyME3T02PF23S1iuuGzZEzmlQ+dkolYF9PU8OafTirUz1zJw8vIFKIoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(38070700005)(186003)(316002)(31686004)(76116006)(91956017)(54906003)(4326008)(36756003)(31696002)(83380400001)(6916009)(86362001)(66574015)(82960400001)(8676002)(2616005)(122000001)(5660300002)(66946007)(6506007)(53546011)(26005)(38100700002)(6486002)(6512007)(508600001)(8936002)(66446008)(66476007)(66556008)(2906002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2JZR21IYU9CR1NPSkhHMERiSkhlUm56djFCTGxUQ1l6UUFSUzFoS095REdU?=
 =?utf-8?B?NGZEYmczaE9nR1RzWHc4VlB5RmE4VnZna2VwUG1xUzV3WWxKbzlyU2JjODlJ?=
 =?utf-8?B?VGd4eXBQUEFKZ1cxc01RSC81bWRid0V6WTVZQzJEWGVJaHY2ZHBoTTVZN0Vu?=
 =?utf-8?B?NEhMR0dSUGpGVmhqbEFLa3hTOEIxbUw0Y3JjRHFEVm1TN2JXVkp3MmlpalYy?=
 =?utf-8?B?TjZUTUF2aS9mdkhSczhZNkhMRzRMMXNQTFFrN2dSNmdNQkdtTWl2ZlVFRVRH?=
 =?utf-8?B?a0dtcCtueWJablpMMU1BVXhEZko3Z0xGWWx0MnJKWE1vM242bWpyMTBWSnZj?=
 =?utf-8?B?NUZIV2R3TUwva3UwaUNGUHljUVdKYndhQ2FiZVJGWGlSYWc1bldwbXRES3JH?=
 =?utf-8?B?NURLaFVZS2xZU01OVHVUMXVjamxyV2JNRGtOdEw5ZHorcmx6VGtIS3EzaWFN?=
 =?utf-8?B?bjcwSnRqcE94UFZWSHYxdTVGMmw0K0p5cVA3bFVhdkNndnR4eHF0YjFjR0V3?=
 =?utf-8?B?NEN2T081dmhtL3hXL1V2eVZpOFVUQVdYVzhjSE91MmI5bXpkbnFUQnU5S1g3?=
 =?utf-8?B?cnc4U2JjWnZ6UGR4bEtyZExHQTJ3U0NTZlVjdTRrUlN5MzV2aVpqVklNYTJv?=
 =?utf-8?B?cGJYTlZoN2xFOHVBdnRCSjU4RGF1TS9FSkJqcWUzL0JYbHN1Q3dLRzllc1lP?=
 =?utf-8?B?ZlNWQTYyTnozVTQ5ZE14Smpja3NtZUlDUlgyMUN5bkdTbStxVitKUjlGbnIr?=
 =?utf-8?B?emtDMFZjZ2pBSVREMGpGNGR2YTJQb3pmTFphYnFkZEVkRXpIZkpSejk3MU9D?=
 =?utf-8?B?NkJ0cUdqSEtSR3QwTzVENHE2MkFhRGtLV3h6MGp0S0tUVjZqckhWYTErTTZp?=
 =?utf-8?B?ZUFyR2wzRnMveGpEdUhsc2RreXdWVllEK0NsSE41RC9UL2JhclR6WDhOc3FW?=
 =?utf-8?B?MVRwbUtudzFNYlEvMzJXQ3Znb2ZvbEFiaFZIQjJBRW9hc21KQktVdGxWK3h4?=
 =?utf-8?B?R2kvMXYra2dFTU9Eb2pydzRDeCtibUxLZVp4MnY1R056eElOWHBtaGtsMDd6?=
 =?utf-8?B?dWxqVVdHOXNmdWpaTGJ6TWtubGdFcEQwSFJ4dTJKMjVkcVZVOEVSZURyZkcw?=
 =?utf-8?B?UEVxa0VkNFFvVXliWG1CRVdKbnZCVlhlc2pqdVBBalR2M3JMbi9vT0FLdEp4?=
 =?utf-8?B?VWhXbkN3TmxyYW00U3lhWlJSV1ZQZmNGTjIzWEtmUGhvS2RSNHBHWHREUEgw?=
 =?utf-8?B?eEVmcUlWdTVWdVFjVm84bmp0dm1ybUZlRktvempWbGhDL2hXbmRCaENpakJV?=
 =?utf-8?B?MnBTTG01eTBWUG9admFqTFBkWTJyNzBLYnphcGg5WkV3SExzODRyVU5FdFVp?=
 =?utf-8?B?OUFGdDZucVJuaUZrclo3Y1h3WU9pT1lJNWs5VE52TWh0cEtRd0N0bk5MRUVR?=
 =?utf-8?B?Yk12dkhpMVNqQ2lJSUpuWUFaaTJGMTZGbnBYOU92UEd4bmo1dlhObmVnV2Z6?=
 =?utf-8?B?Nnh5QXg0Y0VkMzREbWJpZWprL0hSRk1uU0I0OWk5azdOMU1ESlF6NjU4WVBq?=
 =?utf-8?B?WXdicEtqeWduOXhjQmE2R1VYWFRDNUJjK0g0ZkJROFhUN3JVbVhhc3ArczE1?=
 =?utf-8?B?eG5sWWJHQnh3bmhPSTJnWFFHV3YrYXhSTWlaTXBheWpFWmZyUWcrMFplV3Nm?=
 =?utf-8?B?eEV1S3k2byttQlVocG5sQ3VwWEhaZFBjeW91bE1QTUxRMllFdVZLbG1JVkc2?=
 =?utf-8?B?R1RZSXhLTWhnbjd1UlEvNWtJeCtkczNVMVBLaitRTUtES3ZFTDlhT2J1Qm1D?=
 =?utf-8?B?NGhQQmhaUjBuYlNaa1VUaWFCbmpneFhqSWp4NVpuSE54ZzNNUEFlRThFMURk?=
 =?utf-8?B?aW96b0Z4YkVHcFVYb21GNlpIWmlYQnQ0aW9vVW1YYnlZMnpuY0d3TEZ0VC90?=
 =?utf-8?B?MWo0VVJpYU91a3UvWTJIa2hVOU9JRDdvN3lwU2UyeEx0alI1dURuRlJqZDVK?=
 =?utf-8?B?WmFjVXh4MjNFdUd0UnhMcnBQa3crVjBCL0MyelU3OTF3SDFFZCtsOUlCY042?=
 =?utf-8?B?MXBZWmFTNjRDVE9FVHkvRDlkdzlORll3WG1oYitZYnFnOFplRWx5MFFvdlpx?=
 =?utf-8?B?OENRSmhReitTV0IvT2pjNVBHTmJTZnNRb3RwWVlsTnc5Y3JLVk9rUW5reFZV?=
 =?utf-8?B?SHJqckp0OXp4clZUYlA1VktTUHdnR3FEamlJMGN2OE1sdkh1cFQrR21xbmFa?=
 =?utf-8?B?YzMxM0huait1clFEWEE4QkNYbnZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C4E87060360048A6880A7D2B09C11F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1b7890-5cb1-4677-df5d-08da011d4064
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 16:03:57.1441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TFHc3qS16wTf1mzfwaAi6Gbe8vzAlLkaj9xokJ+GWNzUX3h8x5+ym4Jr1ZQ00vof1QbC6V1fdqDUvpOwCjeJ7HP3juu/Pg9pFpN0bUnFs14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3606
X-OriginatorOrg: citrix.com

T24gMDgvMDMvMjAyMiAxNTozNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjAzLjIwMjIg
MTY6MTksIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAwOC8wMy8yMDIyIDE0OjM3LCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAwOC4wMy4yMDIyIDE1OjAxLCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiBGb3IgbGl2ZXBhdGNoaW5nLCB3ZSBuZWVkIHRvIGxvb2sgYXQgYSBwb3RlbnRp
YWxseSBjbG9iYmVyZWQgZnVuY3Rpb24gYW5kDQo+Pj4+IGRldGVybWluZSB3aGV0aGVyIGl0IHVz
ZWQgdG8gaGF2ZSBhbiBFTkRCUjY0IGluc3RydWN0aW9uLg0KPj4+Pg0KPj4+PiBVc2UgYSBub24t
ZGVmYXVsdCA0LWJ5dGUgUDYgbG9uZyBub3AsIG5vdCBlbWl0dGVkIGJ5IHRvb2xjaGFpbnMsIGFu
ZCBpbnRyb2R1Y2UNCj4+Pj4gdGhlIHdhc19lbmRicjY0KCkgcHJlZGljYXRlLg0KPj4+IERpZCB5
b3UgY29uc2lkZXIgdXNpbmcgRU5EQlIzMiBmb3IgdGhpcyBwdXJwb3NlPw0KPj4gTm8sIGFuZCBu
byBiZWNhdXNlIHRoYXQncyB2ZXJ5IHNob3J0IHNpZ2h0ZWQuwqAgRXZlbiA0IG5vbi1ub3BzIHdv
dWxkIGJlDQo+PiBiZXR0ZXIgdGhhbiBFTkRCUjMyLCBiZWNhdXNlIHRoZXkgd291bGRuJ3QgY3Jl
YXRlIGFjdHVhbGx5LXVzYWJsZQ0KPj4gY29kZXBhdGhzIGluIGNvcm5lciBjYXNlcyB3ZSBjYXJl
IHRvIGV4Y2x1ZGUuDQo+IFdlbGwgLSBJIHRob3VnaHQgb2YgRU5EQlIzMiBiZWNhdXNlIGVsc2V3
aGVyZSB5b3Ugc2FpZCB3ZSBkb24ndA0KPiBuZWVkIHRvIGJlIHdvcnJpZWQgYWJvdXQgYW55IGJ5
dGUgc2VxdWVuY2UgcmVzZW1ibGluZyB0aGF0IGluc24sDQo+IHNpbmNlIGZvciBpdCB0byBiZWNv
bWUgInVzYWJsZSIgYW4gYXR0YWNrZXIgd291bGQgZmlyc3QgbmVlZCB0bw0KPiBoYXZlIG1hbmFn
ZWQgdG8gbWFudWZhY3R1cmUgYSAzMi1iaXQgcmluZzAgY29kZSBzZWdtZW50LiBOb3cgeW91DQo+
IHNheSBlZmZlY3RpdmVseSB0aGUgb3Bwb3NpdGUuDQoNCldlJ3ZlIGdvdCB+MCByaXNrIG9mIGhh
dmluZyBhbnkgZW1iZWRkZWQgRU5EQlIzMidzIGJlY2F1c2Ugd2UgbmV2ZXINCnJlZmVyIHRvIHRo
ZSBvcGNvZGUsIGFuZCB0aGVyZWZvcmUgYWRkaW5nIDJ4IDAuN3MgZGVsYXkgdG8gc2NhbiB0aGUN
CmJpbmFyeSBvbiBidWlsZCBpcyBhIHdhc3RlLsKgIElmIHRoZSBjaGVjayB3ZXJlIGZyZWUsIGl0
IHdvdWxkIGJlIGENCmRpZmZlcmVudCBtYXR0ZXIuDQoNCkF0IGFueSBwb2ludCwgaWYgd2Ugd2Vy
ZSB0byBpbnRyb2R1Y2UgcmVmZXJlbmNlcyB0byBFTkRCUjMyLCB3ZSdkIHdhbnQNCnRvIHN0YXJ0
IHNjYW5uaW5nIGZvciBlbWJlZGRlZCBzZXF1ZW5jZXMuDQoNCkJ1dCBhdCBubyBwb2ludCBkbyB3
ZSB3YW50IHRvIGludGVudGlvbmFsbHkgcmVtb3ZlIG91ciBkZWZlbmNlIGluIGRlcHRoDQpjcmVh
dGVkIGJ5IGJvdGggaGF2aW5nIG5vIENTMzIgY29kZSBzZWdtZW50LCBhbmQgbm8gRU5EQlIzMiBp
bnN0cnVjdGlvbnMuDQoNCj4NCj4+PiBJJ20gd29ycmllZCB0aGF0DQo+Pj4gdGhlIHBhdHRlcm4g
eW91IHBpY2tlZCBpcyBzdGlsbCB0b28gY2xvc2UgdG8gd2hhdCBtaWdodCBiZSB1c2VkDQo+Pj4g
KGRvd24gdGhlIHJvYWQpIGJ5IGEgdG9vbCBjaGFpbi4NCj4+IFRoaXMgaXMgd2hhdCBMaW51eCBh
cmUgZG9pbmcgdG9vLCBidXQgbm8gLSBJJ20gbm90IHdvcnJpZWQuwqAgVGhlDQo+PiBlbmNvZGlu
ZyBpc24ndCB0aGUgb25seSBwcm90ZWN0aW9uOyB0b29sY2hhaW5zIGFsc28gaGF2ZSBubyByZWFz
b24gdG8NCj4+IHB1dCBhIG5vcDQgYXQgdGhlIGhlYWQgb2YgZnVuY3Rpb25zOyBub3A1IGlzIHRo
ZSBjb21tb24gb25lIHRvIGZpbmQuDQo+IFdlbGwsIG9rYXkgLSBsZXQncyBob3BlIGZvciB0aGUg
YmVzdCB0aGVuLg0KPg0KPj4+PiBCam9lcm46IEZvciB0aGUgbGl2ZXBhdGNoaW5nIGNvZGUsIEkg
dGhpbmsgeW91IHdhbnQ6DQo+Pj4+DQo+Pj4+ICAgaWYgKCBpc19lbmRicjY0KC4uLikgfHwgd2Fz
X2VuZGJyNjQoLi4uKSApDQo+Pj4+ICAgICAgIG5lZWRlZCArPSBFTkRCUjY0X0xFTjsNCj4+PiBM
b29rcyBsaWtlIEkgZGlkbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gdGhlbiBmcm9t
IHlvdXINCj4+PiBpbml0aWFsIGRlc2NyaXB0aW9uLiBUaGUgYWRqdXN0bWVudCBoZXJlIChhbmQg
dGhlIG9uZSBuZWVkZWQgaW4NCj4+PiBCasO2cm4ncyBwYXRjaCkgaXMgdG8gY29tcGVuc2F0ZSBm
b3IgdGhlIGFkdmFuY2luZyBvZiB0aGUNCj4+PiB0YXJnZXRzIG9mIGFsdGNhbGxzIHBhc3QgdGhl
IEVOREJSPw0KPj4gTm8uwqAgQ29uc2lkZXIgdGhpcyBzY2VuYXJpbzoNCj4+DQo+PiBjYWxsZWU6
DQo+PiDCoMKgwqAgZW5kYnI2NA0KPj4gwqDCoMKgIC4uLg0KPj4NCj4+IGFsdGNhbGw6DQo+PiDC
oMKgwqAgY2FsbCAqZm9vKCVyaXApDQo+Pg0KPj4gRHVyaW5nIGJvb3QsIHdlIHJld3JpdGUgYWx0
Y2FsbCB0byBiZSBgY2FsbCBjYWxsZWUrNGAgYW5kIHR1cm4gZW5kYnI2NA0KPj4gaW50byBub3Bz
LCBzbyBpdCBub3cgbG9va3MgbGlrZToNCj4+DQo+PiBjYWxsZWU6DQo+PiDCoMKgwqAgbm9wNA0K
Pj4gwqDCoMKgIC4uLg0KPj4NCj4+IGFsdGNhbGw6DQo+PiDCoMKgwqAgY2FsbCBjYWxsZWUrNA0K
Pj4NCj4+IFRoZW4gd2Ugd2FudCB0byBsaXZlcGF0Y2ggY2FsbGVlIHRvIGNhbGxlZV9uZXcsIHNv
IHdlIGdldA0KPj4NCj4+IGNhbGxlZV9uZXc6DQo+PiDCoMKgwqAgZW5kYnI2NA0KPj4gwqDCoMKg
IC4uLg0KPj4NCj4+IGluIHRoZSBsaXZlcGF0Y2ggaXRzZWxmLg0KPj4NCj4+IE5vdywgdG8gYWN0
dWFsbHkgcGF0Y2gsIHdlIG5lZWQgdG8gbWVtY3B5KGNhbGxlZSs0LCAiam1wIGNhbGxlZV9uZXci
LCA1KS4NCj4+DQo+PiBUaGUgbGl2ZXBhdGNoIGxvZ2ljIGNhbGxpbmcgaXNfZW5kYnIoY2FsbGVl
KSBkb2Vzbid0IHdvcmsgYmVjYXVzZSBpdCdzDQo+PiBub3cgYSBub3A0LCB3aGljaCBpcyB3aHkg
aXQgbmVlZHMgYSB3YXNfZW5kYnI2NChjYWxsZWUpIHRvby4NCj4gU291bmRzIGxpa2UgZXhhY3Rs
eSB3aGF0IEkgd2FzIHRoaW5raW5nIG9mLiBQZXJoYXBzIG15IGRlc2NyaXB0aW9uDQo+IHdhc24n
dCBzdWZmaWNpZW50bHkgY2xlYXIgLyB1bmFtYmlndW91cyB0aGVuLg0KDQpBaCB5ZXMgLSBJIHRo
aW5rIEkgZGlkIG1pc2ludGVycHJldCB3aGF0IHlvdSB3cm90ZS7CoCBJIGhvcGUgZXZlcnl0aGlu
Zw0KaXMgY2xlYXIgbm93Lg0KDQo+DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9lbmRici5oDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbmRici5oDQo+
Pj4+IEBAIC01Miw0ICs1MiwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcGxhY2VfZW5kYnI2NCh2
b2lkICpwdHIpDQo+Pj4+ICAgICAgKih1aW50MzJfdCAqKXB0ciA9IGdlbl9lbmRicjY0KCk7DQo+
Pj4+ICB9DQo+Pj4+ICANCj4+Pj4gKy8qDQo+Pj4+ICsgKiBBZnRlciBjbG9iYmVyaW5nIEVOREJS
NjQsIHdlIG1heSBuZWVkIHRvIGNvbmZpcm0gdGhhdCB0aGUgc2l0ZSB1c2VkIHRvDQo+Pj4+ICsg
KiBjb250YWluIGFuIEVOREJSNjQgaW5zdHJ1Y3Rpb24uICBVc2UgYW4gZW5jb2Rpbmcgd2hpY2gg
aXNuJ3QgdGhlIGRlZmF1bHQNCj4+Pj4gKyAqIFA2X05PUDQuDQo+Pj4+ICsgKi8NCj4+Pj4gKyNk
ZWZpbmUgRU5EQlI2NF9QT0lTT04gIlx4NjZceDBmXHgxZlx4MDAiIC8qIG9zcCBub3BsICglcmF4
KSAqLw0KPj4+IEluIGNhc2UgdGhpcyByZW1haW5zIGFzIGlzIC0gZGlkIHlvdSBtZWFuICJvcHN6
IiBpbnN0ZWFkIG9mICJvc3AiPw0KPj4+IEJ1dCB0aGlzIHJlYWxseSBpcyAibm9wdyAoJXJheCki
IGFueXdheS4NCj4+IE9oLCBvc3AgaXMgdGhlIG5hc20gbmFtZS7CoCBJJ2xsIHN3aXRjaCB0byBu
b3B3Lg0KPiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpU
aGFua3MuDQoNCn5BbmRyZXcNCg==

