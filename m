Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BD75AE21
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 14:17:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566575.885580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSa9-0006Nx-AH; Thu, 20 Jul 2023 12:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566575.885580; Thu, 20 Jul 2023 12:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMSa9-0006LW-6s; Thu, 20 Jul 2023 12:16:33 +0000
Received: by outflank-mailman (input) for mailman id 566575;
 Thu, 20 Jul 2023 12:16:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/JYs=DG=citrix.com=prvs=558be806a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMSa7-0006LQ-Q9
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 12:16:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e79d311-26f7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 14:16:28 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 08:16:06 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by LV3PR03MB7383.namprd03.prod.outlook.com (2603:10b6:408:1a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 12:16:03 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 12:16:03 +0000
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
X-Inumbo-ID: 3e79d311-26f7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689855388;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=n6hx+pNvDFrfsBhLJ/QiklBp4LV1mFFncvyBBOa3wHc=;
  b=XigM/isw1egI+EHZ9ij602/TomXiN/tfFwVZzTEc84feOdYqAF+CGQGP
   xTAUDkdPGrRQiXtkui/DjDEXw8Sz75d4MZeit/dd4v99CQIfC4xFlxZHo
   79ZKOriBUPdThL/qaX7L+HaaeKqTx1C9wp9Ar/tqkeeihOTuoq7r/7TpL
   c=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 117291112
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/0WsO6mCWO4BFhMmCNFAFSTo5gw6J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZW2vXbvmCZ2GhftolOty/8UsF68ODyIUyT1c5+ylmHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5geGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dwYLx5UTzPcvNr1xKOKTehd3cQfdsa+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC0WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqkAtNLTeTinhJsqHiv/25IMT0rbnqioMP+hkSVAvddd
 UNBr0LCqoB3riRHVOLVURC0rWSFtRlaQNdKGuM77gClwLfb+AufCS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9JmgEfjIAUQoD7PHpvY4ogxTACN1kFcadjNf4BDXxy
 DCitzUlivMYistj/7q/1UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBIOYRVmIu
 D4DgdqT6MgHCJ3LnyuIKM0dEbeo7rCfOTLdiFJmHJ483z2o9zioeoU4yDhvLUEvMdsBcCWvY
 EbXtQ5LzJZWMD2haqofXm6qI8EjzKylH9K6UPnRN4JKesIoLFbB+zxyb0mN2WyriFIrjaw0J
 Zacd4CrEGoeDqNkijGxQo/xzIMW+8z3/kuLLbiT8vht+efADJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:q2yhHqpgw7fqK298KLlRG+saV5oDeYIsimQD101hICF9WcaT/v
 re58jzGyWE8Qr5OUtQ4exoXZPrfZqyz+8R3WB8B8bBYOCighrKEGgA1+rfKl/baknDH4dmvM
 8KT0E9Mr3N5DNB/KHHCWeDYrAdKRq8nJxAR92y856gd25XgmhbgTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AXPpFyWpFwUSXkqsDUXSZgsrmUeAldVOE7VSPGHf?=
 =?us-ascii?q?7DXdYT7ykEl+soqwxxg=3D=3D?=
X-Talos-MUID: 9a23:/iG4AQVU6TCtzZXq/BrQvTM5DedV2IW3CXpKnZ8t4uyGayMlbg==
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="117291112"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3qaGng52C5ceGYznhSHRt/77CV/Yp9cwAvXVybrDyXzgD+WRcBfy22TMBpAOSsQbUOtuWefWDUw5ZTZNyYUHVa3nijRNu2ZHs2SlsM7VMSzZ17Fv7TzMG8BhZMW0I4Nr3blCiIDH97dfS6aVtH3ltVlgQhUSG9py+MuszZHZBq1e8gP6qTrAmcpGQMLk53qDaQebhNiI0xKD0Hb+C8535OursC1mGQ9oqTU8sKKKoElroSnq+Ym5TVqolBKiLv3b8dXqyg2aqiKSj3Rn2zAGtHzUysr/PNIjo3x7ufdGif7YqfGbYZTMzZsK9JYeGSP0vvx5KGsaIUY6n+MF+IoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWIpMevzRhdKGXA0bxDmTSuWYuOYOKxMh61YzzmJ6dk=;
 b=APQ5NApeiwGPyB2nCPZxsUim23Y193n68DN1VNvXzfkEL0GEICdCeArmk2g2ujLtd+iz/7F1j/3yo9vDUjUYDzLXG9efPZiHFnp7IR07XoLh6kKA0kAgtY/+ilBwTwznYJ+0yD0lIqVr6vTWKkBpr8Y/KBhRp+x/Bo68V7iL5sMbVY7rDiq2o5DSCsmnaWlZ/U0DqFXaI8nRIY55GvTNiaKtcLCTGp9TFooyXKWKqfcEwbkjWnrAJTBRvU7PLYgFDI7/lNkq+jY4pM0teB32IbjT0R/J+qv2EyyW3FcQipiHo2C4c9hx3x6AiWF53AzxI/lWf6zLnqGjUKyXRpHLuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWIpMevzRhdKGXA0bxDmTSuWYuOYOKxMh61YzzmJ6dk=;
 b=fkyIth07TmbelVRvU4gpA61G6BYM4YfEC3/VdWm+shBsM42xluVZmXBifzFWvRFDXTRoMwwSNRS5XpYxxXxalqIZJJOe7hnZ7qNtbd5rnFrRjOXp0LlaEej81zLQ28EfPiOMS0ro8VfbjnJFsnSwZ0Fdh/uPe6EOi3R9k2l7XT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 20 Jul 2023 14:15:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [XEN PATCH] x86/mtrr: address violations of MISRA C:2012 Rule
 8.3 on parameter types
Message-ID: <ZLklfgA3grgWIT7u@MacBook-Air-de-Roger.local>
References: <76dba3f8a6a7bc12f15a9e4fc8c73826a08e4b5c.1689849810.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <76dba3f8a6a7bc12f15a9e4fc8c73826a08e4b5c.1689849810.git.federico.serafini@bugseng.com>
X-ClientProxiedBy: LO4P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|LV3PR03MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e92ce8f-11d3-4ca5-3dc6-08db891b15e6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3diZI8xUdUGtx6KL4lAhO7lRDZoqVeGe4Udh06R194hJYCqNuhFNr3tjF8KouuXnNJfeU+HR1v7JvI9S8vbY+Y3AbgiA9bfLQuh9OyvUNwfnfrE2nw2m32swFqdt9i/rVybhWbgzjhxneiVlHoWebQREimiA33JZuxjGNuNZu6wO60FT4H02MB1W+t5OABoIo6YO5EI58Giyw5mrUKo9DNKmoJ8TWy3KBmJ5cUWJGxl1S3fardiW8F6DKIktMJpp6hn5mTC0hRN3Vc9LeBqVwVdyBDiY4noua9pzwSP1e7GxpTHWLsSpCW04aI8LPdiCt7nrkcXvbQID2MCsdih2MKzurkQ8Ayl51JVColvCg55XkKy5kPKsfiglRQOWX29z0xcXK8ymeBoxZfRa68nrj365i0b6+sjK8vF7VMsrjx6sztSEUKfZFpMaYvqElKFMnAJ7HrbFjhakwVyMLiVFHspWVWi9JUygFje8Lam7mQC7QmMTvqdAY08ffinFxKacAm/eMocoodfHBjicyYyvqa5xgMnxyvSuySZZP8/4GC4ITN/rv7c8JBGRkqskJE8f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(451199021)(6512007)(9686003)(6506007)(26005)(66556008)(66946007)(54906003)(85182001)(38100700002)(66476007)(7416002)(5660300002)(2906002)(316002)(8936002)(8676002)(4326008)(41300700001)(86362001)(6916009)(6486002)(478600001)(6666004)(82960400001)(83380400001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1BmZnh5TTRadmJiL0Ezb040NDBqTmYxNHgrK0ZDcEY5aTRoYmJBcllUbTFM?=
 =?utf-8?B?WDVyeHNmZDFkZE5yQkFKVXlJYlVhdmRmdThCNDMxYU1WWFlIazVKYUVOSGpj?=
 =?utf-8?B?c3BzbXRSK2wzZ0pveFFwSG82azVHS2lkVlJlM3JrcHUxODNJaWFVdzhsMXo4?=
 =?utf-8?B?Y0hQVHlSMnNmQnluTUJFei9zQnVpTm52RnRRdE5wdTFpUVRVSW9mSVh5L3VH?=
 =?utf-8?B?VlU4TVBKTGVJUG94ck9oaVlOaENvS3cydkpNWGU3U3RSL3JCZmpwaFJzSkZG?=
 =?utf-8?B?TXdxSTFtSDRYenBCMDMxanYxcWZaTkM4Nit1bDY2bUl6V0R4WlBuOFM1UlVP?=
 =?utf-8?B?dmlZSnEwOU5MVGRQQllJWmlzVExrcXlJM2FPWnlwTUJuUEJnUjFneGhhbFdK?=
 =?utf-8?B?SWU1OENSRDcvRUc3Z1l5SWU0dlVCbHNJUHBhTWdqM0VBM0ZCajJGZ1VsMWV6?=
 =?utf-8?B?d21DY0lNKzM1TFZac0gxd0hTeE5Vd2NYeWN3SmZHb0RWbW5ESTNja2M0SWxK?=
 =?utf-8?B?dVFQZWNqdEZ6U21HdmlNcjNna2t0akFWZ05OZEdNVGl4cU54b0JrZDNJeld4?=
 =?utf-8?B?OTFxR1JwK1BGZlZDN1dsTk12WUhNZFdBUE5CYU5zZCtRbzRicy9xQnhIL2d2?=
 =?utf-8?B?YWlhREtqd0VzQXV4Qkh6a1EyeHA5akhBVjBUc3BOMnBuNVNRZGVzV2ZRVjdr?=
 =?utf-8?B?L1MyOFY0czZ6VzV1K1J5NW9kTGJKcW4zUFBrd2ZGU2QrSzZqenVCTXJsN29I?=
 =?utf-8?B?TnlvdHhJWnhKNWxyK2xMQmdWakpBVjJlaDlYYjIvcHZQWk1GZEw5NFhpa0M3?=
 =?utf-8?B?M1FYZmxQb2FVOWJnc3dXaHRBMnhrcllPTEdEQnZXbU9hcjROS0hDOXVzdTJL?=
 =?utf-8?B?UGx1Y1M5bUovNHJnL1VYczhjVlNuQ2pCZ2pMczBTTGI4V0x2MVAwNUFpVUZt?=
 =?utf-8?B?WDE1Qll4cWtobno1dlJESmlWbnd3Y01EV3FVb0U1VnUramJpNzlQemowUHlY?=
 =?utf-8?B?bnFDbFJiOW5iZnF5ZEl6UnJDZU40ck9RQ1VqbFRKU2VSTnl4MEVONkROYzZV?=
 =?utf-8?B?WDV0Mmg5OHR0RFVZSm1WQlpOZEEzajVNWFNaZTRBMUMwL0MxTUY3S3gybmI0?=
 =?utf-8?B?cmc5ZVJ6b3pRKy9jSEVpTmNtelRyeGh5bXR1NEVCYVJsSUJPUEJiOW8yNE5Y?=
 =?utf-8?B?YU9iWUc2bHZTUFFtUDg0TTIrQ3NxV29mTEhyOGpKS3RBSUd5WUtuT0ZNRERn?=
 =?utf-8?B?ell5eDczVmgwS3FRWE1UMnY4TThjdnBTQ2d1dXRVU0NSZ2IzS0tTamZCU1I1?=
 =?utf-8?B?dkhpODUyMUdNbG5MSVgyS1JSM0JYT0V1eTdoSTZzbDVhbW9Jd2VnUCtWSEhH?=
 =?utf-8?B?SnFUN3k1WVNEQThFOGRCSjhnZ0UyREZYVU5ndFJRUjNmcEM2NnlLRStTYXBF?=
 =?utf-8?B?MVQwRjlMT3BpK0JwNmFLVTdNdklqNGlWcmNwUUdOYkpTVWtJYWZ6dDBNK1ZJ?=
 =?utf-8?B?MUxVTkU2YU55ZXp0UTlVcDcxTUs5U3Q1NE9MaDRqUFFTSDNZUUNuZWVNb3FY?=
 =?utf-8?B?TGVBMmZlK2VtOEpEdytQWnM0Nkw5dlF5SzFtcVh1K0VNZkJpS0p3dkd2aWMr?=
 =?utf-8?B?eXkwTno2RlR0dzUvcVZSV3JMcWV6K0kyYU9mbk9CY1djSzA1RjdmT0ZUclg3?=
 =?utf-8?B?MFE0WUZsYUdQeGJ3SkdaUUt3dmRzQ0tlNDBPKzBLVS81ZmNGdGlLTGtMQzJL?=
 =?utf-8?B?cTh6V0wrcTN6eTBGUjFUeWgvSk1iOFVESENJQi95L3JTeWhOclc4aDVNS1VS?=
 =?utf-8?B?NU8vMXhMdWo3Q0VGMWMzcnhpQ0xHem1PNGxFRm56WDQrQndqQXZFbklhQ2p6?=
 =?utf-8?B?cHJMNndYeXUyV0ZhNjY1YjhFZDZZWGxkbGlDK2NLQXZON2QyancvNVpZSGlU?=
 =?utf-8?B?UUROcHgzYTlQckFTQzVPdUluaCtwQVJBRDF2VFA5aGUveU0xM25JUGFneVFz?=
 =?utf-8?B?U2dOZ29aeGtkNDlDSENBd2dmemxERVVUQUlYN2RCM2UxenNtSlRLR1B0bVp0?=
 =?utf-8?B?Y0xnY1N4MEMxT1VuQ3liNWtEUnBnTENpWU8xVFlyeERJRC9NYzFUQmVOSlF5?=
 =?utf-8?B?VzgxaFJQNjZ4dDhqNkcwcG1SN2dPV3lteE1BVEFIQUczekNtdGJrNVJiRDA0?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TtILMZjtPjSGyYKsfVuKHSShfsYd5RzOkvWWIByfwaIdg1dKqAy8t4LChnCXUHT9eva0RZ1Rv7JWT8Xptr5uwmk5xUVisV+6AqMEKuOZtGb/X60tvlcoN5D/wzUDStqf8KiYO8WzOVyklGDQsThHaA0T0Z8xdg/yBU9QLq45GCUDXQKuOPcVav54qEJNRagi/j0tFYZOH9OTBEnCpVBLOdqVrCKp4BafT0grb3y1algACY76s48XuRJpuU85waJFAj17PKiofoEtHnX0mz/rgaLL9L2t6Gh1MYLbaX9Ehdz7pM1GzkwU3tBNwqeB5SAZaVnF21VdV6WIFm4xfCE/ikzrTMNgqqSLqJC4wiZvTCSs3LFdhEiTKFOM/qe4BboHZoH8WKJl9DsLdci+Kr1TtfgzXmJ+C6gLN7Woz71gprW0KNtA/RRA4BPAcSyqT3/7pR2yN3j1b0U7Gg4gcZD6Y6U1c2GXOIlBUKuKqhpCKNV2ifw15DY6BS+qdgoGtbZks9kAJHQ3BFM5HBWKW0BZM2CfIaEfrLBptCw0eOLjUDDgWtY7I0ED4hozd2WEIi4iCqtIkbDP1byTiZrrMSkdUx+mnI2hYVSdDo94uPyFpO0rx/JtLm4wuieHhbkPOIORi9oHx/yVXZCg9pjgK8kf+CCHWnplko/5utnBa55Of77W1irPLkdZWB/Ps5nxhmxWHbRcpcqGzZBZKBhw2wBmiduqNt5xIHTL942boe3XBWvLLgr1COYMgtCHOEZ+huWfcCbN39pEyMDRYj2nNVZDwJHEbSX4hcaQa5s+0qfeG0JjDg+eNreCNoaVXfJ2XCt0+r2gHD+3TyhQKXeWjXfSOFobwOq3XEfG7oP09hIh/UHwBep11sagPGYQaEF7EoPTxaCZwnu796JfdiZtbNHXcQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e92ce8f-11d3-4ca5-3dc6-08db891b15e6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 12:16:03.2919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwzQdoA0xJzobkRk3czhXunI8AhzWwDQO1TJ4jVeB353ia6NwB7AO4mOZuLbo8jQWe4TEhm0mSulYPi0UBk+mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7383

On Thu, Jul 20, 2023 at 12:48:36PM +0200, Federico Serafini wrote:
> Change parameter types of function declarations to be consistent with
> the ones used in the corresponding definitions,
> thus addressing violations of MISRA C:2012 Rule 8.3 ("All declarations
> of an object or function shall use the same names and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/include/asm/mtrr.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/mtrr.h b/xen/arch/x86/include/asm/mtrr.h
> index e4f6ca6048..5d57a596ea 100644
> --- a/xen/arch/x86/include/asm/mtrr.h
> +++ b/xen/arch/x86/include/asm/mtrr.h
> @@ -59,9 +59,10 @@ extern int mtrr_del_page(int reg, unsigned long base, unsigned long size);
>  extern int mtrr_get_type(const struct mtrr_state *m, paddr_t pa,
>                           unsigned int order);
>  extern void mtrr_centaur_report_mcr(int mcr, u32 lo, u32 hi);
> -extern u32 get_pat_flags(struct vcpu *v, u32 gl1e_flags, paddr_t gpaddr,
> -                  paddr_t spaddr, uint8_t gmtrr_mtype);
> -extern unsigned char pat_type_2_pte_flags(unsigned char pat_type);
> +extern uint32_t get_pat_flags(struct vcpu *v, uint32_t gl1e_flags,
> +                              paddr_t gpaddr, paddr_t spaddr,
> +															uint8_t gmtrr_mtype);

Wrong usage of hard tabs.

Thanks, Roger.

