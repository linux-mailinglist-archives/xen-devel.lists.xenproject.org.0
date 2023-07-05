Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F2748990
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559458.874458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5ll-0000gm-Sg; Wed, 05 Jul 2023 16:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559458.874458; Wed, 05 Jul 2023 16:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5ll-0000ec-P8; Wed, 05 Jul 2023 16:54:21 +0000
Received: by outflank-mailman (input) for mailman id 559458;
 Wed, 05 Jul 2023 16:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=asTv=CX=citrix.com=prvs=543a7ddba=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qH5lk-0000eW-4O
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:54:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f956fc-1b54-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 18:54:17 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jul 2023 12:54:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5637.namprd03.prod.outlook.com (2603:10b6:5:2ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 16:54:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 16:54:02 +0000
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
X-Inumbo-ID: 92f956fc-1b54-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688576057;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=QVsjvRaEGDlHN/4NWGx9UspnGUsD1bKvKve0FC2IWb0=;
  b=aBjCm/taydTIFcbe2s3fGnkXJXOQv6qTFyh9PgiN2A3qpGKWA+i1bQhq
   0CEk0mQfk+Ufk886PKQ481cr18UegNfsJD4bGAKF1OqWEbe86PKiLShn+
   91uqLPow3VFnFvhPPaGz0JVqCNUgEz946aIxwDJgcpgzvC9mSjsZQ4HvB
   k=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 113972566
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lcDEt6xTJ0HSQMQzSOh6t+cMxyrEfRIJ4+MujC+fZmUNrF6WrkVUz
 mIcUWiBPPbYZjDyeNl1OYvk9hsB6pGDx981TwpvrCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPa0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVpq8
 +wXdGEdVA2evN2c4663V9dn28t2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVMvuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdlDS+flqKACbFu7w30RBRkZd2GBjviku0P9XPFWG
 UUV5X97xUQ13AnxJjXnZDWjqXiNpQIVQNtXO/cz8B2K0KfS7AefC2UeTzhOLtchsaceRzYny
 1uIlNPBHiF0vfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WAqng4jrBK18oTjfzkoxbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzURhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:3Iw9L65aG2FzGP9dsQPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-Talos-CUID: 9a23:+biuv265izS3GNZHYNssz2oSCs95I23n0WrrHGWbFWp0drbIRgrF
X-Talos-MUID: 9a23:jbswfwajeobmEOBTsi7uiTVtFv1SzKWzOU1OlrYPicCFKnkl
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="113972566"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAVS6nQDB85AFEug2Qejh2cJhXZEG6y2AaOHj6FwCeWxSvSXzTA/6I/JgIZArvZ5O+3A2/Ei2/DbVQQcDMuMGZb08wwmP1yFIcv99n2orjdsxL/uaQfKbF1vZTAnhUNmKkLpn3mTGPh/JdUMdTxpoQVTWB0edM+fPddHbY09vuNcRNrd9GnA5pgyxtasHJ/QMnnOkS5+GHvJ6uEGoYmX9TptDUhAxvbHr/lZ4Q/NigEopnAEtFdnAf0WMBmq+Uxh8uVo4uDSqAdVCNxe2qr8Ull5Llmn1D8FHGTFIIXzchUkVBBrrCebxjX1MtFBnEG/DPt1Hz1nvcIYZRc4G+ZSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVsjvRaEGDlHN/4NWGx9UspnGUsD1bKvKve0FC2IWb0=;
 b=UR7qTyColrgXWkZDMhm9JcN0ElSYpeg176gsNNbL2GYQC3Yz8yBqUq3hSkudzJyzQCAvZ5+BukjBrJYBK66sCtVlj11mgpqJh4ohFgDZmv+hs43YexsYRHREB/fYqW+VHsxoXhADKCcgZRp4ZXCiwh06ZvguaqQ/WtKMalT8CFjCBWkgP6SOTrmvfDPxHDJIpR+ro2WB2dpWnGODWItS4GmFtQwZ/Vz8sCbjPVoQZ2r+4i6Q2KketDrqnKNOlmRQzdOpKcmvopKpEHzJIDLJpO7dIbMop1RJT2ECLCV/8AmCLF8+utD0lYZhLdtLfOI0JEpOI3XNgnkC81Vz50orpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVsjvRaEGDlHN/4NWGx9UspnGUsD1bKvKve0FC2IWb0=;
 b=ASgMqmJOffdAOwBjny6/bHccBOHrX414vRyFF8jnGiggZQ4D76zofP/NKRzCw924WunoDwqVUHIfQ9dZwg6r+dc/wjpfWvzLNYPx+buBpWYPR8HMj2zpnVy/96YtOhbZYrfeQou1RBqUjJQeTEFHlic20YQlrGZvPrddz67ulpw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <55c311cc-7ee3-93d8-21c2-ce03e3222096@citrix.com>
Date: Wed, 5 Jul 2023 17:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
 <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
 <cbf263fe-9221-018d-b187-3d17be76e937@suse.com>
 <1b3a9165-43fd-d8e0-5c2f-49875973c8e1@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <1b3a9165-43fd-d8e0-5c2f-49875973c8e1@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0087.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3da1176a-a009-4cda-8f49-08db7d786f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVkXAosh77dnPxGxk0KP7EB6XQTAIp5PtjF4/SgqRFov6UKft4qXjUFm0vPoWf+We+WiMqEMvOODU4kDWMMcQ8OaOvZ6s4rFupV/qK5JUXVLQV1qOP+4fVv8l9pA0A3lkrYpywQLIYjjryX1aLPZDrNLPR3pzCuZMuP8kwBmolbTc9P+QG8t9I/aouYRWhkWIMUct4ipuy3OIK9Ue2aLwfeKYNnxnZafTuBYadVcnR6h9jWyUDYiQdUIcEsJkvDKugYwW+wnar+2X0lU5oKI64vc9GDU7hayromicPLj2RmBduZNYMDR2Y3Hf5Cs55r8C1RRgYjHrxRZ8kdVEHSRhWJBhRw3kp+nQHyMSdLYPF7hgayl74S5U9tWT5TzFOd8oOaalkaDR1raKZvkEKyZEty4Ibwr1sxQS3kf7lDfCNWjMSqtnnx7gLNez4uV6BkCHORc8ei0uG+0sR4Sj0H/pP5Uwc5RrE2JUykkU4ytY71AiRRQNz7669HJemeUkwStHdKD6n6YqjPyL4oOPIxJFEC4iA0TUb/WV4QWZiHZGew/3/S6gVgJl7dl+D0g66IpjC2t56ztXzajZY0mE+2ePgN1abnMP3K0E4PlfaphxljcHhIT0v+DWvt+ORlljkcnWNj/D/AvyMsJnpQXXJbbQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(478600001)(6666004)(6486002)(110136005)(53546011)(186003)(6506007)(26005)(6512007)(66946007)(2906002)(41300700001)(66476007)(66556008)(316002)(8936002)(8676002)(5660300002)(38100700002)(82960400001)(36756003)(86362001)(2616005)(83380400001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0hOQklYK2dNK0VIMEZwOTkrSWw3UmpUZGtVTkk5aGpLZ2lnK1FBTGFtbCtj?=
 =?utf-8?B?R29MUzlNOTJNVnBwdUQ0bGswSjYxQmo2TnVZeTc0RjJoUFN2Y1hiVjM4MGlj?=
 =?utf-8?B?V0hDdC9nYWJJZXExeGgzOW8yZ3JWWUdzd2RvUjVnVU9VMXhFNytqYi8xQ24z?=
 =?utf-8?B?WHNOS0wvYjJpUmN1R3B5aWZONmdzWFVHODBQSGxuN3B6V1JQalBnaXdqeEpx?=
 =?utf-8?B?Nlp6aEcyYVlGK0psTzc4RWl3NkpNOGhRQmpyRnNvMjdMS2x2MWhyNFhISzNK?=
 =?utf-8?B?T29McGFMbi83UGs1Qk43ODcwYzVERjBIZElYNnJLak9OZk03VGxqcWtKNXZL?=
 =?utf-8?B?QWYwMjliSmhTKzJoVGl4RzJSOW1lTXcxdktYYmtQSCtOVkw0ZDZNTUN6TWFG?=
 =?utf-8?B?c2NZOS80R1lVNUxKVC84UmJWT2lmaER0dStPZWJtOW5mdUtCZlRjUGJNSG5p?=
 =?utf-8?B?WWJPQ3JoKzZPVWJuSTVteGJUeWZIYlVlMDZ4NGZTaFFsUk9keHBHbklmM01S?=
 =?utf-8?B?K3BuT0JkUU84akVPa2hCckM2VnVIRXlaNnZPci9kVXV1YmQzMTQvbEZjamRB?=
 =?utf-8?B?MnlwQ3pkZUNWUUpWQXJoQ1FBcG5WeDFYMkFxckFiamtVT3VWU2RjL21zNkcx?=
 =?utf-8?B?WHZrdnk1Nm4rc2NXNGY0Uk0zMXVQZU1KQXlRNjV0ZERTT0E3TElpQ2VRZTNT?=
 =?utf-8?B?ak1Uall6VE83TzFZdGc3eHdjN1IxOXFKVkZjaldHdG9YM3ptc0dEZHU2OXFQ?=
 =?utf-8?B?bUtFL1VlTlhQdzhuM0xBWldxSHU0ZjgvbXVVOU9NTWcvMk1PMzBHQ1IvUnBD?=
 =?utf-8?B?WTdGc2ZEdS83U05ia1YwOXl5cUxjeFRwdjFqaGlId0ZDbWNGTFFrOHY3aGNY?=
 =?utf-8?B?bEdrSjcrcGlrcXdDUmlCWkhndEIvc1kvTmxvQ2k2N2lJbnhtMVAzNXhUL1d5?=
 =?utf-8?B?czQvQmRaUmIwQWJGczVhRjduektaUTNuNnhCU1p1VTJ6NzA4SUNBMnorT2xP?=
 =?utf-8?B?VzQybGVlN2ZQV0FpQmJmZFpXc3JBYXhrMDNwZkx6YUh5UysrZFd5RGZkZEdR?=
 =?utf-8?B?alZ0US9FS0kxUjVlZTlPMTNrQ0ZkSkdNMFcrTWk2ZmVNQ3Y4SXh4TnhSKzd4?=
 =?utf-8?B?MFU5OXBmMGMyM09ZVTNmV2o5UG9rU3FwTEtIMkRYS0xEczZwZzkrbWZ1bk9n?=
 =?utf-8?B?NEZST2psSHJvTkJrREYwM0JRdDNJRnBXMzFlUC8yQURRTG9ZRHlBSmltdFNJ?=
 =?utf-8?B?NDNiWGdTMTN5U1NYUXYvOVlWdHN5aTV6Tm5WQXNpSDJ5eWExUkN4dTZYZHV6?=
 =?utf-8?B?aENSN1U3eEJiYjhiejFEdFdpSUUydk1pdjhGMCtHSlA0Y29walAvVU5mdWtm?=
 =?utf-8?B?TFRIY3ZRR2hWOTlyMTJYMzVJdGpKNnI5TGRhN2ZsaEppcGFHZU9EejBMVUNT?=
 =?utf-8?B?QkhNRXo5UzlCMS9aM1ZFZWJXbVBBb2FVaUJEQjFMSFh4a1hzMHZzeTNsTHN0?=
 =?utf-8?B?dVR6djViNFVwT0k4cWNWbmkzb0NGV01EOWdLcyt2alBIUXU0QktrYWdFZFhC?=
 =?utf-8?B?azlZaU1YbzdaVHBxQlhiUHo2RWJrUkhqb2IvV1Jyb0MxbFlyRzZpd20wVFVn?=
 =?utf-8?B?eDJjYy94dTd5MFF5Y1pCUVZtdlpaU2JodlpBaHpYeEcxbUgrTHlnMFVKZURa?=
 =?utf-8?B?M2FQeTFQTURuV3o0YktNUU0xSzJXcEtQcENWbHY4UW9qWEVNM0gyWG9iUUR6?=
 =?utf-8?B?a1RLaHJLSlZRSDFVaXRMVk9aaHZyVEhDdUJXcERkQkRQN3h2K0cyTkJPY2dS?=
 =?utf-8?B?Q3g4YUlmY3hwMG01czJIQmxaUHVsb1NXNk9EMlAycU9PMjJnb21WSlhBT1ZC?=
 =?utf-8?B?OVowUlJGZk5FL3pFcGUxVTMwVjE5R3lvUjRoam9FQ1hPeW5DczduOUNFUGgw?=
 =?utf-8?B?OEg5eXlOZGhDeDNEUTVwV1RmRFRRTjV6R0JXdXpXWFV0WHZ6RU9EcGl3c1Bw?=
 =?utf-8?B?QlZseE14OVdCT2NhOUoyY1JmWFIrVUhLMldXNlhOVk9CbW1rcG1zWHZVSGdZ?=
 =?utf-8?B?MDh0TnVOdUx6Ym9iQkxrRXo1NDFUdmY0UDJEU1lqRERFN3NYWlZ2SWlEcmk3?=
 =?utf-8?B?TXRJOGc5MnhGUVhoYmZpSEEwUWRvYkE0NUhZM1Q3SFlaZWV5ZHJtRWpRcVNW?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kXfw+Tmt4LLVbwaoPJk5RGbh2VZjSWGcJkqTZGOibEI9901chsW8BD1yXeEgVNBIH+pOv8OLahtQKaWwzprpsDteQHdw1gv9DyMT8KPIbVkbAcixXkszXL2ruk02WPame//QY6WuGiNULl7M//iqbFfxQD9jtn32wTHWkkhL3wuF3Z0ZlKR2C1jWj0SdaLX/+CpDMWT+0pWihp0o2tCNVHSZ5T8Nfj8jRLyHf5m9U/0UUUfWvbHmlXIlAWKKUYCaZoDv5cLq9khleoGBDMLpGB+Xpt1zYWezVcB/uErvWue59/hUAT6pUun5Rm4dLTLyTFHt9laJ+Z2m/h78AQYgVgbzVNqNjHvJprpVxSrpyAhzxfIUZ15nSw0JFJpWzdkNSzJzKAxE3EVz6dFn/Nwcowuv88Zb3EStG753htP/blf/3kNXku3Hoo/ntQLAiLYk631T3WplUTxWT5QOQqcZTus4Mye4UVyu5Z0WDFrqJXQY6+ej1j+fx2X4amEcGmTqSUaP3EODoAjdTSjqA9v99aR0ht+tBY+bvn/0B08uqNes6Fy/u9OemiYS1l3ybRuLzXp+cDs5Df9AB3lzhgo3ONDL5Zv8u9roTEvTfHO8HWJHBijwHmGJOwJ8fQk1sNjM1YxgBZZO226Cuwk9757eKDrRqPxJUkMy1R40y6q9XNmytt0Zdni7YRRLL1wbcmfUzEohj1gQ15iZqpVjuL4ApY+ykVWgC1khc5L+WQbGYr6QBE3TxY4CB8T7L+XSvu5Cozk7Y6Xk8wWSSBu5hBi37WjrcwdabV0MhQV8/r16EilUutt+2PngRmBtaxqsDTJqEuo0S79WRH2KCGgsSHP20RiUHjrHLfh2Rdys15WKIYE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da1176a-a009-4cda-8f49-08db7d786f30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:54:02.0828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISQblI1vnweHXthLI4GkEje6y/CzMAl3OVInx2kW/j8rDdCyobyTxTXJVlGgzu6eIoE/GQ0FDZ4kptVP3FVdfFN7Hxzy73fYLD9vu3OTm/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5637

On 05/07/2023 5:22 pm, Shawn Anastasio wrote:
> On 7/5/23 11:09 AM, Jan Beulich wrote:
>> On 05.07.2023 17:10, Shawn Anastasio wrote:
>>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Thanks.
> Just to clarify, as the maintainer of PPC64, would it be my
> responsibility to commit this now directly to xen/staging? Or should I
> commit it to my own tree and have someone pull it?
>
> I'm not super familiar with the project's maintainer workflow yet so any
> hints would be appreciated.

Ah, so this is somewhere where we're quite different to Linux.

There is one single tree, and there are a small group of people with
commit access.  We're "THE REST" in the maintainers file.  Jan can
commit, as can I, and several others.

The role of committers is (technically at least) to take any patch from
the mailing list which is suitably acked, and commit it.

So, in principle you have nothing further to do here.  As this is one of
Jan's patches, I'm sure he'll include in in the next set of patches he
commits.

It can happen that patches fall between the cracks, so it is generally
helpful for maintainers to double check and ping on IRC/email/etc if
there are patches that appear to be outstanding.

~Andrew

