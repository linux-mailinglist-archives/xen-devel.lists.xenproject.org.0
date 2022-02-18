Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3554BB8CA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:01:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275313.471146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1wk-0006Lc-ER; Fri, 18 Feb 2022 12:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275313.471146; Fri, 18 Feb 2022 12:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL1wk-0006Je-8j; Fri, 18 Feb 2022 12:01:10 +0000
Received: by outflank-mailman (input) for mailman id 275313;
 Fri, 18 Feb 2022 12:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtLv=TB=citrix.com=prvs=0411da6ea=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nL1wj-0005gu-Fk
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:01:09 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73f8fb1b-90b2-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:01:08 +0100 (CET)
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
X-Inumbo-ID: 73f8fb1b-90b2-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645185668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GhD/MKCyt1tNObvGu7VW+kHZJjYgGOKLwY2vmd6FRxw=;
  b=HfHCDlN3MqFB8g2vl5nnxLGluoEjqVsAqvjbLLbUedyizKtlqnTe7L4m
   CsbiwshK0FpkPKBjAMERPiBMpFqXZ77uyOszKGxD3O7jhjvzLVf9PI6Fe
   lqU+xA9D7DTqcvYC6CVv+aCSCOtUGzc/ObRI55rhNKCeiggUMCDBVN72Q
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64510430
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0GJR+6sOUb/GInm4f1dxsXMDZOfnVGleMUV32f8akzHdYApBsoF/q
 tZmKWyEaPaOMTPwedl/bYix9BkA7ZOAnNJhQVc++CtjHiJG+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nU6
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8kJ6yQybQ4QyNVGiw5Bb8d2Jj6eXSG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 5dAMWY0NHwsZTUTOkhHEJ81jN32jyP7QyFT73yl9K0etj27IAtZj+G2bYu9lsaxbd5Ogk+Sq
 2bC/mL4KhIXLtqSzXyC6H3ErvDLtTP2XsQVDrLQ3vx3hFyewEQDBRtQUkG0ydGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJgOtc/R/6pVwH2Zzk
 AbUwZW5XlSDrYF5V1qQ77bI/GOXKRIYJGJFXT1fbSw4u9Xa9dRbYg30cv5vF6u8j9vQED72w
 iyXoCVWu4j/nfLnxI3gowmZ3mvESozhC1dsu16JBj7NAhZROdb9D7FE/2Q3+hqpwGyxalCa9
 EYJlMGFhAzlJcHczXfdKAnh8VzA2hpkDNE+qQI+d3XC3270k5JGQWy2yGgvTKuOGpxZEQIFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQPsUoLlPfrX0wPBT4M4XRfK4EyPBX1
 XCzK5vEMJrnIf4/kGreqxk1itfHORzSNUuMHMumnnxLIJKVZWKPSKdtDbd9RrtR0U9wmy2Mq
 4w3H5LTk313CbSiCgGKod97BQ1bdhATWMGpw/G7g8bee2KK7kl6UKSPqV7gEqQ495loehDgp
 C/lARYAkAKl7ZAFQC3TAk1ehHrUdc8XhVowPDA2PEbu3H4mYI2167wYeYdxdr4inNGPB9YuJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:3oBo06Frx1TjikfapLqEN8eALOsnbusQ8zAXPidKOHhom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGKK1FdAR7sSjrcKrQeAJwTOstdH06
 Fuaq5/D8C1I2RboK/BkW+FOudl+cKA9q+wg+fY0jNKdiFFL49dzyoRMHf9LqVRLDM2fabR0K
 Dsn/Z6mw==
X-IronPort-AV: E=Sophos;i="5.88,378,1635220800"; 
   d="scan'208";a="64510430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEmItYhYh5pS7uF7dXvu1x3vk8HK4E+hQF8Bz86brfx08qVbyZaG0vI5pIqYZgWDNLH9R+jxSj158jkG0JbeEHDYd+CULzT8/DC4B8K53xXndxmSZLt8C8cagbY4uShiXwSrtq5Gj5f6XduJT3A5id0IvdE/vtQUlKXov1cBdMJtWOjvbQZ27c+TjqNUsnV6Jt5oEtqUVqMpTt5aZTWU4OGHnrWHKoXnmSJuwCw98ZfD9qur+A3x3EIFDk01gt1t/ac1gfXmtZQEGerGVEZ4xt5l41FyZjvsZMJQjFXVHcc5OYcflwebkVfIM/OoONmtBRJy+b59IGVtwq0lref7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VlOmKA4bVXwDcKvezRyv4XKMfbB325M9suR6eSlV7A=;
 b=OPalNfFbE4PkUJLJ5EHb4xwtdtBRukw0WVGDL6+eKOhb78Z62SmJMEEkW24XFHc5+5OBFyUyOE0k3fgM1dGqf4BodllHUWi1FP7FdQe1oEqHNNEfLU4xGFwa1xOrT7Sn3ufnlCQC1mvQztaKcRDinm/7S97s8RcEbsStQwgCCAcaeuMjjkWGHE76PN/vDlX1L0ESeGu+Pv1a30UNpPYe0O3lqwNXRAqz9u0IHm3F9stNpHTOkJ5OcwCeZRmcfxRY3k6icyhmJhWg0aPQ3VE3cpQNRP/3QhjEip5oyefpnj2nJyzgZcKnW/ylcw1gRAmAZ6G+6bDjTkPkV8XDcguNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VlOmKA4bVXwDcKvezRyv4XKMfbB325M9suR6eSlV7A=;
 b=QC+FSRjsODCfNXcKDt568cpiz0HpTRQ6iZXn+OLUi9bamcurGacHb4cSPwuyX4JmMFfq7P0ZfFL2vMTZ4/SqQZeFgy1tXh3wy8xJxsyFFV6C4mvVCdRpq4p5Al8Qire4IzvomBpqY5mm4laaw+YPZF/0iifN4o9XCr5mqUqcZnM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] coverity: do not build QEMU, SeaBIOS or OVMF
Date: Fri, 18 Feb 2022 13:00:42 +0100
Message-ID: <20220218120042.32102-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218120042.32102-1-roger.pau@citrix.com>
References: <20220218120042.32102-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0192.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::31)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1176881-5aa4-4aa0-1718-08d9f2d654d9
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5406:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB540633E4584E1D35516188848F379@SJ0PR03MB5406.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAYICApki7nit+XwgFJ3JMt3lqM56Um0qSGn5aDnPLopuceQzhcxn2AMp7V9UHEWgn5doZrPoKuNiN937MAklYQH2r/NDrYzPQjsfMBK63Z24MJCvoHOviC/uDwdzlHHcEIaF6BmWWPFruJHmbosXbOre4ztTylAUI1ga3Z0SUWzBZfl/krWhbiE1ILnOrJVGUAmsaS45st+caOUVd8JicxWFSC/LwryfNYBXO633uuYOYRu6mCfRhbmBk74D5YxaZlMYII7lKidgLTfmxHvbv6Jv9a2PvRv2W9bJahi1QenXidNftml+aeicLWlxMRon26C6ZSiEMY9yUA36ZdUrAMTTgmfwz7hovYx7HGGOqbuRWryhSg7yneU6h2Q82zJiZWDdEjnCD5sjJsTstshn63PfeLHVdWP/AZ+g0TTVvp/Zx2nwUdHzU1gL25yVo4P9tlrmO4LL3t50xMqjew5Ssgsd1sV+SrGsA26Yw61wTA6ux9fz5lOn4prjlLzzX+2UW9bq2WLWe6jz/COaGc6lqJsLIugoJ0z0cz+wDEEvwrPLeo0rLqH/DBS0NkICEt8jjLhog5l3Tvs6Atd7a7NwUvlwcelZGR0thdgdUrKjIfvolNlK7U2e1MvBC+1R5QB6KpzVhNGhgQhC1tj3oYRag==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(1076003)(2616005)(38100700002)(8936002)(66946007)(4326008)(83380400001)(8676002)(2906002)(66556008)(26005)(186003)(82960400001)(6666004)(86362001)(66476007)(6506007)(316002)(508600001)(6916009)(36756003)(54906003)(6486002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVdCY3NBRm1ORlJlbmdTbGRQRldwZnh2NnlHZ2x5RlBsN3oyZmUwTFV4bGNp?=
 =?utf-8?B?R1cyVUdWckgxM0JwUFhmZlVBUUJWczhXQUhUQzQxdncyeE5mYXl3d0FYbVhv?=
 =?utf-8?B?YWlTcXlUOE5RMURoWGlJamZWSlF6V282NytLTkx5OGpkczNBQjJKTVJxMXUr?=
 =?utf-8?B?ZS9LN20wNmVrSTJzTDRtd0pheitTVHI4SGVKWUkvR3FkMGZRWGRRa2ZrWHdl?=
 =?utf-8?B?R0cxSEwzdTdJVGE1MUE3MFpGN0RlblNoMGJPeDh0S2RycVBtaUUxNUNxclpT?=
 =?utf-8?B?WkdkSVJGSVpGTUNDdmtUMFFjWTV4S2I4TjlodTJLbGpkOUlRNzBaQ3F3bkdo?=
 =?utf-8?B?QVBqcEdidU16ZWczYVNOMGZ5cmdxS1BQUHBKRHRIK3MrNlVUNk1ocXh5bkYz?=
 =?utf-8?B?L3RKZGNnVkZlTnovQ3RMUGFQY0FCeEtNOTM2MzNiN1VPWnpOclB3Q2JLUjkr?=
 =?utf-8?B?MGVXQkpyM0ZVL0FHUEJZWDhaMkI2bSt4WEtSTTBDRndwUER6SmZjTUoxci9M?=
 =?utf-8?B?eS9HT3hLbmlNS2NPdG93V2t3a1RTem5SOUNrNWJZcW1ScXVmNnRRSkU4Sllt?=
 =?utf-8?B?TWxneW5RY1doSG5SYU1FVzJMYmtDdEJhQWlDa2tOb2hQdU8rbFF1Z2xaTUlx?=
 =?utf-8?B?Zy8yaHJoTmNUcmxtRnQvOFpSTWVBVGg1T25UWXM5QlNQOFV2MFJlVDR0OVVt?=
 =?utf-8?B?d0dMQ1VJNVkvYUI2dS9rTStPNDZNWmkrRGtUWmdzNTRIS3N0RFI2K0pxeVNJ?=
 =?utf-8?B?NW5nU09nOFBYbGpwYzJ4c2Exbmd1b01LZTNlZzBwRE1tN3dWSXdMM3ArcGha?=
 =?utf-8?B?dzQ2b2o1dVRPOVdxNDM1QmtPYUFsTExON1hzWW5MQW1rR0xVck1jTEZiZVlX?=
 =?utf-8?B?M0ljQW9ENiswQisxdnp3RUgvNXNMVjhLd1krZXJMdGlSSE1WaDBINjRNWnd1?=
 =?utf-8?B?WE94N2lSZWZVaXo2U1B5b1orQWZYK0RrakdHeHJlUWVZL0R4cXp2SjNQdG9K?=
 =?utf-8?B?SE14ai8rNjdZMFB4TExJd2E0WnJUVUpHS05HUzR3SXVJZzFjelJ0eHdOd0RE?=
 =?utf-8?B?bkVqUnFxNGlRVlppdUlwS1BRNittVFd0emw4a0t3ZVhzQlc5VVhJWDdqN245?=
 =?utf-8?B?N3pZblREd3ZTeFR3VktzSGhValdiSlZ4cGlsOTZMMEpGcVJNeXNCYzlFTEl2?=
 =?utf-8?B?Z0JrVk9CVnJFaHJwVFp0V1VnOEFzL0NUa29BWVlDaDFWbUFNdnZ6aG4xbzM2?=
 =?utf-8?B?bFNIdVRDMmdyK1Y2ZDNvY21NZ1ZGYklnbGs1NEgvTU15RU1lQnBmNlZCZXBp?=
 =?utf-8?B?d0ZBVkdlR1Y2RkZYbEVaVDFKdDZ3eHdBaGVGZjBTdGhtL2lqUVFXS1VxaDhI?=
 =?utf-8?B?TnFqSEdmUTN1NjVac3NTNzdoRVR5aGVTS1RrTGgyOCtxOVZ6VWx4YXpoVW83?=
 =?utf-8?B?MDdUbTMzR29memZvbHgvM0FNQS9CbkVFVVlPZ0VWUGpCMEdhU09JTzJwdG11?=
 =?utf-8?B?QlliM3pZbnN1TEc5ZkFWWVI2b0ZiQXYrSGoxa29STzFWdThPNkhKMGJFdWF0?=
 =?utf-8?B?WDVqeEFNT3F5RUZmenp5MTdRYW9rdTRZUUw4RnFMcnI0a2I5MDhPaGhBMGVP?=
 =?utf-8?B?U0twNE5xTFlDRU1IRXMwT3p6SHdxMGhZVjVwZGdGWGtkMTFwM1YveEp4eCs1?=
 =?utf-8?B?M0VvRE9SV0FIb01BbWdHTCtCMXlkK0xETEduaXZXVWZaZVNra1RYYVFZS2lq?=
 =?utf-8?B?bmlPWE1SMXI1d2M2NmhteHlETWVrOU4wYWxaSjZMR1huYXRNaHhsNlgvd0I1?=
 =?utf-8?B?cndFdkdCcDBSUWE4aVV5b3FkazJxdlhKV2dmWEpLcUF2UVloNlFuelJSWStN?=
 =?utf-8?B?cTREWXl5NDBtcTg3YWhGTVZDQ05odU5lOUZJZ3ZablNZYnk3SXNOdmoxZndx?=
 =?utf-8?B?YjlxTXdmRFJpeGc1d1piZ2gwcnVFcFJCOStKMFZoTkk2anB0YUZMc1Q4bnMw?=
 =?utf-8?B?TGdhSDhIdkVwZ29rbTBuZW1rM1B3dzlSaHA3L1FQc0FDWDdNRHNpa3gxRnVv?=
 =?utf-8?B?L21CMDg4bjY2SklBU2c5cTAzLzlLUmVDNlBxRWJoaVJhRW5wdk5IQk9mYzFa?=
 =?utf-8?B?dllIWGxXbk1mdU4vOVJIOUFSYzh5TmpnRXRZWm0rUi91OGFYZ2xGb3M0ek1W?=
 =?utf-8?Q?l4to8wLuVZJxAB5OLYwqDR4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1176881-5aa4-4aa0-1718-08d9f2d654d9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 12:01:01.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMBfVaniPm4tmK+Zvkfoc6Q+Dw8PQ7gxNn7T57ZortE0aB70MdRIwXWNYZf9a6pzkVpAiP3tGSMiC5B1jeq4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5406
X-OriginatorOrg: citrix.com

Such external projects should have their own Coverity runs, and
there's not much point in also making them part of our scan (apart
from greatly increasing the amount of code scanned).

Trim the dependencies now that QEMU is not built.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 .github/workflows/coverity.yml | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
index 12fc9c782b..e8d33bf70a 100644
--- a/.github/workflows/coverity.yml
+++ b/.github/workflows/coverity.yml
@@ -11,22 +11,22 @@ jobs:
     steps:
     - name: Install build dependencies
       run: |
-        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
-          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
-          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
-          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
-          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
-          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
-          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
-          libtool libfuse-dev liblzma-dev ninja-build \
-          kpartx python3-dev python3-pip golang python-dev libsystemd-dev
+        sudo apt-get install -y wget git gawk bridge-utils \
+          iproute2 bzip2 build-essential \
+          make gcc zlib1g-dev libncurses5-dev patch iasl \
+          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml \
+          ocaml-findlib xz-utils gettext libyajl-dev \
+          autoconf libtool liblzma-dev \
+          python3-dev python3-pip golang python-dev libsystemd-dev
     - uses: actions/checkout@v2
     - name: Configure Xen
       run: |
-        ./configure
+        ./configure --with-system-qemu=/bin/true \
+                    --with-system-seabios=/bin/true \
+                    --with-system-ovmf=/bin/true
     - name: Pre build stuff
       run: |
-        make -C tools/firmware/etherboot all && make mini-os-dir
+        make mini-os-dir
     - uses: vapier/coverity-scan-action@v1
       with:
         command: make xen tools && make -C extras/mini-os/
-- 
2.34.1


