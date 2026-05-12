Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICZCBF4sA2oR1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:34:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B791F52147E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 15:34:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306780.1578566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMnFO-0003tq-4a; Tue, 12 May 2026 13:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306780.1578566; Tue, 12 May 2026 13:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMnFO-0003qv-1b; Tue, 12 May 2026 13:34:06 +0000
Received: by outflank-mailman (input) for mailman id 1306780;
 Tue, 12 May 2026 13:34:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMnFM-0003qp-EX
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 13:34:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMnFL-006rFl-RW
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:34:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a032c4b-e002-0a2a0a5209dd-0a2a4507cd14-10
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:34:03 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a032c4b-229c-0a2a45070019-d155dd2be430-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 15:34:03 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso4525895f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 06:34:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4549130549bsm33484917f8f.18.2026.05.12.06.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 06:34:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592843; x=1779197643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5p/reA1z4bDeOlhcrfuCX4r5dDlgone514JG+dWwZA=;
        b=daV8KYUXPSH8qzSraz49xMyJ8SyBOUYbgTxp1vrTfHGTGvKZFHY2Hy3x78/2gvGWKS
         tYY+2aSTgYxXCc5VZhyRle2On6h3Hk1Iz7iok6COIBIP+Aw6RYMoRBy7PsycCvjn5Vw3
         X3/oZp92a6SD7TwVuWkXKtP/7Mt9XsukbhvVwAUCcgZ1nEPFSatx34slX88ok3GZufyt
         ieWMRlPVtU5yuCm1+rvj5euNUE+V0FV4lLwCqZjoNvi0U2ouDRXINgqKzTf8SSpiik46
         O3//+mmSX4QuWqDSUxPI8oWq65JidD1TW5wL+94ZjZEgR0MmmNPZZNgw93i5CxWRq09A
         sgcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592843; x=1779197643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5p/reA1z4bDeOlhcrfuCX4r5dDlgone514JG+dWwZA=;
        b=f1hhkx6PhUhgRJHnbmBM76uYysHaubQ6fCWEJfGygfynAt+FpvDjI0dVUmEoMnEZKD
         5lU6JOpkDJ5FkxNXqlV8GV+EIHnXs34F2tzu7ywRnafI09vu+8iKKyjYg8F0Jo8X57UG
         JXAicmiT087noX9dS8dycgDBB6YVc3bN7P1Xkv2HfefuKIEv9t7n6bSama/RKX6fbPS/
         rg+sKmjenNC2onZx8NNw5dT1dGpfvLxLBLiidrjJtK2L+dOSeGapXFOl+KF/1RyFCxep
         4sH5b+e8qvkw9YHqBevYNRvpkgwQtGv2973EEAFwA5THTA3Z6QgvKFmXj7ZcDDNOmtbW
         BC/Q==
X-Gm-Message-State: AOJu0YycM8+O0Fgse2OVw9gFY9HXAdS4/zZLjiKxi/1+1yULTCk8Ae9G
	ObqNUgV9s5MnsB+a18ipfecPG8S5zksd463JkpGFpXV+FrzPWoBLjowUSs1RTg==
X-Gm-Gg: Acq92OHE+xd6SkiFdgrbJZz37HhncPDA0H+ZBriKK6D3J5mRnUb/uGnuXzi6CKBT1Ku
	+mYFrCa/qcxRCpR+YVcd3gtOMvXEIm0Hm0mVDspRmYmdDeTobaGVLisv8z8fLNUF6tL81VRSQtT
	gfVYBMkxda6jTCd1sYENAbA+oBnod8E6gWfhSVDfhIYv7OWFtppscI3Cu9G+gWU5qukG6uMZ1n+
	xNuDo+k2KoYqeiP5uaTABJqNf2bFsqXACImSJAqwG4ieC0/tPUyJ14d4yftZguNd3UbeC8ewYOz
	4hQzVDVK6rlHKE5NPv6GHctc7eIqAyYYsZEHGD8P6H+0VM9q9PhgiBySqzkVmfD1QDdVP3wg0nv
	+hMNf4M03kN+Bw+3xa+CcCCcyX34Ymqi/Nk3Cm4a37wwjCZqbiyqkZF5AqTq8bxp4C8Z8SSc4wb
	wfcX7uuXEDrITcNew1QHf1lMHwDuzEhIoOvN9TjxsJRQ1OFpGfWuKW/rRa2fNJzXZRykSCe8QuX
	vI=
X-Received: by 2002:a05:6000:2082:b0:43d:7e34:889c with SMTP id ffacd0b85a97d-4515da97e81mr44959588f8f.39.1778592843025;
        Tue, 12 May 2026 06:34:03 -0700 (PDT)
Message-ID: <0c35fdcf-dd0f-4565-9c66-9319e0d14aed@gmail.com>
Date: Tue, 12 May 2026 15:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
 <agIlvjBPH4ppBuKY@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <agIlvjBPH4ppBuKY@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778592843-2236CC48-0ECF66DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 766
X-Rspamd-Queue-Id: B791F52147E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:community.manager@xenproject.org,m:committers@xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hello Roger,

On 5/11/26 8:53 PM, Roger Pau Monné wrote:
> On Mon, May 11, 2026 at 11:35:55AM +0200, Oleksii Kurochko wrote:
>> Hello everyone,
>>
>> I would like to inform you that Code freeze period is started and will be
>> until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
>>
>> Bugfixes may continue to be accepted by maintainers without R-Ack.
> 
> Hello,
> 
> I would like to inquire about whether changing an option default value
> could still be accepted:
> 
> https://lore.kernel.org/xen-devel/20260511185145.23750-1-roger.pau@citrix.com/
> 
> This is not new code, just changing a default.  I believe this makes
> dom0 PVH more usable out of the box (see commit message).

I am okay to have this patch in release.

~ Oleksii

