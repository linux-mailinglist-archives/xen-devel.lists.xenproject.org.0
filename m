Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38649B739
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 16:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260457.449961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNQJ-00054B-H8; Tue, 25 Jan 2022 15:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260457.449961; Tue, 25 Jan 2022 15:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCNQJ-00052K-DQ; Tue, 25 Jan 2022 15:07:55 +0000
Received: by outflank-mailman (input) for mailman id 260457;
 Tue, 25 Jan 2022 15:07:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCNQH-00052E-PO
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 15:07:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91428de6-7df0-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 16:07:52 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-HWrTwOvXPZuXkE2-0k51gA-1; Tue, 25 Jan 2022 16:07:51 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4881.eurprd04.prod.outlook.com (2603:10a6:208:c8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 25 Jan
 2022 15:07:49 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 15:07:49 +0000
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
X-Inumbo-ID: 91428de6-7df0-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643123272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4b4XbUplJHKYZMl06J+PKJT13U+YfoUvnFI30oZVw6Q=;
	b=X7o8YYWh/JpkvJ0mcN9GGhRE2c5wNKkhwmmVgGBvoUFVH9rNuxropCF5Mr0u2MV+Zb9C4k
	6P26CmLuOGaSNQw6DtnjaWnGu4UDbPU/mAeWwLV8Rx4IEfRh1ZhtkDV8hW6HNgrjfNKcp8
	SbE78n2s0VgF42n3V5OXUBoHoUA/+Bc=
X-MC-Unique: HWrTwOvXPZuXkE2-0k51gA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQyYJ8KJskm7r/bCh4LSpDl6ex4mgVqDiRGn/TtN4COj/8chVHi4dJBsM1jNDXdOkJtUjm9ec7c44b42lOXjpMPdBiAsi491dtWPpqp4ctzDP4JSici3QufkvjR7jYesTQryzBFIyPdUcqElTZ/aYsxgbbiXpI3i8LdBXlVbC9EzHeQgnIDevsp+pewNemJRe+qz3Nrz2N2tOzLuXuoarHHlcj3R9QR/1OI96iOVktDRdtsxz9/6V0C/RIGUCHPLa5XTDp03HrnnJlEFmGy47+8+hdKKjOlbTIdm9+1Yz1mZ2sdyUR/blPWGommHPKyfqtn1TzB8wtBWz5rN58Bi7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsIe59JW2Q5UDiKGcwAZrE1MJ29ozAitMEwEe1GOFgg=;
 b=XRuS0cppK1L2GZcRFksM3Etff0VKBHVSdon/9ccZbCktCRF6bqsNM+bX8Mb2BlADPWqJCwpmCdcxgmqFswpWd66fJeb0987qUWlL3WtlvLLnOdzxLihr6i7SETbQXyVstg9res36Oa0gMHEiU94CaxhquKDB4gddPXHFY/Ihf5d5fx3YZeRdBvuW8w8BSZw2lhWZBlctwe0rLbt4SY2D3EwUSN5Yh7XV7RfD0Dvni2t2V5pB/kXQT0Nk/it5lELkgnEB9SILBnUztGN29yb4DR1MBrA8qbcjY+1HNZ7INBSakTrJFWwsssHxTLWr/m/GR448cetDZRxopKVJHoQVcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d68d2950-a09e-6b34-f06d-372ad171e0d0@suse.com>
Date: Tue, 25 Jan 2022 16:07:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86emul: recognize CLDEMOTE
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5812dc8e-d77d-f9de-4f37-b0ef094c5c09@suse.com>
 <YfAKzvb6QHpIza0p@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YfAKzvb6QHpIza0p@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::26) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2450ded2-4edf-4db5-765f-08d9e01473bb
X-MS-TrafficTypeDiagnostic: AM0PR04MB4881:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4881E837BC643DD7CB0053B2B35F9@AM0PR04MB4881.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gre15kGYo32FaqLNFnJKRqZ4RPMIlGwJfgMV4WxRytQtKCcivODVD+NVJXb0Ads/aGve3ru9ABxpsJlwO1JZmfn3zv1cxMranVp+J8+wmDel7Y6II/aYSvJ+s94ZtFUwG6bQgnjGWCpp/JbRrjn71UdOXmGBHAQ8vnf+dQtPCieQzO1sGBFZojiD+MDPUrUk+9ADKrCe7IJZ45tE1WObQviBLh5/yvXnQclMQoyDrhV5noy5at98s/++/qpvI4/zhgRxAHpUe1Bps6QI91uAUEHzr9uloE7xV2raT7knI0uyE1JVw2/8HRPtcV+5/LZSaJTYQfRRN10Rn5jsu0F+u3Zf8HuWid4ccBPNvBU+CKw8Ibn4UVxARdSaI4Htv59JtqTGUef8JruM6NkzBVlvUb01I+VQkXYV27UsMqwt6FCcwyMGdihko4SGUZr6ZNk1HFWaG952WE+CNSQ/TUTqaP/338y2xzByHVOAe5caXNKHNbQUXIx7khhJg/6dpekJlWCEUbx7xzxPnCHxuY+Z8Q5xxF3D20Hzj7pBPHGUJwqHygVLkBHfq0C4aEke3yBs5l6d4cpet4RUtCijfdw+oETD9/+NzJbl/+O02aMp25gYU8UyWLhHYaVccURNuTnLPai3eDBycMD8oe5IMi2q3CGxW5Z1FEZS5OVQCWfw//kEPsv+Uzk1GGbZTaBPFSInKb+uic0+aMxfd22h39Vhhg7xbxQrHD/EpKwo8nJiu475PAmEs1MEyz3xFeNIcwLu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(31696002)(86362001)(54906003)(316002)(6486002)(83380400001)(508600001)(6916009)(53546011)(66946007)(26005)(186003)(2616005)(38100700002)(36756003)(8936002)(5660300002)(31686004)(4326008)(2906002)(66556008)(8676002)(66476007)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNquDLbEQkMxvt8U4T0o70iG6mQFqmMWu1LpuJvin9DvZKWPxQnoOECIuIW9?=
 =?us-ascii?Q?3c4cWNAHZ34Y5cZckBx13wic+SN9UgsYS7tgbesk117y4mTqqniUWnwYful4?=
 =?us-ascii?Q?22zeqIboAyBFbLpTJTF9/2/BsGre3sAGha0UIfzAl8rZfha/h6DcpZAZmj7t?=
 =?us-ascii?Q?xN1ltLp4Dmedrjb3ZLpOZ+mtR2cFmY0CM/1L3dZdF5sG1HDaltFAYffesdjz?=
 =?us-ascii?Q?6jRTnDmEAoE0vXykuvdiG1AmvvgamrpsfzrRWh5CKOs+jGGW+kJFN20jrCYR?=
 =?us-ascii?Q?PtW9UGA7cvMUa+t51UfGU8kV8lYsgpgKeLrEH1hVBJCa9WD+CJHjl2chQjE/?=
 =?us-ascii?Q?jnQLyoKAMdQ89TepISsk+Fn38AzqB+1p7BJHUhCwiEcZ2vkqaHVKfpTBErsn?=
 =?us-ascii?Q?44PBjvvoWLtTTlAn1BMJQUJZavC72Pfl8DIp9eOwooQL399rUjgBXNt/BCyP?=
 =?us-ascii?Q?c87M5Vtgdw4JpTO+PETCkLW0Ylc6Cz4viHDtXS9kbuR1vG3TPu8M1zYyzz9d?=
 =?us-ascii?Q?VFpxQwTGTDZ00sqR3REKVf9P/rZ2Cj35ZTvr4UYv3csr5ZeL8JFZYbAdw3bV?=
 =?us-ascii?Q?a1LoYDzDH0v+6q5PrhMCzhEWa28sDlAWRy/Q9fW5n4DEgKT0KDyRzowcP0pV?=
 =?us-ascii?Q?2f5n8NaMsZgDfmnX/0yaR5l0BxzbYwW1L6J9e4hmsBG3m0SxSitNjgL1IYD8?=
 =?us-ascii?Q?3mttC/1ZukW79vbWcYoUrZiTPMPiJlDeGrPgN6hP0OKdbm6TryvQmYwvUPHl?=
 =?us-ascii?Q?UwCwp/ew+8cyNQ1u3KdPRxP2d9YV0Q6BtUwdtrFOWiYMSFhGGo4FihJrVQti?=
 =?us-ascii?Q?39fiGL2F1Ci1jlgnHy/5t4YhlumJPFlDZAoNJGNzRSbi+Yx4pjUFg4CI2l/0?=
 =?us-ascii?Q?syoNAyGh/QBPkGPI7w5/Fuw7z1TCTcFX/xWMMOiepSvxZa/RV2IgG3X+lszv?=
 =?us-ascii?Q?kSFIfCBbDbQ3acFEqHGfWpibboaLkiFbCrQ/xsDs5rort1coFCIDoslzkTz7?=
 =?us-ascii?Q?hUxHdSDTCqj+LLAjzRSTuWk34Ukew5fFlUjDtbed7z2awrKbAiwV3zBlXn+J?=
 =?us-ascii?Q?QaoLcOyI1B7mD/FEdveVqQRdOn24UNXkn7EGQ2tu3P0U9RU/FrdmnaVcjHzP?=
 =?us-ascii?Q?FxVVJn0dRLQq9MWEI7AIgtJlh8RTc33Ecu+VRsopsBiBEoEkxj1yVd2G28kd?=
 =?us-ascii?Q?WfMxZzCg79aaUHlqPmPZ82Mug/zLOzyZtyWBwETvGb2RBnj/4hlP5XtM3prS?=
 =?us-ascii?Q?61rS60N4vmNj+hxVTicoTXKupUDiOcaMe5nT0MTWnWsIXpaxCNxt39OUd6lJ?=
 =?us-ascii?Q?P3/2NIV3wRTOiPbMZBOeQLdCWWLz8uHLzrYjJoAzAqMyzLWS2wMetw7CXSvp?=
 =?us-ascii?Q?zZ3kAC+jCKKmBGytRLTBiLeaoTXYgVDhCK3HOAayMRQSycxT6jZRQxxJ4fxQ?=
 =?us-ascii?Q?JYkRgcRvVi267zEZbPGEOkbc641zhEELVo92iQIZ6B2vit9dyf/mwTljZhWj?=
 =?us-ascii?Q?VSKaqfkJfOeKIualMGckO5EwDkzCm4kzS/XpXhjIsPJcsoDe1dsY3PFYZd4L?=
 =?us-ascii?Q?92ITWqK4eu7yvcsPqy+ARAf1mCl9ytPNkTqZAPAdyg64fz6vyAP1qG5eArw9?=
 =?us-ascii?Q?fCY8pzm0A31Ll+rZHu+Dlcc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2450ded2-4edf-4db5-765f-08d9e01473bb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 15:07:49.6362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCWXICKDO91uhOONAtjTaaAxnatLJZ1+J9v3d80pzz3POeZ1BTQxqsH3x+E7KGTE2FAUfRx3y/zR1668zra2CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4881

On 25.01.2022 15:35, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 25, 2022 at 03:22:25PM +0100, Jan Beulich wrote:
>> We claim to support the insn, but so far the emulator has been handling
>> it as a NOP.
>=20
> While not ideal, the SDM mentions that "The CLDEMOTE instruction may
> be ignored by hardware in certain cases and is not a guarantee.".

Right; the same is effectively the case for CLFLUSH etc. Still, unlike
prefetches, we implement them in the emulator.

>> --- a/xen/arch/x86/hvm/emulate.c
>> +++ b/xen/arch/x86/hvm/emulate.c
>> @@ -2351,6 +2351,28 @@ static int hvmemul_cache_op(
>>           * to be sensibly used is in (virtualization unaware) firmware.
>>           */
>>          break;
>> +
>> +    case x86emul_cldemote:
>> +        ASSERT(!is_x86_system_segment(seg));
>> +
>> +        if ( !boot_cpu_has(X86_FEATURE_CLDEMOTE) ||
>> +             hvmemul_virtual_to_linear(seg, offset, 0, NULL, hvm_access=
_none,
>> +                                       hvmemul_ctxt, &addr) !=3D X86EMU=
L_OKAY )
>> +            break;
>> +
>> +        if ( hvmemul_ctxt->seg_reg[x86_seg_ss].dpl =3D=3D 3 )
>> +            pfec |=3D PFEC_user_mode;
>> +
>> +        mapping =3D hvmemul_map_linear_addr(addr, 0, pfec, hvmemul_ctxt=
);
>=20
> I think the emulator should map the address using the same cache
> attributes as the guest, or else the result might be different than
> intended?

That's a pre-existing problem everywhere, not something specific to
this one insn.

Jan


