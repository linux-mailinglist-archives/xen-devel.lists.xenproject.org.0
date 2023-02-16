Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC2699129
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 11:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496442.767187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbVI-0004Zr-Aj; Thu, 16 Feb 2023 10:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496442.767187; Thu, 16 Feb 2023 10:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSbVI-0004XP-7f; Thu, 16 Feb 2023 10:28:40 +0000
Received: by outflank-mailman (input) for mailman id 496442;
 Thu, 16 Feb 2023 10:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSbVH-0004XJ-8i
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 10:28:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8fc8585-ade4-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 11:28:33 +0100 (CET)
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 05:28:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5324.namprd03.prod.outlook.com (2603:10b6:5:24c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 10:28:19 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 10:28:19 +0000
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
X-Inumbo-ID: a8fc8585-ade4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676543316;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yiI2Kucsks847goh5T5akqX2bULqCPtorSMgdvmdX8A=;
  b=hWdqYMoh5CGFp2lesI1qAh9bjLC1PWARtgBMfMJbqlAEhErV6jGoIxSF
   WfOiIS34tNd9AtMsJmmlfQ8jWMK9T+8Bpr9Wj5dS9Wk9DbO43IPkim/O+
   7P4r+WGEahTOskWVmh7ycvHxmDhFhIUWukwRE4G56CncgBxX2kANAefAM
   I=;
X-IronPort-RemoteIP: 104.47.56.177
X-IronPort-MID: 97199844
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:x7zsU6DFBrnbRhVW/8Hiw5YqxClBgxIJ4kV8jS/XYbTApDtwhTUHm
 zBLD23QbK7eZ2TwLtojat/i9EgPvMDXmNBrQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlB4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw28lFAn8V9
 NUkNnMxNjaDm+Dm76zhc7w57igjBJGD0II3nFhFlGicJtF/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI++xuvDe7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6QxHKqCN5OfFG+3s5Usgyu+U8vMUMPflu0ocO5l0ygYd0Kf
 iT4/QJr98De7neDRMTnTRS8p3KDoRc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJv5hDajziNT2EDPxx
 jmirS4iirFVhskOv4248E7GhXSwp5HPZg8z+gjTGGmi62tEiJWNYoWp7R3Q6q9GJYPAF12Z5
 iFbxI6Z8fwECoyLmGqVWuIREbq15vGDdjrBnVpoGJpn/DOok5K+Qb1tDPhFDB8BGq45lfXBP
 RW7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:Or4UYa5OfNgrlqM2vQPXwMzXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1/73TJYVkqNE3I9eruBEDjex3hHO9OgbX5VI3KNGOKhILCFuBfBOXZsl/dMhy72ulB1b
 pxN4hSYeeAaGSSVPyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="97199844"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvUp4B39VChGe5voUsUIcASDxZIewLFHm9s99rz2bhl0XgqFta42D6D42lMAw1TQGOuilvVWTGWNWnnB5fQ3ofl+RgLPieanYkE5Ncm0KP31iaVVcVR4fywaN1Bg89xa8A3ytLkpcrhUuipjwCge49DIn/HSSOT2AlFn4FdoaCWkL/vHRo5hdSxd86ThvmnqmoDLemeKq6yF/apEGnzQrwJUiUZxqpUKRD437Q9S+9expffJQyQDHQT4J4ac8mVBdzP5qfgjTlAItt+O4i6hJbms4kuoYh++XjHl5gzFpxR4bfpfVrqSUN6y5X/QRaxavtw0FEpog+/RDkjOrAW9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fv4TB/grq4QMcivVPhYF6xvG2OLyJXSh7ZjYzZ4hUho=;
 b=MuPtFTKzlfzkgyjZEgjMCquKE771l8jaz+R3yOUbRnkoWfyj/R8KXuTnoms5EOLI0KXzsagJ7uOvg+cWH+KgBAIqQmfoScnlfGK7TQ6gyfURSSU5/e8U+5EqfbY9BXgzi2OwaflAgIRXcWnRGm97F53uAimcVxKzBVkOFW7vAE5PRl7rIZ5EIwZn+iOZwFEleL2Z9EOmO16m0771ZIQDtjlMYema6Lqk0oxFbqYf5Cdu8+qezFf88n8b1GAWX/5W03Gf+jQjH1QP8pI/gIlrtLCPv93eSPLCxBVxtJ0pu9XCmr5eVMBequ8V00JaVUJiq9DNwokePE8AbFCx0e8fzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fv4TB/grq4QMcivVPhYF6xvG2OLyJXSh7ZjYzZ4hUho=;
 b=s3LwilLyJYmeMUVcTy220UHAy5UYf4WzaUpuLtWqzXD+c+Hstzw3HR6NxFmejNw+cqHDX3rjCQ0mLlFoZOxOyIPFtDboFtcGMQrRcv6/ZVsOOWh6wc6ftsF2Xq+S45O/6cmYVW6Sl2pLdN2HNaPIZ3V9IQ9mJSJb1IClpAEdv+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b6d1089a-f2e5-1441-2662-3f4974830586@citrix.com>
Date: Thu, 16 Feb 2023 10:28:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an
 hvm_function callback
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230213115017.902037-1-burzalodowa@gmail.com>
In-Reply-To: <20230213115017.902037-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0125.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 4022cf82-2dba-4d23-2e1a-08db1008859a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JsVKuBSgKy93ij5/pBhEVzj+pdoaVux0W3UHAXgbUmHxUsPyxE+6JT3bqaYqxpB0pvQamrWoQguvhPq5kHSCdxuBfpsmPCCaIvJWa1umk785iwBMLvpbc9NceifP+s40yi50mrvzPgoYJTwVWg2/ypGCmBQ9FMu3DhmGyUJxXOB73/XkfzEgV+vwx9fXC6d7NV9UjQFQRyE6JQWk/+vGqh4XZurNLWK9qXVx+R2CgQqX65fZ3ImCdVHwNvSc5vS/QGQaKlHh1BPSMtRdnAeM0p2o/MObVAl0erUJSUNJtn4GRzyenT6dloX6L6zzUnUsXqlH/34Ce8P4gM6gcnvj4W8fw1pMG6lZ0vJ2U0qXgI00nYMsAdkpz+31lybLageCiHsqJL8/mMHwkbMOfPRUDd0PKgW5lvRgxDcjRf9JF8c++CgDTvXn3Hn0o4KR52lVVzxumLyvdA/NYhkoCCAPyIMSuJv7nSHnVokwIQlLAqVYywLaQh59+I9aXEzXO97E5A9cegroGAQbdu8wMaJlV1q/Rb2t8dPCXHxYyrGjUJSNHpDk6IvWYgNT/oN3OwP0Arqgt7ZR5ObptcJNFcf0t8t19RRvFakZih+P7f7BHyde6clKr2evpQDik2ROrQiBIVHopH78dO28fpoRn9paCLbPfiLQt7yTNb6QO+202y0I8+gST63QESabgwAGmQaj25aGZJMDnkG8pQ01MTTFSTDF3dW3wQxvXJC2GKGg/iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199018)(8936002)(41300700001)(5660300002)(6486002)(478600001)(4326008)(66946007)(66476007)(8676002)(66556008)(54906003)(316002)(2906002)(36756003)(83380400001)(2616005)(82960400001)(38100700002)(31696002)(6512007)(6506007)(186003)(26005)(6666004)(53546011)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXpoYlZYcThPWnA3N2s0TS9Ta3J3S2xGQ0xqazZwdDJDbXNGdld3MHBCQk41?=
 =?utf-8?B?a2Vnd3hkSUNQUjdacGdvdE1YU2JscVFZVUoyK1V0WENGYUdzbEk0a3c0OVp5?=
 =?utf-8?B?SDI4RHVxNVYxcHZUZ2d0NFVGb3h6anN1bGZNRXdGWUZid2pIRlZUMzJXVlZX?=
 =?utf-8?B?ZDVIL1dmak9yTXpmTXIzajF2U3AvcEpCVWtEY0N1N2MyR0x3VU14RW1RWDB6?=
 =?utf-8?B?TUFxbHEvM3RNNytNOFNRazBNYUNJN3VlWklGc2FWOFFGY1lUamZ3L0dyOGdE?=
 =?utf-8?B?RldMcVJYdXQ1SGFzMjdSYWRWYXdYU0xoUmlYS0g2Z0x5Mnhma2tOR05TNzVy?=
 =?utf-8?B?OGdUQittb0FrU3Q5bXFnYXhCL3hzUi9zNnZSSVYzUUxVQ0xGQlNnZzhQWlFy?=
 =?utf-8?B?QlNXd3UwZFJKdzErTG5pa2pVTVIvay91K3BEMHpNV0VlYjNZSUtCWkE0WGFR?=
 =?utf-8?B?VWI3ejVjcWlXTnZ0c2dCSkZYVW1HcVM3cDRVUmZQMEFjL0RCem9kbjYrMG9m?=
 =?utf-8?B?ckpGZ0lQQi9yeVZOOFo2SzNYQi9Ock1YazVDcjNUc0x0ZWczUFBTeStSL2hT?=
 =?utf-8?B?TVhlSHRBcy93RjJsWll3SDBJK1JMYTh3bGlZWmN2YU10c3dLejI3R3FaU095?=
 =?utf-8?B?Uk5CTkx3WlA3QUpmcnNRMDRrVzNZUHRlQks0bktGVjBBQkpmaGlSakMxQWY1?=
 =?utf-8?B?ZVlMQnNSQkwzMlQyaVhUVG16OGVLL3d2ZVl2TUFhdGhEWk56RFNuaFozVlhv?=
 =?utf-8?B?ZFpHYmsrUjNTTVp3WWh4aE5VTHFlYkhTZ1JTSm1QQVhPZm9lb29kNHVDcktE?=
 =?utf-8?B?VHZFV2E0QUtncXh2WllZKzJtelhRRm1nQ3ZkRkFlbG9jWWowcmpPcklHak11?=
 =?utf-8?B?R3BjWVp1a2R6MDBrSTRaeXd5b3N0QmQzWXRwYittanRnWmZzWEtWNjBiY2hS?=
 =?utf-8?B?SW1ZQkxpZ1J3S3pTZUx5M1Z4MnUyMXdoZGpvUFdBcStOZjRFTDN2eHErZ1h0?=
 =?utf-8?B?SU9aRi9xck5mN1dTRGRCcFNYSmxrVGVHL2ZZOTJVdXRHNEt4bDRQZ0xLM0d3?=
 =?utf-8?B?UFlLKzY4OFpLVTcrSitWNHlWTWt0UHFXbWxDamY3dGdXemwxREpzZGtQdEUr?=
 =?utf-8?B?RG9rTU1ZbzIwM09pL0ZCVFRDaUJnZjJCSEN4T2Izd2pDZm95NUVaZXg1bDJC?=
 =?utf-8?B?ck9IWEQvTStHSUhlZ3VZUVNTMFB6Q3NsTnJhMDhrbGd5OU9pVCtRZ1hLUFVT?=
 =?utf-8?B?Z0gwRGVSOUVnZDlyN2swYWJYckZ1TXorOElHUUtPT2JodmVyNUk5KzdqSFFv?=
 =?utf-8?B?bkpDaE9QdldEZTRNWEpISTBESmpMYzVQNW5uT1FhQmhlWDVzRHpjcWpPYVdB?=
 =?utf-8?B?Rm4xcVZZSW5kSURMU1UzeXBwTUZGR0NKbkJuUUdGM3JFZm40L3BuY1JML2V5?=
 =?utf-8?B?V1luMmk0d3lqd2R1SWx0RXN6dnVjMmhaT09hcUFVd1BURHBXNW1pU3hwc01T?=
 =?utf-8?B?em5wc3pkdnVRMDVSeUJ5aktHTldBTW4wK1NmSFBwb2twVS8wTUdUYmR2NEhm?=
 =?utf-8?B?UEZUV3V4RmtFYlZ5YytFRCtoaDB1eGswWnY5QTM3aHU2L3JwN0xVOGdNQzRN?=
 =?utf-8?B?N2x0WEc0U0lwNnRxUHZicVQwbWxsZThLamxlVGs1YkY2SjRqamhlK2czbmRj?=
 =?utf-8?B?ZDdwYUd5SWZ1RHl0NkpMcS8vN2NnVUNVaGg5dklWdjZyNHhzN1NRWEtQb1hn?=
 =?utf-8?B?VEUwY3M1OFRQTXJtTmtBUXpvK1AxQUxYVlhaZEs0QmJWai9FQ1VRaUZkcU5a?=
 =?utf-8?B?Mmx0VjJtODFpTmcxLzZMR2owQllCdURzdmhxbkxOblRXOWVad0J3SlBpalZL?=
 =?utf-8?B?bFROZ3BLZDViVnRwdWRKM0FIS1N1bm1Bc0xRRVN3eDY1L0lMek1lZFpSSWs3?=
 =?utf-8?B?eUVBaDJaa2hsY2J0M2hsN010eFZIdW1UdjhJWGVDT1FEeW12VjhMdmo2bFFq?=
 =?utf-8?B?cUx2aUp4VzNXSGJOVEtTVENyQkpnd0ZYVnY3UEZMYVQ2Q2gyRUJLWTh6S2hH?=
 =?utf-8?B?bVo0VlFEV25ZZXo1TVBsWVZHQTkzUE1rb25XVjlDZGh0SzczYzBhSXc2MEJ2?=
 =?utf-8?B?QXJMVS9tYjJrbU9id0VISVk3WkxnZEZ0RHdLQ0JvYWQ5Vkx4N3UwT1dhUDhi?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3bUNhN5lIAa0qQwe+1DUHXI1GdzbmaajwTuQRoE6QA2Fw5j7+MM/69On++1jE2nrAb9Hs+94y6L8BPkVdCVZBCeKWRLDiftj72R5YNU7AgNHPn/QwlcDRYNkX0Zpa7k7V9xCKZaGT3Df7ZzqeCGlo0Vw8JabYfayNACgelqe4vf3PfBJT2lMvhXBNiPE/fZpMbSJ8KM/u1i4zHueVIGM/FLMhNMzmvVVYeEzfnxg4jltOoPvALQYNTzuxdWU8dMFXABtwiZXmqW5rRXO5B70QJGb5ejce6FrW9IO2dTC4RGWOA42RaIlzRa0TJv+vy20iivKPzWMGogByBn1aHgkz+dZ0D/z0qWn2DlOuZBBu4dgPPZVqxBXiCbUizOzlF/W8VlRqiWRSCAWgBDMce5dQMVU7yXavK/EwlftjeEa6gbYl8IqM5Dt8SDlJvXq2KmhDe6nIozVj2yYbDZhYn0ZIDuIkrw5/bkSA2gmOz1UiFPRuxv3Y5rhTh9nlL5bdPAiAfZy805DZSgiT5Em6bm+lFua4lgpQHLU/p75YosM4ial+38/KpylET9W9Mg2Gbua9zrM9BMB3cIWwc2M7vQ3GzRg13K6TYfcYfvX5o+aoBNEOoabyNIAYsPi0UfkQfwL+cxUKP3Nx1S+eLmTi08OsfjdQhx+jXMyKc5O9qd6vfB5LJaTSbTEK1IIwLHDpNr4ZRvoJFoPbPmYSwDsSj3d4b/DjMTByBZKI8zLMyJdoCMPquYHvgEiG5RaI4vDfcsctrEy9ttqmAZc9D4UCjiaX63lSdfd/GkH9UstJSSyT67WfEU9QmzMc06NK2Ft01qvf9HUWAqAdQ56p2Ij3ZA/NU2q0ShX8LtRxqYoch43WIi9/HW8uJI7+u4h4EbppsfC
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4022cf82-2dba-4d23-2e1a-08db1008859a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 10:28:19.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxwUnhTyctDzwDLv24lfqL4Ag64aUl44WdtAZz6dIwdKHHc/2nE1RbqKm59vtSbY1CI0eEgfR0VmRXbssXLi237NOOOiUXQtK1FE0M5lp48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324

On 13/02/2023 11:50 am, Xenia Ragiadakou wrote:
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> index 234da4a7f4..97d6b810ec 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
> @@ -85,7 +85,7 @@ typedef enum {
>  void vmx_asm_vmexit_handler(struct cpu_user_regs);
>  void vmx_intr_assist(void);
>  void noreturn cf_check vmx_do_resume(void);
> -void vmx_vlapic_msr_changed(struct vcpu *v);
> +void cf_check vmx_vlapic_msr_changed(struct vcpu *v);

Hi,

I see this patch has been committed, but this public declaration should
deleted, and vmx_vlapic_msr_changed() made static now that it's only
referenced in vmx.c.

It needs a forward declaration in vmx.c because of its position relative
to the vmx_function_table, but that's fine - we've got plenty of other
examples like this.

Could I talk you into doing an incremental fix?

Alternatively, we could get better cleanup by forward declaring just
{vmx,svm}_function_table, then moving the tables to the very bottom of
{vmx,svm}.c at which point we can drop all the forward declarations.

Oh top of that, I suspect we have other public function definitions
which can turn static, if you happen to spot any while doing this.

Thanks,

~Andrew

