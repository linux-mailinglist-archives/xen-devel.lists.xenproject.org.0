Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB88AC5D32
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 00:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998794.1379494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2xb-0004Ni-EZ; Tue, 27 May 2025 22:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998794.1379494; Tue, 27 May 2025 22:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2xb-0004LP-Bj; Tue, 27 May 2025 22:39:51 +0000
Received: by outflank-mailman (input) for mailman id 998794;
 Tue, 27 May 2025 22:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK2xa-0004LJ-AJ
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 22:39:50 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ea6307f-3b4b-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 00:39:48 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso7951513a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 15:39:48 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60517a79c74sm196034a12.60.2025.05.27.15.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 15:39:47 -0700 (PDT)
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
X-Inumbo-ID: 7ea6307f-3b4b-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748385588; x=1748990388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XkSMD/lxSawBxTNjjf0XnVBgNz4fkITonywo0sDpDQs=;
        b=qTrtnMHfiqb6LhjuDRCi88XhFeCsaCKsn7E/a/OXfaRSZDcNxmZnUKBq20aATNEzDF
         h5zREc18wqV0SILgYb0PTT4AOTOSUXUSPwvML+TxeJpvpRu2gB2B/szM09cg3URqP/9f
         YpwAJ3PYJRxpek5AKuepXf25pFx3p8+APkJbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748385588; x=1748990388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkSMD/lxSawBxTNjjf0XnVBgNz4fkITonywo0sDpDQs=;
        b=mOv58oEfpD/WUvjKlkVU3ejK+7hJuMfwL8kdZm5ynuga4II7epb2IxayxxWD9VVrMm
         conh0vTR3BCgRErqmGfk2/OiwdZw6lmkrkszjTP/Q61c/8MndW4FQ3j1fDoHLKBoMNso
         GRXy34pE5P+0sPJRrd/nqneTz0Z0FNOctCoA/1+cjAn7QSWTIHCpjVdpSjcKflhdNBLy
         onid389k09rnhACl+rhAuj/elRMaP8jS8XQUkhLalfoZK0X7SFKDt4l8+EALhF1kZ/a3
         /S+EEOtCZJKK0OG1IM+xKaJ2ffIaYWYuwwRc99S3N3ZHpzBzhxvRT8wH0L2Il8OyJt+f
         QM9g==
X-Forwarded-Encrypted: i=1; AJvYcCV8HrBtsgyrkARY+D1O0WOCyHb6RKfsy4vQdFTbyL5XCewFTZ8/+UQOUydD9DbOxlAyxg+fPxVtGqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOOHnnyWHiNecIgM13uZHczEv5NbFZ7Wmp81v+98mWk1Q4fazT
	fx61JU58jzMEpYv64MCNnBOuqaAfzRVGBOREoWTH6QHDtJOhmHFBwJqXPRjmTh1H4xi1c8z8nOY
	HmotL
X-Gm-Gg: ASbGnct8Z2AIzb+SIsS7DZYAShP7MY3XA1usqjrzqm7MBRZGZYx3tn+0EdgQsF++xwH
	nguRbJ8HjYtgaWWlbcvJPFn+7S/Fbh6//u2tJdEAjCk3nBzTy9UTJ97mbRfszTTtUrJiqW02ZQK
	54fXOxHKoiarMKOQqHCioAZhnA2iTlSCxgCt+msTK2OuVKDJLEZD5ebbxCEZG9AuZoVgooLG/ju
	/IjbUYBDpMKx4kvDelYfzx7RXmZVKP08TTylBLBssztfUA3VMuNN0Si0HUa2uqDaXwzz9nRjEFP
	1p5UYcnBpYSdO82qstvWcjTGTWHVXZslSL1ErVBmGnlbzEOfAsCQ95gZh/KvcmPSk9ptNkezQJz
	Ytyk4A5Ttc8EJ79Ok
X-Google-Smtp-Source: AGHT+IE4LT/hexQBC5HD63F2TgFgLFFz68CpYI7oKOoafahYfZezEPpKVg9mk7kPhjVgHerI6kP/UA==
X-Received: by 2002:a05:6402:5c8:b0:601:9dc3:2795 with SMTP id 4fb4d7f45d1cf-602d9bf99d9mr11138804a12.7.1748385587733;
        Tue, 27 May 2025 15:39:47 -0700 (PDT)
Message-ID: <1c850e02-0d87-4fd1-8504-0aee53949136@citrix.com>
Date: Tue, 27 May 2025 23:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Remove is_periodic_irq() prototype
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250527223753.47055-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250527223753.47055-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2025 11:37 pm, Jason Andryuk wrote:
> is_periodic_irq() was removed in the Fixes commit, but the prototype
> remained.  Drop it now.
>
> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer...")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> The full Fixes line is:
> Fixes: ddc35d1cc994 ("[HVM] Enable more than one platform timer (PIT/RTC/HPET) programmed as periodic timer and adds them to abstract layer, which keeps track of pending_intr_nr to avoid time interrupt lost and sync'ed timer with TSC.")

Yeah, the older commit messages weren't as well structured as we insist
on them being these days.

How did you find this?  inspection, or a tool?

~Andrew

