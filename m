Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465144A8241
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 11:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264601.457747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZHh-000502-8L; Thu, 03 Feb 2022 10:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264601.457747; Thu, 03 Feb 2022 10:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFZHh-0004yC-3H; Thu, 03 Feb 2022 10:24:13 +0000
Received: by outflank-mailman (input) for mailman id 264601;
 Thu, 03 Feb 2022 10:24:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mjBt=SS=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nFZHf-0004y6-GJ
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 10:24:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bcff17d-84db-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 11:24:09 +0100 (CET)
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
X-Inumbo-ID: 6bcff17d-84db-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643883849;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=QmALk/GizQHxgvnu2jsjRSos8WZI1VkYqyAk9VbelnY=;
  b=eEy5yPvpl9J5qnz+XIVx22XEYnZm+qIdbi4kjtam7UQj8fXpMAuvPotX
   J3RXGMaJt9UI5qLQLLsTGx6grjsnGRf66Fcv29HLmsNc5RFmPL0uuBoje
   A3UwbXT8phZkTR2wGncNbrIb2AfJk+opdsUMxA6jdIvf1BpcH4zTEUKcj
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SySO0xn3Xnu8hcIaDr2Ic8XOnXMOVIbAWQ3qAzx1am13FuFKgPZfc+ixvrZ57C1oLQ8eCIp5+b
 Synfk3zGBagOVyZezOhfpvURHluLoVX9FkeQds23AlfT63H6nstmFioILQGg9sbmFl0MSoMHmz
 ef5/h+HXhTbdHehbfdFApXpnCJosbL8AxP82flvQOuo5F0mmT6f/wTEVJ9eRhL6olVs6El1JYa
 A4Fy53rmXUFzKxUBTWmVM81w7RMDfRuPjeLyPYxGC7GqjwJlckGGsDBV+5e6gNRYLjwY1yiB4H
 ty/jYFBvQ7eTeYWmvV6UuO5G
X-SBRS: 5.2
X-MesageID: 62860555
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/t4S2q2Q/VlUaZMhFvbD5W12kn2cJEfYwER7XKvMYLTBsI5bp2dTn
 TAfXTrVPqmJNGHzLd1wbo21oBsDvZbdyNFmGlFppC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5w7Vh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhpIB97
 NFRrZ6JdF1zH63FwcoSYjZROnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6Diu4UIgm9t250m8fD2P
 5A7TANLdR35QTZQZlkFU5FixOyKiSyqG9FfgA3M/vdmi4TJ9yRt2b3kK/LJediHQ8pEk0Ler
 WXDl0zhGhAAP9WbwDCY2nitmuPCky79VI8IUra/85ZCiVyIz20XATUcVEe3rPe0jEKzQZRUL
 El80jInsKwa5EGtCN7nUHWQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsFFVfpYO5+cdq00yJHo0L/LOJYsPdImH85
 zSWtCoHuu9JrM4Cjou0zH/Oqmf5znTWdTId6gLSV2Ojywp2Yo+5eoClgWTmAeZ8wJWxFQfY4
 iVd8ySKxKVXVMzWynTRKAkYNOzxv5643CvgbUmD9nXL3xCk4DadcI9Z+1mSz285Y59fKVcFj
 KI+0D69BaO/3lP3NcebgKrrUqzGKJQM8/y/DZg4ifIVOvBMmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbtGgeR2mH1vnjyILXwe8/hB+eDFDJJyYexdWGZik8hjtP/UyOkr2
 4o32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQMHtNv1jFOQTl7Y9eImOtJU9U8w8x9y7mUl
 lngBB4w4Aev1BXvdFTRAlg+OeyHYHqKhS9hVcDaFQz2iyFLjEfGxPp3SqbbipF8pbE6kK4pE
 6JYEyhCa9wWIgn6F/0mRcCVhKRpdQixhBLIOCygYTMleIVnSRCP8djhFjYDPgFXZsZuncdh8
 bCmyC3BRp8PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWTqsqqWvb
 OlY1d/mN/gDkAoYuoZwCe8zn6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbvA
 xCB4NhXP7mNKfjJKl9JKVp3dPmH2NEVhiLWsaY/LnLl6XIl57GAS0hTYUWB0XQPMLtvPYo56
 u49o8pKuRengx8nP9va3CBZ82OAci4JX6k978xIBYbqjkwgy01YYIyaASjzucndZ9JJO0gsA
 zmVmKud2OgMmhucKyI+RSrXwO5QpZUSoxQbnlYNKmOAlsfBmvJqjgZa9i46T1gNwxhKuw6p1
 rOH66GhyX2ywgpV
IronPort-HdrOrdr: A9a23:UgCF5KEiF8xQVFqQpLqFcpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYJNu/xKDwOeOApP+tfKH
 LKjfA32QZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.88,339,1635220800"; 
   d="scan'208";a="62860555"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYAQa/VHkR9SbhHtXOJqPP3Q+IbaVs/R+/Bp/N0XAa5RnNAIG69mBn3q7828zDlFbdyEOnMzlSWidL+jMTPV4y9i4mt5dHpPUc1ZPlQeYctp/9SFj1Oc0aMJ1Mg+b+JV7obPrYb7A02g1tWtoj1oryBz/j/o+XiegutZZf3GbY127ELPcQ2Gt6JMkSQrAFNufuuohMOhofYvn7FnjM1u4j08BmlQTgYmXXqOPMK5QBK8rVrk2e6X51BebKvD31QFMPFpfXWTk+/Jqd60v+cSs6OBkU0cUVkySYFCk/vehbfnyrD0LsHbuUbB9vjkEoTSTAnfdQ52WHHNmKjldlk13w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzP9lXHShiSL2H6N8/+SSVhd7ck4bHF0hXzEA+fyXck=;
 b=AlTlKWcf9k5LpX+Ge56N6FPWDgk71+cwysLhOVbG8Hanl3jwzRCBLu1ZmQhD7svq+DWMvfmZpeChBfs/88ekMX65bzD70VPx6os2TsphU7zO1OTOUGn5PilaZEN96oBnZLrk04LcuBffPqkOlOUGhh33zI4KpRewGoTmZWC4/mCrxJijfXVkugis1njZvZ3f1TLgw741LWjSdsoDAYcptES3lejLfkpjAWHoU95JXZtNFkRv7TzYbZra7m1lrUj61nGavzuKVKXX3QjEOGIjjjMB5Misgs/AoCmEAKjqlR9gFHWV9QVszDSrwKyWl6CfqaPF8vOFuQIAkzCHRlcYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzP9lXHShiSL2H6N8/+SSVhd7ck4bHF0hXzEA+fyXck=;
 b=VVDuhnTcrPCZASokCZseKVqfURT4Q5nxPp8fROx37BhLx3OwfcW/6ICJR37p3CgCNLzzmu4BCZPMge8iH23QsrUcb7m7Jr2/zyGttOeEdaV+2cg4Z7WVYg97m/HhQKs5e+A4/mL1kmuZoKRM1jl66iBcsfmGdHkJyb/2hSagjfQ=
Date: Thu, 3 Feb 2022 11:23:51 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alexandru Isaila <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 1/2] IOMMU/x86: disallow device assignment to PoD
 guests
Message-ID: <YfutNyLR6CtMHkiv@Air-de-Roger>
References: <6fe7b036-2bdb-b391-4e6c-1b5d7e05a119@suse.com>
 <b0a77526-17f2-a5ab-6f7f-1b3caeb4a59b@suse.com>
 <YfqtlZMAKd/HXsgf@Air-de-Roger>
 <2cd051c8-dac0-998c-cced-401c504ad439@suse.com>
 <Yfuahx0ntHJ2BQ6x@Air-de-Roger>
 <7c315902-e618-bba6-054d-86b0aa685370@suse.com>
 <Yful4oPqwzw3lsjp@Air-de-Roger>
 <6e835c3a-c22a-dd6b-b6f8-e6c22404b814@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e835c3a-c22a-dd6b-b6f8-e6c22404b814@suse.com>
X-ClientProxiedBy: LO3P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18daacc3-8ca7-4bb8-a376-08d9e6ff498f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4047:EE_
X-Microsoft-Antispam-PRVS: <SN6PR03MB404790FD9BE2674A34F77B068F289@SN6PR03MB4047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jX/z2soiybTrGCGKZ2KGc8MByYQmUZg93IeCGFb8UsUHJoay6w/DV245EB91Ic7mdtsAFxK4p+J3ESlehrKc8gUtL0+z8/bbynfTZJ4QUR5xINDPKPXUVJAxHWkUzPGOgH/CDF6Ay9bgvdKRHhSYxmnQ2zMqoWn7E1Su959ooRjUY6zbIsBchg+J1sh/d5c0ZZfqndZ22HAMGof9/mx1E9sjkQehLd2S9Xeh95fID6eD+ksd5cEVzX3PcKexzmFEqxH/JLKZNut0wAXoN5//Xgbq4XBqzORJ+Bp9oiVeBBWW9GfK2v46SKW5pXufQJtToRRAWbtuNSJFwp0I7NCtGI9tyxKXgm+vTFtpLjiMemfZAeyg3r/oOHKYLBJ4M2G1l4CLArfl6LznyBSV88coj9Y14M6BYoBHcMQGinNCDenU2na0HRhTAzHTX32oEu73MCHhFlfUebhvreRdy0DuchNfyD5Cmhq5Vh35Ogvdfcc+G2Pb+rYoHHd1WIur/lUSgNSDLCt1IHhDEhw0sNY4AYxq0RoWfrlO45ouht6kpZhUcnO0A/ppigEtaLeOQTgCKVcO2gEW0swxsNiSXuCwIssKghZ73n360tS/5Y+knmtVOil0gPHdJp+AgBP7H0pVJcYSFm2wd8Ng3q7XWByB3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66946007)(38100700002)(53546011)(6506007)(86362001)(6916009)(5660300002)(316002)(508600001)(66556008)(6666004)(8936002)(54906003)(85182001)(6486002)(4326008)(66476007)(8676002)(9686003)(6512007)(2906002)(33716001)(186003)(26005)(83380400001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnNrQVNQSFhPZDY5RDBtZlZ6OTRXL0RsTmdXSGZ3V3VWVHN2RVp5U0dncGpD?=
 =?utf-8?B?ZDZhYm5Eay9IMXhFSFFFSEVUZkdPSlRDeHlPOWNnOTFjU2ZLR3J2Zi9XR0ZQ?=
 =?utf-8?B?dWl1YmZmT1ZWRktIQndHMy9TTEV6MlAvSUV2V3VaaStPZUp1RE9JaG9VMWFZ?=
 =?utf-8?B?dWxrdUwyK2lwOVFISStBVEVydTdWWkZ1cHpCQ3JCU3NhUFl1aUFma3ZSbkpz?=
 =?utf-8?B?THZIbzk5b1JoRWtER2FpN0RCS2dWSWNFRGdhSlZ5NlBMcG8vMGtCc3RDd295?=
 =?utf-8?B?WFkxN3NqNHZiMzd2KzFhVzhUNCtjdm1kMHU0VHl4SDZqTW9FSWR2eGRxdkxh?=
 =?utf-8?B?bXBqMmxCSnJUcGhROElRUm1OYXVMall0eUJtSjljdTJ4bmgxZ3RBeHpaU3M1?=
 =?utf-8?B?NHBtM0s5elpGbUFCd1k2TTFlSytnck5rVjd1ZlJPZ053NUZMYlhIWmxnUXYy?=
 =?utf-8?B?bmNobzVYaTVia3V6RTczVm5uanA3WmpjcVJXRnlIV0c4ZnlhaVR2N3lVVjZm?=
 =?utf-8?B?dGVzSkI4cjRGb245WlUwTHBROWRXUkQrZUFJeFgvNGo1NS9KRi9va21HUkts?=
 =?utf-8?B?Mm92N21GWmlQTzloRktqZ0hYdFMyMk9oVWRxdjE0eGNiMllyR3RsSkhjNnUw?=
 =?utf-8?B?aThaM1FyWkZXNlVjeW8yN0h2WVJvdHhEa1pkT0Z4TnpzbmRncGlpNjFtaUJm?=
 =?utf-8?B?N09qdFFkWUhTZmt0M1UxbmNsaDVUZUlHQmk0NkN1N3VhQzZKWTYxQmpES2lT?=
 =?utf-8?B?Y2hKYmVYN2oyRit3NDdXTmJtYlVoRTZCYklmS25HZlVaRWRQYlVKUmRxc2FV?=
 =?utf-8?B?NTdlWDQzTTYranVyVjR3Yk5NMUQxNldoaEJyRi9neno4Z3R1QkJOdDg1Q1Za?=
 =?utf-8?B?YjczWTJEVUc5dVpXdlJ2Z2ZvZ0toSkEyZTI1U05xVGpWdi9LUGptYWF6aXFF?=
 =?utf-8?B?KzVXSm1NWGtaS2dnRWVGNFFZelZoMjlWTGk1aGFiR0NHRkFKei9zWFRlYVJN?=
 =?utf-8?B?UVhFUVJ3WUZIU252c1haTTFaQVQ2VEkwNjhLeWtrNmt1Y1pGRHU3V0RvQ0RZ?=
 =?utf-8?B?bURST1dBWmEwSHVVSit3QXVvdCtDb2FiTEFPa2gwb0Q4YkdORGZTQk9CUHRS?=
 =?utf-8?B?NnpCeTMrR2l1Q3grajh4aDVwakFLUGwrUWxJZEEwRWE5RjJxU0RYK1ZWbXRW?=
 =?utf-8?B?OU9oeWZkQnJPa2dYUEF2bVhTZHYrUU5CUnhXK0VlM3h4dUd5M0pHYU4zZ3Zh?=
 =?utf-8?B?bjBMTWFNN2djRW5sRkhVZUZLQzFKcXl4U25ybGVHKzh1YW8vTEZwTzMvU29O?=
 =?utf-8?B?eGlBR3VsRzhLT2VURWhUNEw1U0Y5WGtFNlp6S3F4SnIyak05VjBvVVVDNSsx?=
 =?utf-8?B?K09ka1U4WkFDTTkvY1FtMG1YSjVUZ3h0WU5vWHlDM0xpdFNUL28yS1RzVFYx?=
 =?utf-8?B?L2s5V1dpazk2SSsyMFZQQ0dMZmFpN2YwcGRjc0ZsWXkvdVpWenZHc3U2aVZo?=
 =?utf-8?B?Wjh3cnFJTmRlZ2s1VUxaeDR6VDJMZG1aclJ5T1ZnL3NVUW4zVFl0VTM4Q3FZ?=
 =?utf-8?B?bm9TRXlRN3JtcEpkb05XVnhCbkFPZDJ0RE0zT0xibnVrSHJSV3Y2NEpjTnFJ?=
 =?utf-8?B?OUY0enVoQlNnMlhJUDdWbUxjQnhoNUIwUjliNTc0dHc2WGp1UXVOaVhMVXFE?=
 =?utf-8?B?dEJRSkwxV0NzRW5mK2FrdU9CaGxaL0xXclZ4eUI2SlprMTNNV0h4WmN6bUV2?=
 =?utf-8?B?eFR6MmttNXU3K3h0RWdmV0g1RXk4NHB2UFozandYanNCQTd1TWhzbStqR29J?=
 =?utf-8?B?NXg3Y0FsOXJHakFZaDJEU2JML1Q2THNVMUJZYUJTS2xHNnlUNUt3S1AwZmRq?=
 =?utf-8?B?c1E4ZDgxQWNLTGIwL1FWT2Q2UkM1TkxTRnFxNWhxMDhIT3JjNkFXWmV1SGxq?=
 =?utf-8?B?c1lUTVE2ZXA1STdnd21NMWRuT3VMcWxUeDVjTjNtcmNzakp4cHBoMzY0bjlx?=
 =?utf-8?B?WFhvdjdTUW40M3RwU1piYjJUeVZaUHhERi8yaExuVnJUR0VpeXNYMUVDMnRS?=
 =?utf-8?B?VUJ2MWtoU3d2OHdpTmRCTXFDQ0RXN3ZTeXpTRDNmSEZ2U094S3JqR2lRK3Ir?=
 =?utf-8?B?enJDbE5uM05jeGNGci8wY0xydWdyL1ZTTmp3dURORjRhMWhVYkFQNXZhYmlG?=
 =?utf-8?Q?qtE9/iKjRzdvdugPk66sSMc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18daacc3-8ca7-4bb8-a376-08d9e6ff498f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 10:23:57.7022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9+FBTS6j+wjF1mNC43UBj9gfCB0RoF0u5gVzc0QRyE4n/fWv9bhN7T9ya1eH4oE95ALlnlA3Jfeo++k/McE6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4047
X-OriginatorOrg: citrix.com

On Thu, Feb 03, 2022 at 11:20:15AM +0100, Jan Beulich wrote:
> On 03.02.2022 10:52, Roger Pau Monné wrote:
> > On Thu, Feb 03, 2022 at 10:21:54AM +0100, Jan Beulich wrote:
> >> On 03.02.2022 10:04, Roger Pau Monné wrote:
> >>> On Thu, Feb 03, 2022 at 09:31:03AM +0100, Jan Beulich wrote:
> >>>> On 02.02.2022 17:13, Roger Pau Monné wrote:
> >>>>> On Tue, Jan 04, 2022 at 10:41:32AM +0100, Jan Beulich wrote:
> >>>>>> @@ -359,7 +360,10 @@ p2m_pod_set_mem_target(struct domain *d,
> >>>>>>  
> >>>>>>      ASSERT( pod_target >= p2m->pod.count );
> >>>>>>  
> >>>>>> -    ret = p2m_pod_set_cache_target(p2m, pod_target, 1/*preemptible*/);
> >>>>>> +    if ( has_arch_pdevs(d) || cache_flush_permitted(d) )
> >>>>>
> >>>>> Is it possible to have cache flush allowed without any PCI device
> >>>>> assigned? AFAICT the iomem/ioport_caps would only get setup when there
> >>>>> are device passed through?
> >>>>
> >>>> One can assign MMIO or ports to a guest the raw way. That's not
> >>>> secure, but functionally explicitly permitted.
> >>>>
> >>>>> TBH I would be fine if we just say that PoD cannot be used in
> >>>>> conjunction with an IOMMU, and just check for is_iommu_enable(d) here.
> >>>>>
> >>>>> I understand it's technically possible for PoD to be used together
> >>>>> with a domain that will later get a device passed through once PoD is
> >>>>> no longer in use, but I doubt there's much value in supporting that
> >>>>> use case, and I fear we might be introducing corner cases that could
> >>>>> create issues in the future. Overall I think it would be safer to just
> >>>>> disable PoD in conjunction with an IOMMU.
> >>>>
> >>>> I consider it wrong to put in place such a restriction, but I could
> >>>> perhaps accept you and Andrew thinking this way if this was the only
> >>>> aspect playing into here. However, this would then want an equivalent
> >>>> tools side check, and while hunting down where to make the change as
> >>>> done here, I wasn't able to figure out where that alternative
> >>>> adjustment would need doing. Hence I would possibly(!) buy into this
> >>>> only if someone else took care of doing so properly in the tool stack
> >>>> (including the emission of a sensible error message).
> >>>
> >>> What about the (completely untested) chunk below:
> >>>
> >>> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> >>> index d7a40d7550..e585ef4c5c 100644
> >>> --- a/tools/libs/light/libxl_create.c
> >>> +++ b/tools/libs/light/libxl_create.c
> >>> @@ -1160,17 +1160,16 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
> >>>      pod_enabled = (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV) &&
> >>>          (d_config->b_info.target_memkb < d_config->b_info.max_memkb);
> >>>  
> >>> -    /* We cannot have PoD and PCI device assignment at the same time
> >>> +    /* We cannot have PoD and an active IOMMU at the same time
> >>>       * for HVM guest. It was reported that IOMMU cannot work with PoD
> >>>       * enabled because it needs to populated entire page table for
> >>> -     * guest. To stay on the safe side, we disable PCI device
> >>> -     * assignment when PoD is enabled.
> >>> +     * guest.
> >>>       */
> >>>      if (d_config->c_info.type != LIBXL_DOMAIN_TYPE_PV &&
> >>> -        d_config->num_pcidevs && pod_enabled) {
> >>> +        d_config->c_info.passthrough != LIBXL_PASSTHROUGH_DISABLED &&
> >>> +        pod_enabled) {
> >>>          ret = ERROR_INVAL;
> >>> -        LOGD(ERROR, domid,
> >>> -             "PCI device assignment for HVM guest failed due to PoD enabled");
> >>> +        LOGD(ERROR, domid, "IOMMU cannot be enabled together with PoD");
> >>>          goto error_out;
> >>>      }
> >>
> >> Perhaps. Seeing this I actually recall coming across this check during
> >> my investigation. Not changing it along the lines of what you do was
> >> then really more because of me not being convinced of the extra
> >> restriction; I clearly misremembered when writing the earlier reply.
> >> If we were to do what you suggest, I'd like to ask that the comment be
> >> changed differently, though: "We cannot ..." then isn't really true
> >> anymore. We choose not to permit this mode; "cannot" only applies to
> >> actual device assignment (and of course only as long as there aren't
> >> restartable IOMMU faults).
> > 
> > I'm fine with an adjusted wording here. This was mostly a placement
> > suggestion, but I didn't gave much thought to the error message.
> 
> FTAOD: Are you going to transform this into a proper patch then? While
> I wouldn't object to such a behavioral change, I also wouldn't want to
> put my name under it. But if it went in, I think I might be able to
> then drop the libxl adjustment from my patch.

Oh, I somewhat assumed you would integrate this check into the patch.
I can send a standalone patch myself if that's your preference. Let me
do that now.

Roger.

