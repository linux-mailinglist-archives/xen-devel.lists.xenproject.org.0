Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2040CB281F4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 16:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083531.1443128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvXh-0007TL-8z; Fri, 15 Aug 2025 14:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083531.1443128; Fri, 15 Aug 2025 14:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umvXh-0007Pq-4y; Fri, 15 Aug 2025 14:36:29 +0000
Received: by outflank-mailman (input) for mailman id 1083531;
 Fri, 15 Aug 2025 14:36:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umvXf-0007BC-U0
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 14:36:27 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39942fc7-79e5-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 16:36:27 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45a1b0c82eeso14625985e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 07:36:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bd172sm65420915e9.6.2025.08.15.07.36.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 07:36:26 -0700 (PDT)
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
X-Inumbo-ID: 39942fc7-79e5-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755268586; x=1755873386; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DFRRmyonge3EEmjI8473VeOucy0wZomyrXC22r84+/k=;
        b=agKoV/Zb+l45QyRrVnP0J/fcVLwuftEYaU5mdmUkiwAH0+OZdRuLieuAWpZyxxGa8P
         IIeKV5BIT3AqDQV9BDAb9BC2sZwLLKZotTXbiJuHUXbsBs8SXTYWFqs51Denq1u6u9mK
         RfhfC2hwq1VmuY9VXvU5wDW+RUR7JxRMsN8o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268586; x=1755873386;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFRRmyonge3EEmjI8473VeOucy0wZomyrXC22r84+/k=;
        b=mgjksYnxJgosSUX2IgzlWWG4mRxMtKdT/1D7rtpgwZiPkcLsLWfWXpzXqcNicSn9h6
         OqVzKydkvwFhVzueRg8mXQ1yXC+/y6sYjh9cPjhlrljcjnpOZJ2aC+rFJFy7zcgNn23p
         /Iek/iY/0nptR+sGcrFacoIT3/0L47lpET/i7VTZuHR9+waHvXiL/hMwTDdZr2r8y9bd
         cIY2HNW7pRwFNXdkEGPXOQm77oPfUbrqMC2pNRz31EgmCQzQY45U5aC/MkXj5yb1Ps88
         BfotIlaF7DY6TmFA/mHxYniJAzT8t/BHknVY9kMENcxQCi4pl5eBUTTZtU0c/me1ma5d
         IORQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr+qiI3SsOaugqEUXxfX23mgpXYsBZ59WQP/lVZ3ApUDYNW79vz2qm6HRYxQxs4lSb4dpKM0p87XU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOCLlmS2dK0fcf6Vc14aSuYtF/oCbMV7sXAhMfQ4KolqaAcp8B
	d+hQUsuFuD6zusqEWIhhImEt/b+rzhhj2KV+Xez2WA3Qb8oPtECQ45wmi3XNkXuCszxrVcYULCH
	MSE4i
X-Gm-Gg: ASbGnctLmuyDsbhlLeEFY6zLMxQooMUXR6N/KO0DuEhvu5DKiGMZ5qSo9dXW8Bu3rFA
	sSP31PbeMmV3G1QdKM3z5x6IdPZIvKtFNbUus5j+Ci/JB9HYnAXodjVIouY/1f2v8v2dFb42EvZ
	ELxzpMW8QSdDGbp65X9zvxhf1BJvhecn+Jyjb4d9O1UK92Jjyr9Kn6oi+8gWMzI/HYuZqzR+w9+
	d2ZGiPPJ4UVyQad2u9EFcceaq3aGk+cqOair61WsluuH2q9znTfq0ceAGj2GIhz12RRSRfNOqA5
	IIr9evuduFqQMiH/uUOY1JU1nO7NLZ91ajE8HBcf+MAKXtvP0mazYmUVOlC4/JCy+Reqn95rC62
	gYJjExu3ITfIjQNQiyz1dXdpctzlrv7FNdJOOePt7oYXuTG5lHP5lvCde5udq5oRN5rFvpMf0fT
	Xp3qU=
X-Google-Smtp-Source: AGHT+IHMM3CFXuRjMCgEUoxVngc5v2BD5693kpZUF+OUE/VnnsKziPseAr7OV03/X2M0EMqfPXjRDw==
X-Received: by 2002:a05:600c:1c9a:b0:459:d3ce:2cea with SMTP id 5b1f17b1804b1-45a217fbc98mr20976475e9.6.1755268586500;
        Fri, 15 Aug 2025 07:36:26 -0700 (PDT)
Message-ID: <3ef1fc73-601c-4de0-b94e-bbf9cc27d081@citrix.com>
Date: Fri, 15 Aug 2025 15:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xl: hide xenstore-features behind option
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <20250815143236.27641-1-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250815143236.27641-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 3:32 pm, Juergen Gross wrote:
> In order to be able to use "xl info" before Xenstore has been started
> or after it has crashed, hide obtaining the available Xenstore features
> behind the new option "-x".
>
> Fixes: ecce7970cfe7 ("tools/xl: add available Xenstore features to xl info output")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Probably ought to be Reported-by Ross Lagerwall.  He did all the hard
work debugging this; I just insisted that the conversation move onto Matrix.

For the change itself, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

