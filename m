Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACF06049A4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 16:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.425835.673904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olALR-0006nb-Ql; Wed, 19 Oct 2022 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 425835.673904; Wed, 19 Oct 2022 14:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olALR-0006kz-Nt; Wed, 19 Oct 2022 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 425835;
 Wed, 19 Oct 2022 14:46:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6HZ=2U=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1olALQ-0006kr-9l
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 14:46:56 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0283b60-4fbc-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 16:46:55 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 m29-20020a05600c3b1d00b003c6bf423c71so198678wms.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Oct 2022 07:46:55 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adfeecf000000b00228692033dcsm13430511wrp.91.2022.10.19.07.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 07:46:54 -0700 (PDT)
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
X-Inumbo-ID: e0283b60-4fbc-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e3CNJR4QS88HvnwtBSl41wTR/zmG/zG9xm1dKy2hdG0=;
        b=RLaFX/Dp3vnHi7EJHhSX5b0GIwsMg1yBfJYKUnwXS1cwlDmgjvqMKlg74E60lsiytg
         asoB9dkZbge9csMKtXHnImgeTbKEblrhN6dCjW09KPDjEiWEjZyxsul2DnJiaQxcrEsD
         r381NrzshWlQHwKsJyCQL+X6C+jXyBUrUrcbX4LPeA+tobEE0L6b3mMcNePasU/qGhW8
         xC8DrRSYHSQM43Shmy4Uvz6NL/jr6kw+svjQJWt68FwiAlZyY94cU1JENTq+muMASOzY
         azh2EL/KQ3Nrn5j7jkLmpR0LN5OBD6Le1aDNNr5MQMKl4qVk2L05rS2WedHAdxBx1zBE
         FRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3CNJR4QS88HvnwtBSl41wTR/zmG/zG9xm1dKy2hdG0=;
        b=6r6BFOvmWl2/SveAkEnv7+qG6sckvqf2dx/fu7tSfSXqzkuLz+GKUUOzF2Tw9NnDgq
         tEyNtRckvPLEHi6tzqOfcw0/MK1+vvXaBIzQKtOfuLwVKoVTlXYS01llCYcSXFVOKsUL
         6g5sYcuShWWHyRX5VDbmDTKT84rFT+9xYjkcHXXCqZJgpR+zssc0In8gAqzsHVZ1B40/
         +WKY9EPdJeccZw2lxQbdw2U9CB9Py1dR17eQrzXIdqb8+bkpbFLtgFX0bE63mJtP5v3T
         7tdPe6AEPTjjk0rhqpJiXS41kvpHNk/edlEE/jpJoMwBW6dS9iT5562ebBaJcFA2FZhM
         r5PQ==
X-Gm-Message-State: ACrzQf3bSQYoqwU+jpe/S+Nf4tF1eUQi6Dt6cT7r1JLFh88gL+o1q1pg
	z7wp0mSLAJWp+Iy0ki4HUQ0=
X-Google-Smtp-Source: AMsMyM60hDMlihxQXeLTz6qUTDrTpSHzW00hsuj5yzeuBTXayoatL+q6lxxLGEJhzi1YDWR2UimQIw==
X-Received: by 2002:a05:600c:230d:b0:3c4:2975:321a with SMTP id 13-20020a05600c230d00b003c42975321amr26929174wmo.155.1666190814830;
        Wed, 19 Oct 2022 07:46:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <66161258-9b2b-400b-4ed5-e980394f905e@xen.org>
Date: Wed, 19 Oct 2022 15:46:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 01/12] hw/xen: Correct build config for xen_pt_stub
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-2-vikram.garhwal@amd.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20221015050750.4185-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2022 06:07, Vikram Garhwal wrote:
> Build fails when have_xen_pci_passthrough is disabled. This is because of
> incorrect build configuration for xen_pt_stub.c.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


