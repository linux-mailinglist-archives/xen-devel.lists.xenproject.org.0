Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 175369BE4C2
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 11:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830690.1245766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8dc9-00056c-Vd; Wed, 06 Nov 2024 10:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830690.1245766; Wed, 06 Nov 2024 10:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8dc9-00054M-RK; Wed, 06 Nov 2024 10:50:17 +0000
Received: by outflank-mailman (input) for mailman id 830690;
 Wed, 06 Nov 2024 10:50:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wNbQ=SB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t8dc8-00054G-KZ
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 10:50:16 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e51e4471-9c2c-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 11:50:10 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso4735165a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 02:50:10 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17d7066sm259364466b.130.2024.11.06.02.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 02:50:09 -0800 (PST)
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
X-Inumbo-ID: e51e4471-9c2c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzMiLCJoZWxvIjoibWFpbC1lZDEteDUzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImU1MWU0NDcxLTljMmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODkwMjEwLjk5MzQ3OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730890210; x=1731495010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BpmYD8zI9KYgnD49gZhc3IIpL9qdpxifRfnE9OfZrR0=;
        b=UCEuy30vChEHB0qEpFjRMzPZz4Ue58Eiuqg7GQUWs6moNsCln0OUiB3IZ2AsoDO0GV
         8H334TFmDUO53ECBA6glU+ROwKh30pcOhZvp68UFDo3OCZU6tbNGI/G96yQEM+4+TGhS
         spQX2LAfXCDDSnBsil45KPIBOUQwST0keCZFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730890210; x=1731495010;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpmYD8zI9KYgnD49gZhc3IIpL9qdpxifRfnE9OfZrR0=;
        b=bty4GDMVhER11JbVRlq0pB/8emU+gUFNAEpxjhqeDwCtKO+SRN+YwMqa3bITxEk+DV
         dZ3KI8gdp21JZd/FEP2TBOPvBOkF+q5yAwBRJhlTAuGXJhLH7ibOzeUOZSyAHq9khkXw
         9EldM4bgmxeOIdwvYEpCrA9uuoLZqtcDzfTt8lzKZR0XnI5ArlOUvTcTBLPcye3Xw8Kx
         JlnYzvKkpe251y3x7jelHrpE6xm1gadT1elr4Dtfc1WPRCwj9SPQEfgaMXdi4ux+cS8P
         kGYvLGqb9BOEsrindtkhUzQkHWwIsmxJx106v4Pbs3xz4TNuePXgsi/wx03TpJm+Mxlu
         +NKw==
X-Forwarded-Encrypted: i=1; AJvYcCXX0sKRz/4AN39x+Dsa+hWqwbWIhm9OBssDIanLlKjpSjFAvZ/25oWBsj10U1dXyvN+xGV9lnetYu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwhoRe5Oj+umCzDsifqsj39JdZ5f5hq7vYUHsyhqBbM/FUG1fH+
	WRnWk3AykxmHhuOTwl8oaCoXlG9qFXkKpRcnKDgTtmsH+Rp+9+xpOGqy7nYjH97vY8JUPPHszfd
	H
X-Google-Smtp-Source: AGHT+IF1v85yfmUrlhHdhsHOBp6ZHqzDk0O7eJhwt6fjVG/upnP4v2sBK2RnkIYHg5/56tEQs6F00w==
X-Received: by 2002:a17:907:9814:b0:a9a:294:cb30 with SMTP id a640c23a62f3a-a9e508df7cbmr2229332666b.16.1730890210378;
        Wed, 06 Nov 2024 02:50:10 -0800 (PST)
Message-ID: <8f329495-8dd5-4f57-a730-9520c93b7c1f@citrix.com>
Date: Wed, 6 Nov 2024 10:50:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <89022703-f814-4d81-87ec-5651f5e950c4@citrix.com>
 <D5F0ZMVQEIKF.2I3XTFQGPPA3M@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D5F0ZMVQEIKF.2I3XTFQGPPA3M@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/11/2024 10:32 am, Alejandro Vallejo wrote:
> On Tue Nov 5, 2024 at 7:23 PM GMT, Andrew Cooper wrote:
>> On 05/11/2024 2:55 pm, Frediano Ziglio wrote:
>>> diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
>>> index 447c0d3bdb..79ae8900b1 100755
>>> --- a/xen/tools/combine_two_binaries.py
>>> +++ b/xen/tools/combine_two_binaries.py
>>> @@ -67,13 +67,22 @@ if args.exports is not None:
>>>  
>>>  # Parse mapfile, look for ther symbols we want to export.
>>>  if args.mapfile is not None:
>>> -    symbol_re = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
>>> +    symbol_re_clang = \
>>> +        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s{15,}(\S+)\n')
>>> +    symbol_re_gnu = re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
>> These are specific to the linker, not the compiler, so really should be
>> _ld and _lld rather than _gnu and _clang.
> GNU binutils ships not one, but two linkers.

Yes that's technically true.

But while only one of them is remotely capable of linking a kernel, it's
also not very relevant.

Neither Gold, or indeed Mold which you mention too, are liable to be LD
within Xen for the foreseeable future.

~Andrew

