Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235725445D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 13:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGBM-0004nO-6K; Thu, 27 Aug 2020 11:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGBL-0004nI-8c
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:35:03 +0000
X-Inumbo-ID: c18bda74-0636-4e06-8925-b447256ed53f
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c18bda74-0636-4e06-8925-b447256ed53f;
 Thu, 27 Aug 2020 11:35:02 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z9so4799253wmk.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:35:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=97fFpmnWW+7v/P4N3pOXwfDED9ua7otC13IRgBkvY6E=;
 b=g1QvjFEySDW39z3GKYox+M5zwqfuSipfOgo/nGCrIBI5ol0hmnP6MCkZq78AWuLEmk
 D74CTHHCYvfJfXQiGd3jQEwCfF1ZUlA1DzU1ffLFXPd0SmSI+6rp5OzoEEkFdCEugOUV
 ZGs8+I0i84X50dGMYhwZBYelZHXen9B+o71WaHT+8xi15G7tt2YxiRmLD++G6RgUw6wG
 p22KSmfEel0WSbdQC6G9MWJ8zv360EupUDfgfliJjQZ8tpjiPVmHICrXZAKprywyPZKA
 2mZGYDEHPIZbLvapG56zqpk3y5JztMKJHs0pXDcDlPb+ZduVb9X+jgo04//3sF6T78nB
 OHtQ==
X-Gm-Message-State: AOAM532RN3kG81yzofAqU5fmsILamkaROrqGnv0UBX1xg0pCbcEFxw8m
 mzh4LXWBZPe9h/PzQuXtmHVOjvaVuTs=
X-Google-Smtp-Source: ABdhPJy3fljI2XlpTQMVQGQGk2AHK3+TyhJNCOQ2/GbJEShEBznJ+QDWZv/MLLt92oWQCUPmU94s3Q==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr9480219wmc.122.1598528101293; 
 Thu, 27 Aug 2020 04:35:01 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m11sm5080938wrn.11.2020.08.27.04.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:35:00 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:34:59 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 28/38] tools: split libxenstore into new
 tools/libs/store directory
Message-ID: <20200827113459.w3tubnvuvjp6dhid@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-29-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-29-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:09AM +0200, Juergen Gross wrote:
> There is no reason why libxenstore is not placed in the tools/libs
> directory.
> 
> The common files between libxenstore and xenstored are kept in the
> tools/xenstore directory to be easily accessible by xenstore-stubdom
> which needs the xenstored files to be built.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

