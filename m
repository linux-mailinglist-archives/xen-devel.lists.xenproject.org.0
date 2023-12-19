Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A98184E9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 10:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656631.1024944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWsA-0002x1-SC; Tue, 19 Dec 2023 09:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656631.1024944; Tue, 19 Dec 2023 09:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFWsA-0002us-OY; Tue, 19 Dec 2023 09:58:46 +0000
Received: by outflank-mailman (input) for mailman id 656631;
 Tue, 19 Dec 2023 09:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nbmq=H6=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1rFWs9-0002um-CB
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 09:58:45 +0000
Received: from mail.alien8.de (mail.alien8.de [2a01:4f9:3051:3f93::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3135c196-9e55-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 10:58:43 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1E9D40E00CD; 
 Tue, 19 Dec 2023 09:58:40 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id nodqOZyKC-fR; Tue, 19 Dec 2023 09:58:38 +0000 (UTC)
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 52F0440E00C9;
 Tue, 19 Dec 2023 09:58:28 +0000 (UTC)
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
X-Inumbo-ID: 3135c196-9e55-11ee-9b0f-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1702979917; bh=S3JFK1fju4B6xZ8eBdvZm+1HPPTszSQfGOo5AjwDssQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bD6HE4bsbc2OQkFhBB+xvJpvtivUcbd5wsY25h5phYM5J0eGRJUdNjmLwiAj6o7KK
	 gx3zGOLBwaZx5irPCWSX12wRoLv0IAl+XUNK4E8HxoZ13p5mWNyp7yOwWULdywRjH6
	 5gcskawHSQTCP5ivxwfiClK6fMubzKPAFW/U/3aJr+7UCIMSODR6bs3edM6SJn5czn
	 OACfG3Zv8y47kzDmIxIJBxWYXwYmvrBX5dI8WxQDRb81xltEcbxECtWtaEmO25zyvM
	 gtmYY37HJsGk/je25y3mVFSnMcvmYnQ+bbLsWxcMqP3vb2HvCE+542GrIWJDvJ5bRj
	 7m/8UuT8KN8+aGySZnllMiqnK+PtqnftUlpKm2CMmD+Y/20l0XG7C44Ii+8UbsuYHo
	 LBb5YUD34PfChNkUKqSH16PxRKNYvEx5lYTfDNBscw4HdZQHBfVAZl97LSdeWyJRiv
	 TMNVslgsF7WUUOnfafwU4plYk5Z34hf8X+u+TqQw2K7mebiWcIapQ95JrjyNCh0vTr
	 l7rDMR+1oW20WEJrPQouBQ49B75bWuGLMQiKJ9i+UkxYjGUKqjgH4diOo/GzmaOIxt
	 gKgbNwYUU3zVG7Y+Hk5s7Wda4a8TTj75z9yFOYxO/5ZEkj/SL6tOK54uo4eMq0YXp5
	 tqSoCzkE/3DJJCyAfh/NHjzw=
Date: Tue, 19 Dec 2023 10:58:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [linus:master] [x86/entry]  be5341eb0d:
 WARNING:CPU:#PID:#at_int80_emulation
Message-ID: <20231219095821.GAZYFpPUSKexZAcl05@fat_crate.local>
References: <202312191507.348721d2-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202312191507.348721d2-oliver.sang@intel.com>
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 04:49:14PM +0800, kernel test robot wrote:
> [ 13.481107][ T48] WARNING: CPU: 0 PID: 48 at int80_emulation (arch/x86=
/entry/common.c:164)=20
> [   13.481454][   T48] Modules linked in:
> [   13.481655][   T48] CPU: 0 PID: 48 Comm: init Tainted: G            =
     N 6.7.0-rc4-00002-gbe5341eb0d43 #1
> [ 13.482162][ T48] RIP: 0010:int80_emulation (arch/x86/entry/common.c:1=
64)=20

Looking at the dmesg, I think you missed the most important part - the
preceding line:

[   13.480504][   T48] CFI failure at int80_emulation+0x67/0xb0 (target: =
sys_ni_posix_timers+0x0/0x70; expected type: 0xb02b34d9)
			^^^^^^^^^^^

[   13.481107][   T48] WARNING: CPU: 0 PID: 48 at int80_emulation+0x67/0x=
b0
[   13.481454][   T48] Modules linked in:
[   13.481655][   T48] CPU: 0 PID: 48 Comm: init Tainted: G              =
   N 6.7.0-rc4-00002-gbe5341eb0d43 #1

The CFI bla is also in the stack trace.

Now, decode_cfi_insn() has a comment there which says what the compiler
generates about indirect call checks:

         * =C2=A0 movl    -<id>, %r10d       ; 6 bytes
         *   addl    -4(%reg), %r10d    ; 4 bytes
         *   je      .Ltmp1             ; 2 bytes
         *   ud2                        ; <- regs->ip
         *   .Ltmp1:


and the opcodes you decoded...

> [ 13.482437][ T48] Code: 01 00 00 77 43 89 c1 48 81 f9 c9 01 00 00 48 1=
9 c9 21 c1 48 89 df 4c 8b 1c cd 90 12 20 9a 41 ba 27 cb d4 4f 45 03 53 fc=
 74 02 <0f> 0b 41 ff d3 48 89 c1 48 89 4b 50 90 48 89 df 5b 41 5e 31 c0 3=
1
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	01 00                	add    %eax,(%rax)
>    2:	00 77 43             	add    %dh,0x43(%rdi)
>    5:	89 c1                	mov    %eax,%ecx
>    7:	48 81 f9 c9 01 00 00 	cmp    $0x1c9,%rcx
>    e:	48 19 c9             	sbb    %rcx,%rcx
>   11:	21 c1                	and    %eax,%ecx
>   13:	48 89 df             	mov    %rbx,%rdi
>   16:	4c 8b 1c cd 90 12 20 	mov    -0x65dfed70(,%rcx,8),%r11
>   1d:	9a=20
>   1e:	41 ba 27 cb d4 4f    	mov    $0x4fd4cb27,%r10d
>   24:	45 03 53 fc          	add    -0x4(%r11),%r10d
>   28:	74 02                	je     0x2c
>   2a:*	0f 0b                	ud2		<-- trapping instruction

... these guys here, look exactly like what the compiler did issue.

This is the first time I'm looking at this CFI bla but it sounds like it
is trying to compare the syscall target's address of
sys_ni_posix_timers with something it is expecting to call and the
comparison doesn't work out (%r10 is not 0).

There's that special symbol __cfi_sys_ni_posix_timers which also gets
generated...

Someone would need to dig into that whole CFI gunk to figure out why
this is not happy.

Oh well.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

