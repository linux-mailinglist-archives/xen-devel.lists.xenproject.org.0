Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 940EE93FA32
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766963.1177515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSpO-0005XW-1S; Mon, 29 Jul 2024 16:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766963.1177515; Mon, 29 Jul 2024 16:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYSpN-0005VY-Tv; Mon, 29 Jul 2024 16:02:25 +0000
Received: by outflank-mailman (input) for mailman id 766963;
 Mon, 29 Jul 2024 16:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBYv=O5=bounce.vates.tech=bounce-md_30504962.66a7bd0b.v1-117daf7f6245428b90b34a7189df7e90@srs-se1.protection.inumbo.net>)
 id 1sYSpM-0005Ti-Og
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:02:24 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef551a69-4dc3-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 18:02:20 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WXjmW3GVkzCf9KMZ
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 16:02:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 117daf7f6245428b90b34a7189df7e90; Mon, 29 Jul 2024 16:02:19 +0000
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
X-Inumbo-ID: ef551a69-4dc3-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722268939; x=1722529439;
	bh=QzxkKAT2sWOQONDycuNwG5buQ3Dcxg1jeKgeGHJ9llM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=t8pXpSQZ1HIfSS7O0bpzmX5ocXs+PmgzS3+7pgR0uE8TNcdDKlUzw5nhIwR5oxbI1
	 MDI9hg+uOB6+Rzewb8PEcD32tIA19v3QYIvQcVBcZoyDoNrKt6RQJSceavXWocvHwa
	 WLFqigbcNA2SO55Pl0CIxhwhBwPCsAZPodzJVNFTgnueVWqgk3qS8vxxDaVWfIXAy7
	 VmDulo0dRUoa1u9MR3+/BuZc2OoJt+kv7TIpPBQoNallR8UFAYpbYsPVgVFscjHILg
	 EHwXd1qfVSo7KQdsHvJuG/u+eijyhmFf4UbfpsevzJvC3EPCg4b7qlCt85oZwt7zt3
	 qzkcYoPJ1BKYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722268939; x=1722529439; i=anthony.perard@vates.tech;
	bh=QzxkKAT2sWOQONDycuNwG5buQ3Dcxg1jeKgeGHJ9llM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fWoYutFYTj58Q351O2Ko48DAZlMR5a9phMRWYAe28Oc0P+lDCi2Ct46VC9BT2TAJ5
	 vhLhyOGrGGGB+jzaSpXY7VizmmFL8dj8WE5zymHZdl8X0hoXeWeHpjTA7oZ+gR7wW0
	 6fgHYtX1wgun+1YHgsvG3JLPGLE5QmY5KiEPbnfYaRf9f1xjJ6WFtJH6d7nr5IIZp2
	 CYMTPDzqNfo56VJUq39RwpFg4kZ8PxZPWZxJwWU324AmNl0ts67nIUvXFwuPrCxK37
	 0YTa41o92DWWYE4GXz2Vk2Xd3IOWmy/q5y8jnkxm5rTWAZrFDdM+wMUdj0vobFbzHd
	 D0gEOwi8RAPqA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v6]=20tools/lsevtchn:=20Use=20errno=20macro=20to=20handle=20hypercall=20error=20cases?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722268938285
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zqe9CYQ7ODXMSJfo@l14>
References: <cbb751a7fab10d228513bb163c85c83d025330c9.1722265284.git.matthew.barnes@cloud.com>
In-Reply-To: <cbb751a7fab10d228513bb163c85c83d025330c9.1722265284.git.matthew.barnes@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.117daf7f6245428b90b34a7189df7e90?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240729:md
Date: Mon, 29 Jul 2024 16:02:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 29, 2024 at 04:02:41PM +0100, Matthew Barnes wrote:
> diff --git a/tools/xcutils/lsevtchn.c b/tools/xcutils/lsevtchn.c
> index d1710613ddc5..29504c9d2077 100644
> --- a/tools/xcutils/lsevtchn.c
> +++ b/tools/xcutils/lsevtchn.c
> @@ -24,7 +25,28 @@ int main(int argc, char **argv)
>          status.port = port;
>          rc = xc_evtchn_status(xch, &status);
>          if ( rc < 0 )
> -            break;
> +        {
> +            switch ( errno )
> +            {
> +            case EACCES: /* Xen-owned evtchn */
> +                continue;
> +
> +            case EINVAL: /* Port enumeration has ended */
> +                rc = 0;
> +                break;
> +
> +            case ESRCH:
> +                perror("Domain ID does not correspond to valid domain");

I think this is going to print:
    "Domain ID does not correspond to valid domain: No such process"

> +                rc = ESRCH;

So, `rc` is going to be the value returned by main(), that is the exit
value of the program `lsevtchn`. Having different exit value might
be useful sometime to distinguish between different errors but that
would at least need to be written in some document. Can we just return
"1" here on error? (I mean "rc = 1")

> +                break;
> +
> +            default:
> +                perror(NULL);

It would be slightly more useful to print which function fails, simply
with:
    perror("xc_evtchn_status");


> +                rc = errno;

Same here, just "rc=1" should be good enough. Then if someone want to
know why `lsevtchn` failed, they can read the error messages.

At least, errno is likely to be between 0 and 255, but still, usually
not very useful as an exit value for a program.

> +                break;
> +            }
> +            goto out;
> +        }
>  
>          if ( status.status == EVTCHNSTAT_closed )
>              continue;
> @@ -58,7 +80,8 @@ int main(int argc, char **argv)
>          printf("\n");
>      }
>  
> + out:
>      xc_interface_close(xch);
>  
> -    return 0;
> +    return rc;
>  }

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

