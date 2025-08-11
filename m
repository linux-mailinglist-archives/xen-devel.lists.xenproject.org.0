Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5881B2063C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077273.1438336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ4m-0003Nh-3u; Mon, 11 Aug 2025 10:48:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077273.1438336; Mon, 11 Aug 2025 10:48:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ4m-0003LY-0d; Mon, 11 Aug 2025 10:48:24 +0000
Received: by outflank-mailman (input) for mailman id 1077273;
 Mon, 11 Aug 2025 10:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulQ4k-0003LS-GO
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:48:22 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2992dc1-76a0-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 12:48:21 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-459d44d286eso21874815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:48:21 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e0cd2c90sm296746935e9.17.2025.08.11.03.48.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:48:20 -0700 (PDT)
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
X-Inumbo-ID: b2992dc1-76a0-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754909301; x=1755514101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxgmWu82o6zYA67WCzb73s7Sm3cXFFVg1QtDZm0HFkg=;
        b=wN4eDUKMNDIPG5+zgeW7SZhXVzYHkqUQ2sUyyUwsQjnHfagZG8TDfe1qI8numR+pR+
         gT9DM8Ek3OLPTHlSdNtM6Rq322qORIO/c7Fx4FPpVZTzQT/+2T9MZ4T2IikWpIxbce5v
         j9x6uW88+8j9jWTOnmS9Tg+LDzr5FnL711Jno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909301; x=1755514101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxgmWu82o6zYA67WCzb73s7Sm3cXFFVg1QtDZm0HFkg=;
        b=qfX9N+K724yCf3rPFJzCNSj3IiL2ce7erDamA3/gKvcBfcCvmP5mIe1mFG6GP9B3sH
         qxzgyJcfNCdmrh7Ge+3c/FM5GMgtyxSuE/vwFewQGYOkblac/baQoKCsTQ3R2kfrJYTG
         e6WCDYrCA1e9oq4JFWZ5nEKSnKMaqgPAbaVZrQizzWyId+e7ioeykzh+8JtokDfWJgbI
         nWQNq1Y3g1eKr02lFmE5Rx/POt1v38DZ8I2iFjWVD8GHsdZF/aZuOPHDl//gy0zFbUeI
         2wF6J8uaURQfEwuuShTeUav74N57qhE7/kZV5RFkGURrBVt6ldyLe3/TIFC8PuFJxItW
         ReLg==
X-Forwarded-Encrypted: i=1; AJvYcCW57oVKZWygaXQDQQQPf0m5F4TE6pVwCNxI5FxpEgE3y0CYKqY0XaDZrf5v80/Dq2yibmh/wO797wA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyv2T4/12n8j2qTAQvB2aP1MSOYO7sHO9wwe2JUJTjTThgkQRRM
	OkCdISOTzRmL9O45oJcKeFft9LHinHWcxlxhAikIrtdLF7Wxeox+RqjxPb7kQnRvV9I=
X-Gm-Gg: ASbGncs6NuMg9rBYnMDydbjx/PPbl9t0tYPQ+SfG2fWqtzvlQ8E/ZpFrYgOtkU7QwrY
	FdPmLdLuOYTllGCvu15mzvtCasuVsr8nyoIyGJVFWZOT2PjlEAn63wxxmxIADaf9gygsN1gmNJ9
	XEn4cjUymTpNPidPwknj+Hu5X1rxMI5iaKZoQWnysZwcOgkboCZ+1e4sVNz3dBhxpqNyt0ZUpef
	lx8ClmB6c/nV9GDZX5ydNzceyUUeurYrYkYMqSkoMRqzVhvLZu9HLRCS5QyJ15uKhsC/9DPAcTO
	r/XaIsAbVa4SPjaGRSv2NW+s318tFeE2KRnfWqkbanBmidxm/HSu8aWWiUJ6gFBuP6z9D4L9Gv2
	RVQA4Fxp5Yg9twmGP25k4REV6nIXtNffoqiRAjRXrbWpk+fTSx69/B9xysr13/F8QftKY
X-Google-Smtp-Source: AGHT+IHjDWDNWu0o9fzflwXjk9ee1sPyd7RZ/TglaIZZsIsZsvrynkaGbdTkrJCYvRC5gDoAS4dp4g==
X-Received: by 2002:a05:600c:474f:b0:456:1157:59ac with SMTP id 5b1f17b1804b1-459f51c510cmr107991035e9.7.1754909300637;
        Mon, 11 Aug 2025 03:48:20 -0700 (PDT)
Message-ID: <5de6ae46-8398-46ab-b79a-df45358c5c30@citrix.com>
Date: Mon, 11 Aug 2025 11:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 04/11] tools/configure: Introduce deps on json-c lib
 for libxl
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <20250808145602.41716-1-anthony@xenproject.org>
 <20250808145602.41716-5-anthony@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250808145602.41716-5-anthony@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/08/2025 3:55 pm, Anthony PERARD wrote:
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index b690d92159..fa2a338c2b 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -166,7 +166,8 @@ LDLIBS-$(CONFIG_Linux) += -luuid
>  LDLIBS-$(CONFIG_Linux) += -lrt
>  LDLIBS-$(CONFIG_ARM) += -lfdt
>  LDLIBS-y += $(PTHREAD_LIBS)
> -LDLIBS-y += -lyajl
> +LDLIBS-y += $(YAJL_LIBS)
> +LDLIBS-y += $(LIBJSONC_LIBS)
>  LDLIBS += $(LDLIBS-y)
>  
>  $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): CFLAGS += $(CFLAGS_LIBXL) -include $(XEN_ROOT)/tools/config.h
> @@ -246,7 +247,7 @@ libxenlight_test.so: $(PIC_OBJS) $(LIBXL_TEST_OBJS)
>  	$(CC) $(LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxenlight.so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
>  
>  test_%: test_%.o test_common.o libxenlight_test.so
> -	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) -lyajl $(APPEND_LDFLAGS)
> +	$(CC) $(LDFLAGS) -o $@ $^ $(filter-out %libxenlight.so, $(LDLIBS_libxenlight)) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(YAJL_LIBS) $(LIBJSONC_LIBS) $(APPEND_LDFLAGS)
>  
>  libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
>  	$(CC) $(LDFLAGS) -o $@ $(SAVE_HELPER_OBJS) $(LDLIBS_libxentoollog) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
> diff --git a/tools/xl/Makefile b/tools/xl/Makefile
> index ad577cdd70..ff7a5aee94 100644
> --- a/tools/xl/Makefile
> +++ b/tools/xl/Makefile
> @@ -33,7 +33,7 @@ $(XL_OBJS): CFLAGS += -include $(XEN_ROOT)/tools/config.h # libxl_json.h needs i
>  all: xl
>  
>  xl: $(XL_OBJS)
> -	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) -lyajl $(APPEND_LDFLAGS)
> +	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxenstore) $(YAJL_LIBS) $(LIBJSONC_LIBS) $(APPEND_LDFLAGS)
>  
>  .PHONY: install
>  install: all

Specifying both isn't entirely great when one is supposed to be empty.

Could we not have XEN_JSON_LIB(s) which is set to either $YAJL_LIBS or
$LIBJSONC_LIBS as appropriate?

~Andrew

