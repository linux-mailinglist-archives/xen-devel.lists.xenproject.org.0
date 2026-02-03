Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOOvEoAogmnPPgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:55:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010CDC566
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 17:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219454.1528335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJgE-0007rJ-2Y; Tue, 03 Feb 2026 16:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219454.1528335; Tue, 03 Feb 2026 16:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnJgD-0007po-VO; Tue, 03 Feb 2026 16:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1219454;
 Tue, 03 Feb 2026 16:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAHx=AH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vnJgC-0007pW-Ab
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 16:55:08 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17ffa6e5-0121-11f1-b161-2bf370ae4941;
 Tue, 03 Feb 2026 17:55:07 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so45386265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Feb 2026 08:55:07 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482dbc75e13sm159215225e9.1.2026.02.03.08.55.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:55:06 -0800 (PST)
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
X-Inumbo-ID: 17ffa6e5-0121-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137707; x=1770742507; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XsSi4Q8EqnCN+SZczj4ljcvdhwxdA56p88LOXavBXcs=;
        b=Wx+mAa7xuaDJ6ws9kku8fMWaX246lpq77sNoFkVYH12xxMn3kOv257RsGbFT+MfMe4
         KlDyFPjYeCoGXONXH2aFQB0EFi0W2PZemnCaecwBVDIfbRYLX4FzdGXmuEBpQyljw+Y3
         aFivPnp3tK6aSitR8Vu3ydGchwf6Mo/zNeeHGeQpHUbk0iYvfFbqRazlSrF9vuV7xa3P
         Ae/pDhMGA9yHMXLv1x0ycqpWWeTwV1eDVdY4IGO4mFFNSbEDiTVTaupRCg+a/xTu8Tuk
         3O1zIKKVv1GEc7lI118HvEQkGxLBCGO1I4eBYAyfza8MVVxlANG8eqJ9eqvk9jobY/PM
         z8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137707; x=1770742507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XsSi4Q8EqnCN+SZczj4ljcvdhwxdA56p88LOXavBXcs=;
        b=HOR77fvbIR9F68PfuBrqMmqVEyYw7ClN8EECVNC/0xWPLwlP9QrFil2Voj2Q8tvQnc
         hQqOciNdnbEmBewbHmp0kXy+iMnxNkDcdrxoySHJW9wacgWeTaz0LoVSSO4+ga2rBbsR
         9ps4qsfTsEl5gIYEtnXHfwvstIYVfcu4+A918kRLQBH4AunMY/VnuNVj06b6Uk8TFMnV
         z9IjiJ28Kjn6M/nyEQYKKhk8WlRN60iKXe7xAnFtmXkrPBa8Pt5uIQRKLsn/hmFytkPs
         OAxuBcoWg7jiDX5S5eWZKT3CJ+rSA0aDB+Xq+vQ1W7OSGP/roJpQKgvpr9Og3rHey65S
         D/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUtEFRqtxHuq+0TwmlqnHDwRnD5KU9ZBVvKHmXq98IYF32aWUpbWd5xCRBmCGxAnoRK7m8v0MmLHlw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuZde/KF7hkwT4RlSlMmyWLoYofQvrmS7UzWNX8p2sET01Pkqw
	yB9hnZelNpiEvrCeK/KxqOPvq2OifZva35megihUe+q6ESWWvJhjoUNK
X-Gm-Gg: AZuq6aJ8HNzZJ2cdbAPGOnWBvMPSOGEvUK8aVTFsgA4esNUGJ9DxZvXVoJoUvW49wu6
	yXBZ0p9wp3/imGOLcboCTUAlQ7COkysMJMUBNZUdx7iMf9tlqPcOqwuC9T2mfzb+pnjKvagAOzw
	xVx/BgFbfyaubx70NrvCiIuHO+YoHVyPwUJ24oX6+Oplnv4aWTZgukAaqe4rDsHJpjM+xbNO23W
	znHI9pgdKptMSNLNUisRewM8F1Uqu9M3wl8uDkEo+vpor1zatWv67OJzqXzdixOzNSdgIzJ9bzX
	G0h8JcLPq82XXL9mI3nwqvRKRt5EXs/COFLWTdwM/Goxu/eA7FSpsbvo5Y5KLIpTYXnhZ3HwKug
	hfNtJ7XD66b8rsHN47OpcRlhV5hkLRaxGN5izhUd5JxhrNNnh3dYCgwlMH1cBPmFeKey4t8aBvI
	mbYthmGCClW1vcvX3xQPe+IEdjOSMj+qtMQS3q+l/80bYUenfdVir0O29Q9Jxvqrk=
X-Received: by 2002:a05:600c:1381:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-4830e949290mr3390025e9.9.1770137706753;
        Tue, 03 Feb 2026 08:55:06 -0800 (PST)
Message-ID: <63655a5f-1259-43bb-914d-9e1a79638abb@gmail.com>
Date: Tue, 3 Feb 2026 17:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce basic vtimer infrastructure
 for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <381c200edaff013d999c6314c20e8cc8bdb5b041.1769099885.git.oleksii.kurochko@gmail.com>
 <ee928798-73b6-461b-9c43-b34778a4f89b@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ee928798-73b6-461b-9c43-b34778a4f89b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0010CDC566
X-Rspamd-Action: no action


On 2/3/26 4:47 PM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> +void vtimer_set_timer(struct vtimer *t, const uint64_t ticks)
>> +{
>> +    struct arch_vcpu *avcpu = container_of(t, struct arch_vcpu, vtimer);
>> +    struct vcpu *v = container_of(avcpu, struct vcpu, arch);
> Why two container_of() when one will do? (Same again further down.)

I didn't think that container_of(t, struct vcpu, arch.vtimer) would work
(as arch.vtimer is embedded inside struct vcpu. Is my assumption correct that
if it was arch->vtimer then it won't work?)

~ Oleksii


