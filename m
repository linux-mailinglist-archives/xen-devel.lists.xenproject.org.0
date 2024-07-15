Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475689316F2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 16:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758986.1168514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTMrB-0007ZY-TI; Mon, 15 Jul 2024 14:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758986.1168514; Mon, 15 Jul 2024 14:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTMrB-0007X7-PX; Mon, 15 Jul 2024 14:39:13 +0000
Received: by outflank-mailman (input) for mailman id 758986;
 Mon, 15 Jul 2024 14:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTMrA-0007X0-2N
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 14:39:12 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff5f6f71-42b7-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 16:39:10 +0200 (CEST)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e03a0faee1eso4100547276.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 07:39:10 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b76199d5a2sm21625426d6.60.2024.07.15.07.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:39:08 -0700 (PDT)
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
X-Inumbo-ID: ff5f6f71-42b7-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721054350; x=1721659150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5plw/RgYZD5tUwrOPHG3SlWFYH5w903LaDLE1ClpJXA=;
        b=rIf16sVHgCu+QJbOuJY58gRULByBV8DiULLd8e53maoPnla4FSYYKh7zhR8DivrSOP
         7ngR5HsBA1+rXAbltdTiGrqY2t5fgOKxIB9MT+Sou7yWhjz0HeTMo1kLZ0oYgoFZtV7g
         GOSZmJCy59Y3BjxrtvoRJjEP6lF5wTG0582wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721054350; x=1721659150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5plw/RgYZD5tUwrOPHG3SlWFYH5w903LaDLE1ClpJXA=;
        b=gdQg+ZOQMlX9QL7A984OtHYyv3RO0oAGCYjVUTtxDoe9KO28YQpL5ZS5vJHbyPppQ0
         KG3Dm6nu5YmOPHOrGib2sm907pmRkvAgIBfYb84NiE+5EFAIemUVltFOWKwX62FdZbrH
         bgVowt02zR+KesVma3pYzhkPLnTemM0HxhPqipcESxce2bDWeK6L3U5UnyBeetfjoxDg
         SEEEho8YHKSQQei+CrtmIh8SQ+eMhbMHBteBjEhqSppdl2eHxyaQoZjyI4ifIawiDsid
         lRSUThvPKdV6VPN1nSiyDVmjZB1IwsOTU84cuWoMxEFcGnkHmVb19N/sO/cV/CjyrS0Z
         dITg==
X-Gm-Message-State: AOJu0YzFKYugIVWdhxCVqwvllazyo4duxs2yreg2ydxbcWFtKRAUoUf9
	vGcmKR/3WvfRu1w4muw1BZw9KPKnKhRuv37tbPZaQRAjryUZ3752hYyrEJxV4ls=
X-Google-Smtp-Source: AGHT+IHDOVtM6otgZs7jvJKFMw46e9BN51AQFoyjlsNmvUkDavmqmDMFtdklu/afBN6oaYn1FhKh0w==
X-Received: by 2002:a25:ce45:0:b0:e03:4b54:5670 with SMTP id 3f1490d57ef6-e041b079c56mr21015969276.38.1721054349430;
        Mon, 15 Jul 2024 07:39:09 -0700 (PDT)
Message-ID: <ac7ecb53-8fd5-44bb-9318-57acc9303a01@citrix.com>
Date: Mon, 15 Jul 2024 15:39:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/12] CI: Refresh and upgrade the Fedora container
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240713181005.3363912-1-andrew.cooper3@citrix.com> <ZpUmnrsLD5s0KaeM@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpUmnrsLD5s0KaeM@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2024 2:39 pm, Anthony PERARD wrote:
> On Sat, Jul 13, 2024 at 07:10:05PM +0100, Andrew Cooper wrote:
>> Fedora 29 is long out of date.  Move forward 5 years to Fedora 39.
>>
>> Inlcude all the usual improvements.  Rework the container to be non-root, use
>> heredocs for legibility, and switch to the new naming scheme.
> "clang" as been removed, but it's not mention in the commit message.

Oops - I meant to mention that.  We don't do any clang builds with this
container, so I though I'd keep it slimer until we change that.

>  The
> other changes are kind of "the usual improvement" yes, as been done to
> other containers (libaio, nasm, ...).
>
> The patch is missing an update of the "containerize" script.

Ah - I found the hunk in a different patch.  I'll fix.

>
>> diff --git a/automation/build/fedora/39-x86_64.dockerfile b/automation/build/fedora/39-x86_64.dockerfile
>> new file mode 100644
>> index 000000000000..e2048a437581
>> --- /dev/null
>> +++ b/automation/build/fedora/39-x86_64.dockerfile
> ...
>> +
>> +    dnf -y install "${DEPS[@]}"
> You might want to add --setopt=install_weak_deps=False to avoid
> installing "git" for example.

Well, git-core is installed explicitly, but point taken.

> When running the original command by hand, `dnf` want to install those weak deps:
>     Installing weak dependencies:
>      apr-util-bdb
>      apr-util-openssl
>      cryptsetup-libs
>      diffutils
>      git
>      libbpf
>      libxkbcommon
>      mercurial
>      perl-NDBM_File
>      python3-fb-re2
>      python3-pip
>      qrencode-libs
>      subversion
>      systemd-networkd
>      systemd-resolved
> And comparring the list of deps, these extra pkgs are installed because
> of weak deps:
>     apr
>     apr-util
>     dbus
>     dbus-broker
>     dbus-common
>     device-mapper
>     device-mapper-libs
>     git-core-doc
>     kmod-libs
>     libargon2
>     libseccomp
>     libserf
>     perl-Error
>     perl-File-Find
>     perl-Git
>     perl-TermReadKey
>     perl-lib
>     python3-zombie-imp
>     re2
>     subversion-libs
>     systemd
>     systemd-pam
>     utf8proc
>     xkeyboard-config
>
> So, probably only "perl-File-Find" (can be written "perl(File::Find)" I
> think as well) might be needed, but only for docs/ I think, from the
> previous email.
>
> It seems I go from 1.26GB to 1.18GB without those weak deps.

Thanks.  I'll rework.

I have a specific plan for testing docs and it's going to be a dedicated
container and job, as well as things being a bit more -Werror-like.

~Andrew

