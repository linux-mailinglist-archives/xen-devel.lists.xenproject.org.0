Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39134A598C5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 16:00:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906597.1314027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trebq-000724-RO; Mon, 10 Mar 2025 15:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906597.1314027; Mon, 10 Mar 2025 15:00:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trebq-0006z5-Oi; Mon, 10 Mar 2025 15:00:02 +0000
Received: by outflank-mailman (input) for mailman id 906597;
 Mon, 10 Mar 2025 15:00:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UYYE=V5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1trebp-0006pH-K0
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 15:00:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51782d38-fdc0-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 15:59:51 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914aba1ce4so771496f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 07:59:51 -0700 (PDT)
Received: from [10.81.43.157] ([46.149.103.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfbab43sm15477715f8f.15.2025.03.10.07.59.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 07:59:50 -0700 (PDT)
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
X-Inumbo-ID: 51782d38-fdc0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741618791; x=1742223591; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XoMF72ldFEVyvJcGPXpkMpwhRk+FJSDUzxs+WCXi934=;
        b=T3p9xkToxngMyRHcNusg1yq65nvYwkuUA2DTlkeI82e2vAhDA77JhovoATIic6M1or
         /A8xeVCUHbRdxXP3XofQN8cnqnXvav+GGyMnNtcmtrjm6xk6g2uhVMLIu0A0FryXwsv8
         jtWsYytj9L+8gwKA/UAhQTT0T7DMfbzT0Nf9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618791; x=1742223591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoMF72ldFEVyvJcGPXpkMpwhRk+FJSDUzxs+WCXi934=;
        b=ZXl0MJsC4YHzhhCBzjBlA+NyZXzu41FhPrZ9nqhR2C5l/bO+k+mHw7hN6NsbRhOHMN
         uEwtkWiTVAPt4xoU3BOR1DheuoXRtGiONZXRkj7/fcxfrXTYuNFi5htLaV8mJX7Et+nm
         IV/NMMS5Ji8W/sCoRY9TVI1FvNDnVjUfAdJKqIrPv8mWP6BDLCNyszK/bR9FWs6+pD9h
         n0T3s1OaetnoJyVs443NmiAojxYf02KCrbDakqzixBID/qvGnKgjZHvZzTXrkMC/Pmfw
         NVTAFl+9dYy9JGErjMAjLVcA3xE8k6fJueYBleHWinPFXkWOm5XY1h9dZ2nlN5UdcLoq
         2yUg==
X-Forwarded-Encrypted: i=1; AJvYcCX62fT9b0m55sxvDmtyYOjFWTCpufxq0/sDO/F+sHoduhQGVhhPv53hkOE8oIBJ5DwI/Th9M+wzTMs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAEpegDKxiRtW4S3VEkf7i5RNuQp5M06YEbYWqfMKa2zQ+wnE2
	GvcLasNBwgi/domLsHfKI1eszDjeGYeo7LgDMCfCgu5fukdguoN5vBmfjU8iijY=
X-Gm-Gg: ASbGnctC7rB3uzQaqetUX83Ieo8NI4yynmr/chDTXX50aGiESj8uGkmD3UwmGI80Jf+
	oCynvd2KVQiY6Gsmxni5tptMcWPGSm9RgUWDQ7BwQPVWwP8uDOoIctWBnLfYghDgxDb09J9IukT
	GBkhVQbCoQrH/A8ZzX0yJ3P371zsmjymYtGlVRO/mjXj0mYqyWCHFOMcwhlSlhs++HrbMHRzN3Q
	js39pwGe4LuEnNIvazEaLA45QZbSZvuMP9UB4nsXTi1G3pO/OFwYDiXqpu+6FA1NEKEHT/NrCsn
	iZ31qk1nzQWBZ3Zu1DYaM7n8O6Li5F8O1t6shSHCVo4eDeUZnU/kDGc=
X-Google-Smtp-Source: AGHT+IFJap4kGoael+n4TVmhvc8g6O/Tq5Uae9SRuM9LM4r0kz+PKG55mQa5XGRjBQXc7coSWM/exw==
X-Received: by 2002:a5d:5982:0:b0:391:476f:d3b7 with SMTP id ffacd0b85a97d-391476fd660mr3777608f8f.49.1741618791011;
        Mon, 10 Mar 2025 07:59:51 -0700 (PDT)
Message-ID: <0edc059b-5dad-40d3-8b77-beac53c269a1@citrix.com>
Date: Mon, 10 Mar 2025 14:59:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: Initialise the domain handle before inserting
 into the domlist
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250307164637.3087855-1-andrew.cooper3@citrix.com>
 <169bd7cf-dab9-4ecd-b951-a5ee6cbc069f@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <169bd7cf-dab9-4ecd-b951-a5ee6cbc069f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2025 8:23 am, Jan Beulich wrote:
> On 07.03.2025 17:46, Andrew Cooper wrote:
>> As soon as the the domain is in the domlist, it can be queried via various
>> means, ahead of being fully constructed.  Ensure it the UUID give by the
>> toolstack is in place ahead of this.
> Nit: The latter sentence is a little bumpy to read.

Oh, yes.  Fixed.

>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

