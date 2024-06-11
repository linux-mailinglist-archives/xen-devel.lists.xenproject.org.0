Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C91903C8F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 14:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738380.1145128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH162-0004MZ-94; Tue, 11 Jun 2024 12:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738380.1145128; Tue, 11 Jun 2024 12:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH162-0004Kw-66; Tue, 11 Jun 2024 12:59:30 +0000
Received: by outflank-mailman (input) for mailman id 738380;
 Tue, 11 Jun 2024 12:59:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b7dS=NN=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sH160-0004Jz-SW
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 12:59:28 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eb0a908-27f2-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 14:59:27 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-441187684e3so9783971cf.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 05:59:27 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4405526e8c0sm32519421cf.60.2024.06.11.05.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 05:59:25 -0700 (PDT)
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
X-Inumbo-ID: 6eb0a908-27f2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718110766; x=1718715566; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NeDnhCiELrWayyc5wgOeORcf9fnb1qKshODJE+9tPoU=;
        b=VVm4duaYDr61tCDBXaQnpPRG1WPTnqpo3lUkCr5ZwIA+L//qO/H5XAtNde3I/dCD6G
         G4KQw5DaAyBBlMBsCI2lAaUJPQ41DbDjtmi29OxVLxXA68+1FGw9kXIqaVz5KZwcL7gR
         tfI+lZErQmRdiF9TkbHCr94+B3VuEL1B0S5NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718110766; x=1718715566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeDnhCiELrWayyc5wgOeORcf9fnb1qKshODJE+9tPoU=;
        b=ca4nwFgobX6iKIFqflgOJnL+1/iD8e9VZ/G4Suq89Zu5uqJjsEO47bVA2KFEQnhsCh
         TvpLc/u2PZNFAL4LDnhZYgHTqPJTUlR/0VOm/AkcioQXP58vDU69p+aPuiq9yHCQ3ClO
         s6elmIFTmRon6INh64+HZKZ3LVbems2MWt8na81dYvHqvzGL+zOjB2TkWTt7WhDDbq9d
         eyF26lEQRVp04hHQnazyPng6FSsyKD/oR1uriQAgf17+PyOg4PdGpVDPMnDApQngVNwv
         ukFxS2LgloTiDEEvceZMI7d796Fq1TGsqXSev7sF+QL6KWfxwoABhZTlJFYz9X/ETdU8
         eTEg==
X-Gm-Message-State: AOJu0YziICKATRUHTLlzMmzggjodl3zFeipYDoTmYg+UYjPowWs0VgHE
	uf46ZLeBFLK3CiGq8ZY0trTIwcsAUiCFau1VeoixTVkKrTivAmknvpzqjWpMCu8=
X-Google-Smtp-Source: AGHT+IHC1Syrj91mHBha1zW1XO2xFlbCM5t6doUp2botDMKLCRw9WrurjwazkXjhc6YXSNejy+XVzQ==
X-Received: by 2002:a05:622a:188b:b0:440:891c:4022 with SMTP id d75a77b69052e-440891c412emr47598671cf.7.1718110765863;
        Tue, 11 Jun 2024 05:59:25 -0700 (PDT)
Date: Tue, 11 Jun 2024 14:59:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH for-4.19] CI: Update FreeBSD to 13.3
Message-ID: <ZmhKK4PcLki8EVST@macbook>
References: <20240611124701.802752-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240611124701.802752-1-andrew.cooper3@citrix.com>

On Tue, Jun 11, 2024 at 01:47:01PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I'm unsure if that's some kind of glitch or error on the
FreeBSD side.  13.2 is not EOL until June 30, 2024 [0].

Thanks, Roger.

[0] https://www.freebsd.org/security/#sup

