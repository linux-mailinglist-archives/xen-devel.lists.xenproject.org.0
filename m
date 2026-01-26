Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK3SKspAd2mMdQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:24:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0857686CFB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 11:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213508.1523976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJlG-0003l2-Se; Mon, 26 Jan 2026 10:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213508.1523976; Mon, 26 Jan 2026 10:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkJlG-0003ir-Q5; Mon, 26 Jan 2026 10:23:58 +0000
Received: by outflank-mailman (input) for mailman id 1213508;
 Mon, 26 Jan 2026 10:23:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkJlF-0003il-BZ
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 10:23:57 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dfb5712-faa1-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 11:23:55 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so7146465e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 02:23:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d84ef51sm241617785e9.5.2026.01.26.02.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:23:54 -0800 (PST)
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
X-Inumbo-ID: 1dfb5712-faa1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769423034; x=1770027834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nzT9ZRmEDSZvg1iOpRp9dAVEi69ZhoqPLIq6Na/jh1M=;
        b=HFQuDt1b7eWladdqiKJRyC55Dg4K0nrLLoW0m9olH3RqlvgDJJMiFaJ4TtoPEHANHo
         05Kjr+hxd0hvgM+jLZ3nlIQE7zqdF5/m3M01KvIAtq+avs7eYrx7qxDeftm6mIRyhA8l
         4dfenCvyR+F99ncTAgLfKW5Wqv4Ivn9vgmTHLOuHjg5STs3YOKV6RMA1Rg33rlxK7SSR
         Oe54ypVdWOgKtLaQ0SAzwkl+t0V5OCJfVaDDY27k4MJ5yw0z77wxz08RWtyBd2YpVTJW
         r8cyRjPrs0R3wBHHa7XogEgoO5a5EsGz0XmX5cq5lS+2BnbDDOTawxKY28OAOV9yENvT
         HWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769423034; x=1770027834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzT9ZRmEDSZvg1iOpRp9dAVEi69ZhoqPLIq6Na/jh1M=;
        b=imJbGs3p8Bw4Fv1Y6Il+3qcf1bVNbkRvXcmW1AZNISa7nhPms8q5oQt0R6bEFPCKaW
         E6xY6oghUBHcRx1DVbR2wwqxGr+Rk0dxW0loab3Wiq5TrN3cq+umHAKK6cYKh7cyZtPL
         OT0NALwF7Jrre9cJd3l0gpnM6ye/JQqorLzl9O+8aHPvH6MyxfPXFOPGoReuzTeWuXno
         FkN6kLbKf0J7M0dwrLp3+Si33AWAhecFymUdqNLV5fgy8Aj/Weg6y2Gl6Y3xTHsOrYKn
         MLPNBDA6Dtz06Uz1QBBUSQAQDHdDl05BbFEtW7UlNnSYfeP73ODtEADnp8lbSjQZVD+C
         ZdEw==
X-Gm-Message-State: AOJu0YwjQlXZ3yYbz2PQafSLg36NpoTyPZ8Z3nunuAU/bOAXd1JdBxFx
	VQMY4/y8tfdx6VvGCeD6Cd7RTWtEteahMt50wE0a22GgcZkZ02+0MwU2vZo2g7HQEA==
X-Gm-Gg: AZuq6aJVqyk835XoxTWItyqFbcR4B/EUjDB3LTgbkyKI0DnOYgVncZwpwGUVqd0Vyit
	tBY1dW5q2LdCiw1EnxKMfFVTJMZ5KC1KcDWkp02CsCpjhm+ebDe8vKxIi4so336Z10PlLEAXWX0
	q4s9iTwbHayv1jaG0XP7PDquI9RtXWHiblpYWq68gK4U4+kDY9UDCPohQjheREQUVGTCOaoGudT
	f9hFckIixMixutFGSg/+wdOywY66/CLAfcILPIpceyvHPzoQMlfSCvvkp7coc8V9O+x2BIx7sZ3
	tFgUKyqPucteTBXaf5ZVtwqyGmE+z2U4TPKD2VV50Zt4aqL6+kNLVE0c15JP053UPW1JXvKDk8C
	8Udo95wU+xLzpT5gkpUrC6e8lvsWysSe6qMrICb0giw9Y4pTmnmkGtW1C1tKQKlNbBuIUIIDW2G
	zaVXn60cnB5gULw1puiKPSwMpOQueYYoj8vS090KbXWRzqH8uPiRRx9pM3+BrK91wBOHtwtOmuF
	QGvrrfZYy9xhQ==
X-Received: by 2002:a05:600c:a00f:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4805cf6365bmr66239355e9.24.1769423034398;
        Mon, 26 Jan 2026 02:23:54 -0800 (PST)
Message-ID: <07f73a20-ff40-4a76-aaf6-5a09774b1530@suse.com>
Date: Mon, 26 Jan 2026 11:23:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] symbols: check table sizes don't change between
 linking passes 2 and 3
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <7e550d03-13c3-4607-bfa5-1a4bd57ecef6@suse.com>
 <aXEPEwpsaH9pkgF2@Mac.lan>
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
In-Reply-To: <aXEPEwpsaH9pkgF2@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0857686CFB
X-Rspamd-Action: no action

On 21.01.2026 18:38, Roger Pau Monné wrote:
> On Tue, Dec 09, 2025 at 11:11:40AM +0100, Jan Beulich wrote:
>> While sizes (and possibly positions) of the symbol table related symbols
>> (and as a result other ones) are expected to change from linking pass 1
>> to pass 2, no such change should happen anymore from pass 2 to pass 3, or
>> else the internally recorded symbol table wouldn't represent the ELF or
>> PE/COFF ones.
>>
>> For comparing to be actually useful, i.e. most notably also covering the
>> last of the arrays emitted, symbol sizes need establishing. Make use of
>> the xen/linkage.h machinery to achieve that.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Hmm, the Ubuntu builds (up to 20.04) still say no for xen.efi. One example:

diff -u  ./.xen.efi.1s.o.sym  ./.xen.efi.2s.o.sym
--- ./.xen.efi.1s.o.sym	2026-01-26 09:46:46.273317246 +0000
+++ ./.xen.efi.2s.o.sym	2026-01-26 09:46:46.276317175 +0000
@@ -7,13 +7,13 @@
 0000000000000000 l    d  .bss	0000000000000000 .bss
 0000000000000000 l    d  .rodata	0000000000000000 .rodata
 0000000000000000 l    d  .note.GNU-stack	0000000000000000 .note.GNU-stack
-0000000000000000 g     O .rodata	000000000000743c .hidden symbols_offsets
-000000000000743c g     O .rodata	0000000000000004 .hidden symbols_num_addrs
-0000000000007440 g     O .rodata	0000000000017f1e .hidden symbols_names
-000000000001f360 g     O .rodata	0000000000000078 .hidden symbols_markers
-000000000001f3d8 g     O .rodata	0000000000000443 .hidden symbols_token_table
-000000000001f81c g     O .rodata	0000000000000200 .hidden symbols_token_index
-000000000001fa1c g     O .rodata	0000000000000004 .hidden symbols_num_names
-000000000001fa20 g     O .rodata	000000000000e878 .hidden symbols_sorted_offsets
+0000000000000000 g     O .rodata	0000000000007438 .hidden symbols_offsets
+0000000000007438 g     O .rodata	0000000000000004 .hidden symbols_num_addrs
+000000000000743c g     O .rodata	0000000000017f13 .hidden symbols_names
+000000000001f350 g     O .rodata	0000000000000078 .hidden symbols_markers
+000000000001f3c8 g     O .rodata	0000000000000443 .hidden symbols_token_table
+000000000001f80c g     O .rodata	0000000000000200 .hidden symbols_token_index
+000000000001fa0c g     O .rodata	0000000000000004 .hidden symbols_num_names
+000000000001fa10 g     O .rodata	000000000000e870 .hidden symbols_sorted_offsets

i.e. there looks to be a (proper) symbol disappearing in this case.

Oh, wait - this is because "x86/EFI: correct symbol table generation with older
GNU ld" still hasn't gone in (and can't without having an ack).

Jan

