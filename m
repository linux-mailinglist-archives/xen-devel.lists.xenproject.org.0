Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 008126B03F0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 11:21:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507984.782201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZqtW-0000hm-Ab; Wed, 08 Mar 2023 10:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507984.782201; Wed, 08 Mar 2023 10:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZqtW-0000f9-7b; Wed, 08 Mar 2023 10:19:38 +0000
Received: by outflank-mailman (input) for mailman id 507984;
 Wed, 08 Mar 2023 10:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hjp=7A=citrix.com=prvs=424740bbb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pZqtT-0000f3-TQ
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 10:19:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4e6503b-bd9a-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 11:19:31 +0100 (CET)
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Mar 2023 05:19:04 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6523.namprd03.prod.outlook.com (2603:10b6:303:126::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 10:19:02 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%3]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 10:19:01 +0000
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
X-Inumbo-ID: b4e6503b-bd9a-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678270771;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=e69zHL8OzqVl5Z5efYW7BW4bCNgE6pRHW+H0nI/cpKU=;
  b=ZoecqbDm6TajbSL8jzPSVN93Evm8VxyluQsTDQWwMKpHy5wrdlwVD9bQ
   V20kGUdDObpzkdelhwaFu6lHfp0TPSfwn7/f0G20a8K9PZ7Q+HbEAeiKO
   GTDQVV/Xi9hB3hL6q25lWY+o2CFhejw/3TAKPYvGFb6x0UBRN4aHao/Tz
   Y=;
X-IronPort-RemoteIP: 104.47.59.174
X-IronPort-MID: 100379393
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:X4EVSqiPWkJRHHoCEAZ7rcPnX161RxEKZh0ujC45NGQN5FlHY01je
 htvXWuFOKyOY2OjKtl3PYi+ph4C7JKDzNVmTwI5/3tmHiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5weOzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQYExUhUT+noNuI3bCybLFGm8EvKfPkadZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGybLI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjANlNRebprZaGhnWo+WMdNCxIfme9/6SVlhXvSepxL
 Uktr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9URX5NkcHbC4ACAcAvd/qpdhpigqVF4k/VqmoktfyBDf8h
 SiQqzQzjKkSishN0Lin+VfAgHSnoZ2hohMJ2zg7l1mNtmtRDLNJraTyuDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:TgA0s6zT8Clfe1/9vCppKrPxS+gkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrXAgWVxRAXVhJI2PMH/X
 LemwL0y62/u7XjoyWsmlP73tBzop/M29FDDMuDhow8LSjtsB+hYMBMSqCPpzc8pcCo8RIPnM
 PXqxktEsxv4zf6f32zozHqxw78uQxeoUPK+Bu9uz/OsMb5TDU1B45ogp9YSALQ7w4FsMtn2K
 xG8mqFv94PZCmw1xjV1pztbVVHh0C0qX0tnao6iGFea5IXbPt0oZYE9E1YPZ8cFGbR6ZwhEs
 NpEMbAjcwmOW+yXjT8hC1C0dasVnM8ElOvRVUDgNWc13xskHVw3yIjtbgit0ZF0Kh4Z4hP5u
 zCPKgtvqpJVNUqYaV0A/pEaderC0TWKCi8cV66EBDCLuUqKnjNo5n47PEe/+exYqEFy5M0hd
 DoTE5Yj2gvYEjjYPf+kqGjyiq9A1lVYA6diP23v/NCy/jBrfvQQGK+oWkV4oudS651OLyeZx
 6xUKgmdsMLY1GeXrqh5DeOK6W6GUNuLvH9hexLKm5mgvi7XbEC5darBsr7Ff7KLQsOfF/ZLz
 8qYAXTTf8wnHxDHEWIzCTsZw==
X-IronPort-AV: E=Sophos;i="5.98,243,1673931600"; 
   d="scan'208";a="100379393"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdRHSaPRqEtThCUiThKN0AE6d1hwXnmLKL3ZThrwiTGKJBA05MzJsSxvY8VQF9YPRfrTzyQRJUOJTwvdTudEomsLLor+XaFhRSiwKlDO9W/uiNGon1hwjrafEcs6x1pqxWus1hOdHZxoT0y5v6taGu5dsc5pis6xUaYXJSfmUQD4uXbK3ezfbgq2ZeqMLxEBaaGpQ40DX6Vwt1FUtAC9qX/AX/5ipkJ525G8xec4jyfrFsUkQDVXSG0JjGJW2HZyibEssyVlzSXYEv7GSuHgqF20vYCoRLSnk+/n4gFKYh9BgTXPEuauRD4HyP0NhcInBu3YMvCZ0/WPJb64wwsavg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWjauIYPJsZD0zs6ewMc3BigbWV0VeCop+XPc9hY2eE=;
 b=kBXDI2aROJTnrmYCz92hTg7SAH4QayjTjRAiMtU911tw/8zBIC3DQhQB+fKJUQAV+glGvogxUfY56kfKILurmxG6ERyGaf8he8+mMjdQvBVweqplN0RBrYn258/P1bVBXkIDCG7XBy6wv3jkkUaJcZ96ddN645v8ayk1Iw3YEd7OHaSxGIdGyFkhxDnGNmfAPAktp9mKg7JTK7ePIof2zWimY5FRjMdzhMDg14R3w1J4GIihc3Bi+22DpZxmI4ateA3FwBEc8E7nFeFuzKqUnMsYBszecRRwmXJvIUjM6Wu5TBeT/R4wD0JuyF0v9TyoY0Ev/fWwIJ3UEDFGEZptNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWjauIYPJsZD0zs6ewMc3BigbWV0VeCop+XPc9hY2eE=;
 b=e5s9RroNbjtNLsbGbHqFk3EUnuH5jhffSF+vndG5cgpEVOQlNJitT9ehHDoIdOgHdbnuseRdDmO5Vt4J4mDG4Zhv7t6HM7YqAyl4T9hWb2FXZQRj7aGPMZJFteVddZ5LxfNPoLB0+zsPaOcaknqi4isoI4qC4hwG+ZxomtNV40o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 8 Mar 2023 11:18:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/tests: remove vhpet tests
Message-ID: <ZAhhEEz9vOLvhptQ@Air-de-Roger>
References: <20230306162904.7831-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306162904.7831-1-jgross@suse.com>
X-ClientProxiedBy: LO2P265CA0505.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: eb07cdd0-cad7-4e85-7377-08db1fbe8996
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x2Y6FXKwcfBeTJ2BEKkgCdJDk9Yfua/xv0F6KK/6TWxRFuHf7GedzDJjXG24lvi30wjtngXZeRiESxioOPhbnKQdmhrFwIRaUiUgPNOTyjINDck7xVXuR4RXa3hIaX7+5umDDmiO+fSyzqlQaPrTgzwQxl1e4Qo4mJNbiLa6rtNTVuX9tWdfAVFu2RRUcjbSm8W3Iwdwm/Zw2XFHodsSN/MQ6korG1nN2sMirGP1uACfWNxBXg7b2K9SMcXaplUDdyvl+tJjlXnS4OaHi+SejtouzwDbaWWbe05VYGCscbOhVgAAWxOE6bJDjz/fcOFJkjVLBPJmZmLhyAf5tClP7QqFiTkNcDkwG3B6L+nm5nzSAbck9RQB4+/wDmjF9onuq4uHO+FBnK6ri/5i9bWDgcHtd6lOicaVTPaSNFceKy3avE+KYK+GJ8vcSGhEFnCaSUPvfknsudTdXjei21oN2YF3XuAUXCFxiVxgwaFxcZjw5Qbv3NmbBkW7qDWf7kWaNAfA13ANq2Hm7QhKAXF6MWc9Hog89lAl8d6j2cGEe63GKsBfvAQIsgaY5Hvaed2yxpYfKZjKAaypRr7Mf/0zdJMuqEV9QTLJ3MQ0jArPwKot6QVzie9NJ0PrOctnT50ffy++xyTRU6cHmV5cAz3KHg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199018)(5660300002)(8676002)(85182001)(6916009)(4326008)(8936002)(107886003)(6512007)(6666004)(41300700001)(4744005)(2906002)(86362001)(38100700002)(82960400001)(66476007)(66556008)(66946007)(6486002)(6506007)(54906003)(316002)(478600001)(33716001)(83380400001)(186003)(9686003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3BqZjBYTS9uK2Nkd3psMDMycmxYUHRqSENpeUNrWW9ta0xvMmpQcXA5cVhk?=
 =?utf-8?B?Ynl6TmxkRXlzTFdPUDhXRVExcEsyRW40Q0U0bmdyUm1teGh0c1EzOWhVaWVr?=
 =?utf-8?B?Vld3SXlPSWRJaSs2YTVQNndEZlQxMWZrTktvODFxSzFtdTJaVGdpRVpHNlJU?=
 =?utf-8?B?NHVDZ0hpbUoyZHZjTk9MUkk2bUZwREdaWmhlRDVkZlplYnZMQjRMVkVSOW8x?=
 =?utf-8?B?amZIWnF2eVkzcHRlR0FkVWh2TkhZek5peUhaeU5BV0d2cHQ0djg4Z25qdWta?=
 =?utf-8?B?NWpsZ2xSWUtPNXFiL3g1eVlMQTNWZjR2OGFvY3crbC9ZWXE3TWZLdGR6Mm0z?=
 =?utf-8?B?SkNJejdBa0tyN2pBNlZJUU9nTS9BY0gvTEpjb0lIWEhtTjR1M1NyeUpuc0VG?=
 =?utf-8?B?amFzeG9SSHVpUFhEN2thRWt2VjFpOUtaakZBcTU1azJ0dFJJSk5YcHlXK0hZ?=
 =?utf-8?B?djlhTjF2Nm1GZ3BlZVpJVTJlM3pqMVIzV0krQWZIMmU2azROakpudk81SXJB?=
 =?utf-8?B?TE0xWXFNMml1YlVONGhuZzhxc1ZUM0x1bkhNaDg4UVY5SXhIaEZ3UGZmQkZT?=
 =?utf-8?B?cTlzTHh5MmhGUGpTMk4vVkkxcW95VDlUK2UzLzlYMEtyRFBTMFlrSGlRZFBJ?=
 =?utf-8?B?SEdELzJNKzJsam9uK3VJeldUaW5EUDJFdDY3QWVVeWpzUi84WEVyVVU3amYr?=
 =?utf-8?B?NVUwM3ZNdFB4TFYreHcxZTVuVW16ZGhieXpZWGo1dXp2ZS9ndFU4QkRBdjJH?=
 =?utf-8?B?cjQ0L05tSWI1WFp4RTJXRmNvbWlFQVl4eWN4WmRYd084UEJmWnI5UU1RK1Jk?=
 =?utf-8?B?c1FpbHlkUDUwSC9zZWVwdk9GbGV5TGw1Z2VSVDVyWXZnQi9GUFVuRnN5V0RI?=
 =?utf-8?B?MVBXdzkzdzVLQ2pHdkVNQkxnZ1htVi95dE9IVWlUZ2tlRWhrZ3NkNlEwek1x?=
 =?utf-8?B?Sy9rd2dSTmhlTzBvSHBNRStmcVJPQ2dmS0hpMy9uNzl3bXd5QkJOM0FDNzYy?=
 =?utf-8?B?TjhVT0dmVlZuSHJWWUVVUmhTdFpVdy8yNHEwSU10N0U5VG9qUWRLaExqb1Ra?=
 =?utf-8?B?d1RCRzNZN21UZ212YWJLbWZWT1Jtb0lKT21zMkVZRVhaZUpEKzN0Lzlvby9T?=
 =?utf-8?B?c0VYREExT0JFaWg4U2FwZUhCTXJKeG9EUVdoSVJ6czlNZnNzRXRqN3J2dHFz?=
 =?utf-8?B?NmhvVzBLWWhWcW9KVWZKMWFjOXlLMWFLRVV5bHVGeVhlUTZwSlZHcGo1eFRm?=
 =?utf-8?B?bDJ1bjhEa2xKcWZETXBQdWFKa0pnRnFwcEljbTRDTEIwL2ZGcmR4SmhUNVRO?=
 =?utf-8?B?SHFuS1ZIUHhnVXd1TUdScUh6eUZYbGxDNnoxcTZhSUhoVTlYOGJQK2k5UW9Z?=
 =?utf-8?B?ckEvQUZyODFudzROZUd5cTZSZFIvRmpjRmpoQUlqcklxTm8zU3pNVlE0U1Mr?=
 =?utf-8?B?djNEZnZ5c2pXbVludURLYUdOR0V5UE9lTnBlcFF3cmUycFNCTXp6akE2dGEy?=
 =?utf-8?B?NmtEWVMwSmlFejYveW1xb05HUnUzM3UxbWgyaCtlcDZKTVRvYWRLc2ZzaUJP?=
 =?utf-8?B?a3RSRm51TTNuQlppWUd2VTZucTBrZVJtOWVtSlBqVE5KS3Jza3NEaHkvYThS?=
 =?utf-8?B?STlQQnNuNmx5K0ZKbE9NRjdBVE82TEorL1M5VnpqUmhSbXE4M2NtY3lMSTlq?=
 =?utf-8?B?eW9yTCtZdFJ4UEJiT25HTkl3cUFBa0piQmVvdlc0dWh6MEMyY2psSWp2UjBV?=
 =?utf-8?B?d1dZMUNhYjJiQXk0RWxxTUo2QkRseitEeVdYNEpmSlB6ZCtaOHRpWGpxNTNF?=
 =?utf-8?B?RU56Y3JDWjd0c3JrMXhINDdnTWxsUTNmUW5yQ3NVbi9haVpRQXM3eXdudXdt?=
 =?utf-8?B?dy9ibjM0b1d5V1l4ZFk0NDdqTDRWMjFZdGR4cnNUNWxCa0I3clFMVFJVYUZh?=
 =?utf-8?B?NlBSanZVeWZtYVZ0UHF2cVF4eS9nZEJZZkdDVXFkT3Q0ZERNNTM1V1R3VDhD?=
 =?utf-8?B?VVN6Y3A2UklmcnlzejkrZXpMR0NNRU9Bbzg3NTk4aFhRS2w3NFhIcXdxMWJu?=
 =?utf-8?B?UTNUM0R2WFI2bEZJNVlkK1h3Z2JXUld4YXlmN3lkdk9IcVR6aytJdGpvN2Nj?=
 =?utf-8?Q?/g5xo4VrpfXn47ZTeoLPiO67i?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HvVI525ua3+q8dll0p6+BTadAt7q24TIeI/vTfc9SQ+4G2dAuqHC2dkg7tP92BQwmFCwdBe1/Rqrg6jlzcg0QaNzdz1SE4SGMQT/oEYyj8gdUfQygg+3K/bBcdwNQi0/fNtZoYmjIDuDkUaHhIR9eicQSZ1/nMJLJsPK6q9MfgypmDvBB9zH+nphhqgk3NrJFuchyyC5JHPGGWNQtdyUx3THFYQZ1UzWmQm28t7yxCtVdojbqqKCj4HU2R8EFKY+zhB2oZbt9xFIJH8nN+jFcHaMREUhEzT0OZYak8WvSqi0Gsg1J841MWPkRwNj9pSsqWDV1jr65AMhrt/+kbq7Pvzw44U0Ur5oDstu+Bh37QbgB5Bv1l0oC/5lPmeRGoMC0zIvMgE7tSzroVBfcOj0jKvZfoP+mfI0DhdglTgz49MNedKrQJL9EwtW7zvyEE/Qx0CdrJGWx4tNiIFrraYQOeEwJnBn/K7bkqIm397/QCR+yO7xsTuUdxAmPXP2u+w929TCmXZJiNM9ADc8z58SGlZvooWgjrHKjPvPtk/9FhOicBVo4B9lx50mjliDSZHiCFKGEISFq8ExBXG0/dVc0oYM7SJUP/ZLniOBhMz25k7733wBn/T1isOLEIeFNtH0usbDAG3eQwLf1Z8YJ3Pi6PH6SrgFuOpHh9LyhXZznK4pVGDGkjAsj5LlY8FC3EkwO5C8TKcWRD2HoGQ2k7TWNoZRV5YFMZBCILW2caIsHsIU4MPCBv/zI0/tNNhRFovBGWuod7Yqe5F0+biaM46uEmZ+gLJteZ3Gye1iQ97NebbGY046lqr4EW6tggdAkE87
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb07cdd0-cad7-4e85-7377-08db1fbe8996
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 10:19:01.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hg4jbAZvBbtYWzbDQk8TAS0DbwB5ApbHZPQTGdaBo2x/sJm6OmUdpAlSsLiP18okove/L9xpTiPczPwjW0neYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6523

On Mon, Mar 06, 2023 at 05:29:04PM +0100, Juergen Gross wrote:
> tools/tests/vhpet tests don't build since ages (at least since 4.10)
> and they can't be activated from outside of tools/tests/vhpet.
> 
> Remove them as they seem to be irrelevant.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Andrew seems to remember that Roger wanted to keep those tests, but
> this information might be stale or based on false assumptions.
> So this patch should only go in with Roger's Ack.

Everything I've done related to the vHPET was tested using XTF rather
than this unit tests. I don't think they are useful as unit tests, if
anything we should consider re-implementing them using XTF.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

