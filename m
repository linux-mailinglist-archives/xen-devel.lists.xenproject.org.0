Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACF5337D0
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 09:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336937.561386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntloG-0001lV-2P; Wed, 25 May 2022 07:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336937.561386; Wed, 25 May 2022 07:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntloF-0001jL-VU; Wed, 25 May 2022 07:51:59 +0000
Received: by outflank-mailman (input) for mailman id 336937;
 Wed, 25 May 2022 07:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntloE-0001jF-TK
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 07:51:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d2c5d4e-dbff-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 09:51:57 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-wLnLSTpmO9eJUtMQ4unHWg-1; Wed, 25 May 2022 09:51:56 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5105.eurprd04.prod.outlook.com (2603:10a6:208:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 07:51:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 07:51:55 +0000
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
X-Inumbo-ID: 8d2c5d4e-dbff-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653465117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pn9rtXE42ijJYNgTY9Rj6MHE2GKtk7QSXn3pCApUFp4=;
	b=JjVcvaeInc0TO/gq2PFj5zEw1g4012yN2nmjCN5zjd3WOOjHmdaOQAK404TtKfmn4fAeys
	FVTwSiF9lH4x/Q88vKmnOlWsYMpq4++UACgqY3ObMyiIqNaAJeiArmXezuiJdIxpPk5y3a
	SNaXLsV7diXxK3osotIDuwV9gayjsbE=
X-MC-Unique: wLnLSTpmO9eJUtMQ4unHWg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a4EyOO7l/QyWERSbE1PkKrbetKeFv9CqkP03UFOazBFzua3veM12MgmHI+5w/kA5cDgv7xilok0uuHgoJoT8AMTafy2/IMD+wIVlU3rq4mu/npWI4gHmEOFfAaLG0ehJbFs/zznrNB7W7OEK/g0R5Z+vxswbSFDqcqmk496Qji16SYIEgMoOt0NtGhuti/O+iX8nMsH6Uzj0Ma8yFeFGqIPYe12UOF2bqKXuHCVPNSUl2EttaknBbJULO7bO5EMbyvjoYY4uP+cw2cwch8OZvpmHLvI5wbHegzpOLO1pnaBLrne83t6m/640jgyKso9gWOWkLWyGcnuZKlShPMyK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNhs6ubdAZz+cSCatdMToC3lcz9U6UQA5mJlDDIeuj8=;
 b=H61C+a2nEdTpGaAX8RYS2Os0Kh8TvxjNYO7fhmbPKfrtAw7UrT8MmERAQzQfQTdtDDhz+6biGjZKs7wDI4IzDaiflKOAv5gXBMyVBaw50xWvt9i6Qs1i/1DN88vSQQOBrcWx18MgUlvTz/GxPh3Fe795mAt5IA4TRhwbZU2Lp4kj92bldrAm3+ti+B3be/VIgaIWwmu2EP/YuV9HVAgzQFUICfQOSpGTujQKzDSNEjFfTBfUsgx3ZriEz6ynZl3lW13vURUFhI9VcgSUK1ISqg6K5eOWEFDll2ifQKkQYA6G5xqQ7OXjGFnduxbsrS1j+5j+hRDhPWtF7NTXQiAxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f14c2c10-427c-bad8-2762-985e3dc9a426@suse.com>
Date: Wed, 25 May 2022 09:51:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
 <Yo0L+mp5kP1zMU/d@Air-de-Roger>
 <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
 <Yo3Y4l5ybrJA7VC8@Air-de-Roger>
 <cd186f75-88b1-714d-2c53-951e778fa5d9@suse.com>
 <Yo3e87RdD0/wXn6M@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yo3e87RdD0/wXn6M@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6812e1a7-e24a-4b01-9065-08da3e236ff3
X-MS-TrafficTypeDiagnostic: AM0PR04MB5105:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB510598B31F3C6EBEF3CD0690B3D69@AM0PR04MB5105.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lLJnUQquq+iqp+Ys+ToWIV53mBH/9V3uAJlWjMOiQ1Yr/lHghHZYA2X57Vy1C6odkRNSXHjR6tAXoJLauqcp3miMeLGhjTFYNnF/ks8NZAwshbKUuEKKwMxtW3oIPJbOeB+DTrfEhPVMVovRXXZjLlXR3mTA90Ccf0F6zSlaGL4ye7lMU1M3wSdWJgq0bGsHBAYgQO0TT+dMkePcpcwm4UCJwMx2EEFT1o5AXt5VF98Ih4vVqlcf8g3ZbksxL1u1vHNGsJNs+K0w8o+9rZpdnG4ctim3aq1/Wp6ILeh43zIAqiittyOujFnnv5XM/Jz5VRb6NyljSvGoMYH4tDBFrOy0g6eNuXhxVz50tJYmHe5x5Jn2x/C+ww/vxlI9xsemL0l+CuE+RF4oTdsdkcpq/YODYL3SWqOleEzD8j/TrEUiWXHuYYgYWBscKuIBR34LDblffbCbn3NgVSDiWNbeIvAUUh9AuvWnTUu8QIWp+wRpjdTdrA617reEoX/FKDeWV6dAuRaFBwMyXb/StvRYzlfBIfh/mF0GYh+MMMzn76eAfwuG1UsapC5hIy5y9ohjnSEpDBfrIhpedi3dErQ+eztvL5ZT29TrFyZJFpotpBKM3EVLkpeRHsKQLDw9wT79gzZEoQFWHxXCPV/PwzuIBRHP4iRmaI8P88RB0YRxLmp4FmJ0z09+2bXgw46sw15Gd3Y6MRiauWIkj7PUqhyCRwFah9xY/Hq+xJKgZHE/1kTHeByix+C1CLikEBvQCxgG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(36756003)(54906003)(2906002)(86362001)(53546011)(186003)(6916009)(2616005)(31686004)(38100700002)(26005)(8936002)(66946007)(5660300002)(4326008)(66556008)(6512007)(66476007)(8676002)(6506007)(316002)(6486002)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sqvlkIdk1NWgLwh/mnbMLGU2P/3mbXjuWqrksXG9SiJdptbzLW1wgqj4wo3J?=
 =?us-ascii?Q?EaYMMbYs2ebCVXguU/I2PgRjz/RJZAkTL/k4arBjWMMDS8V77j01PeLif/vK?=
 =?us-ascii?Q?2Fno+nQXFTX5Y/p7E0hKQabWPnMxTGuyJkF4pOcvRvlbAJub6LWZA0T+Ea2k?=
 =?us-ascii?Q?eGwIRxOXwhbfUngY+hkMFXfUyiDxKQ5898E+7SCI2CK+sVZgQw0Tu0Efyjio?=
 =?us-ascii?Q?A9gTv+z0KJJAE3pKkdXyPnoOE8D4w9E+N41O1WlGOmERIUz7IWSN6V5FGZIQ?=
 =?us-ascii?Q?+VAE7EGhPUJd8vJ145sBZea+WF1DFNM0dnWXuKMtT4KLcVve2oKUsYffpgE0?=
 =?us-ascii?Q?pbYvIRcNsABRYnbmUyEugquBeBqUvVY83BKAKWmIL86HXTbUomZT0CPLk5zo?=
 =?us-ascii?Q?Xluxa9nJp4yYAzK1l5Ur6dV/Mc7NqHobvzmLLtyNNcnXIUAAHEi4Kr7R6uWS?=
 =?us-ascii?Q?ytRtF73SEO5dCv1tF+gorMBFLQHp6ITTgSQ9aKo3EEKGHnocJRTAAEwff4Lr?=
 =?us-ascii?Q?Y4ZM792zKugmxE+HEx/2Rfg6SlDwjxveDlADP+zYpHCIy0ITn3IPjz4oxiE6?=
 =?us-ascii?Q?34Jw4gLcSrl+7lvaq/EjZ6RWnAeUMKn1GYFn7LHyhw3bUEX+QNyOo52eh17b?=
 =?us-ascii?Q?XwzQST1YLzMNGku/9o4GUOvvAtQRgJY7LNYqza+bXsN/H59FEqHFKV9maZKX?=
 =?us-ascii?Q?zT8rYDPm3O0xwGvWoC51eV3psMWJqIzX8+B7DLskfG57gwKAZna4O85Qli+c?=
 =?us-ascii?Q?VTw3WhBs9k3PdZB9MHveU5sC6fR9owcqDdYV+V0V9stsdVwxBOFs6VfV2LgW?=
 =?us-ascii?Q?WagjVAuae/hTYVsEMjgEg+oHtD9b55usCCid6NA7T+G8HGc/8FlpG4PgQU+Z?=
 =?us-ascii?Q?l2Da2qqlAvk97UA2WUR8F5zhRNYOom5S1dS+qr0yM83yvYvwaPHVSI41hniE?=
 =?us-ascii?Q?mQ1LmiVV5XLB1BfxMbfOcFFF7o3LYeuNC3CwwAPfaLxVz4UEx9tfIqJqP5X1?=
 =?us-ascii?Q?3xxuZOp4ApvTm9zyqYgOq3Ymgg1FnzrizdZ1VQBTykT23KcLnbh5Z58qRtEi?=
 =?us-ascii?Q?Y2rXJ5Ke7lELwvrlQvioVm3ddrpqZSNljPzIZYiNHJE78pP3EqvUGIgcW9bf?=
 =?us-ascii?Q?DSmV168orY1OeB+/3+iL3SicmEvSqA+4Ep+QrLxhYyISfqdrnJXdT7RTV5e5?=
 =?us-ascii?Q?K3vvdTKj0J+JfXxshsL8tUknvT9BOEF0EVPq1sCVCglFtTY6li7tGvjzh5RW?=
 =?us-ascii?Q?1N02noFCnU5qaEoFMtdyh/3zW9oeSSlXOiQsax8OPQIfWR+BvaOufClA5H/U?=
 =?us-ascii?Q?pcMd0A0oRYBFR8ww+dxv9JAamaCVT7Q1QYDyzMw7dzMUnWTtmxl61UJcwoy6?=
 =?us-ascii?Q?RjSYkZENJovgKkGJOVRq3w28a8gxqhCmBjMJ+11dpgUiNKJG6OiY2eE3zkrr?=
 =?us-ascii?Q?HB4posk9HuSx9KiyxYst/C+Y7K7VH15r/o+wu7yMU4isEjAwJT64I1gagdBC?=
 =?us-ascii?Q?TO6V2QX3jZ5Yi1+1S2km3tzR5Inwimz5+nE4sT8zg7L/db4RxtvEWGiIz68p?=
 =?us-ascii?Q?Dhx0EBYKWHfrKHn1Mh2QNY6s8ogU9IhLq/m1jXVnnBod6hKNAgGuR1exRnPG?=
 =?us-ascii?Q?+dbvO8RcI0voth7YepFQJh3HECbuiYHAk8xz602vZg0diByEdTV/K5mC/PT6?=
 =?us-ascii?Q?6bB3SN9gvHdNL2WRi4unekEuDxO6NTxNsZqoVQvGSuilUBX/8FBsyID9PHp2?=
 =?us-ascii?Q?vVqetT0QsA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6812e1a7-e24a-4b01-9065-08da3e236ff3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 07:51:55.0138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+ydYnSnze/yMs1yXizfXik9HTtePhLg2VOVm4sv79BsgOp3BC88lNUIQ0BXAR8T/bFRTQ99FF8cHMR3dxmD0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5105

On 25.05.2022 09:46, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 25, 2022 at 09:34:32AM +0200, Jan Beulich wrote:
>> On 25.05.2022 09:21, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, May 25, 2022 at 08:02:17AM +0200, Jan Beulich wrote:
>>>> On 24.05.2022 18:46, Roger Pau Monn=C3=A9 wrote:
>>>>> Would you be fine with adding:
>>>>>
>>>>> Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
>>>>> it's main purpose is to prevent the usage of the hypervisor assisted
>>>>> flush if available, not to force the sending of an IPI even for cases
>>>>> where it won't be sent.
>>>>
>>>> Hmm, yes, that's even more verbose than I would have expected it to
>>>> be. Just one point: I'm not sure about "main" there. Is there really
>>>> another purpose?
>>>
>>> Right, I should remove main.
>>>
>>>> Of course an alternative would be to rename the flag to properly
>>>> express what it's for (e.g. FLUSH_NO_HV_ASSIST). This would then
>>>> eliminate the need for a comment, afaic at least.
>>>
>>> I think it's likely that we also require this flag if we make use of
>>> hardware assisted flushes in the future, and hence it would better
>>> stay with the current name to avoid renaming in the future.
>>>
>>> Whether the avoidance of sending the IPI is due to hardware or
>>> hypervisor assistance is of no interest to the caller, it only cares
>>> to force a real IPI to be sent to remote processors.
>>
>> Well, then it could still be named FLUSH_NO_ASSIST, since as said
>> (and as you look to agree with) there's no IPI being forced in the
>> general case.
>=20
> That would be fine but I don't think it's OK to do in this patch.
>=20
> Could do as a prereq if you want, but we should keep in mind the patch
> under discussion is fixing a boot regression, the fact that it
> doesn't trigger in osstest is just because there's no hardware with
> CET Shadow Stacks support in the colo.

Sure - I'll be okay either way, with a preference to the rename over
the addition of a comment.

Jan


