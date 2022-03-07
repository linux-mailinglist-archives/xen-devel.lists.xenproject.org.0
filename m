Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D19754D02E4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 16:30:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286195.485605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFIc-0007Xy-Jc; Mon, 07 Mar 2022 15:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286195.485605; Mon, 07 Mar 2022 15:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRFIc-0007Vk-GY; Mon, 07 Mar 2022 15:29:26 +0000
Received: by outflank-mailman (input) for mailman id 286195;
 Mon, 07 Mar 2022 15:29:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRFIb-0007Ve-4A
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 15:29:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5da86a30-9e2b-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 16:29:23 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-_l2mH8TAMHy8S6EbEt8_qQ-1; Mon, 07 Mar 2022 16:29:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by GV1PR04MB9184.eurprd04.prod.outlook.com (2603:10a6:150:28::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 15:29:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 15:29:21 +0000
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
X-Inumbo-ID: 5da86a30-9e2b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646666963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRZVMtaqDlsKl8Tru3ZNcYRu9khEjIaHFi3H2J7T5RU=;
	b=K0XPxw5YnLigxZbv2xsmL6PI/dQFyJ9mcRThWlrKtYqXpKxK+o3MlylYWdDmVRAluVE+Br
	xtB1KiEKCoQMB0Dvi2kOKQJV1Jlt3lZykALhkVRA/rZjIu2hy6zEL+nGp08drG/fCw4zrU
	RtOy5MFI/d8uEW4CIBq5DfrF+lgmm5A=
X-MC-Unique: _l2mH8TAMHy8S6EbEt8_qQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UakJC8KMTGI5FHuIa5+YRz/OOw3+m7W7NBMG18f99rjUFrqZQoBJs33O5kRjFkF18u761BRscb0H7/MSm4CcLh2vd0huV8vi37S1hGqCX75uIwdMZixLhLVi1PnHh8PMrpneU1nhE31w6H6J3hLSR1sE33JZheLz0/vrtHaEeEQXwe32ZYU5zXepegjkgpEKQGEKunckVO+dfLCzEhUSrC584YR3stk+nL5+4/02HLIVWM5PW0J2sBo8AeujrdEXluWb+9tqHsUtfJLhamBXwZXJS15wHsHSyNewzRlxYBC2kxZAqK1u4eGpervnaw/gRaEoDGEKPu8EFdBxOCW5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0VkT6DXU3YRObGk0/mjBplc0jMgZPZyH+wkIlIXrms=;
 b=B23h+aSl9NVgslSfLnxwJubydFvQepI6bWaejZQI93ht0aNU1UVPVwl29dvPP+RzjRwVFPRaJo4Oo39BhCc7ckowZf+Mex7cm+gjwhJf3wjjL7fsfcqXJH/aaiYZ/PnRSoAcxNSYcnbqPweNKxlAbHv4BTuFRSm1g1Okv6+Hra1WJwzZLkTQzC+m4iZV+fsdgo2Wj5/w9PwkjwB/ONJ7JMwD/gxlpk22wT6Lz0O+ECbhVEQ/BwX0Nc+jiLMdeKmCOQ+kz6ZT2Cru8k8oJ0Sxwn07xIn61KhDdVAC9EL2aWBFn3832L9El2n9qn7Li6vHTpTeM5+It8cSHq8Ejkdmtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ca144758-da48-00a1-1e76-872c3455c335@suse.com>
Date: Mon, 7 Mar 2022 16:29:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86: avoid SORT_BY_INIT_PRIORITY with old GNU ld
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <8b982bab-9b16-61e7-620f-5a5b2be39588@suse.com>
 <YiYfVmW3iQ4wA5k/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYfVmW3iQ4wA5k/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR0502CA0063.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::40) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 967f03ca-e2be-4222-a66d-08da004f4043
X-MS-TrafficTypeDiagnostic: GV1PR04MB9184:EE_
X-Microsoft-Antispam-PRVS:
	<GV1PR04MB91849A49BED7E6761121379EB3089@GV1PR04MB9184.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BQrwYWhlll7xyiVZgb5Cx7ynTKM03pNx1HMStG0eOs9wFvFZ2U0W7o+6a4wQ7UYgiJQUzpk/MsgZZ9gXgeiwjttU/aSiuOMYfc8NncypNGRV8GNcnfw4uCeDc6pFvReswdeWyQSFlTtUWyc5bfLkLczPg05E776qX00Nh+R+iI9aM57r5c6kJBYf7kAJlc9VCohK7/VVAKtJ2dAejP1+AXRMPW2FJN113In5q2uv/r3cV76J/rYTZYUVXuXkVCoL7M3AHixZRn+d5JmytAup0IZZo/DbHKLLEXwCuX8fWx37zSitF5BA3Utoz8i2KJvXaNftIhmF21aJURBolXXslYzmwJPz2LBcm8hecbGBHwOssmzo6Kp8hCrmXuJJUjwcu6vL0i5F6Izie5WxPRvzKRp3paMFizoTX9r1yl4ibzv1rOybcJ0CS9DR/DLqKlVngz0VO+W4LlksCu/iKL7H/IJNN23uLt2qaq2uyHyVAJcxcipy0P4Vt6lL3NcA7vDvwRzfRhHKhnW9kqJ8FLKpvoLqeSAXuL+4soobD9rHAek9EzLXBdmFx/qBMLHTDdPPjjrt98T4adCYNfpRy+YXOlzgfDtmPQ67bzcg8jCv58mVFa4ow89OJWIuZITck1Qu70QF/SV0KF4ufEAGyjQhLGaD/JGH0/ROBlXkkmOAA3EwSi93XytPrx/R71pw7BfbpNhLFTdYmk3CAnhQGWl32dQB7PBWRGRS0+lkpbcS45o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(86362001)(26005)(186003)(36756003)(8936002)(4326008)(316002)(66946007)(66556008)(66476007)(5660300002)(8676002)(2906002)(6506007)(54906003)(6916009)(53546011)(2616005)(31686004)(508600001)(6512007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W75P4YdEsomNnhTvvIT+1c6vtua9Syks8ZTUTeKoruPglh3DwcUO86aq9RMO?=
 =?us-ascii?Q?AlHQEsNqob94dXTurYhYu8GjqK3KWoNMYfcuJxZtQ9qHqyP4fky33Q+IfqT1?=
 =?us-ascii?Q?L8qcRp+0m3U/6S4UYRunzMdZvHH1lwYuEpc1D9EDQnJHpPWHADavw0E8ZdM+?=
 =?us-ascii?Q?1PDyukxaIC+Ho/7idwuFRLbrZ919t5IXjgXk0oWFtfX/4J/gycVNQMWsOe9q?=
 =?us-ascii?Q?5kMHBJZ3m7PNH74dvm4+DzSSHpMeJWjFxftsYA++jhRpcon1gwjgZLDq2wMg?=
 =?us-ascii?Q?vbcMIy6JbJkzbP3H7Fe52CQIEXjF54YzYjJsa5H0VwvulRtbD3vJQgFQF65a?=
 =?us-ascii?Q?TSYszBeae1XaXmbsEj4ZNoSvbmiPSTsXCeZTf1EDH0tXPSmrrQiJYKb6N3MK?=
 =?us-ascii?Q?2OO3V4NCUsju17Pd8aFmZ3+xIWHDTjjiekKCufcUYGnbsg1+2riQKGkwyYt/?=
 =?us-ascii?Q?5Zk8eWGcOWLCYxL75KBa1yChaCUB82g4rOLJcWu5TCOz00Kv+PsPW0EE9Qa7?=
 =?us-ascii?Q?pQyhJI3brcxfUQqWNSNpM7lt7nY1jDz+PEELTPs50NxHC08M6keRZHvnQgMB?=
 =?us-ascii?Q?ZONGjP2ayu5erulMolSXCFdkic63UoVZww7D18XGSqZgw9HQGwLokfvMzVJd?=
 =?us-ascii?Q?1PxEAasTia5KwH4kMxvTur3tddkaz19CLosc8xfEtS43NQG78AxCJSvi7he1?=
 =?us-ascii?Q?YzBRY33S54q06dy6OUEzgkwB0ywtJsbI2nv1Sf0qYPvagCQC/4NDr7ypGGNH?=
 =?us-ascii?Q?uiFtbSVlmam63FOLX3P7iMQprGnLjSOe5XIKtb5483osvOq6WMc/Vvliglb7?=
 =?us-ascii?Q?qNeSJQ536nDNR8zb1F8Tq7/Y7eq0hVuq78k4OoKzOwKulBtF7z4GDHfBFGm0?=
 =?us-ascii?Q?JftikQp5mKgL7eZb+XM1Fh9ozpTZwSguUkKyHrcp7SlnPMmj4q7YZ1X+GjyR?=
 =?us-ascii?Q?J5kCQjfplMzAH1QWmL7NH+ot/ctEL4Dm8+3hGnjDCPBPQRqonO89PD3BpMO0?=
 =?us-ascii?Q?YZTvjRVKN+czEwbDXTMfxIYgyA6apTB0P2DZWUtlrj13xKaCrL0+mktdg5JC?=
 =?us-ascii?Q?I5CeMsGo1FBS0sqre8KfiJ+0sUu45doRxWQ2YRM9AaBw6xVRMF7ulVV6oneN?=
 =?us-ascii?Q?zF5XhIwpoQfwnN3aThGwpE+9hprU9UJguH5HSRX3veRAVGZgeedCls3B3jex?=
 =?us-ascii?Q?J70ZrI/gZLaZvuBYJZZZimJK3LsJMamJfNGVCDTPEjRrN6+AeIy9NxJQOHB7?=
 =?us-ascii?Q?5H+bLXo0U5GFRkqom6BVzmu9Pb1axWnau4Ok/Y6IFDcfYkGqiULhoKRMf+nX?=
 =?us-ascii?Q?NHp5SXAnp30rhcGNocL2YeLA5RPYp8BiXeYPQLyA5Ur0F5H4TM2YViCL0bL4?=
 =?us-ascii?Q?/pPkkxRWyl93K/X3hHs82bkqRRARB9YCOE84TKyCSAgg0s0lZ6/RAQ4S+382?=
 =?us-ascii?Q?kB2XuYHj4pbKhEe2Gvc7yjyRK0qzFzQnwqiaEjvgOmtQabDPxtEQ941P8MyS?=
 =?us-ascii?Q?hCSCwEzzpClf7xFBEH1jCEbpbIJ1z4AB0Le29WxJcDMAwceLg4aJOe0mTQ+m?=
 =?us-ascii?Q?Ivso9luJEyVTeofQgUPfYnQx7Ocok/RazurEyqP+4vZxWWE8YDhKckcJEaU+?=
 =?us-ascii?Q?kBYFidJ9L1R0nRbVLfesqVg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 967f03ca-e2be-4222-a66d-08da004f4043
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 15:29:21.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: clk7+BTbcBt8hZGWu28Mm/8dihw9BDmYSpi0aEvQnYxxFwWUep6Yd7AKkZTAIyuYOxXL8tG9tu4vw4DTx/9MPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9184

On 07.03.2022 16:05, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 02:49:32PM +0100, Jan Beulich wrote:
>> Support for this construct was added in 2.22 only. Avoid the need to
>> introduce logic to probe for linker script capabilities by (ab)using the
>> probe for a command line option having appeared at about the same time.
>>
>> Fixes: 4b7fd8153ddf ("x86: fold sections in final binaries")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Obviously this doesn't take care of old LLVM ld yet, if any care is
>> needed there in the first place.
>>
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -70,6 +70,11 @@ ifeq ($(CONFIG_UBSAN),y)
>>  $(call cc-option-add,CFLAGS_UBSAN,CC,-fno-sanitize=3Dalignment)
>>  endif
>> =20
>> +# While not much better than going by raw GNU ld version, utilize that =
the
>> +# feature we're after has appeared in the same release as the
>> +# --print-output-format command line option.
>> +AFLAGS-$(call ld-option,--print-output-format) +=3D -DHAVE_LD_SORT_BY_I=
NIT_PRIORITY
>=20
> LLVM ld doesn't have --print-output-format:
>=20
> % ld --print-output-format
> ld: error: unknown argument '--print-output-format'
>=20
> So it would be always defaulting to SORT. I'm not sure what to
> recommend.

Do you know if all versions we support know of SORT_BY_INIT_PRIORITY?

Jan


