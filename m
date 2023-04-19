Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EE6E7A73
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523444.813491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7fn-0006oh-Sv; Wed, 19 Apr 2023 13:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523444.813491; Wed, 19 Apr 2023 13:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7fn-0006mn-Px; Wed, 19 Apr 2023 13:16:35 +0000
Received: by outflank-mailman (input) for mailman id 523444;
 Wed, 19 Apr 2023 13:16:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pp7fm-0006mh-Gw
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:16:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 652c6cbd-deb4-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 15:16:31 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 09:16:27 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MN2PR03MB5295.namprd03.prod.outlook.com (2603:10b6:208:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 13:16:21 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::b6eb:c7db:7393:52b3]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::b6eb:c7db:7393:52b3%7]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 13:16:21 +0000
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
X-Inumbo-ID: 652c6cbd-deb4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681910191;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1YdBZKWa+jw6Bg2n6ohQ0OAf47Qgi9VMmp8+aX0fASo=;
  b=HNVSSYx10zHh3992xfQGunqI5u5rHrUgD+3IXryh1gLHjkhXTQyL6p+E
   AQfifmwlYs7Rq2ZsftGhqUx/Th6OH0e35LwD0YbTUswienhenhqmSloqB
   8lRrwlGN7aZ3BlfUgjb3x9z1Nrl1P4Lj4BA/K8eMBqvYU5tm0XXck6xLE
   s=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 106134305
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:MikOraLRHm4gq5TVFE+R8JQlxSXFcZb7ZxGr2PjKsXjdYENShjFTm
 2saD2+POayMYDTyf94kPo+x/BgGscLVztY2SlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4gVvPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cXT1o7
 /8UOQsHMAmint/v7ou6e/dj05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSCpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX2iA95JTODQGvhCpQOq7FIWWDwvVgWmhKHltEW5fM5uN
 BlBksYphe1onKCxdfH6WxS2iHeJphAYVpxcHoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRwtJWFRHTb8a2bxQ5eIgAQJG4GICobFw0M5oC5pJlp1k6eCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb5D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:GlJIFa4jDlcCu5jAcAPXwOPXdLJyesId70hD6qkRc20xTiX8ra
 rCoB1173PJYVoqN03I4OrwQZVoIkmsl6Kdg7NwAV7KZmCPhILPFu9fBODZsl7d8kPFl9K14p
 0QF5SWWOeaMbGjt7eA3OBjKadH/DBbytHOuQ4D9QYUcei1UdAb0ztE
X-Talos-CUID: 9a23:AdzsJmN0zE3uF+5Dc3U70lQXFtEeeCPE7W7temGBCFd3R+jA
X-Talos-MUID: =?us-ascii?q?9a23=3A3k7aSg8LDROvntkLXbgIZhWQf+I22o6QDRAsqJZ?=
 =?us-ascii?q?YpuzcaRJ7PBCBvSviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="106134305"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYtVXrDM5PFcjrfOtlTHMaigpIv+226ZjjARtgFkquIFla46UOklPzJDGxnXXI3+cBLQ/njpjrcHVSYJ7lDP3ngWqXKsiAAMvFu+rEsLURHGJoaOW/KDjbVDnJ3aFFt/IK/hwnfoMy3bHnMmDrGwIiDkEwD3gm9fQqb6rVquVs1xUF9Q3/ZV3kS//DKvl8qQZOSvKDEesL/HfeFZDhtwPw5yaYlGswagTASYGiskJ4IyhKYEYWSJuSXnQLGedw3E8p4B5fHrGR0KnrnrvCDRGMEFK3SxP2dcNsJUFq2FJPUm9gb9O+KEcsxmBUdHFMCeUFfW8GM6FF9y6HCo58+QQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1YdBZKWa+jw6Bg2n6ohQ0OAf47Qgi9VMmp8+aX0fASo=;
 b=FPTZixnyhp7UzAfXwiBCnmapWhatiJSyOqK9omE8kUBMIbU+NPAuLQnVyk6iw+eqdVkZjBG5Gof1rXKHBvB18aLeJRdfhOEndwnYzOtipsmSIY5wGh133B0g6EjG91UW4CzwLQpXblgsvLwZqmuq7t0oL0/OGe1Pn4ZRlSRa6IFFbBbgcmm0kzfyfVpyJkspq4pHTpOj+e6LHPFf+r0B/6y8Sq4GVgPVOzlYf9AZ3JfwMSotJHtg9V/bu8GcE5Krp4bc5ba8Jbqo3B7xTUQx7217gexm6UhDHKDXYbItqmJiDe5vpDa2BHoXoXA6TCG5MYH6/z91dlcNkUmCATK5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YdBZKWa+jw6Bg2n6ohQ0OAf47Qgi9VMmp8+aX0fASo=;
 b=toUliGOnGfA2OhzlE07KQzeG3dFQ8NCuAZrYeJF+Y+GgZPbUxHYIDXWxZuoyTU8eCqTPieKSI3oj8yyFZ2s2BS9T4hbiYhQs8q41YWjyrpiDLcVU6sa1fUnnwLdXJ0sQoXCKPZ0YKpIfk61R/TvUUB3xO6RC5pJYaMi9kVwK88Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0293e96a-3eed-5624-6580-226bbb5c03df@citrix.com>
Date: Wed, 19 Apr 2023 14:16:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC12
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230419110026.25429-1-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230419110026.25429-1-olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|MN2PR03MB5295:EE_
X-MS-Office365-Filtering-Correlation-Id: 3179ef82-a3cf-49f7-0331-08db40d8445c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+nuX9986eAI8nYlOakP23JpzlRp/pifLee8PGtnvIDNpjYzN1bv2Cj56j+g17aRj2DrRgTdHwN/emwho4Avfwyk2WRems6ImH3xpmEoDQ9yx5+ZPmTPuY0mUT8YlqntTbz4F0vn1zzr8kTHXmtXavPT6nrx/RMFiLRVR37D+MMwFo/8LfjoOe3vjQNh5idqzdELJDwTknnA2fnmX42ykHTAC9XGVRZApZQHJ2n2IYq3bsUwC9b3/8R/LEr+4UDBmMaZCUo4jtF9rSf0+2Pew66wATzcTZOQ4bC8WjAdVEcDRR1EqdZVXpwjeq3wWkfK59vK577U1YZVEuZjEhdqOX7WCmo7SmS360ptmab8SoJnlkpygTqY/Q0mME4FC8FSKF1WowdqCsuxHYcv45Tgokhjg+UKGBBIR320firCzFBvZQWvnQeK1x284H4qZsTxloH7NFkyHdI2EnONs8M0pCZINE0EWz+9l6jhbaglm4AlMT8nipBb/frMS65VBZGagZylxftcj8HXNgMoJIISAAl5SiS0zpwrlrlg8YZ6GflAeV0P9IH5Pgfc6r8JqTl0Pe1VVf6e4xNlAPGBQkiVh+/Oj63An5L5ZYk9QCfp6TYiA/6CTe0cfE6lq8tQgKNlIWfNT2IDJLnUFBLWFnOLulQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(4744005)(2906002)(8936002)(38100700002)(8676002)(5660300002)(36756003)(41300700001)(86362001)(31696002)(6486002)(6666004)(107886003)(53546011)(6512007)(6506007)(26005)(54906003)(478600001)(2616005)(31686004)(186003)(316002)(82960400001)(66946007)(4326008)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWttMUJYWldKSGMzcy9JR0trRTd5VnpsdHdRWWd2cExXZk5wOHZkQnRiaXZD?=
 =?utf-8?B?a0I2RDZaVldtNDBUOVM0dnRFNDVnZUlKQUdiNkpQZm5OTnJ6dDhLRHQyY1BP?=
 =?utf-8?B?U1UzbzNMZG9Rb2ZVU29sd3pGUDBxZE54VkU0cFZ6azNneUR1MWNkVy80ZnhY?=
 =?utf-8?B?bnNwV01zMnhVNm1XZVB5RDRjS0VpVUNlQ3pKdU9RczErckNBcENGckcrUi9k?=
 =?utf-8?B?dFdqbmdvRU9relZoSE1RemJ0UG5aNXFiVjdaNDVhRVd3WFRQVWlLYmVOcGpE?=
 =?utf-8?B?RGd4VDlONWUxYU13eHpyZkhmYzdaSDY3c25IbkZ6VUc5MVFJVkdpYUxNT0sx?=
 =?utf-8?B?VjNRczc5SzVhcy80YzVBamREWGhuZkt1T1VpTnVUWVRQL2l1MlZMSEJIbyt5?=
 =?utf-8?B?NG81L1VVNDUrQ1J3S20xN2VHMHZxbTRqQjR1UVVSMWJCL0V3RThNWlAxc3lk?=
 =?utf-8?B?REhkY0xoaHlaVXN0b1J2OGtyZTdpN00vbHJnNnRVNEl2ZlBJTGJxaFRaR0Rq?=
 =?utf-8?B?R3BDbTRuRkhLQkJjblVWTFB4a2txaXU0OUNLNHlxV29HaWJXbUsrMllEbFlE?=
 =?utf-8?B?OEFWRHJmc0UwSmk5NkFsWXBhdktXQzV6S1luM0lxalhidHpIWVFUNFg5Y20r?=
 =?utf-8?B?aWRJMGtDR2Zib1paT1pKejU3eEwxNzlwK0RkT1lRaXFoVmhValFzKzFzQUR1?=
 =?utf-8?B?d3VlY25mdEZIdlNRb1FKTUEyaEh0dlkxOEtTWk9aaytvaUJFU1hRdUFFVXQw?=
 =?utf-8?B?WHlBRVIzakg2RUU4V2QwNXJGL25zeU5RTHA4SlhaUjVUN1RzWXBGQXh4Z2xL?=
 =?utf-8?B?ZXd4TXNGMzltMHZzQ1FKZG10SjJ2WUNhbGduUHNIYkZSVGRDVVBzZGl5dXA3?=
 =?utf-8?B?TGFzU3RhNEJuRkpVanorSkp5bEFwcDBYdEhXakR4TWxOS0tKMWVXYWltZkVr?=
 =?utf-8?B?dEZJbHJ6L0VQeE8rd09tY1pkcnpjNFNnUGdwNytNeVd3SjZQVVVDSEJQaUEw?=
 =?utf-8?B?N3RNcVg1L2oxeFdmTkFFOWx6ZzdiNDBpc0pWMU5aMXo5YUczUFpJY3MwRDVV?=
 =?utf-8?B?Vzc5N21NWi9oQm5mREhqZ0VXY2F2Sk4wWTlwaWVrcFFMVlU2cFVQOXJRd1lv?=
 =?utf-8?B?QUhzRWZaUVJ0RUlId2xHVWJFaUY0T1RKMUdoSU4wQkREWGpxbDV1YVZZMnVW?=
 =?utf-8?B?bTFvTzkzT1drTDZYZnkwcE9MMTV6aG9sblF5bm0rUml2ZzNUcWJick5BekNj?=
 =?utf-8?B?SlAxVDdmQ0QwbjE3ajNyVEMweElRNWZDSU15SVoyck8rckFkVlhBSDExUUVr?=
 =?utf-8?B?S1Q3NGVML0tJWTcwZlJVcGVlQ1NmcmlWeDBCREx5YngyWnJNN3l0dXQ2ZXI0?=
 =?utf-8?B?V3BCVlBiVG16L3p6Q3NtY2ZnQU9qdHNwN1Q5MUtKZGkwSFhvVEk0Y1pIaE00?=
 =?utf-8?B?bE5qZVdDRU5UUktGMmkwQ1NoNWJNU0MxTjU0ajZKdkxSR0hyb2hzYmh3YkpY?=
 =?utf-8?B?TmxwZnZhakJQVmtLOW9mdWd6NUxyUjdsSitKcFlDTDZvWnU2MWx0ZXBQRnRL?=
 =?utf-8?B?WDJUcysxNVI2bjlXSEhEWG9GdXhrNDJyaWg1VnRJSWVJYzVHWlNzMkxld0pW?=
 =?utf-8?B?Q1dnMGNBRy9JZW5iY2sxeTJLek1XV3BQVXd3NUFzTDAwc0UvQ3llTVpTYUpl?=
 =?utf-8?B?Qm9SZ25lbWwzd0d2SXhZWjZmZUMwOXFQbE1BcmpzMXNHa0hud2VDSWJZSGhM?=
 =?utf-8?B?ZnRtOEZNbHQ5T2JxdFQwWW11WG9Sa3p0MUx0VTdkOWMxQlJoMHFyTGJGNDZ0?=
 =?utf-8?B?ZFRnYWZUN1RiV05tSjhmby9WTkFSc3BhcjZNaWwydkxDckRRQ0Npa0p4L20z?=
 =?utf-8?B?UDFLNGtWcitydlJIRGdMZ1dtdWI5OHRmbXpTRldMUHNwL05zd3hlVExxdGQ2?=
 =?utf-8?B?UGhLalBZUU5zR1ZpVTFxWkNLMG9aQnBLMkh2WW1xdTVpa2hOYm1pV3Z1NnJk?=
 =?utf-8?B?blA5N0VxYjI4N0ZCalREdTZQdTBBcWg0MEswWG1KUUx3MEQrbWNsUnlnWEFw?=
 =?utf-8?B?S0dLamRMV2k5eW1PRHdJaCtrcWtFQldwRlpRdmhVc3lPdkt0cVVKSTR6YXM3?=
 =?utf-8?B?VHYrTzE1WVFKbjlQZzBxdkxiN2NuanRBRWR3Y0RnUmFSelczQTFEQjJTaVg0?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	A3+AX/ijRDUe/i9Gb6zEGft/QuAM7TmAyJJ2gj4hs5WIMfSZ5SbKd/hNkT8XGfiIT0afU+6GjMfPsuPAA+BW3cWNJYkE694FMwkOqwNk0RCuiLu741XGp676APTG9cKpuGzityNfqqR7rter6lhrdI5ll52RyOp0HnmhnvImu+Mkoif0oJZ06768cXZ67KVXovvVelO8lQFhxH0kYIS9Vq1vTHffr3IumWH6w0+/Q+ZkorzgsGrh8r5xucXP/aCo5WhQE21q+cbfMwA1/cxxZpqsjK4ai3lZPb99EcsC94nTMcYtYeGr5GDZP/yPz7IdH8TEHIogyZa3A8wxcGTQte32+P3sTXrOFfUzch6fsFtlLJKNHUjKp95mt10lrakajaRKGgSQTn2B1egDWYiZpHyKsXl8T0AI0jkQFS9DnWG96TwN6wXFtVZOHJQi0dEAum9aHTyDxLvFQuD7dOfBnrAf+m45eRpj2t2gO51TvQWcQr3Yf32+9xm6NegMWiQbAMfhxcx50Jc8mm25mGusy7SwbGPGJoGVEYWST96e0ze+im7bkSRWc8/ucfE4fLbxAYxDWbc5urCPrYLUTuAXsYygUPTA46w6L6kasot+w47/ffCqGh2dlURFa8P6LO+tJhxDkvJGK44E009OdHkwzhmnHXQLzIUUwDtaYVXAbvS/aCC2WeAoj3QL2kluwHoQR/XHdUaTgvodW6zp+sQRg8jFtXkIqlyEbfEwbp9Ud4Mpplqtg/UR7iC33jC/vO5i5xWgOJ43bLtDRK8PyEFpgjqMP9OXUhxZq8EFp/Me92D6ALOlk4YPkWWLy/YdaEfzDsE7622fYOjtBgF2BB1psw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3179ef82-a3cf-49f7-0331-08db40d8445c
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:16:21.0886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ticP/DxnxMLi+Hq5QsuxxghV21fiWOr06l4fjGO2C1DwZcWOQrPctr1cQ7ARbefVCjHBni+tYgeNcj2xrjZ6ZD1VmbveMps7KOWTm6op/g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5295

On 19/04/2023 12:00 pm, Olaf Hering wrote:
> Use a snapshot which includes commit
> b0ded89e917b48b73097d3b8b88dfa3afb264ed0 ("[build] Disable dangling
> pointer checking for GCC"), which fixes build with gcc12.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

But the usual note to whomever commits this that a tarball needs to end
up on xenbits of OSSTest will explode.

