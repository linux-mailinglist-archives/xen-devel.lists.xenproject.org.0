Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C1240182F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179491.325769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAGr-0006K1-3h; Mon, 06 Sep 2021 08:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179491.325769; Mon, 06 Sep 2021 08:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNAGr-0006HA-0O; Mon, 06 Sep 2021 08:46:29 +0000
Received: by outflank-mailman (input) for mailman id 179491;
 Mon, 06 Sep 2021 08:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNAGp-0006H4-U2
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:46:28 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ead0f9aa-0eee-11ec-b09c-12813bfff9fa;
 Mon, 06 Sep 2021 08:46:26 +0000 (UTC)
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
X-Inumbo-ID: ead0f9aa-0eee-11ec-b09c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630917986;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YJpL75vOv1uu/c6yyOoRd6o8Efhvw6/U6AAGNgCeSJ0=;
  b=F/KM+AoXPwZwIC9G/kHJvBQHQX0VfK2KRTstCdtcs5hA4FYoKcujqTVJ
   IuLI0HebM9DG4GcChA+kzP8rkEatO/F5cRpaccgigxWyB+esElLq9kEkF
   1XbkcWwgLNduaCsPCbecYEyshsQM9YtaJfwABVNPals4HUQYGrl5eU4Fu
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0z+8TH3Pv/VgxCy7RjjW41oHdfRa/etgPAXFg1ex0PctC0AC6QIvnDhavS2YfEVAxw0HUrC2w7
 3P6VQDowWhJJMAzL6di+qjBS4vjhFAtkZeysFbAuM0ma50jDOhQfqkCqESqxNkjOEYxKygP1hK
 1WLR3IrOiH2bw6GosjdmnSXpoz+/Vn2Tg6vEueVPdmBDHdOMVNdHKpUh+XkijYELUhwPKAxPKl
 5aQFVv4fCIO5nc7+67s1rMEUBctBkfFEl9SOsn2Hcuz/qwgPwj6GXlI9kTvg7OkkvhCsfx7yGi
 B1NLcweEKgHK1UtSxrx17igz
X-SBRS: 5.1
X-MesageID: 51680239
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ByibLqjJ+5mQBR2jh3RrPltxQXBQX0h13DAbv31ZSRFFG/FwyP
 rBoB1L73DJYWgqNE3I+erhBEGBKUmskaKdkrNhQ4tKOzOWx1dATbsSkbcKpgeAJ8SQzJ8n6U
 4NSdkZNDS0NykGsS+Y2njKLz9D+qj+zEnAv463pB0BPGIaCdAT0+46MHf9LqQffng3OXNTLu
 vk2iMonUvERZ1aVLXAOpFTNNKz1uEj2aiWLSIuNloC0k2jnDmo4Ln1H1yx2QofaSpGxfMH/X
 LemwL0y62/u7XjoyWsmVP73tBzop/M29FDDMuDhow8LSjtsB+hYMBEV6eZtD44jemz4BIBkc
 XKoT0nI8NvgkmhMV2dkF/I4U3NwTwu43jtxRuxhmbim9XwQHYAB89IletiA1DkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooFI5+NRjzEB3YM87Uvt8vIYf9ERaHNMrByTh8r0qF+
 FoEYX1+OtWS1WHdHrU11MfgOBEZk5DWytuf3Jy/vB8i1Nt7TdEJgojtY0id047hdAAo8Iu3Z
 WDDkxq/Is+BvP+I5gNXdvpevHHflAldyi8eV56EW6XYZ3vBEi93KIfwI9Frt1CK6Z4gafbpv
 z6ISVlXCgJChrTNfE=
X-IronPort-AV: E=Sophos;i="5.85,271,1624334400"; 
   d="scan'208";a="51680239"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al5qySRNiilD8T4leYlpt+sy8m8JPRx5uwqCjR2AJ57DH206eyitVZ/yiGF3L1woOVwJMZ9s3GGOsFucXzKWdaU6qIO0jU7vrbvlgpgOndDZvDAVXbpuc09JKLdeOF/UE1XrXQIselVanaUp9lDw50tk5bVt8jR03DTza3tuLTOj1iLB7b5YRiTCocKm18blCQjpoCXewVUdrRU64ZIBnG0nQFeMdDQLahqP9JnFS+xOQEaNKcm/aKypTJ5771s7NZDvGgkwIhPbq6/V8+unoj82iJVbTdfSnAbpkXzxwJjsauDndECmqjdLkRa0zQQO1/Cslfzlm+Sg2Fk+gcrDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YJpL75vOv1uu/c6yyOoRd6o8Efhvw6/U6AAGNgCeSJ0=;
 b=D4M6qXOaR05hOFyZ5mjVUD2Gbqj/SqgLd3O2MQ9C2uhSjzki0U4sKrgakyTovAav9liZxUa1c8nAg6micPXQPPSTUxaqE+i3GTl7JvJDJlT5YlxaG5hrOF5YpRPM7VE5Iy2PcdFMuaKSUBF9eU8A/KORWE6jBgp10mgNuYT/lPGlvcaw7U1aWXNruSA+D0D/7E5KGpwjJssOAKAEK2RkdIkeL7zfgoR2opMkeGdHWZy0b0RUtstToMKX+6UPcNbPfrURSKiWvjpYAjOlywxumeNC14hEu6znZ8MNIa6g8M9vbBR57OtP9kYwZx2Ugi2ztCAVeH+7N6DswuedMeg9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJpL75vOv1uu/c6yyOoRd6o8Efhvw6/U6AAGNgCeSJ0=;
 b=CqsTUhvP+CsCJiLGTnc9u0xa585YmgzJRpJaoE0dd1ln0FRX3ZLY/s2czt+rV/mROxBfWJI6zeitHMYp0TeEAatsGtaiohxKl19iYJTNVsoRgvM0aUwZBdCg872wlFOfoxO0UYUcXd9Qsfb7bHaXSXf2SwmgYoWRiaNS5pG8liM=
To: Juergen Gross <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>
References: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
 <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Crash when using cpupools
Message-ID: <c1554429-07d7-1f9f-ef0e-1931675f01e8@citrix.com>
Date: Mon, 6 Sep 2021 09:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8df172f7-ae1b-45b4-5282-08d97112cc3c
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5437:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5437D3425DCA87DE885C124DBAD29@SJ0PR03MB5437.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPXAKvFhAiDVtkNA9WklNP1J5rWIiz+Xfwl2ZzT5/9YAdJooeKf1zmOzbBAfrC7oOWYEGc/eOef3XKczWHNaKjvhp8bqDZXib/7rKKwvdpgjMj29pA/Jmd+jQXxmpTZLyd45qI5xveouN2yQDlig2P0CdLuRtfT16guTZVwnJonrY+vvoXCAXu8LGxZxV4UEc4syOkCIYKcS1MM90ujfHjZW24vXgyy2vnIeWjAUk9eqVfD0okDu7COQRl+iHR7j0isHuNuUKCBnC0XSfMtX1ZJFqNS/uOi3VmfZNWi4WE9oZRcRdvr/GFraQ/b0pqAy2tmwQoUPr+FdiTAe+YHHUl7DfLuTLli2vl3E1CvIYFp7knkduRPkXgX0iQw1cpVJZQya5VMyjLlVX1hYs1piXN6tXTptbwhMOcxjDXhGcjOX+De1mx3/9ow/ZNy0XLomRuIoyEihyAy+mNx4SM4kqAtder4dA0PNGAU5hpIBK9/tgslMUS7h13wslR5KbIR16QdnIJ49llNMVW4qV9yRxdL4DiIOVMCuAgZfjU/1eMvU5+U9DHY5pmaF6v60nbxRNyW23+na58LO7Y6iY8kduiwAFp4B1GfksfIBjRhZWGTGwKcMRLVt35THGNeratr+rkJDALPpAOOdS7nAwXdT2kQUDd5MSzt6awE521xZ94qJm0p+7XygGSOYs0gi7RMEow/AbxqUkX7JpMQ9CYiQxCW5k+C7IP694LPKptWWf3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(31696002)(53546011)(26005)(186003)(316002)(38100700002)(86362001)(55236004)(478600001)(4326008)(2616005)(6486002)(2906002)(110136005)(83380400001)(54906003)(956004)(8936002)(6666004)(3480700007)(31686004)(8676002)(66556008)(66476007)(66946007)(16576012)(36756003)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm9DK0ZFc3h3U0IweHBNM0dPODFjMGJjR29NVU4rWUtqNFJGWkc4VThqWWhK?=
 =?utf-8?B?OERSK2h3WFFZdWZXV3E1U1FaUWh2NjRKa1piVTk4bXQ3SlBoRGpaUHdxVEtV?=
 =?utf-8?B?T3E3bm5iTndPQkN5MlQ0TjRKVnpoTXBrTittdU9HTkhrejZOREJmU2JKb1NK?=
 =?utf-8?B?cUIwUklRb3BDdXdGTW10L2dybnd4eDhNTnBwYktzdGYxZ1VLOWQxek1vN21F?=
 =?utf-8?B?Rk9VVGZvY1RIRFZYNmtqMWNyTUprSnFBKzlIZGQzU052UWN3MmN0QmJxanlw?=
 =?utf-8?B?ME1KUms5Sm1xTFNDUWdHaHdxeUF5ZmRvaGJYcXEyUFNRRFI0bjhRTE51eGJW?=
 =?utf-8?B?L1JOdjFPMysxUEpvVHlDaCtaVittbFkyS29zZkEwaS9UTHk1QWtsVlZIdlNt?=
 =?utf-8?B?cXBzRlFlL1dVVlNZQVFuYTJQcENadzFNL1ZPMHcxK3BLRlNLNGpqbFBzMSt5?=
 =?utf-8?B?bzcwSnF1VmxTWHd5OTFLMFp1SW1aRUs0RkdZMzAwQXpGTElIc3dXNUw2Qi96?=
 =?utf-8?B?TEQ3SHY5d0xVR1VRcWFJSmxXSGF2SVMrT0NZTEZoMmR6ZCt4U0paVVlqSXNB?=
 =?utf-8?B?TTdtNU5IYVdweXpBcHl6WU9ibzQzUmxybzNpWFltc2o4QkMyT1ZLRHMrTjFZ?=
 =?utf-8?B?T0ZEa1NXb0cxZkxxb2hxZDgxck1OQ3d0WTZDSEwrT0R2RkgzSkNsb0lTWVVB?=
 =?utf-8?B?VEYranlZSEtySlJaaWR5Qy9IcG93cElKN3YxbDVySmhndmtNZFJkTnUxaHpj?=
 =?utf-8?B?cUVhaDNFS3FlMTd1ZlY1V1VJZjBJWUpZQkNiSWVvdVBhT01oSmlRa1pva0NR?=
 =?utf-8?B?VnkxQ3l6ZjRsQ2IzaklNUTMwSVI1VSsyZmtVNDFjQ3ViUzVBbmFmQVVaTjlN?=
 =?utf-8?B?UG43UHkrd2JML3VFeG1EdC9LdEVueERoUlpGY3BoK25qdEJqSjZkajZQWERt?=
 =?utf-8?B?Y0tjdzhiRzlaTjVBNk1WKzhlQVlxZ3RDWXZ2NVo1MEVtNzV6U2JjeGhjR3E5?=
 =?utf-8?B?cTlBNE5PSjIvYWp1OGRCR3VFa3NYN1Y5YVRSNEt6eG9ZMWlWNWZ4NUdsaGNU?=
 =?utf-8?B?WnlMQlBWc0YwTXNFRW1ORXNmNVpaYm1ZNEpPV2xORUZKSlB5czhobjUycjlv?=
 =?utf-8?B?S1lQVlEzOEU1Q3VIL0wrOEZDWmpyemFNYUtZWWhDSkJra1FRN1FnVmdIdzg1?=
 =?utf-8?B?YktvUm5pT3NkVWlCMEc3MHVzWC9xNHNVbnQ5T1h5cTNBMjFwTmFBVzFXclZj?=
 =?utf-8?B?RFQxWHE5Z1lFNnRlQXZRNGh3dkZDVW92UDhQSWpSbE5IN1kwQ05ZMjh6N0J6?=
 =?utf-8?B?VDZNaTRzbVhlSGZlYWdtdUFIejMxL1dpUk9QbURnaHMzeHlWb3cxbkY3bTRJ?=
 =?utf-8?B?Y0RCWUI1TE1Ca2lLS1NxZkw4Q0pPTWVhS1oxTjkwVUJRRDIrYXg5RkVsMVBT?=
 =?utf-8?B?azM5di83TnI0Z1NuTWNpZEJmdVNlNGl1TnVVK0hnZnVLblduSHN6THo0eFNE?=
 =?utf-8?B?RnQzczc2UVcwczR2NDhrNWUwN3NuSHNHZFBITHp0aUs1TXcrYmpvMm84Y0I2?=
 =?utf-8?B?a2RLWkkxTE1sMXYvNldjZzhDb3YxeWYwcmMrQkVCKzlmTU9kbUE4UUZBUGNw?=
 =?utf-8?B?ZmJzYkNtbW9weWpxR2ViekVlcldRNDJTWGRkbXZYQXdTeFA3bUtucGk4bm5u?=
 =?utf-8?B?V2ZtRC90aE5uOXR5aWZVZjlBQ1VwY3BFVzg2T01DK0xLTnllZjVjaVZFY1hF?=
 =?utf-8?Q?8oa+g9RU4smc6oRsS1tBpuLp2GLMzuv6Tad8e6H?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df172f7-ae1b-45b4-5282-08d97112cc3c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 08:46:20.1470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orid3NBW0Hg8Ay7PiHOLc7tnUUYbIn2KlEV4N/FVr9QdppjX8KRZ0T1txRJPmaXx41a532IZyLZd1REvu4ebevO7u6kbV2UC5mRijClQ2kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5437
X-OriginatorOrg: citrix.com

On 06/09/2021 09:23, Juergen Gross wrote:
> On 03.09.21 17:41, Bertrand Marquis wrote:
>> Hi,
>>
>> While doing some investigation with cpupools I encountered a crash
>> when trying to isolate a guest to its own physical cpu.
>>
>> I am using current staging status.
>>
>> I did the following (on FVP with 8 cores):
>> - start dom0 with dom0_max_vcpus=3D1
>> - remove core 1 from dom0 cpupool: xl cpupool-cpu-remove Pool-0 1
>> - create a new pool: xl cpupool-create name=3D\"NetPool\=E2=80=9D
>> - add core 1 to the pool: xl cpupool-cpu-add NetPool 1
>> - create a guest in NetPool using the following in the guest config:
>> pool=3D=E2=80=9CNetPool"
>>
>> I end with a crash with the following call trace during guest creation:
>> (XEN) Xen call trace:
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000234cb0>] credit2.c#csched2_alloc_uda=
ta+0x58/0xfc
>> (PC)
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000234c80>] credit2.c#csched2_alloc_uda=
ta+0x28/0xfc
>> (LR)
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000242d38>] sched_move_domain+0x144/0x6=
c0
>> (XEN)=C2=A0=C2=A0=C2=A0 [<000000000022dd18>]
>> cpupool.c#cpupool_move_domain_locked+0x38/0x70
>> (XEN)=C2=A0=C2=A0=C2=A0 [<000000000022fadc>] cpupool_do_sysctl+0x73c/0x7=
80
>> (XEN)=C2=A0=C2=A0=C2=A0 [<000000000022d8e0>] do_sysctl+0x788/0xa58
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000273b68>] traps.c#do_trap_hypercall+0=
x78/0x170
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000274f70>] do_trap_guest_sync+0x138/0x=
618
>> (XEN)=C2=A0=C2=A0=C2=A0 [<0000000000260458>] entry.o#guest_sync_slowpath=
+0xa4/0xd4
>>
>> After some debugging I found out that unit->vcpu_list is NULL after
>> unit->vcpu_list =3D d->vcpu[unit->unit_id]; with unit_id 0 in
>> common/sched/core.c:688
>> This makes the call to is_idle_unit(unit) in csched2_alloc_udata
>> trigger the crash.
>
> So there is no vcpu 0 in that domain? How is this possible?

Easy, depending on the order of hypercalls issued by the toolstack.

Between DOMCTL_createdomain and DOMCTL_max_vcpus, the domain exists but
the vcpus haven't been allocated.

~Andrew


