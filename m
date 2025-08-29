Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF050B3B48A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 09:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100756.1454080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtjv-0006qn-GN; Fri, 29 Aug 2025 07:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100756.1454080; Fri, 29 Aug 2025 07:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urtjv-0006o0-D5; Fri, 29 Aug 2025 07:41:39 +0000
Received: by outflank-mailman (input) for mailman id 1100756;
 Fri, 29 Aug 2025 07:41:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFyT=3J=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1urtjt-0006nu-Mf
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 07:41:37 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97a6c133-84ab-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 09:41:36 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3d0dd9c9381so186414f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 00:41:36 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3cf346811b3sm2239482f8f.63.2025.08.29.00.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 00:41:35 -0700 (PDT)
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
X-Inumbo-ID: 97a6c133-84ab-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756453296; x=1757058096; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tO6DrzD+quTdHqqvNMI0g01HFf8ZC0nX9Q1ohDDwCd4=;
        b=EksjdCffJV3cwlX9LxJmdIXARdMitLMGgUCQqSgmij3QcX0QT7du9HXcJ9TJNB/xiV
         tXLAx7mJUQTXyZ+09O2GPUKUiUHHeeVC6hr/7s5OKQi7RGskHZ4IadxPn1FllOVGIe4E
         dYbDQeFsGvhdny7st0F6tK26AoM/xAwf3fI8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756453296; x=1757058096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO6DrzD+quTdHqqvNMI0g01HFf8ZC0nX9Q1ohDDwCd4=;
        b=nBcDRmVCgPgQE118cD6/sU97DBsVrHpDrStSmQma0K16kmKVlbjqy1JxizXsq3/zvm
         W605PBx6uCF071Nh3AV16uJ7l9ZDPznwwPEGFkqxt7UkWjNQhR/a4ziOdeohXcKABMji
         HCP5vp9C37SnVq937B76p4E02fLgNWnX/fyZxTRHjO3qb31D9ru0nU2MMjU8TVRMXDZS
         VdULZHl22BsNlAXrvsfyrqJwPBkb7FYtEoVsIdbbgs6yqFb93hynAiw5mWi8w54lEnr2
         T8Y3oyYeNDQM8y8wJeiJj6t9YGvL6SJGizySvrdHpHb0we653efjBhX4Zl3exYTU1xAw
         AvDg==
X-Forwarded-Encrypted: i=1; AJvYcCUd5piYQ2r7Sdj5hO1uPeUO17ks6BSaomY2vBCupuO+2k4GWtP07t0NUfFqxCqkXzgNfQt5fQMck/4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSzXct5O3iAJJ1BBxnmjEerI7/zTF0gpPX27K1H9SDXvnyFK8l
	u1/lZTiJVGnSFDcX/KBHZq3jEVGkBFNWJW4ACSuwBSh2IVJqxwFBRUdP3N1ZQ4Hr4xs=
X-Gm-Gg: ASbGncvEcNB7BFAPbovtj109SJ/hcxcRhxlQU+pzREgiqOfbDBRx+HizRNI7fOPl8WH
	j8U0W/Cndc8XGzQzIUSaofCCo+Zd8MFw+XvRO1i9oOuGXJomMQXt/FKZeDFboZnuXXv7AT4gnTR
	PRwir4TwJRw++wutHzrMvpmtYNNu+B+eie/9vXjVYzAVvCaAWKLNF+5M0JfZ6xIon+cjUdmgNbK
	fIAIc/bZocmsII8QWGwJpzHqHcB5dZgBBji9YY0mHq7/ncbJnfdp5GVe5HaHT5ciSz4axUUDlJ4
	mHJIMUIdyADPSACW11nSeVAfFPWlZFGEgILKj8DEUeOkNFY9DYUW5AzKt3tn6PAVDQupXlGpZBW
	7mmAwzUzwpJqyGXtlYS6nt0+o7RNEh6yFhVXT89A4O+hrHckv8O0fuQ/2PprAwwUECfd/9KdJEd
	gxnY85MsUJivQ=
X-Google-Smtp-Source: AGHT+IGHi84RNslvo4EpNQJM+DDbiydjnPJ4n/OIbw5ZoEm9L0dwqzKUERtcuoXt4DQrs6Vu6ZY0lg==
X-Received: by 2002:a5d:5887:0:b0:3b7:88f5:eaae with SMTP id ffacd0b85a97d-3c5dc542ac7mr19864259f8f.39.1756453295989;
        Fri, 29 Aug 2025 00:41:35 -0700 (PDT)
Date: Fri, 29 Aug 2025 09:41:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mark Syms <mark.syms@cloud.com>
Cc: jgross@suse.com, andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Clarify the cases where BLKIF_RSP_EOPNOTSUPP can be
 returned.
Message-ID: <aLFZrnHpul61b-5E@Mac.lan>
References: <20250828093821.372024-1-mark.syms@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828093821.372024-1-mark.syms@cloud.com>

On Thu, Aug 28, 2025 at 10:38:21AM +0100, Mark Syms wrote:
> Previously this said it would only happen on barrier writes. Except
> the documentation blocks for
>  * feature-flush-cache
>  * feature-discard
> 
> Also say that they can return this error.
> 
> Signed-off-by: Mark Syms <mark.syms@cloud.com>
> ---
>  xen/include/public/io/blkif.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
> index 8407453324..5e617b0c67 100644
> --- a/xen/include/public/io/blkif.h
> +++ b/xen/include/public/io/blkif.h
> @@ -710,7 +710,7 @@ typedef struct blkif_response blkif_response_t;
>  /*
>   * STATUS RETURN CODES.
>   */
> - /* Operation not supported (only happens on barrier writes). */
> + /* Operation not supported, see feature-barrier, feature-flush-cache, feature-discard. */
>  #define BLKIF_RSP_EOPNOTSUPP  -2

I think there's no need to mention the specific operations. FWIW,
blkback will return BLKIF_RSP_EOPNOTSUPP for any request type it
doesn't understand (see dispatch_other_io()), which covers any
possible request type that's not yet defined:

/* Operation not supported. */
#define BLKIF_RSP_EOPNOTSUPP  -2

Should be fine.

Thanks, Roger.

