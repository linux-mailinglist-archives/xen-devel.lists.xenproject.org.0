Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833306F0445
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 12:37:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526926.819006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryzT-0006Qb-7x; Thu, 27 Apr 2023 10:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526926.819006; Thu, 27 Apr 2023 10:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pryzT-0006NQ-58; Thu, 27 Apr 2023 10:36:43 +0000
Received: by outflank-mailman (input) for mailman id 526926;
 Thu, 27 Apr 2023 10:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=81si=AS=citrix.com=prvs=47455b11e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pryzQ-0006NF-HT
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 10:36:41 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62598de4-e4e7-11ed-b224-6b7b168915f2;
 Thu, 27 Apr 2023 12:36:37 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2023 06:36:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB5957.namprd03.prod.outlook.com (2603:10b6:208:310::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 10:36:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%4]) with mapi id 15.20.6319.033; Thu, 27 Apr 2023
 10:36:27 +0000
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
X-Inumbo-ID: 62598de4-e4e7-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682591797;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q1tFO+88RrQt7lv6OEG2DKUUXqE+G27coHu+8t2eDmA=;
  b=fIyucOLKYDEfuT602SpjAE0eHbRKqdgpt5njWgKLmRnc17m1delNeJDe
   MFGmVy5GloVaL7hLPg+smRx/mfqQXjBwfU3bR2U1mtQPgZx3XmIQYS4oa
   IKwkieJDztKEC1y9qoXK4ps2Nrjdl6tM20qNvEmVuWxfjRI2He31cGK0d
   A=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 105823590
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gC5bTa20Q/3BqtAdnfbD5eRwkn2cJEfYwER7XKvMYLTBsI5bpzwPn
 zYcDWDXPKvfa2P9eYt3a9jk/UlQsJaGy4RiHQs5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBkOqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfOkN+0
 axfOhs0ZUrAtbO6xaCVZfNCr5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1UZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBdJIT+DprpaGhnWjmzENSxs0FmCn4vqgj27iRv5jG
 xc9r39GQa8asRbDosPGdxS8rXyNuBIGXJxOGuk+5QOK4qHQ5BuVQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAKKUcSaClCShEKi+QPu6k2hxPLC91kSai8i4SsHSmqm
 m/T6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHb1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:+6kV56ja0/0zLGTxIX6vQxBUCnBQXhMji2hC6mlwRA09TyVXrb
 HXoB0+726KtN9xYgBdpTnkAsW9qBznhPlICOUqTNGftUrdyRiVxeJZnPbfKl/balfDH7VmpN
 ddmsFFYbWaZzUa/KOKhDVQeOxQu+VvnprY/Ns2iE0McehtUc4PnmQJaDqzIwlTTAlCBZ02UL
 +d/NcvnUvTRZ0OVLXLOpAaZZm8m+H2
X-Talos-CUID: 9a23:mtp2pm6uDNH5We/GPdssz2wkPpBiYFbkxy2TER60DHRHZ6e7YArF
X-Talos-MUID: =?us-ascii?q?9a23=3AZUaW/w3UztZIbnpXik2dU+jLDjUj0/nzFgMLs9Y?=
 =?us-ascii?q?9p4qHLClQZyqxsATsa9py?=
X-IronPort-AV: E=Sophos;i="5.99,230,1677560400"; 
   d="scan'208";a="105823590"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlOZu7Z5kQ000+YzhT+aywnpb5eJ59UruwG7gk8tPde2c0Htx2oV+RwFC0glTlU/sFxx3NLPy+2/f6nKWIlwyQXmcqnoEaRa7mKRzPMPwwKsf02byNH0CfKa8SgJrdIyu7Cv+PUiXNM3P71gZFl1cl00n1yRh3tszNIW3AdcWsXDkIe7ZSvKLopgWT19Sg6MY/GPjSNapr2cfVefADyl2imv63/RrUOrFYyAnzjbjFmgOUuaowVtGALpMHBs6iAOGM5JFLeJQTmD99EdhHzzQ9MAeS9nt913fh0gdEKUveRSLXJJsj6/SZ6k4F6gxw5eqBPabJS743mmgRZyNLLYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iNQPhyiP0Ij1u2HvRwvPqHUNERwQ0Zytpd+yZyPP5s=;
 b=CUpK8kC6b6MJjoXCKzc/m0gYQ/jT4esg6CKXXEyl1Ot+vWK+kRYhG0Fhyo5prL7Bl3IT/GmEtQs2qurtdPUfOsmejTzl9GwIJjD4dI1aMmiYCGDkrEIk2kXxD/tzmUsWXcVwldAQAr78abOeFPXG9lfDzQ84Um7LwtKX1XYLJi3VxH1SwJgjLGX1CPL6HKDeZPI4oWZinAlEJ3QCc/Z45lVPjiog73T/8XIDxKVe+NzpnqFAUHhV7/f7HSHCag6eBdgJ2iSReYeQcUGgpVVZApTN1vMaKAY/osdQR2MsemgLQxixPpm3QvmagiDLNsQ3qLHuHGPHuvQnj/cWcVTfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iNQPhyiP0Ij1u2HvRwvPqHUNERwQ0Zytpd+yZyPP5s=;
 b=CsoZLmlTV7x9/QGpmY6f6TlLcEg9Hp1iIv04gRsSDiRHYA4oteqn11p99fzUGSuyJ7cRCBXNXOOZLpAPFARwBL5eNy+/aXTCi0I//KPIvUn5ewqYCm9Cq1wKptA16bU2dF8X1Ba8wse74yADPMdIK6FAgl6k6LoUKRc3WGeT+eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d66185a7-fb45-3e08-7414-e168c8ee96f6@citrix.com>
Date: Thu, 27 Apr 2023 11:36:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/7] tools: Refactor the console/io.c to avoid using
 xc_domain_getinfo()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230426145932.3340-1-alejandro.vallejo@cloud.com>
 <20230426145932.3340-4-alejandro.vallejo@cloud.com>
In-Reply-To: <20230426145932.3340-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c829a5f-ecf4-4b79-02b9-08db470b418c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q++Jc5UOk4HCP+IveO+xKojP0Sjf5QHWNKsC8VkcvQ6mwLTKeI6QphFD8zDUL7ujA50aXuWb/J85s7oQzPazeYPNEMlie6FdIYL6rq/oxhGpq8A7yIyr21ZdXC4PkbtJL4Axk8tc/hy4jgM7lgxRCZjkqSS8Xd65u0J21lwPGOOuHbEPjdOQFiOTToaqldhhAy7AsGsS7V7/6pwi0YM82RM8d9GOoEKWq+v4YGUNNc2v38ukAEXu56179riQ8XgamXadRtl1TfjSQ2wJLEcQnXkDOOyljlr0uMeG4udJGsDVbgfQ6sdaQBDK0MTu3nZthdlnDrX6bOrts+jf4+NK+/Qk26/KTrMVksDmtgxZH5Eroe4Hqrp/S5zuoJCsHIl7QwQSix0pNXS2oOooCrRV+rhCOmi827kUhyHhT4YgVlSRIBJjHcMLHnGQN2JIi9Y/yCI8DlDMPBYNxqPudsSwHjLa3iTOwHyk2aBEdRDKW5H/oc9PH2UiU73UODDXhce8XG9ptq2sCu8+WuacLxxqAQPM1CLHmubO9BHePbeIYWC9CPHuL4Wjohw1Hf15hkpi8h1WSGqeFJQNrOZUxTcMoFs5N9VXy+m0uP8ydCg3J/8xhvm2c/I1zr2leFpCzYlg2perUElNbyO0PNHFyzPStg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199021)(41300700001)(2616005)(26005)(6512007)(53546011)(6506007)(5660300002)(82960400001)(8936002)(8676002)(83380400001)(31686004)(2906002)(38100700002)(4326008)(316002)(66476007)(66556008)(66946007)(36756003)(31696002)(478600001)(86362001)(186003)(110136005)(107886003)(54906003)(6666004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJLM0pkYk5PK0RBT0tVdUxuT0lFT0FCY0E3anpuY0NIczRVV0NCbVlZSTlv?=
 =?utf-8?B?RWt6SURML3F6Z0x0cndKWTZuZG9pL0JRQzV5WkhZVG4wc1YrWHE3czhaWmpH?=
 =?utf-8?B?NkRvOGYyaFJFSFo4T2d5R3VqQ2RwRERGV2h3ZUlwOEdqa1JDTG5NR29PcnZs?=
 =?utf-8?B?U1RmM1Z0UmdKVEFwM09ZNUxUL1BSNXN2OXVlK1F2NWJUQ3hDUHUvZytPeHUy?=
 =?utf-8?B?bWtQTytTbVQ2MmhVTjJuQ09WWFhVVlo1Q3BTMmhvTkFVSG4zNncxcysvVXJu?=
 =?utf-8?B?b2dGUnJmU1hTSDR5MW9RWTY1ak9pRURzWXByNXdXNnYrQ0d5UUE0em16ZG5D?=
 =?utf-8?B?ZHFZc1Z2alBBNzZuRzZqVjhHbFFYQlpRK1UxeGx0ZllTM1RueWJoOTZ5aFZE?=
 =?utf-8?B?cGxFbWhZZFFqUG0zMURrZkttY1JpRWd0RC9FczFhTm5aeGxwTlBkaEkrb3o3?=
 =?utf-8?B?aEFTRnVXV1MvdDZUWk51QjFmaGUvQWlvWWk1cHdYbkhtZExBTXpZYUJ6RHdQ?=
 =?utf-8?B?eXZ3L2I2RnlDYXZjUUxsVUJGWllzVi8rMytkRUpmbVdTRk9GcEtnUEwvRlBw?=
 =?utf-8?B?bm94ODZCRnl1YVhKYVJ2OXJCcis2alJUR0xBTUcxbGI1aVVDcmJ6SUlXbFc1?=
 =?utf-8?B?YWpGeTU1b1Q4SkV2K0l2V0praGFHaUtydEd5Z1AvYSt1c1B4c0F6MTFjc0Zm?=
 =?utf-8?B?TUR4a2xEcFNjSEFVRVNMVFp0UC9tWTlQK3Z3Qy80dkhnMEc1OEtsb0VxeEcy?=
 =?utf-8?B?UXQ0MDFkRDkyNy9rbjY5SXZBOTA4d3dUbUxBbXJ6UzEvejh2dHozVDBOYVhj?=
 =?utf-8?B?VmJpL1puQXpwVXFZR3pMb1BQS01Hd1h2WFZjdy9yRGxYMCs5cWVnM0RZeHNl?=
 =?utf-8?B?Y1o1VDJGRjFXU0NDTXprL1loYzk3MDRNaXZXWkI2dmNNdnMxbENUZVg3emk5?=
 =?utf-8?B?TmN5cVlVS2d2V1pETk8rYjlwOEZldXBnU0dBR1plTy9naTJkRUdXVUI5cW9Y?=
 =?utf-8?B?M3ZxYTB0LzkrbXFUZklWQnhmSkkrdVNORnhRZURhYmo4SXhVOUxpZTFhWW5Q?=
 =?utf-8?B?QSt6c0psc1BxUTRYMFhvbk1SMEhxTGFNOE1nWUJkcStDaGFidCtUdlVQeEdh?=
 =?utf-8?B?bzRFUTkxV3ZncjNlZEI5citFOWxZejdUUlVnOVJnQ1Z6WjFGZFJubXJlT3B3?=
 =?utf-8?B?STFvaUtVRjBQdzV1YXlIeFNsS2RPUGRFckU2SldaQ3NqK1hJUlhFcFdHTStJ?=
 =?utf-8?B?WTVBeXI1QUV3UUN0SUJ3U0l0WjYyR2h6ZXNuelFKR2huWndtM0pyb3JYZnA1?=
 =?utf-8?B?eldiRG5ETmpDSXFDSGZheXRoeVRzTU82OEk4Sk5ydzB6b0p5alZqYlRDZ2RB?=
 =?utf-8?B?SC8vYTZQYjRHU0xnTkpqazlGTGNrb0tJU0F2WVVDN2dVWllVbGs2VUFsZ05s?=
 =?utf-8?B?Sm5CcGF4WnltM2dZOWJCcDBxY2JMcGtLQmR4NXo4VVYxRjJHa2Jvc3FFTXJU?=
 =?utf-8?B?R0NYK1pqMDYyL3BMUnFWMkFxS2xYcy92TUxaSGdXdGwzVUFWSklFNGt1RXJO?=
 =?utf-8?B?eWNBd1hxSmtaSGluYVg0KzBSd3o0eVptN21QRWI1QVJLNDdOV1pLcjBqM01v?=
 =?utf-8?B?ZXJpRmNFUjd6VDJLY0JCdFFKakNuMmliS0hNKzJDZFZlN1VENjhaV3ZuYzdY?=
 =?utf-8?B?VVBqY0t3ZDZKK2YvYTBLbmZSOWIxWmVEazlTZG9UbnozYThacDVJWWVmdFVV?=
 =?utf-8?B?ODJPcEZRUTBCaXJLU3RTQmNYN3I3cHhBb2liK2dEM01xZTZkZXptY3F6SFhC?=
 =?utf-8?B?Y2hVM1VtQTIyQWtLVTBwV2xTamR2RDY0VE9RcEtaeE5Na1Rja1JXZGh2QWJi?=
 =?utf-8?B?cWFpNFpZUVF2L1RodkpxSDRwdS90M3NwVXJhTlF0eTZxNjJCYk5mUFBQSjI3?=
 =?utf-8?B?TW1FVXhsMTl1NXpiZjJEeXFGY3JUMjJJZG9ITkN2Z2hkQmhEaG5oWmZwZER4?=
 =?utf-8?B?cm9UVjBXa1ZmcjJZT0xPdG9HSThhOU5oRUdheCtzMnFQOCtEOHMyWDNYek0v?=
 =?utf-8?B?WGpmZlo1Q2RTdDJMMWFiaTNMTHV4SFdxVUYvNEZCRXo0NDdST3d6bFhSMS81?=
 =?utf-8?B?K3JwbXlwSWJCKzJCR01oeFB1a0RBcGJ0ZnlwSUxOc3BJWHY5MEh4S2JUdS9a?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zvE0Aofo23qM2DERGzlQKU2X1w4l2LNsIuy0PD2O+rEOCe9C3tmeEqu//s+TMcVXPt8jCnOf6x0+y7ZSb7d28T/9CGe4BOvwUjYL4Irrk7yQWU4E3tnckTZbgOGJeB7EtLISmd1GGwv+K/wJdkuBsQzyLgm/5PFnKvgbCqy+BSy0ZCuNcyfaXD+vw+3tnvFtUXRTH+RqmI3PA6x89b4/TwZ2ugd/hA3mRBVmYDVgD7UJB1jFVeFa9YoymVZTWZ0uLvnC3KEQ4nj0rqB8YJRGed8I2YKouN3wmXU545MDXAsqLiKBAOQNiyspJWd7CCsc4a9SEclGCMIZoSf1MJXprOqrzootvZPAt1Jt3aYjrac66JxfU1ygSP1rRLn87mCYzDYGeRSeY+hYGl74T6rxfGyw9pH1Vs5+pOMPWHRv8jBI1eEAWZcpQ4UzXyfOETAc2nvr2Atkx3c/834jvAGtMpiYdq4BqGAo7zy2nuzvRifGPDgUEQPJzBTXs1pKA8dCeLpf0GdiqhLwZdAa1K2g6Pyj0cRT3EN8eVe650nnz/n5Sd5dNdnC9nPQPctseCIISLnTcyWyV9ySaSEeTfrGPLPfmk9hyxInPC9Jz3/bCSppAT+wy4mnPRSZoVq0hfq+GUOVPL7G8UMouAR47FZtTNiSRSQRANNqKnZ+6FdkKsUSdcXhOwzLnIQSvWdBVX9CjtCOI0tR2edwyJNloMkerQrLOwRz66LLB/U02HgLBIi+4r5PceBdVm2NXO1YbGPmKiInmJ/ahOxeYB/X1IJ9TdpGtmtHzJ8+C+sJ/sTWvM+IvvzUY0IRkyq46TYQow9BT5XNj5+LRZcyWISYU7dzsw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c829a5f-ecf4-4b79-02b9-08db470b418c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 10:36:27.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iu4ZZr88zfC37LhJZPkb+Z42fSTW1QWs77KNOcdX56D152HcQpGV77NmfAkshKYyZNXSzqVkq1HZN5VLekZEKLbW/oMeI8PdgHtdo+4oroc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5957

On 26/04/2023 3:59 pm, Alejandro Vallejo wrote:
> It has 2 avoidable occurences
>
> * Check whether a domain is valid, which can be done faster with
>     xc_domain_getinfo_single()
> * Domain discovery, which can be done much faster with the sysctl
>     interface through xc_domain_getinfolist().
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/console/daemon/io.c | 31 +++++++++++++++++--------------
>  1 file changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
> index 6bfe96715b..1fc56f6643 100644
> --- a/tools/console/daemon/io.c
> +++ b/tools/console/daemon/io.c
> @@ -405,13 +405,7 @@ static void buffer_advance(struct buffer *buffer, size_t len)
>  
>  static bool domain_is_valid(int domid)
>  {
> -	bool ret;
> -	xc_dominfo_t info;
> -
> -	ret = (xc_domain_getinfo(xc, domid, 1, &info) == 1 &&
> -	       info.domid == domid);
> -		
> -	return ret;
> +	return xc_domain_getinfo_single(xc, domid, NULL) == 0;
>  }
>  
>  static int create_hv_log(void)
> @@ -959,26 +953,35 @@ static void shutdown_domain(struct domain *d)
>  
>  static unsigned enum_pass = 0;
>  
> +/**
> + * Memory set aside to query the state of every
> + * domain in the hypervisor in a single hypercall.
> + */
> +static xc_domaininfo_t domaininfo[DOMID_FIRST_RESERVED - 1];
> +

We prefer to reduce scope where possible, and in this case it's fine to
have this declared inside enum_domains().  Preferred style for that
would be:

static void enum_domains(void)
{
    /**
     * Memory set aside to query the state of every
     * domain in the hypervisor in a single hypercall.
     */
    static xc_domaininfo_t domaininfo[DOMID_FIRST_RESERVED - 1];

    int ret;
    struct domain *dom;


i.e. one blank line between the static and local variable declarations.

>  static void enum_domains(void)
>  {
> -	int domid = 1;
> -	xc_dominfo_t dominfo;
> +	int ret;
>  	struct domain *dom;
>  
>  	enum_pass++;
>  
> -	while (xc_domain_getinfo(xc, domid, 1, &dominfo) == 1) {
> -		dom = lookup_domain(dominfo.domid);
> -		if (dominfo.dying) {
> +	/* Fetch info on every valid domain except for dom0 */
> +	ret = xc_domain_getinfolist(xc, 1, DOMID_FIRST_RESERVED - 1, domaininfo);

This is a correct translation of the prior logic.

But it does highlight that xenconsoled currently depends on running in
dom0.  I bet this is going to be fun bug for someone down the line...

Also, while going for 32k entries is absolutely the right thing to do,
the entire buffer will be bounced twice to make it hypercall safe. 
Bordering on 4M of data, I think this is quickly going to become a
second improvement to work on.

~Andrew

