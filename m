Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6978D7FA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 20:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593241.926204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPsh-0004p6-67; Wed, 30 Aug 2023 18:25:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593241.926204; Wed, 30 Aug 2023 18:25:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPsh-0004nC-3C; Wed, 30 Aug 2023 18:25:31 +0000
Received: by outflank-mailman (input) for mailman id 593241;
 Wed, 30 Aug 2023 18:25:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5mg=EP=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qbPsf-0004n6-KZ
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 18:25:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969be796-4762-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 20:25:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DD227828556A;
 Wed, 30 Aug 2023 13:25:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id L7NOhuIDfJma; Wed, 30 Aug 2023 13:25:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0D93A828556B;
 Wed, 30 Aug 2023 13:25:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id YUqkey1tscAv; Wed, 30 Aug 2023 13:25:23 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 77721828556A;
 Wed, 30 Aug 2023 13:25:23 -0500 (CDT)
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
X-Inumbo-ID: 969be796-4762-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0D93A828556B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693419924; bh=F6nQ5D+hH1ztoxNwHir/6vjrO07hbXu9wxcbdCotbZ4=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=JqVDYZVtkr6NcKCqxprbFV0kGUmBMBowLeLDJd6fPZmozzJvvxI1KsUk5jnfcauuQ
	 4SNmjRVgAMH1qFLySXm0PlfhdJIAAo7CGR6j9hirgFoB6rnOEY7EEm3KCtHF7ciYg3
	 1ltabm/27SDXp3/AjgkS39/hysWT2qNLEEMEklq8=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <4b26cfe3-f6e4-4b33-26ea-aed05b5b1e77@raptorengineering.com>
Date: Wed, 30 Aug 2023 13:25:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 6/8] xen/ppc: Define bug frames table in linker script
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <f81914771ec96a48adf25c55329aa5f739f174d0.1692816595.git.sanastasio@raptorengineering.com>
 <599f1b4c-501d-6b02-e35a-6cba8b459376@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <599f1b4c-501d-6b02-e35a-6cba8b459376@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/23 8:03 AM, Jan Beulich wrote:
> On 23.08.2023 22:07, Shawn Anastasio wrote:
>> Define the bug frames table in ppc's linker script as is done by other
>> architectures.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> If I'm not mistaken this change is independent of the earlier patches,
> and hence could go in right away. Please confirm.

That's correct -- you're free to commit this independent of the rest of
the series if you'd like.

> Jan

Thanks,
Shawn

