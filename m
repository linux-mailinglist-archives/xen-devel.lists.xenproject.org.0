Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B854711328
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 20:06:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539799.841029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2FLY-0007v0-1d; Thu, 25 May 2023 18:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539799.841029; Thu, 25 May 2023 18:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2FLX-0007s8-VA; Thu, 25 May 2023 18:05:55 +0000
Received: by outflank-mailman (input) for mailman id 539799;
 Thu, 25 May 2023 18:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugP6=BO=citrix.com=prvs=502bf10e6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2FLW-0007rq-1V
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 18:05:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f5dd30-fb26-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 20:05:51 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 14:05:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5356.namprd03.prod.outlook.com (2603:10b6:5:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 18:05:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 18:05:38 +0000
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
X-Inumbo-ID: c7f5dd30-fb26-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685037951;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hd3dPrbaCsPhnxHCcLdHUfjjCGgc1frqe2LSHQE/fKI=;
  b=N2UYiZTG0sIJhOovSEwe2zKExGhgrCvFnY1U4ZTjJZz2yFPs8F1Yzyl3
   jcOCAmGZwunquCtnDMIoQveQ5JFobQg1m83Cnp5tnGfm0tVwTGXtOM3ay
   Bzscsfz5CJTJnhKd2ODHu4dvwh5Eq82OSRvzOFDs3UzuLWb8gmQ3x1iUN
   s=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 109203140
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lYJUHq1LZhZzJoikHfbD5XRwkn2cJEfYwER7XKvMYLTBsI5bpz1Tm
 zYXWT+FO/eINDPxc9wlOozgp0lQ6JOHmNNqSAs5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPXMJy
 K0bDjs2bAGi3uCXwbGDCedDmZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjCdhKT+TkrpaGhnWz2UEQUkZLWmG0hvWeinCgae8OM
 lMtr39GQa8asRbDosPGdwakrWGNpAJaW9tUH+Aw8giLxoLd5grfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOKyoitz4Hxngz
 jbMqzIx750ZgNQXzay98RbCiii1u5nSZgcv40PcWWfNxj1+YImpdom582/x5PxLLJuaZlSZt
 X1CkM+bhMgMB5yQkC2GQM0WAaqkof2CNVX0nlpHD5QnsTO39BaekZt45Th/IAJjNJYCcDqwO
 UvL41oPtdlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zK65A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:fqnAFK9NaZoLIbBvdYVuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: 9a23:eQZECm42ZNa1wXKfSdssyFxTJ5EmVHbmzmbxek2ZCGVRC7O6VgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AWua0Lg1gtUbLcCWvHENGN26BcjUjw7uDCxpWzJo?=
 =?us-ascii?q?8tO6IEixOJQWg3S2oe9py?=
X-IronPort-AV: E=Sophos;i="6.00,191,1681185600"; 
   d="scan'208";a="109203140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE3CNVTCa/Kk8b23yaEaskfbs7L1QcGK7grB9f9Z4g4qfkW9dzfGYyj09PmmxmddUNNpssMbCRbpWyndYZIiuKVsoLr0lJFVv9dLz2w3GlLDWspVaRloU4BsRzCjjob3mcGFlxyrVojx07/1kxsSRse7T8OaGqofcviyJeKr8M3PfDMwUTmIB+wQtADlXRUAkLJsL6Yx7G+LVjct4DReFevZ+zcip2Psq39Z6VGL0eQe7OhLIjco3XIBd0EuJxmfp31sFZseB9Z+LIAxsty3AuRLChuCAUAAMrhza/lZObM1eduXUSbZMB068oxZeH6F6mIJX0KnOuOEtl4qsB9e9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4GbgPiS1x1TpkNVAqOrkzAGX47h2muemCOuyQR/UaY=;
 b=IuMBNPvqbv9HjezK4fD+RZMpJToUd3GJO+3PSpk/sjQiIRrPzu15Chdj/+dGGjEIcOLnJ/Oj1v7slPaIE5K2n8SiDPc7DXCQYMSDshsG4u8KTK6inc7zPy5GamXocTFeKvWqAl6C6zGltbC+jq17XJBgYj+CGqgwo/r0I0j/RfsRzWTRQgBjcqqpzfbkcsUiqaShXX3K+9CyqWlbjbYZMstNyRSJMFf5MUIzIR03TRSjvpoS6Pn5iOmazICqeKJshnWUcIHwKV6GZoHL9Q+IzyTULh/3iJoSVUuV2hAl5Sdh+9oMqtUuW3NVKTiDg/nQOpTRgct3U9sSBdYe44MdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4GbgPiS1x1TpkNVAqOrkzAGX47h2muemCOuyQR/UaY=;
 b=kSfvuDayXJeWB9WWA5f5I9YGcyjvlye3WTToLUjVcc5uq/Q4E/MRsuAcdlvRz7e/hdNpQvbdubZ5Fj4zD5kUcLS7NmOABBCOo9RtqVz2r6EfXm6upEYoX1KmDRz8n1eRIrYiW1HpJqdRKXSkqGJaeAiBvekIM3EwfL1H2JpjEiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <45621f03-2d3e-f208-1d0c-018479b5e8ef@citrix.com>
Date: Thu, 25 May 2023 19:05:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/arm: un-break build with clang
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20230525175115.110606-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230525175115.110606-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5356:EE_
X-MS-Office365-Filtering-Correlation-Id: da734695-3606-4424-8b02-08db5d4aa47b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W6RJ9kxK7Cxa570ZOB1kQLo7wDaTvzwuu99tIiVgu77eWjiCXcN5CibBJNHW3nCKYrE6ejYY9loE8Ty+EuiF68w+lBi/lB9Kdysstwvc/Zwjpb/QOmUgtLsgU901m1jgQ5BM27QCAkiO6s5Hto/a4EorXX7cxZ6d/CwVa8PJ+bguKVn+9JQCPakEGAWMP0J5n3Cjz/iXqWdur9CekNRDXOf6imqjP7Uq+uimMQObrxQLc0iqO3dquRVCYGg8UVu1RXwsGrrLiwK4wKqpFrGBcXF4wWgu+hy22gSTAhfvrrzZPUf6uOQE9imqWQ1JhFJWzmOEUc98Hl5JxsFs0gKzEPLbdokVj1GhG7K3RHYlhyQAUBFtx//ztY8ndsBDHIKmQ72ErIhMFpmCf8n37jJ+aBywyc2zT3PiMzHYbrWVxraIFsABw/YbuDlpavFhzqqZSeDZcdqUwXjkW8uxRMOA0oK4uNhH6xuAh4MIy1+5S8I3jAvFaSuuNaTVLzK7Y1AU1/oLcPb0vPKviUQEgxze61AnVM7aVlzqsAW3adO4K3u6eAAqMi82TzivaYbVAIWy2477AHmYCtLRFxrLS4LLpFwoqqBWketTT24nJfT/Y/JtFinWEyAk7uDAald0JQf4hSgW60MG4mId1Og990nalA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(2616005)(4326008)(5660300002)(82960400001)(31696002)(8936002)(8676002)(86362001)(38100700002)(4744005)(2906002)(316002)(36756003)(41300700001)(54906003)(6666004)(478600001)(31686004)(6486002)(186003)(66556008)(66946007)(66476007)(53546011)(6512007)(6506007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU9hNzFYOTZ5aWJzRlFtclIwQkU0VzY2bWJHYjZscEVOaVg3ZzlDMmszVTRa?=
 =?utf-8?B?bUE4S25lQU9HUmp0bTY5ZGdiWU9JYnFIYVZnYVEra1FDeGpLT09aeWtETDIv?=
 =?utf-8?B?Z2xpeFZLT0RwUU42YjEwSzRreVkrMW55V0Z6UlVXQm5sYVlIZWlpNkdrT25Z?=
 =?utf-8?B?NHBaQWpZUXlrNjFoRXNVaFg3WHc5WGxMbHJpcSt5d3BhYkxNQXdpYjJtd3Z3?=
 =?utf-8?B?bzVvdWw0MnpDSk5HWU5zN2tZNUUwOE9tdzBreWxNVmd2R3dnWlMydVFyWDVK?=
 =?utf-8?B?Z0N4dmVUeDVXdHUwK2tIckYzZlBabmhuaGxvbytEcnVDbUZSbmRQenU2V2Ri?=
 =?utf-8?B?TW4zTkMzZjdVczhWWHpXOEYvT00wZ1k4QUpKZlFRTVJGWWZtemNvNlpLb1Ri?=
 =?utf-8?B?OGJoeGRvSlJhVWgyblR0TG93bXN0ZWtxNWcwNlhzQnJlUFJhdVoxYmJ0ZndV?=
 =?utf-8?B?NWFPWXMvQmlFaDZtcGNYUDZJKy81MlRTb3hVS1JIZ2tZYThuT2V5eW5Fcnh5?=
 =?utf-8?B?MCtLbUV0aityQnlaZ2h5SGpDcTU0RFlZZ1ZIcHQxdks4M01BYzgvZzlZRjhF?=
 =?utf-8?B?dTA1SG9SR3VnSndtZDVqSTFhS1oyRlhpRFhWUTJoblp0SjJ0Q1lDWGEvaVBY?=
 =?utf-8?B?YnMwMDZoY2tUb2VvUjlRMmxCMWV3c05VYTBqL29YZzRONlgzVnd0YkNybzli?=
 =?utf-8?B?c1BVSDBHdUFqbVFYRTdVdWRHYXJoR2tDZkF5YnNBbTF3Yk9GdkVkOG9peXBu?=
 =?utf-8?B?VjNLNGtIaWVmVFJqRm1MTUJRRktLOUNMeXV5MFFRZVJXdnQ2dml0NVRvWVFN?=
 =?utf-8?B?QXF3L0t5M1ZoZDhIQVVwb1pOVG9BZkhjZmpjZlE2cmU1ckJIVFc4cDdNbVJM?=
 =?utf-8?B?NEllanJxeUVMVld6WVFHQ0ppc3lsN2pqc2E4UHBwUUtaQkJsOGg4YXI5SEVW?=
 =?utf-8?B?MStPejNadmFETHZBVG1hNDQ0Q0c5aCtYTnk5VVpEY1ZEb09VeXBHNG5lRXhD?=
 =?utf-8?B?V3JaOERWV1pkTkVZUnhjZG1HMXRDQ3JZSFMxSnhrY2V2elZMTlc3VXl2cEky?=
 =?utf-8?B?V3VoWGJlblZ5czJaR2FGTmp2QlBMdDRpZUpLUm1ETHprcDA5Wjc4dkMrYzZw?=
 =?utf-8?B?dmd5WmVpcG9XZlQ1WVF0UmZLMFFMTU40OHlZZFQyWVhBNzFsWDYvemphMVZ5?=
 =?utf-8?B?YkZMYnRlWUJ0c3MwbnRhV2JENnVvVGxBVm8xN3JOWlh1Q3JPeTlTa2YxTWpY?=
 =?utf-8?B?VkJ2M2VTV1lseFhocnIzYWdJMHpRR0t3RXVScDlVQ2tTd0tybjAwQVpReFRx?=
 =?utf-8?B?MHFSSFRKeUhBUCtVOWI3VEVVeWt5dXlpNkVuZFpxT2xaNDFqblp1MnltVFNk?=
 =?utf-8?B?dTF3dzQ1T0V0amlYVzdVdnMrdEw2ajlyM0dBeFVmc1p0aDZnaEwzbG5MZmpl?=
 =?utf-8?B?WjFLeUU0aTBlaVpWY2FUbHVhVHFYR25jbXJOTzV0TnVrM2UxTUh3K3RoQzdM?=
 =?utf-8?B?a0hySm0xQjJVd2haS1B0eGhJM2pwSDQ0dDhxcmlhWmlTblJaMFpqT0J3ZXcy?=
 =?utf-8?B?YXdTcEgwVUhXQlJrSVhiNUZodGJ4Y01IdS9YVEYzMUFZRVB6U21jWVVQS3JC?=
 =?utf-8?B?eEVGZHVPZGUrcDAyYzBUK0dKeU1zV1BXVHJqRmZJakNZRk1DUFR4ZnQwWVdz?=
 =?utf-8?B?dGZaM0JRcUxmaVJzZVFEVXc4WUhWeXNOMGMrTEJ0cVE3ejNaSEc3aFUrdmlh?=
 =?utf-8?B?WjFzU1VHaGV5TWlyT254UlhNWHBINkIxajE0WVQvKzBBY2p6cWZZalBHVVhn?=
 =?utf-8?B?MjdDNFN3Umc3d0dBYmNqNitSOStob3dwaVlvdUJCWmV6SXdvM1BNbVF2VVhR?=
 =?utf-8?B?dnR2YW5PS1l4dElwWFRNUVI1dGVEdnkvMWFQaUV1N2pHM2o4T1hwcnROdW1H?=
 =?utf-8?B?MU44L2RMeVR3MnQ1dW11R1pmSmttOTJkdXJNK2xHZllCVC8vTlQrQlZZN2JF?=
 =?utf-8?B?SVFSdFJSTG5mSTRma0FsNEJia0RGNzNSZVpFTjAzZ0UxcU1MdzFUK0V6WXlu?=
 =?utf-8?B?WllrWXpqYXNTa25sL29nUnlXdnc3cGJ6Q3l5RytLMEVQdkJocXd5NitSK0NX?=
 =?utf-8?B?NjRLb0E4QzgwbE43eXh4aG9GQ1VnZDdrbkNaY2xkYjZrSUFubkNtT2RLMjl2?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AbwtBagFJyM7wjUxNfhmGJrabvfhy9oquOK4rggGYYjYr27idPcxRn1cC9cd6oLcX+Ftn+1O/U4Nk+BpAMLMcXvwP7EuzPQjZ9Kt6alSx8VpU+AzLRo2ABS1wlM0FF4Zvqn6A1sAMk/JP9ue8hUNkISSyvTEB5oIvIvCRv9Y9mh+oPDboSfJBKfnaAyrC81tfRuH+ScaNeDgbE/6nx3UTFRyhSsDayQOT4r//Ilsu4zkLdJZ6iPOwr33RLTyXgnCGx7yFC5DDbNnvQGBnDrr6OD2c6ug/eCMzeUmdYjJ9SEQv3myC3cWrvJAfWJCkpJHFBPXQnoiCpJrfnqXp/KZeVY5Pfu7YQWp2Dqmy+5Yvo3xdUxnZvme4bihbltFWfp4x0p01lLqeg11AKAAjTIt92yJ+6o9+cCAWgCwiJhjcwjJcQ8SWgH/HZwg5uUyd6oI6fQq7MIb2D45AuAHMjh0m1iskf8ZqQNtKnxNMoa4KyroqVEoz/QiuzbDwmZMRHF8uWMzwJXOY5qn3YvLL5m5G1wkq0qmoAHS2K9KN+q1nlmi1rDfEPBfN9CY3gEdERbbwriFFYQ0fih1XkscbIguzVlmvbCoxY4sxGHS0G05lNEfKE7nmnq0kSgh5yvrEDZ9bIqq+vujCSf3j0OXQ0gKkYcjs38qLVKRiAno8CJR2PSk+h/Uhzeh19UJ3PHdtQZq/iPRJLzRFltpRz5KL4pVaeb3yHyrwPhGuhL2t6k1LaEKueAVnMAiRdtCxPnBheWQx33cmjf2+Go1tEA54p8CK1v9hJXo0x0zhb1AxAUnqSosccwBEiEk70KvP8HL03pf8hCQkP5lPKY46IQBW2LCk3o0i430eb3NDd9wCPAHMt96x29NTpBgPNYCj+63Xfaw8wn5L74ItKGt3M5qTN+dd7CRGQr8kKqPfA25J9uGzW4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da734695-3606-4424-8b02-08db5d4aa47b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 18:05:37.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDIkCGcSeULl50ZAMPQhtI9qF1YFPd2iq0Ju/1NoS3V6LMjQvk5EVzFPdAIy1uxBINfpdKLnNbP5lI8QOn3Vk/2LnD1eKcioWEzKPDzrI0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5356

On 25/05/2023 6:51 pm, Stewart Hildebrand wrote:
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 38e2ce255fcf..af53e58a6a07 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -168,13 +168,13 @@ u32 device_tree_get_u32(const void *fdt, int node,
>  int map_range_to_domain(const struct dt_device_node *dev,
>                          u64 addr, u64 len, void *data);
>  
> -extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
> +EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_pgtable);

The problem is using DEFINE_$blah() when you mean DECLARE_$blah(). 
They're split everywhere else in Xen for good reason.

But the macro looks like pure obfuscation to start with.  It should just
be a simple

extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];

The declaration shouldn't have an alignment or section attribute on, and
deleting the macro makes the header easier to read.

~Andrew

