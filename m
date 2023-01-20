Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EEC67579A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:42:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481844.747013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsaU-00041C-Oh; Fri, 20 Jan 2023 14:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481844.747013; Fri, 20 Jan 2023 14:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsaU-0003zR-L7; Fri, 20 Jan 2023 14:41:50 +0000
Received: by outflank-mailman (input) for mailman id 481844;
 Fri, 20 Jan 2023 14:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vlkl=5R=citrix.com=prvs=3778cfab1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pIsaS-0003zD-Nc
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:41:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f7feea0-98d0-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 15:41:46 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jan 2023 09:41:43 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6967.namprd03.prod.outlook.com (2603:10b6:303:1a6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Fri, 20 Jan
 2023 14:41:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 14:41:41 +0000
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
X-Inumbo-ID: 8f7feea0-98d0-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674225706;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=3LvgxN8E1xCvkab3P++iD20lLsM22e2OAYIDxZ8wvBk=;
  b=YiNIMO/ZGCL64TnmFcj8meZTWCQCYBArCC4LNYJjQLUj8ECJZlBGrMC2
   Sc4+Siw/5sOIqwd8JhBKQKY1azXu3vU8IO0FIIJjw8W3Z693pLLEd/eWr
   1dW2Q0SLdpulU0/05KSuOk6patWkzuC6fWa5o2arkumo7UdMMNUnPxmXv
   A=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 92430830
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:l6AhwaBtdl7SQhVW/yTiw5YqxClBgxIJ4kV8jS/XYbTApDIq1jRSx
 2EcW2/SbKneYjb8e98naY7ipEtS68fWn983QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpC5gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwvfp1WW5Ar
 vEjJGokdzOqjNCH0Z6wVbw57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDe7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6VwXijCNlKfFG+3vdwiV/O/jMBMzo1dGvlh9rmoGPkcd0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJgOtc/Qjvc4yADAvi
 FmAmoqzASQ16eLKD3WA6r2TsDW+fzAPKnMPbjMFSg1D5MT/pIY0jVTESdML/LOJs+AZ0ArYm
 1iixBXSTZ1I5SLX/81XJWz6vg8=
IronPort-HdrOrdr: A9a23:IcMVYqtWqgEkqRPeyAXGcxV37skCEYAji2hC6mlwRA09TyXBrb
 HSoB1p726utN9xYgB7pTnkAsK9qBznhOdICOUqTNWftUzdyRGVxeJZnMzfKl/balXDH4dmvM
 8LH8cRab2AbmSSz/yKmzVQeOxQpOVvhZrY49s2uE0dKj2CBZsQijuQp22gf3GeDzM2eabRXK
 DsmfauIFGbCCwqhhDRPAhdY8HGqtGOktb+ax8PABAq5WC1/EKVwbr2Hx6V334lIk1y6KZn/m
 7fnwPj4KK/9/m91x/HzmfWq49bgd3717J4dYSxY+UuW0PRYzyTFc1ccqzHuCpwrPCk6V4snt
 WJqxA8P95r43eUem2uuxPi1wTpzT5rshbZuBWlqGqmpda8SCMxCsJHi44cehzF61A4tNU51K
 5QxWqWu5deEBuFliXg4NrDUQ1siyOP0DEfuP9Wi2YaXZoVabdXo4Ba9ERJEI0YFCa/84wjGP
 kGNrCq2N9GNVeBK3zJtGhmx9KhGn4pGA2dX0QEssuJlzBLgXFw1SIjtYEit2ZF8Ih4R4hP5u
 zCPKgtnqpJVNUKYaV0A/pESderC3bKXQnHPAupUBja/OhuAQONl3aAiI9FpN1DVvczvdgPcN
 WoaiIWiYZEE3ieR/Fn/PZwg1LwqaWGLEDQIrI33ek9hlTRfsufDcTYciFcryKJmYRsPuTLH/
 KoJtZUD/vvaWzjB5xN0xDiV4I6EwhZbCUW0uxLH26ms4bQJ4yvuujScPPYIbL2CzYqWmn2H3
 sEW3z4IsJc7ke2XGPj6SKhK0/QRg==
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="92430830"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPkiklFfDZIF7aKC4tlxkekrAzkiJxPbsVHTMRSU5kbW7TMH8UE3LYESNmc1aFxQXqK3e9dymNmWlLYpW673M2g0dJj/uYFOgAMC5Jgws/OQQYWXZil+U8FOPey4NcPp3OZGoidJv2qjYNsgY7vh+mDtUf0HFHyiQISWApWABqr/v6Gg8QuYY41wLmjJOTaGtZUWphqVHVrp1rU/F88Sm5NV2guNpgXjFwAd2KOONBimU5EOoQTCyXVl5rqd5N8VmqEUOKKmcuG7VmJMt7dMq+jt2xU/yiYrNaEXwG7R7NZ/JEG384ZIvut/2jsPGr6fBZACL2S1xPjfvIiM+JLZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3LvgxN8E1xCvkab3P++iD20lLsM22e2OAYIDxZ8wvBk=;
 b=UYY+DcE3imjlg/HUHuIL0dfOrtn2vk8bVzDYzlrCVr6MXHHRNT4sELVm1fDjHjI6p+YWr91IXZ5BM7ClH8ga0OXGEzu0SEV5cSmtI6y2ZglHxxnvKshUo3B5G0lDvLFFLAPSdyl4gKcv3+dte06gFWkvnWy/hGGyI/YmJXfxXU1qQDcMyPUV9nBTmqd/tpFhyMLgyToEs/RVE45x5Sixd2HnuVvMU4J68xsZwQ9iMv0yfB7YjNqraxQT5JbbmGpprvQJ1pCRGI4Gf2odh69YKQ1Jr4JaUmtEFYfkrVeJt0m87kBL9Cp4t+XvPHmwrVQ3e6CksLnrj0DIOVWMT+59JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3LvgxN8E1xCvkab3P++iD20lLsM22e2OAYIDxZ8wvBk=;
 b=rotxZOqBSrC1rMufJ36scSVHst7CNsGibSFDquyfWYjAaw0z52iOZrvdwSvIvquRFAgHaZnbTTag+cXA1X2kk37ermm5vRUVnmj7qxsRiEyjEdw1IDVKWCqDT6kETZoM4ibzZmYVojw0T45DYHVzIVU4ZbseBfYH5c7G67Yl5EY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Topic: [PATCH] x86/shadow: Drop dubious lastpage diagnostic
Thread-Index: AQHZLMTJYmmsHN9huU+OUU/Zg+9KvK6nR7kAgAAQrgCAAALWgIAABU+AgAAAiIA=
Date: Fri, 20 Jan 2023 14:41:41 +0000
Message-ID: <bac9c940-627c-4ebd-ea11-823531e3f3ec@citrix.com>
References: <20230120114556.14003-1-andrew.cooper3@citrix.com>
 <f530ddfc-8f97-b913-e838-58cc352f6372@suse.com>
 <139c1d03-2cd8-a7c3-4f79-fbdd5e85c712@citrix.com>
 <1740f228-8821-97e1-6524-6a2ccff6d3cd@suse.com>
 <e8dc6e46-9669-063a-ddb2-b56bdaa97825@citrix.com>
In-Reply-To: <e8dc6e46-9669-063a-ddb2-b56bdaa97825@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MW4PR03MB6967:EE_
x-ms-office365-filtering-correlation-id: 43509dc0-87be-4267-103a-08dafaf4720c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2mb+rif0FWORr+T+576ncjhgf5z9XCgAVEJZMXDtBiCIj+tZFUcM6pWzPjYbSjKEjHPwxc8kHIBVJh80erthTUwoLV44oraDzOZ2ulr42r/6NBZHpPhXIwh+N79Qf2/S9/9HgvHO0K+0384rzIiPWVJFeupv26QmjoJ1bn6WxoJHtskv9kNTVs+4T6TO8MpLDXhy24yMi8fH5qFcf7kmXv9q0ytf/nek+ypYesjuJTWewrbsg6MuFuNPHYGiTtLqPloGTI9zL+7V6DTU3LLj9ehO+xX0T/qHqYUjhj12pMczgiJv23qJ2fcTsF2ClS2O25FH0ttJRYAQNdWdPne/gZDVg36dKnSzNIBP6/0T5x4XANGZ5EbRxeuh5hItyv6ejh5GAmb4ukZjXds1hNBzoGQPFTdlgAWeoxVQzvbxTrCoDKyhAiayaH0GD4WRgpUBxP3hKcOudnj4UYRyym34GC/Sp2Q2oHsSq1C7wKPBJg/LzsgU41nGdvch0nlT7CuqRRHRyZ5mVCQ3LysdJ5WgebXjVN3X4/k/9HQy2gMY+tVcnGSHiZaPoJrJZeq1oPCsY3eaJVrxlBNIdI+Tn6AiyD6hUcu/NfIBzEfifYaZGn9f48F8inOZ4iCdIuFeS9Gp2sH5wdLDDnRdUT0sClwa3mNnGmiU3KPINIi2anS5U23iramVQSMaB46IkmhwSKuI/RnExbjUHagbiaD6xCbXk7LlbNjekPaHDOf7SepdhKT2eJBcTTEcXzw11VRgOG+31TvN8asROq/jwEQmCvkHrA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(366004)(39860400002)(136003)(346002)(451199015)(38100700002)(122000001)(36756003)(38070700005)(31696002)(186003)(82960400001)(6512007)(86362001)(26005)(6486002)(478600001)(76116006)(316002)(71200400001)(31686004)(91956017)(53546011)(5660300002)(66946007)(2906002)(66556008)(2616005)(6506007)(83380400001)(64756008)(41300700001)(66476007)(6916009)(66446008)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0dIeUprRzdLTVZrY2RFcFFiOGRZdmNCdHFtRHdHWGoxNzBzdnpIRWIrTVBG?=
 =?utf-8?B?dE5NWkRxYTJOOUd3LzJ5RGEydjRJM1dXR2U1ekQ1NzJCb1RBaUVha1VLVWVp?=
 =?utf-8?B?OW1xNHE4NnJ4Z3YxV1ViRERvd1N1VWJnNUNseDRVdWI0L0QvdzdlN1NVRXZw?=
 =?utf-8?B?QnE1ZlorYTR2T1hNR3duK0tVYlhCY3RPNnFmUW11MlZrNzZDMXFQRUdueVFM?=
 =?utf-8?B?eW82VVpCc1V3ZWlOeWUxN01wM3pVNHQ4aU9nOHNlcTBONXh6ckxjYjZnY1Bh?=
 =?utf-8?B?YlR2RXJLWDRpY0dKbm4zRmU0WXU3S0doeEkyK2RiTWR3Wml4OHZFdVZJZEMw?=
 =?utf-8?B?ZlduQlZQb1NpY1ViTlRBUTAvdnNVeUpiUXFCTHAxOUhWTHhlckxHMnpweFJn?=
 =?utf-8?B?NTVSKzdQdDFQMStJOGRyc2NPZCtHWFdYcmY0Mm0veVEvNzYvVlY1QWtVKzhJ?=
 =?utf-8?B?d3NhdkdQb0toNnJuSWZaWjF3UC9WS1BxTFJhcWRNbGc3S2xMUEpCTEtSV0Iz?=
 =?utf-8?B?N0JFaVFhVzRRQkFZNFI5ajZCdkl3eGtoRUJZWENFTzVnbm5aY3lWU1JsMGVV?=
 =?utf-8?B?RkFlVzZaVURQZms4Qms0STAzUHZTSnNaaWJiSTJrc2FsdDFSZmZDWnlVMUhv?=
 =?utf-8?B?dk5MUHVscWZ3MjZHaUhvNkxqb3ZpVzQ3SFBXUEJLQm1KYWl4UGdEZm44Qk9C?=
 =?utf-8?B?cFRqa04zUk5nTzhUa3RhWDlnSzFUbGN4UGR4NDJjdjNPNHowVUxhZjhkYi9O?=
 =?utf-8?B?VU1IQUhKdjRJc1RwdS91RWFaamM2N2JneDJtUFdUWmRsSXpjNWs1R1ZBMlpm?=
 =?utf-8?B?bDE1S1EvOStlNkpJSllvOEhtYTkvai9KWFRETzloQS8xc0t1aEhtVTZ6VklS?=
 =?utf-8?B?S3hVOTNMdkJkYXdndDZnQ1Nxblc1QWZ0SElndXQ2SloyQUtNclNCcG8zOVNx?=
 =?utf-8?B?UnBBL1hIVjhLWnFxQjR4azU1bDY1cFpianNJWnpBMjM2Y3NuN285Uzg5R01F?=
 =?utf-8?B?UllLcHdKR21xL2lFK204UzRoUDlnODZiczQ2SlNPYjZCZ1BiNld1OHoxRDBk?=
 =?utf-8?B?NmVJZ2NpdHZMOU9GWjM3aVRKOGZkUCtxYm9yRy9tQXNaU01JdEtEUDV1Qmx0?=
 =?utf-8?B?ejRtelNYS3FMSGJ5NEs2RzFnZVpBbUdFNXNqWXp1VjZGQWh4YmRCSTRja2hn?=
 =?utf-8?B?WnVObnZUK0NqYk9rYWNtTC9qYyt2SjBqUko0blRGSEphdDRqVzM3RkFQb3NB?=
 =?utf-8?B?bGViZ0NYTVp1YjNNWjk4WHp0RHI3aVRialhiRStTczd2SWc3b3A0WWV2MFZ5?=
 =?utf-8?B?citsV004M1gwR244a0Q3eDIrb2hwb0Q5NGFnVGkyWDVzL2liM0tJc3lxczJH?=
 =?utf-8?B?bTBCTVZsbHduMVQrMFVrbkgvS3R3d3hXSnVFaWNKUGtFQzZaemszWDlrM0tX?=
 =?utf-8?B?eWlZUzhkTlBzV05BRTlhaGFvSDFpU2RwV1dlYkFrSFovbWpVcUNsK2F1S3dn?=
 =?utf-8?B?UE5DMU9MZ2V1c0ZNN3o4OGtvV0x4L1kwSnZrTitSOS9rODNiYzVKRWxCdHdn?=
 =?utf-8?B?T01VV3dxUlZMNG1nWEo1Y2dxdjZ4eEwwUGJwdWJCRm5LbHlWSEVDcmYyMnY0?=
 =?utf-8?B?VnRhWTJwV0lTdm9aQ3BSbm5pam5ZQy9QMXcwZWVrSjUrZzRwMXM0am9jOENo?=
 =?utf-8?B?YU1pbmd5c3IyaWJaSmxKSnR6UGk0VjFPT3hNYXExcVJKN2RUTU5pVVpjb09V?=
 =?utf-8?B?UVBrSnF4bVA2cnh2WHAxempjelBjTlpZcFFvbXBvRlhPRFBaQzJVdFV4QTlS?=
 =?utf-8?B?bmhqZ1cwWFJSZkhkcENsQzl1QWVSSGYxbTF2Z3lQSndiYTNmZVN5S0JXTGl5?=
 =?utf-8?B?VXVBRmN4RWhYNG9CcTUranA1cEZmc3d5RFhKb1pNZFlBcDlzQlpqS1JneEpZ?=
 =?utf-8?B?MDh1czd2RVF3cVcrelN3eE4rVlpmTEg0TVVZUTNkTWJqNkZXdVI2bjd6YTQw?=
 =?utf-8?B?bXR3QXVKQjBrS2dRelpnRVhvN2FWamkwc2dqYnlEV0pEYlcxRVd4RTIxSjIy?=
 =?utf-8?B?RWx3WHBobVBLS2c5dU41VmtxREFkNkcwK2Q4UWgyTStvOTgwZWt5cXlZZk5F?=
 =?utf-8?Q?lFNeYYA4E1ADYODPwACRR8esZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F59BBD0412078642A2190FDDC68E26B3@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	61eBmTvgKmMDc8aqTmXX0RQFQm8jXadcfkcGA/PGrUJ0FjWjvseBGad1PrCcKDVShGiuMhGemvQESpTVn/KgSVZBbPwTvjerwLY3nFyqVcU99KBrBeTsVFAeHLoo3X40Z1mwSR3BUSDN9qYTeBRFlPKBarMhc1UsRVc8gUafTqj99lzPc6aFN8iWlx+CkQwo/6krzbUlPQgbEqfXIa/k0sCRvzkgwPKO2Pgb5E2VzbjC4KI+sfCsrEDZUvdEjA2cCYRUi1RnU9Mq89A3410jpbQhaqSddTLsQJD0i8Kk/Bt2CB/i8hPh6EC+JmeTfyBojfSRdTujU3ceP5sW7/8Ttlsq/3iGZuZKnm16kbYGSWWUBAltm8uPDxgCpAoPWi8/dwEMo9vxn+SgI6eUiIQCv6a7WgSc2YfFuGtI3MFnxxi76RmoIeHK3XbJQc5mcKetuIISUqGsACbOORwH43Cb7QW7u0TOznzj9eYgmEkpOxXuHhlB5UpCOFjFZEAc5KQzIoYy4mokumbwSe6fRC/IIp9dhM5jc6ezHlIYKkdIAXhWsWSwZEw4oVgy6seYw/bnOjSOKHpDWBng0b9WYkJu6sMh0tuShu4AWGQioS8m1t5ATxyJbll6nUMCsRWcpQr5e9CEITVzL8xbY5LcTusjD2Ecj2V16Dtc5yyg5feYEQKHwKgxUUhC6uYZVzIFyICgD7D9OX+c6dKmemLHcazOYA5+ieTvE2nRXdpiL3UY9518hQ4lj5EkfiXV8vMy/tUbQ7yUJQd7KvQIu3eVfsKQlg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43509dc0-87be-4267-103a-08dafaf4720c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 14:41:41.8547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H7lxcpvKOsbSYFHOstP2DRwBwI4KM0KKe9HcYY5IBo3h96znw7b7AJKioCmFXCQhDjya0Jq1SXzZml2o2sYqOHlB9aXYauR/aTx4EHEe19o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6967

T24gMjAvMDEvMjAyMyAyOjM5IHBtLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiBPbiAyMC8wMS8y
MDIzIDI6MjAgcG0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMjAuMDEuMjAyMyAxNToxMCwg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+PiBPbiAyMC8wMS8yMDIzIDE6MTAgcG0sIEphbiBCZXVs
aWNoIHdyb3RlOg0KPj4+PiBPbiAyMC4wMS4yMDIzIDEyOjQ1LCBBbmRyZXcgQ29vcGVyIHdyb3Rl
Og0KPj4+Pj4gVGhpcyBpcyBhIGdsb2JhbCB2YXJpYWJsZSAoYWN0dWFsbHkgMywgb25lIHBlciBH
VUVTVF9QQUdJTkdfTEVWRUwpLCBvcGVyYXRlZA0KPj4+Pj4gb24gdXNpbmcgYXRvbWljcyBvbmx5
ICh3aXRoIG5vIHJlZ2FyZCB0byB3aGF0IGVsc2Ugc2hhcmVzIHRoZSBzYW1lIGNhY2hlbGluZSks
DQo+Pj4+PiB3aGljaCBlbWl0cyBhIGRpYWdub3N0aWMgKGluIGRlYnVnIGJ1aWxkcyBvbmx5KSB3
aXRob3V0IGNoYW5naW5nIGFueSBwcm9ncmFtDQo+Pj4+PiBiZWhhdmlvdXIuDQo+Pj4+Pg0KPj4+
Pj4gQmFzZWQgb24gcmVhZC1vbmx5IHAybSB0eXBlcyBpbmNsdWRpbmcgbG9nZGlydHksIHRoaXMg
ZGlhZ25vc3RpYyBjYW4gYmUNCj4+Pj4+IHRyaXBwZWQgYnkgZW50aXJlbHkgbGVnaXRpbWF0ZSBn
dWVzdCBiZWhhdmlvdXIuDQo+Pj4+IENhbiBpdD8gQXQgdGhlIHZlcnkgbGVhc3Qgc2hhZG93IGRv
ZXNuJ3QgdXNlIHAybV9yYW1fbG9nZGlydHksIGJ1dCAiY29va3MiDQo+Pj4+IGxvZy1kaXJ0eSBo
YW5kbGluZyBpdHMgb3duIHdheS4NCj4+Pj4NCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+Pj4+IEFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+Pj4gVGhhbmtzLg0KPj4+DQo+Pj4+IHdpdGggdGhl
IGxhc3Qgc2VudGVuY2UgYWJvdmUgY29ycmVjdGVkIChpZiBuZWVkIGJlOiByZW1vdmVkKS4NCj4+
PiBJIGNhbiByZW1vdmUgaXQsIGJ1dCBJIGZlZWwgYXMgaWYgdGhlcmUgb3VnaHQgdG8gYmUgc29t
ZXRoaW5nIHRoZXJlLg0KPj4+DQo+Pj4gVGhlIG90aGVyIFJPIHR5cGVzIGFyZSByYW1fcm8sIGdy
YW50X21hcF9ybyBhbmQgcmFtX3NoYXJlZC7CoCBzaGFyZWQgaGFzDQo+Pj4gaG9wZWZ1bGx5IGJl
ZW4gdW5zaGFyZWQgYmVmb3JlIGdldHRpbmcgdG8gdGhpcyBwb2ludCwgd2hpbGUgdGhlIG90aGVy
DQo+Pj4gdHdvIGhhdmUgdW5jbGVhciBzZW1hbnRpY3MgKGFzIG5laXRoZXIgZXhpc3QgaW4gcmVh
bCBzeXN0ZW1zKS4NCj4+IEknZCBiZSBva2F5IGFzIGxvbmcgYXMgdGhlICJpbmNsdWRpbmcgbG9n
ZGlydHkiIHBhcnQgaXNuJ3QgdGhlcmUuIElmDQo+PiB3ZSdyZSB1bnN1cmUsIHBlcmhhcHMgdGhl
biBhbHNvIGluc3RlYWQgb2YgImNhbiIgZWl0aGVyICJtaWdodCIgb3INCj4+ICJjYW4gcG9zc2li
bHkiPw0KPiBJJ2xsIGp1c3QgZGVsZXRlIGl0LsKgIEl0J3Mgbm90IGltcG9ydGFudCBlbm91Z2gg
Zm9yIHRoZSB0aW1lIGl0J3MgdGFraW5nLg0KDQpPaCwgSSBzZWUgd2hhdCB5b3UgbWVhbi7CoCBZ
ZWFoLCB0aGF0IHdpbGwgd29yay4NCg0KfkFuZHJldw0K

