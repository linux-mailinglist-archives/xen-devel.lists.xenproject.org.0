Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8C197831D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 17:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798270.1208437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7mT-0008O3-C0; Fri, 13 Sep 2024 15:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798270.1208437; Fri, 13 Sep 2024 15:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7mT-0008LQ-9S; Fri, 13 Sep 2024 15:00:17 +0000
Received: by outflank-mailman (input) for mailman id 798270;
 Fri, 13 Sep 2024 15:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9NjI=QL=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1sp7mR-0008LK-7K
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 15:00:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e127bfe6-71e0-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 17:00:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4B300828596A;
 Fri, 13 Sep 2024 10:00:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id P6LyY1QoSsZI; Fri, 13 Sep 2024 10:00:12 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A6DB3828680E;
 Fri, 13 Sep 2024 10:00:12 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Klukh_-OHBCw; Fri, 13 Sep 2024 10:00:12 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A4156828596A;
 Fri, 13 Sep 2024 10:00:11 -0500 (CDT)
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
X-Inumbo-ID: e127bfe6-71e0-11ef-a0b5-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A6DB3828680E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1726239612; bh=jp0IutICP9nSFFZ61LGuxzmJTlY9XaOKnAAbm/cug/k=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=TcRjFLNLrjrk3020r2bRQc3re8eZTTRSaffjW0ksN0qtyd+t5fzzWPkVZR4YeMFRk
	 6l6w2H3mSMk+evmQh0pYIT0xND/Mtk9wxdU1k6YBcxYXGjxetvcyiO4vsxCHJ5BELd
	 c9rAkt3YHiSkoSWYIgVZwM7QgdWgrmyeId7zcwR8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <7066f690-274d-4987-8633-f183fdcee56e@raptorengineering.com>
Date: Fri, 13 Sep 2024 10:00:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] xen/bitops: Implement hweight32() in terms of
 hweightl()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
 <20240904225530.3888315-4-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <20240904225530.3888315-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 9/4/24 5:55 PM, Andrew Cooper wrote:
> ... and drop generic_hweight32().
> 
> As noted previously, the only two users of hweight32() are in __init paths.
> 
> The int-optimised form of generic_hweight() is only two instructions shorter
> than the long-optimised form, and even then only on architectures which lack
> fast multiplication, so there's no point providing an int-optimised form.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

