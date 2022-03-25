Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6094E71BA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 11:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294665.501125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhfC-0001xs-HM; Fri, 25 Mar 2022 10:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294665.501125; Fri, 25 Mar 2022 10:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXhfC-0001uQ-Df; Fri, 25 Mar 2022 10:59:26 +0000
Received: by outflank-mailman (input) for mailman id 294665;
 Fri, 25 Mar 2022 10:59:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+r7I=UE=citrix.com=prvs=076f4df05=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nXhfB-0001uK-MH
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 10:59:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a09a64e4-ac2a-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 11:59:24 +0100 (CET)
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
X-Inumbo-ID: a09a64e4-ac2a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648205964;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s8wYYiBKEzS1T01ityJi4Un6alKEoH5DKQbVVVMus4k=;
  b=YfLg/cZ0GxPaZoC3WD8BiwymUykvGCeBIpbybouXWWglyB9dqtIo37ks
   hvDhdV58cTk61j6Nhpdd0XGi1eVGeeWCjeLvsjO9BYDQpJFsUTNJm4bLB
   g3gjavbh1Py/IMGmz/qJooRV7LX+hGvVcGgclhPGzB/O9x5mIMXEp/bG4
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67064726
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lv/6eKmTD94Wdw5kq1fIfkno5gxjJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXUGmEPquNamqkctwgYIqy9ksE7cPUyN9hSAtrrSBhQiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiWV7V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYSz8rJfDiv8EkQwRgDQ16EoN25buYGC3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3oHZvwCufFf87aZvCX7/L9ZlT2zJYasVmQ6mGO
 ZZGM2QHgBLocj1QNlRKIYAEv72vq17DSgQGkErFqv9ii4TU5FMoi+W8WDbPQfSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCnFSWz3c7FB4SWF20sPS9zEW5Xrp3N
 Eg86ico668o+ySDUtD4Vgb+pHOCsQ8RX/JRFfE37EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5t3jX4iNht1FSVFI8lSfPryI2ucd3t/
 9yUhCoGha5Oo+ku7rWmxU7rhx2CloXNETdgs207QVmZxg9+YYekYamh5l7a8etMIe6lc7WRg
 JQXs5PAtb5TVPlhgATIGbxQR+/xu55pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgarsU6zGLoC6TLwJs8w4iPIXM/CdkyfdoElTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHxunD6OGM6qlE78uVZ7WJJzYe5UWLdpRrpkhJ5oXS2Pq
 4oPXyd040s3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI9cFzN/8T5mOt7E6Q8xvw9vr6Ro
 hmVBx8JoHKi1CavAVjbNRhehEbHAM8XQYQTZnd3Yz5FGhELPO6S0UvoX8doLON7pb05kZaZj
 ZAtIq29PxiGcRyekxw1Zpjhto1yMhOtgAOFJS2+ZzYjOZVnQmT0FhXMJGMDKAFm4vKLiPYD
IronPort-HdrOrdr: A9a23:BmBGTKmmSNZ4e8ctJ8iDvtdnEv7pDfPAimdD5ihNYBxZY6Wkfp
 +V88jzhCWZtN9OYhwdcLC7WZVpQRvnhPlICK0qTM2ftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdeEYbmIK8/oSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYHNu/xKDwReOApP+tcKH
 LKjfA32wZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6Nq+TgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQf003MwmP29yUkqp/1WGmLeXLzQO91a9MwI/U/WuondrdCsT9Tpa+CQd9k1wga7VBaM0pd
 gsCZ4Y5I2mfvVmHJ6VO91xMvdfKla9Ni4kY1jiV2gOKsk8SgDwQtjMkfAI2N0=
X-IronPort-AV: E=Sophos;i="5.90,209,1643691600"; 
   d="scan'208";a="67064726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVD81u7NDWD6ubu5OjdZ7SfqyHZuwZS+flXA3bRQG4gsgFBhErC2+1LA9Pq5Dwur6VK+7B82QrF/CAPlA8DFIueHub8p9pBg+bxHTE6YaSW/6XNj1f4LoSoYLo738Nhx5/bfJTTFrWFsB2LN6U5HF5XbUPicrjs0JvJo00qU9PGKbAGaSRx6xKp7Mm6gRRkdKD/BD6Mdwct4O5iCfNzjGoYykLV7vrAZ8x5FADbzGhi7JU9Uujjw/jl65NoYcc1ew6FvsEuVSvILRqcN2xrZNcmwVbCZaJWUE4RL8i8SEABTjiSodahfx3lwEnNUOR/GqxIBtCIyb/kRWPsRpNHUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s8wYYiBKEzS1T01ityJi4Un6alKEoH5DKQbVVVMus4k=;
 b=SS5f6zkOsjIDZy4Gm/vkLS9wwdIFC7c/XkD+6eSA0uVblc/hWVYM0re60FAuA5A2i5+bh5+r//P4OIQgEPCeRgItCM2i82zXpaGV2TPjZ3GQYNtQUQdPFvwsxhrHiNx6jqKzjY0mLqFcJJL2z//VJnAXLlPF0JGgVMo+aMxwA1etUyMIAwHd82qXQwQlFDCIgNpzjuJAEKRsFZgs8jLR2caut+/kLzijuzdZnXGQwWQE6SqBRiYLxTl5Nv+MyjTDh822y4tvflG/7ZB0VMoAjaYluBFDhvRJQMUXsLTrDO7uZodrYxCTMR8j40edv7JRnMHOLevxquZhBCdRWKFXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s8wYYiBKEzS1T01ityJi4Un6alKEoH5DKQbVVVMus4k=;
 b=czKAtRP7bMGaXm8DCCrg85fCV0i8RDiYFCTIwlrSb6kIUilyyaywfqGWInacUaEumFIZb1etHaTr3d9pwCtLrn3LYXly8rZNasTTtG5owMeLJkImFeYmwv905QLBjwYDuVZHO9dZ4+cQd9rQavTXv0zoHCmPzpI/jy9+GWBldS4=
Date: Fri, 25 Mar 2022 11:59:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 1/3] x86/mem_sharing: option to skip populating special
 pages during fork
Message-ID: <Yj2ggiWlxvYdh1dJ@Air-de-Roger>
References: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb927228a8f68ce983ae0b46e6665b5b8dd0764e.1647970630.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO4P123CA0330.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a8485f5-01c4-438a-8dc5-08da0e4e82f2
X-MS-TrafficTypeDiagnostic: CY4PR03MB3093:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3093D67BD1EB26D156F805728F1A9@CY4PR03MB3093.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dI8SCT7l16G3i7RcssC7bhZ8FGG0m6appWHj9urSJj1Tn/F+3LXTbi+VjsodBUaeeg9+WbvaEHYj77RNPCU6dEvTfRqVCTXlikB/Hs6WduLk0C7BCyuw3CGxFttslaXW6ICvjV8zDILTX/1/uQrr7HN0W0C3un0hP4Mgc9Kr6d2s4BVVW38qiCIs2ilGHsa6y6Hbdyen9lf0PNbqZNBTGBy03LpjfBRtarfAs3tc3JgTSTO8lvF2OI6uivUP/B4jgH4qa7Ig1ang/iBZBHSGW/vEmR8RWk0b785xAUFJlmI4+PXTWEfI1wQ2xMa4La+ZlwiFzqdZDYYqqfXG/ul9axEWze8+qyj3CHrktRqcOm9ItEofWeQq8qrmlr7Vb1KiBEmd6maniDWPD1i6DJfduaHo85U9h1N2wvORvjU4RTx5g70YhBr0yQcnFK36taNZaIQ2MauESWbfZTFpJcIc0tMp9oUK4oAD3L5bOih/j9IvWgLmLhXXS6aMeSBojjcpPsSPdRjobfbLuwE3NiDwdUB9FCAphZDcpzpUq+eX0KNHS76A0jKgRnUfmzsJUVwS+75AQxGYu3vn2ZlXp2EnA8jAvP1jBnoqb8H2u/uth1ah47VMI+8/8XOK55KcjhHiNTfjGA36OfyyWtQA9D16cQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(85182001)(38100700002)(6512007)(66476007)(33716001)(83380400001)(186003)(6916009)(9686003)(4326008)(82960400001)(2906002)(8936002)(6506007)(26005)(5660300002)(8676002)(54906003)(86362001)(66946007)(4744005)(66556008)(6666004)(508600001)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm1vemRLenl4dkRTa1d0Yis4dWtsczlKTE80T25oQUxvd0R0b09sVTVrcWth?=
 =?utf-8?B?WWlCYSsrUWd0Mmk4bVJRUmw1cGx6ODQ0cjUvNURlVlMrTko3d0g2UmhEZVIz?=
 =?utf-8?B?cEVMelVwVkh6Zk1Ea3pZYU9zLy85dlVnKzExQTg1eVlyVzJsRis4NFd0RHJt?=
 =?utf-8?B?V05iMGtzb3pRMkwwYlozYVFwK21wQ3hGcFZtL0lLVmtrNklFUTRKaXZxTVps?=
 =?utf-8?B?T25uQzdQZWRxUE40akFaSlFockd5dm84RTlYa09KWVMraGNGOVcyT1VxOVVE?=
 =?utf-8?B?ZC9JRGRlNWswS3psd3dReTExSVE2b04zMVUvQXVWVG1kRFd3Qi9icExhakg5?=
 =?utf-8?B?cGhUZnBicGkvcy9vZTNZU2twSFBYUWFGREJyR0g2WXZMRm9HQVJKaDdPS3Yy?=
 =?utf-8?B?WkxFL1BHck8wQW1KZUJxeWR3VUFDRmJxS2todnBSbGdRa1dmUjlranBrUXZq?=
 =?utf-8?B?cm9XUzRFTnBlM3V1U3E5eHlRTnh3dm1DL3gxZGNla2lsWkwrQ25FcnNVb2ZS?=
 =?utf-8?B?SDlxT0hwTDdRaGlhNFF1MEEyTmsycklvd3dwWk93ZWw2VGx5MVlXT0YzdzRp?=
 =?utf-8?B?QWFkUnY3M3k1VnI5aDE4ZzZZcllMTUFNWWl0U0xMWEtDRHMxMnR1bmFta3Q2?=
 =?utf-8?B?MkxzUHJtMHlPTm5VRlFXdTUzZGMzV2xtV3U4ell2UGFqTGtsaHFZOUJzTEY1?=
 =?utf-8?B?NHdkWFFzZFlHcFppK0VSVzBuY2tXQUlPT3J3Wld1VzZLZVhhT0RkZUxETkhK?=
 =?utf-8?B?NVYrbXB4YSs3T0VhY2dnUGVGL0dwVnByajhhYmhqdmF1bk12eUxIRkUwbThR?=
 =?utf-8?B?S0haR3gyU1J1VzFyTHArZHFFM0QwYjdKa1NRVzRUa0hRZ3B6MWlPai9DVjdh?=
 =?utf-8?B?UGhzd0I0QmJnZEkxd2hNM1JQUG9IeWFLM3FaQWdGaXRoS29JbkZZRzFPM2t5?=
 =?utf-8?B?OHU5Yy9nVWtDOFp2Z1RWb2FEb2pxVmJ2cm1FcnNOU2c2Q2VFSjd2bnlubVZI?=
 =?utf-8?B?QWRITWVzZk1kMEhOeWIzM24vNGxHdHVYZUxIL2U3UzlxMDcwVFFPSnQ0QnRj?=
 =?utf-8?B?b2d3YW1PUmU5ZmQvMkMzSVJ2RW45RTJ6TjdUSllWQmpKb1RvZndpNEl2R3dQ?=
 =?utf-8?B?U3BHUmcvdTU0L1VuK04yZUdvYVZQclVtajlsMGNEc2lVaXZuS0wvM1loc0t1?=
 =?utf-8?B?UWtDM2syMlVhcFRldzlmLzJ3MC9xVWlQbkgxL3FsQU1rL2JTbmxjK1lsZ2Rs?=
 =?utf-8?B?aWVXS0l6bS9tb3FxL0lhUWlzcENoaFhlOVVBNktzaFZGN0wvb0JUaFVqSHFS?=
 =?utf-8?B?NVFtY0VjcFJYTnRrZTVESzNCR3JieU1NMndEUDR2dk5sb2R1dTZ4NWxUNi85?=
 =?utf-8?B?anhneitjUkYvZ0JhWUlOMGUzZjZISmV4ajNNT0J6cVo3NGpTNW51YzVoNXRM?=
 =?utf-8?B?ZGpGaDFPN0l6eEkvTU9BVEx4dVErSkJSY0grRzVHNjhPY0VtQkpGdTRLVG1y?=
 =?utf-8?B?SExjQnNqaEZyalJ3VzByUEtaekFNWEFKcVZTMTFRWHRxbTg1b2orMUJDV0s2?=
 =?utf-8?B?WDV6OU1BUm1DQnNkaThidU9pOGZpOXBLTndSR25YUGNEaVZNQW1MaWl5eUJ3?=
 =?utf-8?B?NXh3T2taMWlnUTBuL1AvR0lDYVl4UUpncFZLaUlPd0x6YlRUT0JmbXp4RFNS?=
 =?utf-8?B?WDN6OVlaY09oM2VlaVRqQkNGUnRYQ2ROZkEvMEpkNVlaS0FGOGY0ZnFhVzAz?=
 =?utf-8?B?UDhOUGZsNWtyVE1vRUlsQ3pPdkwzUmFRME1tN01IQXZPV3A4RHplQWFyaEN2?=
 =?utf-8?B?Q2lsckZ6ZFhic1ZpUzJqN2ozdm1IUXhaam5jeWRMUEZQRjl3UDczQWkwcE9q?=
 =?utf-8?B?dm1BR3dIdWZPdklSbW9nNStRK3Vna2cvM2hKVHM2SGpCOU9MWnU2aUh5U01M?=
 =?utf-8?B?SW9xRUw1aWQ3UEdsb3EvVy9Canp2bEFhMjQwdzk3VThFbFo3d1lvc1gwcjZ5?=
 =?utf-8?B?aHRsTlQ4Ym9RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8485f5-01c4-438a-8dc5-08da0e4e82f2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 10:59:19.4455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1ub9e6CkCS/VsCgpxXowlzf55ZCJ1C35fepbCrlZJV7B1gE9sxV/Lb0KT0LlUe0gLonVAIaworegNWTFBnHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3093
X-OriginatorOrg: citrix.com

On Tue, Mar 22, 2022 at 01:41:37PM -0400, Tamas K Lengyel wrote:
> Add option to the fork memop to skip populating the fork with special pages.
> These special pages are only necessary when setting up forks to be fully
> functional with a toolstack. For short-lived forks where no toolstack is active
> these pages are uneccesary.

Replying here because there's no cover letter AFAICT.

For this kind of performance related changes it would be better if you
could provide some figures about the performance impact. It would help
if we knew whether avoiding mapping the vAPIC page means you can
create 0.1% more forks per-minute or 20%.

If you really want to speed up the forking path it might be good to start
by perf sampling Xen in order to find the bottlenecks?

Thanks, Roger.

