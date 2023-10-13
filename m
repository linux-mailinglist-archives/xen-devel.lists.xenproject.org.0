Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD57C8088
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616304.958196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDho-0008A9-I4; Fri, 13 Oct 2023 08:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616304.958196; Fri, 13 Oct 2023 08:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDho-000885-FL; Fri, 13 Oct 2023 08:39:36 +0000
Received: by outflank-mailman (input) for mailman id 616304;
 Fri, 13 Oct 2023 08:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lwD=F3=citrix.com=prvs=64352611f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qrDhm-00086a-PU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:39:35 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f0073f-69a4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 10:39:32 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2023 04:39:17 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5619.namprd03.prod.outlook.com (2603:10b6:208:284::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 13 Oct
 2023 08:39:11 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 08:39:11 +0000
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
X-Inumbo-ID: 06f0073f-69a4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697186372;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=c7EfoYkduE1PfTW48mbdm+YVxY7JAtmne8PtVGcLKuI=;
  b=hxsVEeNb14aG46fJT2ZEMXerx0EZp1eDc1LAadF1tzXstwZdP98WFGu4
   Ww7HyWpCgXqCOrDMSoXizoR8Jj2rQiblu8Y4P4RYlVEn86x4g8LMY1TqI
   SydBV1bCvUtTiNLRNH1ZAY0R/+twLFE+jJK8zOW+JuC+k3FuocGU3gpwH
   M=;
X-CSE-ConnectionGUID: 7eg8AQMsRYCz8dtzV/7gwQ==
X-CSE-MsgGUID: W0IjK1HqTA6P1kz+0bybjQ==
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 124075992
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:p2bNX684ze4HpGt3nYWVDrUDvX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2AcXWDSOP+NMGKmc98gPo6z9BwAuMKDnd83Ggs6rSs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPakQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkR+
 PNIAQkodSqyrPDmzK6pdK4zidsaeZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpidABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwXukBdNDTtVU8NZV2HyR5TUzESE/C2Piouv60kSvUdBmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsUg8t89Tl5oYpgXryos1LFae0ipj5HG/2y
 jXT9Cwm3exL1IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2sLhm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:aamtXah1CwN9qkM5DEIEwNJZLHBQXgcji2hC6mlwRA09TyVXrb
 HWoB19726PtN9xYgBapTnkAsO9qBznhPxICOUqTNCftWrdyQ+VxeNZnOjfKlTbckWUltK1vZ
 0AT0EUMqyJMbEVt7ed3OB6KbodKRu8nZyAtKPxyXFiSA0vTbph4Qd/AgPeP0VqSGB9dP8E/V
 anifavbgDPRUgq
X-Talos-CUID: 9a23:tq2LNm4NCkTwlWkl/dssq0MbSukcV2bn/VzCc0OkG1guF7KKcArF
X-Talos-MUID: =?us-ascii?q?9a23=3ATEke3g4gXEt9UDXrWhGSRbtBxoxXu4WsKxktiKk?=
 =?us-ascii?q?v5fHdNj4zYz2MhjaOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,221,1694750400"; 
   d="scan'208";a="124075992"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jme79cMo7mnheU5TtbBif1Zc9VAkmXCE/xNKHF2rOc29Gk4To5uJyHfjJk0NfmefNkUCT06Ec/0To4QC404KhdwB2HtX7ZFalgWJoWbwPNVXjFNtp/nnv4aosr4kQ0IJDGgqRkaDtZ9I6hfaCx6r1NeuzVY8wdo/RvLwhUyauGXUWXxNH7TJnFsvFLG3FKavLkWVDc1eyWnz48/en5UqJ4PLCiXHJqaeRLSaN9f1s9Fse6jcHIhwdHxkBB5Nob0EL5Hi2vxQzso9C+BlcqggeHgNYwVrmvkXfYSk67bxEBi1nfsvQt5pm1j7zF+BdrNPjsZ5XFmsyITY70YBgvlkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAz2JN0rYbUVd5x3P19thJgrMi56GH+1plfczujJ+hI=;
 b=Mw+n542qc7H/Zab0Jf4/WAyEBr62hzLMJYh1O/TFbeXm/6F9cAw2qHZPh2sJZ3q/z6GTef6HLYq+N+KctC8RIaKHqs5gdOq8CptuH7JbMyw3KUdIj2Y3P0l9zMGMp5sdNZ/gurMOmhEXDkU/2uOYuTmyRkKc9CLySXUo7jGZxlfzG0aSFtYPmZwdaOR+2MEYF30giZgYp+AOECp6psVVGkNQnPlzVF61AWsyTHURLUOnMdIRECMdYEhMhUXiHhC0k7spC70MX94GAZVxRQPKL30AbH0Cb9p4dJWRf34H/xp5UkU4So0PRX8QgAthCJxekJAe9UvnxtsGEhI9pcf8ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAz2JN0rYbUVd5x3P19thJgrMi56GH+1plfczujJ+hI=;
 b=wnDg3D++M66vj/mbzskZuk8bnMS6YX6DeGFGEnjs+QuKAC76WyXuOziBDhVwxsomPgTgZEi0Nw/fQrFflwpSM+1rPYfkgjRIiGdTsXvEg4ISs4/qeIuOqcyuMqTgtyXVw/wCmyIQbogv1KfvXSdO1WuwV5radVPSpSISEuitn9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Oct 2023 10:39:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZSkCKkJjcCiJsIGp@macbook>
References: <20231011153756.16714-1-roger.pau@citrix.com>
 <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5448c8-73e2-43e9-cef9-08dbcbc7df83
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ucUKt87BtsHeWI2yN89tPb7ptLR1YFvXI1qtRhekxq1UgCIvY6GdvpYeaYL3A49cfnrM5nEhJFjiZGqtgPjDb9w1JETb+QnKt3qf9GZ7/xtzE2VPevM3bD/l8+zibMKnJJmT4EORbBtzQQdeEr4aDtzO6cbOGwRcu9byxGNly8jDf+g3KVoqxevHrcFApsTaFosS1r/aBK57toKS3AoBQ0zudcv4NzUBglStm4y0sgHTZu3nXpHQSuPw3eMhGlc3/KAwqa0QuTcwC8iP4XXPfdLEQBr3mAKDrcF+d1v0IqVn4cha3Gq54VnUXSDLWQedPgsJUqDgeYr+BnOaLyuz/PWDUAj6unvP3FWcZE8rX49NtbtpS1EQRm7h+QIxIfZdQ9pR2GYZ7bLBaSm0/GFIpfnf9FJX/W5CcjUIFROoybrlvoqi/CV9Y0sypeTapERkpzwmzqv9BMBxIuPGSgZ/XMqgtgnYi/cJ4m870zX9OzC+pKmqDmZAQg9iu3CVJuc257qvYbMxOmWFAHE42nuyGwXWP1x8IixBNaiUUTEMH+5YZ40QlDdLiXxnCH8MY3YY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(8676002)(316002)(83380400001)(6636002)(26005)(54906003)(66476007)(66946007)(66556008)(41300700001)(6506007)(6666004)(4326008)(5660300002)(478600001)(8936002)(2906002)(9686003)(6862004)(6486002)(82960400001)(53546011)(6512007)(85182001)(38100700002)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlYxdTFKWUVDT1NnMnRvRjVvakcydk12aU5IeFNRWmhjbVlwM0dLbVFBTjQ1?=
 =?utf-8?B?OHFXcnozTGFFZ1VtOHEvRGMvcVBoUWg4US9FeVVPd3I3N0JPeHFhb2hiaHBa?=
 =?utf-8?B?M3QwMTBDT2lkSDVYYkNQRE8rb1FZZ2hKR0Z5aDFNZVZCQklBMGVvbk03OEdL?=
 =?utf-8?B?OHR6Mk16MmxCRnlqNW0ydUYvWWMyNUUzOFlnNm9kM2hoNVBMUDRkelBlTytw?=
 =?utf-8?B?ZXFoZmZhVjBzek5iVG50ME14SkM3bWhINFp2TjJNSDdFM3JjL2dSY3gxaUpn?=
 =?utf-8?B?T1RYU3hVaThHdU5uQlQ1N2luNjZUMEo5ZDBldWk4Z09RRXJvNS9IVmMvektF?=
 =?utf-8?B?Sys5aGhleDNsaVl6R2N3MjRMeUUvTzcwOGZTUzlPSWlOU21wazd5QkxjM3dP?=
 =?utf-8?B?T1JZb3FHS0F0YldvZEhnb1lKT050TVVkSTlrVmt4dXJEdkljNUMxQkIxdDBR?=
 =?utf-8?B?R2NYb1E5aTdGcVFyOXNpV2tWcmZad0I5ZjNYOHptUFM2Y3k1dnhOcGtnVEtS?=
 =?utf-8?B?Z2g5Yk90L3VhWHRjVFdJRnNPOXBCRnpSNFBpcjBCamFJSFRKeWVjY1lGYTEw?=
 =?utf-8?B?aUIvY1ZzeUxpNmpuSWpEZHFUcUkrQ0g1WVhscVltQUMvakptdy8zL1l5OU12?=
 =?utf-8?B?Sml5bnVQdllxWlZxdnFPZGpESGpyOFMvN3VtVDNTUUp3VWJCbWk0RENMYVZw?=
 =?utf-8?B?eVV5WXlWaWRtaGUzS1lzWU9UWkpNVmVYTElDNnhyOW5xWDBSclIrNXZXWW9v?=
 =?utf-8?B?aFl6OTFTWU9KWjFmT0tkcjFoYnVFc01aMTJmb1JEd2lIMnJYeForeTlsZ1Rj?=
 =?utf-8?B?QXo3ZTlOVXg2Zk9JaXhoYkJkajRKaThteFdyTHZaditYWXl3ZUMzQUUxTTlh?=
 =?utf-8?B?ZDBtdlRhb0hDSDg3dSt3eXA3ZE8xMlVKR1E3MUE0b284V1NsNXJqUzIxbmlm?=
 =?utf-8?B?VGIyeTJQS2ZPWjM1eGZHUkY3OWtnY2FubUt4dHAxM1NVd0F3TVhNbDdVSzVr?=
 =?utf-8?B?eHlNSjZrdGZJZDNjZjNXSHlvWWo2Z1dRQTdCN0xQR29yTEczMWhKM040R0dM?=
 =?utf-8?B?aGExU2NTQ21kT2JNdzZRVTZqelBzR010MzNhQUNTeWVUbjlaYXU5VDZkZ2ly?=
 =?utf-8?B?b3NWaWlkZk1mUk1kNDRzcWNmUXh3cGpGZGQyc1FCOHUzSkhQbTZCTWZ2bFNB?=
 =?utf-8?B?VFcyL04xY0VtUFlQcHVFMWQvN3B6dEpKdTQwK1NpdFFiUGpvbjkxb3JjVlpj?=
 =?utf-8?B?Y3ZQaFdHVkZERHhlVWpJbUdHUzZMVmh4RjdVaFZDYkdOMllWWVducGhDei9t?=
 =?utf-8?B?c1FUejRJNTRzVlBMdWkrRGVKWm9ZVTVoUk9yanFmSkhsa0dGRkJSdHZ5VVcr?=
 =?utf-8?B?YzFNa2NTNlUwTFl1Tm5KYnlzZ2RDZGhoTnovbGxtdzdMajMvYmRobHhKUElz?=
 =?utf-8?B?N2VuWnhvTnFXL05QbXlTU2s3VGVldU1tQ3VqTGJ2aXFDZitySFZRWjRrb2FD?=
 =?utf-8?B?L25INlhzczJZUm9Xb25sYmljcUFwWEtPU2dONi9QZDZDZmFURFY2ZWJzZWh3?=
 =?utf-8?B?Q0cveDBKUm9pRkUyeDJxRlQzVmN6YVRaSjF0NkhZa2xXQTFSZ0RVN3Q1NEpn?=
 =?utf-8?B?Zm5xUkZ6dERsNUhNdmU4eHU0M3ZMcDBsNkNPUUNkRkVVQ2NvVFVnOWthSDBy?=
 =?utf-8?B?RzdGM1Ezbmo3eG45ZzRhVlg4M3FLTkQ3RGZKeCt2YmRiRFVEeVNRQ1Zqd2hi?=
 =?utf-8?B?ZDJ1Q0hBSVFSQTFjYjRnd1o4ZDdRdFNGTkdaOU5CMDlCUEpxMVppRCtnaTJu?=
 =?utf-8?B?MWlidjFKQTZybWtOMjluYzRXOXFjYWJGVmtwZWZBZGZDZG5kaThnM2swYS8y?=
 =?utf-8?B?WjJKdmhLRWJUUDZhY3JmM2Voc01jRW5LdDZNaWV4RUdJNkJhQnJ2VG5hNlZZ?=
 =?utf-8?B?UC9udHlUSElENXJGalRoNkthbVplZVRRZEdtdUVrNEt6djBFcWZMWVlQZkdF?=
 =?utf-8?B?V3pWWnJYS0M3SEJzMVJuTEdsOGtlemcvODlnL3RkT3MzbnlJdEEvV01WV0dy?=
 =?utf-8?B?K1lzNE5jbFVsam1zdnpkclZBbXNyaGg2eHhwcXgvTWpEUk1zSEZmcWUwVmlD?=
 =?utf-8?Q?ngQ50YrInkHE43LkJYwgwb2dL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ib4+1LBmW0NOnsD4seUy9x69K8LDglhDWYkd9oK0ANz9u2kXOrP4KWDm4ew/9nDVp60/buMdFs5pHVXW001IdSoMgAUH3hEXY0hXbs4kRhRYO07iL9K051vG+pH7qUfk1zjQUiYL20VKopgWPrrDbek1Qc3buQ2HZqmjYpM3dRUZ6asNRxYwZeiV0jANYqDFXz+5Tul3iE0j5cxTUKe21QS3RflDdkDgaOGFZtmbycLHzSt3qoC2aqmfffaqfO0BxMcuM92ca4xoStGrHSQas/JA75P80MgkE5ASFotk5QQzhivcEufrm5mafYzDyZQ/obx9N+IMYH3l62gevTo9ZyPDby1V+uyNF+3V4SVmSLj4CAk3nPqbI9W0I5EP2RjcSq6QmxZH3P1GTlGmE69R7bhCxCDtLZVJbKKn7xFgeNb4TTsXZWD9Kq6kRL2JxQjNoJRGnm845oqYpFLEXxOa40aUsfS6GJ9McXjn8rCunOedkd+PV9cAD82IY8FndoodnxKUgUjyXUtJTKbEn6tIfJs3dKVz/kbB/cXTEpKFKBfUjQXLG7A3FFnG8Rq2oQbgYwU0HCiYZ6tLVg0EhrZUKxgKjHOYCHO3FVXZnytRi6dOu8wnub2tu5BPKX1dGnuBhWSujpQtVHLyTxwyGjoqerEl0UItPMjPbCOgqZCxXF2l5eOtQEDbiQzVk8LjEV1LWccSCFXydckv8H6bPXi0no6Z4xFTyL0uqGDBPueZKKy1twiVmCTzEjI0wbqPaAZtPMq1uNBjv7MrAxn1qI1Cup97xFNJiuzT8a7XyBQ5CrfGsCZGNN+lz1lEKN9a4LRbOdKmR4KmUcln7b/OYJmlplCkpRQBAPpaic5kKBHNbS8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5448c8-73e2-43e9-cef9-08dbcbc7df83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 08:39:11.5091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oe2jlMkCncfbTiuvCdTDXhoTML/5irQG3I2RC+C6hG0eObp6K/vk7rJnnMdHvEvLORflpw0h9XUpp/tG2fvgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5619

On Thu, Oct 12, 2023 at 12:48:20AM +0800, Andrew Cooper wrote:
> On 11/10/2023 11:37 pm, Roger Pau Monne wrote:
> > The mapping of memory regions below the 1MB mark was all done by the PVH dom0
> > builder code, thus completely avoiding that region in the arch-specific IOMMU
> > hardware domain initialization code.
> 
> This took a while to parse.  I think it would be clearer to say "builder
> code, causing the region to be avoided by the arch ..."

Yes, that's likely better, so:

"The mapping of memory regions below the 1MB mark was all done by the PVH dom0
builder code, causing the region to be avoided by the arch specific IOMMU
hardware domain initialization code."

> >   That lead to the IOMMU being enabled
> > without reserved regions in the low 1MB identity mapped in the p2m for PVH
> > hardware domains.  Firmware with missing RMRR/IVMD ranges that would otherwise
> > be located in the low 1MB would transiently trigger IOMMU faults until the p2m
> > is populated by the PVH dom0 builder:
> 
> "Firmware which happens to be missing RMRR/IVMD ranges describing E820
> reserved regions in the low 1MB would ..." ?

Will adjust.

> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb380 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.1 d0 addr 00000000000eb340 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:13.2 d0 addr 00000000000ea1c0 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb480 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb080 flags 0x20 RW
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:14.5 d0 addr 00000000000eb400 flags 0
> > AMD-Vi: IO_PAGE_FAULT: 0000:00:12.0 d0 addr 00000000000eb040 flags 0
> >
> > Mostly remove the special handling of the low 1MB done by the PVH dom0 builder,
> > leaving just the data copy between RAM regions.  Otherwise rely on the IOMMU
> > arch init code to create any identity mappings for reserved regions in such
> > range (like it already does for all reserved regions).
> 
> "in such ranges", or in this case "in that range" would be better.  Also
> "for reserved regions elsewhere" IMO.
> 
> Just to confirm, we're saying our default treatment of identity mapping
> e820 reserved regions into the IOMMU is masking (or not) a missing
> RMRR/IVMD entry?

Yes, the provided tables are missing (some?) IVMD region(s) for the
USB devices (the 0xea and 0xeb pages at least, possibly others).  We
identity map reserved regions in the memory map for dom0 in order to
cover up for missing RMRR/IVMD regions, because it's quite common.

> >
> > Note there's a small difference in behavior, as holes in the low 1MB will no
> > longer be identity mapped to the p2m.
> >
> > Fixes: 6b4f6a31ace1 ('x86/PVH: de-duplicate mappings for first Mb of Dom0 memory')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I suppose you intended to mark this for 4.18 as you CC'd Henry, and also
> send it for x86 (CC added)?

I didn't run add_maintainer on it, sorry.

> I'm tempted to commit it based on the diffstat alone.  How do we still
> have so much junk code like this lying around breaking things...
> 
> Anyway - it's a clear improvement.

I've got further improvements in this area, but not 4.18 material,
will try to post them soon anyway.

> But a question first.  Is this from debugging the XSA-442 fallout?  If
> so, it's probably worth mentioning the hardware we saw this on (which
> IIRC was fairly old AMD), and that XSA-442 unmasked a pre-existing bug. 
> And we think it's USB/PS2 emulation?

Yeah, can add this all.  It is triggered by pinot{0,1} which is AMD
Fam15h (AMD Opteron(tm) Processor 3350 HE).

Thanks, Roger.

