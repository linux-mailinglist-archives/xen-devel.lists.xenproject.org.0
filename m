Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E83gOJN6T2oohwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:40:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7D872FBBA
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 12:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="kn/h4/2r";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357923.1612241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmAc-0003fI-Fd; Thu, 09 Jul 2026 10:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357923.1612241; Thu, 09 Jul 2026 10:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whmAc-0003dT-Bz; Thu, 09 Jul 2026 10:39:54 +0000
Received: by outflank-mailman (input) for mailman id 1357923;
 Thu, 09 Jul 2026 10:39:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@gmail.com>) id 1whmAa-0003dN-11
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 10:39:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whmAY-00BJvV-WF
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 12:39:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a4f7a68-5cb7-0a2a0a5109dd-0a2a45068328-0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:39:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cody.zuschlag@gmail.com>)
 id 6a4f7a68-08de-0a2a45060019-d155802cf156-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 12:39:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493ba701891so12359015e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 03:39:36 -0700 (PDT)
Received: from smtpclient.apple ([2a01:e0a:e14:c050:5caf:dc83:85fb:fe5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e580cc6asm105087635e9.1.2026.07.09.03.39.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2026 03:39:34 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593576; x=1784198376; darn=lists.xenproject.org;
        h=to:cc:date:message-id:subject:mime-version:content-type:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xXH41JrLnk03HngbhUy9J7pdEE/JCYhdqqjsE2b8bA=;
        b=kn/h4/2rgSMSoIyWnacf1diQYNt5O7brwiZ+mWm6n/sdSCgPSeA76wdgLmOgLFPLOQ
         kUit5jWkmYZ91WRAfWRwO0FHBW6sM4o+85waGbxrXqfc736HaVwzY6asYGIS1J8cL/xT
         j7IHkwUNw5E6GY068LLB5LbAcFp6at8bOL2vPhy+RuLWfFy7EwJthXpVzH+z333HhdPU
         WD5QX2au6UO7B2Y1KscrFydrV9LYTd45La1ruckWIXgJewIZs6/PlH3wVrm9A/XCx5x3
         2yDj+FzZcCgOG87SFUSeNM/PeomTmT1l9kaHyEpsIW8SYiGKNgtWOusmm0fwW1eMSY76
         QwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593576; x=1784198376;
        h=to:cc:date:message-id:subject:mime-version:content-type:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+xXH41JrLnk03HngbhUy9J7pdEE/JCYhdqqjsE2b8bA=;
        b=KMUVAG/TydoC9GXtpBInzIYAvUZHkLBkp+xD0rudnJIvmBsk3XW7YiRNuegDF0mQRG
         7O+yio3ugPANHHl6WCmDFBKjjdPolIAdVyV6cjntvAhloM8CX9DntYdKwtnpRbhAAdKG
         Y2PZP4GFcMvR16eS0I6p0lU1DwRLYbGwF2NsAejs3awbDN5By775CRz30cA4z7+H1EKE
         FIGa8j/NFpuoFzJpzLC5awPU6B8HvOXCKpKjcq0/qoi2n2CJQ3/zJ97ELJlSPl16wyNW
         pvhqTi9Le/crwWvc9Os+U+elVkQ/A//judzairyTCFEHc6BUVTvAHZnqyJU1HI9SSPcv
         /Ilw==
X-Forwarded-Encrypted: i=1; AHgh+RoL0G00JlSaPMSl0+NoTk8mvCJjpWsOtVD8seoeumGJ0NXeCA2j2e94QoS1WzUoaVj6IV7tZhgGWfA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKBfDX7RJT7C3F0kyvF57GoLltZqA4r4DwUQEy3AVszn/kD4eD
	3XS416dGBc6ANxzdz0ITTSN9JQYkn3CRxQHLDelemPuNuQWE6t2V4hnl
X-Gm-Gg: AfdE7ckrIUwGkHGo1BYAYLeLd0wX8GbcSBxlc2Wj6DJzt6Qu/wSxkdieE/lK8XBE/mM
	XpwuIAfl0IPB4qpGdvbQmZTvCop5eLeUd1/RnCgA3mPvHLG/5+SzaM7chMPHMutgM22foA8oZ8+
	OJ0PgwzNyZo8jJBLwKAcC0iJ06KodUZegeUkulSo5CkKltkVpmzez+Cv9PnFaXuyPogq0YBcZW8
	vuGUBLQvR0uW0aMgt+V3aV7HjlmiohensoHfrssysAHo2u/Q4uTpJPpkGzW6jPT2EDrF5cngz3X
	tIbu574YBQqXhSgIBcdEHEjWHVXloteJ6Pa7qu+jmvAo8JrcbCMlcM8+ZyHynxAhm8uWDfFMQwC
	WWrn93V7/Ow++jzWwxfn8Xwmt969DMi8d/Rzk8fjNew8k6XfCXAf98VKd+pJgv9oz3EX4UAjKGl
	Se66RvnjB1ODWKGcw4flq4+LwByxGLeGldGuLRNkaPemRGqKE=
X-Received: by 2002:a05:600c:4709:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-493e689c16dmr63400355e9.16.1783593575934;
        Thu, 09 Jul 2026 03:39:35 -0700 (PDT)
From: Cody Zuschlag <cody.zuschlag@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_258BF3A5-1573-4559-B3E6-F7E92EF19905"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] maintiners: promote to argo maintainer
Message-Id: <3C86D388-54FE-435E-AD48-81204CBB8011@gmail.com>
Date: Thu, 9 Jul 2026 12:39:23 +0200
Cc: andrew.cooper3@citrix.com,
 anthony.perard@vates.tech,
 jbeulich@suse.com,
 julien@xen.org,
 michal.orzel@amd.com,
 roger.pau@citrix.com,
 sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
To: dpsmith@apertussolutions.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-purgate-ID: tlsNG-16d1c6/1783593576-C652168D-23962B6C/0/0
X-purgate-type: clean
X-purgate-size: 1416
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[codyzuschlag@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8A7D872FBBA


--Apple-Mail=_258BF3A5-1573-4559-B3E6-F7E92EF19905
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Daniel,

Thanks for the patch.

After the recent discussions around Argo, we believe it is best to leave =
it under "The Rest" for the time being rather than make maintainer =
changes.

That said, we greatly appreciate your reviews and technical insight, and =
we encourage you to continue reviewing and commenting on Argo-related =
changes as they come up.

Thanks,

Cody Zuschlag

Xen Project Community Manager=

--Apple-Mail=_258BF3A5-1573-4559-B3E6-F7E92EF19905
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="content-type" content="text/html; charset=us-ascii"></head><body style="overflow-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-white-space;"><p>Hi Daniel,</p><p>Thanks for the patch.</p><p>After the recent discussions around Argo, we believe it is best to leave it under "The Rest" for the time being rather than make maintainer changes.</p><p>That said, we greatly appreciate your reviews and technical insight, and we encourage you to continue reviewing and commenting on Argo-related changes as they come up.</p><p>Thanks,</p><p>Cody Zuschlag</p><p>Xen Project Community Manager</p></body></html>
--Apple-Mail=_258BF3A5-1573-4559-B3E6-F7E92EF19905--

