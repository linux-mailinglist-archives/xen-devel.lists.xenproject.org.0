Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE539AFB25
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 09:33:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825564.1239933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Enc-0001Yy-1k; Fri, 25 Oct 2024 07:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825564.1239933; Fri, 25 Oct 2024 07:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Enb-0001WN-UK; Fri, 25 Oct 2024 07:31:55 +0000
Received: by outflank-mailman (input) for mailman id 825564;
 Thu, 24 Oct 2024 21:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbll=RU=emersion.fr=contact@srs-se1.protection.inumbo.net>)
 id 1t45Ty-0003Z0-HK
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 21:35:03 +0000
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d206b37b-924f-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 23:35:00 +0200 (CEST)
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
X-Inumbo-ID: d206b37b-924f-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1729805698; x=1730064898;
	bh=U0MZUFxkg3+UOPqNFrbWaEyCbKpVVLhO0H5Klvvg8Vk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GchmDkiwzjHUzphRTZ7mqVaLX2rZofgM4AeXNI1oLuZBQlf6NiAkhwO71L7ZqlXw/
	 Z88fUiHzB4reDhzc5BLtCRTrWUdeZqFf66kACHNnSXaqgQi7HFFDbaKXtDPCI0lwvQ
	 /xYfCYTEs5rqpCsP8XHu0Odx7iqSfJC3vAaYm8XhI/K/7f+I+GiorF/ipKppCXwiyA
	 XMuMoPP/6Fu3JAfGd/63W6CNXBijFN6BkAFXgu5r4W6EkWgqy1uOa6cwu1xh9PgXWk
	 B3aIk07fwbgTww5H7lkC3sqYqqagIcF+hOR1IQ6Vlhq6qUeyvdDsdSCQv/IJZB+fsI
	 /06b1a3z3rctQ==
Date: Thu, 24 Oct 2024 21:34:52 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>, Javier Martinez Canillas <javierm@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: remove driver date from struct drm_driver and all drivers
Message-ID: <QMi2RXA05r08zucgpXkakwSfIm28vqmqYoOP-Da66Gq4jQWGZA8PfpAGd4z1VYfU4ao-2sj4u5qO6n5OpQv-ccu8Rwtm5Y1MNpQ-rpTo0tY=@emersion.fr>
In-Reply-To: <20241024162240.2398664-2-jani.nikula@intel.com>
References: <20241024162240.2398664-1-jani.nikula@intel.com> <20241024162240.2398664-2-jani.nikula@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: ff36b191848725b70c63fcfb4b045f3132e16d83
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Simon Ser <contact@emersion.fr>

