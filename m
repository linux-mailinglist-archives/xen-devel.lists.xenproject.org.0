Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09E8C4CB2
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 09:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721156.1124324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mNO-0002qB-Kq; Tue, 14 May 2024 07:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721156.1124324; Tue, 14 May 2024 07:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6mNO-0002nO-I4; Tue, 14 May 2024 07:15:06 +0000
Received: by outflank-mailman (input) for mailman id 721156;
 Tue, 14 May 2024 07:15:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE3g=MR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s6mNN-0002nC-FX
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 07:15:05 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad85d7b8-11c1-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 09:15:01 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-43de92e234dso48584641cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 00:15:03 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43e1a021d02sm21910431cf.52.2024.05.14.00.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 00:15:01 -0700 (PDT)
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
X-Inumbo-ID: ad85d7b8-11c1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715670902; x=1716275702; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LFx6pZn3u4Vj7n1yf/nEddnYd4CXuOKYOAOdot+NcLQ=;
        b=gtpxeCrwqgA2k5uPnKD1MvX2uFVSaYj+aCB2eKBAC4Y65xg3t5AeZPy4UGzC+7FbtJ
         Q2a0/Iw2YzM1q+VyB+iXMMF88oNCwn257q9dhFVvAzem3GzkMp7PMPZT0wlWWne7qIV5
         o5RFap2l0ef059BwF9Iwd8cZ+YFVJzQ8evPGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715670902; x=1716275702;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFx6pZn3u4Vj7n1yf/nEddnYd4CXuOKYOAOdot+NcLQ=;
        b=K0CFNKbaY7hd1UrgJ91UDx901dlKHSPqcz7i+MS5Qxl1mYDtagL8EW8w4Fczo+q15Q
         rC9fKMQQvNodofMaspbkRAffggD+xn/mZlLA/Ev+ZtEBjqo1kqRAe8JgLF0ynfmFU9E6
         W5WfxEJh0BXbLvaqfYby3Eg/vpCUq9xydXDuBkJqftFmIIGUfMquTzsCT84C3faKG7I+
         9Zmp4ZqdkUm455IBPq1TqgJrO8lq2bCSU3BhNK9IsaNKt5bTelT+9OJz5+k4SdUKryoJ
         TSOL6zuAzPIU9huvQDlHIuPxU7be2wb8gMeqQWLro7HixGgdhCEkEUuI4eExMQ0TtHLp
         0iew==
X-Gm-Message-State: AOJu0YzVhdEiSAfST6BZnrsYMVexFaUx54ALEHjxCccl9dSeXrIDIFIM
	C5ACRkYECsaehFJ9Zarj8x6s2CGvPLB/M5QoWSwcAdwi06TBC2fRgeiWshyqKtU=
X-Google-Smtp-Source: AGHT+IERNIrlNUndQqjXiDTBOS2biumSMHZcG4cX/jF/jARKhf+wWNGmllMPn/Hziv0n7HWkdne8/w==
X-Received: by 2002:ac8:5f4f:0:b0:43a:71be:f3ae with SMTP id d75a77b69052e-43dec39bf67mr287764001cf.29.1715670902219;
        Tue, 14 May 2024 00:15:02 -0700 (PDT)
Date: Tue, 14 May 2024 09:14:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] tools/xen-cpuid: Rename decodes[] to leaf_info[]
Message-ID: <ZkMPc5puu9iCgDQU@macbook>
References: <20240510224002.2324578-1-andrew.cooper3@citrix.com>
 <20240510224002.2324578-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240510224002.2324578-3-andrew.cooper3@citrix.com>

On Fri, May 10, 2024 at 11:40:00PM +0100, Andrew Cooper wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Split out of subsequent patch to aid legibility.

Maybe add: "No functional change intended".

> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

