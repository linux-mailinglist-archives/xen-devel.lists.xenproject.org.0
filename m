Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE68FAAE2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:33:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735169.1141339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENjG-000533-Py; Tue, 04 Jun 2024 06:33:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735169.1141339; Tue, 04 Jun 2024 06:33:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENjG-0004zz-NE; Tue, 04 Jun 2024 06:33:06 +0000
Received: by outflank-mailman (input) for mailman id 735169;
 Tue, 04 Jun 2024 06:33:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENjE-0004zt-Ln
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:33:04 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4add9ab0-223c-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:33:02 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-35dca73095aso4324379f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:33:02 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e5985c269sm5124501f8f.82.2024.06.03.23.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:33:01 -0700 (PDT)
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
X-Inumbo-ID: 4add9ab0-223c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717482782; x=1718087582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeeXnvLZvFjvzNPaGphVDY3NWv2H+tFCnzPe1I0QI7w=;
        b=gw8U+2EIOfsoKVL7CELREgxfyqgF/cGHaYMTTXtwQ/FOTeaIqyItXAP1yHP58gOT12
         9EwZHqSh8nQ/GXIju+AYC0AevPe1DeCsa7tl+EIDKcrWwtPzAZULIG3j5WaZTY82918Q
         qggFycP7nQTvTbhBJh/qXsNRjrjsqGIyZoLYDtJDpq0X7EKNumJISgTzTN+IS5Sod/Nm
         7bh5Y2vpX+OHt+pmjP90pyoy7UVCwS104vFd1oDKSKy+PhSBT7MDIwE9GuvRyYcXVBBH
         th8cEA8bmv/iH09Lk0kFRaS9bD35xsTfrSM8ea8A+DYc6Z10d2cv64QARSUqdvdiUDuU
         HCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717482782; x=1718087582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeeXnvLZvFjvzNPaGphVDY3NWv2H+tFCnzPe1I0QI7w=;
        b=VBKrArCfqbPAdifNPBQFSLUWzaxoMKfuf8igQy5DQLThE6IEMZAGC1MxvfD+XvBSsD
         IQnGSoGKf0mEKBpap5gpA4jtVci//q4gkX9+cyntR1nORq/nnC9jS6h5wakgjAJrjxcF
         J1BrOsvIdCbUOJrGWdM5656mzWMKguUtMkTj26WRyB87ewozowvCfz/+GvsvHAAkD0Ex
         Mz8LV6YnYdzWrWxntKExUwJnZDO8LYUEklSr/KxqBGDRCFiAEucnLap9jMmFML1oc36O
         HbrTfcrHnu4O+OQzoIri+4OLXy4N0wQGe3ITJ53QduFTshE5LxQywh9raMhWUVXJ1HDr
         sgtg==
X-Forwarded-Encrypted: i=1; AJvYcCUbg0v++5gFxryEpIBbGevB8+bgJiBRhxL6fc+QkkxI0eRb1t1k7W4lcrCiEsl1RA6+x5WzDgi52SpvdwPaZog/yuoQXflFh4jkuFCjBkM=
X-Gm-Message-State: AOJu0YxQkLt63es4BjN2mNpgo9DjnolVOEgBmLyizry0+7DJHPMpDeNb
	0l/tZvdPtnh1vlC3Jp8MDWV3jVpt9hw4V/0jMwUOFHc+pKDbhJg9AiDT4Unu/w==
X-Google-Smtp-Source: AGHT+IFxSnuBjFBwSqqrJg0E7ncAuXrKf+20NrKkRzK+bDiMgizkHGnAY7XLYZchJnBVX6ruzkbrew==
X-Received: by 2002:adf:f404:0:b0:355:39d:f7b with SMTP id ffacd0b85a97d-35e0f30df18mr7704737f8f.45.1717482781637;
        Mon, 03 Jun 2024 23:33:01 -0700 (PDT)
Message-ID: <1dde6a74-9bca-45f8-90a1-1e2459148a74@suse.com>
Date: Tue, 4 Jun 2024 08:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/ucode: Utilize ucode_force and remove
 opt_ucode_allow_same
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
 <20240528152943.3915760-5-fouad.hilly@cloud.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240528152943.3915760-5-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.05.2024 17:29, Fouad Hilly wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2648,7 +2648,7 @@ performance.
>     Alternatively, selecting `tsx=1` will re-enable TSX at the users own risk.
>  
>  ### ucode
> -> `= List of [ <integer> | scan=<bool>, nmi=<bool>, allow-same=<bool> ]`
> +> `= List of [ <integer> | scan=<bool>, nmi=<bool> ]`
>  
>      Applicability: x86
>      Default: `nmi`
> @@ -2680,11 +2680,6 @@ precedence over `scan`.
>  stop_machine context. In NMI handler, even NMIs are blocked, which is
>  considered safer. The default value is `true`.
>  
> -'allow-same' alters the default acceptance policy for new microcode to permit
> -trying to reload the same version.  Many CPUs will actually reload microcode
> -of the same version, and this allows for easy testing of the late microcode
> -loading path.
> -
>  ### unrestricted_guest (Intel)
>  > `= <boolean>`

Removal of a command line (sub-)option nowadays wants accompanying by a
CHANGELOG.md entry.

Jan

