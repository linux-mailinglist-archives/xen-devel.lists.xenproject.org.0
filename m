Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50B6D18BB
	for <lists+xen-devel@lfdr.de>; Fri, 31 Mar 2023 09:38:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516948.801882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi9Kd-0001rs-2d; Fri, 31 Mar 2023 07:37:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516948.801882; Fri, 31 Mar 2023 07:37:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pi9Kc-0001pQ-Vu; Fri, 31 Mar 2023 07:37:54 +0000
Received: by outflank-mailman (input) for mailman id 516948;
 Fri, 31 Mar 2023 07:37:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTo5=7X=citrix.com=prvs=447f045ac=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pi9Kb-0001pK-DD
 for xen-devel@lists.xenproject.org; Fri, 31 Mar 2023 07:37:53 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef5635ea-cf96-11ed-85db-49a42c6b2330;
 Fri, 31 Mar 2023 09:37:51 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 31 Mar 2023 03:37:46 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DS7PR03MB5416.namprd03.prod.outlook.com (2603:10b6:5:2c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 07:37:44 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Fri, 31 Mar 2023
 07:37:44 +0000
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
X-Inumbo-ID: ef5635ea-cf96-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680248270;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=clWnBxpLLT5C3ApFVuUe5q6p0Jl6UZft2aLPOiBnOGM=;
  b=dn8VzS8M0HltR3E4SV8yV081db0OshKU1hyMXhQwNNwpBPqd9ivpaYoE
   jmI1WbMXT1ILPLzDVail1ShuaXUzl+XHC3pprwymuy+EFuPryA9ene2yx
   lC6VkLk/OUMqzWMWgdopAOxu1FoeNByaUom5CGSECldn9rNK63Dn9jeRZ
   U=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 104196197
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WKIEEKpT2y32wMin0CVKyIoKm7xeBmIlZBIvgKrLsJaIsI4StFCzt
 garIBmAM/bYZ2GjLdsja461pkgGsMLTzNI2TwI/pHtgES1D9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzCBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABsSUzyhocay+7LlEOk0q559IM7ae7pK7xmMzRmBZRonabbqZvySoPV+g3I3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3j+CraYKMEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpOTezmr6816LGV7nBDVSwJBUKkmtC8tXeTVOtDM
 UcZ1RN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WAqnc4jrBK1coTjfzjpBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:OsD+dKv6zf0l9p89Mfu0y+Qu7skD7tV00zEX/kB9WHVpmwKj5r
 +TdZMgpG7JYVcqKQ8dcL+7SdG9qB/nhOdICMwqTNGftUrdyR6VxeJZnO/fKl/balfDH7VmpN
 VdmsFFYbWaZzUX/KWKgjVQUexQp+Vvm5rY+Ns2oU0dMT2CqJsP0y5JTiieGk1yAC9cBZQ4E5
 KYou5KvSCpd3hSTunTPAh/YwEAnbL2fV7dACIuNloC4AmKjTSnrJv7CQXw5GZrb9qH+9dSlF
 QtizaJlZlLrcvLuiPh6w==
X-IronPort-AV: E=Sophos;i="5.98,307,1673931600"; 
   d="scan'208";a="104196197"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B80eWaAhnhD083jL+7eBNK5UTXNORYtLZNM0KnYooxgez9wmV9272iDl2VeZknMxUnxw6jh/xXbLB7tEeoeMN9X24i1zTvveLzf3lAMkuSL3hO7WEqazEBFNU5shxKcH0ZpxrzQd4zEaluCOemlTfB7o8raf1zHQh9NJaNZ4qXuW57pQFgB1QKtu4zI14F00+bkUZzQHVRSHLKYZ+f5wzdB7Ur0PXJa4t79HDh9CJJikp4yoEy3pX869t9AKGagCEA68rVTP3HWasPmYg2P013/N3AJdWQLSYA2UB03DQRL0aJ0u8iYDvwHLEvwGt6hvh+nfpqar/qUQBzix1t7lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aI9uKe9hlSzwKfouteDkfCzenuGzoJ/N2quFscoYNA=;
 b=C+etPsLb1T3QwDYCJqbBYolYvkDopaPiaZM449u84dJPU218Bc1pt3DOYcRhsXcN655MNneqzafQNtmpGi4/QsCfxqzp7HHssStKrNraoZaG/D9YRVhq+0Hz0/K68Jc2wS4FUfMjwe3c9q04EFxhhgzP8x1J94u6Z8WbwSoFiDnXps8ZUa1uNtrrQ4b3S9fJ6LucpwAosbQzLyYOxqTOWhsOOjlBh7mHTm3BGMdpDVRvunrCCjeAORfWS1pcFegHCK/8gj9uN4bZ8xnnQNSzs0lLg5wU5agnrGqscM18HGsJG2UlzpmLz6FjSLA+e2DCQgZtlGFk4TanqCUdr1difw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aI9uKe9hlSzwKfouteDkfCzenuGzoJ/N2quFscoYNA=;
 b=LiThyoZI2wBHTjwC5X8B9Z+OD/ZOpIIsopwYrRzauI3tv1Y2dut3ikhZPa+kTNZDumPP4e3uxjMwYr3IsTdjnlRpjvAbZCNN0JApWR9SIdyPFbjJr0gFT3FIw8jhZdspdQDYpuRlWxuh21bvCAvO5oHAhiNi/rMl9fp5K8tK1P0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 31 Mar 2023 09:37:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Message-ID: <ZCaNwp6dJg5MhRpP@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
 <ZCWuYjP7L4obvXt9@Air-de-Roger>
 <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
 <ZCW2IHKP4GHNmBuk@Air-de-Roger>
 <6dcc187a-5e81-2f36-4104-d9caac148cdd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dcc187a-5e81-2f36-4104-d9caac148cdd@suse.com>
X-ClientProxiedBy: LO2P265CA0151.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DS7PR03MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ca5a4e-488d-4184-095c-08db31bad0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ir54nCXd35xnMzXPezUEkF+b5WNr1F8nJS2wqkLSH2O0cSCKrb0Yx6Q3B3UT4LoyhWT4iUlotNzUyPbMEkIhb1axJki1mXQOaLiH1R4AV8Ims/dmxuEU/77F5f97cWLSo/6XTexPaE2wL/FyuSu+eA2j3eVyM112JAV27VyHXh0SgkZjhegNNwH/9Vih7DVPt+c21tpSj61XwOYsCYlkleSkHvVYRT2+0TkOqhqOi3zS2/BYFgowq0/W64/4RiP1ZS1a1FtUmsY+CHBgsWnskDKNpYNK/clAmQkDjIXWRdyEpZSWvo+UD+4d9oXXFqVSEDEkIZWMM4hIvmveBoskyvs9gXCm5JCv4SOI9dDNOfUDJ/r/8xwZa1FlKRB1gkA1OI1A4bGUDxQLy3iSQWFPei87A8DRaZ02BdIzZCQwOUjF7aB7ks1cNEb/6hzlwcEDFpSFzlnwaKL0JcHU93+hiHxmwoFuVrQhjdTrdxNmDOv59H9EG6UXr/+8QkEslRuwJZSsugIN7l1/ypYFvWGqq9k6gK6I7mXGl5dC6BBXgGVgQwRf/Y8b6l0EYnPtCWid
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(451199021)(33716001)(53546011)(186003)(6666004)(6512007)(6506007)(83380400001)(26005)(41300700001)(66476007)(66556008)(478600001)(66946007)(316002)(6486002)(6916009)(8676002)(38100700002)(2906002)(82960400001)(85182001)(4326008)(86362001)(5660300002)(8936002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdaTG9SZ2dRWFMvbVF6QnR1eHllRXYzNG9ydGNoaHFyTmhPVjl4em93L3dl?=
 =?utf-8?B?TTRoOUtNNnZkU3VGbzloYmxzNWNBS0tFTVA5VForM2IvVlBaamU1ZFd5bnpG?=
 =?utf-8?B?eDBSUW5oT05nMENVb2I3ekJOOWlZQ0Q3UE9HWkUyaFNIQ1pJdHBQRlNBZlNY?=
 =?utf-8?B?RTZESS9oV00xTWI0QTBxcGI0VkY1TlR6UmdoUFU2bGVpM0RQT1ZiaG4rbmJh?=
 =?utf-8?B?YWYwNVJBcVJ1S1o1NW5VeTJDbkpZY24wMlh6Vy9iRFpHckhNeGt4d0ZEOVNa?=
 =?utf-8?B?ZlFPV05DUytPK3JiVXBCbWFpdnlzMXFwUzEvOGFGbS9ldjBNeHBGQkl4aWxQ?=
 =?utf-8?B?L1M0c3d5WGNCN3FSRll3aHN0WWswZjhwM0RyblJDY0llcXFMWVdaNW02Zjh1?=
 =?utf-8?B?VkJ1NUQ0T2RsTmpGMDFhdGQ3QWtRRDhmVnJ5RzFYRVpMVFhFdGkxWHl2RHFq?=
 =?utf-8?B?Y1dpNE5vWG9IOHpUUy8rdFRPcDJBN2QvdGpMWC9oSFZIVDE2UjNWbXF3clls?=
 =?utf-8?B?alVkM1lBa3NkTnJiRi9LOVd1cWxROXMzVndZQU1EY3UzVXAxT2tHcjVadm5Z?=
 =?utf-8?B?eXpxeWNibVZQYWllSnVTMXlxK0ZPK255dDJNaHdtLzJSSmUzZ1plS3dXNGNE?=
 =?utf-8?B?Tmk0THA2TlVIQnR3b0hJR0JCc3E4U2plb2ZVLzAvRW43RDVRYlZKNWdoVUly?=
 =?utf-8?B?eldHUlI5RWJPS1pOK3lKZ2xxUW5sc05Fc2Z6OXNCalpCOU8xTUNpS1Y0TXpT?=
 =?utf-8?B?YW1IaDlwWEhDbHkvVnp4SlE0cWdwdGF0RjloMkVXSTBEYVduUUFuRldCMzFP?=
 =?utf-8?B?dkFueXBsNGZ4R2ZVSHJ6bnlwYyszL1pOQTd2dC84a2pFNXpYanAxeFJib2po?=
 =?utf-8?B?RlJyL1JqYmFLa2lSUFJPOUhaZ1dibGNhUWR6RTRzQXMzR1BsNy9sMGx6eW9P?=
 =?utf-8?B?N1YxZks4MktEc2ZXbmoxVDNwNFJNNWJiaGNMODVldlA5OENpWkdZS1RQd09q?=
 =?utf-8?B?NFhIdzFOT0xkeUd4QmNmNFdUS0xLMVpvTjY4V09lMjMxY0FZZlU2bkQ4ZnNy?=
 =?utf-8?B?VEZpM1p4Vkl0U3dSaU8rc3lMLzYxL2F4L0ZYK05hTlBKMTRodXZ4SkJVblFY?=
 =?utf-8?B?bTdZcWl4Ri9nQ0dnS3lKRFFKb0dUajBUVUFweitoOWNBTkw5V0NvR0lpUzky?=
 =?utf-8?B?eTBBN2xEU3BnLzNYVzVRSU1yeHQxZlNsa01NYStPcmxFY0JCZS92YmpZRUNp?=
 =?utf-8?B?M2g2VWJnWjlwc0UyZDdjUWtKUjh0VEZXbkhpOVRPM25QYmdjdW1vY2oxRDM5?=
 =?utf-8?B?cDBqTHJweHUyU1hrNm55cUdMWEhFeEZhWVVSUG16ZDN1WjlMc2I2emNzTXgx?=
 =?utf-8?B?UVFjNHRsWVZQYUw3R291VzRvK21hMS9NTWFoa0pZNlNtNW5sZ2tWUTlhTWN6?=
 =?utf-8?B?aXhJYkxsc3A1R0FLRklXS3ZyZXFlS1ZwNUZESHJ5SFVMbGNpSXZGMjZqQkZ3?=
 =?utf-8?B?QllDL2JQdHRXVGdubnZ6WkZzbXdnWC9OZ0dIL055T2J2eVpnQ2U2dDVBQ2NN?=
 =?utf-8?B?V2MwRXVJWFM0Umk5TXg5SHBPbTdMa08rRDlqSkJORGU5cTh6eWpHUzlBdHVi?=
 =?utf-8?B?anBuNTZDakJGYU5rS1ZIb0Y4N3g5L3R4QlpQdUkzVVBHSVc5TTljZGgwYTNZ?=
 =?utf-8?B?RDdaYlR2a2lMelVtQjZCYzUvUmNwVWlES2hwTkxreFE1MVM0Mm9JVHNyY0Fa?=
 =?utf-8?B?RzNiSjEwSCs2dE9MNHdXMEhPQXkxKzV0ZCtWeXZPRnpLZVJ4MVhsaXJrbUdK?=
 =?utf-8?B?R3pkREk2M0IxR0dLYWZWWmg0THVveElRNkZ2ZTZXMUFOTGVTdklia0hDZzdz?=
 =?utf-8?B?SXdpV2hXZjNOSVN1U0JtY08zb0xlcUJoUkZEbFZUMkJDbzdXMGloRXNVMkNG?=
 =?utf-8?B?bzkwbmhweTZva2MzWWtCbmRtcXYrdWlkc2ZRZVNIUUVoTS9iOFBGZmhTNnFm?=
 =?utf-8?B?QzN2MjBiVlRLRnZGSzNlUGxZQThjUUp2ZTRDa3B6WlJGYitWNC9NWXd1OVhS?=
 =?utf-8?B?akZjZ3FmQzZreWxMTEF2T3dKbmJCVGwyQkp0WEJmaGJhTnNVMy8xeUQ5UmJS?=
 =?utf-8?Q?x+IZ7+1zjaUjRW0vvqC5afui7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Es8xRueY3Lp6lkSAi+3jQOyurd67jZvDgG8Iij9For6WXwCnsxqEjVqD5kh7n8BeJy1vObOQCjZOXNYyJZ8Sd92pXxK2y5ktVdU86oLtBN1xeC/iyJTFzSbRB3owhLwUge1Qp+2N1by6++i9iheQYDXjFs7d4FxvlzrpedTOX/SXmZOMtetzS+qGDIbOiEfpJMupsJj9Abip9EsSq1xJW9TKNZgj3xAk17YCgMdtn6YezmUEmpt/tXo8LCzY3CejKm8BSTKiPtZWoDjaXwOpBYjV5LHguMBl5d/re2O8F/QTDdpnsh+4+nEA20+x/hdCyBhs63mE1kz9dfk0qhPn0iiBHScNg8UXqWgS/v7MPDxp9WkcmnGLlNUHzxQDFlkp5/JGlImf1GXsyvx0yRB599DKDmlUDWigbygIWaNu4nvcpp/v8Ql/QozkxmuDQjCyOA2aMLsxec6tXwaCecTK3GPhcrF4S8wOoX3LZljPKjdpqafgRfp5kJAiNA2RbwZAjcgLi84u7Tvx0lvg14spBBgJ/52bGCESaheKjclWwHYhNI1NgamFY4Un2/bLiDdsTCoC6bSRVkKrs+9RdCyQoR6xOTeSJU0OpLVmJgZ1WJTRnXpqfStJ+R7EQqt1kA2+EjbSkQNb+EtQv2dWPZdSUuWZ4mg31qpf11CLTR2Jjea7G2bFp2gte/yrp0Fl5B6j5y7npSP/BSYBlt8wHtPIQfe6i3IB0yoln/2N6G5OS35edxEjbNy5BZ6Fzsj7tDCbV/uyjllw+NtHTxRukKkNGyi7d6sOVCpSqEnAQrvbwNK+mQCRO4NAe2XmxbNWwoTjwFX3brZP8FMuWnOvpnQ2/BV8PPSaQ48T+h6L8h3Vn18=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ca5a4e-488d-4184-095c-08db31bad0c6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 07:37:44.1874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6z+HOqhcWl2ErXntGTefLO4JQgGAQPk35R400qt+zLqDCG8kyWgAY445tp5xWLthnm4s+MpefE2sCA9bz3oILw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5416

On Fri, Mar 31, 2023 at 08:51:46AM +0200, Jan Beulich wrote:
> On 30.03.2023 18:17, Roger Pau Monné wrote:
> > On Thu, Mar 30, 2023 at 06:07:57PM +0200, Jan Beulich wrote:
> >> On 30.03.2023 17:44, Roger Pau Monné wrote:
> >>> I guess I'm slightly confused by the usage of both GOP and StdOut, I
> >>> would assume if we have a gop, and can correctly initialize it there's
> >>> no need to fiddle with StdOut also?
> >>
> >> Setting the GOP mode is done last before exiting boot services; this
> >> may be a graphics mode which doesn't support a text output protocol.
> > 
> > Right, that's what I was missing.  I assumed that all modes available
> > in GOP would be compatible with the ConOut mode.
> > 
> > Would you be OK with leaving StdOut as-is when booted from multiboot2,
> > or there's a chance of things not being properly setup?
> 
> On modern UEFI it may be unlikely, but I think it's not impossible (see
> below).
> 
> > IMO it's not very friendly to change the StdOut mode if not explicitly
> > requested, as in the multiboot2 case that gets setup by the
> > bootloader.
> 
> May get set up, that is. If it was set up, then yes, we probably should
> leave it alone unless told to use another mode. I.e. no vga= or
> vga=current should minimally result in no further mode change. Aiui we
> can't easily honor vga=gfx-... in that case, so leaving the mode alone
> there may also be better than trying to guess a mode. The only time
> where I would think it would be nice to switch by default even in the
> xen.gz case is if the boot loader handed us the screen in some text
> mode.

How would you detect such case?

ConOut is always text-mode like because it's a
EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL interface.

Would it be a matter of checking whether the current GOP mode is
valid, and if so leave it as-is unless told otherwise by a command
line parameter?

I would also like to avoid the unconditional resizing of the ConOut
interface that's done in efi_console_set_mode(), as that has the size
effect of changing the GOP mode, so I would only call
efi_console_set_mode() is there's no gop.

Not sure it's meaningful to change the ConOut number of cols/rows if
there's no GOP, maybe it's possible to have some kind of screen that's
usable for EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL but not as a GOP?

Thanks, Roger.

