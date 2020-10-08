Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3126287498
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 14:55:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4466.11631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVRK-00042D-5p; Thu, 08 Oct 2020 12:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4466.11631; Thu, 08 Oct 2020 12:54:34 +0000
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
	id 1kQVRK-00041j-2d; Thu, 08 Oct 2020 12:54:34 +0000
Received: by outflank-mailman (input) for mailman id 4466;
 Thu, 08 Oct 2020 12:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQVRJ-00041X-2S
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:54:33 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 924d22de-8d80-465a-a70c-4abf3ced9477;
 Thu, 08 Oct 2020 12:54:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m6so6499788wrn.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:54:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c68sm6788628wmd.34.2020.10.08.05.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 05:54:30 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQVRJ-00041X-2S
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 12:54:33 +0000
X-Inumbo-ID: 924d22de-8d80-465a-a70c-4abf3ced9477
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 924d22de-8d80-465a-a70c-4abf3ced9477;
	Thu, 08 Oct 2020 12:54:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m6so6499788wrn.0
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 05:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=uKhENcFgNeHcmfi/Xc1khSKvTSV9c736YCkp+l64P7c=;
        b=lwthDI92MyQnqOUxIH4KGALUmWWeUmi+BCtyZCwgxrJPOeOkaWxSUmLPsbYl3SKuMC
         hQwTLX39I/a2RL9+9ge5wcHCSANhomx4vA5mX19rTDr1EuyxQ4YTGrnXw1NrJARlo+J2
         vosGuqxcSZKj1YBj3693WCvLqckwOzJwe9PlYCI3spM+J70rcn5UYkrxGHuGv/7jWPR4
         RGstg7hTJTLd1TZJYRAHkeUS4d4MDzi+H8ocHWb8o72Ob72JnEhA/IyqjRyjjOrsXvnU
         OKSKx+3NOhVA3Z6+I8KcHxAGeoDdK3EGEkuEE0S+aUEP7Awb/x50dQIn4DrwMDr0P6Ql
         mBKA==
X-Gm-Message-State: AOAM533VQK8eZTX83BX1HwL0p4ZYubNnGpLgXwk3RzmHWgB66PKYXcod
	OD322Rm8mvYmxvWMuv9Frx4=
X-Google-Smtp-Source: ABdhPJxpy3JciGSMV8DaezHiIPzUrrlLjUfTuL6qqAoLLpt/4JO/TWv3MYVkvCaIYqykrmoqznRLMQ==
X-Received: by 2002:adf:f207:: with SMTP id p7mr9849408wro.152.1602161671062;
        Thu, 08 Oct 2020 05:54:31 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id c68sm6788628wmd.34.2020.10.08.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 05:54:30 -0700 (PDT)
Date: Thu, 8 Oct 2020 12:54:29 +0000
From: Wei Liu <wl@xen.org>
To: Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1 0/1] drop RO socket from oxenstored
Message-ID: <20201008125429.q3z57uerlrdpoqtc@liuwe-devbox-debian-v2>
References: <cover.1601654648.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1601654648.git.edvin.torok@citrix.com>
User-Agent: NeoMutt/20180716

On Fri, Oct 02, 2020 at 05:06:31PM +0100, Edwin Török wrote:
> See https://lore.kernel.org/xen-devel/20201002154141.11677-6-jgross@suse.com/T/#u
> 
> Edwin Török (1):
>   tools/ocaml/xenstored: drop the creation of the RO socket
> 
>  tools/ocaml/xenstored/connections.ml |  2 +-
>  tools/ocaml/xenstored/define.ml      |  1 -
>  tools/ocaml/xenstored/xenstored.ml   | 15 ++++++---------

Applied.

