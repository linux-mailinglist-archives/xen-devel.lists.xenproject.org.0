Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F17F4DD1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638939.995945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qhI-0003B1-OX; Wed, 22 Nov 2023 17:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638939.995945; Wed, 22 Nov 2023 17:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qhI-00037e-LX; Wed, 22 Nov 2023 17:07:32 +0000
Received: by outflank-mailman (input) for mailman id 638939;
 Wed, 22 Nov 2023 17:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeb/=HD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5qhG-00037Y-Sa
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:07:30 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e6cd5eb-8959-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 18:07:30 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3316c6e299eso3357371f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:07:29 -0800 (PST)
Received: from [10.95.134.92] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a056000124300b0032f7e832cabsm17673508wrx.90.2023.11.22.09.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 09:07:28 -0800 (PST)
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
X-Inumbo-ID: 9e6cd5eb-8959-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700672849; x=1701277649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fGZPxbwGMY3QWkow4475z+MXvadUM3v7KWn5MxJLcs=;
        b=RKAE16f8jvtbIqHWMzlHP8WJJ8q4htT63vKklXo6pR7Rldw6aLcYj5oQ6gpPzzFJcV
         V/d4ZT4kTfcjzNcNOFKVcMWdHY+hY5ECU+uFDZXwe6d9L9uPUJkpa1ZJ2w2hTW3VRcm1
         AUb2JH5G0fYd+1INVvaW+gfkePpCI4Pngi8eK1Or+A1en1lbFUFEv3gzc0YkDlBB1B2k
         upTga8VPUcwdtKy+6LErmGwS8QioY7HNjpLxw115QHIFk3MRiuWdwajH1Eo6alTfuWuy
         Tt8ILkym13G3WUhgzQ8ouaTUQEiG9pv2lKlz0Ec1S9O69hDjXBv/5dRTaR94ApmEMuA9
         GTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672849; x=1701277649;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fGZPxbwGMY3QWkow4475z+MXvadUM3v7KWn5MxJLcs=;
        b=rbWaiJ4eScJzVaGetZDbXDX/8gj0qi+zASp4/8KHSuVq33DwB1pYh9vOrOoqyPCop6
         ohpjnrm+o4WXXqsePqZ0Vuufg3wHgttVdOLb8TNer5l+Jv+uaWRH0l7c0MrNgkjKHwZh
         xfRDM/kXcnoNkAt9MOhelJVaP+Xl0NognWzR3MPmYZ+XuQ8H2Bei7zjqkhbE32tshGnF
         xNFmZRNuDmBP5be8znQYpR4Wdmr0srLu9PBqq8SjDZz+QkUB5XrgrufdgulnlcLq7MBT
         kqzyu+z3VgCZZvTyAO48olqg30lp2ehLEQBJAgkxQeK27VP8vfBeuPiC0Cib0gSnI/w+
         1few==
X-Gm-Message-State: AOJu0YwPosA+XkLCoVK8lrcdvkiVdpALqrCGMlEPwvxPNQsBHyE5wwVG
	qH+b2S4eYTiY6W1gtWXQulw=
X-Google-Smtp-Source: AGHT+IFsCnypPtHuEh0bNMMwNDbRPFPmk2JKHo2KVYW81JB+V3OGjDLa5vUOmIkzPbDLF5Q1hxT3Yw==
X-Received: by 2002:a05:6000:b87:b0:331:6a36:a05f with SMTP id dl7-20020a0560000b8700b003316a36a05fmr1950659wrb.65.1700672849171;
        Wed, 22 Nov 2023 09:07:29 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c9b15b1c-e86b-45b4-b348-8c9edde5e60d@xen.org>
Date: Wed, 22 Nov 2023 17:07:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 3/6] xen: xenstore: add possibility to preserve owner
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 David Woodhouse <dwmw2@infradead.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-4-volodymyr_babchuk@epam.com>
Organization: Xen Project
In-Reply-To: <20231121221023.419901-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> Add option to preserve owner when creating an entry in Xen Store. This
> may be needed in cases when Qemu is working as device model in a

*may* be needed?

I don't undertstand why this patch is necessary and the commit comment 
isn't really helping me.

> domain that is Domain-0, e.g. in driver domain.
> 
> "owner" parameter for qemu_xen_xs_create() function can have special
> value XS_PRESERVE_OWNER, which will make specific implementation to
> get original owner of an entry and pass it back to
> set_permissions() call.
> 
> Please note, that XenStore inherits permissions, so even if entry is
> newly created by, it already has the owner set to match owner of entry
> at previous level.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>


