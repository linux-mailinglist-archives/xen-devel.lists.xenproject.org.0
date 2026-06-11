Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DucKKVHJKmoExAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:42:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7BF672CAC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=L6FE70vJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335713.1597892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgbm-0002Lh-IZ; Thu, 11 Jun 2026 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335713.1597892; Thu, 11 Jun 2026 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgbm-0002Ju-FN; Thu, 11 Jun 2026 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1335713;
 Thu, 11 Jun 2026 14:42:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXgbk-0002Jo-Jb
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:42:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgbk-004oHX-06
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:42:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac938-5cb7-0a2a0a5109dd-0a2a4507d6a6-28
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:42:11 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2ac943-229c-0a2a45070019-d155dd35d00b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:42:11 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so6383770f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:42:11 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm74061727f8f.30.2026.06.11.07.42.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 07:42:10 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781188931; x=1781793731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xBKTSRIV9BktafX3RnSo2QH4cW10l3FYgQVjiuk4XFo=;
        b=L6FE70vJi7XpqXh8w2qNFi0PgfVr8W4TcSXqLc4PnmzrZC/7d+Yb3//NgREcQRm3OA
         smEKyXj6c0Qk2VUmJFVxoHjQoW+7WyB0S7rckoxnF22jrvNx+1MZMpH01lrUprF7Xv1I
         zZ4zYkKmj1K+AQpy5brjEVLjnurbxW/5dzghhTrepzPY1PBPdYXuFWPtDOiXfaNfcfP0
         g01hE4/8BMjr+GcqLLchVA3+vgyeQcyL112tzAN9q9o1viFiJASnMo3bSKBjEqviiZNi
         ob88zA/R6WtydoLmwPl7XJxMlnc7tF1giPJ1ZOlSDPIt4iO73Kzdc46jIagkvMdPihXx
         hD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781188931; x=1781793731;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBKTSRIV9BktafX3RnSo2QH4cW10l3FYgQVjiuk4XFo=;
        b=V/iBukV4HYkDcd71coP2tjkUGU1NzG7LHxrIsqW0VlVjXHJenDs0uzm3hgLD5iHVYD
         r/K8fnszGZrrDJXzrzgEpbugb3uDcv27ISNKicgWj6VN/g4TdRfiM+F0I+BFAoP27reI
         BXQHlaRHZZVlgxJtr4IbCJYCoP+OLyHz5mW2YlvtZJv4/Nvu2KvkDk0u5Hl7xZFSTYMH
         C4pp5dU0IPos5Zl5BvJnEiYz8ET7in9qLe7S7E5Kcv1fmCgRciXlbOZJ1Cv7jnIZJv+7
         c8+dk+LKeM2F5UBPwzhcStOdXp10WYp47FUjYk4fmeNB7usPQJodB/JdMHIA5/mURY7V
         3fkA==
X-Forwarded-Encrypted: i=1; AFNElJ9Yvox4m96sypEH0Px8wHp/NsIHu3Q7T4l++n4SKafyHfCJ9mpnxh2o2BX9Cpv/24Q+A4sNTGDoZ9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5Ogd9X5sNv3+gBW1XnfpgxPz6R+gP/0SjTRkVAcNtO/5393Q0
	XReUhGXOpQy7d3XFFwxIZzhtEDR13Ln9bt3unaVKEBr5F30a0fQxxXOPQDEX+Yxp0A==
X-Gm-Gg: Acq92OHQHNyaU0j5rr6Dm59tMrNT5uNdbEW/z5YqZUPgHrWdtOKH1rVUmPETKF4Wcng
	qWmZKHgCstx4PnP6+nuLNc+DZu6QHvkkD22MLcblF9UJDa8F+/+GTpO9uvT0qyLxA87BuBDbY1r
	mDGx0U6ByLs67CA32WuXM2Td2RYn2ObDwEbVkEjTS066ZnMP5JNfH0LgBgkR39JGnYIMlHE04wg
	W0Fgn81rJGwAAUZ9u4LznonEKrqdhVIo61v7dODz7bFMd4ohzbosZABjgLwKYyqqM/77hoUKa8u
	UCitRIZJYBpSof9GWqbNB2TCpqBFBhUeNWF2IR7IB+hAlwq9UDQ0fXnI+sqFEO3SE0w7nic9s5j
	zY+aERqIFdJRiIuDy7ntfTmuVmcGxKx5pSFC3JXMyoK5nFEVTtH+GMy7Ir2PW2PInffaCIiwMRJ
	6f5DxeXTQT34LXY+Ytce9JVkNsTcleqZSbXtd46aqcn61Po31sfMO9PZd3uQPr/oHigvWL6jcAx
	RV4vZQmF0E7V4mmuiT6nFvTJQ7i7Pql8l+9voYwT17pAHP+zHoHkYwEXgtfmBpQ49UGsSQ=
X-Received: by 2002:a05:6000:4601:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-460673e3420mr4688358f8f.0.1781188931159;
        Thu, 11 Jun 2026 07:42:11 -0700 (PDT)
Message-ID: <965bcf53-accf-4297-bf8c-903dce45cba0@suse.com>
Date: Thu, 11 Jun 2026 16:42:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
 <b310db60-850a-4096-8900-54d0816e5063@suse.com>
Content-Language: en-US
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
In-Reply-To: <b310db60-850a-4096-8900-54d0816e5063@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1781188931-0A772C48-24E9A351/0/0
X-purgate-type: clean
X-purgate-size: 926
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,invisiblethingslab.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C7BF672CAC

On 11.06.2026 16:38, Jan Beulich wrote:
> On 08.06.2026 19:31, Andrew Cooper wrote:
>> Some old versions of binutils ld managed to produce efi files which the
>> matching version of strip couldn't process.  This includes Binutils 2.26
>> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
>> less broken toolchain.
> 
> And we're certain newer versions of strip don't do any harm to the binaries?
> Already towards Frediano's posting I said that having looked at how things
> work there, I'm far from certain.

I should have added: An option may be to link twice: Once with debug info
included, and once with it stripped. Personally I trust the linker creating
the various headers, including the section ones, more than strip's (or
objcopy's). Yet then I can only repeat my observation that linking PE+ from
ELF inputs looks to be significantly slower than linking ELF -> ELF.

Jan

