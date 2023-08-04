Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2976FDC6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577049.903872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrPa-0001sD-Kh; Fri, 04 Aug 2023 09:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577049.903872; Fri, 04 Aug 2023 09:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrPa-0001pe-Gs; Fri, 04 Aug 2023 09:47:58 +0000
Received: by outflank-mailman (input) for mailman id 577049;
 Fri, 04 Aug 2023 09:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ccdb=DV=citrix.com=prvs=573ccd360=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRrPY-0001GZ-TG
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:47:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb9378ea-32ab-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:47:55 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Aug 2023 05:47:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6484.namprd03.prod.outlook.com (2603:10b6:806:1c3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 09:47:47 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Fri, 4 Aug 2023
 09:47:46 +0000
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
X-Inumbo-ID: fb9378ea-32ab-11ee-b26b-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691142475;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LlozT63uJQfEEKd2bN/UL5TpghzcwSID1/2QYhUx/EM=;
  b=GTMyPqZ2IVIjDXrpUczrDlBpEIY1S9WgXApB7ZKMmfVO1PaMqx45R8tp
   bVquRCLwjCthd9cuiewHH6tejHAqpaKq2vyg1vOr2jlimzupBsu3jEhw/
   Ed1AJh/M2uRekP7dn9YqB2TqWvdVMlYzAZ2hOFQRklBpTQiScKYy8cQWn
   o=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 121140978
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Xr6hH6+vzBnkYqHdNu2RDrUDWn+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TQcCDuEa/iONmCnLYojYdvj8kwF7ZGGyYVrTAJppXg8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNagX5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklj7
 v07LRQMVSqpoLqR/oiVddNqn9gseZyD0IM34hmMzBn/JNN/G9XvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWCilUuiNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdhLTeHgp6E66LGV7nQJEjokBAu3mtuG2hShV4xwM
 04f6gN7+MDe82TuFLERRSaQrnOIswQdUN0WCOAg4Q+MzKv86RuWHWUCQXhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqbigCVhYB/9jlr6k5kx3UQ9BsVqWyi7XdGzv93
 jSLpygWnKgIgIgA0KDT1U/DqyKhoN7OVAFd2+nMdmes7wc8aIv7YYWtsALf9awZc97fSUSdt
 n8ZncTY9PoJEZyGiC2KRqMKAa2t4PGGdjbbhDaDAqUcythkwFb7Fag43d20DB4B3hosEdMxX
 HLuhA==
IronPort-HdrOrdr: A9a23:JhlGR6rm8rbQmxH7LLN9GjgaV5ooeYIsimQD101hICG9E/bo9P
 xG+c5x6faaslwssQ4b6Le90cW7LU80jKQFhbX5Xo3DYOCFggaVxehZhOPfK1eKIVyaygc678
 hdmsNFaeEYY2IVsS6WizPIceod/A==
X-Talos-CUID: 9a23:z+s4NGFm5Bys2RmoqmJK7083H+QkSUf36y/3HXWWNlxvUaGaHAo=
X-Talos-MUID: 9a23:mHmtHwaEFRLbMeBTryX2owMzZMtTwZv+Ul8Bz7oeucKUHHkl
X-IronPort-AV: E=Sophos;i="6.01,254,1684814400"; 
   d="scan'208";a="121140978"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mqg8IsBbSeyCIjOiZV5aNqnkXAlfz08ZHHZB+rSBGFP0jT1JBZ+w++wgGOXQ9Mu/t5ydidvFgROBEW94SyMquqcGHOMRhmEkLPyVHbTiJBNxneRGmjOuZSe+CUhbSs/pHoADNX27G2l76TBS3KEhbB776zoYUeHX7p2LwWbL5anIe20vCDTd/4/Nt1VqN/BdEvLluLIn59b2ZeqqzMk4tf9aUTfYk5oOhWGWyuhPUqHUfllkS5L2XxsbfxEkVTycAXdI2l3OeRwOQaXO9mDXvA7b8FHNJS5qkYI3Rz2Fwf6Oay2b9DYlPwnMVY7Gdi1qo1ymlE5kNZ11D7L4/aiiaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m42IxxKuaIjFxMFD8EVIAdcRbjt+Je7k+U+X6RhFZRI=;
 b=e7VQ9v251Y914KzdekwRqZMrbvnsz6K+zJzyEHt+CVGPFdbssXPsSZsIMqJKWQLu+XSOO4XqpVf9EzGoudLoRWz7PBiiI/OERED4qbLrohIxMwg4kxCW1AHJKtc96jCW0q6hMYXbaCp5NAajkyHw0/D/Xa6xJECx9FjROmRugWwtTeWl9Co6DQeRQiUWYo3YOFpbuYHktM2mrcu68tSd2zJ74+RJQZIEFxJeOonuxAGTA/oRcIqFH3isqwqW8LhQd0t93MltbWf2zw659rfQdsUO+JG1ho/7IlbiKGbdsykxxwiHu2zi5Sf982xtM4Nh30EgMzhZZVa/ITzNSsqNOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m42IxxKuaIjFxMFD8EVIAdcRbjt+Je7k+U+X6RhFZRI=;
 b=AmiwZORx3/xEJPbCQ0kGqG8Jx00pLBXKL8Gw8cXxo95UYF4e+TDCr6RYSM5kVPevTP2s/mMOyc/vZhrR2JXaz6WQUZCAte6zP4U7eGNHnuF5g/X1i4OS0bvNFR8sDsd5vEsb3JQJ4dzZ2J5W3BqBuXXyJGbVEhc+SQ2dVluIIG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c74bd41e-20e3-2616-f077-f213bf115dbc@citrix.com>
Date: Fri, 4 Aug 2023 10:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] x86/mm: address violations of MISRA C:2012 Rules
 8.2 and 8.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <c690d653a6fc2dd9cd0d1aa3b204d6ac7fb12ed6.1691141621.git.federico.serafini@bugseng.com>
In-Reply-To: <c690d653a6fc2dd9cd0d1aa3b204d6ac7fb12ed6.1691141621.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0302.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9c2978-0576-450a-c2fd-08db94cfdb9f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+No06SbrqzhBTdUWeWCp3o3Kxgt/PALLykDX1QSc1egWa2hNHYbZa6yczfKACr84KUARFui5okrXOUzWPIXrtY5S2LiNQs4Y/CNjuvg6vI7ZxGdCVQxBFlaLFn7TLlm4HDm+b0ptwSAgO1iThYMjYUf9Ulvo/yflJeXQtgJ6y0SANnIMhbcdyDbNp8C29eB9j3zX5AhRNDQpNBnh5cX9BqLwnL7L3pfJ0OiAtgEoQ6sWqKQguJ6cm6yyYCqrQ/l+EkuS0kbM25DOjXsYH3O58dxWFCeBEt8hfTK3DUZO0qi+FRIf3FHmt4kF8PlBVfxeo4uwuGt3HAtdiWtgKO1DXmvHNXZjzthMJhJQw0MWd36A34xpjS4XqXQfYf6X6cRBUnB0fDDOXbcGhd471PUxP3sMrBB62Ny+NFrkB8VSbhWCDxf9Cpgf34gZ6ronwPsCHNo6rDO6+OtSBJg1TMcLtwoIqAPqXhNreF+mHO4I3R/S3f219LS3ZsS6Ac4rk1kImVQew8lCaSkCVlL6fVhi+zlEng7aVWKjS1g90E97UOnU342JoF8KJExGsghD9ziAPBM8OojlwiQt4unhzPs1cx0mHFUuHCufbsgtEkI0SU9fOEIUcfd4uBOoCKq2GCXL4NEY+cgnOLJ6ps9KgNsyFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(1800799003)(186006)(451199021)(86362001)(4744005)(2906002)(8936002)(8676002)(31696002)(36756003)(31686004)(6506007)(26005)(53546011)(2616005)(6512007)(6666004)(6486002)(478600001)(54906003)(316002)(41300700001)(5660300002)(4326008)(66556008)(38100700002)(82960400001)(66946007)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0JhRnJMM0VvVTk3cFVYLzYwSjJYaWhrWnEzb0U2c1p5aXgyRHpnenNVeWxF?=
 =?utf-8?B?Yk1oMG95Wjk4bFVUYTFvMnBoSFZuNHV1TzBnMnVUb3pMUWhPK3ZsUW5VN2x1?=
 =?utf-8?B?ZGh5azNtUmRNekV3RjF5dndtSXIwSTdJdnV0eHNCYWQycWNrMmUvSkF2MVpq?=
 =?utf-8?B?U0pQSWVha2ZaNVVQSG94TjJUMm1mK2Z2d0ZyOVh0c21ISUtyRytmVlBQVCtl?=
 =?utf-8?B?dVlZeC85V1d2SHFFUHBPeldSM0VxUXk3a0d3Q3ljODJ1U2V5OWVoV3JyQlN0?=
 =?utf-8?B?b0FMVm1jN2VFcmhCQW04bzJZZVNEOHJLUk8wYlJOdGpGU3BGajdBZ2M5VW1V?=
 =?utf-8?B?c0NzRTlzWUEyaldoeERjQ21vdWo3Z0xScHlSWVFWcFNiRTdLVW84UDY2Nitk?=
 =?utf-8?B?Y1Y0bUlhQWxodVIzZi81aTVVNEZRNkQvaEI5S1c2djUrN3cwQnQ4K2FLQnRD?=
 =?utf-8?B?bWNaTW9KSjhqTTNId3d1WG1wRXZvSUtMZ3htdlZXUVNPdnNkNkY5VW9raStR?=
 =?utf-8?B?UDVuK0s5NTdCRmhoa3RvVnpwbkh4Ymh1ckZnelVMVzd1OVE2NEtDS1crWS9F?=
 =?utf-8?B?MnZzVnYwNHIwSzkzK3djVUIxWGJsZGxYbFdlY3NURDJaaWRLK3RXekR1WUtC?=
 =?utf-8?B?YVNaUmNsQmxQeUtKYitwSTd3VjNUbDNTT0RsSWxieFc0WHFIUHpoRmxMNW11?=
 =?utf-8?B?cUZQa0o3U3RWUXFWb2lWdDZwQzEzbGg3V0VxUEEvMEJydFErNjF0OVVkMk5B?=
 =?utf-8?B?Z1huNnNXQVRSNjNyVVlpWjRKU2hObkZ3RzBDY2RJRmVVbjFLbHpxY2FaajI5?=
 =?utf-8?B?czRWZ2JSdmovc2NUdUliQlc3dGRDN29Sc1BJRXBjSTc1UWUranJrY0ZBS05Q?=
 =?utf-8?B?ZE85TFlqSXR5RlY4TnVnc2VYUXdBSi9jLzJLZzJMNC9uK1phTitNdEVMOG9a?=
 =?utf-8?B?VzQzaXlWYmdGcjlVa1FRTy9lcGEvWkVkYTc3clp6NHlYRFVFdkNTRjNIOVFK?=
 =?utf-8?B?Tm5iUUlIY1hXbnpRbDBFMVFETWI5ZjVvTUtCODNrUmFrdHE5ZEloUThFTlQy?=
 =?utf-8?B?TkhHNmF2dlJXUnlVaE5BWlk4SDg0emRvUGtkZGk0aVZaeWVrUWFnVFl2ZlVp?=
 =?utf-8?B?OUQwZ0lzNklKcUpRSzZqYUpQTTd6SUJuTTJ3TWJNQTVQTzNlUkEyb1M3NGQr?=
 =?utf-8?B?S0RvaC9XOEc4cHpQMVcrOWlOWGg0OGNBSm50bCtXVEo4dmttV243TzJuYjQ4?=
 =?utf-8?B?dEJoMXllQnk5cEJLc3B0SExDbmkzQVJGcXgrSDl0a3JXbUhieWliK3A5alNV?=
 =?utf-8?B?QittZG9tbTFwUkdkT3ZSdWY4bksrbmxOTE5wVkVvM3J3VTY1aFBTVytmSmpJ?=
 =?utf-8?B?a1Fnb0tzWlJSUzZoeXE4Z0lJOEk4aFZlcXI1MjJXeXFpWXpWQ0s1Y2JkcFRq?=
 =?utf-8?B?OStoOUFKZTlaVWE3UUJIa2ZTL2cwT1N1T1pnL0Qzenh6dUd4a0ZIZndTcVJB?=
 =?utf-8?B?ZGtRbmVkbDBucGQxVldkYU5TMGJqTW5oYVFYbzg4MWg5a3IvTEcyT2REVzdI?=
 =?utf-8?B?NUNwRTkxUHBuNXh3SFNEVUdZL0RwNkRPQUlCSndEMUtnRjR5eFhXVzVEYkdq?=
 =?utf-8?B?anVTZjFmN0VVOHlMNmRmR2YxUFFmNkNsVmtSZm8xZlBVN3lJNW5KaDRFR0kz?=
 =?utf-8?B?ZUVkVGNicW1BYi9jY3prb0lIUGplU00rY0xld0htS0Z0YmMyRXVvTFZUL3BL?=
 =?utf-8?B?TXJsVjNrQ0ducmdvMVlXbUw5TENnbXgwam9RSU1qblNMV1JvdEdLalNiZlI5?=
 =?utf-8?B?OFFYbEEwWU9yWU1YOUQzSUNYdTA0QkFFYmVZMlZNbkZPS3RtMUc1KytYSFRJ?=
 =?utf-8?B?Y2IvcVhOQ2M0WitxRUlUaFYreUROcW1RU0Z4RTZvQm5MTnhhUnBBVXVTQmdC?=
 =?utf-8?B?Nmk0cGhZZnB4MTd4SWFoYmlqY0lVaWxFNjFkYmRLNFNUNzNqbk5YUng4K0py?=
 =?utf-8?B?VEZ1T2k0YVh3Y0ozOFpkdm5iR2pGTkVpSkZnQ21LNjR6bVA2WU9adTlZWFNs?=
 =?utf-8?B?YlFkZUhvSjlNTEVRc1dZV0prYkxXQmYvZ3dETTFNZkFCUFFhWWlvRENkNzk1?=
 =?utf-8?B?VWhPem5vdlNPRVVCYW9iOXBocnZkVmk0YTBSdUZUUWU0ZjM1aHVCVmR2NzMv?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zuxVGJ1RY1BTok9GNVD4EUnWbz0lXwm/wwIkOXnInKkxXkQuHG5xsl2iA5JRcJGbzeUP7J+9A/qxhIp35Q88rp0JnXWa3BiH4nX+tB+hHSSCWNos/4O8fKyB9BqF7aFs90B3vuyviRgY7cJ3YT4oCPwc/PifyWmOiXKf/f7xu5g2eqmGXNKAfD0FpEVibmt4dgM/9AGGgTqUR73WYEWKlYim2TgiZWXZBQOtPscHYUXCrlAYP9vlRTBwblciv9PfbWIxPa5M2scfzm9N+DKo5rSEIE704CsD5E4roXToCssU7SQ2OAu8UJ0HigVOzMBNogXwVveAIxW8AU8yF16raLAZCMBzp7+BuWo0F9WqQq2r0dFmGwtaGjJNMfUAuvVOIoXC42nrjxgzWTuxucZtC7UcGOTrg/yImPchi58tZneWlosdfD+xPKXd5uKeYr0ollXU7i9ArrAcvfD4YtuPpRGep8s5mSWlzikRFDxamW9cPmLodnkXziQ0iv/tb0fx8PDjFn50pquSX07oJef2P9qdn+R/p87iK8w0LktyHtZwR+YcRLDTAlozSJWOCRtk9eiuOKMho7rbTLgf2CGvcu00zrEkUfqlXTkFzUFvh0GqZXgKk9jrAqDTshwYf0APnO6t/eUE0jCE4F0ad5gyh2HkTO7yOSo6v7SFTAqxBPGH6rwtZa9e1Zp0fhemzVacuGdNR+mRc3dprbHJR7ad6x60PRr916Am4VQT/Cwv1Xhidi2LVAYVGxSuSrxIX4MlYRA52WiLtKRa/CPd2K96n1NMr7nOVKEaqinxLaKm4Ih/OIYPGUP9eUauquRNhH+Jb/RAKpScCHyuwGTyVRvqRjTE5CYGNkFFAW57B9VvyJU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9c2978-0576-450a-c2fd-08db94cfdb9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 09:47:46.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DWgX2AytCP4KKc/FW8y4oyguPBX59XOMTm04gxPCNCE0nCqOYM8rZCf21mCgzym9hX/a3SSjgX1X8uW2wjDxqAAJZvIW1INSPx8XXajrMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6484

On 04/08/2023 10:38 am, Federico Serafini wrote:
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index be2b10a391..e1d9b94007 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5591,7 +5591,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>   *
>   * It is an error to call with present flags over an unpopulated range.
>   */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
> +int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)

I think both of these examples want to stay as nf (new flags).  Flags on
its own is ambiguous in context, and nf is a common shorthand in our
pagetable code.

And it will make the patch rather shorter.

~Andrew

