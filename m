Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F81A246B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 16:59:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMCAK-0006uU-9G; Wed, 08 Apr 2020 14:58:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M0gu=5Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jMCAI-0006uJ-8r
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 14:58:54 +0000
X-Inumbo-ID: 767b6e90-79a9-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 767b6e90-79a9-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 14:58:53 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id w26so8902382edu.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=suXtvA5OH/OvrDQAp9g5amE6tOxdRRZdjEbMaemYZPc=;
 b=VbFNnTR2EeykN/HOIRCIYlAL+ecmfZhClRYWOs9Xx6q9us/Iu/uz1xRKwHLBPpqi1i
 Mzs+FlLPKFpf3Lu+GYccQZ7nMTrAuzhwZUpi4Dlnn/YuxNkja+2gAO97K0SpP6Hg6Q70
 sUCxba0Kt0s24Zhs042Il915Gj/QCmI//wjuTS+kGpanTNQSPqL7wTN5fYDRvSsYsmVn
 DNmzeKBIgnEokUEB0uf3zWrmPlTxVgGnQCTynHiaO/DRFHXk8rzH85DfcwzJM92S//2/
 XvYuZp/eJr1/N+t99qZbJ7TsdX2qz1qd87VtWfEPyVbI3lwA0rXXmWQBpkcWCbOKwqul
 QtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=suXtvA5OH/OvrDQAp9g5amE6tOxdRRZdjEbMaemYZPc=;
 b=gP5KQxq4jOSxuWqX6yu9ybtpBSGLneNNIHo/fZPg/zJxCW/lITcJ+XkNKzoYoN6IFZ
 Oheqp04Bt4QbFkUxf+MvHHQN+EO2hmjMHCzahvW4S25Ppq0z+KMo2ltf6edySNgNXXwc
 JjBEOQh993wsEY5YVZZ1z0r+vfKGKdan0wC5fVvqAHvQBK3gfkQffMU0ctcmhcmW/wve
 0rzNIDe51/4TpkFD7865sqjpzceGBv/29NxUn1m64Yus6NA2bRZ1qTYva+m/SzMSn/hE
 iqOvDk63eBbT81nFzmkHMVCnpZYwVnR3uHl+49GexSKyuyPYCX9ZFzPIvkg/XRNyK8vw
 FkpA==
X-Gm-Message-State: AGi0PuZh97a7/n2GZXisOdjS5jOoGxKJmXH3kQ8WI3UyIQmnNf+nZCXJ
 0IAQSIqcPCbWf3sA8ysribc=
X-Google-Smtp-Source: APiQypJUXjypaGch+rfihl7yi++SeC9ELa6upHhA4gng9vGt8MQj+SOC2i9z4V8emv0CeKLxFxddVg==
X-Received: by 2002:a50:cd5a:: with SMTP id d26mr6977219edj.65.1586357932991; 
 Wed, 08 Apr 2020 07:58:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id j11sm3484243ejk.39.2020.04.08.07.58.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 07:58:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Maximilian Heyne'" <mheyne@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <20200313123316.122003-2-mheyne@amazon.de>
In-Reply-To: <20200313123316.122003-2-mheyne@amazon.de>
Subject: RE: [PATCH 1/3] Add support for generic notifier lists
Date: Wed, 8 Apr 2020 15:58:51 +0100
Message-ID: <004e01d60db6$37bfbd50$a73f37f0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGvBAjA7hxOW9V3ZNauiodGQFqJFQKOg3fxqKjv89A=
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
Cc: 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Maximilian Heyne <mheyne@amazon.de>
> Sent: 13 March 2020 12:33
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 1/3] Add support for generic notifier lists
> 
> From: Anthony Liguori <aliguori@us.ibm.com>
> 
> Notifiers are data-less callbacks and a notifier list is a list of registered
> notifiers that all are interested in a particular event.
> 
> We'll use this in a few patches to implement mouse change notification.
> 
> Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> ---
> v1 -> v2
>  - Do not do memory allocations by placing list nodes in notifier
> 
> [cherry-picked from d1e70c5e6d1472856c52969301247fe8c3c8389d
>     conflicts: used the sys-qeue interface and added required
>     LIST_REMOVE_SAFE function to that]
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Reviewed-by: Paul Durrant <paul@xen.org>


