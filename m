Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A479D9DBB79
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 17:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845554.1260918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGheB-0000Tk-IX; Thu, 28 Nov 2024 16:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845554.1260918; Thu, 28 Nov 2024 16:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGheB-0000RG-Fx; Thu, 28 Nov 2024 16:45:43 +0000
Received: by outflank-mailman (input) for mailman id 845554;
 Thu, 28 Nov 2024 16:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZHB=SX=bounce.vates.tech=bounce-md_30504962.67489e2f.v1-610560bdcac6432683aae291a032abcd@srs-se1.protection.inumbo.net>)
 id 1tGhe9-0000RA-VB
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 16:45:42 +0000
Received: from mail136-20.atl41.mandrillapp.com
 (mail136-20.atl41.mandrillapp.com [198.2.136.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 318eab2d-ada8-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 17:45:37 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-20.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xzhy80gLTzCf9ND5
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 16:45:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 610560bdcac6432683aae291a032abcd; Thu, 28 Nov 2024 16:45:35 +0000
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
X-Inumbo-ID: 318eab2d-ada8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yMCIsImhlbG8iOiJtYWlsMTM2LTIwLmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjMxOGVhYjJkLWFkYTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODEyMzM3LjgzMjMxNiwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3NDg5ZTJmLnYxLTYxMDU2MGJkY2FjNjQzMjY4M2FhZTI5MWEwMzJhYmNkQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732812336; x=1733072836;
	bh=18EnFAJJ8tABzRxMkZJWb/kNwl3eaei2C3/d4lL33QA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EkZ9WDwAu/1zpVTnn6Jgv8X0oerlQliRAyk8qR4cQs7/OUTJWTwXsbh/yL/i/F2kL
	 Ig9hrnodjRbzViU9X2jR6jyL2F3N7BtuGfdQfScUhJE/1ZetJC7mM7L8QeFYFOSX3/
	 NeNGvfbfaXQurXrbkjkAs4TJ2ZSzj0yIwvn1bUgyJ4ExNEtQwYCWIj3+yktLANM6MW
	 10KOJXH2ExvkX/++RdJYqbRepIpji0v/9QqPxaSd9O8mrxVHGQsN4vLnaDaMwSeszD
	 RXm/AJulK3XPv/utXVeoV7RB7noWWUKbv+Rs7c7ZmflRZgfI6vNbTyotuxyCFJLKYy
	 PXmJUfS3LdjZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732812336; x=1733072836; i=anthony.perard@vates.tech;
	bh=18EnFAJJ8tABzRxMkZJWb/kNwl3eaei2C3/d4lL33QA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FBfSEHRH4Ncfx9XJ2/E1aqZSy64XhvN2S9eOsZpsS8ZFVyusNP6820mHvh+Gz5Pa7
	 0HmC8zXYw5LecihjDPjeQXqDXLAamvJ0Y7aWl9QYPrQvl7SK2tQ1VPdx7pqkAeTiB6
	 hp6j3Ym4c/iSQ8nrBc6/o7q6t1lkvfiU18M6J3KQrdSP3G69x4tk+Ji6yWx3iLsCgN
	 98kBlQbn8Z3pEsQ+eJvgViHTDUFXrOD6beUUZ9+mlIWh4kqIfuZy703G4DxrlDpGzh
	 YdooFht3MpsxumhnRztC9d7drJ/19F6GDGrZ30780wWpBV3tUFHe+V2SBIglE4IeAi
	 HroWQnzEAArCQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/2]=20xl:=20Keep=20monitoring=20suspended=20domain?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732812335201
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org
Message-Id: <Z0ieLBwYt2jm_WAa@l14>
References: <20241126171941.170897-1-jason.andryuk@amd.com> <20241126171941.170897-2-jason.andryuk@amd.com>
In-Reply-To: <20241126171941.170897-2-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.610560bdcac6432683aae291a032abcd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241128:md
Date: Thu, 28 Nov 2024 16:45:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Nov 26, 2024 at 12:19:40PM -0500, Jason Andryuk wrote:
> When a VM transitioned to LIBXL_SHUTDOWN_REASON_SUSPEND, the xl daemon
> was exiting as 0 = DOMAIN_RESTART_NONE "No domain restart".
> Later, when the VM actually shutdown, the missing xl daemon meant the
> domain wasn't cleaned up properly.
> 
> Add a new DOMAIN_RESTART_SUSPENDED to handle the case.  The xl daemon
> keeps running to react to future shutdown events.
> 
> The domain death event needs to be re-enabled to catch subsequent
> events.  The libxl_evgen_domain_death is moved from death_list to
> death_reported, and then it isn't found on subsequent iterations through
> death_list.  We enable the new event before disabling the old event, to
> keep the xenstore watch active.  If it is unregistered and
> re-registered, it'll fire immediately for our suspended domain which
> will end up continuously re-triggering.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

