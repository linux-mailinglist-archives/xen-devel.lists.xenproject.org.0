Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FACA1B377
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 11:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876643.1286995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbGsx-000845-VJ; Fri, 24 Jan 2025 10:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876643.1286995; Fri, 24 Jan 2025 10:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tbGsx-00081U-Rs; Fri, 24 Jan 2025 10:25:59 +0000
Received: by outflank-mailman (input) for mailman id 876643;
 Fri, 24 Jan 2025 10:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkuS=UQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tbGsw-00081K-Qn
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2025 10:25:58 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95df7bbd-da3d-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 11:25:51 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so3897141a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jan 2025 02:25:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186397c0sm972585a12.35.2025.01.24.02.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 02:25:55 -0800 (PST)
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
X-Inumbo-ID: 95df7bbd-da3d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737714356; x=1738319156; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SH3d1P09sjphp9Rwg2Fq0xkJcIR7BrUleRchqAoxUeA=;
        b=C9gz/+HOqlkeiGoUaJORVbBGlo1I8g27cHmeN6XqjQpR99YVn8xlsTz41Y0lHFND33
         fyylSD8nZmFSXGg3cz8fdq6TbS9gHrVAsklv02NiqG13t4ZCDwEHQxfw4Nt7Y3RI7pQU
         sOLfzSjA1Cqbtb4lz0BQ8w2CMnJxzLaSIZ4Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737714356; x=1738319156;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SH3d1P09sjphp9Rwg2Fq0xkJcIR7BrUleRchqAoxUeA=;
        b=pYiASPvWU/NZwpW5/34aatYFAdLeYTCbraTYgMV2NrwZfR2lO9Aq/evjVSXZcmZqEt
         N0F15YkzQe9B5wNwy0SKDQLpc21BSwmcuac2eYgYCP5km0nz06wKv3bJ5636dDijJ3aA
         AVq+RyudYLiEY6sCsrKeGWUL8wXpYn4+tZvtz6BLwrQOGvX3ZuqDqzXlb1JnAIECxDDX
         CAYXnSaSPSRfGjYUT1DOotcq5Dv8+1r8RZrhGB9L4B/7uLgPF045lf9CGR+TTFQkI3s3
         UHW+k8RSgxe4bAqVO1dTeVDS3wZSij84mzkX5oKu5UT0DMSes/7FsU8V/GkVkdhIDisn
         EGGg==
X-Gm-Message-State: AOJu0YxFx2ODUafWCE3lGSEG16bqTrVwOB+HIiHxSQrnrzVk52V0NylQ
	4xYa/oEDKnNL/fqOKN0egC5ze41pIlUU3Z1ZPDPKMgKEqulWjKjHKWHP/T4iCLk=
X-Gm-Gg: ASbGnctOGZRN4TsrA0fbnRslsU6JSVPBAv10VtOwRfOXfXJOLHtAuKWLSNaqeMkjmNo
	byROO/qbIe1N3GrDZ9/dfuv133E/NAVmbf1NgtxIyds3eMQOrycBFdcBBhJD8KL/1cEyqICqU+E
	DUl8G29rH18G9f8xfWuDmDXZPAPZYxatYxs+qF2L6xBkcVJgaAfjy9RQf2eJAT/pP8vF0xUtcFQ
	XKO6a5Y+u5zfNHVUDcMJbw6FL7MP6z2K+FjkpzhsjAnFnmBKojo/BNXMExko5ftkLdcAtN/lD9/
	xNAzsFwMrw==
X-Google-Smtp-Source: AGHT+IH+J+vsQnuFLNc0JbXT53jFl5cytesOIiEr/rEfOWpmpBpAWFY13ohqKSq9aCc/0YgyQrgBRQ==
X-Received: by 2002:a05:6402:51cd:b0:5d3:e4eb:8d1f with SMTP id 4fb4d7f45d1cf-5db7d2fc8b0mr25384463a12.12.1737714356275;
        Fri, 24 Jan 2025 02:25:56 -0800 (PST)
Date: Fri, 24 Jan 2025 11:25:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 01/12] VMX: don't run with CR4.VMXE set when VMX could
 not be enabled
Message-ID: <Z5NqsmsuVfQcOcMg@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <21e6cbec-dc29-452f-b6a2-6926245a8beb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21e6cbec-dc29-452f-b6a2-6926245a8beb@suse.com>

On Mon, Feb 26, 2024 at 05:42:02PM +0100, Jan Beulich wrote:
> While generally benign, doing so is still at best misleading.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

