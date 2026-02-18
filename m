Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF5NB423lWmNUQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 13:58:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F0F15679C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 13:58:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235540.1538502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsh8S-0007Lx-I7; Wed, 18 Feb 2026 12:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235540.1538502; Wed, 18 Feb 2026 12:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsh8S-0007Jd-F8; Wed, 18 Feb 2026 12:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1235540;
 Wed, 18 Feb 2026 12:58:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUrD=AW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vsh8R-0007JX-8x
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 12:58:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84defb78-0cc9-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 13:58:28 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-65c5a778923so2350175a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 04:58:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc766531asm449487666b.50.2026.02.18.04.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 04:58:26 -0800 (PST)
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
X-Inumbo-ID: 84defb78-0cc9-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771419508; x=1772024308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bx6HnJkfBgBlRcysvTwBFEeA7St4HRdRmVWd6M0rDuw=;
        b=iH7QcpMgV4U1dbX/+N40o+2MLafMEoPGoXh7FTZph9Lwkpj+6Nafd4oQVqYvZidXVz
         WhPhBE1Wd7ON6Hlwb+eZutmBb/KDjgjIByzcomcJ6uczA8XpFVlp9tt7Ot4kTt7mLpk6
         1TLmoptbv6JJ2GKWk7vq8svwEemN7LcMCZYTc6s46BuU0rqPumth8R0d2Hg3Kx0Us2l9
         iwGmF5GxzSgYyHjAzUr2vZpzAUFdR7TuO6eDmSD6HokzRRSw2MAFPZahOeBN9XOQWlr2
         bcN5i420w7ggLfUQ7NSbmla6dQVqNd/FBRlG2auBON36dZpZQghZhZN99WOgdE5nOkRs
         FBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771419508; x=1772024308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bx6HnJkfBgBlRcysvTwBFEeA7St4HRdRmVWd6M0rDuw=;
        b=N4AdlGBRIGVVKLSp3xIDbTBTakz1bD6Z0M8pDRzcn1RGUbGzLhMGjC5JPGM6Wn8tH5
         BcGrV+EKa2P/KwUT5RaNdmj4eHZBFy2SZQa0Qz7H5JPFjEH1pUnzIx1na9hJ/zsWpkfT
         M9VDpRte26BCGWT393nwbGtQRQFCpY9Ar4YBwNg6kxF8CtxVCqph8jR76vQrqrETjFVS
         +OFqUdOzuy2wPlAYi6XG1Q+Ftr3Tb7VKs2VgQ2nZKMjKdygGGQbmokyuge6R2Qx2EdWA
         wHEU3H8ZmKtKEiX6QRJUFvPLaP3SuqjMcPeq5HlkNCXUtO+0t+QQKo/R/qCe+u2xkBhk
         uPAw==
X-Forwarded-Encrypted: i=1; AJvYcCVYqamhfSieTqrZSuohNxeqDbtGElbY3GoeH+CbjUSMl2r2XD7LwpISrFIOVHdYv3eB8EuPFkNK5lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKlfIPiBK3Lf1gobgI5z6+TP73eCuZwDd0TZiFUPV8iYdncNcJ
	u/SZ3ZnqPqi5VbK01osDE1gofiWn3MB+HXy/rat6X2jwJwWhhFlE5XnM
X-Gm-Gg: AZuq6aJqcBdsBeNyr6ilf6SfXCtxfcmQTXmcN+PzP09oMNva4bOsHSfo1hkRxJxw1ug
	VNDzTxyDOpkO/CHl4Q7tVjVU+h/FCiIZRbKYR+eZbJHlU3Whymh3ICQMc/A4DoDNUaNpsSzW5Es
	FlDcYsG7B9IjHq90p5SxAGxxWVMMPcadCaWi3qijRSgJvIApJpQcgWsDv6qBtEWDYSbEE+8dMQt
	hRqpff3EW4kPa2Ew+OWeBVjjYakUC4U1fuDYcWC3KVdoT9aarLBTsfTGdCas2QR/sJ+NLB/ZDu7
	Yt45fltDE04FiplgMbo2EQcYth7Q/tu4hxxlhi4eVATnG1ApT7h3kUrwf18EZbdBnFyb/JWpOMG
	591jUF4I69e8vrwWraIf4Y4asNMCu/CIBoPaCqqT80GrhPc12UTRbiMCVglW62Y7YOgBDR4joCn
	+yavamxf2KkJRttrILet5S7q7YPSaz+57H0WC5oFwTRV8RnIyTAvlJKJNvaMWh5gs3zNUmVn08I
	nw=
X-Received: by 2002:a17:906:f58d:b0:b87:2780:1b29 with SMTP id a640c23a62f3a-b8fc3ca5c95mr827849766b.37.1771419507458;
        Wed, 18 Feb 2026 04:58:27 -0800 (PST)
Message-ID: <5eb4ba3b-f7b6-4cfb-ab67-60198c3f8572@gmail.com>
Date: Wed, 18 Feb 2026 13:58:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
 <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
 <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
 <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 81F0F15679C
X-Rspamd-Action: no action


On 2/17/26 8:34 AM, Jan Beulich wrote:
> On 16.02.2026 19:42, Stefano Stabellini wrote:
>> On Mon, 16 Feb 2026, Jan Beulich wrote:
>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>> domain_use_host_layout() is generic enough to be moved to the
>>>> common header xen/domain.h.
>>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
>>>
>>>> --- a/xen/include/xen/domain.h
>>>> +++ b/xen/include/xen/domain.h
>>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>>   #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>>   #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>>   
>>>> +/*
>>>> + * Is the domain using the host memory layout?
>>>> + *
>>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
>>>> + * To avoid any trouble finding space, it is easier to force using the
>>>> + * host memory layout.
>>>> + *
>>>> + * The hardware domain will use the host layout regardless of
>>>> + * direct-mapped because some OS may rely on a specific address ranges
>>>> + * for the devices.
>>>> + */
>>>> +#ifndef domain_use_host_layout
>>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
>>>> +                                    is_hardware_domain(d))
>>> ... is_domain_direct_mapped() isn't something that I'd like to see further
>>> proliferate in common (non-DT) code.
>> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
>> domain) on x86 as well. In fact, we already have a working prototype,
>> although it is not suitable for upstream yet.
>>
>> In addition to the PSP use case that we discussed a few months ago,
>> where the PSP is not behind an IOMMU and therefore exchanged addresses
>> must be 1:1 mapped, we also have a new use case. We are running the full
>> Xen-based automotive stack on an Azure instance where SVM (vmentry and
>> vmexit) is available, but an IOMMU is not present. All virtual machines
>> are configured as PVH.
> Hmm. Then adjustments need making, for commentary and macro to be correct
> on x86. First and foremost none of what is there is true for PV.

As is_domain_direct_mapped() returns always false for x86, so
domain_use_host_layout macro will return incorrect value for non-hardware
domains (dom0?). And as PV domains are not auto_translated domains so are
always direct-mapped, so technically is_domain_direct_mapped() (or
domain_use_host_layout()) should return true in such case.

(I assume it is also true for every domain except HVM according to the comment
/* HVM guests are translated.  PV guests are not. */ in xc_dom_translated and
the comment above definition of XENFEAT_direct_mapped: /* ...not auto_translated
domains (x86 only) are always direct-mapped*/).

Is my understanding correct?

Then isn't that a problem of how is_domain_direct_mapped() is defined
for x86? Shouldn't it be defined like:
   #define is_domain_direct_mapped(d) (!paging_mode_translate(d) || ((d)->cdf & CDF_directmap))

Would it be better to move "!paging_mode_translate(d) || " to the definition
of domain_use_host_layout()?

Could you please explain what is wrong with the comment? Probably, except:
   * To avoid any trouble finding space, it is easier to force using the
   * host memory layout.
everything else should be true for x86.

~ Oleksii


