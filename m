Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BF7AD9E5E
	for <lists+xen-devel@lfdr.de>; Sat, 14 Jun 2025 18:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1015676.1393224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUBI-0004vi-GP; Sat, 14 Jun 2025 16:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1015676.1393224; Sat, 14 Jun 2025 16:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQUBI-0004t6-Dc; Sat, 14 Jun 2025 16:56:36 +0000
Received: by outflank-mailman (input) for mailman id 1015676;
 Sat, 14 Jun 2025 16:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duY6=Y5=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1uQUBH-0004sg-5T
 for xen-devel@lists.xenproject.org; Sat, 14 Jun 2025 16:56:35 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 859cbe8c-4940-11f0-b894-0df219b8e170;
 Sat, 14 Jun 2025 18:56:32 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-710f39f5cb9so30829647b3.3; 
 Sat, 14 Jun 2025 09:56:32 -0700 (PDT)
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
X-Inumbo-ID: 859cbe8c-4940-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749920191; x=1750524991; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57YZdmcj8pxvunihyyOa15jxBR/jdBA4jxHwGJ8fFs0=;
        b=cDmHTf82aCNByE9Yc71GhkBo2WAN2bSd8S0KbxKHtWwl5V1WSDekPGUL/7Rk6SmNo7
         7sNL0dWoYukU+4EGsLwqfEpPtb/+LTCx5sJs7EIOH2KnebMEAP0ngoYZ71W6xJ2Kgeag
         qZyyT/0SLhPUrAvYP2SpFV1GCpt6+ZyExo3rwPn9aI9e+GH3vR6wFDFBTZWKmjgDeoGN
         ETUllH+3DLOsrt7Psg2mMwQswcnLo0OiCDn4d0R4gykdJilsD+zaqSMvD+6LX0XHOp8J
         ztneqmXKTn1wxRWXlVlCPs7hujSlCSa/58pXqntpZ0S1dgeIBZ5wVUcRFIxwcFZ0J4mI
         JbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749920191; x=1750524991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57YZdmcj8pxvunihyyOa15jxBR/jdBA4jxHwGJ8fFs0=;
        b=EK5hHy1XVE/2AOdAkooHun/d3CZ/l2h4HSXXXPaZ3ws1qbA3oq40ZiYsFRqJdWqzH5
         af/69uIMD+OrefoxL2os6orvabgUvzS+3yx9bKBZl4D3NggVTfCFCaF8424bpv+5V/yk
         Ma4O6W0749YGyiURcWKeuU4OKQC0+smzJdLGvCX1GRuQovQRD9q+QmAtYcgxmKieQzMx
         qrDDD2Cvv651QzhbFPIXyQ70PCVECo5g7aYtzfIKE96L1Nv4ZEq4Tb1RBOYqMgFD8HRP
         DlQ67kSPXCjO0lu8fBY3T9RC+ToJhdJLo6+sC8MD3zWhtB/+c3hS1n9JiLpFFSC87AqI
         W4qg==
X-Forwarded-Encrypted: i=1; AJvYcCVwR8oOjHQVri6xeSIQFiPDLnJ1+0W/CdDSr3LCwVbSSx0X02l7XgrY7iUms05gbhJXvYehj3+Wn9I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEz3BB7PQu1p5eXka7lMPvVWwPUaZMderM9UGt/sMIByGbWBPf
	BTwTtbbx55Ya97DwJ4cpyJGDRs7gPLagUfzSvbWGZ12iVluntbhf+FC1jSvsf1RgoduR1YvHLpL
	4J28XL1+nTp6vJNNUab0Irp9S+wCpSN8=
X-Gm-Gg: ASbGncvg4Of3pdEM118hFyX7WmjjQdBsY+mbA1SKxcSrQWVfP3TrKWOIN5c2V3CXbhv
	Nq4RwmivB4oC5ql0foM1jWASELwdBBH230ElWpcVb14VZOBfBwsA5jFjBnQcPA5h+ipOCZoAUlD
	NyUuNPpxt/DfMpMxO8VS+G5G9oVjQPWocXODwmK1BW
X-Google-Smtp-Source: AGHT+IGiNrtalb4MqdAMJLaPjMcpCr6qlE1/JiVqtQyXZ3s0U5V67Jes0z7IMSZtxydESAGuVfIDSonkvZ74BYwoo04=
X-Received: by 2002:a05:690c:881:b0:70e:779:7e6a with SMTP id
 00721157ae682-7117543136fmr48735997b3.22.1749920191150; Sat, 14 Jun 2025
 09:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250321092451.17309-1-jgross@suse.com> <20250321092451.17309-7-jgross@suse.com>
In-Reply-To: <20250321092451.17309-7-jgross@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Sat, 14 Jun 2025 12:56:20 -0400
X-Gm-Features: AX0GCFsQc_7JQjDEeTpyXiRlVMtWJznxeSDLm-k3l0EiyYD_6g9G_3l3BTKJE_A
Message-ID: <CAKf6xpuUUyMwbOR-J7K4RDaVxb6vbH0720D-D0TjOLzNHXH5tw@mail.gmail.com>
Subject: Re: [MINI-OS PATCH 06/12] kexec: reserve memory below boundary
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, 
	samuel.thibault@ens-lyon.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 5:31=E2=80=AFAM Juergen Gross <jgross@suse.com> wro=
te:
>
> In order to support kexec any memory used during copying the new
> kernel to its final destination must not overlap with the destination
> area.
>
> In order to achieve that add a new interface allowing to mark all
> allocatable memory below a specific physical address as not available.
>
> This is done by walking through all chunks of the buddy allocator and
> removing the chunks (or chunk parts) below the boundary. The removed
> chunks are put into a list in order to be able to undo the operation
> in case kexec is failing before doing any unrecoverable system
> modifications.
>
> Any pages freed located below the boundary need to go directly into
> the list of reserved pages instead of the free pool.
>
> Call the new function from kexec code.
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

