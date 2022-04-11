Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348254FB6F1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 11:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302760.516496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndq2U-00021Q-QZ; Mon, 11 Apr 2022 09:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302760.516496; Mon, 11 Apr 2022 09:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndq2U-0001yr-NS; Mon, 11 Apr 2022 09:08:50 +0000
Received: by outflank-mailman (input) for mailman id 302760;
 Mon, 11 Apr 2022 09:08:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1peA=UV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ndq2T-0001yl-Cj
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 09:08:49 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff0a3f50-b976-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 11:08:48 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2058.outbound.protection.outlook.com [104.47.13.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-sFu5UVvZMKeXuAvNNX9M_Q-1; Mon, 11 Apr 2022 11:08:46 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PAXPR04MB8352.eurprd04.prod.outlook.com (2603:10a6:102:1cd::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 09:08:44 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 09:08:44 +0000
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
X-Inumbo-ID: ff0a3f50-b976-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649668127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIOv4TY8WNOI3O99L/i9OSRrC6IBUN87tkTH85j1bko=;
	b=dRcsAp2GZSUWOP7MuAaaxsGPfqyhccTZMonDkqFSrPFiZ1yaoWOoFWq9ovm58qA9BNJqVM
	VT4Z1fnpnKCtiSLSwIyD7d+le+Hf2KatYOQUkQuyXdKnjZfpLEBYGA/LnuynOSax+W4Z3S
	p2rqSq65GVC9AAQgKqT0YIMiIm1Xj3g=
X-MC-Unique: sFu5UVvZMKeXuAvNNX9M_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4aAVnS+jWfZcJxJ845GzvUoEVcr9/FWljAcbjeOC1fRnMIOvWgx89CFISbGakhbUpZLgI3bqQlGtPUK++lrEsgb1XXtOFm73vlhkcxRVlIUYaXdZX0OoMRMgZ3idydFYunw9dllitdIrmwjcHy9QPZ/dCqi+SzSQlhbZDkZPlI3Ve5OyS932aj4FCFOuHBHmmFUImcZmUBsCL0+nJeDV/xS4HIKb5W+leXUcy62z0okPOZgMxJaZzz1eUxn1VhHWlc/2/Mko9YT0/zZhZePaGiC9c+V9omZnDAbPsYr3J4S3u81xpl6n2Fxa7v9Rvo0ht9zca4UgE3UuOjhrivKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YZ+PXvt0qCwoeQxUqlxz4RI7Y0nfk5NPP4ZAfM4xBA=;
 b=JDdLzjfjafk+rmLEwaasR5nC60GR2QPLJ2gfKhh1cJPhCjN0jgC4r+JXVzA314LxJP+cEP53neFqobjV4LViJjjJZ23K/OguYqvzY8MMbc98uiXnYzoQwrn4fr7hhdcXRmajEchRUX2Nh4HhrovpTULvcv9Z3dcIUwQHEQTk7SFuPF73IacHRAnNzmojgZGpXtXRNSX4ErlXjbSfJaOxu9+gpm00vaxgShkcoQ0nCIfZ5DyVUXLLyMZgERvr6bfx2sw3iermmvXeZY5ZVHeCSrPObT/PnsZXla1m6+R9y35sKGocGetZKpTXoAzgyhRMkc2UfNCRAxs6hQC+rIZAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6450fd4-662a-abaa-4b9e-1d8a4ff41962@suse.com>
Date: Mon, 11 Apr 2022 11:08:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Juergen Gross <jgross@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
 <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
 <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
 <DC3522A8-ADA1-4F6A-A3CF-C8095C2F639D@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DC3522A8-ADA1-4F6A-A3CF-C8095C2F639D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR05CA0016.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6cdbbd6-38a3-4e6e-b635-08da1b9ae0bd
X-MS-TrafficTypeDiagnostic: PAXPR04MB8352:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<PAXPR04MB8352C473A2900E3E5EE9069DB3EA9@PAXPR04MB8352.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uVF3giGG8fjApUNrPZgybxcVIGa5pVOqkyWiSv23vJaawajlu60+MN0u83pKXBL1Ujn6ekcfezONBCpQOWG9jaJblwBZwN4dGtDlht0fdd5mw5sxmj37BPC1xaEUOeUX4ujK+9UJg1w+BPGcbN3wumEssPqoIumELtB2MXpOA+wC9Y7jUq22wIp0WGoBh8CZP2i/YBoCABGXDnQj2CAv65hPfN+usT5MCQQRcy3uA4PdFtaoh6zF3j9qQFwC5KhnAEjpSUeZduHt9n6XhorpMmt3x0LTgK8PTAJvrsz2GZqwEvKftZtkDifnORHv3B6a0pCGED8aW68zwenHQiOQuL6/WQsi+jEzFmsTAuU3UHtiaZhnQNKfk/9KcFcJ2tCpNMiX79NC4n6PhxFVZ23zgyRZUnys4EWN+QVo35ku9htqI4pGrVKocoZ2ckXS6ux9r6sscA97tFUKkV2XBgRg6p7YApwKIbhMGo+4VeRbUoNBw41gYNTI9O8lIj/NWUpkAm3zqIzmy69kGzkmmayqPZEYjKBr8VLo2BXObRi1XkwfareslYOxbqyE0jHrOKoyi6loGqKCh9AgGmHyp24CzI/kB9fOOKja8IwYIbAipJIvmrqsgH5o4SNkuUSNqM/bgoAwRShXhwk1kJVbAg2ISaYUexqTvt9ZcP3Ut7uRGj1+UMnWX9sNndg84caOjokws6sm540Z8tv2+Oly31Z4sKxYWo0g8AcfQu40Zjkgne21bBhgGvcROUo3Ecmtaz5gKJsFSRT00UWXUd81eqTt/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(508600001)(86362001)(6666004)(6486002)(66556008)(316002)(54906003)(6916009)(53546011)(6512007)(66476007)(31696002)(66946007)(4326008)(8676002)(5660300002)(8936002)(66574015)(38100700002)(31686004)(36756003)(83380400001)(186003)(2616005)(2906002)(26005)(7416002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OoSUEkpYl9lXFumFhRxNyKxpyFt3WJcjCC55xSd2MyypcUAUI9vGPtMuDawf?=
 =?us-ascii?Q?U4POnVvK3TAj4h5rkNOcjKsg7Tv/axLSMcTe+nn2pn5MP78xGySNkB6iwUAW?=
 =?us-ascii?Q?z8qzMgoxtIssgAV3feQIAbJLgpXM3h+FOtV8J+lbKvBZuy5nVrpJuaHcG02Z?=
 =?us-ascii?Q?XQQvlTkUmK0QxU1CjhR1c6AoIMjP3myFrkBkOmAsAlFBHdLXtKnaWsK5rc4R?=
 =?us-ascii?Q?BJLoUWjTPAqDvWI5Swc9JWS8Elv6Dyk0vqyW021bXo4jX2sK9pO1YIRI1m/Y?=
 =?us-ascii?Q?bytCMTX4X8Dz0RDN9ZvJaQiY3qX8sXJAKt98tYEhOTLRWhIBe+ognYGzi5Px?=
 =?us-ascii?Q?xTkf2e6sh7g0n3Wx/UZDPhLE6zf5j/W30Q9Z1rEvg4TDeK6RwRFqPcOHAUPy?=
 =?us-ascii?Q?JDp9H55E8c18BsB1RjRm11FvBY4v2v3qyXt8lIupwiJLgfO7sDTGb8s7gyFm?=
 =?us-ascii?Q?VY71qFSr9mlXeMg87IcVGppx4kiZ8Y9nsBYxdsu1ZmK05xEFNz/+/egv5dlh?=
 =?us-ascii?Q?Iw9Bb0z7jqu/GI5ulUmyQJ0/6LrXGULEWeMqRj380VRTr0yWyl1jVxSDhypj?=
 =?us-ascii?Q?Am5i4pKXOeSPJZgb0gt04STnmkwS0otQQDDnvxj3Ggbh1R4iuVpaQadzDdvb?=
 =?us-ascii?Q?b5XMe/cRNr3TdBrXZYyc+N/XfPjD5VjIx6vUxjhGgYlSfkNRYjmLBsPzK48Z?=
 =?us-ascii?Q?UP/l1o0h+aqy/9OFVxVGHjT9Zh1+b3j7Mrb7TlhUj3BXfrFmNmz+QiF/07tn?=
 =?us-ascii?Q?hu74uKX/WanGiHhzriZEQZCcQvjQokK6ePp7KpVSJIvL9s3Xm8yOi/ctXy2D?=
 =?us-ascii?Q?c3d3QiRvWaOGa+2aymhqlMQRx9e+WbMEmqVPZPeX2V1zH92muaiKjJ6TS39V?=
 =?us-ascii?Q?Io6jd/kWqj+rQ0oNu/wJ1gf31+iIcePBklApkSbkbr+zPn8xEqYq4IK/kPP2?=
 =?us-ascii?Q?88Vy5nO+9gmx41xzB+1FHUSx/dzpmZjsMqqBzwcJ7ElEJ+ZbO3a8r5d1Gsgp?=
 =?us-ascii?Q?tFEKmgFe5XPAIm7+nvdx189qNKwdOg28q/a7b3E8TtQFOoLeltvb3QlnHgiz?=
 =?us-ascii?Q?WFuuDGHvH5dpdT9eXkSULKL8meBv2da1S/jwpoYzlaHSgmLWCU1OdC/mCE2b?=
 =?us-ascii?Q?GNpt3isD8zcZ7fyFgdR4aqIqJUqXo8vitWw4gl/WcBJJyOGP4Q28VKb6A50q?=
 =?us-ascii?Q?Pb/fFTQc2UX9rYgdyPyjlWBjuSmlGoCa5dZ0QETHoZ7BzoWLVgBfu2KQBzZi?=
 =?us-ascii?Q?RAf/VQfFqyl3hv+lAxAaIziJ92zBpWSNgR9dy/RSIzh76/HfrqAVMMxiZy2I?=
 =?us-ascii?Q?8yosNR/YdQanoQkB/l9hvjICx+4qFiTM6T55TjDH58fbIfGyUFM4ezQXBJ52?=
 =?us-ascii?Q?NVTNrXEumSHGLhAmqoshZ6VMCGc1AEANQEQTdYYvOvbH59t4IyqU5YqdDb1R?=
 =?us-ascii?Q?qtnJwbgsPZR0NJVtF9I557Xla8xi9jFDQbPr7zXVj+8pNZSKoK36MOl7fcfS?=
 =?us-ascii?Q?nxiSSMj2dvJDW7gtbeTEMCGlJsZkE+SDXDhXKN2NUvQm+uqLvB/9xdxtrsej?=
 =?us-ascii?Q?2MImSgfNKcK5F2ZmyJUmY8xaQNXoKPLXO0kN4yzTwsv0KmH97VHhZXiWn1VT?=
 =?us-ascii?Q?z7pldFj2UDphS01+t4DcHsFAv60zc3aml9wnsqA8ZvU+YVgE7KXXwF9+NTJ/?=
 =?us-ascii?Q?h1cPXA3OhQ6SdAhY4my6Z+ILN8Wc/aXWoUwkSg4uBePQQkZRF6S0ioWPBL2o?=
 =?us-ascii?Q?FR6uNsrFMQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6cdbbd6-38a3-4e6e-b635-08da1b9ae0bd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 09:08:44.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgZ6s1SG7pi0mS/VUAy/S/9PkgwO1CudkvW39IZqsy+ojKLeiE4Hp7Zg5YKMFGSyQBnD8tso5hOw69mVLjA3IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8352

On 11.04.2022 10:54, Luca Fancellu wrote:
>> On 8 Apr 2022, at 13:10, Jan Beulich <jbeulich@suse.com> wrote:
>> On 08.04.2022 13:15, Luca Fancellu wrote:
>>>> On 8 Apr 2022, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.04.2022 11:39, Luca Fancellu wrote:
>>>>>> On 8 Apr 2022, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 08.04.2022 10:45, Luca Fancellu wrote:
>>>>>>> @@ -106,6 +106,8 @@ struct xen_domctl_createdomain {
>>>>>>> /* Per-vCPU buffer size in bytes. 0 to disable. */
>>>>>>> uint32_t vmtrace_size;
>>>>>>>
>>>>>>> + uint32_t cpupool_id;
>>>>>>
>>>>>> This could do with a comment explaining default behavior. In particu=
lar
>>>>>> I wonder what 0 means: Looking at cpupool_destroy() I can't see that=
 it
>>>>>> would be impossible to delete pool 0 (but there may of course be
>>>>>> reasons elsewhere, e.g. preventing pool 0 to ever go empty) - J=C3=
=BCrgen?
>>>>>> Yet if pool 0 can be removed, zero being passed in here should imo n=
ot
>>>>>> lead to failure of VM creation. Otoh I understand that this would
>>>>>> already happen ahead of your change, preventing of which would
>>>>>> apparently possible only via passing CPUPOOLID_NONE here.
>>>>>
>>>>> Pool-0 can=E2=80=99t be emptied because Dom0 is sitting there (the pa=
tch is modifying
>>>>> cpupool_id only for DomUs).
>>>>
>>>> But we're talking about dom0less as per the subject of the patch here.
>>>
>>> Domains started using dom0less feature are not privileged and can=E2=80=
=99t do any operation
>>> on cpu pools, that=E2=80=99s why I thought about Dom0.
>>
>> It's all a matter of XSM policy what a domain may or may not be able
>> to carry out.
>=20
> Yes you are right, however I didn=E2=80=99t see so far this use case with=
 a domU and the tool stack,
> probably because it would need also xenstore etc=E2=80=A6 I=E2=80=99m awa=
re that there is some work going
> on to enable it also for dom0less domUs, so my question is:
>=20
> Do you see this as a blocker for this patch? Are you ok if I send this pa=
tch with just the comment
> below or in your opinion this patch requires some other work?

Agreement looks to be that there should be precautionary code added
to prevent the deleting of pool 0. This imo wants to be a prereq
change to the one here.

Jan


