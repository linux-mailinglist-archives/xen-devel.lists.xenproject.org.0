Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBw8LJEtymkA6AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:00:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B36356CEA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 10:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267298.1556824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Xd-0002Qn-T9; Mon, 30 Mar 2026 08:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267298.1556824; Mon, 30 Mar 2026 08:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w77Xd-0002P2-Pc; Mon, 30 Mar 2026 08:00:09 +0000
Received: by outflank-mailman (input) for mailman id 1267298;
 Mon, 30 Mar 2026 08:00:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w77Xc-0002J5-LF
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 08:00:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w77Xc-00BkGu-0S
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 10:00:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2d87-5cb7-0a2a0a5109dd-0a2a4509ce10-6
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:00:07 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca2d85-e484-0a2a45090019-d155802cf059-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 10:00:05 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4873ce69ba9so6057895e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 01:00:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4873062ec9bsm161486845e9.7.2026.03.30.01.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 01:00:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1774857605; x=1775462405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUAoe2m34DxJl0uWWmPyamVUQZ4sX3dBrUARbb2few8=;
        b=LE/3cTWRLNFttiNS4xwfR23MVmflAankgD/Myas34TLa2JyNMxTj/nmmmVUVgZS0R5
         WdxUTmO24uoaGgKqilkWjJjlH/zzJAzwBCKBeOg3s3+0roH1epIK6BnpY+G64r73+fOk
         Ag189XgZilEKy1oQ7jfNIBxKC4Jz+8sO551eyFaeAsocSPVv4Opm/wo+El1THKRR3zHL
         448o2EvGlRg12o/LOnv+/hHBF1Q0NZnBxURyBqQ6t/LcWPRJttuQ53ZszHuwtligz7SB
         Seie2jcHPYu18f3sXYYjog9rRjQFflCZ+l7ogriqlX06SaysODLEHNUBnpf8Inhwe7Wf
         zxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857605; x=1775462405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUAoe2m34DxJl0uWWmPyamVUQZ4sX3dBrUARbb2few8=;
        b=eLc5DxK1VqAMogvSAzqkeMJzbhlAXxy4EAzBs6WeNOU2B27K3h0EifK+tq8bjdgbyl
         F7wmoL4bgVASQHURmFds2hvn/bKtiRtzH1DwwV4wumidRQpc0IM+qefN5Kvo2szr2YFs
         q9pHtTju1WGNnP/fCzTH25YBDmhjgSiPEhZ4nyu9vO68FJpfFPC4yYdRfqADFfjhMZiE
         Zsy9nqYt+QNLtIMH0Gw6choJ83yip7ijfe0JL0r7Z/JU0LdPe+ynvoRbm+GOuSxXYJH7
         EnSS2p1vuYf0nzJCLpk/vL9j80YN1vP9Y6iGMjAB+eH3/jnT69F+hVb5Rs7/IO1hYz3P
         zqQA==
X-Forwarded-Encrypted: i=1; AJvYcCW5lNSGCxqRaFXoIdpvx/rtSVPjHfRggD2AWEsif49fkj4HykRu5AZ/FHVYGyICZvx5T32uufvf43g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTl/pERH6X/WsKAgfi/Mzbau0JUY0zGRr3dq10PrnuzejCV6+u
	udFo54KVsgFAk7KXZI7MqJzXcY4zNEB2xiuMcBLL3hgrrNSBW/xF22DIboUjjtMl7Q==
X-Gm-Gg: ATEYQzxorNv0FNiY8sZI7NvxleztJupcgMsbZNcJ9pSwsWEZEw1DqizlIJZbyDPJO6Q
	wYdRL5CNjdRnugbXw4vsi9aDO/LdSVVv85CQUVG4sPvDVejRIDEHWwF2DW6s+nCULmuH9UloNgD
	xmAo3GH/v1fZ1fnQl+wsQ23Dj1THyISaoX8nx+DGaL+fFoUjrC99ITqQ5SS8D5yqgmPGQPjrDNM
	1sDZMTUTmb/e2Nhv/IxI+zH3TXEAdOCL1fhlXMDWfrBoM+E7K8PfxDkb4AKr95Zr/7QBz5r3IqG
	7DsQN6q9yFTV4QIPCS5XTW2YFtIpTz0vgQWDfikBmCEvG2iA3v4sCNyOG0NoCrtDsjoPOG5eXxq
	aaYZZ4Pok6KjLR7wNwCbO4Gwe+JGOcS2wPsmAnvv+cGlgRxHnCGLBs2eUdWONehp6B72z12ZVzP
	jrmOM7s6QxBrmYGXUlX07JTjBkNqYsjOXGerCX59LgUzEEuMhIBy6es2LljBFAD0ea+6W0dz9NR
	7pZRQxqRjn1EC4=
X-Received: by 2002:a05:600c:638d:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-48727efadcamr188554685e9.16.1774857604723;
        Mon, 30 Mar 2026 01:00:04 -0700 (PDT)
Message-ID: <93a09dbb-0a8c-4eeb-b544-c9409b9f85ce@suse.com>
Date: Mon, 30 Mar 2026 10:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/uart: be more careful with changes to the PCI
 command register
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260327135420.7246-1-roger.pau@citrix.com>
 <20260327135420.7246-3-roger.pau@citrix.com>
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
In-Reply-To: <20260327135420.7246-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1774857605-62AACA73-7FE428C1/0/0
X-purgate-type: clean
X-purgate-size: 989
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 32B36356CEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 14:54, Roger Pau Monne wrote:
> Read the existing PCI command register and only add the required bits to
> it, as to avoid clearing bits that might be possibly set by the firmware
> already, which might put the device into a non-working state.
> 
> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I would have preferred if the description mentioned the particular case,
turning this more into a workaround than an apparent bugfix. As mentioned,
us driving the device generally means we're free to do whatever we want to
the command register, as long as resulting device state is consistent
overall (or else we may indeed have a non-working device). Having to keep
memory decoding enabled in order for I/O ports to function is pretty
clearly a bug in the device, and hence us "violating" that requirement
isn't really o bug of ours.

Jan

