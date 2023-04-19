Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204FC6E82DC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 22:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523814.814229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppEh9-0004la-Sw; Wed, 19 Apr 2023 20:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523814.814229; Wed, 19 Apr 2023 20:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppEh9-0004it-Q4; Wed, 19 Apr 2023 20:46:27 +0000
Received: by outflank-mailman (input) for mailman id 523814;
 Wed, 19 Apr 2023 20:46:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ppEh8-0004in-O1
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 20:46:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1ce108-def3-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 22:46:23 +0200 (CEST)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 16:46:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6000.namprd03.prod.outlook.com (2603:10b6:5:38b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 20:46:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 20:46:15 +0000
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
X-Inumbo-ID: 3e1ce108-def3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681937183;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c77FjfaBuZdj5rwIN+hqJQqXOUBWPnGOnHHzw1Z7E5M=;
  b=UOwLwi4dvCf+SHxLEELUhskc9XHf2Fcoscb1Q5+AcFC/VetnnxNKwE4U
   eRZm7qVfDyn39iydzHBlfJ0akbFvuKzJJ+XjNyyDUnAoLsdW2DxaMKjUe
   U347kBy9gYEyNU5VLg9zZRVumKQtWkD5qtXPe5VmDtF0TenMgXQiDFMsV
   U=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 105502908
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:22t8aaBARMG6chVW/xHiw5YqxClBgxIJ4kV8jS/XYbTApGhx0j1Sz
 GQWWGuBMv3eN2byLdlwaduwoR9U65TRy9dnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw/t0pC35St
 twiBjkAVTmS2uWznLuRc7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrvgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37eSwHuhCdpCfFG+3vtPuFms2jNCNDgbFgKrgKKiiFKDYesKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaOiULLGlEeS4NSyME5cXupMc4iRenczp4OKu8j9mwHC6qx
 TmP9XI6n+9L0ZNN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:aM6fta+7/ZzpYYuS50Buk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:W7BsBm5ZrZbT+RmZodss8HVKEN85MV3n4n7dGGapVGFsFLS/cArF
X-Talos-MUID: =?us-ascii?q?9a23=3A7/ul7Q1dABJXVqpF099ub2b40DUj5oGWDH8RzsQ?=
 =?us-ascii?q?6nsTHbDxRYCyfkAmNe9py?=
X-IronPort-AV: E=Sophos;i="5.99,210,1677560400"; 
   d="scan'208";a="105502908"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7CqOKPamWW7vVBs/lOrg1I9DiBJcNgBJxqCG0qMGMA5tk7Ja4eeK+6tRogxPXL+gYp1L1wJvSYqMISSS5naIsShBenMeZdXQcMZRn/638jTlqBEsRnpyhWYYl9mIj86V3oqtcouSiSh0Tmg+0LZ9c0bdCj1gN9WHZvrMoc8yttx/1r+Huuxt+p7yJFfPvr+bH9r0joRQqz0orGuzgi5oaeqYYk+wNxcx1WysitgGNI7nY/+YaKqL/LyXalRI3lh3PZ0y1IJqzxxwVnVMdgKwa7REtl/5lzTJXbF5Bzp0KevZ3OSPGB6l9BcfJa11aR0T11mHftJvGfu/Q5bVlHJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c77FjfaBuZdj5rwIN+hqJQqXOUBWPnGOnHHzw1Z7E5M=;
 b=PJGCRYG02Xe0nws0qk0sZgKO3jlBt12NnhVLHYBOmX1t8aUg5ct7VzWhpjQV4XWKnAQnQgCYZb4ZiM/9acbkLJuw9Iiiup/NklemL7ZpDC+mSclopiigpcEeVZVI89TsItS6I/MSWAsAok6QNGiKYSPIpBFbqE/9YM7IgGD+ciYuvqtzvHc2Hpgybfl68Kc4R6KXYPum4jyQxvo6reCXRlJSFsR9Pc96cv0hRJjOOikrHUfFG0Q/DvOX2UL4hdInn8eGCJIe9WN+uWGvzUwUtgPzyVZ+09IcdIvUfLGqMqLw9DaQgOwzKjUlv4AhvO+HlyOKSv36hJzOok74sfoSTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c77FjfaBuZdj5rwIN+hqJQqXOUBWPnGOnHHzw1Z7E5M=;
 b=wnaCrMdgwprr+Punak4Th2DHDCwixPaReXXY6hiTBBT1sAMBRVI8+iwvWkWtfu688ToNUx7+JWfXjLWLlAq1CRqXYXMZd8TfrTLPd4sb/2kCRdservqlGQriXdXff2VEFB7t+iKeYQYA5N+KgBiG5SZ6l7Bc6vWlzmRKQpnZDTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <583d3f63-c3b3-dc73-6ca9-0ab5c60b26d8@citrix.com>
Date: Wed, 19 Apr 2023 21:46:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/5] VT-d: restrict iommu_flush_all() to cache writeback
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <d07ee286-52f2-c7ec-2d0d-1c343dbc78be@suse.com>
In-Reply-To: <d07ee286-52f2-c7ec-2d0d-1c343dbc78be@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: fe293934-89f6-4245-81a7-08db41171dfd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zTwVFPuDuzBy6o88rlRBDw9Z88fHfI1USD7/TE9DL4aMP6hNnE0wdSc0anDdKkmwrCX1Ge9UsOBaG78njul+mUy7mNY+y0GU/sYLw69KRbITFgPOruCd/RmqnMVmdxn+6wzXZb4ulTCspk2uUMSZ4ANDwGTeyuVwvnmumbUyjY7KisLBycS51XRrhTqIpu8UNoraxd+tIsOflgO7ob/fkEJoqU3TBc7VfEXssWT5GIyG6GU+0umEMaaHcrnOLtjMkpwLq7vbO8MITFibrENEpcZf5U+3XI0ECWHdcnzL2vso7v7ZY0e2R4P6kc28HQFYZTsWTt51lNOUYERdGK/Cfq8gMldoTIpO6umB2fo9mBzL5MK4uUFWgV7hPeCmbbt5uz6FWOzcJPID5TBLZqmdPDh7UWvud3bOz1AhjnXRgDTsmU7yMQosCcgys7LLghFdLrkJpEJzL238Aom27xcD0S8zb9GkkU19Ra8u+aDVbVOG8+cqqPiloZIKsVxvTpnegYqhjDBIgcy8I75jIBap3/fmkux3n/nDaGHHsquRhK0JrrYG3iFTS2yVZFozm7hNUb/nHe9MJYRgh/xoCX5tSuQmx2avTKaCUfC9La4dXvbcTZ/b3FCfnEhjHxWxvxIXphwsPepZQVDF6FAMog7e7Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(316002)(41300700001)(4326008)(66946007)(66476007)(66556008)(478600001)(110136005)(82960400001)(54906003)(8936002)(8676002)(5660300002)(38100700002)(6486002)(186003)(53546011)(83380400001)(2616005)(6666004)(6512007)(26005)(6506007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejNoNFdVcmFPcEhqUW4vR0ZTdHFtOXBtMDZrY3RKZjM1Tzh5dW5pL25WUHd6?=
 =?utf-8?B?Uyt4UURLNjhMUEFMditsWEU2dldIMktGT0liRHMvcU4wQll2TVRsK20yR2R1?=
 =?utf-8?B?UXBDSmlUTUlwdlBXcWNhdVZzY1VtT0VtbVFRL3RrK0t6SFNIZFhZYW1LYVV5?=
 =?utf-8?B?NXpHUmY2dHNRazJJdE1NeVFvYWQ1bUl4Tk1lYXkxL0svM2MzNGtjcGtGVVEw?=
 =?utf-8?B?WTBoVE5FWU5KQVFUSmliMXczdDBYV2huK2YxTSs4R2NxN1hIVW5KMXJuWGhO?=
 =?utf-8?B?VHBOL0h0RnlORFlRZlVNUFJnNlVYUXhYR25BZFV3U2E5Ri9Pa3EzVmhKejJK?=
 =?utf-8?B?K0NjR0ZvQytURUlxc1pXYXRmQWRHYjdBdXdlVHB2T2VnVCtja29qYmx3cE1F?=
 =?utf-8?B?RVAzWVp3di8wcGdNTnVEaDhlb0xvT3NRL29CaFRMNmNNbjRabFlrSDNLbjV1?=
 =?utf-8?B?a3k0c2w2NEkvdlRLRGFob2tiN051L0NIYzB5WEY3NHFlRUJVUFJGSjR4ZGpR?=
 =?utf-8?B?UHVLc1dON2JsMDZZV1NwODJBQ1NkZEppa3NGMXd4NklJclU1NXc1c2g1T2p1?=
 =?utf-8?B?NXlLSmt5VXZqeTdTZ3R2ZzAyNzBKZE50RzVRalBlWFhWSHFDbkdWYzdiZ1Rx?=
 =?utf-8?B?UGRzSktPemJyeDhtRFdYeHdxbDJ4am14MmNSVzhVLzBaRkh1QzQ2c2F5WFJY?=
 =?utf-8?B?bkxldmFwUXk4ZlNQbzhJRFNPbHlLNFNBdnlJMFIzbWFaMVhYZU9wOXBNYnBk?=
 =?utf-8?B?OWcwcTVSUFM3MlR2V2gxZVJKOGF3N0JqMWhrd2c4UHVSTG5teFBkYTJKYThq?=
 =?utf-8?B?dXBJNWdwVUw1VEwxcmtHdDNGZE4rUWlPTHVWWUxWVldKMDBQWXhyQ2I0WW93?=
 =?utf-8?B?b0ZZQUkwRGRzcUZPZkRtd255QmJGQi94amx5TXRBMWZKWHlOUlBQQVVIakgr?=
 =?utf-8?B?ekpCbjluQWFYa2V2eHJReWFXbWMycVQrVXlkVXV2SnR0V1hjWDVPRlhIdVh6?=
 =?utf-8?B?cythaGhUckZtNnpEZzFUOUtXNXhHVUpSNmNiS2JxK0RvUm9CMUdCVG5jeWhr?=
 =?utf-8?B?aEdTWWE4Y252eVI2UE1WT3pSeXcwRWJ1WFNvQWd1MUYyaUZlRW1ydEVvQXVj?=
 =?utf-8?B?blN0UXBjUkNCTThPZ005bkdsSmZzY3BKbG5GeE04VWdncHZNd3BQUFAzL05t?=
 =?utf-8?B?Rlo2UHFXdURUc3ZmWEhEcmt0eDJZOTNNOXdURHh2NXJqRXhHZTNIRGtmV25K?=
 =?utf-8?B?c2FmMTgxTThRcVpjcldaRXVGakhZVERoSHFUUDlTVDFHMU9nR1dDdkFtejE3?=
 =?utf-8?B?aVdMYzl4cGI0eHFvSXZxM25LeGhza2taZk5RUXdVVlpzMjFKQlFMOHRuNHFW?=
 =?utf-8?B?NmRnak1vR1RoY29WZXNTcDZmdDdScWx1Nm1DUHVzQ3ZQZDJRMHIyZWVSOVZk?=
 =?utf-8?B?Z0kvK3l1QXRFY3ljUlBmTnBEQ1czcmk0VDd1dW5Ub1FyampEWWNmSnpNSHUx?=
 =?utf-8?B?MDdZeGZNR05LNWlqOStRMERpNnRwbkR5UVJ5SFo5ZWZJTjJCcFJLbnRQUytW?=
 =?utf-8?B?S2VySDR4TXRueGduVDlHWW1yNGpnVWgyL1lDZnF4Z3BhcTVTU0Q4UTR4S3N2?=
 =?utf-8?B?dVVONzB2cWt2Zkh0cXVmZURkWi81T1JOdngzUnBteXlvUHRDRTA2bmY5MnEy?=
 =?utf-8?B?UVFneUlaaUJEL3NvWnZTViswblUwZTJtSS9DbFM0QmF6RjhLbW1NQjExTWdq?=
 =?utf-8?B?TkpGb3N0bGFnTitTWThCZ2dMTzVYeVBxUDFueG02cXpxN1IvNU5jNCtCdzN4?=
 =?utf-8?B?bEV5VHdPdGYrdkQzai8zQ3BSVU5uL0x3dEMyVjZCOGt1VzJrRXhtOC9reld1?=
 =?utf-8?B?bEJFQUllaWdqL05oaDNIb01nbVM5UmVUaTFFZ21DekI2OE1iWnoxN0VwbjBq?=
 =?utf-8?B?NDlpT2NXRENnN3pIcEtmRUNXOUxGMTZuMmEySGg3Z3R1NmltZ2h3bEQ1Yk1w?=
 =?utf-8?B?SjcxRGp5M0NycnJ4eGFLSXo2ZDhvV0lsRDJ2aTFtNkJCM2NueHRUWExmMkR6?=
 =?utf-8?B?MVFSVlhtbzFHRGlhWUNJWHRqWHptZnZKQ2FBdFNZOHMybkhzMWptOFBPQVZB?=
 =?utf-8?B?S2QxTHYvQzQ5QlNGTEh4OTVMZUUxRDdDY1BuL1JEQTVlb3JPY3ZpdHBUOHZU?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c/am04pME+HGZeXjhaJyFCdC6z1rnjTRCN0hEnfKTWivMJ6krcs26yRhYn2t9w2N7p5c2oklu91ND8zeWOuC0wPaq8KGNTDRy4AW1Akgr1PQfSAbpCBYfdJGKluViTKWVjzCv+DKcWGfQry7xjbO3DoMHXpSFRxSxE6WE5jL5ClLI1OY9NRtPJ/hpGU6fnoxryIt0SOQ5EGJXBF32OlzpoikD6bnlftlSw+3/Td1ZrH8TX/floZ3oOIN5u1+HSqQQcUsYGMytmp2/nCJ0AsXtgiS/l5iLbPziC/dI4IA/mhEo56sDjNuyECjyGijXTT7BpN4KofNVee1pyhvXbmquggOqID8jTO1YYm98Uf/2vE6iul4LR81j3YctNQN4sAPM4kDo492UA1js7ovrplG3s53ZnBHDRJeZD82K4ByHoj008GsNNIdeKl4XJG8pd/q/ipYYLE3EbGEqVEjicD+ck7MbnjFLhbQYv4LbNGNUzbnLVQOazZ7CEkyXRTVRaKdGH9btM7tBwzPguHB2UVsWX5zAoRX6iwXRQiN/6i4u/LMZkXdhC/+XlVEV+1pZfVvOCmPxZKd7E0pC3kCrJ2jFJvG1wfSbrei8ZQBABKTGjflN+fW/lhkn9tAHfSs0AP4hA9UgJIdQxaBq86TT7hDmS/OwHl4N2cL80HJbZAL7lGE0Pj5anPSI6DtgVgxu+ZD5DUBNbBb3k7r6oQ7oo/j3XuxsnqPtK6vMRlPWTLtACjtJxaSpUFF137yldWiklw4fq1hTf0qU2rLtSr08IQj4E7DNesYktDcrs892cM+Sr8QYmtmfwASyX7MNbqKB0MZB62neVHi4Ac7NW24ldvuZV6m9N5/pv1ypfLJEkNcGw4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe293934-89f6-4245-81a7-08db41171dfd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:46:15.1039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6EGG6VfLDx71TbhRM707mYdgbrOb8MXRoc4zv5m+czm4uKIaY9WSIowSZEJEfHNCImaAwUgAE4PBrqIP9ho20M3/XoI6F//IT7q5QN8fqfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6000

On 19/04/2023 11:46 am, Jan Beulich wrote:
> We don't need to invalidate caches here; all we're after is that earlier
> writes have made it to main memory (and aiui even that just in case).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> This, aiui, being an analogue to uses of iommu_sync_cache() (just not
> range restricted), I wonder whether it shouldn't be conditional upon
> iommu_non_coherent. Then again I'm vaguely under the impression that
> we had been here before, possibly even as far as questioning the need
> for this call altogether.

I'd far rather we fix it property than continue to massage around the
sides of known-broken logic.

Coherency, or not, of the memory accesses of an IOMMU is a per-IOMMU
property, not a system-wide property.  What the iommu_non_coherent
global boolean currently does for us is enforce cache maintenance on all
IOMMUs, even the coherent ones, when any single IOMMU in the system is
non-coherent.

Inside the IOMMU driver, cache maintenance should depend on iommu->ecap
alone, disregarding anything else.  This will improve the performance on
any system with mixed coherent and non-coherent IOMMUs, without any
other behavioural impact.

The complication comes in in p2m-ept when we're sharing EPT and IOMMU
pagetables, because the EPT can be accessed by more than one IOMMU if
the guest has devices behind different IOMMUs.

But we know the devices assigned to the domain.  They're almost always
static for the lifetime of the domain, and generally single device only,
so there may be value in considering a per-domain "I've got a
non-coherent IOMMU" flag, because we absolutely don't want to be walking
the list of attached IOMMUs on each EPT update.


But...

SandyBridge era systems are the only ones I'm aware of where the IOMMUs
advertise themselves as non-coherent.  And on that generation we quirk
the superpage capability off anyway, meaning they are ineligible for
HAP-PT sharing anyway.

And if we are doing HAP-PT sharing, the cache maintenance for regular
EPT updates will be crippling for CPU performance, especially as the
software bit updates are not relevant to the IOMMU anyway.

A better option would be to simply disallow HAP-PT sharing when there's
a non-coherent IOMMU in the system, or (slightly more fine grained) to
disallow adding a device behind a non-coherent IOMMU to a domain using
HAP-PT sharing (as there's a disable now anyway).

Either will reduce the complexity of Xen's code without any loss of
functionality in real systems AFAICT.

~Andrew

