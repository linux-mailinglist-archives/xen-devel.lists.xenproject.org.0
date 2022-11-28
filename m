Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A879E63A6C7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 12:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448884.705456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbyu-0000SA-PW; Mon, 28 Nov 2022 11:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448884.705456; Mon, 28 Nov 2022 11:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozbyu-0000Pe-Lx; Mon, 28 Nov 2022 11:07:24 +0000
Received: by outflank-mailman (input) for mailman id 448884;
 Mon, 28 Nov 2022 11:07:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ltHO=34=citrix.com=prvs=3247ff6ef=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ozbyt-0000PY-SV
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 11:07:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4107717-6f0c-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 12:07:22 +0100 (CET)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Nov 2022 06:06:59 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH7PR03MB6969.namprd03.prod.outlook.com (2603:10b6:510:12c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 11:06:57 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 11:06:57 +0000
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
X-Inumbo-ID: d4107717-6f0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669633642;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Wo5sEsiSiluNWOP/bP2iU2KV4YvsdctqfUE2ywWuX0Q=;
  b=NxZe9zxzlhnjHkqv+09s+Aa/dRc3J+4sov+TgKf/7ghmYS6+gdrUH7N0
   UybEslMfwg8MDDsUSxUrtnJ3Uz4ojCG12OuT3JcmNrMfn3at5t3194BIk
   o5vDDQwXyjzEDGsA4bNvZKWQks9/rVXc1Qink+L5IDeKR8j5yrUhJ7GOF
   w=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 85232538
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rqZHa6xxlSQfwQYhT6t6t+fyxyrEfRIJ4+MujC+fZmUNrF6WrkUHy
 mpNUWyGP62CZzajLtx0YI2w/BsHu8DUz9VrSFY//yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnP6AT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVxO6
 cUjGTEuUg2OnfqS0bGAYOddjNt2eaEHPKtH0p1h5RfwKK98BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjmVlVIhuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE1rKVxnmmA9J6+LuQysN2gHedl1UoEQA3CGKRrP6BgGOAcocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS8AiQzoLE7gDfAXILJhZebPQ2uclwQiYlv
 neLgtfoCDpHoLCTD3WH+d+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65uAZAhn1y
 jGO6SQ72bMaiJdR073hpA6XxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTdKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:dTQBvKElrfbe9l+qpLqFgpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tPKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU611rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtogPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZ3IAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32MHQqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5YUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up/pH
 34aiIYiYcOQTOvNSXXt6c7sSwlAV/NEAgF8/suqaSQ4dbHNfjW2S7qciFcryLvmYRbPiThYY
 fDBHtnOY6dEYLQI/c24+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-IronPort-AV: E=Sophos;i="5.96,200,1665460800"; 
   d="scan'208";a="85232538"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZwevQZRQ8Kb+Dq0wQAxTP61h0Dq5Zq1UknEkIqxkkMjV+QGKiJgRPcM4azoXvpyqC+8TIb+bVZZ0jqMY0eY8qek9BXkhBVXGLKHfjBVyQRLxSHNmd6kJfGCAZv0b73jLzDS7kNWDVkSaGI2yCuo5T7fZCoaRgStgmE9M1LytR1YZ2hvflolzhCbWwkEb6nQ0yUoCxm5gl4fJ3EnUP2KZuN83kWMVSvK/ee32TDxtzRsNqEi6a55Una71i+dxVlzN+TlH1iCKTq/TMGEVz6r0D2DbCr+Vi1cTlMRAKaXqLq2IkBEMAH9oJUuF6zEwKJWJi1vsHX5p4vzxMoegJhMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYMcg9OfEUIYPH64Wy/RlaqryI1n+V9p+oLi3+s4AQg=;
 b=c4z0BIjyedZfqb8ck8aMwJWw6/1CUKUQUahgnKjxjq2kAwxka/pP0W6w/Q/iZqhQJKn5GUbBMQHnorrJtZSSbiBv/GaYH0jAboskXiicob27Gm3uk53rJH94bKgQYINNfcoiXzxhDJlsZZiFqlpKPjiOqXZbQfNZ6DOl8LGhXeYcpdxgKREVvhDCePDg2aGu7W9nMik1IypoR0LU46lh4Kmw0GpZQawAhVbSZ9ArBEFjC+NN3CC5+YEui/mA1XTak6w9innYyfU0SVLWuniVOLnGU08qHIrFsJzX3Xm6aUUgP4I1hWYTne9XYgkUuodlv8exXwSnCQ6PVwCROIgDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYMcg9OfEUIYPH64Wy/RlaqryI1n+V9p+oLi3+s4AQg=;
 b=Khr+w0qTUHJtGvonSWEFlKh9a0QXzVwNCoOD9m/PexcD4ZtY12e9SC7AvLlYltSZ/rLTTTwHECO1q0ZKFvPA8eT4DRd3AEVzj1Oui5rNZStlHB0fFhlOYQ0SYkzXBwMlRwQ6xS5qDjJ3hBv2s5CoJtOuVerS1TqfJCfXAEIVtUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 28 Nov 2022 12:06:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Per Bilse <per.bilse@citrix.com>, Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ioreq_broadcast(): accept partial broadcast success
Message-ID: <Y4SWTceb13wfRimb@Air-de-Roger>
References: <06ad4b3a67a15192fc986b35e3f2fcd35b2f4c2f.1669383767.git.per.bilse@citrix.com>
 <d7a42f21-6dd3-108e-9278-74d756d941e6@xen.org>
 <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fdc2eb93-2b8a-f3c9-82b0-5d4e90ecda9c@suse.com>
X-ClientProxiedBy: BN0PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:408:e9::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH7PR03MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1af4aa-62f5-40a9-78f4-08dad130aa06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sprFEdglsMkgkapRfickn8OW+plXgR5e4yCCDN9QP09WOSHwkXOuK9SCdKUI6Qs9fIOv8ZNhyyPaKXhSfA1+YiZucwu/3/pCEcmn0PmDbxYnn4+amBEBLho3mGGK4R75B9XmvnXXzPuzm3cykdlRx36MrwwVcM0SXl94djHHA8W6Dw6b72W+cyYVcrbQcLragFda41++qgU+cLUcrTlikA8e+2HL5kGERtQX27yST/JtRgjz78A+RaD987kHwdJIU+OlSvhnj9pvzvslPvnbEiD1f0OD7pTIBLlWnqUthJ44/tVQCWJSuB2fayV181TStvFtAefm1eCyA6laS0h1QdsoZN9iNsvwelAbLnVWKVYqBvHohOuS/f2Bymu6tD5ehjcDdYSAxV3PTsxMm5vmxfZ7AbkUJKO/Z8ydSXtGEYUedQp8nqcRMxi6I9I1nSLeRluHlKBjhtAZDnEzxThrfHIoJZXCEehMqn1ZfLQaesfbztQdevLeN1+sid1bIXhoVT8wFU7qaDVqFcMGQM/V9J8C+IABoi1PwC2SrdGbHLwBtxNHeK+VlUpBDhCFIPy8Cdt8klKRC3CmCwra2vTFALxeNH8h36aFusRSvmS6GMVz4LLn4n4QoeSa6RDGdGbM+KNGPwc6dohO5QwL2IUF0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199015)(41300700001)(6666004)(38100700002)(86362001)(82960400001)(26005)(316002)(6512007)(85182001)(6506007)(9686003)(6916009)(53546011)(66556008)(8676002)(54906003)(66476007)(66946007)(4326008)(2906002)(83380400001)(33716001)(5660300002)(8936002)(186003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L25vSzNsWWUzZXBWSjRCSFRUdlJLYjhTQXREN2tXNWNUZllhQjk5YlpXaUUw?=
 =?utf-8?B?clJZV2RuZUZQZm45T3NPU1RMWk1TOEFkNmF2VlFtb0Q1aElNb1k5YkxZWGZq?=
 =?utf-8?B?cTE1WjBSOEF0YjRhN3E3RDBUYjJOVlpyZFJ2RUtOR1JZM2Z5T2VoVVZQcjAy?=
 =?utf-8?B?RCtrZ0ZHeSs0V20waU43Y0p6K2ZXSFludDduVWViMFhWR1ZIVHpOTHJFdVlT?=
 =?utf-8?B?U3JQQnVQRTM0OW11azFvRGxwcCtNcEdQSTZhSFhtaFNwSGpyUlFRV2hNN2Jr?=
 =?utf-8?B?SFlQNWVzRmRybDlzdGcvME5zSitDRDJpL01tT0w2Y0VXM2g5bitpM2tSdDlw?=
 =?utf-8?B?QUFLbUxQS2NTT3VoMWNCMVVHUE1ybmJ0Z1QwS3VVVEx3RDNmY2w1Wk1DVCsz?=
 =?utf-8?B?ZEtrOTlJWjI1STFlU01QSnErY0FsMnI0eEVGL0JsRXc4QWd0TUgrSnNzS2RU?=
 =?utf-8?B?UU5xcFJLVS90K2FYWE5sQXl4WHEzZ0UvSEhibWMzcDdnbmNwZk5IZUZmZHAy?=
 =?utf-8?B?S3RybjYyOXVpTTJWdW40ZGpENlp6K1k4dHFoL3RvTFRTNVN3WWxpcHZFUENx?=
 =?utf-8?B?QVAzTEZkR3REdXNZeUUrc2xMRFVpZTdINnhzQVVHMEcvQkdGR1dFaWdzR1Fa?=
 =?utf-8?B?ajRlN0ZqblhWamtoTFVVR210NFY5REhOZG9ZSnNvRFlZYjFzSm05YlFLcTJU?=
 =?utf-8?B?YnVWSUpvaDFLTzdzSzBpcjVZY21FZ0hhQlBPdVVURldCeWh4UVNZQlRIVHVG?=
 =?utf-8?B?ZUNzRE9MR0draXN2T2pBcHowY21rcGxFWjRJU1dwdUNZY3J1L0d1eVBDbG9l?=
 =?utf-8?B?eGt2L0FKd0NSY2hpY0JCb1hEbU50S0NaMDFCNHU5blZzRGdBRCs3My9HTU9Y?=
 =?utf-8?B?MzYrQXA3RUV1bUVXWm1yV21SOER2MzFHbXBFR0VBSW9keVd0cnRPSDRwSGtS?=
 =?utf-8?B?RFlSYU9QYW5yV3hqUnc3S0M1TUdXV3BjQzRYbVFUWlR0VnNwZitRSDVIc3dt?=
 =?utf-8?B?YTJpdCs2ZzQvOTFRYW5KSFJmSW9MVnVjMVpIblB4WEVJMlpsajdJSGtYQXYr?=
 =?utf-8?B?dHNhb0hSMHdySHJtOCtza0JZZXl5dzFjdkxFeUVWY094T2J6YmpFaVR0UnVl?=
 =?utf-8?B?S1p6cmVFelUxdnJYcWw3NS9BL21mTUFnM1JmQ09JeHk2bEN3WHNRQkQ3NS9y?=
 =?utf-8?B?K2d6RVFXMmZtTWltNHR6RU44cjVyLzZVVHJLQ3hNSG9rUUp3NFF5M3luaE9y?=
 =?utf-8?B?NWN0QnJ6ekFtZGlXNWJ1VjB1UTZlTDYvSS9CUVpCclRhZmpkZDRhUTlOQUtY?=
 =?utf-8?B?K2NRZ0NvdTBBa01YT1QzQXp3bENhNFZSWmVJdHd1bm9CRkExazNndWt0ejRn?=
 =?utf-8?B?TlZMeW9hakRKVlF2SSsrUjU2T3lyVkRRanN1TnE0cFJOUXd5ZnBHWGR4dnFM?=
 =?utf-8?B?eGhta3JQQmtqQWRWdXdDbE5yb3V4YUVLaU5Ta3hKaC9GNllqQjdZZzQwMFN0?=
 =?utf-8?B?a3RJRTR2V1QwTjNFa1RlNWg4alVDL3ZGeHAxSTc2NXpmcUR1OXZZT2lhNEk1?=
 =?utf-8?B?eXdjZXgwZERzYXhkdXl5YzdibHQxVHJ5RldGUUk5MmNpcTRuT3lPR05Sbmpi?=
 =?utf-8?B?b2t4bTR0Q3lNOTBPdVBuK3F2UGdLSFZlYTM2cEtnaWNpUDY4NlNNcU1ic2tz?=
 =?utf-8?B?NU9PNkZGZ1Y4dTlKSnhMdk9SSW96end6U1VuS0lnRUpneXpMaHcvdmlXcTlY?=
 =?utf-8?B?c3VqNHFySEw3ckEyNHlVYzZKQXc0SXVFdjZVdVVmZVJVRiszbWtyMTR5OWJI?=
 =?utf-8?B?M3U3RzlUTEZTN3p4aHhHYUNKRWVPQjA5c0VyT0ZBNFpDbWNubVlUWlQ3V002?=
 =?utf-8?B?NnJmNFRiblA0cmRqaUVud2g2Wkx0MzN0YVBkV01UdUoxY2puVnNDaFdLUHFP?=
 =?utf-8?B?dlNieVJtZkJRSG8xQWw4b0E5UDZLandBYlhyK1R6NG1kWi9UN05JdHkxVitn?=
 =?utf-8?B?emJwalhDU2FGcng4RDIvNHoyYllKL01HT3dJY1NhbW1ZV0Yxd09RV3VCOTkr?=
 =?utf-8?B?NFpCV2dtNUhOMHdkSkFqck1TWHRWM2d5U3lvb2JHODI3dHNsWmc1OHkvbVBB?=
 =?utf-8?Q?LWgYvfso7uH5bkwUImJ/P8VEa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SZ6tzgylAHzkjFrfIPsL1TQeOg7tFXJ/eiaZkKOHWlHV6BZExas+EKA9ZA/u32ZGZuiDh/qpvvKk4RDzuBx21ohTeEM6SE8jnqIRjQEmVWhgqa5hgIfNeFYbFbvOJhtPkDCDo8zms0AREmRntccMDuA26qHsWqbI6k05jNxFOrfO5w5aT4g83JMT8fVedC6qk2Lvg2aTRyYwTENR5p2nKM1EEk6IpcHrFUQeav8QQb3faTVlQ4Vh4vUbR6RqpoZaqDhPoJYzhL2sXk5yKhsfLF22z21u6HF56d8yWHp/GZ/pSLW04sSAxQQcTif6cQ/OsO+kxRe8xiXiAWY2or/f1gKkq+2VeXiJVNO+3E14mAWt4fGoH3KkRZxWk8USXfLL2E/bGsJXnTms63sPSktDyXcUAn2kkBzenwL1RjvUa1GpxrGbLD5bKe5DBAZG8HQHeP92+6bd9sCfjdE15IsGij3tTddxjtxAnFIxH1VTDUSPx30l3gqwDHCRmusWg4ghW1825SmXH7fWYqqF7YjsAblA3ubjUQnMKUFKPw6BATOw6XzdkIELDtTzQ8EfhPGTZ3VSk79T7Q6UvBaoU0Wsukg3SsQzK2xjuyV43c9jb3Gk4j+yO8FDFEx9YivT6xVST4bezM/EyaRpkWl0Xd0wWXzIclGxEXexf5+26vktgWh1u9tyjqOUYRdaPWhwy2fHoix/16hgwh+PKKrhG14wFpa1Xs2OWcwpAXJszfF1XItDpdMUIDaLWx6/n7OuThTDxeLaF/HYVrvs7o0Z7LWFMpUrODrGHtKad8DxMsclBXowZHo/sa6wxbpu5L24px1iB24gDdODsWRYYPixrNHJC1clAFwBPaRIJIgQseOE3cCV2+kEXUohk03ZyriW+cJF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1af4aa-62f5-40a9-78f4-08dad130aa06
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 11:06:56.9563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snL9Tm364yF61xMRNOiPzJKEHXQy2BTVtlmTnsGpQMhnETKlJGiE8NXzcJiJUbtZTfa5VJrbXv7a0/hQ25slJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6969

On Mon, Nov 28, 2022 at 09:21:47AM +0100, Jan Beulich wrote:
> On 26.11.2022 23:19, Julien Grall wrote:
> > On 25/11/2022 14:15, Per Bilse wrote:
> >> A change to XAPI varstored causes
> > 
> > For those unfamiliar with XAPI (like me), can you explain what was the 
> > change made?

One ioreq client used by XenServer doesn't handle buffered ioreqs, so
the broadcasted TIMEOFFSET always triggers an error due to that ioreq
not handling it.  While not harmful, it's still annoying to get the
messages on the hypervisor console for something that's not really an
error.

The description can indeed be reworded to not mention XenServer
specific components, something like:

"Avoid printing an error message when a broadcast buffered ioreq is
not handled by all registered clients, as long as the failure is
strictly because the client doesn't handle buffered ioreqs."

> >> an unnecessary error message
> >> to be logged in hypervisor.log whenever an RTC timeoffset update
> >> is broadcast.
> >>  In extreme cases this could flood the log file.
> > 
> > Which should be ratelimited as this is using guest error loglevel. But I 
> > think this is irrelevant here. It would be more relevant to explain why 
> > it is OK to allow a partial broadcast.
> > 
> >> This patch modifies ioreq_broadcast() to allow partial success.
> > 
> > The commit message is quite vague, so it is hard to know what you are 
> > trying to solve exactly. AFAIU, there are two reasons for 
> > ioreq_broadcast to fails:
> >   1) The IOREQ server didn't register the bufioreq
> >   2) The IOREQ buffer page is full
> > 
> > While I would agree that the error message is not necessary for 1) (the 
> > IOREQ server doesn't care about the event), I would disagree for 2) 
> > because it would indicate something went horribly wrong in the IOREQ 
> > server and there is a chance your domain may misbehave afterwards.
> 
> In addition I think ignoring failure (and, as said by Julien, only because
> of no bufioreq being registered) is (kind of implicitly) valid only for
> buffered requests. Hence I'm unconvinced of the need of a new boolean
> function parameter. Instead I think we need a new IOREQ_STATUS_... value
> representing the "not registered" case. And that could then be used by
> ioreq_broadcast() to skip incrementing of "failed".

So introduce an IOREQ_STATUS_UNREGISTERED return code and don't
increase failed if buffered == true and UNREGISTERED is returned,
would that be acceptable?

Thanks, Roger.

