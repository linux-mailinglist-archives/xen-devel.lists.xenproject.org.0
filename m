Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63760D7D9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430259.681732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTI0-0003eV-E9; Tue, 25 Oct 2022 23:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430259.681732; Tue, 25 Oct 2022 23:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onTI0-0003cS-BF; Tue, 25 Oct 2022 23:24:56 +0000
Received: by outflank-mailman (input) for mailman id 430259;
 Tue, 25 Oct 2022 23:24:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onTHy-0003cM-7A
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 23:24:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a3f551b-54bc-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 01:24:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 551CFB81FB6;
 Tue, 25 Oct 2022 23:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C49C433D6;
 Tue, 25 Oct 2022 23:24:49 +0000 (UTC)
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
X-Inumbo-ID: 3a3f551b-54bc-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666740290;
	bh=XKrymYmoOELPs01OO/UQUUQGqnqT3H/NVzD3tF0BGsI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tcaK0PZXe5g4NrpkXdH9l2NDD4AKXSW7sPsDLVRa9/mpb5MI+qkdZI2O8jdoMQ/yH
	 PfXvGZ6Z+JlFGYVQOsABboXBY1tDBMUuBYQnLPd9sA7aud7sZ4aqGAISBlrZSbaXKK
	 QYjFdWxHz6FAzIoByiLZaB/enRkUkB+OyuGV2693MhiPRIwoOv9Q89IQ/OzLfb9tSN
	 Zqfw93N5AEAZcp4+oQPEkmHb8hIPWlIGb/0CJMuv878UMzfPPtFe6Iy3/+DguO8vFX
	 Ny5ZZkt1EcNiHEnqwU94J2YtmFpd/8ZYQTRugB9O5q6y4vMSyXRwRIqIyTqN2/aazZ
	 SWMuifCaDmutQ==
Date: Tue, 25 Oct 2022 16:24:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [v2] Proposal for deviations in static analyser findings
In-Reply-To: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210251619090.1397955@ubuntu-linux-20-04-desktop>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-355867395-1666739992=:1397955"
Content-ID: <alpine.DEB.2.22.394.2210251620370.1397955@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-355867395-1666739992=:1397955
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2210251620371.1397955@ubuntu-linux-20-04-desktop>

On Tue, 25 Oct 2022, Luca Fancellu wrote:
> Hi all,
> 
> This is the V2 of the proposal for deviations tagging in the Xen codebase, this includes
> all the feedbacks from the FuSa session held at the Xen Summit 2022 and all the
> feedbacks received in the previous proposal sent on the mailing list.

It would be good to commit this proposal (when acked) as a pandoc under
xen.git/docs/misra


> Here a link to the previous thread: 
> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00541.html
> 
> Documenting violations
> ======================
> 
> Static analysers are used on the Xen codebase for both static analysis and MISRA
> compliance.
> There might be the need to suppress some findings instead of fixing them and
> many tools permit the usage of in-code comments that suppress findings so that
> they are not shown in the final report.
> 
> Xen will include a tool capable of translating a specific comment used in its
> codebase to the right proprietary in-code comment understandable by the selected
> analyser that suppress its finding.
> 
> In the Xen codebase, these tags will be used to document and suppress findings:
> 
> - SAF-X-safe: This tag means that the next line of code contains a finding, but
>  the non compliance to the checker is analysed and demonstrated to be safe.
> - SAF-X-false-positive-<tool>: This tag means that the next line of code contains a
>  finding, but the finding is a bug of the tool.
> 
> SAF stands for Static Analyser Finding, the X is a placeholder for a positive
> number, the number after SAF- shall be incremental and unique, base ten
> notation and without leading zeros.
> 
> Entries in the database should never be removed, even if they are not used
> anymore in the code (if a patch is removing or modifying the faulty line).
> This is to make sure that numbers are not reused which could lead to conflicts
> with old branches or misleading justifications.
> 
> An entry can be reused in multiple places in the code to suppress a finding if
> and only if the justification holds for the same non-compliance to the coding
> standard.
> 
> An orphan entry, that is an entry who was justifying a finding in the code, but later
> that code was removed and there is no other use of that entry in the code, can be
> reused as long as the justification for the finding holds. This is done to avoid the
> allocation of a new entry with exactly the same justification, that would lead to waste
> of space and maintenance issues of the database.
> 
> The files where to store all the justifications are in xen/docs/misra/ and are
> named as safe.json and false-positive-<tool>.json, they have JSON format, entries
> of these files have independent ID numbering.
> 
> Here is an example to add a new justification in safe.json::
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |            "id":"SAF-0-safe",
> |            "analyser": {
> |                "cppcheck": "misra-c2012-20.7",
> |                "coverity": "misra_c_2012_rule_20_7_violation",
> |                "eclair": "MC3R1.R20.7"
> |            },
> |            "name": “R20.7 C macro parameters not used as expression",
> |            "text": "The macro parameters used in this […]"
> |        },
> |        {
> |            "id":”SAF-1-safe",
> |            "analyser": {
> |                "cppcheck": "unreadVariable",
> |                "coverity": "UNUSED_VALUE"
> |            },
> |            "name": “Variable set but not used",
> |            "text": “It is safe because […]"
> |        },
> |        {
> |            "id":”SAF-2-safe",
> |            "analyser": {},
> |            "name": "Sentinel",
> |            "text": ""
> |        }
> |    ]
> |}
> 
> Here is an example to add a new justification in false-positive-cppcheck.json::
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |            "id":"SAF-0-false-positive-cppcheck",
> |            "analyser": {
> |                "cppcheck": "misra-c2012-20.7"
> |            },
> |            “tool-version”: “2.7",
> |            "name": “R20.7 second operand of member-access operator",
> |            "text": "The second operand of a member access operator shall be a name of a member of the type pointed to, so in this particular case it is wrong to use parentheses on the macro parameter."

Any way we can make the text max 80 chars in lengths (without breaking
the json parser)?

Also, if we are going to commit this document in xen.git, please use
consistently " instead of “


> |        },
> |        {
> |            "id":”SAF-1-false-positive-cppcheck",
> |            "analyser": {},
> |            “tool-version”: “",
> |            "name": "Sentinel",
> |            "text": ""
> |        }
> |    ]
> |}
> 
> To document a finding, just add another block {[...]} before the sentinel block,
> using the id contained in the sentinel block and increment by one the number
> contained in the id of the sentinel block.
> 
> Here a brief explanation of the field inside an object of the "content" array:
> - id: it is a unique string that is used to refer to the finding, many finding
>  can be tagged with the same id, if the justification holds for any applied
>  case.
>  It tells the tool to substitute a Xen in-code comment having this structure:
>  /* SAF-0-safe [...] \*/

No need for the final \

Everything else looks good to me.


> - analyser: it is an object containing pair of key-value strings, the key is
>  the analyser, so it can be cppcheck, coverity or eclair. The value is the
>  proprietary id corresponding on the finding, for example when coverity is
>  used as analyser, the tool will translate the Xen in-code coment in this way:
>  /* SAF-0-safe [...] \*/ -> /* coverity[coverity-id] \*/
>  if the object doesn't have a key-value, then the corresponding in-code
>  comment won't be translated.
> - name: a simple name for the finding
> - text: a proper justification to turn off the finding.
> 
> 
> 
> Here an example of the usage of the in-code comment tags to suppress a finding for the Rule 8.6:
> 
> Eclair reports it here:
> https://eclairit.com:3787/fs/var/lib/jenkins/jobs/XEN/configurations/axis-Target/ARM64/axis-agent/public/builds/549/archive/ECLAIR/out/PROJECT.ecd;/sources/xen/include/xen/kernel.h.html#R50743_1
> 
> Also coverity reports it, here an extract of the finding:
> 
> xen/include/xen/kernel.h:68:
>  1. misra_c_2012_rule_8_6_violation: Function "_start" is declared but never defined.
> 
> The analysers are complaining because we have this in xen/include/xen/kernel.h at line 68:
> 
> extern char _start[], _end[], start[];
> 
> Those are symbols exported by the linker, hence we will need to have a proper deviation for this finding.
> 
> We will prepare our entry in the database:
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |        […]
> |        },
> |        {
> |            "id":”SAF-1-safe",
> |            "analyser": {
> |                “eclair": "MC3R1.R8.6",
> |                "coverity": "misra_c_2012_rule_8_6_violation"
> |            },
> |            "name": “Rule 8.6: linker defined symbols",
> |            "text": “It is safe to declare this symbol because it is defined in the linker script."
> |        },
> |        {
> |            "id":”SAF-2-safe",
> |            "analyser": {},
> |            "name": "Sentinel",
> |            "text": ""
> |        }
> |    ]
> |}
> 
> And we will use the proper tag above the violation line:
> 
> /* SAF-1-safe [optional text] */
> extern char _start[], _end[], start[];
> 
> This entry will fix also the violation on _end and start, because they are on the same line and the
> same “violation ID”.
> 
> Also, the same tag can be used on other symbols from the linker that are declared in the codebase,
> because the justification holds for them too.
--8323329-355867395-1666739992=:1397955--

