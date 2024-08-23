Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5EC95D44E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 19:32:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782552.1192058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shY8l-0004pu-Qi; Fri, 23 Aug 2024 17:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782552.1192058; Fri, 23 Aug 2024 17:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shY8l-0004ne-O7; Fri, 23 Aug 2024 17:31:59 +0000
Received: by outflank-mailman (input) for mailman id 782552;
 Fri, 23 Aug 2024 17:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imIp=PW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shY8k-0004nY-Oi
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 17:31:58 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9747f5b5-6175-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 19:31:56 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7a3375015f8so144536985a.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Aug 2024 10:31:56 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f343d3asm198715585a.48.2024.08.23.10.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 10:31:53 -0700 (PDT)
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
X-Inumbo-ID: 9747f5b5-6175-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724434314; x=1725039114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hYBtPI4D05F8UqvLuqAU6Ulb5s2kANd+Ngqkyj1whOU=;
        b=idtHnkwttrZcK+SPh5yUo39lqq9wiyNq7meQlRcRoKtRo0+i35ATAFpNla5mex8tfh
         HOVFct8iKYTAFHYilZPkoGdvCdq0RiCW8jg1YIW6GOZFf2NVfMlMvMETrDchmIdlO5Gd
         RvGGDRd6gEp762+nEWfiwK4U6dMqww6BIDpKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724434314; x=1725039114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYBtPI4D05F8UqvLuqAU6Ulb5s2kANd+Ngqkyj1whOU=;
        b=fAxCCbPBEEs6mppy9gPR8GHbaSVP37soVwZp5AaZFDPvWsyX9aPiO2PtNm6vUlplE9
         V9qzPwlFmZhl+TrZqiu2oTbqAkfdjkWn/628iNlzG71OjxyPoNFb4oZBH0XMAhtqzHaj
         ZzmAbt9JZ4ZsPuewmdvxp3DKz24PaxKxxSV38NaGjxeTnduEc7b4oLndQluvBz+8qfGq
         bBQuW48PGjL9ds4W7YusGkDCi9cU7qlzbs8PSSrMPGkWFYFsSbeAwWPi0rhvyHAFo6EN
         2N4DgYZSYYPs7hdh9cIui00m+HtQ9G3lXBvPiVzdZVgVsJvpsHpZMSpLp35GJSjzm7IF
         +P6A==
X-Forwarded-Encrypted: i=1; AJvYcCWNiOisr3Ye2v2mgwzlJjQKpdeDe6QiG+eFlham05cOQdXe7F80Ri8IlEsFZv3DUoUfdMtJvD4cYyM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3YBxiFevBK1ShbXBafo6W6vdIb9Uydjy4bYpFmlW7oetQOtoz
	u49Pl0Hd3EIjLue1RQeVipsmjrrvfPg1SKReFeGJJrjMbLZRxfKrt4IB3wKY2iaWc2GGGgXVkwX
	8
X-Google-Smtp-Source: AGHT+IE03cfP9sOksr7XS37MiOX8TCr2xoBoG/YfuvTk5Wl2fthSTQ+sESZQ2DTGugTPGD9oHRQZ6g==
X-Received: by 2002:a05:620a:40d0:b0:79f:1098:a949 with SMTP id af79cd13be357-7a6896e0e59mr270071785a.4.1724434314113;
        Fri, 23 Aug 2024 10:31:54 -0700 (PDT)
Message-ID: <d27fa081-50fa-423f-a292-ee8083b47c51@citrix.com>
Date: Fri, 23 Aug 2024 18:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] libxl: Update the documentation of
 libxl_xen_console_read_line()
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <cover.1724430173.git.javi.merino@cloud.com>
 <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/08/2024 6:05 pm, Javi Merino wrote:
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index f42f6a51ee6f..652897e4ef6d 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -789,17 +789,19 @@ libxl_xen_console_reader *
>      return cr;
>  }
>  
> -/* return values:                                          *line_r
> - *   1          success, whole line obtained from buffer    non-0
> - *   0          no more lines available right now           0
> - *   negative   error code ERROR_*                          0
> - * On success *line_r is updated to point to a nul-terminated
> +/* Copy part of the console ring into a buffer
> + *
> + * Return values:
> + *   1: Success, the buffer obtained from the console ring an
> + *   0: No more lines available right now
> + *   -ERROR_* on error
> + *
> + * On success, *line_r is updated to point to a nul-terminated

*buff.

Also this really wants to say somewhere "despite the function name,
there can be multiple lines in the returned buffer" or something to this
effect.

>   * string which is valid until the next call on the same console
> - * reader.  The libxl caller may overwrite parts of the string
> - * if it wishes. */
> + * reader. */

While I don't want to derail this patch further, what happens if there
happens to be an embedded \0 in Xen's console?  The hypercall is works
by a count of chars, and AFACIT, in this function we're assuming that
there's no \0 earlier in the string.

~Andrew

