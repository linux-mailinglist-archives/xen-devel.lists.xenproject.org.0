Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE16E2A20
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 20:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521209.809625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOEz-0007NF-7A; Fri, 14 Apr 2023 18:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521209.809625; Fri, 14 Apr 2023 18:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnOEz-0007KM-3u; Fri, 14 Apr 2023 18:33:45 +0000
Received: by outflank-mailman (input) for mailman id 521209;
 Fri, 14 Apr 2023 18:33:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfD7=AF=gmail.com=this.is.a0lson@srs-se1.protection.inumbo.net>)
 id 1pnOEx-0007KE-Ir
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 18:33:43 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1898835-daf2-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 20:33:42 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 39-20020a9d04aa000000b006a1370e214aso7460524otm.11
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 11:33:42 -0700 (PDT)
Received: from [192.168.104.105] (c-73-32-128-233.hsd1.tx.comcast.net.
 [73.32.128.233]) by smtp.gmail.com with ESMTPSA id
 v16-20020a05683011d000b0069457b86060sm2001827otq.47.2023.04.14.11.33.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 11:33:41 -0700 (PDT)
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
X-Inumbo-ID: e1898835-daf2-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681497221; x=1684089221;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l8ln56Hzz0BqSpD/wYa3XGMyMNJG6KUwksNpEl82aL4=;
        b=GZ09WK/rKhSZjCLyzpEbp0gMKunpkh56PSXJmInmZIoWGCQzd7Y3XeUN4mMTHNRK6h
         YIs802CWOA+zKs8XC/TXtS2a7wgMGS1gdabSJNhwOLVDFl9Mc7Ei6QnOUv2/l7+F+4b8
         Rnt8H5CBOAri3nIbSMigDK3BrcBAdxypPRxnjJvprvgRPVcUXWP8U53idKYEir0tOrBD
         044e3Botely9gnqj5Jr4NLDdTVHnFHBHL+BizwOsjRsPVSeIlOuCmbOF+Ahl3xu7SH6V
         BrbTB0y4nYYxcDGEEF3NY5yVFHBJQq8FbW4IOaavJdFNkNpW5Pizj/1YsuPFV0lF1OMU
         ow/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681497221; x=1684089221;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8ln56Hzz0BqSpD/wYa3XGMyMNJG6KUwksNpEl82aL4=;
        b=FRgTI/vasMx2Y7UFd9LLvj9dxY5WES/kKI+yXlAn5GkqlqLg99UrxEdFreObcaLrBn
         6M+gUgYDDk1Zce70CPVVGmb80mSq7iLBPD2LektMNeJJ411HfHwVGLBma3ogAikS/LH5
         rogTQ7o8yhLDLW+NvO7b+ORopo8gfqGCAqcJcPQ7dIE2rpM2lUjZhrbYMQhwtQ8widII
         R3LuOLdrYF5zCz+0k9ztTydajQHQ9kCzJ3COI3gwZuQI6yLKuKhbtW9wgm87iQX0MFiP
         9BsQTfpgVSv28qDkLFN5cEYnRj9CP7q6hwrnstVDWPOWgb7VG8t+hBwk8gQJX/zzco0k
         N41g==
X-Gm-Message-State: AAQBX9dU+shAnFQf1AbISr6O0j1aFYZQ/C6RU1B8HvGW7VCW/0K7I9P6
	U7e2o+/H8uf50DLFe0X93GDzGSqp1jc=
X-Google-Smtp-Source: AKy350ajpP8J7z63r+4DlL5zbJcOQK7g7+FL7nR31UiQ7mgsXV8Dj7fqnM8zV2muaCO0Mjzgh54eHw==
X-Received: by 2002:a9d:6508:0:b0:68b:d61c:168f with SMTP id i8-20020a9d6508000000b0068bd61c168fmr2740829otl.11.1681497221315;
        Fri, 14 Apr 2023 11:33:41 -0700 (PDT)
Message-ID: <56d02462173267603d7af1503d2e67cb88f2ad5a.camel@gmail.com>
Subject: x86 instruction emulation backstory?
From: Alex Olson <this.is.a0lson@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 14 Apr 2023 13:33:39 -0500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0

I've been digging into VMX internals and I see why MMIO emulation pretty mu=
ch
requires x86 instruction emulation.  Even the Linux KVM code borrowed Xen's
emulation...

Thus, I'm trying to understand Xen's x86 emulation implementation...

How was it developed? (x86 instruction handling is incredibly complex!)=20

Was it originally part of a general purpose x86 emulator? =20

It looks like it implements more instructions than just ones that can acces=
s
memory, such as "AAM"?  (Why is this)?

Thanks

-Alex



