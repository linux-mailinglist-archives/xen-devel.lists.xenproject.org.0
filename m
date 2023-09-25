Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9764B7AD047
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 08:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607611.945855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfCV-0002rJ-21; Mon, 25 Sep 2023 06:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607611.945855; Mon, 25 Sep 2023 06:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfCU-0002oL-Uo; Mon, 25 Sep 2023 06:36:10 +0000
Received: by outflank-mailman (input) for mailman id 607611;
 Mon, 25 Sep 2023 06:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkfCT-0002mk-1P
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 06:36:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce6747b7-5b6d-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 08:36:07 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Mon, 25 Sep
 2023 06:36:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:36:04 +0000
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
X-Inumbo-ID: ce6747b7-5b6d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYR6Bprfjcl6AOVupJwNDQbj4Qc0Kxk4en6a686oeR9/HdtAw8B9EmOUKgUMNMzpUopv8+14x/EWvzm2/KTu3Zb0mCs4SSMF1AxmguUshR/6MvH7LpBthD/SPZlUoBIgZEQI16rbbeIe8MN/2/FhuFzUNgKGYkzwbZvuyEoKSA4BSApJmDeswjGntNp6Tc6Tioe32bM8XPm3sY/6N7nwKJSJUoH5kaE3LwIdCGxD4svl2iG+KpELjUb7fhG73oF4LPYB6vGIBxENQKfO2khvV+iykRo/3Xkfzr47rwWD4CmPSY9HQBB8Gz3e02lgwcTsUN3sBY2PHsZQNiAroJZD9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQomtzQbK00H5H+GzTSAUPk7lzMsqZjfUsBIcCjI7es=;
 b=YGHqc4j38lC5vIO49tpt8EmyGsiuLsClY+p2olkk/ReuC1RYWUbfJQ78GkZVsGnTFnoLUYYXYrmjdBO/ZTQ+GcPZuYFQdJI4775QL78GJ9wqLDsuTK/tpOeCKKTjfM9IvURTERWQn3vRiWJwAygArRc2XvivVid6D9D3ev94+GhQmKnO+EIw7RQ2vW3ke1l38Fsjto0J2nUwcGejnB9jQ2n9ymZGTGGm0zLgdWPa04KIlPhZaWQTZC3V/E4Pfqi0EqqZG7FU40CtGSCykaEuuNSD9DSKmbAGdWKS+vUlVzCHMqUfRdE64tPB98Cxz+Xy0swz+wY41v3ftmnIa6nakQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQomtzQbK00H5H+GzTSAUPk7lzMsqZjfUsBIcCjI7es=;
 b=HUXJLGqmY+jv9p+k0x87kTPDfo0pIxliS5FzTZTu/ngKUXNkN7sMwupl8sdcgbFcZvkScreC/nxnHsrfCbEluY5N2PDt/5z4hdM/bbQcJENwUbCvZe9NhZuGww/rBMhvzeqq+yqFgcvS+xb/slAHPixjQnkwXBbDliUT0xWLCS5Nu773w4enLaxV4BemvvxLlmXyCUBIdzqDmuyuXPF1fOYi7tD+of/LqlezBVABmOZx0xhdOdD7uRfgf4D20adB+5QMixaLlkbuBB6Ua1XyFszvoavI39E+dARFX/AJAHPKMSOx6otYtmUunNPmRT08j6/JflZAqoLtjHO6YCXGqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b0296908-5081-5d34-8487-b8293eee97ca@suse.com>
Date: Mon, 25 Sep 2023 08:36:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 4/4] pdx: Add CONFIG_PDX_COMPRESSION as a common
 Kconfig option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Henry Wang <Henry.Wang@arm.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20230808130220.27891-1-alejandro.vallejo@cloud.com>
 <20230808130220.27891-5-alejandro.vallejo@cloud.com>
 <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d462f419-4cd2-53c4-7694-b43b7fa68d88@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: f6ba1136-fb0e-477a-cc7c-08dbbd91b145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pONWIcRnGhjud4cSMwOURfQjE0UMh+noU1ZB7n1JO78xaDJQtlDh+jxBmHp0eyShMTB970tf6RuPX4keQ0t6FW2f8p6nSf7e8PPAiTgDQFGiSgUXufQAACOQo5NZ38YWB91GFm3VyVlyZbJbkFEnh3YDYwSQR3YaRvnpHZmZndgUZU+qvn7FTJMx5aV3yLHb00dn6V2eRkEijK+anTYpI6MXjX/nRFMgv6WEUnaiggHVowop6wtlBZRsLR1dy+BnjxjUHIkO53PnEU6+DTF7fzEgZj3YpgAcS+MW3CKn1Il1tZcOW91IBMUYZClQ+YKs3zaUsiT+1pBPLsqxNBE2xqhyhtHYEVyJRXOBbHTGYNdYa2QKwV9LwLheAhs3oebiPscrvNiO+mOEpFWq6rSGaKtAViZ8F5u/dnzH7LEl8qxYNw5eY7i66K/ro59GMqY53RovVYNjoJZmUn2bbiluFf70pONJp/HMEEW/EvyNWiuHDqVn2SZL4tb+MAH1h/aPX9cayyzey1APOCctvVlKbRog+dVPnaQm8+Sb2tvu62c3j1wMb4G+d6ifMpfXo7d/QpnNHrUkOavJVMgfVMSsp+6oBF4M60r7970Hvlm9qCX4xA3LBpypC7tNznjK50CX9IWKZt4Fxk+a2clgzsLjqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39850400004)(230922051799003)(186009)(1800799009)(451199024)(31686004)(26005)(53546011)(8676002)(2906002)(41300700001)(7416002)(8936002)(5660300002)(6916009)(36756003)(4744005)(86362001)(316002)(4326008)(54906003)(31696002)(478600001)(6486002)(38100700002)(6506007)(66946007)(66476007)(6512007)(66556008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckw1M0EwTjlYNnNVV1M4VU1XVVRmdzlmeVRhck5LVzlKSlhZWHFuemtrMTJn?=
 =?utf-8?B?Uy9UcEFmZEh0YW55aW9LQTg0ODVRNFBCNDB3OXNJWHB3K1FVU2Z1Q0s0QVNk?=
 =?utf-8?B?TUlKSUlmZDRyMjJTSXN3Ym5CZ041V29QWURwVEtxZXZJdWhUNFJWV3hTVGQ5?=
 =?utf-8?B?ampZbjVFa045TkhwU3dIS1BHR3N0MTVHODdFcXNHUm14SDczb25CUG9aQ0ly?=
 =?utf-8?B?K2Z6U2pYVHFHQW9RRWROdnFnb1hSazNlZFRicnN5VnI3YUY1ZE5lNFFvb0hP?=
 =?utf-8?B?b3gwc2x1QkZ5RnJEN1VjWVgzTVNsSlhBZGNpQXROTTBTWGdwS2hIbjJhVytI?=
 =?utf-8?B?aW9kekJ6ZzF2UzFyaTVUa2Y4NjF6em92Ni85Nldlb2Z6akZzOWp0NHBrTUlS?=
 =?utf-8?B?TGVlNXlnT2hHRzFpZGxOa2M0V3ZTUUJJN0F4aUlmcWd4Qjdtb0QwVTgvZ0RZ?=
 =?utf-8?B?Q2JieWEvSmhYa2lTNWw2NlNwSEhFbFQrUVI2dTRjZGFGVy81S2lwN29NNWFp?=
 =?utf-8?B?WmZCQlNBWFZRS1ovdWxlNTZjMTNPVmpnMk1MS3VSc0RWTkk0V0wxdExqNHRD?=
 =?utf-8?B?ZnBkNEFQTm90TmhGQTNYc3lFcnZSTVdySi9RVExQNjNYQnRzRzVJQVlDbUZW?=
 =?utf-8?B?UkZqZkJrenVnN29FcEFUWUZubER3YVUzNE9KM3l5S3NLNjNPQlVENzR2WnZI?=
 =?utf-8?B?Z1Zja3Z5dFRiQUo5aTVXTlhEcWU0V3ExcnY2SEJsR2MvRTQrOXNaWlEwMVpi?=
 =?utf-8?B?eXJWTlJnS254L1hkYmZXaVlqUzE2aDdUTmZROWFxeUF0bEk0SS92NGZ2R21s?=
 =?utf-8?B?TXpSTTlEQm14Y1pFS2VFMHpTWEtNSEtwdE5HaGtJTE80bllLRStINFcvbGox?=
 =?utf-8?B?b3hZcExvSXdjUjQySVI1UDhvbWJTSXdVdnFCQWpaczIvQ0hlK0I0ZkVxSGlS?=
 =?utf-8?B?ZnBUekhQMUtZTmdtVytJdzlIVW9rYzNoRm1oYURsR0RrdlpUbk1nbWFRamFF?=
 =?utf-8?B?VFprNWRDNE9DRFI3T2EwMGRlSEdHTmpRVjc0ODgwWVNsS3oxalFWWjY5S05H?=
 =?utf-8?B?dnNZVldhU1UwWElCZTE1VWliT0RWdGZ5Qm85V25IeEN6bys3dGFaWWNGcnQ0?=
 =?utf-8?B?bXNSUFp6N2l4TDN6MWFIUTlFRXJWSkM5anUrcGdvQ0k2cFVuYmgvNTdZa1k4?=
 =?utf-8?B?YThqblg1L3hob0hDTWh5dFB5U0p0VCtIam5yT2lYZGg0aVlwVVoxTUVxc2tt?=
 =?utf-8?B?b3BYdU1EZWRGeGRnMUJsNnkwdkJybitwejBsRnRxYjZ2S1owSUl2UmRpZ1Bz?=
 =?utf-8?B?TFpuTGNyQkQ1VndiSlhrd2NEZmtLaCsvbThtMmppV3hjcHRnU3J0VHFWTUgy?=
 =?utf-8?B?WjQwR0JBRzZLVmd2eThNUDBOLytqYUhpZEdtQkhiQVhLQWlSZlZlQ21mY2Iy?=
 =?utf-8?B?Z0t6cE5hYkRDRXRwMEl0Uk1WeEkwK2h2b09sTEIzcW5yVDVqVnVGOE5HWUov?=
 =?utf-8?B?ZkdvNXI3dmhGOHY1SmFRZ1J6bW13cXZBemhrMmExT0V2dEdITmNNQWdNVzlF?=
 =?utf-8?B?Y0VHNDdiRzFSdDQvUHRRMUI2QjA3T2ZqbVBwUk9raVhVckhPc1lteUtCNVdo?=
 =?utf-8?B?cnA4bmZQUUw2N3Uya2lDUzY3UHUyd2luTTJQcmpsWGxlWmF3Mysybll5SjRB?=
 =?utf-8?B?TVMrOS9nMjV2QmpmQ2RheEljNGtUWGFEME0yOXpxWDFveUdDRkJUY0htS0xN?=
 =?utf-8?B?c1laZUJ2Vm5iU2pxL0E5ZXQrcjQ3akFtRXQybUluamM2bkRkVXVYcUNYRTlu?=
 =?utf-8?B?SVZjeVlWY3k0K1NCTDhkR3UrdEpYRHdLTm1JOEhnSzhTcVVQb3hMb1pYU0Ru?=
 =?utf-8?B?UWRxNVUrUHE2T0RET2hFUVVoYlhHZ1JrQlhkcWNZQWRBYjg5UTZ3c1lzQUxu?=
 =?utf-8?B?aDhNb21tcHIxMkVyMDIrYjVwbk8xa2tMUWtHSUYrKzhzZkp0SVRXTmxJT0Ux?=
 =?utf-8?B?cEVqUDVQdFhkR1dRbzhHVy9teVMzTnlaNVhnazFqbFg0WkxJVm9Sdm5MTzhP?=
 =?utf-8?B?WFRwQlFiK2VwZlFGMk56V0RzdlZITnBrZ2Y4N29iOUNzQks5U01UM0wvNGlU?=
 =?utf-8?Q?XrUQjUWmlikzjE2b8gsgYlIra?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6ba1136-fb0e-477a-cc7c-08dbbd91b145
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:36:04.6391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xMEr22FZILWkfdNH236Z4eLluTlgSnIT9+9BHcNvKjrksFD+WKmwFwhgkyEdLuSUqzFpAR1uAmatalUp4l078g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 22.09.2023 22:03, Andrew Cooper wrote:
> On 08/08/2023 2:02 pm, Alejandro Vallejo wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -23,6 +23,16 @@ config GRANT_TABLE
>>  
>>  	  If unsure, say Y.
>>  
>> +config PDX_COMPRESSION
>> +	bool "PDX (Page inDeX) compression support" if EXPERT
> 
> This still needs hiding on x86.  The minimal hack for 4.18 is "if EXPERT
> && !X86".

If you insist on complete hiding and I insist on allowing it to be used by
people who want to play with exotic hardware, then this won't go anywhere.
I think I've come far enough with accepting a compromise, and so I think
it's your turn now to also take a step from your original position.

Jan

