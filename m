Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C3785F35
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 20:06:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589479.921408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYsFG-0006hs-L3; Wed, 23 Aug 2023 18:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589479.921408; Wed, 23 Aug 2023 18:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYsFG-0006eg-Hf; Wed, 23 Aug 2023 18:06:18 +0000
Received: by outflank-mailman (input) for mailman id 589479;
 Wed, 23 Aug 2023 18:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYsFE-0006ea-Un
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 18:06:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6abb01-41df-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 20:06:14 +0200 (CEST)
Received: from mail-dm3nam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 14:06:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7324.namprd03.prod.outlook.com (2603:10b6:510:2f7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 18:06:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 18:06:02 +0000
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
X-Inumbo-ID: be6abb01-41df-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692813974;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q3XKVbDNg1o9FGBJpW7HFK8yGqCLP5NN0ZMYHMFTIw0=;
  b=Ep+HB4c8EFdDimHg+zf9Uz9ruoc9ZyqdTFEADok6Yyve2dKG89sOPrAh
   byfVqE0xMl9dZA5c0De+pXQrEHxRHJDYAWxyVU/kIHLqIb0NcGsbwTksg
   0W+InRcJYk8u3ifCiVV4E3UfoMC0YfA1EOY9PM50l/+waFykorhkaKVN3
   s=;
X-IronPort-RemoteIP: 104.47.56.49
X-IronPort-MID: 119100571
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:5ffxcqxfNyNWPkhnnmN6t+cBxyrEfRIJ4+MujC+fZmUNrF6WrkVTy
 DdNXGCOOfvcambwKtAkOdi09k0D7JaHydVgGVForSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuP6sT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV5U8
 eUVBQk9UjDZqduGkZ2YQcl13e12eaEHPKtH0p1h5RfwKK58BLzmGODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVkF0ZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiCdtKTODnr5aGhnXK4mEcARYoBGGr+9ydhGqbQ/9DB
 249r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOv8YsSTsn/
 lSAhd/uCHpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLnW0ophfGT9ImHKvuiNTwQWv02
 2rS8Hl4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CFsdxS2hAzWMaywqQ==
IronPort-HdrOrdr: A9a23:a8pRjK5sumFH3wgjAgPXwD7XdLJyesId70hD6qkQc3FomwKj9/
 xG/c5rsyMc7Qx6ZJhOo7+90cW7L080sKQFg7X5Xo3SOzUO2lHYT72KhLGKq1Hd8m/Fh4tgPM
 9bGJSWY+eAaWSS4/ya3OG5eexQv+Vu8sqT9JnjJ6EGd3AaV0lihT0JejpyCidNNXB77QJSLu
 vg2iJAzQDQAUg/X4CAKVQuefPMnNHPnIKOW297O/Z2gDP+9g9B8dTBYmKl4is=
X-Talos-CUID: =?us-ascii?q?9a23=3A3PTiYmtnAJm+d3c4wK8HDMGW6IsaaHnEwVrpE3O?=
 =?us-ascii?q?YU0hQeOy6alSw4fhNxp8=3D?=
X-Talos-MUID: 9a23:CuQq0wQiKdHH7YLHRXS1oDxtPcxWsp6+UmUpn7Ejo+SYGQ5ZbmI=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="119100571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvCo5y2hfxDkaWnHGefApqctpe2MbE7HsclPW9fvuN1i/pzCKWD5zwcGRVn3Xsimreq5vrhV5pIR4AmQzShiApXJd3yisweACMg0xhmik7wzJe/uNN+AKgRBqdIP80rYdqlZwHyw0oPuehkjFpFYp1c5BPnykYQ6X16Y223PF/BacTZ1jPtGrPPZTE3ekp49VJ0CbMjWNko0NcqMMjYqT4nF2RoQyW/cQiWaODmdaT/oTFWFECac8+jqDzNN8Y5h0rsDvLEtQYh+5ocDuT17jXdzUoPXJAOAe8bxuR8QuXt8xDikID5SEtaaMAuwfEO0pgjf4VrPfKMGxI0qd6p0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nmTV/b9ScOHn0uyS/cUErv+YXN36z3aGvNJbNYKmiY=;
 b=OdjdWr85CjA1Qeq5wNF0Dmw6w6YORI82TREVGMgeKYoOI8NXm3JULV7EfNPvK9lE2dgox8PABtq1d290oRNOya9+I0NCjIJAXjPWrpqVAWGhuvI9zFSsXev1UyxE6wT2fjrLkJRyJaiyfdGRXkaecpdjkN0qhobfQwxIoRPrv7LFf6QVGkqDkt50WFvFn28Ma1w5ma3phs87659hjroakC/L/8iJzXri/6Sn0GtVZmZG6OLutwv+4lgNQtkoEUvZPgfRHI9nzwQM74ZJF6vaTyFMxonvcdssPiKFkciZS7gIOkTiy7vi3yF0v5Fpm3C9LiARlexyyde4NUULbZCteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nmTV/b9ScOHn0uyS/cUErv+YXN36z3aGvNJbNYKmiY=;
 b=Fb4/Whir2c1QPSJxvXjlM1KnxK94VRxtutVjLLr9FjJqBJJNGO4jtAWehxY8Kl6eoGsgBbkZUz10t/2cJP2CKwyIiuHoRrQwGqVUHdWBzcjemb+r5BulyNPVVZ7bIcFkdQUuH6pybADNDjl0bRrKnyKCcBK9X55BSjVWdbIAeiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <59a39677-5959-82cc-804f-4642d2cb2041@citrix.com>
Date: Wed, 23 Aug 2023 19:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] CI: Always move the bisect build log back
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230823152334.8867-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230823152334.8867-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0081.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: a479f5ac-9f3a-4b55-1b86-08dba4039c20
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rWDnSZBduUzabLUlg8iPoCAiSCtxnlGuU3RqoqTU5094FTi9EVqOiAwjSDfZCB6pqCntwluVcdp93yI1dZHoPBTv9vnhsuukLRYuwyfwGEacNCpdCP+k8hMzjO6V5gP6eNbxXoCfGPjKcRCduJknEmwhv1ESLkqX14RGcFgtTZH0Ots3/ANPtmvLc6JfWC85JXvKwrbpiUWZNl9eQYt4VawfionSKlhll1eKSlzLBxpiVy27H7nRtmOXtbKwdFHlGK0c3ceNCQE/95UZt9KXtaVyhSABp/K1gfTcazQ9YILtdi+tABcoLoxtOST7XzxW31JLR8JSQVUouXCvSjF7Z994VcodurM4QwDmSdaPciVwIu3oo9dWQhe32PvQCjpIeeROpnXazyvEkLL0vrSHByD/tOiX/DTpR05p7359hcYgkDf2hn4XI4NAPQvy+/QUunO9J/XK2NF9/hai5QRiA8/dgArXoDDPW8OW8qLzPCzphArzZet8Frz8KjBfCjWlU3ynyf1MWkFlSTtsMR8RUwTpCrXXer7saKlklM3g1r8/fWIKrQsfCJn5niLywUMB9YwwUuMbF47tZaqcXr1K0jB+fZ5hsImQWIae76z8/ZRtHE9mwo1Wp5we24f9TfC/zf6I/6YhS5zF3bxhI/IuxA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(1800799009)(186009)(451199024)(66476007)(66556008)(54906003)(6512007)(316002)(82960400001)(8676002)(4326008)(2616005)(8936002)(41300700001)(36756003)(478600001)(66946007)(6666004)(38100700002)(6486002)(53546011)(6506007)(2906002)(83380400001)(31686004)(86362001)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkVXMWgvbTZOajlqekxUeVAwQnd5WkJHWnh6ZjVhTDlab0toKzBJL0lSUm4z?=
 =?utf-8?B?WmR0a2U4N09JTGZEWHRiODlTeEpkQ1JhR1RxU1dCY3FqSG9EbkNDWWxXbnND?=
 =?utf-8?B?RFhta2I4N05oWXduWXlQT2ovRjhqZTVIeGJERnduRjUvWXpkTmczSEJoTmZ0?=
 =?utf-8?B?OGpyeVUwYkt1VE9XWU5TWkx1ZFl0YjJSQTZwZlhGN3p5MW5nSHpHK0E4S091?=
 =?utf-8?B?L1pJUzlZeWd5TGo0RWZYWWUzcCt4bUQ1ZFlkVXdnS0Z6Y2RNMThkaDBMR2JQ?=
 =?utf-8?B?SkFEd1ZhR1R0VFlJUmJ6NDdRNVRueFVBNndYRFVySjNCMzdPWkRmNUl1SWlo?=
 =?utf-8?B?NHR1QllMV1JmdC9DMlB3VitFbzA0UVdpMTVTSnlISzhFcTZDTEVBZVIzYmF5?=
 =?utf-8?B?TytubHNYMi9XUDJ0MmFMRndQOFZNN094RTY4aDhHWUlCVGl0ZzVoRFRQbVN5?=
 =?utf-8?B?akJrWTVzYXNmWnJleEpCalBsVUt1U3psdGY5QnlIM1piT1NtSEpLeHVCWVdz?=
 =?utf-8?B?R2cyQXkvSHdMSGh6V0M0dTc2ZDZnSnk1bEs1UkowRzhjUjNjbStBTzF3dHNO?=
 =?utf-8?B?NGZzQXNaYU1Dd2JPSldWYUluWTZ2MGtrN0NLWHdDWVRLVUcxYjkwb1dvaysy?=
 =?utf-8?B?cWJnOEhaVGZudGxpNjVpODdLcmxmamFHSWtiTjVBS29WYm9qMjlzdndPTWRW?=
 =?utf-8?B?QkZaRkFVYlRYRmQ5ZzI5ZTVkK2lYd2tGbDZYSUxpNE5sdnMxLzdJbVpWWHU4?=
 =?utf-8?B?SzBPYi9Kcis5S3J3K3VqdzNCVUlnS3Nzeit5MllMekZZR25KZkxoa2FXWER0?=
 =?utf-8?B?UWVDb0o5SnpvdEhMZzIvWWZJekcwR21xbDVtdDg4SlpON2NwMDNHMUVLWnlj?=
 =?utf-8?B?c0psVEh0MG8vVjhMUFZJaU1QUGhxMEUvbzBvYXhCUi9iMTlQZnk5ZW44em0v?=
 =?utf-8?B?dTV5RE8zNlpzNG5EK0F2b0ZxRkVjM01pMWVnS3loZ1prbGpOUWE0QmRwRlFU?=
 =?utf-8?B?eDdtcHVTa0Z0V2s1V1hYbWJDNkRmRkpDT202ZVlaVHFWbDIxSm85YmVJYUZu?=
 =?utf-8?B?UkVHbkN2dHc3RkVzTC9BZ3B1aCsvVWNvZzV0SFYzSlI4UVJNWWVrLzJXZnF1?=
 =?utf-8?B?dU8wT2U1QXA4RmV3M2RPRWw1YW43TjMranB1dFR4TzVqL1dLRW1PdnNIa0Uy?=
 =?utf-8?B?d3pZUWFhSjlkSktaSGpaTUM3elpzR2UzRGJmK24yS2NOVHI0TFFHUm1FN0xH?=
 =?utf-8?B?WUxGK2xaczJXSm8yQ2pHWlBRRFlDL0Z4UVRLYTk3L3EvVVN5YmlMQmpwZkdl?=
 =?utf-8?B?MGs1YWhHYmdyZFYvcmhtSmZ3MVNFVnRVNGZGb3ltUm9TY0tvMUsyNzVkdTJ6?=
 =?utf-8?B?WllNQzZyYzNWNTVGb2hmVy9NaG1neGtveWtZKzRPUi9FMDhRb2dIVCs2emNv?=
 =?utf-8?B?UldsaW1nSXRxNzdERDc5RWtsR1hmNFF6UWw5T0ltZHhTZUlMQklMNnZtZVhI?=
 =?utf-8?B?NzljZEN1NnVoeVNhcWM3MmZDMWc2Ykxob3R5bTJJeUVlejArelVBM0tSSTky?=
 =?utf-8?B?QTl4dkt5ZDA0RWpUT0NKM3U4Tys0QkVwc1FES2xoQXNUOXhwMkVpTkZlNlFO?=
 =?utf-8?B?VGcyWWVWZWdvS3cvUDdtanBpYnZWdG01NU11TE5QakdCWVdhcUd3OUJWNEph?=
 =?utf-8?B?TEdTR0dYY0t3UXhVY0pudDN2NjF3MlVtYi9sTHhXZzczanFSaEM3UjhHcFpy?=
 =?utf-8?B?NHBQV0hYMDJ4bkorcnVBZlF0SkcxbEwwb2FZQUlFeVIvRmFRMjFQeVloa1U2?=
 =?utf-8?B?TGVDQklHVG1vVDh1aWpwODQ3dzFkWTJxREMyVEJPcVVMbzM0d3F6eURqQU14?=
 =?utf-8?B?REhRTitUZkYwbkpMZDFwYVlaQnkwV2JweVJ0MUdFV2ZJVGczN21CYUMrc25L?=
 =?utf-8?B?YUhiNzRhbnQ4bkFNSGxQMFlWZzNDNzVwd1BWd2ZQVFBSaE4vRGV2dXZQVmNV?=
 =?utf-8?B?bWdWWEw0cEFQdkpkVCtHTDVIY1I4QUdrTy80bTBjSktMdk90R3oyV0JTYkdW?=
 =?utf-8?B?OUJUTnVOdEU5MnRpZEk3UThGWjhLV2xGU2tlVnFBSitZQU9DamdCSGM5RGQv?=
 =?utf-8?B?Q09UNWJBUVpZbzN5QVBmRmpQTy9SV2hXelovZFRjL2EwRVNGNlVYM1N4aVdj?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JvqiSRMP3ZrvbxMNf3ZstoDYmb9FsStkJxaVk4PJy+Ag0sk22mIlJ52hndcATY19I0fFgee42n/MvJnicRYE+gNNTHtavtHNzqjd8CBjGu4RLOtiLHgEG+SkckxDwTU9mg6bFqcYYSfK7Ij0yPnsn9Tx9IUBh95YXuCbhJ9InGpW9zjVFFts1dgRDF1fAmeg4p4FiJr231scDd6Lwlh4hWXPMSzP354SRToGeF/dmGsxlifCKEtyx5T6jljWhuYBRFYAiVru4ebVPapqCf1z0ixaBv7NTdNaMcmtaVW6OszOFtmwDNIZ5tgCR87OL0MQd2I/8yZ0ZXde9jjgzHuArb4m5Kd7lrixwwGaWDOh5mWxLkji0M4+mJT7dJi/qACoVVbcytRXJq4xq8YBdcpmTrba0WVCIPdZl6pUddTn/4NKDsWHot5Rvpuxyklc3maGZiuVFBWraDSAJjRIqLC6zSlR0hEEo/EvSYCM03m38wfxxEVsFzfrakCNBrhMMq67HaJYoKkWHS8GMq3ZdVFP+VVBTOO9wUZSNwSWTQo6KeXfr32MEGMEyBzjhqVpds6eJYEL9IFL5Iia/SyW8mKygtdG4Gb959mxy8mIUNvzQ6H2a3BElGmuq/JVun+dd8pgdLgexc2lsgy7Dskbfjmf6d2lPxHIb+dyQiVwM9wnjn/dj/QVUCWRBHEeYJEg6c7E2Wbnu9x5LpDImUouxoYKTOkw+abxNXfM5oQoTy0wyU9664Dqxovy22iZb84SvMgU0anyV2OIX3ospwFUhnTSksh0ATFs/NkbnHkNnVoakczimRDmxlZL19cBpUkE5SHK/7E6gVcsGGdzyUfTOpxYHg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a479f5ac-9f3a-4b55-1b86-08dba4039c20
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 18:06:01.7760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9w+FrmblWaUAN0tVsjCmPJCGmuhaMcSuJsNb7wp6gk6eSxdqW9veURMqEo0/BsNXOeAma32hmgN3ler2XPIkKPXGZtIm3BH5v8gzFvFM+2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7324

On 23/08/2023 4:23 pm, Anthony PERARD wrote:
> On failure of "build"-each-commit script, the next command that move
> the log back into the build directory isn't executed. Fix that by
> using "after_script" which is always executed even if the main
> "script" fails. (We would still miss the log when the jobs times out.)
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  automation/gitlab-ci/test.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 810631bc46..5099f2e6b6 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -140,6 +140,7 @@ build-each-commit-gcc:
>      CC: gcc
>    script:
>      - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}} TIP=${TIP_SHA:-${CI_COMMIT_SHA}} ./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ../build-each-commit-gcc.log
> +  after_script:
>      - mv ../build-each-commit-gcc.log .
>    artifacts:
>      paths:

Thanks for looking into this, and yeah that is dumb, but why play games
with the parent directory?

$ git diff
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 810631bc4624..b4c2f22a1b07 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -136,11 +136,11 @@ build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
     CONTAINER: debian:stretch
+    LOGFILE: build-each-commit-gcc.log
     XEN_TARGET_ARCH: x86_64
     CC: gcc
   script:
-    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}}
TIP=${TIP_SHA:-${CI_COMMIT_SHA}}
./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee
../build-each-commit-gcc.log
-    - mv ../build-each-commit-gcc.log .
+    - BASE=${BASE_SHA:-${CI_COMMIT_BEFORE_SHA}}
TIP=${TIP_SHA:-${CI_COMMIT_SHA}}
./automation/gitlab-ci/build-each-commit.sh 2>&1 | tee ${LOGFILE}
   artifacts:
     paths:
       - '*.log'


This is prevailing style of the other tests, and also e.g. won't emit
the (whole) log file if e.g. disk space fills up.

~Andrew

