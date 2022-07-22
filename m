Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA257E263
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 15:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373235.605336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsne-00080R-DH; Fri, 22 Jul 2022 13:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373235.605336; Fri, 22 Jul 2022 13:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEsne-0007xU-9l; Fri, 22 Jul 2022 13:34:38 +0000
Received: by outflank-mailman (input) for mailman id 373235;
 Fri, 22 Jul 2022 13:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oEsnc-0007xO-Np
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 13:34:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05b4143d-09c3-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 15:34:35 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658496870909100.07187457516591;
 Fri, 22 Jul 2022 06:34:30 -0700 (PDT)
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
X-Inumbo-ID: 05b4143d-09c3-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658496872; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K3KXLnLBM/sDDCTJ/1cAFcvt+/nyCR0WJaJC+3c0WMDNVV15bIe7Pn7zFbdb+OYNlijn4beWdXmfLLnYgd7/sqo8uWvGLleWEk7tkq71OOKgnX3ez+bWB2LTtMnDtirVjmns0mPSD8KQswtC84rEeVu+JRGuZt1zjtL4ZrphXFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658496872; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=eWYmUzB8UzAGnireUWQ3+Nj0NSCC3ugxXIDD+vcIowU=; 
	b=LMw5Bc3Ed+ngEEx+VRNK9IfGMSb9TQPg//2ttoO5kj12dzj4A0DsE5aOs/qEe0RvTrZ44yqsaxDi+vBD6L2V7FJS0qGhX3mz7qrDJuDID0FGCirXK5w+OHJOETd/UUguwLOmqrLANKvYRdjTig9f8sKfqoDMU15KbvtnCmBhsTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658496872;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=eWYmUzB8UzAGnireUWQ3+Nj0NSCC3ugxXIDD+vcIowU=;
	b=RVK+gKwIgZdkKCjzL2QFEp9g8XaxDoIajqEx5YAbnGrwwl6zuH/QxDg23IyUVBNG
	55noLw5GWH6lrmImK6rllnmvz0/OuzJH6xfMnQWE8tKCakKDi8v5fX/ndfZai1vNG9z
	5aLLWczMfes4oY07kSDBIg2rAjnFpcs6m1iV1cWE=
Message-ID: <b8a6a280-e875-d36d-cbc3-7aae5e43324b@apertussolutions.com>
Date: Fri, 22 Jul 2022 09:34:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Smith, Jackson" <rsmith@RiversideResearch.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "scott.davis@starlab.io" <scott.davis@starlab.io>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-8-dpsmith@apertussolutions.com>
 <BN0P110MB16421791FEF39C8693134462CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 07/18] docs: update hyperlaunch device tree
 documentation
In-Reply-To: <BN0P110MB16421791FEF39C8693134462CF8C9@BN0P110MB1642.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 7/18/22 09:57, Smith, Jackson wrote:
> Hi Daniel,
> 
>> -----Original Message-----
>> Subject: [PATCH v1 07/18] docs: update hyperlaunch device tree
>> documentation
> 
> 
>> diff --git a/docs/designs/launch/hyperlaunch-devicetree.rst
>> b/docs/designs/launch/hyperlaunch-devicetree.rst
>> index b49c98cfbd..ae1a786d0b 100644
>> --- a/docs/designs/launch/hyperlaunch-devicetree.rst
>> +++ b/docs/designs/launch/hyperlaunch-devicetree.rst
>> @@ -13,12 +13,268 @@ difference is the introduction of the ``hypervisor``
> 
>> +
>> +The Hypervisor node
>> +-------------------
>> +
>> +The ``hypervisor`` node is a top level container for the domains that
>> +will be
>> built
>> +by hypervisor on start up. The node will be named ``hypervisor``  with
>> +a
>> ``compatible``
>> +property to identify which hypervisors the configuration is intended.
> ^^^ Should there be a note here that hypervisor node also needs a compatible 
> "xen,<arch>"?

Ack.

>> +The
>> hypervisor
>> +node will consist of one or more config nodes and one or more domain
>> nodes.
>> +
>> +Properties
>> +""""""""""
>> +
>> +compatible
>> +  Identifies which hypervisors the configuration is compatible. Required.
>> +
>> +  Format: "hypervisor,<hypervisor name>", e.g "hypervisor,xen"
> ^^^ Same here: compatible "<hypervisor name>,<arch>"?

Ack.

>>  Example Configuration
>>  ---------------------
>> +
>> +Multiboot x86 Configuration Dom0-only:
>> +""""""""""""""""""""""""""""""""""""""
>> +The following dts file can be provided to the Device Tree compiler,
>> +``dtc``,
>> to
>> +produce a dtb file.
>> +::
>> +
>> +  /dts-v1/;
>> +
>> +  / {
>> +      chosen {
>> +          hypervisor {
>> +              compatible = "hypervisor,xen";
> ^^^^^^^^  compatible = "hypervisor,xen", "xen,x86";

Ack.

>> +
>> +              dom0 {
>> +                  compatible = "xen,domain";
>> +
>> +                  domid = <0>;
>> +
>> +                  permissions = <3>;
>> +                  functions = <0xC000000F>;
>> +                  mode = <5>;
>> +
>> +                  domain-uuid = [B3 FB 98 FB 8F 9F 67 A3 8A 6E 62 5A 09
>> + 13 F0
>> 8C];
>> +
>> +                  cpus = <1>;
>> +                  memory = <0x0 0x20000000>;
> ^^^^^^^^^^ memory = "2048M";
> Needs to be updated to new format for mem.

Ack.

>> +
>> +                  kernel {
>> +                      compatible = "module,kernel", "module,index";
>> +                      module-index = <1>;
>> +                  };
>> +              };
>> +
>> +          };
>> +      };
>> +  };
>> +
> 
> Similar adjustments are needed for the rest of the examples I believe.
> 
> Also, two typos:
> Line 287 is missing a line ending semi-colon.
> Line 82 has a double space between 'node' and 'may'.

Ack.

v/r,
dps

