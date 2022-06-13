Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215375480B5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 09:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347799.574124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0egT-0007aK-VY; Mon, 13 Jun 2022 07:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347799.574124; Mon, 13 Jun 2022 07:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0egT-0007Xk-Si; Mon, 13 Jun 2022 07:40:25 +0000
Received: by outflank-mailman (input) for mailman id 347799;
 Mon, 13 Jun 2022 07:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i6zz=WU=citrix.com=prvs=156a1e8c4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o0egS-0007Xe-83
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 07:40:24 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 137bd560-eaec-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 09:40:22 +0200 (CEST)
Received: from mail-bn8nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Jun 2022 03:40:18 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6573.namprd03.prod.outlook.com (2603:10b6:510:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Mon, 13 Jun
 2022 07:40:14 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 07:40:14 +0000
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
X-Inumbo-ID: 137bd560-eaec-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655106021;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rBnydf/ec2X0WJhshZQh75Y2/5oZrTpBWNYm07Hxh6Q=;
  b=PnVw45ZXSNHvyb6cSciYUzIkGL5AQFv5LFv61IIOT/FvybMoVbwqZtMZ
   hkVZrlB1X2gh5Xgxw9ee7Znz/Y6QgZls4kzCv+r43akdJ0zMGLmQnex7O
   EDlMVuYTsDMYhDkfkyesd8vR7ZiUOEUViwCql8NXmYuHEWbO6NOR0Guym
   c=;
X-IronPort-RemoteIP: 104.47.58.175
X-IronPort-MID: 73849892
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YKH/g6LUAD27rX8yFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENSgmRTn
 TFKXDqAOfeJYzT3fYxzbtm390lQ75HQytdkHFdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh3Ncy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ixzip2sYhgrB/LziLQmUgMFPTtsG6ITrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvqXjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SKvL2wI+Qj9Sawf/WzP41Aywr/UAfHFQIXUeppKmFmXq
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLmqzd5l/AAnBeF2EcLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqVJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:zrTyw65B+Y8E5uah7QPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,296,1647316800"; 
   d="scan'208";a="73849892"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVxx0HJpUVPPQ8jvEXOmxQRvHsyU8Yw+haMqTOXUJ+E1gmEqRdiN8lAPlmk6JGrjSkgO2Xi//2wj7DeIf6JvTNMvfNZkcT+OHy1XZvN2rD+Oli7nmVB+NA8AdypqrfqQAwSQoMtCkGfp0pZzGoEk+Ht5DedsfBP1pqFJ6cnmdbt1s9nuB8fpKSZzPB4+fMZPtp/W5FSeIdz+NSPt5n53bbgZqbTW+XljlNBhLW0FXLLtuGSAItUFOAE7QZwszlSPOs7mk3pO1ErntIXPv0m+2jW8/pm7IKiLk4bXx0dvqOJjFO1jgZBId3TAN0NhPUU6KEMXjSWqHVJDSZp8wHbjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8w7gY02nkb4glripKlR+d9QOGfeSntiiD54bsEoYGc=;
 b=Uai3vFDe5jfFi0YwuMkjbwuBE0n5a0oARj5yYJWIcEUmeI7M4dvA4G/OxjDF/bGBo/vaUJyvDgc5g2fVTQ42NUssWJ/CalkZjQgdP/mT0dRbektG7u7wLKxJtQQNm/l/cML9+ZT89EiaGYOG+3Lwcl5PRr+vLw3ZKH8KeAwy+Dvnzw4152alvoylubeu7CYJMbAT1XOrifrX2q3f9Q96JNVSg5zm3jc03m70tpL8lA4TnZL14GOjXHIwF90l/Un+ECqCE1OVRvsUJyIjPp/QTt0/7f0McMzBDc6fhpFeN32PUX86kEH3MqjyqBdEEPHcqvhL4EYZtvD9OXmXUqqeaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8w7gY02nkb4glripKlR+d9QOGfeSntiiD54bsEoYGc=;
 b=g90z0kozJC53MCvOIDAjtH1g61Aa2hU38uX50n5WYHD+4eKMzB7aCDEYucq+SDO4WjL9TvI4BpfInWic51NdzDPNQv59qRBQoztzt4exCIULa7RML4SSG1ZJRKaqjjaRwdcz7vjVcBRLsDwEWvSqJdQOZ9ZeMz5KFytLzt1fiUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 13 Jun 2022 09:40:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Message-ID: <Yqbp2Ud/aNlkLhby@Air-de-Roger>
References: <20220610160050.24221-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610160050.24221-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MR1P264CA0036.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aebb0be-b870-4d23-2a9a-08da4d0ff43b
X-MS-TrafficTypeDiagnostic: PH0PR03MB6573:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB65731386E8DD4F5DD1D2690D8FAB9@PH0PR03MB6573.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/tQTsuWfd3tYdQh06F4jsKK+M+bga2RVBjDYvO2m3sTmogKyFE56xRjW8ihafLi9H5si9D2MdyELqYMEQU6IFIsweQJ9D006dlPRdZe3D4K3rBu+Znnrjdt80ET8gn3rD05wjDkj2jTo0Ou1y5lOfprLzatam/is4WC45Jm+2lp7ZNk4EzFjpeeDaYvM77l+U6zpFoh0b9+zTPX+t4PVztNZS4wgx4ojoj48B6onLU8teRmwEW6Tei1RQ+4sLLREyNtYpAxtxLxACUDodZqV2hKwsBcprhWTf3cx/d8NoiVUJFzhtvd+jgF2NSAo8U/0vhaw13UL2OsZwG3+9bWP+OxfWlzY8IqrNWfHmEonGIZi8cpo05E2czLnjqUSiYcKbgOeyQ2Z2I4WUNyhOXcwypLje65cMYrOwP6Rl38jhda0W65q4Diy4mSBcUcc4xXOG9B7ohuBzRd4uzxY6uvrOAoCWNhpI+8vC6KZyg412StfXuwfp2NoWG4y+WCl25766Ns8iyvQFqUi4Og9h+RFtGbp6cwRLJXDJgEOPQAVMsTs2vyfMlROpjmYS3GHDuLf/UnuYwbWW4J9PB6MXDd0BlJv/ocq9OdS/OP8xWEEcwf0pA33s4ZUUKwYLVQgL8THrJ0yA22xtmGv5ZaSJiLdK3tLav5z0p3Crmr9hWzW9DJp81mgmLkMKH7XINItFZUx18C7DS5KO/CSlCIaG9PmQgURHB55Z9w9Z3XoeoP0yvLC7vWK2UyC4SsASSg7y1iFh6nlmYjlbA/ddPavHS5/fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(366004)(26005)(6512007)(508600001)(82960400001)(186003)(5660300002)(966005)(6506007)(6636002)(9686003)(6862004)(6486002)(8936002)(2906002)(66946007)(4326008)(66556008)(66476007)(86362001)(6666004)(38100700002)(8676002)(316002)(33716001)(83380400001)(54906003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3ZZdEtNaXZ0Uk9ZS0tjY1hjV1pIR3RMVHlRVnJuRGYvbTE4c1k4Y0ZjTEEz?=
 =?utf-8?B?QzA1UDFaWEgwQVkxRGdZblpuSzZOamhzM1J2cG80ekY3cGp4cE1xZ2R2SmJy?=
 =?utf-8?B?RzJ6T1UzRkpYK2pON3lSSFFvU0FSWVIxTmoyeFBCWFZEZlNQYTZFQXowenl2?=
 =?utf-8?B?VFpDMnoxVElTanFFVlRTeXJBa3VhTytVbkU3NWN2QldmUDR2Y1g1OEY0YStP?=
 =?utf-8?B?aXU5dnFBU0UwNU9wcUtBUHk3RzlPRmNWN3RMZU95SXpoQ04rdmM3bzVpNlps?=
 =?utf-8?B?YlVMbFFUeVV4SHVEUXVpNU1xczh0eks5dFFsK0MvOEx5MWt6NWFwbnNXWFNq?=
 =?utf-8?B?bWlpMDMwSHJUV3dObStzVURRUHc1TGRaQTB4ZVpRWXdIWUl6YmdVSElvaW5w?=
 =?utf-8?B?QkF3UVgvdFl2b2FPN2VJaWZCOWl5N3JHbjdZMFl3TFJBbzNvdE9mQlhBYmxC?=
 =?utf-8?B?bUczSEJZNWlvdlE4dllsUFpQOStwdzlDMlBsNmdHNE5uMXB2bW5GMThjdHJy?=
 =?utf-8?B?UkJaL3NQTU9aK0VSaUJhQm11V0ZVM2xkTVpaU0tCT2NucmlQUWVBSUVWTWcx?=
 =?utf-8?B?UU5oRklySXpZVXQ4SDgvRDE5VGxSQlhIdU9DVytDSCtqR21FRzNSNGdydUhl?=
 =?utf-8?B?Q1BEaWpKUURDYXRnV2RHeGp4NkwxRlpKcHBsOGdoVnU4c1h4Sk8wVWNBcHBR?=
 =?utf-8?B?YWM0WDdJd0RqOS9LYWR2VS9jZFlqRlZBbXY1aDRMN2xTb2dvb2hFemZVaVN1?=
 =?utf-8?B?dWJlekdJbUdUR0crcjJ4dlBIY0ZUbyswbzZHWVA2bm03eXdFUVpGaEY5SElY?=
 =?utf-8?B?bmUyTjFOdHBPbWNTeDI3UUFHWW8weXJBeml4d2x1Y1NUTDBRajlvVnl3YW5l?=
 =?utf-8?B?TGZzZ3YwL2tFUWw0ekZXWnI1ek5LRzY3a2RoN0JXZGtTQnprVU5YdUdFVzhV?=
 =?utf-8?B?dnZSYmpSK0p2NzVZQXUzMEJGdHo3a0xjUGV6TmU4NU9ZUnptSkVsdlo5S3dH?=
 =?utf-8?B?eHhQWG9VQTQyUzMyaGlRa3JQU0VCMHdHOGwzd0M3QTlhQVpQeFcrdWl3cmV6?=
 =?utf-8?B?azMrMitRZVF4UWhuSjJJdmFVOVRFZk1ObC9ZQTBHdkxBUVF2YnVGM1NZZ0Ra?=
 =?utf-8?B?cFY1S2djQkh0bktkL1VvTEd0T0Y5MWRZellCS2VaTVpzaTRJc1RIaXR1MWVW?=
 =?utf-8?B?OFkrSnRUNWN4MmprK1E2NjArWmlDbzdTdVNnTHBoQ2k1RzdZWGJuMjNLUSsz?=
 =?utf-8?B?NjZsWFprL1AwRjdnclZ6Wi8xcjV6YnphSmxValBsVVNvQlBuc3ZEdklKT3Jj?=
 =?utf-8?B?d2JBekhIcnp4aXdPcTBaRm5vZzM1M3B6QWFPRmtUaWdweE0vY3o4a0xjNVhQ?=
 =?utf-8?B?cUY0SHBrRlBtTStzYlZxY2RsL2VCRkdCdFliOWRhS08zN1FLakx1ay9YY0Q0?=
 =?utf-8?B?MjBhQ21CdTBzVzhFbVRONWZrYzkwcE1yVkYvTklFR01hU0xreERyMFZIaHNM?=
 =?utf-8?B?RnlEbjRBOG1SUUV2b29tOEtsUjlPRE5QY3RGTHVRVi9IK1BEOUZTNmVMTk80?=
 =?utf-8?B?TWdGQkQ2VXFVMEkzMktxcFBVaVZRbFdKWDRmRjViaTkzK3pLeDA3cnhxc0xI?=
 =?utf-8?B?UENMN2FrTHVaZGd1NlYvOHpmcVRsVDhNWG9MSTVtOFNHY0VYT2RKVldUZmFr?=
 =?utf-8?B?YkI5YnFEZlRsSHYyUTlGTGNLdE1BZE1MZjVWVGdkcmtlSUh0UVhLWnpEcDNj?=
 =?utf-8?B?eWJmUlEweGt3S2cxaGExNXRIVUtiYnlEQkJodFU4eVFVWEQ5eGViREkyUTNw?=
 =?utf-8?B?WEVyZktKaXRyUzJnZUd2RTFjZUNLaWFXUE5WelJ3bVBPYXBqdDRxLzB5MVdY?=
 =?utf-8?B?dVVsNndielVwUDhiaHBodE9kMkd6dEZrVFpuT2llLzNYUkQxNEJsS2dBRzZP?=
 =?utf-8?B?NnYyUlBGYng5Yko4dm8vY3l4QzloZC9BbnBZdUpqeEl6MDcremoxd1dWMkxR?=
 =?utf-8?B?RVo4R1hLcjEzYXZNVUh3bnJkWTl1YjJFdlJVNUJMRlZSWk9MSjd1Y2JiSHpl?=
 =?utf-8?B?UkFiUWFIY3krNU1zbm9haC9IbmQxVHZpak0yWUhWNFREclRGdVBVWXIvMU9y?=
 =?utf-8?B?bGl6eEZJWk8vWkd6a1JJR0ZmT1FKYzN0ZEJoZFBtajF3QVlVWUVXbjVPMGJm?=
 =?utf-8?B?OEVkcmQ1SktqMVFVYVk2SXpVdFNaSk56NkkvN2p4aDY3VlFmUmx6d216TFVa?=
 =?utf-8?B?d1N1QW5CNHhjeHdNYkl5RFZwbW9rL3ZIdnVock9IVFlSRm1IbzNHMDEvQW5L?=
 =?utf-8?B?ek9WclFuekxOU1J6REdrb003STZOY3lrQUkvYUNjbW10MW5nMlZqdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aebb0be-b870-4d23-2a9a-08da4d0ff43b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 07:40:14.6224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdzmP4WZnRg3jBLHYzLJidZgifKvzfYH6ZsCxdoFb60gyuiVJMFRk1C1SBaUQS8GzCA4lISTgiVrywVRC6+M+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6573

On Fri, Jun 10, 2022 at 05:00:50PM +0100, Andrew Cooper wrote:
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
> https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/advisory-guidance/running-average-power-limit-energy-reporting.html
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> The SDM also lists
> 
>   #define  ARCH_CAPS_OVERCLOCKING_STATUS      (_AC(1, ULL) << 23)
> 
> but I've got no idea what this is, nor the index of MSR_OVERCLOCKING_STATUS
> which is the thing allegedly enumerated by this.
> ---
>  xen/arch/x86/include/asm/msr-index.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
> index 6c250bfcadad..781584953654 100644
> --- a/xen/arch/x86/include/asm/msr-index.h
> +++ b/xen/arch/x86/include/asm/msr-index.h
> @@ -51,6 +51,9 @@
>  #define  PPIN_ENABLE                        (_AC(1, ULL) <<  1)
>  #define MSR_PPIN                            0x0000004f
>  
> +#define MSR_MISC_PACKAGE_CTRL               0x000000bc

Not sure it's worth it, but Intel names this MISC_PACKAGE_CTLS rather
than CTRL, same with the bit below in ARCH_CAPABILITIES.

Thanks, Roger.

