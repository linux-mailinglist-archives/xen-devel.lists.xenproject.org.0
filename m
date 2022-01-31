Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50B24A4086
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262941.455421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUKX-00026a-D7; Mon, 31 Jan 2022 10:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262941.455421; Mon, 31 Jan 2022 10:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEUKX-00023u-9W; Mon, 31 Jan 2022 10:54:41 +0000
Received: by outflank-mailman (input) for mailman id 262941;
 Mon, 31 Jan 2022 10:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEUKV-00023o-9Q
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:54:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e439663-8284-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 11:54:36 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2055.outbound.protection.outlook.com [104.47.0.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-DVx4Y8ijMvSRZXEj-CaWNQ-1; Mon, 31 Jan 2022 11:54:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4049.eurprd04.prod.outlook.com (2603:10a6:208:67::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Mon, 31 Jan
 2022 10:54:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:54:32 +0000
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
X-Inumbo-ID: 2e439663-8284-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643626476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DWWD4s6TSK3itJGhQiHiumxmUgUrGmgfnu2+7vBJNNI=;
	b=Md1FhAkdkIifbgL47Vvbjpb/RBljjci1ws39r6Bh1S+QfPfTEQppYUOiHF07MkKgzc0M4L
	0cOP76shybIX/XagomdD8BE/k/7MmHF8cbh1Y502uBk8QxJ0JhoUoVpD1uUJvKyopBF8qG
	SXMkXvJihDIhHg/hF4Zekc4JwQPyL+s=
X-MC-Unique: DVx4Y8ijMvSRZXEj-CaWNQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp3OMyk6joohl/lT8DII448UiJaKjfYY+56hTrn5AFWGqUdbta+ffHqzOuzHM/bZlwyrsLyKp3JOnIgDKED0KKSilfR5/uZyImeAHpsemgI2Pom5tOCn6Bj3QkkLMfLdyDYF2ZdJvnzVICVgxBwb36vlxRjo7MHNVUHAFBev5vm8M7AA5tuv7RcKg07p7OvlPbPJP0Olh1bkEEM4hLoms14Qat7G+bc/g2jdxxrg4S/sIUD1lX2zfBiFmlrzd4XTbe0r+fKgkUKlSR1pulUTkQsKIlZ/JAlIoqZrpgoZYwVj/IOh3Hoqka5GUSKKoUd32xO8fuobP0R7m6cS8BvCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXaWogdsuqx0mAAcJnFEiNiBED75M/lfgy+OMTIuGEI=;
 b=EXW3zouudCSLOxjwRe+IQsA/cZuuuEpKlmksUKuz+S6pLunMRlaEkc2cCcYR/3mHMm3dE+F2DTQ6SROLI+btxG0Y//ZjenDjT3FK3oEwebNivBjc5Hlajiz6tJ6IwDfBv97OVTodh77ejXT/tbpqNmqW2bqkTOi62a0VeBKjXiiSYsNe56yOzm/49PEF2RWzkAm8xncszne0xzNHgpH6yRgh3vvwk0eZey/jJqhLtON4RXNwvuU7/tNdZA5murS3HD2HsupDx/esi6B2X8PEPJPzVNoAPhpCFPoZtl4cI0TSxiuDBDLSFhtyLB1ZBB3sZDrzfknd0tSMcDtbZDMmFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3db8d85e-4b9e-ed0c-5053-cc953c835efc@suse.com>
Date: Mon, 31 Jan 2022 11:54:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <77c00154-646c-a2a3-98cb-be4324003446@epam.com>
 <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c7e87ebd-2c56-d510-b08b-02d53f9158d1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0049.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeb8609c-329a-4fd8-2c85-08d9e4a80fbd
X-MS-TrafficTypeDiagnostic: AM0PR04MB4049:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB40491FAFB842C098F8D4AA89B3259@AM0PR04MB4049.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUFhe6XyTNfPA5gbnPjAK/xomLGFErm73BspyY1vvkzwOCSlEr9e1aUxsJwRn+p0ZWGqhlPTd58agpNxWqwWS5ARcsnS1CkX/On9OcjdXZgud3EkDOyrQZQSrDcuv2ZiLUfT/yLZyf0Dbnig2lEJd7c0X03JCa15sQI0JWtaVsx23aP8/V6/JcuRvucN2QmsCwoMfQJVCcvewoux5ELgPyAkjoVpMJiybq39+YyWFkAM66ZX0M+a6AmJR3D70NZCySNf+soSzfhNsTMKCuASTD5MSlRMBA8D9Y3WWLng0xva8E5P6k8e2+g05XOckj+Jl7MrJHyWDXz17lCLBX372mmYC4BZE8VW9Ee7Wa8YO4QxQkRakHrD5QJspeMy7gCxWArOjRjgL21HlN9vEDeJz7lmwfODgKlEnqNTnvV4O7j4lLWgXW+AxzS3dvgi9wuDGJThC2bjYq9RGUjsyRcF5ewryZC6CBPYIDZiHl/jLr+CMOS+YF9Pqrec1jPvg22N/YVucGjbiv4OVb41basxyxE1NyfqRiBlugyp1Zk3MTwJHG10AtqCDhFmXBYbofdMS2446K3srz+wr1gLqLMutubMzFW0PqAzFcaOsplQgVU+n4L0To+On1Insf5cieyHXEvIP9yhHKMuNd+VXIf8LtlHlKe2UEDj+FM3k852K0UujiIZe/jlOTwRlmxwA7+JfHnqO6d5YAeyeEIGoh2aCtgTvX7u/bPStbBBDDTED18bm5Ku5RxUGPaSwr6lMLvk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(5660300002)(6916009)(316002)(31696002)(66556008)(2616005)(26005)(6486002)(54906003)(8676002)(4326008)(8936002)(6512007)(508600001)(186003)(53546011)(86362001)(6506007)(83380400001)(7416002)(36756003)(38100700002)(31686004)(2906002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DhrrRVZKB1/rtVdIUSFE1IH4IckW24MSlgTomLVgje9+KJN4lHC6ektxKwXL?=
 =?us-ascii?Q?mxEvRy9vCl5CpnUw6UZcnpv5eUdEcyciWu4giQOleV2sm3Q1uSB1HYCYN744?=
 =?us-ascii?Q?VrXaoI1sr5aLCiZ6QxOAtGZfK6mMHu/XODmt/Ww23a8hWbFAkWu6qTpx2QZ7?=
 =?us-ascii?Q?8p8VjnK4MJ6Elpiawgh0tc5Yvlm4Lp4hxKFQoKKww/erq5RaCCt/O/d+Jh+n?=
 =?us-ascii?Q?kC4n1cTsITkUIMJaaBXJkqcBx7hVxWcwwfCj5T1V5N0DJyNaf6E/PQA6rDyc?=
 =?us-ascii?Q?VtQcOSR+setijwBar0Ys+mij7ZHN4C6Y2U6ia3SzZAg9TPeMetFkWF49fwZj?=
 =?us-ascii?Q?YdVjW4GkK8ol2ujVpS/GaK8Nu1oflPSowS2HZ31fsmbnEh4PPrL2DtU708Ft?=
 =?us-ascii?Q?kvSltmWYFHMLLTbkXPFX39UHZPpjuBbVwAbi8YAWJitrcB1C9ymQdZMIp8ab?=
 =?us-ascii?Q?hQRoCbdddEIme+eQjGdWtojfjMIxymhSaVkcvgLhzPRuVOWSrjuQG/BZpEE+?=
 =?us-ascii?Q?hHyClJB4kfTcQKzl5wvpfw+cX5lPH7yQ2heKg1nJLx3FbpHNBhVU4tXcdr+X?=
 =?us-ascii?Q?MkjYJW7CTdRhADhjLCGV0J07gj+iAY9KvhEyvpy5vTuhOJr4lC0TzFRBH0w4?=
 =?us-ascii?Q?o5jgo5Cco8i7yt7wKCvnx2yQ9iPcspPD0VcisxGmjfqGUijzvzGit2dzx7Wa?=
 =?us-ascii?Q?JJbTbJHzdHL9VH9FTFrECXpFhC3YrMqZsweW8Ep2PJnw6+hYR3cVyD3I+JOy?=
 =?us-ascii?Q?Z9/qVKbToX9qHM2QLSZ7c7aYRSXCal/wo1quhYzr49KYpyPHit+gg79JmpUJ?=
 =?us-ascii?Q?4wAt8i9sjyhPxxmoZGwcvJMGkLjkKH2QlYWcj6To9JmoJ1P9Fi3BtQuMHpRr?=
 =?us-ascii?Q?kv8hBXWMdkIQdhtQvBuftBLKJR+DwbMW97BQtC6aW5Hy9ijPinPishy4ndeP?=
 =?us-ascii?Q?Mt/oEfVBs5DsH2940/FzOEJtp2IUXsSWSaTUeasc/ekD2757lS36SgPEWShS?=
 =?us-ascii?Q?lwvoI7gkQ9E/FMYbjXKBcc+bNwTjwDm4om41LADvDXyHYvyIHy+WFXlGTJSv?=
 =?us-ascii?Q?65JoIV+0MCeGUar46xEn22fasVtJWmW8iYd+iLX3mame6FwhbKZ7aVNaz4Ex?=
 =?us-ascii?Q?cZWeajujtNzjb4GGKwmJoU/QAWRPW9admt9JKwTtNaBvyB/VBzghsZ0rbpiF?=
 =?us-ascii?Q?2XOwUN6xb6xBKCOX8HCKT3jXxA7qaiKF4ctYqz+JbtukJR2zqp4N8JAJYsxZ?=
 =?us-ascii?Q?9qCPd7Y0Zz1erx0ffdkBXJzUTCLD0GBHj51J+vuIxxdd2ONDeTBStvn/tkNB?=
 =?us-ascii?Q?Yoh2vLI+0WkZgyPjqrEWL5P9k6Geenb7z+DJ2PL8adwIRppeK5Fq1WTXiwWx?=
 =?us-ascii?Q?LmGbBfQljUD3opkNFDmTUH+Qi6l+d0uayvU2aOQQoMNhkZfrUKMjCiuftjC2?=
 =?us-ascii?Q?fQMo7s9cPi6k4Abwb/pCDDWb0PE69MZCQVtiDxk1dmWDwgIDNcoMWbVeVaI9?=
 =?us-ascii?Q?L2BizJ575tC7batQbRH7v5qNSsDcEzoL8A7SFNSf7QOfzRNbw6kBKgiw3rQX?=
 =?us-ascii?Q?gJGSTdrMJg9NbaRix/W5BItFNd9LlsD8kE+38YII9SnRcttuoq6FJ0HMuf1Q?=
 =?us-ascii?Q?2uJ7vBE3fxwOhXnKNFCmZXQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb8609c-329a-4fd8-2c85-08d9e4a80fbd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:54:32.0580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNKVWNr10N3uSH+9UibL9h+AZTau5WDRHq3v/l1rOhQkkuJbOGyrOCEOUTxvaI4VWoTzsA3QhzFX7hduGj57PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4049

On 31.01.2022 11:40, Oleksandr Andrushchenko wrote:
> On 31.01.22 11:47, Oleksandr Andrushchenko wrote:
>> Hi, Roger!
>>
>> On 12.01.22 14:35, Roger Pau Monn=C3=A9 wrote:
>>>
>>>> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int =
reg,
>>>> +                            uint32_t val, void *data)
>>>> +{
>>>> +}
>>>> +
>>>> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned i=
nt reg,
>>>> +                               void *data)
>>>> +{
>>>> +    return 0xffffffff;
>>>> +}
>>> There should be no need for those handlers. As said elsewhere: for
>>> guests registers not explicitly handled should return ~0 for reads and
>>> drop writes, which is what you are proposing here.
>> Yes, you are right: I can see in vpci_read that we end up reading ~0 if =
no
>> handler exists (which is what I do here with guest_rom_read). But I am n=
ot that
>> sure about the dropped writes:
>>
>> void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 uint32_t data)
>> {
>>   =C2=A0=C2=A0=C2=A0 unsigned int data_offset =3D 0;
>>
>> [snip]
>>
>>   =C2=A0=C2=A0=C2=A0 if ( data_offset < size )
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Tailing gap, write the r=
emaining. */
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vpci_write_hw(sbdf, reg + d=
ata_offset, size - data_offset,
>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data >> (data_off=
set * 8));
>>
>> so it looks like for the un-handled writes we still reach the HW registe=
r.
>> Could you please tell if the code above needs improvement (like checking
>> if the write was handled) or I still need to provide a write handler, e.=
g.
>> guest_rom_write here?
> Hm, but the same applies to the reads as well... And this is no surprise,
> as for the guests I can see that it accesses all the configuration space
> registers that I don't handle. Without that I would have guests unable
> to properly setup a PCI device being passed through... And this is why
> I have a big TODO in this series describing unhandled registers.
> So, it seems that I do need to provide those handlers which I need to
> drop writes and return ~0 on reads.

It feels like we had been there before: For your initial purposes it may
be fine to do as you suggest, but any such patches should carry RFC tags
or alike to indicate they're not considered ready. Once you're aiming
for things to go in, I think there's no good way around white-listing
what guests may access. You may know that we've been bitten by starting
out with black-listing in the past, first and foremost with x86'es MSRs.

Jan


