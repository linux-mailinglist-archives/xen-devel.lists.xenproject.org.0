Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJYMBSeFnWmVQQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:01:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4307185D0B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 12:01:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239828.1541237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqAd-0007fv-5p; Tue, 24 Feb 2026 11:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239828.1541237; Tue, 24 Feb 2026 11:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuqAd-0007d0-2g; Tue, 24 Feb 2026 11:01:39 +0000
Received: by outflank-mailman (input) for mailman id 1239828;
 Tue, 24 Feb 2026 11:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuqAc-0007cq-Am
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 11:01:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ff6c330-1170-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 12:01:36 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso3834955f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Feb 2026 03:01:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398a292babsm2118122f8f.37.2026.02.24.03.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Feb 2026 03:01:30 -0800 (PST)
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
X-Inumbo-ID: 2ff6c330-1170-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771930896; x=1772535696; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ElKe/Cp1IiSTxL9VlQnhHLXInJYjUc4U9nMVkU2hshk=;
        b=ArxcyjNjFQKtlk3G7lOXBDcHe+fH2ml3fXliGGTkEn0pkE6fzvQaSVEhD4if6SD9FT
         njWQ3x3BZJ3dTXS+bGCaUDEcRlXH4GqcKKQTREPh8uIiteBLMrNsEc/zR78upMtGyHsq
         fYe/nD64PxmYSXASwCWrIfsxcoZlacrU0KnrV7w/dpQySqP7Hf5Vd99MV6E68pQQ9z6P
         m5I8m3m8XWYwe6g6Fh5kjPfWyoEmuO4doeA0q3xxSNJwFhrlZpPRN0HjU+Avqo6j+Z7M
         Ozo6NtPraWOq+8PEy+5gcFBYZWAEkEcCUGTlgwgfDT/dirUrFGTvql4D819l23KVv5O3
         E6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771930896; x=1772535696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ElKe/Cp1IiSTxL9VlQnhHLXInJYjUc4U9nMVkU2hshk=;
        b=pTa78jsU8joqYnhq0jMLYar1t4wqr6RW19J16gyoQE1LkBo07TANlX7+CYpZpEQ42A
         Yzl39kPy5IUZk/M/zSdx4MC/Mu33mfJ0v6ryIm/hHkiAjgCSmQB+BYS0PyTqaEjXWA0+
         461T5JEreK4A+ljVHbluymMsaVoItpndqfKf+B3ajC9m6tD3OGSJQ96sGy6Qt9G4SGv7
         lLolzKZus8LwvXhJi1mAyzWzkYbMIIeqj+sH3e7TqB5FuwdXn0DoLTxUuy+fW3uHloJ7
         AEisqpcHYnyEB4+jCxoQapAoY6dODvANfGwuQAk1J+AuIGPBSnjEazc3rYdhWgKgpvX5
         ZcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDB6qQQtbL2UeOKPh8fr+jLuSYZ5rhCwTIc21o+3OQtJOQR9G1vN36WRysRfR1R7RCZEBKrexw9vY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZsn9tHJEdSQq+VXrcPS2j1EkTyN0qoE8uPk1BFikzVkLycsPA
	W2jGSa7LMKiS3ur+18sS2/nsf/TyewNf6BweJO3bEcjHgP2T7uLndBB0P4S0c25DVg==
X-Gm-Gg: ATEYQzwxKkkIkKgyekSQejuzX30Fj6XU0uDZSkGxIE8af8eTBfVMtixgXcDVYbrEw6O
	/v9hX6KLxJ5Fd56eLRyDjDKWks4NUgyBBAh4Urppr7NAC1rbGs6FzzzQOhdOVPXh7MmoaHTjcqX
	BSPoe9hdPEBLVDkt5mq+i7Y36i2VjucIlrm3QxzE2uW/2Zj/wnP6T6bjPnTOuI1fMNTSSpU3V5u
	vc+uCF93yjejVBhRONzcY2wqzsHppNGEgKAqMJRmEs+l/GSlGu2kN/NZ7gUYYWNRKtbEONHvr89
	JusbAAxqWH4bBW5Ar6GPOryzjdEgaiMWkBTTIDj/37S6D2Fk1B4h3CxfGLQnfqA3ZTIGr9SzqZ0
	RKbMeL04+TIAO14s2qHm195W4mrehakqAZ2JZ6kztNuemo+D0N5QVBQTYH9hPl7hR02GXzkuDnI
	rOr4fLWplP1Q8ocZemB5qJqnuo6isND2JCwqqIv6chlC5KV3CTfMYM4NxlNNw9F8Uqnl6Ybq1S+
	/9IyHMeOIA+JhYSlCX50WJV1A==
X-Received: by 2002:a05:6000:25c2:b0:437:6c0c:346c with SMTP id ffacd0b85a97d-4396274ec1cmr33657524f8f.28.1771930891039;
        Tue, 24 Feb 2026 03:01:31 -0800 (PST)
Message-ID: <3a08a2d0-a18f-40e1-b9bf-9b71e0c797c0@suse.com>
Date: Tue, 24 Feb 2026 12:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Consider Xen PVH support in CONFIG_XEN_PVHVM
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
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
In-Reply-To: <7b17bfbb4b25a59514707f91546ce8c3a24369e0.1771929804.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[suse.com:server fail];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: E4307185D0B
X-Rspamd-Action: no action

On 24.02.2026 11:51, Teddy Astie wrote:
> It's currently possible to build Linux with CONFIG_PVH|CONFIG_XEN_PVHVM
> and no CONFIG_XEN_PVH.

In which case, how can you expect Xen PVH to work?

> That leads to inconsistent kernels that fails with
> "Missing xen PVH initialization" when booting using PVH boot method or
> display various errors and fail to initialize Xen PV drivers when booting
> with PVH-GRUB.
> 
>     platform_pci_unplug: Xen Platform PCI: unrecognised magic value
>     ...
>     # modprobe xen-blkfront
>     modprobe: ERROR: could not insert 'xen_blkfront': No such device
>     # modprobe xen-netfront
>     modprobe: ERROR: could not insert 'xen_netfront': No such device
> 
> When built without CONFIG_XEN_PVH, PVH-specific logic is disabled, hence when
> booting with e.g PVH-OVMF, Linux assumes we are a HVM guest, even when we aren't
> actually one (in the "with HVM emulated devices" sense).
> 
> As it is actually possible to boot Xen PVH without CONFIG_PVH; and that most
> Xen-related logic exist within CONFIG_XEN_PVHVM; consider PVH guests support
> within CONFIG_XEN_PVHVM instead of CONFIG_XEN_PVH.

XEN_PVHVM serves a different purpose though, iirc.

Jan

