Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE674A3FCA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262891.455333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETVZ-00015g-Bi; Mon, 31 Jan 2022 10:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262891.455333; Mon, 31 Jan 2022 10:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nETVZ-00013i-8R; Mon, 31 Jan 2022 10:02:01 +0000
Received: by outflank-mailman (input) for mailman id 262891;
 Mon, 31 Jan 2022 10:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nETVX-00013c-Vm
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:02:00 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3d6aa06-827c-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:01:58 +0100 (CET)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-E2Ckn_pHO2y909aZ-wvDWA-1; Mon, 31 Jan 2022 11:01:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2537.eurprd04.prod.outlook.com (2603:10a6:3:83::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:01:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:01:29 +0000
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
X-Inumbo-ID: d3d6aa06-827c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643623318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0FCkClQ69AOQ5fqmfgQnNLe5moj0NPPAhVc8/a9FwU=;
	b=GB2910jBRmg6oOqx1NGws0oV/RDwut68OUpUaqbVHH26argUVwFA/5hFfuZq5aRUjx6AsS
	iEi2VSVpqSrpsZKGr9CBuId88htdOnMTZceh7jIF3BJZKyIIr4rPzFQd4v+lPLJXpnx2fq
	lOXqG/HD9n3N3CVXw/V123e96wcyXEM=
X-MC-Unique: E2Ckn_pHO2y909aZ-wvDWA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRv94LwMO5sLT2Vp3BeQLZsH1Wbm5k/n7ixF4FXlJcBTvclQ7iyURYdX+PkgMJTNiBmMc/khX0PAGWrvacCakAIZNdu+MSbvjPRq4+jD6L+qdHfXXCfSdD+1jLUZyB7C/8gaoMOFKf/AL2y3EuP7usXm05/X3XFGOfDSqAk5R1cOhmgSzO5dYr9uW67egf7OaoQUjQeGs/VA0l/MoBPIYhvFd5He0kmNlG9jQ4O1a3rRdvzkiFoFf+8E3rJ4nncvBj+OY2aEcvPWaibTmN6sEnGwvEUrwovUAl+LlHxJbQDzseyT2zgxS8FPwv6b7f6Ac/LjzdgBPVn4WV3NfGS/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXdwXSTK37o3t9RKP4LKEQYzWlW/a22pCeDE/p+Za5Q=;
 b=mZQDjGcd4GUwDHQthep2WXuQjHmt0mCZzthJpgd/onOaCVBKPkMXgn+khSfzis3LcLqNM40HHGOKuzjLj9235fjSkbkTdM/D2WDS0QAl07e6ubZuz1QCVAR+OGYvxLOjKnMXjXd/y6w0Xx40eEf4H5D4iOOi2nsuEI5NL/6KozsAyf/HrfGKc924rFz/IflYFTSXbNqecMPZI75yBH0s+2r37vk5gDm1W55lIfWpVST9W86t+LRQ2LpZ1Aa2PU+A3NtyS3W/59chjEdTXOTPVcssF/iMQZyTIBRCQt4bhoc7cW8qR/rLelJT0ks5bMZ6PWZ7l0oqyGQCPvsNrr2/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43e4f24b-cc2a-cb36-c62b-6d46296a6217@suse.com>
Date: Mon, 31 Jan 2022 11:01:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH RFC] xen/pci: detect when BARs overlap RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20220126122648.52275-1-roger.pau@citrix.com>
 <8537763d-2601-4092-f70f-1abbdd0a211f@suse.com>
 <YfFshcEanUtXUlK3@Air-de-Roger>
 <c7be91c7-6010-1146-b6fb-92d4793ad49b@suse.com>
 <YfeygYAp6FjXYGa4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfeygYAp6FjXYGa4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0050.eurprd06.prod.outlook.com
 (2603:10a6:206::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 925c449c-2e68-4bc0-33b2-08d9e4a0a698
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2537:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB25377B602ED4E2F9476F6DA8B3259@HE1PR0401MB2537.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	f74ESFWDnrCB2QwxnONbJyjGe4g9IOL16xNq4rJw6NpUHZ1g64tnI4lvwJGAvje3apK+XjJbjAetz/yh6NHhlEbbZ7dBFcmsecyNyQPnM4llb6TZOFuvE5xTEfjsgQFZq4cBknzx8nO8VH8HnxrhAHbAX2Y+ixA8lixol3UkWvBfnoh3StqbImGlXCVEkCLYiY/52W/XbQOBRX29xJHPaqonFZJTkLK/QOGlhPaX0KYFUSUFPFU2hAIaa1O1m4pEH1k2sr8s49k3hSLF+kJc6dtduiAostnoc0/8Lo6t2Zsfkd8cCKZJc5IGV0YIJsL4Z71BRbt5O5fefkgphHnml1yy8Zu5DmJPjIJuLDJ69u/VQ6TPFo3W+35p7evTC00kKVXYE8XqAiC0FKPNN819XKYY9aPn21WysGljVV+zkm78ygJCWaB+/vrfWE8vIfXUXwcV6v8//UxU6kl0LNrdQu0fT0gE7IHnolR2UFxlAwagHGL1wQcwmxY8fbgV/a7KMZiQ+nvVrieau9ApEyEFZpoTjWZDgWJURx1DagwSdeptTfJbKT1bPS8cWhAN5CjmOtcm6ZwNvM4g9932iJLPRZA0Cht8u55S16RUmOIPeTyFYnP3+5nxxo9FSqDC24IXY3xYy8Ccb7/is47UEebl7IEVRdIZA5+DnR33BpaomTWazF+EmE7V26KOOQb92UPHxsbS3ZT2FFN5nhsmD7qxIBBUHUhFvex3ihY1bNY1Yus=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(6666004)(66476007)(66556008)(4326008)(186003)(5660300002)(7416002)(26005)(53546011)(2616005)(2906002)(8936002)(6506007)(66946007)(6512007)(6486002)(54906003)(6916009)(508600001)(31686004)(38100700002)(31696002)(86362001)(316002)(36756003)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OMvSzDkP5JDewcFfBHPO9XWvuqVBI82y1860u7j10UGtb9x65aFfyH1hv7kf?=
 =?us-ascii?Q?YpF253xmZSc8FZ3lFSnZnKjKxwJb3DBGClTPkO9kDeoiaRGJ2xxpt4EWCXC3?=
 =?us-ascii?Q?E0CaZNTIkDzKIALwzFbsk/E153v0vK90/JOZLSxEGnFwI9kIoUvY4o7fdHMF?=
 =?us-ascii?Q?5G1fSbDxfWqt7Bi69luyjRJNWuKSsq//OB8JuVFBe8CGqO3kBUoNnjnPKPAH?=
 =?us-ascii?Q?OZ25y1iO7PCLBDZ18tVsTT8YzT9yLETHXW4omo7EVmxrtPse3VsFN0PVnW8P?=
 =?us-ascii?Q?9GE4v2dIKJrTAv8VxxoQsruPC8oWIO5mKzhHZloSGNktR4Rgl9tnD7QKY9wZ?=
 =?us-ascii?Q?QDyEJyS+G4SYkMsh87yTNZFNwypXRi6+4psM1eJDG3bLhNHiqSPRbdd3ZB5w?=
 =?us-ascii?Q?1+zmWLuSXjUtDJGiKx2RqvlOkQMBpXULVEoUQC/VubQXSFfkJrIz2biYlBju?=
 =?us-ascii?Q?WX8X+DUJun3otUy7zMFDVZYPckou2FHYmTL7DPQo2fIAlLfVl1Q78TaH7/3m?=
 =?us-ascii?Q?z+VUbMQ5jKPc9/aFPgfNcRt/9Oil01RPIV9m6zC+5q3GthRC+PtLmWxt1A9L?=
 =?us-ascii?Q?tGQDSkF5A419OKTzZ00ZStXdnLMduVYRd4+nT6SOB1vu7rD225wC6QU4ICnq?=
 =?us-ascii?Q?YoHZW2GfEhgVX+YMoPPTfNTNk8plO4a9mWJILj1qpVtI104SHGFwAc8bmxAl?=
 =?us-ascii?Q?NjuT9T0tLxC+NDGU+rTygwPSa1mCOAyEMN4Cgf992nB/1SoswZIjofFmc19U?=
 =?us-ascii?Q?j8q9V0jLFtqWi6NCtvDWIK8jd4ICiHwzTeMCu3BmlOTc2BSaNMHspwHjKFC4?=
 =?us-ascii?Q?3gIqFE6HdnWTioVWJIEhIRQw2KuIHtzSmaL59rviPvLj6737d3MaTUe+7ATG?=
 =?us-ascii?Q?ASq1aMa3+Li0SBMzZtLaHuB/QCd7FDpNnF0MD5HcVSI/lK2orPiniJJp0Tsv?=
 =?us-ascii?Q?VsJngS7XDiIjklxbscWqvmnAbGQ8NO3vACmzHhX6Zhl2e5TvRSoi3aktNHWT?=
 =?us-ascii?Q?UPr6J56DEAiBEq1VmfKC+OhNefH50DDfzWeHPP54lfYYu50uA6eu5w1Yfkrj?=
 =?us-ascii?Q?sB3t8Ye1swhcSGMswTX6bIEJnAbUHj7SqnPv1MieXRXQRV2iEeMn8MivIgqz?=
 =?us-ascii?Q?mQhd+2+Qtzxy51tZ5XbHTLBG1s2sxAQ1m0Iyyf/QFG3HOaDBUHjCJ8O4qbJt?=
 =?us-ascii?Q?Hg61wQU8di/cZzLGp1vSpLBmaayZkamUI4lR4mQWF/Ee6z1TVjVpfZc1lrMw?=
 =?us-ascii?Q?a6S4f/VZIv0oVWkvlg/SC4tsUQAi2gp4yLH8hUAXrDwm00s60VSlo+yvSAlD?=
 =?us-ascii?Q?++8livq5wSHJ4czVU/slMnQtxJBf2zcNNs5fS3ZN1jiQtjZSm453aZJYFHEB?=
 =?us-ascii?Q?cvneCtsR8uGqyKYaoG/giLCHZiOY55tNKiplxs7LmtpLFzeche1vcwWNZGN9?=
 =?us-ascii?Q?ChoYqWZB2/Ann0TBQVfZWCizJE3lbe08PPEW8yhq7vnYnCw5QLDHnSofxJle?=
 =?us-ascii?Q?Im8Yfqv/SE0B/CHnVHJ/Hxxz1yZd0C5VDu2ckU2B+iTJjGE2YhJJSftPOjoh?=
 =?us-ascii?Q?n5U7e8eqzaxpKjafKrkJ1ngIjpNg2FZuIuc/3t0OPOtZU7byxEw9UV0nj+OD?=
 =?us-ascii?Q?XJlJe6fYeYVRZp3/Kg2Gq5w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925c449c-2e68-4bc0-33b2-08d9e4a0a698
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:01:29.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uFLXzH3fiYzCFDsu+3i3CGnjAqrjS8ZRmX2EG2zF/e9uoeu2IzgH85lBpgiln119GeITr2u9waNmt/H3I0C8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2537

On 31.01.2022 10:57, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jan 28, 2022 at 07:48:44AM +0100, Jan Beulich wrote:
>> On 26.01.2022 16:45, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Jan 26, 2022 at 03:08:28PM +0100, Jan Beulich wrote:
>>>> On 26.01.2022 13:26, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -479,6 +479,26 @@ unsigned int page_get_ram_type(mfn_t mfn)
>>>>>      return type ?: RAM_TYPE_UNKNOWN;
>>>>>  }
>>>>> =20
>>>>> +bool is_iomem_range(uint64_t start, uint64_t size)
>>>>
>>>> Might be nice to have this sit next it is_iomem_page(). And wouldn't
>>>> at least "start" better be paddr_t?
>>>
>>> (paddr_t, size_t) would be better, but AFAICT size_t can be an
>>> unsigned long and on Arm32 that won't be suitable for holding a 64bit
>>> BAR size.
>>
>> Talking of representing the range - a BAR occupying one part of a
>> page overlapping an E820 entry covering another part of that same
>> page is going to be equally bad, I think. The range may therefore
>> want expressing in page granularity. This may then be easier as
>> [start,end], at least on the calling side (can use PFN_DOWN()
>> twice then).
>=20
> Yes, indeed, would likely be better. Then I can make both parameters
> unsigned long.
>=20
> I also think is_memory_hole would be a suitable name given the new
> implementation?

I'd be fine with this name, fwiw.

Jan


