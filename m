Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0633797079
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 09:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597147.931343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9Fw-0002rn-7H; Thu, 07 Sep 2023 07:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597147.931343; Thu, 07 Sep 2023 07:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qe9Fw-0002oX-3P; Thu, 07 Sep 2023 07:16:48 +0000
Received: by outflank-mailman (input) for mailman id 597147;
 Thu, 07 Sep 2023 07:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qe9Fu-0002oR-JI
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 07:16:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80538e57-4d4e-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 09:16:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7845.eurprd04.prod.outlook.com (2603:10a6:20b:2a7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 07:16:43 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 07:16:43 +0000
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
X-Inumbo-ID: 80538e57-4d4e-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhJoSvRejnNt7iJux86xp6H0QL3RruOuQ2zgeoPD5p4QmX7EpOUDgvPcwcmFN3TZcm7JfvEpOIdUlNZD64dGCE6aqaOtFDzHgpwsFjTciyJGMgo7XuSVvbQJJGDCie81OgpiKHGXvxgssDfNh9kvOMhcSrvRrp8ZcKZnA6V4AIS9gP4kDCeUaDkxCQJM5xozdKfEPIINnC7t9MgRw4YEoBvc+ZUUwqHuOJ+Q4lhRwnm/OpcKG+IxQtly0EIWM99vAQGMEDpcmWdm4muMASlUaC3B3z7LRz9rXmjHWizJ11iqHjgqYB4GASIg8HFvSqEdCdkQRp1F+Q54+8HrwW1/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DsZEZu+AZNitLWa6iSL/W7yS/DoCZcADpdvWGV5A6g=;
 b=GeIhqBDn9ESF/qMyVNAoH/grZW+5u0/Go5fGQN7DrTANfKD2ijz2Af6klpXk+sDzSasHzcuDXhR6v9p/5fQtufXmpomSD7mo2qZqetuUbR+J936RvrKBlsjX9l6MADgbFLuX5USK+kOm02H9Vr4wofD22wHou4tl4ngnPGxXkKDEXycPfEzoXE1zb85blPjtFMkMAtdKEue6V2KVsnZw2ZHV0yUz7VuR9j8V6UDHfGfgZaIQqn7xPAt5cR/m0punncLetxywCcFR86iKjYAkeKfoVMYiR+8uuAZyhNaLBx5inFu+sx6xnD+jwzYH2dltBO6psLlu5LSgM1ayKxfeAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DsZEZu+AZNitLWa6iSL/W7yS/DoCZcADpdvWGV5A6g=;
 b=ZLksdXqy47zRzyzO2upuy/lD8LDCqESlQMBiDVG2qiT7Cvfuhm8qdxlwoefEk1Kb+J/6QlYhEkWJTf0yyTj0QytXiNZG+S19d5Fa2DDxcmiQ9qfr68sh/YDsk1S0V+Tm6ge2TBnQQtQga0cwMug3cAcMPP8UUh7q/LJzyvC14rFGGAG+7iEtq9M5gySFKEOZE58W2K2UXs4zMwKzVj/Sryex5xUr1Vto0MOZTLvxfCOGwaYPBEoawHZ80jqKVCS9rmeh2cxwyooc6e/sWMtg5xjZhXdL93Y22PbibcdnCuRyxEnPrvcUglc9cZAZtxxtOOEOFh/lmxD0dW0l0+TYSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e4b73e89-68af-92ee-c5c0-0ec756b3d28d@suse.com>
Date: Thu, 7 Sep 2023 09:16:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH v2 1/2] xen: apply deviation for Rule 8.4 (asm-only
 definitions)
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1693998375.git.nicola.vetrini@bugseng.com>
 <ef301ab9843d810a389f175bd8a204f362b58e27.1693998375.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2309061808050.6458@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061808050.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 210e1d76-6322-42aa-1459-08dbaf726387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F8jH1DwEr8ZvA6CrHwAh/7sl8pFyBdrHz1emoIGa9p0TPJgCz7QHiPFSZJ/3GVIe4jjP1i93LQfNygIY5ua6vomKp/KCVqcoEIMx5i/nYZn2Cuz+qv6WmEDcMiVr5DDuyffBkslydqiMYz6ThvrfaUqFTaAPPHLJGw5nMbBwsDu8HsyLlpNsa+Iqxd0WmlV810SNtOj7fNTyQHT2YcLrbTQUdJU+dP/w6g/xx/++9YkBq7R9jdBT+wTUXXQISCKcePaOuqaKIK7DnTMPnlXukPRLJtdDLgnVhG+XtG+Rmu9jS69b4XX49gNgMIMBLgXZJMe+82yytKV7DIgTDnunG1p4Dxr5p6ySchUqCk5aQRP+RVl8eEVBZ7HG1qhMRJDlrrCFxFNQ7v+QpsQkmASX+/4czS0krPV8eT71JyhZdyCxfTWKO7iDmmiIW6rR/oW8fAKNM/ZuwHxCRJZKlWZW2LxHzIV6CzDTgmKJ0X8I4wMb2GgqCJmpvN7RZ9e7zZoyLrcYourxaaEPCcEs0uKXfW3yhwM58QNGi28N/sMxZgUBx6Xsyy1N2tfKhdRISKXy/7rEODrkkUv5Y7TsTcXOkQrpLxxSWZdahA2TpqXJFsEwcw7w9srUO8tZyFMXKNiealFaA8Ucxziv27mDqlCNiQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(1800799009)(186009)(451199024)(4744005)(2906002)(7416002)(6486002)(6506007)(53546011)(6916009)(66556008)(66946007)(66476007)(5660300002)(316002)(26005)(478600001)(8936002)(6512007)(2616005)(8676002)(4326008)(41300700001)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW9HRXZma3kvdGsvVit2bys4L2t4UmpyQU5uRUpVUUFteWNMYSsxUU5EU2ND?=
 =?utf-8?B?WSs2WHJzd1BvQXV0dncrSmlFVDVFWFBxYW9jUktPa2huSksvNWZrTDh5TWdB?=
 =?utf-8?B?U0tBNndEcjN6aUNJVy8zVW9pOE5pWXdmb0VqVUY0eGUwZlB5TE10bjJicXVO?=
 =?utf-8?B?QXBBc1I2elRDbThKSEVlZExibUlGYnUzU1VoV254VHpQbFNtdmkvWnBPY2Ev?=
 =?utf-8?B?T0FYaG1raGVabVVWZmtDVVQwYU8wYXJSQWNOWUt1MlZMLzRYdEJGeTJwK1g2?=
 =?utf-8?B?UGU2NWNHRVlOR2taSmMydE9rZ0lHVXlWVi9CNmllYW9jWEN5NUxHa2psWElY?=
 =?utf-8?B?VTNRVWRMMVZmajQwdGdVWUxWNU56eUFBTnZJMWhkTnBMeEhGd1JkbGJEMDdJ?=
 =?utf-8?B?c1NOMVhDRjhwa3RsN2V6bzg0dTZaL0JXbXVQRW1lblpra0RydEVmVDZ5WjNT?=
 =?utf-8?B?MGRSTDFpVm9lQUhEKzFvZEh4L0krc3pZLytyRXRJZjhvSjExT1RoNXJxMkFy?=
 =?utf-8?B?RjRlUkk1TnBjUzJmRWxFQzZCbmNZZlFpbE8zQ1lRVEYwMUp1bjRrL3lFRi9I?=
 =?utf-8?B?YVEyWGFCalFFa0tuaEJlZjk1RFJzQitrL0JOS0lYNHNDWGViMlViUHBkRWRS?=
 =?utf-8?B?WkljS1owOVkxbTMrS2FXTDhhK1FSb0FOdGZTOUl4QVNXaDFMQ0gwWjBseGI4?=
 =?utf-8?B?ekg0U293bUpCLzV6Y3kzL2IvZ1VudTJoeTFCS084czlsQ3A2RnBxUVc0Ukho?=
 =?utf-8?B?N3EwK3RsNktzRVZ4ZFMzdWwwdzFWdmhEemFXQm1zb0x5TUJrd3A1ZWlkN2N4?=
 =?utf-8?B?TGNNQzBDZm0ybUF3L1lBd0gzdzJacHNPWll4cllzSTAvUnlCS2xXUDhnSEdB?=
 =?utf-8?B?cERUM0xaSU5ZTFNVTEZoRjFmMHZqWm5nQ0dHSVZ4MW9PU1I3SnlTNE0xRlpV?=
 =?utf-8?B?WEkzdTNyUUlDbjk3S055SlJKWG0ybHMzUWI5WmlDWFd6SFNFdXFoNGhZaVFK?=
 =?utf-8?B?azVmR1hob0hLRGRmSDhhcUNSK2F0NlI2MGtNelY0Mk5wdThoQU9RU1h4VVF2?=
 =?utf-8?B?M0FlNWM1LzVPdU1hclJLMTVxbnBqYTZmN0N2UVRsblg5LzFtVlhYbm9IREhU?=
 =?utf-8?B?QTM3Qjg1Rm5XR1pTeENUc3Q2WUJ1amluc3dhR21IaGttZkJmVzdUV3pQcFly?=
 =?utf-8?B?K0hIMHNkY0s3RjRTbGk3K0xCdS9pWEk0K1E2dWRRRVhqWWt4Q3pqQ2xwNHpI?=
 =?utf-8?B?NU4yTlByWUYrVFJBVEsvM0RvNmcrWU1FajZXa0dtK3BnMlU4THJRc2dibTRz?=
 =?utf-8?B?QWNwKzlhZmJPcUhrT3c5SDloekF2WEphSlBRbzArS3hKdit5bkVpYTVUWkdY?=
 =?utf-8?B?Uy8veGlub3lNOFhGS3dsVG1CSlg1ZE5YVDhyWU8rNzBZazM4M0tSZEp3L3p6?=
 =?utf-8?B?OGFzWUlmWDZPY0VDTDVKUklkYUJxM28vbHo3YW1WMEN0S1hPZUNacmw1U0po?=
 =?utf-8?B?cU9VY0ZFcm13eG9BeFN0TVdZck8xeTBoTEtvSjgvVDE1VHNFQkpzQnR3aEtH?=
 =?utf-8?B?M1ZqY0I1Y2xVWjdFOXZ6R0d5U0xGRklTUy8xYXJVQnZIQ1pVWXBiZEdPMHZa?=
 =?utf-8?B?MFVPdklOZzdqTEVuNWFUcVlHd3RLM3B3eU85U2JKWDE2VlA5bU1ScEpUazVK?=
 =?utf-8?B?Zk1wekUvdGRjRmZvSGcvM09lUjRDZU9VS2tWYzNDcXk5aHFiaW80NWF5cGJP?=
 =?utf-8?B?cVF0aTRlazFKNXFoTEZPUk8xdnk4T1d1SDBvN05GWURyM3FXYldEakRaUytE?=
 =?utf-8?B?VFJDdlZQUi92TnZIWWNJRENGand3b2RGR2MwRnpXeTV6RDdGUHlldUJLamFh?=
 =?utf-8?B?SWlhVGF4U0drM3VLaGJSTnlGdndvWmE1ZitFeG9RYnV2elJ1SGF5V3JWQXdV?=
 =?utf-8?B?UHpsZFZCd245VTJ5MVl3NDBPVDZaN3EyaEE3QmIva2RJZ0taTjBpb3lvdVdE?=
 =?utf-8?B?akhxck1rQWRCUDA3QnZRV0RCVGI1ckFubVladC9sbXY1cElVM1ZhZ2ZmcEpw?=
 =?utf-8?B?enl0TTVFYzFHVEJLa1pMNHlSNXdrZGRCZ20zbHIrNDJEYmc2b2ZCWHJwakxC?=
 =?utf-8?Q?U7hUpY/F0zxTkLl/tVEvdYHc7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210e1d76-6322-42aa-1459-08dbaf726387
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 07:16:43.4994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wde6NC6ISq2hfMhn5gSGJXNlZ9I1W1r3v2eBm1fBDEIgTDkzjw0VhnaEioRXUjZgjFbOP2RmK1/4dGHMBjMqmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7845

On 07.09.2023 03:08, Stefano Stabellini wrote:
> On Wed, 6 Sep 2023, Nicola Vetrini wrote:
>> As stated in 'docs/misra/rules.rst' the functions that are used only by
>> asm modules do not need to conform to MISRA C:2012 Rule 8.4.
>> The deviations are carried out with a SAF comment.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> This is better
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



