Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C31628496
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 17:04:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443420.697975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubw5-00071I-4v; Mon, 14 Nov 2022 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443420.697975; Mon, 14 Nov 2022 16:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubw5-0006yk-1l; Mon, 14 Nov 2022 16:03:49 +0000
Received: by outflank-mailman (input) for mailman id 443420;
 Mon, 14 Nov 2022 16:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JxMm=3O=citrix.com=prvs=310c1b068=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oubw2-0006ye-Po
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 16:03:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e93a800c-6435-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 17:03:44 +0100 (CET)
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 11:03:39 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5792.namprd03.prod.outlook.com (2603:10b6:a03:2d5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 16:03:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Mon, 14 Nov 2022
 16:03:37 +0000
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
X-Inumbo-ID: e93a800c-6435-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668441825;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=D59OyGxJSlfZw/EWAPVGKJlVvF/NuGqf/Wp7wERk2wQ=;
  b=OMQj5HeqmRHlvshnlqdXnLswfTBIhTsuzlL8QMv6mK5gwJixFq05FHfM
   ajkDc893Ag4i/6wF+m6R2HYQOEc0MccbZrEJH6Hfgc3iRrBeOYKhApNpV
   LYbBLqgofPnoutOOun4/PTWFghyB2SzKMivgsJyZakcuCDyCRb+ab1uOF
   A=;
X-IronPort-RemoteIP: 104.47.55.109
X-IronPort-MID: 83849292
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BQ71k6qQ/eIMGopEHi0IOnRG8kxeBmLvZBIvgKrLsJaIsI4StFCzt
 garIBnSb66CNmv9Lo92YYiy/BxXvsXXxoU1T1Fk+Xw2RihB+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHziVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABkXXDmJvv+2+ZuEWORxxd49NZPvM6pK7xmMzRmBZRonabbqZvySoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYKEEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTCNlCSOzip6QCbFu7mWEwITwWT1+Hntq4iR7kBMsFK
 3JMw397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8wwufHHlCcTdHZ/QvrspwTjsvv
 neRls7tLSxitvuSU3313qiQhSO/P24SN2BqTS0ZS00D6trqooA2hzrOSMpuFOi+ididMTL93
 TGM6jQ/jrM7jMgX2qH99lfC6xq8q56MQgMr6wH/WmO+8hg/dIOjf5av61XQ8bBHNonxc7Wal
 H0Nmszb6f9UC5iIzXSJWL9URODv4OuZOjrBh1IpB4Mm6zmm53+ke8ZX/S16I0BqdM0DfFcFf
 XPuhO+Y37cLVFPCUEO9S9jZ5xgCpUQ4KenYaw==
IronPort-HdrOrdr: A9a23:qcXTdK31Gl/6RJBygxkLFwqjBdVxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WB3B8bYYOCGghrQEGgG1+ffKlLbexEWmtQttp
 uINpIOcuEYbmIK8voSgjPIdOrIqePvmM7IuQ6d9QYKcegDUdAd0+4TMHf+LqQZfnglOXJvf6
 Dsm/av6gDQMEj+Ka+Adwo4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiLuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjXf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W/AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABunRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1qol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdN2Gyj2MSaAtAnWu4NjD8ATgMy4eFOrC1zNdLkWqbrhnx1FaferH8
 paO/ptcorexCXVaMF0NjbFKulvwEklIbMoU+kAKiOzS+LwW/rXX7/gAYDuDYuoNwoYcUXCJV
 ZGdATPBax7nzKWsznD8VTsZ08=
X-IronPort-AV: E=Sophos;i="5.96,164,1665460800"; 
   d="scan'208";a="83849292"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csjXnPVLcRCX7mrLW322tC533iak/72JRWx9aZBwwdeedVrFEEJCPteq47E75WV0rI0GWOtFjanUTrttVljo8yEgbUZo5r0CEy1uti67iOF7jsrWIKS6MeZJR7YZVi2eaBwl2haOITidsHZ19K64ASEl3gq5qGSPXYPIA4yBaTlXz8n5i2ntR/XHai5M7HDygOQkwbeEPj8TLP3upGbPcUglaARMXfnZmmD4E4jaAialcXRvzTYCwe6i66Iw0guUgpyXVhV7ZTNOEhfA1PnpATb7cZqi8yCWqYae9XBmj07vOT5acqlZuGAEKTS6iprvfKCOUbcDmnIxBtLPx0AGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38LJPAxnV34lWMQ5oUKrBWC+5t5gji8ZMChY5vETx9k=;
 b=EA2ccuxw3ydwLqed+63LRLy4Na9Q/3utANizJ6fTO4JO81B8nbl4YGc05kGyhBL+jhjYujqjy+ht1NZp73NAXAV4wQpdVJw4/ujePJwQFoFh/32NdDcwfIONgSnPhD/YF7YdjeXEm5j2P7TXUUldDCA2BW/TpCf4/eRfHWhvvASc2utElTM9+qG1YjKiupgI/FnzgMD75zLmeGXs124MNZ0GWqW+FgXkFp0Dzv/GxI8+HKxCDZzGPQAFWVAMiTanEaR+Nig/r2dTXiByqNQmflfMjZVj64RamZ6g3d0+Vnjq3FIkOLcxu7hJ3ylQN9Drkqq2MMRZGNy0o6myCQ5fHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38LJPAxnV34lWMQ5oUKrBWC+5t5gji8ZMChY5vETx9k=;
 b=cJyYzZjRLDDPXTALFmNfScQm0S2xyODqbh+LZNTeaF35q81jHri4TaWCtPb241BqZjXtgvUvvO4/QDNgyv/waJ90tKmqDeelWwLPpXGB6MduLYZl1Gezegs5dNg2frOqLHNEqXx1EcuiGviYudPBzhafl4WqpZAnvQfSMjJPU0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 14 Nov 2022 17:03:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y3Jm0EHRHyEt/IyW@Air-de-Roger>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
 <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
 <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
 <1051eec8-8074-39e8-299d-a540d12bc997@citrix.com>
 <Y3I/gpTiHeEupOJC@Air-de-Roger>
 <c9ebcfbb-efef-8013-ef3b-034c5134e83a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9ebcfbb-efef-8013-ef3b-034c5134e83a@citrix.com>
X-ClientProxiedBy: LNXP265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b9bbe6-9e31-4ec9-548c-08dac659c8ac
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BbhLCDW/2kuWa+2rWEFBjQc+1CTJeIlPXG3Xwh7dIXEfWIdafZzQLq96zzrIxG7yH/baOiTh2LY+yenrEo5gAeqxXgpVhF4AZz0mrV5BmO/e4gnkhUheSEjqSs6PJTpI4BJ6eTsK/75k450LvY9MvNMZvxCMqxigpQlfBJH9+D9i5m8UQwhxGSXq60DtGh1bMiwLb7jcXTEfyJ9WR77+Z+CuKRwoLqA/JS1LGFcHHlD8EWjdWJ8+1fzIBxoTz5CKfU/zzSE8p7ZdQt/Bgnpi9ybli8XO57Q6aTgQfxbuZK8qd7tjUhzDUFwyweZZoErj/yPVP4tOgqFbiE7OjQ+w6+XP+MwoXmAFXiS04Olev4VqabYJuJxcgipJJEZEmN4aFuzM0cBeT6PFAMbm9iljZdnodtYImxEsxR9J3ssXFRBzw3dMxABfrtuK9ZFdRJmySDho4y2xiaPYFBBMwReG3WDOCEIdMQqC5as341ZkA3ouwyJV09ajSnZM7IwJkb3pqgt8MhW7ChZrHGIUjuKv0CImYck3qh+MBHsm2BeCTFMt7DzvVuzk3JSZ1KfmZPnaj5+SfgGg/bpjcleG+EvdBliKyaQU9iY53bn5kFYGc6k+Msk6+EG3uDucC6Uqz58jWfgfcj9t0a7PcRzZYepv5o6GLUEDoPOinsKfL5hUxqn5MFth/GV+prDzCk+vHWauridF0aVdXuRRgPnuHPEPMe7Ouf/YXqbyu0I1g3GMoYg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199015)(33716001)(6862004)(8936002)(41300700001)(83380400001)(186003)(5660300002)(26005)(316002)(85182001)(9686003)(4326008)(6512007)(478600001)(6486002)(66556008)(38100700002)(66946007)(966005)(53546011)(86362001)(2906002)(66476007)(6666004)(54906003)(8676002)(6506007)(6636002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkxkallhakZ4NE55MDEwcVo1K2t1UGErdUpmVHlJbUsrdGtBN3RBZkhQRE9T?=
 =?utf-8?B?bFhvbXl1OFZ4aFJUM0RyaERNbnRBaUo1SzFCSG0wZXFMODYzMXNPa0NGTXlI?=
 =?utf-8?B?U2M0S3ZOakRENTMzYzZGQVR2bC9MbWI2Z01vMXpvaTNEMzhqcDBCWUd5cGVH?=
 =?utf-8?B?bkQrNWtmbFJPMGdUeXhwbHlzNHZidUFHSktrcU1sWE5ENmJoWlpTU1VHOXVD?=
 =?utf-8?B?VUc4UUNNbzdRSDB2TTFGakV5ZVZmMm5tY2I2SXBEUytuU1phdm5DbW0rc3RY?=
 =?utf-8?B?RW9EMFJCU1Y5blVWbFRaR2NqVE05M0ROL0dCb1RDVTNPUGtsbzI1cG1nakZh?=
 =?utf-8?B?SHBBYjNNcEVGS0V0Rk03UW9EYXJxWk9mSGlSK3hWeWNXQ2RrNzlmTStzY0ZU?=
 =?utf-8?B?ampZekN0Ukx0TEVMWE9zY05PWUxKSk9YZDZHblAyQzdaTU04UUZKaE01Nm5F?=
 =?utf-8?B?THVBWnJUZStxK0xPTjN5aU5WQXhzN2prZ080QlZhTUQ2ZGFuWFQ2cStmWFdR?=
 =?utf-8?B?R0hjUFhtUndkK2NMWERXN09KTzlUdmxqemNCSGhZREhpK21DdWNGTStJM1V0?=
 =?utf-8?B?ZStDQW1icnpRRlN4VWlXbWphSVo2RThBcGdTanJrcWtVd2FYWWZKNXBVdlo5?=
 =?utf-8?B?V29vR21hUWsza01DVmdTVDhPbWxROXZsNitWVU96bVNTYmpiNXhManFwdTNQ?=
 =?utf-8?B?cUxHRGY4eUgyUzNzQUQzN0VqR2VnL2FzMXo5U2p6a0owZEhNVGRqekRjQ1NO?=
 =?utf-8?B?cFd5a3ZQVmtWQ2I5N2NnMjl5MzBhRjZhTWt1djF4dm1STWpSUmtNQ2RueFlL?=
 =?utf-8?B?KzZRZW9pNFY5ZndvN25pNU52QnZPdi9NWEhmcGFPMThnL3JxZzN6eDJRcXJa?=
 =?utf-8?B?akdnYmNjeUhyalJCUndta0NVZ2p1d1FrODlJYjkwcnp1K2F0QUZtT282V2pE?=
 =?utf-8?B?VlNJYkd1c3lPZ2VsbmRPdGlUQVBRVGF1cDg2WmRpRFJhYXp3UkpBS3JlcXZn?=
 =?utf-8?B?T3piL3kxVUlpOWUvRXdnNmF4UTk3aGZQbWxQOTNXS0xvcTQ3dk0xcGFTZHJr?=
 =?utf-8?B?MjlVL29vY21ocWRSeU0vdUpmcjZmR2JWakphL1FYRkorWFFla0FDd3RLZnY3?=
 =?utf-8?B?RFBobUxiNHIwcXRTVmY0TnJ6NDZJQmhWRTY1U2Zham9jN0RPUVRMbHVxTUwv?=
 =?utf-8?B?aGZsN0ZBWHVFOWE0elBsWEZlVDFMa1ZoS0ZEK0Urbk5ZdU90aWdkL1dlek5m?=
 =?utf-8?B?VzRzSmlUYU1Bc1dieXoyRUNIcStVSXppaGloenJhalpGWnZYVU5hMlRJSC94?=
 =?utf-8?B?K3JyYVpaWHRYRzdwWFNkaVBJazJ1U1ZXOU9SSzRNN3JZWlFTc0phY09hZWNN?=
 =?utf-8?B?RTVYTjBzRWxIYnFoOXYveUF2S0NGTW1ERE1HT0NMYVVhZjUxVkFUcVFpMGlv?=
 =?utf-8?B?M1hZUFYrVlNlY2dmdlpXYUszWDR3dVJRbGtWZGF1Qy84N280Qi96OERyUDFS?=
 =?utf-8?B?QmdpT3JCK01LR2dnV1V3QW1VNVdTQVhNdjNDY0wvTkQ5K0lxMkhOczdWNDgy?=
 =?utf-8?B?b3BxWllmM3VMTHFGVnRuM3gySWhqQmYrelBIcEpYSkZXWVNvSE40elA2R01u?=
 =?utf-8?B?NUVKbGltU29XYTlmbDVDbnVucjcrNjRqaEFXMmJkd2Q5RHpwcVg4Y2t0ZHJh?=
 =?utf-8?B?RDJYRDlLWSsva3RCNW51OXVtenlrdzBtamh3dndwTUxlR2l6YlJtVHRKWHdT?=
 =?utf-8?B?Ymx1UktjcE5zYmJmN09oT1FBZmkzRGVyNVFINFhieHZkdGVZUGpaOGhvOTQ1?=
 =?utf-8?B?dUZnRFg4Y1FyQzd6QTloS2NRU2tVdzNrSWREVjJ2d25hR2QwWHhuZU45bHBW?=
 =?utf-8?B?TnYzbVdWRzg3Q2FnQXI5c3ZFSE4xbnJ1cXpTY1Y5WEN6SEg4YXJWeUoyVGwy?=
 =?utf-8?B?a1dvTlRwb3J3ZXlNZVRkc2NKREh5aUd6Z0hVblFvaUFEanZ4MVJRVy9RQ3RW?=
 =?utf-8?B?bG84WTE1Z2xtT0hUTTdDaWFkK0ZOVWpHcnMrcUNFTjhlOXFjYU0rMEhpWmRn?=
 =?utf-8?B?aWZaaDdIaEJ0M1ViY3JpUzFSU21WdndWQ042MmVZakk0QXdGU2p2ZWhRSmtk?=
 =?utf-8?Q?XNfVtd+iMHRn5TqOL+StVaePF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wH3gLWOdGjA35PL535k2jkDdt0kL4FYikftDk/w4BmkH4abuCx94RoHdWhkYBDxacTL8dNb6tuvb9YrgOKoOdASqMSVLCAgE6m8VbBk/rOfGrk51J0OjIrR9OFmSFPhuYnH7RvbK+1P8+rOCD3A1hm4bun8kw1tLigcPLZ65aeqnyKh8nN+Us2bNzaABnQCz8FIoxdSZhYASRSPqU+g9U8UdjkQ3th0nFq8XLidt48xXkY8OYCOECz7fw0WRdVvXo5TFPQV90vVWKc0oWOP3m93VBB7VyVGPCMQ3rrQ7BQFonvzEPIhk95nNJhqmHQDRR4GGkfpXwe95ENDFOgKF+ilma4+ttumKsrh/pWwa39f06O/zQaBq23fL+dzVNQ0Lu2F2pNPKFqeGMJGDVJZ7jxnfRshB4RePNsLjHD5NXg+sAEPdJVX/Xq4xZsJ91qemVjQL0C7U7Hqy+50hCSDikSMGiyJb9/1Qx5zlwJkZmyLqTG48n+vueYbLh1By2Ql1wkbgbILupm9LMbz7llQti4nhkcEVjhvf+U8p1jiTwI528QByRCnwocYMx+3V9o0dRqX73I8pu7m4okGVAYSJFceHkoJ5R5xlIQTbzSilu7DaVAv4O2rrS5oU2HAK6lpNRDsMYiYYnnkSMdq5cYR18Wrcerx9ZGxOBHcORHiddiQ7usUfoWHjWDRxkJJg4TrJw/6DD3rl5mtVnhk1W7zUfU41Tvpxl5Z2D3etpM0cHacglME3tJSwCknTCDg6HS/DxW6OGjRhbT+hrH6AEoKURdeiGxgA2pyHe74XAy9L66SqabPb95lL77po3nJYqWUM4+bi+Iq5VCk2933OcOxwItlS8Yk3yh413e7L/CHRnjNAArx/dnDXlqHyZ4bMAbinyXbPm8YHUyQ/AkLaTYBqQ0XFjpGost3zZzKpOVVF3i4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b9bbe6-9e31-4ec9-548c-08dac659c8ac
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 16:03:37.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vgw12X1wz1tpT498WBm8bXO4kbI/fxBxw703GfAQbhhyUwMWe8g4vs4v1Ek6bEo4dhr4CTZqoXScsuZBz2wupQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5792

On Mon, Nov 14, 2022 at 03:31:39PM +0000, Andrew Cooper wrote:
> On 14/11/2022 13:15, Roger Pau Monne wrote:
> > On Fri, Nov 11, 2022 at 05:47:02PM +0000, Andrew Cooper wrote:
> >> On 11/11/2022 17:35, Andrew Cooper wrote:
> >>> On 11/11/2022 07:45, Jan Beulich wrote:
> >>>> On 10.11.2022 23:47, Andrew Cooper wrote:
> >>>>> On 04/11/2022 16:18, Roger Pau Monne wrote:
> >>>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
> >>>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> >>>>>> @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>>>          res->a = CPUID4A_RELAX_TIMER_INT;
> >>>>>>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
> >>>>>>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> >>>>>> -        if ( !cpu_has_vmx_apic_reg_virt )
> >>>>>> +        if ( !has_assisted_xapic(d) )
> >>>>>>              res->a |= CPUID4A_MSR_BASED_APIC;
> >>>>> This check is broken before and after.  It needs to be keyed on
> >>>>> virtualised interrupt delivery, not register acceleration.
> >>>> To me this connection you suggest looks entirely unobvious, so would
> >>>> you mind expanding as to why you're thinking so? The hint to the guest
> >>>> here is related to how it would best access certain registers (aiui),
> >>>> which to me looks orthogonal to how interrupt delivery works.
> >>> I refer you again to the diagram.  (For everyone else on xen-devel, I
> >>> put this together when fixing XSA-412 because Intel's APIC acceleration
> >>> controls are entirely unintuitive.)
> >>>
> >>> It is "virtual interrupt delivery" which controls EOI/ICR acceleration,
> >>> and not "apic register virtualisation".  There's a decade worth of
> >>> hardware where this logic is an anti-optimsiation, by telling windows to
> >>> use a VMExit-ing mechanism even when microcode would have avoided the
> >>> VMExit.
> >>>
> >>> It is not by accident that "virtual interrupt delivery", introduced in
> >>> IvyBridge, is exactly the missing registers (on top of "use TPR Shadow"
> >>> which is even older) to make windows performance less bad.
> >> Sorry, sent too early.
> >>
> >> This also firmly highlights why the API/ABI is broken. 
> > I'm not seeing how you are making this connection: the context here is
> > strictly about a Viridian hint which Xen has been wrongly reporting,
> > but has nothing to do with the APIC assist API/ABI stuff.  It was
> > wrong before the introduction of APIC assist, and it's also wrong
> > after.
> 
> And now it has a layer of obfuscation which makes the bug less obvious.

Still, that's not an argument as to why the API/ABI is broken, just a
remark that the current usage here needs fixing (which it does).

> > Also see my other reply - I'm dubious whether this hint is useful for
> > any Windows version that supports x2APIC (which seems to be >= Windows
> > Server 2008), because we expose x2APIC to guests regardless of whether
> > the underlying platform APIC supports such mode.
> 
> It's not about whether a version of Windows supports x2APIC.  Its
> whether windows turns x2APIC on.

From my previous conversation with Paul I got the impression that
Windows would choose x2APIC based solely on the CPUID bit:

https://lore.kernel.org/xen-devel/2c2d8b2b-e607-6d9d-b991-d1c065aac95d@xen.org/

> Short of having an emulated IOMMU, or an absence of an IO-APIC (neither
> of which we do), guests wont turn x2APIC on.
> 
> I know we have the magic hack for IO-APIC with >8 bit destinations, but
> that only got enumerated in the Xen leaves (IIRC?), so only Linux can
> pick it up.

We don't have the hack yet, just the CPUID bit reserved.

Thanks, Roger.

