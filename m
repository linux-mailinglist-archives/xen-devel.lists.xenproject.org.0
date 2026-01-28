Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHUoB+zoeWkF1AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:46:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7F59FA56
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 11:46:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215381.1525573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl33Q-0007Na-55; Wed, 28 Jan 2026 10:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215381.1525573; Wed, 28 Jan 2026 10:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl33Q-0007LR-1v; Wed, 28 Jan 2026 10:45:44 +0000
Received: by outflank-mailman (input) for mailman id 1215381;
 Wed, 28 Jan 2026 10:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3VuQ=AB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vl33O-0007LL-9r
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 10:45:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76ec1e57-fc36-11f0-9ccf-f158ae23cfc8;
 Wed, 28 Jan 2026 11:45:30 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso3593649f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jan 2026 02:45:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce70sm6141440f8f.27.2026.01.28.02.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 02:45:29 -0800 (PST)
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
X-Inumbo-ID: 76ec1e57-fc36-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769597130; x=1770201930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W3tiy3ex+9fe2AdesqmsEFYrWFq4W4hy7sYh60ga0Ro=;
        b=UKgcWiu2we/zzKunRKnjjmfQ0bNRE+1ZFMD13eZ51FXzSIpGdThLcn/MnGMl5SohHk
         uLmiir5ngU/EAGJkwa02Spgn5Bjit7Jc/3wEAfR1nEB30x3XaCYVhkn8dYgDlqkSKFS/
         Nva2RzCKjl7068OLjFezW5upGSkrS/2OZLxzIQlFDQx3KaM76VWbtYrhOKhulHkNH3Y9
         YawmDQyLjc/1PaWhti7Ig1nAw67C94z/XhD6lfOThMAp5w1vsFPO3Pto8vrLJ43HdPOm
         j9j6naRAvIWhelUuDvziL4W3A4JuTC0qr7RtUPFKimvaV+ZVl1J858lGq+0YnP+XRihR
         iCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769597130; x=1770201930;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3tiy3ex+9fe2AdesqmsEFYrWFq4W4hy7sYh60ga0Ro=;
        b=pxVFBZt9Hk5rZQX0+C4Y6rBe5f/0NCSTO6U5OlK6FD0v96ss7edG2HxtzaxbEn9p+A
         ESakWOvWYwRD6Op5BsIqlSnuksx/eNr9xMMAvHjnJFQgZ9kIBzkihxEEM9/weGwGp+lC
         PfyFKMC3nysBB5OqeQc7osgHJGvyQVGa/5ONmBkD9c6WnOWCWru8PkTHav16mFMr2Yn8
         yQ2XSVRWMJhYg7uY9LC4pk4KM46zhl2JwidJRX8qsghM1mZte/LmfmB5sVT/uxxRXLHN
         znZBjOxvU3FaG7ZyQGwhA+M68n8zBa7/owG27SNheXWwkffKN8E8/PAxSlTi0RTdwuv1
         P7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCW07SOgR2JL+IX33Wiag+O7zISCbCXoDEhsjfV3HbO5PpKUezVCu0YopD4fo3fZ/HnMb1OqZaZZb6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLgwhrwxXPOwj1Qecu/nQtNG98rstI5Or/uEbvewDZ9VsyAw1d
	zvr7bvth3buY0M/QXo78zcJaybh9y4HLZHDC57OpuZtqol+6enS7g4qch8jG6mVx0g==
X-Gm-Gg: AZuq6aKZUrZDOjHOovad7F1o7zvFKlBKO71pkvGNHDqYkAfByM1V4XfRfq4dFmj3mIG
	WVqChW4KPjKwf84k+XNcQaTawsUt/1hMSpBwCDl6/9uZTJtn93JkMOshN7IDgXB8GblKi38KyZ4
	iAYn9g84vmUNd2ZapGxKMJb8J3SvjtWJGCPLHh1rUT7BZ2zpGxzS3F62VACkm1bg9RXo1Uozxd8
	Kt980mdhUNAhx9jn4IgM7OaaYSoeDpypeK2LRz3JZkcHbhpOxMfqSySp+k1EoD5BGewxUSnkKsi
	YU2o8jO4doo+gbthXv033rV6Ir+DZGda9nmj0LvHyEp7JGi1nmKRzkmYiWiL9HfiP+R4cmlAyQ1
	9D8u5be+dgpf4GDdE4JTaEB79Lkw70YtIQKub8v7yt8bVEWOPEEgADHEN7NLIPfnK94B/mHFRYa
	5k7JfU4s1iWyUa84c8BtGoKp+xguQTu+JNRkQCNnLQm1U7fcc3kC3iqShJM0QMjX4sI++9mfZpS
	fY=
X-Received: by 2002:a05:6000:2511:b0:430:fdc8:8be3 with SMTP id ffacd0b85a97d-435dd0a34c9mr7495184f8f.29.1769597129751;
        Wed, 28 Jan 2026 02:45:29 -0800 (PST)
Message-ID: <ace6c97f-aeeb-40c9-9c0b-d6ad45fe09d6@suse.com>
Date: Wed, 28 Jan 2026 11:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] CODING_STYLE: Establish a policy with regards to
 copyright notices
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260127182403.141459-1-alejandro.garciavallejo@amd.com>
 <b42af5a5-6237-47d2-9b74-0154ef8c2020@suse.com>
 <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com>
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
In-Reply-To: <DG03S6HP7OIO.18ACUNFC24X1Y@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6E7F59FA56
X-Rspamd-Action: no action

On 28.01.2026 10:09, Alejandro Vallejo wrote:
> The refinement also applies to the second bullet point, so I can add it as a
> separate paragraph stating existing notices are to never be modified and only
> removed with the express consent of the current holder(s).

That's interesting, as it may be getting increasingly difficult in practice.
Often you can't get hold of the holder(s), to the degree that - as we're all
growing older - at some point they may not be there at all anymore. Yet if
not having such notices is going to be a goal of the project, retaining some
indefinitely can't be the intention either.

> Do you have a take for/against moving all existing notices to a separate NOTICES
> file (a-la Apache). The existing file for them (in httpd) looks like this, so
> they took the liberty to rewording the banners to be more digestible in single
> file inclusion.
> 
> 	Apache HTTP Server
> 	Copyright 2026 The Apache Software Foundation.
> 
> 	This product includes software developed at
> 	The Apache Software Foundation (https://www.apache.org/).
> 
> 	Portions of this software were developed at the National Center
> 	for Supercomputing Applications (NCSA) at the University of
> 	Illinois at Urbana-Champaign.
> 
> 	This software contains code derived from the RSA Data Security
> 	Inc. MD5 Message-Digest Algorithm, including various
> 	modifications by Spyglass Inc., Carnegie Mellon University, and
> 	Bell Communications Research, Inc (Bellcore).
> 
> 	This software contains code derived from the PCRE library pcreposix.c
> 	source code, written by Philip Hazel, Copyright 1997-2004
> 	by the University of Cambridge, England.
> 
> It'd blur the scope of existing holders, but code moves and so do their
> contributions. Keeping a banner on a file after a refactor is just
> misattribution.
> 
> ------------------
> 
> In short. There's 1 question in 2 forms I'd like to have an answer to from a
> core maintainers.
> 
> Would you be willing to ack a change along these lines?
>   1. to a Copyright Notice policy within CODING_STYLE.

Likely, once we've agreed on suitable wording.

>   2. to the relegation of existing notices to a NOTICES file in the style of
>      Apache. Apache in particular mandates the file not be touched unless
>      absolutely required for legal reasons.

Very unlikely. While likely I wouldn't veto it, I don't like such moving around
of things. If we want to get them out of the source files, they should be
dropped altogether.

Jan

