Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6B6A9526
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505786.778724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2cB-0002Aq-OV; Fri, 03 Mar 2023 10:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505786.778724; Fri, 03 Mar 2023 10:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2cB-000282-LZ; Fri, 03 Mar 2023 10:26:15 +0000
Received: by outflank-mailman (input) for mailman id 505786;
 Fri, 03 Mar 2023 10:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY2cA-00027g-11
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:26:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0c3881a-b9ad-11ed-96af-2f268f93b82a;
 Fri, 03 Mar 2023 11:26:12 +0100 (CET)
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 05:25:57 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7134.namprd03.prod.outlook.com (2603:10b6:510:2b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 10:25:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 10:25:53 +0000
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
X-Inumbo-ID: d0c3881a-b9ad-11ed-96af-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677839171;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ayDh3uzwYAGY3pmvf0S6Yp1vruCWAa9bK9hHn6NUV/w=;
  b=hXlnLMRO1ohWn2BV5xmOAAbjoCq034zg01w+tXGJO8+54AZUN0zzJMki
   uzoF1FEBgqsSUoaZvGHSONbtJTIjrFy2WbyjdmEGNdJtD9dPBDtXYqcOu
   BNNfTqwOHmpf2DrwzNVUrL20katMAwHFNdlV5HbTt4EmHYrlxydgsBZ/J
   4=;
X-IronPort-RemoteIP: 104.47.55.174
X-IronPort-MID: 98135562
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zZ2qEKARMq3IDhVW/53iw5YqxClBgxIJ4kV8jS/XYbTApGl33mEGy
 mccD2HVOq6OZzP8L9onPNi1pBwA7JXWztAyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFu8pvlDs15K6p4GhA5QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw88FoPUNC2
 eckBR9dPhmi39+m6b2EY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDS7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6fxHimBdxIfFG+3qV12E+s6jIXMxMpZVCgvdu+l1avV/sKf
 iT4/QJr98De7neDSd3wXAa5oTiHowQbUNpTFMU17QiMzuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8rzm/JCwUJm8qfjIfQE0O5NyLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWr7oShMgPyq6y1UrGnTW3p57CCAUy423/VGWv5BJ0f46haomh73DU6P9BKMCSSVzpl
 HEAmtOC5eEUS5+XnSqGQf4lA72iof2CNVX0illpGZ4j+z2z+mWLcoVZ4TU4L0BsWvvoYhfsa
 U7X/AlXtJlaOSLwabctOt3tTcM30aLnCNLpEOjOacZDaYRwcwnB+zxyYUmX3Cbml01EfbwDB
 Kp3uP2EVR4yYZmLBhLsF4/xDZdDKvgC+F7u
IronPort-HdrOrdr: A9a23:xIkW8quCmFxZ7WaM6ctIhQ137skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.98,230,1673931600"; 
   d="scan'208";a="98135562"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0XizvL6yPeyzYd4rT2fgNHVgyHbqMVDdYqfb7IlUNHewwe5HURNdaIXSgRXsBAumvbdAX43m2jvDi6LFJhHE+cV/hFFm4Yvhbbm3MExjrt1E8LexdTZxKaGoirXFP8q37CXIjeiEwjD2GAHK+I1w1d4nmSnnx2o4FePkKyCQfrBnYenUsQaI0E7TvvsQ4/YsGpe/MfPtSezHc04k5UOtuVjG327Nb1laHbRj2TcPvBTc3VmNYiyzVGbTzHOMP/34wLJ1kJZTrUw/YF0mq+sva7525LjSw4CfhamIk0iCvX6q+4gZ+j3SaZO697vW+eSd6VsF3gxgpDIdEDHnUvD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayDh3uzwYAGY3pmvf0S6Yp1vruCWAa9bK9hHn6NUV/w=;
 b=hOFqrkG+T5bXyhHvk5Cp+pUsNQJB4UDHUYh6VMIyttG8wfj34fSvLh7XEuAXuD4bxO74ycgw15kpACz5FBIAo+QcOm+O67aSnb52MUbLxCYf7ShfJ+nK9CpV1YuJwC7lmoCrPnRTFYrQt7Ri3duRNUSLI05oXOnq7Hj4jF4n9ewbCujGnORPhx7/NG/oJvzpPeGoN4nhv3CI6cz3rdXsoEqIjwtlJIR/z4imTkTHrPMx8chzMLwF7EL3EoVQB0EjEQ21XXLlNLEIWCaBS+Q+lCpjgiHQtDOyiD0kzzo6l2RHT0NzhWhyzuqPyyqG6XTEfEmWD26qzZ/dYk3RxIKXog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayDh3uzwYAGY3pmvf0S6Yp1vruCWAa9bK9hHn6NUV/w=;
 b=cDHr9+0cqu645vzKEf1Phhg0wQk6eRD1wtGyZRiAkaIdiovGXTZrByklIXLOKSzo+gknVEitTTNAyKUlgX3O8yjrhLZjPe4Gd98h5OQ7m0MjdKfVGo9wpcMamuU9dcKSJRxaBOsDNT0m7z3Xzpuy97p2QTZr/DhDBIwUXT3dIaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91b5e121-44ab-0b22-af9c-f13968ff3979@citrix.com>
Date: Fri, 3 Mar 2023 10:25:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: disable fpu
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677838213.git.oleksii.kurochko@gmail.com>
 <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>
In-Reply-To: <1fe0c827b9e5c2fef569e25ad7ca377111228d29.1677838213.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0477.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::33) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d68d4d-3f3b-4340-eefa-08db1bd1aafe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gBXJQDhEwXlGEiq/vdFXORRMsIzJUtcVTbwqUot2ADo7MBRwdU6s5M5RQd13rhdAB2DGJ8eJxRrmej0nz4bMUj2CoTTQyB0M+oXziHqVgFQcMviDAKl9XhTWfeb7e+uaZ6YyFMRGWe+c+Vo5Lrf+LEkmeoOEFF5dIWu6Z6WXI3oE3gfq2sNVpXBSukBs5WDyOb1ONNtSV5iumcullUS6oT+uyQXCERgWR8eGHJZZH8+GsjOj6ScQ2YAq4eY74QlJPQ0lEXbiGB0pKvQK2z2lb80L0JoURPMIpTKnlM+rLU9rFDtRwh9m11lZtr88SeEiHZO+LqPuyYKFANGBlUcf6GSGKWjcLGu7d9IKa3aOv2JDOKra4BuQ090CwTNz8vaJEixAuEJApBxnpLqrimjBj/jgGuS9uCM7lYUTacfw55s3BDj+xYZrPz7QcneMFd1KDITn+f1hhBwhGzralix4p1vkq2gMAOwSVI8VR8A1baDdBBD/MUplF8dBcWpnkISdcWV1Psnt1E/HmOBaLZ2kuvDnkdKjhs9FVZnqlsXGUMVZdfHNDRJb7GqkJSibX1XHjoLpZQfbyIkLauLpMpALTFshYUemCtHkoLfMYpg9Rzr2SDsh10eUmXj1jusa2lQPulIVbusI+l1bughNVsCgMBs2wbMmMS2W11fMtICyWUU8bZ1CdtE4f3S3rt4a1q9n8M1UNyYzO4/G06W8eFJy0J1xJr7/4X3hxTN3avAg++Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199018)(8936002)(5660300002)(2906002)(31686004)(66946007)(8676002)(4326008)(66476007)(66556008)(41300700001)(82960400001)(38100700002)(186003)(26005)(54906003)(83380400001)(316002)(6506007)(6666004)(86362001)(31696002)(6512007)(478600001)(53546011)(2616005)(6486002)(36756003)(558084003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHlCRlg5WmlGSk44UEtKS1g1a093b1BBSnhvcXh5ci9HckgrazYwRTJRVVVM?=
 =?utf-8?B?SzNqcEZMRHNIWnJwL2RYdWxBck5yanlQdlRCbDk5eTJYd1JWVitrZGZOVlhW?=
 =?utf-8?B?RFlmNHowc1l0cC9NWjRzMnUwdlVub1RPYnlrTEg5Tjd5SURwUjF5Q3Q4WEJZ?=
 =?utf-8?B?UU01bmg0TVBWV1E3dlZRcFg4REVlSTNsd1pneFo2TjZLRFBMMFdQVEZRV1Y3?=
 =?utf-8?B?TTRHVG9LRVJOWmtYYTNXL2dJMXJCQmFweEU2cDFvTkZOR3VVRXNSaiszc0h6?=
 =?utf-8?B?TzdaWFpBUFJTeERCekF0NGk5MGR1aWFzc0V2ZWxpcXJPemtzbGFBWGxlQnVF?=
 =?utf-8?B?Qmp5Z1dEcHdzOGl0aHNiZUtqd3MrRjduUmE1bzl6V3R1WGVET2xZS2ZEUm40?=
 =?utf-8?B?L3B4emV2VERtd01GTW1TdWlwSE80U3VueGpDUEJ5V1ZlZzdxQ0FkWmNpVXho?=
 =?utf-8?B?aitmT3RiWEF2VEZZR00wQ1l2dlRZYjlYWkdWdGdqMEZZTlBGWHNta3N3QjNs?=
 =?utf-8?B?RE4zdGszdjVmM0wySVYrRTFSditza0RaYkI4MytBaUdFYks5dFEwMFpHUytt?=
 =?utf-8?B?ODhLbFE3cVpPMDlsRXoyajZUYVZjcnVFbGx0VkJJblRycDB3b0E2SmIyUE01?=
 =?utf-8?B?NXUrejA2d3VjZTJhQTFmNDNldGxRU1JEb0liZVBJdE50ZjUxRUV2dkx1Mkpl?=
 =?utf-8?B?Ni9FL1Y2SUFiZWs3ajJoVzRnUGh5ZDNEYnhMS09YQ0psTlEvVHRIaVZoSmVK?=
 =?utf-8?B?VXVKTHBoN1FqeHE2K2ZDU1Y1K1gwQ3cxU1lsTVBlcWlKNHJ3cThoM2dxbnRQ?=
 =?utf-8?B?STNlWkNUUUVlRWtZbnZLbm82NkF1S0x4aVZpYk9hamsvV0M5MVZySldFaUFl?=
 =?utf-8?B?TXZYK2RmUXNSbXRSdVFQalE3WkEwUm5EMmV4UmdiV2pDRW9JZUVCRWg2WUpH?=
 =?utf-8?B?VzRKR1JXcGlscFA0R2liS3lDcVMyRHcwaUZYNTRLaWhmRkpuWHNBK2MyejNZ?=
 =?utf-8?B?dkU1WXdWVElmd3VJZGZuNXFJdytrOUtnMTRaQWlOQ3hCVk92ajZXTXZTcEM4?=
 =?utf-8?B?VDFGSlhtdmJwNUJNdHpOQTBablYvV2hDcGUyM215OW5NNmNBOUFBOGRlTmdF?=
 =?utf-8?B?MjRadzZ1WVV4djMxbFR3Ull0QlJBZHh0dnIwTkFiYjh3RFNRYVhUdldYSWh4?=
 =?utf-8?B?KzBhYWlaQ1Z3OGltdkxlR2VqdVFrcEFpUEtIUzZNUHRGVk1IN1pPd09pYTl6?=
 =?utf-8?B?eE8xK1NqOG9pK0lROG8vOXVFY2dLK1BtT3JaNGpiYTg5UnlrWGJQcldjKzJB?=
 =?utf-8?B?N0FGRzFETUx5NEN4MXZzYlYvZ2NKS2wvZ1pZZzNwendKOGxsK3VETk4wdFI1?=
 =?utf-8?B?WG0vWkFPQ0VpcHRzODVHZWhqRlVuc3R0UGVPUFgxU3Brb3FsSHE2NXZWR3dW?=
 =?utf-8?B?dkhpOGtDS1BSbTZ0S1VFTDA3V0FqR245am04VWtIOXJtOEpDRmRqR281TytX?=
 =?utf-8?B?Ky9MeDZiRmZuQWM2dnd0RTk2UkJ0RXp5eEdKOEVFRmxGWGdlVEtuN3ZWQ2dU?=
 =?utf-8?B?bklXeDdiZWdlMU9sRGh3VE9hR2hQZmdtQUgyYXJiWjcxZmtaK0NVcTdzVEZp?=
 =?utf-8?B?aERIZTZuZmdkaFUrTnVJTUlpWjc4UlM0d1BoOVpDS0duck5TRjFRWVRhT1NR?=
 =?utf-8?B?anVEOW83S05FcXZEY2h5bG9tVGFvWm9pQjh5YmE4YnhFakZBdDVlNjk0dE5l?=
 =?utf-8?B?V3VWS3VsTzZRYjJvUWk2TmJEMkxNVnFMOEZxYW82N05aaC9XR3pTL1hjdkxL?=
 =?utf-8?B?YU4zQ3RUdmlZSDNTUDc5eUZTY3RDYXV6U2NWUUlBOUM5NHFSWWFGNE9UTVRM?=
 =?utf-8?B?T2I5Tlo1MDdzY1JkTWlyT0JpRVJXaVQwNEFQc2NSQU5ZZDBBL2lSYzJISEE4?=
 =?utf-8?B?UHMveTdVN2VUR2hEVW96c3p1UGlZei9qU2E1ekVKMDlDcGRGVGRkSnpmaXM0?=
 =?utf-8?B?Zm9IN1VwOXAvTyttdGt6K1RTMmt6UkxUUCtFTmhnWFgyUkt0YWQ3OUQrWlB2?=
 =?utf-8?B?Ri9iZHRaWEZibjJLSEpHU05wd3M4RDNFYUVZa29UTjBFUHhJKzRWZlhuekhF?=
 =?utf-8?B?Z0NjQmhzcDIyTHhhM2VtbEYzTVFuVW4wMzJ4VzNVZi9pbjIrYU9oZ2kxTUdF?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QLcL3hbzJ1XanPMSJl18AaXWkEOtfScfzUF+aQeswHrG0DDtCm9+gMfEXriZ2Bsl3Ms9s5BicwBiXcKlsu63VUKxPPKUOFKTj1GdBaEkX8UezaeUOAQolI0paencIp+8/8sZv/StT9oxxbZQmsSxLbxdHjAVfjvYtgyAmfajgxqHuDqhJHWR0Mq9cCfBPp5gSyKKwP8yxbYc8YepvATIuZsE3Wtu1kA/LLzgje4ydvAtuh1fNPCj3hmvJVrvuX1ZCJ/dMHcwbMs+ZUn7bjBlGKWEbbynbpb07epEonsAOHYnji1tQewpHxMDPcVGbmQWmCU/TL45Q6gCpwhn06mIViorx8bmkKqrwcC39WJnSt9ZohAnCsPL2uajiop+RQMneTQ/QCva5sDtKrdUrThulkj8Zq8WiKdIduoFJ4ZKo8J8g2ZJKbl6fK0GcYDQDhG8rqKMSKoM9MJ5doKDWQgmwCr28h74BiC4B7QJdxbQJ4UHMkucxP4ZgARl8rQIfWKfUeneyXUZdKvDstidV3oXHn9XKpXb2Bb3YFJ8BL4oxYGNwPJ0yR1KNXBOALkhwX0fnDuQuiaeLkToESVHMQ+NwT5I0V9pmykcrHj653zY0/+VzuDHK/Gw0LFc+4ceGvlGmCeRvPzrrrqE1l8q+XF0t2Gc7tIB0dJhpZh6Wp+LHc7pwhhsaPjg8FCjcO/c9odOJldxDG/JdXJcK0jV1oDabznMOq5fvmTKWwm4NIOs8Z63PwBR+2N8XCLQ6zIkWw6GmO/Tx4yzSb9mRu8AqXE/dZ6NTLlPxUhCT5VNCKKJL1kdq8QQY0gpi4MQIOj3H1GQmHivVopbTiEI8Q5QKbbBqwQbry1NykmkeAOMRm+p5onHb2gROhwQpBAgmD94QyCWGoroq1kQ5f+SfnpCS1UyZxutGJ/aggshX9nt2m+nn/I=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d68d4d-3f3b-4340-eefa-08db1bd1aafe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 10:25:53.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdVwrlrn5z+s/Ipt8oDNVLlAJOBFmzIPxt2fGM0wlSPsAvloMaWNzlpvOCUM8jhoGkeBnIgIYCCwl+DcJI0hU+kDB6PqwGsSIbNJHSLQAQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7134

On 03/03/2023 10:24 am, Oleksii Kurochko wrote:
> Disable FPU to detect illegal usage of floating point in kernel
> space.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

