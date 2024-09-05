Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EAF96D745
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 13:35:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791040.1200809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAl3-0006gV-6J; Thu, 05 Sep 2024 11:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791040.1200809; Thu, 05 Sep 2024 11:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAl3-0006dK-2w; Thu, 05 Sep 2024 11:34:37 +0000
Received: by outflank-mailman (input) for mailman id 791040;
 Thu, 05 Sep 2024 11:34:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpet=QD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1smAl1-0006dE-Bw
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 11:34:35 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d28119a2-6b7a-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 13:34:33 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42c7b5b2d01so6612365e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 04:34:33 -0700 (PDT)
Received: from [192.168.14.234] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d290sm124372066b.116.2024.09.05.04.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:34:31 -0700 (PDT)
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
X-Inumbo-ID: d28119a2-6b7a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725536073; x=1726140873; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BpS+PDS7LYVMhOwHK6YA0voGU9NsT2qTwOGgL/AitE=;
        b=e0bkMCjf9U2WOWBuUBLPbY1SqjDZIyR9Xzrpz3KBuRKzhxIAP4zxJQcGPsVTwBhTso
         OHsRbwLSwnS+4hSIXDk/x86mYyxT6VZEcZJO6EXjiUoQzaiYzpSWevdZGYMJiaqOV0IH
         4vj9YvbhtxHyawFHI+TpYgSlzOsRrExs3npZBiqm2igCVriCowXbCWTR+GUrz854TJfD
         ulnwR5nZl5DoCTz5aHLRVzYPWXGYOLTsNxM729olutDi5picVqIOfiAaJuu2PvDWqEww
         ktkejTpqyMeBsUGCEi2IH3m6P5KkN5q+WIVVg/huGzQok8/0XSWiA3RzBMddsvUe89kg
         SW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536073; x=1726140873;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BpS+PDS7LYVMhOwHK6YA0voGU9NsT2qTwOGgL/AitE=;
        b=HSxIvOG4n6MxiIVSc7nsJa9M6iSbNc21PuOSHh/NCqfiC/jmmiQisTW03utLU07xlf
         n6Zt57TkX7t/TxS9EbDrFnPvBSiyJZ2hLADIeK4sbSynSH/5PR95vdvl0vlhstQ8Hw8m
         b/I+Wn22hXFu0WqSoJTUPLHxb3d3Xtxyn8mWWw1zqLnx+bl/TrzHp472Y08YxG/kJiL6
         FxkjzJUtHPZbE+6tL9qDhVT5hbE/By8WwUayexecl/8KWMpKdlz3WkDuBNEFyDtUhZtP
         WvJYLwvEy+z04dv0z/rHOdmBrSoyn+Ty4xRRjOggvFLQ0tCP8iZDRP2ERKJjOm9pHf4j
         kQrQ==
X-Gm-Message-State: AOJu0YytZ5L3gZU+rrqamodDBlRV2aApmPA9EhpkIohgoSdpGTyI75se
	D19aKwJh/VMrZKLA3PFIfRlAgXXVY3tgs8sK2mvhgLaAh5l9YZTu
X-Google-Smtp-Source: AGHT+IFAnMukYTyFKZWspGLDc+V+fAQJobaY+urOlmaYmSK99lbQvfGUrPq4QVVW0CTX88ZD7gvkwQ==
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id ffacd0b85a97d-374bf857f23mr13025204f8f.61.1725536072070;
        Thu, 05 Sep 2024 04:34:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <09573c19-4a8c-4cee-8e9d-2fe19eb2aec7@xen.org>
Date: Thu, 5 Sep 2024 12:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [RFC] x86/HVM: stdvga caching mode
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <4ffb8702-d1b4-4e7d-986c-b03ace9e75ea@suse.com>
 <39f10864-3fc5-4637-bf2c-4db3f2eb28a7@citrix.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <39f10864-3fc5-4637-bf2c-4db3f2eb28a7@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2024 11:41, Andrew Cooper wrote:
> 
> STDVGA caching is primarily (exclusively?) an optimisation for Windows XP.
> 

I think it was originally for Win2K (white splash screen).

   Paul


