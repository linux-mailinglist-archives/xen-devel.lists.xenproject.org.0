Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE563722542
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 14:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543687.848863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q691M-0001lE-2x; Mon, 05 Jun 2023 12:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543687.848863; Mon, 05 Jun 2023 12:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q691L-0001iV-W8; Mon, 05 Jun 2023 12:09:11 +0000
Received: by outflank-mailman (input) for mailman id 543687;
 Mon, 05 Jun 2023 12:09:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q691K-0001iP-Uo
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 12:09:10 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c55fbac5-0399-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 14:09:08 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 08:09:01 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV3PR03MB7522.namprd03.prod.outlook.com (2603:10b6:408:19c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 12:08:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 12:08:59 +0000
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
X-Inumbo-ID: c55fbac5-0399-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685966948;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iWJlqnYFbE2hLcngX2fiPPM6Y4Z//SZ+HGL7DlGLxqc=;
  b=hsBprABH00zZtQF3a2c4GqSty0xNDXGwaMg7WZ7yef9QgROLi82+plYO
   cmy8KfGIy829DUva8g9gi1kOdHE3UvszAgf8gcP6pQwjRDBtpjoVAVUk8
   z2juof2EGVyhbVA7GMM64TV8adujlAR7LTaGN93UwziVxJYHLErqRAXUm
   w=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 114114784
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:x9pFPaAJxkwEsxVW/wXiw5YqxClBgxIJ4kV8jS/XYbTApG4l0z0Px
 2QfUWDTPquIZjDzLt0ladzj/U4HvsDSzdI3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwq+x3XExT1
 rsjB2pTdAGovb2XnOOcVbw57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzG7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWwXqiBN1CSNVU8NZJuACJ/2o9NyY9SHqpsL6DqBSCXs5Qf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaBMQOBWoLZCtBQQ5b5dDm+dk3lkiWFo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bzgbQHxZ6s9Lqkc2Q=
IronPort-HdrOrdr: A9a23:3YOcwqhMeo5SnGLd100+tZ6FxXBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AfXxjNmtEZFwP/W9QrWbJkFtv6It0eH2A4WrzZHS?=
 =?us-ascii?q?XUzhzWZavFn7MqYR7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AS3ugcwxc+r9m5dgUlWL6n9iugnWaqIeWVVo0l7s?=
 =?us-ascii?q?5gOKZFD5hfA2/1giyXoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="114114784"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDppl/YUYBR/S4UQm2GJZiPZl4bz10PiguuJdSjeZqiR5fhPEvMMsRPXG1PaqzRh6WmHCrCvUYNOGjIG3XOlJRYwWPFxZ5rzogNd1DVlBx9w/U3bcModnZWoT+UPWTxn/4S5DPqIbExezTdQLrU1QutaDDgHoZsMFwuRsY7EqCXiVRFoUjudJbG7t/LB+KrcKg1eBpn20TzWcMopa5Oz9lkEM+cnAtXBEYiaAwOWqIBnwhyQy7+Kt4flEjH3Q5GejXZNNLOmvL3lkkFSpdwPVAkvb++rFDZ8EntA7KMh2vT1H6z59aN3s7ED6dPnUVffUuR2FpARCxmbWoXsrEdx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWJlqnYFbE2hLcngX2fiPPM6Y4Z//SZ+HGL7DlGLxqc=;
 b=YDiNKGfg4NbYaMddxeEX3Eb5KGXClM3T0gxHyNfp0dGro4IlL/n0b45nwWONiBi1ab0qeAcG8zB9L3x1NxWnr0pnSfrvG0XKSh4k+PfWfRPusuMlIaHUiQ22AEQUMEZMQ9IA+EvHPmvbXDOnYPK2+zCnzcNDBtvHwGxsPWgTwr5w/QfFmvvJmmNp0MZhFulGjHiDrpNGXaELOMPZkjeoWQN0AiCFPfkPrziLOeFRR+YzQ8D2sjdKROse2S9ecqMMBbGsWP3S8FYuHtZGfRo3P65PieX/KP7KGrdQUL09PpvkVZXl9ZA2PSSoxkwMNrsbTEhdWY0A3kyosO0sOyEpbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWJlqnYFbE2hLcngX2fiPPM6Y4Z//SZ+HGL7DlGLxqc=;
 b=eamaGSR79U+WCu0/M046n/G73WjoxxBC+4vntuJtq455hyrQ6sN9t53L4PdasrUELn79fqRcOHJOvmVlPMKVsc4fAQJ+9MBQasfO9nCyUVMJHsqxz5Oy/7knfVQME6mCqASxGLAYAEb5ADbokzz+5+Odu4wdO4X+TCg9codnA1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <677b1b72-f4e2-aed0-7b5d-7859bbdbca51@citrix.com>
Date: Mon, 5 Jun 2023 13:08:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: rework compiler probing in the test harness
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <3ca5b1e3-918f-0369-4368-749bbf363cd3@suse.com>
In-Reply-To: <3ca5b1e3-918f-0369-4368-749bbf363cd3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV3PR03MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: c9ef21e0-0812-45a5-5ef5-08db65bda47c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4T8dHfHTekiW/U984x5fme7KlS0WRKsQrl0b1orHgayzjxJLuea5Z8DsuTrta1IJOJKA9kXbWSpQ67RxeqZC28a+pJoA1HH27C7V3xOFCyyZizI6lGbsdEySuQXNJ1S22Z2X5YJgmPUvqebWQPbfHwFM9Nl1L07R8jiTAXdSBTnFHjIP8qoaoSuNjzZRN7a+4p8lzcUQwrz1lN9GRdtc9ClsDRj+G9IA4X6hWU1b4SRH78N8dqNl2PjRaCGFJlbXRmOZa9b7xQySEa3g9PHmb5NqfenyScPMgnqrU1WE5MqlD8+Rvu+xnANF7TfkUqBD7LzAP7moKdxfjWGPcwS/HQplGd3Zv6HoBUh6zYvMvyWcOhPxFz4Kt+hZ2H962SzYfiOwDc3GW7/gNPq7cbLxo8dRN4MZkRZ4A7+24esoofmwDLh5H/3TbVirThm6piE0SZj1h/KCSFIRAe8sQPkAwgnMrSVkPeKxFKVXrI+9FTxwrFuuCfz6LAZ/BErgmKB7QGfuWV3XN+kwBrbm1uRBUaecZ4/wdga/uATt11XROlwgEN/n3kHZqQaRTwZ7xsI8S8RcSILhYELOLX65zFOB7C2ODSP9TSA1m6GTB79fTF+hs/4UZf/VPDXbdF+dms/kc3k5MaMCRsv2UWKkTlUKGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(82960400001)(110136005)(54906003)(478600001)(8676002)(8936002)(41300700001)(316002)(66946007)(66476007)(66556008)(31696002)(4326008)(5660300002)(38100700002)(86362001)(6486002)(36756003)(6666004)(2906002)(4744005)(31686004)(6506007)(26005)(6512007)(53546011)(107886003)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmpOL2ovS09NZHVWMjV0eFBIYzF1RFR2MlcveVYrdU03dlFQWFZwSkxQQUpq?=
 =?utf-8?B?bTh6eUFsaXU1TGJQYVEvWm9sSDh6QW9XSEYwRkFPZlRVdk5nYnBiK3hPZ3Bk?=
 =?utf-8?B?NGY5TTErTG5aNWdnL3JTdStBRWsycHlZcU9BUEJSdTJ2aFN2Wnd0L3pUTHNO?=
 =?utf-8?B?UEJGdURJWjBpVm9BYmxSbkpDdkIvc1M5ZXpYRGEybnhtdWYzZFNNdEJzeTY1?=
 =?utf-8?B?TlprMlV2Q0Z3NU1sTU03Vi9mSVBiK0tkMnRPOEhHY0hPNWVCUk1ZaTNPdVBX?=
 =?utf-8?B?VjYrTnp1emZkRUJaNDQ4MFloOXpseHBRcGMrcFdQTHMzTEI2M0xZYXlHTTZN?=
 =?utf-8?B?Z0poVHlhZC9LWmJiMXRxVU1oRDlSdFFSWjRtTXE4RGJ2NUh3WXFybUtyaTFO?=
 =?utf-8?B?cFlOM25vQmZxRkpKWC9SeVB4RHVnQVRCQXNubVY5cWYrZWxDQnRXVm1MWmQ3?=
 =?utf-8?B?dzRWVGdVbTlzeDZyMXhkSU4rWnRBMSs0dURzc0F4NUxDSjUyZEpIaWllK0tk?=
 =?utf-8?B?ZGdYTnFHcXl6UldENFRRLzZ0VXBjRGR1SVpjYjMxS1cxQ0t6d1M0dkcrTzEy?=
 =?utf-8?B?V05rUVVFbHhjK0xwMllQVzdxb25IT0ZkYVNMRDJtZm1Cb0UraG5wL1lkOVg0?=
 =?utf-8?B?WFlwMnQyUGtjMUtTTE5nVDFyS002NFFZd1dwc1VJL3hSTUx0RFRxNklab3F5?=
 =?utf-8?B?UklxcGc2dDNEclhnRnFpcEJQSC9FSWovNWdQZU9UMlhIbGl1eDgrNit1aXdm?=
 =?utf-8?B?dXl0ejBXTlFUVWZSMUtVbVUxVE9hUFFWS3V0VW5DNUJzTC9lYkUwMmkycFpG?=
 =?utf-8?B?R1Z1TDhVTjhTZzNQOGRiSGRKNTZHZVhwcng3OHNPQW9IRkZrVDFmUXYzUVYv?=
 =?utf-8?B?QTEvUmQrZDNBNHZmNmo1V2VYT2ZCdjdIeUhubTlzbDNsYjhYY1dGSlRZYlV4?=
 =?utf-8?B?ZWtrRHhEWUhiWWQwb1VzRDVMVzZjSlE0RE5vU0p5aU9HYnluTWc5dmtkbENM?=
 =?utf-8?B?RG5NaGRkTkFldnpvaDgwNi9VN2ZBVHJDUG9WbDExQm9oaGs2Z1pEZHZaNEcw?=
 =?utf-8?B?RC8zL3RGSXVFU2ZJT0daTXFSV2FtaUh1SGZIMUlvNTB1dzA3T3hDWC9kQXRo?=
 =?utf-8?B?VnhBd3RYR3NQcjdQMWthNUFTMFZtZmc1eG0xQlovOHhtZDZia3VWQnM3Um9p?=
 =?utf-8?B?aFhTVitBSThCMlFmNTZOOHk4eW5FbTBPSy9nbTJEeEdXOVZjQkRxa1p3Mmlx?=
 =?utf-8?B?VlFYbEdjVUtHTjI2eEpZMzZNQjgzMUJrK2lxOGQ0UnUzS0F5eFh5SVpaVzdM?=
 =?utf-8?B?enJGUVplL0hUQTlFY2VaRCtLamJYN0Fka3Q5Y3NwbzI2bGdrNlJzY3Jka2pP?=
 =?utf-8?B?YU4ybFQvOHJtQk1LSDVETERxZmpIM042V3k3d3lrdVBlckkzRjhjdTh5QjQz?=
 =?utf-8?B?djZGc29oWmtFbHJNY2Z4emZ1VTNTaG1lSlRXLzVlSncyUUdKVDRWZ3F1VG9P?=
 =?utf-8?B?SjRXbmsrL3R5MFgyYUdXUjNzelM3WHV0dEkyRk1KSHRDQi9kSk1rMUtSL2Fr?=
 =?utf-8?B?bXZwa3FackFCdVdPY25XbFF1VFZtZGFrTVRwU0w5ZG9FVHlNQlJuRHpRS0xn?=
 =?utf-8?B?Nk1yVFRadUZQc1dpanZPdEJFdFpSM2Z3bnZwdUNJLzdtL1ppM1pXUnJFUk1Z?=
 =?utf-8?B?VGxGamFGNHNGOVc1MU5MSkh1QTRFWTRYSGV5VnpSanRSKytId1hRSUE0Wm8w?=
 =?utf-8?B?UGFJenB3TE1TZTJvK1A0QnVKSytaaVdNbktmM2RSZWlUNkNNM1BpMDlCMmty?=
 =?utf-8?B?cGFaT0JpRGpBUmhiOE9jYlB4UDY2NTMzME5scHhNVU5xMFQvZDZpTHBzR2F4?=
 =?utf-8?B?NTFIb1E2MlM1T1huZlZBWEpxbk1wUWFMTHJ6Z2tDdVlYc0x3MDZ5cEZGQ0V2?=
 =?utf-8?B?c3lSTWdKbVpMOXBvb2hlMkptNUdodUZhSFcrajNsRzZhYk1MSThjMVoyNE0r?=
 =?utf-8?B?ZVRZZXZUaE4xUTZ2U3FqaktheUpxTEVLMHA1YmprQnJBQjdhTmZXb2hhMk1N?=
 =?utf-8?B?TGdiSWhqeExEZ2ZFWSt4SlBZamJDSGU2WnhROUhtZ2lvVUhnSi9Sd3JIRVYv?=
 =?utf-8?B?aGg4TE1ieTdpaVlhSWJWV3FwNHkxaE5KY1NDL3BLK1RpSldkWEhJb2duQjM1?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uElQEO+mVPRcOiLbADRPBTg3SWdkNSp3Sx2lx8SzW6H6qEEFxsp8u42UMGuaI087HMQoG3+SCweyeqH0emfNubzPoi7S2waJkH8KdxURqDJQLvmrRFNizgC1sL0nUZvSlByJGxH6A1zaTMaokpLK9HE7vFplvGoKlq8tt2buJ/rYimwFogv9kvZA/cFWFQHgQuM5cacHfJV9T7zJSfOXUZgSlwWTzV89LvRxSsk6ebAEsSakvIim4jHeBFkpsDm7vFWgZjZ6hIb6d9Utl8C7KR9WV53imEHsUp0rUoln2X+yPZf7fvMh1BLCTlewwW45Bu9awb9xLe9zAhxtXzsx2KRuPIAfERnlzATsLcoIKCB1Pjv4Ps/+zNw8fVi431ql3aBwJYQdD+81OK/CXnOYXZfnJg7MFsLWs0obxnEy7W5gXz46cWjG1ynRzeKfeSXvV++blof3CKwnW5V9llgCVZTQBCUM/LRq3Zwsaxe6xNBL1BjvPEY2j9p58yF1buhxJ1TEVgh0dlLqWWNUopXyc083dInXmnyE3fvUbam2op7hsZ7xozgQBCf0FNMzAYRcPEHXV0wHgs1HljtRrrVA91D0uk3vwIaYXBSJGh9rTb+Xf4QWA8JJ0msDCuSlaPSa/a1+U/WV2pPiC31ihHVUVN6x3ISuX0E63f+KfDwxe4ClVzSzQ0fqzpBEZV8j6SKOJ0j81M4kHZG1y0KrKEJC0ndzx0GkqkcD5lllBjM3U+82UX4vTZKkHorZjWnVva520jl8lS4VKiY9ihUQ5cYZIvq1qgCVAao9GQ6uEZhOky4XNurNluDbJ3w4bBb1M9Dv
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ef21e0-0812-45a5-5ef5-08db65bda47c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 12:08:58.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T62oYX7O743QEmnmC3l5yEzDyA4HQiSz4qF4XbR6vCt5jKkCZqzlgm0dMduhYoL2d2enacYjnRFNjoY7s9VLYUmbyBC3VWkNaAd1JRqn3UM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7522

On 02/03/2023 2:28 pm, Jan Beulich wrote:
> Checking for what $(SIMD) contains was initially right, but already the
> addition of $(FMA) wasn't. Later categories (correctly) weren't added.
> Instead what is of interest is anything the main harness source file
> uses outside of suitable #if and without resorting to .byte, as that's
> the one file (containing actual tests) which has to succeed in building.
> The auxiliary binary blobs we utilize may fail to build; the resulting
> empty blobs are recognized and reported as "n/a" when the harness is
> run.
>
> Note that strictly speaking we'd need to probe the assembler. We assume
> that a compiler knowing of a certain ISA extension is backed by an
> equally capable assembler.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

