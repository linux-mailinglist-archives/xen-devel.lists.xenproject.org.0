Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC31B5C44
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 15:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRbks-0000SU-Ch; Thu, 23 Apr 2020 13:19:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XA1d=6H=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jRbkq-0000SP-PW
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 13:19:00 +0000
X-Inumbo-ID: fe019594-8564-11ea-b4f4-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe019594-8564-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 13:19:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x23so4742722lfq.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2020 06:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sUVw7OVdAnwNaOAptUNLOUaZYFqjopL7OBaCovDYC0E=;
 b=WDprrvO2RGShHzgCqWSHQVYJrd6ONNoGR4PSFk5FcFzwUz2Bq/gEl07OVsRitV2E3s
 R4Z6esgk7zIVqPVn5wTCev6RxHJj38VH07eqFiw3F72EIdoxACmi780x7dZrE1pzUehh
 R4XJDQSZTK8GhuDgrYvQi26ZvA6vb2pMeMdzTUn8PZAOESXvlkTkbeytgfNgQIOwNX0h
 4AUl/9eKGS2/3BwqiObmpHo31k2kruvig+mx30GaO+5yfOjESKFGIoAzPJjJ/kyKO1cj
 5u88pK1mwiGtiMCUb2exWqBu2x3PZTOIFYxVp0cHOZxHR+Udm5fbepjzn6TbvdRbw/BX
 KEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sUVw7OVdAnwNaOAptUNLOUaZYFqjopL7OBaCovDYC0E=;
 b=GhUQkD/r1CshvWxU5arRFOtu5+6Rccw6AHpEFem1Nsb39JXrJgbblX0BvoEcsyW/J5
 RU1kvRmxbvxORoue59dcJtPJIAAGTiVfQjhC2ElP49CrHxhEfBsdY1Y3Cu/G4JQ6JTCX
 RPagUcbuzFoizfcPgIIAh0yz4xQWD1OiOQOtvqfvARMSldKNskbz4JDv50maNYbvAMOH
 KG5/46JN3D3VvylahfSpLPL3JT8Dc3DgnmYji4Eb5yjGmBk1ushIZa1tOS4WtvXjwKz4
 CnyH0kJx7qYQz+fMJlyBVJa7TWDfiJQMwTk5A7yaAr8CHhIETP1d3VLG/pskxsOmOt+g
 BpLg==
X-Gm-Message-State: AGi0PuaQQLY6bjThnsltYpQHi3WEBkrZz2wIJws6VO4wTTuLJUqnoe+1
 0oE4FQGBmtqWdARk9+qoo64DeGN3rg8r3ArQb38=
X-Google-Smtp-Source: APiQypLzqJ/IIKb2psk6LxzgmV7Vg5j25Bx9oh5npWl1rdbyMcw5QymHQQ49ofMGs9JisaJSGUu5Jr6sd9sk0Qx687c=
X-Received: by 2002:a05:6512:406:: with SMTP id
 u6mr2454297lfk.150.1587647938891; 
 Thu, 23 Apr 2020 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <7f03220c9db0a377cd26c0c96d8a10981ec47282.1586727061.git.rosbrookn@ainfosec.com>
 <7B3A2F0A-84C8-48C8-B9B2-C27ABE5F22D1@citrix.com>
In-Reply-To: <7B3A2F0A-84C8-48C8-B9B2-C27ABE5F22D1@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 23 Apr 2020 09:18:46 -0400
Message-ID: <CAEBZRSfh55wGQ_k2MC+7Bkz0FNshbbXTf=SBM=pwLLYxRBFcEQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] golang/xenlight: add DevicePciAdd/Remove wrappers
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 6:22 AM George Dunlap <George.Dunlap@citrix.com> wrote:
>
>
>
> > On Apr 12, 2020, at 11:02 PM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >
> > Add DevicePciAdd and DevicePciRemove as wrappers for
> > libxl_device_pci_add and libxl_device_pci remove.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
>
> For 4.14, we should really look at adding functions to the IDL so that all this can be auto-generated.

Agreed, there is obvious repetition here.

> Reviewed-by: George Dunlap <george.dunlap@citrix.com>

Thanks!

-NR

