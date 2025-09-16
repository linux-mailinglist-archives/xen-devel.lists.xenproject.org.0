Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DEDB5991B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 16:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124678.1466932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWR3-0004fc-Pj; Tue, 16 Sep 2025 14:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124678.1466932; Tue, 16 Sep 2025 14:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWR3-0004dS-MX; Tue, 16 Sep 2025 14:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1124678;
 Tue, 16 Sep 2025 14:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyWR2-0004dM-Th
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 14:13:32 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eed9576-9307-11f0-9d13-b5c5bf9af7f9;
 Tue, 16 Sep 2025 16:13:24 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ea115556b2so1659704f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 07:13:24 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a6986esm16299286b3a.43.2025.09.16.07.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 07:13:23 -0700 (PDT)
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
X-Inumbo-ID: 4eed9576-9307-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758032004; x=1758636804; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5icLOJ4TvSuMnp6Gzb0gOFoCfk+0MLOxBayTmD4t3ts=;
        b=SlxqLdYbCQK3o/KgJdNEYtcERBWJqQFOSrQnlxjN15dEPk8ag7bU/enD69oxTRnBss
         8Eqc5qCaviKBWLoNEhN4Iqxlz5nNKsnezeA4ID963BxjHkeFGhTBA9rdFwHhkfhiz5y8
         wxdlipjQyKyDi4yc9hiJp1y/C1tXX0Q7HO1fBpkau9FELFAXl4g/Uqz5RDr7PelAfX1x
         8V6xRhRk9zoxaF13vIQiBnXacrE+ySxi0OB58TVdylZiL1ly7Trwi7oH4G/wF9FVgS3c
         nFyPoVmemVNbBYilXWHUD5NuVybmIYhhbO3umK/Lj+fsqtj2qIZStUBrA0ooLNEdoInH
         7iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032004; x=1758636804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5icLOJ4TvSuMnp6Gzb0gOFoCfk+0MLOxBayTmD4t3ts=;
        b=coo0aUXcXf0dyGVzESp65EezgpAAcV/ODqytZ5lyBS6DVmpJqUAUgJsTpXOPHWvUJI
         08KyoJgSz7Ra9W649/sLXaN4JBoHxSGuXL2Dra6Jsf52+B0squ6euSB2NSrlYX4RKIfZ
         Rqm//n2lm0o3ovtkUQxdtGuuVTOBMIOFJnHWp4p54VCzWnRVHlVqJfxRXxnUANmyiPVk
         jKvqV8CNw4DSXxJvjxmobKw51yg780LT2l92VZ4srILq/P/H5szrRCNciXn5Z548Mm7A
         UK1jVpSo2S8RjSyorpDIYcIo8a5dbrA6uqXT5oNpRK9W4XIdv/BRFK+gWrr3KhiCIXhB
         QEfg==
X-Gm-Message-State: AOJu0Yy5whtAWtXviJ9bR2VUOzRoOSPN+ow0u4zrGXuZXvFheG0qkLzT
	MRmhGbc1kCHKiI0/4aIXMDZVppEITdlqsfaMUrYOJiN8dIOB1m1tSPb+HuwiQW0qMg==
X-Gm-Gg: ASbGncsgWcolh31L0VKWiwAyosuXuih+SvRRQ0NnOf4KyP8a34mpBgrUMGxB7SxFg2e
	zE0TwsZhMNtp/M9zGQmnIQAsF5B0D4SE4obKb3r7lsQuYCwbXK/4tJZYnjlY1wYakGQV/9J0DpJ
	anSuQoJsOZwUA9Jd0GUhUCbxzlgHex0lbIGAccGdASo1RIqu8CRjKP7+EcfO2KEqphPDdM3wOms
	J4Yv4mH/ia5nnJ5EJhS/bCQZ6hkCzg4LBMQRDt6Gi/JFQGYzKNmqkx+Snph+6Vlm9QpN+Ulnbtg
	ZhBUPsiQM/oYVYmH5vefftu4pggdW7L6dys606PXq5VlaYLaVCluGCbXmNj/J1h7+eECZsgBW6E
	RafhPxXzeZGP6CcmcV2Z4cSvH8dOO8VQ=
X-Google-Smtp-Source: AGHT+IGA57tdXQt1exHQ/NZDUUV3HE04ebZas3OlqG2i30tO8dvUGIsz4ya/YjnsDZeLJDpGYQJyAw==
X-Received: by 2002:a05:6000:40cb:b0:3ec:c50c:7164 with SMTP id ffacd0b85a97d-3ecc50c7871mr2287413f8f.15.1758032004073;
        Tue, 16 Sep 2025 07:13:24 -0700 (PDT)
Message-ID: <8e2ee71c-62fa-4398-802f-1774242f4df2@suse.com>
Date: Tue, 16 Sep 2025 16:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/16] emul/ns16x50: implement MCR/MSR registers
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com,
 dmukhin@xen.org
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-9-dmukhin@ford.com>
 <CAGeoDV8iL374T7n=f_AQTA5VPfKThcEq-fN4X3kzWLzbjCzjew@mail.gmail.com>
 <9d55721e-bd95-4354-b839-f8896eedab24@suse.com>
 <CAGeoDV-wzvRe=jmeKdr7=ectxiUVViLm_n4GvKdiCoFTwyoRrQ@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAGeoDV-wzvRe=jmeKdr7=ectxiUVViLm_n4GvKdiCoFTwyoRrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2025 10:00, Mykola Kvach wrote:
> Hi Jan,
> 
> On Mon, Sep 15, 2025 at 5:49 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.09.2025 08:00, Mykola Kvach wrote:
>>> On Tue, Sep 9, 2025 at 12:12 AM <dmukhin@xen.org> wrote:
>>>> --- a/xen/common/emul/vuart/ns16x50.c
>>>> +++ b/xen/common/emul/vuart/ns16x50.c
>>>> @@ -107,7 +107,7 @@ static bool cf_check ns16x50_iir_check_thr(const struct vuart_ns16x50 *vdev)
>>>>
>>>>  static bool cf_check ns16x50_iir_check_msi(const struct vuart_ns16x50 *vdev)
>>>>  {
>>>> -    return false;
>>>> +    return vdev->regs[UART_MSR] & UART_MSR_CHANGE;
>>>>  }
>>>>
>>>>  /*
>>>> @@ -232,12 +232,63 @@ static int ns16x50_io_write8(
>>>>              regs[UART_LCR] = val;
>>>>              break;
>>>>
>>>> +        case UART_MCR: {
>>>
>>> Probably the opening brace should be moved to the next line.
>>> See CODING_STYLE:
>>>
>>> Braces ('{' and '}') are usually placed on a line of their own, except
>>> for:
>>>
>>> - the do/while loop
>>> - the opening brace in definitions of enum, struct, and union
>>> - the opening brace in initializers
>>> - compound literals
>>
> 
> Thanks for clarifying.
> 
>> strictly by the wording of the doc you're right, yet if you go look then
>> you'll see that we really permit both forms (and apparently prefer the
>> one used here).
> 
> I just want to make sure I understand the expectation correctly.
> The CODING_STYLE document has wording about brace placement, but as
> you noted, the actual code in this subsystem uses both styles, and the
> one used here seems to be preferred in practice.
> 
> To get a better sense, I did a quick search in the repository. The
> pattern with the brace on the next line after case appears roughly
> 340 times, while the variant with the brace on the same line as case
> appears about 75 times. So overall the first form seems to be much
> more common.
> 
> That makes me think the choice here is more a matter of maintainer
> preference than a global convention. My main concern is consistency:
> if in one place both forms are accepted, but in another case reviewers
> point back to the document and ask for strict compliance, it could
> create confusion for contributors.
> 
> I'm fine if Denis leaves it as is. I just wanted to note the
> misalignment with the CODING_STYLE doc.

Yes, the situation with ./CODING_STYLE is suboptimal. Yet trying to get
in changes to that file also has proven difficult.

As to the brace placement in case block: Please realize that this is
also special because of the case labels indented as much as switch()
statement's opening figure brace. While nothing can be done for the
closing braces (i.e. there being successive ones with the same
indentation), the opening ones have this alternative placement as an
option.

What we could consider is to allow omitting the braces altogether in
case blocks. That comes with its own downsides, but we may want to
weigh things as to what's deemed worse.

Jan

