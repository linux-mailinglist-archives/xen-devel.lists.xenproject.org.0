Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 147FC8AD2CD
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 18:56:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710142.1109213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywxR-0007h6-PR; Mon, 22 Apr 2024 16:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710142.1109213; Mon, 22 Apr 2024 16:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rywxR-0007eo-MC; Mon, 22 Apr 2024 16:55:57 +0000
Received: by outflank-mailman (input) for mailman id 710142;
 Mon, 22 Apr 2024 16:55:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B2T4=L3=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rywxQ-0007eg-Iz
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 16:55:56 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eb86534-00c9-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 18:55:54 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso3782925f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 09:55:54 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n17-20020adfe791000000b00349be95b5cesm12421527wrm.101.2024.04.22.09.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:55:53 -0700 (PDT)
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
X-Inumbo-ID: 2eb86534-00c9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713804954; x=1714409754; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50jQRAmBPX9v+TwjRadPvNR0cZTpRIB9Y3/Yq8zGQJw=;
        b=C6wuvDrrsTFuuMOzqnr1Kxr9U2j5oMJAEfJMrArZ4fOwXb+BAZKh8sVWd+sS2rc/Md
         1JzACA1nxDM0WZQh/Vci+qZNjnqnLdd/waC9+QHsvvgaFLFgWYqA6Ekl9fv7ITLbPOGw
         yfiXmpV8e6+lI42sk7+i5lYdbjPNMXFcphADM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713804954; x=1714409754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50jQRAmBPX9v+TwjRadPvNR0cZTpRIB9Y3/Yq8zGQJw=;
        b=JsSuBMCuTrf3QIsdvwtgidYf2hZ6JBoZalxopVv6H7u00+mOlgL80skKxjEKqhZ1KL
         1xdYKhctjJ0kTmOv8itDKAEg4xMk1JW3QaJUQDqOt+fg4cJT8MxPyp18/Dz24y7Pr2kY
         04y7roqFZBHdaYzmrhfLC2jTJ7Fr0cFdEUtKhMyX5t9+sqs7wLdGVmnHsEZVlYRPNa9i
         JZO36KdfeDqO5CARiZtVpUL3ZDcP7nak7Jcz6SQQWBRB3A9ragJ7xJ5q8hhAIcMOlSJb
         QDIauPz+EUEM45Emrxebeqpy20J4FDGfGsqhypalUieACLh3niLQUyjnKzENz0oqcfCw
         i+IQ==
X-Gm-Message-State: AOJu0Yygx+NRosQ4YhJCGvejNQc46gTeWk9YXqo2TpxVyL6EfHxaqGIt
	eWkxIW3Mc15l19twoI5PglQl4L97DrJO4aJqthVTDrFan/OeHAzWO2Q35/nIKTk=
X-Google-Smtp-Source: AGHT+IGQDb9ESB73TLFSftnmJR/nOhvDZ7Ol7brmhINOgtpAUInJKE93EO6bQhogAHCeVVlFNQBmjw==
X-Received: by 2002:a5d:628c:0:b0:345:ca71:5ddb with SMTP id k12-20020a5d628c000000b00345ca715ddbmr8343161wru.66.1713804953930;
        Mon, 22 Apr 2024 09:55:53 -0700 (PDT)
Date: Mon, 22 Apr 2024 17:55:52 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v2 2/2] libs/light: expand device model start timeout
 use
Message-ID: <e15c2fc5-017e-4afb-8b06-d4080c27d4ea@perard>
References: <cover.1712837961.git.manos.pitsidianakis@linaro.org>
 <125210f392aacaa5dd605ce7036c7c9b9e783a2a.1712837961.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <125210f392aacaa5dd605ce7036c7c9b9e783a2a.1712837961.git.manos.pitsidianakis@linaro.org>

On Thu, Apr 11, 2024 at 03:28:20PM +0300, Manos Pitsidianakis wrote:
> Various timeout values that depend on the device model should also
> respect the device model start timeout setting. This commit adds the
> __libxl_device_model_start_timeout() value to those time outs without
> changing their default values.

I don't like much this patch. It multiplies all qmp_cmd timeouts by 7.

First, could you make two separate patches for the changes? One to
change LIBXL_QMP_CMD_TIMEOUT, and one to change
LIBXL_STUBDOM_START_TIMEOUT.

Second, when the environment variable is unset, the timeout should stay
at 10 for the qmp_cmd one. If for some reason that chosen value is to
low, we could always have a separate patch to adjust the value.

Cheers,

-- 
Anthony PERARD

