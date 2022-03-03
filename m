Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C334CC21A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:01:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283495.482539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPntP-0002oB-Rf; Thu, 03 Mar 2022 16:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283495.482539; Thu, 03 Mar 2022 16:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPntP-0002mI-Mx; Thu, 03 Mar 2022 16:01:27 +0000
Received: by outflank-mailman (input) for mailman id 283495;
 Thu, 03 Mar 2022 16:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOOP=TO=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nPntN-0002kL-Hx
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:01:26 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c43c77a-9b0b-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:01:23 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by AM9PR03MB7962.eurprd03.prod.outlook.com (2603:10a6:20b:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 16:01:21 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 16:01:21 +0000
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
X-Inumbo-ID: 2c43c77a-9b0b-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFJBA9Cdq33bdC6BdrqPNr42SyrrSA/5nYM9bhhqUmzyq5JYgL8PIHai6rEQ6PwZmjUTgDkMmxx3yEdNieXAy1o8nY/zMQiqFNDKE2IemA2PDnWIb8enraYQPYqRsaP77d3clesbYLIw96dwQ7aCoqMp9AyQ3THSvUZQLI0xfyXqTJ5jcAi0ZLObVBvzOvG7enjAP891r9ZlZJxA/AwXFUrmBd2jnoxoUampjL5UP+OOjqDYunj35RMJgQ/JVDirI7svOXSdiETe9K/iyXfHMour4qsmbB+KnyoWGgKdCrEsAM8AwRbydkpk4ThWc0Zma0SISuMBWVH5/oEvNyxNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JGpx62JPtQ9DYy9P5hgnvckWiXrXf0XqjWaJlNcsnhU=;
 b=eNH2ExUzA4i2ZuqULq/+QA+JIInEk+vY/GvWs2cuv27nc40/N+RNdKtqSD2dIif3tShezA2gvsaewKf6M28F2xXgmj5muYpFBpswGJUKBOqVCVqTh4YZw9rphfPUk/oi74aLXsOlSLSZ/8LuDYK+xhVCvcbQ5lV7fKi9opiX0fZarLFtUjPc1rr3GHHZDelkoepxp1fTpY9cW5EsucEwm7upcbbxr6n4acoY8Dmoa/0/2cThcIyOs2bIS2qLDgD0kE1PsyCJJ9RqphA5JB57489+vlRgFk1+OVKQZFhMuBD5G4yj7rw6PvZYahnKfpUsD+VlKur7OL/H8OBL9xmanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGpx62JPtQ9DYy9P5hgnvckWiXrXf0XqjWaJlNcsnhU=;
 b=FYlFzIwWQhKGLiOmsU7HG7QR/ZLzcJAKy/L/goEm9nqYfBTYs7zBr+EgQEiYsXfUoVi+M16/sC4lUFUZwHI1QZnxHTFy+uAgMzi9AwuSjSTuRpi6M1OI3mb8x9fspfQeq0lvo84VGKPsKZtNo4ar5ldAzJPlJVUiPdD8KSSQxRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
Date: Thu, 3 Mar 2022 17:01:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Network driver domain broken
Content-Language: en-US
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "roger.pau@citrix.com" <roger.pau@citrix.com>, "wl@xen.org" <wl@xen.org>,
 anthony.perard@citrix.com
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
In-Reply-To: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::31) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a67fbd2-2ecd-4eef-8f6c-08d9fd2f0f3a
X-MS-TrafficTypeDiagnostic: AM9PR03MB7962:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR03MB7962F2608CBCD16D41DDF62598049@AM9PR03MB7962.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PJm/qUIPxJrIVC3zKmgN5SWCUbXxEkCNUzBNdeX8Riln4kal2ZMOjNpr6gD+db+LVy/xj3eqid7oam0ARiS9eEF5rlXJlUuWZRA4kNO4Ba/e/rdba5C12dbfgjK1rtdNmbanS0P/SZDpLuMA5HXgDr1TD7SKCIGnx50NAST7gV3Xy7PyRW4NlKMlKJx45A7y5UwVSZKq7RA+0yru6ZgqEPoyZn/Mla22PmADSet+1t72+tYHfSlpwsi78y6k7Denmyzs41xX6xZ0BVWrjmd2U1OQAdJH40HjP+2vafuKy4jntVPDVqGkRQyukMbtN1vFhdYiOOKI2j2vNrXsbim6UTbcOJQeqAsmv+eynsQSfiIcrcGzbVguGsLq3Ybdl5s+hMScLLmVyvA59GVvotSnwVfKQ5mdD8C9/WifFeZCWYbXX+cm2RW1vfptNFp+ftC28o8K70n1zOrrhinXvxZuFyzag2dXrSgPobp9UoL7aTxJ9YJg5x4wUft8Gg06rHgLoFsPECMQXnomoQX5U38FNIjzXcrAckF5CGrLfG9tedoXtEmx3zsUIX57kARQdB7SOu2bxDoeRLMq1iyhVQdVyhLWS7WpUytUT87Uzz5f5MMTy3rKizW2ys5ZKa8tHh5BosWF3ymYN5Czb9moSQbpDyiaLzMO6RQmLwNdMiUiINh7kMXQbSFheg7N2l47VHnYAjbu8Teh9rM9ExiG2dbjYwcq1lGt/MD/mpwJpjYlioh/o2JPdYPXM54OPVsDIopANFN8yZmZ0wcS6+kWPHiYIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(4326008)(8676002)(66556008)(66946007)(83380400001)(3480700007)(36756003)(31696002)(30864003)(53546011)(52116002)(2906002)(38350700002)(38100700002)(44832011)(8936002)(5660300002)(86362001)(26005)(186003)(31686004)(6506007)(6486002)(6512007)(786003)(316002)(6916009)(508600001)(54906003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGZwd1NYNktmazZBYTZzSXhjZUcyMzNERDBDSGczVHJpb3JHWVRvT0x6b21M?=
 =?utf-8?B?TGJrcVNoV3Q0SGtVZTV4dlpuMmxKNEsweWpxTkxzRC9vV3k2VkdWVVJoeGUr?=
 =?utf-8?B?TEhZV1lEemh1dERLS1ZyZkZ2dkZxbGIxSXNjL3JNRjhCWXV3Znc1Tm5zdGxI?=
 =?utf-8?B?M3RWdFBIT2JhQlNTNUw5dzI2cTBtQ1hFOVR2ZERMZG40djN2SlZ6QnduOWFm?=
 =?utf-8?B?aHMvT3F5ajNnRGZPNytjWFNPbzhwOFNMTVJVa2dENmVFOWxsbHpwN1NneFMv?=
 =?utf-8?B?SC9uREtGY1BTU2lpQVBld0hBenlET29DTjBsVVpKVS9NdTg3VDRIU2hIY2c1?=
 =?utf-8?B?aHBiL0hPV0wvdHIwNFUwZXNTYmxVL2xDRkM1SE84VXcwUU1mMlZ4d0NzYjBr?=
 =?utf-8?B?Y2RLQW96cmQ1eGpsTTU2Y3dYV09VZ0NwUVVlUDhZQ2FvSTFHc0REdGhDdmE4?=
 =?utf-8?B?YnJqVjV2aXdib2d4dU5LRWd6MXhGRTY4YXNuODN3dkJodjY1Nmh4NGhVMjRo?=
 =?utf-8?B?UWN3Wld1aVVmeC9BNXpNM3NvSXVQcTRaWE01bUJSNHJjOGhZa3dVYmU4UDk4?=
 =?utf-8?B?aU9qeDlxWUtJU3NIM1diNjJkWFpDSk1leVFFZDdaRlRqSFNnWmdWZHZuZ0No?=
 =?utf-8?B?T29aRk1xR3ROaktQVVYvYzFUZllxMVFFWm5sWUtMWFluOURFMmJsOHNReEN5?=
 =?utf-8?B?QnBIVGF0ZzdNRllBWldHSTVXbEp0NnRackV6Q1lhVE1PQWJOa0Q2a2xCaTdh?=
 =?utf-8?B?M2RVcVhZb2pkOVp1NVdHRXNrQWtHZkRMcnRVL1UzR2k0dkd1WkRBZCs0cFBP?=
 =?utf-8?B?QlUwcWdHRE81ejZ1bkdYcDFPdVhCMGt6VEdHbXM2amt5Rk5BNm9uRmhsb2RQ?=
 =?utf-8?B?RXJuN0hPTEZ3cnBTeXlaR3pXb2tJOFhOYlNSMDArTnlqYzVPQTFJUFFyNlg2?=
 =?utf-8?B?ODg3cUFZNURJcVNlWDVKNFJDTHMvalBUcUFOaXVZaitpc0UxZEhOREp4Rm9r?=
 =?utf-8?B?ajFvMHp4bE5DR1dTamg3SzFXcTFoYkpKbnhsbzRjRjVrSURzbTlheXJrNzVF?=
 =?utf-8?B?V243dHg3UGZNcHNXR2VDT0dERGtLYjk3WTlTdnM3enBVU01zemxpY1c0S0U3?=
 =?utf-8?B?UXdkWkN6aFVidEo5MEZ0MjBRdlJYZjROVlpsSWRFVTRHOHVnMHNMeEJoMWhE?=
 =?utf-8?B?cGZ3NUZTVmt1VHRnNklxaGFWRU5WQ3RncFN4ejgwbFZSWFAvNnpiNUNpSnhs?=
 =?utf-8?B?WFZsckVPS3pOaXI5MEhnZjN2RG5PSkY5SlBQRjZpNnlFOERndnZwV2R6Z3RG?=
 =?utf-8?B?SUpmbURZZ21IelB1VHN4OCsvTXdPQW8vMFM0cDVGWGx1ZXpEdC9IVGRZa0hL?=
 =?utf-8?B?YzJiQlFLWXgxUW1iTE9LSXNsc3V2NG5iT2FqSVA1TkZGL3ErT2QzOHBMZ1I0?=
 =?utf-8?B?SndxNkJ5NkZUai8vQXAzZ3dlM21tWFhWMjEwOGJRdDBBV2VYRGo4RFlPUDBX?=
 =?utf-8?B?RmRYUTRWNnpKTFlWOHVKVDJ6NmJvUHlQVUtNQytUUUJYejg5T2ZqNDdCR2FM?=
 =?utf-8?B?OWFCOG4yWDRyTEplR3Z1RUJSMXBhNjdTSW0vamh5OXFVdjNlMEwwR3JtcGIr?=
 =?utf-8?B?dzY1RWs1NWY4KzhUSmwzZzY4eSt2TkxBcFBLUm84UEJ1OEtuL3J4ZHZQb01S?=
 =?utf-8?B?SFBnYkwvTU05RFFrYkZMNzMrYzd4U2kwQmJyUERoZk9PMUtLbGxXcUNHTWxP?=
 =?utf-8?B?RTFvSjdGOVJUeCtGRzNpQmpWUHZKdjlqbWsyb000M2p3LzhhUHcwanRBUDdt?=
 =?utf-8?B?Z1ZrQkRYU2JGYS85aTROTFZNSm1rZytINHBLcnVKcjFuUjRNSytGbkcwQkpQ?=
 =?utf-8?B?Sll6MnE2dHJqbEFuMWRWa2c0Mi8wZGdOTVlreHhab2FMZFd5V2Zwc29MTlBi?=
 =?utf-8?B?d3Rub3Z3bGJsZFh1OVE3MHAxOHVvMUo5OGdiT1V6aFBoVkdMVHRIZjY2NDd3?=
 =?utf-8?B?Q2JPeVloV1k4TUZBNmR3YTBEK1hMLzRvUE9ydHRBc3Z6YUFxTjg2SS9UMWxZ?=
 =?utf-8?B?cmNHYmtySnlpUHBpaHdpVHNDb2xUUFVLRUxIOEh4QW1CVFJ3elBsd2xQdVYr?=
 =?utf-8?B?U1o3RGl6b2FWRXZkL3FYdXBDZS8xaWNKQUFkVnRCQ0pIZ05KRkc3SGRRZWd6?=
 =?utf-8?B?SDVNMi85b01aYzlKc1dMeXoybmM3YllQRzNueUFMZzFqOWFWUEwxWEo4SE9G?=
 =?utf-8?B?OHUzaURNNFlXejdZQ3dYakxnUXpUZHVPQnE4UThVSmV3TUtYT0E4M2cwOGZT?=
 =?utf-8?B?YWlkWlJVYmtjUEc3TG11aDJxcTVoV3JZVWZsUXZaM1VFWG5zYjNTZz09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a67fbd2-2ecd-4eef-8f6c-08d9fd2f0f3a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:01:21.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xjh5YPUN8hLJQluwaPLwxK0ec8qGUKYOhyh3KDBV40JE+HerzRmZ/yYo4DCLjK9FfBwH64GAz/XovUqpquYg2bdgbht0cSZFMeQhn1sy84QGVKUrcyrUplvf/MdG1PZs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7962

On 03/03/2022 15:54, Andrea Stevanato wrote:
> Hi all,
> 
> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
> 
> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
> 
> name    = "guest0"
> kernel  = "/media/sd-mmcblk0p1/Image"
> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> memory  = 1024 
> vcpus   = 2
> driver_domain = 1
> 
> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
> While the second guest has been started with the following cfg:
> 
> name    = "guest1"
> kernel  = "/media/sd-mmcblk0p1/Image"
> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
> memory  = 1024 vcpus   = 2
> vcpus   = 2
> vif = [ 'bridge=xenbr0, backend=guest0' ]
> 
> Follows the result of strace xl devd:
> 
> # strace xl devd
> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
> brk(NULL)                               = 0xaaaaeaf3b000
> faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=7840, ...}) = 0
> mmap(NULL, 7840, PROT_READ, MAP_PRIVATE, 3, 0) = 0xffff9f45e000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxlutil.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0200\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=68168, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f45c000
> mmap(NULL, 131784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f410000
> mprotect(0xffff9f41f000, 65536, PROT_NONE) = 0
> mmap(0xffff9f42f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff9f42f000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenlight.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\16\2\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=861848, ...}) = 0
> mmap(NULL, 925752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f32d000
> mprotect(0xffff9f3fa000, 61440, PROT_NONE) = 0
> mmap(0xffff9f409000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xcc000) = 0xffff9f409000
> mmap(0xffff9f40f000, 56, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f40f000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxentoollog.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0P\r\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=10368, ...}) = 0
> mmap(NULL, 73904, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f31a000
> mprotect(0xffff9f31c000, 61440, PROT_NONE) = 0
> mmap(0xffff9f32b000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff9f32b000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libyajl.so.2", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\22\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=38728, ...}) = 0
> mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f300000
> mprotect(0xffff9f309000, 61440, PROT_NONE) = 0
> mmap(0xffff9f318000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff9f318000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300j\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=113184, ...}) = 0
> mmap(NULL, 192872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f2d0000
> mprotect(0xffff9f2ea000, 65536, PROT_NONE) = 0
> mmap(0xffff9f2fa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a000) = 0xffff9f2fa000
> mmap(0xffff9f2fc000, 12648, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f2fc000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320I\2\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=1428872, ...}) = 0
> mmap(NULL, 1502000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f161000
> mprotect(0xffff9f2b8000, 61440, PROT_NONE) = 0
> mmap(0xffff9f2c7000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x156000) = 0xffff9f2c7000
> mmap(0xffff9f2cd000, 11056, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f2cd000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenevtchn.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\f\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=10240, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f45a000
> mmap(NULL, 73856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f14e000
> mprotect(0xffff9f150000, 61440, PROT_NONE) = 0
> mmap(0xffff9f15f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) = 0xffff9f15f000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenctrl.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\203\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=154752, ...}) = 0
> mmap(NULL, 218504, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f118000
> mprotect(0xffff9f13d000, 61440, PROT_NONE) = 0
> mmap(0xffff9f14c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff9f14c000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenguest.so.4.14", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0PB\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=77248, ...}) = 0
> mmap(NULL, 140880, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0f5000
> mprotect(0xffff9f107000, 61440, PROT_NONE) = 0
> mmap(0xffff9f116000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0xffff9f116000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenhypfs.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\300\16\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14432, ...}) = 0
> mmap(NULL, 78048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0e1000
> mprotect(0xffff9f0e3000, 65536, PROT_NONE) = 0
> mmap(0xffff9f0f3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f0f3000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenstore.so.3.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 $\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=31176, ...}) = 0
> mmap(NULL, 107088, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0c6000
> mprotect(0xffff9f0cc000, 65536, PROT_NONE) = 0
> mmap(0xffff9f0dc000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9f0dc000
> mmap(0xffff9f0de000, 8784, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f0de000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0@\20\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
> mmap(NULL, 77920, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0b2000
> mprotect(0xffff9f0b5000, 61440, PROT_NONE) = 0
> mmap(0xffff9f0c4000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f0c4000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxentoolcore.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0 \10\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=6104, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f458000
> mmap(NULL, 69768, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f0a0000
> mprotect(0xffff9f0a1000, 61440, PROT_NONE) = 0
> mmap(0xffff9f0b0000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) = 0xffff9f0b0000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\21\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14296, ...}) = 0
> mmap(NULL, 77840, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f08c000
> mprotect(0xffff9f08e000, 65536, PROT_NONE) = 0
> mmap(0xffff9f09e000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9f09e000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libuuid.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\30\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=30680, ...}) = 0
> mmap(NULL, 94240, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9f074000
> mprotect(0xffff9f07a000, 65536, PROT_NONE) = 0
> mmap(0xffff9f08a000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9f08a000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libnl-route-3.so.200", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\200\327\1\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=536688, ...}) = 0
> mmap(NULL, 609024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9efdf000
> mprotect(0xffff9f05a000, 65536, PROT_NONE) = 0
> mmap(0xffff9f06a000, 32768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7b000) = 0xffff9f06a000
> mmap(0xffff9f072000, 6912, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffff9f072000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libnl-3.so.200", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360\221\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=141304, ...}) = 0
> mmap(NULL, 205192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9efac000
> mprotect(0xffff9efcd000, 61440, PROT_NONE) = 0
> mmap(0xffff9efdc000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x20000) = 0xffff9efdc000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/librt.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\0#\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=31032, ...}) = 0
> mmap(NULL, 94568, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef94000
> mprotect(0xffff9ef9b000, 61440, PROT_NONE) = 0
> mmap(0xffff9efaa000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffff9efaa000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libfdt.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000#\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=38800, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f456000
> mmap(NULL, 102416, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef7a000
> mprotect(0xffff9ef83000, 61440, PROT_NONE) = 0
> mmap(0xffff9ef92000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xffff9ef92000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxengnttab.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\20\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14368, ...}) = 0
> mmap(NULL, 77984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef66000
> mprotect(0xffff9ef69000, 61440, PROT_NONE) = 0
> mmap(0xffff9ef78000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef78000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxencall.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\17\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
> mmap(NULL, 78064, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef52000
> mprotect(0xffff9ef55000, 61440, PROT_NONE) = 0
> mmap(0xffff9ef64000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef64000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxenforeignmemory.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0000\16\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14392, ...}) = 0
> mmap(NULL, 78000, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef3e000
> mprotect(0xffff9ef40000, 65536, PROT_NONE) = 0
> mmap(0xffff9ef50000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef50000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libxendevicemodel.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0`\23\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=14400, ...}) = 0
> mmap(NULL, 78008, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef2a000
> mprotect(0xffff9ef2d000, 61440, PROT_NONE) = 0
> mmap(0xffff9ef3c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0xffff9ef3c000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/libbz2.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320\27\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=70472, ...}) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9f454000
> mmap(NULL, 134160, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ef09000
> mprotect(0xffff9ef19000, 61440, PROT_NONE) = 0
> mmap(0xffff9ef28000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0xffff9ef28000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/liblzma.so.5", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\3403\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=153496, ...}) = 0
> mmap(NULL, 217104, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9eed3000
> mprotect(0xffff9eef7000, 65536, PROT_NONE) = 0
> mmap(0xffff9ef07000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x24000) = 0xffff9ef07000
> close(3)                                = 0
> openat(AT_FDCWD, "/usr/lib/liblzo2.so.2", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\320&\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=120648, ...}) = 0
> mmap(NULL, 184336, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9eea5000
> mprotect(0xffff9eec2000, 61440, PROT_NONE) = 0
> mmap(0xffff9eed1000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c000) = 0xffff9eed1000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0\267\0\1\0\0\0\360%\0\0\0\0\0\0"..., 832) = 832
> fstat(3, {st_mode=S_IFREG|0755, st_size=92056, ...}) = 0
> mmap(NULL, 155664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xffff9ee7e000
> mprotect(0xffff9ee93000, 65536, PROT_NONE) = 0
> mmap(0xffff9eea3000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x15000) = 0xffff9eea3000
> close(3)                                = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9ee7c000
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0xffff9ee7a000
> mprotect(0xffff9f2c7000, 12288, PROT_READ) = 0
> mprotect(0xffff9eea3000, 4096, PROT_READ) = 0
> mprotect(0xffff9eed1000, 4096, PROT_READ) = 0
> mprotect(0xffff9f2fa000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef07000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef28000, 4096, PROT_READ) = 0
> mprotect(0xffff9f32b000, 4096, PROT_READ) = 0
> mprotect(0xffff9f0b0000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef64000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef3c000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef50000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef78000, 4096, PROT_READ) = 0
> mprotect(0xffff9ef92000, 4096, PROT_READ) = 0
> mprotect(0xffff9efaa000, 4096, PROT_READ) = 0
> mprotect(0xffff9efdc000, 8192, PROT_READ) = 0
> mprotect(0xffff9f06a000, 16384, PROT_READ) = 0
> mprotect(0xffff9f08a000, 4096, PROT_READ) = 0
> mprotect(0xffff9f09e000, 4096, PROT_READ) = 0
> mprotect(0xffff9f0c4000, 4096, PROT_READ) = 0
> mprotect(0xffff9f0dc000, 4096, PROT_READ) = 0
> mprotect(0xffff9f0f3000, 4096, PROT_READ) = 0
> mprotect(0xffff9f15f000, 4096, PROT_READ) = 0
> mprotect(0xffff9f14c000, 4096, PROT_READ) = 0
> mprotect(0xffff9f116000, 4096, PROT_READ) = 0
> mprotect(0xffff9f318000, 4096, PROT_READ) = 0
> mprotect(0xffff9f409000, 8192, PROT_READ) = 0
> mprotect(0xffff9f42f000, 4096, PROT_READ) = 0
> mprotect(0xaaaabaa10000, 4096, PROT_READ) = 0
> mprotect(0xffff9f463000, 4096, PROT_READ) = 0
> munmap(0xffff9f45e000, 7840)            = 0
> set_tid_address(0xffff9ee7a0e0)         = 813
> set_robust_list(0xffff9ee7a0f0, 24)     = 0
> rt_sigaction(SIGRTMIN, {sa_handler=0xffff9f2d6570, sa_mask=[], sa_flags=SA_SIGINFO}, NULL, 8) = 0
> rt_sigaction(SIGRT_1, {sa_handler=0xffff9f2d6630, sa_mask=[], sa_flags=SA_RESTART|SA_SIGINFO}, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
> prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0
> brk(NULL)                               = 0xaaaaeaf3b000
> brk(0xaaaaeaf5c000)                     = 0xaaaaeaf5c000
> newfstatat(AT_FDCWD, "/etc/libnl/classid", {st_mode=S_IFREG|0644, st_size=1130, ...}, 0) = 0
> openat(AT_FDCWD, "/etc/libnl/classid", O_RDONLY|O_CLOEXEC) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=1130, ...}) = 0
> read(3, "################################"..., 4096) = 1130
> read(3, "", 4096)                       = 0
> close(3)                                = 0
> ioctl(2, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> pipe2([3, 4], 0)                        = 0
> fcntl(3, F_GETFL)                       = 0 (flags O_RDONLY)
> fcntl(3, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
> fcntl(4, F_GETFL)                       = 0x1 (flags O_WRONLY)
> fcntl(4, F_SETFL, O_WRONLY|O_NONBLOCK)  = 0
> openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 5
> openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 6
> openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 7
> ioctl(7, _IOC(_IOC_NONE, 0x50, 0xff, 0), 0) = -1 ENOTTY (Inappropriate ioctl for device)
> openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 8
> openat(AT_FDCWD, "/dev/xen/hypercall", O_RDWR|O_CLOEXEC) = 9
> openat(AT_FDCWD, "/dev/xen/privcmd", O_RDWR|O_CLOEXEC) = 10
> ioctl(10, _IOC(_IOC_NONE, 0x50, 0x5, 0x10), 0xffffe6e417f0) = 0
> newfstatat(AT_FDCWD, "/var/run/xenstored/socket", {st_mode=S_IFSOCK|0600, st_size=0, ...}, 0) = 0
> socket(AF_UNIX, SOCK_STREAM, 0)         = 11
> fcntl(11, F_GETFD)                      = 0
> fcntl(11, F_SETFD, FD_CLOEXEC)          = 0
> connect(11, {sa_family=AF_UNIX, sun_path="/var/run/xenstored/socket"}, 110) = -1 ECONNREFUSED (Connection refused)
> close(11)                               = 0
> faccessat(AT_FDCWD, "/dev/xen/xenbus", F_OK) = 0
> newfstatat(AT_FDCWD, "/dev/xen/xenbus", {st_mode=S_IFCHR|0600, st_rdev=makedev(0xa, 0x3e), ...}, 0) = 0
> openat(AT_FDCWD, "/dev/xen/xenbus", O_RDWR) = 11
> openat(AT_FDCWD, "/etc/xen/xl.conf", O_RDONLY) = 12
> fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
> fstat(12, {st_mode=S_IFREG|0644, st_size=1602, ...}) = 0
> read(12, "## Global XL config file ##\n\n# S"..., 4096) = 1602
> close(12)                               = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 262158
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_SHARED, 6, 0) = 0xffff9f45f000
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 4096
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41850) = 0
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41820) = -1 EPERM (Operation not permitted)
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> write(2, "libxl: ", 7libxl: )                  = 7
> write(2, "error: ", 7error: )                  = 7
> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> write(2, "\n", 1
> )                       = 1
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> write(2, "libxl: ", 7libxl: )                  = 7
> write(2, "error: ", 7error: )                  = 7
> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> write(2, "\n", 1
> )                       = 1
> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
> write(2, "libxl: ", 7libxl: )                  = 7
> write(2, "error: ", 7error: )                  = 7
> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
> write(2, "\n", 1
> )                       = 1
> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
> close(6)                                = 0
> close(5)                                = 0
> munmap(0xffff9f45f000, 4096)            = 0
> close(7)                                = 0
> close(10)                               = 0
> close(9)                                = 0
> close(8)                                = 0
> close(11)                               = 0
> close(3)                                = 0
> close(4)                                = 0
> exit_group(0)                           = ?
> +++ exited with 0 +++
> 
> royger told me that it is a BUG and not an issue with my setup. Therefore here I am.
> 
> Cheers,
> Andrea

