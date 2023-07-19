Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6542C758FE0
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 10:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565633.883951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2CY-0007Xa-11; Wed, 19 Jul 2023 08:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565633.883951; Wed, 19 Jul 2023 08:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM2CX-0007Vu-T5; Wed, 19 Jul 2023 08:06:25 +0000
Received: by outflank-mailman (input) for mailman id 565633;
 Wed, 19 Jul 2023 08:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fyAl=DF=citrix.com=prvs=55726f7b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qM2CW-0007Vo-JR
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 08:06:24 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2513ecbd-260b-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 10:06:21 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jul 2023 04:06:17 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB5878.namprd03.prod.outlook.com (2603:10b6:510:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 08:06:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 08:06:15 +0000
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
X-Inumbo-ID: 2513ecbd-260b-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689753981;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=51e7riYfyV/SlWoUef1zMcA00Ac39QG0n3MgeOluJtI=;
  b=StCpVo5sYpLZvhJ8aV94GtqOlWTImYY45F0algdo4ObGEp3fo5v2gZ/3
   RH1JjmhNwfHjEnHY/mVvz2TjeXxFFJ8kDMNUW72j/MryYI2oCVxKbFWLh
   o8Qa422GYnNNdx+YyRdOtakiHozWx2GQxdHfCm+BSCA180qPdA2qTWTwa
   A=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 115991452
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:txBfG6kf7STrd7Z5IQSD6Pfo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWmrSbP6KZzChctEgYYy0o0sC6sPVn4VlSwc//CA0FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgU5Q6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eM3DxMvN0iIvf/swPGeZPFP34cffPC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeDpp6c23Qf7Kmo7OQQJS1udrduFu22/RM5RD
 0kfoyMchP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDRLoViMA6tjn5Ys13hTGS486FLbv14OlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:mIEpd6Bt+4ibFOXlHem755DYdb4zR+YMi2TDsHoQdfU1SK2lfq
 WV954mPHDP+VQssQ4b6LW90cW7LE80lqQa3WByB8bAYOCOggLBEGgI1+TfKlPbdxEW/9QtsZ
 tdTw==
X-Talos-CUID: =?us-ascii?q?9a23=3AuW99lmuyVcqQAQxSiYjFeJhS6Is6XVr+7i6IKHW?=
 =?us-ascii?q?lU2YqbZONagbTxPNdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ABjYhIgxg6E+6G7KXqLgFcWBXjNeaqJW3F14Nt5k?=
 =?us-ascii?q?kh/inNDNsNROYh22+cKZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,216,1684814400"; 
   d="scan'208";a="115991452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWuMx2O7cCHN3f0ZAa/lUG2l8QdVgypeZi6tZAWRGRMztPAvu5R7QwQAeR/eZ/Kfg33r2/d1Lct/PD4n+3cJc9A4DrzWxx9FbZhU8EjAdBWba03bAnzU5qS5zMMl0x9Y3JyDyhrUj5i8WRxnOwzg1d7csW5mC6FZLB1FiI9vUWm03HMb5959lbCJGIS2QbZZimAeAsNsiq2BHtJ+s/OX87JZ5W5cOxu7txDdzj1UXcGwJYP72+rZTRntoY0DjzOlk/Hi5Ch30DPwqzt2iHHRmHURiUZIhxL2l/0Nyb8zWoYvDfToBU3oE58SXewsRnDqMpNX29/V0fk3kwZvQaCliA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQxWbjEV3drKoWkfyCM++nGf9g/KbOq1967oth5Hpas=;
 b=gvFPBb/uaIrSiTJHZI7h+tBPpnx3iqvrTVIFeBKthShsoAd6jw0AtDDpnL1WRy6uVg20bzFcL39dskNlQwxw/0D7V/tX4a9yzoCClF2pamyLneqwo7dGEfZtbsgvqosm5BOSjqVqzI3jwHOYTY/pVmel9xbW8hhAl5u7Wt1DrYQoe7g59s0SziQRkvCmDLUohUnZnoJauBA3xYx4LAmlGrUxycHg4OYOTg3YhxfqSPrrB9R4SDG4FG3bpWmKu67WkYowvm5V1HVLt1CNET29yMK8MUEzIr7sUiULGep72mHC5TVCDlu81PXponfDu94FgfVW+NWv5gT3tXm0sOr3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQxWbjEV3drKoWkfyCM++nGf9g/KbOq1967oth5Hpas=;
 b=uiprHp2gEJNeg3WrXOlytRDo+QmMaIgK7Qa0q62Mqudl0o7JVGXRJq1bISud6CUwbqbPi+UCPfcGq+6l/mHNFE1ziAGmH+szOSa2Mbkt+BiiiECufiD1BXB6ywhK42g4TZBmeyrKNF+nvUh9KiMk+TrIW4tXNpJT+lkA1JO7N+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f9e4d896-fcbb-eca3-ed3d-e7ad886dbc0f@citrix.com>
Date: Wed, 19 Jul 2023 09:06:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix early boot output
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <3913c170-09c6-2baf-ed38-5614f8c6cb2e@suse.com>
In-Reply-To: <3913c170-09c6-2baf-ed38-5614f8c6cb2e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc14f85-a14e-4901-5a25-08db882f05c3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cAzPLFKTJxTf4qc7HVwjTzaPE2dAgzWTK7NFgYdmivK6NM4q9a8b2HPZHsAFCEhJ0H7y2k1g1HXJNdy5MBbRVSkz0tmZGpkh365Nqh2eSAopH8GbEqP0vPgYOX9PekH/PlWwccFCSzx/TCg82o5WzLNbtWSxXKqoSFcEkzDd+FJ+xbvbExPgNQE4shg5fG8rWEEfdYHF/Jrp0tatb/esmFTQ3NXUfd4tdgpBKcHvcrDow5WvZvTU9DicvvTq0ShY3c0NUKSCSn4CR7iY/S72MxAKDWmwi1HGHlGTT40BDwOd0T2nTHkD12nnTn9VQDdoTXukbnDilLQZ6lFcfhUMz/K6pcR8llvonoWJeXWV0TzCDrI7H/FTbCk8hQv9fkn+vi+VDwxqBeGmtOKR0lYvsC3CSLA5bD72rtl5e5q9EaLN+sAT5o8wG8UJSKIcPFjFRnMTq1hkdKnKdW+aYJWyBQbzjJs+nVR4gtTHpEoOJkGs7WdKKf0vp4PgMQTBcMhFO8MKHItYIZz8MG1zYmpO12Y+fKMuKQvI1bwFjXRtq4OyqDLWcEVQWeUsAwlai53qaPKvcUdcY7fMbhGOokkb+Y/P4Ic5BPIdClGbxMy/WEDsz5lMHrge/uOCnqAo3nKIsABur8wQuMi96q2nyKyoKA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(478600001)(110136005)(6666004)(6486002)(53546011)(186003)(6506007)(54906003)(41300700001)(6512007)(107886003)(26005)(2906002)(4326008)(8676002)(5660300002)(66556008)(316002)(8936002)(38100700002)(82960400001)(66946007)(66476007)(31696002)(86362001)(36756003)(83380400001)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nmo2K3NieHFBV0pEdlVwSy9tZStNTlVVWHhJd1JJZm1GcGVoNXBkSlRPWm5W?=
 =?utf-8?B?K3FYWWtJZ1RmNWorZXI4VE5YK3pncUdFRDZjR1JVNGYzL3VNMk5LbDBQTE9m?=
 =?utf-8?B?azVVa2NxVm1uRHlkS2p3WStneTVWZWhxajh3ak5zME1wMm5ETUh0aDVxRlBk?=
 =?utf-8?B?Uno3ZmYvSVJQb3ZYNk42d1ZPSUwwWGN1blg5UGlZWFZCSjNQeXhFNzl1Wkkx?=
 =?utf-8?B?VEN3L1B0bXI4TjJVZk5adDZORjFmaXlLLzhNVVE4MVdNczI0OGdabVhJTGFk?=
 =?utf-8?B?bFBEUXlIbW5MaEttRzBnYysvNm9PVXc5cHNveXVmM0o0TTRKSmZrTmFKaXlR?=
 =?utf-8?B?QUtwOFlrYWxrT0VSQ1RPNTN3VUpISkVYQnpTR01Ea0hQL29kaWg4cElCQTNj?=
 =?utf-8?B?RHdDNXJOcnRacHA4WjcvWkt4WGNXWFV6UnhBVUUxU1U5WEdpNnRQNFdpRnZl?=
 =?utf-8?B?S2NLb1dHbkF4bmdqYmdNTkpqYm1iaGhJc2hyK0NCMDljb0tFM0JFa1BFOHda?=
 =?utf-8?B?RUdjekt4dDY1SHNuOWhXdTR3Vm1vMzJXTzk3d3FWVWJURHpoUmhPVUxVWnJu?=
 =?utf-8?B?ZGNqMUJEY2U4SmJwUmRmMzZTMmpCblJaNWRsbnVKNnN6dXN0YXBCL2pKcW9O?=
 =?utf-8?B?L3BtTmNIOEp5OU9ic2tWMWNCS3hBcW1ua3ZFMU5LZWJSOWJUTm9leC9sSi9r?=
 =?utf-8?B?NWFOWkJHQmlRTzkxeXVBTFkvNHc3UERvSWhaQ2pvUjVpTG1ic1Vad0NSOUN6?=
 =?utf-8?B?WW5nSlh4QmN5aXIraGc1a3hSTlBIdDR1YTdyUXVRR0ZLOTVZSVF6SXIvZ1Bm?=
 =?utf-8?B?ZWFya1Y2bitCa1Z0SDQ3dVRoeWdFZHpjc2RaMGJPcHJ6Q3ZYUXRWRnBnNjdS?=
 =?utf-8?B?bzVGRUxnY0V6L2VYUmtyb3NuV05ienZxUTJWTEVZQndyaWExRjVzZ2VpSFR6?=
 =?utf-8?B?STlTN1RrZEhrMTdBYkx1SHdMcUpWbFZXazJob244Y0VEbEFzc2N1a0hyNnNa?=
 =?utf-8?B?Wkw1K2pncWhyQnhiYkttZlVuSGFIM1hHcWkrYkdwSk5zZ1JDUmNKemJSRFVu?=
 =?utf-8?B?UExFQlZVbnNRV00wL3VLUjRXcHc0dmQ2dkVnb1VzUDNEZnVxalU2MCt2SlRD?=
 =?utf-8?B?RmMxS2ViTDJaWTRTcjRTSXFVNE5ZZHhmWFNJaTZpQWgzb1ZMVzlIZ3VoZEMy?=
 =?utf-8?B?eXhuWlRKZzRKUlNvK3ZuTjE0d09PYjhKZUl2UjNTakNKR2JJd3htUjUvTGU3?=
 =?utf-8?B?eVZjZDFROFpLZXlKeE02eWVpUEc0K29kU0VyVkFTTWFsbGdRcFk1ZklVNWRu?=
 =?utf-8?B?WEZuQzY3VytXVTUzanhoQUxkY2lSTjhoc2RKcmdQTHhMNFhtSm42Y0I3UU8y?=
 =?utf-8?B?WDZaK3JNYWo4NCtsWkp1cUxMeTN2Q0xWdlBsUkFLZVNrT1hCTDBlYjFRMGhJ?=
 =?utf-8?B?akpmSzZTdXowZjY0N2hhVUxFaHFLZERoMHpYQWxCWTNoaUJBY1ZuMXQ3S09o?=
 =?utf-8?B?TkhRWVgveW9GYk01M2hhN2x1VXo3K3pQNXhwTERzYTZvQlIzNlRnSWtRQWhG?=
 =?utf-8?B?cXNiNDBXTmc1NXFKNWpXdURORDdXdEg0aDAxK0RtTXJTcGNkRG5NTktwb0NP?=
 =?utf-8?B?TlZYZUg1S0pXa0NrbkZIelhIclZHck1EZ21NaGR4bmtRUkQrVUE0aTA4RGlH?=
 =?utf-8?B?K2dDbkd4YjN4blg2S0ZxSVdhZGNEcGVjT3c0V2hCT0tpakJkN0EzY1ZQOURZ?=
 =?utf-8?B?dkhEa0g2bGRpSERCN1ExWGlmSnZ3dzBjNWxpcGVvMFUwQ1VLSUdkTHFuSXVi?=
 =?utf-8?B?UUlrWTIrWDdKZjdENE9ybTZMajRWbFE1LytvVnVPTjArb0ZiMk1qNHUzRkdX?=
 =?utf-8?B?SlYrb01XYmhic005THJDYmtmbWlpSFU2SDAzcEVtZjVUdkxiVmtPMXBwdlZM?=
 =?utf-8?B?eHRWVXd5RWRxR0lkbUQ2b0xvK1k0dVM1eEcvVmg3QzVMM09jQUNVcEs4em84?=
 =?utf-8?B?eFVYaWJJbjNDT2lmMDR4cDFYRzJoRU5JT0ljam5aTDByTXlaZlVKOEF3cEFy?=
 =?utf-8?B?L2Q1ZXRZUUZCWGdjbGVJK0xlbm1ZYmloRTlnYWZtdEVYQXVBcFlTcm9XNnpK?=
 =?utf-8?B?OUp0WmZZbERaUk5GaFI2b2w3OFJLakFUMmoyYUtBWWFDK29lL3pRRjQ4Y0pU?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GHtewX+y9Y4JuE4S41+eHJn4OctUXgTiGvYA1z4rFX0r2QokF6ScgBCQbv5dDUZ54yvCxLfB4XsdkYKUJYag+G5+lhzHWs+krM5BDAWq144mXued2LSzPICgrxYn2eJKWSQkRWk2RnaxXBnNtRKEhRLk5rBkCmyIScQjuy0Sv5nGOlfP/bmpxAe61ZUCzhaOb6YG1jVEhU5MVqMNz3wLeQPGVFY7AS8/CqVappQpSr/0AQLxMb8tPPx28PBwtQzUy5Q6lW2kqpp7vEEudG7QHpsTmB3+wJ9iQhps2RygMZ9JC770Gp3jUS9vFzeyOteGqxnzY7R2W3g6RA0CWmD7/DrR/z0ka1VhZiTZSCARSfwtcf/eum2ZBfZ4lGwpurcH1VKUTETTXf027bUzXpBBCVSZNVS1uxXACsWHYj2yRdW7aLIzk1zCafXzrj68Ghvq9l7uxG3QzgGyKz+7OEtH7VTs4/zQQi2hYUq2gxee0iap62k0mA1IRDfyflCeh/6oyMl7NAjFYg51NvGWvCpg4Et58GjLF8BSNT6gyIyks0mx6AhfW1jl2oDMziDeG6ks9FB0BIMWbAFubzjz9sZBJX6NVC4UgkCmwm718eriheXb3Xbj3ZtthTOFF3Vor7+MCZNEz7aW4BtTRqGsEK1Nhut/nCVbR8GgTfWX9IEmI3hI21gvtq/HQcnU/3+dwjQynfDgHQ2OnVxejVkknkypJrpxSB7mpVi21Nir5KI+7rhUbms81ChBYgg5P4X3A0vwZTO9xQv7SwdmFUlpluCbkTp6naOXusj4GJZij00PuOyIr9HILC0Kc4naV/Cq21fR
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc14f85-a14e-4901-5a25-08db882f05c3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 08:06:14.7341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsxIGpE3fGkt8r1J5B2RI/CgVWFr6y3fbcU0/zcQUkVWFIe7s5UvqbhVATJZ02RWqlvLYeTPJIGenIR8MOHpuinMORBXjHh+9E3b4FICqDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5878

On 19/07/2023 8:38 am, Jan Beulich wrote:
> Loading the VGA base address involves sym_esi(), i.e. %esi still needs
> to hold the relocation base address. Therefore the address of the
> message to output cannot be "passed" in %esi. Put the message offset in
> %ecx instead, adding it into %esi _after_ its last use as base address.
>
> Fixes: b28044226e1c ("x86: make Xen early boot code relocatable")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

When I was doing the label cleanup, I did wonder how this worked, given
that it clobbered %esi.  I guess this is the answer...

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Although it occurs to me that probably want to (optionally) use one of
the IO-port/Hypercall protocols too to get these messages in PVH boot
case too.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -184,12 +184,15 @@ early_error: /* Here to improve the disa
>           * Here we are on EFI IA-32 platform. Then reliable vga_text_buffer zap is
>           * impossible in Multiboot2 scanning loop and we have to zero %edi below.
>           */
> -        add     $sym_offs(.Lbad_efi_msg), %esi
> +        mov     $sym_offs(.Lbad_efi_msg), %ecx
>          xor     %edi,%edi                       # No VGA text buffer
>          jmp     .Lprint_err
>  .Lget_vtb:
>          mov     sym_esi(vga_text_buffer), %edi
>  .Lprint_err:
> +        add     %ecx, %esi     # Add string offset to relocation base.
> +        # NOTE: No further use of sym_esi() till the end of the "function"!

Minor, but I'd phrase this as "Note: sym_esi() no longer useable".

It is obviously limited in scope, but "until the end of the function"
gives an implication that it's fine thereafter which isn't really true.

~Andrew

