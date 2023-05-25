Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4A710DC8
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 16:00:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539621.840710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BW1-0000Qq-AH; Thu, 25 May 2023 14:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539621.840710; Thu, 25 May 2023 14:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2BW1-0000Ot-6m; Thu, 25 May 2023 14:00:29 +0000
Received: by outflank-mailman (input) for mailman id 539621;
 Thu, 25 May 2023 14:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/c8s=BO=citrix.com=prvs=5022a0095=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q2BVz-0000Lg-Pl
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 14:00:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ea16526-fb04-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 16:00:26 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 10:00:15 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BLAPR03MB5396.namprd03.prod.outlook.com (2603:10b6:208:29e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 14:00:12 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 14:00:11 +0000
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
X-Inumbo-ID: 7ea16526-fb04-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685023226;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UzuLL46ifWJg12q8nFWFBXxUcWdquULEjhSJazPxAZg=;
  b=Ok02U3jqZRlO5mcHum+huM3Ta/5bxyjxo/+oulRoeNfyqCzTTNCU4AcU
   FmbUUtlZA7Y1VnNfU9bJtWHyqJduhFU1HowUFS35fw8FZWrLl2XbMaAre
   eIubsa+dJal/EhuxB/NJodqqPCTS9/qbI0bFbNRiNewRrOcSHtSOO0YrX
   U=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 112878800
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dLb+aayoD3zKgwu/Jch6t+cCxyrEfRIJ4+MujC+fZmUNrF6WrkVSz
 WEfDG6HaaqPajP1L9l1boS/80JUu8PdyoNlSgA9rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP60T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTlSx
 +wdMAgBVBa8mb2c67GdSdFmlMt2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMvuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37aVzXyrCNpKfFG+3uZG2laY4EpUMhBVbFurhKiG0FeaV/sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaJSkQBX8PY2kDVwRt3jX4iIQ6jxaKRNAzFqew14fxAWupn
 G7MqzUijbIOi8JNz7+84V3MnzOroN7OUxIx4QLUGGmi62uVebKYWmBh0nCDhd4oEWpTZgDpU
 KQs8yRG0N0zMA==
IronPort-HdrOrdr: A9a23:5OIwUqwsfY7DfCiltpS2KrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: 9a23:01yjRG/b11mCTrTOMeaVvxYIKNAgakXR9nHvPRCSImVPS4WfW1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A44xsBw8N+U9js+7hLjcFXu2Qf99Eua+lLmZKq5h?=
 =?us-ascii?q?FgsmUEH1PYS65gB3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="112878800"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJmhjsPiio2sIzs49AtnoHUHIRSnvFXJbTQbXiB3x9t0+w45foD+C2fJ6kCsBRcTx6EltCtabzBTUj4r+UiFFGgYv/f1/GSc+6mrq/OSVG+/8faGx+lHJ8KStTdJqdFMUNRmnmMv0KNM+TrEFynrmZbdeV4nr2XDNGTXqGLxmrBBJ/BSXu0OtsB/lZkVZOE6xXWQorcAoXslLRxOBZSkJs9vYdRa5LzFzGOm95c+Y/wdrRsa/kaddCS2bpA51kjFhzXB/0d89TDztXhBjMhvKImZJperQdcvhnXtQ8Z4ND+q9N4qZYHxqJJ2hz427j8BUhAOC7yHJ5kb9aCeXWEDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5p5DJMD7fDdbhJkydkRr8jPzzmZu4eJ1AyYSH/VK+Y=;
 b=FPuCRxPaP8ToefFLfrNU9Y+4xgT9kJDHHUpWlCAb9jRNen31mKcuzhNsFukZtLoEiGyKjMnbXSNELo1w7/kdmm4nvGH7aWY/kd2yefMtxsdsFZ0Tc2el+k+iaH9fHLw45XwmjGeyXClPjGuQ0+cAiAlcRkhI9RTGP4gsllnuFEMGCWBBPxvsq7zNp0/iekY370GMi7Vk2zKRFi6UP23rr3CceHOujiQjRR8g0hf2eN5oRnxl248/EQUrEWjhGv+Te78ILQmYmycvk4xQHdG2ImcMdwn3WDY6rq8JZSfnR4qLWDy5eWP1jsy4YhnL9f74VgIRV58LyTnaq0J0+UHCxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5p5DJMD7fDdbhJkydkRr8jPzzmZu4eJ1AyYSH/VK+Y=;
 b=Q0PjpSlJLgUEoeALVZyBxlZYaABtB5Fk9NxtM2ULWpymT364HUy6VwDjv10ygp5aP+3uwBHpqAFTqk4RjgVmO3sGrewzBa05Iw1l16vmgAUTGnV2eOG8Nlv3+Uvwqoec0DaEWBj07NaeN1lB0NAqP+hgfE9Fd7yUbHY/NiOhvKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 May 2023 16:00:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v3 06/12] x86/shadow: restrict OOS allocation to when
 it's really needed
Message-ID: <ZG9p5fhfEw3I5bez@Air-de-Roger>
References: <184df995-e668-1cea-6f9f-8e79a1ffcbbd@suse.com>
 <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c05fb6c-f71e-1b86-6146-96f2b3f3c9ae@suse.com>
X-ClientProxiedBy: LO4P123CA0679.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BLAPR03MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: 83eaa2f9-aaa6-4bbe-3148-08db5d285b32
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I3rPpO/g4kD2MnMy3kChqVn/vUFGn4HLjIbOje4nL0FYLNtvCKmg4ygBeIqH4kmcI4bAXw7iuRaqS4Y7GlXzM4GugfYjrpK0GC58vwNMiOlpYJQnSxvMRQ2FqWm3feK7N6MC+lg0iLrLniSJ+2Gp6bozQVwQ26n3ju1ztcsk1GhUXZAuzIW4wScsUQhvputVIAMTDIRG9RVJT68+EH12cTsvKCn4aTVFYBX3ZjhroVQ4MDx9RzWORHY9rY3eVI5xj2pRLy4pKb5ycfbkOtk5SaxrHeayqWUBFIZqwnbUl/0HznV8GtkYbg52aJiCQLzVi3EgQhJJJm2A2AeRoxwngcLblQ/BNp0LFVeeo9MT3waFQetRMk5WCm9EiIVT0gG1EYOuK4jZQG1y4JmGik9T+48aTaB/kUgwL6w0cMnnhviYzJgRfozx+XeLEb3K4XLlsWbrx2BMdu+ov+Hd7eDOYhSzaKm9ezXdjmngWrvtG/O2tGM3QinOczUMTjVnYtx0UyTshzerD14JiD1fWRGAWAqeu885YKdkd+r5aY5XAvF0uXCQ1NddXYY44lB3ML99
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(478600001)(82960400001)(38100700002)(8676002)(8936002)(5660300002)(6506007)(6512007)(9686003)(26005)(6916009)(85182001)(66946007)(66556008)(66476007)(83380400001)(33716001)(316002)(186003)(4744005)(2906002)(41300700001)(86362001)(6486002)(4326008)(6666004)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmp4ay9oN1BwN2NEOWhYeUprUERtUS9obXdKbmV2UUtDOXMxeWd6azdMZXYy?=
 =?utf-8?B?SU50dU9KcERqeE16VWtzUzFGOVNiaXFDNFQvNGdBQ2dESmRWTWdkWUxSZG8y?=
 =?utf-8?B?MkErOFpkOXdhR3JNUmVhaDRndUtScHZqRitRaVVuZUdKYnR4ZGhmbVpCWXBK?=
 =?utf-8?B?YW1ZM1k5b2xYVWhsSlpQVHEyNmVJaDRSc1Z5cTc2cHJkYTJHcHVkRlFwSnM3?=
 =?utf-8?B?R3JiSHhrR3FadEp1Zk1PZVRXdFRpYnBNSUNvd0I5NE9zenJSTlZkMkpMb09w?=
 =?utf-8?B?a3lLc2E2KytpTFdDeDl3MFR3MVUyRzI2amNoL0p6VDJuVEVsUnJqWjNSNEFh?=
 =?utf-8?B?dUFwYlkrbDdkTFd1ZFk2WWtBTW5SOCtRa0NYOVgvWWZDNjZjTDNvemVtbkdx?=
 =?utf-8?B?Z1FLUHJabXZWR2VnM3ZHWE1EMmRseEZMbWlCbjlGMUQrdUpWYzJUbWVVTnhl?=
 =?utf-8?B?MzVJWjNOR0xsQXU3dFNib05VOVk5WnlzOHhjZDMrclRDcVlVc29YdkRxZ21K?=
 =?utf-8?B?cG5KTUw5c1RtbW9UOEFrTVZpVnVOdzUvamZ4T2h1ZkQzV1hXZERocE04NDVO?=
 =?utf-8?B?cnA1WVdqcHFCUStWMW5yNWRJL0VQT29LNjMrTUZQN0RxYnVUcnRLRjVmTVRG?=
 =?utf-8?B?aEV2dWwxMlZHL1V5TVUxemR5cGp3bGh1RTBmYXRzeHF6eDJmdER3RXFGR0hH?=
 =?utf-8?B?WUxnZlBhNHlvdU5iazllS1JtdVlXNEFQeTd3aFdjVHdRelJkZndJR0VCT0Zy?=
 =?utf-8?B?Uk1jc3Y4dFVHa1M1eFZRV09waE5OWkNmTnlOU2NMOU5Hc2dGYzlGTGR2T2dq?=
 =?utf-8?B?ZzRyMnpPaTNpTHpJeFhuN1hVNlBqWVBnR25nb20zcVhFK0JoTW51TUxBbklJ?=
 =?utf-8?B?d3BYZE5lZVhvd2JiNTlrQ3Z0M2xicUg4aDVGNDhrZ3N5K2NaZGl5RmlOWkdn?=
 =?utf-8?B?Z2tqQjV1TjFxYUV4MW9PeGR1Ty8yTHFuLzVualNySHM1TlNqc3M0a1FvSHlh?=
 =?utf-8?B?Q0FzZUtFTGd6MytPL2RpWnZKZUxrZ2hzc3ZOUHRzbEVtc0pkZDZKa0hTQUFT?=
 =?utf-8?B?ZjNjNXMycE02em1wUm1XYzlpNGEzS250OStHQW9OaWpqVHpZYlNxaGZXMDA4?=
 =?utf-8?B?aDdZTXhsaDVOQlVmaGRwbHNqVXpLTDVOS1VsdSs2K3VqSTUrdVJZTnRMc0RK?=
 =?utf-8?B?b2RzUzhVLzVoU2RCSnpNTmRlR2dHdmNnQThONUc4NEZ2SjMzVWVNbEZOUHlP?=
 =?utf-8?B?Tjdlczh4OW00VFIvdHFlWmRuUXExekdlSnZOdWtTUlZsQzh0VlA4ZmU5TjM4?=
 =?utf-8?B?VnZ4bzliOEN2cU4yUTZVVTFTVHN6Y0p1VnozQm9UekFNaTc5ODhENE9vTVFJ?=
 =?utf-8?B?Tm0yL2xSQlFacDdWT2I1VzBsbG5Samg2ZDlkMERBaFFVMDByR0NmK3owRmxi?=
 =?utf-8?B?Y0FIa1dEQ044enJNZEltWjRTVWRaQ2ZaUWJ4N3oyTkFCaXprQTY1Uk13ZndY?=
 =?utf-8?B?L1JCb3JrdjBZQTZJN0xwMEhvT0E2Z04wYnZTTEZNdTZET2ZUZFRhWS96K0Mv?=
 =?utf-8?B?V3FZcGowakpTUStqQ0hyWE9ZRHpwMkIzVzVPL0s1ZTlMWHp6TGZPeVQ4cWxR?=
 =?utf-8?B?N2lZVXZvSHJnVkgxbFhKRkVtQ011UHhMRUd2cXVxcTUreEp5RjNaOXpRRnli?=
 =?utf-8?B?WmhTWEg1RVMrK0tqdklZSzNjcmcyWCtKcXhOOHl1ZDdwaUlVU0laZlRVTUZp?=
 =?utf-8?B?bXhhSkl1bGRyWDdvNnk1VkxCSE15R05HOVlFSlJqWnVNNmMzQkdmaHE5R1ZU?=
 =?utf-8?B?V1RCYzZiWU8rNE1uTlNOV1Y1TlY4dm81TFFxa2ZaL1oxZXNwRUNaRjRpdHJw?=
 =?utf-8?B?ZWdnK1NRUzcrNEs2YWszd3gveHBDaWJWMERsOUNDTzdmVVpkaE5GR2tKWXRI?=
 =?utf-8?B?N2JJR1pBZS9naVhTR25ycmZ5U0JjcDBuN1VsSDg2YlRSSEFLdHpUT0c0N2lx?=
 =?utf-8?B?eDBDOU54d3JCQ2VidEJEb3Z2YTlOU2VmOGR2VVIxOTZaYk5TOFlyOXRMbUov?=
 =?utf-8?B?cndPcVJMd0hyTnlQUW9rUUI2MGk4ayt2WjJrLzFuNWlSaFAzc0Y2MGRONjBU?=
 =?utf-8?B?d3pnTldBcDdaWXZORTZob3doaXIvOS9velh6aVNhanlxdk84NnQ4dHBGeDdk?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FU8wEwqmwbsOZdlj6mavlYez2RfJn4Q0nzHNztsVkszq2wcUCQUgEXR6Q1yOCWBzFj7PYg+7g5cMv9183q0i4imoC+k2kICWeIA4Z9UOG8bKOfuH+WWe7q/vz6DspfNgDGAgAThh4g0ESAqOxQv9fWjyeT9gvKyLhhu68Jh0hjkXyezWsiv+R76VPWceH69LhomAOyFDZS8+iTf+nLTjc4KiEcBY/TTgqy+uev9wc+TWcqwxiXLDEvVhARToZSrCigfYbpi9svAYJzop+Gp4vRfdQkuykVrHZCaG4HXDQIhnWfjCHqN4tykymVS02Emc0vdUltdowCZjW6GTlJnJfyzJ/2Jo/I88yq0TC27DHEG7NZ+p9mS5lgsjDm7WKHfCYHJAj1MBwf24pA2zk02iqFFG2JekEfksblXgy43p80AzhxBnQooq098vOw9eDM+uIBKPArUQN4iG6yp1CwliO47CBTH0iBEkZfAwdVbimOoYz7i6v8WXE5QvVFHfhKkWOUERakBsz8b8sVLoCcWjReUtH+7LnHYsB82bGnw88lgqHQGN97AmbNtvFqeopcM9YVAIew6P+er7WeiVxCb5ds6BndOXpVq6OwBus+YekqNZmyfJAhmH/Kne2CB4A6I5cknI875Faxz1QRv2bQHMClRy+o3utvpiGUA20x2bKAKIAsbLowiIcgq8Bxs2I3WAFsA265FV78irUkMXxRloQU+4mNuNTDu01sFCjQOShNod2JZQ/a3HOFmNn34cIbH3zvu4F56xKzxdsodPwVagU6Gijx0Dgqu0/VVFp3cCJP7D/kDpjeJWUltvyyNFQj4w
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83eaa2f9-aaa6-4bbe-3148-08db5d285b32
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 14:00:11.6462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIZDqaOzGjzJWnXGTkwmXmbIRSVWuyWPClNaVferEhSrSfIHUax15FBnMHEzXXzN7GsBiBg8z3YsmcWySgqf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5396

On Tue, May 16, 2023 at 09:40:22AM +0200, Jan Beulich wrote:
> PV domains won't use it, and even HVM ones won't when OOS is turned off
> for them. There's therefore no point in putting extra pressure on the
> (limited) pool of memory.
> 
> While there also zap the sh_type_to_size[] entry when OOS is disabled
> altogether.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

