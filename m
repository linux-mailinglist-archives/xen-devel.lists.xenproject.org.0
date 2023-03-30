Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16B6D02B8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 13:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516605.800996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqEZ-0002rD-L1; Thu, 30 Mar 2023 11:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516605.800996; Thu, 30 Mar 2023 11:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phqEZ-0002oi-GV; Thu, 30 Mar 2023 11:14:23 +0000
Received: by outflank-mailman (input) for mailman id 516605;
 Thu, 30 Mar 2023 11:14:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVKM=7W=citrix.com=prvs=44691dd15=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phqEX-0002oc-Eb
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 11:14:21 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02e1d2c6-ceec-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 13:14:19 +0200 (CEST)
Received: from mail-co1nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Mar 2023 07:14:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4967.namprd03.prod.outlook.com (2603:10b6:a03:1e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Thu, 30 Mar
 2023 11:14:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%5]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 11:14:14 +0000
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
X-Inumbo-ID: 02e1d2c6-ceec-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680174859;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SK09N79CEU7oRYhY8D8zf5d6hHz66Yv1xLZ33C0vvwo=;
  b=dhjNONg7mN6bBc1rdPVNYl6eOWbz8xz/pyu1HdzsvP1gw3xnB1ae/2/N
   nA38oOlATiQR0tJJddqkchm19npI7ptBcc63VzhmNKilIANKu5AMX9oMy
   9+CGgVDkovmuo2+HSc/U9bAKI1eBx0JtrZfcisyZ48RvSR4b64RXBWq4x
   Y=;
X-IronPort-RemoteIP: 104.47.56.176
X-IronPort-MID: 103690479
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RCLwS6oFxG6gtakPwtnhekSE7bdeBmI1ZBIvgKrLsJaIsI4StFCzt
 garIBnUM6uIYjOked5+aYnl/E8D65WGm4drQQRr+XxhEyIR+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WNwUmAWP6gR5weFzCFNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADEzZyGgjrqW+uiqDapjucgJEvXWBbpK7xmMzRmBZRonabbqZvyToPR/hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jearaYWLEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhrqU00QXPmT175Bs+cFfno8irimqHZfVAK
 0xK2yMRk4cAzRn+JjX6d1jiyJKehTYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQCx
 lKP2t/kGzFrmLmUUm6GsKeZqyuoPioYJnNEYjULJTbp+PHmqYA3yxnIF9BqFffsisWvQG6uh
 TeXsCI5mrMfy9YR0Lm29kzGhDTqoYXVSgky5UPcWWfNAh5FWbNJrreAsTDzhcus5q7AJrVdl
 BDoQ/Sj0d0=
IronPort-HdrOrdr: A9a23:5knNNqoffGO02sZ+AMRjz6IaV5oNeYIsimQD101hICG9JPbo7f
 xGuM5rrCMc7wxhPk3I+OrwX5VoJEm3yXcb2/hzAV7PZmnbUQiTXeVfBOnZsl/d8nbFh5ZgPM
 5bGsAUNDSaNykesS+V2miFOudl6MWb9rulnOLPpk0dNj2CqJsN0+66MGum+4FNKzWuzKBWKK
 ah
X-IronPort-AV: E=Sophos;i="5.98,303,1673931600"; 
   d="scan'208";a="103690479"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRymO97001nInZBy3t8oKnb6CHL/RPJtimFIyrNVXCih0jovLvd24bvf9cB/VhpCmyeFgysw9yxNobkmX9nOMTUl42B2FgdwujGGDEndK01sEazpbENL6lO+KMTR6ik8M5Mr2WQ/Q5tovMJr1QI5S5ul7P097jkXx9bgLUVgEQEsTkGUbUOy2PZEPHuSgvSVbhMlzVdDmKerVobbiZAByr1tJIzO9aS7tgU8CJdAGPuIRhEZ8LnMStsDNDbyy4Pc0cEefUTd+A8r6yuRjSlnQnfhbzkRVb1H4S887okx0fVU6j81pL9PuQlRWRMnVllrtytfmI/mRc5QKnjYbkjnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhNx8PX4bDPRSPtkhZ7xPTv8UTfYv0sCeUnx9ZKsqIA=;
 b=gPagZIXehqemGRnkgT2z0joUEuKofZwKFRVnZv3iNCi5lil2uQ4lWx74hCnv3nL/pGg0KL2dgKtOfyVYSFJZri6eFaq9z2K8gAMx+TxibZhpl521+Jzs51fIEDnW1mrfIMan4EtxYkZ0me19njwF53ohOWfcC9JFdBCP9h7bFqH1yN2+OV9HqtD5qbooZCsRN1hYBieM+fJJLbZEFkH2SzFoGx7qD+hFduflXOQ2Yygl5Bq1K81w295JUjoTmp/wmA9JnIzc5oP+7BME06skWSL+lrYfFvoGieDDXvk0bD7s6VOhzjwVz4JBcDfqrKXaTTopZYxDShZo4jYTbPuNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhNx8PX4bDPRSPtkhZ7xPTv8UTfYv0sCeUnx9ZKsqIA=;
 b=B4XCgM49aQRnglJX0Z5QFhJ8TOeg0RNOZWP/0u4PFVGDM8+x8D97eJEHP8u929CO51x7SmFg9yVfbmQIO9xogypDPDPZe2vrWd2vGXGGeX122nNoPvzrzDkABj1mhAriEEbsgg+G/EiiFKrzXT52TLz0o1Zi8uDnLoNW4+2oZQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6f358a18-2f9d-8367-6678-328ef50c331e@citrix.com>
Date: Thu, 30 Mar 2023 12:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86: Merge a domain's {cpuid,msr} policy objects
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230329205137.323253-1-andrew.cooper3@citrix.com>
 <20230329205137.323253-7-andrew.cooper3@citrix.com>
 <b111d60a-5f83-1ab0-3c10-84e9fb743011@suse.com>
In-Reply-To: <b111d60a-5f83-1ab0-3c10-84e9fb743011@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0116.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b69d0ce-5a02-4615-c55a-08db310fe517
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UUjjYuthniszMhw5Zx9BienDeYo7HXv/0OUVL1YnOlWTuSYUFAIb6kWDa3G+MWCk4ZHI+M9LFdEE8+iBCQHaFAG8fa4+aG6ssE0MTTB+wFwNMuZvOudfKjKJ/2PEx/+S7g4be+bmljorB5EGeTAVjoY+CiCBRHvZ8TXjOhXIWFmoigR0GW9kq1t1EV0Hz4lmysArz4GRomOZNZ8gHM1rdl53/vP4cvA+FHhIbfax05iKj7g3DOCAoAhx9y/h16V7DoHW48idsKWlTuv/D00XTIsbdbfEV9qQTDMlFjAFxDfUHawEbkjQ2lJ5hC6oap1x7sIl2Nwh/vDiEz8s/eG2eRi6IRdE06eZbANLkUSDLm02ThcdnzKPS6M1krXIXqhVQdRZb+3k8fJVVlHf9LO1UTBMQS/hLUv3GWBEm4gcr5u8cTDPKftrB+t2bS36Mhki52+QCBsR1k7kjRSRg95TXLkN1dEwR+q7aVdWCgQngGtLtpAVaZPAEMimM356UKd5wPTCz/rR7rYl9P/rq8tW/XTG6eulCUP3lDPFH1ZJn4Qxtq+h5fcYW6fxlGP4IYQtmVp8L7s86BemRQvB928UtyukHDH1p0BYgBirh4TPPDjNbt6cJg76IeHza9EKsUp5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(26005)(82960400001)(53546011)(478600001)(2906002)(38100700002)(6486002)(5660300002)(2616005)(186003)(8936002)(36756003)(6506007)(54906003)(316002)(31696002)(41300700001)(66556008)(86362001)(66946007)(66476007)(4326008)(6916009)(8676002)(6666004)(6512007)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlRwdTV2NElicWpBanBwckNuMTd5bE9JdHllbFF1anM3Yk5YQW1zeGp0QUNl?=
 =?utf-8?B?QmFuS0ZQSkgxbjRnd1dhaVBJSDRuY0dyYUp1WHdSb3hGdGFaRnRyQW9RZThi?=
 =?utf-8?B?M1dyOHNaMkV6NE1BbXdYejBYSi8vY1ZXM0ZpMU1ZMktzU2JjM1RUc1FDL2pN?=
 =?utf-8?B?bFVsWS8vM01tT3pjY0V6a2pISVZaUFRycFpPOWIzVWFjWTNxemFRaFZGZ3k4?=
 =?utf-8?B?b2ZRL2QrTHZ4U2RhVGtBN240YUovTGNXck1GNWpidUhkb0dyVGF6cjlaaE5t?=
 =?utf-8?B?MVU0VGsvODZhbFR5c3oyMnJTY21hQm1PY0tZOVpqQ3VldDhqcGVnc0dEajhY?=
 =?utf-8?B?WVZPYUdPdk51VTlrVSt3VHZ3MU52cUwzZ25rNzJtV2FTNDl1UTRpbVhOM213?=
 =?utf-8?B?YkVtSnJsQ2Ztb2VFc3dTTVd0cjFqRWM2SVFKaGxnTFpKTWdtbUYyVjE4SGoz?=
 =?utf-8?B?SWtueElEQytJTFM5YVE3ZVJVc3NrdnJuVFNSYnVJN1E0cFNsS3lUSit5VHUr?=
 =?utf-8?B?TmRJTGxFU29VeVpVaFkwOWJ0NjlyMU9sd1NkeGx6akVNL1pRa3BtaHNRQ0g0?=
 =?utf-8?B?bmdJbWdkQytaS3JlTXlTb2ludGNLY0pJeFNLeFRnT1dMeEo4MHlDWjdzMjJZ?=
 =?utf-8?B?RE9rZjl3SXRnMU1WV2d3RWJoSldobzFvWjN4Lyt3cEc3VnRvajBYY3VacDd2?=
 =?utf-8?B?Y3JLKzNVWVZBQ0UrUDBlendxSVdwaU1XcVkzbHdZeTZhT2dqalVjOEcrNk1j?=
 =?utf-8?B?YlpxakxnTm9aQWk5UmdsSDZhUWtka2pBK0U1YzRhaFVhRC9paDZvMVBHd20y?=
 =?utf-8?B?ZTdCam4zWVQ1Q05oV3BSWGFROFBkTWx6T05jRFJFZzE1OG1hTTBmU2FsVndj?=
 =?utf-8?B?YTR4TE4zYUdnMGhtamtHK3ZDbzE1cVl5ZExuL0VzMGlhQVNWL2RJT1c5ZUdr?=
 =?utf-8?B?VGd2YzFaenRtRkQvRXpEQUtWRjdORHZ1Q1VtTFgvZk8xRlFhRmFFcnY4cm55?=
 =?utf-8?B?NGk4b2E5cmVzaWpOTkt5TUhodGEyU1NTTFd4WnN2UFVlOCtTQ0QyQlBnZGhk?=
 =?utf-8?B?cFp0MHdtaDdvd3F4SXNXY2M3MUxXN2JFbXRzTlJtVmREa2t5ZmFZbEFwRC81?=
 =?utf-8?B?OE9KWnl4WGx6cm9WSmJYaGlPQ3RhRGordG9USnRsQkJUaE5mayttcTZIT25N?=
 =?utf-8?B?SHVpZ3Y0QXMxbkRSZWMvVHAxNndVT3c2V01ybGxXcGU4dnZYcGxkQmJtOFJk?=
 =?utf-8?B?OWxzNVpzYjJIZkNmSjI2eVVMaFdvcWxMUWtzbkk3eEpHc1pVUUNYYmpTSFVN?=
 =?utf-8?B?TzhJeCtBWEVMcXNOQi9UUzN5bno5K25zNXhKRWdEWkVtK0lEczFRRUc4L09l?=
 =?utf-8?B?Vm1HK2s3VStIa0lnb3RqaEJaQWpFR0F3c05HbWFqQ2FTTmJJQ2lKcDhKOVhP?=
 =?utf-8?B?WkRBZEwzL3RicGprZnJMNmZ0cUx5RDk1Sy9OeXBZRm1TcWJSZjYxQVlodERR?=
 =?utf-8?B?b01qS3lJSHRNUThXRllmanVYYjIwU1NzcVdpNVRoc1hFTzd6WFpVY2NoeHc4?=
 =?utf-8?B?THdTbFhKZmE5N3lNWFdEcWhUdXpVdzBDSEN2MFFWbEpTLzlnVHExbWEzNW1J?=
 =?utf-8?B?S2VGcThYYkJXcEJicGhaaFp1YmZRUzd4VldZUFpybXFxd1VFWkE5dGt4SGdT?=
 =?utf-8?B?SThqa2dmLytlaHhlWUdvcVVuVndLa21UNVhBcHJaUjBZb3lCK1dwZng1aHhD?=
 =?utf-8?B?RjFqamVab1ZnSk56d1JSQW5qWlZaVzFpVXhuWDhYSTRZN21aenBic0s4TlU5?=
 =?utf-8?B?eUhBUGFFR2V1WTJ5QjRSUWhIUElHMmlaWi81akZ3MUJGMmdOUTdLY2NVTTFI?=
 =?utf-8?B?M1ppVnhwTEhnb3lKMVU1SWpOMDVXSGsxVHNSMHRyQ3hWdXJGVkM0RE1mUkxv?=
 =?utf-8?B?UFJrS0FSekpLZ0RudzkrdGF0Q1VkYkpPQXdoMVB1NVorZGk4bHdkWG5sdXRL?=
 =?utf-8?B?Z3JySWpHTjdDNldJWUhVci9TSXJnczhJQ0dqN2paWlllVjM4TzNSY1A2L2Vl?=
 =?utf-8?B?Q01nTDBsQ2F4bXljZ0c3a29iT2hrcndTRWo3MHhkSG9JMHJTQ0tpZGQvT09I?=
 =?utf-8?B?QWk5VWJ4eWE4TTlVdFpzTEVuRWFKRjFvcW9USkFEUmhOUXVyUWJycnZ5UWQv?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nitpXrNyOiX2mQsByGZrC+S77DUqV/5p+3FHJd748zT7OVTG/m1cjVzoxed1Vf/jJO0FmE4tFZmf285xwuMZJBj+aQGCrExC22FRtYZtkxcn1696bKPWGzQdUNc9zwpEys1D2O/eqeIBSC6AKmB1AN0EaRsfaQN9QT5zXhTyftaQxMlt+KzeMCn+dcgSzoi0ur6N0MrLN2I+EphnOeUt9hucAujdPt5sWI/AFS081Th9uW+5aQe1z7waVC9AeGOXNWeaOJkPWO0ae1nQLYV5n5UiCgVB5dq0px6s0Ygna5radKnI8UiRR/fGDKwhfmLAyIzGjs6u1zK/sRUNXD65ivkOJIKpzaPH5i3WXw0oTam3sL0MUh4k3VsD8vT3v74AKLIz0tn268YgaHTigT25jc4VqXDUtKEBDqCHlo6xwJNZRtHKiJFg4b7ukmAfOEpzrkpn6vbJ59Kj/mv3QliXPkfxnkl4WPhU6ttJFWjIQoJ2DA/UMrsqYAnW1D7yOv84aDfyCJYbbhsmXkPUlmlLBDBBx38vNDfK2RU1916J1HQ0Yn0Q4x+niVaA4O6Vp2tw5UPd3j4CYbgRcjppgOdjvAAuUYqX1HD9iqE9fGlv924776p+3bbjOaWW1dhyiDDOZFNUXCHoTeazKUiRU2cHQV+gdfjUv0Rumtt4WP+B9JSAMjmGRVmJ+oOp5ANUZtA+g7NUZ2KAhGd/GMTy1dK1bvzPmCHgYVGiGKO/56EOBiM/lf1dRF2GhPVKGB1pxMuqpzKfYBoxllFovF0x9o5afBMqhJ3vlmd9BnHI1fJy3d8ggqhuraH4KeP+9wQjLPM5JA46ecZ30epQLGJYyqH9HA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b69d0ce-5a02-4615-c55a-08db310fe517
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 11:14:14.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6gxzhFmD2RkFc0DFQ48SiARgdHY5anmrAAiyNLCwoS0SRHqHII1/4GC6BpI71bty/acs4iR+zL5c7lFoJ79ZmdAw0U0UuUDg7/kIiSDdVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4967

On 30/03/2023 11:00 am, Jan Beulich wrote:
> On 29.03.2023 22:51, Andrew Cooper wrote:
>> @@ -573,7 +574,6 @@ int arch_vcpu_create(struct vcpu *v)
>>          /* Idle domain */
>>          v->arch.cr3 = __pa(idle_pg_table);
>>          rc = 0;
>> -        v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
>>      }
> Is this intentional? It's a vCPU pointer here, not a domain one.

Ah, no.  And it answers one of my TODO notes that I hadn't got to yet
(of why MSRs was different to CPUID in this case).

It looks like it got caught in my `arch.msrs` rework.  I'll drop this hunk.

>
>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -40,11 +40,11 @@
>>  static int update_domain_cpu_policy(struct domain *d,
>>                                      xen_domctl_cpu_policy_t *xdpc)
>>  {
>> -    struct old_cpu_policy new = {};
>> +    struct cpu_policy *new;
>>      struct cpu_policy *sys = is_pv_domain(d)
>>          ? (IS_ENABLED(CONFIG_PV)  ?  &pv_max_cpu_policy : NULL)
>>          : (IS_ENABLED(CONFIG_HVM) ? &hvm_max_cpu_policy : NULL);
>> -    struct old_cpu_policy old_sys = { sys, sys };
>> +    struct old_cpu_policy old_sys = { sys, sys }, old_new;
> Interesting name, but as long as it's transitional only, that's of course
> fine.

Yeah... it was the best I could come up with.

It does get removed in patch 8.

~Andrew

