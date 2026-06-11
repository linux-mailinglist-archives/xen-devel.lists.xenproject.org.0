Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JmkSNq01K2o/4QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:24:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3CD6759A6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 00:24:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fdPVpPJx;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1336192.1598066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnoP-0007fp-Dc; Thu, 11 Jun 2026 22:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336192.1598066; Thu, 11 Jun 2026 22:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXnoP-0007dH-AG; Thu, 11 Jun 2026 22:23:45 +0000
Received: by outflank-mailman (input) for mailman id 1336192;
 Thu, 11 Jun 2026 22:23:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXnoM-0007dA-Vq
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 22:23:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXnoM-007wP9-Ck
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 00:23:42 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2b3563-e002-0a2a0a5209dd-0a2a4508ab80-8
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:23:42 +0200
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2b356d-63b5-0a2a45080019-4a7de02aac57-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 00:23:42 +0200
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-6603d8697d2so367762d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 15:23:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781216621; cv=none;
        d=google.com; s=arc-20240605;
        b=etDAsW0EzZHf9BpPGWrHwNDgInjl7pcqNXUU53DJWcwlyGpxuH9tWWv7p9P2O5dw+P
         w+CNWqozK5UWWwH8gC2XavETuxANr8gMrs2yM3/UUAJzlqyFsodJLSJ/3tBNHs2bNZtB
         a0wXOvcuKk6fHjOJv1Z2H0dAIxdAfm4AZODSOIMwReOV9oVbu1yEP09cmnzTLWZf8voq
         6e9ZzQi6aEQtrdo5529W+5F99ECq7KFk+sB9m12m5ecpDWgKqPYNijulK3DM1A6xGhXM
         qWxkrDukaNxlQd9i30L4XCKS74JRwdScJN6Ua5EGAWaoKw7fMItvMeNRuv9UuXkHKRwG
         R91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WfvkcO+uLXTqDgSjP+KHQU7Iz2CNjEWfT63b78r4sN0=;
        fh=oC/kQkef0Xp7NMn8QOiJRI7rTAf9vhety7/OfeS+l+4=;
        b=QeLJiWCRCItNanPifkLlngnjy5gNGcdoiAKAaMDwjb33UKpVcVso2a5iNjc4b4u79Z
         D4dhoTuXpMh+Lw7B9IIGbmNmq8vjF+zN9pdDfAWKwSr5miFBBJXt7jcR3Cx684BPftdU
         qGVMvM+JRZkMRi/QZuL9DOrioZkq/aGFWwqEVrY+cGDl/cjgHNCw7BwdfnxwhPn6CWgI
         I3xXJzhIHjV1v4UhCHXSdz2bjGFd8gbwHA9QAmyX9vGag8w0HzKYPUdmpcVRDxYdRZ2N
         zfhCGDDXgfP+pUEJgL1v4JSWLH6lasqHTzXr5KAy9IXHCjqOjTJXyYKeml9LSuv0UYfT
         tPsQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781216621; x=1781821421; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WfvkcO+uLXTqDgSjP+KHQU7Iz2CNjEWfT63b78r4sN0=;
        b=fdPVpPJxT2oLfj2WFen1ocLwhI+5xwORDWDGQ7wXGUCm2/EQwo8O/1P14u5UpmFEqN
         4jBc1PPO9hjVVnkJ18I5qnvH7pDhImTi3lrDifb5Ih/IfAqNwYawcze9E9ZbaQPbnQOk
         7YGAM+kgCqrDMNUAWIKZDlqRJ6XsPatt92KOwExN0/YJ7vYLH1daAHaSd6eEJp/rFxts
         wwDW65LhaYzhKTNFnLIlgPznNlWhmfamBj+wZcysNRPBUcwlbHnCQn+cxsTJ2Gf2AvfE
         8FP0Hk1CvrBwN1V3mDfkmwkKgfPsndiOpHR9TznhQ70J7jyJl63uzyAW11apa23rw2R8
         om9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781216621; x=1781821421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfvkcO+uLXTqDgSjP+KHQU7Iz2CNjEWfT63b78r4sN0=;
        b=F9B603IwSmRp/33nnvYEIio9q0mX+z4V4Mepw4GPH+OAwEQpZ0qKZfwGaY5i26zrgP
         /LwIl8Ji3H2i9HE3YNxp4WY7czZKJ40M/mKUU/3ZmGf7wkA+GMO3PYZGTuiaYa3gvZrB
         JzoQ4OOG5pjk7uMdhi+MP+nBkreU8Bk+VGc2MHRTOC13sDnHVy/uS4ko0vgT2TxUL/Zt
         jbMAwlvQRGYABynY9B/z6vwePwMwHvJHRirSqGoUhE8N/Yart3Qt7iTR35jqRW9/Lw8W
         r89Z2a0Jj4lZADlOADFWpw7ludhqPhV4/ngfsRO8r4OGtKvOFfOJZYz3IhMMwa2LnN2y
         kOwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CfnI2JpgGmsBY9n5vIQ6S2MdD2BYvXm3AXGnG1zDKCt0B5nME8A+u0Viu/YYwa8GrWTIIss1DSrc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5mkibS6ChdStJpTKe1+YSpALV0LxwfvGRjFfAKNgSUZyyFFDi
	C+Sb39Ff6xy4/F5aZH8mJarEtfs9Q6351y0qIRWkHv3KiHZRwLEvaogQaswFVnZjuEqnXH1m9rh
	pZPlX/T3UM9JadYBvU5yU1MzL2H1aw/I=
X-Gm-Gg: Acq92OHgRxi5LcH6do3DiNLDw/OwFDKAtjTo3IPvXafubCMGtYE9rCzbS1WVmtYFcDg
	Hc0kHW2oAd9AqbDVzpm7yWOca+CztP+IZdcuuwB9d/LPtF2qG+2sgdZropCLQxB5xnNOJLs9fg0
	VgwXjXFA2Htva7p6Zm9xd+oWDQJd4YgLgqY7ZDzESbsQvR2/p/SfPAMB3qGDENvLkGzt/wkKoO/
	gtWWXBwk1xrWk7EO6lv+ZpWgqsL8iVITA70JbaEx8ElxtQlcnAAtmPIUchdOw8BgG0E7h3w2gwa
	H7AsxVN6cKaJGNeygXJtZI/YqTzjRRgvP8A88g==
X-Received: by 2002:a05:690e:169c:b0:660:a41d:d180 with SMTP id
 956f58d0204a3-66277f74193mr138196d50.21.1781216620728; Thu, 11 Jun 2026
 15:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-2-frediano.ziglio@cloud.com> <9d59cf76-f0e0-4e6e-9413-6c7d70a4594b@suse.com>
 <57b3b624-297b-4d31-9933-164cb46795eb@suse.com>
In-Reply-To: <57b3b624-297b-4d31-9933-164cb46795eb@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 11 Jun 2026 23:23:28 +0100
X-Gm-Features: AVVi8CfW1mlyM-eU4AZftZRHa8j1yS2bB8naSoc895rcOY9pr5g5Zb8xYtTEwlg
Message-ID: <CAHt6W4d47rCj_ome=SFXrL--5F16-Ly8XcBm=aut-QRAmz6hXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Align some sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1781216622-BE368DB1-F5E34224/0/0
X-purgate-type: clean
X-purgate-size: 993
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E3CD6759A6

On Thu, 11 Jun 2026 at 17:08, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 11.06.2026 18:07, Jan Beulich wrote:
> > On 11.06.2026 17:32, Frediano Ziglio wrote:
> >> Required by UEFI CA memory mitigation.
> >>
> >> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> >> in the pagetables.
> >>
> >> NX_COMPAT is a requirement from shim-review,
> >> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> >>
> >> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >> --
> >> Changes since v2:
> >> - Change subject.
> >
> > Did you? The description also doesn't look to have had any detail added.
>
> Or wait - the subject tag also says v2. Did you (re-)post the wrong version?
>
> Jan

No, the series is v2, but in the comments should be "Changes since
v1:" (as the majority of emails are).

Frediano

