Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58E9A6770
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 14:02:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823455.1237453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2r6s-0002v5-Ql; Mon, 21 Oct 2024 12:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823455.1237453; Mon, 21 Oct 2024 12:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2r6s-0002s3-O0; Mon, 21 Oct 2024 12:02:06 +0000
Received: by outflank-mailman (input) for mailman id 823455;
 Mon, 21 Oct 2024 12:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ab4=RR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t2r6r-0002rx-T0
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 12:02:05 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49f43c37-8fa4-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 14:02:05 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so327329266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 05:02:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912edfc5sm195792266b.70.2024.10.21.05.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:02:03 -0700 (PDT)
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
X-Inumbo-ID: 49f43c37-8fa4-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729512124; x=1730116924; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dPDau3OKwow0esCaNfoSaE/koAvkLGgfbnB1Y+yw2VU=;
        b=lrshU85WsBtj4cnUlr6s98niN8TU/0/PAub63V02fDjrwtvRtpOWxTznXIDetsWk09
         NrrQHIFFPtmS3HUGc0/fbKFToYsqTpBzplU/FuCHpN9ce0qHVBRmBslxf81fQdXpIXFC
         miaOCG+/vD06VuA1MYb41Xc4OecM30AQUt6rLyiWFVcPdEHXMbG+eRbsrk4a/5DtXyO5
         cFkLH0R84HoSBttjLUcQR0/oomhVGNN0fJMNttaG64gyCbpByvafl2U9N7FOT2WJxwh6
         az1n8NfTImYQ1/ovdjtMFtooYfzkc1o2uJq5V4yPYCkPbjcTK/hQPiMJvbap7zUqqNyf
         J3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512124; x=1730116924;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPDau3OKwow0esCaNfoSaE/koAvkLGgfbnB1Y+yw2VU=;
        b=xN2aNC2bM/raiSS9r++eOlSYsGvBtYTrcYuU3g0mQvVJOxfWjmiUKZchpJ7IS6gEWm
         dfwzxyzrOLBbXwydQZo+oTiF12C/xIW/oql/cmFAQ8CXBtWMyQCPmJAOcWc2tNsxdrMd
         jN6zNjfrt9VL7XPsie2oJwvSgz4BEFOuVFACCa9HoU8jLWxttIKo6VcBSWeex6dx40jc
         gMb60o/b+0+3pn1avW9V+XEJFmvdsZal5a0ZuGdlERkUdZMOT+HsM8iIR+mCjkkU30vv
         QJ2BWTDqyGMuwesxUSCGY8FEdfep9Cx6ZF7TmYr6SdPOVCaJW3CAm+NyyaqwFMMRSdsD
         trEQ==
X-Gm-Message-State: AOJu0Yz7PKUVPGHc5Kl3rDzb4cOHc1U0KYC4PXZ4nKYfWK9QqdgzzYK2
	xoNG1Q00HfSXhJRh9ZUbyVqjPX2Ru9eXaujnD2BsApw+58MemUEfHEMm2g==
X-Google-Smtp-Source: AGHT+IFVj1usi2lt0jJV5vBbv5Uxmj0nfnglzfgqHDHmFtSurKtjOCuVinbxzdDiqTI9Dur/jI08tw==
X-Received: by 2002:a17:906:f594:b0:a86:94e2:2a47 with SMTP id a640c23a62f3a-a9a69a79c72mr1304356366b.15.1729512123442;
        Mon, 21 Oct 2024 05:02:03 -0700 (PDT)
Message-ID: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
Subject: Xen 4.20 release schedule
From: oleksii.kurochko@gmail.com
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>, "committers @
 xenproject . org" <committers@xenproject.org>
Date: Mon, 21 Oct 2024 14:02:02 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hello everyone,

As there were no objections to the proposed release schedule
(https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=3DNwG3He8eQn39aiaxZCw3=
bQF7i4YcmjuNw@mail.gmail.com/
), I've updated the wiki with the schedule for Xen 4.20 release
(https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
it is now accessible from
https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.

Have a good week!

Best regards,
 Oleksii


