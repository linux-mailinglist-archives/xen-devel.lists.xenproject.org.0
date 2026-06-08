Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BWbkJwKoJmrIagIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 13:31:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14DF655BB9
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 13:31:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kmc75udP;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1331611.1594174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWYBM-0005iP-MX; Mon, 08 Jun 2026 11:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331611.1594174; Mon, 08 Jun 2026 11:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWYBM-0005fy-JW; Mon, 08 Jun 2026 11:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1331611;
 Mon, 08 Jun 2026 11:30:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWYBK-0005fq-Po
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 11:30:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWYBJ-007gy8-NQ
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 13:30:13 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a26a7b0-5cb7-0a2a0a5109dd-0a2a4507971e-38
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 13:30:13 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a26a7c4-229c-0a2a45070019-d155802de4e0-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 13:30:13 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490be03d47bso34722955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 04:30:12 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344558sm49688085f8f.18.2026.06.08.04.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 04:30:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780918212; x=1781523012; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6waQIJaa39CAh4dYYbApd4Y2fy9w7Y/ws0RJBzzpW/A=;
        b=kmc75udPS9hP9wfNWqJgE9TPzIVQ1d/pah1qLuCnTMXrLOaahE8hyk5RX1C6HhZxcm
         FR5BFE4iHftp4vWrDxHb90JtiIZbbZA+eBwlBlbGV4qAZ+Ko8w9MgfrATTA476AsWYx2
         6FY3Mrvv27So4t1xJQmfwPGrAmgybRRjCit7vhgH6CNASAGePApm1Er6k6b8G2nVuVVW
         x9S/uL5HEI1q5XJux2XFxrrRhmDOzy6PeKVEcgnhcjIa49brxXiUuF3aKVyorpiySKel
         guFgiY6IS8BkcbutaWzP05SxV98HD5e7chGNflMZvb923Fi+A5TODUe80sHPLYY2j6np
         5GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780918212; x=1781523012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6waQIJaa39CAh4dYYbApd4Y2fy9w7Y/ws0RJBzzpW/A=;
        b=W/a/IhgV/X5n1Ho8uJ/QvTmGA/ipOh+zFKSin/3gl8NBaNQMaWxcuqD6uWU0I5wFxx
         Ck0IocuC9pmlq1MhnNaWKIG8hADSk7CmLPiKminiZ/oTlXDjSvq5RB5Isvsl35DKL3X7
         qY6PyszqtHIrEN0CKaAxBwha/FWWRarlDr90EFTKxQYkwSzetFtDWm6eZkTSxXSJ4IhB
         sAxxAfRbCK6/rW8ReEckUl+olw1J9jnxagOQLXaUQ5zXXegSDvEWYAxy0wvjjiKkEqB3
         uPG5sOvCyjFqavZe3zhp+qOke8j1WKkb6aRgH5ZBha1+glNHyjp+utb1ZMNJju0QJcai
         SiFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+X/Y/xiLy6MirTyHy8sS3YyMnW9ZiSAkJsbPiaB94hXEv5gf2Lo8krcGVQwrZQkDJ13Kqc7b/xMn0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzvY1EjqXXjRFVo6kfYFWhaP5i8M5YF+fqNpHouG1e6H8FYhwf
	0NU45G7mppVBCqoipcxZOEwKDUVE3nXhasFdOLGjkxW1uzkzX50dc6Ab
X-Gm-Gg: Acq92OGxgc2tbdYaum5k/0lIwVlxww3L8BLk/axdvdAf9785ebnAH6ewPGBg0qJ1hav
	Lq2DU75CaE8M57JEB8mIzZciK8ntQt+FARXIM3j9Y3AlOMByAiF2X8EEmTjuqw1Z9IRn5blUzDO
	a/OI6DUJ5ATIqzzrimPEMO+5qLZeNaOPIhAKzyfOhwCJt/OSbRM8+c+hHD3H5oDka/eiwYV1E+o
	k3RHx1fFI+/hUBuU/tURHE3Coto4GFVYPeYVuLJvGduRMP5U/Xlj0PBQmvvHvKf6TSMFY2YWPPh
	Qaz/Nufw/eScqGoOquHwEokEKovtr+RlKNsQxsixUbT08GvzeG6DR9UQXKUATiIf01xGvONRSjw
	1ShHEfacF66GhucUTMmFxp/JlCxbmI4tMmS4eCPKuwOTDJTzCLWqZybeptnk/dkII/6laAgi3U7
	QCfc/aoeRIRUmIVGp3ckzy+BOObM+tJ3PEY3VqEYU/+zk+eP0pdM2Ood4V0U6A7Zz/FJiRYt+k6
	IlAEGX3n5DsvZF/
X-Received: by 2002:a05:600c:1c20:b0:490:6237:5200 with SMTP id 5b1f17b1804b1-490c259eaccmr236459235e9.10.1780918212021;
        Mon, 08 Jun 2026 04:30:12 -0700 (PDT)
Message-ID: <63141a14-c2f4-43a2-a325-8cf87ae1bd97@gmail.com>
Date: Mon, 8 Jun 2026 13:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22(?) 0/2] tools: Use the system liblz4 package
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20260603085331.2704108-1-andrew.cooper3@citrix.com>
 <4818e5b8-21e9-4f2b-9977-8fc4c9a4889b@suse.com>
 <23167e00-685b-4033-aa8c-6c44c705448c@gmail.com>
 <2e6bc1ba-72d6-4b4d-ba1a-226eb74fab0f@gmail.com>
 <34bef293-0929-47c8-9dab-7570be2483fc@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <34bef293-0929-47c8-9dab-7570be2483fc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780918213-21969C48-53040428/10/73395122804
X-purgate-type: spam
X-purgate-size: 2086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[keepachangelog.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E14DF655BB9



On 6/8/26 12:57 PM, Andrew Cooper wrote:
> On 08/06/2026 11:51 am, Oleksii Kurochko wrote:
>>
>>
>> On 6/3/26 3:01 PM, Oleksii Kurochko wrote:
>>>
>>>
>>> On 6/3/26 11:16 AM, Jan Beulich wrote:
>>>> On 03.06.2026 10:53, Andrew Cooper wrote:
>>>>> Switch to using the system liblz4.
>>>>>
>>>>> This brings libxenguest's lz4 decompression in line all the others,
>>>>> rather
>>>>> than using the unsafe decompressor from Xen (itself a port of
>>>>> Linux's unsafe
>>>>> decompressor).
>>>
>>> Generally, the patch series looks straightforward and low risk, so I
>>> am comfortable taking it for this release. Considering that...
>>>
>>>>
>>>> As stated in 84f04d8f0dbf ("libxc: add LZ4 decompression support"),
>>>> there was
>>>> no shared library available at the time (and on the SLES versions I
>>>> worked
>>>> with). Later a shared library appeared, but the -devel package still
>>>> wasn't
>>>> there. On my main dev system (intentionally a relatively old SLES
>>>> version) I
>>>> therefore wouldn't be able to build/test LZ4 anymore if we went this
>>>> route.
>>>> (FTAOD this isn't an outright objection, as the goal of the series is
>>>> certainly good. It is mainly a data point to consider.)
>>>
>>> ...does not consider this an outright objection. While this may
>>> become an issue sooner or later on older dev systems, if the change
>>> is accepted into staging, we could switch to the shared library
>>> approach in 4.22.
>>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> I've included this incremental diff for CHANGELOG.
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1db3efc4864c..5cf19372a361 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -13,6 +13,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      represent a wildcard input.
>    - On x86:
>      - Enable pf-fixup option by default for PVH dom0.
> +   - The libxenguest bzImage loader now uses the system liblz4 library.

Looks good to me.

Thanks.

~ Oleksii

