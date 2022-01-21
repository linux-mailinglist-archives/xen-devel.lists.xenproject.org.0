Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F7A495DD0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jan 2022 11:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259304.447440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArFq-00070n-4U; Fri, 21 Jan 2022 10:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259304.447440; Fri, 21 Jan 2022 10:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nArFq-0006yz-1E; Fri, 21 Jan 2022 10:34:50 +0000
Received: by outflank-mailman (input) for mailman id 259304;
 Fri, 21 Jan 2022 10:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QdbK=SF=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nArFo-0006yt-AI
 for xen-devel@lists.xenproject.org; Fri, 21 Jan 2022 10:34:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bfc54199-7aa5-11ec-bc18-3156f6d857e4;
 Fri, 21 Jan 2022 11:34:46 +0100 (CET)
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
X-Inumbo-ID: bfc54199-7aa5-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1642761286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CjMsyoBTfM7drnJpFRY8cubPqLKR4s80hIT4moA+NNc=;
  b=KZeSVmp/l25Cp9aA41UBy61+ICV7BN1G/tYMCwF478lmBgAXRAFhVBKG
   VYrwhUg/o608gbhOyb7Q5mh2CotIf3r6tSW3KQAXFMMh1zGvOzcwMwzYv
   w7nDAtJiGqBZYR0GCEhsV3nCFEmS52dXdfShdFUroa7VgSUWDlUYd9vsi
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gBsdT3yKXVRD9OWaPwSXI8F9GYsALzP6OaM7MNSm30ROaz2EbaHHPr77CBt3uG6WZ4A3EexwQM
 +Ksx2roTB0gYl8hIHhyiX22s+TfuTjwQoMvui/4CyloNy+l0+zlTFYq5tqv4GroSKJ5qc2s88n
 5KT0MzhXsAFZyiUijadkaUNK2g3s+XVD8q88mjdfat9gnDgUC303jPwGrDcOl30IeEwm8pZ7b8
 IGpoDrCuLWNCfL+fEgevFmxDpkcZ2uutpCcG7fUtYkDHLLeMUVPUFXBWq6M29lzEjCm/m6SY4h
 74NwukN/69MHVHzZeEXoy38m
X-SBRS: 5.2
X-MesageID: 62480635
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23: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
 o7celpuyIBLaae4T4MVkPR5Bw==
IronPort-HdrOrdr: A9a23:8VKkRK9x1OmYsp2yX7Nuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.88,304,1635220800"; 
   d="scan'208";a="62480635"
Date: Fri, 21 Jan 2022 10:34:38 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Alistair Francis
	<alistair.francis@wdc.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>, Connor Davis <connojdavis@gmail.com>,
	"Doug Goldstein" <cardoe@cardoe.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Tamas K Lengyel" <tamas@tklengyel.com>, Paul
 Durrant <paul@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v8 00/47] xen: Build system improvements, now with
 out-of-tree build!
Message-ID: <YeqMPs4jghn9V82f@perard>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <86033c13-c444-aac1-6043-73ed12c78240@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86033c13-c444-aac1-6043-73ed12c78240@suse.com>

On Fri, Jan 21, 2022 at 07:59:40AM +0100, Jan Beulich wrote:
> One more question: With an out-of-tree build, where do I put the
> (build flavor specific) ./.config (not xen/.config)? I'm using this
> extensively for cross builds and to override tool chain components
> (to avoid having to remember to always specify the right combination
> for a certain flavor on the command line).

You mean the optional ".config" that "Config.mk" includes? This file is
still included as "$(XEN_ROOT)/.config", and XEN_ROOT is set to be the
source tree.

Maybe you could abuse a file named "xen-version" which is included near
the top of "xen/Makefile" instead.

-- 
Anthony PERARD

