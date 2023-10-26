Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D09E97D85D6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 17:20:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623884.972163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw29a-0006Gg-0t; Thu, 26 Oct 2023 15:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623884.972163; Thu, 26 Oct 2023 15:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw29Z-0006F0-TK; Thu, 26 Oct 2023 15:20:09 +0000
Received: by outflank-mailman (input) for mailman id 623884;
 Thu, 26 Oct 2023 15:20:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw29Z-0006Eu-0u
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 15:20:09 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2305fc90-7413-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 17:20:05 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 11:19:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.18; Thu, 26 Oct
 2023 15:19:44 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 15:19:44 +0000
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
X-Inumbo-ID: 2305fc90-7413-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698333605;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6spj0md71610YGuhOcTHwZ87LnS8O1v+LaBG0+6uhi8=;
  b=GQGtKnzMlKvyU34cnUwAj2rQlO3Z8VtsQvrdLqV6hXZXgJyYzqzUZxAj
   BTD5ebG20xPkXydlvltpXojAHffOh7qL2J9qkmpCVpxPoSU71nYk9Nq0T
   5M7EurFRcTr3SwuXQ3s59o72fQGvPrC1/BjnBo6S8uFcSq4RA3Rvnj+uL
   c=;
X-CSE-ConnectionGUID: Kgekgs/UQCmHl+wLyt7CcQ==
X-CSE-MsgGUID: dZb19uLnQK20rEmz6XaXBw==
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 126740461
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:40qACauJD3WazZlf5NeKDD2XBufnVHdfMUV32f8akzHdYApBsoF/q
 tZmKW/Tb6vcY2rzKotyOt/l8h4AuMSDx4BmHFZo+S09Qn4T+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeEySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwCz8AbR+YwN+P67ebTqpzotU/c+LgBdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIO9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtxNSOXkqKcCbFu7yl4ZUUwLcV2CgqPhkGO7SYxvI
 nw+5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqC8p+EoDX0PjIaRVLufgcBRAoBptz8+oc6i0uXSs45SfbsyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CAsp6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:8t/8YqyfHyKZTm9J2nlqKrPwJ71zdoMgy1knxilNoH1uHPBw8v
 rFoB1173DJYVoqKRMdcPq7Sc29qArnhPtICOoqXItKPjOLhILAFugL0WKF+V3d8kbFh41gPM
 lbHpSWWOeaMWRH
X-Talos-CUID: 9a23:AByvNWNcmhrb+e5DeyZq90EPXf0cWXj9yDTPB16kVk1icejA
X-Talos-MUID: 9a23:8nBY0wtQR6dPRbB8SM2niANobZZ1x6KXKxpVi7gDqZe0PBxaJGLI
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="126740461"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyxCgcvAaoPPxC2OGQHef376oU+d1h4jcplHP83I2tXalPWzKCbgeEXLh9ie2iHxYdxh6e4ISXye5mmb+qdXvlPEyI4pHEcmVgnZvmNYdzsJCg5x64kYtKQ25+gtwtnj9Qk+Zj//IMmkO3ewNR9xP8EFCAAdjoz8PotR7YspbRjBOddP/hlsHMpAPgp45SW3hLHuJVihaHaOof6rPti1Rk4hUDgF5A+nn+1gRoY5SkRxNEcRRcmQud0IlfzKZM9Wqn/0VyJyRwVTBAOalOK6oeBqcjvwpWwTiePSN0IyGmxpWi6DBCjIHKXzoMi+OHiJpmk1nUuxoD9TTvLOhR6j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm+lt247TAkjhZdcsL8NUZu9MMe7/loC4g5DpjV2U+M=;
 b=KunevcwQYT5XFeMyI2n6fOCHGqfgLrnV21t9kiy9MVjlLHFdc7mQWANVFShc53hdMnScUmW+VwfDIsJNzpBwoZQGYIlT75rO3rnSuVCZlBxc+KscBvU6sDCVyEB5Qm8A/opa47RyaHBPy2cKd896lrGuZkvwQ1Nx6BSlLNjTCXtatRio9gtV6u8vDkAIZm3mjyzuz3/yw6KqoSQ7TXLRMN6gzaiWj0OAAMaJP84F9l0/RFfEIQPREGODq7D7mq4UzLgBLGK5rMrYdlJe7p8DC7Rjv4f/mvh/T4rVX1ifS7eUB8SqX2QR24haVe+5Js0n1hVNFZIwPdOCFdgMvOOqhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm+lt247TAkjhZdcsL8NUZu9MMe7/loC4g5DpjV2U+M=;
 b=o/2DzGyFD5zOklD8e9IRXHSuP6X92CbMjQRJhHFTFeKNakeAkeWa0UmzI6ipDr6AEk8PDD05HoMk2FpN+4KILPuCaYQ3rQrtOq1K6JxQ5sSqtmLTyJwRx5USJ0NTnZC4DO7p2v5adhH3bbqi1ig+dStlTKrj3/kTQMs9MUzC4rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 17:19:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZTqDjNSBmXeblsud@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
 <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
 <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
X-ClientProxiedBy: LO4P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a694ea9-f3a6-4b33-ff26-08dbd636fb9e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WXzfEkxZDClpThVM1y+ccxAhCtseWRj9M7yaQ4TWeyElZ8fEY3LUscoRkc9cD59YYwL0xExKeFP4RcQOCI7PFffZvt7aTqGUEDPwUgpFAtunMEg1G/7RSq2IsuUgYfOslL3QULbfaVbB6QhDaW3mzMeR/Yfka+bHI5imKQ98sbIZSVUWM5M4nymIkbV6w05nXcXFezlKIWotp0J2lhkh9/bPqxCUOYyVokqnJBnaH2hhWyLEwwSFDN7ZLexU7wEHtN1hgKlkIL+1moQOchvDItXT/cjseSDSiOfsZPebSJuvuqNlrZtdb/U1cPJ65WodOmmvEDU6x2Yrx2pr00zS9oXi6La4GZ/y/rvhDn6LnUMBj/EptVNM3E1MVs6zcz+Q9Ek12PbGQIGUJQZMfptOwGdnrfNXApEM0fbMh4uVRQsEgLdCbjAwvQU0yAqGrndTRvs25Mka1LZ9Y3BVnhgrxoS4ruOyp1zfPlbJgrJitjIqYhNOBQ5eV7W5mDw3XpBGXIlyoC50TAjm6OQOe9MBOq6stk3sQdDyM4rFSIxSXPY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(83380400001)(4326008)(2906002)(8936002)(8676002)(966005)(6486002)(53546011)(82960400001)(41300700001)(5660300002)(9686003)(6666004)(6512007)(6506007)(316002)(6916009)(26005)(478600001)(86362001)(38100700002)(66476007)(66946007)(54906003)(66556008)(85182001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09mUldSYVVsT3NvdDZIbllVcnBPeTJkNUFDMnN3MVBsR0RmTjJMeHEzZ21x?=
 =?utf-8?B?TEo4OGNBWFQrUktjRUwrWTJ2N1RITElKaTZ5TDNFVkxFTXpiQkJHdFloRldT?=
 =?utf-8?B?T0Y1azd6Z1lQeE05dzRzTkVPRmd5T3F5ZE8ya2xpR0xsU2tSeEpvVzd5NGx1?=
 =?utf-8?B?MkRQZklOQUdsWjdTRHd0RWRvUS9qTnI2VTNpRnhxMm5nVTFjaGthQ3BFb3Uz?=
 =?utf-8?B?WE5MK3NIUS96NFpnT29wVUlCNjErWG95ZmFTTWFtVkcyaUdaSjQ0VmZpN3RE?=
 =?utf-8?B?Y2Y0WlhSK1plSkY1ZXF0bk1obWxEQ3dsQXl2OGNxaHlsVjNaR1hUWUVNRnF2?=
 =?utf-8?B?VFdYTU5uMWlOMUlnZldTNHl1STVTWi9seXQ2NFZnWTg0ZmpBdzJGM1UvSnlE?=
 =?utf-8?B?QzdJak5QQzRaYnhobUxJZjJLeU9TMHNveERudW5JT1Z6YXozbkFWT2o1YlJL?=
 =?utf-8?B?QmRCOE5Cb2puSE10clA3ZEdWNXdlRENwTllMWndvdUxjVXJCV2FJVlY1WjBL?=
 =?utf-8?B?S1V3WFd3UjF6RXVBdGdSS1ovTjdSN2hHRFFPSFJaRGFQbHYxZWlROHJROXFn?=
 =?utf-8?B?R2FiSlBIb0lnN0Uxbkp0TjNUUWlIdG9UczBsZ3o1QmJUL3IxYlNqTml6bXI0?=
 =?utf-8?B?UEJoVWliMzhUSTlLMVQyWWxLRW9RdGJPZUxtdThzMno1OCtxYWpHMzBZVVFM?=
 =?utf-8?B?K2ZNd09HSW9hYnV2dVo5MG9VUTJFOUZicE9VTm11YlZOclI1ekY1SzlXMHpB?=
 =?utf-8?B?NFJuSERyV0pRd3NtNnp4elB0dmk3SzdGdk9OWkxTZ0FxMXI5cFRXN3hCdi96?=
 =?utf-8?B?WDNWVlhyVStzM2lKS2JmUXFqNlBVZmZDWGZvK08zQnRUQkduU0RTUGltbkpN?=
 =?utf-8?B?UEQxdUlVSlp5WEJZYzgvdm1nbENXY0dvZ3cxR0VQaUFWbk5pcmVQdmZjN0RI?=
 =?utf-8?B?bnBLeE1TQ1llRUtBM001eUFSeE4vUHVnTXlCR2RENHdsSVZoNDhpeTdNTTJY?=
 =?utf-8?B?SnhHOEp1ZHlsY1hyUHdLK2lKb0E2aFIxQzJMKy9YaGV5ZDVkcVlvd0tLVlF2?=
 =?utf-8?B?OFpzVlpmUWxRbWhVZmZaVjFTMTZvdnJVVWErZzhuQkYyT3NUWUJDU3pJbURF?=
 =?utf-8?B?TEJYS1ljT1RLQ05IMmVob1p6NXdNYUdHb1lMNGtRN1FkWGtCd0lzWUdHVm1W?=
 =?utf-8?B?UGd3M0VqeVJvZ3pzTmVBOG5XY0libEJtZkN3UXRFL0t3OVQ2OUNUak1KMzBn?=
 =?utf-8?B?cmZJZThsMklBa0RrOTRPM2F1LzlDK3grZjI2N2RZL0w3U05LaWY1T29UQkZl?=
 =?utf-8?B?eG9JNHphakg1c21JaE82Rk1IWmxQbVVBM21CS1ZxRlhLbytpcnp6UVJ1RWsv?=
 =?utf-8?B?NnN5VXd2UWlDRzl1cW1iVGVwdlQ5MXVVSlBwMU1OMXJGbnVwWGdZM1J4cHJO?=
 =?utf-8?B?VUU1dXdmVjgvRGVuaXc2Zy8vNnNUZmVTM2RzVUNjUmJ5VTRrdFFoRnVlcldT?=
 =?utf-8?B?OW1NZ0UrMXpJTTdvZGFjYWhtOFZRLzFJeFNzZzVIS0hVZHdPVVhkV3VzMTlt?=
 =?utf-8?B?VTJpalFCWTEvOVFEcmJlSkZDcGFBRkdJcWlpWFpyUHFnL1MxVkUwTXRTeTZM?=
 =?utf-8?B?QWlLcWpzd05VaEptNURZRGUxcFdsbitZUk4rTmprRDRLOE1QcE90SExqNTA1?=
 =?utf-8?B?UG56ZTVHbUxTMG0yWmZLVFh6TUFoZGVXcGJhK3JLRFhQbElWOTRuek1kRXFw?=
 =?utf-8?B?Tm1vQllFZTBmcHE1Y0dWUEFGbjd6YlE2V0pMdWlnOUxRdTl4WVdOcStZbDlZ?=
 =?utf-8?B?T21HUnFjYVhaUUxvbFdndTBPRnNpTEdUNVFHbDl4dDZGdk45cnlvN2FOVk1q?=
 =?utf-8?B?cGdrZXhJRTBPczBWNzVwbmVyQktvVU1wM2ZJSXpZS3VpbzVrT3YvdVdtWmhq?=
 =?utf-8?B?Zi9USWF1WERsOUkrUVlNNkVPYkVhSExXTnZrU00zVVZBMzloRnRGNFJkYUJo?=
 =?utf-8?B?SE5LeE5lUjNNSnZDWUhmQytBaHhVQzZhMUJDT01IM1NSM3ZjV3daMnVaUlhE?=
 =?utf-8?B?Ykl3cklnaU9QaWZRWk1rTWhIMk94djBFMHMzNDJPTE9BejhxZjZIUllqb0dG?=
 =?utf-8?B?d1VoVkhtV0NKQjlWVklFYlRUd2YwbUR4TTdzcFVLSWdjcG8vU2gvcjJTOW1k?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	09+4YaZAiuFdXsoULEARez89PsXK15OVW163GDjZCMcCJa7G50reG4fWvVlZ5nxJAedd+ymfATebzURqegSe6jyqxdxLtQgkqBs+grU7xjlFrmL8BMoao0X0JCCDgm8BBMhule8giD94WAqekaQ8JM4fPfbofczTyjD9jbT5BfkqtxpRlVqm83qpC0pY0o7NpUEVj/CWytc9RBiVuW286wHzVmQdlffdAa9BePLrXxNMBJi02gqcbk8exR3lznRMY9QPYlTaaZKzNhIaq8+m/lgY7UWfIJRs3a6/jrfdicVM0dM7MvkqQ1SWEN+lotF3qwhzt5+dybMVF/mwo7EkFBzmnLmoWyOQ40cLTwD60MLPfWRsIgc2zw1fVD2BseYdpUe7oUE0IhL0PTT04NhQe5wmclSAhcWj56CCxncS0iJ+ttRhTSEvf2bEX2cK+uJt0SGhs8eycFG1Y4xakLNlxV2IGlXb5kxZ6q+rwfp7sjfnHcO4DTOWXJ5C3Q4YWjGuW9BAvIwgtilBu7U/6SyCA8GuHVy814WiefcgFcWLqH7Jfmqo6Yg1AvoQRtYofOM1ddfLkl1CJjNw3kd20ADSCyAiXP/ouzRo3BRbeWOMj8Oe4o4szYeD8KlHNJ1Mrlc7t4J82Iir/QZh7oPJaJ6X3ufT6zJWYvbkBFoy38hKdG6sUEb4ndfdlC6zDh8nKAHDsAf0AwX3QPcmcUfGY/vhbW6F9EQr/g6xS3ewvQiPhRod7xd4DJA1+WSWsnltX2ZpU6IRUTbX2hOL3Q/gwml3Fk3WPT4xTZGlw18iExoM8tKyMA/gnboyUfPxcMcgEbvZwgEuu/FuHBYarYQHZoOIKQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a694ea9-f3a6-4b33-ff26-08dbd636fb9e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 15:19:44.3069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktR0NgFnK71Ge24x1vHJwhQdu+qcA+0XOzIneOz7dfvvo00xysGd/bhlVzt5QrkUFCkVDlxXYAH7niR+LDQBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567

On Thu, Oct 26, 2023 at 05:07:18PM +0200, Jan Beulich wrote:
> On 26.10.2023 15:24, Roger Pau Monné wrote:
> > On Thu, Oct 26, 2023 at 11:03:42AM +0200, Jan Beulich wrote:
> >> On 26.10.2023 10:34, Roger Pau Monné wrote:
> >>> On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
> >>>> ... in order to also deny Dom0 access through the alias ports. Without
> >>>> this it is only giving the impression of denying access to both PICs.
> >>>> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
> >>>> operation later on.
> >>>>
> >>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> >>>> from the probed alias port won't have side effects in case it does not
> >>>> alias the respective PIC's one.
> >>>
> >>> I'm slightly concerned about this probing.
> >>>
> >>> Also I'm unsure we can fully isolate the hardware domain like this.
> >>> Preventing access to the non-aliased ports is IMO helpful for domains
> >>> to realize the PIT is not available, but in any case such accesses
> >>> shouldn't happen in the first place, as dom0 must be modified to run
> >>> in such mode.
> >>
> >> That's true for PV Dom0, but not necessarily for PVH. Plus by denying
> >> access to the aliases we also guard against bugs in Dom0, if some
> >> component thinks there's something else at those ports (as they
> >> indeed were used for other purposes by various vendors).
> > 
> > I think it would be safe to add a command line option to disable the
> > probing, as we would at least like to avoid it in pvshim mode.  Maybe
> > ut would be interesting to make it a Kconfig option so that exclusive
> > pvshim Kconfig can avoid all this?
> > 
> > Otherwise it will just make booting the pvshim slower.
> 
> I've taken note to introduce such an option (not sure yet whether just
> cmdline or also Kconfig). Still
> - Shouldn't we already be bypassing related init logic in shim mode?

Not sure what we bypass in pvshim mode, would be good to double
check.

> - A Kconfig option interfacing with PV_SHIM_EXCLUSIVE will collide with
>   my patch inverting that option's sense (and renaming it), so it would
>   be nice to have that sorted/accepted first (see
>   https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html).

It being Andrew the one that made the request, I would like to get his
opinion on it.  UNCONSTRAINED does seem a bit weird.

Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
Kconfig option in the first place, and instead a specific Kconfig
config file?

Maybe it's not possible to achieve the same using just a Kconfig
config file.

Thanks, Roger.

