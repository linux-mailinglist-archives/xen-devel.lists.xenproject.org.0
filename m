Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB9A5D265
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 23:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909457.1316397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7tm-0003lP-HO; Tue, 11 Mar 2025 22:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909457.1316397; Tue, 11 Mar 2025 22:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts7tm-0003jw-Dh; Tue, 11 Mar 2025 22:16:30 +0000
Received: by outflank-mailman (input) for mailman id 909457;
 Tue, 11 Mar 2025 22:16:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts7tl-0003GE-7P
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 22:16:29 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a6b652f-fec6-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 23:16:28 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a823036so51447815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 15:16:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0ca2sm2143775e9.37.2025.03.11.15.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 15:16:27 -0700 (PDT)
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
X-Inumbo-ID: 7a6b652f-fec6-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741731388; x=1742336188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5XcB2qybKZVQGl81n6pFpKOdgMjLSJJXHu7L1QoXy5A=;
        b=FprghlD9TFmJ7xBNp9UIpCHaHP8/nYYiuovtlRzaty31s5D7BHh1se/olEChKqnUOg
         ztHyJjdjyqucBHn2EHXKH1A3dCoAFkno0FI8pNDM7elb3+d+Bs8fEYLT5r9NL92xjw4j
         DiRO3U+W4Kqn9xdiNc1JVS2BxqklVU7+uldvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741731388; x=1742336188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XcB2qybKZVQGl81n6pFpKOdgMjLSJJXHu7L1QoXy5A=;
        b=R5Z51RrIFzHBZDeoGB5Gy9xKO67VA0qrjUTfKW/vyQTOkniSxvS1VJxAo85hMaRrQR
         WOznKHUxC8uxukjG+KVZnRRn411YybRlBESDSw6CFWmNtLZP56R+ewcVdUtwKs6Yby8E
         M/C8Jr0Vq72euH8EZhlhf8BHSUOlaF/CGk84T7dEu+S/eLWUWK/78FZbbssM7UIrFFe9
         Vf3qgRt7IAiDmzYY768g2ig2toCyIizSEBRL7m1vhLG6ZfdLsoUUXvmi7leD7VB7Wz+E
         O9C8EH657pnZJjgMXDdFdRj3zSWHP5Bfn8eCd27X/OuvaKINaRhD+HnW7HLQffX4zBIE
         +HTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhFpfBk9LHwVuoyr2xEs7LF6AlK8UDPzJ0AE4FixAr5gSttCH+ugb+MZBGWBP++BrBP2QJLGEL4wA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY/26ttw8wk35n0Ql5Ii7lAkj+YC3o25BK9YzxWtQXBACHPuGN
	pRhporqsxRcWmUslieqBTAibJTHuZZjfnSk/qKfMEZWhsLguyKi/arI1J7j211M=
X-Gm-Gg: ASbGncvlx8lGFofGLAjtaplp/dBAb9fyX/QWJw/MhdApgLyUCw/6PisfJPDPni6AHXr
	tlxMQkFGvdbs2t16m6NEzD+449r9Rc0KAxnNDqODrg++2AvMzpJzq9H8yKSuKWcbqTcJ2VXS+jF
	v9rkteq0wnZNhtml1NVyudRNu6SyzZuLOF1CQYaFI9Z8jyuEVvGBynOl8WDi1EQTfGSMgU+l2l5
	ncqBBh6Ipc59xFr/MfwLVf2xOb/IrbUSCwfxZY8rUJym0Vfy/dxSVt9ZhJ8x1sPC5TE41xnUOAx
	HlR0DwDRH43gUMdP6z00sK6Xb7MuDL8OqoPrqHnQT0ELbk0fW+XjPNRuJJjOGqsObHlamG6Hk3h
	SAp0eNyI1
X-Google-Smtp-Source: AGHT+IHoCvkbIlocMq2Q7O8pzKghKRqSo06w6VyRiYDhv+VLC7oZlWBjFMdaymR0HX+f5FiTcn9bqg==
X-Received: by 2002:a05:600c:35d6:b0:43c:f55e:a882 with SMTP id 5b1f17b1804b1-43d01c2aa41mr66611665e9.31.1741731387769;
        Tue, 11 Mar 2025 15:16:27 -0700 (PDT)
Message-ID: <e9ba795f-ade0-482b-93f5-941048ebe234@citrix.com>
Date: Tue, 11 Mar 2025 22:16:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] Re: [PATCH 0/3] x86/P2M: assorted corrections
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 11:51 am, Jan Beulich wrote:
> 1: synchronize fast and slow paths of p2m_get_page_from_gfn()
> 2: correct old entry checking in p2m_remove_entry()
> 3: don't include MMIO_DM in p2m_is_valid()

Luca is triaging failures in ARM's CI.

Commit be59cceb2dbb ("x86/P2M: don't include MMIO_DM in p2m_is_valid()")
(patch 3) breaks two different XTF tests.

They're XTF running as a PVH Dom0 inside Xen in qemu.  In both cases,
it's Shadow paging in use:

(XEN) [    1.035338] Freed 644kB init memory
--- Xen Test Framework ---
Environment: HVM 32bit (No paging)
XSA-239 PoC
******************************
PANIC: Unhandled exception at 0010:0010380e
Vec 14 #PF[-d-sWP] %cr2 fec00000
******************************

and

(XEN) [    1.027912] Freed 644kB init memory
--- Xen Test Framework ---
Environment: HVM 64bit (Long mode 4 levels)
XSA-195 PoC
******************************
PANIC: Unhandled exception at 0008:0000000000103fd8
Vec 14 #PF[-d-srP] %cr2 00001ffffffffff8
******************************


The XSA-239 PoC is reading from the IO-APIC.  The absence of a real
mapping should give ~0, not #PF (especially as it's in unpaged mode at
the time...)

The XSA-195 PoC does a decrease reservation in order to cause `BT %reg,
mem` to trap for emulation (it predates FEP), so is playing in a similar
area to XSA-239.


Either way, the reasoning of patch 3 clearly isn't correct.  (And we
have significant testing gaps in Gitlab CI, although we knew this.)

~Andrew

