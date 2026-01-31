Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hcNUFjqrfWlwTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 08:11:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE9C10D3
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 08:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218010.1527099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vm58n-0004tS-JB; Sat, 31 Jan 2026 07:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218010.1527099; Sat, 31 Jan 2026 07:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vm58n-0004r0-Fy; Sat, 31 Jan 2026 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1218010;
 Sat, 31 Jan 2026 07:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wf6q=AE=gmail.com=zhangwt1997@srs-se1.protection.inumbo.net>)
 id 1vm58m-0004qu-J5
 for xen-devel@lists.xenproject.org; Sat, 31 Jan 2026 07:11:32 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c4ce113-fe74-11f0-b161-2bf370ae4941;
 Sat, 31 Jan 2026 08:11:23 +0100 (CET)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-8c533228383so177401085a.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jan 2026 23:11:23 -0800 (PST)
Received: from wirelessprv-10-195-209-164.near.illinois.edu
 (mobile-130-126-255-98.near.illinois.edu. [130.126.255.98])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d376da66sm74364426d6.50.2026.01.30.23.11.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Jan 2026 23:11:20 -0800 (PST)
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
X-Inumbo-ID: 0c4ce113-fe74-11f0-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769843482; x=1770448282; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZJSAdndnBx9rrkCE0DjP5dE8MJAA2DW4Ofjhp7aSoM=;
        b=deTncHYRD+BqKcRD7BB3vxzt2TQmQWGEpxHC+EmXjKO0+mPTpgWM4Ug5rL8hXzfq13
         Px4Gz6gZgBZ6icaJaJZBiWrsP+80s00DdOgBO6A+WB0Chtzui0tKc4+KIMlPJb2Scfmd
         Rvp1Q1EPWknMZyQdpsgva1UNW6ieB0AHfpEUwB5Wp47+8BdAuu32h3WxxH5aoPFxLfYD
         b3A/vc75EcasHTuy6y6dOkDKKMK1qCJn36OYxUCeCIWddv5iyl6zNOQwnexaJQnfn292
         3zLWybGDq/a+NzFc62lk8J7J7cZ3aD9PNMLbJURrstexEEcCKJOr+fBD61x9VXdCqeqC
         S69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769843482; x=1770448282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZJSAdndnBx9rrkCE0DjP5dE8MJAA2DW4Ofjhp7aSoM=;
        b=Td/WM2kpoBNLUilRZhL9YOxqSpTr1/+B9G6rkMH/yTkM97+MLh9VSNoPp2YyQjh/GJ
         qy4roxsCXZDmtClIBnnIrL2PhgRdB35tnKpYLHs5Y2k+uLVSBRBGvhLH5LQ+yGrYIUTe
         UXwp+LICKTF9k7BeabA5qj8cxgliIgNwoBXzmD+ret4IkiPZuNkxX2slf7i4Eb9k8W7E
         l40M1ev0MiKG/F+98bMDDRDGaVCqkBKcvbWW3o0vteUjdaVOZjt2eIqx2y1346YLW76f
         463Oa2MtomlxA3dmobxPqNSUnnMjlsR0jHRrHQ4Yp97rebtcCkdW8Ou6ogWdnWp/3GcP
         N6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtf8YGiW9mM98rbr0YmzppJfN1N5ssp8bLSfOTCULOKZZPv+sphsk2YJ64e3TvOEj4+QQzN/QYBk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8Iw4cx3MInsyNgKyezsCqEtpZsDDLDotG/6NAW38hbUGTZGky
	17kCB5ssTJ2NDlNW8/yyD23jffEAloX/b2QXY6sIF3/UOA350yPsIPNP
X-Gm-Gg: AZuq6aIr+L9UHSylLEtZusoir/3gGYjnQvdz/uR0t/0FO+lQ+4YjPGmrpwk/y9LGRna
	7kmOVBSj2XDPISKEHe4W/JuL20D8ybRfoYfX3rChnQ5eYSBwfAZ6bYdggPjysMLuWJUPrJFD7+m
	3tfoVZJZkaclZ3bG1zMDB9P5wIzZMBVPOjg71WBfusY+CUU4ZESiYf0aPMUJHrs5qo+WC+yoAXk
	0dsGA1K4FI74601keH5lDeU5+WocUr/jf/EeFlPclHnoVK+hvZQ4FcSVPuuSdMi1vbggLtk/zT+
	ps22LjWHochzJrll2UqcbbHZWCxVjOIlFh/MOQoEWbLi0hx5cxJNjxwx5UopRbTg1K8W0fOykwV
	j0oaNvCkp99Jaw5ReSD3Ixl+C0JhhJhWL073UkNCR3AaZBr76986IcMBIEZDYHvTbbBZNxf4Hza
	8wrg09ZRssDzHLNKcQkeeJbRF2BXhxRA79rBp3HByf4tVuQtYqceQjFquwUhvJysE8eS/FZXy37
	ui2R5NeCpNR4crOuyzQQQ8LZ2a8EkyDBl0s6dBzpQU9
X-Received: by 2002:a05:620a:1d0a:b0:8ca:55:ac60 with SMTP id af79cd13be357-8ca0055ae50mr44081285a.78.1769843481649;
        Fri, 30 Jan 2026 23:11:21 -0800 (PST)
From: Wentao Zhang <zhangwt1997@gmail.com>
To: zhangwt1997@gmail.com
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	samaan.dehghan@gmail.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Subject: Ping: [XEN PATCH] xen: add paddings after bitmap section in LLVM coverage profile
Date: Sat, 31 Jan 2026 01:11:16 -0600
Message-Id: <20260131071116.13650-1-zhangwt1997@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <71775ef5c267b3888ddf3e4a55bdb5914cf1f890.1766228666.git.zhangwt1997@gmail.com>
References: <71775ef5c267b3888ddf3e4a55bdb5914cf1f890.1766228666.git.zhangwt1997@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,suse.com,xen.org,amd.com,gmail.com,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhangwt1997@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:samaan.dehghan@gmail.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samaandehghan@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zhangwt1997@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangwt1997@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,llvm.org:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 75EE9C10D3
X-Rspamd-Action: no action

Thanks,
Wentao 

On Sat, 20 Dec 2025 05:22:43 -0600, Wentao Zhang <zhangwt1997@gmail.com> wrote:
> The layout of LLVM coverage profile is like
> 
>   header
>   data section
>   (padding #1)
>   counter section
>   (padding #2)
>   bitmap section
>   (padding #3)
>   name section
>   (padding #4)
> 
> Padding areas #1 and #2 are always zeroed on 64-bit platforms, but that
> is not the case for padding area #3 and #4. See LLVM docs [1] and
> compiler-rt's own version of "get_size()" [2].
> 
> The implementation in 08c787f "xen: Enable MC/DC coverage for Clang"
> partly considers padding #4 in get_size() but not in dump(). It worked
> because in the header .padding_bytes_after_bitmap_bytes is also
> initialized to zero so a reader may still know how to parse the profile.
> But we should probably not base ourselves on such assumption. Instead
> let's be as close as possible to hosted environment generated profiles,
> i.e. those generated by compiler-rt.
> 
> In this patch, get_size() implementation is mathematically the same but
> changed to reflect the layout somewhat better. For dump(), padding #4 is
> added both in the header and in the payload.
> 
> [1] https://llvm.org/docs/InstrProfileFormat.html
> [2] https://github.com/llvm/llvm-project/blob/llvmorg-20.1.8/compiler-rt/lib/profile/InstrProfilingBuffer.c#L223
> 
> Signed-off-by: Wentao Zhang <zhangwt1997@gmail.com>
> 
> ---
> 
> As an aside, an alternative way that has better long-term
> maintainability would be [3]. I ran it with Xen and could unofficially
> confirm it works, modulo implementation nitty-gritties.
> 
> [3] https://github.com/llvm/llvm-project/pull/167998
> ---
>  xen/common/coverage/llvm.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> index 5663fb1..f15ec11 100644
> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -141,11 +141,11 @@ static void cf_check reset_counters(void)
>  
>  static uint32_t cf_check get_size(void)
>  {
> -    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
> -                   END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
> -    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
> -        size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
> -    return size;
> +    return sizeof(struct llvm_profile_header) +
> +           END_DATA - START_DATA +
> +           END_COUNTERS - START_COUNTERS +
> +           ROUNDUP(END_BITMAP - START_BITMAP, 8) +
> +           ROUNDUP(END_NAMES - START_NAMES, 8);
>  }
>  
>  static int cf_check dump(
> @@ -167,6 +167,7 @@ static int cf_check dump(
>  #if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
>          .num_bitmap_bytes = END_BITMAP - START_BITMAP,
>          .bitmap_delta = START_BITMAP - START_DATA,
> +        .padding_bytes_after_bitmap_bytes = (-(END_BITMAP - START_BITMAP)) & 7,
>  #endif
>      };
>      unsigned int off = 0;
> @@ -183,6 +184,7 @@ static int cf_check dump(
>      APPEND_TO_BUFFER(START_COUNTERS, END_COUNTERS - START_COUNTERS);
>  #if defined(CONFIG_CONDITION_COVERAGE)
>      APPEND_TO_BUFFER(START_BITMAP, END_BITMAP - START_BITMAP);
> +    off += header.padding_bytes_after_bitmap_bytes;
>  #endif
>      APPEND_TO_BUFFER(START_NAMES, END_NAMES - START_NAMES);
>  #undef APPEND_TO_BUFFER
> -- 
> 2.34.1

