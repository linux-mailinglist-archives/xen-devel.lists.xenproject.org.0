Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEA/H/pJsWlCtAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:54:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247732629D1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 11:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250999.1548318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0HCm-0005DC-H7; Wed, 11 Mar 2026 10:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250999.1548318; Wed, 11 Mar 2026 10:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0HCm-0005Bh-E9; Wed, 11 Mar 2026 10:54:20 +0000
Received: by outflank-mailman (input) for mailman id 1250999;
 Wed, 11 Mar 2026 10:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w0HCl-0005Bb-64
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 10:54:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a61a1051-1d38-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Mar 2026 11:54:17 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso10390966f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2026 03:54:16 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81aca65sm6670892f8f.17.2026.03.11.03.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 03:54:15 -0700 (PDT)
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
X-Inumbo-ID: a61a1051-1d38-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773226456; x=1773831256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gwAyAPqxP5WCH8T6EQ/P0JblAV3dinBl+SEsGrTfcUU=;
        b=aoAjKajMDRMA8S9R1oEadxhIR9WcqsYA0SZkfa+VhUu7IxL5ToMxdsj5X8BxSczIWN
         AWiqvPaYE9eyBfvpTQSUh+QJ5LXUVjW+UpJWXLECq0H8dkSPttZGH5g9QIJ/veYM3Vod
         3SPsV6O8gbC3GoX5c+0ffz5sSvr0ogs9BP7GWRtH0cHzBrEeQF7CZKzDHkBJb75CN4lk
         EuusahLagX6rW2yH3wvvM1ovPRq40g4v2j55oRx2duFlHGGulAG913AS44Sax4cIEnTn
         hoB/M/vnk4Lz3VP4kPMdEX6utP8+1rkRU79JoW1BmML25U/V9O/0VOXoqV6DrsUmIJ2Y
         VJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226456; x=1773831256;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwAyAPqxP5WCH8T6EQ/P0JblAV3dinBl+SEsGrTfcUU=;
        b=PZwJf2d6IQ79xB9rHhcxFcZywS7HMX+leMEr8SVQr9XXqWPh1ncsyIm7Rrt3CbBnVy
         1MpZojGzQXROrfpH+dgulZGuLWKgn4WgaijhjtaLd4rjNB5lCIKvujVUmuzKDC5YdLA+
         aBPj63wON/iwKhqb4ql/Oqk6gGguOFF4Enl3HXB7EKRLAxI+vrywcgBv4PJa5NH+j9In
         N4bWDBYleLpNu83J6sI0+v3r92GZ/n9x82CXB8G1aP78HQZK6Wj0YvIRTbHOyjGvFRhp
         c7kICCdqjPmo1jLNsSimRSiEeLGm60pfxw20dl3mdqjeEno+C03ld67PkmdqF9iAsXH3
         60Nw==
X-Forwarded-Encrypted: i=1; AJvYcCViZz+pCc/hvJ54XMDjfE6sbU2dYA9wP6NTUB0/vH0FP6j4VZhHXjFxIkhVlK6BiVYWl4GcIMtITe0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvSobCmBlby1z2oE56K8cGwO/NT4qlmwRlCeGmwIq2MNbOjGBd
	Kc9uGFnRsFtErHoh4mrYTF1OBm2JsFXpH193XlrVLn+7cI/H4zcsj3KT
X-Gm-Gg: ATEYQzxik7RTeulhZcEfDyxV6so5JIFSci+YVwdLkDo5dNVyTznDk01uomRxHaNLCKj
	z/aBEgOQlMVFrSrUQ7Qd5+j8zIIfy1cvTWXn9f/j5iopI1hvC6FLecRdh+7pY6rkUk1MzluV89z
	tysCQzgS1f/0mTAwAdjEYwa2gTEBgvZnhil5tHW9nZDHSTa3giMO75ezHtg3SAGL+skZYkupBQp
	bhUW38Eyw19AoxhEYpkx+ycTM8EtrsXEMgXCD7RN7u9rlcrsHPUb6U77XEgXUQLxFn2sTrTcpyE
	ImUKRxinUKuYHA+HeepJpISKZIzoSW70EkUZ9LQe7NOWRxTAM9cV9Mw3QXNE2KFJm3J1ZpMW+a7
	xLtw+glE9HCihUEwS1WxLjBMNKJIxux/wlv6WhAFJT8Y4EAipymtP7mjfybE1X+SzT4tAvh6jp8
	YBye/dAavhc93N0RuwbwIB9QnTqBLrOhgV0EPqi1TsToaoIqvbrsVEVUwbVX4uEGZOTp62zfXtn
	wk=
X-Received: by 2002:a5d:5f93:0:b0:439:b057:cb12 with SMTP id ffacd0b85a97d-439f8205f60mr3856849f8f.22.1773226456060;
        Wed, 11 Mar 2026 03:54:16 -0700 (PDT)
Message-ID: <e3e5d4cd-8ef7-45fb-b677-204a8af379b3@gmail.com>
Date: Wed, 11 Mar 2026 11:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/14] xen/riscv: Disable SSTC extension and add
 trap-based CSR probing
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
 <9ff93ad1-0151-4f37-a6c2-f7dd4197ca84@suse.com>
 <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
Content-Language: en-US
In-Reply-To: <e0a891c4-3283-4e1b-81e4-f2b4bb62b5fa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 247732629D1
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,cardoe.com,kernel.org,wdc.com,gmail.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action


On 3/11/26 10:54 AM, Oleksii Kurochko wrote:
> On 3/10/26 10:15 AM, Jan Beulich wrote:
>> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>>> Some RISC-V platforms expose the SSTC extension, but its CSRs are not
>>> properly saved and restored by Xen. Using SSTC in Xen could therefore
>>> lead to unexpected behaviour.
>> And what's wrong with (or what gets in the way of) adding proper
>> saving/restoring? Also, wouldn't a guest use vstimecmp anyway? I.e. what
>> saving/restoring are you talking about here?
>>
>>> To avoid this in QEMU, disable SSTC by passing "sstc=off". On real
>>> hardware, OpenSBI does not provide a mechanism to disable SSTC via the
>>> DTS (riscv,isa or similar property), as it does not rely on that
>>> property to determine extension availability. Instead, it directly
>>> probes the CSR_STIMECMP register.
>>>
>>> Introduce struct trap_info together with the do_expected_trap() handler
>>> to safely probe CSRs. The helper csr_read_allowed() attempts to read a
>>> CSR while catching traps, allowing Xen to detect whether the register
>>> is accessible. This mechanism is used at boot to verify SSTC support 
>>> and
>>> panic if the CSR is not available.
>>>
>>> The trap handling infrastructure may also be reused for other cases
>>> where controlled trap handling is required (e.g. probing instructions
>>> such as HLV*).
>> Hmm, won't you need a more generic way of dealing with traps anyway? See
>> Linux'es _ASM_EXTABLE(). See also comments further down.
>
> At the moment this approach works for me and I haven't had a need for 
> more
> generic approach. I will look at _ASM_EXTABLE(). I haven't checked yet 
> but
> I assume it will require some extra fixup code in trap handler what looks
> like over complication for the current case, at least.

I checked _ASM_EXTABLE() implementation and so I will need basically provide only
for now implementation of EX_TYPE_FIXUP what doesn't look too much and is comparable
with the current suggested solution.

~ Oleksii


