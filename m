Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF31E4F580D
	for <lists+xen-devel@lfdr.de>; Wed,  6 Apr 2022 10:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299725.510855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1JZ-0007WZ-2X; Wed, 06 Apr 2022 08:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299725.510855; Wed, 06 Apr 2022 08:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nc1JY-0007UA-VD; Wed, 06 Apr 2022 08:46:56 +0000
Received: by outflank-mailman (input) for mailman id 299725;
 Wed, 06 Apr 2022 08:46:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3N7O=UQ=citrix.com=prvs=088976f43=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nc1JW-0007Tz-O8
 for xen-devel@lists.xenproject.org; Wed, 06 Apr 2022 08:46:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a676cf5-b586-11ec-a405-831a346695d4;
 Wed, 06 Apr 2022 10:46:53 +0200 (CEST)
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
X-Inumbo-ID: 1a676cf5-b586-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649234812;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=APg1bhKeCj6ByMGr9w1gdc9cq2gqOYu1WoMxhN8arjw=;
  b=GfiBxQXKIwmqFeOZzuPcChNL7RQ3bdiV9JW3PnESKuUROWrkMhSx/xis
   vlu+nsrWObBKOX7OvgX+JSIlIbB4Jmb+S5gMTpPvBZjpLAhxCibFHy1w9
   I5TpV1YFxrOXDaYkwltpG/2Oqaxce5IxPaLWd3d8AWgYvAoa1BRTE8X/f
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68542660
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:a2Jp/KMsVZG1jV/vrR1Hl8FynXyQoLVcMsEvi/4bfWQNrUog1WYPy
 mUZWDyHbqmDZjP1fdhxbo3ioxhQvZeDm9FlQQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tAw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 9ERp4y+QD8VJIL8msEQAzlCNHhsFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmdt2poQQ662i
 8wxMmQwcDfMeCd0IwkmNpNho8ONwSf9bGgNwL6SjfVuuDWCpOBr65D2O93JZpqGTNtUhW6Du
 mvc+23zRBAdXPSTxjaI/WilrvPeliP8HoQJHfu38eACqFGL3WkSFB0+XEO2u+WkkVW5X89DK
 ksS4Wwlqq1a3E6hQ8T5Xha4iGWZpRNaUN1Ve8U44QeB0LvJ4C6WA2EFSnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdIjWs0
 SCEpRACnZojj+sGh4Wh2gnVqmf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOvxj8tpJgEwlrKG83MJ0z22s0CucolLiN2VDBc4a51UEdMFj
 aK6hO+w2HOxFCbyBUOUS9joYyjP8UQGPY67PhwzRoATCqWdjCfdoElTibe4hggBanQEn6AlI
 ou8es2xF3scAqkP5GPoG7ZEgeN7lnBumji7qXXHI/KPi+T2iJm9E+ltDbdzRrphsPPsTPv9r
 b6zyPdmOz0ACbajM0E7AKYYLEwQLGhTOHwFg5c/SwJ3GSI/QDtJI6aImdsJItU594wIxrag1
 izsASdwlQug7UAr3C3XMxiPnpu0Bs0hxZ/6VARxVWuVN48LOt/1tvpALsdpJtHKNoVLlJZJc
 hXMQO3ZatxnQTXb4TUNK577qY1pbhOwggySeSGiZVACk1RIHmQlJveMktPTyRQz
IronPort-HdrOrdr: A9a23:bBHw8aNLzmu4n8BcTy/155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjztSWVtN4QMEtQ/+xoHJPwPE80lKQFm7X5WI3CYOCIghrMEGgP1/qH/9SkIVyDygc/79
 YQT0EdMqyJMbESt6+Ti2PUYrVQouVvsprY/ts2p00dMz2CAJsQljuRZDzrdXGfE2J9dOUE/d
 enl4J6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr10jegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKva/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdY11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj8lLYIk7zI9HakGOup5Dt
 T/Q9RVfY51P70rhIJGdZE8qJiMeyXwqSylChPmHb2gLtBCB07w
X-IronPort-AV: E=Sophos;i="5.90,239,1643691600"; 
   d="scan'208";a="68542660"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBtA8yQjZpcduh9FDP289GA49nBvEIYKdNdI45/K+JgM02a42d9vx/fKP20pq6soC2dIg1/i1awCFY+ZIRMyHuIhhZeIzh9+ZM1e0oxLt+FBlJteJYR6UY3hgassmuP0lH2PlA7/bJfGkAPyuVdWeHm8KzgEsjGxq7Ndj3W00iMj3rlqi+EFObG0xFdvpwEQ6s87/bbzh5Y3+FLfg0CDZwN3vbTmQtYBDISR2kOuylHgArjOltZ6Sd38G3Y0BZSWmVXFuo5CxstfLqX7cmRwmuwsYbxsI5BsM3nPvgz5Zz6y8AtQLnLVfRkJ0dHj0uv1l22fT23om0BcrPd5Qi7mMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0muEHvo0OwrGv5vA1iAbBVjF4EhQfRHpE8xOPgmp3Y=;
 b=HP4I12Vfo241nQRbIh6Lygyu/J75o12vz7/NNlTNMoHYbBGGZBiZaGS/L7FAZLH4y03J3I6dAycFbqluKI4tq2xnZAnLdn2ctUjQEIvS1K9I4Ey3PZdtwXdzGDeACgGkXnJCjxa4Xgn7wyoOW0/cLDGbmy7hFWAXydqleeqEHlJOIH7qHlIW3hUHo5b81NFE2Uyklkau552zyBVC/As1/8pQ8sCIEhVQeNtyCRJB31HVs0Sv387M4+YT9jpaXU5GBdOjUx90c4pMxEYfULbzl69S6REZmIivP+Bbdqs6lF6f+W1fbFMAdGds51dmUh09w/oa3ZcW6I5qszH5OkNaug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0muEHvo0OwrGv5vA1iAbBVjF4EhQfRHpE8xOPgmp3Y=;
 b=VUQ2DAvshoXUXkb1KBAvfycRXtaAzqlsd1GrQX9ZEeGZV0NZOTjkkmk6CoPF7ULLTz8ntp15AomtX/SJ643d/i1vIAIDCnLGdq2sGcVR11Cw4/PVY1H2ua1rkyGStTxL8VuHWLisjjskpBMW/Xl3jnrIsUdz3eAtrNoJpJm6i6U=
Date: Wed, 6 Apr 2022 10:46:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jason Andryuk <jandryuk@gmail.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Scott Davis <scott.davis@starlab.io>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <Yk1Ta9ujHBuj+svN@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
 <CAKf6xpuA4hQmPdBtmog1UFcSQQkXL2=+e5bmqeocesgNxqD27w@mail.gmail.com>
 <1eaf4555-5221-6cef-6c01-6aea3797e521@apertussolutions.com>
 <CAKf6xpv0LrmAa2A=dXXK2DSRh0j8ac9VM4aLBhTRK0MtnML0Aw@mail.gmail.com>
 <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a4759948-d45c-df06-3130-f95aba05b555@suse.com>
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c51ae77-2d88-4677-7207-08da17a9f7ff
X-MS-TrafficTypeDiagnostic: BLAPR03MB5634:EE_
X-Microsoft-Antispam-PRVS: <BLAPR03MB563435E9D0C668D43B213E238FE79@BLAPR03MB5634.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BW8fUjah0YESTFrh8TUDz7Bwf4fsh1c59gwB7MogAAIoQ6No+0fzyGcnEc4w3Xy6l0RW7I/ot8IFjkbr/xJ8CxWCHTEWLFOx0ImrXGJCjsXE9tcPdUtM4G0KqwXNNek2lDp2/KjsnhR7S5JUFjt2rujdW65YI6CPZYsNip8wtqW1q8fkkp1KOI4It3IRqcQJMtlDiZI3YeRWlsXWdQAmhWT1lXQ4kDeCDKM5MqY65GBUqpG3rJwcJHiXfO9hrJt1KebQo0P4tgAKp7sNGC7ZmSaPtpr97JIZii2/dse4jM9RoFJ32+rRhxKtq9gld1hcc/nYMUp7o9oLu+ML9vJ84/eT26IZzOJ4UEdn2ClhUTrYOvmMyyjxUfXH+/fNbqdruWAJUYMpyoKWQ9CG6BgwAWk+8oxAnceqoS5Y1JPUKXCcPXAWvEKBEkYkCxqRCHiZTnAOzPP76U2kmiYHkkuU0YNIWTef2awHBbPlwsb/h3so7ToM57zYGb4l81Tob8LigD+BYCDO4BKOUyyXxjTTaQGjl6mT/jUdQRFgwq3N9h+eWGbE2QCWP0lFz1wPJcx/cNVbeqYacDSfS7RQitCqujOKII9rx8PEV8iq/l99XccaOIGsen/+Rz0Z48CJDe9miM2abo/Go6hwfFdtYXuRmYU2JajajQ+kA6H/ye6p4ccgUeE8QOSjpu1T3jq+dzxye2nEc64ebtWAr9to8kVlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(86362001)(8936002)(5660300002)(2906002)(38100700002)(6512007)(82960400001)(9686003)(26005)(85182001)(186003)(508600001)(6506007)(53546011)(6666004)(8676002)(4326008)(66556008)(66476007)(6486002)(83380400001)(316002)(54906003)(6916009)(33716001)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVPcmx3ME95YTN2TTlUbFhjMWt2WitlZnkwZmVjOGhpQW9FQ1lSaUo1UzB1?=
 =?utf-8?B?VFRDNUFCNzJrSURtNVBZdUU4ekE0MURFWDBiNGgzcXBvV0hmQkRXVXlDTU9Y?=
 =?utf-8?B?eFFwcTJqdE5PRGpyYzNCMXVMZmZFL2FrdE1nMTlRWnIvZ0Ftek03U1Z4cTVE?=
 =?utf-8?B?c253a0VVdUdHb0FKUWFjOWtUYWM2eXhRTzY4WXNYWUNsT1B0VExIVEhwQmdV?=
 =?utf-8?B?bk9VY3d0UDF4VXpYT0ZtbXovUVJwZWtuMTBTaVVPU3cyTk5XQ2htRno3bUNY?=
 =?utf-8?B?STBoaXNJS3hVRmtBelNLZ3RTRCtHUms4ekVpd0VaVHFJcGtDRC81ekFNb2Mv?=
 =?utf-8?B?YkRGUTd4YS9ZOENRd241OVU3b2V6SlgvRk54QXhKb091Q0JIUmxTODBrTjF2?=
 =?utf-8?B?VG5QV0UzRXo2b2VjT2Z2VVdwV0VmZEgyK3ZQVjgxWTNlYTk0TG14VzNuMEtp?=
 =?utf-8?B?d2hoYVpXOUMybXRvMENEMEFkTkV3THJVb2tIdWoxUXkrVWtjSThiM2pPdFhT?=
 =?utf-8?B?dm5xU3poajdLMnlxZGs2bnhrRmhJUEs3K1RXaVFmdnBDNjV5LzJoQkoxbm9Q?=
 =?utf-8?B?c2ZLZmFYcjcrOWxIZk9XWGFpN2RTc0xCZEg1MTZJNkk3aUZtZy9KS0VwSFBO?=
 =?utf-8?B?TjlNQXQ4OFB5T3VrWDFVYkdUUjU5MExhbzZjdVZKTlNscXpnSENCSnlzaHk5?=
 =?utf-8?B?cFRiVEI5V3BHMXgzd1hidTladi82Vll6STBDSkQ2OXF3NEIzWll0QmZRbkdG?=
 =?utf-8?B?WXYwQ2c4ZVNSSy9EVFFJWStDT0UzRFBYbkpkVFlSWDZNaVhacTdkQW9JN0Fw?=
 =?utf-8?B?dzJKaGxBSTRIWlVJUC9va0FrcElNSmFnSWRKbjI5VFZUNnBhRFQvRy82VzJq?=
 =?utf-8?B?UitEK2doMDBvVkdYRS9nZm0zS1hjOGc3UFFCWXloSm9GQkFjUWtPbjRudC9K?=
 =?utf-8?B?Q0JIdGI0OHBPVFZCamdsMDN6dGV6d1JtVWZmMFlpUnRzQUtzOTdLZEJJamhB?=
 =?utf-8?B?T01XMm1CaUd0cEdBWjdYcWhYNHV6cVUvdTNlWDI2RlRlazhQTlNhVWVQa1li?=
 =?utf-8?B?aGpURkJSZFd0UWhCNjF4dXBEODZ5MlhrdnRRK2hWN05XTEM4SnB6UWZ2RVRP?=
 =?utf-8?B?YjdkbDRkeWZtMVcwejY3WEppVkgyZHllZkVvdFhIZ1ZyL0JCaEsyZkxEWEp0?=
 =?utf-8?B?bUhMZEhaVjdzQ29ISzlveENnQnRnSURnR1ZzNHZoRDNRcXdlWFR4Q1hTOE9v?=
 =?utf-8?B?TWtZZXpzSUVlblU4SHpEb1E5VGE2N1NSRG9rb25ZaDhNSEVyODRHNmhIS3BE?=
 =?utf-8?B?NWt3QW00eFNiWVR6cDF3NmFXaUJBYXdnR2xPZy9HSHF4VnZJek9GUGsrQ04v?=
 =?utf-8?B?TVRHaUVZYmF1MHdjVGltTll5dHhWK1ZPbE10MUpOSHBHc0JjWjZvUkJjRlE4?=
 =?utf-8?B?QS9YQXphOWpxeVlpZEpzdTBvSDF2QmR5RjJIbjdjbEZ3UmVsU21qeU1zR3dr?=
 =?utf-8?B?NnpnMlI0akpqS25EZGdYY3BQakY3TWZGNGtTUGIxV3I2QlhMQ3RWdGJSL0hZ?=
 =?utf-8?B?b2lFVFNCQzRERzA3V1I0TnZDUjJEOFNkVEV0Q2pTL2JUVG1lTWg5YmR5QXJF?=
 =?utf-8?B?d1VTQkNxVWR5ZXkybFVRc1pwS2U2R1BvSEp1YWFPeldZYW1YYWY0VG5ZSHE4?=
 =?utf-8?B?aURDV1RCUTd6amxBbFNwSTRvbVNLRTkxQm5kdk8xTUNzK3JRRld0UkRIUmRL?=
 =?utf-8?B?emRCT1FqeXB4amt3WXFQTHJrTG5hQTFldmQvV2lpYnNBRkdpaUdIdVRacUJM?=
 =?utf-8?B?eW1ndU5ES1poVExrN25vMmxrRzRNRHp4TDNXYlBqbnN4K1ZGR3NkdXpaNkpC?=
 =?utf-8?B?QW8wT2RORU5TemFwOU5HaTUrc3hnbUJOTUdlU0tGMC9zdU85Z0NLYjAyRFlZ?=
 =?utf-8?B?L1BzMWttMkJaNUllVlVGQnA3bnZreDBFbVdwOUdqbExjRFpGUnNhMm5JMFNR?=
 =?utf-8?B?dUJRMWR1QS9JalpGY1pBS2Rkc2RwRSszRGVsNk80blBicnRCa250eXVFU1p4?=
 =?utf-8?B?UlAyZGhTSjBUaEo1ZzhjYjZwY1VoV3VzWTNBWG9tSjJ0aW9oYmxPRlkxTmNI?=
 =?utf-8?B?S3oxVFJXeGJQbytwTjBUYVZVRDlPdllRZHNPc2RnWEREMFBjTnhidXdxRnh6?=
 =?utf-8?B?WlV4MjVwdDFRa1NoN2tTelRZaWJxU1pXRU1vWjc1emZacnBZWUdoSHhreUZy?=
 =?utf-8?B?QzVmOWVSTXc3Z2M4Z045OHg2Y1pNemc5NHBUUGU5YmVuYzdKRC9lQ2tFVnJG?=
 =?utf-8?B?RGltcllTcm1rMXhiVjl2RDlIc1QwWGxXY1hWSFdTcDRqZW9XMGFpcWVRVTVk?=
 =?utf-8?Q?SFQa3rJzK1qBYFK4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c51ae77-2d88-4677-7207-08da17a9f7ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:46:40.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maMAm7wIXHvKGvNv30DwF4PwxWktvHCJK8o1WLzBbBhXhR/VgPr/W/HlkR/gi1UfcJm83jysjI/GRPRfofSdwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5634
X-OriginatorOrg: citrix.com

On Wed, Apr 06, 2022 at 09:06:59AM +0200, Jan Beulich wrote:
> On 05.04.2022 19:17, Jason Andryuk wrote:
> > On Mon, Apr 4, 2022 at 11:34 AM Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >> On 3/31/22 09:16, Jason Andryuk wrote:
> >>> For the default policy, you could start by creating the system domains
> >>> as privileged and just have a single hook to drop privs.  Then you
> >>> don't have to worry about the "elevate" hook existing.  The patch 2
> >>> asserts could instead become the location of xsm_drop_privs calls to
> >>> have a clear demarcation point.  That expands the window with
> >>> privileges though.  It's a little simpler, but maybe you don't want
> >>> that.  However, it seems like you can only depriv once for the Flask
> >>> case since you want it to be one-way.
> >>
> >> This does simplify the solution and since today we cannot differentiate
> >> between hypervisor setup and hypervisor initiated domain construction
> >> contexts, it does not run counter to what I have proposed. As for flask,
> >> again I do not believe codifying a domain transition bound to a new XSM
> >> op is the appropriate approach.
> > 
> > This hard coded domain transition does feel a little weird.  But it
> > seems like a natural consequence of trying to use Flask to
> > deprivilege.  I guess the transition could be behind a
> > dom0less/hyperlaunch Kconfig option.  I just don't see a way around it
> > in some fashion with Flask enforcing.
> > 
> > Another idea: Flask could start in permissive and only transition to
> > enforcing at the deprivilege point.  Kinda gross, but it works without
> > needing a transition.
> 
> I don't think that would be right. Logically such behavior ought to be
> mirrored to SILO, and I'll take that for the example for being the
> simpler model: Suppose an admin wants to disallow communication
> between DomU-s created by Xen. Such would want enforcing when creating
> those DomU-s, despite the creator (Xen) being all powerful. If the
> device tree information said something different (e.g. directing for
> an event channel to be established between two such DomU-s), this
> should be flagged as an error, not be silently permitted.

I could also see this argument the other way around: what if an admin
wants to disallow domUs freely communicating between them, but would
still like some controlled domU communication to be possible by
setting up those channels at domain creation?

Thanks, Roger.

