Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1BA092E0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869679.1281136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFcK-0001zu-1G; Fri, 10 Jan 2025 14:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869679.1281136; Fri, 10 Jan 2025 14:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWFcJ-0001y6-TK; Fri, 10 Jan 2025 14:04:03 +0000
Received: by outflank-mailman (input) for mailman id 869679;
 Fri, 10 Jan 2025 14:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOMD=UC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tWFcI-0001xu-Nm
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:04:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb38378-cf5b-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 15:04:00 +0100 (CET)
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1736517829573868.3192042071445;
 Fri, 10 Jan 2025 06:03:49 -0800 (PST)
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
X-Inumbo-ID: bcb38378-cf5b-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1736517836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TJgHbNDERtnMhBUvbXxKLEgQz+940+G8ZWZ6U8E0htBFw+a9WGogdAa+haMZLtixhb7Zz3o9zNg5LaIUN6yNQ56fxlfBTvB8aY98mY5ndBqDpav/OX/VXJhbRhozL3lnwXOEV9iEOV01IemY1dVHeiEvH0vZvn8K3VAYYMN+uHE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736517836; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=igYZXyfAvgPFB34XbCdj4dNoIGaNITLAl7eWqXkKCwE=; 
	b=TTd0rTfkO2jtH5tYSPEYPnuRmWX5Wb3rm0Xef1/cJHDrQXSY0MMf+3xn7M3oYwn9x6uRxVjBznEz0uswwYCw1NvVcuN0saoheLxKGvRXXVsxUlavxfci/EaV+w5fxtcfSYOzalc2EU6Kngz6nWHLzqL0N7wlWwZMPYZICaufN2E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736517836;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=igYZXyfAvgPFB34XbCdj4dNoIGaNITLAl7eWqXkKCwE=;
	b=L+Vq/XbmuufSAv5A1fmD1U1aP4MwMgedufuM4tc8a7B2fONWU4qj7xhn2iS+2cH2
	5xLsZpZI/9kxWAVNY71u6rd4GwOBNeqCnU/mnIEHmbTza1K0yizuhYg/KXIugKm+elY
	LAjfbkUH5yCl+s0AGU/GavEMU18g0QR5jvFejs14=
Date: Fri, 10 Jan 2025 09:03:49 -0500
From: Daniel Smith <dpsmith@apertussolutions.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Cc: "openxt" <openxt@googlegroups.com>,
	"Christopher Clark" <christopher.w.clark@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <194508743ac.be65a5e2248998.5521251650313228304@apertussolutions.com>
In-Reply-To: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
References: <20250110133711.3958202-1-dpsmith@apertussolutions.com>
Subject: Re: [PATCH 0/2] Enable the ability to disable/remove gnttabv2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

---- On Fri, 10 Jan 2025 08:37:09 -0500 Daniel P. Smith  wrote ---

 > OpenXT has carried a patch for some time that allows the disabling and removal 
 > of the grant table v2 capability. This is a rework of that patch in an attempt 
 > to make an upstreamable series. 
 >  
 > The original patch was developed under funding provided by BAE, therefore a 
 > separate Authored-by tag to reflect that is included. 

Apologies as I should have added a "--suppress-cc=misc=by". If you want to avoid bounce messages, I would recommed dropping the BAE address on response.

v/r,
dps



