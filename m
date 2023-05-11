Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB3F6FF031
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 12:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533245.829733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3w4-0001ic-01; Thu, 11 May 2023 10:54:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533245.829733; Thu, 11 May 2023 10:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px3w3-0001gb-TL; Thu, 11 May 2023 10:54:11 +0000
Received: by outflank-mailman (input) for mailman id 533245;
 Thu, 11 May 2023 10:54:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px3w3-0001gT-6B
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 10:54:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26e68569-efea-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 12:54:08 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 06:54:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6624.namprd03.prod.outlook.com (2603:10b6:510:b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Thu, 11 May
 2023 10:53:57 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 10:53:57 +0000
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
X-Inumbo-ID: 26e68569-efea-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683802448;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rXzmCdZ8OXqqEwFXMSKhJdWFbt+23sM03kFUNLcTtdk=;
  b=Jr4IVSTBWw4nFoCe7PF2hjB62+rID37QGP7jhcVE4KJupQC+4ibpHUyV
   QSNrBOSLqxW0Wnb3Z5XPri9WgCI9jxrKjQIlR7jru3Ed+G+CugfK28TjK
   U97e89/zAtGM52HYs8EgiiSO5HHeIThjp1pzDEb+Y9/YgpxUYsp3NkGKt
   Q=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 107985223
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IH0dqKl8wg3eNck2mYJt95zo5gxpJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWmmDb/qIa2Skfo93bti39BgEupaBmoVqQVRp/ypnEiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5QaGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cYXKB1RX0+Yvb6N0LG9F+Qxqp4aa9a+aevzulk4pd3YJdAPZMmbBo/suppf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1Q3ieC2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOLppqMw2gb7Kmo7AzM6bVKq+fmDqF+Mftxma
 HUq9yA0hP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 FiisywWl7gVy8kR2M2T9FTKgTuqqoLOCBA84gHaXGWN5Qd+eYLjbIutgWU39t5FJYedC1OH4
 34NnpHG6PhUVMnW0iuQXO8KAbeloe6fNyHRikJuGJ9n8Cmx/3mkfsZb5zQWyFpVD/vosATBO
 Cf70T69LrcKVJd2Rcebu76MNvk=
IronPort-HdrOrdr: A9a23:YeozJK/IIIKXmOQokLRuk+DNI+orL9Y04lQ7vn2ZKCY0TiX8ra
 uTdZsgvyMc5Ax9ZJhYo6HjBEDYewK4yXcX2+gs1NWZMzUO0VHARL2KhrGN/9SPIUHDH4NmpM
 RdT5Q=
X-Talos-CUID: =?us-ascii?q?9a23=3AMO1iEGmGF4100bx9bW+MclpePazXOUfSzFqMEhC?=
 =?us-ascii?q?jMzpSWL6TFFLN1Pld1NU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3APKftmQwVv/2HHFeOeUPcLTP/eGmaqK+AJHgEgM0?=
 =?us-ascii?q?GgeuVBwl+AnSksjm9WKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="107985223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CehyOBsL18dNleqlkHkpluZI9RpFu8x2pVIchzZBoPpGnrjNRmB3+9ATNy3TXTcP4nMHH0K50USDJwxNt1//Wf9ribgeUuQ7u9SUN8WYEdVxsy/B1OAVKBPEHyge80SJe60F6ijkymtPc8wMfPTWwJuVgLF4OKv14ZABg6h1jUOFCenAtOwRofDzg/Pcn5nB73ZYp5+GiCjSmD7B63hDE1PEE0eXmWA5PVo4NpSpu2i3D9tjUNwRcEyCiE199F4lmXOpxGNrJs1d0MpI+Oiesrgx+M1A83fCw+IHry+ScP3AjQoMpBbfkS2xmjCP4SMRTbDip3Kn41AOE1PdLE85uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXzmCdZ8OXqqEwFXMSKhJdWFbt+23sM03kFUNLcTtdk=;
 b=AsSGFaOrRjd66TJsv5ZoPhy+iNqtWnyodc1k2zVlHV5dLs9Off2ipC2U+WecmRdZvIqFSnup9VWafpfWAzHU5T4512xOHKknyRv5510X2O01NYl4Mzxtt/hpgClqo0VZtYUmhZholci9VYAG6NcikE7/xeD77I/tv4Onmkg5IP3wCo3dPJXupLf1MJRnuFydX0PzC1oJsRiHv9ouFU8RitfXKrHmdweQBCIFHsLqIr/dsa8bp48Mb2Fx5YRtkCV7vbX/5k2mLnleUIAuIDLNmg0oC2ekLStnoYTZhz4Nml0OUxkSS0WaNw/cQDULZeBzZbNE43d7zVTWlXKNHlb5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXzmCdZ8OXqqEwFXMSKhJdWFbt+23sM03kFUNLcTtdk=;
 b=F6BG7zEIfFhi0glaGGINUfoAjy5xslhNaV4wRnM3EOXjJsFUTX8S7emp8hmPJTWEmG8d0jReFEFjjVqdxOHE84T5VN6Yoz/ZyWO7OssAV6fwwA+KpXzjRan0W1cBM2e/YAWWAbkdw4lPo37VCqksQLfhXMIxsaHsTaJGntqYt/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <03cf36b0-9ac2-40b3-e6c5-5bd687e69e0a@citrix.com>
Date: Thu, 11 May 2023 11:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] domctl: bump interface version
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
References: <4bc416aa-8ff7-f2d4-c452-7494f6d2473a@suse.com>
In-Reply-To: <4bc416aa-8ff7-f2d4-c452-7494f6d2473a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0249.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6624:EE_
X-MS-Office365-Filtering-Correlation-Id: 4142613e-b6a2-403d-785e-08db520e04fc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Md8bc4VqScyH/n0tF1i+PBHhi8wJT6CaIVO99yKyaAgUa/lOR3ynL37dKCBF62x35PWhXgfBr2qupHSE6MqPlc7WLu7+o9Tmq5SeD1Kc+n2/8Xk9oDiHv2F9tBBZdILQVuDbULWl6IF8YpEQAthC09U2/oWDuP06PMFg1+dokanejcmk7sa5rCgww+Puu3tHAVVOU5HzhDFQNjJyY3JZmhjLrwnK2LRztonROY5FVjiW0aAXx15b7zActvOOiOJZugcG5IlDk6/A2/oylirtfFd3uF9e62gvAxnzYFsJZIrxOUA0o5CbBxuV4qZ7YTUZBJUsStLErIUU/HV4efPesfB5a3eHqu5sngk9wrSsfo3ZcuVY/W1F5sz3p9ExjFNOHVevlZJ4JuII3nRSqR+cWIl75dmWQyvecxkokjGkPvywUKcLJkbcSfERg2IYwKVY7N6pVvlAxTJayon6WQja3ggqgNNzHxS08QOkIqvZCZAuqmbzNkvHydcDN9dIdYwiGgNDBShpAL1/FsvGMR86jzirEX0g71Mld2GpQLMUkNSlX+HuGK150VZS0PXvAiQitwivfB1HbC9U97MxDhRbvmxfRk9KhHStCLOGEpGsvnQaqlkiVWjwEuK+SbCIZTKwx9TBaMqaVxHAinbfAClJDw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(451199021)(2906002)(41300700001)(4744005)(38100700002)(316002)(8936002)(31686004)(8676002)(478600001)(86362001)(66946007)(66556008)(5660300002)(4326008)(31696002)(66476007)(82960400001)(36756003)(6486002)(6666004)(2616005)(54906003)(110136005)(186003)(6512007)(26005)(6506007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWtjRFN1bVpKM0toWllaVFdlaW9ST0I0K1ovdVNHUWFveEh6bjNaTC9qeGFB?=
 =?utf-8?B?WGdGVFNrblhCREl4OHcyeFo1UklOWk9xak10eFQ3TG5ISDBYdlhQSGJDQkdZ?=
 =?utf-8?B?UEMzc3RwUHBCYUNiYUlEVVRBNURBeGFMSFIvNnRLNDUvcVZUUktYN2hDY3F2?=
 =?utf-8?B?NEU4N0YxOXptT1ZBRm9Kc3pjSDdUbjZFeVowM1pIdFlkTXRCdUIvU2J5andM?=
 =?utf-8?B?WEcyVEtoYzRCSVpnTVlhYmU4U0Y3aktaYXp2UXQwTmU0OHZFT095M2gxcXB3?=
 =?utf-8?B?LzJ5Rmt4Y2QzUXEwd0JlMHIxOG5NSCs2UHFpYWVrdFpvTTBvcnJBZ1l1Vnl0?=
 =?utf-8?B?MW9JakM0NnBSQWtsWTNEa2hiOVZId2ZETExWZEFwdFB0R1ptRXlHOGM5S1JL?=
 =?utf-8?B?dnBQcFdzeVllNllJQnNuM2JCMk55VXdXZmMyWGFJYTlpdE5QSWwvSEhmdUhL?=
 =?utf-8?B?TnBZRTFWMnNML2Iva0xPTFJ4WEFobHB6SG43Yk9iRVhQZ01NNXRWcFVoYVlC?=
 =?utf-8?B?a1JlVzR1SXZPSWlvdjlFWlRFWTZqMlUvYTViK2Z6S0hFK3V4Sk1VeUdhM2dP?=
 =?utf-8?B?c29WcFNYc1o0VzBiT2pTOEQvTXlkTi9qNlZaWFBQTG5QL2g3UkRDeUpMQjR2?=
 =?utf-8?B?eW9hMEtDQkxaUGVJSEp4WThqN3loS3B3aHpFOFE3UjRML3d1T0IrVmJTVHFX?=
 =?utf-8?B?bFNTbTNvdk0zalpCanlFV2phQlVwQW1wWkU2MW1wVXQzWW1qMkFlUUpCMmFk?=
 =?utf-8?B?aVhCRVJnNjBUMU1YUDkwWjNjU1M4dTVxRWdjL29VS3BzdzJaUmtvb3ZyTXF6?=
 =?utf-8?B?VlY2dG9NVHhXa1FPNjRnR1FyMFk5U1N1QW50U3ZSckJoTHhxTDNCdTBnK2VZ?=
 =?utf-8?B?T2xuT0x3cCtYMXdBM09RM2ROcXdhaVhOWTMzVE1xVmZ5akVRWm1vVFN3NFpz?=
 =?utf-8?B?ZWJYMHovdEp4U0hWemRxOHdBWmYrWTNIUVVlVW1IVmVlRmsrUC9SbTN2VU5v?=
 =?utf-8?B?UXBOSnhBMHAxVWdpbGRsa1M2M3FtYXNCcTA2amNSaDlYS3J2QmZKdUpQeUxX?=
 =?utf-8?B?ZGcxVklMLzBsSFZJWldJSEVudG5KQk5haE9ORCtESmZCeUwvcUlITUJGcEFj?=
 =?utf-8?B?NklKNEdaWW90bnRlV2VBQmxST2VvS0R0N2l6YzduM3ZUa3l0OWt5aS9xTlRG?=
 =?utf-8?B?TEVWZ3NjK1ZkK0k0clh6S2RoRDBTYmREM2hGRW5YbkE3YUpYU2hDcDFpZDFG?=
 =?utf-8?B?Tlk4cDhqc2J3M3ZmOStZblg0bHlHVWZDcG04ZVpXSGQ0cUFobkRzNUk4Q0pB?=
 =?utf-8?B?VVpCL01ieFA4eTdiVkRUR2VjT2RmK2F1dWVQL1V2VkhLV3hINFIvVU13L3lY?=
 =?utf-8?B?bE9FVndycFJWWTMrZWxwOWpNTENVS1VGd0poRjI3b2ZlR3ExWTM0WEtnczli?=
 =?utf-8?B?QXVlQXBzT0k1c1p5VXlEdHNucUwzQWdsVGhUQ2hsMWNyall2ckwrQXpiK2FM?=
 =?utf-8?B?UmtLaFNIbEdWdG9xWnVYUHM1T1ErQVhYTC9OVW44eTRxa0RvSHRzc2VobFht?=
 =?utf-8?B?OW9HdkgyZDJaVUN1d09OalJVNllFOGVFTzRSeWl3bTlwOStWYUtpZFRUN1pH?=
 =?utf-8?B?aEs4a0dUNDkybWdyN0c0amg3SVZZcDMzUTVVWE5hOTNnUDVrVUVRa1IxVXlM?=
 =?utf-8?B?WDF2NXd0WjlYM2crOXJ5U0NoWmZVNm54WXI0Tkg3bmVJVWZ0WG1kV3Y1c1c0?=
 =?utf-8?B?dnNBNHRpSFhRMWVobEJHUTdueHdLQXVVTHQ4QVpTdGt5WjNONVNza044MFha?=
 =?utf-8?B?OWdJMU1MSnZVcFV2YmJiVmlzWVFrVDN5a05kNlNESE44YTNmaVd4Sy9FaWlx?=
 =?utf-8?B?SXhDZlFtR3Znb0ZNdElNcmlFRHc1VkE0bXk4SjRFNnMxMytmNkJNQWNZakEr?=
 =?utf-8?B?anh6a0xGSk5TeDVrWWU3c1ZnY0JjckVRenhEUnEvWkR0Nm1YcmlaOWQwaTdt?=
 =?utf-8?B?LzFsWVRIdFZubld5QnJQUGhtSmg0R3kwbTJ6TWhTOGh1MXBlRUlDejRjek5B?=
 =?utf-8?B?b3JEWjNmTmpYOTJQLzVDcG5WU1pkTkVpQXEyWTdEa0Y3WlBtSTRvclNYOG11?=
 =?utf-8?B?VVVsVWlCaEpYbWh1LzZ2ZjFiY1AvMVB2WUMrNDZVZ3loNmRIM21na3NrRkx2?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5wMfwDu9IHiS6eq95/7rA3i++aMgha3yCnPMiXkzcaFz98boYQTs4qNpUwF0/huH7+HhqFlrTTwljqicIQnACqkKkyz1iKXRdNHflqOebIvd5pJ1Fh4OCYd9whpu3MYtaN3eVbS2WcQuMnQZMXDmu/hPO6JvhyeKHpvQR2dNCbgNPmVDQkocgQzWKmIq9zYhORgeu5fhHIz8LQRG8vFAYCh+E2a1oxPAoEv5Wdc58aBVl7L3QFA9hZ4106fuF3YqrZsjESRyHjTJYvpTAFKy7o4URkaJsVVielUt3iWe3ORQ1jJ19oM1yZVI9jCmFLag2sR2m6SH6o90lrGZ7KNy5zzGD/dnmGYJ+8uy102afuObUpGFjhqjV9oYQLwr35kV20Nh+MMS7rGmBaWXVjXhMI2Je4tSYJQzrVLhaQdfYiecbNTCnU7kJVyFaETVcXyvCsZ/fCUyh6wUlPNn3Vqu1tPOd+A2hxK0pmioW+dSyUOs9L9hcNx2T+xkKVrZDGoqtMAoLDbURiOL6F7eoTgei4eB5Dmn5tZajtz3ppgTa76/ITVwf4mx2Dcz6UAJaXDC6qomnZivqx7FuBIpl4z9lW+HrdeTrG5v9+dkL+zqMiHIZydPHBADXLaG9Y2DkpXeI1ZcgP4oDeTktdkk6NlqG86rtbrkEHiNsLOGNAc8FYG4W3gu/Ahu0HQdsmBbW9BYdZCCSqz3YRsg8mFFNmkNfd4dtdKTg6UIMsFpA+PXnixPwKwA1I5PTqgDUvakLeTCTpZhoe889yxncAhnuFBdDpR8rtmfKIg/rg/PeUBDhgkGXqMhgNqZT7dC/AACh4iqSdrP3y0owfL3ib6y8hvYvPrKgyh27VPv0Pk+fPzqoCAYyHDSAaLBFyElD+oWPmKo
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4142613e-b6a2-403d-785e-08db520e04fc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 10:53:57.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVqcTk2rVciZuhO8tsT/OBZ2E4JmR3CCOD6x0DRZEsRAKFkO2KTy73baooy+wAmhros1Dl9hHONQOveUC2ACpCEeBQMLhwnGVwAHeB3uWt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6624

On 11/05/2023 11:52 am, Jan Beulich wrote:
> The change to XEN_DOMCTL_getdomaininfo was a binary incompatible one,
> and the interface version wasn't bumped yet during the 4.18 release
> cycle.
>
> Fixes: 31c655497461 ("domctl: Modify XEN_DOMCTL_getdomaininfo to fail if domid is not found")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, and sorry for missing this.

