Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBF2A011F9
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865000.1276271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuIs-0006dy-0S; Sat, 04 Jan 2025 02:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865000.1276271; Sat, 04 Jan 2025 02:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuIr-0006ay-UB; Sat, 04 Jan 2025 02:54:17 +0000
Received: by outflank-mailman (input) for mailman id 865000;
 Sat, 04 Jan 2025 02:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuIq-0006ai-OR
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 02:54:16 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ea3acc1-ca47-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 03:54:14 +0100 (CET)
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
X-Inumbo-ID: 2ea3acc1-ca47-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735959253; x=1736218453;
	bh=ieijF41JW5XbidMsvo3le8DzS9ZniHQdg2RpsvTEbF4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mTAT5LYGBM8+jsDRAAHbkrw4mTw1Aroc3LcmhnheSthS5+nv7tpauiBrGvCdh844W
	 TL0NFtytooud3TTJPO8RRMF8Y63FUIE9DQmFzzrQbfGHFiVimP2OUutzG28BC8Mqt1
	 BO8AqTrUaniW2XA4HX0h3wsQhIQW7aCPDWThqF6ys2zK0DdUXILhSavvScDhV5Z6vD
	 jUkqSuZTNwLW9PcOrYO61hVZx/mRFR92hdgAMUOS1Y5IeHdgqNrZfImmNupX7h8ClA
	 Di1J6DLQ1JwWYao+8jWPSbuO1sUnIdZDI2O3S9/KPKVEHpWeop4MUQCzo2DWj9/JBK
	 odZUkN6zFNuaQ==
Date: Sat, 04 Jan 2025 02:54:09 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/35] xen/console: rename switch_serial_input() to console_find_owner()
Message-ID: <jm9J6dVwIhRA-3cxYQhsRTVd2KB4a_EoRUvLKCf2z1bIPf5WK3HcKGLiJO1fPa4v_h9EW64y0W67LUu-WzidIduKoVzMV2RCykHx3S4MfSM=@proton.me>
In-Reply-To: <eb9246cc-059d-4dca-aca8-e75976537206@suse.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com> <eb9246cc-059d-4dca-aca8-e75976537206@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 975a7d3318596125c56970c2fc86670c2caaef4a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 6:13 AM, Jan Beulich <jbeulich@suse.com>=
 wrote:

>
>
> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>
> > From: Denis Mukhin dmukhin@ford.com
> >
> > Updated the name to highlight the logic of selection the physical conso=
le
> > owner: existing code does not switch only serial console, it also switc=
hes
> > video console and debugging console (debug I/O port and console hyperca=
ll).
>
>
> I'm especially surprised you mention "video console" here. Afaics all of
> this is only about console input, and no input comes from a video device.
> Arguably "serial" in the original name is too narrow now. Yet "input"
> continues to be quite appropriate.

Yes, sorry, the explanation is wrong.
Fixed.

>
> Jan



