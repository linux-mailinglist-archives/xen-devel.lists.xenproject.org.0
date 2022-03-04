Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8645A4CD3DD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 12:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284213.483419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6YD-0003h2-3c; Fri, 04 Mar 2022 11:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284213.483419; Fri, 04 Mar 2022 11:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ6YD-0003fB-0F; Fri, 04 Mar 2022 11:56:49 +0000
Received: by outflank-mailman (input) for mailman id 284213;
 Fri, 04 Mar 2022 11:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKET=TP=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nQ6YB-0003f5-HL
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 11:56:47 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2959e390-9bb2-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 12:56:44 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by VE1PR03MB5454.eurprd03.prod.outlook.com (2603:10a6:802:a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 4 Mar
 2022 11:56:41 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 11:56:41 +0000
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
X-Inumbo-ID: 2959e390-9bb2-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRwxrzxy9HoVX/eP3HAciMkZORQgIOU7hrd95QqcTiJ9smnybsNammO3lcLcN/IvpodpXxEWo913B0OWjNpiIYkTgtiXmKU6YP6gngu2HNfXGQ54AuGpmyJvlD8cPLuMZQd1K6Uxa2lXZnyA2fJ5dCtQf0W/ZZNIIlytRyMY1EFk3dohk10Is449s8KZChKsNYyym75IOrCHrJ9YoG6klaZcQwXUd9hq4WK2QQB5x6CZXhfmD4S9NtjQGvcyEvTOTamvkzceYedS9+UtJNKOt/3A1u5UGq23Wd9Jz8MXadPQi1x+eLmK6/b8QD6ON1nAT0GQC87rs54QNPMdTeqSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o63noCftgahBZB6mGGSsYpqEcwZ66lBdKmZDDCHIV3U=;
 b=Xba/GBUWkyOnPqmdcD+61obEA6zaoHHx+2nk35w4ysPmI1hoKohP3wRDC9NSYZoxn+p0bzLTjp8hEIz8vB7xtYY8zEFpVV6xHW0i7UKtzFba8Sm9lf7tZKD9bCwzBVV1SbVVNbITZHBKvFJ4owOZcga7JWcVVO7xlqK0Lhb5KfZnOkwCw0AQwL2XGy1LLpToTLj1K/edUQfLXpN02+KJuGf3fgT3z15TYMJBoBYINfnTkjuzVy7DFatY1LiHlN5AWuTqLS8jL/V+7SlxFnMrB1pXA3zkmWfBE61TBTj4hQoL22xGbQCyeZi/gcNV5i8/dlccJR13lwcyxePG/XN0lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o63noCftgahBZB6mGGSsYpqEcwZ66lBdKmZDDCHIV3U=;
 b=KevitR/acGzNoLgkcSrQttMO0uh+GvMdTZZPTL/vdbjrozBQIh0HNIiPwVPRFeF+R1gMvT3jyBTCcEb9MRCMBDSk29MsQGY/cJCXPEpezIymNfwPX34PVcUANbxRAVRgiftlW6AmaiuEEQq73PsvinQvT4hKCkqme2kJB69W5Hg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <1d00a228-a699-5743-69ae-4dbadee5ebb9@santannapisa.it>
Date: Fri, 4 Mar 2022 12:56:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::28) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba0d083d-d6a0-4c8c-485c-08d9fdd60b96
X-MS-TrafficTypeDiagnostic: VE1PR03MB5454:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR03MB5454D79E6518CB87F5B2C5B398059@VE1PR03MB5454.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ixhFpaQADRX5ko1PNp13qlrbaQJAir9CkmzRm9Wn4mplwMIwP1yQL3wZAEtkyizKFq9np/dKEOxedPI7BJY5S8873eUT9CsHGgFb4UCBdkOkVSPv5R2tUWJlCDKTrQ8q5AzLG6UcyMwxoNNNLFswG2we6P6Nus3ptJD/cAon/ThHnGwGxtE1rDUBkCcbUHkzkstwD1V606QVS1TyjIGJzniQnqZ7fh4VouK70ZqY9MiRKjGeQ2EXfz8gMPcPU1s7i7IDaX5/Z9u2nF3YNSC7ZnPqerSIriVlC5eaIZTo7+hqiaoQG/FVmQJANglBp0JSpBZwPQLKqp7pG0SYtwi5RDaIi5QnTmz9HfPbdNTI4S1HJTdYBC+9ORoP0r5KH0TItqxMwqJ7Jq+S/SlE/UCSEMU40Px2SFgHPU8Bo0nUjBuU4HWoocsomhfLUoVJam9prqxvtYp+lBYzdpsdFORezVsN3+r7ZZvj/FghR7qdvE7QXlDouNeg+OFG0f25XY0VUL0uhOJ8x0hZCbCIXF1ZtJ/OF2hRKER+r4n0I7WzNbnaCS4I7Uc4AKSDIPHg6M98kmB97lcc0odInIkYKxEwrhR93aCoEQqvyuP+kw5j1y38Q/5/LiJY/63X7aJHuDaE96FZ+XhU6ZmbjKOZRWocJ9kp//w1ddIu5wMn7gudfGSbqIWS24NBeRHPB8GV+liCvYzn+PmBICF6gV/XHuKS8DQQtsFOFL6r/pEqxs11SiXACYGIQEPg2SKuu+GREdEw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66476007)(31686004)(26005)(3480700007)(53546011)(4326008)(2906002)(36756003)(2616005)(52116002)(6486002)(186003)(31696002)(508600001)(5660300002)(8936002)(38350700002)(38100700002)(83380400001)(54906003)(66556008)(6506007)(6512007)(316002)(110136005)(86362001)(786003)(66946007)(44832011)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnZLZmdaNWppMWs0RUpKa0dyeU1xRHFDZW9zZDFBbDVPbXhTY2ZPN2QzZEJY?=
 =?utf-8?B?VzJ6QkxoL1VwQjJhQjhRL2VWd2sxZHA5R3JZL0t2YjBzbHo3NnBLMFRwd3JT?=
 =?utf-8?B?bHM5RVJiU0xEMHBnVENQRG45Vkc1ekxLdzk4bDJBYzhxYlJpSnRYT0hHQVVO?=
 =?utf-8?B?RzkwMzdBeERPV1A1TjNrbDRKS1d5UWJ0RXdUTlJWeG1SUUovaW8ycHdSRG4z?=
 =?utf-8?B?dVQzcHRFZzdHTmsxdHc2QU4yOXVFaFNhc0ZTbmYxNDU3dVNzMFNHby9Ldm84?=
 =?utf-8?B?M1NaaEtaUXN6ODZWOWQzTjBqMTA5ZFVjdnJEZ1JDbE1PMjFmUUJwUnRkbW02?=
 =?utf-8?B?MkZZM2N1Q0k5TDhER1dyWXZJVmZzUngyKzhLSDY3MWJML2MreExOVi9tVldn?=
 =?utf-8?B?aXVQZUM0ZzhydjRYcHV3Q0hhcGdJY1pSS1BHY0RUY1BzVHRZQTBSMHo5SWI4?=
 =?utf-8?B?bU1EcGxZV1g5cUMzZXYrVzVUYU1SMUluMytwYW4vNldQVFExOEM3aWZGNDg3?=
 =?utf-8?B?cEk5Yy8zWjlzK2VucGV4WWVqaC9wK0RJMUtza01hY05kUzZOZGZ3d0VHdDN5?=
 =?utf-8?B?c01jZ2k0cGx4TDJDTUVBcVpRbHBvYzRpMnhXaFNMVW9yUU96dThhMEdGWHBT?=
 =?utf-8?B?eFROdVdWOVhmMFRqdi8xV3UvREZucGVQTitKbGRkM0pLcVhTdFpJa1UwUUZ0?=
 =?utf-8?B?Wm5Xc0lLOWlDMk84MEpZK2JjQTdPZyt5MmFkeXRQdUtOL1dadFBFbnF6clZK?=
 =?utf-8?B?M09lK2pQMHloanVUeDdzbS9qUk94c1c2dzBGQlRBd05IOGNFcm5kSVFYelow?=
 =?utf-8?B?elZLcnkzVFlFb3doalMyc1FEYmRQbGVHRENEUzUxckxaWHY5UFZPNTE5S0dq?=
 =?utf-8?B?NkdXN3JKUmRnNUJ3cHZtakZ5d2l6algydXdLZ2VVTTArV2FDdFdVU1F3Vjkv?=
 =?utf-8?B?d0N2MDA1UWdma21CRkFLdnFIbjI3L3R1QzUwVjRZYVIrbGp6aEZkSnJYUDlP?=
 =?utf-8?B?dUZPWUE2L2c3dXh1ZUF3YklUZ2pHbE5FRDdPV3AvSCtmM1k2VUJqMTZuaTdN?=
 =?utf-8?B?VUU5Q0JPS1BEdmVqSGpyTlhoNWRDOGpmMHZST2xQMDMzU1B0RmhTV0UzRkUw?=
 =?utf-8?B?dVVBZlpCeDJIQmNMcmRkSVFTdjhuMitJd0dHakF3dGNWbWVBbXdiaHdMUUdE?=
 =?utf-8?B?VDNmSEd3cHFnUytCb2lQc0F2bGpLQzhDdHpTdjN4MDY1MTJhNGw4bUkzRktZ?=
 =?utf-8?B?ejhTTHI5ZmVtdWlpNk8wMEtVb1I4MGd4YzNSbzBPelFwTFdYN0N6RXRQdlJt?=
 =?utf-8?B?Nnd1OXRWbnQyeTVnUStteDBUYnVTNWpmVUVkV0dqTG1pUk5CN0NFUkNIbnFn?=
 =?utf-8?B?dUd4V20rY2NuTmRzN3ZvaG1wd0Y3Q0ZXVkJBbkNpNDRXalNwd2M1OW5za1BB?=
 =?utf-8?B?cHUxWjRNRWI4YU5HejloZUxwSHEra3pIdmZWNXJQWlNwT0NaRXE0dkhjVlpO?=
 =?utf-8?B?emtsRUl5Ui9iNENRdFhSUER2UU5wV1lxdGlTY0luQjlPWTM2ZGNHTWRTUlg3?=
 =?utf-8?B?MlYva3VaYytJZStDdCtOcEkvamVQUEtsRjIycHE3VzhBUEdCV2ExL25PNzhx?=
 =?utf-8?B?eCtqc2FZTFlBK1liVHJFRUNyMUJQcS9YRkRwUTR3Q1ZnazVQMjRkczRIMjcw?=
 =?utf-8?B?c3ZRNzB3MG90ZmU5THUxZmlaMjJKR056d2FxclF4NDQrb0hYNElPU2lXUTI3?=
 =?utf-8?B?OU5qRURYazBPNCtGYmd2eDg0NTZiRGh5bTZsc1B5b1c4SFFucGhsT1NPZ2px?=
 =?utf-8?B?Yno3M09vOGVheFRmSlVrKytXY0MvWEp0M2NxZ1JUUVJLTlJDNE5ZRzJrSHRW?=
 =?utf-8?B?RE1vS0d2aWxpODY4RHR1Z0REWVVzZzhMN21YKy9iYVV1aDhGL0ozWW8vSlly?=
 =?utf-8?B?WEgxdGhjNzE3R0wrWTBLQlJUSHNNSHBYR09yMDRBSmlaOWMzbG8wSzI5N3Nm?=
 =?utf-8?B?WTJGUEFxWUlDZStwVkRQbzMyc050Q0YyUDRYYmVXb0dwdFJPdVZlZXNya3pC?=
 =?utf-8?B?MnpqbWJIbUt5TjRDM1hyVFh0eWRXdXA3ZW51azcxR0tXWlZ4RTdaUisvMTFB?=
 =?utf-8?B?KzVab2dKZXp4UFF5SDZEZGlnVVlOYnBpWGhKNS9LN1RTTEU3VDRzQ3VMTUpq?=
 =?utf-8?B?TFZZVVVPZkowTFRWajV5djhySlBHY1hQVTErUUswMXpTdFBBUkx2eXNiM3k0?=
 =?utf-8?B?U3psOTVhYUZaaVVxdWFHSEFjelNkRUExV1BjRDdmS2dvblVPRCtXNS8wUHNt?=
 =?utf-8?B?a3IzVGVVWGJUalMyNW5INkdWcTFIaXROam10bGkzbVprdDVBVStBZz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0d083d-d6a0-4c8c-485c-08d9fdd60b96
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 11:56:41.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPhOrrZzV0lfOs6W902T652uRqf09UVRTNCEErxNMlVZsPJr79Ng4O3jzQsBTN1qmc/VjXLKrfowk9lgBh3L0IjfbpumGfRq8tHMneS4voX7+nVOe+2/I/3nTyrfBKTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5454

On 3/3/2022 7:08 PM, Jason Andryuk wrote:
> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>
>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>> Hi all,
>>>>
>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>
>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>
>>>> name    = "guest0"
>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>> memory  = 1024 vcpus   = 2
>>>> driver_domain = 1
>>>>
>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>> While the second guest has been started with the following cfg:
>>>>
>>>> name    = "guest1"
>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>> memory  = 1024 vcpus   = 2
>>>> vcpus   = 2
>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>
>>>> Follows the result of strace xl devd:
>>>>
>>>> # strace xl devd
>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> 
>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>> write(2, "error: ", 7error: )                  = 7
>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>> write(2, "\n", 1
>>>> )                       = 1
>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> 
> xl devd is daemonizing, but strace is only following the first
> process.  Use `strace xl devd -F` to prevent the daemonizing (or
> `strace -f xl devd` to follow children).

Sorry, I have not read this part.

# strace xl devd -F
execve("/usr/sbin/xl", ["xl", "devd", "-F"], 0xffffc53b6e50 /* 13 vars 
*/) = 0
brk(NULL)                               = 0xaaab058a0000
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such 
file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=7840, ...}) = 0
mmap(NULL, 7840, PROT_READ, MAP_PRIVATE, 3, 0) = 0xffff833c7000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxlutil.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0200\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=68168, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff833c5000
mmap(NULL, 131784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83379000
mprotect(0xffff83388000, 65536, PROT_NONE) = 0
mmap(0xffff83398000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff83398000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenlight.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\16\2\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=861848, ...}) = 0
mmap(NULL, 925752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83296000
mprotect(0xffff83363000, 61440, PROT_NONE) = 0
mmap(0xffff83372000, 24576, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xcc000) = 0xffff83372000
mmap(0xffff83378000, 56, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff83378000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxentoollog.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0P\r\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=10368, ...}) = 0
mmap(NULL, 73904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83283000
mprotect(0xffff83285000, 61440, PROT_NONE) = 0
mmap(0xffff83294000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff83294000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libyajl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\22\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=38728, ...}) = 0
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83269000
mprotect(0xffff83272000, 61440, PROT_NONE) = 0
mmap(0xffff83281000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff83281000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300j\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=113184, ...}) = 0
mmap(NULL, 192872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83239000
mprotect(0xffff83253000, 65536, PROT_NONE) = 0
mmap(0xffff83263000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a000) = 0xffff83263000
mmap(0xffff83265000, 12648, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff83265000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320I\2\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1428872, ...}) = 0
mmap(NULL, 1502000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0xffff830ca000
mprotect(0xffff83221000, 61440, PROT_NONE) = 0
mmap(0xffff83230000, 24576, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x156000) = 0xffff83230000
mmap(0xffff83236000, 11056, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff83236000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenevtchn.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\f\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=10240, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff833c3000
mmap(NULL, 73856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff830b7000
mprotect(0xffff830b9000, 61440, PROT_NONE) = 0
mmap(0xffff830c8000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff830c8000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenctrl.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\203\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=154752, ...}) = 0
mmap(NULL, 218504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83081000
mprotect(0xffff830a6000, 61440, PROT_NONE) = 0
mmap(0xffff830b5000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff830b5000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenguest.so.4.14", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0PB\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=77248, ...}) = 0
mmap(NULL, 140880, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff8305e000
mprotect(0xffff83070000, 61440, PROT_NONE) = 0
mmap(0xffff8307f000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0xffff8307f000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenhypfs.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300\16\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14432, ...}) = 0
mmap(NULL, 78048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff8304a000
mprotect(0xffff8304c000, 65536, PROT_NONE) = 0
mmap(0xffff8305c000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff8305c000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenstore.so.3.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 
$\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=31176, ...}) = 0
mmap(NULL, 107088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff8302f000
mprotect(0xffff83035000, 65536, PROT_NONE) = 0
mmap(0xffff83045000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff83045000
mmap(0xffff83047000, 8784, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff83047000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\20\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
mmap(NULL, 77920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff8301b000
mprotect(0xffff8301e000, 61440, PROT_NONE) = 0
mmap(0xffff8302d000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff8302d000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxentoolcore.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 
\10\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=6104, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff833c1000
mmap(NULL, 69768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff83009000
mprotect(0xffff8300a000, 61440, PROT_NONE) = 0
mmap(0xffff83019000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xffff83019000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\21\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
mmap(NULL, 77840, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82ff5000
mprotect(0xffff82ff7000, 65536, PROT_NONE) = 0
mmap(0xffff83007000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff83007000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\30\0\0\0\0\0\0"..., 832) 
= 832
fstat(3, {st_mode=S_IFREG|0755, st_size=30680, ...}) = 0
mmap(NULL, 94240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82fdd000
mprotect(0xffff82fe3000, 65536, PROT_NONE) = 0
mmap(0xffff82ff3000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff82ff3000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libnl-route-3.so.200", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\200\327\1\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=536688, ...}) = 0
mmap(NULL, 609024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82f48000
mprotect(0xffff82fc3000, 65536, PROT_NONE) = 0
mmap(0xffff82fd3000, 32768, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7b000) = 0xffff82fd3000
mmap(0xffff82fdb000, 6912, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff82fdb000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libnl-3.so.200", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360\221\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=141304, ...}) = 0
mmap(NULL, 205192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82f15000
mprotect(0xffff82f36000, 61440, PROT_NONE) = 0
mmap(0xffff82f45000, 12288, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x20000) = 0xffff82f45000
close(3)                                = 0
openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0#\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=31032, ...}) = 0
mmap(NULL, 94568, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82efd000
mprotect(0xffff82f04000, 61440, PROT_NONE) = 0
mmap(0xffff82f13000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff82f13000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libfdt.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000#\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=38800, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff833bf000
mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82ee3000
mprotect(0xffff82eec000, 61440, PROT_NONE) = 0
mmap(0xffff82efb000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff82efb000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxengnttab.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\20\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14368, ...}) = 0
mmap(NULL, 77984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82ecf000
mprotect(0xffff82ed2000, 61440, PROT_NONE) = 0
mmap(0xffff82ee1000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff82ee1000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxencall.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\17\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
mmap(NULL, 78064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82ebb000
mprotect(0xffff82ebe000, 61440, PROT_NONE) = 0
mmap(0xffff82ecd000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff82ecd000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxenforeignmemory.so.1", 
O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\16\0\0\0\0\0\0"..., 832) 
= 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14392, ...}) = 0
mmap(NULL, 78000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82ea7000
mprotect(0xffff82ea9000, 65536, PROT_NONE) = 0
mmap(0xffff82eb9000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff82eb9000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libxendevicemodel.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\23\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
mmap(NULL, 78008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82e93000
mprotect(0xffff82e96000, 61440, PROT_NONE) = 0
mmap(0xffff82ea5000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff82ea5000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libbz2.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\27\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=70472, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff833bd000
mmap(NULL, 134160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82e72000
mprotect(0xffff82e82000, 61440, PROT_NONE) = 0
mmap(0xffff82e91000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff82e91000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/liblzma.so.5", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\3403\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=153496, ...}) = 0
mmap(NULL, 217104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82e3c000
mprotect(0xffff82e60000, 65536, PROT_NONE) = 0
mmap(0xffff82e70000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff82e70000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/liblzo2.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320&\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=120648, ...}) = 0
mmap(NULL, 184336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82e0e000
mprotect(0xffff82e2b000, 61440, PROT_NONE) = 0
mmap(0xffff82e3a000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c000) = 0xffff82e3a000
close(3)                                = 0
openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, 
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360%\0\0\0\0\0\0"..., 
832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=92056, ...}) = 0
mmap(NULL, 155664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0xffff82de7000
mprotect(0xffff82dfc000, 65536, PROT_NONE) = 0
mmap(0xffff82e0c000, 8192, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x15000) = 0xffff82e0c000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff82de5000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) 
= 0xffff82de3000
mprotect(0xffff83230000, 12288, PROT_READ) = 0
mprotect(0xffff82e0c000, 4096, PROT_READ) = 0
mprotect(0xffff82e3a000, 4096, PROT_READ) = 0
mprotect(0xffff83263000, 4096, PROT_READ) = 0
mprotect(0xffff82e70000, 4096, PROT_READ) = 0
mprotect(0xffff82e91000, 4096, PROT_READ) = 0
mprotect(0xffff83294000, 4096, PROT_READ) = 0
mprotect(0xffff83019000, 4096, PROT_READ) = 0
mprotect(0xffff82ecd000, 4096, PROT_READ) = 0
mprotect(0xffff82ea5000, 4096, PROT_READ) = 0
mprotect(0xffff82eb9000, 4096, PROT_READ) = 0
mprotect(0xffff82ee1000, 4096, PROT_READ) = 0
mprotect(0xffff82efb000, 4096, PROT_READ) = 0
mprotect(0xffff82f13000, 4096, PROT_READ) = 0
mprotect(0xffff82f45000, 8192, PROT_READ) = 0
mprotect(0xffff82fd3000, 16384, PROT_READ) = 0
mprotect(0xffff82ff3000, 4096, PROT_READ) = 0
mprotect(0xffff83007000, 4096, PROT_READ) = 0
mprotect(0xffff8302d000, 4096, PROT_READ) = 0
mprotect(0xffff83045000, 4096, PROT_READ) = 0
mprotect(0xffff8305c000, 4096, PROT_READ) = 0
mprotect(0xffff830c8000, 4096, PROT_READ) = 0
mprotect(0xffff830b5000, 4096, PROT_READ) = 0
mprotect(0xffff8307f000, 4096, PROT_READ) = 0
mprotect(0xffff83281000, 4096, PROT_READ) = 0
mprotect(0xffff83372000, 8192, PROT_READ) = 0
mprotect(0xffff83398000, 4096, PROT_READ) = 0
mprotect(0xaaaac7570000, 4096, PROT_READ) = 0
mprotect(0xffff833cc000, 4096, PROT_READ) = 0
munmap(0xffff833c7000, 7840)            = 0
set_tid_address(0xffff82de30e0)         = 767
set_robust_list(0xffff82de30f0, 24)     = 0
rt_sigaction(SIGRTMIN, {sa_handler=0xffff8323f570, sa_mask=[], 
sa_flags=SA_SIGINFO}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {sa_handler=0xffff8323f630, sa_mask=[], 
sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, 
rlim_max=RLIM64_INFINITY}) = 0
brk(NULL)                               = 0xaaab058a0000
brk(0xaaab058c1000)                     = 0xaaab058c1000
newfstatat(AT_FDCWD, "/etc/libnl/classid", {st_mode=S_IFREG|0644, 
st_size=1130, ...}, 0) = 0
openat(AT_FDCWD, "/etc/libnl/classid", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=1130, ...}) = 0
read(3, "################################"..., 4096) = 1130
read(3, "", 4096)                       = 0
close(3)                                = 0
ioctl(2, TCGETS, 0xffffdf6a4f18)        = -1 ENOTTY (Inappropriate ioctl 
for device)
pipe2([3, 4], 0)                        = 0
fcntl(3, F_GETFL)                       = 0 (flags O_RDONLY)
fcntl(3, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
fcntl(4, F_GETFL)                       = 0x1 (flags O_WRONLY)
fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  = 0
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 5
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 6
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 7
ioctl(7, _IOC(_IOC_NONE, 0x50, 0xff, 0), 0) = -1 ENOTTY (Inappropriate 
ioctl for device)
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 8
openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 9
openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 10
ioctl(10, _IOC(_IOC_NONE, 0x50, 0x5, 0x10), 0xffffdf6a4aa0) = 0
newfstatat(AT_FDCWD, "/var/run/xenstored/socket", 0xffffdf6a4ed0, 0) = 
-1 ENOENT (No such file or directory)
faccessat(AT_FDCWD, "/dev/xen/xenbus", F_OK) = 0
newfstatat(AT_FDCWD, "/dev/xen/xenbus", {st_mode=S_IFCHR|0600, 
st_rdev=makedev(0xa, 0x3e), ...}, 0) = 0
openat(AT_FDCWD, "/dev/xen/xenbus", O_RDWR) = 11
openat(AT_FDCWD, "/etc/xen/xl.conf", O_RDONLY) = 12
fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
read(12, "## Global XL config file ##\n\n# S"..., 4096) = 1602
close(12)                               = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 262158
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) = 0xffff833c8000
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 4096
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4b00) = 0
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4ad0) = -1 EPERM 
(Operation not permitted)
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4df0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4df0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffdf6a4df0) = -1 EPERM 
(Operation not permitted)
write(2, "libxl: ", 7libxl: )                  = 7
write(2, "error: ", 7error: )                  = 7
write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 
87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the 
maximum number of cpus) = 87
write(2, "\n", 1
)                       = 1
pipe2([12, 13], 0)                      = 0
fcntl(12, F_GETFL)                      = 0 (flags O_RDONLY)
fcntl(12, F_SETFL, O_RDONLY|O_NONBLOCK) = 0
fcntl(13, F_GETFL)                      = 0x1 (flags O_WRONLY)
fcntl(13, F_SETFL, O_WRONLY|O_NONBLOCK) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\2\0\0\0\0\0\0\0\0\0\0\0\6\0\0\0", 16) = 16
write(11, "domid\0", 6)                 = 6
read(11, "\2\0\0\0\0\0\0\0\0\0\0\0\1\0\0\0", 16) = 16
read(11, "1", 1)                        = 1
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
pipe2([14, 15], 0)                      = 0
futex(0xffff8302e048, FUTEX_WAKE_PRIVATE, 2147483647) = 0
rt_sigprocmask(SIG_SETMASK, ~[RTMIN RT_1], [], 8) = 0
mmap(NULL, 141168, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 
0) = 0xffff82dc0000
mprotect(0xffff82dc1000, 137072, PROT_READ|PROT_WRITE) = 0
rt_sigprocmask(SIG_BLOCK, ~[], ~[KILL STOP RTMIN RT_1], 8) = 0
clone(child_stack=0xffff82de10e0, 
flags=CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM|CLONE_SETTLS|CLONE_PARENT_SETTID|CLONE_CHILD_CLEARTID, 
parent_tid=[768], tls=0xffff82de2000, child_tidptr=0xffff82de1940) = 768
rt_sigprocmask(SIG_SETMASK, ~[KILL STOP RTMIN RT_1], NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\4\0\0\0\0\0\0\0\0\0\0\0\34\0\0\0", 16) = 16
write(11, "/local/domain/1/backend\0", 24) = 24
write(11, "3/0\0", 4)                   = 4
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=0}, 
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(11, "\1\0\0\0\0\0\0\0\0\0\0\0\30\0\0\0", 16) = 16
write(11, "/local/domain/1/backend\0", 24) = 24
futex(0xaaab058a13b8, FUTEX_WAIT_PRIVATE, 0, NULL) = 0
futex(0xaaab058a1360, FUTEX_WAKE_PRIVATE, 1) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 
NULL, 8) = 0
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0) = 1 ([{fd=14, revents=POLLIN}])
ppoll([{fd=14, events=POLLIN}], 1, {tv_sec=0, tv_nsec=0}, NULL, 0) = 1 
([{fd=14, revents=POLLIN}], left {tv_sec=0, tv_nsec=0})
read(14, "/", 1)                        = 1
ppoll([{fd=14, events=POLLIN}, {fd=12, events=POLLIN}], 2, NULL, NULL, 
0strace: Process 767 detached
  <detached ...>

>>>> close(6)                                = 0
>>>> close(5)                                = 0
>>>> munmap(0xffff9f45f000, 4096)            = 0
>>>> close(7)                                = 0
>>>> close(10)                               = 0
>>>> close(9)                                = 0
>>>> close(8)                                = 0
>>>> close(11)                               = 0
>>>> close(3)                                = 0
>>>> close(4)                                = 0
>>>> exit_group(0)                           = ?
>>>> +++ exited with 0 +++
>>>>
>>>> royger told me that it is a BUG and not an issue with my setup. Therefore here I am.
>>
>> Just a bit more context: AFAICT the calls to libxl_cpu_bitmap_alloc in
>> parse_global_config will prevent xl from being usable on anything
>> different than the control domain (due to sysctl only available to
>> privileged domains). This is an issue for 'xl devd', as it won't
>> start anymore.
> 
> These look non-fatal at first glance?
> 
> Regards,
> Jason

Andrea

