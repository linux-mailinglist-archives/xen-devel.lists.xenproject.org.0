Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1F41AAC0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197811.351063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8ee-0004MU-6u; Tue, 28 Sep 2021 08:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197811.351063; Tue, 28 Sep 2021 08:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8ee-0004KP-3U; Tue, 28 Sep 2021 08:40:00 +0000
Received: by outflank-mailman (input) for mailman id 197811;
 Tue, 28 Sep 2021 08:39:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV8eb-0004KJ-Ur
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:39:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8793d24-2037-11ec-bc73-12813bfff9fa;
 Tue, 28 Sep 2021 08:39:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-0zOHd_wSMy-5Dwt0vllfpQ-1; Tue, 28 Sep 2021 10:39:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6304.eurprd04.prod.outlook.com (2603:10a6:803:fd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 08:39:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 08:39:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.9 via Frontend Transport; Tue, 28 Sep 2021 08:39:52 +0000
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
X-Inumbo-ID: a8793d24-2037-11ec-bc73-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632818396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ayiNVvzyi8NkM/XX6T5mey5N/UX5qQalJLIXyS8enFY=;
	b=TgAl6OsIQdFyoJpHi/plT3vz4LoTvPweQmBwEsF63QUgGT7vb4fEIv4/2G+rWuHZglpdkr
	WgKEIwEX3iQUldpgn3XietB0O0gqcM9LBGDsCgAFCsyUzyTMF/G0MJbzTP+lKqGoxtrO0C
	Puo14GmGUDMA+r1LxjaPJrfng+6XY5A=
X-MC-Unique: 0zOHd_wSMy-5Dwt0vllfpQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ejolo0BbWCs99amFInIQLC3prPR1PC8K9bXX9UEqY/g3djgmBF3kErnGQJVPlPuhRjysUney1bn+EUXDDLE1EdjOsGOAer3jf6GJFxDvcZF8Os5t56xM8egLhZTQkbWjIg1XacdNCRjPqkt+4lW+fwAO8AIMjzGsCmPNzy/6KHrU/EAlnvR0FCPGt0adger1xIVgtigXu2SoM+x4JjnkI2LoTMAu9oLRBD4sz9cK9KVacJWqRK7bf2MGwl3/b9YXkAsNOf9SKpNCW2XAgF5qyrF8SxrkVpFpmV+IxTFjo0VptL/I46sysSYzTP+5COUvuJk53qTIetvXlh4mYsaLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0zFOdtgwqFf2erdagpj2hONURacGfoJvsaNbMGLLovk=;
 b=cZGzlg/0+7dhcxT+viRPLkNawSthd8SB4LGBhDImLdJs2oHIdfLFfxP+0W5mZtuq03fJQBMPXCN3H9+1Mya5t+sRzwHSzmVB/JIcAQzk6bxXF4rphRo3Cr8Esi/CQpkuHT0vxEG7eU2Wquubil29EHbhPe90ZYZMbpyszTPQ1XUlR7SNwrgUaGxWZMzS2ZZFyl3kEiL6VABie2JBctrP43h2+KpOvwfGkJP5eGt814F3vLge670t1qNyftTcFi30CcEMCkLWL9DBOgnyb9vmaYb5VivCaLYYd1HjdoowxcRDQdVJv8X8G32Z3sOSYw98RwoBzBI0Zzlt9V5hR0Yrow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210923125438.234162-1-andr2000@gmail.com>
 <20210923125438.234162-6-andr2000@gmail.com>
 <443f57db-7b0d-e14a-88bb-78a31c0271d6@suse.com>
 <55beed13-3a7f-7269-870c-ee0361e23a1c@epam.com>
 <7b093c2f-33cf-ac9d-9583-f0d8b2bb4f48@suse.com>
 <23ae58de-6bd0-b299-a7d9-e6433d1b0689@epam.com>
 <56d30f56-d9fb-e7ca-f3e1-6795973d648c@suse.com>
 <a119740d-02c2-315f-432e-67aec806ada6@epam.com>
 <6eefff6f-97ed-e7f5-37f2-96065bd1f27e@suse.com>
 <2e8f4316-002f-17d8-b9ec-9886c6bc28fa@epam.com>
 <31dc3429-b1f4-85ab-968d-c9054b77ac4f@suse.com>
 <13b9cc76-c7e0-be7e-61d3-fc42a41dcc58@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a3c020c-687c-1818-3a0f-5e8a553fe58e@suse.com>
Date: Tue, 28 Sep 2021 10:39:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <13b9cc76-c7e0-be7e-61d3-fc42a41dcc58@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0da94c70-8883-438d-62c6-08d9825b8a8b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6304:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6304B89427298E4CA5636F11B3A89@VI1PR04MB6304.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5QQjhzWWmSwMB6sO65liybwbBI/HjLgnjM7cbqVC/K/1+u4FN/dcPYJ2aVM1ccCv5eV9vupHWbBQSvslMEhGYZ+ILcC4R95VQYcvoxltn5wHvydOrsiTkd3dYp0ZDjD5PFp1eaOTIZDdUl5UnbgU+tYUeB/aILyFpB6pHRW1m0NyltVx1TX5LySsHqi3ogvu+IthFa/yoPWItGPgeIvRWRONYBxXjOF1X5TAQIsVtQIPlek8Ip0+hHq6JZTMTh/8AenREg3INOzCQyWO73B78EJoDbFt13P3i40oihK1VYYkOjZNJvCJ52yS9Xk6juFCaewVsQmQR9/5IfKO+P7ey1FkhGjo8RtGG7avNWFusDbCoGQyH3rnxsIfTZGhePLLX5GeIB1oZqZ2O27a5XGKO2aZ3hdGjZ0RBWNbx83YppyFTcQkIZs6vYxcqet11OU5Z3aYUce4MqcxVMRFoJvNuyBk4BCSZiBLcONX7SZKzBnLWrfDOK4sM8nkAkVhxjvnQ2qAAeMXDtuwlWxjKlGnypQEN9BkwNPrEc0Ud0i4gRwdT1r76S1GS8oou6InOEqjq4+ZSG6D21BIMskWOzK98PVazZ0U9wpkqP/zEOtXVx3uxWnlJa64grzQeoKd3VvSUlMj6vxF1ILMY9iaQ7IZhi3WH/VVZfWpULjw1Jt70+FvOsSh0xPnVOqmzj6zsMy5qGI/mff/O9Ilv5zxTwa9MywG49+Otd5GXHITis9BQ62bg51rlONizrCehVH7tyPG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(31686004)(956004)(2616005)(36756003)(8936002)(53546011)(6916009)(2906002)(31696002)(316002)(26005)(66946007)(86362001)(8676002)(66556008)(5660300002)(186003)(508600001)(66476007)(6486002)(38100700002)(54906003)(4326008)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?27/fm9kyQ8fOL70gmdoLufNQi1yzpnkSb1RLI2k4EAHuLekk3cMAxtqukHPp?=
 =?us-ascii?Q?ERFdZfgQlecWx2UoZXL+Kla7H8ezoU7TechTQh2s0SR3ORFVsH+oBGE+j5Tr?=
 =?us-ascii?Q?0FWoBHVr9a30a5lzElKBNbPQ1204bFnYRQlLwuBbERrrI4uQCzRN69oWaVGo?=
 =?us-ascii?Q?1crfWUQ3bQhQ5jM1nDUF447H1f3qkCejkzEoEpRrmJLvNdqRRmjQHXYOY40S?=
 =?us-ascii?Q?21vvST+Ezy5lBGwYHXuIdnE40+OhkyTlsCEHthaw/+18js1cFz7M3f8KY0Zv?=
 =?us-ascii?Q?KT1RtQBB3x0eSeBMvzIcwu3RgbJ0X7tZV2+R21XCd0VPTFYzaycOd3WmWhLB?=
 =?us-ascii?Q?D+0pT0/4U3vYov+cj0C+t5+HYYdvAiEBLpd/W/GLtro9QqhXo+vIXLGlxvSd?=
 =?us-ascii?Q?3zaa+ubq+k6CoHWTrIIBKzF0+sXnsPcSM1nA6MVtH7+uLvJg6s5CPXJLKfJN?=
 =?us-ascii?Q?61rbguQUTJgN6jLS8rFEPUcVCyI0e04By2ACSiazbvBm8+eFeBY25l9/DZzY?=
 =?us-ascii?Q?ssNq8SHHWshq5apS6Wxy1o7NBlAV6WSndmhU+pcmHvRE8ROA9ORdXFT0sHL8?=
 =?us-ascii?Q?ZF6ApuA7r8ju/NH/PFJ8O//D77ShULAU4FQtl/A4FICdMenmteLjj/N5JQqh?=
 =?us-ascii?Q?Gq9XMGTcIMSDms66r085rGAM1HQXQAK98iXmLl6DBs5k+Q6q911UEQrivDsV?=
 =?us-ascii?Q?ct3UnpYibyIYo8S4oiatigJBZtRtZkg3letu0cNmCpZoncjQ8GHzpgEYAg6k?=
 =?us-ascii?Q?4YIbCDsPLwq/ahO03eW0+ScHFBy/PIXZ7gD46NzcLoY2oR9HZxJOgxZsIJf+?=
 =?us-ascii?Q?7heYE101OoA914pp+HRyrjMCnxgMoAj02OIok/k7EliHitXNg/NU2rZ05nW4?=
 =?us-ascii?Q?MVHDJ8Htmyy1FrM233TzxdY+I07mkr0H+BA6PxaVzQ3kqiJuGYaj7EgYh620?=
 =?us-ascii?Q?wbdMktdHlNQuy1ksi15/Gk1ozbsxRZ4FY1JBBozHHNHR1DlOPJ80m5yzYJZ7?=
 =?us-ascii?Q?oBc9+9RolmVpZsk/M8iubWPE7PLQOFvxNgx+xgnmHJFxg35X4GbHbiVZbUes?=
 =?us-ascii?Q?RATYqXI5hJnsLXEFJeEDcWdcm8DoTLrPpBuc57ZrCm+PXa74StgOGAiZyxmw?=
 =?us-ascii?Q?4Ilw4/0WQ78D8Xs+kne1MZHYmPATr3NmKx66hkAZ4Wh0wDD0zN9bPR92+BKP?=
 =?us-ascii?Q?0RnCssb0qCUcmBtuf0ilHcuR6nGLsfen6YsBzyf7PaivVQ7IC/Np2QIp7ap1?=
 =?us-ascii?Q?pGfrqLfKtTHciYWXTc1LCqiBw6HrGNQ8Gg63JjK8Cc97xH+ilXfL6vnVfe8e?=
 =?us-ascii?Q?EmcJmQ9RJzu27j4k34Yjqngl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da94c70-8883-438d-62c6-08d9825b8a8b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:39:52.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjW1UHRPOrqG5TpAjfUe0uJDpHEqj1NuO8sG5DPqxBJBD71gSYh+azqb9Q+msL8indmlIultbqLq1qBYjhcx2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6304

On 28.09.2021 10:29, Oleksandr Andrushchenko wrote:
>=20
> On 28.09.21 11:26, Jan Beulich wrote:
>> On 28.09.2021 10:09, Oleksandr Andrushchenko wrote:
>>> On 27.09.21 13:26, Jan Beulich wrote:
>>>> On 27.09.2021 12:04, Oleksandr Andrushchenko wrote:
>>>>> On 27.09.21 13:00, Jan Beulich wrote:
>>>>>> On 27.09.2021 11:35, Oleksandr Andrushchenko wrote:
>>>>>>> On 27.09.21 12:19, Jan Beulich wrote:
>>>>>>>> On 27.09.2021 10:45, Oleksandr Andrushchenko wrote:
>>>>>>>>> On 27.09.21 10:45, Jan Beulich wrote:
>>>>>>>>>> On 23.09.2021 14:54, Oleksandr Andrushchenko wrote:
>>>>>>>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>>>>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>>>>>>>> @@ -328,6 +328,9 @@ static struct pci_dev *alloc_pdev(struct pc=
i_seg *pseg, u8 bus, u8 devfn)
>>>>>>>>>>>           *((u8*) &pdev->bus) =3D bus;
>>>>>>>>>>>           *((u8*) &pdev->devfn) =3D devfn;
>>>>>>>>>>>           pdev->domain =3D NULL;
>>>>>>>>>>> +#ifdef CONFIG_ARM
>>>>>>>>>>> +    pci_to_dev(pdev)->type =3D DEV_PCI;
>>>>>>>>>>> +#endif
>>>>>>>>>> I have to admit that I'm not happy about new CONFIG_<arch> condi=
tionals
>>>>>>>>>> here. I'd prefer to see this done by a new arch helper, unless t=
here are
>>>>>>>>>> obstacles I'm overlooking.
>>>>>>>>> Do you mean something like arch_pci_alloc_pdev(dev)?
>>>>>>>> I'd recommend against "alloc" in its name; "new" instead maybe?
>>>>>>> I am fine with arch_pci_new_pdev, but arch prefix points to the fac=
t that
>>>>>>> this is just an architecture specific part of the pdev allocation r=
ather than
>>>>>>> actual pdev allocation itself, so with this respect arch_pci_alloc_=
pdev seems
>>>>>>> more natural to me.
>>>>>> The bulk of the function is about populating the just allocated stru=
ct.
>>>>>> There's no arch-specific part of the allocation (so far, leaving asi=
de
>>>>>> MSI-X), you only want and arch-specific part of the initialization. =
I
>>>>>> would agree with "alloc" in the name if further allocation was to
>>>>>> happen there.
>>>>> Hm, then arch_pci_init_pdev sounds more reasonable
>>>> Fine with me.
>>> Do we want this to be void or returning an error code? If error code is=
 needed,
>>> then we would also need a roll-back function, e.g. arch_pci_free_pdev o=
r
>>> arch_pci_release_pdev or arch_pci_fini_pdev or something, so it can be =
used in
>>> case of error or in free_pdev function.
>> I'd start with void and make it return an error (and deal with necessary
>> cleanup) only once a need arises.
>=20
> Sounds reasonable. For x86 I think we can deal with:
>=20
> xen/include/xen/pci.h:
>=20
> #ifdef CONFIG_ARM
> void arch_pci_init_pdev(struct pci_dev *pdev);
> #else
> static inline void arch_pci_init_pdev(struct pci_dev *pdev)
> {
>  =C2=A0=C2=A0=C2=A0 return 0;
> }
> #endif

But that's still #ifdef-ary. We have asm/pci.h.

Jan


