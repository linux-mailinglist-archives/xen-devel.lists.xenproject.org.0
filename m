Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB3D34D039
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 14:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102992.196573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQr9b-00077q-Cg; Mon, 29 Mar 2021 12:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102992.196573; Mon, 29 Mar 2021 12:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQr9b-00077U-7D; Mon, 29 Mar 2021 12:37:59 +0000
Received: by outflank-mailman (input) for mailman id 102992;
 Mon, 29 Mar 2021 12:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vM0b=I3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lQr9a-00077P-0o
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 12:37:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33d6a0f6-b104-40fd-b0a2-31b77d91a112;
 Mon, 29 Mar 2021 12:37:55 +0000 (UTC)
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
X-Inumbo-ID: 33d6a0f6-b104-40fd-b0a2-31b77d91a112
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617021475;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4idDrxBKZSHFRDZEbM6XCcepBAu9MgzmPXsNV02RIiM=;
  b=ghGZs93Y2s/Bzs2e7socpEu4hzjVMNW8Gl3Ykl46oPNHQj4CmPaYkNZw
   weOfVuzNBqi++Vaz2LIxqn0u2HaQ4Qaq98xq94aOzvnXx+ObsIx0Ncstl
   5ijxoMYRmkoSEBu/UFD35L95SnkhMOMtQSTg7z6lD8pDR3ajyZ4r+3j3Z
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZgAQoO9VXWa+Y2aK+SijLq16rkMLFHV7D0IVYS+jDK7TqEs0A3ZWBdDdIEZQkRobj0WxxDiNQp
 eO3ioKbCIq/DNOoQUQU98A7oTRHX5b+TDAlFJ5/fkw1Qz3/rMrg4vp/rs/5sTSz3TQQb5UkLmn
 iaHXn4rUVXTNRkqsiy9wCSM9EbNVDyqT1W6Y1Ch0BlikgJ+WHUNbxWVRMdAbZRjtsR8LMAEUEb
 k9v1/GdjYxscuOgwH7uSaeeBrWwMYOjq3pu1Qsz7haB8ALDHAT2FtCMxA/N5iHP20BvtSkCzXy
 dMQ=
X-SBRS: 5.2
X-MesageID: 40216756
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aBijpKi54jFIEcnLoPTMeVSqKHBQX2pw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIzVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpL+jvfMk4/rZgNDOgUu7xOAgSjtxLnxFRWZ2Rl2aUIz/Z4J92
 /Znwvlopiyqv3T8G6m60b/zbRz3OHgxNxKGdCWhqEuRAnEpw60aO1aKt+/lR8vpuXH0idOrP
 DtpFMaM913+zfteAiO0GfQ8i3B9Bpr1HP401+fhhLY0LzEbRY3EdBIi44cUjax0TtYgPhG3K
 hG332UuvNsZHuq9kSNhKm7azhQmkW5unYkm+II5kYvKbc2U7NNsZcZuHpcDZZoJlOK1KkcDO
 JsAMvAjcwmF2+yUnaxhBgK/PWcGl43HhuAX3EYvN2U3zV8jBlCvjUl7f1asXEa+J0nTZ5Yo8
 zCL6RzjblLCvQbdKRnGY46MIeKI12IZSiJHHOZIFzhGq1CE3XRq6Tv6LFwwO2xYpQHwLY7hZ
 ypaiIWiUcCP2bVTeGe1pxC9R7ABE+nWy72981Y759l/pXhWbvCK0S4ORATuvrlh89aLtzQWv
 61Np4TKeTkN3HSFYFA2BC7c4VOKEMZTNYetr8AKhOzi/OODrevmv3Qcf7VKraoOy0jQHnDDn
 wKWyW2C95H6mytR3/kkDncU37gYSXEjNBNOZmf29JW5JkGN4VKvARQo0++/Nu3JTpLtbFzXE
 YWGsKjroqL4U2NuUrY5WRgPRRQSmxP5q/7bn9MrQgWd2f9cbMJvcSjaXlftUH3YiNXfofzKk
 pytl538aW4I9i73iY5Ee+qNWqckj81qG+VSYwf3omO/93sdJ99LptOYt0+KSz7UzhO3Sp6om
 ZKbwEJAmXFECn1tKmjhJsIQMfFd9d9hw+vCdVOqW3WsHidoc1HfApZYxeeFeqsxSo+TTtdgV
 N8t4UFhqCbpDqpIWwjxNgjPEZ0c2SRCrJeBAGjbIFZ84qbPz1YfCOvv3i3mhszcm3l+wE3in
 b6JSOZQ/3NH2FQo2tVyKrs7VNyeFiMZk4YUAEIjaRNUUD9/lpj2+6CYaS+l1GcbVYP2ckxGj
 DIazl6GHIk+/mHkDqu3BqSH3QvwZsjetHHBLM4arfJxzeGM4uTj5wLGPdS4bdoPN3jqfUwTO
 qaYgOZRQmITd8B6kiwnDIIKSN0oH4rnbfUwxXj9nG/x2N6LvzIIlhqLotrVe203izBfbKv35
 p4h95u4rf1HWX1d9KcyabYKxREMQjepGaqT+cu7bBY1JhCwIdbLt3+a3/v0noC4TAVaOHTv2
 kaSL5g4L/ANpR0FvZiMx5xzx4MrpC3MEAvsgbKGecwclEmsm/DM7qyks/1gItqJnfEmRD5Nl
 ae+RBM5vvpXyOM0rgBFqI7SF4mH3QU2TBH/OmYcZfXBxjvX+Zf/ECiOnvVSs4WdIG1XZERpA
 19+deGgqu+cDf5whnZuX9eLrhV+2iqBeO0DwTkI58Ez/WKfXCNiLCt+si9kXPeTia6cV0Rgc
 l9TnMrB/4zwwUKvckQySi9Sqv+v0IjnR9/2Fhc5yHQ87njxnzaE0FAORDembNMU1BoQyG1sf
 g=
X-IronPort-AV: E=Sophos;i="5.81,287,1610427600"; 
   d="scan'208";a="40216756"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz264yQMqD9j129/wufzTz3FYmi8f4HFoZbf+XjruJXwp2h9GvkearAgoWTIxFuQaO17Qdx8UcjG0ZBpfH0R4hktBKTopkaFDjoeqqGZWBjWvmXf5B1mxmMXRgW+NrWtKVHxSMhD/1VdHFmFseeHCxVgw19SmYLXzCcYx0VEeIleGU84F9ipdubwQsU3qMW8x8X4o9bdwA3O3ZP2RbUCs+oy1Ody72F/jNsNNSqtwO3ATophbIvWuVYqqpwzM19Exa80eiD2dvrNm/Dn0akhmgiT5p/6cqXD/DVn1FaSQtmxcZNXzHqTVGvCftwiAicGKtX7jI1m0D9TVx/QqQq1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyBV7zHMzFJCj8rDmDB0bcHX/O+15gumP0+JefsQLyc=;
 b=V63A7fNP7n6KIEcGiWjwdMhtWivK80v0exD3I/Ao7I6sKBVOIl1FRNn9y5zGnSvi+xpl3H1+EaPwXCgEbmUA5zeb1AuX+1UMaKdReogPvgx1Ush0evBYr1jbs86M8RIeBoP4WI5d3yHGJ1aN/WRcvJFZs+iu6zbmSMFQG/Y+sWmMUzn0eRsE5pSbUzNbP+a8papJ9J/YcTAyhBMn1ya9QADIyvXgD1SrWICAHWe2bAkAHlxBkQ/b68WGEwVZdhYC6Wnl6G539aeO6ST0EsFz1yU2nSbagyyFWPxc0l9xMjhyo8nG4mbmIvMueSk5lQVvgwm5CAEoFpw7TwHFZLm1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyBV7zHMzFJCj8rDmDB0bcHX/O+15gumP0+JefsQLyc=;
 b=CQ5W1q+EgWk2fWNy84uet9VXH4aViC8gSpoe5D94g6PoAlZRiY60Dq2GGrFYuGpKpmas7gDzqAtSndDGY3/j04KClyD2KIYzQUD02Y8gPopHO6BuCi6HeWMrbeq9AQJJ8yUQK8rXt+1arBlGjrP/hzpE9IawggmzmXYC2G2vWUg=
Date: Mon, 29 Mar 2021 14:37:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?utf-8?B?RnLDqWTDqXJpYw==?= Pierret
	<frederic.pierret@qubes-os.org>
Subject: Re: [PATCH v2 3/3] x86/hpet: Restore old configuration if Legacy
 Replacement mode doesn't help
Message-ID: <YGHKGj14+Cf14PlJ@Air-de-Roger>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
 <20210326185947.23243-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210326185947.23243-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f95a6879-eb1d-41a6-5cd2-08d8f2af781a
X-MS-TrafficTypeDiagnostic: DM6PR03MB5323:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5323746F63ECC3BC271139F78F7E9@DM6PR03MB5323.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E97ZlP7/20aKiEVKQbVBlTSCLjtY6SQqLkseox+xVr9N4prORr3eyk6VSe6CTlPvyzLioPxE/FDaGZ/CWex4wsZ6DEQbqa4USEl1KQ+P3l/3tAUnFMRJG4jEdsjqDDZgajIZVXiGVii2KgX5vyElUDTPWvQppuDV/M8LjNO9nf21S19yWJvqG+SOkxlvtWTLHP/th+/U3lU7MFPBTzJRbRWRyacFPgU7BdW7OCaDVLHvVTVpGbQdX3CxwPHEQuHYZryKGYlrxbHQD8mAKkOblbI0BN8lHf/4IeWjU02w84U9AYz04VH6r1eRJmJEFKLjpBuw1ZROnkBVlve6NzGG+ikDza+tw8xKcO423GMSaGWqbJ9jX/3nlmjV4ykwu9ybAU4z/fG3h7DMaoxdkU0pb02WxYN8uQNUjlw8WJ4UvVIj4rGpgRCoyoScgGxy899aDO7C1DzhoGuFEzc9xRB2ZqND8VXNjwo8TjY8lLc+V6n73JuDxBnN7TmyCyRNHIlukCutPbtJIuLodD2lw7KdpcYk2iSa8vJL2lff2srmcHGTQeSvuYoqSJ3r/ky2zWWV9FCzKoclM3JtEbgyNf5c72ynZUwrEKEwwJb+8TLcr7N4hXiWtsCdrpFyANXoFZw3ww1d9gmCbvTopIgn1Uq8LIhMX75ou+x2k7nksd0IRzY48atDwCn5OiAFtq12H3RN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(376002)(396003)(346002)(39860400002)(136003)(366004)(83380400001)(6636002)(54906003)(4326008)(316002)(956004)(2906002)(8676002)(6496006)(6862004)(66476007)(9686003)(66556008)(6666004)(8936002)(66946007)(6486002)(16526019)(186003)(26005)(5660300002)(86362001)(38100700001)(33716001)(478600001)(85182001)(66574015)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b054NW5zejY1S0VCVld4alBuanI1NzVvMXo2enFPSUl1YWJNL1psNU50WXR2?=
 =?utf-8?B?THhvWkdKNzR5NXJSVUhkVi94MGFKcTRvM2g4eUdmU2E0NE9DOWRRY0ZTeHNF?=
 =?utf-8?B?WDlFRS9jTVI4L1J5TFlWTVFPNytNQkpBTDJzb3pZakJIVEo4SGRYVGJWbExZ?=
 =?utf-8?B?ajB2emNrNmlhRkxDbFo5MnJ6ZUtaMzhJd0NmZmdPWkFnbVc2TGlpdElwZnBO?=
 =?utf-8?B?dzhBVjlhdEIva2pJa1VLYzExQ01XN243N1Rlc0xpYWdYaWNlUGhZdG5kcHBL?=
 =?utf-8?B?NFBteGYwdFdOQjdwTURUbUZhdGhsWG04WWxpanBRdzdXTnlmQitCOS83aTV4?=
 =?utf-8?B?Um8wUzk0RGc0dkNZNmJBanlZYWxsYzFKcE1FVmJYcEtUZUtiSTNEcExJaWRa?=
 =?utf-8?B?QjIrWGhQVm40enpab3pHRUdNNnVNMzBQYXVlTVBUdEhOTFhVRXdEaGh1WUcx?=
 =?utf-8?B?cmt3UFRKWGxPQ09NdnUyUDhsOERyWFM5L3JmeElhbXJ5Z1dhUG5IMjcvMVIy?=
 =?utf-8?B?d1pyVm1hWG1Iejh0Q3YrS1BNOGQ0OHZHeDlwMTVRKzkxV3Z0cllKVXJ5YUlC?=
 =?utf-8?B?eWgwMW4zUkluRVVhbWUvOU5GdDFpbXlXNkZNQlI2OXgwaW5OYVpDczFua2NX?=
 =?utf-8?B?RDdGMytjd3l6YnJyaE4vRFI2ekNUSW5TOFN2c0FNeE5oWUczQlpRc1Y0Q2x4?=
 =?utf-8?B?MFN3OCszSGQ1TDlFdCtqQUtMNElBcXl0N2daZ2N1T01HQW9kYUJMY1JiSjVW?=
 =?utf-8?B?UW1wbjIzbzZSK2pFMXkyaUx3REF6L2s3YnF2MGFDYWhuS1ZmT1N6S09LemlK?=
 =?utf-8?B?K3Bmd0VwM3dobjEyWFdnL2VaSURsbEtFRFFkalJpVWlyN0hPdklkOE1Vd0di?=
 =?utf-8?B?VmpWcklnVHM4WTlhWjNwcnlHWmtmay82aWhqL1FQdmNwWFZSQXltVExXTFl3?=
 =?utf-8?B?Qzl1aG13cGxRdHRKeVJQZmoydXJFWFIvd3hScmxsdEppSCtaY1pocEdOUDlZ?=
 =?utf-8?B?ZVRHYnpIYVl0ZTU1d01aTnBabGVtRXVQL2NtL0Q4NXNqQWFNZnBoY3VIR0g1?=
 =?utf-8?B?MkNUcVZLYTBaL0R1bzJQM3VuaHdReGQwS3E2M3RvRmgrcHZUcjBySnIrRFdS?=
 =?utf-8?B?eURpM1NIOGQ5Q3VFeEI4eVU5WVRZVDZzNmQyS0YwSytUUXI2Ny9HMThhaDRj?=
 =?utf-8?B?bUVQaEpEdEJGczB4cHc1UzFZTTk1N2J4d3hLdStiOFdxSS9vUWZidWtOZjl1?=
 =?utf-8?B?Mnh5QWp5bW8yWVNoVVNucWN4WVVtbUdNMWNqVVhkaWZqSVJxVndkSm5jUjBt?=
 =?utf-8?B?L0IraXBZamI1WE1xYnBMU0RWSExDVmF5V2tZNGxOQkoxQ0YxWmw0a3FRUEV0?=
 =?utf-8?B?MFVCVzhYdFFsLzBaNVhQellPa3dFclRLZURnNGMvRVZMZFZqd1hZTTdwWEhJ?=
 =?utf-8?B?bWRFRURRWXB6MUdCY21pc3VYa09LYW5ram9iK1dmTTJlNjRzejM0VGgyRHJx?=
 =?utf-8?B?R3lDeXIzeFltM1Boa2thcWs2K0c1Sy9TRFg3MDFqdzhlNm5VdDBTUTQyakJh?=
 =?utf-8?B?cU1GMUowb2U1UVdaUkI3d3ZZU3p4UWI2R3pkZGYvYXZFK0gvVnI4eUNQdzZF?=
 =?utf-8?B?V0VjbWk3MGdKMUgrL2JmdzN2YVRQMGpmOEFCSytqQWIrMHhMMmZLNFM1SGVH?=
 =?utf-8?B?YlVvZDJPSEpJM2pCTms1TFBma2NxQjVvQXNzd0Q1Vy91b1VVbU9oam5NUWs5?=
 =?utf-8?Q?51GHLcmNSQNOU6GT8Hd+r+b3S7XiWG9e5yTqHZ6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f95a6879-eb1d-41a6-5cd2-08d8f2af781a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 12:37:52.5707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2s+iZFHr4SPIrH8urFBeJra7EglEkVQFcb/HbGcPI7BRI0iIijdquWGnlAtkQTDrk2qHwrH67CNkRcPlo4c+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-OriginatorOrg: citrix.com

On Fri, Mar 26, 2021 at 06:59:47PM +0000, Andrew Cooper wrote:
> If Legacy Replacement mode doesn't help in check_timer(), restore the old
> configuration before falling back to other workarounds.

Oh, I guess this answers my question from the previous patch.

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Frédéric Pierret <frederic.pierret@qubes-os.org>
> 
> v2:
>  * New.
> 
> For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.

Is this really the fix for AMD 1800X? I assumed not setting the HPET
into legacy replacement mode unconditionally was the fix for those
systems?

> 
> I'm tempted to fold this into the previous patch, but its presented here in
> isolation for ease of review.
> 
> Tested by repositioning the timer_irq_works() calls on a system with a working
> PIT.
> 
> (XEN) ENABLING IO-APIC IRQs
> (XEN)  -> Using old ACK method
> (XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=0 pin2=0
> (XEN) ..no 8254 timer found - trying HPET Legacy Replacement Mode
> (XEN) ..no HPET timer found - reverting Legacy Replacement Mode
> (XEN) TSC deadline timer enabled
> ---
>  xen/arch/x86/hpet.c        | 27 ++++++++++++++++++++++++++-
>  xen/arch/x86/io_apic.c     |  4 ++++
>  xen/include/asm-x86/hpet.h |  6 ++++++
>  3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
> index bfa75f135a..afe104dc93 100644
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -783,6 +783,9 @@ int hpet_legacy_irq_tick(void)
>  
>  static u32 *hpet_boot_cfg;
>  static uint64_t __initdata hpet_rate;
> +static __initdata struct {
> +    uint32_t cmp, cfg;
> +} pre_legacy_c0;
>  
>  bool __init hpet_enable_legacy_replacement_mode(void)
>  {
> @@ -796,8 +799,11 @@ bool __init hpet_enable_legacy_replacement_mode(void)
>      /* Stop the main counter. */
>      hpet_write32(cfg & ~HPET_CFG_ENABLE, HPET_CFG);
>  
> +    /* Stash channel 0's old CFG/CMP incase we need to undo. */
> +    pre_legacy_c0.cfg = c0_cfg = hpet_read32(HPET_Tn_CFG(0));
> +    pre_legacy_c0.cmp = hpet_read32(HPET_Tn_CMP(0));
> +
>      /* Reconfigure channel 0 to be 32bit periodic. */
> -    c0_cfg = hpet_read32(HPET_Tn_CFG(0));
>      c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
>                 HPET_TN_32BIT);
>      hpet_write32(c0_cfg, HPET_Tn_CFG(0));
> @@ -843,6 +849,25 @@ bool __init hpet_enable_legacy_replacement_mode(void)
>      return true;
>  }
>  
> +void __init hpet_disable_legacy_replacement_mode(void)
> +{
> +    unsigned int cfg = hpet_read32(HPET_CFG);
> +
> +    ASSERT(hpet_rate);
> +
> +    cfg &= ~(HPET_CFG_LEGACY | HPET_CFG_ENABLE);
> +
> +    /* Stop the main counter and disable legacy mode. */
> +    hpet_write32(cfg, HPET_CFG);
> +
> +    /* Restore pre-Legacy Replacement Mode settings. */
> +    hpet_write32(pre_legacy_c0.cfg, HPET_Tn_CFG(0));
> +    hpet_write32(pre_legacy_c0.cmp, HPET_Tn_CMP(0));
> +
> +    /* Restart the main counter. */
> +    hpet_write32(cfg | HPET_CFG_ENABLE, HPET_CFG);
> +}
> +
>  u64 __init hpet_setup(void)
>  {
>      unsigned int hpet_id, hpet_period;
> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> index 3f131a81fb..58b26d962c 100644
> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1955,6 +1955,10 @@ static void __init check_timer(void)
>                  local_irq_restore(flags);
>                  return;
>              }
> +
> +            /* Legacy Replacement mode hasn't helped.  Undo it. */
> +            printk(XENLOG_ERR "..no HPET timer found - reverting Legacy Replacement Mode\n");
> +            hpet_disable_legacy_replacement_mode();

I think you could also get away just calling hpet_disable and
hpet_resume? (bypassing the system_reset_counter check)

Thanks, Roger.

