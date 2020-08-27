Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31B2543CE
	for <lists+xen-devel@lfdr.de>; Thu, 27 Aug 2020 12:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBFEi-000636-KC; Thu, 27 Aug 2020 10:34:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBFEh-000631-Rt
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:34:27 +0000
X-Inumbo-ID: eccbf84b-2c69-41e0-9a56-1a9a03b39f1e
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eccbf84b-2c69-41e0-9a56-1a9a03b39f1e;
 Thu, 27 Aug 2020 10:34:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l7so1038299wrx.8
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QWAFnq408UIZ3x8Tg3fh4Te7tLGUfApVI2jnZP5pPdw=;
 b=nhLw4yNcGAiQE51Q2aIddBD4/8cGPL/n/zhEv+3xlxEyj7Be0EsGMIIS7ciPrpi6Jp
 cOQvjKtJV/1BXMlM/YWyetyH2xNKim4hXEFgBHiwjxr93BVjCfrJXZ60P3QAN1ilK+hZ
 hGe08oFMUDlD4mnM6Ac9zw0gM8F7YDbi9177+BsfON25qCtwM3XXwe0cWaOIu297FpZI
 e9WFn6fAHAWW5SfZiDIZcPwX1dbUwDhpJvI6edTjwvm7OjQT6hxJKQaaeeKl+u0rwJYE
 cRhaCFIgmED8PM7oE8vJOd7wzuYr3zn697BjrSr5tlwBVDQsKXpsKYfE/sO+X9p5FHF+
 aC+Q==
X-Gm-Message-State: AOAM531u5/3eX690fJzQq5xeET6Xm3KvYUHKkllxah8IUfvViJ12zTLZ
 1K7zDvxR5EDAB+nUWv4Tnf5teyp2bg0=
X-Google-Smtp-Source: ABdhPJzfFnkUgu7CvdXAcZE36X5OWFSCYvQZxvrLjSmxPLU50vg0hXtMAjx8kA9Yg6ZmAjVCnvqohQ==
X-Received: by 2002:adf:f184:: with SMTP id h4mr6463131wro.376.1598524466331; 
 Thu, 27 Aug 2020 03:34:26 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q6sm4612152wma.22.2020.08.27.03.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:34:25 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:34:24 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 12/38] tools: fix pkg-config file for libxenguest
Message-ID: <20200827103424.dkkbmm2z4ndsxjvy@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-13-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:53AM +0200, Juergen Gross wrote:
> The pkg-config file for libxenguest is missing the private dependency
> on libxenctrl.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

