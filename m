Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF06B7FEE2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:23:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125228.1467236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyt3i-0000Sx-5d; Wed, 17 Sep 2025 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125228.1467236; Wed, 17 Sep 2025 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyt3i-0000RU-2d; Wed, 17 Sep 2025 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1125228;
 Wed, 17 Sep 2025 14:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Emon=34=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyt3g-0000RO-Ps
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 14:22:56 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd771725-93d1-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 16:22:55 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso737785f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Sep 2025 07:22:55 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7760793b730sm19338127b3a.15.2025.09.17.07.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 07:22:54 -0700 (PDT)
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
X-Inumbo-ID: cd771725-93d1-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758118975; x=1758723775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U03JiOX1pR4ni6BN6su9Z2bN0KkbdhKqHkKE9GUMhno=;
        b=KCn9KANxD3luPEMVr2iYOjE/KEdkecIWnhcGX3WeErl5PiChhTNZZsYeakAOWanPDo
         yDK6y/VTt6B4iMl4A21HcY8SXBPnNG7o6tLJMBAYF2LnHbgWxOlPLtHr/BwDWArcGqdS
         WklfaxU1IKC/OjGlhE6TJakeYYiEi0b3qsImH3uc7g+fXlX8Ke5f9K60zU/l9kx2I7OD
         gmkPzemL7aCSbKa4oKTjsniOhrhWolMzehuXISpQfkI0TbTxu86kgONKv10BovQ9hNEv
         vjy4O+NZjLzWpyHPJIoVKi+8k4y/LJhQvPHpXJNIVoXCSYKEHSwOg158NACoN0BdQVbz
         NxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118975; x=1758723775;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U03JiOX1pR4ni6BN6su9Z2bN0KkbdhKqHkKE9GUMhno=;
        b=GFevTvTH6VZ9kNy7tCzd3edKCIEIpf5osNtPi+LfgW5lX2B1KwUrcR8Ceu92vtVXB1
         20oUFGeXmr8AOJtrw2gnK7vyIeL2tarkyxBWTKtRdQIvarFoYowtgAtQM6OoDcTkOeV5
         joI80htbwacNgmRxvD+9eROvBUnAXvu1YzJFwY1f1oV6YFYs0oiowEW1i0SLjWGnqPon
         0IrNqySGLz5dIwNKAJ/zksY7IuCZDEyKoBota00HUMzsV2JZgu5fI2VhHBc1wXClv0Z9
         oy9NCDZTfrypgLhtXrxrsdviwUhNpIzEPr+nplMQ6Ju6Y5pVw5OqDX7xnWIA3UlCW4VM
         KqFg==
X-Gm-Message-State: AOJu0YztDH180uwubbum8jsL2MU22JOVFTe1tf/HoqJi7a5pTWKXjpKB
	MH6hBo9dHbGRoO3p1eimo1tkccLJrgsspPgWb3KOtyv7siI6jrcIe5EufS7UDrL7KvOUMRyAp2e
	Eie8=
X-Gm-Gg: ASbGncu6hTHtOdsFLdUeIoDEDOnbb7iu/WE2P4RIoE3zHNL9pi83z5qomcPrWyCDblR
	wO6qVqGi4uB2S+A9siEokT+ZkouVNX2fcFQKqKMU0QTeVPFhk2TauqigL7pOhGiUytglbtqFJwo
	KK9l3E9CoEVl8vIxh7xnxRjFofXtYuDHcaFWZb8GdD/JB9Qg1HIPotfYp2UW/m54SdMVuBm/2V5
	XaLMs2TEgFNCNFtL8e7RXmCuqYgmWS0y8e3sOuARCWwu0tmG8oviZRpOg9GUmvbsS0QvhPn6uJN
	d/cSsKy7dEUszJ5aQXckGJ3gplFcrD3bK2So6mZ9qBAye2AFwqNphfIB7KQ0XKp08kr6M4su6Kq
	VGBTCh3A8PWhydnNK+gxzF/sUT4h6gKI=
X-Google-Smtp-Source: AGHT+IF6amnpVsQn0Dst1pj0fA6A/2NJ+jYqmwQMPSoH17hP7L1nUUawH7VLPHVytlIxGaTbxoY4gQ==
X-Received: by 2002:a05:6000:2889:b0:3eb:d944:8888 with SMTP id ffacd0b85a97d-3ecdfa356b2mr2589572f8f.55.1758118974840;
        Wed, 17 Sep 2025 07:22:54 -0700 (PDT)
Message-ID: <110b04b1-f123-4421-9019-43713384a7b8@suse.com>
Date: Wed, 17 Sep 2025 16:22:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Summit 2025 - Design Discussion Notes - Xen ABI
To: "Alexander M. Merritt" <alexander@edera.dev>
References: <DCUSYP0Y5FYU.37Q6RNEA7AMZQ@edera.dev>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DCUSYP0Y5FYU.37Q6RNEA7AMZQ@edera.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.09.2025 06:49, Alexander M. Merritt wrote:
> Hi all, it was requested I send the notes I took during the design discussion on the ABI / APIs to the list.

Thanks much. We will want to try to have notes taken more systematically
today.

Jan

