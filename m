Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151FF1BB87E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 10:10:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTLJe-0001i1-S3; Tue, 28 Apr 2020 08:10:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTLJe-0001dv-1D
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 08:10:06 +0000
X-Inumbo-ID: aac78ade-8927-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aac78ade-8927-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 08:10:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 188so1663849wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 01:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=tqa9n9EoSDAPwWeVvhR+Uj2qxGKno9fvpdj73k0ySF0=;
 b=gYDoaOI16qKm0ihSWCygBBdWCDnhE++szBYSLccatExDMbjbQ+PXEHfibgnsbzjFCb
 inUlb2LhfwjDteWTkbizCmhwEyo0A3czN2uPx0BjLsHLY5684Lz4ALiyPiVofW7yiMz6
 L3uBJkZnS3/O5gngb/WkEp3XYAET1+dSevY9G2Ozd7QdcD62nk4HCMiGRYYdv1Q7OlTA
 SwZ3LVlGvgUBXIktcyICxsN8tphHOac9MKQvpBsPgh34a59oVCU3fnH0CAJaAyIR/S7T
 0jA3CYcxKdl2SbMeBeZ2mzuaE4BRpEfnWZJpLWwKTom67tpY0GkFucaRewvCU6W66Hjs
 3hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=tqa9n9EoSDAPwWeVvhR+Uj2qxGKno9fvpdj73k0ySF0=;
 b=f4fd3xtNwRJ0GYD3Bu11E0eCWY69S/nSfyW5r4Li4zcp93Qeo58Zj585GXUST/ddm+
 7uuWyxbmpuIPc73u333DjlFcz1S9s67LJofunMvyWyW/4erQQdwVEZVVdm7anBSiPAWi
 ZKCVI0bJGL4JUmNHQRZDIuJFiaSMRpUdRcU1ddRnLDdy7x8w8t0yRvojzMZtt9Se4A75
 a9M+BBnWPdpy8BMZlvFn/0tBrzSKcgqTBywRnY0dSdPbM1kTFIkXfqXaZsdtcjjPLjYo
 c4aZFjFHrHD5K1X6zOfOtVH58SkLMmvtTGS44GupOWugah/kHDEWR5Ejb8DCH+CWnrSI
 MVrw==
X-Gm-Message-State: AGi0PuZ6feTjM9E5z6Rco+cthePpTMvWEMR1soKJqFvdzoA/rtxosBeI
 hOUbjOMYeVjabDOh171INWM=
X-Google-Smtp-Source: APiQypI7ne91jSGdPfgFLjPDbWwiOo2xKnOh99cblKMQobaj588UxOZv1r75AYV27BnAwN7EilS/wg==
X-Received: by 2002:a05:600c:1008:: with SMTP id
 c8mr3067783wmc.14.1588061404689; 
 Tue, 28 Apr 2020 01:10:04 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id h13sm23315817wrs.22.2020.04.28.01.10.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 01:10:04 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Grzegorz Uriasz'" <gorbak25@gmail.com>,
	<qemu-devel@nongnu.org>
References: <20200428062847.7764-1-gorbak25@gmail.com>
 <20200428062847.7764-2-gorbak25@gmail.com>
In-Reply-To: <20200428062847.7764-2-gorbak25@gmail.com>
Subject: RE: [PATCH 1/2] Fix undefined behaviour
Date: Tue, 28 Apr 2020 09:10:02 +0100
Message-ID: <000001d61d34$6c0218f0$44064ad0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJZJJhe4DhOB0QFT+Ee5i7aNCDcTgF4qWDWp3xZsEA=
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
Reply-To: paul@xen.org
Cc: artur@puzio.waw.pl, 'Stefano Stabellini' <sstabellini@kernel.org>,
 jakub@bartmin.ski, marmarek@invisiblethingslab.com,
 'Anthony Perard' <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Grzegorz Uriasz <gorbak25@gmail.com>
> Sent: 28 April 2020 07:29
> To: qemu-devel@nongnu.org
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; marmarek@invisiblethingslab.com; artur@puzio.waw.pl;
> jakub@bartmin.ski; j.nowak26@student.uw.edu.pl; Stefano Stabellini <sstabellini@kernel.org>; Anthony
> Perard <anthony.perard@citrix.com>; Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Subject: [PATCH 1/2] Fix undefined behaviour
> 
> Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>

I think we need more of a commit comment for both this and patch #2 to explain why you are making the changes.

  Paul 


