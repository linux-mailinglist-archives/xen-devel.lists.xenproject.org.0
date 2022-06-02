Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68A53B560
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 10:49:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340931.566070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgW7-0003sU-4q; Thu, 02 Jun 2022 08:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340931.566070; Thu, 02 Jun 2022 08:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwgW7-0003r0-19; Thu, 02 Jun 2022 08:49:19 +0000
Received: by outflank-mailman (input) for mailman id 340931;
 Thu, 02 Jun 2022 08:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwgW5-0003qu-Do
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 08:49:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e22a6414-e250-11ec-837f-e5687231ffcc;
 Thu, 02 Jun 2022 10:49:16 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2053.outbound.protection.outlook.com [104.47.4.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-exQFmV4IMaSM38xEmmm3Vg-1; Thu, 02 Jun 2022 10:49:14 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4133.eurprd04.prod.outlook.com (2603:10a6:209:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 08:49:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 08:49:13 +0000
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
X-Inumbo-ID: e22a6414-e250-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654159756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pIVBj2xQdgbcY405BJW2RkwS3GpAgcNUfmowHVhbnmg=;
	b=FiszSDrvDwTcz/G1rpRVJ0TlyfKprkdMFvQYYwenQvj1YcdENvXmGNwbUoTFBE4q/xeZC4
	47LofYJjcD0N1xGdiNAsRmdKq8e6HtUgLMOlzWElv3saWb5jsO0zixzeRYuMfTs2v0KS5G
	iNOZZ/6+YnG32cw2hyUejuVdS57qS+E=
X-MC-Unique: exQFmV4IMaSM38xEmmm3Vg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nbcmo+bY1P16pyWA0Lof8COFmZla9sRetd1PaKVCVxOBNmVjJXktyp/hdsJ7qY6UWEELTKkefkseKodTRwygENpLH+ul6nwYFhmJSBHOO3v96m98lEHsh080/1rDdkHzp0FoggPjV2PTmYMkSDlYwtMxUSyDkHn3T+nD3k+iwt1JeMQvIL6SUtD0b1uSolnvYNzoVoEaGqmwDHxzxVqOKnT45O6n+oDDTeHi1bBNVMBRgD+/3n3w0WQwDxvvpob/8l38cxp7hXVHe4N4v9bf89oO1wBGavpJDzNwl955Str8SRNMLOUr87bAjhg1pBv3QUKFKtZ531ysq2lbxXD3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lw5SxRxEO65t+yhs01ufb5vk+O5Mr3rvHtFxBuNUXNw=;
 b=S9SQzF0JOhgZAqrW1TIKdPTJ/SOavvLebTc8W01VuHXvDjBplAfAD2j7k7AHPNw86kF80oCKh/zspS7XAdcbQJHLJcTPuAcfAjsr1ybMbxpWe/KF1g494w//v1cLnnvIAdNCYJd677FSmjUeAjIO9X8ivrbqXTuNZbaZ54OQ6KAiMB1N/U8hz18lyTNLYr1O7FDkoGxjmRJS2MjTZWkVLxmA0V24S/oVPluXDn31Ivm/dJMfbO2GUFr2XDa9PYj8mApGBJCpzfqwwQl14tQurTp5ws83JRjUVX9JXDleK3CDzKmxlcGq5nV2afxr4eXuYTRC7bmPIbnpP1wl31XTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <de93f0f5-374e-6fc8-22c3-70023a7d2f9b@suse.com>
Date: Thu, 2 Jun 2022 10:49:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Content-Language: en-US
To: Julien Grall <julien@xen.org>
CC: scott.davis@starlab.io, christopher.clark@starlab.io,
 sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <ab531f8b-a602-22e0-dabf-c7d073c88236@xen.org>
 <be06db4d-43c4-7d24-db0d-349c0a1e4999@apertussolutions.com>
 <337d6dbf-e8ee-5de7-a75e-97be815f4467@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <337d6dbf-e8ee-5de7-a75e-97be815f4467@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0398.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d70368a8-7108-4187-ca21-08da4474c4bc
X-MS-TrafficTypeDiagnostic: AM6PR04MB4133:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB41336D4A29334F64F606DF05B3DE9@AM6PR04MB4133.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o6pQc6zNNvbwX6b8dndkRyRom1z/oDNUj975rM2PVPKb/4+e4J8qULj8xuejsptTJfrZyJr34cY/WbV9CgIMI/98ftjaU1S+NlmIoO70ouuZPJl4zlsh+0QCvszeF2cczip87TS2lYXZQTGe4BPUppRMa8eY0LOTMaBeAoUsMesdgoIsM9MhMNMepcfIwJksklm7zLx/4TkeCgshOKElZ5hSnWYj0u24b/74wZS3DBF0cTD2Wiaen/NLGWewwH8IxFcC5A8Liw7dubs+ryWYJ1jX2uEfsnF/6CREIRXXxqQ8biXiG10Wq2tFFR18ePiwjeTr2+a8bLv04Tzg4IgdMmSaghlqRvS7786746DPSTQ4PuLeeUwwAPam5lV7n3wPoc9RANWorH8/pmO7L2Bb23h+ntMT8ZJH7Xen/5Prse89tfVSDJsgL18PrL6c8+aff2QPtUWNy/uzVVTZt5a4coU5ql7ui2HOidQ+hXqTtWy0xzKpbZJBb44tvMSoeofILqLcvDdIi5tieNkGLiIKy/Ahy1YdYdQogOFXarDI3CzEavRhNcWesc14Gp3liWy1o4foGLwzp0ihVpgndaYuO2T/Lfyo8lMoVxx/8//5klbpAYEOgbomE6NAz0SeCsn3ASo+4pDufaNJJ/4x5tGzoeqlRk2i+7Th/NDWRAwTHReyNd14FIkSmxeKrNa7Iuf274ZZfLpQvudqFg45KtFXDaWgaI+obxe8x/Amuxn4HCwKOzLzVTICgNfmmcvqPpac
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(31696002)(54906003)(2616005)(6916009)(8936002)(7416002)(5660300002)(508600001)(6486002)(66476007)(66946007)(316002)(4326008)(66556008)(8676002)(2906002)(36756003)(83380400001)(186003)(31686004)(53546011)(86362001)(6512007)(6506007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aH0FpVYCMZW7jtP/I8j71UCeyw550hCqMd/PaUEuTz2CciHDi3yQnOhiPqGu?=
 =?us-ascii?Q?dOf8Ym3lQHpXLD2i0mDN8MuMgMpHop/iz1LlrzGO4pPSIXBAIQicgvIECH3L?=
 =?us-ascii?Q?UMQPTkx/+V5m9A8xMVhgzD1XH0KBADXaALgLgt1y8Tu1WEEZIKd9NpxG5N76?=
 =?us-ascii?Q?E1S0ubfgkrlZ8ENUOhUkUFTYvY03p4WEyIaMV3gsmG+nVtaCF/pC7O3t+gXC?=
 =?us-ascii?Q?0F58GOK71ocC5Xc9JfMBbVSS02ck0c+yIsyr0MVjegGz6QKNVy+21lDHHod0?=
 =?us-ascii?Q?d6NvW6kfpD7mKGy0cJUBJW6BM8H0feeNXFRQiV1wGaDMF7GND+XWlvw982o/?=
 =?us-ascii?Q?Q/BYcszY5yw3epWmHBMBb8Ltlm4UpPtFO5v82enZ7g2CdBzvnrTfm0iXSuw9?=
 =?us-ascii?Q?Mf3ZYQsyVpkKvxxk24HWs6dgMNb8fiabMKRIUi5oZvSnNAZUyCESLA7lEJSS?=
 =?us-ascii?Q?IzOB6Em/i7eavNfMrSuz9xc7UXdWCINsGwEsmQ0/VS8+sgT9CxWae1VK+HPh?=
 =?us-ascii?Q?vGVgoabGRlWKGMxLEVltUw5w+aXhy4PItHgoRBkrZJjIUEpZ8m/Wa6rlFo2K?=
 =?us-ascii?Q?dfq060gp3D93D5NPUvhmS85ukkV7YNxgkSLN7fve/ZyMCbjhYma7o7tmOFZt?=
 =?us-ascii?Q?MqEeoqsbAfMfOmxwjRUImHCTUTDFoHrpIkwlCS5R12GAzOkH05NBUdA2oFbV?=
 =?us-ascii?Q?WLxp+QouFHeGixmShW7n2I/+31VnhpkQuKBdd96V0iUeLFcmwZdyop87kDu8?=
 =?us-ascii?Q?itoCKLaDvb6quiZdb0qGBsFhxzHNWnGau9KfrTAruc44OXwD6/BsiRm5vrCN?=
 =?us-ascii?Q?JXVS96buGN6d5NHqhisAhxPRMQUmZ0ss+PywCUPk9HZhy5tONbU/NgrWH+kh?=
 =?us-ascii?Q?AGvgGUYl9KUH2+DZl1EDCIb9EZcxXCV7nwd2xMfnup2oP9q3yItTRlwJzijv?=
 =?us-ascii?Q?tQmguPWcsqAPGGzuq9w2ToABhjNOaiRQl+CyiZPJ72hzIqvpVDuj6hbTKrFE?=
 =?us-ascii?Q?EXnUGnzmz7qbHD9713SUKxiq2FawTZW7llsgSzP1YWeSH5FeSTPZxGW/Cipi?=
 =?us-ascii?Q?/oDY/bCq412CF4Zatbc0HvaRFru/feMrpU7tPjqvTXsYTN/oCQ6Qd1SVnzGJ?=
 =?us-ascii?Q?xgiEN7v3EVWNdhXmNu4nHia1f2p4nnT85wqmef9cBXQmgm1guv/O60BTkJmU?=
 =?us-ascii?Q?P6SeyZaq7oGC8U1hvikRU+bXOhe6H0k4rN2urMzUbifd/9KLkA2VRCDUIWvD?=
 =?us-ascii?Q?GMDfSuTuWiKb9gU4XtNaTWGXao4N6vPQVrSs6/Rsqnd1sSoKzEJ1kVWz3XVa?=
 =?us-ascii?Q?0do5NB5Fsq8WIZFV0k+Wx0waU6U8dBV1K5QUHpSyh0huRpVVYaR4ee9OmU4c?=
 =?us-ascii?Q?jGZ8XDm370GqGJ6XWxw9NH6Vtzm3MAVEI0SD+rQ/i8BlSF5NSWh0DKgLQqTK?=
 =?us-ascii?Q?2/hPDJWM830hZ13oRJePdDCseC1TxMhfwyzOZkDVjJvWE5qRzGVWNY/8RAOz?=
 =?us-ascii?Q?81/BM8M2i1Gg+WgmZsMngvvXjae6VwSEbiam0i9QTJNYo/BMvWEQEsfwJUtB?=
 =?us-ascii?Q?FPMFe0hrTC0Z9IgKdo5Q8utC6LgDMf03XYAuiLa7gkXvkhP+xkpmET63BTR7?=
 =?us-ascii?Q?mBlXaKETl+3ElPmIrHTGDRRtvIaZGSmHpdt19tkJGBjKPr1ojzOsFHpe2FW/?=
 =?us-ascii?Q?jbgMtVVCSlQm9g/5+7optzR0Fy7jl/Y/50cKjQaiEUTvaiNNT86ALKYe0jsA?=
 =?us-ascii?Q?Keh2pL1BrA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70368a8-7108-4187-ca21-08da4474c4bc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 08:49:13.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKyHL01vHXcq3PbdqVO9a6IQ7rUbgPfqtQGxtNe7eNsRazySLFifF5f+Q13seCxnt1d+q4gBCKBpj2aBO/7+eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4133

On 01.06.2022 19:35, Julien Grall wrote:
>=20
>=20
> On 31/05/2022 11:53, Daniel P. Smith wrote:
>> On 5/31/22 05:25, Julien Grall wrote:
>>> Hi,
>>>
>>> On 31/05/2022 03:41, Daniel P. Smith wrote:
>>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
>>>> index f16eb0df43..57b14e22c9 100644
>>>> --- a/xen/arch/Kconfig
>>>> +++ b/xen/arch/Kconfig
>>>> @@ -17,3 +17,15 @@ config NR_CPUS
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 For CPU cores which suppor=
t Simultaneous Multi-Threading or
>>>> similar
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 technologies, this the num=
ber of logical threads which Xen will
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 support.
>>>> +
>>>> +config NR_BOOTMODS
>>>> +=C2=A0=C2=A0=C2=A0 int "Maximum number of boot modules that a loader =
can pass"
>>>> +=C2=A0=C2=A0=C2=A0 range 1 64
>>>
>>> OOI, any reason to limit the size?
>>
>> I modelled this entirely after NR_CPUS, which applied a limit
>=20
> The limit for NR_CPUS makes sense because there are scalability issues=20
> after that (although 4095 seems quite high) and/or the HW impose a limit.

The 4095 is actually a software limit (due to how spinlocks are
implemented).

>> , and it
>> seemed reasonable to me at the time. I choose 64 since it was double
>> currently what Arm had set for MAX_MODULES. As such, I have no hard
>> reason for there to be a limit. It can easily be removed or adjusted to
>> whatever the reviewers feel would be appropriate.
>=20
> Ok. In which case I would drop the limit beause it also prevent a users=20
> to create more 64 dom0less domUs (actually a bit less because some=20
> modules are used by Xen). I don't think there are a strong reason to=20
> prevent that, right?

At least as per the kconfig language doc the upper bound is not
optional, so if a range is specified (which I think it should be,
to enforce the lower limit of 1) and upper bound is needed. To
address your concern with dom0less - 32768 maybe?

Jan


