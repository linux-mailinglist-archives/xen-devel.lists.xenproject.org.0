Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E57203AE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 15:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543141.847840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q556n-0001al-4c; Fri, 02 Jun 2023 13:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543141.847840; Fri, 02 Jun 2023 13:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q556n-0001YP-1t; Fri, 02 Jun 2023 13:46:25 +0000
Received: by outflank-mailman (input) for mailman id 543141;
 Fri, 02 Jun 2023 13:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q556l-0001YH-Vw
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 13:46:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9b8561d-014b-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 15:46:19 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 13:46:14 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 13:46:14 +0000
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
X-Inumbo-ID: d9b8561d-014b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLVOc8WsxwXUj5s8swZ/8qsAOtPmm8LPvq61QVyl1tS3i4772xaa9A31flv8PDW0ulcIMpquNakOSNc4XG+y++1B96sfy10dS/g2LIEJlyPW1zciggqbxShOu+46vu5njhBXKUyHzohToG8uqfYP7/uYLaoXuZmP/MkM20RpAVvisWz4lR4md881v+oF1QM93QD+gVXgp4DMPLL8SNel+FE5b0wTQ68GTkusE0L07Y7LUeFuC2F6epTxlfmoLOdoi1Q746I6gwliDQqUPmEzVEnJrka+85jLgV8W9BSJDAm8JQG8/zAS82pIUUwTMyleWc6QBTue6FUKMoh1f93H6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwTBRRWElJcjYpxYd/4C1t2KQj6DTc8lMKGMLSts4sg=;
 b=kN5setEYl4jRDIjqxLJUM0qSwUOjygotOg/jTZLQdsMWEpv7pphC9c2YGLM1cYtxn7CZa7g1aC79RZfN9MR7xY78gb2BxUp9FPH0iSwbAi3haVVPKo64OH7Sv2yjz3ZojU3l8TmX1WmmTjoJ9F9vyah7OuOwWEMvLgoJuzMD38AwnEjSdoAh7GtlaeFDlqSA5rl8v4vVOtz1HyonpdjEEuWFyIHqJ5oIYaEwvWICy1uoDyGpWJE7+x+lGsV323nTQ1TQ+FXMAoRPEqAnFa0s3IlXHkKeQq0fZ1Mcdd8UZgPOumTz92CrYea6XZXvr5IB2z9Vq5De96nxWvSYCYtsoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwTBRRWElJcjYpxYd/4C1t2KQj6DTc8lMKGMLSts4sg=;
 b=LWihhnOoO4BHxhCc+qZrj8gd4J/sDMSJHzDjx4XoFp2ZTZWbuJckqDvXq9AYf/jb64bIITcOENMSedJ5Ywvs3HzYLmDe113IFZcyYU+P4gVVGHDB6SYnTbx8/cXtH60kbgjKlLzWXpd3P6IvY71ZMbDNLzNLShwirK9RjhFffSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9079757e-72e3-3a68-5e78-9130822003e9@amd.com>
Date: Fri, 2 Jun 2023 14:46:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: Listing the tools required for Xen development/testing on x86 and
 Arm by the community
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
 christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
 Stewart Hildebrand <stewart@stew.dk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
 dfaggioli@suse.com, elena.ufimtseva@oracle.com, anthony.perard@citrix.com,
 george.dunlap@citrix.com, rosbrookn@gmail.com, lukasz@hawrylko.pl,
 dpsmith@apertussolutions.com, mateusz.mowka@intel.com, kevin.tian@intel.com,
 jun.nakajima@intel.com, paul@xen.org, Wei Liu <wl@xen.org>,
 konrad.wilk@oracle.com, ross.lagerwall@citrix.com,
 samuel.thibault@ens-lyon.org, christian.lindig@citrix.com,
 mengxu@cis.upenn.edu, tamas@tklengyel.com, aisaila@bitdefender.com,
 ppircalabu@bitdefender.com,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>, Xenia.Ragiadakou@amd.com,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
 <ZHnV2lhkU1EkrQ68@Air-de-Roger>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ZHnV2lhkU1EkrQ68@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a343743-ceb7-484b-436f-08db636fbb57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sd7qn7rH0v77/7TDQ37HMLRHF0ZREbKo5h/vqRw5wmY7jZ86ihjZvy2JumS8xcx8gd+oQF0idrwLzG7/23xwcGqLHmInpdmICjjBRrzbX9SDsAaQ9a1Z4MlfsGRv4LQD4aVF3oqspvc14M+y4RftsvaLOAFnZj0b4fgFnNETCgazMryBtXD5P4Ywjf2TzTqr+Ye7R/WyPIpR6ee46TzWUIsLJKSVHYH3T8mxGKUIXuHqscnlKINRz2bwCmZjhSHuMDbjRnBDcwfkSEbWppcF0+Pgpscwpo+Vux6qnYHHI0z93TvOoVJmVLPdtLTaYlt17XQqBupYlRDqeXR7+ZvSV0RnbU8kW2IxnW9O+KSN1yJbnviuAJG8UVcU93iLqoaai+ZhIPAwUK03sUEmHVuz3wYrmnumzcdG2dKueP2jXsMS5aVDyHMlvwvBLrJY6EkEQAo0YI7I/j77seR/IBScAAln8mxTa7cGYp4gdawb+zG5soslYK6ry6hIuzuZesGyCqUWxkW+VlFrS5lDwkJCgioi4UeKa4zugbKMyL59ccMIfw2HwudsGaw8tjX+DD0wAT5GV3dD8yR4v2pO0XlWS8wzINYDwdvBPr51MRabCOFswR9aO5A1ChdStIGwrDD1S+yj3ESdZfahypynpiFX8ZpbdcoKjmSIrCwMy++sk83j0EIBS7FnNECtuvYzkcxJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(39860400002)(346002)(451199021)(6506007)(53546011)(6512007)(31686004)(31696002)(186003)(66946007)(66556008)(66476007)(6916009)(4326008)(7416002)(7406005)(2616005)(5660300002)(8936002)(8676002)(478600001)(83380400001)(2906002)(6486002)(38100700002)(54906003)(966005)(316002)(41300700001)(6666004)(26005)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFBUYVpJSDUrRE54N2I3RFpWL1lVSzZkTWZlL2tBKzhIdWJTbXdZUlpOTU5B?=
 =?utf-8?B?VlZPYVU4VXZva0ltS3g2TnNqWklxRzJFK2ZHL3grZEtZRVFGN3lSeXhTMVp2?=
 =?utf-8?B?Q0FhdEN0dy9xb3VuUnpITExkbjhOWVZ5aHBhYy9uNGE0MzdROUlUd2t6NHcy?=
 =?utf-8?B?SjdMRDIzR0hnY0dpeVBLYTVma1BBYVo2bk5aQmV5SE9ScS9XUVBaZU9xYnA5?=
 =?utf-8?B?Nk5UcU4ybGpOejNxbklnaktZSFZjRERnMkkzN3BmMm5tY1FMcDV0NEVKV0w2?=
 =?utf-8?B?VklROVhTRmJRZUJucVZaU0NGNVFGZ1JBemtRVkdaR3FCQ3NuR1NabWNVcDFv?=
 =?utf-8?B?VGFNekpZdHhhRjBRZE9ZdldBMmhMSkRraWhLWitmTjF2S0lYbWowbWNnL2FI?=
 =?utf-8?B?QjlzY0dXcFI4VFRkNXV4YWdIMTVwaGlQRGlZMVZoQitWaTN5cHp0MmxzalJP?=
 =?utf-8?B?dWtZUVhIbzFNaElVVVhLcGkyRmJYU2tIajZ1U0VOOGdHMnk3bVFSTDJybVRJ?=
 =?utf-8?B?OFJxU0ZIeEt3M0w4bEMra2VpbTFGblpMYU9zU1gxYml4VCszN0dzZWZUQ0dI?=
 =?utf-8?B?RGRTZTBaMytub1YzUkU3MnBsTjZKL25nOUs3TDcwSzloaENUREVDVjh0M0U1?=
 =?utf-8?B?ckxDZzd5WUg4cjBhM0Z5cVVoZFVoWTVqNzJZZ1dUTkpLRXIwL0J3UXFacXMx?=
 =?utf-8?B?bngxaW1MeU9FeTZPSkFUWWRVbGgrS1plUTdIU0NTU0xZdXZudlNKenc2UGxk?=
 =?utf-8?B?NVlVZW96ejcwSVV0Wm8vcTZjNi9RTjFERHFPZ2ZsRlpHUUR3N0Zhdm9ZekFm?=
 =?utf-8?B?NUY1ZWdhTUZZYVh1WlZUMUFtT3VndDZYeVFVYytieFVPeGVpZWhjTzkrOTBq?=
 =?utf-8?B?TU1oa0FMb20zeWQ3UFVJU0Rma2xZWGtienRaMVhOdGRFY3ZETUNKb01FNkN6?=
 =?utf-8?B?SlVRNWd3MkJxMnZ6WkZDeklRdWk1U2czbVFHaFMyYzNIZmRoeXJqQzNEbGNZ?=
 =?utf-8?B?MTdsNGVuRHpvUS9FNUhOTjd1S0NKT2VYYlpINFhmb0YzVXY0UUptVTBvYmRD?=
 =?utf-8?B?Rk5sVisxckg2WjdTbTV3YVJtamVrdGMvSGlVRWVXT0ZEZEV0aHZKWjJ2Y1ls?=
 =?utf-8?B?TzU3cjV0M1ppYmFIWkJxL0haYzFoZ1NDLy9SSTkzOWl1a1UzM3ZDVTVzeU1V?=
 =?utf-8?B?YVlsd2I3eFRQRXV2dGtKYk5NUW5uVG15OGhxRTVWcjBkL1ZXNG9oanpNK2JW?=
 =?utf-8?B?eDZ5WjBNV2VOSjBGaDRiaFVoUE03SldZREx0MUxJa0ljeGFDUTBCb3d5MnR6?=
 =?utf-8?B?REUya1BqNE1rWDRaaFE3MGdBektXalJEb0hMSWRyNmRWSGRjTG5jclZBZzcw?=
 =?utf-8?B?YlBoS2ZxM3BLZXQyaG9nSkczUlBqcks2anRkRjdwWUlvQzRrWWxTOS94cktV?=
 =?utf-8?B?TGx4eTlGcksxM2RmcjhBV3VxSHlOdmNKL1dtKzJJSnk0ZUVzL3VRcGwzend6?=
 =?utf-8?B?NnVnYm5uZEhsWFZseE5GM2tyUkw1L2lSMmw1YmdZQmVERVhEb3FiaDR5TzF3?=
 =?utf-8?B?V2JEdTh4WmFhWlM3WUg2S3lqbm5kejFJREJ6Y0Rla2NBODVLNDhINWJPZGxj?=
 =?utf-8?B?RkhLVnFNZHhwN1R2RWpWQVVvdjJFREZOUlppTng5bEh5YjRndEJlaDU0TVRw?=
 =?utf-8?B?NDM5QThrNFkzM2NubFZQaE5nNnNMYTY3TnVUai9MakhIUFhibVM3d2hyT1VR?=
 =?utf-8?B?czlSbVJ1dzZuOURKVStKL1duMWpxemYwcXlBc3F6NVlVc2NxMlBRbm1VeUpN?=
 =?utf-8?B?TnRmUi9Nanp2dnBMRU9DTDBXeGx5NEQvTmUxak4yQXNFUnJKdVBBd1RwS2dw?=
 =?utf-8?B?Z3M5VkVMNDJzZ3A5RGxnMitsUnkzOEduQ1pza09IQ2hncitiTlphN1cvY1I1?=
 =?utf-8?B?V09vaDhqWGgySkF5eEplZVhPYjJXZXNhOWlUUmhjTjZ2UjN4bUVPdlZSQ2FC?=
 =?utf-8?B?d0U1VGgrQ3hseFMwcnhUTE5JbElYUDhHU0d3REdLNXVZcGZ2RGVXY3p1emgv?=
 =?utf-8?B?S2FzVTk3bjR0MlhUaXk5QWVSUy8xM1Zvd2xzNE9GOXJmdVYraWtJZkRFWWtm?=
 =?utf-8?Q?BmYVsgmStXNYBGDoSMsDG5pbh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a343743-ceb7-484b-436f-08db636fbb57
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 13:46:14.1587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUg/s6My88q9lMMe4RctESDiuvNPkLZaBNSDrGPT0qHgpGfUcBFtzgFzALnyNuwXaWL+0LUsOMDOXsQR5rERAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

Hi Roger,

On 02/06/2023 12:43, Roger Pau Monné wrote:
> On Fri, Jun 02, 2023 at 09:48:48AM +0100, Ayan Kumar Halder wrote:
>> Hi Xen developers,
>>
>> We are trying to better document xen project development processes and
>> related tools. At present, we are targeting **x86 and Arm** only.
>>
>> These tools range from bug/change request tracking means, compilers, infra,
>> editors, code-review tools, etc which is connected in some way to the Xen
>> development and is being currently used by xen-devel community.
> What is the end goal of this?

We are trying to do an initial assesment of the requirements for Xen 
functional safety.

As a first step, I am trying to make a list tools which are in someways 
related to Xen development/testing/deployment.

>
> I'm kind of unsure why do you care about which editor I use to
> generate my code, that's up to the developer.

I agree that editor, email-clients are something that are an individual 
developer's choice.

However as it is related to Xen development, we want to atleast put down 
some of the commonly used tools.

At a later state when (and if) we go through the list with a safety 
assessor, we might prune some of these items.

>
>> I appreciate if you can let me know anything I missed or mistaken and the
>> version currently being used (for some of the tools).
>>
>>
>> 1. Code management portal - xenbits (https://xenbits.xenproject.org), gitlab
>> (https://gitlab.com/xen-project/xen)
>>
>> 2. Project description - wiki.xenproject.org
>>
>> 3. Project management - gitlab
>>
>> 4. Code review - text based email clients (mutt, thunderbird), git-email, b4
>>
>> 5. Text Editors such as vim, emacs
>>
>> 6. Code review history - xen-devel mail archives
>>
>> 7. Code revision management - git
>>
>> 8. Xen coding language - C89, C99, Kconfig
> assembly (gas), python, perl, shell, Makefile, bison, flex, ocaml,
> go...
>
> Likely more that I've missed.
Ack
>
>> 9. Testing tools for Arm64 in gitlab CI
>>
>> compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
>>
>> binutils - GNU Binutils for Debian) 2.38.9
>>
>> emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, poky
>> disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
>>
>> dom0/domU kernel - kernel-5.19.0
>>
>> rootfs - alpine-3.12-arm64-rootfs
>>
>> firmware - U-Boot 2022.10
>>
>> 10. Testing tools for Arm in gitlab CI
>>
>> compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, arm-linux-gnueabihf-gcc
>> (Debian 12.2.0-14) 12.2.0 (most commonly used versions)
>>
>> emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
>>
>> dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
>> Debian)
>>
>> rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
>>
>> firmware - U-Boot 2022.10
>>
>> 11. Testing tools for x86
>>
>> compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 12.2.0,
>> clang (from Debian) (most commonly used version)
>>
>> binutils - GNU ld (GNU Binutils for Debian) 2.40)
>>
>> emulator/hardware - Qubes HW (**need details regarding machine, firmware,
>> etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)
>>
>> dom0/domU kernel - kernel 6.1.19
>>
>> rootfs - alpine-3.12-rootfs
>>
>> firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by EDK
>> II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), GRUB
>> 2.06~rc1
> I do use an LLVM based toolstack, so that's usually latest LLVM import
> on FreeBSD.  We do also test this on the cirrus-ci, see:
>
> https://github.com/royger/xen/runs/5334480206

Thanks, this is interesting info.

For the moment, I am ignoring the downstream forks of Xen.

I am only considering the tools used by the upstream Xen and the 
associated CI/CD.

>
> I_n any case I think the scope to some of the questions is unknown,
> it's not feasible to expect to list every possible combination of
> Linux versions vs Xen version vs whatever guests versions a given
> developer might be running.

I agree . That is the reason I am picking up the compiler, linux, 
binutils, firmware, etc versions from our gitlab CI.

It also acts as a proof that we are testing Xen against a known set of 
compiler, linux versions, etc.

- Ayan

>
> Regards, Roger.

