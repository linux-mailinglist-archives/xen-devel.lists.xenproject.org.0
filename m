Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C8854C21
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680914.1059232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGmO-0006uy-3l; Wed, 14 Feb 2024 15:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680914.1059232; Wed, 14 Feb 2024 15:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raGmO-0006tM-02; Wed, 14 Feb 2024 15:02:32 +0000
Received: by outflank-mailman (input) for mailman id 680914;
 Wed, 14 Feb 2024 15:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raGmN-0006sm-9e
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:02:31 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12327a8e-cb4a-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:02:28 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5114b2b3b73so6577262e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:02:28 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 oj11-20020a056214440b00b0068c71b78980sm2325105qvb.118.2024.02.14.07.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 07:02:27 -0800 (PST)
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
X-Inumbo-ID: 12327a8e-cb4a-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707922948; x=1708527748; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BuGYPWEJOUTaH5rf6DAQz91oXgKrMbqT0YkEhfKJGuc=;
        b=SXTo5CRM5BgfBuEXKcn/qWZ1gvRq5XOqnjXuURulUCwXwMfivdcoIRvz0IUtoJutYX
         04UMnh9pjIHFsjWDhaXdrs4Hi0lj9KMHd78fIhOQuabi8s+fQ86XF+C4NSI2Xng7wfkp
         aJeK2ei0MKdK4thpp5Mbp1iI6XIILz1/fpLTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707922948; x=1708527748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuGYPWEJOUTaH5rf6DAQz91oXgKrMbqT0YkEhfKJGuc=;
        b=ivO45OCBKtWPp67+9ITAzHCygiqZK6iQeielpek91jQmny2wC4UkV+eSzAQE7Jybnh
         W2jFdNoz7JbNCbiYKJDHv2epEGy5AGtsWdYD7b7LnmQvuTc0dwIDK4nE16mW0bO8l0pC
         fgi5ivj5GG78To0muUbvHJbX5X26GlQ4l0d/Fd4Ug7qQJaohvVsYUCe7N2J6OrbdCeRp
         +p+u8Oo6UnKNLCKJmWXMzOl2pVp2zPQvbtdYiojM27FCkOR/G3qWyJG70o0h1RPTvSYg
         VrqxpePwYlJSdcg6QyMwslUJIxo0XPhHaHDUVHRN+j2VDw27R0xtMIomE7e3A2W2cuWE
         ye9A==
X-Gm-Message-State: AOJu0Yx1DwGoPtGPHTL+CDJLLnyjcUkRYbdicPGTALh8D1G0z2s2+dcc
	+7ysYmrSHazwmOpxs6fK8CVz8pKIQv/Ram3HVC84IabPNFjXaYhXhfX9+qIEQdM=
X-Google-Smtp-Source: AGHT+IHNFmecXRH2jOezFs+xLBqoWq0zVXTtUbqa+I4cM5vGILI35YTnPjzxTvvMRnrpve4xr8FTSw==
X-Received: by 2002:a05:6512:1391:b0:511:a2ed:f6c5 with SMTP id fc17-20020a056512139100b00511a2edf6c5mr2382930lfb.18.1707922948343;
        Wed, 14 Feb 2024 07:02:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVYYtCtrG9pGYKKSvFMKWFE+/qIvEICmzua5q4ESHeNrm9MWt1QlnrEny9trbfH7G1y+aoz5TC5VgiBOAPKnbiwgqyrwwfD+ApOti4QfTklBDCJuXVdjgjj43SWfgHipjZCeLsieff+w==
Date: Wed, 14 Feb 2024 16:02:26 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Message-ID: <ZczWAg-zmoLXiWAr@macbook>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240214103558.13655-1-frediano.ziglio@cloud.com>

On Wed, Feb 14, 2024 at 10:35:58AM +0000, Frediano Ziglio wrote:
> We just pushed a 8-bytes zero and exception constants are
> small so we can just write a single byte saving 3 bytes for
> instruction.
> With ENDBR64 this reduces the size of many entry points from 32 to
> 16 bytes (due to alignment).
> Similar code is already used in autogen_stubs.

Will using movb instead of movl have any performance impact?  I don't
think we should trade speed for code size, so this needs to be
mentioned in the commit message.

Thanks, Roger.

