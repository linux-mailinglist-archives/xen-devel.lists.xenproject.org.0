Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F087696C6
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 14:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573021.897301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSLg-0000OH-8M; Mon, 31 Jul 2023 12:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573021.897301; Mon, 31 Jul 2023 12:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQSLg-0000M8-4x; Mon, 31 Jul 2023 12:50:08 +0000
Received: by outflank-mailman (input) for mailman id 573021;
 Mon, 31 Jul 2023 12:50:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GapS=DR=citrix.com=prvs=569ba324e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qQSLe-0000Gd-Tz
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 12:50:06 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3da3fa5-2fa0-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 14:50:04 +0200 (CEST)
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
X-Inumbo-ID: c3da3fa5-2fa0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690807804;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Unbn19XrOpybsJgn0zNxrn8PEN9ry2yGxsmuxT8Tn1Q=;
  b=HQWTqblhBdx3TEu+NdOEFHrhhc6gc+UyKzZb4O+1jfgkvkDFRDuPiCD5
   ZvP0rUVBdY9SLnXSP3MAQ85RizJ+Tgh8xpMghrSFnEz4oFFb+bvkYB1d6
   6ZOJIMRGXh6ejcxUb4fhfgTFcC7pjQDLcLAnuS1/Wa0T4KoTOIJ0riZfi
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 116676850
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+sQU965vmGRcEqlhj+ckXgxRtG3AchMFZxGqfqrLsTDasY5as4F+v
 mBKWzrVb6qCYjSneI9/PIq3/BkBuJaHz9I2Ggc6+Sw2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8Q5QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 NUUcAIBdgG5vP+t7K6KSNBMrfkhI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx/G+
 D2Yrzmhav0cHManxDbV8m+wuvfkvD6hSN4TD4TgxMc/1TV/wURMUUZLBDNXu8KRiEO4QJRAK
 k8Q8ywioLIa8E2tR8P6GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQA2
 0WVhdrvCXpKuaeMVHOG3r6OqHW5Pi19BWoLfyRCRwwD5djooak6lBeJRdFmeIa8hd30H3f/3
 iiWpQA3nbBVhskOv42b8FbdknSTr57GZgcv40PcWWfNxgh+YYu4YY20+B7e5PBJI4uDZkmMu
 mAenMqT5/xICouC/ASPSugQGLCi596eLSbRx1VoGvEJ9Smp+nOlVZBd5nd5PkgBGt0fZTbjb
 UvXuAVQzJxeJn2naelweY3ZI9su5bjtE5LiTP+8RtNWb4J4bgOv4CBkbknW1Gfo+HXAiolmZ
 83dK5z1Sy9HV+I+lmHeq/ohPaED1wkynVHfXYHB9Am8/aavZke1YooHPw7bBgwm159osDk54
 v4GaZrSlE4ODbanCsXE2dVNdA5XdBDXEbiz8pUKLbDbf2KKDUl7U5fsLaUdl5uJdki/vsPB5
 TmDV0BR0zITblWXeFzROhiPhF4CNKuTTE7X3gR2Zz5EI1B5Pe6SAF43LvPbh4UP+u151uJTR
 PIYYciGCfknYm2ZqmxCMcOl8NA6LEjDaeey082NOWlXQnKdb1aRpo+MkvXHqkHi8RZbReNh+
 ub9h2s3sLIIRhh4Dda+VR5c5wrZgJTpo8orBxGgCoAKKC3RHH1Cd3SZYgkff5tddn0uB1Kyi
 26rPPvvjbKR/9VrrYWZ3vHsQkXAO7IWI3e21lLztd6eXRQ2NEL6qWOceI5kpQzgaV4=
IronPort-HdrOrdr: A9a23:9JXgRq5NUlDSZvmk/APXwPLXdLJyesId70hD6qkmc20zTiX+rb
 HMoB1773/JYVkqM03I9errBEDiexLhHPxOjrX5Zo3SODUO0VHARL2Ki7GO/9SKIUPDH4BmuZ
 uJ3MJFebvN5fQRt7eZ3OEYeexQpeW6zA==
X-Talos-CUID: =?us-ascii?q?9a23=3ARNBcWGh26HdRXkxwu3Qhi1lMFDJuY1TRlEXcO16?=
 =?us-ascii?q?CMntyZKGkS2aw055mnJ87?=
X-Talos-MUID: 9a23:7hdolAoYTyeQIC3wDvwezytaOcs447myNFgmsIhcq5WFLhUoCQ7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,244,1684814400"; 
   d="scan'208";a="116676850"
Date: Mon, 31 Jul 2023 13:49:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>, Marc Bonnici
	<marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [XEN PATCH v11 14/14] docs: add Arm FF-A mediator
Message-ID: <00c663c9-4604-4162-bae0-ab229ee450fb@perard>
References: <20230731121536.934239-1-jens.wiklander@linaro.org>
 <20230731121536.934239-15-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731121536.934239-15-jens.wiklander@linaro.org>

On Mon, Jul 31, 2023 at 02:15:36PM +0200, Jens Wiklander wrote:
> Describes a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
> 
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

