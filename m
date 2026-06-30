Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WZMxAMKpQ2oWegoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:34:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2F16E3A80
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 13:34:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=BHlml77L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348743.1606440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWie-0004mH-PY; Tue, 30 Jun 2026 11:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348743.1606440; Tue, 30 Jun 2026 11:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weWie-0004ji-MS; Tue, 30 Jun 2026 11:33:36 +0000
Received: by outflank-mailman (input) for mailman id 1348743;
 Tue, 30 Jun 2026 11:33:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weWid-0004jc-DA
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 11:33:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weWic-00GMjU-PS
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 13:33:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43a987-5cb7-0a2a0a5109dd-0a2a4503bcec-40
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:33:34 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43a98e-ec1a-0a2a45030019-d155dd33e1d5-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 13:33:34 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-461edb387ddso4264374f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 04:33:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475643ce016sm7097021f8f.16.2026.06.30.04.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 04:33:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1782819214; x=1783424014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wmUYcoTUxyH/lTZ1kWTPmSOZA2RPAK7qF+A/BvQQyj8=;
        b=BHlml77Ly70BSnNdWdUDxlAFBC9vazHIU0KEomi5t7h7TqxfLGuEEjVtn/ujM+Fe+v
         9LHbR+5/Abc3s7ByZPmpicjob40aiihHsZbwiIbq1HJbmIhmoxhnrA+IuxVSgDMS0Rho
         bzTG34ejG55ltYE/IYSK/zquxrLstUHLN/HCjLWK6k5CAc/vu+Dg9iisF3nhX72Fs/E5
         iqVybm8Ksszpp3fnhcux7aiOwBN4QDdPaUtV1HhPBteqJBsyQmXpPSSUEe5EvV+AgOQc
         fdsqkLwE04ozA56ZL8rkU7UivCAmn2L2A/pb2jGg9/Vx/ofrAq6E7lpOFAe/58z5hrEC
         5HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819214; x=1783424014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmUYcoTUxyH/lTZ1kWTPmSOZA2RPAK7qF+A/BvQQyj8=;
        b=f9DEMVuC4PngWXdkjZx9BijMRz6wHz+NkLBBo8y2l7Mz6Tnk4JFSY3dsgExIS+rr9C
         bY6Jzg/TIYReqxKUeuajqCUUCDMZl1JDSfcLWkmdPlN3lo/oESZ/a2EkZxyzrwxXzln3
         TxQcOt5UfSgSYMr7BEcEVw6H84w7yVvG02+ijHYIhcmJozysrxy8dTTp4I4M8680UWhi
         tYekVLxTemJTQ+yM2h+ht05c66c4EkHrkS1T1Ka1Rrargm6Kbhg1TMZtgEPmtWi2QsQf
         Sbcg6HzzK91GEEItnPCtchp1tAMUuJAv628HL31bSDJRaVGHwffccp7dUE7hLR7aKWeu
         9Gmw==
X-Forwarded-Encrypted: i=1; AHgh+RqeDCuwViKFHnANmKQi1pVhdid8jgiyuVBK2PK7QudafdEL1Jq1PonIx40HxbDezzfNGDakfJYxCbo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYmSKRowTUkV2C763y8tItJjC7ih8d8dsv+Sng4PCJlZmxeZx4
	Rxpvp7Rq2k8SJQ9vd+oOv+pEBlOon28zkGAERX6bkQjXPwCItItnWNcZmZ0H8syC9A==
X-Gm-Gg: AfdE7ckG68kGWMtmQogFG+xL3dAEmaTEFbd/4rxR9CM+umt8BLFdrXqy4tbT4RwmDHC
	1vasv66WRWqGIUSVDTUV805laMG6UXG9L04OfGh4uSUWte6QyKBF9fe5KDxKYluTF15FqfpBBjw
	Gy3y06uGLHzUEtr+KrpEzkdIAI0ziHlQglLawuw3H3jGnUuj2jwwXLLUmSlOvreb3ggupQys8Re
	nXUeAqti79jDnT0HZAYeEqcB/puUOgp64Qu6nHX5974Cih/AKGBs6KTaSaUSQh6FrmXLtxFUNEf
	l776ZWM46agOnu+LKBeyB1l94K3Hf0Rmf+rHz16kvk0f6LdXcGiQy+gTVbPiO0x5vnZCNPN3PNh
	B8/TuEt5V5+F0M6uAAxom80XcphHjRwFz5/Qg98kbxMCc8ffshC8w/ORBErp9rVAzG92mQbATlr
	5CpKUy+vjTKbSgfq3xX6LKcIFtnpfZ7UFpUPM4Bux4eeyTlfmejhd4zkv3s05AK2RujXlUwDz6F
	h/7
X-Received: by 2002:adf:fe45:0:b0:45e:f302:95b with SMTP id ffacd0b85a97d-47552d49bd5mr3427395f8f.37.1782819213656;
        Tue, 30 Jun 2026 04:33:33 -0700 (PDT)
Message-ID: <719d3796-0733-4429-9427-aaeda5b514b2@suse.com>
Date: Tue, 30 Jun 2026 13:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] x86/boot: Exclude not used string
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Frediano Ziglio <freddy77@gmail.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
 <20260626123645.229375-6-frediano.ziglio@citrix.com>
 <103263ef-3f09-498e-a901-2d5379f8ca5b@suse.com>
 <337c18ae-1018-415a-a1da-ea65dd59fa73@citrix.com>
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
In-Reply-To: <337c18ae-1018-415a-a1da-ea65dd59fa73@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782819214-B75275D1-153A61E3/0/0
X-purgate-type: clean
X-purgate-size: 648
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,vates.tech,invisiblethingslab.com,lists.xenproject.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D2F16E3A80

On 30.06.2026 13:06, Andrew Cooper wrote:
> On 29/06/2026 2:59 pm, Jan Beulich wrote:
>> On 26.06.2026 14:36, Frediano Ziglio wrote:
>>> If CONFIG_REQUIRE_NX is not enabled the string is not used.
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> I know you're both trying to be helpful, but this patch really isn't.

You should have said so earlier, now it's in.

> You are both aware that I have a full series about NX handling in
> progress, which deletes more than just this, and also needs backporting.

That'll be impacted only marginally, afaict.

Jan

