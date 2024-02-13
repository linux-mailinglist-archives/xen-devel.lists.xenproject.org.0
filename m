Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30C7852FBC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 12:42:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679867.1057622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrAx-0001GA-FO; Tue, 13 Feb 2024 11:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679867.1057622; Tue, 13 Feb 2024 11:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZrAx-0001Cw-CE; Tue, 13 Feb 2024 11:42:11 +0000
Received: by outflank-mailman (input) for mailman id 679867;
 Tue, 13 Feb 2024 11:42:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnrE=JW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rZrAw-0000fG-8w
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 11:42:10 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebc41058-ca64-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 12:42:09 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3394b892691so2793568f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 03:42:09 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t17-20020a05600c199100b0041069adbd87sm11681216wmq.21.2024.02.13.03.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:42:08 -0800 (PST)
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
X-Inumbo-ID: ebc41058-ca64-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707824529; x=1708429329; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqKGq5Rihofp0wbN6VyPB/1V+A38BSfVOvDXOT3Q0hY=;
        b=Kip6C0i8V5nXcQpiNmrVVUfYPT1ACXwVltBBNzYQ+Q+w4C68kbVGthkbW1I8Lh42Tp
         nUwqAjyySmKGyUWg5PesBZi+ulkbsZcDU4IHKp6kbC1E2CpFhNVgDZxWm3lM5G4VAMeF
         sVuGNfIVUJpyrH89eBoqykh5c9n18LVsj/MwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707824529; x=1708429329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqKGq5Rihofp0wbN6VyPB/1V+A38BSfVOvDXOT3Q0hY=;
        b=HONacPQR2Hh4jixRvhiYg6btIrTSCxvfmbEd+pttfp7yetztEi1PMx0m96foiOoXUK
         zH+Y2U8D2oTv59+5eMYV7FWyisa0m/zBBUklU4cChMGgRYBuMY1g6/2KL2GduBxBeWGa
         ay5dPaqu2TyIgMEqX4Kzl11qr+KOtICfbtPKAGpswtmQ7w/X+JUecuQA6cufL9Lu0z3c
         tukvOYXE9M5SBM8xH4L2+fu4zNbpo0nUvJJl4NRRAbbGr4B3J/4g93hk/L2oTsKTmwJ1
         J1cNwPWcIy6HikJ1BHnZ3Lgw66HRJyKsw0wecMXizlq3EwAWkQTjpOGgTeYCnwlkCSE1
         TeFQ==
X-Gm-Message-State: AOJu0YyJfuOMB++7GtT3O5SOnjNL0xVi6iHaADLGQnHLkgh0ooDG6HnI
	SU40Ro1CxRl2UPaCPyqmF8rDFoWJB1dKaSuwI5ly3F10rdZLXuvvq0C0EdV6DVaP+btC40tS8zi
	i
X-Google-Smtp-Source: AGHT+IFJldikD4pD+qgUgBILN2mzEnuJ2H738k1u2ZLCaKjs/EPrgDobC1Aw+icE6v8e5yOULLV/OA==
X-Received: by 2002:a05:6000:136c:b0:33b:51d5:bd1c with SMTP id q12-20020a056000136c00b0033b51d5bd1cmr1722315wrz.12.1707824529148;
        Tue, 13 Feb 2024 03:42:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQuorW5H5DgdRpYxnAhRhSajAwwNhS6IdZmw7ScIIVCL2fEZaONcIqdYkUvB+EXm5mb1Z0+Q5UGV7Wwj/mVXjd9bSIgfQVdhmWbGNfgos1SL1J2lUgP981puFk/mkuyI1bGilVYVtPCl4rCWM=
Date: Tue, 13 Feb 2024 11:42:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, marmarek@invisiblethingslab.com,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] libxl: Create empty file for Phy cdrom
Message-ID: <5fac8d52-c07a-4e1d-b6e8-c47fcb4f12d0@perard>
References: <20240201214004.238858-1-jandryuk@gmail.com>
 <20240201214004.238858-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201214004.238858-2-jandryuk@gmail.com>

On Thu, Feb 01, 2024 at 04:40:02PM -0500, Jason Andryuk wrote:
> With a device model stubdom, dom0 exports a PV disk to the stubdom.
> Inside the stubdom, QEMU emulates a cdrom to the guest with a
> host_device pointing at the PV frontend (/dev/xvdc)
> 
> An empty cdrom drive causes problems booting the stubdom.  The PV disk
> protocol isn't designed to support no media.  That can be partially
> hacked around, but the stubdom kernel waits for all block devices to
> transition to Connected.  Since the backend never connects empty media,
> stubdom launch times out and it is destroyed.
> 
> Empty media and the PV disks not connecting is fine at runtime since the
> stubdom keeps running irrespective of the disk state.
> 
> Empty media can be worked around my providing an empty file to the
> stubdom for the PV disk source.  This works as the disk is exposed as a
> zero-size disk.  Dynamically create the empty file as needed and remove
> in the stubdom cleanup.
> 
> libxl__device_disk_set_backend() needs to allow through these "empty"
> disks with a pdev_path.
> 
> Fixup the params writing since scripts have trouble with an empty params
> field.
> 
> This works for non-stubdom HVMs as well.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

