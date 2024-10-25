Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D32B9B0621
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 16:48:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.826057.1240397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4LaN-0002ya-0O; Fri, 25 Oct 2024 14:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826057.1240397; Fri, 25 Oct 2024 14:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4LaM-0002wc-U2; Fri, 25 Oct 2024 14:46:42 +0000
Received: by outflank-mailman (input) for mailman id 826057;
 Fri, 25 Oct 2024 14:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hagD=RV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t4LaK-0002vA-OF
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 14:46:40 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f02020ca-92df-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 16:46:37 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c9428152c0so2439854a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 07:46:37 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b30d6fdc5sm77872466b.163.2024.10.25.07.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 07:46:36 -0700 (PDT)
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
X-Inumbo-ID: f02020ca-92df-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729867597; x=1730472397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RsNLLDRKWTaCJ4d93PmSSMU/g7hkzJ7gZdeFBBZV5I4=;
        b=YpEAflZnzDhsdWCB0pkOFLsVGOEvhnlgS23eKL7lQp3qYdBvnXZew7hbh69R7TXkmn
         hE7nZ95QzsxSFrtcnszu84isKWhDswZjq5jd4nKBhxxXTK9PonUZ0ULEw+SSy91/+8Hi
         U8eUYeqwRJmMwNFRJZyaQJD+cADROIbuO30ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867597; x=1730472397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsNLLDRKWTaCJ4d93PmSSMU/g7hkzJ7gZdeFBBZV5I4=;
        b=f618qTUFN57KDYDtmiLqPZcdrzSDLU70wx4Wr1us+bs55xpSjh0QgeuXja15GbZKI9
         i4ClCJF5ji+l3S6294flfLDFtXkZttxSP4TsRiFY58x/YC8ft3FQUbCN53e8HBAw5C5t
         wxZ34owb46ZgEw1ZV/yu8cqak0ABcLBrRgvv/yAwxCwSI+vNyzsTfiv9Z483zf/h4bkq
         UWCorI13M8V6p4TIKF/Cqsfe4sLIwxXqmyKitDhTBLuxrpKK3Ix/8k1pxQJbt3KJsfOF
         VKqGr90OZmBPILReq/1OeQUP7MZbDs5lxDA/5+ttExiHSIJmXs7qq5JkI/KRjSQBb/nF
         Lofg==
X-Gm-Message-State: AOJu0YwgBfzlUPA19/Dv6NJj8LEJE4+QezHbi+3v4K81Qtqus3+RvTU2
	sjg//due5z6SiLdLK3XRS+5efn+KT4UiSZmslutDrJRwiiy05ejP+RDRetVOfNE=
X-Google-Smtp-Source: AGHT+IFMoW4HjIgIHYWftdnQ1RBMFu44iiHF3aP3ZjorsYxoRzWT9pd9u7vfxB02ObkUirt4pVGDnA==
X-Received: by 2002:a17:906:dac2:b0:a99:5f2a:444d with SMTP id a640c23a62f3a-a9ad285ff6emr606667966b.56.1729867597009;
        Fri, 25 Oct 2024 07:46:37 -0700 (PDT)
Message-ID: <9cbbfe4c-ca22-42e4-94fc-873e177aa291@citrix.com>
Date: Fri, 25 Oct 2024 15:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/6] CI: Refresh the Debian 12 x86_64 container
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
 <f8452748-067d-48d3-8ed3-3adc98566aa3@citrix.com>
 <opwqn4ewu3pvrmhoikglwzfzu7pwkiht7en4vtnmc755nxphvr@ilgcrk3bo2sa>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <opwqn4ewu3pvrmhoikglwzfzu7pwkiht7en4vtnmc755nxphvr@ilgcrk3bo2sa>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2024 4:10 pm, Javi Merino wrote:
> On Thu, Oct 24, 2024 at 03:04:10PM +0100, Andrew Cooper wrote:
>> On 24/10/2024 11:04 am, Javi Merino wrote:
>>> +
>>> +    apt-get update
>> apt-get -y
> apt-get update refreshes the package lists.  -y doesn't do anything
> here.  It is needed for "apt-get install" below but not for
> apt-get update.  It would be needed for "apt-get upgrade", but
> we don't.

Hmm ok.  We might want to adjust the others to match then.

>
>>> +    DEPS=(
>>> +        # Xen
>>> +        bison
>>> +        build-essential
>>> +        checkpolicy
>>> +        clang
>>> +        flex
>>> +
>>> +        # Tools (general)
>>> +        ca-certificates
>> Interestingly, we've gained ca-certificates and dropped apt-transport-https.
> ca-certificates is needed for curl, wget or anything that tries to
> validate tls certificates.  It is a Recommends of libcurl, as
> curl by default validates the ca certificate of https servers.
>
>> ca-certificates is a side effect of --no-install-recommends, so is
>> fine.  I recall there being a specific reason why we needed
>> apt-transport-https, but I can't recall why exactly.  Something about
>> the LetsEncrypt Cert used by xenbits IIRC.
> I dropped apt-transport-https because it doesn't make sense to have
> it.  apt-transport-https allows apt to access package repositories over https,
> but we were installing alongside all the other packages.  apt is never
> used again, so giving it the ability to install packages over https is
> pointless.

That is, as they say, an assumption.

fe746c26c0d2 ("automation/gitlab: add https transport support to Debian
images")

Although, subsequently the use of apt.llvm.org was removed:

a6b1e2b80fe2 ("automation: Remove clang-8 from Debian unstable container")
7a2983757216 ("CI: Remove llvm-8 from the Debian Stretch container")

So I guess we're back to being ok without it.
>>> +        expect
>> Expect is only for the test phase, so should move later.
> I put it here because ./configure checks for it.

It does?

That's not necessary/expected.

>> Any decompressor which we don't find a suitable devel package gets the
>> hypervisor form instead.
>>
>>> +        # To build the documentation
>>> +        pandoc
>> I know we had pandoc before, but I'd like to drop it.
>>
>> I'm intending to turn off docs generally, and do them separately in a
>> single job that has *all* the docs build dependencies, not a misc subset
>> that the build system happens not to complain at.
> I had the "build the docs as its own job" in my TODO list and was
> going to drop pandoc from this dockerfile then.  I can remove pandoc
> in this commit if you prefer.

Dropping packages from existing containers is complicated, because the
container (name) is shared with prior branches.  You have to wait until
the oldest version of Xen which still uses the package leaves testing
(== leaves security support, == 3y), or we've backported changes to all
branches to drop the dependency.

The rename here gives us leeway because this change won't clobber any
older branches in Xen, but I don't want to set the precedent.

>
>> I'm on the fence about the Qemu build things.  It's off by default now,
>> but the container never previously had meson/ninja so it wouldn't have
>> built either.  Perhaps leave them out until someone complains.
> I thought I had removed them.  Is there anything else that needs to
> go?

These containers are both for CI and human use, so "what happens in CI"
isn't the only consideration.

But, given that Qemu didn't build in the old container anyway, I'm not
overly fussed about keeping it working in the new container.

So yes, please keep the deps removed.  We can always add them back in later.

~Andrew

