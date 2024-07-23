Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2386939E03
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 11:37:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762912.1173143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBxF-0007lf-1b; Tue, 23 Jul 2024 09:37:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762912.1173143; Tue, 23 Jul 2024 09:37:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBxE-0007jF-UU; Tue, 23 Jul 2024 09:37:08 +0000
Received: by outflank-mailman (input) for mailman id 762912;
 Tue, 23 Jul 2024 09:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BZ+O=OX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWBxD-0007j9-Nq
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 09:37:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f7ab8d5-48d7-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 11:37:05 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-36865a516f1so3854066f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 02:37:05 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878684225sm11050026f8f.9.2024.07.23.02.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 02:37:04 -0700 (PDT)
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
X-Inumbo-ID: 1f7ab8d5-48d7-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721727425; x=1722332225; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEUBnwtg76xzsUSRmmt1T0t9FKyyOKiaApV9Xp/3br8=;
        b=KOMvmKCPG5H8SmRIYl2gMyxy6QyeamXvrqGGBFZhX1hjou74nbs80tgaXNgUlJo5UN
         G7ldpBIk62vKVLRR0kpJdLiDjbRfpuWL9w5Eg8vq1h59Ap+L3ocAhRY6Wni7pnt9LHtQ
         DJ8yaw64MtaAaAPBPXW4UNsVRfhDSIcd1ZJYJcwHsBN5y4pCZ5Xl2MF97JsihqO2elsN
         /JP0y/R1kB3t2L3HbrO4wv/ahBV94kWYCwtatk986L6bYZkI9zP48c1kK86DiakfuH7Q
         XcemPaHh5dyxK0h15o+3Ft2YerkDx3fCquREYDC9Nq5Za+HWw6MDa7JgHI42AhVqwE1c
         YfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721727425; x=1722332225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEUBnwtg76xzsUSRmmt1T0t9FKyyOKiaApV9Xp/3br8=;
        b=u9zzszC5Evfl6H801bQiMYnPIRgeFo7sQ+KKt4NyPXgyp9yMuxlwvCEA0LDLsSmadT
         xqONhPtj8tp+6k+CWM8KEdFmx76AuBTLMqoYqOQEtbUYF7qPAkRyDKndBKAtrIlfqQK8
         SOm1XSqLhccMw3rKK+1JP2CgCDd11/we0dF1KlryiOB6dlEm5y+vZtHba1jgfVxBhu3W
         MXQ+eCNa1M3a/57xZDVgxYhuto7RlGaMvv7PuFRLyBidKPJ5rocTceRLe4R3PMlsiaFt
         w5f1i/bixguA4ke4qODqvMYYIujHc3PiPImB7caCDBbvsx9D4vS8WDoUiM/332Po3A0l
         3FLw==
X-Forwarded-Encrypted: i=1; AJvYcCVxWo0y08SAi4xOYP49pUKsos3cQSJBkHyA2C8nX/oA/xb2RX7kjKiI1gM4Cf4p82dQwdqEMlgw+QWX6njgyFc9B4SnW5Fq6fl76WPlc4g=
X-Gm-Message-State: AOJu0YwOiynPp1Nfry7Q1PNWYIbfQp57Qg9G6QNRuxKFC2pA40fNlYKO
	wzrcfxjgALSpQmOdAjUhpzhFoXZViB35SueAqGYRleDSdBHbmqFIWgZvcbsDGA8=
X-Google-Smtp-Source: AGHT+IFS9N5Mj2T7tqA8UL3WW4dhMxRrU2fscpC934Et8ZljMIqE4dkmePHCQhDeKq1HKribBG8LfQ==
X-Received: by 2002:adf:e745:0:b0:368:4b34:541 with SMTP id ffacd0b85a97d-369bae4ceebmr7532029f8f.16.1721727424983;
        Tue, 23 Jul 2024 02:37:04 -0700 (PDT)
Message-ID: <cabf929b-11bd-4401-88a2-7d4c8ae4b606@suse.com>
Date: Tue, 23 Jul 2024 11:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 5/6] tools/libxs: Use writev()/sendmsg() instead of
 write()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240718164842.3650702-6-andrew.cooper3@citrix.com>
 <20240722162547.4060813-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240722162547.4060813-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.07.24 18:25, Andrew Cooper wrote:
> With the input data now conveniently arranged, use writev()/sendmsg() instead
> of decomposing it into write() calls.
> 
> This causes all requests to be submitted with a single system call, rather
> than at least two.  While in principle short writes can occur, the chances of
> it happening are slim given that most xenbus comms are only a handful of
> bytes.
> 
> Nevertheless, provide {writev,sendmsg}_exact() wrappers which take care of
> resubmitting on EINTR or short write.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Juergen Gross <jgross@suse.com>
> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> v1.1:
>   * Fix iov overread, spotted by Frediano.  Factor the common updating logic
>     out into update_iov().
> ---
>   tools/libs/store/xs.c | 94 +++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 91 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
> index e820cccc2314..f80ac7558cbe 100644
> --- a/tools/libs/store/xs.c
> +++ b/tools/libs/store/xs.c
> @@ -563,6 +563,95 @@ static void *read_reply(
>   	return body;
>   }
>   
> +/*
> + * Update an iov/nr pair after an incomplete writev()/sendmsg().
> + *
> + * Awkwardly, nr has different widths and signs between writev() and
> + * sendmsg(), so we take it and return it by value, rather than by pointer.
> + */
> +static size_t update_iov(struct iovec **p_iov, size_t nr, size_t res)
> +{
> +	struct iovec *iov = *p_iov;
> +
> +        /* Skip fully complete elements, including empty elements. */
> +        while (nr && res >= iov->iov_len) {
> +                res -= iov->iov_len;
> +                nr--;
> +                iov++;
> +        }
> +
> +        /* Partial element, adjust base/len. */
> +        if (res) {
> +                iov->iov_len  -= res;
> +                iov->iov_base += res;
> +        }
> +
> +        *p_iov = iov;
> +
> +	return nr;
> +}
> +
> +/*
> + * Wrapper around sendmsg() to resubmit on EINTR or short write.  Returns
> + * @true if all data was transmitted, or @false with errno for an error.
> + * Note: May alter @iov in place on resubmit.
> + */
> +static bool sendmsg_exact(int fd, struct iovec *iov, unsigned int nr)
> +{
> +	struct msghdr hdr = {
> +		.msg_iov = iov,
> +		.msg_iovlen = nr,
> +	};
> +
> +	/* Sanity check first element isn't empty */
> +	assert(iov->iov_len == sizeof(struct xsd_sockmsg));

Can you please move this assert() into write_request(), avoiding to have
2 copies of it?

With that:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

