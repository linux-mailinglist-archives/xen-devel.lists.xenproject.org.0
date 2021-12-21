Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7247BF2D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 12:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250335.431203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdkc-0004H6-Nu; Tue, 21 Dec 2021 11:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250335.431203; Tue, 21 Dec 2021 11:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzdkc-0004Ex-Jp; Tue, 21 Dec 2021 11:56:14 +0000
Received: by outflank-mailman (input) for mailman id 250335;
 Tue, 21 Dec 2021 11:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzdkb-0004Er-C8
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 11:56:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcc602dd-6254-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 12:56:10 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-knHpHEi3PDKgn8goB1v1UQ-1; Tue, 21 Dec 2021 12:56:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6301.eurprd04.prod.outlook.com (2603:10a6:803:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Tue, 21 Dec
 2021 11:56:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 11:56:04 +0000
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
X-Inumbo-ID: fcc602dd-6254-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640087769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAU087K4O6/2zhCq5N9Gp7cgMGmjK6uPkr6kj28HXm4=;
	b=gRTlmPbJA7WnhedonV17cWBhwmsFszIpP0NYRoM/QlB4RgFMJofv7IOyBpgpAB1JR3NTDM
	RHJ155EpRI20pikfV+fMIYRceOZpwElkhm6P9MC1jCd/5O++pMcOEKCSNta2T4idgl3iP5
	lfMn4iXM7JkNufgwRRrOWt2eITwABSc=
X-MC-Unique: knHpHEi3PDKgn8goB1v1UQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVBq+iPcbXPMCdFi/BmjytQVN/bwc5tPFYSlcF5RY4CTtdNhMnQXKbVM5OYLVba6HtDBMw625SY5SM+RkmhCqkecCEKr70JLc+YduNgg1nx9Oeon24cSQQsxdwOyX+c4hOSTWfjrCzHdALmo5gEQR0a/7VPr54L6fsvh2KYfWMDorrJTaVGKMz8gvA/2/jCeKMMuWP49DeoXlZTOxjVCxvOeTOYTRd/quiuDy6rN22oALPE0/rPqOunjdyucY/lEzOi0DVNKyC/moyWvUHIpd43qcMzm0F6EMqA6Yz2LvCLgUfAGZsddPHdfrzWJI5YamQk+V9HKBasVLmT9bN/A6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVrWPOYZzDez61n5pHAi+L/pYqXRaC22G6RwqQmbmOc=;
 b=FhiAlNs9E7ZMWeEX4Gtuaws2AClZFWbAtG4o1P674ToEk8LniM+wKUh2w4vkUqgXxtnl+9G03LvZDWRlFVWUP6d57wG7Dsbtddb6m5LUyjVQ6dO/oH1M0wnHO2i2BZ5KEda/jtQobLjDyk//762aWHysYlOMaE0efzMFP0zKxKLK4EdMSb44NzERqK8gD/crYnsihTYkB6J+WijHjQKKlq2WIv7haCGgh5Bnj1UFF6WOVso+k35jaPDs9iRLAlS4pVFelNj6pnQAg5NG7fj4j5Cr4If66zyEvBue92utmQV3hxxPa9dufLHu3Yvr/6Yn0tyeZGVma0zoaQ4fOE2FaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6efed2d5-e7a0-139a-a2b3-6f0696f711d1@suse.com>
Date: Tue, 21 Dec 2021 12:56:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] x86/hvm: Context switch MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0013.eurprd03.prod.outlook.com
 (2603:10a6:206:14::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73683730-2cb2-40b2-3fa3-08d9c478ddac
X-MS-TrafficTypeDiagnostic: VI1PR04MB6301:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630125A59B5DAE0764B15B75B37C9@VI1PR04MB6301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o5wCWT61g/dX5bN0jn1KEG+VKQOJhfewExgZ9sJmuMcpHZRU+X40p3/9xFE6jEp/arwOn9Ro5cvvykFZ/qOtNO4IpDiYHUaXrYWQ9di83bm2xXyrzhTl04tJVmMSagvP8AvAwFsD/d7oOFL9HLVupzyW3qhw+7+0NGUVNVeD/LMAk4TrRLGWsiWNFL+fJgYNqDAEng+vjy+6VpUFn6YCymJCUoWsM9wNvoxegdeNwA0mWNcYP8H/hHC6h9r4DwTzBSKAOkgUBZk/LikYoOeqX3pPkHEPOVYWupX/4QP1Yo9Le1CNMG4/I477LV8kYkR/WLJNw81iuB8hU13N1hioTsTuFAOqSdDlySG0qRZPgvrag6NSnmi9jiQFTI8Y/RC2H73UAXbMNfGRRTlBqKmB1g1r7EAvkut7yvLKwnJ/TWEpNlcnVVxmT6DMzaRg4wT3pTiO4Y6yLTrgOK4cq4OSi1XI+/kEpKOBvmXZ0CWKHH5V1g0OvEQ2n5ecodAb/UgffnRqNiQN28ObeUtfZ7HtQQBW9BD+PwNb9wYWEtVK3mvgEu7NTLxI9FoZb4p11CSWdE5kCmpppBA/mFIwdkR2IEcuQcfLMsu57udA1kRkzFUy5VyOafCMiCjOQa8kCcprVnY/4py3A6G0FRC75CkkHxsnd7IdJOC1KLoSImzYRWT9Rc2YMQyGU5ONPtdZu4vbicDFVL8jUoRSWE1Mbvl4+LDhqier37pKWLrFPVRJZnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(5660300002)(6486002)(36756003)(6916009)(2906002)(186003)(26005)(8676002)(8936002)(2616005)(6506007)(53546011)(66946007)(66476007)(31696002)(66556008)(86362001)(31686004)(6512007)(38100700002)(4326008)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rOl61sHPEu0+195c5iZGklrwtsj4cdk37mbUx8e/9KAcWbQTwvzZcBcvKaQQ?=
 =?us-ascii?Q?j1ukS/f1EhMhJGFwDJ3f2IAkAOzdKiPH3y/YCBzsnCyNzj6vA9dtBB358jWd?=
 =?us-ascii?Q?R2C+fTT7rvndacHT28n94tW/u9k1wNeUJ0K40LoGKIN/6U+njaOiUx5NYMM4?=
 =?us-ascii?Q?U0ImoeiSnMCunTSGD0gJuCjxxbCHEFlIbFJnBnWbONFCYq1qq9eHL25GDlho?=
 =?us-ascii?Q?pCxSk8rh3/J4iAhJ+myoN5vT0BRN1Gs/w653YBGEl5tnP9FWBUr+RtkG0nIz?=
 =?us-ascii?Q?tyWX7SdhbBHTvqCW1q+wBluxNXguPreQxUh8THvl8U1edL7FfHVN5Wci25wS?=
 =?us-ascii?Q?3fEXIIbe55V7ob/o+3uoUmPaUmokyVgdY/Qj51eKUOjQQ3sNx8EA/agSQnZv?=
 =?us-ascii?Q?NH9N1Qzx3IQnW9OQZ/KK7cpsszSIyBL6j9I/lxA+WbBuSj+izC/g2kXmhz8G?=
 =?us-ascii?Q?DNsW/+LnNUhG2WwUpstn8A5p2oiHV5Wj6ErQ2izCv5jZAtamTQypNYOWqE/N?=
 =?us-ascii?Q?I9k4P2RdrLA2oiBphVE3ltxYd4XrzHE+j8bWAc2Xs8OSPyXPNdnnkjpf4te8?=
 =?us-ascii?Q?cC6wgK8ioRSjnh3MZOgxsbK4iKRJGMUjDiOCAuU81Tbyq1lffu4tVGIyjfPL?=
 =?us-ascii?Q?zyuehdL1gTPrZORqwp++Wz/UYeWBoa6LrockwgcFTME+S4O/4RYaovXCj9m9?=
 =?us-ascii?Q?BEroVOzLTwvF4+rsm8LnS5GCba/Qyf0Ej0psl8wj4XVkjqy+JJEV/I478JsP?=
 =?us-ascii?Q?b1+jbiIHlugPsT4ieCkClssYGmGkKnyKLlWKPkGIVOz0U+0xqB+WWigt52Ox?=
 =?us-ascii?Q?++QpM+AR+/XIAJ6jM9PNPEN4JgFneIXZCNYHm4pAcO9Ja4gAHepdo3juC8BC?=
 =?us-ascii?Q?cHQKVzAK9D1eC/k3+0djNmI1EuL+szc22ZeGkwavX6tkD+HLjFvUOdn4Ljdw?=
 =?us-ascii?Q?nsZ0k5qGfE7AD9mHn+SfGkvtwK2len13oycxUUtfdaOFYnJLlIULuEj95t9c?=
 =?us-ascii?Q?ZNxefAtfROsHxCMMwmIHFVOl8LJtikxdJWWeqyVyQioDZ9IrWJImxsn3c5Nl?=
 =?us-ascii?Q?OOpfgx4WYdhabxEuro+Lk3rzGDm2B1Oq/ZKvk5kH1vvYMizmsRhGn9bwgsyL?=
 =?us-ascii?Q?ONHbd8ZLWo9Fk2F2e4JKjY98yv7m0J96vBf1D5+osdezOeR69GQrr4Swq597?=
 =?us-ascii?Q?E4XIGB6QMuY6dJBxxY1P2vImOUgZNQp7OM11D9Bt1LOotPnb7SuE2jiN7ciW?=
 =?us-ascii?Q?Z+hk3SyryKR3CXlGsOYMBkLyoCnsITF5L8vqnn0vttyrYp6W/EizMsnnH/7Q?=
 =?us-ascii?Q?lqX+Rhiot2IVH51ERWQ4H7V+UZGfdY4o/eU8GD5/QnSAchsXPW6KfaFHK1Fl?=
 =?us-ascii?Q?sKhms1jwq1egPvvudVAMvshUu0qw/woldPAjs/gaS10SxZmt/AugZztN4J6q?=
 =?us-ascii?Q?O0aA+NM6m6UlsLpdiZJ3O+Icu2XNeex5lbmgYu0ly1/QJWJt/wp2eVOMLx2m?=
 =?us-ascii?Q?g0sYZN6N+M/LiIIP5A8sIQKtQv7Fjz/qnFy0QqWUl8CT0s9VF6kSJi63xBZG?=
 =?us-ascii?Q?mQlNmGElv0MpYTUZwHcP9DRdRijZhT6wwSxJ4wmo7KHQBDacmwuOGYIrtzbo?=
 =?us-ascii?Q?WsOQo+mm20P/vQxyncQKydc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73683730-2cb2-40b2-3fa3-08d9c478ddac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 11:56:04.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX4SMKaPg9pInzxXwygg1MCzFvg18AYIbVHWI83OrSIp6KGW1vlkFX0/hQ89suU0kcBru4Ku4A8j0BvjZj7ezw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6301

On 16.12.2021 10:54, Andrew Cooper wrote:
> Under PKS, MSR_PKRS is available and based on the CPUID policy alone, and
> usable independently of CR4.PKS.  See the large comment in prot-key.h for
> details of the context switching arrangement.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Kevin Tian <kevin.tian@intel.com>
>=20
> At a guess, we're likely to see PKS on AMD eventually, hence not putting =
the
> DEFINE_PER_CPU() in vmx.c, but I'm at a total loss to find anywhere bette=
r to
> put it than hvm.c.  Suggestions welcome.

That's fine for now imo. hvm.c is another candidate for splitting up,
at which point a better place may surface. (I would even be willing
to make an attempt in that direction, if only I knew the results
wouldn't end up stuck again, just like appears to have happened for
the p2m / physmap etc splitting.)

> @@ -42,4 +45,49 @@ static inline void wrpkru(uint32_t pkru)
>                     :: "a" (pkru), "d" (0), "c" (0) );
>  }
> =20
> +/*
> + * Xen does not use PKS.
> + *
> + * Guest kernel use is expected to be one default key, except for tiny w=
indows
> + * with a double write to switch to a non-default key in a permitted cri=
tical
> + * section.
> + *
> + * As such, we want MSR_PKRS un-intercepted.  Furthermore, as we only ne=
ed it
> + * in Xen for emulation or migration purposes (i.e. possibly never in a
> + * domain's lifetime), we don't want to re-sync the hardware value on ev=
ery
> + * vmexit.
> + *
> + * Therefore, we read and cache the guest value in ctxt_switch_from(), i=
n the
> + * expectation that we can short-circuit the write in ctxt_switch_to().
> + * During regular operations in current context, the guest value is in
> + * hardware and the per-cpu cache is stale.
> + */
> +DECLARE_PER_CPU(uint32_t, pkrs);
> +
> +static inline uint32_t rdpkrs(void)
> +{
> +    uint32_t pkrs, tmp;
> +
> +    rdmsr(MSR_PKRS, pkrs, tmp);
> +
> +    return pkrs;
> +}
> +
> +static inline uint32_t rdpkrs_and_cache(void)
> +{
> +    return this_cpu(pkrs) =3D rdpkrs();
> +}
> +
> +static inline void wrpkrs(uint32_t pkrs)
> +{
> +    uint32_t *this_pkrs =3D &this_cpu(pkrs);
> +
> +    if ( *this_pkrs !=3D pkrs )

For this to work, I think we need to clear PKRS during CPU init; I
admit I didn't peek ahead in the series to check whether you do so
later on in the series. At least the version of the SDM I'm looking
at doesn't even specify reset state of 0 for this MSR. But even if
it did, it would likely be as for PKRU - unchanged after INIT. Yet
INIT is all that CPUs go through when e.g. parking / unparking them.

Jan


