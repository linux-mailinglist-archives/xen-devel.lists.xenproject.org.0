Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DE3A9C1C1
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 10:44:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967483.1357279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ef2-0004ql-MC; Fri, 25 Apr 2025 08:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967483.1357279; Fri, 25 Apr 2025 08:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Ef2-0004pW-Ij; Fri, 25 Apr 2025 08:43:52 +0000
Received: by outflank-mailman (input) for mailman id 967483;
 Fri, 25 Apr 2025 08:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AYju=XL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u8EXw-0002sy-PX
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 08:36:32 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b64e04d-21b0-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 10:36:19 +0200 (CEST)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-22d95f0dda4so30166555ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 01:36:19 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-22db4dbcf7dsm26850885ad.69.2025.04.25.01.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 01:36:16 -0700 (PDT)
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
X-Inumbo-ID: 5b64e04d-21b0-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745570177; x=1746174977; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/GxJBsK6n1J97dBzbLBs/WDP7IrILK5BdDKmQjHdxk=;
        b=tRDabKjrxQu4z5sa9gu+r1qx0cPGrgLSGFjrWurpuAAiJER5y/tqoztomnO69AzXag
         wCz2N4Mho4JXKqRdjjH7G/lF8ibA9oavxJPSJcjOXZCduXmbD8HOeQgea4YCs90i2JzR
         DXP2NmgQLmBiwQYW1rpIBTZcqAeaWsNLIh2S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570177; x=1746174977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/GxJBsK6n1J97dBzbLBs/WDP7IrILK5BdDKmQjHdxk=;
        b=hGVgnoaH9Y+B079fIQUGMEbXT34BsRuE3A9EiK/8u6dATDtnt1rpNAm8ZRQq+cLi8R
         wH6yO9Gxw2wk5rqKbcIy2xUAcrRIyful3aKrAnL+srJDYNyEK1qn3v6HAoGk5H5HPcvi
         7CGONdtk7eyMYhO8Pq4A54/EgeSyNKYzuu3QRIcptXhQEjWdii5Bu8OfIgOIM7G4Z9P5
         p69Osn+QcTXKPTw6e7ZuWZX3aBglXNEectMsYQhQLMdCfCbq6lUGNIDmmp6HsfjL6wBK
         dbaQI5hxMJjwkXSHjXF0PmYGgcMCa0Gy3bGLznftNeBYCT7FfAnyFVzrEdODS0qOflRU
         zQiQ==
X-Gm-Message-State: AOJu0YxkJsQvZvwbc7zHB+8s/lPif1s/0Ke4qX3xElJgpVC/OU+Baem2
	kKbX0LPlopAz6qwUFB+FiCXJAMZrIlzuXa/ic0prtt02VZE2ezTm0C6z9t3N4v6r6OTnbyc1DiL
	n
X-Gm-Gg: ASbGnct+zmfhhm2VM/LiMJKZ7ax3f/x6xlYOabYNQOQIC/D2Y0jbc5nQkaG/WXTESCN
	CUandI01GGe79wPZdl6pxihZU6JHnQ/515HhmsJj53wyzwtfLfdkKcT/RL2XRhVqP7ZnyBBqOeL
	YJuXJTAWnQiWk/OJejgmiqiGRTq+nWivRNipCiXZB3TJz7SDh02ilJXomql7jm2KuEdNulxGdDd
	ucFd6xb5DE5RgoivdgRao0HNoECYw6EIury8PulpHMtIqK9zovllnMPLOlQEbvAFxY1XTI6UCes
	rZn5VoRobX9LtPl6nnFG0SrBRmjqlMMv7P0UCRQcZ6wOkw==
X-Google-Smtp-Source: AGHT+IG0hORC7Qgprc8WyLk7gcKt5kiWkxcb19M92Xw81eKcPgLZ4oYC5fW9k0hyoqJqSkAFA8FMuQ==
X-Received: by 2002:a17:902:ce10:b0:224:13a4:d61d with SMTP id d9443c01a7336-22dbf5edd9fmr23356215ad.23.1745570177397;
        Fri, 25 Apr 2025 01:36:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:36:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/vpci: Fix msix existing mapping printk
Message-ID: <aAtJe-w-oJDxuxZJ@macbook.lan>
References: <20250424212326.151403-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424212326.151403-1-jason.andryuk@amd.com>

On Thu, Apr 24, 2025 at 05:23:26PM -0400, Jason Andryuk wrote:
> The format string lacks a space, so mfn and type run together:
> (XEN) d0v0 0000:06:00.7: existing mapping (mfn: 753037type: 0) at 0x1 clobbers MSIX MMIO area
> 
> Add a space.  Additionally, move the format string to a single long line
> to improve grep-ability.
> 
> Fixes: 677053fac17a ("vpci/msix: carve p2m hole for MSIX MMIO regions")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

