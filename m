Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF56856D1D0
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 00:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364767.594694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAfgE-00040V-Ni; Sun, 10 Jul 2022 22:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364767.594694; Sun, 10 Jul 2022 22:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAfgE-0003xL-Jy; Sun, 10 Jul 2022 22:45:34 +0000
Received: by outflank-mailman (input) for mailman id 364767;
 Sun, 10 Jul 2022 22:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=puvd=XP=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oAfgD-0003xE-JW
 for xen-devel@lists.xenproject.org; Sun, 10 Jul 2022 22:45:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9dc0ff-00a1-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 00:45:31 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1657493127012599.1201374894324;
 Sun, 10 Jul 2022 15:45:27 -0700 (PDT)
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
X-Inumbo-ID: ff9dc0ff-00a1-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1657493127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JAdxft4U/dGl7G2NbS3oW4Fm53+YpdXMX9q7j08jNY/vDWklWAeDxjISA7Pem+4w+XeuNx6K+JUlZ0VjVPdQBEO073sE2qIRfVE2bTLuLQxiMrv8wdavgl5tdAGMLpPJ4lpExY6m//fCoXjeAzbx8WfMYisQyYXc2EA0P/wtg7k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1657493127; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=Oqn85uxt8exJ+v7wpy4rjqedf0idozszMXWwTlRgr2A=; 
	b=JWktB5YXOIgawFPzFlzW5UzzMA0iSHeltib/KbAv0skR002GejT63SRynBe677H9gme4Y5SLhZPbRobUiTXgJNjpIK9Z9W31OjGoZ6yc0s3KOU/dmJkWL7VUqt+u0s4QegL1tkBeJZ99GFdc5ZeKU0f9V1c9BLR2+jyrXYi7EdE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657493127;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:From:From:Cc:Cc:To:To:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Oqn85uxt8exJ+v7wpy4rjqedf0idozszMXWwTlRgr2A=;
	b=LPSu2bN2zagJxlJ9BL8/3suENeF0ZL0VTg6l162uxm60TVi0YfXb7TZppTEbgkgi
	HCXv3TeyXaxpm9CIaJmAZo7P7wyboRFiHULM30jo6mmi0qMcjvSDzoIaZ+RDtC6k+SK
	riZLD+XUUQjIW6FM5DgEEv+cm51E7X0XXF3yFgI0=
Message-ID: <bb409564-0f4b-b59c-9a62-574028e6029b@apertussolutions.com>
Date: Sun, 10 Jul 2022 18:45:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>,
 "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "Brookes, Scott" <sbrookes@RiversideResearch.org>,
 "Lei, Jason" <jlei@RiversideResearch.org>,
 Scott Davis <scott.davis@starlab.io>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Hyperlaunch Working Group: Status and Next Steps (15JUL22)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Greetings All,

We will be holding a Hyperlaunch Working Group meeting on Friday, July
15th at 0900PDT/1200EDT/1700GMT. The agenda will be ready by Wednesday
and can be found at the below cryptpad link. Call-in details will be
published in the agenda once it has been set up.

Agenda:
https://cryptpad.fr/pad/#/2/pad/edit/0uw06jY29gjSJMxs8Q9CWipp/


-- 
V/r,
Daniel P. Smith
Apertus Solutions, LLC

