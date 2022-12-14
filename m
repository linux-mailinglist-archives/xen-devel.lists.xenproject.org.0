Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9475364C628
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:41:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461925.720091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OFp-00068a-01; Wed, 14 Dec 2022 09:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461925.720091; Wed, 14 Dec 2022 09:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OFo-00065m-TM; Wed, 14 Dec 2022 09:40:44 +0000
Received: by outflank-mailman (input) for mailman id 461925;
 Wed, 14 Dec 2022 09:40:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5OFn-00065g-Rf
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:40:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f285ebf-7b93-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:40:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7519.eurprd04.prod.outlook.com (2603:10a6:102:f3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 14 Dec
 2022 09:40:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:40:38 +0000
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
X-Inumbo-ID: 5f285ebf-7b93-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqOEJ+T8/YNDP9OIdCeTN/KQzcDW6YBnLXN2H3b9pcJPhJ3PrLlRNqyGaV5v9wlGZXOtQ94P57iRCdmqxAqj7zuupLW99YiHox28HT6Q6pE5mSowq+eJqVpGIrVreOpi0kgNgYBT9j1JSXrwtn+FPO8lned4XxbPrMOLySaTCSVBk4x6RYVfoqx0KkiWNxDY0ultAvyTaDC9aD99BFaxlMnaiDRX2KUsrvaWxYs9y4glsLvp6z32pvZrW4HPyOLuWWdt79mt9GJJKRsTcSmvXgAYhHkno5zR8zxzz2NVop1Y1Z1RX8/mSH8OtxVk+tOygD4KH1L+fDGjKBryEXhZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WiBrV9/WQrZ9ezepPYtvAR+hTCv7mOI9NgXXwZv0N0=;
 b=c6M090wJrF1OvReVJ+oeT7N8909Dpi3c5SG9so698+Bjl96CNcuHOTIt1OMXpWqWELHieP+sGSWhJ6Zm7ryKDyCGBpSw7RrlbBa6R5oeYoljvYdoFIMZNyWcniq+VfuUnKTukgLfG9aZGuH9WKJ6FZpw04ab4l/wTLFhp3o6XP76mdihZbIMnheSRi67f3LbzYENBwNTej7VF84XRxRebNFsJEk5p+bWpWPFW9dkZDEiUCbSQMd9mOaxBR5O2GapI+YlRrMcXB85stowiA3dYS48eHkmm+/1gSHTTrqz+reN9YqTcgLR6VFTIz5Ov5NGDJphrIylJtOUutdMDB5GTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WiBrV9/WQrZ9ezepPYtvAR+hTCv7mOI9NgXXwZv0N0=;
 b=c/wDvg+dev10UjP6SbYYFXNG6IRK/J+IpKPyiQvcC0/JFj7/wxZIlYzlPZfZM/2jSPnF2itWpxHhwhDt8oiRRk5NYaR14Vr3K34CZskd0Kx+HbC2dzVWBQi89GHXt/kfV9tBq0jrUrs+Ut2hOS5qXeHkDMr199vIhM4G0flFnTb/sOdLZBUonH+Q89XgDXaQhZgrqNg7gZ28H9r3rvPdcJk3gn0Lg7cGCbHfJ/YryXSNY3y51afcp6I0qgbJL4nwHzI+MXRvTDoT10X4IAyMRpTbDh04Fzc425sviQsLK2mwshDfJ4Y3PkHI3put/KjS+Or2YoBPCl5MtVSeHZ1drg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ab1beed9-8953-4196-fba8-ac9c36e4cd1a@suse.com>
Date: Wed, 14 Dec 2022 10:40:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 04/14] efi: Avoid hard-coding the various PAT constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
 <aad022471c81db163ed7b4780f926898c2ff9065.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aad022471c81db163ed7b4780f926898c2ff9065.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 4786ef45-1a74-4792-e8f9-08daddb7420b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TB3mASF+30Mh7klGi7f68UDcCgTmV7fb+QjERT7hCV3SdRgfVDBxLTwZH0DgZYA/Lz6OLVWI9REaT0qNWFCbB7CQ8V9eNECz1+kNcROwVc5DC3fyO+jd0E1+ji6vpjZW+EEQVAuFeVC46YAuEXK2kxSRk75//U+xuQ4ibnCsZcsauN6UqYY0lsyntGKK17jSKs77YtrfAN1mOVPUe2hzqJ+E2rr5LM+9Kv5p8ynGNQ9ldN8N/B9eXz/2zuJMAOr9QAB9gvpUnG614fMcrSckRu28UGEVI08syC1fKFFrphi4xfOakGOqBCAImRHXWWH02mZ1ODB7maB/onlucN4J+pyUAHULXtbmiT+OnXd2+/O6dXsXU4kyLackQARENXUzOP3xCR2p3ZVrnktl80lMj3kig2NZz36Q5FC3KvyKjx4KUXwUIf6Xm22e46VGtXHSOJOvFOLzUyNaRI3L8ryynqCuh1k/wLF3kPcvCtnT8cqHUedUFXE5vwBs/2PunoK0vK2YTmho204l3wsxw7lCAMaLjBCpZTZq4kBvQa4wBUd6qNtnaWNOVSDEzLjUUCbIoLTLu/7ThKrf+E63rWWJO73RNbj6E+vVpL2XWkpuCKK73t71Rp+x8Mhtizskbo9PYnIYy73EX+dlKhrrztX19VAyrGBZyNIWsajqHRgZQxe+wgKGztxMs8r4yMpth1IunNIrffg0mV4RhuqOLhHU0ZPo16H5ZQK4EV8gLKEFCLY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(136003)(366004)(376002)(396003)(451199015)(6916009)(6512007)(31696002)(86362001)(38100700002)(186003)(36756003)(26005)(31686004)(316002)(6486002)(478600001)(6506007)(53546011)(54906003)(7416002)(4744005)(83380400001)(5660300002)(8936002)(2616005)(2906002)(4326008)(66476007)(66946007)(8676002)(41300700001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGIxRlN0UjNOa0FJRFBsYTc3SXBGZlQ5SGMyUzZhV2RpN2pXUTdHanQ3My93?=
 =?utf-8?B?YzdIR0dGTFhrbjA5aHlsUTVhT2NteDUraC9HTHBVS0p1VVJGYnlPV2wvYlFV?=
 =?utf-8?B?bU1wT3VVVnk1aVNZR3g2SzEvZm03enFHL0pla1dJR1dGY2hRd3h0ODdIWTF2?=
 =?utf-8?B?emFsMGNtVSt2Kzk3VytkYU1qMnZoVGZwb05naERhczFYSEM1RHY0NGpBdThN?=
 =?utf-8?B?U0FpNUZpMTBnTlhiMFJKc1BjN0MwMnU4aTE5Sm96VmxPbUhUSVNYdzczWjFp?=
 =?utf-8?B?MFl2OStkUzc0VmtDRldYL0p4QlpyL0RvZ25ySTZ5VWx5Q2oza2FRajVYZHlR?=
 =?utf-8?B?ZkhJbDYyZ0lMR0lqMm1vdU02RGVTWTl5bzYzNkhMSlRyMjRtV2l3Vy9OeHdH?=
 =?utf-8?B?WUlUK25UMWY2RnBZZzNDZHd0eXRPUzBkY3g0R24xSDMrdnpIM1FscEUvNHJ6?=
 =?utf-8?B?VHAwN3FGQ21YNlo3Y1QrMy9Qb1p6Um8vbnpEU0d3czVPSHBNQVgydTJod1NE?=
 =?utf-8?B?cmpWcU9PUU5BTzYwZkFLSlovSFl3YnU5S1VpU3RzSU9rTllualpFOEZSN0l6?=
 =?utf-8?B?R3RMQ3NoY041Y2JUZ0hkYWZjMWhPVyt0UUpLYUMrVE5CTlRiTkRLUDlyUm9u?=
 =?utf-8?B?YW5xWHBVSjRXU1Eyc1JGWnIxSEx1M0xlREhkL1ROdHVSMUd6ZU1ScU9wQ1l3?=
 =?utf-8?B?SFVybUJVeVliWW5vWWw4RWxUb2FZNUJEWmRkOUZOTGJwVkZZdDhWQ09WRFZR?=
 =?utf-8?B?MWpEeDhGWmltSzU1eEJYc21mYmJQTVV2QXo1dThnVkVhaXN4cXNiRG5mOGF6?=
 =?utf-8?B?OUZIcEYzSUtPdzhqQ0pwaE1jQllxZ2pOQ3Y1V1NmSytvc1J0VEkyWmU2dzV2?=
 =?utf-8?B?TlhjWndJWWl0WUJpVkRPaHFjclpLT3ZaZ0RoWVBCNEFqY2s3RjA4VUFUTjJM?=
 =?utf-8?B?OTlZVWZXM1NVWFZHSmVLZEZvUVFvRHBpeWUyaHlQK2RMTVZhSVZDM0FwOWVZ?=
 =?utf-8?B?Zm1LazZ0Snp6d3RnbUpiUTBNa3k5U25EK2RwTXE3NHNpTlpKTTdUQVJRL0cy?=
 =?utf-8?B?UlM5a1pNY2tPUkZ4WVJOSEt1aHVMYk5RRm82YXlGa2UwRHRoRDFldkxYK1M0?=
 =?utf-8?B?NDdlL3lIOUp6RXExcE1hMzQ2Y0YrOGp5ajgrNnl0dTFOejRPVHY0SW9YVUtK?=
 =?utf-8?B?OHdodklEamhRWUkxcWorSXZwcmVxdzRYNmNnZThoZVZvUEtSVm1jK0VCN1RY?=
 =?utf-8?B?Y3EzNnNnTVc0QmtEZFhYRzB2cXBpY002YmFmVEplOWFqWHVTSys3ek5tdkRz?=
 =?utf-8?B?RHJnR3IvSTlRNGpGUHhXV29lL2lrb0lGL1VaUC9IbjhwaTlrY24xTVV1ZHFQ?=
 =?utf-8?B?ZUdoRHpMdnM4ZVF3dFpFdjBsWFB0K29IT3Q0RERGR1FLRW5tWmVLaE9nOTAw?=
 =?utf-8?B?dnd0RFNzRmtEcnVWdmplU0RTa2NqSDByQXdhRlB2d3B3MDl5bC83SkZIQ05j?=
 =?utf-8?B?QmRFSWpvazcrem04RXZaTUhEZ2d0dXgyRTYra0xKYlNMN002dUJ2NEdFOWl5?=
 =?utf-8?B?NXpaYXZjZHY3dlJpRmhINjJYVS9DZFl2T29FcmFheTdFUEMwZGYzS1hnVFRo?=
 =?utf-8?B?dVJBaHh2bGx6bGQ1RFFMTmthL0VFTm5hTjRoWCtVVkZqeFlYc2xNSHFHcmFW?=
 =?utf-8?B?cXFtVXNRTm9tTnAyUjVUbTc0NXE4d0hCaHl1eWlpcmR2dlVhODR5R2ExZWZl?=
 =?utf-8?B?dzQyL1FCTCtrczU5blV1TkMwTG4rR2Irek05SlpJTEg5Kys4aHk2d0VhRVMr?=
 =?utf-8?B?UFNrLzIwS2VFN3RneUMrYS91eWpTbWQ3Z0ZJeG9jYTl5enl1dnVnUVhSM0M5?=
 =?utf-8?B?N3d4b1lMdm5ZS3JPeGk2KzlHdHdrenFqWmxHMG4yalBCMlgyUGViWUNudTdV?=
 =?utf-8?B?M1VrU2lwOFF4V3crV0RiWFdOS0ZpQWhzNEV5dTdaSWN1eTRhY0VsVk5UWlRn?=
 =?utf-8?B?TTlwckJFbHFFbXpvVWF0Z1A5NTZLZG5WTnRDWGJGYUhGSGxkWmtuY0pqZVl4?=
 =?utf-8?B?SDlXd1hjUEJ4N3RFQVRjZjBlTWxCTUt1YjBqaUFzbjNoWWxOTUIrY0NGNVJR?=
 =?utf-8?Q?To8faRuVcOo5SyH2Na8+O/JPN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4786ef45-1a74-4792-e8f9-08daddb7420b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:40:38.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCoY9HPr8edXPk99IqTclyGUgUf0bRj8RA0weR8AhhzudXISO1SKAerVEkEoFzGa+aDxc1t+QOBpSPKgrEc8Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7519

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> This makes the code much easier to understand, and avoids problems if
> Xen's PAT ever changes in the future.
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Nit (quoting docs/process/sending-patches.doc):

In general tags are added in chronological order. So a `Reviewed-by:` tag
should be added **after** the `Signed-off-by:` tag, as the review happened
after the patch was written.

Otherwise it looks like this patch could go in right away, if only it was
clear that it's independent of the earlier three (it looks as if it is).

Jan

