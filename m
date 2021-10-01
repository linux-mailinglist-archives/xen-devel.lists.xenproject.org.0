Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617141E87C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 09:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200433.354951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWD88-00061O-5F; Fri, 01 Oct 2021 07:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200433.354951; Fri, 01 Oct 2021 07:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWD88-0005zZ-1t; Fri, 01 Oct 2021 07:38:52 +0000
Received: by outflank-mailman (input) for mailman id 200433;
 Fri, 01 Oct 2021 07:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWD86-0005zT-G5
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 07:38:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d75c56e-228a-11ec-bd96-12813bfff9fa;
 Fri, 01 Oct 2021 07:38:49 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2052.outbound.protection.outlook.com [104.47.10.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-yTekr-byP9KYo0PwxfznLA-1; Fri, 01 Oct 2021 09:38:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.18; Fri, 1 Oct
 2021 07:38:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 07:38:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0109.eurprd04.prod.outlook.com (2603:10a6:20b:31e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 1 Oct 2021 07:38:43 +0000
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
X-Inumbo-ID: 9d75c56e-228a-11ec-bd96-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633073928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=un8cewv+5XiF86rYpM9Kna5lC2JX9xinmMFx65Wv6rk=;
	b=L1drohkhPkTwyAFCZZvVKUHE8/aycU5TddEA9cv4Qb8AExeS4a1i1XZ3JNQ7IW/AdZ/cWP
	tAZ7Ej0vZzGH+XKLX5dpxMA1FQi/9TTq6lqqm4GdS+8pRyS0t2hrbgF/ESXD/mzOvDH3z7
	CxGiWzXI6NvZPdKJ39vDQfOxbtUnnxQ=
X-MC-Unique: yTekr-byP9KYo0PwxfznLA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBChRCwWzIK9ZXy7Lvm8m4Sq1dgroFrVNN9Cy2UuK0ls2lvdTbWcNEX1Axxvmw4ass2qFINPrvQw7gJWafJ8svwJ8Qv8K239tLZtzLL80lJBhiSv6zeuBxp/jPURBofQMKXYOPsYEiSGpDzRG4pK6reoriUo3SDKM3ZBQUgBVxyOJ0n9gUhaxYV45+9snQ+cFLfdL+v1D/UKOH/98swlF2Ujrxd96XfmBw/53GdgYphzVWN5NA/oEW9dYV5c9GUSTMf4ZwsYvldOWJKYiu1cjTmKFg10GHxsh1cAYX66QPXwc2TptNympPahCOonwtYaA53YjyyfFxi1rL8kPZlzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZVg+2B5aThpQgfrfAXQsiwDuMSxNZvMVYryRGymatc=;
 b=HyJnbiovKyAvNz8+oTJcOOnezojlQ2pSWtqN+lGD1FtonHcaQpY8pp6n2MyfeFqMfCAI8dCbFgnRKj2qKF79dJoRk66Ibp7rn+yzHI3ZgLShu9YXEjwg8+zahWVmaOuSB0NPz36OW0xAH1d/qKcbPBmKD9WSQXuAWxUvN8wFvzM72ws4k4cX6Q6jG2vtiGhpfj2xNZcckZxGjoXs4MlOgZjZwwtiSK2OQdZi4gDIfjpINANmD59JIcnL7/Dpd4We4siXoEiJ5mhPNOJmoKaT8HXVUYCdwJPnJYWEQXlVs1pH6xALlPuCPvcnfcejgCOFbwGu0dbb5k1JziMHsC6MEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating one
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210930071326.857390-1-andr2000@gmail.com>
 <20210930071326.857390-6-andr2000@gmail.com>
 <alpine.DEB.2.21.2109301733250.3209@sstabellini-ThinkPad-T480s>
 <8641a887-f579-bb73-781d-403917a7b765@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ba874e2-89ca-2647-76f5-885f8b16d426@suse.com>
Date: Fri, 1 Oct 2021 09:38:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <8641a887-f579-bb73-781d-403917a7b765@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63b8e308-fdbb-43b4-5022-08d984ae7f40
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46056B5C9838569D6C01E530B3AB9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aeyhFiB/W5h2o8JqEHuj803DFmVBO/XfBiJ61Te5sS1bcVYQj722VpSQIbzIlBCHRplJX97hUukQR3WL7gGKBBbQrjeEuMyZcwE02Nn2ccyfBzpJ4zkoQR2g06C7QbMDFXeQNm7VUZ5QKubgNAYxUM00jeQaAIrXmBKB08L8P0buXn9cNq3MnOifVNlgkwOcFISVzAOnyXPi0RzQspRYYK0deEA5fUoliqSTNbirPgnT3uED8UyCZzKpRXym91mX6+OsqrXYtVNayMiMZNOaxYWOH5nM/SnZV/073Caohh01UUZejm57rQZapKRCOPREYNJLE2hAEwrqREQr9Xbz2rw29abMDyWbg0SAUA5Bmzp9+fWSFFFkC14HAcPHVCdF+qs75eC/jPr9WhQdfeFCPdtg8tM49L0AhZqjFWAOPXG++P2+drwObJCn2RvP1ieh6ruoXoq+LkaZvJh0VUu//vm6x8cNrZRlbRiYfkcE6PBmziUIvlPmBswyYdr7KOn01pjOnxhX7ZBDXkOajpZg9cPipwTfv3FHorbs12Cn/Sh5YVzaPQbIQzqS0UgFHrWKLoE2dREccmdQ6Ar6XWiDycYkZ79YMzpC0peOLk6GixLC6SDDUphrHLI0jq5uHMBNE08w5RP/M9ptM0BJL0WmNbp5TrmlmNgLzrbnDXftDAp8Gjz7Z/4xVN+meaitT3teYmC41kQL3/vHra/BsXrldBFHgp3EQSzLFMV9xnUT6DQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(186003)(38100700002)(7416002)(8936002)(26005)(8676002)(36756003)(31696002)(316002)(4326008)(6486002)(86362001)(54906003)(66946007)(508600001)(5660300002)(956004)(66556008)(66476007)(2616005)(31686004)(6916009)(16576012)(53546011)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CEyPspERchX65H6hEvI0Nze5pHEbqzlkWlez94F40fx4bwNQYi+tu01UdReZ?=
 =?us-ascii?Q?RTYODcMvtK3tvNIJ1J7d7jUqJC3T8XokCYaHp7dkb3pY9SOdM0h5A06uLMvZ?=
 =?us-ascii?Q?5hrZYY69JJA4LoYEe4OkQo7lnIvauXAvZ4cZ0YbmddvoMA+uuLaIimRXj1ru?=
 =?us-ascii?Q?CZPPuv6V2VjuXjXhIVkcZMrcLoqNvkJ6z4Qr+cpqUnimvSDOqiWUWhzt5QkF?=
 =?us-ascii?Q?QDTZIbIgC28MyeCEWI4aaZ4Pvq6Py9ggds/ranbjOIjiXNn4VHM9CgBWgOcL?=
 =?us-ascii?Q?Ce+e7/9YFo30MVXsoFbGXaGedNjtNog6yrPX0H4GWHSWn9wIRgOcJSsIvZbC?=
 =?us-ascii?Q?eCsUiWw4FXLd3l27pSUFjmKyCAaE6U0gqZq+n6i6vcYe1YnAg6pi31QQsruI?=
 =?us-ascii?Q?1Jkc+zsMnvFlO9DpA6ZEhyklptR7N23hTWUbWa5vHrJZT+i8xPa4p20YhrB7?=
 =?us-ascii?Q?xx58xT1hbLtZpfmhZU/ZTyfwWZgJBY+JLaOUqBvZ1NAYUNUIsp/A/sPC9tig?=
 =?us-ascii?Q?PoGuIPJkEA7cfPEwe6kSxbttTZfXYgV306iKIdaluNusoFd4Mz5PUbW9fbFk?=
 =?us-ascii?Q?4uG5W+6t6sSsRHty7YF/p/19UFui+YKydlX0u2oUkmRCUH8zSh+oF+e0o5AC?=
 =?us-ascii?Q?E5IhqnG3/u4k5YOJoBescf0yED4u8gPnRg2zA9rJnepgr7cMjwtYslS5DyJl?=
 =?us-ascii?Q?gWVtaym9GVm7ntWPfB9QoUZmUkHq97qIbac4aF9Z/VXCoSBhoXzqu6uzCnFE?=
 =?us-ascii?Q?VJFlU3VDmiZqZW8Zalb/BtBAPQiJCePjBbAlW4amxWv3vrWIfS+2wmcwLMfq?=
 =?us-ascii?Q?b2J2f774K64cSP1i0jZrnQDSzQaNfdSndoSydcyQAZQBnh/FMnquhPs9jaPI?=
 =?us-ascii?Q?+kcKTxHZmoIwUSGdz8WlKPiwyN+cQL1fo4QVXY825zLbQZcZEZxWzhEhQJLJ?=
 =?us-ascii?Q?DdVjsKOuxuQd/wJVPc5TmIk+mK70an5UoPomMYWsnggRIKzCjsa1vl/jLiM/?=
 =?us-ascii?Q?W1PTss4GQP4lVF2w0DDCl2cAed+JEP/U9sZnjhFhNjmYbHqqJR0+zZuYBYuT?=
 =?us-ascii?Q?F52r3fXYcJjwB26E1b+LqFtKajHX7q8MIcPtcM2SzQ5wdTAdy8L4qkxOArnS?=
 =?us-ascii?Q?qve3Ap8nc+YdwfKu66cVRyt1ymc4SFkK3G/CwFjkR5U8/rY6SvuHYVu8QFFK?=
 =?us-ascii?Q?cyL/DZuzyS00dTD7bLiMHJSmsHLmY1zOZuhUquJGXV+zEIc6d0MXnRb9PA0H?=
 =?us-ascii?Q?L3KruYaATmmWHlAIywgZ3cd0P5nU8/C36mHJAeS0ClTNhyGCpP6kQeDv1nyz?=
 =?us-ascii?Q?p/3EzYH0nHqYvkbptx3W3PHb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b8e308-fdbb-43b4-5022-08d984ae7f40
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 07:38:44.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGdoCKxABqov8l7sY8x+zLw1+j5PLAvSpeSnDcQ3q+2RVJwBmpYD8DVzkXIdLQ/grYjFll3yCRKRQ0nfd5G3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 01.10.2021 09:11, Oleksandr Andrushchenko wrote:
> On 01.10.21 03:34, Stefano Stabellini wrote:
>> On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> While adding a PCI device mark it as such, so other frameworks
>>> can distinguish it from DT devices.
>>> For that introduce an architecture defined helper which may perform
>>> additional initialization of the newly created PCI device.
>>>
>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
>> I get a build failure without CONFIG_PCI on ARM64:
>>
>> In file included from /local/repos/xen-upstream/xen/include/xen/pci.h:66=
:0,
>>                   from /local/repos/xen-upstream/xen/include/xen/iommu.h=
:25,
>>                   from /local/repos/xen-upstream/xen/include/xen/sched.h=
:12,
>>                   from arch/arm/arm64/asm-offsets.c:9:
>> /local/repos/xen-upstream/xen/include/asm/pci.h:127:46: error: =E2=80=98=
struct pci_dev=E2=80=99 declared inside parameter list will not be visible =
outside of this definition or declaration [-Werror]
>>   static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
>>                                                ^~~~~~~
>> cc1: all warnings being treated as errors
> Ah, this then needs to be
> struct pci_dev;
>=20
> static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
>=20
> Jan, as this is going to be Arm change, so can I keep your Ack please?

Of course you can, and me having said anyway "Applicable parts" makes
me wonder why you ask. The ack clearly doesn't extend to Arm code; I
can't give (valid) acks for code I'm not a maintainer of. This would
be different for R-b, though.

Jan


