Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2817D56157D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358341.587528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyQ-0007qx-7n; Thu, 30 Jun 2022 08:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358341.587528; Thu, 30 Jun 2022 08:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyQ-0007nf-26; Thu, 30 Jun 2022 08:56:30 +0000
Received: by outflank-mailman (input) for mailman id 358341;
 Thu, 30 Jun 2022 08:56:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pyO-0007Q3-6b
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:28 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e8486b-f852-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:56:24 +0200 (CEST)
Received: from mail-sn1anam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:25 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6699.namprd03.prod.outlook.com (2603:10b6:a03:402::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:56:23 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:23 +0000
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
X-Inumbo-ID: 84e8486b-f852-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NjywiNvb5PqoOaAfnLLHWPA+CBvHvcnWE3RraIAqnd4=;
  b=fEfZ/7yXPSzmFTILuGV/HUMKiLQavf4y5bvGVlhnVlzqItCy0Ai3aocT
   a7AsCcn9CGfMolho/YhumxxQKQsZml4rsKYH7WbXXPNuGYK/+qt276xdA
   LFSbZwzNrD0GhtUab6AnK/Jzk1CMyrs7KCl+BDNJWLBPV+umrZ7cGlC2W
   k=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 77339801
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fRhvy6AfV+KWZBVW/13iw5YqxClBgxIJ4kV8jS/XYbTApDIi0GEPy
 DYXWGjVbqqMYGqkLt8lbIrjphgFscPdy9dnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bi2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhpm
 Php7oTqZTsTL6Pwp+FEbgNmFgFxaPguFL/veRBTsOS15mieKT7X5awrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8yYK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7jz3SivK2QwRFS9/Ic1xXDKzCJIirmyLcTrZtDJbul0txPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yENopTYZUttUVvY8sQiLw6+MuQKBXDBYFXhGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb1Xojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:AgQ66KnS8M7KiqQ7Iyc+l14+1HzpDfO3imdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0msl6KdhrNhR4tKPTOWw1dASbsP0WKM+UyFJ8STzI5gPO
 JbAtFD4b7LfCdHZLjBkW6F+r8bqbHokZxAx92ut0uFJTsaF52IhD0JbzpzfHcGJzWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 X525RT5c9zp/AtHNJA7Z86MK2K40z2MGbx2TGpUCPaPZBCHU7xgLjKx5hwzN2WWfUzvegPcd
 L6IRhliVI=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="77339801"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrMfaK7Ad9O6gzvsf9L2fcDv2WVujNAFf4RvRLzS2knmlPSSK5WiVHIoEojUvdkTsJriakhvSdtqQBiBv9Q4AG5TwenNn316t5tBN6RIDVPOycdmSzVJ56N4Cj3OK1uLGROenHL/XTPtQ9bTxF9NPhW4zLOe8IQlRjnkCrIcxvqdG4hS4slyPFQw0EjHFBQqlug+ZMcIwV0ff5APB42t3tiaHBnj3iu4iFstopWi96BCNzkpMmVdPpvVdBKNg5dqGk4BQ1KXPQxhdn8Rd5wUbQB/xGO5emBn1T9e3+T9bouF/L1FYpQdJXM6V4BhsJgseA7ovTo+9ZZEGtrGhE+H1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euzhKLQqaFSC2Ezhbo0Ek1xKzO4ctm4oHFntZFUVdLc=;
 b=PciyX1Ek9nbuXzy+a3j2UOQBO1ZzksZrBnXeq8ttMqJxcRdO1C7ZEFF7aQKBzTlNFQqXONgsPqkEjAY58i8yna+/JPNYeLH6zekYavw/zjOu3EQDsvQVB5tK/U7YOrAAAdBwfE73lAVoZFTZ0rvht2PQ5LUYZOfCpcqlGU0nQVhRkgXO4xdXEpTelQt2X1PZ5Oa4nqbC9enb7TH+33fZEye9ScPPsUGCNAbOJgphcanfLSu1xzJqdYj0KDGGGl5cYjaHGOASFOjIUtPkIiJ8z8PEol0UGnueXpdYoX6t4bqvSJdBFTWPmEn3Y4BTXsn1g5gRan1bzCQIYvKscGy/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euzhKLQqaFSC2Ezhbo0Ek1xKzO4ctm4oHFntZFUVdLc=;
 b=L2ocW23meYFZSAp6ftsOyGan/Znxubb5V1uSTDj1F1+BFiEQvyxFjTznxPidYUBs9JsOyCEcdUTA8rRvO6q3PI14htrYBpqyeKWf05P/QWBOVkMNJgC/B72pBr8qjktnon//OJd0ygGROZAy+biDjuoFfPF6YAynk+HyUJvjzwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/6] x86/setup: init nr_irqs after having detected x2APIC support
Date: Thu, 30 Jun 2022 10:54:36 +0200
Message-Id: <20220630085439.83193-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0228.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dba2b51-ada5-4b01-9b55-08da5a76688d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6699:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RSmskpFO60T4doHraeENvE95tJImskdhT8bBtHK1O8Ni6XRameIIMYCXebbf+IJRP5mbA7K0Hc2Z9Nbd47xfvs2HG68HezL71n2Q3Bikjezt+HRVcnU1VljZv5tjvzcGvYVQkmupZ3nZaMuNCLUmHg+23ETjLg7FlxSc+SgedARQfPXN7UcyiVnplplAwLbx9VcwKcS4/q4+lNhG/e1QVkZr1gZ60p6UQj16j1Qx+Dl7jo3IWrvDoCOM67z4tHznHJPV3yBcDlszd83TMrr3hUfdVy7mV3HYE6/2prKVkGP+bGN1Kz1h8YTCr0i3gl41NtwqV7msXeoK/L8+oSSm56cZ8iDjdi1JsMMhqsugsXuK57xL+uxP1ph5UX+6UNnzuM3LIbrJbPwL6hLNmljZtWJAsON56oFTLrG7B/MFxB7JZ7HcaGbKDdShLG8y4hmxhfJKAknCsok5tItJpL3pogTY3r4QOH8hTFTtuD75oSJ/3e06nAzpMmfYwcXih9V8ISkrHe1uD8uJgK//JkVKwHBEwKeLlbxAsRzbavnasGpTlE9Hv//RGBCHTbSVa4pPOs02ir2qlvBJI7J8cSCyUPZvZli/VyLjwF3+ZchliyzwDkRLrsCAIYG6m0ND5Nef60WUowcrsKEZmpevt+JGbkgQ6WIH5dERv4h/2S9TNtstgFKA4NPxmNVd5gIWtSDhZPjBSs8qMKwYO15gX09hiN9BpVkohUDOjIt+Pk5sWdxPz5TYSkeZDr6kVGRt31Dt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(186003)(36756003)(316002)(2906002)(6506007)(86362001)(54906003)(41300700001)(2616005)(6666004)(38100700002)(6916009)(66556008)(66476007)(26005)(66946007)(4326008)(5660300002)(8936002)(8676002)(6512007)(1076003)(478600001)(6486002)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHc1T0xMTS8yckdIT0RnQUg0QU9JNFM1VzRyN0d2UTUwVzhNaFllWkVSei85?=
 =?utf-8?B?YmF6NXB4cTJqRnZUdFN5N2dxTDRWQVVBdElRbW8wMEN6c3JBRXdiZlprcW1W?=
 =?utf-8?B?OTlFRXgzNFBsRWV5bXdQQWd2b01SWVFheDJzYURwM0tLam04d1I0YzBvdld4?=
 =?utf-8?B?Y3RqWGt3VzhIb2ZDbndpWDhZYml2QWdmS1RiRmFkaW5ML1BacXdkTFJHVzJJ?=
 =?utf-8?B?RytZbTdRdXQvOWIxOUNsTzR2RXZ3WEt5V1kxcU80cTgraHFPVDBqaW55bTRH?=
 =?utf-8?B?RHFyU0NqbFZHL0kwNklJSldWSWJBSnFTckdDTzY3VDJ3aG01LzllYlFGUTVo?=
 =?utf-8?B?NERPaVYzZUUvQnhqSUp3d3cvVWZnTlpDNXdobHl5MnhaU0lIVWdXenptcUlt?=
 =?utf-8?B?aGplbW9UcXBEQTBkWDZNYkhGNW4ydnMxYWR5WkR3emRENERWS2NXVldnQjRo?=
 =?utf-8?B?WVlQSHJSM2J5QUlNcjg3WkJVWkQrNUpHNDBYckRHazJJb3hVQXd1aTJ0aFJq?=
 =?utf-8?B?c2s0TUluUC93T1FLaTY2UXJiMndRSUtTaEp4T2o1M3R4bUpWcDBWOHJLNllC?=
 =?utf-8?B?MCtuaS9UUVdmZDJva1hqUVN1TzNIK2ZzNStSR0NUcG1FVXVFZGVsWDQ2dXRE?=
 =?utf-8?B?dUlLaGFrWGRnUk0xSzRMS0x6YmxlTGxyOURuTGZVbWFtWkZsUzFoc3Q0VUh0?=
 =?utf-8?B?RXljbEU5K3Q1dlYyZmFYS2k4UG5XSG9JZU4zWnhIZVY1bmljSWtmQVJ2ZjVn?=
 =?utf-8?B?amFwZVM0MkJRSmF1V2RxelM3ckFPVEhqdXU5anF6YWNSU0pSbVV0cU9Cc21T?=
 =?utf-8?B?cnlncmpwNXZFUmVBOTUwZVJna3NoclA1UU9jcExkU1A0OCsydFpRaXhQUWJT?=
 =?utf-8?B?aVJQeGg0ZzJ3amVqSXp0WEEzeFh5M2w5bitOVVlyei9SYi95N0tUc3ZPeWtv?=
 =?utf-8?B?ME8xaTdCL2ZQMi9uSjBsT0hsemQ3SlRWSDdEUGFnaTI2aW9IS2FtaVMwN2Zr?=
 =?utf-8?B?a0FRalhmYm4zWDRJa1o2MHg4VzVBZEpCck9haUZxYUFIUENHRWYvWExpYnd6?=
 =?utf-8?B?WHkzY0hPRmV5SUlpNEhaQkZjNlZtSkxNR1BBK2FsbzBsU0MxSm15UkgvTDlp?=
 =?utf-8?B?aVh2bkhwQlZ5SnFUNVVHWXlhaWZlcGhlaTdJdG44OXVHTVgzckxQTmNPaGs3?=
 =?utf-8?B?OUlSci9OK1d5T09OT0llVUZmTENPczMzeC9EVHVjM0Zzbk50ZlRYZTJyeTFJ?=
 =?utf-8?B?WUVlTkk0Um1iRzlyZGpGMkF0ZXkwTUh0SEVia3RlU0ExWXlNb3ZmY2Fqc1h1?=
 =?utf-8?B?YXUxL2c2TGJaeXFTMkQrR0szWXkxMEllOVNMbUxVajIySGlmcnMxemFTQkFT?=
 =?utf-8?B?OW16KzI0WFlzKzlrbHU3anBCN0o0Vk95Z0JPY0srbE1UVnI5bjd3OGsvcXVa?=
 =?utf-8?B?T2l0eldOL0dWTXkxUllyRi9iZFh2eXdSL0Q4a3oyNW0yTEczUVFpbnpPbXhw?=
 =?utf-8?B?bTdPcHAzWElJL1JCTjhlanJ1dHBpUVBlcnp3RWlCQTVVR1M3eHRTcENBa0xP?=
 =?utf-8?B?djk5clk3Vm9OTU1OeDZLY00wbmoybDJWQ2Z4Z3hRMkdJV0xjWGJYYzdOdjND?=
 =?utf-8?B?YlpXTGlmc3BHcW9xZWVlWXhvN0dTUHpGZmFRd0dwNmFQZU0wRnhlZ0tuVGRH?=
 =?utf-8?B?MXp1TlBqWXp2LzloRzRUWUhwUWhoZjQ5eFFmbDF3MlZCMnBvS0VHeE9tRUNx?=
 =?utf-8?B?cDAxSDROUml5VFVJZCtoNit4OUJHTWIwYUV1UHZ5T1F3aWJqeDdTcXZwMEI4?=
 =?utf-8?B?Q1N4TlhXMFp3VHFUYS9UbGp4STBLN3FrT2srZC9mQWtNbTRQenNkQWxBZjY3?=
 =?utf-8?B?R0U4bk44dWVZM2VDODJZeW8yZVA3MTlEQTZPb2had293eFhpMFN6cHBxR0JV?=
 =?utf-8?B?T1lnQzVKZ3g4RFlxZkNpUU04Nm1XTXA3c0tDT2dmbzg0WUNYdUNKRG9xdWhK?=
 =?utf-8?B?VFUwOERBV1hWREJ0NFFabVcvbkVLV21LcHZXSUhyN29BTU9MQ0JuTUt6Sk1k?=
 =?utf-8?B?TlUrVjlwNUVicDhtaldpMHJZMnptU1NnZXVOeTB5QWxLU0dVWWM2VEV2MHhH?=
 =?utf-8?B?NFhRMmppQ3dYTDZ0ZHJOSE41a1R6N3FLdkNmK0pEbzU5VmNkSlF5TTVjUUtr?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dba2b51-ada5-4b01-9b55-08da5a76688d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:23.5128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIvN9FeLTEE6th6IPoflK8bGNPAY17NURLEe+yewHvio0Qt01cnzbl/iCGcf67UDZ0djsQULcW3MKbqm8x5vng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6699

Logic in ioapic_init() that sets the number of available vectors for
external interrupts requires knowing the x2APIC Destination Mode.  As
such move the call after x2APIC BSP setup.

Do it as part of init_irq_data(), which is called just after x2APIC
BSP init and also makes use of nr_irqs itself.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 10 ----------
 xen/arch/x86/irq.c     | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index c086f40f63..8d4923ba9a 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2653,16 +2653,6 @@ void __init ioapic_init(void)
                max_gsi_irqs, nr_irqs_gsi);
         nr_irqs_gsi = max_gsi_irqs;
     }
-
-    if ( nr_irqs == 0 )
-        nr_irqs = cpu_has_apic ?
-                  max(0U + num_present_cpus() * NR_DYNAMIC_VECTORS,
-                      8 * nr_irqs_gsi) :
-                  nr_irqs_gsi;
-    else if ( nr_irqs < 16 )
-        nr_irqs = 16;
-    printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
-           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
 
 unsigned int arch_hwdom_irqs(domid_t domid)
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index de30ee7779..b51e25f696 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -420,6 +420,16 @@ int __init init_irq_data(void)
     struct irq_desc *desc;
     int irq, vector;
 
+    if ( nr_irqs == 0 )
+        nr_irqs = cpu_has_apic ? max(0U + num_present_cpus() *
+                                     NR_DYNAMIC_VECTORS, 8 * nr_irqs_gsi)
+                               : nr_irqs_gsi;
+    else if ( nr_irqs < 16 )
+        nr_irqs = 16;
+
+    printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
+           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
+
     for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
         this_cpu(vector_irq)[vector] = INT_MIN;
 
-- 
2.36.1


