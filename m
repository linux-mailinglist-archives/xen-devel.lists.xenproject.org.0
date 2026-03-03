Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC+SA1XppmnjZgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:59:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B881F0E8A
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 14:59:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244785.1544154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQHW-0005RH-91; Tue, 03 Mar 2026 13:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244785.1544154; Tue, 03 Mar 2026 13:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxQHW-0005Oe-6H; Tue, 03 Mar 2026 13:59:26 +0000
Received: by outflank-mailman (input) for mailman id 1244785;
 Tue, 03 Mar 2026 13:59:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxQHU-0005OW-OF
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 13:59:24 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e88407a-1709-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 14:59:23 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so38341925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 05:59:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48516f74a1dsm4328835e9.2.2026.03.03.05.59.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 05:59:22 -0800 (PST)
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
X-Inumbo-ID: 2e88407a-1709-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772546362; x=1773151162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eJb6jyNRbVRCqYi3utXU/8acVkjcEF4cLekP0QdSkZs=;
        b=IAVuEmyS/8HU4Zrb3A4Syn6T605vVjedC3dOnWVejj84mVcLS7cc9iBrATG5zy9T6w
         unwxmlEQvVCgvtBZvDCmgQGT/gB4uGt64ls6mIW02K5YPEDbsDHjhsc5pN3EMDisHUYM
         0rf22cJ/eg1uMBlVy9oPA+LVCFxuJo1pBEpF+px5O3ov6rp8s8CWzc/Z8qp4fXaZTJvK
         dbaCRJ1fAkg7LQbo7K8SV7n0kbkWl1rw78n0SISrh5Hi1cDDH5x9XSYtXwYp83d8rw8D
         JxHV4G33btIPN8YOwIwIXIUa+NDelWY6fERmXBsa3SkDbL3mFoKzMJqYlXIHQTn93Mr7
         ripw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772546362; x=1773151162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJb6jyNRbVRCqYi3utXU/8acVkjcEF4cLekP0QdSkZs=;
        b=epqO9QabfNHA0DB6owcHxJwtnbanEd5kP/bQKrao31On+Tz+HAzOlG2PtzHPCbv1tW
         OpHr9ErgCmYvSeRDeTHSCbahIf+iYJofuCaNzYRhhA40LKcDKL+WA0N3DHPplPgcKa0A
         Gg0kdAr3fBS3MrU9hvWx3RnPaaMF1jPiXTOsyH6YnFuG8qul2vBBkUHbxvSQvZrRl/ph
         vHhtapCqohPdeZGLGXGFk9T/5yCG2IxCQJ1GHf3AQQ+XL085FpioTmBiTVmOwW6d4HSA
         hL443FEqP1oCmNk54JcRfVDorvHDcxq+XnanwXEbxaC9WAvuHw2izpvL2HPXWHaCztvy
         hfRg==
X-Forwarded-Encrypted: i=1; AJvYcCU49202SRf5auPnZWS9ZzP7E1Tb41wo4GfoR5048s7jrR71dKIbcbUqHDmcA3HgbHiC4Xk+YeyJzls=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj0v/ZvId6n9w7jxqaW6SNhjtCFpbGhUnFU6hqSrhPXi5fuLqf
	4RZtYBZJKhl/JlVsL2dS7ZguxMi259fkmIp+UWHDfyxpNFHvLZnoAQT/xtCySx4Fwg==
X-Gm-Gg: ATEYQzx7SRnchRBlmwt292kwN0oTlTNgkrZc1lXt8arG2gSdIuLXvoOTi/1gdyM9Bdh
	lXmmsZokBgDG7qdDnF34Cs0xfOyZE/rLQPY7ipTlzoRd3OuV9aNsLg9NzBmkciTOftT8GSci2Iv
	bmgJxnCRkDTy+ufMWHyl/kGn5F5v1AIu3FkmVqitulbIk+JQoKZu1mUG0wSN5dLF2Ezmy8zDvn2
	I5iv13bKkwvxEWnNw4G5Wk/9birbEyZCaHdJ1TtjPm/TfOvs2vDywsjAJjXMd0EGOItLskRgiQA
	W08SCRfiGSjh0SVQ7ogm0m6LmY6lUOM9mHQq+7Y0T7fVUNE9I11Gc4sGjckwK4glCpj/b+3P53o
	wI2mDDU381QFLt7NqLo5SspKcsmENF9srnepkOR0TiYHrynilbAjUD2NBSiwOoxNQuS2Y7e8kt2
	WFSss0oea6Ijt7gNimDuGfwJc8AagFQOWaOo/HKBX+1UmoM5lg/mre4r1COQX2RMe/11UwcuiIT
	ei7cAk8rLwma/2mjWNivaRs3Q==
X-Received: by 2002:a05:600c:3486:b0:480:1e40:3d2 with SMTP id 5b1f17b1804b1-483c9bedadcmr292926195e9.29.1772546362352;
        Tue, 03 Mar 2026 05:59:22 -0800 (PST)
Message-ID: <766824c8-2ec5-45bd-9aed-1e84ad3ff779@suse.com>
Date: Tue, 3 Mar 2026 14:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1772189234.git.edwin.torok@citrix.com>
 <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
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
In-Reply-To: <358a87d89d50475a57f2a5d6ebea01d95a1df6d7.1772189234.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 67B881F0E8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 27.02.2026 11:58, Edwin Török wrote:
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -1882,8 +1882,13 @@ int main(int argc, char **argv)
>  #define decl_insn(which) extern const unsigned char which[], \
>                           which##_end[] asm ( ".L" #which "_end" )
>  #define put_insn(which, insn) ".pushsection .test\n" \
> -                              #which ": " insn "\n"  \
> +                              ".ifndef "#which"\n" \
> +                              #which ": \n" \
> +                              ".endif\n" \
> +                              insn "\n"  \
> +                              ".ifndef .L"#which"_end\n" \
>                                ".L" #which "_end:\n"  \
> +                              ".endif\n" \
>                                ".popsection"

Nice idea, but why multiple .ifndef, and why emitting the insn even if the
labels are already there (and hence won't be emitted a 2nd time)?

Further, if the compiler unrolls a loop and instantiates such a put_insn()
twice, it could pick different inputs (where flexibility is allowed). Most
present uses (including ones I have pending) meet this requirement (i.e.
permit only a single register per operand), but vmovdqu{32,16}_to_mem,
evex_vcvtph2ps, vpcompress{d,q,w},  vpdpwssd_{vex1,vex2,evex}, and
vmovsh_to_mem don't. {,v}movsd{,_masked}_to_mem, pcmp{e,i}str{i,m} and a
few more could also end up being problematic if different addressing was
used for the memory operand(s).

None of those sit in loops, I think, so we may be safe. But the constraints
need properly writing down in a comment, I think.

> @@ -5248,7 +5253,7 @@ int main(int argc, char **argv)
>          memset(res + 3, ~0, 8);
>          regs.eax = (unsigned long)res;
>          regs.ecx = ~0;
> -        for ( i = 0; i < 2; ++i )
> +        for (i = 0; i < 2; ++i )
>          {
>              decl_insn(vmovsh_to_mem);

Excuse me?

Jan

