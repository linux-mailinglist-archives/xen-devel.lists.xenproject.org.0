Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFtPJhJOuWnj/wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:50:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4532AA1D0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 13:50:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256102.1550806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Trd-0001DK-Ch; Tue, 17 Mar 2026 12:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256102.1550806; Tue, 17 Mar 2026 12:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2Trd-0001AH-9X; Tue, 17 Mar 2026 12:49:37 +0000
Received: by outflank-mailman (input) for mailman id 1256102;
 Tue, 17 Mar 2026 12:49:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8en=BR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w2Trb-0001AA-CA
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 12:49:35 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf38b455-21ff-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 13:49:33 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso50524975e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 05:49:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4856eaa4fb0sm69406085e9.12.2026.03.17.05.49.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 05:49:32 -0700 (PDT)
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
X-Inumbo-ID: bf38b455-21ff-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773751773; x=1774356573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=340Z7SYxTrLvTn40QEDHoPgyt7oFXcQVpMKjn0Y3oV4=;
        b=K+eteeE3tKuPs2/UguiLrsajGZ4T6B/TdPQV2+Vh6KDpBvAVr+f8+ZjpXEfaO6oKkY
         l7Q4GyyTlXQA2y4jH080Jtxiz5vpUE7V4IX42D+ogwJ+Klx/Tb4nnW2jPG0UI1SmA23p
         491aP+xBmGA4Hf532dr7nbu0XnIJAKquiSom8AU8pSc8BCCH/SC0hsAOk+yRgZRNgVel
         6/HAdj/wcJl/PzS0jQGvfgRAEKyxq0Qhafl6e4v4jQFIU0Ob4W8wi/AFTq9nMfSX8sSh
         K35LBT1gQVMrAQjei+wfFahQHHmvr7CIfhldsecOjTf/2Y4pwANOeEllWJF9pju9Z4R4
         gCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751773; x=1774356573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=340Z7SYxTrLvTn40QEDHoPgyt7oFXcQVpMKjn0Y3oV4=;
        b=j6asx9q+/KT6VgXEMH/x7+ONsTmsAF3eTH06GVCgyTEPyq15rli/W03VKZvxsmy2au
         BYNa7ThulItVcAzxuh8uRgzQEAtHc1WSR1C6MXlRDXyMWVQ5C8C8Sdc4vXEPWb8pKYwa
         SFFha2/ea5QwZD53Xjls2e15W9nexlu1FiBRODA668cb5pZUrfL+2Crp+MRT7jM1al5w
         +315qee1PwjGAAMVF9wVXkOJH1y1vJw4+tqVAPwEKBV8jSop8/ot1lR0rG26vwEsO9Jl
         gFhdQQRQDMJDDLy94Q2Dsrbz4bH+Nqdp1656ad4FctJrmtFerb16q3WkYK9hVtVqHc9q
         5wnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKMJlg6ZNQ8af21JMERx11CnRf3B3l+6FzjqRdZmccw4Rhdp4o6yPa3GntYMnKq4cgwwrpAswEcl4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4wnRYHwf50K84Vg6ruHkP06cl3heYmRsuTJx+3BNDPWGXfkGi
	JIJS02awrmHuvfgiZPSXmU6Bk9/ZD08oAt1FZeIpBLKz2O/JvNsWWZsm
X-Gm-Gg: ATEYQzyCf2CeiZlYtJxpHXjSkKZGSsacEBnHjBPAf5C7T+a3IHIUwd9PKTbekoreJ4q
	Itflty0xjMTSRLen7yUFZLbKGoxV1HWiaP0H4uWJ17Wo0Blh3Ov6YYckwBiDOwB3x+bsxQdRi+g
	5O2QT74Lx7j3YVjhpMFQhyE19mj6aZ4KboxSijH2JmGZ78KeBfCDoQqtVFx133TFmXeXbm+GkNy
	2u17TtTEDJRYv2joLFCMgXEbUG7Ek3mh7E8W8WBzkj10WTx5CJ0/PTvQHcEWmCM4YlzkzJzfQwL
	X9D8TJlmRGHEK8lm5t+sTrItjtb1aGO3lacpei3AcNrHFLS+2nCSZybbW+h/xNs484tNAjDcVJb
	0q5zuvQcr038DkQqftuNd6O2SKlv50zkci0Yb28RvrCApv4X5d8LKTxTLTL+ucqio5Vxseo9B9/
	hgiu8LgkfyHvsnBR2F/70XoFm9wvYs5sd8mUmoqi5S7vI+H0uerji1PcyF5ACOUvDsiLpfxQrZX
	ZDtVO+NQUeGYg==
X-Received: by 2002:a05:600c:1e8b:b0:485:4278:24f0 with SMTP id 5b1f17b1804b1-48556728bf7mr283490375e9.30.1773751772291;
        Tue, 17 Mar 2026 05:49:32 -0700 (PDT)
Message-ID: <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
Date: Tue, 17 Mar 2026 13:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
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
X-Rspamd-Queue-Id: 3A4532AA1D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2/13/26 2:11 PM, Jan Beulich wrote:
>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>> +
>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }

(cut)

> If all you want are 2Gb guests, why would such guests be 64-bit? And with
> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
> even a 32-bit hypervisor would suffice?

Btw, shouldn't we look at VPN width?

My understanding is that we should take GUEST_RAM0_BASE as sgfn address
and then map it to mfn's page (allocated by alloc_domheap_pages())? And then
repeat this process until we won't map GUEST_RAM0_SIZE.

In this case for RV32 VPN (which is GFN in the current context) is 32-bit
wide as RV32 supports only Sv32, what is 2^32 - 1, what is almost 4gb.

~ Oleksii


