Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07368C4D56
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:54:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721181.1124385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6myp-0004nY-Oz; Tue, 14 May 2024 07:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721181.1124385; Tue, 14 May 2024 07:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6myp-0004l8-LK; Tue, 14 May 2024 07:53:47 +0000
Received: by outflank-mailman (input) for mailman id 721181;
 Tue, 14 May 2024 07:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6myo-0004kM-9U
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:53:46 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 152c3683-11c7-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 09:53:42 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41fd5dc0439so35501535e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:53:44 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce24c0sm184376475e9.17.2024.05.14.00.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 00:53:43 -0700 (PDT)
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
X-Inumbo-ID: 152c3683-11c7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715673224; x=1716278024; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U/U2uxGMFphbtP9Y5GWb8Km1liP89pYaqmGeATZxIPw=;
        b=p+n0TH0x7rUSiVTgSl59nlJaQC7OpS+736m4nMpP3+eGdL0SADSyJdbTv/HcaEjULR
         SH42HobOKEaNFsJrGqaMsTCRQE/k4S+ttdo7W/BD0hV3gnsl5HY3+YMANF9FEnMGZ+d3
         /xsiR3mNQ4s2ZlV+95Grh8ZOJsD5TvSlJDB5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673224; x=1716278024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/U2uxGMFphbtP9Y5GWb8Km1liP89pYaqmGeATZxIPw=;
        b=FcRs50Hc2N4OMhQwgd5At9r4QR5PUZeJuhjnvsG2WgAlivrx0bU0d5Sasz3wrVil7C
         4QAvscPiSAaZxF2/ruOx5fKdONJd7JBbygXMJK5ysb5YfgTHe4Nn0VaTaWbpc8/Y4T1D
         B8Gj/JXWQtZG9kRCPpbvO9PueNlPBU8hT5ZI0jv0OhlsBm/+iXIBnWKvPYQYaK7PO4m5
         8pRzfP/ny0iPa3L+mADiz8MyLCvZ43cOZiDERou2kZ2WYR+Ux4wvaJYaT4gX5xe/3gGZ
         xT9JZdDdSMPi6hhG6/+BsiNQflSyJRUsAyKeonNiuLurx5QOCsIFlpFzcAeRND0cCAIr
         yq8w==
X-Gm-Message-State: AOJu0Ywl0cv8alAEAdQRUQ123yObY092cU3ZUZ5J0Dd+gmon6wTnDNf2
	CI0HXQ5Thdbz76wSP3YoBysgtG44jFbsARAMRy2Cga1vtxVQMhXlsdFtSThoa1ViVM+yuuDlT8z
	F
X-Google-Smtp-Source: AGHT+IF/jlHTa2o1y+pCpg9TuTZDCLr6Q5LQjL/ljpNAD3ALZuMVyhsl48u30tDrJnIwadCspa4kUA==
X-Received: by 2002:a05:600c:4f42:b0:419:f241:632f with SMTP id 5b1f17b1804b1-41feac49273mr98204135e9.31.1715673223653;
        Tue, 14 May 2024 00:53:43 -0700 (PDT)
Date: Tue, 14 May 2024 09:53:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] tools/xen-cpuid: Drop old names
Message-ID: <ZkMYhtFXeb5_vmCI@macbook>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510224002.2324578-5-andrew.cooper3@citrix.com>

On Fri, May 10, 2024 at 11:40:02PM +0100, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Not used any more.  Split out of previous patch to aid legibility.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

