Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EAC72CE94
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 20:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547409.854788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mPh-00048x-3D; Mon, 12 Jun 2023 18:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547409.854788; Mon, 12 Jun 2023 18:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8mPg-00045x-V0; Mon, 12 Jun 2023 18:37:12 +0000
Received: by outflank-mailman (input) for mailman id 547409;
 Mon, 12 Jun 2023 18:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8mPf-00045r-A5
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 18:37:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21d67c4a-0950-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 20:37:08 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Jun 2023 14:36:50 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5416.namprd03.prod.outlook.com (2603:10b6:5:2c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 18:36:48 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 18:36:48 +0000
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
X-Inumbo-ID: 21d67c4a-0950-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686595028;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6cNYgH5GjSm+3+tS5Bl2LInUimiNBqJwX7o6yUKO8WU=;
  b=IKXqyceoAQayDQtHqOATjFGxKFKHcqRu1HZofRriGb+bJ4zA0eYCa27n
   paHL3lCRgfoG6m6qvAdYA8/3y7seIOTv8MVXqJyi9aLqDKAZUrFHFnXgN
   RMVvFlsmy1hCVOLeIYn9Az8oT2WHuwWPmXVracg1AmYfHyrNh16BMFTRl
   0=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 111255744
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O9eZOK9a7IpTWxlYCaKpDrUDQH+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 jAcDWzUPv6NN2qgKIp0PYi/phhVuZDWyINqHlBs+SE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks31BjOkGlA5AdmO6kR5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkSy
 L8XBBUnMym5oLyr4ry3c7ZG2tQKeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujtABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtLTuDlqaI26LGV7lIcVR4ceVCGmNSehB+fUdVTF
 E9PxzV7+MDe82TuFLERRSaQqXqJvBcaV8BXVfMz7AWAyK386AKeG2RCRTlEAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9BW0IaDIATAAFy8L+u4x1hRXKJv58FIalg9uzHiv/q
 w1mtwA7jrQXyMQNh6Oy+Amdhyr2/8eXCAko+g/QQ2SpqBtjY5KobJCp7l6d6utcKIGeTR+Ku
 31sd9Wi0d3ixKqlzESlKNjh1pnwjxpZGFUwWWJSIqQ=
IronPort-HdrOrdr: A9a23:UCygAKiYaJlzZLFtdawpDEO7PXBQXkQji2hC6mlwRA09TyX4ra
 CTdZEgviMc5wx+ZJhNo6H4BEDiexzh3Lp4+5MYM7vndgzvonHAFvAB0WKB+Vzd8kTFn4Y2uM
 tdms5FeaDN5DBB/L3HCSaDYrAdKbK8gdiVbInlvglQZDAvR6Z87xpoTia3e3cGNTWvTvICZe
 ChD7F81lmdUEVSVOv+LnMOU/LYzue7867OUFo9KFoC5BOVhT2lwrvzCQLw5GZ6bxp/hY0MtV
 Tfk2XCl8GeWiiAu2PhPrnonutrpOc=
X-Talos-CUID: 9a23:hDJNkGA+sRFi4hH6E3Vat0E4P+p4S0f6kmryLUOBVkw1WJTAHA==
X-Talos-MUID: 9a23:idFBdgTWx9/BeK/uRXTSi2xhPutj3p2DL05csJ8Bt/aHbhFvbmI=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="111255744"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6+GngbqxzaEhGq3oBAgIwylJsPGEQkHhZNtwaIwOg+5gwnzIsnhgJ6bLRJ7scbJnceUBBJ8cdCcntdNn6pDNGTtTyubvAYAvN+2I9XMQ4nj1RwVxAO7PMhraxVc3vVcYY+BpxXLvfgxvmHPXcIa97YaGgaY4BbQsATTtZieitu3ofJbTm9soiq8GfYRNoy7l1pmpDBNHJeGUpfmElzIw64P2PzNo90+sfA3PRJg4CFhFr7Ozuyfaqg9W6eg/ipJYKau5QGmnVdQdVBdTD8wY1/irneHna+7OV0yyLqRw9u8kLEKsBi9nJya6GeKxUW/Czahkfx8bjqEdxt809u9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cEKnvfMyMrMUYGh5TGsd8PDeIzFVmCdCfrIM2gz0xk=;
 b=PIMOPrqHtMscqOdz1Bn3zWHbgKJBOAp8HN3gEJfyeHILHtj1dtywf+7ZkyIIiYCZ54XWDRFxhMAP6p0aIHDQBs/O+Ko9sQdBjKGenhAzDOi+8WdJKKpTjzCUeyzE1Zm3Y7q+cWIiMrUov9ki5z4r86/E0341vFAWOeUQ5eWsDFNWmjsD/jVo/p0qnePqJ/UafvQVAuwOn1NXBNMCrbxEuPBLRYT1hgO/75vi2gZqD3rkJJzQq2+S0eKaFEuzuIQCcbzc5DrSSJsgjFieqjG0DK5tZmSU3elzOCLXhdEBkXVx+SMfhOTGgyp1YQGIlSCvnxM2OP/10GGM22VoNUZMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cEKnvfMyMrMUYGh5TGsd8PDeIzFVmCdCfrIM2gz0xk=;
 b=YQC5id92d6dcd9jVxZg5UJ3YgPylWU4uaFNeSKv5b85m1HedhmBTkEZoKRPR7BALSUjXzX9KQDybZTY7gotmEapGwT1oYWqtXMaAXbup4EMlOFYnGI8U/8aLgQIT84qi5hVtB/rTFn0c7z5zwOE7ilFXwOA6qsDil56yZR4SBss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5bdd4d6c-6375-35d9-35c7-289dd1f7c4bf@citrix.com>
Date: Mon, 12 Jun 2023 19:36:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/4] x86/microcode: Ignore microcode loading interface
 for revision = -1
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230605170817.9913-1-alejandro.vallejo@cloud.com>
 <20230605170817.9913-4-alejandro.vallejo@cloud.com>
In-Reply-To: <20230605170817.9913-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e1fe2f-293f-440b-e9ba-08db6b73fb02
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CjpOX8vv7r1ZBYSf0axpP0Esg5xeaFOLTexcqCKzzyE6i+eZvb2lCW/1lqWQp625qtNqKYAUNk7fzEyZbBk7LPpnSJ6PReHc52gciSSoQFlpiaX1o8+nCWFNyTWadq7Cncv47xPSq/d/Ni0IIQL60yMawJi0bmFEeUug+cMIP/gFWiRkjafGCWS79/pIXCYCsfo6rN5zTbKlqiMPcsXWdF+Sg1YGCZYkQMvTSedK2VNz5dsSD8e5kqfknnhfSqa1u33tLLek38mIp4zeYLIQzCxcxO9L0ZM0PJwIn6shDy+SNh4os/PkmEpo+Q16y4FVTi3fTsNSd2aaF2btisDnRnAnulFLAzXhDIBdIv7aVCjx9845ruqX3UPY8shp/ULDa3uXDjBu0KzHtyO2nJRNXYMAr4qz+6DfeKLxcheYjLErQ0CXaEzzfHOfD1fNB43qLOHfVXWvLSzFRbd29a8VuVVsxRxt7pYfEa/5WQdn1Noki01fXlm1UVi32QhdEesYaD8cJk9HxRKm4V6QUlvRAJug22r2jzdjw2gcB3WuJ1cQ7bzCudziQY8CuPPdv0pi7mqUxK5L94Pqj91RJUnz0LMgfMGNvGSWI5TaLIwgE1FiLLUfJfRY0hoXilWP7yQxll6sdJuPW3n/SGIhR4jh9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199021)(6486002)(6666004)(36756003)(83380400001)(2616005)(31696002)(38100700002)(82960400001)(86362001)(6506007)(53546011)(6512007)(26005)(186003)(2906002)(5660300002)(54906003)(110136005)(8936002)(8676002)(316002)(41300700001)(31686004)(4326008)(66946007)(66556008)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1VOSUZGc01pY3NJZFdKb1ZXUDMwVVRZMEtmTU4vMGZKOE50Mm1jTXkyQkpR?=
 =?utf-8?B?Um81cDdTaWhBYTBWaEpWS0ZSdmMvZ1Ewb3FmYnR6eHFHR2RUdVJsVWFFY3BJ?=
 =?utf-8?B?ZkI1c01zNUVJeEZzT1pkeHBUSnREVXBrSWRTODJwUktLQm9XQkMyZWZQd2gx?=
 =?utf-8?B?ZnlBZy9NeXJxc1ZuVE82QUJBVWxpdGhlaC9hdHo3aTh0VGtBeXp0blFxTW1X?=
 =?utf-8?B?YVhUYitXSjJtV1B4cXBPMEtJMHZEL0FwRzVxQjVhaVExUk82TG9LOTBjR0Rw?=
 =?utf-8?B?WWpSYk1zT2UxVnFqVk41anBCQzVCN0FFcHVNZ1pCRWRkZFRhN3FVWUEvcG5F?=
 =?utf-8?B?M0tjMkowbnBnd3B4NmhhMzhmU1BXczd2VERjcW53M1NsZEVtMWFTYU5lR2NW?=
 =?utf-8?B?bjd1NkYyeUV1ZkJFM2xwSUNmSjFaclhZWTFsMGtRMGtydDVibXIvQUMrd2tu?=
 =?utf-8?B?TGJjSkF6b0Y5cWsrQU1uSDBQNlNqZHI0d0NJRmNhQmZQbnV0ZFV1OUVJd3I5?=
 =?utf-8?B?Q29QdDdUdWM0dklobzVXcGY5dGUvUHJ3N2pKNmpWY0FqaVZIcHFCTC9qdFZL?=
 =?utf-8?B?RTdrWHZ3cXpGK3dMRzB4ZGc4ZElGU3ppa1A3NFBnaW8xdVdlOVY5eW1OSHRw?=
 =?utf-8?B?a1N4eVpNQUhKL3l0OStnZFROQys3d21McklvOVdZUlN3MWZCWVdsNU9WS3g3?=
 =?utf-8?B?aENxRE9tb050U0RiNGVpVkdMU2NObWw4WVFXc3R3WFYvVHdLMnhSQXBCWFR3?=
 =?utf-8?B?aThpSWpxRTl5SWdBS3Y5NnlYbUdmVUNsWlJpYktLTzAzQ0JSZndqdVl0T09O?=
 =?utf-8?B?b21wTjZ4U2tobFhlTGZMcnJaeEY2VWpyT1RaZnA2bkpSQjlERGFEazk2VnB3?=
 =?utf-8?B?VVZrcXpzYWJLVnFDOTIyQlJtNE0wdzN4eDFDVWxQODBpdmFCZURTc2RGbmhU?=
 =?utf-8?B?Y001NGZsN21TRXltR2lmTnp5bW5jQWIvaXA2TDhaTzAxWUlHVE1Ic2FpYmpt?=
 =?utf-8?B?U3VBbFV3NlZwWWpKYmVrcnVwYkZIcDRHV2NZWWdkK2pUNVJ5bTBaZ2hXK3Zl?=
 =?utf-8?B?eExOYzFJenZTUkk1cFZaaUw4NlNBZXFmVW5pR0dGR3JhY0JMNWJ2c1E2YXR3?=
 =?utf-8?B?M0R4K2g2U012U1VqVXlGNlJrYWpXQkhtcGVPaitDblcyMUJGYWpXZUlIcnFa?=
 =?utf-8?B?b3E3WHpJYkZhR2puN21pMTFvTnFkYThYdnlXemdDSWEzTnlUNVNZL2FxbWpR?=
 =?utf-8?B?R1MwVkQ3SWhMek8rY0RGay9XSGgwamw0NDhCdDVnQWtEQlFiRlQrbE44WDdC?=
 =?utf-8?B?dVhvS3BEWHRhWTNHWUkrVVhMeXUxbzB0QlU0RXl2ckRXcnZTeXQ1alQ1RzRk?=
 =?utf-8?B?Q0RXRXJVWEdzWDZmb0RSbXlZUnF0MmpXVW9wbFJHbFFOZHk4N0dCZS9Ldjcv?=
 =?utf-8?B?SzMvSUhWamUySzRxYWtTWTNuQ1NvbUhuSzhZKzByemtZVi8rcFZvNjdicXp4?=
 =?utf-8?B?RlQ3ZUxMeUFRVzdjNkF3K245OENRRGl4cUd6L0dpaDI1VEdVYVlKWXlUcFlC?=
 =?utf-8?B?Qm1RNlo2cmdyemJZc1hORDByeWpZVnlKVk5lUEh1bVJsOUhtU1lOQTNJUWt2?=
 =?utf-8?B?dVRMUWdYYnpNdjlrcm0ySlJibDFjWDdkVHgzSWh5U0tjME5kNE5KVmZVVVVZ?=
 =?utf-8?B?V3R2MW1KeTJlWENEZDZNTDNEMmJJSDArY0xRUGdaV1NRRFdsM0w0SGlYTXBn?=
 =?utf-8?B?aEs4Q0FrQzBLdHlFRThyRlhEYTFUSUo2bjV4NzFNMXVUWU01endYS1FqV2hJ?=
 =?utf-8?B?ZWVjcm9vK0RqWTRaK01QNk55blFpTTA1dHdVVlV3dUNUYWc3WVkxN2UxR2ZM?=
 =?utf-8?B?a1dJazVNZE9iYU8xNjVzMTkyQWRpc0NWRkI5YzFYWmRGZE43ZE9uWGlXR0Ev?=
 =?utf-8?B?YVhsMWphZjVHV1d0THkySW5qQmg3bVJsMWprK3JxQ2hHZDAvWHYybTAvTHVh?=
 =?utf-8?B?YzE5bTNGNXpDRTZQYTh0eUdNbWZKMVp5NThZSFVDSTJpWFRWZG44Vk43QWFK?=
 =?utf-8?B?WDR2TUFTSERUOFkyU3ovdnhkY2s1VFNVUnp6VkZTc2xvZVo0MVU0c2ZhZGZ6?=
 =?utf-8?B?b1JMWmY5L0ZTWHBDSjhaZ3Q0ejV5ZGd5MEJWY2ZBa3dSNy9ZcnZwQkoyMkpD?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EEn/hqSR7XoZYwHM6Bh7XAV6mjGlWHVUCQREyKDwvU0UQXpl2C94VQDOLG3fTGnBSWV2dWRv8R0gL5LTqUG/aOPOxYbQ63pB82pXd4gCMLwoiFtj/OjclXBo9+XZRIneTwFDrULakEniOXoZIdOSVuw3OxLZNjzOKmMQx9bK0NUF5oWH8pED/aRqaxUgP8iL4Q2Th5cfvION3eEHBWOzpfZYUPAwi483knQWXMaJKESAS1PiJX/eTvuWBZsNrHxFoa6vvSMQJs25Qc7VVwvFjO4N4sjEu6crF/2fr/bHuH2xcbqsblBPebfxbNU1X1r8CGRzNYsWtxBgxTxPZb/LpaoCfIRaPFZbvaVFa5HQkjn6U2FvSP5sv76tODn/qsfo/mEt+/7583OuLtaqN+0gBCY+wy9asiBJg5X7oIJYyn7FvlHXxZznWDIVXNgtqazRfkFzGynM0/G4+ZiArIumccliyXUpScvkRV+mdbxhVPCbBVw9ClvMFXu4iux9CupukZ0hBbM74AmRvGMLnzTTv1bIblW5Mmm5HhKxpzrfzxUToM+jeeaNh5ioBi5ibeFx8L/QRV5iuU6RC58+5y7dIA+uNijZDLOnPBjalA2wqWPQwjIeqkRyrY7ZAfttsqHccW0s7Q3lhHc2N41C8fPIAB6ZdksuVoe2YIwAVn/Bldb+ZuJQHfS3Ecsot0ByoyRAOMvvjiQnBkpY/9NbSNsuUcz44Gm6ygBDOhXs6/VWASb9wnI9JdReFYul0sE17X9HOrpEbAbz6zYFY9Unv1W3ePrHfMR1zan1bNvmtyB6AU+/MUIUettau8Wa4cTNp6Q4cwjgTD8BpmvVgsYlabHYSXLAU2JOM1K14b9JWgcfQt4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e1fe2f-293f-440b-e9ba-08db6b73fb02
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 18:36:48.2827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXa+FimbnnlL73M47Zg6VV6MuRf6N2xZCfe2bHq2pqUypzIGhCYCIbEz84yAO7/2yJyqL9BvuAoXqBOO9CNokMiWQpJ52EDAeBGql1viOn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5416

On 05/06/2023 6:08 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 892bcec901..4f60d96d98 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -874,6 +874,21 @@ int __init early_microcode_init(unsigned long *module_map,
>          break;
>      }
>  
> +    if ( ucode_ops.collect_cpu_info )
> +        ucode_ops.collect_cpu_info();
> +
> +    /*
> +     * This is a special case for virtualized Xen.

I'm not sure this first sentence is useful.  I'd just start with "Some
hypervisors ..."

>  Some hypervisors
> +     * deliberately report a microcode revision of -1 to mean that they
> +     * will not accept microcode updates. We take the hint and ignore the
> +     * microcode interface in that case.
> +     */
> +    if ( this_cpu(cpu_sig).rev == ~0 )
> +    {
> +        this_cpu(cpu_sig) = (struct cpu_signature){ 0 };
> +        ucode_ops = (struct microcode_ops){ 0 };

I think we want to retain XENPF_get_ucode_revision's ability to see this ~0.

As with the following patch, we want to retain the ability to query, so
leave cpu_sig alone and only remove the apply_microcode hook.  In turn,
that probably means this wants to be an else if in the next clause down.

Moving it down also means you can drop the check for collect_cpu_info,
because it's a mandatory hook if ucode_ops was filled in.

~Andrew

> +    }
> +
>      if ( !ucode_ops.apply_microcode )
>      {
>          printk(XENLOG_WARNING "Microcode loading not available\n");


