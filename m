Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A372496A07C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 16:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789286.1198871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUVU-0002WQ-Hl; Tue, 03 Sep 2024 14:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789286.1198871; Tue, 03 Sep 2024 14:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slUVU-0002Ts-DJ; Tue, 03 Sep 2024 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 789286;
 Tue, 03 Sep 2024 14:27:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slUVT-0002Tk-Np
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 14:27:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae1f9d28-6a00-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 16:27:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a83562f9be9so508895666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 07:27:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989226fa9sm688517066b.214.2024.09.03.07.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 07:27:42 -0700 (PDT)
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
X-Inumbo-ID: ae1f9d28-6a00-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725373662; x=1725978462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GI1EnfvRjjrH9mWiP6Ek9wLF1WBYWvhs2pyAfqs/jMU=;
        b=Eer3/SlTIUgN/3Pvy18guU0+XFNvGBpcYsywQTaalr44FWeVSx/oj2eosbpbOTARm6
         XtJv+C1EOswM1lun8y7ydTrmIkAQyvMvWQFuB2dMWxKWMkdd9kD2yRDBQuY/xCrptUaD
         VnYJ5QrT85DL5WJXvNoWNXbVDoGuGnXSO4zrcJcxHdhhKTANyowOnAabWy7+v0aRB3Gg
         4U9RAqkFkRprrTv2KzEN2K2xRFMlH1OtFIRQ2RNRS+aeXl/HL4xPLI8VslnqYro1hPgX
         lu/xyH+XlMdPzUp2qq11ySAjGfAhDctvufkoaoKILy6oA/eGNSAXojI+14FaO0NPojra
         jJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373662; x=1725978462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI1EnfvRjjrH9mWiP6Ek9wLF1WBYWvhs2pyAfqs/jMU=;
        b=bgpA5r6DBy2cJFAfW1CjLLG77CgbxKOuXsYaX2XFOSYtwtsPYALRL1EQT8SXveTyYE
         EOZBGirETyInfKvqCBLYUER5n//CquSl/vXM2JVTARDCbyAhoKUnqcTJywqfxnNKT3dS
         tjjFWeSgGRZMXeZa3sz6+8siuHZs/1E2aOKXjqW7jWP+aVzZa/sZB2JZJSzCrK5nVPTc
         ETag8BHljUEu6Xr+phq960Ekiedl99uE/YLRjuy3W1FQHyoRUi76+gR8mGDnfGndIqJa
         jSJOfN37iy/pav1pUhStWJvTVcNxQB9TVY50nsWdsBVHlttJY8/CWRW+9SOIPsWy6tu/
         zhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUidcfdi8Cs0i5GSUFFdReErUQvthbhXrJ3giIqVwwtYG1vQaRr+Rqxsdc278cWpJYZfNDkoleCyGk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEhjh3pNQcaXITqGIexgcX/bSXuUaMbb3VcAzvj+mC7g2rmTR/
	kavQ6Zu9S+3vANJpI38Mb3uuT5l3wZB/Iz/lezVt5Em0mNm6w0GXrG7g9kVFNQ==
X-Google-Smtp-Source: AGHT+IHkZK/NM/av6FlXtrNasmyJ+tajq5yGITlELfahCBdeoNFThJ5Z5uakogZyNnhxSZdfDTOR0w==
X-Received: by 2002:a17:906:fe4b:b0:a79:82c1:a5b2 with SMTP id a640c23a62f3a-a89b93db796mr806231066b.9.1725373662233;
        Tue, 03 Sep 2024 07:27:42 -0700 (PDT)
Message-ID: <572afd4b-e448-4c9c-b444-4369ea9294a8@suse.com>
Date: Tue, 3 Sep 2024 16:27:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/shutdown: Implement machine_{halt,restart}()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <3d32a952c7cc77fd759e211c3b60427485a75582.1725295716.git.oleksii.kurochko@gmail.com>
 <20240903141937.3552353-1-andrew.cooper3@citrix.com>
 <f22e08ce-e51f-418d-b833-59778eb21865@citrix.com>
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
In-Reply-To: <f22e08ce-e51f-418d-b833-59778eb21865@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2024 16:23, Andrew Cooper wrote:
> On 03/09/2024 3:19 pm, Andrew Cooper wrote:
>> SBI has an API for shutdown so wire it up.  However, the spec does allow the
>> call not to be implemented, so we have to cope with the call return returning.
> 
> Sorry, this is supposed to read "... cope with sbi_shutdown() returning."

And then perhaps also ...

>> There is a reboot-capable SBI extention, but in the short term route route
>> machine_restart() into machine_halt().

... one "route" dropped from this sentence?

Jan

