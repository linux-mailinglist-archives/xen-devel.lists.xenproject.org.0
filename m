Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC8A818A75
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 15:50:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656946.1025469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbQ4-0005np-NS; Tue, 19 Dec 2023 14:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656946.1025469; Tue, 19 Dec 2023 14:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbQ4-0005jH-Km; Tue, 19 Dec 2023 14:50:04 +0000
Received: by outflank-mailman (input) for mailman id 656946;
 Tue, 19 Dec 2023 14:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rom3=H6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFbQ3-0005W9-OK
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 14:50:03 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3e4d16e-9e7d-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 15:50:02 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c38de1ee4so46437645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 06:50:02 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 q19-20020a05600c46d300b0040b632f31d2sm3201751wmo.5.2023.12.19.06.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 06:50:01 -0800 (PST)
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
X-Inumbo-ID: e3e4d16e-9e7d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702997402; x=1703602202; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hzcasnjhECI3FsdZeVfpSAapMv8A6JjNUaAhCeMOcNc=;
        b=O6K25CAGzGNS8TuPUIwiN+mOLFPzT1YyWLYayIt7PySuqqWdZjHGnEZ5dn5aV1P2Hn
         EdFr7tzF9nsHGTHcB4xR2GwXJF0CkSQIjmvaUNCpmwk68euQq/7AzRt+qyBZ2SwvcmUO
         KOooOnmPV1wY6wiHlHR51jBYqGXiAhUtNZVfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702997402; x=1703602202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzcasnjhECI3FsdZeVfpSAapMv8A6JjNUaAhCeMOcNc=;
        b=wTF1+FosHxrh9G+uIkdLmBjE0tDYCeeDpF/yKVcLKdUtvbR4SndJZz76c9CRW/79N1
         SXYBHH6JcyK3TF4aazuukghfKz57fgLE4XH2wKO6PswE8FX4VUMQlYYbhi1uVUXOP56W
         iBucuqKAYId23HvIQX3z2hIxknInm/vNm3C/8KNLxJ4p8wW/YdtbBN7iwphm6ZUhcJAv
         YSyEookq253PQXqODepWboHyVIc0P9TgGv+LnIWEwyXWnvvrHh6HBYf+mq7MfT6lQYMH
         pNGkpmwMv/7JDo8XjIqk33JLLMYOpy/Kd4I84NHDRKc6rXGF8yx/15rqqxd4zognaNm1
         H2GQ==
X-Gm-Message-State: AOJu0Yx2EU9tI45Sxi2V295g8/PhAHS0zRYBsbmh4WMzXKFU6p8xmhfb
	AK2CkQtzNIDK0puID8qMK5QAVw==
X-Google-Smtp-Source: AGHT+IFYJTqWAiZDufM2oaJl7xFjr5SI6+MzCn39fw7sTZ3WB10Vbp6Q5j81SthV+90BUA3PuimHPw==
X-Received: by 2002:a05:600c:319b:b0:40c:38a5:3465 with SMTP id s27-20020a05600c319b00b0040c38a53465mr9154525wmp.133.1702997402243;
        Tue, 19 Dec 2023 06:50:02 -0800 (PST)
Date: Tue, 19 Dec 2023 15:50:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 5/5] x86/vIRQ: split PCI link load state checking from
 actual loading
Message-ID: <ZYGtmGQPlrz8ZnKa@macbook>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <3bd1a8b8-1ed5-4d3a-8f5a-e193fdab7e1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bd1a8b8-1ed5-4d3a-8f5a-e193fdab7e1d@suse.com>

On Mon, Dec 18, 2023 at 03:41:14PM +0100, Jan Beulich wrote:
> Move the checking into a check hook, and add checking of the padding
> fields as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

