Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF6A20CEE6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 15:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpuBk-0008Nm-UV; Mon, 29 Jun 2020 13:51:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R5re=AK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jpuBj-0008Nh-BY
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 13:51:11 +0000
X-Inumbo-ID: 9688f922-ba0f-11ea-bca7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9688f922-ba0f-11ea-bca7-bc764e2007e4;
 Mon, 29 Jun 2020 13:51:10 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: olhtQNkxxzVsjqWXNDwG1Ru67t2OnFClDj56q+owXhZbScbVBvbsZLEodpZLrL8h/JZS7OmJyd
 Gdlr8AQVvv06A9a79YJNhjmn3Ko5MWWsEAD2TEyN99VSpdAr0sQUQp0YDBqKxS0cZzq1JBEwo0
 YfbYWhYr6yy0FrbdTUkFjxeT/lc2KslCeKcn8S71mYNM8546819yeaApsrDvizAPReOpPSQC+7
 ALcZ6U+JFiTJJn+GKTYqXKTlayTIhVXKwfVMyXBu0ooVSRtuP/UWI7FT7grcQ+YfC7FMI9TmLi
 dWo=
X-SBRS: 2.7
X-MesageID: 21518647
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21518647"
Subject: Re: [PATCH] tools/configure: drop BASH configure variable
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <24313.60895.220354.223207@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9838e494-6372-a456-9ff6-95b2b8f7381f@citrix.com>
Date: Mon, 29 Jun 2020 14:51:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24313.60895.220354.223207@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Daniel
 De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/06/2020 14:34, Ian Jackson wrote:
> Andrew Cooper writes ("[PATCH] tools/configure: drop BASH configure variable"):
>> This is a weird variable to have in the first place.  The only user of it is
>> XSM's CONFIG_SHELL, which opencodes a fallback to sh, and the only two scripts
>> run with this are shebang sh anyway, so don't need bash in the first place.
> Thanks for this cleanup.  I agree with the basic idea.
>
> However, did you run these scripts with dash, or review them, to check
> for bashisms ?

Yes, to all of the above.

They are both very thin wrappers (doing some argument shuffling) around
large AWK scripts.

>> Make the mkflask.sh and mkaccess_vector.sh scripts executable, drop the
>> CONFIG_SHELL, and drop the $BASH variable to prevent further use.
> Since the build currently uses bash for these, a more neutral change
> would be to change to #!/bin/bash at the same time.

That will break FreeBSD, which has no `bash` in sight.

>> RFC for 4.14.  This is a cleanup to the build system.
> I see this already has a release-ack.  However, I would not have
> recommended granting one at least on the basis of the description
> above.
>
> I agree that this is cleanup.  But the current situation is not buggy.
> I'm not sure exactly what the release criteria are but ISTM that this
> patch adds risk to the release rather than removing it.

I agree that the current state of play isn't a major issue, but having
./configure check for bash is buggy for both uses.

~Andrew

