Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B55CA5E226
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910570.1317258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPTP-0005cI-3G; Wed, 12 Mar 2025 17:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910570.1317258; Wed, 12 Mar 2025 17:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPTO-0005Z9-W6; Wed, 12 Mar 2025 17:02:26 +0000
Received: by outflank-mailman (input) for mailman id 910570;
 Wed, 12 Mar 2025 17:02:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8CKI=V7=bounce.vates.tech=bounce-md_30504962.67d1be1d.v1-2218173268df41b89b4d36b089ef3db2@srs-se1.protection.inumbo.net>)
 id 1tsPTN-0005Z3-5Y
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:02:25 +0000
Received: from mail186-3.suw21.mandrillapp.com
 (mail186-3.suw21.mandrillapp.com [198.2.186.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3e14e23-ff63-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:02:23 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-3.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZCcPT6tqkzDRJCNH
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 17:02:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2218173268df41b89b4d36b089ef3db2; Wed, 12 Mar 2025 17:02:21 +0000
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
X-Inumbo-ID: c3e14e23-ff63-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741798942; x=1742068942;
	bh=hbn/KdsQKCwsKDnc36R6SsX38E476tfkH6g8ajEq1KE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cmp47XSdh55CYHqkR/CE+lzQ1ipy2Ge01MeS0LBRqpeSnlpZCf3QZW47RTeCzaftD
	 YLcuGraID6sVQtOzyj97E3GMckKyZiRbkxwyJ9QXY5yODi/WSoAjMnpIplD7dWxOaj
	 jg8ucZWLyorX0RPFsexuqNKd3ors5q6uLxsdahe5zufodjMfM918UHbw4ZDqtT2+WF
	 warX3wTjo093yltrEFyct1XWTi2OwYYqMk9EgEXCM1XXN7Ya8YY7WPPB25G2eOiGhU
	 +Js5TMNiQpz30Ds8YILlZW156aW45bytoutdTG+V92hIgTBXtYH2Ah1kAD+L/iezt/
	 xPktLl9kH68eA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741798942; x=1742059442; i=anthony.perard@vates.tech;
	bh=hbn/KdsQKCwsKDnc36R6SsX38E476tfkH6g8ajEq1KE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eEgxbVaT1wPDn3DLJ5yl15OqYbXicmtMGJwO/oETeS3cNXRxo77hha9xncoLzJt5j
	 vmF3acHR9EH9z6M72SyvyQPTA2Ziu0cW9nk7Dq2zgnNJfilGjUHpR3EjDcoe/Aa8ov
	 V7O4M3Sn548J8BzjWlJkWzgNBFl04jfTKjzwzACoRCPD1EtlVtQ5kqZ4qvq5sRJY66
	 KdevVPi0Jh7KYzjcEHuyT0gf+d+g0UUxMuSxkzClgu83aW8HteoDr4UNo38SsKjIIS
	 sEwkNNPnGBykN9NX8Mtya/67gDcJH8qcUz1hCrR7H89yPGhDQiS+Jkqexfdx+jGEFf
	 /uDbS3WjG06Mg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20libxl:=20avoid=20infinite=20loop=20in=20libxl=5F=5Fremove=5Fdirectory()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741798941258
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <Z9G-HMRLi9Kg6pb4@l14>
References: <0d3655d6-8551-486b-85ca-e64378231278@suse.com> <120ef18b-0bdb-48a1-be7d-177e7ea36239@suse.com>
In-Reply-To: <120ef18b-0bdb-48a1-be7d-177e7ea36239@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2218173268df41b89b4d36b089ef3db2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250312:md
Date: Wed, 12 Mar 2025 17:02:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 04:01:53PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 06.03.25 12:25, Jan Beulich wrote:
> > Infinitely retrying the rmdir() invocation makes little sense. While th=
e
> > original observation was the log filling the disk (due to repeated
> > "Directory not empty" errors, in turn occurring for unclear reasons),
> > the loop wants breaking even if there was no error message being logged
> > (much like is done in the similar loops in libxl__remove_file() and
> > libxl__remove_file_or_directory()).
> > 
> > Fixes: c4dcbee67e6d ("libxl: provide libxl__remove_file et al")
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> While probably a more sane solution by reworking this whole mess

libxl?

> is possible, this patch should solve the issue Jan has described.
> 
> So:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


