Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924293B556
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 18:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764436.1174881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWfHR-00080G-TV; Wed, 24 Jul 2024 16:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764436.1174881; Wed, 24 Jul 2024 16:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWfHR-0007x7-PZ; Wed, 24 Jul 2024 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 764436;
 Wed, 24 Jul 2024 16:55:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BqPM=OY=bounce.vates.tech=bounce-md_30504962.66a13219.v1-b7fbadff23584586971799825d4c5773@srs-se1.protection.inumbo.net>)
 id 1sWfHR-0007x1-1K
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 16:55:57 +0000
Received: from mail135-10.atl141.mandrillapp.com
 (mail135-10.atl141.mandrillapp.com [198.2.135.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 973ddb23-49dd-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 18:55:55 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-10.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WTgBd4ZVxz5QkSg0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 16:55:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b7fbadff23584586971799825d4c5773; Wed, 24 Jul 2024 16:55:53 +0000
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
X-Inumbo-ID: 973ddb23-49dd-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721840153; x=1722100653;
	bh=qCZ6mYVmJIRN3TaxhdQ3Db+DFjiS3ogKT9Gjtzui1Vk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=H6aPVHncsrkoIImxZYOpzM+iA2BzkvCml0Mr4wJa0FhTsha9hJzz9pJzRiQFRPlC3
	 1gsfYRhRFkBiokXP20kOVPls90fIO4j3pvMz+1g5SmVRTHIixeHHcggGl89yGY6+Hg
	 shmAjkw7PuGZORjydj5cIrS/XyqO+ha0GDFSO4SrDtNBF4EtIrTG68jW7EdAFgzL4Z
	 cP3wbMBTuJbEiExiiD85nQYMHD5yrLp/oVikpsmRaLzsEukXtYljOiZRfOAfYNNw7q
	 kF6FiEB4xLoVcuHF4hYsE0xBSiRo6J2O0hOYxEeEd2F3cNvLcMI3/uNnYcqYzkR6Gx
	 usR2/GTlNSn6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721840153; x=1722100653; i=anthony.perard@vates.tech;
	bh=qCZ6mYVmJIRN3TaxhdQ3Db+DFjiS3ogKT9Gjtzui1Vk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VdvWr7rJ+svqNL6JvH9rjKtd22iizsWLqPMd1Qln5HS713wDcGKDuSMvMS3utDL3Z
	 Va/DjjKWxGUB2xj7rKmeR30tndnsdvoBg6hH6Hg7BvUq0bCoaknkWmhtJo91X21YIp
	 9AgS9N5T1o0l5xvGhzrXE8KlItv91Rd5QP2+lgqI+SS9uw/fENim3i/45PBjvQpFHp
	 zyp72je8FH9/z31SjKOY9m456YndDIiB6CbTLt5ci52zEOGXc3yNcpuLcWIzxcUBFZ
	 +AXDOWa3yA3iHV106fo6HVSRy3H5jnSmZsYsgt4OeirIx1jyTNtdiX9SD+FAKkIYEO
	 JqV2SAM4pwaAw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=202/4]=20x86/ucode:=20refactor=20xen-ucode=20to=20utilize=20getopt?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721840152823
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <ZqEyGD4wgL/z9nn5@l14>
References: <20240712130749.1272741-1-fouad.hilly@cloud.com> <20240712130749.1272741-3-fouad.hilly@cloud.com>
In-Reply-To: <20240712130749.1272741-3-fouad.hilly@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b7fbadff23584586971799825d4c5773?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240724:md
Date: Wed, 24 Jul 2024 16:55:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 02:07:47PM +0100, Fouad Hilly wrote:
> diff --git a/tools/misc/xen-ucode.c b/tools/misc/xen-ucode.c
> index 390969db3d1c..8de82e5b8a10 100644
> --- a/tools/misc/xen-ucode.c
> +++ b/tools/misc/xen-ucode.c
> @@ -71,12 +72,29 @@ static void show_curr_cpu(FILE *f)
>      }
>  }
>  
> +static void usage(FILE *stream, const char *name)
> +{
> +    fprintf(stream,
> +            "%s: Xen microcode updating tool\n"
> +            "options:\n"
> +            "  -h, --help            display this help\n"
> +            "  -s, --show-cpu-info   show CPU information\n"
> +            "Usage: %s [microcode file] [options]\n", name, name);

FYI, I disagree with Andy about the order of this message. First is
"Usage:" which explain where the option (dash-prefixed) can go, and
which are the mandatory arguments, sometime having all the single-letter
option in this line as well. Then there's an explanation of what the
options are. I've check `bash`, `cat`, `xl`, `gcc`.

I wonder which CLI program would print the minimum amount of information
on how to run the program as the last line of the help message.

> @@ -86,22 +104,34 @@ int main(int argc, char *argv[])
>          exit(1);
>      }
>  
> -    if ( argc < 2 )
> +    while ( (opt = getopt_long(argc, argv, "hs", options, NULL)) != -1 )
>      {
> -        fprintf(stderr,
> -                "xen-ucode: Xen microcode updating tool\n"
> -                "Usage: %s [<microcode file> | show-cpu-info]\n", argv[0]);
> -        show_curr_cpu(stderr);
> -        exit(2);
> +        switch (opt)
> +        {
> +        case 'h':
> +            usage(stdout, argv[0]);
> +            exit(EXIT_SUCCESS);
> +
> +        case 's':
> +            show_curr_cpu(stdout);
> +            exit(EXIT_SUCCESS);
> +
> +        default:
> +            goto ext_err;
> +        }
>      }
>  
> -    if ( !strcmp(argv[1], "show-cpu-info") )
> +    if ( optind == argc )
> +        goto ext_err;
> +
> +    /* For backwards compatibility to the pre-getopt() cmdline handling */
> +    if ( !strcmp(argv[optind], "show-cpu-info") )
>      {
>          show_curr_cpu(stdout);
>          return 0;
>      }
>  
> -    filename = argv[1];
> +    filename = argv[optind];
>      fd = open(filename, O_RDONLY);
>      if ( fd < 0 )
>      {
> @@ -146,4 +176,10 @@ int main(int argc, char *argv[])
>      close(fd);
>  
>      return 0;
> +
> + ext_err:
> +    fprintf(stderr,
> +            "%s: unable to process command line arguments\n", argv[0]);

A nice to have would be to have a better error message to point out
what's wrong with the arguments. For that you could print the error
message before "goto ext_err". One would be "unknown option" for the
first goto, and "missing microcode file" for the second goto, that is
instead of printing this more generic error message.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

