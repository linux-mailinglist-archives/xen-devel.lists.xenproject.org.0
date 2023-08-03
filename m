Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EF76E77B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 13:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576283.902251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWwG-0000XZ-Rk; Thu, 03 Aug 2023 11:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576283.902251; Thu, 03 Aug 2023 11:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRWwG-0000Vu-ON; Thu, 03 Aug 2023 11:56:20 +0000
Received: by outflank-mailman (input) for mailman id 576283;
 Thu, 03 Aug 2023 11:56:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1P5=DU=citrix.com=prvs=57264c000=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRWwE-0000Vi-Es
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 11:56:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf24156b-31f4-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 13:56:15 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Aug 2023 07:56:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5184.namprd03.prod.outlook.com (2603:10b6:208:1e2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 11:55:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Thu, 3 Aug 2023
 11:55:58 +0000
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
X-Inumbo-ID: bf24156b-31f4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691063775;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=COUk0Wgz7yZkgzhePNL+B049hzOO43HXB1QDuVGj2f0=;
  b=Tdt2IfWl3oMBTFiEVFXtDrs0xkEufEsxhBQFOQGlJ+lNZHEoOHEQYWSb
   trhiXu8HGq5SApLiE4WGjSZD8fcxXCAJ9Cz0r0FbAwe1IKWG2jvDNi9I+
   EFTlFg6aR2QoQn6pqjRAuYVvq9AULPd0Rw3Toj2GWMG40OdUy3bBMt8tZ
   k=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 121015384
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M3F5aqtCS59gVOVXYD/t9whCvufnVM1fMUV32f8akzHdYApBsoF/q
 tZmKTqCbqzbNGbwftkjPY3jpBxQ6sDQmIdrSFdoq31mRiMW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+GzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwASICT07cjfmK2ezicfkvrPo7DMvxFdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTir6Yz3QbDmgT/DjUVXkWc/NKlg3SFUt54d
 2YbxCkpj6oLoRnDot7VGkfQTGS/ljoBUNMWPeQ84wyJzrf86hycQGMDS1ZpasEitcIwbSwn0
 BmOhdyBLTJivLCPSHmasKyZtzq8OC4UBWUfajQJSwRD6N7myKkjgxSKQtt9HaqditzuBSq20
 z2MtDI5hbgYkYgMzarT1VvAhSmxooTISAEd7BjYRW+j4UVyY4vNT46i5EXf7P1ABJ2EVVTHt
 38B8+CF9/wHB5yJkC2LQc0OEauv6vLDNyfT6XZwG7Ex+jLr/GSsFb28+xl7LUZtd8MbIzngZ
 RaLvRsLvccJeny3caVwfoS9TdwwyrTtHsjkUfaSacdSZp92d0mM+yQGiVOs4l0BWXMEyckXU
 ap3u+72ZZrGIcyLFAaLeto=
IronPort-HdrOrdr: A9a23:/Jk3Qa9G0dYNgi65NJxuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:RocEgmHisFpVPWZ+qmJO5kE1RJ8vaUHEki7rMwySN35JSqe8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A0SIdxwyNSBTjXfdKZgoxskA6vdyaqKelFmdQuok?=
 =?us-ascii?q?PgfKNOQssETijjzOVQLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,252,1684814400"; 
   d="scan'208";a="121015384"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsvMCY5SIHM9kRkrVHufaNaxaSHc5y3NTbSOqMG/FpQr29+ftHELf1SDbcLEEa3/CdPYmcwZLIss1jOZqXNf1CARgY04BpeOzkROA90v+kyD2xfhUtEM3dBDR2Y7GcDd1bRbgoDNBMw/UW4yIF3jtpZsj/LMfAdpgyB6c0ctuIFMJ7/7b9EqInSUJAqEBWxRtAZkcVzyevln/Yx1pe+uasjR3Ls9BItUbqaqu+Dh8WrP68QLftAsP32Wq+k0M8zeoAdq7nVpd/xy74WCceUpLzVdv4LLojYIX8A0TIkUzmqpXL2yv8OdAMYbBCnmSLn9k1tMqmi3B7Rxv/Z4tDRiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1x4RnheK6/LhYWF9bzfgUkWB/nfyA/xAppqOshrii+8=;
 b=oYrWF6vj4fpCy3yCgnhEamJ8FDrSu0xuL8ef1yrDk9RsGn+7NneCvfOT6fBoaW/eJ3dATNPhDq8hhvlnC7kwLUi/YfSO8uijqKCJSTdOhKoV2AQ9OKwkgUEa7d4lezKKppO+Kj/oprlyqo079/bW0n1D1sEpDUYrONT072YWIKNGmp9PzyhA5b46J7S/WyxfagSTOpKo40XfxaeL7fmxSkKNJyo8ysPwAFbIkmWpwIxT7k7a9mt/mEefiec+uhI7aTTzVnHq1N3aB3oUFK+hNMiDYYipTdWCefNEMcXf6n6fdCWh6v0+uJb6EQEYYApYSL0C0ez6NxFBRNlbbM+Rrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1x4RnheK6/LhYWF9bzfgUkWB/nfyA/xAppqOshrii+8=;
 b=AU+Uu167AeUjc3360T/fI1+x3PL/UpHodUDiweEGWj+M7cakfV0Ddrig1Sss6XNFfWMsVXkyk88EpWhiXGSdALfNtkQGBMxs56XQY20oG/A0UWvFekThcoG3hsV4WZWkmPmdKjkdoIQr6mZEXGZwFblBDQQkHfGnBoQHx3yYOcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6e045aa-783f-61cd-6ad2-f02f97f2f672@citrix.com>
Date: Thu, 3 Aug 2023 12:55:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2] xen/string: add missing parameter names
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Julien Grall <julien@xen.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <16c5362b740ed66100b55b528881cb26c1430f15.1691050900.git.federico.serafini@bugseng.com>
 <B1F3B24C-15FC-4A0F-BFB9-8C3C33E8FEB5@arm.com>
 <e2ab464c-f14a-4d7e-ba25-c88fad9c5d23@xen.org>
 <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
In-Reply-To: <4FE67D84-A5AC-4EA1-BCF4-212E4B916BD2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: c8dd07c4-cfb7-43c1-0c28-08db941899a4
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+bSYhj3Ii3aGNWCa0e5PurHE2GxDzr8mmdt8s1/Ch+SLaJwZs2VpOwHWRZmDXgqP3xJDgWPtuCDIEqPxUMgUGUS5MLsSNa2yovqDkEVbykYc+AASnoUp3vy12qxDRYx3Yb+432rJ5lpMdSnYPvGBWMMEplpmwmr+KCmD3SuL8hsBxFZhomsAl1qrslIjB89St3gDTvfJYdocOgbj0BwgkRrjxAXHdPVB6IN7x5ZkKaBWK6Uv8PGiPTKtoqRwIj3niaZTN0pITFtoURhSOqnSGTgBD3D+GJ/tFG4KaBVCTS3t7L4oEWXKhxxAlAOS9lr29pyDSm9RGfwjmjRrW2z3XsYv4rVknbnrXJKKQz0doaW4tNZw9DST/FJoaTJEtxGcaTi+G1vHM/WjbOECT/CxqLYsd53UHAkgA6l54yBSsJAI21ZCYpODjLPvb8pSWZoJz3dVvnogqZlKzwj/OBxNOujfme1K999y08xXkCAXZPtvsL1jw7ddoI7TfllazcqWM4+15JxrMjqYSUyhMEPKK1X7gi+NqAfDmJSvXJI9nTo7zEiAX23FYcoXG01sr68PkZYXZhz/aMHEpd20z2faTzyp+EioBL0yB5pyeN41Tb75in9/g5+1Bk/jFNBdU4km5vGTYblUoCB7ftqVBwvPhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(86362001)(36756003)(31696002)(31686004)(54906003)(478600001)(110136005)(38100700002)(82960400001)(2616005)(6506007)(186003)(26005)(83380400001)(53546011)(8676002)(8936002)(6666004)(41300700001)(6512007)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(66946007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEY3YTdsQURpdzUxWHc3VWVIbFEwYjFMVWo5U1JtUDRyV3UvaldXeW5LZUQ3?=
 =?utf-8?B?dnBRRzZMcTRobnBEN1hobXBNclNON2V3WnQ0azVtTDVYR0tobGNIaWhTWUpl?=
 =?utf-8?B?M0hpcm9GNUxXSFdsNHZ1bFdEelg1UjRQZXRFQzhzRTFzOE5zcVV0ZDNEN1pn?=
 =?utf-8?B?cjdrOTFWbjh0NGFjS29DNHRlZTBKWko5MTFrMlNqemZaeXNpQjR2dHdCVWI4?=
 =?utf-8?B?MDBnSkZnN2pBbVFkK2VTMk42dUM4TTdDT1VpRUV5T0NnaWxlVlJXMVJmbUhL?=
 =?utf-8?B?bmZ1ekRUZmE5K0VrVmQ4cjNYT0tGRmJ5cDltSm5lZVduMzdyUFV5OU5iNHVK?=
 =?utf-8?B?M1JCYlpESTdURU1VdjdTK1BDbDlka1lYa2FYQWZGVEhqNCtvbzFicGJzOXhw?=
 =?utf-8?B?WHlmTGRVNTd1S1BNUFFUcHBCWkZDeDVzMGFVN1BLaVNBWUxVeSsxVnBHNUhX?=
 =?utf-8?B?b2JyUlNaQi91WmpCV3NRU0VJbG1sSXdqMjNyUkRETUxTV0o1SEpxZ1JCR05q?=
 =?utf-8?B?N0M2bms2L3hWMVQ4eXhIYmxUc3pPcjNQRVNkRmlMNlNUdnVvYVhpMis1ZTh1?=
 =?utf-8?B?S1RlbnkzQUVaVEltYnRMOEI2L0h2WkFMdkRkeUdGcVEzRnZRV1BuTUloSlBK?=
 =?utf-8?B?VVUvRGRhWjhSMjZoMGMvc1ozdWFsTVVlVnBtTEdzS1JCaVAvTVVXeWhLNVdR?=
 =?utf-8?B?SWtkYkE0R0hwUlQwTXFqdlRWUTI2WEs1Qk8wWCtlRVJwM05HclhNWEErMysz?=
 =?utf-8?B?NHlNNHRIVVJqRzVGRFVKT045YytvQitKRFpESlNhczR4YWFlUUFvbmJZWnRN?=
 =?utf-8?B?WWxrdVNlak9rejVvdUZ1SEMySzBvemFycys5M0N2cFp3RzFCNGJqaWJhNUVh?=
 =?utf-8?B?THF0dytwVER2UTdIbHJCVlIrcHVSSHBFNW1zamlKK01HMUEyTHNhS2xXRzlX?=
 =?utf-8?B?UUpZWTFLaGdYV2VRSHlHSFNoMDNvaVo1MC9EUnN1bzYxRDNiM3pQT3R5SEVD?=
 =?utf-8?B?RHhRekFoS0o1RkdOaXZXb1dmVkh5MUZIMVdaWmxIc21JVkYrMDZzQzRBa0x4?=
 =?utf-8?B?eWdTR3VQc3owZTRiNXdXV05idVE2bTFNNC9RSnQ3YnB0NlNzRTdYOFFJM0JO?=
 =?utf-8?B?d09ERkwzT0ZvdmJ1blEyeGVPREVaZWg0a1N0SHBvSUcydzBPRVMrdS8rY0lZ?=
 =?utf-8?B?Qy9KUHB4a21LeStOaUsvb1FEU25lUGQ4N3JQMFAwdGJTZGpuSlVqNzJrbWFS?=
 =?utf-8?B?UWQ4aDljNlF3eFcyMXhlSHBIcEVvMW5QVWN1MVlHWHNCaUc2Si8yZTQ1RTlx?=
 =?utf-8?B?NXc4bHFiRTRGbWU5QWZ5Q2lOaGRCQTQxTFdrVktlMmVqVThMQW9yTWd2eDFz?=
 =?utf-8?B?YzFCVG1hbFNHTGNnOExIMnk4VVQreHNqM1pkdUV4Q1hBV3VXSHlqUlpCSGtE?=
 =?utf-8?B?cms4U3RaaDJsTnpKdS81ZTZSWnJVU0YxeE95QnlSc1ArZVpNcXFoTXg5dllm?=
 =?utf-8?B?Q3h2RU9OQTllQStHODFlKytaTElyUGJNazdHWE9rUWl2SWQvMmtwV0ZVQWkv?=
 =?utf-8?B?QWFSQWZ6eXEzb0prdXczeFYveTVVSzh2MmUwOVRsQVR5SVBJRHYzQnQ2VlVO?=
 =?utf-8?B?ZnFxcisxWUtPa0swcC9RVGloTU9tR3ZWZFFQVjM2d2FTS2Q3NjgxRmxKd3Jm?=
 =?utf-8?B?azNWM1JFdVBWMitrWXhQZFE5dTVjM2Fub2dQSmdWZGFtak1VaTh4MXoyS3JR?=
 =?utf-8?B?TmtuTXc2UXRaT1pZTjFEbStxOFRESndjRE5zRlBhbzhpYkNhUDd5SnFjZnNj?=
 =?utf-8?B?Y2g0cWFpNXIrd3RtNE5TWlpFZGhrc3dxc2paSHFZSGZ4UlhhRms4LzRoS2FR?=
 =?utf-8?B?WWkwK0Y3N0lpUFMyOUNxQW52ZW9qam5taTJNTEhTclUwZ3VpejBxbXF5SG1s?=
 =?utf-8?B?M095SEJ5Q0cwQzVxeWlVV0l6YXhaWTdvaHQ4OElCQVppNlZ3NXB1bCtKNEph?=
 =?utf-8?B?bXRiTU5aZlArOE5nYTJOV2QvYVpEMWk5Yk9zR2tRSDVnTTE3M1k1UjFmTVN2?=
 =?utf-8?B?NS9vMGc5K0U1TDZTV1p2NTZBYTNRdUVFR3FNaCtGdzh3Q3RNdm5rWmFtM0R5?=
 =?utf-8?B?d1FQMHJFNlo4WWI2VzQwU1JKZE4yR2VEZDIxbEZBMERnbjVwK3JENGdxTnYv?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jb8JrgwiS1m6pFPui+LN/ZrwukpGo544w0AtaKR90Hh+V9M/sIxWSFRnW476oi4lzEPOmZByLXgE2sGbT4sLAs7QWzYxsPVUqZletZldvazVucHy+mUG+Ib7XcAfgB5iuVBNMwKOHpHjb020byj1Xm9ph/kvb2QAZ9MzBCb1EVI/0oBYzT/0/NifzGvWuuPwMgANLFQOWrtu7yhn1RHK60Zz30vXrgiKQiWZExTMmlTf/AQYOuJCT6YlwjlKrjDDuU8rdKQ8OR+A0niZr79HL1ONRS48XG1C+MQff4L9GOv1LWC73tsU4q79nW8FebRyD4V04UfWYxgeAdGzQxUMpyHBJ5Ys4s+ukQ0NxhyGE8FMUzDHYjC1eY8veyHo+zB1rXEATLJjY/6DppfeQ7EowfUzH9toOZdIYe/XPGG846FhHBF420oGn9dh8rVmBBO5i8E05aA679MWoE/C+OudkdqCEt5ngwKc2VH08YJGC9y6C0RCC+3ok+xcJNTlLwK75pv+MJ/BksndvfWCn0J4dmPkYtq1ZLQ6jrx8Hq1COYPq5e6XF73P0VaaCBYaZu4FBTxHCKJgHfFRsGuweXCp6DQ+MhIfGD8JnnV0pmSNbWC17dhVK5b/AQlqr0v3wCjo+iAepmC7ds+Hv8x0yoqnVm3Iyh74fE9IGa7WP9lAMsrBtMM4Gpqd7RkrzTNIFoi0nKi9827DVTi1Uzqhxubpkfv5rwEIiJTiycXdRdYsgPbj32aba4B9K5S9/pv3VbNbZQSghNdq7QIE1nFAWfhKed3VtU04IGGvP5eIPxk8EfnZ6va8Ma/HhbO4OAPLsHBYrIHHy+qLxTMZSgOIQHj/X+DeNtT9qZmWm1Dcv6Y6ZuGQRXwjB50QzL+4wl0i7Zg0TSG/VoFU+XsWWq7awVGF0w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8dd07c4-cfb7-43c1-0c28-08db941899a4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 11:55:58.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8piwnMoxqrt26yyQk4SzqkTUr19dS1Zd87Ih9HG2uiqHvNMjmq1/PgjUICdzhDOcJNd4XotsXLw9jRHdFylg4sQYTIoCGQLJJCDDovgKigY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5184

On 03/08/2023 12:52 pm, Luca Fancellu wrote:
>
>> On 3 Aug 2023, at 12:46, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 03/08/2023 11:28, Luca Fancellu wrote:
>>>> On 3 Aug 2023, at 09:26, Federico Serafini <federico.serafini@bugseng.com> wrote:
>>>>
>>>> Add missing parameter names to address violation of MISRA C:2012
>>>> rule 8.2 ("Function types shall be in prototype form with named
>>>> parameters").
>>>>
>>>> No functional changes.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>>  - memset() adjusted.
>>>> ---
>>>> xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
>>>> 1 file changed, 21 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
>>>> index b4d2217a96..e91e3112e0 100644
>>>> --- a/xen/include/xen/string.h
>>>> +++ b/xen/include/xen/string.h
>>>> @@ -12,27 +12,27 @@
>>>> #define strncpy __xen_has_no_strncpy__
>>>> #define strncat __xen_has_no_strncat__
>>>>
>>>> -size_t strlcpy(char *, const char *, size_t);
>>>> -size_t strlcat(char *, const char *, size_t);
>>>> -int strcmp(const char *, const char *);
>>>> -int strncmp(const char *, const char *, size_t);
>>>> -int strcasecmp(const char *, const char *);
>>>> -int strncasecmp(const char *, const char *, size_t);
>>>> -char *strchr(const char *, int);
>>>> -char *strrchr(const char *, int);
>>>> -char *strstr(const char *, const char *);
>>>> -size_t strlen(const char *);
>>>> -size_t strnlen(const char *, size_t);
>>>> -char *strpbrk(const char *, const char *);
>>>> -char *strsep(char **, const char *);
>>>> -size_t strspn(const char *, const char *);
>>>> -
>>>> -void *memset(void *, int, size_t);
>>>> -void *memcpy(void *, const void *, size_t);
>>>> -void *memmove(void *, const void *, size_t);
>>>> -int memcmp(const void *, const void *, size_t);
>>>> -void *memchr(const void *, int, size_t);
>>>> -void *memchr_inv(const void *, int, size_t);
>>>> +size_t strlcpy(char *dest, const char *src, size_t size);
>>>> +size_t strlcat(char *dest, const char *src, size_t size);
>>>> +int strcmp(const char *cs, const char *ct);
>>>> +int strncmp(const char *cs, const char *ct, size_t count);
>>>> +int strcasecmp(const char *s1, const char *s2);
>>>> +int strncasecmp(const char *s1, const char *s2, size_t len);
>>>> +char *strchr(const char *s, int c);
>>>> +char *strrchr(const char *s, int c);
>>>> +char *strstr(const char *s1, const char *s2);
>>>> +size_t strlen(const char *s);
>>>> +size_t strnlen(const char *s, size_t count);
>>>> +char *strpbrk(const char *cs, const char *ct);
>>>> +char *strsep(char **s, const char *ct);
>>>> +size_t strspn(const char *s, const char *accept);
>>>> +
>>>> +void *memset(void *s, int c, size_t count);
>>>> +void *memcpy(void *dest, const void *src, size_t count);
>>> There is a comment in arch/arm/rm32/lib/memcpy.S with this:
>>> /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
>>>> +void *memmove(void *dest, const void *src, size_t count);
>>> There is a comment in arch/arm/rm32/lib/memmove.S with this:
>>>  * Prototype: void *memmove(void *dest, const void *src, size_t n);
>>>> +int memcmp(const void *cs, const void *ct, size_t count);
>>>> +void *memchr(const void *s, int c, size_t n);
>>>> +void *memchr_inv(const void *s, int c, size_t n);
>>> @Stefano: would it make sense to remove it as part of this patch or maybe not?
>> They are a verbatim copy of the Linux code. So I would rather no touch it.
> Oh I see! Thank you for pointing that out, then I’m wondering if it’s there a reason why we
> are using ‘count’ instead of ’n’ as third parameter name, I know Stefano suggested that, so
> It’s just a curiosity. Maybe it’s for clarity?

'n' is what the parameter is called in the C spec.

~Andrew

