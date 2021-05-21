Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B5138C896
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 15:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131312.245490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5TP-00032u-RK; Fri, 21 May 2021 13:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131312.245490; Fri, 21 May 2021 13:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk5TP-000312-ME; Fri, 21 May 2021 13:45:55 +0000
Received: by outflank-mailman (input) for mailman id 131312;
 Fri, 21 May 2021 13:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwWI=KQ=lechnology.com=david@srs-us1.protection.inumbo.net>)
 id 1lk5PO-0002v2-PK
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 13:41:46 +0000
Received: from vern.gendns.com (unknown [98.142.107.122])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3feab211-ee3e-457d-8523-4b95c8442a83;
 Fri, 21 May 2021 13:41:45 +0000 (UTC)
Received: from [2600:1700:4830:165f::fb2] (port=60256)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1lk5P6-0003HQ-MU; Fri, 21 May 2021 09:41:41 -0400
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
X-Inumbo-ID: 3feab211-ee3e-457d-8523-4b95c8442a83
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9lP4cKqfXHid5MksziM3FSc3DFRksG808KiNvq/BVYE=; b=hmX2PqtAcvfv2cTaWaKqbBzYnw
	DxSzvIsTFnCd9Ad9cdgXcoZVPVp+Z0y4/scrHZ6lQs88LnWXAa1YT4bs9Ia475q2X9vr1EOloNLCE
	THXs6NcMbbEEyxq3reOMRol8oP6jgXycuu8nbCc+4m9ZxjpBaxuPlbxnbeqkFLH5sNb79jTHyusGn
	Aj53qnao2AuiRFV92GruAtnjQKtCSKCaf2iZEz2O8VAEap+BHfbNyR/Ot54sQ9hGJPQZPKsE8tb7U
	0yMzptP6/L6YqlsKaZ6pc6CV/OvWHV6P877WAEb11FA4+jFhLuJ5+9IAG3jPixiqPaX93WGLZqRzV
	iYx9lswA==;
Subject: Re: [PATCH 11/11] drm/tiny: drm_gem_simple_display_pipe_prepare_fb is
 the default
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Linus Walleij <linus.walleij@linaro.org>,
 Emma Anholt <emma@anholt.net>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
From: David Lechner <david@lechnology.com>
Message-ID: <15839b4b-04e5-c65a-8e7c-6e1bdce9757f@lechnology.com>
Date: Fri, 21 May 2021 08:41:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521090959.1663703-11-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 5/21/21 4:09 AM, Daniel Vetter wrote:
> Goes through all the drivers and deletes the default hook since it's
> the default now.

Acked-by: David Lechner <david@lechnology.com>


