Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAE4B5229
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272291.467074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJblV-0004Jx-34; Mon, 14 Feb 2022 13:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272291.467074; Mon, 14 Feb 2022 13:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJblV-0004Hi-04; Mon, 14 Feb 2022 13:51:41 +0000
Received: by outflank-mailman (input) for mailman id 272291;
 Mon, 14 Feb 2022 13:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJblT-0003Qt-I4
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:51:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b4b8a17-8d9d-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:51:38 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-iU3JxfesN_iSOvkNODJPTA-1; Mon, 14 Feb 2022 14:51:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5396.eurprd04.prod.outlook.com (2603:10a6:208:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 13:51:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:51:35 +0000
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
X-Inumbo-ID: 3b4b8a17-8d9d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644846698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gR8aTK7xfMZ/A3HBtP43jD+wIrXcFomMIBb0861VdbI=;
	b=cTlRJe5SAx0xrm7GjmctHXQFwm8mJ83e1Im7Ilnt9vNZnyXVbHXX2g8BeqeXyIBX/BAJUw
	dgl6F4lPTVcDG6BoCYCDNBux2h0mq5Sm9b9RjODeRJEEECh8Ckmh+10G51iJyPMOi9xXCw
	sAtamwPOeWWpanV/rSEcSqeYd9Zk2lw=
X-MC-Unique: iU3JxfesN_iSOvkNODJPTA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULCSO2ge5LaqYuXJIPq479ADpdlzOrOB/JTaL9jMHeShW/Qilb0nvrTYpODpoCTStCqJP2YeNPiNBcSaGqaZWRKjOxVj+/K6ySm020R2OglfUvQ06yWz0K7Cy7bcd+s3TKilqyR11ElG82D+YC1dCHQdaJGMbd2HAHZQLKBBRNQ9UwBsXeK8JAFthE3g638ApZe4kNbbNO4fFihohVr1H8YXvuGWfcNaiyyEg3YMIWfF0YlM2xnbfApsLxj4vAIsZxwxjybJW+orYgAImSvuowcOvYNtK5ubAOW57g+zAC0fT/qc2W0qiZh2ozwgMhN4M6ab9Fh6H9BpIj3qnHisjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRSnmbdTEvVtgsmcwoV5R11ubrF0kgeLhDSS2e9TOYs=;
 b=ZpelGDVIPY30vZ0b8zxgBKERUEvIfCCsdt0sJ4hneJooV9MQKbXcBcBgxh317EYJ8Y+7OvaboRDAWkrOnk7bAir2yszckp0K++BUI/Ljpl4ZrpTBS3ZVAorkDl9PEhJF7VeOURDFUNNyAArZ5LYunLygfbwHsTU+OqYrHmx6DN0O52ArkFtstJXO/OvPO912+SDMnhsGLozfojWpQj1l/0kVMVKZcIukZhfRqneqp10eomK+2Job0O/PsyxyicA9hAuU+q6jr2i6uaNlqXLeTwXj1tPhgmnusaLEDuFaQ94x/cLLsntw7VAwbw/Eaj6uXjx3YJkcz+SKcmA12dVuog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <adbd9ee8-46c5-9696-c3eb-3e18b2d60684@suse.com>
Date: Mon, 14 Feb 2022 14:51:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 3/7] x86/altcall: Optimise away endbr64 instruction
 where possible
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
 <20220214125632.24563-4-andrew.cooper3@citrix.com>
 <5d53c6f9-8d1a-3d48-6ea6-14a484d578a0@suse.com>
 <cc4cf340-f02f-a547-08a0-1261bb506bcf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cc4cf340-f02f-a547-08a0-1261bb506bcf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e5401c-7342-4973-776c-08d9efc11db8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5396:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5396CA38F673A1B8BB72C06FB3339@AM0PR04MB5396.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uw2WnkOnQo81rI0hXTlWRFJpdLO66ul124njYxSkbA1lLYxlzPS2+NhhHOcV7/0zQ+zBAKZwJnGbWAf1zHv3RvmTvbRUI6lBOXEJ/+rKCZssrMm40MTinl0iUusc82VvPozDyi4wiUlEQFlbDrCRiPWYhPxNNcU+x3GRobnTJHoRTAh8fptWxUETG4RswPbY2pJiyWFf38bhoSYonukCM90M7yGWI9CehQdOMbdR2tUBqMzcbmZpE6+v71fEYIo4IniWN8Pi+hdHaiMj53UOcy5s8US1TNWiJDdvvtk4YNd+XG1xk4nnqXmUJwy8Lvk1J4AUpgOFFLalunnzvb3M344n8jsHeXCmUK1HACMqH5cS5L3KtyBWQp/sKxfZM7LHpgGFHCeg5dLQIgjXNVx3cposBt0zbpjX0hzdW4U18ith63IoH8U/djnhB7BpsbjIS0ySPDdH/2So2+oXpjFZX3TBd1fCTdpMN/Ul6ijSuxo4YzgF9Dd+JXUvlurvJpMvSc2YT94eoRiKaBTwnWoUest8kXIjHarrBinoS6HA5I3VxM1yOTScaO0+ZQ6b+WvpfN4N804X205Mfh5zes1JeRZ+JqgGh8eDwM/uIyKtdTvgLK6ldMkKgCMNVtWqjGBnl7Kt5KDpkyBBmkSwmKqnixHFwwZw1T6vJdpixVqhPUu5UQwjUaqOtXghAtHLdc3ND+acfHK0Z/gLfRVQE4SJBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(86362001)(31696002)(38100700002)(5660300002)(53546011)(8676002)(4326008)(66476007)(66556008)(66946007)(6512007)(8936002)(508600001)(6506007)(316002)(6486002)(36756003)(83380400001)(6916009)(2616005)(31686004)(54906003)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oxP9vAyN0BECRMvqho4e4R/qQs7GFQqCfdfp9dGoVg9lO9aB6jsvHY/tKh29?=
 =?us-ascii?Q?fZdWvyiLR/kjoKJs/w5eTqHRxOD0wmeVQiLWk1rXveL9u4qwDZXAW7v40LFa?=
 =?us-ascii?Q?hbKXeNzHtAGWDBe4kJUrTk7VApXUSlOfIyLUpDqRvEbYAgdblChSOoNpUvok?=
 =?us-ascii?Q?YNbd+4kbpg1stlvfrdMH2LWY3wNGWuvjmOM1NOEniX/vmjnIpUZUJmwGRw1T?=
 =?us-ascii?Q?k/1HQrde5Bd6YjDADX1Fswf/vU/69XmUmnpGOYm05clzLM0e3tBaeL7XuHoa?=
 =?us-ascii?Q?Pi7B6NlORjBRoOxwJ4aovRwIHXsenjMUQNvPgUkxmKwG9tJo/HBUYnDcyo6X?=
 =?us-ascii?Q?fuvRRcbf4/M3FXaiIiju6Hltbtyh48+JYkKl3AgoYgFAn27nyxgSdNbBZHbk?=
 =?us-ascii?Q?joLyzAZMCuKEd9Nnegl4OlWfWMajdNV0q+OwHephq/NKOLftD6ZLpuJkn2EV?=
 =?us-ascii?Q?gbUdd8tDAliRziyrPo2sK8tyPuIqJp6UccjdKpuoJpFx/b13uwHxYk8nRJLe?=
 =?us-ascii?Q?oixstHcvbSdNZ4ZNMLg32VRuZt4dLRpUmsrEdthdonenp3SomHbLAc5lN8VK?=
 =?us-ascii?Q?frJrdDTJ09q0Almuou733dv/l4AL668Cd+kZdtQXsSMgQeBX2Jz+T+0daXtZ?=
 =?us-ascii?Q?alOF/JcQTR5TSdDznt4T/LlxPhkPfeMrI9lrK2xKLaOVVlZaTu+MAYMh45NS?=
 =?us-ascii?Q?j04c4PscytIEOzZJSBYD3SsCMv7Zn4CEah9GodyBihrze4KFi+A2xfYTWldc?=
 =?us-ascii?Q?lXctPg5hTkcrPqWc4EiC021J12UeYQB6+vwGsf011eYT6yuLLjYhnKUBaNE9?=
 =?us-ascii?Q?0dvnPBwo2HnqjLBIW7QvYYLm0sid+oQ/mDn7qAF8orFffrTwm/A/kTbF3Eds?=
 =?us-ascii?Q?9VEGZhi38iWrp92JvmnqErs3YSV4s9fb+i+kLq+rU2TLx7613SNOdeV/t1hd?=
 =?us-ascii?Q?bDm8rgTUJSM5VFBQSJp/j7RUJ8X2oyXZbsHJuLiJnK6nxbze0tZ0vedXBlsA?=
 =?us-ascii?Q?2z+aO9ptAfy7FPIca0mriMaB+bMUw7NXDJcGLYhKGfZdTBDFhfVlGAS8vtHN?=
 =?us-ascii?Q?kpLtTb/xGWixCsKYWtDcoeHsat/o9Adm0a+60z59oDDjgfB7IByrb9sWVzHU?=
 =?us-ascii?Q?gvO8CMmN1mNqJYQdquC00OBvjjpcaB7ZVNg1oWIbdcOoPMCUqTAkY1/LxYX7?=
 =?us-ascii?Q?UW2yfXP02amXKa74U5SuM+ZZEo+U0eF9BIYugCqcxL4vpxi4SIx5BWWdcr9C?=
 =?us-ascii?Q?i3YLc9wtyDNEWqYv7i5TMYVyhyx8NNvD6IAcfKfH0hYS2/t9TGCPbmMGLI30?=
 =?us-ascii?Q?O7GIBrI2a013O2uwZurwNQmPm7n2HU3ne368t2ZfTj6f1a67mUv2UNEDM2mF?=
 =?us-ascii?Q?U5aYa/ZRCOXZufhUCvu94OcoxOKylXkh+iE0d7CSqwyiLS0JSAMmrB2/6Q8C?=
 =?us-ascii?Q?i3NBOs7mvLUbwBx5907Fixm1NzN+Q2s8EmR6D9Jv5Ss1Txxz2UQ//TKbn1/9?=
 =?us-ascii?Q?X8cnG1iyebDm9G74+NAZq6XTZ1BhMQc+aD72GDsGr9FhZZ41poHJlt0WmQ6A?=
 =?us-ascii?Q?2CdYq+Tz4LMMIlAE0jrAXXyQUu1OMOUxw2Ua+4It6S1s9H3wTqsIxW0eJopJ?=
 =?us-ascii?Q?+TTJr7JpgvB76ZmWWM8pbIA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e5401c-7342-4973-776c-08d9efc11db8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:51:35.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXbr6zHwTjcpH8JJB+uM9wvBy17IE/t6U69piIfW2K+bg3djo0qkOUeHATB7CuyuzimzBF6+bo3n5pgSPIaL5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5396

On 14.02.2022 14:31, Andrew Cooper wrote:
> On 14/02/2022 13:06, Jan Beulich wrote:
>> On 14.02.2022 13:56, Andrew Cooper wrote:
>>> @@ -330,6 +333,41 @@ static void init_or_livepatch _apply_alternatives(=
struct alt_instr *start,
>>>          add_nops(buf + a->repl_len, total_len - a->repl_len);
>>>          text_poke(orig, buf, total_len);
>>>      }
>>> +
>>> +    /*
>>> +     * Clobber endbr64 instructions now that altcall has finished opti=
mising
>>> +     * all indirect branches to direct ones.
>>> +     */
>>> +    if ( force && cpu_has_xen_ibt )
>>> +    {
>>> +        void *const *val;
>>> +        unsigned int clobbered =3D 0;
>>> +
>>> +        /*
>>> +         * This is some minor structure (ab)use.  We walk the entire c=
ontents
>>> +         * of .init.{ro,}data.cf_clobber as if it were an array of poi=
nters.
>>> +         *
>>> +         * If the pointer points into .text, and at an endbr64 instruc=
tion,
>>> +         * nop out the endbr64.  This causes the pointer to no longer =
be a
>>> +         * legal indirect branch target under CET-IBT.  This is a
>>> +         * defence-in-depth measure, to reduce the options available t=
o an
>>> +         * adversary who has managed to hijack a function pointer.
>>> +         */
>>> +        for ( val =3D __initdata_cf_clobber_start;
>>> +              val < __initdata_cf_clobber_end;
>>> +              val++ )
>>> +        {
>>> +            void *ptr =3D *val;
>>> +
>>> +            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
>>> +                continue;
>>> +
>>> +            add_nops(ptr, 4);
>> This literal 4 would be nice to have a #define next to where the ENDBR64
>> encoding has its central place.
>=20
> We don't have an encoding of ENDBR64 in a central place.
>=20
> The best you can probably have is
>=20
> #define ENDBR64_LEN 4
>=20
> in endbr.h ?

Perhaps. That's not in this series nor in staging already, so it's a little
hard to check. By "central place" I really meant is_enbr64() if that's the
only place where the encoding actually appears.

>>> --- a/xen/arch/x86/xen.lds.S
>>> +++ b/xen/arch/x86/xen.lds.S
>>> @@ -221,6 +221,12 @@ SECTIONS
>>>         *(.initcall1.init)
>>>         __initcall_end =3D .;
>>> =20
>>> +       . =3D ALIGN(POINTER_ALIGN);
>>> +       __initdata_cf_clobber_start =3D .;
>>> +       *(.init.data.cf_clobber)
>>> +       *(.init.rodata.cf_clobber)
>>> +       __initdata_cf_clobber_end =3D .;
>>> +
>>>         *(.init.data)
>>>         *(.init.data.rel)
>>>         *(.init.data.rel.*)
>> With r/o data ahead and r/w data following, may I suggest to flip the
>> order of the two section specifiers you add?
>=20
> I don't follow.=C2=A0 This is all initdata which is merged together into =
a
> single section.
>=20
> The only reason const data is split out in the first place is to appease
> the toolchains, not because it makes a difference.

It's marginal, I agree, but it would still seem more clean to me if all
(pseudo) r/o init data lived side by side.

Jan


