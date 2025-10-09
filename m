Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FEBBC82EF
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 11:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140400.1475294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6mcG-0004Tb-Ce; Thu, 09 Oct 2025 09:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140400.1475294; Thu, 09 Oct 2025 09:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6mcG-0004Rp-9W; Thu, 09 Oct 2025 09:07:16 +0000
Received: by outflank-mailman (input) for mailman id 1140400;
 Thu, 09 Oct 2025 09:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWMT=4S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v6mcE-0004Rj-Ls
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 09:07:14 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d69f14-a4ef-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 11:07:09 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so6895615e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Oct 2025 02:07:09 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab960sm33700183f8f.13.2025.10.09.02.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Oct 2025 02:07:08 -0700 (PDT)
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
X-Inumbo-ID: 55d69f14-a4ef-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760000829; x=1760605629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hAoYU24Y1fDkqkt4KWQmVPkorqzH1CjsVc/KScbissI=;
        b=KsMkVuKz390YZJd+fTP0Yflj2BgkE+9FyssJYP9rB5kfNEVL34Vu80PAyvGRxjbvuk
         iwpT5lGAjHt0wHpfVFDLCrjqnlfY4cOCL6YUTecC/27wIkg8iEcd4TU+806T/9iF5g8R
         r1IBLXfOegrILZvG0Y/10+MUCs41Mc5kMXLSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760000829; x=1760605629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAoYU24Y1fDkqkt4KWQmVPkorqzH1CjsVc/KScbissI=;
        b=vIFtypfu8wXJ/zaDSkWBoxoOYgBflP5h1AhakcPCaJjENyDGxxPmIQjRopdVD6OS2n
         gO6GOPMO/uky2picvX2LRrQHZ8xLhp3+bYy8buWEc5btATts5KctQtk2Qd/9VGsu1tK5
         Dmow7Z4oBSAgClkgAj+GIGphvXjkAWCEEYzS+Z/cMZmgaEnMghZh6t9p5gig3yZ3PmR7
         s0GoJQiuqUql8zAO7wgkUBco8VIcvFwHqBGeNnFn6/Q1OEIYy9+WeJOr65kHNKIQJhQ7
         ez2kxmlFvdIFFoYJ0QWhuwVP/3zPzlfB8xBH0KxNXGBcy1wLqF7n70+2D25uFkBwadLY
         Jqew==
X-Forwarded-Encrypted: i=1; AJvYcCVfgTyZpGBdDtXUVuqFTivKSd3EtJQLNutai2Ziev8UywkaMQ0sZVr35oesH3lQ6KxKGpKK5r8J8fo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi1JKy1zfMSsrNbk/yAtDDmzEbPu1ApnbiubAuSDSQ9qGURGk3
	7ZTkvAR9x69QyirambWHT4e6vIjJmMJrTF3kgDZlDUX3mb5WeP3MMXZUCZRT6nWCQIg=
X-Gm-Gg: ASbGncvkHeb+20MAzXXiNvBsD7ikyem74cwz6PerD57tGveizexWcXIYCYUCbHqi9V6
	dG9JBhKJ9NlIpntXjJBQHz4hfEYwS3odPK5SDfiCdMmRZIi6wM4fVv6ifhiIuGHJSxCzKn+nIOR
	VnGyx4Nqij20SAsSz0CLLxYUw8OiOH17DQd1mNnKBJbOjzhSPgMcogtEN14cOqDwEusOfMeckYt
	qAMUERhswdBX6bNLxXm0+tLGLMMK4F7nI13VvaPytJHioBNEZh+thGNW76AB/OM9njkiPOTwTQp
	DYpvxgIB4yFcOolN2Epg703G5ude91jweTDOLfMpmuFjFsqfpjbnGBZgNVg2AtJYDbEdLbbV0CO
	VQl5ltwQ/qdj3Wi2RmQ66scyYIRKdmgKjmdfO+OZNDIRAi41yb4XkH8qYJ8i7/M9FEnkCUc+4VD
	GjQ261N+0wcAP8
X-Google-Smtp-Source: AGHT+IEgYXEBvxXwufIq/kspEBoBWsWnGKsiCU7Hu3jc4wP9VgZ4velhqlLDTxk3atqynvfa1Nkdig==
X-Received: by 2002:a05:6000:18a9:b0:425:8bf9:d365 with SMTP id ffacd0b85a97d-4266726d560mr4733676f8f.22.1760000828730;
        Thu, 09 Oct 2025 02:07:08 -0700 (PDT)
Message-ID: <d445b2c2-0278-4ade-a14b-178a0ee0f5c5@citrix.com>
Date: Thu, 9 Oct 2025 10:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HWP: adjust feature_hdc's section annotation
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2622f83a-e67b-479c-8027-5578eb066ff3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2025 9:50 am, Jan Beulich wrote:
> The variable can be cleared (set to false) by a non-init function's error
> path (hwp_init_msrs()).
>
> Fixes: 99c4570f8209 ("cpufreq: Add Hardware P-State (HWP) driver")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

For 4.21, surely?

>
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
> @@ -21,7 +21,7 @@ static bool __ro_after_init hwp_in_use;
>  static bool __ro_after_init feature_hwp_notification;
>  static bool __ro_after_init feature_hwp_activity_window;
>  
> -static bool __ro_after_init feature_hdc;
> +static bool __read_mostly feature_hdc;
>  
>  static bool __ro_after_init opt_cpufreq_hdc = true;
>  
>


