Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1158395C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376641.609544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxmm-0007JA-MS; Thu, 28 Jul 2022 07:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376641.609544; Thu, 28 Jul 2022 07:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxmm-0007Gc-JY; Thu, 28 Jul 2022 07:18:20 +0000
Received: by outflank-mailman (input) for mailman id 376641;
 Thu, 28 Jul 2022 07:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iD3z=YB=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1oGxml-0007GW-4Z
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:18:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73243da4-0e45-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 09:18:17 +0200 (CEST)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Thu, 28 Jul
 2022 07:18:12 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec80:e3fd:e3e2:605d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec80:e3fd:e3e2:605d%5]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 07:18:12 +0000
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
X-Inumbo-ID: 73243da4-0e45-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH2/21JpN852iGsRsRsJgZHyXPa78n7YWkigWDdoCm5rfb2lT0UL5l4EhlxSwBPws3gZA3PfLRNeihZCN7HAqmXD4xnPUUIm/J1lUuY1pIPhlNmiE5cH5Bk0YETciB6IDud9+OWqktHzpAnDxK5ZXACkMS7RxTJDwHynfPuQHKGqdfp9wXLsPSgQI1HHgSkJ7Ydy3QRwbAdOfKHNBQ9IBU18+5tIIiyqxRJV5zdtecEEJMdBLZ2oOnFFXjvXyMzapV6b3NdfS8SJGJFadls0CD7xFvtLU/xBQ+bSOSKMSWXRwtaBzqhT5A0+RBknJEsR1BAYY2dho9ijGJJWLkZSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVtWydABZS9UVNKHKOuqwYPe3aWGg5rbzuVhbSD4ULI=;
 b=KwUzJ4jhWtTd0i1G65KFRD0JRQVzNpFE/zGvPzLfxftBEwwUj/FFuGjo+FbHjE+ktY+m6+Zm3GLwBxmM/o8WrcnKKc5h2eVKaXR1hJHCfoZfoCymALEtr5+jc1AMknvfDypWgDPUjzCWEX5HeEppA/IogFCsM9KE2qtMx6jGpAQJTincg0z5qVlQJlpPwIjoKrrAVPhJVSN3gfuAFEMb+KuLdHNx4gNjwjbOq+1ZwAYTmvGhH+NxEhbkGIM7XJ4l34UwVwrTDMNWidVjYWQmANsCMbi/YIJeBemBQgt6uDWtg1HOo+vohrO5vfZywgeOhsWHTe94x6B+iz9jY2y3uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVtWydABZS9UVNKHKOuqwYPe3aWGg5rbzuVhbSD4ULI=;
 b=PnOIgGI188mq1nplPxBFjUeTE33ya/Z2/iVTX0FLF3syadDIaMITPfvs3aWR2L6HlZfcJaAsDN+dVymleKsZgqM12H/UkshvXd/8ghx7csawSsoyvIFlBALYBVRcPVSuvcQly2ZLyaHahG6kRRex4msSkq9leFzLKhoyKEkaIX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 28 Jul 2022 15:17:49 +0800
From: Huang Rui <ray.huang@amd.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Trigger" <Trigger.Huang@amd.com>
Subject: Re: Question to mem-path support at QEMU for Xen
Message-ID: <YuI4HXKaRnnS9foV@amd.com>
References: <Yt+XS81vmsWoJA5y@amd.com>
 <20220727101930.66ed56e1@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727101930.66ed56e1@redhat.com>
X-ClientProxiedBy: SI2PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::21) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75e122b7-116b-49ec-db96-08da70695505
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JxxMHokLlN3zmJXA13qIHOsvsOEYi1KXj1IEya4deqizHbsGO883Fu+10crgMg7B/ECRrQyVYZsME2z6Y4BURkiqhiV+XobV1xiXJkYNGlxfnwh2i2KeTlOUtoLn1aVjItidZBvZIYd1+eW/Hj/aTGwCJVbx3Em9svxRZHpcQI1O5V1K0AMaCYmjPdoHGS2qTKAwcHUbyXOg4mxAJYWfS0dVTN9a7i4gMjM0mgfqL7E9mP1rjJMj3K+iKdKUbqSHlBNG57nfMAsE4TevopFLfLdE0Cf16+YDKYZGm6vZQNsevT0zg744SXLCx4tODNlqFop4E88ZPrIWrPws2ht54WW3fvg3uX4n+RXwCbZQbXoCD/voXGhMLzrun+hr5jAy9sUMJInuv+Z3UpH36TqYHLcpEysN/godpo3wR33eW87Mv3tnKckTIYHzXq4543CUMK1o24NA0NV5EYe92c1PLzBuouUj6ye18iLKSaEmnjBfX/ob/Rj0IxPLmgtMiZ/HHsk8Fa/wP8sOkxVuL0jD6JNdgrrahQSdpcpXT0V7aQYvsGKV3pwZSrha9o2hm5rRKj3EaFBMn8eMEt0x93Hn+KAg2JWHf1YWfq8dA9jQ4cw51gThVqwwbjXk42ke65SHEKYJ1p9WU346uJGuAwXX8+DETLJovOvm2F+LVAfRb9KXKeBXJRF/yaJQEahc1yksz0ycQ3UcwTP/IGlUiPSWwdHPp19U//N7s/oZSxB6zonR5B1ozqwuF4xZs1/K9ijl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(41300700001)(26005)(36756003)(6512007)(6666004)(6506007)(8676002)(6486002)(478600001)(66946007)(66556008)(66476007)(38100700002)(4326008)(83380400001)(8936002)(5660300002)(2616005)(54906003)(86362001)(316002)(186003)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KEqfQ6Vifx4G6sz3S7Q7Lbs5N2ZlBkepJtyHnl6GmiBj5npSNUo8IvuesaLp?=
 =?us-ascii?Q?J8yj9shP7NdDO/sI8Rj4bl8pIyNFa7Eo/G2qURKswDHWwZex63Mr5GrbS+kV?=
 =?us-ascii?Q?2PZ/Fri5dmfn8M3pSwaocw8eHXPQdqNk2Gtf56xjnxXW35xKtDmh8JiavHdV?=
 =?us-ascii?Q?WqMiQ0ioN9NgYU8o9I21+xKbribsyWBRtQhXo62qolCPQCjmj0uiAazEUNsZ?=
 =?us-ascii?Q?ZSMn3Jf1A0jGGGW2lqYGHd4UzMe1agbLny4HvYU/UvRbTIgyAV0GDNFudaJd?=
 =?us-ascii?Q?34mquZzvKSJ05xLl1N7rpQAIXn7aiSxMWSUP/E7/l1nWcPZkItzBzvCARmvD?=
 =?us-ascii?Q?T8oN4YnVYVK2ULc36HsAtcTVGkM/HPoWMF4B+AsKVOczHw+vWFd+EeVgj1s7?=
 =?us-ascii?Q?wREN/d++dUCILX4yv1L6ft6ixGAnRFagmnwBpQ3cFj+LVi/lBoW2cbWGWbLC?=
 =?us-ascii?Q?UvKc9feEmoqu9C0m7fEwF2hZDQnsbQ3OiCjeJnI3/5pW5gKJLwXoEFxCn+xg?=
 =?us-ascii?Q?BpfSufYiZPQIYs57/nlm3oN/xyO58LQEltpHHL0xjJf4XH+Eb4FKKlDrztpz?=
 =?us-ascii?Q?5yXDt9+kYbQYRM+ppW5FljAenWz5Bu/BZRT44JZRlIlGXRuBz/a26UL4C3No?=
 =?us-ascii?Q?nqd8Ehvd5BmWN4aV53OsKnAKvvXHhBRtFyvUkdV3taev2Xbsvx06QgkURzA9?=
 =?us-ascii?Q?Slg0riC2npx73Sv8ztbrwsIs4oYjbsW8v76NXU5bdflAz8px4cpZTWRzAPsQ?=
 =?us-ascii?Q?W1ilqZgnWvmGRroRReDDgqvxS2kOL7vbHzFIHsCWNQBGhzlo518owAi+XqYj?=
 =?us-ascii?Q?GTh6wjPUTA4ycM6M7KWBOHbMbnOAwaCL31qfNE1lDiFjEL9VHbiSkY62A87c?=
 =?us-ascii?Q?+cqfWv9v0UB1tOBezTC3Gdg0TorlIMFimCoeXxbjp499Fs0eNaotj9NPUtdy?=
 =?us-ascii?Q?10sR2Zf1ubhdq0WTQPNebVfSVw4HYTcdNJatvG3hWxRYxu8n1iOr4kGXFBvv?=
 =?us-ascii?Q?GhDFVWyV28dw479ICxj/4fdj7G+r5ph5s6dIhSZra1sky0V/H+ksADR6rmEh?=
 =?us-ascii?Q?JdhjUL5/ymJjUU49gHQbcyV13V0gVNOmo3bE3euI9tiOyrFpZYn0qG0oXHQI?=
 =?us-ascii?Q?JRZUay/NThRmfBglkPBqUK9qBIl4e/sk8un11emMv9hPgPtDI5/k8NvZg9X5?=
 =?us-ascii?Q?GIg9oBEMy5duK7XvuBHYiA/afWBNwD2NTzOKCxImJoB4mM+nH9x42qqLUSpP?=
 =?us-ascii?Q?t18dfdVIAGr2G6YXQmDrd/joGFZgbAuDyPVrILQil8a6DFNFW/TZ9kQE8a59?=
 =?us-ascii?Q?ejtH8eG+y1JAv7c60VxFTLbZaan42fIrQ4Ht+3xsgDcPBsz75Esp7CN3+bMr?=
 =?us-ascii?Q?mmAopwKXQU9hmUgQutn8P5U1PKMKwGyPHUbODSYSGBf1NtoMFTVQ7yP+r4KO?=
 =?us-ascii?Q?eLJWmCRRNssyLxEsUSbLw/nIX31PfpzP80OxxQIjN7dXR5+eWA7QaPUHUxrN?=
 =?us-ascii?Q?eu+pzXiNNIjERS1d4KFI0EBMZG6CYo/gqQ+6tU9iA6iMdB6+NK9m9D4FbDUU?=
 =?us-ascii?Q?nMAMupKfPPknKb7P3Mawa2yiW4EF2o15pJRbuuYX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e122b7-116b-49ec-db96-08da70695505
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:18:12.8076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUHjGMhFxkTB/QGy2WCt9r2AHbSwJxuWmEL68dCbBB84dTGSP/1X9g/AQp32xQLR58U5Z6kvzT8dlaDIASNA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935

Hi Igor,

Appreciate you for the reply!

On Wed, Jul 27, 2022 at 04:19:30PM +0800, Igor Mammedov wrote:
> On Tue, 26 Jul 2022 15:27:07 +0800
> Huang Rui <ray.huang@amd.com> wrote:
> 
> > Hi Anthony and other Qemu/Xen guys,
> > 
> > We are trying to enable venus on Xen virtualization platform. And we would
> > like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
> > options on QEMU, however, the QEMU will tell us the "-mem-path" is not
> > supported with Xen. I verified the same function on KVM.
> > 
> > qemu-system-i386: -mem-path not supported with Xen
> > 
> > So may I know whether Xen has any limitation that support
> > memory-backend-memfd in QEMU or just implementation is not done yet?
> 
> Currently Xen doesn't use guest RAM allocation the way the rest of
> accelerators do. (it has hacks in memory_region/ramblock API,
> that divert RAM allocation calls to Xen specific API)

I am new for Xen and QEMU, we are working on GPU. We would like to have a
piece of backend memroy like video memory for VirtIO GPU to support guest
VM Mesa Vulkan (Venus). Do you mean we can the memory_region/ramblock APIs
to work around it?

> 
> The sane way would extend Xen to accept RAM regions (whatever they are
> ram or fd based) QEMU allocates instead of going its own way. This way
> it could reuse all memory backends that QEMU provides for the rest of
> the non-Xen world. (not to mention that we could drop non trivial
> Xen hacks so that guest RAM handling would be consistent with other
> accelerators)
> 

May I know what do you mean by "going its own way"? This sounds good, could
you please elaborate on how can we implement this? We would like to give a
try to address the problem on Xen. Would you mind to point somewhere that I
can learn and understand the RAM region. Very happy to see your
suggestions!

Thanks & Best Regards,
Ray

