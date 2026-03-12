Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDDvFTFksmntMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 07:58:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B226E1A9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 07:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251714.1548601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0ZzN-0002aU-6M; Thu, 12 Mar 2026 06:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251714.1548601; Thu, 12 Mar 2026 06:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0ZzN-0002XT-0w; Thu, 12 Mar 2026 06:57:45 +0000
Received: by outflank-mailman (input) for mailman id 1251714;
 Thu, 12 Mar 2026 06:57:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0ZzM-0002XN-2J
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 06:57:44 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfcb0dd5-1de0-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 07:57:36 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853f2826f7so5422925e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 23:57:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe19aec5sm5513192f8f.4.2026.03.11.23.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 23:57:34 -0700 (PDT)
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
X-Inumbo-ID: bfcb0dd5-1de0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773298655; x=1773903455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4JY9BJ/9d+xdQsZgGB46qGlBtAWUT1DQpKWqvJ5veII=;
        b=S6cj5je2C1HRdv6gqCUhczAWvBck+iECUVaYYm82OdvHLXWSR7HkfPATOGGRE/zrit
         cbulWD2G1L0v/a5l9vLoUyF4FdujovZw9ez2p54aQRSLUBYFgGYLkLsJHMqFVbLgW0yx
         01D1Hl2zeEd3IP95zqF27oIqBSig49ENPrYNJGQ0b8dfSNJ0BY7TibZjAAmPtyK9M7YJ
         OtzSdmYA/TxHtFJwE5TTuDGrH/3n6XUWpbnCHq54wOnIGPLBewmZkXg+sSB2lKdZBXoC
         CsC7CtWeoHb+z7iDNdVCu0hNc5eO+xnSUo+x7zFAiElHUjP22WktoGrDTGaWYloZl6LM
         b6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773298655; x=1773903455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4JY9BJ/9d+xdQsZgGB46qGlBtAWUT1DQpKWqvJ5veII=;
        b=vUxAFG0VtE0Lepx2gi+gqv6f3AaZSQ+qEtHQ8K4uV4mOyXbShxMQ72bikyJxMkx/j4
         kN3nXRm2W6mzSiVwKDDb7r3FnUTmDmL13UGC92tPogbpbqXY42bwMvkj7hWU8gpPzC7/
         gRWo69/QNgfBYkf7tOS7GXOagasa4o+ome093EpPtd0pcfqcD4zQgv3cFLYW9FnzotKc
         cnTQ/WGnHa6xqMCN/R10SQcbpSxnQCnuxjyQxH+W8u107iLYIBgNMN2rl98KwOyQHoLI
         uGSpt1PUbuUe59CikAep8mNFnISg1N6Ht9sA4FQgmtLmiXDxhXZZ8u3vAayrDL2GUy7u
         nvvA==
X-Forwarded-Encrypted: i=1; AJvYcCWi8vxpLb8gMTvBuUtksjHbA9ABncPfex/us9cjJMGuk6R75WTuXAJn42cBf0FX4XNcxViaPMBy7T4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt9X0g+mRj1qqsLMyZJ7gSEpEpe2gqqqChFfCevXodQkgcpia9
	KojaKFJuihMmSfL8IuaTfo+0Il196sjSDdppSmnGzN8Yq1pw1wSmix3sf41qee4qnA==
X-Gm-Gg: ATEYQzz708B/jM6UTNM6HkmNRMJPYZDBI2QuarsLc0EjD4bntOQIYIzfqygK0QXiKWo
	6/I+XGprIuqf9Bta8cS9SIEpitsA2/TFXI7bUZKJ32mZ3Lzq0nq888g6skcEsytWQLV9CazyrDx
	Y4VFgSDsAcRgbm9GCEqNHD/P5ag20XJae2ysBnMbRd+0R9knHakl4nyrOR2C5xyv4N+8cALfLX/
	WFUM5Y7urfVwokA45GGtxGRSs/G4Xxpjhl4wu4Ne4XURNjEavOf+CHylFtlNNzmhQ3Ce9ibqP2e
	3qVAkAcuFwGa2vdAaIDTMnid5ejLJIea1YXrNhl5rlFfwc1YgHVcvLN5gqa6pyCCWqihYDN3tce
	9tkTEeogPbXKSK8c8atpzmM2OCABkavO5xwNuPPy+v+fw4wWyWHLw+G+ek45Yd/+ftnrKd9K+gt
	6EsgtolVBk9m2xX3I23gXdbaXHJHdgp9NQzHab7ePha9w1JdTG7i8u/ue2Ji1Mmu6ZMPm2z/2+x
	m3LcmfiS3wnIYJZ+jffp447ZQ==
X-Received: by 2002:a05:600c:3b16:b0:485:4535:73d with SMTP id 5b1f17b1804b1-4854b0a4920mr92305895e9.2.1773298654758;
        Wed, 11 Mar 2026 23:57:34 -0700 (PDT)
Message-ID: <536b659b-1eb8-4bc7-980b-35c1ad6922d0@suse.com>
Date: Thu, 12 Mar 2026 07:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/hvm: Disable cross-vendor handling in #UD
 handler
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
 <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
 <d76d6c2c-b81a-417b-9d4e-07f301e35dbc@suse.com>
 <DH05EHW9PD7C.132K81VFX47GG@amd.com>
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
In-Reply-To: <DH05EHW9PD7C.132K81VFX47GG@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: A99B226E1A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11.03.2026 19:01, Alejandro Vallejo wrote:
> On Wed Mar 11, 2026 at 3:59 PM CET, Jan Beulich wrote:
>> On 11.03.2026 15:27, Alejandro Vallejo wrote:
>>> Remove cross-vendor support now that VMs can no longer have a different
>>> vendor than the host.
>>>
>>> While at it, refactor the function to exit early and skip initialising
>>> the emulation context when FEP is not enabled.
>>>
>>> No functional change intended.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> v4:
>>>   * Reverted refactor of the `walk` variable assignment
>>
>> "Revert" as in "move it even farther away from the original".
> 
> Revert as in not split the assignment and restore the orignal syntax _of the
> assignment_, which was the main focus of the prior discussion.
> 
> It's hardly my intention to add unrequested changes, but I can't address that
> which isn't explicitly requested.
> 
>> As said, you want re-indentation,
> 
> This is an ambiguous piece of advice.
> 
> Of what? That can mean moving the prior logic back to its original location and
> crate a minimal diff (1) or simply collapsing the indentation of the block (2).
> 
> (1) can't be done with hvm context initialiser moving after the early exit,
> which I explicitly mentioned in the commit message I wanted to do.
> 
> (2) can't happen because declarations and statements cannot be mixed (though I
> really wish we dropped that rule).
> 
> There's a third option of keeping a silly { ... } around just for indentation
> purposes, but that's worse than either of the other 2 options.
> 
> Maybe there's a fourth code arrangement in your head that does all this in a
> way you find less intrusive and I just don't see it. If so, feel free to send
> a patch I can review. It'll be faster for the both of us. Or tell me precisely
> what's at fault here.
> 
> If it's the diff, I'll go for option (1) above. I don't care enough about it to
> argue.
> 
>> so please do just that, nothing else that isn't
>> explicitly justified (like the moving of hvm_emulate_init_once() is).
> 
> I'm not sure if you're fine with that motion because it's in the commit message
> or not because it's a refactor that shouldn't be in the patch. This statement
> can be read either way.

You justify that movement in the description, and I agree with that justification.

>> With
>> this put back in its original shape (can do while committing, I suppose):
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I don't think it's very obvious what you mean to do on commit, so it wouldn't be
> appropriate to agree to your adjustments, seeing how I just don't know what they
> are. I'm happy to send a v4.5 on this particular patch with whatever else needs
> modifying. Or a full v5 even. Or review whatever you wish to send as a v4.5 of
> this patch.

The variable had an initializer, and mere re-indentation wants to keep it so.
(There's no question that declarations may need to move, for the result to still
compile.)

Jan

