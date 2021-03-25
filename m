Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179FB349137
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 12:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101385.193891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOWh-0008Id-46; Thu, 25 Mar 2021 11:51:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101385.193891; Thu, 25 Mar 2021 11:51:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPOWh-0008IE-0Z; Thu, 25 Mar 2021 11:51:47 +0000
Received: by outflank-mailman (input) for mailman id 101385;
 Thu, 25 Mar 2021 11:51:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WusM=IX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lPOWf-0008I9-M4
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 11:51:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeed5c23-8e83-4b75-9b45-d28c5be4e68a;
 Thu, 25 Mar 2021 11:51:44 +0000 (UTC)
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
X-Inumbo-ID: eeed5c23-8e83-4b75-9b45-d28c5be4e68a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616673103;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Dm2TcGv2m/gbJjDD3Q2nBprHkqtL/XlshLyHAE4lLNA=;
  b=R3p9Qu8PStEx3DVc8VjkLVWgi/wvmgQX7kdcOszVwh7vACLdtc1KPKVo
   +f+jaj5KlVTAc+HtIh0g4lGJMIQTJeKXU+3tNEKpZSvOFV49iiWIoHy5F
   DYUMnYlHNVNNEZo/fbCH8HoQfQu7vpo58P7prFiVPcmHwwKmmnclvHOMS
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 3aPfJmzcR5u4Ud5V+v06M8KtaJMIuqoJPzQOaJEwZgZINDvQG8rSPpA5mPf6DlUXw9g1Yi0zyn
 8rb8UFTG9sc2F1fPnolmTKYtjPGdfHgmlFCH73EkItWW1K5SxsD93CKNWP37YqdNteGMQp1fmB
 pS6eqDa2jL1fBdiUlqJNzGEtrMBNgOAl/dbr8oX7etl13RAhLcEGzwOUxcsoEbd/i78WT30ytk
 Unk8zGMYBjXQjRbCgVYPCSrNdxIGR8Op3R+kxuMDTaVJSy/ysWlB8qecQ4VM4AFh1CevmhD7jd
 26M=
X-SBRS: 5.2
X-MesageID: 41552710
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YcJVXq2TAnLz/iMq5mnBmAqjBSF3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdHFebg9AGJY/Cd
 6w5tBfoSChZHQQaa2AdwQ4dsLEoMDGk4+jXA4eC3ccmXOzpB6LyJq/KRiX2R8CTyhCqI1CzU
 HpmxH0j5/T1s2T5QTb0wbonvBrsfvnjuBOHcmdzvUSQw+c9jqAQKREd/m8sCsuoOepgWxa4O
 Xkhxs7Jcx85zfwUwiO0GPQ8jLt2jov9HPuoGXw6RCIzL2bNVBKefZpvo5XfgDU7EAtprhHod
 l29lmUqoZNClf4lDn9juK4Ji1CrFa+onYpjIco/gVieLYZAYUhyrA3zQd+FZcNGz/C84Y3EO
 ViJ9G03ocpTXqqK1/epWVh29qqQzAaGQqHWFELvoiv3yFRh20R9TpV+OUv2lM7sL4tQZhN4O
 rJdoxuibF1V8cTKYZwHv0IT8ebAnHEKCi8f166EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5YnXRaQTOvNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEVlde6qfl3OLybZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/vkhXVajpd/KN53KuuTXfO27HsuuLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmzzlKgAVZTyzqw28swgJ4dMug8ahRCS/ceQMwBPtaQwYQ
 9bKLPjmaWrmHmu8Q/zniFUEysYKnwQzKTrUntMqwNPGVjza6w/t9KWfn0X+3ebOBllTYfzHB
 REr1p6vYK7RqbgixwKOpaCCCa3nnETrHWFQ9M3gauY//rofZs+E9IBQ6x+FQLCEjRvggZ0oG
 J/aAsJL3WvVQ/GuOGAttg5Fevff95zjEOAOshPs0/Ssk2auIUSXHcBZiWvVsSWmA4qYDJRij
 RKgugiqYvFvQzqBXo0gew+PlEJTGiMGrpJAD6IY5hulqnxdBt9SnqLgjKmmwg+E1CahHk6ty
 jEF2m5aPvLCl1StjRj3qHm/EhdW0+dc0hzA0oK+rFVJCDjgDJewOWLbq283y+tcVME2PgaKy
 yASyAVOBlSy9e+0wO1lD6OGW49/IgnOvXQAd0YAvfu80LoDLfNubANHvdS8pogCcvntfUTV/
 mDPyCSNzH1BooSqnqoj0dgHBMxjnYqkfnlgkK4qEe52WMyGvrULhBNQaoBL9SV8mjjQLKp3f
 xC/KYIlNr1Fl+0TNiMjZzzRXpkDDj4pGatVeEmqZxOp8sJxfNONqiedQGN7W1N2RU1Edz9m0
 wfSplq+bypAP4bQ+UiPwZiumcznNuBLEEXohX7L+83c1YqlWLaNbqyks31gItqJk2Kvw3rP1
 aDtwVb4vfeRiOGvIRqQZ4YECBzaEIm7m5l8/7HX4rMCB+yf+UG2FahKHeyfPt8T6eCcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiePiMOmu3aKd12u3/H0+NjKus6NOyizmyaQLTUTVmua
 R1MWoKbspCjTE+ipYQySbacN2vnn4Y
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="41552710"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SynJ7qsm00XBz/zFzHZhB5Dz8yC+MxlsCybMfrgHXinMHynDwvdf2shQ7cMT2OsMKE6OBRbz3hjQe0JUbuiZIr/AeNr7MzayjiG+KA5yeyFyIA2OSwimKfZiFxvXjsnP8xr+Jb11WgYlM9Onntrp/s60nX238xAF74RJglAvzOo9GOO0Q3mzXpcilSw3qI7ZpXNls3quwOlbn7IJ4PRp4IcR0Wi4gv0TwpKIPAP+6spTt25fd1P0exTH737XVXx6b1+g7DPGk85ZAEJrr5RjUANLoc8iKbuWMQNM1fS8J9hOx9dEZVvTW9Na4f6Exl6S4+yrRoPypTOs9eNz8oTd+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfh8iklu78et7J8VloVPeU+e7QaHw19wXC9LMVyyrxs=;
 b=MAqtkdbsz3FPQUTy31BsnCkFru8+W7MuXi14jtJ4iv/Q71M1XUqyk8min7NP8bnfvUsPpHU048m9WqcIJaME1sXgTMv6e1XolhkefoEBuvKmN9jzHf2JEG5D1ZgbLzt112P7eDTJdBPluzMjAYStTTatxNW/QOKsPJmjD9/+cn/Ly14UFegzv77YJrTEbau7X6BOPL+K6RjpxjqXAOT/4+zH79788vOx3ynxYkZ2Dz7BgunbhQVr2ynnIjvuw930goPf6XGNUf1L8b3pAJQjMaWWKU6fLEJXQfHxB9CbUIpMT65XTEinQ8/0doJM9ezpkWXJ1KGumZMkU/IgS9ArdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfh8iklu78et7J8VloVPeU+e7QaHw19wXC9LMVyyrxs=;
 b=xYXf/dhDRhX+Z8b+LViooe9RQsOtdpebDzlsB2hKO3C7adk6FgoMNIZAyNKVYVD6SZQDQXxixYFXUIznQDQcyfVDwRu5rCwRDpdVv9yhF92+35/Fsju2Qb6L9CGS5ZXGq/DaJUa2A0FQhq39Igcwt9hYkwlj1Jo0UUw9pZR2a+Q=
Date: Thu, 25 Mar 2021 12:51:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <wl@xen.org>, <stephen.s.brennan@oracle.com>
Subject: Re: [PATCH RESEND] Performance regression due to XSA-336
Message-ID: <YFx5RNnOxWex232N@Air-de-Roger>
References: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1616619905-640-1-git-send-email-boris.ostrovsky@oracle.com>
X-ClientProxiedBy: MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7175a280-aae8-4784-87e3-08d8ef845990
X-MS-TrafficTypeDiagnostic: DM6PR03MB3579:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB35793739275045DE3EB191798F629@DM6PR03MB3579.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BA1gD7iLjrcZN1JCQLP8rgLtP4kHsBY8PQrSVSjEXrqk9Qx4goiAMERTFplYhwIUvzb4fKAPAyE9tWKcKP1ELp43YzOMxPXxuiyxYt75cxKx7z1blJZEuJGbFI0CqB6X55Nzcqi+sVfL3Runk5jyO8rLe0TCNZQUh3YEu4tSZjCovbz3Kmqpy3JKYvsaSGFPZ9PwWtdwS1/p51hix5TVdeUEI52jZUB+7vFqpcuCGcjFAKTu065OmhFQquxAXJ8ZvFra5QVmmk8O6btlbeza7/OSKhw039c2gT9Jrhy1yyNctcTctr3eDhyLWvNyY9NzE/6k4aDcMYBA6gujz+UYCboOlfXCQ9yDZ/pSlzR3t4YvfAJol8Y2NBcvEhxoVy0k+L11gCpEWOG50wZokOe4go7HMrGrwar/nJJz80ggEtiKmi+180E8eH15lKc9rZgqZSaFdHcfRud5pi/aTw3/LT9GSqtRkl/Te4KALvZn1Xf2TZ47See3b3ndc1G6qhb4wEgHYHGceu2ubcU3R/1JhhMG/08vCF8NX3At1xujbLZ75KOaOq2ipKwi+Uh76sUTrRmda2hsB+WyYu9Plb1lfi6qJVoo5AnBPy4pWkEQkoUMyJx3yTztvsWOPNaGGFv55Ch10/RyaPRDOBrHdgOPTf+POLIIyGDA+qHNgK5EEO52IXJt4uhvHNtvtn39S196XjL2D4FxDRHVJSDn6UvBdeGQ8LkW4X0ue6uv/uwkdsjNjvGeVf2/QnGecuIZ8q6n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(366004)(136003)(376002)(8676002)(6666004)(6486002)(2906002)(26005)(316002)(186003)(9686003)(8936002)(5660300002)(16526019)(956004)(85182001)(4326008)(66946007)(66556008)(66476007)(966005)(6496006)(478600001)(38100700001)(6916009)(33716001)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDlQMzFiSXY2TG1mUEhRU3FmbTJ4M3pUa2VBMkxVQzIxb1JTa1pqOGk0SlBj?=
 =?utf-8?B?L0M5NmljekNDQS9xUzU4RmtDcFFGOXpLSWRGTTVCaHd4dE45SmoxOVM4ajJv?=
 =?utf-8?B?ck9nV3M4dDRiK3JscXRrYkFyRlhHd3JWTEJEQzRQRXhMeUxYOWFhbnR1WTFh?=
 =?utf-8?B?R1Y3c1dhVXFoTEpBM0hnbG5EbE82SlI3aXYwQThMVytGUDAzV0ZrbWZpcGRm?=
 =?utf-8?B?dUhBTGw4R1JjQlBEYW9kK1UzSGhoSDQxeEpxUFdqNThENDkzQ3hxMkZDVmtT?=
 =?utf-8?B?RjVRcTlOVEpFUWRZZ2RIaHo0TjMwWHZDY1pBdjVUVFlCdFlDNkZOMDNyaG0z?=
 =?utf-8?B?M2JkekRrZHp2S01mcnBXV1NjRHowcEtFMXhISklHeWdodjE1c3h6YVY3c3FZ?=
 =?utf-8?B?amRuYzF6TGNybDEwS0NGaUVrdlBDNEM4d29TSjhJcWd5cVNNU0RJa0ZHRGx6?=
 =?utf-8?B?SlM1TkhKdDJDSXVUSHJROU90eTA3S1JHS2xGQ1Njd1lzVGFWMUdLdXB1dzZp?=
 =?utf-8?B?TEplY2tmaXhVQnZRNlMyc0ova2RZZldMemo0QW1uMlUvNTVFN1ZzSStmNEdV?=
 =?utf-8?B?RndGZTB0RGtOV1JPQjhmMVlrRWh5TmxNZTEzVStkOCtGeXQyTllPRmhCTFhr?=
 =?utf-8?B?cjdLWS9jb1UyZlZKZEFxQ0llVVFUU3ZPQUFSUG0zdzBldEpzUVczMFVaOTBP?=
 =?utf-8?B?TFJMNWlQbnNKY0pXL3B0Vk11d29sVUdEUzNiNXo1Q2J6SWpreDJsR3RTRFFT?=
 =?utf-8?B?VFBSY1l4ekFHaExSVlNZTU4wYnRoa1RPM3UyYkhINHo2b0Z1NFFzV2x0SmIw?=
 =?utf-8?B?SFhVT1RRb1lUYjlLWW4reUczOTNHNmh6UzZNTmNReDBzUDVzczVNSW1LRlkz?=
 =?utf-8?B?dWt5K0dONmhpZVVaOC90RWk5bjUyNGJiL1Q5d0VmYzIxblpCK1FNc3ZyczBu?=
 =?utf-8?B?NGp3UnZndG8wMmJxc0Z0eXJPWEY4MERCNmZPNitUN08yQXV5SmhnSUZBVjgz?=
 =?utf-8?B?TUZzMFNJVTNRc1VWWk8yQ2paTTBNMmxySEVHdnVuaHF1M0RTMmVkU3YwZWFP?=
 =?utf-8?B?N1NFTjlpNVpmL01FeHJCYzB2TFltZTlvbGJqMHY5bVZBaVZWaTRnMC9BaUp3?=
 =?utf-8?B?cGRkYXphdUR5RGpSSEJ4VXMwNlovWUMvZGR6MFY3RFdxbzdsTnhYZ25qKzFt?=
 =?utf-8?B?UEluclNiKzgySGZLdy9KZlV6VTJFdFArK3QwVWdnNGNibkNuK3hjZkM3NVNZ?=
 =?utf-8?B?YVFKdmp1Q1kvdmZWdSs2b1VOcy8zenFzcTczcGsvank1eTV6S1YvVjdQa1VN?=
 =?utf-8?B?ak5BVUNhZi94L1R2aW5FVHRpZGJueVdBOTBPOVZJdXZKbjEzK2x1bk9RMmhW?=
 =?utf-8?B?bENkdmRVc2VyblhhcmRFSHlmRnBrUm0wejZFT2Zvc2o4RVgvMTdBRHRNanIx?=
 =?utf-8?B?M3pXSXIzSmNlcHpBVkZwaG05UmVKbXJCblVlZXpzVHFlcHZ2QTIzSFF5OEE4?=
 =?utf-8?B?K3d1TlZQbmt0Y2hPQ3JLUFhuckZoWmhTNmdaaUpuR0ZXRGtuTWtHMVRuODEr?=
 =?utf-8?B?ZWRNNDkzL2pZYkdZQTB6c2xqQWtETW5kMkoxZTVnZ0JuVklseUFSTFVNcWR3?=
 =?utf-8?B?b1NET0ZPNmcyTUMwdVJidGxTUlE3NjJLMnY0V3RpWS81M3FtT3ZPSTNRMjFU?=
 =?utf-8?B?QzFLbUF2YUd1L09iZ2JCRUtZSWViNWF2bmdXY01IVzVXNy9YSmRZNFM3c3c2?=
 =?utf-8?B?clpSUlU0UVdRM0lEVlAzeklrWE9odTdrUVl6TEhwQ2ttU2M4MlhNeXZ3aFNk?=
 =?utf-8?B?ZU1kZjB2YkZndFBoVFcrZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7175a280-aae8-4784-87e3-08d8ef845990
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 11:51:39.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycoKEk6r82fp3d6BMox6lDwLGshW1rHeW7TyoweB+tkGmDIabmwzt0wxQMxgQ7LISU81/3gVuNu9iwD/ULKXLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3579
X-OriginatorOrg: citrix.com

On Wed, Mar 24, 2021 at 05:05:04PM -0400, Boris Ostrovsky wrote:
> 
> (Re-sending with Stephen added)
> 
> 
> While running performance tests with recent XSAs backports to our product we've
> discovered significant regression in TPCC performance. With a particular guest
> kernel the numbers dropped by as much as 40%.
> 
> We've narrowed that down to XSA-336 patch, specifically to the pt_migrate rwlock,
> and even more specifically to this lock being taken in pt_update_irq().
> 
> We have quite a large guest (92 VCPUs) doing lots of VMEXITs and the theory is
> that lock's cnts atomic is starting to cause lots of coherence traffic. As a
> quick test of this replacing pt_vcpu_lock() in pt_update_irq() with just
> spin_lock(&v->arch.hvm_vcpu.tm_lock) gets us almost all performance back.

Right, we where kind of worried about this when doing the original
fix, but no one reported such performance regressions, I guess Oracle
is likely the only one running such big VMs.

I have a pending patch series to remove all this vpt logic from the vm
entry path, as it's not working properly except for very simple
scenarios:

https://lore.kernel.org/xen-devel/20200930104108.35969-1-roger.pau@citrix.com/

I hope I will find time to post a new version of the series soon-ish.

> Stephen Brennan came up with new locking algorithm, I just coded it up.
> 
> A couple of notes:
> 
> * We have only observed the problem and tested this patch for performance on
>   a fairly old Xen version. However, vpt code is almost identical and I expect
>   upstream to suffer from the same issue.
> 
> * Stephen provided the following (slightly edited by me) writeup explaining the
>   locking algorithm. I would like to include it somewhere but not sure what the
>   right place would be. Commit message perhaps?
> 
> 
> Currently, every periodic_time is protected by locking the vcpu it is on. You
> can think of the per-vCPU lock (tm_lock) as protecting the fields of every
> periodic_time which is attached to that vCPU, as well as the list itself, and so
> it must be held when read or written, or when an object is added or removed
> to/from the list.
> 
> It seems that there are three types of access to the peridic_time objects:
> 
> 1. Functions which read (maybe write) all periodic_time instances attached to a
>    particular vCPU. These are functions which use pt_vcpu_lock() after the
>    commit, such as pt_restore_timer(), pt_save_timer(), etc.
> 2. Functions which want to modify a particular periodic_time object. These guys
>    lock whichever vCPU the periodic_time is attached to, but since the vCPU
>    could be modified without holding any lock, they are vulnerable to the bug.
>    Functions in this group use pt_lock(), such as pt_timer_fn() or
>    destroy_periodic_time().
> 3. Functions which not only want to modify the periodic_time, but also would
>    like to modify the =vcpu= fields. These are create_periodic_time() or
>    pt_adjust_vcpu(). They create the locking imbalance bug for group 2, but we
>    can't simply hold 2 vcpu locks due to the deadlock risk.
> 
> My proposed option is to add a per-periodic_time spinlock, which protects only
> the periodic_time.vcpu field.

I wonder whether we really need a per-periodic_time spinlock, it seems
like functions using access type 1 are the only ones that suffer from
the contention caused by the global rwlock, so maybe we could adapt
this proposal to still use a per-domain lock, seeing that type 1
access are likely safe by just holding the vcpu lock.

Not that using a per-periodic_time spinlock is wrong, but it's likely
too fine grained (and adds more memory usage) as type 2 and 3 accesses
shouldn't be common anyway.

Let me make some comments on the patch itself.

> Whenever reading the vcpu field of a periodic_time
> struct, you must first take that lock. The critical sections of group 1 (your
> "fast path" functions) would look like this:
> 
> 1. lock vcpu
> 2. do whatever you want with pts currently on the vcpu. It is safe to read or write
>    fields of pt, because the vcpu lock protects those fields. You simply cannot
>    write pt->vcpu, because somebody holding the pt lock may already be spinning
>    waiting for your vcpu lock.
> 3. unlock vcpu
> 
> 
> Note that there is no additional locking in this fast path. For group 2
> functions (which are attempting to lock an individual periodic_time), the
> critical section would look like this:
> 
> 1. lock pt lock (stabilizing the vcpu field)
> 2. lock vcpu
> 3. feel free to modify any field of the periodic_time
> 4. unlock vcpu (due to the mutual exclusion of the pt lock, we know that we are
>    unlocking the correct vcpu -- we have not been migrated)
> 5. unlock pt
> 
> For functions in group 3, the critical section would be:
> 
> 1. lock pt (stabilizing the vcpu field)
> 2. lock current vcpu
> 3. remove from vcpu list
> 4. unlock vcpu. At this point, you're guaranteed that the vcpu functions
>    (callers of pt_vcpu_lock()) are not accessing your pt.
> 5. assign pt->vcpu  (we still have mutual exclusion against group 2 functions)
> 6. lock destination vcpu
> 7. add to vcpu list
> 8. unlock destination vcpu
> 9. unlock pt
> 
> If functions from group 2 and 3 are less frequent, then you won't see too much
> added lock overhead in this situation! Plus, even if group 2 and 3 are somewhat
> common, the performance overhead of an uncontented fine-grained lock is muuch
> smaller than the overhead of a heavily contended coarse-grained lock, like the
> per-domain rw lock.

Thanks, that's a very good description of the different locking
accesses by vpt. The original fix already aimed to make this
difference by introducing the pt_vcpu_{un}lock and pt_{un}nlock
helpers.

This all stems from a very bad design decision of making vpts tied to
a vCPU, which is a broken assumption.

Roger.

