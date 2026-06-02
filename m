Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1Q2sCiXzHmo5ZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:13:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54E62FA3D
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:13:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CoHUHw3j;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325163.1590674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQo8-0008FJ-Am; Tue, 02 Jun 2026 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325163.1590674; Tue, 02 Jun 2026 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQo8-0008CV-83; Tue, 02 Jun 2026 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 1325163;
 Tue, 02 Jun 2026 15:13:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQo7-0008CN-FA
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQo6-000Evl-Rq
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:13:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef319-2eae-0a2a0a5409dd-0a2a45028a80-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:13:30 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef31a-af86-0a2a45020019-d1558035e5d9-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:13:30 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490b4a8e28bso1836145e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:13:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e2b4e5sm80054635e9.7.2026.06.02.08.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:13:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780413210; x=1781018010; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2B1aZ2Jdlpe0bHUGX6N7JFI2p9yocI3stOOe4ZYXzo=;
        b=CoHUHw3jCY9mWWkq5gNS6ASLUk5mbOzpWjWKFvpUytCOUNFQgl2kQpwfKgOaFlAh+k
         kHiK4+dAt82LVwJVXqxKX89kqg9tlK5F3ipZZcQL6sV0VZ80gI1e8tmqiYbr43Nl7jMK
         4bmzXCabTGb+2PuIrlBuqd+zcgmpMLZow0SRX4zybcWSvWNh8hpHZD7W/UF6EPheNKcP
         juBdw8XcqLbWXVWwqp+PekCJD9UIzsfLxmWg3O3KSl+hu9yIt+jJ5pG4j1GiEQgLuMd8
         U2LSZAmPq7P/tnQed2fQwKVB+mbmY8msRZUmCkdsNv0/YhYRwTtNmR8YApGCt7kYTCQ/
         Z0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413210; x=1781018010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2B1aZ2Jdlpe0bHUGX6N7JFI2p9yocI3stOOe4ZYXzo=;
        b=ksDcJZwhfkWl+ooW6LSMtBn6ik5EOJNz2Er8DE9muGIr8kFlQggaodmPdphcpNyxU8
         d/ACdOGO18asL2XlIFvd4WFNH23KiptZkYycIRNoFqyiY+uh3lLEdNYqGt5RGqFtBn69
         oOmaBjSSjYwjovqa/QnF+v23VADUaFghTpUfPqrBXTNlQcOUcJwLKQK2U/Utr01nGcfL
         LWq6Jwr2rX9xEgll7W/BWK081Y5ZEGbAuItmNi79T+pfB34g8rnaJmE2zU0n2bLXr2aa
         vyp1vFWM/vIaZmX39ak6OrZrsLhlqBRcOpxC2rO/mGln9Bl4Ofh4YcnDorGYmyriUP5I
         lAQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bOv/JMtGQUgI1oSHCpQnSYeR+wD8yhhCOsySTwbA7+Biw3l2XxcDulYnzF55fSN2Me5xWhaZHE+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOMUqizC+OAtgRV1zxLt8guSK9Hh36slTgM6bM2OgwKrXrwJ1J
	najt4Cq2OZm62XnGesWv+RsJLn2JfbEwxrGyQuwBD5H9vlqdCvXQERxz
X-Gm-Gg: Acq92OFA6ZsuWZFkpt+PAyHY51/fDx29jWp/0MrkCM0x6NWqWlcCxul+34+XNdn5Xyq
	zgPlivGoL5rRyQFXxniwNzUI6lrZPWQzLZsEewc5ftOjjeC+15Nx0VsTS5eWXsfVoh70r2zrsVS
	JjyJaNK8MXGHNA1PzsuVnxiWuRH2sARjgipsUV/nH2rPTZtwBGCSUV1nyJrlU3bvDu6Y0JQSZJd
	76sYrzDvbFziKWEdN+fPxHbN1mviUksx3Mzgt4wv08VHyoecHv4SGe9i8KmxUWXcUtAwueLStzK
	NfftHFOk00VCCJb7z8MYrDsja+Mal+RrzUSo25AbgxqLFugT5tDOnd1v3jVubsgKETN5c5mvo2N
	847X6JC6Q6Dz7j+pk/XrVUSPuB+BdHtv7GCOOjh/Pq4LLavZ2mrs5uekaLxOHKztA9rNqwqESqx
	9FRFhaSDDcM3FWgkKGxZEoBV69mrBI/TNw3b63ZY68VE11hDIL8A/N0EsrQIy63rD8ey8hAWul4
	+a/49RxNhjq/U6a
X-Received: by 2002:a05:600c:6290:b0:490:b0df:9ea8 with SMTP id 5b1f17b1804b1-490b5053541mr3201585e9.1.1780413210100;
        Tue, 02 Jun 2026 08:13:30 -0700 (PDT)
Message-ID: <af1360c2-b3e2-4a76-933e-2593f26cc65c@gmail.com>
Date: Tue, 2 Jun 2026 17:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780413210-83961161-D322B1D3/10/73395122804
X-purgate-type: spam
X-purgate-size: 733
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF54E62FA3D



On 5/25/26 7:37 PM, Szymon Acedański wrote:
> When netbooting a unified Xen kernel image (via GRUB chainloader),
> the resulting loaded_image->DeviceHandle does not support
> SIMPLE_FILE_SYSTEM_PROTOCOL.
> 
> Instead of crashing via noreturn PrintErrMesg() in get_parent_handle(),
> we defer calling this function until filesystem access is needed.
> This way when booting UKI, get_parent_handle() is not called at all.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

