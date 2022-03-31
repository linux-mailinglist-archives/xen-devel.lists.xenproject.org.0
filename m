Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385944ED544
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:13:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296738.505168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZpvz-0001l3-FH; Thu, 31 Mar 2022 08:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296738.505168; Thu, 31 Mar 2022 08:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZpvz-0001ie-CE; Thu, 31 Mar 2022 08:13:35 +0000
Received: by outflank-mailman (input) for mailman id 296738;
 Thu, 31 Mar 2022 08:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZpvx-0001iY-80
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:13:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d8cb9b-b0ca-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 10:13:31 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-MDLjFq_mNMWffRCOEszdQw-1; Thu, 31 Mar 2022 10:13:27 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 08:13:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 08:13:26 +0000
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
X-Inumbo-ID: 73d8cb9b-b0ca-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648714411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5QfjTOw9NLkG6JfdpouDR5Dtgtyoh/WkbotPdfgzIU=;
	b=mXKP0bWIBw/qDxrfxjv/UA1KHsw+a6GubLB+J5LawRWh6stnjlMRa6bAM8D5rX9ucXnn1a
	i6l5gGyt4nOvWr3EWxGHFhCa0svXHrFf2d/3oYvz62yLPckgabnS1QbshkPwwBjM6oJ/cv
	UcloXT5PpEghLIMdGNsBiaapLVkPVaQ=
X-MC-Unique: MDLjFq_mNMWffRCOEszdQw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gtz2jJD1b7bIzGcV2lBFDmqMYnrUcLAjSfGjSmyxZguRLVUts83jZhAgrPeY7AbmY/DbsuRHK7gKZ7qoNlqQ878OR4OKEP0kWpjCTtmKcv2vqEJozhiI7SFlbAQmoDKzZtu1mBlF+y0rBcDgM8318NViU5Pj7HLLrmbnRM+TCBuJGYIMfXfBtPSxGAlVB1tuYa1drpGkyIRQtMOU33RCh5nSHEYcZhoN2h91D/Jl2eb6/3IZZ2rI+GCo+2uwKlSOUGA8/Nm5c2eUzpiOCodeaE4PdKOXnIwI5sWqNVz5w6enMgqd9miMxVDTdJWcJG0Xr2fJWuVqOMemOSEiC7eZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zYxYLTnzn1V59BnPmiQzSwpnOVQR8kmt6PHQpu9ff4=;
 b=TSnm/9hANDxNu/6HvXidAhB6leHlSPIskJImMTu9DMhjjsVwmpMABc7Ez7XR1ddZSIcH13IXXaVxt9xLoUTzY/F7mFaY64NpiZjrjrbCwTWgOXbdsTP05PnXaxQpUoAQ3QayHJ/UgPuxT51xbbUzxGOb5xmbyq3BXhwXBf4Z1yHg8lYKGzgFRD6BA5NNPABDszof5+ox9Dy4F7U1ggC6aBnm0Mjc+3Ld9qoWDujvGG5hIlVfthhVJwRd9FkJqk8Swz64ygIJXuoeiI/wmJKbLggng0P2tKhWKyZfJ/IIa+QPFprm3cAANWGvk/Y+0NARtOgSMfAKyW2htamGWbjj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <66beaea7-eb6f-4cac-336b-4dd605bc614c@suse.com>
Date: Thu, 31 Mar 2022 10:13:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] livepatch: account for patch offset when applying NOP
 patch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Bjoern Doebel <doebel@amazon.de>
References: <772f0afc-64db-6b98-af49-bd970ac78cbb@suse.com>
 <YkSNm0mb47Vc6nGr@Air-de-Roger>
 <a6f18801-7959-8fc8-f414-8086ed74ab3a@suse.com>
 <YkVfvW6HiST3fIgs@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkVfvW6HiST3fIgs@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::7) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62e57608-5a94-4311-faf5-08da12ee54a5
X-MS-TrafficTypeDiagnostic: DB8PR04MB6985:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB6985AE2C7A7DE38F33301378B3E19@DB8PR04MB6985.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q35dayXIlMT5yuVczX+lN8/QwV8EzsJmT8uUlP7Mgd/Y0FeUj2LBozbKHmZ4bVOKz3JHQRK6zVZPQJdq3V9B6A9A1AVL2tOVJCTDoy7/Dg5WcNApXFBdCq6tOg4BMDPiMs2ZJy/2/+5PIauAmKzbfuzOZxucR+yh6pkFMmNG/MBtYioxt+vUZiNt1D75H8LU9ri8uX4SGo+g/N1yIQtEUOzPLI5LB/jUb+X8hLbauaHmJgGtemlZUS/71WCg884B3r1y5Nb4Azk8tnsda2NrEhPd0xNkoOKgv8NDk7109EsMe9UdMq9RiQQBYz5daxAay2AL024SRYl4rljVYWAjAiFoEM6oKROTZkKxqSlZyyAsOo3UbZUvMPUtR6JRGrNIBxuLvuzIl6tQb0Zo3pDD/Nbgttq7wYOb2lo7KHZTuejGO5R0LW3Gla0BsBt6H6IWI4uAPSUE6Eo4c+09m/7HD2ErOaWFAfkoUdCmGxSHB0mnUq/kAMtwGrM4MRu+Fc6UQl9KiWMg8nqv3sjG13OqfGlmSKRDEhJZkQLe9DywVuWEMrQM7d9WBicXyNiE4drFJKjNNqIzHeAJCM3ruuzi47bcls00gqVUPn94FOFs1OaubEsLRHtMvNfatwJt3VdEzA43OdiKu2MkU0uMhzO+2XAPXQBikuYnTdjgYAK0ApQcOzc4wl5Vn9pTclP1ea2/3DkRvcs8OVYMros02D8GFR5H06s5Im+SmkyLaMp83t4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(66556008)(66476007)(5660300002)(66946007)(8676002)(2906002)(316002)(6666004)(86362001)(31696002)(54906003)(38100700002)(8936002)(6506007)(53546011)(83380400001)(6512007)(4326008)(186003)(6486002)(36756003)(508600001)(2616005)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fdHkbTStyuLbADLtr74jQdYmPyZiZ8On2u3q8g1HoglfWTLZvBEOBzafQ5YM?=
 =?us-ascii?Q?KcopcHWWqvY5qP14TD6uIHKRauB0w7G3GBT4b9+lDtsgsnryHYY4C2dtyCnS?=
 =?us-ascii?Q?/1cMgP060SYAZyYEszXVqbrJAmG52cufzYdKnI+Fy4pUHZG94bUndCJpEhYw?=
 =?us-ascii?Q?ekk7x7nXF2v6C+OSgaDHsqLbBNDcQ6dukgMQ2o/sa+l4XC5Vo9cRIogJ/nJu?=
 =?us-ascii?Q?Lq229YbmAxnmQBU63Hhy4rW6iYjM5wEFazS04ZJDe/h+AUSe/cR53HE5lZ3m?=
 =?us-ascii?Q?779mDmcDEIG1J4SxAXBJxi0SSUUXx2l2qi+1sScTpj1pc0OLQT1pguddX81D?=
 =?us-ascii?Q?wXqThUhH6KtjPocL3d3izA2oiOlOdC0BR5ulLnHCULV2bCsDupSOBLTE5H2d?=
 =?us-ascii?Q?0xeD5cExkGMip2S4DKP0G38tuYJ6jYBIqGHq4Ez+AGztK5iTprOOGGpVeiZV?=
 =?us-ascii?Q?OBc0L08lkQZaPQkDwdTWa22JnTLYJIAepHX7yvaGuAoMDv/KMEp71Pp3RVtq?=
 =?us-ascii?Q?hYni1zPalfKZ6KmNdXsa2pxf15U9GMRmp3zTOP8rvOo/LwE2n96gQA9IicJD?=
 =?us-ascii?Q?MTEm3PXstutRdyHneIjAxLLsRJkNeQRaKVphVxhVgmJjkVgWfCTmSMbs64EN?=
 =?us-ascii?Q?hmJ0H61CURlePCl7PSAhdnjLguDeXDn2PmvdQNyIA56QDupFPI/+0Lv9dQlg?=
 =?us-ascii?Q?DheR7bbndwWv5Hg7cltH/mjVYOnFpzts4pmIFSnE7w+a7zFt9Hhzr87NveA7?=
 =?us-ascii?Q?GxC/1UHU2BKRochND5F2kvMc82zUPaH5cR+2GX86jpxEyR+Hdl+LREdaCLcI?=
 =?us-ascii?Q?iOaJF3PHJQYtX3enImuNQHXzUH/jH1nseD0gMKY1gjSgYqjAFOsWS7jJVFio?=
 =?us-ascii?Q?lCQzs2HWdLJvRPOafFZZhtPPgJk4kObX9bE0S+Lds4G094zvZXRPFa2Exb8T?=
 =?us-ascii?Q?74RWpJm73CAf5MSOaaCY9IciBg5FwivC8NpDKlFVKJ6KKv7odtNbCdutVvBe?=
 =?us-ascii?Q?kMcQoY62dsyD7CG5YhUthswdtdywgGiwwBc6CoI/Y9HerZwtDGq6323IT5CR?=
 =?us-ascii?Q?41ul5bVL1frhOqitRfBRu3I/dQL+0dBvucuk8eCdw6PiXi2TT2C9t/SIcTwl?=
 =?us-ascii?Q?nPyGZz37MDHYpfjFd9LDv3PPPxKJScOPjDB37gK7PwXwyaVwSarTWxaiMShQ?=
 =?us-ascii?Q?tVB5V5rmxk3EcDxiZMfGczFAIB29nbcxTat/2AmuFEif0hEHL75906XpXhNS?=
 =?us-ascii?Q?za+mgj4WoUq0HjXpLY8ZJGayfnk4Z605LRIGsusNRGjcXiQwCgG+DDgAK8qn?=
 =?us-ascii?Q?R3kqo7eafmtQOYGY46fmJl3Fn2K6NERz9n9MtPP8LxRQB6QWQon1cAssM8mr?=
 =?us-ascii?Q?OBrO85g371Q5awSPUTCBbj+4D3xEo2b/pPEQCBiXfecdOpxSiOA4sHU1tGlR?=
 =?us-ascii?Q?vVMDqpYUM3dRHUFqMHPVX5jxCI73JSf7Xt4aZjCZT0KY+g+W/A+bUnTJ9xqp?=
 =?us-ascii?Q?l2V/mkCYc5gPJ4Dkx4na/Jouw0smsyov0qPfoR7MeJz2k1V+S4BaxrnmxL9l?=
 =?us-ascii?Q?dN+8CqLQmtxvSYQoOklp3K491lduJ4dFwSDTzSZuUw6D4xDBkcyUVFYcYmHG?=
 =?us-ascii?Q?l3jPc/7p/BNVUXZr01E7a90yC3eytxNrWwwQNOw4y5NBa2DpYIejIOKL/9ml?=
 =?us-ascii?Q?AFZY1wSojmTas90UXS5SqJR9QO/2BPMctittmxDSDXrQS3yGKtxHUDr1H1W2?=
 =?us-ascii?Q?MErzpAQDQA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e57608-5a94-4311-faf5-08da12ee54a5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:13:26.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scbq0Atl9ld5B+crObkLpxBrHTwn3EcSSy3hoBLMKwokCBNOQBlOY0z2jmHaJMNFCyTU9F0ejNIEyYrhfws5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

On 31.03.2022 10:01, Roger Pau Monn=C3=A9 wrote:
> On Thu, Mar 31, 2022 at 08:42:47AM +0200, Jan Beulich wrote:
>> On 30.03.2022 19:04, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Mar 30, 2022 at 01:05:31PM +0200,>> --- a/xen/arch/x86/livepatc=
h.c
>>>> +++ b/xen/arch/x86/livepatch.c
>>>> @@ -157,9 +157,15 @@ void noinline arch_livepatch_apply(struc
>>>>       * loaded hotpatch (to avoid racing against other fixups adding/r=
emoving
>>>>       * ENDBR64 or similar instructions).
>>>>       */
>>>> -    if ( is_endbr64(old_ptr) || is_endbr64_poison(func->old_addr) )
>>>> +    if ( len >=3D ENDBR64_LEN &&
>>>
>>> Sorry, didn't realize before, but shouldn't this check be using
>>> old_size instead of len (which is based on new_size)?
>>
>> Yes and no: In principle yes, but with len =3D=3D func->new_size in the =
NOP
>> case, and with arch_livepatch_verify_func() guaranteeing new_size <=3D
>> old_size, the check is still fine for that case. Plus: If new_size was
>> less than 4 _but_ there's an ENDBR64 at the start, what would we do? I
>> think there's more that needs fixing in this regard. So I guess I'll
>> make a v3 with this extra fix dropped and with the livepatch_insn_len()
>> invocation simply moved. After all the primary goal is to get the
>> stable trees unstuck.
>=20
> Right, I agree to try and get the stable trees unblocked ASAP.
>=20
> I think the check for ENDBR is only relevant when we are patching the
> function with a jump, otherwise the new replacement code should
> contain the ENDBR instruction already?

No, the "otherwise" case is when we're NOP-ing out code, i.e. when
there's no replacement code at all. In this case we need to leave
intact the ENDBR, and new_size being less than 4 is bogus afaict in
case there actually is an ENDBR.

Jan


