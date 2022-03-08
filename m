Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87B04D1750
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 13:33:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286789.486431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ1h-0007XH-Vk; Tue, 08 Mar 2022 12:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286789.486431; Tue, 08 Mar 2022 12:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZ1h-0007V6-Rg; Tue, 08 Mar 2022 12:33:17 +0000
Received: by outflank-mailman (input) for mailman id 286789;
 Tue, 08 Mar 2022 12:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRZ1g-0007V0-TH
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 12:33:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb925c2f-9edb-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 13:33:14 +0100 (CET)
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
X-Inumbo-ID: eb925c2f-9edb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646742794;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Glj0s5WkRJfKduXcHGgSBWxSXxGqvijyF8t1+b1iwmQ=;
  b=GalJUxN88ob4b3bKe/iNjuZHXQwSoQEGAHTYpl0YaEYq+ir5ol2FPNjy
   8OGhA17JhPoiImEgAM2sj9cGmIl+vpLST2a0LWhQ6kvVIAx0Du58lKGjd
   qFoWQucMMm4tG3uGR2insGF13Z0rc6IhtgoFfU/U2RVzdJ5/cfACgSDAF
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65630323
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/pqJ1avvFWQTkhYlpixzN63jD+fnVKpeMUV32f8akzHdYApBsoF/q
 tZmKW6CM/aOYmDyKNF2Pt609EsH78CEz9M2SQc/+yw3FikX+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1jV6
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8mYpWWu+4ZAiN3Eh9hGYJ8p56dAlqW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pRCMWE1N3wsZTVxAnotJIo0zd32lyeuKD9oigmphaMotj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3Eru3SmSL2XqoCGbv+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa+EW1Q/HnUha/oXrCuQQTM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht9HjCCFrsbaVYWmA7brSpjS3UQAXInUFfjQsVhYe7p/op4Rbpg3LZsZuFuiylNKdJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjpeVdlQW7AGGZE2k0BxdS7T6RtaLy3GOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/lX1
 XCzK5rEMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZbgXRPr1itfPZ+205F
 uqz0ePQkH2zt8WkPkHqHXM7dwhWfRDX+7iswyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsv/BoTYH13VX71iidLXGpaxPpGH3fBVeJ8r7ILID8dZ
 6RtRvhs9dwTEmSXoWpMN8KhxGGgHTzy7T+z0+OeSGFXV7ZrRhDT+8+ieQ3q9SIUCTGwu9d4q
 Lqlvj43i7JYL+i+JK46sM6S8m4=
IronPort-HdrOrdr: A9a23:JcXEhKAqWPkozzDlHehOsceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHPlOkPQs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QD5SWa+eAfGSS7/yKmTVQeuxIqLLskNHKuQ6d9QYUcegDUdAf0+4TMHf8LqQZfngjOXJvf6
 Dsmfav6gDQMUg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0xjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXXN
 WGNPuspcq+TGnqL0ww5gJUsZ+RtzUIb1q7q3E5y4KoO2M8pgE686MarPZv6kvouqhNDqWs3N
 60QZiApIs+PvP+UpgNdtvpYfHHfFAlEii8eV57HzzcZdQ60jT22trK3Ik=
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65630323"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HERxmhygmrHBhnX5QXu//PDSM4Xse1fx/PAbhq+k41GhYFhGkeL8YmUr0ZZNys9E8CNW+AuCbEW+yhD3h4FTQjXYLHPqkQFrCVFS+FGtZdeotQyOwTdk+vmHjkbOGXeHcbmlCS1w2LILpMulWJUrwp5gJR64nUFUM+fcQvBcVnQ+shWHd9SL3YGFfDtqoLAZJyV7Useyp4k6k+lx5ig0cp9aoJI4Imge2CkUCP4IAu1FClsgyGhYzA0XROo+ESwubjynN2EwAgxe9ehHc9F2Qgn0+kRVn9yO6aSkNjo6NEJeG7iTcC+fPP315dkXzPeTQhTucb2sLBBfhfDvlSv97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C0RNWLQWwXVTO4kQL0oJOjTz3hJD7BB5iUxb4AYlYI=;
 b=myC09QMuXi5xZeP8CAHlCPdADg2ZC2AKQ6t9TdZWUJbyn4O9Bcl4RoEOr+85N6pUPGU1k1hXPxdfzo6Op2zeHNHN5itc7P1RJmQAGftoDNR3e5mul/PZ5vBZt0yodCfy4ZEz+Aip3NptO3KFw4HwjalzuicspDLYW1ASSnC4v4KxVhBUhH4UqLO048MiPXrqyJkC0afpE+KVyA7XxCOvfQVgiL8T14r0EvgtFZ1HVPB6O4rg0KfPvGuKqbT1+UZSzDAIOlnIg+X464NFVOv5t3mQKnP1E2kcTIMwD0J9sTBqN2uj2ZME5dIgwwUVNNpuSKb/STB4R1soR53C7FwHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C0RNWLQWwXVTO4kQL0oJOjTz3hJD7BB5iUxb4AYlYI=;
 b=LDuJbcmWELbQYjtPDoQYDOax8VcUix0uv+/0XVQtQwxi+7OKL1yi5FxU0EFzwil3/c3mVlvHCdLD+SicP51ADfQnVCQUnnieT8cYEWZi/b16GYgLThj0eUV3VDIx/UU4y24aFwwwUY4x0pB+BUR8eDVksMhNkh9fk8X0BCktElE=
Date: Tue, 8 Mar 2022 13:33:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YidM/Wu5lqF48zg2@Air-de-Roger>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b633f92a-151f-c7ca-0d91-cfad8d2edcbe@suse.com>
X-ClientProxiedBy: LO2P265CA0333.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cac6403-0767-4713-5c6d-08da00ffcbf9
X-MS-TrafficTypeDiagnostic: BN8PR03MB4897:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB489766E84C94CE107BD875078F099@BN8PR03MB4897.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JxawR2oVMGQBZw7xzabUIQ21rfGua1bq4T3ymOR4Ds85EiVpN5U1exJlYOd647b9iP3hL3GEvgTyJFV35uoyAU4b6NXlkLp7+M3evvJnYpZZ3IaQKT4DU2b/7Ccab7bIpS1oKSEkhsaQIit1AvzWm1sNrIBj4IdEQuxpS5ACYanVkFC7+N+XTALefgzO9HAQ+noiZigroUXpEPG1NiVJHxrH0/wwZ4yICRsW9COGQJICCwWfvhK3ZSdYo+L+MBOnhaA5HFQLKOK21Oko1sF/Cp0p1LVPwdO8ihy/JQSoHp3soEV596Lk5WEep51T0yukphNuHFSEJKDjdonNY2QpESKF8Xt5zTehDKNUCnU1JsMUoMN7fMHoxpKx0glTJMW1yj6pXPPfeVa+dSsi3mTRFZ+eOn2G5hYmCaNgElMfXomoVF6WQw+HTs+LcgsjVo0KioThlTBw82R27zzimjjLjzorEu546M5HaUx3RGlRL4Ajyrf5HOYU1W3fdS2c7HkNuqW5qjZ++gJLb+9yz38LJI+S0Yi6TKFJJi2VGv4MW1me/7s+fIg9PsvGdRsTHkl7CXxH6/MzQt7Qn++/J9TtsVuNucqZ9K3sDA/aadmtWbmDF+JT7LJpDPkQ5a8fqAHCLav7Zw5UwiOfZECLWA0Bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(33716001)(53546011)(38100700002)(6506007)(2906002)(83380400001)(82960400001)(5660300002)(316002)(6512007)(26005)(54906003)(8936002)(85182001)(66556008)(9686003)(66946007)(6486002)(86362001)(186003)(6916009)(6666004)(8676002)(4326008)(508600001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZKZlVDNTE2eitpWUhlcXBIV1RWMU9qU2RTdHRWMVVYaUdKVTVvZXBPL25j?=
 =?utf-8?B?WVJPYWprNTZiRlFyN0d4MlVBNDVmK203bll1UVFXN2E3MWFhQzZibHVhTlk1?=
 =?utf-8?B?cDRqNDFEV2RkK0pKRmQ3dDlSWHpac1hWT253c3NZNnZGcXZsaEdUUnd3RVFO?=
 =?utf-8?B?dms0UEt5TytvT0RjNVFqU21DcnhpdDFhd0RPYzlnTkFYeFlKUVVIbVE5N2NX?=
 =?utf-8?B?UkN6UEZrTmpVMjdnQ2UxZWVhRUt0ZEdpSXRqVVBkYlZnejhpWitJUVZGZUxq?=
 =?utf-8?B?QTg2RlJZQW1NbmpYUGxnUXV2ZWR4OExNSHBHTEhNM3RrenRtZE9TY0xCc3hT?=
 =?utf-8?B?MklacnM0cVNGVEtBSSsrTkM0RjBJbmFESStlbTdCSzhOZHU1dWRUbnlBdkxs?=
 =?utf-8?B?NXVqaXBSY2ZIK25JaDdSbEZoM3cwcmU5cEVhelRnZlZqTFJyL0J3Q1ZZT0Jz?=
 =?utf-8?B?amdmbVg0MXl3bnNmeVN5SDZBQWs2VENaNkZJVzFoK1FwODJoRkpOQWFpYVp3?=
 =?utf-8?B?d1pQTnlNWWNkbEFTalNwbTlIT2UwZFh3ek5ab1hkb2pMRnk4eEtVZEpFK3FH?=
 =?utf-8?B?UC9GZTFiaVdjM1hJdHNuMS92eHdwK3EraWxpcTZ4dmU2MlFIU3NNWXlxeEZT?=
 =?utf-8?B?M24wRHNhVnY4WXFDakwxSFVZaFhubkRaSGpEQlJacUhlcVl6ekhUemFzSEQz?=
 =?utf-8?B?RlJxNDVGaDVaT1ZFWVU3UmtibkxTMnhnN2NnUW5wMnNmTlI0NG12cXVkKzB2?=
 =?utf-8?B?Y0tvTUE1Z29DT3luOHJuYngwMzhObkRnb3NpMjlWdlhIVmo5Qk03R0xzZGRK?=
 =?utf-8?B?YTkyRDRodW5vV1ZiNUJVVzcrczRTVTBhdEhENVIrelNnQm92RlRFR1BTRnNj?=
 =?utf-8?B?VUpyMXBrNysrUjhITXdGaldHVk1GaFJDVDd6N0ZXQUlVcEtYY2V5VjF3NmxI?=
 =?utf-8?B?RFhublpreXVZQ1RWZm9DZEFnQ3YvZWJ1blpGYVR2alpyRzNFT2lVTll5UzVX?=
 =?utf-8?B?enhSRFhsaXNycmRIWUdRWTMxei94S2EzbDNZcVBNdmRwZzQyNGRoSTA3Uk9E?=
 =?utf-8?B?aXRORHFLZGFqTDZKMVhjVk94Ymdxb1BnZmsrczhpZFlrN09XaUZWN2NuS1dM?=
 =?utf-8?B?WWk4My9heURRM1hEV3lyTGozaUNPUmNTTW9xRVlSdTBUVVFiSGcyUU5GeWJB?=
 =?utf-8?B?MHBvQ01uL2pFUytSSzZmTVJjRXA0eG54K1ljN25qMlY2b3pFSjZLSzB0b24z?=
 =?utf-8?B?ZEFHRHFlaHVGUmFRWkFnMXNtTzhIRkk4b2FKcmQvVHBxSm9pbGdYbkxlb3pi?=
 =?utf-8?B?bHBwRFRwVEFKL293SmdNOE5jSEROVDhQWTNmUW5HZWhPMk9qTEZqNzY2STlZ?=
 =?utf-8?B?c3Y1N24vRHhmU2M0NGdsb2ZCeWhZZUhsVVlLS2lYNkZ3UUNHN25ybXcwWWY3?=
 =?utf-8?B?cmZUbExxZ2N4VDR3MjJSUVdHWUM1UjVrbVV6aXZOZVNjYUhiMkc3NHlxL2ZJ?=
 =?utf-8?B?d0tBc2ZIQzY0TUpTWkV5MTkzUzY5NGxNSk5EdHR2aVlQNnRmYkJWK0E2WE5T?=
 =?utf-8?B?QjBEMFI0MWVMdnlaWVNnOEprMVlUbklMczJXcE5nZXNoN3NvZW1wSDdnWWQ2?=
 =?utf-8?B?UnlqMWhoZngxVEZQc1FwejBJdkllaVA0bU1UUTNwUzVUeHl1NkFuNThwblc4?=
 =?utf-8?B?OHlhc2xyb1RkVE4wakY5QXd4TVBVdDA1Nm9RWXVvcHgvaXFiTkxCdGRVUW53?=
 =?utf-8?B?L1ZHRWxJT2lNak1XODFxQlV4eWQyYVlreS9jNStNM2p5RXJTV1J0ajhQay9V?=
 =?utf-8?B?bGM0dXVxY094VWxuZWFrUzE2eVYzN1hGQzY1ZW00bHpxaXJaZFB6Z0JRcVdz?=
 =?utf-8?B?cW9QYi90anJkRFlTbmVYZ24xTTFNWEJrY1I2QWZubHBtanViaTZ6aVlsemFB?=
 =?utf-8?B?UDc1N1ovY3VyVUh6THUrUWNVNjFBeU1HS0gzbGFzNDhGaUlTdW9qUWZuS1FI?=
 =?utf-8?B?MmxtdFRCMVBvOWN5QnQySU9LTVJwWUVMRUQ3Wi9ES04xUGg1QUdZTE90cDZP?=
 =?utf-8?B?RkNCMEZzcE9NbnlTeE1FNENYUGhuVnlFbTg5Wkx4dnovMzhVWWRucEtsYSt1?=
 =?utf-8?B?WXFHd0JNZTdCQ1I4cWhFQ1lta0xMc1ZBYU9kK3Z3SjdXVU1GRnkyaTl3L1FO?=
 =?utf-8?Q?jX5ha4oPy3dgpx3ytPHr7QQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cac6403-0767-4713-5c6d-08da00ffcbf9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 12:33:06.7467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIt6JyDhXZU2sHdp0ZL+98AqoK1FDG3dGYpk7rQkdl0ZZQg1+wnXw72EL6kjJ6dfye9W8J7d+5EE+a3C6ulAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4897
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 01:24:23PM +0100, Jan Beulich wrote:
> On 08.03.2022 12:38, Roger Pau Monné wrote:
> > On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
> >> @@ -685,13 +687,31 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
> >>          }
> >>      }
> >>  
> >> -    if ( config->arch.misc_flags & ~XEN_X86_MSR_RELAXED )
> >> +    if ( config->arch.misc_flags & ~(XEN_X86_MSR_RELAXED |
> >> +                                     XEN_X86_ASSISTED_XAPIC |
> >> +                                     XEN_X86_ASSISTED_X2APIC) )
> >>      {
> >>          dprintk(XENLOG_INFO, "Invalid arch misc flags %#x\n",
> >>                  config->arch.misc_flags);
> >>          return -EINVAL;
> >>      }
> >>  
> >> +    if ( (assisted_xapic || assisted_x2apic) && !hvm )
> >> +    {
> >> +        dprintk(XENLOG_INFO,
> >> +                "Interrupt Controller Virtualization not supported for PV\n");
> >> +        return -EINVAL;
> >> +    }
> >> +
> >> +    if ( (assisted_xapic && !assisted_xapic_available) ||
> >> +         (assisted_x2apic && !assisted_x2apic_available) )
> >> +    {
> >> +        dprintk(XENLOG_INFO,
> >> +                "Hardware assisted x%sAPIC requested but not available\n",
> >> +                assisted_xapic && !assisted_xapic_available ? "" : "2");
> >> +        return -EINVAL;
> > 
> > I think for those two you could return -ENODEV if others agree.
> 
> If by "two" you mean the xAPIC and x2APIC aspects here (and not e.g. this
> and the earlier if()), then I agree. I'm always in favor of using distinct
> error codes when possible and at least halfway sensible.

I would be fine by using it for the !hvm if also. IMO it makes sense
as PV doesn't have an APIC 'device' at all, so ENODEV would seem
fitting. EINVAL is also fine as the caller shouldn't even attempt that
in the first place.

So let's use it for the last if only.

Thanks, Roger.

