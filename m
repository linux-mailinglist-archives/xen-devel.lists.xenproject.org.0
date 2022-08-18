Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F85988F5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 18:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389693.626790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiTa-0001iS-2a; Thu, 18 Aug 2022 16:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389693.626790; Thu, 18 Aug 2022 16:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOiTZ-0001fb-VT; Thu, 18 Aug 2022 16:34:33 +0000
Received: by outflank-mailman (input) for mailman id 389693;
 Thu, 18 Aug 2022 16:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6Qq=YW=citrix.com=prvs=222213ea0=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oOiTZ-0001fV-1j
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 16:34:33 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a21faf50-1f13-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 18:34:31 +0200 (CEST)
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
X-Inumbo-ID: a21faf50-1f13-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660840471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6QhUF7mYchBj2qnKz25srQ7Hjg4JdaxQNZLFSH7v0jc=;
  b=d4mEv1oxv8M1qM3lKuUXMCjbiPDK9KwmMBF+2mS8ZyDq450U4veQD4ic
   nQnnHASY7K+4bcZDlBv6tedlIJ6AGiWN7UfyS8Kq8knU0hqA6u78rshc1
   5MjdWcHrOOBkEBnyF5MjPlOcbNjTmO5KIOYie6roHb0UIH7gvIi1lyz/j
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77631075
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BzRSi6kheibixv9m5zKeor7o5gz1JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcXGjQbqmKMzajf4t0a9vk/BkA75Hcn9RrHQJu/yE8QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37K2i4GhwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2ktI6oF8P5ODV0Vz
 sZfCgkWLRW9vcu5lefTpulE3qzPLeHuNYIb/Hph0SvYHbAtRpWrr6fivIECmm1q34YXQKiYN
 5FxhTlHNXwsZzVGPEsXD5Qv2v+lnHDlfxVTqU6PpLpx6G/WpOB0+OeyboGMIoPXLSlTtknD+
 U7ioU/7OAlAMMa4ziCa1VCvntaayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JSGeAn7ACGyoLP/h2UQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy17amzsDmqACQpdlQ4Ig09VkgA3ePKr9Rm5v7QdeqPAJJZn/WsR2+on
 WvQ8Hlj71kApZVVjvvmpDgrlxrp/8GUFVBtu207S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBN7faVUweXY1Q/EcG82FohZPh7x47jBkP1tOOc0ZYzLva
 0K7kVoPuscMYiLwNfAoP9LZ5yEWIU7IT4yNuhf8P7JzjmVZLlfbrEmCm2bKt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdyn3hW7T6CGvjGI+GPi+X2iIi9FehYazNjr4kRsMu5neki2
 4wOaZPVkE4HCbeWj+u+2dd7EG3m5EMTXfjew/G7vMbZSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:9T+Oiagxj7lZF90qdA0NnFD8C3BQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.93,247,1654574400"; 
   d="scan'208";a="77631075"
Date: Thu, 18 Aug 2022 17:34:05 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH 1/3] xenbaked: properly use time_t in dump_stats()
Message-ID: <Yv5p/a/hFa+zxXMH@perard.uk.xensource.com>
References: <68e71e3b-19a7-e062-9ebe-2e6f6aae0549@suse.com>
 <c87ae25d-5aa8-bb70-7d2b-ea6485a01f59@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c87ae25d-5aa8-bb70-7d2b-ea6485a01f59@suse.com>

On Thu, Aug 18, 2022 at 04:05:37PM +0200, Jan Beulich wrote:
> "int" is not a suitable type to convert time()'s return value to. Avoid
> casts and other extra fiddling by using difftime(), on the assumption
> that the overhead of using "double" doesn't matter here.

dump_stats() seems to be only used once, so it's probably fine.

> Coverity ID: 1509374
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- unstable.orig/tools/xenmon/xenbaked.c	2022-01-06 16:12:39.000000000 +0100
> +++ unstable/tools/xenmon/xenbaked.c	2022-08-18 15:36:39.918706853 +0200
> @@ -230,11 +230,7 @@ static void check_gotten_sum(void)
>  static void dump_stats(void) 
>  {
>      stat_map_t *smt = stat_map;
> -    time_t end_time, run_time;
> -
> -    time(&end_time);
> -
> -    run_time = end_time - start_time;
> +    double run_time = difftime(time(NULL), start_time);
>  
>      printf("Event counts:\n");
>      while (smt->text != NULL) {
> @@ -242,13 +238,11 @@ static void dump_stats(void)
>          smt++;
>      }
>  
> -    printf("processed %d total records in %d seconds (%ld per second)\n",
> -           rec_count, (int)run_time,
> -           run_time ? (long)(rec_count/run_time) : 0L);
> +    printf("processed %d total records in %0f seconds (%0f per second)\n",

Did you want to write "%.0f" or even "%.f" instead of "%0f"? It seems
that the '0' here mean '0'-padded, but without field width there would
be nothing to pad. I'm guessing you would want printf to write something
like "266 seconds" instead of "266.646168 seconds". Am I missing
something ?

> +           rec_count, run_time, run_time ? rec_count / run_time : 0);
>  
> -    printf("woke up %d times in %d seconds (%ld per second)\n",
> -           wakeups, (int) run_time,
> -           run_time ? (long)(wakeups/run_time) : 0L);
> +    printf("woke up %d times in %0f seconds (%0f per second)\n",
> +           wakeups, run_time, run_time ? wakeups / run_time : 0);
>  
>      check_gotten_sum();
>  }
> 

-- 
Anthony PERARD

