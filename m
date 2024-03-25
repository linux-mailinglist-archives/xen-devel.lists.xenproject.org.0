Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FE889AAB
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 11:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697689.1088723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohdM-0000Yq-Dk; Mon, 25 Mar 2024 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697689.1088723; Mon, 25 Mar 2024 10:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rohdM-0000X8-Ac; Mon, 25 Mar 2024 10:32:52 +0000
Received: by outflank-mailman (input) for mailman id 697689;
 Mon, 25 Mar 2024 10:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMIF=K7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rohdL-0000Wx-8k
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 10:32:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06dffd55-ea93-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 11:32:49 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2982372f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 03:32:49 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 w17-20020adfcd11000000b0033e786abf84sm9137754wrm.54.2024.03.25.03.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:32:48 -0700 (PDT)
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
X-Inumbo-ID: 06dffd55-ea93-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711362769; x=1711967569; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Xi3DDIyqugFT6qQDdl59fqNIMfUCuqXq0wSkDBvCXs=;
        b=B2g35PgFsPVu/8WeX8nAYl5QKJko2HReUHckxcV71ac8HVZmRV5O5BVSQJdv6bGQ/P
         Un/OHOW666XzhMYhmZ2NN2s5NPbcOgoNm1e6nKHms4UuhTzdfz5/KdTHxcP5UBw5QcTJ
         0EGAuhrZtoPcfhsTHVp6OyxgRnOKyq6zhL9DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362769; x=1711967569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Xi3DDIyqugFT6qQDdl59fqNIMfUCuqXq0wSkDBvCXs=;
        b=lB7//n725vMAtRcITsfpCdpqRFi3gkWeEZel+3YJJ/W3A6kkVwNHENXGqpmSq21PAs
         ViEroFy8qGafdh2SiyM63R+ujUdxHaGqzM8//kh26F4cBe6cyn/XGl5FFoQqH00je5kJ
         1KOIZQfVIzAr/a1K1Avf6SwZdacZjhYCoLDSBE58EGH9bMrAPooefd6auaivTvbFcwi9
         xdoKDTdDrbWmeY6n6XBIxvrsBP/dHLBVMNKwSQkBLGJdHTzydzikTlAD1eF3ceKuIIrJ
         hzAP51dq4X3pxqW3wtQLJ+Q/uLLabToEvK3klSIps5NX9Pg5xfQNwKtBat4yKXruN1qJ
         yY5g==
X-Gm-Message-State: AOJu0YyomlJDuOsVDaJuFYDYH1/EkV7RhM8WF5gMwVH2RGysY5JFG5HP
	rYuZue7045c+ce6RR2aygfGLjJD6uklQqKQD4EWDSvGoTc/h86JkDBCqgQsGVaDCHxBZrhI0g9A
	K
X-Google-Smtp-Source: AGHT+IFq0r0u9PHYgs+Q0N9sdrglcVJU9CrHN2vrqK/O+HB1ib3fOrwBfQwVRD3Y9mUcB5nU/Hvz2Q==
X-Received: by 2002:adf:f290:0:b0:33e:c7e7:cc6 with SMTP id k16-20020adff290000000b0033ec7e70cc6mr3714858wro.2.1711362768724;
        Mon, 25 Mar 2024 03:32:48 -0700 (PDT)
Date: Mon, 25 Mar 2024 10:32:47 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: =?iso-8859-1?Q?Rafa=EBl?= Kooi <rafael_andreas@hotmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/1] tools: init scripts: Add missing
 XENCONSOLED_ARGS variable
Message-ID: <a7055af9-fae4-46d1-bf10-5d6ccf0747c3@perard>
References: <cover.1710920673.git.rafael_andreas@hotmail.com>
 <DU0P192MB1700AA0337B5E6598E23EE0AE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU0P192MB1700AA0337B5E6598E23EE0AE3332@DU0P192MB1700.EURP192.PROD.OUTLOOK.COM>

On Wed, Mar 20, 2024 at 08:48:33AM +0100, Rafaël Kooi wrote:
> The systemd xenconsoled.service uses the XENCONSOLED_ARGS variable, but
> it was missing from the xencommons file.

Actually, I'm tempted to go the other way and remove XENCONSOLED_ARGS
from the systemd's service file. In the other service files (openrc,
sysvinit) for Linux/FreeBSD/NetBSD, XENCONSOLED_ARGS is simply used to
construct the command line for `xenconsoled`. For the Linux one, if you
set XENCONSOLED_TRACE, XENCONSOLED_ARGS from xencommons won't be used.

On the other end, with systemd, it is very easy to modified a service
file, to add an argument to the command line. So removing
XENCONSOLED_ARGS would make more sense. But some user might have notice
it exist and start using it, so it's probably too late to remove it.

So overall, I don't think it's a good idea to advertise
XENCONSOLED_ARGS, first because it's kind of useless for systemd, and
second because it's broken for "tools/hotplug/Linux/init.d/xencommons.in"



Side note: looks like on my test machine I've used systemd instead of
editing /etc/default/xencommons to change XENCONSOLED_TRACE, so there's
really no need for "xencommons" config file on systemd:

    # /etc/systemd/system/xenconsoled.service.d/trace_all.conf
    [Service]
    Environment=XENCONSOLED_TRACE=all

That "xencommons" config file is just there to be compatible with both
init system.

Cheers,

-- 
Anthony PERARD

