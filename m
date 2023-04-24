Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC2E6ED004
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 16:10:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525417.816598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwsy-0006DR-ME; Mon, 24 Apr 2023 14:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525417.816598; Mon, 24 Apr 2023 14:09:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwsy-0006AQ-JH; Mon, 24 Apr 2023 14:09:44 +0000
Received: by outflank-mailman (input) for mailman id 525417;
 Mon, 24 Apr 2023 14:09:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pqwsx-0006AK-1Y
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 14:09:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7858d28-e2a9-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 16:09:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8614.eurprd04.prod.outlook.com (2603:10a6:10:2d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 14:09:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 14:09:38 +0000
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
X-Inumbo-ID: a7858d28-e2a9-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5YRatqsLj3SJTF+66g1pB1gbds9JUCknklNp4ptrmxi6LUVUjOAfi2te/Y/vwHo+4w6iEmtqvvtZnUw4uZXk6/KNHw4VTUBDlDSasFR3ejLs19h0SzLjMgEU+m75KOGBdT1FnlV/Xo12871PUO+TWx68i/XgAJFSwr8jpaoM8e1I2uvF949i1C1CcY690EVqzhaO+ADM2S+IR6uMo9mQu+lO7jE/BJk5hgncOTGv5Rh7SERJQ3UtoKzggJv3qnzvYgqdPNE9WxSdzilu50VeEkaw/jrfM8bp8osYTshaWijWbNeVwtN5lUhaXsuXJwJFufFYhRcnZ8AtHbtDBA9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rE5ya0YLL1rycoFI8Q6BwwfZQ/6az3I8rlSvZ8FhZs4=;
 b=J7JxchkbgHYhcBbmyTNYLtKjaIYrO52c2rT3jhBxDO83Kn9MiomnW9xL61sU88JW2FO5iN/y3QNatroFDwsZfcStoFLSfibnTOShSNvSt3dae+RSUpYZOJ+GxhItn9u7dtPzrtN+2R4sTt/sxVrlbwOVXugooHtRFiOZi5oelx7pryeQkm1baKsQEe49XRwjEhQulvIcKNWA131mRj2LVFSI3D/+w8Hlia164tPz7l2j60jIeAq20FytJrEZrCwGgkwjey4Tj6vY1RNkeIy9On+H8nnp0EHw14NYpMEQFjkU7XXSxfuOEmJx+YUH98FGcUgwQHaQMYEkAXC5zmmHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rE5ya0YLL1rycoFI8Q6BwwfZQ/6az3I8rlSvZ8FhZs4=;
 b=B65Rcs6S4noq3OWz/mgA7c7kkhjsSQRYU5vFjc7p3i9xSgG/miHND/Eoo2eQFujGyHAH4ylPm9ENwDdHyhxcTyxnZBy/lQraW69tNjmV34VGkdTUBeo+r80vR/+9cuGOF8P0LTFzrMMI7C9Df/7OsnUu6tqIIeUp2GhVjkSmkJEdeU/haHYRXzJvfNDFwIxeB8zng8Cod2dkUMzOptsc6cUrC6JeyqIlze2jnPow8Z7s63K2tffW/9NTts8MG+LpUK9MbUV7NrP+PzI/kSSZry6FjOBk7pD9PAaVvH5eCoKVzFXkbQP0equRn8mSUT/4GKWrcZvALWGnt1fiYRlv7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f20d5c0-d21f-ad1d-290c-631230e1f323@suse.com>
Date: Mon, 24 Apr 2023 16:09:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] xen: add support for crash dump analysis with xen.efi
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230421135933.23353-1-jgross@suse.com>
 <45bdf36f-93c5-9f7c-a028-0a9443f85013@suse.com>
 <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e3a900e6-ef5e-9ac2-19fc-c276dc31c487@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc4abdc-c84d-4c98-9965-08db44cd8a81
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/draUdBRZLRQz8BwqrpZmOAGgAcLttDjHoM7jPWkQiOoJQLx+ooKoChy2MaC8ViWIWz0o2NSCldAdAygL4oC80RpuM2FZqJ1l4+TdQwVplW1xvdh72uP8LDkrLARIimZnb77+e5BHlANsFclYa54BozLb7TayJXFAt7t1Bdk0xnKZ5v+MSbYFFwC2mZcJOPH0z4XzBqx9ifXOe1aua2O+nj56zv7B4eCZAhZrLK3QN+E+1GaLs2nEjkOUw/czZK3ufZ5uv0KwRKdXcReIyCMGY/zroXjck+aFBtXQP9abxcpFbypRxFjPuChpfoOHUVEyTKPCNWP72MXQJolE/LPWU+YDxNnSKOHMrEApDnEjM/ZQEQ3DpZDMgqoUmpC/VME1TD717Y9L0vJSBpTS8jDs1wpW1eKzKZcBMybY4TIP1MsHgptM5iJGvNUbiDlbHMjvxko2WIURu9tzZa+auJr1mfSTQDBB7nlUVXIAgVeQAJbbvWHuf6Gd/jSGsbCmfGPDFh+4qod8LkFuEWZaDU+v9jZHTHQPhrVZHhGS7bVpFo2x/5iXiTwy+n3bNo1DQ0LUUsG/pBYywqrq1h5bWgaPOtA05Dz7RglIPZozfd1UIk5yWq1i59O3KuE7r+bGPYW5445GXJ5Kb26uIxW+i4rTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(4744005)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(36756003)(31696002)(86362001)(6512007)(26005)(186003)(53546011)(38100700002)(478600001)(6486002)(31686004)(2616005)(6506007)(6636002)(54906003)(37006003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T29jVUUxWmo1VkllM0phWjg5TndnZ3Z5b2pTU2V6dGpta2N0dDFrSTdkUU83?=
 =?utf-8?B?Tm0xMVpxTTdPdXhRRXBWNTh5Q1BGT2FYZ0lOM2xkRGRhZVJTOG1FSlNKa214?=
 =?utf-8?B?ZnViTjB1L3VlejJBT0ZORWRGbWMyS0pIbSsybzVBa2lSczdnc2pUWU5YY2t0?=
 =?utf-8?B?WHQ4ajRpZno3dlJwWU84N1pOL2lUTDI1NjVnOURKalZTVzJ2QkhQYlczWGFj?=
 =?utf-8?B?aUhHQkJrSnlHK29GWXdMaWUwWFVlVnlrWE9xVElMdWJRc2JaY1Zaem5xY0tJ?=
 =?utf-8?B?ZGIxNjAyVmxKb3FjWVdYRHMrcTRSV2tLKzBKbWdiV3lPV0JicHQwazREZVVU?=
 =?utf-8?B?bDl4aW95UTZ6akgwZG5EZkhnWHFuZCtTaXR6YXExelhaL0hvL2NpTlZ1eDI1?=
 =?utf-8?B?VWR3ZGthWWh3bVZ5a1FhWWNqTG5LbXRUVGRzcm5JTWxjR0NjSlpGS0R6Zy9o?=
 =?utf-8?B?ZTJNQk0zeFc2ZjhRM3UvT3dRMzJmREF2SmFCNGR3cm9qZnVJd3VTMTZ1MTFq?=
 =?utf-8?B?NnZqVGpaOTVRZk5aZlgyaStjS3dsakpVTDJxV1NDQ1VBNzExbXZjT25CMi85?=
 =?utf-8?B?anhJYXpYQzNDMFJtRmVZZ0JkQXlQbnIrWXJjRTBOTEduWUU1empZVnZnRlk0?=
 =?utf-8?B?NVIrOXlsMjUrWW4xQXVVMEx6Sk5yOG5JY0ZjdUR1b1VLM3VIcWw0Y1lGT3JI?=
 =?utf-8?B?Zkw0REZkd3pwaUFHaUp4QXRYZWdlTWdrNUJXY1lQQkp2ak9oYUpaejZiZ2lD?=
 =?utf-8?B?Rm15M3RvWmVUWklVMkVYNS9uVWhUQVR0a1FiVVlBeUhRSVNzSHVVTXBOYXdq?=
 =?utf-8?B?SE5vcDQxcGI3b0hCQjFCN2lTRkhDZmJTSCtGQ1dvdmZ6SUNTYjB4WFVwNWd2?=
 =?utf-8?B?Sy9pMDZNYTBwN0ZjTDk2bWNqNHdsSnV1UXZpSUdmNm1VKzJ2NFpzaFVFOHNU?=
 =?utf-8?B?VzlRQkNrT1llU3hoRW1JbVlIZzBPd1Mwb1lmK21OcHVaRGl6V2V1SXR6Z3Fz?=
 =?utf-8?B?MUtSMTR6di9lNUpCd0IrTk5NWEtsMzd2MGl6Yk1ib0hFMjQ1bkRFSFMwMGdY?=
 =?utf-8?B?VVA5ZnZrUnlKd2VuTkxtcnpDQW9MUHBaSWhQSmc0NHRoTmI4emgva0QwaUNp?=
 =?utf-8?B?STlhNjYzYkRPMEFFc1pJaGgyYWlCeE92SnJsamhCbFZLTXlNRFFYOHhkLzlo?=
 =?utf-8?B?S2VjY3EySW0yL0hCSjJTWngzdHN2YWxFdngvWXB3UFlwTEozOXQxZ3dva0Ry?=
 =?utf-8?B?SDN1cGVlMnY4SVVOU0oyNldZZVkvRTJnM3I4aDgvTW9HK3VVZVYyN3lBQUZu?=
 =?utf-8?B?dkZXZFJPaDk5NHdrT0VoVFM1eUZkMmtsYUN3VTFVZHZKYU9yckpZQjhnVU1x?=
 =?utf-8?B?c2lTT003VE9sajRnMmx3TWFCbjN3cG81YlIrZUxwOUszTFdwRUJYQjZ1TTlh?=
 =?utf-8?B?RktOcHU3REFDSHpqOGNNdmVSdExYbzMvT3dxa2R1WGlvTmgyVTdDNjlKdzFn?=
 =?utf-8?B?MjRTNXRNeFp5MVJJQ0MyYVJLZEJaMWlmK3o5QmtpODVkRDJ3c0N2aXJjdEth?=
 =?utf-8?B?VlppdlhlVzVNc3JjVGNpd01qd2JaaEYxZVNJU0c0MkV0VTNwVUZXTGx3dmNI?=
 =?utf-8?B?cXRXeXEzdUYwTURibHQ1UWU2cTR6aFNHZEZFckE0aHNtOHNndTVJd2xoYlpY?=
 =?utf-8?B?WGk0dHRpdURabU01b3BxYVRTUzlmaGlta0JCeVdUNktlMi9HRkdiUENBTE1X?=
 =?utf-8?B?NEtEalo4aURwT0xlYTlNWUZpUW9iWm96d2xWYjRhWkhKOHhiUE1keGlUa1Bz?=
 =?utf-8?B?cDZOeG80MHpnWU8xOUdWNmt3MHJqSzlid1hYWS9Va1FyalFIWEYrUi9oUVNs?=
 =?utf-8?B?eG1UdSs2NTlMK1YxcElLRzdacnNpY0Q4b05LSnkvZ2NRT0tKVGdweXBuc2Vm?=
 =?utf-8?B?YnJoVWl3WXVQZVdMSTBkTFkvYWMwZ3pGcFhzb0tDNmx3NkxPMDhOcW9leElU?=
 =?utf-8?B?TnkvbXpPdkp3eEFDbXc2OHBmUEpuNlBvTm9WdnlhLzF4dmQrT1BhS2lwVXB1?=
 =?utf-8?B?S0ZHdW9xUk1UVU5PQnpJR3ljR3paK1Y1dWZ2T2FEYzVBSSs0TTEyMmpFaVVy?=
 =?utf-8?Q?njVxKTFfYZ63pQm0wEvk9xUYQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc4abdc-c84d-4c98-9965-08db44cd8a81
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 14:09:38.7029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kWb+fNxpnJEt0H12HeJ73sowp+ylcXTJ7i+qtRllSNi+js/Pzivm6mHfhZNc8YI4dD/soUp0/aCkxwf63RpsHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8614

On 24.04.2023 15:44, Juergen Gross wrote:
> On 24.04.23 14:01, Jan Beulich wrote:
>> Finally - do you really need to copy all the non-debug sections as well?
>> Might --only-keep-debug be helpful here (provided it works for a PE/COFF
>> -> ELF copy operation; it looks to do so in my simple experiments)?
> 
> No, doesn't work (objcopy does, but not crash with that file):
> 
>    crash: xen.efi.elf: no text and data contents

Oh, wow. What use do they have for the .text / .data contents? I very much
hope they use the in-memory Xen image for analysis, not what they may read
out of the image.

In any event, please add half a sentence to the description to mention
this aspect.

Jan

