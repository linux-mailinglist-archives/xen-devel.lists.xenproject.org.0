Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6018565265
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 12:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360132.589508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8JMy-00038l-F7; Mon, 04 Jul 2022 10:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360132.589508; Mon, 04 Jul 2022 10:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8JMy-00036T-B8; Mon, 04 Jul 2022 10:31:56 +0000
Received: by outflank-mailman (input) for mailman id 360132;
 Mon, 04 Jul 2022 10:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rvAI=XJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8JMw-00036N-Vl
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 10:31:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2084.outbound.protection.outlook.com [40.107.20.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 853dde32-fb84-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 12:31:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5443.eurprd04.prod.outlook.com (2603:10a6:208:119::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 10:31:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 10:31:51 +0000
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
X-Inumbo-ID: 853dde32-fb84-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1VrwaYgygqOngXtShkQVb+0wJVCMKbw+u3IK4WnHTiH934Q8gOhw1LUKuKhqUATV5nfB4nQ7vqONXvjXP9yLrZRZqimvOg2vIshp+DI5FmEFvd0qMu3DaGv9r5ZUMl0IYmwwTPGU6aynwtYbTcMR7761L/gVGKJcwmv+yBGGx75ndQJ5iIg76+SmwD5AXG7ZFgWYF9AnF1a3BeYxyorpqQ+p0xhSGmS5Kzeo0hJdX1t3WO6c6DM5iEp0xLZ0biSanrlaNUp1T8KKnHzL48e+LkaTFEQky5UZ8tmRF2zFfoD3qPKAxBl+1K7kXZNHANX9ixdqAVP8sFQFQQdgYL7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvYimHc7miBXWxY1r0oSigWxnHtEf6m2Gcy0rQtxueQ=;
 b=VsgRoszTq/SOS9ImYCl8m52alhqZEZ5SO07ZvOXVfIEN1FVE1tDLHUT0Zb6B5kBx7EBL3BruXW9CPLShzdm4cSF270M7CIXbqGKR0BTR5G4iktbHz2EkWWDaMigkbmyfAqveop4ExAheN4ic2Yt/qyBABDIDjDFUKTCiO/G1T2koDNkg8EXaAx69L4gW4KsqYQQ5HYKjECS6CxAbAaYi6c6sLPje7FK/KG48ADVbqOskt9xT62w/9m0BZ41adG+gEsfdVowndBO4v0u4ZKpnqqpCcP2ojPOIoDdnhkRWfisB9vHVTdeeYq6KwUQ5yX9tf/dyh86Z/Ys7b7/cbdpjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvYimHc7miBXWxY1r0oSigWxnHtEf6m2Gcy0rQtxueQ=;
 b=I8QiIKxuzTrC0LnT413REq1vURAMAtxTcP5LmEg3Td4PPL8/jhQNwZlxxnMOFFt2C7IEqzeB3sVDSwmCcntC+aFsGS78ebmYIkrLJXoohmQuVXC0YM+1k1VVbcQUQdYNlrJJgJUcEB8SZj3lmLvMHkLk8FQ3SHmpGL0d0xlWQ+BE9AUHQnkSHmjaMP/++JXrLGdsnlMl1SOXRkEgnA+LoRtImF1o4gFLGqBJWpS4DwpsEFiqHvcWMx+o55mKS5VJcs0wFyPH1mee0cT1zct8Ai9GUbr0FrxnKez8R9CqN3m5J2EW2fQ6X/Bl8lWRbqFoJ1hTfZOBqqFu5lFjuYyzZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04bffc27-9a08-b0de-5e77-93d26d2a3e8f@suse.com>
Date: Mon, 4 Jul 2022 12:31:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: PCI pass-through problem for SN570 NVME SSD
Content-Language: en-US
To: "G.R." <firemeteor@users.sourceforge.net>
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <CAKhsbWbqk5zW5D3D6RUdoj6bZaSURB5kTZ66Tq-0kWezWwGfuw@mail.gmail.com>
Cc: xen-devel <xen-devel@lists.xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKhsbWbqk5zW5D3D6RUdoj6bZaSURB5kTZ66Tq-0kWezWwGfuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0047.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7afbf29-bf87-4b96-2a4b-08da5da8683b
X-MS-TrafficTypeDiagnostic: AM0PR04MB5443:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bcbaV0E4frQQCpTF2t6+ZwdQrmEHPmiQHHh2bS18I4ZXKg4pm1nymqJ5Wz0AcJW5Xf20JigRTm2tNiGGga2t+7eDATnpMY1fhXfNYF6RXkvoFneXMQAzHBLqhNEXZamN0YVHCxPc5MY/vSgw8sHFjCL4hpGNJfy845tI4nT/Gu309i0xae2DU8rGReGq7DBhEvkBLmtRz/YrUp3Dq98ZxlPUao82bLKexYIQiJ+w6boLol5cgpiH4+S4TlVvmwFjWoCfxAh3OC9xoIZnnoRsmKDP4a/bj6gQEOzeGjMjS8+PtLu6VVczIdMkt2btnSTkLEJL/XkVN/epJy/mF2tzmlU5KTC5a208h5DkwEZavOmEBK6lvo2O7zfCezJ7jTucmvaDlPU+aLuJ9nKOQVo+FpzALRgTG4ObBU2+qp3LDsJIXOKmZfqT9SzImvq7zx9D0Yj0EzQ751KNO2UIeANEI13sPJczVWsinCUIt3UnwmddyoC9oukpXJtSVCiL7nnaTRGvhltCewMKIJ2YqidFrWREAHaBEF48FiczOE0M7C/yAt5Qw53e2Fzbi5Ik48lj3cx3qRlLjucty1INh25VCt0fACDM8Tsk3ntNYiqsaIq5CXAY9bIR05EEBzbYhASzuSUdxlhH8fYbOr7iPhJVaXUORuTqg9GHLfRm7IwqFnioDBCZH35wrI7/Up6ePMoiQ64pCCZ5OfKVy+mMpU9vTpGjnf3sMjG08RuKqX1/swDmL3RGSMWJkHbhiI/oE/O/IDM5/1G09uh3CqBCz/zPrXobc/ESlrwRRFSU/fEbV0JiH+cUARfr0KQnRhs+cmy3j3Qv1pDxCvSeg/d8nlY4W5q+HvrpEtFzLWVatdLF7QWT1usem+6aFi0yPrLlEXlrHPXjqdqtZtUHZCgC35MDVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(136003)(396003)(39860400002)(66476007)(316002)(66946007)(4326008)(8676002)(66556008)(6916009)(478600001)(6506007)(966005)(8936002)(6486002)(31686004)(5660300002)(2906002)(53546011)(38100700002)(36756003)(86362001)(31696002)(6512007)(83380400001)(186003)(26005)(2616005)(41300700001)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVp0Njg5S2toNDFpcFpDUjVVUXpjc0gwWk9jV1F5TzkybC9WNXZqUHJiN2ha?=
 =?utf-8?B?SDhJT05Ld0tORURGdjlsOE1YQnQ3bGFzRHhHc2tTbUt4YTVmRUt3RXp6NHB0?=
 =?utf-8?B?TjBKeC9VdEc1QlFlbmZ6UkJ1TFppbFlLd0V6WFdjRDhseVBjT1lTMTc3V0kv?=
 =?utf-8?B?THVsWDA5VnhxeFBRUWNZV3FVbGlPR1ZmbW9UM0pvSEV4cGx6M2ZaQTFtZDZn?=
 =?utf-8?B?K0s3SG5BcDl0WjQvKzRLa1ZyYkt2WURnRFEvUG1GOExXakIwWVlMZkcwWk1Z?=
 =?utf-8?B?c25aTVJpSFR3MDRWNDMvZ1BqMTg4RmZDSVFQRmtIcGdwb2NYOHNqYlQrVDVT?=
 =?utf-8?B?ZWkyNU1raDBJMkR0R2p3M3RKQzV0UEJlSG1lNTNFK0hUOFU3dTRVOVFQcUdV?=
 =?utf-8?B?bCtBaEkzb0Rxa3l6QndUTVBPckRSdWtxSVZRL1dhMEZGQ1I0WVdOU3cvcGp4?=
 =?utf-8?B?c3VBSXA4VFNXcjYvT1dVN3hJVlI1cENudWlTalhiUWt6a3JBWlV3TzRmNldZ?=
 =?utf-8?B?WFlQRFIrZERVeWVoamd4WUZocWdrWXBKLytNd2Q3WHNnNmxwU1hvc3J6U01Y?=
 =?utf-8?B?cFYyaDlMb1R1bXRoTFF3RWI5ZmRhUTJnb2ZIMlp3aExodDJVNlM0cFlvR0xj?=
 =?utf-8?B?bGhsdisva2Y4ak90VHkrMmlXazVFQmtMU0VROUpNSlFveTMwb0I3VlI3RDdq?=
 =?utf-8?B?bzFBZ2VoVWpOaHZRM1ArNmxKVFplNkpwcTBYVnJ4bXo1YkdCeDlKekY1TVlv?=
 =?utf-8?B?Ym1oNDR3ZFFFL21QU1FnVHJGakNXTDRkeVNiNVNNL2tOVGtuQTFVQ056R25D?=
 =?utf-8?B?a2ZvY2ZzT1RmU0xlb1FVTkFmbzZqRzB3STZVdFRORXZrOXFzeGVWZjhqa2d1?=
 =?utf-8?B?T09ZNGlMb2cvTVpTYVlRQTRFQThwczIzbzYvSHNhWnp6S1lOUGFMdTVKWUdB?=
 =?utf-8?B?aTV1NUtHWk0waDNPVzZsSnhtbWoySERKV1VIRlIxakU4UG44RFhPMzNHSGxz?=
 =?utf-8?B?SFMvNUV5cy9IY3NHZFp1RUFsQmFVRnBGRHFSeU0xaXVKSEswRFBRc1dqZHRO?=
 =?utf-8?B?Y3hudGZHMG52b3JjTS9MditlcEt6Q29kbU5Mamg1UnVMZFBsQmNSUXh1OWZw?=
 =?utf-8?B?Zm1DQzNtVVJHU0VzNHJMOW4wdXU2elhZbDJlTFZ1eEZFcWRwdnhCend3bG5X?=
 =?utf-8?B?SDVROVlWc0UzSUc4Zkk0VEZRU1JLUk1ETzN2OUlKakorVDFvZ29CUExqR0Y0?=
 =?utf-8?B?L2N3VGlhVHN3MnJNeU9GcGl3cyt0aUozaTd4YVNzUTY0L3R1VFFib1hTVldF?=
 =?utf-8?B?UWdNMldNellkNUd1NisvUVZKUkFiaUlyS3BiUWdTTmFyOGdmdzdVeHhQWFJm?=
 =?utf-8?B?TmJ1dldzbFJVRGpPYndvLzNqK05RRERMTFlwUElYa2VuZ3FMeit0TnlXTmJj?=
 =?utf-8?B?NWcrV3ZKUFI4ejVMYjNWUmJ2dE51cnQyTzZ6VS9PVGc3N1NpejlOWURKOTNx?=
 =?utf-8?B?ZGtma3FrVjVVK2txRFlBVnRYRUwrd2xZYUVBMWQyNnlCT0psZVV3QmZleFFv?=
 =?utf-8?B?Ums4TUE0S2dJd1QyWjBhZDNEQnJLOW1nUVMrdGZiemZtYTZpbUpIZUxJNm1V?=
 =?utf-8?B?YTgxQUdWVDhKeTFhQ3lsd2VEc2YwcHBtakc5Z1ZDM3BSZDN5a1ZnMXpicE42?=
 =?utf-8?B?SFBPNkIzdmF1czFuejROaW9uaEtkckkzY1ZNdmw2UDhnMTZiZmhTbHBmME4y?=
 =?utf-8?B?aFVvcXB5ZVg5U2hBSkNEU2NMWHRnL3doVElFdXByYVQ0Y0QrNkNsRFRRc1lw?=
 =?utf-8?B?bGR3Qjg3RStvSTdvUG9EV1N4S28wL1pMQ3pvZ1NOWitRdDB4RGwzVWVUY0pv?=
 =?utf-8?B?QXVyZWlPOFFwQm1lYWdMSHM5c014T2YwZENGc0FFOWtrVFBwaDVuMzN2a0l0?=
 =?utf-8?B?ajZPelgvQ1dHaldERnljeHQ4aXlGdThxb1l1Z01rQzIyNFN4OW1kL0pIYnRm?=
 =?utf-8?B?MlpuckhleXk0bmx4NU4vT3R1NnZRR3FiT2N1bU1mMGZEdVNJYmMyR205K25Y?=
 =?utf-8?B?d3h6VGxsaDJUblV3aTRZNFdqRU0vbDE4UllaWEV1QzZmeVpEOXVIQjNmV3Vo?=
 =?utf-8?Q?MPRkONhgWkHvWIXSQnhyWrWNl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7afbf29-bf87-4b96-2a4b-08da5da8683b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 10:31:51.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLkpZ9QHqr9KFei8VZ2zUTY9eZrCqd6FmUJP9bj/RL5Pzcs86RVZL2Un/9jTJ6zm3i6VnZdFrmCdV+ilj1eOzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5443

(Note: please don't cross-post; removing xen-users@.)

On 04.07.2022 08:37, G.R. wrote:
> Update some findings with extra triage effort...
> Detailed log could be found in the attachments.
> 1. Confirm stock Debian 11.2 kernel (5.10) shares the same syndrome..
> 2. With loglvl=all, it reveals why the mapping failure happens, looks
> like it comes from some duplicated mapping..
> (XEN) memory_map:add: dom1 gfn=f3074 mfn=a2610 nr=2
> (XEN) memory_map:add: dom1 gfn=f3077 mfn=a2615 nr=1
> (XEN) memory_map:add: dom1 gfn=f3078 mfn=a2616 nr=1 <===========Here
> (XEN) ioport_map:add: dom1 gport=c140 mport=4060 nr=20
> (XEN) ioport_map:add: dom1 gport=c170 mport=4090 nr=8
> (XEN) ioport_map:add: dom1 gport=c178 mport=4080 nr=4
> (XEN) memory_map:add: dom1 gfn=f3070 mfn=a2500 nr=2
> (XEN) memory_map:add: dom1 gfn=f3073 mfn=a2503 nr=1
> (XEN) memory_map:add: dom1 gfn=f3078 mfn=a2504 nr=1 <===========Here
> (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
> (XEN) domain_crash called from p2m.c:1301
> (XEN) Domain 1 reported crashed by domain 0 on cpu#2:
> (XEN) memory_map:fail: dom1 gfn=f3078 mfn=a2504 nr=1 ret:-1
> (XEN) memory_map:remove: dom1 gfn=f3078 mfn=a2504 nr=1

Neither here nor in your initial mail I've spotted information
on the BARs the device has. The above makes me wonder whether it
has two BARs each covering less than 4k and both sharing a page.
Or wait - the hvmloader output actually has some useful data:

(d1) pci dev 05:0 bar 24 size 000000800: 0f3077000
...
(d1) pci dev 05:0 bar 14 size 000000100: 0f3077800

The sharing is apparently introduced in hvmloader, but might not
have been deemed a problem because it's generally advisable (for
security reasons) or even necessary (for functionality) for BARs
of devices to be passed through to all live in distinct (4k) pages.
However - while hvmloader has no knowledge of host addresses
occupied by the BARs (so it has no indication to place them in
separate pages), it should still not put any two BARs in the same
(guest) page. Even then, as the P2M mapping occurs at 4k
granularity, it would further need to know the host's offset-into-
page value to correctly calculate the guest address. IOW this will
in addition require the host to put all BARs at the beginning of
4k pages (which may well be the case already for you).

(d1) pci dev 06:0 bar 20 size 000000100: 0f3077904

would cause the same issue (afaict), unless the host BAR shared a
page with the earlier BAR of 05:0.

> 3. Recompiled kernel with DEBUG enabled for xen_pciback driver and
> play with xl pci-assignable-XXX with it
> 3.1 It's confirmed that the DPC / AER error log happens only when
> xen_pciback attempts to seize && release the device
> 3.1.1 It only happens on each of the first add / remove operations.
> 3.2 There is still a 'MSI-X preparation failed' message later-on, but
> otherwise it appears to be successful to add / remove the device after
> the 1st attempt.
> 3.3 Not necessarily related, but the DPC / AER log looks similar to
> this report [1]

The only thing I can say here is that quite likely pciback needs
work to become up-to-date again with advanced feature handling
elsewhere in the kernel.

Jan

> [1]: https://patchwork.kernel.org/project/linux-pci/patch/20220127025418.1989642-1-kai.heng.feng@canonical.com/#24713767

