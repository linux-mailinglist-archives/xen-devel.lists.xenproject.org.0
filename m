Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C255C46171E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 14:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234552.407020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrh8y-0005Ds-CT; Mon, 29 Nov 2021 13:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234552.407020; Mon, 29 Nov 2021 13:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrh8y-0005AR-9N; Mon, 29 Nov 2021 13:56:32 +0000
Received: by outflank-mailman (input) for mailman id 234552;
 Mon, 29 Nov 2021 13:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LLD+=QQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mrh8x-0005AG-DV
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 13:56:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2498a607-511c-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 14:56:25 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-qS6MBWRTNV22Uk9zEDD0Bg-1; Mon, 29 Nov 2021 14:56:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6672.eurprd04.prod.outlook.com (2603:10a6:803:127::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 13:56:28 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 13:56:28 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0081.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Mon, 29 Nov 2021 13:56:27 +0000
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
X-Inumbo-ID: 2498a607-511c-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638194190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t3ylgCzAb2LdET6nnO9kFNvE+/aKPDEwrNVrDvlGq7I=;
	b=KDn54nAMkpgh1iFNJNLt+vC2/LWmT1Hsr7WmqaMchOXJZeOHGUbomqrMlCQwrRKs/nWk6R
	fypx0lrszmjUqNiNzGjMbIFVHtgjtAJftFpy+XHH2iv8KtlFYIevzaAesVmCVIO+dtKGIF
	/l30bJEmrYgnZ1b/4pac55MswjkOSUA=
X-MC-Unique: qS6MBWRTNV22Uk9zEDD0Bg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAKzI0/fObkOAT+34X/+oM7YXUJVuhhHrSRInI8h0IOtaeM7RdAw9PtlVUmNP/NRspOTIynxmWvEF/2I3Am/AF+opx+jXsu5n9SMLWsJPaOlM4c2OKJIH+nIanlH95Wu4ebGIEPG0RdWr4Yb16116SNlG0/CwCZttKp4l1L6BQVppSCeDCdconSjMG9MFYA6/AIlaPFt3RIbEFgM0YF5GuU5K35nLJWNpCtd6tFx19hMjp85G1ojAOsG+Sg/7jFpZXdOFuJTmPtckLZukQlyMJncX5KsqsPzr0BTkwKpE52s3o9tVGQwaeVza0Dip1T/5xb6nqbCq2fLgrppYUo6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kl+Ii5rFayTV1u5aR7KD0BD+EsHRoQqk7iPIdSU9C80=;
 b=nxyOcESV+6epLBO4D324xy84bK22VrsWCK47r7JqqFKa4GXiFpB23Vy8aCM3mj4b1SoB5a7PL9zhKNpeBdZ4uuaQmHUu7/P+kiVY1amH7GUiBHi575Rz07KxGYcqZFIQYVAA3GmGeZvAGUwBdcN33UgWPCsk6bLF/hCImRrOGrIDiJQhZsw9wts0PPvrg4febzj8243ICVDzjcaGKJtg95O9/SGHi3Ckt0xZqBGVFYBmg9j3qet+KbptsZtNr2dw82eyjkESj3rcMH5fjKZlV1qF3Aqt519ZSKrd5LxWrk3PoO+oI45juhjdChs8zo0lBwNpSDwgSyrJliTXjmw2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <334d147c-6b9a-3ad5-f162-00fca3c54fcf@suse.com>
Date: Mon, 29 Nov 2021 14:56:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 19/65] xen/tasklet: Annotate fnptr targets
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-20-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-20-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0081.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 007270e9-d34e-4dd1-82d8-08d9b3400a4f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6672:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6672A71CC0381A6F5916F9D6B3669@VE1PR04MB6672.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s0TZ7jCV3H+I1WzMdbZh4YJlN5QPLDlTVzYL2Omzj/sQT8cRQWEx0UqdrI/1NrSL12HMZjucoveu1gski/M8GLp2RBlHMeQXyuvVT+ocM5VZjJ8LymPWRKbUTf3dBkQ0/EEExoEBpaS9Ue5tsTldB1otycYUZDq4MioBO9ACOYEBAo3H4wZ7cLRjfd2/y1Y++mzBJ/aTEplnnu+PzbqA30yLhZ4n9kVqDeGNC903X8OL/QHIckrJPapXczlAV1jYm9VonrL45uA72v2YuTtQjGzFK85QMoLpo+5NzDUohQJB3axTotykoaumkkE0zb5AsqAJeiQJcZC7OqhWK9srRema5kBGNU64ZuMHSO3wkWUH/mgF0qr/MM69dwK05I6btm1W6NrRfbsIFBitCTkfnVKgT5Oh7zFVjXhR+Yq27EMZyaKmi/heuCGvT1s3SEGbzi9FCb7EVtUUHz+v1GoMFAFvCwkKsrqlML095xup6oZYdLpYnJj+43oS4SnTD3Elb3TSGSSUNz2lu43rpioiM1Ejv/Ee7lUYCb553wWnxhOyGYVjW+Jux7KV72veMO2iYZFEqiT5j+ameyim8bX9j09unqjESvI6H1aiRZ1h5E9bBdIKBKiJ+HKKDhXnJuAUn8aEpxwb6F+z6+hRxm0379uV4Ir2Av0+2xBu4mlOcBj8/zE9dBPrpEaMRRyh9gv9iK2hfBQ51mxH2/OwIIYyPL9/aQFN7dvH6fDYOYVgmI9pQxf8YpLlZiaJRh8gxhYe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(8676002)(6486002)(508600001)(8936002)(31686004)(66556008)(6916009)(66946007)(86362001)(66476007)(31696002)(186003)(5660300002)(956004)(53546011)(2906002)(4326008)(6666004)(36756003)(26005)(54906003)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?30ufV6A9L8FEnhz7y/1LRHCRAKhbx6TGZpuXGSxGMhEZnzHFAxfhksZfFPnh?=
 =?us-ascii?Q?4JIux0dSaWWXQvkN5qPaXmndxuPagVsaJyHVCTFSgyHwJjoskps5bnB5T528?=
 =?us-ascii?Q?qrx7iOXio1/wd9PSD73NNO1m7l0+2CukXqSVnEM3ORf8PORVXq1/qnuO9hS4?=
 =?us-ascii?Q?L4tXNgs+haZQQo80RmSy5n59nm7UmvyLVI9jWJQaJVgp3h0FcRfpJzRpaYVv?=
 =?us-ascii?Q?eygPuQXQ4uxIfrg6fBfPG3iauO5G30fDtiP0ECLjbakkVIdZeyDtKtwIvLp4?=
 =?us-ascii?Q?HuO1QebjGi1Il8H2G6F9Awmb4ORasFr/36KZ2pP/frpcdHLSM/NsVA3ynFwp?=
 =?us-ascii?Q?2sxXoq7+4aYYT7K3/fuCDJgwdTI3nADEN3/xGDkyRGge/yXBpyYSUaibd5LG?=
 =?us-ascii?Q?2tXWpdb7vbcR490n70hTOcNpw7UAsWZ00ntzA3xuuV7F80zOWtSLL1mXOOHY?=
 =?us-ascii?Q?ucB5ez2d87BFXIXH2YjdBid5jga3v/5TM/9FZ8/aqer363Vqm4UQMAxwkqBo?=
 =?us-ascii?Q?ZlRiIOwqcpgF2Sc1BezSIj0hkJuGdxQNaOp6uIWZa1Cn09mHnjwT59Tjfsd6?=
 =?us-ascii?Q?HQOwU/XSNk7DGmTx6lKpUfP2xWcGLJPUswDkr5tVWLAt48ds2CihcMSpcqhv?=
 =?us-ascii?Q?XqCe939pZYrRObJtZg72rvTijJuFNBFFuJqpzYW03qAnHQL7ixnR8PJW6VJV?=
 =?us-ascii?Q?iDCNBYlmgqnLEirE+/wWQjDfGZcoLjb5BDnm4cb8vvWgRoYcgqSGReUY7oLs?=
 =?us-ascii?Q?EZTdtVSEz7GDKEmvMadVKOmWy4kVgajmz/KhZhzUT6u6S3xyJR2BbDj/RzoF?=
 =?us-ascii?Q?EVvuhTCaaTaCPyGn/xbEfuif80PzNCOh9HpDsMFzdvyf6SiSHL4NUGg+7g47?=
 =?us-ascii?Q?6de63Ozr9cnO2vU3IAb/V0znjKH6HEicf0b9eXPgwpwVvpT3aBKxITMtNu6B?=
 =?us-ascii?Q?P0kr0HHWI3FU4w8+3BAHUi8KtQ0+fo1mT8dYjKXiOeG92H7pyHt1HNBM9p0g?=
 =?us-ascii?Q?pDgXzifUiDYVUTga4ot88ymbSyi9adXmHxL7FWIAAS4M99aFP5faZcUNFO/Y?=
 =?us-ascii?Q?IKZEJ/z98zsar+Qc6aiTCVxmWdPXfdLVGbl5hZIpVfnnHhhZSZGoFjWkv7xP?=
 =?us-ascii?Q?R2owjvQfMEiz4xPBFb1pvaeZfy+KONB4Y6Ft0ljH1cd78BsoSn7y7qg3Xcm/?=
 =?us-ascii?Q?7B4jBEomyQOCkZy91eQRVC0F3d01Ta5Wi/V/1g/RKUdH7aJtnoJWwVhe/fvc?=
 =?us-ascii?Q?ZuKANAM4+6bBwXmgKbSrOhCd7ooHcQmpiuGIo4sdDMwzap3RjzaB2gZM94zT?=
 =?us-ascii?Q?F50MyswsKey3C+lUKikoqUSu67BRuabdZWZ8dChXUAJdzV6LS73trHZHnoTR?=
 =?us-ascii?Q?JhC3lzKt6QiWf6iNDEEtjo4xZoLzRyVEZ2GnWmbyPOF87hJU60L1bK8QqW59?=
 =?us-ascii?Q?l2Xt6r60jSC1krPI0hmG9+ak5nJDYryS+nK8lP0Osw8x1MgMJQ+qKBjlOfzv?=
 =?us-ascii?Q?dHOoGhpigMvfrjgWz+p9SL/8bR4DJl6ASiT9v43CYEphJNdw/rWymPtzgD0r?=
 =?us-ascii?Q?DaFrlLJEi3FWjRQivu2y8LK7UNFtiR7/farkkHdlDvBnmvxTh7VO/f4HnDLK?=
 =?us-ascii?Q?NCBnIv4LIIuTeXuvjq0zuY4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 007270e9-d34e-4dd1-82d8-08d9b3400a4f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 13:56:28.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njSSEV0f/Pngi1CDhu7L9qNq1KrU54rwy7TD63tG28s9s69Wf4zXbLmtw8HtNrBE0cTgmQHOdN6xppWgAsjrrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6672

On 26.11.2021 13:34, Andrew Cooper wrote:
> The function pointer cast in hvm_vcpu_initialise() is undefined behaviour=
.
>=20
> While it happens to function correctly before this point, it is not
> incompatible with control flow typechecking,

DYM "is now incompatible" or "is not compatible"?

> so introduce a new
> hvm_assert_evtchn_irq_tasklet() to handle the parameter type conversion i=
n a
> legal way.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/arch/x86/hvm/hvm.c                    | 7 ++++++-
>  xen/arch/x86/hvm/vlapic.c                 | 2 +-
>  xen/arch/x86/mm/shadow/common.c           | 2 +-
>  xen/common/domain.c                       | 2 +-
>  xen/common/keyhandler.c                   | 6 +++---
>  xen/common/livepatch.c                    | 2 +-
>  xen/common/stop_machine.c                 | 2 +-
>  xen/common/trace.c                        | 2 +-
>  xen/drivers/char/console.c                | 2 +-
>  xen/drivers/passthrough/amd/iommu_guest.c | 2 +-
>  xen/drivers/passthrough/amd/iommu_init.c  | 4 ++--
>  xen/drivers/passthrough/arm/smmu-v3.c     | 6 +++---

Wrt my remark in an earlier patch - any reason that here you do touch an
Arm-only file?

Jan


