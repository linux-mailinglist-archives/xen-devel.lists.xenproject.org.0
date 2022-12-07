Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C8A645363
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 06:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455815.713395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mrq-0007ez-NX; Wed, 07 Dec 2022 05:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455815.713395; Wed, 07 Dec 2022 05:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2mrq-0007cX-Kp; Wed, 07 Dec 2022 05:21:14 +0000
Received: by outflank-mailman (input) for mailman id 455815;
 Wed, 07 Dec 2022 05:21:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2mro-0007cR-Ee
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 05:21:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f393fa3e-75ee-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 06:21:10 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 05:21:03 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%5]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 05:21:03 +0000
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
X-Inumbo-ID: f393fa3e-75ee-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvOVchZ/k9oKpzB/SMGo3pjsQovbPCKr3Hk10g8WRGa6rNoywZHvYXW2F4LFdzh3UGrBRD4W4Xlsbd9AGUjvyl3kFdWkw5HEBd77Y3RvAbCSG9p2DJhtTO0+OZaX2Ow59sXpqoDELDCdnOHwBeXRg7yy6mhFyNDkpckTkyPMv5FWT3WHVmYltQAAbh5Ucttg8t4UorBcF1eEIZnLzHlX3XPwu7VmPFV3HOkQ0nTRzI43HYv2jlzVC8+A7dADufQYtm+6YaIv4s3xA+eUoPknhxow5D0UzoPOHg2hSEBWEgQBdbnVeHfAgiKLDBf++iV2GeaNvdPvcTtNeel1cflHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rryMa14I1C131iXC0ZAtvzKPFOl6B0v4Uugv0BHQAKo=;
 b=hsiWTo1CCQhPDlzf+kglHwuy5ZB/4nKMGbSt8a9eSpI6zf5xNjY9oaJRjmKiBev7PUychnf1tR97zeEviK6Pofx2mvvW7/w3iZ9jR/ks9kcCeGk4SXLpF/JOsBAAt9U0L5veZ7+mDO4XK4AoGpOcYTNTYncgR9LWVWrEgV8rGMtALkTHQoKYTbmJBDzdr+zYkdK3wWA4O1DhON6ZBAh75Nuo3Bp6SQmefr3PhHUXC+9LB3nsau7+WLp82Ou52p/z5Rdae9bPSlCEF5eRh9Toh595akmGiF5XkSLS3eTEwVkVfAlTiZaevrPPhCokU/YpV19MK5LJKatYO6cLtYhXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rryMa14I1C131iXC0ZAtvzKPFOl6B0v4Uugv0BHQAKo=;
 b=EwHJHW9Pn+Ugxc1LU7ExgtDtH4HFC8rQqQ+QFATlbDTxKzbbyLyc/39BSix9MUMp/tqi2LJpzspICAxEZxyBRo3t32L9y9GiZMVA1/SdTfTEjPADyBjr85GGeL/nlKl8V+clvj6q2qSoJiKr4+SNVo0KA9HzCsybg/HcPgnR5X0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3827140c-2d50-053b-afde-62db34c8c76d@amd.com>
Date: Tue, 6 Dec 2022 21:21:00 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v3 09/14] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "volodymyr_babchuk@epam.com" <volodymyr_babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-10-fnu.vikram@xilinx.com>
 <996B7C26-0D15-40FC-BE58-84B4A1F51A62@arm.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <996B7C26-0D15-40FC-BE58-84B4A1F51A62@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 221b8bb2-0f1c-4429-045c-08dad812d569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XHCXzmULG2Wbiq8IPNA2JW+MIROGGfm4y8g/ca/9Py0aIsY0oZRJVE0TAdXoTgAFBJMHd7OWz3pc5kUFc6tImwO9Qv5u9avVGeV3khS39BbmSl29Cnl4TuijXFeoUZjxXxZj7AGBVnK65faKn1qn6EgQicJIRRRUxbXhy67mLPkh1dGihPkB71D48HIde4uDppRQ21K8MFXXYeEnvM49YFz6QehIQZrtSEv3HkBZOSMcLRx759OJpsvLgpDbbuGi4yWMQvfbR8o6wYzw+mMyzk5AIEeIqmAbryOA6eRruppI+ddESFGR9kxa3LCg55hfd+3g0SPSdmi+v4410gb0xlsNe297jaAL9wgxztZraKZ0Labu/wO8v3JK9Ys63L3zBX0FjRU1Km+21c/WW7nJYnd61ZM0J/8vaqQLC+iGkuMFFDiHeBgwrhAVgsPQW/YUbqcMPMcIe2rqk6jO7IjkEa3ewdabUa/kjQBC81JO8V3xTkNOKsPp+tpqlEYCYFD63WEqmq8w2pwFPjN/folLPmPQ+MG/kKmc1dOLGPilh0oTROdnxek1qr8cMxcZYR9iSmyUbXxf+R7spX4VciDeD04K04BlXZQXMrl7k+FlPfwxrXHnt0rJi+NLPnvZwNmCtPbfv36noceChE0I2e0/QOd1bCcmhWljMQZ4wcN/N3HhdVidvhPyLnRLdQCspnN9f3tKi8Lh67Vkm2kaZgbNfs4MyTiNXOyBGmFAZqcTqHg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199015)(2906002)(83380400001)(31686004)(36756003)(66946007)(41300700001)(186003)(86362001)(31696002)(66556008)(38100700002)(26005)(6512007)(110136005)(4326008)(8936002)(4744005)(2616005)(66476007)(44832011)(8676002)(54906003)(316002)(478600001)(53546011)(6486002)(6506007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVzNHEvLzRTZjErU3doOTdRNnhqQkc2dEllN2VJSXFFR3dHdEM3RzlBaWpH?=
 =?utf-8?B?dDgwQXRHS29UZFMxaWNKTW5RNVAvOGFHd1hRNTMraHJNK0p3UzNCZGRoMUdq?=
 =?utf-8?B?Y3lkcUZtQTNXQXlRQ0djNzlJTzNjUm5DODg1dGx5S1pnRkJvZzVYRmJkaFJN?=
 =?utf-8?B?RDBsOTFzdjVKLzlYL0ZkU3RSS3JlaVZoc3lQS1hIS2ZKQVVOcVJKdjlCd1Jo?=
 =?utf-8?B?c1BRYkwremJrbTFRNk5RNFYxZW5WajJLYUxyVEdTYXJYM05QTHlxaURlQlll?=
 =?utf-8?B?N1VSZWo3NnltV1hYeGZIK3JCM1N6ayt5dmxBMTVVczJ6S2dtWVFndGxGcy80?=
 =?utf-8?B?QUJSOFVWQjNWRUVqY0orUCt1SFZIbE8zRVNTcGlpQVZQWk1hOGk4VGFXdCtL?=
 =?utf-8?B?dGRmYUNzUFJGbi9zeUFVd1lwRzdQaHFsYWpocWJWSEgxc2tkV0h6Nk1ocjVn?=
 =?utf-8?B?N3hlZmFWT2EzY2Q0OFpYK01RbmJ6N0xrYU1EWmo5NXhsYm01OTdJUUFnRnBy?=
 =?utf-8?B?OEpQaVAzaTQrQ3cydFJMT1Y5dkl1WlJvZzJIajY4RHJPcXZTUy84WGliWXRP?=
 =?utf-8?B?ZkdhRHVubWE5dmJyZ0daS0U4RnRDbUFjQmtXWHkycnBZdzBOeFNKS1NreU5h?=
 =?utf-8?B?cDFIOVUvbi9hMUJGRVNpdXZZMExrKzhEd3VJWEphcDh5M3JZYU1iMHNWUGU3?=
 =?utf-8?B?UmQySFpaTXlFNDhyM25hbFl3N04wS2tZMVR0dFZWRlRybW5YRnNRUmprK2J0?=
 =?utf-8?B?ZTJJbE95akFxN3FOVGdJWks5MVRZK0o2ZnhpcFduOE5JOUJBb2k3Vi9ET0o4?=
 =?utf-8?B?YUQvTkdYL3lsZkdwWGsvVnNxY1pNb0pWZzBNOFdBYmFuQ0NvVElCSE1ieHFV?=
 =?utf-8?B?VklBdzVscjdoZXJVTUJvWDNQeTEyaFkxaFFDazJ2bGdKM2U2STdtOWp0VFMr?=
 =?utf-8?B?OUVTUDFiMXJ0VDErQjk4dGRVREtUenV2MytlNmd0ZnJYQ1F1VEl0TWF2OWdD?=
 =?utf-8?B?bmN4ZlF4bTRwSGJYZ2pTVzB2eWdiL200TWdEdDhHSEZFZGl0VENuQmhOdElY?=
 =?utf-8?B?Q0svRmQzUU1hbG9mTEswYjJZVzBqM3VyMmpqT2pENHluaDJ6WXFuSWVsRkM2?=
 =?utf-8?B?eTNqK2JyZUNtdHZ1UHF4blFLdzhzMXJKcGtVN0hsVmora25LOVBKbXZqcTFM?=
 =?utf-8?B?MHFiYkhocll5NTUxMGpsSzhRSTNmaTJYTXFjY284eTF2SFN6R2dYWm1iVXJh?=
 =?utf-8?B?R1RzLzNwVktsQkxHdU15bHpid1dkTkVvckxjMXdmWlBEZWlNZ3o0bVdpMnZQ?=
 =?utf-8?B?Y09wN1B6Q1BZNThUdjBVQ2toaFZpRDZpM09zYklGZHRjTEJCb3c1SmhNblBW?=
 =?utf-8?B?RUU0T3NmNVhDTXVHWmJHSDRNY2pnT2lQRnRVSTN1d2lXR2xWYlpnUTU2MTNp?=
 =?utf-8?B?ZFhrcEVsQTdDMVh1dXFwcFhJWnY3eU8wTk5IVGJqdnJKQi95elMxN3hTazdR?=
 =?utf-8?B?RXF2ZHhhODVJajFFWmVPWWNxRGJVTWRSVWx0cUZMRHYrc2NybGdHR0VCeTBX?=
 =?utf-8?B?ejFjcGNOVjhNK2dKUkt3enlxWmx3bURHZDBLTWdzc2FOTlFZb0E0K3dFc2NQ?=
 =?utf-8?B?dHZDaHg5aHRrdmNYSStiR2V6bVpWUnRzMlZJN3Y4WGpucnkvUXF6UFN4OXky?=
 =?utf-8?B?YnVIR3JjNTdMcVc0QlA5eXJvNjM2SkFwQ1lzTHRDZkxKV2hFaDRZQVhlNzlS?=
 =?utf-8?B?bHduVytnN216UkdidUVEQlJiNGtJTHkyOXVhL25KVERVU05qeUdGZlE3c2Jh?=
 =?utf-8?B?ZnpQZ2tWdTNzNTljODhpU29XeitHcnBKTHZDTjNndGlmajhvQXNUNTUzaDE1?=
 =?utf-8?B?UHdNbm05OHczKzdLRytPWXNqVUJIaXV6a1N0TEZDZE5lbjc3MGJxKzZ1L3pr?=
 =?utf-8?B?K3hTU3lodThGdHhKR1V4OGEySXY4L2x2NWhzOWo0ejRacWx2ZEROUXFMUFM1?=
 =?utf-8?B?UlNYRWdrRFJrYmlveGFSdmh1YkZ4a1VHbXlneGtnMW1zNDBlOU5sMExGL1Yv?=
 =?utf-8?B?QnV0WTN2T0hkZFpKQzl3WWFpNytXUVdjeU5YUnFIOUwreTJBQ1o1cmgxSEpo?=
 =?utf-8?Q?VMCSAZQ1/WsLrTVhguzIqJazA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221b8bb2-0f1c-4429-045c-08dad812d569
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 05:21:02.9192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzUU6wt4Q6/huCee6cZVdwlUupgizMXijMIZSPzHHutnofOs3Ab2Sp/UrCCgPOlf4y7hT1Ojk4VwlY26732Ckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038

Hi Luca,

On 3/14/22 10:50 AM, Luca Fancellu wrote:
>> +int iommu_remove_dt_device(struct dt_device_node *np)
>> +{
>> +    const struct iommu_ops *ops = iommu_get_ops();
>> +    struct device *dev = dt_to_dev(np);
>> +    int rc;
>> +
>> +    if ( !ops )
>> +        return -EOPNOTSUPP;
> Here we have that the counterpart iommu_add_dt_device returns EINVAL here and...
> I add EINVAL here in v1 but Julien suggested to change it ot EOPNOTSUPP.
>> +
>> +    spin_lock(&dtdevs_lock);
>> +
>> +    if ( iommu_dt_device_is_assigned_lock(np) ) {
>> +        rc = -EBUSY;
>> +        goto fail;
>> +    }
>> +
>> +    /*
>> +     * The driver which supports generic IOMMU DT bindings must have
>> +     * these callback implemented.
>> +     */
>> +    if ( !ops->remove_device ) {
>> +        rc = -EOPNOTSUPP;
> … here (for !ops->add_device), so I’m wondering if there is a mistake.
>
>> +        goto fail;
>> +    }
>> +

