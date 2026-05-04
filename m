Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PMTC/cu+GnsrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:30:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932894B8880
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299451.1573984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlsn-0007A8-5i; Mon, 04 May 2026 05:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299451.1573984; Mon, 04 May 2026 05:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJlsn-00077J-2i; Mon, 04 May 2026 05:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1299451;
 Mon, 04 May 2026 05:30:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJlsl-00077C-Rc
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJlsl-000lXg-7o
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:30:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82ee4-5cb7-0a2a0a5109dd-0a2a45028e54-18
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:30:15 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82ee6-af86-0a2a45020019-d155dd32d0c8-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:30:15 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-44ccbd3290aso1044417f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:30:15 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44a8ea7cf97sm26878502f8f.6.2026.05.03.22.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:30:14 -0700 (PDT)
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
        d=suse.com; s=google; t=1777872614; x=1778477414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T7JyXY5NZkmu9/6RGLXJGddgZg0NDceorMZVSok/X0s=;
        b=THiroiKaF7wfOdWeh2Th6YZ3AYgibV7cfdOGBREqpXITME25b53g/e1+GJiIabokSa
         f6qqmO4HenFzNwFYLV0ZXX15ZXefMaC65jfiGwDgWihFw6iDFxPicHVAvScYCsqD2StH
         tRDvnuSvq/jyb2UoqQKhhil7lbvj4gDOI4Rf9rBjM6M/71XWi+yv1MyYctaAtuafT+Nu
         0peJ88yk7OjQEZ0ppKy0q/YZvyx99XIeFqXtWENP+o05wNnGHQ8Qyx5D1dkgZ/cNAnOh
         VNfelnS3rYhaK+XtduyKp/4TW4nyoMst8Agfd+CY2KQL5DMvbxQulER1/wrsHultxDMD
         52qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777872614; x=1778477414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7JyXY5NZkmu9/6RGLXJGddgZg0NDceorMZVSok/X0s=;
        b=KjNBxnQzAFYnlBRHvKDAEkOC4ZXd9GnXujRXcWLZaxtUHXau4k27GsJfBYJVBAo1cp
         O2I/8837wp/vhO+GerPxy6anepDdRPTIkVlzyui624taIQTVk/auyfkKiXjZLkYopz80
         OZsE9bou2BGErM5Z3ZLu4rvdi8FKekW61qfXNbYuhDE3NcLHTyQ0rzIp0RRaXRFt+dBV
         mAiIELF/QTGy9ySLN+iZHLeq+44VsOXjTa0JIVCimbmWf/hjXFkDiMwu1PNQtKi45b+7
         Ew3QQ3nJoXm8A9ikhg3w9kN7L01cpdiR40qWgsNc3Z4HXBTCHXf3AoDr9bo06ohSkONc
         DJ0w==
X-Gm-Message-State: AOJu0Yz4EpWwMLnQAVhxAsMDtWOQO0n5dS3f8xa6hgrH913P27JNcMMZ
	gufgD1b4uNwCJnLvGwh8R00uI4gHblH64KUVJtK/HVCh2pHiYZcyDGP6CIsY6kywEQ==
X-Gm-Gg: AeBDieu1+WqyDpwhBkKF3Q6cwKwVUHIYby0RIvqHGiZPLx2V5VU4LHapUTqCSmwmZRB
	iwif3f3Q7kF7h2ERTqXtpCwKKl/Dl7Rl39qtI0X3fKmSG7xnFCicHJ7du6HkT+NvRLe/ScWiYSW
	uYs8gu3XqHRlWxIK1SJDS6V8WGceoxftbr48Vg20Zs+JJPSMN2uhEWhHlg7tXbLzWhaRIYlxKxf
	gXJDLRGyhj3d0AYDCkxvsq60MimR/efFwBTLYl+hB+JOprrqYInE8LIh07GQrQF6es9Wz2gV2eX
	gL8uYMq4x7Mut/yv8t5+PDFRb74PVX5EtrxHDgPb08kyfTWcxzcoPLXNlqEeqPyjszuTtPeAFn0
	I6qbFzHDXpGna3pvOBuPSJHP8KBmUnX6tPlLQoxZFUgtQwse9B+IrY/afGgdIXG2uJ68lC8CF0O
	sInyglPnWNkLL5nB9eC5Hwf8i3Og3CHMEnzxlbOjt77cqIDeuSyXomfJveG2tOWhraRkiJ872v9
	V9f3TJJeaXcnoVPH1qn4OeyP8Guto/58dhp1sbcCAQOiRgoJNbYDj+pIZ1t/moOZESeCIY=
X-Received: by 2002:a05:6000:2313:b0:43d:77f4:7145 with SMTP id ffacd0b85a97d-44bb5680d79mr13383761f8f.19.1777872614474;
        Sun, 03 May 2026 22:30:14 -0700 (PDT)
Message-ID: <edfb6bc3-ad1a-4185-9966-29bb126a6b3f@suse.com>
Date: Mon, 4 May 2026 07:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] xen: arm: fix len type for guest copy functions
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <e29e6176063f8e7c612a4bfa44ac072d7a686b81.1777303844.git.oleksii.kurochko@gmail.com>
 <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
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
In-Reply-To: <53BD54C0-E493-4D04-9CB1-D16B148CA3A9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777872615-82F6E161-4F5ADBE9/0/0
X-purgate-type: clean
X-purgate-size: 1217
X-Rspamd-Queue-Id: 932894B8880
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,xen.org:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 29.04.2026 12:08, Luca Fancellu wrote:
>> @@ -136,7 +136,7 @@ unsigned long raw_copy_from_guest(void *to, const void __user *from,
>> unsigned long copy_to_guest_phys_flush_dcache(struct domain *d,
>>                                               paddr_t gpa,
>>                                               void *buf,
>> -                                              unsigned int len)
>> +                                              unsigned long len)
>> {
> 
> Now that we do this, potentially we could have truncation in the places where we store its return value
> inside an int:

Those would suffer from truncation before and after this change, wouldn't they?
Just that where the truncation occurs does move. I.e. if necessary they would
want dealing with separately.

Jan

> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/arch/arm/kernel.c;h=7544fd50a20f08b5ba31cad7b94925112fdee956;hb=refs/heads/staging#l131
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/device-tree/domain-build.c;h=c51520ebadf9950311f6c071e7e07042c7076a27;hb=refs/heads/staging#l442
> 
> Could you check and let me know if I’m correct or not?
> 
> Cheers,
> Luca
> 
> 
> 


