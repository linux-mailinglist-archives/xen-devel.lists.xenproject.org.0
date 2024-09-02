Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7CC968455
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787769.1197226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl44e-0003A7-Nj; Mon, 02 Sep 2024 10:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787769.1197226; Mon, 02 Sep 2024 10:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl44e-00038W-Kz; Mon, 02 Sep 2024 10:14:16 +0000
Received: by outflank-mailman (input) for mailman id 787769;
 Mon, 02 Sep 2024 10:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vUE=QA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sl44d-00038Q-T9
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:14:15 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b1ec6b1-6914-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 12:14:14 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8692bbec79so454981666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:14:14 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891d698bsm549836066b.145.2024.09.02.03.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 03:14:13 -0700 (PDT)
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
X-Inumbo-ID: 1b1ec6b1-6914-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725272054; x=1725876854; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqRSffh3c/24I6G0p1corltxi66HUYON1BNnY4GZF30=;
        b=kDjTV+bZzvQgTqZjgd93HfYnvg1yEfqPb9aNcI8g3NY8wbnxh/FjF2kbDRVcWQN0cQ
         K4rBxxas25z/EULW3iN+vtVChakKlBAtiiklQFoQBNRlaj9llIq7sckRZdMKmwRpuA9O
         3yfuXO/iGnxvWBmhGqjW6dRKgYvdOrc77PEEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272054; x=1725876854;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqRSffh3c/24I6G0p1corltxi66HUYON1BNnY4GZF30=;
        b=vF8+DS2aSvMYWZGs8g3QhHcRcdOx3F3tv61QRq3LXmZtl71SCUr6FHBGKU4vwH6hd1
         tbO6CHvlJY85mxO4MCMg/VA2yMYU9iaPp5Vanh29qUBSLOKEGY9SMd2fDNqQhs8oAUH1
         yoK+b2LfvYAPyh6fkd28R5V7cU4mqOqm6NlVEoc1OmtE9Z1YgssLZTNE42xx00b3fp5C
         qWlkOGHOPSayZimaiSZvXi2Ng0ykJC4+dMOLXfbNpfYfNDkE+MNkOS5MICxF+MeqH1oE
         NbtoGnDxoQX8VRueir3Ddn7wJTkuhK1hl70RG0xwbXun+1lj11iYOXq5JrUzGTbDOR90
         o46w==
X-Forwarded-Encrypted: i=1; AJvYcCWOdR48fhX3RQ5ij0J3fE4wkYjgIT8XH5nJ2AtSS3qFeYpOr+fiia6AALlQnXdGSCOT9tH/HPxmf1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywrt1ZzdgTDoYt0y2+giV6W34brItq0TQuJSzSPrq+hwBXWovmr
	17ho57e2YJ7UC7G/H7l2lf/YR6429vhohKlbz5emgGLmWX/1gcy2CWFpunzDhYU5y33Du7nZvIU
	oyhc=
X-Google-Smtp-Source: AGHT+IE5lDobKXMg7REVz91SrYPtE77AXdf2h4RtTGnkzw7rj/VhgBVDZyG0XF2mryDrX7vq8y3I7g==
X-Received: by 2002:a17:907:1c28:b0:a86:a77e:83b1 with SMTP id a640c23a62f3a-a89a379b622mr648378066b.47.1725272054046;
        Mon, 02 Sep 2024 03:14:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Sep 2024 11:14:11 +0100
Message-Id: <D3VPWEPD5J31.W6GFDD7ESFYW@cloud.com>
Cc: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/3] libxl: Update the documentation of
 libxl_xen_console_read_line()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Javi Merino" <javi.merino@cloud.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <cover.1724430173.git.javi.merino@cloud.com>
 <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
In-Reply-To: <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>

On Fri Aug 23, 2024 at 6:05 PM BST, Javi Merino wrote:
> Despite its name, libxl_xen_console_read_line() does not read a line,
> it fills the buffer with as many characters as fit.  Update the
> documentation to reflect the real behaviour of the function.  Rename
> line_r to avoid confusion since it is a pointer to an array of
> characters.
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  tools/libs/light/libxl_console.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_co=
nsole.c
> index f42f6a51ee6f..652897e4ef6d 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -789,17 +789,19 @@ libxl_xen_console_reader *
>      return cr;
>  }
> =20
> -/* return values:                                          *line_r
> - *   1          success, whole line obtained from buffer    non-0
> - *   0          no more lines available right now           0
> - *   negative   error code ERROR_*                          0
> - * On success *line_r is updated to point to a nul-terminated
> +/* Copy part of the console ring into a buffer
> + *
> + * Return values:
> + *   1: Success, the buffer obtained from the console ring an

Seems like this line in the comment is incomplete?

> + *   0: No more lines available right now
> + *   -ERROR_* on error
> + *
> + * On success, *line_r is updated to point to a nul-terminated
>   * string which is valid until the next call on the same console
> - * reader.  The libxl caller may overwrite parts of the string
> - * if it wishes. */
> + * reader. */

Cheers,
Alejandro

