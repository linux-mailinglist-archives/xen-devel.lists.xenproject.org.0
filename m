Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA99960864
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783853.1193139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuF8-0006cV-91; Tue, 27 Aug 2024 11:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783853.1193139; Tue, 27 Aug 2024 11:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuF8-0006ar-6F; Tue, 27 Aug 2024 11:20:10 +0000
Received: by outflank-mailman (input) for mailman id 783853;
 Tue, 27 Aug 2024 11:20:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S7uN=P2=redhat.com=pabeni@srs-se1.protection.inumbo.net>)
 id 1siuF6-0006ag-O4
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:20:08 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f471e9e-6466-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 13:20:06 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-4CcvQ24IMS6xZFI4mXcidg-1; Tue, 27 Aug 2024 07:20:03 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3718e1d1847so3188568f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 04:20:03 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b67:7410::f71? ([2a0d:3344:1b67:7410::f71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c459sm12768823f8f.27.2024.08.27.04.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 04:20:01 -0700 (PDT)
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
X-Inumbo-ID: 4f471e9e-6466-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724757604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MECBd/hSEibWGsRQlj3xvU/VnK1E0855dY6x5mvZ7gA=;
	b=cZsxPebUTcTccSil891HpRKkkxE9xMsSmYdGVUTikml66Dh0ix5Fx8Inm/9izE9BPBytit
	ZxrPx+0rKcjbhSVO0PsxjZtfERMxFxBXp0ScOBD/cg/JU8iWTMgcMgv1+DmvLS2/9E7ZIg
	zpvv0CCQpacFDqFo/o7wTrP5uwEu3Jg=
X-MC-Unique: 4CcvQ24IMS6xZFI4mXcidg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724757602; x=1725362402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MECBd/hSEibWGsRQlj3xvU/VnK1E0855dY6x5mvZ7gA=;
        b=dxhc57TcWgIHEVeh0yCHa5dwFmaj6rOrbKL0rX2l4YUfMcuGKCU7p9TsHa4ARc6RCy
         L+wrUzdWfvGUilZYyXxRR/mcIOIwo0kg+OdGaYU4ANLWRh3cZioKWbYrI/YzkCtQPBKX
         vdEh5zRFnIkgYduYOLEbDAmVIr/MIY2w4HROZwS9ssvulKgUaWxF7WRhJJTTGqIgBSWK
         ezKKIM5JAx6fax6WIj8cUBAUEwGHyLK7eawvp+aCGiPPPlDud+tNxXgrm1xwd+x8xVBu
         RLx43pqSPhXfQf8WNUVw1t9F/t4Axbwf/mqqlt23QGrDv+uhQ4Pflrj3lZ3GxGKLryn8
         XLNw==
X-Forwarded-Encrypted: i=1; AJvYcCWeUbtGKXFwL2LQGJQPAb1KD2xbHLbfsP0VBxjsjb9JwexCdW+NB8+VGDei2nmoN9rZYxOyB6TtcpE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOpCRSxSnczvFBxTdlAu9g2BQVIVjZC9bVlUlwmQKYiJF9Qosq
	cAjTuUZ6LiIi5jWacoAHZg5pyNAWvuEmosLdQIYKEXRX7YNvJL0l5n8pwjwEBvzt1aT7l/EJWY7
	Mo6bSLK4O+BLOH3NWkPfmcK7uqX1QrD+ZSY2HDclkXLJFySz9CT5sY1mI2srg54Ng
X-Received: by 2002:a5d:4e10:0:b0:371:8e9c:e608 with SMTP id ffacd0b85a97d-373118e3327mr10656412f8f.52.1724757602093;
        Tue, 27 Aug 2024 04:20:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvhXTuSl+sI44eFe058b0E+jARsnoT9juypCVTahh5G9OkBjlQCUYH8EuqxJDKhKuXE431g==
X-Received: by 2002:a5d:4e10:0:b0:371:8e9c:e608 with SMTP id ffacd0b85a97d-373118e3327mr10656385f8f.52.1724757601665;
        Tue, 27 Aug 2024 04:20:01 -0700 (PDT)
Message-ID: <fd2a06d5-370f-4e07-af84-cab089b82a4b@redhat.com>
Date: Tue, 27 Aug 2024 13:19:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net/xen-netback: prevent UAF in xenvif_flush_hash()
To: Jeongjun Park <aha310510@gmail.com>, wei.liu@kernel.org, paul@xen.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 madhuparnabhowmik04@gmail.com, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240822181109.2577354-1-aha310510@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240822181109.2577354-1-aha310510@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 20:11, Jeongjun Park wrote:
> During the list_for_each_entry_rcu iteration call of xenvif_flush_hash,
> kfree_rcu does not exist inside the rcu read critical section, so if

The above wording is confusing, do you mean "kfree_rcu does not exit 
from "...?

> kfree_rcu is called when the rcu grace period ends during the iteration,
> UAF occurs when accessing head->next after the entry becomes free.

The loop runs with irq disabled, the RCU critical section extends over 
it, uninterrupted.

Do you have a splat for the reported UAF?

This does not look the correct solution.

Thanks,

Paolo


