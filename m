Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ECF6BE437
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 09:47:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510944.789554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5jo-0007co-Pj; Fri, 17 Mar 2023 08:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510944.789554; Fri, 17 Mar 2023 08:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pd5jo-0007ZV-MT; Fri, 17 Mar 2023 08:47:00 +0000
Received: by outflank-mailman (input) for mailman id 510944;
 Fri, 17 Mar 2023 08:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=001K=7J=citrix.com=prvs=433d55c46=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pd5jn-0007BV-7n
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 08:46:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44e83177-c4a0-11ed-87f5-c1b5be75604c;
 Fri, 17 Mar 2023 09:46:57 +0100 (CET)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Mar 2023 04:46:40 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5854.namprd03.prod.outlook.com (2603:10b6:a03:2d3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:46:38 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.031; Fri, 17 Mar 2023
 08:46:38 +0000
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
X-Inumbo-ID: 44e83177-c4a0-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679042817;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t0OEirx9zGftTpCImJXvy/ledlxjoNBKK1kfZqiKssk=;
  b=PtoZoDIm1EmIEYNomUA4hdUpgxpQbg9ypLyS0OG744TmrCj0tArgRtMd
   HPf3tyVpqELYyeVWb/AUz8mBn5HDXh5U56Ju7iE24NlvvAabqYSQwBJcE
   GjfynNQkbDhOCsSPPDBOpinJjX+y8ecHUnYeI+nSYtxkCuzl08Qksp1Rt
   Q=;
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 100039690
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hqEJq6/xP9VypjOqrwTJDrUDR3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WYWXG/VPPqIYGryfd90Ptu+oBgDuMLdn9M3SAdprCo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqkU5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklK1
 9dfMwAzTCmyisnp2bjhSLhxl8IseZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpgNABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraXxXugCdxDTNVU8NZ4kkG29kwrJiZNFkq2m6SZjUmaBONQf
 hl8Fi0G6PJaGFaQZuf6Wxq0sXuVpCk2UtBbE/A5wAyVw6+S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKkrhw/LZsZuFuiylNKdJN3r6
 zWDrSx7gqpJi8cOjv2/5Qqe22LqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaL5VdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:/cG5hKupvfBdh4dMLgQJiHAd7skCHIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YaT0EcMqyNMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPHxXgspbnmNE42igYy9LrF4sP+tCKH
 PQ3LsxmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX2z2oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD8nTLdny3blBo+4X7rzlGVxVPlvMzCXTo/T+5Mn5hQfBf141cp+IgU6t
 MD40up875sST/QliX04NbFEzlsi0qPuHIn1coelWZWX4cyYKJY6aYf4ERWOpEdGz+S0vFQLM
 BeSOXnoNpGe1KTaH7U+kFp3dyXR3w2WiyLR0AT0/bloQR+rTRc9Q811cYflnAP+NYWUJ9f/d
 nJNaxuifVnUtIWRbgVPpZPfeKHTkj2BT7cOmObJlrqUIsdPWjWlpLx6LIpoMm3ZZ0zyocokp
 ipaiIViYcLQTOuNSSy5uwKzviUK1/NHggFi/suqqSRg4eMCoYCaka4ORITe8jJmYRtPiSUYY
 f3BHtsOY6TEYLfI/c34+TAYegtFZA/arxhhj9pYSP7nuv7bqvXi8f8TNH/YJLQLBdMYBKOPp
 JEZkm4GPl9
X-IronPort-AV: E=Sophos;i="5.98,268,1673931600"; 
   d="scan'208";a="100039690"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9r1j5hOZs2vdUUcqg1ahBD52yA2dkTdKlz36ZmnETV39m7rDHTOWK35sdOEwhjFbgxfjaCKHW377Wh0Z4DM0n1uj+r1+tXlRG81EQpDJpAxaZ8VEMfvBeervD+ULLY36LFVHzFMmU/YhDkd9rDlk31JiJqMUJKBoqj287DHIOyT881+yKFNXbTq4enhw8CHY6mIbXXgn4rj0KGnx60gWRRRgl9DIsK517RG2D3tG62htdSfjrRwkKog/6i+097qOSDmABupYWLMhvSL+zhYNsbBubc3Asl3NQYO912xTACRSw8HVCZd/MONjgmdNzjLZyxaxAk9t9FpQiwrFBYChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93WeSr5BtWLHQEeJWLoSd9iHffiSN8bU3At50x55zA0=;
 b=A3L7x2uV8MZXqVmLEz/hkI3lfpn3boYj4ldKq+zeNHlt6qmzwd6WqFIDp8t14jgKzxxh2WVU33no+3pvJQRL0OnFI9UeEU2TI/qtdvxTt61t9NBrOm7ov+iq5sX8zTWfBLCYMbofAP8Fm/dH5GgO9pZhCbCFI1YSl3uqA4og+9HWQzYC0V4EWIUuo1T6hWQNJxUhraC/Jpc7CgyF63P4W1pJFK/vQlYQ3MgcO9nDVUu/ax9Kvy6BW+/+0NhYL+/+xZco3su8QO5xxS+a3HozqcbktzAGCPrP4GFUUcn6Wg6QroR3I7I20/Zr5SDBpv1kf/3BdZCYwaB5qqFjeRYOog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93WeSr5BtWLHQEeJWLoSd9iHffiSN8bU3At50x55zA0=;
 b=Ahe3nTqIuNRmFwvRVZIJb2IEbHAjv6mQlSo78jPzSSbInGcaH+fn20/K3nWN67Oz0ezclcglj8u7wvYMGPp9fbENF+mwUiDU78E06lpNpXPvw6YVEC0k+UbLBBBxuK82ITIeQtpCcwVD0Kg5hMfWn/sUw+BohL0s5Ce7w5/i1RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 17 Mar 2023 09:46:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 6/6] xen: pci: print reference counter when dumping
 pci_devs
Message-ID: <ZBQo6fjoGpODjuoR@Air-de-Roger>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-7-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314205612.3703668-7-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 9497493a-2e20-4ba6-1fbf-08db26c41f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gaEM9gqk4dz60U5AXKtANbRknE5ud+YCuKhjBx/bk0rRYPvKuB9SbG/DXgcE+LucL5peFGt51EU0GWi4iS4QFAmex7FBdIVKdDVEyX+ruDV6CzKcw1WShxaeOnldVvQutkLtjWoCn2E3BPlcbrhh+wSCequq1CIW3gs8IywfhVxOY0aso4pJNEVZne8EzcYad0M8iYbTGuNgyATkAw+EfhLF5AefvRh55+kIesEb+KJIKuNDuS5WWjeLvs/8jAFlBfx2NZ6OMVfZawBCv4C8ii56jRfn2eYywLo61i3vKVS3IABRoTpQegouMncGmyz5qX91YQumG/dUoIvMre0rZJtaqHGoE0vP9D61hOTBsQNtO+3OF/JQMbTmvPrPKsWG5uR1ZtXe3zXUqhKWhTiVztujQuozIYMtqzcqXgubS7lTiIwk6iYrMaITNXnJmB5FP2e4Ak/MYDDDiAWFohMcRXHRmqp6YBTwjuGv0QrcVgisbR2Xqttut1XHOSaVlvGj4PgCdC7keoSZ5XGI7ynsAoCvrqujUam4jeztdmgsRN/DfWE4FsRHxFviRxy6pgG+ZkGbpiJCNH8TuuIbhg4dThNmOhYDYsJcP5rtqBsZEQa9KPvP6MGTS1ZwNcPYdTIn/BPaivjT06hYROSTQjBXfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199018)(85182001)(82960400001)(86362001)(38100700002)(2906002)(41300700001)(4744005)(8936002)(5660300002)(33716001)(4326008)(6506007)(9686003)(6512007)(26005)(186003)(83380400001)(316002)(54906003)(66556008)(66476007)(66946007)(6916009)(8676002)(6666004)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0EvNkdxWlZ4NjlYSDNMOWx4bEZjc2w4QjNuNkhMK3E0L3VWT3hjcWJQL3pD?=
 =?utf-8?B?ek9lekZNWXhrcFovS2VhOWVnV0t1cjNUQmRZZDVGQU10OFlJQndHbnRQUzA2?=
 =?utf-8?B?MG1uazlURFJYSE11WitIWkNwRkJGOEdSYVRwaGN6Y05SVkVqaTRzemJReGtG?=
 =?utf-8?B?cFdFSHlJNnZESUF1WjBoZkp6ZFpMb2NwaU4wOEhkL2J5OGVGNE8vYld4aXVm?=
 =?utf-8?B?Q096ZG9tb1g1MHJicGRvOXBpSDl2SEllNnljSXJEU0s1NFNCY1F1YWY0Qi9Z?=
 =?utf-8?B?SEFEQ0dZZ3FGVnllZkZSbU1sK2NHUEl0aWN2d1k0Z29iUDJySzg2bjJyQzBR?=
 =?utf-8?B?bGx6eXFkQnZRUGx1cGNiY0JvSThFUCt1WlF1NVlocUpIZjJxdWFPQTdBRG81?=
 =?utf-8?B?MStEZ01vMUg1NnFkckJ0TUl3QXlVZ2Y4OFhpZlRTTjQ2bnNGY1laWTR0WUh5?=
 =?utf-8?B?bVJTaEdYUUowYncxY1VVUEw3dGpPWmU5U0FSeEVlaW5MakVCREhpa25hQXkz?=
 =?utf-8?B?Vm14TjlLZERUQkZuWDYrb0c5VjNrcCs0a2E4Ly9NSHFlQTE0MUZmYUxMeFRh?=
 =?utf-8?B?RUVSQS9ZUDdxM0dZSDdxdmsxb0gwVUV4ZzBXMlBJLzFuUndpTHNiODI2T09m?=
 =?utf-8?B?S0REUksrNHUxdlE2ZGZXbGVpVGd0cjM5T0U2SUtmSWtNNGJqZkFndVZnOVE1?=
 =?utf-8?B?cElNK1VySUtEdUpOTUJlb3lIU0JqM2xFaEViWWJHYmw5eWlMaDd6Rm1EQVho?=
 =?utf-8?B?VGlGRnNvYlpMakNTTDBGTktBNiszSmdGRE1sMWI3U2NiS0hzWWpGYVYweHFr?=
 =?utf-8?B?KzMxZ0JZa0xpNlhYK0xzdnFqaVpRMkJMdEhMc1RWTVBBQlhwNjhvZCtNL0cv?=
 =?utf-8?B?T21xTGFES3cyaUNUdnA2bENTNW8xVFFIUWZ5M1Z0NmYvc3o5ZnhhZ2ZKRnds?=
 =?utf-8?B?QzJHM3ozMStQMWNIUXVQTy8xa2h4cTV4ZC9VcHI3RkpUcU5aT3lNQmtnQkxI?=
 =?utf-8?B?RkRFWlZjcEYwL016dVFEaGRUVUYxMDJwVjBwemw0SjVCK1pDWE9xd0xYdk1N?=
 =?utf-8?B?eVdvTEU4N1NhU21UUEtGeXVUcXpuTXVxNE9aNEhOVFRXL3pFMUJNeTB4T2Iy?=
 =?utf-8?B?M2lHZWJSaGFsTjAweW84RHdHK0NnbHU1R0lUSHNUREdtNzhwTDA0bC93M2Jj?=
 =?utf-8?B?Yk9HNGxWZUVpaCtzb0JsQ1VVMW5MR3pZS0dST3p2QXF4TmJybWI5emEweThI?=
 =?utf-8?B?cllGSG5HMkhQQldHTytZWkkyN2taRk1iYVB6MzdLQjdTYklrSDFNUGorMXV6?=
 =?utf-8?B?bE9ONkdOOHUxZFNRdk56VHZnMkxXMDBCOFNHLy9xblRnV1ZNS0YyRnZRbWpj?=
 =?utf-8?B?S3FSN25icGFtRHBkU3JlVFREemV0Z0U5VEFhcmhvNG1YOTVOeWpURXlLVllo?=
 =?utf-8?B?d3RTTkY5YXRLT2p0dmlnazA2UnMrS01YdU1qZXVYSTMwTlBwMmdHUkVPdEJM?=
 =?utf-8?B?NWhhRTB4YkRJSjhqaGRSK1F4STRBY3JrOExHYXlhVzI3emx0MzNYOUFOVHAy?=
 =?utf-8?B?M3k1SDJqZ0RpVHZUTWRPdGlkdUdBWWpqZ2p1b2VrV1ZUZXRHVmVsNzh1eDN2?=
 =?utf-8?B?SkdMTjI0MHprWUdaZ3hwUjBjNmxvdHBuVGVRMjhZL3NYL3h4c2tVUkpPbzBX?=
 =?utf-8?B?OXM5RTdnVzhwamZSWVExTVAycjNHOVcvRVYxV2NBdUhTT2FQMlU0L3RaVmN2?=
 =?utf-8?B?SUwrQnhSTkQ3YWRPSWIwR1ZKOUdsUUlpeUZPcTkwT3ozRGpYNzJCamdGNjU4?=
 =?utf-8?B?eXQ2Z2t1YmovRTY0U2NLTHN5VERvcy9BaXFWbWNmbUM5eGx1TWZsei8yMWNv?=
 =?utf-8?B?Yjc4b2J5c3RQcUhIdnBiVDk5djZLYkZKRE9jNDNETHI5cVZ6U1dCSFRiME9w?=
 =?utf-8?B?bHBoUlA3SnBybnZ6Uktwc29nU2Z4VVppRjJFTDBSRTF3MDU5MlF3SWQvNFZY?=
 =?utf-8?B?d0E0YlZ4T05KU3ZQNUtZczE1SGdhVlJaQzRnL1h3dU50SjdVb1pGSXhERlRF?=
 =?utf-8?B?eXVqWnR6MGc1ZFl4cjlVNk5hMEtKaFVSMnB6U3Eyd1NDSzFEeWtzQi9yR1ZZ?=
 =?utf-8?B?allFVVFpSTc1VlVSdkxVYUY3OHM1Z1VxSjJhWm90SUZGaVFpcnR2TWk4aTQv?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gbpej4wAYaFlTrSUn61gwEU6lLldncrcTxqS3v/flz1lpeAK+b1QGLXzkue/7fbbafaIEmY7hMiFlJc66zl/r8iTudX422F9K0bD3KVPAVFzyHjPJUGTb2FREWuON8H5byt55kAJQ9cUMb6HMjzIoXLTfLUEIWv1UJWlgJXWdsNWYsM8mkkaW0+A5YmEBhr7gNo7wicAF2Add/lRig1ZapChFY9/AgWxAc31/Q4aHRGidRCpwNuBFoRCURrTLs8e85w5jQG81WnZOfBheD+wEpbwJa0B5UbNnhrTs3t97cgXDKkME9LGXvBD32fKMm1oemR/D3V/7DtS4Qn0Elk2EUs73waNa8Wj8TsXh0jKCJCr7JrWxvmNXB+qVHhtk20Htv+3bIeWzKDYwv6E716ZVtYxKykSZhiS1rJUyn7IctC8D/LtT3yGbsAqlYL2tIcMQuECN11QikNC8t061EFrjcWY705oO8N1S/61B/5nSOlBGdYSRf618LNDHchdAtGCN23BMXpCaBexkCrpzEZlXpBCFmrWPeZKwbJ+OGiiZWNb3/4tDaMLNG19wotvGkDbujtkicFb/xQXeAV43WFYdBDSf0dmaMY9cIsbJWDIawQCxXTzTIZeFe2EjxIGTbNfDbWGiw0ErmwSkAc2neaUgdMXYbJ1vnYueNFk7fViyTSYikNTVcuy6X6UF+PeAwg40cZImizGYy9kq9wazYQtOx5iVC5Qt97nVPvNDLnjS1KohvEqSL6w5MFY9kJQOlyIaVeHmfF4c0/hfG8GDKfFGD1XdkhNPBMd+tHfCjaw54by1XkKEx90t8VlDd9VgJVPYMPdHjgam0TN0zu93GBDYF8MqbJNTkFuF/JEKynYb54=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9497493a-2e20-4ba6-1fbf-08db26c41f3a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 08:46:38.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKRFOAV7uOXaQPjhOyrBuW6Zb6IZcn4Ng+GjEpYwvHU5K4oYZy5QsgHM3ygK/UOBMCJ4usYHqOH6CFqAoasIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5854

On Tue, Mar 14, 2023 at 08:56:30PM +0000, Volodymyr Babchuk wrote:
> This can be handy during new reference counter approach evaluation.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> v3:
>  - Moved from another patch series
> ---
>  xen/drivers/passthrough/pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index b32382aca0..1eb79e7d01 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1275,7 +1275,8 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
>          else
>  #endif
>              printk("%pd", pdev->domain);
> -        printk(" - node %-3d", (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
> +        printk(" - node %-3d refcnt %d", (pdev->node != NUMA_NO_NODE) ? pdev->node : -1,

This line is now too long (> 80 chars), you need to add a newline
between the format and the argument list.

The rest LGTM.

Thanks, Roger.

