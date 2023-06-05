Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B186972226F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 11:45:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543600.848706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66m2-0004u7-R5; Mon, 05 Jun 2023 09:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543600.848706; Mon, 05 Jun 2023 09:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66m2-0004rD-NQ; Mon, 05 Jun 2023 09:45:14 +0000
Received: by outflank-mailman (input) for mailman id 543600;
 Mon, 05 Jun 2023 09:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q66m0-0004r7-Pz
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 09:45:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8342af6-0385-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 11:45:10 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 05:45:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6168.namprd03.prod.outlook.com (2603:10b6:208:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 09:45:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:45:00 +0000
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
X-Inumbo-ID: a8342af6-0385-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685958309;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i1dY2BHhdFND+CUb0685lS0oelmUAvt580AH0TX4nr8=;
  b=IpUKvV5JVII1y/+dXEpF2KAladxbcQMOsFJY2cLRLl6gTjcGKsxl40Kz
   pktTb7zsEKwm7OZ9VTk+k+Pzh4RkHdv/LBL8vb/u9sGPxh8Z+BPVw2QbO
   Vg8qDt9907Pzl+7aLWFUHFx6FcY6ouQQ8xqYCX7FotmaTzDAZsH0GMuYf
   M=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 110924482
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5gGbl6uwm/vrPvXRXAairEbizOfnVHRfMUV32f8akzHdYApBsoF/q
 tZmKWiOOKzbM2OgeN53O4Ti/EtVucSBy4djHgo9rngyFy1E+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLiwKXhScpfKN2L/rQ7J0j9t5BsCxM9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTgp6Q23A3JroAVID8WTmaf8cOnsEe/R+lBC
 28IxQB2hrdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ2kUjJR9M6Sqqt1IWpQ3f33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:KUuhI644CRovCZE0AgPXwNnXdLJyesId70hD6qkRc3Fom6mj/K
 qTdZsgpHzJYUkqKRMdcLy7VpVoIkmxyXcW2+ks1N6ZNWHbUQCTQ72Kg7GC/9ToIVyaytJg
X-Talos-CUID: 9a23:EvyJBW6zzuPAaEtxPtss8lITKsQ6UG3m1HqAKhSgAHkzYrTPRgrF
X-Talos-MUID: 9a23:BM3+KAhKjfwwCjgTIri3CcMpFsdz3oD+Ml43mJQagNekFjBPEW+2k2Hi
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110924482"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMPkIk80GbhJ0xAzgsvo1lcQD/B0xuyzCwdk2MY/92zeaTzx/UeHdJuYATL0Wt2xzgYc6AbdKkcy1jpjqiCaXmy8mqp5aUPNItwys5oW84bFpV2W7k3eR7BVZ9EnZDW30sNVHoX7BKZ8N7ZwSNcHgP7bN3DgI6cyGtQVXbeWcCFOhIGko9Tpci2m9lZE4MPhHiDnOvSMl28Mtc0GYjgvlWf8cEObvOxNhWy5mbOr7y387+3l5Ab4tY0G/7HvxsEdTotLsglYuGhIP59hxpzA8aWfmJyO7bMWX5KNTdg19KP+QlF1gXCIw0WTe7s+13ltT/3D88qmAuzTejuk2Uw7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZFhjJ94MduzYbvSDfym6L0MT302ZcddJCGocZcMwSA=;
 b=MQzfyWDrI2OLQtXOz9Ft6wXSKzbCscU5zEXq3swtoY5RlVMPtngzBvBaEDaLgpR+AZdMRMNk2MGaGf8rlHK2trHY/hcO59YeQivFe81LQyO2jG47coNuc/jFy6MhkY1p6DPkTWKX9TUFjSmZ7IeNELdfcNxSNEib7Sv6T3R382hJ9myCVxkiGUZJZcF8t7Prex2a652+V/943P0qhPCdx00gQUA9YYlz1RJvfLGkFTFpH172vZKSpz/MbVlUj6dBdNgjmnq14+/TcwtORIqW17iHTQxlxaY5TY2NoJscCO9YRwjUzExnSM968Y+aIRChKL5co7+IUrdfj3BQ5G0+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZFhjJ94MduzYbvSDfym6L0MT302ZcddJCGocZcMwSA=;
 b=KAhRURMNI19waWc6NvzIlwKOQCsKEdTY2kDii9GXyj83N4ROvbP2QR0Db8gfQ4FXb5P/SYhOrznPDP+A5/mz0K4aK+2uWdf/Xbc5QYAUrq41QDE8cxsegCzKVFjt6wHGbT/77YvqXnkY2wuoolLuGa3QL1NBG+hJN2gxZYCJIzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a1c0da3d-066f-a863-7133-d5bc45e4cd7d@citrix.com>
Date: Mon, 5 Jun 2023 10:44:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/spec-ctrl: Fix up the RSBA/RRSBA bits as
 appropriate
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-3-andrew.cooper3@citrix.com>
 <36b016e2-b378-f97c-42da-86a330471bf0@suse.com>
 <b7f848ed-5336-b3f4-3011-da10bc335d5b@citrix.com>
 <9783e91e-9d13-6b20-d985-0beb535c7fba@suse.com>
 <150d8499-6aed-c81a-1204-d48a4a32b8aa@suse.com>
In-Reply-To: <150d8499-6aed-c81a-1204-d48a4a32b8aa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0414.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 721c4c41-fb5d-446f-0c3a-08db65a9876f
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P/LwP9zrBUqVsAwelZmBOgEC02iOwbGr1hqG47iZ9Jb2LddDCjPAecON2vscycmJuZodV5fgmcpouEKboC4mq3zlbnJwnLjiBeIGV2Sftj75Y0VkUw8h/wDaAaLdGswjNz5EnSzq1ZqwrCQ3th/WSMU/IDfVSw1Le0BLvRFSC2CCrp9Ra5dluXEsjcWP6vE7wlSLwbafQtEBF8vfNzgk+89UIvFFU4W/MqfN5HUyy8Xb7P0z8x27Oxp4IltjtouyqZo0CFAmQEFIFa/7L3w3h5P4a5cw46XLf1UWUDS6BdRvySnKl0zehLn1kRW/eB6X36+OIByfkfn+i1rXswNxrDDEL9CMqo3CCfmbm7m5oIWQnLNyMxV3SRig70DT1OxR3i5RXSmT7bg5w20fzvKIGdqoDUdZVHlC5oI9A6f7G8tj1pIGcjNvrUujllRumO2CVfF0MDwTl8twglAd+ez7KJbEO1D/klU6tELdY4RMQWyVomlU1U3LQH4409Q0LqrRTNM6GSOCbHLXrrGrOZDKqF4q6LICsCD0TUB+niDIKOZ9GnQT3RzYjuHjm1d8C2/IiFdDajdQ/fEg1j98B5KylXZpJ+StJObiqhfBdA14YnziPdXI5JmjthKcRQjUMnJjmWhU95asg8fAGqg7zBjDXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(54906003)(478600001)(5660300002)(8936002)(8676002)(36756003)(2906002)(86362001)(31696002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(82960400001)(38100700002)(41300700001)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(83380400001)(6486002)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3BYbHdCVFdnalhzc1NJMzAxdjZKc0pjVlBERU51ekZPdlV2eDNzaFdLR2Zk?=
 =?utf-8?B?UXY0aGxEdmFMTFc2RnVNdW5oRmExaTNaWENCNHNSRVgwRDZuMjRtSktuUERP?=
 =?utf-8?B?WWN6NHhIRExOY1NEL3phcFdhMWMxR0ZIY1Z0R1R5Z1JLcWNoQnp4NzI5NkhH?=
 =?utf-8?B?SHdqZzVYdm5Vb0RiUG1sZXJTQXNKeXNhRk9oV2Z4QnZvNllWcU5pemZNdTZl?=
 =?utf-8?B?dms0UENyTXIva0N3TmU1WjRFdEQ2NXlTTDFjQ3VVT0VmZDdWNWtaWHRoclJF?=
 =?utf-8?B?NXdrTEhOMnpqVFhqc25BamwwbWVlWU9rM001RzBDZHhNQnU5T2k4VDdWUkxE?=
 =?utf-8?B?Y1JNS3lWRm1CY2syaVU3cjFzc05Kc1FwOEM5czhJYzBPRXpYdXoyUGZxbGlB?=
 =?utf-8?B?WGZoM3NZM012UGxORExHM1hOeGdSbFNhaCsxWmhJcC9HMHBXcHM0UFFpNUZT?=
 =?utf-8?B?UytTTFJHb0MxSmV3NkkyVzlzZUY3MjBoQlA4QjhiL0QxOW4yYzJ2L21GQ0VJ?=
 =?utf-8?B?SmUvM2ZLbCtScmdGYThiL0NveGlrbTBQK0ZJL0RFR01TT1NTdjdsQmwwbVJT?=
 =?utf-8?B?aVV6UXJvSU5adUo1VWJjRTFGL0g5d1BtME9GZTdxVTdRbElUNFpTdTA5NmY1?=
 =?utf-8?B?TGVFbWRQUGVlNGdLbGgvdXduQS9tdjIrMDBJcEtTeU9md0YxQVBPYUw0Q0N2?=
 =?utf-8?B?c1VSSFFzYlZCcDUwNVU0OC9aa3I4WHhnb3dCVS9MWWUwVE9JNk5LcjhzUlEw?=
 =?utf-8?B?UEZ0RkppUzJ4ek1QTWRQMDgrS0pGVGFkZ0FxNlprUHVOak5taUFkS3J0Y3Fm?=
 =?utf-8?B?WXp1aXBORndTWXd1WXo5cXo0cjFxRmtucU5BekRCUXVjRFhBSi94NVpYT25L?=
 =?utf-8?B?bzRieXozYzRETGtnUVB1VzdEWUZSVEY3ZGJVaFZSU0dTVXNtOEZJNFU3N3Zh?=
 =?utf-8?B?REJOVHZZZjdzM2g1bjIrcVNDMm15QWxDZSs4QTMrZk5XZEEzWmc5TGlhVzJI?=
 =?utf-8?B?aDRHcVFGRVU0dXhPREdRc25LOXhYZUtXT3Q3OGdESnNFUHZod1pKNjNSWGR6?=
 =?utf-8?B?cmphdExCSSs2SzBEekk3WEdtNk82QXhBWVhjZFZtWHNuS0NzbVRXSmhaSlJu?=
 =?utf-8?B?cVBJblQxR0ZnUmRuUUV3Si9NOTNkUkkxRld3RUxGMUozb2pXZ3diWXJDbmlF?=
 =?utf-8?B?RTdQV0k0NnRKcjNrOHlvYWVNYVoxUzBZZHowSFUwODdvcjRBVG1tTlJrQ0M3?=
 =?utf-8?B?OWtVUzI0ME1mQWRpa29sV0FvTUVCdUVEWkEvczZTMFJEVmtpVGdkSHVaNGo0?=
 =?utf-8?B?U05qYlBXMFRKdFBLTWRPWGw2cFRqK0xwUEJHOHdGamhQY1I5bW9qNGZLRTMw?=
 =?utf-8?B?aUlBNVJpaGVHQzVFbkJ3QkxsR0g3RmFqNm1LQ1FoRkgwYmxiNFArY2FSazhZ?=
 =?utf-8?B?NE5YMVZMbVZMbjhxdFUxajF5dE1nNGxjZHNINkVaL3dYcWU4M0xzdDdlbklT?=
 =?utf-8?B?VWtOL083YWhUWUN4RFBUU2JYRHVqRWxIY3o1MS9oek9VRGhmSWszNmI4eVRI?=
 =?utf-8?B?cXlOVWE5UHlBL1BZV1pQWWxTUzlrSGgyem5vVHJZa2FYcmR5cWRWd011ZjZi?=
 =?utf-8?B?U09zRitabWoxSDFrdFNOR1J3TnVkaEtCbUhrQjlyc25nNm1ScHVGZzVqV0hZ?=
 =?utf-8?B?YnE1eVB3L2djeE9jZ1M0bWtqWDRLNXVOUXl3b01qb3hDVlEvSEl1MzE5OTFy?=
 =?utf-8?B?MlhvejZiTEk1V0tTeDRjZU1MVVU1UG9ablJjdjVYdTZDUWxpRk5DZDJ2M2xK?=
 =?utf-8?B?VmN1cTl2aHB5M0oyV3dla2FReEdRLzIvM1I3a2s1SENVVjdIaitybWc1Qkd1?=
 =?utf-8?B?S2FSdWNxWTlVLzJsS0JLZzBjYUc0WXczd0lGSm5HZEJHaDlCRUp5eis5Q2dt?=
 =?utf-8?B?OVhzWnZPYlhYbHJ1THhXK3g5dzM4NEJKT3JTQlkvQjlRSTRZb3J4b1crN01Q?=
 =?utf-8?B?dW9ManpUUzhYaG5GSm15Zmg0T2NsV1RHZm9QK1Q3d3FPQTJQTjl5TlZLZkZr?=
 =?utf-8?B?eTJaRXdlREc3UTBPb3Q1aVlFbUZSSmYzVEtYMFd2bDJuOC8yL3BRc3dSQno3?=
 =?utf-8?B?Q0RBclp0amhCcTQrMG1kZEE4RTVmcE0xU0NNbmNEelF2c1VnT2k2VmlMNmlo?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ou/MwujozvLmEAEgSUs3kclEUWLJjPK5k4bDZHyQEEn0NLsRpgEjM5NR7sP8KTgpC3k5e0c/VtL1LUFXUP+q0k54vrj35MQhTSBiTJT1SMPZHdhIrYTnWUrKyU7GCPYG8j6YYG6Vv0FNvBZMhMk0nDstmh0yhBNuov9+Sz+6noOZWoP8EjjSBO06CPgsy91K2U/5a2O7PnplQYFZuBvQ6wvh0d+xojrvEY7lSlty3guFPvbwjT04jOwNvnEUx7E6DtGyb/48td67VBvzfoMxMEaROUyoRTdQz8+uiBcjPdU4X32QbqbCYs4ZHTKcAp77jEsTV7IY1KkR/vzjap/lB6jIndpz6TLu07tZzMIRh2kLMjUpsK2M//niFXArO5DqUtCVVsVMh9HGsxXdoW0zl3JCCYtaKAEqqBSUNb9yBZtKZc40x42RHq01bgGM3Gj/FUnYdsZQ1636yDMC39TUWd9g22hqDp+Xp1AdahV16adeGr30lwo3W+z7OOYsxn4EZEwZ4ViIeye5cSfkg/5/UX2JQHqDM6esABbOFhSlb1BDMJTvnL6rU4usC4mZqhPLnciKnGFjnVdo2F5dZpCi4RFT2ro71OOSJwZ3wv7OBOMJ1IusxyWd56tFIWJDPsc2hOtrhmuv/d75rAd4jky2czYEvBpDWpupHhkKaNApXoJ3fXCOWp131+7A+tnhCnDpJGfBo1DDDlXMjfHFXN5VrBYHh/cC/rY+Wl/tS5y8Rq/3nSt2GoBognKZOgKEhtdZ2/E+BOyl36Y8fY/x1W8K3JfHyyBsdPc6ZJTQX6GklfmdrgGS1Qz9YPtiMw2AmUA4
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 721c4c41-fb5d-446f-0c3a-08db65a9876f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 09:45:00.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajN+pj9Nh8XGaAdqVp7X3BxBzmZzi70DttNHZp7FucTIyzzbB8y3T5WpzC86D6uxkb+AMLbxmQXBj16D1iRkuH7g5y+TU4vFJJTlXtM49BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6168

On 05/06/2023 8:50 am, Jan Beulich wrote:
> On 05.06.2023 09:48, Jan Beulich wrote:
>> On 02.06.2023 15:57, Andrew Cooper wrote:
>>> On 02/06/2023 10:56 am, Jan Beulich wrote:
>>>> On 01.06.2023 16:48, Andrew Cooper wrote:
>>>>> @@ -593,15 +596,85 @@ static bool __init retpoline_calculations(void)
>>>>>          return false;
>>>>>  
>>>>>      /*
>>>>> -     * RSBA may be set by a hypervisor to indicate that we may move to a
>>>>> -     * processor which isn't retpoline-safe.
>>>>> +     * The meaning of the RSBA and RRSBA bits have evolved over time.  The
>>>>> +     * agreed upon meaning at the time of writing (May 2023) is thus:
>>>>> +     *
>>>>> +     * - RSBA (RSB Alternative) means that an RSB may fall back to an
>>>>> +     *   alternative predictor on underflow.  Skylake uarch and later all have
>>>>> +     *   this property.  Broadwell too, when running microcode versions prior
>>>>> +     *   to Jan 2018.
>>>>> +     *
>>>>> +     * - All eIBRS-capable processors suffer RSBA, but eIBRS also introduces
>>>>> +     *   tagging of predictions with the mode in which they were learned.  So
>>>>> +     *   when eIBRS is active, RSBA becomes RRSBA (Restricted RSBA).
>>>>> +     *
>>>>> +     * - CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>> +     *
>>>>> +     * Some parts (Broadwell) are not expected to ever enumerate this
>>>>> +     * behaviour directly.  Other parts have differing enumeration with
>>>>> +     * microcode version.  Fix up Xen's idea, so we can advertise them safely
>>>>> +     * to guests, and so toolstacks can level a VM safety for migration.
>>>>> +     *
>>>>> +     * The following states exist:
>>>>> +     *
>>>>> +     * |   | RSBA | EIBRS | RRSBA | Notes              | Action        |
>>>>> +     * |---+------+-------+-------+--------------------+---------------|
>>>>> +     * | 1 |    0 |     0 |     0 | OK (older parts)   | Maybe +RSBA   |
>>>>> +     * | 2 |    0 |     0 |     1 | Broken             | +RSBA, -RRSBA |
>>>>> +     * | 3 |    0 |     1 |     0 | OK (pre-Aug ucode) | +RRSBA        |
>>>>> +     * | 4 |    0 |     1 |     1 | OK                 |               |
>>>>> +     * | 5 |    1 |     0 |     0 | OK                 |               |
>>>>> +     * | 6 |    1 |     0 |     1 | Broken             | -RRSBA        |
>>>>> +     * | 7 |    1 |     1 |     0 | Broken             | -RSBA, +RRSBA |
>>>>> +     * | 8 |    1 |     1 |     1 | Broken             | -RSBA         |
>>>>>       *
>>>>> +     * However, we doesn't need perfect adherence to the spec.  Identify the
>>>>> +     * broken cases (so we stand a chance of spotting violated assumptions),
>>>>> +     * and fix up Rows 1 and 3 so Xen can use RSBA || RRSBA to identify
>>>>> +     * "alternative predictors potentially in use".
>>>> Considering that it's rows 2, 6, 7, and 8 which are broken, I find this
>>>> comment a little misleading. To me it doesn't become clear whether them
>>>> subsequently being left alone (and merely a log message issued) is
>>>> intentional.
>>> It is intentional.
>>>
>>> I don't know if these combinations exist in practice anywhere or not. 
>>> Intel think they oughtn't to, and it's quite possible that the printk()
>>> is unreachable, but given the complexity and shifting meanings over time
>>> here, I think it would be unwise to simply assume this to be true.
>> I agree.
> Thinking of it - would we perhaps want to go a step further an taint the
> system in such a case? I would then view this as kind of "Xen not
> (security) supported on this hardware." Until we manage to fix (or work
> around) the issue.

'S' for out-of-spec seems like it fits the bill.

In fact, that can also be used for the CET vs MSR_SPEC_CTRL cross-check
at the start of init_speculation_mitigations().

~Andrew

