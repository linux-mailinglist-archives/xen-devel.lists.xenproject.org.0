Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7163E1B04FE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 10:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQSGG-0000SI-Pt; Mon, 20 Apr 2020 08:58:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UDoD=6E=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jQSGF-0000SD-EK
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 08:58:39 +0000
X-Inumbo-ID: 1fc90c5c-82e5-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fc90c5c-82e5-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 08:58:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w2so6739798edx.4
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=l12LqyTH4YgL3udx+mMMxH3mer6k55ySqu3cyDYdhec=;
 b=Qjx8Z0Ed/kKdXep5rDdvFhr5KVGQog4BiWtrplRP6hSSskyzCXPWh0sTr+5Pl3MOKW
 ot1j5t9vUjdC0xTr8FtSt3a6gMHp2ZK/lgqqQrWc3Tl8GaQ5jnu4b2zKzyGNLQ+zo+Si
 gELZtGQTjhMNVtGgM8fHjEtyd2YvM7QfwVBVm9JFk4aenWBS5GwmmoSHSAzXnGwnYk9V
 e+7sWwg19gPqG43omTfeUJG0GSTPj1tkb/ATOvzk3I40JxqseDUZ8F8I5WZpP07IYKAw
 8ujUjxBCyM9jH1e08GsCk6PBoTzW/YI9MNngOH7sOudKp5IhcLccjUg3RvQAu/dj0jLf
 mYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=l12LqyTH4YgL3udx+mMMxH3mer6k55ySqu3cyDYdhec=;
 b=XeZvYIbe3gE6E5YpUwTJUILEaqu1An/uOR3z4FInJmFSl0ad7stfrAmHMudc1PALD5
 aJCEo0Otkle6EG2lB/ISr7lWy4F7aTW8eesOvNcHJIen/bgTqwrI2SMrZjc1F9QvrQNM
 ntvC6hS7sGoi5Val9Dv2OKchXiNOdepCPxRTmp6cef+ORengWHHRZI7Set/di1gfxTeZ
 nEaJT0/fJLfD0MZ9RdG++RgnWGWmbhsR52AXm/K+iJK4nLWSf0FlWRYjm+dbk4c9XoSl
 bYvAWlw+XPLB9JM9PhfpiY8jjXqn5RuFQRe6jr25j5VFi2NE/Bf/obGMNTUzLIkwbtft
 Un2A==
X-Gm-Message-State: AGi0PubFpsVHi680wGUUCVHzUQ2G3hdPAL9LzbYmKGpx2SgQ1zKFSfMV
 WplED/jq0smf6U4BFEr9p44=
X-Google-Smtp-Source: APiQypIKPCo2plSHpjjzSAMNGT9aA4e3L7shMprjSVglVHH/8jSrvmcyN8rO+29d1JFDuoXpyr19cQ==
X-Received: by 2002:a05:6402:310b:: with SMTP id
 dc11mr12798473edb.143.1587373117743; 
 Mon, 20 Apr 2020 01:58:37 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id dm15sm21184edb.84.2020.04.20.01.58.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 01:58:37 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Markus Armbruster'" <armbru@redhat.com>,
	<qemu-devel@nongnu.org>
References: <20200420083236.19309-1-armbru@redhat.com>
 <20200420083236.19309-10-armbru@redhat.com>
In-Reply-To: <20200420083236.19309-10-armbru@redhat.com>
Subject: RE: [PATCH 09/11] xen/pt: Fix flawed conversion to realize()
Date: Mon, 20 Apr 2020 09:58:35 +0100
Message-ID: <002201d616f1$e1057910$a3106b30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIW6PbL/TFzdKd45gQwHtYhr73cEQJR6tGlp+2CVEA=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Anthony Perard' <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, 'Stefano Stabellini' <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: 20 April 2020 09:33
> To: qemu-devel@nongnu.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Subject: [PATCH 09/11] xen/pt: Fix flawed conversion to realize()
> 
> The conversion of xen_pt_initfn() to xen_pt_realize() blindly replaced
> XEN_PT_ERR() by error_setg().  Several error conditions that did not
> fail xen_pt_initfn() now fail xen_pt_realize().  Unsurprisingly, the
> cleanup on these errors looks highly suspicious.
> 
> Revert the inappropriate replacements.
> 
> Fixes: 5a11d0f7549e24a10e178a9dc8ff5e698031d9a6
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Paul Durrant <paul@xen.org>


