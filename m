Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE44771F2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 13:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247930.427574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxq0F-000375-5J; Thu, 16 Dec 2021 12:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247930.427574; Thu, 16 Dec 2021 12:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxq0F-00034n-16; Thu, 16 Dec 2021 12:36:55 +0000
Received: by outflank-mailman (input) for mailman id 247930;
 Thu, 16 Dec 2021 12:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxq0D-000337-HY
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 12:36:53 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6e8c251-5e6c-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 13:36:50 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44428)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxq02-000qN8-0P (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 12:36:42 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id CBE6A1FAC8;
 Thu, 16 Dec 2021 12:36:41 +0000 (GMT)
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
X-Inumbo-ID: d6e8c251-5e6c-11ec-85d3-df6b77346a89
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <5286a1b7-3db5-1e00-f9bf-36fa537871b1@srcf.net>
Date: Thu, 16 Dec 2021 12:36:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [XEN PATCH 14/57] tools/flask/utils: remove unused
 variables/targets from Makefile
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@gmail.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-15-anthony.perard@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206170241.13165-15-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 17:01, Anthony PERARD wrote:
> @@ -35,21 +29,13 @@ flask-set-bool: set-bool.o
>  
>  .PHONY: clean
>  clean: 
> -	rm -f *.o *.opic *.so
> +	rm -f *.o
>  	rm -f $(CLIENTS)
>  	$(RM) $(DEPS_RM)

Can we collapse this to $(RM) *.o $(CLIENTS) $(DEPS_RM) ?

Here and in plenty of subsequent patches, there's manipulation of raw
`rm -f`'s which ought to be cleaned up to $(RM)

I can fix this on commit if you're happy.

~Andrew

