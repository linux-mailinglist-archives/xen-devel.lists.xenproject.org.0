Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162D4435B98
	for <lists+xen-devel@lfdr.de>; Thu, 21 Oct 2021 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214195.372678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSOG-0008El-Qj; Thu, 21 Oct 2021 07:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214195.372678; Thu, 21 Oct 2021 07:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdSOG-0008Bg-Ma; Thu, 21 Oct 2021 07:21:28 +0000
Received: by outflank-mailman (input) for mailman id 214195;
 Thu, 21 Oct 2021 07:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FF+c=PJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mdSOF-0008BZ-CC
 for xen-devel@lists.xenproject.org; Thu, 21 Oct 2021 07:21:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff57e2a-6a8c-4afc-8c76-c7c94b9db40f;
 Thu, 21 Oct 2021 07:21:25 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-N8d0wgEwMiWpdfWgcq0TZA-1; Thu, 21 Oct 2021 09:21:23 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2701.eurprd04.prod.outlook.com (2603:10a6:800:af::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 07:21:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 07:21:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0274.eurprd06.prod.outlook.com (2603:10a6:20b:45a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Thu, 21 Oct 2021 07:21:21 +0000
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
X-Inumbo-ID: eff57e2a-6a8c-4afc-8c76-c7c94b9db40f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634800884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lw1slAaPviNAhxywVC6Rle5kCW/8it3/45/OluvIRTU=;
	b=RZDuAWZgpVQWpaDZvWBo19c8CMMRrIG40fESjy2OayM6HLAjg1V71ISUUEhvpPA0FzzLlf
	8Y8R8ycRsllm7AflAt5EWrElvTPo3w/cX9QqBC5l87bS/JQbfjIBiV7Gho5IEXsSJlToxk
	JnddsSu+EBPIW9Pp8Ae+VRyRBvseiQU=
X-MC-Unique: N8d0wgEwMiWpdfWgcq0TZA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksx1CBZLf5qM0mdHuGSec3fPG5M4rwIwgThy2sAuAGOl+/pjS42Y+J6kC81Xdd647qsy4GJwrLCIYFC6BiLS9+31fa8TuHgJKRMjQmwZLArUydXCCL+IPdpMoHLiz8sTskW/Mw0xfIrJSDfB5teRLAABYVXCIIlaB6NqUbj8Th2u2MXKiUieQnVhYrOb0uWEftZM+towYsv7oBLKdqCVKmDJIWYwjZDTj5tp8GehJnrhanAUmcBGILTi8Kw//0f0dz/q4APQrXYfFSTq3GmOP/RJtY/RERh9VON+DkSGzKNnpLWtr7iy4KFAyXGWWIJ9sCFjkROsp1NC5OT52FqBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXc74orlkXJHT433PyHuiu8At67cdLtHOKJoZZ21Jvs=;
 b=VqD+z2Usrlyun+nouRkC+x8ZgsImB2aJkasw0/XxLfva7/UYgtYBjJkcR3DhV9PHBzSkg6yTCPXGT/Zlzw/EuU5kPp2DQq5D/GBMBP5kKrdUI90Qu6pbgh0kvqCKPPYV0ox9q4JOT8mo1zB3xx3dTokYqp9GPx7syTDxDcMDPrz108ESgABFy60rBtaks5VOE+aeeYvNZVWLCmX8ZX7I9ztjYCQ5j6u8MRaAl9ucFWjMaW2EqA0tR02z3MZmJqSUd2zX3HnTZJFc8/r6yF8oMVqkrRMsEBmvfrfcKLsBURd90uJY0zUEIoXcgcZOtJe0eiZ98+Y0pDZIHdO1DB4YTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/IOMMU: mark IOMMU / intremap not in use when ACPI
 tables are missing
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <684e4a04-3ef3-46be-3302-149d5ce30177@suse.com>
 <e710cb3f-9343-f9d6-123e-287687e7bac3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50e25c02-e5c6-b04e-e21e-a8a1b53f087e@suse.com>
Date: Thu, 21 Oct 2021 09:21:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e710cb3f-9343-f9d6-123e-287687e7bac3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0274.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fb65eef-87b6-48e5-8968-08d994636261
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2701:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27014A9D6552BB0DF0B652DAB3BF9@VI1PR0402MB2701.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnfp9RLbs/BOv9cB77H9yckB4OL8B/+XhMD42L8sYLVLj3A+9IUC1QlZ/kaxiGI6+EUJ30RPLVtUifgMZ3VsmZ6H7njVrYlGTdlLd+7gCd6M4dhquK9/miiMB5uKBq1YkMY8+pj+Iq7K3j/Vb4rkjeF9CarN3K321wVyE4rKZ9s96CHXbiJJ/th1aAvX9LtjbdIrbnvfwA/7W2sO/TVSiDz6CghIBhx2rXIZqd9RVh1uXa4aS4qrN5vfnPVxBE+FmguxFKnxFh16iYTMp2+K7ZurKOrO5WEnhjoraDLk9Mkf4ot2N21eu7rJ50Gxkpa/8kdVMAZFmtolfoJyuQ8X0ocbQSfHGQachtN4U2GR0ho0fIZ7Wj+YJciLM8ovmpsvPxXPyFxoreiCMvt8erxyd1sRHeFP7Z9rjTKM4RzS95Bq9L92M46Ywf/oj5QuVz3QALXSICe9N+R+riG5vrlr0vlIcx1r/sQt51OuA/q0Tprqr7nLaacLcgsggHYl1r5LbnBbypYq1ClcNKi7EYKkpDNkNYLEcsJalTjboAsiqBo8/hOF1PC9bo45oBN+2s3bInu7oIJB95UoquwAEv7N/z88qnrTxILhgnIf0QuQQuIUuSQ1K1fPA9NgdtTP2n2hSOsu7wORfo5AvlFP6sVYWyA7Dat0rZk2VwiHt3DKSXbsDBaV5TztN5lvtmk8CVvjT5zyuxOT3o4HbSvYSLDUn1gZHmJWfh5iN7TH1nLOGZM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(31686004)(53546011)(956004)(5660300002)(36756003)(2906002)(54906003)(66946007)(2616005)(508600001)(8676002)(31696002)(86362001)(316002)(6486002)(8936002)(26005)(38100700002)(6916009)(4326008)(186003)(16576012)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KXufCOEqCicmRcJh9fiNFOnDimzSY4yktO0hZPG9MX213B92NGH8LZxL5IBu?=
 =?us-ascii?Q?ZsAkkLnza1wQoM8kdORxcPeYP1QKTZW/CSMlVtjTquYiNftt69TeDjra0MCH?=
 =?us-ascii?Q?EVw5htyK3sgjhnc0qzcEjevf3k0VLjNrO9i3QfuBNstZMH3rsPbbW6eNPgPa?=
 =?us-ascii?Q?O36VjFDGOweBOpIfA4W/YCHz9cpzD0s3nFZKKztUbr0rTuSI2TbOUfc9pqNv?=
 =?us-ascii?Q?zQ69Awz9aDeHAnrzOpnv2IP5wgBh+fdVDBiYiDpjMlW1LvXt2EmkZZj755tb?=
 =?us-ascii?Q?EU0iXLWoztT/Req5cD2gl2JobgqmpZmveppMwJPbCoq6vKcRvP/fNyopr42r?=
 =?us-ascii?Q?KWV+GDqXxn+8fvi9+PqbWdPpfXIEGFDPO13nOPaNAsZWwDQvTcbnl856rgjZ?=
 =?us-ascii?Q?z7XBD/Vaxv/OqqGt9MKpCgmRBylW7vqVfNpCGVwGuLooSW9jKAlQ41QtM+w0?=
 =?us-ascii?Q?ctY04x18Op339wmo4po/sJ14vccs4YSdp9zx0YyCa8CvjLdx0DsJCETl84eq?=
 =?us-ascii?Q?dfyk+2N0SJfWIMqo+9KRuRv6IW4DxyWeysuIjHmmbqT2JSFz/zqinHjyy4ED?=
 =?us-ascii?Q?0Bsm15sij2wbQ63N13U8IpBBvod8xznNuxjiGbc1ZWJDPjvBrbgh3HIZzuxb?=
 =?us-ascii?Q?nDWrwy2rCM8TQXJ1YdQQLZ+nAgwz1aJzuY4EZgoEHpyR1WUh90+geaRD/gFi?=
 =?us-ascii?Q?+QIKOSVOOwPwZ4SaizJbTRJxlSmeUgj9l/xi6FiKX912SmZA5rj1gS2xof+N?=
 =?us-ascii?Q?yMjBtihmMtIYBTOXPk5kM/iNpMD70nib/syf6Sxy+bUgwrfSoeuEdL8qZScj?=
 =?us-ascii?Q?k8m9vQWD486s/FMLzlSxyIiOd/JQUPV9DnBPJ9Ci1L73L8KEKG+uszERE7xB?=
 =?us-ascii?Q?10no1qPyYttil5sJqTkUCGsCTghOBH+ybcXO6OY83v912xNraR/URvghJaz2?=
 =?us-ascii?Q?YkZMM7s1FkciNy3BzcI6HXj2h3nqTS+0SPkFMKEbDLtkZMVJ0Vt9BO1jCW5C?=
 =?us-ascii?Q?1+NH56Wl67ByrCUFUj29vh/T8e90Fh1puKirGxozDmpXVACf2UVTsSBpAZtv?=
 =?us-ascii?Q?JOsMCdVPKmHXiL68Pgc03VsaPkJhJcpKnObxkbgEar4K5FljdguSy3bbwNBv?=
 =?us-ascii?Q?Nnn6WWRWv3nmLYjfsOzRhjIoMagcYt7VY8iLbkkCrKveDbTrnmmSrXzN65tw?=
 =?us-ascii?Q?feLMUNxCVWo5T45suc4uS4Jzz+u/1XTw5qX3B/A1rLJ9MsGYZgGyYMH7wgWE?=
 =?us-ascii?Q?AwMA8atM5RP0e5hTYi2alJadSAdmJBlAOXWh8t0BRSe/DCicHmVrHTDj0ai8?=
 =?us-ascii?Q?K5N2A3lrJ2u5+FwZS6MoVI0h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb65eef-87b6-48e5-8968-08d994636261
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 07:21:22.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2701

On 20.10.2021 22:01, Andrew Cooper wrote:
> On 20/10/2021 11:36, Jan Beulich wrote:
>> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
>> mode (physical vs clustered) depends on iommu_intremap, that variable
>> needs to be set to off as soon as we know we can't / won't enable the
>> IOMMU, i.e. in particular when
>> - parsing of the respective ACPI tables failed,
>> - "iommu=3Doff" is in effect, but not "iommu=3Dno-intremap".
>> Move the turning off of iommu_intremap from AMD specific code into
>> acpi_iommu_init(), accompanying it by clearing of iommu_enable.
>>
>> Take the opportunity and also skip ACPI table parsing altogether when
>> "iommu=3Doff" is in effect anyway.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I've deliberately not added a Fixes: tag here, as I'm of the opinion
>> that d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier") only
>> uncovered a pre-existing anomaly.
>=20
> I agree it uncovered a pre-existing issue, but that doesn't mean a Fixes
> tag should be omitted.=C2=A0 That change very concretely regressed bootin=
g on
> some systems in their pre-existing configuration.
>=20
> The commit message needs to spell out a link to d8bd82327b0f, but it's
> fine to say "that commit broke it by violating an unexpected ordering
> dependency, but isn't really the source of the bug".
>=20
>> This particularly applies to the "iommu=3Doff" aspect.
>=20
> There should be at least two Fixes tags, but I suspect trying to trace
> the history of this mess is not a productive use of time.
>=20
>>  (This now allows me to remove an item from my TODO
>> list: I was meaning to figure out why one of my systems wouldn't come
>> up properly with "iommu=3Doff", and I had never thought of combining thi=
s
>> with "no-intremap".)
>>
>> Arguably "iommu=3Doff" should turn off subordinate features in common
>> IOMMU code, but doing so in parse_iommu_param() would be wrong (as
>> there might be multiple "iommu=3D" to parse). This could be placed in
>> iommu_supports_x2apic(), but see the next item.
>=20
> I don't think we make any claim or implication that passing the same
> option twice works.=C2=A0 The problem here is the nested structure of
> options, and the variable doing double duty.
>=20
>>
>> While the change here deals with apic_x2apic_probe() as called from
>> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
>> similarly affected. That call occurs before acpi_boot_init(), which is
>> what calls acpi_iommu_init(). The ordering in setup.c is in part
>> relatively fragile, which is why for the moment I'm still hesitant to
>> move the generic_apic_probe() call down. Plus I don't have easy access
>> to a suitable system to test this case. Thoughts?
>=20
> I've written these thoughts before, but IOMMU handling it a catastrophic
> mess.=C2=A0 It needs burning to the ground and redoing from scratch.
>=20
> We currently have two ways of turning on the IOMMU, depending on what
> firmware does, and plenty ways of crashing Xen with cmdline options
> which should work, and the legacy xAPIC startup routine is after
> interrupts have been enabled, leading to an attempt to rewrite
> interrupts in place to remap them.=C2=A0 This in particular has lead to X=
SAs
> due to trusting registers which can't be trusted, and the rewrite is
> impossible to do safely.
>=20
> The correct order is:
> 1) Parse DMAR/IVRS (but do not configure anything), MADT, current APIC
> setting and cmdline arguments
> 2) Figure out whether we want to be in xAPIC or x2APIC mode, and whether
> we need intremap.=C2=A0 Change the LAPIC setting
> 3) Configure the IOMMUs.=C2=A0 In particular, their interrupt needs to be
> after step 2

Leaving aside check_x2apic_preenabled(), all of this is already the
case afaict, almost at least: We do acpi_boot_init(), later
x2apic_bsp_setup(), and yet later iommu_setup(). The only issue might
be inside x2apic_bsp_setup(), where we call iommu_enable_x2apic()
before switching to x2APIC mode. Yet we avoid setting up IOMMU
interrupts during this early stage.

Hence I think, as expressed, that the question really is whether we
can safely defer check_x2apic_preenabled() by a little bit.

> 4) Start up Xen's general IRQ infrastructure.
>=20
> It's a fair chunk of work, but it will vastly simplify the boot logic
> and let us delete the infinite flushing loops out of the IOMMU logic,
> and we don't need any logic which has to second guess itself based on
> what happened earlier on boot.
>=20
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -41,6 +41,23 @@ enum iommu_intremap __read_mostly iommu_
>>  bool __read_mostly iommu_intpost;
>>  #endif
>> =20
>> +void __init acpi_iommu_init(void)
>> +{
>> +    if ( iommu_enable )
>> +    {
>> +        int ret =3D acpi_dmar_init();
>> +
>> +        if ( ret =3D=3D -ENODEV )
>> +            ret =3D acpi_ivrs_init();
>> +
>> +        if ( ret )
>> +            iommu_enable =3D false;
>> +    }
>> +
>> +    if ( !iommu_enable )
>> +        iommu_intremap =3D iommu_intremap_off;
>> +}
>=20
> This does fix my issue, so preferably with the Fixes tag reinstated,
>=20
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, but I think there will need to be a v2, as per below (plus
possibly the dealing with check_x2apic_preenabled()).

> However, I don't think skipping parsing is a sensible move.=C2=A0 Intrema=
p is
> utterly mandatory if during boot, we discover that our APIC ID is >254,
> and iommu=3Dno-intremap must be ignored in this case, or if the MADT says
> we have CPUs beyond that limit and the user hasn't specified nr_cpus=3D1
> or equivalent.

Reading this made me realize that the change breaks other behavior.
The conditional really needs to be iommu_enable || iommu_intremap -
at least AMD code added in support for x2APIC already treats the
latter to not be a sub-option of the former (iov_supports_xt(),
acpi_ivrs_init()), and e.g. intel_iommu_supports_eim() also checks
the latter alone.

Overriding "iommu=3Dno-intremap" in case it's unavoidable could then
be a later change, not further affecting the function here.

Jan


