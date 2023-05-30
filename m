Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6927159B1
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 11:15:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540989.843232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vS3-00035Z-7r; Tue, 30 May 2023 09:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540989.843232; Tue, 30 May 2023 09:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3vS3-00032V-49; Tue, 30 May 2023 09:15:35 +0000
Received: by outflank-mailman (input) for mailman id 540989;
 Tue, 30 May 2023 09:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8xzU=BT=citrix.com=prvs=507ffd061=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q3vS1-00030f-D5
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 09:15:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8684e649-feca-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 11:15:32 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2023 05:15:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7473.namprd03.prod.outlook.com (2603:10b6:a03:554::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 09:15:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 09:15:28 +0000
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
X-Inumbo-ID: 8684e649-feca-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685438132;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SAtsdJw7sX2UpLHWLe/N6LYJHFMEN5KhYZ+jyVzbeN4=;
  b=CbxpENWGDa0s3BwK5sx23qKxagH84M9KS52j6Nj7eMOomdI7iMAFZzxH
   vyCLheUnzCt4LCaa5hlhn3tXlF7ybWhjibm7yzW3w8SPTwH72KIRiiaZW
   G7JnmN5HTp/mFtXgd0sziv66I8YA6HlXeWuk2D1A3eGcIjzTN2o0F07LK
   c=;
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 110781381
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:apVXM6qd7D3DRSnMEQIXK6eaO/VeBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBmGPKrcZjDzKYh1aIji/BwPu5bWy9ZqSAVkrSpmRHhG9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weDzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABBUYiGxiqWX/LOcVuly3dp5B5fuDrpK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKKEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6Y10ATIljV75Bs+D3KprvagtUuEe/1ND
 kgT1CBy/YoZ6xn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxfQFNBqFfftisWvQGmvh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:1CeqgqG984fIPvu+pLqEwceALOsnbusQ8zAXPiFKOH5om6mj/f
 xG88536faZslossQgb6La90cq7MBDhHPxOgLX5VI3KNDUO3lHGEGgI1+vfKlPbdREWwdQtsJ
 uII5IUNDQpNykDsS8h2njeLz/8+qjizEl1v5am856yd3AQV51d
X-Talos-CUID: 9a23:uEVrQ2OMp7MU5+5DeHBrxXwZXeEZc1rBzGmLPRWTV2NbcejA
X-Talos-MUID: 9a23:3ZuIZwRlDWOtn0h5RXS2rSNtO95X5p6OJ1IolZIosZXUFwdvbmI=
X-IronPort-AV: E=Sophos;i="6.00,203,1681185600"; 
   d="scan'208";a="110781381"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFkIpiQXlk+zBS+wFo8ZRqtz1n7IVfFet11sryEKxXLs4ylJU9B7QxMnq49k0OYKqcyqufynThYp9vETpo7SiLB7xbeufQF2FIcdcWeqYjQvqBFjUwRgBKgA3G3ldUOjjNkO4KIg8PPHU2S6qVI93bX1on0eStd9wOU4ahAi9Ua+FEWd0zNzFNlBIYkXd2rF9myvnNS2TwB1Re4OhZsJxJYXqYxrKP3uSYf4Gb2hjjhUz2ycMkh3sjQkKrTCmLL/QF5ZmY/ptJBLGDyS47RUXJjP2dDTY5faF49csD2MnssMkcfDgP78H3SOoVRFMAWmvqIWJkNms93tjcj5KtwjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq/i3zi1iVB9iFkT2T3rezxP33svVrUAJxN3o0dVavA=;
 b=fJYMSc1iFJ+76FHR6ZW5YMYzykp5AcEd9ko+eHQQzNQirbaR74yKLegRC2pcNaxEdLS9MuvNUJpJqV3Mss39YTpR0Y4CpJ9iH1jW0/Eaold0Z6iNZtYXycMuH30Q7kzqsiYHIxof1M6pLDKAuaGCDstuHMNzAHkgFRL196MWRdUQjQ7w2k5IDqqgVw/7c0Rhtt+L6ZcUTT15M1G6kH69zDoPKll4Nq7hwiIT/CgyY3USYdBk8DTMoaDXIxjaZtFICZmQeFnzpXjMUuby2JDvZN8/p+lk0IDJWapeVEiBJ2vp4qAWlI2a0Q4UpIV34ncsudqPLRhQNZW+Ed634c8j2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq/i3zi1iVB9iFkT2T3rezxP33svVrUAJxN3o0dVavA=;
 b=FJLTQlv84NdAXqjjKdIu9gwyYVpDCtoWUPfOlUOwP2VZsU/dwQLiuSOVOH1pEG1uFszvpCm6QivBCowNWN/ZFdqeMHimRKvEzX3IirPLfPXYDzjwWAQtuxQA4dUZ81QWgKmv6E6xj9gl2kgzKKorpvzdJM2a1R4CWX/Tx66LIm4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <2a378301-d261-3b31-0561-c3f00e47efbb@citrix.com>
Date: Tue, 30 May 2023 10:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] x86/spec-ctrl: Rename retpoline_safe() to
 retpoline_calculations()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
 <20230526110656.4018711-2-andrew.cooper3@citrix.com>
 <859c2409-f0ee-8fc7-5348-fd1678e91b4e@suse.com>
In-Reply-To: <859c2409-f0ee-8fc7-5348-fd1678e91b4e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0061.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9d9ed9-a0ce-4912-4af3-08db60ee6872
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cA93DO1gPpDaGoeXnqorx/9wcnfACiasNS5sfodyBiOX4BU4n73kmEafjYbQI5GIjLhuP6at05C+on6pHfFqpeQfdM3TEp6yXGAEz+WxbPMHkbUSH+aWIA7CmxGANPnECPhPGp9ca3/RQLHUHuqGrzq1VNKCuSm4HCEodOiqKx8WR0poRMAt3uj2tvwHys/mbXW/NehucxiXlv1lenfsjdMU0DNZfc433CQlZC64iuzXnS7lHOsly4wI+FCHCxoshMulcDFAZ6CigM7HDdu2drEnw5rWtksp5aSBmZdcGSe4GorBfiCX1nsrF0/EBSX6WJJ0BojXudNNZLCu/0a8rmFPDeR3c9wAVsT2+LtYCdiKSwz1/lckTJY63p8pgTRB8pSAc7BVlJeXdwfNWPGlXW4GgSEPXDXaUMkpYNHpUX4nHsBZUGbacLiFaQ1W9w3mFFCwE9JIYRZWdWpbDqh1qoCW4VbQtAXcTjiMKE6/yfNXALtyHoVPlOoYU+0grXUZo9mBv3r1aD7vi6/9wgrn5Cy3cnsku51/e4EcotEc3XIgVdQZ/NGgWFVTTIVoNWky2FAqdz2IvNSFZZWKqcswn4Hax4GH3THg7mT4Z3GhnUAkE64ctIgULpuGvVktLfePgKwncjx+XQFcu3QHmgX7Fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(31686004)(53546011)(186003)(41300700001)(38100700002)(26005)(6512007)(6506007)(6666004)(6486002)(2616005)(478600001)(54906003)(4326008)(82960400001)(6916009)(66476007)(66946007)(66556008)(316002)(8676002)(5660300002)(2906002)(4744005)(86362001)(31696002)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmRKaGlUdnV1NFBaOWZ4K2FoYlYrSnlFaU44Y3Z2ZDl3Nks2TUNOTXBTS1pk?=
 =?utf-8?B?UE9zMTJwTGRlM0xqVGhZWGFwUEZzcDNlNmNKaXBVRmYwMjJkbGpYeHpqWlFE?=
 =?utf-8?B?S2JnWW0rYVRtQ0pMa2s5cXhsWGR4cnEwTFJybTQrU3ZRdHhaR0c0TXNJL2JQ?=
 =?utf-8?B?R295MWxubFE1K1g3MUVNQWR5WXIvUTYxdGVsTHFDS3IvckhaUXhxWTdRUUZI?=
 =?utf-8?B?ekZKb3kreXQ5bVJUM2FWV215OHA1Z28vSy9wYlZqWGFjVkJyVzMrV1hFUG0v?=
 =?utf-8?B?YkoxdXNrQUZuYjFXQjRSaUJxakRHdEVCZ0FiNGcwcmZuc0tVTytxTWJoRnNr?=
 =?utf-8?B?SFZrVXZBU3hHS3J2MnVjelQ0SVhjQ1BGUlc3dGJMWk1RRUJaaUVBWjFIaTli?=
 =?utf-8?B?RHgxV2FmSGlQWndzMlM4Z24yTURkUk9nZjFSZVdRS1ZOZ3dGb09mVmQwMVA2?=
 =?utf-8?B?MnA1N29nYTJGVGpJVm1hYmQyTml1bHhacWxURUoyNzdYYXFuei9UMTZwSHda?=
 =?utf-8?B?cUkrWlRPZ2tvRjRIYnZmRlowbzE5SFp2aXRrcUNxWWtKUUt6VnhxT0tOUTZp?=
 =?utf-8?B?VzJnUDdnNFZzS1BuMDJWc3orQncxUlFmdnltSTM2aldIb1AyZTViWkNDd05v?=
 =?utf-8?B?SUNyaGtnaldJT3B3eVp3SFB1RmwxV0s2bHBOZGlxNkJPd0xiZmQyK3ZCRlRz?=
 =?utf-8?B?SkRkY3o5K2hwMGR1TE10WmhjTVlIU0hrcVFqem5WWkYvOEl5NUMvTHZuRUhy?=
 =?utf-8?B?bzNMZzA4MHFneFM5cVUySFNBMUhOa0pJdm02aC9Dc2RDT3VpSGUxYVB4Y05W?=
 =?utf-8?B?VUsvb2E3dW5STTg1U0xZREExSGRvTWRtWlRSZTY4aW5icjV0ZVlpWWkzRXgz?=
 =?utf-8?B?VnBYUzZVQzdsdy9CTkhvRWpVVzc3WlFCeXg0R0JzQlB2K2dYVEFrWkF0RE44?=
 =?utf-8?B?bTM0cnF3UnRqZDRFV3ltM0xXdkoxWnlVdEZ2dStlMW0vc3Z5NlBVYXlTNE9Q?=
 =?utf-8?B?ZXlBK0oyUHBTZk1hU1dxQnhmaVVTVm84SGhQY0RaSUtHNGZpUTlaaFlKL0Rx?=
 =?utf-8?B?SXdGZGE5OUx2eTNyQmFCRlJKV25BcGpQd1ZLMjR2Vm93aWoyazJHMXhRc0Vp?=
 =?utf-8?B?cEdMa29UOWp4Z0toU1JQejRoZzM3M1ZPdGRNZ1luaWM0V0hacUJYSi9ROVIw?=
 =?utf-8?B?QWRxY21pa1E4TXJsRDRnd1NqcVNlMDR1bnFCaHNESVNyM054SktDRHFPUCtE?=
 =?utf-8?B?RElQU2F2Q3hVRzQrb05HZHlqNlJoZHhGOGJ1eUJmTlVrNHhGa2I2ellTZkJK?=
 =?utf-8?B?a1k3R24yREFzZFU5QTMxTkxqN1FrZnYwb3ZJZjI0NS8yOWhRYjhkR0NpaUFS?=
 =?utf-8?B?c0lxRjVSSjJCbmlvZ1JnWkhaMTZVZTc1K2VUWkhuUnd6RHU2akF3OFZ5cG85?=
 =?utf-8?B?Q1l6Z0p2VnlxeXZNM2s4R0hwSVFUQ01iZ3BPWFpBNHhIS0NCMFhkb21kYkJO?=
 =?utf-8?B?QWV0UTNzYVdUQkdGY0JucmZIYWk3eHJ5YTM5cE9GVS82Y2pTaFVaTzBaRzRl?=
 =?utf-8?B?bFliZGtaZlVvMUhxTGkraHBrbmsyU0NpZHBZVWQwanB3NlE2WE9WclZ3NTE2?=
 =?utf-8?B?ZXB2OGppdlUwVFRvcTAzZjE0UlFmY2NxbW9uRnhOSTJHU0hMVUZqaGc0cFBt?=
 =?utf-8?B?V3I2VnV5V1JZY1pmTnp4SHIxbzJiSHR6eVNaU240YUlaeENxYzdMSENWZU9w?=
 =?utf-8?B?SXVLWkNCUFJrN0RMZTMwVjNoMmovQ0Y3VjVHb0swdUZwcUlWSWQ0cWhjSmUx?=
 =?utf-8?B?QUZkUHNnQ0pjSUpFT3Z6dzl1OGlmTEpYTXd0eGVaYVVsV3NFVER2MDhIN25N?=
 =?utf-8?B?OHpqN1hDM09CY3dQemEwSnh6NWxZNFo3YnVzdEd3dmVBL0RQYmZvN1Uxa0V0?=
 =?utf-8?B?U3gycU91dG8xNjRaQW1aV1VkTkE1M01WM29DU2twMXJ1OEpuOHBEaExTV2po?=
 =?utf-8?B?Z1YzSnFvSmw3K2lnUlpIandOb3JrQU04d0JXN0hNbnRUTzJpTktqOXpzUW1X?=
 =?utf-8?B?SmFET3MzWmFMcnJRekJZQlczRDJXTTNuNmtESzVoM1dTMUNubXVrcWhacEFO?=
 =?utf-8?B?WTkyRk5SYnRPeGZZVU5haEx5NC95U1lHQXl4S01YL3h2UkJibjFpWTBiQ1Zk?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ajORLzhvXFZwsXzFJNwoKaX0sXaaJYc+u1SROabwzWNXbyTlV6IDZPHFXmyVgXrg8Xfusdv0IgNM/mIynq2Kjzx9AuWRyTmNonDsJ9hfaNSmB0tI+F1dfntKxYXlyPx+DwkldN0xSXbrJy9XAZEEVF7hBb0B+f/hZwLVdaaQZyR9hDBPJJZ0wWrwpiK4qrgt1T7tW2RnoiRe9OYIdMBRSyX/Wnnqys7VEG7WZryCzgXLPBr39VJ0CSlxXmpPOvdHCZg6RsYg+5Zq0wOjNsmfaJmvo+9MeDHUBwHHZaxfU6MBH5aFYqeIEDAZoMjM0gSHvGAUaaLd5MouNYoMqACCYaCnbxoY+v21adKBpDyq5QQ6YWTaQmJ4lyxSkYKWIqvj0z7H5CrjNC6Tl9nd4X0E9jhIn27U4HxsMrHnzOAGIdEuGAKwGjwMco3lRd+3OqIiuJEABNsoUn/mtwpw4Gt2C3bgYIUrD0KpJOAeVQK5c1OTv+gABk1j4pE3xQ+qMUYNAzsdVtGi5yfxGRolTQoPWF8uUNI9X3EqMQURXZuVEBKH1OK2FsMM0cLKcIoerFHsJmS90ZBP98moUbwi5jnCpQ74S7TxQPNsrJkaIWR0r8szVLJVJ3VwDz5/Akk445S6MHSjjsJjxpbHwsrkVeLJLygABDZrJukGLHyKKYC5rtl0D6EULfwc6NZyOLx0qNtNV0l1qYjgBx3hf904FvcHr+9F//c2XvHRAFNYzdwKZJaAMKCfqK6x/dzwVdtc/ntb+J0k3r2D3pBq3FY63liE0tfJjDUq3i6ZdYY2kD78cbofkiHvh8rIqZz0ZjZV7zuL
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9d9ed9-a0ce-4912-4af3-08db60ee6872
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 09:15:27.7162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3xJGnmXIH3OLpBwDBWJ1lXyANLTP37YjY/d3GRThARGMAm4ALwP/pO2GVm9FLoxm1XoYmf2iO/T/yL1cZLowbo3OjZyLZEwIJqz6356Y0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7473

On 30/05/2023 10:07 am, Jan Beulich wrote:
> On 26.05.2023 13:06, Andrew Cooper wrote:
>> This is prep work, split out to simply the diff on the following change.
>>
>>  * Rename to retpoline_calculations(), and call unconditionally.  It is
>>    shortly going to synthesize missing enumerations required for guest safety.
>>  * For Broadwell, store the ucode revision calculation in a variable and fall
>>    out of the bottom of the switch statement.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I guess subsequent patches will teach me why ...
>
>> @@ -681,6 +682,12 @@ static bool __init retpoline_safe(void)
>>                 boot_cpu_data.x86_model);
>>          return false;
>>      }
>> +
>> +    /* Only Broadwell gets here. */
>> +    if ( safe )
>> +        return true;
>> +
>> +    return false;
> ... this isn't just "return safe;".

Indeed they will.

~Andrew

