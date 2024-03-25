Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C588AA98
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 18:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697837.1089017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronii-0001XM-3K; Mon, 25 Mar 2024 17:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697837.1089017; Mon, 25 Mar 2024 17:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronii-0001Uo-0i; Mon, 25 Mar 2024 17:02:48 +0000
Received: by outflank-mailman (input) for mailman id 697837;
 Mon, 25 Mar 2024 17:02:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMIF=K7=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ronig-0001Ub-Uc
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 17:02:46 +0000
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8031caff-eac9-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 18:02:46 +0100 (CET)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-607c5679842so45062557b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 10:02:46 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o201-20020a0dccd2000000b00611861f0586sm419130ywd.95.2024.03.25.10.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 10:02:44 -0700 (PDT)
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
X-Inumbo-ID: 8031caff-eac9-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711386165; x=1711990965; darn=lists.xenproject.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNR/Hc+JgRsug0tncVmwC7D8BSBAH0d9T637K6uSBEQ=;
        b=Z1AvWRFRUeEYUhxZY8ZeHAX+QWe96TUFwq9dTGRBL3N6TzuUSSL06prReSMsJ8Okhn
         cvBKRv0CBobO0c6zqFuVmyZwbpoDTTFnCIQgg6iTC5GToy+lKefbwaGXIkZgGpuNzozW
         kUS3krr+9jR8JOPau3grbw4aaM7J5wmi2HYZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711386165; x=1711990965;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wNR/Hc+JgRsug0tncVmwC7D8BSBAH0d9T637K6uSBEQ=;
        b=q+vnVL1ZjjpQ2DmkDlip3PrPlqiIaib/de8U0xmu86aeQDk61Y3SPTPeBhizjMLbC6
         0OSL3nZ+6XX17v36VBgvasTsWYYYTMN7Hs9H4Pc7L5p3jICdKMNYSZdD1c2QiUj+LKGH
         k9o9oupLrNaHCqEf+ovL3ZNE5ZrM0V7LiOLsGOUT2f8ZZz4lb43rNXAhhcH21SmLLgnm
         UDWPwYkqfpY/tjfARqqAxqLpmb8F5aeGR4Br94sq1IZXBEKvp9jW8Wi+HzFzABuZioIK
         3fU2vJeK3/umRzysJ+t3M5NUbc58dD+8lpdLj2rowpCNSJL7d/fUqzWgUOiDj+MyVJFJ
         pwsA==
X-Gm-Message-State: AOJu0YyFHndGYXH9cyIESOcHm408gu7KCAAJcA4K/tBLjEoAkQzcfvhS
	XgU3UIyldqMlzXdx9Ep8B3CnTVvEOQtUfAoppS5otTP1JLQrI/8v9KCnexcw3Ym5M8OROTaPLSx
	N
X-Google-Smtp-Source: AGHT+IFz3j2ciSbigLI2qC9ilOaSd2251zUd4QfGpo9+gT8KeG49c6vi9glXytff3zEhlmZKsOkCeA==
X-Received: by 2002:a81:83d3:0:b0:609:fec8:7789 with SMTP id t202-20020a8183d3000000b00609fec87789mr6372576ywf.20.1711386164787;
        Mon, 25 Mar 2024 10:02:44 -0700 (PDT)
Date: Mon, 25 Mar 2024 17:02:42 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
Subject: Backport request for 4.17
Message-ID: <f9aed339-bcd2-4069-b3a7-1da71b0ce032@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Would it be possible to backport 18a36b4a9b08 ("tools: ipxe: update for
fixing build with GCC12") to Xen 4.17 ?

This would be to allow building Xen 4.17 on Debian Bookworm, and to allow
osstest to test Xen 4.18 with Debian Bookworm. osstest always tries to
migration from N-1 to N, so it would need to be able to build both 4.17
and 4.18 to actually test 4.18. Otherwise, I can tell osstest to keep
using Debian Buster to test 4.18.

For context:
    https://lore.kernel.org/xen-devel/20240318165545.3898-36-anthony.perard@citrix.com/

That commit pulls a newer version of IPXE, I don't think there's be
compatibility issue with Xen, and hopefully nothing breaks.

Thanks,

-- 
Anthony PERARD

