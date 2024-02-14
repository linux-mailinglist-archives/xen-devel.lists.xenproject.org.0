Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777C3854FEE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 18:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681097.1059687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIxW-0006Rb-Vs; Wed, 14 Feb 2024 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681097.1059687; Wed, 14 Feb 2024 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raIxW-0006Ou-TI; Wed, 14 Feb 2024 17:22:10 +0000
Received: by outflank-mailman (input) for mailman id 681097;
 Wed, 14 Feb 2024 17:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hroU=JX=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1raIxU-0006Oj-Qv
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 17:22:08 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93cede92-cb5d-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 18:22:06 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-562178003a1so1625415a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 09:22:06 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tx27-20020a1709078e9b00b00a3d4f282cb3sm699632ejc.142.2024.02.14.09.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 09:22:06 -0800 (PST)
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
X-Inumbo-ID: 93cede92-cb5d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707931326; x=1708536126; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YuH53H9XoLYsAVEgEXhUxfFUh+6OlXcG/Rp2nhnU/0M=;
        b=hs2+l0vlk6InyBmXcB4ZiMiKQiC6xBNNYKuGQ0DkOKU8UFP+4UQ8Q9alvgJST4wMZC
         fgaxn5q+6yd4ta1b7l8wnIKaF7QmH4zcDR/6oEV/9ME8sdOOu7ct9iuRF3Lox9WAhH1R
         MfKZommxNAcSIMTFHMCsciGNJlN5LtDlEvPxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707931326; x=1708536126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuH53H9XoLYsAVEgEXhUxfFUh+6OlXcG/Rp2nhnU/0M=;
        b=XGV5OgDTaAQ/sZSOh198ml7FAFRRztAwPQC9LgunJhA+CqAazKNYMyA2CF3JgAzYel
         g7UuZFWxoQf/YfiUJxhDXQy/x/sdNX5qUVHo6HF/n6cOJ9y8H0tBwYrIGXDc1N+l0s1M
         KsZZCQ1cM/fKgPYinkKUasdNhDeTrergCeZEqRv+urokAru4lDLP5KXbxxEDdO7ksCCl
         7melbIayf6p+wlh+xXCX0ENhNQpq1IN4M2+qZgPkog3fs3P/w4hUGWgamk2zS+9XbFm1
         pGPSsf9MZlcQ/0xeg/2tyrqn43Ob8EdFX4LFsPxeCyLtEGbNgi5NfrF8YF8jUuNydHk8
         RFGw==
X-Gm-Message-State: AOJu0Yz5WW+6ej/urcntz78qJQbxxRR9wwqZGuoc3HTdky2KSlTP5rTM
	hyeCj9x2WLfXfeaLCFt+KJFZsFeeycwLJvjzQbs0Ij/EwnfQ+C3Er1PYF5bZfyc=
X-Google-Smtp-Source: AGHT+IF/tfQEqh38OZc58enlDR6I+2+ljBZ8klwKoC7ABRhruMlGDAYxi5KlTorL+RwSKMe10XLybg==
X-Received: by 2002:a17:906:d95:b0:a3c:ea61:9359 with SMTP id m21-20020a1709060d9500b00a3cea619359mr1922273eji.77.1707931326434;
        Wed, 14 Feb 2024 09:22:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPsAPBJoggk9uu9JbXWwmXDf5ZkOyOhROzcPXfqOKGfVriL3/TvJjLflOqtnPb0foFFjLQBpaxCE9fEe7Qva3+mWW2DxNTWfCf118fj48GFPyY55NGHjM7SBJwaUmkq9GKlMhaADzOrGXKNHDfaEG0vA==
Date: Wed, 14 Feb 2024 17:22:05 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v5 21/22] tools/xenstored: support complete log
 capabilities in stubdom
Message-ID: <b162a4c8-b113-4174-89e6-f0f9d8f1eae4@perard>
References: <20240208165546.5715-1-jgross@suse.com>
 <20240208165546.5715-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208165546.5715-22-jgross@suse.com>

On Thu, Feb 08, 2024 at 05:55:45PM +0100, Juergen Gross wrote:
> With 9pfs being fully available in Xenstore-stubdom now, there is no
> reason to not fully support all logging capabilities in stubdom.
> 
> Open the logfile on stubdom only after the 9pfs file system has been
> mounted.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

