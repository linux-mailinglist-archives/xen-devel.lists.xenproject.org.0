Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6185E187
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 16:40:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684093.1063780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcohn-0000o4-Fn; Wed, 21 Feb 2024 15:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684093.1063780; Wed, 21 Feb 2024 15:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcohn-0000lt-CX; Wed, 21 Feb 2024 15:40:19 +0000
Received: by outflank-mailman (input) for mailman id 684093;
 Wed, 21 Feb 2024 15:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6My=J6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcohm-0000ln-Ip
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 15:40:18 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82a189e8-d0cf-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 16:40:16 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41273f53c71so6882045e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Feb 2024 07:40:16 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b00411d0b58056sm19113894wmq.5.2024.02.21.07.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Feb 2024 07:40:15 -0800 (PST)
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
X-Inumbo-ID: 82a189e8-d0cf-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708530016; x=1709134816; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zF3CJpOvKAO/nkojOSXwjNL9njN21cd0Ma6oA+EsuYU=;
        b=GfnyVL0aatpZf3OxWF8c4fRED5McVyS9vF8d5D7sb/jbT3vhzzFEzX0DF31bSom8mt
         TOxJ0cfVNW4CFswwNPBSZ99Iu0fsI0FdO6ZM+cJktaCHO9aL0xYkfLHEGfC49nY2X2uW
         wc5/PS+83+nNzuGOgfh2rK4Jy+SrXvmFGQWog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530016; x=1709134816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF3CJpOvKAO/nkojOSXwjNL9njN21cd0Ma6oA+EsuYU=;
        b=DRndAh6Gb60FWmkkk+Z8oNNcppH0kHHO3raJMy0fqqXut0eVGrOUhazNl1vrhip3DY
         8QjMvsOK1lX7C75uerLh4Zc6HXgvYijyzZTfnKX1a21Chr+On9ArnAHAewhlhatSoIlU
         hqovC8CdrCct1lrJ1pWREPj+Sd3JHDXwYKG/RhOw189obktOVv/MZqdFodXRIdV8mgcf
         zx9xjsag10ttmW+EPl9N/KxGX8m0yeGbjP+f5d8hGxxvLNSAtEl9YNo5e+ShSOuzYEGt
         BI/o+r4cJAhvl3mKnegRl+5xfEoLGBHeolMeCGAt/mWzan9GK9JpbwgiwlV+8Knj0SfK
         9Xrw==
X-Gm-Message-State: AOJu0YzJI7USUgckeAAZzwojJswzkiOaHG3VlhfL/KsmK5AbYOTo2Wf0
	kkmKdm0dK9V3zWpuAabCJAsNEHWiokHuGmyhcG/UqNAyNX5UHMKCqOnDs+AGC1U=
X-Google-Smtp-Source: AGHT+IHL+fYNLryDvEv0dGfWzKQ8XRIDk3SOyHSRnGd3ERou/ZUPXADUX15xB1olbZFkSb36+vEmkA==
X-Received: by 2002:adf:cc88:0:b0:33d:620b:49 with SMTP id p8-20020adfcc88000000b0033d620b0049mr5545821wrj.32.1708530015940;
        Wed, 21 Feb 2024 07:40:15 -0800 (PST)
Date: Wed, 21 Feb 2024 15:40:15 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] tools/9pfsd: add missing va_end() in fill_data()
Message-ID: <a58105f3-1dd6-462c-a454-0cee1f5911df@perard>
References: <20240219135658.3662-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219135658.3662-1-jgross@suse.com>

On Mon, Feb 19, 2024 at 02:56:58PM +0100, Juergen Gross wrote:
> In xen-9pfsd fill_data() va_end() needs to be called before returning.
> 
> Coverity Id CID 1592145
> 
> Fixes: bcec59cf7ff4 ("tools/xen-9pfsd: add 9pfs version request support")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

