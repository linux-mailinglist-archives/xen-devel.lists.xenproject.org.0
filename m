Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84CD6F3E6B
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 09:32:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528368.821417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkUR-0003KW-LJ; Tue, 02 May 2023 07:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528368.821417; Tue, 02 May 2023 07:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptkUR-0003Iq-IL; Tue, 02 May 2023 07:31:59 +0000
Received: by outflank-mailman (input) for mailman id 528368;
 Tue, 02 May 2023 07:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ptkUQ-0003Ik-SS
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 07:31:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69f37921-e8bb-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 09:31:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8186.eurprd04.prod.outlook.com (2603:10a6:10:25f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 07:31:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:31:53 +0000
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
X-Inumbo-ID: 69f37921-e8bb-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZZE+F/eoqt3NpzStDOYzo5CExw18lv9QMwoWWIb3uS7CBoD/0XDT4IsdadcUzQAKB8xAuaPgFhCuCpbX0J+opiDcQwK4dNq+M6W1vr2pjOIOp6QRN4nHcpU9IZJZG17KgEU/2gzg2/9MPvIls/w+SJdJIWyJlbnyOwl0j+H2cBkwYuoUbEY6MAr0KMyYNln83CxLkXOgqS1NKDc4Q00pXq00iZ61gJWGm/hpTvJ3KdahyF0vmYacSzvLxQIHnCHZPA7mrR6AjQKqaGQVVHTWpgqBw1Qdhflr9v1zYPzD998AZybnWxA/vdMBLAIwMV/cRVQKFTl58b03Qixzd3Xjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YMiXAnfAKMyQKqJ13W90DOmfzJnHkhJukbcKuVvems=;
 b=ACbunt98dQnFWJnpOTUkBUJrIWx/uLao/4bN/OIlGP64CKL9srpljmfpV9dCQDgalkF0SzfIBS040xBtQCgYHvk8n467flDpBFEX3OgnPZH/qbiq77hbfnpXQ+YxIJc/IsKeoGqs7qY47wBaBAAKGVquXp3EZyfypE1ACUTx/gCX0SZtgx2JrKExzW8uyXC2EyHpT8FcakZlvyx6stxw+kktqA975TTTExQmFYwkJVODZgvyO2TqVbCQsauC8QOM0wM/NZaxgwqpNwe3dutjVmeEC4I5L+aO3a4OLeO3CMf/eTBuX1IoMOrr8T2WhnwOlWGyn1AA+aAGrsJIQDNL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YMiXAnfAKMyQKqJ13W90DOmfzJnHkhJukbcKuVvems=;
 b=34oHAdLWujbDxYjar2Qku9BdAJPWLg2eBjKvHq23js6JxiJYfD/jtgf+twC7FJ2D/CSMqdToTFet2lGxqIW2HNsSGXHqDIQNOjzC+dfjhMrplo9uiN0+Idn2mcv8BCzMyIxQQLdcJrcPVCgwvPKiBzwRSPXs5lo4TSOxSx6267oxntB9TjTijUPqOFEenGjUUWhfXdz7XKqeTtO05M/Kjahb9PJnI3yacBZtRZ1s4NUtJL1dU4F5Sz3+LKQMVDwVus8qmOm7s4sGrQg9KUJPCtbYvhPfYrbIL1LpBgST4QaCZfIJh2c+U0L3hePiTp4MMVPkYc9oAjAqW9pfctpoKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <43b1c214-4248-a735-6f8c-9e08bdd2eaf6@suse.com>
Date: Tue, 2 May 2023 09:31:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: HAS_CC_CET_IBT misdetected
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
References: <20230502074853.7cd10ee3.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230502074853.7cd10ee3.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: cf157e7a-1395-4e2e-4420-08db4adf4d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVTOrYPAarPQbZLQY0XGKyWfZ6+cx6KV6XZaq3Ivi0RKxhBGg+n0AfeUIpHGic731khyUBoGjW3qbh5iYWLePvmk5Sfqfg7mvf+CjYjntoalOj4UKlSyTeK0+uo03mZqhmvdMzXkd0QC4aq0MEk2DsEa5GdiDMwjfG7TngbPrqKquclcWHrnMhzTYfATqXhG5+BpSLmdet9TzwcEYSamPYJkIVgcBNo44ecHQYYIH3VXux0+nkwq0vFHesbXqb5bo8ClbLBehkt6Kw4n3fSctzVuahg1ULqR/MIY33saJAvOFfrkHtKT1IFGoDpNxFlXXQtVlYbEk5NYImcsf5nijPbUimrTIi2ZCYZ2QRKY8FyugRe6Dy6Z8ar3jkRgG3vuwaHCjD6nuGjqvGXEqzH4L6kGU2cEXcrl9Q4/BAZ0wCCtqaudC5WLzSd8fnSEbHY+XEJaC4823sgIr4E3juxD6bb6NV+DEu9Axjo3yr9XdFt1kBzomvFzPC1O5ICNDXBra5W+UFUdlCWQuyi9RPaMJrc9oWgf+ymF+c+UJoL/MprySwHPo5a3wA6yuSaMv0cwQ4yEcVtq+LW5yUaXi3Y4eh/lzW42Poi2mri3aSfaL18i/tsMBioQwnDOeuHaJMW8O0PU3j0SRBFj8m1GmtFXfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(478600001)(26005)(6512007)(6506007)(53546011)(6486002)(83380400001)(186003)(31686004)(2616005)(4326008)(38100700002)(66556008)(6916009)(66476007)(66946007)(41300700001)(8676002)(8936002)(5660300002)(7116003)(316002)(86362001)(31696002)(4744005)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dW56Qm5Mc1dFQ0FSOTF2b3VNcUZjL3dOcllFcUZkSFRCVWcxbkk0RnhvNzFE?=
 =?utf-8?B?ZDZLUitDQ25CZ1BXeUNzdnREeHJUb1cwKzV1dlRFbStwaGpTUmFYeWowUmJH?=
 =?utf-8?B?MExub1pZTUdUY05sWXUzRis0QlcwQytVRDczZUluM0JCRGZhcmJmeEVwTjVx?=
 =?utf-8?B?TmkvWHlHV0x2ZFovUjNzdThWRzhoZURraW5YbmtpYkhYRi9RK2dibEVRYUlk?=
 =?utf-8?B?dEZqTEFvMHVjVWYxVW5RQ0Z2M1pEaTFnNUZjNHo4bmJRelYzbno3L2d6enVu?=
 =?utf-8?B?SEVDQkFLN1dRTWpqaEZUZkpuNUh2bFVOUld2YitUcUFieVBxMlU3RXBDdFlJ?=
 =?utf-8?B?ZGNhSDRpTVFySzJrU3dkYlJUQ20ySjRzMjlONllKYjFGdHhEc0l4YVAvenRC?=
 =?utf-8?B?NjBobEJVLy91MjVZNW5WWjg5c3YvczRmTjF4UDl4eUtuNUNJay9MaG1wRlZD?=
 =?utf-8?B?eHVCOHVEYjRmVW5ycy83Q0YzVllZSkRTbTNmSjdhNHNJZkZWZGJqNVgrMnhw?=
 =?utf-8?B?Nkw4Qzh6MHh0UVJlTnFOdkt2Y0cvMFRLOEhacFRoWkhrYzV0RlVGYUQ2cGV3?=
 =?utf-8?B?YjhyT0hOc0VyNzQ5OW0vYUpLWUtTQ1NHVTBYMjhTVWk4TXJBZk9GTnhDWXhB?=
 =?utf-8?B?cHlsc0pnK0VvWlZtRTM5enpvamZSSlQzTFh5dFpMcktOZjRiSU9DaVk1ekh1?=
 =?utf-8?B?RXVtK3FOUnVaNVo1MGdpNWhPN3BIaG41d3lJSEU5eUxRQUoyMmJzclYwRVVM?=
 =?utf-8?B?VlNtYTVrM3VwNlhPcjVmQzJ3WXRzTk9PbjFGZG9Kbk1zRUkrWEpzL0ZTSFhH?=
 =?utf-8?B?MnFDVk5Ed1Bqd2ZMUHhZaWFINURESG9mM0ZmZFdnZnZJeXo0YkppZ1VUci9p?=
 =?utf-8?B?WDZxMjh3TU1Xc1VzQUpFVGNqK2J6WGhjYjRjSHkxMExwY0R1a25Ec2E3a21t?=
 =?utf-8?B?ZWdVWW8wYUR3cmhzWjRaWW83MUxzUnk2aGpEQng4NHB0ZFBBYlpCRVh2dUU1?=
 =?utf-8?B?OC9lSytaV0dTZlEwZWFXV3Jab1g5SE1QWklqT0trRTJ5RnYwT2RaSzgyamhZ?=
 =?utf-8?B?YjZxcUd0T25OK1ZZbGF4KzMwMXRNUHF6TVNmd0FzTVVwaXY0T0pHRUdJRnFM?=
 =?utf-8?B?QWlQV3d2M0Z0WUNya3VFTzdSVGRhOVBzOFBoM3NYS0UwcWpyTkNTOSs4U2da?=
 =?utf-8?B?QmR6RVUrYkRyL1MzZFB1eVZ2elgza0dsTEZPU244bjBUSnBFcUExMVJ2bmdj?=
 =?utf-8?B?MjRrMFQ5UFNaV0lJdmYwM05GRU40S0lNY1M4ck0vKzRWcGdiZGxib2hrUUJy?=
 =?utf-8?B?R3pVeTJSSVRMeGg3RjBTdjVCNWJJeFlSWGZmcHMrdmVOMXBPWGlyQUZDSzRv?=
 =?utf-8?B?eVFhV1lsSkduOGFOeWRhUXBBYTJrTjI3RkRERi9zN0R0dzVobG1lVlFkNGVV?=
 =?utf-8?B?S3gzK3JqeWlvN0JMcHN5bDIvby9EeGJERThrNjFCZmxZdEhhRytNRTZxYVpE?=
 =?utf-8?B?RzJhS05YSGRpWmVUWll6MmRJSmp3ck9QbHZKUUNyZXYybkwrbEtndjNEbkFD?=
 =?utf-8?B?S1hmSllPZ0VYSWZ5K1dNeGJIMU02ZURYNmpidVdxMzdTZVdCSE42Nk9KV1dH?=
 =?utf-8?B?YXFNZEIyb1B0Z0JJaE9pKzJsdm9JK2ZCZFliRzI4UEFYMzBEN1FUSVFTd2FK?=
 =?utf-8?B?YzRIUmNzSmFhTEhzZVd2SzR4ZDdRU0kxUUFGM0xkc2p1ZXpSbDZBWTlrbEwy?=
 =?utf-8?B?MlB5dUNRTXk1OGtmQWZ4ZWt2c3oyRFdNQXdWZjV2RHdmVU9CNUNUSjlKQ3c5?=
 =?utf-8?B?eWVheXVleFRkaTZSQ29WQWZWbC90S0YxZ2xVMGxhMUdheWRGTDZxb2E3bGpX?=
 =?utf-8?B?NW92M3BXSkV6eE9GbjlhV2QrdUV6OW0zTkd2QzlRZ2NkRVluTXVqRjVid2dU?=
 =?utf-8?B?TEtSL2QzUHRYQ0N2dndreXA5MzMwb21iVmc3anJrMlZ4cU1GdTlPb2p5Z243?=
 =?utf-8?B?UmZjeUlGQ3MzK1ZPRXl2VTA0cDdxQ1d5SGIyUWl1alVOSkFGemU1eUNJQmNN?=
 =?utf-8?B?SHJGallnMDVaaXRXdndNeHF4K0dveDc1c3V5SFM5RXIrM0I0Q1Q0dEtBTzg4?=
 =?utf-8?Q?hMDCie1SWvc05Cy8Bh24qs/Tb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf157e7a-1395-4e2e-4420-08db4adf4d18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:31:53.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rb3Urt6N2fVGBlQ9cihH0sP/Eto7BcZa55DdHO15bCMljOAD3XY7bL1NVb4DxxMfei3vozS845f/oBJbvaEa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8186

On 02.05.2023 07:48, Olaf Hering wrote:
> The next push to xen.git#staging will trigger a build failure in the refreshed Leap docker image.
> 
> For some reason HAS_CC_CET_IBT will evaluate to true. I think the significant change is the binutils upgrade from 2.37 to 2.39 in November 2022.
> 
> The comment indicates the combination of gcc7 and binutils 2.39 is supposed to evaluate HAS_CC_CET_IBT to false.

How does 2.37 vs 2.39 matter? CET-IBT support is present in gas as of 2.29.
IOW I think it all ought to be tied to gcc being 7.x when 9.x is the
supposed minimum. Did you / could you check which of the three options
(-fcf-protection=branch -mmanual-endbr -mindirect-branch=thunk-extern)
is/are possibly recognized by the (likely also updated) gcc7 there? That
may provide a hint at what's going wrong ...

Jan


