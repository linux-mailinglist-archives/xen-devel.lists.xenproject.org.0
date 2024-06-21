Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F41912BEC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 18:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745411.1152545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhXh-0004CA-Aq; Fri, 21 Jun 2024 16:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745411.1152545; Fri, 21 Jun 2024 16:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKhXh-00049c-7J; Fri, 21 Jun 2024 16:55:17 +0000
Received: by outflank-mailman (input) for mailman id 745411;
 Fri, 21 Jun 2024 16:55:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I8X3=NX=bounce.vates.tech=bounce-md_30504962.6675b06e.v1-4f43be8da03145faae47ee3103af9c23@srs-se1.protection.inumbo.net>)
 id 1sKhXf-00049W-4Z
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 16:55:15 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 067fb639-2fef-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 18:55:13 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W5Nl26b3zzDRJ1XH
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 16:55:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4f43be8da03145faae47ee3103af9c23; Fri, 21 Jun 2024 16:55:10 +0000
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
X-Inumbo-ID: 067fb639-2fef-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718988910; x=1719249410;
	bh=mZ9ZjnfEi86A0eJMbTo9hmK9z6gDRUUYORm3zdn0tFk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JoSj4dbolwJDIQXSxBCq5uvT7lkpZ0MRxVFzCJuLm5BDpAFunDDrxYip75FjR1A89
	 e2kkkRMKwqCDH23ppPYT1dKVjYtmwqP3mwWdhFvmbRn4F475ZCzPSGobEnXOj4RgtK
	 uMs07SP0+LeEdScyfevMMhKMylogWG4i4QElT6X2bOluJ/YHQBon8HeO0gEsfPMvZ9
	 F7CjbiOh/GraXO0blPHIkFpkGfYiVSbRknafeN1pX9D7t4XYfi/hTVfwfRoc/Bb1KY
	 ql899byLzlE91LgZ6kJZZh4aXf91HhyiOsTTpsZA0T7K3Z8lHcopM0+nPNzQFoByeX
	 Z7TofFl13Uz3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718988910; x=1719249410; i=anthony.perard@vates.tech;
	bh=mZ9ZjnfEi86A0eJMbTo9hmK9z6gDRUUYORm3zdn0tFk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YTWcOlzewe06vGnvk3lUhdzmR3TPAMzeTHsE67/d3Z2qTG8Zx2NkhGzaRrnNO/e4f
	 Ba15wbIG7+lyxr5h3jgnEWxSgT31bid+nbYNNAmlyVH5WSbdQgXOSm+ntDJxCi4NsE
	 uHR+dS2VJ2StkhDqMf9H1K7ohJ/P3OtIo+9jxwr8d07BHVVQ13RliGCs9Yz0jltINb
	 0Ccto6OBflplaYySoqF3I1EW9hHEpl+NFT462zi7gDdf5gcL8NbD1aJOQvfbSAKFi3
	 KKquCutTeeA3hpW1uNqZB3c3zHg8nL9lJrQTksALydECSZHHC6O119Q/mPYuqJfLvr
	 ewc8idELVo7Pg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20for-4.19=20v2]=20tools/xl:=20Open=20xldevd.log=20with=20O=5FCLOEXEC?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718988909523
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Demi Marie Obenour <demi@invisiblethingslab.com>, Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZnWwbJiD6eG85VY9@l14>
References: <20240621161656.63576-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240621161656.63576-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4f43be8da03145faae47ee3103af9c23?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240621:md
Date: Fri, 21 Jun 2024 16:55:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 05:16:56PM +0100, Andrew Cooper wrote:
> `xl devd` has been observed leaking /var/log/xldevd.log into children.
> 
> Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd=
, so
> after setting up stdout/stderr, it's only the logfile fd which will close=
 on
> exec().
> 
> Link: https://github.com/QubesOS/qubes-issues/issues/8292
> Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony@xenproject.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Also entirely speculative based on the QubesOS ticket.
> 
> v2:
>  * Extend the commit message to explain why stdout/stderr aren't closed b=
y
>    this change
> 
> For 4.19.  This bugfix was posted earlier, but fell between the cracks.
> ---
>  tools/xl/xl_utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
> index 17489d182954..060186db3a59 100644
> --- a/tools/xl/xl_utils.c
> +++ b/tools/xl/xl_utils.c
> @@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfil=
e)
>          exit(-1);
>      }
>  
> -    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY|O_CREAT|O_APPEND, 06=
44));
> +    CHK_SYSCALL(logfile =3D open(fullname, O_WRONLY | O_CREAT | O_APPEND=
 | O_CLOEXEC, 0644));

Everytime we use O_CLOEXEC, we add in the C file
    #ifndef O_CLOEXEC
    #define O_CLOEXEC 0
    #endif
we don't need to do that anymore?
Or I guess we'll see if someone complain when they try to build on an
ancien version of Linux.

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


