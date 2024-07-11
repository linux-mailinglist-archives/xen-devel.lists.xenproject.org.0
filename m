Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCEA92EC36
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757620.1166664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwGr-0002ez-Ql; Thu, 11 Jul 2024 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757620.1166664; Thu, 11 Jul 2024 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwGr-0002cn-O9; Thu, 11 Jul 2024 16:03:49 +0000
Received: by outflank-mailman (input) for mailman id 757620;
 Thu, 11 Jul 2024 16:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRwGr-0002ch-0S
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:03:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27811dab-3f9f-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 18:03:46 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso1354387a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 09:03:46 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bba548d2sm3609289a12.7.2024.07.11.09.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jul 2024 09:03:45 -0700 (PDT)
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
X-Inumbo-ID: 27811dab-3f9f-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720713826; x=1721318626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UaOtfoc/+ticPkkRgaCxlXqpziNhZF4poOhU3l6UhCA=;
        b=XxcT31nnQasu1qbJMWEBXL3LcGDrlnpRTtFWIibTGDXvDrD1MrAFUEkRnSsUpR62Sj
         I3mdF1HScVquVQLuDvVXrZe+fY///8TW/cR+1aV8La2fpeybVL8fw6XxepY3Lz7ei621
         /HiCdI6Q8HBd5Zdt3tuT3t+M0El6S2ExAxfKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720713826; x=1721318626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaOtfoc/+ticPkkRgaCxlXqpziNhZF4poOhU3l6UhCA=;
        b=G6alpM1pY/5h8CsqYTL817LaqHPjTRUhwU7wLgPCpsH3276WPjB0tgDO/j8z7i7nrN
         pD501Rih2aUEx23T3eLUWfQCDbz+O5sCEejzF1R18CMFuvK4lQRFPih+5fatQCu2dywu
         Pq6RvIe14sU+/KfOw95Urbny0Szzjd4/ZIQfHnHvNclTq4dkcLA+P2e/PNOvG/uDDerC
         ks+koiSpPRZck62TR1OOTlgga9/C1rCec88VATRqgUMVD6u+9LRlIlBRAGBcUPte6VHd
         vMfiOqZDsvSG3kqLSVfXXGjGdUMnauRBbmrDmT2EhtpCOTDIUwJ7JsO/oxDeEyl8bXkp
         cX7g==
X-Gm-Message-State: AOJu0YzQC5QH2U1G8tHHpiYpYCpT88a8WUKzTH8nShLX9iQ/vomFVXVu
	OSOc1TmLlvRdvp1XMB/iq2By4jicEelDRUP+LYCYsW6kYWvkPWCh5zU6O+xdfb8=
X-Google-Smtp-Source: AGHT+IGm2YUwIDUH248OuRLPx9qOh3YHIE6OUSa6ZzkPQEeCqUJU958l/vhQBh9ry1koWLypWlfC5g==
X-Received: by 2002:a17:907:6d26:b0:a72:8d40:52b8 with SMTP id a640c23a62f3a-a780b68a34cmr725144666b.3.1720713826199;
        Thu, 11 Jul 2024 09:03:46 -0700 (PDT)
Message-ID: <e761035b-c931-445a-8688-bfbf54e6cddd@citrix.com>
Date: Thu, 11 Jul 2024 17:03:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] CI: Remove useless/misleading randconfig jobs
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
 <20240711111517.3064810-3-andrew.cooper3@citrix.com> <Zo/ZdG8pt5FIledD@l14>
 <5eb4de29-edd3-447a-845a-57d20ad8462b@citrix.com> <Zo//Ndhe9pNFb3Of@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zo//Ndhe9pNFb3Of@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/07/2024 4:50 pm, Anthony PERARD wrote:
> On Thu, Jul 11, 2024 at 04:16:29PM +0100, Andrew Cooper wrote:
>> On 11/07/2024 2:09 pm, Anthony PERARD wrote:
>>> We already have "parallel: 2" on the whole pipeline, give or take, but
>>> those are quick jobs so it might be worth it to run them a few more time
>>> on a pipeline.
>> I'm afraid I don't follow.
> Sorry, I just meant that the whole test suite is run twice, once in
> https://gitlab.com/xen-project/hardware/xen/-/pipelines
> and once in
> https://gitlab.com/xen-project/xen/-/pipelines
> (with just a few tests that are differents)

And the rest.  Every time I re-sync my tree, and probably the same for
the other maintainers.

However, these have nothing on the overhead from patchew, which would be
far more palatable if we didn't essentially throw away the result by not
sending it anywhere useful.

~Andrew

