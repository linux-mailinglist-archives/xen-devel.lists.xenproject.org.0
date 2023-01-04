Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2765DD47
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 20:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471445.731289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9rX-0003vo-Qk; Wed, 04 Jan 2023 19:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471445.731289; Wed, 04 Jan 2023 19:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD9rX-0003st-NK; Wed, 04 Jan 2023 19:55:47 +0000
Received: by outflank-mailman (input) for mailman id 471445;
 Wed, 04 Jan 2023 19:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD9rW-0003sn-Io
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 19:55:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c47a1958-8c69-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 20:55:43 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jan 2023 14:55:39 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM8PR03MB6248.namprd03.prod.outlook.com (2603:10b6:8:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 19:55:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 19:55:35 +0000
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
X-Inumbo-ID: c47a1958-8c69-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672862144;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lIjvNeL89m8O0HXMTS1K/V+te9aKFWyhRTArbSYxqPc=;
  b=DIUpeYdMj7+doehCq40tjzhT7TVSbWDbMBn6AstenfLFseWyO0ydtMfS
   tFjTxYXsFQXbqPR2zXgUp67+iLTO6cMBvxmyOEEg+hjF4Se+/ih4UoUa5
   Q4M7ZsSE+jM7vQ0JKCsJYQDViP9Z6iAVz1BDDGu2z/ErMxgkC3zrGQChC
   g=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 93674422
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GOLbX6nRjh4c8tvua5AvMV7o5gxLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfXD+OPf7fYWL3edpxa4WxoU5XvpSGzIRgSgBq/3xhECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkPqgS5AOGyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aBJMixSVxesu7OR0I+XcOYwmpp6FuC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDT+PnqqIw2jV/wEQUERhMW1zim8KFoXaMVI9uK
 hVI4hEx+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6CHXQNRDNFbN0gtec1SCYs2
 1vPmMnmbRRwtJWFRHTb8a2bxRuwJCwUIGkqdSICCwwf7LHLsIw1yx7CUNtnOKq0lcHuXyH9x
 SiQqyozjKlVitQEv5hX5njCijOo45LPHgg841yOWnr/t10oIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF7n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:i8iujql//WsCUc4eSfrv09BEqmPpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.96,300,1665460800"; 
   d="scan'208";a="93674422"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3882hFN487MXL074f1/5DVe2l2w78ysE7f2ggzp9H7FCzLxL493h5/O1ZlCUjLkNEn+rD4jN1mBoCY+2y5Hxy0lJp3yIKNoefNH/elF/3sqPmXlobSRU9DDrj8daVMYGdyjVlfRz6UTY8loX9iT5OgRgUk/w346SJQjSAODEq4Clnr37Q/V/fEi9sfDkyCLoXPu7d7Ix9G0CPjkEQgGxBjUcXVgqnIL3SKTE041Z2Uh0thrVGGrdNr0T9zkyocwRKGpR6fZNPST2llU2bdF4waWbUSAmIAcKLN5i/On3YmxnSSg2AOZDpSyt1gLjqOZnC3K6ZeIozrQoCQiIfOFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIjvNeL89m8O0HXMTS1K/V+te9aKFWyhRTArbSYxqPc=;
 b=YQQLS34xMCIdHhd06b5jFci2hOrdzqC5Vk7evrtkazQwLhH/NoJiykSHqObDEahD3h8G5ZiReYAKz5mLm9IVfswse/bPm35RljXJZM2+6TeeOeC5UJ85yJfu7Anc/nDsn9Wz2Kee5IdYtTBTIzW3bIL/E1hJrI4ImJNjTd0JqCyaA4yD38TAieUVR50QUkUn7MCvDKpYzctjEp1/mR/l0JVEUCxOeQR8J+SQxp/sA+scm70Xh9rMBJBIjMyj31Jd7jREeQdB1EH4E4hJlyKFJMDWuuyeKARNn4PgKQCGpx1ySItykXiCFDSWCyCkzDSOgszVc6Wnr1tu9B3SWcATzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIjvNeL89m8O0HXMTS1K/V+te9aKFWyhRTArbSYxqPc=;
 b=kXHrPahcPTFH7QrFyFek+4Ir4OMU70/fLsG1VJgwJnP1Kmio8xb4aFWMps3jQr22OTzjhlA57Wx8Bs7reNQj2Vzzx8nleGTOYJ8GyXmwT3up+yTbyzaex5yDiehRsp/qfSDjdAD+fDtlSrD95pgo+4L1ukLh+/J35jgojR4jKjo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Thread-Topic: [PATCH 3/4] xen/version: Drop bogus return values for
 XENVER_platform_parameters
Thread-Index: AQHZH69XYhd2rMGoWE+asSBKOPPG4q6OdxyAgAA2ioA=
Date: Wed, 4 Jan 2023 19:55:35 +0000
Message-ID: <7dd00ce3-a95b-2477-128c-de36e75c4a34@citrix.com>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-4-andrew.cooper3@citrix.com>
 <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
In-Reply-To: <540a449d-f76d-eb16-4f98-c4fb3564ce98@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DM8PR03MB6248:EE_
x-ms-office365-filtering-correlation-id: 0b4122ae-3476-4370-6db0-08daee8da551
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RYJz0lnHpvjLu9v89Wd3lsCv6HWmkwfkHn9jQoIHyv5kg2vPY2TFLpY/G9qLy4y2KjFaZFFmSF35goDleJLcu597FYese+D+I4TDQyQJdld1ewssqQnDvEcgo0y2VGEGgXYXzQnsS6C4BOw4l89a4E8wD9PNkPjAuJU7Eb1DXTUehUQkaf9AqaONIcg92Irs/O+cP9bJzdObD16P08DKBO30SFuEmdkin1vkZ2zhTfe0Zux/3h8S6RJ9So1NWReqBo3tYje9S2k4nVPsmq3+/N00HhBTxvNY7xVVDtCQv8cRzOKBI5g0NPTMRjdz7Y+HcfZSqM+35kYPt/OUvaQjSey3IGghN/CgfCrMIglFPqKHyqz2d6kTmsAxx+/5AYsvnE9tMGhPhDlgSpyP5Et29LRY/zGkgh3L+SwEqrljCEvIQrNYg+g+vGKpioI1G95ac00BAEno/OXw7rA8BUSE3/4rYs/8H0Od9n0APiuj4uv7iLNPtp0Doqm/pRjjvJr0rgh/wn4qtxfIDncLiwO9JWw7Te3XWF3Cu1mgPSEvsSScVP/wbsmx1pYY0++FTMP0lqf/6R4hcLeZ8N2of+ZMFmSx3XPkybNKTxVXVFwpL3H3d+usQDSc886Q1HsO5tXp0u0GzH7z67Fb+ZkoXKLYqtE32u95XrIMQIJnxyE0RfPV0OCu+Lw2AFWlONe3tQJNgt+F+9LiZ9HpIcYY1NzgHwRXPl/Gdo66K8zrCxuLtnLfRJgTVhMEBrmujnYhemHzCps/cz5zWp8Ovh4u4x6AvQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(38100700002)(76116006)(122000001)(82960400001)(38070700005)(31696002)(4326008)(66476007)(66446008)(86362001)(5660300002)(64756008)(8676002)(66946007)(66556008)(2906002)(41300700001)(8936002)(6506007)(186003)(26005)(6512007)(91956017)(53546011)(54906003)(6916009)(316002)(71200400001)(6486002)(478600001)(2616005)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZjJRbVlFREhyZk1YeGx3NGw1cDBsdEFZVXFRUFB4RVhzTERHWnFJMWxrZ0xq?=
 =?utf-8?B?dVZxNFBoZDRUcUVzOGxBOG8yd2VHTlNLenV5dlpiblhzN25NU2F2MGpMMDV3?=
 =?utf-8?B?R3hiWVVxRGxEK1lpZDhLRXRnNzg5WTMxUklYc3FBM0VYYjlDNmgrUUtqTmNk?=
 =?utf-8?B?YkZnVEJnWDk5V09KMGZTM1hORkdiL1JleVB6ckh4dVNiZjBieFFxM0IrcnFi?=
 =?utf-8?B?bmVVLzh6a1h5REhDMXdIQy9lMWl0V0tMUlc5dzZrUnI5MHVzbzIwZmxZSkkw?=
 =?utf-8?B?SXVwTDFiSEs2L3JpejhVSUgvTGNmanoxVlN6WFF0S2ZGTXpqQ1dLWDY4ZjF5?=
 =?utf-8?B?NFFmQ2RjREIvRUh6d0NpYzlvZzA0OHNMUlRTRmdQY0tVcmRYK2gxcEJpMmUw?=
 =?utf-8?B?VHAreFdnTU9aaXBnWWJpRWdPS1F5dUgrSGFFVzQxaVV4RlZveUsyT2g2eWN4?=
 =?utf-8?B?Q1F2ZExheTFJeFdselFtVHkzVi9nZFIvSm1YUzVEQzhzSUZpNnBFNFZEODdL?=
 =?utf-8?B?MFAzYm1SRVhYd1lFNG0ybzJqUEVvTEUrTmFIQ3JtTU91elgzNGxWNTI5VFpN?=
 =?utf-8?B?anRlTUNFT0NaSnhYVFo5TEZkcllzV3hSdmtRNDZ4SThDMDMwVTFVMjgvcmk3?=
 =?utf-8?B?RDV6RDdjTjFsRlE2cklJNFFIbjFsZ25ES1hQY2d2Y0xiOHNuUTBiWGtmK3Y3?=
 =?utf-8?B?cnA2cDNwK2E0S2FySTFyeTdnb3NOQjNWakpOVVZSUDdmcG9WaWd3aEVKZHdx?=
 =?utf-8?B?U0NwZWNTd2luMmlmS2R4WXRnUk13QW02Y1k1dVoxaVltVWZIdFphQ1VkUWg4?=
 =?utf-8?B?YnpSb1Fhc3ZVN1UrSU9sTmVrektnTU5VbFF1dzRQVStZb2ZZOHdDaXZtM0Mw?=
 =?utf-8?B?d0JmdVQ4ZStySXhYSklhSXlMVWh5Q05YT2pLZ0xWa0FUQS9xbGFhMHQvMU5r?=
 =?utf-8?B?Ykp1bGVYaEZUU0FqSTNEcWUwR2twWFVYamtlYWwveDM5YnluSHZiUkUvdmQ2?=
 =?utf-8?B?SWhyUEJ1L1RITDgzQW5kKzVZSE80enpTblZUb21PMlVGNjZQZFNoaDRtVDY2?=
 =?utf-8?B?ZnFPMjBUd1JLQXhKamlmMnAwV1I3M3NCSzhPblZJNEdKWHZJajZwOHNWdG1B?=
 =?utf-8?B?VkMxNzdUZE93OWVTZUpxU1VPajJDcXJlQStaT3lEcjE5OGtmZmp3VXFkS3Y3?=
 =?utf-8?B?MG5OQ0p5dHFWeEVEWEQ4dVhVT3ltWkE4bHpiOW1xMzBEQnllRFZNY3JxMUNm?=
 =?utf-8?B?THRsY1ZpK2NxVWpRQkhjdmtuWEVJc3BzRlJGZTcxMVNwbHVsajB6VjBVVG40?=
 =?utf-8?B?WkFETzVqeFBiNHBWVnpBd00xTWpQdjhlS0o3VGNudnhQUWtnU0xmV1ltTWVv?=
 =?utf-8?B?WHpSWHBnaTArUHpSWGRJRWNpdTcwbEtYcWpQd2hlZENoWnpOaWZLbUNab1c3?=
 =?utf-8?B?NHJNUktzbUFXbFNFWTlwR3dRVEkwMEh5L2ZFQVRhTUVuSjdoUFpwVzh0SEx1?=
 =?utf-8?B?dCtMakY2djZFbC9SWGFack9iOEE3V2ZuQnN5MWE0cXVuTjNDc1NOZ2Y1a3pN?=
 =?utf-8?B?Z2VveVdQeXc3OS84Z2I3bmdXZitJMEwxVnByZU1nYjRPQ1JJcTRBMlo5VFMy?=
 =?utf-8?B?bTFhdEszQ1ZwSEtSYm4rVnd2Mjd4QmJJNVVkclJUYkR1RDNmbzd3VktSSXF3?=
 =?utf-8?B?Y01XYnIyOE9lWG1qcGV1SUZxMy9FSFRMMWx1YndaelRYMlN0Q2RNRFA2TVlV?=
 =?utf-8?B?VEtkaG9TMG90OHBWS3kyVStFN3FnSVI5YlhsSVBvL2l1ZVBTd29wVFVWRTl0?=
 =?utf-8?B?TXBrZHVXUWhSWnZ4LzNIN1FNOWU3MnZ2cWJibHN2UlRlQmVvdktrbnB4ZWdZ?=
 =?utf-8?B?d1pqRE10bk1rZVFYMUZONGdQdzV6YWwxUTJzM0VZU3RFUjAyQjZIOFIxYkd4?=
 =?utf-8?B?cHlGaVFFbmtnbmdPZTV6WW1QSnhCczFRemQ0UWduOHUvY3k1a2lBNmZoOTR3?=
 =?utf-8?B?ZnRWQ2pIYURXQTA0UnR4dmQ2Z1llUUI5WURDbW1mRkVtRzlITVBQOXZ5TmM4?=
 =?utf-8?B?Q0VpSFVHV1JTNTFrOVh3cWI3T2x3ajZPR1Y4TWxKUnAveTl4UGdrZzJCZ1Ji?=
 =?utf-8?B?bUtIeFRsOWdoWE9ocG9WQmY1STNyQjVsUVlRUFllbENnY01WUHpEa3ovZlJP?=
 =?utf-8?B?c2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BAAB875855C2141A830C3988AC2C40F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZjJvlAYseAMKGUmYvaMMSlzSNgVzDIw1i22HIiyKJ+jFUf7eCNn+z00fG88fuIo6fe3guzcxqo455YXA4glE4U7sGGzzykX2s+RzorFE47dhtfWTiYmOplQ6nsXxi63nDPtD71gl6Z3IcGDFbFsgw24vNIZpvogTaJs6c1MxwalWNDOWQaYxnaygJhi6HAvVDva4IIA5Hj1q4gqVCCKnEAuMSYE0STT9cqAxem/I/+8YTsSczQeqYf/0G6m4r8iSZpZ1lpRDPru8hxaCn1Q04OfAFIctLhYq7n1ePJTxQovaNhGX4GAXaliCmu5GAK88WlCp2W//Jre1Ux5wcmzLpwBKpixmYFLKdQSqGKHy8VMeJSWONzTvqBcHCPu3ZBgUbpcCCaCMPa/tcwADtKT/RecU/44M5l6xuJ7UKu4Hbfe0LGJaK3/oeGYVQRdgYA7fORlR9w6QGhqqqTK5kv31uI9b+6f9XBnQnB/oG5SaHzoeGckBXvM5nSVyyIrGUK9bOtNOKA+RW+hbQ8lx6hTbQj53Uf53r5Fywj02MWLDg48uFuFTuG2Tn+u5YAdvWSQLwpK56B9T5DB8OCRGZZvkYakNi22q77aDyodP3FNPyQdWk/pKG9rfMa70ofTvnzLsOfzEA7zzavaIl6CnFIX/ScDmTHgFIzJUwp2I0lpAiBfGZvLxVaQOP/6NNqeFWtWfEo3ylqkRx646xl1U5z1BjIu9JQU6GkgksG16yVCgulpzVJGxQeaCuzD5Bn29mTRS+DPicAPsS4lblF4KxmaMakKR8U0ZK/TjRMIXe6M5WPs8r4cAAbse9Vk9ZzKcoXdA9aEuv/YQTNRCz/dRZzBFJrXv8I8ZCFenYDgHuAhlC5Jh+tfjcWHGsYOfk7MTR8CW
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4122ae-3476-4370-6db0-08daee8da551
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 19:55:35.7254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wapB1tHHZ8CaBknxBW9DJ0z5a7IxbdwnbxiKIdWapf0og0OgCtict17gmGm/6C4ucLAL4cJmWrE7MkgzEyAhWrjwaXdj4d8NqamFyT3JSt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6248

T24gMDQvMDEvMjAyMyA0OjQwIHBtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMDEuMjAy
MyAyMTowOSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IEEgc3BsaXQgaW4gdmlydHVhbCBhZGRy
ZXNzIHNwYWNlIGlzIG9ubHkgYXBwbGljYWJsZSBmb3IgeDg2IFBWIGd1ZXN0cy4NCj4+IEZ1cnRo
ZXJtb3JlLCB0aGUgaW5mb3JtYXRpb24gcmV0dXJuZWQgZm9yIHg4NiA2NGJpdCBQViBndWVzdHMg
aXMgd3JvbmcuDQo+Pg0KPj4gRXhwbGFpbiB0aGUgcHJvYmxlbSBpbiB2ZXJzaW9uLmgsIHN0YXRp
bmcgdGhlIG90aGVyIGluZm9ybWF0aW9uIHRoYXQgUFYgZ3Vlc3RzDQo+PiBuZWVkIHRvIGtub3cu
DQo+Pg0KPj4gRm9yIDY0Yml0IFBWIGd1ZXN0cywgYW5kIGFsbCBub24teDg2LVBWIGd1ZXN0cywg
cmV0dXJuIDAsIHdoaWNoIGlzIHN0cmljdGx5DQo+PiBsZXNzIHdyb25nIHRoYW4gdGhlIHZhbHVl
cyBjdXJyZW50bHkgcmV0dXJuZWQuDQo+IEkgZGlzYWdyZWUgZm9yIHRoZSA2NC1iaXQgcGFydCBv
ZiB0aGlzLiBTZWVpbmcgTGludXgnZXMgZXhwb3N1cmUgb2YgdGhlDQo+IHZhbHVlIGluIHN5c2Zz
IEkgZXZlbiB3b25kZXIgd2hldGhlciB3ZSBjYW4gY2hhbmdlIHRoaXMgbGlrZSB5b3UgZG8gZm9y
DQo+IEhWTS4gV2hvIGtub3dzIHdoYXQgaXMgYmVpbmcgaW5mZXJyZWQgZnJvbSB0aGUgdmFsdWUs
IGFuZCBieSB3aG9tLg0KDQpMaW51eCdzIHN5c2ZzIEFCSSBpc24ndCByZWxldmFudCB0byB1cyBo
ZXJlLsKgIFRoZSBzeXNmcyBBQkkgc2F5cyBpdA0KcmVwb3J0cyB3aGF0IHRoZSBoeXBlcnZpc29y
IHByZXNlbnRzLCBub3QgdGhhdCBpdCB3aWxsIGJlIGEgbm9uemVybyBudW1iZXIuDQoNCj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy92ZXJzaW9uLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy92ZXJzaW9uLmgNCj4+IEBAIC00Miw2ICs0MiwyNiBAQCB0eXBlZGVmIGNoYXIgeGVuX2Nh
cGFiaWxpdGllc19pbmZvX3RbMTAyNF07DQo+PiAgdHlwZWRlZiBjaGFyIHhlbl9jaGFuZ2VzZXRf
aW5mb190WzY0XTsNCj4+ICAjZGVmaW5lIFhFTl9DSEFOR0VTRVRfSU5GT19MRU4gKHNpemVvZih4
ZW5fY2hhbmdlc2V0X2luZm9fdCkpDQo+PiAgDQo+PiArLyoNCj4+ICsgKiBUaGlzIEFQSSBpcyBw
cm9ibGVtYXRpYy4NCj4+ICsgKg0KPj4gKyAqIEl0IGlzIG9ubHkgYXBwbGljYWJsZSB0byBndWVz
dHMgd2hpY2ggc2hhcmUgcGFnZXRhYmxlcyB3aXRoIFhlbiAoeDg2IFBWDQo+PiArICogZ3Vlc3Rz
KSwgYW5kIGlzIHN1cHBvc2VkIHRvIGlkZW50aWZ5IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3BsaXQg
YmV0d2Vlbg0KPj4gKyAqIGd1ZXN0IGtlcm5lbCBhbmQgWGVuLg0KPj4gKyAqDQo+PiArICogRm9y
IDMyYml0IFBWIGd1ZXN0cywgaXQgbW9zdGx5IGRvZXMgdGhpcywgYnV0IHRoZSBjYWxsZXIgbmVl
ZHMgdG8ga25vdyB0aGF0DQo+PiArICogWGVuIGxpdmVzIGJldHdlZW4gdGhlIHNwbGl0IGFuZCA0
Ry4NCj4+ICsgKg0KPj4gKyAqIEZvciA2NGJpdCBQViBndWVzdHMsIFhlbiBsaXZlcyBhdCB0aGUg
Ym90dG9tIG9mIHRoZSB1cHBlciBjYW5vbmljYWwgcmFuZ2UuDQo+PiArICogVGhpcyBwcmV2aW91
c2x5IHJldHVybmVkIHRoZSBzdGFydCBvZiB0aGUgdXBwZXIgY2Fub25pY2FsIHJhbmdlICh3aGlj
aCBpcw0KPj4gKyAqIHRoZSB1c2Vyc3BhY2UvWGVuIHNwbGl0KSwgbm90IHRoZSBYZW4va2VybmVs
IHNwbGl0ICh3aGljaCBpcyA4VEIgZnVydGhlcg0KPj4gKyAqIG9uKS4gIFRoaXMgbm93IHJldHVy
bnMgMCBiZWNhdXNlIHRoZSBvbGQgbnVtYmVyIHdhc24ndCBjb3JyZWN0LCBhbmQNCj4+ICsgKiBj
aGFuZ2luZyBpdCB0byBhbnl0aGluZyBlbHNlIHdvdWxkIGJlIGV2ZW4gd29yc2UuDQo+IFdoZXRo
ZXIgdGhlIGd1ZXN0IHJ1bnMgdXNlciBtb2RlIGNvZGUgaW4gdGhlIGxvdyBvciBoaWdoIGhhbGYg
KG9yIGluIHlldA0KPiBhbm90aGVyIHdheSBvZiBzcGxpdHRpbmcpIGlzbid0IHJlYWxseSBkaWN0
YXRlZCBieSB0aGUgUFYgQUJJLCBpcyBpdD8NCg0KTm8sIGJ1dCBnaXZlbiBhIGNob2ljZSBvZiBy
ZXBvcnRpbmcgdGhlIHRoaW5nIHdoaWNoIGlzIGFuIGFyY2hpdGVjdHVyYWwNCmJvdW5kYXJ5LCBv
ciB0aGUgb25lIHdoaWNoIGlzIHRoZSBhY3R1YWwgc3BsaXQgYmV0d2VlbiB0aGUgdHdvIGFkamFj
ZW50DQpyYW5nZXMsIHJlcG9ydGluZyB0aGUgYXJjaGl0ZWN0dXJhbCBib3VuZGFyeSBpcyBjbGVh
cmx5IHRoZSB1bmhlbHBmdWwgdGhpbmcuDQoNCj4gIFNvDQo+IHdoZXRoZXIgdGhlIHZhbHVlIGlz
ICJ3cm9uZyIgaXMgZW50aXJlbHkgdW5jbGVhci4gSW5zdGVhZCAuLi4NCj4NCj4+ICsgKiBGb3Ig
YWxsIGd1ZXN0IHR5cGVzIHVzaW5nIGhhcmR3YXJlIHZpcnQgZXh0ZW50aW9ucywgWGVuIGlzIG5v
dCBtYXBwZWQgaW50bw0KPj4gKyAqIHRoZSBndWVzdCBrZXJuZWwgdmlydHVhbCBhZGRyZXNzIHNw
YWNlLiAgVGhpcyBub3cgcmV0dXJuIDAsIHdoZXJlIGl0DQo+PiArICogcHJldmlvdXNseSByZXR1
cm5lZCB1bnJlbGF0ZWQgZGF0YS4NCj4+ICsgKi8NCj4+ICAjZGVmaW5lIFhFTlZFUl9wbGF0Zm9y
bV9wYXJhbWV0ZXJzIDUNCj4+ICBzdHJ1Y3QgeGVuX3BsYXRmb3JtX3BhcmFtZXRlcnMgew0KPj4g
ICAgICB4ZW5fdWxvbmdfdCB2aXJ0X3N0YXJ0Ow0KPiAuLi4gdGhlIGZpZWxkIG5hbWUgdGVsbHMg
bWUgdGhhdCBhbGwgdGhhdCBpcyBiZWluZyBjb252ZXllZCBpcyB0aGUgdmlydHVhbA0KPiBhZGRy
ZXNzIG9mIHdoZXJlIHRoZSBoeXBlcnZpc29yIGFyZWEgc3RhcnRzLg0KDQpJTU8sIGl0IGRvZXNu
J3QgbWF0dGVyIHdoYXQgdGhlIG5hbWUgb2YgdGhlIGZpZWxkIGlzLsKgIEl0IGRhdGVzIGZyb20g
dGhlDQpkYXlzIHdoZW4gMzJiaXQgUFYgd2FzIHRoZSBvbmx5IHR5cGUgb2YgZ3Vlc3QuDQoNCjMy
Yml0IFBWIGd1ZXN0cyByZWFsbHkgZG8gaGF2ZSBhIHZhcmlhYmxlIHNwbGl0LCBzbyB0aGUgZ3Vl
c3Qga2VybmVsDQpyZWFsbHkgZG9lcyBuZWVkIHRvIGdldCB0aGlzIHZhbHVlIGZyb20gWGVuLg0K
DQpUaGUgc3BsaXQgZm9yIDY0Yml0IFBWIGd1ZXN0cyBpcyBjb21waWxlLXRpbWUgY29uc3RhbnQs
IGhlbmNlIHdoeSA2NGJpdA0KUFYga2VybmVscyBkb24ndCBjYXJlLg0KDQpGb3IgY29tcGF0IEhW
TSwgaXQgaGFwcGVucyB0byBwaWNrIHVwIHRoZSAtMSBmcm9tOg0KDQojaWZkZWYgQ09ORklHX1BW
MzINCsKgwqDCoCBIWVBFUlZJU09SX0NPTVBBVF9WSVJUX1NUQVJUKGQpID0NCsKgwqDCoMKgwqDC
oMKgIGlzX3B2X2RvbWFpbihkKSA/IF9fSFlQRVJWSVNPUl9DT01QQVRfVklSVF9TVEFSVCA6IH4w
dTsNCiNlbmRpZg0KDQppbiBhcmNoX2RvbWFpbl9jcmVhdGUoKSwgd2hlcmVhcyBmb3Igbm9uLWNv
bXBhdCBIVk0sIGl0IGdldHMgYSBudW1iZXIgaW4NCmFuIGFkZHJlc3Mgc3BhY2UgaXQgaGFzIG5v
IGNvbm5lY3Rpb24gdG8gaW4gdGhlIHNsaWdodGVzdC7CoCBBUk0gZ3Vlc3RzDQplbmQgdXAgZ2V0
dGluZyBYRU5fVklSVF9TVEFSVCAoPT0gMk0pIGhhbmRlZCBiYWNrLCBidXQgdGhpcyBhYnNvbHV0
ZWx5DQphbiBpbnRlcm5hbCBkZXRhaWwgdGhhdCBndWVzdHMgaGF2ZSBubyBidXNpbmVzcyBrbm93
aW5nLg0KDQoNClRoZSBvbmx5IHJlYXNvbiBJJ20gbm90IGlzc3VpbmcgYW4gWFNBIGZvciB0aGlz
IGlzIGJlY2F1c2Ugd2UgZG9uJ3QgaGF2ZQ0KYW55IHByZXRlbmNlIG9mIEtBU0xSIGluIFhlbi7C
oCBQcmV0dHkgbXVjaCBldmVyeSBvdGhlciBrZXJuZWwgZ2V0cyBDVkVzDQpmb3IgaW5mb2xlYWtz
IGxpa2UgdGhpcy4NCg0KV2UgZmVhc2libHkgY291bGQgZG8gS0FTTFIgaW4gIVBWIGJ1aWxkcywg
YXQgd2hpY2ggcG9pbnQgdGhpcyB3b3VsZA0KcXVhbGlmeSBmb3IgYW4gWFNBLg0KDQp+QW5kcmV3
DQo=

