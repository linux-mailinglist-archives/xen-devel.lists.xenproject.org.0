Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B699378CAF
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 15:19:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125247.235738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5oH-0007ne-AY; Mon, 10 May 2021 13:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125247.235738; Mon, 10 May 2021 13:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg5oH-0007l1-70; Mon, 10 May 2021 13:18:57 +0000
Received: by outflank-mailman (input) for mailman id 125247;
 Mon, 10 May 2021 13:18:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MfTK=KF=gmail.com=dpsmith.dev@srs-us1.protection.inumbo.net>)
 id 1lg5oG-0007kv-7d
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 13:18:56 +0000
Received: from mail-qv1-xf29.google.com (unknown [2607:f8b0:4864:20::f29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ad5f4bb-dfb3-4335-a385-22e0044e08c5;
 Mon, 10 May 2021 13:18:55 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id g5so2604468qvk.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 06:18:55 -0700 (PDT)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2])
 by smtp.gmail.com with ESMTPSA id w16sm9391647qts.70.2021.05.10.06.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:18:54 -0700 (PDT)
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
X-Inumbo-ID: 9ad5f4bb-dfb3-4335-a385-22e0044e08c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M63A6KD4PRi1SPAftYhqReoGHmjMgNuLtMgU6jXVMg4=;
        b=rz2N2k/LBDI1yTmJp8BGGNMhFUfMs9gytmYkPRMxvNzRK914L8q7ABXwZKhnzBSRQQ
         hKRhvbqRc+lyqyxV/o4FieTJK/P42rbxQSd5cLdrjiAKW49NoEbh1RLfxXN6JLyDAq/o
         KpXJe11QQXKkcPTRpyrudT04Aez9kwRy2e+v/gJU17whAglvRa6fFb3A/vA0hM0O6CVz
         DF+M1tqhMncxT8T2bGi+limZewrCtrL0uIn2OsY9Not90i0OkNEOTyzAXVG4k6g46n8W
         QaeRpyVEFuwXnPCZeQC0+lrxMp3lZNshsHP5kdQnqHB2uvxaSrlL205m1Hg9k9C2Z+AF
         QuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M63A6KD4PRi1SPAftYhqReoGHmjMgNuLtMgU6jXVMg4=;
        b=mOqUxqmtcgKvh/T715gUA9bwUvR3rgkU0REJEd8C/kzNC6TzbDEhfMRR7Kg9/aQO3H
         aVxWYUYs5x8dWG/BZRUI3JxvcX8xzwPphKKoCKuAbboKsuLxQQ1TewYmzg+9GO1U7sdQ
         9goWm0ulffL8p6b9JRfwVdE5rvH1ed6HwAwDBBtSv+fW7cUpx4Pl0+31qVdHT01eBjax
         WW/vbJ3Cbq+4UM3dG0X1GraeMr1+BCplznL0TxXj/gty2K/MxiPNVjYjvH9+2Te2n6Ru
         EYjTM+yj2j1E2YTr83vJaHG2QMl6cEMum/fH3lxMNIQmuJDWYzvWFjjMDvU4I9HEEqPp
         bqBg==
X-Gm-Message-State: AOAM532dSK8FH0C+XCAoOnOQ/yG07+7yjzOHAkxL9X+BYqPA7zgkCQA0
	+KLQeA89uDhn47WPiyKZ8jw=
X-Google-Smtp-Source: ABdhPJx6Yhd+ZwFmabh90PIz/oU2VHkdOLzalYp/VTM8sC2/K2Zu7riH9kVZt1GesloMB7fGpKBVZA==
X-Received: by 2002:a05:6214:76b:: with SMTP id f11mr23606369qvz.8.1620652735225;
        Mon, 10 May 2021 06:18:55 -0700 (PDT)
Subject: Re: [PATCH v2 11/13] vtpmmgr: Fix owner_auth & srk_auth parsing
To: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210506135923.161427-1-jandryuk@gmail.com>
 <20210506135923.161427-12-jandryuk@gmail.com>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
Message-ID: <894f022d-aa8c-2780-d8da-af919dafea28@gmail.com>
Date: Mon, 10 May 2021 09:18:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506135923.161427-12-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/6/21 9:59 AM, Jason Andryuk wrote:
> Argument parsing only matches to before ':' and then the string with
> leading ':' is passed to parse_auth_string which fails to parse.  Extend
> the length to include the seperator in the match.
> 
> While here, switch the seperator to "=".  The man page documented "="
> and the other tpm.* arguments already use "=".  Since it didn't work
> before, we don't need to worry about backwards compatibility.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

>  stubdom/vtpmmgr/init.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/stubdom/vtpmmgr/init.c b/stubdom/vtpmmgr/init.c
> index 4ae34a4fcb..62dc5994de 100644
> --- a/stubdom/vtpmmgr/init.c
> +++ b/stubdom/vtpmmgr/init.c
> @@ -289,16 +289,16 @@ int parse_cmdline_opts(int argc, char** argv, struct Opts* opts)
>     memcpy(vtpm_globals.srk_auth, WELLKNOWN_AUTH, sizeof(TPM_AUTHDATA));
>  
>     for(i = 1; i < argc; ++i) {
> -      if(!strncmp(argv[i], "owner_auth:", 10)) {
> -         if((rc = parse_auth_string(argv[i] + 10, vtpm_globals.owner_auth)) < 0) {
> +      if(!strncmp(argv[i], "owner_auth=", 11)) {
> +         if((rc = parse_auth_string(argv[i] + 11, vtpm_globals.owner_auth)) < 0) {
>              goto err_invalid;
>           }
>           if(rc == 1) {
>              opts->gen_owner_auth = 1;
>           }
>        }
> -      else if(!strncmp(argv[i], "srk_auth:", 8)) {
> -         if((rc = parse_auth_string(argv[i] + 8, vtpm_globals.srk_auth)) != 0) {
> +      else if(!strncmp(argv[i], "srk_auth=", 9)) {
> +         if((rc = parse_auth_string(argv[i] + 9, vtpm_globals.srk_auth)) != 0) {
>              goto err_invalid;
>           }
>        }
> 


