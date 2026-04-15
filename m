Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UB6NNuaB32mcUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:17:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D74042CD
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:17:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282354.1564960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCypu-0000Jm-Le; Wed, 15 Apr 2026 11:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282354.1564960; Wed, 15 Apr 2026 11:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCypu-0000Hx-Iw; Wed, 15 Apr 2026 11:55:14 +0000
Received: by outflank-mailman (input) for mailman id 1282354;
 Wed, 15 Apr 2026 11:55:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df7b8f.v1-b04eb2f46eaf41bd866880f8e9a735d4@bounce.vates.tech>)
 id 1wCyps-0000Hr-Us
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 11:55:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCyps-00AGON-6h
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:55:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df7b8f.v1-b04eb2f46eaf41bd866880f8e9a735d4@bounce.vates.tech>)
 id 69df7c99-2eae-0a2a0a5409dd-0a2a4504dc3a-22
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:55:12 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df7b8f.v1-b04eb2f46eaf41bd866880f8e9a735d4@bounce.vates.tech>)
 id 69df7c9e-bb33-0a2a45040019-c602bb01cb85-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:55:11 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fwfbg27tFzBsYwV7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 11:50:39 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b04eb2f46eaf41bd866880f8e9a735d4; Wed, 15 Apr 2026 11:50:39 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776253839; x=1776523839;
	bh=GCGte0Z3A7kTvS18fV4wo3myVXmVNIE4719dmtr62Y0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Q4V7IjTnk/JsoSc9/BAmAURWO4Wr3bjPXoyLls88u3V52eVPlhVITGvL7+HCbag4d
	 85mtUVb+J8rmlhlmI8J+hQQQ66dHhZvBjf/DR2vwx+MWRbyhSO6+0tHqFubo8zL3XR
	 kofeiLBgrOaBwWCyc10J+y4gg3wMztkHqFW1f9DmkZET+GfKR6uUnmMeMlPMQhQAUV
	 QTZdrmSWtzpPa4GdWi6vMPRB7Y6X4CL1p2q3uCl2DSaiZexK+o3Eoflp2fOUf23Ruq
	 lnXIn1iamPre9E413bhzTrJ15zb/sMWKO0dHptbSrzeiPcCtH1hMRm5TRkWdpKQ9fl
	 YIXZC6f0Zs8HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776253839; x=1776514339; i=anthony.perard@vates.tech;
	bh=GCGte0Z3A7kTvS18fV4wo3myVXmVNIE4719dmtr62Y0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ge0N67Uck/NbUZCNCkXqNqIUFYS9H6/unHpl2eDXICYaL0+1SEj06Iqi+ebkzei03
	 sUKipL9XVtgU13D1YjNx9e7JqDOXCsWkBubByYfAQc/8AzWo0h/J11Wb0OOVXB6n2E
	 h4OrMLFjzfOvsKmbIFlCv1wOi4e5TOu70LneY16FZSl2v++gtJ+ioOiQbGYMC/ku9X
	 ahp3IujpHyUvaXEKXp5P1k1H+EAtBkquJCewOI9rgnR4jsPiRTc5t76vg8UutUfUpR
	 sdlNxR/ruSFVtTfD6ByQkO1pFlntplhhXY9nmDHXtEPOSeUpDcCe/1ehWCgi4g4GUe
	 Z6Qv4wGaC7erQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2003/13]=20Add=20debian=20rootfs=20artifact?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776253838063
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <ad97jcRfLG7nXk29@l14>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b04eb2f46eaf41bd866880f8e9a735d4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 11:50:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776254111-B052B51B-E85556CC/0/0
X-purgate-type: clean
X-purgate-size: 1415
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.473];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7C6D74042CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I'm commenting on changes I found in the branch used by the pipeline
linked in the cover leter, since there's no copy on the mailing list of
the patch :-( (overzealous spam filter).

> diff --git a/scripts/debian-rootfs.sh b/scripts/debian-rootfs.sh
> new file mode 100755
> index 000000000000..7cb8a96e39c0
> --- /dev/null
> +++ b/scripts/debian-rootfs.sh
...
> +PKGS=(
> +    # System
> +    bridge-utils
> +    dropbear
> +    udev
> +    systemd-sysv
> +    iproute2
> +    inetutils-ping
> +    util-linux
> +    cpio

Is `cpio` going to be used in dom0? The alpine rootfs don't have it.

> +# don't need persistent logging, avoid journal flush service
> +rmdir var/log/journal

I think this would better be done with:

    cat >> /etc/systemd/journald.conf.d/storage.conf <<EOF
    [Journal]
    Storage=volatile
    EOF

because I think systemd intend to change the behavior in future release,
and we are more explicit with a config file.

> +# Create rootfs
> +cd /
> +{
> +    PATHS="bin etc home init lib lib64 mnt opt root sbin srv tmp usr var"
> +    find $PATHS -print0
> +    echo -ne "dev\0proc\0run\0sys\0"
> +} | cpio -0 -H newc -o | gzip > "${COPYDIR}/rootfs.cpio.gz"

You should add "-R0:0" to the `cpio` command, like we do for the alpine
rootfs.

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


