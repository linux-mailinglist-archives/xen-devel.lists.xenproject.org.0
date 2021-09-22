Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4134146F6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192495.342970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzmd-0006D7-OG; Wed, 22 Sep 2021 10:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192495.342970; Wed, 22 Sep 2021 10:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzmd-0006Ab-KV; Wed, 22 Sep 2021 10:47:23 +0000
Received: by outflank-mailman (input) for mailman id 192495;
 Wed, 22 Sep 2021 10:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cZP0=OM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mSzmc-0006AV-HG
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:47:22 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7641d91e-1b92-11ec-b96c-12813bfff9fa;
 Wed, 22 Sep 2021 10:47:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22--k6rtIaEPCmiOWKKucxmKw-1; Wed, 22 Sep 2021 12:47:19 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 10:47:17 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 10:47:17 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0146.eurprd02.prod.outlook.com (2603:10a6:20b:28d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Wed, 22 Sep 2021 10:47:16 +0000
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
X-Inumbo-ID: 7641d91e-1b92-11ec-b96c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632307640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQGcZWHwX8Sm2ZZVAOxECqdLDxWeG4ZvsC1rDlYUo0I=;
	b=ZFjhYLR07yUzEuZnA7CRru84O6lDoFHC6a2pADQwoAcSql3y0GfA7Cz6xPSDh4xFG90+GG
	2QwgaBk2yJZIxIvVXT22WWuI9OyS6p1tCStnr40Lp3nYlvEQPPsrSRF4S5V21RI4vIoCyv
	wJsN1fhlh4BtCR2CiItYKAmhKLNM+ys=
X-MC-Unique: -k6rtIaEPCmiOWKKucxmKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovk8Y+g2IzAkVJFRWbi042mReAiQNo6hebmt5b4X65O5ip+5Isa3MGCE3kVofMAMpSLrA3KFbvLYfVfo8odYI7zlNJxCemTOttNI7wyQocLAlN69SbjRK12q/fqi1tv9874l5Tl0iJ6zNjcbaWnN64qRto3TJiHPP1ciEeeMCCkgnojSFTyjW2OCMTu4UXHdBZqGD/hjgyMGcxyYn7hFTSjp/1AmgiXBvFs9t67Vw/D4BYcF3S8MAHMbyT5mtMqr5gPoTGgdjgStjusHt2UfhBpB0H/ov+CRWxnVvTXMSKCTsZX/gn+i2TO1PnCtrj/bU+FRK2EREwPI14N90lKvsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Ynmh/rxar0o+sw0+7TfSuIexXq+IETrYTVj3DFqnmVk=;
 b=RRgJEeq6QX/CCfg36x4012XNFArQCl6xceLJew9pSFU8ysx/Bz3dVLEIutR2J8beAeJoq50AlfiBZlGK0LS9iVkeb6AncCx8i7Qz88alJC3HZY8dWcT3Uz8fm1ALu5xGeP2UpSOA+PEaANO0eDCtGUVaxaf32IO8FuBZwQY+pR3dYtyolRFbAs3TRHsQnhJXqUD+bQD2TjIrq9gnjDBjpRFryD578TSYrutAw3/CYehuvYzzYbJ4MT/Gu44PBySSG4L26zp/YBZDsZgbAGzht0Ec1o8crntcThNMNnaQuPBSVzQuxqam/UdPVJ7Hrn0QvpyymrztWiRUQXnYeoTe7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
 <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
 <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
 <b7947619-3520-174c-f5ec-49564ee048a1@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <474bd675-b42e-3f9f-03d6-f7afc26e10c5@suse.com>
Date: Wed, 22 Sep 2021 12:47:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b7947619-3520-174c-f5ec-49564ee048a1@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0146.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e6c22f5-da02-4e08-859c-08d97db65885
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5903ED74FEE354F9F698F4DCB3A29@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F4lEEYIlhcMirTRRLc24GNkrJvdFp5I1IDhnJCPaVJ4kSuvGFCDYQfOFhgD11oTgs5psDI9+7rFHsFoXH5IHgwFCqTCX+dfAkiOB/RNPGynS25cYn+7wLeQmUUsPMwgWrgtHk2mZMW/8oxitizGNrnrEFSuz+Jevuj5KjSvDyVDR4DPTK3ytUHsITNQoPhKf6yQ+CXj1kP6qNrvBU1SYn/WkiBwxbGy85XQYFzgk24Dsh3kYS7EMEEBqwAHWHwaWBwKqyiFXxpE1DTVnTo9X7+ovVANKVreGuze1ZmkxrU3vzwIqY6D2j/zr1DesD4DIC9RtMbzjzz/uwasmDBa6EDZE9tySw42c3FpiYH4YIFWKn0FpHj6CRhvHa3k6fKrdJsZbyKnzgzE3M0H7D5pgOmqkKn3MFsydpHTcxCohjBOmpnge9lfBX8jlczoMYrY9sGNKoaybRunSIu9dpqjRJngFNcH3iGcDcLnDiDxCaFxGWT6O3AnlNWJL+Uc0FWSVTvg18fRXR4oxs/WDJeDrAaAbgvV5F0KXt8UMZ1BLLrzUnUH/MhtfaeiO60+uyEVKm2PkG1S8+C+eli6tozMfXCMf6khr2WVHp5lygfCvH70YscwkQquGejybRumDt/h5GTlQwqoV0Ej0t+Yu3m/aEBLJzvcHDmhR+lbL2Ym4OXnFVQtu0+PhB93Gd+gD59djmmJ2OcqHCdgCr1q7ZQv7BWetf2PzIgGWBMK7SHQMst9FL3vEqyzunpMAGrDse+9rf+ptrI1X7e+MnIernFD40w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(956004)(186003)(8936002)(31686004)(4326008)(31696002)(38100700002)(2906002)(54906003)(36756003)(66476007)(66946007)(16576012)(316002)(508600001)(8676002)(66556008)(5660300002)(26005)(2616005)(53546011)(86362001)(83380400001)(6916009)(76704002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dwQ+FYYdRuTwqS+B+pufpMXSvmuFsP6CFbUsRLdM6ZtKGnVq/e79qmnVQN5W?=
 =?us-ascii?Q?Csbxh1s19CKhp4R9BN88DCUqAIvhMVKVryL5G0l9RV2X5jjQHY1ttQA6nK9k?=
 =?us-ascii?Q?MaoK2UM2gNB8sLPA7J/G5mKoUQS+tkb9ag4E57AZrb82fumfX/1851Hd4EEM?=
 =?us-ascii?Q?eGLOPaFz86+HFICPDiNre7SjhDy/i3xqpLKlpYToEpHX+9aIA3hefrNaDcun?=
 =?us-ascii?Q?oH9tlNs1obdSusf9vC/YXsKQ3ENGui24pnccKuih8fMjlEcefnIkfSUHLJHX?=
 =?us-ascii?Q?1OGl5PKjbREsW+gN7CTlbVQgwMxsS3NArTf7GCIm+5HUaQBBjd8II9cZU/M4?=
 =?us-ascii?Q?td4fISMMMdjybK8KNwhTh6+5t62I3f/udnm64L3uy6Q7vROdwq4uZWxrAUGn?=
 =?us-ascii?Q?V84XKZFK6y5jmRJq9PsP14FV/1ZRjxJkv7MuLL+LrpdVnlT13fXBuOsXytBL?=
 =?us-ascii?Q?4afzbOjcaLtr6f8mYAx6zBTHOzMEdaJxyZ5iwClB0WDvyYzi5wVZEX2o7PPC?=
 =?us-ascii?Q?3iOrkNZsTqWS26rD02yCPa9yWDiOy7JDDzodlLXCvj8BFCMzt6tYyac1GmnX?=
 =?us-ascii?Q?e6g8GVODEEdgJrLz6eIiPG25VFmDVYqhu/aUsrrKLRQGlqY5KlizVKXJ1YYR?=
 =?us-ascii?Q?j45cunxTLh6BD69SnoIIjklL8iZZ6xkWf4z4xpO0xK3eNPSM1KrJGqk79JrI?=
 =?us-ascii?Q?aJPOFm9crif/1LCt/xZuO244zlARHqzpgQVQJJpAeRrIVCfuMzysYmnT288C?=
 =?us-ascii?Q?cMqmscEClK7qOp09ycpNApaFM+hFT5B+r9qaWRAptB8PKR8L8F4nsIRWTLA0?=
 =?us-ascii?Q?/yW0nGhuWPG7DfQoBJjC6DR2+w8leG+e8Oq+vXZImo2Fo1dl6S2H5Fu3TUgF?=
 =?us-ascii?Q?6MBwLYjQ76Cjn23skJuftXRElWvq4Dr2cLLKl9op49cH11TD3u6P55n1Ak2o?=
 =?us-ascii?Q?Nc3WX7lkDAvFjyTXZQA8qdQQAHpp7m3kPHBd41SdqlsvtpeTzng4+okyseJW?=
 =?us-ascii?Q?Wv4FcnHvvfIcEpSQuO/gODsDkNjlIPt3dwd2RQNgHTJnWCQsoovzn93DqNC8?=
 =?us-ascii?Q?2I2xlxkhzLBKKfNeX+myXFh7HXm7DIXT0vgKQrcyh6cjRcC5Y0/4Tf12pbWK?=
 =?us-ascii?Q?lm2wzVoCAccovH2z7A6AOdtvF2XHltXypvZA2RgXQfoTnCXa0jiqpHU39+wB?=
 =?us-ascii?Q?mha6aw0gHyxxAvUIw/POVcC3ykyjrddk5+xvtfNdHDJmAhw0VMVHP5py2UXI?=
 =?us-ascii?Q?Lb4m7E+XCYJCqAqFltcoiILGwiu/MEs9JtEhFLTvaIu8A9PPM1h9FvRpMh0b?=
 =?us-ascii?Q?nr6vuww0Y5qDTrKZw0UOp2GE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6c22f5-da02-4e08-859c-08d97db65885
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 10:47:17.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tii1DXqcgpP9jOXWcZx6qluYwhMmAvEOdyijHFM/ChbDVH+kexIHagkSbi6pit7yNubiPQmbhtItvJOh+SX++w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 22.09.2021 12:28, Julien Grall wrote:
> Hi,
>=20
> On 22/09/2021 14:42, Jan Beulich wrote:
>> On 22.09.2021 11:26, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
>>>> On 21.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
>>>>>> On 20.09.2021 12:20, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>>>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||   =
        \
>>>>>>>
>>>>>>> I'm slightly confused by this checks, don't you need to check for
>>>>>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
>>>>>>> guest_physmap_remove_page?
>>>>>>
>>>>>> Why? It's ogfn which gets passed to the function. And it indeed is t=
he
>>>>>> prior GFN's mapping that we want to remove here.
>>>>>>
>>>>>>> Or assuming that ogfn is not invalid can be used to imply a removal=
?
>>>>>>
>>>>>> That implication can be (and on x86 is) used for the incoming argume=
nt,
>>>>>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
>>>>>
>>>>> I guess I'm confused due to the ogfn checks done on the Arm side that
>>>>> are not performed on x86. So on Arm you always need to explicitly
>>>>> unhook the previous GFN before attempting to setup a new mapping,
>>>>> while on x86 you only need to do this when it's a removal in order to
>>>>> clear the entry?
>>>>
>>>> The difference isn't with guest_physmap_add_entry() (both x86 and
>>>> Arm only insert a new mapping there), but with
>>>> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
>>>> mappings. And gnttab_map_frame() gets called only from there. This
>>>> is effectively what the first paragraph of the description is about.
>>>
>>> OK, sorry, it wasn't clear to me from the description. Could you
>>> explicitly mention in the description that the removal is moved into
>>> gnttab_set_frame_gfn on Arm in order to cope with the fact that
>>> xenmem_add_to_physmap_one doesn't perform it.
>>
>> Well, it's not really "in order to cope" - that's true for the placement
>> prior to this change as well, so not a justification for the change.
>> Nevertheless I've tried to make this more clear by changing the 1st
>> paragraph to:
>>
>> "Without holding appropriate locks, attempting to remove a prior mapping
>>   of the underlying page is pointless, as the same (or another) mapping
>>   could be re-established by a parallel request on another vCPU. Move th=
e
>>   code to Arm's gnttab_set_frame_gfn(); it cannot be dropped there since
>>   xenmem_add_to_physmap_one() doesn't call it either (unlike on x86). Of
>>   course this new placement doesn't improve things in any way as far as
>>   the security of grant status frame mappings goes (see XSA-379). Proper
>>   locking would be needed here to allow status frames to be mapped
>>   securely."
>>
>>> TBH I think it would be in our best interest to try to make
>>> xenmem_add_to_physmap_one behave as close as possible between arches.
>>> This discrepancy between x86 and Arm regarding page removal is just
>>> going to bring more trouble in the long term, and hiding the
>>> differences inside gnttab_set_frame_gfn just makes it even more
>>> obscure.
>>
>> Stefano, Julien?
>=20
> This would be ideal as I don't particular like the approach taken in=20
> this patch. But AFAICT, this would require us to implement an M2P. Or is=
=20
> there another way to do it?

For the purpose of just XENMAPSPACE_grant_table the "restricted" M2P
(to just grant table pages), as introduced by an on-list patch, would
do afaict. That wouldn't remove all the differences between the two
implementations, but at least the one affecting the difference in how
gnttab_map_frame() needs to behave.

Jan


