Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O27EgsynGkKAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:55:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF451752DF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:55:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239005.1540396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTaV-0005aM-KB; Mon, 23 Feb 2026 10:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239005.1540396; Mon, 23 Feb 2026 10:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTaV-0005Xj-HO; Mon, 23 Feb 2026 10:54:51 +0000
Received: by outflank-mailman (input) for mailman id 1239005;
 Mon, 23 Feb 2026 10:54:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuTaT-0005Xd-TU
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:54:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12671ceb-10a6-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:54:48 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-43638a33157so3901332f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 02:54:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c08b9csm20895961f8f.16.2026.02.23.02.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 02:54:47 -0800 (PST)
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
X-Inumbo-ID: 12671ceb-10a6-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771844088; x=1772448888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e2h6jqe+O/mqVF17kLIhI9vAFs/00RzKovZE12muX+Q=;
        b=S2qRvc0V3DBnSmuM3k7fP8HdUCzLDA3YYpwAlGNAS/s/jXcjLLczZQa9/FQU3Odf+g
         iyABqs+dl9uxAScp6JjGAiUB3L8eWWzA1+D9JgMeJ87d8Mbj+11ACQT8wZyVuAgTXXmZ
         dUUuro/s81H2WYbZlT/oJ6sRZhRtMsR1DXKmEU1La+XGHHvkuGC0I2F+pNIIo7Md6teN
         /XzMWlJD1ZjGD+EYLqTwgJeZWOZqmxzZgxoDF080xA7O/2X0tNnlv4m5ji3LxiBAdXeh
         2g12QKxNJSjaMQRJo47C/8ntxmKJPphG67Fit9MfDFR3d75vewBy8pdv7qWPjlYlWl1C
         v9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771844088; x=1772448888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2h6jqe+O/mqVF17kLIhI9vAFs/00RzKovZE12muX+Q=;
        b=MPcF0JYAW534/B0XpmN6YMwU3pC5j3OvNubspV6s/94RsEEmXKgDHU+/kawyUqd0oZ
         vnw0tT+M+D1bqSHao+lcEsqH20aDicJzrYtYRt3o9JiOcTebP+u6LU9zwskUvSnV+sOm
         vmviv/y0YxYejUxWQbKcTnBRl7Nig/bbb2+FDCjFc8cNCgKfhaXeQbUxST5YPyY2QnXG
         6M7CVNcXXMd+h5RuA/32PMxxu3ov8f8vxAt/Hcfng25pFQqSDU5TRDc3wEJjC+igA/gP
         bKN0Xjwv5UcrOQ+awV1/rrsmRWBXvGN1A3IqgmAzIDa6s/s0D8HBSo0iFyFeseFaMm1f
         Vf2w==
X-Forwarded-Encrypted: i=1; AJvYcCUdVOHE0A1RHTgpzFyFUswdP4T5cBcvJsBn+Y9BUV6hfg0IM1dgYiiDE1iIJ0Dajea1IKWeF0Ub6UQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCM0Wxx/twfEaCjFXvRSbHx66JuH806FFgTpd+qfXMDdfyvoSG
	EtrY/4AEoWTktgaJyUWisyPMlx1RynFBhxvyTtnniVwyQCDXbWlWPSatNVY7aD2EYQ==
X-Gm-Gg: ATEYQzxWtuxJEZvyR7kLJ7b1PkIMiQ5cWgm06UFJhCJFSf0hzwQvgZ9+RvNfjkdDZFA
	CyH/xGb/JzqDgL0UMzHtZv1PuJg1HO08SXOqY1ESp0LhLvafbI2Ujxw3GHMp2hEb0Be0tIdbSzz
	k9LbRHWmmI19lCaa6vz8oDBYeHmg7WOttw59QvU7Gy03BH2yc4S6fruRZqnVAWIuFhDhB4cTdIo
	FqNP57BkCzA4+nAG0fMe2u6JDE0xOdHYeUUwDAnLDby41xPIx10J/5bY+JkABEfGsiQUm6SnZcv
	KFoIAehPyat0BaM/SfdfzxPv87benmfA2W/Cm9tFUjIKepboQ26UskmqFPVtSs43dYGJQE6vOzw
	VNUDLFgRSH6NSSKgiSQdxgfTwDucZy7DotbllqY1CjNcC4BVKc2m2xU9txdWTTMtax/VaIO6511
	UPPS41aEYDhq56Tpma2+3eqNpaUYepalWrtZi3EBHUj+e9cJeGabvtRYZk6uKMMkQqvx/1Khqiw
	oNStg764q/0c1w=
X-Received: by 2002:a05:6000:2384:b0:437:6ec2:b110 with SMTP id ffacd0b85a97d-4396f18175emr17635178f8f.52.1771844088002;
        Mon, 23 Feb 2026 02:54:48 -0800 (PST)
Message-ID: <2ed69a62-81b5-4f2b-9c35-905530bfd097@suse.com>
Date: Mon, 23 Feb 2026 11:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] xen/vmac: Delete STDINT block in vmac.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260220214653.3497384-13-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AAF451752DF
X-Rspamd-Action: no action

On 20.02.2026 22:46, Andrew Cooper wrote:
> Eclair complains that _MSC_VER is undefined (a Rule 20.9 violation).
> 
> This could be fixed by inserting an "&& defined(_MSC_VER)" clause, but the
> whole block is entirely useless (it comments out the include of stdint) and
> the top of vmac.c pulls in xen/types.h specifically.

And any other user of the header (tboot.c currently). Wouldn't we be better
off having vmac.h include xen/types.h instead of that useless block?

> Simply delete the block.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Either way:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

