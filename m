Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E563A2B76
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 14:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139880.258550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJjn-0000Gk-Kf; Thu, 10 Jun 2021 12:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139880.258550; Thu, 10 Jun 2021 12:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrJjn-0000Eg-Gg; Thu, 10 Jun 2021 12:24:43 +0000
Received: by outflank-mailman (input) for mailman id 139880;
 Thu, 10 Jun 2021 12:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iP0d=LE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrJjm-0000Ea-Ct
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 12:24:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c7e5254-1ab2-4cf4-a012-87411542d0c6;
 Thu, 10 Jun 2021 12:24:40 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2054.outbound.protection.outlook.com [104.47.10.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-qhl7JV2DNMCIVn_qkT6EdQ-1; Thu, 10 Jun 2021 14:24:38 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3935.eurprd04.prod.outlook.com (2603:10a6:803:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 12:24:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 12:24:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 12:24:36 +0000
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
X-Inumbo-ID: 0c7e5254-1ab2-4cf4-a012-87411542d0c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623327879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/XrWhPHwPf7SqkXDfSvxlHbbTeCx5QQ/CwE9JbO2ic=;
	b=JgKA2xy13RwU+6Cybb2+Iyd1k3mO3JYJYeqjh0oBXH50BUOJUxg8GHgc6a9zMEDNhqfiE7
	GezwsBAOuIo7mqp1nIdk4P7A32G0vMIPge/uA0FibmQxUi4MB/3vX/JMInj0IrWgCZfK3x
	K8RiDxyaNZB2qe7irApd2jG6hGLZ5ls=
X-MC-Unique: qhl7JV2DNMCIVn_qkT6EdQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpt+rlpaFxMGidkfPJHWmC+E0QYYx6is20OvEUvCRt29WRBtbFn6ZpBJuJtw8IrV5Ie1ZSNktjJSbF2b3rlXufEwr9nareKyFk+1LdROSKbyVPGNC9y9iKosDKtcR73kmnuvDBeVmzAv+z0KDSYLZ8Z0Tct+qAmfjy6K5C2mKWwUYx/TANt6Ox+12sZUQ56B6wMPPtortiW58GfWIQPpz+TgFdJx4qfb6i0c8vvOYqUhmvDBYkWcmYkvZm8bSuKtJy2TNlTtiO4LuL3BBC/3q7UEkKR+0KbQdGK9ivueT4R6KPJ6RS8FJjJev/ZtE+1UFCAz6Vu+8JUjlzIfy6ougg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dpw2Tc9J6gCifNz782V1DgMZt/Mp+Jf78OlFyyxmuT8=;
 b=dgPJmb6DgnsuseWidSMdfPidHf6b8mSy4ClDEET4MLdLAWxc9I+W/QbXtnOtPU/38PbqZUG4ddFizJkSNPgt2e4PSzZqanzqLR5yO/gSY9VYKocWPp5RWcNIo6b16GguxYhd/UocUlkE3ikywFfb7LT+UAWctJzSeJV4Zqidz6OIA7/LFPx7UWObwC6nQ1jucKYmNBaxOlnE1rgZoB5oP85LeR8RhF01ptanLS/iaGuUt3SEXfEZ/6enBONkEMopAublS3dqbLIWjM0iNALdQ1pgTMFWrODdXRHo+sxqEwSFZ0lEWRDt2YPRRPoKwupwcPf2nTMskemrRIArrw4Lww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 1/9] AMD/IOMMU: redo awaiting of command completion
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03285055-47ff-ab10-ae76-0553f28f136d@suse.com>
 <1bb49cce-537e-9fba-80bb-82bf502728d0@suse.com>
 <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6632eec-d64e-5167-2f0c-3ad919620327@suse.com>
Date: Thu, 10 Jun 2021 14:24:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1fcb1140-b9b4-5c0b-de6c-e14d33937318@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0024.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08d67d98-169c-4ec5-c493-08d92c0ab615
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3935:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39358BC5F7E1258390365156B3359@VI1PR0402MB3935.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PVs3cbZxASXGVvyzCgWIC5a3tTxmT46JRSiLHVYI0FXMmQlxCY8VRr7V4XVXc1ZINAZoM5l39V2EHhhwh0+HN123Ru+8jEjfe1a9ez1+ztFnBZkUzvYyo+pXdQAXwYbDkOWeU2Tw7sSyYi4mbignK6aEjpnh9UtXsC/vITqM4UaN5duUVN/b/JORScKw2tBgINASParROqaqEfbzZL8m3OLHbR5pL4mMqwLLP/IoPZ1WoVKNgDDQPeEaax7N0zyOxudRTIFiLO2/3ave+6y7QCqm2fZ99eX9nC3NlUr3azjj7XU/CrYz1OxJxn7xSGkLgBNpG6ZIrxrAchBqMYkB93ZZn9en1fhr+/xb/0ovozLcWs1nypNoZqlUo8zuT+Wy/lJ0WSB+TbkDQKNiBuoHd1DPY+0d7mZ3C0XpPvSSdvzxE/OFldagb2V2lo967hb96GXZ/oxM0QHTNonulPbGfvippGwCNVJsDdJXpJ/fkjj37OBhxIaDOSPhYR3s3ry2+hL4Naby9Z+w8E+neIkhvNybQk/CKJXsIpAkhSyXRAgZftVkPWaKF9pT8pnHXJlyD/SZYnucp4itDnd7B0g3sxdIDhheWwQ/T+SeKXvjCDssukspi59CYDuN9rFd8dx8xnsL5HB5YE4NBFpR+kp8/WmvZ+xHPV3nekV2PNBg+k7oLGoznFO2CTnd715lTkUQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(39840400004)(136003)(396003)(83380400001)(6916009)(2906002)(31686004)(478600001)(6486002)(86362001)(5660300002)(31696002)(186003)(16576012)(2616005)(66946007)(36756003)(66476007)(54906003)(38100700002)(316002)(16526019)(956004)(26005)(8676002)(8936002)(66556008)(4326008)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?ZbhGTUZosnQsR4f/7/zgFTZM94N8y7GFSM83FHqDyNr/2XxyqK3/ghH9WTwX?=
 =?us-ascii?Q?o+cMfF/Gz32VV+SC9X5TNYG7l88L9e8bzEyqkO08jwpWOyj8VSpz/t62E8Vg?=
 =?us-ascii?Q?xYipIEXuExlp/8Y1zhfOVCbgs79z4kTQ44ek6vYwTvhLQCDhPbkhe3+EHcrq?=
 =?us-ascii?Q?psz8qtdjqlKCuX2NlGNmwB78aQOuB5SB8vCCqFKiyFDfaoJcGkd85xCJe7I9?=
 =?us-ascii?Q?/ZIeq5Pb7AZ2498KlY0iIKuWRu4GTDshn+9EDWpitCBUszkD7dCjVkkW2aOl?=
 =?us-ascii?Q?F+mpDky5sxBpgOO54/ay84v4n/0nCng+Iso0kNNpZc2RLWXDHV0s5BjbVSrC?=
 =?us-ascii?Q?OV/+GJa1jby0ePY8vZQwrUrdXr2qCsqgCW0QF9XRC6vuQpRX1VYGEDMC5+DJ?=
 =?us-ascii?Q?R8sPBa0aS2bM82g7e9jMjEBUuBzl47FyYXzGlkRozTgh6ixkJebVq3RCyoxl?=
 =?us-ascii?Q?laRBYhMx4YYBrn2lWkdLoncg7l/K1dI5lYAkqXX+wdf37GpA8xoNbXcxo51F?=
 =?us-ascii?Q?RazWjw6PlgTDkMahmio5sXD1hZdt/UnTQbCLAjCWdDKrf3+Ny3nVKqZ/qg98?=
 =?us-ascii?Q?u8mWsZ3e32ziL+PA2jhlMsE2YO2hIBLPW+8k8756pAwfQQW7f8HC2jeVsibh?=
 =?us-ascii?Q?xLfFZwnxaqzK+7O/0BJDFNKxHNa3PqtpGE7W4d3nL08gz2n90nSsOQDNu7UV?=
 =?us-ascii?Q?xl53AjUzreQyTaQ9Hr5WGHyAhzef7yOMgRV8GOvxvPHoOdhyhtduMS0RTKfs?=
 =?us-ascii?Q?0sQXEiF2PURAhElaEgFg0WGzXJ5sbHMTreeMbVEcfalQubBJ/bO8ClwXGDe8?=
 =?us-ascii?Q?BTbxNKlslEnxadBquuOVSPqsC/6Mr3z4MhRnLOuGFJV9SFGQ2SLWVd5+/Rnm?=
 =?us-ascii?Q?isvgaNjaEfCVIZHZ0g99LOMI2TOzvkeza7UARLXUobArg93sp9h/dbXgc3k8?=
 =?us-ascii?Q?1V+d6wKpghkoaD+iBNgDpq0Jus19prcxpxp2kl4XlCTyTRf/YkmJey56tX8D?=
 =?us-ascii?Q?mJsEU4C+7LFeaJXzWn2QjsKi7tlJAhth9oQES4xbBHH4BrEXLahyyYhGQ9NK?=
 =?us-ascii?Q?arjbjgxTf4ostVWYmMdt07DXMVPZAHOEtterOswpnqRTko/MjLSm5sTRdPUd?=
 =?us-ascii?Q?i+Z8BFjYg8fbM6nb7chMvb8O2MCiC5bXEtq9KuZ2WVvBVmpi+OywwgOPlQIF?=
 =?us-ascii?Q?0GTJkr8h+4q3Q3/mrcTA/Eh37UjUQkmAXHd41UYR9sQ9kcRO/x2CUF92ymf1?=
 =?us-ascii?Q?3tDNFWo74/JL0cR2UmLYuKqRwHqLOFw3nYa8GiP7LrzViXYOh9asfIHPAWyh?=
 =?us-ascii?Q?+HRNTXON1USUWiq2FKHgPAVR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d67d98-169c-4ec5-c493-08d92c0ab615
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 12:24:36.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0ZRbgfmWI70jYTZxwn9m0wMXE4UtO9r1iI1YRDDGwSajjP8eIsWJPD2O9mb37k8wTqv8M6FVOzNn/HpXTMt1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3935

On 09.06.2021 12:36, Andrew Cooper wrote:
> On 09/06/2021 10:26, Jan Beulich wrote:
>> The present abuse of the completion interrupt does not only stand in the
>> way of, down the road, using it for its actual purpose, but also
>> requires holding the IOMMU lock while waiting for command completion,
>> limiting parallelism and keeping interrupts off for non-negligible
>> periods of time. Have the IOMMU do an ordinary memory write instead of
>> signaling an otherwise disabled interrupt (by just updating a status
>> register bit).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>=20
> While I agree with the direction of the patch, some of the details could
> do with improvement.
>=20
>>
>> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
>> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
>> @@ -20,6 +20,9 @@
>>  #include "iommu.h"
>>  #include "../ats.h"
>> =20
>> +#define CMD_COMPLETION_INIT 0
>> +#define CMD_COMPLETION_DONE 1
>> +
>>  static void send_iommu_command(struct amd_iommu *iommu,
>>                                 const uint32_t cmd[4])
>>  {
>> @@ -49,28 +52,31 @@ static void send_iommu_command(struct am
>>  static void flush_command_buffer(struct amd_iommu *iommu,
>>                                   unsigned int timeout_base)
>>  {
>> +    static DEFINE_PER_CPU(uint64_t, poll_slot);
>> +    uint64_t *this_poll_slot =3D &this_cpu(poll_slot);
>> +    paddr_t addr =3D virt_to_maddr(this_poll_slot);
>>      uint32_t cmd[4];
>>      s_time_t start, timeout;
>>      static unsigned int __read_mostly threshold =3D 1;
>> =20
>> -    /* RW1C 'ComWaitInt' in status register */
>> -    writel(IOMMU_STATUS_COMP_WAIT_INT,
>> -           iommu->mmio_base + IOMMU_STATUS_MMIO_OFFSET);
>> -
>> -    /* send an empty COMPLETION_WAIT command to flush command buffer */
>> -    cmd[3] =3D cmd[2] =3D 0;
>> -    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, 0,
>> +    ACCESS_ONCE(*this_poll_slot) =3D CMD_COMPLETION_INIT;
>> +
>> +    /* send a COMPLETION_WAIT command to flush command buffer */
>> +    cmd[0] =3D addr;
>> +    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, cmd[0],
>> +                         IOMMU_COMP_WAIT_S_FLAG_MASK,
>> +                         IOMMU_COMP_WAIT_S_FLAG_SHIFT, &cmd[0]);
>=20
> set_field_in_reg_u32() is a disaster of a function - both in terms of
> semantics, and code gen - and needs to be purged from the code.
>=20
> It is a shame we don't have a real struct for objects in the command
> buffer, but in lieu of that, this is just
>=20
> =C2=A0=C2=A0=C2=A0 cmd[0] =3D addr | IOMMU_COMP_WAIT_S_FLAG_MASK;
>=20
> which is the direction that previous cleanup has gone.
>=20
> There are no current users of IOMMU_COMP_WAIT_S_FLAG_SHIFT, and ...
>=20
>> +    cmd[1] =3D addr >> 32;
>> +    set_field_in_reg_u32(IOMMU_CMD_COMPLETION_WAIT, cmd[1],
>>                           IOMMU_CMD_OPCODE_MASK,
>>                           IOMMU_CMD_OPCODE_SHIFT, &cmd[1]);
>> -    set_field_in_reg_u32(IOMMU_CONTROL_ENABLED, 0,
>> -                         IOMMU_COMP_WAIT_I_FLAG_MASK,
>> -                         IOMMU_COMP_WAIT_I_FLAG_SHIFT, &cmd[0]);
>=20
> ... this drops the final use of IOMMU_COMP_WAIT_I_FLAG_SHIFT, so both
> should be dropped.
>=20
> As for IOMMU_CMD_OPCODE_SHIFT, that can't be dropped yet, but it would
> still be better to use
>=20
> =C2=A0=C2=A0=C2=A0 cmd[1] =3D (addr >> 32) | MASK_INSR(IOMMU_CMD_COMPLETI=
ON_WAIT,
> IOMMU_CMD_COMPLETION_WAIT);
>=20
> in the short term.

Okay, this conversion has indeed saved a single

	and	$0x0FFFFFFF, %eax

But we're down by two set_field_in_reg_u32() now; only some 30 left.

Jan


