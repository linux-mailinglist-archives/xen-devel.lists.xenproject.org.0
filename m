Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3886C625C99
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442557.696819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUiB-0004XM-VO; Fri, 11 Nov 2022 14:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442557.696819; Fri, 11 Nov 2022 14:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUiB-0004VD-S8; Fri, 11 Nov 2022 14:08:51 +0000
Received: by outflank-mailman (input) for mailman id 442557;
 Fri, 11 Nov 2022 14:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otUiA-0004V7-BD
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:08:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2055.outbound.protection.outlook.com [40.107.20.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cf1374e-61ca-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:08:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9101.eurprd04.prod.outlook.com (2603:10a6:150:20::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Fri, 11 Nov
 2022 14:08:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 14:08:46 +0000
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
X-Inumbo-ID: 5cf1374e-61ca-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aw3fvTPZKUrET96znaE1Yv659nzGqrfLxSsu9LgD0BBLGJgQqwGgbEKTu2WtnE+bcS2pII4sYebUuNOFtbdlNDFydTeRbohTE1Ssh842LtRrb1bUJGafxj2RoXWrlvyqMUvMxy7ALxyjw6TrkmZ3n1MX7g9hJcGn6/kd0YYYPxx9optDymFZ4BRijUn744DNaUK/b8fYNjHtjpwhRbKID8cVLNnk8n5m50dpqD/UjuG19LP2LD8Hp+2a1fxJq3aluSVvTtV5wu0fczwZAmlfavSqMRPnNCZmE92JFrMmh0sfFpdusL3xBMF1/piiiYTuZIeARyUb8TWvuqkVDla4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogewk2GqxyZhk4qra3R1iN0Isd8UxgdYdYLOlrEG7Bk=;
 b=k6dC70TppX8IdcqkDyA3Q5fffXJNM/2q1/fFCUY0/taKKxHbYlMeqCxTV+Kql3lO1m1KVdrtJj1IOeWA6uq/xGgbqcoIgX3ZO2tAQGbzo9ZVa+OaLYaI7T6YDc3GIPxb1241Ynb9ymVEHYEJIG/Jk3PoGWBx+XL/uFVNB39fA5E7Vu8YXxwVXRBNi2LzUNqGs5uKDL3oJzYnfgg7WZ9vnZcxKTID08jkXGSlaDavKdNy/YeWx3ZPCfuRkUW6DVsYBZQriR1/dcRGwqvMWriO++jyT7zywXEjJ+m5NbkkDC4bl4Ej5Soc+Stusy4kPF3ifnW7/6YXNRuGSvrjbsXCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogewk2GqxyZhk4qra3R1iN0Isd8UxgdYdYLOlrEG7Bk=;
 b=zoWKyuWfyjn81sv5TjhrpiksauiR/kESphpZK/u2MJZg8L6leBpG95zcvgCK7sxr0HCiqq1IcP3NkFdcY03rNfdV9S8zYe/gNbmdm5rVJnDs5D2fi/y6gZBjCDft23en1ps9YdQsXsg0Ne0S67i5EYANaS/CQuimqLIwKsRdfZLmWKGnrkr/nzQoyEET0NMNVy69MFU5qtDwCrBoZAyJOmVnhYuxjMyEtdFbpcvrJONImcCDFdGNNZ1lHB+tjatmNlFfJ/gqiz2HwpSV4kzHxT1D/yJEgIbMXD0F6Q6RmLgENV+15Seo5YSajIcJXVvOOxPloLqqUv8zSwyQ3+W99g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7309294-40c4-bc3f-0d19-a896a0f71594@suse.com>
Date: Fri, 11 Nov 2022 15:08:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
 <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
 <AS8PR08MB799165ABD2B1FA2BFD7B48D592009@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB799165ABD2B1FA2BFD7B48D592009@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0744.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: e529b98a-9995-467e-c05a-08dac3ee3f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QZvLKTWqqRs4/OM1kdJLw4ocX15Aeg4Zdrbz0i4E0dwf2gyRhu0ylkqJxa3pU1nLTkeHZ/5RsxjV+6q/aXssLJycpS3A/m9Tqcx2s/DOdeg0iT0mGH6hCIU1tUyOnzLlcogIq8CAS5CfDBEnwwGVmhDNaC5ghaWFH96xsdInNd8J4/DjAs1jFhrKdj2mzROOsgdJ2uOAfpdbLNFVB60EbIyu+vEu4RA4a4r1pfKpFfAEvc2KYUmJOJt+3U/3QWNGDe7bjbdkXAw5ayyGNQO49fLJhP7dOnmSWU8uG6ntkvUpcvLc58ADyB+AV5h+KqFn0ted1m5nwHoM98ZeFg0aoFLfk7FliCbvs1YS91k56rxE79Y8Fu+4GzNHa7FxSazScgKjT8mFs+A3oA3IAOauD5C+XhZgFkVHnHenXuN00ftrFjveId7AiuEum61V/9qCDGPateKM6nc1gDrQmo9yxgwav4Q1YCaJTFxjXObnOZN4mVCl+ckhba6WstAdHiCfu7dyPDPP7tBD886ghTeSwhJiwO6+wWSRz1Ify2yOcfhToRmQY6F1ZRTLLG1F8Gs1K0mt1u/MvkE8oTbIHTlajraelot/yoIMLQu+RF4iJFOe5k4ySzvh6ps/rGxrGWeNSpcYVbZxenDTtAOgwBzftoc6+RKDNfsU23zytFkcPcFvdheBOkkvTgjDGxcHNtD352qopXiId9/bbD5Faqq1mkR0DtYALLklxLq9Lls8PJi3mikSthxzGuedTZ+epd/M16gjb4OW/AXd+ZuDpn2bG0LhD9MdvMbpo13UaoRqZHhvArOVnzMpKU7cYSoU+TH19PnP6/JsdpgzWu77+Hfc9e6x3x0QyvzoT6d9CUZA9uFPiVueE+PAWisgDq/5iLba6ZldPk/ELj+tAdKDKZOZmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(86362001)(5660300002)(4326008)(38100700002)(316002)(6916009)(66556008)(66946007)(8676002)(66476007)(31696002)(8936002)(41300700001)(186003)(53546011)(6512007)(6506007)(966005)(478600001)(26005)(36756003)(31686004)(6486002)(2616005)(4744005)(2906002)(59356011)(207903002)(219803003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE93ejZEUkRka0Z0WWRWVVdMK2krVWRpY1VTaGhTMDN6QjJkNk1veGxicU9l?=
 =?utf-8?B?Yk0wMXVpOUVBUlRmemlPbzVlVUtCZDBwVFhzZUp5RlRqb2dicyttRUZmcUhM?=
 =?utf-8?B?WUc5OTRxS294NzhOQ0lWdHlIeXJ1UFljbGJ0amhETFJQS0RzcjdNQlJWK2JR?=
 =?utf-8?B?ODI5MUlaU3Mxb1VSekNBS3FRM0MyaGxuL1Q4NDFFZU1SdHhuUEZ6Z1NzcWNk?=
 =?utf-8?B?OU13OWc4eHliOU03M2pWMjBOSTdlMUdVbTFJOW9pQWJPV0ZkL2dwdEgybXN5?=
 =?utf-8?B?UUNGcHZkQllIMjdwUmNaeTlKS0xkQ0NMM2FHSzRwc09rNFplcjZKMTkwcStR?=
 =?utf-8?B?Z1VGeEJQVzZPMU1SUjZiY2NvSlFCYUlKSkQ2eGVkekFVaDdjTFp5QlhJYkl2?=
 =?utf-8?B?WDdVdnFXcTZyZjlzeVZUMmx4SDM1U0lRUERuZjBOQ2p2eUVNd3pTSHNDeUVy?=
 =?utf-8?B?cDVhb1B5MkxPMVJzUVc2RHBBQ3dmU3RFVGtUYk5YRGVQTURDUGEzRkxmTkdY?=
 =?utf-8?B?MWdoMXFwRlJKckJyM1RGN0xyM1liRmJKdldCY2dFYlVGYVFPaDhrQ3djWGdh?=
 =?utf-8?B?dnZ0U2lkb0NIL2poZkRpeGgrM3VGZU1GUWExZXFqNXFWYmtMQ0lYSlB3RFpL?=
 =?utf-8?B?Qnk3ZUc3U3hBSWFYTjdaYVNLWmtLOEphbk9NMmd2bVM1MDJpVkVPOW9RWndp?=
 =?utf-8?B?ZkRKNDVKTytIL3lUVlQ4MjJPR21zVERKZ29YYVpjdnpKZXo2eEx4V0hzdGR1?=
 =?utf-8?B?RGZZVE1ac2pUY29LbjFyODRjTU5ETUNlQUNYUW1HK2JYeW9vVjBaWnVhYmI2?=
 =?utf-8?B?c1JDQXdnbVowMEozZ1FxYzVlSjVYVDFLS0srWFJjVElzUW5uYkhHcDdKZk5s?=
 =?utf-8?B?SGpYd3djZzRKZXpMdllyQkN5Zi9XRmRIT2NZUzBFalI2ZGxaMlhueGR1a1dR?=
 =?utf-8?B?RUdlT2hXNDY0SDBodS9GYjEyT2NkaFl4YWI4LzJ5aGJCV3Zjd1RkdkM0b2dW?=
 =?utf-8?B?bzRYdWhUbjM1S2FwY2liaHRKeTNPN2J1cDhEU3pLYlJvN01jY1h0WWZSOFJQ?=
 =?utf-8?B?RnVzZ2lzY2Uxa3pPT0V3QUFMNVBILzh1cVg1bFZhZ2xmekVvTDZ2ZXFOQ0dV?=
 =?utf-8?B?STUxODZDeVBHbzhiVC9LWC9VZlN2dWlrZ1crT3JaeStxa2NtYys5WlMreFVL?=
 =?utf-8?B?OWdRZUJ3MFgxUGV3MlpHSXhZb2dZMXluQ3BMeVFiZDFqMW9WYU1mOHdvRitX?=
 =?utf-8?B?TTE1SFBycGhZWjI1VlpqVlhyNlJ5YkhRTERIUGlKTEsxMXBHSTF2WDJVRHVM?=
 =?utf-8?B?M25qVE5PVUdVVVpmNkg4dHNTNjVKTWRLUVo2SHoyR0J3VnpkZWVUT2FtOE00?=
 =?utf-8?B?ZEI4Y2Z3UWxKMWNMUDV0SW5pbHpnanlnM1hRYWJjRHptRHhUQTJoTlBhZXhI?=
 =?utf-8?B?THB3ODlKeGxibHBRb21TSVd5UUhXR3dNWHg3MWR3L1JrRTdmL1JEa3J3ZzZt?=
 =?utf-8?B?TWJ2eDl1dGpMRWVZZGlCOG85VmNTU0JqakdFVzR1SjNPT2wrZzgrVkdlNDB2?=
 =?utf-8?B?REF1b2JuMmNPNTRxVXllOGNuUEd4R1RGS3VDWHpPMUNNNk1QZGUyQ2R3TVlv?=
 =?utf-8?B?NFVjR1ZuL284T25TZlV5THZkdlNSM05UWHpWWjJrd2lUZDROL2FLNGtoYi9t?=
 =?utf-8?B?dklOVFNGVWszZWZyaVc2dUJWRVpwM3VVMkQzVWREeXkrNGZaWDlpYnJhdVNS?=
 =?utf-8?B?V1dXdEZLZ0lkR1k3YXBRWTRxRG5LV2ZDQzcrT1FZWjFrMVBLWXJqc0RHODV1?=
 =?utf-8?B?YW9ZMGdCWDBDajhCUHNTUXpHTGFqTTFMOURIVGNnUWlVK01XcjNUMWZ6bm5D?=
 =?utf-8?B?TU8xelJ5L242azVnQkF0bEpjcEhiUXU0OUVETHdtS2YzZ21zMUZnK0ptb3Rs?=
 =?utf-8?B?MGlhMWNuN2lMbUJZZC8rcjBob21BRVJvN09IaS9XOFcvblYzZU9wbE1ZWUJj?=
 =?utf-8?B?N3U3c1owVmpNV2FDL2FZeEpmeGxWK3l1SUNuQ2dzcnlUTi9pYzVHbXFEd2V4?=
 =?utf-8?B?WWN2c2NEU0FqL2wvYUp4MHF1NGNER0JNVmdzanMyRmFHTmhObmFVRDg4N3Az?=
 =?utf-8?Q?jq0BbVeFdDaPa2I9pTx+nh2at?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e529b98a-9995-467e-c05a-08dac3ee3f9a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:08:46.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bc16F++72i7qD1AQHZvkMwfo0Ysm2K5BTaaqyCWMR1NSg02VSVuogNbjUSUt9j/QkbPcMZ6drQ0mvjVG6IXXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9101

On 11.11.2022 14:58, Henry Wang wrote:
> Another question for adding another entry for x86 that worth to
> brag about a little bit: I did another dig into patchwork and found that
> this [1] might be a good candidate. IIUC __ro_after_init is a good
> feature that both x86 and Arm have leveraged in different level today,
> so probably the __ro_after_init might worth an entry in CHANGELOG.
> 
> However I saw your comments in [1] so I am not really sure if you are
> happy with that, maybe we need to change the wording a little bit to
> remove your concern? Would you mind sharing some thoughts?

My view hasn't changed, but if Andrew and Roger think this should be mentioned,
then I'm not going to stand in the way.

Jan

> [1] https://patchwork.kernel.org/project/xen-devel/patch/20220309123936.16991-3-andrew.cooper3@citrix.com/
> 
> Kind regards,
> Henry
>>
>> Jan


