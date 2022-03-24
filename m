Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64334E6645
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 16:46:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294447.500695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPfB-0008DI-JP; Thu, 24 Mar 2022 15:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294447.500695; Thu, 24 Mar 2022 15:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXPfB-0008AV-FT; Thu, 24 Mar 2022 15:46:13 +0000
Received: by outflank-mailman (input) for mailman id 294447;
 Thu, 24 Mar 2022 15:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7/3=UD=citrix.com=prvs=07544547a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXPfA-0008AP-6a
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 15:46:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82fb3bfc-ab89-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 16:46:05 +0100 (CET)
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
X-Inumbo-ID: 82fb3bfc-ab89-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648136765;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=H+l7RPMUpLiRE6PodWN8JSkqB+vPEnqxwvWwQAf8I6U=;
  b=TohDD6TUeotuFQVY2EFXsz9cyZyLsqnTQaz7BDbWtjNHsraagx4boYJE
   VTA2vZWXTVHGaUe3WwQRK8Tv0aNvcrIV+gTuhgk7Kdj3cO7ti25dP7rpi
   rlCr14OHYDb8/z9xleTZE14iCanWUActEP+te39/4M8pi98y+yRAmepU6
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66532033
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kHAj6Ks5gZ2Temlq1HsNr0VeYefnVP5eMUV32f8akzHdYApBsoF/q
 tZmKWmOPveDNjOjL411Yd/ioEkOsZ+HzdFjSgBkpChmQS1H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jX5
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9qPu7IoOgZXCIILH1iballwbPFAiag5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 ZdCM2I0N3wsZTUTOldPE8MGjtuZpXfENCx0l3WkofMOtj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWPz2kaEzUKVl+2p/aoh0r4UNVaQ
 2QM4is0pqE2/Ua2ZtP8QxG1rnOCshMGHdFXFoUS4QCWw6vQ6i6TB3QIQzBMbtArrok9QjlC/
 k+EmZblCCJitJWRSGmB7fGEoDWqIy8XIGQeIygeQmMt/9DmqZp1ih/JQcduFIa0iMH4HXf7x
 DXihDc6r6Uei4gMzarT1VLNji+op5PJZhUo/QiRVWWghit7a5SifJeA8kXA4LBLK4Pxc7Wal
 CFawY7EtrlIVMzT0nzWKAkQIF23z7WFcznkjVpgJMkeqyj9/12acYJzvi4rcS+FLf04UTPuZ
 UbSvyZY65lSIGamYMdLXm6hNyg55fO+TIq4D5g4evILO8EsL1HfoEmCcGbKhwjQfF4QfbbT0
 HtxWeKlFj4kBKtu11JarM9NgOZwlkjSKY4+LK0XLihLM5LDPBZ5qp9faTNii9zVCove/205F
 P4Fa6O3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaOBme15K9c7x/kF/gstw
 p1bchUIoLYYrSeaQThml1g5MO+/NXqBhSxT0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk8ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacZcFl4+XZeMNJpCDTqZ5BAgpQ67ZGORSvF7c0Tw6ol6bSv3i/48OcYXLhvfgDCd0
 m6r7d0w+YEhf6ddHAH1uJ25
IronPort-HdrOrdr: A9a23:EEjMQqt5cSVS1cVg1ZKiY/6A7skCmIMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,207,1643691600"; 
   d="scan'208";a="66532033"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqWzvOvpTO5//FPYUiEn8/EAjpDdDJ3p/c4m+YodVEkL4xGrGNeIEyjME0Qplxz9AXxc92tYNgIKOh+eklOFgZILP7+giazgb1r/1pQR89mTXkFCPOUG3Ln+foqwqy0JK7npyORmrtmSCUegSa12dUds1Bqz0agQ7boYkKR26hmPOgAmcymEY2ObUEJYryeUp908G6icsFnMJQLDk1GMS+rcdjxVnGd/uzm0nRvkK2cc4IKjbxU9mupaTKg+LRS54Mst+ChliGeIimn9dwTTaEDr1QURJ4YVgLOOHftAKP987wgpkgJS3Z8kvjXSUYr/ldfx+SV39x8kckcvp8F8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgaAqxvU1cViA0guGwXU/j3AdjKEtIfn9g5W1kvmekM=;
 b=KyDwA+PbE+JyaXOySf33BM4siGXzQ+SkFdWbImuLPMNda2jVM4Hv/CSOYh+qve8flu3lGebb5hEUtWYKvv+DbgfSXmmZ4DGPPnk215Vo6gAnGqxW/Vz2gQRqf847PaZMTzNGENcMP5edNBOeSmOPusu14nCiplucEVF2XZDD/NanbKSMyHh15xss/5A+4oUzorhtMlDzxzgyqMR+KFYjrBdnZdCc6/7yAUFXWQP7hoOTdpUfpMGjP61Hv3N79S+hb/klF42jJ9ydFOIEtIIE+jIWxt3o9ry25f6opHBeB07qrCXDUiBLqVwCCfwE3rzmD7eIDkIkXJyq6/yns0tkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgaAqxvU1cViA0guGwXU/j3AdjKEtIfn9g5W1kvmekM=;
 b=KEXxzUw+kltLfyuhX2NBqNIIBYCr7kP3uuhbqQsmyaAwDqOHd9LH1mGuo9Lxpyy2LxMNIOX0q8HfQiq2u7UpFc/AOm0y0QDJkfjuI4XNP/bq9JlG8A6HRfBS2rBEPQ6l/v9zEonDvvfjyp7a/Rc60ZuQ8a7ao7aBFQs3P7OWnsY=
Date: Thu, 24 Mar 2022 16:45:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: Re: [PATCH 3/3] x86/mem_sharing: make fork_reset more configurable
Message-ID: <YjySMjegTNFBE5RK@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
 <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb437a16517d343ba3432aa64b9e14b34630a750.1647970630.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8439b7bb-fe19-42d5-f057-08da0dad648c
X-MS-TrafficTypeDiagnostic: BN9PR03MB6075:EE_
X-Microsoft-Antispam-PRVS: <BN9PR03MB6075F7E4157BC8BAAEEE26628F199@BN9PR03MB6075.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v48eJG69UmjiZ16wRw49LsFLrZ3fO03VSabZY/ye2vKwOtCB7WETQ5tQLcqZojP+S64WAUAikusirBhJbgwoaZw+4GQlULh0C0O5yu+uLCLMNagQbxUw9hVQSD7Oaqma2HbJ/iC/g6IOKYBR4tKKSzL95luMPfIhtS+E6KGV8MnCbhMDyVrAKgyyqfRyDEY3yWfaM0jOVeGhW6aRJAVHXdR0Esn5BO+4ITRCkdL1vGa2MgtKiIqDOvLhRlg3N7xkHvyzKUsjJYK8H0BmuRc7wQSz7ag/UqeILTcYZaLJrRrt2I9v62SSd2TSTtbg2pc9SvioqI255ijshuZuM6/0Q7kb2HSTJq06+NRWptzL9HP64CVDwm3rVHF7gxmNQcSZwYEWku1ad1H6WtBfAhUBlrFZkwSTx1RtvD1WA318fdWu+szhDmOF/c+90LOFTR+qWlQhY9OaJKFv4tTmSgk+FI6U+pWj2pdx8Y2zHC509LdTx/UVYF/KwL8WnXsjA7CodkWBpskcYts7iW4E1/zlzcfLQVzvUyxR/Tje6uDGhB0l/u1oR6MA6QYeLsxAziw75gJU5pORvtHzp2SXhvoQyueg4zBRC0SKYbG2JJsVngReBaBS4mcYUUwonpKen3xaJGVqcfXyC968YiZgpDGJaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(66556008)(66946007)(6506007)(66476007)(82960400001)(85182001)(9686003)(8676002)(4326008)(86362001)(38100700002)(33716001)(186003)(26005)(5660300002)(83380400001)(6512007)(6916009)(7416002)(8936002)(316002)(6666004)(2906002)(6486002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG1hVmVHMGZ0Z0R2UnVnbFY0UWhxbC9lb1ZvbG95dWpQTGNyeTlpWFNTN1hU?=
 =?utf-8?B?ajFUSGJ4dGxMZXpuUldFdC9EakhTT0srQzRGN3dtSnN2VXZDVTk3c1M1KzNR?=
 =?utf-8?B?WEpXNmFueUpzVVlVMmZVZnhCblp5OEVZTlMyeC91QVpZbzM1eTcrU1B5Sy91?=
 =?utf-8?B?Wi9xTmVvU3pQYnpPNXAzMHQ3cFpiRVBUSWE1ajQ2UUs4Rzd6VlNCblorTWVW?=
 =?utf-8?B?Z0xZbVk1WE5WUjJxdG5CTzJSVjVrU0RUVE56b3A3ckpBNFJnWXQ4amszTnpO?=
 =?utf-8?B?Q256cUxBeFNhUVhFaG0yRVhZZnUrUjlEaUZhby9sRXNNMGoxRmVnTjRtdTN2?=
 =?utf-8?B?WGUvS3NOaG4yeUR3TEVDQzRwYlRWR2tWak01ZUltd1EwOFFNeUNjYU9McjBY?=
 =?utf-8?B?aExyQU9jbExIT3ZJekp1ZFl2ak0ybGVZQmJjWHFGT09TNG1QQlpJWkwzSkZF?=
 =?utf-8?B?K3I1dk56bjRKcndKc3VzbUw5Y2NMdW1saUFGR1gzd3ZFald4VzIwNjhmRndo?=
 =?utf-8?B?eTFpTnFrY05PNmxOeGhYeW9jQXVVbCtHOFF6cERVUzVTVG84aVBJaEN6b1Ir?=
 =?utf-8?B?ekRjUHRaRHpJcXhyVHFyeG5hTXZrN2ZhMjV2Zy9VZEo1SDJ0b09CY3VXUE5l?=
 =?utf-8?B?S0xtZUF0VlFaNUFzWlFuVUtGZlk3SVd5Z0lOSlJXdUQzYS9lK2xEMFdsdkR2?=
 =?utf-8?B?alFWaEFvdGNURDUrejRvWGYvVW5PYlhKQThNWFFidUNHNDVEWXpXSnFvcW1G?=
 =?utf-8?B?TThPM09hamE4bXlBckxEdmx4RWE0KzU4ZlRHRnc2bjJDMlg3ZVNlUnFWaTMy?=
 =?utf-8?B?ZVNSUUxQQU40ZkN3YlpGaDM2eXBmUkV0MXRJc2F1OEQxRHVPejQvUUx5RlpN?=
 =?utf-8?B?ZG5Bb3BLL2lCZEtPQW1WNmxrT1BxMm5XT1dxdjlzWm1taE9rcnlKOTBveTNj?=
 =?utf-8?B?OTdXN1FWOFNGZkZHNkVXa25YMTZmNnQvVXhxV2dkUFUyNjdTYWllWWpoVWRK?=
 =?utf-8?B?dCtsOUxXVWlOdWE4NVB3a3ZPdUZ0Z0pGQ2xlWE9vZjZkWldjaVBzSnN4K1dZ?=
 =?utf-8?B?bU1WVnRhcEZpY05nbUdKZDQ1anBQQUNjU1I2bXBKV3BHUnJ1eXc2dE52NjEr?=
 =?utf-8?B?TXpUUXkyZnZqZ2p1ZDMrM3czVXU3dEdUallHUndXYTg5MTd3c0FtWk94OCsw?=
 =?utf-8?B?Ni93MG5GMjFVcnF0OUZYRGZPa0FTMkJwYmhwWDFVVlpURm9aTTF1a2dhQjhG?=
 =?utf-8?B?Zk5mM1RqV2tKdEdXR2Z3ZzhlK0dKWGhWS25yY0R3ZU9KSG5XbWowTkJLM0NQ?=
 =?utf-8?B?a1FQUUF2WHVZM0lqOEgrS0tITi9UbmxHMGtZcXR3TkZuaTk3cEpoZ0F1T2VN?=
 =?utf-8?B?bTRlQ3JlN0tkTDlzazBmQnF6ZGV6MUtoZlc2aG5PZDl5UFY0cDdtZlFFTU5V?=
 =?utf-8?B?aldDZ1VZRGlSczVvQllJRmdLN1duZVRseG9NMTQ1RjN2Nnd4S3c0aE0wSFB0?=
 =?utf-8?B?WW02bElqbzZ5OHJPTnYxRUwxR1plMFExbVVlbGdjdldpYXpFZGszR1ZvRUNN?=
 =?utf-8?B?UHQ1aG9yMyt1dkpGOEpLcWJXYjRzK2pZUkozU1V2c25rRDBTOVltMjFBeWgr?=
 =?utf-8?B?cm1WdjZKK3Nsa0RqMmo2ZU1ZUGdsRGwxZU1ZdjN0bGhWSVJ1cENzNHRhZExB?=
 =?utf-8?B?VkVUOGJHZDlRZXcrVEVkUDhsY2dPMVJ6OExpa09Qa3d5MHhBSi9yRzY5b0g1?=
 =?utf-8?B?b2JmdnJ5MDZkRmVCd0I3VEpHaU1hNmZmcnhCMnc0eXhkRENYWU1INTBBMDhp?=
 =?utf-8?B?b0FtYlFMN2RxSytqYllsVU1oQndnVlZERHFHblg4VGdoYVlMY2ZsL1ZWUzlV?=
 =?utf-8?B?UHJXcXBqempUOWM0dXlQdzBPU2lnSWYyWGNFQ3laZHQ1TmhDMDBrMTliMTgx?=
 =?utf-8?B?K09tR3ZrQm1GZXZRN2lTUUpaczdBSnk3bHpuVGVvdmZrYTNRUDR6ZzBnWVdq?=
 =?utf-8?B?U05zZ1hSOHVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8439b7bb-fe19-42d5-f057-08da0dad648c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:45:59.6464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOj2MueGbvm4rsAxpqL3sGvq5lEIiPODK/Jjzndj4Ogu40Bg8kVe4cGkyg7WReZDnqk/sSIi7TNshKzbK0jK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6075
X-OriginatorOrg: citrix.com

On Tue, Mar 22, 2022 at 01:41:39PM -0400, Tamas K Lengyel wrote:
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index 208d8dcbd9..30ce23c5a7 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -541,12 +541,14 @@ struct xen_mem_sharing_op {
>                  uint32_t gref;     /* IN: gref to debug         */
>              } u;
>          } debug;
> -        struct mem_sharing_op_fork {      /* OP_FORK */
> +        struct mem_sharing_op_fork {      /* OP_FORK/_RESET */
>              domid_t parent_domain;        /* IN: parent's domain id */
>  /* These flags only makes sense for short-lived forks */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
>  #define XENMEM_FORK_BLOCK_INTERRUPTS   (1u << 1)
>  #define XENMEM_FORK_SKIP_SPECIAL_PAGES (1u << 2)
> +#define XENMEM_FORK_RESET_STATE        (1u << 3)
> +#define XENMEM_FORK_RESET_MEMORY       (1u << 4)
>              uint16_t flags;               /* IN: optional settings */
>              uint32_t pad;                 /* Must be set to 0 */
>          } fork;
> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> index bb003d21d0..81c2ee28cc 100644
> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -127,6 +127,14 @@
>   * Reset the vmtrace buffer (if vmtrace is enabled)
>   */
>  #define VM_EVENT_FLAG_RESET_VMTRACE      (1 << 13)
> +/*
> + * Reset the VM state (if VM is fork)
> + */
> +#define VM_EVENT_FLAG_RESET_FORK_STATE   (1 << 14)
> +/*
> + * Remove unshared entried from physmap (if VM is fork)
> + */
> +#define VM_EVENT_FLAG_RESET_FORK_MEMORY  (1 << 15)

I'm confused about why two different interfaces are added to do this
kind of selective resets, one to vm_event and one to xenmem_fork?

I thin k the natural place for the option to live would be
XENMEM_FORK?

Thanks, Roger.

