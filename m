Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B1E511BDC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 17:26:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315165.533572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjXz-0001fn-7p; Wed, 27 Apr 2022 15:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315165.533572; Wed, 27 Apr 2022 15:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njjXz-0001cx-4v; Wed, 27 Apr 2022 15:25:43 +0000
Received: by outflank-mailman (input) for mailman id 315165;
 Wed, 27 Apr 2022 15:25:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PTsb=VF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njjXw-0001cr-Mr
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 15:25:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aded9c8-c63e-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 17:25:39 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-qE0vR_wXP86vEupDu2Ayqg-1; Wed, 27 Apr 2022 17:25:37 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Wed, 27 Apr
 2022 15:25:36 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 15:25:36 +0000
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
X-Inumbo-ID: 4aded9c8-c63e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651073138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L280cBLNfJqqp7w8xBdOA9a9TSEq0MWl1XZQLpotsE=;
	b=JB9wp6V1FBpTDznQ/WtSuFykiRaDMRcTzS50DzyPmmxCRTHU9uWVMYZOlhBp1RkDN7AkGs
	YoodzQ0sLB8r51WiPQVEgvbrYuiGKxSQRpsk4kohmucKSq7vsCcmLMCfh4Fst6uI7Nnut0
	Q4QCO/w/nxRc42OmZcuiDK9Tf+xbqIo=
X-MC-Unique: qE0vR_wXP86vEupDu2Ayqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WazJxgv3RiFhRNMkTNVFnU+Z8rwE/r06XYyt+GCF4brwzmnz2q56hCdMUJeGVGohZc4ZZUUStJpLEs1uBykSB25/QU6rYgUM7oxNMmRmCcd2MXZKSpoUyVWGLWl5Eh5GiEJIKTAOIsgq8jdVW7oTpX8yq4P3mgVFwT/p7oqbHRMdy7Jloon4z6ttx8s4CaN00SpesTYNhisQLdSWzyAJJbeW7jiJTMoHuih8w8ZouMLiXziXUVPYoxQVHiD537a+gJfWcSGDv2sG1N+qKkA1Y1vKOSQTmP242kAPZdQFstUyN6vP4GF4u/0NVuHiZfJU73vWrm6qwF2vyCx3aUbM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcw5RbpZhysFabc4fPyBliDEyDRG8Lfq8DNGKuZXeNU=;
 b=W6nqK0E60e0RNXm8Fkk5cja9cq1+N1W3GEXVHFesfMXoUsP6+1cg8AESz6z0qKAeUZMr0rQxBnm67mZ7I5JzUoFx8Rlmhk4Y098YY1jtA7TBPl5PwRa+stdR1TwVACwpe4o4DgSGs98eZfuSM0WFOUCJKER2kkfQXDtzbVMoklyzaMSqmNdDnTbNduYQvuIV8yHzO0HFAk6qCUydgYdFBJQ1BqsBuETyqpqobOvPA7UE7+6IWCTPsqSIhQLc/g5BW8KxBdTwWEH0+6oDa/2eB1blApa13ZmsUVbclOjvtDtWaOIa+nTxLnctYcxx1Y+Fp9kTNbx9JukUi55phuC9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
Date: Wed, 27 Apr 2022 17:25:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
 <Ymlb2Wly25k9bF0z@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ymlb2Wly25k9bF0z@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::38) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6f53e04-3894-43a5-9b28-08da28622d82
X-MS-TrafficTypeDiagnostic: AM7PR04MB6824:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR04MB68242F6AA4B2760459467F6EB3FA9@AM7PR04MB6824.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MD3khuvU9A5oU/5Ln43Ha9SGPXZEPMrMJ6NQBCfA/txA3TPHuswLVqhGm6nPRhHbVHUyHUYdAXHSfW9s17DiS0rb2dYfLBotAkiF7XPnqbjzpD2doovT6s+LboPld5XJz7gE5F3QXFk98Xxc88MHi450W0VG+JwO1mMqBeBfzwjnMJZ0jusdEcL3JekTKl0xFnsKi/SR9JdguhrgZ3tbw6BXwIFZpEoE/BjAXsao7OzaCY2ze2J4dcNTcKAf8Utfx33tD2hhpRW95Rh2u8E3nmeONjTm6fCt/V2y/eS1BkLxHDVnoICH6L7N0e90ivGf3FPe6laqBSWteJbvL5aug8bxf2dzuZsZfHyp3Rjv3Fr0flm0npNZI5PhU1E0wCnRS3dcPtRlNInlsx5+daFo2C6KlSTu7lvAJJTA76EXt4Eev+1tBMr2qsGyvVgnPLVcgsGTJMmbS0jKCXg1k30d1rJW+VVzYGLbHcHQwouhotEYSRFaZlpbVl7AWxqgK8JqUhqq3ciOC9cGjvG4UQSSWLenwsnORUoOaKmciv1e+H9CyaVCl8LekQmV7zazwo7K3MBcQUNWpi2Mdez9Anblw11S9L85ZNmrAuO0e5fB3XTDeb3EhzubFtSUgB8a3iIXUVa889wDvhoPcYZL8r983Vo4WpXtwIijBZ6Hlri6wLmWVC/2Wa5TVmRcncxDfJObZXP+V4wCCYiFEOiIuJmNs8LCxbsXDgBt4W6gNAjlY3ieluD0waQ1BZHff9q2zmxgrWd1I3dgnWi/jRLHnaHeX61i2+lFruMffpVT2EE6XPb7taCxkg6zgZvj/6JkM7MI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(186003)(26005)(84970400001)(2616005)(66556008)(8676002)(8936002)(5660300002)(53546011)(508600001)(6486002)(31696002)(54906003)(6916009)(6512007)(316002)(6506007)(31686004)(38100700002)(86362001)(2906002)(66476007)(4326008)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tw9j/tUjgrb+9WrdCVj1vm8o6JRPXpZ+l7xeCn+HhldUvYaay2D3NAGEi+C9?=
 =?us-ascii?Q?Dp84NA9t48NZUcaAzuGfQYG/7Wdq0ETiXDMGYWJC0qaA6AhlWmCE16Cn0GZ2?=
 =?us-ascii?Q?BzLToHA+NGIP3KDtTnOYvE0UNrQko9APAaAqLeGEw/rVvXzeqBZsf/WI2PZy?=
 =?us-ascii?Q?MFkelv1lD7Q6o/7tM2qCaEMH98gff2K4oXjNql9NkjVKksA2FzZjNlP4DPNi?=
 =?us-ascii?Q?mrQlshP5iq1ACZNH5Up7outIOLfgDupnlqmebDPx4nmaZI37tlLpRSmrPeSD?=
 =?us-ascii?Q?OwtrLB9f5rX+x1vpCNqcoqeQffyeCBl4VPibtnWrXaa5actqUHmsTWcwvnPY?=
 =?us-ascii?Q?0p2JQkazB05Z4AbbUDRYQ7gIwBQnLz7bXVh8F227pI/VK0RnWFeDO4bte8mq?=
 =?us-ascii?Q?VbHhahiC9L/Y4wC6FAewUfhRU7bj0sLtYuHxsO14nvq8FYd4vpDYQ3IBn9+1?=
 =?us-ascii?Q?QLo5GjJsZG590jNgqxYi2X388NXdYDPZsOC1nQ97PNEOIS+VchXRqbQs/RSf?=
 =?us-ascii?Q?ImYzmIADFLlna4W1Eyv8ED9CS8hNcsJ3+01bemXIFQd3v7BgWXsDZshhAkxx?=
 =?us-ascii?Q?jMa1X3oN7G6pHsFJpWXlZLcv9dOBdP+FzJ9HR6zK8zBdgNJD8QMYZCQR+Urj?=
 =?us-ascii?Q?9mK10LP6HsYrfcBBaMI+c9Uu3p48RFiI7kEsYO2xRNcKGx7M9Ls16npbyts+?=
 =?us-ascii?Q?q95Oe4FVUv1hGGLGrTHGs3EST17R1E9NE1RF2QU0QM0wrCJRQ1xB9RjgeQDh?=
 =?us-ascii?Q?Q4fsAUVoa9NbJzvuqyeJCqLeYthzodyQG6dYuBI7E/GZos0KMfoL0tNHzc/e?=
 =?us-ascii?Q?MPGUK2uMjFHojS1Y0ZstZZkVpUdO5GpRadEHvqXj4EfcdR5HOhyQ8uHbuwAz?=
 =?us-ascii?Q?Cek3izo/pbFbNOFSelhz/xYbHgWsCI0QNIVGMnWGr3TYmRkNGGApp926pf2l?=
 =?us-ascii?Q?j54yNZViNpcg1C8GZylzNs+EGP4bFR0iPNJmbEgm19PUtgbM+U7bun69O5QG?=
 =?us-ascii?Q?nYGT0OD/sFVKMQu5UMkk9LoD3Kpylj7aRgYf2F6ZTG9RSToGSjXs2EC11a93?=
 =?us-ascii?Q?jGb+DXHGVY+3QSvx5dm7IwhbiEVLvdkIXoKB2QV7d6oYKzSc0szf4A4uwCuu?=
 =?us-ascii?Q?0JwNvJQapEYlOGOCoLG73S0CU95bGjh+hnS3j63HF6tuBl7w8sH9VvG+l1Fv?=
 =?us-ascii?Q?p2vq1sMQrgdsuzEPdUHYyRXtcz15PGiN+XVYInb+wWbNTVRjce9mUCAwVdOh?=
 =?us-ascii?Q?imbOg8mWYki/BiveMrOXapwbxgP4fsOsk2lrI9Ejaj1sBDQixio8JjXTgILw?=
 =?us-ascii?Q?N2h52SP0BX9zhUB2l5c5JjwO6qfj3wHH2J7LFEichwE08UxNyJXdQbEjMGZR?=
 =?us-ascii?Q?d8f8ewI3sr+Y4RFR0Viy7sHMK/imnUKJnfaoNwXexx3A9RQmavrAknicsNtf?=
 =?us-ascii?Q?DQApmZQi3dXs33dnCaVM5O20nKEEl9fl41TZwLOUgkFzsHA+FFgKTGd97q8X?=
 =?us-ascii?Q?UiNgyZNWYw2PNzZPuP98pQVQEoizYL7EbUQobLz0Sb+VOdqt+hexTSlM4k4l?=
 =?us-ascii?Q?qt31lvT2xYuhU6FHrxtgAxmWWH7LgmDHYnhJcKF4aMQDPFEWGbLr95MW+BWJ?=
 =?us-ascii?Q?M8/FCXX1uGTJpWnbJ2FEvtPhI07LC9u+BJSR181l4VzL4YJdXPG7uAPS76dy?=
 =?us-ascii?Q?jJtc7gJq/ey20HHlQ4/5JKwT/GYGECe/MqjSQzYM/giUPWoqhcuBedWx7Nos?=
 =?us-ascii?Q?j83wzQbtjA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f53e04-3894-43a5-9b28-08da28622d82
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 15:25:36.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RilFk7SEQ74tnGhgFWvNA+odDZkGhV1ZgGuNKcwkPPtTFfiluZ5RAuA3Hc8i/tp7sEFIf8SwSznS6qQwwxBtlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824

On 27.04.2022 17:06, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
>> On 27.04.2022 14:45, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
>>>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
>>>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
>>>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
>>>> =20
>>>>  static unsigned int mwait_substates;
>>>> =20
>>>> +/*
>>>> + * Some platforms come with mutually exclusive C-states, so that if o=
ne is
>>>> + * enabled, the other C-states must not be used. Example: C1 and C1E =
on
>>>> + * Sapphire Rapids platform. This parameter allows for selecting the
>>>> + * preferred C-states among the groups of mutually exclusive C-states=
 - the
>>>> + * selected C-states will be registered, the other C-states from the =
mutually
>>>> + * exclusive group won't be registered. If the platform has no mutual=
ly
>>>> + * exclusive C-states, this parameter has no effect.
>>>> + */
>>>> +static unsigned int __ro_after_init preferred_states_mask;
>>>> +integer_param("preferred-cstates", preferred_states_mask);
>>>> +
>>>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>>>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1.=
 */
>>>>  static unsigned int lapic_timer_reliable_states =3D (1 << 1);
>>>> @@ -96,6 +108,7 @@ struct idle_cpu {
>>>>  	unsigned long auto_demotion_disable_flags;
>>>>  	bool byt_auto_demotion_disable_flag;
>>>>  	bool disable_promotion_to_c1e;
>>>> +	bool enable_promotion_to_c1e;
>>>
>>> I'm confused by those fields, shouldn't we just have:
>>> promotion_to_c1e =3D true |=C2=A0false?
>>>
>>> As one field is the negation of the other:
>>> enable_promotion_to_c1e =3D !disable_promotion_to_c1e
>>>
>>> I know this is code from Linux, but would like to understand why two
>>> fields are needed.
>>
>> This really is a tristate; Linux is now changing their global variable
>> to an enum, but we don't have an equivalent of that global variable.
>=20
> So it would be: leave default, disable C1E promotion, enable C1E
> promotion.
>=20
> And Linux is leaving the {disable,enable}_promotion_to_c1e in
> idle_cpu?

Iirc they only have disable_promotion_to_c1e there (as a struct field)
and keep it, but they convert the similarly named file-scope variable
to a tristate.

> I guess there's not much we can do unless we want to diverge from
> upstream.

We've diverged some from Linux here already - as said, for example we
don't have their file-scope variable. I could convert our struct field
to an enum, but that would be larger code churn for (I think) little
gain.

Jan


