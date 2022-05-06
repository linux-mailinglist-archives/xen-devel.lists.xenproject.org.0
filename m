Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96251DA21
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 16:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323270.544844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyeS-0003eI-4Z; Fri, 06 May 2022 14:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323270.544844; Fri, 06 May 2022 14:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmyeS-0003bW-1n; Fri, 06 May 2022 14:09:48 +0000
Received: by outflank-mailman (input) for mailman id 323270;
 Fri, 06 May 2022 14:09:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GlIu=VO=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nmyeP-0003bE-Ue
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 14:09:45 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb5e424-cd46-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 16:09:40 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id e24so10200672wrc.9
 for <xen-devel@lists.xenproject.org>; Fri, 06 May 2022 07:09:45 -0700 (PDT)
Received: from [10.7.237.9] (54-240-197-225.amazon.com. [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0020c5253d8cfsm4513058wrw.27.2022.05.06.07.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 07:09:44 -0700 (PDT)
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
X-Inumbo-ID: 2bb5e424-cd46-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YeJOWl3F+wY65E3bdK8hLOeADUm6Dg14aaKfYaDEWbk=;
        b=ZDhoq1mDERS27mL0qTpl6hnXBcFn1pSdwAwI29XppLx1xiAyb4TX3sartthd3Y0pNX
         NBiu+HZQRGZ/7y3QxyUvFltFFenTPwX/33bn4fZt75fwLNF1uCNvKu1S5QJYGOp16WVN
         0Dk4JyquQUAJNRF/XNdDyKVrPpwqJ2sbGlU14xHkRexC4sfhEKKhf9g3P3GuC0AiMXwr
         B6JdzkKz9cZ5v6MBvP8LhpdJvtq/giP21HeajauTzR0thxkAHf1Dbo66oLZpgWfqjQDS
         dRkn/EmUxSQusjzrKLD/fkQNw+//FyyHirlBF4NYWvBC1f/6IbQvFX2emkKTU6i6InHM
         b9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YeJOWl3F+wY65E3bdK8hLOeADUm6Dg14aaKfYaDEWbk=;
        b=qS7ssN/S6QxhVlHKQ3u+d1npeSv6K38t+2ztDIL97M7wmKYCgTak448s6h/zctd2GN
         AfSD27+FnO7q9CI45EXx9r0j3QP+g765AF80iAxgBjuT7iovGKpcNzB9pk+1n6J0e0GR
         QZa9g9mkhXBE3p149rma3hFoDyihR8aqevLUuk59AsdfqMbzs/6oF+ZfNjMD7/AvFS42
         wXzVgB8MfmtpKKirmwmL/OeqBrvpdCxv7u7HJDscwWzcqKQDyh3wJ7N+2IqIOZxIMgpX
         +GgBkNpGna03aqXkGxFveWxVahsXX7VfB0YUlDY8Yr6rK6Q263RcNVohWq7yAluEeF4k
         W3pw==
X-Gm-Message-State: AOAM532JAKKoH86ulY0xgZ11uy1mSMov6m9NPTovqEwAou3xyW3H0Hod
	XvdKQywpuW47bulgy/3xE6M=
X-Google-Smtp-Source: ABdhPJx4ZVyywK9VkVJUQTLh1htFU+dklmVe0yjncSUImFFe0I3SW0lr8AXpYlruHChodZF4SOPMSw==
X-Received: by 2002:adf:9dcc:0:b0:20a:ed44:fd48 with SMTP id q12-20020adf9dcc000000b0020aed44fd48mr2873120wre.120.1651846184543;
        Fri, 06 May 2022 07:09:44 -0700 (PDT)
Message-ID: <2bbdb007-1a28-67ea-0801-fa471bb6e416@gmail.com>
Date: Fri, 6 May 2022 15:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Reply-To: paul@xen.org
Subject: Re: [PATCH] xen: io: Fix race between sending an I/O and domain
 shutdown
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220505175131.81457-1-julien@xen.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220505175131.81457-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2022 18:51, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Xen provides hypercalls to shutdown (SCHEDOP_shutdown{,_code}) and
> resume a domain (XEN_DOMCTL_resumedomain). They can be used for checkpoint
> where the expectation is the domain should continue as nothing happened
> afterwards.
> 
> hvmemul_do_io() and handle_pio() will act differently if the return
> code of hvm_send_ioreq() (resp. hvmemul_do_pio_buffer()) is X86EMUL_RETRY.
> 
> In this case, the I/O state will be reset to STATE_IOREQ_NONE (i.e
> no I/O is pending) and/or the PC will not be advanced.
> 
> If the shutdown request happens right after the I/O was sent to the
> IOREQ, then emulation code will end up to re-execute the instruction
> and therefore forward again the same I/O (at least when reading IO port).
> 
> This would be problem if the access has a side-effect. A dumb example,
> is a device implementing a counter which is incremented by one for every
> access. When running shutdown/resume in a loop, the value read by the
> OS may not be the old value + 1.
> 
> Add an extra boolean in the structure hvm_vcpu_io to indicate whether
> the I/O was suspend. This is then used in place of checking the domain
> is shutting down in hvmemul_do_io() and handle_pio() as they should
> act on suspend (i.e. vcpu_start_shutdown_deferral() returns false) rather
> than shutdown.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Paul Durrant <paul@xen.org>

