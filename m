Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5486A4B6D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 20:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502872.774894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjPI-0005EK-IB; Mon, 27 Feb 2023 19:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502872.774894; Mon, 27 Feb 2023 19:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWjPI-0005BZ-F6; Mon, 27 Feb 2023 19:43:32 +0000
Received: by outflank-mailman (input) for mailman id 502872;
 Mon, 27 Feb 2023 19:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWjPH-0005BT-4F
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 19:43:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id febb149b-b6d6-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 20:43:26 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 14:43:17 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6000.namprd03.prod.outlook.com (2603:10b6:5:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 19:43:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 19:43:12 +0000
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
X-Inumbo-ID: febb149b-b6d6-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677527006;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=47hrV022imjNL9At+nLTGFZCNqOEN0PDuu0mk4P+w08=;
  b=f0SBLCX0wzGEG7UFGhV5VbiP64jX7zp32WnJj1vlHezr31l7CQzU02c8
   6uGMP8W6zgW+QdsE9yNqpXes8XkE+iwptyOJxryKgdLLVoqb2+7zz7Fw7
   z+CTRSUba6asS6vWEhyNMC1ZLxt6RIR4khzSPyHIiD5t7XHDNfF+Wg9Zu
   E=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 101163551
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ghROsa0+8XkRN88SpfbD5e5wkn2cJEfYwER7XKvMYLTBsI5bpzVSy
 DQWUG+HO62ONDT8e493Ot7k8ktT68eEnYVhSgA+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gZkOqgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfBTgez
 e0jAggxUBGsuseu/J+lS/NjmZF2RCXrFNt3VnBI6xj8VKxja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvi6Kk1IZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjAdtMT+Dlr5aGhnW8/XUVMzgnVmKnuNSBtXeVZPNvN
 3Ubr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85i8jVf5mGa+xy9fzSTf5x
 mnQqDBk3upNy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:5GDFq6CbTIuLncPlHeiisseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssHFJo7C90dq7MAjhHP9OkMEs1NiZLW3bUQeTQr2KqLGSugEIeBeOvdK1t5
 0QFJSWYeeYZTQUsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzs1bpwC4cXBSQtWnCmIDV+3jocSOsJ79exYJCzMu9QHL1FqTmfPHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+5g7A23TV55F2nsKk7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0auSwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yHeD6EGT7vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7ApiLg/NLFPisa2HZc4EBS0NL7vUYvErf2W4Uh77D3O3klVavoKRiKqLzP1t
 MeSP00qswmNm9yJEqpxFWHiObcI0jbWC32DnTq8/blrwR+jTR3yVAVy9cYmWpF/JUhS4Nc7+
 CBKahwkqpSJ/VmGp6VKd1xNPdfMFa9NS7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSpqEnieQPGmzdlO6FTAUW+9VTPixoVX4IV4oKT1QP7uPTeYQF4jnsO8q7EUA9HdWf
 y0JJVKasWTW1fGCMJMxUnzSpNSIX4RXIkcvcs6QUuHpobRJojjpoXgAYTuzXrWYEUZs0/Ecw
 o+tWLIVbp9B2iQKwHFqQmUXW/xcUri+p81GLTG/oEoufgwCrE=
X-IronPort-AV: E=Sophos;i="5.98,219,1673931600"; 
   d="scan'208";a="101163551"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5RycFx9unkv3Lqwb8ABzHNJE/Y+4f06BbPA0M7U+9Dkt7DrTxW48toki7/qRguO69k+zPL9Ez+CLAid67l2epplYqKIFj8ZEgF6Vp5DvHB7Ew8PMBhrfqcJx0vRXnQ7EF1hXHI7zMvDLf2snNHqEcRQ294GR6d/Wpet5zlZPn5CdXcaCPV3WvxFKO0kKHEq6VfAJwvfFsjDRjVkSbTMNbfvhczWw0ywXfC535gqcGDR8qZc0vXkPDaHY/E0lMW+gl33Ju9abW5uPMoNSVRRFX2Vyg6dRi5dJJtrPLvh40rnlTyrzwubC0dnqDK5tBIWmDoOK9n6PIH2IgF/SXnbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47hrV022imjNL9At+nLTGFZCNqOEN0PDuu0mk4P+w08=;
 b=ZieN6+VSLI/Boa1uaEVNdCpvbfwPOycjMhS/H81k8ZdSh3XyPAQGXYIsQaNWcYB+N6kwfWZ1QAjoklXWKxIeNR2pj5YgfxSAmMTBSh+rmWqC4Z0UkFkbxcha6PlA5vFvakgtSH4R8O//H+zK6Pd08DJiqP0YV7+C60Z4KOtThn0MJwXMk3eG7lRGSwoODTMJwP8BLrkWXd2Tce7PHY8THpvZt7N+BVQewRo9w0iVEZ63r+nY5Uq1xyR6XX0zkYx3Ahkn81/i4/AD6Jy8orXXrdYQ9EC7LcS+PYu512yQzSNLCX9RsDCfNNY862kxE080YTOdOPZFEFhGFVvJs9EwVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47hrV022imjNL9At+nLTGFZCNqOEN0PDuu0mk4P+w08=;
 b=GdxgunQFW8hCWeHou8zbI37+FpdrsVts9q2Fw+o6BNJQb9merJFDf9l6y4p4G5GI33hBZg49fsRo+1bXZ6qPNnzuj+yHZeS/yOyjZxhlJCVz4l9CTsZSV4Pqav8w65uJa9L94YO04h8+/K1bOj0s2DFdLJPcljxUpyD/w+Uygck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3ca0416c-0d16-1345-0d42-6c66759e477a@citrix.com>
Date: Mon, 27 Feb 2023 19:43:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
In-Reply-To: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0205.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: d8046875-9300-46fe-5f70-08db18fadc4c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O9GOUOAI3lIy4yyDv4tKcr4UsdWo2MhtdEmhR8qH46ZiziyFCnSeqPpgDHk82irQ870oVdz5WpcpHXz8yvXFo2wjAcPUvBkfYl6uDTs35ZjSZsrAcbTmVdV7bz+aeb2bTjBnVi5Y5mnQyP3nGkb2/56KfPRuyfeJpr6WV+w2w1htUhb3m2LSjG40i/f0Z5pRE30ZevMomEc+Lh1+ZfuQhVIUmey2EteoWiv8DjlRtaQvY4tYSBM6pTYrOfweowVWQR4t+gl/aM7fVY6IYxaKmgMgDhAcz9g5RWp/PuAfKsSe2RQNAIeLTZPvLRTZ9xBAebWOnYkMCk8qxq6PjmgE+jdQF0LebgneeacgRs598HG6lRQGHD/P8xMBLBEhoNhIkXZ1dd/6Yc95SDMnBuNQVPVAYTxT1C8ohMyb1EOB/o7gvT1/sQE43s4vZz5H7Dyn9WkbqpZioz5MMDrzgSt65UyRI5zo4lXpPE05V30fc4s8pmaI6I7jmRH0jGmmboJqTzazKvC656BzXBZOLZo74GBKbNCVFFFi9pI93dKoEqgEONQJ9zSk8YEFhZYCbkAZZvc9FiWpQBzGoDwkdq60MgbPnC3vpjFjXBNiV4kdMNqvQTKCHRnGgtAMhMuoXmisKdxqE9YHF2MkrJK/ysyQbzWawKlNrEp8paq1+V1L3z/Or2aQquzI4rWVBwSsdbESKFL8NwkFctmGSucRVxgp1WsLi9bNWvp4tsAPywDtHZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(31686004)(83380400001)(316002)(54906003)(110136005)(36756003)(82960400001)(4326008)(38100700002)(8676002)(6506007)(53546011)(186003)(2616005)(6512007)(26005)(6666004)(6486002)(5660300002)(86362001)(31696002)(66556008)(66946007)(478600001)(66476007)(8936002)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTg5N3kyT09zOU8yckRDOCtlWFFOa0F6T0g1b1ZnTGdVSFZBSnB2QU1vRnRy?=
 =?utf-8?B?OUlScjBTbFNaQzIxeVNBaEEvY2F4ZXJMWXEyeHptbDVuaXcvQ21DL3pCQzRY?=
 =?utf-8?B?ZE5zenBTc0N2SG0wWnBNWXAxRVNKamIwY2Uya1MyQmFaZllSYVZGbFV6K2ZP?=
 =?utf-8?B?amIyNDRNTjQzNzNweGtBUW9Yb3BLalpJUjVqWUI0SXFwdG0vMjZVZGl6NVhX?=
 =?utf-8?B?Y1QwT3dnREpUWm9MTzk2SmVOeFBWRDgwbTQ5VU9wakdLZGV0Sk9LakVwRkc4?=
 =?utf-8?B?alpFVWFzd3NTMGY5UkFtYWFWVldrTCsvWndGVXh5enlVdEVneERWa3kyVHJi?=
 =?utf-8?B?ekVTVmZXaGFNWlJOeG5ObERZTGtBWnJ3U1V4bHFyNmRUZ1F4UDE0bmlydzM5?=
 =?utf-8?B?MXpxTjR3eFZabTB1bjVTUlV6QStBYTlTOFBPYit3QWZ1eDNBYXpPQi9KL0J2?=
 =?utf-8?B?L0VqdGtCVHhVbTMrVUZlRG0rTDlKaU0yU3lBemppWkhDYUZFTTBmcWEySXNJ?=
 =?utf-8?B?VWJtZDJhbndEbFZ3aEtzN254ZDdURm90OUxrY1NUN1YxYktKWmFiTDlRR3Mr?=
 =?utf-8?B?b3RidUZHY1EzdlV0MTRmZVRuem9GNjJ0cVViQVdPQTA4MXJBWDlZczhsMlla?=
 =?utf-8?B?bVJlcE1vb05HbmtmZ25hdGhlb2dCM1pzQjVBQkpOenJBbkNTbnhLTVRmOHBT?=
 =?utf-8?B?VW55T0dWK3RMTzJEcTNlMWcvdU1nbm4wei94bXFrTkVpY2JPRlpWSVc5SXZL?=
 =?utf-8?B?U0NlTENRQ3JocVpuaFVZR1BnNktWZHZUTm51akpBYURFd2svd3hUNWFZZ0tz?=
 =?utf-8?B?Qm5jTjUxSW8zMjg5TEowQ0Z5K3ZLVExuVUFBRytReGgzeENIdmFFeHEycjk4?=
 =?utf-8?B?MnkwWEJaTU96Y0x1eGxJZWNIcXVGWGJQR1c3VmV4Tm9mOHQ3NWVEczdsL1gx?=
 =?utf-8?B?U0FnZWliSEVNdFoxbkNEcjdTUkI1eHpFdzJlQmZkZW14UnRtdkZoSDhTSVhn?=
 =?utf-8?B?dUhJcDRzZ0dKZ2lWMDFSc3lFRm1sQWNWaVBFVUVCb1M2TWNNQ0RjMTgzanRW?=
 =?utf-8?B?LzVHajRTeGVQQmN3eGk5RDVKWG85UHU5akVnb3V1QzB2ZEJIREZZMUcxcHY2?=
 =?utf-8?B?dUJxb3l0aTZIY1JUMGg0UVpRcnZFU1c2N1NLV0dzOWpyT2VyMWJCS1B1dGZr?=
 =?utf-8?B?UjZLV2tYWEg0aHl1R3RPSEw1c20xeG5ZNXVqMVZCNHA5K2krYm00T0Q2Rjk5?=
 =?utf-8?B?YmcwM3J0aEx1QjRVeXp4eG9HOU9uaThRK2NMdmpqTTJpV28xNDRFMWN2OEEv?=
 =?utf-8?B?Z3dmMU5TVmt5MWYxdnRhWDVqMWtiSStobTV2RjlvYjJMUkQwTFZpMlRjVlE0?=
 =?utf-8?B?M2I1bWhUN3grNjNIaW1KaW4zVm9NbTRlK3BHRnBud3g0c1l0eWh3dld4bTIr?=
 =?utf-8?B?ZTVrZE9QM0N6ZWI4OG1jaEdNeTFMOHdjbjNXcTVVRGRSOURPNjRLam91OWhj?=
 =?utf-8?B?T2h2R2d1L1NtWGMzUGs4dk56c0JJSWdFWWd4Vi83MTduWU1zbSsyVlZ0bGNz?=
 =?utf-8?B?TzB1YVpmWjBlQTFhclBVQWpPMlpVcm1COE5KWXBBc3hQR1FJUjJ2MGdZdDJa?=
 =?utf-8?B?eFVZc1B5K0F2VGhxblJVZEJvVFE2M3Q4UXhiMktpMVRETForZVN4QjVTeWJW?=
 =?utf-8?B?bkJRVDROUDUvbERGbkN0V2xkallGRnRBVWh2SUNHNUZJaVlEU2N0YVcxMnZQ?=
 =?utf-8?B?clQ1Um5kUk9nMDBJV1lGMFBlTlZpT1krVjNic056V2swdVBWYjlpT3h1V1pq?=
 =?utf-8?B?OFRxM0owQVN4ZnBkR2hJbXRtaWw2Vk8rRXREdWhpenBlcTVoRUxveDZYaWZt?=
 =?utf-8?B?Y042aVBQdXdDN1BUblVmL0tNeW11TDBEM2lqZ0hGN1dpMkx2RlNvdG1JU2Zm?=
 =?utf-8?B?TlBDdzg3bVZTZEdHcmtyT1RpeFJzNHZ3SGFWanVObWRxUm1mTDl1a2s2TFE4?=
 =?utf-8?B?d0F0ekhnYStUbTZGWkswOTlvVmZmck5wL3VnZXk0dFg1ZjdtdzBDb3h5VSs5?=
 =?utf-8?B?QmNPeHo1TG1pRldESitRbyttR1ZoT3A2MitkdjJqQk04dnU1R29kbHpRTTNW?=
 =?utf-8?B?NmdaVHNvZjRpV3U4bzQ3cjFyVDlCL1hZd1M5cjh6Nkcwd1dNQmpXRDdJL1Jw?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y+ekATqXQqlLBz/XcE4Zx4L1/Snk7n9sAV8GjM087AT/cSPdHI9nZ9IC1rvpnrg6JqzkboSV1VnGdNFr5MJPpKVb//9KkGjhEHRMWS/eNCtySEcVE+12Cvf/1tbhn6fN/Ydl49kAIbJtr2HTaXnd6oVs+lquvynd2ufGlpGL10Dqw5PYjFyN6e4MUq9nKJcqcf2SwUrw87iJCw0bLTZDnrwJquJxxDFWT0SYVw7iAcyY5fU9WEfWdOSBBqVera5TLpcBkXZDFHLimO08qxasr99trC5vgoJbAhcTMRvbc/Z3A4d6sfgGnFjl2xTZSVPZVyK3M+7HL6m2CkoGfrY50VT2m5LKYQJM3qH0ShqR3qsVIWO8aBmg1GZn8LTFlRAuwogtAwpo3Q3nG9eBWGMTrZenY5vKc/iQorMx44L4dwOml7bgSc5XfvYK19yyTKhD3lU4VnuSFdfPDLKheLYaRo5ilX0G2OIgVuMMV9g1NsaV9Fd+cyR2P78zGfhO2hy6GQxfQYcfOTJdmNe9xlJguLOGpO4OC3l11zShIEAEXk59Y2P5jfr5oCyyhrUXSi1CsZsqFcQ0m1Cvp77juWi42hVRXir9hDAW7olBkmNZu4yB+XIsXD2F5zcqWvJRncf2Yme+mkh48SUwX2GZkzdf9s83F0d//y1xTF9/NQ4x8NqVHsHLwG2pY6xKKeT4ToooEFFdRYL9rmGIIjOKXuiOP7WY0wpi8YDcjvwroAYOWY5F+7Au2x6Vom/+jC2J/C3O4aTQb/pqp/Ot6dhFCBArOGrD94X9ePjF3UMm1B9RjOakeup9kfBWNGiXjI3cBr1W
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8046875-9300-46fe-5f70-08db18fadc4c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 19:43:12.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqDPax2+b2s0go3U0W1keLs+ndG1iNh6P5GNcCUlbnO1UCLY9YhtxYb+Vf02xr3otMlmO6gxQVXz5Qw3p6TeIeXVZ54RwX2HOuuYDi1Th5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000

On 09/09/2022 3:30 pm, Jan Beulich wrote:
> Gcc12 takes issue with core_parking_remove()'s
>
>    for ( ; i < cur_idle_nums; ++i )
>        core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>
> complaining that the right hand side array access is past the bounds of
> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
> zero in this case (as the sole CPU cannot be parked).
>
> Arrange for core_parking.c's contents to not be needed altogether, and
> then disable its building when NR_CPUS == 1.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Disable building of core_parking.c altogether.
>
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,7 +10,7 @@ config X86
>     select ALTERNATIVE_CALL
>     select ARCH_MAP_DOMAIN_PAGE
>     select ARCH_SUPPORTS_INT128
> -    select CORE_PARKING
> +    select CORE_PARKING if NR_CPUS > 1

The appropriate change is:

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 6a7825f4ba3c..2a5c3304e2b0 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,7 +10,7 @@ config X86
        select ALTERNATIVE_CALL
        select ARCH_MAP_DOMAIN_PAGE
        select ARCH_SUPPORTS_INT128
-       select CORE_PARKING
+       imply CORE_PARKING
        select HAS_ALTERNATIVE
        select HAS_COMPAT
        select HAS_CPUFREQ
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8eb..855c843113e3 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -10,6 +10,7 @@ config COMPAT
 
 config CORE_PARKING
        bool
+       depends on NR_CPUS > 1
 
 config GRANT_TABLE
        bool "Grant table support" if EXPERT


The core parking code really does malfunction with NR_CPUS == 1, so
really does need a hard dependency.

It turns out our version of Kbuild does understand the imply keyword,
which is the right way to spell "I want this feature unless something
else happens to rule it out".

As noted in the kbuild docs, select should only be used for immutable
properties (this arch has $X), whereas imply should be used for all "I
want $Y".  Most places we use select ought to use imply instead.



>     select HAS_ALTERNATIVE
>     select HAS_COMPAT
>     select HAS_CPUFREQ
> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -727,12 +727,17 @@ ret_t do_platform_op(
>         case XEN_CORE_PARKING_SET:
>             idle_nums = min_t(uint32_t,
>                     op->u.core_parking.idle_nums, num_present_cpus() -
> 1);
> -            ret = continue_hypercall_on_cpu(
> -                    0, core_parking_helper, (void *)(unsigned
> long)idle_nums);
> +            if ( CONFIG_NR_CPUS > 1 )
> +                ret = continue_hypercall_on_cpu(
> +                        0, core_parking_helper,
> +                        (void *)(unsigned long)idle_nums);
> +            else if ( idle_nums )
> +                ret = -EINVAL;
>             break;
>
>         case XEN_CORE_PARKING_GET:
> -            op->u.core_parking.idle_nums = get_cur_idle_nums();
> +            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
> +                                           ? get_cur_idle_nums() : 0;

These don't look right.

If the core parking feature isn't available, it should uniformly fail,
not report success on the get side and fail on the set side.

>             ret = __copy_field_to_guest(u_xenpf_op, op, u.core_parking) ?
>                   -EFAULT : 0;
>             break;
> --- a/xen/arch/x86/sysctl.c
> +++ b/xen/arch/x86/sysctl.c
> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>         long (*fn)(void *);
>         void *hcpu;
>
> -        switch ( op )
> +        switch ( op | -(CONFIG_NR_CPUS == 1) )

Extending what Julien has said...

We use this pattern exactly twice, and I would probably ack a patch
disallowing it in the coding style.

Its a trick that is too clever for its own good.  To anyone who hasn't
encountered it, its straight obfuscation, and even I, who knows how the
trick works, still has to reverse engineer the expression every single
time to figure out which way it ends up resolving.

~Andrew

