Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB3CA13B11
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 14:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873592.1284602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQB5-0005oD-JL; Thu, 16 Jan 2025 13:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873592.1284602; Thu, 16 Jan 2025 13:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYQB5-0005mK-Gm; Thu, 16 Jan 2025 13:44:55 +0000
Received: by outflank-mailman (input) for mailman id 873592;
 Thu, 16 Jan 2025 13:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5HgK=UI=bounce.vates.tech=bounce-md_30504962.67890d52.v1-f73ea77b3cea41ca8fc34524bafcfe5a@srs-se1.protection.inumbo.net>)
 id 1tYQB4-0005mE-G0
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 13:44:54 +0000
Received: from mail187-43.suw11.mandrillapp.com
 (mail187-43.suw11.mandrillapp.com [198.2.187.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f53757e-d410-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 14:44:52 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-43.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4YYkcy75gGzLfHJXv
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 13:44:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f73ea77b3cea41ca8fc34524bafcfe5a; Thu, 16 Jan 2025 13:44:50 +0000
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
X-Inumbo-ID: 0f53757e-d410-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737035091; x=1737305091;
	bh=CxJQhexA8x8AADvqtEfVv/6jNb5za2wMWCq+dJ4E3gU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CYGFpKo1A2Ur6NZKrr0kpCuG1rLH5UB4n3fzaASbIZyYRmeE2dUThgdiyQ72ewHVc
	 mh7uRrQRyJ5RygqJdIeHXkwLET3cKi+6o5/wWPYiRVP4W2ja60HU5mqRoHv59UM27f
	 jXD2TMLIlGpahTBE9nO6HVYqbiLBspYBem5LuMotbivzVOwgd0YZiebXr37MLpv3o4
	 EzcivFf8661tudpRM9LaxhfWkyHa+CGnWB8CpIHpgvtD1oHrsZDc46U9ucAbrUBYgz
	 5W766+qH17bUWzRCczf2dLNpRoGkFHzc2hV48I95tJbBbhpF8q2zyu60tfKzfk7SLO
	 7h4EIx7bdgJcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737035091; x=1737295591; i=anthony.perard@vates.tech;
	bh=CxJQhexA8x8AADvqtEfVv/6jNb5za2wMWCq+dJ4E3gU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=fbElwXC8QRvBUbZtCwW0jnejsmb5cgmamHwlhyspeaHK6WVFOBjeuv7+Thba5Susr
	 cB1YNeZn/Lep5uyZZbCgkBw68vLp0hPnpeszcI1fdF/kCnHEm3h9zjE9N36CKFVw8s
	 TmaxPLNruzgbOIWsiujnXMfE9K/neeoT4A9E3Swcp7OVfthbl1sbO75KqWxJgZJSUw
	 uVULoqlDCgGvXmKY7U8UGwAX26H1po6HnV0NzcWUvRtZG2FVJkntPFhZk7JRVHoPvm
	 HM6nxNJIXTKt2kcb9qw6hBkL9YCnvEaQ5eCVvLR5WwoWcnUVClaXs44twIs3vRyzT0
	 lsskGy197vJzQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v7=207/7]=20tools/xenstored:=20use=20new=20stable=20interface=20instead=20of=20libxenctrl?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737035090163
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Samuel Thibault" <samuel.thibault@ens-lyon.org>, "Julien Grall" <julien@xen.org>
Message-Id: <Z4kNUd_etZTBlX7S@l14>
References: <20250109105935.23585-1-jgross@suse.com> <20250109105935.23585-8-jgross@suse.com>
In-Reply-To: <20250109105935.23585-8-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f73ea77b3cea41ca8fc34524bafcfe5a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250116:md
Date: Thu, 16 Jan 2025 13:44:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jan 09, 2025 at 11:59:35AM +0100, Juergen Gross wrote:
> Replace the current use of the unstable xc_domain_getinfo_single()
> interface with the stable domctl XEN_DOMCTL_get_domain_state call
> via the new libxenmanage library.
> 
> This will remove the last usage of libxenctrl by Xenstore, so update
> the library dependencies accordingly.
> 
> For now only do a direct replacement without using the functionality
> of obtaining information about domains having changed the state.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

