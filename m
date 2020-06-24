Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26542206D9F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:28:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnzpU-00031b-SC; Wed, 24 Jun 2020 07:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mms=AF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jnzpT-00031W-9W
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:28:19 +0000
X-Inumbo-ID: 46205812-b5ec-11ea-bca7-bc764e2007e4
Received: from mail-ed1-x536.google.com (unknown [2a00:1450:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46205812-b5ec-11ea-bca7-bc764e2007e4;
 Wed, 24 Jun 2020 07:28:18 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m21so726200eds.13
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 00:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=mqd/7p04C1qCsd6vy/md3TOoU2jST6kdL6xN2es983g=;
 b=h6Lb6nlI2bwDQXbM2vFvAb65K8+xei7Hp31MOnPx8/ql/g/03oGoWFyRkiwO1q0Ake
 Pso3OZRFmtPKfNdNARlE4s9jfAsB0ZtmJKGTSQYFjd6HJMBLmUmo3r7AryTt8sQI8lbA
 jsFOPVQpNxigE56ne/GPQuszjPhRsX+m2bs1/tZuS9BzDBDlHLGDeU2nWt13tP3GFj7N
 8Y2fEoaCWGfVIfoylmdiSX23JMLkLg2+28IZ2clP/9m18PPkCWMQxVvVSIAnK8heWtwn
 nEkWEB+M1ldMcsTb7ek4Dn9+miZHMsotIKkzkatHAseVdNjIYOPFC46r2NyTNOaCMZdi
 hx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:references:in-reply-to:subject
 :date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=mqd/7p04C1qCsd6vy/md3TOoU2jST6kdL6xN2es983g=;
 b=mVipr9MLHhMTPhuIu26dRTBPKhUim0fnLCrtqNz/yOEdwWeU8POJFYiRSbwyotrRyc
 OxyDjWyFbGDCwTZEKgm59mn0x+xVOGGMzseei31TaGBWYKhRbA+2PPBbn78VyvyIuddo
 u9Gu1CeG6DcOaQvOi/oLSATs8aVkmGzs7kb6TvQnIwmqsATTU3QWk4rfa/nRKWZfIWHw
 J2LIrVjO1dYPlJniNDpSW43TPjRg64uQDie2R+u35/a/QGipXPKoqBBeyf9q9vdfhCFL
 ejcy1I7n4jgkgwE+ozYHnClrzCHSZlRZGdUlSeGJ1O1vOTaSIKl0wIDhyUqeKh4DVsGI
 Lqvw==
X-Gm-Message-State: AOAM533sZ1oXmABh1g1apeuuuAiv6HphpPtFOJi5F6bBJdS2nRCwIEMK
 zB2z5pHRLWHIAsPOL205s4Y=
X-Google-Smtp-Source: ABdhPJyFH1+nWEYGspwYRF08ORw1Wy3xiGOaGnCu0N5bj2tyD/hB4XM8TDdUq7v+72yPIQOvfHcb2g==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr25765788edt.198.1592983697711; 
 Wed, 24 Jun 2020 00:28:17 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id sd15sm7520640ejb.66.2020.06.24.00.28.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 00:28:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.k.lengyel@gmail.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <CABfawhnodzf=-qiq86Pm5M7RsB2CH2=G0xJPwL5BzGxuFQJ9_A@mail.gmail.com>
In-Reply-To: <CABfawhnodzf=-qiq86Pm5M7RsB2CH2=G0xJPwL5BzGxuFQJ9_A@mail.gmail.com>
Subject: RE: [TESTDAY] Test report 4.14-rc3
Date: Wed, 24 Jun 2020 08:28:16 +0100
Message-ID: <000401d649f9$07500f60$15f02e20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIIYyge6r5azssVMxgX6L5yJBrNd6iDK6rg
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Tamas K Lengyel
> Sent: 24 June 2020 05:31
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Subject: [TESTDAY] Test report 4.14-rc3
> 
> * Hardware: i9-9900x
> 
> * Guest operating systems: Ubuntu 20.04
> 
> * Functionality tested: domain create/save/restore, altp2m, vm_event,
> mem_access, mem_sharing, VM forking
> 
> * Comments: also tested running nested in a VMware workstation VM, all
> above work fine in that setup as well albeit with some expected
> performance drop.
> 
> Everything looks good from my end.
> 

Thanks! Good to know.

  Paul


