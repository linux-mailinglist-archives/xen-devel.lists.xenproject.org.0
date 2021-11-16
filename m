Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745A45378B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226443.391358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1O9-0004qG-Sg; Tue, 16 Nov 2021 16:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226443.391358; Tue, 16 Nov 2021 16:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn1O9-0004nc-Ow; Tue, 16 Nov 2021 16:32:53 +0000
Received: by outflank-mailman (input) for mailman id 226443;
 Tue, 16 Nov 2021 16:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mn1O8-0004nW-61
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:32:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d73eb3d6-46fa-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 17:32:51 +0100 (CET)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-d2Dm141oNRGMOdAjKkrGow-1;
 Tue, 16 Nov 2021 17:32:49 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6176.eurprd04.prod.outlook.com (2603:10a6:803:f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 16:32:49 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:32:48 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0301CA0023.eurprd03.prod.outlook.com (2603:10a6:206:14::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 16:32:48 +0000
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
X-Inumbo-ID: d73eb3d6-46fa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637080370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Urt21Jy6oyL1rTrzNJtSPVrWuBplYhoH2CsCOmYZ5Fg=;
	b=cN8gh+KZRDiXmKkv15jJzATsA2bMB5F1DiKPyFh3e56I50M4Er1lcLHWUYBRM0gV6TGMTm
	nv2o3RW7UzqTFgkEViPSjnCsX7g3wXsOtOVFUusOExz1YAEQayjPktd11tNSAwtX7c24eP
	RyTX1HDxRFPWZLnLcLa9iyqtvNT9SCw=
X-MC-Unique: d2Dm141oNRGMOdAjKkrGow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBWZSU9OXKZgaY+yaTN/2SVzPR2wsXcbou7jmJYGCGkpH5PSrlL2ubNpRt1gA4eF8mA+gnGIW1EyexycWqS3C1PLKb2NY65uRRP02inDc71NrxAyQ81nuZFJBAK2SJOeut4kIkILDE1dJii/+POsTcHglF2N8wiJDVb5TCr9tHZmnORdRJTCbbFPlE17IjEOpUQOhsakrxnu6F2xb8SXDNRM3ahh7B+R7r+3L0xAhktwfEhdp94FMhxiDkPRLtH5vaFpksufdGFdfV0H6P5cjdprmbteTWPMfbbdtkbAZSst4Lz2eJZ53zofaPkKMZV9PMLhOu7WqpQzt1DUztaw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoV8X1/COFGdLD4+5W0MeVZ/soAz6pSDxROS/1Zcmvc=;
 b=eHdG+8yBdcN45cDpnoQubWTZr+zzg66kDeQKm8MJOOA1m0CaZG1f1qAnNeVF+Ba+PQ4UbS9RIvr1AiA0WJ+zH8GR4ff2/71lV2vTaDD2XMCh+ylQmAxJqSq5y08V8jPAVnRtzBVGnz6XYCLwB+9ouBvZvS6oyZFOwBSRcK8PR3tq/Q1+DC07bCUAbXTt97TCK2CmnR9qZ2GuGJHs2MPIogoul1RrMNteXpiSpp1/0XHDVm/nomBBbhWpLKoKvJr76KmV+VxCXQJ0SxHCTjfC+qyfu26xsA6KRgehM0I/mqVRY8OKXSx/Cp8+TVhWUy91a3AwtQBMuZ8s4VoqWBhsGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb8f9629-28d5-cd24-b3df-ba392f468066@suse.com>
Date: Tue, 16 Nov 2021 17:32:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] tests/resource: set grant version for created
 domains
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
CC: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20211115105106.928-1-roger.pau@citrix.com>
 <24979.49870.437400.419375@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24979.49870.437400.419375@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0023.eurprd03.prod.outlook.com
 (2603:10a6:206:14::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c76ec3b-d15e-4eb3-96a9-08d9a91eba07
X-MS-TrafficTypeDiagnostic: VI1PR04MB6176:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB617663DB046E362452901E93B3999@VI1PR04MB6176.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hwotfV4yRlN+que/E+5leTj08r0O0y8vph7VcF6TceAgdgiCAlT1Z074kjNDSyIcMT68jwmYLxrhAMga3tEwQ8z9VsPKNMV641+Az7g5kR08CpHiTE68rZDLn5xq8UCcQc6WJtOnRZwsZ1/PYYuwPqD24PQzlH2MbM1uh2bM4TqjTZU4+xnT6ngA7O5RMKvEUHkhDqBtKarVzU9FXCWXLdTqGuVdRj2LoMG2i5h55l7jrkVlDADhbRTAvx/MrBy9TXdEHOLXS8WPJw77t5kpTMwz8IMoKLYI6H7aKDIyEImj17l0emsrE7q3m4uiyCHnNGiZyXva4+vc54qip4YgLwQ2E/JKpIvZQt0q55xFL7LyQ4tJbMSPasdFN2N3R9lOVQ7uHpah8QQCFoFPsD9Jm1zaaVHo5UQVpZeUczbIppnGCr/BxjMpKejEt2Xmzl8zQ/jW4haK9XyLTP8fq6DAzEie2mxDVnXWUCuXRDgGR2I+vfuWbQBgW0lsKjiUKo9lUzqdInpiBwo2WuDh2V9cpXwZgsBcfUpeFyr4jaEQw3fXU1MIWBs87TMS0Oj7jh+mYaYVtJc7scSm+/sMo5s/iNFn+cGixOwzYWctonVc/5NuKmNp7UkLEJSubtA1SlYtFRGDNCvPfSaZxJ8vBBaSdEx97+7du9XomBdyHok93zt1VLF95vNF2xDjdNXFnfNsCYC/dgoLy4QHDkR39LvJkWNCMaGDq1vw7FuV080sM52KAMwARwFuWwXCfZgwRJ2Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(6486002)(4744005)(36756003)(186003)(54906003)(31696002)(26005)(4326008)(6916009)(53546011)(2906002)(5660300002)(66556008)(66476007)(66946007)(86362001)(8676002)(8936002)(956004)(38100700002)(31686004)(16576012)(508600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rb8L+aP2FBJwipke42cwxTNKvSjyXagrK2JzX3evNXzLBO7MioZ0yP1w4F2A?=
 =?us-ascii?Q?Ze7qpyisXi5GzhuMxG0y8G7JfONz/rWlOU56CsRVT4A5SHsrkSYQANO+Wy4V?=
 =?us-ascii?Q?2Mrxc4FReCjXaYtiwfxDDNPAGqdEcEaxtLLQmHzm+dUV+IIBiwYNCopwsILy?=
 =?us-ascii?Q?SCGO7oSU8LHoqKIjKWrnCXlQS2K7Qj3Um/Jq6HZdhqgiTx1BNXFvftND5VhC?=
 =?us-ascii?Q?0xjgwNnZiO7nV9AVbWPuVJek6iLcVFilNCAEY6aq4P8sOF4hVJNL11yOBM1v?=
 =?us-ascii?Q?uc/T9xL/M0GyLJxzIrcbBz7sOiveLdBQBv/iuRB2eYwky+xxg8u/LMoaE6SA?=
 =?us-ascii?Q?+3TelbnHlf1TxOTdTqFWtLHyldeHnobkIzEy7OXaz0/HbU/7oQ2UIh0sYyWL?=
 =?us-ascii?Q?ccpMdlQwhGhuoMjwUajkz7RdNBKBHwIVDfyLzwYhKTubrX4dJLMLeWQwquSR?=
 =?us-ascii?Q?xbyUPUnAjDse/PonuDd2m4fSEfsNTjMcOpfW9/XHYDMADGT6ZMN1oiXOqsNS?=
 =?us-ascii?Q?ilQN/5ukhJx8qMP9hQZs+aKtGCwxkIWsMqna9caQU2Wn+5DRSHGWpWQqadYP?=
 =?us-ascii?Q?NBDNWsC8y2o94UiE5Un6q5B3K3ufgypTnZ/NyiR/f62UOw2JqKsEgpNjFzF/?=
 =?us-ascii?Q?iEolA8DwKiqvOuGSZboaa65Bsmc+11RmEjzp/1uuH1Z+Dkl9spTIzo2RTKYh?=
 =?us-ascii?Q?RSa26hdNHCOSRAfICJ1z38C+VPYt9a3Tr4GNyp3yrDfgLolfpPH1JwM/oq1G?=
 =?us-ascii?Q?0aS7qjpZVFMPSAn+wZg9HU6lmc3Abi0cD0Bp6aol/Z0p7qJRaTNC9bbd1wx+?=
 =?us-ascii?Q?Zg5U+7CsFncAnlrWwhsrCrc3NIo1ckSNP5IkvtKIh7CKPsuAubMcKyKIc+Br?=
 =?us-ascii?Q?SrBAwYSW//VsWrYAOguzILVPIAVwf11b5XgdB6XICRpdaurbt40gcVYr1R80?=
 =?us-ascii?Q?ydpNjnZbs0OrfEE+aLXUcF+d/Fbfsq47J8bl3x+0u02M0H93VAZ4NROEk/x1?=
 =?us-ascii?Q?kxlkP8HWmfxyXsTR9zJErmGSpGHpiyWglyCjlmFs2DJNiVgN5X0ukZAoO9NE?=
 =?us-ascii?Q?pKSwSnnR4MFTyMVQRxENtN/M+vKWwtjUvJUWlLAfjel2RLV4pPx4TMa/IW0R?=
 =?us-ascii?Q?0MJJpbPkFQ+1fOqbCD0IrclxqF0ecKOjN55E+rjIeFLIllH/wOVWzxJjUW9A?=
 =?us-ascii?Q?osLrVtwwgZ3di72HT5T0GEYXQjqdiDubIlhi4TUP4stsB8MO6yiEsituzdBU?=
 =?us-ascii?Q?EbQgAW0CSXS6n7OcsVFNalZ3vIBaBnyZUJPZU7tsfpoT8LvBoy1BGPaBDS/t?=
 =?us-ascii?Q?Iv2ECqPUciXvBXRKw0nzR6CQ9iiH6lqI1097iT1H0Jq/aNT47WOnokoe/Rpd?=
 =?us-ascii?Q?9/FiaJ0GB/WQ8CgeEQN6EBWLE85uRKmecWpClvq00yrMHK2LmLIhzIHDbPeQ?=
 =?us-ascii?Q?WgjY3GslHHKTuTZNC5cphBqOzOV6xkX7EUo3aoXQvHe5rrRnLLA9Ybgc4MwH?=
 =?us-ascii?Q?odS9cOwLA/c7MYzyXa5MWexWz5sAsNlRNp/yz1bnOAkdfzvE/RpZR2D8jGHx?=
 =?us-ascii?Q?Y30qYmEjcHy0s0SqMQMNvXCO4NJ+dHnUaxrcJrXRBpigQrGu4tryLN45veSs?=
 =?us-ascii?Q?bC9922zsVcPLmbojMibYShQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c76ec3b-d15e-4eb3-96a9-08d9a91eba07
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:32:48.6247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FL1VGStH3301h+vWjZffXlyT1l/1LmVCIN6VR6k98NI81iRWMp7Wd63ZudPj8aAb4laiIiURM/ecS9F4cXFsiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6176

On 16.11.2021 15:40, Ian Jackson wrote:
> Roger Pau Monne writes ("[PATCH for-4.16] tests/resource: set grant versi=
on for created domains"):
>> Set the grant table version for the created domains to use version 1,
>> as that's the used by the test cases. Without setting the grant
>> version the domains for the tests cannot be created.
>>
>> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

I was meaning to commit this, but you've replied to the singleton v1
patch which is now in the middle of a 4-patch series. I can't very
well assume (silently) that you've meant your ack to apply to that
series - please clarify.

Jan


