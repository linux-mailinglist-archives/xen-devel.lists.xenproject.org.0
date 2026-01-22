Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WI5qO8xpcmnckQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 19:17:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949896C33A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 19:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211804.1523269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vizEh-00006D-4y; Thu, 22 Jan 2026 18:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211804.1523269; Thu, 22 Jan 2026 18:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vizEh-0008V9-1y; Thu, 22 Jan 2026 18:16:51 +0000
Received: by outflank-mailman (input) for mailman id 1211804;
 Thu, 22 Jan 2026 18:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8ps=73=bounce.vates.tech=bounce-md_30504962.6972698a.v1-ecdb8f901ab34e0a87328af724903adc@srs-se1.protection.inumbo.net>)
 id 1vizEg-0008V3-4d
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 18:16:50 +0000
Received: from mail137-14.atl71.mandrillapp.com
 (mail137-14.atl71.mandrillapp.com [198.2.137.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 810eb9d4-f7be-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 19:16:43 +0100 (CET)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-14.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4dxq5Q17plz705dyx
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 18:16:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ecdb8f901ab34e0a87328af724903adc; Thu, 22 Jan 2026 18:16:42 +0000
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
X-Inumbo-ID: 810eb9d4-f7be-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769105802; x=1769375802;
	bh=JoYuU3kUMVAPly9sxksBrdZ8lh3xNFymYZevUba/wUE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=YeyXRfD+KpwEGi/ICOiElW1uQkB67mDZSVORMFJqEadZLfSg8GgqWKpOebJAkafOZ
	 pQcshxbfUeTHBmWIiHvlz0urXq0iIilIci159PDQCjmTKrfcdRspwf0aegB3jSTlLi
	 IlNnWgCIOufSOD4H0AXd4xVKotJDM4Bq5WcxXw891XsWZcTB8dKdZjndWA6Y4nad9v
	 USiIZWqmwwCw4IoZPAEosI0t43SNXdK/9NBDnylWdGtd3vKNX1y0v9d0EvEi4h9Zei
	 E1v7gxXMwalmfZY7rUpsa7Lno66nre7P1M6oKpd32IkLJ3IeN71agtfh9nrdntxLFb
	 py6zpsLqIwbYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769105802; x=1769366302; i=teddy.astie@vates.tech;
	bh=JoYuU3kUMVAPly9sxksBrdZ8lh3xNFymYZevUba/wUE=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mPDjMIR61UdDZNUzidRzPONVI9Dy+zPnQi3x9B5mj+WCgga0VA6ENeM3p1oTClV47
	 dVLMtM0NuG5xlxt3IIaqZ2CNcSSnlLPNVsOqQ/vZy+iGWLyErfTcfuZC0eIVeTq4ik
	 T1t/Mitc686zr6S7dGBaCx9/rePxFpVh9eGg/rYBhwDiGWp271wIqVlqRBoKNEjzOA
	 8UrUHTE04J21zvUDsQUYODLSP2iIN0WEv1V5QqckaXxAQuZyyNQ6ZhkjH3fkQXeb+z
	 19C7RLHfHcSTWeKYWiJ3ZflrZGJk+Idntiws+TIciO0SAu6zO3gYcjQcFu3gha3bQH
	 RnPn431S+8dEA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=200/4]=20x86:=20Drop=20cross-vendor=20support?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769105800692
Message-Id: <26c416ea-1c4b-464a-bcb9-d34f0600eaac@vates.tech>
To: "Alejandro Vallejo" <alejandro.garciavallejo@amd.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com> <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com> <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
In-Reply-To: <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ecdb8f901ab34e0a87328af724903adc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260122:md
Date: Thu, 22 Jan 2026 18:16:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_SPAM(0.00)[0.991];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 949896C33A
X-Rspamd-Action: no action

Le 22/01/2026 =C3=A0 18:44, Alejandro Vallejo a =C3=A9crit=C2=A0:
> On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
>> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>>> Open question unrelated to the series: Does it make sense to conditiona=
lise the
>>> MSR handlers for non intercepted MSRs on HVM_FEP?
>>
>> I'm not quite sure what you're asking here.
>>
>> ~Andrew
> 
> The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP as=
 far
> as I can tell. The question I'm asking is whether there is another code p=
ath
> that might invoke MSR handlers for non-intercepted MSRs. I can't see it, =
but
> I'm not sure.
> 
> If there isn't I'm considering (conditionally) getting rid of them.
> 

I think you can enter this path by making the guest execute directly or 
indirectly a rdmsr in a emulated path (there are some cases like certain 
cases of real mode or maybe vm introspection). I don't think that FEP is 
the only way to do that.

> Cheers,
> Alejandro
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



