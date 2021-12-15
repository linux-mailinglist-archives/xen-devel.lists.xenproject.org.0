Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E7475BA4
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 16:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247435.426664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVze-0003e4-Id; Wed, 15 Dec 2021 15:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247435.426664; Wed, 15 Dec 2021 15:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxVze-0003by-FD; Wed, 15 Dec 2021 15:14:58 +0000
Received: by outflank-mailman (input) for mailman id 247435;
 Wed, 15 Dec 2021 15:14:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iD5n=RA=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mxVzc-0003bs-Eo
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 15:14:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c5ecb4-5db9-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 16:14:54 +0100 (CET)
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
X-Inumbo-ID: c0c5ecb4-5db9-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639581293;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HQGh1PYcJy47v6FrkcJXZDix0saAOacVjjqn19PDpQ4=;
  b=ZiNxccZGYAFNJZf8annEZXkGSaaVeNkxv13Mm56KWOUk8rsIfmLd6e/U
   YQODGKMWTEhK0nX7O1EU9g6ESBw0o2eCkvw+btXQGhP70Yj621B8ka6Uh
   +rRzRGP61G8GW6cYicoyWzMZ0docsiqr9Zf4WXZ1it78cubCj15LEBlvU
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: yomYvrEkLaTc1eHITXkFgo3403Cs+eq2keBG9LxC+SXj/vHjHrw5iKjJag1ALjRWRxkclEFW9m
 kd5gYNS7wRdMsMHk71rBbDrOJQ7/3EpIc3D11c9WC3YmGc8St2Z0lPxVRLKHKyLwzAFSY7Tb5X
 zoOwaVTzOKVH2PhwZdnITGY7SsXtmXzTK669M2QH3gDRT+G7pHK6rcmfrz48CMpv+/bmcaZoY2
 OUqHmwoOma7z61Q42FA9bXtkdwioGVKAf7Vw26wYm+6PbhOxwYCLdX/v3KGbhOAWXqVgYnbnyC
 vV+4werdhhvkKonpd/i9TrxG
X-SBRS: 5.1
X-MesageID: 59591454
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qu95OKiGnPVldbqSOyyMl1tzX161uBcKZh0ujC45NGQN5FlHY01je
 htvWWDVO6mPZDahc9h0ao7j9kMPvZSDyoRnTwdo/iw2Qyob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rg29Qx3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1rmK2oWwoMAZTB27QaYSl0MhBiEp1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t150fRKqDO
 6L1bxJCT0mZY0VCJ240Fc0xscajvEfEaR9x/Qf9Sa0fvDGIkV0ZPKLWGMLcZ9iiVchT2EGCq
 Qru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0ffdhC/83zT60x+mE5DSpKkk1UhFxZ4lz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9zABbvzt68owGOlor+p5
 Slsdy+2tr9mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ldRoxbJhUJG+3O
 ic/XD+9ArcJYhNGioctPOqM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6CHfjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdcG1ms1hvN+HiW4hRt3U+MXB+NFqkwSF7M42u8L0eZ908erx+rL5vyvt9T
 v8kfcScA6sQFmSbqmpFNZSt/pZ/cBmLhB6VO3b3ajYIYJM9FRfC/cXpf1Wz+XBWXDa3r8Y3v
 5apyhjfHcgYXw1nAcuPMKCvwlq9sGIzguV3W0eUcNBfdF+1qNphKjDrj+9xKMYJcE2Ryjyf3
 geQIBEZueiS/NNlrIiX3fiJ9t77HfF/E0xWG3jgwYy3bSSKrHC+xYJgUfqTeWyPXm3D56j/N
 /5eyOvxMaNbkQ8S4ZZ8Cbti0Yk3+8Dr++1B1g1hEXjGMwarB7dnLiXU1MVDrPQQlLpQuA/wU
 UOT4NhKf76OPZq9QlIWIQMkaMWF1O0VxWaOvahkfh2i6X8l5qeDXGVTIwKI2X5UI7ZCOY84x
 fss5ZwN4Aulhxt2atuLg0i4LYhXwqDsh0n/iqwnPQ==
IronPort-HdrOrdr: A9a23:GL4E5KAfqZ4T/xvlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dC/DDEytHRuQ639QYTcegAUdAH0+4WMHf+LqUgLzM2eabRWa
 DsrvZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolCs2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REIGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUETwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUB4S0LpXUd
 WGMfuspMq/KTihHjPkVyhUsZGRt00Ib1m7qhNogL3W79BU9EoJu3fwivZv20voz6hNO6Ws0d
 60R5iApIs+P/P+UpgNd9vpYfHHfFAlEii8eV57HzzcZdM60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.88,207,1635220800"; 
   d="scan'208";a="59591454"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOFYT4UJ3xGBaI4CQjkEHnYhENi/zx0zEhvvap0sDCawt/oUODItLGZwAcrGdjgGX4hGylbYi2uKrGCO5yAaOjQ0xbq9wsNcYvbpBeJ0qV84K76UvA4/uwYdcIIQv4Ex1RdtwzRNa8ZHYQDv0HvU9OkwWdgZOioPewI+QEq5C8xp/wi7MXn44m+E1qZ//V6zUiMKZBtEnbrIWkyxF6L3t0LWVtwICT+iINfJVDruffxhFi86ILEmhrsPWje7S+DMSzYk70NBVpn95gEjrpfCzOJrsYF7PNEV1NQRtnXlPLOYKH1G3XcJFA2yY1xlcSWBKVewkqjZwso9BkYBQC3AIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9SMaDTnxsGI2iay8CBbhBdAFcma89TZhFlhp9GfPEU=;
 b=VIJcpj3R5EdbREj6H54OZQ4dCvscXskn76+brnP3dXKi2KhRpwK6XLIca8N/TsdtZBEVGmUi7obc0+CcyXw0W7sV8M/R/xRvh+e/V/IkuetsQZiclh95feovLPXQa4ywry1CdZhk/TCaG4PKZ4RXzOqyRuhVvNS4I+ZTqtChGS8F71flIid643MqIJ/F3AYnR3fwn+vsdf3tiVc/FvMnevneT2oJ9kK32Jst5lQMaw7AC+lggNouXFZCZEZjDBYHmiumY+R0qeb/w56JEpu32KSd9taH1qAdSe61EqhcijqKGhCJA8am88WCakWUptrhPc4/gLljrNUDUrb5A1e1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9SMaDTnxsGI2iay8CBbhBdAFcma89TZhFlhp9GfPEU=;
 b=V3k5lu2+mCkM0aUCCFTIKYiYyKf8qk04c+g75lDjd+zGABCu1WDVtI7/1cBS/P3j7PfBmJTD3OixbM3um92zWYRCxSX3wjNIdUK05xGJmM7FUBf7pmnISRhcslL40QWYZsCTTEZx18egPyLeB94S8DnwUs+f8cnWil3VCtATT1A=
Date: Wed, 15 Dec 2021 16:14:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 17/18] AMD/IOMMU: free all-empty page tables
Message-ID: <YboGXiHaAO1cuUnd@Air-de-Roger>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <ef31b6f4-09f5-cded-a235-5dce3c5399ce@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ef31b6f4-09f5-cded-a235-5dce3c5399ce@suse.com>
X-ClientProxiedBy: MR1P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::31) To SA0PR03MB5610.namprd03.prod.outlook.com
 (2603:10b6:806:b2::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1d9329a-55c1-4881-0c54-08d9bfdda034
X-MS-TrafficTypeDiagnostic: SN2PR03MB2415:EE_
X-Microsoft-Antispam-PRVS: <SN2PR03MB2415C0D0FBE0576F2E518A3D8F769@SN2PR03MB2415.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aKIdDbyNVlj8TOgDicPs2r6xEm7vbe20LbQfTEJkUm8jsbW2hc5pdgD2/lCGSR1RxfxGQ78UTxpA8qA6Dxhf2NMANyV8AxiaVeO69w3SWYlalshoGrYPuTQ1YAKCiN6b5YuLabYU689d1dl/wf6mu7QZVguQeRPVUwfySRkdFkhTGTX0qZwGXMQJAOlFZBnUIZlK/Ez/+tuuv4hjwecmgMjtUEy8A59JkI+CYX9pUO3QcC0u6UXboAFBbidCuSXeHAGYVll/pka1NBFGLMQT9I2OIlhN60TazyCa79rUqaFxx5L/WHG3TGeY3hW/l7rIeeIzTo8+OTjq8NFnej8uXJcSmo1RT76O1VHZ5TXRuaJpFoXdZWHfKqoJg9AMD12kD/qSmY+eLq1PBPIf1Gdjj7UtDlUW8trhGYU98LKpQR4ZhWIO8ZOAvOnC9okSw59QOK87bqEKvmbagFobEdO9knIio18zM8MCwkZJv5H6ba1fO0p8GO++VNzvGn2p0B/StCu2tCQl3/tAieOqPv1F4J5MKtrXrqOFyrbYTeRdei3zsZBigaGtX5+6L/NHN5B5ryJPatxQkxpJNAWCzU1As5N/jSuh3fnlfNFfXVlQyGYsDzPJX6/5IxODv46NFqW3lQRrQj2mf7iIhNt798KBDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR03MB5610.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66946007)(66556008)(66476007)(316002)(5660300002)(6486002)(6506007)(86362001)(6666004)(8676002)(38100700002)(26005)(186003)(83380400001)(33716001)(508600001)(6916009)(85182001)(2906002)(54906003)(82960400001)(4326008)(8936002)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkxwU2hiMHY5VENiODNobEUzUE5KamZpSzZ2ak5tMlVnUHBnbGZveFdyNVlx?=
 =?utf-8?B?K3JZYmtncTBkWnFiME5GL3k2enV2TXB6SFBoN2ZlMlZ3MklERzBjQnB4Z2NU?=
 =?utf-8?B?RXdJN2hXUUFjWDNOVWJhUDBNZEF3d3psMmZ0WXZ0bnR1TlJza29qVFVMdHJk?=
 =?utf-8?B?RGNoelJVZ2tXUUZIZkxwWHlCR3NjNS9jTlpRVzFTYXFKMnFvQU9DVmkrb0RK?=
 =?utf-8?B?MUdjUGt6VkZmVkR0OVh0SkhBU0NNcjJjTURjaFluK0dOYitlc05WdXlUYmRr?=
 =?utf-8?B?V1pESWRha2haVytpaFFFWGwrY2VwWHlwclNFb3cxVC9zQzJnckl2Mk9sdHdr?=
 =?utf-8?B?a0oySFlVNWE5SHdXS01SOThUQ0NQVkMxbGJ3RjFwSzB6eWpVSWxYVTdid1Ji?=
 =?utf-8?B?SWl5Q3Bsd0tuYVBJaTRTR0hjaU16cDFGOWtQQ0hscHlZWW1IWEtpM1JwbCtY?=
 =?utf-8?B?K1NoWE5mRVBxWjF0anBtMUlMS0p0TFVrZWQ0TVdNMnZPbC9uSlN1blRpSTEx?=
 =?utf-8?B?NkFOdFh0K080K05LVnZNNG4wdFhCL0tCYUlmQ1phaGh0KzNBY3B5c2tscnNm?=
 =?utf-8?B?VE5zUlV3MllaVFpEb2w3eEpzU0cxb1ZENnV2bC9vQnA5NC9HODlEMGhZeXVE?=
 =?utf-8?B?d0xrbDl3Mi9pOXg0Y0pSbHF3aGlidTA0ZDNlNlVZNnc1WXBIQlZxQTZWTi9k?=
 =?utf-8?B?b1B5azdPUVRwSU5rTFdydTMrN0lGdURCK1MzaVM1Um5yYUZmc2Fld3Mzd0c5?=
 =?utf-8?B?U1ZMcFFrUlV3UXhDTG9jenFvNEpETVN6RU5UYnBnUGdRUG1pOGQ2alhUb2VB?=
 =?utf-8?B?Qnd2Y200ZnV2aSsreFl3NU5oRVphSHUvaEdWVTY0S3pVOVlCbHdQeUFjWllT?=
 =?utf-8?B?ejJWZW5pNXZSbkNJUHltRVByQ016V1JxM2xOemVmZ1F0NE9xRHBQekhsMmY1?=
 =?utf-8?B?akFBNU44SmhFQjdQZFNjYXdlMGFsaDBnblltbDJ4Z2pVa1UyRXduRGVkeVFS?=
 =?utf-8?B?dnFNN0JFRXptTVJ2bmtvaWZRYkdUZ3RyN3VGSVkxbnlocTRyQnV2TDM4aHdo?=
 =?utf-8?B?WlRnTU1SQWhsblBNSmkycGQzbEdGY2hxQ253MFZQcDVuWmV3L21TNHZSRmdO?=
 =?utf-8?B?UHVLREp0TUltZnlJV2VJeUVsa2haRGZSeDZGQ2JtZVRsdEtrVENpb0ErNjdN?=
 =?utf-8?B?akIxN2hXR3ZPQVpvV2o3dTRRSlZVRzBkd2J4MWRqZnlESUJnRElSbkJoQ25m?=
 =?utf-8?B?a2RHdTYxMXhaV0ZmeEZlTGJ1dXZYcThzQ1hVeDkvbDdMa1BCOXZpZkU3MjNl?=
 =?utf-8?B?cmN3elVRbUNtK2FvSEoyNGdrVTUxenRFc1E3N2RlVmhmT1oybVZkSWNEbXYz?=
 =?utf-8?B?R2JoWXZVUTM1cTNGa3hnczRHV01vY2p6dE53TWg1R0xVejd4cWRzNFk1TTFE?=
 =?utf-8?B?R3p1RlJ6Q0tBYzlvMFlJMldlWGJzTUNQRmhLM3JXaHNEaGRRQTlPTE5UbzVl?=
 =?utf-8?B?WVo5UzdvSzFVUzdQdERxNm45R3NYamwyWGFKZllkTEFrM1ovZVA5OTFlWmVu?=
 =?utf-8?B?VFJHcFMzTHM4Y1FoWExsYm50ZHVZU2luQzQxK1J1ZmozRUFxb0thRkxUNTk5?=
 =?utf-8?B?VjB0Z2owMitITVM1ck1ERm1oTWZ3dUE1NFRKSlQyQzJLZ3dzUWRmT0MyTDIr?=
 =?utf-8?B?U3YzcEZaRU1VV21nODVUV3RwaEdCaWh2WHV6MjhUcW5ITUwvNXZWM0haK2Vp?=
 =?utf-8?B?cjFjd055a2o5NXR3aGF0bmQzMmJrVHZLZjRSUk0vZCsxbGRDWGNobHlxOHht?=
 =?utf-8?B?dzZtajFZUk0vaUt5dVlSRUhXVTFzNnlPblEwSDVNMkZ6MkJJV0MvRFFOR1FE?=
 =?utf-8?B?M01PclY0WGJRYnlkRm9YN0E0UFlHeXdqRGx0M2JMU0p1T21TY2pNcVlQcXVk?=
 =?utf-8?B?c3l0UndQRFdRNDAxeE4vREsrK1dTOVBpYnIySEVaeHI5MWI2TzFMSER6VEpB?=
 =?utf-8?B?OElxZG5sUnlyZDNwbVlSUk5tdCtWOXNnY0RIeFRjRE5vUE9GVjlpdm9oQURs?=
 =?utf-8?B?aXRvMit6T2w5R2J6SnJIRFRXdy8yV09aUFVLVjdsa3E1L1VPMDY5ZW5adytT?=
 =?utf-8?B?c01xUXZIKzBJdEFCZnQzdzVLakNDTWdlbkhzZFRWdzNIV3V3czlwbGlldjlZ?=
 =?utf-8?Q?6PgMgpEtfaopi0TNPU0Q8WY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d9329a-55c1-4881-0c54-08d9bfdda034
X-MS-Exchange-CrossTenant-AuthSource: SA0PR03MB5610.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:14:44.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TF9vzTYxb4b40zzbFLmm6vhjj9jk5y1j0azvXggMuAlPchquk2+DyXerwrSjXbzVz92D4eijPQNO4HxgZQvJwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2415
X-OriginatorOrg: citrix.com

On Fri, Sep 24, 2021 at 11:55:57AM +0200, Jan Beulich wrote:
> When a page table ends up with no present entries left, it can be
> replaced by a non-present entry at the next higher level. The page table
> itself can then be scheduled for freeing.
> 
> Note that while its output isn't used there yet, update_contig_markers()
> right away needs to be called in all places where entries get updated,
> not just the one where entries get cleared.

Couldn't you also coalesce all contiguous page tables into a
super-page entry at the higher level? (not that should be done here,
it's just that I'm not seeing any patch to that effect in the series)

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: New.
> 
> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -21,6 +21,9 @@
>  
>  #include "iommu.h"
>  
> +#define CONTIG_MASK IOMMU_PTE_CONTIG_MASK
> +#include <asm/contig-marker.h>
> +
>  /* Given pfn and page table level, return pde index */
>  static unsigned int pfn_to_pde_idx(unsigned long pfn, unsigned int level)
>  {
> @@ -33,16 +36,20 @@ static unsigned int pfn_to_pde_idx(unsig
>  
>  static union amd_iommu_pte clear_iommu_pte_present(unsigned long l1_mfn,
>                                                     unsigned long dfn,
> -                                                   unsigned int level)
> +                                                   unsigned int level,
> +                                                   bool *free)
>  {
>      union amd_iommu_pte *table, *pte, old;
> +    unsigned int idx = pfn_to_pde_idx(dfn, level);
>  
>      table = map_domain_page(_mfn(l1_mfn));
> -    pte = &table[pfn_to_pde_idx(dfn, level)];
> +    pte = &table[idx];
>      old = *pte;
>  
>      write_atomic(&pte->raw, 0);
>  
> +    *free = update_contig_markers(&table->raw, idx, level, PTE_kind_null);
> +
>      unmap_domain_page(table);
>  
>      return old;
> @@ -85,7 +92,11 @@ static union amd_iommu_pte set_iommu_pte
>      if ( !old.pr || old.next_level ||
>           old.mfn != next_mfn ||
>           old.iw != iw || old.ir != ir )
> +    {
>          set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> +        update_contig_markers(&table->raw, pfn_to_pde_idx(dfn, level), level,
> +                              PTE_kind_leaf);
> +    }
>      else
>          old.pr = false; /* signal "no change" to the caller */
>  
> @@ -259,6 +270,9 @@ static int iommu_pde_from_dfn(struct dom
>              smp_wmb();
>              set_iommu_pde_present(pde, next_table_mfn, next_level, true,
>                                    true);
> +            update_contig_markers(&next_table_vaddr->raw,
> +                                  pfn_to_pde_idx(dfn, level),
> +                                  level, PTE_kind_table);
>  
>              *flush_flags |= IOMMU_FLUSHF_modified;
>          }
> @@ -284,6 +298,9 @@ static int iommu_pde_from_dfn(struct dom
>                  next_table_mfn = mfn_x(page_to_mfn(table));
>                  set_iommu_pde_present(pde, next_table_mfn, next_level, true,
>                                        true);
> +                update_contig_markers(&next_table_vaddr->raw,
> +                                      pfn_to_pde_idx(dfn, level),
> +                                      level, PTE_kind_table);

Would be nice if we could pack the update_contig_markers in
set_iommu_pde_present (like you do for clear_iommu_pte_present).

Thanks, Roger.

