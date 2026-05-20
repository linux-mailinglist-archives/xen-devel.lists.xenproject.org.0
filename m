Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iyAqIZKiDWqu0gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:01:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD858D298
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 14:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313875.1583904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfbV-00077u-TK; Wed, 20 May 2026 12:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313875.1583904; Wed, 20 May 2026 12:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPfbV-00075n-QH; Wed, 20 May 2026 12:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1313875;
 Wed, 20 May 2026 12:00:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPfbU-00075h-4I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 12:00:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPfbS-0064tR-M5
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:00:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da268-e002-0a2a0a5209dd-0a2a4503bac8-38
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:00:46 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0da26d-672d-0a2a45030019-d155dd2eb527-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 14:00:46 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so1562093f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 05:00:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ed2f738sm52188037f8f.16.2026.05.20.05.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 05:00:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779278445; x=1779883245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7vh+Jk6AkFaG+BUdY0B+EcwpmSUibGLaUtyDHyh//wg=;
        b=RPdrwH6/7EaElQV+QHSixq8o1z5xao8KUhf2ct1mhRxEbdzLc4Tjkx4Mk8Nq2qEhiQ
         TGxOQItGbJUqFx3sMV2J2UFGxwQGsKx4HOm5fGLFtulQsHZzk3SLNzTjACBuypUb+/6u
         YXRhhetkLsmLO6AOU8cbgmmevuSFBP04ccgG+7EZG1Q2Ky4ZhdKCF1/0ctjQiAh8G1MK
         kcPfXgpIT2bDVGf8ChpTsZyzvBm3474oD3z1dQ2sndmqllIt3Z/dQeFmMjBQ5lRBEdFm
         dxx6eJJCgQizztgJT9Lmb5uW5aNdqsqOedDXlETeWiYwu/3xO7ms40It9Yo9yAPNHZvt
         usDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278445; x=1779883245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vh+Jk6AkFaG+BUdY0B+EcwpmSUibGLaUtyDHyh//wg=;
        b=nsvfNhY+SqOiTGhY6Mxn7UgfP06GZVREDctWa9R2V2/u2i29ByJI28bJy2gImRVJ0h
         e9D3rWN2XyJKxreEZTgcW02JzlekLuRTrJWAJTXmvhiEyGXIl5uzAiMQbBK2LEvQYF96
         0ydrcI/S/rqbtW67zjgSCWqv88I8F0BaRpxa5WVprby2iIVL/n3xxeAEzt+VFxXkcjl5
         lfkXiaLp2FcBD+X99kMyaJ780kaZFRqaLOrNreuJIlB9kQ3cjEmBUTf0Lmwb6owgrTlF
         E/vCcupW6axnL46CwbVJlXYKvKdHPu1NP/SRApQMOXtHhx2Z59R1oawIIk5wFnhOm006
         QRiA==
X-Forwarded-Encrypted: i=1; AFNElJ/NLisVuj456eFM2Uv0DW9a2Spt7/RhANnzu16psmiJWS2d8J2Xadv4Q06DpreyhOeyVFWWKOVqrUc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaAlgGRNg8z05dMwIzwuGyc7y+iAzc7r+TQV5ECsjDSMIOVvkZ
	WI9643+1hMj8UbLMpqu4U/mJYeFdQiok/qVfH23wNb/Tnw3ZY0dFnS0NSi2tJPHzzg==
X-Gm-Gg: Acq92OGJnjb4oizAuCtN7v70hCEg66XxqUpkLBRHw1Lm/7KR+Mp1Xvxrt4e8cBWyUAN
	GozTTD5Bo7qAFvKsqjjvHuewiakhAGeqm2azXYqa57EmjnPRuhOf6rCW63SazA2cZ5aKKAdXXel
	Bu+m/seAm5uv2ccJVNz8cizXOUNo+c2ZrOtupuHczm2zf6plShzfiYmGws7Aojy07KoZLALFxub
	vALyK8K2J2Wjb6QybnMQ47QBiDlGLL44msUXweO0E/ObZAmspzZ6ZlQnb0uCf6X7AinBpqC/vgl
	kg8KMMHq4YOGxlltOOqslC6FwmoYXV9HIU8eeCHxi07CYHshbuxSx/P715GPfhjWlDfZoOb8JrQ
	S3hvJ1IdNTO+ngCsgrFWsuh6prTkVTNo/p1cde9hFmeqV01q0vFyIqhSJpjGCpP+1acu9aucGaO
	Met4Dgao3H/2Qlk1Y5yZjkJtekduv9u/uTeUzGTJoxxa8033BkD1aOxkGnvf4ByXHUw3IwkvpIw
	mJhEFrosb7Lxz3hC7BBrGEz231RqLB/aiLf
X-Received: by 2002:a05:6000:2f83:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-45e5c5952d5mr37053860f8f.36.1779278445118;
        Wed, 20 May 2026 05:00:45 -0700 (PDT)
Message-ID: <7cc23a66-106d-4159-bf52-48e4f468086d@suse.com>
Date: Wed, 20 May 2026 14:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <5ee376dc0df448437f386ab2606c42d63a515ca1.1779194154.git.accek@invisiblethingslab.com>
 <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
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
In-Reply-To: <809b9976089eaf02e864684461ced4e939dbcc83.1779271357.git.accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779278446-41396938-716A4329/0/0
X-purgate-type: clean
X-purgate-size: 797
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[invisiblethingslab.com:query timed out];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,invisiblethingslab.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[andrew.cooper3.citrix.com:query timed out,accek.invisiblethingslab.com:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email]
X-Rspamd-Queue-Id: 16FD858D298
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 12:30, Szymon Acedański wrote:
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

Oh, one other, formal thing (for the future): Please don't send new patch
versions as reply to a prior one. They should root entirely new threads.

Jan

