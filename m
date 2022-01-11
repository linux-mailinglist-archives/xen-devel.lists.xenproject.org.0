Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C3548AB13
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 11:10:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255651.438134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7E5N-0006Hl-DQ; Tue, 11 Jan 2022 10:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255651.438134; Tue, 11 Jan 2022 10:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7E5N-0006Fg-9P; Tue, 11 Jan 2022 10:09:01 +0000
Received: by outflank-mailman (input) for mailman id 255651;
 Tue, 11 Jan 2022 10:08:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7E5L-0006FP-It
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 10:08:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d1b8ae5-72c6-11ec-81c1-a30af7de8005;
 Tue, 11 Jan 2022 11:08:57 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-ARemIwnhMVqs8SZr4KguSg-2; Tue, 11 Jan 2022 11:08:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 10:08:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 10:08:54 +0000
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
X-Inumbo-ID: 7d1b8ae5-72c6-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641895736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94EU8NaxpQdREIFACinzY1TXPA4OZZMse2NBkpNmH4U=;
	b=Yt2I3h7fbidCx1bCGNcjWS51gQJytvi2yHzvja+Vp5/R1rPsIaC5VjyMWcxPn1Wxt+TpuX
	ghVAAbzsEkrzeew8BoBuaLNui9FrhoWB+E55ys35YuPvbu/PYU+oskTwVgkra9cflL8VSP
	LLh37yrPH+0/QiewZkNH79u55eYiLdw=
X-MC-Unique: ARemIwnhMVqs8SZr4KguSg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhYOIW9WgToQ6cSliSJMZEYnliC4XNS57OKN0GE4ny2NWbIn/uLrklSVDTKB1WeXhTtroCXWBX772JDM9yn7Omdo76zfKh+fseFyXl0jT31/xbcJoG9t4AtNstPHtVUSGUwJNGZEGacqlssryzaWWUuid9iDcguTcNutK2yo/kCyMncvBKxsgRDqufziNk4GtIQGe/dH8Tm90XQehj69g9Wv8SsZUBCYzwmxPjeYQ3uptGwMJZ4b8dILaymXdeYdQjdpw1yiFkuenNkcDsFaY5Jc+Zj/b49I3NDTCvM5ZM3OUqxKbYsBJ0yryAAgXEAv2JRO71U7DXc70oMH/8rqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sg6ZJz3EwiS/ErXJXNgrX9w7L3rFFVG2WlJfpbWcJn0=;
 b=KHxKKHzMuCGW4+x1KdJo+/L3k7hmD7BwHMZjNeMbA+sWa40GNIDC1KpCEH4SIb+CFYtnmW1nNWSIg2ZQ5tbeBAsCaqziMBfp070+FuwaXE73QE98zlk223FChwwJ99vhJnabuIUG6lHy5jgvPkHTxfrWeaTLERV8M1Y5pJ5bhwHeHVGgcL7eFQ9cB/ZyNAUKHOYB1EHJ7nPRg2+wcQwfcwymMDmDEQntTh0QMGqgGkX7IFR4Y9zCfhKxt1b1XBePipwrTCjjYHQBI+jymaWa29XmiFjNtvwt0AzLK04xLOELs+ug+TXqFtq5+msanF0/GQLl3Uy3+c/H90yLHIEAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66616751-24a8-7678-774b-35f6da4ad0b3@suse.com>
Date: Tue, 11 Jan 2022 11:08:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Ping: [PATCH] x86: enable interrupts around dump_execstate()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <amc96@srcf.net>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
 <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
 <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
In-Reply-To: <f0ca952c-1d44-56ab-6b81-6bba3fe1c016@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c30546ab-ab99-4f9b-6da4-08d9d4ea5f5b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304D47BA94F77D794D72CA8B3519@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YgFMSBTXurVGEfhOgALRnS7OWVpvwcZJWWHn59XO1QXbZGSj/pD1jtmpeKrGVgokNK2QubezlwIYs1ftZNVRgXOz3etYQy0GAUOElVXiWkSs2ZkPRFqZXG8kB262L9lmAQd99cpLiJEqMpejFrAaAis4daFMYKIByTn7Dxe9OkD1XM+tv7lf9naB6eXk0sb0/7zrS1gUEh99r3P1pfVL2KK2v5z4WKsL+l+10GCobU+21+e7UemP3akSeZxOEXWTMEB2RvNZ33N9qRjs5unMkNqb+o51NCr3GTVgImgknIu3fh5KeO6K1va/d16jWqWQHDamMg3DDP8vwX/ps9ffi/bm4qbDyGOggkWHkY3XoRu5Oy+KxGqD4WLfCK8/uQW1O0lmWbDwTly+ucAD0SPyHQIdqvi6iUILJYeCIE5fRLUfJqMDCyfXA10bPZg5ExtkWHaBH0Y7m44lV5ebYMZ/4q/rjuQxzrsGVSuMYXBsJv7c2vL06RoLoRpzjnPVwouKaIenXu2Z/DlTIQYDdUaxUqHsCSinaYruPsjUom7MkYzB6ChRNvu8ZqdB9RaSIo/1/h8pWGWIm/xRR4eV5vjYLzomOzc3rj9FP7OrjSlz8PQdwE9NvjsQi3/6HuVei97jdPFdeYzWjE6wg7joM/4x95PGR7wWx2h4K3TIt/rm0nxOPlDbRwWGpln0xX4165r/vRuLI/nxKYIj8w6Jd6iehm0wU/2pFP5qR6d+hifoF3w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(6916009)(2616005)(6512007)(316002)(86362001)(31686004)(2906002)(38100700002)(6486002)(4326008)(54906003)(36756003)(26005)(5660300002)(8676002)(508600001)(8936002)(66946007)(6666004)(66476007)(66556008)(83380400001)(6506007)(53546011)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qe3bBlx8H5nJqiyJFFrNyOOXHqz9QjfBJEjftJjI7dTq5dECfimkoHOtkAzP?=
 =?us-ascii?Q?PPS0oeXqESUzDblk0Ia2VUzyk2dUm8r/kBaVEYnS/sjyBC6ij/Uv55qHhStG?=
 =?us-ascii?Q?2s+tFNFPDqXtalRDKjTmnw43Z18wbM6lsbo0mtbNuhnrRXqdMrW0OW3gfyzj?=
 =?us-ascii?Q?hPWWWiH3O4NtV5W7GGcEMWg/mhofiy9RgJWlzCr4Bl5Y3uQRASwQUKrSBpsJ?=
 =?us-ascii?Q?Lf5uGNkJROJ8brwDvIfJYxigEJiYjcQIE5qym/lutg7Amu0yhTVUIP9bav23?=
 =?us-ascii?Q?eGeOSSBvReCl+K6PEk4FGQwOIp49MyuZLitmHrliedLklQZrfPjHEta/Tsw1?=
 =?us-ascii?Q?HEoYDdRtL8+qtY1Dw12Zmhg7uJzeOYdxT0cAgzZtQLkLDnVX+pdRogFV5AEM?=
 =?us-ascii?Q?eC5eU1eYqon2jSbv0Kvo7HX+2x9ZCVCScFndQd8TZvCIKPzVMwUvW/E3WLzf?=
 =?us-ascii?Q?5MHx+JvVJ529w0W0vSJS83hh9drSoCP/dEwtLqKmBEC0fADidw9Wk0jN0uST?=
 =?us-ascii?Q?toVef3g0VGxCLaNcIAMArX+J8PDLC7yf8NCAGJaRqJNY+hylevTJpZdK+4Jo?=
 =?us-ascii?Q?wYzmevehQI/zIJxXJ8ttPivGYyrEixuAmsaYL3/olIvSZWoOL/uvOBIijPe2?=
 =?us-ascii?Q?h6HDSfq2ulIGqxF/V7amQZgqTSXctFiszw1TzkeUnt5ucwAzHkyI4v+B1QEg?=
 =?us-ascii?Q?oM0vmvTitJ9/u04PcBmeeCXXqwJcsEkyI71VuxfJDq94sVIM2dgQVocRIJ6f?=
 =?us-ascii?Q?+Rx2pIggEQmG5Ni/3SmdIFhHcODG0iMyF/VbghBw7pSTOg7piHAOJHoXx020?=
 =?us-ascii?Q?Cu4XxoqTaL6cltt1xItLblowK09t9uAPnHieQjYYTnDkglzFj74AOVZe/UOq?=
 =?us-ascii?Q?5epRWkMU+pzuCMebsy/JpHInx609JHXKhQ23qiqEKwwE4Pk4TFCYqi382oFZ?=
 =?us-ascii?Q?ZSjRN8RjqyA5U84RomxqGMPmPjUGiogjhsjplgwQMhCiSycvJTcdX+a1T2XZ?=
 =?us-ascii?Q?tWw9gbkdL/rlejyvWEUyYpYxikX2/pnnulrbS2MsYI/XHkcAjNuht40VLp8y?=
 =?us-ascii?Q?VbaYOgaAivYPSqb9SrJhkF0m9+xzbxgWkxywKpd3BzM35ZA78LjozC/NnuGx?=
 =?us-ascii?Q?hGJ+mQu4xUe7MhLdexM/gTU1n5LpSV7mj6EJuuUFv1WcSzm5UpNXenrCkdsp?=
 =?us-ascii?Q?K9s4FrxZgufnAiVjGuLrfQnWGJrThCZuKfBN9fq7XmKc4viKuZykuzrQ3x/V?=
 =?us-ascii?Q?8Kd+fhYMkoET4ANquz5ow4Vkaf1Tb3bUA3K/XskFah0DXqjHOzeY/hV9tP79?=
 =?us-ascii?Q?YeErEbCkB+jDb1v2WJcX8br5E7UNZS2t0MWvBxyArw9Hw1hSlfDMLpeSu9iV?=
 =?us-ascii?Q?HbMk9ffFSUWCxcBAkkZU9bSd6SHtlnts8z7/lOqU+mQQzGQCR+8YKpnhGkW3?=
 =?us-ascii?Q?aWhC3Sv0tRPNPM4+sS0SL74eOCeClBQxwjPTRfjglBI9fICNjjm5EMQylwEU?=
 =?us-ascii?Q?5W2Mjf7lsTZ1exUpQLsa0lVKl9P6vbOJUBtzgCM6ovJXAVMLmiDhO29wrkkb?=
 =?us-ascii?Q?JfWCIcCqZYAdvQd7tHulMRbInTzXCiGSD4uUKd9Fr/+kpG6KJDCB72NS1viZ?=
 =?us-ascii?Q?p9eWWIQ+UTl7uCmeNshtm8I=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30546ab-ab99-4f9b-6da4-08d9d4ea5f5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 10:08:53.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6xBmm0sZ9NuOP6ancxg1MDzn/+XgeczQ3/uzozgEBVntdXAobJGMRq6t4q40wc64BD3As3/limC0uccJf4K6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 16.12.2021 14:33, Jan Beulich wrote:
> On 16.12.2021 12:54, Andrew Cooper wrote:
>> On 13/12/2021 15:12, Jan Beulich wrote:
>>> show_hvm_stack() requires interrupts to be enabled to avoids triggering
>>> the consistency check in check_lock() for the p2m lock. To do so in
>>> spurious_interrupt() requires adding reentrancy protection / handling
>>> there.
>>>
>>> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_sta=
te()")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>

There's a bug here which we need to deal with one way or another.
May I please ask for a response to the issues pointed out with
what you said in your earlier reply?

Thanks, Jan

>>> ---
>>> The obvious (but imo undesirable) alternative is to suppress the call t=
o
>>> show_hvm_stack() when interrupts are disabled.
>>
>> show_execution_state() need to work in any context including the #DF
>> handler,
>=20
> Why? There's no show_execution_state() on that path.
>=20
>> and
>>
>> =C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0 * Stop interleaving prevention: The necessary P=
2M lookups
>> =C2=A0=C2=A0=C2=A0=C2=A0 * involve locking, which has to occur with IRQs=
 enabled.
>> =C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0 console_unlock_recursive_irqrestore(flags);
>> =C2=A0=C2=A0 =C2=A0
>> =C2=A0=C2=A0=C2=A0 show_hvm_stack(curr, regs);
>>
>> is looking distinctly dodgy...
>=20
> Well, yes, it does. If you have any better idea ...
>=20
>> For these kinds of purposes, it ought to be entirely fine to do a
>> lockless pagewalk of the p2m, because we have to maintain atomicity of
>> updates vs the hardware pagewalk anyway.=C2=A0 We do not care about any =
side
>> effects if the target isn't a RAM page.
>>
>> That ought to remove any IRQ problems from the equation.
>=20
> First - how do you suggest to signal to the page walk logic that there
> should be no lock acquired? And then I don't think there's a direct
> relationship here with what we need to guarantee correct hardware page
> walk behavior. Unless you mean to suggest that here we want to rely on
> either locking or interrupts being off (the latter guaranteeing that
> flush IPIs wouldn't complete while we're still doing software walking
> here).
>=20
> Jan
>=20
>=20


