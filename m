Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD5YJDz6DmoSDwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:27:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5E55A4C8E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315145.1585009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2Ur-0005LS-SF; Thu, 21 May 2026 12:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315145.1585009; Thu, 21 May 2026 12:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2Ur-0005JS-O8; Thu, 21 May 2026 12:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1315145;
 Thu, 21 May 2026 12:27:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ2Uq-0005J1-5P
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:27:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ2Up-00AbZb-Hd
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:27:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0efa26-2eae-0a2a0a5409dd-0a2a4504ce16-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:27:27 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0efa2f-1dec-0a2a45040019-d155dd2ac01e-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:27:27 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-4526a8170ceso2958547f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 05:27:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa756d61sm2611984f8f.0.2026.05.21.05.27.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 05:27:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779366447; x=1779971247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lAIt2T2NR1fpTTlAhn+LK7AFIufteJRF0rZOBZZiV0o=;
        b=Y7fdAER52/wNqf3jNQ7EQwsPkAEyL8yMfj+3eEPSP0RkKKcTGAwydMEl0g4zqww1QG
         iaebXitZvJ5lFuTRM4oDL4RZpwGEy7midGpD5yDRczYQTpjAnvg9CRjaXOIEf0pr3yj1
         eUIJfCIIyGTfbfsYs/4nc8bhyUBc0aWXnbza9XRONil85tFbN0JBXAtQfq9MfGRIBSM+
         +nNMbhgA5z9S5NUK96nox3TQm12awaXsmIW8Zwaove3pMmzqWoHCA3LaSq6iCtGtTmIL
         136V0C4tcdMcdPJAYl14RtRYbcia+yJWGFNRTLbDlzUS4+AL1iVFZoJqhEtkMwyX4sry
         CGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366447; x=1779971247;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAIt2T2NR1fpTTlAhn+LK7AFIufteJRF0rZOBZZiV0o=;
        b=DIuygXPG4xwwgR03CBCgoPBt+5uEM9Wa/c7paOgzfCZJCpnxP8OgXCw2nsJWntFciG
         QwfRKMhOIMkjvK6q+1OhYTYpAeMWF1iQUv1oQFtG6zqorE6kQf7MEZQ27r2bLKaR2GFh
         PY/et4NWHbVDhl6Remq6ocqA5RzpzCHThg5ACLoXvcSX9ISepa/3hmREEKiWzNsdpXIB
         L52fuMamzubbSxB7cVUpGn9hjyFSIHA5zE3q48hfwbgNTO5kPmhnsxGX6t7p8AzEn5O7
         eORgsFoUUntdaR/Xlypttae5ZiJXouhPHuToSp2QDJ27qFARsL66H75wNUfunvV7Baio
         16ZA==
X-Gm-Message-State: AOJu0YxE8vAjG7WM9c3EWM3hM4VCD2/9yX9Gd0XLTzYL8vuGJwrnjeQY
	GRRiHNPvntnyKGI0vY/W8jEiWiyyO6mPC5srWKjLIRSoPDcIDfBqHtiqXZ6j3DqjLRp2dkAIn8C
	T780=
X-Gm-Gg: Acq92OHM6nU2AqFkomTh08RfbYkHpfODOZJDrAzOAX7tRzn0HDOFGtzUNl8eTwn3ze7
	YvZ9tDgd0kI34doUosfxWFj0q2s/Zwo2zPF5QKpXwUYxESTIIhzaJFAXSRb5ivjef6/u2M+wJ+P
	w0OoPd+MIepT05dF4GLE9x1bTS/T6ra0Cc3XMdl/3tQzj9p8YNr/N4jnx28+VVx+IpGmCIU5eCm
	qBC5yQXy0nOmciC/c8FaWRXIrrb46xUmo63CGxnyRppeVnkOPNPZV8Aw1UY4DU2R4RZVWN7Bxfq
	RiWYNG1M779VJ5EAIra+yMYjlJYNf6E8eHpRa21YCzfPNoM/sV5im1ua+dJhYZ+onCJIlkP70l3
	1qRNCZDH1c+Q7q6spM4s7WRzVqYMHHgpYlL8qBRtmF89xNOiJLgKnNP8qdXPUIPkpOaXIVOC/fX
	EkRmBeTAU/Y0d6LnNlixS/cTnh0dkp+YA+dsaiFLmbS4smLVYyyJ3lTA+7bEMPbkkMcnPq1hQKp
	gponZtGVgudMEs=
X-Received: by 2002:a05:6000:46d3:b0:43f:ea04:dcc7 with SMTP id ffacd0b85a97d-45ea3ae6975mr3286342f8f.24.1779366446963;
        Thu, 21 May 2026 05:27:26 -0700 (PDT)
Message-ID: <81995cf4-19f4-4146-aea7-d3e57609aa2a@suse.com>
Date: Thu, 21 May 2026 14:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/time: don't exclude from Eclair scanning
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
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
In-Reply-To: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1779366447-289723FF-554DA057/0/0
X-purgate-type: clean
X-purgate-size: 956
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0A5E55A4C8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The justification is wrong, and the file hence shouldn't really be
excluded.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -214,11 +214,6 @@ const-qualified."
 -doc_end
 
 -doc_begin="The following file is imported from Linux: ignore for now."
--file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
--config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
--doc_end
-
--doc_begin="The following file is imported from Linux: ignore for now."
 -file_tag+={adopted_cpu_idle_r8_3,"^xen/arch/x86/acpi/cpu_idle\\.c$"}
 -config=MC3A2.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_cpu_idle_r8_3)))&&any_area(any_loc(file(^xen/include/xen/pmstat\\.h$)))"}
 -doc_end


