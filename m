Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC1AFCB11
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 14:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036427.1408650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7rj-0002Z5-Ii; Tue, 08 Jul 2025 12:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036427.1408650; Tue, 08 Jul 2025 12:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ7rj-0002XB-Fb; Tue, 08 Jul 2025 12:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1036427;
 Tue, 08 Jul 2025 12:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/n7=ZV=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1uZ7ri-0002X5-Dy
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 12:56:06 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a1c207-5bfa-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 14:56:05 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso4203207f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 05:56:05 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:6b57:1d00:4379:5549:e9f4:bf8a?
 ([2a02:c7c:6b57:1d00:4379:5549:e9f4:bf8a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285e241sm13105030f8f.94.2025.07.08.05.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 05:56:04 -0700 (PDT)
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
X-Inumbo-ID: e8a1c207-5bfa-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751979365; x=1752584165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teEt3kl0hIiq1Pszlt+E2c5DdxzULgNo5PgswD9/95k=;
        b=jrVJTiGbu6yVvud81lmucjD2CHQz+bhXbyczZrsCuFZZ1LFZGS4XN56yWOaez9dlgw
         rIxvZH/2teCKibd9w15vlOowXgbNqKBdtqMz8NIeIXo8iu2NG+zr3rG+QC2JNcXrGRQ+
         zmDyDrqbzyn4BxD/Jd9nWf2bn7gbUzopYLSgl7pJ2ewxly0pMI5cwT8gGOyieh1jbtYZ
         3RZuBOAyIQeBiIh9pYXASJEOO4vzg10dHNtEsSuOwq7MbpLnjSWX7bw6i72LxYVTg0zR
         aIBSYkhFUNq+L8TJ3h3VtOBGg7PBxxWFb/X66rdC+fGSKKF97aHuX7LOeX5kWeP/tMR2
         Rhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979365; x=1752584165;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teEt3kl0hIiq1Pszlt+E2c5DdxzULgNo5PgswD9/95k=;
        b=rQy3wbCH5KSyrIWNKQeoCe1p95HXF9NChhsvtKqcQjZF7e5Z0+vZKNLfoj9TvoNO7+
         4ymOsYeNslqtjP5K8zLVxlBX9VZmy3+Dys8Br8FyXTgaYDYNsR6MNUBaD85GV6NPVSuf
         /YyxIQWraPdVUhuJeesd9aE3fOUfr1/Tm3qNnJNeJJpuS3WLLXBkTQ8of5wC/G4ufDzA
         w6zfSYKxyx5MYL/Knw4CP1eIA18ftv3FOhU42BtIaOQ3safiJjlYkErIaJvkn6yrAkVg
         atX1+LK1BZ0yxHpKwE//fK/h2gjeMy1VWOCSMiOTs05dKovk7xh93my6woNjtwBVQCu/
         vBUw==
X-Forwarded-Encrypted: i=1; AJvYcCUetTLjhuCW5jb1e3CTDjnKTY7z5iV7gU6US1KupJKSk5fUsf7ZGS7pxjuiivSsS0SZIHk5HzLB3ck=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzD+Bwd/td6m4P93hL6rGFdM4bYhGy+QzFOih3l26FnTv3+f0gQ
	JSx1QGFWidPHrko7KddlsUgxCkOmodWLXIez4IIbStIHlM0s8+uHb6tk
X-Gm-Gg: ASbGncuW88rwbTUapXOTlhL/DSh4sS99/zmpa1WWe0/+ldIGF3pcMtolHF7qAxK1p9F
	+F0yJE7Rjfu3+2QYnGRA8gLwWv9QGhz+Hzq0xm24dH8ScFQoaCEUCGUE8wMC4AHPtzSWAIcAkkn
	CbAHn3F93QuPjd2abqY4zzJXr9cf7iDSwSeE94rMo/TcuyBiBtbWJLs2YPZYNXI6T65N/CO6cUh
	6WXDfZ4tssBs3X0vdMb++i3/Y1/YlBrO0kDGmnXj5lhVmEn24ksTfVkLnkkqPgvuyR5HtnZSyIX
	fBJqPRjmj0ZA4T5234JSWwHUn9dyHvjS1XQDcnuu3E9klJd4sjXPhaRzvcd6ncDFJfmb5J98Ayq
	VTtP5v5X6HU0AmIlBJl/sJJqiwI84pTUCFH0k1oFN
X-Google-Smtp-Source: AGHT+IF9DH50kKlWLZ9WXra9lQu9nZZpkK+NDYmrFU0uKYqn0i99lCPWh3FvKkCaMHljNmV2C9Q1jA==
X-Received: by 2002:a5d:5f45:0:b0:3a4:ebc2:d6ec with SMTP id ffacd0b85a97d-3b5dde6764fmr2729247f8f.14.1751979364420;
        Tue, 08 Jul 2025 05:56:04 -0700 (PDT)
Message-ID: <cf9503db-2726-4d0c-8b2c-da5fc7aa205b@gmail.com>
Date: Tue, 8 Jul 2025 13:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jahan.murudi.zg@renesas.com
Cc: anthony.perard@vates.tech, xen-devel@lists.xenproject.org
References: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
Subject: Re: [PATCH] tools/xentop: Add physical CPU statistics support
Content-Language: en-US
From: Andriy Sultanov <sultanovandriy@gmail.com>
In-Reply-To: <20250708114632.3007693-1-jahan.murudi.zg@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

 > diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
 > index f5d6c19cf9..477299c883 100644
 > --- a/tools/xentop/xentop.c
 > +++ b/tools/xentop/xentop.c
 > @@ -69,6 +70,12 @@
 >
 >  #define INT_FIELD_WIDTH(n) ((unsigned int)(log10(n) + 1))
 >
 > +/* TEMPORARY: Forward declare the internal structure */
 > +struct xenstat_handle {
 > +    xc_interface *xc_handle;
 > +    /* Other members don't matter fo now */
 > +};
 > +

What makes this temporary? Is there a follow-up patch?
Or should this be an [RFC] instead of a [PATCH]?

 > @@ -240,6 +248,7 @@ static void usage(const char *program)
 >             "-r, --repeat-header  repeat table header before each 
domain\n"
 >             "-v, --vcpus          output vcpu data\n"
 >             "-b, --batch         output in batch mode, no user input 
accepted\n"
 > +           "-p, --pcpus         show physical CPU stats\n"
 >             "-i, --iterations     number of iterations before exiting\n"
 >             "-f, --full-name      output the full domain name (not 
truncated)\n"
 >             "-z, --dom0-first     display dom0 first (ignore sorting)\n"

Incorrect indentation here

 > @@ -1245,9 +1256,18 @@ static void top(void)
 >              do_vbd(domains[i]);
 >      }
 >
 > -    if (!batch)
 > +    if (!batch && !show_pcpus )
 >          do_bottom_line();
 >
 > +    if (show_pcpus && xhandle != NULL ) {
 > +    if (update_pcpu_stats(xhandle->xc_handle) == 0) {
 > +        print_pcpu_stats();
 > +    }
 > +    else {
 > +        print("Error getting PCPU stats\n");
 > +    }
 > +   }
 > +

and here


