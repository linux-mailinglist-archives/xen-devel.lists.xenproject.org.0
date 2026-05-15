Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH4ZNKgRB2rgrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ABE54F8D5
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309982.1580986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrfC-00070v-Ic; Fri, 15 May 2026 12:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309982.1580986; Fri, 15 May 2026 12:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrfC-0006yA-Fa; Fri, 15 May 2026 12:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1309982;
 Fri, 15 May 2026 12:29:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNrfA-0006y4-QD
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 12:29:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNrfA-000OoB-5a
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 14:29:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a071190-2eae-0a2a0a5409dd-0a2a450b92a0-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:29:08 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a071193-212f-0a2a450b0019-d155dd32e0ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:29:08 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-449de065cb3so8362989f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 05:29:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a1a22csm13723788f8f.19.2026.05.15.05.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 05:29:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778848147; x=1779452947; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1GHd6sos5pF+ZlQWXwLpWOamBgutfV1Cq9SATOY7XJM=;
        b=fbJD/er0H0DFgvUeizybh9T8aw6ijaBGkAfsHx6ag4n1NX8FYI68heVTqPSsZMWEIF
         MCxpaRJUJ8+Z0arYBmBm56y1E4bFPG1q/civ0rIxgbFW4leCRku6gz+U4grD/PS2/Iga
         w4ol++DoVHcigyaG7nQVrmmdzf6JI4t2gvFdwQL4MrjRfXanbwF/A7deGS+MJDOuI5nC
         jaoPyDUUQQGPQc7VZLMRi0HkNhjVmk4faN/wv08wnxlH3GxEyHi0ZYj3N9kXnc2BD6n+
         JUGP/2ZvXaCW8aeotoqYTblfbmnPg+DzvAJ2wW0aPjYQRkjy8A7CYlkDT1GVDmXEj8V0
         F66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848147; x=1779452947;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GHd6sos5pF+ZlQWXwLpWOamBgutfV1Cq9SATOY7XJM=;
        b=EuyZ2edwL9z0CyFXclO/CydhQAmrIGO93xWcDaNv6Zg9Jd+YHZ50p4OpboHzsdI8oZ
         FMEy/MwDBebKjFqwOejStgWrnRe19fXweayIQ8oTYLRdwOUGkqaPmE8nlEi0i4SPFF+k
         JxJbK+KIDegFaxAxXHl+Qsj4JdjEzpw91w9m1K4JGSC4ZI0FPRJbUFUMdZ6G46qkXc1V
         kqewvtDjOKi7P4Ny++DmcPt3BSC42K6Yr5DKoeXkjk0Df7PSeCscwvW7Gi5zB9PJNKTj
         u97CNWT7JPw4kp1hWG9LNYJqxitSnJPjshJlPLBvk4qi4mwgRQdxpfIdDpXkD70rZOS1
         8JIg==
X-Forwarded-Encrypted: i=1; AFNElJ8hSTWf2qL/92dB6mXzxPCiPFhnYOEBYW3Mi/eZQdtc/c777bONI/iPP+rTkHsvMYnFSVIDHd4hKAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMM7uGrJz58zxGuxZEKxdnqK/GXOCseO3wobMSXrHDnKto2wnm
	mzbUhvTE9U8tEBpy+KKQ5nbKA386elE6B7rYOy2pGCOtkPukVp84Ty6C+3L8xCCDCw==
X-Gm-Gg: Acq92OHw2OxW9aSh8YyuzkPzGahZ17pLbhzfkHMNl5E3Up64sFOi/gTxS3QeDgkEqfK
	yUH6BU55fp3EinGBDrF3cva566xTx6q2p5ujgKosKoupPn2xt5Bm2OVOv4xUGs34gP6eZGV2sBj
	BXPPFDx/oLZN1d94YfFntkUew7wzbaYRRrcc93MZ+8UJlMxS0YmwqpBmu6Zrb/zXrbT27KiVpG0
	9AKEE1S8HwkPow6QyjZNReoSe1I6j4ySWidtZmQKrFwNQmlWtX8ayp2/0+bOUtYTggf3+NqvEZD
	/9zyGGQks005bGCs23JXEnnAEn4O/TIBLLIoTa0C31yAM7H3aKud9TlcnwrQyIPVmjgxRgCQ/Mr
	HVaTksZ/d42jFWlPzb2b+IlcWLhnLMScJHwZ55pp9ei9RdSl/ZFVlovCFlu9bHgCHR7iZpam2jH
	l+fMNncRIGcPThsYs7ns6XsqYbpsyfVeDqsjbSZlEb48VEfcejY5u/8RQtj1xj02X4b/91Yw/g+
	CV4QO3D0jY1K7w=
X-Received: by 2002:a05:6000:1ac7:b0:43f:e272:edff with SMTP id ffacd0b85a97d-45e5c57d308mr5270640f8f.4.1778848147568;
        Fri, 15 May 2026 05:29:07 -0700 (PDT)
Message-ID: <bf9bf0e7-6cb2-433d-b297-ccd6cae9c925@suse.com>
Date: Fri, 15 May 2026 14:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
 <d4db5afa4cc02a234bff93416a639c750e5f1bf9.1778845596.git.mykyta_poturai@epam.com>
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
In-Reply-To: <d4db5afa4cc02a234bff93416a639c750e5f1bf9.1778845596.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778848148-22B8EF3B-0442CAD8/0/0
X-purgate-type: clean
X-purgate-size: 991
X-Rspamd-Queue-Id: 39ABE54F8D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15.05.2026 13:54, Mykyta Poturai wrote:
> @@ -104,8 +104,10 @@ xenhypfs: xenhypfs.o
>  xenlockprof: xenlockprof.o
>  	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenctrl) $(APPEND_LDFLAGS)
>  
> -xen-hptool: xen-hptool.o
> -	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenguest) $(LDLIBS_libxenstore) $(APPEND_LDFLAGS)
> +HPTOOL_OBJS-$(CONFIG_MIGRATE) += xen-hptool-x86.o
> +
> +xen-hptool: xen-hptool.o $(HPTOOL_OBJS-y)

I'm not a maintainer of this, but imo this wants to be

HPTOOL-OBJS-y := xen-hptool.o
HPTOOL-OBJS-$(CONFIG_MIGRATE) += xen-hptool-x86.o

xen-hptool: $(HPTOOL-OBJS-y)

Whether $(CONFIG_MIGRATE) is actually appropriate to use here (and not
CONFIG_X86) is a separate question. What's moved into that new file is not
only migration related stuff, after all.

Whether an almost-all-caps variable name is okay to use here is yet another
(style) question. In the hypervisor we prefer lowercase forms, I think.

Jan

