Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NCreBxs5OmoA4QcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 09:43:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FBE6B4ED1
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 09:43:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BHhSv3ki;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344105.1603244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbvmq-0001Su-9y; Tue, 23 Jun 2026 07:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344105.1603244; Tue, 23 Jun 2026 07:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbvmq-0001Qt-7Q; Tue, 23 Jun 2026 07:43:12 +0000
Received: by outflank-mailman (input) for mailman id 1344105;
 Tue, 23 Jun 2026 07:43:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wbvmo-0001Qj-Sv
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 07:43:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbvmo-00AjFC-18
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 09:43:10 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a390a-bab6-0a2a0a5309dd-0a2a4503ad22-12
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 09:43:09 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a390d-a3da-0a2a45030019-d155802fb4c7-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 09:43:09 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso75171505e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 00:43:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff821aasm377578835e9.12.2026.06.23.00.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 00:43:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1782200589; x=1782805389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GCQ83ubdmpqwR1LY7AAtKI1i1qFv1QD7XYSrRos9Mgg=;
        b=BHhSv3kiCj0+rUWBcNEvkGtiuFfqEIdRs1Zgts+1L8EFRRSw2BvfcalDw1E8OIu1vL
         cN5i2lh/rCtb1+Cac67ytS44uu8Jck70tSMywgLZuDynPjptN4qTnHmnggpO8lN6qtpN
         GHiL1MxzcZQzJLjUHoDmNdTozNGfuq0g9kTLJrs0/iuf6xEZARIvyCV4UFlND7I26ZCA
         EBYo/nNHuZThnuPd5Bvwz5JeswK0Mz2ceAq3E9uSo4fUqoHjccpj2X4L2pJyfSQH2+O5
         Pyu8SSdbPYB8hdblNfBvsdUdLQEOZOtjzFH78CrpyyWJp2caUo6/Xa0UPadryulhXOnQ
         b43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200589; x=1782805389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCQ83ubdmpqwR1LY7AAtKI1i1qFv1QD7XYSrRos9Mgg=;
        b=sbg6y3V086toy2cmvhUahc/UAlRr7OSiwB0kzwZRo6kqQtdEPRX7IvICGrcbM1GRLb
         7WlLUIXzNUhRlLiqH8FxNHeRRzq5GX4HH+WhwzMCigqAhCIoYVqIXMa7J7yoljqSIPof
         VZBuYi9MgDwWdB6fm/Y7aptKDw+rcCCR1oWYlJyomEXeYRzm+qfn0r2cqVDHIZW8Z2zq
         v7ukS8Ca+94x54Q2DACssK2cbprcSPTi5wH98fQWYl+agqa62J6ndEgTU6eTA/KeK4se
         LMGvzg3gazzVqECpX3jKdrkstOHWd2c51NtgK+1s9StO1Eyb5gfvc/ubGVMSJTO1TXMX
         9amQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0GledOno8NZJeZjMikuDFdJ1ydH1KSlX2XdxcN1VY8QzS7I6VgQgSgrU//pxUWIwJT/EcKIbWxpU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7OW9urqmot5IBBkm5vKpw52LpKPPn8bRmQynXYcf1RASIDgNE
	o8YLlHc8te8qLvhYrn/fJ/niCBqFRROPJ7JKjmTXNu51KLEyFGsB9BI26aoboiyRYw==
X-Gm-Gg: AfdE7clEQN6XJMN10g450bDwhQln7wn03JSr7mXMR8i8yvK++UEsvQDhwKnOWBr+iS/
	XoSJSLydhgSDkH7ajb+v47cdG9jwYMO67cWpoJafSRCyNMmpSJvifFY2n3A2ctoi9m9rVccEGdj
	xdUG0maetDOVc+jXPvl+OGgrUPVd26RGGcnOLUtblSInGb0BJTaIAn+w/SqXplCgWf9I3Qi4aLO
	TnUXjZEUCOUQ80FWaXGxXwk9NLn1wiI8Ecy1UBPpRChxgFsj2ihIUTDKQHlt+s1EVYLT287f4fs
	MbRFeQ38+iBQgxHi3gMIL82LFkpvC3ceoDMo1DqAvbkWkagBejTWmLgx2GRqYV4HaLKeN/nDZhx
	LMhtJzsSmwHEtbyjiaFVBXbrxAq19AVv/3AF+u3LQngOlO6lEYZ/u59+iQUWEGFgKMNhMDUjzpb
	E+PyE68xQnTJCOFC2/Lph6UzA/dieSoeYTupxQY3ZPVatn4wnOE7E8/aSTdhHRGuJ4U/MWp4X9H
	jVU
X-Received: by 2002:a05:600c:1f85:b0:490:e190:38f3 with SMTP id 5b1f17b1804b1-4925b37ee0dmr20515395e9.21.1782200589416;
        Tue, 23 Jun 2026 00:43:09 -0700 (PDT)
Message-ID: <7a011d9f-0989-43c1-907c-fb5798aa60af@suse.com>
Date: Tue, 23 Jun 2026 09:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH for-4.22?] x86/EFI: arrange for non-discardable .reloc
 in xen.efi
To: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <652b57e0-42f8-47c8-b94d-df862874aba3@suse.com>
 <4457b798-d553-486c-8727-908ef88ebb1e@gmail.com>
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
In-Reply-To: <4457b798-d553-486c-8727-908ef88ebb1e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782200589-CDC7FD84-B994CE2B/10/73395122804
X-purgate-type: spam
X-purgate-size: 931
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74FBE6B4ED1

On 17.06.2026 12:56, Oleksii Kurochko wrote:
> On 6/16/26 6:17 PM, Jan Beulich wrote:
>> Loaders respecting IMAGE_SCN_MEM_DISCARDABLE would not load such sections,
>> yet we need to access it ourselves when switching out of "physical mode".
>> Leverage behavior new to GNU ld 2.46: Any contribution to .reloc which
>> doesn't have the discardable flag set (which cannot even be expressed in
>> ELF) will yield the output section also non-discardable.
>>
>> Since for intermediate binaries we don't care about section attributes,
>> link in the new object only on the final linking pass.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

May I please ask for an "ordinary" ack here as well, so this change can go
in? Note that Roger's ack covers, as to its formal meaning, most of the
change, but not the new file introduced.

Thanks, Jan

