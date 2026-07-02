Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76BOJ50hRmryKQsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:30:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440A56F4CBA
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 10:30:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="spjkFmI/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1351398.1608578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCoF-0003QV-1V; Thu, 02 Jul 2026 08:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351398.1608578; Thu, 02 Jul 2026 08:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCoE-0003Ni-Un; Thu, 02 Jul 2026 08:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1351398;
 Thu, 02 Jul 2026 08:30:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wfCoD-0003Nc-Ec
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 08:30:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCoC-004z4r-LQ
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 10:30:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a46218f-5cb7-0a2a0a5109dd-0a2a45068e4a-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:30:08 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a462190-08de-0a2a45060019-d155802bd557-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 10:30:08 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so10148815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 01:30:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477ddf0f27bsm6635969f8f.30.2026.07.02.01.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 01:30:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782981008; x=1783585808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsk+mA5ccbSsLd2AnIRidezsIDLf8OHFe+UNICemn+8=;
        b=spjkFmI/R2WN3KlCYU1Kt0+/hSxpAZy2Li90UUfmqYCCJOT6uSCPwLdwmFQ7h5MEI7
         NMepQQXud58RfstJovK4I0ON0n8u4/qMm5CzYoE3hL9QQFATV0jUaW2SDEVRjf9zcnV1
         SotkskTBl+39pAI53cacQ3FLk6j2JUDQ1VQh3Kr17m9hTgVx7n8ZZXkmES6TzyHRuiQU
         LkKnfpu0yPi6b7YRChRe4YKytadxHJA8qo6hT39TPx9F4h030RgRUn1+wLMKy8r1WqAi
         5zYqPCcNojqxaFT8pDRu4TTLlmGfW6ff25cPas7EbfZ9V29tJvlhXNPzD1yYKhVCM5to
         Dvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981008; x=1783585808;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsk+mA5ccbSsLd2AnIRidezsIDLf8OHFe+UNICemn+8=;
        b=MTHkNQgewKUppEmSKVm2h6XtL3SUPdj80NlQiX7qGNZDNb7PAlOr8TkZ3+C9CIQPT6
         FekYo0EhIBABUDsEZ+msHzxMTH4uflK7L9yxgCgzyq0+9dG3ryBz2I+yfV7L9R3hHfzr
         YHqpleLYhG/3jSJz47JQRNcoXVei/Kc2RxgZ9+V9IimET6UaZc12z7+5fvvOlnIfFYrN
         O9we15PtMuIcrplgxxzda0zbtoRc3nKystTKVUAxJUO/pv3T3fwUixTHOWhXmCzDEKhN
         ltzF9uY/45zkTPRNm2UKgXO2p6RlGzRZ6cKNe9Z2NUgfGTAoljs3jUrIs6YYmzN+Exn3
         jm1w==
X-Forwarded-Encrypted: i=1; AFNElJ9WKp/fimabQzdLRcMR8p/tF2fzyMaxrblvP3TUADzV0d8ELfFo/QFu5Q+uPYzxGaO2RumKdKSDalQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvgOFoaZB0oQjN/iCDrxPichxV4uu3J0104b48/YcvX0zvnBhd
	+l4nlezUIVSjkxnFHITCEnOKHWTqLJtR5tpZByCZtBrPUjuoZm6Ehqnw
X-Gm-Gg: AfdE7cmdRSRijoIn9tYBoKPzhgM4Z1Ii73P66JPYtHz1ZFGL8p1Qh3Agromq44r/wat
	yhPvnhs8t+BopoOb20RvMxOQCTe1nIPsjgacIMIgJgtGjsFh2/ETHNMBNDgaezMRU4VASbRFu3N
	bBpg5MUJxqzaDxSZ+o58KPl7ah0dt5nnpTOqA3L6qRK+OgUzSCQvvfLfDPcpXfkvKYIMog1bEOI
	/+SxXNXSPJS59GV+mLE1GWIqmUaTngIOrtSGZSz5t8yRXcvhkX2YbYdzpcwBuR+5+XSgqVS/oc9
	510SVYvoZVeESGnBZGW+1Ij36JlctvM0GWJ4h8hRCTD3Yev2m67SXt5OQlPpKRqqx0TKu540PRP
	ogdJyG4kIBgrUA7z5pZIPB/F4Xc7T2l5kxhtCnwsHZ9UPXbrZuFlRhFt+pw6Nb03uOQdPgC/IRJ
	ChAdnvnf9w1ivOggLXAMUVt0UFD5CSxBLDVqfpW91HS1CjZvcD63VokRmocZyxQtsGY2w=
X-Received: by 2002:a05:600c:8590:b0:490:b2c9:e284 with SMTP id 5b1f17b1804b1-493c2ba2397mr59581315e9.30.1782981007928;
        Thu, 02 Jul 2026 01:30:07 -0700 (PDT)
Message-ID: <1562ea63-7f17-4748-9380-94712dd84d1a@gmail.com>
Date: Thu, 2 Jul 2026 10:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate
 input
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782981008-F8FEA68D-99E61713/10/73395122804
X-purgate-type: spam
X-purgate-size: 684
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 440A56F4CBA



On 6/16/26 11:03 AM, Jan Beulich wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog
>      to obtain an automatically allocated domid.  The prior sentinel values (0
>      since the start of Xen, and DOMID_INVALID since Xen 4.21) now no longer
>      represent a wildcard input.
> + - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
> +   string sizes need to include the nul terminator.

The patch isn't tagged as "for 4.22", but the change in `CHANGELOG.md` 
makes it look like it's intended for the 4.22 release.

Do you expect this patch to be included in 4.22?

~ Oleksii

