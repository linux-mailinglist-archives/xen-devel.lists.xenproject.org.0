Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XGNYEFm8KmrWvwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:47:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE566726FA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 15:47:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=UiqF4UdE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335546.1597729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfkE-00025y-Fn; Thu, 11 Jun 2026 13:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335546.1597729; Thu, 11 Jun 2026 13:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXfkE-000244-Cs; Thu, 11 Jun 2026 13:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1335546;
 Thu, 11 Jun 2026 13:46:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXfkD-00023y-LE
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 13:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXfkD-00AwxU-0b
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 15:46:53 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abc44-bab6-0a2a0a5309dd-0a2a4505b6f8-30
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:46:52 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2abc4c-aaa8-0a2a45050019-d155dd35bdfd-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:46:52 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso4334849f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 06:46:52 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm78545635f8f.12.2026.06.11.06.46.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 06:46:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1781185612; x=1781790412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/HZuT9k6Z48d6OVPdJE9YIhgJiAiSSch+MUzdSYF09k=;
        b=UiqF4UdEjcYnfXfvPDWh64V6w4aTh0a+jTB5uc7t4PgWHH5jKLUPhgZkwlJcb1XciJ
         +qyeZMPZ+x3X65lkRbQmLRHMffP4HZH8j2aiJVrMLpEPuFjM+rP6TNH/XaJyPHPXV3Dh
         f7km3h3a9l4l9lg3keisOxhFE6knLImypeSuRS5k9sT56cXOp2h77xhVSdl0baWU3iEj
         g3KBlPvItIQ5vcvCg9IKRlMXmktrTr9pqkRLqYFYXnIF4eYZOSsvOxzMjerzSmfeOYwI
         FKLfu1KokW638ADEcBhfqCqOeZ1Row04uwE0a4YB/1DGDiQ8FLwva6EArjCiEIf+9gLE
         zytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781185612; x=1781790412;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HZuT9k6Z48d6OVPdJE9YIhgJiAiSSch+MUzdSYF09k=;
        b=Jarmm5HKzZW/huko0sFPDVSjrX2b6Tx1NwneuvcqRNm93aKO7AviIP8zmZnEvORysw
         3RN8lZOmUq9ySlNbgbF4Zj7oVJGj93CwTYOm+sqJJu4TfLhxmMf0qGTx6Fu8dAPCKZV1
         sEeD/95kLrE3h4CBLyzONj4n2Z6z+H/QGKQguL329fBlJynEiNCH5K7ULpfLBbsM2XHy
         SW4o0gEFqXMuoEayal4WNa3H1kWlmQhXOVIlN8/eO6It8X0u5beqy1532JqRekfT6iln
         NkzSN6iZURiqX5EAWrzqsMohJ3wMhJjRxeLUL34A491xDP/TOKTRTl5EUbJbUuUid/sV
         h6Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/ig3G/MYORDZJWvOMCcw+zEnImFbwiF46Qbq5hkeXyFBqBZNkuOY2Tyn1A3/RoBIlgrlF1mkQ/Abw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLK9n2lG5BI7UgXZ9fPLlKnNg4nX+E3WUX9GZG5cNrLWG7bzS4
	rd7L4UjT+UBzquOomx1VLUjK2aStp0sILcB2IC6U5N4X7a3gr5CSEy5urKzvAtfc36yMp4HRc8R
	z62Q=
X-Gm-Gg: Acq92OFQdT4LrbEBf3pcsrIHTIQkNm/+gXMRWXEU5ajVKllF6aAzxJ6ozpQkcESB5rq
	6/8+LSRpLfU2lcFypi9IxtdxuErYceofhg/mslc2qRh4ZEqVO0oy2cdmJf+9iBvEn3k+gHwyzwR
	x9gvkBiQH+9e6W20gv2INzsJgVCjwwBw7Quv0HFJWaa1xGfjZpZPQvrNThoxakaY09OqJpoUOll
	QOB7g7+nTKSNUqsv0NpSEdrJ9hG+AhXgzhWc6qfzQnu4EyO/VqS+e4X/D7zX60Ndo8olsC/IoCE
	LezEgYcxJ1jg2I+qAbNa1mU94dw3L9r/pP2MpPd7qiMZ2mHiZkX9gaztIT3YU3otvE7pVueOsI2
	mNgkYGpdTIfm1jZg7RvVT6wN//X2L4dY9Ou2XULXmMDgaAVwYHpLhnuyir4Jt49ogXh2H/DMBiE
	ls6qWMjmk04t2v0iEpwn2rc2WWyf9wgeN0fh86pUl+lD7iFiTD7agO02rk4mLokQN/npi/OThre
	+V6mnOKxwmcj4+itqb7DNwumEdIXYX0PF+RcusKlmLPEEY0AhQrZL1M4iC3cGn7nh0TjXs=
X-Received: by 2002:a05:6000:1844:b0:45e:a0ab:8bd1 with SMTP id ffacd0b85a97d-4606746a073mr4464970f8f.7.1781185612463;
        Thu, 11 Jun 2026 06:46:52 -0700 (PDT)
Message-ID: <906bd0bf-39a8-4c0c-b158-a82c81428984@suse.com>
Date: Thu, 11 Jun 2026 15:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/rtds: refill cur_budget when extratime is toggled
 on a depleted vCPU
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: George Dunlap <gwd@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9f20b6ac8176da6c67e1084e862158a2e47abc40.1779285422.git.oleksii_moisieiev@epam.com>
 <cafef621-024f-4c3f-862a-4c61a1ab4293@epam.com>
 <46ec5166-e147-499a-acbe-d3115551db42@suse.com>
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
In-Reply-To: <46ec5166-e147-499a-acbe-d3115551db42@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781185612-DAD6F443-213EE1A8/0/0
X-purgate-type: clean
X-purgate-size: 457
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii_moisieiev@epam.com,m:dfaggioli@suse.com,m:oleksii.kurochko@gmail.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[epam.com,suse.com,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CE566726FA

On 11.06.2026 15:43, Jan Beulich wrote:
> On 10.06.2026 08:50, Oleksii Moisieiev wrote:
>> Gentle Ping.
>>
>> I've already got R-b from Juergen. Maybe someone else will have time to review?
> 
> Dario,
> 
> didn't you mean to submit a patch to ./MAINTAINERS, after which Jürgen's
> R-b would suffice for committing?

Ah, I now see Jürgen sent such a patch. Oleksii - then a release ack would
be needed for this fix to (finally) go in.

Jan

