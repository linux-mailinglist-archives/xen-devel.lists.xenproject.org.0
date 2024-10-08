Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE69994329
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:00:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812896.1225635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy64x-0007nr-T1; Tue, 08 Oct 2024 09:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812896.1225635; Tue, 08 Oct 2024 09:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy64x-0007ke-P6; Tue, 08 Oct 2024 09:00:27 +0000
Received: by outflank-mailman (input) for mailman id 812896;
 Tue, 08 Oct 2024 09:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/rYz=RE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sy64w-0007kY-Qc
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:00:26 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c12aeeea-8553-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 11:00:24 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a995ec65c35so258031966b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 02:00:24 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9950077d1asm277538866b.57.2024.10.08.02.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 02:00:23 -0700 (PDT)
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
X-Inumbo-ID: c12aeeea-8553-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728378023; x=1728982823; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXt9TcgzVC1/+dbwowjKde6qB7q/2kyxwWW4B7x43KI=;
        b=F3Bv/ttZAmSG5Hic6OrYcowpbtqOM5UK5aLoDkajaEyP95v4jVpQxo7O/WyOGzqQUm
         yzTHznn6rxmdSaAJenalf4InYbJ3ei/j2kmSpPSuXPd9Hcx88jbQmZdFAUdNjmJfhfbT
         jgS7KeRS7KY9gTBk4M1CI1eaT2XfXq2g7J6wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378023; x=1728982823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXt9TcgzVC1/+dbwowjKde6qB7q/2kyxwWW4B7x43KI=;
        b=cF1AHplZ5r+bMJK2QJJu+/FKIe3HxvfsLI2H+VS3Jq3JwxKtocRcEuGv659KeI3mLN
         GW8abYvB9g8iZ+kEWhnwzeupZdHDumniRJEaJg0Ih1KLZrN5oigXJxQken28Uqqx01fB
         hxx2Au7WENVDpgsc3eaSKNrEnQ+i/6gidRHK3GzmBs+b1vFuSa86SZD/ZHpcvup6voRs
         e6GQTG71chYfSqzHLCxYMWuJZIQg3kI+ZwGUJsCiFekFBk3Wz/67ujN/0yPWPfFQAvbK
         aedpQ+6t55vriy0kTbIh4eJuruMJkFa9Q27iLDBEW1C31OgSxEgFAOWT/dgKxIIly+gF
         gQ5g==
X-Gm-Message-State: AOJu0YxeDVfjaxB2RAPRVGum4R0ftKge9Mw59N2YmCcdI/behs0mZr8Y
	iEzwugbfBcSFVscNBQklC7jpx3XgLShg+ZvFbX6QBjM9IImOyRbx/qZC15SWn3NBFtNDlJ7sZwL
	L
X-Google-Smtp-Source: AGHT+IErC76okJMwfJUh38lSIg1K0pHNBMbuYMSsK7ChmoZSRiMi0FR8zGn0npimPpLuQuypugOH0g==
X-Received: by 2002:a17:907:6d25:b0:a99:5c07:9f5b with SMTP id a640c23a62f3a-a996785140cmr246902566b.6.1728378023379;
        Tue, 08 Oct 2024 02:00:23 -0700 (PDT)
Date: Tue, 8 Oct 2024 11:00:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/msr: add log messages to MSR state load error
 paths
Message-ID: <ZwT0psBW-yC_KFKQ@macbook.local>
References: <20241008083756.72829-1-roger.pau@citrix.com>
 <20241008083756.72829-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241008083756.72829-2-roger.pau@citrix.com>

I've wrongly send this together with "x86/domctl: fix maximum number
of MSRs in XEN_DOMCTL_{get,set}_vcpu_msrs".  There's a separate email
with just "[PATCH v2] x86/msr: add log messages to MSR state load
error paths".  Both have the same contents.

Roger.

