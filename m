Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28A722A56
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 17:09:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543764.849009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bp2-0001pt-UA; Mon, 05 Jun 2023 15:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543764.849009; Mon, 05 Jun 2023 15:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Bp2-0001nZ-Pw; Mon, 05 Jun 2023 15:08:40 +0000
Received: by outflank-mailman (input) for mailman id 543764;
 Mon, 05 Jun 2023 15:08:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6Bp1-0001nS-Ie
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 15:08:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7c11fc2-03b2-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 17:08:37 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 11:08:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5867.namprd03.prod.outlook.com (2603:10b6:806:11a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 15:08:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 15:08:22 +0000
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
X-Inumbo-ID: d7c11fc2-03b2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685977717;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6RzyrmXTgr17zB9hZyMxRsfjOTHV0vweo0j7Q6VzrjM=;
  b=LKH2oXuJU5XNDTlR9zE9YH9mdpWT19Hfp6LxWzcvmNxCnEOYlsm+Px8L
   h5oyXjaT4raZA6SoAGIHYO7Gi62Lm09bbGaHAji4LMLxifA0IFbyQVzQS
   tPEscp8qJskvrN14FXUavz1ze5xgc4U+DM4giAyquIkI40I+2OVpLVG5z
   Q=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 114141304
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yhXa/KA3J4/zbxVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApG4j0D0Ay
 mJJCmqEPPyMNGOheIwjO4y0pBtV7cWDmoNgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw2c1FGkBE2
 tckeG4TQA2Au7qHnpmec7w57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xrsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aTxH+iA9pOfFG+3vdp3UbPzFIcMTo1dgalv6aXjFGdBusKf
 iT4/QJr98De7neDR93wXRS+rGSD+AAVX95dEeoS4wWK16aS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65uAZAhn1y
 jGO6S0h3bMaiJdR073hpQyWxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTXKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:crvHwahTjUY7hixEhZVWAT1LXHBQXuAji2hC6mlwRA09TyX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFg7X5TI3DYOCOggLBRuxfBODZsl7d8kPFh4lg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeVvJprY4dvj8w==
X-Talos-CUID: 9a23:CvuuV2zxtdWmkwJtNX+dBgU3MfI+U3fy50uAfVGWFGVVEIzLYnqprfY=
X-Talos-MUID: 9a23:w0s61gRHuGnL4L9kRXTlh2x5aM1W7J2JK2NQj4tZlc+bFnFJbmI=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="114141304"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qp/0oph10Fg/OaJq7mBSwBmLBal/BANdrn8jxxcKsbT11nPJpK9GXhgfXttH0kEmHK4Tyb8uoSJoOuUtbpuzDKzdoNEKiSXbsAPuzhmaQ3lvFhj0O85bJOEMRzlRU5eolc7gDXQHCuGqL5a4u+g/dFhIgAdL5DX8jm9nRJxOUgKa2SizGK9wsS6x/5kgt2D5qBUxnVo7eaWV/gAuLo3NaUmwE9PdYfUPGvipscj201V5r+KDezhsisILJLkK/JwSVH7fZ0gLkCzLL71YO17FEe+SByGFZXGyRWEAvtY7oxlZ+oo/1dKoucTHIef99r8sKvb+ubKJLDIj34dJm7gE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RzyrmXTgr17zB9hZyMxRsfjOTHV0vweo0j7Q6VzrjM=;
 b=l72kEtzwrj3Vdns1H5xC+LzLe3V6K5grNwHE/mldBwZMFNq4fbqHFUNW7x2mmxfH+q4C4obnQooAK+5R3NgyZDMoPxcg6xaFWdV6qCM/7CFSkAtAQZVTLdBc8ctvZMu8SFrqtX6SOZ9An5MpH5Muqq36/tKb6DCZjj6DHUCgEEYtku4J4rFgNk5WRtUq/Wo2h2o/B9go6QMdfWNVVDCISC8eH8p6qg1mjmu6RIbAoYxMGl8lHBM6i4sXsjMYT46d9UxXqQmUrX/PgvdjXr6Vwdx0KK/q3iOYxC4zDTgKx9isJy6LCfiZvMPso+Ge0iKpqmpySiZqlUHeOHNbXRT+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RzyrmXTgr17zB9hZyMxRsfjOTHV0vweo0j7Q6VzrjM=;
 b=IRNoHS5FEXF7PyilTptNtpJ5F+fxzVo8NfIV9HZUiNN1nyD6GLefATLsjT73xU88WljZk9XOJS3N6UBZff9JBRzWd2A4mJRu3Nccx+f8jsar5c+rV59AouLRsf559u+AkdMnPSs0kNgEM0deOKCfnb0hK1twI9qyQCPzcpEKPN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e026a2ce-f420-8dad-1daf-2a354ecfab2e@citrix.com>
Date: Mon, 5 Jun 2023 16:08:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/microcode: Add missing unlock in
 microcode_update_helper()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230605150116.29911-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230605150116.29911-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0670.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1fbd7a-616f-4544-89e9-08db65d6b3bb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ggs3Q/vRE8ynGYBjMpaQpgeIgC28AkJCYxyYlXgLvd8ehVp8Upa3SdDXC7uzQhcPbBWBQ7RZksOgaxvVztFoGGqxZ6huR2wSTrK60PQs4MbsaWI0TSOTrsz6HHPJ6FeK+dAStK1He5zjQodCZ32UTiRQ9r0VwZYjpXPySWsrBJ+2wXZqFDMJWW8rlzoui++/3FxaTTUysuy1fBqTwOwB3dz3OAHnuVswOMFvCQV50D/JBC4FO5ClfiWTMr+2lxPVTi63SAOVotlzPSdHBFlGi2uuY+6WCIo8QNmeveWgp6xo6MMkcXPPIfQYIAonKe5APMSgJSaCJw9SH7JEQutEg20yB/jQplr5wgwT/K+98oHr+rKGEo/Ufl4T0+G8eoTmREhcTWWFS7bS/AWMLg7RUb4NMqvhio3FpkdFTUpqITAvvvF14s+wYKKkyC00f5GReTp7r8+Si6euQRA8fy71RIJShu7jpMD45/62mgV4VpehbSiNYN1AJH2m2KOtSOgsAphfjcNbSyuD5Yyq8gxjgVzRiEWHxIoCv1tTO7NKyJxaEjhLV4z9e9g5RkfyZVub6nm/m7GK5gbiUBFRMeR/+6OQZP4MFhO7p+TsA+IvYZYS8tnSyMNTfBEwvEbMZt5VqMIpuf75DAP5QZJL9fwfDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(53546011)(6512007)(6506007)(38100700002)(2616005)(41300700001)(31686004)(6486002)(6666004)(186003)(26005)(83380400001)(478600001)(110136005)(54906003)(4326008)(66476007)(66556008)(82960400001)(316002)(66946007)(8936002)(8676002)(5660300002)(2906002)(4744005)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXVKenEyMEVlUXBhWlFOSnhHUE5PLzZNSWtVUDRIVkNqZEcyMXgvbVdlR0dw?=
 =?utf-8?B?K1phNkRlT3M0d05pVnRuL2dFU253dTJlUFlhbVh1MG4vZUM1S2w1bnExemhZ?=
 =?utf-8?B?aVdVNFdWKzdqVGl3b0tBamIvMEw3bkRPd1RqSW92ZzY2U01MbGlVNER4cHIx?=
 =?utf-8?B?VDROY01yYlRUYnNIdDUrSGlCTnMyYU95clZLWlV4TUFISjNUaXRxTnl0djZC?=
 =?utf-8?B?WkUvMFk4OEluYVRNNFpQMlpaemZWYmRBcXV6RWpzYng2RUd4eEZwaGtRSlBZ?=
 =?utf-8?B?bS9JYXlMMWpBYlk4ZTNzeS9tUUJoNnAyR0lQaWRtMmdBSmZjeTlyaFFlcmR5?=
 =?utf-8?B?bXBVWWJDTHUwK3p1YTNYN3B0T3l2SE50STNXWWF5VU1tcDdvQVlMaDYzeEZH?=
 =?utf-8?B?SVdTSVpUWCtUS3QzcjdtTmxiTUYvUHlERXgvYnZnRWlRekw4QTl2NHVOTldL?=
 =?utf-8?B?czZpU3VYblE5OVFFZzlvZGM0Mk5kUzk4elRCaDhvZGhJSGdURVI4Wm1JYzha?=
 =?utf-8?B?Y3VtdnFQa21iajM2NFROSTR1eWtTUUpVUVFxR3Nqc1ZIazMyclJuL0gyS1BU?=
 =?utf-8?B?RzRMekYyTTZmcDlvczY0QnZKOTRpOWJiNkxTVDcvRUgyUFd4eFBJVDJwZnRX?=
 =?utf-8?B?N0RsU3pPUGVKczd6YVZJZExSVkJvMi80Z2sxcEpRSEtkOEEvam9SNDJrNjZu?=
 =?utf-8?B?SEJnQ1VWYTdTN1BpbHRsTnFYNnlXMDJZQjA1a0JWMGtOb0tUdGJXenJPUVUr?=
 =?utf-8?B?bjF0YUJzOU8zQlFFblo4OGRPNzZBandranFwczhmWXZMaW9reGpNMm9CQ0d1?=
 =?utf-8?B?L0hMTnJDVkZVVy9mN2xQdFU1S2FrZHViTWYxclZZQmZTWXJMNHhIUGlEMDNl?=
 =?utf-8?B?QTFWWWplZCtZUjllWDVWekd2djNlL2NXTk53b25EUmFHaGJzTk5iQTA3RlFp?=
 =?utf-8?B?ZTFqV2JJN3BCRUhqMTB6dUs0NVU2UllRNzBidTBHU3ZpV0lHYWtXdGFJVGxW?=
 =?utf-8?B?Rk9PSWhYeTBMQ0tqb25tTFpUNHVqdCtNSHFvcHp5eUQvUGJDWHExOTI1UEhi?=
 =?utf-8?B?d0hNT3ZIUW5MQkFTYkN3cDFCVlhhYnNBOFppVGdXZmRIaGtDLy96MEkxckdR?=
 =?utf-8?B?cUl1THhZNktFenMrVldjd0Q0Q2liM0pNTkx2SDFCZnVYTEp5R2hPVGhsTlI5?=
 =?utf-8?B?VCtBNUhlck1ZZUJGWXVPV3pnd29ibExHRkk0b2NGSVZZaDdlbHpkc3ZDZDRu?=
 =?utf-8?B?OFZwRllPRHhPalZLdWE1MlEyTTdjMGVHWFN5d1QvU1JHUUVKWHNFSGNwdk5r?=
 =?utf-8?B?QzVnQlk2Z2poYzlXOElpM1NiUENFSEdxcWZQQ0F4Rk40RTVuRFViOVI3QWs5?=
 =?utf-8?B?VEg3dUJzZFpYME9GRjVBWHVWc1hZcUtxeU81U3QrSmp6eS8zaDdkTzdxU1Zm?=
 =?utf-8?B?L3ZtSnEwemYxZlFaMjN5R05qU0FhQy9ibkp3ZlZrWGdiU0FLQWlScWJ2VE9x?=
 =?utf-8?B?SjJGSDNEQzdBK2FLQURFdFVhN1FGTCtBNWtDaTV4YzZ5bExhR3BSemhkMzRo?=
 =?utf-8?B?SVhUVWlIamlzZGEyT0VTQXBzV0dKdWFRSW1lczBncDdRVkRBd28ra3FBQ0Zt?=
 =?utf-8?B?K0daUkhiY2RCL3JtWkJRYzlLRlNMSGdQa3ZQdnZKMWgxcGxja1Y3TzM0N1dx?=
 =?utf-8?B?NVQvaFJQeHo1T3Q0VUZRVnpYMnZJRzd0ZXRhelFnaTZJb1VBOFIybDcyajNr?=
 =?utf-8?B?SGErVm9xV2ZGaVZLdzFORDc1cUpseDRnMmQzNzQ2ZDZRSXRBb0RYc0FOQnNx?=
 =?utf-8?B?SytRV1Q2eXRFL0MybzBjTGkxcloyejlhb1ZMR3QrSkFuQnRUWGdpOUFNMUtL?=
 =?utf-8?B?Yzcwd3BoQTNJOHZxam8rZ2dHNllhUGpkZFhtRWxQd3dkcEkzWVJqbDNWOGJJ?=
 =?utf-8?B?SlpXL3JvY3NISWNQSklscTF0ZGUwR3dyeG5mOUkrK2N6QkdyQTdieUswNFpx?=
 =?utf-8?B?c3VibVJaRWljUjRFZDYvSjBVRWtDUDhIa1dFd0t1VFBmQWRMKytCaXhzcG1s?=
 =?utf-8?B?TDJBdTNiWmtHWUUvK1ZDUWh5eGhOTW4zNjRyVndTM0J0MGozZHA2V0VmRWVP?=
 =?utf-8?B?Q29VT3R4ZUpoU0dXbWs3ZkoxRzdpaTdNTmJjUWIxRXhXRHdhcEJhTHRja2JQ?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ddhQ7qiDhlCUwsxu1nlvLHVSCcGVCUIhh+WRY75zeNZpahE/MKBg4f39dOR/ouMQUH81sVz2G7mhdxHq47pTCIcPXyZDjr46cY/xjT5LblgoK0XQYs7bG82Ue03HkpJsoacirAvLQV21z2Vh5GcuXJxZGUyFZGjy/LiT2ERvjUZfAHheB/+wyUKEZzmlOuyZewLspSL8f2e6qpAF/Yacpa3Z6vg3ov5x+plgKgN+jux27QeFROvQDnYDs5YLUfNMS0bMJg/WAdpf6zHopkH8caD8BvE888pdqA1DSJ8+D9GoUjHi4IN6mrYfGsPOFFM6KiCjOupyUzSplJhDJt5tVZanfZQEawJHMvkOZTWccqxbTB7TuMv0z+4/VEtrnr/2kEGhCMjALiZOg1Mymoxoq8dBqX4KaSRhhTkjs4F7WF2c8DN1dF6iIh5adh9JJtqgpB0b7I681crVBvsrwE6vyG+9Kmac5+ovD86mOWK2OMMecTU6euo813qHL8fxONRvbAAuj7Rin6j3iVak0dbU9Nug8MFm2E+f5xpGbUgx133sIu55hUBx56H37pCTZnc3ORhS4VmCACkqo3TSpCSgi3XhIq798bJ5uaCtPz8aUEuJalMQvGJjNeD3iH0OYzXHwWMsl+L6w0cj9QUyJ4O+sibvENzaNFy7uC5/BZHN5Xd97DwGBLaTpStGfJQrvMQbvULRFxFf3rxvsk9iIht5pe7CLq4/DrAnXp6XL5rG2VoWHNdktp6JC9/7xQbFIvsBcCqwAewWqzTT36zSSGst65CnhxT6qBSivQctfT9PYalg10cNGK5c4Rm5ShxVxzjB1chbJLAZNqOD2qU/eANEdMdjdQlQyVjTK95W+ItjoBI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1fbd7a-616f-4544-89e9-08db65d6b3bb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 15:08:22.0047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqUXB/iefEDMr+CFXMilppeFmtN3xZts0v+CFFS4J7wD3TwrUMk+hiwqSKxK2+AQNkqwy48IhcDRuj/REyQbHLS4lRvmVVxsjk4xoAP80Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5867

On 05/06/2023 4:01 pm, Alejandro Vallejo wrote:
> microcode_update_helper() may return early while holding
> cpu_add_remove_lock, hence preventing any writers from taking it again.
>
> Leave through the `put` label instead so it's properly released.

Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load
ucode")

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll add the fixes on commit.

~Andrew

