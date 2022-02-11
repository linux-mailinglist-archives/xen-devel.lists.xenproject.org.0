Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F414B24B2
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:46:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270431.464721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUNU-0007o0-RF; Fri, 11 Feb 2022 11:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270431.464721; Fri, 11 Feb 2022 11:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIUNU-0007lA-Nt; Fri, 11 Feb 2022 11:46:16 +0000
Received: by outflank-mailman (input) for mailman id 270431;
 Fri, 11 Feb 2022 11:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nIUNS-0007l4-4L
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:46:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 335c625e-8b30-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:46:08 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-RVFALD3tNwKLTUVYt24OhA-1; Fri, 11 Feb 2022 12:46:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0402MB2837.eurprd04.prod.outlook.com (2603:10a6:4:98::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Fri, 11 Feb
 2022 11:46:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:46:04 +0000
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
X-Inumbo-ID: 335c625e-8b30-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644579967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qMvjdILdOQQm8ClcVKENjFlG9tts7eUNCzqR/xl6Sc=;
	b=l4t2fsiLz6hLr10nuSVpDsqwkDF0I/I/sO4nKt53EtKipaRtNA37FNsrcBtTNOr6E3ZQJA
	g1QVGllIgN7OG0fOP6tHcpi+OXHoBWdwwMRctdY8/JwNLZIjX0VGgS1rbYMJuhtFOhd65I
	f2UQfm8Rsm8qb7zHqERzGMyvtPueAeI=
X-MC-Unique: RVFALD3tNwKLTUVYt24OhA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odcxN23gh9KdGa0cRCFR6P6HI4Gf04XUXQrl8VKGXMnMJHLhQYI5xdHPjKd52EZNbuE++0H8SyRI8TJzSsIvweOI7UxEV97aT6/BqKg8bCk0mD5RwfNJ+3GF1pFydtWS+xQETQ0ugmxSoiIJR9WtBR9AEJ5mgVNQq+/I+sO923aQVXBML8Hf4pLyrvodmx3Fg22sfZm46Rhyr0FSPA9CmwS6sekWYvD7NFM1oFEwzFm2ZvT1Vs4g8beSyLMw6JqtcaLvfFPheLfWM6gA56FlV2wa/A+Ya0yDbPGlhqyzRe9Ng6w9zp+YPf+EeJYcLIh1VeESqzof7ode3k5fXm5hvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX2ExCCCyJ8Ds8YDjq4m8oRjwGlBVybNnIGNuRAwLlg=;
 b=KRya4jVUaSW8uanNmLgBzBisBo6MmkIEMTTRu+LJ9QZpjk/N3isPhIqMj25gHEfO8CQ8ZLkbSJ3qEExHHu4awKYmXke64wlTpHbF1SGCgplnDOqL+8SbXo+mXbzgQHjlXqEuGOf7h9o+K7zrLUykqdlc+uE7u/8BdAk7V1GsXVKfkFLyFo9fyWwSXmEpi3U/tf3/XZryR7mGTKKr8HQPlNPU8+RocaGGv1m+UtEhBHyQbmxZu3ym5R7LXeji9QpcBYsprQ2zqUzPmVs0Q71oq9JsGxrosZnDlnpyyiHhGTU/lhP+hTh2eb/2kss4tTVI/7leLIw0J9fTEL5rc2JAJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6d924061-f2fd-5f3d-0f98-79e76398b908@suse.com>
Date: Fri, 11 Feb 2022 12:46:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Jane Malalane <Jane.Malalane@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220207182101.31941-1-jane.malalane@citrix.com>
 <20220207182101.31941-2-jane.malalane@citrix.com>
 <YgTi6bzeojtcu0xL@Air-de-Roger>
 <dff9c5c0-7bee-ce0d-3288-91255a701c99@citrix.com>
 <YgZIo9VQktcqGHTD@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgZIo9VQktcqGHTD@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f401bcc-287f-4511-0702-08d9ed541565
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2837:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB2837E1D2BD33EE7FF64650C8B3309@DB6PR0402MB2837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7cfALlDWo82qlML5AKhGMJKMf3LyH+1wiFqzHCLweyryTXDNhZOH1T1La7osYFLFozMvzipz9M+4AhGi98Zurcc11MUK/0rt0p8sSx0gROPX3BhIjDgftG9KNMs3k/boPfm4jbddV53AEplBvfgCRNMfg6jQxcwbXXEZ0yBxK/FVv/vfIZOUElQxbBMsIzG5ZB3gJ5wp+CrpzBe8fO1DCZxnu8WMIJWEeJTkhsMsrCbcIolob+dJBGgGAZmP82PP8HdDbE+jO6uCCg2fF4MC3mNc0ZvJOg/PaMORu56qTEwOsx59FoxoeyYE1JpCXad1g8KbUOXMyA//W/mNWtrtYZ2Sbg75jxcLQRLupnMg8nzzY6UHRZjApt+rhn87qkI8Cvv5k/p/7oNsQfpFbnBQ3vKmpt0Bt1CLGXenQ0kyB9y2rfA0BUxEju2FaqcRN4eiMKBs23Xqbgr1wTsbecjUIa7ZSNKLVQbgdQdAIeV3efGU8BlSW8ALYDzbVX9ONbZUhkdw8GJcubcaWprz3uoK070KFR4HOSWb5guShBMap5FtM76h5ntW/Ys9EH1IrwG/nokDIBT9qebi9czFBcGstJIaABcDAXPdHb300p/xqUtPW/2QYfXvoORxFS1+Z7wbhdlgCgB4odrMrAdv7a/DA7Fb7Ra+ZcstwNOJAP6+tomXnYOIhDEaG2TeA9LMR/vGlxvAEMmyUmzwD+957Uv0LByRswHA8zyQXzreG9e6XfaeQ5KMcZBnc/sIZ8Rgw8D4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(7416002)(5660300002)(83380400001)(8936002)(316002)(66946007)(66476007)(66556008)(8676002)(2906002)(4326008)(86362001)(6486002)(31696002)(26005)(186003)(6666004)(6512007)(6506007)(53546011)(31686004)(2616005)(36756003)(54906003)(6916009)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9L12r1qUAsr26tTw6iQHolwKmX2LHG+sQJ7VIsDz/WhnD03eylBVE25cwZV?=
 =?us-ascii?Q?T9yLl33CVCGRbczz6kdKRtGDm5JTlIDYtDLanyImp7MOhjOl39pUfGrMQVde?=
 =?us-ascii?Q?Y/L8LZGRzFK2jQ46R6zjuAw6lCFEMrkYd0FRBhZUhNqmWguQMnGsDCZtImvT?=
 =?us-ascii?Q?8FXmiEzfd62ixslchbBykEGiqVYlK0EeRHHej7logOo5wV/dL7gJjqhGwqu+?=
 =?us-ascii?Q?zlhtcRXoahXSUGsvpeDx6+3uXAWs3/7mFMmudotSXWyfoWzwS0ZjxHiWkp9o?=
 =?us-ascii?Q?2+75cgGwlSeqaeGfd8TAQBy5a9JE4bB0EHU6Nh2lUdUkwMIi6HLeIzsRab9j?=
 =?us-ascii?Q?Jtoq+vylovmayeL0O2XqLD6VMWChZDQiBdEufYbPRPmEC9nR2POcuaTKZr5i?=
 =?us-ascii?Q?YyfMSApF6Zju6VP4NRHgiYB/SVDR4OqsGjFDqaUlMBffbzsPGheh9yeYpMyy?=
 =?us-ascii?Q?LYMuhPZ29TN2eExFJpYz6iwhTMzv8Pucwclekvi/Y3fxZGDKVB+hrl9iOc1i?=
 =?us-ascii?Q?wy0+wlKDmGU3Gvvwjx1sxK3z9pKv//xsKyiSnUAAstWCjryw3U1sFfjZp2Hb?=
 =?us-ascii?Q?GNETqotlUjNsWlhSn5rfep2mA5Zelj5VkWYlYp5yZW2MXS7XjHhwwfXWx3LY?=
 =?us-ascii?Q?Z9xRkDz5iPs9bq/bJ/mZcmxAnCau8079lUj/R4BQSeQvEhDDet9fFGS7zuLc?=
 =?us-ascii?Q?CN1YunWQOszAyuP3DDzgEpm0KfEBdnLpyPPhGK6VcckhMb6awDpC4TlNfh5+?=
 =?us-ascii?Q?LXD90rhyaTq1H7BMhzUVTLOzVkApwzIoZ7d4e1C0pTqYz7jA1HvyHw0zlTGV?=
 =?us-ascii?Q?TDuycCBsGAbAVJawsBDfFV0svolFbGveuabZYAVAwixuCyqarTPuZV/+vYk1?=
 =?us-ascii?Q?ypa2AU16pZ4Aaxmnc8MTHoHFh26umfckANjshmAWZvErINQIEBe5i//qJWkS?=
 =?us-ascii?Q?uiQX9YYb3Pjmbmpx6mXsHxc3lOt4gHFr0rhw1iJYlcSaOxlKkTOYGdwAx01I?=
 =?us-ascii?Q?ypzxJoKE05NR5d4pcNOoTiU+CRfgKslPmtIQEH2aPTAhrftswo7Vk/IDiDDa?=
 =?us-ascii?Q?IJc2fPoXDzZdafTb4HNT5Mq+v6bJfZVC33CDu6y1tbCI8DRyRPl1Znxaij87?=
 =?us-ascii?Q?LjVB7kLOXiFy/zbunngUL0orJXqGv0EdbcR5/doCm5/jJ705xyNjGRk8mTjb?=
 =?us-ascii?Q?ybCFm/zUT8XJJYlSm68jnHL8O0th5KbJhSc9bk4ObFOd2JyftLnuthzJtmB3?=
 =?us-ascii?Q?SQI5Sr7SyY/9oLtv9OIduqwW3FXaMx8KSahkOtfGR442munuD0DHlDT1o0zw?=
 =?us-ascii?Q?c12jfdUdWMDw/NSEomOMEaEfjm/1+N2YLb0Or4CExIqdvG7ZVrPq9P2ZS3yy?=
 =?us-ascii?Q?gXGnbFRGYl/2E5Gsic4nQaLeWaDz7wTRMaAk3x8YTygP5l9FyjUJ9e/NxLLs?=
 =?us-ascii?Q?Ak6mPJ/b+r1Gom/1yRwuS85hbTueupxuxwUZnDiGVVtOsL3If3OP8DRHxcHB?=
 =?us-ascii?Q?tUi5hjPra6F9cheQ/QuedFjcsNrGtIpt3fBBk5NLZE+oscyhsP3qJ7kTHC0k?=
 =?us-ascii?Q?/zWocJ7DsaIdBL2zk3NpgkA4zH89u9e4b7RKJ+yY3OBwn1kPJ/lUtGEov82Q?=
 =?us-ascii?Q?VVG6Vy4wrLzem1HZzf5Fj8E=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f401bcc-287f-4511-0702-08d9ed541565
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:46:04.2707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIYb+5NAo4t2NG22bIXWtEMqXetbFTB/8OeTngQlkl6y4cz9zfTn3KCtQDFuv67KSpDkv/sc2HfkA7e4IrIUhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2837

On 11.02.2022 12:29, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 11, 2022 at 10:06:48AM +0000, Jane Malalane wrote:
>> On 10/02/2022 10:03, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Feb 07, 2022 at 06:21:00PM +0000, Jane Malalane wrote:
>>>> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> index 7ab15e07a0..4060aef1bd 100644
>>>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>>>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>>>> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>>>>               MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>>>>       }
>>>>  =20
>>>> +    /* Check whether hardware supports accelerated xapic and x2apic. =
*/
>>>> +    if ( bsp )
>>>> +    {
>>>> +        assisted_xapic_available =3D cpu_has_vmx_virtualize_apic_acce=
sses;
>>>> +        assisted_x2apic_available =3D (cpu_has_vmx_apic_reg_virt ||
>>>> +                                     cpu_has_vmx_virtual_intr_deliver=
y) &&
>>>> +                                    cpu_has_vmx_virtualize_x2apic_mod=
e;
>>>
>>> I've been think about this, and it seems kind of asymmetric that for
>>> xAPIC mode we report hw assisted support only with
>>> virtualize_apic_accesses available, while for x2APIC we require
>>> virtualize_x2apic_mode plus either apic_reg_virt or
>>> virtual_intr_delivery.
>>>
>>> I think we likely need to be more consistent here, and report hw
>>> assisted x2APIC support as long as virtualize_x2apic_mode is
>>> available.
>>>
>>> This will likely have some effect on patch 2 also, as you will have to
>>> adjust vmx_vlapic_msr_changed.
>>>
>>> Thanks, Roger.
>>
>> Any other thoughts on this? As on one hand it is asymmetric but also=20
>> there isn't much assistance with only virtualize_x2apic_mode set as, in=
=20
>> this case, a VM exit will be avoided only when trying to access the TPR=
=20
>> register.
>=20
> I've been thinking about this, and reporting hardware assisted
> x{2}APIC virtualization with just
> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES or
> SECONDARY_EXEC_VIRTUALIZE_X2APIC_MODE doesn't seem very helpful. While
> those provide some assistance to the VMM in order to handle APIC
> accesses, it will still require a trap into the hypervisor to handle
> most of the accesses.
>=20
> So maybe we should only report hardware assisted support when the
> mentioned features are present together with
> SECONDARY_EXEC_APIC_REGISTER_VIRT?

Not sure - "some assistance" seems still a little better than none at all.
Which route to go depends on what exactly we intend the bit to be used for.

Jan


