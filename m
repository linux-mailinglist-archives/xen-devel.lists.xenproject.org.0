Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA112923D3B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 14:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752422.1160637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcIA-0005mh-W2; Tue, 02 Jul 2024 12:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752422.1160637; Tue, 02 Jul 2024 12:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOcIA-0005kf-TR; Tue, 02 Jul 2024 12:07:26 +0000
Received: by outflank-mailman (input) for mailman id 752422;
 Tue, 02 Jul 2024 12:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWIE=OC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sOcI9-0005kZ-Ss
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 12:07:25 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a39e0220-386b-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 14:07:23 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-6b4fced5999so18999166d6.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 05:07:23 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b59e368b42sm42818666d6.24.2024.07.02.05.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 05:07:22 -0700 (PDT)
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
X-Inumbo-ID: a39e0220-386b-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719922042; x=1720526842; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R4HWPtFvGjxHBmjEVusfslXJRBDefKRSHPZmc2YYzhQ=;
        b=UI1H4Yz6GYpp5e1OfbQX+Ysb4sdsVSu3ARgalgBrkbdYKQI8RSC4mKpab9VYLHVF3b
         IWFQ5/jjbUzTtjXhNB1P0RdixqOh7oJx/+G9i7aRoYqf+fOH1m9cr5atso5yP7/dRlsa
         t7p8zQS9Lm+Ag4hmDMWDttJK7NWesQhq9dVUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719922042; x=1720526842;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4HWPtFvGjxHBmjEVusfslXJRBDefKRSHPZmc2YYzhQ=;
        b=GDozf42nv+kwcvVqcicfkoZyzAa44d0p/YfCmexYdYo/7GmkpsQ4pqWz7WBZJ7jXZ/
         tFLwOsP172fv6fOUSjaJMnZmHZP38oV63H5+Kv1yaCOaWqsMrXCuPy4+ecehWhlfBHU3
         M1giTYz+nFjdBbd0dDGZWtDBnv/PnogpegcrGTgsgyH/UsFno/xe4tlL0c7QZoT7/NS/
         VO51FsbLTqisPe/xqIqpY5Kt0LV3qbbtvjQar68jktQs8afO7N2Sahl6Dlvee12Jy3En
         TfWu3s9/boHmkDhk/KcC2ro+1lb9cUFbiDc/jpn2Bc95kd1E0q1q/p5+gn9e2ksenD+O
         WNAA==
X-Forwarded-Encrypted: i=1; AJvYcCXIorS+br3oufCkIHO46rc1ULmE1gbnjxh+NGR+MWF7j3AegMmVHTdoeqYymS0x3pjRMT2QcKm+xBY+ZmHWL+skGUViMP51sR3OiSdjigc=
X-Gm-Message-State: AOJu0YxP/mLsCsEJHuR+Vdki9wKdcrwA0AXv/MqDn0zmy/rZr6NTl92m
	TtjqwteeLZxFx8aofxzNZuIR9qW8nYizxtOXkh1pCU3cn6xptePcQoc0yvtvDhQ=
X-Google-Smtp-Source: AGHT+IH1dhE4GBCTWkiz+2+IjQK+3t5TAtsxWquA4kpzz2hy6KwsLU/iLO4hNx+JO2WXRoYY9Goyng==
X-Received: by 2002:ad4:5dc5:0:b0:6b5:cfba:10c7 with SMTP id 6a1803df08f44-6b5cfba141dmr17626206d6.30.1719922042407;
        Tue, 02 Jul 2024 05:07:22 -0700 (PDT)
Message-ID: <f5ab5541-8230-4bee-bdd1-cd086e783659@citrix.com>
Date: Tue, 2 Jul 2024 13:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] tools/misc: xen-hvmcrash: Inject #DF instead of
 overwriting RIP
To: Matthew Barnes <matthew.barnes@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony@xenproject.org>
References: <2cd2f12d49f75b8870c964fa86d29f0e4e18b155.1719840698.git.matthew.barnes@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2cd2f12d49f75b8870c964fa86d29f0e4e18b155.1719840698.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2024 3:47 pm, Matthew Barnes wrote:
> diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
> index 1d058fa40a47..efa47c9dfec8 100644
> --- a/tools/misc/xen-hvmcrash.c
> +++ b/tools/misc/xen-hvmcrash.c
> @@ -77,65 +66,22 @@ main(int argc, char **argv)
>          exit(1);
>      }
>  
> -    ret = xc_domain_pause(xch, domid);
> -    if (ret < 0) {
> -        perror("xc_domain_pause");
> -        exit(-1);
> -    }

You can't really drop the xc_domain_{un,}pause() calls.

Previously, from the point of view of the guest, we atomically corrupted
all vCPUs at once.

Without the pause, we're corrupting each vCPU in turn, with the guest
able to run in the meantime.

~Andrew

