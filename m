Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBPBKM1Q52lW6QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:26:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596343977A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 12:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288811.1569052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8Iy-00073u-Sy; Tue, 21 Apr 2026 10:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288811.1569052; Tue, 21 Apr 2026 10:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8Iy-00070q-Pv; Tue, 21 Apr 2026 10:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1288811;
 Tue, 21 Apr 2026 10:26:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF8Ix-00070i-9d
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:26:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8Iw-00BiZU-MM
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 12:26:06 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e750ba-e002-0a2a0a5209dd-0a2a4504b67e-26
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:26:06 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e750be-1dec-0a2a45040019-d155dd32c153-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 12:26:06 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so2378287f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 03:26:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4ffa8sm36112655f8f.35.2026.04.21.03.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 03:26:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1776767166; x=1777371966; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BbRLHLdW0tSJiPhfulYap5Dp2mQa0kMGShwBkPU6auc=;
        b=c0kBnE8jg7hrQKrurgaw+IDhb3KLZwgRs0N/MO8tiIf9nLnTpNvLwt+HpdKTW2Vwle
         geGiEAcYdQQTA5j2EiBD0G2xB/nTK7ww+9k/J7pWj4mJpPSKYO34JODpUixbi234cDC0
         fGuSXBXxzmMoDJeQHQYTjmO9RgHEWL+QzcE0A2XnipBY6VNfYSK0ByYVk2DY3bKPGQ89
         yJYwwNWZPX7IsfR1Ca+1LCD9v86KfREk1a45IMZJm9aQuxLDBRUo0HETciMtmLXlaW/P
         LJeFgDIMGYvMbSm7uuKjpCvMBDfPY2e0/nIBYeHttS1wsFJPFioAl0et8Tx6B4KmgOyg
         bjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767166; x=1777371966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbRLHLdW0tSJiPhfulYap5Dp2mQa0kMGShwBkPU6auc=;
        b=RZr9XxrY+byY8XfaKNomRgbZr8kRTisHN3ouQx0z3IK4Iic7Gvw5uMxHLQwiK06+gE
         Yg08MZD0lAJqhhTXZTZFa6XntLDOTIsHcDsRRgXxxQIgSA93a5J36HOH0jEkjfDmF3O0
         eRdyKnpE2hOHetuSFj8rw3D3HRCRLWo6bWxVXrvdE02lfEFJJANFDWG131D9uk6mYoy4
         Jg+zUF1pIeNGLihCHri/xFst4yMUugv3hmcY/V+iSYEjyA5yklqp2mGYrwm+i247XtN1
         4q4zt4NW1b5WushBh3iF6F2bunw2Ra98Evk5NJ//YZz3Ix7nffPKHff68dspyGTY3vu5
         o6dQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Jq4Qd4YvEUDG7mHZVL9gFnb9KDcO29CoilC0zEtKXhfDZGev3OlstAZwAYlOOzCW2AkuUgB1hXk8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzb8jh8cHW2Xa4ugpWAa7bjLX+jfvICoDXw5UqVNu+XSvL7O1jp
	xEv9VOBKjoQUU76WyTplCuUaOm2y/NLjS1DKxbBySBgXSC2NdiB70/egiPjBrpOReg==
X-Gm-Gg: AeBDievlTjlFYtWCcDmc8/BqNwcFSS2pT777SCxLWBzv9XI9gO+tHYLXxYWwLh6jqnH
	me3pv/OYaW8AbVxh0C2Dgg0jSmArh6uunJRaYMixh+eVFnQdc00hihqCPQopoj1VVlOQrI8EsHx
	8P0Yy8q80xn78eklk4Zmq47OwbLXBOtmEmJRrT7gxbyMXCgkCdYRnglh5vO8oL4rjsCjRp/viK1
	W/a20RkNsNvWoudiM7fyUEfuSD7AyuDlf2i9DBZ9oaDKLwjKUYYCz7JMGJXXfQTMPAw+fzDQbOn
	bMNJHwC1jSYPZoelkngGsFWgDAYn9jaj2RNlGAIVKrFpzQj0EMMGcktbQ4OSBUeTaKwGj950NHl
	aHsYvTqHLc+pDPwS1bou3uT8OavBurh3l3wE1oDuGP2j23FFxMwQbzOCNKViEJRJ/b1/LJ7mwkV
	lIiR2/QQ/YMXmy/wkRp0XoWqGFNyeGGW8Tu/WjQHw/AyK3ZyQv9/y7IIltGraNk9fC7JRPJDrOj
	A4JPNQeQgZpgLog6AeR/cLx4w==
X-Received: by 2002:a05:6000:2888:b0:439:c299:4d8f with SMTP id ffacd0b85a97d-43fe3dc61e3mr26209578f8f.17.1776767165814;
        Tue, 21 Apr 2026 03:26:05 -0700 (PDT)
Message-ID: <287cbd05-869d-40b2-b4c1-179f44534fff@suse.com>
Date: Tue, 21 Apr 2026 12:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH Xen 4.20] x86/apic: Fix asm() constraints in TMICT
 calculation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260420174605.706329-1-andrew.cooper3@citrix.com>
 <85fa4bf2-e288-4376-aa74-c3aef511c2b6@suse.com>
 <e7257423-bc5e-4a71-9c23-d9b939464b67@citrix.com>
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
In-Reply-To: <e7257423-bc5e-4a71-9c23-d9b939464b67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776767166-2AD643FF-FB2B7A93/0/0
X-purgate-type: clean
X-purgate-size: 1006
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1596343977A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 12:22, Andrew Cooper wrote:
> On 21/04/2026 7:39 am, Jan Beulich wrote:
>> On 20.04.2026 19:46, Andrew Cooper wrote:
>>> The encoded MUL is 64 bits, so writes %rdx too.  At a minimum, this needs
>>> expressing as a clobber.
>> I'm embarrassed of missing this.
>>
>>> Also fix a logical disconnect between 'overflow' being the carry flag not the
>>> overflow flag.  CF and OF are always the same for MUL instructions, so use the
>>> flag which matches the variable name.
>> I don't mind this too much, but the use of CF was deliberate: Imo OF is
>> relevant to signed arithmetic only, whereas CF is the flag to use with
>> unsigned operations.
>>
>>> Fixes: d5c70a51bfbe ("x86/APIC: handle overflow in TMICT calculation")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.  I could rename the variable to carry instead then?  Either works.

I'd slightly prefer that alternative, yes.

Thanks, Jan

