Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD1A75AD3
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 18:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931615.1333838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyvFF-0004vw-I3; Sun, 30 Mar 2025 16:10:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931615.1333838; Sun, 30 Mar 2025 16:10:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyvFF-0004uF-Ez; Sun, 30 Mar 2025 16:10:45 +0000
Received: by outflank-mailman (input) for mailman id 931615;
 Sun, 30 Mar 2025 14:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jPsk=WR=web.de=spasswolf@srs-se1.protection.inumbo.net>)
 id 1tyu72-0003nm-5O
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 14:58:12 +0000
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 652c59cd-0d77-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 16:58:10 +0200 (CEST)
Received: from localhost.localdomain ([95.223.134.88]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1Mxpmc-1tC08g1IJ4-00wRcp; Sun, 30 Mar 2025 16:57:24 +0200
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
X-Inumbo-ID: 652c59cd-0d77-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743346644; x=1743951444; i=spasswolf@web.de;
	bh=paMlcnbsyzixmxEKIk7TpgKIis192RtNpMFqbarKJOc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gGBtNgWaQigjbDZdbhArPRoyl5PvwqghMU8VVCNUeJuS2XrHDtSiJjxotPUqv1O2
	 N1RMN8z4AkSOsiLDjo8QKOUi4YzC+NyshnXXijTRUR2ywlsUqH2klnH1MEbToBjyf
	 mb8Gdz8ZMvbePJ2sxQ+JcZQ1Ig5RKuaKIGLKoWvQv0dmgTW7Zzc1eUHiWotViv1x7
	 zgqdNA7Ro9EtkRfKsQ3n0pNsoUB2X1RbzpDQ3rShB9XSISBrDk3SBCjccOpRHPAfE
	 QD6FATmLTqx7Z3R/QdQcpFQX7PhDp4D3SxkiibgrcNQdiOdr7vCPS0lUUQ4IYpZqy
	 +LMVjhFTRqv7dpxCJw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Bert Karwatzki <spasswolf@web.de>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel Gomez" <da.gomez@kernel.org>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	"Bjorn Helgaas" <helgaas@kernel.org>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org,
	"Ingo Molnar" <mingo@redhat.com>,
	"Borislav Petkov" <bp@alien8.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends
Date: Sun, 30 Mar 2025 16:57:17 +0200
Message-ID: <20250330145719.32280-1-spasswolf@web.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <87v7rxzct0.ffs@tglx>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nkWDZ3wl89O1RHvPpDsRC7wrZxkyQ6Ar8ilNgBDFHoUFD2MBzVs
 1nPuJFIQE+DweCB5he01EvPkRIoBrglw4JAuqeK+j/W3pVnn5GXnHymx9dKP7Kw9mEj/IKc
 53NhvcKE0M70gKCVKzI0DHtN/RCBJ4CU/a3pFI+KKhabc6ZujcgQsaD8saibq531fJb313o
 ngyCJ1po4towA43WKAxjg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wJCifl4CpFM=;pIs1w/sJ/84spZPO2nx3agN2Pnx
 Ae8afovBO+2C+P4j7qkZ9pgPzgAhOgIxrjQTbSs3FvZvqSMxOFa1GjqdsCGhHLmS+rGwJp0OU
 MUTOCOjyvLotFw5PIxK7yPe3oFmXj+FpeipFrzGVqKkW5rGMKXELshSiQo+roGQQA1/BJV5K3
 BskBSxNgb1X/Eme532dvlvgGny2myzvVXnbrcxFO84DUwgAJIP2qL4S1E9zvMJ4MKSI0WwJ6a
 eMpS5tvDgmHoftVHgAimZHaAbImiD9HIK6mXUGtRm5NNnADE3fIu9YMV1Xyppg0Mt0EGk9aPb
 oFbS8zsafr92I5ut4O81OeNVfsperzs+vzixbHe1/QnC12JS8k/qGc8KZXQAwbpXvWK+RtzkK
 FxRqQWxdcZykhklJF4NdjYUJwH+EI3jGjKvieKnHRHzJGl07+wC3ynLm2MnMpCwl5CTGsrzmU
 1RjyQ+qV4MPzsJbeQAT5OWlQEJcqszewE4y3MRVz/FhkDTkig3cev3MYkoXctX+k35sgznXEi
 uMasZSj+hi1J1/y/r/r5g3R8EyMSvQFF6mxaBB1LLy9AA3Vc4tAG25Mwmv//ovNKYtI/9gUAg
 aS3GdPEOvTxGu08TsgCPIHzk9VMluzl1o4pdWU9IE9dY2304pxhjf6eb7OelxSU6UJyfwGpEu
 zJXhkMAoNirJnAVVGhRWQ9gtBzJQ/01g6I+du8mOa+IGBZeH+hLZcdLFDMWPThuSCSexSlbQC
 0QCCUGMe+X7OeOFavH2taPu7OI+O1CgtX2x6iee/okPXNNauQsEmxW/zXvJvMm0clnkJ/THlO
 vFSLygdTDRjEqpJE47mcZiEom36ssyoI3mi1yFXz7fIvW8hbAKexz/fkTR/rd8KRoadT+fhKv
 SnCdruPmrJa8PJ4RIyuxk8nlis8rfO0BV4is745M7yd4VRZ764VC3aLc+3QW38IVs25gqmPAU
 jLn/zGJjcu0ODi0+ju0O0s9LHoW3u3rtrJIZJYDt7ix85CFrE+lpdBjUxpRdolCisnwNj8qEU
 iSC3io79qQ8jnQ49NVnLRzLRTc/N8dWnkD8Y710xKpnV3Za1gCDzqmqMtNyed2shlFFaojvkb
 PEXcc2i6tRCqMMnmBYMDw9PzLd+ez0FDSRaaKuqLodZbkOUDvLY8fbNNBOowYRQzlVvW7Topc
 DgvlX4tX81mWj8B1ZmpDmiTcTRauPdMoPqNjJgPqGo4OeF5DxAGXLGPalRnTXBRyr47x1dCax
 bg957YOIqkN0Xc7Zb9bBVJQ0VEvn5vwmPvGleEyEa2w17kfPUWMdQUw0Yh5JxDP6zvDFysY7t
 xPiptEL4ng68xMP1yLr6xBt25fcTB14AzMe35aA8ia8ReZvclaX1b2/CMx/e9ZisNK0RWlza9
 mTP5V/4/ao+gUm1gK1EaUsDs1NhsAadeIkSzkNrh5Amqs17DD+Q+3Bu0VsX40dTs5tddg1c3/
 RhqF70w==

This also fixes a timeout error in the nvme driver introduced by commit
c3164d2e0d1. In linux-next-2025032{5,6} booting hangs in about 50% of boot
attempts with the message:
nvme nvme1: I/O tag 4 (1004) QID 0 timeout, completion polled
nvme nvme0: I/O tag 20 (1014) QID 0 timeout, completion polled
after some more time I get a message about task udev-worker blocking for more
than 61 seconds and get dropped to an initramfs shell. I bisected this to
commit c3164d2e0d1. As this error does not occur in linux-next-20250328, I
searched for commits that might fix this error and indeed cherrypicking commit
dbc5d00074fd on top of linux-next-20250326 fixes the issue for me. No xen or
kvm was used in my case.

Bert Karwatzki

