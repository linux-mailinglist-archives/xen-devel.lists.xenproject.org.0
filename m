Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89087274402
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:18:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKj7u-0003Ju-Ry; Tue, 22 Sep 2020 14:18:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J35V=C7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKj7t-0003Jk-GZ
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:18:37 +0000
X-Inumbo-ID: 8a8ba69c-e9e5-48cf-9769-b52509a8444b
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a8ba69c-e9e5-48cf-9769-b52509a8444b;
 Tue, 22 Sep 2020 14:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600784316;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=N04S7EuyG3e5EFknOWY3nLUTCXtE0CamCIK6TFGNhoQ=;
 b=IYphFd04X6GtqLuZ/unCxD8875j7Vo6LyZoVUZea2FwDb77NnIMa3Z2D
 q6l3SErhg0kT8itK0p2ZGP5CPlXurnsLWZkT5ByYMpWHTgisiS7srMBnC
 Yfv1Iu1x+ZkU2WjCg6hw3k5q09ZC3EWBBKF4CXppAYr8MlpiWami8d+UG g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EmrQ4rwBbLVLl+9dLzU3s/DWjdnEp6Rt4dGyTYpdoB9TdZLW6uKCJhAKiTfK7WYjhzsNxB73Ms
 DMgps5uRGU87f6DoP3PrbU4afX6bzNxeP1CsTgbz49LJ0++R9GBl5U1XObi1vZMssUR/PsOKIP
 3SYy519ROfyJWndnR8dcndGiL/Y+sXOGgzef9crD42ItwDC0pV2AdQB+pZYbHCtyoZRcKOz2lB
 NLUCAIulBykTRZQ6wQSl03ME2tYZu138JBk+G984DS0zEHtkys9m/IQv7jtM9M/VPn7LFn4IRv
 U64=
X-SBRS: 2.7
X-MesageID: 27235111
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="27235111"
Subject: Re: races in toolstack build
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Olaf Hering
 <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
References: <20200922141700.4627df0d.olaf@aepfle.de>
 <fa2ba088-f95d-ce85-b991-793eb4d98f92@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <58ec9527-60a0-8815-010f-18f3a8c9df84@citrix.com>
Date: Tue, 22 Sep 2020 15:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fa2ba088-f95d-ce85-b991-793eb4d98f92@suse.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/09/2020 14:51, Jürgen Groß wrote:
> On 22.09.20 14:17, Olaf Hering wrote:
>> With commit 68a8aa5d72 the build randomly fails. Up to commit
>> c7e3021a71 no errors (like this) are seen. For some reason nothing
>> below tools/ was touched in this range, so the bug may already exist
>> for a while.
>>
>> attempt on host#1:
>> [   81s] ln: failed to create symbolic link
>> '/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_dom.h':
>> File exists
>
> This is very weird, as the link is created via "ln -sf", so an existing
> target should not make the command failing.
>
>> [   81s]
>> /home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/libs/libs.mk:82:
>> recipe for target
>> '/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_compat.h'
>> failed
>> [   81s] make[6]: ***
>> [/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_compat.h]
>> Error 1
>>
>> attempt on host#2:
>> [  178s] xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or
>> directory
>> [  178s]
>> me/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/stat/../../../tools/Rules.mk:153:
>> xenstat_qmp.opic] Error 1
>
> This shouldn't happen, too.
>
> Is this really a normal upstream build, or do you have any additional
> patches applied?

I've also observed the first symptom sporadically.  They've all been in
my main dev tree, which absolutely includes the possibility of an
unclean tree.  So far I haven't observed it from a clean tarball in a
mock chroot.

~Andrew

