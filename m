Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9B2600994
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424214.671475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLwm-0001hs-0O; Mon, 17 Oct 2022 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424214.671475; Mon, 17 Oct 2022 08:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLwl-0001es-So; Mon, 17 Oct 2022 08:58:07 +0000
Received: by outflank-mailman (input) for mailman id 424214;
 Mon, 17 Oct 2022 08:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1okLwj-0001WJ-Kj
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:58:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfa193ea-4df9-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 10:58:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9227.eurprd04.prod.outlook.com (2603:10a6:10:352::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Mon, 17 Oct
 2022 08:58:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 08:58:03 +0000
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
X-Inumbo-ID: cfa193ea-4df9-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l171V+zMgIAFQLvOSU6YiKpsQzKQsbamBzv9vt71gPmxTBMeV6N6NKas4krQHWohbDB1ftUEt35JfiWeuWq+mpOlHKGULANPThzmPGLo9y2xeba5DQSbYLmF1zPBaLnAA8zivrm8lma7dED2LO4vnckAqjJx3bK9ncIc4z4snXsTJ4oLIQqLwj+nkfQkbCcESY3X5o0MsPJdWUmwMjLzw8t1Y3nzOvkcv9oAx1UQbHENao0NbRpQdNd8GF2MuS/xdVbn8BOnmzXUdmEoMyiME+s92rSqL4CHTvqDnoNCL024JkrpnSBW9HleeytZOx+s3sdClkauL4axOTECtbeQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ZPteuKXnMCvcc9aLo97gd0lWtGPEbdX+3VRAr4tlI=;
 b=OtxgFWkfeOx7RpQKwsAlJQdYstE0RUFkMAzfOiVmZ7gmLu6fa9zBqGj5SWAq5LOqvorqdx+2rv6aHtgQvkq0ccZEXywEAe1zXFabhq8sc26mnQhMyUIUBFK755XfzMIfZr9vWMYlcUca8aK9l6sCPtp8gtGO2HNhR2nVNW+KM8y5PRAt0Tuhe/cljk3sf5dhUPsVQGnCt6bSX0DKK3X+CHu8mcDtWNDWrSSqjkMSZLeqM51AOrq9f210FhtsbVOmldMCbvOKnYvkNt+nSyY3VlkSB8Hga+VVBItf8XSr+CVMTOlZSUPcTf+kJDsO+4Io/tzGPy/Ga8gRMPaSdXsD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8ZPteuKXnMCvcc9aLo97gd0lWtGPEbdX+3VRAr4tlI=;
 b=XGgRdcNeRi1JRYYf19n6cV5F6k7eVTu25mRS2sRLcYsnE4cauweexxkJNcbIoqeJMw3jROHoya2sfqKkXn4j68tPOZo6smwjRmuT7yAdahJ4coWKTQK6JPD09eCQTMOF/3pLe2uydaSzUA4JR08FPODcjIh/zoZhCMC+A0zgxfgOeXntU0OZUEFC774TOTRB6phffPW/t9S5nmy5fG4K94NzUJLym+cxMrJkIsDaqgrFVGNPbtAXFutmbm9aa/5umTWgj6uggLy5EKEL2YLvF6m2r71ivUxGoDv1HZg3CjnE9/7YGi/fXcJGM9eDklOJWO2ZQ6ND9UDwavmvBEprzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2af81fe-c227-21c1-8ff0-c1fbc2013eca@suse.com>
Date: Mon, 17 Oct 2022 10:57:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB7991976335ACE7B47A3FCB9792279@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9c82cde3-fe46-3a3c-20c1-70bd99eb28f2@suse.com>
 <AS8PR08MB7991A3DF126C3B68E198AD2792299@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991A3DF126C3B68E198AD2792299@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0301.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 810c0547-d941-4874-39b2-08dab01db2fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7fC1aOVVsQjQDVAJO8Se/K0alT5S8KV30DYKjWerfuXvdzxgWni7kHFLEsxEOAq0p6bYST24JZYj11jNhR013aXT87HqTdie0jtDYLScFSk+/+b4dqIdghfmahhmeK/BF1WGha6Xg+qwoyVr5SgcRRTn39KJWGImUfiufgOElNa7m3HJa37CcW7Y1FQ+utuFFAjnEhAIYDEQDEkKDYkTb2AmDYDdcNJOPWXfLO1d1WSM16EK6VEr9ci+T+1eSiQ0bDhauVE4UQUES3RCE4bjqvLMmKcFFIlD0Rf6N7wq49wHoM4oH+XsvfjQianAuI58DqIpv12XESyR0z4rLL3JG4E5gAHqkyG56671c2wEWAWZoVD+Ui3adC3WXwekL8jshVNGgXI5M+xWhwa4l+JLla314i0J/H+Ha1aP/8plXQADztLqogF13vqGN+tLrP1vMlWCcdpB6J++lZVDkPULhYv1NFOweGAPRLw87yaV+sH1SDvS2rhnYSIaI2kc922XYysON7kVc1sAZbQaZJOj5QelEEP4ZnRFPFUm4gczYtGJM6P9F41jdywI2c+S2KdrCNe0D+Bsc7zmSPDOfIGycGIr5nZgGjC8MLMNwZAe/PXFSIv7sgsTQ+IpGDc0zzvL0RP4gM+ML8uobIAY4O0U5l0san2aVGOICAas5KNNWyDO+2AaFFmvTSkD+/ARfb6szkqBaMuDI/D+eID8GL5PzzNTjD1FY+4U2zU5mDzhoj6WT4FpG7Q4WZATi3YBv6xR+XNP1j7jXzJ5ZW1ubnCCo+/p09aoksnG2vKLH1WqWQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(396003)(366004)(346002)(451199015)(53546011)(478600001)(6486002)(31686004)(186003)(66946007)(66556008)(66476007)(8676002)(4326008)(2616005)(41300700001)(8936002)(5660300002)(6916009)(2906002)(83380400001)(26005)(6666004)(38100700002)(316002)(6512007)(6506007)(31696002)(86362001)(36756003)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXBnRmkwa0FhQU5VK21jZm15SXFCa0pPM1I4NklLRGs0NkZIL3lHWEVvcVBh?=
 =?utf-8?B?WkxKcGMwcnRsRFhCN1JTOXgwcGhDNFFCMVJWVnEyWXIxUjErWkxQUG1EUVpy?=
 =?utf-8?B?Q2VYK0pvZktLQWtmcDZIY3Bpc0JNdmRORW5aTitOWDljcVU5b3RTVW5FYVhV?=
 =?utf-8?B?K0pQaEVtTnZGbjdSU1hmdWRiUnV0UnMwTXNOOGJmM2t0b25KWUxnQlhhelBB?=
 =?utf-8?B?MkJaM3ZOV0owZFZrc1k4YjgxZVJuQkwybUdTTG9KUTl2SzRYS2dnUTR3bENq?=
 =?utf-8?B?eWdmVUNhZXVtTTFZcm9TaDJxNXQ2Q05WN2p0dkJWK09CTUpPV2dIM01mY1JQ?=
 =?utf-8?B?S3dDSDFFelhyZzlYaEZTSkFUMC9OOEFkTFZveHJRNDNtQ2tDQ0Yvb1htb2d2?=
 =?utf-8?B?YW91ZmFEdzdNd3F0MTZmQ1dlS0xJa2JtdHlLQmRNTUFrSFlWclgybXdBZUsr?=
 =?utf-8?B?cloyUHltaXZFOTZLMlNOSkxjOWN6bnN1Z3BueUJrbWtXOEs4bkxyUDIzdXJ6?=
 =?utf-8?B?TjBwT3FJOHRnNFBYUVlkTnc5clVrT0FDMUtpT2w3TjdtY0o0UWhCMCtZVlpj?=
 =?utf-8?B?dkxrWTlTVVc5T05pZU9LNmpiYzlDY0FjR0xRcXg4dWFpSnFqM0xhSi96YUNu?=
 =?utf-8?B?ZUo2L2RQeWNoNzZiT296YmpWTFUzREwzektwNGUzVElqazNiWVRmYmhmUGcw?=
 =?utf-8?B?enlIbERDUTVkU2VkZEw3WXVqQWlVY0Rrc2JlNXc2bXJEbERRSU9nREpReTN4?=
 =?utf-8?B?OWVFeVRCeUxsVnFRMG5nNmZkaGpMN1pUVDhGL0RrNW55aU5KcDRpZjhvUUxT?=
 =?utf-8?B?QWJSVTIrZDhGVnFhSGU3WUplL1MwbkR6MitHRWRCdmIrNS9UUzdJYUhuMTE3?=
 =?utf-8?B?NUtQL2Y3VGlIWm5BdnFkUW85cE9xZWlRRDRDWjRLOWFVUWplOEV2Vmk1cWkw?=
 =?utf-8?B?Vm1GWUNCQ21HN014NmowM0dNM1FWRXlkdllRVE1ITUdVTnFjUEJlYlVNM2hr?=
 =?utf-8?B?T3A5QUNqN292QnJlcW1DeThaTklhelpPMlluWTR2NXNZa2M2dnFLZEl6V3NN?=
 =?utf-8?B?eHpOVXg1OVpuN3RMd094T2hIdHFUOFJMWUFMaWMrK3dxQkRUSmVUQzAxV0d2?=
 =?utf-8?B?UjQwaENPbzNJdC80Umd3bjhEWjg5b1REZE1sd3RYTlg5VmRRcitqOWwvTW42?=
 =?utf-8?B?ZjY2WWVXWCtxczRpRjdXMVZsaXVZTzJTekI5aTVTbnJkS2RzLzBMZHNPcldE?=
 =?utf-8?B?dGdEVXZnQUZYSVNCYW5QUUxPeEVsWDRwOWQwTTRRcldIN1NzMWJCVko3ZjI3?=
 =?utf-8?B?VWZsdm50SHZJMHdOZWdrRTJHeUNVQVJtTXgwbnNpTndFaHhwTlhsNW1hM2V6?=
 =?utf-8?B?elZmMlIzTlFBbGRzbDdoR0V2VlVVRlIrVHNqby9VRDJXV2hHSU4waTRrckQ5?=
 =?utf-8?B?QkJveWVWWlpsMG5HQjM1SVhWbFdPUk5uVElRTWltQS92WWJueWs3R2hON0lu?=
 =?utf-8?B?NHIvb1l6RXMzK0JQaXRtSTVBQjU2Zk05TzYzbjB2azNQQk9seHEyVXk2MnIz?=
 =?utf-8?B?MVFTdUVhMkdKN2pXVVMrSWEvUXRhNEtRdWg5d0cvY3B0anlSWVFMNnA2bXFX?=
 =?utf-8?B?d3ZJZHlxckt4eUtxTldQN3I0b0dzcW1rZ0RZQ1B3WjIyOFMvOGtTbm9RRDU1?=
 =?utf-8?B?cTNnQ3ZrUkZFemJvY25HYWwyZ2RmRUh1TWhTNkJvcC96SFNtTXhoaSsxWWZM?=
 =?utf-8?B?QTMxWFM0K2d4M0NIR2Q2VmdZMXJNK0V5RHg2Ulg4VUh0WEhOM3lGQ2ovSUtF?=
 =?utf-8?B?dGZjNzM2aGl0dUZuSmRVS2dUdmRMbDU3MkNKSDUvMVJJbnBMSzg5MFhxeHg1?=
 =?utf-8?B?ZGM3RWErV1U0aEkxR290clVCM0lPTjlwZU1FMmY4Ulp1bW9wbmpqTmEydzBH?=
 =?utf-8?B?ZmRSdmNqNU5rSkM4TUpFbmhWZjBUZERJQU50MlhnTS95NHowZDBSTWdING5I?=
 =?utf-8?B?NitNbHJpbnFSV09uZHJvWjA1a1RtV0p3QmVKVWQ4UjBrVmhJcE5NdXMzeGcx?=
 =?utf-8?B?Y3ZZMDNPZ1RaL3Rzb3FaNHRwN3lJWnVKQStZZGVEVmxGZXZ1VGgwM29FU2M2?=
 =?utf-8?Q?vFzvBh0G1iMbNSWGjhk/RN+R5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 810c0547-d941-4874-39b2-08dab01db2fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:58:03.1232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsCNdCDKzRj1sRZ0RjZWCchQRS9bv98XblHF38IQfz2KNxv6r6z1kDx/ZTDmTvfwujBlU9yFVbaRP+n4FDpf6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9227

On 17.10.2022 10:43, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>> I added the doc asked in your previous email. Also, I will use a
>>>
>>> ASSERT(p2m_teardown(d, false) == 0);
>>>
>>> in p2m_final_teardown() here.
>>
>> Hopefully this was meant only as an abstract plan, not the exact code
>> you mean to add? ASSERT() expressions generally should not have side
>> effects (which includes function calls).
> 
> Yeah, when I wrote the v3 code I noticed that ASSERT might be limited
> to the CONFIG_DEBUG so in the v3 I switched to BUG_ON which IIUC
> can make sure the function call is valid all the time.

But in the past we still recommended against doing so even with BUG_ON().
More recently Andrew (iirc) has voiced an opinion in the opposite
direction, but I'm not aware of us actually having changed direction in
this regard. Apart from that ASSERT() and BUG_ON() aren't meant to be
freely interchanged - the the respective part of ./CODFING_STYLE.

Jan

