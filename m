Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxReMLQnV2pvGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:24:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276F375B068
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:24:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SwobyDzW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1362731.1614497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt2s-0003sa-Ei; Wed, 15 Jul 2026 06:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362731.1614497; Wed, 15 Jul 2026 06:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt2s-0003qC-C1; Wed, 15 Jul 2026 06:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1362731;
 Wed, 15 Jul 2026 06:24:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjt2r-0003pz-9X
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:24:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt2q-0024MQ-MP
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:24:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a57279c-e002-0a2a0a5209dd-0a2a4505defa-30
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:24:31 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a57279f-4cb1-0a2a45050019-d155dd33e8a0-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:24:31 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4629051c9d1so1061843f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:24:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464b7f84sm13342334f8f.27.2026.07.14.23.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 23:24:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1784096671; x=1784701471; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bP7rDMZY9EnWc+MEZ6uDlnQYnD7am0dErmxyCAOtjac=;
        b=SwobyDzWjldApd2RRrqKncoq1OPlZpo/dFOTxbZSJTCLvONmgs1jVRfNRnBFqcJBef
         RZS3N0wTUpfLN3iKHL+15Qe13nTzcj9aqhQ11mQc+niygb9vTop5AezS1xLHFThNeAD/
         RsH/Fqg31KQVhUQb04cIcYgnQhgOPgKhGB31ipGVghAgFa8DmdCi4s3AK8SLpvjweUMz
         nVXv/vIVHl18gDQatC9S32Iq21/qYY7TD0hQPxTSrBKpHan6K6U1AO+dk6uCmvm39zqp
         3zaFW5NYOiitlp+dwb6Z7XwfDThjipcqKMM/Ygz0Z2sW2FyPJp90pb2diNAE39hAWGW8
         NmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096671; x=1784701471;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP7rDMZY9EnWc+MEZ6uDlnQYnD7am0dErmxyCAOtjac=;
        b=lJyGPLuf6LsDXt5zhIawfwUnBBKOexCWHqqURUMEiTf0v2gzc3kakuCSAE/T9rpy0/
         QXwTjiTK2qcM7zg0jxCdUzg2570RtLVo05JPxbcT1wIMIfW9Lqc+YgzayM1y5NIXesaY
         LKfJXtf7ZwaQXhpzxceSX44RiedsU/ctX75lsey3J3AqPA2HUhl9jkZxr+thUzbfSbSi
         YCQZgXDyvgZqkybLpUNZsNIWrOG2jXTp0ohrOQIu9xnkx3asVKrkGxL+qq5cJNbQHrIH
         yIVk72paLxQaLH09TK4vDto5XN7nWb1fbmhDYP+OBqSRaF42Eupxf/mQqc2nRKE0jzpg
         JjTw==
X-Forwarded-Encrypted: i=1; AHgh+RrZ6u2CMZ4ojg/P1F36CYpDSQ+KuAtoCwlKupqdPz0r5coe0kLEqNgeNc1x7xVdeQr/pxqbtiwMpS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX/vlkSZoC39cffylL/dr0HRayETPsUb0I2WQaObzdq2SgSb47
	Lv0vLiTodeIfhPwixXkpmH8rr93BfzGJAzvAJmpeF4GkS2M2u273moZaTyBT25s17g==
X-Gm-Gg: AfdE7cnq1VAiGl3nPXMyXolS0d7rPXVde/SJu6zmyS6VsSrOTzR9bTx39AShEv87DNh
	emjdrreUty6OAo/cmuhhEE8rY5LPIy2iadjMa9uDr7QeSUhyxIopUilsQbflCEuThCe77+UDGHS
	vlnJEKCV1EYsA4NsJ0aAFD0upAE1G94hFpuW/7ZA5HrO8gXYRwMbs665yUkLX9RLAuVtLlKoreR
	NoA/EcNJTf/1aH1/+hUpsVBCCx1hpb7MALkDjNEhAlGfZfFTZ1HUYfm8ql9v+98/cPAoRHTh28K
	DyrJt/lhg+YfV89oxtgFqzfM1Y5kYmkuy+toCjalVCFPAIFyRjJSI/2V2m4a1CE2F+R4r0ozrkL
	JBFV+3B5yCTljUEkAJEfpAtndYaKMzOUqoZDKpOlFlR7QEbWMBaFO6XmhzxZh5b796x+FZkYD+V
	fd7UZjIDMT6tjzT9yIbwngkXwxt8KrXXXtyn/QKT6cIvxQzzg23jpwItINC7mCF3PVKpyauKmWx
	OdE
X-Received: by 2002:a05:6000:4020:b0:474:d7a5:4b7a with SMTP id ffacd0b85a97d-47f2dcd7881mr18454459f8f.28.1784096671156;
        Tue, 14 Jul 2026 23:24:31 -0700 (PDT)
Message-ID: <9a410426-8ec8-4314-91e5-d76a73275ad6@suse.com>
Date: Wed, 15 Jul 2026 08:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1784096671-F4AA72A1-F50FBF85/0/0
X-purgate-type: clean
X-purgate-size: 1151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 276F375B068

On 15.07.2026 08:22, Frediano Ziglio wrote:
> These patches improve support for Secure boot.
> UEFI CA memory mitigation requires memory pages to be not executable and
> writable at the same time. So changing permissions and splitting some section
> is required.
> Remove multiboot pieces from EFI executable.
> 
> Changes since v1:
> - improved some comments;
> - merged 2 pacthes removing multiboot support in x86 PE;
> - removed a patch dealing with SBAT;
> - other minor changes (see single patches).
> 
> Changes since v2:
> - improved some comments.
> 
> Changes since v3:
> - Added Acked-by;
> - Improve commit message.
> 
> Changes since v4:
> - Messages updates;
> - Clean some dependencies cause by code removal;
> - Add small commit to remove a possibly unused string.
> 
> Changes since v5:
> - removed merged commit;
> - remove more code/data from xen.efi output.
> 
> Changes since v6:
> - fix commit message.
> 
> Changes since v7:
> - added Acked-by, all commit are now acked.

Forgive me asking, but why did this warrant another re-submission? We've
got enough traffic on the list already.

Jan

