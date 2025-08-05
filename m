Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AA1B1B8A3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 18:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070764.1434424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKfO-00069u-Hb; Tue, 05 Aug 2025 16:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070764.1434424; Tue, 05 Aug 2025 16:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujKfO-00067m-EM; Tue, 05 Aug 2025 16:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1070764;
 Tue, 05 Aug 2025 16:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yoJv=2R=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujKfN-00067a-0h
 for xen-devel@lists.xen.org; Tue, 05 Aug 2025 16:37:33 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b99c725-721a-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 18:37:31 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-458b49c98a7so26699355e9.1
 for <xen-devel@lists.xen.org>; Tue, 05 Aug 2025 09:37:31 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58542f3sm10789375e9.10.2025.08.05.09.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 09:37:30 -0700 (PDT)
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
X-Inumbo-ID: 7b99c725-721a-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754411851; x=1755016651; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DcTrrKHCxjGpWj0rumg0FDiXmLUWF4il3f7mb5TP3tM=;
        b=f+WjMsoyiWXrbjvILpZBw/3VdoTY7gWWpCIWXgdE/iKwvZg1hOFiwvR+U5YOTMlFi0
         uhR7bfGHiO5vcso3UpkMakpjwMhXkLzIbr6H/tUwAULfB+ntE2Yc+0bL+drxLqWMsgS5
         9tadeK5qbOVb/2ZCfj+GGHsWIS0R+9VOnt6Cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754411851; x=1755016651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcTrrKHCxjGpWj0rumg0FDiXmLUWF4il3f7mb5TP3tM=;
        b=S6XSygBS4ZVAZwUg4sR4JG3fwKeMzcTD5Dz/cdU8rRbcbySq4HISOAGYPjA6DHSWkk
         DBewF4Zs2uBnQgH336hX8it/AzxXpaFO9J614dGCyL4+j8E4jiKPocdd9gkJbfiHLKuK
         HGy3C1ruohVq0gyH2PkYPexJbSpcT8B6yUhYtki+CTYtEP52ng1xcE0dIgwqPCJK2av2
         4KznS791cB7gA5vxhbbrehskeDjFffo5/p0xJwwywPRXEqJKdBF3uP7TmKNxOor4TEqp
         XkGNhjLyOfz5CNXpFdNOGeDm4PqSf0CCfui0+OM5QBeUCktALa3wFsOFlRK33/qKQ7TV
         NIuA==
X-Forwarded-Encrypted: i=1; AJvYcCUtQhYlnRbdhuD+ljPR0iJdEeMh1fBsp4UlLWxWXXKRNReHqNa9CPyThgA9U/N6C1xEEQ4TTuNPISc=@lists.xen.org
X-Gm-Message-State: AOJu0Yw27pqg6Mepo64qEYGjLsIVEYJlk5Z31y2UYF2kA7EEo+wQQQhJ
	fqzAntpHIjKgpguqYi7X/+byLyrK9C5gVyTviXi7/rXICpk3UXOZfP8rQy7DnqXVhvY=
X-Gm-Gg: ASbGncvPyuUGVrBamQ2P/mfFGohBvLA1n+IUIpBRVMeHy1/wZvKFCrdmaaYhfNVtWOn
	FBGx3Qn90RCn+2GuLISMi2Gao0m4nxMn1e6OnoV5rNJgD3wm2lhSeMsN/UaC0QygLaUBY17awcP
	mA7CwOCwnpcnTV52OIYPfHT6mrW0aXIRFDWL5yh4gJFTXMkmrsRdUtLm+zZLBkyXtLvIQSxuibm
	8XW6B/8k+8O3hNU/WDPXMoQ6Gzk2Jj7xidh1krla2monee6Ukhz6MxglgbdyB9KMWOEkRsvVbkF
	3pNuA5BbNR6gHobBMHFrcgVRk0mfvI8QsWtjuRWV9Kjj2Fl7HjLb7x09ULbEAPj45VXrAlhPQ5a
	GeO0rmoRSA8yknB2FZNwlY7MCk/b8xMCt1A5XNDWOH9hxIaM9WERgpHOmvtVj9jkc6Dcb
X-Google-Smtp-Source: AGHT+IHHjz5bsg0TqLNtqa9cAyBQGg/tEMn9oJQ/u5n9sIdIsm+p/d+DdO22Xpxu19u5Q+Qh9egT0A==
X-Received: by 2002:a05:600c:4e10:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459443eb330mr95296375e9.8.1754411851166;
        Tue, 05 Aug 2025 09:37:31 -0700 (PDT)
Message-ID: <68bed4ac-aa27-41cc-b8f6-ff8483371211@citrix.com>
Date: Tue, 5 Aug 2025 17:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] efi: Call FreePages only if needed
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
References: <20250805163204.3631483-1-ross.lagerwall@citrix.com>
 <20250805163204.3631483-2-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250805163204.3631483-2-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/08/2025 5:32 pm, Ross Lagerwall wrote:
> If the config file is builtin, cfg.addr will be zero but Xen
> unconditionally calls FreePages() on the address.
>
> Xen may also call FreePages() with a zero address if blexit() is called
> after this point since cfg.need_to_free is not set to false.
>
> The UEFI specification does not say whether calling FreePages() with a
> zero address is allowed so let's be cautious and use cfg.need_to_free
> properly.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

