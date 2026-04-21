Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIZDNokt52lg5AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:55:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A28437E2D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 09:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288508.1568783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5x3-0001Q9-R8; Tue, 21 Apr 2026 07:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288508.1568783; Tue, 21 Apr 2026 07:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF5x3-0001NK-OY; Tue, 21 Apr 2026 07:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1288508;
 Tue, 21 Apr 2026 07:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF5x2-0001My-8e
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 07:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF5x1-002hqb-9L
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 09:55:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e72d5d-e002-0a2a0a5209dd-0a2a4502eb68-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:55:19 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e72d66-af86-0a2a45020019-d155dd2ae0a4-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 09:55:19 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so3129030f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 00:55:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb11b4sm36298128f8f.2.2026.04.21.00.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 00:55:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1776758118; x=1777362918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U1Ryk4fo5wRf5ZBa4fjB+nml9LVBZOaPE+1mUcTh27I=;
        b=CSys/iTrs4MCw/5+0bPxGBP7Crdrq7AKXTUQ1cTEwVRzqg1zCLYyGrWZong9uxL91C
         CcJq6s4Tgq05TydkeQ72au6MI8Vl4YRjZRkuQP1HBIz4FKI+79jrCjvjJ3BakZyYNfz/
         /e3S/Nu/NifuOfIj2tLAbVh1ZPPOKhy9g5YsWEE0jmW3JRQNvN5luvDSdw6f+CWV9get
         ViJBLFkRaRABqeWI2Gz2Jcvv2Uo0AnrWUVh26jYcjyvQIdL8PJD2vsKY/vuK0UGSfAqE
         aa/d9uH6/9VTL9UtX2nCr9Z0//pRnyX/I7b+/E1Q2KmDfXsCk+b2uUs1SWznFXYscmLJ
         3Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776758118; x=1777362918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1Ryk4fo5wRf5ZBa4fjB+nml9LVBZOaPE+1mUcTh27I=;
        b=SBm1izc40e+QO30ATngPDMUrjX0LikzUzrnIKSCA8s5kBVjNHw1vKYSRRSmhA7qyVp
         Z5I1OfsHxwciQrIDtB97fXoyfT4HPieeVJIX+vA/0ZXEUd79pBo5HPudlqbaLm63CdNM
         fIwIq1praGy8csil29MQs/3TdT8BFe2jlCQCENe/42JP9ZFl//aerVtNw7iQUot5h9uQ
         yd+PHGMi+1fyFsLCauucZsLZj+lLQFalfHdtNnLaaUtMEuSHeNCw4QEy0ckFYTuC3EsK
         PYnTZgzxjoCVx41UURNlJ3eIfpFD68Sh2dHHAHlNB1YDQr6EUAkScXwlBgBqed08tg4m
         RLWw==
X-Forwarded-Encrypted: i=1; AFNElJ9K2WxraR+Nd1ihiTRtijwnZTIlOWpblqoAMJ65BCFWs7ggHnsl2ImhWyc05mnrRLGTLSnDkN7qKoY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7SzJ6jti2Hy8ZH639fFQX3mtNaOd/Xa4ygjTU6ZxiUYhgG+4u
	RZqcFcFW58DhuHoRzx/6hZ9fPt/e4dKgYsKA7l3mHcDTv2I+oYxAQ31a17add1ek3g==
X-Gm-Gg: AeBDievUNAx3OLLcnVmiboVJS6AoV2jE0QTdQ1KhhRTij0N//x5q6EaHJCynKqlAjjG
	fb7wBXJQYQ2rKUxkrl8bLIlKxzrkbBtwb5PenNp23FUFFTcgm5EVPN/RNWISTCdDRQF62mPNH2z
	6NGvTmRQdfnx7ZqW6MRNqFw1uYTTyUtFYQ/fSU7eDrIQrxMgZpM8i3/YV0v37lXVpuUzx25Pl11
	9HNLbgefs7MLWkMLrdzS2wZSCarz8tZUw0WbFtZ8AMiXI7BL4irigD+wUh80EBqlqnq7FQ/9TFW
	p98ZL3lMFmEYaQVKgguFgXdppSOuJ0YPu7SbVakr8Cmz7m3kAj19tNkTogqDn8TaUte3oce92zl
	DJPOQxHXVb8XFp8+kMNF3OZj4f46S2ZkrChqlGffZeLkthekkt22GYToAnnTCAT5NXTkCV1ne0U
	iu6/gIQ78kYQUC9PxpXXtV29jT60T23wIp+Jq/wJJxoeF+G94SOdWfkN7gfK/x6Hpky7PGYzdk5
	0xc6b+LVWAUzknVrqvkG47xLQ==
X-Received: by 2002:a05:6000:2f8a:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-43fe3dd210amr27339238f8f.21.1776758118391;
        Tue, 21 Apr 2026 00:55:18 -0700 (PDT)
Message-ID: <f46c1782-2a76-4657-a78a-f68a9dec4e89@suse.com>
Date: Tue, 21 Apr 2026 09:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] tools/xenstored: add support for watch depth
 feature
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260421074211.308473-1-jgross@suse.com>
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
In-Reply-To: <20260421074211.308473-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1776758119-88ACA161-42DD32EB/0/0
X-purgate-type: clean
X-purgate-size: 1330
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 45A28437E2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 09:42, Juergen Gross wrote:
> In order to reduce excessive number of watch events the watch depth
> feature has been defined, allowing the user to limit the number of
> node levels below the watched node to cause events.
> 
> This series is implementing this feature for xenstored (including the
> PV and PVH stubdom variants).
> 
> Possible users are:
> 
> - xl/libxl: use domid information for the special @introduceDomain and
>   @releaseDomain watches, which will be available when using depth = 1
> 
> - xenconsoled, like xl/libxl
> 
> - any PV-device backends watching directories for added devices (no
>   watch events when any device specific node is modified)
> 
> - any PV-device frontend and backend watching the "state" node of the
>   other side, in case the other side plays dirty games by building
>   large sub-trees beneath the "state" node
> 
> Changes in V2:
> - some minor stale changes reverted
> - last patch covered by the series now, man page updated

Is this really everything that changed? I wanted to commit the first two
patches from v1, but I had to leave out patch 1 as it didn't apply. Patch
2 I have in pre-push testing already, but as mentioned on Matrix there's
a so far unexplained build issue (definitely not related to this series,
though).

Jan

