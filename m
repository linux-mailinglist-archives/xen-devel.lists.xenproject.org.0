Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD460DE38
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 11:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430404.682057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncpu-0006hB-Sa; Wed, 26 Oct 2022 09:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430404.682057; Wed, 26 Oct 2022 09:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oncpu-0006eF-Pq; Wed, 26 Oct 2022 09:36:34 +0000
Received: by outflank-mailman (input) for mailman id 430404;
 Wed, 26 Oct 2022 09:36:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oncpt-0006e9-MC
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 09:36:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oncpt-0007zF-BE; Wed, 26 Oct 2022 09:36:33 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oncpt-0002HS-3z; Wed, 26 Oct 2022 09:36:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=2F+Ob1oXMIaVeKSAXliqSCKxg7aY9dtmBzqWXxHPJ9Y=; b=Krda/ohbX5E+Hts9MeVJngTm/1
	PJBV5gx0R5dxv8abJGF0pqz9qhxqPiUmeRvXvfkFq+Oy7rNbN66r63EVkG5lyHq5Z01ra2JJnCyto
	vwAyY4zoZM94X4Ttp96LJOKhJ1Kcg0BTHqDBw3aZY4IEtync06RAOl1NLXMi/H/VNMuY=;
Message-ID: <4ec8b702-aebf-2ce4-78e9-2f72d1b53cc3@xen.org>
Date: Wed, 26 Oct 2022 10:36:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [v2] Proposal for deviations in static analyser findings
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/10/2022 11:13, Luca Fancellu wrote:
> Hi all,

Hi Luca,

Some comments below if we plan to merge the doc in the tree.

> This is the V2 of the proposal for deviations tagging in the Xen codebase, this includes
> all the feedbacks from the FuSa session held at the Xen Summit 2022 and all the
> feedbacks received in the previous proposal sent on the mailing list.
> 
> Here a link to the previous thread:
> https://lists.xenproject.org/archives/html/xen-devel/2022-10/msg00541.html >
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
>   the non compliance to the checker is analysed and demonstrated to be safe.
> - SAF-X-false-positive-<tool>: This tag means that the next line of code contains a
>   finding, but the finding is a bug of the tool.
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

You don't seem to have a longer explanation afterwards. So I would drop 
"brief".

> - id: it is a unique string that is used to refer to the finding, many finding
>   can be tagged with the same id, if the justification holds for any applied
>   case.
>   It tells the tool to substitute a Xen in-code comment having this structure:
>   /* SAF-0-safe [...] \*/
> - analyser: it is an object containing pair of key-value strings, the key is
>   the analyser, so it can be cppcheck, coverity or eclair. The value is the
>   proprietary id corresponding on the finding, for example when coverity is
>   used as analyser, the tool will translate the Xen in-code coment in this way:
>   /* SAF-0-safe [...] \*/ -> /* coverity[coverity-id] \*/
>   if the object doesn't have a key-value, then the corresponding in-code
>   comment won't be translated.
> - name: a simple name for the finding
> - text: a proper justification to turn off the finding.
> 
> 
> 
> Here an example of the usage of the in-code comment tags to suppress a finding for the Rule 8.6:
> 
> Eclair reports it here:
> https://eclairit.com:3787/fs/var/lib/jenkins/jobs/XEN/configurations/axis-Target/ARM64/axis-agent/public/builds/549/archive/ECLAIR/out/PROJECT.ecd;/sources/xen/include/xen/kernel.h.html#R50743_1

How stable is this link?

The rest of the document LGTM.

Cheers,

-- 
Julien Grall

