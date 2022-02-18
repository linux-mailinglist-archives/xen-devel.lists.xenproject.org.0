Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE14BBA31
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 14:39:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275451.471323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3TR-0007Wf-Mg; Fri, 18 Feb 2022 13:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275451.471323; Fri, 18 Feb 2022 13:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL3TR-0007Un-Iz; Fri, 18 Feb 2022 13:39:01 +0000
Received: by outflank-mailman (input) for mailman id 275451;
 Fri, 18 Feb 2022 13:39:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ZS3=TB=gmail.com=bjolson1278@srs-se1.protection.inumbo.net>)
 id 1nL3TQ-0007Uf-V7
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 13:39:01 +0000
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [2607:f8b0:4864:20::d2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20628dfd-90c0-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 14:39:00 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id q20so5251271ioi.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Feb 2022 05:38:59 -0800 (PST)
Received: from [192.168.122.77] (68-168-187-203.fttp.usinternet.com.
 [68.168.187.203])
 by smtp.gmail.com with ESMTPSA id x14sm3375799ill.88.2022.02.18.05.38.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 05:38:58 -0800 (PST)
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
X-Inumbo-ID: 20628dfd-90c0-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ftto2S0yErh3khVzh/U/wtVZFfGeIHj49Z7MrFjrxt0=;
        b=JQwWMF1YZSEqQf7hF8AxFg3xREm5jy2QXfGg9NExYaW7v9qNlTqABPsI72wwViIDg+
         96NtdAWV4ZOxiV3efoQ3qUNmX2iJlt5TYcess7BO2qYZ12Eqimfp1iTyFwCzrIJ7Tk6b
         aJMji3eTzxLLUZlZeNcI/pLbVNzhNHwQwuJ4SbQRGjeCKrEVYeGPbqkSChy2bv3yJhiz
         asyQ1mV2qr2gDgx+XN1mmEy8p/NvhiyjihETxY/iPwCErUY/jyC6q+a+i0ZJoph3hmr2
         8zbNEk3E3LFtzHU5xAchGhwmOM4KVHp6nhD7ElsERoRzw9fQf3yy2FbkDv9zs99A+vPS
         f8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ftto2S0yErh3khVzh/U/wtVZFfGeIHj49Z7MrFjrxt0=;
        b=oOfYAdcBMIdDmMddaylqpDR+HSsAyYN7e9f9guSGRQQEzj2zZ/YLj2EBi5z6njLFBy
         A/unmFt85bagrxoeOQvXHwDUZ7k8N57ABrBK5F+0BwgLR2x73t1cUzPGYnfIP/zlAk7m
         XCUKAJ3L3SRSBpitBYH57WIOIQJ9cjxXefdc495db2O9DLu7yxpzBxmB4bxQVfn8pFgp
         fRC3ao8S1uYomDSqtiguZnWvYMQYV6s57MC9e1DtXIZcFCXRNUGOhvZIhLqgsnaxBALQ
         zmGMTNtpAlUyljefIxdYntD0HTuVx34Z0y2okPFn01D6p0MaBa5MvmJ8u8u4XlrkTEYM
         3JOg==
X-Gm-Message-State: AOAM530QDyxbUXbEdtEpXKNDFWpr7xsKLE4TafaiPUydB7OpJ0cJIWNC
	Q1BiSW8aMqlX74/nBbKPJ4irzDJt9xZww6Ux
X-Google-Smtp-Source: ABdhPJya2nL/hIYyr9wKq1X1YFV0zBCXIMGj/SKq9ukrWmvyeh+CoSYC+9V5wsoWMPW+k0AMZ0XvbA==
X-Received: by 2002:a05:6638:d87:b0:30f:6208:19fa with SMTP id l7-20020a0566380d8700b0030f620819famr5434995jaj.204.1645191538632;
        Fri, 18 Feb 2022 05:38:58 -0800 (PST)
Message-ID: <a44ed8cb-0bdc-0f6f-fc6e-7f831605a71c@gmail.com>
Date: Fri, 18 Feb 2022 07:38:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] github: add workflow to run Coverity scans
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
 <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
 <34ebc66c-e55f-3f98-b769-0e73bdf3c2fe@srcf.net>
 <Yg+gwfRqetYoT4Th@Air-de-Roger>
From: Brian Olson <bjolson1278@gmail.com>
In-Reply-To: <Yg+gwfRqetYoT4Th@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Can someone please tell me how to remove my email account from this 
list? Thank you.

On 2/18/22 07:36, Roger Pau Monné wrote:
> On Fri, Feb 18, 2022 at 12:23:47PM +0000, Andrew Cooper wrote:
>> On 18/02/2022 12:21, Andrew Cooper wrote:
>>> On 18/02/2022 12:00, Roger Pau Monne wrote:
>>>> Add a workflow that performs a build like it's done by osstest
>>>> Coverity flight and uploads the result to Coverity for analysis. The
>>>> build process is exactly the same as the one currently used in
>>>> osstest, and it's also run at the same time (bi-weekly).
>>>>
>>>> This has one big benefit over using osstest: we no longer have to care
>>>> about keeping the Coverity tools up to date in osstest.
>>>>
>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>>   .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
>>>>   1 file changed, 35 insertions(+)
>>>>   create mode 100644 .github/workflows/coverity.yml
>>>>
>>>> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
>>>> new file mode 100644
>>>> index 0000000000..12fc9c782b
>>>> --- /dev/null
>>>> +++ b/.github/workflows/coverity.yml
>>>> @@ -0,0 +1,35 @@
>>>> +name: Coverity Scan
>>>> +
>>>> +# We only want to test official release code, not every pull request.
>>>> +on:
>>>> +  schedule:
>>>> +    - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
>>>> +
>>>> +jobs:
>>>> +  coverity:
>>>> +    runs-on: ubuntu-latest
>>>> +    steps:
>>>> +    - name: Install build dependencies
>>>> +      run: |
>>>> +        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
>>>> +          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
>>>> +          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
>>>> +          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
>>>> +          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
>>>> +          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
>>>> +          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
>>>> +          libtool libfuse-dev liblzma-dev ninja-build \
>>>> +          kpartx python3-dev python3-pip golang python-dev libsystemd-dev
>>> We dropped gettext as a dependency a few releases ago, and we don't need
>>> python3-pip either.  Can fix on commit.
>>>
>>>> +    - uses: actions/checkout@v2
>>> I think we want
>>>
>>> - uses: actions/checkout@v2
>>>    with:
>>>      ref: staging
>>>
>>> Can also fix on commit.
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> (mainly because I
>>> can see that Coverity has done the right thing with this.)
>>>
>>>> +    - name: Configure Xen
>>>> +      run: |
>>>> +        ./configure
>> On second thoughts, we can probably --disable-docs here, because it's
>> just wasted processing time when all we care about is the C.
> We do not build the docs already, because the build command is `make
> xen tools`.
>
> Thanks, Roger.
>

