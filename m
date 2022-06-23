Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36607557E28
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 16:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355055.582492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4O9R-0008Q1-DO; Thu, 23 Jun 2022 14:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355055.582492; Thu, 23 Jun 2022 14:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4O9R-0008O2-9K; Thu, 23 Jun 2022 14:49:45 +0000
Received: by outflank-mailman (input) for mailman id 355055;
 Thu, 23 Jun 2022 14:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4O9P-0008Nt-Gv
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 14:49:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6e7529d-f303-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 16:49:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR0401MB2272.eurprd04.prod.outlook.com (2603:10a6:800:31::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 14:49:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:49:40 +0000
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
X-Inumbo-ID: b6e7529d-f303-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtipWfEHyWgk80d+tsBEzTHLfG6JzEKrhEZKKwtSV1I3xYU7z2bdRHOuedyKYgYODFG3ZO7rabQoYWdS1DGfJYnbQgztozp6lVvfKavZHL+YB/j2eah5VXdmmjAidSDzkue4SYBrl9nirvL3U/OfIVfbqlQo/h3Rv+gXfQzS+Yp2iGr6PlNhV5tpqmJB/DJL6O09ZOL61PTOP6pKCVPEr1ejZgWW+iaCR56v2NT4SfE4sw0PfTwrrwaotMY7CyDNUcxC5JJgmRo3xQ+0+sITBVnF+bjFKe3T4i5K0at71bsY8sZubIiFkNYrifv0AY/sEYPXczSK563JUc6CFQ/IFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emZOfPv2o8SnmYEatwSRAh6YuruhKdKislTpIaOIkMg=;
 b=VMBw645DwAL9ONZyrIAx9TypYQXak7oWUy1X4TsYUE9C+6YMmiMvXSOjb8FXGlGglEerXE7OpNARMiHWI//VSWrogplx0q8OTQNXrcnxXWXhf9K2EXTr/kj55dxT39zaEpwliDvhRl630mVEKNZPUSrABwPV9Hq9ypxGdm03U7AOtoEVg+wYqIrF8uEoWinosgw9dp8N91M5ufDNIEfOXgvN68Ucu/r+qD37jGCtwDbUZn/NAkBlbWzysCNF3umUm08jyAJyOgBuqOSvwNJ+BIul+Sv9CvloDS5ulvoElTDxVDPrYGWlZGbjyqvZAwW99CxebAj5JcGJ1Y3s5JjmNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emZOfPv2o8SnmYEatwSRAh6YuruhKdKislTpIaOIkMg=;
 b=WtQec4oD/m8+2rXB6FAUbInbHcD99fr/w3lZMPnc1ZntlAF0l7Y8RoUktRCEpDLEWik5tMgY5EywV9B6qaFeCTXIVcGfFTIPNOHKYStRUGhvtLnteWBe+cFhoiWfnIYvttMcEKsapO/m2zFe6i7jy+zWn8I97wxwnlFNx06VoZDAvqJzlghlU7ChDHQLcyQMwyvmGYpPJQPBulg9NLhlJ1Uvv7J8ZH6o4YSDBEA+rf7zLzwlJYHLXWpg0E45Wj+G3vYAN7sJ23a0dvTcNFXfzknX4vmmSAPRKgyeMgwwh3/nywShwDH1SC3r/fup05KwzO/mxdMkc1VbjqZ/A+Pcfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <982b76df-fd88-9551-0702-a7f61bac8b1c@suse.com>
Date: Thu, 23 Jun 2022 16:49:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/6] x86/x2apic: use physical destination mode by default
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220623082428.28038-1-roger.pau@citrix.com>
 <20220623082428.28038-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220623082428.28038-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0101CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::46) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d7ce5ff-f2df-4673-4595-08da552799f6
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2272:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2272F199C1786CD02C556076B3B59@VI1PR0401MB2272.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2adYb7VQqqNpDfbnsLBQDYGJDsdu9R7cT3qqQ2vJI9o7a44qJnJ9SBP7QDC9IJI1iFX8TEHwlcYvi/pJrjhKoAx1xG5ORc6QhlajZX64w39ZfQ7cSyz4WPkMy0t5JLGe8VAwHQYwwjmMyre9hGpadWURciJujCQPVWtNqxgZ6gpXjUU8KkbaMPLY0HxacHNU3a9PdDUoJy4X956LSbkCVRDwN1oBVOUnkNDK7ZTLRuOH8S/aLVhTEydE9lmzSrf5FmGMd9/pzMrTMk8JaOaHErQlMaLYOt5Ck4ZL2h8fbr8s7q0mYYGg63HIPXIdvdDQQRDUEhbuKRo6fjL20N7kM11RUhK6hbFocDmGEVl3SfLxCI9ns9SmFezre1fSiKvvpNKVGcrXnJXOnDW54kaaUKiE6Kwn0/puOyr28YWEVmtVW/e+1JvI04jLxlXhN6RrZGjmsg3x8ImuumM113ro69VL3T2rvS231o05+4D8jTcqHVvN7K/8O7jG4cUvmO6r0aO6+EB2IENoyDfclhCWMj1A6T8wme1X919m8QqoDX0VhZboiNjuZu5czqRCoNCa8jF2pWGglF1cqPwjaft9+SFP1eAyat6Y8tM4eYzsLtoNU1kNXU7trmbCQowTCjerxzxTYrlZQZtaQX+zxJkgx1JT+zTzj0bQmvfonQI8N6sUtzgWkpjQL5/GWHqzxsAcHFcAtN/j0mHqWNG2WgFYT7GU7dyjeXpXBzDKEmJKKN/G0t8jtCEWcCAY1+ujvrBJdjbyBKK0iWNIcmUIR7A6Xw7r6psGgTRyp6+Iktqivrs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(346002)(366004)(136003)(86362001)(2906002)(53546011)(6486002)(36756003)(66946007)(31696002)(8936002)(8676002)(478600001)(4326008)(5660300002)(186003)(38100700002)(66476007)(41300700001)(2616005)(6512007)(83380400001)(4744005)(316002)(26005)(66556008)(54906003)(6916009)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZpbjhCYW40OWRMS1QzUUU2bGprSGRjWUxHYlM5Y0xLY2IwQStvV3p5ZzNB?=
 =?utf-8?B?UWdONTU1ODhIckVvQWRyOGNhT2FMdXpDTlBpSWRvUm5OMkh3a0JxMGxkTWtT?=
 =?utf-8?B?ZTZCV3R2UFh3Wmd4L0hCbHh0K3duM05yZDdPelNzeVZib2tFUnhKS2RmYmEv?=
 =?utf-8?B?T3R1Z1F1aTN5Yk52b2Z5VlNvK1hZZGMvWVZ2MjE3d1FRMlRZdFFtQnRlY3Rh?=
 =?utf-8?B?MG9HM3pMYUtZcmROT3EveEVKTDZQdFFGNFRDdGs5YnFDay8yVE82M0FFbWg5?=
 =?utf-8?B?bVRaVHVUMGpneG5DNGJUNnAyem1GY1phNHpYb2NRVlFwRCtLeDFuT0hlMlRx?=
 =?utf-8?B?eWNRM0FxbmVyMUtaaXFYSnY2MzhCRXd2ZmUrcmhNUHpUaXc1U3dramlhSy9S?=
 =?utf-8?B?SWsxbzRZd3ZnL2V1SGt1OWVIenh6bjVTZDZHV3VISEIvakFkUGVTVFE0MjVI?=
 =?utf-8?B?eDVRdHhpZUlzN3VvNCs1Qkw3L1p6YmdvUUQzQjVOV0xRRFJhbUVFQlowVU5y?=
 =?utf-8?B?eUVxR3I2M3NFSFFsRE55SmdOc1JCSHRvUXZ5eHlZcjRweHp2OHZzLy9tV0xk?=
 =?utf-8?B?SURyU3BFVzZHODZGU0dzZy9WZE5KS3ppMEtFaU5yU3NSZi9tUFhvYUdFU1B5?=
 =?utf-8?B?MGRaSElVSEp5K3FwNzVJMHJ6SXFmR2poMnRMZVF2VWxXdElEKzNzb2JJdXJi?=
 =?utf-8?B?V0RxdXAvclZibWlQWWZMZ1VJTmJqdWVEa3hJSmt0czVsTm1rdWdoYU9lSEdx?=
 =?utf-8?B?eGpuazJXT2dQb3VRSTk0Y0tjUE1weVpIZHNZci80RXdwb3ByakQxa1NZeUNO?=
 =?utf-8?B?NnFTQXZLZ1NWdEVXMWYwQWQrZXNRT0gxU0pYbEVyeFZLRS9nalBGUG5lMjQ3?=
 =?utf-8?B?RWRUUWxtdTQvaklLd0thS1RNc2FHZnc4dEI5K3NNRllETnhwUUxrU2FjLy9P?=
 =?utf-8?B?STJXaTI5aXdSRTgrVmdhTDVQVGYreWF2SzYzQnczckZSejZZbUl1d1FXaitk?=
 =?utf-8?B?SHppbUUycDdVaUJVSUUvMlpGczlNQ0YyQStxenFzbGtRU1hkbXJlaU52cElI?=
 =?utf-8?B?SHBaeHNwOUMzS2szajBzZHg3bDN6Q1NyRSt0UFRpRmRxWFRIQnowQnBJV2Q3?=
 =?utf-8?B?WVE5Zy9uZXI1S25HbjZCZnFRMHNuRUR2UEpYY0FLbjA2alJqZXZwK1N3cDNE?=
 =?utf-8?B?QVR1ZzQ3bkxkSDEwK0dqQXBGaFVnTEFXSVZHdWZIUklGM2VvcFBMbEhnZ1dL?=
 =?utf-8?B?cHVHQ2xWZElXOGwybXFGblV3ZGtQVnZOVkJkQnNGWW5kVlpIMldWMm14ZDlU?=
 =?utf-8?B?OTcvUXFkMTljcUFYckZLVTlxNFRPTm9BL2MzTUFMN2dtaGdqVzgxc0tMci9r?=
 =?utf-8?B?VURRRDh6NmdCYUtDbDNacDlFRDFxN09hVldNSjl5RW4rSjNHd3ZwNU8yekg5?=
 =?utf-8?B?clpHWU5Na0ZMQU9OMkxkQnVqdWcrQ3FzZkFuRmFBbzBpYVFldkVzanNycnRS?=
 =?utf-8?B?c002Y1crUTlRYkJBNHNOY0VNeFArZ2V5Ri9tNzhDUkZuS284YTkvUEorWDNQ?=
 =?utf-8?B?dEJSQTVueFdCOWRsZGdFcjVoQU5XMmEzbGRieTNzdFhFa2pkVFVpRmUzVFho?=
 =?utf-8?B?NmpOU0RCdCsyWXkwUm4vR28xS0YvbU9yMmRibXV0Yk15WDI4RjZvdzFrWDl1?=
 =?utf-8?B?QnNLSkdIaW0vcjVNZEgwSmV6SFRCR0IrQ0U5OGdxTDlibnNUUGZUNG9QSVBi?=
 =?utf-8?B?K2NSdlZQd2tVRWl2ajd4UWRxRzlwaUJsTng4dXdWMEYrZmI3eWJobkhtOEI3?=
 =?utf-8?B?cGM4UWdPVHVBNGtIQ1dUYnZjSXR5aWNpekZGUWtlbHJBRlhRZ05IZDc2blVy?=
 =?utf-8?B?cWl1dG1hbzJzcytIdGxkemRYT1NqZjJsbmVSZGdhWEY0RDFESzQ1MnVhU3px?=
 =?utf-8?B?M2NJR1l3L3lLeHdZQlpnNkNMUDEvMml0MjVlNEIrSjY3ajFMalJGUU45KzI4?=
 =?utf-8?B?cFhMcWxWaFhBd2JxU1pUaFJUSGtjdkgxZ0RDbXpsejdsREZiV0N3THhFaHRC?=
 =?utf-8?B?WEh0Q29mbWJEWk4zeTdkU0pLSEZHby81eEVoTEV3RVNLVWlOS2ZNcGN6WFk1?=
 =?utf-8?Q?AYuVlCBhD59jZEyQENswIpw+5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7ce5ff-f2df-4673-4595-08da552799f6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:49:40.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oG1f2RRXnzvkPvuUxrGDNLtygFWHWDu53DVimabf/0mpy+/qjrP248Yd8baxQmgaEIB70PNlhkvOWCgbtecSgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2272

On 23.06.2022 10:24, Roger Pau Monne wrote:
> Using cluster mode by default greatly limits the amount of vectors
> available, as then vector space is shared amongst all the CPUs in the
> logical cluster.
> 
> This can lead to vector shortage issues on boxes with not a huge
> amount of CPUs but with a non-trivial amount of devices, there are
> reports of boxes with 32 CPUs (2 logical clusters, and thus only 414
> dynamic vectors) that run out of vectors and fail to setup interrupts
> for dom0.
> 
> This could be considered as a regression when switching from xAPIC
> mode, as when using xAPIC only physical mode is supported.

When using more than 8 CPUs.

You also don't mention the downside (higher IPI send effort) at all.

Jan

