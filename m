Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097E3A0120B
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 04:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865099.1276382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuce-00006h-Ql; Sat, 04 Jan 2025 03:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865099.1276382; Sat, 04 Jan 2025 03:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTuce-0008Vd-NO; Sat, 04 Jan 2025 03:14:44 +0000
Received: by outflank-mailman (input) for mailman id 865099;
 Sat, 04 Jan 2025 03:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTuce-0008Th-1O
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 03:14:44 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b0ed275-ca4a-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 04:14:43 +0100 (CET)
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
X-Inumbo-ID: 0b0ed275-ca4a-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735960481; x=1736219681;
	bh=D1ssMuDmIJSpNwfMTnSXVzZ5KkJWdueZcgrK5R+JnHQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=JlJ9mL+JMb3A/gW7qO1y738KYQ799+nUqTEa5m6lypGsXKRWPbsxYbp6YYTnFNYWO
	 xbdtD4nJdJpjq5vvKPM93FAEmSmJwBk+Rhq3ewR5lgiMcA6Y/hr6UiOnzW0ZlMtcdr
	 2puE6KsBoYpzsyQuQhrkPhqMRfSD+nhPcKapxUsm29KWBU45q32vxcp174SoMamUb8
	 pkxsq7gxTSKCl8LkzRqUAaHexqD2z+J7PojHCnWw5PUMyVA0u6bQ4FseaQST3i4MHp
	 dwBzMRDaT3DEfOqX7xLTHqXoHetClC/vmDRu4Z3uHfIcGYa+pEJHqzAIiQD4S2zjRh
	 85zwaIM6gh17w==
Date: Sat, 04 Jan 2025 03:14:36 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 14/35] xen/console: rename switch_serial_input() to console_find_owner()
Message-ID: <VUeBPTQ1ejbYSp84LPJEtoNjpaXuZQ_G9ohq4bPJGkMIpbzQ_NbcvvlpFwK9iwUd8-HrNGqLp9sqpMAqFfUPtUfZGPEpI-9CmzVw-R9DZlI=@proton.me>
In-Reply-To: <Z1nKX2oK6-nIh2XH@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-14-e9aa923127eb@ford.com> <eb9246cc-059d-4dca-aca8-e75976537206@suse.com> <Z1nKX2oK6-nIh2XH@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 2caaa00d7ce899463471de875c35e85f46402aaf
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, December 11th, 2024 at 9:22 AM, Roger Pau Monn=C3=A9 <roger.p=
au@citrix.com> wrote:

>
>
> On Tue, Dec 10, 2024 at 03:13:20PM +0100, Jan Beulich wrote:
>
> > On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> >
> > > From: Denis Mukhin dmukhin@ford.com
> > >
> > > Updated the name to highlight the logic of selection the physical con=
sole
> > > owner: existing code does not switch only serial console, it also swi=
tches
> > > video console and debugging console (debug I/O port and console hyper=
call).
> >
> > I'm especially surprised you mention "video console" here. Afaics all o=
f
> > this is only about console input, and no input comes from a video devic=
e.
> > Arguably "serial" in the original name is too narrow now. Yet "input"
> > continues to be quite appropriate.
>
>
> switch_console_input() maybe? switch_console_input_target() even?
>
> I think the switch is also relevant, as it shuffles the input around,
> console_find_owner() doesn't seem to convey that meaning.

Renamed to console_switch_input() in v3

>
> Thanks, Roger.



