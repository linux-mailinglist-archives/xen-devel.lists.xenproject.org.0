Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF57F9C0405
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 12:30:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831694.1247044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90iZ-0007kV-6L; Thu, 07 Nov 2024 11:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831694.1247044; Thu, 07 Nov 2024 11:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t90iZ-0007i2-3K; Thu, 07 Nov 2024 11:30:27 +0000
Received: by outflank-mailman (input) for mailman id 831694;
 Thu, 07 Nov 2024 11:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t90iX-0007hw-Qb
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 11:30:25 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abcea415-9cfb-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 12:30:20 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso134239866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 03:30:20 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18539sm82028966b.27.2024.11.07.03.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 03:30:16 -0800 (PST)
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
X-Inumbo-ID: abcea415-9cfb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFiY2VhNDE1LTljZmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTc5MDIwLjcyMzMxOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730979020; x=1731583820; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl/2YEe4eqHnPTHFiX33vww5QDimSXH6xE0JG7hHrE8=;
        b=lK39YlBvtTeOD58p1SrPgp/grLf1HyMJbJ/klUwa7zv2d0usNAqaUKu8+H20dOrDEd
         4eC5d9LjQGbePjFLaj9z9881AaeuSvFlkYDsoYBcJm4Wm0wNbGWgVz46yRYH17YicnRO
         oveZxIZ4X2hOyqruBQyENStIRU+bJW3PdSuUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979020; x=1731583820;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl/2YEe4eqHnPTHFiX33vww5QDimSXH6xE0JG7hHrE8=;
        b=PoBbpo/Gvo8I38wHbtYwEXRNw53MF1HFwfXm0eQgkzFl21q26uLhXrnsDGPFoFxkyl
         xrothq9nwC87VZ6DFU6PKWPLRTkUboo3KutCYGgcWPIgbxhecbtnOgJn2du2YIYQMan/
         u9j+2Pdb2Q4qpI8GAZwV3m/1SyVgibszMlrcPhedI2Y3RAZu4GCROAlElyufz9ZeXeTr
         MadaLFD9YEpZBf2yqtZzQE9knakDU8AZ3AgqgXpCzOuKE/8IaYh/geJl37tMZiKIVJn/
         SVNlUWJygrYhetDmH55yiBA8mrdktC8TUMv1+LHs9CDq+/i+KOQkKJ1SNM5qPBXULrgN
         tN2w==
X-Gm-Message-State: AOJu0YzdzHvi6f3/fnBmjVe0fwFrwzhlrf1J+boZ1VNYE7KGLuyY0tWH
	jXYGvrQmP2oZ4bP3ggn9nJm1GB14KLWB/G+1F2KkmHqxZi4tTNFeqovVe3exo2Q=
X-Google-Smtp-Source: AGHT+IF82/9lU5lvBRSURJvdRU8gEXJ3cQTtDlQJyzHea3Jf8woRGaXWLXj5obyA8odWFkdiuDcilA==
X-Received: by 2002:a17:906:c145:b0:a80:f840:9004 with SMTP id a640c23a62f3a-a9e6553bf86mr2389758166b.12.1730979018515;
        Thu, 07 Nov 2024 03:30:18 -0800 (PST)
Message-ID: <e81ae2da-383f-4cc7-8213-66f8ccc9b6e7@citrix.com>
Date: Thu, 7 Nov 2024 11:30:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/Kconfig: livepatch-build-tools requires debug
 information
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241107084927.37748-1-roger.pau@citrix.com>
 <66fd7b53-25f5-459b-8563-e33fccba90ef@citrix.com> <ZyyLAj6MZ3fvOFBC@macbook>
 <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <22c59035-67e3-4e43-bfe0-26675a93e9ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2024 9:48 am, Jan Beulich wrote:
> On 07.11.2024 10:40, Roger Pau Monné wrote:
>> On Thu, Nov 07, 2024 at 09:21:26AM +0000, Andrew Cooper wrote:
>>> On 07/11/2024 8:49 am, Roger Pau Monne wrote:
>>>> The tools infrastructure used to build livepatches for Xen
>>>> (livepatch-build-tools) consumes some DWARF debug information present in
>>>> xen-syms to generate a livepatch (see livepatch-build script usage of readelf
>>>> -wi).
>>>>
>>>> The current Kconfig defaults however will enable LIVEPATCH without DEBUG_INFO
>>>> on release builds, thus providing a default Kconfig selection that's not
>>>> suitable for livepatch-build-tools even when LIVEPATCH support is enabled,
>>>> because it's missing the DWARF debug section.
>>>>
>>>> Fix by forcing the selection of DEBUG_INFO from LIVEPATCH.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Oops, yes.
>>>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> Fixes tag ?
>> Was borderline on adding one, but wasn't sure since it's strictly
>> livepatch-build-tools that requires the DWARF data, but custom made
>> livepatches (like the examples in tests) do not require such
>> information.

Ok.  I guess it doesn't matter too much.

> At which point: Is "select" really appropriate then? Wouldn't it be more
> logical then to change DEBUG_INFO's default to take LIVEPATCH into account
> (still permitting people to turn debug info off if they know they won't
> need it)?

I am very disinterested in letting people who think they can do
livepatching without debug symbols shoot themselves in the foot like that.

It's only debugging symbols.   If people *really* think they know
better, they can strip them themselves.

~Andrew

