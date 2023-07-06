Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9372B7496B7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559689.874928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJfT-000069-BA; Thu, 06 Jul 2023 07:44:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559689.874928; Thu, 06 Jul 2023 07:44:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJfT-0008Vc-8H; Thu, 06 Jul 2023 07:44:47 +0000
Received: by outflank-mailman (input) for mailman id 559689;
 Thu, 06 Jul 2023 07:44:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJfS-0008VU-I7
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:44:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9bea118-1bd0-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 09:44:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9872.eurprd04.prod.outlook.com (2603:10a6:10:4dc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:44:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:44:43 +0000
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
X-Inumbo-ID: f9bea118-1bd0-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzYgK0RWFwHgfK3UEKHQmkzk0s6y1NyPn8To0ukvFO7cRNtX2ucJlUbidMsKw1YU6iY/uBVJjVCM6Pp2DYTFA6G5aGUMYIEcIvTOXv0TgoD0immQINRN2IMxm9fPsy6nM5m5zTJLzIgqGw6WZ7wk5gWFrqBO9mfCaR2cia3p5PD4OkJBQBW/n1TuI9sVpz0lUnnrERpdi+Z+lDlcXohWIFX85fE6CNJgpbRMf1REE1YZcdREAZfq0BALp7+XSYe66Edrsf3DPR+roHEsFtkWMCpaHYSj9VoLYuaASGnXjKtyjQmMZS+ESTdCeOHLFTsV3XnX5WMkuWsVoc4QiI85hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yXmY6+CsqTU3qyr4W0Ux2LYOOUkhbvGRdVHPpU1xQo=;
 b=jjUIgKrQbRNWLxHVfpDCuPGezeys1lbaI0bxJEQPrTbqXGiUi4VbpDXaUmw+3xaPZ4KBLkTdt8V6OD7yNPOlxPx44xKPs5oV5tALo3Rgl8RZKDXmsMVvSJpZv7jVr0bUuNHaFu52fY3yXQkx/llzFLhIdF56bc6tsRskjUCKp3mkxlY+Lv2JE1mQjmEjwAkrbkA+gc/p+S1UxzPYt6rOEMqi0jcODi7fK+MHYAD7KchXdL66R2Ury3b37zjw4llNit9YCKBDpL5vL23kzxvPrk3LXwfHKd86C3Y3k5MZwUxptJPX/3Dmph7NRL03GI/m5W5hl6qmCPsw8RLePW/yzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yXmY6+CsqTU3qyr4W0Ux2LYOOUkhbvGRdVHPpU1xQo=;
 b=A0tJhzLazO7iQpt8YKQmUk3HoskTqINpM+qCRbGZsAZsXS8RmBSyHedmLbivtjqXOJlda2w+NDtJ1dSHdLszGUVaq7uWfQwwcBCyKT2kjyfmPaBbyVgcD8oozwIHRDD3+py3A5ZjrTY9a378GyJnaDQh/s89tjbAzJKzZzNoMRMhAK3LJyGamFhRkuyAL3I5ifKxuqdyrQoI2H8c2HTz+VEepCh2RhBLlI6ybA5mQNveZ9OZsfrRpku7bvJnm5TJX8oDzpcv/c5CKm0AmURwQiuytv1igqp6EX4rvq/78CuEfJ/uwZWqP+BtN0hyL3oFMnMzraj63YD82sgQjWwyUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a7bcb8cc-2353-0a35-fe33-0339c25d6002@suse.com>
Date: Thu, 6 Jul 2023 09:44:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 01/13] x86/cpufreq: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <7df9377d4cb218dd54646c2cb1b70327c8b44c96.1688559115.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2307051628500.761183@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2307051628500.761183@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: 96758612-0c30-4952-1b8a-08db7df4dcd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e9V/RF38RgqJRnuZB9bRuMx85VhK+etWSctYZBoNBqwoN70+/srztZ8HeHesywQcqKGpN4LbKzn42IH9JC2tQnjqcupzay1AQRn86c86thtu0qWrosviuRItoKiopK52eDWf4wmAjyW4SOdRn5oRIQWnjtg2OBlORia8UyTUk1AnCkq9DGHX2AGWOWacWpDfXviIfkXkhKfGmLm4kY41WS1dDGpMMmqoSWFrsvmcU4lYFexwHQ1sipCOoHcYgWs89Vr0OW2e+Yxi7IJzIoCTr4q2A1VgOwgHqVk+BErd9/Gp1qaCMdFvcXkSellUfeQ/Fqvj/0CyIu9AnBLqLEQr7ioZAq4sTyrg0GRcxgCNI020JTGX3FPF9E6dE/pSXSq2h7SSpxyi9Mm2RDigYMw6uo2d8ID1KMe/Eq7Z6Dex59XZf16fnVbcxnDcENCU10NLco4lmn9XT9dIcyReFnNyqR/jkdxiIfIl4A8Mo8geNcUYViPkLhsw4YRlBfzWJvkCj+8siSK7jZcJ1wkjR1osi1aei4I6KMMqmfvXnmekHCFl0VPHi6jyfB5iLQP4ofQQ7GfkqRo1f4p7MKAKBFRuvd44W5a55Mbh27RCgXO8zsBSo4dy0nZLR+bFMrnG9b/2P8cyoJH1+n492i5BimiqqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(4744005)(41300700001)(2906002)(5660300002)(7416002)(8676002)(8936002)(36756003)(31696002)(86362001)(31686004)(2616005)(478600001)(66476007)(54906003)(53546011)(26005)(6506007)(6512007)(186003)(6916009)(4326008)(66946007)(66556008)(83380400001)(316002)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkZNL1N6M3BUNWVIekZDQ0UvKzMzbWZIaEtubk85OER4emYyVmFKc3hDUUc1?=
 =?utf-8?B?Z0owM09vSmkzbEVVKy84cmtDejVWSzJrem04aFNOVE8vRVl5YXk4ZXM0c0NH?=
 =?utf-8?B?elBUYWJjUGFTUmhLRTloSnRPVUExdUwrNklpSm1WVzlBMFJ0b1BNU0J6NWxF?=
 =?utf-8?B?RlVtVU5kQWMwazI1VHVkUi9pT0VwM0U4QTUybDFEZ3dNWVM2VCs0VE9nSDcx?=
 =?utf-8?B?cGxiTksxc1lua3AweUZOUXgvL0Z4WlRocDFuVThQRXhTN3ZGTDUwOGlqeFNO?=
 =?utf-8?B?c2ZhM3ZDTm9OU08xN3h1MXJhZEI0Rzl5M0twcThFVTZnK2FVTjdyZlNjdnli?=
 =?utf-8?B?bUljVzZ0R3F1cXdMSFNSaHpLbjF3UEJJYkVCYmxHdHpzMWFqb040L3BJUHp5?=
 =?utf-8?B?TTd0a0M5MXJaRnMxa0R6aHBjU21zREVXMXZMaURHalJzSHRQM1llajZhWThX?=
 =?utf-8?B?M29VL2Y2ZWJ0ZGJWN1RMVTl1dGNhWGF2Vjltb3QxTFh1N1VkREMzRVFxVTBs?=
 =?utf-8?B?QWxCZzFlMzB3R2ZUK2hxVnVmdTJWT2NSMDRMRGhUQ0Y5MmZMQS9MOUszTk5t?=
 =?utf-8?B?Ti9rS0pLSmxoUXkzaGN6TkY3a1F6UFJjZ1dZMEl3STBNTFA4UWQyQXFLQ28r?=
 =?utf-8?B?eTBiUmhnUGVkNkQ2VXcyK29iWnE4cU5aRVBCWWNKZElRTnQrT21QUUNRRmNH?=
 =?utf-8?B?bGdMS2VzTlIxOWNLQnE2R29VOU5hVEpjWDhxQm02SWpRQkhjYUhZby92eGxu?=
 =?utf-8?B?YytmYjFqUUE5bU01THFxcVhsLzJLSmRXM3J6cFhBWG9GNndaa2VFNTJaVlBz?=
 =?utf-8?B?S3JrMDRHL1o0NGVESzk5MzJsQWZ3a1pKU2pCb0h2S2ROMjQyUHlBNjAvQ0NR?=
 =?utf-8?B?MHh2cGFSS3NBN2x1U0xXUWlwWjF3VWxZVnBTQ2hMVGlmSWd6YWxpSFBZb1dv?=
 =?utf-8?B?OEJBZHhQdS9TTHJIUWRQS3IxWWJyaW04dHREZnpxVlQ1c05GK1gxZXkybzlo?=
 =?utf-8?B?NnEwTEVYR21XV0hvWkNmSkxIaHhUaUFBLzNKRER3NW93aHNmU050RTR5Wldl?=
 =?utf-8?B?bXRFWm5BQzJNT2Y5cCsyOEp2RnJzb2dtTjZWM2dId1JIMTB4TGhiS1RYYTU2?=
 =?utf-8?B?QmRZOGZrcldwcFBuV0lkQ0ZjZGtxK3pWSFZXeHd0cWVhK2ZnUGZTdUQ2MjQy?=
 =?utf-8?B?OXA5c2FBdW40NXg3empTN3dnR05tbGxkSlVtWitDZ3FlN0Z1ZFJrTmROaTFl?=
 =?utf-8?B?UUFsWHlCWFlYYjBjZ05kSkFLNXRHV0pRU2Qxd0xHMnpyRW9WOWo2cU94YXFo?=
 =?utf-8?B?Z042QnVhY04yMFliTnRhR3VLb3c0SndpU1VYTGI0OFJ6cmtGU1lYZElXMnBp?=
 =?utf-8?B?WE1QWnpacGVtMythSmtoQlVPbG1QTmZiaGtPR0dMVlFHWTJSRW9Fa2hLajlQ?=
 =?utf-8?B?YVkzM2hvTldWOFpkbTlkRHBXWVlpbThBV21Lc0hNSjdNQnBWOGpDYVA5N1VH?=
 =?utf-8?B?dEtjUHp2M2JQOElqWUNhRlpHL2lKVSs4bGp4WWFWRE5JYjRuWlF5bFgrbGZh?=
 =?utf-8?B?RU4rMjA3U2hJMm1OWkRLL0pnNWpPRjFqOXZ0b1FmMVFUcUMrWS9wRnlRdCtP?=
 =?utf-8?B?Y1MzZm9LVkw4eFQzdXZxQ3NEejZrdWlTOTA3eW1CT3FwanZGTndYTHVnb09L?=
 =?utf-8?B?bWY4QmJCVWVLMU9SQ1pRdys2SjRNcXNQWCtyTTloaFlGN3B3M1d0OG5KMmdC?=
 =?utf-8?B?SlF6YzROcjJ0ejkyckxKSnovakp4Sm5UMWJtQXJveFJESGhISmc5NlNnd0Vt?=
 =?utf-8?B?K3lXeXBmM3J6N2J5eTg4STR0czg2T3laMmhIbWUxdk81aHNzeWZGVjZOcVRn?=
 =?utf-8?B?QkpYamlXRkd0dURhY01aUVl5L0I2bFBBZWk1bWJ0c0pOcXlnMUdJVWthS3hT?=
 =?utf-8?B?ZXVKWi9yMGw0RDB2VFE0TFFEeVRTcXpaM3gvMmhBQ2hEN3l1ZGJxS1FwUkZ6?=
 =?utf-8?B?UkJpL0NXMi9IUDBmU29hQmJmSFRvNm9XaW83OFArTGlSKzZwaWtWQ2tNSUUz?=
 =?utf-8?B?bFV6R0Q2ZmZMRXMxdmIvR2EzUzdud2pIWnVFNy8vNTN4dzZoUnozNGNRMVZ4?=
 =?utf-8?Q?kRPyDoSJXj/BwPZB6AR6vJU72?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96758612-0c30-4952-1b8a-08db7df4dcd2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:44:43.5392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu1aLpzeSpZG5//3X+Mjc4PeaCBZj/B3sZugG53/zAu+wD+fNlVZeIp9vM8Bf0eb676C27y+JCb+tKrY4IHqhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9872

On 06.07.2023 01:29, Stefano Stabellini wrote:
> On Wed, 5 Jul 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>> headline states:
>> "A 'u' or 'U' suffix shall be applied to all integer constants
>> that are represented in an unsigned type".
>>
>> Add the 'U' suffix to integers literals with unsigned type and also to other
>> literals used in the same contexts or near violations, when their positive
>> nature is immediately clear. The latter changes are done for the sake of
>> uniformity.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



