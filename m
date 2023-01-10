Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539F8663608
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 01:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474160.735152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2B0-0003lB-V7; Tue, 10 Jan 2023 00:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474160.735152; Tue, 10 Jan 2023 00:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF2B0-0003i8-SG; Tue, 10 Jan 2023 00:07:38 +0000
Received: by outflank-mailman (input) for mailman id 474160;
 Tue, 10 Jan 2023 00:07:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tiyo=5H=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1pF2Az-0003i2-Tu
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 00:07:37 +0000
Received: from sonic306-21.consmr.mail.gq1.yahoo.com
 (sonic306-21.consmr.mail.gq1.yahoo.com [98.137.68.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c804ffd0-907a-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 01:07:35 +0100 (CET)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.gq1.yahoo.com with HTTP; Tue, 10 Jan 2023 00:07:32 +0000
Received: by hermes--production-ne1-7b69748c4d-pm9xv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3690a7ed7136d7d2ab4095291adae14f; 
 Tue, 10 Jan 2023 00:07:27 +0000 (UTC)
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
X-Inumbo-ID: c804ffd0-907a-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1673309252; bh=TjWRQ3XDQ9v5XBbBlXFg/nqc2AKrVM/5dbL4mDfhkpE=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=JfA1QQc4IuZWn2q/0AwE8zlAE1hfXOHaXiKe8imLX/Ytrn4nLV2TMHnnMkwQdVJW5c5/zbVtxlJQtkCxzG2sE5Jv63uwlrk3/DuZF98BZAJvAAwEAbECmD/4YPsk8ksSaZHtDPIPFzbv5Twlt9GiZR0A1iOMElk5nd9SC1XiicMc06sGIcj9DdM/njYUzgbx4/8D8OL3nT9JPPp/o3YbFuxUcsTFX7oKyXe7AZL39bL7gRx+Xl5YhUbV6sQFPPCdovcfKeAiBd2ZAO8sCaMa7JgVz/M8RG5/3qn5GibUavkMR88dJQVZuk/I7Y33+R9qOwk20NItOngS612jnt2hZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1673309252; bh=nFCRAALOdJVOepdExywB8v7RnknYNQlGAfr1ya85Pc8=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=DSa7JwuwBkLV6l00NXnOyIr44e+lEFFZ8a4P3EMPcMpGbInWVh77BgrFCaoAKEQiIeumScpMUVSlL+m8o0vzX2l4XtU4ZCemJoddMwgFC6djS842HQZpleoBgK1cPj0fgjQUCIDNEHVPpHYxFHDkVpeBUEIXdoiPFu0bGnPRDRwCQ9Uhh9viyqyaz8d/b2LZExDKRyRTHf4LhYgLe88Zi6w8vF9r9V4uBAHouqDhzrGdArUobuFaBX/JScII3k22xm0k8TeEegABB0npmvB2Z0lBN7ttY+dj75tqxOo7Wt8xP/1Dj/+aUEjuqmEatQ7zuvBTrj/6UcxCojqd5ZvD2w==
X-YMail-OSG: 6VYIDtwVM1lfvejDjOPjsXuG7.vU5smWRTykHeFd1cl8ReMGrrANGFkQ1BAxjVH
 1bmhLyTI23B2OvNGBNdzClwcTSbq5g5BK8wpNw0ReoobjaK23Yi6EZ5AH6fXHMkRYUibFhbFMGGY
 S_Jv9bwoILhVVL1_UedMVme6K0YIKKNJ3KOnZvJrE8zugxX5twB9SNmuMBBIf8L32Jq6scwnA8Vc
 ET4UbAI5w5BEwEwQh4T91be9hIoopXyHVVC51ywi.Co0QZAgiCgzPACF.vtwJqq2tEP9GNGJLnnQ
 h7IRRoV1jLxSltR7ZY8KzjotWQ1SUydMzRhrQTMktfRGCCRswUckkDwMikB9OSPO9a3TwWlButHI
 J.nVbxJoN50G6uKn0uh_nQGGQ0RsONEfwe73zLB2Qy7_k3TdKaGGZ02GrCGGo5mj0eZqWe48qwjY
 aVtqElY0zrQGgbFIIDbt1BIkQ0p1oFcmUvJ2YvdGteM0CDSfV7qYxX2IH6e_1sIDDi1l0DBUkrP4
 nBZKV5Yfh3gWN4WbhTHJLJYc1l4LNrawQei8sFxkg3RqcHbUcXKjYfwSEGAWM86hzGyPBk9gwbfx
 qkI1hky9OSx1AHZNfRbq9Yhh_WkAhv1dQS4sRnC8xtYyTBtN3RljIsLXEN76.Zf.xJHvfR3Rkapj
 .o_YcXt7xA5ahkHKfwsAXdAzouBd.SRka1_URRhHbavUF_Kv5xILxDcbV.N2r9rTo7ZZelz8Yth1
 wi2Of8JsXEsyh5BRfK5bfh.puxWUtTxOVSqRg1dvQszXTBfHiggtPQM03yRnV44IIvwVZqXzdVQO
 kYXjM_T4RMFGeHMXmW2HavEMrmDgevuEPqZH5LViLh5ZAMY4.kys6GmaO3elB4ZkrWmK.1pnh4EC
 ekORxTg6OH9let0ZfG5NMX.1dZcTFLNMupDNwa89axi8DHTCzhrc_alYTVpr8wD.ObKFflQdNZcR
 a0WW5wjvrACPbphsOhgBWqFpO2MDTllyU7.Unnfo1EmZ0qbJCqkYUXjRa1Qn4oS8dFU9j9gKjQWB
 pVtPkJ55_46j41PiaGXI8hLD7MQczSzYawx3XKA9fBf8fv1Q9QypKqFaORsz1hJPRbMDgVee9hBC
 FVpM2WsEVYY.gEnWD_tCa2se1Bv2kw9s4u5pc3X3VOzfLHN8EI8fXd_4I6pvs1jqHy4UqduZ7W6Y
 EOwoTERAeBhMAi051Vm3FM9oIDWFDy9Dw6DYGY3qnmGYCdsRIQdzbT1XvbKOdFrUuc8btwPIwytn
 jlnDBpsqRRk89DbsytuzVgVovCn2T5xbuaFdKKq8ra1BWsAhT.8gp3T6wmsgDbhoWgpUOszyGsId
 w3m5YJ_zUzAYHrzRKtBZbVMRoOGwREe0.h_57gSWA9tlcoiRWl_.XFr2jG0i9FF59p0oGrBMXp.B
 HTRFVYQfgSP9nE4KGiK64bpifTypcvpIMN0nD2YhMp2QzP8DvjZT3HO1i4pYXTM4ghbg2q6S_tL.
 _mvqeyyzwtZkOpV8Gg6tjHLIF6ITZxVVGcCmKnGXBK.VnJuAWs4b1eQwKBTdbBqT4BQUgxuJvGxX
 1H8VQGsivLP.sq6Qk6DTMSSY4tO58QVRH_RMY1gm_iAdI8SIWeTwAkyU9DW.CN4AFKfL5NtffD0O
 j5RfFM_EE5DcnBjXqX.1nzLCQ_zGaSIHKYVRidoy8yifpdtNUzDv9.aS35ns_ktZ9dWizsur0Zem
 A.X28ii3y1r4egEJMQzur5yEp9WV0X704yiEb_8dp4aetjyWIKHmYdkQ0G0ZEAYSEjd9oJr5FOLP
 UJPd5NXTUNJ3RHG9V1jSRP38MOaFJOpAlSW_Po08.w8skQvkqCGgHEgVPL7GOPGl8RK.1KyBXFKT
 VznE9kIYac06bU77TZw2lVBMbvgLr7Nik8i2gTGjHTdCGA4nEiAbEq2fgyJ7pUkI60vOWrkUkKnM
 XtoCA2u_gmdX4Z3OTH0NFHAPjOStYiLwLNhbcVTOPcQn45FNffbSQMEs87YVIXCf3qDwr8fGTxzo
 ifJmNovycWkzV3RSTHRSM3MSsWDulkSVOqffSJ6Tz6a7_7m9g_V1f62FPh_nJ37oK6AOGlWaagYw
 ZsZtzTTGan7lhspITmnfZXjsqpsObHpbbFlukcDSgx9aML2ep4cYPU03GQtg71mfMpi_vI50IG9A
 OQLuCG_xlVgELCjCf22DM4Ys.XTXb2cxVOqkD8tqBGNVlYA_HKlB_wNgTmktAm2gjnZ.r2OQql9s
 qtlHn1sTQsw--
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <024b9ab9-4204-aebb-9f89-95cbabdfe868@aol.com>
Date: Mon, 9 Jan 2023 19:07:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org
References: <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz.ref@aol.com>
 <8349506149de6d81b0762f17623552c248439e93.1673297742.git.brchuckz@aol.com>
 <20230109172738-mutt-send-email-mst@kernel.org>
 <8c2531a8-ce99-7593-99f8-222076fe6bd6@aol.com>
 <20230109183413-mutt-send-email-mst@kernel.org>
From: Chuck Zmudzinski <brchuckz@aol.com>
In-Reply-To: <20230109183413-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.20982 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 1/9/23 6:35 PM, Michael S. Tsirkin wrote:
> On Mon, Jan 09, 2023 at 06:28:44PM -0500, Chuck Zmudzinski wrote:
>> On 1/9/23 5:33 PM, Michael S. Tsirkin wrote:
>> > On Mon, Jan 09, 2023 at 04:55:42PM -0500, Chuck Zmudzinski wrote:
>> >> Intel specifies that the Intel IGD must occupy slot 2 on the PCI bus,
>> >> as noted in docs/igd-assign.txt in the Qemu source code.
>> >> 
>> >> Currently, when the xl toolstack is used to configure a Xen HVM guest with
>> >> Intel IGD passthrough to the guest with the Qemu upstream device model,
>> >> a Qemu emulated PCI device will occupy slot 2 and the Intel IGD will occupy
>> >> a different slot. This problem often prevents the guest from booting.
>> >> 
>> >> The only available workaround is not good: Configure Xen HVM guests to use
>> >> the old and no longer maintained Qemu traditional device model available
>> >> from xenbits.xen.org which does reserve slot 2 for the Intel IGD.
>> >> 
>> >> To implement this feature in the Qemu upstream device model for Xen HVM
>> >> guests, introduce the following new functions, types, and macros:
>> >> 
>> >> * XEN_PT_DEVICE_CLASS declaration, based on the existing TYPE_XEN_PT_DEVICE
>> >> * XEN_PT_DEVICE_GET_CLASS macro helper function for XEN_PT_DEVICE_CLASS
>> >> * typedef XenPTQdevRealize function pointer
>> >> * XEN_PCI_IGD_SLOT_MASK, the value of slot_reserved_mask to reserve slot 2
>> >> * xen_igd_reserve_slot and xen_igd_clear_slot functions
>> >> 
>> >> The new xen_igd_reserve_slot function uses the existing slot_reserved_mask
>> >> member of PCIBus to reserve PCI slot 2 for Xen HVM guests configured using
>> >> the xl toolstack with the gfx_passthru option enabled, which sets the
>> >> igd-passthru=on option to Qemu for the Xen HVM machine type.
>> > 
>> > I don't like how slot_reserved_mask is set initially then cleared on
>> > device realize.
>> > To me this looks like a fragile hack. I suggest one of the following
>> > 1. adding a new mask
>> > "slot-manual-mask" or some such blocking auto-allocation of a given
>> > slot without blocking its use if address is specified on command line.
>> > 2. adding a special property that overrides slot_reserved_mask
>> > for a given device.
>> > 
>> > both need changes in pci core but look like something generally
>> > useful.
>> 
>> I was hoping to not need to touch pci core but I understand it would be
>> better for this patch to not affect machines that are manually configured
>> on the command line.
>> 
>> However, keep in mind that this patch will only actually reserve the slot
>> initially for xen hvm machines (machine type "xenfv") that also are configured
>> with the qemu igd-passthru=on option which, AFAIK, only applies to machines
>> witn accel=xen. It will not affect kvm users at all. So I don't think this patch
>> will break many machines out there that manually specify the pci slots. The
>> only machines it could affect are machines configured for igd-passthru on xen.
>> This patch also does *not* reserve the slot initially for "xenfv" machines that
>> are not configured with igd passthrough which I am sure is the vast majority
>> of all the xen virtual machines out in the wild.
> 
> I'm just saying that adding a capability that is generally useful
> as opposed to xen specific means less technical debt.
> 

I agree with that.

