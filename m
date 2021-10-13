Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638EB42B70B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 08:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207910.363866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXi6-0003uw-MO; Wed, 13 Oct 2021 06:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207910.363866; Wed, 13 Oct 2021 06:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maXi6-0003sw-J0; Wed, 13 Oct 2021 06:25:54 +0000
Received: by outflank-mailman (input) for mailman id 207910;
 Wed, 13 Oct 2021 06:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maXi5-0003sq-BE
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 06:25:53 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02431695-1bae-4eb2-9eae-32b61bdafbae;
 Wed, 13 Oct 2021 06:25:52 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-7rD2pkzxMTOHLAe0BsMDcw-1;
 Wed, 13 Oct 2021 08:25:50 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 06:25:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Wed, 13 Oct 2021
 06:25:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0109.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.26 via Frontend Transport; Wed, 13 Oct 2021 06:25:46 +0000
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
X-Inumbo-ID: 02431695-1bae-4eb2-9eae-32b61bdafbae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634106351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+3POFdvLpomAMBnS1eMcdROs83NeAIJ4igxp/T0uAI=;
	b=YChTGmTD6KAb4tJj1yOw8ds+19QmtI1agOpSpV75tThKzSVtUOrJSEM663iuXv3j47zr+Z
	kFYpwRn6v0MEvsQQDkd7twqqdey1yMkmx95yRgZFrJaU11rJz/8jaNFd1NXgcEJzn0CVW8
	z5B+DQa54eTJtm/cslH2WUcrjXSeL2w=
X-MC-Unique: 7rD2pkzxMTOHLAe0BsMDcw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6217I+/QyWdOI70kZGwiUo13I9omTOkXEoGeJKZZrVsNNnZUcHsmQxP1+OVl0UjMLHHHfho2d9jtCa7AKwSetDEwjdNkqn7scOp9yOPLAVFCJAekcGQZ+dlRmUuHNssbySZhXjE9PSgrAzm909Z0dp+dMKr0j3sL5JKC2cZF5XWBzgmuiE06GT43cJNFJ1lPuI1MamMUplrOWmuN/qX8y9bOj9zTRuSfsPjeXzH9kf/DpT2KrbbiRyBJl7B/JpJjvFTXDNXzcoVB0IpMLy/7xuYD6N0fBT8QHG8gfxsAHAHTaVrzGfsprhNpto6X8/msCNfgWGuFXp+wUHbaMG+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFTbnsRyJEJZmCKxS7q1WoWNblkm/H5Qc3AIUBrn/NA=;
 b=iBijJkh/Jr2CAU/cxGWKbo3gyPgjR38ZlCYI47gojnlWv191Xg1TclZvB0Bdo8o1HKmLVIuzERTQqRHYsHOeXYx/9QjEh69y8WSXJsc5ZN4aYm7Ml+1q+4q8DSBro2X6IbRYG8pI5OkjxduGWZF4j8YOYFcn1zh1SH3qV5d791VPJUW/roSPfuR6YO4SCb2jv8wKNHwlje6YMzYrhy3rPPMYgckA7pxtq2fOuY3Lh3U7/C60iQaP9Xrn8NdPO7t4kbDdclKPJUqYMyewlMp3vgKn0bEfODbBzJ0SyUNqD8dpCkm+bS9I1PaGMbxEbvb+bMCW5UGJncO5GDTPlb88Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
CC: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
 <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com>
 <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110111423310.25528@sstabellini-ThinkPad-T480s>
 <29cc47f2-4727-0397-db0c-a6c1f5a52bf7@xen.org>
 <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s>
 <81EA782B-762E-4B8A-8D33-EC79203439BC@arm.com>
 <alpine.DEB.2.21.2110121309560.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <696b9cef-9f9a-6285-bcd8-372e505fbb15@suse.com>
Date: Wed, 13 Oct 2021 08:25:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110121309560.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P193CA0109.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b583e36c-98d0-4d14-00a8-08d98e124b5d
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438416E31D2D649447F3B23FB3B79@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJBXRSe7zGEcvW1rQZF6augzKvUcqU40MQDBJi6sfr1unkIikvvfWSy4n5jT2yFfq9h318SFREfnqeLF3UnF6ophI+PlRJWYo5B3WAaIM5gouuNsUXwH6lZoPxttk/feZrh2as34ZOQ/YkPuwe9nypCj16v/g7d3pTvplOhZ3rwRJ6qG+xt2+2pmiE0E3UNQCy2QkyKh+bQ4v9eRpwDSXD1azc9OXM8sUifEe5VrOwDCcpH/1b/Esi1mfkgCQYMX4IvPIAwY9z2vfMlpxvM2vKtDBnn6wIaX8YRsKBuIgp5aVrpSuD2J2HMmgP6AzVvd3o6yfs/rsO+HYbFZcoEkqE6qA8nVym0GYdlNi56PeyO/Y2GbmLvxCetyK+4qi7xoeCaJMCl0UIq56Qx53eMTlP8C/pKuwXYGVZaXu8sIoAX2+B+kBmjGhOUGL0XPOVxFhU/Senu+6SeH1g/Mns647GSDKh1S9N9RbtnYwkla7zyMLtZctChpRZsCYnGeSqsqhJdnRVJ280hYs4kfszujMiPq7P+pAD+DG9blIsqyb6QyJJLe40HRGjLsryPl1DRce2nICsepRBpLM+zFfbDDkJEyNRtGC/RuCz1zSkBnKtgSFvteCglwS25QTURPbniGWE+44/ZkNHTdM+iKRln2ojiwbH5JExsZbEiEW+QvdbVWq+fIZ8wgHU6oCe6HpaI+1TQb9e/andkdSDw4W1Jzbu9herKoHdBJwmm/YUEDpnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(8936002)(31696002)(4326008)(16576012)(8676002)(54906003)(316002)(110136005)(5660300002)(6486002)(2616005)(83380400001)(956004)(186003)(2906002)(26005)(53546011)(508600001)(66476007)(66556008)(7416002)(38100700002)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rcl/2MprdY9evAOcF9KkKDTrgjWFbBVGnJewDBQTCoYW1mXHXg6nvhEDnJzR?=
 =?us-ascii?Q?HHhgavO8+7KiZEuHRCjc83Uem9perp2wPz8IM/e45FZ5xLY6ZIJo5V4C5mqX?=
 =?us-ascii?Q?yipOPIM7/1ucOnYZQv0wrP8svI0S1YbFWdOrNt7HieV+xHLv1S5BJ237OdlE?=
 =?us-ascii?Q?vzikZ+iMcwQjuQVvMez9fgv45AYkDN3oPhr7VxFzkXhZ8dkeqfdEkmKSMGNA?=
 =?us-ascii?Q?5VnMid7O6CxreXESI+/HyXdqHQvPHCrIC1wTR1C+WDllok07jqnJFIsYepfY?=
 =?us-ascii?Q?g7uQbtquHT9PlaPeD9TIV2JdvdQx9PO/f38NAk5rmG4fScolVBIO9ic4SxDy?=
 =?us-ascii?Q?YGfxyCbvpOiW/xXW4gMSacSl0v3x7pPBd/WXptNeJmraEUFxR245VBkzsxOZ?=
 =?us-ascii?Q?nArWDbXyW1USDp2m9d7Gp/ZEeSum/rX4408za1M5YpKCuT+whAW2vD3gm1+e?=
 =?us-ascii?Q?ZIBpvyNQv9U0mMZK+cNAwM8Y5N0Zz0HIECHPSNDVkVVRTQteSZS8hppIKKHs?=
 =?us-ascii?Q?c74LKzTm7yPW9vne0/jnVKvoWTYr6C5yoJ0chcT9+zRZDEFT0vBXFUmTHu69?=
 =?us-ascii?Q?tQp5KuHCnJtvHYQbUnFLRxDKoA8QApXDGC7jMDCVUrx5k9ZBQgnPIwA/F4qo?=
 =?us-ascii?Q?N127CIT9a2PlCzriwWtopcFj4zLRwYA+AY+IHITOPBLVo/FbsNqRNEjkutlz?=
 =?us-ascii?Q?RePtDKCEpxSK3wXUivN619aTiBvvxyrMdBX2V5M2uIJ0mVpYkufjT93/ExSj?=
 =?us-ascii?Q?Mr0NXPcKPtLuKtd1hfGIE9o7G25sfdcHP3TeDK8IdpOpYrVEd4W8NAf7/GI3?=
 =?us-ascii?Q?mcJVEYN8RSCDgGV7KRMZmHRg8RNa/qYomIiOYn17EylFG/wK/pIDK2JgHXpK?=
 =?us-ascii?Q?1r+Q1jEbGT+Yq/Ttd+LcDjeOLo6Q5vSAc7qNlbZamR7jBpzMVCXZpSdgGtkj?=
 =?us-ascii?Q?YZ89iiK69jI0D3OssvSYmIQyS3h6VUimfLTxMLfDhWJzZk0ZXFJ90xkBkgBr?=
 =?us-ascii?Q?QN35xeYKPuTjXQqakLXbkYcEz6WwpolQJuThp8G801KaOhNGxZGW19rXT7Y/?=
 =?us-ascii?Q?8Oe1NfGvIhcGkPWKW+WvyPrw6uLOycsii0pBeXNp9YJaUK9/S9V9U15TdkRc?=
 =?us-ascii?Q?JXCopvOReMTyXwXC17jHoq1+nIaamNFJiXPjpANNMrTi7iHYsFJr0xMjC4Hz?=
 =?us-ascii?Q?mQN25OHuEqAlWF6DfVvtwa3OYdhxeKaPTq4clnKuER4LYAlD4YZkGuDduwS+?=
 =?us-ascii?Q?IKrKm/mczW9bcqO9NyeIT/PCQkvQtibNxJUSQnHmj4m1tKDE+Xvd03qVWJqi?=
 =?us-ascii?Q?ixa/aVcS1+k0A9RN2XPEqf54?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b583e36c-98d0-4d14-00a8-08d98e124b5d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 06:25:47.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU9TlOnMHPYIRLWTn44TGjex+K2zCpVGgy/q24ohDr3nbjj/Zfe3LCkhw0G02T/EkTpjgPHqh0FOa5/uIqKfpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 13.10.2021 02:49, Stefano Stabellini wrote:
> On Tue, 12 Oct 2021, Luca Fancellu wrote:
>>> On 12 Oct 2021, at 02:31, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>
>>> On Mon, 11 Oct 2021, Julien Grall wrote:
>>>> Hi Stefano,
>>>>
>>>> On 11/10/2021 22:24, Stefano Stabellini wrote:
>>>>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot=
.h
>>>>>> index 840728d6c0..076b827bdd 100644
>>>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>>>> @@ -713,10 +713,12 @@ static int __init handle_module_node(EFI_FILE_=
HANDLE
>>>>>> dir_handle,
>>>>>>      char mod_string[24]; /* Placeholder for module@ + a 64-bit numb=
er +
>>>>>> \0 */
>>>>>>      int uefi_name_len, file_idx, module_compat;
>>>>>>      module_name *file;
>>>>>> +    const char *compat_string =3D is_domu_module ? "multiboot,modul=
e" :
>>>>>> +                                "xen,multiboot-module";
>>>>>>        /* Check if the node is a multiboot,module otherwise return *=
/
>>>>>>      module_compat =3D fdt_node_check_compatible(fdt, module_node_of=
fset,
>>>>>> -                                              "multiboot,module");
>>>>>> +                                              compat_string);
>>>>>>      if ( module_compat < 0 )
>>>>>>          /* Error while checking the compatible string */
>>>>>>          return ERROR_CHECK_MODULE_COMPAT;
>>>>>
>>>>>
>>>>> Well... not exactly like this because this would stop a normal
>>>>> "multiboot,module" dom0 kernel from being recognized.
>>>>>
>>>>> So we need for domU: only "multiboot,module"
>>>>> For Dom0, either "multiboot,module" or "xen,multiboot-module"
>>>>
>>>> Looking at the history, xen,multiboot-module has been considered as a =
legacy
>>>> binding since before UEFI was introduced. In fact, without this series=
, I
>>>> believe, there is limited reasons for the compatible to be present in =
the DT
>>>> as you would either use grub (which use the new compatible) or xen.cfg=
 (the
>>>> stub will create the node).
>>>>
>>>> So I would argue that this compatible should not be used in combinatio=
n with
>>>> UEFI and therefore we should not handle it. This would make the code s=
impler
>>>> :).
>>>
>>
>> Hi Stefano,
>>
>>> What you suggested is a viable option, however ImageBuilder is still
>>> using the "xen,multiboot-module" format somehow today (no idea why) and
>>> we have the following written in docs/misc/arm/device-tree/booting.txt:
>>>
>>> 	Xen 4.4 supported a different set of legacy compatible strings
>>> 	which remain supported such that systems supporting both 4.4
>>> 	and later can use a single DTB.
>>>
>>> 	- "xen,multiboot-module" equivalent to "multiboot,module"
>>> 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
>>> 	- "xen,linux-initrd"     equivalent to "multiboot,ramdisk"
>>>
>>> 	For compatibility with Xen 4.4 the more specific "xen,linux-*"
>>> 	names are non-optional and must be included.
>>>
>>> My preference is to avoid breaking compatibility (even with UEFI
>>> booting). The way I suggested above is one way to do it.
>>>
>>> But I don't feel strongly about this at all, I am fine with ignoring
>>> "xen,multiboot-module" in the EFI stub. I can get ImageBuilder fixed
>>> very quickly (I should do that in any case). If we are going to ignore
>>> "xen,multiboot-module" then we probably want to update the text in
>>> docs/misc/arm/device-tree/booting.txt also.
>>
>> The changes to support legacy compatible strings can be done but it will=
 result in
>> complex code, I would go for Julien suggestion to just drop it for UEFI.
>>
>> I can add a note on docs/misc/arm/device-tree/booting.txt saying that fo=
r UEFI boot
>> the legacy strings are not supported.
>>
>> Something like:
>>
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -51,6 +51,8 @@ Each node contains the following properties:
>>         Xen 4.4 supported a different set of legacy compatible strings
>>         which remain supported such that systems supporting both 4.4
>>         and later can use a single DTB.
>> +       However when booting Xen using UEFI and Device Tree, the legacy =
compatible
>> +       strings are not supported.
>> =20
>>         - "xen,multiboot-module" equivalent to "multiboot,module"
>>         - "xen,linux-zimage"     equivalent to "multiboot,kernel=E2=80=
=9D
>>
>>
>> What do you think about that?
>=20
> Also reading Julien's reply, I am fine with a doc-only change in a
> separate patch.
>=20
> Yes, something along those lines is OK.
>=20
> So for this patch:
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Then applicable parts
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


