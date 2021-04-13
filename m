Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D635E0CD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109794.209617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJd3-0005bZ-VC; Tue, 13 Apr 2021 14:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109794.209617; Tue, 13 Apr 2021 14:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJd3-0005am-Pi; Tue, 13 Apr 2021 14:02:57 +0000
Received: by outflank-mailman (input) for mailman id 109794;
 Tue, 13 Apr 2021 14:02:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJd1-0005VP-Lw
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:55 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7aa8d1c-a197-4003-8b03-da7179619109;
 Tue, 13 Apr 2021 14:02:54 +0000 (UTC)
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
X-Inumbo-ID: e7aa8d1c-a197-4003-8b03-da7179619109
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=WrgzclkoEzTDmdIEIC5OF4WYt487TOXaBKzV0255Ehc=;
  b=cW1DwgZ2EH4UaWnCeb5YmY0ma/ucANYMiazLQj9leA1o7wQJIhnxp340
   XFLudQOYx9/IbZ54jg6GJfv2jlSY53wCsbM8DiaTnPghqRGYDPirdGeja
   tfWETNdq3p62MkCZSnzNg6uMt7QIRBkXxCiEHxMoSUAnvyYHUo+BdHUAZ
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 9xL1XWWUHkQE602k0AFIqXPVi8BFPmApmrtre0or53xCSVo4VK9l4NvIEvvUpAmP94oQ1q5YVd
 3pAyPRn22vQf8wQh15DiL8tST94jxiW0X9pUxfnFqtinaWyVkhXgarB1FlMOji7lVqp5wHXGyl
 5dfDtbOmoSPsdxvcUxf+SMt4r9y9g5S5bHSQ+3QHL1mcPSJWaRXQMPmF0/d6P1H0n8t71yV+1s
 jO7vxeKYFD6Pjm1+Heb2SOdB/a9IwzYcZiamajbIz2lh/XcXI3KCUzOYOmWhA5lHsoFZhndlwF
 Oo8=
X-SBRS: 5.2
X-MesageID: 41476507
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nS7wcq4XsyIXVmxItQPXwU2EI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbjqzOEtwWQVAGN4FD5
 Ka/MVKvH6Nfn4QY8S9CBA+LpT+jvfMk4/rZgNDOg4/5GC1/E6VwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLrCP0+HTU6/1t6bnc4/tFQPeBk80Ebgjr4zzYH7hJf52nkHQLrPq06FAs+e
 O80ysIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerh8rLlUfRfD500rsMsU6t
 Mw40uju4dKFhSFpSzh5rHzJmBXv3Cpqnkvm/N7tQ05baIibtZq3Oki1XIQOpIBECXm0ZsgAe
 ljAerNjcwmD2+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoiPA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS2vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSfGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erGs
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUwoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYe3n1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQsBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG4fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3DToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5ZvJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjYvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMZAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCU5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3iml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NAgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso6I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfCvA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu+lZMfRmmIpA79Ij
 CkglVg1saAeyuIzrgBDa0sZUxQdUgn8XxnldnyPbH4OUGPd+tZ+kC9PWL4WLhBSLKdEbFVih
 ph+dmHk6u2cCX/sTqg8AdTE+Zr82y9R9m1Dx/JMelU88aiMVDJu5CU2qeI/X7KYAr+TV8Zi4
 1DfVERacoGqgBKtvxJ7gGCDortokwklFNC5ypAjVCF4Pn+3Fvm
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="41476507"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhusGuN/wA9Tg9JPTTttwO4yzdLd7ohDdhBwi6H2xR0DtA2q6lspK3C7RgcAfN95f3PM35XUBaHdYb2swDfzcButSV61nJQwjNKnSSDztIWaNpGOBnMv70KQeSqyl0Af0eX4E6149+V8TDC0CZ16t/QSj4csESHaSQ820g18qnVzm08Vga0Oro7hSI3r6yQlPSLJ37ADB3c/saCTwr5WTjecA7kZVaqYB8bnXZzwagAJ1AZT4OqOEAnmFCh/egOH48hXGe5ACH3ICKTbSGtavUNjVnEnpxzjIY/FHE2XUwHJhdMRe8jFlQO5wcEgldfAI76TqJSla6Ms3Q5tN1ZB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdjL53sxfL72OocLfvFBEO6t+rw9rfdKFRBd12scbro=;
 b=RzoL7xPis1aErWqhZMWfzxp0MhJGbRSVrXuX86GizC9zdFuKK5PrD4FW7oHCXQau+C6uQuOVvZH4brCz+uEb7+YKP8Pot+gOnl37hIRIja77ahoKD2fgjjZM0kD6nsTq7AespkDZxs7/b8O+fPwHhnfV3XztLiBomGtKguOsFJ3Iw6+vQDzEHqKHQVqKW1EtVGPp8mXg9QyXHoGBoJdzRu9xOgsLpXkudQQ+MwBrM1nF2hUH6BViTX3AwhV4r5kMxuOHY++sfnZ4zz3StiIDY7vS46ovsITJ4x7sfjqRd3CvgkkZWuMqklwGp76vOlFM8mz8XHDGy9pZ6ofWtlIdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdjL53sxfL72OocLfvFBEO6t+rw9rfdKFRBd12scbro=;
 b=d5ZVAc8StDCLtYrb/sD8RTJpFjsT+PxBY/sqXVPPRX5ZE68VmABGglQRVQnqX4n9gW7BXO8tMDYRw0kF0YuGZpXLTcG6TLViEjy0mNyQXqD7HFNpEEP8U6fis/xsvqXFOeTuSHvtWBx/NBFZ7L13nK662I1Spt/g8ZQuzkug1BA=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v2 10/21] tests/cpu-policy: add sorted MSR test
Date: Tue, 13 Apr 2021 16:01:28 +0200
Message-ID: <20210413140140.73690-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0114.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d3d20d3-3ccb-41f1-7c39-08d8fe84d3f1
X-MS-TrafficTypeDiagnostic: DM5PR03MB2553:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2553617630EAD18D164BC9FE8F4F9@DM5PR03MB2553.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48VIJXz3jh4b7mENzd/m/UVziWlbcSQy302XrYpX4/Nn51JaBAokO5ic5orHVyC/xAggYHIQJN/ufOaZJjPGe6kP/R1+vdmMtNLYwiNSmRwjR//0t0N3gVOs2asPfnazkKyNhFpsW7GhmtsR8nsHA2vcNNQ2tlMFeBgktQMyhAR04wTbbEpPp+YiSnk/DmWhLy2RLRjgU+1+A1tGqx5zAs8KtktPsMS0WOMmjmv9t5pHSGUZnYCcefj7sNnOFiL7OMWE40M0OwXqaYfqlRmMFQSQI9HUmZLGXpXg3lD6p0z8oFKhGLQzc1z8qeY0Rxl+ZQG0WWhgRWUtV1os0CaKk/YCSH+Hv1ISqrvUfs3pQ6tXrjRw4zkEeSETnzcxT4kf8RtbwyHKn3TSQwNjY4t4naPVVt6bX5M+AcA8CXJ2jOcyxK8wPXnkxs3eP9RxG5781ycloM1tzE0Fa6gfq8UKeGVJBinftOSMN3HCDXfka4IIGAJKN5rzVVTyGPOc3hKc7O3mMInGLiz0CJ2IWfSKexeEv5DVfnajMkniHIBOSe8X9WuQennAzCArsa5Ar+/w5MLBmKOrM7tQGayJSDWTFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(346002)(39850400004)(8936002)(6496006)(186003)(38100700002)(2906002)(66476007)(86362001)(956004)(2616005)(8676002)(478600001)(66556008)(66946007)(6666004)(6486002)(16526019)(316002)(6916009)(36756003)(54906003)(1076003)(5660300002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MUdFRmtNWm1YdGptYm9ZMVc5YTBETCs2QktnYkx2Uk9BZHdaY05aSytpSzdw?=
 =?utf-8?B?OWxRdlkzSHUvbnY2TitIbU5SN2dTbFF5MVVVdTVoaWlTUnhYeGR0eGhHWWZV?=
 =?utf-8?B?Y2dJeXFtejFxaVh6TThtR3VaSzFRRWpiWnVtcGVUWi91U3lKY2JiVmh0N3FL?=
 =?utf-8?B?Q0NtbHJ2Y3k1NzBML1FDb2RwS1BJN0ovSTFycko4a2hEY1hEUWFKQXJpTE8v?=
 =?utf-8?B?VWJVRW9SZWQ3cksyL3NWam9kUC9DQ294aUdZeXNmWkxLL1B4eVBJNWNhRDMr?=
 =?utf-8?B?TzhDWUtDUW1BZjNaSmsvR2liTkdqVmx5RGNaMEVCVEdqVE1nMkRESVB4R3Jw?=
 =?utf-8?B?aUpGdTZhdEtXUWRWY1dQbERpd1owU1V1ZlQ3Qk9oM2QvUnlZSlJURERKTDll?=
 =?utf-8?B?d3lmcVI4b3RRcE9YK2U1OUlLeGdlZ290b0RzRjVBVENwTGJhenBwci9EOWJR?=
 =?utf-8?B?SzJpWVh1c2FMNGVUbmlXZ3BaMWJiTjQyeDBDSkRlc1JuRmdJakcxT3Qxa3BH?=
 =?utf-8?B?RzV5SW00WGJOOU4wZVF5YzB3aXdIbHVxYjJxRlcxYmQxUFFCZnFEajdNbHVp?=
 =?utf-8?B?a0NoN3ZaWkZiVkJPcE5yMnVvZ1lldTkvVU8relMzMkt1WmZyb1FsUXdPc2Ny?=
 =?utf-8?B?VFV1a3Flb3NFUVVWM0VuQVhmdjUvVWQ1MFVPN2lVYmJNYm41QUoxT1VTdWpV?=
 =?utf-8?B?b3F0TUxFT3o3NWV0eHJEYUNwUmxWM0Fxd0RBMlRhcXVwS0ZSMVhjTVE2dUxy?=
 =?utf-8?B?NXB3K0FRNTNmekU5a3N0SjBDWWJUSzh3T1NVbWFvdkdidWUvQllEdlp1NUtj?=
 =?utf-8?B?TmgrUlFxM0pxSFVHNVhya2hzamNCVURWTVZJcVB3N0RtSzlzTWVPZ2Q2d1Vh?=
 =?utf-8?B?QmdSTmhkdXc3NE80allJTmIxSnI1MmsyTUcwZjZBN3B5V3E2T2xoT1B4SmRV?=
 =?utf-8?B?Nys5WGYraWkwZXJJTnZpaFFGbTFXakhOb3lkT1FlUXhoTXBtSDlwS1Vtc3Zo?=
 =?utf-8?B?MEFQM1BPcmxzb3hZS2VnSHZncnpzRHFWWkpKU25kNDBTcXMzZk05bUtaNHgy?=
 =?utf-8?B?Qm4xckNFN1JKVXk0eDRydE5nTE84V05sZTRiUXZucnBVekRIYk94MnJiTFZN?=
 =?utf-8?B?SUF3aDNzR0pmdlN3SkpaemhmMGR0d3dXNTcyYmhvSUZxTTB2V2JGNkNFTStL?=
 =?utf-8?B?QzJtVlErOUQ1RUFxR0xRSTNRMS9jZ3VyWkc0M2VrRDJaQ09Sa3l2NVFKdUxO?=
 =?utf-8?B?VHF3VDRoQkZBOWdyNlpqQ1NnbmlMS25RTzMzMDNNWlM0SHlCRkFRdldRUTN6?=
 =?utf-8?B?TDVMV04rSGhjOWtORVVpbVNoTklmQ0RVWlVKaGpxYzBWSVJId0NlYjJ0eldZ?=
 =?utf-8?B?M2hUZ0FHV0F4dHlHRU1Hek03ckxhTEpJRVl3Wnl5Q1p3UG1zWS9POUtUcFls?=
 =?utf-8?B?V0VqTHN4WFNURzRsOVJ6RUNIUGh3YUEwVzl2NldoeVd6Zm56OHA1WXZScGRt?=
 =?utf-8?B?bGpSUTUxeHp0cTFYUzlNOXk4SlF3SEZ4NEl5R09hT09GV0dQVkJhb0p5N2RU?=
 =?utf-8?B?QW85ZUM5WVNIaVdLUzMvSFZ0ZEg5WnIvdTEzLzZkZzZDNC91WmM5dlhXR1dJ?=
 =?utf-8?B?cHU2SmRWNzNFeGtPOGg3Qk1mbmQ0NngyZGxoejNhSUZGZXpyTm9jNEhFNkRm?=
 =?utf-8?B?TFp6MmtJNUJJVUxPcEFDMW9sVUc1RDFkYnBZcHkwSlVKTmtZZ2ZuQlFTVyty?=
 =?utf-8?Q?s6wBiBMLYwp7ActEBa2GZQadLoH01iOmX+e4ELx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3d20d3-3ccb-41f1-7c39-08d8fe84d3f1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:51.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmfiLvtKDedysUSzzvY4Jc2J7Ns8idIQXjQhlnoWFgXkGRrh2y1DJFMS0Qv2yCBzZ2gYqJYwgLmCYXqMvwYEfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2553
X-OriginatorOrg: citrix.com

Further changes will rely on MSR entries being sorted, so add a test
to assert it.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 tools/tests/cpu-policy/test-cpu-policy.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/tests/cpu-policy/test-cpu-policy.c b/tools/tests/cpu-policy/test-cpu-policy.c
index 0fa209f1ea7..ed450a09970 100644
--- a/tools/tests/cpu-policy/test-cpu-policy.c
+++ b/tools/tests/cpu-policy/test-cpu-policy.c
@@ -86,6 +86,16 @@ static bool leaves_are_sorted(const xen_cpuid_leaf_t *leaves, unsigned int nr)
     return true;
 }
 
+static bool msrs_are_sorted(const xen_msr_entry_t *entries, unsigned int nr)
+{
+    for ( unsigned int i = 1; i < nr; ++i )
+        /* MSR index went backwards => not sorted. */
+        if ( entries[i - 1].idx > entries[i].idx )
+            return false;
+
+    return true;
+}
+
 static void test_cpuid_current(void)
 {
     struct cpuid_policy p;
@@ -270,6 +280,13 @@ static void test_msr_serialise_success(void)
             goto test_done;
         }
 
+        if ( !msrs_are_sorted(msrs, nr) )
+        {
+            fail("  Test %s, MSR entries not sorted\n",
+                 t->name);
+            goto test_done;
+        }
+
     test_done:
         free(msrs);
     }
-- 
2.30.1


