Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279EE9F50F8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859416.1271551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaPE-0007dU-ER; Tue, 17 Dec 2024 16:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859416.1271551; Tue, 17 Dec 2024 16:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaPE-0007bo-Am; Tue, 17 Dec 2024 16:26:44 +0000
Received: by outflank-mailman (input) for mailman id 859416;
 Tue, 17 Dec 2024 16:26:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92kI=TK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNaPC-0007bh-NJ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:26:42 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b28e39f9-bc93-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:26:41 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso2752524f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:26:41 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c8060862sm11410366f8f.100.2024.12.17.08.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:26:40 -0800 (PST)
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
X-Inumbo-ID: b28e39f9-bc93-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734452801; x=1735057601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=98J1ocuFRVQqxhJV1M2ul5KYu5m3q4S/ZBRYRLDAgtk=;
        b=Z+KrJSVmy8fY6nWRczhGTR1e3dtRka5n4Bbp3STmNAIAlzP0mnU6PiMNkcYdKJKC5k
         sAV5cfUzPb0RXK2y7sVYRNlQyftpYg0sCz3eYTXEM7dh9Geizd6Er2F/D2wCp5KgBcRn
         Mq1K+lH/ML8xz30DBMMCS6ZUCZI3hFmLmHpwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734452801; x=1735057601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98J1ocuFRVQqxhJV1M2ul5KYu5m3q4S/ZBRYRLDAgtk=;
        b=Bsc89yATB/F5inq+T8IWrRwb94ilZshRQEjvJ4yHZHy9IS8wzg4cXaAQWDhtSduolQ
         3ZP+p26fl3C2HDeYEvNeGpCy5i5hXw9WjtPrC70NeiJuM7CeTQNwXWnLWTDY172r1Ww6
         sxObJ0AI4ikqxR+HGWGrIV1KM1D+5qGOGiCv8IIH92UqqvS0PhG2KfeY4Z4ZeCrrC74u
         ny2l5v5T0MBaTN64AIsQ7kuhTJjxOwp7Qvs+FJxQJDTOepXTnWk7ArhKoqVuIuU9uyXG
         0yNC8sNkCkbsA6Iv00hZTpjGzGDMrARA0icb+bpshk+2yNVr4506iugHX+a93R8rS+9T
         oymA==
X-Forwarded-Encrypted: i=1; AJvYcCVFHlsoiZ88lRRXyegt6HmdxaQuT8O5tOYGLR63CKjho+hV82wJ5VrEKGVcQJWXBEHFTLZAiNxW+dc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwV5TDMq2qWtACbWzUuR6bIwQ77iE0B7xaQx8rBGSw1IMUp2La
	DgFQJ4FmEnjzM/Bh8LRW8uNJMXrtBkZkxUVUvrXQiulBBp0t958bUVLn7ZFHmaM=
X-Gm-Gg: ASbGncsqV11cBO4kbsMdKodoPxEX27xcGlLPFcGloRpULdhCOmmnU7RlALocKLDeFs2
	K2TsW3PASSlvDXNNHgA8euOxZYb+5lIRExYdi4vB/MpBdh6RR7iQa8oSiM1xckCxRe2rnMV0Zs6
	9iPw2nzkQ5FDhwNnQKgmqbWJhu+E6IOdSFO8xBvgjOKmHPyZigKjpgjUNTphQ1kfuS1Z0O4+UP8
	e/io+1a+fbZ4kpW1AhJHfkQcChyChy1ODYQZzSVJTAuOtSqx/k0GK7HVYN2phlyPZcK6hqmhJtN
	X3qOL/nwLNNAp5Bu3Hyz
X-Google-Smtp-Source: AGHT+IEjZuxpCJWJF0Ml1kPBCCd/P5QNTqV7/NFAihWpsTRNzbBhXLtnADPMoJm1GzoyBBXROFe58g==
X-Received: by 2002:a05:6000:4b15:b0:385:fab3:c56d with SMTP id ffacd0b85a97d-3886c72384dmr15366118f8f.0.1734452800947;
        Tue, 17 Dec 2024 08:26:40 -0800 (PST)
Message-ID: <fe201e59-beb0-4134-abbb-13a55a4ec987@citrix.com>
Date: Tue, 17 Dec 2024 16:26:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] tools, xen/scripts: clear out Python syntax
 warnings
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/12/2024 11:07 pm, Ariel Otilibili wrote:
> * since 3.12 invalid escape sequences generate SyntaxWarning
> * in the future, these invalid sequences will generate SyntaxError
> * therefore changed syntax to raw string notation.
>
> Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-changes
> Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new commands in menuentry")
> Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default entry in string format")
> Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
> Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppcheck version check")
>
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Luca Fancellu <luca.fancellu@arm.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

Having poked about a bit more, this is all a big mess, but these do now
work with Py3.12.

leading \ for non-special characters are ignored in [], which is why ...

> ---
>  tools/pygrub/src/GrubConf.py                  | 4 ++--
>  tools/pygrub/src/pygrub                       | 6 +++---
>  xen/scripts/xen_analysis/cppcheck_analysis.py | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
> index 580c9628ca..904e7d5567 100644
> --- a/tools/pygrub/src/GrubConf.py
> +++ b/tools/pygrub/src/GrubConf.py
> @@ -320,7 +320,7 @@ class GrubConfigFile(_GrubConfigFile):
>  def grub2_handle_set(arg):
>      (com,arg) = grub_split(arg,2)
>      com="set:" + com
> -    m = re.match("([\"\'])(.*)\\1", arg)
> +    m = re.match(r"([\"\'])(.*)\1", arg)

... the \' works here.

Anyway, I've checked the others and they seem to work, so I suggest
taking this roughly this form.

Some notes about the commit message.  The subject ought to be:

tools: Fix syntax warnings with Python 3.12

The text should be a regular paragraph, rather than bullet points like this.

I can fix this all on commit if you're happy.

~Andrew

