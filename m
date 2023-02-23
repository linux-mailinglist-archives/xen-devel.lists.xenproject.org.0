Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432836A072E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:17:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500225.771511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9at-0007Iy-8s; Thu, 23 Feb 2023 11:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500225.771511; Thu, 23 Feb 2023 11:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9at-0007Fq-4T; Thu, 23 Feb 2023 11:16:59 +0000
Received: by outflank-mailman (input) for mailman id 500225;
 Thu, 23 Feb 2023 11:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pV9ar-0007FK-Gx
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:16:57 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f5890b-b36b-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:16:55 +0100 (CET)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2023 06:16:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7003.namprd03.prod.outlook.com (2603:10b6:510:12e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 11:16:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 11:16:50 +0000
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
X-Inumbo-ID: 93f5890b-b36b-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677151015;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JIljoDXdyhTm7vaRmXzV/MTCqOg8uKmvjWTC5WZFCW8=;
  b=HFSFLi8NL0pApFlMms2dQrtYewpMTRbpGiN9DVmYDyH84aqn39oCEvCq
   90SgTmZQVKeKEI7JsayUCEct4C5Q/tNBzfD71fnRP1Fgx3P2I2dz264yo
   hKRqu3pGFQe9Qtu3jDM60NCZi/ht/n6tRAzzRzQMhRuZYNcqlMSITtlMC
   s=;
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 98209453
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VkX7kqDLL82k+xVW/xLiw5YqxClBgxIJ4kV8jS/XYbTApG5z32FRz
 mpKD2uOPqqOZGr0ett0a9+1p05Q78XUm9IyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GlC5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw4rx6AnNu5
 6AkJm4DbgiHqLioxLWnRbw57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuza7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6fx3uqBN9JfFG+3tBmpgLIw2sWMjwLe0qniP2DkRL5Zs0Kf
 iT4/QJr98De7neDRMTnTRS8p3KDoRc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJuuPC4awh9zxXD31n
 TaDqXFmg61J1JZVkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:qsWkaKoIIteU3EQZAJ0SIKoaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.97,320,1669093200"; 
   d="scan'208";a="98209453"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgXpnV3u8L9tHg+pTqwc4m7VUgaetX2O+NMj4VvYN+0xufwuHjAWxEQFUsuAAyK8HJSYQq2so6BOi+TjTiPVH+5PEyO1hwy+jHMts0UnVb1hYFCAoUy6Ih40KY3hx9FUYdYn/vjEsTF4o3pz1tW7g11hxD3RFhd1wlQQ9aeJ9DRMTsbN98DvT7S3clyZy92fhrstEG6NDs2Xy2lTSmDgj0bKsYgkZmHtS7zTAuqMR2VKmniKyVk+mEpqWBzjvBTngfZRIcwmK//McnFLFF3+K23gKQtekSV0njavDXTZ9A/MW52r+B0ObwPjtfoH0HuLr7yIzm3QnZY97kVdqdSi1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkjRO/Pbtgh/t1ljFsXxHEnaouyQBRJRA1Jk2XtJCYM=;
 b=AosQsqqQM6mc3mm3p9rabiVZXGV40n4UV3aoB3NY9pki5dobAeV8fcCyFF2xW2xLLPra6bTBGnocR0vBBAU7jAsv/euxlwxXsrghU2I5eeL3hcQRfHuQdprnac6VzYNRFoj6qCsz5aKopWDPUxUE7QJRQWB15Nd7ykryD4MD/cGyH0GbzU5Xn15J/8kvUHR8gWTZk9ifky82qYc1XzfQVflYtuvnnpemwzyKkYuI4D0kWipR+hNtCeYhnD7zsH11nzK2AOkpqaeFGGtEm4LBSFTgXaGqRAWBSiihIUxhO1zKi3yw/69DvzO8tV9bu+yS0uBWWPl1xvSD/DTT/NRvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkjRO/Pbtgh/t1ljFsXxHEnaouyQBRJRA1Jk2XtJCYM=;
 b=BXyl+gpmn0VeldP00gOJc+vB2EMc1ukM3gIDXnwJuaLUmoX3u/yOWeTpB5q5dn+B+q1pPPA3dCeMlGMQhsjv5alcjHkJcLvuiJ5AFKJXfJo1Qi49hb8kS7BCDmyAQ1dpdHk0sDa8FJrIOA2/Zvs2gvaOe9Wubg+qC6A6kbEPem0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9f42efc9-ced2-95b4-cbbd-8b5b3a1d4ca7@citrix.com>
Date: Thu, 23 Feb 2023 11:16:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/9] x86/svm: move declarations used only by svm code
 from svm.h to private header
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-4-burzalodowa@gmail.com>
In-Reply-To: <20230222120023.3004624-4-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0653.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e7ca1a-c745-4294-17dd-08db158f75ad
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pzKJQo1dPwV7f4I/VdPWSyKi3BHy85zWyoAXC28g4/6PioMwoM+kekOf0p4EQKlNPr0UDi/64Qi1tcqkcZK8jgjoHjXReHTurtZFPX9oIAxaE1rlVH9PfF8Z2jS7BYau13jgcLEudiUgvt/bRshzMWm+G8M1dFOw8F7d1/FFc6AO/C07/exEnqrOS9+wmHBRCaHEkAmjPS/ETUJKj/btqkRL7lOYkocMjKAu+hdtBrVW5iuenm+njaNj6x3pZidmb3DCvlpkfuq0ga02VSF2itqNnnILEv0seiiZxCSSTXICTYAMhrubhK2K0UdWJCAiULr5uaNlVVtO+GRKgWKXwE1bf/81YRhrruqZuu5VuzI/DsHEsXUylIEb3WdbErYRx+8nkkFnRS5KV79aMDDo5SNmWwPmac57VmfqQFrBGIPGAOatzwHR+qyst/olbwYwSvQAYFa/jGywTXsN/RbR/Y5xVNV99GhRAsudfGHinRsGaY0h9kpVU753m4lQybDj/mLN6q0UBvsnfH+TyacabYBx77SPjE446r50vNVIPvqZp4dU0WbS3q7QXT2cbH7sWgbvGLVdJXG16JEUAueXJ1HEo17grhFiIFgRPvH91eF/mmXs0dRbkzDKhMVBd5SejjFarXh4zjp22M6YErkDfl6LNXnHqi6/xqA5oytSgCidQjLShv/oeaPUx092/2Ac6z6CWW7nQmMoME0xPTRoxcZql2IhUTuUK4bbKCaBBH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199018)(82960400001)(6666004)(53546011)(2906002)(66899018)(6506007)(6512007)(38100700002)(31686004)(6486002)(8676002)(41300700001)(186003)(26005)(5660300002)(36756003)(478600001)(83380400001)(8936002)(316002)(31696002)(86362001)(54906003)(66946007)(66476007)(4326008)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFBFVHNtWWxSMGNZTHF5T3RnWnF6emhDT2J4bXhSOGc2UDg4MW1SNWFPQlNy?=
 =?utf-8?B?ZUJTTVFBSk9qLzVrRldaRkpLVXJPOUVxRVZWcUhqY0NSQXB4a3V6UTNnVStY?=
 =?utf-8?B?NXhwK3BRSU9ERitGa3ZNbmtJbU40NGZNcmlGK0Y3ajNFaFlwb2pjTVRJTVYz?=
 =?utf-8?B?L2c3MHV4QkxHU3ZkcWtDUUl1K1BuVTZZbDFxWFpUaW80endqSlZJM3V3SHhL?=
 =?utf-8?B?R0l6S2NSWjdES3NHUU5YZ2poUU5MajFYZHRPRFNZNUdjSjhEYnE4VXVUamk4?=
 =?utf-8?B?TmF1MnU3UGFCckJOVko5ODBab1REc2VpaDZJTTlENTY1NzlyRktlRjVBNVJK?=
 =?utf-8?B?Z2h6aDYveERKbUZPUHQrYlI1V2VsMEVMMFArMVlDMi94UUQ2ak5tWmJRWmFV?=
 =?utf-8?B?NGo0VFUvZUJUcENiTC84dFZzVFlUOW5sa1orSWZFT2dRMnlSQjR5blRScFV6?=
 =?utf-8?B?MmR4MktGQll1cmNaeGhGM2dUZEduMHE3UG0xZGN5emllTUVITlQ4N0JyZmdI?=
 =?utf-8?B?SGpLYkRlQ3pwSWgwK3NwT3Rad1JuRnYwcGZaelJoY093d2ZFbnc0c2RlUTRH?=
 =?utf-8?B?QnR6QlZxcUlkQWI5ZHF6Szk4cU5sY1JHR204ellwWXQ5V0JaaEVPUlFsMHRR?=
 =?utf-8?B?eFZNd1NoTEl6cWRmalFNQWtvQTZJUExTVWxmWHM1bXVLUlVlL1NXbTZrd0Mr?=
 =?utf-8?B?WG92TXNQZzlldzFMK3NYSHpuMnoxSmdtTjgyaHhhVkgwL3JpWXpLS21pQlNW?=
 =?utf-8?B?NG1KMkJEM21NR1ZjK0huditQUmM2bDB3dUlYa0VVQncyU0F6emlCejdWZjJS?=
 =?utf-8?B?QzU5TXF4SjU3bmRncUpnZHNkV3dBZExvU1QvdUdSZ1BoSlNvd2cydGFOdC9F?=
 =?utf-8?B?a3RhZzZEVXJGcllkUGluc0tYSGdUdTVkWGxsd1hYTzVub1lQVlpaRndDSXR2?=
 =?utf-8?B?VTJSdDJTQU11bXNFR1dvUzJkYkZTOGZjVnJMZjN6dGJEQlFvbjRaZUNwaDB0?=
 =?utf-8?B?dURvZ1ZtaW9Cb1NBNUR5WEtFbHpmKy9YRWdFclB4MDFqaTFGREFnVm5Ua1dQ?=
 =?utf-8?B?YnJlTGpLMnRkNm5JS2VkNHV2RHB5Y2NhQnZzWHRDbHlrSkpLQ01ZdVkvS004?=
 =?utf-8?B?dGVyNko5amh2d1RnNXIrM2JEbTlPMzlySGcyNHFEVWFnOWw4Q0VHa0xNaTJH?=
 =?utf-8?B?cVBWSFRVOENYSjhYdTVlTmNlV0QvNTBHMXRONG10QlBkOFp2b2w4TmE4Ym1y?=
 =?utf-8?B?NmxRSThmWFRrWkJab0JQYUJPZytwWDY0SFZ4ZkRDeDY1Vno4am15emhQY1NK?=
 =?utf-8?B?RHk5aUJyL1Mxa2cva2JpaDdoYVJlNXJzdGNJRk5TN1ZMZ2RoZlV4R09yRjdX?=
 =?utf-8?B?RlBROHBkUEQ2bGJhMXpWMy9pYjEzMzE3K29iTGVpV0xmRXVSQVdwOU9rV2hF?=
 =?utf-8?B?OFU5WlN5US9HOExoMU52WmpPRU1tZHlzblJpT0RQckRSdlpoQXdka1hNdjhu?=
 =?utf-8?B?VWhVQnhWaksrUUdHd1hLcHRBK3ZUM0xwR044NFZiVktsdzljSGMxQldGNjhh?=
 =?utf-8?B?TlNpdmVNSWluRlNNa0p2Qmh1bkRWTEtVaVRjT0xCY0ZjeGxXZHM0OTlSRTR2?=
 =?utf-8?B?VzR1T3V6TkF6SXlDelZjQ0JkWFFYaFpUMERLekl3VWtaNVkxaUR4S2wzbnl4?=
 =?utf-8?B?QU9KTUhrSERITlVRTEptKy9wc1BNWVpWSDd5UTNrZWdmSDZycjQ3RVc2TzRn?=
 =?utf-8?B?MDZTZ3Qwd1VmTWQ0ZDFnWFhKRCs2MUozSlk1aUtMUmgxTDJObE1pVTYvMGtn?=
 =?utf-8?B?MEZ2SlpNUnl0bG9SU0xIbGhIVFJsbElleTh2YVBLMG1kSFR2U2o4dWUzVDJt?=
 =?utf-8?B?c21ObnV6aHVwcFhuMXhXMFNEcm02b2pxMEJ5QU1FVjBiN204MEZHaGRsTUFH?=
 =?utf-8?B?akx2UFhNVjB4UXphVG5lK3N0V0djeklTTEFZTkhySUJKOGpiaDd0VEVScDFE?=
 =?utf-8?B?bGwrY1VrUHBPdEtlU21wOGxZK1ErSTdqZHBtV0RjWjkwcWwwYk1VNjhKUE95?=
 =?utf-8?B?eTB4L2VQWTFSdlRNbkl0YnZ2dUkwd0V3MEpCMEF0Z0JSR2RuT05PdGlYRHlQ?=
 =?utf-8?B?eXJCekdoS1o1U2xvYTN4dzVqNGs2QlpCb0Zld2kvd09OdFZORll1Q0JXeUFq?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0W1wDlxc5Qk9m0+arkFoerZC2KExQXVM9MW7XGNNMjjM4Hah1/RKV2KksH8lgytjKGA3GFsj6Ojl8f5Ezp4VAG6RPP/02ddB43tn4TggHmFfjAbfPhQBEO4tSg5G/trz1Aq8fA5VTbwxo6AmiikPKeSqbb2QzK3BKZFhfI5a12CJ4g3AA0CqVctJ/J+HAzRdFTA94mlQ5IhlFDOntPou5aXSrI7SjpQ0pteAnvNoalfbmIG69M3IKy9NmbUExNVqoLjvW3f3ZhPxkYU3MkwkWumdW9rkawIYXVLI1B6OxZQ67QmSfmSl0R+jQ/K9D+SqzooC4Ye0V4o2yYRRP4ueDQ8umQFjms15pUSez5wJThxqUZ2RhKFz9HU4GWpSPOuBcQKhSiF1iDgPVCWJG4YLlT/8dQxVZw7vKux7syRM4XzEL/yEZf/FmvJcRLap7I7hAxSlxR0ZNDrN8AJ0SfKuJhWeb8aWMUkr6ejkjQH072zwKHV9dAv3NEQhLGyi1m6T9Ba/sRoIuLDnwClbBU2iceiPg7O8iae16Tup2AEmsOWubZLXOp+BSsoM8HWiNsd86HZv1wNq9CUs8vL8o+jtTD5h4aEjfngH2dJUgzHr2Ce1dCJXzSBmqFGzw952eh6n8+rtDVnrdudDwVC9CAgBuq5dPTiaIQ5h5VJBooNy6pxRhR0Xip2oF3e45wiGQiTAcEaJrGVoT8ihp8eoSZc7VIe4M+weTCFis1e7x+G4QW1rRwLSCdO+ZQVzCNteINambxOGlmy7pGAGk6e7cyTe2Ucrp9P4eEVGDb78O1eF5wqB1gDyhuv8KDHd0KrVIpZ+kXsWHPX/x1d4fD39gPPiD8HKugT/2QGC03Q5gRSg0Jw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e7ca1a-c745-4294-17dd-08db158f75ad
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:16:50.4497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bwuO0QVy4BS7leZvVYfvSbOz7kt2Gp/7MYzvzfr6A6iKZ9fGkyCSGkMPYA2R6cVX21ArOE3Q1fJg0va8a0tkJWX3L21RzUjXE5GCdeLmFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7003

On 22/02/2023 12:00 pm, Xenia Ragiadakou wrote:
> Create a new private header in arch/x86/hvm/svm called svm.h and move there
> all definitions and declarations that are used solely by svm code.
>
> The function svm_invlpga() stays in arch/x86/hvm/svm/svm.h because it is used
> by arch/x86/hvm/svm/asid.h.

I'm reasonably sure that all headers in arch/x86/hvm/svm/ other than
svm.h can move to being private easily.

>
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>
> Changes in v2:
>  - new patch, the creation of a private header was suggested by Andrew and Jan
>
> I have not added #ifndef guards as it is a private and it should not be
> included by other headers. However, this is considered a MISRA-C violation
> ... I 'm not sure what to do.

Always have guards.  Firstly because that is the decision taken by the
MISRA working group.

But more importantly, because life is too short to deal with the
shooting yourself in the foot which will occur from trying to take
shortcuts like these.


> diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
> new file mode 100644
> index 0000000000..b2ec293078
> --- /dev/null
> +++ b/xen/arch/x86/hvm/svm/svm.h
> @@ -0,0 +1,40 @@
> +#include <xen/types.h>

Elsewhere, we're retrofitting SPDX tags to all source files, but we're
already putting tags in new source files.

This one needs to be /* SPDX-License-Identifier: GPL-2.0 */ I think.

> +
> +static inline void svm_vmload_pa(paddr_t vmcb)
> +{
> +    asm volatile (
> +        ".byte 0x0f,0x01,0xda" /* vmload */
> +        : : "a" (vmcb) : "memory" );
> +}
> +
> +static inline void svm_vmsave_pa(paddr_t vmcb)
> +{
> +    asm volatile (
> +        ".byte 0x0f,0x01,0xdb" /* vmsave */
> +        : : "a" (vmcb) : "memory" );
> +}
> +
> +struct cpu_user_regs;

Looking at this, you could fold patch 1 into this patch and reduce the
net churn.  It would be fine to say "delete used forward declaration" in
the commit message, seeing as you're deleting that block of code anyway
from svm.h

If you want to do this, then I'll skip committing patch 1.

~Andrew

