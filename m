Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A67C3A6660
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141396.261186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslXA-0001jg-DL; Mon, 14 Jun 2021 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141396.261186; Mon, 14 Jun 2021 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslXA-0001h1-9d; Mon, 14 Jun 2021 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 141396;
 Mon, 14 Jun 2021 12:17:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lslX8-0001gt-Ta
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:17:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63222186-4928-4643-a717-76b8af31db60;
 Mon, 14 Jun 2021 12:17:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-lLpuAWNhOImYw_o_AwnmmA-1;
 Mon, 14 Jun 2021 14:17:35 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 12:17:34 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 12:17:34 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 12:17:34 +0000
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
X-Inumbo-ID: 63222186-4928-4643-a717-76b8af31db60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623673056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X118asixY4udkMf49i5xGtdu346NNs10cwM67GSykGs=;
	b=RBXCPmIBOK53NtVwjf4n9kNR/jQl9axBRBAXOQOeLGW/U99OfLVu0IMEHH4s1HKB8Zfa3w
	nFhrU62ILm5GSyc1YOV4imXEh2ek9/ME1q9f85tzygj3RkXzppINACJrYVhJBplHyYCWiH
	ThcdZdTahPeNXQcfm2g11+r1tnJVVG8=
X-MC-Unique: lLpuAWNhOImYw_o_AwnmmA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Me0lQkft+IPM+pbg+BG7dkyMrWHdao8AzQ/B2bJsBJkNKfIq63ahpwCGuiTRp/E2f1lWideWr7KOsUH2D46YwX0r4kVv10m/BHK8baRVOcUZMPnX24w3c7g2cP2ALOPnc/W3q2qi6v+zMBQeByrJ6jcTpTeMBOwfrhLvbX/6aqKf7OJUeFa4Fe5mnj/5V8FmzAWM9aBjgD+m1oZLjSiiP36rWk02KZqA1XhLDjuAHhLB6BM0/9b018Nx4myGkd62RHjXgWaOiFLjhKOyAraf4q7WLlFCFfEePjh8R49Pg/IbvH5l7YaIwHNZTRhb3yZ+RhWZyaCfKDkbJZqEd6cKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X118asixY4udkMf49i5xGtdu346NNs10cwM67GSykGs=;
 b=YJ4das0GbZMo0wudUpXdy6+aJ741I1Z+y5f9QgngZa2a+cwjcfRBLF869LIJNZYu2c1oEJKozBdPtpKO9qHhCJVIBh8fzriPVa7nuoY83pJ5Dm75eD3EQPcnIIOKCiHdlV1Bh7ngU4E+R1Y/NrNCio5QiIv1yslDQTAtPDG78utz82zX9AVbzbqylDzRzFTIrMjIR720deMhgeVQNj9c5wfxva/jKleWM9uh7LSlmFNq5OMrR27Uf7Kns13Fe6ndjEvESiCks6fL31BvMUWX1xyqLJrIJt6b3/tWD9dsSet22mO8u+Vh7z/h0n17UwXPX86ysZnpQgmyNNborK1ZaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] Arm: avoid .init.data to be marked as executable
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6837f903-14f6-4438-ed05-b373149984f3@suse.com>
 <b7e76787-cdae-ed1a-a741-e5db146fc87e@xen.org>
 <8c5ec03f-5ea1-99f8-a521-3552d0015ac4@suse.com>
 <1b44cb6d-dda6-5297-893b-a53fe7d123d9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <919ddc45-c6a4-20b3-e1ab-7a16fe1c48d2@suse.com>
Date: Mon, 14 Jun 2021 14:17:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1b44cb6d-dda6-5297-893b-a53fe7d123d9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5fd49f6-a77a-4ff7-e508-08d92f2e6414
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57435F746127F05D64107ACCB3319@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mdVQqNeAQm20Bl+elvc28wXAm/WPkmr0glt553qMg7IbEXYsVy35vOWcorL4gdrfpMYTHwMByNNpgBtMPuX7l41onAtcOG+C0TixCOd+84RijP8KL5KREo4nSN7OIzG3wER/3bFG8Cy5X0w+B3m2nXw1YTjJKLWHeZanIYXHPTIBSnLZ7TPxBpuBgHVAk1w5dnNx0O7LiGnEcpfEnSFAXKAvQScs36hq5lAklu9rpHtJrrkO7MFP0VmGAy3BMzbNv5MrblFfgygbgVfXlcvaHSwI1Kx21vSIWS6G0dFj5dnivESgYKC4KEEhdxzwBBL0DRDABCbCzh4xbPpIAsenKmmE69VUUPn7k1bbif63qRmcNn3BgqkMNLuzTbFVQalEuUyOxE0UE7Db/OMaLbBdr36RNXJBy8ra3+INDQ5d5hJLRKCUHGn6m8NhF6cKm1GdXR8220po2mZXZUkiz/JyaPRXjLFmaqNykp7xqZBmSwCvtp9EB2C1vdvfkLk41L4ZudUainnOh6QAQXNLWW/oKZjb0KrQs6nkArkVYAjQolrDpIYo7GdOHilxl09PQl2pZtrVQ1AZTJ1y8PkxFtDuAYIDJLtIosTsZzFvAFjRCbytUNSS48gBJaTwhlDFiSN9H0shYoM5FOg/XmjIYtfS0Vy9L0poCIKZvdJcpvPNBYcjPNM5PN6g7STNpBBQKLMxmLN4BhJAB9BDeKQaoszhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(376002)(346002)(366004)(38100700002)(4326008)(2906002)(66556008)(186003)(8676002)(16526019)(26005)(66476007)(31686004)(8936002)(6486002)(86362001)(54906003)(956004)(83380400001)(478600001)(36756003)(66946007)(31696002)(5660300002)(53546011)(2616005)(6916009)(316002)(16576012)(142923001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJ6V2lEQWhiRGtkVXpyVXhtL0swZmw4VlJEanJiS3JhN3ArNXBYUHJDWkpn?=
 =?utf-8?B?OU5TbzFUYW9xemlMaTFSVVdDUEN6dFZxTHAwS2xmL0VsTVdYQkRSRWlHU0N0?=
 =?utf-8?B?S2tXbU1sbFVoWTArRlo2c0hmbWxPMGZFUTVRNk1EdWlhaGJzZis3clE5VitK?=
 =?utf-8?B?ajY5aG1XSEgwS2d6TmV6NHVUZXFCamp3MkZzUjVkNEt0YlVwL1ZKWE9adkVi?=
 =?utf-8?B?em1uY2JBSlFIRGlRd1crSGxwdXNnSDJnanVwTXBxNDZjWUQ1WGxnZlk2Z08y?=
 =?utf-8?B?YzVheDNJZWtiNWJ2TTByb3NQNzZ4ZnV2YnhNaGJBMmlvdmFPUGR3VmQrSldI?=
 =?utf-8?B?ZElCNUlzaVZzVTRmNFI5TTdiZnNaTmNHSGhia3lYajU1NmN3bFBCZytBc2pN?=
 =?utf-8?B?TlhWT1BjRGFrM1dGMnphNHJYQ25yMjJta0dxQ3NQUnB6QUZQaksrUmlBNmpu?=
 =?utf-8?B?L2RuM0JzL2gzQmViZmZXMEp6RlZsK1hDL25GZm5tWUJPck0wUnFrQXBKQzVs?=
 =?utf-8?B?K29iKzdZOW03QkFuVUxGYkVyMTMyckkvMDh6YVBHT2FRejRoWklzb1NaUzM4?=
 =?utf-8?B?VktNbEdFNGhDNEtWMmxiMnYwNDVwWGI4WTk2V0ljRjczVUlWc2hMTjBSc2Ur?=
 =?utf-8?B?dGQ2TVVNbXhybTVGNi80bHNVK0NJblBzM0dpV2hxV3Q5Mm5MWElHczhDYnk4?=
 =?utf-8?B?SnUzSmRtc1orbStHcmFpV1ljTjBnSTlsNnBpcnNIMEt6a1N2VXBGUVBQWUc4?=
 =?utf-8?B?ZnEyZE0yZCt4Q1NSUW1WRkFydDgxUE1BNGxmVlZyVTJrQUhTOWgwUkFzejZ0?=
 =?utf-8?B?VUp1dENmdlV3RkJYM3VxNy8yUDlsakVuWllzQmt6TDlWci9VbG5hMlAvTWV0?=
 =?utf-8?B?cmN3Rm1HUGlCZXI2L1F1MFhpOC9MWTl2UTkxVnY2U3RwcU5GMitkdUdqNDhn?=
 =?utf-8?B?Mjh4QmgvenNUZnpQRzhkN1U1RnJjcVhtMVJlaDFzVS9hWHBsdkk5S2hhTUIx?=
 =?utf-8?B?TWR2WXZJeFU3TzJORy81TEN4bkZMQVVJYUdDLys0K1dqTDd0dXFQaFNqMjlB?=
 =?utf-8?B?YzZNQkt4NFM5MG5vN3V0Ui9ERVowMFB0c1ArVllDUmpqSFNWVTRaVVdUN2dZ?=
 =?utf-8?B?OUdEZ21WZGh5dWtweTRBZUlwOERvZHc4dWJGR3JCSDE4NTcvekpjaXVLdHV6?=
 =?utf-8?B?NmowMHRUdUZqOFl6UVYrMnEwWkxlVitVSXhidHI5eXpaN3R1eVF4V2IxTHpB?=
 =?utf-8?B?cXI2N3lwV3VDZzFWMmtmTitTTWxUNVdkcWdpQnpUSFJpaVJCd3VNVkVsNVBn?=
 =?utf-8?B?WnFJVmdsQWozZERCSjZiVjhoWkt6NG9Xd3RRN3Zyam44M3VMUkRUZ0dKY1Ev?=
 =?utf-8?B?ZEdyQ3BERlp2czJ1eUcxNW9xdlVTT0lSSjBpL3psZnJkMmhIMTAyRFpXb1ZO?=
 =?utf-8?B?TzBScGlmU3IrU0VMNlk1ek9JME9PUUpVV2R0aG1EeDhlNzFULzhzTmV4MHdJ?=
 =?utf-8?B?TjdiYVZuVUtNWmVKSHoxellZMGU2QWJXS3RaTHBtaWllVTZWaWQyTjJpOGNQ?=
 =?utf-8?B?VFpsRE9wVXBDaXUyb09OM1gwdFlPQnhPWXhJTnpwNXo0NXduZml2Nm5NSHhC?=
 =?utf-8?B?dGxUVXR6ci8zK2wrQk5rK0xkU0FTcVcvbzVpNWRuOHd5b1BsejI4aXYxL0RZ?=
 =?utf-8?B?bmJzSlJSK0xNNTFiM2NyN25DY2VhS2tWM3ptMHpFNTZaT0w1ZFQ3c2NQZkZo?=
 =?utf-8?Q?bBdRLcc+5gHt/oM8uTOTg3DGFkRiDtRzjyazWQk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fd49f6-a77a-4ff7-e508-08d92f2e6414
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 12:17:34.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwdHKl1m6iHyIEI00xXZHVgmCp552mG87QNFsIEQlaazKadzZE+KLEDxfhox4dximJqzo2vuYqq3sfy89F0HTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 14.06.2021 12:32, Julien Grall wrote:
> 
> 
> On 14/06/2021 12:02, Jan Beulich wrote:
>> On 14.06.2021 11:41, Julien Grall wrote:
>>> On 11/06/2021 11:39, Jan Beulich wrote:
>>>> This confuses disassemblers, at the very least. Move
>>>> .altinstr_replacement to .init.text,
>>>
>>> The alternative code was borrowed from Linux. The code has now changed
>>> to cater very large kernel. They used to keep the .altinstr_replacement
>>> and altinstructions close to each other (albeit they were both in
>>> .init.text).
>>>
>>> I am not entirely why, but I am a bit worry to separate them. What sort
>>> of test did you do?
>>
>> Well, just build tests, on the assumption that relocation overflows
>> would be reported by the linker if the sections ended up too far
>> apart.
> 
> Hmmm, fair point. They should also not be further than the original 
> instruction. So there ought to be fine.
> 
>>
>>>> dropping the redundant ALIGN().
>>>>
>>>> Also, to have .altinstr_replacement have consistent attributes in the
>>>> object files, add "x" to the one instance where it was missing. >
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> I'm uncertain whether having .altinstr_replacement inside or outside the
>>>> [_sinittext,_einittext) region is better; I simply followed what we have
>>>> on the x86 side right now.
>>>
>>> This means the altinstructions will be marked executable in the
>>> page-table. They technically should not be executable, so I would move
>>> them outside _einittext and make sure the section is aligned to a PAGE_SIZE.
>>
>> Hmm, are you saying you bother getting attributes right for .init.*
>> in the page tables? I ask because we don't on x86, and because it
>> would seem wasteful to me to pad to PAGE_SIZE just for this. But
>> you're the maintainer, i.e. I'm merely double checking ...
> 
> So this is a defense in depth. Your assumption is .init.text is going to 
> disappear after boot. However, if there is a bug that would leave 
> .init.text present then this may add more attack surface. So I think it 
> is a good practice to keep the permission correct.
> 
> However... looking the alternative code again, there is another reason 
> to move this change out of the range _sinitext - _einittext. The 
> function branch_insn_requires_update() will forbid branch target in 
> another alternative instructions.
> 
> This is first checking that the target is part of an active text. With 
> this change, this will return true because alternative instruction 
> replacement will be between _sinittext and _einittext.
> 
> So .altinstructions_replacement must outside of the region [_stinittext, 
> _einittext[.

I see. But I'm not sure about the defense-in-depth aspect: By putting
it outside [_sinittext,_einittext) it'll get mapped r/w, while I think
you were implying that it would become r/o. Not even .init.rodata gets
mapped r/o.

As a result I'm not convinced yet that you really want me to make the
change. Otoh your arguments will make me put together an x86-side
change moving this section past _einittext.

Jan


