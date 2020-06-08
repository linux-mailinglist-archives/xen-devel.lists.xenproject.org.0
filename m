Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F911F1A98
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:11:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIUJ-00011o-WF; Mon, 08 Jun 2020 14:10:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=joD5=7V=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jiIUH-00011i-VL
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:10:54 +0000
X-Inumbo-ID: dd1d1d02-a991-11ea-96fb-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd1d1d02-a991-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 14:10:53 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id i16so14703411qtr.7
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 07:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZhSWpZickOGx37dZHYvaKvsmkcLpWU6uF6mIRnJsvUs=;
 b=cFkZefuLmr4hhAosZ5HXQfoP7tlG6hQ9em9AcBHYWmxBpnInLaxO87x9aACJ0Wkm2O
 p9tDtektESGeBPRXW0Z3QK8YGVqKrfK6vNwrRQfGud8MSTFXhpQbNocDPFqtT7jd97K4
 renRGG8iRtGkvG0LgYKZYxOmB+RZP/f72tGfcVTjogjYzClAv6FsMLdxGkZZm/Hcv6pW
 N2J107lmdKqdJy0FhYvkgF++dsPHITMLr2lzRmBVcXw/2XlLHhCyBQZeAaf1StAKl6hc
 zfn/c7QemR+u+8CkPBi2XsfvBY0+NHyt40VNklza7lRLxWU3vqfjp3Hx7fsza0Uo42C1
 33sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZhSWpZickOGx37dZHYvaKvsmkcLpWU6uF6mIRnJsvUs=;
 b=QV353RtKGEk+yt+AQro4lLOQIxRB3C7H08p7DqJgY3bzRpzafOjha7krqeAJQpDcYQ
 9V3qj67etCdVwB2va+Mscvk3/8tDQ4kAgxb7u+7ULADjwt2J/FSEeYUGO5EZodJ+ZGJn
 IAJ6rJYxuDh7EPx0B5tTEqDoKeBT7sr+p0VEH/X19pmlp/Rn2lKODIiAH+2dWt785YWi
 C7zFi7jVh54ifFBma0UprJAGm9mxomhbWFA2ivkOK7ab/Hgj5FL8g7d+qBN6d+SYHsZc
 xWtdl9y3mgXjMdliJ87tDCzJikjKfiuEFabUuKOEb3GSvPTrTMxwr/AIs/E2AaMl75Hk
 KuGg==
X-Gm-Message-State: AOAM530wQccZGPSi0n1zJNeIQpbPELe9BgXPV0+h+FlUQx89X2BDxfrh
 u7yCHz0eiiygZk14gzdgHYw=
X-Google-Smtp-Source: ABdhPJyBoQ2f5n+JRtUWnYFJmaV3YGpWHgZx60/acfiSC6ET/F6OAS1FdQzmmruAybC1WknG/LARog==
X-Received: by 2002:aed:2577:: with SMTP id w52mr23454516qtc.252.1591625452938; 
 Mon, 08 Jun 2020 07:10:52 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id s70sm7160885qke.80.2020.06.08.07.10.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 07:10:52 -0700 (PDT)
Date: Mon, 8 Jun 2020 10:10:49 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Message-ID: <20200608141049.GB420606@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-2-george.dunlap@citrix.com>
 <5CF4AE1D-C80C-4E4C-B4AA-0779E7DC53E7@citrix.com>
 <20200604182938.GA10975@six>
 <DCC151DE-9CCD-43DA-97BA-F087EB4E80F3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCC151DE-9CCD-43DA-97BA-F087EB4E80F3@citrix.com>
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

> > Out of curiosity, would it be totally out of the question to require
> > having gofmt installed (not for 4.14, but in the future)? I ask because
> > I haven't seen it discussed one way or the other.
> 
> I think I’d like to try to avoid it, unless / until we have a “core component” written in golang.  For one, if we added it as a core dependency, we’d need to be  backwards compatible to the oldest version of golang of distros on which we want to build; that would include  Debian oldstable, Ubuntu LTS, probably CentOS 7 at least, possibly CentOS 6, and so on.  If any of those didn’t have golang available, then we’d basically have to decide between dropping support for those distros, and making golang optional.
> 
> I don’t at the moment have a good feel for what other people in the community feel about this, but generally speaking being fanatically backwards compatible is an investment in the long-term ecosystem; keeping Xen *as a whole* building on older distros is an example of that.  (FWIW I don’t think we have an official rubric, but my starting point is that we should try to build on all still-supported major distros; that would include CentOS 6 until Q4 of 2020, if my quick Google search is correct.)
> 
> One advantage of making golang optional is that we don’t have to be quite so backwards compatible — up until we declare the feature “fully supported”, we can move the minimum required version forward at will if we want to rely on new features.

That all makes sense, thanks for explaining.

-NR

