Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJnRDRm5zGmcWAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:20:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A023751DA
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 08:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269702.1558620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ovm-0005M9-Mp; Wed, 01 Apr 2026 06:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269702.1558620; Wed, 01 Apr 2026 06:19:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7ovm-0005K2-JU; Wed, 01 Apr 2026 06:19:58 +0000
Received: by outflank-mailman (input) for mailman id 1269702;
 Wed, 01 Apr 2026 06:19:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7ovk-0005Jw-SK
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 06:19:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ovk-0046TI-89
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 08:19:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb904-bab6-0a2a0a5309dd-0a2a4503890c-12
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:19:56 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ccb90c-1947-0a2a45030019-d155dd32a5e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:19:56 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so310565f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 23:19:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf245e2f6sm34243131f8f.18.2026.03.31.23.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 23:19:55 -0700 (PDT)
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
        d=suse.com; s=google; t=1775024396; x=1775629196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpmd/TglRO+Yd0DMrl1tnaGzc4iWdLU/CKs5XA4oDDY=;
        b=C84we2p7YzQz6JZfcATbvemhCoRGGpbAtjMtay1//i37r3qo9vXhj10vBJwHIVPm9I
         6V8ut9UJo8hMfDuxzYqsj8Y4VgvaXyU3uWcn2W1BOejpR8z1VLFm1Wb70gyTc/eloNGo
         1mZzwgSzUsSBvlZfNIxKsL4urDuehozrnY6q0bUsXR4nc2i0DmsT2r2b58DlyWkVHL1u
         l4TNS6YV+rsr1CRJX5dyl4IbbT7vvfT7G3uPV+sYiGV09x96SN212npyleWuithtmm02
         1wTozJVXb2rqEYt9iFI5fFERLw9inhkHClXFPfCkI6HuPSX5JF6po+Y6YieT2FEuke5D
         AJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775024396; x=1775629196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpmd/TglRO+Yd0DMrl1tnaGzc4iWdLU/CKs5XA4oDDY=;
        b=CGY9n1YlizsdceCwe5HPOfYE9Parg5yay50gyt7+Rw5MYStmLouV5Z3jlabZrMfis0
         P6W4YUlvB22C3EadKg6ki8YIHM9JhI7nFslXSYZiTGYNuny4fcKRkfCk9jeXWndU3ckW
         WwVHNRkTsuBEq3uHcIea0wvVuJF8NJIDt52CS9fTjE8zbdyTk985bg3kMiWOxfNQDQUr
         l7i1yhW51OfjBepN+d44o9gdvCFy7lz5R0ULHVmfnOB59JaeDaz5nbntGA1Cu+5ag5bm
         RPb/a35uQNObSHJPsdi5+8GQQ2ZLCRQ+4OPTmo7T6elQkv7uNPmjCvn6FJXyb9LnUkwG
         o47A==
X-Forwarded-Encrypted: i=1; AJvYcCWIdJgk8BPj8InS3c2jqrLe0BiCJfj9kJUX1XXb+eyoU44HN5ktJPX6jIJrNhMPssL7YltOKiF9irU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy75rsIJ1/cKsOCUIKQyEasyrd08VaUEtBMezTZY08kSQ81JShE
	bBq+AfaLFxkHYItWezL5ZrChM2YKgMpUzbMMtoirfTprvsTiNj4a3L12T8/iWMvZ0Q==
X-Gm-Gg: ATEYQzx4sMlwTcqfku5CHd977lj8Jb+JrtRG7/lttABXNDBbJnJG/2u5LIeDaK+4EW4
	e2X2wtHhDEqXgN97kzijueupFF9NnLRqCAGSbxE8YToHAX27pvrnuN2eXKd0X1iDY8gGzk/srHJ
	iRt5H9K4/kRbnhD/86cZ3OAkb8sA8o66AuigmvFYlHszjX/l+Cbvjf0x6AeAkiG+rAz5EUlWApo
	j+Bpon2mkCfFhI7ughwHWUP7QB/cNuyLp4Ne9ztvyZwEfzA6XxH/FPvC8bWtexe/5fzZuDFxoA1
	SdHDFYPH5y3kb1ABPSHvDkARkKdT17UgCV2wT0gxrsTCgiHxmuBlBx7u5QGYi2SbCSYt96CKXbu
	XYYfzS6G3Z12zKRTqgjNIg+znCHl7L3kXTO/qitLPdGZbbkGgL3oVkPsLraUie+31Ss4C0BPW+N
	GPoNAG00aHxYpiVQXBDRHwkYGKXvHMX1PSc+gdvANPRbd6pnw6bsF3Xc6zU9EfEgwl4ulfdUlYa
	1dJsgbtOykVyAA=
X-Received: by 2002:adf:fa52:0:b0:43d:1598:2d6e with SMTP id ffacd0b85a97d-43d15982eb7mr2498938f8f.20.1775024395642;
        Tue, 31 Mar 2026 23:19:55 -0700 (PDT)
Message-ID: <46dd0df2-ccf1-4c5e-9f89-9b0b197e1c95@suse.com>
Date: Wed, 1 Apr 2026 08:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/riscv: init_csr_masks()-related improvements
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774863161.git.oleksii.kurochko@gmail.com>
 <8eb8327bfb2f273cd0fa32ba65e84bb79e8607d4.1774863161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8eb8327bfb2f273cd0fa32ba65e84bb79e8607d4.1774863161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775024396-4A84072C-60EA4758/10/73395122804
X-purgate-type: spam
X-purgate-size: 725
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 96A023751DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 21:04, Oleksii Kurochko wrote:
> There is no reason to use _UL() in define-s sitting in C file hence use UL
> suffix instead.
> 
> Drop 3d argument of INIT_CSR_MASK() and INIT_RO_ONE_MASK() to reduce risk
> of incomplete editing after copy-and-paste, or other typo-ing.
> 
> Use _VALID_ infix instead of _AVAIL_ as the mask identifies architecturally
> defined bits, not bits available for software use.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Seeing this is ready to go in, am I overlooking any dependency on earlier
patches, or could this indeed go in right away?

Jan

