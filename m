Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80AF36EDD6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 18:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120163.227226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc9Aj-00027L-CK; Thu, 29 Apr 2021 16:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120163.227226; Thu, 29 Apr 2021 16:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc9Aj-00026w-94; Thu, 29 Apr 2021 16:05:49 +0000
Received: by outflank-mailman (input) for mailman id 120163;
 Thu, 29 Apr 2021 16:05:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SJyU=J2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lc9Ah-00026r-Ue
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 16:05:47 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a823715c-e5a1-42d9-8662-90c8d807dce8;
 Thu, 29 Apr 2021 16:05:46 +0000 (UTC)
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
X-Inumbo-ID: a823715c-e5a1-42d9-8662-90c8d807dce8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619712346;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3hacTCb/WoQp/xqK6ImKMPS674gvSTql/IYh9Vwwaoc=;
  b=Ox1IWHej0Hz6gW1GM6Vixr2RpnqVpppFPM3o2oVIfq6FXY2liJPmjhcU
   UDynCrgFC/besNuRlRddb8BNWqKB/kyoVXZf6SknWdEFjcfDijQyMQ9ng
   AmLz61ehVrKAsvsMJdbK8hEBkhNhPsX1jdYTFWyQIHQ33SlC5ul/p2ast
   o=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xG8wnfF9cKaSZaCi0CspR/gQnv9WR9hwpAj3l53UEIZ0tcBI3TLvW3vtKeGGOSH6TmLQcG2jzL
 Q9H2zeamaNe2wtnE6ip6orIL8mjBsl/hCIPKUAA6alISxMpgkyql3DL8HcAfcuFfDKqR/S+0Tc
 sVls/lZlPQPbIKVJRSWzKwD1jsHwhsxCjuLSFqdwqI80Zt3ykElpSIDku3yNueTO7UbrMwwamG
 Ba/IdL80QcL7SUI2tHFmspmhGmGQfAJqB1NpQHbkBGSW/lRY25ywqX/uw+y6lGEar2YYV9xMNj
 Kew=
X-SBRS: 5.1
X-MesageID: 42719391
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NJWlXa7hKlTZVyvUbgPXwXqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbDqzOEtwWQVAGN4VFI
 CE4NBGujqnfh0sH7mGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTYj9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+2OVTat7XbnqhkFQnMiO7xIQnM
 DIs1McOa1ImgzsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VHAzuPFWB1wmk2/rWBKq59ps1VlXZYDc7gUlIQD/SpuYec9NRjn44MqGv
 QGNrCk2N9qdzqhHhfkl1gq6tmtUnMvJwyBU0gPt+eEugIm7UxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNS9spcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 r8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbchGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl+uoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdP3DXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 9DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEU4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9cbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IMSb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQTppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjBNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHEvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7NEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiUue5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EigYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4lQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrS++h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNHHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzKAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU6xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1ZUu1zzh84jIM21SCuSqv45mId+mEunw1PpxrKwYip4GDSAEdcFxbW668mBQVuDg==
X-IronPort-AV: E=Sophos;i="5.82,259,1613451600"; 
   d="scan'208";a="42719391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4UHYtz0Y1e1UGCk3DxUAU8dSC5h/hma70kaxxMYzjkPSvZuZ6QWjWG0kaA3VRpJ7trzioYvwyEgpIAkQqYftvojT8l6xNevRkR4qMpbEkFiOLTUHAkA0rRIWEWK+irrZMFFDQPLuyKM0psPEQ3+bCg4e7EY0z3uGD7Z6tLQEJ5QJCWO6qJlRpULrGUCVvhBnqC9e+r3rGj+FP2gtwWngr9enCG/D07NB6FbcU1RIBI0rxj3lYWaYQkUo8EVNPjL/P9wvLBPmsoYgav1/HlDelxnQQUVoi5lwntut1p1gUeGZ6tHeTE7fKk++6oC1D4wL9xF4QS/hmRwLTTpaNdbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbM7t5Aj3WdR8o4bnwkUQGfUjGA4FZ7S3PafoLezcdo=;
 b=NO+SoT6mRztZo1xSWDUjTmnm0GIP+ZjCsvLnQUU6u2pNHkZK7As8UPxx1+zQNXSTNcmmSJcDO/K9Eivw5fdiZ6ua18EWde2daaZDN7PtoOzaUDXUchm1Yw3DyiiqzLatGpOdDhrEYHh3c04NSU0LlDM4UwlG3wTt3ZpZDDkv+KYmQWbItZ1v+UKFtfbVWkcI7cF0Bqp7NYbQk/r1RFAER96QBN+RiJgM1g2nPonhPtwQ/9TI9OX13ynX4rh2bfc0ZjkUlVOJ6zZ8bHvks5jFeZHIX/r+AjxM6eXm+9SItPwHd60ly4rTAxQOhyl3VG/PuO6msTURo435SfC/zh0vyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbM7t5Aj3WdR8o4bnwkUQGfUjGA4FZ7S3PafoLezcdo=;
 b=sivYiQSKnlE6Sj5K7NTrzsd0uGmoocXDmwWrdpt7qF98SIHCfp7ORBfkKqjGxniE9hybrIHaFPbKqpNxUzqy0KwlCXmFj1NRLEY7Q+OF80q50SNLKn3xqXEMWLZCNFKUOEzLV/Gb/7y0kjd1t/3uutgxyro92N+E8Kxb7wG2+nM=
Date: Thu, 29 Apr 2021 18:05:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>
Subject: Re: [PATCH v2 06/12] x86/p2m: hardware-log-dirty related hooks are
 HVM-only
Message-ID: <YIrZTw2iSG8FJgT1@Air-de-Roger>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
 <e11aa162-9a07-9326-5b5b-5f4114f80255@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e11aa162-9a07-9326-5b5b-5f4114f80255@suse.com>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d9595f5-f353-42bd-ac37-08d90b28a2ab
X-MS-TrafficTypeDiagnostic: DM6PR03MB5356:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB53569AD5D429917F0C02A8BD8F5F9@DM6PR03MB5356.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+v3OEIWQ3jFNmRiek8QXqAUOYdXfPNQQEtNTAHH6D1uUXGH6biQ6+VGSOuirdofjcsBzSGsPMaPEUoYZuCVnJiRPdnDoJ68qn18UEdz5RguJ+/LxHZ8SSpqmZi9u4I2Q9E1yENnfmYP4DUBJ/OksoDNsZyNcnosglkFIyXHKZKw8K/H2DZrBKCOPK6MLQLKKULayEpkFo1QSwpxufNMXsFOLhvnx45kEs9CqASHTwfBNn213bfdO/4r4a9v0ffK77yHoQQ8DMXE4eNkJbCLsiO6JKsr+6ebgz+Zwjq6Z6Oji0s5SIjtsGUemFPuOzzegz9RpXAn4pCUaBK669QOVZ+BwJvP9YCNvnc8NDhhmXzXNsGhgViUKrYnQ6XFWvhxlQ7PzTXijOiQvB6lqg/bCru25/4VGEeF3HeLwGAI4FYl7HLkGBQAgwZTi+arUKmaifBlmlp9znBh6zK6x5JW2l2OxXkyCd3AYw/suwzbE2/zg5lDfHOx/ogfuifRHzsRRqBUjXcexktUDLbnlAxkDWDIfk7buNWLxQDwnOJiYMSlsUJCvVn1E4AKSCqOsSldqkeGq9rRbOQZSMEMH44n3JvDW2BGgrtOEAfz/Bdykaxmgr27ebtYLsOqWB6KdRyAWtfBntVtWP+9hiG37uY0nA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(4326008)(4744005)(8936002)(478600001)(38100700002)(2906002)(6916009)(6496006)(54906003)(33716001)(8676002)(85182001)(66476007)(316002)(16526019)(107886003)(956004)(66946007)(66556008)(26005)(6666004)(9686003)(6486002)(5660300002)(186003)(86362001)(14143004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OVcxNEFNQWM4eVFJeGt1MUFqc29nNDJDa0VXQlF0ODR3QUxqbTk1YmdHN2Fm?=
 =?utf-8?B?VXBsaTd3WDZiVDA1RTZVb3NmYTlBd1RqRnFJT0VySXhkYVBvQThad2ZKS01q?=
 =?utf-8?B?LzBQSFFiOFFwaVJVeVk3eDFFRkh2SEY4TVBUZDZZWmk2M3hVWUJXak5Lakpk?=
 =?utf-8?B?QlFVcGRoeS9obVVHZEtTdXQwbE1qNlB4a0Y2ZXE2dmFTL0RTQklsWlFDRUVT?=
 =?utf-8?B?WnIxVzFHaXBjYmZWbHRRei9ZQVU5bFZBTzBMWWNlT2w3RHFRR0lSTDZrenFK?=
 =?utf-8?B?TWZMMkVTWDIvMFd4MWJsS1YyQUhPUjhmc3FxK1hJQ21IY25nRjhKWmg5OFRm?=
 =?utf-8?B?Ulo3SGNFOVdua29ZQmMyM04yR3MzaVU0ekVQck9GNXFXTHBMVys4SzIyMGJi?=
 =?utf-8?B?eGh1TWdoQTE4cTMrbThlYWd6amZNR2FmVU84djlRMFBmSGRoZFpxd1p1Vzk1?=
 =?utf-8?B?TWVBZzUxQ3U2ZWpOMlNTNkM0RjNHWHd6WkNPLzh4OTM0T2NSVkp6S1VGSlNB?=
 =?utf-8?B?Yk85dG9hM0I3d1BQRTdLakVvemE1b0pIOGJQNHFua2lUaGI4STZBdG5KTmJl?=
 =?utf-8?B?UXNmeE9LNUZ2UGhmUkNkenI3MlYrbFF1MWFmc2ZMMnZRcWFEcGszMnNDV1c5?=
 =?utf-8?B?ZmtGRWNlME9JNmdYaFRpMkJQNEZxZk9zTnJZdWlwYldVUWlnZmRwU1hjQnp5?=
 =?utf-8?B?dWR1WVdDdHZXamlZZ3ZFS001SW1PaVR0UXM0Sy8wckxzZkFlMjhjeDFkL1J2?=
 =?utf-8?B?VmVOYUtBQlV5a1BBaHF2UGhkODR2WkRFNlJYeE9Lb0FjR3M3djRKQ05uZTFx?=
 =?utf-8?B?OE9BZlJNajRmY3RHdTVzU1JTbnZJSzIydGtMS1BwaW8yODVCOFkvcWNNb3Bo?=
 =?utf-8?B?K2FQMWRoYlNmMENlWU1nT0c3VkF4UFJLNmNGbUJyeEsxWWRZUE1HcmE2TWR5?=
 =?utf-8?B?Q2Nta2plaEtSYXE2VGRSOTFud2h1WlVxQ1RnWlhjQmZLdllFK1ZuOXVpU0xR?=
 =?utf-8?B?Q2pSQTFheDk2Z3pSMzd3R09SZjhKOGZ6ZzltclhZL0VrS3lwUFN4NkJpVzAy?=
 =?utf-8?B?ZWlnUWtqUVNCUFF0c1ZjU1ZWRUtUN2JaSU1uQmJmMHRlcFRNa2JlUC82ME10?=
 =?utf-8?B?eWxERnUrTHJYZWowZml6blcvNXQ1ZXk4UU5hMWZiU2wxTnVMdG1oRHRoSTBa?=
 =?utf-8?B?U01QM3N3UkFwQXFiVE5RNi9ndmZVS0Q5Wm5pZWpuWGdKS0t0bHpEd2krbGtZ?=
 =?utf-8?B?ZVl2QlFMOWR0U0tpOHRqMDY5R01ZVVlNVUhWODFYbmhCbkRkK2RNejZsZjlP?=
 =?utf-8?B?MWFRbEtKeDd6SlhQSUIzZmxtNUFnb3dZK3ltOGFjUzE4Sm5KVlFNRi9oSHh6?=
 =?utf-8?B?L1A3Q0Z1OGVSNVhTanU3L04wVVlmODEyYmFmK04zUExRWTZKN3RFcDVHUzN5?=
 =?utf-8?B?bkxGZElvL0dMVnJTamthTFMzTE4yNFZmN3ozU3IxOTNneld6MVEvS000Qm5H?=
 =?utf-8?B?b1JtVmtkRUc1UWhZc2o5V3M3UUdXN3ZVelVFcmFocWY1Qjh0K0g0UVR6cmNk?=
 =?utf-8?B?Nm53VWhTbXRjaWYrR1pkQUxkWFhwZWZWQUVtQkhDOUdhMWs5SjZ2bUdoUlpa?=
 =?utf-8?B?THNRSWUyeHlBV01YMi8yT3V5M1YwL2lYdVE0aTJnTWhQOWhXemt1WFZZRldx?=
 =?utf-8?B?ZWtxRzc4em5KcFRNVENSalR4TlBNTEo2NnNxR29BUzdIMys4K0xEQkVrL0Fl?=
 =?utf-8?Q?GiofDZaPmIa+pxQ9KBpHFQA/7akeq1Jtp//Y8M7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9595f5-f353-42bd-ac37-08d90b28a2ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:05:40.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAqnbajrGcK2szrFlyowXX4GZBrefJjPUKZxdGvm4zvcf9n5jmwF3YTq3cooFmj71C15f19b4TiGwu7ts1AMXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356
X-OriginatorOrg: citrix.com

On Mon, Apr 12, 2021 at 04:08:50PM +0200, Jan Beulich wrote:
> Exclude functions using them from !HVM builds, thus making it possible
> to exclude the hooks as well.
> 
> By moving an #endif in p2m.c (instead of introducing yet another one)
> p2m_{get,set}_ioreq_server() get excluded for !HVM builds as well.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

