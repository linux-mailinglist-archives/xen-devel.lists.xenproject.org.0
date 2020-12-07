Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA842D14BE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:32:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46737.82846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIUc-0003dA-F6; Mon, 07 Dec 2020 15:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46737.82846; Mon, 07 Dec 2020 15:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIUc-0003cl-Bf; Mon, 07 Dec 2020 15:32:02 +0000
Received: by outflank-mailman (input) for mailman id 46737;
 Mon, 07 Dec 2020 15:32:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN+h=FL=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kmIUa-0003cg-Ue
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:32:00 +0000
Received: from mail-wm1-f43.google.com (unknown [209.85.128.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b288b6e-e77f-4fcb-9f1b-d16ab521d9ec;
 Mon, 07 Dec 2020 15:32:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id a6so11809337wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:32:00 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m8sm14868395wmc.27.2020.12.07.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 07:31:58 -0800 (PST)
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
X-Inumbo-ID: 7b288b6e-e77f-4fcb-9f1b-d16ab521d9ec
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YBdYUAxEtU8X88CPXHzOic1oxoW8h4pv5pGl9fOdRuU=;
        b=rEVQphKYEY/zdArkXF0EKrDEPPg7T44SES4ek2irU0rMGfZd/xsMMkbUNNYnAPa/Wc
         iLuBld8D7p+V7EWJz9joz1F+MKFGJcvg1apffzEnZPWuW2X9JYy2AIZzMXMgA3lozSu6
         XJ3RZQnWrVPpTWrLNoz2MpjiAMVjQRd+Nyz4CkRUY+KdB7qZyUfmJO5yLlOBAq9TPRsc
         wmi5orF9GDsSCyth1dR6wr6AX3u/3kFXvZ+WHcq35f3dpyHHDyIA4GwMdcfHDzFZvYGZ
         eiW9ghMlyw3R3vcUgN7/9OtklvRheF0J6EjPHPy6QHq9oByzgzvvMjjBNHXqB028DSJK
         TduQ==
X-Gm-Message-State: AOAM531xy7ujyS4T58TnjR36pes1Mb/qnqqkht/cfdb3sZbIHvn3hMfW
	9NxI7y0bw82O3SLHPJ/2CHk=
X-Google-Smtp-Source: ABdhPJwoqYY+70wdFf4jeJGI9vENM16yvaSQTihIN3pxt71zU9sjwyvivqufcH2VA1Gj5McQpDgxYg==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr10360248wmj.168.1607355119285;
        Mon, 07 Dec 2020 07:31:59 -0800 (PST)
Date: Mon, 7 Dec 2020 15:31:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Olaf Hering <olaf@aepfle.de>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Ping: [PATCH] libxenstat: avoid build race
Message-ID: <20201207153156.roxlvr5tcy7gkh2c@liuwe-devbox-debian-v2>
References: <273da46e-2a56-f53c-f137-f6fc411ad8db@suse.com>
 <6CDFEFFF-368E-467B-970A-4CDFA7978A2E@arm.com>
 <f2b92ab9-5bc2-79f8-8c28-2cf5d17f49e2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b92ab9-5bc2-79f8-8c28-2cf5d17f49e2@suse.com>
User-Agent: NeoMutt/20180716

On Mon, Dec 07, 2020 at 04:25:41PM +0100, Jan Beulich wrote:
> On 18.11.2020 15:27, Bertrand Marquis wrote:
> >> On 17 Nov 2020, at 09:42, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> Olaf reported observing
> >>
> >> xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or directory
> >> .../tools/libs/stat/../../../tools/Rules.mk:153: xenstat_qmp.opic] Error 1
> >>
> >> Obviously _paths.h, when included by any of the sources, needs to be
> >> created in advance of compiling any of them, not just the non-PIC ones.
> >>
> >> Reported-by: Olaf Hering <olaf@aepfle.de>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Ping? (I guess this one is again simple enough that I should
> time out waiting by the middle of the week.)

Acked-by: Wei Liu <wl@xen.org>

