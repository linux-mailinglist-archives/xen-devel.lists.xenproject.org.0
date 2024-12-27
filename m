Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECA9FD292
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2024 10:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863402.1274819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6fX-0002ms-CN; Fri, 27 Dec 2024 09:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863402.1274819; Fri, 27 Dec 2024 09:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tR6fX-0002jw-9N; Fri, 27 Dec 2024 09:30:07 +0000
Received: by outflank-mailman (input) for mailman id 863402;
 Fri, 27 Dec 2024 09:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tR6fW-0002ez-AW
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2024 09:30:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 270dd5e8-c435-11ef-99a3-01e77a169b0f;
 Fri, 27 Dec 2024 10:30:04 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso70667305e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2024 01:30:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219a71sm257987925e9.26.2024.12.27.01.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Dec 2024 01:30:02 -0800 (PST)
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
X-Inumbo-ID: 270dd5e8-c435-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735291803; x=1735896603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00WtuGiAjqszGQrq1V2bI3imru/l+J6htk/nOF9E2aw=;
        b=VHGqtXGYdiftfv01Kb6BNvGdLnRdt1kFOe7DDR5P0tOT4GcO5zYMWcGK4+sCqd6uvc
         3CCyAqmYy6tOK9TExOpIY5n80vMASWd7ZgCOFavnu3JeTM8liko/0xcODgha8obI6npN
         147z2oeYYsuPVo1T2En01k9L+QT6QGH0WnbZvwaoV/H4F0K6Qt+AJCLcK85/AWV5wsMY
         buQtUsZiJV9PjburYLpkvmY/XuCqKUMZZ1zoK3NPnkzF1W69r5wfJV9usozsJ4dxkRVL
         neTnq9o+Nwgv6oQSkDklWOu1FERzGK4ZWVx5B8QfjQAkEIlGgCghyhvsZ6uBY81ngqG3
         mvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735291803; x=1735896603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00WtuGiAjqszGQrq1V2bI3imru/l+J6htk/nOF9E2aw=;
        b=YpH1EH+Fr260ZBQJNkbZ1rMmvLNYC2Hk1gfML66ZkNFjnDWPc/j7JPf/btY3dOdUTC
         nwnqLHkvT4/UAwhu49Mx0OqSZNWih+AJQKD2N41oy7+3u8i3xLa7dsMVv5SWWR5xx34Q
         SbARvWOa+NMc2ASusbrsHL5tiTvJCjfZs71SOcleZOboQW5sQDRW40hoq08eBuDeKYkj
         qM0RnWHZMWUevO4EozqmVP6IYxfxz6fyAO+FyX7L5WYB8fAp2QuYuGxjBRkpSlRHMDxI
         FQx83kuDC9unRYX23qX3pH8KChBqjcsTNo2PfWx58jChKkd1lVDCir947sifiKchyCM2
         hU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVK7ZhEdwzr9mZsX457jiPd5Q4Hsj3iYzSF9v1cRD2EcrFUg137SWo+EQIREVj8bLgI41NwNfRLrZ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF0W1We1cKd/k0Kg/QKbLCDT4huGqFPINqn4FhReAenuAEMP6/
	Uj8Zlkg/+VVa2RxrR6cjQjNBsIWXMRrIJbkf/LrQ8PhxoY+SDbG1RaN8v/Rnbg==
X-Gm-Gg: ASbGncvWigRb1bFwQ8pgSnBhQJ43YmzMPOVDstd7VNAoF5eG6z196dMJyXCswWxEYbm
	JJDsQpbmNe0A24alvLtydIATGbCSTQoL/BNwfJ9k+e4zFfhrG3BQdhgOQcnwPkwHM+cxNDlLzkd
	ue83ZfVa++BmQCYLBbj+ezuzKP8gGNp0zP1apHg/+xUmnqQgoXD0sl+j1EI4RP2lmowfDbsfjR/
	e2dneq49Ou7s5cpC3f2UR1MPrnx7IGhU6mdrSqrgUF40EyT2v67t3GfCDBI4q+ytJqhMl8e4QYm
	Sq3KI9Ifv4MQluVzXTK70Vh5f/LOzj2jJ4Kobs0Ffg==
X-Google-Smtp-Source: AGHT+IEtZH4RUW59/GVQHHwhJhDiaBLwj1Elb048br2TV/p/6h1HTuWrtOhim9LxAVAs16vjMS20kQ==
X-Received: by 2002:a05:6000:186d:b0:386:1cd3:8a08 with SMTP id ffacd0b85a97d-38a221ed256mr24990055f8f.5.1735291803347;
        Fri, 27 Dec 2024 01:30:03 -0800 (PST)
Message-ID: <fd4ab455-9bbb-418e-8f55-2c0256ebca5c@suse.com>
Date: Fri, 27 Dec 2024 10:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/tools: remove dead code
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
References: <20241220165837.937976-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241224191529.138119-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241224191529.138119-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Language: en-US
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
In-Reply-To: <20241224191529.138119-3-Ariel.Otilibili-Anieli@eurecom.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2024 20:13, Ariel Otilibili wrote:
> The original file was imported from Linux; patched the entire
> expr_compare_type() with the diff from Linux.

I'm afraid that it's quite likely that taking changes to just an isolated
function will not work very well. What's worse, ...

> Commits wherein it might have been fixed in Linux:
> - dfe8e56fc604 ("kconfig: add fallthrough comments to expr_compare_type()")
> - 9ad86d747c46 ("kconfig: remove unreachable printf()").

... these references to Linux commits then don't really help, as the isolated
changes may have different effects, and hence ...

> ```
> $ diff -u xen/xen/tools/kconfig/expr.c linux/scripts/kconfig/expr.c | \
>     sed -ne '/expr_compare_type/,/return 0/{N;p}'
> 
>  static int expr_compare_type(enum expr_type t1, enum expr_type t2)
>  {
>         if (t1 == t2)
> @@ -1106,30 +999,27 @@
>         case E_GTH:
>                 if (t2 == E_EQUAL || t2 == E_UNEQUAL)
>                         return 1;
> +               /* fallthrough */
>         case E_EQUAL:
>         case E_UNEQUAL:
>                 if (t2 == E_NOT)
>                         return 1;
> +               /* fallthrough */
>         case E_NOT:
>                 if (t2 == E_AND)
>                         return 1;
> +               /* fallthrough */
>         case E_AND:
>                 if (t2 == E_OR)
>                         return 1;
> -       case E_OR:
> -               if (t2 == E_LIST)
> -                       return 1;
> -       case E_LIST:
> -               if (t2 == 0)
> -                       return 1;
> +               /* fallthrough */
>         default:
> -               return -1;
> +               break;
>         }
> -       printf("[%dgt%d?]", t1, t2);
>         return 0;
>  }
> 
> $ cd linux/;
> $ git log --oneline -1 --pretty='%h ("%s")'
> 8155b4ef3466 ("Add linux-next specific files for 20241220")
> 
> $ git remote -v
> next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (fetch)
> next    git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git (push)
> 
> $ cd ../xen/
> $ git log --oneline -1 --pretty='%h ("%s")'
> 6419020270 ("CHANGELOG: Mention LLC coloring feature on Arm")
> 
> $ git remote -v
> up      git://xenbits.xen.org/xen.git (fetch)
> up      git://xenbits.xen.org/xen.git (push)
> ```
> 
> Coverity-ID: 1458052
> Fixes: 8c271b7584 ("build: import Kbuild/Kconfig from Linux 4.3")
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

... an actual description of the (effect of the) changes done _here_ is missing.
For example, ....

> --- a/xen/tools/kconfig/expr.c
> +++ b/xen/tools/kconfig/expr.c
> @@ -1106,26 +1106,23 @@ static int expr_compare_type(enum expr_type t1, enum expr_type t2)
>  	case E_GTH:
>  		if (t2 == E_EQUAL || t2 == E_UNEQUAL)
>  			return 1;
> +		/* fallthrough */
>  	case E_EQUAL:
>  	case E_UNEQUAL:
>  		if (t2 == E_NOT)
>  			return 1;
> +		/* fallthrough */
>  	case E_NOT:
>  		if (t2 == E_AND)
>  			return 1;
> +		/* fallthrough */
>  	case E_AND:
>  		if (t2 == E_OR)
>  			return 1;
> -	case E_OR:
> -		if (t2 == E_LIST)
> -			return 1;
> -	case E_LIST:
> -		if (t2 == 0)
> -			return 1;
> +		/* fallthrough */

... it's unclear to me why removing handling of E_OR and E_LIST is actually correct.

All of this said - this looks like a wording issue: You did actually take two full
commits (adding in - see below - at least one change of your own). May I suggest
that you take those commits individually, retaining their titles and descriptions,
merely adding necessary further tags (Origin: and your own S-o-b)?

>  	default:
> -		return -1;
> +		break;

This change isn't part of either of the mentioned commits.

>  	}
> -	printf("[%dgt%d?]", t1, t2);
>  	return 0;
>  }

The "Suggested-by:" also isn't quite right imo. If anything what I suggested was
to take commits from Linux. But that's whole commits, not fragments thereof, nor
multiple of them folded (unless there's a good reason to do so). And for such
straight importing I don't think "Suggested-by:" would be quite applicable.

Jan

