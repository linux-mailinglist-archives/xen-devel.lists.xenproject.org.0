Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6022153B5F1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 11:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340973.566124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwh37-0002oU-2S; Thu, 02 Jun 2022 09:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340973.566124; Thu, 02 Jun 2022 09:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwh36-0002mj-V3; Thu, 02 Jun 2022 09:23:24 +0000
Received: by outflank-mailman (input) for mailman id 340973;
 Thu, 02 Jun 2022 09:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwh36-0002md-9y
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 09:23:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a63aa59e-e255-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 11:23:23 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-BRSUWzCHNpCEEUneJqFEQA-1; Thu, 02 Jun 2022 11:23:21 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0402MB2786.eurprd04.prod.outlook.com (2603:10a6:203:99::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 09:23:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 09:23:19 +0000
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
X-Inumbo-ID: a63aa59e-e255-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654161803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wr7Z/Fosh+oBdriOy2r/m8ovEcSH8S2+SZzmoD/iwG0=;
	b=HPMw43wGYdOBFkSEL8GVKS9byrNk3a2+64jnFLIu+0yRkkUb2Kq1+WpjGablYi6B+Fd+al
	5xMcGEV1H+lP3TxR+5Z0Y3ZsOdBCZ48enRBAzJJmuWY3ZeAeEvQfNSMIQ/FB+f3sTfGxiA
	GWLVup0mFd+95UMhEvYiEOF+ZLjrr88=
X-MC-Unique: BRSUWzCHNpCEEUneJqFEQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5u3u7SJVWdznnUQYViMoluA13O73dCqqnSwh8W+bGG+17zLSAnT3Ou0ipZrLdA1CcjB70F/iY42a60vtmvVXxZL1VcbB3EbXMsJ5cg8sdpeaLkeNfC0N/4kdV6/A47RF9f9Zm8GU/9Q5O3TcSosRzzlRtMBRr9BfsR3wLZLePclcjVJPYFjOfOsHF5iEKKefAp5A032pm49BFytiDHRw0P4U5cLJa8ehbc2IOJkiZlxOaKvBSpXc9OKuENHbVxmolDo8hQb0p6vnsDefdSFmGxCk7GDha0Siqaj/TeUGdCfG8c9SAHFChdiGpemP94wrUkMPiKJQ3wCSziH817NCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wr7Z/Fosh+oBdriOy2r/m8ovEcSH8S2+SZzmoD/iwG0=;
 b=KHHS/itU4KTNVhOClAM961xKhdro2tRZ8dOAWdc1Q2IJXe3sSbZSpk3RUmZVFSxVbgmsnZ85jpfUDaNjPyN9nQPiTEhUoCTRph9j3arJkAxfrd6GZr/14pYJ18zX79VPaQpS2D/1mlfxHRV/RV3MKCpmFWqR9+ca08cFzf1KUDfgq5WHqVhbZBJocSiC26Z7432h9Q/GaPXy3JZXYin4G/muJ6IsHtnZ3yJbe4YIrXnckYb+EvmNy0BjAts0UO1ruxqXoa3zg3SCHqHN9QAkGHY5+7C5eaO2gXT/hehlnq4+1bJfNP4aT7C34Hw30g9rEByizMkMdzvTFjBUbiXG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa7f4bff-654c-a2a9-092d-d48b6bd87525@suse.com>
Date: Thu, 2 Jun 2022 11:23:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220531031241.90374-1-Penny.Zheng@arm.com>
 <20220531031241.90374-3-Penny.Zheng@arm.com>
 <9f0d9d47-236a-d7c5-3498-d8706c616fcd@suse.com>
 <DU2PR08MB7325D759DF37AB836B3C2C79F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB7325D759DF37AB836B3C2C79F7DE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0339.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::31) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1a6e6cd-058e-4405-a0ba-08da4479880c
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2786:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB2786809E6B09199500C7EB3EB3DE9@AM5PR0402MB2786.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+zJn9IEWG1qftDLEf+/hBRdtkOjEWeilsJ2hWZeGDC/IEuKs/sf61yEmePfAGb+3CppRivhyffDMl6cfCE4/AMZzeg6yba4aaqsJByPnZ8v5pdV6rl+7TCtCL3Z+Gr7Z4SOvtFilDeWF+Q6iF6oBQbAzEDbo0fvHwPF+pz3ytPSk+RhA3BXEbSBptYDSaTcfddZV3To7uBg8zr4AB6zRr/6tJa5qFbzsErYIE7fzZWZBcHW2jKCXWXMroEx7hzb4GxFgnMOKrvTs5e97X0Ry8cid+XtRltCJVNdkh/mo72rk5mXJJ4EzEaXcc72/Mu1CIBd2JLBqtaFE4DIkiYdjLmCfPF+CkTNrE1SRfnC9y90ezgHUkJ98kLnIalLIORt1z1ehmGpuwhZ0AsMRaxWlR6OERUzxFqMxwBNlbbuStuapctzMRjxUpi1grtj7QwdaMokaC0QUuDogajh+e2ptDkm1jc5bUm2Vss7DSwx2MDiHdS+7NtMsuBF5OnT/LpfeRTPEnSUmfpV2CeGmvIzPjUWVL7Pl+SRGWYINbxRrCnCrXGiUXIIGc/B/C4rAQPdi8cJ3OnePTQq6rAmLyXlY+ipzJ6lWaCO/WtgO8oP+7Ddk4InfPZJJpXHl6ZnBufv/EFLbFHRF+DbgbevfnBA/OuYxu8eStAdyqcmPP+SEJePcaPvPhpUJSaBVcihf6lraIWGT1j/xLqQKkAJuucoOeV6v7tVrYs/k3ECsGaB94Yr76WuGvgRctqw8zYgz5CLU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(31686004)(4326008)(2906002)(8936002)(7416002)(4744005)(5660300002)(36756003)(8676002)(2616005)(54906003)(53546011)(66556008)(6486002)(6916009)(6506007)(66476007)(26005)(66946007)(6512007)(38100700002)(86362001)(31696002)(508600001)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3lVNDNIdmcvR0trNHk2TmJZbVRDbDFacnhwSnFUSXNmZVU1aS9IK0xTSUVq?=
 =?utf-8?B?VGVtZ3BMRnE2MDgvWHRUalhRTm5MamQzOGZsM0QrclkyTGZTbWxzNUIvSnlJ?=
 =?utf-8?B?YTFxeEtGMnRCenFUOVovVjE1bWNub0R4KzQwQjk1dVVjMjZEL2ZtSEFZY1NL?=
 =?utf-8?B?RnA3NWgvSWd0NVA4amdoOGQrQUpaQWJvTXg2Uy9EZzN4RnZyOWVMWEozRjZF?=
 =?utf-8?B?UXlKMFo1Tkdyb2dGV0lHWEJEN3pJV1h6T3B0eVBCaTJtREw1OW50aXZIWVNh?=
 =?utf-8?B?VTFsaS9Fd3BXL0hBZnRiYzMycmxiN2dsT3YvT25PNUNPc1V1OGJvWDRWK0xo?=
 =?utf-8?B?Z1ExZlZMU3EzN1dtdFB5OEdDakF5SHkza2hwSm1oblhNOTdYQStDRTM5cE14?=
 =?utf-8?B?ekVEK2pGRkE1eTdKM0I4ZWo0Q1pTRU5NcnZQbmVaeTdOanVUd2Jjc1plZU5y?=
 =?utf-8?B?WXgweEp5R0N4NzMybTVFSU1rNUJNZVVBTWFFRVN2SDNHUllhdjIvdUgrKzhi?=
 =?utf-8?B?SitOdnVtWjBiQ1M4NzkwRXpCRkx5NUN2R3kzd1NNTHlEbWc5RHBDWmphVDc0?=
 =?utf-8?B?UTRtb2pabENSY1c2cklmZnhQN0dQK0dMVVZ0NGVkdkhYbGp3bU9OYkVyN2I3?=
 =?utf-8?B?MFlVa0o4dzhsbjJLZmpBbXZQZTVVK1ZGdzhyVWVTWXE5dGpBY3NjV0FtMEEr?=
 =?utf-8?B?QjFjNzJZVFhNZ29LSlQ0Skc4ZmNaYU50bzVDV3JmcDR0clhuUVM2UlczSzR3?=
 =?utf-8?B?cG5OYktFREtTbzNiMHpNWFROTkFsNm5mQWJwQ2xFcnB6WG4rOERmU0puNVpx?=
 =?utf-8?B?RWZIdzkxbjJ3cnRhbG13S3ZnNWQ0S3M4bCtIa1ZBSXhaWHRJeWNDVWtwODVo?=
 =?utf-8?B?d0UyT2FtOXU4cTVGeGMzY29aMFBBK01LMk1yMkdpK2IzSk5QdSsyY0VJbnVV?=
 =?utf-8?B?QWYzZ090RlEwSHNNN0FaR3YyRkE4aGxucVNhYnd4eWdCc29KT3JKc244cXdB?=
 =?utf-8?B?cFRqMW9LTnVoa093YXM3YS84VnJOUVRsVE9yNDBOWTRhWWZIdWU2N3hGaE5x?=
 =?utf-8?B?WUFGNFU2NDVWT3Z6dFhOcW1nL3ZwaUlzSlFtdGVFbkNIeHE1anJmTmhlbEYv?=
 =?utf-8?B?bzRhYUtaMmMwWjAySkMrNkZqU09VenN4djl5ZHFZeEZUZm53V1FEdXBML010?=
 =?utf-8?B?SGZzNGxHd2RzcHBRUmF6ejhsVlZsSjFEdi9qaGsvb0E3bXVncTdvM1MzWEFT?=
 =?utf-8?B?VDZvNHY1K1FPd2M0Z2M2aUl6aTZqWEU3OGw0YWx0RzVTb3MyOTJMMUU5MCtz?=
 =?utf-8?B?NjNBeXNQbVVRZ3V5U01uaHltZURyd0ZjSTM3MFNtQllKdERPQS81SXIzNzBx?=
 =?utf-8?B?N3E2MGtCYnh1SXlMNHUyRTBXbWp4U09WWURFTFl1cUtYajZETkVwQ2tKOVhw?=
 =?utf-8?B?WXNWK2pLL1puWERybFR2N0thTVJoa0ZLSnF4ajhPREExcHJ3LzcvaFlRbFNw?=
 =?utf-8?B?T2IzcXNpL084Y1pUclI5cjVWREFhVWFKSDk0NkQ1dldFUFRUc0haVVh2cWIr?=
 =?utf-8?B?bWxoL0RJWVFGMlg0ODVvZFd0TUVYTjZaZUlJWXBkUGVjVTdEN2Z6blErSERY?=
 =?utf-8?B?cjFqSWQrdlBlWm5GVzQwbUtaN0FRWVAvZThXdXU1akp0UnNhR0V2YndBTW9y?=
 =?utf-8?B?VFdxbGYxczZTNDJFL3laYmJPSXp4RSt1bTc4K0svSkZldkRLNUtrTUZoT3NL?=
 =?utf-8?B?aDR2NEw1eDFsUzcyUWxaT1RaZ0M4OFFjOFdJd0tTZVR6dWRiMkc1TFZnRExR?=
 =?utf-8?B?d2NMREdwM1gxUS8xYnFwR25BTUlLVU9wL0ZFY1k3TVlSTTYraVpSQnBTTWFN?=
 =?utf-8?B?OEMvOENvOUwxckZ0NUlmaHAvK0xDalo5S05BMlkzQ2FCR3J5UFl2RjBjcWhL?=
 =?utf-8?B?eTVFeHNRdmJScHZCRU5ocko3OTFhVmNHSUxtVDZuVlE4TUVsVkpSOFJCaWlq?=
 =?utf-8?B?R2FuaGFKd3lMVG8yemNCV1A3NlF0c3lJVUxNWFgyZk1JNkMzaXp2dTNDZ3Jx?=
 =?utf-8?B?bEtkS1FrdTZ3VzZ3d29RQURkbXFvc2xxa2NHalJWWkV6eG8zdXNxZnNPUEVI?=
 =?utf-8?B?OEtCSFJPR1VYZHR2VnlFNEUvWnM4Zi9rNDhPNk5zajdoQXBucXBubmJYd3RU?=
 =?utf-8?B?M3lvdjNzVXJQaWpSZ0hYTklqVi9saGhEVFBzRjVia2c4THZwd0szeHhKMzRP?=
 =?utf-8?B?TkhxRUg3NWxhT05ydXArbkJidDNzZTJNT242TitJYzlXZ1F3clg0R3hpWExK?=
 =?utf-8?B?VHZqc3QydStkQVhGV0RZRC93WE85VzV0cERHQVNVK3IwMWFZTzZvUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a6e6cd-058e-4405-a0ba-08da4479880c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 09:23:19.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W30dAD0tDU8ID61ayyfvSYs/27Tl19e7cx2d2UGij4FXP70gsfCfe7WniYer0I3eTh76S8Cc00O9233mbJyFQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2786

On 02.06.2022 04:18, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 31, 2022 4:37 PM
>>
>> On 31.05.2022 05:12, Penny Zheng wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -151,10 +151,6 @@
>>>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>>> #endif
>>>
>>> -#ifndef PGC_staticmem
>>> -#define PGC_staticmem 0
>>> -#endif
>>> -
>>
>> Is the moving of this into the header really a necessary part of this change?
>> Afaics the symbol is still only ever used in this one C file.
> 
> Later, in commit "xen/arm: unpopulate memory when domain is static", 
> we will use this flag in xen/arch/arm/include/asm/mm.h

IOW you want to move this change there.

Jan


