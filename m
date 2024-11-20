Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BE59D4002
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 17:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841150.1256661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDnWG-0006y6-NS; Wed, 20 Nov 2024 16:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841150.1256661; Wed, 20 Nov 2024 16:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDnWG-0006vs-KE; Wed, 20 Nov 2024 16:25:32 +0000
Received: by outflank-mailman (input) for mailman id 841150;
 Wed, 20 Nov 2024 16:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIcg=SP=bounce.vates.tech=bounce-md_30504962.673e0d75.v1-50da2c6bacbe48d09100b11880c22bc2@srs-se1.protection.inumbo.net>)
 id 1tDnWE-0006vk-S4
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 16:25:31 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c7b51bb-a75c-11ef-a0cb-8be0dac302b0;
 Wed, 20 Nov 2024 17:25:26 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XtmtY3m3jz3sNJZX
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 16:25:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 50da2c6bacbe48d09100b11880c22bc2; Wed, 20 Nov 2024 16:25:25 +0000
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
X-Inumbo-ID: 0c7b51bb-a75c-11ef-a0cb-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjBjN2I1MWJiLWE3NWMtMTFlZi1hMGNiLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTE5OTI3LjAzOTQ3MSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2UwZDc1LnYxLTUwZGEyYzZiYWNiZTQ4ZDA5MTAwYjExODgwYzIyYmMyQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732119925; x=1732380425;
	bh=4OekPSrvmM16fuMteoQFp4SJuFkojtxbg/ck2sPRHOU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VI4NnuifsDK62pFW7UcRuswKcoQ6J8aLe6DEojwTK6Ec6fP4tz+nawjL+SWI/RLhG
	 4HnFPRr4xt+zfpW2eMHKM1kRpXJWz4WuziFdu6VoTVp+5EWxkAx1BRHLuMGzIplNeq
	 uTw8xB/njk+WbLKwz/yhNylIAzpdi/jtKNh5E3e7lseP0iKdJmVZf49DbGQpY5o5K1
	 LhVALorNqzmxbPkszG/kcd9m2geP6coIje2qWdDOnQaeihUPGSykfCbV7s293JrnH6
	 WV5Bq+T2jrcLxjX6MJ0pm7/QntaWgBikRCVwkkRVAvf81Ly4TbEsM/+zkf0cJDt08A
	 O08/z3Z+/lKzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732119925; x=1732380425; i=anthony.perard@vates.tech;
	bh=4OekPSrvmM16fuMteoQFp4SJuFkojtxbg/ck2sPRHOU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LAqklu9DEEfn6GGiPw8yOQCbrlvcPMkhRqS9lDqRunFoQodyk9AsRy9U+yOI9MMtO
	 bzh4GyNj92yFMyR6+p1QZc909HGm58GUuNcSnXABcW1kbEp9IL+V9SrTKeJfnoRUq3
	 XM6/rFH+Bb/txrOwxtIFjJd2xQhVKygfBBrv1virrJuvKLXAh5u+AGe9UU7z6D4pke
	 b3Uew78NGX+bYh53SZFIArwzN4odMZyO7gbhes2WZDMN3SqLxcApNQNqre+MrgzXWa
	 IgUnfg1sGVySt4pqexd0SNBJnyarvXvWBcVXunDqRZyoDfUc5WD8d4FNAUi4hi9b5m
	 MECLu5EX+mHyw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v10=2006/12]=20tools:=20add=20support=20for=20cache=20coloring=20configuration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732119924614
To: "Carlo Nonato" <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, "Juergen Gross" <jgross@suse.com>
Message-Id: <Zz4NdBcbMLx3HywA@l14>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech> <20241119141329.44221-7-carlo.nonato@minervasys.tech>
In-Reply-To: <20241119141329.44221-7-carlo.nonato@minervasys.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.50da2c6bacbe48d09100b11880c22bc2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241120:md
Date: Wed, 20 Nov 2024 16:25:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Carlo,

On Tue, Nov 19, 2024 at 03:13:23PM +0100, Carlo Nonato wrote:
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index e3538ec0ba..4ed339e6e4 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -2195,6 +2195,41 @@ int xc_domain_soft_reset(xc_interface *xch,
>      domctl.domain = domid;
>      return do_domctl(xch, &domctl);
>  }
> +
> +int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
> +                             const unsigned int *llc_colors,

The hypercall seems to take a buffer of `uint32_t` for `llc_colors`, but
the parameter of the function is `unsigned int` instead, is there any
reason for them to be different?

> +                             unsigned int num_llc_colors)
> +{
> +    struct xen_domctl domctl = {};
> +    DECLARE_HYPERCALL_BUFFER(uint32_t, local);
> +    int ret = -1;
> +
> +    if ( num_llc_colors )
> +    {
> +        size_t bytes = sizeof(uint32_t) * num_llc_colors;
> +
> +        local = xc_hypercall_buffer_alloc(xch, local, bytes);
> +        if ( local == NULL )
> +        {
> +            PERROR("Could not allocate LLC colors for set_llc_colors");
> +            ret = -ENOMEM;

I think we are supposed to return -1 in case of error, see:
    https://elixir.bootlin.com/xen/v4.19.0/source/tools/include/xenctrl.h#L101

And there's nothing else to do, xc_hypercall_buffer_alloc() should
already have set `errno`, and PERROR() preserves it.

> +            goto out;
> +        }

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

