Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1BAE29BE
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 17:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021613.1397551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztF-0002mf-J4; Sat, 21 Jun 2025 15:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021613.1397551; Sat, 21 Jun 2025 15:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztF-0002jY-FZ; Sat, 21 Jun 2025 15:12:21 +0000
Received: by outflank-mailman (input) for mailman id 1021613;
 Sat, 21 Jun 2025 15:12:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSztD-0002Hn-PT
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 15:12:19 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f7344c5-4eb2-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 17:12:18 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 15:12:07 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 15:12:05 +0000
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
X-Inumbo-ID: 1f7344c5-4eb2-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icUGjXtiuEIQWDs7ZNQTRC6lj0pAS8KSXQCkYoJpRFURr+DdxMFVgc8Hw3uxNp28Ow2Q7CBsCUEctZ5L7VqU42CTC5Ox0FJwSwY93D6jbfWg0/Avy5ibbTG/P03VBusyFUzWzW57PeuwZ8vgqDXa+qljXXHzjo/sEYu0yuEeoSNjkfF+ZHca3l2mGXnfWZxmtdA8hd8+kv+T4WvB+g3hA7PQ/YFfimjpJa23RBBRVCgScULS5Ma70ARxwrbRiSlr3HA3f99tWxjIM4aFAvvxQJR1CVpqNRnM4CwuykoGnq13vfczvel55Qj6KMJdqzZpIiM4grUxBlXiEduAf6kqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MTRKS4LIBD1d3y/wd6/073T7aCD7eLmJnu+IO21Bv4=;
 b=V4JBInPtutYT1hH0Zh8F0UngZgK8MKOn+Ld2Ux3SFqV8X/lHqL8zyb1ps80bbfmwpYmLDrmUXxPaEzZqh/9e8moBi0rRaTcDMxrbJDPxT0KQjoj7KdWXNLlcMCRYrqczZYgopXOtjga0uplP1g2wG5qzUKrPzRWnJPL76hiWvNMecGJqtnyLE358AOs5uPxoghuA27q/a6aq2WAui+1h3Dzc2qGIGu+iwNUx+q7y0jRnbJBKhTJG3h63rXRmRc4IC1+KJDBz+io6zW0yDJu6+m2c8H+C82Kp3X6SPOenTR5POpjh/nqy09aAO8ppjNKHL6CnYA0I3OxH/HT19NKXTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MTRKS4LIBD1d3y/wd6/073T7aCD7eLmJnu+IO21Bv4=;
 b=e31T/2WIHtpVeVu5G4RwnqwsTfYuj+cSct5VYNJnWr3d9ORTGFhMDMlXsupEnAp9Xmw56m4rMWvpQ3aP5oSj+qmKEVVL5KvA+Fo/kdi+HFC9htzGhshPhuKwx3cYOti0LzWu3PTvUoP15w79OEe5jJkS7RupJPNdkgw5xbtUD0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 0/4] arm: Implement ARM DEN 0057A PV time interface
Date: Sun, 22 Jun 2025 00:11:57 +0900
Message-ID: <20250621151201.896719-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::8) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ef7678-0d11-4c3a-eaa2-08ddb0d5fbd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PLfFKqjtlNgzpIoK81PjBlkgF2a4nWrDvS17wGyIFOmp6tHHr2H9pYr5qTSL?=
 =?us-ascii?Q?qHA52GtVe1IlGLyl39vhc8FMnh45J/3jJ7PHMH1t2TxkqBETE1Jrkbin8NH5?=
 =?us-ascii?Q?fj85MxZN2wXC5+vYSpNATHEGfYmAHQwvOuKJshz0ZhcnrbXGJtGzi+oS7JkJ?=
 =?us-ascii?Q?oJWYiJYDn/kOG3pdrXpN6AKLlfVh0OZ/NaW9pgmOLE2FBQoe5xc4qzyt6LAT?=
 =?us-ascii?Q?9Q2ExUq/HZIktf5uZHaNIe0VIecrtAZPTY/pkBe0fUnQ/OydtSvIHAwhZM63?=
 =?us-ascii?Q?0fzDyxMlookbEUnM3L/APSnVFV6+VLruF6Zdkxn2Rb8EatOBN1TGFT5aF2Ns?=
 =?us-ascii?Q?UOeRd2mK/hQdbb0AMRdSew6GzLmYh3uT98qricBfPZn5OnIi++sJMp7zSDsz?=
 =?us-ascii?Q?KJUqOs8YNOxL7j4tchkun1oCPkpTpjxFhy8ZQEkSDi/e7T9x6H2U2oU70s2z?=
 =?us-ascii?Q?2Q73EonCBptPUtnBOVuj1bXk0XmxDYtq29/SMCZQ286qieha63zUQS6h0ndP?=
 =?us-ascii?Q?sAe48ARUx8VaWpJ277TuBRMAslPosPMLez0Ft1RzN7PWDX2Aw0Zy0WuJp6S9?=
 =?us-ascii?Q?7ET0Ffr0K9MN4OPYaxQpyPaxRK60ffDuNgPOv/N9QpBl7+ziaVu9TP5crku8?=
 =?us-ascii?Q?0/xMGxFYa54+Ym0ru0qHhg8ASFNvz5fyH4bxJx4R9r85TjJGd2AjbaS9TUdy?=
 =?us-ascii?Q?sBH8yWvD4kXm5Gf9ex9qLB2zm2CkTfrHWHsTq8AFfhUXE+lbr3TZ7kzGUsBi?=
 =?us-ascii?Q?ZFuyb+PTbMfFHJsAMY8To+I9trSylLjySJ12vPXQMjebsG7N1lUPevfe5UKy?=
 =?us-ascii?Q?wkBQEEy4fBFgY4GAmnWAw3dWM1YrSBd5UuyUi7WDLqBfBRDVd4YZei3dAT0N?=
 =?us-ascii?Q?IJFMcIRuWK3f55j9NxsQFJbz81cIEfi4iGu+v+ZWVl5KDsF5iFrXQg1s28ct?=
 =?us-ascii?Q?deqPtOtQ2PsEdaS2swxz3zNwRI1BDgJS8KRU20rTilspFHzptqvcLw7P+DaO?=
 =?us-ascii?Q?+bUWnRU5eqleboRrl91eaSpfdlT3mvQqzJYOS/w0V9Dx8MdxFnkKAsdX3Oo1?=
 =?us-ascii?Q?RFIH+XXpMyZ2sldtU3APppO4XKr0WHySPqUkEAPgkihPMP3SIO3CZdsaIegj?=
 =?us-ascii?Q?0anoPYweEEFL40gRr/rHWUYi3mhR4pCGBHy3OXOQ5LjNVRUJ0+pj4HtrUT6J?=
 =?us-ascii?Q?k5M9ut2U1OMIl5HG42s/05UGnDpGBRqQlRaguBditvVb3zmqk5RDyoV/jw/e?=
 =?us-ascii?Q?mcQVB2iyYPaaHxI3G0Z7ZjKHB9d+I3/F7YRRrV9ZvAQRLIva1zMzEmGN/tw5?=
 =?us-ascii?Q?XZg66tVAHy0etUSAV+mDXX0lNYdflLph9etVfUF8wjYhasUInqUX4Gfi5W6Y?=
 =?us-ascii?Q?dk9Dv0o2nWlNz4e8e1/GBHbLK014y1mxR/P3dH+b3WnN48SYT56vbQZFwY8h?=
 =?us-ascii?Q?9qKw2U8ptK8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jo2KcngFHMU/2deAFH1jSCU4PaO4K3h+SHRt8SVtT+T4L5yQs+hlmXIVa8vq?=
 =?us-ascii?Q?Dwx0ZXLLnwb+hUeHviiy4Krz4c3BMuLTe6NiY2/jvFgEXoPzrzmsJirrzllM?=
 =?us-ascii?Q?txTnv10mwvAL4V8np3GK4qZjzqfjZeiVQmULHSQDpzcj6xGjuZOMTkFsMwDB?=
 =?us-ascii?Q?VeyVVoDsnNZwXKNa1FXQBfWMVbkweA+sYzQxcv44L+b8qhgllGgBWj+pQ1RL?=
 =?us-ascii?Q?rUnXA4ygTnq34OPcgElLb+VH/qly+U6ug1IITX/8GsLrfO/cylftp+MUEKE1?=
 =?us-ascii?Q?AsToxKLY6K6EfXOZ+xqpadhhP6flzjg6f1QkIbY1m79DDmZnsFr5X5B80kSf?=
 =?us-ascii?Q?FNn5pS7+p9YPFAvuMmqyakYIjQ1j6KdXaJ77HuoPjPn6qUBR2YWRrUURP9P3?=
 =?us-ascii?Q?/5UXakyGcfnfSgfg4nC/seU7x8XWO3SyTnxLpOSo4/4FNNFM8M7Awlixi862?=
 =?us-ascii?Q?fhTKA5vf1ozAB1LbCgkT2r+Iufs/IATLLoXT2Y0zq90s3BjY/5i2UkoFcbfB?=
 =?us-ascii?Q?EGLdPDAhaFoHaajucjEPNBgHSF4u9WYsRHuLikn44nIWndyNK51LRP0x9GkQ?=
 =?us-ascii?Q?gTBM8tlxgk54//c+YBTSzgOigSZ8N/A+FMdzpAishmW2xesUEc/0wgnRQT4v?=
 =?us-ascii?Q?ZHNl3mY3fuECBGIp9YSY/tusk3JsKm/ribf/HlSpFS1VmUWxDsy57A9MYbf3?=
 =?us-ascii?Q?FZtlXYm8njsSwTBbV4Fwg82Js0+UXBiQYaXpf4dKxj940PCiRhZxvrikcoLm?=
 =?us-ascii?Q?51Nkh3XXUQ4/vWh/uRj/DOT8W3r4melhXdQGbYOf3BBlxbUCewIfqccK/dos?=
 =?us-ascii?Q?9kfIWo2kBQmBGzfctFy3pXFBgeBTzDM6f4nxFDeYMxxUkWW7BYHHRIxpimED?=
 =?us-ascii?Q?bzsPK5VNaxq7Yd+UgzZV0ifQ1LdI0m3gP3VcPuXyAm98BJe2ImFUg16xGF4j?=
 =?us-ascii?Q?0GwxMDm3DpL32WvOergVQLdvkwgcKh1r4z+4Ed1wuGoZya+GcRXl2Ge9HTYz?=
 =?us-ascii?Q?wyEj5Sg2wi0jUHIFYkQKtLIjd64dfsNPFMv9rNz4Dz5z613R2Y9MD9rvj5jo?=
 =?us-ascii?Q?qmj7bsDbg67jLbIJf4sxkoobPqF1COvsZuUV2HE8VkwKV12enEYFXoJHGYgM?=
 =?us-ascii?Q?YoBR391qR9wIlYJRWFBsFch56KTcf2QjlTBGIT1XfANw2vcdAZmA6SnNjhSk?=
 =?us-ascii?Q?zX+9ZJJrnD85NGQgQYva8iFx0+kpXwD+nW8EptLyT0VtoPjAdqBpXQnIPKah?=
 =?us-ascii?Q?+b4LMtzX7Hcnguo/XmBXxGV5Vi0s/8+mSu7+cIt95XVEQYgDHK5sWVY9W1dv?=
 =?us-ascii?Q?3+slYkE8sj5Prkc3Wmz0Sj44yEd7+N9O2Hiebq4TVQIJWfvFteEeCFv7OjkV?=
 =?us-ascii?Q?D14Pw65ggpo8SMgaEtc2bqKjavIrYjmxrLDjW6VUWnNqYHRb59dFfdY1BwtR?=
 =?us-ascii?Q?U2WBai3f+vQ6QA95T/jvsZJhmdpCWKUHH4o8p5RyzOaOQn6NWxa9M5pKHbxn?=
 =?us-ascii?Q?0755Qn+Kh9ketmsLadzPQ+USKkMzqdlKjNctYD95EzQjHOjzEMoemWNTxAAR?=
 =?us-ascii?Q?Gi2xc7COsBALdTOGuPhgoYVu0+ESZ9R7AXA5T7i1wMxdVa1elftwwc+Rsm6T?=
 =?us-ascii?Q?wpDPgKbcaBDUFIEPH0UgEEw=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ef7678-0d11-4c3a-eaa2-08ddb0d5fbd8
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 15:12:05.7608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMq9d9E6YakirFZJySXyUdu97s865kG9jePhk/rXBY36dUEwAYWY3cDuLX907Sfy9u2tS5qm1cCdIDF/vd7CZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3033

This series proposes the standard PV time implementation as per ARM DEN 0057A.
The first three commits are preparatory work, where no functional changes are
intended.

The motivation:

  The VCPUOP_register_runstate_memory_area hypercall is still actively
  used, e.g., in the Linux arm64. When KPTI is enabled, the area was not
  registered from the beginning due to the VA not always being valid. In
  such cases, Linux could fall back to using the standard PV time interface
  (ARM DEN 0057A), but this interface has not been implemented in Xen for
  arm64.

  Meanwhile, the VCPUOP_register_runstate_phys_area was introduced, though
  it's unclear whether this would be used in Linux arm64, nor when it will
  be prevalent amongst every possible downstream domain Linux variant even
  if so. And of course Linux is not an only option for the Xen arm64.

  Therefore, implementing the standard way of sharing PV time may be
  generically beneficial, reducing reliance on specially crafted
  hypercalls, the usage of which by guest VMs is not always guaranteed.
  Note that the PV_TIME_ST interface communicates with IPA (GPA), not GVA.


Koichiro Den (4):
  xen/arm: Add wrapper find_unused_regions
  xen/arm: Move make_hypervisor_node()
  xen/arm: Move make_resv_memory_node()
  xen/arm: Implement standard PV time interface as per ARM DEN 0057A

 xen/arch/arm/domain.c                   |  30 +++++
 xen/arch/arm/domain_build.c             | 168 +++++++++++++++++++++---
 xen/arch/arm/include/asm/domain.h       |  17 +++
 xen/arch/arm/include/asm/smccc.h        |  12 ++
 xen/arch/arm/vsmc.c                     |  38 ++++++
 xen/common/device-tree/dom0less-build.c |   2 +-
 xen/common/device-tree/static-shmem.c   |  40 ------
 xen/include/xen/fdt-domain-build.h      |   2 +
 xen/include/xen/static-shmem.h          |   9 --
 9 files changed, 248 insertions(+), 70 deletions(-)

-- 
2.48.1


