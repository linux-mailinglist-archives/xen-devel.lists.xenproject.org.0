Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0A7412FD3
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 09:56:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191502.341561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSad8-0007DQ-Ea; Tue, 21 Sep 2021 07:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191502.341561; Tue, 21 Sep 2021 07:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSad8-0007BR-Ad; Tue, 21 Sep 2021 07:55:54 +0000
Received: by outflank-mailman (input) for mailman id 191502;
 Tue, 21 Sep 2021 07:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/tM=OL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSad7-0007BJ-6v
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 07:55:53 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 572d21f1-1ab1-11ec-b89f-12813bfff9fa;
 Tue, 21 Sep 2021 07:55:52 +0000 (UTC)
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
X-Inumbo-ID: 572d21f1-1ab1-11ec-b89f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632210951;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pinY5uab9YMisebPyArXJODX0umXo3/vbcTOQVwGIxI=;
  b=LYkdYXvhnUKI6Dk//sJG9IiwQffMwBcGNh5yT9WRCF5rVu4Dk4WtXJnS
   BHzDNqFmvP1I0nyOromu4sALmeKCA/3t04OLVJ/CQHmlWuLgimV9V0ZQ5
   op90xxtRqExUWsdJzorX7sTce3DtqVK4qnX6rJohlyVXm/KmI6I0UTJwE
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mHrOAWfceGdnhFEUfhEVdWymLvnc+T620aCFtaCvFMxnDnixeVnmH0PnI6jGqzsCFUQmACpqti
 QxZeVmIGK4oThQ0FtwrdfYhiOH+EeP/SKnCzeAwFciPptRQQ0PJpEftlWkomnR753BXncFl27b
 sJRk4BQVsoTiFi+REtYLMjU2Kpm5iv0EgyKzJOBCh0LQ8lTA3HL+8mnFGxmRSTQB2/hxDLvgQ/
 rq47NZ4IiO71pMdnaERUPW3Ea9aRJMrdHgxbIAFxI5IHyiiJBDy29qH/8cF6oC5Npg9vkR+nAF
 XFuh6bjyqHwwXOFZviJd7VVt
X-SBRS: 5.1
X-MesageID: 53210432
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:z+d2a6+n356JC1ea7AAPDrUDqnmTJUtcMsCJ2f8bNWPcYEJGY0x3z
 DYeDW6OM/aJNGL8c4hwaYWwpE9Vv8eEmtZrTFFo/388E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6w79j29Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgp8
 u9nioTrTTsML5zVqvg+EAFVPCZhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFh21p3pwVR54yY
 eI0YmNudRmQaiRgJ34ZKao6teKsoifWJmgwRFW9+vNsvjm7IBZK+KjgNp/Zd8KHQe1Rn12Ev
 STW8mLhGBYYOdeDjz2f/RqEmevnjS79HoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiCa+hDQjQ4FUL8gr2Ri/1omX+wu2AXdRG1atd+caWN8KqS0Cj
 wHSxoOyVG036tV5WlrGqezF9mra1Tw9aDZYPH5aF1NtD8zL/dlr5i8jWOqPB0JcYjfdIjj23
 znChyw3nbx7YSUjhvjjoAyvb95BoPH0ou8JCuf/BTnNAuBRPtfNi2mUBb/zt60oEWphZgPd1
 EXoYuDHhAz0MX1oqMBqaL5XdIxFGt7faGGM6bKRN8B5qlxBBEJPjagPuWojdS+Fw+4veCPzY
 V+7hO+izMYIZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9HgOd3mXhhlT2MLX05pjz+uYejiLeuYe5tGHOFb/wj7bPCpwPQ8
 t1FMNCNxQkZW+r7ChQ7O6ZKRbzTBXRkV53wteJNceuPflhvFG07UqeDyrI9YY112a9Sk76Qr
 H26X0ZZznv5hGHGdlrWOiwyNuu3UMYtt28/MAwtIU2shyopb7Gw4fpNbJAwZ7QmqrBulKYmU
 /kfdsycKf1TUTCbqS8FZJzwodU6JhSmjA6DJQS/Zz07c8IyTgDF4Ia8LADu6DMPHmy8ss5n+
 ++s0QbSQJwiQQV+DZmJNKLzng3p5XVEwbB8RUrFJNVXaX7AyokyJnyjlOIzLuENNQ7HmmmQ2
 TGJDEpKvuLKuYI0roXE3PjWs4ezHuJiNUNGBG2Hv62uPCzX82f/k49NVOGEIWLUWG/uofjwY
 OxUy7f3MeEdnUYMuI15Su45waU77trphrlb0gU7QymbMwX1UuttciucwM1ClqxR3bsI6wK5V
 3WG9sReJbjUatjuF0QcJVZ9Y+mOvR3OduI+MRjhzJ3G2RJK
IronPort-HdrOrdr: A9a23:6pO8+azAnZ9S+vO1+FTHKrPxt+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WBxB8bYYOCCggWVxe5ZnOnfKlHbakjDH6tmpN
 pdmstFeaPN5DpB/L/HCWCDer5Kqrn3k9HYuQ6d9QYUcegDUdAe0+4TMHf8LqQZfngjOXJvf6
 Dsmvav6gDQM0g/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/jYsKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF7d2H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuBalqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw3RjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXt
 WGNPusp8q+TGnqLUww5gJUsZmRtzUIb1i7q3E5y4yoO2M8pgE886MarPZv6EvouqhNDKWtSo
 z/Q9FVfYp1P7wrhJRGdZA8qPuMexzwqC33QRCvyHTcZek60iH22tXKCItc3pDfRHVP9up1pK
 j8
X-IronPort-AV: E=Sophos;i="5.85,310,1624334400"; 
   d="scan'208";a="53210432"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBJFW/QMPLxcAscVnu1vAXb3++1QPhA9uJu5MOrlNDKmgByXur0IfAy3LQHLixk0/zyGyqoYd4DErXcdjAhie6Am0L66SdbFPAXf4zkKaumQMUsl7mmRjPCdqJAFPKngrJDwHzBydHuWqAqcpt/AfRNn+/ETXzrzln3FQCInHBcDK9JfmM6I3Gv2Tv0uYgu83iVHgFS4lfL4zua1uutDAPGqFFhKe4L0iKNDMf8qS86n5eAD2CUyBjmJBevyobppCWCRUiZ/LoPr7IzLcSlQOCYN5gDdveNDuNebilclUD2bUufBgA1E3lhBjjVUIfYRzRPkJbnagWpFO2pw3+WwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MBnF5FzmPnb0gAxehp+w3uDQohymLw4+XjrSrGtkyec=;
 b=Fxd8aWCrd7skIQkA0oseYMlOXrX8ordUliQXxop48+MvB7+ZD7x1kmbH41j42chKL5JVDcylDCNl4aDMF4+2wgS3xXmNikji+1QZTDcEYDdlbGTeDhhQsqXkfcG6gLFtIFZOGdaRxZre97QizbHZ6GANwv3py0smF+u2ErmiLcLojG5NaEFxXJgHYteQ2HmKKJ7LaPdgATCnj/PCJ7ApeGpWr6aZLzUgmrhJPFOOmyR0CGR38QQLfImrOXFQSQZJxGqJXnZH8bNbtA9yrADiE+I0iGkcRjIeg035TTBuLDnCg7kvcFCeljcNaGTxfGOT/DX96FuUKsg9Q8KRfhlorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBnF5FzmPnb0gAxehp+w3uDQohymLw4+XjrSrGtkyec=;
 b=vE9Zf7yfUydctgeGLE94muBKx/E1S+O89ArqSz0ZX995bBqdIA/8kAiYam+ogCS4zxeqVRb8hZt8COsqRGdG7bRMX6MnP0kK+nvWoaUgHrD93VIwMJO0NSLIjKkFegpgaYdXoT8xAywsJfYFMinnwvgxUtqRpA+6/fewOorfMhA=
Date: Tue, 21 Sep 2021 09:55:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?B?UGluZ8KyOiBbUEFUQ0hdIHg4Ng==?= =?utf-8?Q?=3A?= drop a
 bogus SHARED_M2P() check from Dom0 building code
Message-ID: <YUmQAIGJaK+Uh/UT@MacBook-Air-de-Roger.local>
References: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
 <0accd732-71a2-b122-6c7b-bb8fc8b0f3cf@suse.com>
 <27bd50f4-2216-ceb2-437a-f9eaa8f7c019@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27bd50f4-2216-ceb2-437a-f9eaa8f7c019@suse.com>
X-ClientProxiedBy: LO2P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35937447-d0b0-4891-bd75-08d97cd53a16
X-MS-TrafficTypeDiagnostic: DM8PR03MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR03MB6216A6D566C20718BCF566178FA19@DM8PR03MB6216.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: moaGhI8htQ21qgBkquTl01/fHEhG9ddH0DXLqR2sBLWZndbEOhlTEcNKCBM9rZSaBplLLkm9/0uEr4NlUvjSulu10wjoXO5fvq6U0RA3BzwjgLDzcXMypkTXllF5cXohlPSC/g39T/SI7LDus5FhOAP9MwuVYlM6c1hsdHhIECmSr3ZxboPfEZ4p5cECTY5CDOFj3cA+fHDUUtkNNnZ8kwKgZX/guV83a4MO9NRdHxwbmuZkbm+CuUJn4EpZIqCMW4irF4plzB0WyQdSchFK+wYuPo4uQHy2tn/PHmbuv2Sb1OPeAF6L8rhIxuGjiUpZnabYJyeGKc702LRKS+iTJB4VBolPkGK0LeDIdMs7GHVE9WUzSX7AXHWF5gcrUcn2AkFwkeQxlpjkFiVdPrkha00NVuOqiysYrZT/9MPOb2bas0QO87/un0r2jP+i4I66oWmPCXswZAotBMw4JA2CzRwzwoWdjLWSQq6AOeM8GNvw3UslqJB7w10nR0JWZMw8w7tGHbWW3mZ//AmXu5s49oaUE3AoqZbomnDhDqTkSjeFIr1+4KF0cxYob25LytUUMhO7X0X0XSzzAhGw6XxIduHfT/XRuTLAT3/dGzhzfjZaDvuauMAaZm9HsiQ+GU1xpVb56sGoAE6GkbWI+B+euA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(5660300002)(186003)(6496006)(54906003)(66476007)(508600001)(316002)(86362001)(2906002)(26005)(66946007)(85182001)(8936002)(66556008)(956004)(9686003)(4326008)(38100700002)(4744005)(6666004)(6486002)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGJOaVBPT0ZjbnFHdzdyTmZScitUa1R4OSs0SitrbURhOEhqVkJMNjc0cTB3?=
 =?utf-8?B?Tlg5UUxZb2xKK09UdFhmL0p4bDhDTjVaY3RkK0Q3TkFBc2NIM2RzUUhaRXRE?=
 =?utf-8?B?WWNjNWNaVUE0azUwQmxvZFR0MElsWGtaeGdQMlkyVE5FVlBwUzlPOWFVYjUz?=
 =?utf-8?B?RjRvVzdINjVBcUpzR01kaTZYSG52OEUzci9CSzIxdmsvM05CRUZjOXlHOGNx?=
 =?utf-8?B?THBVNnQxQStMYVdqSFFzRVZyRXRxT295OUNUTUFBWEVYd09XbHNtenVZSUtN?=
 =?utf-8?B?dVcyOFJYRTAyb2NSRW1CQ2xOM2hWYlpUa21LTnNyNmI2VktFTkFFSlQ1ZjRB?=
 =?utf-8?B?Q3FlOUxCOE4vTGZ3OHZjWHRQd1J6OTUxeHA4NXcvVmZWakdrb25MWXRxOTlX?=
 =?utf-8?B?cjV5ckg4MDM0K0R2djVvWG4vL3l5WmUzcks3ekY0YnIvdDQ2YTRtWVV5eG55?=
 =?utf-8?B?MldEZmNxbE5nQXUyQVBGN1UzekZhMTh3UEkyeHlMNFZmUXlLSytXREo1eVpi?=
 =?utf-8?B?a1hMSk1HM3RUMXZwTFQ4WkZuanFHMGhLanFCVHVwWXdRRzc0dWpXaFVzVmpO?=
 =?utf-8?B?Z1gzTmExL1FOODN4eGpzWHRUNk1pWWtCYW9lU0Y1SDNMVFBVK3QwZFA1dm1u?=
 =?utf-8?B?N2tmVkw3cmFKTnI3UGV6eUQ4OTdVKzVpaWtRUS9iTjN2aHZKV0xiRVVWTDJ4?=
 =?utf-8?B?cytGd1VUai9sTDJDMHFSNy96bXl2K05JRjk2S0UzVkJhLzhXNzdUaDJldnRS?=
 =?utf-8?B?d1R5cVpPeUxFMW5JWGU3RktkYUdaVkVaZmFnaU0vbEVqakN2M0NNRnExVlJM?=
 =?utf-8?B?cEFFbkNWWVF1dkQ5UFlvQXhES2JhWFk5RWszN3ZSajFubWJBaHBxaVRZa3JI?=
 =?utf-8?B?WWMvSWR1WW9qUHJ5M1dyeHk0NlZIMmVDNitCUWZFMjVYcmREbStpVUxyaEVH?=
 =?utf-8?B?SC9ZM0lXa0VYMG5HNlgxYW95WnUrM1BNNlMyOXdSVnVPdWdzcjZZd0xuQ1pU?=
 =?utf-8?B?ZlVzWGhUOHFoalpZRWM0NElhUDFhYmFSK1Q3NXhVK0h6VThoa0MxQm9vVjVZ?=
 =?utf-8?B?TXFxME9wUndlU21WSWNHZGo4ZmxpVkVCSE1Fcm1QY3dYNEJSTnRlekVDVzRK?=
 =?utf-8?B?YWkyR2JaRGxaOFZCOFg3NHFUU3VtZlRPZGg1NC9sL253bHZkcHp2bTBKMlJB?=
 =?utf-8?B?cmRFcGN0QkRYb1ZYWDdOTmZYclJPYmZHUW40Nk41WFdQb09nWUVkcFA3TTN3?=
 =?utf-8?B?bVZudm5JVldLTWNQV0tKNEVjbEJaU1pFTnBBYklidjl1UWM1UWdQMnNCZkh6?=
 =?utf-8?B?YzFTOUlHelNqSXBzeFYzU0E3YXdvK3RxdFppa3Fpb3BGdGRXZEQ0UW1HeDhB?=
 =?utf-8?B?SkxFRmk0M3MrbXhtajRSZ2EySjA4NnlBSkFQbU9EZ08waEs3WTgwUy9tR1JB?=
 =?utf-8?B?b2I4N2t1YjVuNmthdkdPUnJ1MXBYUEFmc3NTR1ZUQi9VMHdNMGtMNGxjUDFJ?=
 =?utf-8?B?Q2tDTHlYbU5iMzZjR1QxNHZETWJCeFIrN0Z6SWJEVkdIb2QwMHJEWkdoOEFh?=
 =?utf-8?B?MHZDdm5lYWRBcm1sZ0ZocnJMZCsvREEyb21hanpkRENrSDQxWGJ3RFJuNzhF?=
 =?utf-8?B?M2l1OEVqRzV0RDJZdUxEMEg0Nm5UTHNPVlhLRlBDakQzY3VjNHhudHFWc2dM?=
 =?utf-8?B?UzNHRU5CUHQ4QzlqeEVidWxwUW82a21XRUJvZHpjVkd1MGFoUnZlT3Bnbzg2?=
 =?utf-8?Q?8S13Ua98dIbikX3YdqXu7U51djiMg2Jo1sTThOB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35937447-d0b0-4891-bd75-08d97cd53a16
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 07:55:49.4720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1roL0l2CG8YobhvfgbDdDQOhbV4HOSlDhGIYJYT0Y45Q5Q7pWrXqG2Di0CQ3NPsZgg/U3V9SYIFYRUj/EeVi5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6216
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 08:10:12AM +0200, Jan Beulich wrote:
> On 06.07.2021 09:37, Jan Beulich wrote:
> > On 28.06.2021 13:52, Jan Beulich wrote:
> >> If anything, a check covering a wider range of invalid M2P entries ought
> >> to be used (e.g. VALID_M2P()). But since everything is fully under Xen's
> >> control at this stage, simply remove the BUG_ON().
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I didn't expect this to be controversial, so may I please ask for an ack
> > (or otherwise)?
> 
> To be quite honest, I find it very strange that even simple changes like
> this one sit un-responded to for months. This isn't the only example ...

Sorry, I'm trying to catch up with reviews, but after being away so
long it's hard to figure out what's pending.

Regards, Roger.

