Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0726D8FB2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 08:47:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518743.805571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJP6-0004vu-VI; Thu, 06 Apr 2023 06:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518743.805571; Thu, 06 Apr 2023 06:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkJP6-0004tX-SS; Thu, 06 Apr 2023 06:47:28 +0000
Received: by outflank-mailman (input) for mailman id 518743;
 Thu, 06 Apr 2023 06:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkJP5-0004tR-Sr
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 06:47:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7d00::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3742f38-d446-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 08:47:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9237.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 06:47:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 06:47:22 +0000
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
X-Inumbo-ID: e3742f38-d446-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZfrnU7T+SRufwcOeKKS/RSTyVYU4tJzR9AZhkH/MnZjyo2Map/rNMcIOL/AJxZ0Ab9nuYRSiqAgPosU72iaFlC1TkGy5Uy0UgyXw90YYbAu1YvevdOM3gaR3ghLt5T4vyZNEXXBpSt8xVS2tjZvobWrNJ3ERtHlc4rxphhHn5xBy2qIx9wfqrXEY2aFrIW6RSNrBWeRGAZdvOF4ps6w80U82kAG1ciEl6ZuGayfMyZZIpwFMltB1owD4M3MLrQ+GKj+kvOOtloozMz4WKYPNu6vxrUa5XDu2nTupznJ8gFamASS9k0qOFOBJJUHmXS1NmxBmoXzj98ICBw4tj0WwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VAXMuarZPILiWCKWQf+oZsYjafLrQh8Xc8wugtXYnk=;
 b=cgnGf82Z1XpxH3jbq3qeYB40kak/Nr64lckgxFze8TVImlAuz1ieYk5746B7HRejw5dqyWMDmpKKXf4da2ACznmQfPWb958tUADlDhPscRJO5/Cg0v5KYXoAltoylCX6DAExcKgvdQYu2qGOt79nLeYfwoElMrEernTSkHG1Aos3b6cpV87YrHDLxpDiXVrMMr+H4XfCg6X2QNDin7NWLOOAgpKpiOx6n+sHzIoGX+oV0tUPCHzqxlbzDDWeBKHSLBSEiFK2KDrDHzm72dPnH6taZw5jmtrgyORlHZqAnq+g53psLpRw7kxmO7I2N32YbPYXx4w2pb9Cxe8jEPC9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VAXMuarZPILiWCKWQf+oZsYjafLrQh8Xc8wugtXYnk=;
 b=j8OMJ7vPDR078k62lTtRmkm4J/Z3TtzOj3SGCPSkijRHaTSdbKhr7GgLYIsk58UwoFNSXarKVLgc8mCSYErYG2dBickPTADo9ExhmVBCLAgjsLJPMJGUhQbT/d9GRis/5+LyHmHeSKDFCdZqKasn510v3o9Hg5sl63dQtw69v1+/i2ya5dgl67io7sCKTyS23uesZuWZqqDzwWrKz5D1GpKdcrvuHSRuRF9WdOMZOgdkyZnd6Eu/1zvbZt7gZL/OQJgbJ0/haNbTeUvxAZ0D/b3KIWyZBaWbgRX/do38+GY/h/I/NB8ic8MuhFUjtxZ/DOcDVnvt2H02bE4aR0Hn5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2336d321-1463-a1cd-97e6-10c0d7ef5e39@suse.com>
Date: Thu, 6 Apr 2023 08:47:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/9] x86emul: support WRMSRNS
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <0c2ddae9-3222-9755-b6e1-35e51410093b@suse.com>
 <0c249d10-02c7-9d76-bc3d-2b3e2ece38a9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0c249d10-02c7-9d76-bc3d-2b3e2ece38a9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: c8348c93-3ddf-48da-090d-08db366ac660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0syHUBVdoV5zB1/0SJoHupe6b4juRS2m2Oh3+TkYSaTeP/ww5mXUSmJgEnEUMUnPZRS5K3LTVKmBCZBcWOea71bhWqWF2RQfvltaoVeELHLiMtW7kP5LTXEU0arjkJDLUx9vKal4Ih5dl/i5+zZITbSzZz+jh9I/vSLDqfSzCKJtzP7RLUkrSEQMvG0aOvUH+PtXQFnYbeKKp9shqG75geQb0d40AVoWzHhJanootR0IQKF61MJJ8OdaBsmudW+ms/9GxzjtfBY1Dh0oLl73iMHrAMcPXghRfO5Ck71VFQwBEHAB2x2tqZlirgtlvSKZ/CK+dtD3KjMSaqMCYg12C5RVVtanS6cgu8gx1/BGNt6uIdIpn3WPdNSGZg/74VZ4YkVy6oWwmEIag8cyYs9yZYyf7fry4dI6Y0g3CzmbBRuCfgZTilKdB2+K3l1oAYQz0L/QJK3ucgHbF++KaH7hYRasuRWKFMs/PBhwkRkq1NwY9v+yFjrPs6LZ110vWHrAYJ7jDBjeKTvZ4LjuHgVwSxzNiCQdKFstBNbQJrDxgOt5WA7qgy6UyxxlUEcBeDn8y+eVZC1eMVz8ePO3Sp38q/25/9W6RIFghkbB9dTDwc+/MFSB4RyTLo9Y+KGV5XpJWMiI8TFeS5bVrkD01VF2Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199021)(2616005)(6486002)(478600001)(316002)(54906003)(26005)(6506007)(6512007)(186003)(53546011)(5660300002)(2906002)(36756003)(38100700002)(4326008)(6916009)(66946007)(66476007)(8676002)(41300700001)(86362001)(66556008)(31696002)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1laOU5XRERsVG0zUXZGNWlOeU91aW0yWWdaSE1zczJSeS9IMG1PWlpISUdR?=
 =?utf-8?B?OU5oM2NnRTA0Sm95WGllN3lQRFB0MG96QVRwRDFVR0VhMklZZjJ5VDZhWFda?=
 =?utf-8?B?RVllTGk2QWc5UkJvT0xIcVZ1SVpCTGpJRmlBMmJzc0N1VkdPWmRoVDh6NXdt?=
 =?utf-8?B?Y3puc2k1MGJTS0VnRWYzM1FHUDlHMnJEQjZwMFZVbUp1N0xzU29yZHRyWUVt?=
 =?utf-8?B?R0tFVzh6N2RUZ214U1M5YStMS0d1aTBpUENNaVFDWVg1cGdrR1lLTktTeitG?=
 =?utf-8?B?ckg5VnZ3aytwUmVTMVlmVnl3d1lsdmJINk1ydmFpODZtNUtHTHFTdkNOTWww?=
 =?utf-8?B?QlFGSjR6d3d5Wk5keXpWVEFTNFhKMlBUYTRYSUROMWxBbkRrOG41ZEd0V0x6?=
 =?utf-8?B?cGZvQUVjRE5iaVYyKzhLVzAxbzAvaTBqSVF6WXdmZy9ZVEVKWWxveFM3UVB6?=
 =?utf-8?B?ZzJsOG1IKzBTTmNQM3AvaVBTVTJrWjZmVWx3MVFxN1F0NXcxYklsZ2FwWVhV?=
 =?utf-8?B?UG9HQlZuUnF4cm8wd0QzdytGMWRmVzRTSzF4R2lqQTcvOHdIZkNtVGJJQWFB?=
 =?utf-8?B?bXAydjI3LzdpVVh2RTlLcmhsSjhSZmUyMWZMUEgrZTAwQ29LUEpjWHhxTVFt?=
 =?utf-8?B?NE9QV3JYNWI4ZGFkNUJ0VVVRSVNBQXpuRnZmbTRZWXNHbE44aDV3b2JYMSs2?=
 =?utf-8?B?TlpSdW01aC9STk5admR3RytacGYyU3VSWVpsNkRYeVdSNGJIeVM1RnpUdDNQ?=
 =?utf-8?B?UW1TOVV3QUlhMEFWM3VxU1d2T1QzZERPNzlYd1BBZ3REc0VsMnlTTDg5M1FN?=
 =?utf-8?B?MlZKM3VNbTU2SDlxSzhneGd4ZnVHa3BuSkN0cWc3UE9iZWdDZGVlQzlEZUxm?=
 =?utf-8?B?QXEwZHUvR05rQW53QnB6ODZVc2laMDN4SG9OTjR1TXZIZWU2c25XR29tMlh6?=
 =?utf-8?B?ZE8wYTVUNDNpS1hwZFV2UjVuelhOTGczOXE5VmFUamVka0JGMkthNEU2bi9D?=
 =?utf-8?B?YytzTTMzRzNMTUFqMGpkZ2lyWHhWbXoxNWF2NmhLQS92K3F4eEVJT3VvZEd1?=
 =?utf-8?B?WkE3emVCaFhjYnc1KzN4UTI1d0hJbHVMZ1phLzRDdG1QYTN5b1J6RlJQM1dW?=
 =?utf-8?B?bGY0TXA2WXNFZ09wR3BxNzZ1SGw3bHBQVXpESWVtTUZOUTJxT1pydkZtenhq?=
 =?utf-8?B?bDVnWHJDaklNaytlZE9Nc2RhZDU1b0llejdwc2p3T21HWjVKS1ArYXA2OG04?=
 =?utf-8?B?RFB1b2ZjNGw1V2RFMXNaRFpIVDFlMlYyWnNNYkx6Sm4rcXBsNUJOcGZyU3N1?=
 =?utf-8?B?NGpUWjhDVnRmQmtjYU1yNjFqaGloZEF4VE5JMnVtMjRTeXBQbWp6MnlMNXBi?=
 =?utf-8?B?eDV5WjBoYVVHNFVQSWxOQlNpcldwMk9uYXFYNGNlUGF4YktlYWpYbmZ0MFZL?=
 =?utf-8?B?c253RnFNZTVKRnNzVzdiaXlxeU5BWUpUV0FsWmhXV2Jac003c2hLVjY3N1NZ?=
 =?utf-8?B?VGQveG1XZUtyM0sxYWJBbDZ5S1gxbFkvS2FYaU9jci9GTExDb3pObkZHWnRT?=
 =?utf-8?B?a2YydHRwaFpDa2dhY0ZJVUdsM3ZFeDZJR2JKQitVWEZiVFV0bDQzaThFN1FL?=
 =?utf-8?B?bUhUUjhyMDBPQkhDdlgzZHJDNXZQSTFhamdrMTdwTHJSMzNoY0J3eWNPL1RY?=
 =?utf-8?B?MEh5VU40aHJzKzlSelZzV3hvY1J5L3VtUE5zVmtySzZja3JvQ005Z1R2UUg0?=
 =?utf-8?B?cE5yMkJDa0xTb0pZM281d0xhMVdqWXZZYnFKZWV0ZmJkTWpDRWVPM2pXNXdq?=
 =?utf-8?B?dXB0YjRYWVlZai9JckQ3VjVINGhDWmdCSXJITnlENmw0SVJTRDREQlRUS0dU?=
 =?utf-8?B?bXdGTWVxbHBFWGlRYUlYYWxJVXpYWEQ4MHg5VTVGcmRRUVU0dFdUMElrM2ta?=
 =?utf-8?B?ZUQwUzFFMXpBY242bWNTMVlOUmc2V05NV2ErdzZDNTNMTUZQL3lLVEtua282?=
 =?utf-8?B?ajRjcFNOdTh1STBoNTdyTTlrUU53VE56SWdTN2YwOEpGT0ROa2UyWnNaZ0l6?=
 =?utf-8?B?Q2JFT3lZcjlwaEtqUUlIdnF5TkFiaGY4K1NSWnJUWXJsSnhVMFBPZjVTRnVI?=
 =?utf-8?Q?Rc49MEsePL/TEtmFmHdIyc8Mr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8348c93-3ddf-48da-090d-08db366ac660
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 06:47:22.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FofPGH5EDjFCYUXltfHdBcXI2prkXYR7+iojQePo7Blgolnud4oVDSdJuALh3fbKu/z4zUGDGTgLpSwdwWZN+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9237

On 05.04.2023 23:29, Andrew Cooper wrote:
> On 04/04/2023 3:50 pm, Jan Beulich wrote:
>> This insn differs from WRMSR solely in the lack of serialization. Hence
>> the code used there can simply be used here as well, plus a feature
>> check of course.
> 
> I have a feeling this is a bit stale now that 0f01.c has moved into a
> separate file ?

Hmm, no, not really. This code was written long after the split anyway.
"Used here as well" is meant as "copy that code", not "goto ...".

>>  As there's no other infrastructure needed beyond
>> permitting the insn for PV privileged-op emulation (in particular no
>> separate new VMEXIT) we can expose the insn to guests right away.
> 
> There are good reasons not to expose this to PV guests.
> 
> The #GP fault to trigger emulation is serialising, so from the guest's
> point of view there is literally no difference between WRMSR and WRMSRNS.
> 
> All code is going to need to default to WRMSR for compatibility reasons,
> so not advertising WRMSRNS will save the guest going through and
> self-modifying itself to use a "more efficient" instruction which is not
> actually more efficient.

Well, sure, I can drop that again. I don't view "self-modifying itself"
as meaningful wastage. Plus I'd consider it reasonable to expose the
feature by default only to HVM, while permitting (non-default) exposure
to PV (in which case the emul-priv-op.c change would want retaining),
except that we can't express this afaict. Even without exposing at all
I'd consider it kind of reasonable to allow use of the insn, in case a
guest infers its availability (or simply knows from executing raw CPUID).

> The emulation implementation is fine, so Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com> but dependent on the PV guest changes being
> dropped.

Thanks.

Jan

