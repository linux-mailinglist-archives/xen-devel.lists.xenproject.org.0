Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEB704AC7
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 12:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535107.832726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pys1J-0002T5-W8; Tue, 16 May 2023 10:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535107.832726; Tue, 16 May 2023 10:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pys1J-0002Qg-T2; Tue, 16 May 2023 10:35:05 +0000
Received: by outflank-mailman (input) for mailman id 535107;
 Tue, 16 May 2023 10:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pys1H-0002Qa-Lb
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 10:35:03 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f80f530-f3d5-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 12:35:02 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 06:34:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6939.namprd03.prod.outlook.com (2603:10b6:510:16d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 10:34:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 10:34:30 +0000
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
X-Inumbo-ID: 4f80f530-f3d5-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684233302;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X7nDNbKADaN3fZZUA0iUy29+Y5ne+Hhr1lGewDtgROo=;
  b=OgHBhJOQFScksvo4ORGBHm7jpVPDHVwMKW127gMA3NKtVO8crpUJkl+b
   5M2M5sTC1gD0ZWQIU7M6VDEN0q8yJt80LFRcchwwEVldWR2TuJujKaLDQ
   8T6z0HO4JCHN/mBRn+0wKMETu8ptCBEHyZxQWNaFakKmyoiLNvaAi8r9D
   s=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 111653578
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QJ3eZqxwBwih4loc5lp6t+caxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 DYdCm3Sa/mIYWGmL4t3OoSyoEpUvsSEyYA1TlBsriAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRjPK4T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVtE8
 d0gdhcnVReeuLjum76QZ+x0vtt2eaEHPKtH0p1h5RfwKK98BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjWVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdtMSeblqa4CbFu7w3xLDwxOUFeBneS82kXjV+lNE
 1IXw397xUQ13AnxJjXnZDW2pHmssRMRWMJUGuY3rgyQooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YW2Z3qeZq3W1Iyd9EIMZTSoNTA9A6d+zpog210jLVow6Tv/zicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQWChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:B6+JoqoyUsONNGdoD+skDjsaV5s2LNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJ080hqQFhbX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YZT0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dND2CA5sQkDuRYTzrd3GeKjM2YqbRWK
 DshPau8FGbCAgqh4mAdzE4t6+pnay4qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFx9f3Ls49m
 DBsgrhooGuqeuyxBPw33Laq80+oqqs9vJzQOi3zuQFIDTljQilIKxnRr25pTgw5M2/9Vowl9
 HIghE4e+B+8WnYcG2ZqQbknyPgzDEtwXn/zkLwuwqvneXJABYBT+ZRj4NQdRXUr2ImodFHya
 pOm0aUrYBeAx/slDn0o4GgbWAhqmOE5V4Z1cIDhX1WVoUTLJdXsIwk5UtQVLMNBjjz5owLGP
 RnSOvc+PFVW1WHaG2xhBgl/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgPcSm38RnahNPKVs1q
 DhCOBFhbtORsgZYeZWH+EaW/a6DWTLXFblLH+SCU6PLtBGB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMy12oFR+BylehT9Yd3U8LAd23FFgMy4eFKyWhfzDGzG0vHQ7cn3O/erGM
 paY/ltcrjexWiHI/c84+SxYegVFZAkarxnhj8KYSP+niv1EPybigX6SoekGFO/K0dsZkrPRl
 0+YRPUGOJsqmiWZ16QummlZ5qqQD2xwa5N
X-Talos-CUID: 9a23:G2hZyWwhFXdh8NUmPjb0BgUuEMQESiP65kzXPnDiUT1lY5CQUWePrfY=
X-Talos-MUID: 9a23:wB0Owgth2avQWmqk382ngSE6M9Yw5qiUNF0IwZ5bt/KWDTJzAmLI
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111653578"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLacr7lUO1hdOa+st8bZBQwwitqTnpngG6yBFRje+sTpaMy6xv7c7LjW7L0JBsU5heOnUYw3t2Z8B45EP3VsGLmvw0KtlahBTRu1E8IcyeGkf2nF70jOM3GCC4t3wQvkQmBgTF5qwxhbDXsvBQYaAVSZ+mA68+ukdA/Ei9r/zJsc/KRQB0Nws6Uia1ZF6hZu2U2q+3OzTCZ5Sc/JKZIaHrU/Q0xQMieuKe0C4IPBKQYU+UiGJ2Gfxj66QXwXtmBzZacUKT0fAiwDHahmTOxfYsKQ0SLBXE+p4ekVvobNxQHGT/nik78e5T2zfzlr4dl3SCwzmr0HVEKT8hbEwLkxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7nDNbKADaN3fZZUA0iUy29+Y5ne+Hhr1lGewDtgROo=;
 b=d9ybLRu/tm66+3bxFFcusFfLHAcRJFGqyf6iAXe9O82zDhxK/VjGKUJY9asjUmKucURghpScwrDSykm7h3IX/eUFgf4n4ipFisRt5RmAZr9QyMR5IDGYbqlMviGuDQ/y43y4jYzAii8iYMljwTR+bbaKQVWHRmAkmTcPQa5oDRDX4K/f4epELk9hR3/dhrsmxp/B+/wVkYoC6NDuvd/JJniL1zNJW7KJRcykGc4JqNrA9LMzrZmxyRUhVuqrj50WMiYcGF9jmNmNspjVGydrWfw4K9TVEOpnxT4cT1wqSf2B5lpLBZIuKQrG2j+esVdliBXcJR3Y/KNr4RXQBAkFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7nDNbKADaN3fZZUA0iUy29+Y5ne+Hhr1lGewDtgROo=;
 b=SKzLRRECkDlcViSSDU0s5T8G0tHkCR507QfXL6/4GxqCGvdRQxCJTHmzOno2eBKb11YlbUApchOCwEF82QzEZq4aG9rTuvaCHwYrZ3r5Lhrd4/dFrdrQJJrnvplHDNJRz6dh7srk8G/KhKSBGyajM0LmxtB7y+wjHxCehb+pRWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6e9af5ec-4484-38ed-2b40-6231baa9ec93@citrix.com>
Date: Tue, 16 May 2023 11:34:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] m4/ptyfuncs.m4 tools/configure: add linux headers for pty
 functions
Content-Language: en-GB
To: Florian Schmaus <flo@geekplace.eu>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230516091355.721398-1-flo@geekplace.eu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230516091355.721398-1-flo@geekplace.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0234.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bd859b-ce80-4219-a453-08db55f92192
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XG6j3LtNTcWfvE86yZcLbMwEZnR5lvYE/8kAGAcdYg2u8fosIywDyGzPlhmF0YZj3icfwvK18SEODIJcWNO+ojebN8lSEuiHjY4E50/BfpCGuqaZd6QtGAxTA0fyRGVkkr04D0nNHlQ55SE+MYclUTbPzyU9UqJYbMwHEQuDS6ROXMyNjjyAXh7ZLnxqOFBUht/bGRCfEwck+6eaLU2SvaJWb3lnWEc0kxuDmRoJWzA57UeqblVou5BldNt7lz1IVZxgtUoUgRr2KmlGHYMEZsVbiyi1y11hmPS+031yai5ASlMUOc1PzkyWSjriuXS565aTjxZQpl153xEn+hEOQG/fy2il+VCa55Hg/2yz7IbeQ5BjZA/Iq4BLQdWc8U2hHsXmZATX/+EXlY1/XA+QB7fsFnVcRyR7YsbNEuBhQ2hcU5qegfXsHV7jTsrr4ikXF8ctkC8RbhH4yZ+tTrXQyDM/T7XdhVD+lLSdD+vpkoX2braQ/cEMKJu5uIyG1hANe/rM6seKLoyBuAZBATGN43C4IOKJQGFD5HIVtUDCQROHKghottIPPMCm5zqMltnhLpJlNwsHNmQPxDJB1qWd4qBD3Wm3+LOuM6IhzXV0E9VwA8GFFmZKGa7qq+FmMH6U6K0GoIdclIFU05vhSYVdfQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199021)(31686004)(966005)(66556008)(66476007)(66946007)(478600001)(4326008)(316002)(54906003)(31696002)(86362001)(36756003)(6666004)(83380400001)(6512007)(107886003)(6506007)(26005)(2616005)(53546011)(186003)(6486002)(41300700001)(8936002)(8676002)(5660300002)(2906002)(4744005)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWR3ckVaU3QrbUowZ1NYVmNLWURJakxFNVkrVk9Pc08wKzJNNVhyYnhuZDZB?=
 =?utf-8?B?Y05XTmxRKzJRcWtaQzd0NGlSaXZNVWQ0TWR6OEl5NDFSNUt5UFdhNDBzZzBl?=
 =?utf-8?B?Q3FpOVgzMXJuOC9KNm91U1haaTBid2IvS09nY29ySndvaDliNnlyNW82Y3N3?=
 =?utf-8?B?dWFzQ0VIVGxTeVVBVStUUU9qRUF4RzRGREcyTWJYMTJSSkFqVFFFZkRINlFR?=
 =?utf-8?B?aDU5MXZRNmQwdkxiVGQ3VGpub2o1SXVvNi9icjdSbVZzMHZxdHJxWW5NaHRh?=
 =?utf-8?B?ZTBGakJjdnNVUUw5QTNDWWppWmhGRGN5MWsvaWVNenpQYkZ0a1BFSnU2blhp?=
 =?utf-8?B?am5vNlpPaFlIS25OaWkvcU10MXUwSnJaMDh0a2RXWVJCNXhndGpQZTNpUWdX?=
 =?utf-8?B?UUFSNTNPRUpsQlNUVVpkOVFjUXIzSGNSUzgzK0VMeE1rQThMUlZqeGwybDNF?=
 =?utf-8?B?ZUxSUk1VaTQ2QjBPaFFGTWF4TlAyU1NkUXpScVB2Vm9Qbit4UlRMK3Roc1Y4?=
 =?utf-8?B?NGo1VVQ0Mm40aWRGd2hCNFB0eFZiTkZUa0JBaEtXQ3NZUnMxM1NjekNRVjZv?=
 =?utf-8?B?YXRaZW9VWW9XbHZwWWpUeStVdWR5S3YvYlZCNFZzbjdhOHdaMjJoQnoxU1hK?=
 =?utf-8?B?MGZYTjFJWE14c1BVaitTR05GS0thWVZSa1JqYzVYbklMU1FuSUVDWXE5a1E2?=
 =?utf-8?B?NUZJNzgvWVd3OWQrTkdGZVJOMlZMdVk0QmxITXU3OUZ1clB0aXRYOVlDMytr?=
 =?utf-8?B?ZEdTVFNVcHczdjBHY0NDZzJ5MjM5TmEza2kwWTg5SGk5T25lM3BCUHl2U1Uz?=
 =?utf-8?B?TlpYR1daVHYzWjZxelBBenMyNlk0Z1NMWXZWeHIvU2VWbmMyUGRhTGYwU3A3?=
 =?utf-8?B?MEROU0hoODdrN3JXZmdBR2RrektBMkdkUTY0WWxnMEpKcE5HVW0xTktpSmVT?=
 =?utf-8?B?aWh5MTRBTXFRTEkvVVVUYnJEdDkvcDJjR0w4UFllVjd0Nm9sN0pwRmRab3Z4?=
 =?utf-8?B?dlpzWDA5YTFFSkE3c2x1TUJMSmhwYlF5enlRVE8ySllLWk9mQjdvNVo3WUp5?=
 =?utf-8?B?aHh4WGpycE5zOUw3MEkxWjZvKzhkR3VVaGFORS84OS92Y1A4L3NrK1JYREVX?=
 =?utf-8?B?TFRhNjQvZHNDakJUNXhxOUFocmM1YVRXRFZUUW5HaThqdVV0dWhnK0JuZUc2?=
 =?utf-8?B?R1RpdXU4dHZjM2R5cis0VjM2VTlJak1JZTN2YTF3M0dGalhMQ3l5aGYvZVk4?=
 =?utf-8?B?VkIrTCtWR3JYbnVLd0xhcFdleEVHMDZkMlNjY29HVmVFSGVFb1huWkdBNHBn?=
 =?utf-8?B?VEpzTmNKdkVOSEQrSU1lbzJvNEV4ajdOaEtIdU0xOGZBcStpQXZtUmh3S3B2?=
 =?utf-8?B?SWZ2RTBJZzVlZG9TSUxMODhpaUhjUDU4dGFtaERrVTFBSDRhWGZCWmFQU2xi?=
 =?utf-8?B?V2VkUmY4UHdTSzlMd3d3L2Z1cngvMGJSeG9aMGpSeWlWMWdNQTVTbXVQRFhE?=
 =?utf-8?B?ZTArY2RzNE5STUp5MkJGTjVkcXEySFB1NkJoQndBZHlUR3dZd1FTQUhuc1dN?=
 =?utf-8?B?MWV2eWRzY1FLWVdaMGpITlh2dVBaWWwrUEpSRFMwOTA3dmZyVFdjMVEyNFZr?=
 =?utf-8?B?TFhZWE1VaWl6QnhTNFloQmJzVk1CYkFPbklPbWZtWDI1elRCVkZGckltcURL?=
 =?utf-8?B?M1QzQVRIQk1uQkdHc1RiQXlNQjF2eTFzcThhQkdJYXBnejZ2OGtkY1ZJZklt?=
 =?utf-8?B?Y2ZCZldhSEMwSFpaSWQ3TkhCVzVCWGxpT1Jta00reVZEMTJQbzRrRi95NDMr?=
 =?utf-8?B?V3lUQkxVS1FSVmt2RFdwVEk2dC9ndVhhYy9MTEdjT3ptLzgzcnBXSUovc0RD?=
 =?utf-8?B?NVRPS3BDWlJva2NkVTJhU0J3OXJtdy8rZDVDbk85Q1hqdklBcW5CT0JTMlBV?=
 =?utf-8?B?T1o4aUhzcG82UHZxcHljZDUxbkUvZEFZaVJkdDFIbTQ3eWxkS1Btb1ZINmNX?=
 =?utf-8?B?cWlMbU9mN0R5MkUxdXNXV2RpUnZRbzRHM3ZFcEY4M1Z0ME55dmFzek1oSmd3?=
 =?utf-8?B?S3YwT0FVS1BuR1lIYU1QL0NVSEI3YkoyVHdUeHo3WUhVK0tkNCsvOHNxMnRQ?=
 =?utf-8?B?bmhJZ3I2OXlaSmVodlg3dG1IT1plTGY2bTg4VE5YMEovcEo3TWZiVittYVNG?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pSQtdL6k6YxwFNWd+kS2iBc5o90V6JZtNwQraxaZZwAKVLXgOuDyhpzUA9tp3h9RUqg9NfjHatr+eUj2TWIdp8wFQPl68Lh02vTN2Yxg4LGFR18hvGPZh7SJPvIMlpE5grIgAjTLouxQDrltKZmPWCIkbGTWGJVV1JYmMTAK+T36yv24mFSoWdBcA+1zT+McPbxucrnef4iZ2XWqIJh2U7iifmwrySRNHBHBeszE7/WsSsT9aMhH8u+z3PNkZSYGxK8RKDgg2QP/T8oGzblwgDE/NODgGfswchhg1aSVjXO72t/BSPjt1s/u2baRJ0UruxpCg5lArv4jPN8AF5KnHmSWOZd4TvYqo/omMWuTs/7//XM1HFHKgrboixWkksf3sBqT4sp067AT4MoKKUWRieNbtXVRUSudkVV0VmwOEG4JzNvhpx8pZcen053xuDRlc9aLSd5MIN1pXHCk9L9Uaf/uq6SA1FAE8DovHDT3OV4dequJlxj85IcNSwLXTC0DJg/JwHN9X3VP+/TmVKcoXUjbAxIs0rM5Keic0C1rp0K0nZo+oR+U+aUS1WYqgCXIuO8IVxhgZL0Ug1RWVp+/8cbQ0QNf1e52tp74NIWNYLuKQqnM4l1QsNnqKHnCwtH6WwE606WbMm5Ntckrb5BmvD9HTYoC4qvSMyHBJTRXpxFjhYSJJozo+wgttWPdZsVaF/R+OdlLf7n+mTwWVXd6/w4yvS1yS+HOKqxV9wCZW9KyJ9xw+2GO26Tbc/bjuSZsLJy4PAMCLDtxBP96/Bwf4ghIYHoUv5y5jpbHVL0TW6vbtX01iv8KamrcvzXYxIDsqCwODioN55rEVYNyO0ca0A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bd859b-ce80-4219-a453-08db55f92192
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 10:34:30.5072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGDGLOCRwQqTu7xOvn8RFUeg2n54k2vON8xtXsxVkjJ2WFfepqyNhgBfUSMAZiHfuIIjkB0C97zKTRm2Zcx2tdoZy3u7ptj7g12W2ucLRg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6939

On 16/05/2023 10:13 am, Florian Schmaus wrote:
> To avoid implicit function declarations, which will cause an error on
> modern compilers. See https://wiki.gentoo.org/wiki/Modern_C_porting
>
> Downstream Gentoo bug: https://bugs.gentoo.org/904449
>
> Signed-off-by: Florian Schmaus <flo@geekplace.eu>

Thanks for the patch, but there's already a different fix in flight.

Does
https://lore.kernel.org/xen-devel/20230512122614.3724-1-olaf@aepfle.de/
work for you?  If so, we'd definitely prefer to take the deletion of
obsolete functionality.

~Andrew

