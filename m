Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBF4345B5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213579.371850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5lU-0005FK-1O; Wed, 20 Oct 2021 07:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213579.371850; Wed, 20 Oct 2021 07:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5lT-0005DD-U4; Wed, 20 Oct 2021 07:11:55 +0000
Received: by outflank-mailman (input) for mailman id 213579;
 Wed, 20 Oct 2021 07:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md5lS-0005D7-7u
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:11:54 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 248a5d45-a263-45d3-ac0d-9fa39f983972;
 Wed, 20 Oct 2021 07:11:53 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-JdXkZSJQOwSuTmsO7sYNlQ-2;
 Wed, 20 Oct 2021 09:11:51 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2608.eurprd04.prod.outlook.com (2603:10a6:800:4f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 07:11:48 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:11:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR0502CA0057.eurprd05.prod.outlook.com (2603:10a6:20b:56::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18 via Frontend
 Transport; Wed, 20 Oct 2021 07:11:47 +0000
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
X-Inumbo-ID: 248a5d45-a263-45d3-ac0d-9fa39f983972
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634713912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GDKp28/EvKyqfxGMN/hZ9fspLZSxvKmMYDZBUutqs4o=;
	b=NjDuq0j6zpCgQLc8QQk+/uJ7av9hj1gGS/CUFSN8jjr+zymtF5xD9yeO0YfBgHNUaSNjwU
	kYxBqH5gTSDpd4CsZ5J2Gz5/Q7iYd+3czPGUUJnHYpTR+JagngLxh0W2gC7Iz+xcAE3VkC
	Vby3ItpgF3iO5ViPSj1khzMIcq2m7Ms=
X-MC-Unique: JdXkZSJQOwSuTmsO7sYNlQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMjyUEKgVkbmj8GTGCJ7Ge3Oy4CJZMRuZRkl5mW8LHH8dGunT3qW3IFBZlHZksTmosSoJwUmfeFHsxmYWkfODpDUZV88BYNGnQ3RXHKBQkEGoWyTA1/Pi48nWMIDMwzSKQNXapsQo+aAb0ae0gj+j1l/fnDJc3atsS2MHX6jYz0a+TtcbQ9PjmAiiRCnWyYA5vhalNVyBfMXXBj15EPUuyGFqZFu97PiTa1lkKTicHzqTVf+Lqka9vwTNXZI6ye6FwxxBF1Dkdo7dJiVjpMy8RL9EzEgtjd2XOTtBULW8VAiQJlhec2EHpcQi6vlrr7HKMcVklY5ecrGnlQS+ssDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5ipr5uwL1Pptdu0/f+Uq9KEb990eKtnBM1P+A+UXq0=;
 b=cXI1Q01M/fHnVHgI/FJsd9P8DuxuPfeywTfnvM8qHo848mIY0tU5TfUw5CEDCZSvAl8ob36pp9x/QboJy5N7fWouaqnMiYE00trwHDoFCZVFXVoDfMW0CDlvUbqkckOwZTSMYGyb6IOkOl+5FnEu5psAvP2MYFw6RdrQRpI69TffkXps/wXyTW6iYDUpZInGcid5KAy/zwT4g+2lTr4TpYocZSureyzRujyCsbUulppWwJ378BdOXiyDBsMC0oIgtHsGaA5mM48DsqUmPV+zO3bMhQw5CNPElGbEjBl3wZTMn1a8KXU7LMjlQJSwurBlwCVs2QHSNTiFM35Y9uFUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
To: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
 <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
 <c7f5e7eb-7558-4812-0a5b-d02683396704@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52ccd0e5-249d-658d-aae1-c28ced7e1314@suse.com>
Date: Wed, 20 Oct 2021 09:11:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c7f5e7eb-7558-4812-0a5b-d02683396704@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0057.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05616498-1226-46af-783a-08d99398e1bb
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2608:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB26081AD1C0B5B3A8CA78334FB3BE9@VI1PR0401MB2608.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jGFGOI/b0MdznhvJlqnmxY5Ya989bYQnbPSBZbnDOsRKLLmlVpR4dSad43odHU8BmQN4eJQWhOm0pOIU87iYzdLFilrwi0XJvFgZCKmib7NWqSPe5AgVCc9UCFgtzglxVwRbhg0aTayvowu4znNcuDunZTUslr4UaQTfMMH1DNk+xL9pZCnTLsGK/ttMBsUSBZI4fK5mPZp9/PaDWwIVeCAAFEFvFnRF6LaiqJvRdqtOBTO+DnmVDU1b9Rxlx4/gzJbeqIOAHN/MrSGJ+3bZg5mK0dg6bYe5InDa4dW/i7ObZf1YoLMMad6lrHpbRxR/RTwvLrYz7nuDVI8jNi+UDornf4pvBHEZKll9lGT3vPB4T0UMKplOKAP6Ohj/SyniNOPtJ+VAauqEDLkOE2VXGusiMaewwiXy9LNvyXYi+Z1+0mr851qDL4LF4D/PoOFfJyGeps3pt8q8FW6kuDLoUN4ENZBGrmQKK6/vDg14jfmqzJeb5sRjTqALhU1Dztw7tlVZFCdQ/rQsAmhq+xdzkcl5f4MBowzBoJzKecYaitF1xTbJYQ1/Nn9fLvWh4zWoRd1AtTUQiWoDOHE6YlnOhdfR4pYFE3zh81y2ANBwY4y7yQAk+kAQ5r90gVLiCZjEAjUlEK8MJl+d564cd3tNa7Kjdly7UfbekdPAgy0l94raGUokCR+G4AoBx5kypN2/dG9owuPIaFiISGcNcDcnJaDCKaYjT1QL0z0QyoSuW4+cSmkRQYJ43rs98Dxt2ORC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(66946007)(5660300002)(31696002)(53546011)(2906002)(86362001)(6636002)(6486002)(37006003)(66476007)(66556008)(8676002)(8936002)(31686004)(26005)(16576012)(956004)(2616005)(6862004)(186003)(316002)(38100700002)(4326008)(36756003)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CgssshSr8YISMyn9/f+reBR1daR+D4irnW+/wRPNkHf6MXmu3bXPM9h5LZvC?=
 =?us-ascii?Q?gqiHv9QSmrHTjN+7ikobyIN9vZ08OufBDYv7SgZcW8yFEg3prg0nlHqWMbzE?=
 =?us-ascii?Q?In9FErqd6iXc4jnEF1BIzDxHmDhdTkxp/PDdzCwZ2Pi0B/z2F3Ve0lFDLmBu?=
 =?us-ascii?Q?3L420fUq9uEKgidELQhAb1MadPRm+yoEppngyjnNvanONiorWlFGQ9VUcjh4?=
 =?us-ascii?Q?8ojzcyBowNuc6io8v+7MxFFovjlB6dkl3FgSR8t0CdnWWxeBUzX+eH1yfJ6Q?=
 =?us-ascii?Q?WqXkZkLNN8x7lQ75sQu47g6I5Fze7nei2VAVDYLr4F0xiwSEq10/nripi0bg?=
 =?us-ascii?Q?uACr4NS1cPGfZ89Poyk/plRTFIDKImHSzNvHOPcHHF8vrWtT+lDos7exyid3?=
 =?us-ascii?Q?IE5MNexSgEk8uz1hnkmE1weJbc6cedffgPmkUfrbQuLa95vJGw3QM5OzFvEu?=
 =?us-ascii?Q?/4GUOsoMle3TiVRWz5ELktu+ZBnMLKeX9bquiPWXgA8+IA7q6+0YOM/uZOIy?=
 =?us-ascii?Q?Qk0tnjyvakGLVaqWpk0YgM4a3x86EspBH5k5nOymCU3taqinSvw21ThLcvmi?=
 =?us-ascii?Q?+e4JxZFwUCPp9TWdUzsOEbgqRwrODHbzXVyzDXVIYLEiIJj0DCQraxN3LMUv?=
 =?us-ascii?Q?3WWpXUsM9CQzgUiA6dvSLDl0CjN9d+7J9rW0vcW0jXNIYYLNDYftDiFXkvyX?=
 =?us-ascii?Q?lsY423UxcArEAscwRhy1C2gaFx6Mz8JSBXJH/WpJS9nH6s6mtpAzqCtgeevT?=
 =?us-ascii?Q?4qhxXwa/lA5x3Nl1qQRFv0L9dn3fUQ9LqkDUAh+bvQqrA1pI+XQYZsxKrjyZ?=
 =?us-ascii?Q?wW+F+pdMzvi6uNn6o02SMG69C5UDwLHwZTVLoLxt129eizZQcZQ5oXtsJCTG?=
 =?us-ascii?Q?Jau2s2mng8+TabLI1ZVm/V1MBybc+2jOFaoWHqsdIkt3Qgumu8WfFVAXPhVm?=
 =?us-ascii?Q?oucBeT3qxoiDYzMQrQt/iIxeR4Vcl0ZcSjH7F5ogVsyDri0gBlYvqC/OguAd?=
 =?us-ascii?Q?3nfM4LfRKRwkTfCw3rp5qN0AgcjVaThzH6MTc0HmjRgxdMCofbRyoAFj1WOy?=
 =?us-ascii?Q?nqLNBJSoZa2hlJGCZYaSyC5Nqk6Bcth1vkyVFG5OZLBwncTXEB5yuawAwlOM?=
 =?us-ascii?Q?KzuRLQFT2WojYkseA8w/b5UGiwosG4OCe9kADyjvGUQYTdB7J8tj8bDldT27?=
 =?us-ascii?Q?3hF5paa1v9qugutHw7n7SFS1hilS3Zu/GLuvF1/VpEZd081Wr/9+1gBynQik?=
 =?us-ascii?Q?4Hjg3sqJwMnT4Zknyo27g+j2hVDxKjbDA4vAGP9l8ygJ/kccl30kp8d073Lg?=
 =?us-ascii?Q?hb/PrUFC2/7O7lCM1gCAaB/aoB0O/+pMrI0+dIF4vu792I4/uWNe8LUFwzzE?=
 =?us-ascii?Q?xmG2rd0Pd/bzI4/xc6uzbSv5ioiggh9YeJ0iymzAyOkI5lFDog11bwAoWFHz?=
 =?us-ascii?Q?8FNncVsNUOA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05616498-1226-46af-783a-08d99398e1bb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:11:48.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2608

On 20.10.2021 09:02, Juergen Gross wrote:
> On 18.10.21 17:28, Juergen Gross wrote:
>> On 18.10.21 14:58, Jan Beulich wrote:
>>> On 15.10.2021 14:51, Juergen Gross wrote:
>>>> --- a/.gitignore
>>>> +++ b/.gitignore
>>>> @@ -332,10 +332,12 @@ xen/include/asm-x86/asm-macros.h
>>>> =C2=A0 xen/include/compat/*
>>>> =C2=A0 xen/include/config/
>>>> =C2=A0 xen/include/generated/
>>>> +xen/include//hypercall-defs.i
>>>
>>> Nit: Stray double slash (unless this has a meaning I'm unaware of).
>>
>> Oh, right. No special meaning AFAIK.
>>
>>> Yet then I wonder: Shouldn't *.i be among the patterns at the top of
>>> the file, like *.o is?
>>
>> Yes, I can do that. Probably via a separate patch then.
>=20
> I can't do that, as we have one source file in our git tree matching
> this pattern: tools/libs/stat/bindings/swig/xenstat.i is used as an
> input file for swig for generating perl and python bindings. And the
> .i suffix seems to be the common one for swig input files.

Ugly. Since we have a rule to produce *.i in xen/Rules.mk, I think we
really should have these ignored. Perhaps a good enough reason to put
*.i in xen/.gitignore? And while at it perhaps also *.s? Unless
there's a way to specify a pattern for an entire subtree - it's not
clear to me whether xen/*.i in ./.gitignore would cover subdirs of
xen/ as well ...

Jan


