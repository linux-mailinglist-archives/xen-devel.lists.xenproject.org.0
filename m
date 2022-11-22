Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A663633DA0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 14:28:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447183.703122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxTJp-00020j-79; Tue, 22 Nov 2022 13:28:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447183.703122; Tue, 22 Nov 2022 13:28:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxTJp-0001yp-3y; Tue, 22 Nov 2022 13:28:09 +0000
Received: by outflank-mailman (input) for mailman id 447183;
 Tue, 22 Nov 2022 13:28:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxTJm-0001yd-Vl
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 13:28:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ebb37aa-6a69-11ed-8fd2-01056ac49cbb;
 Tue, 22 Nov 2022 14:28:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6802.eurprd04.prod.outlook.com (2603:10a6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Tue, 22 Nov
 2022 13:28:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 13:28:03 +0000
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
X-Inumbo-ID: 7ebb37aa-6a69-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCJgOUnRIPHHYPq3eIEDIBF3p7DSVSbm1gbi/z7+vw834FWUOsqTrqx4HDMY8Y/1Is7ObDE7DUzV8d8jD0Dk8CZnZiaYgR6Bf2+z7QebkdplwvgE42p72W61lzasnnRimwKDrNGyCKV2aLi9oU7n7MFYa60HdBPAfS6WJ+xWkrS1etdoGoXztLUtB9x4Vtd9F7VwmZ4JZMxE3IaAZUYIFjbbsq3oUvlhTC1AeBqNvDkta+fttScPPlS5bt663AKoaKWpYMuu3zfgMOYttrGVlWoXMHFQIZAiUb8F2XJGWpeixbYr4rhuZlT1COeO/aeZUTrpfDVRt4A1qoRtWGRujw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWvDLOpfgzVaSdFEZLQ1GW7kKiQKWRWrLmBLRS2m16Y=;
 b=NsCMG18RntoDrKL7LpVTIDQz8mXZUDJ9SvqdkClphgGwYhE2+fljx+ipHRP/uG24HBKEZYndT606uvTp0sEy5ACGn5n143P1FFs7ssAZBu+CS7anYc2HNehKzGYCsc5wVL93nVdS7h0YVjjge0cbUcx++35Q7LeV4WSj/Ve9xkXKGNYPJ5M8FJQmeMihFU2ulYpzELSyjDZWpWePdtTkGyennmrVOp3TNJ25VP+FatJiqeFi6++fFDktu8foJ2EtQAwiAjfI+uqohT8xaggDvQRDD0Q2F824p37L56gWLCMJw6sWl4l51uWO8GdnHRWCcK9LdUVgOyAg/ReddM8vuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWvDLOpfgzVaSdFEZLQ1GW7kKiQKWRWrLmBLRS2m16Y=;
 b=hLezTGwvNoZKkQFoNOQ+RZIvX2mb1mo79/0D+alywDYwfb9c2p3dZtWqUJpxymZx/hAK74vF6LohK+FX073DxTicxCJq9YyhGIHBgjXJs/Y73fWgbIyFYQtHX/q+pIkcgJXCc4cQ5QxDAhrh3Wf/IX6Ma7PPBd8v/SFv3e0nnXQ9yx01hOKI++ZjNtF41eiEt7BRKgioDlJimCBdMnhGkV2OBq4BZuVqc5KK1D7TugB6Alf4BicAhIbnaAYfM5S5VXJmJYIL7tokcbgb+n4DhYWwXmqCDUJupp9DMqYhs2cJgB0u1aXW5sHddIpuOH0qes91ask2Sl6MCjOMdSaNAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29704260-367f-994d-b269-976bded0ea7e@suse.com>
Date: Tue, 22 Nov 2022 14:28:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] CHANGELOG: Start new "unstable" section
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Community Manager <community.manager@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
 <20221122112623.1441905-4-Henry.Wang@arm.com>
 <decf63eb-0732-5a79-c292-17b2f7206b77@xen.org>
 <AS8PR08MB799127771EE3FA2AB3DC5B5B920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799127771EE3FA2AB3DC5B5B920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: f342a9a7-96ca-44e3-3995-08dacc8d61c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqpS4F/trTxBHmmMwJ+gECMIfDgBAGFn1EovjHa27XzfBHq/4GNDfUb+QMdeTSyS1gQUxKDnh6CcMVPQcM+/shgC/C+n8qd1JLtAfyvyqQCnP8+aqK7xz8xCKoVjaaeaj0VIU/2Ehz/r6s1hYIXKkt18jYd+UGvg5rZnzlIS371FY2++hH5kaGwSqlI6wmoiTE+SH1j5GELaWgUKXWv9oTEDl94LOEHNke5Jw518/cu8UnK1UusJoMa8UISdBI+8MNurNla6QeXJA78UbKaVq0vUVxszEh1lle983SuiK+9vFrrSt1jkyxGoIMZkTQr8jRR6JKkB+rExflpcOZ0NOGM04XksdlXUElNVG9tn5KgXaqevij8LXNhN2X5v6d8amcuAbLz88z0gR69fif6/4GY6B72VohbyCBGftchVfccT4y6TbT/4bCKRK5cioXt4m5Px/BhFvj9qY0tOQVc6ltRREh/NGrtQGSyk+QLWaXVS/Ym4MXDOzSHNb8VVmah4r6j9jTYogHCXBVtsFHBrVe9gIgHTdObZtfFLvB7WB5u4rNjMi4SN01vxkMGp+qaWSSD5PPxR1YlsDRnXV8XNkswbt1ZaT8W+r6uCPhaTh9dTBI+z8gDil03/Oh1iszixBsQiPQK8mMrUCofP+ek2jJO3FfCsaE8NHaSscHMXQi7EzKu35baixmDNCFmpsZeoP2mEPbxPjgPgnu9DJuCuXXqOr/iDSbXUCgkuVzpt9zpw+r7lOlCZN3ndEgl9dh6UiSn5Ub6uZqTOe3PMCyUTWRl9ns0DUilmTW+n1/CCyz625RGkFMina4XkacH6fn7X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(31686004)(36756003)(38100700002)(41300700001)(2906002)(83380400001)(86362001)(6916009)(31696002)(4326008)(66556008)(6512007)(186003)(316002)(66946007)(8676002)(54906003)(66476007)(26005)(8936002)(5660300002)(6486002)(2616005)(478600001)(6506007)(53546011)(59356011)(219803003)(207903002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2lwTC96UGZSWFgyd3BzdU9ERjlKdktaU1cyKy9SSnJKRTNubTFKVG5DbTUw?=
 =?utf-8?B?UHBqRTZOVkxsMTVmc29xTHhTZU9mUHh3cHU0Q2dpRndvTW82NHJ5M1NQU3JL?=
 =?utf-8?B?endQOHo0NDRmVjdCM0lNK1ZrTGgxZFZnYjlzcDRIQmpya29jOTZYRThKeDg2?=
 =?utf-8?B?aHdYQnFXUFR2TzhvK0JmbHdrcno0TUVBSFVoTjB4MjMwK0NFZ01SV1VscmQw?=
 =?utf-8?B?Y2h0QXlCM2pob2dlZHoxZWdVZEZrZkFLZmVxS0VQUFUzaXh6RnVKUzhZbTJJ?=
 =?utf-8?B?RTBIR3d6NXM4OVIwaXhnNW5oems0NFp3S1pPbUhiRGdzR1h0QzRHeW9qOE02?=
 =?utf-8?B?dmphbDVYVlQwYTdvUnFwWWJiUGdCcE10VTEyMmUzYXphZmdmaEFqZVNadjJE?=
 =?utf-8?B?RzVhZDB4a0toOXdlUHlZNTNTYTNSSzN6SXpjbTQ1bzNQSmhUcnFVV01lMzNK?=
 =?utf-8?B?bnBrY0RucEpPN2QyakZ3SU5DU2FURmJ5bXZUSjdzWjN4ZDBXK3UraTRWQTNO?=
 =?utf-8?B?T1FzT0xoU1FkT3FPQTBYSkhOZWNNOXdqT3k3V3pYTTJIWjNqN2FxSnhnbi9F?=
 =?utf-8?B?MEdqRW16RncyT1ZENWxFSnRRd2FGYnpEZ2FVdUxOUTJpcnlBdC9RWmNWV2JM?=
 =?utf-8?B?OXV1RWtxajNleDU3TWRpYUp1Z2lIZC96cW5pOGM4NGVhNDZ4YkdwdVMwSE5t?=
 =?utf-8?B?Yzk1bTJSSE5WMzJiWDBiTGtON0Fzc0liOXhhWkZpK0VpbmdMeTZwRWdvQW82?=
 =?utf-8?B?dUNvYkFCamtGZldjdzJlUWdFK0t1cXppNGh4Zng4NzFuQkdTaWgwUGNKMXVJ?=
 =?utf-8?B?S21nT08xbmRtaDJBbVluY1B5KzF3UWdpa01JdXZReDFSdEI2WUU4YTRGUEx1?=
 =?utf-8?B?UVg2RmxGRnJvVk5YN29ZLzljTThoREIvaW9vV0NLVHpENDlmMENXckNNcEwr?=
 =?utf-8?B?bXFFVS9WUFR2N1pGS21WTlJ3dEJBRG53SlhLcEpqckJSWGEzTDB1M0pmc1FI?=
 =?utf-8?B?TE1xdWtLQXVLWFUxZmZBdDJGemR1SisvMDRkeTR5U2pMVVBIdVVKYjhlTTRX?=
 =?utf-8?B?cGdWdWZQMFJjZ1QwY2pNRU02UnFCZU9NMXZtSWpURFBBcTRCV3ZNWmNUZXJF?=
 =?utf-8?B?NENVMTJkdVdON0hvczY1TFJmMk8yUjBGZGdtYmpRT2U4dEhteHlHaWxsbUEz?=
 =?utf-8?B?eWtrZk9ycmFLWE9PV05RS2gxSlIxWmFaYkpCM2FVSk9waXZRZE1yVGdJdk1S?=
 =?utf-8?B?T0tzYVZXcE02aFBlL1RUZjNmSUFyMzBTc2tnT29XTDYvUXdwN3J3T2dwWm5U?=
 =?utf-8?B?YmNta2w0ZklqOFNxaTJ4bTVHWjBWcis2WnlkMGlYU1RBZDZ2bXphOTluWlpY?=
 =?utf-8?B?eEZlWTkzaXlVM0syaS9CdzcxN0JKVlJhYUdtZzlzeUwxdFpJcDlZaDYwZ1h5?=
 =?utf-8?B?MktTWlpPNW5NN01SZC9pbzZ4N3JMUzdSWWhzRnRYRnEzTWF3YmwxSk55ZEJN?=
 =?utf-8?B?TFh5R016Zm1pRFlpMHh6dlA3dUFuOElXZGxmVmxUbjNHdEZocWVRSzV0WXRO?=
 =?utf-8?B?Q1VCY3lHWXFvb1F5RXl3a0N1MytENXdONytaRXI1ZDNOWElQOW5OM21xVDdM?=
 =?utf-8?B?VDBTeTJKSWxGS0ZVVDltRG00VFJIdUdqenAvRzJhRUZGQzZjam5LWml6SmRH?=
 =?utf-8?B?aDM3OWR3RU9VSGxyVVVXU0E5UnlWcTFFMVpFWEZrb0tCNHJYakJaV3J1N2Yw?=
 =?utf-8?B?SFFYVHkyRlBTbkJ3RnVWTkswY0RVOEdoRE5Tem1DenhhdW9QdEVIRHJrZk9S?=
 =?utf-8?B?UTZqWkhDUWFqM3ZIUllvSjBNOG50ak80bHo3NHdpU3NNdnJMTFVvMVB1VVNM?=
 =?utf-8?B?Sm9yTUs5TWdMR2Z4VXdMUHdZWWtwUG96a0NtNGJCanV3bmpsSnhyN2hFc25C?=
 =?utf-8?B?SWgrUElnU05oYXNuWlY1b0JBeWFQMzdQMkNnZnQxQTgrT2g0cXFBWVRvUng4?=
 =?utf-8?B?RmFFeCtlNXNpV1A3TjNDNlZaMzBpT3B0S1dHamNDMm1BTUtYUWRNZlN4anND?=
 =?utf-8?B?RTA5NldIc2MvR1pSS0wyV0tNYVpIUGNaQ3AycXYvQkJEeVBEQmxTRVlVaE5F?=
 =?utf-8?Q?NOwPeG7Hbzbi11s21FoWK2M+W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f342a9a7-96ca-44e3-3995-08dacc8d61c9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 13:28:03.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBkPTPO4xauHFkO/4dOY3fOLGE2XoaEbK56kb9ZE2Z3NGcFx+NvwKyREFW/aO4Knhz3NTnNlaP3Wc+KOfJ08aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6802

On 22.11.2022 14:01, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 3/3] CHANGELOG: Start new "unstable" section
>> On 22/11/2022 11:26, Henry Wang wrote:
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> v2 -> v3:
>>> - Take the opportunity to also adjust the 4.17 entry since this
>>>    patch will be applied only after branching.
>>
>> Does this means the date will not be updated in the CHANGELOG.md for 4.17?
> 
> Again sorry for causing your confusion. But actually I am also confused after
> checking CHANGELOG in our previous releases, because none of them
> is precise...
> 
> So in 4.16 [1], the link of the release was not correct (I believe we fixed this),
> in 4.15 [2], the release date was TBD, and in 4.14 [3], the 4.14 entry was not
> created. 
> 
> This makes me a little bit curious about what we are going to do this time,
> as you are the release technician, so I will follow your working style.
> 
> Either (1) We make a fixed date of release and commit the updated version of
> this patch with this fixed date and release tag before branching, then don't touch
> the CHANGELOG at all after, Or (2) We branch off later this month and update the
> CHANGELOG one or two days before the official release, works for me.

Personally I think it should be the latter approach. Who know by how
much more we're going to slip ...

Jan

