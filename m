Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4267F9EAEED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852092.1265998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxz3-0007ty-PQ; Tue, 10 Dec 2024 11:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852092.1265998; Tue, 10 Dec 2024 11:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxz3-0007rk-Mn; Tue, 10 Dec 2024 11:00:53 +0000
Received: by outflank-mailman (input) for mailman id 852092;
 Tue, 10 Dec 2024 11:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xbj=TD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tKxz3-0007re-2J
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:00:53 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 052a6c1c-b6e6-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 12:00:51 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa6a3c42400so95649366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:00:51 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ecef4c07sm3922013a12.1.2024.12.10.03.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:00:50 -0800 (PST)
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
X-Inumbo-ID: 052a6c1c-b6e6-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733828451; x=1734433251; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XEBeKYCCu64IPF0XgaOrtuu0z+8g7mPMzXrZeOCpmn4=;
        b=kzB/hzx6xS8IEgyLl3xHXZoEA/CMo0dYdPtZIoh7G0BM/yBr9kFJS5jvCcrRbU2EV3
         EKRKqJQ8S3t9iO86YmlT/n92tar5WCXDVmWbGqNO7tugZOe8Ew4iqPphfJlOYgkXCjTP
         /P0vgp0nFL6FwK0gNkUu0fRRuvwTuiR8POVyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733828451; x=1734433251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEBeKYCCu64IPF0XgaOrtuu0z+8g7mPMzXrZeOCpmn4=;
        b=mmdL3zMv8xJzVzahyrXZzfhm5JsGmQxGjYBNslpT9atioTwrnEpPpgmrgSdPcC7W1Q
         u0lh//j8PWUuxjGdkSjl5aXD7FLAVLSgWrlOODddbMcDayQNejBtIn/q3Bbws8DDLZDf
         X49XIvs/QrYB7CKIB3SS0VQxsptre3/NQ6ZQ1idp1qLMlQJ2qPm7C95DRUihoOhwL+ci
         rPyq3Cf8x4FzmhHcTEzS8Hg00oe3kRxHUCcBUTOg+eYzJkhYTbumAhALlX0lT2Mpcud8
         3VcvwUJvBcSpedv+EznOcuwwCQmpyWWm5nKW2b/6S/hlYoDkORAcrByKEuNKVXZop8xA
         OAbA==
X-Forwarded-Encrypted: i=1; AJvYcCWX/gf4X/cJcGpjKY7B20+OMutbRhMGH+efkgzawTJ6Ja+5gVle8Fnm6tcjsKUEiQ4ei9+f3jbeJlQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwSCHmN8M5rvIuBiJghqqbRIZkgsROeTMpkQYijMbv5UwpOj+E
	FeRdZyU+vlQ2qK0hbAFgzqt122gCV+AWKdlmWbI9QmyVtehKQgbtAYN9sa1w1qI=
X-Gm-Gg: ASbGnct0G1pYsbePTXfmfjLzQtRqhKLVpQFtm2t/Do/h/oVX04od496q2Olf99L5esk
	lM9sYK4tfRSWWggrkcJYZIEUU2/RCUboLQqdiLbSXy1SbPBAgjZ2sL6+xvtXTSTZ6wYplXntIZa
	pbIDTvc0ibDvBvQ7Xntd9cGzlmbj+tmuEg4Yrw4X2Z1VN7tSeKTMGbCJQciiHOzQyeF91NoTF5T
	1NSWrxN9haBuhkl5dsEfan5z+JzTAVAM65ABzLW/4cCPF2AFvh4KqwQTPJrQm0=
X-Google-Smtp-Source: AGHT+IHSL9AamaKsgshnWGUpG5RDf6Peh0p8cvpBi3P9+5fw2YJx1zPvcrUsVqmzgsUtTQi3XDlSug==
X-Received: by 2002:a17:907:7213:b0:aa6:4a87:3c4 with SMTP id a640c23a62f3a-aa69ffdbbbfmr261572766b.3.1733828451260;
        Tue, 10 Dec 2024 03:00:51 -0800 (PST)
Date: Tue, 10 Dec 2024 12:00:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1gfYeJL-mgTn5Gj@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
 <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e4df0ee-67f6-41e3-bfc7-e78011680015@suse.com>

On Mon, Dec 09, 2024 at 02:59:31PM +0100, Jan Beulich wrote:
> On 02.12.2024 07:09, Jiqian Chen wrote:
> > +static int cf_check init_rebar(struct pci_dev *pdev)
> > +{
> > +    uint32_t ctrl;
> > +    unsigned int rebar_offset, nbars;
> > +
> > +    rebar_offset = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_REBAR);
> > +
> > +    if ( !rebar_offset )
> > +        return 0;
> > +
> > +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL);
> > +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> > +
> > +    for ( unsigned int i = 0; i < nbars; i++, rebar_offset += PCI_REBAR_CTRL )
> > +    {
> > +        int rc;
> > +
> > +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> > +                               rebar_offset + PCI_REBAR_CAP, 4, NULL);
> 
> The capability register is r/o aiui. While permitting hwdom to write it is
> fine, DomU-s shouldn't be permitted doing so, just in case. (An alternative
> to making handler selection conditional here would be to bail early for the
> !hwdom case, accompanied by a TODO comment. This would then also address
> the lack of virtualization of the extended capability chain, as we may not
> blindly expose all capabilities to DomU-s.)

I don't think we can safely expose this capability to domUs by
default, so my preference would be a returning an error in that case
(and printing a log message indicating ReBAR is not supported for
domUs).

Note it's already not exposed to domUs by not being part of
supported_caps in init_header().

Regards, Roger

