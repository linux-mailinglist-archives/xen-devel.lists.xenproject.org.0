Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PdeDAev7MGo+aAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:31:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8468CDD7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:31:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="oiB/xt5y";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338752.1599805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOGp-0006v0-Lf; Tue, 16 Jun 2026 07:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338752.1599805; Tue, 16 Jun 2026 07:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOGp-0006tH-Gw; Tue, 16 Jun 2026 07:31:39 +0000
Received: by outflank-mailman (input) for mailman id 1338752;
 Tue, 16 Jun 2026 07:31:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZOGn-0006tB-Pk
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:31:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZOGn-004tq3-6J
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:31:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fbd9-2eae-0a2a0a5409dd-0a2a4502c162-2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:31:37 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fbd9-af86-0a2a45020019-d155da30f0a2-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:31:37 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bef47b1ac01so591578366b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:31:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bfdb7b6dc48sm598107566b.36.2026.06.16.00.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:31:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781595097; x=1782199897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgq4liH7Jz4cbnB2BqbOfY+iuZH2QCjiC950WcU4bEA=;
        b=oiB/xt5yyMfrQ5B760rgo5SFYG1ZMGZtTSMM9Imgdxk0EASHtl9NLSd4XaRenyNawx
         VU4t1qmj4FiI8HrLL2Y9Im939JTR+AZXt69SBIISBwzpinw2mD7WEpYmyRrrvFag1MIE
         PghKdGJsYwC6yj0D0MFehAsIZE31c/liH9ujRVtOkrRUN1engU4uvJEkpArA0LBHhGSv
         EBAY5BIf46Av1eywX69wBBXDfvN19j9muEHZ1uS98MMbhEwx1Vyh+izi0XPJ8CzXbXKA
         0iZUnPoz1RbetQAJnnwdRsl2TFNB5YqA+ZXsaWL8GBFU8wS3o653IKkbHZS5Q26t30h7
         P/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781595097; x=1782199897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgq4liH7Jz4cbnB2BqbOfY+iuZH2QCjiC950WcU4bEA=;
        b=ReKnKn3fNPgGQ6BPq1cpIPVv2spmJTt4Z59Qg2wl5z2KDGZCokSmnT48RV3fy3Je8A
         knZgVpyuWlGtya6H19tLXYu15g+Zhm4laojJQRHlu14OI8TrTb0Ml1t540HE8Mbmb1Pa
         k/cJJjL4d+ytEJr/5mUAWmVsJ0WrjdeTB8cDdbAf0unaSH19pPqmQkvVaQTPBG9FxIJU
         Zyd699VQR+XIsEL3PaBHbyyHkwIpFMcmaCSAzIOkFj8Hgc5PnhcdkzHKudyqO4e0NSiF
         9D0rIqGee3ig2d6OnKCa6LgCwRM5mmnHQ8ytxM3viEwfSWEjSjr/MCITM0b1gSwKKYrG
         h6iw==
X-Forwarded-Encrypted: i=1; AFNElJ/r4DkFG3//h6R63ewWNmeCL1H8M0v9tQGNIaEWMF79ODYtYBbDWLomShTxPW02ePAO3eJVnki0mt0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2YOU9tjZj6nDRaeOSuYnzoUBoiZ9CKKYmCEIkWdRqmoLzVfBe
	NC8+xu0sbJtrbIeCL4c2cOkkrBsZ+zZx+Or9Psrfe7M2XIEZ1NHWiRA9hfPzxg==
X-Gm-Gg: Acq92OFgRfN3lOcEp4CvdSc/uWaICQvdD+BxaHG0BWv1SSlD3MNcdhPxSCmKpqqJFLZ
	YC39GM7524a2dnFD3z2sFbE1wVA0nJTLJB4Z+FpPK+1D3hdH9le2fHdCYDKCFWnqRD3p2Ka0Xl/
	oTk3WNdMBlywgD180oC4RIe7DEGAO2Q3mkanT1shnb7ZX4R5IRDqnwVGmG1KVMv6D0mtMQ8ak6O
	2WGjiYad/bfCETXIbNuJErgd29/brbMLXdW6oJXg78So0V/DzO1ckabaoKoy1vCoSaA493kbICp
	TTQU23Gjod+JZ7O3Ta+7DN4T3eELWdGC9njplOl8WhVZj0CeIf5vlF3iBcaoMGsFgQGNs+sXrgJ
	DHIJzaA3t/a6A4ajy5MUeSgkreCvFdb62/9tE9VSoAsnJtQjz9fsUvMow0fw45qQq2ar1V40/dI
	LQIDilGbaZ0aRo4tu8/5cJRpL+Y8fnfjWDeDKCmf9B56lec77cEv9dYSTqZAKPqBJ9H62aPAQml
	Nkcbg==
X-Received: by 2002:a17:907:a28a:b0:bee:1e36:8772 with SMTP id a640c23a62f3a-c043cdd53a7mr104867166b.20.1781595096024;
        Tue, 16 Jun 2026 00:31:36 -0700 (PDT)
Message-ID: <a20eb654-8d77-4778-ad1b-09424065a69b@gmail.com>
Date: Tue, 16 Jun 2026 09:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] Revert "xen/cpufreq: fix usages of align_timer()
 in the on-demand governor"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260615193944.19392-1-jason.andryuk@amd.com>
 <1fbb67ab-09f3-4924-b6aa-139fc5d1acc7@suse.com>
 <ajDxhjCed3cQ81od@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ajDxhjCed3cQ81od@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781595097-AAD6F161-50A43679/10/73395122804
X-purgate-type: spam
X-purgate-size: 1152
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A2B8468CDD7



On 6/16/26 8:47 AM, Roger Pau Monné wrote:
> On Tue, Jun 16, 2026 at 08:30:25AM +0200, Jan Beulich wrote:
>> On 15.06.2026 21:39, Jason Andryuk wrote:
>>> The original commit showed a ~6% regression in a benchmark.  The call to
>>> align_timer(firsttick, period) rounds firsttick up to the next mutiple
>>> of the period, if firsttick % period != 0:
>>>
>>> align_timer(0, period)          -> 0
>>> align_timer(1, period)          -> period
>>> align_timer(period, period)     -> period
>>> align_timer(period + 1, period) -> 2 * period
>>>
>>> So adding the period (sampling_rate) before calling align_timer() will
>>> in most cases incease the expiration to 2 * period (sampling_rate) (the
>>> exception being firsttick % period == 0).  This longer timer slows the
>>> reaction time of the algorithm.
>>>
>>> This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Adding Oleksii for a release-ack.
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

