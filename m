Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD17A50EE8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 23:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902828.1310790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxTR-0008EO-W2; Wed, 05 Mar 2025 22:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902828.1310790; Wed, 05 Mar 2025 22:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpxTR-0008C0-Su; Wed, 05 Mar 2025 22:44:21 +0000
Received: by outflank-mailman (input) for mailman id 902828;
 Wed, 05 Mar 2025 22:44:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pOX7=VY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpxTP-0008Bm-Jt
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 22:44:19 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ebebf21-fa13-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 23:44:17 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-abf4d756135so7172066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 14:44:17 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf4a3a19b2sm884386166b.44.2025.03.05.14.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 14:44:16 -0800 (PST)
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
X-Inumbo-ID: 5ebebf21-fa13-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741214657; x=1741819457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pTwmi0cUF3/pS1Hz6HN1qkSC3wILXQEsVZibWmbgZsw=;
        b=GDsw5eiW9Us/6AlzqmswcepX5qLKdzWhrQfqg05jP99+MW3caT7mJ+ykpxkoipKqs9
         GtWsPOLAXmCYTOT8sjNSVD4nSoZGCZxeCZ3Jze42zRO0qvVwory9a95GTzFii3IGQbvu
         EPLOrF2K/MJsz4dWTT9EQ4AVTjy8P+NK/HFZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741214657; x=1741819457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTwmi0cUF3/pS1Hz6HN1qkSC3wILXQEsVZibWmbgZsw=;
        b=I6I3LNM4DLwCZ7qTxEkQL0hwwkl4yoFPuKDmrBC0Mi0SY/Xr9bbSFP1SV2E7e5x6+D
         Ufd/Wh4ftQmsLFdbf/79CAwhjf1qsjHFyRTwjUUoGDmFlNGJhJGp+cqjDH71z+j/Vt/9
         JGcPNCn516qVicJe5H+EmveaqxbW4SXTE6WwuPGnesdwwzoukMCyBk8qEopsyqRId2Kv
         NQ5i/jWelXOEutLE9l14jw3lKwnCrlRcsC3vDsZRnWqitZ3hO8GzPNJTqFGT62Eda623
         WXpSpD/UqFK+s5mJEBVYR26L+fS1EhEClBsHo/xiSstEnTVFRvzI8PVTd80j7rVhZeDM
         0sww==
X-Forwarded-Encrypted: i=1; AJvYcCWNgUm+Vln9SzM9X2kvYpwY0Wib69TySpb3hQZh2xcx4gNolse9HrRW0wJW970LJIHE92ai9vXBdN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyboUfcmZy5rQglhjZvJdLg2urSZC0Ps+DRqLvxJg4W51adT+Ow
	x9rMAMQ2eUzuYt6DqKmtvA+Hw0FeDK4keSTy+4xcIwb05xjxev9Lq3fnVsJVNT0=
X-Gm-Gg: ASbGnctU7s7KCwhP9izR2U08FggTk+9dYO+ZF+KXJFGpBVAzI2QeHHlo9tZv1ntcX0H
	j13CNcnbAg/QUQJ8grnSENhpPXV/Mm7Wf9b3zfM+HnS0TTE1gCpcTv3lMgAeIE/GIfurCJH4UPP
	3Jm7Cko4N8qGlYwrJrnXqeu7T2TeU0J1XeC7pOtMjbcfqpe5xLLcqhZBURhgUY3VfTszYwtgCg9
	Qbknl4JbJQg5XH/QZSitunSoyrLJ5/+n5Nm3JM+v9hh2t+TBQ/Zzn+n4P53qYitJSrEK9eL9wHw
	UfAsNUo5dYgveGL8JyQb9UgBd/y7ugrd6FqWU+gki3HwGPoKrITCLcw29vwWJ530Jv4p0pvQ4PL
	9Vu+wyM5r
X-Google-Smtp-Source: AGHT+IExbXJ+4eq9PD0aDX2d2JiRDM5bnenGWIBWXBnZSN/dT+RB1zbNtl+FBrcGy/UDgD9r+V6SPA==
X-Received: by 2002:a17:906:7308:b0:abf:486a:5e0e with SMTP id a640c23a62f3a-ac20d8cdafdmr464943466b.22.1741214656816;
        Wed, 05 Mar 2025 14:44:16 -0800 (PST)
Message-ID: <c145ee1e-91e9-491e-bd21-7bb0a04ab0a1@citrix.com>
Date: Wed, 5 Mar 2025 22:44:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG - running new version on nested virtualization
To: =?UTF-8?B?S0HEnkFOIEnFnklMREFL?= <kagan.isildak@malwation.com>,
 xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
References: <CABDHFN7uk0JdehT3R0f_PvRgT-thdNyywppekmjLWfSq13dNKQ@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CABDHFN7uk0JdehT3R0f_PvRgT-thdNyywppekmjLWfSq13dNKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 10:05 pm, KAĞAN IŞILDAK wrote:
> Hey there
>
> I'm facing weird issue. At my lab env. i'm building xen 4.18 and make
> deb package than i use it on virtual machine which running on esxi
> with CPU features for nested virtualization and there's no problem. (I
> can create vm and able to do all operational things etc.)
>
> Last week i tried to migrate 4.19 and 4.20 but Xen get stuck on
> booting and at debug log i just see error about mounting /proc/xen
> (mount: /proc/xen: mount point does not exist.) I've no f... idea why
> it caused. (At my all tries, i used fresh install of ubuntu server
> 22.04, 24.04)
>
> Is there any one faced issue and is there special things to do in
> build phase for nested virtualization? (I didn't change anything while
> building 4.18, i'm just using stable branch)

/proc/xen isn't getting mounted, and that's necessary for the Xen
tooling to work.  It's a custom filesystem of type "xenfs" in Linux.

Check the status of proc-xen.mount

~Andrew

