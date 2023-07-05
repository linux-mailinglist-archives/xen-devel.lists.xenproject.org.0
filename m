Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23FA74891D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559422.874388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5Gw-0002CW-OM; Wed, 05 Jul 2023 16:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559422.874388; Wed, 05 Jul 2023 16:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5Gw-0002A9-LI; Wed, 05 Jul 2023 16:22:30 +0000
Received: by outflank-mailman (input) for mailman id 559422;
 Wed, 05 Jul 2023 16:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yom7=CX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qH5Gv-0002A3-DJ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:22:29 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20b068e3-1b50-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 18:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E9C56828567C;
 Wed,  5 Jul 2023 11:22:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id CBDxtnRCiVAK; Wed,  5 Jul 2023 11:22:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4AF958285887;
 Wed,  5 Jul 2023 11:22:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lii_44lKzvfG; Wed,  5 Jul 2023 11:22:24 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D49A0828567C;
 Wed,  5 Jul 2023 11:22:23 -0500 (CDT)
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
X-Inumbo-ID: 20b068e3-1b50-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4AF958285887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688574144; bh=AusMONxj1EnyFiiKuk2xJDRzmoM33Z6sxYwSdwy5Ka8=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Dzo9hR0bWSJLDhfs8XMaPEgcDgH2jicdgGCXMSflMaQMdHeQurayaakayiOIRaOOz
	 m9T8o3Rhdea28/G4KHXbHhIE4eRdn2qgq8zmg5iuaC0wu9FsnRk68GcIPZWfc+vbG6
	 86zfmWF9fNmaRATszziEj7karcMR4DH2dQzEZ0tU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <1b3a9165-43fd-d8e0-5c2f-49875973c8e1@raptorengineering.com>
Date: Wed, 5 Jul 2023 11:22:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
 <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
 <cbf263fe-9221-018d-b187-3d17be76e937@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <cbf263fe-9221-018d-b187-3d17be76e937@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/5/23 11:09 AM, Jan Beulich wrote:
> On 05.07.2023 17:10, Shawn Anastasio wrote:
>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Thanks.

Just to clarify, as the maintainer of PPC64, would it be my
responsibility to commit this now directly to xen/staging? Or should I
commit it to my own tree and have someone pull it?

I'm not super familiar with the project's maintainer workflow yet so any
hints would be appreciated.

> Jan

Thanks,
Shawn

