Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DFA2F9C89
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 11:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69562.124597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rsw-0005Lg-E5; Mon, 18 Jan 2021 10:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69562.124597; Mon, 18 Jan 2021 10:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rsw-0005LH-AZ; Mon, 18 Jan 2021 10:35:46 +0000
Received: by outflank-mailman (input) for mailman id 69562;
 Mon, 18 Jan 2021 10:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Rsu-0005Kp-Sl
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:35:44 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e4535b5-366e-4425-9695-dd60d8a77f30;
 Mon, 18 Jan 2021 10:35:44 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i63so13115911wma.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:35:44 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id c20sm24821042wmb.38.2021.01.18.02.35.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:35:42 -0800 (PST)
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
X-Inumbo-ID: 9e4535b5-366e-4425-9695-dd60d8a77f30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=sdjxudr61Uts0CJPUO0ptlpFH4t8XuWtSUvltKTeu/w=;
        b=KiBcLdjEMeNXY6KCVUy9KRQrCd+oQFLbB8a3RL9tPKbShfiAw3dOZvnaApZc3dpfwI
         b0pennEhFkL1nsy15iWZ2iz2UIp+DHObfbhe6zVSAVDs4/KMzDF0cGuA41lPvDwciD+R
         TDRimv/OgoK44kz8gu94/SvN/OY6w1CnHk+BsXG3puZ+B+BiHlsnk1KYhmn937QV6ALp
         r1qIer2QAB3dCrH3bTOGCDpmfm8v3PXOCS2ZdP+sBMZHNWQOt/TqSjobwjAigVsImaup
         I8lHibktyhqQM9gC8bT/zQg/4yCPUx/kEiqqEt9h1tnyKhYdLOb1ukuZNAJjwWKBr4Qu
         +Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=sdjxudr61Uts0CJPUO0ptlpFH4t8XuWtSUvltKTeu/w=;
        b=cuuOvcj38E8VHX+G5kbMGJyM4UqTFtb+2KxbZ7IEYOdIXBwOm7DrC44E/6pIjiLxv1
         JT6EWXT+mnGzxxIygOoZLRd2PDUUs0C0NJVi3CtLQHNfvW/YwfVoBcHX5B+EjszwgXch
         OluZ3m8Kw5Ja3Fas9Rzc1jEJqcoPoT9Z+UhPVY2Ij2jCB5DcnswzUi5nXzrqV3/550GQ
         20pIeRDEnGLSqLyxClc9/o2Obj1FQSTT6gkLORyJcYIS9wHhFgpyU10UCDWGqMBATtuZ
         nNpv9H09JKeZVlSMyHcfmHqcL0aY5F3K279XRNso286troaXSqZWhCyc4ldUAiXgD5D3
         ywug==
X-Gm-Message-State: AOAM533lBJ5e5TPHEYr/ULvNYTP5g/lMxo8rczuvbyLuOF2JPEIQwVpL
	sybq+ODj5iLfOJm69AvJarg=
X-Google-Smtp-Source: ABdhPJzC0Mvm9IJPrgzjYLI8UEjrhypmUYqZAuikpTgtyFJQL6Un9LpHRADBfIEfqUSzBjI2HuL3Qg==
X-Received: by 2002:a05:600c:19cc:: with SMTP id u12mr19675937wmq.26.1610966143356;
        Mon, 18 Jan 2021 02:35:43 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Lee Jones'" <lee.jones@linaro.org>
Cc: <linux-kernel@vger.kernel.org>,
	"'Wei Liu'" <wei.liu@kernel.org>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	"'Alexei Starovoitov'" <ast@kernel.org>,
	"'Daniel Borkmann'" <daniel@iogearbox.net>,
	"'Jesper Dangaard Brouer'" <hawk@kernel.org>,
	"'John Fastabend'" <john.fastabend@gmail.com>,
	"'Rusty Russell'" <rusty@rustcorp.com.au>,
	<xen-devel@lists.xenproject.org>,
	<netdev@vger.kernel.org>,
	<bpf@vger.kernel.org>,
	"'Andrew Lunn'" <andrew@lunn.ch>
References: <20210115200905.3470941-1-lee.jones@linaro.org> <20210115200905.3470941-3-lee.jones@linaro.org>
In-Reply-To: <20210115200905.3470941-3-lee.jones@linaro.org>
Subject: RE: [PATCH 2/7] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
Date: Mon, 18 Jan 2021 10:35:41 -0000
Message-ID: <00d601d6ed85$ac1d8f60$0458ae20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGx99OgEkOz45dOTqKA2L+6769RlgFYXaBkqmxYlxA=
Content-Language: en-gb

> -----Original Message-----
> From: Lee Jones <lee.jones@linaro.org>
> Sent: 15 January 2021 20:09
> To: lee.jones@linaro.org
> Cc: linux-kernel@vger.kernel.org; Wei Liu <wei.liu@kernel.org>; Paul Durrant <paul@xen.org>; David S.
> Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Alexei Starovoitov <ast@kernel.org>;
> Daniel Borkmann <daniel@iogearbox.net>; Jesper Dangaard Brouer <hawk@kernel.org>; John Fastabend
> <john.fastabend@gmail.com>; Rusty Russell <rusty@rustcorp.com.au>; xen-devel@lists.xenproject.org;
> netdev@vger.kernel.org; bpf@vger.kernel.org; Andrew Lunn <andrew@lunn.ch>
> Subject: [PATCH 2/7] net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'dev' not described in
> 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:419: warning: Function parameter or member 'frontend_state' not
> described in 'frontend_changed'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'dev' not described in
> 'netback_probe'
>  drivers/net/xen-netback/xenbus.c:1001: warning: Function parameter or member 'id' not described in
> 'netback_probe'
> 
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Paul Durrant <paul@xen.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: Jesper Dangaard Brouer <hawk@kernel.org>
> Cc: John Fastabend <john.fastabend@gmail.com>
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> Cc: xen-devel@lists.xenproject.org
> Cc: netdev@vger.kernel.org
> Cc: bpf@vger.kernel.org
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Paul Durrant <paul@xen.org>


