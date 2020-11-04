Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7057B2A5FA1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 09:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18874.43929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEBf-0002mA-Qn; Wed, 04 Nov 2020 08:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18874.43929; Wed, 04 Nov 2020 08:30:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaEBf-0002ll-No; Wed, 04 Nov 2020 08:30:35 +0000
Received: by outflank-mailman (input) for mailman id 18874;
 Wed, 04 Nov 2020 08:30:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAD3=EK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kaEBe-0002lf-7y
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:30:34 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb438fa4-13c4-400d-b703-5cf733429253;
 Wed, 04 Nov 2020 08:30:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x7so21098042wrl.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:30:33 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id x81sm1454581wmg.5.2020.11.04.00.30.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Nov 2020 00:30:32 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WAD3=EK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
	id 1kaEBe-0002lf-7y
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:30:34 +0000
X-Inumbo-ID: eb438fa4-13c4-400d-b703-5cf733429253
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id eb438fa4-13c4-400d-b703-5cf733429253;
	Wed, 04 Nov 2020 08:30:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x7so21098042wrl.3
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 00:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=Sh1HtM7uDLB2YmR2hldT2MWKXVVvs+80YeAn9tOAS7U=;
        b=bQ7TcV2Q2mevOYWSH1zwHfWvSPCFmUU+pdHdZadirZQi88257XwabWuCCxhXRBSBWK
         inV/3NxZbo6hHN7vglz905iqZmxydaSUxnuIz+k8OwJiXDKKS1IzYl13Na373BgH6GEL
         47lH1tLb8kWLAvSNQn9uSycF4QvA3JSmNg9VIViEhU2Iv99oaXRDcCZ8roS0YXZABoY1
         querTcbvbuTxf2mkh3gr1JZ+uGtcJl745YvsRFh7D+NEs1TiHWXphY6SHwZM7fyVoIPn
         bV/hKTmVTWueDSNllSTIPkmZE3hzO7G931p9ZCitXb79TXYgxwZshQh1jKVnEcj1KLAZ
         BdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=Sh1HtM7uDLB2YmR2hldT2MWKXVVvs+80YeAn9tOAS7U=;
        b=kHwSX0HIw2tNLvqJ4MtbGx11hy4n/ibAxHtDuH0SSqKek1C6iO2be9e5ll6Vj69q4V
         RLaQO3rAz1Qe4xTiAhuDHHQQThXOTw/SxNIvsq/qIMhN6zvJOX+5qcFPj9F8YzN4jXZl
         JkyBlzg43ftPz234SOR6ebbkVRJeFGXtoy8AVA/0FpcClafFIbDqLrJwEmW+VYiIe+/E
         j0eb8BzhPAp/idejYky4yY8EpHq9MIKFoyHaZJPn62GV6g+spdhaU4p6P5qGp3lKi0WY
         DJfeaLwgM51D6rqFReP/ARSBmvSIzN6j9ZgFMhA970drbVYKfuZMop2z0B+qp83986Yq
         +Rvw==
X-Gm-Message-State: AOAM530ulcdmgx8jMfA44SnW5wDY4IMwntuHAuHRjev9hoY0NU0wWUCP
	AT+Jd2HrAmngYz6IXJGdotA=
X-Google-Smtp-Source: ABdhPJyiX8fD3zJif1V+yCe3SBi85vbdaVLugtJSioIMPuBR05zWylVXzTx5lJE9v7AXCITtZwmSIA==
X-Received: by 2002:adf:f185:: with SMTP id h5mr15586113wro.10.1604478632596;
        Wed, 04 Nov 2020 00:30:32 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
        by smtp.gmail.com with ESMTPSA id x81sm1454581wmg.5.2020.11.04.00.30.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 00:30:32 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'George Dunlap'" <george.dunlap@citrix.com>,
	"'Ian Jackson'" <iwj@xenproject.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Wei Liu'" <wl@xen.org>
References: <20201104082202.12194-1-jgross@suse.com>
In-Reply-To: <20201104082202.12194-1-jgross@suse.com>
Subject: RE: [PATCH] xen/drivers: remove unused pcidevs_trylock()
Date: Wed, 4 Nov 2020 08:30:30 -0000
Message-ID: <006c01d6b284$c25cb0d0$47161270$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQE5v9PXgJmLQtnJZ68jgI88qe7mFKrxibtA

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 04 November 2020 08:22
> To: xen-devel@lists.xenproject.org
> Cc: Juergen Gross <jgross@suse.com>; Jan Beulich <jbeulich@suse.com>; Paul Durrant <paul@xen.org>;
> Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; Ian Jackson
> <iwj@xenproject.org>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: [PATCH] xen/drivers: remove unused pcidevs_trylock()
> 
> pcidevs_trylock() is used nowhere, so remove it.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>


