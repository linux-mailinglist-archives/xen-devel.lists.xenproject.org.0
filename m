Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B163A6F4225
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528497.821728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnk2-0008QV-1i; Tue, 02 May 2023 11:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528497.821728; Tue, 02 May 2023 11:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptnk1-0008OO-VI; Tue, 02 May 2023 11:00:17 +0000
Received: by outflank-mailman (input) for mailman id 528497;
 Tue, 02 May 2023 11:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyLC=AX=citrix.com=prvs=47975177b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ptnk0-0006Q7-LI
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:00:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81b76432-e8d8-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 13:00:13 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2023 07:00:09 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB6128.namprd03.prod.outlook.com (2603:10b6:5:397::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 11:00:06 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::b0b8:8f54:2603:54ec%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 11:00:06 +0000
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
X-Inumbo-ID: 81b76432-e8d8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683025213;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KsLAOn3h7ZIfMVeyWt77Gz0Acm9pzqv/sXsIG3autwY=;
  b=dnLnP6+uXLzlrwyxSRa1pZnBb16xI/kbhKwLoXpPuCbfqmOG+BoYUWmB
   u+x8W8Ml1VWvcn1Txx/J4WYGTyh3ZL8U+u5NBaFHufPqo5YzaXWfgG9IE
   ByYFnua4MigPwgp2J/KrdESJMvsbLgRSDCe/M8pN1fK9w72FobFuOlld4
   8=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 106884776
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7mCyP60ms8IletlK5fbD5T9wkn2cJEfYwER7XKvMYLTBsI5bp2QHy
 zZLDTjUMq6KNzCmfIx/aoi19hsO75Hcy4c1QQs6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gFmP6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfG2FPr
 8UEKgI3axmu3bvszK+Hdsl+v5F2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1QZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13rGfzX+kB9x6+LuQy9xhonuh/mgvDyY0UEe8jMCc1EGvYocKQ
 6AT0m90xUQoz2SnVsL4XgG4iHecswQARsFLFOkn9ACKzLGS6AGcbkAGRDNcbN0ttOctWCcnk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfDhUQod9gjRGGW/4WtEiJWNYoWp7R3R66ZGJYPAFF2Z5
 iFbw46Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBO
 Sc/ZSs5CEdvAUaX
IronPort-HdrOrdr: A9a23:cV404KDrnjN+4c3lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:h7SKTmM8Qm3O9e5DQilmrncIGPIfd3Twli6KL1KENUZ7cejA
X-Talos-MUID: =?us-ascii?q?9a23=3Ay1nRmQ+GXCFCk7Mog2tbaRyQf/pK6IaIOngJrZI?=
 =?us-ascii?q?9mcyYMgFJHmmSnQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106884776"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVUnNBhYuQztLClAKCXvWb0EkZ02/GwYzCpwEzH0pv0jvtve2nFvzqG0jV+3SdW3PCVqPZ4O/LhAbErA/TPpmL3+DyjVKNzNv+idOIEcaSFigg0MiF/GDlFKK1oAc/DoztiLgTxOku4aU65QXeKUPxj36pGor5K1I9P+oYGGmwUaniiJdXfP6jo14cStLIbyXzdcgu9yLax5IUWJ0C3oAm+M/qoduGeESu0QQfCucmJsVbxEyB15ohs6YctuMzxLZqREfm6MceDn6dR1ChuJb11cIhN8dzJYZFb7QxnifmSnHpdzHO48CJHQeRMHy3ZBt/vX9v+mKjI0yZHJbIWOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njO6siTvEdw9eAhZlRafJ1EmMyH9PhIGPS5uu3T0qFA=;
 b=TOjV+M3hwYwdyTS1NeD6RxzMpaPh7J3oiwl95PE/QHF28XUJAFBDclZ0FxnrFgeIHYil2PCQTm586RsUNpfrzy6MG1GRF+pIXWbvpfpv0YSZFdm2XjjZ7wwRaSc2VBM8peUEBMN6epqX9X6ZX9XPgazr1SoZTsuODXowGmqAWPZO9InA24VYWQuKddA9MLKIaGkYTn7ci/Clmxn3PTVuag0RNP7FjEwNheRmRwHYI99zt70ndHnZVM4/dbobv0cUAbeZ+DRyX0yDTn6ktSgBPkGllblf5LzUlAplII+pOmwrMZCBR+0Rfy9UOSGi3Jc49VfWa6zBmA6Rozojmo2Krw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njO6siTvEdw9eAhZlRafJ1EmMyH9PhIGPS5uu3T0qFA=;
 b=lq8ZPiqAIprPs94ksrlG+ImM8haJarARWIVGmfAeComHM21kpkdTAfCVjf3lu5qFPjMvRJbSPv3svPGDIQsU5xW4t9K8lGS/j1kbmYu07GGCmlaZw1dDzYJvUTtB7Z+//8oS1TH6JSPRU9zp6u3P883GrKzgkczIBU9dyYwCrJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 2 May 2023 13:00:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] sysctl: XSM hook should not cause
 XEN_SYSCTL_getdomaininfolist to (appear to) fail
Message-ID: <ZFDtMMUzBGXFZPsQ@Air-de-Roger>
References: <26064a5a-423d-ded5-745e-61abb0fa601c@suse.com>
 <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <600c8c62-5982-ec7e-7996-5b7fbfb40067@apertussolutions.com>
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 674fda44-a22d-47ff-0478-08db4afc6324
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ye/g9z/fhzI9QAKeHyrQUFCabh24zeoq/DgjNuJWI8AsO0Frkn6hSIsMLm57yPaxqUjBGZKK7pcw7pNlSip8cqEXfwdwMhqb4Kd9m5Jl/2l79CtUR6lC//2yoaQRTsHSoNi6pFR/jiMiiEdTC3/aw/eYqxkkGZvEXqk4ukPFpy2fIA2QmAQbH6pk2DQ8xFBHoG+JgR9mzyjtxAcAMq81j+Z+3GN7BkG/cAStazSUKMJtkwB6Nh+BKtELExXfKw6SYXqJBe5z3Xd3G/eseTyV+fN57gb+imqBGM3pypelixr94aTRzGGp3tFtmH7Vx9TTvABHYZTt05R0efL09C2P/RnZ89gWqRTe2RFpVZnXgP3w5t/hT23A+t9mX2WObeQJBY6a14W1Zj8fm2dNGrS6q2G6VFNstif9SJSbHHZZ5IZ2cv+Thx+UfaFtt2ssll3KzeH4Dsm6HnexAFlMtGtU6uQS5bS/qbkFgHI9Ti+JAoN93C1s75JRBGC1PUxW/98l++e5yHmerySBMa5zpikwebRI3khD4kr8uBKtAmFlTU1aVMfYWwy6mrN27aSsPkW+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(85182001)(6512007)(38100700002)(53546011)(9686003)(6506007)(82960400001)(186003)(26005)(86362001)(6486002)(6666004)(83380400001)(41300700001)(66946007)(66556008)(6916009)(316002)(66476007)(4326008)(5660300002)(2906002)(478600001)(33716001)(8936002)(8676002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlJEa0JsbzBDYTR5N2kvNHdVRTU2TG1VY0FJM0t5RDhiTGhXT1gyd0txNXhV?=
 =?utf-8?B?YUJKQ3Z3OGpRWkh0V2JyQW5NZ2tFdkNEWExMcVY5UTQ4UUpKTUtaOXYxdTBx?=
 =?utf-8?B?WUl3WHlhNGdtWFRzSUVKSUNaN3hYOHVPR3JmL3lqNW4vdkpCYXVDVHg1WUdS?=
 =?utf-8?B?eVUxYmJEMDhpeldFVjU1ZlpYT3NmWmFqU3dTNE1SWEdkRkR3eUx3dWYvQ3V3?=
 =?utf-8?B?bVFhM2tjeGpOTDlUTW93Slk4di9JcEVEaURiS2Y0ZEJkcGx2UW44Z1o4cXFZ?=
 =?utf-8?B?Y2xkSUVwT3k3eEdoak9PekJmWGRpQldqeUttV1RaL2F4WlpHWExIVTAvNzV0?=
 =?utf-8?B?Zkhya1NYYlg0ZkJaNXlsQXJ5N0JGTFNrTEt2RVVid1ZpVkRKTzFvMGlQN0NR?=
 =?utf-8?B?cXZQWXFrWENwdzJrL29Na2pNOXdBczlBREF1UkFEY1Y5dzl2T0Y1b0dhbWpi?=
 =?utf-8?B?ZWR4RTQ0QWNWSnBkTzN5RXU0b09QWGJpU3FTci95dnBNL1ZZWGEvSVExMDVp?=
 =?utf-8?B?eGtialJFazYvWVBZeVRrYlA3aVNVbkFXTUpwUXJBTGNFcWVlSE0zSFdJMjVs?=
 =?utf-8?B?QlhDSy93M1dPb0lpTE9hRlNqSnU0SDdqZnh6LzhMODdraDhjbGt6M1c1K0FN?=
 =?utf-8?B?WC93djJabGhMSDJnMC95djZjME5qU2xtQ2tQSDdYc3FHeEd6NERyOHU3bTJF?=
 =?utf-8?B?NUJTZ2p0bEttVzNveStiZnhzQ0hvWFFrUUZKMkI2QTdrTVVlZE1CVHlRR1U1?=
 =?utf-8?B?NTJMS1NmSU05dzVXK2JFZ1ZUaksrSXRIUjgxQUlqVVlGTnlLTXc1ZllmaENV?=
 =?utf-8?B?eEJBTHpTVk04a3NGWmYrVkN5cGt5K25xNy81UW5UNnN2ZU8yeDZoODhacmxJ?=
 =?utf-8?B?aU5qbFk5RG1Kc1ArbGErQnA4RnVySFJjQWVsQytxYTk0L092Q1AwSlRULzM4?=
 =?utf-8?B?VTYyMFAvbnkxNE43VURrb2U3MU5oTDZOTWZ6ekVYRFB4bzRoNG1WQXZJSVc4?=
 =?utf-8?B?Vkt1eU1jUXpDNVRkQVhsWCtrcDB4NHY0SUFKc3RZcGN3SGJYdk1OcVlBdU1z?=
 =?utf-8?B?Umpjcm9vZFMzcDZERjNaM0JhUGdWN21EMGExR1pwRTBKOWw4VVcrRXplMHdr?=
 =?utf-8?B?MEVUcTl2VlBDaVBBRkJmbFlTUS9sZ0hOR3J1MVAwb1IvMGM5N3ppQkNSSE9I?=
 =?utf-8?B?UjdzMDhkeHNGU0tzc2xmd3FXSG9CQ3ZqeWhJQlNWSmtDR1hVVThRVjIrQ1VV?=
 =?utf-8?B?Yy9tQS9NY3YxdVZDYkREbHErWHRlT3ZuVThRblBJaEk5SW1zVC9EZG1tYTJQ?=
 =?utf-8?B?OThaRklXQkpvNEUvUE5Jbm1EUWlaZjdqb0JpSzdZQW1TVWI5OXJFOTNib0hk?=
 =?utf-8?B?aU51TDJQRlZyUVNoUmdVbWdRa3FoMmtZTHZsd0JTMVFLSGlyd2Nub3lVazM5?=
 =?utf-8?B?dHhNVldSemplem5TTFZHMmRIZjZoY2xWTDZ5Q1lrd0VXTkJBMTBhSWFYNEoz?=
 =?utf-8?B?cDdDRUVnOWRDUDVYbDF3MEpsVSsxdW1rYlJrN1M1VXdmZXNBMlhmV1FqMVNE?=
 =?utf-8?B?alYvUE1TeU5yeVI3Mk0wUDhZdjdDc0Z1OHRib2dRQ2RJSGw4TXBXNzc0L0JP?=
 =?utf-8?B?OU5zTHpoQkl2VUE5STNRTG1RTWNRSGJPWFhZUm1lYm9xaDZ5eGJ6ZlJHZmpB?=
 =?utf-8?B?anNVQ2IwNEpZaENHT09IN3lkazk4MndBN1RaL0RZUVFEaXJjc1ZHQkF1TGRB?=
 =?utf-8?B?cTNwdHc2cnZIemZJUGRrRTFMZmRBOE9QdGJQZktYckdESEtQeUN3VFd1amln?=
 =?utf-8?B?Z0poMzVHNWJ4Wmt2dldib0Y2MkRJM0NIWWZMMW1Gb010MnJCZUFxZVBobjVJ?=
 =?utf-8?B?MzZqYzRXQ0YrTVp1bWR4ZklXanZZN3JMcW12L29kZFhzanFoYkhxTFVLWGFQ?=
 =?utf-8?B?RlVUa1JiamtrcEVoR05PZjRTQ2gzSFdDZTNHdXprZ1VBK3g3TXhlZVNseElZ?=
 =?utf-8?B?Z1Q1M2ZWazI3YjRxTUdTOTNBZjFpN3QrZ3VHQ1BIMjVjaWRER0EyRWRpRG0x?=
 =?utf-8?B?VzRqM3BwY1ROQlg5ak9sQVJId2JFb21zczZ6MkdQemVrTlluZlpseU1xb1Vi?=
 =?utf-8?B?UTNkRkFJaGtTcFpnMWhITVJmN0RPZGthQlhmVk5wbkFEN2pKRTZQczdHajZK?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p0W+dYFNiPFQKtUqJnzvYIWjaZ7zENr5dPNQquraobBBIRwLgKVNtQg4sudMy0SHpICyXpkYCxRpsuH8tN2L+8fu5YCg34VS8DKapIr7ZHOJa0ISA39muuSLbq84vnXEnQ3uQYcBmj0DaPsIfUfm1NcJzf6ZND3wAHAtLryIQ8VNHgjaYn0u+7YiEMCPI/xHcF/QwDSuFqxZTKDs48tEALixZ5+qpsFVU8Fw9W97ye53CfkjmqZ5JU39/eKjbML2sEKDEtLFaEE3yr6mIsqkfxfgM2ej8NVE7fj0PL12e7l1XRgRtjHkVsF0Wx+9fJTVTzcQ3LSL6rM2ObfdcEvcLidUlo/tyV4ubF3zHhVu3OuiuXQ6Sq8hShEyv6ZnGwlNuMnBUSlVZLeIev3R7N4LLhXX1m7iVhcayU1/hprZcv/LQu8nKPl8GAI4PLOiCrFPFP6zbqLNUyzgYE4mvKrBcDst2A1uRb586hpqcSb5zsHa6ioJCgOYzZA5h+MB+FQ04Aqs4NwTHL5rcpJBFJf12hnC13zoOn+tvxMqqRby6hyxv6pSpT5S6Ql1GZ5IZLBv/pl1+CIhD/i6W9OFaOKzU7MbMjmRNcfm3Bao3/jqZ0fH63A5iIyFlW3lgnjwPmK4p5lOnQ42U2Ol298ZEcgHRR80ofu1XDIyastYjiRo95CzfMryjsQDgzx9qGN6/Jp6hAWxGsOMxkRuzLQrJweeoCBK7/NjDpkMZLnw93dFZctlyzpZ7CGb8VUPNlV9n91VvTh/diTc5APOOBKFTORt6k4RepPIKH0Bb13lX0qkgalN3/18QZy0geko8qUxKL53/XAGNB4IRe6vqVEg0xp+tQa+vplqzPwmbxbaFbYTGaBlD8B1vBXn+3LYQoxPER451PnS3u5DncA3srLq2TtkyA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 674fda44-a22d-47ff-0478-08db4afc6324
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:00:06.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1kUJTobExAt2oY4ggIv4p0P4U1dJGqGWAahyaTPYIiDQwS4uk6nRmA+kiVxYcXXxgDD5M6ox4vlw9jKn1TFMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6128

On Tue, May 02, 2023 at 06:43:33AM -0400, Daniel P. Smith wrote:
> 
> 
> On 5/2/23 03:17, Jan Beulich wrote:
> > Unlike for XEN_DOMCTL_getdomaininfo, where the XSM check is intended to
> > cause the operation to fail, in the loop here it ought to merely
> > determine whether information for the domain at hand may be reported
> > back. Therefore if on the last iteration the hook results in denial,
> > this should not affect the sub-op's return value.
> > 
> > Fixes: d046f361dc93 ("Xen Security Modules: XSM")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > The hook being able to deny access to data for certain domains means
> > that no caller can assume to have a system-wide picture when holding the
> > results.
> > 
> > Wouldn't it make sense to permit the function to merely "count" domains?
> > While racy in general (including in its present, "normal" mode of
> > operation), within a tool stack this could be used as long as creation
> > of new domains is suppressed between obtaining the count and then using
> > it.
> > 
> > In XEN_DOMCTL_getpageframeinfo2 said commit had introduced a 2nd such
> > issue, but luckily that sub-op and xsm_getpageframeinfo() are long gone.
> > 
> 
> I understand there is a larger issue at play here but neutering the security
> control/XSM check is not the answer. This literally changes the way a FLASK
> policy that people currently have would be enforced, as well as contrary to
> how they understand the access control that it provides. Even though the
> code path does not fall under XSM maintainer, I would NACK this patch. IMHO,
> it is better to find a solution that does not abuse, misuse, or invalidate
> the purpose of the XSM calls.
> 
> On a side note, I am a little concern that only one person thought to
> include the XSM maintainer, or any of the XSM reviewers, onto a patch and
> the discussion around a patch that clearly relates to XSM for us to gauge
> the consequences of the patch. I am not assuming intentions here, only
> wanting to raise the concern.
> 
> So for what it is worth, NACK.

I assume the NACK is to the remarks after the '---'?

The patch itself doesn't change the enforcement of the XSM checks,
just prevents returning an error when the information from the last
domain in the loop can not be fetched.

Am I missing something?

Roger.

