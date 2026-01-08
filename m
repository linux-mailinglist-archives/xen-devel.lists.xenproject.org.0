Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA741D03530
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 15:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197713.1515181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqwq-0005FU-1u; Thu, 08 Jan 2026 14:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197713.1515181; Thu, 08 Jan 2026 14:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdqwp-0005Db-Uy; Thu, 08 Jan 2026 14:25:11 +0000
Received: by outflank-mailman (input) for mailman id 1197713;
 Thu, 08 Jan 2026 14:25:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdqwn-0005DV-LK
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 14:25:09 +0000
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [2a00:1450:4864:20::443])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfe93bf6-ec9d-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 15:24:59 +0100 (CET)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so1515308f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 06:24:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5dfa07sm16603437f8f.25.2026.01.08.06.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 06:24:58 -0800 (PST)
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
X-Inumbo-ID: cfe93bf6-ec9d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767882298; x=1768487098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lxenG25Sep9s1lmghyEt7tktKrVN7RqvjnA7XCs8RFI=;
        b=epaPugnF/MCjIuiUoJlMTZ+F3OngEy/18TIBMob3wL8Ld/fXPLJZb2MqRRaQw1u/En
         SQXVZoOKP16j9EMJFcArqLeVNkiFPjdAO5b9QsdRLt6j58NNX6+0iI73AyOp3Gt4zmDQ
         DsLkmj4nDdhm+kI26iqYZHd41x9J+JwSZ3bBf7BASq75a50XvCjtsJCoYugQSomtM3Ei
         cBdoKODnkq8FAaNVugz+v9HkCdG9CM1PQYOH9J8uLesiFNuvCRopcKuidxsVrplSuarT
         n2GXLAqyK25Bm7Ujw4fLSVGaILHRDeYdp7ln245bFXs0a+yuFh0XBbJqkFEiGQcYrKlb
         W6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767882298; x=1768487098;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxenG25Sep9s1lmghyEt7tktKrVN7RqvjnA7XCs8RFI=;
        b=xUNT9215dRKDLnDR9syW00KjWHNSNAEtxcQtCs0jRr14LXadu7Rkbk9LOtJg4Npd6O
         mDE/Z4X+qiMePjDFoTpT7RXqQZhlfWcxekwSDMqUgH14gTsjxU+or9x78w75R6LN5Ipr
         CJ+uA3YnSncc2FvN+PNNs0PF2lyfUnOM36EmG1uim3XeUSWirBd/ICeDtrZXpVghpU2Z
         sKmZijBkohS1ZVOSRDgRqPL+dfdMUsTLzDT/dSPzlovRG2QLtBf5tDPk4WI6j8sZX7f4
         dR5KTfP6uDw0uzL6hKduTWTEKhYGWrbGlFMwgwl1DlBluZ3opDIxr7wnVK0W9moYDpu7
         vJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUb3XqvBjMta9ichv9a+K6NEA4rdGfOpvQhSvCdVAZXRyVXeEsAJzu5xXHYB9/TtnvpoE2J9G3w/Gg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaYqr8XuUJwz7HhP7a45pCklDnILbRRO2lIOn46cW9l6ZGwhhc
	ePUvoCn0Uu5apRTFxjfZGEP0N3MpAO7DqrzLssiTBBOHWohHcvZ50OUZ4NurMzeWrA==
X-Gm-Gg: AY/fxX5ESGaQIT4RQcvFIPzMHgE+RgkPNmJkBKRrj3C9zC+mHhuc79IaxE/xuq7McsL
	+WHR7prG2YWlsA5HSbmy8oJm0xl3QJ8928Jhop2MWy8o7OaKiBq6fvUrLhx6sb7eW6ETFC5VCT8
	8H1Rndxj5qQtO8NhEriOFtfA9MAQX7a3PYiuk8VFM7uJ+Nqdh1BdnoXP94khLP/XMaIB3BIEkP+
	L5zupx85ubwcMMtKxXsr2aq8o58Mb/v7/qySpk1y5g8c9OFrJipAM8eJD71uZa/+0SYI1WIloGW
	ffQC/l9lSaapDX5aVbnOTuCdsNwH2ishOHdWPf19kb6Uvb0GUcmJ3h7QcEApEItmEIDy1wKCXAa
	JiQ0pHIgx2EkF46yc2FSUx4YcT8n2y4L/V3mxWmZh9fVUj368vShXyQl4A4oaDN5QNtU/uGMso4
	3OoSWnQpz6NkQgxJTHATjryMPTXMTqG8WvIpeTQ+pqGlLGTjOViJaKCo5p7u7TevJG3fnkBY6da
	0vU74efGhx3bg==
X-Google-Smtp-Source: AGHT+IHjFmfo7XdS72gmM8i6sVdjfl03H1mC/tCRTOJEmgX93SItIop4BQJN3FFHRZddKoVBs+l5fQ==
X-Received: by 2002:a05:6000:4301:b0:430:f704:4ef with SMTP id ffacd0b85a97d-432c3776a9cmr7900650f8f.61.1767882298529;
        Thu, 08 Jan 2026 06:24:58 -0800 (PST)
Message-ID: <df81c33c-5d97-489f-a768-25cef8293921@suse.com>
Date: Thu, 8 Jan 2026 15:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] INSTALL: remove unsupported XEN_CONFIG_EXPERT from
 documentation
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260108141641.506534-2-dmukhin@ford.com>
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
In-Reply-To: <20260108141641.506534-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2026 15:16, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Amends: 37339ba9ef46 ("automation: Remove XEN_CONFIG_EXPERT leftovers")
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> --- a/INSTALL
> +++ b/INSTALL
> @@ -33,8 +33,8 @@ small subset of the options.  Attempts to change other options will be
>  silently overridden.  The only way to find which configuration options
>  are available is to run `make menuconfig' or the like.

... I don't think what is said up from here is quite right. As a result, ...

> -You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> -in your environment.  However, doing this is not supported and the
> +You can counter-override this behaviour by setting CONFIG_EXPERT=y
> +in your Kconfig file.  However, doing this is not supported and the
>  resulting configurations do not receive security support.  If you set
>  this variable there is nothing stopping you setting dangerously
>  experimental combinations of features - not even any warnings.

... some of this is also in need of updating / correcting.

Jan

