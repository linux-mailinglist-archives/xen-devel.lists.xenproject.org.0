Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCAnFnmF12mwPAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:54:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F403C94F3
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277009.1562300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn1u-0006ql-Nx; Thu, 09 Apr 2026 10:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277009.1562300; Thu, 09 Apr 2026 10:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAn1u-0006oA-Ju; Thu, 09 Apr 2026 10:54:34 +0000
Received: by outflank-mailman (input) for mailman id 1277009;
 Thu, 09 Apr 2026 10:54:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAn1s-0006o4-O9
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:54:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAn1s-00DHYm-3z
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:54:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d78565-5cb7-0a2a0a5109dd-0a2a450bd456-14
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:54:31 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d78567-bca8-0a2a450b0019-d155dd32c419-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:54:31 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cfac48bc7so469267f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 03:54:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c50a7sm66067816f8f.15.2026.04.09.03.54.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 03:54:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1775732071; x=1776336871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sc0kk9Q/o7nk3c7E7/EbBIsdMS3Qd5PQHXm71PhAtak=;
        b=dF3TTH0A/SaPoSjs7AAjCi2y7S28lFWO25A1ECOYIFmoys5Wxc85cmOjMqSkv23yoD
         D+MWKre/Qz+H5iCFZNTM82Svl69rPFOeQUInO2kSCVp2PVYjJGNJiR6CP41VL1o72GiI
         dkj4lg+dqKn400Ei4Ok7wN8k/H9EKQZhf2U18fhdFqndKzpnxrnNGjk4CkQ12jJ0bu81
         awQOe+eNPeek4OL1VB1CCHU/PZ8NwRYicVLW/aYzw02w7Z9K1r9o4GdtzmyoByZlQSEt
         RypvFBb8rnaPoVg1qMQ0csKZY8xDvk15yAowF/zayXHccdklxL6NydW8uOXpWJysRofK
         EerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775732071; x=1776336871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc0kk9Q/o7nk3c7E7/EbBIsdMS3Qd5PQHXm71PhAtak=;
        b=iYrX5EFiFzbxK0zCwl8jsAKISHA4aFgFzK8pvvACwvfYJq9Kp/jGDCVBaxLUI6pmct
         H1cIj0EVMFmt93u5dlaauEEUo0GhrKiqxQvYBmW2EeqH9IkLEs+8alEcdidilJuPgsNJ
         1NCdCuH/egK5AJ3e0rUwITJSCkumoBGajVrnIWVWWmh7w97BS+N/mzd+0sV/sZoc3Nzt
         GfilPXkiZttpyTf8kE9FxJMPOLW8e1tqn3BVPgOciqsN+qDTpt3hFopvuCeBqJ9vK8DZ
         ij5H91Iu/QOzjtQ/rDpZBvzROVPozhac//u0ibeoeyVb51yEazAvFyZ3u0p6m6sXn8aL
         /xDA==
X-Forwarded-Encrypted: i=1; AJvYcCWqNX9io7how8TMo79D0jFKa2rDfY/m3DegiJN8TBw5oZy3if3NthT4sl+YICF8xU/xHvDSyNCJVQE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd+zJ0/uM1iDkPfm61MnlpaV81hklrZmPYbuc02VDSmNczUkNQ
	4KQ0w1K/drXtu0CaXXjdLLivWW1K4HUgQIOJaWBBET/CzANxZ5V3i8TJsAlIyzI0uQ==
X-Gm-Gg: AeBDies8yJUTJmQNGXUqR3aCsUkE53Vd0tYuQ4M4vruHnK7FWpyJCo1HgVPfxNQTBmm
	KQ7jGV3MaOWig13N7SYLavApxnb3lF5tqxy6GyKue8M+ayAsirrmXkB5jLEJoazOn1sLB8gO9Zv
	Xmdjp+hCXtrRjnkoyJP4vXli6tNcOLG/0+0fu5+jQ4m0405ZXMUzIJXOt3f9QNRnrFSOYCb6Plp
	0NRuoH2NDhI21xxGO91thamFQTVXgs/mBgyvsz2s9Aom2ugkVYlCleK/gXepTpcVWRT/4HArrBR
	GanzJ1oUz/Y7elFtkHOJ1OEI60FLD2uH1CBs2OMNQ8cz9YzUHE2vpiUGXh4Ap1EjZrYvDAVg1AX
	ZKbfIGWZGTBivOZIKMgiO78ljAbFMe8/+1hMuKY4XnpNm9cLdaELGPwpBShBKuz1Khig4uK2fGa
	kZkLQsNEtalUgnaORYhBQID6zP2w+6VCg6pxJ5iaAaWvFEnKilcjv3AlhDGRvZgpenkTJ1CeMor
	HH+ylUWRKdHxPk=
X-Received: by 2002:a05:6000:18a8:b0:43b:6352:a262 with SMTP id ffacd0b85a97d-43d5a1a2813mr4195392f8f.41.1775732071416;
        Thu, 09 Apr 2026 03:54:31 -0700 (PDT)
Message-ID: <f8b9fcb5-18af-494e-8ed2-2e0888fe8bd4@suse.com>
Date: Thu, 9 Apr 2026 12:54:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/extable: Adjust UD1 encoding in stub_selftest()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260409083938.137871-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260409083938.137871-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775732071-F63C62A1-4149C7E6/0/0
X-purgate-type: clean
X-purgate-size: 392
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: C1F403C94F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 10:39, Andrew Cooper wrote:
> The 0x90 is a ModRM byte and technically needs following by an imm32.
> 
> Switch to 0xc0 which encodes two %eax operands, and is a complete instruction.
> 
> No practical change.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


