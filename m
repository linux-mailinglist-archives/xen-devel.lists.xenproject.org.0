Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488BA785392
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 11:14:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589087.920809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjwN-0000As-5A; Wed, 23 Aug 2023 09:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589087.920809; Wed, 23 Aug 2023 09:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYjwN-00008X-13; Wed, 23 Aug 2023 09:14:15 +0000
Received: by outflank-mailman (input) for mailman id 589087;
 Wed, 23 Aug 2023 09:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dmRg=EI=citrix.com=prvs=59206e676=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qYjwL-00008R-Er
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 09:14:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8be907-4195-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 11:14:11 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 05:14:07 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6377.namprd03.prod.outlook.com (2603:10b6:303:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 09:14:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::50eb:2fe4:369d:decb%5]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 09:14:02 +0000
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
X-Inumbo-ID: 6b8be907-4195-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692782052;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=taVnE1srKcTCboeXj1Qk/3/nnqIiigyrNjsu3lFpvPo=;
  b=cmKXk0zPw9+m7pAZzkGphfylVs//9O17nPsjYoAxYFO3N2vmsL/87K+p
   QFNGggl3M5K5+W+q0UDDtd4oIcJg+i8dNMKAhcgnK7Z8th3s9v0DCh5/K
   wGoUs6dGp3dQXn5JGXAokM0qIY9ASQ184bbzeCHPmdnsgcwRZfNBNbgT0
   A=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 119630562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Wg8jGa3zcF/0h8fCrPbD5TRwkn2cJEfYwER7XKvMYLTBsI5bpzAFy
 2sdW2qEaKmOYjH2KN1zOo6z8hgFvJ7QzoRjTAQ4pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gxkPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfUT9A2
 NgqNiw3YxWahvKWh6m0Vct1r5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1QZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r1376RxnumBth6+LuQ+eFGuwXUwEspUjI2Fl+WvtKYhki9cocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS8wCIzaz84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBGjhHoLCTD3WH+d+8qDqoPCEPIGwqZCkaTBAE6d3uvIEyiB3USt9pVqWyi7XdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6jjg7RUqg5wJ9IYWiPoqh7AGC6e4addnBCF6co
 HIDhs6SqvgUCo2AnzCMR+NLG6y14/GCM3vXhlsH84QdyglBMkWLJeh4iAyS7m81WirYUVcFu
 HPuhD4=
IronPort-HdrOrdr: A9a23:JVkPl6yUBNB0soOSv0poKrPw2r1zdoMgy1knxilNoHxuH/BwWf
 rPoB17726TtN91YhsdcL+7V5VoLUmzyXcx2/hyAV7AZniAhILLFvAA0WKK+VSJdxEWtNQtsJ
 uIG5IUNDSaNykfsS+V2miF+9ZL+qj5zEir792usUuEm2tRGtBdBwQSMHfqLqVvLjM2fKbQjP
 Cnl7d6TzzLQwVuUu2LQkMrcsLkvNPxmJfvcXc9dmIaAFnnt0LS1FbieSLopCsjbw==
X-Talos-CUID: =?us-ascii?q?9a23=3AkJXPIGu+CtTNGkcuOELlybGY6It1LHPw6EXOP3W?=
 =?us-ascii?q?1DH9oWJ3SUlCP2rpNxp8=3D?=
X-Talos-MUID: 9a23:aKuVMAQdWRyTX0gHRXTjmx1ZbIBuxJ70J2BOlbgZkOiIMy9ZbmI=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="119630562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6sqK6K5lsi5jp1A+kuALp5hCdrkkzx+uxgn1rizM+5rJnxiFoch+3PqLVxU4fNdzQ8h4+DiItIHQ0wThRSg0iw3hFsO1udh+h9j5s3z3+pJW+lE1Nid+4g8Q1ZAgOLHKAtv5J8HDUnLtX6d47ct+w8xXryIbTMmJccvE4gxVRw06vuwqaG5GQgt8qMvDgeApDhEc8DXAK2lqRWSK+C1cKfuZ/TOD6Za6OqCKhaha9JiuVXuq9iVlqh38hN+TCP5EYReSst5OWDUGMv1+FaxjNVe3Vvg9CeRrffmMbe43y9RyGWw84s1LhJ54p/uNIWVvTXrl9FpPWpsXmrE031SsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kobuQxGY/jhkcbYwpQ8DfphLWkB4zKrJTYceNw4LwDE=;
 b=AbkYRes52DQ76Q1CvNJLF4h4pAxrGp8593KudgJKGtqhRAX/p+aPTcH3lukg3zLNTEQpvxMW8zbdYhMLXm9epfZ85vUFJL7YO9fN+d4hJ0rdij24ZrmIQtlg9gxiso9XXilh5B709VCkmFx6WMAhcTNICrH2wcwx9JP0wcI1H6Gz++PID/fk2XMP8WvL/RSdJpYSIi9fBh/iNHyU2Q77M/8PADESlp0mSYu3W3kdO4lo0smSHeltugzdgMkRqJuXv1QKCUykCraJDue9ZK15siTn9+6MGOy2r9Qiv4SmAsEQBMXgTkwoQxle6ZL3i1910At6HIpgr6eg710aBc/J4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kobuQxGY/jhkcbYwpQ8DfphLWkB4zKrJTYceNw4LwDE=;
 b=AjrXhua5V7N8r2TdIByRtY+vg9UcQ9d1HWz7+ruJhIHvxPSuNGXSMHnPKzGJf6dfDruNT8Ix3eXJPD20P4v6edQzClzesXbrebNCd51QC7ZA5PqRcpUYx0okB5l7Ec6S9SgmpGQSpyAMG9dZLTYaR7aq4MdKCyqHCJcqTNoaytE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 23 Aug 2023 11:13:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Message-ID: <ZOXN1MDWvzW_Pjxg@MacBook-Air-de-Roger.local>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <0bd3583c-a55d-9a68-55b1-c383499d46d8@suse.com>
 <2c97ff5b-03b0-3c17-c7f0-9bc8c9317762@invisiblethingslab.com>
 <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cecbeec3-57cb-c8de-be06-bf8f6e9cc5f5@suse.com>
X-ClientProxiedBy: LNXP265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::30) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: cc979212-a734-4dec-ffca-08dba3b94a88
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PqmE7RGxrWQUGW2MGLDEZ22eI4d3Tgb35dRxYZyclfr+tMrOtsnQMegI5R/bOK/E481F5H2+4nsj7NIYKbhSNNuTN7zBoldhNgz2a2uJA7jUrBoWg733d9oQNwPKV1i0ra+swb6L3ua5mXAKOVZKoINmeD2GGJ6RdUqmXfVssRmQoeU3ACbjkwuwnffkn4MqVtT0F8iGiiU9cbHr4gxcgMp4bvziugYblonPeJ3FnI6M5VISvUxYsk6Tx1V//hq4h5ndE+aTPZBFQ49ClXphwodUp63ads4hUR7ErVhy5neyAkDyYoSQmWK4q8Xohqg3vCD0SixaPBQTSmKoxCzvSvvkqGyXmF7FErGzr9X+2ButVyum5ppApCzPdgCdqjPqaBokA4temXnkGBOI1YYhG4kASr6wrWqnk6yag0BJc4K/BaNYTKC10dp04TEIySCXmS91GRlUdLGep3iDdOkJsgcK5cmO0g/ITOF4w2iugL4UclE0C9vmkwIkUeFhA2q3NSLD7Vj/aZz24VxyuAIziMIP6Kw/xps55T6qyiPLsmHaS7QmIiU2U0OqHVF30XrA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(66946007)(6512007)(9686003)(316002)(82960400001)(8676002)(8936002)(4326008)(41300700001)(85182001)(478600001)(6666004)(38100700002)(6506007)(6486002)(53546011)(83380400001)(4744005)(2906002)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjQ5VnJ1d2xVeERjczlENWRDMUZubGtpc1VhMHAvcFVCa2ErNnI3S3Q5SEZx?=
 =?utf-8?B?dEVweEZCTFRiZGJRQWZiTTVRZ3RWZXplZ1BqT3NmY3RHM0x6eUV1STEraVdv?=
 =?utf-8?B?d3BHQ3JjUjREblhMeU5adUgzbHdRZmhWMVN0blVEWGJxeGsyTXczS0YwM1FR?=
 =?utf-8?B?UGFBRThLMjdUR1RKRTluUFk3eW1Na3BEQnJLUDByR0R4UDNyUGVMLzlMSmJB?=
 =?utf-8?B?cXRCc3FPY2xPeGlucTJOdmdFZFVQazd4V3F5bUdQNE96Q0ZjMXFnR1BqempI?=
 =?utf-8?B?SzNCWGgxMnVWZG9WMUVRTG5seDZteStvckVHU1dnaTdaMmZ2b2FxZVhueDh1?=
 =?utf-8?B?czdLbURvaENhOVZ3Q2Y2bUtGR3lZUTlGTEpjQUFnaktVT1NhaEdWem1wbDlr?=
 =?utf-8?B?SVhnUTVrYUNVYWMzT0ZoM3UyOUYrN3Z2QnF6R0NqMUhCZGxlaVdCbVk5RnlK?=
 =?utf-8?B?UzZpTUNNWFFMWDFYTTMrVVVoR1FaVS9TWFVzdlNjZ0M3OHJ0NzdRNFBsaXZh?=
 =?utf-8?B?bm5WTmZLQUtmaUVpSEVBRDF3OFZOTVhJUURzSUVLNW1xenhUeVFSUmhFSXZn?=
 =?utf-8?B?RStEU2xwTEs1cXRNMmVxQXFOMSt2aVVpK3RKTlJSSFg0MHExbXVveTlWNWlB?=
 =?utf-8?B?SHpMWmlSQ1hwN216YUhRaGdlWENrTklvUDdsQkU1d3RKaGFxR2xySFhOZHNO?=
 =?utf-8?B?ckFST2ZaODFaR21ySFJ1NTkwelRhTlF4SjZEMGRaM1JQN1c3TW0vZzZ3U1hv?=
 =?utf-8?B?ZFYvSEozK2tVdlIxZTVNSnNxbFF3ekJSazFyN0QybHd2dUt6ZldBYnJFR0gv?=
 =?utf-8?B?cFp1UzRIT0RDc1VxNDhSN3R2bXk0S1NoVnE4SmNXaktuTW5nU2FYdldnaDFG?=
 =?utf-8?B?anhYanpoWVYxTnhzajlnK0xLRFR0WnNvbHVhN3IwMUJ0OW5DMkE4WW1DSUor?=
 =?utf-8?B?UFp5V0VSY2lJSU1SVTViSmhvQjdLK2p0NWJka3NnNHR0emUrUVpIMkdRYVl2?=
 =?utf-8?B?eXVwUTZnSXgvcTJnRCtMYjd4c3U2cEtaQVQ0ZjZKTTVkaEJRWDVzNkhSNHo5?=
 =?utf-8?B?K1BnZnNDNDl1b0lNZHg2eUpBVjloSldwS0YvZStBQlBTV003c3lrckJyVGV0?=
 =?utf-8?B?cGozSmRISW1uQ0FPdVVEOWl6NXowZ1lwRzMva2ZPdnlHMGYwK2FLcFY0WW41?=
 =?utf-8?B?UnVVekdzYXlGQnQzS3c2YkZsd2ptanBJL0xJMjVJekxnakNmdHlqMWVWQytK?=
 =?utf-8?B?V2JyUDRvTXRLaXZzeUlocEJDQ09WUHVIbEhvTlllVWowS2pTazk3bmZZMk9V?=
 =?utf-8?B?MHBrb0tNUlFHSVlqb0cxVUgvNHZPc2ZkSWpXSWwzdmRTeFJhN3JqV0tQdlRY?=
 =?utf-8?B?QUJFMDBhZDlsWDdDR2R1MVR5R1pza3E1NWdySG5YMDNVemZqampYOSt3TDBx?=
 =?utf-8?B?NlpFTW0zVmNYb0tseldwdEljZmhCazZCY2twVlhYa0xrNXZ2Y29WOXlQbkp1?=
 =?utf-8?B?aWNKam1xYjFXNGtqY1pDRWxmNE1Sb0FYOThUbGNob21USHlhaWIrRHpYTFNC?=
 =?utf-8?B?eWs2OWZWMWNjamtpMU5DUk41NWFFcmpyaGhsU2ltWVFOMkFxa0hkdHVHZGt2?=
 =?utf-8?B?MGpQUkd3NFI2NXlWaXBISHpyUTI3bFNDclNyWC9SSXdCbHo0RStrd1BUQ2w0?=
 =?utf-8?B?ZERtbjE2RXBnMlNnbHIrbVdnZ0JlRGdtZ2t4N0VnRzlQME5aOUJKR2hPc0RT?=
 =?utf-8?B?MDZYQ0dkYVBPQzUrK2Z1Zmt0ZVlkcFJHT2l2c3NqOXFEZDlqeGN3cUpZNEpL?=
 =?utf-8?B?YSs4QklXamRpQXBJcURIWmdSdXkxZDVjdW43YlZkNVZMR2ZRbmxzY09yMkVw?=
 =?utf-8?B?MUVmTTlHdlBmdVpGWmVFZ0JUbnQxdUtjVDR0Y2dlTmR4eUZoOTVzbXpaTjhv?=
 =?utf-8?B?VzVEai8xYXcvbmdtWGFLN3FFb05XU2lpU3c3cFJYZmtpTHBud3JBR3BFVEND?=
 =?utf-8?B?d1RXVVNjSWlxUENIc0laMVNyNitGd0tQRkNqSW0wclFtcDNLQ2JDSjdWZ2Ex?=
 =?utf-8?B?bmxIQk5mQUN1VDd0YTNYRnBTdHRocVMyd2NSR3lkYlphNkNXRUljUkt1emJ6?=
 =?utf-8?B?ZU1lc2RVemlXUkVsR2xLTEFJVis2LzNReXhuckJLZTdHRzczMExJWldHbU5H?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jmmxyfHJKzVjpP9zx7FNY5YOclS0+F0H/3pVaw2+xIBtbcJsxUul4x9Y6AGIyVvX6e62Pn3oxj8C7Z137DiOnngSjM7YZ6O2VQ/+fADqjyIe53UTUZUpJ7LHRSLCQYXzvgZXh7cp9dVF4/c4ZBe8wUuySJ/KWqsD146hZ4no7zlbeVwhKa52RbDlWcJRwCysmd9cY2hH8xN2A8W4MuRhq/SYYxkKzenNCvyvcae0v8QTitrnoQLjNP4N5hsW3jJjhXVMqAkxmJVVSp9bKFWJvWlgAvrySJoi/cGCkB84/+4ATv2c8cElGOLDNejI9WGe1zMTNLIUOxxS/ZL/WtN5MZqUGr6d8UOGmhSlQJ7RD7RaBn4VwbMOaeiC06bCfHB1tybMLGtIAXzID3zPjY+DuL/e6LkrFkGYS6DllMXT7ilRqZNpqbDaTL7gvkvBrw4c0eQCiiMuJXh9FDr3uGvgvTv363s8EuTx5jS7S9Om16yOXsmnBM/sxSwgLp2TUuJU07rfZi5dp88KKGsHirAMNrLpM1T/prZmdF/QVtbpC+3F+8GknjWzucOOf+Mni1pLHyFmM0eYFink0EDfYCR0hOKj4IJccot+Z2L40VOqYV6VHGmEYityln3NwhRSaR3wbDWi3yF/OoDJ0XQzhd5D70E5cPYlx1xRAT3KXjD1+WZY+eNF/4uBFz13GfYe0OXEBA8eDG7OMrUFfEnNhMT9Ycw1/j7t1ycWkCeiRL1vwGWBPpmuk2qkPomFtLYLL/9NNyhBoeYiBLxp3z3LXgAt0nF29AT5q7Z0NQbHx+Vprn1yLPL3eVR14cKZ4wrp6Bj3O0eKlYYLAad6S+v7We9PBI9IeuIqSxBxtZPjd+9Tmxf+G3phHhn9eLPGR5lRusjZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc979212-a734-4dec-ffca-08dba3b94a88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 09:14:02.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xN/132fjeDT69cwPqiQEuMIblrwh0Yea+hFWRC4NpAsws+OVLaXUNyqHWHeU/TxonP2rAwUB5nCSCCAb+tsyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6377

On Mon, Aug 07, 2023 at 03:17:18PM +0200, Jan Beulich wrote:
> On 07.08.2023 14:55, Simon Gaiser wrote:
> > Jan Beulich:
> >> On 07.08.2023 11:38, Simon Gaiser wrote:
> >>> It seems some firmwares put dummy entries in the ACPI MADT table for non
> >>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
> >>> 0xff. Linux already has code to handle those cases both in
> >>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
> >>> same check to Xen.
> >>
> >> I'm afraid it doesn't become clear to me what problem you're trying to
> >> solve.
> > 
> > I want Xen to not think there are possible CPUs that actually never can
> > be there.
> 
> Did you try using "maxcpus=" on the command line? If that doesn't work
> well enough (perhaps because of causing undesirable log messages), maybe
> we need some way to say "no CPU hotplug" on the command line.

A Kconfig option to disable CPU hotplug at build time would also be
interesting IMO.

Thanks, Roger.

