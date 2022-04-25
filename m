Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A48250DE3C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 12:53:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312758.530111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwLC-0006Fa-RI; Mon, 25 Apr 2022 10:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312758.530111; Mon, 25 Apr 2022 10:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwLC-0006Dl-Nx; Mon, 25 Apr 2022 10:53:14 +0000
Received: by outflank-mailman (input) for mailman id 312758;
 Mon, 25 Apr 2022 10:53:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfhB=VD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1niwLB-0006Df-VC
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 10:53:13 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e70b25a2-c485-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 12:53:13 +0200 (CEST)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03lp2168.outbound.protection.outlook.com [104.47.51.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-fsBYCsJgO3agIUnH_B4XZg-1; Mon, 25 Apr 2022 12:53:09 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR04MB5038.eurprd04.prod.outlook.com (2603:10a6:803:5f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Mon, 25 Apr
 2022 10:53:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 10:53:04 +0000
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
X-Inumbo-ID: e70b25a2-c485-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650883992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZfP6s02toHYPEMp6mxxnFkTVTPvnTh1FhSdVHQfn84=;
	b=hhuu+sT9V89Rp62JnHjDXGz2m8qPgRnvHHndJZoMarPBrYxFceUPwP9LhLvrtVZhy4OG5k
	afJ7Y8be1FVBY2Wv7yv/gQiDknLDNJbAisvIdqKSt/L6hj2oi4OFrMy6m/+dBDSU+L391a
	yFtdFNGpOTtQpOvL7UwV8rutVrvfIwE=
X-MC-Unique: fsBYCsJgO3agIUnH_B4XZg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGOd2w1/9yRf0b1siVodxQXJikefAkVFmU/tTSHikwnvWG1CmDTfBnOxLRf2z1Cra6Q+LLgCO9RvjypPe+3t5+fOu9Gmt8CaA1/YPpwarQRe/lJA+CRs9rncKIsL03cQXZpy7h9LyDQb7xUrRpoxwxqvVQGwqsoQ2gXvMgcWdP81byoVjHUyhDkcpBpAT/4ZwIxKdQEh25F27YYXxPHq/wdNyHNRUsy0FXfpt67hKsRKeT3q0h68fWnKHcCodaxedotpo2On9qgtTRUvQVjPf6DqDFFsc7aj3bgr6NYyLPGYW3WRh2nD3ThwD6643JRvHdlpdvjr6nTv3bXkEnkMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWlv0Hwx6m3KHUiLAt+bvdpKPj6a6h2mjmmvKM6k8sM=;
 b=e7a0PW6hnVgqlG1D/d7MPxKA9z3sOlO1T0LKfKFgLp2R2F+Lv2K3kZsVCCGZLtL2Wo5vIqzBWSMc69eDl6+LuH9ol864PC53x/baVFPjGowiZ6/Vu27OGza2Tsub6qxmyEktYXlQbpn/syB+abHStWI7O3XfFURzHktEVzN+jhGw5XooyXshyLHj/mCcCsjOSXln66lIFCFDhXSSkJPXa2iQrGVh3sompcETFf9kKT11OP4TlqDpxoMOoY7f6Onsqh6DKHEqUCiivBqliwDte4Fd1OYFdVZhNpFkigLKLaH/gV8MSf4MeK01J/wDXomM3pDsqd8v73lO7FuMQ4S9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c2875af-bb9f-38ef-dd06-c74d0c20e7c3@suse.com>
Date: Mon, 25 Apr 2022 12:53:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] xsm: create idle domain privileged and demote
 after setup
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 scott.davis@starlab.io, jandryuk@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220422163458.30170-1-dpsmith@apertussolutions.com>
 <20220422163458.30170-2-dpsmith@apertussolutions.com>
 <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmZtiJ5Jf1CNOpeZ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0354.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::9) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81e1aed9-33c2-4db0-46fb-08da26a9c665
X-MS-TrafficTypeDiagnostic: VI1PR04MB5038:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5038CAC9E4B2B5D5178F2289B3F89@VI1PR04MB5038.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QDBH0ogEBZnacSSt54RRSKYp+U0F5MxIhujIKVAfG3Wt+h9QVNIVD4NKhwlTtbk2ANjscYUG1XVkgwobMpVA1ZzuQK/n6FW+lIpjRlFnnzKcej1eDpIhZfxJ1UUcEiNw1MtV3xAy9HoZmVF8GLem/pOQFERcpKxDm31AJ3aFVM88J+4lVfL6sUGAaqXSYB3+p883fltOUtyZI+23zSJQh/feFX2r23gz3To9yLZ04LDyKlS0ui1ObatOThLb0bza2BRkGf3/gByvpWG+gPz93HA/6BkoqIRkEh3jNSYSJ8e7XB40sAFMfqMgnXBnwPytTabLPIdHvwi1DkGVWJMFbgAsTLqntqPC6/8vpRECK9LoC3Wj8W+M7e0LZKDHzKz/Sn0DmGy5NhSe5kYMOfjqRUUoto/7+Mt4KTh3e4ImVrtrHKDsAbqbLGL+kxAsoBhPhXqEFUKiHxuNjepuOwRf4mDDcl3nDfRQTD9Wfhc0Dny/7L75EBcyDg3L9LkIzxzmNw5R2B7PJRywDLILoSIXZ4PRl/GfDECexnfTYs41zxag1Gq4KgvW3qRBRPYLjqFhpHKK1Q/IisFSpRGiFzlYw3DFsHloIiUJw2v7vj87UmB5eWS5gBlN7K0uoqbLSnAJv2YwQLzgoZo8epPdw28DxNxj/5y0GkRR3vNOkNnn2Fvc3vgke/yyuA5x99cgfjVDhCxkZPJSWrmFAGctuMDR2fvUVhWoOxEgZ4yzkYnlwxE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(5660300002)(38100700002)(6506007)(316002)(6512007)(53546011)(26005)(6486002)(110136005)(186003)(54906003)(508600001)(2906002)(7416002)(8936002)(2616005)(4326008)(36756003)(8676002)(66556008)(31696002)(31686004)(66946007)(86362001)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MRRronChdPPO7u8LyK6WSqnUHZYap++NsGmFfuCBG3D24pTsqEmaCw17VWMo?=
 =?us-ascii?Q?YhFP3xk6TprBjk6HQj40jqoX7gw8YHizgLqvGyT7OvrNhZL1RqL1t0rg/3Ng?=
 =?us-ascii?Q?qitjSuqU6QyW0uo2g5zjXZgjeNlybqkBa3zrp2Q1D/cPfMJ9k3BYf4HocX8u?=
 =?us-ascii?Q?s1vQQ6fSbEhyBWjLhAen33MgFWKQlLZkWcV+MK9TSOcn21ACLfIFObAr04wQ?=
 =?us-ascii?Q?RvGiztClwBxSF1hddCZCGhK8rUOOnbp9UuHRkqTZglu45pihTmt/QSo95EEO?=
 =?us-ascii?Q?Is/TlIEHlQkq6rj/t3fN1PprVKfhu5ONB0gatk8TSOIE6XmGXdRIuK1D1JZy?=
 =?us-ascii?Q?AErVytbe9Oddo6NUCB2Ngm9G0HQwYwy8rlKCUiz+owgy2im59fNjvbK6xbe3?=
 =?us-ascii?Q?G3VWW5bmu4rvpySa84lCFtUmeBH8z4cYnu5P2tuisGp4saRsCenZ1/W09uFr?=
 =?us-ascii?Q?9hNn+Rlpvnhb2EG1W56vBNIE9e5Rd/5jLEaahpc3x9/ZQW/7NoMR5o0hmm73?=
 =?us-ascii?Q?YVxRgAoi8emhpAqgJlkF5vmYCTrhoSnD2CVk9Dj4iIRyXWYCgEvumCT8PT0j?=
 =?us-ascii?Q?23byn6V8Hds4JlJYrgMBO5nzEFPoHAd1mEto6tdMudhjGzu7D1gJM7qiSosq?=
 =?us-ascii?Q?vSLGVG7jcrZxxsCyO1BHxbZQFLnHPiVhqwmgqjxguDmHPdr0jZSeiD5rqVJW?=
 =?us-ascii?Q?iq8aP45veBmWxzJZ6nQITKJcsV3H3c9BD6sKiNJWbiGc4TFkNEXnsK2q/IYo?=
 =?us-ascii?Q?m1oFdfuCW7uhZuHGRmkCiLZy85qSoeJ0dRaEb8dbzroAM6wffTYR/udroriA?=
 =?us-ascii?Q?H0G2Yj6ReZUKFvVbbsI+Wc8QV61FsR1xrhZ2YXTTRFURrC2nsgG4LBxtp9yo?=
 =?us-ascii?Q?p2WBX+atb35pNjkRuh2nir3Sq6oTmoY8RE/3457u7KkrkgXP4ndN049+g6eQ?=
 =?us-ascii?Q?qeih22HaW+SI5W9F36UgjLXehpSY6+qvFXH2yavarxuM4pKmyNx8HDuvaED0?=
 =?us-ascii?Q?/RFe7Nwn+YCnzi9fMewNbG0fRLaWcRS0jCz0aGEsEwPDMqn0lb4QG/ZLxn1d?=
 =?us-ascii?Q?wjW08Em/CsqDkxyHaJxbCWNWonn6M9iD4e85SRuAnEdDHZz/WBcB5aXBdKIC?=
 =?us-ascii?Q?otsf4SkAzcU9L8XNmr3MdU6E97/CJSc7wT9DTr/KvTfKjKFsEcMYV640GBBL?=
 =?us-ascii?Q?DBuuX72zOUFjlGJvCUQhV1s4+yq6qnGePeXFDjeC7yQN3fofn3sJYaYcTCqh?=
 =?us-ascii?Q?15vlL+SckaeO92XO0RarVtW/CATPAhQloZOsTGGBgaKqxGdZpcz9+GP/Xu6x?=
 =?us-ascii?Q?hh5m1BBgLwHbfVbC8OUw4OpHrP9DQQCAB67UPjDZ2CGbK8WgaUg979KR1dI4?=
 =?us-ascii?Q?x00uLGUJumvpjb4ITm4Unc/iKUX3yB6ybgrePoX2OVvRKdUuYHTOejbzpiTz?=
 =?us-ascii?Q?dJL+EkJNFjqk0weplYZJsTLSj2fHAQYNVnOn327ML6s21DJhj94FRIHkY6M8?=
 =?us-ascii?Q?et27m2L0ZsATl2Moi2Q3FCFNCynqGU3qToERJfVlQd7AfqwA+nuyhPuIEt9n?=
 =?us-ascii?Q?kFnByYBM0xwY7x1WQ7C3IJi9PCsL03iJ8gp0VYQM4TlJ95Pspm/lD+caRyk4?=
 =?us-ascii?Q?PnK8H7yLlnHdNF4jgOd1PQRiYza3K2LxAAB5xXLuOSP8MiFkhjetQYFNiQ0e?=
 =?us-ascii?Q?JCtl+yBmA0REb4XBW5skRkCUYr5ADfR/3NBE/NTYi4VH/R8lF1VLYtdrU4E9?=
 =?us-ascii?Q?9WLibn883g=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e1aed9-33c2-4db0-46fb-08da26a9c665
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 10:53:04.7763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TeOEXATsq4Cm2GkY18NWHJKOY2ej/5ies2ERc5q7CU/NIS3HLnb9vm+H/hjp6zyEWKWBl5IzE/Zfj8J00mJtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5038

On 25.04.2022 11:44, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 22, 2022 at 12:34:57PM -0400, Daniel P. Smith wrote:
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -621,6 +621,9 @@ static void noreturn init_done(void)
>>      void *va;
>>      unsigned long start, end;
>> =20
>> +    if ( xsm_set_system_active() !=3D 0)
>            ^ extra space.

Hmm, did you mean

                                         ^ missing space
?

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
>>          sched_ratelimit_us =3D SCHED_DEFAULT_RATELIMIT_US;
>>      }
>> =20
>> -    idle_domain =3D domain_create(DOMID_IDLE, NULL, 0);
>> +    /*
>> +     * idle dom is created privileged to ensure unrestricted access dur=
ing
>> +     * setup and will be demoted by xsm_transition_running when setup i=
s
>=20
> s/xsm_transition_running/xsm_set_system_active/
>=20
>> +     * complete
>=20
> Nit: missing full stop according to CODING_STYLE.

Not really: A single-sentence comment may omit the full stop (while
personally I agree a stop would better be there). Instead starting
with a capital letter is mandated.=20

Jan


