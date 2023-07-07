Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7B74AE96
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560354.876221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiSj-000818-Pv; Fri, 07 Jul 2023 10:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560354.876221; Fri, 07 Jul 2023 10:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHiSj-0007z1-MU; Fri, 07 Jul 2023 10:13:17 +0000
Received: by outflank-mailman (input) for mailman id 560354;
 Fri, 07 Jul 2023 10:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GM+b=CZ=citrix.com=prvs=545203e5e=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qHiSi-0007yv-VU
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:13:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e17367a6-1cae-11ee-8611-37d641c3527e;
 Fri, 07 Jul 2023 12:13:14 +0200 (CEST)
Received: from mail-co1nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jul 2023 06:13:11 -0400
Received: from MW4PR03MB6428.namprd03.prod.outlook.com (2603:10b6:303:123::8)
 by BN8PR03MB4914.namprd03.prod.outlook.com (2603:10b6:408:7b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Fri, 7 Jul
 2023 10:13:09 +0000
Received: from MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd]) by MW4PR03MB6428.namprd03.prod.outlook.com
 ([fe80::95db:33e0:ebe2:13dd%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:13:09 +0000
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
X-Inumbo-ID: e17367a6-1cae-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688724794;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=LlNAG92IgRgXTaIG9XMCkaoUYGTwRyEG2FPMAgwDcn0=;
  b=hvJDmi/WwJziHwCa78xKfrVIc1CQKn3YZAOV2Zz6JxAg7JwN9MnLzLkw
   9lIr/4n9LIO3Db0xuahwkzbLjP/VRiNL9PeyU5Wq173pNotrdxmGMqhLG
   YNE2WskB9U6u1dWljg/ycOZP29gBpeboaEpjdUS9wu96gAfr15J1OXk7d
   0=;
X-IronPort-RemoteIP: 104.47.56.172
X-IronPort-MID: 118038930
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GSyoV6xII+5nRcPmWMd6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkVVz
 DAfXGrQO62La2DyLdAlYd7jp01XvZGHnIcxTAU+qSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVtp9
 cQDCGkwVD2e2aXm4be5Z7BJ18t2eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMruFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37afxXirCdlKfFG+3vk0w2DKm2FNMR8TXATmgsOwq1+ldt0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoPSlID6ty6+YUr1EuQFJBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:ByNoGq8VFStOnvCelyVuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: =?us-ascii?q?9a23=3A4X6joWgwKbpRHuXLysa40mdOcjJuSFrd9GzwenK?=
 =?us-ascii?q?CJHs3D+20TF29oYY1nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3Fib5w2I/OAByb5FQPaXgJchOTUj5PrtNRlQnMs?=
 =?us-ascii?q?/ucyNanFTAT68nS+aTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,187,1684814400"; 
   d="scan'208";a="118038930"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnU7I47K+zC9rg2eyD+172j1OFTo5ArRtMoZElcydQ7O8CvQ0E9meBr+bBAP2X3LfLhkbFYOqxo54EFLYAOvOr5U5cgpqI5Xjta3wj5+X/j1W9DYAlSrsEYcBtj/tTeLzCz5h4ny18ahxnTO4EQP3hdFkF+c7xUaCOsq4wuBr2//BZcb/hqoloiZKIWu9T/G+v+swbDTHReBdgavpfagBth4YD/8LqUS2KjsY2z+xF3MyGwxHLdR4IXdEDOwuwXiBs4ruufGB5bkYnx0Jd6CXzA21LQoeWdtbWm4JmxboicP6X5EIzCU7tZUV0K/11OZgzoP0xxax0Bg1bTr0cJRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2MJi746uqlJ6b+1RZRliSvOO1N8aNgO8u9WMnxdxas=;
 b=Q6mKda38bsMjKXWZDe7r5kAfCkqshFQKeYbnJ0LwYbFwRQbogYo0pnC0SU3A+W/X8coHY4pWtsZL7Om+WJQHIT6dUMyALq0L2eM9YhLc6yOT5cN8Ovx5uPnrO4wplW86/N5yUQdc2C5vGf4uFLO80R19M9GJC1gWUof9W8T+EXvB+/l54jqd8qB1bHcIewwEM1G4C+apIn4hmx4f3hhOhxXVpu5ox5wuWh6BrDlGf3iFmoOEi3dLSttdBQQLMl5b5ZgbxXqz7auwBACSTeFlZ/IoZznNuXc0bnWagB7qNUX7yg7d29fcMlHc7R2C1fenN1KTtRc2IQVI2dyo8qwu2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2MJi746uqlJ6b+1RZRliSvOO1N8aNgO8u9WMnxdxas=;
 b=LsJ0oXjP7mnZFb9YRg3aWGKHVpEHf2Dm1OvaSo0bKmPRbwoCnF4BLshNqSfm2DKiXJPKU0zvspL5+OYPooVlwpgGsCM5i8v+A2JOCsH9U8N71XrNcAvtikvlGOnXIhigVR/DXd2Ox1mipUPtRN8pnjvX9ReaSfxahLSrDxyxgc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 7 Jul 2023 12:13:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 1/3] multiboot2: parse vga= option when setting GOP
 mode
Message-ID: <ZKflLxsh1AKyvPOT@MacBook-Air-de-Roger.local>
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-2-roger.pau@citrix.com>
 <47cc5f67-973a-2095-932f-6ebea2d3bd9e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <47cc5f67-973a-2095-932f-6ebea2d3bd9e@suse.com>
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To MW4PR03MB6428.namprd03.prod.outlook.com
 (2603:10b6:303:123::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6428:EE_|BN8PR03MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: ea254808-07c8-4bf3-83b5-08db7ed2c34d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uaj2v3GsZj9g/80LrSnm+NBjbLDhjYgbcXeUN6SLRkb2W7pLykfxTVlSlGTUi1W8n443HRevQt+wefyYtchAD8ZJ45NlzYjcdY9lTfu4+VDzLhuUsO7lKl3JPVGXrSHlU3QUnLPUdDAOmghXJi2VXVufXtY9+5LSJryOqJF+MmNspPwmBJWZ4QPNac4hH77PFMW9hAehmg5c/mcm8Nu43Lj2BmUHH92xXRbEXnYFnbRoMsGQBLZC9PfYgOscjhtMWKZcIh/3cUgIUb7kbuanPB4SpPxQRQ4P1Lc4khodRU5F55gZJDojVl6y0KTF2xBGJZtpYMaQzpTeCfma5dO6o6jtixatSF4ZiAB5zLSGsI0cO1i/QTPa2K3Q/Ucj6+gIB5E8HdgYDu3A5dYgEkkquHinv/DbNfnj0jb3F9qhJI6gabs/HvcSlMB1oCJ6wawK0AKu63RwPvxHi3XIHqnMtbqp96g74pMKOjs8Xq3PbQ5DIGd01lhIn1lHhuZRt6kaZhTGl5AJtVapzTVZxjpq4ZOx+raC/pmi5yG6tRXxzWt3FWyDIAjDyJzUUSsb1+ZH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6428.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(83380400001)(82960400001)(85182001)(86362001)(38100700002)(54906003)(6512007)(6486002)(6666004)(41300700001)(478600001)(9686003)(8936002)(8676002)(5660300002)(316002)(2906002)(66556008)(4326008)(66946007)(66476007)(6916009)(186003)(53546011)(6506007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzFYcnVGRXlzckVxdVFXTTJCdU0yZjI2RXdTUExQM1J5ZFVNWDVYNnJwZTV3?=
 =?utf-8?B?WDMxSlRjaXcvRFpQT05PbytJd0d6TlcwbnFhWGVxR0hxQzhwMFQzK2JQNVY3?=
 =?utf-8?B?cGcwcVlycjJTSThmSEdvVE1rYzE5VmxJd3ZOOHl6SUJqM1dJd1RRbXRscVRF?=
 =?utf-8?B?NEtuSnhuSEIwaE5tVlhST3AzYkpnV3BwcllObW1GdFhmVE14UlZZN3NqYnQ0?=
 =?utf-8?B?NlVZY0tnVVc0TG02WFI5Qll2dkhveFdtcTF5S0p3NWxKcXovbTJiRjlkdUl6?=
 =?utf-8?B?YUl2YWtoZlhHUzR2R0JsRW1tR09BNURTSFRIOTdHOXhjTXJ2eXRCOXhmdEJQ?=
 =?utf-8?B?a2YxV056eXJrRGRIdmJJSkRJeDVpMHZSV043UVQreURobFR5N3RXRUFHTlhm?=
 =?utf-8?B?ck85V1gvbXA4RjUwYUZwUnFRNVNOc0xpYlRWQlJDbkNwYS9jMUVRV2lBeklE?=
 =?utf-8?B?RGlxMHNIYVgrWHJ2alpOdW5hYXhSN05JeWJHeGUwUy9KS0ZKRXBOK3AydE1K?=
 =?utf-8?B?ZUFSRHJZTk5na3gxVlpla0lsSlpFTkNoWUxLMzJjTll4U2QraTVFY0YwZytF?=
 =?utf-8?B?aGFZaFQ1VjI1bm9JR3RLMzFoMDFEUTQzQW94d29WRTFhMWlqdEVoQjdpamV6?=
 =?utf-8?B?S3FDTElQdjdTU09TbWxvQlRWL1psOW1nWHd0VEVMUXpqaHY0a3FyY09sRk1m?=
 =?utf-8?B?UCtrb3E3cXFlUkRsSFMxK05iYlZ3RytST3ptRjQvNGxCajVweit4eXJGK3NC?=
 =?utf-8?B?b2QyR05HVkVKUlN4Z0pUSGoxWDExQmFkMFNsUCs5L3Q2UUFVOW9xc1NzOHJj?=
 =?utf-8?B?OUxuR29zME1xS0VQaitMUEU2WWxaVzltMHFjTVFSMjd5YUtnQVdRSk1DNzRS?=
 =?utf-8?B?N3lybS9aV0NZNnRiWkNaSFFsdHNhR1UxSkp3NEdwUDhmWHVXMEl2bC9tUGw5?=
 =?utf-8?B?eWIzR2dDWWhsdGVlOUhJcEZoV2hrZC9oS3FUcU5nbTRUbk5aNTNJOGRhMDg4?=
 =?utf-8?B?aWpIenhRUkcxY0w2ZjJMREpTMGw2ZXFpVW1maVZ0TytkbDNnYzJsVFlNR0Jq?=
 =?utf-8?B?Vms5YXVoN2xOKzZqYWE0MTBzVkxtWjBLVnBRSW1RKzdvSTd3YndSdXlLeE1B?=
 =?utf-8?B?emZrelViZFgrdERRdU94Rm4zdFE4UmQrS2xXaVFOMWVXR1NuOGlsV3Q5Mm5V?=
 =?utf-8?B?cWhCcTlJanVaOGxSc1hoT2Z2cmswVG1vMG8yNW52enQ4dmVFcmFURW5wZkJE?=
 =?utf-8?B?UHg5ZGZkdW03Wldwb1lBTnNhQ1YxSVA4ZkpCRnBpR3AxUE5kenZYcitDa0Q0?=
 =?utf-8?B?ZWpoc2E0TWlIU1FxdXZuVEl1Q21JVkNOL3dOcVBVZkl5NmRZYm5HL2VWaitE?=
 =?utf-8?B?WG1xM3dUdU1MaEJnOHJOQWl5WFpSUjYrMTZmckR3OHF3Q1B6dW5LUzE4enNt?=
 =?utf-8?B?VE56Ym5WVU5zWGpPdTE2TGMxR2xwY2R2NHRycThCbmNVZFhXQXV1NlZsT0JD?=
 =?utf-8?B?N2pwWTVtMFZrd2J4OEZLaFEzbkNaY0crVEEydzYreWlvUkgwbFlsYXdmeVNi?=
 =?utf-8?B?MjZENTZrQUpPenlWdjFSK0NOOHJ1RGZlNnUzUVZ6OVhYV291MEFlMklSZjg1?=
 =?utf-8?B?ZlFWUWZEeXBzVzlLZG1LdVM1c0RpcWQyY0FnUzdwZ3R5bGhkUCtvWHhQQXNX?=
 =?utf-8?B?Lzk0TFpLMVVTQVZ1QWdBT1JwNWt1NFRPNlhBTVE3OXprOEMrRlhxVDlpSWRP?=
 =?utf-8?B?d28yVEVGU09oWFVOVGxERTdzT2tjc1ZvTTNVUG82aHFZWmV3QTdnV1NRYlV3?=
 =?utf-8?B?bk9ZSGZ6VFJqWlprZG9jOVdrbzQ4c3NWcE9BVlc3eFdiM1BiK3lDekpWSWhu?=
 =?utf-8?B?Q3J5SG41RFJUS1Vzd1FnbitPNmxJdTlZV0NkN3BYdklxcVRYVGZsN0c2M0xr?=
 =?utf-8?B?a0VjbUord0p4TE9CMXZVZTF2bTY2UWhva0ZBdXBJSHFQK0NkOG5MZXgxbFNP?=
 =?utf-8?B?MFZ3UWpHdG95MkZkejlKSlQrVkNuMlJTY0RkbnZ3c3VFYzBHZGxpQUd1RUVR?=
 =?utf-8?B?TlZqa1hmRjVVc2tYNWRQN2x5VFI1MndtS1laTzlhMWIvajBEajl0a0tBZFgy?=
 =?utf-8?B?cXFsSnFKd0dYelZzdis3NWo1Nm1SZVJkR1JuNFpxUVU2dnpYeWVFNTBSOUs0?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a4A0dSL9R4fjjbIKM+sxQ9eR0B/Ske7siNGVFJctSc4jhpCbwFM9wjg4oLMq/RoVU5WqLrahgD33mtTkTmRVsA5uBbWYDb3EvbwS+QpdZ4d5NMEQ5MuOseWI2bbwSyaRv/WAQhxCFHp7De8bZjBUYLbsYX/DMcga7GFodRjEyLJ0FvEteYHOkaf9Kg+Cf8ZGnjOKuueXdhK8c98GUYjXS6seZ4ojrbNpL+DW7JGwbav7QSYyg3I0DLhRJjSxhcN1luly4SCGBN5/fQ1C/mZy6VaNQ8Sxn9woZ1QWXbEl2mVYkSagReiChBLLRe+vwjvjLUYduJ5nwRd+LSiH3sIFYlf5CiT5TOsEHRmJgXAS+DgwUps/64oTpST2oYhYAj4cgMHJAI54JbJoXW1VuuzXqQJWP9aFCVOEYmsMoZKmj9haAve5VqFm6nVmfYZUr6woWwea37wgMptt5Y98XVAq3BuysEyGJuLw1bKJxpkdEk3i99EJFv5ECa5tGnQ1UB0R4U01+D2Z7OMCIn7ZqlQInUVha+4eL7w9Qv1FY7cAtZ8rLCkJ7QLhM32hXSwIdlpNYVS5EV09HrApPejJlAW8fXJHaLWdZIVRq97peV3vifURQmzPxrOeH98cSVozeF/VBpoJsgcpkONZgCS2vsxxj6dAFgV5egeB4omhprjfTCYJ4I5st0kIRACLab4yARs+93b0IhQZdc9dow1ZPe5IcVXKEjqlMPcOyxWiYRvL0Vv9iuhCUihp52y+M2kd1/q13t+G+CIgEdskhVczQaCJz3nP9+mwiKOlSB9MBgH8A0jxTxUWRcb4O7hTwv5YRJa2
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea254808-07c8-4bf3-83b5-08db7ed2c34d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6428.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:13:09.0472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMesH1FySVbiWiCoov/n+IEPad6Cakq7AP6mkYJFqy+I9zMZ3sX5N/OS0aHSLPtS7scwgYqcarjFWaYb87bUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4914

On Thu, Jul 06, 2023 at 12:41:58PM +0200, Jan Beulich wrote:
> On 05.07.2023 13:47, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -795,7 +795,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >  
> >  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >  
> > -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> > +/* Return a pointer to the character after the first occurrence of opt in cmd */
> > +static const char __init *get_option(const char *cmd, const char *opt)
> 
> Nit: __init and * want to change places.

Hm, yes.  I assume that placing it before the return type is not OK?
(static const __init char ...)

> > @@ -816,7 +839,54 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
> >  
> >      if ( gop )
> >      {
> > -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> > +        const char *cur = cmdline;
> > +        unsigned int width = 0, height = 0, depth = 0;
> > +        bool keep_current = false;
> > +
> > +        while ( (cur = get_option(cur, "vga=")) != NULL )
> > +        {
> > +#define VALID_TERMINATOR(c) \
> > +    (*(c) == ' ' || *(c) == '\t' || *(c) == '\0' || *(c) == ',')
> > +            if ( !strncmp(cur, "gfx-", 4) )
> > +            {
> > +                width = simple_strtoul(cur + 4, &cur, 10);
> > +
> > +                if ( *cur == 'x' )
> > +                    height = simple_strtoul(cur + 1, &cur, 10);
> > +                else
> > +                    goto error;
> > +
> > +                if ( *cur == 'x' )
> > +                    depth = simple_strtoul(cur + 1, &cur, 10);
> > +                else
> > +                    goto error;
> > +
> > +                if ( !VALID_TERMINATOR(cur) )
> > +                {
> > +error:
> 
> Nit: Labels want to be indented by at least one blank. Here I'm
> inclined to suggest indenting to the level of the enclosing curly
> braces.
> 
> > +                    PrintStr(L"Warning: Invalid gfx- option detected.\r\n");
> 
> Maybe better PrintErr() and no trailing full stop?

Yes, please adjust if you don't mind.

> 
> > +                    width = height = depth = 0;
> > +                }
> > +                keep_current = false;
> > +            }
> > +            else if ( !strncmp(cur, "current", 7) && VALID_TERMINATOR(cur + 7) )
> > +                keep_current = true;
> > +            else if ( !strncmp(cur, "keep", 4) && VALID_TERMINATOR(cur + 4) )
> > +            {
> > +                /* Ignore, handled in later vga= parsing. */
> > +            }
> > +            else
> > +            {
> > +                /* Fallback to defaults if unimplemented. */
> > +                width = height = depth = 0;
> > +                keep_current = false;
> > +                PrintStr(L"Warning: Cannot use selected vga option.\r\n");
> 
> Same here then?
> 
> With these addressed (which are all mechanical and hence can probably
> be done while committing, as long as we can reach agreement)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

LGTM, please adjust if you don't mind, otherwise I can send an
adjusted version.

Thanks, Roger.

