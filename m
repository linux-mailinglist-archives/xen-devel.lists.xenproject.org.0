Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C34B306B0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 22:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089277.1446912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCDh-0005R9-LC; Thu, 21 Aug 2025 20:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089277.1446912; Thu, 21 Aug 2025 20:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upCDh-0005Ob-HL; Thu, 21 Aug 2025 20:49:13 +0000
Received: by outflank-mailman (input) for mailman id 1089277;
 Thu, 21 Aug 2025 20:49:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1upCDf-0005OV-H2
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 20:49:11 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 493963dc-7ed0-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 22:49:09 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2f0eso784275f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 13:49:09 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c5510a646asm2143868f8f.15.2025.08.21.13.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:49:08 -0700 (PDT)
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
X-Inumbo-ID: 493963dc-7ed0-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755809349; x=1756414149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PO9AKecNQMNkQyfvwWq/zSIuH0pCd7e9grdA9gdNzfI=;
        b=faeq//rqFVAfPtm9B41S5JwfsFvJSfniTiL+S4n9RKHoTENzBCs8xkmvtER9tVwXhG
         sqjkQAOvnwGx4tBz82fbZ5t0gZrY468b4BR9+DVyHdF7QTIzt20grIhyaLh2eK5ctAI7
         EkDpwcesEk2BD5eXu6CzoWK4HwY896MQ4AOoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809349; x=1756414149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PO9AKecNQMNkQyfvwWq/zSIuH0pCd7e9grdA9gdNzfI=;
        b=OKt7LRAcvSIsp2wrApG1S8UOS3kXourrQM0wiYo3zPAYVtggHRuxWv8Ti5ml9beT+A
         HN1pmfjshHgA0sIXip7cq7o1ndiKQTKOEVlqjgSpQTWUd7vbDDH9tAyd47mD5neUzr5M
         fQHU+2S6q1yteFRY+OxFA4m4Ze0P0jxjnAp3elggIBomoD+t/dlj6cpwCsm4L4sorjXo
         BY0LLr/tNFBAnTWGHlPQw27DgoSOgGjCHJ/hCYXQtIocyQXh6TGzjuWOsQVUizEyRQXo
         Xic4Mf23nAoOEGIkeW1Ka70wtRo1vqHC0XZeLjILWoWUFivLNmKHiJ182gIATPFA3z/q
         VJbA==
X-Forwarded-Encrypted: i=1; AJvYcCXxHmYVQw573FypALK0YX+jHfYp6YSAoM6n8XGL++NCUcJKbjAi/GqRueIuhBxnrBVALss9HFTH5sA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8AiorRtY7zz8vyoQJR8L7i/Z0KZSDAOdkRr+6sZkRiR01nVLg
	wNohObIbNe4DooeORf4kJ1+reYH9xuQSKpRav6BGpWQLqnmyb04vIU+S4Nh9qUM6BwA=
X-Gm-Gg: ASbGncv4kxVYh7cKxwDJxpaqIsuoNdHr9XRTolQeWyEAjsqqRGo9QHOcH22ajeMYKzR
	0e5GWZwp7UGP66ACG7LBnIXO8b8Wk09H6jhU6dnKgV7c8H7bI2F1m5Q3Ci1U5WTy72aTwPuoGxk
	JEq8CW4iTLV0xFSKw3udzu/g/o3nkeF2WMwc3zfbKN7mKZD8PYVGebOOH9EcnlDNRCTzUUoBGFr
	OmkwXeEzWUaGm68ek5xsPtlyH1fs7b8ZoTnUDo/effQwFLHgb5d7r+MFRvGc7+DRjQuQt038MVD
	Eu/n+xJA4Bet46pTSzns3Cpmuuj1SNVKIRHeKUvBW3DyuFqsYobwXTOMEd8pMonNJL4zZwEFd67
	NRuyqfSYsoG/G6bC68XZ3tfPZNFa98NfcQcxw3EmoQgLauD2iKTJTUCl5fFrwD8Squi+pDjq6A+
	5hD24=
X-Google-Smtp-Source: AGHT+IGeqz6h7cPIydMTISrflRk73Ip/39WUuy4eO1mRXPfROdIUqDYKJ3Nd9/HHhwywv9iRhspSLw==
X-Received: by 2002:a05:6000:420f:b0:3b9:53c:24a4 with SMTP id ffacd0b85a97d-3c5dc734905mr232908f8f.39.1755809349038;
        Thu, 21 Aug 2025 13:49:09 -0700 (PDT)
Message-ID: <3a980515-564a-4fb2-85e8-9ee9afd93375@citrix.com>
Date: Thu, 21 Aug 2025 21:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] x86/fsgsbase: Update fs/gs helpers to use
 wrmsrns()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-16-andrew.cooper3@citrix.com>
 <ae2e8b69-8251-4f60-a5ae-f6bfe413aafb@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ae2e8b69-8251-4f60-a5ae-f6bfe413aafb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/08/2025 2:09 pm, Jan Beulich wrote:
> On 15.08.2025 22:41, Andrew Cooper wrote:
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2733,8 +2733,8 @@ static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>>      case MSR_SHADOW_GS_BASE:
>>          if ( v != curr )
>>              return v->arch.hvm.vmx.shadow_gs;
>> -        rdmsrl(MSR_SHADOW_GS_BASE, val);
>> -        return val;
>> +        else
>> +            return rdmsr(MSR_SHADOW_GS_BASE);
>>      }
> Here and below, can we please do without the pointless "else"? Strictly
> speaking in Misra's terms that's "dead code" (things working identically
> without), and I'm quite happy that I can now use this argument to
> support my personal antipathy to this style of coding. Or else use the
> conditional operator in such cases (where applicable).

No.  I have always, and will always prioritise readability first and
foremost.

I do not agree with your interpretation of MISRA in this case.

~Andrew

