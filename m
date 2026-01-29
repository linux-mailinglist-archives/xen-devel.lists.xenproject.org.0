Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFM1JgWMe2mlFQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:34:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA44B23E0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216859.1526779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUy5-0006uZ-6I; Thu, 29 Jan 2026 16:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216859.1526779; Thu, 29 Jan 2026 16:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUy5-0006sN-3R; Thu, 29 Jan 2026 16:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1216859;
 Thu, 29 Jan 2026 16:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUy3-0006ru-4p
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:34:03 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517f1141-fd30-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 17:34:01 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10153045e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:34:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e132303fsm15827255f8f.36.2026.01.29.08.34.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:34:00 -0800 (PST)
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
X-Inumbo-ID: 517f1141-fd30-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769704441; x=1770309241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2RxVW2ZuPEVl3xAbIsuPf+Wrc0pD3R0gkpUeQ1mBnrw=;
        b=JeDCfG1QQpjLN939g3S0UqK4nVBQhnM+BRlTU/pT4l6IwmEFkeVGMiRZC+2jlYGWBM
         VR9jZuYoael8dubAyJDiWxX/zSetDHVtnoGqpf9LAv8LzmI7YBdfc5Nk/1ttgLF2hXOf
         tBltE9dhYgjjVRvGd/ZSeUPOW3lCu7zcKS3HXr7IdXgxVxKD26P/leqMdFvBrfgGjq0o
         iaGbIn/SHpOAhuGiFB2MKqxtwzh3pU0tnw10WiY4+t8ZfOsQq1lq28c+P0ehPqR+JNjn
         /y4PsTVEgTdkCQ329LFmwY0v82B7q6O3dSvAUm0FWhB1T2NnBLpUFUTgCIA24gdDavrW
         yTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704441; x=1770309241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RxVW2ZuPEVl3xAbIsuPf+Wrc0pD3R0gkpUeQ1mBnrw=;
        b=HEGBTlDml5At9hKoPY4z75mYFT0MVXaFQo5noQy9r3IjCEV/tIRQwXDQ0Qtd7xNYxe
         5UoJbiMEd+MtRIwO4PWIK/o3a3QCWMEgxefk82ii0ljTD6YHWN4sJ4Dg90wFvqhSI+32
         Cga69fCY9m0NtQJbFNfoBdgt9gO9FBhjyByF6fNCv+alxb3UON74XvPm3nnKi5viESJU
         rC0Q/Ap5a4OIbGju6heXMZqh316V6JTn3VDgml65PcoQoAbCXG3gOhtON69zBKp6IUb+
         0/76Z7aQrvT9AW1QpJ9Haqr5rx2awjr2AWWjBK4CzvFpCBj02Nid2tQDhHTq5itSXR/A
         BSOw==
X-Forwarded-Encrypted: i=1; AJvYcCVUswfeAAXqAPa1TbxIu40fciBkxdd5GR7TCSkv5wbhYQlI19rAqIPZu1K8DkBVbi7wGwzJwC7laEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+k5znhZEfF1kDMnUUxzFmwEli54d5dzpSqoRnrbSY0qDxeLRt
	8z4VQu4TJTTHWPf8BV4Um1wEuZsqwvntVENjycIB3jurlvnuapEdaj+zUgnWJPamug==
X-Gm-Gg: AZuq6aJiSlEcPA/Q+sMPO0JJYNc2JTNJB5a6EjD+KULtWTYrN055nSDgEfVLldjUari
	k1x2JZhDeUcmb4AQpisRsNrvQMorROvToHuAF9pB3PSHPBGuBIioFNZ4v90vFTFRcDGTkUnFwc3
	5njDvkr7pDFQllTh9x6Fz5vHYuDUpX0u5c2BF5osna1dCh5F4bU3mMjUEMhxGzd0BOF+kW99icR
	McLo3fRkppefaPsJHiPCSy8LtDsoz8duoHn4ecKpvNpd+lf1uUx1qsR0SDC0Ix16UK+ORNkqa8N
	Dspz0wjvFOdVI9zZlc5N33spz95H1Bvnb06zy6VslzMrANqEzC3j7eUnghRdvaaRDdXp4FkGXfL
	N+cb52IiOax6er4aC3mIEgcrFn0l0bEvZxCXdkZC9gLTOgoQf7Dzm8TdLf4S3ETX3Ix/49wfrMd
	KPxO6AmQUCOubMj8LjBNsT6BE63rew2+qmSGjV7PPKbMoZQnjotyoSeTh/mrLZXAAD+SPuKvPQH
	Qk=
X-Received: by 2002:a05:600c:4fc4:b0:480:3338:292d with SMTP id 5b1f17b1804b1-48069c8b7demr135726455e9.31.1769704441109;
        Thu, 29 Jan 2026 08:34:01 -0800 (PST)
Message-ID: <ecc58454-05de-4814-af60-e4766994c92e@suse.com>
Date: Thu, 29 Jan 2026 17:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] xen/riscv: init tasklet subsystem
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <36c05146c82f20f7760ec7f1de9700a2f1c698d8.1769099885.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <36c05146c82f20f7760ec7f1de9700a2f1c698d8.1769099885.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1FA44B23E0
X-Rspamd-Action: no action

On 22.01.2026 17:47, Oleksii Kurochko wrote:
> As the tasklet subsystem is now initialized, it is necessary to implement
> sync_local_execstate(), since it is invoked when something calls
> tasklet_softirq_action(), which is registered in tasklet_subsys_init().
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


