Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD945F521B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 11:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416030.660644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og18P-0006ZE-OE; Wed, 05 Oct 2022 09:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416030.660644; Wed, 05 Oct 2022 09:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og18P-0006X1-KN; Wed, 05 Oct 2022 09:56:13 +0000
Received: by outflank-mailman (input) for mailman id 416030;
 Wed, 05 Oct 2022 09:56:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzUo=2G=citrix.com=prvs=27000a6ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1og18N-0006Wv-MA
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 09:56:12 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8b825c0-4493-11ed-9377-c1cf23e5d27e;
 Wed, 05 Oct 2022 11:55:58 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Oct 2022 05:55:56 -0400
Received: from MW4PR03MB6362.namprd03.prod.outlook.com (2603:10b6:303:11d::12)
 by PH7PR03MB6861.namprd03.prod.outlook.com (2603:10b6:510:15e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Wed, 5 Oct
 2022 09:55:54 +0000
Received: from MW4PR03MB6362.namprd03.prod.outlook.com
 ([fe80::4121:3e98:1f6:c59a]) by MW4PR03MB6362.namprd03.prod.outlook.com
 ([fe80::4121:3e98:1f6:c59a%4]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 09:55:54 +0000
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
X-Inumbo-ID: e8b825c0-4493-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664963767;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ar9NPnoC23ew1hEMvExe1Sinjx2iQ8qrC8iY8h0lTuM=;
  b=JJh+a8nNUNWwN2+JJaK/OAQElba/iW7+JDoOd7STTXZrEBolJsbX98oz
   JiAUDmoV0pfH/kiB9c7ffb+YHa2UfhU0qWvyJN4tLo9vyuMBaZ2F/pHO+
   ohOYjXcE+DVIfnPbWlJGSN09wkBJRY+qvKCL/9QmE97hLcQPe/3bDBthf
   g=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 84530409
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3wS9YKAOG4yQ0BVW/93iw5YqxClBgxIJ4kV8jS/XYbTApD4jhjFWz
 jdJX2mFb6qMMWH3KY0nao22/U1SsZeDm9JhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25Kyv4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kLZI0p8ekpKlhy1
 vEkCDMsMBCvovi5lefTpulE3qzPLeHNFaZG4DRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAJ7gvK+sLb4ECKpOB1+KLqP9fPPMSDWO1en1qCp
 3KA9GP8av0fHIzDlGHdrir97gPJtXPGdaw2FZKpzaJVvwyhnjZJCTY/bUTu9JFVjWb7AbqzM
 Xc86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCooL2yQuEAmkPThZadccr8sQxQFQCy
 Vuhj97vQzt1v9W9aX+b7KbSkjq0NgAcN2pEbigBJSMA6sPmqZs+jTrOSMhiC6+/itDpGTD2z
 CuOpSJ4jLIW5eYH2qC61VHBnTO3p5LNQxI15wPYRWas5EVyY4vNWmCzwV3S7PIFIIPHSFCE5
 SIAg5LHs79ICoyRniuQRulLBKuu+/uOLDzbhxhoAoUl8DOuvXWkeOi8/Q1DGaugCe5cEReBX
 aMZkVoMjHOPFBNGtZNKXr8=
IronPort-HdrOrdr: A9a23:MvHc6qFCOa7k+eztpLqFgpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tPKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0L72fBIcABYjyQ+WyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjvdTGcCWjcARCzP0ziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU611rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ej0XigzBcZtjZ9QNkKx0TtogPhMlI
 Zwm06JvZteCh3N2Az7+tjzThlv0m65u2Arn+I/h2FWFaEedLhSh4oC+149KuZ3IAvKrKQcVM
 V+BsDV4/hbNXuccnDip2FqhOehW3widy32MHQqi4iw6Xx7jXp5x0wXyIg0hXEb7q8wTJFC+q
 DtLrlovKsmdL5YUYtNQMM6BeenAG3ERhzBdEiIJ078Ka0BM3XR77bq/bQO4v2wcpBg9up/pH
 34aiIYiYcOQTOvNSXXt6c7sSwlAV/NEAgF8/suqaSQ4dbHNfjW2S7qciFcryLvmYRbPiThYY
 fDBHtnOY6dEYLQI/c24+TfYegmFZBMarxghv8LH3Szn+nsFqrG8sTmTde7HsucLd9jYBK0Pk
 c+
X-IronPort-AV: E=Sophos;i="5.95,159,1661832000"; 
   d="scan'208";a="84530409"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChMYIqYtAwjpA5YmYxvlqVI/xOh3Ntmik466mcOOGj+mhBUjyNqUYRaVDU48jA1E6G+dkC5za1O1Tf0c6bINrmvQ6XOY9srVtv0/cwLOsAwT+gmaO1Gj8m/vNIqDF7ZIrfVC8cVQVr360eOksQbg77N1OUBoe6w/jjASQSovnfp1PqRNmS+UOSZo8nKZBMatGKg6g1dWIPUQSW1gWIJl6MG69fbyPSKqH0gK10XXiBXeXyLissb/Nl9c9G68EqiWZQZionGXisQskJOUq6hhsaipKFEnifeBHuIj4bX2lYvkr+W2UzO6Fs4W/T9mBG++hAAAXZO541xQUhL+h7S2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar9NPnoC23ew1hEMvExe1Sinjx2iQ8qrC8iY8h0lTuM=;
 b=NELONjALflPjLXgC00HnZWqCpGJsnsM72gmLb557afrNl6qY04439odZl8UOYfDw+BaPPW4moh0RiWEP/far+r3llswXxBx8wqkafMHPMw5fGp2UAY98hlBcxxJwfZA6hxV7dAFFg54NjDdAB+scoHsmjFOMxdveUbkqhn75dBtXyqE1acquPy6l362ruV1I3w6gwjQb7dMg6bhf7pWBYAKX832GL3BYcjlbNsBKp5kwcZ1A/lmvld886fDtl4CUDv1hhPCrTlepZnOmvqi1HUcQBsJiHZp8k17spEKirGOlv/ehWJ4z1w4hWpFdpNjcOjr7ROvxFC1+QUZn4HPfJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar9NPnoC23ew1hEMvExe1Sinjx2iQ8qrC8iY8h0lTuM=;
 b=JTMhtBm5+C3L4HmaMZPA+ugk9L3NfEJ3XNQCpqN7KnLa3I0GX6jqudB9Yv7Sb11nvz1IwF8E84jx5GZGPfK0pfSw8xywd7xXAlc8E4bODWtwc2S3q1mNER/KRLAlskrx9XUH+GySa0Kt0wwD2wtIkz+fHzEHrIPqCO9QM3jZdEA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 5 Oct 2022 11:55:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure to support pseudo feature
 identifiers
Message-ID: <Yz1Uoma3S4Wgmr4F@Air-de-Roger>
References: <20221004160810.25364-1-andrew.cooper3@citrix.com>
 <20221004160810.25364-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221004160810.25364-2-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To MW4PR03MB6362.namprd03.prod.outlook.com
 (2603:10b6:303:11d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR03MB6362:EE_|PH7PR03MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: f7407691-26fd-474b-9399-08daa6b7ca46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mz6yk3zoSIMyo4A4Ft6PwKcVdY7gg5kBox06pUgyqqKsYNyM10/2janHQJKuxgIafzPDNFxGpHCFxwTu20KXbaihvWpaBlcIGvAsELyc7G2XE3xBXTkEQpUt6Xke05AuQECXby6GL/0qJBTf88esIoYP0RwT2WLtghyD9SczV+ceOYmnML7fn+KQT1Gmcgd9BihaZYxkwp3rvcaiRiqirhE5uwlAkqqdu51Ycf4qHdE+6DqtKtns305e9moNYlQM7YLpuflQwWDbU0UB8u3XYDjb85E0VWJl9cO1DXzYddi0sS+8DkfLXitz+3Ngt3MATjYMFikAV1mYXNgSOCa6iCOlyOYthiIJn75V9ioZu4yjt6oDdlBSgGrL44AY8NK5Xni6Kzhq1iszJmgXJhlOZIECJd72VilTUBipJYNdQBwH9zUW/1EBxHz9ymeBsKzz0yyAm6p4G9rm21kHu8UcrLkYd9VwItfHSBKSGOvSSE8qpgXN8MhYrUKhiDTjmhHe4GM/PXdgcKTQkUJXSwBAAd1TEn+plNYmhrW+NDgHfoSY020OZYeriDZ1tRj9vsTmfKQiDEoKm9NPyI4+87IpJ035y7Eww4i2Rl6A8KSAA1MkdqyoLFObfpTxxFP8YEwek8S40/lx2hLq0sjzYA/H5rO2TtRloDTjhxgltTLK4D0IVmrurmMctwmOLOaDEFLqyElGFwh4W06uZMBmb9sORA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR03MB6362.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199015)(85182001)(6666004)(186003)(9686003)(86362001)(6512007)(4744005)(41300700001)(6862004)(2906002)(26005)(6506007)(38100700002)(8936002)(82960400001)(33716001)(5660300002)(478600001)(316002)(54906003)(6636002)(6486002)(8676002)(66476007)(66556008)(4326008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2dYRmRKRmFraUR4dUg1d3VGWEtzazFxTFNGdld3K21sNXNIQTgraCtEL0tV?=
 =?utf-8?B?cmEvdW1KcEFNR3p1YlFBN2c0SXV0YkhtMXByREVKYUFkY09lc2RlNnhkRW5O?=
 =?utf-8?B?MnN6dUMzZEFTRE5mZmRhdzZ6NzJnaHdUUjJQTnV2bkxzSS9VU21UNlBtc2xS?=
 =?utf-8?B?Lyt1TGx0bnBuVW9wQlhjZTNKQmRWc3ZCSms1d0JkdXUrdGpwRGdQVUwyQzBj?=
 =?utf-8?B?SWF6VWF6Z2VGOHl5SWlPcnVjRGxHcmtXQ1I0UC9IT2lRZ2FjUEhLTnBuWitz?=
 =?utf-8?B?N1NQdnBJRDROSWkyV1IwNFNzZm5DSXBucGRnRlNFTDE1Y0JKbDlzbmZLa0ZX?=
 =?utf-8?B?U0pteStxWnlwU0xOL0hYb0lraXptNHRNSWwrbXp0VUJLMEM5SVBucXJmTWV1?=
 =?utf-8?B?YjhWWjdoUFRPYmVVTnhnWElqVERieXVqOGJWdEt2OERFVHdVVlJBcUNBcmJm?=
 =?utf-8?B?Z1NvalRYY0tmOHdBajNTQ3BmOWpXZzBCTm1ZQVFoNisxWDM1S21FNDVXa2lP?=
 =?utf-8?B?U0lOU3VTeDZsYllRUWRJUnpxQ0F5RDV2WVhzOUdmM0RndEVJNFZpTzR2UEdG?=
 =?utf-8?B?bUJRNTk1cmZzRlRFVGZDaFRFdXJvVTZyUWUyeU9NczA2RmdNNmlRemluSWdH?=
 =?utf-8?B?d3EyZW9rMk9VMkJ1V2tJSUNxU2taOXpIbHZ0V1RHSGlsazZ5KzFiYjVKUmc0?=
 =?utf-8?B?Ti9OcFZPbWFsSmh2L2RCTzBCSjU0TmxPUGErYVY0NkRjWllJSGRmaTdyUnVL?=
 =?utf-8?B?S3AvZlExengwS3FwRCtSdktxVE10NFc1OS9ZeVl0dlBnY29yL1pJcWtTeTFN?=
 =?utf-8?B?bHllTlRGLzExbUNvVjdFKys5NGozSm0vMDI3Ykl0VmRtL3JvWVJPTFFPQ2F2?=
 =?utf-8?B?bzgrdkVOdjdBc2JmalBFSUNoeWM0dUZwbi9LMk1tS2tNQWFTRjlTcDVGMFk5?=
 =?utf-8?B?NGx1WjUzbkVnRklSakJRVEdQVjRDMUJrRDFXVmswdjNURWpHTENJdkYxTlkz?=
 =?utf-8?B?NFJ4cE40dHU4ZW8venU2TXJRemQ3aDdZSWZIZGo0RlM4WkJ2QzFTdmpKc0hm?=
 =?utf-8?B?VGhlY1krL2VWSHljdVdLY1BnakVJTURTaWFzZXlmdzhPaUJXcDFCak83dmda?=
 =?utf-8?B?K3ZERlhzaSszdTBVMHV3VVZ0elJrWEFMTnBCR3p2SHlBZFlYU0JOTmYwT2dT?=
 =?utf-8?B?ZnFnOUdxUzZ1Mmp6OXY0ZklON0VEbVpqTTd4REQwNVBVeFc1SGxPTjdQL3do?=
 =?utf-8?B?UkllUnRSQ0p2cS9jTDZmdTNBaTNxSXVCVTR1TnhRbG01YjZhMjNjWnZqckpH?=
 =?utf-8?B?bytrUjY3UzZId2owa1ZGaDJ5TGNXWkdFV0twZEF0a2lhWm9jODNaSUx3V0lv?=
 =?utf-8?B?RUxrNDNNZGcybEJSb2lycTBWWTcwZGpiTFk0cDB5dnBrTElBQk4wKzZPSWd6?=
 =?utf-8?B?aVlCS0EzWUlNZFkrVU4zNVJ3U2dKbC9GUlhnZnJtb2toUlM4NmxuK3czTjFS?=
 =?utf-8?B?K09tcVFMM2hjWStRTnMxdUZlV01udURoVGwwenlJdXVEOGZLejg4VFpGMGVl?=
 =?utf-8?B?VldvVnd0VVl2T1oyMmtTUGJRdVBBdzJOM21iMHVQR2l6WnJCZmN0SGtCaUhr?=
 =?utf-8?B?VGtjZGlJY2dycVBITkVsUGVrSzZnT0VzUjEwT2NsYktpZVUvUjA5ZUJ3d1dH?=
 =?utf-8?B?cWlsZXlIYXhjZnEwTGlhMDJhSHRhOWdoZUtqUzU0RXlYSDE5SkxncXc1Umt1?=
 =?utf-8?B?cEJjWkU1VTE0a1BEa05xa1FhMnNRMFJ6YlU0TmY3WmZCKzZxOWRxbCttMEJV?=
 =?utf-8?B?bkhmTUFaekFybm9XRnpSK1d2NHlXUVZrZlJzMTdpOGVDMkhPSFRJUnJhQVpH?=
 =?utf-8?B?NExrN3hZcWdEQUJtdG9VMmpPNzk5NENNLytFTXp0UEVjZndCRzhpVG1CUGN6?=
 =?utf-8?B?bGRGMTczNFdUdHJCdzBHbDlRRWtxSTZTbk0reklTc2RDNyszVTJ3YkVwRmJC?=
 =?utf-8?B?NDBHNXVYQ2RBNDZIZ3JYSVBXNnY4T0lUMzNWYXYrcE9aZ1VrWE1WSGtvdWd2?=
 =?utf-8?B?bnFyRzdNSjFnbjhrZ1JyZXE3ZzNIYmhHaHVGTHA2VVN2OWk5TE55SHVCWEd2?=
 =?utf-8?B?SHMrNHRIYlFHYmpyZ0VmWGhlcXBRcHFKRktaTWVZV1JrejYrL3FZdDg5VjZJ?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RW1CMmhNUGV0M0tVdWpQWFpzV0M5WnRoWmtGR3Z1dXRjL0x6cDFoUDdkSG5Y?=
 =?utf-8?B?Vmg3UnhTNUtmcWhiRGNsSnFVeFJMUDhUQWJUcFRuTnN5T2xTUE5SUllpb1kv?=
 =?utf-8?B?OXJQR1d4Mk84S0FuN1FOZmY4R1RDL3oxVkszRjFuNlpFQm9FcUdQcFB4VjVh?=
 =?utf-8?B?am1Lanc4YVBtUEJMeHc1c1V2TlBYdlRsT2FwWVlUZWIwS25oNTEraEZUL2pU?=
 =?utf-8?B?NjIzRzZFVmowNjkwY3RXNWY5SFFPd0lRaUNJVEhFaW12UlY5cDdpRFo5N0FJ?=
 =?utf-8?B?ZEZWd0JJNnZseUZ5VFBvWEJ0c1lPc2R0am84WndyOFo5c2ZCOFYvQWNYUnhi?=
 =?utf-8?B?UnVxd2MvWmhTSE90OWNnelc0TzRxUjIrdnRqMWRWdkN4R29OQ2NYU1FFeitP?=
 =?utf-8?B?NHZxcTY0NUo3ckFkTWRrYkFoOTduSFI0Y2wrQlNieHFyQVl2bEtVUDhaQ0o1?=
 =?utf-8?B?S2ZMNkJyQ3I4Yitzb1NrWi8xMUJocnRUTk54TXo1SVNRUExZcWNUNlc1Q1N5?=
 =?utf-8?B?OVJaZGZDcG9mRmQ0Z0VMNlAzZy9jK2ZKSk45TEtGa0RhUTl4TWlZSkxUN3NK?=
 =?utf-8?B?MkNTM2UraUF5V1BodWN1OTVMbi9hNVpoUG9IK21BUWNpS1FRQnM2MUVDUlBs?=
 =?utf-8?B?ZzRxaTBsQ2JwbkJldU9ja3htUlF0SlhtOFRqYkxkWGFzUEZsbE9iTjdzemVP?=
 =?utf-8?B?Zk9MYlhWZDFCem9XUU9MOUNQUjQ1UWZBWS9yaVBrYkVqZG1CUTNqL2N4cHNC?=
 =?utf-8?B?UlJWRi9PUkhWOWpSMUk0aTZ1bWVhZlRQeGgwVGl2L1VLTzBSbG9zc3dFU2RP?=
 =?utf-8?B?S0luS24rWjN1Y3psdEpKQ0pCRGZ0TSttL001c0p6ZGpucXlMUmU2TlRrS1Z1?=
 =?utf-8?B?WElGdTFLM3NMUDlQUHhCN2pZREI3ZCtWaTVYdWZzQzVlTmRVYlJhak5RTUJv?=
 =?utf-8?B?TGh6VnpyVmdCSWlrMVFRakFCbTZaS1Y2WlJ5SVpCakNZdENtMGRoZDhXcWEz?=
 =?utf-8?B?RlFNSFBIb2RHeEIrSUVrbHNRRUV0V1pabzRtV2d0cjZoM0lSWGZaZ1YrR0Fx?=
 =?utf-8?B?OGpmQU5lL0cxdjNGcjZwRS8zM0lWemlrV2g3VTBpY2FWWm5NaXdWbFQxV3Zx?=
 =?utf-8?B?OWZaTkhvSkc2WlJnUXJLWDFrMWtnc2pUVnBEcXRnaW9CR3pqcDI4anMxbllh?=
 =?utf-8?B?bzBiV2NGUWR1bW9nY1RUZUQvVUZwcXJGcFRvNU1iTld3aFYzWTNWTG5tM2hC?=
 =?utf-8?B?MW9ySzV4NG1lZmJRZnQvSW1RR0Jjdjh5NCtRYjh3VWpJeTR4dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7407691-26fd-474b-9399-08daa6b7ca46
X-MS-Exchange-CrossTenant-AuthSource: MW4PR03MB6362.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 09:55:54.5768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8TQaQZFYWpY8+jp/c/CpKFKbcxLydizhL2WHk40Sch/584hHaviRAGXf7YHINWzHM/xdbiALD1/nSHqbcNWAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6861

On Tue, Oct 04, 2022 at 05:08:09PM +0100, Andrew Cooper wrote:
> A future change will want a cpuid-like identifier which doesn't have a mapping
> to a feature bit.

Why we prefer this logic over just giving such pseudo features a
synthetic bit or akin?

Could we have a bit more of a description about what would be
considered a pseudo feature?

Thanks, Roger.

