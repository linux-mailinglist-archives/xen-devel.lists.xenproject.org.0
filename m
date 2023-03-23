Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667186C69B9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513884.795573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLDH-0006uw-7V; Thu, 23 Mar 2023 13:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513884.795573; Thu, 23 Mar 2023 13:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLDH-0006sJ-4b; Thu, 23 Mar 2023 13:42:43 +0000
Received: by outflank-mailman (input) for mailman id 513884;
 Thu, 23 Mar 2023 13:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfLDF-0006sD-1A
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:42:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fa4c4c3-c980-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:42:33 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 09:42:34 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 13:42:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:42:32 +0000
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
X-Inumbo-ID: 8fa4c4c3-c980-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679578958;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dLQMiU88LciF3VHmTksj1ago2nM/HEYfeeqwYVcW4ng=;
  b=egLVglY5wZTHzIKeg9x+7RL+jB+0FPAZMfOI0xwLKr31dz7nDn83+gSa
   b4UMhVzZpj5wmr7DuxQiQ2ToPTGCt/ekUGWY4h7hGrI2FJD27gmjG1fro
   z1om9z8bl1pG2C8u+oyVS0Nt/Firx5ReAlf9HgQz1fQZbBc4hCS4xdRit
   8=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 101388635
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zzRD86IbYsE5L1cVFE+R4ZQlxSXFcZb7ZxGr2PjKsXjdYENS0jABy
 jcbX22BbPncMWTyKd5+bt7ioUMHsZSHxtBlHgNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c52Jjtwr
 Pwldwsfaw/f2Luy3YvhUcpV05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuiA9JCSublnhJsqH2fmHMRLQxHb2OUsabpjWmSQ/lRJ
 kNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkA9MW4HTT8JS00C+daLnW0ophfGT9ImFbHviNTwQGn02
 2rT9HV4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:IjawXazxpjhoqHSAC5zzKrPxMegkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67SdC9qADnhPlICO4qTMqftWjdyRGVxeRZgbcKrAeQeBEWmtQtsJ
 uINpIOc+EYbmIK8/oSgjPZLz9I+rDunsGVbKXlvg9QpGlRGt5dBmxCe2Km+yNNNW977NYCZf
 ihDp0tnUvdRZ1bVLXyOpFDNNKz1eHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lMzQi5C2rAr9E
 nCikjc6r+4u/+25xfA3yuLhq4m1OfJ+59mPoihm8IVIjLjhkKBY5lgYaSLuHQYsfyi81Ejlf
 jLulMFM95o433cU2mpqV/G2hXm0hwp93j+oGXozEfLkIjcfnYXGsBBjYVWfl/w7Fchhsh11O
 Zu03iCv5RaIBvclGCljuK4HS1Cpw6Rmz4PgOQTh3tQXc83b6JQl5UW+AdwHI0bFCz3xYg7GK
 1FDd3a5txRbVSGBkqp9VVH8ZiJZDAeDx2GSk8Ntoi81CVXpmlwyw8iyMkWjh47heUAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMUqJSG6XVJ0vCjbokdra8b817OaldNgj150pgq
 nMV1teqCobZ1/uM8uTx5dGmyq9AVlVZQ6diP222qIJ/4EVHNHQQGm+oREV4oWdSswkc47ms6
 3ZAuMQPxfhRVGebbqhkTeOHaW6EkNuI/H9iuxLKm5mnfi7WrECltarBso7d4CdWAoMayfYPk
 YpegTVCYFp0n2LM0WI9SQ5HUmdNXDCwQ==
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="101388635"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqgiPhoB6uJoDkVWcXupiVDiPBajnkIqNWoslDwqCTxYkIatniQIIZFXTk4jsIU2GqyS1ewM7m/HUyTuq9r5W0/VB1Vt83TtuXXGBAy18Qoy7REmOsVD8dcZqTmLcekESJe7Np9ltLKZTvMVWtKr5XkZ0/yiVR+ZJ1Mxzt9ZlnS9VOfwSoNXLaezTVpYKXOQB+HJvplh52dcv9B/cHjvkqbv8tHO6ca/zyx2hlufNnjeK9jIFy7z3mofwfQjAzZGaA1ZC2khMaqhmNnJYwWpaXAzrA2VBPTMp0cozCZZdqULtOlQf1b4MNFEah3kMcssNiTD+ym9GLZFs9/dc9bBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLQMiU88LciF3VHmTksj1ago2nM/HEYfeeqwYVcW4ng=;
 b=NlcGG2AGha0TTKaK1IT0TdycVhOQTH55HGPsLFAwOpfmYRj9lv64XHJvH1rdwK97zEPPPOgPwwEuR3ld5KscQnP4VIc6nWMN4NjJQaieYr9NoTBx8BXY9tEd1yYws++h8LXT0g+BjkKkxDMBLt0j4y5nCcDb7N13aTPc00dTfXgvEnXrMZns7Z292cKQOuoUNwqnIMuhU8QRD//getbHxhdl3EZw56ASbkk5HMoWu4dhBSUKsr0IEcnzIGXT9eus5nTyfAlbbTwCfXX5udKEBbW8NEnpc8GWQ/g7ma6Kxv4jVJU00OPSUrl9quK483xkMZdDInrD89W0JzZSfEVtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLQMiU88LciF3VHmTksj1ago2nM/HEYfeeqwYVcW4ng=;
 b=Xm5Tx3dzmupbFEG7C7mOBhg2Zvcy+7plrN0WTXZvdFfLzh4LVNKW+mzb9D4b+gowXtVhZtyOato7XH4R7liELb18dh5o6xJNVm+2muwDP7LHK+IkgB8JXGETPdAxAHpRmYHQZTMtmAczp8aXi5ut2fQdtFpbfbl7wc2vOgJfVBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <909fd789-edfe-8146-5cd0-1d79d362d440@citrix.com>
Date: Thu, 23 Mar 2023 13:42:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 09/16] x86/shadow: OOS mode is HVM-only
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <49ba3172-3b8a-4c0e-5413-bf58b66c82b1@suse.com>
In-Reply-To: <49ba3172-3b8a-4c0e-5413-bf58b66c82b1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6382:EE_
X-MS-Office365-Filtering-Correlation-Id: 47aa3ea7-7ac4-4e09-029e-08db2ba473b0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	70BeMaROjBq3/VQHf1SBYUAQ+X4Ma9cRncfutn0Sn/6Hd1VP4aBT+WWfSNCX0DUs7hYkf6yzwDtjlXoU66qGEFFv8JmBJxjXpcyW0L6V3XlKnVUZwj8v4CUs7/yUauvu890kOvasXK2LvbQVY9K65RJPedmS+dpJQ+xgZZiv5lLZ5CmR0reV7TJGmNSsAQRZdqTR02QjU1IWkVL5Q67dpL9Jl/gxpvLgQ8HrIoZOnwZSDQHD2+pwk7aT83w7LqPUMdQqzHbpDmVi5N3XuGiKu9ZfMECfGVvHcium5X6Ax3k8RB0sa8GrGdc9knPb50N6SOTI52G2cDiBNhS7rKf3UWQshyHtbZVC40RmOMqfEX7t6IXbKUj416ElmQPBBGA8r4p3tYCuNTqfrHSwmUZi0ObJTK1GoFOTSFW3XaimTQKJgbPY8/CyTt16Tn9+W2L6v7dD/m3uhQDbV398RqS/z54GTgLe79Neqbc9vyDWWPb4lvZEEh2R0tC5KL62ZaTOZGLohs7gyQgZ6FrKQTwRd+zysWo5GP6JpK3Qi8IKxb2EOov9xMxldwP0Guz4nMNAEQrxr1G+hPUKYlSzCkiYyWeSVhNZcGg9fAJggU+n+QPB6QOoNibGhx6qY+axt+FvrvIvKAswaghD/O5j6UDLOIpc8PHoQzyjV42qbE804CtghrMlLx8EmmMVomAyHeLCEjUjABr0i5obaYi2y+zXLe6OshujvLGRiK1+smgNn50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199018)(4326008)(8676002)(66556008)(66946007)(66476007)(4744005)(316002)(110136005)(54906003)(5660300002)(82960400001)(41300700001)(8936002)(53546011)(26005)(6512007)(6506007)(6666004)(186003)(2616005)(478600001)(6486002)(86362001)(31696002)(36756003)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFgwaUZBT3pZM1ZHdlJ1TXArY1R5YUFRL21tNzBiTjM2bFdrazNSWWZKejBp?=
 =?utf-8?B?Zk8za1RKVmxSWlZROUkwR1ZZTGI4NkJDUG5ERHNyNGdLQTYxMnFSNExjLzVj?=
 =?utf-8?B?RFUvOTdzakQxMXYwWTdtQ3hEVjkzZlBpVTFsdGlsNXU1UktQYnVnYytLR3NT?=
 =?utf-8?B?Zk93Tk9FVmgwb3BURStFT3BFSTNPZEhoVVNlVHArTEJJY2FoVVh1ZGVGc0Z2?=
 =?utf-8?B?UUlWNXNHZ2NGV2paaXRURzFjeHhuZjdGRW5saGNXakVHdFFwZzZXa3A2Vm1P?=
 =?utf-8?B?K1hjdHNVWW01cUlqNHRBblZyZXY2aXpVNHQweFExTWdhWGFlM1UwM3V6VFZ6?=
 =?utf-8?B?YU1IekVUOGhwckxnTDZSSGdBclp1bXFnMVpXT3M4cHErb01OM2U4TGRaZFZR?=
 =?utf-8?B?a0I4eERYNjB2YWIveGlUTUdGMi9OYVZNQXdPTllURm15QTJMTCttYWlXcHFR?=
 =?utf-8?B?bXovbkxIVitBcHdxVWxSMm1heXgrS1ZnTWx0a091eEFvVGRXQTFZbTc3ZGZX?=
 =?utf-8?B?UHpJMmFnMEYxcy9vR3lEaW9zQ09EWUVmMXU5TzRsc2VkMEU1eE4xU2dMNDA2?=
 =?utf-8?B?dWtGZXdTWTMvMDB5dVJZdlFJM2I5NW44em1IMVJqcDZIZ013OTNkZ3V0QzZQ?=
 =?utf-8?B?ZEtnLzgrL0ExTmNhZVkwTzhLN01XRjdUcFY0Qjk2S0FFS21GM1luM2RNVmxX?=
 =?utf-8?B?VVBEZ3YyUUk1YllwUUtEVkhHUFdIaWlkVzJOMjFSR3VXYkNVUXJ5WG13a2Vi?=
 =?utf-8?B?WDZkNE5ISE9XaVVvdHRTVC92UXViV3QwMi9USVhIek9KZXdRSlQ4SU5RTjlV?=
 =?utf-8?B?TDBwVjdkdUhiYnllQ3Arb1ZZYnVxRi9CMm1mN3VZTEtHTWZ0bjBGQVB0dUVl?=
 =?utf-8?B?Y29tRjNjZUdFWktVcEQwNEoyV3dtU2cxbmhOWnNKVVB6czJuOFBOejZueXRR?=
 =?utf-8?B?QUdXVG53ZFBsdEw2cDhaN1d3OFVvV3I0UU5SSFNycXZIaXdQeGNLaXNwTmJY?=
 =?utf-8?B?U0ZITlRaWU9iWGNlNVRsKzdlcW9QdlFWbDVDS3lSUEVOalRDaXNjeFhZN3Vj?=
 =?utf-8?B?YXVyTHZSYkNFdTJGRng1bHdURDN4U0ZRQVhGamJFdG0xN2hLcm5OQ20yenFU?=
 =?utf-8?B?WmFOMDFnVkZHc3VOdWdlVCttZFZZeXNHVW1uR0tNZWhTUldJTnp0bzZpWGRR?=
 =?utf-8?B?ZFV1cG1pSHlLaG1pTjVjaUk2Z2JJc2xiOCtlbTVpN2Jsa2tvRkhZQ29leStS?=
 =?utf-8?B?aHNZT00yamNhdnN4YWNUUXh5aHlaa283RkRCQWRuSGlzL0hpMkVFTHYwUERQ?=
 =?utf-8?B?MTBOUXRuVnpFYURWVSs3MGxyc29nUGphWXFKRlNQSW9aVW1qaCs2clJMYlBT?=
 =?utf-8?B?NHRCYlY3OS9TU0QvUVd6M0dtKzdQQ05QQTB3Zjg2K052Yk9EZWNqQ3Z0SWow?=
 =?utf-8?B?OFlOUWpsQ1hSN2c5ZitXdWVqU2RiM1B6clpCT0xKWnZxaHdpa3JGcWFETDhv?=
 =?utf-8?B?MFZERFc4eDgrcHhLSW1BN0dpU3hKTlljQjZHWHAxNlpUS3FYdXF5NDRkQWZ2?=
 =?utf-8?B?YytFMzZzaGpSVEFSa0d0WWt0OUJkcHhDeGpPUFlTbkRtRlM1MUVhQlNKS0dj?=
 =?utf-8?B?REVJd1VaSWxSSkh6MnprUEQvWDQxZ21HeG1BVXRLTkRwbm9oRG5WMWFiRGUv?=
 =?utf-8?B?Mmh5NXJHL3JwUTlQNXhqUGZOS1JOeWVZei9aaFNYRFczd01BNm5WMlcraEZI?=
 =?utf-8?B?aFphVTI3c1RJWXNZeUxuNzUrTC9iekVTNTUyVTUyRHlGUXNmWENDMlpMSnZS?=
 =?utf-8?B?V0p0MVMxVWJYTHU3Q2NWNzdCQWYxbVp4YW9OWk04OUpDNnJuTHJxWDJkcnM3?=
 =?utf-8?B?SDhFMWZIM0I1azdaOEs4WThXdUxjYitibzZxcWN0K0t2QkJ3OTBNd2FUWjVu?=
 =?utf-8?B?aHlNRmpQR08xZ2V0cExXYWRqYzVwNjd0V3kzeXk1QlFGSWVvV0RZeml2NE92?=
 =?utf-8?B?bG9UZmVGSEtPUzUxVzU5cjNRbkJRbGxuT0lsTnhmWWhsaTIvR2dOcjlsdlRN?=
 =?utf-8?B?RHI4RllKYjBjY0xjYmR1OXJtaW5RcUVlK1E5d2MwN0xNRXVIaEtSempzMVdj?=
 =?utf-8?B?TkdneFc1elE5eThpQUJHOXkxQklXcVNINzE0QmVhRitITlE2OGNSOE1hRzVj?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FdtnNdWg6zezJOeThuKwYahjiLfw4DWfMv5UC2MQjpW69N6DNeNzPEXL/fTbUGS2l0K5cIeTnPaYzB/gvuVdSY0yLv40ea4wRuAPU4fPtUr+7iPMdGe1XrRSSsKlFZqTht2wgPR341ZGEhVXC3GcdPaVUPIi6oA68jjUS+u7i902+l61IYN4nDXD11fXCqsts7qHP+PdlnRh9wT5Qv2jWxfY1b49RIvhCyaOhg+zyOr1q0/VB92qPj5photRKSE6VXXLw0XMYsFmj554ugW/ttNQJLGHWF0/rRFRQH6zWel/D6IiHos73soY76jyvhNYCoG35bX1nzaC3J52tdjHFXZFxn7N0zv4SSirebrn65uLsrrpnetuCaSaOwlCKAE1zNrV8sX7DB/cFsrstOjTeLK9wWd2kzHhf3E360HdlzD/e/YtFtKWKxQBLfKcOpCCBm7fQXkjx1UNGl6jcMuPgV9tjpuQe1MW3CyK9BiUXPkvjQSUF38Ipai5DgOJoF9cNjYcWw+kmqauJYTU8x3Y0Aeoa/Cj97NquCdbluJ4cDNYwGdXKi5ExQUmTn896KA1g7ZKEfTjL+J8LmGXJ6LzkDcnAsIxX1BgzHj++ZT2x4q6ZVhiIruZ7qSDgljsRvEQ9XvQWmGHYj0roYVShuuV4Vt/fZsMWnQPHcA+JkS5kkKdP9lv8TCNWL8sCkisP0zqLO2FqwGuxHtTD5e0d8NvASDjBwBYd3s8ms04FuhOHugJ0E1yMJeED4sbBjxUWqXXPjyuuKTXMtUBroDtT2ILEVq55A3byy0MnmhHlea5TfS+cgdGYxggnnwaXujQZc8p
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47aa3ea7-7ac4-4e09-029e-08db2ba473b0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:42:32.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1XX0xHduGmQ4eJVDIwlhSgm3SWtfqLWFJvMpFXmf9Lb7nRd+/noSn9UQ8FZsACDGWVMq21pV+pZHQx667FUcqPiardwMZ0dvOxF3mWHdpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6382

On 22/03/2023 9:34 am, Jan Beulich wrote:
> XEN_DOMCTL_CDF_oos_off is forced set for PV domains, so the logic can't
> ever be engaged for them. Conditionalize respective fields and remove
> the respective bit from SHADOW_OPTIMIZATIONS when !HVM. As a result the
> SH_type_oos_snapshot constant can disappear altogether in that case, and
> a couple of #ifdef-s can also be dropped/combined.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

