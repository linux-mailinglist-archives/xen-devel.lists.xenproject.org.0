Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D353E950ADB
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 18:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776461.1186610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdurA-00036u-R1; Tue, 13 Aug 2024 16:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776461.1186610; Tue, 13 Aug 2024 16:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdurA-00034t-O2; Tue, 13 Aug 2024 16:58:48 +0000
Received: by outflank-mailman (input) for mailman id 776461;
 Tue, 13 Aug 2024 16:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tv38=PM=bounce.vates.tech=bounce-md_30504962.66bb90c2.v1-9abbdabd518f480499dff21353c628dc@srs-se1.protection.inumbo.net>)
 id 1sdur8-00034n-CH
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 16:58:46 +0000
Received: from mail135-13.atl141.mandrillapp.com
 (mail135-13.atl141.mandrillapp.com [198.2.135.13])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c34b996-5995-11ef-8776-851b0ebba9a2;
 Tue, 13 Aug 2024 18:58:44 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-13.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WjyJf3BtvzNCdJ0M
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 16:58:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9abbdabd518f480499dff21353c628dc; Tue, 13 Aug 2024 16:58:42 +0000
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
X-Inumbo-ID: 4c34b996-5995-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1723568322; x=1723828822;
	bh=vt0yScILe+G19ItC5DM4FFHAC7hnaAPVRlzZV5ULaWg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C2YJ/qJNjXRyPbhlX0QZPwTIDgZwvgb63oY29O8RQifEpPuZqJL5U2claiLcP+N7s
	 HlE0t31KmJ8+8JixW2VJVvwQuYxdsQUwSeaTAaPtJZt87RX+ZwmByEdGWQ7CspJSIF
	 wTvdtPZvWUc10OJ55g+yXTatHGMxBIF6fJo+dHZo7TwMFzWF81MeUf6wF8PEVS0bYn
	 1xpmVz0w9SWUgz/jHkC+XbNEFHOpBaxRX+HahopVjPLQHdaKgfXkZbyWh5QSPS5ME6
	 /TSc0lnrptsVlFNuX+dRVhovENPCj6keD6L6x1Ttyx3k3hJgmh9z72sL4QQX4fzY9v
	 T3ERfsiU2OC7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1723568322; x=1723828822; i=anthony.perard@vates.tech;
	bh=vt0yScILe+G19ItC5DM4FFHAC7hnaAPVRlzZV5ULaWg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lMY5XBG2vmA6S2cvtTN1Mu9z6mtM+OOv9vFqj8xa6cIo2rwKqMAObrFY4ITAC7OBB
	 aU/zP+TzpCSWqS96EPVptE+cqVGFE9rCyFwMO+2eKf+5PPX3xbqgs12CIlR2n4ceIV
	 gaouul+fzPmY4U8uhy7S86fov9qO3lLGgBOTBapQjv9jSVKy9mHEmZIStsOsU+wuia
	 s39MEyf7Etqfb/7zO3BBcmyhetN1z0sGkSWzkc2b4DhjqUGdtQdQl/kekaCOIzFij9
	 /K3KeR0LBsEpSKydP7kCzgy/yaJQpQijrDueiHKAFvxDnlv7FkPxPl1VhFXQlaRzgj
	 aUcR22JbyU+bg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20libxl/disk:=20avoid=20aliasing=20of=20abs()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1723568321404
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-Id: <ZruQwD2bh7cOADfL@l14>
References: <ad3b9873-b478-4448-8395-498399040324@suse.com>
In-Reply-To: <ad3b9873-b478-4448-8395-498399040324@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9abbdabd518f480499dff21353c628dc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240813:md
Date: Tue, 13 Aug 2024 16:58:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 06, 2024 at 10:40:14AM +0200, Jan Beulich wrote:
> Tool chains with -Wshadow enabled by default won't like the function
> parameter name "abs", for aliasing stdlib.h's abs(). Rename the
> parameter to what other similar functions use.
> 
> Fixes: a18b50614d97 ("libxl: Enable stubdom cdrom changing")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

