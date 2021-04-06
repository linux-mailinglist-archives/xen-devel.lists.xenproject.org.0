Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7325354F96
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 11:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105729.202219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThiI-0001IU-Kr; Tue, 06 Apr 2021 09:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105729.202219; Tue, 06 Apr 2021 09:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lThiI-0001I4-Hk; Tue, 06 Apr 2021 09:09:34 +0000
Received: by outflank-mailman (input) for mailman id 105729;
 Tue, 06 Apr 2021 09:09:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WgwS=JD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lThiF-0001Hw-VE
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:09:32 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a879349-f200-47de-9be9-8e3efacf9c5f;
 Tue, 06 Apr 2021 09:09:30 +0000 (UTC)
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
X-Inumbo-ID: 5a879349-f200-47de-9be9-8e3efacf9c5f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617700170;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VNu3Oxb0+wnZs4qKmrS/q4mFGlDFsROdeBbj4/ByVT4=;
  b=O7KKIONIYP8J2FbrzOX0MU/5NxHxzsakt9c7uqYPit1V00rrygr5AwZx
   0PGnBMxucsgxq9M2XBGspIfTo2VGCiprPmLhTcQ+3JAJxNWa5d/Mc/snX
   Dz7hLRQOAxR8rOXjWr4WB0Q0NVTwF6lUIzsy40903cPYOEy4UAP/RHnpf
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: KjS5IpdQ5jlXtWB7FqaBEtSmtknOZjyadZOVxQ9cRTSSopydjPIGRZyozBe7FhbmLpUqNcOGeD
 Nos5Wkq4OLFtBs6qv23wWY0YGSp3Bp5C8qQdKv6yTHqtJ9MycX3vjAE/v4kqi/4pmFczo2xWkB
 DuZtA8ndGyTciy5wYY8ZOdhm5oENGbkeDhF/7R5HRaRDuBA+PhiHwELzh4U2TZBfHJos9t4vJs
 f2DSSVI9hgz+dtcoEiMZ6Js3MjXG/4uhWVtsbpyxxj7hxdxzSLtKox7kN5H/LiVpGmL846O7UU
 mZg=
X-SBRS: 5.2
X-MesageID: 40938035
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:n45OhagzEBTRt9P8W5/WrFvOGHBQX7N13DAbvn1ZSRFFG/Gwv8
 qlkO0HkTr9jzgMUH8t8OrwX5Woa1m0z/FIyKMWOqqvWxSjnWOuIp1r44eK+UyHJwTV8OlB2a
 B8N5VvEdGYNykBse/W6BS1euxQo+Wv37uvgY7loktFbQYvUK146hc8NwDzKDwTeCBjJb4UUK
 WR/dBGoT3IQwVrUu2eCmMeV+bO4/3n/aiWAyIuPBIs5AmQgT7A0teTeHKl9ywTXD9VzbAp/X
 KtqX2d2oyYr/q5xhXAvlW8071qmcDswtYGJMuAhtl9EFXRozuof4hoVvm+uik0qoiUiWoCrd
 +kmXsdFvU2z0mUX2mu5TPxxgHr0V8Vmgbf4G7dpUGmnOvUa3YRDdFbiYdQbx3DgnBQxO1Uwe
 ZMxGKWt51eEBPGkmD8/rHzJmpXqnY=
X-IronPort-AV: E=Sophos;i="5.81,309,1610427600"; 
   d="scan'208";a="40938035"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck3cJktkKirISMHpSGmISpWGVlSipjdm9xI14M54jIIITBmN3JmI6yxHsLV3OsC4yZ/RfEs8Nd767H18jefqtUUJdo/eTK9kngDOxRpYw6g4lMEfngfAMQA4oARWC68WGy+RUG733jXjWbjQGHFGbqtfcwQnfwNcScODNxLdsYtfPXXHW1gYPJB8X4i9oYPNqtLHLAJHjD+QVvb4np/CaZX/Kbs1H7Om0PsOuDE3feymmf7Tx++bdKz/rT295uLZXCxLBcI2lh5XtBfKxOra6U3wajqAAF13EW5GmWlTTjavz/lNeHNLwEqxCWPDOph8UVN4COsIBVtoOdApMdIdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z7WMDrE7g3ZUqn8Gbw2JUMn4tnRJm1w3CiFvtFGwbU=;
 b=Fzz172QEK0KAy/z+4RPY2j4y4w9Pq8NIYfRy8VdgRjo8UlxTTGHgMJh/D8xv8FDhaO4pg2SIY+XJ29GF4Hedxa+j/8cjUuTraRcOkHsT2TkjgkkS0FyhAz4XycToFZ0PMoUfPKsmx7hnJjMfglMHoZQ7O1sZX6NR5bhmJhI49AVTgCknB+fww84C3o+aO/GVQ64hyXfZhA6ho3bgDJDuDMuJ7D7KaAS5BdWoYZQlSFMl/iwLkOisfoO39UAWboRkc2JawD8cinMgHRAtgukohFxnuJyiLgQtoOmzVqtpUpZw7mDkQghJOlU/6RPYrnEI/5eBf3ytCkkCdc7fPr2xfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z7WMDrE7g3ZUqn8Gbw2JUMn4tnRJm1w3CiFvtFGwbU=;
 b=pFN4WGflltsAi/Xr2sRwQN+cw92vNGzoCY5Hlo0CGBLMwX1BTp8FtoIZUpQtKpIYC8WUG7nrolVUrEfbEYzjMiMupuI77M23bxoLzJMmtPpfgiw5BvVcyPC1dz37xRrV9tU8znbx3JNTJgaqVzvKjnoa8vV0G+X+OOubswIxkSM=
Date: Tue, 6 Apr 2021 11:09:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Lee Jones <lee.jones@linaro.org>
CC: <linux-kernel@vger.kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, <xen-devel@lists.xenproject.org>,
	<linux-block@vger.kernel.org>
Subject: Re: [PATCH 10/11] block: xen-blkfront: Demote kernel-doc abuses
Message-ID: <YGwlP4hf5Nxgdjn+@Air-de-Roger>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
 <20210312105530.2219008-11-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312105530.2219008-11-lee.jones@linaro.org>
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db911e2a-8520-4476-3013-08d8f8dbad98
X-MS-TrafficTypeDiagnostic: DM6PR03MB4476:
X-Microsoft-Antispam-PRVS: <DM6PR03MB4476D08BCA996628A7BE5D7B8F769@DM6PR03MB4476.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NB6ewCwzTzxrBmCk7Aa0YxsSwzzU+++x4rrM///D2KnhYVwWDdSzJkt95tBWOCtm+3we6jD4Q8b+NAvIhYRnkpouRiMzt/f9aspu+Fb+UCKUofLtIChFohLyZrqFIzTz0ka8nQdALooSFjIX1M2x4M/5yv7e4dawyFhr8cqy+PLedjhI4u7VyXigfEIY5EJNjE9k0oz1kL81EbyILQ7PCwp3phfs7f+pqh1Vxo4pyuImd1h9DSjrRxag0LKF/4OvnYQZgap8+I4kHt3v3p7Is6s15O+oiz31mhpEASZ/0uYWjaboE5jr0/9sWPLpldrRGrYJBJkGuTuvMmrwyzwxyA1XSoOwuimDUIKvq8eIZTtWbY5Nya2hHx67s3Od7DjXSRmP9/D1goIWdzvnZcJplwmmwDeHZajoaUQwe7tDqHWZ+MhgBvWlKgFKaWKLVFTdGnguLlZ4CdwNo0UWeSX3ppA3L6xC/TK5J5jOx3iQUH3ulODeqHccFsaBVq80XrXpkaBqrdQzNU3WWbqmpCsVSUTF8PPE/5B7q+cDTgGADDssBikYBMFwgj8csFKpYqftVWikqVRMa/M7f+b1DwVYHdc10KQzj6Ur892foVQwr3ysEl5AVBCRVBhfYvgtHW8Yb4lg/mFuEGN23wEoV6C5ccBLiNpJEYRzozHdhlZQz8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(39860400002)(136003)(396003)(346002)(376002)(4326008)(66946007)(85182001)(26005)(66556008)(8676002)(66476007)(478600001)(186003)(86362001)(38100700001)(83380400001)(9686003)(6666004)(2906002)(8936002)(6496006)(6486002)(54906003)(5660300002)(316002)(33716001)(6916009)(16526019)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkVtajM3T3B4bTJNWkhUaTRFMHNybU9kMFVPcXZzUSszbEJ0UC9UNVM4VnBV?=
 =?utf-8?B?YUgrSlRPQWhKUnhoQ3ZlQklmS2o4ZTFmOHJqQVRsN3JpQVQ5RnpTRVJjT20r?=
 =?utf-8?B?Sk9vQU1vNEx6SmIzRytSdTRjYy9zRnZoM0dzRW54VXBXb0Z0MlpQT1NCV2ZZ?=
 =?utf-8?B?bTY3bFFtYjBUTTltVnlvK1RBN0ZjWWRaWUlraENydklYcDhmdENKS3UwNHdz?=
 =?utf-8?B?ZmI2SWMwQ0U1bU1kYUZheGVPUE5xMDNHTU55ZnF4eldZWlBEclJURkNFdjg5?=
 =?utf-8?B?enVtUUprZjBUNDdNamxKNmx3bnM0VmxoT0VZNkNPMm13aEY1ays0R2hMVGVN?=
 =?utf-8?B?RU1FaVRzMzVjUFZhRFJFWUxFdUFlTjZEaDJWUmc2WXUwSks5V0toMVdCTzBl?=
 =?utf-8?B?Y2V1MFdHalRZNXlhS3kxM1hZYkluQUc0NTd6ZmVWUkdTVHJ1dy9CZ21TKytO?=
 =?utf-8?B?dE4wMi9VSFp6bUhtVEpGL2tVQ2VrendjZHl2NmhueTh2cjBDWERkWk56cUsr?=
 =?utf-8?B?bnJKYzkzRXAvM09XS0VLWjRoL1Y5djUyZktKQXN6L2p4RlQrVjFMSlp6bkhS?=
 =?utf-8?B?Yk40Rk9sVFdlZStzOU5nUWNWNE5yVTdRaFFKMnlNcFZiZ2F2Y2pxQU5nV0Fm?=
 =?utf-8?B?dE9QL2lmLy9LQU1nTVkzUWNWMWFNLzFxWXMyVU55T0xEdkR1Qk5jWVByZENR?=
 =?utf-8?B?QWRDYnRxNEtWRFgzVmhUNklNeTFQdk9LY0l4citjcWZLZVFhelRMUzAvZjJs?=
 =?utf-8?B?SUo2d3JyS2xIVWdyUE9xQ2ZMTjF2UUplczdVczNTOVFoUjFhWlREK2NrcVl2?=
 =?utf-8?B?bWY0NGs2bFE1Nkt0dVljdnMrcjAwTjJGaVg1UGRNWUdZT2FDNGhGQ3BacDJJ?=
 =?utf-8?B?MnNoMWtFRE9mM3ovL3dCUHpPMmswRmJkR3hWeDFkMklHNE5LWEVXbVVyc211?=
 =?utf-8?B?OVYzQ3pPaVVVWGlRWXh6Z1hKNUJIWmhaYzZ4eUNLZitrbmlmd0FvUmR6cExF?=
 =?utf-8?B?citxaE9zWHlabkxWdXdMWTg0cEZ5OG5raGpUT3NHRHZJenpoOEdiWkhIZUVW?=
 =?utf-8?B?MkRWYWxvNDN5bUIrLzlVTWlza1lrNmk5UmJGUHRCVHIzQnJiNGNtOU9oN2JR?=
 =?utf-8?B?WU9nU21FNFlUd0k5M3ZYNE04dnUxZjdwV05PWmczZ3hFM2V4V3hHNXNTY0t4?=
 =?utf-8?B?bnZRYy9qUmwvWFRYNTFoRnNRWHh1UmtnWWlCQUVpRkdxWXhpeFpmWUU2bGJZ?=
 =?utf-8?B?ODZmdVlUc0lJckE4ZC96OFhuUXYxZExuZDkzV1RKcy9lZ1pYZW9VMGVIZ2RE?=
 =?utf-8?B?S0VkeXc1OWdLanlKRkdiWFFYTmpJbjYxelQ0Mm1wN3ZrSmVtN2RMMmtwRU1Q?=
 =?utf-8?B?dEdodEdtZFVMaVlGaEp2WENsKzhFRlNtZTJiWEltZ041MlM5b1dxS0tha25V?=
 =?utf-8?B?OUV4bTRObmxPSnVwYkhtcFAwTmlGMWl0RTRjU3dIZ1ZYVFlMWGdXR2lUUCtx?=
 =?utf-8?B?K09CZ00zVjBObGdrKzNWaEdxbmk0M3lUbTdlc0Z2d0tjT1l3S2hYMnY4RlVT?=
 =?utf-8?B?NjN0ZThPcXArSzdFdE9id1BoRHRFTlgwV2IzTEdieUFxcTlvOVVYUndscWNi?=
 =?utf-8?B?T3ZBWXg3MEF3OW92L2dHVUMyOXgwNTdjbFNLNS9mcnlmR2Z5Q0lXdEwxeUc2?=
 =?utf-8?B?ZzBhMkJDanFvaGFldFErc2dNOUh3d214SThlamZrdGlMN2JuUy9uUGlFcHAv?=
 =?utf-8?Q?ULTzxNMYyndxc5cGGu0TfwbbzaMcxCMELdg6Ldq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db911e2a-8520-4476-3013-08d8f8dbad98
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 09:09:26.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TSWjgtC1ggF6EDuoJF4clzV9NqlRstH6nuTAL9A/bEK2bfHePB5410dK04WEPFKJePKalo00/uxHCClAty5zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4476
X-OriginatorOrg: citrix.com

On Fri, Mar 12, 2021 at 10:55:29AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/block/xen-blkfront.c:1960: warning: Function parameter or member 'dev' not described in 'blkfront_probe'
>  drivers/block/xen-blkfront.c:1960: warning: Function parameter or member 'id' not described in 'blkfront_probe'
>  drivers/block/xen-blkfront.c:1960: warning: expecting prototype for Allocate the basic(). Prototype was for blkfront_probe() instead
>  drivers/block/xen-blkfront.c:2085: warning: Function parameter or member 'dev' not described in 'blkfront_resume'
>  drivers/block/xen-blkfront.c:2085: warning: expecting prototype for or a backend(). Prototype was for blkfront_resume() instead
>  drivers/block/xen-blkfront.c:2444: warning: wrong kernel-doc identifier on line:
> 
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-block@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

