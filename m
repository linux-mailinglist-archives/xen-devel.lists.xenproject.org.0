Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EBF4CD6D7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 15:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284337.483551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ9KU-0005t7-HM; Fri, 04 Mar 2022 14:54:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284337.483551; Fri, 04 Mar 2022 14:54:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ9KU-0005qw-E2; Fri, 04 Mar 2022 14:54:50 +0000
Received: by outflank-mailman (input) for mailman id 284337;
 Fri, 04 Mar 2022 14:54:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKET=TP=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nQ9KS-0005qq-Kb
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 14:54:49 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe08::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06edb027-9bcb-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 15:54:44 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by DB7PR03MB4411.eurprd03.prod.outlook.com (2603:10a6:10:17::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 14:54:41 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 14:54:41 +0000
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
X-Inumbo-ID: 06edb027-9bcb-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/vUdAPss26XgUJqPs6qKgMhS5F4MZXSjeWgQrorkBdaLj8HyjDhH1EFTndxJHunbaJ3hQW0j6hvcefwnFurYp1/FAyrlq4lj8Wag0MioCr1nvg5DrGZLb6iSJjW4SvxPoq98WYuFTQBdmt47OX3m8yShh9vPJo+oozDpzhlzlEJ6DwbZMomy1iQ1p+oTaUew5RUPc845zNQ1UBjv/IsZd57Tug1MfFO+kQhfQ619H2wmNWwLFPO1dXfAir7hLqZbSgRBrY8ACFSnevALi7tUoraZx+aODhXkEWOXhTedJRkQcSwUvKcPDhwpFUyEaYiGwiajn8/vpY2/Xi5yNGSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hD2Mi4Ios0WqynSc/IiYEloUXUi+rSuIWNsElZlnng=;
 b=NopQ/BAqzSrSzgDaGlUu6Q9RwjTCA2s4MRHUNOeerqk2Pl8QvgNEXFeiTi1YUbCblzaxb0ljfiXrdZc324CI5G/yGuy5//WKkGh+n10Nk+Vcrh3piUANlfw5xfh2aH517peu9emPuDmie2cQV2JmwxrdO2K/SgGB0Xxpvx7OHP+VK1gy5pVvJHZzbkYl+6LZCNvTVShR4G5wJaoKl4zJva2c62/NEvhv+g9l9hSvemsGqxCswtVcufSmq0lNeQB4C/wbV+Z0S9PJO9W3Tr3+jFdfNJagMX0xJVbF7+IxToIvXSoh55fOLdQ96BmzOIaS1ST1lZicqtuM5ZSYeO5HJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hD2Mi4Ios0WqynSc/IiYEloUXUi+rSuIWNsElZlnng=;
 b=rRkcqUfOgzFwI5of06zb4rzgsH807YERcnqV9auk2kgLF0tYIp7zSdwiYPZFK1xU6+4hb1DsBjo0XP3mOkAqT/HZ4+//Xe08KqLtvrcQ1yfshBbB6UTkK1JoU6stGk8ryrn9MfpzU2wHlwn1gWnMI8bUgwlDsx1oW1E2jM0Ag3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <e92ab29e-a355-237e-5da8-60c43e94eb32@santannapisa.it>
Date: Fri, 4 Mar 2022 15:54:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
 <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
In-Reply-To: <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0025.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::13) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d11ad64-9bcc-4d37-0bb5-08d9fdeee9bf
X-MS-TrafficTypeDiagnostic: DB7PR03MB4411:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR03MB44116E26EB93D962A724355498059@DB7PR03MB4411.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	z5W1qlEasrIJ5D3GvpjV9H2p4b0F6Izja419jvbqMqbfOS865X5cge4rngsxpYy/R5PKVU66P3XSGwS2nWdbB7XpsObE6cfcpq5TbBQWB9KEYkKKEr1kjYyjzckcIVOR+4MdCdiWM0bobe1U2dyW/ro4vt/zY9DLwvv26KeFryF60BJ8Zdns9s0qj08rGsdmV3tCW9MJmjzK3m8WWwb970keUrMcBqhJO59gmT/7ZVSwJoeZz2BY2/nqVtv1Du+y2xSXwmPcyxQHHwEZ7VIHmt863avd0aQ0j+gsxIIiNIVG24dmL5w8sXH8LYNQM3wAlkiD1a+Cq8i4gwdVPdu/F7cXx46Vowk7L4WThcW2vINOCBHDhw4bfAvQfzREwuod669QLh9glz3ypV1zRZ2YmSYMfhMcsC2t7wEMQMBtvxL1DXNtQ30fO5IbzPmWqNkVccjFSuODH+3aPfDipsQFp3N0EXQh1Wcs2XLS6ymL3csITVPzS9ryizrcvGcZSmi8w7MNA+ojORGn8Dm67ZlgAkV3+T7fl8lW0Qnnm9B0X8N6qOXhuDcrh2PXcNZd7cRixnTfGxFIIsRQgWwjazkfVZbGQp9pjkwCmslqwkBk0Vp1gZ2LKA7L64f9lciXnrotZgvPm68/LxuyiJxuAv3eADt/wx0l0tqUjD05Fuzmi6N2FyKOjXxdHPBlpwWwRvFRaVWdGvjNLc4Vhu88698o7Di5ujjBQPNClsC6rgdsRH5HRG05pY52brrxtIeo08VW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38100700002)(4326008)(8676002)(66946007)(66476007)(66556008)(38350700002)(83380400001)(2616005)(36756003)(186003)(316002)(86362001)(44832011)(8936002)(30864003)(31696002)(5660300002)(6506007)(3480700007)(6512007)(53546011)(52116002)(6916009)(54906003)(786003)(508600001)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekJUM2pRaExSM1BOZ21IKzF1SGV1SkVlVEVVV0pJSGgvRWlKdmp5dHZGRWZN?=
 =?utf-8?B?ZDIzRHBIeEtJd3piaFBZdTZSQy9VdWFDL21ZU1JXQkZiOWJBQ1NmQkhDRnJO?=
 =?utf-8?B?NENPcmlOY2R0V3dVTHorQ2ZXaWYxQWpzS2UwV3N5Q3dlRUdvVFd3alRnVGpX?=
 =?utf-8?B?OExic2J1bll4eGY2ZmtMdWtVVUJHTnVPOTk2NU9QbDUvU2tLOENRd1RTVXpn?=
 =?utf-8?B?YmlpUnBBYlR5bW5FQUluN0hQQ0FNdG9wTS9XZzgvS0xIQzd2Ym93ZFNWeVJK?=
 =?utf-8?B?Wkdyc2VNbElZaEZCclNBcU9CRzdCby9SbS9rRGNpVk9UZjBuNUNuVnJEc284?=
 =?utf-8?B?UWVwS2ljRnRUWmM5bHM3T1kveVBYdGxiLzZWaTM4dzVwUEpPQXNWOVR3MlJt?=
 =?utf-8?B?Q1M1RGN0QmR1dWIzKzBtaUZ5YXduVE5WaVNCYmYxeEJLK3pMTjQrUmZXODRs?=
 =?utf-8?B?bUFPZnQ4aVdTSklIZ28wV280a1VRc2k1eDFXb0gwYW9FQ21zNzJBZ1FILzc4?=
 =?utf-8?B?WnU2NFg2dmVaVjRUdXBiU1lHSDc2c2RkWHdFYWc2MmxFZk1uRXg2RC8xSmRB?=
 =?utf-8?B?cE5DRkgxblZlVWFTSitpbWlIRGFVOUhIdUxpK0I1YnhuVWtVWVpydi9YNWI1?=
 =?utf-8?B?TXFxNmFvZ2cvZ3R6NTdZNU5Bd29wTmFPR29RdWZDQzJMTVBZdmNFbWpUY1NR?=
 =?utf-8?B?dy85Ymx3S3BOaW10NTJrdHRDU0VrMjdsenR0eWZ3YUxWajIzSHA4YmQveWlk?=
 =?utf-8?B?WFNpSC9rVm1lQVJlTWtvamYzRTFvY1dkaU5ZektoOEx5cG0zMzhFWCt5czJq?=
 =?utf-8?B?dXFGWStQMEh2TzYwV0IydFA1VnBuZzFqZU5uVitranVxdjlyTytZcGR5cjdL?=
 =?utf-8?B?YmRJd092YVNRS2lLZE9PRW1kNTNPeVlYSkJYSTdTbGJFTTlad1IxTVRjK0t3?=
 =?utf-8?B?MldsV3g5ZXNUcmhZc1ZYZ3dDdnhxSUcwbFpLQmFwT1dCMU5Fc3d4OU9rZzYy?=
 =?utf-8?B?Nk1Bam9GcExEQnBqM2NLQkxJK1hKSjFldkVEanlQRVN1Y21ZZ0tMbk5Lbm5h?=
 =?utf-8?B?a3YvR0dxNDVtOG0wWWIwVHRwN0FsMjllck1HdkZ3SE85WmdmMXdlaVRrRVVv?=
 =?utf-8?B?K2I3WHpHb2Rka1VvWWxxSU1aTFpteDM3VXZDaERSYmE0UDZkd0F6aWxHaHRl?=
 =?utf-8?B?bWF5ZWFnWURaWmRncXF5eGMzdktya3RNZlhya0xkN1dCeFBoWUYyY0QvbmxF?=
 =?utf-8?B?TTZoY1d3SHJ4NmJJT2hNSE9uY00rVERJUDVIbzhXeXZ4L0UzWUlURjRaTENr?=
 =?utf-8?B?Ynl5Nlo1WXBMOW1zZkJDcDliT1pYbmdyeGRWVHdtK0hEUHRBUHhLc01vK3I4?=
 =?utf-8?B?Z3NyQlFqVmV0UVB2VjR4UHluN0tkL2lyWWpXdHA4RmtEeW1IYlNkcGZ0ZldR?=
 =?utf-8?B?K1lYcDQvRkRUeUhPSTQxZm1RNUZXRmJFMjJ6K0wrODBHVHpGRVVSZ2tQcUhB?=
 =?utf-8?B?TUNraURUdWtSRVExOU1PTitxRUN2NnVaR25BaHh3dkNSUWUrcHA0RTNXYWJW?=
 =?utf-8?B?SW1LNk5ZOS9wbmlyUTdoTVRrTm5XRVpBSTgvZC9remJwdWxHd1FTMkxZYUI4?=
 =?utf-8?B?TUEreFVqc1FDSERkcWY4YVhsN09YUDdiUnVoNUlvOEwvakxTRCsyQTV2TDgy?=
 =?utf-8?B?YTdjOUlBRjBBaHlsclFXTWVLV0MrK0QvU3FqcjkvUUlPWFhnV3BkWEQ5N3RU?=
 =?utf-8?B?YUozY2hWRDdaa2JiTWpPQWh5bG41VE9ieTM4QVlvMUdVM3VUTk8wcnVwNk9k?=
 =?utf-8?B?ZldDZ215M3hkNnhIN3pZdURZNDA0V1d6a0FXeFBCV1ZDc0JpMTRQalZnUFVv?=
 =?utf-8?B?OHlmOVVLbERDdzZJOXl4c1BodlltcEQzQy9DYzZsK2NvcHhrVVd6eWFUZFFL?=
 =?utf-8?B?Q21ENEMyd21NN2ZRVlNOeFJrSzVnMit2alprcFkxbVBLbkRKMnY1c3pjeHI2?=
 =?utf-8?B?UmdkYW1BUlVSZUZWMHIvUFkwMlFUYnBJbU5TRm04YlN4YjJXV2VzNEZnaHBx?=
 =?utf-8?B?bHRoQzRTUmYvSDUwUElmdXV1cnl1THlzdlJLWUI3cXpEeHIySnV0UTJyWVNt?=
 =?utf-8?B?UCttR1FKb3lzaHhYQkJGamhhOFpBakhIM0padHdzOTR6TXVvVURLaUNDdlJR?=
 =?utf-8?B?MldvWDR4RDcrZlZyQXkxcGt6bzBuZjFFMjFMb0xkQWx4OXNJWmp1c0VlSEl0?=
 =?utf-8?B?S01hRjJ6Si8zUnliK2FXcVNYVTBHWWZMVG9aSEtPL3J0T2laS25XM2VZMG5N?=
 =?utf-8?B?STdGb1V5MjRFZUlSTUkvVU1nVHNCNEY1Q001UEhsRnJtTDFiM2xiUT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11ad64-9bcc-4d37-0bb5-08d9fdeee9bf
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 14:54:41.7947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz0IxvXezGItgt/T9QxK1PVrBmuNuRIMv1iu+n574iD/EfS/RxaPbwX6l52ezmcWcsnDdDu/1igFe3A7LOTw4NzMuzRoUfVN6PZ1rg9/vq8X0ixGUmGPW+qJS3eftw4S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4411

On 04/03/2022 14:46, Andrea Stevanato wrote:
> On 3/4/2022 1:27 PM, Roger Pau Monné wrote:
>> On Fri, Mar 04, 2022 at 01:05:55PM +0100, Andrea Stevanato wrote:
>>> On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
>>>> On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
>>>>> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>>
>>>>>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>>>>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>>>>>> Hi all,
>>>>>>>>
>>>>>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>>>>>
>>>>>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>>>>>
>>>>>>>> name    = "guest0"
>>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>>> driver_domain = 1
>>>>>>>>
>>>>>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>>>>>> While the second guest has been started with the following cfg:
>>>>>>>>
>>>>>>>> name    = "guest1"
>>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>>> vcpus   = 2
>>>>>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>>>>>
>>>>>>>> Follows the result of strace xl devd:
>>>>>>>>
>>>>>>>> # strace xl devd
>>>>>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
>>>>>
>>>>>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>>>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>>>>>> write(2, "error: ", 7error: )                  = 7
>>>>>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>>>>>> write(2, "\n", 1
>>>>>>>> )                       = 1
>>>>>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>>>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>>>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
>>>>>
>>>>> xl devd is daemonizing, but strace is only following the first
>>>>> process.  Use `strace xl devd -F` to prevent the daemonizing (or
>>>>> `strace -f xl devd` to follow children).
>>>>
>>>> Or as a first step try to see what kind of messages you get from `xl
>>>> devd -F` when trying to attach a device using the driver domain.
>>>
>>> Nothing has changed. On guest0 (the driver domain):
>>>
>>> # xl devd -F
>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>> the maximum number of cpus
>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>> the maximum number of cpus
>>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>>> the maximum number of cpus
>>> [  696.805619] xenbr0: port 1(vif2.0) entered blocking state
>>> [  696.810334] xenbr0: port 1(vif2.0) entered disabled state
>>> [  696.824518] device vif2.0 entered promiscuous mode
>>
>> Can you use `xl -vvv devd -F` here?
> 
> # xl -vvv devd -F
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus
> libxl: debug: libxl_device.c:1749:libxl_device_events_handler: ao 0xaaaaece52130: create: how=(nil) callback=(nil) poller=0xaaaaece52430
> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: register slotnum=3
> libxl: debug: libxl_device.c:1806:libxl_device_events_handler: ao 0xaaaaece52130: inprogress: poller=0xaaaaece52430, flags=i
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece51b90: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece51b90: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e7b0: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e7b0: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4e990: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e990: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/frontend
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4eaa0: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4eaa0: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/frontend-id
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece4ebb0: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4ebb0: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/online
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52830: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_device.c:1714:backend_watch_callback: Domain 2:Added domain to the list of active guests
> libxl: debug: libxl_device.c:1569:add_device: Domain 2:Added device /local/domain/1/backend/vif/2/0 to the list of active devices
> libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: register slotnum=2
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52d50: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/script
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece52f30: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece52f30: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/mac
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/bridge
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/handle
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/type
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-sg
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-sg
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: destroy
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53110: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece53fa0: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 0xaaaaece54180: nested ao, parent 0xaaaaece52130
> libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event epath=/local/domain/1/backend/vif/2/0/state
> libxl: debug: libxl_event.c:1055:devstate_callback: backend /local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 6

There were one piece missing, I copied-pasted too early.

libxl: debug: libxl_aoutils.c:88:xswait_timeout_callback: backend /local/domain/1/backend/vif/2/0/state (hoping for state change to 2): xswait timeout (path=/local/domain/1/backend/vif/2/0/state)
libxl: debug: libxl_event.c:850:libxl__ev_xswatch_deregister: watch w=0xaaaadbbd3a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: deregister slotnum=2
libxl: debug: libxl_event.c:1039:devstate_callback: backend /local/domain/1/backend/vif/2/0/state wanted state 2  timed out
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0xaaaadbbd3a10: deregister unregistered
libxl: debug: libxl_device.c:1090:device_backend_callback: Domain 2:calling device_backend_cleanup
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0xaaaadbbd3a10: deregister unregistered
libxl: error: libxl_device.c:1103:device_backend_callback: Domain 2:unable to add device with path /local/domain/1/backend/vif/2/0
libxl: debug: libxl_event.c:864:libxl__ev_xswatch_deregister: watch w=0xaaaadbbd3b10: deregister unregistered
libxl: debug: libxl_device.c:1444:device_complete: device /local/domain/1/backend/vif/2/0 add failed
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaadbbd3830: destroy
 
>> I assume the process doesn't die unexpectedly?
> 
> No, it does not.
> 
>> Thanks, Roger.
> 
> Regards,
> Andrea

Andrea

