Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA46608400
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 05:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428077.677874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om5Zx-00005k-1t; Sat, 22 Oct 2022 03:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428077.677874; Sat, 22 Oct 2022 03:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1om5Zw-0008Vj-Ud; Sat, 22 Oct 2022 03:53:44 +0000
Received: by outflank-mailman (input) for mailman id 428077;
 Sat, 22 Oct 2022 03:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7k0s=2X=gmail.com=liu.denton@srs-se1.protection.inumbo.net>)
 id 1om5Zv-0008Vd-FT
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 03:53:43 +0000
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d6fad9b-51bd-11ed-8fd0-01056ac49cbb;
 Sat, 22 Oct 2022 05:53:41 +0200 (CEST)
Received: by mail-pg1-x532.google.com with SMTP id 78so4170876pgb.13
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 20:53:41 -0700 (PDT)
Received: from generichostname (136-25-1-99.cab.webpass.net. [136.25.1.99])
 by smtp.gmail.com with ESMTPSA id
 p184-20020a625bc1000000b005618189b0ffsm15930477pfb.104.2022.10.21.20.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 20:53:38 -0700 (PDT)
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
X-Inumbo-ID: 1d6fad9b-51bd-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ3ihIRL9MraIVj9GE5SrhQO6XWcgV8rR2mvmSML20E=;
        b=QxzZKKIpfaY6qBU4kQ+KTqHvuXrEFztvWHqr2EZSQA2VzukverFpOVy5ZrjBIiIA7b
         lUsVla6Iyns0/9rRL+TkBEHq4+xGWveC6PFCR+MS+1hkn50dVdy74BqRJW1Ef3u28FU1
         RyHm7cDABG12QKbLaAx4DSrPWuzUOurTmoF+qzg85xIGRjiXfvM28JLer7tR8ajmjl77
         sjwqtjXMTAZ7522MAj5dXpRR4V59vcdTVP6n4iUEcCMY+PnTzE90STLJtWBryjhS5pHG
         gy/w0RCrrRBawYjwif/AzcpnPPDWpkYdoexKoOs7gngl5b6vXS+8UeijuBgdl0vOLiT8
         PYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ3ihIRL9MraIVj9GE5SrhQO6XWcgV8rR2mvmSML20E=;
        b=1RwsdcQxU7pr2YPUy7/IyeYxpAq2Ze/JmmkKVwaeWuBct0MDpvzmPgC/2QUQtTRwPm
         K5gPAixz0ny6ojUWiCXCpapWyMnrYej8phYwijFwEGmEv/D/wqME+OCW/5/V55cFpsvj
         2oTngk+NRVpegrdDiKk74vx/zMat+OwZihfUX+oFT9RQUfO9Dz/hfIqwnDsVH7p/+k2J
         R6ZqnuGcYQg8gqjQijnehMuLxtsv3N7fywTfmOqnT/vwnLwWPc0O6YhEmLTdBuTiHF0Z
         NBDkbh4BwF1/Pwm/IEEBQonfdBZD/2PbgSEKypFVN55GtlqzLef/iUoT1+T/6h7zDEM5
         180w==
X-Gm-Message-State: ACrzQf1YBeuYqcLHTnbsUt2xDCy2fB8Anaf2VsXlT3qPEGYeGb5du/P2
	6WXI0K9I6PqDzHl8Par42dbCCCsZPZg=
X-Google-Smtp-Source: AMsMyM42y17bWkB/OFdTCrRm2xJDaYzraXMJRGfoX6jL/pbSMEDC528hQBUz2iqOxlgqLU8GmLUu3A==
X-Received: by 2002:a63:6c07:0:b0:457:523c:4bd0 with SMTP id h7-20020a636c07000000b00457523c4bd0mr18881225pgc.101.1666410819578;
        Fri, 21 Oct 2022 20:53:39 -0700 (PDT)
Date: Fri, 21 Oct 2022 20:53:36 -0700
From: Denton Liu <liu.denton@gmail.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>,
	Oskari Pirhonen <xxc3ncoredxx@gmail.com>,
	mathieu.desnoyers@efficios.com, rharwood@redhat.com,
	samuel.thibault@ens-lyon.org, debian-bsd@lists.debian.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <Y1NpQKadAS1EgY1c@generichostname>
References: <20221017103532.845293-1-liu.denton@gmail.com>
 <20221018131235.5e70f0bc.olaf@aepfle.de>
 <Y06w0Oda0sHTHPNW@generichostname>
 <20221018161821.149ee6fd.olaf@aepfle.de>
 <Y0+CzFbQXxYiqgPC@generichostname>
 <20221020171306.45c275f9.olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020171306.45c275f9.olaf@aepfle.de>

Hi Olaf,

On Thu, Oct 20, 2022 at 05:13:06PM +0200, Olaf Hering wrote:
> After reading the patch again, the newly added documentation states:
> "This option should be a path to a kernel image."
> 
> I think it needs to be more specific: is it expecting an absolute path, or just the basename of the desired image?

Thanks for the feedback, it should be an absolute path. I can submit a
new version of the patch later. However, before I do so, are you still
a NAK on the general idea?

-Denton

