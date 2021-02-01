Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3730AB8F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79991.146039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bH2-0000Rc-TZ; Mon, 01 Feb 2021 15:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79991.146039; Mon, 01 Feb 2021 15:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6bH2-0000RC-Ob; Mon, 01 Feb 2021 15:37:56 +0000
Received: by outflank-mailman (input) for mailman id 79991;
 Mon, 01 Feb 2021 15:37:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWGu=HD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6bH1-0000R7-Df
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:37:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b47b2dd-4db6-43ad-8e39-40832e83f484;
 Mon, 01 Feb 2021 15:37:54 +0000 (UTC)
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
X-Inumbo-ID: 1b47b2dd-4db6-43ad-8e39-40832e83f484
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612193874;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EIzritZu05SnuimgO8QHGuCk8dlARUFYVnTJ1chxz1M=;
  b=cMYwPv6O+jKwjXB1gILL/qIGaC+qOaEh5mKeymPeQXSC6lKYy480HFd+
   n/Q94oyShrVjA8Nc6utZHkaZoiVTNdyBTMqUmbiE1PfdoQJpb3PlwqRxJ
   V797MEMSUsu/n8cHyExkRUSsNUsgHxiPuSb0aR5IscvmxkygjmpKhdv3g
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5chuxRv0pEc2w2U/VxD2C+uyuCXQaZMqhwX1ZilrJjXTzIrphgnfEhM3HjnLZ8mlrs0v7mll/N
 lQ/W2C6t0B+cGvmEZzq1MLDaIwF6yo9mAsF4zHaalQKegwkWCrrzTyhg0301gMts/4pjgly1zw
 JzPO1iVcpBqrZVkL/ne0F+DDqF+omjl+T/z9r96LAxLTcHHzzPqnJO5SxR2AAOW2af8fi5rDck
 tean62E638PfYC13O9BwEprlyO0oTdJlZlkrQ8zQkOLoffsox8x+1WlEaFvgapwV9wgLSEooOk
 M8Y=
X-SBRS: 5.2
X-MesageID: 36667757
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,392,1602561600"; 
   d="scan'208";a="36667757"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOLnakT0oALS5FFE9ZF0uDzYPwW5F0uG/kItqJ0WkHvfLuAmzF449BMKzQEstasOU6tXHdkUX6qbfk5uBCwZiy0Wvmfppcnk+w6EnfBuNm3ykrO8xy4E4650AM4Tna6duJLVMbvQxawyG2+STQU3oa4Fcq65x+5GpA+smFkApoI01qvpJ066EYeicH0jbh/6PBBJv79wfrqveEt/BL3QANeZLEMuQY0MOrlvgrqBKIGucmjoqzk9NHa1Gc2aOx2cT4/SjWQy5t0NUKJSep1BxDcaBJw+MBfCdkJtJjpaOKHZY3RplgEmNJwT/2gJJFBJeRiePPyENeSgsqwDbFtMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Nk6ujDwrukE7XA630RTM5uYNvmKaDCjAVPbpv/zyo=;
 b=Do8F3Qtj5IBtzWPc52C+4JUQASxcGglX/1WBGc4o+gvmoDrUWvmeF7uhP6zBO4IFBAWlLy/KGBmn4Qs/g4QOdejegroMSAIKONeADEGaPMXmrUM+FHLacbHbJCTwse//5+ICUVA+hmHOF+U+O2v+j8x9vsfHFhhEltabdaQOuw8gDH0fsCouu1KEdDg3uiQuO0rwRmSRNxNt/GKfwosWT1hTR1CBUKWyafqui5J0RACyxGwCVD9Ip/Rc1LagcLgTC4EdWUkDkbQB/6HjqQeO8hfSu2Pi92AiMe4SBfUDZZbe3Q8IKlz9XuqFLLgThaOnyVkKD7h+4COyaakVafU+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1Nk6ujDwrukE7XA630RTM5uYNvmKaDCjAVPbpv/zyo=;
 b=gt7eNCk9/ytdcWPSktMtJZgYVVcepcSJh9/3d+UL6rp629ybjQsdxKZ9T3lQSfUHjn6B3yHV5+hhJrHncj7guf4F9Q1YevfKvOW4V9ftaMdWXtS7wpCFsgqdgBOYUQJ8jvJj7DU6rRL6TYJFoCaLo6uiHxUlKYgxNQN4dWe6df4=
Subject: Re: [PATCH] ioreq: don't (deliberately) crash Dom0
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>, Ian Jackson <iwj@xenproject.org>
References: <1dc6fe4c-3435-462d-a339-085014ae0deb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f6c0504f-c83f-5477-0797-d6e6da616fc5@citrix.com>
Date: Mon, 1 Feb 2021 15:37:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1dc6fe4c-3435-462d-a339-085014ae0deb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::30) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4755d4e0-4f73-4a5e-77ac-08d8c6c753a3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3413:
X-Microsoft-Antispam-PRVS: <BYAPR03MB341349E44C7EED6AD7B68224BAB69@BYAPR03MB3413.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UyzfuL1LJBH+wuGjdUn3di5VTr6o2oJy4W8oyI6ZNrqAPiWn0DbEg4aIM2Bz5gFhd4ngFnVFncoIlJKifKolY91Sb76RppT0CecYmt/N29akywQBHUL+NubZADLxZZ1Jy4/YiHPVoJzMZ70mHm96o0IJjsFTVg8VKekpdhSR1Jl4/rhrU6HfJPe82oCTwy5lX00iLW/TvSEqODzcl0r+blZZTFL1ALpVDddcjTj+93mUUhGCe4vRF18Qki7nDv1IKkcKW7HNmXnSag88nxot3pfDErb60MgqTlU6wsf7K6tXqDj2lGz/BwPZQrqUyqLRmq9TnPegf40ICf1jFKnneEtSMNEn51DqcYpX5A+ykB9EldVV4yccY5/Ghjq4QWrFiBS0DHHJjrJHIkmsiVTz63lg1wtlYITmloBFQ871Rrk/cHKSK64LGT6LvA9NMT/22heYkv6kDw1XjcpSCrUmTqQsyfp4e7l91E1lT5NVB7WmGro0zXOJpEDr5PzIjfQSJQ8sj4rOqMYbKs5IP2f80LEiNNOiV4vq9/QkifMw+kkCYj5Zq+SJq/IOHY5/vQm/0GNhvBSG906Nj/sPy5Y1nHnqUbhuRPn8XTyC3i+gdEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(66946007)(66476007)(66556008)(5660300002)(54906003)(316002)(16576012)(110136005)(6666004)(83380400001)(26005)(186003)(16526019)(86362001)(2616005)(53546011)(956004)(8936002)(31686004)(8676002)(4326008)(36756003)(6486002)(31696002)(478600001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckRrR1hRWkVEYU1zSng2S2FlWlhSQWxQSTB3QkxIaEU5Zldyd0gxQkh6U1d1?=
 =?utf-8?B?NURtOERuN0dLdFptaEkrR1RaNWRzenZMd0g0TXNRTll4S3RqZTJUbGdrN3dt?=
 =?utf-8?B?NWlHS2JZK2xrN3RZR1FiMWRCZFpUUkdMTWtJRWdpcjcwWGhobTBUNkxLZVRl?=
 =?utf-8?B?Y0ZDL05CTXFPQVAxM1ltbU4wcjZVRVh4ampiblY2Um9nd0MxclQ0cmN5RE5B?=
 =?utf-8?B?S1FLa3JPM2dsc2FYb29hdW4zcTQ4c2tMbVJZdW5xM0x5ejVCNFg0UGlQa3pT?=
 =?utf-8?B?bkJFeGkwTFJ6dTNmMUt0RTl3WjcwVUZybnZub3JUcVc0b0dyMFVLMDJEZUE2?=
 =?utf-8?B?NmY2aXhXaDZwZGJvZnBiTDlYeVhaNGo4NGxVYm80aDNDcUo4RnJqckxDK2J0?=
 =?utf-8?B?QUt0NnFIVDdpRy9BMEVPblRlbFFhN0xPTjk3L3FYMk9xZjV3SklSWTdzMVA1?=
 =?utf-8?B?R2MwUHFPK0kyMEJhbHBWWFhWTzN0WFgyRkhCYlRhTXYxR2lPZXU5MlhsUmpm?=
 =?utf-8?B?V1Z6dUdEbUFhWEw4WEg3N09EZDNoVjRoQ1MyaEdVY2tPWURtYUVybytTSVZB?=
 =?utf-8?B?cVZjelpxQk9NQ0RJcDZ5QVFuTlRLMVQxZXFpeDQrNHBEaGhPSDdiZWpHZVJG?=
 =?utf-8?B?NnNRYU5yQyt1elk5MDU4SzBZWlZFbGF1YXRlVjFuVEZ4dE8vQWRtd1pIZ1VD?=
 =?utf-8?B?Y1Z1WGM2ZlZYMURLQllsN0lHZ1hBbGZrV3EzV0dPQjRteDZtN1R5c0FWbXpi?=
 =?utf-8?B?UVhBQmJSZmczMlNPS2Q5YjlCMUg0Wld1UU50WGMvK0tDaXBsMVdrQy9SMnl1?=
 =?utf-8?B?dlJyTWlocHZrcXAwTi9xWkRkTkRSRVRaZ0VwaUxJOVhnbUxocXNFNVl2RGh2?=
 =?utf-8?B?dTNXZTBXbmlOeXp4bVFxeHlhdUo0RjJvWVVmMnBvR3NJWi9ETlRjbWxuVEZV?=
 =?utf-8?B?eTNqdER0RkpWRkRsd0hSdXYxVzdSeGVQaW5MaVVHdnBPWG9CRXIyNXdPUWJl?=
 =?utf-8?B?R1dNZmZJMGhPdFNtSmxhUUpjQzlPQ0pnQUE0VU5Uc0Z4ZEF1WUdxRHJsM2w2?=
 =?utf-8?B?NjhNWVMwRlk1SkJ1MC9zL3ptTmtYaG5zcFFaMUFFb2Q4N1BqNUMxMithb2w1?=
 =?utf-8?B?alh4NzJRSTV4UGJ0U1dsNDU3MVlVcjlaSUZpWmxIWWZlZjQzakdpNEVzQ1VV?=
 =?utf-8?B?VFNoVGJ6Mzh5UTFNUFAySU8wSHN4WUpTQjBoR3dJRy9oZWVtckJPa3dEaWtz?=
 =?utf-8?B?bFRlOVI4Z3E1SkxvUDk3SVB4Q0QwK0ZFdERNSUw5NGRXZE5nbGt3NnNnMk5W?=
 =?utf-8?B?U2RMMDFyM3lpYkttRnFCTDR4cS9wYW5iMm9PaG8yejdKWnBwV1M3SzF3Mjh3?=
 =?utf-8?B?S3RyREY4TEU0anp0aUNpcTl1WFpDYndzL1oxY2VSMEpiYzJJQjNiOFUxNjRN?=
 =?utf-8?B?WEJNZW50aDdIbHNoNFpaZlVMVTVDdlNHbkcwWkJRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4755d4e0-4f73-4a5e-77ac-08d8c6c753a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 15:37:47.8337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EnMC/GcZN5zX/IOPRF+FRSjkME41cf0pNif4IYb9bw9jif4eyrZDWSuJ8dsR40mRFIxOhTQMbU6NGRLDKa2bxj4+6MfWsfFcBw5wFM3iLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3413
X-OriginatorOrg: citrix.com

On 01/02/2021 15:22, Jan Beulich wrote:
> We consider this error path of hvm_alloc_ioreq_mfn() to not be possible
> to be taken, or otherwise to indicate abuse or a bug somewhere. If there
> is abuse of some kind, crashing Dom0 here would mean a system-wide DoS.
> Only crash the emulator domain if it's not the (global) control domain;
> crash only the guest being serviced otherwise.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Honestly, I'm -1 towards this.

Asymmetrically shooting things which aren't dom0 only complicates
investigations, and doesn't remove the fact that this is an XSA.

I do not subscribe to the opinion that keeping dom0 running at all
possible costs is the best thing thing for the system.

In this particular case, the theoretical cases where it can go wrong
might not be the fault of either domain.

~Andrew

>
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -274,7 +274,7 @@ static int hvm_alloc_ioreq_mfn(struct hv
>           * The domain can't possibly know about this page yet, so failure
>           * here is a clear indication of something fishy going on.
>           */
> -        domain_crash(s->emulator);
> +        domain_crash(is_control_domain(s->emulator) ? s->target : s->emulator);
>          return -ENODATA;
>      }
>  
>


