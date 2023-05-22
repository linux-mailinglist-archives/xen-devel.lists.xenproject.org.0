Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6970BE97
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537904.837535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14rP-0006lV-Ce; Mon, 22 May 2023 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537904.837535; Mon, 22 May 2023 12:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14rP-0006iu-95; Mon, 22 May 2023 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 537904;
 Mon, 22 May 2023 12:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q14rN-0006in-Q3
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:41:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0959667a-f89e-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 14:41:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 12:41:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 12:41:54 +0000
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
X-Inumbo-ID: 0959667a-f89e-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NURwf9W7lfJBn84thO40Cgg5KgkpO5tPFORTDrB24FzMbPTf4HFH0qyLBhMvgm9bvzOOwjy0lUuYAKo6qNJ0FmAZKbnUZXWq1+VkCEATH5NaWUa17huLbplUi+n8zARPBnJmI19IvszBFY/v8pJYE+V/txUaLFY7EQDdtvW5I9XOnnwhqc/sLXq0csmtONS29fAY5V1e20UQaYj6vZtHp8EsMke9XsMiEtKBCTjba0TEdx0vY4TAUCzU8GXUCXjHI79/szP/x9pi4R8+Wd144eA5Vdr3KU9ZAwgebrl9QDaB3P2jpCmGkLDXpWBIv6oJIPoQB4RZ/OPdkUKfjrZ5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djhZqu2mP+2/iJCck3s6urYbtm0UlkyDVzwDbEbfYNQ=;
 b=UBB2Xhvm5CKsIBT+vVSrvQROlfeKMC5jCNOqYROY9TIvJePpQfFB01S0CB/NGC+DoBFAB6RkjSUsPL/wP4ahWv+sSknUu0gqGYC/XgxHvG9uahXQ/Xr2usQlTQ+BkVeUxwf+odouopgBr6TybFbD/SsweDt0RORH3JO2VCemGtzdasqL2yxSIueIwAounzd2Sla1lDYm00xn2x2cnR7RLaAdHLTIDmt7HKCdf0CvoAM2zdQqeWzxW8Ac5PFf015is7H9239uo7rRSCUvUBCVuHnJoIZ+dVNKtJLSuu9G3SXCpGnPHDIz3y6oRFYVW/7uQHKU8DNkRggAw7ZtHCxEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djhZqu2mP+2/iJCck3s6urYbtm0UlkyDVzwDbEbfYNQ=;
 b=0CDkOLc3lgrRYfqX1vkPMZRvHIU8f/RtlsUNj3XNW7Jd4ljRw+AZdUQE1lUA58nEfwzBgqlKHl0RTPSkpDl/eEUyhydoEow0i4FqUUIZ6DldayfJGGDpR3JiVr4ZR0PrC/5X4v0CmXIfwRSTt4WGSsukcdYgc5YuZKX6Qzphw3t9KNMXj8uzf/1+MUz13BAJ+qvp4nwXzg8As/QCZ7svajwY47jDeS0vBiSsEnETwHyjXpcV8fXcqZ+I+P53tyztvZPdMhsBTMvmFF4mCMP2N9Xj8s8izx1rlIkDEh6k6Tw88nsO8JST+ioHbUqfBL5t/UkQTdzWpKcWi/2047/3YQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2e282a6-8443-2650-dc63-e64b5fb72266@suse.com>
Date: Mon, 22 May 2023 14:41:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
 <779e46a5-a3d0-187a-6d15-e1a12f71278f@xen.org>
 <288F275C-D76F-4E89-B8C6-C8D9AD54D1D9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <288F275C-D76F-4E89-B8C6-C8D9AD54D1D9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f86927-ae9f-4255-9eb3-08db5ac1ec4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bs6a04A4FXZDbMr0e3YqjVHHa8BO45oQRwWOmho1fZHuZZZW00jtmEexW5tN/ZYzFzI4O9ID8gB3f/uzYea4v0YgkghwG173CZ8WmP0LFePEUvdB3u2dOJH2PSqDvKdsgpC9KE0/YE7OLuLX3KD+5G4gCKiIhVaRzntkdhcxOkQfig10ixZoDBzF9wffVp5NSOWxwj81I7/rZCz6rXnWTsU3c23P9tqaLkLT+0cKWDxylhKf7l/3xTo/2EMg/phAanIKhCJEFAuJnhTriJ82qYa6+rdK6bF9NHuL02/e0SAbI9UW+OEzBxznCuzHCB34CCr1SkBVJeSZlwLhzkId9OOPUj6DJ9MsjMmf/QnlVRdbeHr0PiOxGJhY3hhBPpSkU40MKluQ3TSBiwSneVdX6yRJoc//oxvRijuSTTVlfrTBhho7hQ7XJCJUyCyE29yXQQFEmJQv+eK2q4dUjbQFFbj9j9tJAO2UYfIGG6oetSDSUcppw4rhVShZeexW41PG2dmcNQeBg93q43HV6LIde2EaFzrhARsy2KL+xzoNaHvlz+NcwS89SaFp5sworZGbODmxWMFDaX7k76da5lPrUh9YF+cXLhjUuYOOmpf/hx9+oMr4YW4iWBi/qrv8PTOJPu0Mne56Np5on2dZRI1iFQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(346002)(136003)(39860400002)(451199021)(31686004)(4744005)(2906002)(54906003)(478600001)(5660300002)(8676002)(8936002)(41300700001)(316002)(66476007)(66556008)(66946007)(6916009)(36756003)(4326008)(6486002)(53546011)(26005)(6512007)(6506007)(38100700002)(86362001)(2616005)(31696002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWQxL25hc0I3UnhESDM4NENsTTRVOFB2d2VsWWJzZnlDUUpGbUlneXd5RWpx?=
 =?utf-8?B?OWtINFZtMnVtb1gwVTM4V2VKbndxZjZVdW9QVXYzcVB4aDUxaW1NZ3pvWVM4?=
 =?utf-8?B?N2FIQ1lBUUNCcVdSM1F3K2tISEhNTFB2bTkvZTlBOFB4Y3V6K0JQZnNWRlhP?=
 =?utf-8?B?OGpSaExhOFN2bXQrR2tldGtQUlRTalA4Y0VJNEJpK1JjVmNzWmxjV1gvTVVQ?=
 =?utf-8?B?Y3BPdzY4WE9JTHgxSWVNNG45dTdsUXVZOHRDVDF2aVNvVnBkQkdmMjQzSjAv?=
 =?utf-8?B?TTgwejU5alU1Y1lmQ0hZdy9wbGxHeXdZVjhHZUltRkJVZXloM0xlZTJhRC9i?=
 =?utf-8?B?RURlOVJLWENsYVNNZzhWd2FHcjUzTkRPNXUzRFZuL3NaQnRqQ05qZjhsQ0Ny?=
 =?utf-8?B?WjNhTmNuUXNTbkFwY1BvOURQV2w2NmRMelJQaFhYbDhpbDRyc1NtQ2lEOUsr?=
 =?utf-8?B?Ky9zd3hEVVN5Y0duQkxxK0I5OTVLQlQvYjVRRmpoZjlhNmpubXNEbjJpK1Q2?=
 =?utf-8?B?UUdLYWRhN01MMVN0UmFJc0xRenZKV0FvZWVLL3lZd0pqY2FXM3BDRHFhc3Uw?=
 =?utf-8?B?ZXVGcUg5SXpwSmEzMndMcnMrQ3phODQ2MUpnblNkL2cveVZVWURpR2h4RnhB?=
 =?utf-8?B?aGVWRnVrVk5kRk8rOVV3cXpZcHp6dXJhcW4zRVBPMHNHdkpjaFc2VUdXTU9W?=
 =?utf-8?B?blIxNXQ1Q255RHdKaGZuNHhoMklYa1pGdWtJZUo0YTZxNmkrWlVGdnZ2aDA4?=
 =?utf-8?B?KzNMUFI3djJtNk5ZNFNOY1YrajJ5bUQ2Qi9iSWRpVkhwRW1IN0dLc0owMGl3?=
 =?utf-8?B?NFFrSjNPVUN6VHc3M0xhSVY2OE5LbnJLRDE0eXFUeUdNbi9WeUh1YTZJbWlV?=
 =?utf-8?B?OTMwcHJEMkdSK2g1UWdkMzhDNElqME1tK1YrbHM5UmJDUyt2cTBtM3dMQ0Fy?=
 =?utf-8?B?bmFuMFZDV1R3a1ZXMHVjb0NGTnFacE1NTjRLUVZFdnoySU4rdWdUVmhlL096?=
 =?utf-8?B?V3hDRG9FTHExY3JsamJpUFhESi9uNmVxRVZUbzk4VnVPRFFCNWpKdGw4elhM?=
 =?utf-8?B?Z0tiSHBKRzk3MXRNckFCTVNoZzlScVZkK0hpa0JMT29JdTZwdEozS1BGRlp0?=
 =?utf-8?B?dWthMk8yT1lFaHhKMEV1czVQeGVmOHZuZWE5ZEZOa2txcmpVcmx1YWtKajBt?=
 =?utf-8?B?WE1DUUdmaXRsOWpvTi9BZmIyWWRUT1lGQ2pwNE50eGFFRFdiSktNYXE4Zytr?=
 =?utf-8?B?UjV2NmlPS2lTNEl6eWYrcGIvNkpXZXpCNkQ0Nmc1VUxWZWZlZXdFM244NEdQ?=
 =?utf-8?B?Rys1MjE2RmlrK1BXd1E3dXUwSytrdFdQRVl0c1ljT2wrSkxCSVVLb3Y2MDlU?=
 =?utf-8?B?Rmo5VzN0RndJR3oxbERlNEJkNTQydExIT0N2b0lRdDY3a0c0M1kxQ1VUNEdw?=
 =?utf-8?B?SjVIVGJkdWFQRmtqQWNybUZyZDUxbTd3bWkvdG8xWjNGK1NLL0FyUDFQWFhK?=
 =?utf-8?B?cVhPL3dCdEdpQ0pYOWc0dUd1bTBuVGR3UXF4ZDRBeC8wRXJjYU1Qa2xBbVQ1?=
 =?utf-8?B?RVVQVCtPZ2dxQTRmc29JcXRqTUh4TDRITHJvWXVpcVJyMWd6SHc1TDcvUDl3?=
 =?utf-8?B?L2k0TDdDMUtnQlBGMEhpT0doSitnZ2xXekJiRkU3R09IR1Z3anZsTXlDV1Bv?=
 =?utf-8?B?Yzc2UHB4RGR4bUNsa2VFejhuQWFtL241VzNRNFBUM0QvVVZpcVh3S2o0VTJH?=
 =?utf-8?B?QWtyY2trcVpzWkYxU2Y5TUFuUHd5enhhYTFZaUttbDMwRVJXVHBwa2JhQUwr?=
 =?utf-8?B?RFJWRGdyWVRreFUrUGo3VDFTd0tESWgrVUUycEsvVmx5UTVkb1g1azJxY1RJ?=
 =?utf-8?B?aStmVko3YXd4cUtTQUw0NnI0UWloNi9YcWtwNm9sR1lYaDlSWmdQTE9NMllx?=
 =?utf-8?B?RDg3R1d4K0R4NWJNOGtyaTVWZnF1ZGdMN1puWkFjdGpjai9BOTAvTmN1OGdH?=
 =?utf-8?B?MUkvenBzSXBRTzFkaHRZYzFJRTJTcm5reTZTTG1xZjIrTWlzYzNRVjBPcXE2?=
 =?utf-8?B?RDJoUDc3T05nUXJSaC90Z1dsaHd0ZVNMZkJoQU9lbnRTWlM2RkxHYlRkNCtV?=
 =?utf-8?Q?ggaY/VQTxAdPy+/QCHcbekl5Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f86927-ae9f-4255-9eb3-08db5ac1ec4e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 12:41:54.5544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8tEGAgThDUp9T68NoWNo1iiCPMp+g6e26vfAIc3Us+eeDa/Y+pK9MS9lRst3g9e7TdrwsDoIVGzgqVhMKDfSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

On 22.05.2023 12:20, Luca Fancellu wrote:
> 
> 
>> On 18 May 2023, at 19:30, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> One more remark.
>>
>> On 24/04/2023 07:02, Luca Fancellu wrote:
>>>  #else /* !CONFIG_ARM64_SVE */
>>>  @@ -46,6 +50,15 @@ static inline unsigned int get_sys_vl_len(void)
>>>      return 0;
>>>  }
>>>  +static inline int sve_context_init(struct vcpu *v)
>>> +{
>>> +    return 0;
>>
>> The call is protected by is_domain_sve(). So I think we want to return an error just in case someone is calling it outside of its intended use.
> 
> Regarding this one, since it should not be called when SVE is not enabled, are you ok if I’ll do this:
> 
> static inline int sve_context_init(struct vcpu *v)
> {
> ASSERT_UNREACHABLE();
> return 0;
> }

Do you need such a stub in the first place? I.e. can't you arrange for
DCE to take care of unreachable function calls, thus letting you get
away with just an always-visible declaration (and no definition when
!ARM64_SVE)?

Jan

