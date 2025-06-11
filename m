Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5B0AD5409
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 13:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011616.1390061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJgt-0007DW-Gf; Wed, 11 Jun 2025 11:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011616.1390061; Wed, 11 Jun 2025 11:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJgt-0007B5-DF; Wed, 11 Jun 2025 11:32:23 +0000
Received: by outflank-mailman (input) for mailman id 1011616;
 Wed, 11 Jun 2025 11:32:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPJgs-0007Az-1l
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 11:32:22 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcb74df9-46b7-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 13:32:20 +0200 (CEST)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so3139751f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 04:32:20 -0700 (PDT)
Received: from [192.168.86.29] ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532515cb14sm18444985e9.13.2025.06.11.04.32.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 04:32:19 -0700 (PDT)
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
X-Inumbo-ID: bcb74df9-46b7-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749641540; x=1750246340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d0Xh98cVVpc3tNTxfBrKJZEIo+rMIgMk907rUjX78KM=;
        b=wEEP5VhVLEMr67dV7vXVVxT64EyDQv0Y5NUu+dRmW+9VsQzJi6/qY2W1OaPqG/uKJa
         9qb3yExNWebNR3exr97Xa4D91lhnoxMoz9NzHiJk8c9b0ymWjfX5gIk0kXRfzkJHPL8O
         LtzLP6OAo+2MuVoxei6IXSB5nnAMzsXq6FFLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749641540; x=1750246340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0Xh98cVVpc3tNTxfBrKJZEIo+rMIgMk907rUjX78KM=;
        b=elMcyWhYUENIsJ8QqYORw79tP1RBT90nKPHgAaO5BM/h0ia6HE+uIrPZI1wyvLhzxn
         yk8eZiyKxMd2ojmn8aZJyYoUWAG5W82q/TOGBU03CwCAlxGSat13ArrmjLa841Cap+PR
         Mt4Q999KXnRrAz+P1TTe+tyy7WBLmitooF2GVY9IrkWIXNAEhYAtzOT0LSvDxNXYroBx
         Sze3B/LMIjyMnjT/n/ZjRYGhcOrFyIXubaGdufK5UyLiI22Vv6zqUXZ4FkrTTfCxzb73
         Du4GH8TW4hzN+AAvf5a7KnS+LXpgDj3nje8nG27wwRTLy+gJ/SiDEjMKuzcU1pWYdMlA
         QcUw==
X-Forwarded-Encrypted: i=1; AJvYcCWLtbTo2NFm/joz6conljqHzJQLFy8E31R2GvzTxqb9BOKIQGcHC7dsbpMS/ivzgROKJRVCFU514Z0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyquzccolN+h8EqAuvWPk0zM+glYy6osqDTMsfCLEhFnvRSVKqJ
	SjnmnLr5EjGVUxmZ21+MTsNFuSzkXJ4Dy3TwcD87aoo4B8Nyk26CQPLaa3Q3hzpRtY4=
X-Gm-Gg: ASbGncsLjDG1+7oAahm0oTSDtHo9THY5O9uQZcrpDhkK37S5dnvi5dgXiNDaAFHOPIx
	EVA5dc24JB1iL3K73wOsh49sPMJcMK+mrVc5QWQjERCdYBh8hkqBcGWQ2O8kcJm1OpMOKtg1w3U
	cgCADCMoEoDPo8M2QFrFO63yFEmUdSAzzJpDPn+5xCOZt+DkTXMLFjoyaC8ZUyp+ct+49E7RHlb
	vdMkNC5cAF9jt7WZzyS6CMauganfS+RRB4FUE3Rq/JBgMhKuZTLqzHPeAUJphOjQ/zU8OJGVRi5
	c2J2rKR0XzQE0LrWP6fbkoAbWNviZnbQXesg/feUIZa6+RQE3DNqaujuURYylu3ZlH2XNBRcI42
	FQXh63gM3bQ==
X-Google-Smtp-Source: AGHT+IHNFMi3LoOVWczbylqB0/mXXAOI5THuvvLTqs4s/1hQ7OhP3wqF6PEnn2l+LQIQCkBcdiXi8w==
X-Received: by 2002:a05:6000:2c11:b0:3a4:f6d6:2d68 with SMTP id ffacd0b85a97d-3a558a43bdemr2475836f8f.56.1749641540257;
        Wed, 11 Jun 2025 04:32:20 -0700 (PDT)
Message-ID: <8d86577e-9ad4-46c3-b6ef-c59e471031d0@citrix.com>
Date: Wed, 11 Jun 2025 12:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] vVMX: operand size in decode_vmx_inst()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <44d67587-415e-4ec1-a433-64a12aea80d7@suse.com>
 <14bb65f3-5b6e-4b12-8914-25528efee557@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <14bb65f3-5b6e-4b12-8914-25528efee557@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2025 11:44 am, Jan Beulich wrote:
> Address size is entirely irrelevant to operand size determination; For
> VMREAD and VMWRITE outside of 64-bit mode operand size is 32 bits, while
> in 64-bit mode it's (naturally) 64 bits. For all other insns it's 64
> bits (a physical address) or 128 bits (INVEPT, INVVPID). To limit the
> amount of change here, keep the latter at reading only 64 bits from
> guest space.
>
> Fixes: 09fce8016596 ("Nested VMX: Emulation of guest VMXON/OFF instruction")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Beyond the wrong operand handling for INVEPT and INVVPID, the latter
> also doesn't even have the part read checked to have bits 16 and above
> all clear.

There are more bugs than these.

https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/x86-next-euan

Judging by the choice of branch name, I think I'd collected those
pending the re-opening of a dev window, and apparently forgotten.

At this point I don't think we want to take the branch as is (especially
as I've forgotten why it wasn't taken before), but I think there is some
salvageable work in there, beyond the changes in this patch.

~Andrew

