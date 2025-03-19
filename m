Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E19A68B33
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 12:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920286.1324499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turSV-0007dP-1t; Wed, 19 Mar 2025 11:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920286.1324499; Wed, 19 Mar 2025 11:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1turSU-0007bx-U1; Wed, 19 Mar 2025 11:19:38 +0000
Received: by outflank-mailman (input) for mailman id 920286;
 Wed, 19 Mar 2025 11:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVP4=WG=bounce.vates.tech=bounce-md_30504962.67daa846.v1-c829fb28c761432fa62736717d7fa88d@srs-se1.protection.inumbo.net>)
 id 1turST-0007br-Vq
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 11:19:38 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 098a4657-04b4-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 12:19:35 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZHmSk2rldzBsV1sl
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 11:19:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c829fb28c761432fa62736717d7fa88d; Wed, 19 Mar 2025 11:19:34 +0000
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
X-Inumbo-ID: 098a4657-04b4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742383174; x=1742653174;
	bh=QZlgajSwl2RyvJxOJcrVQvdG5kLVYpqv9rSSpBokbkc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=j4n/Fp+awWbp8DNH4qJqAUBHUPopke+68uM+FyFHaJ+Ujcoiplsa0ya8EbotfbdlT
	 nPN2hDculpZQuPuL6Z+g4KpIQbrE2m9cEPC87YC2BhZ7prqjB2G2CSydogfal7hryw
	 vj3CSzXvAxmankdSsofax/zbvcQDG3whWU1kj8ob/NfxhuTcA01rxKLAK6e34ryGAi
	 V90Yz8aaov2Lpr5eaQg1yYQHE2F6Z7nvvA2RlrzFnJTjHMCXVKh0s07czZvAnLGRzY
	 tgvmOl/mIiAnfnt+addiiGicXYBZ4N+kZ401c+fw3bL5QSEk3LTAqvHhbGFeQdSo1B
	 OPM5+KrjWrnTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742383174; x=1742643674; i=anthony.perard@vates.tech;
	bh=QZlgajSwl2RyvJxOJcrVQvdG5kLVYpqv9rSSpBokbkc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=s10mKYcdhoeeDjDSskJLQp7MFjVrWEVpvMsdM9T7b9P9f4/Sx2KNAQqnjOsXZV+o6
	 emEnQF5fMy6ms031fA9kvSdr1S+0fiRlOp9eUgYheu7WoJ7BxuDhK+gUztL34Xr+9L
	 oCzxIVAyLy1XG2CQrRNxdVQEmfcHhCpAGKW9v2jeuQhYdOpUBgWoO5eky6+Q0RX6Tn
	 /I6oS0vMnvv3tNSMGShsoppKSvIeITxJnAQtX0YNnSUoArK6H427FQHeeQRMeHwURd
	 G7pKSgaNn5w1f0HyUsfY7NOQjfZVpx9rt3aqW2qQliEkJdQYyEbtrfhVeEUCW3cJ6E
	 Lr0RmZZUsDj8Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=201/2]=20docs/xen-headers:=20use=20alphabetical=20sorting=20for=20@incontents?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742383171925
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "=?utf-8?Q?Fr=C3=A9d=C3=A9ric=20Pierret=20(fepitre)?=" <frederic.pierret@qubes-os.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z9qoQ4wwfWZ7ID2T@l14>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com> <09f34b27d576d1067cc38eaa202aebebb0478cff.1742317309.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <09f34b27d576d1067cc38eaa202aebebb0478cff.1742317309.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c829fb28c761432fa62736717d7fa88d?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250319:md
Date: Wed, 19 Mar 2025 11:19:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 06:01:56PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> From: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qubes-os.org=
>
> 
> It makes the build reproducible with fileordering flags
> 
> Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret@qub=
es-os.org>
> ---
>  docs/xen-headers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/xen-headers b/docs/xen-headers
> index 8c434d77e20e..98ffe814500b 100755
> --- a/docs/xen-headers
> +++ b/docs/xen-headers
> @@ -331,7 +331,7 @@ sub output_index () {
>  <h2>Starting points</h2>
>  <ul>
>  END
> -    foreach my $ic (sort { $a->{Seq} <=3D> $b->{Seq} or $a->{Title} cmp =
$b->{Title} } @incontents) {
> +    foreach my $ic (sort { $a->{Href} cmp $b->{Href} } @incontents) {

Why is `Seq` been ignored? As I understand, the index is supposed to use
it as first ordering key.

Comment in that same file:
    #  extra syntax:
    #   `incontents <seq> <shortname> <anchor text html>...
    #                              make a table of contents entry; they
    #                              will be sorted by increasing seq, and
    #                              shortname will be used as the anchor tar=
get

Also, we already have a fix for reproducible build:
    e18dadc5b709 ("docs: use predictable ordering in generated documentatio=
n")

Would it be enough to replace `Title` by `Href` for the second sorting
key instead?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


