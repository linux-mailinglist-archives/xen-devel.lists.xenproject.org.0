Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDF442B5D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219912.380973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqha-0007QY-78; Tue, 02 Nov 2021 10:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219912.380973; Tue, 02 Nov 2021 10:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqha-0007Ol-3o; Tue, 02 Nov 2021 10:07:34 +0000
Received: by outflank-mailman (input) for mailman id 219912;
 Tue, 02 Nov 2021 10:07:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhqhY-0007OZ-Iq
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:07:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a586ee4-b4c0-413e-b1a9-ded3784bfffd;
 Tue, 02 Nov 2021 10:07:31 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-6OSzjXiMMkaJ3b7KySqK1w-1; Tue, 02 Nov 2021 11:07:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Tue, 2 Nov
 2021 10:07:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:07:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR05CA0003.eurprd05.prod.outlook.com (2603:10a6:20b:311::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 10:07:27 +0000
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
X-Inumbo-ID: 5a586ee4-b4c0-413e-b1a9-ded3784bfffd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635847650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66QQFqZKeVpbZVfcEGP4/DZ21ZdlZJXnqBpiaD8q7EU=;
	b=izpGEt/gDTnlai1eXihi3mvzciZR3iIiwKIIWrFyHPnldc/9AFKCG8mpeVBOl/dk1n7s6Z
	G8VlX5mYqsfpYpCsHhu9Cz6b4WBdWdkHtLGVmctXzLsgDOigok5Et+g+XY5zdc6hBepmiF
	We+AhEU51JiUPCzuq1vZ6ie1I4HJyDk=
X-MC-Unique: 6OSzjXiMMkaJ3b7KySqK1w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9plEw5nqx0gYVsnDavqJwkHHeez79bepxji9X4OCU2o7QA1DrVIm0UnRpg/ASG1LfWUnYczzSt12LEXgDFNY5HZxtSW2TsC/gudnatdoy19DUoLaMgkKm8xAyhkb03jbGkwNJEXBp+25+HNADv24sIoWcLweBdC5le9huIN+2tyQusOKbfoFVrhkpoNQagXBu0JVrYMc30AAdz6iNH32GzWBQrICGWioIEVkoOmSDT7ZFNfAmotAuVCacgxK9dBDwe33jZh0IMkdOw+oHAMci2lv5gh5XcH+37YI3QoSw19LS3AeNaZ7qcArQuRCMgkuRPCBFtsCkCobUXSQ7AtUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RIEivFqKRDzEOoFRkV4DZSKIayDa2JUjgLSJ+/6RFwU=;
 b=ibN6C52UbrGZgQxBR+WBHeQ/GDmxgZ9cFj6FIbhVHic/7f+T3Cb7GFjKPSF7GwYs63pfob2qkZxPYrRM4MX/lVer7xt1iNvnYp2xxhEjrTBLh23tQNVHAvWK8aPH2tI8yGeyDnPGY6KKb0D+Cdd5BVzWqazinqIjQbvRdY8CeAPoI1qHAl+0+KtX+T7iNNZgnGA7dU+vHbQ/lgGWs2dcvR5k/cI2n9/eNMtT/a7KMH7GywJ5s5I+/CwXod2ZfImM2pc4pqTbdJZMfgcWVoMhGZIv2BWrNFvA4k1WtaA5X2jbQu3zTWqut9BIfq3YF9tVh3bJO16u9xw1Mud2a/CK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8beac790-874f-3953-6cca-677c9bddfcac@suse.com>
Date: Tue, 2 Nov 2021 11:07:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 1/3] x86/IOMMU: mark IOMMU / intremap not in use when
 ACPI tables are missing
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <efe34081-c813-0e37-175c-8553b395e6d9@suse.com>
 <YXLeMsuykEhSdfUg@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YXLeMsuykEhSdfUg@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ede8b1c-bacb-47f1-a183-08d99de89311
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606E80A79E65BB48412F5E7B38B9@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JWDbs2F8gSqp3GYXscT6AzDHZeY61vkejOiwH57pmVJ7jSylZEHknBWymXtGsTnPgL7tcvQi+PCuFU+6020DILJCqrTcAG1NlvZab7oDWR0q+O/dSR5w12zL2XeI2n5cRDX53TuvG6h8O7opBEHFmpzYrD9mmuQCV4yLgOvSmpzLJRLx/HGPI2uI8+6P2VrMB1cjewbj8U/ycxB3bqdT7+f9p8SdBS9KkI/zQ7PV6Fe1VT9whyAb4x0eHgZRc0JTWXTs+cnHC/Q/zs2w+mclIwIX37Wur/x5lqvSPf6nHw1nENTAW1rpUu8di2U27DCaQT3WYt20RQFhW05+VEvJdUOUHJ5RK6r/ubKm25xnvQpoluoXvUhGi+PsN7syr7ZKGGTuswlc6EUdIUEVIWL/fowm1oC7Tak4HeV3nlITw9uLABdNQqVgQc0fGKArpgU60ZY1/Io56Ysg4N3HdqnpRNWB40TAvQTSoJ7Jz8X037kfw1nNkVB//Ku/DisfzUynTIgPQlPm9BnnaMe+vl1TPcP9lO529fsttmCBQBIJylXsaINQ+9eKVa/+OnvAFbIGat48Dn41UBvP4rwk3FBifUZI2dfkgTQG9Ys/L3RL0jebTbhBezfwkYU3fMTEetiLwP3b5U4tnU1+g7H4tw8FglV18gYb6TgVH57qGFJC67uH6K6VhgRMU5sgWt1Ob/JLvKC+e5MzAM/HgxNvLRggrCE0Qn0DYnOJe/SA+PYaKyV2ghr9eYWaBr2+U+00pq00
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(956004)(36756003)(66946007)(53546011)(6916009)(86362001)(5660300002)(8936002)(6486002)(66556008)(66476007)(38100700002)(26005)(8676002)(508600001)(186003)(31696002)(83380400001)(54906003)(16576012)(316002)(31686004)(2906002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S/cckqG4TEd1XhPkx0RAQD9DkMVuSDlRXLYQinajd7ODSbJMA+BHRyjlFMe1?=
 =?us-ascii?Q?S62HSiBu+h4YS9LC2HAwZKJnF/Suk6H130GvH7zPi7LeE6m5T9ELsV28k2Om?=
 =?us-ascii?Q?u27tnOucGTlFFcWt/JgO5uNWmlHQVTkwJyrmjnfkmCOHyqnI97CZDKXOOFPw?=
 =?us-ascii?Q?F5ZJ5XUF/FkIec6SiNZDCaZM3YfgpSQYKOkO/4TPRJbphOmvZlPuh7Lk0U1u?=
 =?us-ascii?Q?LXnx+raSiOixANecljCcuf13WaLV1hJyZOuCqxlh5DtNLERrtwPP/y68LUyy?=
 =?us-ascii?Q?MCO/80sI/wlMPVUlXZEz6UoRtJ3d7nBP23JAfdIDdIP7LB6vNHXWWAgNsnH4?=
 =?us-ascii?Q?pC/wmq5qZS6iCQs3+d4C6i9zSzCodCdvXD3sXRadn3fRJba3AQ02VmtoQZoO?=
 =?us-ascii?Q?xgpjTLQD8PkKe5HGZz95ZfNSSxgo/sMZ5fyPHy45kUMaI/AI6GckAgqQY+on?=
 =?us-ascii?Q?wC/+HRjCQQppqvsfFJBD/Cqe19LJMtFNLNJaMubO8pN/TXvuTtPiJ59Dg2rK?=
 =?us-ascii?Q?b0E02C1OhPSG09gZHXVgEuOMoQdtX1sLXZAuBLqQd6Vo5u+wCbuBRYXCYFFL?=
 =?us-ascii?Q?I5UmY9TThwe1blmHnyw/1aBJ7AN2h3vHC7qszI7+1zH9dNy1PtGg4MqqzR4s?=
 =?us-ascii?Q?O/hL3zOSV5je621orBE6lzkely6v5BQ2qeQbqWIPlMxel6a0xXPIp4IKhbF5?=
 =?us-ascii?Q?/R9oYHGQ3JzCtGTrIxsn0sbDLpXEx00PAp0ZqygYG5FydJQ1K3AZHhccfiAf?=
 =?us-ascii?Q?OomvSndiiPAb/1g6wq51yEG26T9QleRjhjJ+fx704f70lidqHVYkZEcWrIQq?=
 =?us-ascii?Q?9wO293Lp4tZkGEiLLbSsyuUkecZreO50NbTz50lKPcDERziKvGGWQ++xf+rA?=
 =?us-ascii?Q?KHzcoiZVEd+cs+9xCmc6FJpZb/SNMxY2YGOqgUD7SHA7QzpFqToSPM8RmJs9?=
 =?us-ascii?Q?/yydlGS5LdF+nl0QwU9LZKtt9eMKbL9anczB31ySdUBFgJutvRdVWfCKhj2k?=
 =?us-ascii?Q?xRk5ThW86+4u2/a0EAJnq8USctg5eKrSPJX5/rJONR26GmbyBad0Pc5ag+2G?=
 =?us-ascii?Q?JYmsTjF+vNmLoxpAW50LAKhSM/kocIfbmn22dU6T19q1FdWAlg5MXibu3imy?=
 =?us-ascii?Q?DqLL2fS+jlCcShVrXxsGX839VtA+MTrCy6W/3mPY9gVr05y/Pa5L/VAbXdwx?=
 =?us-ascii?Q?92x95vJDHQGeqj52ST8pgdK4URujy/b3ynSJGa4Eb9pElFNN9GS+T1X/Poue?=
 =?us-ascii?Q?mITEDr+hjSg/jt5uWbxyoyNcHOrAscr1AaPOxscwqNh0v8oizvqayScuj0K7?=
 =?us-ascii?Q?PNnfAEbSS3dW2edlWJTuF41j6o84dF/BmE8qzfyhOhkUyvu3dHb7SVAiF059?=
 =?us-ascii?Q?9414cbTW5CTdxc90tMvJjdDvX6YpWKMd5mGNwaXlaxYZBJGaUSfRNfizkuNB?=
 =?us-ascii?Q?acd8aTTZ7sqeaybxqiTrY091N5sV/XSrCAeTHTgpLiWwn0mh3iPnG4yjRY+o?=
 =?us-ascii?Q?AL+eG6e/PVjHHyhsZaKUZlxcI3WtMGKv1rQWazV8H3ecn0VduoS6V6qeCRUi?=
 =?us-ascii?Q?Wj+felSL4P0DtQMLEyAGqiysGT4PHzKy7BzF8mBDyDlQsm7IUPKiRE9we/9j?=
 =?us-ascii?Q?B3/koGzDAYsHrf02I48N2tE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ede8b1c-bacb-47f1-a183-08d99de89311
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:07:27.6154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h76vcG1KP7GOAwZtLTIg4s0qd/E89hretQi55SSir2kdyzl6eTbecB8SqxrOsvFkjC7bcOlGfAK2m/NhGHBkKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 22.10.2021 17:52, Roger Pau Monn=C3=A9 wrote:
> On Thu, Oct 21, 2021 at 11:58:18AM +0200, Jan Beulich wrote:
>> x2apic_bsp_setup() gets called ahead of iommu_setup(), and since x2APIC
>> mode (physical vs clustered) depends on iommu_intremap, that variable
>> needs to be set to off as soon as we know we can't / won't enable
>> interrupt remapping, i.e. in particular when parsing of the respective
>> ACPI tables failed. Move the turning off of iommu_intremap from AMD
>> specific code into acpi_iommu_init(), accompanying it by clearing of
>> iommu_enable.
>>
>> Take the opportunity and also fully skip ACPI table parsing logic on
>> VT-d when both "iommu=3Doff" and "iommu=3Dno-intremap" are in effect any=
way,
>> like was already the case for AMD.
>>
>> The tag below only references the commit uncovering a pre-existing
>> anomaly.
>>
>> Fixes: d8bd82327b0f ("AMD/IOMMU: obtain IVHD type to use earlier")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> While the change here deals with apic_x2apic_probe() as called from
>> x2apic_bsp_setup(), the check_x2apic_preenabled() path looks to be
>> similarly affected. That call occurs before acpi_boot_init(), which is
>> what calls acpi_iommu_init(). The ordering in setup.c is in part
>> relatively fragile, which is why for the moment I'm still hesitant to
>> move the generic_apic_probe() call down. Plus I don't have easy access
>> to a suitable system to test this case. Thoughts?
>=20
> Indeed, that seems it could go quite wrong, as apic_x2apic_probe will
> see iommu_intremap =3D=3D iommu_intremap_full (the default value) and thu=
s
> could choose cluster mode without real interrupt remapping support.
>=20
> At first sight it would seem possible to move lower down, but as you
> say, this is all quite fragile. It's even made worse because we lack a
> strict ordering discipline or any kind of dependency checking, so even
> if we mess up the order it's likely to go unnoticed unless someone
> tests on an affected system.
>=20
> While we can try to solve this for the upcoming release, long term we
> need a stricter ordering, either as a comment, or even better enforced
> somehow in code. The x2APIC vs IOMMU ordering has bitten us multiple
> times and we should see about implementing a more robust solution.

So what's your thought then: Make the change (in another patch), or rather
leave the code as is? I'm slightly in favor of making the change seeing
that you agree that the rearrangement looks to be correct.

Jan


