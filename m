Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0C2607884
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 15:32:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427694.676996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ols8G-00010P-PI; Fri, 21 Oct 2022 13:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427694.676996; Fri, 21 Oct 2022 13:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ols8G-0000ya-LA; Fri, 21 Oct 2022 13:32:16 +0000
Received: by outflank-mailman (input) for mailman id 427694;
 Fri, 21 Oct 2022 13:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mzs=2W=citrix.com=prvs=28632f022=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ols8F-0000yU-31
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 13:32:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbbc05b7-5144-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 15:31:58 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Oct 2022 09:32:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5293.namprd03.prod.outlook.com (2603:10b6:208:1ec::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 13:31:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 13:31:59 +0000
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
X-Inumbo-ID: bbbc05b7-5144-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666359133;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=U7ecJ63b83PMhoYMKYCzCTrAj1icQz4tQWStVl75Eks=;
  b=FX/omiuqp2SIIMVuImRFWUAzQOP+objh0otVs6fC2RBzDLbbMOBFBQS6
   WLOUOtWqq19O8ASv8rOlMJtgpXu3GyTgtzK38aO9MIX0y5SiXbbzTU85d
   wE7uQL3LN83+08yb6JdvhQCjf/99Lc4QbVnlQ5u3ydTwujoFzgkmIOeD1
   g=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 85773770
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e1U/86CxOQy1CBVW//Xiw5YqxClBgxIJ4kV8jS/XYbTApG8h1TIHz
 mFNX2rUPqzeZGChft93O4608kMDvpLQztdlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8pWo4ow/jb8kk25K6r4GpwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2l1BI44uc10AFpxr
 90VczMgVj+krtq5lefTpulE3qzPLeHNFaZG4jRM6G+cCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWAI7gvN+8Lb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+toi/z2bSQwnuTtIQ6O7uCr/xz3hqvxTYcCCNVWmDnjtazhRvrMz5YA
 wlOksY0loA39UerR927WAeqrXqstxsQHdFXFoUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRkuaeZTn+1/b6OoTS/fyMSKAcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdOTz22
 SHMkyE4iJ0al8tN3KK+lW0rmBqpr5nNCwIwuAPeWzv96hsjPdb7IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz2k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:2e/AiaN1PIFZm8BcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw5zvmWehTNYd3E8LAv27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.95,200,1661832000"; 
   d="scan'208";a="85773770"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSSH40t++3t9mmbq3DVSbgUJWrZpnx3rfFhQrwwh21l4knZs2HfOcYmcZMfqZHfG75RDAREUUm53RSKUbxrlAZV+zLYHw+F99HzOJZ0/gR8/sw7mJtM/5vM9slA0q4x08b5Y/x6SPXp/yAVLK/Rdd+XlShYew4nN5m4pi+RTd5F/Z+orMk/qxfua0R2ObS6SMZCf5KACXALqWc30xTT6gwdA28kRseWxJu4yzqOUtKkgh+86QmkqiunyU3uzJ4vZ9lgrY/Grp241R8wHAmA/gGmqdWw/9De80Bw1y+obFElhBsn+LQiZJJSn5YkBe2XR+wh8erkY6ar/l0R4J5PXfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7ecJ63b83PMhoYMKYCzCTrAj1icQz4tQWStVl75Eks=;
 b=DY/3LP90DtBZDkRCad+iSmLVqfhqkAj0w6rSb6sd3uAW22JPcSNEa49isbDVzn/Xah4YblrX44beZnhiYSYx2ae5gcgrXOKY6xLmwIYM8gYVszvpNjinMGctmW+X/SoVANpW/iYULcEbfbif76QgnHHO/YrWhGZsJArSqRzQIyvQiyQZa6FKY2i86IwSfLQ3LiiCxNs+a4XiZBdPxjUMiF3Srl2kNzOTe6k+CVNSxZYyCcuuY6mi6g5/40rQoZ5LqbZS12RsuhVNT+3lp1alFEalZg5roOoDJhB9gs0ZvonUHwoxwwGwyP+Pj0NZjJ5WJe6n/Km0Td23vByDTyFjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7ecJ63b83PMhoYMKYCzCTrAj1icQz4tQWStVl75Eks=;
 b=GDQJSCkcT/gU484W775iXD6QpgCHnahYgXIavQN9uqmGe2XOSif7VO8Gutn9a7sqHd1/n2V3X6boro2aYdAZrjYKQ5drOKicDauO7qhZgdwZxzpZ8uRSsz+qGW1dH7ITiDRX2S/X+0JUiYDWj9kcB8QU9P+KMQxTemCiRkbqv3g=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.17] automation: Build Xen according to the type of the job
Thread-Topic: [for-4.17] automation: Build Xen according to the type of the
 job
Thread-Index: AQHY5VBUk9XVwulUUUausYFLiYVWqa4Y2FsA
Date: Fri, 21 Oct 2022 13:31:59 +0000
Message-ID: <9eb64ced-d04a-d406-e1da-86691ba79be6@citrix.com>
References: <20221021132238.16056-1-michal.orzel@amd.com>
In-Reply-To: <20221021132238.16056-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5293:EE_
x-ms-office365-filtering-correlation-id: 9c3856ab-e4c9-416c-83fc-08dab368a158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1QsNlZHDS7GsFXAjPnDV4CEDbGFRbO8B10jz4oGGwdZPWB/9A8L9hPHQ2+CDsXEqqMJBSfkaMZPuvWvBbinahw9W1FXN5mHiQyA2HEtyThGsjotmJ0/+cRvoyoGERYG8JYjrox4pQnbHdoB5cnNWtkDgqs/Fo+WQ94fIW9MHAOJzpwScWYDpv2DbWAIclR63ARtnmuXG2l58VbIPXST6AFhsCUf8IdR7QVVUFb01Pj2EYTJnRMYCV+yYuI2p30NmySc5dN6DXsjIU59GsOmgEG+e+Us+S3tgBRR9x6fF11Z22a4lFC1MP9x95+SKHyCUW2b5snCqlHpqV35Thu73nsAPZwoIynWhOsnNjCx0wMKwNaUbO5WmQicJ58RcsAHGj4kfgs4IQfKSJ0yMfpSZirHUsvA1XZjwX3NqDY/0AkXA/fybJHFmCyAtDiXNkBZgxIkLDBEUW1RmK56431elX4cVTw5rqwUjwyQLQCOKW/81LjMEIBHDsCrPOtH7Jj75CA/B+1y6D+T7YFkW+hlW5PADTKkB9jkOlnabR4jUj81ycYaT2ZZLwbV8JOq8mxIgcBF5BxxvrjCkos55WmoD9Z4G9OK0K/WOkkzh97m3A+SAHEBrmvCAuro1oDeoclkgL/LX8AiUQmsZlBvbBIxZDfbMB/74PYGPILRrdnipglEFgy72dhj9xuft1G2zVvD1wx7odzV1ZebPOp1YMwMRGaq/mpvBmJfRNpDJVlXQrpVjv2ap0O3NzYtjET4K4Q2jiKhBtATkLLuEeLbDcMZg7vwzzcmEp2eBqfHQn4F9zrL5MwES4Lkovsryx0vwlF93SIONC26oHmjacZaeqTAu8A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199015)(2616005)(6512007)(53546011)(31696002)(76116006)(26005)(6506007)(66556008)(186003)(66946007)(31686004)(91956017)(66446008)(66476007)(64756008)(4326008)(8676002)(316002)(41300700001)(478600001)(36756003)(6486002)(38070700005)(110136005)(86362001)(2906002)(83380400001)(71200400001)(54906003)(5660300002)(38100700002)(82960400001)(122000001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1B4YytMeDZwRnQ0NXpodXFjcTNHeHVvSW8vQjVoU2FvMXc4VS9lbDVFUkw2?=
 =?utf-8?B?VnltWG9ta0FsTG9xbUpLUzViZ1l2YjcxR3gzcnRnMUgyRGI1NW1nemZ4cVZO?=
 =?utf-8?B?VEExOEVvMTB1WGFkbzY2ak44VisraHBZc2l6Umc1MkY4NHdkaWkrVnB0Qldo?=
 =?utf-8?B?MHF2enEwNzUrUVJ1dUtEaGQyeG1oSEFvR29HaFM0d29yK0xDUUhNQVExdTVj?=
 =?utf-8?B?SGJZVit1MFBudUk5NDNuUS9hRWRhcmtmb0NwMDM4UENpOGN4b2tKRGlxNlBB?=
 =?utf-8?B?ZXZxMUFLNVBGV2xsU1BaTWw0Tm1BeXJUR0JEQU9BaUl3cVlkMDB2dDZEbG43?=
 =?utf-8?B?N1NFMEZMVnU2MkxFM0Y0Y1IxaE1PNk9UWDJBN3NGWnM2cURVSW8rK3lQUDFr?=
 =?utf-8?B?VEFyenYrS3V1WHcxZlB6WjNhVnFneDQwZWUvQ05odHRtL3Q0eFNwOGZlWUQ0?=
 =?utf-8?B?ZFpKZnF5dXFGTG05bUY2amwvMTFTK0FBNFhJUFVDZTFrSk5TWDhwOEgwQzdh?=
 =?utf-8?B?aDlacHA4VTZyWlJXVnlWaEVQcEswV2lLVit6SGdUd1dRQnljdEdPVUJJUHU5?=
 =?utf-8?B?cU9JZy9FLzBRK2NxbDduUzdyaGptcnlxWWd0N2dSRHdqSHVGYjUrK1o4alli?=
 =?utf-8?B?S2xzRWF1aEJLMm90d0hrSjJXQzRDSm1nTDU4T2Z5dFY5dE5aYm1pWHNJL1ZW?=
 =?utf-8?B?SzRKbVc3SWs3S2ZGL2dVQXZXVUJFY2t1VlM1K2poRWJRU3cvekZEOHh2dkRr?=
 =?utf-8?B?OXVBRElibm5VMjFId0ZVeDBvYW4rUW9SOHZBZDl3V3RvTnB2MmZZbDN1NytF?=
 =?utf-8?B?aUVETzhZTXI2R3V0QmFKZ0hERy9RVWthSHEzY056ODRTZzY1TUVGZEVIdDlz?=
 =?utf-8?B?L2RRNmdteWNoSEVNcjdyUXlaRVBDZnpycTNIVXM0aUNwTDh1TmUwKzMydysx?=
 =?utf-8?B?Uk8wVWJjdUhYOEJyZ3JGK3JySFplUWtqM29hT2g2Und0a1Mwd3NCQWRvdWcx?=
 =?utf-8?B?LzB5ZGJpYUc0TmljbnFKaHI0NHRkOWw4Y0dyN1oyVVR2VnoxMnkzZFUwSXBs?=
 =?utf-8?B?M0ZlSm80aktFbFdIWFNnOGp5Q1NmVE53bUxUVHZOZGR6eUxoRUpLWkEvY3ZF?=
 =?utf-8?B?RFNiaDltNXRPcmo5SnMwTjhiVU5ielRLc0hKQ3pvMXNueFlEejJMZGNqVFlG?=
 =?utf-8?B?SXJKbkc1MlNZclE5TEFpWkYwY2psalNWVHhQV21PRUVqckFWVnJYc0pUeWtZ?=
 =?utf-8?B?ZzgvMGNkendtTjlMSVR4WC91RkpHMGdiY3FTdUI3N2pyeFlKVUY1K0hLL3ph?=
 =?utf-8?B?ZG1nOWl2NDY4aTdGUXg3RjB0QlkwZXZqVmtTdUJIVUNsMmVUdVpoeVM3RW5V?=
 =?utf-8?B?cHZYZWlIUkJFWHZXWGNpN2k1N3NudU9GTVRhZ0hmL1BDVW9vSzRRejU2RG1k?=
 =?utf-8?B?WmpZbG5yMDEvNnZPUjlmQTMxWEJTWVVBVVFwTUhacXhZZkV6b2xrMnFyQmVw?=
 =?utf-8?B?VFpOSTFuQmdSelNXdTkzUHhvVDdlaWhqZzUyVTA1L21HQU1oeXBETGpkcDdS?=
 =?utf-8?B?Q0NPNWxVdUJzckVRRWxXRHpuUmhDc3F3ejZmcHN1TzJyMXdGUVMxTGF4OFMw?=
 =?utf-8?B?L1FBZVpOcWJLcmd5MVZLY3VwMXpib2RFaHJsOFprMFVwTTVXNFlDNUhIOVdl?=
 =?utf-8?B?U1lBQzR6aVNkNkhWUlRtbUN1eDJhbDgwRlczQ0JaUnJQK1lwT0RWZE0xQTBG?=
 =?utf-8?B?ME5pcE5NcGo1cVBrV2MxV0pZUEt3ZEFZdXpML2ZSN2p3L1hlUmZ1a2N6UDhT?=
 =?utf-8?B?bXloNVlGb1Q0MFZpSWw2aU1BUG10amtoUDkvMnhXUTIwbnEwb055K1hpRmRK?=
 =?utf-8?B?bFdDQ2hLVkZFT0pKa3VFZUp1VGY0QzJpNE1FdHpML3ZuYmhERmRLMTdacktZ?=
 =?utf-8?B?VUVpdWRQUWFLNnhQZUtKV21KcG1aMWNKOSt0aHc1Q0t4bnl4eXYyKzJlSk9T?=
 =?utf-8?B?TUhKV0d3Um9MbzRuZ3U4dlpuc3l4VmtRbEV0TEFoK1FvK2IrRHR4bCtMZDM1?=
 =?utf-8?B?VG9WVkJmTUVacXJCc0xZdnBnMkl0MXRrQnVIUksybDJEMElIdE50SEdlSFcw?=
 =?utf-8?B?UVVjLzc3d2JkeXVnUmtsQWFvTDNpUUd4bDQ5b0dMVXJkc0VoOWl6ZkZuVWh5?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CFED7CEDF11674294B81344E733CEBD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3856ab-e4c9-416c-83fc-08dab368a158
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 13:31:59.0781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D95R+hQhoBd1QDK1q2eCHh+uItZ40SoVg2Bua7v7RSI95eCP9WlgS9ZSfOLHUo/bhWOoFZTmVfz8NGuq0aNWaWjoQCVaoCSN+MY9UEPUlII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5293

T24gMjEvMTAvMjAyMiAxNDoyMiwgTWljaGFsIE9yemVsIHdyb3RlOg0KPiBBbGwgdGhlIGJ1aWxk
IGpvYnMgZXhpc3QgaW4gdHdvIGZsYXZvcnM6IGRlYnVnIGFuZCBub24tZGVidWcsIHdoZXJlIHRo
ZQ0KPiBmb3JtZXIgc2V0cyAnZGVidWcnIHZhcmlhYmxlIHRvICd5JyBhbmQgdGhlIGxhdHRlciB0
byAnbicuIFRoaXMgdmFyaWFibGUNCj4gaXMgb25seSBiZWluZyByZWNvZ25pemVkIGJ5IHRoZSB0
b29sc3RhY2ssIGJlY2F1c2UgWGVuIHJlcXVpcmVzDQo+IGVuYWJsaW5nL2Rpc2FibGluZyBkZWJ1
ZyBidWlsZCB2aWEgZS5nLiBtZW51Y29uZmlnL2NvbmZpZyBmaWxlLg0KPiBBcyBhIGNvcm9sbGFy
eSwgd2UgZW5kIHVwIGJ1aWxkaW5nL3Rlc3RpbmcgWGVuIHdpdGggQ09ORklHX0RFQlVHIGFsd2F5
cw0KPiBzZXQgdG8gYSBkZWZhdWx0IHZhbHVlICgneScgZm9yIHVuc3RhYmxlIGFuZCAnbicgZm9y
IHN0YWJsZSBicmFuY2hlcyksDQo+IHJlZ2FyZGxlc3Mgb2YgdGhlIHR5cGUgb2YgdGhlIGJ1aWxk
IGpvYi4NCj4NCj4gRml4IHRoaXMgYmVoYXZpb3IgYnkgc2V0dGluZyBDT05GSUdfREVCVUcgYWNj
b3JkaW5nIHRvIHRoZSAnZGVidWcnIHZhbHVlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwg
T3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiAtLS0NCj4gWGVuIHVzZWQgZGVidWcgdmFy
aWFibGUgdG8gY29udHJvbCB0aGUgYnVpbGQgdHlwZSBiZWZvcmUgc3dpdGNoaW5nIHRvIEtjb25m
aWcuDQo+IFN1cHBvcnQgZm9yIEdpdExhYiBDSSB3YXMgYWRkZWQgbGF0ZXIsIHdoaWNoIG1lYW5z
IHRoYXQgdGhpcyBpc3N1ZSB3YXMgYWx3YXlzDQo+IHByZXNlbnQuIFRoaXMgaXMgYSBsb3cgcmlz
ayBmb3IgNC4xNyB3aXRoIGEgYmVuZWZpdCBvZiBiZWluZyBhYmxlIHRvIHRlc3QgWGVuDQo+IGlu
IGJvdGggZGVidWcgYW5kIG5vbi1kZWJ1ZyB2ZXJzaW9ucy4NCg0KQm90aCBzZXJpZXMgd2VyZSBm
bG9hdGluZyBhcm91bmQgZm9yIGFnZXMgYmVmb3JlIGJlaW5nIGFjY2VwdGVkLsKgIEl0J3MNCnF1
aXRlIHBvc3NpYmxlIHRoYXQgb25lIGJpdHJvdHRlZCBhcm91bmQgdGhlIG90aGVyLg0KDQpUaGlz
IHNob3VsZCBiZSBiYWNrcG9ydGVkLCBhbmQgdGhlcmVmb3JlIHNob3VsZCBiZSBjb25zaWRlcmVk
IGZvciA0LjE3DQphdCB0aGlzIHBvaW50Lg0KDQpJcyB0aGVyZSBhIEdpdGxhYiBDSSBydW4gd2hp
Y2ggaW5jbHVkZXMgdGhpcyBwYXRjaD8NCg0KfkFuZHJldw0K

