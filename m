Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1A4BBF157
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 21:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138401.1474117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qin-00069f-M0; Mon, 06 Oct 2025 19:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138401.1474117; Mon, 06 Oct 2025 19:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5qin-00067L-I1; Mon, 06 Oct 2025 19:18:09 +0000
Received: by outflank-mailman (input) for mailman id 1138401;
 Mon, 06 Oct 2025 19:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iNYA=4P=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v5qil-00067E-EL
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 19:18:07 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ff99857-a2e9-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 21:18:06 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e2c3b6d4cso43561175e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Oct 2025 12:18:06 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619c396esm267838705e9.8.2025.10.06.12.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Oct 2025 12:18:05 -0700 (PDT)
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
X-Inumbo-ID: 2ff99857-a2e9-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759778286; x=1760383086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8btNnX20vjg+LKdQCPqANK5RWG8t7FQDAXuBlbTyXGk=;
        b=mwbhcHiX7+jK9auqLrkJeiVNTyIyin812Fn34E06vpKNOvYra1OUgs9ZrC7YbGkNa7
         VBaCLAwqTPbEugqqGw37WdsoX9U2CotaIcwyJg9HgIyaY6+6M8LbPY91gvw8ppcWCoRq
         9JegOkhQRQn8/uXdWTPWATcHaE+0BB9u8xe1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759778286; x=1760383086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8btNnX20vjg+LKdQCPqANK5RWG8t7FQDAXuBlbTyXGk=;
        b=q6MQ0KRC3Cf97q6maK9ibeF24Rw2rfD1NCq7Nh1ps01QyEhWDknpwwFWhn4d4iyCUh
         o0mfNwk47BgJSI91JNNYKztWdSqx4J5n+BrNSaSASbugD3vr/IHPuFJ9mJ0M8sgc8J/d
         m/RqxMEpHBsm9FNKPaRUJiaeaJHAHL8O9IEPqG8HSzgzD1X2gf3O7cP7l/YlppVjte6f
         TfYq1f78aSQTuAfc/7SDK0ZQCKGvikawmuKlFeyFKlYR8thwXEEwvNVzoMaRkC3EicJW
         In8/3iWQXUYxBaGGs1JoucTjeUEz80scCfTgEgECEgKJ6eMvmuxD0tbei1ADebqCgXPh
         IiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC8laBwfBgXDw0M/SRnXaplmLt6nxxQyyXNvMLTSIcMXRuNKnP+pLzx5zotYEC4NClhhVsuedSWKU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsd4ya6n9n3eTby4JjmBS7ZS0OA2lWvMfGjaGcDHNOy6kdusPv
	8RjY7g+z7FqLeOPvZ0mFEBSGCiWb8p6x9fHQBPQF01Jn7CbI2joihUrpvu/WRdEtgFU=
X-Gm-Gg: ASbGnctS7PwIU07hr042i6AbziEwFeBlA1cB8/FPbiSnTe1FVH6Fme+7+hUqt3tnbuN
	XFYWOXz1xeNr3+N6vDp5XpAYcrJt3k21daX/+ymQnAPH0L0fO02V7gLjTunLOVNsGNgK0kJq5+S
	A0nVZrOEU5cX3DqwHMwUnvxPGkytSBl1JVWHTJDdgtTBcCH3ljC6Xx0rUrroYkyN/b8F5IT6S/E
	UGbZaxFS4zNSAB09Nk8n3zubdSQ2P0jEQC5yznqoKPDRf6q6F3NlGF71D47I+0TJ8G9iHDYj6ak
	57k/FtAXRH9405/Gh+TxVZhrQkMFNfw3dL2dLTDds2a4t3mB6O2TjAdNSXattIILgNgnVOhHHy/
	a7g8Lf9lnblASElxgiS6WKsVpzHvbAAXoJ/mZn3en6taeSqoJYzsungY82vb82FiJw1PxML12dJ
	t+lcnQ5MR/ZDUwJuZ3y3bHmmQ=
X-Google-Smtp-Source: AGHT+IFVngXmOJ0PaDYeaOQRInIg1sOtkYHgAs0BKeDnAo8Q0eu8vgxk2GffX3sG+J/Ex7myjOY0xA==
X-Received: by 2002:a05:600c:64c7:b0:46e:42fa:ffce with SMTP id 5b1f17b1804b1-46fa2d3b26emr2361365e9.2.1759778286019;
        Mon, 06 Oct 2025 12:18:06 -0700 (PDT)
Message-ID: <edbad73d-c525-41b3-8ee9-ae8458a7bd32@citrix.com>
Date: Mon, 6 Oct 2025 20:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 2/2] cirrus-ci: fix bashism in the test_script
 code
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20251006190757.72757-1-roger.pau@citrix.com>
 <20251006190757.72757-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20251006190757.72757-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2025 8:07 pm, Roger Pau Monne wrote:
> The default shell in FreeBSD is plain sh, which doesn't support the usage
> of the '|&' operator:
>
> ./automation/scripts/console.exp |& sed 's/\r\+$//'
> /tmp/scripts34c427adc6599db29cb91221a0939d85.sh: 16: Syntax error: "&" unexpected
>
> Fix this by using a redirection of stderr into stdout, and then a pipe.
>
> Fixes: a406195c15dd ("automation: call expect script with redirected standard error")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

It's sad that this slipped in because the CirrusCI runs were reliably
broken by the libinotify issue.

~Andrew

