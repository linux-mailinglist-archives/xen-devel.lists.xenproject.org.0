Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D898B9E0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807988.1219769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaKE-00079x-78; Tue, 01 Oct 2024 10:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807988.1219769; Tue, 01 Oct 2024 10:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaKE-00076o-4G; Tue, 01 Oct 2024 10:41:50 +0000
Received: by outflank-mailman (input) for mailman id 807988;
 Tue, 01 Oct 2024 10:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+oTF=Q5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1svaKC-00076i-ML
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:41:48 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c18d6e69-7fe1-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:41:46 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so932203966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:41:46 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2997507sm685061966b.204.2024.10.01.03.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 03:41:45 -0700 (PDT)
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
X-Inumbo-ID: c18d6e69-7fe1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727779306; x=1728384106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U7dYBa1OCF97IFZB5isrQzgpYlDBKbJlJLWcO7+y57k=;
        b=E9UTJ1TwCTm6ELuc/x5EigqTlcYDZ4UNi43DoroOLn0sAENGUnLw2XBdtXcxb9WktE
         kP3fTtK7qsFcyN9H4wsQjmLdQPeI5B2Xu00WmuhWL/sKtcpikg0jD4rIpr+3zEaLWfbF
         v5uQ8FEnZV5s4AoQgkFxU3paFQPnwDV93pvYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727779306; x=1728384106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7dYBa1OCF97IFZB5isrQzgpYlDBKbJlJLWcO7+y57k=;
        b=rXLSMAlEYsfxO/OCFI+bHEzQuqujPEg6EPjTPrSLJnn7RE+U6LigRd49UeoNjuaL8S
         userUceiNFfrAjJFmtarrrkYFpfWr29jIaHMQC0vcYHLQZ8gK7w249ODFYxDfpHwvmcr
         wkGdAdPoq+Ts8rr++0pXdWHPwjtqAwSOom1Pe0S7lszhccNY735VFKU/Z/TRpfcVKsGD
         ytcIlWVc9E0/Vmv15k16AlN1ihgCgVjftXB+TJxZqqbagmGjSNrp5wl1ZoTt4nxshhR0
         BDXpVBwMRaSSaAtF3t8/o5K6uZ8N6Snr6LGkIWcs+7KgJ76v+LPle68BrZWXrJA8p6Va
         uRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF9Tbf8dxPqy7T9jhJTHe5i5getwMzyVVA3M6gDurUcn9nrzvyzgS8SBk23VXv+KZs9y/UIyhgsr0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkQ58VZzVpKLEqksVw/yW2lFE0jH6sVbXE+8GrZTvi4hepszLj
	xlGldC0373pHehnZNIJ6kWI0vSpvotREQvhD7HCCfHQiebW4elspkAFrzEQKh6JaCD2fmiBHrGW
	sGbA=
X-Google-Smtp-Source: AGHT+IFA+wQltF9yXP8Opi96p5KojU3zgbE9NzIOmJUnJsFQNdf2AagdRkQFZ7mxUNLeTPg78eyjfA==
X-Received: by 2002:a17:907:7fa9:b0:a7a:b561:3575 with SMTP id a640c23a62f3a-a93c4aec902mr1777075466b.56.1727779305806;
        Tue, 01 Oct 2024 03:41:45 -0700 (PDT)
Message-ID: <5cf7ef35-1887-494a-89c4-faa8f4f3e575@citrix.com>
Date: Tue, 1 Oct 2024 11:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/pv: Handle #PF correctly when reading the IO
 permission bitmap
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240930161837.1248144-1-andrew.cooper3@citrix.com>
 <20240930161837.1248144-3-andrew.cooper3@citrix.com>
 <4045d42b-76dd-464d-af26-85fd9b0b9f05@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4045d42b-76dd-464d-af26-85fd9b0b9f05@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/10/2024 8:36 am, Jan Beulich wrote:
> On 30.09.2024 18:18, Andrew Cooper wrote:
>> RFC: Should we make the boundary check be (port + bytes + 8)?  That would be
>> more correct, but liable to break unsuspecting VMs.  Maybe we should just
>> comment our way out of it.
> What would the "+ 8" be intended to express? (I take it you mean ...
>
>> --- a/xen/arch/x86/pv/emul-priv-op.c
>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>> @@ -169,29 +169,26 @@ static intguest_io_okay(unsigned int port, unsigned int bytes,
>>  
>>      if ( (port + bytes) <= v->arch.pv.iobmp_limit )
> ... this check, which looks correct to me as is. In particular with the
> "+ 8" there would appear to be no way to access ports at the very top of
> the 64k range anymore, as PHYSDEVOP_set_iobitmap handling caps nr_ports
> at 64k. IOW I think "commenting our way out of it" is the only possible
> approach.)

This is actually a horrid corner case, different to what I was thinking
yesterday.

In a real TSS, the CPU doesn't read past the TR limit.  Such accesses
are turned into a permission failure.

But in Xen, guest_io_okay() does read one byte past iobmp_limit.

Previously, we'd consume what was there if it was accessible, or declare
a permissions failure if it was inaccessible.  Now, we'll throw #PF back
to the kernel with %cr2 beyond the the limit.


It's not OK for Xen to be reading past the given limit; it's not how
real CPUs behave.  Part of the problem is that, even since it's
introduction in 013351bd7 (2006), the public interface was named
nr_ports while Xen's internal field was called iobmp_limit.

In terms of how it's used these days in PV guests:

Linux points the bitmap into it's real TSS, and sets nr_ports to either
0 or 65536 depending on whether the userspace task is permitted to use
IO ports or not.

NetBSD doesn't seem to use PHYSDEVOP_set_iobitmap at all, and only uses
PHYSDEVOP_set_iopl.

MiniOS uses neither.


I think Xen's internal variable wants renaming to not be a limit, and
the comment for PHYSDEVOP_set_iobitmap wants extending to note that,
like a real TSS, Xen might read one byte beyond the end of the bitmap.

I think this wants doing in a separate patch.  Thoughts?

> With or without such a comment added
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

