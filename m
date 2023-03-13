Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EDD6B7272
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 10:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509205.784537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbeQI-00028P-Rl; Mon, 13 Mar 2023 09:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509205.784537; Mon, 13 Mar 2023 09:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbeQI-00025m-OK; Mon, 13 Mar 2023 09:24:54 +0000
Received: by outflank-mailman (input) for mailman id 509205;
 Mon, 13 Mar 2023 09:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbeQH-00025g-DE
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 09:24:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8acf90a-c180-11ed-87f5-c1b5be75604c;
 Mon, 13 Mar 2023 10:24:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7834.eurprd04.prod.outlook.com (2603:10a6:10:1ee::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 09:24:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 09:24:49 +0000
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
X-Inumbo-ID: e8acf90a-c180-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drQoVJnJDZf5PMMmUL9rmvoVh+9fYyPhFd/2wrnfafzWSGZDnIpyTvejkdNBnm7fTVrbO++19DqgnCn5bp0mmJ5fadQN/k2pChUV3u/dXihzZNIZadrcNUPuFfnP8Cf1ugp57AblsgoWzVAqpAutn3YbKdVQGL/Hr974rNSFGkhZKd9ul3vZ1GDnuYMOjfvShHKriD8eTwmePX2O5vH+ietBy+n38UNX699X+uG0in7RHSMammd37f3t1RMKHYZXNpoiEqMbNaZ4uAiCSd4QlMgDKO3WVTa1slz2yvBbleTxKsQ5+eLgH4aJRqtf7uGu9xUi0rGjswpkrQW4Hc2xQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAlsi9OTOeO3VzzdG9/7M+XJ6zFixM46BZFjiesUaKY=;
 b=hx42XIVknXj9v1SDRBmaxdAP9/fNcIph/cHsR2/rj8nPGf5PdnNiYlGos6b65SzFdMFOCv5Lz+PuYmrpwzPsSEf0KXPLp3May/lw13yYoEb0QZq2Qw34kdDv8USAUJRriT895vBBiUrM3x6CRwZDqwkp4OETPZloQ0JXotPIbIkoKh+RD2Z7sLsVZ3ia4xEMCR5czEDVRj2joc3VvJRCDBl+K+sHvZiwklSgqK7xYgULIJeW4EVrVq7TNDBhm8v00C/ENAmYuc97dyeJsHkj5bmUoUxWz3v3NcEEs5rQh0iTSv0WChEMvuB72dhS9vXcEALYRGxuzlvRX1GwfFeDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAlsi9OTOeO3VzzdG9/7M+XJ6zFixM46BZFjiesUaKY=;
 b=BvsiW9uoJ3TC8sCPXWUo38HPvB5D0Xo7PwR0QyuGgiFHpWuct3KS5GhehBn8yRgUyHkSdIE5pUdReDLV+wbmvNDt0ya7+K77kq0H1MKFAHT0+Nlr+B3aRdsNf97q0mxEOa2Iv8+H51wLDqJbicoobJ0mMv+qIAmKjWu6aVWs04V/JAexT5Chb2E244W/D2EJ20Js/BuAV93f06/3QnRgSNsuB/v6jXO33lsgo+nyyQnelvfA6qlb7T9O29IopBZmqI51eB1N+AI9ZcFwY74pV/+4bvUtvqLweQ84gre/KGgTcK8x4iXFW9thEB6F/1BJqL3E+PLBpYSIAqUCD3KQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1dc583f-8fdc-48d3-3c13-05be261db62e@suse.com>
Date: Mon, 13 Mar 2023 10:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] x86/spec-ctrl: Enumerations for DDP controls
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230310160238.1321765-1-andrew.cooper3@citrix.com>
 <20230310160238.1321765-3-andrew.cooper3@citrix.com>
 <e0463968-22ff-b2de-c878-63526b981de8@suse.com>
In-Reply-To: <e0463968-22ff-b2de-c878-63526b981de8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8dc87d-58fe-492b-18dd-08db23a4cadc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uokdqv9urFq5MPVH4MBZmKrI8L4X0wrct7nsFMIF48XgYeUIZpi5D4+7QhVwYI4DJoPK7hWwNxB+6MXFCG2O3oyKQ8k1843guUS5EqofgedVHdVjXyFBKr4ODnAztprwONc0/cedn2dltzrFjHdPRw5kTwVOzbX4wlgebJKS17k1Wj73jov66ylKUWhYWtcWr/bRHEkQ41hCsFXbusPJn/iRv9orBIhkSnmZnK1+1QAf/4fwqAr7S+RwpFocfVCu/ZCV3fVHFRIxXwpdAXjRmOIhSzXC8C/HkLf1HndZlkn6UoQA4ifsylVZjPlJUzGFe7t7JZgSXjtN6TMP68t/2RRuRlC+E/MMhVc6lHmkp9qM3qF5uURAAkjDl6dldASSr2JijpoaC+X0FcUY/I1ovYIm+fEh6IiXBcTshMGsntiObkwRG3WP55SO9XpysJtS6VTUBdRcoqlNYRHtsytafs7awU7XEplAkeP6MIyfMNhh/D/9KOYlkmIs+OmZtG7bJnT727AUb3Z1RCdczzea553MFZ7IBmezIvpEXyUbwLk0mNXv+QzsCTCeAeNG81hsHqFjGWYrzn6jtgJSgc6WnGpKqKdZLfOMbWzRnL3cu4svE0KGZdLGuLVyccurdQFyxHeJDK3TWxdLZ8jMqvnjm42SHtLcPw5S4hJLADulujBoKgGFaomh1Znu2Mrmy2tAbFEVID66sJ+9cMdNpjGMy7EAJXBoRu2RawM1pTalHT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(396003)(366004)(376002)(136003)(451199018)(86362001)(41300700001)(36756003)(8676002)(6916009)(4326008)(38100700002)(66476007)(66556008)(66946007)(2906002)(8936002)(5660300002)(31696002)(31686004)(26005)(6506007)(6512007)(6486002)(2616005)(53546011)(186003)(83380400001)(316002)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUUveDI2aWUrK0E3UWdkejJwZDFiUGlOdFdjL2Z6c1RsaXFxZWpWVEpRR2JJ?=
 =?utf-8?B?dm5UbGhCVnQram1iVTJ1Y1UwY1gySTZEbkhYcERKVVplRVNrNTlJalBGS1dz?=
 =?utf-8?B?aDZLeER2R2l3UGpGUXVhNmhNdEduU1orYWlTSVV1QmRvN3lVb0V5TE1uOElF?=
 =?utf-8?B?QS9GVDBLaS9OQit0bThYZEc1NncxNTlqMk1xLzRsMXpsaXg3UG53aE03dmF2?=
 =?utf-8?B?T05LZHN1N1ExVEk3SGNwTGZrKzNBVFkxdXozajJkaU1IWFBlT2ZxcHZMUHN6?=
 =?utf-8?B?SmNqbXNZRzU0eENRVUc3dHBmZWpySEtLVXVJdEtaYU5hN3MxaW9udmVOT3F5?=
 =?utf-8?B?OEJ4NnJxZ2M4WStJTVJKK01RVkRTeitTWWdwZnJtdnVPY3c3cEFQV0x2ei82?=
 =?utf-8?B?d3ltcTd0dU9pRW5kMEZCTk5zb2hHNTFkcHpaeTg4R1kvY3hDZVY0cUcwTXNx?=
 =?utf-8?B?blMyb2hEVjhOU2tIajFHZ3JYV3B2endIN3dNTlIrUzRqaXh0RlY2N1JTTWta?=
 =?utf-8?B?UUNLWlBweW5YRkFoTjE1NWRKVytlUGo4WGE5ek5DZFlYVk5yNU4xbHVkNFZP?=
 =?utf-8?B?R0ErRGxHYXZsK2ZITXN6enVFWmJ1bUpHWGtOcEdjdnZpTkh0VThNRE92OVZG?=
 =?utf-8?B?dWhRai83RXU4MDRqb3hQRjZNd0t6M0ZxWGRiRWxNVy9ndk1yVDJQdS8vV3pO?=
 =?utf-8?B?RkJYNVNENkdvTmtVQ1U4anFZcU9na3p5eFdXSnhPZzJEWlpCdnhOSzlYVVpm?=
 =?utf-8?B?Nnk1MjRyMk5mSkl2eXN2OWVCQnJ2TTN4eCs5ODZrNHVjbHFlL0ViaktYS2Z1?=
 =?utf-8?B?Mm5MNnVVL2h4TWUvVlhWTmpuSzlYWmFEaHpBd0h2ZVpZdDA0WCtmc1daWHkr?=
 =?utf-8?B?TmI1Q2tscjJxVnMrWlYxWHJLQ3NuczBVUmI5RjZuMzhDS2cwd0VCMm0wb1Qz?=
 =?utf-8?B?dUpYSE9TQktCdXpZdEVIYlJDTnpjc2VhZHFhMmxsRXdlcFdKbGVLNmZkMnNH?=
 =?utf-8?B?cFFpSG5PMk1sNjZWOEFNejhjeUVBdzZ6S2RGVkRNZXRCTC9kakpsTEh6U1h5?=
 =?utf-8?B?dHdOaEZEM3pTMFBlN1Rtd3QrRWpTcDdSc3QrYXZCN0Z1MDgyaGJOWUMzUzh3?=
 =?utf-8?B?czkvN3NPUStDdTV6WThMVTVWMk5FZTZYY2J2SHp6elJmZmFQdFhlVjI3MDZR?=
 =?utf-8?B?TDVGalB1eCtJUXhOMmF3UEYrbk5ybGd5b1lqMERuYXgzNzMzcnJQWTlMcG8v?=
 =?utf-8?B?cHhnbk12VVMyQnhjdEd3eVgyVTZodVREVlhYV05xSG5jWlNUczRkd0g1S3pP?=
 =?utf-8?B?dWhxS2UydDYxN1dxbFkzMEp0c0Q1dUNPWFg5OGhDM2Nid1JHUVFZaHdDUEtQ?=
 =?utf-8?B?ZTZqSlpwamd3MHpRTEViMFNiZEpseUpCZXRGRnI4SGE1bStrOUZCelVmRGRi?=
 =?utf-8?B?eTlaU21wUTdrM0plRE5tWEIyRkRBVXdmUTA5TnVRZ1pnejlra2FDZmEzL3dE?=
 =?utf-8?B?YVpuV20wRGNrNGU3WjNJc0R2dVYrOVBKMDdySGNXdlg1a1pXUUJoaC9wVUpr?=
 =?utf-8?B?NDVFdXhGcHp5Q3lOTXFkT0tYK1JPdmdLVENpV0lYY0JFeURlUUtpQ2IydTFm?=
 =?utf-8?B?NGY4TTVQdU9HZkJ5OStqNmd6aFd4N0FRM3NaNDIrWVNGajloUmxYd1lmWjJx?=
 =?utf-8?B?RkhpcXY5ejY4d21vWitCTHlpa0hKZHFxNkxsOHhObGZRUUlrbUdpQXdReVhD?=
 =?utf-8?B?b2RUSmdQMmw5TjJIcjBTUWJpc0ltOGZ6bmhqWG9JR3c5RlRBTUVNcEVDR1Bz?=
 =?utf-8?B?VkN2d21Dc0gzQk1qTHRCSFlPem9pQk44bkFUaUJld1V5N2Urckl5UzJJWkxR?=
 =?utf-8?B?bnNwcE1UVjJ2TWQvZ1hpb3RXNzRtMTBzNG5VWHlsV01nenVOTmtWdG5GS1FW?=
 =?utf-8?B?Z3V4L3plUTFFZCs4NUJTTGJtVXF4aHp5TmdoeVpYaENTc01WZURqMVJVdUNP?=
 =?utf-8?B?aE5mYzJUNmFxYnFEMmtvSEdWNFowWXpJVmtBUjhZS0tCZXJ1VnRYamhkWFZ6?=
 =?utf-8?B?UWIzYnA3OURPMkV3STZPTjdIUGh0QlVWYkV3dngrc0pkZTd0SERLVlAwdEt5?=
 =?utf-8?Q?8CTaqFsmc6qAWtq79QWrWb524?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8dc87d-58fe-492b-18dd-08db23a4cadc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 09:24:49.1837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXdpN+eV5r+hwd6D3AcQedp30piQNeJukdsAuhpol+FUd7yaGdPGFY8CEpyKV0CkxpOsqH7uwwAFqwbgaj6oQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

On 13.03.2023 10:21, Jan Beulich wrote:
> On 10.03.2023 17:02, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -41,6 +41,7 @@
>>  #define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
>>  #define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
>>  #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
>> +#define  SPEC_CTRL_DDPU_D                   (_AC(1, ULL) <<  8)
> 
> The doc calls this DDPD_U - typo, or do you happen to know that the doc has
> it the wrong way round (and is going to be fixed)?

Actually ...

>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -295,6 +295,7 @@ XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
>>  XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
>>  XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
>>  XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
>> +XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDPU_U */

... here you have even two 'U' in the comment, when one of them wants to
be 'D'.

Jan

