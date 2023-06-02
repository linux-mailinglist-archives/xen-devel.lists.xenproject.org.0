Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977471FC81
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 10:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543004.847535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50T7-0006Sp-Ml; Fri, 02 Jun 2023 08:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543004.847535; Fri, 02 Jun 2023 08:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50T7-0006Pv-K1; Fri, 02 Jun 2023 08:49:09 +0000
Received: by outflank-mailman (input) for mailman id 543004;
 Fri, 02 Jun 2023 08:49:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q50T5-0006Pl-Un
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 08:49:08 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53b21215-0122-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 10:49:05 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 08:49:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 08:49:00 +0000
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
X-Inumbo-ID: 53b21215-0122-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY+BqSiJ+xBx1TJJ/feJheOB1KStZY/TcH7OUloMUb05yT0yl3OLF1A7MkCKngjWioXQBv7DCwCR6rkXVeEj3bpLG/6S8kIuq/qQoQjJkk03LDQaHPRvnmjzz1RIvNmZtMY1cNOtrqW3kEiGim8cO5HpYYxI4YKmkrkgJJDsR4KE6sniXaRIXHhcwO7uW5FSSnFubvIb79Ej6mXxQlF8vM54zAyLAvZH3nk+kf6bgv2gNpDJAjS3LzTuTmNLqiWZVL41XSWjeZqNk1NBMcFNbOiTue1AM0UT1/7DdCF5n2TOL+CazXEm1EkZQP4lRNEtO39POKydwe8vg2qtwbSfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DxF4x6maZ0+lFfy2d40jd0vG0I618b8vuBBVdhWFI4=;
 b=MeHd5gxGQvARVk58TPZbnwRnx+7iQRzmGPeDNnXt+6Y+99yXcbyxteCYOrW4Xx3PpIR5RZ1UZasG8QGTjRw21YHD3J4wSfppOGPKVg3bvkRwKa7H7Jm0ipZldzO2l0RseSSnCzuXjzu3X0A8cKnxKBtF40xeda3kfD6b4BG/ZxYZXzhULuar8YDPnl4V9V3IU14oZbcUaJDdxlYGC2j0Wqb7fjVL0XxAe99rP7B1rVdULsT/E/mDcDlGQU/ZGMYRzwUuOQYP/4OeCBKpFbbTW/4Bo5aIuvsPUrHORurmOeLRZ49e1+a893rlC65ITb5gdxNX9xIXbQRr1iQsyALC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DxF4x6maZ0+lFfy2d40jd0vG0I618b8vuBBVdhWFI4=;
 b=Nv/QEf8M5v5QikOB0znBUr6ru6z5z33rdXCc2nJ/8awPfLYhE1lRmdVlc9aRy9HGWhYZq6dS7C+ZZAYTRKFjU3Qn10UNdtrx9loL4VwqZf/OgolDAvH30pUSXO1m5aSZMxImPxjKBesdVwMXG5npUB0Y/FLniuM2XACmVZqhvJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
Date: Fri, 2 Jun 2023 09:48:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
From: Ayan Kumar Halder <ayankuma@amd.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com,
 christopher.w.clark@gmail.com, nathan.studer@dornerworks.com,
 Stewart Hildebrand <stewart@stew.dk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>,
 dfaggioli@suse.com, elena.ufimtseva@oracle.com,
 "<marmarek"@invisiblethingslab.com, anthony.perard@citrix.com,
 george.dunlap@citrix.com, rosbrookn@gmail.com, lukasz@hawrylko.pl,
 dpsmith@apertussolutions.com, mateusz.mowka@intel.com, kevin.tian@intel.com,
 jun.nakajima@intel.com, paul@xen.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, konrad.wilk@oracle.com,
 ross.lagerwall@citrix.com, samuel.thibault@ens-lyon.org, Wei Liu
 <wl@xen.org>, christian.lindig@citrix.com, dfaggioli@suse.com,
 mengxu@cis.upenn.edu, samuel.thibault@ens-lyon.org, tamas@tklengyel.com,
 aisaila@bitdefender.com, ppircalabu@bitdefender.com
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "Garhwal, Vikram" <vikram.garhwal@amd.com>, Xenia.Ragiadakou@amd.com,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Listing the tools required for Xen development/testing on x86 and Arm
 by the community
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: f07b210b-bdaf-4c4e-3ef7-08db6346355d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5D4C8LLoT811UKe2o+D6uS/a0BFhHitSCfTeukzPBb1spDidulD5TkulwfDgFdPpoUAV0HZtuDgcsubxjaZek79zJY+eA7pXRpv5B8Xwu5sm0YBh6zoJXjCzDaMHEy8WfXCX+XcD/8r6sirLuf6LlP6kyFYO2hi/LhTt/8yT8xjBMObqDYkK+09KKzgeGILhYKmnbr+CgivZljuZjr9J7nQtYnRPxHK7S2Zt7ijZNKkN2ASsD/l26WBUWuQDWtKgVs8TxZnWqw7JvUd9KcRXK4RxqGjAQURjBWvUbX1gB0chkCS7QsUIuQnMF126BT5IsBtGA5BkfIgHCVOI5CLiEPOyNRznGgKjZIOX4gWhQBAn0JcZ0yTzjUwDELOSmYZader+iKw0siK+E74SbStNThBhYTJMf7eA8UUTbcy+I3AxMrvP25I5AWpp7+k2wt2lsGojVSRg/zyyaVECl94u14XbEKfMLFmZC7ibK80uE59JVIMd3lO7InIPA/12hiHQnHw19avdR/q3LpHJTO6W3+9woktR2Zrn+C68bKTOPG9GKK+4a3PNcuju07SBv0SBUh1sOqH7qGJB6InH551f7zKYrEDWAhr7Q4K8xzpVko6KsZ0WPGVufEBU+KlW1zz1Z7Nfts/nOmON494nThTG5Wvx45XDXz7bfd/hA3jyy/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199021)(66556008)(66946007)(66476007)(31686004)(7406005)(7416002)(316002)(4326008)(41300700001)(110136005)(54906003)(5660300002)(8936002)(2906002)(8676002)(6486002)(478600001)(6666004)(921005)(6506007)(36756003)(186003)(6512007)(83380400001)(26005)(2616005)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmViZXBkM0daQnRDUjBiY040YllzZCtPYjRnOVF3ZlpkYmNScmh2NUFKUTBS?=
 =?utf-8?B?cjhDRHlqR2plNURQQXlpaklhVXY1TFdrYkZ5TXhBSzFnSGpNSkd5MkdQTGRY?=
 =?utf-8?B?QkxzaThsK1lycHcyc1VNSURka1J0OHdBSTdXRWhuYjcvc01nK2hlUnV4c0V2?=
 =?utf-8?B?aTRScWRwZnZoTGZuZTJncjdlUkZqVFhDb0Mvc1k1N3IyenlRK25hak5oT2tD?=
 =?utf-8?B?TGtWL1QzS2kzMy9GMVQ5V3VMRS95K0luaDJaS1pFaFhGZFhtWXVFUndoR05D?=
 =?utf-8?B?cWtuSXViOHNWSnppTmNSS3JPazdMcWJ5K0pGcXFjdUlEMHBvVStaWTAzK0Ft?=
 =?utf-8?B?NHluSXNDYjJyR2F4UkdHQWxaMWU4YndkR3gvMHV6bTlzckpMaGVNRnZUUDRx?=
 =?utf-8?B?a3FNVG4rekpXNWM1SCs1T2d4ZThXWXdrUmV3RHNOSzJ0cnRrUkF2Q2w3TDdS?=
 =?utf-8?B?U291WTl2NFU0SDhnSVlOTCtieVU1bTR5Q0hQUWRMMGR4d1o0cTVYTWFyZmVR?=
 =?utf-8?B?WEV5bGhUWFhsR044RzcwTWxlYlQxSU5PQTFkbWMrNW1HVDdVOHMwNXlVbEVh?=
 =?utf-8?B?ODhSZlZTclNWWkRsQmlUa2t4YkFiWVRjY1RXaGFmZlZoTkVXTzZiVGl6TmJN?=
 =?utf-8?B?bGdWeThaT09PQ3JReG5aT1NJeUlkdnF6bDNWNVpYTWc0MDhvN2k3Y3g0N01V?=
 =?utf-8?B?K2RQNWpWU0tvdjFnMklpL2NyQjl1a2pPQUdWdVVENXBCUGp0b0lXQjFDMzBQ?=
 =?utf-8?B?cXp5eCs2cjNWeHlWL2hSc1JMcDZGOGttbGdlLytCVC90T05PcSs2ejAxdEZo?=
 =?utf-8?B?Nys4elk3YTFLd1ZWa3FMbzhEQVpab0hnWjNldHVxV1hYRWg1VC9SeCtJWDls?=
 =?utf-8?B?bG5kNVU1SEt3VEFZWUVFUW0vdlc4RlNPd3JEL2NaalRPYlhHRnA2TU1DbFV1?=
 =?utf-8?B?RGJ0RjB6NmNFYjF4REVYNU9USFpXaTZmUWRkblVnTVlZaVdaeFZEemhxdGlO?=
 =?utf-8?B?VWl5L2oyY3FtUzZqSEdJZWJqd1FNUkxnVjQ2aUVBalhEZ0tQQmdKajdSbStJ?=
 =?utf-8?B?SXkycnhxOStqMi8zaWwzYlo0WGRrKzNVNWM2UjNNYjVwM1Nxd2hwTU5OLzlE?=
 =?utf-8?B?ZHo3Z09IbnlQbEVnZUlPNmJXdjlKNmY0K2lhT05uOXpCTFZoTGNwRldxOEFW?=
 =?utf-8?B?azNOZFRsMUhHR2trZ3pkVGppbEw3cy9jTmVITE1kQ09EdDN0bWpEYXhUb055?=
 =?utf-8?B?cEJzczFSbzQ2VVZEMUIwTm4zZGZvZjFxa3NzekxqeFVYaVEyR2JTRnNVaFBn?=
 =?utf-8?B?K1hsU2tGZFRySFJNRmFKL1laSWE1dzlXTDdYNUd0aXl6QTE5R3h3RS9zclUw?=
 =?utf-8?B?TjAvU1RITjFISzdrRDdwR0d4Y1RGbDJhQko4bSs0QzRVeUdWNkFUTDlXODQw?=
 =?utf-8?B?WVQwcjNKM1ZkVkF4ZFArK3V1eitkM3dManEwcmlET3JVL3pCeGVQL2FYV1Fs?=
 =?utf-8?B?SWFsVk9uQW5tWVpDMnRCRnV6TGxrV1p3OFZsb2k1c0xVUWwxOXdKTW9HLzZP?=
 =?utf-8?B?YWhxQ2taZzBmZlpjSFdwRVcyc3Z4TkpTZW5tc2RrbitoNE9jeWM5UXVTMU5r?=
 =?utf-8?B?WUtCYmtXaVRLamVVRER1MGtLS2pBVWVhKzk2aDcwTm5VaGJSczFmdnArbUdn?=
 =?utf-8?B?QVNwNWd1eVh4SUh2b0xtZlJtMkovdUVpbXlBZFVjMXZVWTZScFdrQ25CTzVn?=
 =?utf-8?B?enFZOUpVNm1aSHZrTTBaTUEzS1dTODYwYjBqZGplOXdpTGlldHU3OER0dkU0?=
 =?utf-8?B?MGZOS1k5cDBCdWtrckZrNGpNSzhxVktNakx0S0FNZWRzSWJEWjhIS3B5TG9Z?=
 =?utf-8?B?eGJ3MlRTQ3dzUWNUN1p5dERtUnZqQUQzMzQ2YU84ZXBaUkcvYUJkMFpuNE1B?=
 =?utf-8?B?ZXFHcTZDRkJ0YlQwaTI5OFdsWGthZlQxRVdQN29wTm9wNzU2b1hocTgvVEJD?=
 =?utf-8?B?TWdSb3VscDB1QXV1amFEdkQxN3FVT2VXVFBVMk1Bd0p3T1ZuWFpEM1E5SENm?=
 =?utf-8?B?Z08zSjVKQjdsVUMwdFpkNTk4QzdiMHFkMXFsRm4wUjVwQm5xNCtNNmx0SkxU?=
 =?utf-8?Q?uY2XhZwi+7fnMgriKPeDv9pRf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07b210b-bdaf-4c4e-3ef7-08db6346355d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 08:49:00.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kv4Z/vlN/15S3jupl1M8D9UzU43yslMSjeWo01DX1B9UYsa7jW71hipOyXtD3DafwCKLYyN0npWCWFecbj50Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870

Hi Xen developers,

We are trying to better document xen project development processes and 
related tools. At present, we are targeting **x86 and Arm** only.

These tools range from bug/change request tracking means, compilers, 
infra, editors, code-review tools, etc which is connected in some way to 
the Xen development and is being currently used by xen-devel community.

I appreciate if you can let me know anything I missed or mistaken and 
the version currently being used (for some of the tools).


1. Code management portal - xenbits (https://xenbits.xenproject.org), 
gitlab (https://gitlab.com/xen-project/xen)

2. Project description - wiki.xenproject.org

3. Project management - gitlab

4. Code review - text based email clients (mutt, thunderbird), git-email, b4

5. Text Editors such as vim, emacs

6. Code review history - xen-devel mail archives

7. Code revision management - git

8. Xen coding language - C89, C99, Kconfig

9. Testing tools for Arm64 in gitlab CI

compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)

binutils - GNU Binutils for Debian) 2.38.9

emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, 
poky disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)

dom0/domU kernel - kernel-5.19.0

rootfs - alpine-3.12-arm64-rootfs

firmware - U-Boot 2022.10

10. Testing tools for Arm in gitlab CI

compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, 
arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0 (most commonly used 
versions)

emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)

dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from 
Debian)

rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz

firmware - U-Boot 2022.10

11. Testing tools for x86

compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) 
12.2.0, clang (from Debian) (most commonly used version)

binutils - GNU ld (GNU Binutils for Debian) 2.40)

emulator/hardware - Qubes HW (**need details regarding machine, 
firmware, etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)

dom0/domU kernel - kernel 6.1.19

rootfs - alpine-3.12-rootfs

firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by 
EDK II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), 
GRUB 2.06~rc1

12. Debugger - gdb

13. Xen code building infra - make

14. Testing OS - CentOS 7, Ubuntu, OpenSuse, Arch Linux, Alpine 3.12.12, 
Debian 10 (Buster), Fedora

( **I could not get the version info for some of these ^^^**)

15. Testing Infra - Gitlab runner, Docker

16. Testing tools common to all architectures - All the host OS packages

dtc, build-essential, zlib1g-dev, libncurses5-dev, libssl-dev, 
python-dev, python3-dev, xorg-dev, uuid-dev, libyajl-dev, libaio-dev, 
libglib2.0-dev, libpixman-1-dev, pkg-config, flex, bison, gettext, 
acpica-tools, bin86, bcc, liblzma-dev, libc6-dev-i386, libnl-3-dev, 
ocaml-nox, libfindlib-ocaml-dev, markdown, transfig, pandoc, 
checkpolicy, wget, nasm, mkimage, uboot-tools

17. Documentation related tools - doxygen, rst.


Did I miss anything ?

Kind regards,

Ayan





