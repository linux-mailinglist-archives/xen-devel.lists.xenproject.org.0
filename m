Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MmoTDNr6MGr2ZwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:27:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB22B68CD76
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 09:27:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pmPmFV68;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1338738.1599787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOCS-0004Tz-VJ; Tue, 16 Jun 2026 07:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338738.1599787; Tue, 16 Jun 2026 07:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZOCS-0004Ri-Rs; Tue, 16 Jun 2026 07:27:08 +0000
Received: by outflank-mailman (input) for mailman id 1338738;
 Tue, 16 Jun 2026 07:27:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZOCQ-0004RW-Sg
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 07:27:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZOCO-00EKES-Nf
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:27:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fac8-2eae-0a2a0a5409dd-0a2a4501842e-4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:27:04 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a30fac8-c1f2-0a2a45010019-d1558032d8ff-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 09:27:04 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490b9318997so30114125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 00:27:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea95c51dsm284043735e9.1.2026.06.16.00.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 00:27:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781594824; x=1782199624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrSYDPDlVWjUeoucDY1EObQmfc5ahfrAVbGngBPnjxA=;
        b=pmPmFV68aLliLEC4H4LDjftZwVbbippWcDFIRTAA+JG/nXEn2qdaidLd7ulyDpBft7
         NTYT+oaTRm6q3EBHFU49QfuEplsg32q6SyE1cgCl7c3DkJxd62dDb4jNEuvGDCnppys/
         1qTvzG0EIP49VGH0Ki7mnAloRoSAw2YwjBq2ByVMTmRp1hOOjeQ6XSsBqR8qH7XpAokE
         +wOzeFElVxqHV63Lze3cpZRcZVKK+u+6J1qSj93Q4GmbUghAeYVcuWNLEmUoYv3ZnndD
         LxUaegWAa1amAcP2lqWd5w2rF+eE6eFsKoNZ8oHjXONyqsGiwz9HMptFXQyCa8+Oh8Zt
         raDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594824; x=1782199624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrSYDPDlVWjUeoucDY1EObQmfc5ahfrAVbGngBPnjxA=;
        b=BxjClqGxbQ2LAwABMN7nvsAJ2KK/iY1u5zJm6ouqXjQA9WMinfP+sJtpyJ4WwhU6o9
         BOjAKrtw4U94KIFkLAj1RBsOIOclPB9wK2NqGusebcf3USOt/zy1ZQFN4zpl1Am61gf8
         +xIRaGjxC/6qWtXhXq5vdvEkqEW7V76SHIVHbKLrBdZIwIx87EDZNGuDb9Ub0TjsErCH
         eteVi6IFK9oJ0irVlRuuR09GBHffJpJKTOq/etbpPwHYMebvwHNG3KwaaVva/+uWOJx0
         7cum/HuNAgVqrjpnlsl/Pc9ftb9qOXSwOc+uRIcPojHUaPC28t9YZSrO996xXWPfp2Dg
         dw+w==
X-Forwarded-Encrypted: i=1; AFNElJ+dlj+7dpOEu1SV0/eFSwAlNlKyO/nBF+KJPe0DrZPMyVMPrTKZ92OAq3zrPEzpxETlr1srmq3gea0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDLRtFFc1eJgAdoCA665KFsJ0Gb0TC5NTAobVMupwRx7gwiKo1
	aO++H99LZ+OjL2cDYU95jYRqPyMeuLcG/q0WBufVkr0yaaj9vgtSVgBGEXVjvg==
X-Gm-Gg: Acq92OEr5cSDid76p4DJ+QHYIYtYCT45Isj4CjH3xt3OaQxbl5ZMQj4Wwc2UZVlpZf8
	agUREme9Crd4Sr4C2+NGDMZoxAZz5F9+igtA3S/txqUWn31KdBvAVjtleBsrsKVXGqs5oPDy9jb
	cJxMoJCDNrxPyKOb+eSbKn+80NwwH5Ub14yXKXienVOf13zHob5TkaiP82nWxgTm0Kw2cHjuPkz
	NuRy8UQYy6kLG2VvKfLpdre1hM32u0kftu+vtIkr925GCtfTYyTA6hlMZxTy1maLY/gd0Tkviqw
	g4+W8EUWRTgZs4AmJnZFnvlUTXQ9mN5DbQeSP/bKwV4IkiAI9ANFoPX0u94KIxvRYJK65HUWKfN
	Muc5wJWFCbSmyWkJWgeqH9ZFSXKaVhZPUB0wFn4/XKzdX0GHQMpsgNbFUltbu+GRk5hUbjQbF0/
	59VG7fN65t4bj51vVMIgemfxgC7No+7lHy/rkLeLoWop1F5lOtWr0AcC+5E+tT7ypTw3nHAz7Rn
	rf9Cg==
X-Received: by 2002:a05:600c:4ed0:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-4922008485fmr182428755e9.7.1781594822563;
        Tue, 16 Jun 2026 00:27:02 -0700 (PDT)
Message-ID: <72c3ad29-1bdb-467e-8dc3-c326cf60cf13@gmail.com>
Date: Tue, 16 Jun 2026 09:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 4/9] domctl: error code adjustment for unpriv
 callers
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <ebb489d4-0670-468d-abd5-8d130636ef45@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ebb489d4-0670-468d-abd5-8d130636ef45@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781594824-AFB56FF4-19BDEFE2/10/73395122804
X-purgate-type: spam
X-purgate-size: 558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB22B68CD76



On 6/15/26 4:13 PM, Jan Beulich wrote:
> Unprivileged callers better wouldn't be in the position of figuring out
> domain existence from error codes. Adjust the respective path sitting
> ahead of XSM checks to produce -EPERM in such cases, just like the
> subsequent XSM check would yield.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


