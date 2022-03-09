Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C13A4D3238
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 16:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287970.488334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRydS-0004z0-9t; Wed, 09 Mar 2022 15:53:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287970.488334; Wed, 09 Mar 2022 15:53:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRydS-0004vk-6r; Wed, 09 Mar 2022 15:53:58 +0000
Received: by outflank-mailman (input) for mailman id 287970;
 Wed, 09 Mar 2022 15:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gSYI=TU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRydQ-0004ve-5f
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 15:53:56 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f616008-9fc1-11ec-8539-5f4723681683;
 Wed, 09 Mar 2022 16:53:54 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-3GT9MWEZNieV5CV4e7pLag-1; Wed, 09 Mar 2022 16:53:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 15:53:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 15:53:51 +0000
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
X-Inumbo-ID: 1f616008-9fc1-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646841234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTgYUAGUGOm6yz2Rhng1KQmnvhf7LBSyHbn9p33lEfI=;
	b=KJbt2RiV61rk9kGm3BOn1vW14o9SgARFwZ+wxwKs+9RAK4j2y0KP+M/SLz4hx2uCjjP633
	n11vIfuhnGqckXeGtS/LtSTtsBI2jb16Erw3qaFC8yE2OwDPEcJH/r1JKk5jG2PzUC9i/0
	PUqBhvJLIOkm1HY6q/WiuKgHmK6ITds=
X-MC-Unique: 3GT9MWEZNieV5CV4e7pLag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyL4HLctQaF48g5bzgmZzmv4TUNldWNnY8WwCyIiUZL2luuu4zClx1st1jR+4IREctdLWiLv2pT+icjIQVoa0POiLBaeRKE+pkEXATKNl1yZnL08bAztyFFSwYr+nCr0hsfDiUEYuEpsP+XXX4XwKyqUvBYyLUyv7CAyDAWSquz85uErzTmWD1RPb9vABXMoXjbGyRK1V3sgFR9fFh4cD+7o93S4lymOLst6f7zmx59wDZMmvog8gAVCv+XSq3Y1kT5hCtLKw9FMOGZ+5FjuNwe8BbKdpIm50UWb8O3EIMmHAAfu4R6DtzTZ5ijJsImRDNpqlr3GW3z+qfr6v1Sgjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtLPPhqsA2L9A8jhP7KLOSCifoMVqi0RRmVt8NB3DUQ=;
 b=eSDT2CGa3ZMEInql0Ozrqb/ifa+TWrpvS0wJz5ubfI45JYFUY0l9FSQuvpz8o07R/AZwPy040YTynU3RGcTV3exthe9hK3AvysmoCN7Ok94kvqnL8VYP+EuBn0wx//JEwZVX1itWO4V+dvw17kg3hawhf+CjZU35Xvap+Us1Pg82rQ8nWvKQZcbGOgGez0x6NogpXDccqcNpoD2SaaMIuNcTnKNqzOIODgrZMkuQS7LzVFT4Twvyk4dDPqNvcAOJNsZACyvpWkoBRkA/oi15FAaN9NJlCmT5JRUW0/N04P93+bo+0uDCK5y1dBZE10B4SeQsuVNrVTzWaOVdAjp9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8395210e-802f-262a-2c1d-c702a4cc6ca3@suse.com>
Date: Wed, 9 Mar 2022 16:53:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
 <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
 <1205992D-ACE4-4E94-B554-3B14F6D9697E@arm.com>
 <35ad9273-956b-86d6-55a3-c737575a7880@suse.com>
 <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <515CDCB8-43D2-4D08-9195-D058E641E1BF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63bda054-4875-4641-d832-08da01e501a8
X-MS-TrafficTypeDiagnostic: PAXPR04MB8333:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8333CC48877B452B58A95DC1B30A9@PAXPR04MB8333.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e/yaNTr9Ldy43JObacb5bGxxD8c5UdadFsPplarWAwvRl3a96UuaR6qUTTmARFhWSOcuFZTclcpabjvzew1X1m793rAiXxLuy2OedXjohgbuD0XqzujkA6hofKFvvPqQSjiYQE/2s3AZu3yJjCCckNOjn6JvzRy2iNb+AMptzV9Lt6H+jot11GPRDI8FSquGjoHTXQhqsmegSVg1bmChWZTMuX3LJj6EmWSco44GKWjPd0SI+UlMqBeAHE4p+SfsYZChPDpc96iqyQLANtAKzJlZ4fp3FWpiAcbmFMlezic/UoxEmr0cpbiRJS0caNAZdzyxR0Yxip6pKU1uWm1XnACdCb9jaFpu0kNOqbB54jAe2N8F204aPXaGwumU72gvyBfjPeddjyM/+Llv2Z1hRoNEgovGFTvNe6Gjf45b99DTVK+xqkklf0JVZX+eJECPRnxIcjsjL3/oE0WyrCbiozRVj3TH4eONoUc2W2WYTuEuHYJx51UsgRDAjQaZNNvZc0boqBUuxsSK9aEXJLIGD9dIr/Ulczvec9cx+qB2TDuK2EFnOOj/5nKaPTEIb+AGRUM/Bzh8lcGCOMW0C3jXlAsaJj2DV9MK0fSkcDbVEW8eEFxy5VEFGQjKf9tdG66WuMT4coG++2i5E1VfIEsQp+Eiv3MYOId5r/gLFFRm8RCa+Qj9lneNkHHs12dI0vd/ouOamdCsV5p4FLAFbd+OSYiQkWigyZUOhgUMLSfnCOXQJIwCNw6ulfoHIrSqcWOu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(53546011)(31686004)(6486002)(31696002)(4326008)(508600001)(8676002)(66476007)(316002)(83380400001)(66946007)(66556008)(186003)(86362001)(8936002)(6506007)(7416002)(36756003)(6916009)(6512007)(38100700002)(54906003)(26005)(2616005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z8/2NthURJV8w32hgcy+BUp++aznTaqp9d/K6psemIzWt1U0FEVhkfn5APft?=
 =?us-ascii?Q?8eqYM3UdITS/dddHLamgBgYamMPDKDfNY/iVbmOGOUZzrQ87RSDpgP6vZcpX?=
 =?us-ascii?Q?PDQEOr9ptQ3Kv9xmjbD1t2DVlmaydErgaKw4aRM/jIJVCoWWpKW6wI1xxXqL?=
 =?us-ascii?Q?Yun2jnPj6Skg4+vjVVvtMGfXVLvUZjVXqA9+Kl3wWgmCTbe4ZObNYONJLxCA?=
 =?us-ascii?Q?DfbqR8n5uDmtXdLDaY2i/Xh+TvDkgD3XCJPYuyoADvCEvGddi+iaLdtQVi3+?=
 =?us-ascii?Q?7GInI1GDqV//+dHkHfLwahgiwROc0/+6B9k9rkANlgSgshyHFMe6qAq1UXVp?=
 =?us-ascii?Q?JAG3W8tJY2iZ4gvEVxL40BoBG2Qa8ib/eVBEc+IC/xZRN5SBra6NoqcFHuNU?=
 =?us-ascii?Q?vL4Z6xrD7VHlMIK2f4S2N0XyKKKib5BkDcdkcrcS0a/lOaQGI5ysWN6xDdpS?=
 =?us-ascii?Q?n7/hIkX1bI+HlJCOvZJR3wP60ZtLZJEuBgi0SQmMLw8F86XqtYKePkNoy6rH?=
 =?us-ascii?Q?IoP8HZdMa7CIACruFrCHyFogzVu4UDs92y/rMH63rsxwb6+Hp35cgw5HDkqb?=
 =?us-ascii?Q?9AhmDMjieYBo721zx3exlcBOtMkg+oaX253cdReUjRbQgCP3T3lxumPsa/MU?=
 =?us-ascii?Q?LgDliDkyXWpDpuyaV6CiEdsZFQxnYKxd7RUQOKEH4352Heaayg9v2hUAnmeA?=
 =?us-ascii?Q?VjE5KPlF95Pt8FgOPMUmJ8kzdiB1SThn9o/Tk4uqJBuv5keoClF4bQEi9KCO?=
 =?us-ascii?Q?JQeddRhbylIsGVUwsbtqYiFrj1Qmbrcy56qiCwuQEmzh1zaWO13EWnl/zED6?=
 =?us-ascii?Q?bnBc1bGQDROyqo7HRklGigi+IA17N+0/spe8vDnQn5LQoFyLKu7AM1kiAH9T?=
 =?us-ascii?Q?yOYeFTD6getAnSuOJst4OtwSthPSOfd02BKuDtFlMYkxuGyhrYw25YMsfe58?=
 =?us-ascii?Q?8SHBKmDTiXU5yz5sob1pfGWcn5DJ76W6VKm355lyNi+Y2v7MsftTRNeFNy2k?=
 =?us-ascii?Q?W0re18F7Myj2Q04eUu3PWxt5t0sNwOc+ISXyo7DcTZf8HpfUwikzqnQfLpTL?=
 =?us-ascii?Q?Xmu9bJGqapYuDpDTj0/tDtsHHn0Y/235PhmiqCcnXkhsZWOngSnyOB7O4048?=
 =?us-ascii?Q?LDHMri08P0xw8lRzqf4rik6JW4xb6b40qghaC2DoZ6zupiZyO5dTvK1XJLnD?=
 =?us-ascii?Q?wuskChyn+u5l5JyS9Zwfyg7osnCXHLfOX0tJu42FiaQSxyCNUZt+MAIps1LA?=
 =?us-ascii?Q?0ZUm0mvd0Tdrck1iDKPeIRzHsFwdZOEcAjCi1hEScJ1Y6lDSfcM2a6Rj4t3v?=
 =?us-ascii?Q?RlXGLHAgyU8fp4+HorJbJtsFrp10QHgkFdgOlHl1IGKVluXBX6a8wlVW8zdD?=
 =?us-ascii?Q?28RZWPonxUK4ZWlNXPQAHCa0HFEwSg/VEdMPx4ZITKNpIoRhfeoNJxurUfKL?=
 =?us-ascii?Q?p76R+9AXLZ7f38ndKkIe1zXtxD+DZmLeUTwoButPxze+MWfPnvlKnk6yb1Y6?=
 =?us-ascii?Q?76Fd0PHAcK/P7IRVRW5Zuq/V/MwkcTUybxv4Z9Qf4xiM1dXvuzC/233pxBh8?=
 =?us-ascii?Q?Ct1VRJgTp2QR11Q374Y8glLvX5+MlPWvteAITAy4ePqYxm6Vkb37c5mglZYK?=
 =?us-ascii?Q?eYplX+xtNeX4lvkE3GOAorM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bda054-4875-4641-d832-08da01e501a8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:53:51.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pCY/qT3mm1IpQ6h7aZFbkv8OKhrkKvNVfRiujHJ5pxM0F84LUBtsfmabyseVeLoUi10671lIIcbIcmruLyoiCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

On 09.03.2022 16:50, Rahul Singh wrote:
>> On 9 Mar 2022, at 10:17 am, Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.03.2022 11:08, Rahul Singh wrote:
>>>> On 4 Mar 2022, at 7:23 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 03.03.2022 17:31, Rahul Singh wrote:
>>>>>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 01.03.2022 14:34, Rahul Singh wrote:
>>>>>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>> On 15.02.2022 16:25, Rahul Singh wrote:
>>>>>>>>> --- a/xen/arch/x86/hvm/vmsi.c
>>>>>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>>>>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_=
msix *msix)
>>>>>>>>>
>>>>>>>>>  return 0;
>>>>>>>>> }
>>>>>>>>> +
>>>>>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>>>>>>> +{
>>>>>>>>> +    struct domain *d =3D pdev->domain;
>>>>>>>>> +    unsigned int i;
>>>>>>>>> +
>>>>>>>>> +    if ( !pdev->vpci->msix )
>>>>>>>>> +        return 0;
>>>>>>>>> +
>>>>>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2=
m. */
>>>>>>>>> +    for ( i =3D 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++=
 )
>>>>>>>>> +    {
>>>>>>>>> +        unsigned long start =3D PFN_DOWN(vmsix_table_addr(pdev->=
vpci, i));
>>>>>>>>> +        unsigned long end =3D PFN_DOWN(vmsix_table_addr(pdev->vp=
ci, i) +
>>>>>>>>> +                                     vmsix_table_size(pdev->vpci=
, i) - 1);
>>>>>>>>> +
>>>>>>>>> +        for ( ; start <=3D end; start++ )
>>>>>>>>> +        {
>>>>>>>>> +            p2m_type_t t;
>>>>>>>>> +            mfn_t mfn =3D get_gfn_query(d, start, &t);
>>>>>>>>> +
>>>>>>>>> +            switch ( t )
>>>>>>>>> +            {
>>>>>>>>> +            case p2m_mmio_dm:
>>>>>>>>> +            case p2m_invalid:
>>>>>>>>> +                break;
>>>>>>>>> +            case p2m_mmio_direct:
>>>>>>>>> +                if ( mfn_x(mfn) =3D=3D start )
>>>>>>>>> +                {
>>>>>>>>> +                    clear_identity_p2m_entry(d, start);
>>>>>>>>> +                    break;
>>>>>>>>> +                }
>>>>>>>>> +                /* fallthrough. */
>>>>>>>>> +            default:
>>>>>>>>> +                put_gfn(d, start);
>>>>>>>>> +                gprintk(XENLOG_WARNING,
>>>>>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
>>>>>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO ar=
ea\n",
>>>>>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
>>>>>>>>> +                return -EEXIST;
>>>>>>>>> +            }
>>>>>>>>> +            put_gfn(d, start);
>>>>>>>>> +        }
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    return 0;
>>>>>>>>> +}
>>>>>>>>
>>>>>>>> ... nothing in this function looks to be x86-specific, except mayb=
e
>>>>>>>> functions like clear_identity_p2m_entry() may not currently be ava=
ilable
>>>>>>>> on Arm. But this doesn't make the code x86-specific.
>>>>>>>
>>>>>>> I will maybe be wrong but what I understand from the code is that f=
or x86=20
>>>>>>> if there is no p2m entries setup for the region, accesses to them w=
ill be trapped=20
>>>>>>> into the hypervisor and can be handled by specific MMIO handler.
>>>>>>>
>>>>>>> But for ARM when we are registering the MMIO handler we have to pro=
vide=20
>>>>>>> the GPA also for the MMIO handler.=20
>>>>>>
>>>>>> Question is: Is this just an effect resulting from different impleme=
ntation,
>>>>>> or an inherent requirement? In the former case, harmonizing things m=
ay be an
>>>>>> alternative option.
>>>>>
>>>>> This is an inherent requirement to provide a GPA when registering the=
 MMIO handler.
>>>>
>>>> So you first say yes to my "inherent" question, but then ...
>>>>
>>>>> For x86 msix mmio handlers is registered in init_msix(..) function as=
 there is no requirement
>>>>> on x86 to provide GPA when registering the handler. Later point of ti=
me when BARs are configured
>>>>> and memory decoding bit is enabled vpci_make_msix_hole() will clear t=
he identity mapping for msix
>>>>> base table address so that access to msix tables will be trapped.
>>>>>
>>>>> On ARM we need to provide GPA to register the mmio handler and MSIX t=
able base
>>>>> address is not valid when init_msix() is called as BAR will be config=
ured later point in time.
>>>>> Therefore on ARM mmio handler will be registered in function vpci_mak=
e_msix_hole() when
>>>>> memory decoding bit is enabled.
>>>>
>>>> ... you explain it's an implementation detail. I'm inclined to
>>>> suggest that x86 also pass the GPA where possible. Handler lookup
>>>> really would benefit from not needing to iterate over all registered
>>>> handlers, until one claims the access. The optimization part of this
>>>> of course doesn't need to be done right here, but harmonizing
>>>> register_mmio_handler() between both architectures would seem to be
>>>> a reasonable prereq step.
>>>
>>> I agree with you that if we modify the register_mmio_handler() for x86 =
to pass GPA
>>> we can have the common code for x86 and ARM and also we can optimize th=
e MMIO
>>> trap handling for x86.
>>>
>>> What I understand from the code is that modifying the register_mmio_han=
dler() for
>>> x86 to pass GPA requires a lot of effort and testing.
>>>
>>> Unfortunately, I have another high priority task that I have to complet=
e I don=E2=80=99t have time
>>> to optimise the register_mmio_handler() for x86 at this time.
>>
>> Actually making use of the parameter is nothing I would expect you to
>> do. But is just adding the extra parameter similarly out of scope for
>> you?
>>
>=20
> If I understand correctly you are asking to make register_mmio_handler() =
declaration
> same for x86 and ARM. You are not asking to modify the x86 MMIO handler l=
ogic to
> use GPA to find the handler?

Yes, but ...

> As Roger also mentioned that vpci_make_msix_hole() is required only for x=
86 to clear
> the identity mapping. If we make the vpci_make_msix_hole() arch-specific =
there is no
> need to modify the parameter for register_mmio_handler(), as for x86 and =
ARM
> register_mmio_handler() will be called in different places.

... with Roger agreeing with this plan, that other alternative is
likely dead now. Provided other stuff which isn't obviously arch-
specific remains in common code.

Jan


