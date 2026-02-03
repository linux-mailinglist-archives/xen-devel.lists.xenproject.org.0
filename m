Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBXzFLQmgmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:47:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9DDC388
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219405.1528285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJYx-0004Bl-Bf; Tue, 03 Feb 2026 16:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219405.1528285; Tue, 03 Feb 2026 16:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJYx-00049Q-8N; Tue, 03 Feb 2026 16:47:39 +0000
Received: by outflank-mailman (input) for mailman id 1219405;
 Tue, 03 Feb 2026 16:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J8X4=AH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnJYv-00049J-NP
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:47:37 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a9fc2aa-0120-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 17:47:35 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-480142406b3so43757985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:47:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830511cc93sm85781995e9.2.2026.02.03.08.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:47:34 -0800 (PST)
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
X-Inumbo-ID: 0a9fc2aa-0120-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770137255; x=1770742055; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsmugQpXeyJIESCQFQ9qrbR5/T8eGHL3QlcINMVsWlk=;
        b=EwRlr4vrC5VfTmWU1CgBF1gaqJRk/kV/AXy4KuU3pPldZPThyTr2xKIa6ufmlqKwXV
         9EhVKl8nD1qHYAUCSBIgD4a64ABwsXcvp2EdJFxNdmeM9/4APJU2EdXwy0C2Q//EHgDL
         WHT1CDtrGzoP85gqBwjayYhAX2/nJCZqZZqluUT5Zl34oScfWa7rW4tDh1NbcZHssJef
         iZRMj8wsLL+00o7B+U014Nkykw+yOn4yfnTk6/sDwvdfDSl/0gZi0i3L0kZ9vxlLhtul
         Lks86GtYI/R0dvVZWyal/qOL2xAUaUmG31xRfytiW4S5EzDBOzBVGWiB/kiMQq1xqcZH
         2MCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137255; x=1770742055;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsmugQpXeyJIESCQFQ9qrbR5/T8eGHL3QlcINMVsWlk=;
        b=Z5sw73hkMoLBfFr9ZP/j9J2rE7YTA6ohVRs0++tQTeWc3gQLtnTUsJjPYyzY8VY5Py
         DtvTJk6uEourh7sLJuykGjAP7Euid4E2kncj4FZJgMLwoWAQ+b+8dd/LpKTyZafxVyD4
         f/PM+zOj+qXibl6QrypGHG4tDNpsNT5dq60KYuSOrlRqze1KQ1PYUd2mLFsg5ZQO6Wux
         FIVzQAyhX5WbADWIi00Myq3NCWV/PWzDcK33Akp8+pmEapsPeYlu86kxNDkaH24WfYfr
         mNd0e0tWXAhUKAPfAX2DfPSi6/2G5NkLXzkVcYtZyrZPgGig8A7AzWlgZU79jM24EgSN
         pHyA==
X-Gm-Message-State: AOJu0YzT3YGf3izaB6uGHsDY7327QBHFYd7mjQmlKLoYGQx8747NM1lZ
	mYGp65xS75P7QVcK/sdEcfxWxn0l+zQ6KDMd9zE1YkXYnnppyJm9jtCAW8+abxFwOKkpZFAqA5q
	Pxzo=
X-Gm-Gg: AZuq6aLt8wZ/ooZ+nzv6vTVGCtt5bFGujsiBtK2DWy7/nTJpfBhb3XmHfFift1U6mmf
	u2lDwfkQ9PZOMdPyTCFA9QGgodyc85IPjIkU0qMJiJ/xo76CXLKOiWDMJxvdwNXz/YxbXF5Bzek
	Z+xC+UrA7ZvX/ZdymdlHdOMJhdb0R9RK12ikmjJOz3lvCbAIAdIhrZEUcxkHWh6XWErquOYzg35
	U4gM/8+pbMwvq8NsgLM4ElbgMr6WUMVj91tHdHUhQ9CpkSuQVQMfJVAJUK5e/w6B+q1lh0ryYfw
	1K/wvdIWINyVqGDCA4pYJpNupRPopVTosTF108qHO0xDiE8KYS8V4XVGrlIQ2zW9jtxbvhmpXlv
	pKMKt2zfmSFrm6ZBvBT5XDuYfKp1giCCoJI5JXN7euw6/3NwbQb1OYa4rwDHcnAA6YzbFwgUvHx
	m3eQr8UppTBxqwHWuCayyJXY7Po/otfBnbMCgrjNikqo9ZYp8HGuMx7QeU2/vvGuDKmePjQNdBN
	gyRXNMYfIEPyw==
X-Received: by 2002:a05:600c:c163:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4830e988f3amr3463135e9.24.1770137254965;
        Tue, 03 Feb 2026 08:47:34 -0800 (PST)
Message-ID: <5149ab32-7d03-4ae5-9af0-e62dd5836329@suse.com>
Date: Tue, 3 Feb 2026 17:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/shadow: tidy VRAM tracking a little
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 02E9DDC388
X-Rspamd-Action: no action

While dealing with Roger's comments on "x86/mm: split struct sh_dirty_vram and
make results private" I spotted more aspects which may want changing.

1: unlock P2M slightly earlier in shadow_track_dirty_vram()
2: VRAM last_dirty tagging
3: reduce flush_tlb's scope in shadow_track_dirty_vram()

Jan

