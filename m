Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6705537BEFA
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 15:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126248.237630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpKD-0002E8-NR; Wed, 12 May 2021 13:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126248.237630; Wed, 12 May 2021 13:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgpKD-0002CD-Jh; Wed, 12 May 2021 13:54:57 +0000
Received: by outflank-mailman (input) for mailman id 126248;
 Wed, 12 May 2021 13:54:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kryu=KH=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lgpKC-0002C5-BR
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 13:54:56 +0000
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 31b87290-cf37-47d5-91b0-b6e51fcffc17;
 Wed, 12 May 2021 13:54:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CDp5YT010088; Wed, 12 May 2021 13:54:52 GMT
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38eyurrsas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 13:54:52 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14CDqSTf160107;
 Wed, 12 May 2021 13:54:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3020.oracle.com with ESMTP id 38djfbpfjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 13:54:51 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 13:54:49 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::78a3:67d:a8ca:93cf%7]) with mapi id 15.20.4129.025; Wed, 12 May 2021
 13:54:48 +0000
Received: from [10.74.103.76] (138.3.201.12) by
 SN4PR0501CA0119.namprd05.prod.outlook.com (2603:10b6:803:42::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Wed, 12 May 2021 13:54:47 +0000
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
X-Inumbo-ID: 31b87290-cf37-47d5-91b0-b6e51fcffc17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=X5Tb+8RVA97vmVIqrMOmb+uN0+k0mdeX4LIkQCcacCA=;
 b=GellMyptH6C6/iqCNq/WutsbekyCURXpEMZzBWMz/yDJ3Vnj0ZmaV8kV9Qicnd/kr/md
 TwI7fb41ozbLWpDfETJH9rAEYV4I124HJtDomo7bQVDmXJLFTw9pQjaxa+Cayy8FpW49
 y5rESAJvfxmQznddFy/FUPUfIk98x5SQs5g8G7leJ2X5b8XmjNQSDRiemrdVypkB4pnU
 6jnI3s63C7xJUO1KQ77isX6ImJHYz8Ucy3nycwxmI0rZ+aTZlt8ZeXW7QGgwPcHYjLSr
 GKfTa6lIWomvQyrV414COsG09X8LkpOAq8qe2cyhMUIbijSRk3kG58J5HwyehN0ppzD+ WQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFgUKhNgU2tGTcQaok3a2E4P8yAFOXSbtnl6tQ4+EwIXPr/tJ/EJ/8tl+4DOO6PXwXvwmqeJc9xzBnTu64JDjxnVoV43AXHC71Tw2yuQDuuTpBDERg8yEod24u4FlX3ccQHncoTNcgK5HoXu6jEirEEI1QTK0t/lJGdBRAjhpy35UjtMU1/LMv7OW/YWJDZZkNEouc2s9InjddkH+HE5SujxHYmxc3IZuN0nPvOepyaykWGMnXdjIKJpZQjFyYGm06ERkHWdkoq8q+9sFGIXXPVQ56mttwXh7DqBVh7gx+3Pq8AFJ+/81U2YxOoV6K5mPAuSl+wsu0gUGJVvvqPXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Tb+8RVA97vmVIqrMOmb+uN0+k0mdeX4LIkQCcacCA=;
 b=Wkje7zsWNBGqqSJ9/VmSr0ndlxGKJfXglS69CFwcyRbE/65rTGn2LzqZNB2TQ+fTRZXqwR2yoOVWzW0LlNSGL3qQa4voykc3CAlCY5LFlHjTeZ/i41qJ3FaR+qMreiNVRvzHLWe7MAWQEjegryENxW/+fbQXabXISKVbv/CMlB/MAvHmQeVTntC1qp0p9vYOYw9rlGUUHSHuvjvpLuyM17wBvC2XfvXCNaLcGwvh8xKY5x7H74U20Ys2MTrSScZYgR7PB4+sro0RXbQ07giHtMr54EppZy6Hiofmk5StuVhdF8yPyEGY7rA7qiit4snKxUwxkyGoxsTgO2f7JixlEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Tb+8RVA97vmVIqrMOmb+uN0+k0mdeX4LIkQCcacCA=;
 b=PWeJmtbccPm7agWwRxMqbfeLIp8aIzT9QI0sx4AkHM7hpgQr4PMauUkXR2ffrtiWAMxOOFlmHjItBAHsG9x44Te3rIH42RUvKhhtJKQM15tbJPoBWOi5G9cPbX54enpcTRo4TD6ouSEXGXt58XgZExIqV3si/vfnDK9BTmgTsaM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Subject: Re: [PATCH 2/3] xen: Export dbgp functions when CONFIG_XEN_DOM0 is
 enabled
To: Connor Davis <connojdavis@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <cover.1620776161.git.connojdavis@gmail.com>
 <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0c1d6722-138f-62e7-03b3-a644e36d20a5@oracle.com>
Date: Wed, 12 May 2021 09:54:44 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
In-Reply-To: <291659390aff63df7c071367ad4932bf41e11aef.1620776161.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [138.3.201.12]
X-ClientProxiedBy: SN4PR0501CA0119.namprd05.prod.outlook.com
 (2603:10b6:803:42::36) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5ee5d8d-5e94-46a7-6a4f-08d9154d81c4
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:
X-Microsoft-Antispam-PRVS: 
	<BLAPR10MB500915CDC371102BE9990CFF8A529@BLAPR10MB5009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sb8QJeXiagZQgpXM5frwjHrqvAQQqtlJ0qtOU2vc7FA7Z68Y1/+gpZ7x6F1XNKI2JMTfOxxWt6MQVoUB+QE4eOFJpX9MA9Oyt5/dKgj2XMseOINvoKFe4TBzbMMI9hK7bt+CFZMaPppafslCOWmI0fljTnawDbqJOv7XzuRIgmZRnt6dEmnmrUOWq4r8sFach94kgVEYHjG3UUWX2nND51Xam+S0NU2CZroQPAOnB+C0sH5FC24TF9fIHFdwFq1U2/yxBjc8q165ALsCKBBRfnu+QFQmsraDGg8No71PMYNjRUd2W5LO44mx4sZRxPAnGmK+TDDnDMvE9BYqzNC8faIjzh2PQ2SpuLONGK6fGjhFfvfo4GtbrYyZpvxpJXKDVfcPm0x5PNvoAOs6LjWoVjNUUnsmTUbnf70jiJOCP+A4EQxQYOKFkvaTxjUhIXKfE3nVWn6XnUPhzKipmAistrpRny3SG4qNSwkvARDlQ5f0lfq5wNL+4kApKuMLt9sA1Vhx4teP46FrTH0d7B9RI8675e8bTWOD85wTBuyxdyUODey+jqj5h5HPOPltP6vmh47bKxUMRQ95wfKE6HZS42RYKWw/6i+axCUEooAbVr9LWSg0WBT1aAnW+8SAYhfMBrwZWc3hEywJCHWki1SpAOmzHALDG9S6qYZTmOa6fiKdcC+cBThMjQgYz2Rwalna
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(39860400002)(376002)(136003)(16526019)(186003)(2616005)(2906002)(5660300002)(26005)(956004)(66556008)(4326008)(478600001)(66946007)(66476007)(8676002)(6486002)(4744005)(38100700002)(8936002)(6666004)(16576012)(44832011)(53546011)(31696002)(316002)(110136005)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dmZMeE5Hd29TT3pHci9DblVaT0N2c3daUVlJdzlqcDJxbkFXcUFKczVmSVNX?=
 =?utf-8?B?eGJqckJKODgrWkFZSVB2TTNkdnQyQUhUUnY5WlZKanFhNlpsVjNHZHpyNFRB?=
 =?utf-8?B?RlB0WXFKTlhSSGRPSEs4a3hlUXo1NDkxWGZLbXp3NGdPTjhkRHFPODJaTjFv?=
 =?utf-8?B?bi9lSGZ6NUEram1GV0RNNzJCNkljYlpRV21mMS9Zb0dEYnRCOVBoYTg0OXZw?=
 =?utf-8?B?VlNRUFo2VTQ4OTQ0S1JmYmlJUURucTdzdHZIeGJlemxzbm81dlRFNDFxNlpj?=
 =?utf-8?B?TW5kQS9zaHRpMCs1OGpsakVTZEg4MG9wR2hZK1ZYWEx5bnRXdXVaUmpmU25w?=
 =?utf-8?B?bVRIYzAvamY5bWhLekdNRUhML2I1Q2t2Z0FzK0hIcFRvY2FQZ1dJTXpiaStk?=
 =?utf-8?B?ZFFaYnY2NlN2K2RCY25aL0MrNmZPK3V5NVlidlhidEFNN1FjNzUwU2NWdnd6?=
 =?utf-8?B?YUJibzVxbmxraWVFWTUwa0UwVmFNQy94OGg4aDVEeDg5dnRNL0Q1RnpXSmxl?=
 =?utf-8?B?bmNrZG5ZNElsdnE5MkkrRUdFQmNlNWxPR3JoL2s1YmVLZjJ3dHBaQmUyanp2?=
 =?utf-8?B?VTRDSjVrOGh2d1VjWGlXT2JwUEdDcEpCZVVFalRJeWhzMDRWMXJjV3RtbG9a?=
 =?utf-8?B?ek9ldFVLOEZabmllNDBhamlsMVdESE9iREkvT2pSTHFienpYSmFDVG5nREV1?=
 =?utf-8?B?ZGpTTU5KUnRxbTQ1L25leXgzbzZidWo5aWhpaFhrVjNsQ0hzbmxDb3ZPT0ZD?=
 =?utf-8?B?Ynl2aXZYQ0ExVllvSFdtWEZoSXg4UVRxcS8wSzFOTDRJcWJQZ2Rsd0RYdWZO?=
 =?utf-8?B?SGxxY0p6ZEh1TUxHMHBtSXRGcjRmSGZwWDhkaW8xektBRENTamhJb050WGZV?=
 =?utf-8?B?a2hzUk80RHRSdk8zSDRKOTEwZ0dxdG94NFhWWDBwRmo2Nk5xeEh4Sk03a28y?=
 =?utf-8?B?SE1vQ25pSk45eStDcUxEMENKV3FJVUZ2WjFGM0M4akpsZExkTGNuZXR6UEhO?=
 =?utf-8?B?cmQvVDZVUEsvNWpML2VKeXVCNk8vQ3Y5Njh0S0VoS1JNZ3diclJ2U053aW4r?=
 =?utf-8?B?cUM2MklOMW1tdXhFUlc4d3c1NVZyUVNHTUVOSUJMZHJUWk8wMm5aZDNjZVJl?=
 =?utf-8?B?VnZLR1hiMUV0dFZvRklFVk54T2h3STVvbU1jTU1TTXBSdVJTaHdhNkZETm9j?=
 =?utf-8?B?eWhLZm5ZbUkyV2tZaXNPMGJCN0xvQzQ0YmlDM0E1VDhENUtiTDV3MUhxN3p0?=
 =?utf-8?B?OGpsbTBuUVR1L0FrZHF0ZElQVFRMUXZsSkY0SU54RnkvbmNxT1NQOGpFM2pL?=
 =?utf-8?B?ZjhBc0ptSTJ2UHJsbUdwaW5ZbkZ6WEViQjg1aUhCeHplVWdUeDJOMC9xUThO?=
 =?utf-8?B?VFU5c1lmQURhMXh6OElOOU5CS3BOcytrODVxY29nZkxxcjdPQUVKUXFKbWJZ?=
 =?utf-8?B?TGVOcEdHOEJFeHdUR252SlRrTHJKazV5R2FMbWQ0eVhvM0gvVnZwV1dldGZO?=
 =?utf-8?B?akRGMmx5dkdpOVN5dmh1djIrby90U0NTWGNrRDVSaEFHMG5zZzRIbVZhb2xL?=
 =?utf-8?B?clVWNlYvc2NSbGZEdE5VeG9yMzN6SFNxTU5hK2RVcUVrR0N5ZzRPQTV1bVhD?=
 =?utf-8?B?SDBxWHp5cEd2cnBJS04zNG8xTmIwMy94cDFEdEVpYVJzWnF2Y1d6ZFAxTjhi?=
 =?utf-8?B?Zmx0NUE5Tkh1cWJaRS9MTXRHVnpnRnJkY3ZMdzI2bHNMelZHZHV1S1hoMFZJ?=
 =?utf-8?Q?IGwSdMbVBh/mHkqizROIocCNBWK25QG2mY98m04?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ee5d8d-5e94-46a7-6a4f-08d9154d81c4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:54:48.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOQrCiUZes4uJZ742snxyAMwBvJtjgc/sd50pVu0M/XCE/olCNoMIk9cSADx2ZhtYJnX6+VofdUk9g1KMaN+3QCg664ywmUil0wUMh0mk+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120094
X-Proofpoint-GUID: tWm9lrRmdyGiY17lHLzqwyK97goLU-5b
X-Proofpoint-ORIG-GUID: tWm9lrRmdyGiY17lHLzqwyK97goLU-5b


On 5/11/21 8:18 PM, Connor Davis wrote:
> Export xen_dbgp_reset_prep and xen_dbgp_external_startup
> when CONFIG_XEN_DOM0 is defined. This allows use of these symbols
> even if CONFIG_EARLY_PRINK_DBGP is defined.
>
> Signed-off-by: Connor Davis <connojdavis@gmail.com>
> ---
>  drivers/xen/dbgp.c | 2 +-


Unrelated to your patch but since you are fixing things around that file --- should we return -EPERM in xen_dbgp_op() when !xen_initial_domain()?



-boris


