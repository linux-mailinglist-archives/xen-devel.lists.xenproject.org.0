Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358586CDC8B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:28:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516293.800192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWmY-0001y0-I0; Wed, 29 Mar 2023 14:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516293.800192; Wed, 29 Mar 2023 14:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWmY-0001vX-Eu; Wed, 29 Mar 2023 14:28:10 +0000
Received: by outflank-mailman (input) for mailman id 516293;
 Wed, 29 Mar 2023 14:28:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phWmW-0001vQ-Jg
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:28:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0610.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec28eb4e-ce3d-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 16:28:07 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 14:28:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 14:28:05 +0000
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
X-Inumbo-ID: ec28eb4e-ce3d-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KEzkIKRQO3DyVTyWTDtsUIrYXFzFoFLsAZSTligLxQlkeer45kmpuorlTMYVlqZBlsFtyh9/3T2TmTuBXCRLkDvNScm0OQndUTPurOyuWfPIhw8NAm6ie2gpEEakrGb/CaukIVzId1fw3cZNTN/eqj+mlGscdgjvaAhhPLHKdSDgBYb5gkCTKbwdKhObs2ubvAavQUFTX56QMAZkkBO6otxM57s/6/tTAy1a7t7hja+inaFPkfsiAHAWRXLYjG0sNIAdGBQeFM8w1/9ivLnt6LAmn109wP/gC/uHDyguuDyS9Lz90qraOpge5NXWevRXwWX/q6osZBNinMWVRWr+Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEFc+1aSD0VmI3gjzogVrPnLxrn5weTFYkL6yLR7CBA=;
 b=hjdYpsTmRrrcKKGh6ZHCixJv75L64kD0MgMgBY3ebA2k2ghp7o8ud7SKxaLHg2R1rFT+GcDL0Kt4VOEQWQhRkfYSimmPz/15HPSZcZ6XqK96Xf7JPhrprcvtA8c/Bw8jzSFXULVINekqs5kZMh5kEH7n0bmxfUALffsPNZUMzzCO9XrcDGgLp8P+48zUJdBjwPFOD4PwVe1/FxyYVgYr6jxRuN4jET6c6fDDv/Qs8/1oe2JkjXRjbCfmq8guDzmEB6sAChsYfX4qthA9d0qew8el6aA21PK0c2picud01bz7Sff/59hKv/Ql5ag/3dflSJeRCmqn4x/wfyrHUgicWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEFc+1aSD0VmI3gjzogVrPnLxrn5weTFYkL6yLR7CBA=;
 b=j1IhigNUsPPXfcDB1vaEKvHHI5HejXsDo4wldAzMrJnSbcgN67Y1ZNe6YbjzDk+2Cu+redjdsfOx1TehmHKz1KzyMRSvY0JUt2f5d/qfdtW/m+UKCHtYF1eeRRmzCSGndl3vV3te4Xjg7mKaL4lBrAEdL8gX3dWX6A6cTTdV1Yn5wo7Cj3UAsjuv4+xbGm3P9XLYhepJhGKhc1VHDwzXs46OgAwsdJRKFkPmAYwKLb5i9gLgrw0UAuGXl2etrt93veC39PqVeKOLkJHhieza7f2fJkdrfUMIKE3KdmuOyXVzFmxu+eVGHvVRpzo7u4nrZdLBTy7TpThxXQAPQIcmiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9b29b4a-6d41-5434-191a-1db9e2335954@suse.com>
Date: Wed, 29 Mar 2023 16:28:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vpci/msix: restore PBA access length and alignment
 restrictions
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20230329101810.84726-1-roger.pau@citrix.com>
 <77d0a652-89f1-af15-0a45-0bf28a826b15@suse.com>
 <ZCRJFkaF/ueQEmcC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCRJFkaF/ueQEmcC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e4359e-66f9-4b41-0d2b-08db3061cf95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DUsSaseYt/Qge0/n5YNpNLa/iqfpPZfU55pOlCtpgZeHu6VlBvAwYL829L4QXeWiurT/Jg3bhoCqkpiMSpNtkVihieJfLG3sF1JsxDPkhX94YQkKjYOtpyfESSwHl6Ol9NuSjJTlKPnsJh3e2FCFjNsXMCKPFHcNbErKorkkjz4SyQk7aQDhE/hnDlVJzLAhsuTYwtW2jJ9Zc2YgKtEKSfN1rM0qlyGajYJMC5rGmEyWPPS/JDy8Jg5Y0AI+3h0K9oNP51LR4mkFis+ZdzvNeBwvGnCzdmPYBBZyUKvDRQrAtmVGXGdy4fiPfG2J5IUqMArrReN+br1pBZFWN5serJbH+Nia9eESLmH4TjiDOPw0NO/xjdn3nDzX1RmZklB+k7XfqNQLBxmbN1enPe0A7EmWTcfg1Rx+Y6gM0YZruHaabsH3LXMmo6R8usN01rAa0ZaTO0hwxbhohjp66dAscV2EAyDCqtALQ67tgOJKq/ss/XoPVpD2NBOZlguih0ctPjYwKP1bbFu3xnBuIWzeY550odQkOm/9FmjyzvPwQdqvsJSWrApkZgz80/oZNq64tu4AR/62SxfSJwDRg/5l6NlnAVDaXAfE9xzGP1ImGzuNHlUaUUjqZgde6fr26yTzO1uOZXjqk0zGSEF8pT7Izg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(83380400001)(31686004)(26005)(53546011)(8676002)(478600001)(316002)(6506007)(36756003)(66556008)(66476007)(66946007)(86362001)(31696002)(6916009)(4326008)(41300700001)(6512007)(6486002)(38100700002)(8936002)(5660300002)(2906002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UU5JK0Zxa0g0R0NHSVQzWmNRWlpPb1lqWFhoUkdXU3ZPV0c5Y1dCajBmczZH?=
 =?utf-8?B?QlVFT0xsRzZ4WFhKb0dVekpORFFUZGVTZ1h4T01BbEROdkNSbitxNWtIS0FM?=
 =?utf-8?B?QjZpdHd2QWViUEc5VTZqZkJtcm4zRUhaeDRKajl2bW14cHpqYnhzVUkvNWhj?=
 =?utf-8?B?Rk93a2ZSNmpGc3FmeVovQ0xOQ3VFMDZJZmhpUVNOcnltN1BJSGw0THlsOFBk?=
 =?utf-8?B?YXZNc2JRekRPc0RYOTh4eVY4U3Q0VjhvVGk4YnMrRGFwVEpJNG5lTU9nVHFj?=
 =?utf-8?B?R3VKeEVsMkpScytjN2FIV3hDMEkxSmorOXVDQWw4MWkybjg0bnVLOVlybklR?=
 =?utf-8?B?VmVmNWhtSS9JNXFCVmo0cDc1U0w5VzBta3lvK1ovb1R4ME16QjVHTVpHa0F2?=
 =?utf-8?B?MW1XWnBDV2k4SkUzUmZoWkcxZTBNNWZ0SDI5N1hUakhKeFUyelpXR0cxdGg1?=
 =?utf-8?B?NlRIVDl2dGpOTHJ4dmZraHdCVnNlbGFoazJQTCtxMktzMXJIdnFWYXhYVU5M?=
 =?utf-8?B?alZnQStNSjh4cmZqcUtuM0Q5aVZCT2xMWlhSdzUvQkJ5TkpkcWZUT2N3UjVl?=
 =?utf-8?B?Q2R3enUyVGplMnN5UGdPKzk2ZEcvRmdvNHFCaVdad0VBaEpGSEp5TTdDTmI5?=
 =?utf-8?B?QkM5MlZGQkg5dk96bngwR3FyaXhnUElIQzZpeXlXSmFsdW5ZSnJuYTMrZE5Y?=
 =?utf-8?B?UjNDeUovbGdoSDlTV1BuNUcyVkViUHVESGNjaWtobHozcDE0WGN4U0p0SFJ6?=
 =?utf-8?B?d2xoV29VOVBqQWtEbFo3TFRsanNVMnJHeGttLzZvWVdGcmo0YnYrK29mc2k2?=
 =?utf-8?B?U3JxRmdJWXRaTDB4Y3pvNmQrY3EwQ21EZzIwcFh0STNEbDdXQlZxY2FSVVh0?=
 =?utf-8?B?KzVoNGEyTGVRenVTa3RLRkJrQU1aSnhxSW83MWp6VVNzdkZBQlJxMG9vOUND?=
 =?utf-8?B?U0c2OGNmSkRQV1F0WkFpYnpGSlBiMjBXOUtpYkpuaEZ5WjZUZlZCTlVaNUNx?=
 =?utf-8?B?UkdIaVlIUHRTSVZqYmEwYnlaRkF5cy9zc2dlckJRUU1nQ1JTd1k2eVIxTnN6?=
 =?utf-8?B?dC9SWVJoMS93TTV4dWE5V0ZSZFBmWEQwYW92Y05RaXV5QUxBWGdPdEJmWjl6?=
 =?utf-8?B?aVp6V3U5dkcxSlJaakhLSkFJVXA2SktFdC9RRUdDQmlCUVBOWUJ6MzJSUkVo?=
 =?utf-8?B?TnNQUHEyUUtCMG1SckRxNmtFdEkwdDREQytkWC9FeG1GUHB1NjVGby85L3dU?=
 =?utf-8?B?MUJ6SWk5OVpDbXd4SjY2Z0R2RTF0U2tIdWlSL0FydzVVcXJPbUk3am9Eb3ps?=
 =?utf-8?B?b1hrdGlRZGZzaituRTFCRDBEMjU4SWwwQVBHelllc0orNWRSUnU3cWtrbXJ3?=
 =?utf-8?B?bW9EMW1vSWswODVvQ3FBeTRnZTRhSWFTdUIzcUVRakNaR1hvOXFxMDAwWnYv?=
 =?utf-8?B?alU1RzJ2bVFWK1lZUVltVUt5NnNmNThsMHIyT3czUXNqVkZhY2dpZkV6WWlC?=
 =?utf-8?B?UjdpcGc2MGdRQ3lhN2tHWC90M0VzS3RQcmZiRFpvUXdFS2NVQXFGN3Jhb0RP?=
 =?utf-8?B?Vm9HQXlyTlkyM21zeTJzUzJKZzFFM3ZwNnFvd2c5ZWcvK2V0aDQ0WkhVeTlh?=
 =?utf-8?B?VGVrN2hnTFAwQk9KZHowcXVmcnIxQnRLSjQrMnpRMGRnNGlkczJ6dnhsVmZ0?=
 =?utf-8?B?MS9oYzFubTNLQXpiTnVQb1RiRTJDYUU4eWtGRmVqUmYzblhYbmhERm5qTU5T?=
 =?utf-8?B?UWJPaXhyYm5wMWN4NXYyRUR5L0QwSVlNQzQ3VUJEV3hoWHk1dE5qOFhTS2Y3?=
 =?utf-8?B?ekpqQ0xTVFZ1aFhPWDBsRWZ0RUZLUGhRYnJsQnBWVkQ1V2pSQUs0SC9Qd0tN?=
 =?utf-8?B?cWdTVURuWTc2YVNhaHJMWWtKMHZoME5ZcG5LdVp0dUpZVG8wQ00zK2dpc0tr?=
 =?utf-8?B?MGsxU29rUzhjVDkyMVpvb1J6UE9KMVJtZ2pJM0I0a3RMelBMV1IxOFNOR3Jw?=
 =?utf-8?B?QVZ5SG1TZ293RzJJd0VycEYvaFQ0MlN5MGtGSmU2UzFVRlhwb3VHWXVLcng2?=
 =?utf-8?B?YkVQTDlabklSVVBjVTFBM3ptOFlJSXdwcXpBZjdwSWFYdG9VUGRYN0sxZ25X?=
 =?utf-8?Q?HCdRKL3WYLx54RZSfKSbN/GpC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e4359e-66f9-4b41-0d2b-08db3061cf95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:28:05.7067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeFVjyEar5tgELvLlX36sgzQD+Ue/vUCewTXk55CS2cgnnSai0lSJ7UL04JTiKq8pGWykMhW/iwZc+W3fATGtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

On 29.03.2023 16:20, Roger Pau Monné wrote:
> On Wed, Mar 29, 2023 at 03:22:34PM +0200, Jan Beulich wrote:
>> On 29.03.2023 12:18, Roger Pau Monne wrote:
>>> @@ -419,9 +424,8 @@ static int adjacent_write(const struct domain *d, const struct vpci_msix *msix,
>>>       * assumed to be equal or bigger (8 bytes) than the length of any access
>>>       * handled here.
>>>       */
>>> -    if ( (VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) ||
>>> -          VMSIX_ADDR_IN_RANGE(addr + len - 1, vpci, VPCI_MSIX_PBA)) &&
>>> -         !is_hardware_domain(d) )
>>> +    if ( VMSIX_ADDR_IN_RANGE(addr, vpci, VPCI_MSIX_PBA) &&
>>> +         (!access_allowed(msix->pdev, addr, len) || !is_hardware_domain(d)) )
>>>          /* Ignore writes to PBA for DomUs, it's undefined behavior. */
>>>          return X86EMUL_OKAY;
>>
>> While preparing the backport, where I'm folding this into the earlier
>> patch, I've noticed that this change has now left the comment stale
>> (the problematic part if just out of context). Not sure though whether
>> that's worth yet another fixup patch.
> 
> I see, thanks for noticing.  I think I can likely adjust in some further change,
> or even just drop it, not sure the comment is that relevant anymore if both the
> PBA and the access must be aligned now.

Yeah, dropping would be fine with me. Plus you're the maintainer anyway ...

Jan

