Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +N2cI7QlzGnHPgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:51:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C1370D84
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 21:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1269321.1558395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7f6C-0005vP-Db; Tue, 31 Mar 2026 19:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1269321.1558395; Tue, 31 Mar 2026 19:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7f6C-0005sB-A6; Tue, 31 Mar 2026 19:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1269321;
 Tue, 31 Mar 2026 19:50:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7f6A-0005Lg-6b
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 19:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7f67-00GS73-J0
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 21:50:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc2519-5cb7-0a2a0a5109dd-0a2a4507a6ee-44
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:50:01 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cc2568-fd74-0a2a45070019-d155802ce01b-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 21:50:00 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-486b96760easo67578815e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 12:50:00 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e7e9728sm62149765e9.1.2026.03.31.12.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 12:49:59 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986600; x=1775591400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lMY7gR9qRsA15Agn4j8J6bzeCXKGSqDN04ZuMFkc0x8=;
        b=pLeuViaU5VNB3y81TUFXGTpT7f4WykhCqDnuZzQUr/yunYqWaBvqXyawJDOWtJxUjM
         smxx8DDHV4DelkvJrMvGPyxCbLEkCQzqZYXNX6aKrOn37Ii+O8PQCPZt2ujnh/AKFvyF
         T6SiPRKOXvwbMHVXatD/a2XuZUufnPlvlRNFKErVh75qzJR+NV+IWzRFXZ/Xck+pLBxY
         ikJiUPgCHCJhVi4eai69hNgFUWG5vxyyuD7tGyqX4UrMm9NiKHXs/QAsD2TlKy0It+/K
         aEhy4k/Gm3yEMgU89l/kvhuox1YhsReW3MruUa0QGkigt0+B/nWOQTsw6/k3wNj4eZvZ
         EW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986600; x=1775591400;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMY7gR9qRsA15Agn4j8J6bzeCXKGSqDN04ZuMFkc0x8=;
        b=QBjQihtZCQP+DlIetm2MWMkinxYFu4nYNeNSpA/w0Y4DkRX42TQrFvY6MIjuI0WzRi
         dfjrv0XvQRWAdexQ2D07+Sw5pwRVSbCLVFVmgntiUnUpDkZELaeHJpX4TE6Yybg4hlHK
         xw5eHXvssdZSXk6dF5ry/oV6KtzTo+vxewn+A1y9JP6aF0w77+5HXi4y08Jj3kskzZVZ
         riAGi1LPPTSOgh6Hmf8jY2iIxGystlsTRBWrF5GFgqfeTQiVXSkyI0FmviaLV0ZYgy6M
         WbLIqN584ER3OgEOgAotlGV609LPhv30evFeUlVNi9JU9Azv5x15u0WVGIE1MWy5cuCe
         e83Q==
X-Forwarded-Encrypted: i=1; AJvYcCW46U+bKsLdrnBqHKp+Db0Fom6VesWHO5IKBs15ntkrcjxPmF/yOV2fe7gEe8GISHU8r5m3sCobEI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxtDCZ3vwkHT/AYjSzGdmx12kvQGKXhH3xBQ8QxCzpoUY60ZU9P
	ofrixYcaBwjqiUNJYf3j+K953koSI8a6qhCNNAyR0/nLg+xwea1pEjHF
X-Gm-Gg: ATEYQzxYYWD6TW8qfMuWLKm6kY+9YOBx0i3+ej5QyPhtutza4weFka0Tf1e4974bvCE
	oIW+AgdMV7RswXs8wMxNGmAVWFEznWprYv/YOf6mq5AjRb71Ng12QhAHBcSr1Lb/5lG/7iOqJ7A
	NOR/VZ9icqhyyIHJsrcB6HxTMxEBabXDn9bdIxfELjNkCavcTjVSC49kv0e7RPfoPZeRcH80CoQ
	5gftMDze2X7Ju0zi4xTNJdJWbSnL5VYMIA0Cgy9tguC6ZIXuGFkvkV3gEwRWX1wHf7rmt/c1H0b
	K8bnKBTvLl1xEiYPsgDCk3lJXvcRx1dN6U94N61EYo1ryGywmlgWdwc/nJng9u/QUyWVVBztl/4
	KCLwKlQxiF+K3jXf3hUZdtq+RE5qhIQdqO8eGmHLiQ/vG5DgllK42uaZdbXN0Nrk1n21eoK7gv7
	j3g1ZrmvwWF0nyzLHGMlZRSUXwVZWXPLqpEX/O0V/1FaR/31hWlxZQowyVYUnpyr+ba7g/etsSE
	QA=
X-Received: by 2002:a05:600c:1d16:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-4888359d2afmr11842465e9.28.1774986599954;
        Tue, 31 Mar 2026 12:49:59 -0700 (PDT)
Message-ID: <38d93a26-dfce-4d4e-a1d2-c4e8d13c4ead@gmail.com>
Date: Tue, 31 Mar 2026 21:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] xen: move domain_use_host_layout() to common
 code
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <533d01db2b36b8357cd87e99a64a6e66dbdd1db4.1774281309.git.oleksii.kurochko@gmail.com>
 <6df9470e-4969-48d1-bf0c-c6569a5e5577@suse.com>
 <57581b7d-cb9f-444c-9321-63b2fc3d09f0@gmail.com>
 <d1288db4-2001-4914-919f-b613fd607bcc@suse.com>
 <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
Content-Language: en-US
In-Reply-To: <d67b2856-bf93-4254-afa1-745dc37e0623@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1774986600-4E4AE303-39457531/10/73395122804
X-purgate-type: spam
X-purgate-size: 1508
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ED4C1370D84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/26 6:32 PM, Oleksii Kurochko wrote:
>>>>> @@ -2544,6 +2544,12 @@ void thaw_domains(void)
>>>>>    #endif /* CONFIG_SYSTEM_SUSPEND */
>>>>> +bool domain_use_host_layout(struct domain *d)
>>>>> +{
>>>>> +    return is_domain_direct_mapped(d) ||
>>>>> +           (paging_mode_translate(d) && is_hardware_domain(d));
>>>>> +}
>>>>
>>>> The placement of paging_mode_translate() doesn't match ...
>>>>
>>>>> --- a/xen/include/xen/domain.h
>>>>> +++ b/xen/include/xen/domain.h
>>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>>    #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>>    #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>> +/*
>>>>> + * Is the auto-translated domain using the host memory layout?
>>>>> + *
>>>>> + * domain_use_host_layout() is always False for PV guests.
>>>>
>>>> ... the description of the function.
>>>
>>> But why the placement should be different?
>>
>> If you focus on auto-translated, then imo paging_mode_translate()
>> better would guard everything.
> 
> Then it make sense to do in the following way:
>   bool domain_use_host_layout(struct domain *d)
>   {
> -    return is_domain_direct_mapped(d) ||
> -           (paging_mode_translate(d) && is_hardware_domain(d));
> +    return paging_mode_translate(d) &&
> +           (is_domain_direct_mapped(d) || is_hardware_domain(d));
>   }

This is not really correct.

~ Oleksii

