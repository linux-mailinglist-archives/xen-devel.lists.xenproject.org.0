Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8925B64C523
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 09:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461822.719975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NEG-0000en-JR; Wed, 14 Dec 2022 08:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461822.719975; Wed, 14 Dec 2022 08:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5NEG-0000c8-Fh; Wed, 14 Dec 2022 08:35:04 +0000
Received: by outflank-mailman (input) for mailman id 461822;
 Wed, 14 Dec 2022 08:35:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XtkE=4M=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p5NEE-0000c2-7o
 for xen-devel@lists.xen.org; Wed, 14 Dec 2022 08:35:02 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 321a866a-7b8a-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 09:35:00 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so6285972pjd.5
 for <xen-devel@lists.xen.org>; Wed, 14 Dec 2022 00:35:00 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 l7-20020a170903244700b001894198d0ebsm1292876pls.24.2022.12.14.00.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 00:34:58 -0800 (PST)
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
X-Inumbo-ID: 321a866a-7b8a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5dD4K7AQVtDAjY15Gtjb7ofH/CVZuAINSvT3316FNi4=;
        b=BrDtn5iQ3f/JOkUastnS/tunE4BT5FU4S4S/KYW+v4IxotyTR1oKhBIiouwfa1mjw4
         Q/o/zyGZwg3TI+U+UjdWen4rUvDODw7ST9ICkbkewhlNQlvS1BWGApenaLsw4kggI7aE
         mIgncPUOg3tT3qsVRfUYvQSRmLwHvaPiC8ueCMAnJUMjiZbN/oWXvioN9eaeLr5/MXos
         J1IdAimUZbenwK7CwU0Q9xQcD0GVlBilQ5KDlv+FgS9Qa60hN5BLhhl0L7nrNxtQuZde
         z/UHo7Xh2gFIdSmHVr7oOcyrzbUus+Ye/+WqA2f/zVtyq96OYHxl0V1/ntf6gYwIdBGK
         0aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dD4K7AQVtDAjY15Gtjb7ofH/CVZuAINSvT3316FNi4=;
        b=EDOP4bTL096slvxYCjarENYjPsoa8gAyHDevhXaCn8+2k6Q98ma0ielD3ZbeNs0Pbj
         r/G0G+nr7xvI0WMaoba0AvYop14OtWi7MOCZX1JSCqmZYbdFHysOC88Gf15DJMAXT1z9
         kF5xq52KJHRG2DrnDXdcOCLWuoH3RWkX4wNuIybOcBqGyrpxkDtC7PGsv7Tz3RwJhISb
         UWGM6x5uS2VsMb3WPfrOHx1uYawuvbIHuF/MyPHENGN/32TS5uJE22ti+MijLGi2jsYW
         C/aMArzcHj9htMu4onD842UyOJDSkfoNjRcP9yG2+YzpcXo/LmpQblgrM9T1kNBFmHCG
         w4DA==
X-Gm-Message-State: ANoB5pnwh1p8vsdqDDW7J1T0KJ0+h9MT4abyzJf/PuOYCdwcr5mXLaSY
	qjsea0yx/GEG8Bdr7GirzTgtPQ==
X-Google-Smtp-Source: AA0mqf4BQyh9yi2jBgR4tS4mzRyI+uycrogrPI/fm2Vo4xy0hXA1xGXDv6f2DSSKYGQaBf7+Mr79wg==
X-Received: by 2002:a17:902:b60f:b0:188:a6ea:279f with SMTP id b15-20020a170902b60f00b00188a6ea279fmr27730803pls.12.1671006898933;
        Wed, 14 Dec 2022 00:34:58 -0800 (PST)
Date: Wed, 14 Dec 2022 14:04:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH V10 0/3] toolstack support for generic virtio devices on
 Arm
Message-ID: <20221214083456.4w6raz7wop3ajtve@vireshk-i7>
References: <cover.1670994930.git.viresh.kumar@linaro.org>
 <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47096c1c-4b03-2e3d-c28b-c8920b7d31f9@suse.com>

On 14-12-22, 09:21, Jan Beulich wrote:
> On 14.12.2022 06:19, Viresh Kumar wrote:
> > This patchset adds toolstack support for I2C, GPIO and generic virtio devices.
> > This is inspired from the work done by Oleksandr for the Disk device.
> > 
> > This is developed as part of Linaro's Project Stratos, where we are working
> > towards Hypervisor agnostic Rust based backends [1].
> > 
> > This is based of Xen's master branch.
> > 
> > V9->V10:
> > - Swap I2C/GPIO compatible strings, they were wrongly added earlier.
> > - Arrange tags in timely order and add new ones.
> 
> The affected patch surely needed all tags to be dropped which weren't
> explicitly indicated to remain valid across the bug fix.

Hmm, since it was a very small change (only fixed the compatible
strings) I thought it would be okay to carry the tags and rather harsh
to the reviewers to drop them, since they invested a lot of time
reviewing these. Though I do get what you are suggesting here.

Should I ask Oleksandr / Anthony to provide their tags for patch 1/3
again ?

-- 
viresh

