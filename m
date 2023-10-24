Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367187D5821
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 18:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622484.969461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvKDb-0002fn-Rv; Tue, 24 Oct 2023 16:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622484.969461; Tue, 24 Oct 2023 16:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvKDb-0002cp-Om; Tue, 24 Oct 2023 16:25:23 +0000
Received: by outflank-mailman (input) for mailman id 622484;
 Tue, 24 Oct 2023 16:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvKDa-0002ch-Re
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 16:25:22 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edacf137-7289-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 18:25:22 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c466efso26142045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 09:25:22 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16842887wmh.11.2023.10.24.09.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 09:25:20 -0700 (PDT)
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
X-Inumbo-ID: edacf137-7289-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698164721; x=1698769521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQsq2LWk3bVW9FNqtR4uLNXJWBJH5YdmWftR29dvZwY=;
        b=RFHLHuEqoWNp7pvwGGRMokes8Zkh28rJrwfZy5iNQi+y2TORmbVZUqy/GkkHr+yrcx
         zOswDRci+i/DYJw0PfbYRy5rMUhUh4mf3PFnnACwKoAJN66QGmQLkqxMXGhkj7pvSkwH
         j7ai3mJfP9OyrBbUzDfJHjGKpuWh9MFXJL3CFZwt6iSaLyYnZvUllz4LgiRcQ6IH2fKJ
         5APAMiBrBqf5SRfWrZqlHCp4C+uaatwQ9/XrdCdTBtEMdjP57Ko3X706nOvtsWMGWni9
         /HXB4PRRz5725BNm+L8vqoztvqago/UWm4qWLZU/pjdgOmYnVmkEJG2uLC0ZLBdNaC4R
         A4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698164721; x=1698769521;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQsq2LWk3bVW9FNqtR4uLNXJWBJH5YdmWftR29dvZwY=;
        b=TgKJWnHEot2gDS0nq+py6JXm3zN+x19mzF3N9c1kmlNYMXbxO6Qx6SEblmUK9+4oxq
         /90mzXqKwpTYBjEZvkuQZpsxnIP4ZriOaOypyRiKpBKzJsFW//UhDQ5nQl4JuUY/p3wG
         uFJZMZkNfZQZ4kHGcJqQKUP1q/mzmeQauIvuikUAFCd6D80vfGHLn0CagVHvZ5kuFIfv
         Ll3liInVp1SvN7lg6Ng6RljBOMfE/SphWrzcGOWnCn0wvOFAxnfwklX3RrLHKLMph/77
         E8wJucSTmiGxCAd6oD9HT7tQLL9toX2P3YfV0AzjMU+ZB0kOJiaDCfQ4l0y4VVxkA6J9
         z8Mw==
X-Gm-Message-State: AOJu0YwoZIbFi53bpV8I6m+DfQkuCt5LLhRPgEJcKaHphCfccziz8WTI
	bHmvwUP2AFva2eGOY2Stt/k=
X-Google-Smtp-Source: AGHT+IEyWeztiwQ8cM58Q3Udtb/rgzHp2VAypkAcc4XZaR7o8nmAoBYxpyNYOMgRGMHbHOA9ZtR7WQ==
X-Received: by 2002:a1c:790a:0:b0:406:5308:cfeb with SMTP id l10-20020a1c790a000000b004065308cfebmr9764626wme.11.1698164721279;
        Tue, 24 Oct 2023 09:25:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <19fc2701-4cd8-4a14-9d45-bfaea37ed2d6@xen.org>
Date: Tue, 24 Oct 2023 17:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 12/12] hw/xen: add support for Xen primary console in
 emulated mode
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-13-dwmw2@infradead.org>
 <c18439ca-c9ae-4567-bbcf-dffe6f7b72e3@xen.org>
 <3acd078bba2d824f836b20a270c780dc2d031c43.camel@infradead.org>
 <3f22903b-30f0-40f2-8624-b681d9c7e05d@xen.org>
 <42b005d7c03d5b0d47a16c4e025d8c3ec7289e0f.camel@infradead.org>
Organization: Xen Project
In-Reply-To: <42b005d7c03d5b0d47a16c4e025d8c3ec7289e0f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/10/2023 16:49, David Woodhouse wrote:
> On Tue, 2023-10-24 at 16:39 +0100, Paul Durrant wrote:
>> On 24/10/2023 16:37, David Woodhouse wrote:
>>> On Tue, 2023-10-24 at 15:20 +0100, Paul Durrant wrote:
>>>> On 16/10/2023 16:19, David Woodhouse wrote:
>>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>>
>>>>> The primary console is special because the toolstack maps a page at a
>>>>> fixed GFN and also allocates the guest-side event channel. Add support
>>>>> for that in emulated mode, so that we can have a primary console.
>>>>>
>>>>> Add a *very* rudimentary stub of foriegnmem ops for emulated mode, which
>>>>> supports literally nothing except a single-page mapping of the console
>>>>> page. This might as well have been a hack in the xen_console driver, but
>>>>> this way at least the special-casing is kept within the Xen emulation
>>>>> code, and it gives us a hook for a more complete implementation if/when
>>>>> we ever do need one.
>>>>>
>>>> Why can't you map the console page via the grant table like the xenstore
>>>> page?
>>>
>>> I suppose we could, but I didn't really want the generic xen-console
>>> device code having any more of a special case for 'Xen emulation' than
>>> it does already by having to call xen_primary_console_create().
>>>
>>
>> But doesn't is save you the whole foreignmem thing? You can use the
>> grant table for primary and secondary consoles.
> 
> Yes. And I could leave the existing foreignmem thing just for the case
> of primary console under true Xen. It's probably not that awful a
> special case, in the end.
> 
> Then again, I was surprised I didn't *already* have a foreignmem ops
> for the emulated case, and we're probably going to want to continue
> fleshing it out later, so I don't really mind adding it.
> 

True. We'll need it for some of the other more fun protocols like vkbd 
or fb. Still, I think it'd be nicer to align the xenstore and primary 
console code to look similar and punt the work until then :-)

   Paul

