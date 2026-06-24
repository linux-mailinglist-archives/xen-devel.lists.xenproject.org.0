Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQFUFRLWO2rvdwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:05:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6626BE6B3
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 15:05:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fHZX+P5U;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344910.1603921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNHX-0002Cc-9h; Wed, 24 Jun 2026 13:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344910.1603921; Wed, 24 Jun 2026 13:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcNHX-00029x-79; Wed, 24 Jun 2026 13:04:43 +0000
Received: by outflank-mailman (input) for mailman id 1344910;
 Wed, 24 Jun 2026 13:04:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcNHV-00029r-Cq
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 13:04:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcNHU-00HEmg-8v
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 15:04:40 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd5d0-e002-0a2a0a5209dd-0a2a45098cda-40
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:04:40 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bd5e7-97e6-0a2a45090019-d155dd34a8b0-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 15:04:39 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4631679f204so1095403f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 06:04:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1b754471sm6587146f8f.0.2026.06.24.06.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 06:04:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1782306279; x=1782911079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LgtZI3zesLmUcubosSfuQCw+aD87igB0phXmrcauwDI=;
        b=fHZX+P5URuCViV23UQirnXZkbatwhN9L68o/ALeFmhtfXiK9ZPx0zoo4LFowK4XUeZ
         +3My7xOd70DGxYY4iIKx+mWuKCVehS76zQpdVWZHWsQL4W1M/mt2cacV9wyqVjgQm3yI
         Sm+2vgll9xwoP3PNhlB4Mdd2d3vzYgBW+f1sfPvGFBO7mtxhh3ITjn+A6hF9+jEQSg1j
         29Fvk9E8vM0Twcb0dcXfb3xVaZN770420t84pT4gMKiCjEBGBMZNYsBNDiRhKsduFA/Z
         SDRXqqMS+wkIah+y8GIQ2/lsE3MKnk0s9IyF0pDGp9iqXjrnMwgp9RZPj/a2emdR3zbW
         HWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306279; x=1782911079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgtZI3zesLmUcubosSfuQCw+aD87igB0phXmrcauwDI=;
        b=bipUoHWO+CaiQh3Je5SZajd7LEwvqXF1oqdfIuUIaZ20jOA2/rStXiQXgG4111V4wN
         NCO8LnO803tlEi5n3k1CXSjByey0JKHnk4T67TW0KjzJf4iMbxvjMOCkVJZIL/AhT1Rx
         RMri0AXi/mcU/Bg5gkoFmThwVeY8iajgMfgv23kazLWU62f1P1cgkas6Xcae/rtjKHdT
         93p6m33wSBWJuyFE2myaRnBKFO2S2iY8DY5EejfCwZmYPSvr+e/Du2/CeB6WeB6D4kg/
         eaZxjWBKsbKpOq0ChNkLqpIgoS2/iF6ijaPdCUw6paee+u78o+WA24FV38NTRURyjfPv
         dK4w==
X-Gm-Message-State: AOJu0YwFRgQn+pcVWd9BqJY0ViBKRcAeRwX54mLfRBHPMSnGoda+kl3B
	3XuCbe3bMQpPod/+3+FHLY4FesGGDw+ssQdBjSu/PcGaXmha/sscp6ESr5fYDr5Npreau28nwqX
	gKHnK9Q==
X-Gm-Gg: AfdE7cnOmEaGfWF/ree0iN8A+ofLUZ4UsioZYNUOpZMqe2gjedf4cX6YndEG/ZIsktC
	B9TIkS1l24eOMSCT8kM6vv2HRRCrFp/G6nWa4Zr3MailTvI8x+ZBlwrKPJ696pgVrGHO7wS1sMT
	RE1xjqSW6+NhhE33MuX7DixsXxU4SjvDqN7Q5hkSDQF6JCPRgJsiV/vFyqCF9y6a4pIK5FLFCoF
	ZIsKfZPnZgeR6MBhIMu6pd7kjXYg8TOLWZ7vLMnDLgmmsMBzi2tbovmts7qP1oEGXUc0PXZZtT8
	ijA48G6Jj6NtgUQvvam8wtNeg7dupXUSYEZ483k/uqmFduXkFKCg3May/tphO0Uyp0ai/Vbgjik
	r23feIDjQokNgZNz8ctNaYyQOxv3o+xl/wEEs07eH9IKCHLZmpkrenILmbDrNMUJj3031sump2+
	aZRLdy+fI1VJ02WwKFbCfzKpfjCRbQ8lS2OFYCDWnYbhP2eWWCJNiRIYl4EdoxdRGDaEr867lfT
	Ccl
X-Received: by 2002:a05:6000:2488:b0:464:c5be:37fe with SMTP id ffacd0b85a97d-46d04d45829mr498719f8f.15.1782306279388;
        Wed, 24 Jun 2026 06:04:39 -0700 (PDT)
Message-ID: <ee48e27a-049f-43b9-87dd-c9188db26f30@suse.com>
Date: Wed, 24 Jun 2026 15:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
Content-Language: en-US
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>
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
In-Reply-To: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1782306279-56FA9986-EBAE9BB1/0/0
X-purgate-type: clean
X-purgate-size: 1375
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:julien@xen.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A6626BE6B3

On 24.06.2026 14:33, scan-admin@coverity.com wrote:
> ** CID 1695359:       Insecure data handling  (INTEGER_OVERFLOW)
> /tools/xenstored/domain.c: 601           in domain_tree_remove_sub()
> 
> 
> _____________________________________________________________________________________________
> *** CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
> /tools/xenstored/domain.c: 601             in domain_tree_remove_sub()
> 595     		node_changed = true;
> 596     	}
> 597     
> 598     	for (i = 1; i < node->hdr.num_perms; i++) {
> 599     		if (node->perms[i].id != domain->domid)
> 600     			continue;
>>>>     CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
>>>>     "8UL * (node->hdr.num_perms - i - 1U)", which might have underflowed, is passed to "memmove(node->perms + i, node->perms + i + 1, 8UL * (node->hdr.num_perms - i - 1U))". [Note: The source code implementation of the function has been overridden by a builtin model.]
> 601     		memmove(node->perms + i, node->perms + i + 1,
> 602     			sizeof(*node->perms) * (node->hdr.num_perms - i - 1));

I'm struggling with this one: As i < node->hdr.num_perms, the last argument
passed to memmove() can be 0, but I can't see potential for underflow.

Jan

> 603     		node->hdr.num_perms--;
> 604     		i--;
> 605     		node_changed = true;
> 606     	}

