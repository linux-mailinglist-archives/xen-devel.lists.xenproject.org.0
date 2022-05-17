Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DB52A580
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 16:59:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331022.554463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyfT-0005Y6-8B; Tue, 17 May 2022 14:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331022.554463; Tue, 17 May 2022 14:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqyfT-0005WB-3c; Tue, 17 May 2022 14:59:23 +0000
Received: by outflank-mailman (input) for mailman id 331022;
 Tue, 17 May 2022 14:59:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqyfR-0005W5-O8
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 14:59:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee3e059a-d5f1-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 16:59:20 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-MmDFn1EqNkKklTLRyA8vKg-1; Tue, 17 May 2022 16:59:18 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9628.eurprd04.prod.outlook.com (2603:10a6:10:30b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 14:59:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 14:59:17 +0000
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
X-Inumbo-ID: ee3e059a-d5f1-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652799560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0838jxKDP6JPhBuqgm1n8k9OoTHvy63J17jafCGNNU=;
	b=FiR4SSYhFQKbfZAxrFMdAt535T4VWlQiDLlzvkkm0yq60zYxiqShrRKNy7cHZQFxWuuGoI
	r8tpBSH1tlwXC4Vpd1ECm0DyxpVHrK+IVFIuSpWlbwnjt2BmuAxMRz7ztKUpIrx9VDQNyh
	lwYDbQBHdBE3BzII1ZFDokD4Y/+PdQc=
X-MC-Unique: MmDFn1EqNkKklTLRyA8vKg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODg/3Ej9C5sUBs49/wQs4tb+66WWVuu0MkpcvzxT4+qGIiCdlRu5TJUDQE+KRKgb3pjNk/c7N0cAI7MVzncneT07tJCKRG9gENyQuHGwlV9e6XtnqZe6m8yBO9j46mr/7kyz+w687OsNa2tGfDKSoEJpoT+74oDxzxqTHZJXmhm6oCnNVn1cZX4ZocyafRA+FEZDZlPbFYe2mgML/4j3wTI8h0Zovbs85Ljr8RynnO5dlj6Xe9YOLlDc37VvwG5hsgPVRZrn8n12O7KSuSZ5pUoNxHXiE1GUuHxjhcmM3bIRR1YEs9TRo5HZLlo5vysgK/XalBDilf4rx7jh1NPbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyenm/uJg5Mvz9eegPGcCmFUkYK6jbI7OTfX9pAB8tQ=;
 b=JyJxsk9Jn1OuBK3UMW3Rr58HmVQcf5ha65qC1+mGcoQOyfyhOgAGAbIvLIJj13VIjQV3SOW/zySTF6SQAMBHLCEAQWDmZyfe34ngtTMxV+cb4UWUpXdjJbnbrFMJfD8DoMNYejc54U9phygdKT6JKOcOKksbUL5INTI90wFuZ3kS48PwoanuikwGf2fUcM9f93t4Jhg8Z7tN9e7NNjmTcpwFsKXD53PQxC6QSnOd801vgJ+iG1uu3E7pDXIbWxKggTLZEgtqV2iBxNhZeJRF4IQIeva2rnZ4VyxpYKbRkgDn2XMF1treTfMzZzlcd6FzXxwGi/1/6Dm6/p9NZh7AKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c5738e41-c1f7-0ad2-b36f-541403701cea@suse.com>
Date: Tue, 17 May 2022 16:59:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/6] xen: Switch to byteswap
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>
CC: Julien Grall <julien@xen.org>, =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?=
 <lin.liu@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1652170719.git.lin.liu@citrix.com>
 <c9488a2fe15d59dc86712e70614c4dbe0794506b.1652170719.git.lin.liu@citrix.com>
 <76c9bed5-6643-4fa6-eaf5-c865f942193c@xen.org>
 <SJ0PR03MB5405E449B19691A916EA3FE79DC89@SJ0PR03MB5405.namprd03.prod.outlook.com>
 <82e54293-926e-b7ee-7091-a85a9db8f6c5@xen.org>
 <6F5998A0-636F-4AFC-847D-F0CFAC5B624E@citrix.com>
 <C03D33C9-1E28-4119-989A-B7294F2E0CCF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C03D33C9-1E28-4119-989A-B7294F2E0CCF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0067.eurprd06.prod.outlook.com
 (2603:10a6:206::32) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4c1152-6cf5-4c75-4d36-08da3815d0cc
X-MS-TrafficTypeDiagnostic: DB9PR04MB9628:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB9628CC71FF7A9745807E6D0AB3CE9@DB9PR04MB9628.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Yhv6x56vUmRzrW6TstiZDQbXsunwhtpE1eW+nkR0aoySsHWW7nDHUCOGRe71x1pA9VF4uMpVHWoK7q+x4kRbKczhlIMBX5gqQ/UFTfBo5SUcp2zd95ure0CpAijuwouMyAQPdlup3J22JtKlQP3sCe3FfY35IJx83qgg1hAStbbC38VXow/6kvrji0fxJpT4LEQObGXiDBzJ0pHoYoahGUW0DWOlResT2txK0tUDZsoh17Kl7G5JXXHMHnb9Qw5lq/AFg3BsYgh8afRrF/zZYuiJSyxyhXL1GtVOm1PzfTg7efmmKn5aq7Yc4R1AW98mv+wVNepCRluuLeBf8RU697dj4kaLinZZM5vtyOxJ+QljK5InZaYZGETvcOA00hDplZmIesAdNQ6CQfLZu9MimvA6STBhALXAYptI/VPDtT6j9JMnjMi7Ac+SKMHH4emQN7nyw9tr0ncWjgTxTpncblnK9HKf1hsSiVGYl2sRjfU8CJkbaAotjcSNFrOG6PXrT5mKHq86H40f41FZG8nusMvLScCqi+HcRO6vO70ZTMjVmCLBLDacyT7aWg35A7zgxAwxDXR6F6sftRqaqtyCokyxk0Uf5QknVZYWjaeoQONeFTUNFX1DGDiZfvlNY4GDhcw4h5rpzl/3SShkMzOg1PuuMLNP2e8lj0JarRusE54O9TbRsMA6ZwYIXn6l33OrW7BcA/H3V3VytOjOox+UAKoS+LIw9s5mg0gH29k4b6BzvtQ2cps+E9V9UVg10ZOB4PeTT+dn2tyJP17tQTGfxW+3HEpHa0iznqEAeQOJkTUNCW6ak0GmOhRGQYjRa2OGXOfN2rLHPGXFQosg8GjXA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(36756003)(66556008)(4326008)(86362001)(66476007)(8676002)(31696002)(316002)(110136005)(31686004)(54906003)(6486002)(966005)(508600001)(38100700002)(5660300002)(8936002)(6512007)(26005)(186003)(2906002)(83380400001)(6666004)(6506007)(2616005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1NHbQB/1DYwWG/YyhLgjHH0saqnRk3zkL63PxoZ31GKuDFYtqtFPv6mzLzEz?=
 =?us-ascii?Q?x5N+lq1nWE8bACy8DlzvXHFwk+LDwnO9IKQFerBVpyElxqO9rMe0NaYah/jW?=
 =?us-ascii?Q?k5YAL6ihjtpn09W/dl6qFKUIjHxJf86m9nlwcB+11W5fRUGvaCLmIj5ZdqKQ?=
 =?us-ascii?Q?b6Gvan9z+BopDQUdMRs27L+ovywAZEmnGPTeSk+m37hDhsTnjuvSnv7+dJ6Q?=
 =?us-ascii?Q?J/D9xkUgq4GLAf1TA2cv7AAqUGvvoCtLf/gI2RLMuPbx5E7H7gjSpPFsgXY0?=
 =?us-ascii?Q?qywQY2sAgRyLzzAD8wgciiEDBg6xsY9WKhDYDZCkrOlNuOaJtBdHMlxNuTi0?=
 =?us-ascii?Q?yjgMsnDn7ukd8DYSLAHH8onYXIy1W3f0UJuwG1KSoVdfF3QC0dX0k9yy62SO?=
 =?us-ascii?Q?LUiDTto/zzJdtzuTE0r1m3tZ6OfPN8FDzEkRb85tluWmsBJcHJAmn/VEXVM0?=
 =?us-ascii?Q?TVFU9e2W6pwJo/I4eMfGn5wmmvhcGPBfkG7YfInMXZbXJYl9a8nGePBQjTfv?=
 =?us-ascii?Q?s2z51dcs4rzgd4I3dneiR1a+p22jrLNaAxrJVAWQeJD+E6dfveirIgvzK9mM?=
 =?us-ascii?Q?j6V0PBSd70vtODX66/JTQxKHMgKsUpFtK1MvXrLpJVsstM1zpSlYpqDFYFRp?=
 =?us-ascii?Q?6QqypRKy/zg22Qa4oKdXOFlm2xIuJ/rk5LD4E5zR1+PjXHZ12hutdUGn3pPv?=
 =?us-ascii?Q?6kHp/p7lOEBfkEZ4bX/YzwRh6FBZD8zi9ydkV4Sn3qghyyzwSaZ6VFif2dW4?=
 =?us-ascii?Q?O22+96e6mKs8BzVCS58Xoob9KrLszHdS/DIN9Uv0C4kfRiv3o13OwnxMIhVY?=
 =?us-ascii?Q?Jt0Ul0hKi3HChg2DrEGrdfR3St+suGZ1nSFxrk70z8GcCq/t6yLHrOzJVbJv?=
 =?us-ascii?Q?Lu5I9rz49V7hiWPJMWZy+EwBAbO/nPRPZ6pXn7OJenoT1gi1ckpMpJEkvw1Y?=
 =?us-ascii?Q?Yznum5t08gUY8SYINA+NZyzS0fdbUkb5p207MuW6ri5g51Wk4U9wf0DR8Qt9?=
 =?us-ascii?Q?UFMAkL18X6KKKChtPo/dbd3p8k/11svfoLZDCPJecXkFqvUr10EvZrYjedN9?=
 =?us-ascii?Q?v1qj6ScRSGqyqcsUFJ/DRiN8h60r0BMA5Yev9m0zBDsdfqSnpLhVRdVERDul?=
 =?us-ascii?Q?mqNmYPA2bkYBImhbXmLEUh+F4+/hROrAVTFmpoCCYxFI1eswe5G3YjOk4uo6?=
 =?us-ascii?Q?zcAGwVUWmsijpWdHj+ztFuQiYHgcnISuKLztaj302e8RamERrc65MTQKxH33?=
 =?us-ascii?Q?aqPBWgrEEHuX83OxigQCBarwTSsSjFKgBp4CNudlDG1506CwQGc7B1c28Ywv?=
 =?us-ascii?Q?BFy6RV4PmODnRIpmoY7LcGpjViGWrR3mtimeqyibhWwzrp3vD4XGyvKJmpPg?=
 =?us-ascii?Q?V0hXFG3aj2WhHl/ZsYC2oWniVPSc9kgotxzc4yEuhexdyBwqsv8EQ+d1zKwF?=
 =?us-ascii?Q?Jt91HRIaDCNHGfvPsgide6QsrmfN6jcWRD/nD0QEBivIph0DsMbroKYcyDY7?=
 =?us-ascii?Q?10W3asldHSmRZzz13Y224VQzBrznufYx4x/UwTyUVi2XIaWpfvr+9MUSyErj?=
 =?us-ascii?Q?6uCKirBf31TLDPgy6CTbTMhk8KunK/W+Wfj8I4VOE95borvcvOexVUVR7frf?=
 =?us-ascii?Q?FfOZEueiLbyvxKbm8dJWspoTIeC+R4lnGY6N8ykqH0iEQAwGt41t5cx25D9p?=
 =?us-ascii?Q?jUf06kxhyO+qQnGCm7pxfrinmrwRvagYpGjVuHUUfMxwJQS2tH2j2siNdEJV?=
 =?us-ascii?Q?r1+IO164Mg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4c1152-6cf5-4c75-4d36-08da3815d0cc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 14:59:17.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpf9GdyMePhiX7wa2ZFoyLDtjY+UKcH4RjRII2eSTDaSjozne6HhgklMFo5FGMiZnO4sbTW0XiW+qvCvOb7ocw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9628

On 11.05.2022 16:21, Bertrand Marquis wrote:
>> On 11 May 2022, at 13:11, George Dunlap <george.dunlap@citrix.com> wrote=
:
>>> On May 11, 2022, at 9:34 AM, Julien Grall <julien@xen.org> wrote:
>>> On 11/05/2022 07:30, Lin Liu =EF=BC=88=E5=88=98=E6=9E=97=EF=BC=89 wrote=
:
>>>> On 10/05/2022 11:15, Lin Liu wrote:
>>>>> static inline void put_unaligned_be16(uint16_t val, void *p)
>>>>> {
>>>>> - *(__force __be16*)p =3D cpu_to_be16(val);
>>>>> + *(__be16 *)p =3D cpu_to_be16(val);
>>>>>> Why did you drop the __force?
>>>> Google told me __force is used in linux kernel to suppress warning in =
sparse,
>>>> https://stackoverflow.com/questions/53120610/what-does-the-attribute-f=
orce-do
>>>> Is sparse also used in xen?
>>>
>>> I am not aware of any use of Sparse in Xen, but it would technically be=
 possible.
>>>
>>> However, my point here is more that this change seems to be unrelated t=
o what the patch is meant to do (i.e. switching to byteswap). So if it is u=
nnecessary, then it should be dropped from this patch.
>>
>> I think making people pull little changes like this out into separate pa=
tches is asking too much. It=E2=80=99s a lot of extra effort on the part of=
 the submitter for basically no value. We commonly do little clean-ups like=
 this in patches, and just require a comment at the bottom, like this:
>>
>> 8<=E2=80=94
>>
>> While here:
>> - Drop =E2=80=98_force=E2=80=99 keyword, which is only needed when runni=
ng the Sparse analysis tool
>>
>> =E2=80=94>8
>>
>> I do agree that minor changes like this need to be described, so that pe=
ople 5 years from now have some hope of figuring out what=E2=80=99s going o=
n.
>=20
> I fully agree here. The effort involved by splitting a patch in several o=
nes (both for the
> contributor and the maintainers) means it should be prevented unless the =
original patch
> could not be reviewed as is (patch to long or to complex to test for exam=
ple but there
> might be other valid cases).

This is fine for uncontroversial changes, but not in cases like this
one. Like Julien, I think we should rather strive towards completing
the Linux-inherited annotations like __force. Even without the actual
use of sparse they serve a documentation purpose.

Jan


