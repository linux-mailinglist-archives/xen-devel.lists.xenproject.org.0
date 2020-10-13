Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD4128CED7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:00:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6190.16395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJuO-0000WI-IY; Tue, 13 Oct 2020 13:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6190.16395; Tue, 13 Oct 2020 13:00:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJuO-0000TT-FM; Tue, 13 Oct 2020 13:00:04 +0000
Received: by outflank-mailman (input) for mailman id 6190;
 Tue, 13 Oct 2020 13:00:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSJuN-0000KO-6c
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:00:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 853db183-e550-4a70-9650-3f3948a48bd8;
 Tue, 13 Oct 2020 13:00:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSJuN-0000KO-6c
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:00:03 +0000
X-Inumbo-ID: 853db183-e550-4a70-9650-3f3948a48bd8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 853db183-e550-4a70-9650-3f3948a48bd8;
	Tue, 13 Oct 2020 13:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602594001;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=eEF6d00dX+EFEhC2CkJXfcJ8wfv347Sg+dKbe2ODmsg=;
  b=WMD8MnIHw7O+U/AFtgxP+jC+iaOlTua2Z2zmxuddUB5JcS+O02KNcR6F
   kOZFtfrycHrzkPAK8vvhUBFX/nUTGpCLKX3mMbAmF419Xt/M3Mknf0NiJ
   GGaSa4jXSAmwEYJnyadpGKQKF/f+4VxpWsD0XlQ29lw2/oTnLmQBPeGnd
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jHa7RTY4w4WYvuOHfw1dKr/I1brbYdIvUy62gGMaQ+GkHGshu7VhSS0qE5qjZJXtVpp+uMQMaU
 2WkAmLtJz+73iC2/P5Tkc8Tvm8wmPyEhIcOhYMIuQgi6e1xIf8VNabWRsw+fIH9AU7NHk8PObY
 Ky4qnyGzZh7qgSAgiuofcc4Bw9IYTXAZUTcHIXbF6hX8NSIZG0sZprMlqUDj+/fIzdIqyEvuMv
 3so4zjta87qPVS94D6AsyBMEOC3hK70OgCtqxMUpiONZjsma+lrDLXvJXWD6kNq0HJGSk4VUO5
 AtA=
X-SBRS: 2.5
X-MesageID: 29135935
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,370,1596513600"; 
   d="scan'208";a="29135935"
Subject: Re: [PATCH] hvmloader: flip "ACPI data" to ACPI NVS type for ACPI
 table region
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, <andrew.cooper3@citrix.com>,
	<roger.pau@citrix.com>, <wl@xen.org>, <iwj@xenproject.org>
References: <1602586216-27371-1-git-send-email-igor.druzhinin@citrix.com>
 <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <83f567a1-35f3-a227-830b-a59b53217f3b@citrix.com>
Date: Tue, 13 Oct 2020 13:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <56bea9a9-2509-cc39-a6fd-fb7db3e54d71@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/10/2020 13:51, Jan Beulich wrote:
> On 13.10.2020 12:50, Igor Druzhinin wrote:
>> ACPI specification contains statements describing memory marked with regular
>> "ACPI data" type as reclaimable by the guest. Although the guest shouldn't
>> really do it if it wants kexec or similar functionality to work, there
>> could still be ambiguities in treating these regions as potentially regular
>> RAM.
>>
>> One such an example is SeaBIOS which currently reports "ACPI data" regions as
>> RAM to the guest in its e801 call. The guest then tries to use this region
>> for initrd placement and gets stuck.
> 
> Any theory on why it would get stuck? Having read the thread rooting
> at Sander's report, it hasn't become clear to me where the collision
> there is. A consumer of E801 (rather than E820) intends to not use
> ACPI data, and hence I consider SeaBIOS right in this regard (the
> lack of considering holes is a problem, though).

QEMU's fw_cfg Linux boot loader (that is used by our direct kernel boot method)
is usign E801 to find the top of RAM and places images below that address.
Since now it's 0xfc00000 it gets located right in a PCI hole below - which causes
the loader to hang.

>> --- a/tools/firmware/hvmloader/e820.c
>> +++ b/tools/firmware/hvmloader/e820.c
>> @@ -202,16 +202,17 @@ int build_e820_table(struct e820entry *e820,
>>      nr++;
>>  
>>      /*
>> -     * Mark populated reserved memory that contains ACPI tables as ACPI data.
>> +     * Mark populated reserved memory that contains ACPI tables as ACPI NVS.
>>       * That should help the guest to treat it correctly later: e.g. pass to
>> -     * the next kernel on kexec or reclaim if necessary.
>> +     * the next kernel on kexec and prevent space reclaim which is possible
>> +     * with regular ACPI data type accoring to ACPI spec v6.3.
> 
> Preventing space reclaim is not the business of hvmloader. As per above,
> an ACPI unaware OS ought to be permitted to use as ordinary RAM all the
> space the tables occupy. Therefore at the very least the comment needs
> to reflect that this preventing of space reclaim is a workaround, not
> correct behavior.

Agree to modify the comment.

> Also as a nit: "according".
> 
> As a consequence I think we will also want to adjust Xen itself to
> automatically disable ACPI when it ends up consuming E801 data. Or
> alternatively we should consider dropping all E801-related code (as
> being inapplicable to 64-bit systems).

I'm not following here. What Xen has to do with E801? It's a SeaBIOS implemented
call that happened to be used by QEMU option ROM. We cannot drop it from there
as it's part of BIOS spec.

Igor

