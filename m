Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33E6DA49E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 23:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519006.806133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkX4B-00014A-FQ; Thu, 06 Apr 2023 21:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519006.806133; Thu, 06 Apr 2023 21:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkX4B-000114-CJ; Thu, 06 Apr 2023 21:22:47 +0000
Received: by outflank-mailman (input) for mailman id 519006;
 Thu, 06 Apr 2023 21:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkX49-00010y-R6
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 21:22:45 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29b96750-d4c1-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 23:22:43 +0200 (CEST)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 17:22:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5090.namprd03.prod.outlook.com (2603:10b6:408:db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 21:22:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 21:22:34 +0000
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
X-Inumbo-ID: 29b96750-d4c1-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680816163;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BzJN4JdOofRno5appIBdbLkXJFs7In04tnq68aN6iwQ=;
  b=PngVGeMJb/uFlRtrpeODSCgCVZzIjnBHcEuMJ56bwe6CtjRUAbclurI9
   4Wk0SQzkrWMRUxGnsK7vkCE9Gp8Ax3cRgjYBOGjWOHzEbqS8FWz3y/DnY
   HOz/ilvmKCKOXChC3dkKDcm+lLPqLHDoMnFK8R7ky+UsnI5p1xUQA7vsl
   4=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 104537676
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:42erWapDzMKCcCZx7HsZe6ThSbFeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnTOvqPZzf9KY8gPty39x5Tv8PQztdqSFM5/Hg0FCxA85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weCzydNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABQxTjXcmeet+oCiSrdVgJw5M9voGLpK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIG9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgqqMx3wPMmAT/DjUcTmGE+8n+i3SgdNN9F
 GAZ6jYOtYoboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSy2ETgYKykFfyBscOcey9zqoYV2lRSWSN9mSPSxloetRWq2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:3a4AaqpdV2VVisR+cYlvJRAaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="104537676"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHfH2mmXck/2QOKFmUJJzMhdrgvs2fiVXhJ+elNelkV7IFkEnZ1eVgxJ7NUlUl+MGzyFsmUQis/LyLji5lKE7Zj0pUbWn1JTK3C6AML+Bd6HNJkFpa+E+5Ynh1EZ8SLkEOxlVV72HyZyV76s2WvDMOvpVExTDEBg9GtuGP0aP3LCad3qA8fPWNGmBwgSByzYxW5pb6CORN4ItvmqRVA9sAbwKYzurcWYBnJZanCt9H4DkBTbXW9JxME4GerKZ++Pv3tmVat82jHW8nZudKQvl9EoaXYADoBa3QRt3AxQeh45Wvf6zzOAko0jQ4KGAgE9LlSyLulejD85wL7nyDSn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U60zMlzuDf1vv/6ILqjcYiN2syBoZzzYgyc4F3Axulk=;
 b=AYHHrkh/9LbOWWt7di+0XQA/o8MFLFvTS1PfiW9vdk2LlhFLVHBqaw74qYWf3maA75OP/xyWNCt7Qh8F6JhpIoudemsVmx7YIIH1lrYE1ualKJpvoJDTvpH2TgS9YgwWnCLR9En5mbE4MZq+XetAEFwjtNz3AbmNEKU5YizvaWpD1mHoIWvuNZcnZPqbjf7i4TU/ia5i7yyhAzEBsbqznPz/AJG7df5iv1z2l4cZzMyPVchoI0Zt0VvX03eBbmS6nSVnOuSxr9g85NvmHOBxH8wSvaMsUKVqstQbrRbjmpNDGEA8xtsacEn9hy8ifb9bF3TxzsXessI0xGoUQlA+cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U60zMlzuDf1vv/6ILqjcYiN2syBoZzzYgyc4F3Axulk=;
 b=fGdBoA6ZzdRaUkZyFgMqO+ZOF10pTa5RU6qqgkRjAUFh2dRxGtadmFfl2Ujnl5lLHkjITsj3SmAwufJM4xOogNAX+DFnrajmUUjY+OykgdW1f1i/jdKIFkMum3Y3VBHN9NfBiNtI50H908EUZtvz+BMtXVX3+7JLDnLC12DK1YU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <385b175a-5123-3b1f-0663-1a956f5ca3a7@citrix.com>
Date: Thu, 6 Apr 2023 22:22:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 8/9] x86emul: support AVX-NE-CONVERT insns
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <bdcb4822-397a-0795-08eb-74e661d9b7ae@suse.com>
In-Reply-To: <bdcb4822-397a-0795-08eb-74e661d9b7ae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0417.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: ba28c604-f2e6-48c4-cc6d-08db36e509c5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZnuRQ9qqIfmm7S/S6TKDjGq2mHR92KglFDFE0+8rIR77RTqJOdCtQmN83OXj4HHR7i0478eg+Im5IlL1kYSNmb6XFao68fxDpcLMbx0VQElqFNpXqH4s759j0d8sFLxjyrAKuy70HcZoeFhDahXZJhO6OHBXJ1LTWdyzyecjsyZlgdcwxSWuj7s/WG45zqQ2h8I2sVP98tRV2dzYKfwINM3UaWAe6oE+IVMeceX2O9/1GsWVsqiISaU8efTyPmp7tcVLKEvnOlwssqOeD4NNYlDEmd9T1ESjMy5bWg1TeXbCy5cufJ0dJkvXFUIt/KKvXerQPY14UIXuWM3pOIzx4tR6rVXxoUfMEDkrJBwhk+Qdcc5m/l4IG9mmZwBuRPfTvSMwj0B1NmX37e+xseROATkxO/I8uaCQybin8dWJQ5YxhUPRuOYvswO14q74Q/Wq9OYx7ZglYUW4/0Ht5RVK16zecHR4lNXvR36XDMYn+kDHpRthvB0FYmFBM/93KVjPNf9S7LMmhPH/9ESvs4UuNZJQxZM+u59jhjxnj7e4mMezdyrd+oPlx9+5ljIetB/l7ohkgWQJkbdeg4GQoiC0h+0NebxvIWJPRXJo3+O2UKX0isi3EZtOY6p6fm7yY3b9LhROfWDwFt7CTDQeHKCT3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(8936002)(41300700001)(31686004)(38100700002)(66946007)(66556008)(66476007)(4326008)(8676002)(110136005)(36756003)(2906002)(54906003)(5660300002)(478600001)(6486002)(6512007)(6506007)(31696002)(316002)(107886003)(26005)(6666004)(186003)(86362001)(53546011)(2616005)(82960400001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHRJbm1TTUg4V0Y5U3R2cStXbWhBYjN5SGNOaFdZQVgxQWMyQmZoUDh2UlFj?=
 =?utf-8?B?Z3pCdmlHcHdSZ1JLcU5PczlIdTQ5YUJ1OFhxVW9takdIMVlxSzRKSWkxdDhG?=
 =?utf-8?B?QVVPZkhsNzg4bWZKamJlTDE1bWI3ZUY5ZmI3WmdVZzJtT04wLzhydXJNclQ2?=
 =?utf-8?B?VXJRRWNlbSs0eDdnZkdlWSt3ZE1PMThPTGR4TXI5b2ltR1lQZldOeUkyTWhE?=
 =?utf-8?B?b3dOUnBnemxtU3ZjQjJHN29DTzVaTjkyTGRjWUZHSkROUHFVbFE0M0VEQzdT?=
 =?utf-8?B?Tnc4RFQzTzVXQWFNTWNMN0NZbEkvbkw3WWdLem1zSTVLUU5UbXpidStRU2Ez?=
 =?utf-8?B?OE5IVFJsbWplK1ZFYVNmb2tMNmlSaFZVNG52NUNJOWhjZFF3cW9XTWt6RXRt?=
 =?utf-8?B?cGNQOWZkbzJnY3hoSVl5TjgwSTJhajc3Z0dOcVBTMGFaV2tFUWpUaWl4TjdP?=
 =?utf-8?B?Rk5kZlF5Qis4VUY4dExsNFZTdVlJRW8vZTFxV1MrcjBYaHJINnJWNUhWOE1v?=
 =?utf-8?B?OExXTjZOQTNnVHZJTWFpd0wxa01NUVlkQ2RHZStjK0VOcjRQRnh0TWduY0h5?=
 =?utf-8?B?SU4zNmtFbXlmNTNmcDhxRDB2aHVuUHNURWR5WmRLZmZZV3BUQ2pSNzRQRk1p?=
 =?utf-8?B?REI3UTlCMTdQMGxkQ1gzTysyTXRUL0VvMHZMK2hGY3JjVDd6SS8vRUh5TzdV?=
 =?utf-8?B?YzBLZ2lnZFg2elhrckRtTHlhVEUwYThraXpTSTJpd1NBTVQxMU1Gc0wzS2do?=
 =?utf-8?B?TnN3VDIvQjNzSjRXSmJsYng3d3h3UWJZc3Z0TlNWcG1IVVdUaVoxeUE2WHRP?=
 =?utf-8?B?RlFDWHMxV2t2ZDMvR2RGZ0JVcng3WW5NaVE5QWFMaWJlTFZsMXo5NklYZC9u?=
 =?utf-8?B?amR3VGF3Rmh5aUtPdHZoaU9URlVCVi9HQWZ6NjlYTXkrT1hUYzRSVmhPS2xl?=
 =?utf-8?B?eWZNekJJb05oUmcwdHZEdDZaR3dpeXRnTnRLMGJBdmpOWkNyK281Q2t2WVNq?=
 =?utf-8?B?M2ZOTjREVEQxS1FjMTBYZGJzWGttOGpmd2RBZnBjcWhEeEhQMFlRNThQZkRG?=
 =?utf-8?B?R0tnbG1ic1UxWkVkYmVqdFlKU3dQYlh0U0MvZktwc3RlVXd3WU9yODBWTjE1?=
 =?utf-8?B?Q0Z4WHlPNXJkQmxHZ1FNcEs2NU1iRUt3cXlSVjV6YTUxTFNyYXFhMDcwaDg5?=
 =?utf-8?B?ODk3OHMxUTIwKzNpQzV3dXg0dkxCcXpVMkJLN3dHNE5aRGk3MXRSOW1zZXBE?=
 =?utf-8?B?OGtCSVM2Z1pISEFYLys3NVpwbXJtbnVDWHplTVA5eWxLdkpGVDFLRXBIaDRv?=
 =?utf-8?B?ZUwxbnk2VVRYamRRQ1VRL1NKRy8xSzJJK3VzanRZUVBkc1dsNGhjMmdmL3dX?=
 =?utf-8?B?MWpUNml0Rys3WHNLUG82RzhTODhTWTg0YUNGQ2VsRUpndDNOaEc1Y3ZiZTlq?=
 =?utf-8?B?enQ1UEREZCsrY2h4dHdZTnBmSWNkSVZUczJPQmpNcExHaDJjall6ekdJZEFX?=
 =?utf-8?B?Y2MrUWRJVXZHNG1QWGx0ZGtLdVR0OFRNcTF4bFN1NEwwRDVPclpIeStnNnB3?=
 =?utf-8?B?VFNrZ2lQa1VGbDQ2d2M4Wi9CdDR5NmM4SzFZVFg2TDg1USszU21ZcHlzNndy?=
 =?utf-8?B?eUJ0Ym92WXpRTmVmVmFST1pSZmhxckFkbC84QkdydzczWG11K0UxcFlPU1Zm?=
 =?utf-8?B?S3Q2b1hxQWR1QWdiT0JIV3Q2aWRyU1U3a0h0anBLai9vNDlpR29lZXkyYmRD?=
 =?utf-8?B?N0c1TEE1TFhzNVFTUUppZ3ZSL3I5SjZ5WHZFWnMreGo3d1BGbVlwbmZYb2xH?=
 =?utf-8?B?Q3dJM01CU2p6QlFpaW1KdjFETzZ4RTdIUTNyVjZ4SGRONk1paXhscXQwRnI4?=
 =?utf-8?B?cVR4ejZlMnY5c0FydW5yR2hxK0NJKy9mdlJucXlzSzVpMm8ycWMreEtuMjYw?=
 =?utf-8?B?a25ORW5Vb2JTbVdrU1JMb1JjTTNCV1hKYi9SUEE1SnBETzR4RFUxNFYvaFBX?=
 =?utf-8?B?bVlFYXd3Vjc3NGFhQkZZOVR5djJWR0ttRVpHSXVYcklUazlobzVEMFllbVZv?=
 =?utf-8?B?bWI0REY1MUQ5Umg3V2ErN3FZSFRNOFZDYlNvQUJzV2VrZE5jUUJiQ0VjYU1Q?=
 =?utf-8?B?dHFQZy9pQmtmOE53SWR0bGNpSExWcDNqNDhuLzFDMHJzd3pqRkZvcjFiWEh4?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3jvthljj9fw7GjHAGRlKrWtHDA7yFTggXtvn8acUeYCRAb4OUFIEipbtjVCEFXN9KXllWRCKAYhGVshocL7T5T7f09hOfRNJ4NMWyD5MeyQNjEwV9gw8t5B5Um40MQvGfbcnQcfBmDGVhDp0zWsIdUQ143Y3SN+WrmNsiIUt6crmEQhM5EHL74UTwYU1LIFNzvjMchGjz7yAV/B15YVI8sx+jIOEnH/DygXxBa216qmz1nyV84iPPRwNpxsH3jkspNq9c5J7rRnDF2QZ9Qz3OadLQT2HoPm+Yf/ea+MLK96rkj3lLvmFP+VlXLcFM2Te90WwFGeRrlg0NV6ea7+6k4C1Nh5cL8mFOsNB+uIzRiPl94qlMQCfyODJSz1d6k9CxVhMnFgSKhXjcrlfk+JsA9DV9hoZjX99IYbnzYxIoxk+/Wbn7n7ahM/YveiDhA5wBHjHm/eRREfQJhXz76JkOnvRE4wLc4IT4nyWqVUaxLwz6z9lYiyRhoF6QLODu28hFWcdPPZg03wIDTEWuY7q9KtTSwlkTNpDhLVPzo91a2FOXpzAatD61cyLl0mDycIxX+5hDwH3OY11uoH/s2ugBQ7xIi2phfkNAC+/7J+7hC24FlHS4lwBT5t+5MtWXsbZNoBq0M6aP09WaJbc1rrcRlkr6f6D/wqZjRzBWEeG4rP8fPwRbXICfS8518tvMZ+oMChgwTpa/MxescdwwrpyhoIOU4ynDmKGq0LrZvoXvHM7uJQ+3kVk+EXdh3Xk+dN/+g4V3VcPrWEDXiHRsWG0N2mVILlNl/kLmqmhhc9lqLq8HB455if1MMLdEZVtC46C
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba28c604-f2e6-48c4-cc6d-08db36e509c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 21:22:34.6140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ77ri7ZjipakmmXnHHmrHYCpqPHcyi82YdEJ1NkG/RiyVtWdd2e398sCyFB0Q9M05HvWf/tVCBfcSu5qAVbGGOyAxUmOVvH/YS3D7t+ElY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5090

On 04/04/2023 3:54 pm, Jan Beulich wrote:
> Matching what was done earlier, explicit tests are added only for
> irregular insn / memory access patterns.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with two minor
requests.

> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -214,7 +214,7 @@ static const char *const str_7c1[32] =
>  
>  static const char *const str_7d1[32] =
>  {
> -    [ 4] = "avx-vnni-int8",
> +    [ 4] = "avx-vnni-int8", [ 5] = "avx-ne-convert",

I'd leave a bit more horizontal space.  These names are getting rather
long, and we're only 10% into this word.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -6208,6 +6208,19 @@ x86_emulate(
>          host_and_vcpu_must_have(avx512_vbmi2);
>          goto avx512f_no_sae;
>  
> +    case X86EMUL_OPC_VEX   (0x0f38, 0xb0): /* vcvtneoph2ps mem,[xy]mm */
> +    case X86EMUL_OPC_VEX_66(0x0f38, 0xb0): /* vcvtneeph2ps mem,[xy]mm */
> +    case X86EMUL_OPC_VEX_F3(0x0f38, 0xb0): /* vcvtneebf162ps mem,[xy]mm */
> +    case X86EMUL_OPC_VEX_F2(0x0f38, 0xb0): /* vcvtneobf162ps mem,[xy]mm */
> +        generate_exception_if(ea.type != OP_MEM, EXC_UD);
> +        /* fall through */

Only just occurred to me, but we should probably be using fallthrough;
in new code, now there's a real attribute to use.

~Andrew

