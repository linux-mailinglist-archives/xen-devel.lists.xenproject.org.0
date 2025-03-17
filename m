Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB52A64F77
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 13:42:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916828.1321852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9nH-0006OV-Lv; Mon, 17 Mar 2025 12:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916828.1321852; Mon, 17 Mar 2025 12:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu9nH-0006M4-If; Mon, 17 Mar 2025 12:42:11 +0000
Received: by outflank-mailman (input) for mailman id 916828;
 Mon, 17 Mar 2025 12:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kom6=WE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tu9nF-0006Ka-UF
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 12:42:09 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d85b730-032d-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 13:42:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so2563802f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 05:42:09 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888117csm14663202f8f.44.2025.03.17.05.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 05:42:08 -0700 (PDT)
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
X-Inumbo-ID: 3d85b730-032d-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742215328; x=1742820128; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mombFkLQhrvyUyrJB8DEv0DVDhmEvDRHay+ZAwFp1ko=;
        b=k6Cmb44HsBqIu2UHpHh9RZk2lcbCgzAj1bLDBFBfzrmWP27RvLMe2kg26NXQBIikug
         Ibp2YbxptiDf9Qe0vMYbzxxaalxTnBsCohsHf9caNTsnxmpFZ5l52JjDVgwyaa25xZJ6
         c0KbkWSi/DcrelOGRm1iJMJWr8nqkfRPGe5E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742215328; x=1742820128;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mombFkLQhrvyUyrJB8DEv0DVDhmEvDRHay+ZAwFp1ko=;
        b=p9r7CRXs4r1HUSDs6gGfcUpCOeETexQlagt9y5mx9vPTDpn+RmuLqnEdL4nn9kVNDA
         LKwyTby1gBQ8i8fxWYyjJ5rM5fnJWcjYprw4tLBF9hVpjgURwh8Xw2Rb+k5y40L5Iaf4
         5Wgy2CKqLXRuzgrMQgJRcOKFmQUSEIgV1o62KevfPlUxk0yLDQpMyBdoXP2VtnhrSWKn
         abTu2+6nYVfuFjiiCRZyFe5YgK5JaX5A6so2BHoXbXIajkloffReMqrs3CsoZY17JnqY
         Nnjjpt2hsV4QbyEJrfquXCjqGMgVXaDQ/BBt5sun3A+e7eLV/Q0u9ddOij+LLSGtWUk+
         Wu2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU49/j6p4W68IexzFD0raYO4MGaRKcfQHV9Y3sH+yXRWpOqx0vjpkO1ROms4HIh3R1Pvw6WMaGSdc4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyph/uOYHyPdA/CALGyianaR1bNrpMGOuXxcf0RXo9VbjazVYsq
	1f6h95KqEoclWkGIkzstC8pR4f/UGjG4acbmtmY4msZWc63hg2EfGsignMFpCTg=
X-Gm-Gg: ASbGncsz3PAuV53+jccPL0UpDKrcOEMmIUpbi1mgLqY0605DgWmzgrQBmwCt+E65ixC
	F7gM8EHeumRluY4H9LpXvpUNBnFiLX3C9/8sGrMjWZ+cuozzYe6sEImVS2EQu9albhWcZ+j0i+t
	N5dHtEIA51vizW0DNSaYQQigLw3caayBRGF6b0JgV/JupycEoJrZPhNp+omCDEW4HO89j9yHxM6
	inJ5Aqq/cYoPpZaJsQJmC6wm9AKXfoZYTnD6kH+o4XmYFDLx+8+s8iuZnLjsXuxi+lg/jPVra6F
	pB6qg1lKabW53Upk7PpkZ9wZsrD2P3sA3Rz1SeNHENqa9ukhcjwjcY+5OSofn41mjqou2+ExdLr
	E7s1n/snb
X-Google-Smtp-Source: AGHT+IGEgSy3Mjj1BDcZX5Hnjxf6m3XWfeQQRcY5G4JmOcPjJ4yqJMEn5X7AIeQ+gRyAhrquKnXXzg==
X-Received: by 2002:a5d:64e5:0:b0:391:496b:5646 with SMTP id ffacd0b85a97d-3971e2adae5mr10620376f8f.28.1742215328521;
        Mon, 17 Mar 2025 05:42:08 -0700 (PDT)
Message-ID: <d65e6700-87e9-4cb3-bf00-165e9cd4464f@citrix.com>
Date: Mon, 17 Mar 2025 12:42:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/hvm: add HVM-specific Kconfig
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com
References: <20250315011945.2927542-1-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250315011945.2927542-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/03/2025 1:19 am, dmkhn@proton.me wrote:
> Add a separate menu for configuring HVM build-time settings to better
> organize HVM-specific options.
>
> HVM options will now appear in a dedicated sub-menu in the menuconfig
> tool.
>
> Also, make AMD_SVM config dependent on AMD config and INTEL_VMX on INTEL
> respectively.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll take this as-is, and the cleanup can come later.

~Andrew

