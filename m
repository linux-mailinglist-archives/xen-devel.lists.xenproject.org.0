Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3977270069E
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 13:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533786.830722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQqt-0007xp-3d; Fri, 12 May 2023 11:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533786.830722; Fri, 12 May 2023 11:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxQqt-0007v4-0P; Fri, 12 May 2023 11:22:23 +0000
Received: by outflank-mailman (input) for mailman id 533786;
 Fri, 12 May 2023 11:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zhAz=BB=citrix.com=prvs=489789326=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pxQqs-0007uw-07
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 11:22:22 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 414fbb4e-f0b7-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 13:22:20 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 May 2023 07:22:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5630.namprd03.prod.outlook.com (2603:10b6:a03:28b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 11:22:15 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 11:22:14 +0000
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
X-Inumbo-ID: 414fbb4e-f0b7-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683890539;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o9IqwSYdBzXQ+2BuXRI4uXzPjierc5LrVwnlz/pewMA=;
  b=YAPmSQCdI7a7GP3n67tLRWuZmzzPDhdMeiJDW8sRxpyWPNP3FCb0ryx/
   1plKNyJP+AL0dMh6PAa8IdYW4FcnwD93IH8IEabp8Z/DtEFBzJh9GI+gG
   Xh0upaBXAkmGZ+6vEaYdD5Sts3QV5vn3UXrzzjXQ10PmiQZ0WjT4QaRU9
   Y=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 108820881
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7LFhO6IqTL64fSuWFE+R7ZQlxSXFcZb7ZxGr2PjKsXjdYENSgWcDm
 2FNUG+PPK6KMGagc9wlaI++8U4E6JfSytBlTgNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPSwP9TlK6q4mhA4wVkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5uA3Nnz
 +EZKgpSbz7Sm/Of6bWqc+1z05FLwMnDZOvzu1lG5BSAVbMKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dnpTGLnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHurCNhKRO3hnhJsqF2Q9mIOJERPaQeAjMC8t1W9UIx+C
 VNBr0LCqoB3riRHVOLVWBmxrlaNswYSX9cWH+BSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsrSTRWiM67S8oja7OCxTJmgHDQcbSSMV7t+lp5s85i8jVf5mGa+xy9HwRzf5x
 mnSqDBk3u1Cy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:szD9o6lEKTVzCQaXCqvzCrIp4XLpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-Talos-CUID: 9a23:95rWe2/MreFjrqFQ6fWVv1cWCOkfb3zf9ijRDR6kGE9AT6ysTUDFrQ==
X-Talos-MUID: 9a23:w7Ja6grEJcxmru7fQxoezzFhBMl1z/33NBw2vKwDhtKHPnJRGSjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,269,1677560400"; 
   d="scan'208";a="108820881"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lff92meAxxqWDgZl54ckOwthIlF769MnRvgFGTfeomulWQiDY7kBwN4fHU3EFyTPUY7rA1I/Q3+2m4pRMbnD2Q4YGIwLKv4k0EQ1ZBRQxi1bvg9gJANd95iU9O//66bf5bO0f3Bm0P31GUIDgInHq/PeKMiAUs4CdTq7UQcw3anQHrYWk3M8BLl282U0qpnOn+C5R8Ha5j4TLno6Wzw5shzA1heTRX0J/wuxkikNuL7hb1g3R1p3iVHPVsdwbQPNNW/aZjZUeWVvaq9nj6+6qfzMnRCC5iD7hyNNggAFJii9Z9tN1DMmOmYomgY9o1Yyn9RzarDAQVPlLNXxK1lZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9IqwSYdBzXQ+2BuXRI4uXzPjierc5LrVwnlz/pewMA=;
 b=k8ZatOay22zmMfm7NnIhFthxzLqA7WWAGqR6bbVmDsJ5/6LikLZf9ThuUZtpaD+beIRjE5cIz+ug7zlazm1YhK2+AQO9bdsvMshPXExQ7LFbBIKf4rNeaCV2PfPedUa8VxZOWfoBO+9W1MlQApiZp6U1YuMr6TFqGGula+42V7EgZEsM53hzvwQpgUgPK5Q9zqPdqqWmRUL0eWj6oJxU+EhCm8EcBy8j+c1g7wfS5+Ugz2fphoNmqA+RDjFIDgTdVGiEBdxHfcWE9hsyjIeTnzolcLl+GQ0BPS2n7JzFEP9kA7tFI3NUD6IOFf/kvKszSNRhNNilUj0c+LtNd5NbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9IqwSYdBzXQ+2BuXRI4uXzPjierc5LrVwnlz/pewMA=;
 b=CGIRnRBVa4DBKuSXti123TqF+6ruakosHMaxzyz708X1oCAjJsQBH+9Mj+AJz12qNjfXWTDU9c3osHiKSgtcybNkYtmsm3y2lYQA4FehUD940DJu9drvdM6OUR1BCO0LFOBacY0uMDWMTs0nc+UDrK+3H7hb5vDkqNoW7tUWCOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3d0b1c1b-02e5-a0f3-221a-45dbdba1b411@citrix.com>
Date: Fri, 12 May 2023 12:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] Fix install.sh for systemd
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508171437.27424-1-olaf@aepfle.de>
 <0785a316-1920-f5de-61d3-ed21ddbff0b9@citrix.com>
 <20230512131819.02b3a128.olaf@aepfle.de>
In-Reply-To: <20230512131819.02b3a128.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ede7ed7-5721-4c79-02f0-08db52db2314
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nSNozOxh8uR4ovwoMGBs8Gsfgh300Y0bMXxRKKzKo6d2RZeB0Yd3hFPACoBXonA5OHauui4l2Iuv/xjs07BFQSj/OprLC7/tmpF4VyIMPX9P6Gu1avQ2g6EbRkG6lUrFW4awwXvbVk4JuWt6K7tNddzFDvl9liB0HrqjGXesv8Fgi8RkhHEWrD+urkhrJ/3zeyty98Brb3tEX4/iBEVXRn2JxCb6s+skLEnsPh6Qa8xP4zBmFLlbgw2tXVHqv1glDsiSJTmY+BD1TREvxFEenlNAsjFJ7KcUnoIpJ0wO5P8mHJ5YSLJZwNvto9Y7K/Aj29CoAAghYvqsg/th7DAaWZ3Hkl6xU5ykAvw6q2R1ulbjdPmiItyDmdPNgNOLSlfqPJYAMot7kF4TWQUN+S5PGViqxH0A/9LMyqRRGvh/Y4UD0tpisla1NvzvaOdOzHXFNNFHvq4Hfefvdj8ZMWAAwVDf1LDwVARxf4556MiHCe7+YdZ63MAKqksVMI1nTTHAKd4Y6bocm6HH0ilACi+JBqqCanRoBqFSSvaDTMSNzH+7vL5IVcvrMl0OpKWqIdvfdA8RCqhVJwIeNIIMyGuudFKyFxOLSlT12/a3r9s3j8v+Sb6mhK5G4PvqeXvdIwt2uYXAXP48wKxlAaRzODSrjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(31686004)(107886003)(38100700002)(41300700001)(6486002)(53546011)(26005)(6506007)(83380400001)(2616005)(6512007)(186003)(6666004)(478600001)(6916009)(54906003)(8936002)(82960400001)(66556008)(4326008)(66476007)(66946007)(316002)(5660300002)(86362001)(2906002)(31696002)(36756003)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTY4MXZVQitQbnJCWjhCaDB2aXZNTE51eUVudmlaTWZlLytMNWVtTzAyNUMv?=
 =?utf-8?B?ODNhVnJVZnhHNjdSa3dIUWo3UFVwZTBHcjk3MEtCNHhkd1d3RXl6TlZDWnM5?=
 =?utf-8?B?V1g2R0x6aU83ZmNjMWE3bTNQZUtNNW1Kc01IZHhSYTJONXRZMUo1cUxsSnBK?=
 =?utf-8?B?MTROTGc5d1NwVUtISGpFajlCSEVzT0cyczFxQy94elRkbHpTVC9wTWRvT21K?=
 =?utf-8?B?TWxQY2xQVWZXY2lQaEpDZW5DZWQvdGZNUWd6QnQyVkNrZnlwNDdzV0lyZG9X?=
 =?utf-8?B?VHhBaDNkVnZvZUJmY0djRWtFaWxMakNLaWNKVURzSEdWNUpxaHdqalhTQkEw?=
 =?utf-8?B?WUw4SXRkSXZPd1FERTFsQjFGbEVsQnZWUHlCc2I2Y2xlU3p4Z3cxZjIraHps?=
 =?utf-8?B?LzBxRURGUHI0MTNtZ0E1eENvdndWZi8zNFhvNW13MHVBOEN5aFhReitGNlMz?=
 =?utf-8?B?SHNWWE9oV0lseG56UHlURCttQnRVZG1HaVJLNFZEQlBqYngxa01YNUd4RTlL?=
 =?utf-8?B?VW1pcnhvSGU2UWZ5VGcrRml5R2dCTSt1Yys0U0pEaEFHS2IwYWU3MCtjL0lz?=
 =?utf-8?B?anA4MDRiUGcxemMyTWJUekZub3NTdklqV0dGRmFjUDdUVy9wdXFCZmY3azBP?=
 =?utf-8?B?Yit1clUrdERIRzE4ekJuZVJKcXM1ZjRISitwM0E2UGdkWnFZVlo0WG4vcTlM?=
 =?utf-8?B?UjJOVlkzNUdnVmgwWEVkNklwalB5NE5hYmorMzhEejRYcUhMOGh1U05vdnVN?=
 =?utf-8?B?dlNsaERNZGpBYWN1dlU2NTdGVkxjdkxiditPY3JjZTZYQzRqRE1MU0JkL2FH?=
 =?utf-8?B?Mld2SUNBbURpTmNtZzc0TXJMY2hrRWc1MDc1VkpXNzByc0pIbEVpckFvYUV6?=
 =?utf-8?B?WkEzM0hCY1FEOVNHcDNIeU1MRU9QdFNKTDNGWWVPdWgrWGNxY0Jpek5DMDdV?=
 =?utf-8?B?TVdrOXhVekhOSHFXY05pZ05jTkJRMDRVbVVReWNwcmk4b3IxMGRYanRKZSt2?=
 =?utf-8?B?UkplcXVXRlVEQXgwWkVSVnV2QlVDcTFTUkk3cU1LM2lZN1dRSExRbHFwdERk?=
 =?utf-8?B?TFFVYWR6azlrNXhKK0NONUx6ajhZQ3BmV3kyMkMrdW9iUHpKWEg4cUNYZVlH?=
 =?utf-8?B?Tng4dFRhc0p3d29zR0w2b21SbTVQQm01U09VcmZ4MnBvQ0loNVUrd1gwNy9O?=
 =?utf-8?B?dHZJREQ5aHVIblNDK3M3ekZrN1hnNlRKQ0JBdXNnUVhiQ1lTY2JzWGZ3cmlG?=
 =?utf-8?B?TVNXLzNKSCtpWncvdGIzcE5hZ3Z2eXpsejREK0tib1VMdDlycCtndGhTU1cy?=
 =?utf-8?B?WUtWMkVLNWxvVVVQTXNwRmtCalZBMHkxVHkrZlZhb3IwL1FJbm00RHFrTTZm?=
 =?utf-8?B?QUdNa2FKRlJzTTZuZEcrQTE1ZDA2YlQyQUlKWTd6c3VValRVQVNsZ2NZRktD?=
 =?utf-8?B?cGwzOVN1T3VPNC9rdG1rdzNpcFlIR01sSm1rWW1DaXV1T1NZQmt6aUE0a3JT?=
 =?utf-8?B?T25oL2ZDV0M1U1BON0J6Nk1YYVByVVNqc1VOTktGRGJuVW1tUks4cjBDUkho?=
 =?utf-8?B?bDV6Wjd4N1hrWnpIMkc1MVlReHpMUG9KTjR5dHJMZDRaN3Jid1I4T0QwTFda?=
 =?utf-8?B?S1NYbUQwcDRWNW5LeUpCd2RhRmVGbzRCbG9yU1A5bXhTSWJpT2VoNndyK00y?=
 =?utf-8?B?V1Z4Y01MbEszcCsxYUZJUEZmQ1cyRm9iYnp1RVFuVFJOWFdsVHBlTzd1cU5X?=
 =?utf-8?B?Y3I2S29UdzlFQ1g1TXFyZE9kWEYvUGFTeDFKNVlCUlBDSWFVTXZjQnA0dlJB?=
 =?utf-8?B?SERiRnI2dWNFSHdaaE95aHptVkViK0FYNVRCV2ViMm55ME0xeE9wdi9qZ1pn?=
 =?utf-8?B?WUtoODdod29iRW5tMXJQblRKSitON0NGdGNrT1l0YmhzY3BMbm9kZDRpcDRi?=
 =?utf-8?B?SmJMZDk2WEl4TEV2elhvc3hOVk5PekRtRmRqYlJmMjhiVC9RWDhTRGNSMmlt?=
 =?utf-8?B?NVNFbXh6dVpvaElJK056azNodkIxeHhGa1FsM0hoMi83NlE3OFg3dDJ6WWFU?=
 =?utf-8?B?bmpTaUlYd1NSVGZZVURheGZBempWRkhhcFVqL3U1QkQvaENwMW9mc1BQcXFi?=
 =?utf-8?B?NmZhYjdIRXJuVGdEUTcxQ1QwdGJjMmVzMFhuWWd6WTlvVXpoNWxCc3dCVCtH?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9h3uWc5TyXG7RGc5mKF+hfi9b76GMeotqRYRdVVsmM7JnSpzKHCXPLB1EkLnSrfzs4R297rFB8xs0vDo7cNzvW/fPKuWVq9FyTuMJnlKey8xpMlAANle0v7kSqr7/hT4ZTZvPqruoqN1C8PlDV9FMnD/uLbjU6QKB4Xs6t7OVkIhXNgGGEyF2SeO0qqeFQB8t7EXw6avgHZWc3Q9EZG0o1oP0P3Gqx3e+eVaqiJmW27T3OvPU1jcwjK/mJDa39tWOIcqZoGoBzRR5rm+jM2JHG5/WapuCiwHOyu2IjoqnqAjFLrDtfXgLo9mOCZFhQI2eFgfb7OwbeP52/s27HLN9cq2AWKAEl7HDvmQO4Dfg8fV6sxkIadr03cjmoYpqZJZhE04ucPCKa+WE+SE9yEAf8P/JqVwd0BWl/B+AZ9cBEXXWGBHEYMhwfQYvoKGNtLkH3PQQ5R30bKIePWzbhTU9rxf6dRFt8QuTbbwKaiusoPMQ+7G/Lil9vdrpNiTnWPXoEBrx6TwnXwUvvsWjvLPM5+uxfJBALxTYLyva5Xsxogm3As07iMz4KSIfoF6oZXQywil2TVdF3bJDenzlrhh0wthXo2bh/psyZsWCioaW/QUgJ2bOD/XFB445vfvPi4xu4c3lvEU9mJvmR6g8xOF/KXg9YxMA3fB9NTqqqz0ldy9zOGX4yHZOZMo7kADJdRzcq0wtpli28Oga6p/lyYR9tfBHrJ7g7BfGExjgFpXpwQXaGSoH60J5z6vGAvN5C7rPisoGFoszBGDJo19yySQafsP1LQq5RYRqn2IUc1oc0LyQ7EfM0fAEVgdr2aQmut0Jr8Az9eWACNeeV53NVQGAUGu2gq9scHdmD4hnGZA75c=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ede7ed7-5721-4c79-02f0-08db52db2314
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 11:22:14.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVgPjZGvkhY9oMx3/jtZnPGjzBzqJnNzA1ieZQI9qcb/RxtSIA77KfUTmteQ+Hs7z9xoGW/GHEOkIwosawKyEh0h38vgf9kAmfS/n6f2TAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5630

On 12/05/2023 12:18 pm, Olaf Hering wrote:
> Tue, 9 May 2023 13:47:11 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Why is this 700, and the others just using regular perms?
>> Also, doesn't it want quoting like the other examples too?
> It is not clear why there is a single mkdir -m 0700 in the tree.
> Most likely it will not give any extra security.

I agree.  It's weird and doesn't have a good reason for being different.

> The scripts source hotplug.sh, which defines a variable XEN_RUN_DIR.
> I think it is better to use the shell variable instead of hardcoded paths.

Sounds good.  Does this allow for making any of these files no longer
preprocessed by ./configure ?  (i.e. cease being .in files)

> Regarding quoting: there are many paths used without quoting.
> For the beauty an additional (huge) change could be done to quote
> everything. Not sure if it is worth the effort...

Perhaps, but variables should always be quoted.  At least make sure that
new additions (and edits) leave things quoted.

Thanks,

~Andrew

