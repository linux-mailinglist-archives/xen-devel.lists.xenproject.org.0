Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 005215FD8C1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421931.667651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwxf-0005Z2-5T; Thu, 13 Oct 2022 12:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421931.667651; Thu, 13 Oct 2022 12:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiwxf-0005Vp-2H; Thu, 13 Oct 2022 12:05:15 +0000
Received: by outflank-mailman (input) for mailman id 421931;
 Thu, 13 Oct 2022 12:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/C9=2O=citrix.com=prvs=278604417=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiwxe-0005Vj-7y
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:05:14 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49c140f0-4aef-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 14:05:12 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2022 08:05:10 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB6978.namprd03.prod.outlook.com (2603:10b6:510:168::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 13 Oct
 2022 12:05:08 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 12:05:08 +0000
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
X-Inumbo-ID: 49c140f0-4aef-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665662712;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dcu1VIhrf9Lv6Hmet8N2CMlldpOl5FgUfcZjnzBW3uM=;
  b=YwyszGUEiI1/xdmyudY87t465Tg0XvEEL79pxsOR8v8qw/UlCWNExWP/
   AdmMIn+2ZxZ/3cIUWXDJZVAfEvSiUwL7jek8Z6KAmdlUonRSHAOkDAoKp
   n+0KEaXXG5TGop/df61H88XC4ZmE7TwlRFDAhP4rbN7t3xIPA1Y1XLvph
   8=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 82655870
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AolESeqgAAt597ugVgYaMDpnVX17brhtdkbtou?=
 =?us-ascii?q?6ucsGbSi6mo8ft2uZtPesM2Ph2Ov8aJ/3J7+ZAiuzu2VEYjOOrE3MaLAtYh/?=
 =?us-ascii?q?s/zv5qi/A6NH9G2nGeJcc1Bpjkd4/DhFxS+EX92VwSgaAVWIa6atagD0P57K?=
 =?us-ascii?q?1fj80te1/M5I6rlXP7R6pjZ30k3dC5dd0nihZtSCa4kUPaAwEIbFU8jkNxIw?=
 =?us-ascii?q?BD9me6xJs/SOqMDNGUXxOGqGgnk0stLv3GET14V+yrNInY4AGjZeFScDpS6R?=
 =?us-ascii?q?1dm3JVMiDZmiB0UZepx7cca85e/mAZzGI2/+eDzWgpHhR7utjbxJJ5Z9YlsF?=
 =?us-ascii?q?sXIBdK8S55AJs2McEDMQTeQdluaVx6UHqdPJ3GBBJtmZAg/ktSC67U67CHty?=
 =?us-ascii?q?OOEe3CsYCuLUc1TFbQ+kI78SPO5+4036mSgfhpSmF5j4K6roNehJHQlL5czl?=
 =?us-ascii?q?h34Gr0ir3/qVvvn/r0wqVBncsIjMmR4yXAH+SixeJ3M5qwl+ETFMDw8A1W08?=
 =?us-ascii?q?WEzo5qlyYWsjWvDbkWZcmAzGQh2Ymv7AV/6FiJklnfCvzKbvyLA8cZ07gtmY?=
 =?us-ascii?q?yJ4AZNvpSyfzo+dqTqbkPu6lC7V1cwCL1bQA4tE0VXrfgXBBIlcoukZapaOi?=
 =?us-ascii?q?0xsV1uFnQOEbgJRIkqNijDLASOhtjFazhBmEG4ZgEFDVPiayw2O69sZWa17n?=
 =?us-ascii?q?CqYJNXh3PSjchO4BGJ1UCnfdVNV/Y2mFKnD0pukj+Ar36W7foDRP0K2msRc7?=
 =?us-ascii?q?2J1CT0g3cF64/4qgdRkRYj6XdzzgudKK1SqVN5ZeooNvEM5vjoR7zLRzICC1?=
 =?us-ascii?q?/LM9eL2aeleozN2aB90gHe8QcJAM12lb2CcXS6x6FpuxtfPVebVqtDbPIkg7?=
 =?us-ascii?q?JtO9rPrbQgoTOREBUrl/WXfpb9AU/Lv9eqGyFRwgxhMwHKjSQWVOozcGXXi9?=
 =?us-ascii?q?Rf/U2Fc4Oev3hf4FeLSIBfuMl6bHs8ycEAjMa+GaEVncJi3YumBXvgFrdKm3?=
 =?us-ascii?q?na65hfcR4ESVjNKTVi0GbM7UdPXzq9vyYvgEidnZcNPRmyyYtmf7aSL3GYPd?=
 =?us-ascii?q?LctTNTEAcvHeg6M528RME7CWwm2u8mRs+Sk3VSGJqdwZkNAsv9bYWz9F53kM?=
 =?us-ascii?q?wcMr24F/G+8L3dgVRYQZEw3EfEEYPcEGd4ydQD95u/FiSi4qyZjCEp9eDMwK?=
 =?us-ascii?q?zy3SVB/nxicUUB1s/0ug8ET8FqREzLB3G8a+btCd+S0EO10dKzFJDWUXkJBE?=
 =?us-ascii?q?SlwVw0lkzxCLK9w4WMNlVdnT9Gmmcy5H8ej89DWdPsKbA+If5fKyPD5C6BHC?=
 =?us-ascii?q?sClGP5G8oG/3dVHJI+/wKFnZCT4FNDPWbg2Jjg90Vblf2hZtU2ENYPQlbw4q?=
 =?us-ascii?q?ObZLS1qR5yMS+sixJmv8dLZQ5YZfs9kvNsgjULt6bIz2pCl4ImmW/lCnaMKc?=
 =?us-ascii?q?HLs7Xr05JdoSW3BHxJ2jkO38YX9hDM2xm9cs5u9F6FTk6f3QuSiXWjyv+cSy?=
 =?us-ascii?q?RQZBnYJMItyTscN60Ce8Ph2faN9JSs7ByYaAc49kFkse52C6jnrNDhel5VZn?=
 =?us-ascii?q?4tMkS0M6GLC9OlpPewuk7jl7WnqoA63YW9KVUN03NpFZD7x3lj/6cfqPpqPQ?=
 =?us-ascii?q?ZatEnT/dQyUCG8/ASrp9uWLmiVjARA/ypQfqjxB9FAo7/nPRxsWb54RGowzq?=
 =?us-ascii?q?Y/mmkZjkm49Lw7CG21krEU3YZgHfijpxRvMT4slDLfsmXfS1/dIniebUEjgN?=
 =?us-ascii?q?yodh/3+mzH+XIjaZpFIE9ypwAYXK76YknxJ4C6wvvNzG/XeHm2YNtST1I5Ol?=
 =?us-ascii?q?U4m/r5HueWYwRLj+2IBKXjNSyTz0ltC60eqgBr63zeZaDKRV07g+pRbjfYse?=
 =?us-ascii?q?tSjFTzB4NL0wFqRJ4p9uJDgrgNpkW2kzBKpOjOBALBszhPRkhOhLmwIqL3fW?=
 =?us-ascii?q?k/IpoewdShJx38kxAP6+nGlZrAGXA/hX9DycwOOwtsrN/1EuxnTsO9ADNm7L?=
 =?us-ascii?q?U2fYXZD7njLIC4YdsRtz03hLHFNebqQBEAtDBWKrbYxoocFYtvA9xyD7ZGAu?=
 =?us-ascii?q?/tCIOglPv7bB6nB2H/WgJKpSSa/IIfR++chdXovSKLCg56EjO/AqJq0fim1e?=
 =?us-ascii?q?pgBXA77Ah93jkX1LQRch+ZBYtuELj2XC+/XxdKu50yKM4GBW8W3H5GEfujpy?=
 =?us-ascii?q?sBSRSbwovHhA9ep5aIijf1MJR2IDUjjlVMIb73oJGUB/1KsyU9FrzB5arBQn?=
 =?us-ascii?q?N3hPkvnXcHwyQlfsX0ZJVzbYZjBk5ZfkDz0Pzj5PtERMjJf3YkEAIzc+djRg?=
 =?us-ascii?q?5JdbWuKnxVSv1E+fk6MheWp8y4ItmgQCv66sDE6icqJ17FPDPaVjyISHXsjm?=
 =?us-ascii?q?+p0/0pyR6fJMeD9zVAxCmo6UlE2EWOeqbQ89jNSt7l9KCsi9oiV/7PR2rjor?=
 =?us-ascii?q?MQsI6hX1A31VKVCOKHb1qjvvIat5SwnTox1?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82655870"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F836vKtLiIXOyQ9be0UUiEa2UdfVcKWuA/Uv9L5if5XQEz4T1RfxcNCS4X4n0QK7WvStCwMJ7+j+uRPiokixOTsEGhWiwGMlz9lzyChRRYK1feGg6GL+2F8769bvnRiN8n50loGFEP4nU8rZLX8TbiXTDb03qrpYwPI19feg7OZvUcQIVqzyPhGLT72+t31fckyMWzZaUhPLzyyZ+gF7LycBJGE332cRdKm68sFRRzxHPxs1An/hNjqt+qHujCrlunrMTFJDw/6GvzenXSqz1yrB0C3V4Ov75TvpSosJjfZsm/HlBL40flzFAbgXtwomX+MZNObHT1iDCf2nHRXx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eI1a4d+t/3ANeUKBCLySlGMA/VbFUI2jojanCzs/xv8=;
 b=Cbwqa17vREkRaMfqXafufHIeuiz2AuetX4RdeQKqYCZX45zcvynsphzgl0BFKpJgrTaMRVyuxj71B2B7iuyLtsYjVZ0XMkLHrDsq73NI7C1Th0ws2p8gXGYVH17ke8oh5jJJEI/h3unMle66mD4zkLGkNsChEBUPAuqikbWBclxzTmUkWH5OjVjRtCB1k3sUm2KvP9xs1povC2vRn1Zjl0BGgUWUt2fHUGjv75hUMnnHJemC6dIbXJCv0ZaL7p0jYLt/LxUfcDj5XDImHvKy6gB7FJ6SNtob9jiiUMGUtvg2jaUBYuG3vNfCYpEzKtMNwszIZQ5TjY2YgmEzgKbxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eI1a4d+t/3ANeUKBCLySlGMA/VbFUI2jojanCzs/xv8=;
 b=OPxGyXdHwS5KECBFLybnNXAw5czGyQMxzmPXIAS2fF/LJvN0D15w+yv0hZ7Dfr+cTFr1wd9wzZ4YYzWi00h8UmaGmeDLqLUosz/m8U6VQ5H1cn2JELDfsex5BRKpGHhqtcwiIuxC5cKfCIVgvXatplmeU/DeJCJMH6hQdlwvwXI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 13 Oct 2022 14:05:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 5/5] x86/mwait-idle: make SPR C1 and C1E be independent
Message-ID: <Y0f+7pZWOzGD70Gl@Air-de-Roger>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <3bdae38c-1dd4-558e-64a7-886b9bcf771f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bdae38c-1dd4-558e-64a7-886b9bcf771f@suse.com>
X-ClientProxiedBy: PA7P264CA0003.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: 70cb210b-778f-4284-e1f3-08daad132be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u7o66tmiWaqVIR+kgbO5Jyk5ja6OS2iJpNzVkLOZhcwbossOvXMalejESzm5pxOX+MQe4FQ9FYWgT7+u8En9raCx3OOn3ux8cIx6yuud1oRkCjhIFOajp++8B3OfmT3/ue9yrYrzKNckscevK6rN4QTv13eIoLW0gXFunQHMWZn7yLNHA8bqq6R6910S/JO0PJprU+Nfe84AIKQ8B/ThjqAcCNNrbZ0uckcqV8aeAFr4B/QlhA4C/AyF2ul+gQdEw9og0ul4fRyBAZoudEixwBsLkoHAJVVfJBJa6Qf7+z2dUm47OM9a/bsW2LdnUtvXV2CnlZ8RcD7x/+W7p1iuiIF+lfsr2zzaVzu4mOL5sytRliIUY0uX/lF4ULDCoTa8iyyZOtmQsGPUlvVlrlTyJduJrljX9pE5C6Gs6CNtmt9kyvZbRPqFp4P5ky9lO0nx9WFUkuLWY6MGoSJAk/l67POq9Eca0v6mcWRuHXuDqj/EJV34ocuSz+iGijDtNPOLS9RIgZCwrVXyyzOXaS/ezQO4EbTgamvixjDuUcFg+TkQVmoxk1lmc5b4rl3Ll64o4kajnVZfiOfP8HES8zVzPAAikEuhHRjki8MSJeZ3NwOczaiYfd50QDD0h5Y/nDZ1Bgri/1R93ClrBiTE0CgCcMt/VCvkQGktZwLB/6dEIPuOXuheaGmFKYZnnvJu0v5O9GsSbPWWWhvUl+C4Soe3esxDQtDYiQCREqficocJcojp1f4c5w+Ggk99dWBqekkDNoJZRPfld9zS+bcyfNAqZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(346002)(136003)(366004)(39860400002)(376002)(396003)(451199015)(6666004)(26005)(8936002)(6512007)(6506007)(86362001)(83380400001)(6916009)(316002)(82960400001)(54906003)(2906002)(9686003)(478600001)(33716001)(4326008)(66556008)(5660300002)(8676002)(66476007)(66946007)(38100700002)(6486002)(186003)(41300700001)(85182001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFFhN3FNcFQ0a1QrTG5MdFJCNlRDbG1mWHY3U0lWaHoxeHFlL2QxR2NraUVU?=
 =?utf-8?B?ZmpWazdmdHh3UHZOSUQ1NXcyN1ZHd2JlaG9pcTRVVnl4UThUaS8xRFp0Z3ds?=
 =?utf-8?B?cDJhdlp4ZE1OTENkcFl6dGNtNWtrNm85NS9LZ09PNy9pS2lUdWVwTHNtN1NO?=
 =?utf-8?B?ck9TOEFyQy9YWk1GcGRVOHJKekswcDlYZzBjMEszSSsxaG43THJieU84UERv?=
 =?utf-8?B?MkZqVEhYUy9pRFdkckl5M3N3TTk4dzBoRjlzOHM5T0pYOVZFZzFGVUY1TGRF?=
 =?utf-8?B?QW1wQkRuM0lBYm1KcFl1eWJQT1VXNkZ5M0kvY3pjVVVZZHI0VVlaU0RLSnB0?=
 =?utf-8?B?Tkx2bmFHR2JaQ1QxbmkzaDdjWGR1K0VQOFRpeGZ6b1BEYWJzT0EwMm1hdDRu?=
 =?utf-8?B?UDJGQStXbmJFVUFHVnM3WUpuN1FWVC9lSzVDMTgzRGhMQ1ppd0RMcElOT0lV?=
 =?utf-8?B?dlB5anhveGxXVUJjbTgvcUxCYVVqM3FvR25kTkl3dGZIY0ZSZjFUZHAydlpU?=
 =?utf-8?B?bWpZaU45S2VHMlk2enQvblBJK2hMTW9mNkE3YndXczZ4L0gxTi9zVnZpeVFj?=
 =?utf-8?B?UkZzOC93UktmSXZ6ZEMvbWkxeDBId1Z1YlJWeUZSaDV3dUdrZVFydUVjenZq?=
 =?utf-8?B?NW56Y0lXUStJWUZMMEJCYWZrUW5vVlp3ZXhjZXExYXZBa21GdFNCRUQ3aHJq?=
 =?utf-8?B?U0NCcEppdWl4UEZaT1ZZYUI3dXJ1bkZRWmhiczBUbytINnFlSHpxZ2NzTEts?=
 =?utf-8?B?aXQ4anFITHJnVEpZUGJHTlFVRDVpMFFQQTR3NCtEdzhZSFNZdkh6ekpKUExa?=
 =?utf-8?B?ZHNMd2dGemJRSU12aURwUEpBMkhJK1Azekh1WWFDb0dWTU9Ya3puR3ZlZXRM?=
 =?utf-8?B?TWVId2pPdm5iWG10UHJERXlFZE1HV1FLbXFyNXlzSS9NZGF2bGxrMXJTVERL?=
 =?utf-8?B?YVRldGZkLy9tUThTMW5UcEppVGpjQXhIR0xwWE9UYTN5WHFBeDFBdjhxVlRh?=
 =?utf-8?B?UTVsV1J1Z0NCVmtoZXVXdmQxVTZQd0RESlI0MkZkbnRwZExWMWVDa2pTTk5Y?=
 =?utf-8?B?cjYxRml5NmttVnZzVkRXL28xaVh2enB4emY5WlBBWE5ZZlVrUzNSMGdJblBZ?=
 =?utf-8?B?bWVhaXBLWkRaZGhnbHFvZzJhTGVZZmtkUEhBQTdFS0JlM1MrYzhObWNxNk5a?=
 =?utf-8?B?c2pyUUlsTDllSkg5bG1FS09pbW1GazZVdVU4cDhGYWRESG1pSU9tWGczeDkv?=
 =?utf-8?B?WnhyeXI3SExWZmtRc25DL0xCaDBKVW5oN1NHQ2VFdDZ0RW1ocEM4WHNQcXNw?=
 =?utf-8?B?SUN6RkdXYXJ6V1RwY1JTRnVhaWFEUlZ6dlF4L3NoV25qeVRaNXRic2JCM3Bt?=
 =?utf-8?B?anNlYjZxU2ErUUxTRlF5UzMwbGgvMWhTMWFrZUdVMlMvS0NtUzVzSE5lUjlr?=
 =?utf-8?B?TGFYVDZBOGFGWE5Wd0RzS0x2dTFKNWZVZlFta3pWZXBNc2c1dUNmcjdBTmhF?=
 =?utf-8?B?eDhrVGZSL0hUWm8zczZLRHAvbW9WV3FiSGU0NGh1bm9ZUjZ1LzNPL0M0WlR1?=
 =?utf-8?B?QWJ0SDBBTVFybnpqLzE5b0NaYW53Z05CNHFETU5xMFNMTUlyeDJHTEVVcUl5?=
 =?utf-8?B?THl4ZXFtaE5NUU1JZ0tFV3pJa3paNnlHTjJ6ZmFhTWQza1ZsSk16YU1PVFMr?=
 =?utf-8?B?VjRxZU1GWnkvS1B5MDdqY25FaE1na2FBTUd0TVpwMUtMZmlFaVhGM2RmYzE3?=
 =?utf-8?B?UFJydTZlL1dGczVMaXp4eGJwdzJXVmlTUG4xc3ZHM1VtVndUMDd0SitLenl0?=
 =?utf-8?B?ZVNQcjl0cFZ5WlJkMFJJemttQzBXLzV4aXczaFRiTEFpSW5HY2IreS9EcGFz?=
 =?utf-8?B?OG5nL1dUanJwM28wUnArTnBrRmk2cE10OTNweUkvRUh1bVJmOGNHdjJxKzA4?=
 =?utf-8?B?eUMwS0hsbmI4R21Eazc5bzRhYitYemQ5QnlyMGpwTytmUVFUYnBUSjlIeHNU?=
 =?utf-8?B?ZGhSaTJGVGg0NzIwdXpBQVdEUzNZWlFoU29CbGJpVFBhVVRkem5jS2gybHJH?=
 =?utf-8?B?a1YvODlqeks0c21KU1Z5Wkx6RDVoQXZvdGxMZ2M0SFlramtBNC9aNmN6MVl5?=
 =?utf-8?Q?UXG7H8H1ZrUfiEkO5k92/Vms3?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70cb210b-778f-4284-e1f3-08daad132be0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:05:07.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2saAxIludlvsOeQ6M6X2ko3fKM0dFwxqeY0kGwrIfxkFNw1ZWwWMlMjuxJ7a8rU6GcO/bf0ZNYcm9gtbYt3XCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6978

On Thu, Aug 18, 2022 at 03:05:19PM +0200, Jan Beulich wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> This patch partially reverts the changes made by the following commit:
> 
> da0e58c038e6 intel_idle: add 'preferred_cstates' module argument
> 
> As that commit describes, on early Sapphire Rapids Xeon platforms the C1 and
> C1E states were mutually exclusive, so that users could only have either C1 and
> C6, or C1E and C6.
> 
> However, Intel firmware engineers managed to remove this limitation and make C1
> and C1E to be completely independent, just like on previous Xeon platforms.
> 
> Therefore, this patch:
>  * Removes commentary describing the old, and now non-existing SPR C1E
>    limitation.
>  * Marks SPR C1E as available by default.
>  * Removes the 'preferred_cstates' parameter handling for SPR. Both C1 and
>    C1E will be available regardless of 'preferred_cstates' value.
> 
> We expect that all SPR systems are shipping with new firmware, which includes
> the C1/C1E improvement.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1548fac47a11
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

I guess we need to be careful of running this on pre-production
hardware then?

Thanks, Roger.

