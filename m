Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268DCA12DE7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 22:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873157.1284139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYBE0-0005P0-PX; Wed, 15 Jan 2025 21:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873157.1284139; Wed, 15 Jan 2025 21:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYBE0-0005Lw-Ms; Wed, 15 Jan 2025 21:46:56 +0000
Received: by outflank-mailman (input) for mailman id 873157;
 Wed, 15 Jan 2025 21:46:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmQ5=UH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tYBDz-0005Lq-9W
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 21:46:55 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b777ab1-d38a-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 22:46:53 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so1786015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 13:46:53 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c5b2esm36275995e9.23.2025.01.15.13.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 13:46:52 -0800 (PST)
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
X-Inumbo-ID: 3b777ab1-d38a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736977612; x=1737582412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DDdtenWdSdK6ENY5ykURKTlyyLw2SFSAn8y2xee8074=;
        b=gJ4LDmR+BWhz/+M6Dq72gSCEJqNuxZhf5kWzUOR2NKXdbYHhk+7syT92hxSCkdVxH1
         tm05WMWq+Hd03yh2SH1Qh8ooGnvEXbKM/4N6zgAW74gSPeduBwhvgZ69YfNWP5Za7sXM
         3XgBuR1fbexpk4TXo/nMyuxQ8GIwjyL69V5jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736977612; x=1737582412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDdtenWdSdK6ENY5ykURKTlyyLw2SFSAn8y2xee8074=;
        b=RvsqXt2OSnZN0PLCuLR+4QlADIvHlHPmPZc8APsUzGdYzRnH0eLfF2DX04EcLhZGEn
         vxzVYpbtERy7Z6MYLATtul2u5ZlkjUGWn00MvLiPsTg8IfziQIWS8+N+EdoqjR/Z0RZW
         7B/w9vYYuskJuT/Hpk7P5z5uMzhP6G1jTrZWoeFhysan/ENk9OeCUhrDVvkmR1AA5Alp
         CQoIgTZ3sH3KZQfKHNRbTLzbuQhg0FivwHMvlYLU/BvF/f/TVFRJ9fOXzUgcPU1xM5uP
         BPJ8fZde/XZW9jb/giWjFGndW+LDZQT6vLg3SRh00FPda1lc3I7IYU457OrjZ1EJtE3/
         B9SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPit4lA3POkVEw1Gm+60cDdODZu7aA5p5606c/AznE6y5Tqh60kp8AgWk1NBpieRcxhqd5+nQPVTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpBwcnvewZXxeT7MoHkFNDTw/q5GreNSfHXc0iHC7Kdm3M1eSz
	2RPY/Fo0+Xtt5DgRRAKKmVFXgJdQRYmGepAFRWiMa5Gh3INb/+PWnSFNxuwrPgs=
X-Gm-Gg: ASbGncsNIEvzQjr9wn/xfYwgNWdlu8/Sksj9Eh9ZGLwXQG1LZxSfXUXa7O0By+9w+2k
	RWMkwC0KOnmDJTHgHY0vaEstRC7JcwYbB6KXzT5sB779RSYf3D7CW5DObGCTz4d0qu07Z3MsK7p
	khVhPbvM8Z06VoPQ4WfkIuDwCkKjK6kchhsyOhHP6CY++R6pYB4deULG9aVPEzxEVB9ibwAf9zt
	QqzyOkbUwY3vXP25hQ6EA6YCLOjXooywsl8tA23wD/ok/K0iptUti8aQjN+IX0jiNgvtApN1SkZ
	00aVmHAPS6Y7cAOxJEyV
X-Google-Smtp-Source: AGHT+IHs2+H09qffluvc90VJ3c5lBwGcNqLK7wWHRr99T7ni1+ngRSHanPWVWXuEOsDirWCMBTV0vA==
X-Received: by 2002:a05:600c:4f47:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-436e26e1f6dmr266533645e9.22.1736977612441;
        Wed, 15 Jan 2025 13:46:52 -0800 (PST)
Message-ID: <7c8a06bf-8558-4f14-9298-95e803cc674a@citrix.com>
Date: Wed, 15 Jan 2025 21:46:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Manual pages: Fix a few typos
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <3093091e43220a0e6f698f7b3f5dafc5eba2d021.1736949423.git.bernhard.kaindl@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3093091e43220a0e6f698f7b3f5dafc5eba2d021.1736949423.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2025 1:57 pm, Bernhard Kaindl wrote:
> While skimming through the manual pages, I spotted a few typos.
>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

