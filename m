Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNxiIVCZ2GkgfggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:31:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BE3D2C9C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 08:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278354.1563214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5Or-0003XS-MQ; Fri, 10 Apr 2026 06:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278354.1563214; Fri, 10 Apr 2026 06:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB5Or-0003VJ-Jd; Fri, 10 Apr 2026 06:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1278354;
 Fri, 10 Apr 2026 06:31:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB5Op-0003VC-QR
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 06:31:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB5Op-00FvLG-6E
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:31:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d89934-e002-0a2a0a5209dd-0a2a4505966a-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:31:27 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8993e-3760-0a2a45050019-d155dd36a55e-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:31:26 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-43cf5fbacc9so758244f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 23:31:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e468c5sm5186563f8f.20.2026.04.09.23.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 23:31:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Cc:Content-Language:References:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775802686; x=1776407486; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H0v2WHt5PyLazizb4U48RF5LhoVjKyY9CzIVeQskboo=;
        b=Xi27ESfsjnNqzTDOO3fwAQfrN4EJbF9ovasuKIT+DZQA67p/5KR+oFnlMQf0mKPICc
         ZjCe+PKJCmkV9RXSE56dfZdtzlGjFisxxgZKpG6EskbT9/N9QF9AUCDSvLCOl5pwiZ0r
         /QUVwyVG+sge0RBeHc4oY/4Vv6IayAyBHZk4rb34jPmZWV0jWluOpJpBNv5EtgcXjGgJ
         DVTUrex/NXLYLjIrcZRdRzu8KyZHT1HZSIH8hyQ7v9PI0kyBymdXrD12Di0RLWTbN3rv
         HL/EBR4jZKDJmKn6SPRAO2j1WgMYHEQG4I4MJz0fDXst1krKmtjFE0fwb46jKIJI1ugp
         q3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802686; x=1776407486;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0v2WHt5PyLazizb4U48RF5LhoVjKyY9CzIVeQskboo=;
        b=rpkUpH9pNwsin6Ppkl25LwZPEtL2dq5vTbugicD8heM/RIgXNQziy4D7ybflqvxdLD
         ONCHU0cljqnxXRF6QmDa6V/Aq21AeoPDR30rn347UjuU8Qyf1gi/oOVyTLS2od8f+x6X
         OyoDDmXd+PpbXWmMazGzE0+vDZQZT1TwOFJKQXfEdG0lKeMIMl7ox83H6CzUlv3NeCsq
         ssO3bjWfOnIrFED9/EBRmkeoAFjui9iNYMjM3k18xUeftPovCsnMXv/T/oidHgY/gKCQ
         TCP5A+jPD4VoSx7q5U4QINDjOkAVScz0ELjwJk6Kv1mqo1dzgI52zmvCPJgQrdf64rOX
         jLhQ==
X-Gm-Message-State: AOJu0YxA67zXH7sHGXfZtGDF4vxSVuJutS/I60GUBjsi1ej2GJZxN5/e
	cA+KEXDmRUG3M7/O1ukW1Apl8CQj3i9Vg0fTYpMJ01+ZT334mVc+8WT8CvHztuOpuwxwGruLWMA
	tdrjg/Q==
X-Gm-Gg: AeBDieujx9axsQlDlZ/PBWXi72WB3dvdyQsy21UFY6drvPVPcRXRZ5OleT+UWWOAN+D
	0dvSUc1FrEzyEzwdcLzXTOeOBIZBERXMWOQtwHKZ7S68R/8XiCGsf1v0zSankjTSocmPnnTf3Ca
	i9akJgIGj+wzrNZ0GkUdV/EZteyCKxv0lZKLZuKNLBd/gKDGfmGRKLIgMTWQQV5X6Tmvk+pue0u
	q+uhpKL4T35hR16RQOn9Pn6ghBExXdT+nNpWtmA5rL9Y4tlxF0S/GPxQQ3IcHtA0SWFLhHjwaPX
	/vI5VPoP6dDUQ9/EvjOQdlg2kcHCiY3TGAbqYzSt/aHQ395HXZy8hzfh4H5Rbx+XUY0ChSO5RTO
	IzdVCrNdhbK9Fe2MPqTlNDS1I0evlKRudxEwXR78/UrZreYdBn+iqlf3NwtImeSu2ZojK6OtzJ6
	PC5RpuhYag3E6Ue4WNePxv3wpBPJK4Es27WVDVD6+bX+75Ja/bBb5nFdw+YEIRgIcPXckykdTn6
	lRl+Bct5Tjal7U=
X-Received: by 2002:a5d:5d03:0:b0:437:7719:ca82 with SMTP id ffacd0b85a97d-43d6491fef7mr2212740f8f.3.1775802686287;
        Thu, 09 Apr 2026 23:31:26 -0700 (PDT)
Message-ID: <c4961231-7882-49d8-8c68-c014ca0a5e4f@suse.com>
Date: Fri, 10 Apr 2026 08:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Potential double-free in Xen dt-overlay attach/remove error
 path
To: xen-devel@lists.xenproject.org
References: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
Content-Language: en-US
Cc: Gyujeong Jin <wlsrbwjd7232@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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
In-Reply-To: <CANrF8CHA1XacwRzNcw3zt0goEV-7in_=vtEYhLxSjwaV62jrTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775802686-2292196F-70851A81/0/0
X-purgate-type: clean
X-purgate-size: 2610
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:wlsrbwjd7232@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,xen.org,arm.com,amd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E89BE3D2C9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 23:28, Gyujeong Jin wrote:
> Hello Team, I was advised to report this issue in this way because
> dt-overlay is currently experimental and not security supported.
> 
> I would like to report a potential memory safety issue in Xen related to
> the Device Tree overlay handling logic.
> ------------------------------
> Problem Description
> 
> A double-free / use-after-free condition may occur in the dt-overlay
> handling path when an overlay attachment fails and the same overlay is
> later removed.
> 
> The issue arises because rangeset objects are freed on the failure path of
> handle_attach_overlay_nodes(), but the corresponding pointers are not
> cleared. Subsequently, handle_remove_overlay_nodes() may operate on these
> stale pointers, leading to a second free.
> Affected Component
> 
>    - Xen ARM
>    - Device Tree overlay subsystem
>    - File: xen/common/device-tree/dt-overlay.c
> 
> Relevant functions:
> 
>    - handle_attach_overlay_nodes()
>    - handle_remove_overlay_nodes()
> 
> Impact
> 
> This issue may lead to:
> 
>    - Double-free of rangeset structures
>    - Use-after-free when accessing stale pointers
>    - Potential hypervisor crash (DoS)
>    - Possible memory corruption depending on allocator behavior
> 
> Given that this occurs in the hypervisor context, the impact could extend
> beyond a simple crash under certain conditions.
> Root Cause
> 
> The issue originates from inconsistent memory management between the attach
> failure path and the remove path.
> 
> In handle_attach_overlay_nodes(), the failure path frees rangeset objects:
> 
> static long handle_attach_overlay_nodes(...)
> {
>     ...
> 
>     if ( entry )
>     {
>         rangeset_destroy(entry->irq_ranges);
>         rangeset_destroy(entry->iomem_ranges);
>     }
> 
>     return rc;
> }
> 
> However, the corresponding pointers (entry->irq_ranges and
> entry->iomem_ranges) are not set to NULL afterward, leaving dangling
> pointers in the entry structure.

Further to this, am I overlooking any check preventing an already created
pair of rangesets to be replaced by new ones, leaking the original pair?

And then there's a Misra issue as well: dt_overlay_domctl() has unreachable
code. Anything other than XEN_DOMCTL_DT_OVERLAY_ATTACH is excluded at the
top, so the "else" body near the bottom is unreachable. (This in turn makes
me wonder: How come there's no "detach"?) Yet then, that's probably pretty
meaningless, as there look to be other issues (Misra and general robustness
ones) as well.

Jan

