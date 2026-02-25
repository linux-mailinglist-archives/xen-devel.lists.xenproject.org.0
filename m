Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NfOBjnUnmkTXgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:51:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3288196057
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240547.1541897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvCTa-0003S1-VD; Wed, 25 Feb 2026 10:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240547.1541897; Wed, 25 Feb 2026 10:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvCTa-0003PB-S3; Wed, 25 Feb 2026 10:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1240547;
 Wed, 25 Feb 2026 10:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M72+=A5=bounce.vates.tech=bounce-md_30504962.699ed3fe.v1-8ad8df7059c34404a55a3ea06ffb712a@srs-se1.protection.inumbo.net>)
 id 1vvCTZ-0003P5-FV
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 10:50:41 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2b30fb7-1237-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 11:50:40 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fLWb24Lvzz5QkLbp
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 10:50:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8ad8df7059c34404a55a3ea06ffb712a; Wed, 25 Feb 2026 10:50:38 +0000
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
X-Inumbo-ID: d2b30fb7-1237-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772016638; x=1772286638;
	bh=CtrFlHnqw6yHgtrirC6hE/1//ZvPzW09IT4iSt2SNKo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ascFfilDOEekAws3qKuMYy8KMa61RfCiH+QOiXi8/DqYqK67lM7r6ZQIvhzCiGIIE
	 2eF6fKAPH+FFrO5O+u2P7Z7+G010UNZ96LFfyQn/uTCAslWROeDmpB0j83KYElY28H
	 HH51yGJWClkG9LpjahKgmlmLe8Nd8l3V5g1Fb5OEB4WhB1IHcOK44TES2wu/pxMviV
	 cIp53bm8T64yszgkfCV0RYwvbvotKIU4GjjN72b7KRowqm3Rq7ahBdO/Cuuyi4fWXR
	 HoxMV+0jEtj1YSasbAQ1UzjX7gr9vs43mKek+s7PVQOdPhf7vdHXxwV20GgmybDcbY
	 wVxrKAGcmc2fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772016638; x=1772277138; i=anthony.perard@vates.tech;
	bh=CtrFlHnqw6yHgtrirC6hE/1//ZvPzW09IT4iSt2SNKo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uZhfqaGYPIUDI/9Pjm8qOs9tNp1ExiJmkkmUWPHob0vD2lgWCVQSRwo1vMpfe6Yhs
	 GeIGfHTykaAPY7UOwK8eR51H0pwqKYWinjnF8jyiLRconBv+afzVGnV4koP4Z8XvhY
	 xNgO6udzH2OxJOcqZj0iChrs9KTzSI7XrYKScxBv8dM0ESJ329z+Kb4NUXvD1mtdCr
	 ORZgmlYLWn1e6TIVODjaYCEED093uPAfIs0O3O3A4ZKwFcOCrS5FLNvPsnzNlMROAU
	 5o0cM8LM2VFpCt2Tg0O+auLZhAAhqq7rlb3W/nXtc+OYS4giD+Zo4HyleyQ9vdDmoU
	 bvDBVQORoAWng==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v7=201/2]=20libxc:=20Report=20consistent=20errors=20in=20xc=5Fresource=5Fop?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772016637926
To: "Teddy Astie" <teddy.astie@vates.tech>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Juergen Gross" <jgross@suse.com>, xen-devel@lists.xenproject.org
Message-Id: <aZ7T_ddTHBY0fz7I@l14>
References: <c8677e4588eff14197e47070587f31df1567c030.1771860109.git.teddy.astie@vates.tech> <0d7afac2-d358-4b0e-b828-31ebba6357d2@suse.com> <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
In-Reply-To: <f569a8f0-8df9-4e5a-b3ed-ae600c3c0bd3@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8ad8df7059c34404a55a3ea06ffb712a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260225:md
Date: Wed, 25 Feb 2026 10:50:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[1.000];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B3288196057
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 09:28:57AM +0000, Teddy Astie wrote:
> Le 23/02/2026 =C3=A0 17:15, Jan Beulich a =C3=A9crit=C2=A0:
> > On 23.02.2026 17:06, Teddy Astie wrote:
> >> xc_report_op returns -1 in some error conditions.
> >> Make sure it returns -ENOMEM in out of memory errors and -EINVAL
> >> in invalid usages errors.
> >
> > Isn't this a move in the wrong direction? -1 as a return value is quite=
 okay.
> > errno wants setting to indicate the cause of the error (if called funct=
ions
> > don't already set it properly).
> >
> 
> To me, passing error through errno here feels more like a workaround
> rather than a proper error handling. It doesn't feel consistent in libxc
> overall (some functions returns a negative value corresponding to a
> error number while some others -1; in some cases we update errno).
> 
> What are the error handling rules for xenctrl ?

They are written down. See
    https://elixir.bootlin.com/xen/v4.21.0/source/tools/include/xenctrl.h#L=
76

    Unless otherwise specified, each function here returns zero or a
    non-null pointer on success; or in case of failure, sets errno and
    returns -1 or a null pointer.

    Unless otherwise specified, errors result in a call to the error
    handler function, which by default prints a message to the
    FILE* passed as the caller_data, which by default is stderr.
    (This is described below as "logging errors".)

    The error handler can safely trash errno, as libxc saves it across
    the callback.

`errno` isn't a workaround, it is the way many libc functions and other
passes generic error code. It may feel awkward, but that C.

If some functions don't update `errno`, it might be because the syscall
already set `errno` and there's no need to change it.

Thanks,


--
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



