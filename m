Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC87A84C89
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 21:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946197.1344177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2x7r-0001LM-7J; Thu, 10 Apr 2025 18:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946197.1344177; Thu, 10 Apr 2025 18:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2x7r-0001Ju-4U; Thu, 10 Apr 2025 18:59:47 +0000
Received: by outflank-mailman (input) for mailman id 946197;
 Thu, 10 Apr 2025 18:59:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2x7p-0001Jo-T2
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 18:59:45 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f726a27d-163d-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 20:59:44 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso9484755e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 11:59:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f204c500bsm66883355e9.0.2025.04.10.11.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 11:59:42 -0700 (PDT)
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
X-Inumbo-ID: f726a27d-163d-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744311584; x=1744916384; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wQFn/bZ7We0+gOiwz9xFYjVKkQ7zgXXKZZVwZKoJ/v8=;
        b=gybLDCdHNw1W+vAXJh9/wlEGdRvAnOISxVqDn1Y6/ESQKk46ZEaSJzwtdIZkY71/3Q
         5R1TynCmhJs3UrM9YAQPmUlZkDNPCsxUXC2ffFy2TFba321/fh1BiZ7FRsw8X2yC1iXi
         TERdAZG7iL4gNHn5EZvVEgOV6pQrkRNK89qVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311584; x=1744916384;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQFn/bZ7We0+gOiwz9xFYjVKkQ7zgXXKZZVwZKoJ/v8=;
        b=AygVQMRBHCZuuDTI3EA/1IG1uPtuf+sa6qn1dS7wZij00C/xjvWKUxsk4Squ82vKTK
         qJkeraxW42jaNHiF2tdsT7jym+iUiNEJK/m97TDvXKdnWa9gMPgPLeB7iU41h5ptTwU2
         8qgSc8nS3XBKU3U7/GlVD/C54J9uLhLrGIpDtvyhWJG4Q6x86olzt+G/0DRNMRfb7ps2
         Y5z+fQUEcJ2JQefks0r2NEhNXrPHovL28UMuQCXn8nxnVt99rys6oEE+QWRHLPO970H/
         qbKbjm+2fzKXBTe0b56hhkXetvCbU70TEpvgNlKCI/j1qhnad6V9GhJeNiH3n8AliVZR
         Nx9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJWlh4gJ9pndxzzfhfTzCkCdBR2Izna490NxLGkSCCW7J5PZTuFaKR+zFI2k5DY4bQy7EBuf9pZVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycarOcsE78g3891dOUujfh4CyqGtSf0amVSguH45XsMMYPCHeM
	LdnLKe0VWS2npN/e6v4K+IO92eG26regvQ4RPndcC5LuIzDk2s0MYusFk/wPi44=
X-Gm-Gg: ASbGnct4HYXziEl62qtNX40Fg8RB1nsHBnqyDsrZS1pCNZvzrZ7/l7UdtTJSPsrHG4Q
	3Ns+8DfY4aCd8+bRsmaIME7xprQuXEgvhM3UARNZFQLakWvCWLyQ5MzPijRjSvY63Ht8Rkg3e5r
	wDv+DWYHCcydAj3lLh2BOofwQLVZ5UlB7WwOzCw9YCxDo0QBz2NslJct6GV3hp4jDBnOL58Dy34
	/Wgqma6HPo4mKxyMgQvq9HofENn0xirvJDMIBLITuE2+iXTrC215Sk1kL9SNDO1upCi0GLvwvn/
	fgoWTvQ5iu+4x9JGXJh45RVY029MSQqhmQzQ8Q8YAtIIMZFIaBKH68XFhAoULgVnDrGZrif0D5U
	iKE4igDfFrEGyzC6E
X-Google-Smtp-Source: AGHT+IF6rF+zWuzwBR2I8XYmQLh+v6mUPC5zIf9oaO/D9J2QvBR+0yg6H5hD8BQlGbiFDrO4aU19BQ==
X-Received: by 2002:a5d:5f4e:0:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39d8f4e2a1dmr3158916f8f.41.1744311583862;
        Thu, 10 Apr 2025 11:59:43 -0700 (PDT)
Message-ID: <ad921a74-8d18-4462-96e9-9ac5930281ea@citrix.com>
Date: Thu, 10 Apr 2025 19:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS] Fix adduser --shell path
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250410155531.29570-1-anthony.perard@vates.tech>
 <6046d30b-b5ca-4867-9f24-831b469d1ee3@citrix.com> <Z_f0BO6oncTMKtrQ@l14>
 <718ee844-64b6-4146-a0fd-0ff7042ce737@citrix.com> <Z_f9Zjx0jSxVR6jC@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z_f9Zjx0jSxVR6jC@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 6:18 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Apr 10, 2025 at 05:57:23PM +0100, Andrew Cooper wrote:
>> On 10/04/2025 5:38 pm, Anthony PERARD wrote:
>>> And by the way, you might want to add `gawk` as
>>> well to replace busybox's awk, to make the linux build a bit more happy,
>>> even if it doesn't seems to be an issue right now.
>> That awk complaint appears to go away with find/diffutils in the
>> container.  I've not figured out exactly why yet.
> See my earlier email, I've seen it still there at least in one job.
>

I've found it again.

+ make modules_prepare
  SYNC    include/config/auto.conf
  GEN     arch/x86/include/generated/asm/orc_hash.h
awk: bad regex '^struct orc_entry {$': Invalid contents of {}
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h

It's specific to modules_prepare, so only shows up when building argo.

~Andrew

