Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5D30919A
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 04:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78663.143252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gUT-0001XM-PO; Sat, 30 Jan 2021 03:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78663.143252; Sat, 30 Jan 2021 03:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5gUT-0001Vk-IR; Sat, 30 Jan 2021 03:00:01 +0000
Received: by outflank-mailman (input) for mailman id 78663;
 Sat, 30 Jan 2021 02:59:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bynp=HB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5gUR-0001R3-7t
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 02:59:59 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1533a54-0093-415a-83fc-b48ff42413f3;
 Sat, 30 Jan 2021 02:59:57 +0000 (UTC)
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
X-Inumbo-ID: b1533a54-0093-415a-83fc-b48ff42413f3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611975597;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uKovM9+wVfOQs8FnBGbFYIQr88EHC9fp9CF7WWnTrBA=;
  b=fewju7LcECLVJkwIATGDHz0n6w/z98jkffn48OPDJcadTS5MHulV4rb3
   6Yjp+DhjMasAffChog0NEhRK/F8HcydlLvl6N5rVC393gqdMN+znzE3vl
   2S3sMBiRr2eQLE4RlN0+3Sqr54jruqgB1sBhiG/1OWBI++l2dFkXoONHc
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: n5gEJ2EVnCbMzigPRJPVtEQyTdER2G0FCW111CYACbZqIhBf2ppLXAqaFqhJagux6UKSyDaJzd
 v0t4X8IUVY9AM7YNfGDD3RaMMDfsFbhn+otrNJUYIzORpaWWEsyVOaIWtyNSxpAGHr3DXQf6mv
 XlCKNpZG09UeyKz5PWq8lnn8ugmB8bzSff1/1DkliPG1qWWSKV7k08Y+i9UoJc/oaN5XVLivwq
 hj1zvAFLfLIbHJtCshkY3+sJxyDcVyOUcW76DWYgoMl2mPh76iAfdnBWEsjSaqHP9vVQfF6QAt
 mxk=
X-SBRS: 5.2
X-MesageID: 37525518
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,387,1602561600"; 
   d="scan'208";a="37525518"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYiJNkXD3smKIi4JHRCZtnte+qTzfT8d0+035DEnGYrNJmL92YE5zpfvpLrDVmfn+r/LHm1y2XyoJ5KYvViJ9Zthf49om4UZM8IvtYSdYaIpoYn26C8sxwNLqVXC7b00xeA2hCf6iqyRSWJrivR1Jl5hmrQiobLF3STYniZ7WyK+jBJuaHsVWA1q94kVVLvMHcYbqT3rJDPeBSTcuw56TsXDSYLE3ow+HF65AqnXmQaGF+0H5l+F/cE3ZWWfN9+kPpzWPeuGhNZsoUeP5z+CquMNuiXp80AiHszfxaDVd1ZZ1tj986QE/pqQYLzVjGVj/Zc0czUacJUNnX6Wjeuj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ehm5WocJREES4kktI4IJlRiEaxQFeXfC8+q90Fthgc=;
 b=X+6SIyMhg+CKchHfDmcu9deRrrXq/9COH20wlWG4qiR6p+BDle+4b5YuKSKCDRCJ9rBFOuhZLG+6E4jZXtwWeNzAl7r4bZLdlWY2DsSHhO6qiu9F0iCqG7EIzpDwThX6xmtRW14yL3clJNzF6JU6xdXV5wqaFHZfWKOre7EUafboKeOArlPz9isHoE4S4HPUUntEwJ3Lk5fPHUNvdInbJVysTY7L/Jetk8Vb5tirijhmm8aockMG5zjt/mzoP7RGzFoLGV4CZYdb+tAMNMaCp7Y1ou5i+38t2WGKOaZBkcV/RT7VWqmQiuzUnZ7m2l6RTy1lRpyaOwtHP+7AfA3QDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ehm5WocJREES4kktI4IJlRiEaxQFeXfC8+q90Fthgc=;
 b=mlJ8pWgQjyQv+0sYed8UD9xFaiSxtHlwDQZ2qmaYbJmBP/6xRoXw4IVohI35Y769DlWb852gk2aFwbuT20HDGJMGm+0m4eoAEis94eyDMziAe88RHqCQ4Xtlc0kzw/ZvubYfm/GK2cRhWKC0ngx7A8C2WFQj6PAQ+AN23wRkFjI=
Subject: Re: [PATCH] x86/debug: fix page-overflow bug in dbg_rw_guest_mem
To: Tamas K Lengyel <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
CC: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
References: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <74f3263a-fe12-d365-ad45-e5556b575539@citrix.com>
Date: Sat, 30 Jan 2021 02:59:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <caba05850df644814d75d5de0574c62ce90e8789.1611971959.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::29) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf654187-e284-4479-33c6-08d8c4cb1cea
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5632:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5632D89C76E6100F3AC7B9A7BAB89@SJ0PR03MB5632.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tr6+yUy1FpjhVpGBfkmSqz1yGVguYehwoO5zVMdXX4LbTyj4m1ZA4n/JmxtNPJRxFevOp0SpDuTNKhQTEWBERuffmCfePsNBzM70V5fcEuGp8isj4ph/ub5svaa1Tmx0aUT5bR5L4mQhWVs6DAdunJfNbJvSisVDgyUbD0qyxpRoqmQbhI5hKPxGdvRuz09izmiPKPZaIIYNLV02xYa+Xf9agUsl5+9kR3UgZO6av5MhIVgc1U01olz/q7rRLmcKiRo4H2dIX4eEUvEELyGKyMFAFcqzTxLVAKzEC7AxdzAdYU6OqzFSGVjCEfewvTZS/9IYCKTjAdu9uHz8AJBnZYGIfUOU1Rn7Jd6dG5Gbw+x58CHIaDMHsX6REq2MoiMxeCrD3DaVPeCL0wzYWAGUsPBMYzizOPuXbxW3Gpx1sdlfnJbZJMxKjoxflrZ1hNRVOHs/v77C1Tj9ts2vrmBkUVdEYlj23Cd4i6CLEB3b0DHUQG4WhK45TpfhXhkuz0MzgIercJWjQgm0srUHsW6CHwsX+SqzNgcjGiKuSjjZnUxGWp8SFVHhF+D1Ro+/LXG1lln73UP8BWqoBtlh7ET5/pcHNnq8+IF65Y8mDJLRKIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(86362001)(26005)(2906002)(53546011)(16526019)(4326008)(186003)(8936002)(66476007)(66556008)(31696002)(66946007)(478600001)(6666004)(83380400001)(36756003)(316002)(31686004)(16576012)(2616005)(956004)(6486002)(54906003)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NEMxTHVJZ2ErMlU3M0d0eEhkaEdUaHRqeDdudWRMSS9DaGMwWWxiTWdZai9C?=
 =?utf-8?B?Vmh2UVVoY3NrK1VDZ0wwTXM4bEVISnJFWjNVNUh1T0lOdTVsY2VNak5hWi90?=
 =?utf-8?B?R01nVmU4TW5CQnBhTFJZd3krMjIwb1pjMzFjRXJ0TjFRclFEeXhncUdmbWJ1?=
 =?utf-8?B?TmhZNEhETWdid29abm5scURxKzNlOU5zdlRZQUNQNzhDZERXN1RlNGVxUXRo?=
 =?utf-8?B?eFBzMFJSVnZsSGdHWG1XSFpwMGRiWjlYamYzTUxDZ09MSjlpQ1dQUmpoYlhL?=
 =?utf-8?B?WU5QTC9GWG91R1BsaHN2d0RCUlliMjNHY3UzdzZSMDZ6QzhwcEZnaFhuLzMz?=
 =?utf-8?B?ajNqRzExSXl2SkNUMnR3S3JrSVFSNnd5Zm9DSEJJTmhGaGlIL1puc1pUY0Fi?=
 =?utf-8?B?RkhsRXdKbmxmS2c2dDIrZTJHUTFnRnVzWWRWRUNadnFFSE44OERZbDF5Tk1t?=
 =?utf-8?B?RlA2WVl5QWtJRy9xN1BidGJ6cTY1a3Vza25JWnVtTVEvMEErQ3VyNDZtc0Fk?=
 =?utf-8?B?c1Eyay83alQvM1BLd0hIc291U0FyajQxYS9nUkI2ZERlSTVZZFhkQ2NnNWVN?=
 =?utf-8?B?N1dFQnlNbUh2RkUvb3JyRGh0NjM5V2ZPVDZ1RUs3R0lxWUZRMjdSajQrelZw?=
 =?utf-8?B?aUJ1OFlTL2NlcW1La29UakIvaVRRTlQrbkEwU1Q3NWZ0YUpTYXhiVEkraW8y?=
 =?utf-8?B?Qkh4ZHpNTXlQaitCV0JVREFMTWJrUllZY0ZsaCtNOUZNeVhEVHcrYm85VXQ2?=
 =?utf-8?B?VDUzN1gvZTB1T0VKWnpYb2FyVExUSUVwUWV6aWwzZzUvaFZVdlh3dXR5UlRF?=
 =?utf-8?B?M3pVTUlmQTBJUW1WK2JHMGI5UkNNS3pYR3h3U0FpOWlIZFNta25RcHFHbnhQ?=
 =?utf-8?B?WEw0WTlwT1kvSmQrVXg4ZWZtblR5T1A2UGl2NENaL2JWTW1MNm5UU0piYTdX?=
 =?utf-8?B?RHc5UUkvaHo0a0JjckowOWVWdlFLTyt4RzFKQlFYVUd4aXVnQ1hKckJtSGNx?=
 =?utf-8?B?eDRoU3JTTVRMQU1hMUlGcGR2Vk9id1F4RXRPUDJDeWRvV1hQOEdpQWVsd3dZ?=
 =?utf-8?B?ZStmNXN2djBYYVNyY3lSajJWa3IxSXVxNHRyUkNWdTdzVVBOVExYNmNvZlVW?=
 =?utf-8?B?U0h1bi9NS21obCt0TTlPS2ZOMGxQSTVDeUE1YlBRWmhnN3U0ZVYrTXUyMmZP?=
 =?utf-8?B?TjVrL0xHUGFwNm1QNUp1L0RlRWZqakhKT0xOSWUzbElacmg3amU1YzIxSk9D?=
 =?utf-8?B?WU1zekFwTHNRbnBmbG8wcDR2S0pRRXc4MGlFRDA5WURzZ3BPb09SeS9mWnpB?=
 =?utf-8?B?QVYxRDZIdDMzT1hiRUtRU1hDVUdxNjRsbzNyNjlVaXAzbnVpTmRraEpTcTV5?=
 =?utf-8?B?MFF3U05rYUJJSXNKT3Ezbm1wak56QlR2Y2J0YUN5MEh6YlkyekpJRzZqS2ov?=
 =?utf-8?B?QXFhZDJmZzN6YXZyMitzR2w3UFdocFRhTVlqaG9nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf654187-e284-4479-33c6-08d8c4cb1cea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2021 02:59:51.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3BQeQxNhmT/ytXBA8TxelwmvMO48Yexv8q8aWo9kgqXN8f6Q4SHx/BHx/ylsnGYv776uttX9a7IZoe7XoCqvio+uZl9/XvV4jDNVxzJY/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5632
X-OriginatorOrg: citrix.com

On 30/01/2021 01:59, Tamas K Lengyel wrote:
> When using gdbsx dbg_rw_guest_mem is used to read/write guest memory. When the
> buffer being accessed is on a page-boundary, the next page needs to be grabbed
> to access the correct memory for the buffer's overflown parts. While
> dbg_rw_guest_mem has logic to handle that, it broke with 229492e210a. Instead
> of grabbing the next page the code right now is looping back to the
> start of the first page. This results in errors like the following while trying
> to use gdb with Linux' lx-dmesg:
>
> [    0.114457] PM: hibernation: Registered nosave memory: [mem
> 0xfdfff000-0xffffffff]
> [    0.114460] [mem 0x90000000-0xfbffffff] available for PCI demem 0
> [    0.114462] f]f]
> Python Exception <class 'ValueError'> embedded null character:
> Error occurred in Python: embedded null character
>
> Fixing this bug by taking the variable assignment outside the loop.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Sorry for breaking this...

