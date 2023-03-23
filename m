Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114D6C694A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513864.795524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKlE-0000OP-TH; Thu, 23 Mar 2023 13:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513864.795524; Thu, 23 Mar 2023 13:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfKlE-0000MP-P6; Thu, 23 Mar 2023 13:13:44 +0000
Received: by outflank-mailman (input) for mailman id 513864;
 Thu, 23 Mar 2023 13:13:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfKlD-0000MJ-3A
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:13:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85a045fe-c97c-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:13:39 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 09:13:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7212.namprd03.prod.outlook.com (2603:10b6:806:2fc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 13:13:34 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:13:34 +0000
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
X-Inumbo-ID: 85a045fe-c97c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679577219;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HHifd0pIE/oIJRa8l6GP42mDCbg1gLo2qDHd5laFk9A=;
  b=epjwEpAceIKVSHApgIsfeAA5HwV3wO1eHs0g9CHwTzQHvMvpiXhC1LJp
   mPxoU1RKe1VXOpfF/SDOc4FTCHGkhikoeUSG5jqthPfQgA73mxmgeawOh
   nJ3NXrnzxqYNwIyXPfGechKoxPIAQ9myXeUng0mwODZbdPZLd+GMkyccF
   g=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 102026357
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Dj6gjKDNmjKEkBVW/xniw5YqxClBgxIJ4kV8jS/XYbTApGhw0TxWm
 2dNUG6PP/iDamSmKotwboq3pBsDu8fRnYUwQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhC5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwuA0MX9W8
 6UkGRM2QAKYmLuUxu3gRbw57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraXx3uhBtlPS9VU8NYwknqyyFMcKyQ6D0e8uPSF0hKaXdNAf
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaETQUKEcSaClCShEKi+QPu6k2hxPLC9pmTqi8i4SsHSmqm
 m/W6i8jm78UkMgHkb2h+kzKiC6toZ6PSRMp4gLQXSSu6QYRiJOZWrFEIGPztZ5oRLt1hHHb1
 JTYs6ByNNwzMKw=
IronPort-HdrOrdr: A9a23:oDeOaKPV3gC32MBcTuOjsMiBIKoaSvp037B87TEXdfU1SKylfq
 +V98jzuSWftN9zYhAdcLK7V5VoGkmskaKdiLN5VYtKOjOKhILCFu9fBOXZrwHIKmnF+vVD1a
 1tVK5hTPH1BVh+p8P77A6keuxQpeVuX8qT9IHjJ9sGd3AJV0nAhT0JaTqmLg==
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="102026357"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWdMMy99u6Dq1OxzD9VTE4sewbn459OF4LDYHPsP8QpczhNYps1nlKoSS8hWn3VnpztQTpq7lJ/uho1ZinCEPAKwnJR5RZhrRWyeERCZrIag0PNja+tk6QPokaQ3lZs/TUfgy6/QQKO4rMXSStKtmpe3Ijadkx6x/IqAKPy5camspPVRILGXmd9C4E1/jeGA2LcfavSZODSgsbAn93JRe6o+bOGt3lp9es51EbKqFchdp3Ogco5R6OzzWaqSpsjKKhbVSLmN1hvTbS99n9SHOAohhSnzoobVWjKQKqFm6uqGyW1dGmRCbxuBDsLPtvjvljz0pPy44SHtRiKuy7dbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGW9rmQ7+rvZXm+GJ9TWLz1McuOCzimq60D9PWsMsf0=;
 b=croIvw2ygUCFq9j55SGZPQK3s0AUaOc9Nl7gIXHeyjEkVA/jxe5wcQn6IkoYUjPq4o5G7DpPIoVDckYzbjQro41uAEUhe1mNa1NcjI9TwWcKYZb/ZPGucJzRt5GZ+bM38XE3LJzKmDujkz3VYC+zwvQyuoyiDalfPwx+OCi1bRdx+h0Lq1k67SYvAfaTT54E8/3mSkd5MTRTIkigq2wgm77I8EConpNGtcLzXfCRCegjqXcUdIt21k4Cs8NqvxgPh/jprOEHgVeY/+XemBlV3GMD7P+liATR3XuQTYml9VmxpGGnyMzESJtTK4XSQAN5SI1yFBUZqGF/Ve6vW+0EVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGW9rmQ7+rvZXm+GJ9TWLz1McuOCzimq60D9PWsMsf0=;
 b=n/QFY9HbLcwTrCj2Vbmn+gvinQMORzK1qU9vJkHixn2nJ13nphM+E0hg53YjeZDWB/Lvuq+Ak1gih4lqd3ZGtSfSxC3w/ae9lQifPzopm5cq64GaLbBJOGIS3NTyVM0te6zwETUk/RtnmF2iTirF6UmxKvQAiMrgf2GrwuVgYas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <210f61ac-f982-90b3-297a-46f16eee89f3@citrix.com>
Date: Thu, 23 Mar 2023 13:13:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 06/16] x86/shadow: purge {write,cmpxchg}_guest_entry()
 hooks
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <4d36db89-cd87-06b8-bb02-395ec79662c7@suse.com>
In-Reply-To: <4d36db89-cd87-06b8-bb02-395ec79662c7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0366.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 08b5ac9e-e69e-4a69-0de9-08db2ba06795
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7QsrzDfcfT6im1dwf9wHZ2Ryxs9EGUe3Kn7ScPyjwiSvzmWk7cBLuUQru7T5jOJBLSJBhDy5VmhWTJDW5VF2S3+LEJoXMN+6Wn9eXpgJlWv/JIJ3hYqoPYw55VVz/XYoLcuwBWKDLhpiChhc0IWnQkAiSvzjRCPDzTLGL7OIXzF1i5ixhBIOrhCvhePACPiTTcJ/nSOG/AGSDNhok4CmD9TE4U87Tcwx+wvQFSCQ7VCGoYcHiZNnoEouttmfHvguUgpeOtLvTTA0DbC39JPBqdTxISkLREIrnoQ+Pbzlyk9CjP7fa3ENVJ0+Ky6HdzWXK0K/ugno4CPhjiz391gU8r8x9Ekm/YWI44UxOaJvxzXmK6fA7mMTjQW+U6tyxrY1FPjeAQuDGlyEG5Er1LkwjisMR2Z/1jNlw2+T0VYYAMxRFQeR6An3iJMigh/O65IwlUTJGW9rJB/QVQsPTjOz3GAw6B+1+gQwpk5IqtuJxhigR36cvzCdClhwnrUsETWwPUaTDDZV4ZqI+15cSgEye2CPnpK8s/URPuS/rPBcJnPZ6VJ2uDYqdcacpzVZ1zxuwI7cOS756Ibhtz4TwwSuRlV0brb0tVm7j1uiDtbtDKI/7gqjn+T7E6u4oEnkYNb4BrC9rITpraaAxiam5ZcRdvR/oy6jFkSy7ySbFGMBjCQ1w9+8Y5eG7uNGsbsCwS/8XRN7mg1Wtq2n+xV2DzY/uk3BTy6GrtfBS2EN2SZBUjF6f4uJz7mzJFX7hNigWBT6G1b/NTlF4Oc1Nw2YfMDPKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(451199018)(186003)(53546011)(26005)(6506007)(6512007)(6666004)(36756003)(83380400001)(31696002)(86362001)(38100700002)(82960400001)(2616005)(5660300002)(8936002)(8676002)(66476007)(4326008)(66556008)(66946007)(54906003)(41300700001)(110136005)(478600001)(31686004)(316002)(2906002)(66899018)(6486002)(133343001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZxT1RJYjdGUm5RcndadkY2WE0vR2t6MmVYb21VVWZXK2V2eWVYbHJCRG1y?=
 =?utf-8?B?d2VvTm5tUGc4bFN0eXdKeE5FZElHQkNHMmZHem5ERDhOK0FRUXRJaVphcy9B?=
 =?utf-8?B?bW9YLzEySElBdTRKNnRzVzBJZWpIbUJtaGw2Qm1kMTJMT3E1Vk5LM0ZVZTgv?=
 =?utf-8?B?aTV4NWZwdUNHcHFvcUFKM3FCamE3aGFyVWl1VTNUWUx5SFR5VDhQZXBXQXBi?=
 =?utf-8?B?MDk2dnFTblZOeWFWZDZTaitnb2Y5WUZiQlgwdkthUnJFc2g0ODAycHphdTVK?=
 =?utf-8?B?OE1obXNOaDEyUUdUQzFHbTA2TVlvYmtFL3JJaHlMS29nUVBhOVgzanpTczBw?=
 =?utf-8?B?VHpHVEppZU04cGp0MkR2WFdWWlcrcHFUNXlwN3hsdEVUZ2E4MXpVY2pWd0dl?=
 =?utf-8?B?U3B4bk0ycUg1MWpTNGhCaVZBYjZIZGhxZUNHaml0MlI3U3pmM25hVFJmS3lv?=
 =?utf-8?B?MFI2RFhnc1BMSitHRmkwZ2JBWjFNdVhjMFA2VlNpdWZlTzdiLy9DcVRWK3Fy?=
 =?utf-8?B?YXh3SEZndUY3SzBGSDByTHlYYll4U1BWZTZFc2o5R09LNlpZS01uWGxDdnJp?=
 =?utf-8?B?RElrdmJQU3ZmanJBUStNT1pBdzEyK0daT3NZd25oQmRldUlHS29jK3V0UktN?=
 =?utf-8?B?aDdNcUEzaGlXZ2hzKzJRMXIrMnlKbVpYc0JaNjhHN0U5aGJwcnY5R3k5RWll?=
 =?utf-8?B?NTdNTzRHbWs4ZGRiSXBHcE9pK0JBN2FuQ2lrS1I2WVRXL0dwcmF2YlovSklZ?=
 =?utf-8?B?ZTJYOFpvVmRkYWdUd05pak9QMmlzZktGMU9TN3F4S0lVUjVpRjhlSjJXam1J?=
 =?utf-8?B?a0h2anFSK3pieVViQ3RUSnlDVXlJMGU1azE0Y29HbXdid3FGVVdaTHlLcmhq?=
 =?utf-8?B?R3Q0alBwbjYvMEg3N1QrdFY3K05UeVFtZXdoSURwS1BUUk9MT0VjR1hOdmo4?=
 =?utf-8?B?RVVrUkJPbGVJUzVtYXFyY29VNndsRjRaaW1ab25obm11OW4zdXU5OHIzc1U1?=
 =?utf-8?B?UWwwZ3dENmIza3g2enIxbU5taE9xYnR2RUI2anhsbkNqeENYMSs5SEIwNnJO?=
 =?utf-8?B?YVFsT25qTFNDaWZ2STZuU0JZdWU2R2FHOHBodjhSZ0tMTmUyQzRMOGVieGxK?=
 =?utf-8?B?WkZaY1NsdndiYUpmTzRVRU4zR2xTT3UyZjUzdnlPd2dHZGJ4cWRYbHZYeTBK?=
 =?utf-8?B?cloxUmhRL0c2UG5scDlXOWJrTlFFaURwcUZLblo4dVRDWUtOTEZUdUZTbjdF?=
 =?utf-8?B?bHJuK0E3VnZicUdOa0tkRU8xblg0L3JSWlhVbkVPWUtjRGorOUxDa3lQNURa?=
 =?utf-8?B?b2d6WnNsOVpqdFNsWHBLcFFKRXBjTFV3Q3l5WGJ5MHlsMjU3bG91UUY5YmZP?=
 =?utf-8?B?eWtQTDlMM2tnR2ZBbHU2UkRWVmlwMmVCaVNuMGJHYUp1clZjcVArNE5nWFlx?=
 =?utf-8?B?eXRRcEJmc1BwWGNxT1ZoTmtEM2hZcm5UaXQwdStSRlZnQ1RscmFiK3VUZ3E3?=
 =?utf-8?B?dk5CbjF4a3E5ZkRFczF2MC9LTE1oTFFDZXdIRTVBMW1uZnJ0NUdKZ0R1eFlJ?=
 =?utf-8?B?QTlmNnBLZXJ1MU5odTBqK0owdDJMNjZQdkdyeUdLUHpsVVNTSkk3ZjBVdEdP?=
 =?utf-8?B?TlpnT3dDc3ZHT0hDcWpYa1RUaGFkQ1FLSUo1MHRxUElhcXZPOEd0YnhtWGt5?=
 =?utf-8?B?ck0vODdXRHJzNEpibjdPT1IwK2YvVDdzZFYrOEkvOW4xaG90blBMd0pMVlhS?=
 =?utf-8?B?VE5jR0l3bFJFWGNxMzBUTGpzOXUwVVJQUDFEUDRQSTNMcEYrU0JtQkh6cXJo?=
 =?utf-8?B?ZHpSUGp0UGlpekhzMDdYWURacTRHT3h2YXJ3elZnTmtPcy9ISFpVM2xDYVE1?=
 =?utf-8?B?R0RYYU84Y3JoQVgxZWF1WUl4V0h3eXZDL0VwWERxenZ0Lzhvd2o2VG1NRlFM?=
 =?utf-8?B?MDV3VjJuZ2k0UnAvcHJtZ3FrTGxQZzRzV2x1N2FsUkhKb0lFaFl6VUZQQzFL?=
 =?utf-8?B?YWo4c25Mc3R1YlRPVFpnR2hvWTdVMWRVUVd1d1ZqbUIwWVhMSFVyU1l2Tmh4?=
 =?utf-8?B?cW9kZnVsUXVLelp4ZEpvM2hJTExhditPUVM0VWhBUHZ4ekZBK3Jxd3piYXZo?=
 =?utf-8?B?blMxWVVmdlEwVnlscG5SWVpLcCs5UnRkWVdFRUpuZkVYVjJxcHpESHNTaEJ0?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W6pS/0Qyv+vMOM4MvhDekUlKDD0el5PKLx2cHm2nCv8tDbjb60ZVZJZZLk/AE2N/LdulUKzV51XhGVX6F9uZ+rMAbGV6AXngdXY50Y8vH60dBGsLTExZMVSzJzckG9trd6RlXvihJ3nnQZORTHimiR1T9kwn7GudTzAeuPC2ApTYP2kMQlVAnsYyplSgm4MLd5wXYFn0wfB82gtFNzjhfmoLDg15okGs9k47JKDjp3f0EYWKQhsQtKVqo7ZDwj0iLasBWBSiKtPFQi7XgxaNi4Uuc/zU88jEDKdflL5EqUken7QzjGXUYwK0xFhOLayW7OMJ2PlSZWb9rsl6izdO9XXIljNxzbUMJi8KWfl1F6qesLVoITU2tYnV9FBeleZlv4QEeSD3/WEgxg02U21dBtXRVfJ4ChRsV37gPCOkTjLETOT3BxKE+B9O+iOkgPYhyeTnN4Ux87x99zEnqkXb0gEDCtIem6xE/hsoFmQFn7EF+sADqJT7ooDK3tjNl4D5hgVg3I/Xi4P5MB7bG2Ke2wvV2fCEvBt7+DmVMWqjybuj47AhyQXk4iGPlGvZ66HZ10zetWrSAXYyNvDsmu2t1qj33jE4VGI7lYEig6WgLT2Z37wKTb/uoqIpRTqSRU/9K+idQHApm4gZ5WjtqyuFTaL3kLtv7gRWsKZzeB66ZhpW/7GBFuQ26DDKxHgF/YicSR0FsWpcgkllzGCc/KbOPjj82Qtd47Up0T60WCu9CYDfFxj9K/wAlGghnq0EaXcTU8niVTSZz5cYD025hIuMqxyFKqhsqEG+Sh2vlXFTUI+izjgGpw8MejMumAxfOf7G
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b5ac9e-e69e-4a69-0de9-08db2ba06795
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:13:33.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vq+Wx3UmfIp3UxnpmWrAWI/fKRBFlB+F6fY/cWVVJrc7YSlUI0nHCGOaTYsdWatna8jI7uSqqNisO6bhQDWk1mZ5gAN5Y6y4p9EcCc79ZHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7212

On 22/03/2023 9:32 am, Jan Beulich wrote:
> --- a/xen/arch/x86/pv/mm.h
> +++ b/xen/arch/x86/pv/mm.h
> @@ -32,6 +34,35 @@ static inline l1_pgentry_t guest_get_eff
>  }
>  
>  /*
> + * Write a new value into the guest pagetable, and update the
> + * paging-assistance state appropriately.  Returns false if we page-faulted,
> + * true for success.
> + */

I know you're just moving the comments as-are, but more than half of
this is definitely wrong now, and another part is wholly redundant.

"Write a new value into the guest pagetable" is about the best I can
think of, but it is borderline whether it even needs a comment.

> +static inline void paging_write_guest_entry(
> +    struct vcpu *v, intpte_t *p, intpte_t new, mfn_t gmfn)
> +{
> +    if ( unlikely(paging_mode_shadow(v->domain)) )
> +        shadow_write_guest_entry(v, p, new, gmfn);
> +    else
> +        write_atomic(p, new);
> +}
> +
> +
> +/*
> + * Cmpxchg a new value into the guest pagetable, and update the
> + * paging-assistance state appropriately.  Returns false if we page-faulted,
> + * true if not.  N.B. caller should check the value of "old" to see if the
> + * cmpxchg itself was successful.
> + */

"Compare and exchange a guest pagetable entry.  Returns the old value." 
We don't need to teach people how to use cmpxchg as a primitive here...

The comment next to shadow_cmpxchg_guest_entry() ideally wants the
grammar fix in the first clause too, and this is probably the right
patch to do it in.

For the content of the change, definitely an improvement.  With the
comments suitably adjusted, Reviewed-by: Andrew Cooper
<andrew.cooper3@citrix.com>

