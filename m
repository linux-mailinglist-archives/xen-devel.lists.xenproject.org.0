Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07E76716B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 18:04:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571502.895510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPPxA-0001lf-0U; Fri, 28 Jul 2023 16:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571502.895510; Fri, 28 Jul 2023 16:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPPx9-0001jZ-Te; Fri, 28 Jul 2023 16:04:31 +0000
Received: by outflank-mailman (input) for mailman id 571502;
 Fri, 28 Jul 2023 16:04:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPPx8-0001jP-FC
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 16:04:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cb75e5f-2d60-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 18:04:27 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jul 2023 12:04:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO3PR03MB6725.namprd03.prod.outlook.com (2603:10b6:303:17c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 16:04:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::edfe:6f64:4048:74c5%4]) with mapi id 15.20.6609.032; Fri, 28 Jul 2023
 16:04:22 +0000
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
X-Inumbo-ID: 6cb75e5f-2d60-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690560267;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QA9B7yALLppg5NcomVigS3+4g4DJBockdgCLtgOhGgo=;
  b=HYikN1zGOgHZO/Xk1IWhT91JWNn8pM+y3XmdqbIqHhznUH0yPkqtD9Po
   VfSTRAonQgt0XiDt6zYIYGEOmSZMKZnSLNT48eoxBpNRRHGOJBi5P6vD8
   a36aZMjBPq0Lb0jEWUM6T8xFzpEhACXaa6dJ/EIpmxyBt4OmmwPpgWmFH
   k=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 117811248
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:p6IMdK0RPI6VsthcA/bD5VFwkn2cJEfYwER7XKvMYLTBsI5bpzIFx
 mJJCjrQP/aMYGOhet8iPIu3o0tQu5fSy9BnSQdspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfJTtv0
 KdbAzQxNhm8jvqK8q2cF8NhiZF2RCXrFNt3VnBI6xj8VKxjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsi6Kk1cZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiB9JLTefkppaGhnWQ5ysuOTdRWWLnrMuVtRWXZ/RNe
 3ctr39GQa8asRbDosPGdxO1rHOevxUbHcFdCeQ06QeM4qDJ7B2UAGdCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BWQFYzQZSRcE5dbLqpw8lR/JQZBoF6vdpt//FCz0w
 juKhDMjnLhVhskOv4254FTGjjSEtpXPCAkv6W3/RXm55wl0YIqkYY2A6lXB6/tEaoGDQTGpo
 3wsi8WYqucUAvmweDelRewMGPSl4qiDOTiF21p3RcB+rHKq5mKpep1W7HdmPkB1P80YeDjvJ
 kjOpQdW45wVN3yvBUNqX7+M5w0R5fCIPbzYujr8MrKivrAZmNe7wRxT
IronPort-HdrOrdr: A9a23:O7XEPaqDJrHkKMak9rsWjZ8aV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-Talos-CUID: =?us-ascii?q?9a23=3Ar/e15Wj+nxi8C2PxokMf4w0+UDJuVif86SyTCEu?=
 =?us-ascii?q?EUW9WQaWpe0C3pYlpnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOiUNLg4pK1/v7V9Ps0Jw7yGKxoxrwuOTOWpKnax?=
 =?us-ascii?q?atvuoCndZBxGP3A+OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.01,237,1684814400"; 
   d="scan'208";a="117811248"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USdGK2neKmQNe6VeV4qNi5pqhKRUFAv63MnH6TDjcc6XLWgUvMxYO+VOoutmbgyWaiSfyjt1bvNNJtGS77f9aXG52B58OU2EKvHHIteI//TXRlsbb55aJReXGdaDOaMqcuaSxV0EvfyQYQgZrrW+I2L+x6om/JFWEMrHT717dpUgPqyuPClXzrXfyLgDuG26c2BKGB9+NMmNgYR+BplgPOwsjFgRwO6AZ4lScx7zPlBEdSPc4z+fP7Z0AotFtBbUBTregE1yin+zYf3E5IF4OFn5KI9BidJxcLVTIx1Ljq5Iub1ZJruNYLc9/tu60f6Mbuf3VPl+NWzHhacSTWvh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA9B7yALLppg5NcomVigS3+4g4DJBockdgCLtgOhGgo=;
 b=TIw+4klW7BZ2BaDmzRe/FxEpx5IFAOJ2+84ht0g2RTEGcv8ByiMqyO4PFGirlyvnER69Hv/EFQcmXGjUzLdy+bek/+3cew33jxzRXafx6Y4eHDdMU2/g6EGEfzbY3+C0hpIyqPsEtZ8FW4+hscWJOHixLK9z+HNelVN8BrPdtApg2UGct3tpJK5e949WxLLEbXVT26LUVg+N0K4Iv25JixrF/NuvsayvT9KIt6Cf7cF0eGILLN1FOw+IXoefT5wX1B1KAz7pX6thfjl9GKb/vHUuD8PThmWUi7loNIs1797SdVDV2logQfK3RNC7Mo/0xiK9x5nRhzgJb6niuUTP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA9B7yALLppg5NcomVigS3+4g4DJBockdgCLtgOhGgo=;
 b=dWvTMAPTlh0+Yf4rLWhZNeSeqQS/dD+EHlKnrYLfuy1lld8jc3UcMggam6fwUid1Hz9Zyb/C28jqluGAq87tq9tu0wclmaRBCHxrPtS93op3SBlNOgQhlN8aMFokOVV+Ie20jSZcMM1qNLoLxhh7LYRUpG+QVc3QdORZ5cY5gDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1c181873-bb65-46b6-841c-47748662b10a@citrix.com>
Date: Fri, 28 Jul 2023 17:04:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen/keyhandler: address violations of MISRA C:2012
 Rule 8.3 and drop bool_t
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <7cb2183e6e387c04547b57b6f9f95c08bb613019.1690560051.git.federico.serafini@bugseng.com>
In-Reply-To: <7cb2183e6e387c04547b57b6f9f95c08bb613019.1690560051.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO3PR03MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a04af5a-34b0-41c9-f700-08db8f844e46
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/NOKkpDOSLMN5m20F7lFnV6GAlDNyGUPvdQSvZcwUwG6p5vF/cSoQd1SQ9MNbc1Pz01DPf8p5kw6CezKwI5lFoksPno8ZLaEFiVRjLibEFfyCQV/RrSuZ5ilabBIxQ5E5P6GUs3S2DdD93vtR3q3Es8ym3I0cyLIkic46TeaOnJ+JvuIwh6PY7nJDoYtNtT7TuwGcGN6oEDYFtL2QGxcpFfznp6Jg83plxCnYvzJMF05/Oig+gaGED9LNTKHQp2gUXWMr7Q195H2RL0Ip+2jjuPnbduzZ6NyT9EHKMXpN/K2zrZ7Z1Yxld8sc3PySOju7fpcs4AVOTVselaVI4QEXcUjRChjVohNJcQuAyzEARzftWgSivDRSbkirvnaN3nxTR4vjfzscNcAFX+PKpIXwWCwKLnSVOvRE/V306JGK4AuJCXnBf+G68L0HCSpOtAxnqupSFDRUcJHgiSg5CCDMWBs7UJFTRC/R9LYY+HnjbvrDHSiXzfgvqohclPq+SI/uGJ8GmSWv8M0r+M3zGUvtoMV+cMq9XhO56Bf9tR7ZZn94zgosnc+JeHNMjDTuf+/jK8AvuSwmmipW3pOYIGK4AVjUMjJQOoTIvGTuOFwJ1fILThj/GcmzqOgJlF72rrfnlMEKRzpVDpHtXTrP76YnQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199021)(186003)(31686004)(54906003)(6512007)(6666004)(6486002)(478600001)(36756003)(86362001)(31696002)(4326008)(66556008)(4744005)(2906002)(53546011)(66476007)(2616005)(6506007)(26005)(38100700002)(82960400001)(66946007)(316002)(8936002)(41300700001)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTR2RnBJMGlSVWV2NHlmNW5DNTVqY1RtVnRPeHRZUkJiS1VkdFRnRUxHOFNm?=
 =?utf-8?B?blVlRVFiUnkyRzVIK3dvaUdKb0tJQTA4dnNOUW9GRU5RYWwyblZVdUhoNnZC?=
 =?utf-8?B?VmkrSHd3a25NQjllOUtOcnhxb3VMc2trVkJkNk1Sbm4rUndnRHZLeUtqekVO?=
 =?utf-8?B?YU0yZ3lxN2phNUdJU2ZydE1wMjFYcEgzVjR6aTlQR240VGUzMEFUZlpjT3BL?=
 =?utf-8?B?VS9aTVd2cE0wVHFEeUFnQklOc0xGdS9LUkc2ekxuQmdXdDAwNzdRdlQrLzU0?=
 =?utf-8?B?bnhJVkRBd0k3eVlCRmRYTGQrRHlvZGtuRnA3Q0hBTVJjUmVVZzZnTUJiT3lP?=
 =?utf-8?B?dFM2NlNLY0JEZDlkb083Vkk0TlIzYnkvamZwN2xRSzY3YzliVE16dWI2ZWVN?=
 =?utf-8?B?YVcyVVlzaEkvTi9WZ3JNdExCR3VJRXRkYTljS2xyc1JXNW5IcTA1bURGbnBQ?=
 =?utf-8?B?aXVWVXRjY2JaMDY0TzJIY1RTbml5TjRJWmI4VzlpVS9qVzFaQlZCRjJtYU5Z?=
 =?utf-8?B?TGFBME5aVWV0OEtDZFV1OXduU294bW5rZFNLUGZDVjF1QVpya1k3SW5BdGZu?=
 =?utf-8?B?MTFxaFdweTFSRnY1elFrcUVnUkRubldueFNpQXFaWTg3cXhyWEFBUHlZaCsv?=
 =?utf-8?B?ZVNBYUdDU2UrUTRRVlJZWTI5MEZwbllpcXRSM0U2VFlFQWVlc0Z6ZEx5QXhJ?=
 =?utf-8?B?cFlwbkpMRXUxdGY3Q0lVaDJxWENvN25QZlc5NmVHc3k5RVFCbnVmcWVqSVMv?=
 =?utf-8?B?cHdZelRiM3EyR3EyV2lQUjRxTGFoNzk2K0hNR25HY0w3QkJyN0w1eEdsYk42?=
 =?utf-8?B?VnNrQzdEb0ZwblJqM05va2M3YnNsSm9aeW1xV0p3L00xb0M1VDdxS3dJTEJp?=
 =?utf-8?B?d3Zma3FIUlo5Mk1rQzFscFRROSsxb0VOOUVTSFRUay9QeEtFTXdXMEp2K3B4?=
 =?utf-8?B?SVBab3J6eHlLdS9PMThvMWFZeWVvUXU4ZU1NbnRpb3daaldFSDIzWjJGQmxV?=
 =?utf-8?B?WUpGeGdjQ01zdndBVTZLelRwcldkWnN0MEZpKy9BZWhBUFN0TjNwVFRwUFQ2?=
 =?utf-8?B?U2t3UlhlM0haNDkzL2lDN1hhd0srcmVsQUVad0Nvbm84dTVZdzV3VFNkalBj?=
 =?utf-8?B?aC9SM1RBNGdtcnlCcmJZWWlBcjFESGtRSnhyVkh5bmpuU2hRVDI2TVdZMjZy?=
 =?utf-8?B?UllIWUpaVFpMa3c3RVBqN0RyZE9hWVhsaHdDMzdtWjFndzlBUE55bFpSTFRq?=
 =?utf-8?B?OVQ4cTc3U0orWjNWYzBOWFQ0QkRkTnpPcWV5TEN0N1ZTajJ6ZFg1T3ByNjF5?=
 =?utf-8?B?enNWd2Q2dDlSQksyZHdoazk5THZMQlZZY09XV1B2ZkJGaDNFWFFQWGtsWWpw?=
 =?utf-8?B?MmFVSXd2UTRhZ3lpczZ2MzJFZTdyOVdERDdBdVRZaVM4a1o5akFpbENDVkJ6?=
 =?utf-8?B?T0R3MndlN1NyMkFlQ3dJZngyeHMwUkRaSFNhNkpqOXp3Uks4ZWFxN3VDdXFZ?=
 =?utf-8?B?b0htTDUzcndQTm5SNEF0UHVLc0NyVkJhQW94Q0Y1T2xBT0JjQVY5K2pTTGFz?=
 =?utf-8?B?eVRGME1uTmNoeDlaWmUxL2E2cWppRlBkdnE4MHpCU0lqbDdlQWN2NnIxQlNW?=
 =?utf-8?B?b2dVWlgyQmRrTEVZMGFNNFNaYVdpN0tUWUUzcGwyVldFNlQ1QldndzRaalpt?=
 =?utf-8?B?bzVxRC9jWWtTM2RXMFlMcFU2RXFQZTNNd3BBM2RMTkJ0cU1vM1JDYS9YbzJK?=
 =?utf-8?B?L29YWmNBUVExN3NJc2cwY0V0blI0eWZiWFZHVUNCL1VDOERyVVJYT1RMN3lI?=
 =?utf-8?B?WU9wV1l4dkZqZmxsdDJ1MVFmaFlkdkozVW9BdlA2ZkNZaGFpZVJGaWlaQ0NI?=
 =?utf-8?B?YTEwTEdzbG1XeFF3WWpEb1BjYjhXRkJZSEh5SUhjMWgvM3VLNC9Fc0paTTRm?=
 =?utf-8?B?S2pMNTRhWGxHRWYwMXk4eFNqVTNtT0FpR08xS1pRN3RwWHRtNDh2a0NkellJ?=
 =?utf-8?B?c0djemZFNS9EUzJ0YU1kallNL0pFdWo0S1V4UVBSbmxsVFp0RVRxQzhZb3FH?=
 =?utf-8?B?RXcvYllmT1BBaTg0QWZ3L3VjL21seVR2Q3poaUpjMVJ2amhBY05qZFM5VmN2?=
 =?utf-8?B?ZWx4dlZJc3NIM3h4TkFOaStudHMwTmRLeU5qYTJvdkREN0k1TlNoTjFzM1h1?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Lq6ulcut5wy0xvu7sSh82ozk53CEKP3PTIYUMvBmdr68zKebXJEKCzAO0+FZoAE42Mb/38akrG3E9QaNbRiiTBCo/py1HU0T9e/vqpwnNsOQWUfSuXF/MAWR0s7HN1zgqUwNmSphEJ7Z/QnL4DsHqPdmqbmhznyIm5XcNTqzH5hqsS2V3l0riNPJ5/PqmfJ1rwxdYLkx3XXiGGPWu5YVCxwqE7G15fwijVS7fMVhpgkUw0lavQki0298g9PhXzx5K5lYGDKWL10m4IrqZocfwsZwGcqItCZsf/7Zos/FVxJTCEPtQyIwUcXviCe4IMSLvQIXGLcpoEfupt3TXjkyO0II8asqztqn15sAMxwdwPeNi8lwR2NbWOGLeGLwtSUNeVpVvvgC+2nhi2I/k1hS1aC4PEPA/qz9o9mZCOpgZYzuWhKbkG4dIFk91FAxaiPkizYYoILqk6bR7WB3BFhuC0UA4To7kQdRNDImj1b7OWtSG9swGFzz7N8QMpUBpihMbt4KtdwgE6KL3WtEIdldn8aIq3DLJtM6t+85sU8zd0TUVgpOs+1OnLHl4VbFS62w0YtXOVb38+qf+63KkqUIFGKctd2r4wbiugWUhrcfgXXJDOdiRTlgrJ3vXv0V086cQ/l+wVOpt14LGc93zS90ZIiAA6YkFG9gLCF1o5PwMvnvhIoSKN6kMaDVEHbT3OUbPHj/kM0nia6immhm28fq9SstgggkVMFlEXS5H4XL2hqdatrK/YJL56TFSproKf3vZrBoTE1WOZCc0YlDw9EAgk2X4ynnWPR8z8znlAtKYtfRpmFIbyYRtfwNgbQ9PYES0ortgnDL4J+PFFNtaTJMbhuKBpyTsVCR0R5Tf9+lbtyNHuSxLlG1DVRMlxRzMVPE
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a04af5a-34b0-41c9-f700-08db8f844e46
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 16:04:21.9638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC0LoXTL1eW342HLyqcJui0zdquNAkVKC2YBNk7j5lMslQqSuJfdUS3geiWBeEJYGZzan4grOsmZGUwzrJdlxJ/yo5SpRufYP8+liSYWH3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6725

On 28/07/2023 5:02 pm, Federico Serafini wrote:
> Change types in function declarations to be consistent with the
> corresponding definitions.
> This addresses violations of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
>
> No functional changes.
>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Always glad to see more bool_t disappearing.

