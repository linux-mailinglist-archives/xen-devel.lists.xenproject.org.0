Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4A4431F5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 16:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220367.381618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvvn-0002bk-2G; Tue, 02 Nov 2021 15:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220367.381618; Tue, 02 Nov 2021 15:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhvvm-0002Zc-VB; Tue, 02 Nov 2021 15:42:34 +0000
Received: by outflank-mailman (input) for mailman id 220367;
 Tue, 02 Nov 2021 15:42:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhvvl-0002ZW-6O
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 15:42:33 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c943eb60-8d9f-446b-bf57-fe5fcc9eec5a;
 Tue, 02 Nov 2021 15:42:31 +0000 (UTC)
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
X-Inumbo-ID: c943eb60-8d9f-446b-bf57-fe5fcc9eec5a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635867751;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YqaLFig5ujYlNCu+GEzpz6u1ykkSqrvVMVusU/LxHmA=;
  b=A/A28qK4GHQ1XzNGAgYN128AdqY61TrtNZvSs1DzfPIw+aTfGuryCNj/
   53sB95QhdTL61NOJEcNpCqZR0ynOed2JvHqeo1QBAZetJc7T9bnVpTN8a
   DfyTE0FWjJVqGwK1IgrkDre3s5vdaZXDNXEmvf7VMEX7rIXatgTN3VAGR
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UIV3ommM2bS4c22BOEnKhsnaLMxQMw2azHqKGPSzMXZhRWV9FKBOUXcHg99jbBdxocRM2rMdAx
 nTf850mLgYT7SnrnC4NC6rsayptUJXJ33NTzf2vSLVdABaWwalpWYkw1m9Q3kWExPTLZQfZrmX
 HZxyC3q47jjpSoQtDCkmfkEKLmlEMluphqMtBR1sgp8ZDPkhJKdofqVRMBAzTZT2LroAfS+TnO
 pasLkK65ApHAV6HTUMmeq3XILKJfeHuVq0JRTbvGmqQqeLhT7HTkBUlBeRgl/bWjIwVP/SdpIz
 QkYPcnWFnI7Wk4HPH3NwJa7G
X-SBRS: 5.1
X-MesageID: 56872600
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tamIyait96uZtQu1oPitcqIjX161MRYKZh0ujC45NGQN5FlHY01je
 htvX27Sa6nfZTPwftxzbYSx90tU68LSzdUwTlNl+yBhEX8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cw24Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Ckqy1FTpqIZH+neEvUTRqA3p0P5NJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JARR6iGP
 6L1bxJUQEyQeUQUKm0OAc00p8CEoHPfWmFX/Qf9Sa0fvDGIkV0ZPKLWGNbcZNGiX8hemUec4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9Qv6R4A6BLC+7uRtglCY2ioUEhJ+fWW8pf61m0uvQeV1I
 kYf+jcthaUq/UntRd74NzWju2KNtBMYX9tWEsU55RuLx66S5ByWbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQkY59jupqkjgxSJScxseIa3hNDoHTD7w
 xiRsTMzwb4UiKY2O76TpA6dxWj2/96QE1Bztl6/sn+ZAh1Ra6mVYtCVqkfn3/NFHoS0fEnat
 no6lJ3LhAwRNq2lmCuISeQLObim4feZLTHR6WJS84kdGyeFoCD6I90JiN1qDAIwa5tfJ2e1C
 KPGkVoJvMc7AZe8UUNgj2td4ewOxLOoK9nqX+u8gjFmMskoL1/vEM2DiCetM4HRfKoEzfFX1
 XSzK5/E4ZMm5UJPlmPeqwA1iudD+8zG7TmPLa0XNjz+uVZkWFabSK0eLHyFZf0j4aWPrW39q
 ogEapTbkU0ACrenPkE7FLL/y3hQdBDX4rit86RqmhOreFI6SAnN9deImdvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QisLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD3FnTYnH6PGBnF3OiLiSQkuLZksLU3HBmJgK8tNcko
 q3m0QXeQJEZQB9lAtqQY/Wqp25dd1BE8A6rd0eXcNRVZmv2941md374gvMtepleIhTf3DqKk
 Q2RBE5A9+XKpoY09vjPhLyF8Nj1Q7cvQBICEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iquYCnARpFXnGdXqxDbZkLiXU1MVDrPQVlLRYpRG3S
 gSE/dwDYeeFP8bsEVgwIgs5b7vciaFIy2eKtflseRf0/i56+raDQH5+BRjUhXwPNqZxPaMk3
 fwl5Jwc5Tugh0d4Kd2BlC1VqTiBdyRST6U9u5gGK4b3kQ53mEpaaJnRByKqspGCb9JAbhsjL
 jOO3feQgr1dwgzJcmYpFGiL1u1Y3MxctBdPxV4EBlKIhtua2aNngEwPqWw6HlZP0xFK8+NvI
 Ww6ZUR6KJKH8ypsmMUeDXunHBtMBUHB90H8o7fTeLY1k6V8urTxEVAA
IronPort-HdrOrdr: A9a23:UMoGKatlotd38b47l3ZRypLP7skC6oMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJGtJdBkVCe32m+yVNNXh77PECZe
 OhD6R81l2dkSN9VLXEOpBJZZmPm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTtj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZtA+1Dr1fqOk2lqxrk3AftlB4o9n/Z0FedxUDupMToLQhKQ/ZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIfwsCrDv1nVMS1cooy1BPW4oXb7Fc6aYF+llOLZsGFCXmrKg6De
 hVCt3G7vo+SyLaU5nghBgs/DWQZAV3Iv/fKXJy/vB9kgIm0kyR9nFoh/D2xRw7hdUAo5ot3Z
 WMDk0nrsAJciYsV9MJOA42e7rANoX8e2O/DIusGyWSKEgmAQOHl3el2sR+2AmVEKZ4u6fa3q
 6xCW9liQ==
X-IronPort-AV: E=Sophos;i="5.87,203,1631592000"; 
   d="scan'208";a="56872600"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djj6+P3uChj9x/kBtbpAuRI0daClCBvgGiAoFV9Zp8E00Lde1Q7vpMtWA8hZ3L3Tkl02/7rucPPx3U/HkeSDFfe3H0JDVZ1pUlhVrmcifGbEGx5ryOPbwAMeT/SmEzO3RzxTl58pp60LeIxtUxj6rt6VcsnLYxKZnNpj5Twsb85u1M8Dm4fFf5qOfhJxZhLFLvSW7+1aIP6kGovTPLyQ7N1d3UMG0FmA7FdDlCHiz705eZKd9nTLea+ucPtEqQrC1qP8MO4vCeRqwJGZkR/MUVioBm3IPC+wFcNrz52Zq86UHrY0lWSAGDUYhJkwm1btnj1BXAt7DGajMsEMMft+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nE6avqwBdBnwLEGc4SMc56P2CAPOw2Oii2xa3UpDCM=;
 b=NHvsMXcm3h3NOys+5dTiGckglmr9Y/YKkeagU2RPstrrIEmjETqdsxDXMYn8GVvI6k/vRgAV+q5KUDny0CsGczg1xdRXh1Xp7Vmlv3rTC0Xo7ZcUyfPb7SAk/KEX85vN9pRmFv2FWQ5v2KEPZ3uTHMJsRZSKpOfJd8E9E28rna2f/1v64jY88KTLIO79Jx1X7tri3ipi2D1G7+lKgUFteBmgI8c5jE0mP011ch2vWLHXlI92J67mwtJDzahiujemwRKvENSGd70SFTTuFLiY3oLTAWJnhQSikjQex/bHlQ2jaj01wSNYQNaVl6aKguDVGiX2hoIxxZwMYSgDBAXYIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nE6avqwBdBnwLEGc4SMc56P2CAPOw2Oii2xa3UpDCM=;
 b=dpJOxP3J0WVeQzgguvtFup6qHNhu3Al7y5E/6ZLzvatV3c1GdV5JIGJjnsG65hEjGomJOMQGmdn06c9vrY3EqtHMC2Yqpt0wxgra1ORdHnOazTZWTNotj7CXSp5cNypZkF+f0F4k8ITmJ42+jTaX4ucBIUiwm5X78gIXg8zFmlg=
Date: Tue, 2 Nov 2021 16:42:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <YYFcXPFCd1Dqo/AP@Air-de-Roger>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
 <YXz579WNpHe7aO91@Air-de-Roger>
 <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3715026d-b8e4-9940-6cfe-0ccf042cd07c@citrix.com>
X-ClientProxiedBy: MR2P264CA0136.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 619cd800-8619-4a3c-4ec6-08d99e175e51
X-MS-TrafficTypeDiagnostic: DM6PR03MB3835:
X-Microsoft-Antispam-PRVS: <DM6PR03MB38358C51D267EA3CA7EDCC558F8B9@DM6PR03MB3835.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gr6/qj1JhggWHU20SpNnCc+Zpa8oWvLKzJP14luScQaeQkjQ9+ABbsmCfgB3zb0yuUsciB4+TjLtgFR6POTGKuCGtI9Wt3qstuyxPZoj9mGEb3qtOmYAO+u3XgQadzSm623Y4LU4Kao8smenO0GLpOtKs8Jc8W0ejDFVMmmdTPpHsuBAHHPdE6NBOMuz9ojU9V9fAr78uQJ65AOCbzDAnLnzRFRY/iUdUSNRoxb4VHnwAXb7iAckNBCp/DEGm6eLrOV3bnEUBI6gmLnm3xM0GRxrYIUHw1b3ke7GB8GWXzaR8QY4qYiK1DOmHmb8jhnk3zGWFZhVCBqTpH469OnMlLrs6mKCp9/nUz9mTTHZ2CiNKaDIYaCPIv9vl+zOj+lloz2s5wbCWA9CWq3f0hDnykH9ZJXGreL/p2YlfPnGaK6I3UWg1wFHQHBqtsq8PbM5yghkNZO2dkclvOwzuOW8l3J1OAQXU1k4ACc1kjmVksXI4RYlzVyHJgjZsjJyAFs/frpt2qccyXvAowlnzfxWkWHnPf4t7QQqWgT7f8THpBbSFpLRmBdFL5oZm8gLXjNDkowMkTqH6vTdjy86/78AuJ4qOfSYk1mFlfCnZBCmp1jHNRcqr1RcrKK5TMUB1NoQh3wbrLFM7wAX79ZbpFNTN0x56ReTNtaA1FM0c5mvb4cq8Rb9qwiDU5J0hVpnt1a539DeogKYNA/I5xGqq4oFnGBhJkR9QRCup8hEpJL+Fjw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(6636002)(33716001)(316002)(186003)(26005)(508600001)(4326008)(54906003)(86362001)(82960400001)(9686003)(2906002)(6496006)(38100700002)(8936002)(6486002)(85182001)(66946007)(66556008)(66476007)(956004)(6862004)(83380400001)(6666004)(8676002)(5660300002)(53546011)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTduaTAvaVg1bVJ2Z1VscWZrUDl2MHUwanV1U2tZY0h2ckNKaUY3WCt2dTB6?=
 =?utf-8?B?U05XZVVuTGV5bHl5TlpNRWg3RThyNFc4b3BKekNiNUpqNjJmUGQzNGVyWTVU?=
 =?utf-8?B?ZGcrbmNFZ2F2eDBja1J4Wk9WeGV3MmZBRWp2V2s1K1E3aFZDdkk0YUlGMGd6?=
 =?utf-8?B?Rzl1aGVmendZTWxzQm5LVzF3Snd6cDNvQWx5eXN1RGx3WWtlQ251bStzSEw4?=
 =?utf-8?B?MmlMK29VeHFiNEhvK0JMcjJOcVNMSU5lV25NaG5RQldyTjBubWZqMTYzMW54?=
 =?utf-8?B?N2EvTmMvSUZtVnpWUWVPcW5pWGRSWVpwNHBCTUZqWEUxN1VGTWtrYkduV0Jq?=
 =?utf-8?B?elZTc3lDL0l6VXpseVZYUDNKV0phUGl6TUtpRlh2VkJQN0NUMFowMll6eGRK?=
 =?utf-8?B?b244YTVXY3VVc0hFZENrOEVoekVGak5yWE80dGJ5VmwxSW85S3d3dkJVRU9y?=
 =?utf-8?B?dmh5cHN4YjE3bjZCQmtteUxwUG8zWHAxL0gybFpqeUhybElKRUFJMS9FNkxk?=
 =?utf-8?B?Y1Rqd1o3WjF1RGdUSUladGI4WjI0V25BeDNvL2JMME9LOXozYXIweXRkd1Ja?=
 =?utf-8?B?SHUyeEVUSFRHOW9hbzN4TnJLSzBxYzVxaER2Rmd3aEcrZWRKeXA2T1Z5TzFT?=
 =?utf-8?B?R3l5Q2I1cndYdVBteEN4bEp6U3JwcDdxRU1vbFFxYTZJU3FIYml1TVdCdjdm?=
 =?utf-8?B?RnQyTGJtWkYzWFdycXg1M2JxZkVXcGEzeTY5Y3NlSndnY2QzNFZibG9udS9r?=
 =?utf-8?B?YU5ZUzFqQkttRUhtalZCY2xTb1FmeHo0bjRSUGlsNExRbEJnNFlOaHBMZTcr?=
 =?utf-8?B?QkVXUjNOdzhzblBxemZTdVEzOEsxbXllVmRaQlRPKzBrazNodmhSdkRXNito?=
 =?utf-8?B?c2IwaG8xQys0MlY3QWtKMmNjWldydllHNWtvWWdjUFAwaE9mSWlnQWNsK0ZW?=
 =?utf-8?B?QjVDSUZ0eTR5WCtUQ2dvOURpclVVZTRBaGloZVVrMEhjdW9COE03ZHNUQUZD?=
 =?utf-8?B?N2VZZEJ2ZUxQT2d5RW5VVHhoc1RnQm5sK2dra24zVnFPSUxvNDQzUHNZbWd2?=
 =?utf-8?B?T0V2R01oUWdwbnFhNTcwS3VKVDFrc2E5ZFMwYSsxZ1RFMkN1cXhYWUdCcEN1?=
 =?utf-8?B?MDJXanlidGoxRCtuVGFkeHlvbUdKMTE0RzFmakxlZHhsU0dmaEJIcm1TN2RN?=
 =?utf-8?B?YS8xMWVRSjE1SWxVMTRRRFFoVi95TXRFbTFndFBhTWxoYmJhTmMvN2Vtd1dH?=
 =?utf-8?B?MUNXempWcGVEaWJacHZsZktFUzVuTFVIOUU2MDFaQkRZNmFoYUl3dmpoOUFy?=
 =?utf-8?B?RXFGRnRrV2RYeHZDMHYrTEVPandNWmxaMzZhbndYK2hJbUFKbEVJa1VjK1Ru?=
 =?utf-8?B?UDJ3VWEzUnRYcFpXa0RibkFkSXR6WWpMNFpwSU9jLzI2VlprNHc1a25VUmdH?=
 =?utf-8?B?c3hkangwT2JlK1BTZTF4SEh1L0JuZThsRitFdjhoRjdScWQwcS9kTEM1cmNV?=
 =?utf-8?B?ZWc0UnFjM1pzMHZoTDRoSmN0bVdlYnhTaGRDN1laMExRVy9iMGkzSCtRYWZW?=
 =?utf-8?B?bUZ0NWdqT3pXRWJjSThyb0ZRL29nQlBROURZTXlCbWpheTJPaVduSnc4ZDAz?=
 =?utf-8?B?cThNOUxjeVZVQUVnNXRSL0ZmTmQ3cUw3S1YvOGpodThEdFA4L0NnZWd3YXVU?=
 =?utf-8?B?STRqSVFjTU1MNDJyNmVFK1ZlYWZUcWRmYzFuUzZQdlRUbDMxYSs4OTFzamhY?=
 =?utf-8?B?MVVaTVJCKysyRTdTb2NhMDhuUThISGxCNW9PWE5ZZnlQQ1IvTnJQZGkvRFpr?=
 =?utf-8?B?dm54SElxL2VnN3h0dk56c3lyL2VMdXkvaXNaNGJpYjg4VUc3Q1NZVERHZDVG?=
 =?utf-8?B?bTR4T0QrWCthampGcFJtS0NWRWVkSFFhMzNKZE1RdG9TQkxIVUp1bVl1MU5L?=
 =?utf-8?B?S3pPM3IyQVlPZnRtc3VGc3VaYjVQRGlFcnRLYzdIOU9kbG5xc0EyNzI1azA3?=
 =?utf-8?B?Smg0dGQxWlE0MW9waU5kUnJkZ0JDYks1a0RUSnhkY3FJTEdONWptWXhXL012?=
 =?utf-8?B?Zk96NjN2NitEYkkrVWlEeXNDTU9Xb1FuVzhBNnJYQ3FHN2x6amlTNHhZUHI0?=
 =?utf-8?B?VVpaOFdmNmc2WDA0eWg1UncrTS9Pb3g3eExCNmZrNFU4L0h1cXhOdEErdFMz?=
 =?utf-8?Q?i5KJOSJjq6KNAPMS5H066ro=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 619cd800-8619-4a3c-4ec6-08d99e175e51
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:42:25.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbTn0K0LQTy5JWgDdcFNkENczL1P5qFd9W8TYYbAkLu/OCVjPpDncOa1JQnjDGX/v+tM8MgVxrR6vImCOzOIFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3835
X-OriginatorOrg: citrix.com

On Tue, Nov 02, 2021 at 02:34:03PM +0000, Andrew Cooper wrote:
> On 30/10/2021 08:53, Roger Pau Monné wrote:
> > On Fri, Oct 29, 2021 at 05:39:52PM +0100, Andrew Cooper wrote:
> >> On 29/10/2021 08:59, Roger Pau Monne wrote:
> >>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> >>> index e510395d08..f94f0f272c 100644
> >>> --- a/xen/common/grant_table.c
> >>> +++ b/xen/common/grant_table.c
> >>> @@ -1917,11 +1918,33 @@ active_alloc_failed:
> >>>  }
> >>>  
> >>>  int grant_table_init(struct domain *d, int max_grant_frames,
> >>> -                     int max_maptrack_frames)
> >>> +                     int max_maptrack_frames, unsigned int options)
> >>>  {
> >>>      struct grant_table *gt;
> >>> +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> >>>      int ret = -ENOMEM;
> >>>  
> >>> +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> >>> +        max_grant_version = opt_gnttab_max_version;
> >>> +    if ( !max_grant_version )
> >>> +    {
> >>> +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> >>> +                d);
> >>> +        return -EINVAL;
> >>> +    }
> >>> +    if ( max_grant_version > opt_gnttab_max_version )
> >>> +    {
> >>> +        dprintk(XENLOG_INFO,
> >>> +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> >>> +                d, max_grant_version, opt_gnttab_max_version);
> >>> +        return -EINVAL;
> >>> +    }
> >> I think this wants to live in sanitise_domain_config() along with all
> >> the other auditing of flags and settings.
> > The reason to place those there is that the sanity checks for the
> > other grant table related parameters (max_grant_frames and
> > max_maptrack_frames) are performed in this function also. I think it's
> > better to keep the checks together.
> >
> > We should consider exporting the relevant values from grant table
> > code and then moving all the checks to sanitise_domain_config, but
> > likely a follow up work given the current point in the release.
> >
> >> Also, it can be simplified:
> >>
> >> if ( max_grant_version < 1 ||
> >>     max_grant_version > opt_gnttab_max_version )
> >> {
> >>     dprintk(XENLOG_INFO, "Requested gnttab max version %u outside of
> >> supported range [%u, %u]\n", ...);
> >> }
> > It was originally done this way so that the first check
> > (!max_grant_version) could be adjusted when support for
> > max_grant_version == 0 was introduced [0] in order to signal the
> > disabling of grant tables altogether.
> >
> >>
> >>> +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> >>> +         max_grant_version < 2 )
> >>> +        dprintk(XENLOG_INFO,
> >>> +                "%pd: host memory above 16Tb and grant table v2 disabled\n",
> >>> +                d);
> >> This is rather more complicated.
> >>
> >> For PV, this going wrong in the first place is conditional on CONFIG_BIGMEM.
> >> For HVM, it the guest address size, not the host.
> >> For ARM, I don't even know, because I've lost track of which bits of the
> >> ABI are directmap in an otherwise translated domain.
> > This was only aiming to cover the PV case, which I think it's the more
> > likely one. It's possible there's people attempting to create PV
> > guests on a 16TB machine, but I think it's more unlikely that the
> > guest itself will have 16TB of RAM.
> >
> >> I think it is probably useful to do something about it, but probably not
> >> in this patch.
> > I'm fine with this, we had no warning at all before, so I don't think
> > it should be a hard requirement to add one now. It would be nice if
> > there's consensus, but otherwise let's just skip it.
> >
> >> Perhaps modify domain_set_alloc_bitsize() to impose an upper limit for
> >> the "host memory size matters" cases?
> >>
> >> For the guest address size cases, this possibly wants to feed in to the
> >> max policy calculations in the same way that shadow kinda does.
> > So grant table version will basically clamp the amount of memory a
> > guest can use?
> >
> > What about guests that doesn't use grant tables at all, do we expect
> > those to set the future max_grant_version to 0 in order to avoid the
> > clamping without having to expose grant v2?
> >
> >>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> >>> index 51017b47bc..0ec57614bd 100644
> >>> --- a/xen/include/public/domctl.h
> >>> +++ b/xen/include/public/domctl.h
> >>> @@ -89,14 +89,20 @@ struct xen_domctl_createdomain {
> >>>      /*
> >>>       * Various domain limits, which impact the quantity of resources
> >>>       * (global mapping space, xenheap, etc) a guest may consume.  For
> >>> -     * max_grant_frames and max_maptrack_frames, < 0 means "use the
> >>> -     * default maximum value in the hypervisor".
> >>> +     * max_grant_frames, max_maptrack_frames and max_gnttab_version < 0
> >>> +     * means "use the default maximum value in the hypervisor".
> >>>       */
> >>>      uint32_t max_vcpus;
> >>>      uint32_t max_evtchn_port;
> >>>      int32_t max_grant_frames;
> >>>      int32_t max_maptrack_frames;
> >>>  
> >>> +/* Grant version, use low 4 bits. */
> >>> +#define XEN_DOMCTL_GRANT_version_mask    0xf
> >>> +#define XEN_DOMCTL_GRANT_version_default 0xf
> >> This needs to be a toolstack decision, not something in Xen.  This
> >> doesn't fix the case where VMs can't cope with change underfoot.
> >>
> >> It is fine for the user say "use the default", but this must be turned
> >> into an explicit 1 or 2 by the toolstack, so that the version(s) visible
> >> to the guest remains invariant while it is booted.
> > Please bear with me, as I'm afraid I don't understand why this is
> > relevant. Allowed max grant version can only change as a result of a
> > migration
> 
> No.  Allowed max grant version is (well - needs to be) a fixed property
> of the VM, even across migration.

Right, but I think we agreed we where going to punt this to post 4.16,
as noted in:

https://lore.kernel.org/xen-devel/24954.44919.8320.63375@mariner.uk.xensource.com/

It's strictly no worse than the current code, where you can migrate
from a host with a default max grant version of 2 to one with a
default max grant version of 1 and migration will succeed.

> It was a fundamentally mistake to ever have gnttab v2 active by default,
> without an enumeration, and with no way of turning it off.  Same too for
> evtchn, but we've already taken a patch to knobble fifo support.
> 
> 
> The toolstack needs to explicitly select v1 or v2.  It's fine to pick a
> default on behalf a user which doesn't care, but what moves in the
> migrate stream must an explicit, unambiguous value, so the destination
> Xen and toolstack can reconstruct the VM exactly.
> 
> "default" is ambiguous, and cannot be recovered after the fact.  In
> particular, a vm with no explicit configuration, when booted on a Xen
> with gnttab limited to v1 on the command line, should not have v2 become
> accessible by migrating to a second Xen with no command line limit.  It
> is fine, if that VM subsequently reboots, to find that v2 is now available.

There are other grant table options that have the defaults set in Xen
(ie: max_grant_frames and max_maptrack_frames), which will need to be
fetched on a per-domain basis already in order to be migrated, so I
was planning on doing something similar with the max grant version, so
that we could fetch all the grant table related parameters.

Or else we should also remove setting max_grant_frames and
max_maptrack_frames to -1 (default), and instead force the toolstack
to explicitly set those. In any case, I think we need to handle the
grant table version and max_{grant,maptrack}_frames in the same way,
and it's likely better to leave that for later.

Thanks, Roger.

