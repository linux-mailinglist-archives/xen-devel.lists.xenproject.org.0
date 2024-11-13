Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8009C761F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 16:20:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835820.1251676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFAV-00019W-U5; Wed, 13 Nov 2024 15:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835820.1251676; Wed, 13 Nov 2024 15:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBFAV-00016W-R1; Wed, 13 Nov 2024 15:20:31 +0000
Received: by outflank-mailman (input) for mailman id 835820;
 Wed, 13 Nov 2024 15:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gr6F=SI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tBFAU-000158-Di
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 15:20:30 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd9b614e-a1d2-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 16:20:23 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9ec86a67feso1223940866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2024 07:20:23 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17635sm875703466b.17.2024.11.13.07.20.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Nov 2024 07:20:22 -0800 (PST)
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
X-Inumbo-ID: cd9b614e-a1d2-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmEiLCJoZWxvIjoibWFpbC1lajEteDYyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNkOWI2MTRlLWExZDItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTExMjIzLjgxMjAxMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731511223; x=1732116023; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k8CNA90Q7I99YasGB+LdI1N5NvD0C301cHI5yI+RCac=;
        b=Q8difbekgClrSRjKdSVJNn11x/2xlEYxcotdnv58pXT3YTgAxLRG5hGYifo3qq+mWY
         Nm5qFbb0n/IrJCKQP/l3OYyirKdR5N6Hb0DSeWT8JGDNvT8iSac9ZD8+HAvnDvX8fCaF
         tfXbDwB3oyAgcZtDL04TSXrMOCV9qk6RR6tjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511223; x=1732116023;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8CNA90Q7I99YasGB+LdI1N5NvD0C301cHI5yI+RCac=;
        b=rgGs1OacQOmLBTqiCtlkzIoTxSC0m4M0Mz2bCQsfyLgTMIExj/NwKK/bm2b7a8Yt7S
         Vok/2u4FnwPKk/CxmnhcbSz0Ap5JOf+BpzPdqR/NXoy9OREZZV7rJ3BcxMXg18uRTygo
         CsHecffQPVm+b9xU4p6DeBcwpc75peM91jIGmaIRTpBMHif6zJYt9jScTN4T7ZDQY/3a
         A5k4gvywgPCTajhTdS4xvNDZOdweilmXzXGIX5qij8mquFuiD6CQljoXt3/kiiX1GfGy
         t7LotcMgyQVe++wltbHAMtqSucKnHZPK/ygFfbmIRBwO8RVz+BAiNCYcU4DjeRkdwIzq
         5WmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnr63UtGKtsGZHcptUzFczFOWBMP8g2jgZJODABCoPxnZAFaa+6S2mZ19jn9BQLdH95BAAnmQVujk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZD2v4Rk3PccmJm+xnwz09cVd20LyDsgOibRrszgXXf3BVzkHj
	/R739chEOA7h6m0iW/QIb06pi3Vg5Zxq4TvvISIj/3GhLhjaYTA6qr2p2TECMT0=
X-Google-Smtp-Source: AGHT+IHOrSZHhh0t9SF2YQNGaY8jraJZca/oOt547l4bl9EBzN5SjSDfI1Sw9izErW78las/3pRCXw==
X-Received: by 2002:a17:907:6ea4:b0:a9a:515:1904 with SMTP id a640c23a62f3a-a9eeff0dc1bmr2079498066b.15.1731511222955;
        Wed, 13 Nov 2024 07:20:22 -0800 (PST)
Message-ID: <686facb6-0a6a-471c-a91c-b593cee7831a@citrix.com>
Date: Wed, 13 Nov 2024 15:20:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.19.1
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Kelly Choi <kelly.choi@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2024 1:00 pm, Jan Beulich wrote:
> All,
>
> the release is due by the end of the month. Please point out backports you find
> missing from the respective staging branch, but which you consider relevant.

Looking over the XenServer patchqueue:

These are all bugfixes, some that came from customer bugs:

e42e4d8c3e2c: tools/misc: xen-hvmcrash: Inject #DF instead of
overwriting RIP
42db2deb5e76: tools/libxs: Fix length check in xs_talkv()
ba709d514aac: x86/viridian: Clarify some viridian logging strings
d81dd3130351: x86/shutdown: change default reboot method preference
0d69635d27cb: tools/ocaml: Remove '-cc $(CC)' from OCAMLOPTFLAGS
8ffcf184affb: tools/ocaml: Fix OCaml libs rules
126293eae648: tools/ocaml: Drop the OCAMLOPTFLAG_G invocation
1965e9a93074: tools/ocaml: Fix the version embedded in META files
e58a2858d588: x86/boot: Preserve the value clobbered by the load-base
calculation

This is a diagnostic improvement, also from a customer bug:

2f413e22fa5e: x86/msr: add log messages to MSR state load error paths

These are a SIGPIPE bugfix which happen to also have a perf
improvement.  I cant remember if we discussed backporting them before. 
(Juergen/Anthony?)

42db2deb5e76: tools/libxs: Fix length check in xs_talkv()
e2a93bed8b9e: tools/libxs: Rework xs_talkv() to take xsd_sockmsg within
the iovec
f050c03ce2ad: tools/libxs: Rationalise the definition of struct xs_handle
046efe529e82: tools/libxs: Track whether we're using a socket or file
ebaeb0c64a6d: tools/libxs: Use writev()/sendmsg() instead of write()
a17b6db9b007: tools/libxs: Stop playing with SIGPIPE

These are from a livepatching snafu:

3a28da8f4daf: xen/livepatch: remove useless check for duplicated sections
8c81423038f1: xen/livepatch: drop load_addr Elf section field
86d09d16dd74: xen/livepatch: simplify and unify logic in prepare_payload()
fa49f4be413c: xen/livepatch: do Xen build-id check earlier
aa5a06d5d6ed: x86/alternatives: do not BUG during apply

where the buildid check is much too late.


And from looking at staging:

fa2d8318033e: x86/cpu-policy: Extend the guest max policy max leaf/subleaves

This fixes a real issue on older AMD systems.

~Andrew

