Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF84429E1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 09:52:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219796.380794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpWj-0001St-DB; Tue, 02 Nov 2021 08:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219796.380794; Tue, 02 Nov 2021 08:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhpWj-0001Pg-9n; Tue, 02 Nov 2021 08:52:17 +0000
Received: by outflank-mailman (input) for mailman id 219796;
 Tue, 02 Nov 2021 08:52:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XxgO=PV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mhpWi-0001Pa-Fd
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 08:52:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b85f73f-1736-4cac-ae6d-ca5e18f26cca;
 Tue, 02 Nov 2021 08:52:15 +0000 (UTC)
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
X-Inumbo-ID: 7b85f73f-1736-4cac-ae6d-ca5e18f26cca
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635843135;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EqwMoWUditxCMawvypIaritpapaHNyfhoOY/9qXuGSo=;
  b=Xp6Vdnk7hgL+dbNwT+ymEZ42dRPa1WHx/dV/f0oAIeD3ulEPCnRfMQXA
   y60qZKZBCyszKA9C8AYKXRVGFtlnYDtEOQBRlrMnY/IPLvitOPgTzgqNP
   PpYnFfqoCPwLFrMZ48WG/n9I316A5pkpuccVhu9EjzSSTWHYojTnDy7+i
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VyN4dSa24eUERC2rmzimoNZfw9+cKne2uMGuGcQ2ZaAaDnGJNDbOaj6bnusEKLgJP1hhk1mQ0J
 INisr2jVBzM0aI5G1H5OrpO1r5A6UCetAtmyk+Bq4i8DW02HsXWLbwnGhmbCCnqAMfBPQ8WbJb
 S8Go2vTZTyR7gmZtE8Bqum4X+gq/hlup5+1hrZyM8aTbOW6+XjgHZ7GoZFqj6u3t0FU4Tcor/R
 TPYsyhXdVl77tsIXLou4QKfnwM7l4XWgWwJNZozNokZBhPci+ROwma5C+Pw5M03F7JwwCNCw97
 4hcQNQOzf31zTgqpShwDlfxU
X-SBRS: 5.1
X-MesageID: 57247953
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r6HwmqCOT9GQ/xVW/0Tlw5YqxClBgxIJ4kV8jS/XYbTApG4k3zAAz
 WQYUDyEPqmLYjShKI8lYN+2o04BvMTRxoRrQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540Ug7wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/kRWjkflh8
 Mx2rpXpcFx1DI3pvbxaTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqQuYAJgWxYasZmGO6GW
 ck9bTRTd1fSQS9OeU8uGqxltbL97pX4W2IB8w/EzUYt2EDZywZ7wbX2MN7Yf9WMbcpQl0ec4
 GnB+gzRPBYeM9COzCufxViljOTPgCDTVZobEfuz8fsCqFaUwGoUChEfS1qgifa8g0+6HdlYL
 iQ88y4vtrQ79VbtQMP0WRa5u1abshVaUN1Ve8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8vT60fCQYM2IGTSsFVhcepcnuppkpiRDCRcolF7S65vX3BDXxz
 jaivCU4wbIJgqYjyKGT7V3BxTW2qfD0ohUdv1uNGDj/t0UgOdDjN9fABUXnAehoNqazQHCRh
 GE/gMHH1btSP7GosXTKX7BYdF223MqtPDrZiF9pOpAu8TWx5nKuFbxtDCFCyFRBaZhdJ2KwC
 KPHkUYIvcIIYiP2BUNiS9vpU5xC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyVfQPINmeHb51PVoXKsYWnzq7qXfTlEzP7FZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eMrNFCdwhVdyJiWfgaTvC7kMbZe2KK/0l6U5fsLU4JIdQ5z8y5aM+Rp
 hlRpXO0OHKg3CaaeG1mm1hoaa/1XIYXkJ7IFXdEALpc4FB6OdzHxP5GL/MfJOB7nMQ+na8cZ
 6RUIK2oX6UQIgkrDhxANPERWqQ5L0/17e9PVgL4CAUCk2lIHleUp4S7IlO3nMTMZwLu3fYDT
 3Sb/lqzabIIRhh4DdaQb/SqzlirumMalv40VEzNSuS/sm21mGSzAyCu3PIxPe8WLhDPmmmT2
 wqMWE9KrujRuY4lttLOgPnc/YuuFuJ/GGtcHnXasunqZXWLoDL7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB+o4cHmL1MVCrINXwbpdtVfkU
 06D4IACa76IJNnkABgaIw98NraP0vQdmz/z6/UpIRqluH8rreTfCUgLZkuCki1QKrdxIbgJ+
 +Z5tZ5E8RG7hzorLs2C0nJe+VOTIyFSSK4grJwbXtPm01J51lFYbJXAISbq+5XTOc5UO0wnL
 zLI1qrPg7NQmhjLf3YpTCWf2ONcgdIFuQxQzU9ELFOMw4KXivgy1RxX0DI2UgUKkUkXj7MtY
 jBmZx9vOKGD3zZ0n8wSDWmjFjZICACd5kGsmUACk3fUThXwW2HARIHn1T1hIKzNH7pgQwVm
IronPort-HdrOrdr: A9a23:3GD8M69RNeCAwkb47JZuk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.87,202,1631592000"; 
   d="scan'208";a="57247953"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pzch3j/OlyFk993sh8f4lSzWXRbeiZti4AyNXZs3txUr8k5G+Tx8VAmd8I1+WVU6cCVhKSo62F5quymnknwwVLdk7POrd4SGhUfGQMNXxMhz2up/C4FOn9iBWAXRfCpy+aSoyBda/GiNpU+F2T/WWfc0hqVd+wP4KsnvUDp8K7J1kd1SPmC+2EVqSO9+0p1/qhA4fwNJlkWG2zN2m8cAmkEMQjNR0DQVlZYqR8opxZGEWxVOsgsr9oMg7d70FSQCeaZMvhwTBaCpP2jhpm+PDExfSCS6XosQ/c0y7Ax/XjsyP1sJpW6ICJnzlKxteKfsPEchLJDS/3sHD0ej6WrUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pafBYG9+Xpvs4is8qW2Z5TuD8DMjZWZ5Ga3HyFe/Vps=;
 b=UIyAnoKoa8X2sTgIf+ZYdZYUWZ58LdWQz5b9a7gf+AR7gKs7lki0tcL+iyXfiBGWssgFpFN7EAipDeP8iN8q6WvKNClI4+PYPVgmLhK/NB0+D57fGs5uzSAOIm+yrRJpjXGDZqe5UTFw6gAX5Xhz+2V1KgGrtEsRPtcZLyU7Jj7ZwG4X3DWcgQeggX4VQbPWbR+gr4JemRMYBWaICQCuw9HW4AclSZIaD/97rug8TsFaub2vbDMa66BDCNp8KmuNGzCuQn8Nv9uTgHjpV/PNE1vN90rrSaFnj/X0PwJ756GcpJaWsXCxhp3T3WDu7wjJOSZeYGAJ4y0efKdTZM3uQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pafBYG9+Xpvs4is8qW2Z5TuD8DMjZWZ5Ga3HyFe/Vps=;
 b=BdxpmOJYDhAhZCTkkx7AHbyeNvIcTDruNEJKM4jizZViV1rt8PWrDVNNCrAXgeqYF1ShmUxj72D57Cu6YwtJ3Vt9dEYxryW2GG0/+vfj8yo5O2wHlUwUDLLHGWwrBKEwE/+2Z8yBZ8fh2m5DgSJgs+bhAMvDFgZI9p899CO0+7g=
Date: Tue, 2 Nov 2021 09:51:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jane Malalane <jane.malalane@citrix.com>,
	"Bobby Eshleman" <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Subject: Re: Arch-neutral name for hardware interrupt support
Message-ID: <YYD8L6MCrpytCkr7@Air-de-Roger>
References: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b34c957f-8439-709c-d8be-cc2f5111c342@citrix.com>
X-ClientProxiedBy: PR3P193CA0018.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be06b519-cc8a-4155-2338-08d99dde0b30
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3738E4E304801E3B11C11D538F8B9@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ViOpVvRk7O475rVVUQUJkp8Zf3eBSQ7H3gAiJ34c9B88MpYX/TqerxqnRzeA/M+39tRCmbHZb4F2wuuWPU6oudAZ2Uq0wb2CekS/8otrcMGs8y6ytOUSvDmA7vc+aiLucYbvzRqjcJIBqwINwy6ABTbaPKQAffLxplnOJTZg/uWJTCY8ZTVMFjI5ad9UrUodBCOTXevy3uOwVCEx9cqhpzYNKp0oNQSXjGLteBUElR4bzNZ6Q+l0awyoDBfIh55E36ylWdCs3TMuBH9wrbMCARk0bcVj+lB8XU76INlZC4jNMUtXEoNN6oDUoR9xoRZ8AmLOkcE6QQh29Y9Rq93KdLgbE+Yr8hk7AZ1JP+ODi4eHXSv7gsfFdF/aiLItJf16bBe9rTERyi/+fVYyj9hdPXCE9rmmHe65K+ya91Um7gkVpr+hMS4/gsJrSAdbYlL9Bxz7FYfXyBojje4sfKcd+MmPXnEnVPTMCQptlE9TV2J1jQNodqulYXfTddABO5zf2IxJ1pG0ZLlUAsPTn/wdImpH4lhqs/OUOOQRWhIW37agTieUJzjwJcboh3UbNbVlOuLzc9TNnSIFRwYY6qqAGIO4oa2ETAkFy8ZtUzKxVJ9OhEBaedIxek2w0iOQU1+tjR2XupzFt7SePFhcoya/5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6486002)(66946007)(66476007)(66556008)(508600001)(6496006)(9686003)(5660300002)(86362001)(316002)(38100700002)(82960400001)(83380400001)(33716001)(956004)(186003)(4326008)(26005)(6862004)(6636002)(6666004)(8936002)(54906003)(8676002)(2906002)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skp2bE03S0YrYUJObitSTUIzdjlYSTN0dmE1Z0JnSldQT0owTnhZQmVPU24v?=
 =?utf-8?B?ejZ3TFJIbjZ1Tm8wUGlNNTZzUnkvNWNnbmhIdmRpTUp2SVEzaXo5QWJ0dmx6?=
 =?utf-8?B?eUJENFR0M3VHdldDNmxvc0ZwYTJScVJsNVFrMElhVTZzbFdmanVYWWNCY2tr?=
 =?utf-8?B?ek54YU5Ec0ZMcERNYWVkSVZWNXNTSk9OWnBHOUVhd3lEMlN6S0o5YkNtTmpp?=
 =?utf-8?B?c2JDSEVIay9jVWNSVElrMGFZSGd5NU5XMjlUWlFXRW4wRjNuMW9zZDJwaXJP?=
 =?utf-8?B?TUxOYmdxZDR5TGErSnlFdHowQ0VQT0NsWjc3QjVxK3pEUG9Bc2RGYUVFc3pl?=
 =?utf-8?B?UThTeE9NbGlCSnZ0V005dStOdVJFZzVBUmN4RXVCQ2tNYk8yM0cyYUNjcHBN?=
 =?utf-8?B?dFZOQ1o5T1JKVjJiSHZkZFVmY29VRklMbjk5VGkzb1J0VTgvdVo0cUVUQmFp?=
 =?utf-8?B?dXhKZE5WeDRDbWR3akltT3U5L3B4QkdCTHZRUSt1M0F6SDVYcEgxTER2amVR?=
 =?utf-8?B?YzJtOEc2R09zbDN5TVVwRWlaaUpYTXBGMEpvZEpoNUh0QmUwanBFRW1rZnRH?=
 =?utf-8?B?ZjhNZzRUd0JITzlYZ05XMlQ2cy94dWduTGwwVzkwM3ljdHJYSFpudFJiWWMx?=
 =?utf-8?B?L2JZcTVLemFoajhUSzRQL1hyZzlkN3NST0ZRaFBsajllZ1dnYW9kdDB3QWNP?=
 =?utf-8?B?MDBBOHAwT08wQ3J0S2lrOHVJYi9DWmdLalJmZjVidmJhMFFDQmVJbnRwMEp4?=
 =?utf-8?B?NDZRcDJINHdYQk5pc1NZTkgwYmZsek1vcWUzSWhKZTBpTW5SS09YUXFmbHJJ?=
 =?utf-8?B?TFJIRkptdkYrdVdVNERFcHJPY3FMSnlySG04OFZvS2VqdUpyWDRxVmlIWHBx?=
 =?utf-8?B?N1UvK3Y4UGhwcGYxTzF5ZGMrZit3OERPMXRDQjRPd1dPTWpudk5OVkVBb3Vp?=
 =?utf-8?B?Tm5EUlNnV2dMZ3NhclR0THJXZWxuUDF4WVdsQmxvUnQvWWlqVGxwa2hYUzhG?=
 =?utf-8?B?SitHNFI0aFh0c1ZjQ3RTcXM3bXZRNDluOG94SGNFYnlzNDF3SUZ4RXpCNUlF?=
 =?utf-8?B?YTVXK3d1YVVwdnZiTE5IcHNKL0ZkY1h0VHpmVVhHOVpQaExTaW9Nd2w5MDJo?=
 =?utf-8?B?TVdDbG8yRFZ5M25EKy9kZjdRY3BSUElIT1dUOWZQNXFOOXg1SUx5Wjl0Yjk5?=
 =?utf-8?B?cWtsWExaT21tUi9ZNnIySVlCMW5QU1VGNUNsaTNmMzE2end5U0NHK2pZaDFU?=
 =?utf-8?B?TFhoSzk2VnVYTjFrVWp4My83UTBIRzZ5VmNrQnJXckRFU0ZXaldyTnNZRUxC?=
 =?utf-8?B?UVBhWHJXWE9sYnFxKy9iSXI5eFVBcDJ0ZFRyQms5Uy9PdXE2QnZHaEFtVTMy?=
 =?utf-8?B?OXBIRmxpVjZIeHd1LzY1dHhObDM1MTk3V0VFS245S3I4a0EzOTEvWUUrNHdk?=
 =?utf-8?B?QXlpcFBMaXlWN2ZkdXpKZFoyMEdjSERHK0JCVG5jc0NZQnZTeXVoM0JUQUMw?=
 =?utf-8?B?QjdaZDdsV1hyQzBKNldwc05kOVc3NkdtcU1OZHhXRTUvRXBDZnN4aDdlS21y?=
 =?utf-8?B?WGYxUGdkb2QvZ25pTGNWVHdWYXllRWZWamlQL3JRVDhHWnZSRUZ4QnZvRllH?=
 =?utf-8?B?UG5EdGhTS2N4UDNoRldJWXg2ZDFOcFJhMDU2SENXSXUvbHhpU0ZHakY5UU4x?=
 =?utf-8?B?V2Zqc2EvbUhQTFhtbFpEY2NJamdpd3dvUXhEY0R2b08zVHFtZytET0ZPUEJH?=
 =?utf-8?B?aWZUZzV0dk80UDYxdWVuQWltWjdEbVdOcDJnUldZSmpLWEcvNWVvZVBSeEYy?=
 =?utf-8?B?TDI3QUpkcnJYd3NCaURZYWkyMG0vTGhmS1p2R0RmR1JKamNxRzM3SC82Z2pJ?=
 =?utf-8?B?UGlTSnVPc2xhdE9XUy9pMWVlN1h0ZnR4WUY2YnlVenpDNXdxSWdsRGZjV0kr?=
 =?utf-8?B?OVRuWFp2V3VrdmQ5cWRBdmtlY0p5b0VtN0ZmM0ZyWDJ1aXlhM2pSTEREVlFt?=
 =?utf-8?B?STl5d0ZBYkNGQm1wcEVPeit3OVYvako0UUpHaW9iR0VSZ0RhclQxRzRIajE4?=
 =?utf-8?B?UUdNb3NLdWVYUDRtWHBUcU40Y205TXVxbXVvVlBScDZZUGd3OWpzSThLakM1?=
 =?utf-8?B?YlFjUEhiQUxFZVV0VENkQU00VzVNT2YrK2NiWVk2M0JUd2RJYzRxa2Z3Y0ND?=
 =?utf-8?Q?RmlHSUb+zG4arUJz0vEJ0rk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be06b519-cc8a-4155-2338-08d99dde0b30
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 08:52:04.7651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD9Zv41bBQJN/PmFkoKNhl0pxcRAxAWTZd7NqvQyeoTz4reVCc42OdMCYB+77XvhyTIFXwG95VkWhI9sUzEFDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Mon, Nov 01, 2021 at 10:47:26AM +0000, Andrew Cooper wrote:
> Hello,
> 
> On ARM, the GIC is a hard prerequisite for VMs.
> 
> I can't remember what the state of RISCV is, but IIRC there is still
> some debate over how interrupts are expected to work under virt.
> 
> On x86, the story is very different.  PV have no hardware assistance,
> while HVM hardware assistance depends on hardware support.  Therefore we
> want to introduce a new CDF flag so we can control the setting per
> domain, rather than globally as it is done now.
> 
> This brings us to the question of what a suitable architecture name
> would be.
> 
> Hardware Virtual Interrupts is a little too close to Hardware Virtual
> (Machine) Introspection, and Hardware Assisted Interrupts (mirroring
> HAP) doesn't seem great either.
> 
> Thoughts / ideas / suggestions?

Is this going to cover both hardware assisted interrupt
controller and assisted interrupt delivery (ie: APIC virtualization
and posted interrupts in x86 speak) or just one of them?

Thanks, Roger.

