Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362E54C6939
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280406.478347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdkc-0007R2-Kl; Mon, 28 Feb 2022 10:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280406.478347; Mon, 28 Feb 2022 10:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOdkc-0007OB-Gu; Mon, 28 Feb 2022 10:59:34 +0000
Received: by outflank-mailman (input) for mailman id 280406;
 Mon, 28 Feb 2022 10:59:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1tx=TL=citrix.com=prvs=051234957=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nOdka-0007MA-Is
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:59:32 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80505566-9885-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 11:59:31 +0100 (CET)
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
X-Inumbo-ID: 80505566-9885-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646045971;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yd6GiepE+qP+cJTKWNu0ORjbPnABBCUbM3ZUkWnulqU=;
  b=GBRP2G/82TIDJqiZw0xaqq0vOf3f1EI8HDfnSxYHMCR+XhKgTYzloKN7
   v3GDMlNtglIBsjsdCb6VMrsTUP6z0eGwttfF3sDkIZcXFc4w6l+vpM41o
   dfq8VGHMnbtMSh7rt1xLTsP7RJyidDt8cBAic8ZVWsrNcIoFRFUN4fut2
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65011458
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UJKrsqswQR9TyPSokXpS9VsPMOfnVONeMUV32f8akzHdYApBsoF/q
 tZmKTjUb6yNMTGkKtgiOoW+90NVv5/Uz4A2Sldo+y00QixE+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 ouoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi85O4DhuekjViAHGj1vB/de6OX8IkaG5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvll6yj7UF7A+SI3rSKTW/95Imjw3g6iiGN6AO
 pJAMGYyPHwsZTUMGnA8EZk3n9z4h2L4UBcJ9guam/cOtj27IAtZj+G2bYu9lsaxbc9YhFqCr
 2TKuWHwGAgHNce3wCCAtHmrg4fnoyT/X44DEayiwdRjilaT2287BQUfUB2wpvzRokyjXZRZI
 k8d+CsrpIAz8lCmSp/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceRjE01
 1nPg9LgAxRutqGYTTSW8bL8hSy2ETgYKykFfyBsZQkP7sTnoYozpgnSVdslG6mw5vX3Fiv32
 CuitzUlivMYistj/76g4VnNjjaop57IZg04/APaWiSi9AwRTIy4Y42l73DL4PAGK5yWJmRtp
 1BdxZLYtrpXS8jQymrdG43hAY1F+d6VNRDxoFNRGqB+/ii8wSS7bdpr4w9HcRIB3tk/RRflZ
 0rauAV07ZBVPWe3YaIfX79dG/jG3oC7S427C6m8gs5mJ8EoKVTZpH0GiVu4gji1+HXAh53TL
 ntynSyEKX8BQZpqwzOtLwv2+e96n3turY8/qH2S8vhG7VZ8TCPPIVvmGAHXBgzc0E9iiF+Im
 zq4H5HXoyizqMWkPkHqHXc7dDjm10QTC5HssNBwfeWeOAdgE2xJI6aPne5wK9M8xvgLzregE
 pSBtqlwkgeXaZrvc1jiV5yeQOm3AcYXQYwTZ0TAwmpEK1B8ON3yvc/zhrM8fKU99fwL8BKHZ
 6JtRil0OdwWEm6v021ENfHV9dU+HDz21VPmF3f0O1AXIs8/LzElD/e5J2MDAgFVVXHp3Sb/y
 pX9vj7mrW0rHFwzXJ6LM6v0lztcfxE1wYpPYqcBGfEKEG3E+4l2MS3hyPgxJsAHMxLYwTWGk
 Q2RBH8lSSPl/efZLPGhaXi4krqU
IronPort-HdrOrdr: A9a23:WV0OI64WJI1GVSSriAPXwSuBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwX5VoZUmsj6KdgLNhRotKOTOJhILGFvAB0WKP+UyEJ8S6zJ8h6U
 4CSdkBNDSTNykCsS+S2mDReLxBsbq6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsOm9LmEk5nHPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y5I2mfvVmHJ6VO91xMvdfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65011458"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQGFBXKxKzK7y3Go9TeUijjT7koQj9ozYkaMSkullJes+2iX+4WOKx11jTWQ2mjZ/BQttaSBfLaEwkHOm0aEPW2oSEOlQTVpfBkt0uWZ0gYUhAXi312rqI7AoXOBXWxPV4y/0Nm8Naa2UYSmwNN6A82FVaF7kHtlkXZr5GKZwb85Cw4xk/I7r+CVYRpxqjjDMPcuaL2WoROSl7eQwkrSDOhXBLW6Sb3nhXsnXbX11WexSWoHbmYkPJ2xrh7LU8n4LWBcSA1C/a2a7hbUac6i40i2eDV8VL9BypqoHMayKZD+eGH60rAXwrM8iUhE6UWidSA07A6p3jrev9TDXPrzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrpwPK6LCUUns91u6F/DQGdZvgM4sr1DwnnZyCRg7tY=;
 b=ClzJHNfcNPP72knnNkaH2XBV++lVqbmLr/4GFW4XdfzPiFMIIBE3KvcnsBraw2L/R7tC8sIFNFGvvnKa1OD0A18V6rRX/8JCg7PGOleZW9UGwkJarif4TX5EDdZFQ5B/CDj/XWVzV66ZWL0v1M4Vl8p1v+wNIxUyXoSxL8erGsMy5UhRi5lRCXcIdh1WOSbuoa3h9Q4uyPHJr4fbibwutRn0E+BCm27Rpjrzjx1dvCHlIV6iF/wd0prIXqQ4ydC5iAvU8gxIOr50Z6rU/H4pgLrVCDvGKutUtyAJA+ZJbsXlxYFnIW2JaCidp1s9kHMpdedgBCyCzYQG3wgsbvzAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrpwPK6LCUUns91u6F/DQGdZvgM4sr1DwnnZyCRg7tY=;
 b=ac9KF68ItQzaO0f6XWpolshlHku1i6Y5KxPU51Ev53JbBjGOA14byhC3TD9PmnBE8L0fv3hbWaat1I5Nrf9aWa4/RXKNr64FccmNRvNoC0UquNqvO7CMwXUlp3GPZw0iSUWsyhwd+m3IiJ85uzlKJfv0wrtshljIYZ0nFQ+y+Uw=
Date: Mon, 28 Feb 2022 11:59:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YhyrAyxhNtNWi7NY@Air-de-Roger>
References: <20220218172943.12182-1-jane.malalane@citrix.com>
 <20220218172943.12182-2-jane.malalane@citrix.com>
 <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a31970c-c0f8-c995-ce04-67523a4a830a@suse.com>
X-ClientProxiedBy: MR2P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b1c23d-6d3a-43fb-44e5-08d9faa95f63
X-MS-TrafficTypeDiagnostic: BL1PR03MB6168:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <BL1PR03MB6168353A63BC25272C8E64658F019@BL1PR03MB6168.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pkuMIWJBRj0yxbm8HfIB0jUDhUTTzsbqjEhBiwvvqv76lVlnbT7xCiHtxBAc33/z5+YhySohZCK8l3jktQ22w56Hv6UiKYxsfpUhwqi6BNvcTWneXyM3TgnEpdrhbVzT7ERnoGdgCgRyk7j3XfeWtLOxRXHOzlwNWIycF+0GEn/3R1ZO5SDfYlmh4byq3Sh6fXXF/zbcC6+VsAc8BbGK1NQt10ycDkWTjUEnEMBEtl6Tgm0hXjCgW5MYkneVa6cg/sUHzydgF9fpQouUHhjJ2Q7aqwbKS6+PcCEw5t4Vv4hgxMG9WI1jNDGIaX15MJ5e5tgFLl4NQj9pA2ruswhB0C6ZptvdkHhm4ZiiN1WeCpcCT5Ln6L7COm5Qsv73HJQjTi1UpwatCBuP1VsbPwY1QQZp8ExniMKIMOBvsl1T+7XbIQmIqOcD6rXcKRt1LYfmBAZSvd/hZPLapGn1XcpzOxNFIAKLg52da65BJ5bdyxGAHcSJMES7aUOpgivuRyWrUzhIHeUHEH858p1/6C73JcOHzSqhvtsL1J55aPXTu1QmqaYSqMmK76t4B/a/FXPhH7b8UVkL/c1Y0d/Lk/fb38xa1wrfXkPV5P8l9s/e+9+8c9+dekIp1g9W1DzoWzngHtbRNbPg5GFWcQeKj7s3Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(66556008)(6916009)(83380400001)(66476007)(316002)(33716001)(54906003)(66946007)(8676002)(85182001)(38100700002)(6486002)(5660300002)(7416002)(8936002)(186003)(86362001)(26005)(82960400001)(53546011)(508600001)(9686003)(6666004)(6506007)(2906002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9jQjRicFpVVmx5V0xiWHB5UEZ6dnRQMnVHUUgvc3dnUTBmeW92d1dBck9L?=
 =?utf-8?B?cHdZVVkzVCt5cFlmUGZqb2dDVWxNZlVRMVdMNFBwNmpzQ3h2WXBodm1OWGdJ?=
 =?utf-8?B?bnNyOXpld3ZGSndqRUw0K2wzYzR3ZDFQelNVZFBnbmYrNzBOMEd5RHRETHZY?=
 =?utf-8?B?WDJJcG5UOU9xOEVPRjh5bzJZSGM0VHVBOGl4VVhpV21jcU82RGJMSk44TVBt?=
 =?utf-8?B?QVpWYkpWNVl0SzZzNWcrM1NPbTNJZm9yMXZoT2M2d3BMQStNOU1hd1BBalZB?=
 =?utf-8?B?ZkVobXBuRGQrZzZheFl6Uzd6eG8rbjljeVFzVzJZZk8zRXZUQnN3RGk3OXlH?=
 =?utf-8?B?TnBzQW1SbkY2bXliQTZZc1BRTHpTaGdaZ3Z0elQ5RzRPWlJ5eDBIeGx3V1lQ?=
 =?utf-8?B?SjlzZ2V6NDd5U1lWODhkelZiclhqTnVXMFU4VFo3b3hobVpIdForWVJ1VTVG?=
 =?utf-8?B?MDVMT3N3NTYvQzRaTEVTcThYS3JjeHh5em9Yd0JYbjNtMVNsU0kxL2pZeFRN?=
 =?utf-8?B?anplRjdFRjNnT1REZHN1a21MSlNVZUhHaUVENVVWVXl1dzBDNEdiMWdqVElm?=
 =?utf-8?B?cTNqRWtGQlhnOGhqZ0xkQzNXUzdnUWwrc2hhY0xweDljSFdkZHlOcnROY3NE?=
 =?utf-8?B?ZXJNRG9KRnZYTmxUdEhqUk5UN3oxKzRWbTNtbHV1RVZFZVFqMVU1RVc1M3pm?=
 =?utf-8?B?aWI4UFJGQ2cweS85WWg3d0Qvd2k5WE5zWFlPRksvYVRLY3BHeFRUbFRRcUlS?=
 =?utf-8?B?ejdyYUFTUEUxYVBnY0M3RTBFQVYxejU4dW5Idm1jVUgxUzRBdFJ0Z1Bkb2hN?=
 =?utf-8?B?NktUZU9wTCtuQ0dBcWsveExHVjltTzVDSWhYZzR6TzAvb3VPV1ErYmlTWGNn?=
 =?utf-8?B?SDh3VlR5ZGRPRG9KbTFEend0Y1dibzM5Y1MyTzJOVWRmNEpETTEwbkFmUEFU?=
 =?utf-8?B?bG1xaURBZG9WRUpOVU1CbTRwL1dERVpZL2Jwd25zTE9FVnhnZlJhbDZMMWsw?=
 =?utf-8?B?U2x5VVBqTVZpYXNaM3FxQVl1RWl5NmNkcVMxM2hMU2xCUlRMSHhLTWdlRWtV?=
 =?utf-8?B?S2k1VUZOdHpPaUpwTE1GQjJRUDArU2IvZSt4am4wZFV4UHI3a1J3RTk5K00v?=
 =?utf-8?B?NXhMSFhQUkR0NFlyQXB1OUN3U3ZkMkNoNXZZY1cyUERraUJFZnVoa0pYbWND?=
 =?utf-8?B?Rm5NcUE3dFVtRlBIc1hBUHg1czJwbnBrWjZsMTZiZWp1eVpidDBWR0w4L1ZS?=
 =?utf-8?B?L1hIb29rb1U1LzZtR2FqcTRxbzE5WDJkK1UxNjFGTU5xUStWNlNReWtmNjE4?=
 =?utf-8?B?S2NGOWx3c3dXYkFobndIQlNScWIvMG5mQi91cXJvaFcxcEM5bHdpaU9obm81?=
 =?utf-8?B?OHNzdGRuK0UwR1lKU3Awa3hJSzhXZjZXQW1JZXdvRjR0Yko4VGt3SzZNRXdo?=
 =?utf-8?B?YjlNWlFMSlJqOUVSL3lML281emdYM2VveE9vdEEvejJmTXhMeS9sVHVIN1U1?=
 =?utf-8?B?VGdrYTYvQ2l1clY3MWd2bWN0TWVUNVVIb1pDSmttODJlWGxwU0haT0RSZitz?=
 =?utf-8?B?TzIrWXdlK1BjdmhQNTA5MUd1a0lVbmdtT1pENW96MXVicGs5WldzSTNDK1NR?=
 =?utf-8?B?UXBKTEhKUnNmVlNybHp5YVpUcytTMmJzTnBPQytLc0dvUjJpYW9BLytrR05O?=
 =?utf-8?B?WmZnVCtxZmRsTkZmRk5XQW9QSTV5dm9BNDRtQTRyTjJuY0haWXBhSU1jNUNW?=
 =?utf-8?B?M2tZb2tYZ21CeStaUzBuMmg2MkhYc3k2VlY5MzhLMXROcGZtV09QMVpWaHpN?=
 =?utf-8?B?cDZpWHQycUcwdExCMDNtd2JzT09jR3FwRzV3UnBCUUsveVdSc05FOWI5Tzdh?=
 =?utf-8?B?TW5YS1hQMVZmWVgyQXlOdXc5ekpuZk5hQVg5TFJ4MlRnOXlSTU9FanVmSkpz?=
 =?utf-8?B?bFFRby9Kd1NpVjd5cmMwOW9mL2t0WkhacFBJc2p3ZFVGS3lrMHdBL3B4K2VR?=
 =?utf-8?B?MGVOVUU0NEpyV0owd0tVOFJwMnVmUnQ4cGJYM2FxT3diTnppbkwvSVBEUzh5?=
 =?utf-8?B?bWRSSUdxb3RhNm5HbU1BTDljcng4ZTl6Wkl1TVNNWHkxeENQNFowQVdTTDRo?=
 =?utf-8?B?UTVod2JCNm9jRkc4ZnpxNnlxRDh6ZmM4M0EzV0JvTStLRDg5L1E4TXNuZXpQ?=
 =?utf-8?Q?ZAYyTjWaoe+ILBNmZsjXcxQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b1c23d-6d3a-43fb-44e5-08d9faa95f63
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 10:59:20.7498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGfPQu8vefQZtfY9jgksn6+K+TKg7AC1bYz5xXnECwhLqrHSH5R6xLBE0pQXIjNXzcK6PV0MnkevHwNPmrv60A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6168
X-OriginatorOrg: citrix.com

On Thu, Feb 24, 2022 at 03:08:41PM +0100, Jan Beulich wrote:
> On 18.02.2022 18:29, Jane Malalane wrote:
> > Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> > XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> > and x2apic, on x86 hardware.
> > No such features are currently implemented on AMD hardware.
> > 
> > For that purpose, also add an arch-specific "capabilities" parameter
> > to struct xen_sysctl_physinfo.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> > ---
> > v3:
> >  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
> >    set arch_capbilities, via a call to c_bitmap_to_ocaml_list()
> >  * Have assisted_x2apic_available only depend on
> >    cpu_has_vmx_virtualize_x2apic_mode
> 
> I understand this was the result from previous discussion, but this
> needs justifying in the description. Not the least because it differs
> from when XEN_HVM_CPUID_X2APIC_VIRT would be set as well as from what
> vmx_vlapic_msr_changed() does. The difference between those two is
> probably intended (judging from a comment there), but the further
> difference to what you add isn't obvious.
> 
> Which raises another thought: If that hypervisor leaf was part of the
> HVM feature set, the tool stack could be able to obtain the wanted
> information without altering sysctl (assuming the conditions to set
> the respective bits were the same). And I would view it as generally
> reasonable for there to be a way for tool stacks to know what
> hypervisor leaves guests are going to get to see (at the maximum and
> by default).

I'm not sure using CPUID would be appropriate for this. Those fields
are supposed to be used by a guest to decide whether it should prefer
the x{2}APIC over PV alternatives for certain operations (ie: IPIs for
example), but the level of control we can provide with the sysctl is
more fine grained.

The current proposal is limited to the exposure and control of the
usage of APIC virtualization, but we could also expose availability
and per-domain enablement of APIC register virtualization and posted
interrupts.

Thanks, Roger.

