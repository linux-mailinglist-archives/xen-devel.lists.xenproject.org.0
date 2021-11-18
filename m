Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58C04562E1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 19:47:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227558.393597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmRd-00044K-A3; Thu, 18 Nov 2021 18:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227558.393597; Thu, 18 Nov 2021 18:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnmRd-00042Y-6d; Thu, 18 Nov 2021 18:47:37 +0000
Received: by outflank-mailman (input) for mailman id 227558;
 Thu, 18 Nov 2021 18:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezFO=QF=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1mnmRc-00042S-A4
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 18:47:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fec63bf8-489f-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 19:47:35 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id u1so13396341wru.13
 for <xen-devel@lists.xenproject.org>; Thu, 18 Nov 2021 10:47:35 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599?
 ([2a00:23c5:5785:9a01:70ff:9fb9:79eb:9599])
 by smtp.gmail.com with ESMTPSA id e7sm951885wrg.31.2021.11.18.10.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 10:47:34 -0800 (PST)
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
X-Inumbo-ID: fec63bf8-489f-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CLzrQk9I+jVAC4VMNStZlGSKMxgxyNMtoE+8tF6z5rI=;
        b=UIupOkzhoKW78NOoEZFcYffzyauhodoM7UGgttrXIhWrjGM7YpoLNuxIqLiI5eOxzJ
         mK8FM0Y5r5TzlxXqrsEpNTMgCh0qCcN3oDhMOv0+TeE61rax9Kcaxrkp8Rc7SHiPmhs9
         PmyCw9Vb6d+vsnO7+XbRHS6ZnWaO3qYITjTV/M87Iznb8QhcgEBr80JI7wV4IwLokEMy
         jsmc8Rh7t210JWkHvjpXF/yXoSJ4nGkBUgrVVpPHg8RV+q8bZLx9svOtKhsSvLKDU3OC
         DipLGbf9Y3XA3rEVN3hz689jfQ/zw6bVFnk6PK9Sp7FAaAuWgbCuUdOquVN+78stMrbN
         55dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CLzrQk9I+jVAC4VMNStZlGSKMxgxyNMtoE+8tF6z5rI=;
        b=AsEhbJid6LN5M4aBSikEtfjrSaazN2SCDqfXdZ0tlIPt1XPS8o8MxueObtOb/TInWb
         pb/7VWLyTtpuh9unIBoMahXpvskKaetCtBFd0yc5ewdrQwXv9f3tSYD455+6u1iaFVcK
         zN0jp/jC9hhGb021140NV8+BtqhgGC7WvooQtxw3xxfGYWDQQPOFFbVMMR2Ip4QrhoaK
         HW7NT0XxvhmdmV1CAl7zMdOyEBLJhJb0MSBWvWgkONNeLvcvPHJzo9C4kS4ODD2CiSrA
         fFm0h0meC8HPzYW10zCdrc8tYlKEVu3fpRsTc4S//JsmcFPfT0VHbTJvXg2FMIAombPS
         wWiQ==
X-Gm-Message-State: AOAM533yqrgZ3L6aTh/OJ9AGBvAIJZn4dujaF16qtlvKS9QPASm9zSyx
	k2y39Xgx7xSCQBnr3fYwrLs=
X-Google-Smtp-Source: ABdhPJz/gT5Fo9YL0MwSmnrnI/72eanUIZOjhPD1526Q0DGyNzM7YsgkGbfT6IvzkwwBfdSCuUpx+A==
X-Received: by 2002:adf:d091:: with SMTP id y17mr33071352wrh.418.1637261255043;
        Thu, 18 Nov 2021 10:47:35 -0800 (PST)
Message-ID: <87ea9d01-8da1-52d9-1f72-48f417d9f164@gmail.com>
Date: Thu, 18 Nov 2021 18:47:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 2/3] x86/Viridian: drop dead variable updates
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
References: <c8e8767b-111c-5eec-15c4-a7cb60a99283@suse.com>
 <ae2fa743-da2b-91a8-908f-b0c7bb006fd0@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <ae2fa743-da2b-91a8-908f-b0c7bb006fd0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2021 13:14, Jan Beulich wrote:
> Both hvcall_flush_ex() and hvcall_ipi_ex() update "size" without
> subsequently using the value; future compilers may warn about such.
> Alongside dropping the updates, shrink the variables' scopes to
> demonstrate that there are no outer scope uses.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

