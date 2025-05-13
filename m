Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151AAB565B
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 15:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982851.1369202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEptG-00030k-LC; Tue, 13 May 2025 13:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982851.1369202; Tue, 13 May 2025 13:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEptG-0002yO-I6; Tue, 13 May 2025 13:41:50 +0000
Received: by outflank-mailman (input) for mailman id 982851;
 Tue, 13 May 2025 13:41:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dY5U=X5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEptF-0002yG-RS
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 13:41:49 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01fcc3b2-3000-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 15:41:44 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7424ccbef4eso3005006b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 06:41:44 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74237a8efa2sm7741177b3a.165.2025.05.13.06.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 06:41:42 -0700 (PDT)
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
X-Inumbo-ID: 01fcc3b2-3000-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747143703; x=1747748503; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CjBhEUReEcpnOvmXghRfokYvtQrmimmin9Z5BxHCOeM=;
        b=dJE/qxP5ubbiJ7LEWxRl1Y7641rPhErWy/reZBx7SvxSPmgkBgFcRepB4FiFssquh9
         Uj+8Ui+WslXG8GUXRNnI6VD+8u29u2ow2B8dyXO6xVHZ8IwvG7TQhPDxucc3FXOOTzF7
         50t8TjieVU7Fl2iOcv4KHzqik8HQezfwoEk7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143703; x=1747748503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjBhEUReEcpnOvmXghRfokYvtQrmimmin9Z5BxHCOeM=;
        b=gailnw3stJhKDjUZVt5edzafJtylwHhVSaAZQtWpwGdCCC6sZON1Tb4XrnFKeG3TmD
         hdfHAlTaf/TGDQkySuuQR60lBQSlwJ9UZp9Uh3gP/k9RBPfUaWQ/ZAV1b9J3lYLrApCi
         CnQluJna57PaQgv4zXl4OQksvM7fpJvoKnmZPfurmOtihLdSzah4MrjdSGkmoeJWd5yn
         89aj5g+llEi6j5vkRXmON/a76FttGVPxCGEgJiHfygKOg80BeOpHA+4QsDdPp/RHlcPJ
         aFeST/0pSFjPG/2a1dA4bInHdmhQsNOEb7Z8pvtPfO8yOMnvwww8hti4sHAdSrD+bw5k
         EWZw==
X-Gm-Message-State: AOJu0Yw2QUuLfaM5uCgsGAPH0GMurX0kjuT35m9vAQ3IB/MleFdCxjb6
	LzUhcsRof5hj7JEIeDDPOoVqGKFVBUKobzpk4Nz2+EW/sBGz7gxNE7gYJeRG8ik=
X-Gm-Gg: ASbGncvZkAbiWYB+K1YrjW2Gi2LWSu6efWqGiievZK5iO8iGaftNBapOaHVNPN9pSdp
	NbVEONQ2npOga+g9tB4nvrUtyLzcN62U4pQSP/UVnHHBSSCxB1BwRlzYc1JK8V3g5HSuHvNpUHZ
	Iw4UxeCe40VVEoWTIOLPqFWgmfXzf9kAjK+gboq4jmNmRUQ0dY/XhZ8EIA4Ao07V/nZo1n6Ys36
	0cccpy1lNM5bfFfsesPIgaYAeKAKN8oB5aYl1ZCT3f9fm2YMkGzVZGXr386Jefu/YmeEUxveFaA
	Frcmch/IAvLzihN5wV8aPfNxH16b20eTStyHMn13ml7rX8XM4/JgJYvfa5ElhQ==
X-Google-Smtp-Source: AGHT+IHPsTEwJwTw0bg9EfuNWCe6ZpabY7d2+vlVP1CkkKj5uvLszkhAwWTBnVnfbz24xZwVjBJfCg==
X-Received: by 2002:a05:6a00:4b53:b0:740:9c06:1cff with SMTP id d2e1a72fcca58-7423c0163dfmr24716454b3a.23.1747143703267;
        Tue, 13 May 2025 06:41:43 -0700 (PDT)
Date: Tue, 13 May 2025 15:41:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v2 2/6] x86/HVM: restrict guest-induced WBINVD to cache
 writeback
Message-ID: <aCNMEadsYoIKLbSp@macbook.lan>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d55070c0-04c5-70a4-f9f3-3227d42578e6@suse.com>

On Wed, May 03, 2023 at 11:45:22AM +0200, Jan Beulich wrote:
> We allow its use for writeback purposes only anyway, so let's also carry
> these out that way on capable hardware.

"for writeback purposes only" > is such the case because we cannot
guarantee the guest in which state the cache will be when resuming
from a wbinvd operation, and hence won't be "clean"?

It's my understanding that the same is possible on native, as the CPU
might speculatively pull lines into the cache.  So there's no reason
for an OS to use wbinvd if wbnoinvd is available?

Thanks, Roger.

