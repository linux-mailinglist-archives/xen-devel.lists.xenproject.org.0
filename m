Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE884386CA7
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 23:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128502.241244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lil9M-0004Vx-FX; Mon, 17 May 2021 21:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128502.241244; Mon, 17 May 2021 21:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lil9M-0004TT-Bm; Mon, 17 May 2021 21:51:44 +0000
Received: by outflank-mailman (input) for mailman id 128502;
 Mon, 17 May 2021 21:51:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z2KI=KM=fensystems.co.uk=mbrown@srs-us1.protection.inumbo.net>)
 id 1lil9L-0004TN-1f
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 21:51:43 +0000
Received: from blyat.fensystems.co.uk (unknown [54.246.183.96])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bde7f93-e5fb-4acd-800d-565526daa305;
 Mon, 17 May 2021 21:51:42 +0000 (UTC)
Received: from dolphin.home (unknown
 [IPv6:2a00:23c6:5495:5e00:72b3:d5ff:feb1:e101])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 4DA8144319;
 Mon, 17 May 2021 21:51:39 +0000 (UTC)
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
X-Inumbo-ID: 2bde7f93-e5fb-4acd-800d-565526daa305
Subject: Re: [PATCH] xen-netback: Check for hotplug-status existence before
 watching
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, "Durrant, Paul" <pdurrant@amazon.co.uk>
Cc: "paul@xen.org" <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20210413152512.903750-1-mbrown@fensystems.co.uk>
 <YJl8IC7EbXKpARWL@mail-itl>
 <404130e4-210d-2214-47a8-833c0463d997@fensystems.co.uk>
 <YJmBDpqQ12ZBGf58@mail-itl>
 <21f38a92-c8ae-12a7-f1d8-50810c5eb088@fensystems.co.uk>
 <YJmMvTkp2Y1hlLLm@mail-itl>
 <df9e9a32b0294aee814eeb58d2d71edd@EX13D32EUC003.ant.amazon.com>
 <YJpfORXIgEaWlQ7E@mail-itl> <YJpgNvOmDL9SuRye@mail-itl>
 <9edd6873034f474baafd70b1df693001@EX13D32EUC003.ant.amazon.com>
 <YKLjoALdw4oKSZ04@mail-itl>
From: Michael Brown <mbrown@fensystems.co.uk>
Message-ID: <ed4057aa-d69e-e803-752b-c007ab4e707d@fensystems.co.uk>
Date: Mon, 17 May 2021 22:51:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YKLjoALdw4oKSZ04@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	blyat.fensystems.co.uk

On 17/05/2021 22:43, Marek Marczykowski-Górecki wrote:
> In any case, the issue is not calling the hotplug script, responsible
> for configuring newly created vif interface. Not kernel waiting for it.
> So, I think both commits should still be reverted.

Did you also test the ability for a domU to have the netfront driver 
reloaded?  (That should be roughly equivalent to my original test 
scenario comprising the iPXE netfront driver used to boot a kernel that 
then loads the Linux netfront driver.)

Michael



