Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97C36CC09C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515821.799043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9J0-0001G3-Rc; Tue, 28 Mar 2023 13:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515821.799043; Tue, 28 Mar 2023 13:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph9J0-0001D5-O5; Tue, 28 Mar 2023 13:24:06 +0000
Received: by outflank-mailman (input) for mailman id 515821;
 Tue, 28 Mar 2023 13:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph9Iy-0000cB-JG
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:24:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cecb5a03-cd6b-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:24:03 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Tue, 28 Mar
 2023 13:24:00 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 13:23:58 +0000
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
X-Inumbo-ID: cecb5a03-cd6b-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE+/PYOltqNKq+ZsujQ4lPF7AiF0tWuYuv3PYTe4LYLpTlMtae9luL0WdvI5hqZMAo1inra6z30AkLN+F6C7m+qZr11Ned+ViQAAZ0k3ZHB4Ruuub4ft8fg0Y1lxiRR+An69j57qMCoqxsYCp8qYyA3lzJM7li8TiQ5fdII/+2F2S1p1tMK3sWH4iTw/zJRWTysFjsE4/6QUM7KV5/tKVijbMnv9xiNzplydd+hg0TXHgYKNjgbCOMnJxAEbJYNUIdrMCXAnvHdwp8lWG7KOHfQY7J1A8e6F7cU5vTKXJh5Q9prg0hnFFdBkmycBkErBEBa7mVies4owsGNtCfyHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3eCDX+fMVqcX6fxYVvXryVIz69Tn7v9A98zjONpfQg=;
 b=R3w9QjLf+L3YRbotemDN/G2/dtDdAMyXl9dHiiLr3yU76I9B/rB76kbLO+waHnJ/UJ4JRE4HhQcxsqi3xnh7clEkJL0lSHv8vtXI1BNYZb6zOHoICy3tn2t9/NNERuybZhFNEIpInnbWZLGKFUdwRdbcXVA5PEl4m+hryErMbGtyt+WJ0X7w5VDyQdC/OuKcyff5p6TyDH21wdv+XOtO55ykJ626Lxk5lTKD9h8UhxT2lQ51Tq7rrHeXoA9R9uS4olTmHJShmh4mlTpDeLjbA2X1i+OsGrwKjHBgCOtqBMz5jQiAW44/vUlzE7JitAjtkneAts9E4Zf2TxeW9kht5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3eCDX+fMVqcX6fxYVvXryVIz69Tn7v9A98zjONpfQg=;
 b=fO5MvQ2gYnRgEAfMEe8Jm6LgW2lU1XuOwy0dWCDJYn1L1j7Qtzo/7wgK2Sp0eHJOAOVhoWnLZE3xqqQbrM92TXfm51GGHHyy3IdENv9H/BhJRzQiGhGpWoE2vhE695PbNzpsfXQUsFq9WYUHV7VR4nuh60IpAcXVugo6W/UPVBKNyBNFVS/RQjfp3Ne3r+YP1CZcA9AkW1mVpIFzfJnL4tgy1hgxhg0Y6vY9L/WwaKDzSO5WIOXHCGnKNVdLtQvnhNc1CipFyvovAWSPohcSYyY/cZ2qfEkx6joH9dOfX+ECxfMCImpkMMb4KDhkkVEuN38kjhCZwmkJllqsgZChAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1b530e63-de12-f953-1fb5-4e3c3ea69fea@suse.com>
Date: Tue, 28 Mar 2023 15:23:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com> <ZCLl3ePLgrmFTViV@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCLl3ePLgrmFTViV@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd6dbb8-81c3-42e9-e27b-08db2f8fb005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KSrXfI5O53X2dxzA9Osdf3lvTlIHkh+ACUaytL9RAVOaIiPUjiJsvB1KNe8imNfN8AweCv+GVH6Eb0oxKQJVyRBDZ/JBl5pIx2dljVNokIQ63LcyE2QvPX4GpOV5zt0Kq51qI/df9sWI/1kr/8fwRVltxq9I54ZWa5C4UiTJhzYVVI7nmSyqKhsZBs4qqDGaCfg+UWqHy/pe/Q9q25i8r4JgA/d0+trwyRl8he26W/APPy9UWfvJjn90dF/KpkRFMJYKoC7No+YvnsGG+OK13TRSVnWFZeQfsLseM2zVylQJYfpjXLmKNv8g2x36T8bRnyXeF1Y846pjr8PcDlFBnzsOxnPTZ0G2x4hR+f5q3waTK294rmsYGEn/w2LdtyFwQBQ77npRt4ougZTAQY3ok/FGPrGRA3aphOPYpipUid4TYZKDaxdUu6+7ELqfJsV+Z6Se6+qAH/9RXpRCLmlgjkG5hCJqRwkIO0/ADzLznr4TJu1Y0rB3gb0RvTs7B9wkcQ5Xf1n9TMF+ba/ldRaHfKHBzNiUdcCFKmNp2O/rdcgIidl720tmAE/Sgi7pjFmanaVxmGOr7rESmVsnRyDNRf5DNexiW6LpLHct47vjQRyUi1AwsfZdtFQQAvKDXvY9nlecnfIkyugaAmWUtp/DWw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199021)(26005)(6512007)(6506007)(54906003)(6486002)(316002)(66574015)(4326008)(186003)(6916009)(8676002)(66476007)(53546011)(66556008)(66946007)(31686004)(478600001)(41300700001)(5660300002)(2906002)(38100700002)(83380400001)(36756003)(2616005)(31696002)(86362001)(8936002)(66899021)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3g3cGJLYmhpcVkvZVFnSHh3OXJobTFBN2ExeVY4UndwRnBNS054MVZpcXYx?=
 =?utf-8?B?MUFyZ1ZpWHBRdkJtTW5WdWhQczhSSTdBVldNaENVZXlPcTczQndETzdOUEgr?=
 =?utf-8?B?d2FOOE5UdzI4TThEc05raUVpbXpvbC9BZkloVS81aS85NGVRQUZ3dVVRTzN3?=
 =?utf-8?B?d25vUmNseUNhdFR4QUJVTXFQOTI3M1VvSHhRZURQa293YTd0MUYyU2VOdkxB?=
 =?utf-8?B?cjZOWTRpSmlBemNnMzU5M29WZUlpVTF4Vzl6bDljeHJ1aXdHMjBKRGM1ZkI5?=
 =?utf-8?B?Q3o5UDY5d1kzUVlvWVM0a0pxTitjZ0xZNzVLemZEWjE4TUozNFJrMDZ5VnVh?=
 =?utf-8?B?WHVjb0Z2UkNYV2pPeERsZkpxNkRxWEFOQjRRUE1KWk1CRytFczFkM2hjYkZW?=
 =?utf-8?B?dVBqNm9ydzVGbXJjU01HbUc2VTliZ0JkdEVUWEFPRFVQZUlCVzB4NVYzUWFO?=
 =?utf-8?B?K2pzS0JlKzl4SzVBdlo5Z1JONGZtc3MxL1l3aTVBNHFQdFNMY3dzek5PaGFS?=
 =?utf-8?B?NDl4TjJXcC9pUFRWeTA5eFhXYVZXd2JRazU3L0QxNXA3eHVyRDlQSVRETnNu?=
 =?utf-8?B?MGRsZ0dpNDFLemp0T2Fhb0NLSDE2REpURU1uWjF4SjlmeDVaY1c3RmhrV08z?=
 =?utf-8?B?RTkxK1FlemY3aXNpeHdvRmlwdDhsOURBWkh3R3FGY0puUFdDQ2F3a0lFR21N?=
 =?utf-8?B?ZDhqMmN3bUllblJwVVFGL3hJaTZMVGg3SXdBak9EWWNYM2Y1YnRMbW5QQ1VH?=
 =?utf-8?B?b25rNGsvTnZJVXAybnhSMU5ZTmNPdnFMdDBiQnJnNEd2azNZN3ludzMzOS9z?=
 =?utf-8?B?SUJPQVV6SDFFV29oMmFISXBRY0xKQlBnaWdUYWdLeDI1ZVgreTA4YStMcHFJ?=
 =?utf-8?B?bnZJZmNKYWY4b3c3Y2VPTlBUaldrejZyeGpVWXpGK0xtcUF0ZjRRaEhLYlli?=
 =?utf-8?B?Zm40UTRYQlNoeDh1SjNaYmlzbTNTcUYzWFZZQjRVUVBlSFpkckFVN0NGcXNu?=
 =?utf-8?B?eEVuZWpmTHVZOXZvYU9jQ3h2bk9ka1N1MnkycUhodW5UenB5TFR2TzVLZHIz?=
 =?utf-8?B?L1RjMDJjM2VjSm1VWlgzdE1aaUhCWEhZcDAzZ1lIMDVtU0VzdllxNVkvcGJj?=
 =?utf-8?B?OFJQUUJKQjR3K3pvZVIwZ2ZOKys4NHB1VUlLWHU2S3NxTGo1NkpDS3dIUnNs?=
 =?utf-8?B?ZEdYcTBkbnZCRHp1cDU3eXNHdzJ6SmxPWVBMUndiR0JzaFBlQUZrbFpwUnVJ?=
 =?utf-8?B?WU9zaXZXOEJ1WG9tKzIzY05rd0RRQkxaMURrWXYzMWxGdUtIZWlkVWQ0SWNS?=
 =?utf-8?B?b1F1TVB0cko4VUdXeHYwcUxvR205NU9QRWQ4VTRKZzQzeVZ3NlRubDM1V09K?=
 =?utf-8?B?WVJoL2FpKzZIM2tRZmJCT1IyTW9vaVY2eVlyNUZ1bm5PM2JhVUdUYWJpSGt3?=
 =?utf-8?B?N0FXT0VXcUt3Q3NLTmkzTkgwSm4vcjNoaTdBZmdtc3BBQjVXNzVpcTNROE9V?=
 =?utf-8?B?V1RGaUk3ckVPV3hKcm96SG5JUVcyUng2TlZ5NVlpaFZzVFpSTm8rTjdHRUdh?=
 =?utf-8?B?OUd1TjZEbFY0RmxheEdodnhjRkxIMXE3VEtwREJUazY4c2dSRWJlQURKa3ZT?=
 =?utf-8?B?OWpkYlhxUkE0MFlFR0oydjhOcm9GbHNnSzFCaXlnSVFKWTdqZkZSaFB2NjU2?=
 =?utf-8?B?akM4Z1ZSQ0NPc3lXMlI2b0MrQ2hHU0N3OXNXcnBiMDlNU1NRUEVZRFBjeDVZ?=
 =?utf-8?B?dmV4TU5idG9wdTByNnlhMFAzeGxzYkhCNUhOaVhWUXo4akJ4SWtkZ0ZiOUl1?=
 =?utf-8?B?em1veGVtdEhiUEhiRGFsa0ZvZjYyUVZmb0dKMmdCNDFidEg0NTJpQWFkTlda?=
 =?utf-8?B?YXVDa1N4OFNZVE9kbmd5cythSnlnLzl4L0l3alZGV0VtT0IwS0F6ZUpBYVBa?=
 =?utf-8?B?VDZub21GQlJndnd6TVJ3UmU3WEdTR1FpUGdRYk9WcXBxM2lDYUJzWHU5dHVZ?=
 =?utf-8?B?ajlhRFhMTmtrRVY3Y3FkdDE1VEtGRHpzTFY0T29XcEJ2Y25NcWY2ekIycGxH?=
 =?utf-8?B?RG1OZjVHQWlCenFkV0VQV3YzNTJ3clIvVjBUenkvM0dPOFlOSWJPMEdHL1J5?=
 =?utf-8?Q?qx947gQDuH7O2OUosemndGllF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd6dbb8-81c3-42e9-e27b-08db2f8fb005
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 13:23:58.4379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwJZ73U7kRkH/USgL5T1g5xDQlkiMZGNtCSaEdiWSM7g3zy/E76uq7UHJ4/tL/ff7onndf6u34SQOzzP1dSTCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

On 28.03.2023 15:04, Marek Marczykowski-Górecki wrote:
> On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
>> On 25.03.2023 03:49, Marek Marczykowski-Górecki wrote:
>>> Some firmware/devices are found to not reset MSI-X properly, leaving
>>> MASKALL set. Xen relies on initial state being both disabled.
>>> Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
>>> setting it due to msix->host_maskall or msix->guest_maskall. Clearing
>>> just MASKALL might be unsafe if ENABLE is set, so clear them both.
>>
>> But pci_reset_msix_state() comes into play only when assigning a device
>> to a DomU. If the tool stack doing a reset doesn't properly clear the
>> bit, how would it be cleared the next time round (i.e. after the guest
>> stopped and then possibly was started again)? It feels like the issue
>> wants dealing with elsewhere, possibly in the tool stack.
> 
> I may be misremembering some details, but AFAIR Xen intercepts
> toolstack's (or more generally: accesses from dom0) attempt to clean
> this up and once it enters an inconsistent state (or rather: starts with
> such at the start of the day), there was no way to clean it up.

Iirc Roger and you already discussed that there needs to be an
indication of device reset having happened, so that Xen can resync
from this "behind its back" operation. That would look to be the
point/place where such inconsistencies should be eliminated.

> I have considered changing pci_reset_msix_state() to not choke on
> MASKALL being set, but I'm a bit afraid of doing it, as there it seems
> there is a lot of assumptions all over the place and I may miss some.

Well, the comment there alone is enough justification to leave that
check as is, I would say. To drop it there, something equivalent
would likely want adding in its stead.

But you haven't really answered my earlier question: If reset leaves
MASKALL set, how would the same issue be taken care of the 2nd time
round? (If, otoh, firmware sets the bit for some reason, but reset
clears it along with ENABLE, I could see how a one-time action might
suffice. But the first sentence in the description doesn't make clear
which situation it is that we have to work around.)

Jan

