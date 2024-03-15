Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E311687C816
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 04:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693617.1081957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkyaH-0001bq-BS; Fri, 15 Mar 2024 03:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693617.1081957; Fri, 15 Mar 2024 03:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkyaH-0001ZU-8V; Fri, 15 Mar 2024 03:50:17 +0000
Received: by outflank-mailman (input) for mailman id 693617;
 Fri, 15 Mar 2024 03:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XS0M=KV=suse.com=mchang@srs-se1.protection.inumbo.net>)
 id 1rkyaG-0001ZO-22
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 03:50:16 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 211d6595-e27f-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 04:50:14 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d23114b19dso18825271fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 20:50:14 -0700 (PDT)
Received: from localhost (118-168-133-24.dynamic-ip.hinet.net.
 [118.168.133.24]) by smtp.gmail.com with ESMTPSA id
 i13-20020a17090adc0d00b0029d7e7b7b41sm1790580pjv.33.2024.03.14.20.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Mar 2024 20:50:12 -0700 (PDT)
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
X-Inumbo-ID: 211d6595-e27f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710474613; x=1711079413; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LH65GpFfZfh9n5rXs2As6F9rQE3oOpUCSwLIKwpAmQc=;
        b=gFTPuFLOjLU2bSLNBNC9fKIC9aFdPKsYuNpo7bOPRr6E9NsTOTSl2koNVzoVvwgne4
         wmNnmKO67go7DdTD7cduBkqdvfsAmnDkF48HZ98Ftov8Iovrr2MzLddWXEwJF75rAocj
         h8fMfC/Qu+CpOvPA0QFA6gaxtkTkNfbvWAJSDyXUGguihmaHbb0ZJBsSKYO24FZIAhdO
         D39Oxa9+gtK2L4MtSq7e93ZX6PP0A1dPWAvihAD7PcIlwOJZRzL6nFZc42m6xwmVAlYP
         B3xdEO1S/9oBvqGOpclG9qGeBfT+Be/GU+rGq4sH6+pNxJuh2GStJ9Nf7xModlIFXCjb
         ug0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710474613; x=1711079413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LH65GpFfZfh9n5rXs2As6F9rQE3oOpUCSwLIKwpAmQc=;
        b=mBSrRFwpEcCiytYpRhJRKqahAqH32z3QQ8s0yRajitXY4WK8UauZsquf+jCOdb89/3
         7EPg7oMkEF5gZ+2Sh3IoQse+uITE5B57w96qLILb9a2nxyWfvv9hCmyDM5JrR6w0L+1+
         3ENwAju+Dngby2Q61uawwu/bSC7kpHUY9yqGTEShxo59svOV4XQ1kR0IH+hZMl0EtLDT
         eigFRyozyp3JbHShRf3Vm8TleZQVLkjh28+OwmJH2bbYO7G8uwibMWdykkpYAbjGliVS
         3DM+uAScgHxDPws7b/QnBVG9a5IlT1MK5mvFST8Va0uadUQMAw9iF1xGJn8OZb0w+yfr
         KhJA==
X-Forwarded-Encrypted: i=1; AJvYcCWtOfH9kd1eStHKheXRcf1bVYY2M9qwbhXkPpvGSEZGQesdYcpaVHusPuKjU55YrPv9jX22x//jIxvsFiRMey6uSs9SrthDqeDzxzd0l5s=
X-Gm-Message-State: AOJu0Ywyjfkp3OeODdACQEtdVsaO40GRheh6B2pT0LPHSyiBDgZUYDUA
	eIICM6tqIFJT/KlvxHv3K25deJs7x6tFszFErDf++03Fc2EpRRvgt9DFHCsgSgs=
X-Google-Smtp-Source: AGHT+IEq3tVOLhlUQiCv41fV74AdfW2juh5e4eOSkOah1RAieQfpEouDeuWmQPqYy21HZlqdLoMotg==
X-Received: by 2002:a05:651c:10c9:b0:2d2:2ce1:1196 with SMTP id l9-20020a05651c10c900b002d22ce11196mr2308729ljn.53.1710474613439;
        Thu, 14 Mar 2024 20:50:13 -0700 (PDT)
Date: Fri, 15 Mar 2024 11:50:02 +0800
From: Michael Chang <mchang@suse.com>
To: The development of GNU GRUB <grub-devel@gnu.org>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 7/7] verifiers: Verify after decompression
Message-ID: <ujgt7gs7t37xqfffqet6yjnqz32xahkh75ed6h2zwqw5ukihsk@hkdpks6ipkcr>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-8-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313150748.791236-8-ross.lagerwall@citrix.com>

On Wed, Mar 13, 2024 at 03:07:48PM +0000, Ross Lagerwall via Grub-devel wrote:
> It is convenient and common to have binaries stored in gzip archives
> (e.g. xen.gz). Verification should be run after decompression rather
> than before so reorder the file filter list as appropriate.

The proposed change would result in the disruption of the tpm and pgp
clients within the verifier framework. Specifically, the tpm pcr
prediction software relies on the integrity of raw files rather than
decompressed ones. Additionally, pgp detached signatures are designed to
target original files, thus necessitating the current structure to
maintain functionality.

Thanks,
Michael

> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  include/grub/file.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/grub/file.h b/include/grub/file.h
> index a5bf3a792d6f..a1ef3582bc7b 100644
> --- a/include/grub/file.h
> +++ b/include/grub/file.h
> @@ -182,10 +182,10 @@ extern grub_disk_read_hook_t EXPORT_VAR(grub_file_progress_hook);
>  /* Filters with lower ID are executed first.  */
>  typedef enum grub_file_filter_id
>    {
> -    GRUB_FILE_FILTER_VERIFY,
>      GRUB_FILE_FILTER_GZIO,
>      GRUB_FILE_FILTER_XZIO,
>      GRUB_FILE_FILTER_LZOPIO,
> +    GRUB_FILE_FILTER_VERIFY,
>      GRUB_FILE_FILTER_MAX,
>      GRUB_FILE_FILTER_COMPRESSION_FIRST = GRUB_FILE_FILTER_GZIO,
>      GRUB_FILE_FILTER_COMPRESSION_LAST = GRUB_FILE_FILTER_LZOPIO,
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> Grub-devel mailing list
> Grub-devel@gnu.org
> https://lists.gnu.org/mailman/listinfo/grub-devel

