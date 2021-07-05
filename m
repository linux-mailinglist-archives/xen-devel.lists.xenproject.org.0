Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338E3BC2E9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 20:55:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150610.278451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tjo-0007Xf-TO; Mon, 05 Jul 2021 18:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150610.278451; Mon, 05 Jul 2021 18:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tjo-0007VS-QR; Mon, 05 Jul 2021 18:54:36 +0000
Received: by outflank-mailman (input) for mailman id 150610;
 Mon, 05 Jul 2021 18:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tjn-0007VM-AA
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 18:54:35 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f27dd30-ddc2-11eb-8459-12813bfff9fa;
 Mon, 05 Jul 2021 18:54:32 +0000 (UTC)
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
X-Inumbo-ID: 6f27dd30-ddc2-11eb-8459-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625511272;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ya4ZKY5yRHzvindUHJ513rFRdz1LKZPY4rjc8FkpNj8=;
  b=cEUPAIFPzUlZyiM4/ER+FiHodOj8LL6mXKCJQxMkLXWgPdiMtKlsUlfh
   i/KI5RRWTKA21qwwj+fVpfE2sLU3kkq9+xD68wzFMNM3adcyVsP08uGYl
   CTR8JFny9xBphrCg+vXvLW5TQoHinFk7RPNjn7QH/Jx1SLZh8+Vyo9qXi
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VAovEy1cZQ/jd9JZjKBU0kPPBqGpZ6ZVi/8/hDggTcwYz1NdyZmDsglTJmApKCtiLTAL0pnpH+
 4wFVIo88ePe4CKxXkdmnRuQ2pmvUNMGXPMHh70gTiV2Be/2eSvYHTeF5K04EwwXlMs7k8ZU3xz
 n0goSVDjx1nxxJCRNryKekE88nu3eXNZ9BfmHPubsh5vJFszkyhKmjIDXN/sVxeS1O//rmnPzf
 OytrBIMMe1dRIybLnUUdP8p7zAVsiFnxjjeHu02ySFbIr9YzWWo3vBlg7VtPVWkkvpk1nnOJ3p
 pAI=
X-SBRS: 5.1
X-MesageID: 47662287
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9ig4A69I7+7aVvKx/1duk+Ezdb1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc29qADnhOFICO4qTMuftWjdyRaVxeRZg7cKrAeQYxEWmtQts5
 uINpIOcuEYbmIK/voSgjPIaurIqePvmMvD5Za8vgJQpENRGsZdBm9Ce3am+yZNNWt77PQCZf
 +hD4Z81kGdkSN9VLXLOpBJZZmOm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjMTSSlGz7sO+X
 XM11WR3NTsj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhHhkByhaohNU6CL+Bo1vOaswlA3l8
 SkmWZuA+1Dr1fqOk2lqxrk3AftlBw07WX59FOeiXz/5eTkWTMTEaN69MFkWyqcz3BlkMB30a
 pN0W7cnYFQFwn8kCP04MWNfw12l3CzvWEpnYco/jxiuLMlGfpsRLEkjQdo+M9qJlO81GlnKp
 guMCjk3ocVTbvABEqp+FWGqbeXLwYO9hTveDlIhiXa6UkOoJlD9Tpu+CUopAZJyHsMcegx2w
 36CNUfqFhvdL5dUUsvPpZNfSOIYla9CC4kZ1jiX2gPUpt3Y07wlw==
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47662287"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuf0wlOhrFnxBtis1tyfUq54LQoVXiE/lItO2OpXVJWSmQC4cBmfbTzM9p8JQm6fbOMsYyQQVQHSgqDlh+gx3QG+hm8ag7dTc6+3qimBDhvfiHLa26QxK6O9rpN0RnUvERN3mQ0yTzMg0S9//Fshpv7pxsgTnKBcqHhpZjDYkEaUpqs/RVne7veA6KDNG9i2z+GOt2FsAn0//uVnFJTHZFAIBfu8MH9JNVRAzw9nwXu6YFOEat2Sq7/OqWmkxTLUS9JWWTnDR/Rfxs3swF1wn9NxWw2mmBa0IslS1NDvoYqrtIJL6rskfomerWPCMf9/G99ES3YeArcjVPXaPmf44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya4ZKY5yRHzvindUHJ513rFRdz1LKZPY4rjc8FkpNj8=;
 b=cA9VanrMx1DW3a5EAIinettidkUlNoX7OQUTcQrE4J0rOeS9BpuF6cMuY4JFwd2xDeiUT3noC157QvExtxglX2GmR9qQ96ctVLdTu+JLKRIqKh3eMuc/OfHjbUFfWVbKjDlHEZox/z4/d+5SLREHCV2WTvgGoQlJUvff9jYvOkpcSGgYmnTK56Du6B/BX2bIAagTA8hs+9Xq4qwj1nAFXmxfurOTGg2ZMyeGD9sdcDl7hcexsxg9Ym0+lu/9Ih47ed5BkdWQXY3LTpPwHwHXOdy9T5s+Ce2oZBUGvWqbJYznEoTG+2G2gKUIprdf0r+5qY9upekIBm6CdOYIgvdupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya4ZKY5yRHzvindUHJ513rFRdz1LKZPY4rjc8FkpNj8=;
 b=jlOQqZOTEgm3jMQKmPKhYbbbPKaX15x33oc5YsP5AqNcn8h4P4A2jUKZBZE1kP/80FfmKYliZEzevqr4v6q6Ve5fIp7w4LAyOF9Muo0h4pWzijjPm0eFEyEidn/SKqVRv09Xyd6bPap/5HQn8LGHRB4qtyguZ6GZ5mKJcqTxEhw=
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data pfns
 in migration stream
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-13-olaf@aepfle.de>
 <e5f00724-61fe-fed3-35c4-35df837a49c2@citrix.com>
 <20210705135350.GA31821@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cafc7026-102d-f569-78a2-9a960e05d8f3@citrix.com>
Date: Mon, 5 Jul 2021 19:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210705135350.GA31821@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0297.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb06913d-f0b7-47a2-6e6e-08d93fe650fd
X-MS-TrafficTypeDiagnostic: BY5PR03MB5047:
X-Microsoft-Antispam-PRVS: <BY5PR03MB504748F46031820D6620BC8EBA1C9@BY5PR03MB5047.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9S9LYWNNwQtow3Lgt3x3NKGr46WCmxkoR0LYf1AjqC779q1oKG6kRH1HVknFtiuuCVDSn4UYfEty/AwlZMu134PCxALz9yq0wEq6hwkV2MBBL+HRYDCOWpTpxTtqn88K4wm/VGifHFR557LN+7+q7snOVQcVLkgYpjkjXnKPPZy/1KzAu15ZNg9Hd8NCHnDrdbCEySoFJYXlIfPgpNwYWKHCA9UMl2hz9NnL7TKxqQXRDkvSWZ5eoMtzhl2/1q9vdbIb7vg7qbCZGiDWNIlZKmzKPPp2/HXF84WWji/BbZD7jjGz/TgnyDunhgUNy/oHNAIdCVIKqzXAag2oa5HozK7MMUEoG7FEBoZyRlF1jYmoIrOpspBzCSe4lo0U5At5Qrz4+vmt6cC2P9So3pn+id5bZ7gMWeKew28t/U2OxC6QdR9DHyA0hx6Q/YdwoaD52usA1FzytB/XK/Oc/yoWbZCy8ZI2fTKV9qtBvkL0CA4gO0bhfp3u2L+rStmB4BdPiprlpup9w33Lk0mjgYDxq1dncbZh4VJ4GFOhasep8hgt98xEXP59hLabWbRtwaqjPRzvG4z+RdPk7ZSukEAiPXMEh49K+GIMat3sREhonpGgF7R27udIgi3TvXkRBub2jyQxfeYKYVdJdTln3h10EWF/qGHTOKsssMZmp8n3GdBBav96UnmNFqNExcK3o/BIWEuh3vdREgrI/1q6kxBLh9JR1wFDsHFmBU36qMVHQmU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39860400002)(4326008)(8676002)(16576012)(5660300002)(86362001)(6666004)(31696002)(2906002)(316002)(53546011)(54906003)(6916009)(16526019)(66476007)(66556008)(66946007)(186003)(6486002)(2616005)(38100700002)(478600001)(36756003)(31686004)(956004)(4744005)(26005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTNScEc3RWtGYzBFVStUSTNwOS83MGVNaUhIbkVOMit3eEVjQXM2SGhBUmY2?=
 =?utf-8?B?OGp6RFBha1FlVWtwMHdXQzU4SmdtbnQ5MmpCZ2swZFJCV1dOSWZhdjVlcmxS?=
 =?utf-8?B?Z0s0VmhkbXJObG5uS0VMQlFYUFdGWHRXOVl3dWNkclV0Y29LeWFBVEVuaDR5?=
 =?utf-8?B?VFQ5aUIxVzFNa2ZoRjY5NFZHYXNRV1k3a2l2WVNySStqSnc4VWpjMU0wUVhI?=
 =?utf-8?B?TWN5anlnMlJRUUttejdKb2RHOG5EdFM4WkxEYnhCRjlJVXljeEpJSnR5UTBx?=
 =?utf-8?B?Tm5RRXJEU0NuRXJpZXM2dExJbHRTRHBTYktGS3pxYzVwVFhHa0hNUVhNWElx?=
 =?utf-8?B?NSt4QlkyOENTUHVXL0h6akRZSm9rbUlSWXh3NkIzWXV4UnhQbzMxZGwyYXpT?=
 =?utf-8?B?R292aVBEcC9MQmRabGRIZXlpV1hvUjk2WDVZTnR5b2ZxZTRTSTdPQkJ2RmU0?=
 =?utf-8?B?S0FLUjJLVnJsM2RmZGNneUZhMnZMQ05GdEZBdEdNV3dMYjg4T3YzTjhMVitH?=
 =?utf-8?B?USt2SDF6NnlnNzJ3c21OazhablpsdmhRcmtYSDllOFBYS1d4bnp5ZENqdXVj?=
 =?utf-8?B?eDkrczZ5bHlGS2MzSnFYMm8xSTkwb0h5T0RXVHA5bWFmYWdUbU5zOWZOMmda?=
 =?utf-8?B?bm5QMDVoeVhzaENvNzJBdnZDV2dBVVhzT2dsZ2hiektGMzZPTU9TM2FZZ2NR?=
 =?utf-8?B?c21peUc0NDI3ZDNEWHQ2MTYvY0ovZ1kwbHhHSXNNSjBMSlMyQkorMUJzeXc2?=
 =?utf-8?B?WDNxeGEzM2pYZTA5TWNIWTg5OGttS29weTV5WjZHaFBOK0pFcDMxcndpZWxv?=
 =?utf-8?B?bG96ZWpPRVJMbHpWTEVIaWxTRkdmdW9OQ2NZelU0SW9WaWR1ejlUay9wOEd2?=
 =?utf-8?B?YWExZy9rd2FkdnJhTG9JK2xXaENHcFg3aXBLbGhObkk0R3dyaWdFYzc3YmpB?=
 =?utf-8?B?WUdpcXJBbTUwNDZ6Z1NFQkk0YS9JcE9BS1gwZTBFMnY5QXFzYjh5ejBpZ2pz?=
 =?utf-8?B?UXRZZmEvQmUxQkxKcXJ2YVoraHJhYm9zc29sa0ljaENkTWxCZWE2azEzeUhy?=
 =?utf-8?B?TTh5cnlwdXptRGFzOWtMbkozMld0eWx4Wjc2ZzNQSzkzNG05K1BScDBYNk1C?=
 =?utf-8?B?elZjQy9LK1ppOGR3WXZpRVE0N1N5NzNCQitTQkg1emFjTTlkZFYwcWF0VUNQ?=
 =?utf-8?B?eFhGVnBCOHpKS2VPVXhES0FEUEtMN1Y5YWhyUDFvcVUyZzIxRTNJb2ZKREsx?=
 =?utf-8?B?SXhsWkxyU1Z6MlJmZjluTXJlK1o0SWNicVVwZ3JJRXRZR2NtRTloT0s5d1ZX?=
 =?utf-8?B?NWNZRnZkeFFVODZHbWtjOHVvb2RWamJTVjZCSnRSSHJqb2RPd1JjQ012QS9T?=
 =?utf-8?B?TkpmUk82d3hsMHVsN3JiQjdlV3JSZ3lwL2RwYnR4cUFQZC9tSVg1V3JWRmY4?=
 =?utf-8?B?eTdGdWNqRnpIcEZSdEFNNkxvamx0V2FuREZ4UmVZSXErVmJTOTJkR2tIY1Vj?=
 =?utf-8?B?L0dUMWFTVmFvQ2ExNW0zVHNCcWdVOWZUdmNFRjdtVDdEL01tMUU5VXU4eWNk?=
 =?utf-8?B?WjAwYk93QzE4TW1rM2ZNTWNjcEpJMmlPVm4zRUt5dTUybzJqdUwwbDgrbDg4?=
 =?utf-8?B?VkdKVmNxTUlEWTk4dHFyRXJ6NlVLL2xUWk1DYmtJOEgvMksvaEVVSWpydDVq?=
 =?utf-8?B?TThQdnd1ZEZFSktDWld1UnAzUitBMytLU055dUR2SUtiUmtWc1FkY3pDRE9r?=
 =?utf-8?Q?PqGQkwDDJN63mOTv2IEf9L1gqSaFw1ujWLAA+EL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb06913d-f0b7-47a2-6e6e-08d93fe650fd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 18:54:28.4549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1XoyCMyKPV1SDcvOQ/76cVpgTgmBFbVDwqmtdmlp6G/b/HoYvIlDmT2kQyYGw4g0YqHvZdWN5l3aG9j09ELH1ePkEng7xrLQLqZ1STYGYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5047
X-OriginatorOrg: citrix.com

On 05/07/2021 14:53, Olaf Hering wrote:
> On Mon, Jul 05, Andrew Cooper wrote:
>
>> What do you mean "This specifically deals with" ?
> This was a result from Jürgen pointing out that XEN_DOMCTL_PFINFO_XALLOC
> is not handled.

But it is...

Before the patch, we only don't populate for XTAB or BROKEN.  We
populate for every other type, including the unknown/invalid ones.

There is no change in behaviour (for the non-invalid cases) that I can see.

~Andrew

