Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B0D3110D1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 20:12:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81905.151486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86Ws-0007St-An; Fri, 05 Feb 2021 19:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81905.151486; Fri, 05 Feb 2021 19:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l86Ws-0007SU-7X; Fri, 05 Feb 2021 19:12:30 +0000
Received: by outflank-mailman (input) for mailman id 81905;
 Fri, 05 Feb 2021 19:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EJWk=HH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1l86Wq-0007Ra-5N
 for xen-devel@lists.xen.org; Fri, 05 Feb 2021 19:12:28 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9436b2c5-dc7c-46a5-adc2-56ca87cebc9c;
 Fri, 05 Feb 2021 19:12:26 +0000 (UTC)
Received: from [10.10.1.24] (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1612552337163336.71227547137937;
 Fri, 5 Feb 2021 11:12:17 -0800 (PST)
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
X-Inumbo-ID: 9436b2c5-dc7c-46a5-adc2-56ca87cebc9c
ARC-Seal: i=1; a=rsa-sha256; t=1612552339; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BbvK+mv5YHPYOxZLycAb7WDtLVq1TQjqOtUuvE4O+u/0JD/pNSAdQ/k4VC1T31twNMzRBtlGk5+qzsjAN0UbVDAFthhsNR8EDWHFWsk/w6N7Un3HTJqnV7S7DjTIpeW6nUfcmA/xAYuJOb9gicIaty6Z4KWXjNZAY7glbMFPFB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1612552339; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=PIKvVobs4kXtJycHP8jJuBx2XuoxReoi4j0/1WaJWSQ=; 
	b=L90WRJSEygdluiEmSRSPqgVOprEzdb0qEjYDtLt5N6q1Bfw7zVbJN60PtBf1zhSdbBcevF60AxDJmcDIqMREthZfphO+jRQn5MctGb62FPvSmUIxIR+c2FkSue6kOVCoM7Dr7T8+tcxsMrOfesoyOUsfInOB/hWaHVVEtGoNcLQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1612552339;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PIKvVobs4kXtJycHP8jJuBx2XuoxReoi4j0/1WaJWSQ=;
	b=Vpc7YdTQ0vY40/s8u79RhbX3fCWB2GKmtKwletRAj4bhhdUKanVXQ7qXNQ9l3Gkk
	1S3/dHLjHAxXUz2eWNhOmcLa46RWoiXczsidIF5zzH/zSJ44DrTVKZHq0pJgLrgxPYO
	AGxRMmxVpH51hmdFmkglo7GGwJ7HnvYi93cCJ+Vs=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, bertrand.marquis@arm.com, roger.pau@citrix.com,
 julien@xen.org, Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Rich Persaud <persaur@gmail.com>, adam.schwalm@starlab.io
Message-ID: <d0b1a7d1-2260-567b-fd8d-04e32a3504f2@apertussolutions.com>
Subject: DomB Working Group
Date: Fri, 5 Feb 2021 14:12:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Greetings,

Per the community call on Feb. 4 I would like to get the working group
started that will be reviewing the major design decisions for the DomB
implementation. A summary of the discussion around the two primary
decisions we are seeking to get resolved are as follows,


Topic: DomB: Adoption of Device Tree as the format for the Launch
Control Module
* Consensus approval from x86 and Arm maintainers and members of the Xen
community on the call to proceed with Device Tree as the format for the
DomB LCM (described in the previous mailing list posts).

- a working group will follow up on the work for handling migration of
device tree handling code within the hypervisor, previously imported
from outside the project, from the Arm hypervisor code into Common.

Topic: DomB: Surfacing configuration data to guests: ACPI tables, Device
Tree
* Recommendation was that both will be needed, and OK to proceed with
just implementing one but plan and design for the second to be added.
First is likely to be ACPI; to be determined as development progress is
made.


To continue the discussion from there, I would like to propose a call on
Thursday February 11th at 1700UTC, 0900PST/1200EST/1800CEST. I have
provided call details below for those who are able to attend. The agenda
is available on CryptPad. If you are not able to attend, please reach
out directly. Thanks and hope to see everyone on the call!


Agenda
=3D=3D=3D=3D=3D=3D
https://cryptpad.fr/pad/#/2/pad/edit/iVEku8zImQg320a3D4IBAKQh/


Meeting Invite
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Daniel Smith's Meeting

Please join my meeting from your computer, tablet or smartphone.
https://www.gotomeet.me/apertussolutions

You can also dial in using your phone.
United States (Toll Free): 1 877 568 4106

Access Code: 691-818-141

More phone numbers:
Austria (Toll Free): 0 800 202148
Belarus (Toll Free): 8 820 0011 0400
Belgium (Toll Free): 0 800 78884
Bulgaria (Toll Free): 00800 120 4417
Canada (Toll Free): 1 888 455 1389
China (Toll Free): 4000 762962
Czech Republic (Toll Free): 800 500448
Denmark (Toll Free): 8025 3126
Finland (Toll Free): 0 800 917656
France (Toll Free): 0 805 541 047
Germany (Toll Free): 0 800 184 4222
Greece (Toll Free): 00 800 4414 3838
Hungary (Toll Free): (06) 80 986 255
Iceland (Toll Free): 800 7204
India (Toll Free): 18002669254
Ireland (Toll Free): 1 800 901 610
Italy (Toll Free): 800 793887
Netherlands (Toll Free): 0 800 020 0182
Norway (Toll Free): 800 69 046
Poland (Toll Free): 00 800 1124759
Portugal (Toll Free): 800 819 575
Romania (Toll Free): 0 800 400 819
Slovakia (Toll Free): 0 800 105 748
Spain (Toll Free): 800 900 582
Sweden (Toll Free): 0 200 330 905
Switzerland (Toll Free): 0 800 002 348
Ukraine (Toll Free): 0 800 60 9135
United Kingdom (Toll Free): 0 800 169 0432


New to GoToMeeting? Get the app now and be ready when your first meeting
starts: https://global.gotomeeting.com/install/691818141


V/r,

Daniel P. Smith

Apertus Solutions, LLC




