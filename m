Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2430EEB8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 09:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81180.149497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aGI-0001as-AF; Thu, 04 Feb 2021 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81180.149497; Thu, 04 Feb 2021 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7aGI-0001aT-6b; Thu, 04 Feb 2021 08:45:14 +0000
Received: by outflank-mailman (input) for mailman id 81180;
 Thu, 04 Feb 2021 08:45:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SI1E=HG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l7aGG-0001aO-Lh
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 08:45:12 +0000
Received: from mail-wr1-x431.google.com (unknown [2a00:1450:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ba4fb6e-db36-4ec8-b43a-72aad967e217;
 Thu, 04 Feb 2021 08:45:11 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id c12so2458370wrc.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 00:45:11 -0800 (PST)
Received: from CBGR90WXYV0 (host86-190-149-163.range86-190.btcentralplus.com.
 [86.190.149.163])
 by smtp.gmail.com with ESMTPSA id q9sm6050638wme.18.2021.02.04.00.45.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Feb 2021 00:45:10 -0800 (PST)
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
X-Inumbo-ID: 5ba4fb6e-db36-4ec8-b43a-72aad967e217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=mg7W0VLw0FK4HNewxQamfD32hSX90m7wUkSk0nDAHMY=;
        b=IuGP2Uj2Kw+lpz2wE7Ay44A6PGGuhRjkQlQ1eA/TZFGLycY60Gz8+EZQzEsZ/whyvl
         rnw0HUr2RoE5bYhGKddYKOSNV8STqa+parCcrasVmaGl/jLERAvyRMBLXX767rBp0oay
         /NiYxiyuJwmUddcQflYhSjDrfkEtiMAs5CUBnp5R/SY2iVYzO+dER17CeZUxINEkdj9s
         QCUUOabRb0ZCKaMF+Xxpqvxcs6jbc6M59MYOlkMJ6gBVJF3Bx7WBgQyFpjs5OuIkt2s0
         fJ+z0kvnTo1BZbK2DgZ0gFvYTReqUk3+K0F9k/NfTTPEE226CxcOYqMDVwVO75zPHUcj
         QtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=mg7W0VLw0FK4HNewxQamfD32hSX90m7wUkSk0nDAHMY=;
        b=DA/CXQ7UKbcrweECCMOs1jMYqOT/4GaR0Ye6+9JNIMCl3qoXYAcNL08Iis4zZeIbka
         vfm+EUD6shnLdCoiuZkgXKVPuLEOQfpXqMwCJBoj38CiW0FL2vFq+QMABt/I5fpAsjZ5
         ffyjoggzhWgJiL3JiqkUWZlOqtLairHnSZpkATxN5mOv5t51MhNZU6ucgecQBDn6YXGG
         01clMVjlHcI/ymtPp1PDxUPyFjOgTxlW8Dij0d3rBr7ggUzk88bq1PCNeGBjYabSjmaA
         aQydf2arrgV/Q71EqZ3zyaalMP9Ts/0yCHLVy5O5XxWWD7a957qqMw00uke6unHbLgHE
         bN7g==
X-Gm-Message-State: AOAM5333ESPOQijWD1ef5QVK/2CfD4e0PM+hioMVtU7xBWgLoAPby+wD
	5swg7P+oZYpXeTO7I+V02jE=
X-Google-Smtp-Source: ABdhPJzHeeEWrCe/8QCs9u/g9R21SuE0grv7LBCKKxSSdLPWkozsnpZRxQ7oLr+VvNmZDDsv7xkQqw==
X-Received: by 2002:a5d:6686:: with SMTP id l6mr7976648wru.236.1612428311037;
        Thu, 04 Feb 2021 00:45:11 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'George Dunlap'" <george.dunlap@citrix.com>
References: <0e7265fe-8d89-facb-790d-9232c742c3fa@suse.com> <3365a9a1-92c0-8917-1632-b88f1c055392@suse.com>
In-Reply-To: <3365a9a1-92c0-8917-1632-b88f1c055392@suse.com>
Subject: RE: [PATCH v2 1/2] IOREQ: fix waiting for broadcast completion
Date: Thu, 4 Feb 2021 08:45:09 -0000
Message-ID: <03f401d6fad2$0bbb9fd0$2332df70$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHgg/zPp1o/mkuzupLKGuAOuFa3bwFnX6eiqilg1nA=
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 02 February 2021 15:14
> To: xen-devel@lists.xenproject.org
> Cc: Paul Durrant <paul@xen.org>; George Dunlap <george.dunlap@citrix.com>
> Subject: [PATCH v2 1/2] IOREQ: fix waiting for broadcast completion
> 
> Checking just a single server is not enough - all of them must have
> signaled that they're done processing the request.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
> v2: New.
> 
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -213,9 +213,9 @@ bool vcpu_ioreq_handle_completion(struct
>          return false;
>      }
> 
> -    sv = get_pending_vcpu(v, &s);
> -    if ( sv && !wait_for_io(sv, get_ioreq(s, v)) )
> -        return false;
> +    while ( (sv = get_pending_vcpu(v, &s)) != NULL )
> +        if ( !wait_for_io(sv, get_ioreq(s, v)) )
> +            return false;
> 
>      vio->req.state = ioreq_needs_completion(&vio->req) ?
>          STATE_IORESP_READY : STATE_IOREQ_NONE;



