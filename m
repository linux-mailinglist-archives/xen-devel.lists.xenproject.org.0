Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F4A9850A
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 11:12:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964295.1355134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7W9k-0000UH-Rh; Wed, 23 Apr 2025 09:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964295.1355134; Wed, 23 Apr 2025 09:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7W9k-0000SY-O5; Wed, 23 Apr 2025 09:12:36 +0000
Received: by outflank-mailman (input) for mailman id 964295;
 Wed, 23 Apr 2025 09:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7W9j-0000SQ-1o
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 09:12:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a92dc2-2023-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 11:12:34 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso65894445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 02:12:34 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bf2csm18246392f8f.51.2025.04.23.02.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 02:12:33 -0700 (PDT)
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
X-Inumbo-ID: 17a92dc2-2023-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745399554; x=1746004354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=910FBdwK5tad6IF7SFZqo3rmzRJjC91kHmQPfNmFRkw=;
        b=u50+BH+psGJNxyhzlncwsjtiZ3Nr3mM9p4QmIa9kGVsJPOqQzu+Aos3/oYrBANOKVZ
         MEqEoUrjhI+IuzZhh/JEkYKBBcd8OvNLLUnC34wIKSsA7Si+fGUFtd4VRzsg6rShMQz8
         Wjbh6A8q2dGq915PFKeAvS/4w2zjH+OhRbPbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399554; x=1746004354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=910FBdwK5tad6IF7SFZqo3rmzRJjC91kHmQPfNmFRkw=;
        b=h33ZKKrx8EzT0JH+nlnZ59QtAfzfRj5gyZcGFX2t3z31lhpOnigZ+5NtgioJMQii0I
         Xn9jyFDdE7NxJBHU/OtWP4eZmpj8LF1i9Q3MN3fjb5t1Bab/1LhCclri+F103hQoBYNp
         KNcw4P3tAodTzvSJadoXHkARvJBwXorf+gqX9Xsr26F1x18bFEY6NVoDlAep0iVCwdj8
         weEU+jCJOTDOQ1LbiC0jmbvtfpJcDUn6lSFpN2SCaAXITu/DFOUdla5FGsgroLGu+oGr
         O5CEohwhEEeZFa2i/j3QAUjsQ1oHkQhQ37uLYDgjSjhiazQLgupWTB/5Pseg1zvv5tcl
         pz7A==
X-Forwarded-Encrypted: i=1; AJvYcCW+6dXOFOpaRqxKRkMnQXsc1nKHgvvLxfimQ496wRnu+PStGumfueFBbm34gz19RmfmMpMryHgZuTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/sLOIyo34nV6p2I3GcgRrePlHIbd5gPlPwPYZ8QkD4BfWyg5k
	rWa/dz4l0Hy5vw7u/0Fasr8e9G5X0K6MwV9F5HSnOGME6GFkwndj1qNPq9/CMSKcdOdLZedoXkj
	/lfM=
X-Gm-Gg: ASbGncvqyhwDOrPCGD+TyXZtrUg8W7kcqnPjUz8Uqy31h9jLnCpH8bhoNfsRkQUeqrU
	rNw3s6s5JrZenOtxjayBa7Xm/jDHBRozacJMYdwNrg4mXFIbx9xQz5EnCb6AkyUIy0Pbwpo0H0T
	DM2mS98z/5sNWqaA25r94hBFtHuQJ7eJkA5FHQwSmPYuS/8hQ7M+w6t1D/sYDC4RBf1/eKwOzOV
	PGx6elH3+aStWc8TlUWVClHHFsRquFqW0UFg+gPVQqTGYRgomTsbpw44kwhLzZnU22KF2xQq7G1
	7SsXVros7Y4nRF3EBBiyqKmY1IrEjrEvE2S/fMqZKOFLeLp13XmhlyFKldD6LSaw
X-Google-Smtp-Source: AGHT+IHrdQtHjXuKhJcCw0lLp/vizyhu8UooGQUHcfMq9LnGWsowpJl16giLT8Kgg787H3MROy/hrg==
X-Received: by 2002:a05:600c:4708:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-4406ab97c6cmr160971385e9.12.1745399553725;
        Wed, 23 Apr 2025 02:12:33 -0700 (PDT)
Message-ID: <3fec2a20-62f9-469d-9a46-cc0030356b32@citrix.com>
Date: Wed, 23 Apr 2025 10:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] x86/altcall: Switch to simpler scheme
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
 <20250423010237.1528582-8-andrew.cooper3@citrix.com>
 <e90b8723-3c15-4488-bc7f-b765dcc92ef6@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e90b8723-3c15-4488-bc7f-b765dcc92ef6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2025 10:01 am, Jan Beulich wrote:
> On 23.04.2025 03:02, Andrew Cooper wrote:
>> --- a/xen/arch/x86/alternative.c
>> +++ b/xen/arch/x86/alternative.c
>> @@ -378,13 +378,6 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>          text_poke(orig, buf, total_len);
>>      }
>>  
>> -    /*
>> -     * Clobber endbr64 instructions now that altcall has finished optimising
>> -     * all indirect branches to direct ones.
>> -     */
>> -    if ( force && system_state < SYS_STATE_active )
>> -        seal_endbr64();
>> -
>>      return 0;
>>  }
>>  
>> @@ -533,6 +526,8 @@ static int __init cf_check nmi_apply_alternatives(
>>              rc = apply_alt_calls(__alt_call_sites_start, __alt_call_sites_end);
>>              if ( rc )
>>                  panic("Unable to apply alternative calls: %d\n", rc);
>> +
>> +            seal_endbr64();
>>          }
> Are you deliberately losing the comment?

Yes, counterbalancing the comment gained in patch 4.

>  Other than this:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks,

~Andrew

