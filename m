Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E6F711768
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 21:30:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539840.841109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GfP-000492-Tj; Thu, 25 May 2023 19:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539840.841109; Thu, 25 May 2023 19:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GfP-00046D-QL; Thu, 25 May 2023 19:30:31 +0000
Received: by outflank-mailman (input) for mailman id 539840;
 Thu, 25 May 2023 19:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugP6=BO=citrix.com=prvs=502bf10e6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2GfO-000467-6K
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 19:30:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99360c18-fb32-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 21:30:27 +0200 (CEST)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2023 15:30:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7486.namprd03.prod.outlook.com (2603:10b6:510:2ec::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 19:30:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 19:30:16 +0000
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
X-Inumbo-ID: 99360c18-fb32-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685043027;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vBB8MLGHWfAklkP8+SQ9S+Nt/UV3VjdgiaAQIE3ypfA=;
  b=dZ+95Jrixi3+MhFtgQAr+lFIFFjtmRZLic2Jqrk63Ob0201V+QVOyjnC
   hzQ2V1SpZR3zklM2CLdwmwEl+rlNbzD/DWbyKd4VKackMu+DiYMuuksfH
   xKObkQblN4ywDmfGkbNfs/CBHBgG82IMDBdCv9WERML6JTBLUPTcqQgqf
   k=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 110331147
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:XTRGY6C+q+niXxVW/6/iw5YqxClBgxIJ4kV8jS/XYbTApDgg1DNTn
 GcZCziDOfnbazD0Lo0lO9iw/EoD7ZTVy94wQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C4wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw69xrPV1s1
 /wiEg8pKS6Bnf6sxoibY7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxXigAdtOS9VU8NZ3gnyIzzULIiYpWEHr+eacpW+xddxQf
 hl8Fi0G6PJaGFaQZsLhUgKxumLCvh8YV9daCeQ85CmEz6aS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hSipJSEfIGsGZCkFZQgI+d/upMc0lB2nZtR+FK+4iPXlFDe2x
 CqFxAA0iq8Pl8cN2+O+9ErenjO3jpHTS0g+4QC/dlyi6gR1dYu0fbuC4FLQ7etDBIuBR1zHt
 38B8/Vy98gLBJCJ0SCIHuMEGejw4+7faWKAx1lyA5Mm6jKhvWa5epxd6y1/I0EvNdsYfTjuY
 wnYvgY5CIJvAUZGpJRfO+qZY/nGB4C6fTg5fpg4tuZzX6U=
IronPort-HdrOrdr: A9a23:NdkaLKiPWQ09Y9c6mxVQ6cx4QHBQXhoji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2RSvILBzySTV/wb57C8gcSVbeW19QYRcem9AZsQkzuQCWygYzJLrBEtP+tfKH
 IFjPA33AZJfx4sH6KG7ilsZZm7mzXT/qiWGSI7Ow==
X-Talos-CUID: 9a23:TDZzMG46B8PBoKrnYtss5XQIJvwHUH3n9kj0ZHG6E3pzToe1YArF
X-Talos-MUID: =?us-ascii?q?9a23=3AA/f9IQ9qpF2Msfrugpk57pmQf9pqwr+nUVgnqqo?=
 =?us-ascii?q?LoZncKglfGjizgjviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,192,1681185600"; 
   d="scan'208";a="110331147"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/I7q7BlVg8PNhUbAB93geOetCbvz4VU6a5yxCK7jeAvioEnm3WfUxM4qVS8Iv7g9cJDMNdZMmPuyqwJbReWLyCcAI4uEGCTCU3Ksw79qBFVyKPXMQZL//M7dgz4wUl1alO0L/+two87hp5sEg/sMG9QvcmJdyWLzcWkthveeo8IQMOPTnX0/PUZRjxKoEt6fFhZ4IWWokAbV6+L6qowXjpXDc7YA0fSnbxTAr3MEsu4ihdw60fMR13KnZ3Tu1CIbf8w2ZlppdR8soShlrY8aCCPNkj0k2+WdHQBwxG/Tip9JoIQ2qYdccpNSwYADMo04sJcWuyIQpTp0g4Z9JW+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzB6hvnNaOVOqCCDoKkwdEO412pBtd5xfzri0dfo7cw=;
 b=Q0ZhznQOBK2aFphRE26pMy+8uskTq+vMNyM9fPpUSeo0P6lg9UsAwn0go4ZcPiH2z2Mr5sQCZKxukbrjzz+J6RgbqxdyxjKzK3DaKkXNJhopT1YlQyOoux9aOOxsrvcRqYnlu6v2yfKq2SScmeIDPKtrrlZfeDE1toIsFInVuSL2YjcEyXvnkFV4zOo4fqU/o+FfZgRV9c34xiY3a9Bp1AY5YHmMTIXOCPq7TiLW2iRcTV+OVPRY6Ogb9+RSq/yM7qLmdJCVDG16CSkTDXE8letJ+EhhM1Ti6AH1WKFj40nS1E1u8G7xjciXucTHpZ5yT/66qxCclCG3Py2YGhmk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzB6hvnNaOVOqCCDoKkwdEO412pBtd5xfzri0dfo7cw=;
 b=FbirjiM/1dOkUcGzY/Xr2izG2kbY2JAhKBixtFcYK6Iv1LqYNx75eXCwySC1VHazaq+1rLEYWmTzCBxRqTvBDh6vsIz44LlSGD/E/yagkzJfLwPAbBl354i0GDfCiLg/sAlL4oWukP8NyN7OLNrqZKPZo81c9FzDIMzXalznFUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f18d29b9-3505-4af7-8fbc-f477d555514a@citrix.com>
Date: Thu, 25 May 2023 20:30:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] xen/arm: un-break build with clang
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230525191531.120224-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230525191531.120224-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0062.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: c9810615-3312-47d8-74ed-08db5d5677ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zw/+Ica6ecmEUWGJ98vynXzJ956V19CLsKznLT9rLo2fuRBLCxZKaTu0zq5YcpM4rC/jONHv9HZ3jzKRcLOIFLQbbHHySmqRwhzF5qyJlrmw7i/HpZozdE6/yvKoc9m9a9qnHPj6y1IIO0YVebtqCzD9TnRzzO1lQR7wT5KyjOXkMAjoYoyVeb22s8nt+7A81p+BgnQkesIX22PxuEE7LoLJy6Il1IgnW/ja3NbdvrA49tCi4qmdOmUFI11bJCV4sEVFP8f0T+OHaaFUooYZeTA33JBjmkbhzZ0yEfzNvoLkyq2EdqBnK72VrabmlRtLmSX+w1xZB7BT7qc4+FJ/oOf+NI/h2PtPGDHNv0UegrNAKdaY5xplBi8UMtXkz8J0pjQdR1uXUacyOpEJwpFH1GT6MJpG4PoJkQbAfVq/q1UhA4LKzun+emV9a6zTpSSe+9XaikIKI3t3I3yJi6yxOeG4E/a3v1sH+0KkQwTfQkvJ8BhicLEgzPBrw8+bW4y1WXrDapQOES3JnvjRKefx+OpCU7USl5OHfuH41sk2yG6IFyV/z+VupeLuBQgyTRMIWW3wXnLZgsm2AGxPYrFrOFKWX4ysk/V+IjbZ0bNjSRW1d3Y/AthRf9OjTG9UCM4sb0bFeb+Ghv75qGcH2eH0vw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(6666004)(66556008)(31686004)(66946007)(54906003)(66476007)(316002)(4326008)(6486002)(508600001)(41300700001)(8676002)(8936002)(5660300002)(82960400001)(38100700002)(36756003)(31696002)(86362001)(2616005)(53546011)(26005)(186003)(6512007)(2906002)(6506007)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUlTL2tVR2tTRU5IS1JZWlRNUVZ4bFpnVWdzWWVhMTRVazcxLytJdGh6T3M0?=
 =?utf-8?B?WUVpclFYdFhDdWRYU0hXN29JVFJGTCtBcmZlYjNyeGplUVlTZExMdXBHSzcx?=
 =?utf-8?B?RWoxKzNIN3FEZVpJOXJuUkdQKzY3TXhWcUsraTNUeCtNb2lSbDVRTzR2ckI3?=
 =?utf-8?B?MEYza1E5NXYrMFFRUi85QW92LzB6UHlvaEtRV3JyQ0k1ZmFBVWhkTGszZG5m?=
 =?utf-8?B?SnNGSnM2M00vWDFGSTdERkorQnZyUHVrcVdtbmwydlQ0UmNwcnFOT0FCSFFr?=
 =?utf-8?B?Zk1Ia2lEem01blgwT0ZteURLMmdlSWkrVkdZd3M4UUsyNmpZNXJLK2xDRTZY?=
 =?utf-8?B?SUVxcHBlSFFHWE53YTJBbnJaQ2FJSlJQbHlaTm4yMWJ4T29oM0JBTHFNaU9a?=
 =?utf-8?B?b1dHRFJSUHM1RVVzN09tZTlJcHRlTlFuRHlGUjlIRkRVN0k0TEkzd1JVQi9T?=
 =?utf-8?B?cFFXL1I0Wmt4WDlZTUdWQ1BCNVNTRk9Pb2JjVUdSVlBXMy9VUDhhK3I3Y1gz?=
 =?utf-8?B?QzB3RkFiUmx6Q3p5RkEzNUUxaDVEd0xMUjFYMnRVd0ZLMVFrNGlFcW5uMjRZ?=
 =?utf-8?B?V3dEbGZPOEtCM3FLS1BFY0JZSWNIeW1mMzExbDVvVFd4ZHFPRDFDVWwxakhI?=
 =?utf-8?B?V3YvSXJqSEZsQ0RyNWtLcmJaN0o0ZnE0ck5zckI3aGJpSkYyOGVYQXFuMllq?=
 =?utf-8?B?dHdnWkhPOCt3ZGZYbWh2bDRUTktrMHYzMW90ZWFMQ2pKREhtRnNMRkFvc1Rk?=
 =?utf-8?B?VjBNa0R3YXlLTEtId1NQU2wzN1FTNmYxb0FuN0hkUExYcUZXT3dXMUpCZHJX?=
 =?utf-8?B?YjdTU09iQmkzQm1FNkd0SEg4ekIvRmhSVnRWNEpKRm8wUmhiRUErbU1HVFV2?=
 =?utf-8?B?aDhsMmRKNjdGWTdDQ2QxYW52VkJJOHY0aVJTNE9BY3ZPaWxnN21kdVlqNitC?=
 =?utf-8?B?WWxzdVlRSjhMMFcvbW50ZllXT2w2YVVoTGxGR0pBd0d0TGdmYkljdUlyS2Ji?=
 =?utf-8?B?TTJYUkxTZGRHSFNLMThtODRLdXJaUFA5aGpsaWJ2MUwwaVlWRzlDSVpTaGQv?=
 =?utf-8?B?QXY3V1RKeXJjei9SWWR3M0NUdnVOUmlIUzg4U3l2eTgwQkZqV0tZblZORGUx?=
 =?utf-8?B?dzJoS0dIcFR4RkUrYzhibUVEMWU2cG1yVXR6U3pOTVBSajA2eUJ1UXBUbU1L?=
 =?utf-8?B?MmVsdFBnVGhsLzFySmRMK1l1dm8xcXlQMU1aNVdCK3g3YTk3Q3pHcVFrL2M4?=
 =?utf-8?B?Mi9YYjVYeDkydE10VXE3cTl1SmsycGhWTW8zNzFYVS9jZ3NVdkJpLy9McDZv?=
 =?utf-8?B?M3lJb1Q2eTJNZHdINHJYQzBtSDFSWm1rcDBkQjV2VUtvM1IvUU1QR0UwdmxL?=
 =?utf-8?B?Z0V5dHJ1UjF3SHBPR3lIeDNYTEduQ0xpcUprRGJSSUhnVkgrQ21ra3YvK2Fa?=
 =?utf-8?B?cGcyc3hkdER5bTdaNW02My9PTURoRDMybFJ4b2pqWkZobWtLbmdpdG1HMFc5?=
 =?utf-8?B?U0hFVC9kYzV5L0wyWS9OT2dHaVYycHIvWm1QeFZ5MUtYTlVNVFBZU00vZEN4?=
 =?utf-8?B?clRpeFg3azcwLzlFTU9rbnhJV1Y3Mys1VUZVS0o0TEFIT1NTQldaZlE3Vmto?=
 =?utf-8?B?cURrY2l2Wkh0cDAyM3pRaTNTOTVhSnFKYnM4aHB3T0lLczI0S0FqQ0FKT25y?=
 =?utf-8?B?UXgrc2RUck5UdC9MRlM4cXhxQmFQbGl0V1BScWFIWjc0aXkzeThGNUtWOXh5?=
 =?utf-8?B?cmg4Rld6aGFYamgvWlN6d2ZvVmcyWDdKV1ZiTjRsVnRTSlZHSHJrOTB3cnp6?=
 =?utf-8?B?OVE5cjJ5dTR0dk1WYVRId2ZubGNRM0lQc3dMTTROb3ZpVUFmY1gzUTJVOW5h?=
 =?utf-8?B?eTREcVh2S21pcWo5TlpRSTU1dWlXZThFenZVWnUxRGIyemVUS3UrMEtmWjBG?=
 =?utf-8?B?NlJpNFhmMkdJM0xNWk44S0kwZ1BRY1FrVmlidmRxd2t5c2xJOGdEUnpkeUd1?=
 =?utf-8?B?Umd4T3pndVVwVzU4QVpTM0w1MmtMRmRZN0VqYlJ1YlU1bkNWcmZTRVFsOGxI?=
 =?utf-8?B?NUo2am9SUDhtbEx2OHFqOE8welNJeFZlcU5aRDNYR3k5citUc1Zmc1NONDFP?=
 =?utf-8?B?cXdlTFFFVFM0MFJPcEpBNCtDZG9taXk3b05GL09XRDlzK0pBZEJLZGJnb2N1?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TTaGie1AIEaeAQGgZsEtpfZYz9MhtGml9778Jk9Gvl8cV4g9j2M2BNcxROevim7bBPI4+5kep3nTwNohI7LAkq6OTD0rC/+NPdU7/qo/KZj4MjGembyLK6eBZ6cwS4haIQ7KWg3caqV0MnrDJspgVIcdaQxC03ee9DOtIVGH2IRYdMj0cwKmHU0h7N/OQhbplWTlNPxybJJGG125D0j6A4bkDVNs/c0aOkBouEC7iNLZPbCL8VwXSzTRnCszR0aLryhNCoGUfJgOEs/dC2x+nzAFmxvUCcN6+KZ8Q1nUn6xlwpjZrBCOyWZB6aG4hIgDxg1Fo1HT57iipTpWkxaXqcSmbQ4zTKuWIiGLrfIL8qCFCt288jDUodB76U0z0R+j1nopfpDYSwZKfd+A0kUpArc1F0A+ZwhZ+CrpBtg6AUXdRv2v+3YYzbVqKdd1+Ds9i6lDapyipsy3G+Preb1xr1Q+wxOLtJ4CdJ/8RYHencfRQgHXP458Hg0lCwMmAXYOdbcG8TwXITPIfiOVCtlUBa6L0bmUog9LWA15lWHLrj4vzRX8ciMMdYsB2ZKeBZ5d6unih0fi1l/VQ/L6omfTt5ShwWpKHOk/JUR4Y6NB93Ow+6Jo98A2om5jjeW49ZnnIZxU3mnPCCwhbMPpquvAVo+EajueISDtrCsq39Km3IYEhPagjAinhwSo3Jb/iM6kjHCYXa3mWCrwdU95eNSoe3xzEIlqHRqemHameB8OPS/IDLs9IyCPndIXdWGKDuSiw9E/B6cinn+wDbTUbwX4m3xyLebKI/bwv/s4vjAjFjFeBIx9J/XOW+kxrU1stihREFEqbp57S91e/HTa6xJ0FnMOqtXZx74KTgmN9CrjgcF2DCC27N/2DNGijc1wefHbAOtjgEm4AmgAK4Q5ZBGQeQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9810615-3312-47d8-74ed-08db5d5677ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:30:16.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSNatGhBAGIZL9ANruGi7Peb204xVrEGtqXLhz8Q5LEm4xdP+P/bvuAtwyKBUhvNGvh9N4mLOJIRNAyAf7MW+i/v4tZiqb6yz9fK4rQQp3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7486

On 25/05/2023 8:15 pm, Stewart Hildebrand wrote:
> I tested with clang 12 and clang 16
>
> Here is my make command line:
> make -j $(nproc) \
>     clang=y \
>     CC="clang --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
>     CXX="clang++ --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
>     HOSTCC=clang \
>     HOSTCXX=clang++ \
>     XEN_TARGET_ARCH=arm64 \
>     CROSS_COMPILE=aarch64-none-linux-gnu- \
>     dist-xen

Looking much better now.  But the fact that Gitlab doesn't spot this
suggests that there ought to be some non-GCC ARM build tests.

~Andrew

