Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272D6AE518
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507529.781141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZSF-0007fX-3b; Tue, 07 Mar 2023 15:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507529.781141; Tue, 07 Mar 2023 15:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZSF-0007cy-0X; Tue, 07 Mar 2023 15:42:19 +0000
Received: by outflank-mailman (input) for mailman id 507529;
 Tue, 07 Mar 2023 15:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZZSD-0007co-JP
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:42:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2ae63f0-bcfe-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 16:42:15 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id h14so12575545wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:42:15 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d4dc2000000b002be5bdbe40csm12732476wru.27.2023.03.07.07.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:42:14 -0800 (PST)
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
X-Inumbo-ID: a2ae63f0-bcfe-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678203735;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=74vAKFBA0O9oy4Mbr1O3L34ArgkB/qAg1kxwaQlAB0o=;
        b=Up9JMJ1NuGmbIjWI1PQBgjgpXokR0rQNWdqG3F2EAI4VibGHEhTYtxdPZl/RbsgrTi
         w1rYHbKjWUfm/oObh/Ui6afgDTgXtVf81/tc3FXXqEbmVrW4gUzR72i4FmzHAGULLGyw
         Xp0t1zZMyppOkvEvF6G/AtgKGCSIF3puI1MUheB/pntOlCy576csMbFBBzlueh8pSh13
         /29oCfgZgG9iWgvL3Nzor3xC3kn7UrPkdwiZ9JZxxyzTkfeqS2WgB3H7FMm3ciywrQuL
         NYN4sXvUsN5Dys0Bpu3Jqnr6KCqucgeg7Qs+qBHZfGUnhGEhQeyYNMXPcTyjx+6/OiNH
         v3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203735;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74vAKFBA0O9oy4Mbr1O3L34ArgkB/qAg1kxwaQlAB0o=;
        b=vkeCaEJkaDw3cTWuUCk8dHQHOlXLkCLcN+V3a1j102QHJMTZsMrJ2Wq83qTgNDATLl
         YIOU7nRCQOG2dWQx60MyAHVf1R61ovyt27THZQ1CI/iMBQtkLCRbrC9t0VlWVrYMJNdW
         T3pqz3FqN1d3CdwLN9Enq/eZv4543ymxFU/jzCSa3+tptF0t1reYEzfCznwdAa/3wfea
         Y4q06PK1jl6/Bu46fXEt4Wux2tFa9VFVZDhAVZhf+tiouzJs8L+Km2ADkkK7GjHqQlAs
         9XcQ6x+UqVE2JoOZJZYGA6dZ1Bt/CBcgRYRjUysUFLuZ85jH3Bu4uttagyPaRUD8/37J
         SW8g==
X-Gm-Message-State: AO0yUKWblHSSVNiKi9DsARfeWYPVqvtfotGsgGJrbFO9yRJ4im6opbEi
	5MNovlhpdYksqvo7hYyPyX8=
X-Google-Smtp-Source: AK7set9rFAxsWGLDG1Yfv4fXzbVeCS62Wf1GNxeR5INVkKZz/43FKNMtK+CS/JeSbo9jp+1Z+0TQnA==
X-Received: by 2002:a5d:4c4c:0:b0:2c5:4f06:5fe with SMTP id n12-20020a5d4c4c000000b002c54f0605femr9995845wrt.57.1678203735230;
        Tue, 07 Mar 2023 07:42:15 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8afd13b9-78c3-67d6-c1fc-e5a35260e218@xen.org>
Date: Tue, 7 Mar 2023 15:42:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 17/25] hw/xen: Build PV backend drivers for
 CONFIG_XEN_BUS
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-18-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Now that we have the redirectable Xen backend operations we can build the
> PV backends even without the Xen libraries.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/meson.build            | 2 +-
>   hw/block/dataplane/meson.build | 2 +-
>   hw/block/meson.build           | 2 +-
>   hw/char/meson.build            | 2 +-
>   hw/display/meson.build         | 2 +-
>   hw/usb/meson.build             | 2 +-
>   hw/xen/meson.build             | 5 ++++-
>   7 files changed, 10 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


