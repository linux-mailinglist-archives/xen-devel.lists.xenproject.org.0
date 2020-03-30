Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE6197B24
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIsqf-0007ae-0y; Mon, 30 Mar 2020 11:44:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QcrT=5P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jIsqe-0007aZ-0H
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 11:44:56 +0000
X-Inumbo-ID: d33bf7b0-727b-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d33bf7b0-727b-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 11:44:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69C04ABEA;
 Mon, 30 Mar 2020 11:44:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200328152954.6224-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ccbd2dc-d721-c23f-d67a-6a1f8520fb2b@suse.com>
Date: Mon, 30 Mar 2020 13:44:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200328152954.6224-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] x86/ucode/amd: Fix more potential buffer
 overruns with microcode parsing
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.03.2020 16:29, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -303,11 +303,20 @@ static int get_ucode_from_buffer_amd(
>  static int install_equiv_cpu_table(
>      struct microcode_amd *mc_amd,
>      const void *data,
> +    size_t size_left,
>      size_t *offset)
>  {
> -    const struct mpbhdr *mpbuf = data + *offset + 4;
> +    const struct mpbhdr *mpbuf;
>      const struct equiv_cpu_entry *eq;
>  
> +    if ( size_left < (sizeof(*mpbuf) + 4) ||
> +         (mpbuf = data + *offset + 4,
> +          size_left - sizeof(*mpbuf) - 4 < mpbuf->len) )

This proliferation of literal 4 made me look into where this 4
is coming from and why it's here. Afaict it's covering for
UCODE_MAGIC. There's no good sizeof() that could be used instead,
so how about getting rid of this addend altogether by setting
offset to sizeof(uint32_t) near

    if ( *(const uint32_t *)buf != UCODE_MAGIC )

in cpu_request_microcode() and adding sizeof(header[0]) into
*offset near

        if ( header[0] == UCODE_MAGIC &&
             header[1] == UCODE_EQUIV_CPU_TABLE_TYPE )

in container_fast_forward()? (The code following the big, 7-
bullet-point comment in cpu_request_microcode() may also
need adjustment, but I wonder if we couldn't better get rid
of it altogether.)

However, since the change as is looks correct to me and doesn't
make the situation much worse, I'm not objecting to you also
putting it in as is, in which case
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

