Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05748ACADBE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 14:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003281.1382826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3sS-0004sX-JC; Mon, 02 Jun 2025 12:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003281.1382826; Mon, 02 Jun 2025 12:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3sS-0004qC-G6; Mon, 02 Jun 2025 12:02:52 +0000
Received: by outflank-mailman (input) for mailman id 1003281;
 Mon, 02 Jun 2025 12:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7z9=YR=bounce.vates.tech=bounce-md_30504962.683d92e7.v1-c62ac387ba0f4ebba1484d9b7361dd6f@srs-se1.protection.inumbo.net>)
 id 1uM3sR-0004q5-EA
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 12:02:51 +0000
Received: from mail137-30.atl71.mandrillapp.com
 (mail137-30.atl71.mandrillapp.com [198.2.137.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8047a3a3-3fa9-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 14:02:49 +0200 (CEST)
Received: from pmta07.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail137-30.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4b9ssz1qZpzMQxdLv
 for <xen-devel@lists.xenproject.org>; Mon,  2 Jun 2025 12:02:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c62ac387ba0f4ebba1484d9b7361dd6f; Mon, 02 Jun 2025 12:02:47 +0000
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
X-Inumbo-ID: 8047a3a3-3fa9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1748865767; x=1749135767;
	bh=S7GHa6QN4mpZvACWU57SJNZSis3cue+XvOomwDDlDj8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=biAFs/qbcu28PufYpcg89EnO7qWobw1X0MF2tHWO3FApj2f4ta/l3sZLk6QAnBg7H
	 SW76k6mNXMKJwe+t4I2yl/nQFnDUIl/PVtsRQvzW/XKoSjYIYJSs0kENawoJTNzjRW
	 munIuuioncLmoFtWEdFfHzN7zVmHsskrcZODpKgrmp/E3PGf4OUzTLhyJRYcoioENI
	 CSsrYVu5orl0eXFr69fXffRse4qegIu44rHM6TWlS43SeyjgkPvBnuduBYqxgZY4/s
	 L9hOSc8fcy7dlbcWKvdbwDYJsqXNo/XSBsVTDuY88abW1CG6w6Fzlq+p1A+7hjK/y8
	 OcbBzEwBX2M4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1748865767; x=1749126267; i=anthony.perard@vates.tech;
	bh=S7GHa6QN4mpZvACWU57SJNZSis3cue+XvOomwDDlDj8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=HUd/94DBJKBY2RRldDAYiSDa3K28f+OaSynzBv/D6lWWnDnmHQKoBnKu4JZGujogH
	 17K7DpwTgiNpxv8h9Qpfb9hVeBkZGzSw2tXOq/DBKJHU55NTEVphubjcbpCq3BMqas
	 iJNBYm7A/iYdrCqxsMdvjtIUoYy/+K7QuW3t6m3OocOLGhfiNga5GqfNqlPOLVI/VL
	 Hbgz4n5bf3jJl6+4fjH2V9E2KEgPoGcvhsorSbcpvDJ9KwhhLBn8Y0OfIUShOWyADw
	 1QppsqQ3//cfsn0rsr0ei1EkfZfhrgxwqE2SGDE43grARdhIA7+SG5XwP6oIhJNcPX
	 m9npfyFqCwsvg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20Revert=20tools/python=20part=20of=20"tools:=20remove=20support=20for=20running=20a=20guest=20with=20qemu-traditional"?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1748865766130
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, "Juergen Gross" <jgross@suse.com>
Message-Id: <aD2S5T85nDoCVN9v@l14>
References: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c62ac387ba0f4ebba1484d9b7361dd6f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250602:md
Date: Mon, 02 Jun 2025 12:02:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 02, 2025 at 12:22:53PM +0100, Andrew Cooper wrote:
> The migration stream is a stable ABI.  What this does is break the ability to
> inspection and operate on pre-Xen-4.21 streams.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



