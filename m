Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769AD7223C0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:45:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543658.848812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67i1-00083w-SF; Mon, 05 Jun 2023 10:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543658.848812; Mon, 05 Jun 2023 10:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67i1-000820-PM; Mon, 05 Jun 2023 10:45:09 +0000
Received: by outflank-mailman (input) for mailman id 543658;
 Mon, 05 Jun 2023 10:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q67i0-00081u-FD
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:45:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 085ddbc3-038e-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 12:45:06 +0200 (CEST)
Received: from mail-bn7nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.100])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 06:45:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6436.namprd03.prod.outlook.com (2603:10b6:806:1c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 10:44:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 10:44:58 +0000
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
X-Inumbo-ID: 085ddbc3-038e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685961906;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3E+dlw5e7v72e81zD0x22jYE5i0pDlrjYWa/mFT9Lc8=;
  b=b1SIbJ4giyL4H1+Mv/46S6ITZj6oHS5XOMTnTZL3EQp6dgWik40dmEQt
   Y5XUP4rzBZ6GWTDNH+mNNOETI7VAKK0oabzYmTeenD/cuzHbAf3lNP/kC
   iLj63PgCWm99fFFY6qAovuIXSFeWzDT4/b1HpnaDzzClIQWBC2aY6vL2B
   Q=;
X-IronPort-RemoteIP: 104.47.70.100
X-IronPort-MID: 110930737
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iGwGEK1rFuVVqgq1WPbD5VBwkn2cJEfYwER7XKvMYLTBsI5bp2BRn
 DFOXWqCPviMMTH2cox2bongo0xVv5/Xz9NiQAFupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gJmOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEEt32
 PMBdWA0MDPArLy90eiDS+81r5F2RCXrFNt3VnBI6xj8VK5ja7acBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouy6KlFQZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiANNJTOLjqZaGhnWw/UsaC0BOCWekuMuep2SHdt5HM
 Bwtr39GQa8asRbDosPGdze1umKetxgQHf9ZCfQn6Rqlw7DRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRuQEyUIKW4JZQcfUBAIpdLkpekbkRbnXttlVqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqEpIXNTwMzzhXaWCSi9AwRTLCiY4uk+F3K98FqJYySTkSCl
 HUcks3Y5+cLZaxhjwSISeQJWbuvuPCMNWSEhUY1RsF5sTOw53SkYIZcpilkI1tkOdoFfjmvZ
 1LPvQRW59lYO37CgbJLXr9dwv8ClcDIfekJnNiNBjaSSvCdrDO6wRw=
IronPort-HdrOrdr: A9a23:tUnJaaGrQ8UpojfepLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AeYhGs2mg+5ulvrwy4uYQYRdVQKjXOWz39VrfOhL?=
 =?us-ascii?q?oMDhKC5bLQk7KwKJiyuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFAcLsA7tIWgaAya1iO4EREpxxoxL2IOnCx1Vzak?=
 =?us-ascii?q?ZovujGAZJFjuFl2SOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110930737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KK46w8bYqn6dfZ8JVncfqfkpQYOuSZ9M59XJ4TuDE24MET9+9a6kdprST1XuieERxdjhP0M8zadPF7N10MWondSX84rXHh+Mb8RFLTX32gGD6zffLZAhjwdN65bsgiEeP4cN6zMJgx/7aAwImnErqET7R7yukcMOqy68dxNSi1tLxAyR/2ZnSv3KL5cKGUi+66RZsu4e0rXbJjlrRZ/6m2Hslt5zmlpZ0azGHho1W8bbjdsoJYKT90qNqTHX8VK2dAX2QkAYNAvIAEXEciyb0u2Cz8ZbHC5QNno/XzvhCyWdbcxhlKebUv37x9J7HUqLdOyphSO5rsxl827LwYyQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NL4nwbo+OLRZcDM4Qth1iN9b62Z9Qz0zTF1XjqN8ZOs=;
 b=U8RlrHWDqy+poyTMc2naDCMThXcbqoNbEpmIZfc1OCqld87mtqyAsnEJUGMQIBmt/X/7ny9NNwW8/nMygLbR5Jjh8jSM4fhixzupbfxs+JtfJY+uWatT5u7nHspc41dlGZJX1uHc3+NneZYvFqGRVdG+ZW1WhTdL6g0g3J1Z/viLhkmk4nqkwVS/FpFniQA0aTcfWkRNXw/+9Y6OuNFkS1qEk7+Pnr726wi7N0WObn86b+Mdu6WLjZS6yaCldVyGNFgP0l0OFveYAWymfk3QOGziRUELzCTrj6MH26ecgEdluazDGzfgkOz61t4t4NOG23PK0nSnDtk3VkkMXBlYPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NL4nwbo+OLRZcDM4Qth1iN9b62Z9Qz0zTF1XjqN8ZOs=;
 b=BHFqrdMU891YAC34yF65IGDyD7xcrOnBdaG66zpv/+qTttnegZ8+rNQQTpLqrnl+H82iU0CjSwvWgOk3uYJHniZ6CciL1r+JbLJETD1WcOvytHaIV16+UNiFIUAU61xGHPAXggdEvrjbEP5MHd7HAKbrLYFfz1UzHUqgr+UBuSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <753e4206-b398-434a-7cff-62c361cee114@citrix.com>
Date: Mon, 5 Jun 2023 11:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen: Fix incorrect taint constant
Content-Language: en-GB
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
 <AE08DC3F-BE5B-4345-8FEA-29E618D3EB97@arm.com>
In-Reply-To: <AE08DC3F-BE5B-4345-8FEA-29E618D3EB97@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0286.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::34) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9596830c-d447-4d46-2bf6-08db65b1e7d6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iNqS7CpWi3BRDoYmBuerZaR8qa2szhp6rRTdTYe+wU1Jxd8V7nXB5E+s8VQ90EFLwZMOspsMR6Am7XTHjZVDSs3GHHvNfvimwOmiyiFJfV/pTwWzlK9EGy7E5yHuGfnCz2zi6+syzF+1bNbtji22qBnPLk47PVviZ4f7OEudv7FWnSlcNsX8+TH5pfGkUaP0s1I86OPfSZVOLNQmatTk16iYCAdERrrDSsxTqJuD8D3Vzgn4wuJkZpUqrKsKy7mGMgrV22i+hYrXE0noLbW9Y2lZNmHhmg07XWFBEvY2De8ln8eavdJ4o/kCIkE+hft/OIKhd0Wz5r0bMqcawf7ZsL8xr1SN5R8VxQxQYzTfDzqy1pVS/SipnKmMmZ6jzc3YQSDWnOmsQwV0GYvbulF/PmKFDVANgS9ru25oIFJsXR1jtm9YPHHd/50JNSTVwJcEYeRUQcaOeDDjXSOvJav2yiBdvIOSk78dJcIvL/zisziAZ9lC0otjt5gwftDHeSHbe2SQ2qoltKMMm65usMBnMWakHkm5vo1Pja5qVCJG8P0z1dBs3fNyKHEiKl23HLNxG6eNCQKAr8jeGNuQqOXA0u0C2kKDuDkl8fgNL/UGG4gMvLgcfHU0L5loV7x1GNVGjlajncQ37L4OXdN+zY9P+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(66556008)(31686004)(4326008)(66476007)(6916009)(66946007)(316002)(54906003)(41300700001)(5660300002)(8676002)(8936002)(2906002)(478600001)(82960400001)(53546011)(6506007)(6512007)(26005)(31696002)(86362001)(38100700002)(36756003)(6486002)(2616005)(186003)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVdlZmM4NXF6TkxpRXBQVTloTW1LRGRCRld6c3hTd0txMlpMRGF6L0xCMzZO?=
 =?utf-8?B?Z3ZLdDNYNWlndTJ6RkNKY0FUR25kV2lGU2lsd3E1dTRENWF6K1JOMGRpdGZW?=
 =?utf-8?B?REovU05CUUhOUXZFSmZkclpEUGZ4WG9DeVhpZXFDQ1JFTXptZ3pIV1V2UEor?=
 =?utf-8?B?aE5SVWp0SDMyMlA2TEd5aEQ1bmFvSDJSU1JWMWhBTGtKR09RYWdpYk1NSHJI?=
 =?utf-8?B?emd1Nzd3NzBreFZjaGxSeTFNZXp4OTl2Z3gyRTRKbWlubVpsNmMxQzJjZzFp?=
 =?utf-8?B?OTFzeXA5eXNBTS8vakdZOVRQSmxpWGpkZ0grK3J1eTl5K1c4dnhYYzZiRTJR?=
 =?utf-8?B?SG9zSmZlREpGUHYvczdodVNWejZLWEs2M3NZeHJIRXQzRld5cm5XckRzc2tY?=
 =?utf-8?B?QXAzeDhVNUJsT2k4SWN3YUJrUnJIcjNxVEU3bHZSTUx2WjRnc0RVZWlsMEth?=
 =?utf-8?B?aXVPY2dZeGpJT3BMQko5OU53UHFjWWl0cHVNbGFpS1dnMmpmbDVhN2tkT0lC?=
 =?utf-8?B?STQ3WXB0TzNMK0UrQnJXWExsR0x1TkE4T1lTR1Q1dnVVdWlNQm1nUCs0RU5r?=
 =?utf-8?B?Q2paSjBCRjVNaVg4YXJCM3ZvdlQvdTNwSS9wajNybmtuaDFkK3RtZ2dmKzdL?=
 =?utf-8?B?NlpZUm0zTWF4WjZVMHA1cTJTczQzdVJVbHZrVkl0eHlNNzdXeENrZU5KUENT?=
 =?utf-8?B?dVZHdis5ZjZjL1BIN0U3ZlN2RGt0VVdhNHpxVElxZCttTU5BaFdIRkRZZElF?=
 =?utf-8?B?KzNxN3RYU1VSMlYyeXZpSGFYeUtUWE1HTkRIdEpsQnp5eFUvT05CeUFNZG96?=
 =?utf-8?B?RGlrYXpsSE93dXB4Umc1b3pHaU1abVpaZTRWSzhyL25lVU9YMFordGtRRzBK?=
 =?utf-8?B?VTIzRndsc2l3Y2pqM3dPc0VVMkVZNHFzSW0xQXNsZ3FsSFQxNlc3T3lqa1py?=
 =?utf-8?B?QmxWVUFMbURSSTBhYXJRU1ErT3Z6L21XS1IxYng3VkJ3SVpiM2pvTFZvYXl4?=
 =?utf-8?B?MVJXaEYwMFo3Q0t4dVNlYnJBNkozQ2xFMW94cFRWS1pwbWRxTENUNFpKREtv?=
 =?utf-8?B?bWgrZ3gvbTArRmh2ODRIZGpXdm1XbkptODMxaUswN2RGV1A5K2wzeHZrRTk1?=
 =?utf-8?B?YWlSOVZQdkRpVkl2OUN3dDg5YXdPeUhMdVpjbkg3Sjg0N2JVMi9RRWxtRzBL?=
 =?utf-8?B?ckVoV2o3SzIrYUY5K1A2bTFYc0JUYXdOUzU5R3FIRklvbndnQVN0c0dSb0hl?=
 =?utf-8?B?RmMvWkRhN1ZwUWlnV2tsL2RDdUJueVN5Sm5pbEwveW5WM1JETUQ3bzNnT2hk?=
 =?utf-8?B?SjExWVJiNUlkUjZtRDI5UHRBRUdwNDFPWlU3WkFSTFBZRmx5Y3VQUm8ydHA3?=
 =?utf-8?B?a3NoY2RlZ2N3cnBOY2gxR2Q0bU4zVmpxMXcwMDljM2FyTGlxSXpKUHNhR3dt?=
 =?utf-8?B?bzJrejVnY0g3ZyszL2tVSnR2bCtHVStBVGVOTDdubVFZUk16OGp6RVJxS3JM?=
 =?utf-8?B?bWNpRXNxbkdEYk1oczBmMVRiU05lbkk4TlJwWllMbjV2Q1RMT21IcllHOXQw?=
 =?utf-8?B?YVdjWkxRN2NSZXM4bTFKMWV5T0dPcGdmaUtMQ1NQZk0xREdDNE5aNWdvZm03?=
 =?utf-8?B?Lys4U2hrTjRJZ28xYzg0QXRPWGxpZ3c0dzc0dkhkNDNZQ2dEWTZCcmw1R1pz?=
 =?utf-8?B?VEREYkZnb01vZ3RQa1hTSzR4cXROWVg5UzlUZm43ZnRvMThYNllZT2ZNa1Qv?=
 =?utf-8?B?OWQwUjFvL3grTThmTjJwQmtxYWFDR0dNRDVScUNIRlRLQXZkNWJaTE1mYXdU?=
 =?utf-8?B?cHEwZWZSbG5YQ1VVR0xtRmhjaVJnZFdOM3YrenR3L0tMSFErbU9pV1FHQms1?=
 =?utf-8?B?WFFUTUxZNU8waUJCczM0MUNNMnFHczdIWTFZRFhFUy9pYnZvNmVBYkJrRVh5?=
 =?utf-8?B?dFRJK21UZVpkRFN3N2ZNbS90cHJ1QysyVVhqRGY0eWVyVVFDQ3Rla2xPS1ZS?=
 =?utf-8?B?YndDbC9XS01jaGRmY0dlcEgyVjA1K1k3LzZ2ZmtiMUo3eVpsVnZZcFR2Z3dx?=
 =?utf-8?B?UTJ6dWlvTS9ZajAwdFZjbVQ3T2V6ZmMwYS8xV3ZYTStTUlR2Wlk5cjFFYTZX?=
 =?utf-8?B?Z3pZWXNER2IyQUcxVDVkUGJaTlRvT2pveEs5My9ZMFBEaEtNdWpqUCtabUxX?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ubl/59wAp64kdiLykv8gA4u2MHToJBjB5Q911mdb5l871sZVKZBw/mBLQUJ57tNid9B+N0D0FDuQ/CF2uHM810IMOluHNwzPhRJW9QkcNbWC8Pyrx7YShXgMxjWqLndeNDIfWqaq1wAE9XYmdj58igSbkdaasK77A0kVGH9xCLv3FE86ymJO3v5SHj9tDmNPZ6R1nlcvmWfvxbX/ABAYtbb3RdPimmkIvxiJHSiXJ7KFlEoN8f2wXERin2RGTQX9RUcvfDeme5IFEQAyGyJOEWmSMi6FaIfXRk0MuNs7dH8x/EXlfozz1J3zwEM9xcocFPd3HPLM66uU/hsI7RJ424G4E0xFR44rV4ZXN4eRra7gYwDb5nVn2cpy4uKZBHPb69ozrTy3gQzrWqB38vqEt1gmy8l6xNNFyBIcnWjIjOXvcaRDR9HcbVwoq1JyKoFHoryWr6kIe94KBt0AxGaRFLqeKJCNahiRbUrRQxWYL2Y37VUxOP1cvLe87Nddq3jjc2xWBmR4YeiAkAI5wAMuUWEy526XXJWlniHt9lygNXvICPOA+ALSmvmacw+gX6ARklOc43mqoixq060UV04JEWiwPR+EVCM4EieI07xACTcT01APdy9hJep9GgjaSTSORorTOaHWKa40XVvO4hdrTZLEZG8Wj3maAkOiYYx0EOEFMADrE5DoCEmEo7iuSBcldpPEXfbDLdF2Yw5poyqvS2BppzHPWNaD/zPpcheZIOyLZtng41YEN4UVYtuW6EJ0MK4ARsV00GKI2vUueWLUZrWm/jf2ry1njMYP9+WUHwHy0ahx2tohzrADBUHK5RRyUkd820qqMm50BfwySu2n/R8H2Gf/QDmUU9xZxmPrFWS28CbH2Ii4fOICjMjYbBip04GrjU1/H0xha/niOhztaA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9596830c-d447-4d46-2bf6-08db65b1e7d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 10:44:57.8749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OoolrexmAhPVVxEeKXWIlBCQKoI1AqEucLr0qfY11+uqlpqlYRes1W5Gw2UMXM9RqLyn7P5B/O3VGm9V7OMO+RRJNYWQfw5ZOXzsBuUplc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6436

On 05/06/2023 11:29 am, Bertrand Marquis wrote:
> Hi Andrew,
>
>> On 5 Jun 2023, at 12:05, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> Insecure the word being looked for here.  Especially given the nature of the
>> sole caller, and the (correct) comment next to it.
> Good finding.
>
>> I've left the taint constant as 'U' as it's a rather more user-visible.
> I would vote to change the U in I here as it will make it more coherent
> with the doc after your added fix for it.
>
>> Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> I'm happy to change 'U' to 'I' if we think that no-one is going to be impacted
>> by it.  I just wasn't sure.
> Here i do not think many will be impacted so I would rather make this coherent.

Ok.  I'll submit a v2 with everything adjusted.

~Andrew

