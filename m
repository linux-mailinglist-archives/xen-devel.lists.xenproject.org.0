Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E953430F6AA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 16:44:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81354.150224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7goF-0008V8-MM; Thu, 04 Feb 2021 15:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81354.150224; Thu, 04 Feb 2021 15:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7goF-0008Un-Iz; Thu, 04 Feb 2021 15:44:43 +0000
Received: by outflank-mailman (input) for mailman id 81354;
 Thu, 04 Feb 2021 15:44:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7goE-0008Ue-3j
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 15:44:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db2496f3-8448-4a16-bc6b-70f885cf3084;
 Thu, 04 Feb 2021 15:44:40 +0000 (UTC)
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
X-Inumbo-ID: db2496f3-8448-4a16-bc6b-70f885cf3084
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612453480;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:mime-version;
  bh=JkA87PxF1f+tFET4zL1TpEeD5W3Km6MeasPyajbc5cs=;
  b=Oy7NAhqy2bulOqA0lSEJ6QsbZhA1Co/ssmiIZjCTFHqfHRP/alGkOO5w
   pQa2aEjA7zWfdDLSKxhL1+AOEk1Zx2l99cGFWkzLWe5Tje+l/fNQtDESk
   DxC2+bjTdyiG8QmCaeiOljhCFSaiE1wiLAR1KW7TXp9PkW0gx7HgnOWXj
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: C2USyzTDgFgdyWogLbozy1r19L28oH9JTvuGVD2/4YVkH6uNtYTZl7f3tOaRBds/1Q9tCgsP1R
 pSdd0/jaL9AnrAgTxmPHpH3kzV/6aTOg8Iydkuawzs3vX2SZjCzBeLD0hcJh2wXHucWCPhOPr3
 VrTbQ2fcqYbtjRLOtepPM0vhVxjUKMCnP4sUxd5gOnGoafcM9nCbozm4k/CqU0yisXEZAXs6Ww
 1fVQPscseI3RBSCBG+SuIuhpLwWb7ovKGyrlaArpOez0RKWQT5/WXWgMk8D7vEzcGuW7snlKsw
 QL0=
X-SBRS: 5.2
X-MesageID: 36515698
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,401,1602561600"; 
   d="scan'208,217";a="36515698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXgbBce77C1w1i8z+jgr7GaHCUmU0Ekn2io0Tgd6StsqLQsR3qNL8TxsxnJn+uzpkNCbkEGcUAA/dmdSe/ra0S2SSYH5zvEwURESzwagtx0X+cuhMEVl5KgQe6bEX1uYsvpLSiEopK7CB3NBhtBwqBtayw7zgO1deFc+7WMn/pDc2xKPTb0b9Ww6/n0RSJTlupbUfodW2TD7O5fcRzxYiDJQ09kf+0/yPDuSSKFznHSdun+ctwn2O7UQCi5wUksaQET2nRbqtLjwFnNTxB4QCh9uBTdACbtQg4MtHq0un7GqgYPUQdYHxO2A7UNgOdLuJAYmyngKN3lIpaI48ujECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gajSxu+YPkD9OLVK68Ew0Ph8EwEK3azAMNN+Wd3s/EA=;
 b=g1uSzXfJUYsRPrwqECRwpkqKDEoZAhY86shlxbKzlsk9DH9tmwY8Wm2EBJRx+D22g8hv40POl5JyRvetEnunjN2yfH9gvI67cvkb0Ns5HqgPyPIFaxxJuNuq5CYrQsFKnFJSUroxy2tnhj3+XSk8+9LNrJA6yn4hJ9H97kfHekOqc9ajvFytTXrMfTiJkOlbVNLq44RFmuecYz+RvNf8N6RQtS4gNEwS6IEUOpuOkt7XyrGe7g1h36tBpAmjBmeDohoqFEkXj+/MDEjKCjLLCFMkIao9Jle6LO4cX8CrncbSdzxTFZCqBl7JVUPXnPX3oc2xIRVqG9ZOHtEt9yD/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gajSxu+YPkD9OLVK68Ew0Ph8EwEK3azAMNN+Wd3s/EA=;
 b=fRnaI1PtPHpHolFjWpqr6GkK+8PJjGyzSXO/3VrCrl12I93uGI41gi3cH5s2Pj4eTHFV4jfkMxaSyWCIORUYoTxw/X1UHzhUE0BPvTeACT/a8/iGZYSi+T6IIJJcbGfUBdMkdZG2Hs1lAxAstq29GhbvxLR4rW4yej6JFh9wVN4=
Subject: Re: [PATCH for-4.15] tools/tests: Introduce a test for
 acquire_resource
To: Oleksandr <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20210202190937.30206-1-andrew.cooper3@citrix.com>
 <CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com>
 <6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <79a41e5b-0717-f31b-3cec-60b716777603@citrix.com>
Date: Thu, 4 Feb 2021 15:44:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1727A7134F178C16BAEA78C6"
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0418.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::9) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ac715cf-47a1-43a9-9679-08d8c923c327
X-MS-TrafficTypeDiagnostic: BYAPR03MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4535ECD3BE1F7A5DF0DE92BFBAB39@BYAPR03MB4535.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2G/NjEvKvE/x7k8I/Vzk4frs4Kf0s1bWLYjQrEhGdLtneh+jvnrutX+xieXGEf6uL80RFBWa/QOiRb2iT42UnrIBJuiiWqBMPD/AmtaZfOJAfh4R3EF0K3H6mdqGdJFiac6ABHmIzrbNk6r1ua+FuuIqjjnVvWtJYl8KTWA70EYohF5UQHM685xdeOeRX3CPkhrI8qnYCSlzESWJsp1vYISTR5TJaS05VGTz9fmdlcw+IKGzsj/YS8yAaSkcpXwT6lTzvSy+3T6EKXtm6mdYE96MyRBODj1seIEzEzojWbgdp5kAgIZa0daSU3CcqFZjG+8+/fCmO90lArBgToR0Uz9yjlCm0+E2I8zeLFE0Mgp9Lc11cIPeMwwC19kkcLDuojm9/eZ2F6ykfmHBu7KiM2jDoCsLjrLMXTnUfQo9l5th0EN9c7UetFd033Pq02rIcdW3sY3kxqcGiF3jCr5MoSyXTpmDk0/pJXs+BA6nQkVdH5f0RPyfQZU9QL1rTrSpk404H4CS3+6mm8cfRERFoFw/jgIk45JbrVTQlyXC8rGwbt4fnk8i7FmdJMDuc4F3xOwvV1zzy7+g580VyEWUn82aa6xJzCJ8I9Uwma9z6zI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(36756003)(26005)(6916009)(66946007)(86362001)(6666004)(66556008)(31686004)(31696002)(186003)(2616005)(8676002)(6486002)(956004)(478600001)(2906002)(16576012)(53546011)(5660300002)(8936002)(316002)(16526019)(4326008)(54906003)(66476007)(33964004)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eS9penVqT29xMkJqMHJUSDZOUkZBYi81MmNFajBkSXFlN0Y2OVZwdzZiMFFp?=
 =?utf-8?B?aXhpRGExc3pvMGpOTnpOYlA3MVh6cFFjdXVuS1UxZE9WUHJ4WmV1elVLK1RB?=
 =?utf-8?B?NkRFTGlBK3VaSWQ1NDZkek5SMlEyWTVBelhhSXJTVjJDeXdkQkdLS2Rmcmpm?=
 =?utf-8?B?M2YyNnIzZW8wUkEyS2w2cWp6U1lEMnJaUzJhenhoRDBObWNiUjJwZ1JVTisr?=
 =?utf-8?B?RUpEalp2Y0t0S21jRE1uNjBacG1COFpJd3hoYXlsd2FCWXRiWUJvL1hMdWJ1?=
 =?utf-8?B?OXJFdE9hUE43WTBqQWNHNE9nY1pUcjM0dE55anNTNjVVNEJ2SldYcFRHN0lY?=
 =?utf-8?B?RmU0dXQ0Ty9nN084bVM2NnNFeHd6WnRiRWxYdHhraWJES1k2S0dMVXRHVjA4?=
 =?utf-8?B?ZG41SUt5N01aWGdsQ2RRbnNWcHpuMG5DMGdYV1Y5T3J4bkw1SXBjS1VYdEll?=
 =?utf-8?B?QzhmQ3ZyTytpKzV5czVTRWQ5NUtIM1BRdEJ2UEJZd01RQmlZSHRndVlqdFpZ?=
 =?utf-8?B?Ujk5R0NxSE44bU1sZmU2TEs5R1NleFBpMDFZRldrM01HcWk5V0xvWWk0OGtE?=
 =?utf-8?B?VHlxbTNOY1BSTkJ4SVFtR2pxeWd3VHhYZ3FwVCtmRVpRc3lvaVdWRjVHMTFZ?=
 =?utf-8?B?RGJFd3U1cWtrb1YrbGZvS2xPVFlkdm5lckZzeTFlS3Z3WXJGYy9QMVlCU2Qz?=
 =?utf-8?B?bkRteGgyb2NKRXhQUFE4dWtTaDhqMXRleG9XRU81RWU5Vm8yVmJsWittMDJT?=
 =?utf-8?B?cU8wdy9GK0hDWHVOd3UrQ1M1K1RMaExTZ1h3Vmc5MDFOSlBUVjUzL3NRZ0Qz?=
 =?utf-8?B?dmJHZHJFV2hFbkM5MUxaK051WlRNVGVkN3FsNFpBelRTc28xQ3JrWms3eVVJ?=
 =?utf-8?B?S0JlQU83WDE4R0poWklBMXlSOW5mcXFRNWZSVHVGZjFrdllqTmJhVGxEL1ZP?=
 =?utf-8?B?N0g0LzM4eDhvQ3pOWGV6N2NGZVIyblZSYkxuYytHUFNLZU5OSjhEK0ZVa3R1?=
 =?utf-8?B?akVTYmh2R1RDRE9PbzZVMWxnT2QydG5QK1M2RmgxbG4xb1lXOWpZZ1hVSWpu?=
 =?utf-8?B?WW9wbDJ2WWRCbTYyeXNhd0lsWGV5dmVITXE3b1VpSnJ0UEtPQkdHazFlZmZS?=
 =?utf-8?B?VFZCQVpvYzNNVitEZ24raGh3S2MvUnQ4U0hhNmlCMzlzZ2FUR2ZxUmtZZ3hV?=
 =?utf-8?B?eUJFd3pMZlJCdkMxbWhCOG54b3N1L2k5ZnZOM0xHeTVzYllkN1FRWit5Y0Uy?=
 =?utf-8?B?UzdZM1BaVHQzejgzVHlsM2ZNUTdOM2IzbFFtOEVFNEVpSlVQa3ZjVWM1a0pp?=
 =?utf-8?B?UVdiZlI0K29YZVFkbSt1RjB0b3pqWDVVR2h1RlVEZndScEQvdDNWWVhpakdy?=
 =?utf-8?B?bjVQNWR6ZXh0dWtGQUxDL0VyR2pDMW11NW9BR1dMWmdqaEFyM0RXbmJCOWJM?=
 =?utf-8?Q?i7L3AjRh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac715cf-47a1-43a9-9679-08d8c923c327
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 15:44:31.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZ6hB6MMDo80P2vLQ5wRp3BS9dl4Qnp4COOS0Dvn5YB5kC7F4c3u/qAHyl/7gCLYcchSZCJr1hZOoYmDmoWHaEwHjrlE4B59Ixmt0EORN1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4535
X-OriginatorOrg: citrix.com

--------------1727A7134F178C16BAEA78C6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 04/02/2021 15:38, Oleksandr wrote:
>>
>> Hi Andrew.
>> [Sorry for the possible format issues]
>>
>> On Tue, Feb 2, 2021 at 9:10 PM Andrew Cooper
>> <andrew.cooper3@citrix.com <mailto:andrew.cooper3@citrix.com>> wrote:
>>
>>     For now, simply try to map 40 frames of grant table.  This
>>     catches most of the
>>     basic errors with resource sizes found and fixed through the 4.15
>>     dev window.
>>
>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com
>>     <mailto:andrew.cooper3@citrix.com>>
>>     ---
>>     CC: Ian Jackson <iwj@xenproject.org <mailto:iwj@xenproject.org>>
>>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>>     CC: Jan Beulich <JBeulich@suse.com <mailto:JBeulich@suse.com>>
>>     CC: Roger Pau Monné <roger.pau@citrix.com
>>     <mailto:roger.pau@citrix.com>>
>>     CC: Wei Liu <wl@xen.org <mailto:wl@xen.org>>
>>     CC: Stefano Stabellini <sstabellini@kernel.org
>>     <mailto:sstabellini@kernel.org>>
>>     CC: Julien Grall <julien@xen.org <mailto:julien@xen.org>>
>>     CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com
>>     <mailto:Volodymyr_Babchuk@epam.com>>
>>     CC: Oleksandr <olekstysh@gmail.com <mailto:olekstysh@gmail.com>>
>>
>>     Fails against current staging:
>>
>>       XENMEM_acquire_resource tests
>>       Test x86 PV
>>         d7: grant table
>>           Fail: Map 7 - Argument list too long
>>       Test x86 PVH
>>         d8: grant table
>>           Fail: Map 7 - Argument list too long
>>
>>     The fix has already been posted:
>>       [PATCH v9 01/11] xen/memory: Fix mapping grant tables with
>>     XENMEM_acquire_resource
>>
>>     and the fixed run is:
>>
>>       XENMEM_acquire_resource tests
>>       Test x86 PV
>>         d7: grant table
>>       Test x86 PVH
>>         d8: grant table
>>
>>     ARM folk: would you mind testing this?  I'm pretty sure the
>>     create parameters
>>     are suitable, but I don't have any way to test this.
>>
>> Yes, as it was agreed on IRC, I will test this today's evening and
>> inform about the results)
>
>
> OK, well, I decided to test right away because going to be busy in the
> evening)
>
> I am based on:
> 9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem
>
> I noticed the error during building this test in my Yocto environment
> on Arm:
>
>
> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
> test-resource.o: undefined reference to symbol
> 'xendevicemodel_open@@VERS_1.0'
> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
> /media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1:
> error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status
> Makefile:38: recipe for target 'test-resource' failed
>
>
> I didn't investigate whether it is related or not. I just added as
> following:
>
> diff --git a/tools/tests/resource/Makefile b/tools/tests/resource/Makefile
> index 8a3373e..03b19ef 100644
> --- a/tools/tests/resource/Makefile
> +++ b/tools/tests/resource/Makefile
> @@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)
>  
>  LDFLAGS += $(LDLIBS_libxenctrl)
>  LDFLAGS += $(LDLIBS_libxenforeignmemory)
> +LDFLAGS += $(LDLIBS_libxendevicemodel)
>  LDFLAGS += $(APPEND_LDFLAGS)
>  
>  test-resource: test-resource.o
>

Urgh yes - I didn't fully strip out the libxendevicemodel uses.  I'll
fix that, rather than having this test link against a library which it
doesn't use (yet).

>
> I got the following result without and with "[PATCH v9 01/11]
> xen/memory: Fix mapping grant tables with XENMEM_acquire_resource"
>
> root@generic-armv8-xt-dom0:~# test-resource
> XENMEM_acquire_resource tests
> Test ARM
>   d3: grant table
> xenforeignmemory: error: ioctl failed: Invalid argument
>     Fail: Get size: 22 - Invalid argument
>

Ah yes - you also need a bugfix in the dom0 kernel.  "xen/privcmd: allow
fetching resource sizes" which is in mainline, and also backported to
the LTS trees.

However, this did get past the bit I wasn't sure about for ARM, which is
good.

~Andrew

--------------1727A7134F178C16BAEA78C6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04/02/2021 15:38, Oleksandr wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com">
      
      <blockquote type="cite" cite="mid:CAPD2p-nPr_OD7cMT-Ny6vyGsY4nMXuENgrqv0pfYRYtE5srnkQ@mail.gmail.com">
        <div dir="ltr">
          <div dir="ltr"><br>
          </div>
          <div>Hi Andrew.</div>
          <div>[Sorry for the possible format issues]</div>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Tue, Feb 2, 2021 at
              9:10 PM Andrew Cooper &lt;<a href="mailto:andrew.cooper3@citrix.com" moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">For now, simply try to
              map 40 frames of grant table.&nbsp; This catches most of the<br>
              basic errors with resource sizes found and fixed through
              the 4.15 dev window.<br>
              <br>
              Signed-off-by: Andrew Cooper &lt;<a href="mailto:andrew.cooper3@citrix.com" target="_blank" moz-do-not-send="true">andrew.cooper3@citrix.com</a>&gt;<br>
              ---<br>
              CC: Ian Jackson &lt;<a href="mailto:iwj@xenproject.org" target="_blank" moz-do-not-send="true">iwj@xenproject.org</a>&gt;<br>
              CC: Wei Liu &lt;<a href="mailto:wl@xen.org" target="_blank" moz-do-not-send="true">wl@xen.org</a>&gt;<br>
              CC: Jan Beulich &lt;<a href="mailto:JBeulich@suse.com" target="_blank" moz-do-not-send="true">JBeulich@suse.com</a>&gt;<br>
              CC: Roger Pau Monné &lt;<a href="mailto:roger.pau@citrix.com" target="_blank" moz-do-not-send="true">roger.pau@citrix.com</a>&gt;<br>
              CC: Wei Liu &lt;<a href="mailto:wl@xen.org" target="_blank" moz-do-not-send="true">wl@xen.org</a>&gt;<br>
              CC: Stefano Stabellini &lt;<a href="mailto:sstabellini@kernel.org" target="_blank" moz-do-not-send="true">sstabellini@kernel.org</a>&gt;<br>
              CC: Julien Grall &lt;<a href="mailto:julien@xen.org" target="_blank" moz-do-not-send="true">julien@xen.org</a>&gt;<br>
              CC: Volodymyr Babchuk &lt;<a href="mailto:Volodymyr_Babchuk@epam.com" target="_blank" moz-do-not-send="true">Volodymyr_Babchuk@epam.com</a>&gt;<br>
              CC: Oleksandr &lt;<a href="mailto:olekstysh@gmail.com" target="_blank" moz-do-not-send="true">olekstysh@gmail.com</a>&gt;<br>
              <br>
              Fails against current staging:<br>
              <br>
              &nbsp; XENMEM_acquire_resource tests<br>
              &nbsp; Test x86 PV<br>
              &nbsp; &nbsp; d7: grant table<br>
              &nbsp; &nbsp; &nbsp; Fail: Map 7 - Argument list too long<br>
              &nbsp; Test x86 PVH<br>
              &nbsp; &nbsp; d8: grant table<br>
              &nbsp; &nbsp; &nbsp; Fail: Map 7 - Argument list too long<br>
              <br>
              The fix has already been posted:<br>
              &nbsp; [PATCH v9 01/11] xen/memory: Fix mapping grant tables
              with XENMEM_acquire_resource<br>
              <br>
              and the fixed run is:<br>
              <br>
              &nbsp; XENMEM_acquire_resource tests<br>
              &nbsp; Test x86 PV<br>
              &nbsp; &nbsp; d7: grant table<br>
              &nbsp; Test x86 PVH<br>
              &nbsp; &nbsp; d8: grant table<br>
              <br>
              ARM folk: would you mind testing this?&nbsp; I'm pretty sure
              the create parameters<br>
              are suitable, but I don't have any way to test this.<br>
            </blockquote>
            <div>Yes, as it was agreed on IRC, I will test this today's
              evening and inform about the results)</div>
          </div>
        </div>
      </blockquote>
      <p><br>
      </p>
      <p>OK, well, I decided to test right away because going to be busy
        in the evening)<br>
        <br>
        I am based on:<br>
        9dc687f x86/debug: fix page-overflow bug in dbg_rw_guest_mem</p>
      <p>I noticed the error during building this test in my Yocto
        environment on Arm:<br>
      </p>
      <p><br>
      </p>
      <p>/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
        test-resource.o: undefined reference to symbol '<a class="moz-txt-link-abbreviated" href="mailto:xendevicemodel_open@@VERS_1.0" moz-do-not-send="true">xendevicemodel_open@@VERS_1.0</a>'<br>
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/recipe-sysroot-native/usr/bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/8.2.0/ld:
/media/b/build/build/tmp/work/x86_64-xt-linux/dom0-image-thin-initramfs/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+e00e0f38c3-r0/git/tools/tests/resource/../../../tools/libs/devicemodel/libxendevicemodel.so.1:
        error adding symbols: DSO missing from command line<br>
        collect2: error: ld returned 1 exit status<br>
        Makefile:38: recipe for target 'test-resource' failed<br>
      </p>
      <p><br>
      </p>
      <p>I didn't investigate whether it is related or not. I just added
        as following:<br>
      </p>
      <p>diff --git a/tools/tests/resource/Makefile
        b/tools/tests/resource/Makefile<br>
        index 8a3373e..03b19ef 100644<br>
        --- a/tools/tests/resource/Makefile<br>
        +++ b/tools/tests/resource/Makefile<br>
        @@ -32,6 +32,7 @@ CFLAGS += $(APPEND_CFLAGS)<br>
        &nbsp;<br>
        &nbsp;LDFLAGS += $(LDLIBS_libxenctrl)<br>
        &nbsp;LDFLAGS += $(LDLIBS_libxenforeignmemory)<br>
        +LDFLAGS += $(LDLIBS_libxendevicemodel)<br>
        &nbsp;LDFLAGS += $(APPEND_LDFLAGS)<br>
        &nbsp;<br>
        &nbsp;test-resource: test-resource.o</p>
    </blockquote>
    <br>
    Urgh yes - I didn't fully strip out the libxendevicemodel uses.&nbsp;
    I'll fix that, rather than having this test link against a library
    which it doesn't use (yet).<br>
    <br>
    <blockquote type="cite" cite="mid:6586dd8a-8596-0226-f3d3-02cd9e361a52@gmail.com">
      <p><br>
      </p>
      <p>I got the following result without and with &quot;[PATCH v9 01/11]
        xen/memory: Fix mapping grant tables with
        XENMEM_acquire_resource&quot;<br>
      </p>
      <p>root@generic-armv8-xt-dom0:~# test-resource <br>
        XENMEM_acquire_resource tests<br>
        Test ARM<br>
        &nbsp; d3: grant table<br>
        xenforeignmemory: error: ioctl failed: Invalid argument<br>
        &nbsp;&nbsp;&nbsp; Fail: Get size: 22 - Invalid argument</p>
    </blockquote>
    <br>
    Ah yes - you also need a bugfix in the dom0 kernel.&nbsp; &quot;xen/privcmd:
    allow fetching resource sizes&quot; which is in mainline, and also
    backported to the LTS trees.<br>
    <br>
    However, this did get past the bit I wasn't sure about for ARM,
    which is good.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------1727A7134F178C16BAEA78C6--

