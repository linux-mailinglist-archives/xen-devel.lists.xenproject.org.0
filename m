Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E6683269
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 17:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487734.755417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtK1-0006Q7-O7; Tue, 31 Jan 2023 16:17:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487734.755417; Tue, 31 Jan 2023 16:17:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtK1-0006N7-L4; Tue, 31 Jan 2023 16:17:25 +0000
Received: by outflank-mailman (input) for mailman id 487734;
 Tue, 31 Jan 2023 16:17:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3C0=54=citrix.com=prvs=388cd47ec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pMtJz-0006N1-Qe
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 16:17:23 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc140901-a182-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 17:17:21 +0100 (CET)
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
X-Inumbo-ID: bc140901-a182-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675181841;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QT32KNaxwP5fKO6GMkHGbVdshYYYumzE0Z2WWk0aKBY=;
  b=Dakhg3jqdlNHZmIr5pORgRzteex1mOPXQtoZ0jRUJQuHcUVvEOhoRUet
   ysdzbajsdAuAZnZVHKuMmQRDogeLUaljataUJYbFaKGjHRdrqEG7rZIoD
   E1eZ8+Zu++J62AMkXhkUmxLIzDFGk1BBL3qg61PjoK6JlxW4daPVdNd/O
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93912470
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:nzdU7qyHxxJy9S1mXvd6t+fqxirEfRIJ4+MujC+fZmUNrF6WrkUPx
 mMaX2CPbq7eZjb8fNp0PNnn8kNUusTUmN9kQFNsqiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnPqkT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTwSx
 NA+ERoSUgKgpOmam7SFe8R0r+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZQOzx/C+
 j2el4j/Ki8GEfmmlijVyyqPwerdkXLBXNgYT5Tto5aGh3XMnzdOWXX6T2CTvv2RmkO4HdVFJ
 CQ8+CU0qrMp3Fe2VdS7VBq9yFaNphMGUsBcO/E74gqKjKHT5m6xCm0FUiRQLscrscIwSCAx/
 lCMltLtQzdotdW9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5vFb+plNrCAjz1z
 jaHsDMWiq0aiIgA0KDTwLzcq2vy/N6TFFdzv1iJGDv/tWuVebJJeaT1tWn3y89qM7qLbXqKk
 CMCpfmz9MknWMTleDO2fM0BG7Sg5vCgOTLagEJyE5RJywlB60JPbqgLvmggeR4B3tIsPGawP
 RSN4V85CIp7ZiPCUENhX26m5y3GJ4DEHM+taP3bZ8EmjnNZJF7ep3EGiaJ9MgnQfKkQfUMXY
 87znSWEVyxy5UFbIN2eGY8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lqIq
 o4EaZHSk08AOAEbXsUw2ddDRW3m0FBhXcymwyCpXrHrzvVa9JEJVKaKnOJJl31NlKVJjObYl
 kxRqWcBoGcTcUbvcF3QAlg6MeOHYHqKhS5jVcDaFQryiidLjEfGxPt3SqbbipF9q7I9laQtF
 aNeEyhCa9wWIgn6F/0mRcGVhORfmN6D2Gpi4wLNjOADQqNd
IronPort-HdrOrdr: A9a23:+IVZNqhH/76touEDhZHpGdhuGnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="93912470"
Date: Tue, 31 Jan 2023 16:17:06 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Dmytro Semenets <dmitry.semenets@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Dmytro Semenets
	<dmytro_semenets@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [RFC PATCH v3 00/10] PCID server
Message-ID: <Y9k/ApO7d6FGNAxX@perard.uk.xensource.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>

On Sun, Jan 15, 2023 at 01:31:01PM +0200, Dmytro Semenets wrote:
> PCID server used if domain has passthrough PCI controller and we wants
> assign some device to other domain.
> pcid server should be launched in domain owns the PCI controller and process
> request from other domains.
> pcid server needs if domain which owns the PCI controller is not Domain-0.

Hi Dmytro,

Thanks for the patch.

I did already ask in the previous version[1], but could you write a new
binary for pcid? I still don't think libxl is appropriate for this kind
of tool. libxl is supposed to be used to manage a VM. Or could you
explain why it is implemented in xl/libxl?

[1] https://lore.kernel.org/xen-devel/YzMw8i7w7HyINjEp@perard.uk.xensource.com/

Thanks,

-- 
Anthony PERARD

