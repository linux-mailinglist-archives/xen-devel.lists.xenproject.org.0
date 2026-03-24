Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAiZOzJ7wmnqdAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:53:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B621307AB7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260403.1553749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50JZ-0000CT-GT; Tue, 24 Mar 2026 11:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260403.1553749; Tue, 24 Mar 2026 11:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50JZ-00009U-DS; Tue, 24 Mar 2026 11:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1260403;
 Tue, 24 Mar 2026 11:52:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w50JX-00008w-Rc
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:52:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50JX-008pWn-7T
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:52:51 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c27afb-2eae-0a2a0a5409dd-0a2a4507c2a0-42
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:52:51 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c27b12-fd74-0a2a45070019-d155dd31a8f7-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 12:52:51 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43b467dcf0bso3750690f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c7fsm37472425f8f.23.2026.03.24.04.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 04:52:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1774353170; x=1774957970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CBYp7k+0Yqbh24aD9JDlWKKlKco7dPP5yPhdiLuhJx4=;
        b=afB+rDdSx4AGTRuA9CFjyl0NDH5guREFc2hFoC9zYbpIm2IlZF3ZonmShxTAotqXuq
         NRxExWVd+T2+KKfp29q4mmuHi0fkS1Cwti5aaw5iwKiKROccrRy54CqMAEox8/7q0vUV
         hjezoU6UX4BPB2+cl/jQI584BzkcPLGKo458dVhKDNUJL5XxWgE1B4TZ5m1wQ+ywmwbk
         HgmM6ASdukjw2QRDiSRDPnC06SIkAOxckLZ/0GLWvVf7MNxEyqb0OGsQSE7UgtmMLJmP
         UlFmXTAotpNORSPzdqE4zew52a4gItysgKYUUEsM+FyPX6tnfwlQs+2KR2cEMFrfQ4s7
         dmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774353170; x=1774957970;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBYp7k+0Yqbh24aD9JDlWKKlKco7dPP5yPhdiLuhJx4=;
        b=GWdiyijzs3uOJDzgbqy1Tw+SMQmMEV1ZnYyaeUEqOCTKsNqdrNJedK4WBHliQewM7m
         cfpdhiH65iecKVPHqAxYzFbnYWzHExGh1v0MAcpUEELr/F5FfH8KQytZRq6jj3hIgdUQ
         6Lim8QADcIcANDA2RzHBCx2LjCFG1S6vQ1GxE892UyXBLQlhQgSD6HC9BOEOVxv1hM1B
         yqkHK0zTtfY+LIFkVC5lgQmMD8iZmqB3aksSNhTA+in8SIjzbBRVGIk8qJgEGVlWzie5
         mNw41sE8FKLQZzlfIUslNBRF1LzZlfV0whoQno5xUFq11lbEqe71NdjdpOZ9fImuEZzD
         GFEg==
X-Forwarded-Encrypted: i=1; AJvYcCV3gccpBHOtpH9ShY4FffFSC2pb9cKvsX+GN4Deyijjp0qOIflsnk3QNjvwSf5jzl5OuskBVXrXMrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqjbKi1AkBgKfjFqRzDF+V3dEkxfUSlNUGuzIXQczK6f3PO8bt
	oIrrGgU68xOLsYKK/ljGKpO3Nxplg8SDCyk+yzm+RQpbBlxpaqUnBXsRNXOuafi/5A==
X-Gm-Gg: ATEYQzzL1JQ7Mxu+06C/idRppxQzRUtlka7JdPfjnDMQT03AIxwSe8W5/jcZqH6Z76l
	KZbHRJv3WH89PzJtL5Daan1KtwtahZ969KVXbyIGvHHWdLdfcEOtuv3CXiOLQFju8FtqcVeYh3I
	fbIdZAD+tcqUHjolFi6S5iDGsYuok/vScrFsZu/KU+tNZ+i+ZcR7sCgDnR5cbGYd4zvCYPqXLbc
	R1gWdNz3M8s3j9uaFOGn/yQX0x52dvkLbgQyISPAHNrsGFSOINLoGw2daQZ7k3RClk7gGTB2y6P
	3KWdtx4dK6H9d7WYkIYApf6UNHbN+VXEa1pnYUNLtg7n5Z/c4pncUs2UxiHFSN77EHq6zyxSJQp
	B5ZzuJefKcz7dl7xOq4qWuNCofpbULVJ1IOh/qyiPgYqWfk+m1giUXl38rB7dD6UkM1hqdd/tgu
	FcWtAGYs5GJbcixyRaqO3mhZyYxUdARmIhUMWKO88aAEOHmOaNgojevi/Nf4TbnP7a0/TSI8JA+
	INVUfG6ln9N+s0=
X-Received: by 2002:a05:6000:4905:b0:439:cd2b:35f0 with SMTP id ffacd0b85a97d-43b80526441mr4157387f8f.2.1774353170377;
        Tue, 24 Mar 2026 04:52:50 -0700 (PDT)
Message-ID: <c2129389-cc61-44bd-a680-c75b05725749@suse.com>
Date: Tue, 24 Mar 2026 12:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/kexec: Stop hooking NMIs with trap_nop()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260319122549.922724-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774353171-5CD87303-8DDE48C1/0/0
X-purgate-type: clean
X-purgate-size: 1337
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3B621307AB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 13:25, Andrew Cooper wrote:
> When FRED is active, it is not possible to hook NMIs like this.
> 
> NMI hooking in the crash path has undergone several revisions since its
> introduction.  Notably since commit e7f147bf4ac7 ("x86/crash: Drop manual
> hooking of exception_table[]") we use the regular nmi_callback()
> infrastructure.
> 
> Instead of asserting that we don't enter do_nmi_crash() on the crashing CPU,
> tolerate it and return early.  It's a marginally longer codepath but behaves
> the same and is compatible with FRED.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> The other use of hooking the NMI handler like this is in play_dead() and
> introduced by commit 73cb1383bf8d ("x86/idle: re-arrange dead-idle
> handling").  It's unsafe, and the commit even mentions so for #MC.

Why is wiring to trap_nop() unsafe? There is a per-CPU access when
PERF_COUNTERS=y, but otherwise?

For FRED, shouldn't do_nmi() then gain a similar early exit for offlined
CPUs, replacing the IDT editing?

> On x86, we simply cannot free the per-cpu block for any CPU that hasn't been
> put back into the wait-for-SIPI state.

Please remind me, is there a reason we can't put CPUs we have offlined (not
parked) into that state?

Jan

