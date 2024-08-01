Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335E6944FAA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 17:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769830.1180708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZY5r-0006Un-Ok; Thu, 01 Aug 2024 15:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769830.1180708; Thu, 01 Aug 2024 15:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZY5r-0006S7-Ky; Thu, 01 Aug 2024 15:51:55 +0000
Received: by outflank-mailman (input) for mailman id 769830;
 Thu, 01 Aug 2024 15:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8r7L=PA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZY5p-0006S1-CA
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 15:51:53 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f80fed00-501d-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 17:51:52 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6bb5a4668faso36447616d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 08:51:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8d83e1sm86010026d6.5.2024.08.01.08.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 08:51:50 -0700 (PDT)
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
X-Inumbo-ID: f80fed00-501d-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722527511; x=1723132311; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JDQZ8WqSBI4W95dOyPXKx4pNF6iHdRh2AldArtD2L7c=;
        b=JUlbcWvhNAuOYrEYPd3UK8V2BeqWij1jA3nl+1neCrllzUwtxX/mkB68vcZwvsfs5M
         Q3AMjtjUWYoCd2mrB6OJXt6OGrWcSHWSdCkfoetlbAgEwaGq1jJtgXXiAmoW4uiS2PIb
         5e0kEfTJodki4Qp9R60i5jAritcrdht4QsFeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527511; x=1723132311;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDQZ8WqSBI4W95dOyPXKx4pNF6iHdRh2AldArtD2L7c=;
        b=twAOvs7ORErUMqBFPftkiCG9d0kS4aqvCzI7+f3sZE4b3lzB/GuNlD5KG4LDjEjeTF
         XjkOA9JKSbOEM94qhhIBxr0Vmj0nZUeDqy/mtWuJ8A4ytbxBYKYKZ4na175/KreSHgxU
         qukN5MRw6Wwp2U2iWtIJBNe8y+Vt+bX4evg/bV4h7jbCIX0Phve9VvZ0gSoLYYpEb5GQ
         4/fOm5/bqbww15XeIatCJ6hRheWxORIzsWRmSwjbRA5n/r1dwGoJI12ha7mQAM88V5/g
         znyX9eU1HT8ix8Qes/XIfSErTOb+5AffYjGUXHIUo0MErRQyMHXE5jcuwfEhtzrh23ld
         qyfQ==
X-Gm-Message-State: AOJu0YzfqeM60tr+iwuMMuQysxooNxhmyPbz8qlN6t8BpWYLT4dYkUl4
	fmVLHlnh/GGZO0R3POfIs3k6yvFjEjaWrg5B1TwMuDt4taxrfYSqWMt3H94KieQ=
X-Google-Smtp-Source: AGHT+IFFOt4HNiVabyoR1/B3ujy2ZqsSVM91Cco8Pyik4br4E8ycHhvH7yB6BDl1YYlLgbV+wEHthw==
X-Received: by 2002:a05:6214:390a:b0:6b5:683:df5e with SMTP id 6a1803df08f44-6bb9839e050mr5670406d6.32.1722527511190;
        Thu, 01 Aug 2024 08:51:51 -0700 (PDT)
Date: Thu, 1 Aug 2024 17:51:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Subject: Re: [PATCH] x86: drop Xeon Phi support
Message-ID: <ZquvFfd0kr0oL1eW@macbook>
References: <44147507-65a4-4f21-aada-fa647f53ffd0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44147507-65a4-4f21-aada-fa647f53ffd0@suse.com>

On Tue, Jul 30, 2024 at 01:07:03PM +0200, Jan Beulich wrote:
> Do as was decided in Lisbon. Reportedly Xen hasn't been working very
> well on those processors anyway.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Is there any chance of the Xeon Phi AVX512 extensions returning on
other processors?

Thanks, Roger.

