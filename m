Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEA94B095E
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 10:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269684.463764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5ec-0004eE-1E; Thu, 10 Feb 2022 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269684.463764; Thu, 10 Feb 2022 09:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI5eb-0004bP-Tb; Thu, 10 Feb 2022 09:22:17 +0000
Received: by outflank-mailman (input) for mailman id 269684;
 Thu, 10 Feb 2022 09:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4tMu=SZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nI5eb-0004b3-4K
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 09:22:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef20a77d-8a52-11ec-8f75-fffcc8bd4f1a;
 Thu, 10 Feb 2022 10:22:14 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-AEaLfFvpM4KbpJYQSY00UA-1; Thu, 10 Feb 2022 10:22:13 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by VI1PR04MB7039.eurprd04.prod.outlook.com (2603:10a6:800:12b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 09:22:10 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::54e:e7d:545a:da84%3]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 09:22:10 +0000
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
X-Inumbo-ID: ef20a77d-8a52-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644484934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bnm/H72y2MrYyAYP53FxMjHgDhZhSxl7/SLWaEHAAMc=;
	b=XCJMR+ZlSWpy+naqmzWL2VsTr8l52mXdEdMGZ2tvnbt/WXK5vQ+qB0LeCY6krm3q/CnORc
	CHsHc78GpRThyzngfCw7aLBrpsNtMzlBIdEBzlnxLSETzLNTNNu8fFjs97FcGV4dBkUgEI
	+OCuxr9UHOIthPvwW3e7OTGv1vhFeOY=
X-MC-Unique: AEaLfFvpM4KbpJYQSY00UA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUvEpCuXNqLb1JqllniEUmZMhJgXtJ9bzMBRNbbzhlA4DwGGKL4trNx+tfep0ccOQleuqIY+wQlTXU0ArW3IO5pnTqVXpA/KDs59OV0ie/ZU2qN5UD3QiG8AoeSof0XR5sLDqTtPG75aWIk8u2zo2AZXi8Np3oIAQtIk3GnOss+/oRMiodXZyDysZ7iFGaZQfUKxmauU3Tc4dAKFTbMsLH021+H2THfMohmijsbSnb+VxDIEZxmlXEGwNfJ3Gi51cvlEq5D6pRuRI3GhJkXUUZGoGpQU/zeEUGZiqFL0NKGHe1bb/tKhyFAMGFPKEQ5C22W0st38kHgEdXn9PToppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGUbTCtYXX2wJ78MKsSyg0YaBcUJxx3LayTDYosPHH8=;
 b=iZXpP2MhrGCLcyCQH3xEwdwupWdaJAJPBOaK7sphzokvFwdiI2tHX1Rujpcz9uwzPe+nFDmxHKnsJcDcrgiDKGtYG0E7WLzHw8TE0QbUiE+G+N2pkCfXqkgYAsdUXbDbeusykDMaEuIUz/dDrI3aCs/1yl8wQhHvgjMvfpaeUKTrTAdzEQAUciFlf0c2c9PxhcZOX01Ow1stIhLwg7t83VBIpaGLTAqUa5uePq8GSmVKuZk7PkiImBO8Edkbwp0/FqVtLBH7n94VhwWaRX8dEDCJfQxhMgx1VgRrmrXUQpE5qe3Tvl8ZQc7kM/T4A+kAjecYw1Khyj/sZCd522UppQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <874bdf01-3131-8ded-3c09-7a9d71d87e19@suse.com>
Date: Thu, 10 Feb 2022 10:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Content-Language: en-US
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "paul@xen.org" <paul@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
 <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
 <15c16171-f196-38d2-370c-38627935a21b@suse.com>
 <20762939-6b7e-ff60-7c1a-d47c4767ff4f@epam.com>
 <10cd89b5-a804-3354-26d8-bc271bd9c5e6@suse.com>
 <15022045-bc92-e3df-b005-aeec5e36a078@epam.com>
 <cf584e13-f257-9355-50fa-c35e8fc8cf5e@suse.com>
 <a0015951-6eff-38a8-a9f0-bdbc8bd51940@epam.com>
 <51865693-1b5e-7ab5-f942-d244029c260b@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <51865693-1b5e-7ab5-f942-d244029c260b@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0086.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::27) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cba592e-88cb-45de-af88-08d9ec76d0e4
X-MS-TrafficTypeDiagnostic: VI1PR04MB7039:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7039EFCC2BB65EDC149EF1A2B32F9@VI1PR04MB7039.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yWxD5mHOKdsfuTKurJkmOy6I8B7NIuJYLqLqhgoBJs/11cvZWyRwAWyuRw0tKVjHK99vvY2R8XNAHy4Sfxx1KpNmQEYYOsaX4ECI/fPwhaNIBxHDUFDRyfdppgCWERtxfhhMnDDlcOLX0UDoCZe4KGmt+qOdrMsi2YeXSTSnMuoDBQiFg/bcjyARjW30+hHi0E0ufpQho6cCU+qHZO+9BW8JBfq7jHxikaWwTgM7L5L+orMRaFdQMSslgT2gXW5+PQQkpqPAQf/9pXFO1GgPlHvLrwvPFDtNv0Wei+f5fYflNE8AhrzS4xdWktZsHA9JI3Vyc5dvEZwcavt4ZXU1eC0kl3lFoQuCVsFdVck915RWxH0pxJ69gx3mGqsunV4S1SrgVX2u3tiMCY6u8BTmnmmI0PtmL0Czvuw/XqLdONMz6rFNH7bPLAqaJi4WXKM/Zsudg9TazfRF0ZTNo85XCUPTbnyqM1S1p2DXQl+ZYjAHXngHfANX5yjCvgVIKLEzBvjQhzvhvlt/XqzYTghleDX4xff7vHYmTKVHHsks9lOOdipRhbS4AE2ikDtmTbf7yqFIi0cTkRCSSqBU98yXVpRVs/cpa3zkvVMvfexaSDnMQQN/0VYJB44iyBhYFaDk92H7A/UFexz/AqSS8uRzlI11snRnruqviEEb7w2gwvv8q24yvAXCFd+q/9XWxFbDcnVISt+BimppzwWKseC0baeCntAbQEiX8SxWC622e0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(66556008)(6916009)(8676002)(66946007)(5660300002)(4326008)(38100700002)(316002)(31686004)(8936002)(54906003)(7416002)(36756003)(2906002)(6486002)(6506007)(6512007)(31696002)(53546011)(508600001)(186003)(26005)(2616005)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htesSu6fS/Qy27LmvJVfT03kCIcZAE7UfBXbbOCdSYWWIByEgHP4RwV00y2U?=
 =?us-ascii?Q?oZlZunszt/DtxicV+ovqnNZ688TFPd4nMXm/ILYA0sOINaDUasbNCjC1R8Qj?=
 =?us-ascii?Q?4ZNu9ST1KtIjWs0pBFjuHLgvebvZRCFP49p0TVWPcQtCY+47CjK2bjM6YzkZ?=
 =?us-ascii?Q?+tP3JsvX0COYVmOMuRWKFh7QU8L3g3sE94EQRzGHx75zTbYElcZoc2rkWRev?=
 =?us-ascii?Q?DCIWp0fq1PEM+hmO+/+tdx97JbSsFBMwhWx/2p2PZt6u/Xr0Z3ilHThUu2az?=
 =?us-ascii?Q?N4UywUPmmtatP3Qr9p48rWtcbmKmO4jGV51YmSQPTnGXkcS32OC1yX5mCnzv?=
 =?us-ascii?Q?RLJ+4ilcsjAL8KG3ZbrR95CGHJBYgNAf+dIrquHAbT8Qtg3oIyyZy+sxVa2m?=
 =?us-ascii?Q?Tus+yQgsCuQRTFym01b+oLFWMJysblCdPmxIKdyDocKcsgikL7YYv4w6m2N0?=
 =?us-ascii?Q?Hy9j4MYbdaW8m2gcl6gL4UsZtpTbYsK8U4XUbMpnoSVYGZ39j19yRS4KCAEw?=
 =?us-ascii?Q?mqyr6QMv6zXte85nz3KlVKyEbkSvUSOhqsm9mG2QLZD2EOKyxu45QMuicnm/?=
 =?us-ascii?Q?+aGfRVwVV7hhxDufHlnX7Q7ysYnK9Q7p0IABDaOtytMqWN9lvwRTa7CZoARf?=
 =?us-ascii?Q?eRIYw3VHHmXxeTSZJ6APqDLarThjzo+/guBTIg13rMWLvbWh6LY3/cOgEd1Y?=
 =?us-ascii?Q?JkpFXH1ME1dWEaNjkiHWd+Xt+exAQho5Aw0ItBCF2y7RizyRSQdAPfurISq+?=
 =?us-ascii?Q?gShYcBNskj4vg76/ykMkWpc2uyMQ/hONf8Y+IeSk8+ZeBVOIs6jjNlwSkgNI?=
 =?us-ascii?Q?JY0YAS+4qRxYHZDw8taprHFTAIrjsSQCwQyfdYDpLhK1WFtwxAEsx4MwqHiB?=
 =?us-ascii?Q?1DiPauZwbueDp3AYe1AOhYSGBBeDaZErE7y/wxgZGfimkmiXJpjN8EGPliuY?=
 =?us-ascii?Q?8Eo1Rdcc3saoK33tn/Kwv5aYSroFIDgvBUtPQdWqkisXhl7IXzv28q87OPON?=
 =?us-ascii?Q?cqYJP+K9ZUnTzYLrr8mc3/JWtXXMJkMytAV6sZBTGZKc0h6xjhCP2qNbFywL?=
 =?us-ascii?Q?vjkX8KO/doX+XZkWR+ESw7D3izg4HUExXPJN1zsvmWM0pkSc+4YT4oD9Mf8X?=
 =?us-ascii?Q?ri4FTyEkheV5eo8hGxBcPOhAtCz6DLtyI4RU8Es9qrid54Qo7q5FBvec/K0m?=
 =?us-ascii?Q?pSbFmlUp3l+Mw6ZbHrfAzcV7IzJmvN8FbiGsCh7+4DONp/mb9GdeqWZUTNAJ?=
 =?us-ascii?Q?NcTcWHhzuc7aqzc8DOMRH3iXjbeYGN8KmoN/ThLlG7NL91McOQq1ZIreKXwQ?=
 =?us-ascii?Q?P1xn8aSWbXNn8CpyzhkhQjW+rlMYkj7sHh+mPCAZJwqJnM8QT4bQSZUIjdYm?=
 =?us-ascii?Q?Zvs2M0YV8IEIp4bdINrODA/pzQ9CpVMSfiBUI1MsypqbH2VfzVnp3NoLDGft?=
 =?us-ascii?Q?BqnP7WsWomcXu/BsmS8CY9EnxVq9lFtiIcR07SIqZGXGCOmk8z8FapIgc1RL?=
 =?us-ascii?Q?1cZumr+uEM/PTW5V2cziGDcMewXZkCvk1Vr+j3E2f00to1uXSKL26QXGsxus?=
 =?us-ascii?Q?DQKBsM9cRnKl4VHjBPecIkRVjrxlAAyJZxRtjm8pej+tF3DUXTea626WTNXO?=
 =?us-ascii?Q?dpGTa8cBUn61WypvS6jR0C8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cba592e-88cb-45de-af88-08d9ec76d0e4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 09:22:10.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGkFY8jm9LEve6GV3k9fFPs3Wvo5R8D7UV+lczmjbpEE2+rFUyxo0V4mC+9w2ykXTT6ybIVrs9NUw8u0GVoDCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7039

On 10.02.2022 09:21, Oleksandr Andrushchenko wrote:
>=20
>=20
> On 08.02.22 13:25, Oleksandr Andrushchenko wrote:
>>
>> On 08.02.22 13:00, Jan Beulich wrote:
>>> On 08.02.2022 11:52, Oleksandr Andrushchenko wrote:
>>>> This smells like we first need to fix the existing code, so
>>>> pdev->domain is not assigned by specific IOMMU implementations,
>>>> but instead controlled by the code which relies on that, assign_device=
.
>>> Feel free to come up with proposals how to cleanly do so. Moving the
>>> assignment to pdev->domain may even be possible now, but if you go
>>> back you may find that the code was quite different earlier on.
>> I do understand that as the code evolves new use cases bring
>> new issues.
>>>> I can have something like:
>>>>
>>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/p=
ci.c
>>>> index 88836aab6baf..cc7790709a50 100644
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -1475,6 +1475,7 @@ static int device_assigned(u16 seg, u8 bus, u8 d=
evfn)
>>>>    =C2=A0static int assign_device(struct domain *d, u16 seg, u8 bus, u=
8 devfn, u32 flag)
>>>>    =C2=A0{
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 const struct domain_iommu *hd =3D dom_iomm=
u(d);
>>>> +=C2=A0=C2=A0=C2=A0 struct domain *old_owner;
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 struct pci_dev *pdev;
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 int rc =3D 0;
>>>>
>>>> @@ -1490,6 +1491,9 @@ static int assign_device(struct domain *d, u16 s=
eg, u8 bus, u8 devfn, u32 flag)
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(pdev && (pdev->domain =3D=3D hardwa=
re_domain ||
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->domain =3D=3D =
dom_io));
>>>>
>>>> +=C2=A0=C2=A0=C2=A0 /* We need to restore the old owner in case of an =
error. */
>>>> +=C2=A0=C2=A0=C2=A0 old_owner =3D pdev->domain;
>>>> +
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 vpci_deassign_device(pdev->domain, pdev);
>>>>
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pdev_msix_assign(d, pdev);
>>>> @@ -1515,8 +1519,12 @@ static int assign_device(struct domain *d, u16 =
seg, u8 bus, u8 devfn, u32 flag)
>>>>
>>>>    =C2=A0 done:
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_G_WA=
RNING "%pd: assign (%pp) failed (%d)\n",
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 d, &PCI_SBDF3(seg, bus, devfn), rc);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We failed to assign, so=
 restore the previous owner. */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->domain =3D old_owner=
;
>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 /* The device is assigned to dom_io so mar=
k it as quarantined */
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0 else if ( d =3D=3D dom_io )
>>>>    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdev->quarantine =
=3D true;
>>>>
>>>> But I do not think this belongs to this patch
>>> Indeed. Plus I'm sure you understand that it's not that simple. Assigni=
ng
>>> to pdev->domain is only the last step of assignment. Restoring the orig=
inal
>>> owner would entail putting in place the original IOMMU table entries as
>>> well, which in turn can fail. Hence why you'll find a number of uses of
>>> domain_crash() in places where rolling back is far from easy.
>> So, why don't we just rely on the toolstack to do the roll back then?
>> This way we won't add new domain_crash() calls.
>> I do understand though that we may live Xen in a wrong state though.
>> So, do you think it is possible if we just call deassign_device from
>> assign_device on the error path? This is just like I do in vpci_assign_d=
evice:
>> I call vpci_deassign_device if the former fails.
> With the following addition:
>=20
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.=
c
> index c4ae22aeefcd..d6c00449193c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1511,6 +1511,12 @@ static int assign_device(struct domain *d, u16 seg=
, u8 bus, u8 devfn, u32 flag)
>  =C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
>  =C2=A0=C2=A0=C2=A0=C2=A0 rc =3D vpci_assign_device(pdev);
> +=C2=A0=C2=A0=C2=A0 if ( rc )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Ignore the return cod=
e as we want to preserve the one from the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * failed assign operati=
on.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 deassign_device(d, seg, bus, =
devfn);
>=20
>  =C2=A0 done:
>  =C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
>=20
> I see the following logs (PV Dom0):
>=20
> (XEN) assign_device seg 0 bus 3 devfn 0
> (XEN) [VT-D]d[IO]:PCIe: unmap 0000:03:00.0
> (XEN) [VT-D]d4:PCIe: map 0000:03:00.0
> (XEN) assign_device vpci_assign rc -22 from d[IO] to d4
> (XEN) deassign_device current d4 to d[IO]
> (XEN) [VT-D]d4:PCIe: unmap 0000:03:00.0
> (XEN) [VT-D]d[IO]:PCIe: map 0000:03:00.0
> (XEN) deassign_device ret 0
> (XEN) d4: assign (0000:03:00.0) failed (-22)
> libxl: error: libxl_pci.c:1498:pci_add_dm_done: Domain 4:xc_assign_device=
 failed: Invalid argument
> libxl: error: libxl_pci.c:1781:device_pci_add_done: Domain 4:libxl__devic=
e_pci_add failed for PCI device 0:3:0.0 (rc -3)
> libxl: error: libxl_create.c:1895:domcreate_attach_devices: Domain 4:unab=
le to add pci devices
> libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 4:Non-exis=
tant domain
> libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 4:Unabl=
e to destroy guest
> libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 4:Destruction=
 of domain failed
>=20
> So, it seems to properly solve the issue with pdev->domain left
> set to the domain we couldn't create.
>=20
> @Jan, will this address your concern?

Partly: For one I'd have to think through what further implications there
are from going this route. And then completely ignoring the return value
is unlikely to be correct: You certainly want to retain the original
error code for returning to the caller, but you can't leave the error
unhandled. That's likely another case where the "best" choice is to crash
the guest.

Jan


