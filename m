Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPjTMKrLBmrynwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:30:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353A254A99F
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 09:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309674.1580732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNn06-0001tA-Uu; Fri, 15 May 2026 07:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309674.1580732; Fri, 15 May 2026 07:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNn06-0001qm-RX; Fri, 15 May 2026 07:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1309674;
 Fri, 15 May 2026 07:30:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNn05-0001qg-C4
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 07:30:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNn04-00CNoC-6x
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 09:30:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06cb8f-e002-0a2a0a5209dd-0a2a4507dfae-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:30:24 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a06cb83-229c-0a2a45070019-d155802bb09d-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 09:30:11 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48d102471a4so86411965e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 00:30:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe60fc0sm9009315e9.21.2026.05.15.00.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 00:30:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1778830211; x=1779435011; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BfOK+bhxZjNapCb9g2TOVWIza5uiHrUiHeNlgjoDuUg=;
        b=Zvkp4kloC9etDSZbTVZ8+J2WqPbCneMezIWz1NwRfoX03DCCooKJOGIB3p83ZLNmkE
         6YqXhFcbACiFJ4oBQCt98ILVSgvSn3BSC+UZsSsH141DMPJ5AkUKIyWIpKNyi9KIjNFE
         Z4a3OzJgtLVG/+kmnq+r9GEey1oyT1hYg1Pe+i8dUBLT58pT+cnF4LapoWXJntCrz28L
         WD2xsXOZox4HKYUY8Rl9fXas+FcXMLrSKO4vj5K6ZQaunaAX373NpBpMuG79/Vp9Bf6Z
         G3FvkkOM4QptJ2/D0R9f07eP6uFg90MCbeHN1qxEG6X0jaASRi7+6qPxqGWbNqMgx7h7
         NBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830211; x=1779435011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfOK+bhxZjNapCb9g2TOVWIza5uiHrUiHeNlgjoDuUg=;
        b=M5W1kSk1C3Zr4FMM2C85DbCXdXiOUumKCVMAWN9ToNaPivj0iz/f02oF01CqtqzU7o
         8xfBSXpq+neXItUMq+6B4b3Nnm3524XE0mDbLxNy5IJ1aeNzgMXhSWHOMnjIqh8ACE8N
         p6tVp3kG2kMxcwEmVtYp6x54/FZX1r/k/wQJNPB3/uxvNPLl36wdInzIJvXAdrNlfxD1
         mtqiEZYl3fYH2Ox851W+rv7UdNkVmD4hsri8fEdLtYiXjJ4oHpjjPD45C2VaLqrV9rpL
         Kuc+BNsDy5U/Y6Hb9vtHuhjM3ZBeJDykHs02ZXM2bFSI5fiiFYimdEwWm1bWiFnpgXUy
         u4XA==
X-Forwarded-Encrypted: i=1; AFNElJ9PN1eYyIaTld7v2/TJG4CZv4f0zFqk45iddifKh348UExwWnay6VVTAsNMGXUMtXwG0IofmQyQUT8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIcvGcRiFQ9UtWmgKlnfR0P2G30Y0pw3Uqgu4AyQWi655Fz5gm
	L5eP01Zg5v4Gla6UK1RME02C9jIMHC0T4K3hoOCYT+77bTrpCX/CPkL4vJMfrRhPyA==
X-Gm-Gg: Acq92OEpaU10RMl9dbDE8VCRvJwN74G2X0WNGyl19pJClkDFbihMPypa+SYJjF48GyM
	NbvUSW+HsPSkxIY+wmUjzrGpS9p1bgvZSFUy0L/a3Gu+pfAA4EGa//1m1PsDI3n3sd9sktdO0IH
	7AwcB4aVb+AIjGgLMkgMBvNvVWyNY+jcQXK5S+2c/67Ktvzst1ZoJvPt4ee9jY8U8+9EsiQ3twh
	isq/uh0SPBCAL5DlQZRPz7nWPzVYcidVMBWe9TAkRKNahuivxdVhDB1tl98LzJGbLvwyiCCMjWM
	t1aj1w4MfEJCTcfK7XCFxehhfrtu8RV26sYKuk5ZX8gIOl4cxdurvnwuiwAv8mbcAdRHoPpzV6J
	Gany57Bnhg5w2VOuvU7XDw2uFy83pDgCTWF9FYoNBsOEaLR6bctbQMQIvGctgHzWhoGUV3TEj0N
	mT0/CFo92ucYK28bHvpmPe8+s0vUnY8iyVX1t03ZLQom5xRaULrsSQz5Q8L4Tj+OoopGyO8Aw2O
	ve5k/tWjT3JLM1/b2B3MlEQKg==
X-Received: by 2002:a05:600c:3b0c:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48fe60d55f9mr37263405e9.8.1778830210785;
        Fri, 15 May 2026 00:30:10 -0700 (PDT)
Message-ID: <3e17e617-a695-4294-a4a9-a591f6417567@suse.com>
Date: Fri, 15 May 2026 09:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/emul: Adjust handling of CR8_LEGACY
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260513171553.1772095-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260513171553.1772095-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778830211-08B60C48-28D0073E/0/0
X-purgate-type: clean
X-purgate-size: 1070
X-Rspamd-Queue-Id: 353A254A99F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 19:15, Andrew Cooper wrote:
> The CR8_LEGACY feature was introduced in the K8 Revision F.  It doesn't exist
> in prior revisions of the K8.
> 
> Furthermore, from APM Vol2 3.1.5 CR8 (Task Priority Register, TPR):
> 
>   The AMD64 architecture introduces a new control register, CR8, defined as
>   the task priority register (TPR).
> 
> Additionally, from APM Vol3 4 System Instructions MOV CRn:
> 
>   CR8 can be read and written in 64-bit mode, using a REX prefix.  CR8 can be
>   read and written in all modes using a LOCK prefix instead of a REX prefix to
>   specify the additional opcode bit.
> 
> i.e. the LOCK prefix serves as an alternative encoding for REX.R.
> 
> Switch decode_twobyte() from += 8 to |= 8 to better match the description
> given.  Other indications that the encoding isn't additive are that the CR
> intercepts stop at 15, and that LOCK MOV CR8 generates #UD rather than
> becoming a CR0 access.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


