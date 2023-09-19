Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34777A679F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604869.942398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicM7-0006ND-3P; Tue, 19 Sep 2023 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604869.942398; Tue, 19 Sep 2023 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicM7-0006L5-0N; Tue, 19 Sep 2023 15:09:39 +0000
Received: by outflank-mailman (input) for mailman id 604869;
 Tue, 19 Sep 2023 15:09:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G4hl=FD=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1qicM5-0006Jk-MC
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:09:37 +0000
Received: from sonic312-23.consmr.mail.gq1.yahoo.com
 (sonic312-23.consmr.mail.gq1.yahoo.com [98.137.69.204])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a263f3d-56fe-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 17:09:35 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.gq1.yahoo.com with HTTP; Tue, 19 Sep 2023 15:09:32 +0000
Received: by hermes--production-ne1-6cbd549489-lrnsj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 1543966a54d5c59c750f7868feceeb33; 
 Tue, 19 Sep 2023 15:09:29 +0000 (UTC)
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
X-Inumbo-ID: 8a263f3d-56fe-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1695136172; bh=iwI3VEUXakqH6uEjw2EE0kc37L4DFboeyRPCXkrOT/A=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=mAQjo/OnZ7CjLmLlsNAd81TNGAsXT63gnpLNaX0pEpyaHveE8Vdg945lxjuJwLdpYeWZTm0DceUTUdiFGFI+UHu1B/ku0RuIXcKkdcuIwfttVmohQ8B+mzSt1pq9hxjDMQ3f4HJq10G0F/3XQq/WsGQKiszRiPx6q8cHsUlZUxHGJTuOe09p99EQ43Gqnq0NinfWFiX9cBjhIJhH7Q/ILhjSZpIceI0ui7GqEI03oDAy5bIT1TI9UvdBgAGdIuQ8Wb5kxGnYnwm4dt12j30EycLyaIFch9uYBDqJzCVOhh+iurZ/g21e7KfZo3pCogNVRf8lHFY2dC4Y3Enp276HKw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1695136172; bh=vMWAl6AUzD7OA4OddbTaHheDP3ZdcC+GJiwcCWdv8BA=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=BLjIPZA3zdtR6e5xMrLLy+uqF6KVcKRLZEtvcsQTYSgtsnrj+9BJPI6x+UH5zMVNRQJ5UBmwVH5QrzrzNT7Bj2ug+lnFD9ZpINUc2EEmzDCFf6mCGog0fYrVrye2AUvnkbk3Th74UYUf0o0rCuLFzR36mnt1R3X/fZcMgb8t/XZSdnKJPBGf8iEL1tJqkC0IP2w/1/AKOm3lMLnh5GObvZtBCTY2KniVtydYNYiarX6PIx1269T7+XgMzirFzo1XPdFaCrgwNx++0/R00NpoqYlRwgC61+rEBxq2R164o27n7UzIfXqIU8h5ah6CTrvOBx/nTN+InUDBd2MlnAOmtQ==
X-YMail-OSG: OQgSAy4VM1nxeoLrVcoOv.b8wzOuxMOdlg8QPU1XekZQnVuP4w4I8SE5eU4VBif
 yyzjxTHQqSEvo5pjEJzLmhyiRwMohSd_V0rGqwib58yfJGDmLC.7boVK.B3EluNdVbOF0GhqLtmq
 XFOTFMB0CnHNV27JxQna5rj_T_JeqK7I_.i7USb6r4oB0z1SUGoneEp7r1G3W4BAkK0JYhqlDTDH
 qQ9zQ5FTU8J3X7XRSmpkHa84j8aSpbMgIuvDNkGzkMMs5ytx7koTC1vqHO88Lr3_RUFxXAANKBmq
 uEFz0..pz3phwST13MfWU093VqrXJneJkYK4l4Kmq.fMct_PFrZx36gSoFcRLvKcEtVfl5TjJqFb
 XqBUxhMBVzQJcjs8YNEQJdi2N7i.DKAYb9RmTfNUwGoP0KSlcExUuhkWtfdJBUgZnsJ_mcR5Y3wM
 uxDmEBl7mi9jX3ipGX_M3Oly3BKTE3nXllZzZogALTrrvn5xQlCmrMwq1WZYHvNMRHcucwW3cM6q
 QpJ1tmrQcDYtbQjFOSXIStp2DXYrmiFiUU2uCPrOY6Ssg1MLhC3aZlTJ4Pzi4tFneTmsmg9OeNsc
 .iRjRo8BKiwRZOiUSoYACiYA.VetFCzbKYCmTsppKnke_nnxPnRGf2pSRRnS3b_Jkg0UwQx.8jL2
 57u2oQ7HJxjjDFSBlqPF60AXnEJdJEasvywT5784UFtZG8yAPdt9x1Shj7Hd_GnZdEjixhiJebm5
 nCsWHquzFFJ.IO_cvVu0nCFg5ew6J6QzAGYWK5h7KlecXYnHWMSp0Al2gGqPPK04cQPEhAii4umT
 KeABl8Pju_5iRVNqjuNjiXXIVUCmPXiKfLlvhLmwhsJgjlmUoCK5CIsvQZGMEXFrSDrAIiEBozSO
 kmaPNkF1Sv2wy.XRucBPdet4he46i_V4moJV_OSC3EnCipVksbNSY.7ORpgZTsTPBYrmRRH8dXKi
 E9CFHDV1QG.swE4alGJgBaH1VyIKgIhOToWrjpd3pX1w95.GOZPHFEbBfqdMgI1MYezQ0oMdrCvW
 0kKBmxN6h4nGHfVPRTtXJoi0I4xMgYKunUdbAlyf1ad2P_6_PRInnG6eSVA2yBXzuTIcdxS0Mn12
 O.dqSvuNIOruLuZiTypkKqDFgEU_t9aR0GXr2e4cxjssg2gaCWW6JuC1XBlCtEaqPj6wXDLkJ_gm
 4jnUhcpBDmGrlBso7gZ2VOaY1ArUVWyGJUPaXTpYTk6vFft6faXDgN90AvT.mUJ0KAtQ2IQrqY7E
 VuTRgTcl2Fb7gz3VWuCbdB6aChhQtN7_if_2RBv.RPDzqr4SmWTPPvqS1eo.aOUNgebmwHldrqLW
 JxZTn1Q9GKfdnNI3zpxCyrtHMiRqzCeHT3EopMf7UVzAIXINGbVBk7ePh6b0J9sPVXFCLl6d9fWp
 uv4w9cl9Q2mN745XpPfI0S_ynKyWtlunv6_FhQsm1YzJVSsGQOIhVg2tWZUIZhztbRG0wanrPnwS
 aS_xfpzJ6jCDDW88t3wSHR7NXU34Sso9rkwlSEEc2qzhF6IH2Zp2dl8esd75juwi8YBsbuSb.jTX
 vaho5N2dWtGAx1JZQOhh_k.2KFa9KdjO3EHsybOV3GcDugBn9NjgMZHO6A9SEmww2LxtS3JI1v_Z
 fHN9QDhJHAY6k2hben..4PYjV1aaTVHXEeHIL6Gb030C1i1zAgl4CHSjmfiUQCrjZrA26uXTpnmF
 IaFntEIQNWuGStjgC_epyJP5sVBZaNSaeoEe6PhzONE9XHH20Kc8VRA4JMDNdog_MENkKL.ljXxO
 KU3YF6XIpQcha7HwUKtyrAa2okZ5qR.TD67GurAg48S40kkBRTtAnO1TIcgK1jMzFrV.hE1udtWa
 hg6zDhah6G1MJMFUPoiaP9HVcHDeDFjqedZimwR44.Unq6BM3pBvYMRzwRncT23Lgxv9936JElDw
 aPeihx6XK5lHi2ZrZaSW3mfHtLDRLOBJFEM_3V5oIpkxvmVKzamriY0i3eeQE1TT22WHrNRSBWaa
 jpWp2AiykdFE8wduCSTrPkmNVkWHUlJS5x.9tPuqVO7HsMtftC0okUtQSGKW4Q76tJPSArHuNt.T
 I8TnyV01t8CCCN9__NnjECPDNhZUApyZfaWJd4q4LloB6rMqcvDxIxVVSPUlB9og_61S09ldLILu
 5lOr8B23qWnJ882UV1OxRHL4Q_ZfvA2m.NUIZM7TbABu8RamXlypb01F8zuYIUZOIt7p9eV62JhG
 1Wb6cxBvIAbHE_ClpIfiEOTg-
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: c2a8add0-a901-4f54-818e-45be881d9193
Message-ID: <232644f5-b0ad-414f-a4b5-03724f5ac053@netscape.net>
Date: Tue, 19 Sep 2023 11:09:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xl dmesg buffer too small for Xen 4.18?
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
 <ZQlHj5rjMaYj8Z4e@MacBookPdeRoger>
 <41a2cdf9-8fd1-418d-abc9-1fe4f3fd8b5e@xen.org>
Content-Language: en-US
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <41a2cdf9-8fd1-418d-abc9-1fe4f3fd8b5e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.21797 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 9/19/2023 8:10 AM, Julien Grall wrote:
> Hi Roger,
> 
> On 19/09/2023 08:02, Roger Pau Monné wrote:
>> On Mon, Sep 18, 2023 at 07:49:26PM +0100, Julien Grall wrote:
>>> (+Roger and moving to xen-devel)
>>>
>>> Hi,
>>>
>>> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
>>>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>>>>> Hello,
>>>>>
>>>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>>>>
>>>>> [user@Malmalinux ~]$ sudo xl dmesg
>>>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>>>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>>>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>>>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>>>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>>>>> ...
>>>>>
>>>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>>>>
>>>>> Can increasing the buffer fix this? How would one do that?
>>>>>
>>>>> Thanks
>>>>>
>>>>
>>>> I see the setting is the command line option conring_size:
>>>>
>>>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
>>>>
>>>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
>>>
>>> Thanks for the report. This remind me the series [1] from Roger which tries
>>> to increase the default size to 32K. @Roger, I am wondering if we should
>>> revive it?
>> 
>> I think the relevant patch (2/2) will still apply as-is, it's just a
>> Kconfig one line change.  I'm however thinking it might be better to
>> bump it even further, to 128K.  From a system point of view it's still
>> a very small amount of memory.
> 
> I don't have a strong opinion about 128K vs 32K.

I am sure 32k will be big enough on my system, and based on Jan's comment
about release builds being less verbose, the current default of 16k may
still work on my system once the release is out. I am willing to defer to
whatever the developers decide according to the ordinary process for deciding
such questions.

> 
>> 
>> I'm happy to repost with an increased buffer size, but only if there's
>> someone willing to Ack it, otherwise it's not worth spending time on
>> it.
> 
> Sorry that patch fell through the cracks. I would be happy to ack the patch.
> 
> Cheers,
> 


