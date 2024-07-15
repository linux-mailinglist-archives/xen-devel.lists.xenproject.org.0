Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA593154F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:03:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758869.1168391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLLo-0005Nh-C4; Mon, 15 Jul 2024 13:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758869.1168391; Mon, 15 Jul 2024 13:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLLo-0005LZ-7l; Mon, 15 Jul 2024 13:02:44 +0000
Received: by outflank-mailman (input) for mailman id 758869;
 Mon, 15 Jul 2024 13:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kjrg=OP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sTLLn-0005LS-Bf
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:02:43 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84da1d5d-42aa-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 15:02:41 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-79f08b01ba6so355900685a.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 06:02:41 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a160bdca41sm194785685a.55.2024.07.15.06.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 06:02:40 -0700 (PDT)
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
X-Inumbo-ID: 84da1d5d-42aa-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721048561; x=1721653361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vmQg8lZ4uyq92nzQahMeihKaOXreEhuittm/emP8eJI=;
        b=GZS89clI7WWZDxgso6NIdIOSIFMChev6+Ui4fxhgwsxiSL6jJyztixIZs4c8Bk2Jfd
         Q4THGjSLqOBEEJFLZYf45dICWJ6EkbGCQz0oOfZLzY5yIHrZmR7llSb65usSFmg+pjbT
         CqeJ3sZdHi1MfcEO3mumH2Y6QLws4U+SW9JvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048561; x=1721653361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmQg8lZ4uyq92nzQahMeihKaOXreEhuittm/emP8eJI=;
        b=WEAgTrwWdLwj/liVZwAfELcmu0yWcW83HBtWljtlQvvINx+/PWZcAHmUEmyWwkCYil
         qGlEYEh2aoY48uocq4ThjRMNB2V6HFCRweHoUc7LIBgKiM5SZLh2J2PHPq5cdKDZCfpA
         TZTExpH3KrcsJvKWR894qc/WBssy0QfH21Ha94rx3mlue+T6wUGAHTPxzvi6YIXR9Imk
         /5Rz40FQFG0X28XQnij0yyjkQjoEN9CLr0BK49j567sGMO1G/He7EjMMwbxcg8NVzJos
         KtUuwakGU9LMUzQTiYTMsnp2Qzvw6JNRPwAopRPm09aux4uQ/oeGvFM0wiGhqocaeE5c
         Or9A==
X-Gm-Message-State: AOJu0YxH4MATuyIG+HkvliSXgNBZs7UN9d730pRecUGD4D8v31uWvvPd
	lamwneywJQHixm/bzj2Rg1qCDieTngqgLc2fcxHBdlmVRHx0ASYoehpXyjHu82U=
X-Google-Smtp-Source: AGHT+IFWnNHFP8JQ2FhCn+irM9H3Hh38qNEhzV7Mwc79KS+YYvqSo3UKA7gE4x8o319Eqr/vxkHqNw==
X-Received: by 2002:a05:620a:215c:b0:79f:712:ff97 with SMTP id af79cd13be357-7a152fee4c5mr1581482185a.18.1721048560672;
        Mon, 15 Jul 2024 06:02:40 -0700 (PDT)
Message-ID: <377cd22e-e5f9-4675-9d11-92298dc5ce55@citrix.com>
Date: Mon, 15 Jul 2024 14:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/12] CI: Swap from perl to perl-base in build containers
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240713180952.3363596-1-andrew.cooper3@citrix.com> <ZpUaMwZoKnrh61P0@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZpUaMwZoKnrh61P0@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/07/2024 1:46 pm, Anthony PERARD wrote:
> On Sat, Jul 13, 2024 at 07:09:52PM +0100, Andrew Cooper wrote:
>> We only need a basic perl environment, not the things that a primarily-perl
>> project would want.
>>
>> Discovered during the Fedora refresh where the difference is ~40M, but it's
>> more modest for OpenSUSE and Ubuntu.
> "perl-base" on Ubuntu is quite different from "perl-base" on OpenSUSE
> Leap. I haven't check Tumbleweed but is probably the same as Leap.

/sigh - because that would have been too easy.

> So, I think these would deserve to be in separated patches.
>
> On Ubuntu, installing "perl" or "perl-base" or none of them makes no
> difference. We install "build-essentials" which pulls "dpkg-dev" which
> pulls "perl", so we don't test properly if "perl-base" is enough or if
> we need more.

Fine - lets leave the Ubuntu's alone.

>
> I tried to find out which Perl module we would need, and I've got this
> list:
>
> - get_maintainer
>     Getopt::Long;
> - add_maintainer
>     Getopt::Long;
>     File::Basename;
>     List::MoreUtils;
>     IO::Handle;
> - stubdom/vtpmmgr:
>     Digest::SHA qw(sha1);
>     Math::BigInt only => 'GMP';
> - kconfig
>     Getopt::Long;
> - ocaml/lib/xc/abi-check
>     Data::Dumper;
> - docs/gen-html-index
>     Getopt::Long;
>     IO::File;
>     File::Basename;
> - docs/xen-headers
>     Getopt::Long;
>     File::Find;
>     IO::File;
> (there's also tools/examples/xeninfo.pl, I dont't if that can still work
> or if we need to purge it)

Ewww.

my %xenhosts = ("192.0.2.10" => {"port" => "9363"}, ...

is enough to demonstrate it's a special purpose script.

That file isn't referenced by the Makefile, nor is anything in the vnc/
dir, so we should purge the lot.

>
> Then I've got whatever module is in "perl-base" pkg.
>
> For Leap's perl-base:
>     getopt:long
>     file:basename
>     io:handle
>     io:file
>     file:find
>     data:dumper
>     digest:sha
> So, add_maintainer.pl and the script in stubdom/vtpmmgr won't work. So
> that's probably fine for Leap.

vtpmmgr isn't built by default, so gets 0 testing in CI.  I don't expect
people to be using add_maintainer inside the containers either.

>
> For Ubuntu 22.04 (not check others, but likely about the same)
> there's more packages:
>     perl-base
>         getopt::long
>         file:basename
>         io:handle
>         io:file
>     perl-modules-5.34
>         file:find
>         math:bigint
>     libperl5.34
>         data:dumper
>         digest:sha
>     liblist-moreutils-perl
>         list:MoreUtils
>     librpc-xml-perl
>         rpc:xml
> ("perl" pkg pulls "perl-modules-5.34" and "libperl5.34")
>
> So with just "perl-base", the ocaml's abi-check wouldn't work, as well
> as the docs's script (probably ok for "docs" if we don't use containers
> to build them).

Hmm yeah - we wouldn't want to break that.

>  Also add_maintainer and stubdom/vtpmmgr like for Leap.
>
>
> So I would suggest to not touch the Ubuntu containers, make the change
> to the OpenSUSE one and maybe add the limitation to the commit message.

Ok - I'll do this.

~Andrew

