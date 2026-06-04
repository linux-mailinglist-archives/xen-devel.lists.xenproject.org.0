Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id avaSAuiCIWreHgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:51:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB8564088A
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 15:51:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tz7M3Ctu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1327893.1592609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Tp-0004R7-Lw; Thu, 04 Jun 2026 13:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327893.1592609; Thu, 04 Jun 2026 13:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wV8Tp-0004PM-Ib; Thu, 04 Jun 2026 13:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1327893;
 Thu, 04 Jun 2026 13:51:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wV8Tp-0004P9-3t
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 13:51:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wV8To-00A7kK-Gx
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 15:51:28 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2182d9-bab6-0a2a0a5309dd-0a2a4503e99a-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:51:28 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a2182e0-672d-0a2a45030019-d155dd2be5aa-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 15:51:28 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so420650f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 06:51:28 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm16657209f8f.18.2026.06.04.06.51.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jun 2026 06:51:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780581088; x=1781185888; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6cV/OkCq+wO7XFriYcUZuzONnaq62fDanSpEqmPtTuM=;
        b=Tz7M3Ctu334drVeFZe2tehCY4SB/zsIJvXNShAr9FdlA4WgOR+zqwJXd/pLqHrrl6C
         0VAkmKU/k0XLKPWy/j7hTYIRlaB1LpQR+5Fek2a4/Q5Ca6IFpPoJ9ooKuXdjvHILu1N+
         kWbLyaOIKGH3tP64VpG8vwLsgcyfIPsaV43uGdcZdXRJ9EEmvGBqCEAvoBrqamzBOAWo
         CwbtydohbaIBS9YANKpxfLcgvrQplfsqq9Zu+8bPO64pc1QfVO6rzczi2Cl3eoTAkntr
         AahzmbTy//w0xoIr3QyHGgEdYcEC/fsHTWpab7QjZR5gCrkVkON7qmGMbQekvZbsH2K3
         1gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780581088; x=1781185888;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cV/OkCq+wO7XFriYcUZuzONnaq62fDanSpEqmPtTuM=;
        b=h08t2Q0aBdPZhb7TxV9NxzZqgp8xn4caWk0gf0FXNhvmFKDdmVTdCsfX0rzHiULCNr
         0hN1l1rQToaCox095Pmw3jo2yaLl+OUF3arprkn3W3RBQWOwZQKKtI4ft6ILQkqqL/xj
         X3EOzU2xkmZR4KC/FTjZ3jqqSjF561l349HTlcV4cyc782JYWk27tpVsjFE+nAMTE5GZ
         lZ13RBALlQ9N2ZYQpf/9RO/ORsyinnxNWiDYL+N/vlXPm3LKv5MrdHQKrmOHp0ZBu/vg
         hFCDZSnE1E6vevWn5h/lC6xhZeCyYKiL5UnNbnTMYnJZojxj/2M7ACSYyvLtbgsi3eQO
         Rw2g==
X-Forwarded-Encrypted: i=1; AFNElJ/mvSelplqA93rcZlacWt+RHawHC2gefNae7h15WyHicxXuTI9tw5iIp2I0v44lzL4AcmDPca0W/XY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEPp21BREcPWmvedzwPs0rg1ILV0YtpWRG7mXYmPdDw/+kWJIL
	I9qdlpOoKHEqz/P/ETIuRajqaiO2en+9KdCJbmLwgoOrGUQ/EASmOzjO
X-Gm-Gg: Acq92OEYTtXQvLJl5M4pcy1HBjVpJmJ2RZCXb36sCKvsyfSrxIc5PN03rIIs/oF1LyU
	W3wKAypNTVq7edmTJO9nhm50Ww3k5Ug51192E8PPlMqDBh3C+nCXLdHe41VDbiEfFQM1YwStpgC
	67k/Y1ly1Fnbi6UnkMc3TyPj67Z0W4Gsjf4l+bn/QYGZ5WYFvxU1lrvtsIcOjUjM12T9tlradTv
	Dt75AriRaCrOoiIQkvFY6OEhIRMQnJph/JteHm7CIFKi2t1B49raWTzeIpq7fOckJoh139tuXnT
	RAUqMS4kpjBihIZ3m1dIQKVGcl0lDQB9HA5F6tTeBHl1hhXdaBq4uCOszxWtkGWE9rW80EP1Fz7
	zM1xWzfzZaS2604srPU4Jwk/h3bki92qfsYB1BhaGAIrhjkd4DMo+zHQrZqA9LTuH7+W/2TDwLK
	XgOJLVHi/xR90c8yR+c7F+jCUjo88s8+Pm9PHcixd8IAooKyJEz8HNh+a6AvjFjxg3irP7ups+j
	eeoU58Mp+sG3WhBIY8vuIcvXKg=
X-Received: by 2002:a5d:5989:0:b0:45e:eef5:b51e with SMTP id ffacd0b85a97d-4602181fafdmr12774960f8f.23.1780581087831;
        Thu, 04 Jun 2026 06:51:27 -0700 (PDT)
Message-ID: <f5cacd49-0647-4e92-8cbd-3ed058bebd70@gmail.com>
Date: Thu, 4 Jun 2026 15:51:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Remove .cirrus.yml now that CirrusCI has shut down
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
References: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260604125530.2718761-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780581088-4066C938-C46D95A6/10/73395122804
X-purgate-type: spam
X-purgate-size: 196
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9BB8564088A



On 6/4/26 2:55 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

