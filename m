Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0777743AB5
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557426.870759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCCX-0006SI-FF; Fri, 30 Jun 2023 11:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557426.870759; Fri, 30 Jun 2023 11:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCCX-0006PN-C5; Fri, 30 Jun 2023 11:22:09 +0000
Received: by outflank-mailman (input) for mailman id 557426;
 Fri, 30 Jun 2023 11:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFCCW-0006PG-D0
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:22:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56b1cc29-1738-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 13:22:05 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 07:19:56 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7355.namprd03.prod.outlook.com (2603:10b6:a03:557::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 30 Jun
 2023 11:19:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 11:19:51 +0000
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
X-Inumbo-ID: 56b1cc29-1738-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688124125;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6r8LtST32BqShIauuaiZNpM4XAWa3vY+AYGz6pHfuQg=;
  b=OCE6fCGJ+QKAsOzyXahmsSKss9K0K3dfx3LPNVKa958c2rH0ZeiQ0YbM
   xxadSYx7GgCtHQuk5uInOFh9b9ewPXeY8hP+2NcpK2LaoBtt1WMA1C9r0
   ggoiwzjUlUPpUHDo80rkA7UQF+44fVL+OsCKULzn8BzPrNs3sJ4NtmLtx
   I=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 113452919
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:sP6+kaDllQIbmxVW/wriw5YqxClBgxIJ4kV8jS/XYbTApDJzhDFUy
 mpMUTqCOPbbMzCje4wibYTk9BkE65fdmNBmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1D5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw1KFbAGZA8
 sEiITldfBSZoeWXkYqWRbw57igjBJGD0II3nFhFlGmcJ9B5BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK/exuuzK7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxn+mAtNLRdVU8NZOqw2c3XUXNiQOanCmsf+X1RWkY952f
 hl8Fi0G6PJaGFaQZtD5Uh+xpnKeuVgCUt5UHu89wAqJzbfYpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgAQJG4GICUCEg0M5oC7pJlp10qVCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:bfhXjKuSB4/GnVQ+PRysD5bc7skCKIAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H4BEGBKUmslqKdkrNhRYtKPTOW8FdASbsP0WKM+UyGJ8STzI9gPM
 RbAuND4b/LfD5HZK/BiWHWferIq+P3kpxA8N2uq0uFOjsaDp2IgT0YNi+rVmlNACVWD5swE5
 SRouBdoSC7RHgRZsOnQlEYQunqvbTw5d/bSC9DIyRixBiFjDuu5rK/OQOfxA0iXzRGxqpn2X
 TZkjb++r6ov5iAu1PhPi7onttrcenau5p+7f+3+4gow/LX+0WVjbFaKvO/VfYO0aOSARgR4Z
 zxSlwbTr9OAjvqDxuISF3WqkPdOX8VmgDf4E7di33vrdHmQnYxDspMgp9CchXf41c9p9050K
 VQ03mFu5c/N2K8oA3to9LPWh12iEysunwpnfQIg3E3a/pjVJZB6YMY509bC5EGAWbz750mCv
 BnCIXG6O9Rak7yVQGvgoBD+q3YYp0IJGbzfmES/siOlzRGlnFwyEUVgMQZg3cb7Zo4D51J/f
 7NPKhknKxHCpZ+V9M1OM4RBc+sTmDdSxPFN2yfZVzhCaEcInrI75r6+q886u2mcIEBiJEyhJ
 PCWlVFsnNaQTOZNeSemJlQthzdSmS0WjrgjslY+phio7X5AKHmNCWSIWpe4fdIY89vcfEzd8
 zDSK6+WcWTU1cGMbw5rjHDZw==
X-Talos-CUID: =?us-ascii?q?9a23=3AQZ42imn2UmVGGbRKnmL+CAAIDLPXOVOa4HbXLUi?=
 =?us-ascii?q?FM29gGK+RU3mX2fJcvsU7zg=3D=3D?=
X-Talos-MUID: 9a23:GwWbZASH7xHmqEOARXTIr2FtL95s3Z22N2sQgZMo5JKeDSBZbmI=
X-IronPort-AV: E=Sophos;i="6.01,170,1684814400"; 
   d="scan'208";a="113452919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbifWHSW3SgyFc1D6lXN5Smhn2rCp8MHTghYDeqLCyoUZ2yAI1tFs3scn8CcmlXHe+7ytxuhDpPrCZ1cjuRZaNIs3YAEMholwcxSnFh938cRFmpbEOAij8LovMw7dkFtyOwG0fa1iv1SwXqP/29LaqoXbatj9EQM67z4wsH203WLe463HAsiv2GhkEnXcFPS/6JPNTzGj57PzRJHx2djsc1hVdu+h0oaJR8BOUCykjfB0CMs00c6vzJvfNT4B6eZ9ui5zw0EU6oe1fIC7/b4zQ2QfxUXX8U/Au2sLqTjDLsNvziVQYzC49CmiUYQGiKgGXt5eD04ryK37V9YPefpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni8Ijeh5JThje52K71syHwLdMWLgxGjQ1kPpbjF+hdI=;
 b=ierCAGYAq574t0P8MOZ6tbX4/QFv5UHHrS+nqweHnqgCaEak8oixWSpgLzCZrK6iRPgw3iYIJ8V6+AjSmtMESFN4C4OHn5zYNWd1Kl6idbh372jQYEsvs0YwuwLhqD1oKR7Kt4rvlH9+oEWi/+cZ3XLjJH087vwVVeyw13WZCTnRkruoQQfDtMTMTMn3+m4PImit9tqRQKvbFcmhfRLCxk8u+RFXMLwL+CR8RuRiCRne67XxvrDiqfZG/n/HfrXQGa09oWF2XLqbqcveTSENQr7WOS4Ldqhweu17jeKdxSuF5jBc5ku4XMcJekiV2411XHEktpn3jZBbvz9o5DPOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni8Ijeh5JThje52K71syHwLdMWLgxGjQ1kPpbjF+hdI=;
 b=Azu3WFubv6h3bCVVS/eHgb6IVg3JWYXnG/ozPy5nheayPo+MR4rRNYMp2peBMU9IEh3pvSmkZv8A9dNT+jJ6vwZSUP3bdPNDRq/t00TUDFU2E2R8YtkpMngjxW5K9LLjU8Rq2lzRml9k6WFm07x5wGblc42Kk6eadxspUsBlpDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <45908116-2b46-2a61-6b76-048f4cef0bfb@citrix.com>
Date: Fri, 30 Jun 2023 12:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] x86/boot: Clear XD_DISABLE from the early boot
 path
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230629121713.1211-1-alejandro.vallejo@cloud.com>
 <20230629121713.1211-3-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230629121713.1211-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 78940d1c-9a78-4d2a-c99c-08db795bec06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K32cDAEjGlliBI83bGpBEDmrZiy0MRUQ9zMqw78QiGNBmWRsIPAhUAAT1Kr5ll6mfYlOHVZRK7RaDABOAtMs+NSiJwAMgs6mxQkUub9Pnm+BKrihQKxlayUhaWazqUhPT6WuF/8fBvjDk8fdCvwUZdpNxIbZIBGVO5IrPIyq3GA0U19OCRFdtVb8e6VBxlPooA151Ao45G9mqTch6tVGtpFv+eA57DOUmPOdAUHAmZx6taBGltxvtU9BAL9ggX0ketPAK5loWxHU/ihZ89y7m+Mi2crbwsm3zC7zedUEAnbATI5mLUY4Q/sAaAGdHiLEqJsEu91aY4IFjy/7dilnxKWjI3WMUL6Jt3SqT3GjAgeHdV9OpWZoONi6V5H752qinaKZPeoh1P0z1AonMLK+tugjkBHMkQr+rwCOsuiOTP+G8iCcgd8PKAe9qo8pJx6qHQYJ6RcphhEzWxMg32pkPVDGCwThiJhb4sgJE/gtokkK+VwY1T+PONeSw/SZQQNKXs/ZVL3RV6C6Yrn4xxmBOCeEne/cpI5tqImr4D9HLddOdjs3Z8ZisGHOMyNEn/06x+Kfg5AQjOP/lZQtbCV+dNFoUK7/J10NfHNAQoo1rF/MicCvlz4/pDWeqDJcGq2mivVXyl7ZNdSYV13BqjZmAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(31686004)(6512007)(53546011)(36756003)(66946007)(31696002)(5660300002)(86362001)(41300700001)(38100700002)(66476007)(8936002)(8676002)(316002)(66556008)(82960400001)(110136005)(478600001)(6486002)(186003)(2906002)(6506007)(2616005)(83380400001)(26005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WC9HdEFTZGRzdlZoZlVOZ3RZL2l2c0ZKVHIyd0o0MWZkMjRoSGVOdVlMemxn?=
 =?utf-8?B?Zmk2OFkwd25mTTE3MmJXd3lqekI2em9xYVhxUUJ4MTBadjE5VkRLTTdScVFv?=
 =?utf-8?B?Z1pteHdBRDNsS2NOWUc0NkNJNGlURHdpQ2FlVGFrQ3E4cG9JekJOeC83SWIz?=
 =?utf-8?B?NDdIeEFLTmt1YXIvdWhmeXQ5WW9vWkpsNDB0OE04SVFmVkV3OTBJcUJPSTRw?=
 =?utf-8?B?emJqeXBFNFhCZDIrRUFETjFWeDh6ZzNzNC9ENzRTOUo0MElHTzY1VzRjSmxW?=
 =?utf-8?B?Yzg5T3ZrRDViUVJjQ1RIQVdPYm4zMnk1Qy9sdVZxaE4wSldObnppalNRT3gr?=
 =?utf-8?B?U3MxSlMxQkNQeDhXZnJISkJuRjlLVXpnLyt4bi9nZkNhSXdJc0hTZmZiMTA0?=
 =?utf-8?B?b0ZGRGN3SldVVjBCSytuY3E2djdiTXV6K1lTY210MGVkQ24zWnZJSVhjeXpK?=
 =?utf-8?B?TXNOTmZPcCtxWk0yTkQzREFhbkx6bXBNZ3JxTWRoMDVXWG4xcDJNQ3BwNHdi?=
 =?utf-8?B?NVlYMGRGeVcvNlFnU2I5cHFqbTM0RjltNzRacllCKzhZRW5ZNVlzKzU1cFRU?=
 =?utf-8?B?MCtwMEV0ek94TzlQS0JySmU5OG9UcUlkbTJzbkc3eWpkZlNRU25YVVY0aVh5?=
 =?utf-8?B?OW53czJlOHBvTE14dExFbjE1SnJvL3hiamhkamJpcER4cGVaVWdPclVXbENW?=
 =?utf-8?B?RDZSbDMxcVVKbXJyUHR4S250d1RjQ2RGNW1DU2d6a01lV3ZGcU9mdVUveGdr?=
 =?utf-8?B?dGZ4WVR2VzdNanRqRVV6YkJBakoyR2JCK05VdGFYQUdFRHhxajFlSXB0dFpv?=
 =?utf-8?B?cW9IWWh2MHU0Z3JVRzcxT2xQOEZsU09TOURTWjFIbndiL3BhS2VlemJKMGdL?=
 =?utf-8?B?SkZnZkZZeUxZei9wWmpscFdMSDhCbkFhSFR6ZnlBcWpaSDV3Y3lETVYvVnlm?=
 =?utf-8?B?NVQ4UVNCcXAwTmZqdUJhRDA3UWFmaHRweDN4VnJuOTJ0d0c3VXQ4cDcrckRa?=
 =?utf-8?B?R3pXNTFWMXVaczE3RXEyS21UYXBObTl1OWI1VnpCaHNkUUFyT2U2ZmZhWEVm?=
 =?utf-8?B?T1hCdVdmY0FLcEx3MXIrc0ZkcWN1TUc4WUo2d3VGeW5raTBqdzBYSG8zZkdS?=
 =?utf-8?B?Qy9CZE1rSjhkenBaZlEzSTM1MytoV3BPZ3hHdTROdHBpMXNFYUc1enBNcmFx?=
 =?utf-8?B?bnl1TXEyVGhKUjRKSzY2d3U4NTQwUmJYWDI0SXk2R2hmait5Rnh2MnVYbkVW?=
 =?utf-8?B?bERveU8wV1VzOEY3Ti9LK0RqdjZnb0NMQUFWS3FMdWZrNTZ3UzNxT2k5NVgv?=
 =?utf-8?B?L01Hc1lwaFM0Yms3OXN1NGJlNDNKMTV2Q1JrZDFHZDBsZTVuL25TaU1QWlhs?=
 =?utf-8?B?cGZvaUVoT2JkWmtNTXB1WHZKbW13S1UrYzRMNVNrSWl0YThPMW56T0x2WUEv?=
 =?utf-8?B?aFdjRzljb3I3bHRRVWVXazRNMEdhVi9FcnFSWEJodllUbGpHZ0szUmhOdXlW?=
 =?utf-8?B?cnBCMGw2L282Z0lhMytKNnJSVzN3dlFjK2VoTzF5ZWhqWGY5TjZXc1ltSE5X?=
 =?utf-8?B?NnpjaWIxbEFJb2FYR25nK0F0UzJZdXNETDMyRWxBUHRKUklBM0VFSTFNMjdH?=
 =?utf-8?B?dnFaVFNhWCtNVjNMb2lWeEVvdTg0UzQrZUVWMVp3Z3B2ekFKTUZMdFZvbldH?=
 =?utf-8?B?T2EyMG5YT0N1dlpRZFZSelg1WVRSc0hBOG12OEo1Qk1PdXg4MlRhakROeDNG?=
 =?utf-8?B?dmhwS0tvTjB3Nkcyenp4NFByOUx4OVBxVTFoaVg0VFlhanpwcXF6bUZSdkNW?=
 =?utf-8?B?QXkwSmRkOEQzSzAwVFppdzBqbHBBWkJXcmNTaEZWOCt1aDhCd1RoWlV6VmhH?=
 =?utf-8?B?WmkwN0VURytFR1FzWFZaUnkwVHN1OU9zbk5rWSt6aStoRGxqNlpPbldpSy9D?=
 =?utf-8?B?Mk8rdkRWMXFZMVk0ODBIRkd2SVdnRzZ3NElFc2FoSFlVd1RwQmY1Q0c3ZWNm?=
 =?utf-8?B?M0ZwbjZITmFVc2FWS3Z3cHVuM0VSa1BsT0ZHSkFsd2NsaWZyUU1PUXdtNmhL?=
 =?utf-8?B?NWFEL2RwRlpvOHphbFlKSlNGWktXQlhLRFhpOHp0M21KYjh1WS94YllaWVhR?=
 =?utf-8?B?ay83KzVZSUdwdFJoMEQzUGZoeXhHT0xGd3cvamVtK2kvVUhJVkZXdTBMR2FG?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c/V+sPvvQgUKn/NOXGf1cRvNkD/NHKXhax55nYEmbHjgwOQbi4IqSgjT6p0IVSe59HndzJPPV/NMRSZCRjdDyL7W4dXSJlSxeEx/rDLjToNgXjcTne0HrlCVGuCaBCFG5cJb6x9vjKfiSW0f1YZPZp/rCK3sfYYZ5NHhuGMtz2K329VC8iBic3wEMXNZTZxia42TQNlm8GZZLZgedY6VmGABeEsak9/45PXT7CrnpYQOwNSeV71ImTHXYKO+RJizv7kS1MX6/xjo0dCYUdqKHkxiTN7Z/MxnIq5VP5mFiQJBTC2IKXXEm8enA8jppanZ/lhm214z14OZG5mzbfV4WrPa75Uu3V1iXqW6UgS7ubJeY1Nmrnkh8Y5U06wn37P+Tn94bV7dJhtjYo7g+Nao1HexhAMshiNg++OvCoEaWMMi5c7NIWD2Iy89lJtjGF9wNRFVOUpNV0LQCbZ3MfkAFBleOXIXzIz7+stIMeUqrEeUptht7jaadezVp/T6vEd0f6eipfCUL5bfMvfTb33p6aRHbqxyxeweBjFPxUHypUUV4TA+DsYMyoiuhhefY+3XbofruPLz59w6cLPd39Hvs1ZTMpX6bjUu/ql8aytXlYxuHljQ1VIMzbe6kd15BC1ZZ0kD1gQZIYJLXKjPGCa0GvZLUc+luuNYR+NsTU4aF8b/7C5DGkq3ww/IS5DL1DB7OY2qQpr6Y9Udr+86jk1kuVyMZLYl9k64IREYPSojBhgDb2txylKQvEjMS6UGnrv1h7UwnTZclplAHOTBv/Pg7ENGJnPzx/s3cGUerkv3v2Gcq6ZWwpZ6RjAn6TK90Wol
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78940d1c-9a78-4d2a-c99c-08db795bec06
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 11:19:51.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +r0zNXz8BFLgiWKzdlrLfy4wqCAVAAoLIgR7Bm4BupMjqeggon9kfwHBJ6KIm2u9iPuiIRwvSJpnmX3l+MJaeW52e6IziRJfjeeEZ37KXH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7355

On 29/06/2023 1:17 pm, Alejandro Vallejo wrote:
> Intel CPUs have a bit in MSR_IA32_MISC_ENABLE that may prevent the NX bit
> from being advertised. Clear it unconditionally if we can't find the NX
> feature right away on boot.
>
> The conditions for the MSR being read on early boot are (in this order):
>
> * Long Mode is supported
> * NX isn't advertised
> * The vendor is Intel
>
> The order of checks has been chosen carefully so a virtualized Xen on a
> hypervisor that doesn't emulate that MSR (but supports NX) doesn't triple
> fault trying to access the non-existing MSR.
>
> With that done, we can remove the XD_DISABLE checks in the intel-specific
> init path (as they are already done in early assembly). Keep a printk to
> highlight the fact that NX was forcefully enabled.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with two minor
fixes.

> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 9fbd602ea5..0e02c28f37 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -652,16 +652,53 @@ trampoline_setup:
>          cpuid
>  1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
>  
> -        /* Check for NX. Adjust EFER setting if available. */
> -        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> -        jnc     1f
> -        orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> -1:
> -
>          /* Check for availability of long mode. */
>          bt      $cpufeat_bit(X86_FEATURE_LM),%edx
>          jnc     .Lbad_cpu
>  
> +        /* Check for NX */
> +        bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> +        jc     .Lgot_nx
> +
> +        /*
> +         * NX appears to be unsupported, but it might be hidden.
> +         *
> +         * The feature is part of the AMD64 spec, but the very first Intel
> +         * 64bit CPUs lacked the feature, and thereafter there was a
> +         * firmware knob to disable the feature. Undo the disable if
> +         * possible.
> +         *
> +         * All 64bit Intel CPUs support this MSR. If virtualised, expect
> +         * the hypervisor to either emulate the MSR or give us NX.
> +         */
> +        xor     %eax, %eax
> +        cpuid
> +        cmp     $X86_VENDOR_INTEL_EBX, %ebx
> +        jnz     .Lno_nx
> +        cmp     $X86_VENDOR_INTEL_EDX, %edx
> +        jnz     .Lno_nx
> +        cmp     $X86_VENDOR_INTEL_ECX, %ecx
> +        jnz     .Lno_nx
> +
> +        /* Clear the XD_DISABLE bit */
> +        mov    $MSR_IA32_MISC_ENABLE, %ecx

Parameter indention here.

> diff --git a/xen/arch/x86/include/asm/x86-vendors.h b/xen/arch/x86/include/asm/x86-vendors.h
> index 0a37024cbd..9191da26d7 100644
> --- a/xen/arch/x86/include/asm/x86-vendors.h
> +++ b/xen/arch/x86/include/asm/x86-vendors.h
> @@ -12,9 +12,9 @@
>  #define X86_VENDOR_UNKNOWN 0
>  
>  #define X86_VENDOR_INTEL (1 << 0)
> -#define X86_VENDOR_INTEL_EBX 0x756e6547U /* "GenuineIntel" */
> -#define X86_VENDOR_INTEL_ECX 0x6c65746eU
> -#define X86_VENDOR_INTEL_EDX 0x49656e69U
> +#define X86_VENDOR_INTEL_EBX _AC(0x756e6547, U) /* "GenuineIntel" */
> +#define X86_VENDOR_INTEL_ECX _AC(0x6c65746e, U)
> +#define X86_VENDOR_INTEL_EDX _AC(0x49656e69, U)
>  
>  #define X86_VENDOR_AMD (1 << 1)
>  #define X86_VENDOR_AMD_EBX 0x68747541U /* "AuthenticAMD" */

And all vendors should get equivalent _AC() conversions.

Can fix both on commit.

~Andrew

