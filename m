Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BEA786C4F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 11:52:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589884.921946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ70l-0002KV-28; Thu, 24 Aug 2023 09:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589884.921946; Thu, 24 Aug 2023 09:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZ70k-0002Hw-VK; Thu, 24 Aug 2023 09:52:18 +0000
Received: by outflank-mailman (input) for mailman id 589884;
 Thu, 24 Aug 2023 09:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+mH=EJ=citrix.com=prvs=593bb07b7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qZ70j-0001ir-Qi
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 09:52:17 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6af8761-4263-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 11:52:15 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Aug 2023 05:52:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6123.namprd03.prod.outlook.com (2603:10b6:408:11c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 09:52:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 09:52:05 +0000
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
X-Inumbo-ID: e6af8761-4263-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692870735;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZOJJhqPcQ/F0Rj7jW6oMZlyOkwyZl7zdfFG2n2BxNsY=;
  b=bZlz52yOn3/kO84hb5Mm/YpNKc2X0yifG5XXvOHURbS9O9IEYk1JpdAE
   ZesPY8Cv7tYrHVGlgn8DUbSGk+Fw4Cu7EIDQ8TzZueWHMqrEnrNm6jIfH
   oNf1xYmqETkizdWOKMLEBUfvs85Ydl+DLonQ4zxKQ62hGA5FwgtIrgVDb
   k=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 120369784
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8N6JHKty3qC3e5Dygj7oF2isHOfnVINfMUV32f8akzHdYApBsoF/q
 tZmKWnVPvrcamfyeN1waIjl/UoF65WHm9drHQJtqyo2EX8S+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+EzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLzkyRRu8iemKx4m8Ucdi3uMRc8PsI9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TefgraA73w3ProAVIDoLUHC7pdnhtl+BQ+JaK
 EI08Qo+j6dnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8ry62OCUTBX8PY2kDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihDc6r6Uei4gMzarTwLzcqzelp5yMSxFv4AzSBzih9lkhON/jYJG041/G6/oGNJyeUlSKo
 HkDnY6Z8fwKCpaO0ieKRY3hAY2U2hpMCxWE6XYHInXr327wk5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:go0iRKy2hCjOj2XFbQKJKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-Talos-CUID: 9a23:RXxGXWA5uZj2+cf6Ey5uy2UfJc4uTnrmy2z+LRefOzljT6LAHA==
X-Talos-MUID: 9a23:Y3NQ8QQIe1kBIE7IRXTLmTRJNMNIu5i/N1g9lJYIm8KkJQ5/bmI=
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="120369784"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhlgSx04SNQ31hS6qPR4Ecd0Tt1ywJeKHv3TOZY9KKmFpdNwVdpO4J/7TlUv/5VjdxWBXFX4NXx2GHHvqOQnIsz4ZKTU69BHAz0d2eAYbWSIu0xQEeJt/AaSXDTAr0XeG3xKJBH+0X3XcPN3KskcxF5lgfpgkNZ9hxP+PJ0p+NwrLG30ILe3QaVQv/3f8CKIXoCn6Xk68xbJudNWc+jn1qFTjoqtl7NQtbXRlJlqH34/H0Q7mxQu+DF13iP7HM4jdF4Zm5AoWyMlso5MDvTewnHWHiE5KzkoLLHW8LkAyv5PPjnsG65/Oiu4Qek07u9b0Vp6Q3zpGueCahgTjnmaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKO1P6M86OEYl2TUNsiivv9bDlIvxeu7cU1nIlckaL8=;
 b=WpSw8Zoi8zs+PAzyQbim3L4hdzeQTeb0qbhCPwfnRkIrgZeLXti+kadNNrOF8DUKKGf9g+AR80iMuqQzgNqea3RAtLa56BWHJoSNNQaeumqqOV0pJr81eIF16kAC/329oOLWdAeWsz9eXEybi5BL702EoQmHpjWW3WNnlcNf9SNnk02rqZnPZQJNqQDtpwOTx2HkgGbBypku7km5fLmp+FacEA5h8dN9EgCW2kqK1Bw0LgdcNoKRWxm7uo3N/YT2dclcsvPVdHpWhh9o1WAZzpIRiCo2Fo5Qc/SYsszz6fXnoTOEJc07f7SttYJnYD8NIgeWgUzFsWdfsNPjwqcb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKO1P6M86OEYl2TUNsiivv9bDlIvxeu7cU1nIlckaL8=;
 b=LW1h1DV/Q+dypBlhaUSmA3pKmrNhVi9CyDkFNibZ1/Pj7E6syZvyE8sWGJkPy6IbSBZ/u/SlwlvXkh9+GCzXmln6g/DKeiBHWYTASaREPq0WioNS1bKcZU3ZfJNuhvUJCYVXDkegNfUNwjNHkf+CmAZvkL6NGyrgbhKk+rmTfmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e6c802f1-a83a-e1b6-f1ae-8b955f1c01af@citrix.com>
Date: Thu, 24 Aug 2023 10:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/console: Set the default log level to INFO for
 release builds
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20230824090258.96775-1-roger.pau@citrix.com>
In-Reply-To: <20230824090258.96775-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd3878e-6000-4db0-d2db-08dba487c5f1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9BoQBhsEWsrbsvqvm1IAGtGRIjWYrhOmoUNd2Aw0O/BuasDcIqW3a3TC+BxldK56SQR0KkT1za94P2q+UyjELf5+4BGF8pppn/cXOHdu/YrqyE8rwCMancy3SIGHwyjve+4ebN0HJCes78o3a+0+mv9OM9kSeG9FszjUSeB2TqQY26tybsBBPx3KVmfRGbP7autVv0I8xqDB/Sy4MtNlOln8VrOoa4H0AKWvOHK9tT+WfWrDZVvy16ynwZOlXF40514hbKBgLMOmf3fTXTuWjBtpSWpckk82raLLCWtb8qnNNkGu34GpkvzUcw1mY6ING1yLRBYkRQJx8WqjHv2YpW7qceISasvh4cMYgZNn9FuOpX/Ek4iFhfAgMb44OCc/3aBMyZZZd1P1hPfvlBMMmaECbIph7SUB7xb5tFt9inX+kQcf1dES05U9YYpgJAOd9qZyUXUVRRwuJxZPxKrjiU8jTFcxbWElcoGtTE37jvZ1utj0sU+GfxCaDV9vlID4D0/076SyrHALD5DQAZT5UHliXB5Q+7DlJXIMX+62BQS8BB9teOde5/mpeVKVyAhtbyVKkPCavS5B4+8vpx8PJp5Dc8/2vKr9zbXmyVIf0Lp8JTF5fJGh+whE+fog0rSgbpa5qJcdf7QiUeevDs74yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199024)(186009)(1800799009)(54906003)(66476007)(66556008)(66946007)(316002)(82960400001)(478600001)(26005)(38100700002)(6666004)(41300700001)(53546011)(86362001)(6486002)(31696002)(2906002)(6506007)(6512007)(31686004)(4326008)(8676002)(8936002)(2616005)(5660300002)(83380400001)(4744005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUdHUlVFQXNMTlVPTk9PQ1VTN3cxZ3FGd0F1K1ZkNHROWUJ5NC9CbzJBZ1BM?=
 =?utf-8?B?cGlXaUJXYzBVWTJNdVNZREVORFRqR2xDSUVNU0xMeUpIalFqLzMzV0hHZWNC?=
 =?utf-8?B?QkwvLzlCREt2emsyUTVuUitsK0VSdVpIOXFRRkZ6Rnk3T0RJOTd3ZThNM1o3?=
 =?utf-8?B?ZkJUaEZtdjVYVUEwME94amp4dDNwT1JKWVJORzFmU0JRK3FZM0FYTkdnU0d3?=
 =?utf-8?B?MWpMcFFDMUJNNElxZ0MrL3N1S2cvYTQyblFKZ2xCY1VxQVZqZCtheGdoaGdN?=
 =?utf-8?B?ZU00TU52ZWRXWUloMnFYY3BLcGFtaVRKTUJUd0E2bFB4R3llQWlNVzdLaC9Z?=
 =?utf-8?B?ODU0NmlvUzNPTVhMMWdCdkZtYUh0Wm42Q3dRNm5maHp0Sk4rVytnVTBUZGlj?=
 =?utf-8?B?STN6WE9KZE45S1Q1ekozQ3NHclhqaTlrYlZ5Z2cvdmNHSnJxTHBPdzN3dDFu?=
 =?utf-8?B?TW1RRyt5M1BJMS9oN3V3RXdTU2doanN3bGhxRmRCdlNWaTVQcVJKbW1wOE84?=
 =?utf-8?B?eDhPTHBDUjdEaWpjUVpXWTRYV3laYnJLUGJDKzVXMVY0WnJkcjJ4VWNWRzRT?=
 =?utf-8?B?UDBSU01FWGpMQk84RkpXbEc5L2N4ZXFSRnhCekpLWmYyU1llS1RYamE3N1NO?=
 =?utf-8?B?b1BYYTZxRklGczhzOGR6K1R4VWtlMUNyZUdJTkh1bHJOaENFcFhwNkxrVjBv?=
 =?utf-8?B?TCtpdkFaTldacUVscTkxZTc5Q2k2L0F2dlJDWXIvVFoxL3hmTXJ3L0ttQzVy?=
 =?utf-8?B?UW5ZYlZrSlBtSzJEZVdTUkdCVi9RQlhtQW1mQkgyMWtwYU40dWtnTUpKVlN3?=
 =?utf-8?B?am5LUTh6ZkE5Zm1xSVdqUkxsVGQ5V3pMVUIvSEF2aGIyUHUwM0N5TFYzUVZv?=
 =?utf-8?B?aS83c2dReTRXaWVobm5qb3lycFhVWjhpTWlOemJGT29xVmxsUGpPTVhpZ1h6?=
 =?utf-8?B?TnNKbjlMR0lEVDBjUVhoWHhHbTdOeEhpNFZvOUVxOVY1dE9BNmw1dzdWaUdB?=
 =?utf-8?B?L0tRcFBqNjE2TTkzaVhQb0lRVmhvU0pndHJJS3lJbVlHdXQ5T1ZiajFLcjda?=
 =?utf-8?B?NXFKSFUxczQrd3AxNEZ0NGhsU2FVazA4ZmFGOUxqcElWTGMyalA5SGUwVTI2?=
 =?utf-8?B?MzgzNUVwM2FveWFuaXk1ZERRZWRlTkg4UzdtSXloamhTWHBVWHZvYW5FV3Fh?=
 =?utf-8?B?cFJXQ2NuaVBIVGJRbFFRb1N5ckhOcmdYTis1dVRDa1BGRFloblpDdVVvdkRD?=
 =?utf-8?B?d0ZZeGF4NjBIcVR2WlY1ZzRERnV4aTRQbXc3WGlpQ0tFL0dEWVBPWTkrVHhu?=
 =?utf-8?B?WnVCUktCSzN4Q3MrYklzQndqMVRITUo1Qy8rUm5UTC9tTDBJOGQrOGFjUjNH?=
 =?utf-8?B?NjhhcUJPWEErcnQ5cHFUNm1STysydW9XMWlCQzlFZUVCZzVXekhsUElreUZm?=
 =?utf-8?B?Ylg3Uys5VERKdlhkbmlBMStXWkRkU3pKNWdubWxzdWRtdGoxVFdlU28rRFFN?=
 =?utf-8?B?R1F5bHBGdGtadkVUSUZHZ3BiOTB1TWQrREVHSnFBbnBtaExza0NXYVhBc3RS?=
 =?utf-8?B?aWFBSjZOdmdOMkdYWjhNUDlYMXFKUXM5SGhMT2Q1b3JURjl2SjZTWjFsT1Zr?=
 =?utf-8?B?WDdiVlhuSjBiRldMbERuUm1KZS9iRGZZV3puL2tpNlhCMXJKWHlpdTZyQ3dn?=
 =?utf-8?B?ZWhDbkMreVRLMEdIK3RNbExva3lFdDVuWGNvOHBRYTNzRWZzZ1ZMd2dhdWNF?=
 =?utf-8?B?bEh2NFlxU3pPVWNKamcrVTNPV3BNNWlaTHRFMEExTkhBQmNJS1BROFhIbTlH?=
 =?utf-8?B?d0IvTDR3YXhaR3hxTXlYTmdjaFBFa1BFaHl1Q3d1eHhWcTlJV0habStBM25Y?=
 =?utf-8?B?c05DOTZtcko5bGJYNjlxd2xTWUFNS2g3dEVqUktkQTEvcDVTZFllY3RGMmFL?=
 =?utf-8?B?KzRqR2s0djl5YmJSR2RLSEhxTERjNHV1aVMxVHBuQ1RaMmIvNk96YWE2MkZq?=
 =?utf-8?B?UTRYWnJENnV6UHV0Vm5OUGVmbE1CbTNtOUZWYzd3STNlaGQ3ckt2L3kvTTJV?=
 =?utf-8?B?akY2ekgxbW5rak16WkR1YS9mVnZid2hpUjNBQ1p0VFFkZzk2ZDhQRXVrSktV?=
 =?utf-8?B?TTY3VlBKSVZRZ2lhZ3FRSU90Z2dLSUtvTllEZG42Z2g4WGJxeGNjMEZtZG5r?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lCbg1KU0hWlP5jIn/yUF1zz4R1ytCJtagwWnvKCshUy+B21zIdLwrJLFNg+kVeNfjgYroIaEyVXZ+9/MuSey3M25Xmuadd9SLmPSRl1UWnVE/dMFZ5vMp9PIscTckOVzzgt4SPIgLNx5A7sZ5d+sJHSNnqYo4dyyb/5ZvULjJbNt/dD/Vl+xmeJi957JXpFvrloCCac51oS9BYrJJHgqLo6pD2UYoHuq0AvndLpq0jvzbxWzGnaUTqpGOusNUFJq1e6yDP9OwtTKn9rLDcJu2acMteqCsQ42V2iGKkPoFL6h87eYTcbGiwudFeCEegOyyQ/9JUOONAFVZB2YoUDQw97iNamgr6V2jWg9CZ4bihHP1UNRBgypxTqof1+X717d1jgANDsyYF4R3QRRa2WKKMqWZcdLyxTJKTZ6YfYiTt9DNE9h6YEiiKFD0nG2U17xGcYmir6K2wA3T6xBQIvMGr7x8OhdVtEKEwlLmKXFQ04akKCo4bCLGN84pxBWFEJhKRkOjtNw+ftExZ0bRX71QwNtd05/PRd60ZZ6fLUe6VYQ5ki61yOBrcoGp0J6Wlb+T6tPRlmKfnnYUKsg7k+37m6PU19PQ2iQoZR/rgTt7N5sFeYVp989vC8OHbNlF0vT5xcTf3B/f6B2gN6Bf5vyzDwvlDECMvz0Wfk2y6O4pvqVC65USBL2/efH/cTWaaQ85EDivjzy3+uKiGX0SGTXk65t9W1P2gofWubBT112/WHxvy9GQc/PkfpmuG7d9QE2f2t0SVhIs01khh5bvK90ymGBWJf09rhcKuOdoNghBeU73wRFwloOE5ANb+yt6jLcN8Ym8TwPA9h3rP0IsUTrzKwxWsXF/cip5GgXeoaC2sI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd3878e-6000-4db0-d2db-08dba487c5f1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 09:52:05.4343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zc1LrW5gQBonlpSPvAm777jlSlPfSkSDEig3Iu8r3H49+uUlFmN3tAFgtK6QJB2ik9lC+4N+x7VTioOxi+EsjtO2BO2Q27oSYvdXR+rJWqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6123

On 24/08/2023 10:02 am, Roger Pau Monne wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>
> Not displaying INFO messages by default on release builds is not
> helpful, as messages of that level are relevant for hypervisor
> operation.  For example messages related to livepatches applied and
> reverted are of INFO level.
>
> Custom builds that require less verbose output can adjust it using the
> command line, but attempt to provide all relevant information by
> default on release builds.
>
> Adjust the loglevel of printks that don't have an associated level to
> INFO instead of WARNING, since INFO will now be printed by default on
> all builds.
>
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

This is very long overdue.

