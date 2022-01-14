Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB84448EAFE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 14:44:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257629.442815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Mry-0007fK-RC; Fri, 14 Jan 2022 13:43:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257629.442815; Fri, 14 Jan 2022 13:43:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8Mry-0007cg-Nt; Fri, 14 Jan 2022 13:43:54 +0000
Received: by outflank-mailman (input) for mailman id 257629;
 Fri, 14 Jan 2022 13:43:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vmv=R6=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n8Mrw-0007ca-QJ
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 13:43:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0036b718-7540-11ec-9bbc-9dff3e4ee8c5;
 Fri, 14 Jan 2022 14:43:50 +0100 (CET)
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
X-Inumbo-ID: 0036b718-7540-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642167830;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GQulAueYbnBDJjh8LkEPKNkAlkuMRtAQE9hrMSapsg4=;
  b=QNHAOUy1dlmhOV4+u79Ym59FvN+myWMdL9JRCEQ0wmxnxnZgy/z1nLSm
   /a+EiL1y/Jar7hyXYs+WTLXbU/aE63zXnR8ydlK3ykxZPBRcBPh/n5bh3
   5HpuTmy2uH3ekCAqPcKIt88TkRTvQiuuOMB3ma6SWskW9lLnddiv1OBjC
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: OyBNRnItrgu8TrjFlKAfuFC4fP+gLHRobV7Ge1j8XnnUWKhyM22dh59wXkRjGjhMr9f82NIbhx
 KufQsu+14IfTGni7tknVATsNMkv4kUFY3XyWTYwRsDzSzZEHN+x73ajfrd7SY/NKEg9I8GM1c/
 Tlmyctc5Nv+C1N8EMXY2VKqQWAx/2id1yoaranUBJRDTdnJZqYQSOJ7pdKvMb92dzmfa1q2E69
 fjOAjws3SP39TJHS6xb6HU6dqEwe1iZL9Eand06wVVz9SUPEMzBfzDBeG6tsdkXZUNAiJymG8p
 150LGmHkWgCxWEgk5KxihMNs
X-SBRS: 5.2
X-MesageID: 61491131
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4KsX4K/QIDBmQq13Q6v6DrUDJHmTJUtcMsCJ2f8bNWPcYEJGY0x3m
 2EeCziEbP2LZmfzLd9+Pt60pEMDv5HWzt43TgFlqys8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dg3tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh2+
 ohXrqHzUzsQAY/Tqt8ETiN0NA5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGhWth35kVRJ4yY
 eIlMWVwaBf4YyZKK3BMUJVhnbmBmmfGJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 CTA9mfwABAfPfSezyaI9jSngeqntSD2RoMUUqG5//hCgVuPy2hVAxoTPXOypPLo1GalQdlRb
 UoZ5kIGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy67LGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqYh1ZVxA4oMPfmb4RkSD0V8tZPImagYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNvBFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gMsVmSx28za67onAMFh
 meJ6Wu9A7cJbROXgVdfOd7ZNijT5fGI+S7Zfv7VdMFSRZN6aRWK+ipjDWbJgTy3yBl9zPllY
 83BGSpJMZr8If43pNZRb71MuYLHOwhknT+DLXwF50nPPUWiiI69Fu5ebQrmghER56KYugTFm
 +uzxOPRoyizpNbWO3GNmaZKdAhiBSFiWfje9pILHsbefFsOMDxxWpf5nOJ6E6Q4zvs9qws91
 iznMqOu4ACh1SSvxMTjQi0LVY4Dqr4k/C1rZnJ9bA/4s5XhCK72hJoim1IMVeBP3MRozOJuT
 ulDfMOFA/9VTS/A9ShbZp74xLGOvjzy7e5XFyb6MjU5YbB6QAnFpo3tcgf1rXFcBSurr8ou5
 ban01qDE5YEQg1jCufQae6ukAzt7SRMxroqUhuaOMRXdWXt7JNud377gMgoLpxeMh7E3Dabi
 VqbWE9KuenXroYp29DVnqTY/ZyxGu5zExMCTWnW5Lq7LwfA+W+nzdMSWeqEZ2mFBmj15L+jd
 aNeyPSlaK8Lm1NDsoxdFbd3zP1hu4uz9uEClgk9RSfFdVWmDL9kM0Kq58gXu/0f3KJdtCu3R
 lmLpotQN4KWNZ63C1UWPgckMLiOjKlGhjnI4P0pC0zm/ysrrqGfWEBfMhTQ2ixQKLx5bNEsz
 es74ZNE7gW+jlwhM8qcjzAS/GOJdyRSX6Iiv5AcIYnqlgt0lQ0SPc2CUnf7sMOVdtFBEkg2O
 TvF1qPNioNVylfGb3duR2PG2vBQhMhWtR1HpLPYy49lRjYRaicL4SBs
IronPort-HdrOrdr: A9a23:fLHEyKw4/5eWmubFWWg2KrPxs+skLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WB3B8beYOCGghrSEGgG1+XfKlLbak/DH4JmpM
 Jdmu1FeaHN5DtB/LfHCWuDYq8dKbC8mcjC74eurEuFDzsaE52Ihz0JdDpzeXcGIjWua6BJcK
 Z1saF81kWdkDksH46G7j5vZZm3m/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTuj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZsA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQvZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv0nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLVU5nghBgt/DWQZAVwIv/fKXJy//B9kgIm00yR9nFohPD2xRw7hdYAo5ot3Z
 WzDk0nrsAIciYsV9MPOA42e7rBNoX8e2O9DIusGyWUKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.88,288,1635220800"; 
   d="scan'208";a="61491131"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjGdtLy2LLq2/wjJXwHc0lwZccWAfzmGpactN2dZBHxxsUrVVpUlyAg1QzQaPCMea8D0z3+tkplHq/2DTUnB1LXv8LcJUEWVcTfCEvQ8eD2vwYbuDUIA+YKakhoD6IvgZHDm/0JE/+mLgGGyAWdcK6hFxIgS7Pv32B28B3m6BKjTgOtcoS3Z+7Up/K1kGfYMpkGlXNw66yskxTzJCVz/WQ4DMCsLjdP9iPNMpbV1AFOtHd+lmXDcc7ZS9qtkfJVChGdLcMaXd2DMJcuVcJIW8GEs6pjQwNIvRfI+0lwjQZHBpTqmeU6uBuAZvarW0NxxncftIkuR1lpzuw3kDp0G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5zm/qg9AgnMmqKsmLuBRBFsWgZfbtV31x/hP1k2gfk=;
 b=k7Hb4pQ7vZf0gCEx68mjjISLKXhhQUPQT1FAZzVwjxeKVZgDOYPpKvXAGmHaA99suP8dZqoBLQMVXJfnCNRieoh3qP/JNSeNq/PL8FnBrbUXVVrYcEJt69emsLbPRnqS927Hn0GJ+9oKaW69Ik/p91IHY0ug0QPMUfyiYtWok/7cOVH+SjGH1citZW4pwyMToGwNCW2PPKgVYmbs1/LDOtVQbMq3Zl67G7Je90HjvLN2COigBW4NmAGxwbpHhkxc3tV+KisNgbRZYnYUqo7BAsZtfq4CFTSVOce8uyQ+1ejJUZUDTCruLTeZbzM23NlZCOS+XUIE7jGs4RmAmXNwTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5zm/qg9AgnMmqKsmLuBRBFsWgZfbtV31x/hP1k2gfk=;
 b=W0hYJ/NiM4gXC/1LmIIEI3SRnXtkFjjB5Q7q47xv/srm2st5DNKcYoSTxBcLmex4llZ6RoTlqcFCt9B2yxhSJI0OOZtcPuk/TSLZzb85MQilCvCfVwkY3412HjlzvYDTiS8AkGhkyRoQKM6y3pL13JOxZMzSugKd3yQhBuKusTg=
Date: Fri, 14 Jan 2022 14:43:37 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH 3/3] x86/spec-ctrl: Fix NMI race condition with VT-x
 MSR_SPEC_CTRL handling
Message-ID: <YeF+CZj9p3Z6j7ts@Air-de-Roger>
References: <20220113163833.3831-1-andrew.cooper3@citrix.com>
 <20220113163833.3831-4-andrew.cooper3@citrix.com>
 <YeFxqOPqi/DPpugL@Air-de-Roger>
 <528354d2-9de0-fe12-20e7-b3500a5f6ad9@srcf.net>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528354d2-9de0-fe12-20e7-b3500a5f6ad9@srcf.net>
X-ClientProxiedBy: MR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::25)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b76ddeeb-1e66-45ae-627e-08d9d763e168
X-MS-TrafficTypeDiagnostic: PH0PR03MB5814:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR03MB5814400C4CAFBE47A2CA4C488F549@PH0PR03MB5814.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7Bzw0659Au1o7opTn/RJjzpMJcL8JQ2ikQzmLdJxIRipJVdLRmJG8AVCU3kgQ+eRowda+cO7EQz6mZ8PWG9l1i+JQqlz49SetUFoT5IYmtjS8d6M/upkm9FO7L18V2DxzJ9Sf6yIEhy070tUuWGHjRqfR8Uc51pkhIviwTI1uFRLES5E7om4rlwDoHxYiQ0kqsVLRKlc0/2d1ipQZxvS/WGwuYX25DUsa8uKkQsouAiJOTXC8BJBMZZ9sYBq2DyfYOI/YNTpx1Vr19KL1iEvDDsZkhYz2giBqguX8pRhCTEaVpfYnTvZ8FQxPU3yY/wMjJx0BRf+kfUh/WeQILQE5vhBuOKG+yhnM3VQksbr1Rp/x7fLrEcYTQhPQ28/1s9sy8rZTXBTATjDV9mtTOoLPhcYJbanqqtJ1N21rPSe5EpbCmYyoeLOBBsqdMz2erXJMe7+dS6g5tmCrDT2WGbtWsWonlmPL+tM7oOwiCKxFIa9vi95bQlt9f2b40bxB5wrpXKmLYTA1P8GXKXxyGlTtBa3Uo8LJXcljbJ+UnmNO74/H9mQWnng6JPW4OtNyOgu10pvmkqNf0Vc1m+Z7RVp2nWTw6VdtZ5Bh7ZIZirpNSjfuKxWo3rNrPAe7YbCNmcQL/DuXH17pTlQ+P+i0838jriCI6PpXau50vX7vHz24Df+cPnmTtgxoO1QINg0pPuYvJcfjy6XHew9UHO9/jMDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(86362001)(66476007)(85182001)(66556008)(508600001)(6486002)(33716001)(5660300002)(6916009)(2906002)(83380400001)(316002)(66946007)(38100700002)(26005)(82960400001)(186003)(8676002)(6512007)(53546011)(4326008)(9686003)(6506007)(8936002)(6666004)(54906003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SndkMEpUbDlwUkEyTjFGRDFZb2hvT24rYm5mT1pIRlBGZ1hQTE1Hck11LzBX?=
 =?utf-8?B?R3UzcGEzdURhZTU1NXBjOWlJYisxcWNnNmJKblQzVFBnSWFQOVMxS1MzbzRh?=
 =?utf-8?B?ZEpmK09qZkNTMDRCUDIyc0lMemttYWgxcGNuQkQ4Yjh4QWlIV0t6K0NSbnRK?=
 =?utf-8?B?aHJyMXZGeFJIa1gwV2RhYVQ2MW4vTExsZ2JmRW5CQ2NnMDJuR254WXJHa09o?=
 =?utf-8?B?ZWlyNDdadnd3aUJlNTRTNTAyVnRxVytTVWx3ZllCekxUY2txT3dPRVhjN25l?=
 =?utf-8?B?SENnVkZ6RDV6K2k0dkM5cjA2bXU4MGlyV25aalBCaFlGYjlSNkQ4Rmk2WEpQ?=
 =?utf-8?B?c3FhZm5ORVFOMGw3TUxKVnpIU2JVUFEyTUFzZGMxZlFvS253NjhTSGlvOWp1?=
 =?utf-8?B?d1VjMm1yM0Jwd2JIN2Y2alBSTElCZnpCRTJSRWxreWpyUmRFOWhkbjBPRWhX?=
 =?utf-8?B?RU85OXlUalhFZWViOS9KR3hscUR2UGRBcDVPZ3cwRGFkUDhNRzVKeWwyMWFm?=
 =?utf-8?B?N0U0TFFmeGV0QnYvcG1qQXprNDhWZkt3VW9McFlBamM3djczNmg1a1VvTWYv?=
 =?utf-8?B?UEVDRXpJMEtndEQra0YzZVJBUmxLZTBmVnFuSWJxWWdPNngyclF4VDJBZVRq?=
 =?utf-8?B?cEpxODFrQkpQUytqMWFkeWl5Rkt2dGFLRWpaajNENlQxemFJZ2h3cFIzRDc1?=
 =?utf-8?B?Q3VGdzhjRkpiV2psUzFsL3NrakVJTElsd0xheXorZnA1QTdHcHg5cFlSanpy?=
 =?utf-8?B?a2hMaGlqYS9JOHh4cE9MSGQzVWFGZHNhdndaL2NnMjZrYlJaQ1cyb1VpOXJ0?=
 =?utf-8?B?S2hYTXVMc3pUY0NFS1UySVFpVE11bENUQ0Y2VjVTNWoxWHhSTisva0Q1RHlK?=
 =?utf-8?B?K1lpV0JXcTY2bGxEOU9NeDVGdlgxKzBjaElJaW1rQTlCb1dJVDEreWkrZmRk?=
 =?utf-8?B?dnIrbHk5NmhVRnh1S2hORU84MmlOdmNZZUsyaExxazBtZ3c4MzJ0a3pUaytt?=
 =?utf-8?B?ZGFPSGdtYjloa2t1bC9sRnJ2cnFoYjE0OTN0NEExZDBNd2pVNWNTay9YOXBz?=
 =?utf-8?B?ZTFCUDg4N1hZZ25Dcm1BWnRHajN6ODd3S0ovZWFrK2trR1dzK3JKUWVwZHpZ?=
 =?utf-8?B?YWRJTGZZOTdyRXl3Q2l0Yk5zUnIybUhOZ0kzaEowNDJJaGphalNGNUZtNFpv?=
 =?utf-8?B?Y2hvQ0R5NUpBMUg1Um80TUFvWkhsR3JQa1c0QllHZXlmMVZ5bnI0WUg1Vnlw?=
 =?utf-8?B?MndxR2JZZDZQeFRFWDdNcVBBOVVML3BORlRpWWZuM3BONHlsSkRJVGVtaXFG?=
 =?utf-8?B?TlZYWk9kQW1oZ0Zsa3VBMVBrVTdld1BXTXhPUFpqd1dFeDhoN1VKSUpFYUlW?=
 =?utf-8?B?VWROUG9BcHcxVkVKd2hwZmxWV1V1Vy9ockxEUmgvMkhxZEw4eUU5a09WNC9W?=
 =?utf-8?B?Uks4ODNBRUd5TldNMFI5WTBZN3lPMDloTXNCVmhyOXFmNFE4aWVOcXV6UlpI?=
 =?utf-8?B?cldlb1VVMjFxYm1pQ2pDU0Izeml0dGJGeTIwMXVwNDNJV1QyeHp1LzBwWDNE?=
 =?utf-8?B?aDg5clh4L0o1elVEMTVvM2xlejZxUWpHd3NrSnp2MmhWQTdyZFlvODNJNzRK?=
 =?utf-8?B?S3lxdGFkNnY3M0ViaGpJRDdxZUY2ZnhLZWdNN0dZaEpjb0xacTdCU1BnejBP?=
 =?utf-8?B?T2k1YXhYclU0OGEyZE91cnBXUDd5OWdxOHc4UCt5SmpVOW5yZzc0SmQ4MFpE?=
 =?utf-8?B?d1hHU0c1Zm0xVDljYXpkMUxzZEh0ZzlEUXNkNkEyS2pEQkN6Yml5aS9CT1Rw?=
 =?utf-8?B?OXh3ckVHNzdVcXpxbzhIdnBQbkNWNzY1S1VVMHk1cFhWT3BPOHAyUEhBd3VZ?=
 =?utf-8?B?cHZVK29nK0lVQkhuaXNmdzBTbmplcWI3Y1hveThTd0FQREFROXpiRm5BTHkx?=
 =?utf-8?B?WHdiSkgvTTk1VmFYa3duWWRoY29EVHFmeXFROHhKMnZqdGdlZE9Ld2g0Q0pm?=
 =?utf-8?B?V1lKNnpPeDZuTVFWS3BVSmswMjQ4MmNCNnJNWXlGc3ROMGExRVo3N3VxVVEw?=
 =?utf-8?B?bENDZk9ZeTNpY2lyY25LZUpEMmlOZFdtaUNrc3dLWWNlZk5lT1RKWGZxby8w?=
 =?utf-8?B?bFJ5TXVjcFQrdkgrcnk4dDBoZHYzSm5jSkF2RGZKTTFYQlkvYm1SSW9aLzNU?=
 =?utf-8?Q?7w6ZblMbwOMzowBfs0nfhBU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b76ddeeb-1e66-45ae-627e-08d9d763e168
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 13:43:43.5740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsGYFuZqiF0iwZdwGT88gUvrY3d0/WKGTTG80RIYE7mvaOcjDYxqmnxhyRsOiSHsFXFYFc5IKM3Jp7Db7x5zHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5814
X-OriginatorOrg: citrix.com

On Fri, Jan 14, 2022 at 01:08:43PM +0000, Andrew Cooper wrote:
> On 14/01/2022 12:50, Roger Pau Monné wrote:
> > On Thu, Jan 13, 2022 at 04:38:33PM +0000, Andrew Cooper wrote:
> >> The logic was based on a mistaken understanding of how NMI blocking on vmexit
> >> works.  NMIs are only blocked for EXIT_REASON_NMI, and not for general exits.
> >> Therefore, an NMI can in general hit early in the vmx_asm_vmexit_handler path,
> >> and the guest's value will be clobbered before it is saved.
> >>
> >> Switch to using MSR load/save lists.  This causes the guest value to be saved
> >> atomically with respect to NMIs/MCEs/etc.
> >>
> >> First, update vmx_cpuid_policy_changed() to configure the load/save lists at
> >> the same time as configuring the intercepts.  This function is always used in
> >> remote context, so extend the vmx_vmcs_{enter,exit}() block to cover the whole
> >> function, rather than having multiple remote acquisitions of the same VMCS.
> >>
> >> vmx_add_guest_msr() can fail, but only in ways which are entirely fatal to the
> >> guest, so handle failures using domain_crash().  vmx_del_msr() can fail with
> >> -ESRCH but we don't matter, and this path will be taken during domain create
> >> on a system lacking IBRSB.
> >>
> >> Second, update vmx_msr_{read,write}_intercept() to use the load/save lists
> >> rather than vcpu_msrs, and update the comment to describe the new state
> >> location.
> >>
> >> Finally, adjust the entry/exit asm.  Drop DO_SPEC_CTRL_ENTRY_FROM_HVM
> >> entirely, and use a shorter code sequence to simply reload Xen's setting from
> >> the top-of-stack block.
> >>
> >> Because the guest values are loaded/saved atomically, we do not need to use
> >> the shadowing logic to cope with late NMIs/etc, so we can omit
> >> DO_SPEC_CTRL_EXIT_TO_GUEST entirely and VMRESUME/VMLAUNCH with Xen's value in
> >> context.  Furthermore, we can drop the SPEC_CTRL_ENTRY_FROM_PV too, as there's
> >> no need to switch back to Xen's context on an early failure.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monné <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Jun Nakajima <jun.nakajima@intel.com>
> >> CC: Kevin Tian <kevin.tian@intel.com>
> >>
> >> Needs backporting as far as people can tolerate.
> >>
> >> If the entry/exit logic were in C, I'd ASSERT() that shadow tracking is off,
> >> but this is awkard to arrange in asm.
> >> ---
> >>  xen/arch/x86/hvm/vmx/entry.S             | 19 ++++++++++-------
> >>  xen/arch/x86/hvm/vmx/vmx.c               | 36 +++++++++++++++++++++++++++-----
> >>  xen/arch/x86/include/asm/msr.h           | 10 ++++++++-
> >>  xen/arch/x86/include/asm/spec_ctrl_asm.h | 32 ++++------------------------
> >>  4 files changed, 56 insertions(+), 41 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
> >> index 30139ae58e9d..297ed8685126 100644
> >> --- a/xen/arch/x86/hvm/vmx/entry.S
> >> +++ b/xen/arch/x86/hvm/vmx/entry.S
> >> @@ -35,7 +35,14 @@ ENTRY(vmx_asm_vmexit_handler)
> >>  
> >>          /* SPEC_CTRL_ENTRY_FROM_VMX    Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
> >>          ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
> >> -        ALTERNATIVE "", DO_SPEC_CTRL_ENTRY_FROM_HVM, X86_FEATURE_SC_MSR_HVM
> >> +
> >> +        .macro restore_spec_ctrl
> >> +            mov    $MSR_SPEC_CTRL, %ecx
> >> +            movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
> >> +            xor    %edx, %edx
> >> +            wrmsr
> >> +        .endm
> >> +        ALTERNATIVE "", restore_spec_ctrl, X86_FEATURE_SC_MSR_HVM
> > I assume loading the host value into SPEC_CTRL strictly needs to
> > happen after the RSB overwrite, or else you could use a VM exit host
> > load MSR entry to handle MSR_SPEC_CTRL.
> 
> We could use the host load list, but Intel warned that the lists aren't
> as efficient as writing it like this, hence why I didn't use them
> originally when we thought the NMI behaviour was different.  Obviously,
> we're using them now for correctness reasons, which is more important
> than avoiding them for (unquantified) perf reasons.
> 
> I've got some plans for changes to how Xen handles MSR_SPEC_CTRL for its
> own protection, which I hope will bring a substantial efficiency
> improvements, and those would require us not to use a host load list here.

Might be worth mentioning that further work will prevent us from using
host load list for SPEC_CTRL has a comment here or in the commit
message.

Using host load lists would also allow us to get rid of
X86_FEATURE_SC_MSR_HVM.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

