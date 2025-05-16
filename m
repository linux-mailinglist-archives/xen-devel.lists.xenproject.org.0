Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C3AB9CB2
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 14:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987126.1372581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFua5-0001ye-11; Fri, 16 May 2025 12:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987126.1372581; Fri, 16 May 2025 12:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFua4-0001vw-UX; Fri, 16 May 2025 12:54:28 +0000
Received: by outflank-mailman (input) for mailman id 987126;
 Fri, 16 May 2025 12:54:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T4W4=YA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFua4-0001vm-2i
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 12:54:28 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5bc3a1d-3254-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 14:54:26 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so9784955e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 05:54:26 -0700 (PDT)
Received: from [10.81.43.161] ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a362997dc8sm1378620f8f.46.2025.05.16.05.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 05:54:25 -0700 (PDT)
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
X-Inumbo-ID: e5bc3a1d-3254-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747400066; x=1748004866; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6Zg4QjNR1jM2damzt0JCGQ6PBfuBtHfM09WrAArsmYU=;
        b=wJZf0wcCuqXsjLidfBOEGLegwJYpULPm0/hfIOAOPumTyVTX0qnAJzn1bkEleDxcwP
         8amkmNKaZtB7hJf9iIG4g6AACxgtDvYABe8SHRtIVSeO/5G1uleAo4hzETj9av5+p8MR
         aO/PeNMKIzfs/Gf1eVYBesD1kZVfL2jMmeIck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400066; x=1748004866;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Zg4QjNR1jM2damzt0JCGQ6PBfuBtHfM09WrAArsmYU=;
        b=rQ617TZTJt1aFlEaBcvgK0f6Glw+LWNApMgPEAN1gdPFpP1HMSxH6ovovmqoaEnmAe
         WriU3smiFu9F497UJwIPEZ3czrq84DZQ/GFo3ZbMz/U1nzIQbXdz0mfmE6Bg5BSpECvk
         8Xxy3HZaSz9zjO0dOxvIVBVqqyxar5poS31FOCwd0LaQk3G2NWdVy+0grk5xg4pO16tr
         m8ea+UoIP0N821rCAAmKLNLIPXecMRu6M/Gi9sffoinLqhjptTvj3aWb6jz4NoVg5DlM
         CFVoXu6PW+KgRlRfFkcTgoSooMEQPckNsKNYl1yvB9KusTwrIAqHrPG/daaKXXx2/4iR
         UWAA==
X-Forwarded-Encrypted: i=1; AJvYcCWP+Yqjl0LTuMW7YodGBGR57OMUEeCLM8ZIIpl0LczDjdIxneDyssXx3DCMUavS5JTVHVw/Hvoaqik=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPzo7310Y5qy1tCOVy1GPj+EjgQObS24EHz7RSYTY6WnDow7Py
	XlxDkSQ4F+b1STN3kpD9y5A8HOGxy5B4575aym9Fk+lvCeWDvWtYm807GrBuQAPKZpE=
X-Gm-Gg: ASbGncumdDVpZTAfz2QsZGWi5HXzrWW5VXxCvxZFMy+HGwVDzsvgkOpRn/uGzWsS5WN
	OgC5XRfgnDYim8awkKP3oBrLHeY7x6oKPiC+tNxsX1mQRxwobt7eatkRpB2DII9byocurCq6JJL
	5GtVuOcfXgs0/J4If7q/6vpo2F7k94MNbWcIJXie56qMVNMBLy6J0EsdsnnYOahUpseO/wavyv7
	Jt+Mh/bYq9j505ubhDAHVpXVCt7h+g3UrD5/KtS0e2DEt3UDlz2bQ6FebfHv2U09wRZU6byzEES
	BtlHTiIrY4ueMUOjK2KF8+DR0F7Y7JiayOqfdW34N4mpgmTUwS7u+dQJVQq52A==
X-Google-Smtp-Source: AGHT+IGpxLRO0nTd8ow0k5fTXCqi402xJNGUf8EG6A7fil986Cfu4yZ9miWMZIINdRfzHp453+/0cg==
X-Received: by 2002:a05:600c:524c:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-442fd62732fmr36725495e9.12.1747400065706;
        Fri, 16 May 2025 05:54:25 -0700 (PDT)
Message-ID: <c4edef18-e31b-465f-9618-21264088504f@citrix.com>
Date: Fri, 16 May 2025 13:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PING MISRA] Re: [PATCH v5 2/2] x86/vmx: remove __vmread()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: dmkhn@proton.me, xen-devel@lists.xenproject.org, jbeulich@suse.com,
 roger.pau@citrix.com, consulting@bugseng.com, dmukhin@ford.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250513052809.3947164-1-dmukhin@ford.com>
 <20250513052809.3947164-3-dmukhin@ford.com>
 <85f778d1-7fb5-47da-9153-35333e486d24@citrix.com>
 <da9e619607bcf85198505bde196fbc86@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <da9e619607bcf85198505bde196fbc86@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2025 1:53 pm, Nicola Vetrini wrote:
> On 2025-05-16 14:45, Andrew Cooper wrote:
>> Hello,
>>
>> This is adjusting some MISRA configuration.  I'm reasonably sure the
>> change is fine as we're simply removing the referenced helper, but can
>> we get a second opinion from anyone who knows what
>> function-macro-properties.json is supposed to be doing?
>>
>> Thanks,
>>
>> ~Andrew
>>
>
> Hi Andrew,
>
> sorry, it slipped under other emails. The change is ok.

No worries.  These things happen.

>
>> On 13/05/2025 6:28 am, dmkhn@proton.me wrote:
>>> From: Denis Mukhin <dmukhin@ford.com>
>>>
>>> Remove __vmread() and adjust ECLAIR configuration to account for the
>>> change.
>>>
>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>
> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Thankyou.

~Andrew

