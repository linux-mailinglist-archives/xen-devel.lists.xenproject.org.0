Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5BA96A0CB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:37:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789321.1198910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUeA-00078l-3d; Tue, 03 Sep 2024 14:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789321.1198910; Tue, 03 Sep 2024 14:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUeA-000775-04; Tue, 03 Sep 2024 14:36:42 +0000
Received: by outflank-mailman (input) for mailman id 789321;
 Tue, 03 Sep 2024 14:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slUe9-00076z-4M
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:36:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee45de5d-6a01-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:36:39 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-534366c194fso4964696e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:36:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a3easm6595236a12.6.2024.09.03.07.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:36:38 -0700 (PDT)
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
X-Inumbo-ID: ee45de5d-6a01-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725374199; x=1725978999; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n4lZ7ZV8yxqSafKwxSbvlJ6OwCJ5SUtLumb8R+Dwe3g=;
        b=fyaTsjkdmlvICe1ac3aK4Jh+RSucBQ/BOTdkBAJy3JtY/aftFg+Hh+1TA3FwwlUpap
         R6iSmLaBzY+uGM3zRsyHz2BihTgbOJw/GJYSWF9i2Cxhw4/JVf0nbshdfpwmNrQHjUXm
         0DR3KO7zKbIdYqnFsqV0aT49Vm6378CluTI1O7nae9UzEfVSq1YNRfTXt9jnv3AmvQ6F
         CuEzzHmzvfFe8tBotfNeu4kRYu6QN9Un25rgZQXf4lIFxuZWKO87dSOYgcoPsRxH8cSW
         HI+mw1PkhiHYS8BakpGTkYQxPIg9DVQD5/v9sgjsqaIjlE6SuIMVKY63J3Xp/BuT5TaE
         n5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725374199; x=1725978999;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4lZ7ZV8yxqSafKwxSbvlJ6OwCJ5SUtLumb8R+Dwe3g=;
        b=cVNeSU9KI6ZpTLt7tnfBspDcaLC6CmwxmJrgJsNzsBhW6VfQhcpBSrvXs1tqH1dn56
         3yKI41tZY1JBkYAxx7J1TOefNR+j0w0J8sLQKvIj6oOPLCfQ6an9AbIkOvf2m7WEW7gI
         uNVD9K9K4sd8oXFlmtVsytJhXWSm3C0qAaFmifHlQahewpNzQY8hORW2+mlQUslesxHz
         6Oph3MtnOEaEWVs2VIwkQR/WtpOYmmgsJp7hhNpTkfUQZxa7h3O/L6/OOdw3LOLWw/i3
         WsNoi5OHHZRaq9nXtjRss8aTlr4qrNUumw3tvnZ7S+WXywHfQjuP0PhxDZATP4hM7J/i
         G2ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8BS/JvDfK3g6F/E1SkF1n5Le/TehWxV/lJDrOSh8WNDEeQxZJCo8JZrMqwoCzTRuyU/cy/JCqEh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuNwaunyJEvwImuZqm5Qm/XjUrwI5Lr54GiHBf4fhvgSBCLE24
	75geKUFTGC1Zt1csAKZetIIxG2gX6KLuOBjGK8FqxES62nyNz6eed5zalYBXdw==
X-Google-Smtp-Source: AGHT+IGge4D0KgLfKLVHuRXqfw9qsM8eem1fnegfCf0Ii8iCQCUqL33TRkb4my/VcyKnUPByK8wJJg==
X-Received: by 2002:a05:6512:3d8f:b0:52e:76d5:9504 with SMTP id 2adb3069b0e04-53546b16af0mr10507627e87.3.1725374199192;
        Tue, 03 Sep 2024 07:36:39 -0700 (PDT)
Message-ID: <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
Date: Tue, 3 Sep 2024 16:36:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
 Mark Syms <mark.syms@citrix.com>, Anthony Perard
 <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20240903141923.72241-1-roger.pau@citrix.com>
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
In-Reply-To: <20240903141923.72241-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2024 16:19, Roger Pau Monne wrote:
> Current blkif implementations (both backends and frontends) have all slight
> differences about how they handle the 'sector-size' xenstore node, and how
> other fields are derived from this value or hardcoded to be expressed in units
> of 512 bytes.
> 
> To give some context, this is an excerpt of how different implementations use
> the value in 'sector-size' as the base unit for to other fields rather than
> just to set the logical sector size of the block device:
> 
>                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> Linux blk{front,back}   │         512         │          512           │           512
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> MiniOS                  │     sector-size     │          512           │           512
> 
> An attempt was made by 67e1c050e36b in order to change the base units of the
> request fields and the xenstore 'sectors' node.  That however only lead to more
> confusion, as the specification now clearly diverged from the reference
> implementation in Linux.  Such change was only implemented for QEMU Qdisk
> and Windows PV blkfront.
> 
> Partially revert to the state before 67e1c050e36b:
> 
>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
>    the node, backends should not make decisions based on its presence.
> 
>  * Clarify that 'sectors' xenstore node and the requests fields are always in
>    512-byte units, like it was previous to 67e1c050e36b.
> 
> All base units for the fields used in the protocol are 512-byte based, the
> xenbus 'sector-size' field is only used to signal the logic block size.  When
> 'sector-size' is greater than 512, blkfront implementations must make sure that
> the offsets and sizes (even when expressed in 512-byte units) are aligned to
> the logical block size specified in 'sector-size', otherwise the backend will
> fail to process the requests.
> 
> This will require changes to some of the frontends and backends in order to
> properly support 'sector-size' nodes greater than 512.
> 
> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Following the earlier discussion, I was kind of hoping that there would be
at least an outline of some plan here as to (efficiently) dealing with 4k-
sector disks. In the absence of that I'm afraid it is a little harder to
judge whether the proposal here is the best we can do at this point.

Jan

> --- a/xen/include/public/io/blkif.h
> +++ b/xen/include/public/io/blkif.h
> @@ -240,10 +240,6 @@
>   *      The logical block size, in bytes, of the underlying storage. This
>   *      must be a power of two with a minimum value of 512.
>   *
> - *      NOTE: Because of implementation bugs in some frontends this must be
> - *            set to 512, unless the frontend advertizes a non-zero value
> - *            in its "feature-large-sector-size" xenbus node. (See below).
> - *
>   * physical-sector-size
>   *      Values:         <uint32_t>
>   *      Default Value:  <"sector-size">
> @@ -254,8 +250,8 @@
>   * sectors
>   *      Values:         <uint64_t>
>   *
> - *      The size of the backend device, expressed in units of "sector-size".
> - *      The product of "sector-size" and "sectors" must also be an integer
> + *      The size of the backend device, expressed in units of 512b.
> + *      The product of "sector-size" * 512 must also be an integer
>   *      multiple of "physical-sector-size", if that node is present.
>   *
>   *****************************************************************************
> @@ -338,6 +334,7 @@
>   * feature-large-sector-size
>   *      Values:         0/1 (boolean)
>   *      Default Value:  0
> + *      Notes:          DEPRECATED, 12
>   *
>   *      A value of "1" indicates that the frontend will correctly supply and
>   *      interpret all sector-based quantities in terms of the "sector-size"
> @@ -411,6 +408,11 @@
>   *(10) The discard-secure property may be present and will be set to 1 if the
>   *     backing device supports secure discard.
>   *(11) Only used by Linux and NetBSD.
> + *(12) Possibly only ever implemented by the QEMU Qdisk backend and the Windows
> + *     PV block frontend.  Other backends and frontends supported 'sector-size'
> + *     values greater than 512 before such feature was added.  Frontends should
> + *     not expose this node, neither should backends make any decisions based
> + *     on it being exposed by the frontend.
>   */
>  
>  /*
> @@ -621,9 +623,12 @@
>  /*
>   * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
>   * 'sector_number' in blkif_request, blkif_request_discard and
> - * blkif_request_indirect are sector-based quantities. See the description
> - * of the "feature-large-sector-size" frontend xenbus node above for
> - * more information.
> + * blkif_request_indirect are all in units of 512 bytes, regardless of whether the
> + * 'sector-size' xenstore node contains a value greater than 512.
> + *
> + * However the value in those fields must be properly aligned to the logical
> + * sector size reported by the 'sector-size' xenstore node, see 'Backend Device
> + * Properties' section.
>   */
>  struct blkif_request_segment {
>      grant_ref_t gref;        /* reference to I/O buffer frame        */


