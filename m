Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869D64D7EC7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 10:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290074.491944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTh9U-000426-ER; Mon, 14 Mar 2022 09:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290074.491944; Mon, 14 Mar 2022 09:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTh9U-00040G-BD; Mon, 14 Mar 2022 09:38:08 +0000
Received: by outflank-mailman (input) for mailman id 290074;
 Mon, 14 Mar 2022 09:38:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTh9S-000408-Rb
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 09:38:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72c06cde-a37a-11ec-8eba-a37418f5ba1a;
 Mon, 14 Mar 2022 10:38:05 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-UoKF5rtrO3SODQ2nU1KiqQ-1; Mon, 14 Mar 2022 10:38:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DU2PR04MB8854.eurprd04.prod.outlook.com (2603:10a6:10:2e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 09:38:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 09:38:01 +0000
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
X-Inumbo-ID: 72c06cde-a37a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647250684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ylrmY1DQcoHjDrSmaGgq2k0zUW7qX6s7Qo6DgPJp7Sw=;
	b=aMm/rVMnSERTfzZBBh1QjQfiSfYAV4SjjBY8bq/OggpMEf7hK+sA2A866RrgQhwqngzBBO
	MDhGzJBDPVMyXZqsi3ptjSPE6Igk4uernweaxXnjSCzGSAk+H51WXe7AqFxcxyFb8X25n8
	eGjpRDnIYAaUZhmbABPbEM7Dk3He3P0=
X-MC-Unique: UoKF5rtrO3SODQ2nU1KiqQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzfHCCggBUOCGkZMOkrI5KC5qIwZAF4sPPzObvcv8qnchd1A9oQTc0TiIVziXem4zV11VjTfWQZUxG91189h7GhgIsiUVp1epGi7oU447sscni7WGtCTwYeyBrUSSk8Htxzj3hE1k0c45MxzYxPaOOJU/4ZPPRz6WoQfNkMGneD9lTaW0TEoEXk3UEmAYDyBsNBT4c8e1Z6+CXYOQLezlVgjmeRa7f9hRbuTknoLabRzslpOumaHciYdSytebw1+oNEW7+5B6Mq+OjaM4bxnWzTFXMWgeCpufBj3YrhMHOS8zcPo//2x70t4i3tlyejiJNQUeLPEY9siDauFZqkN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG69AyWawrszyq0Ct22IOp+yjoHIItGki86NOBH86TE=;
 b=OAygGi19ThS1SMXlm6JKZva/Z0BFMuAM0b9vfHGg9WYt8Kr4aLpa8jaNkOFFucj1dld2cowYHr5qBhou1uOz6mH+cA+mEwBpy5MM1REEIazAai4ZbV6i3vv268TGiCuQOVRGBjFhBI04ZTlEE5ZtRH+bhKMeb8kg3A0VbaYnLBdbLuPRoRuDSIEF3VfJjeYLczXENdygUgxJ2XpJG3Jxx5hh60QxG8SfMgnTSf74EdfuYeUCYMmg/FRA4K0IHyi3iJzaUsWZvkC7oUvNh0+70mdPgMwH/POavdkO6LzzcEkl8KpX8AOBKdnVecZU+gvuZYk5pyFnOotfHZhDPi20IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbe0e0f0-85dd-434b-aca5-fa513b720c0b@suse.com>
Date: Mon, 14 Mar 2022 10:38:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <97bebbfa-b5e8-4c57-162f-2a052de92f02@suse.com>
 <Yitd9RNJf1vvOsf4@Air-de-Roger>
 <517b0f83-ba5e-3aaf-9c06-9b7078b816ec@suse.com>
 <Yitlw1EN+egVJ4xD@Air-de-Roger>
 <bdd016c0-b02b-3128-7187-d781b6f88dea@suse.com>
 <Yi8FVxTu/r8cUVt3@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yi8FVxTu/r8cUVt3@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58fca123-2713-409c-eac1-08da059e54e6
X-MS-TrafficTypeDiagnostic: DU2PR04MB8854:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB88544B78BB714A5CE8FF8B4DB30F9@DU2PR04MB8854.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xS1/3UvbHfb1u6sIC6o7WoY/tKyvpW6VOmkPLqCcd4irPst73xicQwhG6n/ghwH342QQMvAGyG8nWCYAhwGiaEFAvn3PaV52weZhnnd46g4nHZizQ9yhleIMeCr42CaB07I39cYe7lTEWhJbN2h6a3SXkMxOpAfKVL/+5WqeSMXx9d0dJP2emRAlk+ehhUWLHhk1FMCFbS68IKWRJ+N7pELVxn17Iy4Bt80ZpoyGqd80+bsaLL/9whGlboPX0EwLDLLm7gfFyfAm+uWAVLEiH4adV3knaXrb6Mo2oguEBwi9QlrbDNeOcpxUPUrYleTQACa1nCJGbeC8m03TNqxh50lf4ucHPxBtgIHhfwiaawA5r2CNIQSw0cXl3kyKfvKiJiKUVlKGtNvPalRyQAPbywzG5L7zBsQH7XDvAPzzzn+F96LPOsAmSl7vhE2VG/oIvgOOiRgGCbA9RnllK8NBfh7TPwE8I5YwxfpSPA4ActqtSloeNjX96UdUCBo6VB76CXs+Nrw4XURNyROV1EZnZW9y7a1jojrRyYWwZcZdc2FjIB/C4YOVypWPYQmi9TDTyMWrqNudv55OeMAuWYthaWoaBYDRK9w4k8DbG8QMLGzTtclPQPiwE43M8wL1+vDm2teY0Gep6Q0VA2GLMismMUvu2mZoYBwdJC7QdDMfXZHaiYqxfITcpyVY78HH37jg6i4FACXXWlTKWkHTQnocs8VSPqcmFrLB96T3S8K5qXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(8676002)(4326008)(38100700002)(5660300002)(31696002)(86362001)(66476007)(66556008)(66946007)(6486002)(508600001)(6916009)(316002)(36756003)(53546011)(54906003)(83380400001)(26005)(186003)(2616005)(31686004)(6506007)(2906002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0IOrXR8MqL8rmCN0mCGRyKfQyoZZ5kGh5BXqTAvbFM9XuuC+t2s+fLQyzSW?=
 =?us-ascii?Q?aOo1NAlrHpeSVr4BsCQNEykM3hhekhehloTs+/wML4CUE9KMLCA7AzMjXbV/?=
 =?us-ascii?Q?KRADN0jpFvnkgIjZI3MtvTvd0nicqIYHGCQ6r3E9IEEwWlnOF/iqvtxQ9sz+?=
 =?us-ascii?Q?4cOCcgl17s9GduKDhVNWN2Bowp0TJlOd+hgxlfeGpaRpiudkhAYAfoGzOKOd?=
 =?us-ascii?Q?5i0SZO73W2Zm5VxtW0UIgorcFImN3knu+7vmdQKpSfzTt/AOhFIGELbtizaW?=
 =?us-ascii?Q?BijHr/Ga3XUCBqTaVNZDEX1niTawM32RpRJBJuVv/q++c2Oiomz+y+0bW9yY?=
 =?us-ascii?Q?mT2tFn+bJ3Tw1+JvjECJNT11wAD5fz5j1EsIYPHBOxfqh43KAkND8T8NU23k?=
 =?us-ascii?Q?T+N3bmL69pvKzqFYtm1gYu46XlQyTW2s/6w1QxEDomSfCUNzdi5iuzGNLBEC?=
 =?us-ascii?Q?j/KiZ53gAkvR7Txf85J9hcVznOZMTfYBja3br3y08MONU964RDm/kuDehGhe?=
 =?us-ascii?Q?SLXIzJ23SIetsANeKR2xLuRNmfElF9NAbKnya2pvs+lSzr6X9wYIg4bA1Smx?=
 =?us-ascii?Q?1jG6WSzzIEqkandwRpy3xkQiVLpZBACZ1yXj4lvCHE/FHDXM5gqR5XEQSROC?=
 =?us-ascii?Q?7q1jtb7aZVR2P8kF2+3NT9tTn9IWBMvX4k2RNwHndHa286WJmGOc2DQzZSUl?=
 =?us-ascii?Q?kjs2qmN3XpbQb5jGz6DGmbbmkgokedQeVmOiVwYU0q+mzALQ4bwRzaeKRiUz?=
 =?us-ascii?Q?zzvhxvcoFTg+Kg1D5m1nWDsBuzC17YxXP5MWAFPJ5DyKTNIDPUBZejyC9xlU?=
 =?us-ascii?Q?UCX3C38RYU6oM2yelf9p6x8ufritlzTKS18SHcNZVQ77aJoiw0Awj4CCk5ee?=
 =?us-ascii?Q?l3tjI8hJQvpuVem23xrD7nkmfVPwikQ5Pf9AX1PvuxXh/J0jRlTZkryxbe9p?=
 =?us-ascii?Q?g21K3PmRtvjS42zuuOvL+JBQMGJybdINIPTL+N1mTEtViiE2Z2HefsMJ3kcp?=
 =?us-ascii?Q?yjoyHXGXBRe0+HAn5OpE+SLAK8OSzhnToHQ9/YrdhPR2Olw/8wHwlTFamUOy?=
 =?us-ascii?Q?B1W3gr23kCWQ3IaKCo6ZSWM+rLd3z1NWhtQ1eIbUuX2eKokSq33M0HlfWHWY?=
 =?us-ascii?Q?a78p8Sw4QlMtqRu5vdoQ5L50dsMhpVyfcFCLkNDJmMOZizsehkntyCdBMzIg?=
 =?us-ascii?Q?dWLCdb4vNY2YR7/UVKOwQ0aSZVRfYsuRYUOJf1hahLhLZZiCIPP0fp3VPOnI?=
 =?us-ascii?Q?nGjeoK46oWajrgamfLsCZRN/ih8iiYX2hno+iRARprsdEKBX52fgtT7Dz6xh?=
 =?us-ascii?Q?Dlq+fTrzmRgt5/erT7Jiohatdb8Z3gKllecTITv/97hdrDFGKuGIdAxxmKog?=
 =?us-ascii?Q?sFQCywPAJZbAfreNioEf+fFBMmIk5lT01olbbtLD9ELm2IV+2PeX0/chUJYb?=
 =?us-ascii?Q?ZqCv83vR1RxpVUcN6yc1Wj2kOxF+Y4ZL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fca123-2713-409c-eac1-08da059e54e6
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 09:38:01.5925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lM8vXK69F1hwMuTj6Xk3sm9cppXsSuTTyYdlSVhcqAwuf3lSWVMXI3Yx7TVszS4DTDuLgezy8MY5mJ4toYNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8854

On 14.03.2022 10:05, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 14, 2022 at 08:38:52AM +0100, Jan Beulich wrote:
>> On 11.03.2022 16:07, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Mar 11, 2022 at 03:55:57PM +0100, Jan Beulich wrote:
>>>> On 11.03.2022 15:34, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Mar 11, 2022 at 02:28:40PM +0100, Jan Beulich wrote:
>>>>>> Support for this construct was added in 2.22 only. Avoid the need to
>>>>>> introduce logic to probe for linker script capabilities by (ab)using=
 the
>>>>>> probe for a command line option having appeared at about the same ti=
me.
>>>>>>
>>>>>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> v2: Always define HAVE_LD_SORT_BY_INIT_PRIORITY when using LLVM ld.
>>>>>>
>>>>>> --- a/xen/arch/x86/arch.mk
>>>>>> +++ b/xen/arch/x86/arch.mk
>>>>>> @@ -73,6 +73,16 @@ ifeq ($(CONFIG_UBSAN),y)
>>>>>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=3Dalignment)
>>>>>>  endif
>>>>>> =20
>>>>>> +ifeq ($(call success,$(LD) --version | head -n 1 | grep -q "GNU ld"=
),y)
>>>>>
>>>>> You are not going to like this, but I think this should live in
>>>>> xen/Kconfig together with CC_IS_{GCC,CLANG}, ie: LD_IS_GNU or similar=
.
>>>>>
>>>>> It's possible we will need this in the future in other places, so
>>>>> having it in Kconfig makes sense.
>>>>
>>>> Despite me not liking this (until, as said elsewhere, we've properly
>>>> settled on either approach) I did actually consider doing like you
>>>> suggest. But: I would have to introduce there more than I need here,
>>>> just for consistency's sake, and I wouldn't have a way to test the
>>>> LLD part of it (I did check - none of the distros where I chose to
>>>> install Clang offer the linker). I realize I could ask you to help
>>>> with the testing, but then the first point would remain. I'd prefer
>>>> if for this simple build fix it was okay to go the old fashioned
>>>> route ...
>>>
>>> I would be fine with you just introducing LD_IS_GNU. That's all we
>>> need so far. We can introduce LD_IS_LLVM if/when required. I prefer
>>> that asymmetry rather than doing the detection here.
>>
>> Yet I'm not happy to go this route. I'm only willing to do this
>> consistently, but that in turn not without us having formally sat down
>> and discussed the overall model to use. The only short term alternative
>> I see is to go back to SORT() unilaterally, hoping that for now
>> different priorities won't be encountered.
>=20
> Would you be fine if it was a patch of mine that introduces
> LD_IS_{GNU,LLVM} to xen/Kconfig (Acked by someone else) and then you
> use it here?
>=20
> I realize this is tricking you, but I would rather get this unblocked
> if possible.

Well, yes, if the construct had been there, I certainly would have used it
(somewhat hesitantly maybe).

Jan


