Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70D3A78DF
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 10:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141957.262082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt4Bb-00022o-2J; Tue, 15 Jun 2021 08:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141957.262082; Tue, 15 Jun 2021 08:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt4Ba-00020F-T2; Tue, 15 Jun 2021 08:12:38 +0000
Received: by outflank-mailman (input) for mailman id 141957;
 Tue, 15 Jun 2021 08:12:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gB8e=LJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lt4BY-000209-Lc
 for xen-devel@lists.xen.org; Tue, 15 Jun 2021 08:12:36 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0c570d2-b933-469e-ab15-e0e203856390;
 Tue, 15 Jun 2021 08:12:34 +0000 (UTC)
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
X-Inumbo-ID: e0c570d2-b933-469e-ab15-e0e203856390
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623744753;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H/Un64voqM4zIW10FuYdprltye1L/0Uqc5IP5peFieg=;
  b=L7xuAuWAcMESzGuDqd9qcY7y39dIRW9fKS1jPX+omyRwN6vxbe3/KkAi
   6kJpsUmGyE7MBiELHy+dAHShmh3gTqDaBKOhSZV5VK75gaxyj265iDfDm
   iTz5aQgP8jsucDLiOrfPKejH7dGjP1ANmbBagX82wz8OooSaNU/M3c04y
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lsbpc/CpGIVI/k8uO4N6RTYFbNuaBIkdva4rR2tBqikh5Zk8EIbgm2FT6W2ncD2TbqId49k7l3
 GWMDdLn6LczDQi7CQirDDvknd4TWZOvi9j7WjpilZwL79hS/biHXP7BVJT5lGrOJHgOKG1spve
 1T3UPYlOnjIC1z5gdw+N07uCTIDPfmvv5CGGoRtxYE85f8w0nSnBzyN8fc2r8JBQ3kqo54HUNH
 K1OzJ4cRy7hys6DR2o471Hu22yT5w3InSTUiYDXTpHaeHYQNB3RF0y8sBCAQjkkD0/ICsnczSR
 Zvk=
X-SBRS: 5.1
X-MesageID: 46506655
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:621L5aP3GX18zMBcTsajsMiBIKoaSvp033AB3UoZc20wTiX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAamSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.83,275,1616472000"; 
   d="scan'208";a="46506655"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLgdMRHiTtcUXv4QyCx8oH9uYbniG3WWCRUnNjLlweQhXYIiwbGk9fAEUf1bzaQ3lhVGLVbsRI/StvZLUl+cLwj7QszEHdB5otgnw2IfzajETvmRiksKv2RBy7HXCABz09jl7PU6dCRRXJsJyCrhATam1cn0Wt4/pwH1NawUiR38/FBUuQenQC4fTFjMkA76kNAGw+QsvYZezkUGV0lmgHUdjs4xgdTv1HfQb5n3bTEEH3snOzIqxV2kK03OuTnK8AbamGtWZNqbO2SELxyeSKT7ENsWDbC8M/cgCkGqEaJ5lVB7y2MiRNcu2uUG3QN3pyqiCscIP+2hzKIucBrgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YEOjpNrUo7JaqifnHuVQotiBvdYocDAqcX0FlhKRgE=;
 b=M+l70Q724i/1ADdnyjOhhvneWZQb5vYnIDO1Ik5kyTuw42pRKt0ZUiLih8bnlR+DOFm2KRn58aRBrZAaeoje8BLRZFoPVRke6f0nndo5MjohKsr3RX4qwzJrVHWIp6/Kfg/RmN4WdPv1abjj0/PH1DNDfTeeH93h3YzEOVkigptaYuN93BiQfgkF1uwFQDVQPjZfwha9X1Aa8cxot3OfqBMoG84TVzbyhmelfwtuvo/AGUJI2MhioQ+y5abGsIO8JPMiToGWW/xDzf0peyH8X/1C8a6KSikXb3Mo2DDvUCh2wy2f8q6wumvjYMoXVuCuYK7GqkWhr4htgd/6HLcaXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YEOjpNrUo7JaqifnHuVQotiBvdYocDAqcX0FlhKRgE=;
 b=nd5rTYvnbCdByg+UjDMEgEgvvytYpT84V3uoQz267+NFUAUeBDeuUmIv/qlF4nE6XndbggX9whP8CmmKBlvYMwh7XY8dxICFTI/lvsmAkUZ6OJnI7cmRiM+eOyvu2cZ5AumGiqUAouDdQ0I7eEXqOwVwCnGzN0ByG8YfPHhnKZc=
Date: Tue, 15 Jun 2021 10:12:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, <xen-devel@lists.xen.org>,
	<boris.ostrovsky@oracle.com>, <stephen.s.brennan@oracle.com>
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
Message-ID: <YMhg6OclYQ9AS+wD@Air-de-Roger>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
 <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
X-ClientProxiedBy: AM0PR06CA0118.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 085e0587-7533-400b-66b1-08d92fd55187
X-MS-TrafficTypeDiagnostic: DM6PR03MB3948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3948227E3FA5E1BDC609A9CE8F309@DM6PR03MB3948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J8CbSmoGjbXzY9CppDVhT0zFGWZa1ZlVP28CkGopI+26NnG4BNg7mRvYPJpqCV4fTyOwt+IdC9CLzo5vks2xbRZ0Mx+wAuXzCxBZic66QoxverPbTRCj/68rKelw5ef0xA6nrN8RfQ34/NIZQsFv3IzEVXr4UJdVcDv1gnwpobNKkUW/nJFj5JvYAqyX/5uUf0LgFthZ9PoF1JQV3haMY3QgT4PZakuDdnefZGQW6iesGJbONjVVv7Ygwe4HylsrXE1KYEzvQYKUvKTlZDyt+ngecd7iXiSNYffmP2qMDtVuQdAXddjc6M9vnau/+zcWC/bew7XdPwNOrypEevptD99bdZfj/inzGv5FkwxivFk29y0NcvGHIIXf8CChg5OTrM6WMXnkd0zcqB6ViTLIavAIFHNWqzjiksi8EhGu6g+KDsEt02raDL+42F1922+mcopN4l99GbvP8MGLRAXo5kREHYpvwCj3h4m2MlqxNhYWeFuAGF3Vqt9HSCxwOdwIgjHHS+V9HCeHYnZoTgo8fQZtXuRcX4L9M3STb5lIqym0ENg9gng5gLS/d+CbwRfU5U/c+9zns7PiZX2Ww+vkAZL1GYTfSR3lD/Ay+VdyEMMRZ5Q3yuaNZdeTMoQEkTP6GwIyPLGFKtuT5RNbJW39BQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(4326008)(2906002)(38100700002)(16526019)(186003)(66556008)(26005)(66476007)(8676002)(8936002)(6486002)(86362001)(85182001)(83380400001)(6496006)(9686003)(33716001)(6666004)(478600001)(66946007)(956004)(316002)(6916009)(53546011)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUVRNkloQ2tqcWpTUWlKbUpoTDlrL2xSTE9oSDNOQjdjb1dxNmd4SWRBS285?=
 =?utf-8?B?aDZpeUlUbXNiZ1lZM1VickZDb2wwMks3WUdlZTlRbVlvQzNyRnIyTlQwODc1?=
 =?utf-8?B?WkxCRld4T09YUmpQbHlqTnFOOGlGcU9TU1RHZ1hqYldJWGJDZkFGdVdwajhG?=
 =?utf-8?B?SFQwQmxMenRhV0k0WTFFL2t6NHZqL0NFUE5tclI1SU1iYVBsL0VqdStrSWhj?=
 =?utf-8?B?Z3JoRmJvaGZXMEpBaUtaVXB6V2NkKy9zRWtPaTZYQWw4RVgwenEzY0F4cEt2?=
 =?utf-8?B?UFpTeTBCZ0hKQ0VFYjB2RW9qbmNLY01MRk1rb0ZEVC96dFBUazE4L2F4N0lT?=
 =?utf-8?B?YUJLUi8wY3k0RU1JN1JLQjIyY0g5NlFkRVhWK0h2SnBlNnpqWnhtMUJSZ2Fi?=
 =?utf-8?B?dEV4TE03YkV4ZEt4WXRtRXBldnpuMXVuMWwvYTluNWgrcXIwclJhdjNNVjBr?=
 =?utf-8?B?QldiVllIc1F6SmlKS0QzSFllcnNDSGhQaU8xcjMyN1RIYnZwSWR4Y054ckRV?=
 =?utf-8?B?LzA5Zmw2dVRjSGoxbm95VHI0RzJKRG8rTjUvdzNFbStZanJudUJWcHVWbCtG?=
 =?utf-8?B?dkZCZlZmNWNOZko5c2ZJbEFHYWM0MVNBWHBHaGVkT0o3dHBFaVFtTVJTTXEr?=
 =?utf-8?B?NGZzbU8zdGdWdDRHV2liMFB1Y1FiODlXTE5NRHAwL3hNOHlwa1l1VWRCWWJK?=
 =?utf-8?B?WkVkeUV1VkNFa2UyT1ZzUUJ0MUZzYndBeis5cFlaYnk2QXNqOHgxb0dZS1Fj?=
 =?utf-8?B?RTRVTjRiM2tINWdZNTAyNVVtZjAvVTh6QjZQMkZETUk4bWZtdCtoamJsdDdn?=
 =?utf-8?B?eFExRERRQjBnazVWaHNBK2dwQjZ5TkpZZDdBdEdaQUoraHBNdWRTTGE3cHd2?=
 =?utf-8?B?ZHJBM3dKOW81MmJmMzlTb0VqTXFIWVFXRlplSFpyWG53YW0xZFhVUS93ZGM5?=
 =?utf-8?B?YUVWbzBETVNYZWtSV2l0QWJ0WU5IdzVZZk1DZHIvOEhFaG11VlRITVdBeUpq?=
 =?utf-8?B?ZzVlR24zbk9CbGQ3RHRtSHhlMFNoWUc4dEcvMUxGY1Nvd0lQUmNOTmsxOHU0?=
 =?utf-8?B?U2l3RHF2MGVhd0ZyblRYQVhPQ2F2ZkpzL21ZemI0K01STTFIV2VCR0NsdlZ4?=
 =?utf-8?B?VFFTenp1S3FTYkl6NGxCVDFBQ0pDdzlDcjlEZ0o4UzBsaWVodk9ucGEzbE9u?=
 =?utf-8?B?RUZtcHlzWk1MV0svUElxM0VSc2NlanpXK1BuY0Rkb3ZMM2tlbGpKcG8vYWQw?=
 =?utf-8?B?RjFySncwSm5ZZ2k4S0VVYy9VOU9PZmxYVExEQmdGSDVweU9vdE5makpKQS9B?=
 =?utf-8?B?Mnlna0c0OVhNTTY0WEQzTTlNL2NTQkpHV24ybFExWU9wOURpZ2ptZFVxU0FI?=
 =?utf-8?B?VDRmdnFObFczTmYvZDE4YkQxQ2psc2xrd0MyR0NaQldCRVJUd1UvbENBL0JB?=
 =?utf-8?B?U1hibmgvVHkxSDZQaHVodktMRnJuTGpWZDN5cEpnV3Y0ckF5N1Y4b2E1cHBB?=
 =?utf-8?B?b1V2V2JKR0RMR2w4VjdkY0FQU1JCZG9vdDVzUkppWFFuRHVPQTlFLzkyMEtq?=
 =?utf-8?B?TmM0b1Mvb01oa1N1akZEQkxVTDJJYWV2MHREcFlycUZMa3QxbjF6VVAzdzlh?=
 =?utf-8?B?c3BLVlRFMkErMWN3NlFjVm1ieXlwVWJPajVtVWVDMjFBVFJFbDNRdGFWT1FG?=
 =?utf-8?B?dXY0Tjg0K0k1ZGdBM3c5UUZIRWtRY1Y1MW9sS0FMbkpzdWhBMzBOTlVhZ0wy?=
 =?utf-8?Q?G5S+F9mcCrOojwRUXA5vywyeQn/vrjnr55ZdZs9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085e0587-7533-400b-66b1-08d92fd55187
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 08:12:29.3606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rxuqZ/OjW5Kvq9wM7eHi+nGj3+HH1vVLfrx6ZUq0kM0AN2r3ANijeEw3aZz69+ZahWXRxVgw/F6OfYzySyNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3948
X-OriginatorOrg: citrix.com

On Mon, Jun 14, 2021 at 06:01:17PM +0200, Jan Beulich wrote:
> On 14.06.2021 15:27, Roger Pau Monné wrote:
> > On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
> >> On 14.06.2021 13:15, Igor Druzhinin wrote:
> >>> Hi, Boris, Stephen, Roger,
> >>>
> >>> We have stress tested recent changes on staging-4.13 which includes a
> >>> backport of the subject. Since the backport is identical to the
> >>> master branch and all of the pre-reqs are in place - we have no reason
> >>> to believe the issue is not the same on master.
> >>>
> >>> Here is what we got by running heavy stress testing including multiple
> >>> repeated VM lifecycle operations with storage and network load:
> >>>
> >>>
> >>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> >>> ----[ Xen-4.13.3-10.7-d  x86_64  debug=y   Not tainted ]----
> >>> CPU:    17
> >>> RIP:    e008:[<ffff82d080246b65>] common/timer.c#active_timer+0xc/0x1b
> >>> RFLAGS: 0000000000010046   CONTEXT: hypervisor (d675v0)
> >>> rax: 0000000000000000   rbx: ffff83137a8ed300   rcx: 0000000000000000
> >>> rdx: ffff83303fff7fff   rsi: ffff83303fff2549   rdi: ffff83137a8ed300
> >>> rbp: ffff83303fff7cf8   rsp: ffff83303fff7cf8   r8:  0000000000000001
> >>> r9:  0000000000000000   r10: 0000000000000011   r11: 0000168b0cc08083
> >>> r12: 0000000000000000   r13: ffff82d0805cf300   r14: ffff82d0805cf300
> >>> r15: 0000000000000292   cr0: 0000000080050033   cr4: 00000000000426e0
> >>> cr3: 00000013c1a32000   cr2: 0000000000000000
> >>> fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> >>> ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> >>> Xen code around <ffff82d080246b65> (common/timer.c#active_timer+0xc/0x1b):
> >>>   0f b6 47 2a 84 c0 75 02 <0f> 0b 3c 04 76 02 0f 0b 3c 02 0f 97 c0 5d c3 55
> >>> Xen stack trace from rsp=ffff83303fff7cf8:
> >>>     ffff83303fff7d48 ffff82d0802479f1 0000168b0192b846 ffff83137a8ed328
> >>>     000000001d0776eb ffff83137a8ed2c0 ffff83133ee47568 ffff83133ee47000
> >>>     ffff83133ee47560 ffff832b1a0cd000 ffff83303fff7d78 ffff82d08031e74e
> >>>     ffff83102d898000 ffff83133ee47000 ffff83102db8d000 0000000000000011
> >>>     ffff83303fff7dc8 ffff82d08027df19 0000000000000000 ffff83133ee47060
> >>>     ffff82d0805d0088 ffff83102d898000 ffff83133ee47000 0000000000000011
> >>>     0000000000000001 0000000000000011 ffff83303fff7e08 ffff82d0802414e0
> >>>     ffff83303fff7df8 0000168b0192b846 ffff83102d8a4660 0000168b0192b846
> >>>     ffff83102d8a4720 0000000000000011 ffff83303fff7ea8 ffff82d080241d6c
> >>>     ffff83133ee47000 ffff831244137a50 ffff83303fff7e48 ffff82d08031b5b8
> >>>     ffff83133ee47000 ffff832b1a0cd000 ffff83303fff7e68 ffff82d080312b65
> >>>     ffff83133ee47000 0000000000000000 ffff83303fff7ee8 ffff83102d8a4678
> >>>     ffff83303fff7ee8 ffff82d0805d6380 ffff82d0805d5b00 ffffffffffffffff
> >>>     ffff83303fff7fff 0000000000000000 ffff83303fff7ed8 ffff82d0802431f5
> >>>     ffff83133ee47000 0000000000000000 0000000000000000 0000000000000000
> >>>     ffff83303fff7ee8 ffff82d08024324a 00007ccfc00080e7 ffff82d08033930b
> >>>     ffffffffb0ebd5a0 000000000000000d 0000000000000062 0000000000000097
> >>>     000000000000001e 000000000000001f ffffffffb0ebd5ad 0000000000000000
> >>>     0000000000000005 000000000003d91d 0000000000000000 0000000000000000
> >>>     00000000000003d5 000000000000001e 0000000000000000 0000beef0000beef
> >>> Xen call trace:
> >>>     [<ffff82d080246b65>] R common/timer.c#active_timer+0xc/0x1b
> >>>     [<ffff82d0802479f1>] F stop_timer+0xf5/0x188
> >>>     [<ffff82d08031e74e>] F pt_save_timer+0x45/0x8a
> >>>     [<ffff82d08027df19>] F context_switch+0xf9/0xee0
> >>>     [<ffff82d0802414e0>] F common/schedule.c#sched_context_switch+0x146/0x151
> >>>     [<ffff82d080241d6c>] F common/schedule.c#schedule+0x28a/0x299
> >>>     [<ffff82d0802431f5>] F common/softirq.c#__do_softirq+0x85/0x90
> >>>     [<ffff82d08024324a>] F do_softirq+0x13/0x15
> >>>     [<ffff82d08033930b>] F vmx_asm_do_vmentry+0x2b/0x30
> >>>
> >>> ****************************************
> >>> Panic on CPU 17:
> >>> Assertion 'timer->status >= TIMER_STATUS_inactive' failed at timer.c:287
> >>> ****************************************
> >>
> >> Since this suggests a timer was found on the list without ever having been
> >> initialized, I've spotted a case where this indeed could now happen. Could
> >> you give the patch below a try?
> >>
> >> Jan
> >>
> >> x86/vpt: fully init timers before putting onto list
> >>
> >> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
> >> iterating the list and acting on the timers of the list entries will no
> >> longer be kept from entering their loops by create_periodic_time()'s
> >> holding of that lock. Therefore at least init_timer() needs calling
> >> ahead of list insertion, but keep this and set_timer() together.
> >>
> >> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some cases")
> >> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Thanks for looking into this so quickly, and sorry for not realizing
> > myself when relaxing the locking. Adding the timer to the list without
> > it being fully initialized was a latent issue even if protected by the
> > lock initially.
> > 
> > Provided testing shows the issue is fixed:
> 
> I guess the change here is needed anyway, even if testing finds there's
> still something amiss?

Indeed, just wondered whether there might be other instances using a
similar pattern, but I'm not able to spot any.

It might even be better to fix other issues (if any) on a different
commit.

Thanks.

