Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLYTBaHuxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:30:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB943315CE
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:30:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263473.1555396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g6R-0006zk-Lf; Thu, 26 Mar 2026 08:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263473.1555396; Thu, 26 Mar 2026 08:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g6R-0006x3-Hz; Thu, 26 Mar 2026 08:30:07 +0000
Received: by outflank-mailman (input) for mailman id 1263473;
 Thu, 26 Mar 2026 08:30:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5g6Q-0006ti-CF
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:30:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5g6P-001pyg-KD
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:30:05 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ee8a-5cb7-0a2a0a5109dd-0a2a450ca0f2-26
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:30:05 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4ee8d-f93d-0a2a450c0019-d1558032c105-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:30:05 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso4978915e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:30:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c65dc4sm16453785e9.3.2026.03.26.01.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:30:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1774513805; x=1775118605; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=18eeoiNw47Lyaq+T58+sz6bLpTPGHfde3RXt4NPykPU=;
        b=dH65iKGvOdHo/gP3e266Bzbap3UEbrg/eV1TJmY9bB7y5kVS/+Rhvqd6dpV4EoG1a0
         8dOEPeauerMBjtdKftGsnQJjhmQoCa0sJ3sIToGGoK21eYocPPQvLB5gf79jwNaAg4eM
         z8fa0fDT6D5YYWkR380paQd/czhO1lVpWcVv0SDCc0R566HXd8hcy3AAaK/Xq5oiQ8Db
         fRTM8pj3Ink592Pf19iY8U94Te6/IQuSzZt0paPBaV9tT0VbOBNB+bDmSVGwliV11P+r
         w05RN+WWmvZkTC4c/a4vcRixnG7tP48QpLf6PKNuGCS3RzLJ2ZbAOFnmL1A2boLYI/Oi
         Z65w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513805; x=1775118605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18eeoiNw47Lyaq+T58+sz6bLpTPGHfde3RXt4NPykPU=;
        b=Arven9upv7NwvdB1S7PaL+vpwYwKPCOvLCxuqenY7RRezx1C6n3cbUX9nWezovnQrM
         vzspuLMpoot8ZpgJZMu9ZJ0cEVGf0JXxRwq/li4nkOmeef00hPTppEfFpuIcPQZUGZSk
         fm/mvTGGGvSMC7dqvSlLrAS+P2UH2ytIyD7f29RKzg/A+r5zHzKoUkR0xsBhcG92k3Yr
         Z0z8hoSmyf3HCFBldKvcJ5d18JsuOjViRX0BNWYZ6ZYKgqKviD0lUoqe1xpycoR7mghl
         NjGxiHeAVqt54onZgjBCKgAYQSaGddx9r2evzVhaFQ2M28Z4592rUnRKblK9lQawh+MM
         Xskw==
X-Forwarded-Encrypted: i=1; AJvYcCXyqLoxS61u1Bm5l3aY14ymg059omb6OdTwRqCF/AAiZY59r20ehVsOWKLsaLwkkjo1013IFaABOm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf2MiQVbiD38bdd0bJJbkmSPq/Lx25kRpo1pi/vtbpr/F/iQA4
	qSDz5iLjWJwjrEMYujaTuRcalypwwU5GzUq4uG4ZihCBLqNVG38z/zeqgWG49XXk8Q==
X-Gm-Gg: ATEYQzzzvbSZlOGGKUX4Wh4+o14RocYR2zt4mUm2lJfhhFkW3BR7bNffVELOsmQ9pSY
	eQ61dZpbcT1Z8NkNQqWVfBo2+GYiQefORY1iAUoj+BX8sTJATT4DPVqsqWHdUyCXbKjmY+95YrE
	f/JhrbEzromjkvjxjp5pnS9YtW84f2kxHbAUyL53vPjQ/4gWZUTtrNPYhUHIt87/+d5+lsgeo62
	HAxCoGJnzDmY3xtBe1V+xW33HUergH0iRZENLWLXVmQZQFXr4WBPdN7yD3Yj0LY1YQOJ9HQnHdA
	2m3kBIJUHLxj0zAQL5mXKxDrjm2tVVkRh+tr6BJCmxbF+XFZkIllYBsnc4kfCJ3PxSVk00H8vNL
	S+7cHHyoAyC2ITwQ8pQD7vFSCdpRI/6gqLvUM1K/LOc2YgIzkLjc/l+t+Wx1Qzgf3WJGUc4cOgg
	9m9pvgWawPViYmf17avB9qyt5XmACGO7VTpH3NGeFs0MbsthlmXlbzQPOHcyFIGP/YJD3h2htMc
	lQC4aVdQaCEJhs=
X-Received: by 2002:a05:600c:4b89:b0:487:219e:42d with SMTP id 5b1f17b1804b1-487219e05a4mr8768735e9.11.1774513804704;
        Thu, 26 Mar 2026 01:30:04 -0700 (PDT)
Message-ID: <aa8baa28-98f2-4360-8dcb-62eef5079115@suse.com>
Date: Thu, 26 Mar 2026 09:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: update my email
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260326021958.782550-1-stewart.hildebrand@amd.com>
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
In-Reply-To: <20260326021958.782550-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774513805-6F4A6734-55C2C810/0/0
X-purgate-type: clean
X-purgate-size: 277
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5EB943315CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 03:19, Stewart Hildebrand wrote:
> It's more convenient for me.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

I was in fact wondering, seeing that you communicate from this address.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

