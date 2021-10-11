Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D19429054
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206060.361529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvwx-0007Ne-C2; Mon, 11 Oct 2021 14:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206060.361529; Mon, 11 Oct 2021 14:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvwx-0007L6-8E; Mon, 11 Oct 2021 14:06:43 +0000
Received: by outflank-mailman (input) for mailman id 206060;
 Mon, 11 Oct 2021 14:06:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpBC=O7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mZvww-0007L0-9L
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:06:42 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7505ec16-2a9c-11ec-80dd-12813bfff9fa;
 Mon, 11 Oct 2021 14:06:41 +0000 (UTC)
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
X-Inumbo-ID: 7505ec16-2a9c-11ec-80dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633961201;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BXvcUP+XqHV5AjwM1QEKFi9EuiUym3Ks2KKWcaWUKaU=;
  b=MgCXs7+fGx8OC/hM3PtnXmn7XdZsG+aOOGazqK79hYoLSLU+20TIwoIm
   PRUmvwwKChht2WX5zFaxJbRB50hz3CLN/mcRxTVwmkitkQMOXZ+z/U7BC
   4JJucISmwUWMUShgxSi6tIVJkUFqE5xjdEWiOnURxgWRETmpP2F05QPlm
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 55DyMtZ9yJS6a6fqweJtQ9kQ85bbpRD43oKRayC5y6lPaIn4dSMwJ0mM7H9dfV8s9MEC3qbMbQ
 CJoYv+k37A+zLBcOpzng49LwRFcgNZhtk3e9KhOLdAfhL76SHvoouaEZ5/MYXXk39AmyLrS14U
 SWRZ0CnV05nwquZd/MzfDfGCcJ6F8nz3By/DWs5uWFocxcoE2aUt6U4p1BeKYr2W6JAnJlhJrC
 3JN1C2YV1ESAmaDqRHL9SKNKQMH8J8RwzBWv+qnMBG8jrYlmxVJMjO5iVpi4qSJcYUmbSoXZ81
 YxV2Af0pTuKW72ObdWwVfLA3
X-SBRS: 5.1
X-MesageID: 56754355
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PJnCCKPYsqvdb47vrR1DkMFynXyQoLVcMsEvi/4bfWQNrUoi1TcFm
 2dOCD3SOPmKMTDyfI1wbozj/UkB68XQztNiTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6ZUsxNbVU8En540Us6w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2yR3M1Xz
 /IOjrypER8KE4HswP0vTBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWlv25wVQKu2i
 8wxeDhBSRGcUkN2Ng0FN58TxbaFmmO4bGgNwL6SjfVuuDWCpOBr65DvOtfIft2BRe1Og12V4
 GnB+gzREhwccdCS1zeB2natnfPU2zP2XpoIE7+1/eIsh0ecrkQMDDUGWF39puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlbdpl0Bfd13UNYa8VmV6Yf4w16ANHcLG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZnBLdT5qiTssCFJfuYG68d5bYgfnF447SMaIYsvJ9SYcK
 txghBM1gKkPloY13qG/8EGvb9mE98WREFBdCuk6WAuYAuJFiGyNO9zABbvzt68owGOlor+p5
 iVsdy+2trFmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lfxc4apldIGO3O
 yc/XD+9ArcIZhNGioctMuqM5zkCl/C8RbwJqNiFBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WnOnOJrtVJcQxTRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WZQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:AJHNrahvEm5o/J5rGgxqOnjVyHBQXt4ji2hC6mlwRA09TyXPrb
 HLoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SOTUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebrN5fQRt7eY3OEYeexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="56754355"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed/yTviysB9o3KrO7odDu0jv2dOyiFUzJ/yCs8BFNLIAVuVa+TQZiCZaBKnpTp817RXSCNCFj0KQNYFb0K4JmG+pfvPxfkbqaQZnqL1HTyfoJab79kInpk9AP0yjZlXGQdexNJ5Q8XOOabDXvF6ZgjfOxVGaKpdYFpZ/8GYgZTCkChAI7K59CX6ggpfTq2/wb5pwfT5ndofnvIxKlqEo9bvq2v2fiutC+nfxXH4J+YOPUUKceLfdY5K4H7c5gAo6bf1I4I898a2p4xDrn+GKY2GtW7P/rOHfVW3HY3BTWhVVrhitaLb+TRrlTFqwQkHQ8p2fNhcgnjDEPtNKZfeb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXvcUP+XqHV5AjwM1QEKFi9EuiUym3Ks2KKWcaWUKaU=;
 b=HC944laBOhycFE2dE9q8JymMFbZu+hOJ07OnwKoqGXlFlZyPZp68IhNgZ0PMaz1mlrC7D66et+pO5NNod9Bp4oxx0OWNGp/sh+TvcStCjfK4Xy59r30RurwGVmpvwGKO/Tqi3bEHIGDRPcB2w2LFdkQ5vcuk7lJs1Xv1JFsfM3EiqprdSiyVi5e2I/gqdDN5o0zaL9zdmKKlGMpUyNFb5k1/B6ButsMTpzMz/4MKQQEXMWIGXSGhx/dq+/Mgso7y0+asXQ5cRwQtduFQ7zfVUXEGqCEeZWVVP9YHN2eVMEICAsLvYYId5mOoVYUgxX9efW+o9GEMLeeut7tXSU/QMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXvcUP+XqHV5AjwM1QEKFi9EuiUym3Ks2KKWcaWUKaU=;
 b=kNgY3KqJJhjJi0Pkl0gO2rGrHKW2amRvJnE8ubktdl9mlU28vp2Pw9PXBo/sk77W6Q4+IkAQNJ+7TeKik73zXyu/6isPCOpuN8xY5fwjKWwDlMzdf1cG6hTo64dPrR3RceWUY/rhP7/M5bmyc6X7AAtP4V2wmlWVkPchjX4Snag=
Subject: Re: [PATCH v2] x86/PV32: fix physdev_op_compat handling
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
References: <af2f934a-49d8-a15d-3b66-94abc0d39081@suse.com>
 <YWQMqq2Z9BNro9IL@MacBook-Air-de-Roger.local>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6b9172b0-4e98-5820-b340-b011c38edb30@citrix.com>
Date: Mon, 11 Oct 2021 15:06:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWQMqq2Z9BNro9IL@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0268.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1866f379-65d8-43e9-d839-08d98cc04aba
X-MS-TrafficTypeDiagnostic: BYAPR03MB3942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3942A957AEF1E682A304A9B2BAB59@BYAPR03MB3942.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVnT24/t87/t0dcBBYYdN/BZ7kUPpyjoMxZnQR8czqjXOhmmaP/MHJ4KsBV2mgsQCi5Fytv5ngOl8xKYJEFh1G/HKZ72UWk/JqrnZxd9UTZuqC8HO4LWt4arZ0QqYlB3uqQ7pB5PJCwzbkFDIqViX01p/FhCeKUgPlXr/XSbCsfjZjftnskP3FsiQEbiiX4GteGbEg0inDX6ZLKYMoyJl3lIN0D+p1/Egs08ExfKxpMs8iTYW89QsOO0mpQlsNE930SLXDhfqXxlVLLcDoP4EntigrZLKY/4mA2Ld5OX6bjj8WuPx5nWfrM9gM0eT7U7tq0fnGx6IlisbuhcASEQPr1J2Lf6CUxKMoGnkCmY2jEL+IdQehOsL6U+LKv213O/djwTWPvV/Pxfy2GPXSrg+FdM8KuTibsLV7bB+/VnY69/CI9l2EsH2TvE9U/GcZGAVb7goqPcsLSObCqGoIR3JdikJjeOE1t+zkNk5Qvc7DA41mq+HHBDRbfTTo50k7zjG4+t0Na1SpD5TGEeRWchzNbY515iyhsMN/u+RFBqNwUYpfqijaGFXKd41+5LjPMbxSHZAI2oPRNWE56mjSLbWdaK/e2WOPl+szivyv9uXdHVDNwVBctIMiVe3IRSI38p6ph97NnG4WynVSwjY128VrxTVNnXwW+t5Q95y0/d1UcDUawU6IyIoOgjd1QNNSSVZfxNEa7C7RXyM63Aq+s99eZl69oO6AtYP29Mu14ZK6qFi2yCoHED/mODspEyfpdV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(316002)(8676002)(8936002)(186003)(2906002)(31686004)(38100700002)(6666004)(5660300002)(6486002)(31696002)(110136005)(508600001)(86362001)(66476007)(66556008)(16576012)(2616005)(4326008)(55236004)(4744005)(53546011)(36756003)(956004)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3A1dnhCMnkxNEhjMGZFVTlWcCs1L25xNXpVYUh1WGpPZHlaVU10MXhQdDdH?=
 =?utf-8?B?RE4ySTFzL1Q3eEZLaUVDSWFKR0R6YWozei9UWEhJRnZHckk4S0dqazFkWkFa?=
 =?utf-8?B?eHhPUit3OXBwemUrRENSamE5MlVtM2ZsUkR6azB3bGVrOWxpd21OQUsrUktk?=
 =?utf-8?B?Qmk1akhuRnN4Tk02Q2ZKTUtZNndnbkVuWE93YVFKUjMzWTIvbWhGQktpaXhX?=
 =?utf-8?B?U01OSjlHWTRHc04zM0JXY3JrbXBzQ0YrUjJZalNoa3pNdW80eFBPZlp0cDlw?=
 =?utf-8?B?bU1xVXY5MFAxSDhMYU5Pc0JVNXhvQVQ2VnFmSUZONDhkWTlIKzRuYVZvYjZJ?=
 =?utf-8?B?NEw2Vzh4SlhkQXcrQVhsMVQvK3E5WHdnOXNPSGY1MGFOZzNjd2t0N08wS1pV?=
 =?utf-8?B?anRjUXRQeU00dGltRzFWNlA3dE0zaE9NTWZRcFB1Si9QcVpQNFVQK1ZUU254?=
 =?utf-8?B?NWJvdFVncjVrdTAwcEg1Y2RqRE9CVkhHNitUT3hZSmxNT0RFVmtwYVFtSW1H?=
 =?utf-8?B?UXB3TGZveGNDR3pvalllbmQwQzNYRzJ6bStmUzVETHhteXlOV2daQitJazZY?=
 =?utf-8?B?TkJUQUpqRTRmYkw0OWtJMERIY29Wb1JDMm5IeHpEWEwvSDY0TDdOTzN6ODRj?=
 =?utf-8?B?YSt2WlltckdaTlVhdjg5bVlnK0Nrb3Zsd0ova29WWGduUEFrYmRhbHo1UVEx?=
 =?utf-8?B?TWlIWk1KQVlUdXhObTVra0RNNkpvbXpiSEFoRDdkZjFCSUdpUVdLN1pVZCtq?=
 =?utf-8?B?SjNWYjV5NFQxSGZ4UTJRaFIwSlZMaE5STnlNZnZUTkxsY0l2R3MyUGUxVnho?=
 =?utf-8?B?RGtUUG1NbEwxYVJodkNJdlp4THZacWJGWDBCSFhjQjN4NFFWbXhNc1FyM1A5?=
 =?utf-8?B?VUlMMHZjdFJiRDdCRjVEOEdLbGNXN1M4SEZ0WGczNzhQWlJ3Wk15M2JSbnJ5?=
 =?utf-8?B?K1dUb01HVFVCVWhKRW9IUVRWbElrcGlqVktkK29Lay9MUUo2S21tckFES3Zv?=
 =?utf-8?B?TFZzQzNzdER0bk5BWHRJV2dyL1FKNGFsZ1pGMnZxd21HNk9lQ3dPTUxKSi81?=
 =?utf-8?B?cW9FR2xEejVubWl2MU9NcjdMYmgwb2diTzAzMHd2N1dvNVNobE5HVnVQQW9I?=
 =?utf-8?B?MHpKRkNPdEwzM1R3MWpaUVdyeHpyYUhYL3hFR2IvMU9JTW1XTUdPWmRpYzNr?=
 =?utf-8?B?VXNpZ1hFREp0SFNoQlUxdlFFY29tUkMzQmFqVE5oQ0RoVWJUQ2RwbUVwNFlT?=
 =?utf-8?B?azJEQ2FhT0xCOEVHajJ0Mndac3FnaTZyTU16c0VRYkk3VEoxMHFvVWk2amNj?=
 =?utf-8?B?RWpCbk1raE80ZXpLaFVITUNvQVpCcUNCemFKc2UvSXZuM2ZJWmRrTXYxTGhB?=
 =?utf-8?B?VGx0Q2lOTVNrQVdKRmlrZjE0WHIxdXZzMjh5R2Z6VFlmVkE2V1dXd0JwNmNU?=
 =?utf-8?B?RnBNZXAySFpHZEJjL0ozNHplcENiZjN3ZXlpYkhwald3ZitSbUNjajNFNDY5?=
 =?utf-8?B?TjBTWHhFT2IraVAzWUl0SGJ3bjlpR2lWQlMySTNsMXlicVZndDdqSll6MW83?=
 =?utf-8?B?SXNBVGtQamllbXdIYVFWa3NzR3lrYzZqelF5SXJkSDQrTjBLNUM1ZDNwTG9a?=
 =?utf-8?B?YStIYU40czZCSFpvR2JlYWY1Z3pnZUk2Z0dWSk84MUw4ZmFtemtyc25VUGV3?=
 =?utf-8?B?citFWFF4aDNPSnNUK25EeGp1dXBDWDhwcXk2dHh2MTArQWoxU3BEK1hhMzcw?=
 =?utf-8?Q?VDXluAyJOeR2oji/Bb4z8Uu/yqr+5nRsTnBZBr5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1866f379-65d8-43e9-d839-08d98cc04aba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:06:16.6603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n82jN+xh33911bjKIHZdaDsdqpFWN2n0khq2ZEPwn1/RHs9+lCXSw17rGRdqMjo6uOHhUHdiQf4z+99fxaMwXXJq9PUzkMK68YyVxA6W/aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3942
X-OriginatorOrg: citrix.com

On 11/10/2021 11:06, Roger Pau Monné wrote:
> On Mon, Oct 11, 2021 at 10:20:41AM +0200, Jan Beulich wrote:
>> The conversion of the original code failed to recognize that the 32-bit
>> compat variant of this (sorry, two different meanings of "compat" here)
>> needs to continue to invoke the compat handler, not the native one.
>> Arrange for this by adding yet another #define.
>>
>> Affected functions (having existed prior to the introduction of the new
>> hypercall) are PHYSDEVOP_set_iobitmap and PHYSDEVOP_apic_{read,write}.
>> For all others the operand struct layout doesn't differ.
>>
>> Fixes: 1252e2823117 ("x86/pv: Export pv_hypercall_table[] rather than working around it in several ways")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

