Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D5433113E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95002.179173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHFD-0005Rp-PX; Mon, 08 Mar 2021 14:52:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95002.179173; Mon, 08 Mar 2021 14:52:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJHFD-0005Qx-KI; Mon, 08 Mar 2021 14:52:27 +0000
Received: by outflank-mailman (input) for mailman id 95002;
 Mon, 08 Mar 2021 14:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3/5=IG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lJHFB-0005QH-Tk
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:52:25 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 898f1e11-6962-457e-ae67-7cf5648fbd22;
 Mon, 08 Mar 2021 14:52:25 +0000 (UTC)
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
X-Inumbo-ID: 898f1e11-6962-457e-ae67-7cf5648fbd22
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615215145;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XQkacuw92YZ6s7P1uWP7jgpIFq+z/6x0But1e7Mt5q4=;
  b=N74eB0jPPR4l7lHRWx+z37Rbseo4j0u7TI7ll7mJwmu4e5jS45Mj8yr4
   FZyCREXQ4LMALatlfmBZv2n47Ck18eYUKrX5XCLP8BuJiild61HEXtCWs
   N2sZoAjQTLvCw9TMAYa3cE2pPizGNGtVoDVdXCIdLnNtOUa1QvXknEVTk
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jRy1UYqBSfW2yl9OZHRJd41YtrqxamoXGfBvcIC8zZyj/eXMKgZVnxkaE89Y8aiHCK5VsGf3ib
 YTSKMxSAA0PmqhBspGhMbcOI8HvOmBPEXmhzxwpTdipw6XhLJDBG4cEbyNyWUelZbdsgztmzZD
 SRXxRdHFIt5/TsCpNwJP8e9RjyRLUzK5jppGEJZOA9YO8xHhSOW58JEvRHu7SjtkIgzbRTiHV9
 qqnzxs0sV4yobwj29RdIwtUvwRRAPq485gN+Sq6lZ9I7zeYZWHeXlVRrh5WgU5J/OsumEm95wy
 ufo=
X-SBRS: 4.0
X-MesageID: 38957321
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38957321"
Subject: Re: [PATCH for-4.15] vtd: make sure QI/IR are disabled before
 initialisation
To: Jan Beulich <jbeulich@suse.com>
CC: <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<kevin.tian@intel.com>, <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>
References: <1615186802-5908-1-git-send-email-igor.druzhinin@citrix.com>
 <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ce950c68-1d44-bcbd-b071-131777b87a38@citrix.com>
Date: Mon, 8 Mar 2021 14:52:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <de357605-ef0c-82ba-0ae2-ef96f1dd23f3@suse.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/03/2021 08:18, Jan Beulich wrote:
> On 08.03.2021 08:00, Igor Druzhinin wrote:
>> BIOS might pass control to Xen leaving QI and/or IR in enabled and/or
>> partially configured state. In case of x2APIC code path where EIM is
>> enabled early in boot - those are correctly disabled by Xen before any
>> attempt to configure. But for xAPIC that step is missing which was
>> proven to cause QI initialization failures on some ICX based platforms
>> where QI is left pre-enabled and partially configured by BIOS.
> 
> And those systems then tell us to avoid use of x2APIC? I would have
> expected that on modern systems we wouldn't see such quirky firmware
> behavior anymore. Anyway, half a sentence to this effect might help
> here, as without such firmware behavior the only way to run into
> this ought to be use of "no-x2apic" on the command line. Which in
> turn might require justification (and potentially a fix elsewhere in
> the code to make use of that option unnecessary).
> 
>> Unify the behaviour between x2APIC and xAPIC code paths keeping that in
>> line with what Linux does.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with some editing of the description. If no other need for a v2
> arises, I suppose whatever you come up with could be folded in
> while committing.

How about:

"... But for xAPIC that step is missing which was proven to cause QI 
initialization failures on some ICX based platforms where QI is left 
pre-enabled and partially configured by BIOS. That problem becomes hard 
to avoid since those platforms are shipped with x2APIC opt out being 
advertised by default at the same time by firmware.
..."

Igor

