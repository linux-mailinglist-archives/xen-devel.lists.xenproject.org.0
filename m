Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816777CEA0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 17:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583987.914360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVvXw-0005Os-1Y; Tue, 15 Aug 2023 15:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583987.914360; Tue, 15 Aug 2023 15:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVvXv-0005Lo-V7; Tue, 15 Aug 2023 15:01:23 +0000
Received: by outflank-mailman (input) for mailman id 583987;
 Tue, 15 Aug 2023 15:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQSb=EA=citrix.com=prvs=584405d4c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qVvXu-0005Li-HA
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 15:01:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 972ed4ac-3b7c-11ee-8775-cb3800f73035;
 Tue, 15 Aug 2023 17:01:20 +0200 (CEST)
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
X-Inumbo-ID: 972ed4ac-3b7c-11ee-8775-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692111680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9S/ljwSEV8WxK5gXeZtfhXWl/XZVmVEI0zODAot+4VQ=;
  b=e0XBMXY0C8xzPHUUD8abSZawuynzp6YtJwqmZUhUkpeVbh+I7QFSKlGB
   VwlxYp7GRaRT7gS4wEONB6rutkGk/rvHW3RS0N86QRljYBsNu4Cov4EkL
   O60z8XDOHs6PLSefL8gAZLZM26QRaWxhxIBPptazdhhad5X+8at6U6wnY
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118816890
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:OaXLk6Poxv3D8lLvrR2Yl8FynXyQoLVcMsEvi/4bfWQNrUol32BUz
 mpNUT3Ta/qIYmH9KNFwOti/8RgBuZWByYRhGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5wFmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ttSA39A2
 dMIFG0uLSughO2y0ryQVvY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTFZUMwBbJ/
 goq+UzeLQAjbM7D+AOurG6W2+jBmBulYrkdQejQGvlC3wTImz175ActfVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBq1/6+ZtzqoNQAJLGUJYmkPSg5t3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgADorcNg+Ikx5nm3hP8oDGjoorHZRIqs1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZlCIUvIT46NuhXogj1mO8EZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlMi+dwlnhvnDqKHvgXKihLNpLEOBaopUotagPSPojVEovVyOkqz
 zqvH5TTkEgOOAEPSiLW7ZQSPTg3wYsTXPjLRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcFzVNS89NuK0DP6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:gAYnCqMlMffnscBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:tUzdC2xxAFfCrGRhXmzcBgUpP8I7fFHy3EuNAAyDKmVmTK+bYkOPrfY=
X-Talos-MUID: 9a23:XcapUwY8Cb1F+eBTkBD9vWlwaPZRyPqyMh0Kn5A+5fO/Onkl
X-IronPort-AV: E=Sophos;i="6.01,174,1684814400"; 
   d="scan'208";a="118816890"
Date: Tue, 15 Aug 2023 16:01:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] libxl: slightly correct JSON generation of CPU policy
Message-ID: <3c17bad8-758f-4a09-a6e6-8859adb1448c@perard>
References: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>
 <ec211f2b-7952-4944-89b5-302d9775cb4c@perard>
 <8400abdc-83bf-81b8-b2de-b80329afc629@citrix.com>
 <a3d488a6-514c-c3bf-890e-472cfb63be1d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3d488a6-514c-c3bf-890e-472cfb63be1d@suse.com>

On Tue, Aug 15, 2023 at 04:44:57PM +0200, Jan Beulich wrote:
> On 15.08.2023 16:28, Andrew Cooper wrote:
> > On 15/08/2023 3:26 pm, Anthony PERARD wrote:
> >> On Tue, Aug 15, 2023 at 02:35:55PM +0200, Jan Beulich wrote:
> >>> The "cpuid_empty" label is also (in principle; maybe only for rubbish
> >>> input) reachable in the "cpuid_only" case. Hence the label needs to live
> >>> ahead of the check of the variable.
> >>>
> >>> Fixes: 5b80cecb747b ("libxl: introduce MSR data in libxl_cpuid_policy")
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> > 
> > Hmm - this was included in the security backports.  I guess it ought to
> > go back to 4.15 (now that 4.14 is properly dead).
> 
> Depends on whether this is just a theoretical issue, I would say. Can
> legacy format input legitimately be empty? If not, I wouldn't bother
> putting this onto the security-only branches.

I don't think libxl would generate an empty array.
libxl calls libxl__cpuid_policy_is_empty() before calling
libxl_cpuid_policy_list_gen_json(), so no empty array.

Then, without this fix, I think it would just mean that libxl would
return an error on something that was ok to do before. So backporting
the patch would be a nice to have.

-- 
Anthony PERARD

