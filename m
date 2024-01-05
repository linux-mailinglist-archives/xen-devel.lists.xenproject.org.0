Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA79825AE5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 20:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662336.1032407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpSr-0007IF-Ei; Fri, 05 Jan 2024 19:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662336.1032407; Fri, 05 Jan 2024 19:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLpSr-0007FZ-Bz; Fri, 05 Jan 2024 19:02:41 +0000
Received: by outflank-mailman (input) for mailman id 662336;
 Fri, 05 Jan 2024 19:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iyKn=IP=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rLpSq-0007E5-5X
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 19:02:40 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd5244ae-abfc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 20:02:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CA07382856D4;
 Fri,  5 Jan 2024 13:02:35 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 6wz-5cD6uz1S; Fri,  5 Jan 2024 13:02:35 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D75A3828586A;
 Fri,  5 Jan 2024 13:02:34 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UjSXFmKKYsPU; Fri,  5 Jan 2024 13:02:34 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 114AA82856D4;
 Fri,  5 Jan 2024 13:02:33 -0600 (CST)
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
X-Inumbo-ID: fd5244ae-abfc-11ee-98ef-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D75A3828586A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1704481354; bh=NZixcl3E/YkMyxsRAmyeWluwVPnLz7fDXYX9hzKiymI=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=KsqWAyb/HQhtH8G2Me/q3AEnM5v+PnnPdxtSeYNi0d6QnAmlRv8GsyNTF6vE0/jh0
	 mQQ2prDO3fQVctbNvyvktCrTDs8nxrFelgM/Bh6WZ+txBw/cMkJ5TP1KCN4DS4aC7i
	 87r9JJZnOCO6w0NnHyRyV4fLpwH8ghTfpMAKswik=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a9793125-599b-432a-8f93-d77244616849@raptorengineering.com>
Date: Fri, 5 Jan 2024 13:02:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/34] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 12/22/23 9:12 AM, Oleksii Kurochko wrote:
> The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
> so it has been moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks,
Shawn

