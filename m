Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B6CBC552A
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 15:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139722.1474971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Ucx-0004b5-2g; Wed, 08 Oct 2025 13:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139722.1474971; Wed, 08 Oct 2025 13:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6Ucw-0004Z5-Vz; Wed, 08 Oct 2025 13:54:46 +0000
Received: by outflank-mailman (input) for mailman id 1139722;
 Wed, 08 Oct 2025 13:54:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6Ucv-0004Yx-Mj
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 13:54:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57b6316e-a44e-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 15:54:43 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b3d5088259eso1098194266b.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 06:54:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b53bd62addbsm90176366b.4.2025.10.08.06.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 06:54:42 -0700 (PDT)
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
X-Inumbo-ID: 57b6316e-a44e-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759931683; x=1760536483; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y3zhpDd9JB42w8UnTwlcel1LJbIxZwUeRRRKBqZnVgw=;
        b=Eodi5wdnvRTrdfpvRMdBJUc8mTcJni6ECeIXYMEFPlQtDZhSXoGAGp1K4/4IaH+65+
         Ar14ywSok6gdjfgMFzTk27j9lS97wPut2JRN0d8xQzvsvAwxBUOafRE3HTy/4v5ObskT
         pFrb1QgcNh468olucCfnDNkDAZIZL0pZKdAVzF8au3uXhA6UXJfWkY+SVRFW0FFVbmu9
         TqB8YheUpqvFpBUvrwz9luDGuyG0huP9PPU7Dtml7dTAr9CvBhb4m/4eqf3Urdd0kVmt
         IrMqCFuWRXMZ+JMQBi8zaOSiYPhXQCevFW3hUuCuFZmOHOF/+MCwgKZshXrixLGMLnR2
         O0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759931683; x=1760536483;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3zhpDd9JB42w8UnTwlcel1LJbIxZwUeRRRKBqZnVgw=;
        b=FIEATV0UZJzfCwo4VSTDTgd1YCHynNF4wG4eztQ9KqDbfe/+hM8LezrDPIm1mqUa6p
         j9vBiBABAlMXsTouJx5ZU7HfyEkM5FvJM/qjFbxKUDzcXQWZKDCSm2m4FMqQgShhHCfB
         EdxjnzDGu1+bky4hyHPcEO0/2V/k0G7BwKPc+jIOZrvxVtWzbByUX1pR1G2tU4Apkb4M
         e0yndF2Q/1cMrxseCU4n7rzO7AQe1acuwwFzIap5P3Rnas5rnn4l9+A1yCytzK1Hd4Yy
         kRmCIOuIy6E1BGnuzAjyU1s8Y9ErV1DqLiWxnC+aR3TLQ8nqDYpH8f4It3VWmpwvjKfx
         rMKA==
X-Forwarded-Encrypted: i=1; AJvYcCWUPkWgTBnK96gKA1f9SmzycGl8ikRLWWFxMw7tvYGfNDRhGEXJnTG03hNjH2J1OMYMpFJml4f38e4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzI/g2mAR3mIfZqfs/oa2d4kT6p2ycqGAVZoCQ5upuLVAPikumz
	sjYOJn0ylZ9ESWUAOpdDMSKQIWtJyX573CMgQEPQzGYRPaESFEOo/cxyGIEmeDFWww==
X-Gm-Gg: ASbGnctWE/QUnIs4nTurodrJgND2PGtfoVs7RnYGqfmu/UhDzhSBhKVH843G4JkDaa8
	3pCMjzP/qo5AuzEpeDQIVVC0ZTZAQR6LwBJ6ir15h1CMccU2wPNORslPb4gNMuOPxXER0DQy+1p
	Uk8ah5VorgYVKSlq+Cq17ffqSwee4jRm6F6uqDx9qFDkJo7zG5bwO4jnsgc2+bfQLDIKvGm1gtN
	h3UdByOkRBC2oFXP586Iena0XKZQUc4hBQ6cPfgt9LfGB145Ly5nINuTHM6tq1FCHqCEPLT83n9
	Sdjpx2xjziLoKG7qbPOMnR7YCUXPI8wgon43xgarb2vTNo/jYJbivYZHUrGHYh6qQZ9/oA6/n4/
	/pWuGWcFw3IT3PtjVfSUXad+GE+SDNjRiJCERU32nm4FacHnDKtngfapUtW3QVoN+W4LQZBUruw
	E7WU9iAH9SprF0vvntejMJoGdWBMAQGlQ=
X-Google-Smtp-Source: AGHT+IFMwW6NTQ/LN1aI0c/rTnM+s+H/t4XCJ6zm1dZjfrAb2JhYwucHZ1W/249l7N7kYpdmFUfcbA==
X-Received: by 2002:a17:907:608b:b0:b40:e2d5:ce28 with SMTP id a640c23a62f3a-b50ac6d2735mr421366166b.53.1759931682623;
        Wed, 08 Oct 2025 06:54:42 -0700 (PDT)
Message-ID: <4b7b99ea-00e0-4967-98a3-90e876e5cf3c@suse.com>
Date: Wed, 8 Oct 2025 15:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux xenfs vs privcmd
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
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
In-Reply-To: <e1627855-e7f4-4fe7-8079-68c3a0d488fb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 15:33, Andrew Cooper wrote:
> Hello,
> 
> I'm doing a deployment of Xen on a remote system provisioned with Ubuntu
> 24.04, and I've found what I'm pretty sure is a bug.
> 
> In dom0, to start with:
> 
> user@host:~$ ls -la /dev/xen/
> total 0
> drwxr-xr-x  2 root root     140 Oct  8 20:04 .
> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
> user@host:~$ ls -la /proc/xen/
> total 0
> dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
> dr-xr-xr-x 326 root root 0 Oct  8 20:04 ..
> 
> i.e. no /dev/xen/privcmd.
> 
> It turns out that mounting xenfs causes it to appear:
> 
> user@host:~$ sudo systemctl start proc-xen.mount
> user@host:~$ ls -la /dev/xen/
> total 0
> drwxr-xr-x  2 root root     180 Oct  8 20:05 .
> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
> crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
> crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
> user@host:~$ ls -la /proc/xen/
> total 0
> drwxr-xr-x   2 root root 0 Oct  8 20:05 .
> dr-xr-xr-x 315 root root 0 Oct  8 20:04 ..
> -r--r--r--   1 root root 0 Oct  8 20:05 capabilities
> -rw-------   1 root root 0 Oct  8 20:05 privcmd
> -rw-------   1 root root 0 Oct  8 20:05 xenbus
> -r--------   1 root root 0 Oct  8 20:05 xensyms
> -rw-------   1 root root 0 Oct  8 20:05 xsd_kva
> -rw-------   1 root root 0 Oct  8 20:05 xsd_port
> 
> For good measure, I checked unmounting xenfs:
> 
> user@host:~$ sudo umount /proc/xen
> user@host:~$ ls -la /dev/xen/
> total 0
> drwxr-xr-x  2 root root     180 Oct  8 20:05 .
> drwxr-xr-x 18 root root    4620 Oct  8 20:04 ..
> crw-------  1 root root 10, 120 Oct  8 20:04 evtchn
> crw-------  1 root root 10, 118 Oct  8 20:04 gntalloc
> crw-------  1 root root 10, 119 Oct  8 20:04 gntdev
> crw-------  1 root root 10, 115 Oct  8 20:05 hypercall
> crw-------  1 root root 10, 116 Oct  8 20:05 privcmd
> crw-------  1 root root 10, 124 Oct  8 20:04 xenbus
> crw-------  1 root root 10, 123 Oct  8 20:04 xenbus_backend
> user@host:~$ ls -la /proc/xen/
> total 0
> dr-xr-xr-x   2 root root 0 Oct  8 20:04 .
> dr-xr-xr-x 291 root root 0 Oct  8 20:04 ..
> 
> and /dev/xen/privcmd stayed.
> 
> 
> Anyway - /dev/xen/privcmd (and /hypercall) shouldn't be tied to xenfs. 
> They should be SIF_PRIVILEGED alone, should they not?

Why would you want to restrict e.g. a Linux stubdom usermode from making
hypercalls? Aiui this would break e.g. qemu running there. (Whether the
tying to xenfs makes sense I can't really judge. Without that something
else would need to make the two entries appear.)

Jan

