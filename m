Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB24A5C6F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:43:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263574.456320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsUl-0006BH-Dh; Tue, 01 Feb 2022 12:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263574.456320; Tue, 01 Feb 2022 12:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsUl-00068s-9t; Tue, 01 Feb 2022 12:42:51 +0000
Received: by outflank-mailman (input) for mailman id 263574;
 Tue, 01 Feb 2022 12:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JAuK=SQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nEsUk-00068k-4d
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:42:50 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75122642-835c-11ec-8f75-fffcc8bd4f1a;
 Tue, 01 Feb 2022 13:42:48 +0100 (CET)
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
X-Inumbo-ID: 75122642-835c-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643719368;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EKXA/zXgLXV9z0qkxZpEKH8SfDyWGKeMVqnvCkPibeU=;
  b=cHvqjxhi3vJFB398/oYZ6jzP2HMePtu3gpdPGur8Ox8DMMD9C27IKAfA
   L0ur6ZzO3PJbl4d3ZMBt5LGs5WL/ciJezUh9jpsDwGM79lIl/j6cLti7X
   zuIFmsVuSi92dG8tQTriX5mU1AHynk425dHqXFn/MzI98LD1U1Z6oyfMp
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pjyNzUDOy2I6UTixsbdiVhblYN7hD7YO4Dmi0BOZiPkxgCza4Sp3IrsvOUmdaYZ0sEpy8o/UzK
 zQ5uG9N5W8Cvx6tIe77x1l9DmfND1myRgly3SsZtyon7x7I3b1zNPRYfPx7YXpqR07PONkOaQt
 njacv4P/K3as6CO0IqSlNGsTU8zrZo1t6MBtgSCJ7WTFtczn7LT7TgmDTFzut+Tn16b2+EpAk0
 M/2iM6k60mQBhu+iIKKw4RlwoI0lbe/z8m9uFJouIgicnd3SchrFMx3xzYsZdxFyRJIvFoazv+
 qI6kLGZRP61WK4rPZFcGTP2j
X-SBRS: 5.2
X-MesageID: 63126644
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6UQOVK5ixP8et4Bz4KrHsAxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 jEcUWmEb/2DNGryKotzbdi2pxsBvZ6ByN5iSVRk+y80Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tcw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 OhgmKH3GCwTYKjspM4xTSgfSTxXIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmxp3J4QQaq2i
 8wxcQpLMzbGPkF0P0YpVrZlpuLyrGvdfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlakgzMxZp0BONdk7SGx4IbK0kHDG0EbG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnE447eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4jDGJGT9bxgbQ+0RqmBNzDJrVml
 CNc8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdsNsG4mdBk4bpdsldrVj
 Kn741k5CHh7ZyPCUEOKS9jpV5RCIVbISLwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2mHxW7T6NFPjTkkT2uZLDNSX9YepUbzOzghURsfnsTPP9q
 YgPbqNnCnx3DYXDX8Ug2dVCcAlXfSVnXs2eRg4+XrfrHzeK0VoJUpf56bggZ5Zkj+JSkOLJ9
 Wu6QUhW1Bz0gnivFOlAQikLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:4uotnqp7xJFXkEP/JsLnJuIaV5uzL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K13jDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2u
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LrEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GS1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusq8q+SWnqL0wxg1Mfg+BFBh8Ib1W7qwk5y4CoOgFt7TFEJxBy/r1bop8CnKhNPKWsqd
 60dpiAr4s+PfP+W5gNcNvpcfHHelAlfii8Ql56AW6XXZ3vaEi946Ie3t0OlZSXkdozvdwPpK
 g=
X-IronPort-AV: E=Sophos;i="5.88,333,1635220800"; 
   d="scan'208";a="63126644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+r6wUL3KqI4GWB919uZrSodm+now+L9U8G/hwoDnY/PPVfE/T8G+8DFxQ2bcUQGVMvS5f3oy3FpNTdAX8JxutMR2iJURmBPRovIB3lK12sjyvFu57UEi5Dr5CbgN7BX+jqB4ILz/REMFkrHChIGufZrz1tPd9mJsPSSAL+f9lDP93Vn56w1/t2+STdzDuevyNBskgJ+qhPQmGkucsAnQTnF3jXUcFNjuKpgbbYnv1WKkduZgDaax+CmZ/ShcuWPSJ2L+09S4z39LAivAUsrfOcRyix2gdzzBFwHrsNCTAx12tMVbtiESqlOmaFi94t0u2axa3pVf6m1svK8+e7C9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MveKamJP1IIkhybTRw7omUmM7WLAurbY3BVisEryNS4=;
 b=CW4xmc6SbE62UJJ+rf0eZLhWjuvdaKwq1JO6blB5qtlJQaN6Etb3+x8SK5V4ekeAckte3tW6unrhmHJ9z8nIxTiSVTFghaMOshsWvddDjT4l9dWrGAZdAr0ANvVXcuelpcMeivdY5RsJVFYOPJ7NKQxRPS2DUz0iDU6V3AJvI3bARyiVT2/BzNLirLKOZR1OW1BdJqSFjtlHRr4s5B/iSqPiHOXxz5mi95QCaVFvMlBizxV1pIILADlEBYkFFgkmZQ87wVaIV2qc6Y8/K+wKb6g65YDXnr7rJtDAcji0REUj/2KtJxaYcG0EI9fEoKA7IXd8n67wNpMescJgjSKvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MveKamJP1IIkhybTRw7omUmM7WLAurbY3BVisEryNS4=;
 b=Ndv0IW8ohzX/JC17C3PZJxcsueTDAXIg5yS9012xbaoJWGsCAmyPXBOHkT3LozcTG6DczH5FgqpSmFSfb2xDTmB45lMGGhPxYeasUXFjEBOztVMWFM9X4P+hKRuq9Doug2TSiLRUX/J8HHbg0Utb7/PF0UBYNZTkF8P3Tlhcm7k=
Date: Tue, 1 Feb 2022 13:42:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 2/2] x86/mwait-idle: squash stats update when not
 actually entering C-state
Message-ID: <YfkqvddlvAELr0ng@Air-de-Roger>
References: <faff6a1e-9f00-e924-9766-deda8f0b38c1@suse.com>
 <6a9152e5-1a7d-c569-3483-66f022027597@suse.com>
 <YfkTt1k4XLnZtaJj@Air-de-Roger>
 <2c6129b8-87ed-a3fa-f819-6318909bf2e1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c6129b8-87ed-a3fa-f819-6318909bf2e1@suse.com>
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dda22cf-0f95-4754-f9d4-08d9e580573d
X-MS-TrafficTypeDiagnostic: SA0PR03MB5467:EE_
X-Microsoft-Antispam-PRVS: <SA0PR03MB54675F7017A656B269B548E28F269@SA0PR03MB5467.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BkRFonu3VAf4JlFWW2ETenSi949Aq00FUayvIJUVqsM0c8aDB/0TcerF0iBo0CjFUkzuy2tVd7OIrlSxW/2rhT3yDlAbcjFO0UZN1IkleQMFsNBfyaIoPQ5cl3RCyYBf34qiS8xW8q3bbO2vIK2YVGJnvrBc+j3ooAJc0NNfCISj7ppApaajIGua1xitbOOGzaDU3kjrNtOVJXjnhNuJ0yxFaWswkslNkDYdIrMIXN71KmC7hxm51WSTXE1U3STEY9zpbvWSMPXk4BLu/ADo3hzh9C9+zkQKlwWU11Axc5IUAU6pK0MJ6o7GTtYobgpeMdkqNPC/HG0fpuWq3ic7jvefGXw6MBLihGBM5DOrGYASuyR8DDeIeJS+eL3w7sVqvFPb5aDDAe5ivcmDZC38r6NVeAQJrDkamIORT/it+LI88TIRGDbkprVTYBX2y4o/xqg7grjBkB+wo3uZ7QWO+DWbJ4euTly1fVxU11bMMCDWu3gCylehVhV6Pqo7JTuB1Ay18tMYitn/sJSC3j7ybncqRIUM0euXaXl8CblKIHGIWrF5jra3y3sZHbt9fip7icAp5e0cTgOdJzJP3otPZrkGyUbv7FErGTXY9uAQ+va5CMVaG4dqSh2aTVTSrGsIQ3aqdQ3vz/anniZ/KOknQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(15650500001)(2906002)(5660300002)(6916009)(54906003)(33716001)(6486002)(6666004)(316002)(8936002)(38100700002)(66476007)(26005)(82960400001)(186003)(86362001)(53546011)(6512007)(9686003)(4326008)(6506007)(508600001)(66946007)(83380400001)(66556008)(85182001)(8676002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01jay9HcmtmaWV3S0dUZTlVTU1sS0pjV1pZOFM3Yk9FZ1VZYlcwNWFxb1U5?=
 =?utf-8?B?UDIrNDJvR0IwT1V6U1U2OXpnUzQ4b2Z2TlZZSWpWazh3SUJxUlRBdVRQMWxp?=
 =?utf-8?B?NmVHSWRVZWdiSnNRRWNzb1EyUkxEdDlxcnFiQnpiM2cxWE9EM2dtU0RGNGV4?=
 =?utf-8?B?bUZtajMvMVBjTW9ZSlUrQ3JvbmxmRHJtRFI1UEI4VnZKL3lzTXhEZmdFUC9Q?=
 =?utf-8?B?b0hLNWhZV0pacVlKa3FlaGl5R2NvK0JQNWdqU2NqTUtyT1dwOVZGTVRNVnZH?=
 =?utf-8?B?ekQ3cE0xQUhmMnlCQ3l2cXZGV3dxb09nekhIMHdoOUZRM25lVU9MNlh2S3hw?=
 =?utf-8?B?YUZXRzM5ekhEMEVpSVl4VEMzZ3ZYa0dKK2FCc25DbTVXTnpyMGZLR0JtSmhN?=
 =?utf-8?B?cVkvMnhEY1phTW5wYzVwR3FHOVN2TUE4TFVxQk4xRUlRTnJwbEl6VVViYjRy?=
 =?utf-8?B?cHA0WGd1SXhqSmhJcUN4TmViS2tyUnRtUG4yZmt4QkxoWVlDcnNWZTFNdEts?=
 =?utf-8?B?bDBCdEhSNjk0b2V1eGZoblMxemdTamF3MU5MaG51NVNMZWh6UlVrMkdIdzRU?=
 =?utf-8?B?b240bkJuYUdlN29QZVFUbTJ6MXl4NGhkZWVRcFZPellkZnRVeHMwT0ttcW5H?=
 =?utf-8?B?TnhNcFRJL2tyN0k4RjM5MUZ3TW41VzZxWitwWUtwNTFqRFRnN0NHZ29qWm5G?=
 =?utf-8?B?TEJZZ09IcUlTUDk2eW1qcDkycmVYenlMS0hpcGRUMndMNFMxMHdnZ0JYMDFC?=
 =?utf-8?B?MEtmM1Nta0hRODhuNUZ3L09JMnU1SElvWTNIeUJiVkVSRnp2Uy9paTNiZW9P?=
 =?utf-8?B?cUw1Z3dpSS9OVHYzMlJQNUNIMVJPeU0rRmV2SHBwaXo0Qm5VQzBiSTFIOGFn?=
 =?utf-8?B?eUZ4aFZWRnl3WHhvZmRyV3Q3WmpJVjdkL21QanpPOVRuVzN2dXUvRnBYcUMy?=
 =?utf-8?B?VWdsYkExVVVFZVVsVXp6cjZtQjRRa2FRZTVMNEp5WmdxTmhzZFhrK09nSHpQ?=
 =?utf-8?B?YzB2YnhJT1JWSHBBU0NrRDltSGZlcElJTGhSUndFa3FIaE9zanBQVVp3TW5o?=
 =?utf-8?B?YkIxVTFiTXlTdURzVFczM0NEekJ2bUE2alZkcVV5dlNtTFhIVnFRKys4MXNJ?=
 =?utf-8?B?MmUzUUM3M01pNnVNdUU5L0NlalVFTDBnRURGRXZWRzZLSXJxS2RHL0xmL0lJ?=
 =?utf-8?B?QXpiMXRkUFRHNnlOTno0NjduenNOWVNNK2JNa1BYQlpDdFBFMWFocm9TNEdr?=
 =?utf-8?B?Z3pya3pJcFFFVzBtckY2TjlFRlpjMHNja3JvejJ0ZW9jMWxqc2RCb0picVJ2?=
 =?utf-8?B?L1JwbGUwN1NJa050OXZHTXcxTWNFRkUwMlBsY3lHL2Rmd3hTYm5KdDR2aFFR?=
 =?utf-8?B?R242ZnVNWm15cldxM3A2aTFTS09ZOFJMTnZnMjBJRHhsUGR4ZVk0UGxFWXRQ?=
 =?utf-8?B?U1hEZ2lqY3pEM3JYQ0s3NWlWbHMzWVBLSFJSUEhLWFRFVHlhZDRVVjlNNXVK?=
 =?utf-8?B?Z1NZR1B0TXNNNDNETllYQjNWaktFSjlsU3puV2ZYVStoU1JXSWEvMk4yc1JR?=
 =?utf-8?B?Ry9hN3FPcHVQTWlOQlRLd3NQYVZrSzM1YWtvbURJQzBkQklHNmJYWkpYVjgw?=
 =?utf-8?B?cTZORjJIejZKUGJRTHRsSVNsME13ZkYvTmVQN21RZXBNbkk1Z3ROcnlkQ1dr?=
 =?utf-8?B?cldHZ0ErUDlTSkNzQVYzemNGaTUvVG1KOFdHUjh1enkrelBjSDFacENKM1Iv?=
 =?utf-8?B?bGZYYTY4TTNLN3puOTdPYmZNZXJVQTEvVW5Rd3dWRHlGRys2Z3N5NzhEQ002?=
 =?utf-8?B?L1ZSM0VRR3hUTHl2NjZYbUNXa1N3Mm5ybFJSWHA3QjFucVdYZUthVzhORENr?=
 =?utf-8?B?dXc3RTRwTzg4bEx4U29JcVBGNnpic1g3MGlRSkQ3QVBNTHdhZFpKNjNrMVFu?=
 =?utf-8?B?YUh4YUZiNDdaVHlQelhuQjBuWjQyVFcweVNDbjB6d2g0cEN3eHdienpQTmx0?=
 =?utf-8?B?VHZOSDJUOE1YOUxvVXp4ZTFzay9WalBkUFVkNHFZejJmYXJjZ1pwWTMyWDVH?=
 =?utf-8?B?bDBEZzhZbWFtaXdXVlFVY3NDcFhGK0F2T1ZYNUp3RHc4TTVuV0NOTnZaZllC?=
 =?utf-8?B?WnZ4Y3BUT3RXcXpHQldnVUdLUndNcUUyeTJCTG4ySkVXbUJnMFV5aytDTmJW?=
 =?utf-8?Q?E14g7uDm6JTgwkSbVnYHMk8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dda22cf-0f95-4754-f9d4-08d9e580573d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 12:42:43.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lisoYtclH9KlK6Jy6XlYAUlxBexIlzJ4fsJuKWnm2Me7IKws63pkRR7HmSjwa102DMdWzk39TXJLAmvGR1d9+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5467
X-OriginatorOrg: citrix.com

On Tue, Feb 01, 2022 at 12:37:27PM +0100, Jan Beulich wrote:
> On 01.02.2022 12:04, Roger Pau Monné wrote:
> > On Thu, Jan 27, 2022 at 04:13:47PM +0100, Jan Beulich wrote:
> >> While we don't want to skip calling update_idle_stats(), arrange for it
> >> to not increment the overall time spent in the state we didn't really
> >> enter.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: If we wanted to also move the tracing, then I think the part ahead
> >>      of the if() also would need moving. At that point we could as well
> >>      move update_last_cx_stat(), too, which afaict would allow skipping
> >>      update_idle_stats() on the "else" path (which therefore would go
> >>      away). Yet then, with the setting of power->safe_state moved up a
> >>      little (which imo it should have been anyway) the two
> >>      cpu_is_haltable() invocations would only have the lapic_timer_off()
> >>      invocation left in between. This would then seem to call for simply
> >>      ditching the 2nd one - acpi-idle also doesn't have a 2nd instance.
> > 
> > It's possible for lapic_timer_off to take a non-trivial amount of time
> > when virtualized, but it's likely we won't be using mwait in that
> > case, so not sure it matter much to have the two cpu_is_haltable calls
> > if there's just a lapic_timer_off between them.
> > 
> >> TBD: For the tracing I wonder if that really needs to come ahead of the
> >>      local_irq_enable(). Maybe trace_exit_reason() needs to, but quite
> >>      certainly TRACE_6D() doesn't.
> > 
> > Would be good if it could be moved after the local_irq_enable call, as
> > it's not as trivial as I've expected, and will just add latency to any
> > pending interrupt waiting to be serviced. FWIW, I haven't spotted a
> > need to call it with interrupt disabled.
> 
> Okay, I guess I'll to the larger rework then.
> 
> >> --- a/xen/arch/x86/cpu/mwait-idle.c
> >> +++ b/xen/arch/x86/cpu/mwait-idle.c
> >> @@ -854,17 +854,23 @@ static void mwait_idle(void)
> >>  		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
> >>  
> >>  		local_irq_disable();
> >> -	}
> >>  
> >> -	after = alternative_call(cpuidle_get_tick);
> >> +		after = alternative_call(cpuidle_get_tick);
> >> +
> >> +		cstate_restore_tsc();
> >> +
> >> +		/* Now back in C0. */
> >> +		update_idle_stats(power, cx, before, after);
> >> +	} else {
> >> +		/* Never left C0. */
> >> +		after = alternative_call(cpuidle_get_tick);
> >> +		update_idle_stats(power, cx, after, after);
> > 
> > While adjusting this, could you also modify update_idle_stats to avoid
> > increasing cx->usage if before == after (or !sleep_ticks). I don't
> > think it's fine to increase the state counter if we never actually
> > entered it.
> 
> I did consider it but then decided against. Even leaving this aspect
> aside the counter only counts _attempts_ to enter a certain state;
> the CPU may find reasons to never actually enter it. And what we have
> when before == after is still an attempt, albeit an unsuccessful one.

Right, in which case:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Not sure whether you would like to commit this now and do the lager
rework as a followup patch. That would be fine by me.

Thanks, Roger.

