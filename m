Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1086D8972
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 23:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518641.805397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkAZA-0000dU-MZ; Wed, 05 Apr 2023 21:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518641.805397; Wed, 05 Apr 2023 21:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkAZA-0000Zv-JC; Wed, 05 Apr 2023 21:21:16 +0000
Received: by outflank-mailman (input) for mailman id 518641;
 Wed, 05 Apr 2023 21:21:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gV66=74=citrix.com=prvs=45279ec78=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkAZ8-0000Zn-VU
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 21:21:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c89d1104-d3f7-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 23:21:12 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Apr 2023 17:21:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5458.namprd03.prod.outlook.com (2603:10b6:208:29d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 21:21:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 21:21:05 +0000
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
X-Inumbo-ID: c89d1104-d3f7-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680729672;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zgconbBhy1S8kc6pf8iqApafjGUU32fKIG1lZsK0EeY=;
  b=ax6u0s9DmOvQ5TDljPdGxd41NBpGX97+vaS97t0K/ZtbnZz20a5WYKhw
   X6RwQZ/jfQ9CG290CD70qPIM30ciXLYpqNidQZKwziUdlt6TJ4A22c9ca
   uYa21iS6aVbfCdnI1Dh3mHPevkiLse3JOzOZdL5VruLvSihSoYgLbsMtR
   w=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 104387275
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:43ERhq/YIhk7ftVUjDVIDrUDZH+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mocDWrUM67eamvwfNgjaoyy8hlUsJfdzdJnHlE5qio8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagW5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklkt
 tNBFg4UfyqhlsWwzu6he+hoxf4seZyD0IM34hmMzBn/JNN/GNXoZPyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWNilUuidABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpOT+3nrKE36LGV7lcIEho5ekernb68rlK5do1GM
 lQL0QN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgcqZyAeShAey8L+u4x1hRXKJv5hDaq0g9vdCTz2h
 TeQo0AWnK4PhMQG06G6+1HvgD+2oJXNCAkv6W3qsnmN6wp4YMuuYNWu4F2CtPJYdt/GFx+Go
 WQOnNWY4KYWF5aRmSeRQeILWra0+/KCNz6aillqd3U8ywmQF7eYVdg4yFlDyI1Ba67opReBj
 JfvhD5s
IronPort-HdrOrdr: A9a23:4Ny0ua26oZtyGDck/rppSAqjBEIkLtp133Aq2lEZdPU0SKGlfq
 GV7ZMmPHrP4gr5N0tOpTntAse9qDbnhP1ICOoqTNOftWvd2FdARbsKheffKn/bak/DH4Zmvp
 uIGJIObeEYY2IasS77ijPIb+rJwrO8gd+VbTG19QYSceloAZsQnjuQEmygYytLrJEtP+tCKH
 KbjPA33gaISDAsQemQIGIKZOTHr82jruOaXfZXbyRXkDVnlFmTmcXHLyQ=
X-IronPort-AV: E=Sophos;i="5.98,322,1673931600"; 
   d="scan'208";a="104387275"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alHUemjVDOP0BqV957UXGvCDGeZ//U9asoSfu5lFIMwrzvhNWy/oFP42qENwnTMquQfa7Yv1V/bjhCpTPsiEstqk/pOLJP7F48bR6rIpKobvZuLJSqgX0Ms1dZCBcl+Gj3hpjKcbwExI7kouvm+sGyzPjx8za9sN+++uVsX0/OY4ghev+yseJUAB66G2E2YgAH+tePEVoM5NQgROWpog7byHYRx4hWpid8iylVE/yggE6mng2bTcg40eaoReLtTH4fG1HBcOccF28ruJIFInISXQN0IgJs5TssQajwFZGBYN/yV3KlVW3TMsuiJElPGQgUQijvmkjCL1MxnDNuasuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgconbBhy1S8kc6pf8iqApafjGUU32fKIG1lZsK0EeY=;
 b=oCcnllttZKpyMJbbCZfXvSQIsTzZYcnJXMdqfOQtbiQEjL2TT10vS2uj8ntP0f9JbPfg5MzwUBnJBbHoWD9gmTqxUzJgzzT3w7uOLwwQ8HHqvOd44NHWB4UJAlnzorWjSR7SGHNhREahAXrT+m1lFaiG9P8BIR/KAh3jWJqxOCVDFDRWI/rXEqr0Yglozk9gw8f32ZX1x1DGq8WeCla5b+RbsHissMCq1cHWTXZDcc/+sfQQ4KEO+FCfuS9E3cxd+v7L4Vkfj1RkNE1Kea95Nhhw+25TbpE7/NEqjkdsTFLyTVoTuJX3Wj1H9ATnqwEGbrs7vLAcCT4CALabxwH7Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgconbBhy1S8kc6pf8iqApafjGUU32fKIG1lZsK0EeY=;
 b=mu4DXo+6yoPkLhH7FIKC451Y1zbp83X1jdskym7haj3t/wFgJoY6heHsV1PxDt7GgV6FMU0SI70ys/M+WUkgO0Hk6P5ZhodNXaZOIoViqFyvmm9BHpzmqgd0mgPd7rKxyHf5EXw592+M6v8LFwdupkQgCmGwPTXhmXxrGO3BJHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e04f19e5-5be2-beb2-9a07-66f146e1f07c@citrix.com>
Date: Wed, 5 Apr 2023 22:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/3] tools/xenctrl: add xc_get_cpu_version()
Content-Language: en-GB
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230404160655.2354-1-sergey.dyasli@citrix.com>
 <20230404160655.2354-2-sergey.dyasli@citrix.com>
In-Reply-To: <20230404160655.2354-2-sergey.dyasli@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6117cd20-48cf-4cf9-d0a3-08db361ba9cf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Nxy0idh9GgKElM5mj760WyPzTHt2PouIm/1c5HhirtRcckDQNn1LjSp9Vq/VeKvg5mOkMGra5shPG5O+IiWu+pMQP+pG4sBTYmWjX0NPjmWThx0GHnvTXC+OgLCXgGlF+WyrWUEumylTlswmBTS/WQwQQVvqePjtSnkRiLqL9m1aA8dnVJbicjG4ELeNB6rVWIQcEntCyKU29mNQIJzcbfDsRHisxgjrVyj8f5Hf5Omo+oE3myZWwcwv1g6rrpGVRcj4ic+tRPRM0+FI70N3tQPIaJ4WP39G/a91YqjGzs+ENTGHP13CfTZONjufW9Z3AH9eMfqpoc2XAWjG19bsK6bnOnubIWM6EteCkgVYuvtzzN9h1TzbClIVaWcs//zcPFxyVJc26Zqz3qZcKtiVSbBOddAa87vsPfHSBE2f75kxjQucExiJNpKsfckNv99Qh9sOUuD4FX0jUD9uMwa0bNCqCwI8tz7aCrKZughHkMj9qk99T2ArI7FeXfrGtlGSMMf0g7g8U0RdNEXra6eij+wccItH+g5noZlcXWJSMmNQVN8JVYrQl8lyPzoDENeMkNWztI0OcrAFw60eX2igGNLsgEny7wawoxOOy5KUVcPZNUuXEEK0H+ikt5b1H9Lp5wNt69XGnYC2+86eLdytA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(6486002)(4326008)(82960400001)(66476007)(66556008)(8676002)(66946007)(316002)(558084003)(2906002)(38100700002)(31696002)(36756003)(5660300002)(8936002)(478600001)(41300700001)(86362001)(7416002)(53546011)(54906003)(6512007)(6506007)(26005)(31686004)(186003)(2616005)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0tqMFlwWTVCMTVQTktRYU8ybVVGRVBzVktucXZHdC9EMTM0ZVZ6clYrNysw?=
 =?utf-8?B?T1p3U2ZkYWJJT1Vrd05XQWRoRnRTd2RGTis1UWdEZkowcXdBUkRYaWNDalRN?=
 =?utf-8?B?MFB5SW9mcGJrdDNiL084Q2dPWkpDdXVLYUx5M0tkcVJ3Rm02cElDMGYzVFht?=
 =?utf-8?B?bFV5ck1YNW12WGxESEdXOVd4VkdLZmN3MTAvS243bUthd1V0YzM2bitTcEJW?=
 =?utf-8?B?L0tQVTBLV0FpcmliRityRXNWZXEyVE1NRHg5UVhURlRGbzBSKzBDdUpIVHM2?=
 =?utf-8?B?RmtoN3A4Yk1lUTJZTUc5cE5ZMTNIdE9aenZ5bHd1cjNVWnhnVkdlcGtmL3d3?=
 =?utf-8?B?YXBzSjcxRTd2WVZYR2dJQndCUHFQaVhocWVYZXBQaXphRHN5VDg5YlpFUXNX?=
 =?utf-8?B?S1d5R1ZDeVBBUm9KcEF2S3drS2xaSlVFMTVURDVkNUh3NmFWUFlvNnlGK0d2?=
 =?utf-8?B?d3R2dWNoLzBJcFFZUWtGZE1TWlBhT3JRRVFkdFZoanN3elNBanAwbHhkMTQ5?=
 =?utf-8?B?cUJOSnVkdjBrWG5QMGVCaHZRbkFIYXpZKzJQQzFtTFo1M0NYMTdnYk5mSVdJ?=
 =?utf-8?B?a2sra09pUmNlM3A1bmpMb2Zuc2JsT3l1Uzdyajc4TGZ4bGVrOEs3dzNyZEVQ?=
 =?utf-8?B?cFVkbU5tNlBUSGwyVXZqQlI1M0FSTmlWUFljMVFSNmFHMVJhUzQ0RWNISzRK?=
 =?utf-8?B?RlNGOHlZb2o2VFZBbmkzR0dEa2FlN1kzeXFDaWhiTnpUVC9BNDNWN3VnQkRP?=
 =?utf-8?B?NkZCQnZmelYrMk8rN1JRdERiR1crSWRITXVCVWdxT3hDMFVkbEVlbkl2T2Rv?=
 =?utf-8?B?RXVqOUtyRW5NN3FGNWg0a3kwMU5BRjRUSVp6NzhwZ1ExUDEreFV4bDF1SURC?=
 =?utf-8?B?YStjamNYWWlOSGFxNXp5eVpGNnNuVytIbFdWSkdMMkFxSlQ0cFJwb2NYa3NZ?=
 =?utf-8?B?NWdYbEhKT3ZFUlpZR21vaERSODVKWEV1c1ZISngrTWtMRm9oSGVyUDJVeFZZ?=
 =?utf-8?B?eWJtaUlKMG5LWlE5OTRuWVgvU21SdlFPbmhxRTg2N1c1ZFpyWEVKeGJKcUFS?=
 =?utf-8?B?UEFLbDV3aWJ3cDZHbjBhMTRXOVQxQzRkUytaR3dJcUdWYTF4Zitjejk1UTJE?=
 =?utf-8?B?RGI2MS9HUklUV1hGdVExanV6NitDc1lRUFB6LzdiZlpVR3FaTTdBdWxwV2ZX?=
 =?utf-8?B?SERuMDRqclRqd3JFdjB2a2ZWM2ZYZHVhYnRxZUFJQXNXMmdmWXVKWGpQb2ZM?=
 =?utf-8?B?ZHlBRVBlQ1IxSVhsaEJXZmgxMUpUS01qYUk5T2ZCMWdDK0V2THp2WDh5cmFQ?=
 =?utf-8?B?ZkVLS1RSZ1M0eG0rNkxZWkhQVkNxYmkyRkN0K01DRXhPNm4zM1RIUHJqbC8y?=
 =?utf-8?B?TzdsYXp4MnloNEVWU2o4b1IydnFDNmlLRlNRUCtXOXpMQ0dIcjRrN2RtUGpq?=
 =?utf-8?B?VTg4em10Z2s5UUwxb09RV2YrQnpBaHRnUlkybkp4NGpFdzNwUGNOTW1YSW5U?=
 =?utf-8?B?VHJtay92RzM5WWdrdmQ0cFEvMWhUQVZIOEMxeGxBeis1QTFYdVorNEI1L1kz?=
 =?utf-8?B?NFpZK3VaampPbUcvMGw4MkxjKy9CeGtTOXNnZmpDQzhIbHBPTTU0VkNFTVNG?=
 =?utf-8?B?Z3Z6L2U4b3BIR3hlRmY5ZUxNS0VESnpRaFptaENzRmVNR2Z3anNKR1lWSmNr?=
 =?utf-8?B?MjVBaUVDWmo5aGpnUE5VamxHMGhHTCtsL1liZDlSUkdlZGFRU3d5Ky9lcThh?=
 =?utf-8?B?M3NRTlQxRzVjSElPT1FSdnFoVnZ6bjlTZzc4SkM0aGRLUkUyaEdWQmhEcUpY?=
 =?utf-8?B?UmcxY0p4dUM5THFhaFp6Tm16cmJiVFpnYW1mZy9DTVltTHRyU1gvMmNRUWRT?=
 =?utf-8?B?ekJRWmZxa0tIV2VhUG5PWHloZnhEZVh3TUhjZTFXRXQzZkptZzQ4aktQUWpi?=
 =?utf-8?B?TjVnM09waHFxZ3FjZ0RSNnc4d05hWW4vRy9aM09TVlUrbFZvNUVidXM5ZDM3?=
 =?utf-8?B?T3JDMy8xd2Q4T3YyZUJCSXZJdHYzK2Q4a0RQMzRXendvUlBzZ2dpckw3bWZC?=
 =?utf-8?B?Y3p3bm5ZVTdrNGp3RGJQV29KdzBUUEg1ak1KeEZ2ci9vTUpqSkRvdVJ2SEZK?=
 =?utf-8?B?WmhIVWNpdHhqa1B0bVh2Ni9KZ29Qb2tuYUJ6R25vclZCSmFHNHZ4Vitza2V3?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hCjHlFqoph5inrOE4jG+qoKXCD5ZDk5WUuGaftmEeQazHCy0IMyw9uhWpG6UdHOIRE8xwj2f7V+WPLCjv6r4oQyPvH/vnkcjTwk47agoYsIqDw8XnA0zJ9bDcWFIYtFrHrk5BpxJFR882QS/eCAX2DfXtTpqCW6uPGj5l9r7KURnlmdNZAk4rKZGsIJ+UGTUgRXvp3s6vkpTAaLD9pVZuhf3VPbLHESP1MEOSknCCZGlJ5tuTBuhQDpQ+YCtRMzfMBAL+OlFEnVgy2JbbMvk8M8xNSKpP2Wt60TMEWP2ekMWkjeaoLI/VKQiaDQvQjeNVyC+m1q6pWFllwXXi4EpG1x7jdGn/ONiFJjEroyrugPMxDvsoLWe7zntp2tHBK4R+A7+XthHqYQYhRRdyW/emO+3JQQw8zvUK3oTquQsoRJA+qHo6ls/XHhQQXFvx63Teeib4dHG180F97tLK/mjzEAglWYlmDejTRQ4wn/xfHkOsVPOyUwD6UqANywU3fcHxMk5N7ijZapMeaCsfxa3FPhwTO9hvrNYOSewTM9xzLl7ERWjplF6owRfAgJF+/eFLLG+nlwyXLf0nXn6DjmNNQwRFmgJ1+5XNLrRY/R2rY40qNTMtJWQQYkkxrk6KRnLaYsBZ6d1d2+RkCp335KGUV4IAB78SiO9dwD8FGUnyQ0moQ1M6nSjmcMz/sh5MqATlhddwflpBUcVnVtMJMRZPm6W4PUMCAIlFzgzNmeyAuvJ4ztTxmNEOnVamftQCKJHbI49AFt2b2CowX1ldY72hxZFMzZqq/W/1RPbYVEedgtURrR1NCrTBDxtI4mgVBKVjbMOqSFDDnhzZZztfe+ycVTrJ/Bsj+nlhkM6O5b4WY8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6117cd20-48cf-4cf9-d0a3-08db361ba9cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 21:21:04.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6kHOMNPVDWZ+zksDGjCcM80yVrI/Cmj+T3vTr2VPIwGAJYph2sJmi5htqVk3/pW37fQH4G9wBMy/Ilgo6DH8S0t+Dium8QfpBiV48F1moCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5458

On 04/04/2023 5:06 pm, Sergey Dyasli wrote:
> As a wrapper for XENPF_get_cpu_version platform op.
>
> Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

