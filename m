Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E74F3E3144
	for <lists+xen-devel@lfdr.de>; Fri,  6 Aug 2021 23:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164798.301180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC7b3-0006qf-RM; Fri, 06 Aug 2021 21:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164798.301180; Fri, 06 Aug 2021 21:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mC7b3-0006o0-NS; Fri, 06 Aug 2021 21:41:41 +0000
Received: by outflank-mailman (input) for mailman id 164798;
 Fri, 06 Aug 2021 21:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TtcZ=M5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mC7b1-0006nu-LD
 for xen-devel@lists.xenproject.org; Fri, 06 Aug 2021 21:41:39 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa1d74e0-74e7-4b25-9ac5-938c0022f715;
 Fri, 06 Aug 2021 21:41:38 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1628286074247110.40827459181378;
 Fri, 6 Aug 2021 14:41:14 -0700 (PDT)
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
X-Inumbo-ID: fa1d74e0-74e7-4b25-9ac5-938c0022f715
ARC-Seal: i=1; a=rsa-sha256; t=1628286080; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f3qYsd0MYWBLK0ccgQJG+oUZyleknu34J1iNVjDfCIR8AeFKUVoT7ad0ky6DUf9/YyBAX7DGwz2JyGZOhRDW8zRLT8KGIaEF3Ir5maEGz4jRmNTP62P44PDtP76sEHoVEQFu6m9z3VTmpf+b1mbusfYEi7EeV8+tNlnaEQPkuuM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1628286080; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=S1PePXBB3cDcFL0S/fLzgmHKVx0lj231AL3uB41hGKA=; 
	b=gTL5JPjqYLBb5OatJHeT4AxYI8bYLCB3xn73E3snJwtMWQaOM3EaIT3m6rt14haYoWgiYCuLOE6T5rMqb7qKckG9WXkrzW3FoUNHHfsHX8vNdRTJP53whP7NDt3tOafEsLQW+4HJxGxAH4qXaLHEvVqsTtj94mQ7IbVTOTSobTU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628286080;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=S1PePXBB3cDcFL0S/fLzgmHKVx0lj231AL3uB41hGKA=;
	b=OuRPXn0KQMy1ItW4S95sBXU62oQZ6U7RV8YK9bcO3vYB5Qrm8D7YcLgnLbzlLEi8
	/o5jTFsSwNgc6oNCQ8hfrY1TEEWfn5Xey8KUrmE3WcDwy2/FJKNTImG1gf4MvgRP5gy
	04O7MCfsdv+lV4LTHTKvauDxLBodsRQ6RGHLbb2g=
To: Ian Jackson <iwj@xenproject.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-9-dpsmith@apertussolutions.com>
 <24832.3234.356168.227371@mariner.uk.xensource.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
Message-ID: <93bcfe0f-2fd6-7177-53f4-8544582df3b8@apertussolutions.com>
Date: Fri, 6 Aug 2021 17:41:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24832.3234.356168.227371@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/27/21 9:39 AM, Ian Jackson wrote:
> I have read the thread here and it seems that there are some
> disagreements which may be blocking progress.
> 
> The mailing list thread is a rather tangled way of dealing with this.
> I did read it but I feel I am lacking some of the context and/or
> having trouble synthesising it.
> 
> Daniel, if you agree with me that this seems to be getting hung up on
> disagreements, do you think you would be able to summarise the
> disagreement(s) including the context and the arguments you can see on
> the various sides ?  I'm not expecting such a summary to be neutral
> but I think you are in a good position to motivate your changes.
> 
> Thanks,
> Ian.
> 

Hey Ian,

Thank you so much for reaching out. While there is definitely a
disagreement, as you will likely have seen, I put out a v3 of the patch
set where there is an attempt to strike a compromise between the two
positions. To provide some context, below is a list of points of
contention, my concerns regarding the points of contention, and a list
of what was addressed in v3 of the series.

Points of contention:
A1. Agreement on what is and constitutes XSM.
A2. Based on (A1), what does it really mean to turn XSM on or off.
A3. Providing the facade that a capability is turned off to hide config
options
    a user may not understand
A4. There are two versions of the XSM hook interfaces and corresponding
    XSM hook implementations
A5. Whether the XSM hook's call sites should include the access level

My concerns/issues:
B1. The irony that XSM is unsupported but XSM + SILO is supported (for
    Arm)
B2. The counter-positive to the position of (A3) is that every KConfig
    option must be understandable by all users
B3. The complexity of the preprocessor code to enable (A3) results in
    challenging code to reason about
B4. The increased overhead in having to maintaining the two sets of
    hooks caused by (A3)
B5. The (A3) optimization is being done to common code but only applies
    to x86 security supported configurations
B6. That (A3) is justified to maintain a legacy mental model that Dom0
    is all powerful at the expense of unnecessarily complicating Xen's
    core access control code.
B7. That (A5) is only completely correct when default/dummy policy is in
    effect B8. (A5) was justified as it gives the developer a notion of
    what will be checked, which is bad for a number of reasons, but the
    primary is that it will either directly or indirectly influence a
    developer to write code with false sense of what access level a
    domain may have

What v3 addresses:
C1. Instead of doing a submenu for XSM v3 replaces XSM on/off with a
    "select to configure XSM", addressing (A2, A3, B2)
C2. Instead of dropping one of the interfaces/implementations, merged
    them to provide a single interface with similar inlining properties,
    addressing (A4, B3, B4, B5)
C3. The passing of a default at the call site was left intact addressing
    (A5)

Deferrals and concessions in v3:
D1. Answering (A1) can be addressed later by reviewing, refreshing, and
    expanding XSM documentation
D2. Will work with community to get XSM in a supported status to resolve
   (B1)
D3. The issue of (B6) is partially resolved in v3, v1 and v2 provided a
    better separation but all three are logically equivalent
D4. I conceded on (B7) and (B8) which are related to (B6) with respect
    that the all powerful dom0 continues to be hard coded throughout the
    hypervisor instead of trying to abstracting it out.

While not all of the points of contentions nor all of my concerns are
all addressed, I would like to hope that v3 is seen as an attempt
compromise, those compromises are acceptable, and that I can begin to
bring the next patch set forward. Thank you and looking forward to
responses.

V/r,
Daniel P. Smith

