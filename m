Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3D76E452A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521932.810939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM4G-0003FF-0p; Mon, 17 Apr 2023 10:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521932.810939; Mon, 17 Apr 2023 10:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poM4F-0003Bt-Tr; Mon, 17 Apr 2023 10:26:39 +0000
Received: by outflank-mailman (input) for mailman id 521932;
 Mon, 17 Apr 2023 10:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLV6=AI=citrix.com=prvs=464b9e9d0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1poM4F-0003Bk-5r
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:26:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53f4cb9c-dd0a-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 12:26:36 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 06:26:28 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB7065.namprd03.prod.outlook.com (2603:10b6:510:29b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 10:26:26 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 10:26:26 +0000
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
X-Inumbo-ID: 53f4cb9c-dd0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681727196;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=AhAREnHbR5KLramCLS/upR+E6O4jFabjJHFlnW1s46U=;
  b=SOMgbcrV25z6UsXWDYnj7e+A/061Oy7C4juf+Bk/2GFhyinkWX09yoGy
   bQPjUMjPxtOGLIGTeItLZjO+LD6mx/EpyjfYzkHF4MxfkMmmUu7x+ypgY
   pS5Mq7WfIF5z1Q9oSj3lH61hVuaPSdz5/3VXFRrorqJYptTra7+f7q6PN
   Q=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 108227600
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rNLLEakEXN1Q5p/sELOhVq/o5gxRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYCG/TaPveYmKhL9B1Ydy18E0A78PcnNUxSwNrrywzQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5QGGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fwbFQ4kbhuGu8i/7byyEMZ8v/4+HvC+aevzulk4pd3YJdAPZMifBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1c3jOWF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXOhAt1MTOXQGvhCoU236VYODhMqfFqS/ty5kFa/Yt1FN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml0avR5ACxB24aTyVAYtgrqM83QzMx0
 laD2djuAFRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85jrKR8xmGbS4jfX0Hy/x2
 DGAqCUih7QVgtUP3q/99lfC6w9AvbDMRw8xownSAGSs61slYJb/P9D1r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb5FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:zKCQD6z/ku69dH5wRI1NKrPxS+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrXAgWVxRAXVhJI2PMH/X
 LemwL0y62/u7XjoyWsmlP73tBzop/M29FDDMuDhow8LSjtsB+hYMBMSqCPpzc8pcCo8RIPnM
 PXqxktEsxv4zf6f32zozHqxw78uQxeoUPK+Bu9uz/OsMb5TDU1B45ogp9YSALQ7w4FsMtn2K
 xG8mqFv94PZCmw1xjV1pztbVVHh0C0qX0tnao6iGFea5IXbPt0oZYE9E1YPZ8cFGbR6ZwhEs
 NpEMbAjcwmOW+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xskHVw3yIjtbgit0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEaderC0TWKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5Yj2gvYEjjYPf+kqGjyiq9A1lVYA6diP23v/NCy/jBrfvQQGK+oWkV4oudS651OLyeZx
 6xUKgmdsMLY1GeXrqh5DeOK6W6GUNuLvH9hexLKm5mgvi7XbEC5darBsr7Ff7KLQsOfF/ZLz
 8qYAXTTf8wnHxDHEWIzCTsZw==
X-Talos-CUID: =?us-ascii?q?9a23=3AyQiXHmuCvJc9vnwLy6/BLoKL6IslcUDj5XfbJnO?=
 =?us-ascii?q?SAEtnQee6WWaq5ZFdxp8=3D?=
X-Talos-MUID: 9a23:QzsK2wVH16/YQdjq/B78oB5YKcFm342vIR8okY8euvCLLzMlbg==
X-IronPort-AV: E=Sophos;i="5.99,203,1677560400"; 
   d="scan'208";a="108227600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQTNBFMT+pwNk1VrQfUkdiFILR5VoR/r0NSSJO8FH+ORYS/yV43PmAe/GabtSPkwn6U8uAbfND0+uvii5WwFJpvN6ZYdFjBi6d8gfmxt5KthfTpyPy2SGSLE167vIs63PH7Kh0cnqiT5IFU1YwQTbXsnSh+5x7E7KBPFpG/mSxpL9ZZ9FjeXz7G4gIcq3crCbKBi18EKaKnFsNDy4eLjp6bhhoGB8Ah1eKebzj0YrjxdDrbKtIuVm+f9TK7PpuGamMf7FS2sc8wTTXrgV85B8MrpPpv/93PdJ48UvLmxLLen8MGUOXvWMCfliXnaFGFXoSP8yaB5OfSIeqmgZokgrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zgd2FIFviWWFFsHRnPV6ruCFrjWqWs9TWr9RN26trZI=;
 b=OzWvrLqcaUIKseOWSNoiBhFVD7QdPe5UCHNtmiBZOoFaWIUz/SiRo8M7nVLQnS9ZaRvCR7zsdGev9FAyLCP9PaEc1Q+vQNsAWFk2nTrW4100BD9RcYlL49NSkjh0zKepTL7k4VWYkUJI2ME2DoBv9CavIs+YY7CbB9vs/+5huRwx97tmKVminH3BteJdZFCFI5bGkPKT/TJ/NGI6D56aH7UyVpk6mYDEpm9x2rtHYZ7ndKjVFHdCE9PYLJfnUN8fnpg2T03oShYmmtXQSqYjwuYbKgFpa4Vo/vSzGW98XR129cajRa0ZTWO3AVqgr3+jNHSJi6zK28l/sclHFMik2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zgd2FIFviWWFFsHRnPV6ruCFrjWqWs9TWr9RN26trZI=;
 b=iJ94UtsN1fIXQnJQOiiX05zM2gKKkucLfLM6639FbujkasmDyzAfM1bOg5/9UDhJpSezO45+8jENdkOXphYv08q2T3lSn2bnzFQGISBZE5/MC7Qsm8dc/t3VA6wpbXGRwh+RqFtXN3Rb/YRRKJO0TUV9NINtCijkmU7m2wTYhdI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 17 Apr 2023 12:26:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: RFC: disable HPET legacy mode after timer check
Message-ID: <ZD0ezeo6AIUYjGe4@Air-de-Roger>
References: <cb408368-077d-edb5-b4ad-f80086db48c1@invisiblethingslab.com>
 <0ac3fce6-dcd2-4521-6207-ede4d90e656b@citrix.com>
 <ZDaVPiJTt8q74nQw@Air-de-Roger>
 <2094ea22-a58e-fde0-8a77-f13675161a4a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2094ea22-a58e-fde0-8a77-f13675161a4a@suse.com>
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ae2a5fa-df37-4f56-dcec-08db3f2e3336
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B1nT8vm21pCET1YcIe79swcJeXctXeTRvTMWIckZmNFqp0HQB85eFZN3Lr9riAOCc0ww5A+xShSDH3PAedlNqmEjvvvTs2BE0kM8kCc6mebTATjKbyUg6M5GSBoTut8iEdFPVKrgVNrz/LaNI0fiJBgMm8+P9DmnCO3g3xbzBNI3Ylb0y8OAwwG2s04UBfWho3Be7OO0sk8njgbB78KTnGW46oG1E5wFblmXssgOkc9CLhxBthcIwOnTdWIe0tKzMsng2DQ7dMmDe7j5yJFpfGel+RMyEuY+W3osnSe2RlMSqa/rGDRZCZJOGiNedilasqaEjo3u5aTKRZuMI3Ai5OxUu9MYaP1k1/WQoV4bRpgRWqmh76p35+ORc0kliMWVlO19OSkS0h3VMsXIY5mCZVo8k1W3qwR4jgPysBi1jZrPwCabU6xsSdqTiDVV2oLeL6kC54nzg11vAubZ9RiS7+NAewad6OKtHK2u45tTFE+2h2ByyueBZA5XoToaPIhmiG9oR3MRMz+bkn33L0vIlWspu4lf+bJn0SBGaEAoypabZV4rrPepdGyL31DhrRvY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(376002)(39860400002)(396003)(346002)(366004)(451199021)(316002)(53546011)(6512007)(186003)(9686003)(6666004)(6486002)(86362001)(38100700002)(26005)(107886003)(33716001)(6506007)(82960400001)(66476007)(66556008)(83380400001)(66946007)(6916009)(4326008)(54906003)(41300700001)(85182001)(8936002)(8676002)(5660300002)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnNpOXhrcnBUdDE4YWxRd1FjcEoyRFJHSTlPRkIwaENZeGRnL1lvZUpEU0c5?=
 =?utf-8?B?ZnhzQ3ZoaVJRZnpic3pwK0t2VWhlVThzVkx2S0NzUDVTTzFxUEhLM2ZZS1dt?=
 =?utf-8?B?TDRUTWg2Z05vMTB1WjBvS0E5elNNdU9tcmU3RzFwM3V5U3RUMzg4MzE1ZlZN?=
 =?utf-8?B?NUt2YkphZ3cvcmszRnhXaytUT3dkaXRxb1dBZy9IOWpJTHRuUHg1YkJEZjIx?=
 =?utf-8?B?d3hBQlFkS1c2bXZGbGcvTVBHS21Zd3JEQlN0MDdnT0w2a1ljK1VyUmtBWW1i?=
 =?utf-8?B?UENXakl6SnV3ditmS1VVTWxWV2R3NWg2cjdLNUhTR21nYjJIOVhYZkNJR3Nr?=
 =?utf-8?B?SG5wZGtFOGRsNjE3V0VuZWJPRGZyWThjNE51eFR5WUN4b3R4VnlLcEpzYTJR?=
 =?utf-8?B?YUN1dHlFTWhXckc5ZHcwMktJM0tla0VpQ3lmMWlzQVZNWGhQWWxZVlpYZmxE?=
 =?utf-8?B?Ni92U2xDc21td1F1WkhsYTJEU0R1QzNudkN6OXhFMkJObURFRmFwZXU3aDFo?=
 =?utf-8?B?T0NoNytpODRrR1B1MHhYaklKU0R3ak8yNWNNVXQ1cDJyMTJMNzNLR2RzZVBw?=
 =?utf-8?B?WGVDMWQwemMySnluTWFSdkI2Q3ZKNDdQWWJ4UFlydUNjMkZDa3FWRmQ0MlNC?=
 =?utf-8?B?dmZBd0VxS1Q5ZE5jVlE5b2N3cUNyOEpzN1crNWQxdnNEQ1lXSlc1V3Zha2FJ?=
 =?utf-8?B?Q210TmV4VXdJVmZ3WWRaancwZHpxL3NPR0tHTHcrWTFjUGVQRFdIYWRZK2xu?=
 =?utf-8?B?dDRyZ0NTUnVzeVp1ajErOC9zaW9jTlZrK08rVjlmOWRaakMvbVZSV0VCclIx?=
 =?utf-8?B?TEdTS3o4UnNIbHJVd1dWaTd2UkJOS2FyL2J3OGZRa2oyNWlBaTIxa20zeEF5?=
 =?utf-8?B?NXpmQUtGM3dxRTR5WnVhUFVscXlxQUZmcXBwM3lyTFF3QktUd3k5MmJjOTZq?=
 =?utf-8?B?b3c5SjFCdnZUU0lqcjNaRXRRMk5VMGRObGwyM0QxN0c4SUF6RFhIOFJBYzgy?=
 =?utf-8?B?UzJxMm96QWd3cjBTR3dscUhzb2UybnNZQVAwcFlIMU1UOTFLUE1vUzlGQm05?=
 =?utf-8?B?NDRHUkhtZEpTaVlFUG9wMzRYYU5SV0VuZm11dzd4aDRLTVhWRy9mRTIyazRq?=
 =?utf-8?B?TFEwdklRZ2JmSmhxaSswcE1zVDRRcE45Q0xyclB6czhqdGkzdnoyV3pxRUlw?=
 =?utf-8?B?L3NONkxqZHdqSXNQa1JHcDNWRk9TelJDK0NPTnArVHBrZko0Uno3QnNwSzZG?=
 =?utf-8?B?N0FMVW9MT2hWT294NzBycFVCOHJnczNqY0VPU2tIb1JIOHFSbTllbzgrZlkw?=
 =?utf-8?B?SXRmdzZ1MU4wNCtDNTJLQUxJWmNOK2x6NFRJWW82SmNpSGdqdGJnTGwrRDZ5?=
 =?utf-8?B?QTJnU2Z4a0FFT2htWFQvMHFDTENsdXFVNHllQnNDUG5XTWpmeFB5YUtlMnRo?=
 =?utf-8?B?ZTNtWjNzYXRwdzY0RVpQSHdUZUhxdFhyWGxLelZ3ZEMrZmhCN0NVS0RuOXVQ?=
 =?utf-8?B?OWJocDBVSzNzSjQxTlc5WEY3dForSVlZYkZoVk85QlZMbG1QL0tjN0ZreEo2?=
 =?utf-8?B?dGRZYVI1R20xZGI5aGgrbmJac25WSlg0UVN5VmYvZmxBNUdjMktDVzFkeFBE?=
 =?utf-8?B?eG5uKzczRUtMQ3VqTnJzMXJaL0x6RU1MYXhZQ0d4V1VrZTY3eVBVU05BdGFi?=
 =?utf-8?B?UU1TSUpUQkhMTWRVK3htMEJJbnpYaTBBeGx3ZkVPaDUvQmcvWjJrNVZQaUUw?=
 =?utf-8?B?NjhRNGpWU3d4UnBOVDUzNFFvdHJUK09taXgwMjJ0NUlUL0lZT0dvNldwaFo1?=
 =?utf-8?B?K3NTM1VaMXVueVRqQSt0MlNTaTlGbGpROTRMSmhqTmhUczlLZWV1cjgyS1Q3?=
 =?utf-8?B?QldRZmFqYnRsaitKSUxFT2ZwU2FhQkhtZjY4bWlQTFA2MFdyQkc3ZXFkVGNM?=
 =?utf-8?B?TTJMT0MvUkU5YUY0RVpzWXl0RFA0Q1JuOXFMdFJuUU53M2l3WUNRYlAxazRt?=
 =?utf-8?B?dTJMay9mSkMvcXlyYWVlYTVqSDd4UXoyNjB5bW9GUlMzcHN0SnFFZGoyNEdG?=
 =?utf-8?B?S2NiazE5alBFRGRxblFObytHQVJsclZ5SEdKVkRBc3lMZ3p1UmE3NHhoTThk?=
 =?utf-8?Q?lOZzpjiITqp9vk4lmXShXehp7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ref431zevfkxIi1R006L0aG4amod2Wy+qnz2P7wD1PxtUkxTFsc5s+QPLibVFF7fWPNFxtBrczxfrbH+jxUnBHEotgXlycEnPbmn6UB+8GhLeCN8xe0+J5IxXDXpw3sleHnioGNDgbZRW5UvALWfzCsKFrSDz8l4RA4wEGtB7hBws8ZaBKHdHukfb8c6lcthhmB2QbsLJm2jw5mQPRBlBedZtL0IhbtXU9vlzgl2qLHMObZ0/Xwgp6ohNLkQ9NUO4eKhpRDJCzwvEpE/mkE83Bcm3S/y6UobHWnHhDuUPFpvQOpBCnlxUXbPTcTSlvpabx3bY8q46LxzFWOIBs9B4kYKyugkwABMjcgtVn7scL8R6VLDhF0pxthJJD8VLwdFmHjbVEpgTit9M7JjdWer++XQFjjfo/ZVB7QzLMcXzg7ohxVw3Xj5Khemn9HqgT6pLpxMz5hc97lsSQ+u/OMFcMDt8DHn+iF7dD/QXpeydQ14MqHGFivIchurIVSFiWrBVZFgXVp2mbkhFFRIOe6aEYQ6S4PiPZunrOquLS1jeK4iK8EaQr1Z80c5vpllygM/V5wBvBh8qYUkGTz3Q9CjmXSvbSDtdpmuv/MntgXNhbuRBDqjZjqeMKgPseqKkP1wVoHWd4FO3AIZ5DeEGhZFV0/8Gy/bw4RPxAwd2MDtHPerrBsKyMnVl3PW1di6ahDYlkj0nP9QpPYbsf3V9T1rok3Xfh1Jsu2TUEkBlIf7PqpEIy7yhcV28SlpuegIVq0Q4OQTnjaO3QYIL8pppKX7NSc8nchgkEp2308gNvhzG2NuAmnP+wKZbwTCufTSNbmc4++o7J6ZWri9xdiFI6g4VbIlvYA+Ri6OiriAx/NKl4A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae2a5fa-df37-4f56-dcec-08db3f2e3336
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:26:26.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dP0/oAnqHyDzkNVODi0dQFitg/+sObqY1ZbCLOQVKL6jU8EfHfroMCGJjHH4RX/Och4SZjnMeXqzDsmAeq1QEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7065

On Mon, Apr 17, 2023 at 10:49:38AM +0200, Jan Beulich wrote:
> On 12.04.2023 13:25, Roger Pau Monné wrote:
> > On Tue, Apr 11, 2023 at 12:20:13PM +0100, Andrew Cooper wrote:
> >> On 11/04/2023 11:30 am, Simon Gaiser wrote:
> >>> Hi,
> >>>
> >>> I have been recently looking into getting S0ix working on Xen [1].
> >>>
> >>> Thanks to a tip from Andrew I found that the HPET legacy mode was
> >>> preventing my test system from reaching a package C-state lower than PC7
> >>> and thereby also preventing S0ix residency.
> >>>
> >>> For testing I simply modified check_timer() to disable it again after it
> >>> checked the timer irq:
> >>>
> >>> --- a/xen/arch/x86/io_apic.c
> >>> +++ b/xen/arch/x86/io_apic.c
> >>> @@ -1966,6 +1969,8 @@ static void __init check_timer(void)
> >>>  
> >>>              if ( timer_irq_works() )
> >>>              {
> >>> +                hpet_disable_legacy_replacement_mode();
> >>>                  local_irq_restore(flags);
> >>>                  return;
> >>>              }
> >>>
> >>>
> >>> With this [2] I'm able to reach S0ix residency for some time and for short
> >>> periods the systems power consumption goes down to the same level as with
> >>> native Linux!
> >>
> >> Excellent progress!
> >>
> >>> It reaches low power states only for a fraction of the suspend to idle
> >>> time, so something still makes the CPU/chipset think it should leave the
> >>> low power mode, but that's another topic.
> >>
> >> Do you have any further info here?  There are a range of possibilities,
> >> from excess timers in Xen (e.g. PV guests default to a 100Hz timer even
> >> though no guests actually want it AFAICT), or the 1s TSC rendezvous
> >> (which isn't actually needed on modern systems), all the way to the
> >> platform devices not entering d3hot.
> >>
> >>>
> >>> I tried to understand how all the timer code interacts with disabling
> >>> the legacy mode. I think it only would break cpuidle if X86_FEATURE_ARAT
> >>> is not available (Which is available on my test system and indeed I
> >>> didn't run into obvious breakage). 
> >>>
> >>> Is this (disabled PIT && !ARAT) a configuration that exists (and needs
> >>> to be supported)?
> >>>
> >>> Did I miss something else? (Very much possible, given that this is way
> >>> above my existing experience with X86 and Xen internals.)
> >>
> >> Xen's code is a mess and needs an overhaul.
> >>
> >> Right now, we're using the timer as "a source of interrupts" to try and
> >> check that we've got things set up suitably.  But this doesn't need to
> >> be the PIT, or a timer at all - it just needs to be "an interrupt coming
> >> in from the platform".
> > 
> > I would even question whether that testing is useful overall.  We test
> > a single IO-APIC pin, which still leaves room for the rest of them to
> > not be properly configured, and Xen might not be using the PIT timer at
> > the end.
> 
> Testing one pin is sufficient for the intended purpose (proving that
> the delivery route platform -> IO-APIC -> LAPIC works), leaving aside
> firmware possibly configuring multiple IO-APICs inconsistently. Yet
> if there are multiple IO-APICs, I'm afraid we have no way of knowing
> how to trigger any of the pins of secondary ones. Even if we went to
> figure out what devices are connected to it, we'd then still have no
> (rudimentary) device drivers knowing how to interact with the devices.

That's why I think the test is not very useful.  Also the delivery
route not being properly configured will be quite obvious when dom0
attempts to to use any device, as it would get timeouts.

I think it's fine to test that the timer interrupt in use by Xen is
working, but forcing this kind of interrupt delivery test doesn't seem
specially useful to me, the more that we keep accumulation workarounds
to make it work on newer platforms.

Thanks, Roger.

