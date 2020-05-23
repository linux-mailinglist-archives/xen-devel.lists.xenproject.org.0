Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1481DF847
	for <lists+xen-devel@lfdr.de>; Sat, 23 May 2020 18:40:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcXC8-0000qP-HN; Sat, 23 May 2020 16:40:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9iM=7F=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jcXC7-0000qK-2t
 for xen-devel@lists.xenproject.org; Sat, 23 May 2020 16:40:19 +0000
X-Inumbo-ID: 15ba66a4-9d14-11ea-b9cf-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15ba66a4-9d14-11ea-b9cf-bc764e2007e4;
 Sat, 23 May 2020 16:40:18 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c11so14166867ljn.2
 for <xen-devel@lists.xenproject.org>; Sat, 23 May 2020 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S0SOyc3LUuwBwXHuqtQ2x6cooeUtHm7VNacfs/Maa3Y=;
 b=gl3Nl6ssvtIxTPPjGJrOLVf2t1xQzGYlIQ7eo8C12NP8MLj7RWG2p3Wfl5sEloJbHg
 //xEI7JSxrcD5IJsjkexYOKpAdOF1EWyyjQIKLGUh9rTjiyX9mkSz4/zpFp6VZUuOygd
 emfZMvi7xlxObeD2KZu7HIU+dBOWQalvCqW3f3+mAtcyHF2SqZI/Dei3ZYJXHYLOMzAp
 VySCt4r2+OHyVRM3zExT/9lvim6DtNDNZ9hdSkVT9FmeN59OFKopbdAHtvUdvxHR5Lgv
 xRsOLt2NZqk1zYrlLvtZeoxDTyGQmwmlCqrU/h0z6j0Nwg2zDQdSyu2UXXJ3mpL5fPuM
 d10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S0SOyc3LUuwBwXHuqtQ2x6cooeUtHm7VNacfs/Maa3Y=;
 b=RqVWTBncqeD5LudBKJ6gpQ95R7zSppLjzarB2ZtqZEhfkGa7VJDmTkaHOvRcv5JRMb
 88W2oBN7gS9k/1iMUhyTMVJVuX5NSyaujY4WJ5coc6tGLqj3+H4U9W6kIoTmAjGPEGmh
 ATkBdav2PiZM7/rAKNcL3iX1KTLuvRYIBWJ2jq0r3RPKG1C3AhWbcoEl93uf3jhTbe7t
 4kdO/20M9QQ3TYhWLrSMIyE4ti18GJS1ftfw9F0YIhlXTqACIf1bXTXT7amehARl83bZ
 pnpGFb0kEwfpw40TLtYSedg5tvnRgXMSncLiYvGqr6C889OdTHeBa3g2raK2wZksf0gS
 fjHw==
X-Gm-Message-State: AOAM533rmvRWlbxQfTB82l+VHJsIHDImv5xCYUubljB7J48tSO+Ozsqu
 7C3gZ04GOwxXRFampkEm6DsthHAOtLqwiF6dnoI=
X-Google-Smtp-Source: ABdhPJxKYpHH4rv5m3lZYg3OgdevtCHi/6a+G5R0tBgusZ1Vo76R025KyzHpupJzgwy8cbdi8zDzwG51iqDGb+y72Nc=
X-Received: by 2002:a05:651c:1208:: with SMTP id
 i8mr6567289lja.103.1590252017364; 
 Sat, 23 May 2020 09:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-5-george.dunlap@citrix.com>
In-Reply-To: <20200522161240.3748320-5-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 23 May 2020 12:40:06 -0400
Message-ID: <CAEBZRSfF8KAnzz5LW8GhcuJu=2rex3d6bvgz=a7-kLMp-itjqQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] golang/xenlight: Use XEN_PKG_DIR variable rather than
 open-coding
To: George Dunlap <george.dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>

