Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92782BFB29F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147731.1479901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBV9C-0002zB-Cp; Wed, 22 Oct 2025 09:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147731.1479901; Wed, 22 Oct 2025 09:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBV9C-0002xg-AB; Wed, 22 Oct 2025 09:28:46 +0000
Received: by outflank-mailman (input) for mailman id 1147731;
 Wed, 22 Oct 2025 09:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBV9A-0002xa-WA
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:28:44 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80cda41e-af29-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 11:28:43 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47112a73785so50238015e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 02:28:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427c3bfsm39714715e9.3.2025.10.22.02.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:28:43 -0700 (PDT)
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
X-Inumbo-ID: 80cda41e-af29-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761125323; x=1761730123; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qz9P+bXWiJwS8DvsgPA8rn9Ph8jpMBi/zSwcLwRWuVQ=;
        b=WKryamQWip7Er4sd+3BrFRQt2ZWzGilLYv1finvj8D403Tww5xoxZvaYDBG7q8WfsO
         oAEGnzD1rcx/QeCUI9nrg6J1IRWkd48/LVdi+qivj6TYUuNMK9NI38nbiHNownM4ovXr
         DoRcmDHL1DCXAZ2/PzlQ2ru4d3BH0zN6RBCMoVjTOCyZXXo+QijYcdfvh8ieWzIKjIUN
         3/QvFsHxpIkqV0GXODlS/j+VHf+z5TCeRZtcW8fJ1WDbikBg23v9ANfPmQ/mOcsZd+ff
         qmd3M9nhiA9x6CARzKsyBiYn3vcvNHAGyxFiz0SBuXIkWUKLzGJRMQWOyTjvXRVwQhLX
         1xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125323; x=1761730123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qz9P+bXWiJwS8DvsgPA8rn9Ph8jpMBi/zSwcLwRWuVQ=;
        b=iQ3X2Wb+XhgO8vPLNZUFNrIUI6+LB1PijETWWInk/zn9ej0EKvzqyEo9+RPAxh4b/x
         FNVoOJHfm7LMNlNurm3D7jJ1I0azbqQYELQSgAzlLUFwDCURAzzfPfbwdFPnDoI+W8Jf
         LrMLdztlcn2dAavULBN6sDJ5G9SnInJA4FqjUVL8XRgdFP3ps88yh+7g38PGzHhacajX
         nEzfYpjduOZHaGSybkA1ktoAbbcW5mIF8A2Ta3qqRPCiiJ+M/YT7i++r6bb0pogSp0V5
         Pk7J+apoy5YFVC9EQV0A73jjDqkECIJ+GiUnsH8qCIpFdi0QRD2/wBFM32OWRI2L8uXL
         zxHg==
X-Forwarded-Encrypted: i=1; AJvYcCWF8xi1RUz4ZEoWgM444C44oH/koodjc/BGr/rixARwYhR3ZsloxRupcYTPG+QdDjc3irEJuFjqIig=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0WrKVQcqd7ADVq8wHi2O0/DoVPR5zLp5e0n+uF23gUgY3mWSV
	1M6BuVLMO9+huglOxd0ssERVVxRD8rJKrtGoqw6ULnd0NCOJo0Ik/bc3g4h+zDd9nA==
X-Gm-Gg: ASbGncs46anAwE0UIMh7nBxfsbCDEPjePL+nT/q3SOKBovXOAVuOjRYmO0/q7i3kM1h
	wMSMJ5cbrSZZsp5yrhDA5d7lR6IZ+hFUqWJH707jFVJLak0CxNLmO+AQWVLhzEm6GG9WHwoOo+j
	pQW9RlExzhJz7w9vAV8JH35DL52QSg0GRHldMc0MX7mrf43UJRlJLxrukk/6drEtOijYrMJVoiu
	KgeV4UR9WJpue4QK6UpseYvSXYKKjSMfsOLdN+HvWFEwMdazEwk3Kury1ed2u8pMtlCds8NLnMe
	bi9/6q8TlqqTPXGaKoMNqhrlLMztgovArqO/JDqOxRUa6pGgl0RzI5tHdRzYR2aZbqkUueMnMSQ
	lCIxTw39zp9VsAhFzyaHHT4Z4XNwWpyOvrvAA4UQL21mVPilJ8cgDc3xs+wOeDZno6iH6eqTkJf
	SOohTG/ofQunHVV35VhaX2qR9lpfJ2weWyVWJD/7pwuGIBhEAw1uT7ASTsD5uIYq7+jPl2+y4=
X-Google-Smtp-Source: AGHT+IG7eomIKqLWPr2BKkH/Prgkt15b+lj6vVBNaOMcOl5emDd/bKAPiI6iEAuwYWjHAV7IOnFBiQ==
X-Received: by 2002:a05:600c:870b:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-4711791cb7amr164036155e9.33.1761125323361;
        Wed, 22 Oct 2025 02:28:43 -0700 (PDT)
Message-ID: <1f05b129-3cb7-485c-a441-88cc17d4c84f@suse.com>
Date: Wed, 22 Oct 2025 11:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.{19,20}] xen/vpci: fix backport of 53859596c0d3
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: stewart.hildebrand@amd.com, xen-devel@lists.xenproject.org
References: <20251022085909.76402-1-roger.pau@citrix.com>
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
In-Reply-To: <20251022085909.76402-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.2025 10:59, Roger Pau Monne wrote:
> Commit 53859596c0d3 depends on the behavioral change introduced in
> ee2eb6849d50 that inverted the initialization of the MSI-X and header vPCI
> handlers.  53859596c0d3 requires the header to be initialized before MSI-X.
> 
> Change the order of initialization and adjust init_msix() to carve holes
> for the MSI-X tables if necessary, since it will now run after the BARs
> have been possibly mapped into the domain p2m.
> 
> Fixes: f9aea52a9747 ("vpci/msix: improve handling of bogus MSI-X capabilities")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -1016,7 +1016,7 @@ static int cf_check init_header(struct pci_dev *pdev)
>      pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
>      return rc;
>  }
> -REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
> +REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_HIGH);
>  
>  /*
>   * Local variables:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -792,9 +792,14 @@ static int cf_check init_msix(struct pci_dev *pdev)
>      pdev->vpci->msix = msix;
>      list_add(&msix->next, &d->arch.hvm.msix_tables);
>  
> -    return 0;
> +    /*
> +     * vPCI header initialization will have mapped the whole BAR into the
> +     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
> +     * the MSI-X table here, so that Xen can trap accesses.
> +     */
> +    return vpci_make_msix_hole(pdev);
>  }
> -REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
> +REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_MIDDLE);

Aiui this could as well be VPCI_PRIORITY_LOW now, much like in staging init
order between MSI, MSI-X, and ReBar isn't enforced anymore?

Jan

