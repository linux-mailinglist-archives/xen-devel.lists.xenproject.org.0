Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH0IB4jCu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:31:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2C2C8B38
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256854.1551327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39j7-0001aq-N9; Thu, 19 Mar 2026 09:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256854.1551327; Thu, 19 Mar 2026 09:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39j7-0001Y8-KR; Thu, 19 Mar 2026 09:31:37 +0000
Received: by outflank-mailman (input) for mailman id 1256854;
 Thu, 19 Mar 2026 09:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w39j6-0001Y2-Ri
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:31:36 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b9cafe4-2376-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 10:31:34 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-486fd27754bso689705e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 02:31:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8c53324sm62619205e9.15.2026.03.19.02.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:31:33 -0700 (PDT)
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
X-Inumbo-ID: 6b9cafe4-2376-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773912694; x=1774517494; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6U2/gkphmt+OxdfCk/0ysQl8TuA2+/rCO+v6bFng6IM=;
        b=DMSkg3Nf83iw9slWu68HUz8gxrcF4pwb/9+w4KLkMxo+kiOTiKs99psJX8IYwqUlVm
         aFsy7L8Nfu44gKtdIju3wDwtZOlJfnvTCTj2MxhMNM5XpiZtjZrzI/aHXYt97v+C54YT
         z51oG0szDC2D8Cq+CjN5o28SwR37ZQi3FwIf6oLCWuLSFlNeD4efnXsb7QchZRz3lf2t
         FdOlnGjkgVXW4gU66g59MsDia0nWVDi45INztCm5wXDDTo1+1lvIsCFO1K2uzV/28wkQ
         IgfBn07Fhbk8dMwRX5zdZxdUFrvrKFLWO/7pJ+UUTQtUO4yVoOhCdCTGaRwukM0/pokp
         qcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912694; x=1774517494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6U2/gkphmt+OxdfCk/0ysQl8TuA2+/rCO+v6bFng6IM=;
        b=HavgsRyTYFDMY0v5RNJjQ91X2kV/Of1LdKJhe+gHGnBPWGrkrpecOzynFFMIGCdCjb
         s+A0CSPiKdGmNWTjQFgYNh0SF6fEn/H+aBJmo9VSN3Mo4YLUY+YWU9iY6ARdKU2wt0bG
         rw0K7L0gZhEYzKz69w9DdI+a2QW7vaV1IpVWTAMQPDcUUCmoOlvD3gg219Qigu4rTbJX
         gdt+2a1o75iOgUXg0Y7tBpfTPpAX+A1TPD5lKAY+vA9jKgwydF5gqe936U3XPeIIn1ze
         5zpQlijXU5ne29pSCinJSZIRI31br7wQKSg7BEEbliDlI+aNCx4QUP9sf5k+Kk/YxcY3
         P81w==
X-Forwarded-Encrypted: i=1; AJvYcCVYIF7I8pKNHTQSj6A0KGVx0p2RjwzGMX02yIkDWrP3wv9KyZ6SlbG55iz/sJ+jV6spHe++MRS4os0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzR0MdrDt0poagN36xp7FK5qzwbQcuVCj/WLaBO19aR8TN7/h8n
	zrrldDbLThMtSckppVmRSQJ2It0tEsMAPMbq9O9HDFvFaJ2FbE46b/5HRRcOF+8vbiQgOif1HkC
	Sy8Q=
X-Gm-Gg: ATEYQzyQXFHN/kkJFU7HUC4LbkNvFqV2W3Mkg1h7HtVNh894YFj1dHWCD03KlujJWU2
	65rQXk8SCc7Qcb347cZj0ZPOwQSUQIo8fEeqB4E/M1B6mFj3DL7nL7exenjGU83KAhTANOxiiC4
	wJOCBDYCsjXnwydAwwVQzcjslyK+nCpsA0iYqpHu/xxtPlzVSJNtNc4S6pVopMqk94FnWUJyTNx
	3luh7gGKuU9Oy7UD3O71OrDFIQEtaue4GwXDxKe/OSkehWWe/snuqWI4ORCRZ1Idy1DCcPJsWuw
	HfqcOa5kkeOaccKKpg67gEaaTaKGT7FX5/L61Zf145nmA3Z0hWRj3svv1Ar9g8ktLUU2ATEFzBs
	I6rOCSj54Bnh0TF40VDpY6wphuvjiGfUd4TyYXc0irvbvn4Z20RVnDRQJtredTDzdIjiWnQO9W+
	VDugKFe0yL64hID5mxMaWBpXORiH01BnnVu1nP4mFTt59uBoMUb5wIFwZsPigLq2272NWnOLaEK
	+lU4imWnEk2Ml4=
X-Received: by 2002:a05:600c:828e:b0:485:4533:9c47 with SMTP id 5b1f17b1804b1-486f4475401mr109038365e9.22.1773912693831;
        Thu, 19 Mar 2026 02:31:33 -0700 (PDT)
Message-ID: <7ee208c4-1f83-4bec-86db-bae22bd2040c@suse.com>
Date: Thu, 19 Mar 2026 10:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] install.sh: Preserve directory symlinks
To: Thierry Escande <thierry.escande@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260313172456.871518-1-thierry.escande@vates.tech>
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
In-Reply-To: <20260313172456.871518-1-thierry.escande@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7BE2C2C8B38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 18:25, Thierry Escande wrote:
> In various distros (i.e. Debian) some folders like /lib or /var/run are
> symlinks. Using the tar option --keep-directory-symlink preserves these
> symlinks.
> 
> Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
> ---
>  install.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/install.sh b/install.sh
> index 3e11c4d46f..5d0b7a4933 100644
> --- a/install.sh
> +++ b/install.sh
> @@ -27,7 +27,7 @@ tmp="`mktemp -d`"
>  echo "Installing Xen from '$src' to '$dst'..."
>  (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
>  
> -(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
> +(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -

How compatible (between flavors of tar as well as between versions of GNU
tar) is use of this option?

Jan

