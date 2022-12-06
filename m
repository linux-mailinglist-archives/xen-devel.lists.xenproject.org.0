Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F80B644A47
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455379.712829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bg6-0002tg-SH; Tue, 06 Dec 2022 17:24:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455379.712829; Tue, 06 Dec 2022 17:24:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2bg6-0002rN-Ov; Tue, 06 Dec 2022 17:24:22 +0000
Received: by outflank-mailman (input) for mailman id 455379;
 Tue, 06 Dec 2022 17:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZZAw=4E=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p2bg5-0002rH-Er
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:24:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d19be49a-758a-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 18:24:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F6E8B81714;
 Tue,  6 Dec 2022 17:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1929C433C1;
 Tue,  6 Dec 2022 17:24:16 +0000 (UTC)
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
X-Inumbo-ID: d19be49a-758a-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670347458;
	bh=3D4r97ph0scMN694s1arrM5jaJ2W/XQZ6eF/9JRyiHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uhWZZyCo0aR82x7Tkew/wrK0piYMApUbSdGUrSNErgkUG/6Cu99SP10KAoEdr+LRe
	 JxH+jLUxCU1tDqCMGOGTHzKna2jp7EbpOFljdTq7GGsBuFY2suY7YOSrGkLoNyysOP
	 BaRG66mCERvBpyO79cmh+0pv0pNM7WlZWP2j20fVgdJriV6VRPMai9FrdKJ9/qY++7
	 ZJQTC555ibRLS+Y/OXHGEzxKkDcHDUYAgh87Pv7Tp8Dp9QogT2kBR4SogRIdYEL9/8
	 dEnbzko2MNc2wQQaqxkaS9U4j8kI1ibkcbEiv0rKB29G7j+46b434ccTS2ZAZoA3C1
	 VMYiiQDMip6gg==
Date: Tue, 6 Dec 2022 09:24:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/5] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
In-Reply-To: <40F42492-9DFF-46DA-BF1A-7393CE29202C@arm.com>
Message-ID: <alpine.DEB.2.22.394.2212060922230.4039@ubuntu-linux-20-04-desktop>
References: <20221205154052.14191-1-luca.fancellu@arm.com> <20221205154052.14191-3-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2212051650300.4039@ubuntu-linux-20-04-desktop> <E67F8041-D3D1-4A8A-9A8F-319C522CB0D5@arm.com> <alpine.DEB.2.22.394.2212060858180.4039@ubuntu-linux-20-04-desktop>
 <40F42492-9DFF-46DA-BF1A-7393CE29202C@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1764806118-1670347458=:4039"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1764806118-1670347458=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 6 Dec 2022, Luca Fancellu wrote:
> > On 6 Dec 2022, at 17:06, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Tue, 6 Dec 2022, Luca Fancellu wrote:
> >> Hi Stefano,
> >>>> 
> >>>> +++ b/docs/misra/false-positive-cppcheck.json
> >>>> @@ -0,0 +1,12 @@
> >>>> +{
> >>>> +    "version": "1.0",
> >>>> +    "content": [
> >>>> +        {
> >>>> +            "id": "SAF-0-false-positive-cppcheck",
> >>>> +            "violation-id": "",
> >>>> +            "tool-version": "",
> >>>> +            "name": "Sentinel",
> >>>> +            "text": "Next ID to be used"
> >>>> +        }
> >>>> +    ]
> >>>> +}
> >>> 
> >>> I think we need to add to the cppcheck document how to figure out the
> >>> cppcheck id for a given violation in the html report
> >> 
> >> I’m planning to send some patches with cppcheck false positive fixes, would them be enough?
> >> 
> >> We already have a section in documenting-violation.rst on how to document the finding, for
> >> cppcheck it’s just a matter to get the text report, do you think it’s better to add a part to that section
> >> on how to locate the cppcheck violation id from its text report?
> > 
> > Examples would certainly help a lot. Looking at the html results it
> > wasn't clear to me what the violation-id actually was. It took me a few
> > tries to understand that "shadowVariable" was the cppcheck violation-id.
> > 
> > Maybe just add: look under the column "Defect ID" amoung the html
> > results to find the violation-id, such as "variableScope".
> 
> I was thinking about showing where to locate the violation ID from the text report, do you think it’s better
> to give an example from the HTML report instead?

I haven't used the text report, only the HTML report, so far. Maybe you
could document both.


> So far I have added this part to the bottom of documenting-violations.rst:
> 
> Also, the same tag can be used on other symbols from the linker that are
> declared in the codebase, because the justification holds for them too.
> 
> A possible violation found by Cppcheck can be handled in the same way, from the
> cppcheck report it is possible to identify the violation id:
> 
> | include/public/arch-arm.h(226,0):misra-c2012-20.7:style:Expressions resulting from the expansion of macro parameters shall be enclosed in parentheses (Misra rule 20.7)
> 
> Given the violation id "misra-c2012-20.7", we can follow the procedure above to
> justify the finding.

Yes that makes sense, and maybe add something similar for the html
report
--8323329-1764806118-1670347458=:4039--

