Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC56BD56B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510708.788910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqMO-00052m-44; Thu, 16 Mar 2023 16:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510708.788910; Thu, 16 Mar 2023 16:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqMO-00050N-0T; Thu, 16 Mar 2023 16:21:48 +0000
Received: by outflank-mailman (input) for mailman id 510708;
 Thu, 16 Mar 2023 16:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQdT=7I=citrix.com=prvs=4326333c9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcqMM-00050H-S7
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:21:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2b596b1-c416-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 17:21:44 +0100 (CET)
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:21:40 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6424.namprd03.prod.outlook.com (2603:10b6:a03:397::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 16:21:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 16:21:37 +0000
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
X-Inumbo-ID: a2b596b1-c416-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678983704;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HVho6MipT+HrCw/ZRvOhdHl0QOoF1TEoRii56+vvx6E=;
  b=gvUgXgVnhFGV3PTTytOSqBk+1TiDGXEM8b27wjI1pdUi3hCetOITirgb
   wZ6ZpkB0iEeYh9G1i0FN84Kn7HbgPrVYoRi8Y4OBDO3nE5zVWZeKvxtPw
   hvNkIIoA/vyuE6sNX67qEuvd94mPjjjxhZZvyc7wgalsjMimxtErSquTf
   4=;
X-IronPort-RemoteIP: 104.47.66.48
X-IronPort-MID: 101147969
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MzPSXqm1fJ0BzW3fApkBmr3o5gxiJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZCGrTbPzbMTGhctkjOYmwpB8AupGHyYMyTQtt/ywyQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QGGyBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ewhKCJcLSuhu+yzkauBevMytPU8cOC+aevzulk4pd3YJdAPZMmZBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVklI3jOiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxXqiBN1DSuzQGvhCgn+h+kABFgEtVka9mOiC23OUROh7J
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN07s8kP0Kmq+EHdtBilrJPJUw0d6x3eWySu6QYRWWK+T4mh6Fye6OkaKo+cFwOFp
 CJcx5jY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 Ba7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:q4YL06+BwoN+mdWbhGtuk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="101147969"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev/uZxcMwMkf0dz0qTn3CnD4DbmSKIa7YVP3+eVao54cz0VSYw+6Pl65GqnbwBwsBA4kV0qPrsr8ThBbVWwxe58fmg++CMDwsgxQdN8/3AE89GLpRH0hDcNHzbG5bM+UbH2MyW6h79RQkmWvJ6gYyenmhbYHL9Qhrb0Fqtf2OtOhxirOaDvh3SHcIi5u237Kg/inzEq2T/8dB3JUNSPKivp6P2T6rM2IqHXri1OLlGiEoFiG+ER+YAXd1gI5NBmq2Ccmy5jvy0lUIMjXp/IKubtA/4zHq6nVsku8V1O7+mJ2JBerz3V1wsE2oNxLpCsW0Dnil9AkKopBLHBWZg3wEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9FPdzpEK1a0l9hJxqpKq0e6u6wHhVLJRMnS9kafa4E=;
 b=WDBhvkGh/DlIF0PDElnU+9XKDJgX/S0MY1GDlmppJjD7LA1/m1DGU7109MAVxo1ZaZbIBA6oRUCQZHJfIgnuUGqYXweG8wLlw0xaIyDezBZeHJLL5QfPW4WPijWl+AHRunkLqTKpnMID72SILmEOU06E3UvCgSpADbEyeovXlSKoekH3Bs+HhS5ry5Yvclk07+NIHHBGSSMzc7MJNK2Hwz4cesm5aCpzH3rkIgPF8axJ0SSe3usQ9YrrR77+SFq4JfycEVWXWdUm8zvlOQyuU7ECPTJt8rQU6hJU/JbA0+OZhi5SGExQrV7jdayZr3Kdl2NDxsqowVv/aunmlFPHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9FPdzpEK1a0l9hJxqpKq0e6u6wHhVLJRMnS9kafa4E=;
 b=Ag6dKp+0+6ktn2+VqmDNNeMXNRIK2gPZ2ia+8BPvrb/N2FAnebY5jrw92oOuna9BVUE+cphy8wJ9zAKUdFzmfm9Y6xUAfM4XblLZkoTp7Mn1tuEzCtyaelCVjc/6llfR+DNnfEabkdPTbytScMHgYye0bkZXgIuq4r3RwrNPnPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 16 Mar 2023 17:21:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Message-ID: <ZBNCCyzjLlPl3Su4@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBMfpnzW4YdqEiA0@Air-de-Roger>
 <0be85ad4-f0d9-a5c7-e7bc-c546558df835@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0be85ad4-f0d9-a5c7-e7bc-c546558df835@suse.com>
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9f996f-bd84-43a6-f0b7-08db263a8488
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y4jtkIC4CIHe0G8h/vu0WyNLntblgNQmGVzfD45w2TeAdEuDC+3rBrtJITeWLCrTj4K4K8l0RVzaLsDZGzJ4c7PcZf1dg1+8J9FTwXqXbtfjzWaoZvg/7td/VrLLA2w3gCjd5FHoUTD6ECe12cWF4x/DFYkCGKTQqaInPC8m0YVxzqeO0g05xFwgiRJcJUFfHUr5z/86JBrCWw4dRnFfHyUDJzI6968JHNGKK9DYttFS7SOqP19minRp1ghwdHghvA58D6SPnHXO5L2ZDC2gcUKUXBULxQmMVgsYDClwpNc2j5VFZsn4f4tDN3laYQz9CXGeNxoi25PjmYJQ2WwsmBe0E4Zz/HJPpspysaBHJTsl5VRiQg/xWjj7vkSpg4kmdEShGwEz/iC2116dBOffPr5lpJ64wUNI/hOPAxdD+CCUn01GsGsYC8RGNVanHcx34vTtmZXeEzMqClJSkWaZ3zYKj4IqstAzHwl4e7ObmEZGFH4+se6Zl/isuT7foQ9owkdgEaUAL/7x8/iM6TPvuftOcJasnkPWJ3YXXD2FmHG0gDBRu6z3t3p6L5TjKZQ6QoImYTDuv07ONU09IOT1/+FnZeFvRE+CPA4CffWSRncH++2xUJykkyorUeUhYc6eY+NnM9Saum/i1zSCri5T6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199018)(6512007)(4326008)(54906003)(8936002)(66946007)(41300700001)(66556008)(66476007)(478600001)(85182001)(86362001)(33716001)(6916009)(82960400001)(38100700002)(2906002)(186003)(316002)(26005)(6506007)(53546011)(8676002)(9686003)(6666004)(4744005)(6486002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWR2eVBqNC9ieGYyV1FzZ1U2eW1EaHpmektiNExCeDBWL0RxTE96UVg4SzV1?=
 =?utf-8?B?ZmE1bGJQVHhrdjQrQ3VFZXE2ZVNRTlRaMU9MaWNTNzRZZDBXRGdwM1BrQXBV?=
 =?utf-8?B?TGhFWHh2b05JRTR6TWFhc0x4dmMwYXYzSFZ4SXpzVXNNQjkxSVY1WVRiRjNY?=
 =?utf-8?B?Tlh6aGdycVUzbkxGajJBY0JKWFBNcFNqYk8wRys5Qm5rSGN2QXFIQjgvRFF5?=
 =?utf-8?B?L1hSRzduNFBYWE1YUnFydXR5WG8zVUdCODlta081QzZaczFKMDl5QXFONzFY?=
 =?utf-8?B?Y0lCZXpVWlkvZUpIWEVLa0ZtMlNSOUUyT1N4T0J3MEZWWU85WFh3cjd1aEZl?=
 =?utf-8?B?ak5EV1hrS1pNc2J6dnp5amxDb203VWhpN3RwczBlT1VZYzhkaGk1eURkVUdM?=
 =?utf-8?B?KzBzTDZlUmFmZXFEWm1GejhpbjBDa09lTWlXZlBLbE9TTmZqYVlpNHZvcjMr?=
 =?utf-8?B?L0RoSFBaOVM0cW9OOFJXVmcrNTY5bXJhNW5RazFGNUY5cm5RQXhrbHNKMVNO?=
 =?utf-8?B?eS9VUnZnQUNVTWJqcXVsdVppWEJseXl5dFBmR0w5RWFkUmJjRFZKZDhzdU5U?=
 =?utf-8?B?eEt6M3dyaSs4SndQNTVmNW5SbitDaXRPOHAxNGRUWVNTcnFSOUY5ZUtneEpI?=
 =?utf-8?B?OCtOR2txRkJqamkxTDl1U080NXBjQTY0Y3pxVnErc3RxOVFxbVlUaG1oc1ZR?=
 =?utf-8?B?V1JTRW1OMGtqSGp1LzhvdkNkNWJVNm5EODRjZ1djL01hN0lhcThmcTVtcm4w?=
 =?utf-8?B?OUg5ck1hUXFNVTN3OGVzNStQc1VlNHB5QmZJNkNwQWk5MjN3bzFrRlp3anJL?=
 =?utf-8?B?WTBDcFdNOEttWDBFS2lWVHhCVXdWQnplSjFGRWxhelBKOFduMDU3Q0lONEkw?=
 =?utf-8?B?alU1Q0JoeU1ncUpsYWVpVFE4OHhJdGtCOU1QZlliL2Nwd0JwYzVCTVd6QlBv?=
 =?utf-8?B?c3lFalBPMy9hWnNzcUJhSGhzbVdxQ2lSQ0I3b1NLQVQwbzAvRXFPVmlPRmla?=
 =?utf-8?B?L05IL3BZclo1TDRuVjgxZ2dKTVBYN0FGT1BleHl1Mzk1dnVYWmtuREhJcWpm?=
 =?utf-8?B?eHY4YzMyb0dYdHl5ZWxEbVQvSGFjdjAySGdLeUVyeG1Nc01YTk1KY0xMVUM0?=
 =?utf-8?B?NWNLazlmeDlMaVkyc2Vib3BwcmtWL09kWWZ2TU5LMGhvamNXTGVVRHZheXN6?=
 =?utf-8?B?YjlDbUV3VFZORHN0QkJKUlF3VzBLWGdTandCMkJCajhsYkZkR0JtN1JkblJn?=
 =?utf-8?B?VHhRVDQ4QnZUVkJ2N01NbGpMTmlOY29pTG9JYjFxeTI4OExmNUpTYklFTi9T?=
 =?utf-8?B?aTM0YkZtelJuY3hFVkZVRlMzdzh4MWFMWlhiNWJsRVRTZlcrdmdQOVZhR1JP?=
 =?utf-8?B?YXYxUHZrN1N1LysyZnRkWU1naTBMWnczUnZhcHpEMmQ5WGtHNU5UcU9JVGs2?=
 =?utf-8?B?N2V2Sk9QWlkwODlKL2pnN2pQb1VuaFJFTG0xVVpNYnlmUDlBTHFyZ2JIclBU?=
 =?utf-8?B?Q2htMnQ2U3R3TlQzNHlmMy9xS1I1UjNuVDV0OG9JRXlobkYrWkRYbElVODB5?=
 =?utf-8?B?ZUUwNUVHTHBLdHJIWVJ6ZzgzeTBoTkNRSUtlTFVUTnkzb1NPK3FTQ3JOVUI0?=
 =?utf-8?B?dEJ5SWF2azJmMWM4andqWWtIcUFNaFlxdDU4aHgyUHpjYm9na0dZT2hVNWhV?=
 =?utf-8?B?ODJkejRVTjFzejN6M05UT1c0d2h4V0oxQzZpem5DNDk3My9iQ043RmV1Qlo2?=
 =?utf-8?B?dDRKWmlxeEoxOU9OV0JPQ2dHZi9DcFRzWGFhenhtRGNmclo0L1RTT08rK1Fi?=
 =?utf-8?B?Z2E1MkNxTEpCaTlNYzJMOHBVeVFpNFBTck5MQU1XSzRYUVlUZVlSVHZlUTls?=
 =?utf-8?B?MGx1Zm5FT3hXSVFHamVuTndBTXFVbENMQ3kxQSthUWRRMU41Smx6WU9KVUlq?=
 =?utf-8?B?YkEwUTFVSGtERXJiT2VUaHZwR3RjNFJ6Qnp2cUlrdW1CUmQ2NUgwdWFyeG9D?=
 =?utf-8?B?UFdkZjhlckVxcWdhMVdRNUsyY0MxTkdrbWJWeGg2U1UyWXE2YmtmcDRRLzlO?=
 =?utf-8?B?blpLc25qSGVvR2svTXFpMm1ONU83YkcrK1lzdG55cHlsMGZUelhDSXJld21s?=
 =?utf-8?B?dzZEempTR0FFQjR2N2kwTlVRd0ZlRGdDTnhtdy9PTFlQWlFjOGo1QlRqK3U3?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7kyxmq0eUx+j/KDpT6b16Nf1MbRzYPDchanR0QX3B2Z7mDULDnrrbvw/SUVIbzinbB55hM1Qv+iH8yDFlDxmxByMLlhB21mWp9F0uU3kwPAgYDZYIlZDFgGqYix1O+h829Hal2c+mao6BcVHE3K6mjTZ2A5nVU0BF1Hr/UpC8zJbWppB2RunElzbv1+lc+hQzm3RZOX/deEYbfq/q/9XbZxCN7/H7GVEJtQaGlBYocedtxjttcsduKc31xhYGpXpkjWYVdQSVdDYY1EbTjRn8a/YB3/LUwx/tH3dyVzIqCjG9scK2KQJ9lX5wWJi5vZAWmOVHLkc6GesQe3iRPTgLsyMyc8iiwyKcCGGOODy1182Ybu7wV7QIenN4q4FA/iZE9GCm7RprWEfMkWk7PWbhDSPx6U0XF3sE15sq3uRYmrNuhfqEpsawA1dzN8crHKKs2mE5fLRcJCT1pegKVX9jG0oGmlKN8quCpOhYwxjP4gK3K4DDFVebnr+ERN1djF1x7dXRbTzCr56rE+4Rvu9OWgRvX0/zTCcIR+TisuD7VRH30iWVsYyIJOpDjxsayKvbJqM8+1OzccYOp3dZVFIlGgCClrKLN5KZ9XFiVjuSY/zCpEqj/naQLOqx4fDFkNG39nAsEtQDeeuAZQJqB6w3FNI/IsMMkw9PRUunoHtzRgc4vFFsnYWxxb//CeOjfSHrfN59LpTRYDlnQqTw/BLdV3MX+HFDUBZEpvotO2eke/lvTBZzFeRMacQSbZIJh5KwQy/KQFGYmkAaPKJdMk8RlOE2abZeO0ikRyd3IURulx2hdfck/Zw1Bg7lcO99SMixzcXjVbbWiKyY1OjzAAVcK9y6/u+/lmEPLyo2XAYd6vS6GtA552XoFTSw1q1Z1bM
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9f996f-bd84-43a6-f0b7-08db263a8488
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 16:21:37.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/kE4IR28PGp+f6dda4KqeX233ujyVGEW5qEqSKluG7K5yrFbQm1GYvce45jDX5Q72dhWzlTTAEyTXUXoJjf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6424

On Thu, Mar 16, 2023 at 03:03:42PM +0100, Jan Beulich wrote:
> On 16.03.2023 14:54, Roger Pau Monné wrote:
> > On Tue, Mar 14, 2023 at 08:56:29PM +0000, Volodymyr Babchuk wrote:
> >> +{
> >> +    return atomic_read(&refcnt->refcnt);
> >> +}
> >> +
> >> +static inline void refcnt_get(refcnt_t *refcnt)
> >> +{
> >> +    int old = atomic_add_unless(&refcnt->refcnt, 1, 0);
> >> +
> >> +    if ( unlikely(old < 0) || unlikely (old + 1 < 0) )
> >                                          ^ extra space
> > 
> > You want a single unlikely for both conditions.
> 
> Are you sure? My experience was generally the other way around: likely()
> and unlikely() become ineffectual as soon as the compiler needs more
> than one branch for the inner construct (ie generally for and && or ||).

Oh, OK, never mind then. We have examples of both in the code base.

Roger.

