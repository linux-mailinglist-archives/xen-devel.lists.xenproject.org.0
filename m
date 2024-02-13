Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16D853811
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 18:32:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680106.1057970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwdV-0005cA-Tk; Tue, 13 Feb 2024 17:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680106.1057970; Tue, 13 Feb 2024 17:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZwdV-0005Zs-R3; Tue, 13 Feb 2024 17:32:01 +0000
Received: by outflank-mailman (input) for mailman id 680106;
 Tue, 13 Feb 2024 17:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZwdU-0005Zk-D0
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 17:32:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9e646b3-ca95-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 18:31:58 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a28a6cef709so626183966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 09:31:58 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 s7-20020a17090699c700b00a3cb136aef0sm1477683ejn.224.2024.02.13.09.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:31:57 -0800 (PST)
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
X-Inumbo-ID: c9e646b3-ca95-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707845518; x=1708450318; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jadmpGMsfnY6CDwqqwa7KbW7cyrm8fvm/Nnghv6GeuQ=;
        b=TtnlSpui+615qs+RhHELJPKRt8w2rfue8/50mzClIBdrvbeapiLsu7yXAytXJK6Awc
         YCdyO5UNaj6S5O45aUUvN6XkqKI2cCRc6UoaPNNn9ZS+GW+DCNAiyanNTPr5tUrU/1zE
         xPzV7RjvsEaJRqePVxmMg9Mm28bPmpSbIBHOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707845518; x=1708450318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jadmpGMsfnY6CDwqqwa7KbW7cyrm8fvm/Nnghv6GeuQ=;
        b=KXRZ+iPLapZoB4y51DOherKBNfNh0fMRMi1L+7/sUJguCuBpq8hws1kobe5HnZtBqK
         Hgf2S9e3NCzHth5KeZcIaopJUofU5B59KIXzlOSGyldVeWKs3xl5M65pIvS8S6WtJ469
         5Ql9eNHAHEq+bRqq2vJX2nGcAmK/095r3oqxmQyzZQlkP/X07YMibvIoMVnpei5WaFqg
         8Z6GQUUA7FlGKLZ2CF21FlCSs4746htoDA2EYC3wo5B/2L4WEcoNyvjn+g8jTrNJhl+4
         U/2A+EyakOZvMjTIVdm53orCCssjNClxujLckqpKST7FfoAEJ8PevcCyEBbvehhUopHJ
         UCjw==
X-Gm-Message-State: AOJu0YxCTP98lCCK6vMyNmsntURkooQ8ubhBH8bcCeWStptC7rPz/SA/
	maUV+hy1HhjzGPFWecZVZw+0rGwKPosvzH7pZIhH/nlpPEmjH+wYZaXKqzDE3Gs=
X-Google-Smtp-Source: AGHT+IFwvSL7a+s1VENs5br/aOQ+1YbL9bztJ0i7nbmvlFiQMdqFGZZhncRXvN7r64w7a6hXxX6WgQ==
X-Received: by 2002:a17:906:1c0b:b0:a3c:8f4c:b1d with SMTP id k11-20020a1709061c0b00b00a3c8f4c0b1dmr5284ejg.63.1707845517876;
        Tue, 13 Feb 2024 09:31:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkbJvurJ1HMNuLQ77BBU8gUccyON2xQeCW9LRCXgZJ1/8VnAaBF8v74VOYN3h+VmgLSoUYzo5Ra/mpuQnLjyAO99WrcrjIHuxdRup83IfXitaAixuz
Date: Tue, 13 Feb 2024 17:31:57 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 01/22] tools: add access macros for unaligned data
Message-ID: <92250210-dede-44be-81ce-3db2bcb5b04a@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208165546.5715-2-jgross@suse.com>

On Thu, Feb 08, 2024 at 05:55:25PM +0100, Juergen Gross wrote:
> Add the basic access macros for unaligned data to common-macros.h.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

