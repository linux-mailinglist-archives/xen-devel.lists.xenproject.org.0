Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC1C80760
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170470.1495537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVgb-0004BN-Pp; Mon, 24 Nov 2025 12:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170470.1495537; Mon, 24 Nov 2025 12:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVgb-000497-NA; Mon, 24 Nov 2025 12:28:53 +0000
Received: by outflank-mailman (input) for mailman id 1170470;
 Mon, 24 Nov 2025 12:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVgZ-00043K-Nz
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:28:51 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 213f84fe-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:28:49 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so23797225e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:28:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e556sm27738994f8f.5.2025.11.24.04.28.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:28:49 -0800 (PST)
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
X-Inumbo-ID: 213f84fe-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987329; x=1764592129; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a5xACJNstFCx0OCIQA97Vmzs5Dhxf3koo9EBA7XvBas=;
        b=Ag8BK6gC3RE7c4hUvxRtopztJRc39egqVOuYqu4Mf9ukUP/g3cANc1L9Gw2KxmFeP6
         CDwB4MSXKT99L//Mj2dObywXm2CfqJc/NfnCtp7vkEDqbKpCtjXQcXTCAMta5U4gn+NC
         jteQQ7Zv5f+grFjbsG+8BglwoBm5770wYrZdcIFbVxKNygw5fbWWlL+pTCxD4iKFklSV
         1jxnEOHQCf3w3IUGbUhdQENxbPyIWNdBzTk7tGk/54Y/laI5GfCvMBwGgLKZGdHNbPEv
         VzyN/6H8uR8v4UAp1krVEuwr1hEbjCVuQGxAKkZK2Tg9gPH7ZWmXnZhg6UIqRypvwcrw
         KntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987329; x=1764592129;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5xACJNstFCx0OCIQA97Vmzs5Dhxf3koo9EBA7XvBas=;
        b=p9E+DUkXNYtHk97qeBsCbvVkanGeVLaBGB41Pi40HVfse2OMWcnTscttW/Kr3Fs5Dy
         I8k5w9ppS+TdwhvfK04GCbBWWj4aVvltYAcJX/t1qV99NDAD16CDou+4EJzUg5pmBgiq
         jIO68SLxiimCcShwLLZ6Vm83TVT8nFniayTbbMEDMXqcr5jIS+UCE8FNW03n/HTA/1m4
         aHNo7jN8WKMeCdRPHV3DVLSYGre9yyhDTgySWi6YcufiSh6lxNTm7sHWINr64aGIm9X0
         l1xg1Ul/59aXDrdJP/JkZHpPRdx8FyGkVn6FE/G5M2vNDi9aUqjvWihaYfucNE8uNk+V
         Q9og==
X-Gm-Message-State: AOJu0YwnbWwps/07lB7ETVMKAlxqcwKbr9tPtm76NWXHuighDGEujAM3
	clb+df6dt002cqHp2plqHZC2vacrD5keSFv/+Hpa48c6Kk2dXcbQ/444FQTpZFPYweSU0ZhNHaw
	CCOE=
X-Gm-Gg: ASbGncvoPmdOX5Zav2v21mooHWoerU61Wu9gcEOeC9CEXVlZDtVcqgn4Iiw7XtecpsX
	Unm2x4O2JWFmhNLjTnI+ICpaS8PC7lfBQ9tKCBlCQegRUrkwlkLaXXyX9pNl1b6SXgszZMQ0hy0
	tg4RpUPA6xV/0wcxfqcFHIOZnkuprifZ1qmnAKECwZpxT9zXFUwC8LfumEpPVDHcZZAyU71gVtC
	t3pZ0SXukDkDgFJ/za8EaZKTtPwktpJg9V0doKsZCwweOzMxqPqSuX6fMW2iXqCln6TSOCPup7J
	xGTbOiSy0ZJ6xyqMgdMeuL4znUU6J83mIPodwzzk2Nbuzsm8dqlWF4qe23KnqQeMUQ4GFZKORsZ
	iUKME95cIvrACkn3Pv4zce3yElHx3Sq49+5PE6nwVi73S167ZakNoGMSWIdgC/aW4UvLhZanr+w
	49uMFc3exzn2Dm27zRoucl9QP27gYLd4SMPVp4u28caimWGbIhzXUbQPdIVD6F5enWqIXQTDZ/B
	pzEu7BxNlckqA==
X-Google-Smtp-Source: AGHT+IFLtACatUe5qYGLrDbiHY/30rFJibASKXF8C/xmc9XEjrZ56+o/IjiuRVFHoBXgy/orOSeJYA==
X-Received: by 2002:a05:600c:3b09:b0:477:a3f9:fda5 with SMTP id 5b1f17b1804b1-477c016e425mr87880845e9.9.1763987329213;
        Mon, 24 Nov 2025 04:28:49 -0800 (PST)
Message-ID: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
Date: Mon, 24 Nov 2025 13:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/4] x86: direct APIC vector adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The setting up of such vectors really is a boot-time-only thing. vPMU also
doesn't need any vector when it's no in use anyway (which is the default).
The first patch also is a pretty much unrelated change to tidy things up
first.

1: vPMU: move APIC ack past the handling of the interrupt
2: MCE: restrict allocation of thermal and CMCI vector to BSP
3: IRQ: direct-APIC-vector setting is now init-only
4: vPMU: don't statically reserve the interrupt vector

Jan

