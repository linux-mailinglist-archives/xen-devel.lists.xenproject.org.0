Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A353FCAF8
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 17:39:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175875.320244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5qj-0002ij-Eo; Tue, 31 Aug 2021 15:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175875.320244; Tue, 31 Aug 2021 15:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL5qj-0002ft-AE; Tue, 31 Aug 2021 15:38:57 +0000
Received: by outflank-mailman (input) for mailman id 175875;
 Tue, 31 Aug 2021 15:38:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL5qi-0002fn-56
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 15:38:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c4cf360-0a71-11ec-ad4c-12813bfff9fa;
 Tue, 31 Aug 2021 15:38:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-0lD_aUQrObaI7nUAb4knoA-1; Tue, 31 Aug 2021 17:38:53 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4788.eurprd04.prod.outlook.com (2603:10a6:208:cd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 15:38:51 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 15:38:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Tue, 31 Aug 2021 15:38:51 +0000
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
X-Inumbo-ID: 8c4cf360-0a71-11ec-ad4c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630424334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weFmtKcaLCkLS7OGxiSr9ClE4ivMCic3CTo08QCGRUU=;
	b=BIezu0Tvmd1UilEVfcEztV0azBcIdWQdKRVwxFmKr/HKrULdAo51x9XlVe+9owhuLI8gHa
	KfmuCwFZR8mqbbIMgerNfDi1YQLDc40LqqlOu+mTBYwPVM3VvettGnwRNbrAGZYPBWZne1
	NCVBXpsBo2fWy/0oHRh4+BlVwxG80n8=
X-MC-Unique: 0lD_aUQrObaI7nUAb4knoA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBt+w+z8/Cx57HPnOhe75Btjo4YEM1WbVNSdQvcQUuMUn7kZF8HYu8ZUBWPmBicK7YdA+wqsrzbWbwMCTOBtzNyruT+evpoda1sBlBuYfU3sli4wL05taH8bNF/Vx8OkcbFcaTQU+/DndUx+lBKoask3awBHm2py0xK+hcWGksvGSH3+38dNm9MJEfjgx4U0mSJ6sNdUzI90eGlXb8CpjKeaNAKG0Z9396CFPXnQKco13tBFyoict9Vu69c2SWjmcvymwrqT5RtVhVKXOBdE2iLnoyFsvusQi0ts6XjIxqHs+Lok4/SRfrgyC1DrWFwg8CkgH+vVGCIH8CgXXh6tFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pn1CBAarCnQzDCn4EGTb+dJnk2FgPr7ghDshwpy5KHw=;
 b=lt3+raH9SXgWcdPXBZ40QS2uS86UBqQKz/4kIjrSMzAmQBTxfuFFdW2VVPle/FLW6Hk69y2LknbKY4CxG4g9qWSCbrNtcgJ9dC2iWjQ3Huev6EMP1p10SsKD88fPPG8v0O9nDviIlPFJWllWwJVbaVQCxTspbW0JQNe2JI8/GayF1mFYx3GYUw1UDPo5wUKfZ/tkezSgYrt/9nSwBWxRHHPT92iPJJjMBtBerKfYaa5YW91pWrIUBM4/lzbPvQBRBOErrt8npKYBIUzxvroiy8ovfcmuPWYSv1An0bf1MuE8AqQaZS4IMsSle99z3Mu7PqsWt9Ht95JpTQRLmyOwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/4] x86/P2M: relax guarding of MMIO entries
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <93ecc397-1293-69b1-e70d-3c5f9317229a@suse.com>
 <ad1e33b5-d729-2680-7f9f-aa875c2d9cfa@citrix.com>
 <f684e203-9967-8653-d59f-ad11f5070aef@suse.com>
 <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d69d4c0-7a04-c3da-f971-616363c6d63d@suse.com>
Date: Tue, 31 Aug 2021 17:38:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7f56c625-eee6-31c4-2d6f-bd7334867d83@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0052.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::16) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a53fc18-4a96-4acb-b6aa-08d96c956ec4
X-MS-TrafficTypeDiagnostic: AM0PR04MB4788:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB478817FF76367183D33C4872B3CC9@AM0PR04MB4788.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rIKGZqs8pokH86iuhSY7M/4izRi28j/yGrjK9LQgw6a/RmsHdYa+dZ4HYR8RY77LjeFaTjifLWtXrbGxnWOUpscNTbjEa5uOzLnFnQZYgX1XsNlOoaorYB286w40kieE8QI9W+yuEfTkdfJ2iWdj/7LgOxJizL65jYSCfPxeoO9N5OaVvFWwPLXXYUrIo2PLRuOn6rZt2jMX7u3Zt0dPEkVgHW7d8GbCJq2EcEhnlwJDy1UHXxC/oxp6muVqCGuH3M27zjbkpTblVRNKJBirWYw12249bagknrwnF0AMTAr1gT3Xrls4legDeXYez16Tyswip/EtRtWIPhkR05gwNDqANZGUYDEYsi8cHyKttCTiNkqKYx+FcNMB/3Ya6QZGGgmeSszIJzyBcP+361E4efzFDKpDhAKIb/s2k8faFy7Ijlpqub3dcKXaZKyoCuWQi3HF2kroGamr66u4ZozAnnEyXVfGOrG/PQ6FNCu/SvwqIC+rjtFOJDdYT47thndSu1UwzbOeYX/ZY4BWsjxIXSD+HigLyHI4MfVRPir3NnuKoZLu1HrxAGMXK8uZ/hyND1nBbztBENIq0BjKIDgZbjLzH91GO3+7TLQ+KdE3Q8WNALCQUh9GyY8utWSrWbiOOcFU2nvvNS+Q6+QeB/fgt0sjYOm8rK0YNwY6b7SmQbmd0Q+tqafidPQ77AnPmLHJM3hOrfXm+BHIVFdg576ttpgbyL8AfGuRocrxHepIVK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(136003)(396003)(39860400002)(8936002)(31686004)(4326008)(8676002)(83380400001)(66476007)(66946007)(31696002)(86362001)(66556008)(26005)(5660300002)(36756003)(186003)(956004)(2616005)(53546011)(6916009)(16576012)(38100700002)(316002)(478600001)(2906002)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o/sZ5ROOnjyFG4etQqeaBM93QU0vmXMlvWDjb/jK8gKG5swGc5Dr+b0j5THl?=
 =?us-ascii?Q?ozU51qRu7mx/w48pEVyhEb6Zayuz3Kc4PifwvpD275SYi2L82EmNeIdgCwzZ?=
 =?us-ascii?Q?waWimf+zGxCm8oFI0KRWz7r445+rvoE3eMA+LFuJmt1yGhf/wX58rAH+6ZMi?=
 =?us-ascii?Q?fKSVd3ModNAK1nMnzzWa3cpCoq11+0Ned4PoSebbCnevriKl8KTGcNn+UaCg?=
 =?us-ascii?Q?jIUV6rqDdtAVrcXiyOV+aOkgstvO8h8HWV+GcqlxXC10VY4EzpJjeUyFiPaF?=
 =?us-ascii?Q?/QzcU4DpOtaY4NQkF7rxXBsDlXtYyjNsZozLOeh/Xtf4AdNz1Cwc/Dr1iZZM?=
 =?us-ascii?Q?ktxGJIpDroBuGtsRRNpR2e1vMIC/HTheabOODzGKnZguM1BjcFqPCYQ0t6xp?=
 =?us-ascii?Q?Bj2shfPVqUO/KIIS2mFi2L6J+TxU87+WO6nWgxcgH6o3phWsNmr0b/13VxIh?=
 =?us-ascii?Q?QVBMSz4drW6mQrUbh6MrQq8iVlxAt6lCvRkIOkHQrmczU0NUhNWmZ+aIdOnN?=
 =?us-ascii?Q?7JnWs3WyVOlVvJsQeXQTfy8rVelCQ/Uto9G/Gs1DMShW5qkxKBE5+B1VT9uK?=
 =?us-ascii?Q?QyqNwWsdHpXt6V027sa5D1Coaj4ckEWLPLOVYauEaIATb5nQ7vvJKjYoo4+0?=
 =?us-ascii?Q?pvQ9EfJ90tB4qTPfJkJ+PMtthRUc8GQG2ZmR/G+4W/IZJqtwMnwWFLSyMo1M?=
 =?us-ascii?Q?5iNG0qBXp6OCH+RGqj2A+ilWOSOc2K42OapuVYclUDKxswItrjzkfrAkTBRR?=
 =?us-ascii?Q?byfWRUKRjfb0XM6/NhFeU/MY5PPt6ZSgMqynNAJL3EETf1hZxevucDYHtyKR?=
 =?us-ascii?Q?yFMbR9Oyfydb8iUvP84zvOJ2tSaZXp/ZJESyfm0lWCA3x4xibvd5rLvyn2p8?=
 =?us-ascii?Q?h+9D9sOuGk92A49T/+lffpE6UgRjYX7Kgt8RY9dYo2Mclm09J79Usej8wodc?=
 =?us-ascii?Q?IU8QhgfFB8jGGNoIx4JFgEd7CVqY/8izUxWpo9o6XTgVgsCEEYli/GLCAMsJ?=
 =?us-ascii?Q?PiKPYOuKh2yBWvSyv2LwLHNb3L1wrqHZ/kZzwtHKWk2/dUoeAdmXxFWwsN3p?=
 =?us-ascii?Q?G+7CXQfvMr1x2E49tcdNrTMAzrQ/OuDTK4WocPwVAaB6xFXFD7Hp9gqPFM/d?=
 =?us-ascii?Q?XUYQhi2cqnpm1s3PfB/HDxugbuBcgRxRplrLIfw6rf23bvRLq374l4mtCLOc?=
 =?us-ascii?Q?0Al69Q4A3OWe1x6rVlPrOafAUAhqka5XZDAZQsHt66zze61+I4sd+d95Cfp8?=
 =?us-ascii?Q?cqXH15k1VC0CVZ+OWW8f9Qg/h6dZMH7GJG6qtzhyd+Acjtu4STX/dHHHL4vS?=
 =?us-ascii?Q?coUmhMahGLTHp+9w/2hsa4AK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a53fc18-4a96-4acb-b6aa-08d96c956ec4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 15:38:51.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt3nKMG5Rv4hnvrJpoHVNxxBMe+OrvG9PQ4CZCDR0184E6YDiosWjEbGEFyRAz1gAC3yOSbuTXgenhcaiSvQvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4788

On 31.08.2021 17:25, Andrew Cooper wrote:
> On 31/08/2021 14:26, Jan Beulich wrote:
>> On 31.08.2021 15:16, Andrew Cooper wrote:
>>> On 30/08/2021 14:02, Jan Beulich wrote:
>>>> Further permit "access" to differ in the "executable" attribute. While
>>>> ideally only ROM regions would get mapped with X set, getting there is
>>>> quite a bit of work. Therefore, as a temporary measure, permit X to
>>>> vary. For Dom0 the more permissive of the types will be used, while fo=
r
>>>> DomU it'll be the more restrictive one.
>>> Split behaviour between dom0 and domU based on types alone cannot
>>> possibly be correct.
>> True, but what do you do.
>>
>>> DomU's need to execute ROMs too, and this looks like will malfunction i=
f
>>> a ROM ends up in the region that HVMLoader relocated RAM from.
>>>
>>> As this is a temporary bodge emergency bugfix, don't try to be clever -
>>> just take the latest access.
>> And how do we know that that's what is going to work?
>=20
> Because it's the pre-existing behaviour.

Valid point. But for the DomU case there simply has not been any
pre-existing behavior. Hence my desire to be restrictive initially
there.

>>  We should
>> strictly accumulate for Dom0. And what we do for DomU is moot for
>> the moment, until PCI passthrough becomes a thing for PVH. Hence
>> I've opted to be restrictive there - I'd rather see things break
>> (and getting adjusted) when this future work actually gets carried
>> out, than leave things permissive for no-one to notice that it's
>> too permissive, leading to an XSA.
>=20
> Restricting execute permissions is something unique to virt.=C2=A0 It doe=
sn't
> exist in a non-virtualised system, as I and D side reads are
> indistinguishable outside of the core.
>=20
> Furthermore, it is inexpressible on some systems/configurations.
>=20
> Introspection is the only technology which should be restricting execute
> permissions in the p2m, and only when it takes responsibility for
> dealing with the fallout.

IOW are you saying that the calls to set_identity_p2m_entry()
(pre-dating XSA-378) were wrong to use p2m_access_rw? Because that's
what's getting the way here.

Plus, as a side note, then we don't even have e.g. IOMMUF_executable.

Jan


