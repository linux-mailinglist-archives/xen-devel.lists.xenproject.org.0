Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D24BA504
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 16:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274865.470479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKj5W-000636-HD; Thu, 17 Feb 2022 15:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274865.470479; Thu, 17 Feb 2022 15:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKj5W-000615-E9; Thu, 17 Feb 2022 15:52:58 +0000
Received: by outflank-mailman (input) for mailman id 274865;
 Thu, 17 Feb 2022 15:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/h9=TA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nKj5U-00060z-Vj
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 15:52:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa86c7de-9009-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 16:52:55 +0100 (CET)
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
X-Inumbo-ID: aa86c7de-9009-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645113175;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=T2txGOiXiKki1sdU0KOuGz/sQsnPCagkFj3I0aACfks=;
  b=btJSFocz6yp1knq93A+dMqf3+1HpLRKsAdNLT8nmE4apQ23DVbyXAK79
   jeWI/KEXzm70vahFoN7h3wf7K9c23PSi0SLzG00ueFaBU2inGS8XUQF63
   SJ84rdyvFySEbbwzd8NaHNWIRqpV++Nf58IoydHKMsES6Y8hfGnoZ4pIK
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4q56oXGDLr+A3UgP7yg6nzt5T22SEW+lgLxrZ4cn8WH8e2xxkjo87Iaq+ARIuBJOojvYpVqVLW
 vg9CbsGd2pg2m2aV5A3I7c27JxfMpKLjuhFUMl8N0zLBAUyQVYgsiRBGecjmabRGyUIeJFuBKY
 s0UiG65sI5tvbog47wi8m8YJYf6f+ZWRj0rV1xSiiXFtcE3fTbGF2Od5Ia5tr8PXMlB3NLFoDF
 t1X4NZqaqw/UjQvBu7IYvk7wygh3jjvhn1NFg/PEyzqSb5pfep/PcmphIe5kDaSR/VV1zuK+De
 wekmCDaj9mc7koxxbrvR66ED
X-SBRS: 5.1
X-MesageID: 64446626
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:yWs+qq+JfK+Z3jrcc2/wDrUDXnmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2sdXmyBbq7fMWLyfdtzaIvl8EwOv8LdyNBnG1Ftqng8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3dYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhxy
 88WvLeNVT41GZ+Xm88EDz5XNxphaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgGts2J4UQ54yY
 eIjcmFGRx+RfyRVI042Wb4Ds/aQr3bgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tlaVo
 CfK8nr0BjkeNceD0nyV/3S0nOjNkCjnHoUIG9WQ9PRnnVmSzWw7EwANWB2wpvzRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiH6HpEUVcOdMKvEd2lqO4bOIxAm9PXdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNslIRiG2NPdXABb3nARBodtnxor6p5
 iVspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/INgLv28ieRw2b67onAMFh
 meJ5mu9A7cJYROXgVJfOdrtW6zGM4C7fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPRmk8ADrOvOXiMmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcCkgGXaaTvJVrYZ3Z9RqnoWJoj/3s3MTZ1ZQSj2mQ5YJbp56AaLsNlcb4i/e1l7Ph1U
 /haJJnQXqUREmzKq2YHcJ3wjI1+bxD31wiACDWoPWokdJl6Sg2XptK9Jlnz9DMDBzacvNclp
 +HyzRvSRJcOHlwwDMvfZP+14Um2uHwRxLB7U0fSe4EBc0Tw6ol6bSf2i6Zvcc0LLBzCwBqc1
 hqXXkhE9bWc/ddt/YCQ166eroqvH+9vJWZgHjHWveSsKC3X3mu/2oscAuyGSi/QCTHv86K4a
 OQLk/ylaK8bnExHupZXGqpwyf5s/MPmorJXw1g2HHjPaFj3WLpsLmPfgJtKv6xJgLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtfllcl/n4CJX/aacVRQANhaBvyVRMb9pPd532
 uwmosMXt1SyhxdC3gxqVcyIG7Bg9kA9bpg=
IronPort-HdrOrdr: A9a23:imhk0KqQSqtxvui+/p0zcSsaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,376,1635220800"; 
   d="scan'208";a="64446626"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVwy/fv9IdQn3yliLflSQyEm1eze9lx+K/IN/XCUR/gcXd0/e7wl9LC1GGfDA37iT8kPCJn62n4JzWYADXqR0zygqRNjwwTbwGAbR9kgVJc3J1I+I6qPyUHwTjPqnUjUC4Hh6zWl8J1hcYqVhWlLNYaegbQtdFhMl1qSJ/jO06WH1CZ3tiw01KSJLpMOW7FdsNC0G8jJlkddaL5Od+4yb9wR04rYhkX0XncEk50GWxs38AtbTQ7dvKzEyD6ompqwbO0ZXzkjqASZmMAMQsY6bQ/QZiOqbeTQndr3COMJfEH12D7nrY0wWsQiA71b8iGPwD2jg9Stgln9bxXwC2md/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koOWlH8ydSAqujxyjK1NQtAxTr+mx/9U1EGpVfw8e5w=;
 b=nlujufLqctb56JMy76SJGSbI1iXZ/mUmB97aG7Ucbl6pn/FJ3qhyGduVLOsOBkxfaQN36zyJQGV9aXWAfcYcDWZPmCCjdd3IX3rzYdlQZphRecUsKfEw6MX3n6+zvt4gE4Di9QIU/aHljxd7CTTnxIPr5XI1kX55bSieNuaEIZnr+ZBPMIkB0bgkjb5rtvN45PCLBhvk1fTaNUBD+AMe78x8GPUgTLNmvd301ncfethOkGtYvnQYjsNsPnGkkb989X2I7zfERnLrwzeyN3o3CUo7iOz3RNh5pFc3ua6Y4jwdeCXyQlbcH/UnqBkmgoL3pot4MHqEaxrzGeOK6811Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koOWlH8ydSAqujxyjK1NQtAxTr+mx/9U1EGpVfw8e5w=;
 b=DWhgg44pRrZZMjSzAfTOdvKciRN8lTfc4nEsd1ypnd4bUqWs4kZevUOut/o2qtaBUEcv3C0yisrT9HpfP6p2ts7beW/aPtr86w4DxsBvhZe83EIPd0gd7BM4rK8Wf00RWs7opMHIcpvXl/cNVx+cupT5/3V9Msnd1zBa9ITh1ys=
Date: Thu, 17 Feb 2022 16:50:04 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH RESEND v2] x86: introduce ioremap_wc()
Message-ID: <Yg5urE+rpOQGWiH9@Air-de-Roger>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
 <c56aadc8-e568-4625-5d6f-bd2b8981f3ae@suse.com>
 <Yg5gGenFpAwZqtSW@Air-de-Roger>
 <34dac738-0631-f80c-a3db-7367e37ec0b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34dac738-0631-f80c-a3db-7367e37ec0b9@suse.com>
X-ClientProxiedBy: LO4P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::8) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2effffd-5721-4851-aed6-08d9f22d2c9a
X-MS-TrafficTypeDiagnostic: CY1PR03MB2299:EE_
X-Microsoft-Antispam-PRVS: <CY1PR03MB22992246BE6954996D8F0CC08F369@CY1PR03MB2299.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ble3DOrO0wkPIACn9v4zDUBwoOBQHKqapUbbhugxrwkKUNtIE8db1X0nAHIaJwXouwo1V/DCXF7ta/AwDDgpxM3ms0PqLPb0p7A/qmdACRXzc3SmHyb2uD3hiO1DKx1EjScV29r0rmpDDKn6NB/7zczWP1PyKySC3OmJ0oPr1ohDH7SBP+yzdNHzKp9pG+QBFQOZ/0ofcgcfyWrBZC1kKGKJOhLzWClillL0n28iC1o+txzuTrYUr8i17liAqzoYSmN0u8X+Su/e25DYM8tC2j2QJYlHbrGE/jzR0VeDyzK0ye5HkFMt+Dlza6VnlZlw8zATyPIQb9JkXve1O2mAQYUC51oKBeVnnxHYYbBhcMOr1ovegBhbQjkoYXEfw9/+G6ES3q0r4AShgtlrJgfma2D98uuRL4TG0JNaHiPOHwEHBpQfT01ymVq7vyZMEb1ME1zc8tHjSJAzeDzCVUv0wBQJC2U4qLGYRWOQSQ2wr0+es+4YA4hzn+O3n7f76tsG19gysk5lzkuBC7PQQ1Km6umYlGeYZj6iRgRuG8SPNATCqquQbr0n9i+GWA3jfEggdpprvwo0y+6Hr8IY7rQnJ2inLXp/xT7wQe+tp3D+Ch1WzEhxU5Q/6M8wUynvwhiwGVANmGNca4Gv53tQp2mwz0136WmYsgyFymW7euZPVHeRp+AO9iHUU8IalIcRhbZ5z2b02xkVtFt+qrcn4A7V3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(6666004)(82960400001)(6916009)(6512007)(9686003)(53546011)(6506007)(33716001)(8676002)(54906003)(83380400001)(4326008)(66946007)(66476007)(66556008)(38100700002)(5660300002)(6486002)(2906002)(508600001)(8936002)(85182001)(86362001)(186003)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhhWDUrdzU4Z2xCVlZuNldDaU9iUmlzdk8zWVVuY2RvYmthbEYzK3BNeUVr?=
 =?utf-8?B?VUJLMjVPQXZyQ2Fxak14dHd1QXNwYVZkMHFVK1hLOTRLaEZzV2I0WUc3dkRM?=
 =?utf-8?B?QVhwOGJkcTk5VUpGNnB5VVo5NVVDdlpHR3RwMzdpSm43U3lYN1lRWnpjSUhn?=
 =?utf-8?B?TE9KMEo4cXkvbENWd2I2YmtwYnliZTF3QkNQQnJSV0NMTE9KQVY2eWZZcFZR?=
 =?utf-8?B?YWttaEk4RTRXMmRYc3c2TEsyMlZMcm1mVWFseFJtZ2hrdFR2TzFzRElNeXVs?=
 =?utf-8?B?K2llNDQvWm5kRGVFM0JrSHJqZzJpNTlaZGROLzNIdGlGUU95TTJrQWs5Y01B?=
 =?utf-8?B?SFhuZHdxVnNFWk9NMmRLTEU4UmQ4dDhkYjQvQU1mYTkxWUxndEpNN1V0c21h?=
 =?utf-8?B?Q0M0V0VpTi93b2ltUU5IazlPRlNZSGZneU1pTk4wRTBjQ0hYZmVOaEp1alNJ?=
 =?utf-8?B?WGQyZ2YxNm91MDZYbE9KbFN3alRNMER0bWtna0Q2L0ZIRkdzTVpKRG9CS3lz?=
 =?utf-8?B?VmpWbzhwL1ROOTFpTStZa3BEb0hKZUlJR3JQdGY2cGZtZFZxUUxxSUwwZ3Mx?=
 =?utf-8?B?TWJSa0NoelZlb1B2YzdrZGZtZ2kzcUltQnFJbDI5MWh0akdaSWxuUTVWRzFJ?=
 =?utf-8?B?YkxRTXk4bUdjdXM1cGNyWmpvOUlsTUp0L3p4VDgvRTJGWEV5dUlPbFVMN1Zs?=
 =?utf-8?B?bUxBMDE1QTFrZW1VRkpQbzVBTkNzTHJ3clNXT0ZpM2FYN0M1VzI3R3F3eVUx?=
 =?utf-8?B?am5nT1hYaytCT3JQbHliQk43ZjRqbUZWMnFodStCKys2SmZpK0QvZWNVUVRR?=
 =?utf-8?B?ZUloQm1TVzh6M05neGY5UUt3VlFHRzJDYzZKVEFGRVhuWTdLVVpFbEhSM1h6?=
 =?utf-8?B?UWZwb3dzTlBXU0xHVHBQN2FiZmZBc3dqdnpJZkN6Z3lPZ2FQSUlqK3hxSG1F?=
 =?utf-8?B?dVg3N0hteWlwdUp1QTIvUjQyZGhUalhzTC9odlpsdUE5MENkNGk3UDJUcGJY?=
 =?utf-8?B?V2NBL1BNc1phVG4rVWsxejZhcjQ5Z2xYZ2FZMWxEeVVjQm1TdkMza1p5UFBZ?=
 =?utf-8?B?VUJMdjgvcHRMemg5clRnWTRxWTNDUHNSSkJpekF1SnljNkUySGw2VFZzNUh4?=
 =?utf-8?B?SHArR2FERkNNZVE2enYxdi9BSGlpZmxOWUxaeGpBKzgvNXMvc2w4ck1RZkZq?=
 =?utf-8?B?azFlOVUvZk95L256ZXppOUFUb3lmaHd6aDFWcVBMNUpBQ1FSU1U3YTQ0cXJx?=
 =?utf-8?B?NTZuNC9ZV3h1S2tsSmVXN2dDWkk0OHE2Q1MvOFBnRmIvaDJtRmI2cWREeVhE?=
 =?utf-8?B?R2tGUW5qL0lJallsUlF1V2hBazhkV0ZtZmlqTjUrRTNqK2UwaHlnTlVtN1dr?=
 =?utf-8?B?eGhlTkRLcERGeUZvb2Z1SllrUUx6Zk9HbXpveTZ0TkZoVUlQUmt6WFBDZmRX?=
 =?utf-8?B?azYyQXNBS25EMnJUdlJNSlhDb0ZCSlRIT1BnUXhIb0dOUjNJcE1XTHlwT0RS?=
 =?utf-8?B?SGR4dDJCazcrRUEyd21YOEZpcTdIckNZNlJQczFyTTJDdmlmWjZiaUZPdHlD?=
 =?utf-8?B?M2FpRXdiamdVR0g1VEw5U0xPRXM2azJ1MzloM3g4SFEwWEdwbkZBakltUGJt?=
 =?utf-8?B?dUdTR2V4a3RCS2h1cVlsaDNkWW96MzY3dG9vbWduNVNGelo5aDZyRVk1NEFj?=
 =?utf-8?B?ZmM3YjRKL0RSV2J4MHNSUDV5K3ZybGFVZ0JEYlRSbnJOYjAzL0VrQ3h2TFdG?=
 =?utf-8?B?TENqRFFvQ0FNZC96VWYwL2FqMXhIc3FGNVNVSDZxS0lKKzBQWklVRno0dmRF?=
 =?utf-8?B?TitFSDFUeFV4aFRERGlLWXNoTVFlRjNwZ2hyWUV2Vmk2Y3hraExXMXVFa3Rp?=
 =?utf-8?B?TWtYdm9CRjBGeVR3UGxLYVVZQUVOdXhwSExIcTA3K2YvZWVKYjRWcHBRNi9R?=
 =?utf-8?B?RG1EcmFBZWtUZ0szbzNFYVVoQWNSaHJIMjlzemtCTmJVazY1ZlFVNkN0N1dO?=
 =?utf-8?B?aURFZGR4L2cvQlJvdmZObnFOUWNZRHNwSEJ3Qis4aExqNTJXOFJFRkY4Tzhu?=
 =?utf-8?B?aGl2MzM2eXhzOGhGeFVPUEFNdnAwdnVVbStWWkpzSXdBaDc3MTVXeGVBNFZq?=
 =?utf-8?B?ZUVOLzVuU29jeERQcUhvWFMwWG1icmp1dFdPaXl5cmZ2Yjc0cTJ2dUVpcEdZ?=
 =?utf-8?Q?4o1bsMYytAbUblokiJdjSMU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2effffd-5721-4851-aed6-08d9f22d2c9a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 15:50:08.7920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoqG6FTKzFJA71TNwv5IeTj5ES+dDk89md+xf2I/kcnvG4XyI+BeJWYtD0LoiQNURtSVAhZRWTpfO8LyXWnQqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2299
X-OriginatorOrg: citrix.com

On Thu, Feb 17, 2022 at 04:02:39PM +0100, Jan Beulich wrote:
> On 17.02.2022 15:47, Roger Pau Monné wrote:
> > On Thu, Feb 17, 2022 at 12:01:08PM +0100, Jan Beulich wrote:
> >> @@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
> >>  
> >>  static void lfb_flush(void)
> >>  {
> >> -    if ( vesa_mtrr == 3 )
> >> -        __asm__ __volatile__ ("sfence" : : : "memory");
> >> +    __asm__ __volatile__ ("sfence" : : : "memory");
> > 
> > Now that the cache attribute is forced to WC using PAT don't we need
> > to drop vesa_mtrr_init and vesa_mtrr? The more that the option is
> > fully undocumented.
> 
> Yes indeed. You did ask to re-send this patch in isolation. This removal
> is part of the full series.
> 
> >> --- a/xen/drivers/video/vga.c
> >> +++ b/xen/drivers/video/vga.c
> >> @@ -79,7 +79,7 @@ void __init video_init(void)
> >>      {
> >>      case XEN_VGATYPE_TEXT_MODE_3:
> >>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
> >> -             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
> >> +             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
> >>              return;
> >>          outw(0x200a, 0x3d4); /* disable cursor */
> >>          columns = vga_console_info.u.text_mode_3.columns;
> >> @@ -164,7 +164,11 @@ void __init video_endboot(void)
> >>      {
> >>      case XEN_VGATYPE_TEXT_MODE_3:
> >>          if ( !vgacon_keep )
> >> +        {
> >>              memset(video, 0, columns * lines * 2);
> >> +            iounmap(video);
> >> +            video = ZERO_BLOCK_PTR;
> >> +        }
> >>          break;
> >>      case XEN_VGATYPE_VESA_LFB:
> >>      case XEN_VGATYPE_EFI_LFB:
> > 
> > I think in vesa_endboot you also need to iounmap the framebuffer
> > iomem?
> 
> Again part of the full series. I guess I was a little inconsistent
> with leaving the VGA unmap in here, but breaking out the VESA part.
> It's been a long time, but I guess I did so because the VESA part
> needs to touch two files.

I think you are hesitant to include the chunks for the above items? (or
maybe I'm not properly accounting for their complexity).

Thanks, Roger.

