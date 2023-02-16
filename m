Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC4699408
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 13:13:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496508.767278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSd8X-0006Fo-To; Thu, 16 Feb 2023 12:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496508.767278; Thu, 16 Feb 2023 12:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSd8X-0006DI-Qj; Thu, 16 Feb 2023 12:13:17 +0000
Received: by outflank-mailman (input) for mailman id 496508;
 Thu, 16 Feb 2023 12:13:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSd8W-0006DA-5u
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 12:13:16 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47dd7826-adf3-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 13:13:13 +0100 (CET)
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 07:13:04 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5083.namprd03.prod.outlook.com (2603:10b6:5:1e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 12:13:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 12:12:59 +0000
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
X-Inumbo-ID: 47dd7826-adf3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676549592;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PXAHdz+75uBzY9Um+pTU8leXVzzVkK+0toYES2GeopI=;
  b=DaiKYO/8IYIO8gEODpx3XNrsZsEK3KUp9OGMxVh9Wwr2MxDJ45Y+G50W
   F77tyWU3aIzrA0A5zGjS197jA4xBqsZzMOrYtqubQf2jyRFd5w8E8qxEn
   AqB3mHn45QwVudea3+LJi8ZQtHz6XUOWh9uir8WZyOxpKOvoebXLa5w9G
   Y=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 99715687
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:hnCBJ6xgDwyfSgc+vPZ6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkVRn
 DZKWj3XO/bbZmX9fdEjYIi+8hgG6sfTydIxSVBrqSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPK4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KTBX2
 M4aChtRUh+Oif2Sy7OjVOx3v9t2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMuuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuqCd1LSePoqZaGhnWR3jctCU1MfGHrmtiwtxSUcsABF
 RULr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A79y9pog210vLVow6T/HzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:dx6RuamYbLRs97zFyCLpKXAFslPpDfNpimdD5ihNYBxZY6Wkfq
 GV7YEmPHrP41gssR4b+exoR5PwPU80maQV3WBzB8bQYOCZghrLEGgK1+KLqQEIcBeOldK1u5
 0QFpSXA7XLfCdHZa6R2mWF+71L+ra6GG/Dv4rj5kYodCUvT5xJqz5+DAPzKDwFeOGFb6BJaq
 Z1IqB81kqdkbF8VLXLOpB/ZZmmm/T70Kj+ZAIABVoO8RDmt0LQ1JfKVyKA2wsYUXdl3bcm/A
 H+4nHEz5Tmiei/1hjfk0ja65g+oqqH9vJzQPaUj9QTKHHLlAGlf+1aKtu/lQFwmvir9FEp1O
 Ptjn4bTrxOwkKURHixvRzunzPtyykj8FjrzVPwuwqZneXJAAgiDtZHh8ZnfgDC60wm1esMqp
 524w==
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="99715687"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuUfi296dqqMMhs3k/Bdi/4BZXhDRTWKKmNylRjsn1ruE5w1geMhX6QxSNoLy1jT7EuKZf/yiSCfwDictNcq/nn2DdiARwtxc0eOb1irRoh5H7Tao0euxA5u9jfndr8eUoXYvL/tcBFugdY1eOEolDBM9e+NnkzmLlM6s9aI5MOMcDJrwXricqyQKPRp3aHUUOwePlwgwJZGmWc954a9UhcgzvZ4a11oC3gRsp373InY2YjhN1c275abOsFbZZN5p2zHaCyAQZf23cizCrUhfOq9deMKLZUXknguv/EflrJuDxhycBeRtLg+nxDIbmCvI0KQABMbQel+y/uRsEuDgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vK+IrBghED0m39s9V+gFp2OIx7T+4ggTO8MTQyYNMn8=;
 b=FBc2PvkwQHaXtpM+IirSq+OApujjktseZ6M0ol75Let8e0TlC1STJCm7ikEobxcpjZyVxRppMoZpnZLWYyS5PmAHzrw81QsKCOdQm+4vNrRatcN2bBaY7EDAB+T+1I98yyQeZuYI0GB50dXkjCyYg0DsZtxwOIXfv5gMgAhUKr04Nsyng1m05dLz6sXliQVFiWfNz0kB8aXsFY6Vz2VWptLErtTN5ldkN6eWbectGYxxo78teCONFI0HCuIgsWvLSdoAbChQGAaByeslBazl2X/CLkPU51AsVjV62/Wb/JZXTZyRXd/BUqFs3y1ZqiLW+JyvsjVkyl6YV2VOY6Z0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK+IrBghED0m39s9V+gFp2OIx7T+4ggTO8MTQyYNMn8=;
 b=DWMpccu/NH70GI+ZjorQOBpg6BrNUagDt97PMG1wHM4NgUP4gkxWKSYU6YwuEZxegOH5JZQJQligauBJ1e1MSeyowG/zo1xm4+4cg+otE2mC+AfpG+NGTGR4axFRspWaycZxDW5yQpAVCpFqf+QWgNzIutTxCGWnVlgC1PhFm3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6249643a-ca00-442f-4310-c4fd62db8c74@citrix.com>
Date: Thu, 16 Feb 2023 12:12:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] x86: use standard C types in struct cpuinfo_x86
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <969e851e-5674-9aa5-b00f-4fe4d4cf8e5e@suse.com>
In-Reply-To: <969e851e-5674-9aa5-b00f-4fe4d4cf8e5e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0038.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a56e95-2b31-4c92-6e40-08db1017247b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NYVy0iXVbQBzIa+k/u8V6+8bRgUkPf7O+PbB/6s/BmVWUsYN9p/7yeM1CSm+hAHhjmfVnjlCeS2Sqa9pXD4RJaCLRm3l+eIKx+pPGWfRqlbIGNTcjsttcS2g+SEUptzuhgGVzcJzk0/Io5Y6XZBwpp/xoZtpTVLt6vkFwZU7sD8fA7RxMIy7umjtRgTcdKwGyto/R7b4M5Ko+4ExBUKXuzsNKjTVuPXqxpfBI4pcq5Xhu/Y1tKDh4kiiYr0A+sP+HuG5qaqqIRWSeaniMg8BNfLVc5v9nVg0rNN5BeOTUauvgeM6j30SfwnJuwNNd1waqN67QGWBfmcTOu1+a0PuN1XEFYyYxxNaAwI2y7OKBMCXGi/g8qJMyOFsbHEqN8rSWs+XvkwnqIzBLry3asqAECbZAZvHU7H1VkgWmDXuZbmRFQl+AoZZij8+OYzBvkOs58CDknRSG7V/eAea3vF1d47CLH3KXNkt8/EO3Tq3prioXPVRz99gClX6LJMVCDFeU+/nOSms4BftXtx2LPJg+bnpuCL3/pABXdE6jRNswlqEWYB5ugQ5khTeAbltqDNWTjAQ0gbfzF7IPMfeX8McYvS5z9CjSTfIs18enn9jP9xC2t+gxmKiVYBGcEO9hc5SATY44+iyL0AJhePQYcUO0eQXFxK+jMPGFBdjBl9gzpHrpMerVWFV4mzKRWFv+5/Mfi3e8QjXiEdDZ/EsxW8PckDejICyTZWwQIbhmqD1tXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199018)(86362001)(8936002)(31686004)(31696002)(38100700002)(41300700001)(5660300002)(82960400001)(8676002)(66476007)(2906002)(66556008)(66946007)(4326008)(316002)(83380400001)(6486002)(2616005)(478600001)(110136005)(54906003)(36756003)(107886003)(53546011)(6666004)(6506007)(186003)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJ3YkJDMVVJWm5Hd3dVUjROVFZ1NHQ2bVZ2NXljUzV1Q3VwUFQvdVJqTURP?=
 =?utf-8?B?NzVLMFZ0K3JIcFRXMnExK0xSaGNGSGVua1J5MWg1a0lLWWNXTnJxYVMzMWpr?=
 =?utf-8?B?YlUwYTlJUzZOdVUxQk1XTjhwa3JIMTNWLytXbEs5SXJmeHkwU3JVc1FDakxH?=
 =?utf-8?B?WnY5eDFyQUw4a2Q5ZURrNWdrT01BN2NUS3JMYXRxZWVKV3lLZ0RqcjcrTUFy?=
 =?utf-8?B?b1dKdTlpSDB5K3JsNnBMTktOVUtVWWhBTGpSVjdLZjdyT1pST1k3MWNuM212?=
 =?utf-8?B?b1dqc212R3RYenBvbGZ1OUxrV3FzM3NobnB4OFB2c2loMXIrM3NIMGhka3hr?=
 =?utf-8?B?SXRwNHJGeWs2U003eUM5NHpyU0VtaWhOUEc2cCtBSmZrZURPSzVUV3E2alVI?=
 =?utf-8?B?WHArVFZVUGZjQTVNMENGNGprQm5sc2VrVW1GVDFvVFRYd2lQUk1OZlV0L2lG?=
 =?utf-8?B?NU5IaUp5V0hYU05MR1pOczdzVTB1cnVvSnBsaG1IRml6UEtsUWhaR2dDMEpo?=
 =?utf-8?B?bUx3RXZiUGo0dGRhdHloRTF2N0txZ0dDQmNqeDNPRmFWR1JndnNldW9JN1Er?=
 =?utf-8?B?QXBPR1hROGU3djV3NXdOQkdmSHRTR3FNT0xwdnpsdm42ZVBCVEhPTGNKTitt?=
 =?utf-8?B?Nkg1UW9HVmJseVNLVVV6TVU5N0wvbkFJWENrelY3RmdSdHQ0SzJXbE9oSU9q?=
 =?utf-8?B?T2dtZ09BbVlkN2hibWFTY2laaHhLeG1wNGtGVVk2OUh3N0xrckV6QkJubjhv?=
 =?utf-8?B?Q21pVWFXY1JGWjRmd1NQQlFhTS9XZHJ6SHlWZTRJemp4SVc1UlgyU0l4TWVT?=
 =?utf-8?B?VXlHd3NCOTU3dHJOK09wa0lsOEQyeXdyTTZWK3d4eGg1USt1UmVLaFNGbk9L?=
 =?utf-8?B?RlVGWE9qNlU4L2Q3R0owSlM5MDRpQ281VG1HckdaZFNSenFKM2FyMmtzZnkz?=
 =?utf-8?B?SDVVelJlMWVIbmpMY2tENWNodkc4cW9KQkVEUm8xTVJJTEJIMndyZThHRHBU?=
 =?utf-8?B?NGxzUnpFUklyZyt3Y25veDJCM1I0c2Z4QWxGT1c5ZzFwVkRyK0c0eXFJUkx1?=
 =?utf-8?B?bEczQnpRR1lGSGpEMDBFeG9kQXBjMnpQMEpTV0h4aGxJclBpSG05dkZrUW5s?=
 =?utf-8?B?dGxmcitINWpYQ2VHRzNGT2prYkRSNXpOdGgvbldVYXhyeXJlWHUxZ01UQjFS?=
 =?utf-8?B?WjhQZWh1eGc5eFB4VU9KbDl4K0VaNDROWmw4cWpoUlRGV3E2cElhcDNJV1RD?=
 =?utf-8?B?TzJZTGQxVGt4NUd1TTV5dFRsa0VOUVJyZEdVS2pYczJwVGllL3QxaXBpTElT?=
 =?utf-8?B?dXJzem4zaUVpYnlrOFJpV1BISDczdkZTN2pMZy9ybk1SY0Q3a1NNeUFhQ0Jj?=
 =?utf-8?B?RWlkWEN1M2gvS0RqV2pMNEp3UEc1L0VqV1VIa3ZhS1V6YW9uVXVObkkxQTJv?=
 =?utf-8?B?RVhYZmNkaEJzeXl0M1VlRDhaYitFQ2lLQ2lmTitOS1BmUTdXQStnKzdTODBP?=
 =?utf-8?B?TG43Q1R0MmlTVGpiYVA2T2diSlVoUXlrSEdXbm4zQ0FYRmhYTGZxb1Rmbmt3?=
 =?utf-8?B?NVdrVnY1bHdzTURTTlpVejh2VUVzMTFYQzZYU1hDVVJ4UDhleUtva3ZKWmN5?=
 =?utf-8?B?dFBPS1FTcnQxMjMvaUJZd1NPU2tVT0lUNWdWeTZGR2JUMTVqcTlSc2Zod1M5?=
 =?utf-8?B?b2dOMG12UnhWeXM3T1diaGpCc0xuWVVnL3JzZzloUHAvYjlLMzZacWVoRHA2?=
 =?utf-8?B?TzFOSDhUT1pURkJzdEZqaWx1c1Rnd1c3VXNTWnFRRkcvVmpldDVXM1hSUzU3?=
 =?utf-8?B?Z21PbFVLaVZSRThMTUFCbXU5QXpoQVNBUldjMVd5TnN3dlI3N1JtT0JVY0dW?=
 =?utf-8?B?M3JvemdIUTM2dVBsTDFnOHRocGhuMEd2cm96WHNKNUFwQzlDanBSQU42TWwr?=
 =?utf-8?B?MCtPU09HTzVRYVhHTTIxZVNGWmp6WXllRHZHUTkrdUlGeGc0TVdiNlBDWWJh?=
 =?utf-8?B?OTc2eWFnUE1FUkxjZEJvWlg0dlh6TjltYVl2dWV0Uk9EOFN6WnlGTTFvRm5j?=
 =?utf-8?B?QjMyZEhKa3k4TzdHZmdPbEF2QU5oV2hOaXI4Yk40Wm5vK2tNeXJCSVpHclpK?=
 =?utf-8?B?bkFHcllsV2RnbjBsNlRqV0x3SlI0SGptQWpMY0czSmkwdWFTRzBTdzZxaEJi?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BVNYOVXGXHruqjxpnJ9B4jrg/pVIcoNKu1Qcd3ABMYcu6p8NoLZ2FKszuES+DTJ68HSSBvByGUphRMK17UpRafZy+jLmQ3yeuVqzNO9nKYGSiOTgx6buu+qJj1sp0bnNQ/fuHqT47UA8VsW+gN2khSJ9I6NdT5ZS/Nro8uWnAV3iaN2RXjm4Ba0jpz6c3D6A8eAWDyU5EdrwLobf5tyaTcTaTXK7wmeo8dEWvJAniAe0pYIZJPUQMb6xZJB1JJvvCWEvuuhlFvRQnrcQPg+vvUH7DD7TsBQf0ia1evkW4zPlJWdbV17AZ86QVpTf7A5w1K9O/uDOxEaKHFGcLzzTlj/eoSkD56y03z///DxHrMnnZNI5+TmL60pIwivKOTd2lP7iY4MYXE5rMvTOMra+62wWOfko2PQan0YH/PBLOmWKIMryYRh4YQ6asjpttuKN3OAsDhuADGbHKul46E5uS70wqJutLNpUWNUJq89esJbhBhL4KyxcuGdU7dVa42NeWLqT7QTMIQE3Y9Jc3m7gBouY5oh/QjhhFoWgDjoMm74eNXwfhoT7nd/P2JqWe8dDRIWbzXs+C+q4kH+YXanCCz2OZtiQRmv77/hPn0YhhUExIcYWkDop3vkblkac9spdiAZY1rb6l9ICm/n08Fq1CxcogEGAksrWniTkjJrd2ssA+46iIfYLqSZCdG2HLvmByQ2KrqcQkGzM5+7bkuxBm2bbVebSUNiG+ErE6KRvCvvucImIx06QA/FQT2vaJ9P3h5GDlrmjR5umm+gp/7PxVAInLS+kOYBTAnpwxLc2JZ7BHeygUPewOVsM6NsopmBtuzIIMUneFpUzKnHb9vKrrQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a56e95-2b31-4c92-6e40-08db1017247b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 12:12:58.8074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDDpjXY1AvGXeN5rMI9nx6Tnqse/VNEpojD3t6niEe32lJ5rYwpiCrdsmNMaGGET+2my+XQtWMHqlgHNLDsUEyLvVmPiBxwDivHJl90Dh/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5083

On 09/02/2023 10:42 am, Jan Beulich wrote:
> Consolidate this to use exclusively standard types, and change oprofile
> code (apparently trying to mirror those types) at the same time. Where
> sensible actually drop local variables.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Much like x86_capability[] already doesn't use a fixed width type, most
> if not all of the other fields touched here probably also shouldn't. I
> wasn't sure though whether switching might be controversial for some of
> them ...

x86_capability isn't an inherently 32bit structure.  It's a bitmap, and
all of Xen's bitmap operations take unsigned int *.

Most other things in this structure don't need to have specific widths
IMO, but there is huge quantity of junk here.

> --- a/xen/arch/x86/include/asm/processor.h
> +++ b/xen/arch/x86/include/asm/processor.h
> @@ -119,24 +119,24 @@ struct x86_cpu_id {
>  };
>  
>  struct cpuinfo_x86 {
> -    __u8 x86;            /* CPU family */
> -    __u8 x86_vendor;     /* CPU vendor */
> -    __u8 x86_model;
> -    __u8 x86_mask;
> +    uint8_t x86;            /* CPU family */
> +    uint8_t x86_vendor;     /* CPU vendor */
> +    uint8_t x86_model;
> +    uint8_t x86_mask;

These specific names always irritated me.  They should be vendor,
family, model, stepping and probably in that order.  The x86 prefix is
entirely redundant.

>      int  cpuid_level;    /* Maximum supported CPUID level, -1=no CPUID */

There's no such thing a "no CPUID" cpu for Xen any more.

> -    __u32 extended_cpuid_level; /* Maximum supported CPUID extended level */
> +    uint32_t extended_cpuid_level; /* Maximum supported CPUID extended level */

This does need to be this wide, but I really regret the name being this
wide...

>      unsigned int x86_capability[NCAPINTS];
>      char x86_vendor_id[16];
>      char x86_model_id[64];

These arrays should be 12 and 48 respectively, but the vendor id is
redundant with the vendor field.

Furthermore, we do some non-trivial string rearranging of the string,
and (seeing as you rejected my patch to print it on boot) only ever gets
used to hand to dom0 in a machine check.

>      int  x86_cache_size; /* in KB - valid for CPUS which support this call  */
>      int  x86_cache_alignment;    /* In bytes */

The only interesting thing I can see about this field is that the
Netburst quirk is wrong.  double-pumped IO was a firmware setting
because it was a tradeoff and different workloads favoured different
settings.

> -    __u32 x86_max_cores; /* cpuid returned max cores value */
> -    __u32 booted_cores;  /* number of cores as seen by OS */
> -    __u32 x86_num_siblings; /* cpuid logical cpus per chip value */
> -    __u32 apicid;
> -    __u32 phys_proc_id;    /* package ID of each logical CPU */
> -    __u32 cpu_core_id;     /* core ID of each logical CPU*/
> -    __u32 compute_unit_id; /* AMD compute unit ID of each logical CPU */
> +    uint32_t x86_max_cores;   /* cpuid returned max cores value */
> +    uint32_t booted_cores;    /* number of cores as seen by OS */
> +    uint32_t x86_num_siblings; /* cpuid logical cpus per chip value */
> +    uint32_t apicid;
> +    uint32_t phys_proc_id;    /* package ID of each logical CPU */
> +    uint32_t cpu_core_id;     /* core ID of each logical CPU */
> +    uint32_t compute_unit_id; /* AMD compute unit ID of each logical CPU */

There's lots of redundancy here, and half of these fields can be derived
directly from the 32bit APIC ID.

For the purpose of the type cleanup, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>.

~Andrew

