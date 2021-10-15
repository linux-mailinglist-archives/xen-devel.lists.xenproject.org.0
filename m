Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229B42E8A9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 08:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209754.366298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGL3-0006zz-NC; Fri, 15 Oct 2021 06:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209754.366298; Fri, 15 Oct 2021 06:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbGL3-0006xf-Iu; Fri, 15 Oct 2021 06:05:05 +0000
Received: by outflank-mailman (input) for mailman id 209754;
 Fri, 15 Oct 2021 06:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbGL1-0006xZ-JM
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 06:05:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7430c45-b872-4972-a42b-331609279f76;
 Fri, 15 Oct 2021 06:05:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-12-Wom85rs_O6-lp0sPlJ3euw-1; Fri, 15 Oct 2021 08:05:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 06:04:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:04:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0349.eurprd06.prod.outlook.com (2603:10a6:20b:466::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 06:04:57 +0000
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
X-Inumbo-ID: d7430c45-b872-4972-a42b-331609279f76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634277901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnKhTDzgIutueOxd2mLKdRAqxYiNLRUN8boDLvtgmbg=;
	b=cdAoctuHRoAu3XXPbbGgnbc0d4neEJX65i+sWmnkvaO89T0LiNPV60PZQ0wlYLEgYbQam1
	DY3xJYqNlgfmtJgMeddJOeGvB13/P4tf1/P1RwjMt31ug7yPFofdHeXkUkNLkKIC3rDHwR
	Te2QgNr+edzSpdvZecKXL1FcXdOUZuU=
X-MC-Unique: Wom85rs_O6-lp0sPlJ3euw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm86GlhG3iHfcYNeIDPek9SyntzxFLe5IMS/NsUOoY09n1VM5yz6b0ArOykCI0DHKB4oPyLyW6tTeMzMO5hN+qKLIeEsZL0uehwb/aoepWs7RWBPv4hX1MKgn5DsMEhwlDpEHJ3Al/Xt6bdHvAAypOrXNa1DvlKxFhfN2B4qzEjWqZprTl2DoWfru7aoguoR/kl2M0A4zImbjl1HD+u0xN0KvNHWr0+8zl2Z1GDrJfw+C7qhsj886D5bsbfG3414r3rk153YyiPLX/7UjdFVW8cq2VMMxraswqV5QifdiJOoRMVAOviSYkzbGXucNk3AdbZPfHHoR6+XkVnHDUmeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLRHXPXXr566Gt+/J//2Bwutf5X9i5kKPwveis5k6dQ=;
 b=MW/1ldwaX9J8Wa3TuRAPLYpYeXPreAcbk0g8HoJCCNLhKc6PY1Uh4Uz+IuM46fDnutXTAygopp1+0mn5tvlQQhVLJZ9SO2pHeYmN68QrfpMtPXdOXRreLlZwba4VWjFOsG7BAwyR35jZ4ZJKjYF/3QyPoJk1ABvGhheUcpL7xH/6U+D36lDb7JjpvP/ybHq/h+Soknfg76jVAHLvHSrfw4PYTsaAY9u+RNDW0yoTFo11V/OQmhK6lVBSDT5y1j86ziJhudhjXXw19I1KqLI7Gpthw9vpHIcKC5oHwvTnZtS+pkIemCGSFc1pyaADL2w3jWpfiYTPzb/hvdwuXL+b/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 03/11] vpci/header: Move register assignments from
 init_bars
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org,
 oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com,
 Artem_Mygaiev@epam.com, bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-4-andr2000@gmail.com>
 <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01ce921f-cbc1-9524-0edd-47665b5db82c@suse.com>
Date: Fri, 15 Oct 2021 08:04:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWbkZ216FbV8lBns@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0349.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea6cbf8-1659-4b2a-9b54-08d98fa1b7ca
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39357995E7D3F332732FB8D4B3B99@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zw/QvkblnkHQJlDUTBQ219/EHMfhm8jaVyKkLVmGuJ77VlfoRZKc/CqADH2YKSo17J9tiSkGI584jlth1wQE1JyNV3moe4DuGQ1bvD23YeJt/uUA0ODHFGHas/pTsi34pV7FRJF8qUIWwoWo5nFMhcy4jvqBYxvUoi7Fc4rIOek5JeSluQg8zVh677NkIC4Brk9w6dHucudgySVomid7DbfhbRBVJGz8cbrlQPI4lKTbpc/sts9mPmNpUsfhXSjpkTvlyYkSZIRemww8MMLWk1+DtBZXgd5tVEf1ttVfZUsEU+SOF1oLt+1+2hcAi/LQK11hNFHxxJ+WihEIJXlkVJrcnbE3HkPak5hI3TiZkBEZag1wag+P26jFP41GJu5/UlNEL3SR7ZKvZdAVsDTlLBrPlPsHG0oOUlzdMEmiaUxmkQUoQOgrVGBltq5HDDTUUDBMfxd8sXMlJjXQNhSS6iZXRZER811kMUFfO2bdzfrz5odGppgyaxMIRXMBF/rn9Ofjcoeh/J0d58rBXMxucwY60hd29qz1L0aup6lC6w8OqX7gDIq4QQp2lsORX7Dd+yMM217mH7p8kP6XNcn5Q2Go+SY9HbL/KcviwelgEnCiBmbHjsbhv1G0JYHk/wSkqEXsvX1vyXW7z9+eh7gv3qtj7s8+meCNBguxwZmIBW1uN25bjaGEATQVO6QKZ1BErIL0WH7rIZjty7ccnn9tLn+ZGxsUp3WB9Z5bmduoWR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(16576012)(316002)(54906003)(6916009)(7416002)(31696002)(4326008)(6486002)(2906002)(4744005)(508600001)(86362001)(5660300002)(186003)(956004)(8676002)(38100700002)(66946007)(66556008)(66476007)(8936002)(36756003)(2616005)(53546011)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hfy2RG1BWj9ezOUPjza7hdlLau3wO7xzYJJkx4/CZwX3zZC971BqKgV17vs9?=
 =?us-ascii?Q?M8RKK7HR+SbElYaf7Wt8Yr8pbGsDCB+HhG6BgkW4hUPqm/3Xpv2Ht7zd6h3m?=
 =?us-ascii?Q?CXZzSOhulsk9UHFpbzyliE5/tkVVru4BC789/f9/QIvmm5py8Qvcxi6ioBRs?=
 =?us-ascii?Q?awO1IVDGLRIP4VChnqvS8l9aIaTSalxfqfv7cPSoqUEkzUEnX0eF9GjTZnDT?=
 =?us-ascii?Q?fdoiKaLi9rQk+q7ynjczjnfs0GOW/alEIFedYvqJwUsy9lRuAAHFOwGB6HSF?=
 =?us-ascii?Q?GWPGBPW9iaxlNxq3Kx6cpJKN0Ug4t3yFRbGKygQfnzLEtUAhBF0tundYloJb?=
 =?us-ascii?Q?e6nnobjd/CwA/YQ5DP2EXo1xiF5paLodXr1DysCYUfBPm8XqIt7MSsdmzo/n?=
 =?us-ascii?Q?FpWFZY6JWYX98vlhpsREb/5N/2AtP4eqBVnZkmfTS1NElAniY/Y5HHDX6kzx?=
 =?us-ascii?Q?NakkSycBKtDuZP2sW1eugbS9+epknzlSOooCNaUYggeRlDBCouTJwbBw5g8m?=
 =?us-ascii?Q?sG799Uikl3MJCDi3j6l56qIzx++9in1B+MOxGL5W945zD1Jhdxp6kgifwsaw?=
 =?us-ascii?Q?29xsQFz+23NO3n7DsE9BnMT/+Y/V0GwL0G0kapGO3IRy9otLFwNdBbOTCKD2?=
 =?us-ascii?Q?X4BM0AR6V0Prt9Yziv6hlCiGz1tdf8yPTCME4kVzo5UAzw4BuGR+csCPRudH?=
 =?us-ascii?Q?oSVE672g9bain6+kW5TSGYpcLTOMSsK2mAsd3NLWHvDO4t7C0NQHBrIkQ9Oq?=
 =?us-ascii?Q?y/itiZ4VfK9PN/LqBAhtKhW9SKGERHqdyMkW3d/SDqRp2uqQGfAbGDE/kFo2?=
 =?us-ascii?Q?Ws8qtMzKFIYplg+q2RBXKDEMImOoFFZzdNsxnPv4Uje6UW80CI/5fIwXEur5?=
 =?us-ascii?Q?OMto7YB0SN0Y5jowiyCE9VFg49KAwmPN2wDhtOqWPY3lIOFy429upNlfjPjy?=
 =?us-ascii?Q?wCmOhvmmH640QFjoaexocYfJiLvHC1D9VmYe8nij502T9Gn4OxlDkxXe3vi4?=
 =?us-ascii?Q?mSRjP4bjAwbReHQviR2npmnb1jYTH8agIObZPGUQjeJ/14xzH9iLFhVhVyhF?=
 =?us-ascii?Q?uA7803pMEC+v52reQ95RSWdN8VFY818MS0d8QjyozK9AOiI9MR36p/+3rrxS?=
 =?us-ascii?Q?BEyo+STMixSGpM/aErPwM86Wfitd1BHnXbmWH6cr/y4wK65nizPv7A1Wqojl?=
 =?us-ascii?Q?4FS3C15UTdDbQ+xXou7FI0oKssawUyIe4ZxLcG3nAFy/Jh++HkmgM9gyGWUw?=
 =?us-ascii?Q?N0oiby+TKai/u5BhRB4v2ghK6g9PouTEZ5Lq/MElYAUS/xmnv41roi4yroue?=
 =?us-ascii?Q?oIOUddaLSadcI9e6h0SmQ5zb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea6cbf8-1659-4b2a-9b54-08d98fa1b7ca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 06:04:58.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPNME5KqISYS5nrZNY2snJpa9RbnMQzFi0KOMC5BIuvvWemHgPwohE/w7r9J2KARGVrjvu2h3+NRWiKZwmedhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 13.10.2021 15:51, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 30, 2021 at 10:52:15AM +0300, Oleksandr Andrushchenko wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -445,6 +445,55 @@ static void rom_write(const struct pci_dev *pdev, u=
nsigned int reg,
>>          rom->addr =3D val & PCI_ROM_ADDRESS_MASK;
>>  }
>> =20
>> +static int add_bar_handlers(const struct pci_dev *pdev)
>=20
> Making this const is again misleading IMO, as you end up modifying
> fields inside the pdev, you get away with it because vpci data is
> stored in a pointer.

I think it was me who asked for const to be added in places like this
one. vpci data hanging off of struct pci_dev is an implementation
artifact imo, not an unavoidable connection. In principle the vpci
data corresponding to a physical device could also be looked up using
e.g. SBDF.

Here the intention really is to leave the physical device unchanged;
that's what the const documents (apart from enforcing).

Jan


