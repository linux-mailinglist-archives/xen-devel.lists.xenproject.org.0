Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50225707CEC
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 11:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536251.834411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzZyr-0005Mv-HR; Thu, 18 May 2023 09:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536251.834411; Thu, 18 May 2023 09:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzZyr-0005Kl-Dv; Thu, 18 May 2023 09:31:29 +0000
Received: by outflank-mailman (input) for mailman id 536251;
 Thu, 18 May 2023 09:31:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joHs=BH=citrix.com=prvs=495b323d3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pzZyq-0005Kf-Ez
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 09:31:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c17a2eb7-f55e-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 11:31:25 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 May 2023 05:31:22 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6455.namprd03.prod.outlook.com (2603:10b6:a03:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 09:31:20 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 09:31:20 +0000
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
X-Inumbo-ID: c17a2eb7-f55e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684402285;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sgovmXIw5wcey7WW6bfshpN918+MI3214S71E6T1VnY=;
  b=cCkyEeClYUrcnDiqK0SO2QsvNPViZ0FQJsopOLa4QknZmW32qM8dUBAX
   ccY8hHmIl0za28hx7If87JLvZb4N4xcBsUhvaf3aiMdPTu/qceVjaSnqv
   unRZKhtK5cL9i6U7D3CA8K9ynZNwYT1VWHc1YWsvBkxWXjUoJBaq9fcKx
   I=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 109503796
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:cIikw623mpPlKOtrCfbD5TNwkn2cJEfYwER7XKvMYLTBsI5bpzNSz
 jRKCj2HPK6CY2T2L9wnbNy09B9S75/Rz9AxTlM9pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFnNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAkEVz
 OAieG43VVOMnOft/pWgZvlGr5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1EZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13r6SxXikCdx6+LuQ7dJI2k2N6zMvAxwJaEuLocHhoUSQVIcKQ
 6AT0m90xUQoz2S7Q9/8VluiqXGFtxIVWN1NO+Q/5EeGza+8ywSTC3UATzVBQMc7r8JwTjsvv
 neShM/gDzFrtLyTSFqe+62SoDf0PjIaRUcSaClBQQYb7t3LpIAokgmJXttlCLSyjND+BXf32
 T/ihDMiirsai8lNzLmy913DhzOqp7DASwJz7QLSNl9J9St8bY+hIoauuV7S6K8aKJ7DFwbc+
 n8Zh8KZ8eYCS4mXkzCAS/kMG7fv4OuZNDrbghhkGJxJGymRxkNPtLt4uFlWTHqF+O5dEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:NITSBq+nS12sPj8TLyxuk+G5dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdgLNhRItKOTOLhILGFuFfBOfZsl7d8mjFh5VgPM
 RbAtRD4b/LfD9HZK/BiWHXcurIguP3lpxA7d2uskuFJjsaD52IgT0JaDpyRSZNNXN77NcCZe
 yhDo0tnUvRRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qn5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPQi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gmMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6UxR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r4NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx98R6vXM7zP4HR3yGGPfI3kNg6diP22pqIJ9oEUfYCbcBFqEzsV4o6dS/Z2OLyoZx
 /8AuMTPxbZFxqeJW945XyAZ3BsEwhhbCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-Talos-CUID: 9a23:om3lhmDPgaE5ckz6EypHr3cIIJB7SEaew2zVeHGfEkp5YpTAHA==
X-Talos-MUID: 9a23:bZjD8wotU0KBXtBK9UQezypOFp14/YnxNEsMjqgWi8m8bQd6FTjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,284,1677560400"; 
   d="scan'208";a="109503796"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHMwULcYjEJQv3aNV3ivpLS/cP11bZSPxEuplKEMyuTQIT1B18lGK9VTQqBJX5QHt+Dc3Mjs3A+OwHimxOUfBZPGMuDzX34rXnumPM/9VT7gutUg3yqNjBVM3eBUVPhVR37hDCxY+bHLFQurbKzRc9Gpm7ceOVZ+4z0s6gmVcSwagjkSSAejYWjXYt30HvXsblHdya8jbV9VWgSvPBBxEcisEkB/qYBamEWivQ1AgBUwzxYTAzskOeaaWeyIMwF7Mx2scCoZJEXLY2AMzmeJcB03xnofDDqT95YpGjw8htmuhrsHQzLgwGZJ04Azgs61Y1Uu45Fk6Dja+iMu54ufmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OMXQrhCQaBqSvOUEgCtRxojhKihVOS7X5ukdb3X92A=;
 b=N29955NlCpVIhnl3tD6NhnVe1Q33+Qb3W9kI56WTavCJM8Cb6ndV5bQCabKwNyTUJBTYpA6ZJZkAe0AiE/JzPxTpu8YDMHjgQuNn9ISWUggqIMNTmBydxNYi8bje3fSq+AWDM0vic3sRFE7iYphCHveSB2jiYf+Q+73ikJfNxK9D2B48o1Ulh+seAHa0aUJduqhUdRZC6IyUJdq5ZyoNESRdpaz1DvP+ISZsMKEdnkcG/+eAYH94DlkZDAb1p60Kz9+RSanEnTuHnyR8gH5YPT0U65qWpGq7V+qsOBjBAidcwIUfpjXBoZx9KKXJQGd1WG0U5pxI8/2Z6Q0r8n47dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OMXQrhCQaBqSvOUEgCtRxojhKihVOS7X5ukdb3X92A=;
 b=nfoaqKF1xk+/QZG9lc1N5JdFDugybaRzjl2i2K+C9Rbfa7S5ShNhPyhgmE59EQDBN5z/l+I/n7Rlx1EX/9Ot+2TEcHnIF5kH3iLlha3T/3u94phWU7/MTlKrI5iNE42uQ8gri5OyT6mi2Q1GtVkz6Q9u2cCq6+SQzD0jjr2p/ss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 18 May 2023 11:31:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	andrew.cooper3@citrix.com
Subject: Re: [PATCH 2/2] xen/x86/pvh: copy ACPI tables to Dom0 instead of
 mapping
Message-ID: <ZGXwYsOX44/EBI3x@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305121801460.3748626@ubuntu-linux-20-04-desktop>
 <20230513011720.3978354-2-sstabellini@kernel.org>
 <c22a8925-15e4-47b9-6f5d-f85bbe802255@suse.com>
 <6f3f4e12-ae5b-c58c-891c-fbce08283206@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f3f4e12-ae5b-c58c-891c-fbce08283206@amd.com>
X-ClientProxiedBy: LO4P302CA0040.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::15) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: b68abc7f-f886-4e83-81a7-08db5782a329
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eUl7vYvJkpenHzF+8rkT3OyVk8JfkCS7+X4uTk30Q45VAuD4fvAt2nnFn37xmDzm7VZyXaPWmLf3ignUtkdQHw1FaERNqmYEtH881w3sK760EbrhYEFMCbQGSxXtGga6xp94AxtCrUDAjH6RW+5tZr16WCgCvAQoA8FrXx1ELV4TLGo9YscRxpqSKCU1DZBSUyw6MCQcmKAIWSfnrZjRKyijvltK6J6FcmVMcm/PZwUtiLjM8rjt6SIXDHcguoJHPn7u7J1Nii4fW9zChsOBfbCtPoj1nhseSe9dKR5uy5F4ZItCg5odpQjW7sOV4z1jvyM8iNAAqBgg2+NyWmSIIWxElJMyFutopyM1ZuheYvlREPzcbYBXiNERhv1bCwJYwrP6WgmhYFUsndsLOHUG/oe9PdwHtSa6Xjs0+sN0LEOjTfjNKBRG1YjAKN0sLy/qlay8qtkWn67M/uWWiM25TsflxF0JurTiUyk1bsdw3MF+CxLRyJ/YbDD04RwS7XwYRanN/MVQn2nwGcdoBq67JTeqFPexQvUsHRt4BQBnSv4mWD1F2x5ALUXcmDNjZTU2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199021)(82960400001)(33716001)(38100700002)(478600001)(2906002)(6486002)(54906003)(6666004)(86362001)(85182001)(107886003)(186003)(53546011)(6506007)(9686003)(6512007)(26005)(66556008)(66946007)(4326008)(41300700001)(8676002)(8936002)(6916009)(316002)(66476007)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NldCOWttVnlHTytNaHNNZlRldGpNdGgwOGNlK1NtclNMZ1ZicWxjc1M0Ulh0?=
 =?utf-8?B?bnR3bkZnV2RzeGY1dXpIZHVBd3FBUkthcWxwM2JkenFzeGl2Q2E0NFhHSUNO?=
 =?utf-8?B?VFJ5SkQxamcwalo0elh6dEhoeXUzT2VKZmJSTlBLMU9RcmJBYXV0RHdRZW0z?=
 =?utf-8?B?dmZSbFlmN3lZd2FsSXJaMmw5VFRma0pWaENlZzVJdE42WURvWWd3L0NLQ2Fx?=
 =?utf-8?B?V08vYWFzNlRsT0F6ZkxuZ1lJY0xrbzVhODA1djNRT2VrTzNwYkh4dmduWEFw?=
 =?utf-8?B?K2tnWkFJNDhSOFZ2MWNvcUoyTlN5b01xbDEwYjBYZmt5bWtIRW5NUmhIbW5v?=
 =?utf-8?B?MGEzbUY5RmxkTEppM1ZLTGpPYkNFaExmMno0bTZBS1lLY1FQNVdPb05ZUXpB?=
 =?utf-8?B?dzBrOWVjcXBvTlNNNXRpZU1kaysvTVl2MG40aFFHb2xjc1luM091NFlPaDE3?=
 =?utf-8?B?eUh5K3hOUVhSL05qWEhMUVlBZ2doYXc3RUt6UHpQVTludC9PZ1g4MWNGYnd5?=
 =?utf-8?B?dnFnRk0yQ1U1M1lyUjhTVThIbHFWUEpBWW1LN0JsNDRzK3JRTTJ0QU5vRjR5?=
 =?utf-8?B?TzhCazZFSzRvek9nb0QvVXpGWVcrKys2VXpjWTJoQVoyeGdIa1lMOGtQNjlt?=
 =?utf-8?B?c2J3WlVqRTRSSWdZQjBEVzRwVGZjVUw5UVVtb2Z4b2E2SDVnV0tJeWFHY3R6?=
 =?utf-8?B?Q1I2YlV3azUyVXc4NU5JcklPc3ZWaVk3UWd0azZmMVpFTjNRRUF5dmNoNWo0?=
 =?utf-8?B?NlVIL1I5ajNqczNvUVZ2T3FWekplN1RKUFNNeUpab01KM0o1RFBYeVpsRG8y?=
 =?utf-8?B?aXNwRS9jajNMRlpOYitrWlV1MkVONXZEaEY1SEJtTGo2SThjVElqV0hxRG1E?=
 =?utf-8?B?UVluM3lCa1FoWmZISWk5ZGx3cnFTN3g3VXNjMHFrWE1lcGs0azFMSXRMOGtk?=
 =?utf-8?B?REYyUEhXUUlINVFOZloxSzIrOGtId21YR0xRVW41a1ZocTZCNzgzK29GN04w?=
 =?utf-8?B?SGpXSG9KUEZTdElWWWtTOXRGeGRlQStwVVVkNU04d29PQXdHUnFjOXNlMllu?=
 =?utf-8?B?eUJVNy9YakNoajRFL1UrRnZlMDVCRVowS2J0bjgycmV5dmlSVFQvTFJoTnNF?=
 =?utf-8?B?UHlCNjRpYjRraFo4bXJxNUEwcjdBaXB3cmdNZ2VhaUg2dnpLcVZxNmJWUUJ2?=
 =?utf-8?B?R1UyZzU5UkJCN1o0TDBIcyswMG9GM1ZraUpxM0pHRWs2aWRNUkpNb1lVeFZv?=
 =?utf-8?B?MVNCbjRoU2FoUHdZK1NxQk44KytLOWlHWm03eHRCSmdJN1RMN0d5MUp0QkhX?=
 =?utf-8?B?Y2RXc0QyNzVsRWdobDMrdE9BMk5rZ2NqVFZ3Rlc1a085NlVyOFBjcVZwQ0g4?=
 =?utf-8?B?VUVOTHpudlVER3pVUkJpVWxEL3IrQ0tqOGY3QTB6QVZYZ3VjVmg1TUVWMnQ3?=
 =?utf-8?B?UHJzV0M4OGlhSWNmQnl1aGV2bjY4Qll3a3U5Rml2Wkh6RWN6cjVQUWEwcjFk?=
 =?utf-8?B?NUY4dWEzVEVqWWZEekoyWjJGdC9lREt5RGpPWjVYSDZqSnhhVjhVaVZlcUll?=
 =?utf-8?B?T0hZTXhkM2hMNkY4cGd3MHNsdUhEMXBhQUNLR1RNSzEyb0d1a2tjMms3RHFx?=
 =?utf-8?B?MTFlaXNnUGcrWnBsOFhMRVpEczlJNVdaL0N2OGxUN01jWU9KdmtOSXlNTys3?=
 =?utf-8?B?YUJuZHpZNHVMdUpnbmxCTVdUWDFOalp0RzlVMDRxVG5MTlpCSzQwSHNEai95?=
 =?utf-8?B?cDRVbWt2Q01KeGJRUnZrRDZ4S3lTSFkybjRNWGlkSHo3L3ByclBwZ3lua0p5?=
 =?utf-8?B?cEprS1Qzb1pybG9sMUUvTDlqVVRkWXpMZjluZkdqUUYyL1VIak5QcGhKTmNC?=
 =?utf-8?B?cDBxbElwVjl4ZTViVlprK0JzWmRyQVl1RS83VVZKeDdTMUxRQnJEcWR4bnJF?=
 =?utf-8?B?WHNaRDVQcC9oWWl0T2p2T084WHVTWTNBZDBlVTFpenNHb1MyTE0zVUF4SC90?=
 =?utf-8?B?T0VFa2dkNXdRSnNYMFZJSHd3aXpka2RpVzhBSitxNEJGeUNEZk40eXUvNDFK?=
 =?utf-8?B?eVI5aHRHRzVWQU0wbFUwNEJOWjgrNGNMUDZBVzBsQjhJNlVDSUZlalVKSlRQ?=
 =?utf-8?Q?UI4LDHWpVlY7gQ0p8T2LBV73a?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bcHtTnJUd3LvvK3sQgamIcFEWqGdgs2b1EhUY5u/0hpTU1+F64Cd29b93ikXRVsvw88CUZrCs/Zz9xq+QnGd3Ej/kyZ/ygGaobB5FJdCj/l6DTdhdGdpp9gK3V8g1EWQwmzerAm0edq2ZsDDi3r6HlEDLypZlBU5vN9ODf2BCWk9YxUW4QRwtDMjGyUGnholuw+dhojvZ2YyvvdgbqKG6wVpOAYQxbPQm2I2pylLwCggDudR4DYpM7vVJSQOyZeavs6fsHTWhfr1cRVYpJWf3tMIe0YoUnih0XJUEMX71KlohQAH6ZhaRjdd0in0FNFhSy5xd7f+HjuFM8jDZYznuOpEnuPTbwZXtBUnM5pEddUeG4YMC+fyFbwrVQbDg5Zqp++YtsexGet1FjhcOlxVbwLSSdGtkOAtYMEDm9DWMtHzEQa0XGDno9Z5CCwaEDuLwP0xeDBXSsFNRC2tmjZWFGlgjIWD/GL31ibyx1XfnPw8hCFjVjkZ0HeJogm0qu7ecOePWVtnOrOS5z62noIwe8qjgiUTuzJSQw6xpeedY4NQppdhVIyS/2LYaW2MZ45BNo30qnUq4Holfp1SGuvpVgFev4Q6h/qEJOnHqJe3Sgcoap30UNV6wSO/R8v+tnQz8yYhq4lwPtJpTehDdQIon0Du5mokB674wdRqaFfXBcp6lq22nhlQWAObkDIxjqpLCMaLFqsZ7SjjB60VtWF7bk8EM4bAyCnrxnwLJerr3+2EhUSvciGVipf1OKK1Sd5TRFOLGZpZscC771wxo6lfpIJpPyn13/sQHdyq9eCiK9Nd61Nls/oPEp2yLy1A5sBytmBrPMda06U9yn4g1TvT+DMn1KdXM+LZjm7z7toePOE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68abc7f-f886-4e83-81a7-08db5782a329
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 09:31:19.9945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzqYsmAl9TjY2xiAYXSuJehE3reVvJG3ToXNsBWa2DEgiUazDYDQ+2+RDzNub3B9LbzcQM/+6Yn56CWxFe9sqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6455

On Thu, May 18, 2023 at 10:24:10AM +0300, Xenia Ragiadakou wrote:
> 
> On 15/5/23 17:17, Jan Beulich wrote:
> > On 13.05.2023 03:17, Stefano Stabellini wrote:
> > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > Mapping the ACPI tables to Dom0 PVH 1:1 leads to memory corruptions of
> > > the tables in the guest. Instead, copy the tables to Dom0.
> > Do you really mean "in the guest" (i.e. from Xen's perspective, i.e.
> > ignoring that when running on qemu it is kind of a guest itself)?
> > 
> > I also consider the statement too broad anyway: Various people have
> > run PVH Dom0 without running into such an issue, so it's clearly not
> > just "leads to".
> 
> In my opinion the issue is broader.
> 
> In pvh_setup_acpi(), the code adding the ACPI tables to dom0 memory map does
> not check the return value of pvh_add_mem_range(). If there is an overlap
> and the overlapping region is marked as E820_ACPI, it maps not just the
> allowed tables but the entire overlapping range ,

But that's the indented behavior: all ACPI regions will be mapped into
the dom0 physmap, the filtering of the tables exposed to dom0 is done
in the XSDT, but not in by filtering the mapped regions.  Note this
won't be effective anyway, as the minimal granularity of physmap
entries is 4k, so multiple tables could live in the same 4K region.
Also Xen cannot parse dynamic tables (SSDT) or execute methods, and
hence doesn't know exactly which memory will be used.

Xen relies on the firmware to have the ACPI tables in ACPI, NVS or
RESERVED regions in order for them to be mapped into the gust physmap.
The call to pvh_add_mem_range() in pvh_setup_acpi() is just an attempt
to workaround broken systems that have tables placed in memory map
holes, and hence ignoring the return value is fine.

> while if the overlapping
> range is marked as E820_RESERVED, it does not map the tables at all (the
> issue that Stefano saw with qemu). Since dom0 memory map is initialized
> based on the native one, the code adding the ACPI table memory ranges will
> naturally fall into one of the two cases above.

Xen does map them, but that's done in arch_iommu_hwdom_init() which get
short-circuited by the usage of dom0-iommu=none in your example.  See
my reply to Stefano about moving such mappings into pvh_populate_p2m().

> So even when not running into this issue, pvh_add_mem_range() still fails
> and the memory range mapped is wider than the allowed one.

The intention of that call to pvh_add_mem_range() is not to limit what
gets mapped into dom0 physmap, but rather to workaround bugs in the
firmware if ACPI tables are placed in memory map holes.

Thanks, Roger.

