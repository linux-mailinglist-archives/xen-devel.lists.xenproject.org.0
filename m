Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26713465110
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 16:12:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236056.409422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msRGx-0002w1-Oo; Wed, 01 Dec 2021 15:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236056.409422; Wed, 01 Dec 2021 15:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msRGx-0002t5-L8; Wed, 01 Dec 2021 15:11:51 +0000
Received: by outflank-mailman (input) for mailman id 236056;
 Wed, 01 Dec 2021 15:11:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msRGw-0002sy-8z
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 15:11:50 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00fa01d6-52b9-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 16:11:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:50658)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msRGt-000gkq-iT (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 15:11:47 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 430F61FD7A;
 Wed,  1 Dec 2021 15:11:47 +0000 (GMT)
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
X-Inumbo-ID: 00fa01d6-52b9-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ae971612-71e2-2005-88cf-22006b7fc9b9@srcf.net>
Date: Wed, 1 Dec 2021 15:11:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Ian Jackson <ian.jackson@citrix.com>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <b53c7853-b53a-37a0-d3bb-81093b19f305@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 4/4] libxc: correct bounce direction in
 xc_get_device_group()
In-Reply-To: <b53c7853-b53a-37a0-d3bb-81093b19f305@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/12/2021 09:42, Jan Beulich wrote:
> The array of IDs is an output.
>
> Fixes: 79647c5bc9c6 ("libxc: convert domctl interfaces over to hypercall buffers")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Clearly the function, including its Python wrapper, cannot have been
> used by anything for many years. I wonder whether that isn't good enough
> a reason to sanitize the layout of the array elements: Right now they
> have BDF in bits 8...23, when conventionally this would be bits 0...15.

There is a lot of WTF with this hypercall.  It's obviously an attempt to
do the thing that Linux calls IOMMU groups now, except that the correct
way to do this would be for the group ID to be the unit of
assignment/deassignment.  (We need to do this anyway for other reasons.)

The last user was deleted with Xend (2013), which suggests that it was
broken for 3 years due to the incorrect bounce direction (2010).

Furthermore, it will arbitrarily fail if targetting domains without an
IOMMU configured, but everything else seems to be invariant of the
passed domain.  This should clearly be sysctl, not a domctl.


I suggest ripping all of this infrastructure out.  It's clearly unused
(and broken in Xen too - see patch 1), and not something which should be
used in this form in the future.

~Andrew

