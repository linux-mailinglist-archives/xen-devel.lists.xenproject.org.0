Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJJxEjkChmmyJAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:01:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9CFF645
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 16:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223315.1530868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNJm-0000vA-8e; Fri, 06 Feb 2026 15:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223315.1530868; Fri, 06 Feb 2026 15:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voNJm-0000sJ-5S; Fri, 06 Feb 2026 15:00:22 +0000
Received: by outflank-mailman (input) for mailman id 1223315;
 Fri, 06 Feb 2026 15:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1voNJl-0000i8-Je
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:00:21 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8de9ce6d-036c-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 16:00:19 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so1475294f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 07:00:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4362974b230sm6854108f8f.36.2026.02.06.07.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 07:00:17 -0800 (PST)
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
X-Inumbo-ID: 8de9ce6d-036c-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770390019; x=1770994819; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RP2INcmEyQltmh8qokURhnVGF/ErH15/ysKuOOI5YeU=;
        b=NPzcvf7KVUOZMJarDN4r1mdU0KGFiqiFBNt2tTwjegvyn946YSB9FkobkdPlSJecOU
         tkdr+5FfFwUSXx5xdyrZFwp2Fj3W90NlwwW0E4yPxVnHIqBKtn9YH1OLruwPMrOGuTDl
         dFPMD7N2jVaMLtnt6j3QCw+kluURigwrSjQjE56hGmlCWgWu+r+ZKG8owjkGcAR16hhi
         tu4Zkp/qHWFna2iaGZ2TTug7CJ8QJbIzCwyoArMRo7zVMaHOJErZtSupkAilL9gIwyxM
         n8NOSvG2eDB0MaG/wVoSvmh3dAPIs9LulsHbu2SvW4CFXcUZAKs2hHnRYe57pYWnkZfF
         tc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390019; x=1770994819;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP2INcmEyQltmh8qokURhnVGF/ErH15/ysKuOOI5YeU=;
        b=azqboE+wx81kUkmcobegfJGSmjC/C2SZamiarRLw04GnX/DP/D/gtUEUmo1yZ4NnM5
         hR49ItSR38tF4VGpUSjhNlqXoCw9UU2kA5KJ0kQkNN+UYCydgl47spJNUVkAGKykEGyQ
         4H2bWPnY3g5KLXIQrSI12zGyq4n1XDg7hDrTlhHKCYQVV5rhF7HveX/EzqOMbx77Vtaf
         uru2sSuFXGUPCL46He+JnNXgY0U2o5/Hu5bUMO1Whi4i7mV9YGyrQq4jsXSUPg711HQQ
         SvzVxzJ/aXLvEEAPs2rP3+vFU+HBt/mgYnLjb+Fg1q1uFUJ19Dqog9N37/VabVCXJR+f
         jJew==
X-Forwarded-Encrypted: i=1; AJvYcCVNoZo12cM0BSvhkq904Hh/xCZQRNO+4CPqiQbXAIdRDI24wHkuU0eNGqE9S+2rG96dPGLI0ITN7c8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtNr4Fq7IAVP7HB+ozfeo8SgxjxxHUGGb5j3D7W5QG0AThL/c1
	HUMQUrZAZt29ybf0YldU8/eA8AN1a/Iqoj+V3pPyCCoqZUCaUCx6GdqJcMwkfuoHtw==
X-Gm-Gg: AZuq6aLkQwn8mcgjGVyZAkPU0cZOQZ0FM75KlyhUweAvd3XRbxqvJEttj39yrZO+Vyj
	yWHqF/nLxEd5QGNEtnFCc4sH3A24abqKMKZqGALHnXhEnGI4uVSe+CKxbgTshDECYWBZOJSvAZR
	jTvUAHJfXdUG+n5z8GPkOo59ureLryGQIN6Fzad/jC+yhHKDqveWdW0z8mGZsjt3bJ9WMJvhXIX
	FQQO36N+68D8mDh4OE40M9y4kTVoxy6rSUl/GY6nEEhZIXHztK1MHas9JFv+7dyuZ+MqI8ASmi2
	uoYq7mUcym3WndLRuRxTyJGK8RP8SinB65iU0W2mqcdihXaNXtwHTCxTz8uDH1ycx1+FM1ZXwrl
	HPnfsXuNxN5sr+XAA50EA06rMt7IjNb6/P5c5V/Hk6/FlabX5Rz8fWw38+NYR9HiDC9e+K8yXgm
	dnTtrxf+CWwwgb+skkkyJDZKOp0DHpTFT+uAMJfqDqtySAakIJyDP5nRg8/EhxFFWT3IEL1jIYl
	D0=
X-Received: by 2002:a05:6000:3104:b0:435:e3bd:5838 with SMTP id ffacd0b85a97d-43629659095mr4380062f8f.25.1770390017717;
        Fri, 06 Feb 2026 07:00:17 -0800 (PST)
Message-ID: <3c6fc5d9-dbb4-44f6-97fb-85095429c7d1@suse.com>
Date: Fri, 6 Feb 2026 16:00:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Add Darwin.mk for GNU toolchains
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a3837d27d473763a667596841754398e7d67df46.1770365754.git.bertrand.marquis@arm.com>
 <4bdcd7e0-ff9d-4bbd-8337-aa80d7d66ce9@suse.com> <aYXsvu3HlPuCUuY8@Mac.lan>
 <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
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
In-Reply-To: <16ECC44C-5C56-47CF-8AB6-DED34990C5B1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Bertrand.Marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.994];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 33A9CFF645
X-Rspamd-Action: no action

On 06.02.2026 14:34, Bertrand Marquis wrote:
>> On 6 Feb 2026, at 14:29, Roger Pau Monné <roger.pau@citrix.com> wrote:
>> On Fri, Feb 06, 2026 at 11:38:02AM +0100, Jan Beulich wrote:
>>> On 06.02.2026 09:17, Bertrand Marquis wrote:
>>>> --- /dev/null
>>>> +++ b/config/Darwin.mk
>>>> @@ -0,0 +1,7 @@
>>>> +# Use GNU tool definitions as the tools we are using are either GNU compatible
>>>> +# or we only use features which are supported on Mac OS.
>>>> +include $(XEN_ROOT)/config/StdGNU.mk
>>>> +
>>>> +# Xen uses Linux'es ABI so we are cross compiling on Mac OS.
>>>> +# Force COMPILE_ARCH to a fake value to make sure it is always the case.
>>>> +XEN_COMPILE_ARCH = Darwin
>>>
>>> I first wondered why you say "fake", seeing the file is named Darwin.mk. But
>>> in Config.mk's cross-compile check the build host OS doesn't even matter. So
>>> yes, it needs faking here for the time being.
>>
>> Hm, setting it to "Darwin" seems weird to me.  I understand the
>> purpose of this is to force the user to set XEN_TARGET_ARCH
>> explicitly.  I however wouldn't see it as fully uncorrect to not set
>> this.  It will then execute `uname -m` and get `arm64` back for Apple
>> silicon macs (which is kind of OK?).  Other I suggest we use a non-OSX
>> specific value here, so that if required we could distinguish this
>> case where the user is expected to provide XEN_COMPILE_ARCH.
>>
>> Maybe XEN_COMPILE_ARCH = { unknown | undefined }?
> 
> I am ok to change this with either but maybe unsupported could be
> a third choice?

If I ran into "unsupported" there, I'd wonder if I even should trust any of
this and try it out. I'd prefer either of Roger's suggestions, in the order
given.

Jan

