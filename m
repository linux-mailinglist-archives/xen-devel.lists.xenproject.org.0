Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F142629A26
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 14:28:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443948.698711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyZ-0000BV-PA; Tue, 15 Nov 2022 13:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443948.698711; Tue, 15 Nov 2022 13:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouvyZ-00008w-MB; Tue, 15 Nov 2022 13:27:43 +0000
Received: by outflank-mailman (input) for mailman id 443948;
 Tue, 15 Nov 2022 13:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wxYI=3P=citrix.com=prvs=31178c1ec=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouvyX-00083Z-FB
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 13:27:41 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45be2609-64e9-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 14:27:39 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Nov 2022 08:27:36 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6713.namprd03.prod.outlook.com (2603:10b6:a03:404::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 13:27:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Tue, 15 Nov 2022
 13:27:34 +0000
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
X-Inumbo-ID: 45be2609-64e9-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668518859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=m0LCQ3pgEBmcqIxE+QCQbONxN6i33lfwBBBNYVosPS8=;
  b=FCI/63CQemdFCK+4QG7aN14CZIHoDoQy+TTqa6J8f3gNJTQ3G1yGxckb
   PLkSBIJlf3kgVgFVCfx6fOoyoNDGrJy9iFEChtb8j60TbLLyZOF4XsYsu
   eISTbnjkoXtX5XEDIbRubNEx89SoOrVhBO9yruPU4uG7fZ3bU0b/teJgE
   A=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 84870987
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WkXF2KjS3YWPsrPQgzRCNSJnX161UxEKZh0ujC45NGQN5FlHY01je
 htvXzuPbPnbMGT0fdsjb9nk8BwFvpGGyddmHAI4qHtjHigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5QaDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGBmonYg6cgNm0g/GJSuRjmNYfDNvkadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybrI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXOnCN1KRe3nnhJsqGKZ10k8DBkUbgS6uf3lqWmSBvZZd
 1NBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQGucksVHoV3
 1mGt9rzAHpkt7j9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJuuPC4awh9zxXDv2k
 zaDqXFkg61J1JFVkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshUZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:r581paHdz+lU+gxspLqFiJLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LK90c67MAnhHP9OkPIs1NKZMDUO11HYSL2KgbGD/9SkIVyGygc/79
 YeT0EBMqyWMbESt6+TjmiF+pQbsaG6GciT9JvjJhxWPGRXgs9bnmRE4lHxKDwKeOAKP+tOKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZpzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU511rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtpgPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZIIAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32N3Qqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5ZUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up8pH
 34aiIZiYcOQTOsNSXXt6c7sCwlAV/NEQgF8/supqSQ4dbHNf/W2S7qciFdryLvmYRaPiThYY
 fCBHtnOY6cEYLQI/c54+SHYeg1FZA/arxghj9pYSP4nuv7bqvXi8f8TNH/YJLQLBdMYBKNPp
 JEZkm/GPl9
X-IronPort-AV: E=Sophos;i="5.96,166,1665460800"; 
   d="scan'208";a="84870987"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3MtDTsjz0AlGH7dMMkpDrCzIouYFYcUa8emqub+ITtdzX3S1R7x3vw2QjFAwySmkUt/vFeYRf8j8CFdilAdqmGQLS4iVOvVWl7EKIpSFWAVeBMb2iRWeeUbJSmemvM6lTSdBNRPpF6RjlpsaOkDpkd6wtBs2JpPMbxrcUOgv96da8kL9cgLgDR1l2uZFmeLX/+BxtobHboCxPOtzQ+zYC0qMjqkHTcQSn+sgOr3EiU86/MEjSwVGAln/iZsY6OJXCedmtX2EsY03XoVcQnKZT8bGBs4nNvMNTUaXYtuVZztmpi9kgDQatlcw6ZAsVRs8tTjPCmGWLL1OoY0lHZNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBqo2QiWYWkQZQXQeC7ooG/JWWPEbzacJedkLW/eU4A=;
 b=UYwZSjxJ/HQ3XqpJYJ4xYg8dogLuxt9xoRodDtugw3l/O9P51p15EtVy37tdpuFfQS0ZgKY4uS/wEY35hdypMuj0jghpKPTmCFgBnZhRoOcbvhAi965pgBe0zscxeD3r3P+xo/sge1wIcxhl/k/hV+WCCBjmGvFBkW8m0KqWQNDmFapmixbpJKMxVki/Hh5xURZtqQwz2NN83DxmfHw7ILIumu+pm8eIm3q0of5/fmDbloIX5mV2Zn/i3tq6UY6dX2JQeFwZBmSWe2qRq0KACcPKXgO0Gpb9DhuOJGVMpcRRKwe8LH48xbdLy8NtCUEumd/FZpgkOJqHnEq/k9m8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBqo2QiWYWkQZQXQeC7ooG/JWWPEbzacJedkLW/eU4A=;
 b=JJFfMDDw6uWec7GtWRvlKX00vILk3boSEbw5Qs4cL+CXHGne/uNIttxFyNmDUtb+2L9CNQ+fGbQbiUh+JbgBgumyFLgOtqeRCaIGmdAPeUiXxmpSF6lirumvjFsseO1n6vfLbzlUqBIGUwzM/BFoHv9sqWIf6v49yrDcg4MJn/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 v4 2/2] amd: remove VIRT_SC_MSR_HVM synthetic feature
Date: Tue, 15 Nov 2022 14:26:56 +0100
Message-Id: <20221115132657.97864-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221115132657.97864-1-roger.pau@citrix.com>
References: <20221115132657.97864-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0512.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: f8c1b6ef-2f52-49ab-9772-08dac70d27e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EHnMRbuw75xfQ9f2frehTFQky7hgmbR93eAHQnM4mcq5YJSupwGFPC00TB6WDipF9lUZuGNSKP+iuNNiFEKVKvDzmX1JN4kFgsMAKg4masZIYeo4RPPp1o6YtF17EWPvpVeA4ETyqLytajMDeusejW4gwnhOd9fjXnYjyfXVV0wHbnsk7RFGsMeAQIcy5l3vP+av4pYr2CbTpsYp9RWBPTqcxdFqZ6icxtXAbIkOU0ZVea2Mr682ZwvB4X8MKxePWm54rY4AEM1sMXPXumBMltngnV5wAWOXJepJubLB7iHrrcqGgDksvplKvXTyI/QmUkBqMrFdO2WY8vcM4nrhnGbvHyyZgeI6I92PeYLR5H4VVCT8DzjlE8QwgEXN54ile6nGsv8SGBA4bAqa/Ug+3JaimOVB3BMakZ7M2ub8zh6Hgxj1goDuATq3Ac0QRFQwU8OhDH3/Fm5ejowhJVYdYbAhfrruqZV1jr1bEGiDCQtW1wLB+3IZNSUmB7MJqTYwVj+cQ5cqaNm0g9LxCo5YFmabfQH0LK2f6UaQrfr1sDT6MZNWh+/W8OdMlUBwv8B7hCIb9E2s4SNkPNaqzsCwD6qAqEGX7EyBzambZapT5Xw0wLBpLL5zT7FynuXaGmhzqaD9S3F5eiaYg9ddXV7Ap193bFHfIc383imFud8XuH01qTOm99hdDd5UIa2ScnQ3HRmMBxRElboIPiAHze8oSg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(82960400001)(2906002)(66946007)(66556008)(66476007)(38100700002)(5660300002)(36756003)(83380400001)(8936002)(41300700001)(8676002)(4326008)(6666004)(478600001)(6506007)(6512007)(54906003)(26005)(2616005)(1076003)(6916009)(186003)(316002)(86362001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3RJczEzUEYrL3hHY0wydWhZbTZHdHBHZ1NKdE4rczhDSm5ucERDR3phSnJQ?=
 =?utf-8?B?QWoxS0NmUVZaNVBGSGNvMTNMSzJHZ3JzMXZKM256ZE9EYmc3RlFyRUVkNDI3?=
 =?utf-8?B?NGpFamZaUkYyY21QK1N1cFBBUjBGcjM3MGd6U3E4RTU2b3d3S1A3aEJrby9B?=
 =?utf-8?B?c0o1TWNWY2xHQUM3VmhJZ3YranlFb3Z2dHdWc0NaZDJpR3Byc2loajVIUjhj?=
 =?utf-8?B?Nk4wa3ZBUTVxNklQWTFBNUtxMDY1TWd0QVlJZXh3SWZVZ3AvaStYUkg4bmxV?=
 =?utf-8?B?anpvcEkyM2tndmpDakhEUGtkYktnbWxqWVYweFhKdUhRaWRxT05KNk53Wkdi?=
 =?utf-8?B?eFB5emczWlNucVYwZFhKWWowSHVRYStidEVwaitYZStYall5R21HZUwyM2xN?=
 =?utf-8?B?M2FoSm9ZUEhQdjFOSVlRUithMDl4ai9WYWlnUGNkakJMSmtMcUhNRjlJaUEz?=
 =?utf-8?B?ZjdyUTNKK0xhNDdSNERta0dHd29Ha0xFOXVJeHMwT3hmWTAxMGhES1RHZ1JH?=
 =?utf-8?B?REpsNWhqejQ3U1pUdDBMckNObENDVmdlQ0xQdWo2YlBlR2pHeTFmR3pnSi80?=
 =?utf-8?B?TnpTMDlvdFluWTVGWUNyVVRXOVZxQUlHR0QzclR0LzBMOTdPNGY2SllkOTdG?=
 =?utf-8?B?YmFhTzAwUmk1NHBjc0Uzem5EeUE3QlBOai9STUxMOHlmdk42aysvZXVJTUFs?=
 =?utf-8?B?MEVhUkRiNlhyTXdBUkRBSXM5cHZVNVcrTStmOXpwQ01RUm1BR2ppaXM4RUt2?=
 =?utf-8?B?dUFBMi81MkNhUjJLVGxmbjd6OXpiWlZmNy9VU2U3RDk5RDFQTmwvRFViOHpQ?=
 =?utf-8?B?b2djSCtaRkxMOXJINDZUNGtXeTdRaU85dWlJVzYvU3RFVnBhdGhnOHhTMHJ3?=
 =?utf-8?B?bGlkLzNrTVhNbHRUbWNiOXRSZ1BCVVUrRVZwTEUrWGF2b0VhR1cramZUY1F6?=
 =?utf-8?B?aEM4ZVBkYWFnOVRLQnJoa0lrMVlGK3Vld2h6Z3E4N25RME84VDUwc2dtcTlC?=
 =?utf-8?B?RzdMaUVVNjlmYmNNY0dKOU9HanZSMmNtYlRnZVdHNXBFTS9saUVoRGtvMGQy?=
 =?utf-8?B?YXNaT0srWUN3NlpJR2hIbU5aWHJTNFhqR05IejNFME1jOGNDU2NZUUZYemdC?=
 =?utf-8?B?cHhBb0xOVm5DOEFFcm5PUUtyZjE0RWdoYlpSL1BWTER2eFY4cytFSHRFR3Vx?=
 =?utf-8?B?RWRwR3RGeEJKQ2RMTEliS01GeUJhWWNOcWw4QUtqOU5LVjlvWVR2TGRaWFdX?=
 =?utf-8?B?L0h2aE53ZXh2YjFwZkVqN2tud1FrV1ozY2FEajQ1akdxSytDd1llcTI1QUJo?=
 =?utf-8?B?S25YKzhNSTFuZS80NkVhV3QwcXVVQXB6VXA5NDRIYk5kc21jL1lPRGZzV3Zr?=
 =?utf-8?B?TVpsUUFIMjg4KzhUV3ZVbWE4WmhpZUhJZVI4cTJtMjg2NzJDdHdNM3QzT3dl?=
 =?utf-8?B?L2FLdTFjMzUxMlErVDBMR09tTUkvU3ZnOWRLelptby91MU12cElzR2JSNkcr?=
 =?utf-8?B?S1ZzYUk3TmoyMnpMRk5EYVdmQW0rMTRTcVl5b0s4djNCUnlJMkVPRndmbDhZ?=
 =?utf-8?B?eDZ0TzYyNUJLN1U3OXAvZHhqSVZzdlFZMExjZmVlbzU4bFFTTTFEeE1MWEJj?=
 =?utf-8?B?elI2akV1LzhRaEJ4RlgyU1Y0N1JqNTJCZkkyTS96cVFRbE0zWEFKQWtreUJU?=
 =?utf-8?B?dktLZTY1a016QUdlY3FEcmxjdUxhdGxVRlF3ZlgyY0JXYk9zd3JFU0tlSi9a?=
 =?utf-8?B?TSszZG5ScW9oSTVrT0FtZzhRZ1AydkNSS2h0eGxIcWExaUtVeWtHOENvOVZI?=
 =?utf-8?B?ejZsNlppUmVRYkZaOURySDAwRDhDdkhOUHhGVDVyMGs5NXVNV1hYWTd1WXlM?=
 =?utf-8?B?Ykdudi8yK0VUdEU2NzNrMG1oNDZvakpQUlJXU0p2dnF4bmxxTTRXUlc3cjU2?=
 =?utf-8?B?Y0NKNFVXNkJkN1Y3QmZpZWVPdjJpQyswME0rVHprbjAzcWcyOEJoZkpwR0Jr?=
 =?utf-8?B?Tkg5L05pN0tWSHFFcVVNZkRJN2pHUTU2UFA5N2ljOVBiNjZxM0x2SXdLcGRs?=
 =?utf-8?B?dThDS0dzODFmR2pQYWNtUm5rcUxGZ2Q4MGdjZGJLYTFEN3dsQUlnUHQyeXlJ?=
 =?utf-8?Q?fVK/SBUQK80uZDx1Gfgs0Xfx1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PfLftu1DsiVrjdnvtdKG0TU1RdLkV5qDrPP2dgVPRn2C3WQkQ4IxZGlh1W5PXa6oEZE2jF1ifrOh3rlxh0oj4a4Ot2Aw0lJtW1BCucztbQf0UT2lgjN8UK4bFBBTZIG3qqLlt0zGhw8Tlio04r+2X+1y4aaUztri/YGtzz+MGm42SzZhf7PF0pjEU6eGIdSHgh0HiMDyh0CqxCQzm1qTzw8l1zbLos6iwkYMNiFpOXsR7WZEQyZSbuwYxqGlX6M9tbqEEkBfHKJpw3QwWT2HNhEhV7tiVac824PMma2u6+8HW0qP/zBeEf/3lK/LL56FGFJuRmlDRDvt6c8qZ4VlAuioB1fgtww7eu0DjbaJXHnE7abXJP8UnoyXp5tAGfbQwK3oMdgGp6NZrM4pAq11hrUbqWxNUXE4z0J5XmA8wNAmRu9zTXiEqQAQhUFISkRv48I2XjozHqtGmeZrt4G1EMkgFnbjYWQurzChjOilA8mjOK9Tq/A/zuc75DEctIEXjPKWrQZwXb11z5Ci3wmIqs5fAWCDguqaw7rvX2SwVEv13eMLiI7zXwpWMiuE5pAvhjQ0DVA86qMuQhudi6enNBlPW8am4RmI9Y25EV0S3DC6hYp33O1wJYs8TCR+2i29lbIEl/fpl3NKzHWirUd9Dzlbu1d67i7xNcUPAVjU04Z28gmQJ8mhdRAJfsXLZXYbEA7OSAP7TO7WtfIg8yTpK52KeNjhak3kgt/YDuNwkKZqffgYmghAYO1VZsUCbn2romY2Ffd26N2kI0jRk+CCajNT5vLe8PTERJeVItD1I5s4iX7SqDX1q3QO/FLzvsJa9zz88GWaZX44dTSFVKs3YLRKLz4eaTyNkHu4Yg7BwnQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c1b6ef-2f52-49ab-9772-08dac70d27e4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 13:27:34.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6QmPzw/4AaajLG9wqwhkTQcPj4JRP4cxHQ36WmZ9d3HVKCp6UlwpfZCjIDUjhIDtm/4scoNLECGON79OBptdOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6713

Since the VIRT_SPEC_CTRL.SSBD selection is no longer context switched
on vm{entry,exit} there's no need to use a synthetic feature bit for
it anymore.

Remove the bit and instead use a global variable.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/x86/cpu/amd.c                 | 1 +
 xen/arch/x86/cpuid.c                   | 9 +++++----
 xen/arch/x86/include/asm/amd.h         | 1 +
 xen/arch/x86/include/asm/cpufeatures.h | 2 +-
 xen/arch/x86/spec_ctrl.c               | 8 ++++----
 5 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index a332087604..9e3b9094d3 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -49,6 +49,7 @@ boolean_param("allow_unsafe", opt_allow_unsafe);
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
+bool __ro_after_init amd_virt_spec_ctrl;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 822f9ace10..acc2f606ce 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -3,6 +3,7 @@
 #include <xen/param.h>
 #include <xen/sched.h>
 #include <xen/nospec.h>
+#include <asm/amd.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/nestedhvm.h>
@@ -543,9 +544,9 @@ static void __init calculate_hvm_max_policy(void)
 
     /*
      * VIRT_SSBD is exposed in the default policy as a result of
-     * VIRT_SC_MSR_HVM being set, it also needs exposing in the max policy.
+     * amd_virt_spec_ctrl being set, it also needs exposing in the max policy.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     /*
@@ -606,9 +607,9 @@ static void __init calculate_hvm_def_policy(void)
 
     /*
      * Only expose VIRT_SSBD if AMD_SSBD is not available, and thus
-     * VIRT_SC_MSR_HVM is set.
+     * amd_virt_spec_ctrl is set.
      */
-    if ( boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) )
+    if ( amd_virt_spec_ctrl )
         __set_bit(X86_FEATURE_VIRT_SSBD, hvm_featureset);
 
     sanitise_featureset(hvm_featureset);
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 6a42f68542..a975d3de26 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -152,6 +152,7 @@ extern bool amd_acpi_c1e_quirk;
 void amd_check_disable_c1e(unsigned int port, u8 value);
 
 extern bool amd_legacy_ssbd;
+extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 3895de4faf..efd3a667ef 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(VIRT_SC_MSR_HVM,   X86_SYNTH(12)) /* MSR_VIRT_SPEC_CTRL exposed to HVM */
+/* Bit 12 unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4e53056624..0b94af6b86 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -514,12 +514,12 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM) ||
+            amd_virt_spec_ctrl ||
             opt_eager_fpu || opt_md_clear_hvm)       ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
-            boot_cpu_has(X86_FEATURE_VIRT_SC_MSR_HVM)) ? " MSR_VIRT_SPEC_CTRL"
-                                                       : "",
+            amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL"
+                                                     : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
            opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_md_clear_hvm                          ? " MD_CLEAR"      : "",
@@ -1247,7 +1247,7 @@ void __init init_speculation_mitigations(void)
     /* Support VIRT_SPEC_CTRL.SSBD if AMD_SSBD is not available. */
     if ( opt_msr_sc_hvm && !cpu_has_amd_ssbd &&
          (cpu_has_virt_ssbd || (amd_legacy_ssbd && amd_setup_legacy_ssbd())) )
-        setup_force_cpu_cap(X86_FEATURE_VIRT_SC_MSR_HVM);
+        amd_virt_spec_ctrl = true;
 
     /* Figure out default_xen_spec_ctrl. */
     if ( has_spec_ctrl && ibrs )
-- 
2.37.3


