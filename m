Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860C961210
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784192.1193609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siy5H-0005lZ-44; Tue, 27 Aug 2024 15:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784192.1193609; Tue, 27 Aug 2024 15:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siy5H-0005jk-0e; Tue, 27 Aug 2024 15:26:15 +0000
Received: by outflank-mailman (input) for mailman id 784192;
 Tue, 27 Aug 2024 15:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYJc=P2=bounce.vates.tech=bounce-md_30504962.66cdf012.v1-9a14d418303b47678cf7d7952e218851@srs-se1.protection.inumbo.net>)
 id 1siy5F-0005hU-6w
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:26:13 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0433af5-6488-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 17:26:11 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4WtWbQ15hlzQXg2bZ
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 15:26:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9a14d418303b47678cf7d7952e218851; Tue, 27 Aug 2024 15:26:10 +0000
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
X-Inumbo-ID: b0433af5-6488-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724772370; x=1725032870;
	bh=lqqA/fCZvHf1v3hOUldCexVgyymrJAPgOfvTEDAlb30=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KWkPaHi2S4Q8Qe2GkalKLo3wOGQj4nG7srlbosQUZ1c8UdS1JiWOFV4LtRRvNl1E4
	 P008Z5wd4RvByKrL8gLaRgzj+/BDfttbu5w3mjQJ6+Th5OZGP9HDsaDyttwOoGF7IS
	 Yjo5wmaGe2lUXbSkuC2xtKVCrGeTKORuPpGdaiaXmcRMt9EC+RvmP2nuOz2o513K2X
	 7/oJcQFqc9UBQ4Aw/z9BGTvytmBOaVRAbcmjcwvY/j6divydfjaCDWoXYm4gQy8qYv
	 i3bU1bJLqwd1XQg/+CTIWuF5hSmHqD3BeB+c7UDUxLvG/anMyTb+GxW4XJbuki8dnG
	 jrMBsel2Ulc4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724772370; x=1725032870; i=anthony.perard@vates.tech;
	bh=lqqA/fCZvHf1v3hOUldCexVgyymrJAPgOfvTEDAlb30=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e+WcXq6+wnPAs4FH4IL8RlZ/rZa7YJIuYhoK2e+iivmA2Xc4ZpeCfjokzhOIIAgfv
	 6K4gqz+0T87NGe8TaQgmLFH7usUi9soxo4la/WWBPQgCEa2q+PM42IgLJ5lILJqOWh
	 ZaFUa5K49q6nskpoP6lLEBEQM9qfcDAWoMUSjl+nYrlYzeM7+oIdvtIepL235X3dWk
	 AryoAWJdJKK3tYOvP5cS90r+ld+ra4JTvmlBlpV2AREMfsalMSMl8idsUDVXppdIIV
	 4X6I89OwBmDqrgE1baBEYrG5Diq8BM0V/9JjqVqozI8iZyb0aV7EEa9EXDK2Tx4mk/
	 rjeRDCplvxKEg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v2=203/3]=20libxl:=20Update=20the=20documentation=20of=20libxl=5Fxen=5Fconsole=5Fread=5Fline()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724772369119
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com, andrew.cooper3@citrix.com, Juergen Gross <jgross@suse.com>
Message-Id: <Zs3wEK1HjdgkqVwE@l14>
References: <cover.1724430173.git.javi.merino@cloud.com> <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
In-Reply-To: <d868579d9ea98d8072630f5b85f7f7250ece393d.1724430173.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9a14d418303b47678cf7d7952e218851?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240827:md
Date: Tue, 27 Aug 2024 15:26:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Aug 23, 2024 at 06:05:05PM +0100, Javi Merino wrote:
> Despite its name, libxl_xen_console_read_line() does not read a line,
> it fills the buffer with as many characters as fit.  Update the
> documentation to reflect the real behaviour of the function.  Rename
> line_r to avoid confusion since it is a pointer to an array of
> characters.
> 
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>  tools/libs/light/libxl_console.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_console.c b/tools/libs/light/libxl_console.c
> index f42f6a51ee6f..652897e4ef6d 100644
> --- a/tools/libs/light/libxl_console.c
> +++ b/tools/libs/light/libxl_console.c
> @@ -789,17 +789,19 @@ libxl_xen_console_reader *
>      return cr;
>  }
>  
> -/* return values:                                          *line_r
> - *   1          success, whole line obtained from buffer    non-0
> - *   0          no more lines available right now           0
> - *   negative   error code ERROR_*                          0
> - * On success *line_r is updated to point to a nul-terminated
> +/* Copy part of the console ring into a buffer
> + *
> + * Return values:
> + *   1: Success, the buffer obtained from the console ring an
> + *   0: No more lines available right now
> + *   -ERROR_* on error
> + *
> + * On success, *line_r is updated to point to a nul-terminated
>   * string which is valid until the next call on the same console
> - * reader.  The libxl caller may overwrite parts of the string
> - * if it wishes. */
> + * reader. */
>  int libxl_xen_console_read_line(libxl_ctx *ctx,
>                                  libxl_xen_console_reader *cr,
> -                                char **line_r)
> +                                char **buff)

You may want to update "tools/include/libxl.h" as well. I don't know why
this comments is here instead of in the public header. At least there's
some documentation I guess.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

