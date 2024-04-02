Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE62F894F07
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 11:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700073.1092651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rralc-0008Nr-Af; Tue, 02 Apr 2024 09:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700073.1092651; Tue, 02 Apr 2024 09:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rralc-0008L5-84; Tue, 02 Apr 2024 09:49:20 +0000
Received: by outflank-mailman (input) for mailman id 700073;
 Tue, 02 Apr 2024 09:49:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrala-0008Kz-GU
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 09:49:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45614a9b-f0d6-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 11:49:17 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41569f1896dso9611655e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 02:49:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c351100b00414854cd257sm17317950wmq.20.2024.04.02.02.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 02:49:16 -0700 (PDT)
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
X-Inumbo-ID: 45614a9b-f0d6-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712051357; x=1712656157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7IqR5YWRvrR8kDc3STvHqfVm8cwbEoxdZmlHAHht5U=;
        b=dBzxNAoQfJ1RUuwUEx88FvDnsfJTQdgcIXRATry2DksFXTnOZ/+GEAwBJZ5hiVVKVw
         iAgI+n7pTNSB5hvRtEbEANz8MCD/HArL0RtRkqSdmt6l9xM6q/Ll3RxhCVZXKBmnC3HL
         972kqEXeXK79yPskgUs3iyAhe9/m00nUXIfB4+e+5wFKy+U9wByvl+wyFcle73Keu5dx
         8h8ZM7YYrldZu9I+ixr21JbdDO7Hhlj+QH/0kJSM2htpT6HVaP3cAb31aPzXlJhskaY/
         5ULQ40dmPe1yfbfum1uZcBJ+eZuuOgvL9gm5UGLlJQ47Y31EG/1jyccXK3QRFSXITJn3
         KFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712051357; x=1712656157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7IqR5YWRvrR8kDc3STvHqfVm8cwbEoxdZmlHAHht5U=;
        b=hdyHy/ocNOwPFG31Lbsl3fhz6dDrvVYZZDduFk0BiE8w+xYps5lN/4pCYjgarCI7Eo
         qXvJXLpEXdnFKbRaZWjkL+/XXDxHIBnkEUq5kggr+XrJwnEIJsdnRg/OWUHOmatCWDmY
         D8imfpfXLi6SxQgdN5WZmJ1v2TBry3gwtMq6n6NuYiCioomTn2meLcoE8oChg+QK8YE7
         G3aF8GCk2tSIMgOHwmIAC4e7IAxtI2DCFWkWdIOXXV4f+9Z44GGJGT0kiT+Esv0V5iFt
         B5dIDhBbthp2V51SNz9GVZBAQRTyF7jfIL3wwUKHeL0fBdgXCv7ftEyrIyU7tsbk9v5V
         O31g==
X-Forwarded-Encrypted: i=1; AJvYcCWKOrDl24BZVZU+zJVsXC4yEm31YLOg22gayxrtxdWRSkhz6IoKwbpCetjBkT/53+asyFaeazWX3O6fMpc3BCFa1uBzDU9PHFbgfyIaWVw=
X-Gm-Message-State: AOJu0YxU6KhElscTR2hgTUWr5H3D4xlMrc22FTeA6oA26RkxPyTwdOXc
	J+vZifu51GLDSzpIzppZwnS1sAAB0nyrQBA/yvkECRSEAt4/OFRNnErc7WFMIg==
X-Google-Smtp-Source: AGHT+IE3jgYLV5ejelrHmvQuQVgEY7ms6iHG/kI266iBD1uyCjsYzFikBo/1VpaAUA+3hJ8V+ko1xg==
X-Received: by 2002:a05:600c:a01:b0:414:1363:53a4 with SMTP id z1-20020a05600c0a0100b00414136353a4mr8273628wmp.15.1712051356835;
        Tue, 02 Apr 2024 02:49:16 -0700 (PDT)
Message-ID: <87601c5e-2ee3-4d3f-b4eb-0f509bcf1c2b@suse.com>
Date: Tue, 2 Apr 2024 11:49:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240328153523.4155-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.03.2024 16:35, Roger Pau Monne wrote:
> There's no reason to assume VGA text mode 3 to be unconditionally available.
> With the addition of booting Xen itself in PVH mode there's a boot path that
> explicitly short-circuits all the real-mode logic, including the VGA detection.
> 
> Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
> not populate boot_vid_info with any default settings.  It will either be
> populated by the real-mode video detection code, or left zeroed in case
> real-mode code is skipped.
> 
> Note that only PVH skips the real-mode portion of the boot trampoline,
> otherwise the only way to skip it is to set `no-real-mode` on the command line,
> and the description for the option already notes that VGA would be disabled as
> a result of skipping real-mode bootstrap.
> 
> This fixes Xen incorrectly reporting:
> 
> (XEN) Video information:
> (XEN)  VGA is text mode 80x25, font 8x16
> 
> When booted as a PVH guest.

And what effect does this have on a bare-metal boot with no-real-mode in use?
The default on x86 hardware still is that in the absence of other information,
a VGA of some kind can be assumed to be there. Yes, there are headless
systems, but better assume VGA is there when there's not than the other way
around.

What I would have expected is for the PVH boot path to clear boot_vid_info.

Jan

