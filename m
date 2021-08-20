Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB03F2DEC
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 16:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169550.309727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5O9-0004uC-NZ; Fri, 20 Aug 2021 14:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169550.309727; Fri, 20 Aug 2021 14:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5O9-0004sF-KM; Fri, 20 Aug 2021 14:20:53 +0000
Received: by outflank-mailman (input) for mailman id 169550;
 Fri, 20 Aug 2021 14:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH5O7-0004s9-S5
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 14:20:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d16f699a-01c1-11ec-a6ce-12813bfff9fa;
 Fri, 20 Aug 2021 14:20:50 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-CX94dqp5MuGBkQvDmqTZxg-1; Fri, 20 Aug 2021 16:20:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 14:20:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 14:20:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0008.eurprd09.prod.outlook.com (2603:10a6:101:16::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 14:20:44 +0000
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
X-Inumbo-ID: d16f699a-01c1-11ec-a6ce-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629469249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yPm7/Len7OmkUoBDZ3hNIUNXpsl/z1Jj7QjqfZmQAQg=;
	b=FyZtmCqZEyf9TDZmfdrMvTFJCrjoIYJSaHA2j7jmdTrDjqc/PBntNBRn8r1QKtb4Cpvb0z
	aldcUE+kNT6zegapAAOBh9ceTyYCrjK8JbG0f29IwuAfJNbRJ7jxEDswqUxU2I/y8G/iVW
	eQChbOW8bjLXqsnaM6+fUAP9JCCwIpI=
X-MC-Unique: CX94dqp5MuGBkQvDmqTZxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/NDS8T5yiKNY4jm6Gdh0uul2N9K/7XiPGQmekecLqxtfRP155CduaEV6nTevKg/LGKzAempVIKTIYnxoKhQEzNSvEkpFHY2C4Dx4aFBDf6nIoFQx3tum+TjPCjOh+c7Pu2S/O7AD9srIgKD51FYPxVDWzK1XnwQncbGo+RN2q8n8g0fruCKWIX5N/5mZnxcUEzB+XXlszWtgHVHXPxEha/8EdzsZQ4M1sGJp9qklZueBxgkl7E/wP14Y1ZMBFsINFVoFmceByzLB9qsSLv7wsD8PDg73YetJ+an3cAiqj6QDkgya+xhzxefeycsmbdkEZnSaKoZh+LRnubnBBCdLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+I5z8RrYDFC9c3oNs+W6CU3Go73LPWPMWe6Fwpk+H8=;
 b=bBkwSjP5WAVVHefu3l3tl4j01yshvNsTUm+OBYdjwFCSs41GcKD+1eryQf1ZlYIxw2AT4/d5RVho2/fiKk+uE7liutYT8sHhHQylV08IBUMUU1PRDpj2WkU0ZooOcl0Kfs7ULDXjs/dU+/50zJ6x3qbDu3Kk4voXNUf1TDePIJVPmdr1C7dmeKyAnpE7mugIjZfRO6J0Ci2yyw51vcz12A+0ImTxPFpz+iEG/0mcezCHQelP781k0AmS7ezvf4HiO3kheB3gObhCgu/MHyzXSMrRxcZO5eBPZfPeF3yB3wABqybo3mLeG5QwrxfSM28Y5l18Ry63fP99bFnjRi7GkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] ns16550: Properly gate Exar PCIe UART cards support
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, sstabellini@kernel.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20210820115422.2185145-1-andr2000@gmail.com>
 <af460288-0fac-b894-f727-65010ca64088@suse.com>
 <016307c3-4a69-dc39-4a3b-490544b205a6@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6b98f23-8c31-ed9f-ff65-3bbafb76d816@suse.com>
Date: Fri, 20 Aug 2021 16:20:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <016307c3-4a69-dc39-4a3b-490544b205a6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR2PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:101:16::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d778a20-18a0-431f-a821-08d963e5b2fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71515EF04DBB9A5FF146ADB4B3C19@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5eBRs/HhXPCx16IYI2ChmORCj4juXNKRUx7xsD5qQqmyU+1ua1k/0yNKbklMWiSq7/3FmlP6MFyZfTFDSSv4s7Cabr+ibyn9HsGrGVw6ulMfdLXPeAhsizL7Px/CSL9yP7FQ3vle07rp1UfP3HVlObOS+HXtssaEU+BKKK5YUrroEJrsmIKPcpnh3xNuQ4sCuJ3sa7UIReWYwlkfin3p5+M2qgVx8MuCBq5DxWXOxqXA9dvoFpgcTvAzju/XBvg5HMlTL2cmFn4XQMtcWYJbLvghFIUg3TwqwQ3UmWqlqXnMNP8+RAFT+2UMUNzou1+IQSjj3O5L6nniVMPFdngfJdVLij83WV3LRf/FiWnIGbzNgwc/+Z/t4ELMFHhnljmZijauhVfUcQQDHbmNW39AGl9l7lneXHczwG89x77CmwSbGV8A3YO47tfyWwd7gKoE2DFnD0rVHMm1fqO4gMRjipJmOA7whQJfS/8omSC1pSG0S/ZoWULK7N8DPnP5VAwRN9wX3JHCVnLLcHEpCaIWBiLTsebmI+u2HnbV1ZG9R5gb/o/RLAvflmKbzEGT5sxF58WdVUTz3mzJgmDvZBHCXk7AeiOXS9+MWxkfC67yTOTkFczd6MqHqUXL/7U8SjkLXCbwpPO+JAAn3Ht3eSSjFikPbeMtTGnQrxmNV2ae+8k1Fb1BhQwr7cjsvCbsy8bkszc9bnCfFLE9unta0rcARBK7zpp0pzy6zIycfHaKIuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(376002)(39860400002)(136003)(36756003)(31696002)(66946007)(83380400001)(26005)(86362001)(31686004)(38100700002)(16576012)(2906002)(6916009)(5660300002)(316002)(956004)(478600001)(8936002)(2616005)(4326008)(53546011)(186003)(6486002)(66556008)(66476007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+He7e8PWTYKglY2icGC0pY2fyprfAhczyCSxbQ3R2bHkMmOHfo5tse0lAbHH?=
 =?us-ascii?Q?2jjoQJLx3SHyv0FrS+xVILsA7zWHBZTMeLVm4HJRkEXwHMkWzf7yhvU33HQL?=
 =?us-ascii?Q?V53PLLRilT9OGnOe9gbaiH2Jk8YbILhNlO8rISs+eQHYvya9mQOuj61it9Xm?=
 =?us-ascii?Q?4GGowHJo4qM3KE0GzKGXVKHmbaiEzgL86PYfjm62JH/BVn6PU7QIzs25kbak?=
 =?us-ascii?Q?M7uB2LA4zFclISn1NhUzpD4TeTbNwTBzLkGpHZhstWUnd7Xs0iQiDnaUWcDH?=
 =?us-ascii?Q?dDqe72e49hF88i+pPbDWLPiO2AeXJx5lwydeXCVUvb+SphqCflrg57NlpBqw?=
 =?us-ascii?Q?t3EMeV2fcJjWK2Ez4oO33Cz/8QyIrrpw5ygkg4uLoao62pZuV949WRPgj2r9?=
 =?us-ascii?Q?G6dBT+Yr2J43NbJMmNXcrsr8yt0KB4uwpN2eUBpghdR0fjIwZ0+4lC1/qZ+T?=
 =?us-ascii?Q?ByxYzBsUViXSNHw3mQ8pVu1X+Yi7xO6b+LLgW7/V/z0UZI4ccGvqj4d5dhIo?=
 =?us-ascii?Q?Z3rwxjccYEX974F20Th1gJ4p8SXS7nXPxDOeS2kypHzKh4i4sOrJktq/AxWW?=
 =?us-ascii?Q?puisv1M0AasgWjSyieLJseWNI44X//tMyjHNRswhFtVncSdOYWGckqTOmo7D?=
 =?us-ascii?Q?TSDEGrfunebRTD74W3Nr6DJC0zTH2Sxh21+SMQs8Hk59EG9X+c8atow3djmC?=
 =?us-ascii?Q?ph9+SQgTX7f6MWYfCTiJKJedVs4XhjQFRoDxiqX1Ynh+OEVg/ee4uEyyrP4R?=
 =?us-ascii?Q?VVnHq+rH3JVtOevz2pyS2NLBtqSHoF98sjq/PKXZVnX5+t5OkRI1/W675n0f?=
 =?us-ascii?Q?Q/ng9strKelASN7sRYHKLV//ejyqa8EGxPm9hN8hlpsS+n2PUlxzoeEQx4Wh?=
 =?us-ascii?Q?dUKCw16GJbp6HH96xsH12mG2LX18LSxCN1OEBQ0h+AXzoeekzuBexpQ+6G+v?=
 =?us-ascii?Q?eGIVmK5B4ZBQrK6vcT29lOaCvd51kIar6j5+tL/t35avn7eN8SOFkxXo2HQm?=
 =?us-ascii?Q?H8MpPWKfq/sX9dsUIgPEBKkp7rNmnOLvnRQglBN+Iz7SOLuoxC/unE1Nr9Hm?=
 =?us-ascii?Q?aumomqhCHNUZfIHfegVdCeDHTSV84UH/ZmvxKQIicnPpvzvlUHi3HaDOpyQA?=
 =?us-ascii?Q?S9oYajNWkGPE1etUBP3a60eG6l/QQEBdwF2+jRn6/ZN937dk05gLIwbovRj5?=
 =?us-ascii?Q?VS5rgTHfqoRJX4IqZiK2hpX/01YlIpT2BVg9apnKAGVoAydr+rDrFD83vnkE?=
 =?us-ascii?Q?fXEXWm+qVBvR4/oenyxsDgiA9Qw1gqWvENWHgrZf1rqU+SfBYZvHY5CMzTxK?=
 =?us-ascii?Q?XJe9q39vGgX+kQjNcpjBGhGF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d778a20-18a0-431f-a821-08d963e5b2fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 14:20:45.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH1h53kEORyMOzHHFviOket+UkN0ur72mEbyk36/Rmd2j2mP/q+WGaJ2rc+H1WbGFinfSgtWUdc7oPWCMzPF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 20.08.2021 14:18, Oleksandr Andrushchenko wrote:
>=20
> On 20.08.21 15:07, Jan Beulich wrote:
>> On 20.08.2021 13:54, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> This fixes Arm build which doesn't have ns16550 PCI support.
>>>
>>> ns16550.c:313:5: error: implicit declaration of function 'enable_exar_e=
nhanced_bits' [-Werror=3Dimplicit-function-declaration]
>>>    313 |     enable_exar_enhanced_bits(uart);
>>>        |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> This can't be the full story - both Arm32 and Arm64 build fine for me.
>> In fact I can't find any "select HAS_PCI" outside of x86'es subtree.
>>
>>> Fixes: 5ffd37db2ff6 ("ns16550: add Exar PCIe UART cards support")
>> IOW this tag is wrong, no matter that I agree that ...
>=20
> Ok, the full story is that I am building this with PCI passthrough suppor=
t on Arm,
>=20
> so yes, you are obviously correct here and "Fixes" tag does not apply.
>=20
> I will remove it.
>=20
>>
>>> --- a/xen/drivers/char/ns16550.c
>>> +++ b/xen/drivers/char/ns16550.c
>>> @@ -308,7 +308,7 @@ static void ns16550_setup_preirq(struct ns16550 *ua=
rt)
>>>       /* Handle the DesignWare 8250 'busy-detect' quirk. */
>>>       handle_dw_usr_busy_quirk(uart);
>>>  =20
>>> -#ifdef CONFIG_HAS_PCI
>>> +#ifdef NS16550_PCI
>>>       /* Enable Exar "Enhanced function bits" */
>>>       enable_exar_enhanced_bits(uart);
>>>   #endif
>> ... this change is wanted, but just for consistency for now. If you
>> can supply an improved / accurate description, I'll be happy to commit
>> this with
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> I can put the following description:
>=20
>  =C2=A0=C2=A0=C2=A0 ns16550: Properly gate Exar PCIe UART cards support
>=20
>  =C2=A0=C2=A0=C2=A0 Arm is about to get PCI passthrough support which mea=
ns CONFIG_HAS_PCI
>  =C2=A0=C2=A0=C2=A0 will be enabled, so this code will fail as Arm doesn'=
t have ns16550
>  =C2=A0=C2=A0=C2=A0 PCI support:
>=20
>  =C2=A0=C2=A0=C2=A0 ns16550.c:313:5: error: implicit declaration of funct=
ion 'enable_exar_enhanced_bits' [-Werror=3Dimplicit-function-declaration]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 313 |=C2=A0=C2=A0=C2=A0=C2=A0 enable_exar=
_enhanced_bits(uart);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
>=20
>  =C2=A0=C2=A0=C2=A0 Fix this by gating Exar PCIe UART cards support with =
the above in mind.
>=20
> Will this be ok?
>=20
> Can I keep your rb tag with this description?

No need to resubmit - I've replaced the original description and
committed the result.

Jan


