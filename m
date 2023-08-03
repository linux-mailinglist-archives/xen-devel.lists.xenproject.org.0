Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5993276EDB4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576459.902615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZzq-0007CV-NI; Thu, 03 Aug 2023 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576459.902615; Thu, 03 Aug 2023 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRZzq-00079t-Jp; Thu, 03 Aug 2023 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 576459;
 Thu, 03 Aug 2023 15:12:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1P5=DU=citrix.com=prvs=57264c000=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRZzp-00079n-TQ
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:12:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d16e300-3210-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 17:12:10 +0200 (CEST)
Received: from mail-sn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2023 11:12:00 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB7116.namprd03.prod.outlook.com (2603:10b6:510:297::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 15:11:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Thu, 3 Aug 2023
 15:11:58 +0000
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
X-Inumbo-ID: 1d16e300-3210-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691075530;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YzrYmWJalqXA0q+sl+9kg/YSXzJcnmqZbIQzHYhqDK4=;
  b=dJqYAeQWEchh39wa32HQ3UqSZkwZxeQjILpW34UioNptOL2t2PDze+Da
   pPlxev3Xb6UM52YqEv7GZCaF1tUkz2++LQYdUtGPTuwBb07Nq0o8iNNXE
   ZplqeX6aO9B8Q6e4Z8bAI0c+zsnuwo/kMQLIA66HOd48/El5CQJ5Ge8o6
   U=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 121044182
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SwqLt6zrZccpb/Wu6Oh6t+cKxyrEfRIJ4+MujC+fZmUNrF6WrkVRz
 mRJCmmFOa7bMWWjfdB0aIix800Pu5SBzIM2HVNopSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPasT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVNU5
 KYSCDVXVy2gvdmn5Z2faPZIjdt2eaEHPKtH0p1h5RfwKK58BKvlGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVkFUZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqhAdpOSOTorJaGhnW39m4VViAudGGp+6P6oUubV85fE
 Fcbr39GQa8asRbDosPGdx+3unmfpTYHRsFdVeY97WmlyKDZ/gKYDWgsVSNaZZots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsUg8t89Tl5oYpgXryos1LFae0ipjuH2j2y
 jXS9iwm3e1P1IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2tYji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:vDXHrqDHVQWOKBrlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:KJsSX21YY1fRejInI+pOvLxfKNo0KHf9yS3pHmyCMndMZ5m3Vnub5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A4O1Sig3rFJNzfjFoig2d70NYqDUjx5SsDh4wqbQ?=
 =?us-ascii?q?8qZPedgd1HjuBjA+sTdpy?=
X-IronPort-AV: E=Sophos;i="6.01,252,1684814400"; 
   d="scan'208";a="121044182"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iChGnpII+2p9ajBwW6Kl5LkRgJhnI4AUZBKHexQIkK5oTAZY1atjx+3uZvnQuJp0Seo2DGr+uKeZel6lLhqNX3IuDTg5yu8+E8GOd9Om9EYkoS3GgQVOSggeXNlHE6wmERYYwAWRvYfB4QYqMJGy2IKQpcTdlZah0lF9mAZ9/D5W1tJ8q7Lwv9fKLwUorauOm8e/vSUbeM86CoJ1bYGcMBwdvdaxWvB8J1/YsEGsfdngULAbf7yqvxtFps9Ocnr7Lcb7MBDF1BMHV/HVTMUhJ0DovULIkRfDGrE5/TixJKo21JMS3ryQJtsAPzH5SSMt8NXMpPzGC3md7CbUm/cTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzrYmWJalqXA0q+sl+9kg/YSXzJcnmqZbIQzHYhqDK4=;
 b=X61J8iCYEY1MVbUUOWLpBaEf7KIfv8YCNriybUDUWPnt+Kc0SPL0DbKkKvvgFbJHyKW/D0LqwCPvMAf2M/MyjntVwMVfdEtSqMT85qlfRS1lgoU06CMEWuLuN5AfyyxEwXEn0Hl9lBtO0ynEH4zPm6Gk7WxW3VD7rSne190uKOalHS/BXi+pqCZ1K8qOlQi7CSd+fmsoRsB52yla7kI6nqN5XxuElxT9yFfDG7u9tOEglnT6wbLv3RDbhskXRvMXfOAR3Lghg/xNZ9RuBktrTIEHsFssvTaKI3fuztHnkzd/mHtEyyo4vJUdgPyApUMfyY3TVDfQc8NQOJ+XjHpFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzrYmWJalqXA0q+sl+9kg/YSXzJcnmqZbIQzHYhqDK4=;
 b=WM06JyBn1o3klUuiwHBJ0lAfA8xjFgXnWpCV3UliBbQCx9BrWz6sttJfjfPCJzbhBokhggkVg/6J2UKSjR0Gl73NBHWOm7RIJmJ1/suRiTXc6oN3sD8QXifhuZUTTIT6cRV8XwMKrEoAD73DORcPCU4lVtvqHVlFiD55lWzzwW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <96b4db3f-bbf8-b04e-da5a-9af894152200@citrix.com>
Date: Thu, 3 Aug 2023 16:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] libxl: build fixes for recent CPUID work
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <226f087d-34b1-1a27-4048-f9c6ce3d2d76@suse.com>
 <90f011cd-5c85-0480-2e47-be6f229800f6@suse.com>
In-Reply-To: <90f011cd-5c85-0480-2e47-be6f229800f6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0132.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 3732bb31-4215-47c4-d839-08db9433faf2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JSz4kPuWJzUPO19HyzgZziXF8CJDcSPB6d1/fcZ0P4+r7lkjC6eQuDDAnIxRrBpazPHGsmME2G0PBF2cYU0SBUR/xUjlfwWO6QN6bMmogujOBD1L+gzeNj8VorVw6gNFVhkpEy9b/I/dvK3C00/ncwEkSTaoSJYO1rALBeqqKbTvCAejwb/hA8jYOMzC+Ea4Eg/j+uEXeD6tElLQ+yT5bEyLBGP8wrd5jkHKL713ek7tKL3QtmemgSsgjFOyOOv2oEwAnLnX6dXyTE629EPlBt+TmutZ4m7LX/fw7+1aKrAjfSLX+TqSU8lMmF3nCysxALNqN+poFDmB/IxnsFAhNm6KQwOYA2+07nvZH4ls7KNnW7kdSWKxSFpEJ9YC1dybgqS1qxxrB4lmxapikgbCF94zIa7R30nlgHKEux2IXZej4TS0H7xRAa4yahEtFebTF3Fq6gKraUqmx+8CqYEy9xYCcXw4ATelV0yxlexwLLLvX5JgsHw0yOGvxN1Pa+5AyUjIWtYZmtsxO8cEg/zhCSikeDMy/KMpjrL/54b3fvxeYrp4YJ9PIDkY8fP1Nn0cpNqkFx3F9Op1PhhVNt0aNa64BvFVnFv4aO0TwrlC1P95KsQSz715bePIOS/FEAK/d4e2es2lI7lIvSQZHmpgQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(66476007)(66556008)(54906003)(66946007)(41300700001)(2906002)(316002)(4326008)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(6506007)(26005)(558084003)(186003)(36756003)(53546011)(31696002)(86362001)(2616005)(478600001)(6512007)(110136005)(6486002)(6666004)(107886003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDY0SmtBT2lEN0pqKzFVc0J5MnI2dmQ4UkV2WGF5ZnN1bDhzRjJEaGNDVmNi?=
 =?utf-8?B?UHI5RmR2R2NHRkFLektiU3RVZFhXQzlSbU1JY3BveG9XcEhHZ1JiWjY4K01h?=
 =?utf-8?B?TU96SEFnZE1Ic21SNWJNNEhnV0xKYWoxaUk3NzRPVi9seFRUNm11WURBMFNL?=
 =?utf-8?B?VHljM09WU2Y4OE04eVkxa3llWnUweG5WaDR5b212YTB0YjFKUnJUdVVVSXBl?=
 =?utf-8?B?QkFrdzRLVXB2ODNpa1dFRE5nbjZNc3g3SmxmU0hkc05TbVl1T1RrektjbUo0?=
 =?utf-8?B?U0s2T29CbkkwOVdQejg2a0l1MHlkb2lHLzlNMmw1UVZ2c2RWVXQ4cXZPdk0z?=
 =?utf-8?B?cXJ6VjVIZXBOc3QvWWtGUDVQemFTZmU0Vk9uVmNqeVQ1ODYrNWxDdkNHMDhn?=
 =?utf-8?B?RTZGcGcwQ3NCNG4rYk4xclFuZ2c1QTJ5Wk52dVNqaEdVZTY1cEVvUHNBMzhO?=
 =?utf-8?B?eEZoTUxzd3kxY21GeUZDZ1IveEI4QXVuVDBMMjVXTnJELzV2NWVTamxKcHpU?=
 =?utf-8?B?WWpJck9hdE5lVzRyYkhlNFNwbGRtY05YOW81VmhGc1grMGdKM1Z5MGFYNzVn?=
 =?utf-8?B?S3EzOERZYjAvVnRkanltSmtnQi9CeFh4Tmg1ajJIS3RVYVdiUklFeHdlL3dS?=
 =?utf-8?B?dGxZalBaWkhlbHd0enBJdGRNaWh0alRObDI3RGhhM3lzOHFmMklwejlVZTJk?=
 =?utf-8?B?S2VDUDVjT1J4bkJsa2JvS3ZYYnoxYTVkaEJkRVhjVE9YdUNZUURXN0F2cXA3?=
 =?utf-8?B?eE5SVTNNbnRtSDluZ1JVUDNVTFdqcFd0ZWJSbXVSWkVDVVd4UlJEbWFpQ3l5?=
 =?utf-8?B?VkVMelV3eXhjckh5RCtDOGZaTGVjSjZyWnRhZXlYaDUzbHRxcVQ3OVFqWTY2?=
 =?utf-8?B?YjAxcVVnZDVxOUZPeWJhaUo2NE5xNlNiWjM4N3NNTDFyS1NGQUNGbVdyMVI1?=
 =?utf-8?B?OUJ0WXRwNzhPcWRaNXV2WGpSbWJUL0xEbjN6dVgwMzVGdnoyQVdPTXVOUm9D?=
 =?utf-8?B?UkVjYkd0KzkwQzc2WWdiVENWN2JuTGhTa0VZUEg3b0x2eWtBSzhRRExXMXlU?=
 =?utf-8?B?d05pNStFang0M2hxQkhJV3JUTkROWGpGVXJ5cmVsU2cwTisyNlV6TVZrbDdK?=
 =?utf-8?B?VkM3RmhxbVZXVWdzZ3g3VG5RK0FTZVJoUk9waUNUZThXZzdiTUtnRWFSN0t5?=
 =?utf-8?B?U2x2TUtnZE9yWUpsNXNSWHUwaW1HWlg5S2hIUUM5NzJsREhWaDBXUUNxcEZB?=
 =?utf-8?B?ZjBmRjN1WGJQb0xodmMwT3h3VnBlSVA2Wm1KMkVXOEJDQmNSQW1VaUtrUzcw?=
 =?utf-8?B?cFFIV2t0U2toank5ZXFSQ2RaVDkxOE1rU2RsSk1QSmViZHJldXJMV1lOTUxx?=
 =?utf-8?B?MlIzaldkdmZTbDhPbWN4cTN0VGRlM2hVWjBFRVV5clFiYUJHbFp0L1RUOUx4?=
 =?utf-8?B?MmU1VmZXc3hZN2JMWUQxc09Udm9oOUcwMTM2MkhvWTF6ZExTUEJ6Q0pRYmdP?=
 =?utf-8?B?QXhWRkVXMGF0MmR0MS9nOVgvMWlxWFE2bUp5QWZmNEF5NWtrUFhad05uNWph?=
 =?utf-8?B?Z0E4c3VCZU1DWStzSmpNM2VzRE12YitLU1J2NFVxb3gyNC83T2dXZ3crK2lF?=
 =?utf-8?B?RUVYRnVGV0VjS1c5UzFwUXY3NWJkNFIwKzdyeDNFSlY4aHZtOVc2VzRZT2VZ?=
 =?utf-8?B?V3hxT3BXQmNaUHFIb2ZPTGhIelYvajJNUU1JcjJ2QVRLQVg0M2J5VDZPcWlr?=
 =?utf-8?B?amZhMEVOOGYvSjdud256RU94UWQ1U0VBVGU4QkZwd0Y2UkNjbDEwazRaeURh?=
 =?utf-8?B?RnhkWld0emtFeEFLQ1M4c05OUEZQYzVnZE9WV3lSQWxVbmdRMW9nZlNtZlN4?=
 =?utf-8?B?aTAxcWc3YXhvUlpLdDkrU1oydlJYWURtK2RqbGVxVm5vWWExaEhaWGl0N3Bh?=
 =?utf-8?B?UVhueERtbWhsejAzdUZERkxaQVlZRTl0MlFBcnBhNkV4SjdGOHZkeTVlOERP?=
 =?utf-8?B?S2pKd3pPNEJqSUJPRGk2ZjVnd2lqNFB4SG9LSEh5ekVnbG5NdUpld0N6VHZD?=
 =?utf-8?B?dzloNzl3OEloUEY5aWM1RktSSmlCRjB2VEhPOG9WMXBkdmxucDRzdlg1Rktv?=
 =?utf-8?B?Q1NIcDJjNE9yM1NmbklYL2xPZSsyam5aTzhDQUo1NWpsS0FoMXdwWVBiK0xV?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s+s2Y0naKaC5zsAZo3M3sCtN9uuxpeCOnaB1oJaAgXv01K/Q4lfijXDpBVTMgygUN7Pwzt5R3S0HBHHwfTX4K69HvcXIG5zbUN2MDfqM/jyTXTQ5w/e1wEjJ5PU0zCDoPUW00wetSyVOJGKbtffxXD9ALmPzNKr9CVd+Vy7/H6Xh/5PoG1zvriDqHjTaB8m2rCEFwFYdWJVRkSLaZ6H/mnXyMAmY9mYAczDSQuJ2UaJuVpMM3Fzt6UOHRTwVjlmHZkNv+stkTsyCtG6lDdhUGgg8+Rm1TlisCT6mvC4gGcWATA3Zoou96Eh6d8wsAj0uX9xyMxzYoQ992t4VM9YJenq1ceEMH5UfeVRWCLsCcgV7qcqrC8UEzHEZNs7HG42hH0KsZ2CiuuhZxv/U6VnRl2TCMRjDBODMFRm7w5RU/obWfwO0cu5hCNFgjvH7eoRCLhCdr1bCe7WOpcNhK2rNPWUOm26/Qn/PV3gsSLc9guI5wk/LvQCz+u5XDJYdY/tZKXMJ5Zscv0jHihack5Ag+L9pDu4mb2c7NWrH21RMvs+j1I490zxSN0oIYnMwwRd0uAg6lJzY6sN0In04sXJ44UlctblmiefIRpJSYBT9S7fesewhFlroRCjF4OlKdSWCn2v6xY197eb8FQH9RCG3qAUoY8yQG0XcqW2ZElqLUARbzuhazNJMdFEfgrl74quDcUgHw+hiGkochgZmLdxIY6Ffj1lFchE3oMAj9kYd0NnfGDKrWK+QMUXBfImkGvu0AGvMSCQwDG/Pe9yatDi9hWrGAj2GEFFNb9gLhFs9xhvZ9e5rHXRHxm9KLpjF3o12
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3732bb31-4215-47c4-d839-08db9433faf2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 15:11:58.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7HARcFFe1gCnq8mz/iRG7CQVTRCE3ZlvMh6TmCC6QmSj8wmWqhiGycjCfDeM5XuktPx8RPXsT+sKkxd41qev0k1L4jpT6gl5b1noevbo3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB7116

On 03/08/2023 3:32 pm, Juergen Gross wrote:
> On 03.08.23 16:13, Jan Beulich wrote:
>> 1: avoid shadowing of index()
>> 2: allow building with old gcc again
>>
>> Jan
>
> For the series:
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

