Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E69F8557EAB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 17:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355078.582525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Opg-0006D1-BX; Thu, 23 Jun 2022 15:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355078.582525; Thu, 23 Jun 2022 15:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Opg-00069z-8j; Thu, 23 Jun 2022 15:33:24 +0000
Received: by outflank-mailman (input) for mailman id 355078;
 Thu, 23 Jun 2022 15:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4Ope-00069t-V7
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 15:33:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60060.outbound.protection.outlook.com [40.107.6.60])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d02bbd96-f309-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 17:33:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 15:33:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 15:33:19 +0000
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
X-Inumbo-ID: d02bbd96-f309-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLjnhns9j6Lvf86XGCq97x/nVvdn3+SvBdbgVDm6DVZxsGTkFqNpEYTHLD3GaFI762u8cqbaqKOIrb1CAM/Ia8kyDDh17MIJ5tx6TZRygVx+RHtNUt1JfS9Rq/EkTsNfAOIhMswvkgHcMgKekrTq5t4HSxbVe2SH3TCulJkSDrV6dPOk5Jap1GZuTLmn2blMqzXv3uhcOcNiB/GF3ykaVjWZDTby7zAbPToAh/ITWlZ0VaqyCSPRuvswYhaDpnJ/JXrsOqI/hPYx5KA+712Pi/uUNL1VFFQdK4GF7cIQ1eWQKY7amt5Ebs8rv6sL6QMQU0tivIvU3+BFrvPZl+0K5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xua5ZNAnhxSZ2eOZX1/N/ffFpV/DP81MabRt9d2asI=;
 b=g9qkvXPl3ZNs2PKa4d7LNWFZBVSOcHaUOHH6aPWQs3KIcl0iVpePWXbI0OxWs9zNKmTqlPx1eV323vxePna3Pf/ZhrcTigwdZsEbKTZ67Xxo4jZA7dLzVI2cfG4IX9IKYnypsXo3tvK/KpclG4LNxV+aWNXx7Pc7k+CRPHS39n9LMgoEeNrweE+ITtJVQriirmp1KI8ChVt6+Ud9EriPriWqlb838iq+ZCuJjHoFNEXZOg9eNFycVgklmQNR2qdIW1JWxSefJDaV1X3oAnx3SjbWOM+wixv46mnWhWkYj9LDG4dOmZL5YAvewTDNdFZFB85KPHTCr8lm6pZKzMW6NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xua5ZNAnhxSZ2eOZX1/N/ffFpV/DP81MabRt9d2asI=;
 b=Vk/ituuHIk1b5jXN6lL1X5daXw+rnBIMAyzQbmN+9azNVc/FMN0tr8ssHnP/NNLulxQNUrUe5U11WAM9j6Oanq+Cm9/VBXFPh9QC5KWX1iRw/ZpLZNa43YKz6lrrinW8ZPknMn6Pf1IfxvPAKcz2SbauJkEITuznaAQulVHLmDz7QMQGave+CwGZ1lIV6ilFnMqrCmZ7nn16dBkVMmNwuZh2bThOih0jAC4i+6lw1mo8du/GtjKtpqcNh8TydzgqQiuXNJQ765ou6aQVxJRnbpPnDpN5ciZ6CQKDiEhBhYNmGsHlMvM5D4ZOUxSoH9SoV3EGrT3cgGMTQcuecGN1ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85802262-887b-1a69-ec5a-6c91a329f231@suse.com>
Date: Thu, 23 Jun 2022 17:33:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0502CA0024.eurprd05.prod.outlook.com
 (2603:10a6:203:91::34) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed246f37-d24e-4d1e-f4e2-08da552db31c
X-MS-TrafficTypeDiagnostic: PAXPR04MB9572:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cE+7y9m3vgrg8buZa7JUyvVmdbWYsogKLQtepOTEJb61n3j2UeVjOaz+2b9jbU6RpiquYkTXfSeNTIe8/s8acRzUFbUt8Eh5C3FcjWcdZZjYyuIItSr2pSbmyH9QMbn1Ud8O9oN3ZVhGgJ4LC1x5EHCIHhulyFmBxngD+7+h7KDItxk/A1j87pyNQDntNvRWnWPGs3IIzhGrQsqtL4+taNQR31Ix4IYVN3ZErS/zkP+3XI/Jb4BPzB5jnH96lSHbiq7qsU4amIV62sMoE+eR2CyuCkBMshUfzaYIs7umFyAj/EcBPS9cIWxoQxVoQMCf7EXFaTe+SicZw1VWWr6uSRMDUon6xfqun+0LYasQS8Lo3IIP/MY9ECSwadxX2IIQwb8OrlCPvrRajMbabc8uZFFPQVK6HMUDzuCXHO+PAPqEBG7imloK1o+S32aKE0zYpDjPtTdwQy96TDDC0xtqkM6vsP9yxd7AfEvwMnRqQw/MhU5ADeGThhiz58e/k6+gUteDGZ/mMU7WxOq2g+4UgjVHj2VrXDNN9hRS0eyHk14I6fRn73H0E5AjL062VuNvmmg7IhYHqe7PITwQcfWAAIRW53HjUBXWG+DRtMPjvZ5fDxem3jiwqKnwnnZEmPuAQYlc5BCSCdL7ww6lpqSFQtmAOILLCu2vhUIazsaDinHsoRsGpGYoPYrqAa4Z5zvmQz05du1FopiU91za6OFG/N+qxP/JUFLHVSpasN70rytbCaXKFA9foaBsHoRx4H/SF+rvJdoVp8r+Rzv4+eHbhRlZpGPdeNfNrF6ii9hhGQ9cgYgFr+ykxWDiPAiU6KLohP/3Ze/q0ItaxD4zZ1TcMgegJ918wZuJS6CVHY3I/uv7Jk4VQEydLkdFrEGCadU7
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(366004)(39860400002)(136003)(41300700001)(31696002)(66476007)(66556008)(6512007)(6506007)(66946007)(6486002)(2616005)(316002)(8936002)(86362001)(53546011)(478600001)(110136005)(26005)(186003)(4744005)(5660300002)(38100700002)(54906003)(8676002)(31686004)(2906002)(83380400001)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVlVSDBiTmpmVXhIeU8rREJGVTNyWE5KSUUxQTd3aFd6eUtqS3M2aXJzVmNL?=
 =?utf-8?B?OWxXam82WHpYNVpOdTlZUmxMV2FYNWtSSm9ETFpVUHJRbnhjRmdEVnM5ZlVX?=
 =?utf-8?B?K1RpUndMZVJ5OUM3MEwxcXorVU5RendjYnFhTERybjF3NzJwbjBpYUtaeXZV?=
 =?utf-8?B?SFlEWkJubEZiOU1Od0NaL1o3VDE0cVdOSk1aczhxZjRzNS84Y2NmZ1BPZjIv?=
 =?utf-8?B?eE9ENThHQTNuKy8ySWRuYXhIdTl1Wi9kUDBKTEdGQXkvWmxUekVuNXhnSDU2?=
 =?utf-8?B?a3JVQTczR05DRXJzRk1jdWw4SUVPTDRaT2pWcG1iL0MwRlpsZDRuUmVsNG9H?=
 =?utf-8?B?dk1DaytZamRlcmNMMjl2Ylp6SXhSOXFMb3dpUVhEQm5hQmJOTUN0YmY1S0dH?=
 =?utf-8?B?S2hCYWxtTnVNRVAxV3VPb1Q5ckptSnVJSklNM3VzSDVxdmZsR3lhRzBxZDRH?=
 =?utf-8?B?Mlh0TjN4NW4zbEdTZlVkek1CLzBpOWdZaVgvVVB0VE1jTWdnL05venhtY3ZX?=
 =?utf-8?B?UDhlRDRHSVdEUFBvdW5MZTFSRWVVeGs1aVc5YU4vMWl0V0dtaEZJZUx6Vmxw?=
 =?utf-8?B?enZkTVpkTG5ocC9HSGZ1NFFRYWNoQ2l5aGVEU3IwVzhldHhQTlNISm5hNGM0?=
 =?utf-8?B?QlhxcnVBS3ZZSjJJU1FiaEpVU0VpRXpRa1RaUlZUYk1XZWJSNFIzSnNQbVdh?=
 =?utf-8?B?bjNvSlZvNnhjRTl1aFdaMGJUNUROUGJVUWF5M2RmRDZPdkN1ZURiYXJHSEVi?=
 =?utf-8?B?Zmg4ZzZOQnVGdm9LU1BhdzV2UXFkZE45Y08yMUtHdHdFdVNKQ05DY1VKV0RL?=
 =?utf-8?B?OTJSV1dWc0YxSWcrZkt3UFlRNGV5ZmVJWWF2NHdBNnRHbUwrTXAxRktYOFZo?=
 =?utf-8?B?R052UW5DSTF1T1pyT3ZFZmxYakRJOFBYNndpSGwyL2pqZHRiVW9qR3kxSkk2?=
 =?utf-8?B?czBXQkw3N1l0a1FuT0V4dkt4QXc1MWNOdnlTOEVITTBQWVR4OFdjTkMyQWZn?=
 =?utf-8?B?eUhHTWFWRFZRODNCd3RkNTFKcjFXdThVMWFQa3dueFZXK3dzcmdYT3pGYWtE?=
 =?utf-8?B?Zkdkb3oxbytUbzZEUElmUHQ4YTVHK2hFOENQYjlZZXBhZmRMOWlFb2xMWE11?=
 =?utf-8?B?amlJS2paM1VPQWtZUm4ybEc2a20vaWRSMnJrUmlKdG91Rm80Ylh0OXlpQVlH?=
 =?utf-8?B?cXRDeGsxRHVVNjFWRXIzTEhuR2V5SHRxMjdGYnZYWmVOaStla1Blb3BCMnVp?=
 =?utf-8?B?NitxeUF4N3paNUJuTFI3Y29OZTRQRTF4ckxhMTljNFdhY1EzL1Jmc1lxcnpX?=
 =?utf-8?B?cTJ5NmxTdndFYkpMTmZkZTlZanJYcUFPOE1xZVFBSUpPZW9tRWVmZUhuUElN?=
 =?utf-8?B?eDBSb1VNYjFoaml4Z01BODFhaFFBSDFvNjIxSjN3UkEzaXB2UDltcEdCVDNN?=
 =?utf-8?B?UXZ1cU8xUWJzZllNTU1jMnF5aUpRUHdUaEpRWkdrWUNrcUs1RzZhNUZHMU1y?=
 =?utf-8?B?ZWszaTRMRjk2b2xUN0sxYlk1Z3RzTnhqb3VidlUvakhVdXNBbjJBWHdBRWlG?=
 =?utf-8?B?OUwrN09WWUZwOEUxTVRwc0RpdEthOHVFY3RaR1QyZm5SRmNlYTdrc2dlWm9X?=
 =?utf-8?B?NWg2N3BDazkvWFhVeFF2Q1YrVXU5TnJQMVF6UXUvaUhmTTdGeFFRQ1NBbmZB?=
 =?utf-8?B?SDBncDFmaHFsNC95OGMvaU5jRkFvM0xIei9CaFZpSEVDNXZtU2VQRDRBQ3J4?=
 =?utf-8?B?Z0ZsMVk3V251L0Fya0Uwcml2Q3ZTSUh5dTFLMkZCUkluSURia0lSVG9FNHFL?=
 =?utf-8?B?MFQ2U0V6TzhsbHljK3RvVFd3c3BTU1dQclZ1K21vRGI1d09uUldFUzcyODZZ?=
 =?utf-8?B?bzIrcjJMVXFlN2ZnSGMwdXRwVHFIRllPdmtnNnN5NVU1Y3lsZlpHam5mUnpq?=
 =?utf-8?B?RkdDUkhReUFMc0pZMWZNTGh2RUtHN28yM1M3QkNiQWZFRG1nZktMSjc1ZVNU?=
 =?utf-8?B?VVVsK2hJZEdYSmlEb1BTMTJOS0M3N2NOeW9wZlBoT3NLY09Wd2c3QWZxK0dr?=
 =?utf-8?B?UXVzM2MwS2VDejZEQWRoam5YWWxUa1dzdFFUV1NGaTBBcWZNaTl6disxdDJL?=
 =?utf-8?Q?kecWCEknuc/TMIS6+CsvUELux?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed246f37-d24e-4d1e-f4e2-08da552db31c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 15:33:19.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G29zRNKKQSwWZxJ+FgYlTHfAkQxhZIYdTBQ9QqqtXBF9XOXES5CrqHqwnjZ3bKuO7+HtmP4kCfnJkMqpzA8Wkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572

On 23.06.2022 17:30, Julien Grall wrote:
> On 23/06/2022 16:10, Rahul Singh wrote:
>>> On 22 Jun 2022, at 4:05 pm, Julien Grall <julien@xen.org> wrote:
>>> On 22/06/2022 15:38, Rahul Singh wrote:
>>>> Guest can request the Xen to close the event channels. Ignore the
>>>> request from guest to close the static channels as static event channels
>>>> should not be closed.
>>>
>>> Why do you want to prevent the guest to close static ports? The problem I can see is...
>>
>> As a static event channel should be available during the lifetime of the guest we want to prevent
>> the guest to close the static ports.
> I don't think it is Xen job to prevent a guest to close a static port. 
> If the guest decide to do it, then it will just break itself and not Xen.

+1, fwiw.

Jan

