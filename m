Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0897301E7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548879.857094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RUD-0005C0-Kj; Wed, 14 Jun 2023 14:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548879.857094; Wed, 14 Jun 2023 14:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RUD-000591-HC; Wed, 14 Jun 2023 14:28:37 +0000
Received: by outflank-mailman (input) for mailman id 548879;
 Wed, 14 Jun 2023 14:28:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiGM=CC=citrix.com=prvs=52225e267=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q9RUC-0004gu-4F
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 14:28:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf26ed7-0abf-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 16:28:33 +0200 (CEST)
Received: from mail-dm6nam04lp2042.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2023 10:28:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5009.namprd03.prod.outlook.com (2603:10b6:408:d7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 14:28:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 14:28:26 +0000
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
X-Inumbo-ID: bcf26ed7-0abf-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686752913;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JyObkvyIF+L0s21vBTzrGdDKkYV9+WvYos9hex0Fjv0=;
  b=gY8nOy0bsfGCnJrvg0uFxM8GQpOlGJt12mpEeYXzvmSqKIKurLqYaAx1
   jYbQfMnq8c/l6uy0tNvgQGIzEYpiPlOr/verZVv6nUYHAwX/scu3UToVj
   HZgMSn9avF0/hH/lngzXxiRg4HOcTDwVxpxjAvmHS22pXquFCyHBb/T5V
   A=;
X-IronPort-RemoteIP: 104.47.73.42
X-IronPort-MID: 112785777
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:P8A2lKz2YoXInRh4HG56t+d8xirEfRIJ4+MujC+fZmUNrF6WrkVRm
 2YZWDvXafaCMWD0KdF1Oduy9ENUuMWDyN82Sgs9qiAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPKwT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX5g5
 eAYIjIvVBTZpcm93+KYS+9WgO12eaEHPKtH0p1h5RfwKK56BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDOVkFYZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiAt1CSeLnqZaGhnXNmnYLBCI4dWKd//aZjhC1ZMtuC
 mwtr39GQa8asRbDosPGdxu5q3mAt1gCVsZKEus7wAuQxbHZ5QnfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESMSK3QfYTMFSwQt6cTsu4w1gVTESdMLOLWuktT/FDX0w
 jaLhCsznbMeiYgMzarT1VLahzOhoLDZQwhz4R/YNkqv4xllfoeja8qt4ELC8PdbBI+DSx+Ku
 31ss/aZ6OcCHJScjhunSe8GHKyqz/udOTiaillqd7Ej/Tmw/3+ofahL/SpzYkxuN64sZjvBc
 ELV/wRL6/d7JnKqcKsxeIO3BMQCxLLlU9/iU5jpgsFmZ5FwcEqL+X9obEvIg2T1yhBwy+c4J
 IuRdtuqATACE6N7wTGqRuAbl7g22iQ5wmCVTpf+p/i67YejiLeuYe9tGDOzgioRtstofC29H
 w5jCva3
IronPort-HdrOrdr: A9a23:NgtPMqHTihPyFK7UpLqE0seALOsnbusQ8zAXPhZKOHtom6uj5q
 OTdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bHYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIObuEZoTJB/KTHCKjTKadE/OW6
X-Talos-CUID: 9a23:Q4C3qmxq+q9AM2DltqxSBgULNNA5cnff7k3UeW2TAnk5a7yTc1m5rfY=
X-Talos-MUID: 9a23:SzSA3Aaa3Evo3OBT6WP2nD1dGudRxfqhKERTmqofiuikDHkl
X-IronPort-AV: E=Sophos;i="6.00,242,1681185600"; 
   d="scan'208";a="112785777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j37PPFk/PmB7m0/Oy5TJ8qwQ1tFc+BwWgx6iKg7w4mTNbLtX2OP03Jml/cxrtpKtQtRFK4gMM9LiE07nAOCl63u7eSfUnouZrCK3DSHsLyZGmbMzX5BsuWNyUILcbv8txVS9OanMNjOhlh9S6uD5s8PrCBpP6LlsLrYx7b391pNSAsbJrLVyDc2WDY2HPPO+dKsrNpUQR9VGM4yq9zVy9QfmkfUbAO0+1MV8mVqbcIwVoGMKmpVOS9DxLGkony9YRAsC+BXs71Lyj5v+T9ruwHNsdlkUA8iurgVgF57zgWOLLtJIMGaQzB2sUlS8TbtVp/OfTMy85qN01ti92GiRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmXONbex5w6RjBV0L7OFd3V9/VoMzl5BwyVFNh1Ct/8=;
 b=E1YUa43Mxx6/i1P60TDJaJe6DHaDC/0Q6Z1t6Pfv1BdSHnOuGZV0+P/9bPSPnmJr4OrJXW8sc3T2xJZF8OOFzGsgCZjX3VGfjxENFQiQEdG8qwdV1whScvv8M1TPw6FqI099ho23K3MwNrRPfbdt8YkKvvIAhgAK440O/NpQ/aQu7s/pYrl+zGAdBhmZMuL7nW24ZyCn9abNh8vdxmAyW1rt/aCCJd9X+7TAQq86MsA7gS7xpnBqcOz9BH7GXVft8KKVdZi8duKa9AqGHrYe0u8S0brYJ2mROET49k2c3ormq/m5OUZl1KQl86B01pLeJ8Z3rYEqP45hpzeFoSZvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmXONbex5w6RjBV0L7OFd3V9/VoMzl5BwyVFNh1Ct/8=;
 b=jGk114wP6+Sobjzuk1iISJzdCu8gFxmcsAbSE3zgB04vq7yHL1dPoPHMVeSZlLtaf/BoTpiaOXFB1NP3akSEm0I5IUF8vnoCIRfNJfSMHnpR6regkprG9Dk4C66dv/2abPihtVVgIPcjQjG67aE2dPCO6t0mSqMkAIZdyWwjIHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ed434d9d-3baa-0b8c-2882-df9841564a58@citrix.com>
Date: Wed, 14 Jun 2023 15:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
In-Reply-To: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: b5f53ad9-9ab9-4a89-6ee3-08db6ce39d8e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NN2lXbimFXMvu3BwepfRs/B+UISRvvJxTSbtTr7nqVKbpzToEfnrqxlHJ1CHN7Pi9/h5zCcBMyGq8h9hU/OZD1FDyhcPfJLGdDtsbhZr6bcyAMsB6cyjMLXu93j14FgnfS/wq9/jSq7f8Y260QHkIZLADYIvBIgYqBFNfJlo0RQ3bYQ1iuMP/U4p8TJV8QE+srB62QXMNW4/B/PrFz/tWUXnNGX7s9PI7c12MBVXIoHIm0kpSdk/MgE4s4IF+2N62fVXa5kUlQ+c+EN4hgufsnOt6ety7Cc7FWXmUfnaf7dCoeKZ/oDJY86xOwf8F89JhlZ5ldND9m+hx690l1IeNwIzGU5DfZfvR5wQYc4o2cZwdNVuBO9/fIoqOetC8T7AhZv85tASP4ZjkEwYKAI1zUghT6C9a192093B+lDaZbW/B9VvpsQMLv1as9SK+JYgqhBqxDzg+qZNWztV4zrdDDnaxK4Bt7rEqm/JVwEZTM859o+Nnq4h70ZAVRXSWkv1MHeD3ms7Ej1JijFZSDVv9TosHGWTukmPMFOVmlS4beOVn5lY6CdeQy3OhI00jSt/+Ryx9ygKQx7J95eDvT9O8kWBjk99E0OJATHPcKJpEmZfUvEW6VUS8xkHWNjF3FW8K/PbY6/PImgnbz+JUfIcdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199021)(83380400001)(5660300002)(186003)(6506007)(2906002)(31686004)(4744005)(2616005)(7416002)(41300700001)(6512007)(8936002)(26005)(8676002)(6486002)(316002)(31696002)(54906003)(53546011)(6666004)(82960400001)(36756003)(478600001)(38100700002)(86362001)(4326008)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tyt5Zm1vM3piR1Vub0FGUzlRNHVNcUpFcVJkY2doa0RLTEpKb2tDeVpNUXZu?=
 =?utf-8?B?Z29ZL09OZzlsTDV4ZjlaQ084ZXpSWEthbFlQUXJBMmkvKy9ScDNTZGhCZTVR?=
 =?utf-8?B?L3Z6dWo5czd4UE5DSWZhTllwMElMbFRkdVVmR2NLODFGQmdYWHA4cnJKbGZC?=
 =?utf-8?B?ZDZnMUtiQXRQbkdkRVFOelJKQm1TUzlBeUxjWVNldmMrRlB1dmh2UFNucjVH?=
 =?utf-8?B?R290VFB5Sk5oNVovRFM0bGtRTTRWdm5NRk9kSWFKS3dlcnRXZ3lMeHdCVExn?=
 =?utf-8?B?NmhyYXRjamVOYUpaKzROVUlwcVBHUVNSM1JjMDMvaVlVZVRKWHhsS0MwR0p6?=
 =?utf-8?B?UHk5NUdlZk90VFpObTk5cmZOOS9OOUl2TzBwNFV1RkRGdSt3S00yNXdiRmVT?=
 =?utf-8?B?eENFQmNzbkZFdTk1bzBGRnYxbEpBQUs1Rk15bnBjREtLN1pEZDZpZVVqMjVT?=
 =?utf-8?B?Ym1WdzZaYmp6b05ZcU82bWNXeExvbkVwYXNaaDdYb2FyOGNkRkE1K2svQXRE?=
 =?utf-8?B?N2ErWk9NNEdNN1VKU1JPWXlzTDRHTlV2VGZNWFdXVXFHZzljUHdudG05emp6?=
 =?utf-8?B?bkJkbWJhOGw4a0ZpeGp6MkdHcWRMU3ZDeGZhZUJoVkVCQXVhT3l5TVYwcjFt?=
 =?utf-8?B?VFpEaVR2cGpsYmc3M3ZkelY3NzAzNHZQTHZWSUdlU2lHcyt4V3FCeGY3YXd5?=
 =?utf-8?B?bUloY0lPSm1LSVJya29hdEREcTE4RGEybS9FTU5XZEtqdnVZUHpFWVo4SWJj?=
 =?utf-8?B?ZDlFckk3UEo4VFY1QjlTdENnVDYrN3dGV1VUbWR2VXN1TGk4VWFLRkJ1cWdW?=
 =?utf-8?B?ZDdZY0JLaVhNdmRMemJqc3I3V0MrdjJ1QS9jYUtzN3ZMazVGVDZGa0U0T1Qv?=
 =?utf-8?B?RFFaYXRiM0RycUZmVFNHTXdXN3IySytaL2RYQXRzQ1dDdXo1UlNNUWtUSmZT?=
 =?utf-8?B?V0hXSXJ2ZjFYc3lvSFdNbXlQT0E1WkdqSktOWm9TT0FldG4yWEg4ZXVjQmJF?=
 =?utf-8?B?OVMrME5VYzI4MWkramNmMjlVeitTN3NQWG5CNVVjRFpxQUY0aVhUT2RabldW?=
 =?utf-8?B?dEJxRzc5TGNqRk42TW8rYVlmcFlPUG1XMXg4bnlJV0pNeGZ5eFBNZWljZkRa?=
 =?utf-8?B?UTRDMEJ0QzR0K0pOWS9SN2Jpa2ZWekVwRDVEZjBxRXVVR0QrVXNEa1N4SEYz?=
 =?utf-8?B?U2xubTlYaGFGNjd0YkFSYWwyb0ZDa1Y4aWRRa2p1bEdVYWxXQlF2VUIwYUp5?=
 =?utf-8?B?bXpPSUt1eUVUYTN3cndFa01wc2pYelpYOE1TdjhLSHpRTUh2R2MrV3lCYU5W?=
 =?utf-8?B?WGd6N1B4MXVYQ2xZSEtsN3dEQUt5S2lKYUlHQ0N4Zkg4SHdlOVdaVVJCdXZZ?=
 =?utf-8?B?VmFUWG50dVpoTWE0RWkrcUphRGxXVGRFYUFONVlmSTZLeFlMQlBWU0NVUnMx?=
 =?utf-8?B?bVozY0NOQTZNVkcxR0pYbmx0QWtCNDV1M0VMeXFSKzhkblp2cGk0aU03U2FL?=
 =?utf-8?B?WHd4ZzNLZmV2cHZyTEwwWWZJSXpBeGlNc1kySVoxVmt6eUwwRXNRWUtrOVU3?=
 =?utf-8?B?VGJFL1U5NXd5S2o2cU9zQk96T1hRUmREbWtZMzJRaTNzeWFsNnZXMmMrZDlk?=
 =?utf-8?B?Qy8xamY3SHdJZ0RNVUY1Y1RUNHJVL1ZRZ3ZqK00rWXB0OUhZWkZ1dUlFTlBX?=
 =?utf-8?B?eEJBS0dMZTYveWw4ejBvRTZNeHlyWSszNGZBQmlmUGx4ZDBFV3FhTTBTcldF?=
 =?utf-8?B?cWJnVnBNdkEwdE1TLzRKNW80d2ZTRVNIMXpGdmh2MUtLbXRpVG43eDMxQy9I?=
 =?utf-8?B?dHFucnEwOVFtWUo1RDZQL2RMWnZxeG5yR1FWaWRKR0JMYzU2U2RnMXQvQ1NW?=
 =?utf-8?B?UFl3clAxdzhZQVoxNXlnNThMUS9ldGNHN05yTGJCZUliRkxadzlaU0xxOXVv?=
 =?utf-8?B?L3NaRGttR1I2Z0xZZ1V3TEc1MTZuWmJRVDU0bkk0UnkrYXZhcGlEbDlEbmxj?=
 =?utf-8?B?eWZkMzNMMVladTZ2RFJwdk9RbWFLMWRFMUtQeWVBU3RMcklqV3ZRV0Z0TVN6?=
 =?utf-8?B?VmtleEo5QlRsc3Z3TjB5Mlc0UVNqSWU2b2Rtang5enN5d2FmKzN4MmhOZzQ3?=
 =?utf-8?B?N0xxblNqY2xOUVU3UTdJTmc4MTBRN041em45dGhab3BEeFB2b3RoTThaS1pJ?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?ZDhJblZkUTRVUjEzWjUrU25KQ2ZoSjRKNDI3WEVlcWVzYkJuRmp3aXNVTk51?=
 =?utf-8?B?TlhPUEUyU0NTeStBT2NuK0hpaHFyNTd3ams5UCt5ZDNyTTBxZVlCRHc3K2RZ?=
 =?utf-8?B?dW5xQURtdDVnRXQwRHY4TlZIcWlCbkQxUVUyTCs0eGVMMlJ2T0VlQVhBTmhN?=
 =?utf-8?B?bi9VQjV6NCsxYWxUSkNmTFkyUnM1WTBlYkF6QlNtUW5zOXVJdjk5YXkvU0t0?=
 =?utf-8?B?eEQ3bU5HMTdiUHBobGZjSWd4VmVWZlNZU0xka1BVMkxoU0w5UlAzYlNkRU1L?=
 =?utf-8?B?NjV2anF4Q01FcnNWcHRrcXFOS0F0ZUxsS2JsdlBOb09RWXkxWEtIYjNtYWdv?=
 =?utf-8?B?bk96L3lENnRVM293Z0htMDdmUkRVeGFzTDJNdTlPSENSR2RJOTN5RXZkRzRi?=
 =?utf-8?B?VVR5eXhiV3FPeDMycGZMZmRYTUozMnZhREM4cnEzSlJrOVBDdVk4UWs1VmFC?=
 =?utf-8?B?VVNFa3kxekg4NS9Oa3EybVhuMEMwSzZ2ZitsOWlEWEV2enlvZWVDNUlsODdo?=
 =?utf-8?B?MUd2RFlQTHZ6bWUvSUNuU0xtR0JZVlNzdURQR2pkem9XWmZXK0w4YUZZRHVn?=
 =?utf-8?B?VDVKcmM4TnB0QTRKbEh5bDFHbUdTUjlTbTcxTzJVbHg0N203VzUrT1BwYWRM?=
 =?utf-8?B?K0tJM1ptc3hNdXBtTTR5c1l0MFAyZDhPQitnaGxQcllXa2JaMjRacHN3VWN3?=
 =?utf-8?B?ZkpGNnY3ckE2MHBBOGd4RkhDZ3Z5YVp1WFVFdFovTXNUU3A0UGVIVG4wRjEr?=
 =?utf-8?B?SzliUm5TZ3R3aFJTNTgzWlppMy9BMktsZ0Q0bjBqSmZoNFE3WE5JdThUM1A3?=
 =?utf-8?B?bkI2Y3lrcy94QUhwVmVBd0hORW85YitlTXJ5RkJvcmtTRUoyME1mUGhCQkM5?=
 =?utf-8?B?Z3ZBV1lmMzlUSXl3aVFlbisyZHdBY3YrS1VXblJmaTNuRktGdkY3Zmo5TlBl?=
 =?utf-8?B?TmZhYkU0aW1mbTFOTlAzOVAvSkFoYktGQVZGY1lQVTdScm15T3JiZ01UT0tO?=
 =?utf-8?B?Yi95d2srd2VadkxyL0FwKytYeDV1MmVTenhIZmpWdTkrNkI5Mk9UVWNyZnd2?=
 =?utf-8?B?dlc5RXZsQ28xWllpa1BrS3FCa2pSd1ptb0Y4MWVZREZ6YlFNcWU2Uy95UWll?=
 =?utf-8?B?YXg2MU0zZWwrOHRvK3psQTk1cVpPU0VMaUFkRHIxQVdOUXlTUkxLSG1mVGtq?=
 =?utf-8?B?d1ZuSklvakJrc0JNNWlGWUZ0TVBZU2crZjQwUWdGUEJzdlRKaW5XRW4rZU9G?=
 =?utf-8?Q?UsUVgtcwbOSpn62?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f53ad9-9ab9-4a89-6ee3-08db6ce39d8e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 14:28:26.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltgjstmsBDYkmoGn/yZQyL8LJFDhemYs7iEKDaqDhDXQnGfyhpynztsOFsbe1W7sgxlg5YVZ4+U6ZHlxG51J9suPyOQpCjJHykgR0zKA5cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5009

On 13/06/2023 8:42 am, Nicola Vetrini wrote:
> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
> index 75bdf18c4e..ea6ec47a59 100644
> --- a/xen/common/xmalloc_tlsf.c
> +++ b/xen/common/xmalloc_tlsf.c
> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>          *fl = flsl(*r) - 1;
>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>          *fl -= FLI_OFFSET;
> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> -         *fl = *sl = 0;
> -         */
> +#if 0
> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
> +        fl = *sl = 0;
> +#endif
>          *r &= ~t;
>      }
>  }

This logic has been commented out right from it's introduction in c/s
9736b76d829b2d in 2008, and never touched since.

I think it can safely be deleted, and not placed inside an #if 0.

~Andrew

