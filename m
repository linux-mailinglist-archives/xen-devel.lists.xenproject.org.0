Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432DA96F0C2
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791663.1201600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVmj-0002WB-VC; Fri, 06 Sep 2024 10:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791663.1201600; Fri, 06 Sep 2024 10:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVmj-0002UK-SC; Fri, 06 Sep 2024 10:01:45 +0000
Received: by outflank-mailman (input) for mailman id 791663;
 Fri, 06 Sep 2024 10:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M+R7=QE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smVmi-0002GE-Vh
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:01:44 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 055afa67-6c37-11ef-a0b4-8be0dac302b0;
 Fri, 06 Sep 2024 12:01:44 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c3d87dd4c3so661049a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 03:01:44 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc528bdasm2252659a12.4.2024.09.06.03.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 03:01:42 -0700 (PDT)
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
X-Inumbo-ID: 055afa67-6c37-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725616904; x=1726221704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8dor+yxpxTDcbcKNhimKj9HQQnEkJEtz7REl1NAVGPQ=;
        b=Nw/WhZQazpQ+jiY+7KA+wDzd10yardA3Dey7Qd3WI/KKYJuUtEWsks3716YpB/6Fj7
         XosYCGikU0BybduLw5gtz3AXNZ7v/xDMoUn2S1HDoBVTD1YL7tFIbtb3r89XOaOeT0vS
         SYNdMWlhcHHTx6upVbV7dPpedbv1ZPnJHvxfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616904; x=1726221704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dor+yxpxTDcbcKNhimKj9HQQnEkJEtz7REl1NAVGPQ=;
        b=YdVn8YnJnKcreIs+R+B1sQzmE1/J9kLTn7oIMhzIprxly7Hf5TCqZNhTMWwl4B5+UQ
         8sPs5nnKPjg/3L6v83metykYWDjAtZkZCLTleDzeW1LqtvLtlIPcl54rX/RfESUI1X1+
         hIqqEC3B5CtMl4/G9FibaQhbSiJmTmXLjgctmHJt1ayxHW4zfaUFNGxNLEpHgqMWjau2
         7kmGT23bkkN/XB1ASGCklWzepKfajsHpwzd/nryC4VdsTkeOkU9vm23TLn/7DxwOMlps
         QwP7VnVMgJiHekWj9lMQ9Orbmr6XYeA38qiDMuU7k3gnplfJerJ6YQSMSLR4ZP5sMmEj
         1oqw==
X-Forwarded-Encrypted: i=1; AJvYcCXpzNLhno0Fl9SOdfbvYFDEu9S6n1nG2M4qi93mGzU0dXDkzq72kz+UhIi5re4IJhxHDp0E0VyZFEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTbJmPjmeaH51w39dZ+5kQwg9+RvhhhItkPsxThyu92FvP5qKx
	6MpB+PCzEmOxIZdplHWe3TjvxLsfPEfO2cxkDDcPCOkA4K24UK1/ZJS01MKkL4g=
X-Google-Smtp-Source: AGHT+IH8klxKGZ0kjdRSpIuGfkQrhURh8jwisvkw3RY2J4fDkXn9DxAka/ni9fMsNVBNbLpfdcdGqQ==
X-Received: by 2002:a05:6402:2554:b0:5c3:d0f5:86f3 with SMTP id 4fb4d7f45d1cf-5c3dc77ae91mr1666688a12.3.1725616903084;
        Fri, 06 Sep 2024 03:01:43 -0700 (PDT)
Message-ID: <5ba7f4ea-4772-4bbf-9e9e-88d45c81b73a@citrix.com>
Date: Fri, 6 Sep 2024 11:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 187507: regressions - FAIL
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: osstest service owner <osstest-admin@xenproject.org>
References: <osstest-187507-mainreport@xen.org>
 <ba5fb24b-52fd-4a7f-a3dd-3c83c2a97e8a@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ba5fb24b-52fd-4a7f-a3dd-3c83c2a97e8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2024 7:08 am, Jan Beulich wrote:
> On 06.09.2024 06:41, osstest service owner wrote:
>> flight 187507 xen-unstable real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/187507/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-i386-xsm                6 xen-build                fail REGR. vs. 187498
>>  build-i386                    6 xen-build                fail REGR. vs. 187498
> This is a result of "x86emul: introduce a struct cpu_policy * local in
> x86_emulate()", and me not noticing the issue because in my tree (for
> AMX in particular) I have several more uses of the variable. I'd really
> like to avoid undoing the change, but adding __maybe_unused also seems
> bogus to me, as does adding a seemingly stray (void)cp somewhere. Good
> alternative ideas, anyone?

__maybe_unused as at least accurate, and its less fragile than a (void)cp;

~Andrew

