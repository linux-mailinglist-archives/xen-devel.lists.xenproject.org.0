Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E5431FE7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 16:37:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212396.370252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTle-00031N-QE; Mon, 18 Oct 2021 14:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212396.370252; Mon, 18 Oct 2021 14:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcTle-0002z0-N5; Mon, 18 Oct 2021 14:37:34 +0000
Received: by outflank-mailman (input) for mailman id 212396;
 Mon, 18 Oct 2021 14:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcTld-0002yo-2i
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 14:37:33 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11ec28ef-53ad-4d86-82e7-350e3be86420;
 Mon, 18 Oct 2021 14:37:32 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-30-aMMsglb9M8Sxq7tCMiGrTg-1; Mon, 18 Oct 2021 16:37:30 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5903.eurprd04.prod.outlook.com (2603:10a6:803:e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 14:37:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 14:37:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:20b:311::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 14:37:28 +0000
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
X-Inumbo-ID: 11ec28ef-53ad-4d86-82e7-350e3be86420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634567851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYjnVbrOhzDxKhw0di1UZRg5iV3yoY01rT65162/l4I=;
	b=S89OYAIHdsIs/HbcGvETsPNJj9nQWlJjEBHQXuM7jyzKa5cQLnU5j2TRxD6OxpiEnu6sMf
	tC/JynobVF/OHWImHdzEmBhGJiFYIeG/QVYZMKhjB7LbGXE9m+sejN0w6OocftyPjuUC/z
	BELhdPEkGYgexlKV1Rsgfk6mKe5cT9o=
X-MC-Unique: aMMsglb9M8Sxq7tCMiGrTg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7af2cOsPFseG2NXSm572PpIHHgnSKqCO8cH4JcdHteiFt0tV2OLrP4sfymTr38wmRxQA0EMd98Q5x81IKV5LC63lkOxpIra66xzZOmbeJAMX7gDm3Gja4ZtpbrzXiwJQQupV2EEDFmwY6Urb4y0zkAiuYMFHg1XxoT3RrbXZL6k0LnczkUPO6q4j4ReMQ86TomBoQK5WuEl0rh7yOE/MIzs/Ghi091bBt8ui9xw3ti8lpE9wF/gdgpoBnUr0I1NNDmGEBeJUZJxBDD1cmP7FNPeDmZ8pYRHcgY0049js/5x/zYv0yswR0MdaWD3ZI9MhncgdM+AIU8A330uYf8Byw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYnM3Cx+t/POs6nJpfu4JnU+GlMJPoe3IG/zUlueIVM=;
 b=B6jNuNXsIIF7mr3002b0iXEQoCYBi40knjhCxxKsdmUhCKxcEFhZ0Tt5emYKUGmWBWgLosrriF9+izzUKg8WoBCbxv8sRd1YOEuEoowof3J//GStgN/f7FBQQcH/3ftT7wsfLNcojnb8WohFK4aiqfCyUiaTx3t2S5I6ThdUsu1Ezrw+1QumBd9HIzaA/YaElmTl2DDrNDkxhhRzEqAhnlmuQYJYu00AaFY2wGIfcvFmXP/I2LRHy/kGJN3jeIPpXVT3/JfPKta38GJCoCLPPuogfoHbTifziNW+IQJCtk6p71hs99x25vawsrnG1HxJ2y/kOkqcrvh+TXO5fvVAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 2/3] x86/PV: replace assertions in '0' debug key stack
 dumping
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <2a14f2d0-2a53-287f-da36-dfb054c7f944@suse.com>
 <5ab88195-660e-5d73-cc34-67734ae161fa@suse.com>
 <YW2EJaZ4DoR6ptp1@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a9b77bc-3637-e1c0-4a8e-63126e643aba@suse.com>
Date: Mon, 18 Oct 2021 16:37:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YW2EJaZ4DoR6ptp1@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::24) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9677b6a-563e-4adb-bdae-08d99244cf86
X-MS-TrafficTypeDiagnostic: VI1PR04MB5903:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59037F214242DF002DD8FC6DB3BC9@VI1PR04MB5903.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	syDubcmc5fVYj2BADgW086KOl5pjmWJjkW0dNEVTo1NvF5Hm5zG8rUjv1pciD6t/NOhDR5gQMijeIGsmWFe5YAb6tVPAndQDhk5QXN9y9PmyxDXSH/wzBHK842kO10CqIGKT0hxHm3RG+9XKJIUYTQkS4rFzi1Yhze6M9sJnmIpn7aoS225DcY8NbXIkHWReiuy2uUvnWf4fSDNOUdMCtYWFPF2DOwiQNLx4Luv8r+IqHU5seoG1KZQ2A9754/k4wg+rmwIjk5RiumOLqQ/uFqYZJ7VdKqnSMadV6wrIyogx4t0DdR4P9eE9Nx3bENPS9l2s0uIRieu7jlI+CgRYtySbvYdoT6I4nLjFgP5RZUu88edA+va7Ll9L+rNrTW2emPPs24XBIt7ULb0QpJVumO4JShAGZ588ceJ3hSngvGaFbEwlf+8FQUAq6fvCbpC43/CFUz7x8sbJcOMNglwhzMtj+jkQAJzQR0XEBX1Fx1GVUJ7iEQiZrirwYVI13SA4//lFBX5VMkwCxFcmtQrMr8N4Pkwc97etAPLPS2LA8qL1zy8YwVmLxqxCKZozc6D7Vwj2kWJr0HuVeG1H960ZIeDhZGTTeDhXFHLtGSaaDGpWN4L0ZDjKvJ/CKFyLADCThiGBQQZ/ppL7JZ0/qlgFH+gaVYd1LPXfrJobVQiuC9vZ00KVySAvNbxgAaPsU1Dd6osxJXQUQXEk3tKFTi/euyyc/SVtXn5UEc4uot8+6Ar+TpvqrVDcvG/eeiykAHAQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(53546011)(5660300002)(86362001)(31686004)(16576012)(508600001)(186003)(38100700002)(26005)(2616005)(6486002)(31696002)(956004)(2906002)(8676002)(66946007)(36756003)(8936002)(66556008)(66476007)(316002)(4326008)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?agz0rMgCM/4+Uc7827AjEB3Lk/p5pVDoM6zcPAd0Bve8Hmxnk4H+tlVyDqPe?=
 =?us-ascii?Q?7CFk44Imd/P/lvXUw9lAJ7gq4xCmfhOwpEko+3/9ntrVitlXIzQJON+Px7Vh?=
 =?us-ascii?Q?mYMXdQLIuKWcbZBVbldKqfe4DzQcfMFRblvqQVqR3kCMMyh01+LCB3DxvYo7?=
 =?us-ascii?Q?NzZV0dxiArOkhAQU89F7TZXGL6tBX711hTq/cHla17t1rTmcvGRSoRw0zgam?=
 =?us-ascii?Q?gPP+nbRUIEjX9lP57cpAFXuEJhSI+euz5X/CDjdEcMmz9gl9nvJH38OIuQlT?=
 =?us-ascii?Q?0v8ZFba0MWyZLramHu1KebuTA4/2ZMD9aABJVzLm6+sgkX8s3F98GhZOkBob?=
 =?us-ascii?Q?Ge+/STt5sDGRAH+qeZj8luXTgtyiNht+LKWedCiIOr/SH9XagBNUlYrL4lmR?=
 =?us-ascii?Q?DdjzsbJFduHJ3aRY+Ed3hGccx/z9magsSL+ndqOBFvJlulv211ItGOxjqVN1?=
 =?us-ascii?Q?FxsHTrFBmVamrDaNkwDGuSbJqBHzlchBUcZCDJ6yTO4X2tjQ4C7qVVMH/RUL?=
 =?us-ascii?Q?LkJDDqJlf2DPDPEupjR/H8A+YPKx629YVW2fOH/OUJrK/1BtuM+LVB7FaQKu?=
 =?us-ascii?Q?gTyPIcIj2fcMICtSU9nGbNttNrv89AeXBhtySjv7gQkWY38PHdYeRSBigxUu?=
 =?us-ascii?Q?p4KBgm47u6UmlYAGkcwivF09yb0Leol5m1tKkWk+D1Jy7saMgY0yuQq3FeNG?=
 =?us-ascii?Q?FxUVE2No/xkQ1hmLqXdsL3nUoV9zYhhNh+9IA5HL7rGdgSCJ9hyG7WcKxLmh?=
 =?us-ascii?Q?TERDy6aZA4O/1s7WFgFVyQe+lF6m30e/aAUoaIwVL91Iu/Qi7dNUNnXxuPFO?=
 =?us-ascii?Q?7epi1RYS8raGnhLCibsRXglB6YE3qxfz0ANq5WPSqHG1Nwy6LeZG/QspuSJG?=
 =?us-ascii?Q?xJLhoaTzHbRw5HgUUNgRGVzq27mn85ClbheDzKCB6tzY3GzM9NfKKi9ikora?=
 =?us-ascii?Q?w8CN4eQnTgd/nVw4AfN6mZQRc4xX32HIF0CLnZ6Z/G/reNme/Qcfx4c4aCZJ?=
 =?us-ascii?Q?MpDF1AN3e8qO9txDW2bGx0iuAB1nnIf11DbVORp96TNmtYC1OnuKgNxUTdg4?=
 =?us-ascii?Q?ZPt9bYzdJmKyudqsBU69rBx2i7vKPUZoepdkzMgXm0l0hkYV5IhfphKW0JlL?=
 =?us-ascii?Q?CiDBW3wT7GqBk2ZUAjl3PabJnzHGqRBxyntL6jhsWH20d17euiOWfTN4nt19?=
 =?us-ascii?Q?9zcFjOBzYyCyZYTq2O7H+ZmEA6ouHs23YA8R6LXS6FJ9o48S8w2AJ5YHAl4C?=
 =?us-ascii?Q?3bra6ULv1zPdZW9VVQnZUkvBVXmkfl3qNEErcwQmpdzJP1pe5OcVWR3l4zEC?=
 =?us-ascii?Q?YD+uQz6asiZ+vISfIW08Brd6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9677b6a-563e-4adb-bdae-08d99244cf86
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 14:37:28.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AchZPzcykyGTkb8/YAIy7yIDkTNP9u8YAPGvPqFaIZ+sL2m4WT/rM6Se6jf3UxnKXQJxrtJhwLlzJOrC6pcUrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5903

On 18.10.2021 16:26, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 29, 2021 at 11:42:54AM +0200, Jan Beulich wrote:
>> While it was me to add them, I'm afraid I don't see justification for
>> the assertions: A vCPU may very well have got preempted while in user
>> mode. Limit compat guest user mode stack dumps to the containing page
>> (like is done when using do_page_walk()), and suppress their dumping
>> altogether for 64-bit Dom0.
>=20
> I'm slightly lost by this last sentence...
>=20
>> @@ -328,7 +329,12 @@ static void show_guest_stack(struct vcpu
>>      {
>>          struct vcpu *vcpu;
>> =20
>> -        ASSERT(guest_kernel_mode(v, regs));
>> +        if ( !guest_kernel_mode(v, regs) )
>> +        {
>> +            printk("User mode stack\n");
>> +            return;
>> +        }
>=20
> ...as you seem to unconditionally prevent the dump regardless of
> whether it's dom0 or domU as long as it's not a kernel stack?

Well, Dom0 comes into play by way of me talking about debug key '0'.
I've replaced "Dom0" by "domains" in the sentence.

> I assume when running in PV 64bit mode user-space could be executing a
> 32bit program and hence Xen could then misprint the stack as a 64bit
> one?

That's not a primary concern, I would think. The real problem is
do_page_walk() doing

    unsigned long mfn =3D pagetable_get_pfn(v->arch.guest_table);

first thing: No consideration of guest user mode here at all. And
I didn't want to teach it without real need.

Jan


