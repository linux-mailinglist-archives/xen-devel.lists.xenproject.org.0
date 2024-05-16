Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D038C7EE5
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 01:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723676.1128714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kEK-0005gX-Ma; Thu, 16 May 2024 23:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723676.1128714; Thu, 16 May 2024 23:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7kEK-0005f9-Jh; Thu, 16 May 2024 23:09:44 +0000
Received: by outflank-mailman (input) for mailman id 723676;
 Thu, 16 May 2024 23:09:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7kEJ-0005f3-7E
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 23:09:43 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60223b7a-13d9-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 01:09:42 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6f0ef6bee72so513499a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 16:09:42 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-792bf2fc67esm848531585a.74.2024.05.16.16.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 16:09:40 -0700 (PDT)
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
X-Inumbo-ID: 60223b7a-13d9-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715900981; x=1716505781; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1/yXC9IbDu4bX39MTjlu6X71SGfOrBhuEPXKFnZ8qVI=;
        b=p05X2GLkN9F4ptxw8yRIyOCHz7Bsvq9ohyTnbWfatBvYTLFP71RqH4wYQDN179QNVd
         Fe8KQUZUftkFl/o0mIIM/I5RTajLGGvSJ3jjG+0B0iZp4m8GxUjrA+21X5N9jmUqaJkO
         6Pjfaf5wiv+pRzBfjAU5WnLyOu6MmuGzTvO7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715900981; x=1716505781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/yXC9IbDu4bX39MTjlu6X71SGfOrBhuEPXKFnZ8qVI=;
        b=wmNEZKjXIFiXxoX2Abuc6bdZ7BQrtKIZ0l+ajnojMkQM0TP2f7ffiOVB3YQUT+BxHE
         IbTFAmPdmWwoWiH8YMjuRMN9EqXdcpcvnlVSmjPwHtq2RMF9jXj8PdmraPHzm4Ka413K
         1v2inJkMF7DeL3w4q/rbEhmbOOQM4L2M4nuxOSnE6OiQc51tgdlvwtChMqz9WKxie4tv
         PMi/lDASqO3I1IvBA9jbleG7KzLtosNcKivPLy3aRf490zs+0kKP3o3iFHCDkdaJvH+H
         BdSu8b3ltKIrJCB1CcsnUgYwBxAq8S5v6Vdf4hkWuGeINEWvJdU4b7nvzw77cQlB3GCi
         do2w==
X-Gm-Message-State: AOJu0YwgbOAQNe0nFUgdQ/E0i5wlu4FAJ7WG5MDN2i//U1RMJ5hH0Q33
	92EuLe4SZtJ28prGwK6pUXglT3VQSil6Axua8kNZlwGhKNB+EjDc8MvI3uO5vT8=
X-Google-Smtp-Source: AGHT+IEruoVDF5DrobftJJFEu+IHFRfL/kmHd/0Ep2KHK/nb+PW+Z/yL1wFkZwVwBBlZhDEPktgCpw==
X-Received: by 2002:a05:6830:ed9:b0:6f0:8c66:ca1e with SMTP id 46e09a7af769-6f0e91141dcmr20422863a34.2.1715900980730;
        Thu, 16 May 2024 16:09:40 -0700 (PDT)
Message-ID: <2192f69a-3ad3-4cfc-b4eb-2f589bea7099@citrix.com>
Date: Fri, 17 May 2024 00:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] tools: Import standalone sd_notify()
 implementation from systemd
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
 <20240516185804.3309725-3-andrew.cooper3@citrix.com>
 <ZkaRnYqQJGfNURyb@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkaRnYqQJGfNURyb@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/05/2024 12:07 am, Marek Marczykowski-Górecki wrote:
> On Thu, May 16, 2024 at 07:58:02PM +0100, Andrew Cooper wrote:
>> ... in order to avoid linking against the whole of libsystemd.
>>
>> Only minimal changes to the upstream copy, to function as a drop-in
>> replacement for sd_notify() and as a header-only library.
> Maybe add explicit link to the original source?

Well, it is in the top of the file...

> diff --git a/tools/include/xen-sd-notify.h
> b/tools/include/xen-sd-notify.h new file mode 100644 index
> 000000000000..eda9d8b22d9e --- /dev/null +++
> b/tools/include/xen-sd-notify.h @@ -0,0 +1,98 @@ +/*
> SPDX-License-Identifier: MIT-0 */ + +/* + * Implement the systemd
> notify protocol without external dependencies. + * Supports both
> readiness notification on startup and on reloading, + * according to
> the protocol defined at: + *
> https://www.freedesktop.org/software/systemd/man/latest/sd_notify.html+
> * This protocol is guaranteed to be stable as per: + *
> https://systemd.io/PORTABILITY_AND_STABILITY/+ *



>> +static inline void xen_sd_closep(int *fd) {
> Static inline is one of the changes vs upstream, and gitlab-ci is not
> happy about it:
>
> /builds/xen-project/patchew/xen/tools/xenstored/../../tools/include/xen-sd-notify.h:45:3: error: cleanup argument not a function
>    45 |   int __attribute__((cleanup(sd_closep))) fd = -1;
>       |   ^~~
>

Yes - victim of a last minute refactor.  I've fixed it up locally.

~Andrew

