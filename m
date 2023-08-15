Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A6E77CE5D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 16:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583980.914350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVvIa-0002nc-Mc; Tue, 15 Aug 2023 14:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583980.914350; Tue, 15 Aug 2023 14:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVvIa-0002lH-Hz; Tue, 15 Aug 2023 14:45:32 +0000
Received: by outflank-mailman (input) for mailman id 583980;
 Tue, 15 Aug 2023 14:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVak=EA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVvIZ-0002lB-A0
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 14:45:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60f46e6c-3b7a-11ee-8775-cb3800f73035;
 Tue, 15 Aug 2023 16:45:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7313.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 14:44:59 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 14:44:59 +0000
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
X-Inumbo-ID: 60f46e6c-3b7a-11ee-8775-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMzSDX5RieEjJ57fzEc+g/a8i+82vEoCabH8V4q9nxDC9CtYcHp8F/y3khCqbL44kW5gjja+n9yyjW/3+jAxIloIziXUsQmyqRz76XoeuaNdBxr6HBNmffapEE5Px4/kzOQ6d9qVSqR74krJytQvu+0YBOXTtkBpcMjU9IgdG2uzK1T+Aq7i0caFIaZD+ik2rhD2AyCLS7ebSY21OtznukOHYdRZ4mkqoQ5on9EZFTwLGF3g0YZ7EDYqVVryqE9P6jizoTyHoNaxiu9RvGAzy8kGsaNXuS/o1+6j8Bj5eNlwja3LipEoRRPgCXohgq+CmuCBws40+d3+74w6AynzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a+aak4G/OLfOQu1+EdiSV8E4LhINIRm+POauAxF5iY=;
 b=dbuCB6UMbu1ncCiHZy07ZXsL2MBVyoGTR9K3MH5nnx7uDa1S8OKUzlGjpakPlVX8BBqElMrE34ut/VAWrbEHJ/yPLVERw4oXosKu84+6szUGuEWdUyxcHL8MSlctPuvhxIdksToQjowUGUGRphFd4rZwr5Zvvr8Q2eLvgcETkwKEgLKFMGjKfL/w3eI6hZ/8InQMrFhWbAcZIkyt0uRI8Xkbiol0f0pz4IFK+s02YmSnuCjIrm4B9jW/oC8MjY9xREBw5bHWvdfBBQpl1dgd0A41++6pvKQSPpBtzQZORcHRcAuWxziDvFPncv4R2NerRl98S0htOpIYQ9WeHFQ5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a+aak4G/OLfOQu1+EdiSV8E4LhINIRm+POauAxF5iY=;
 b=Mh/O4CN7TMM99IJHRsnLwvLVGYyI9Oy0g58S69VsjtP99Y9QojeXsGPUcxGITmlLbViYgEjkLImVGnlFB4UcnidbEzLX2RxXX6SCUXF1WGJrTTpCTEW2XQ82Er4qDCGToWXW0CPhlDIXxBX9U9xIBGMuX1NChnPj4KUkSHnnbeQmB1cUj5SJnU4D9Z26J2wBbvBWF3oHGA4z5pP9CR3VfkFcG4CL86iuOeUfLy2CumP5mM7WTOYXv61zWXzruWQgbgX9pNnvxZGYiIYp/lMLdatuHP1sxjkzgNkls5BHN26UhlvaahcXiRwePbv7Z6v6okn1/2eP8iSd53hiSw/48A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3d488a6-514c-c3bf-890e-472cfb63be1d@suse.com>
Date: Tue, 15 Aug 2023 16:44:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] libxl: slightly correct JSON generation of CPU policy
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <c3fee3c8-c808-e2ae-b885-d24e785989f6@suse.com>
 <ec211f2b-7952-4944-89b5-302d9775cb4c@perard>
 <8400abdc-83bf-81b8-b2de-b80329afc629@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8400abdc-83bf-81b8-b2de-b80329afc629@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: ced3dff2-dde4-483c-5314-08db9d9e3347
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MHp4++97caESWye+R9YEzDTJIXRLYUNN9mCOb1oejU06UVSmWxVXDSLPyOyKeX4C3eckd6RbWwPE5RIrPVJf2h5q/vglmbYwHTkdgE2hgGzNIbFEwbMBph7Y98CG8y3L1r1Pl+uvFaINjYF6n2YtGBNS05BTIUp3I42ByoRte15WS5KdWvCstsFSeJVCAZjY7hq30wVZVyo0A8fKu8YPNGlLJy1StMiR62fH3G7DHyYd8og4Cm1L/MK8IXyyWjHo7nJJQzmeTLKEH013rThmAi5V3eALjBwq0iZotPX01QKc26D56juwI7IM9tLctnoKefZnXBTQpCC5iQEhZtTGnigaax3f3cWvSt094XhBNJQemNgJHP3Urn9fPgDmxSbxOKTkY5K6bNu4klaWa4JpcYmjRgbuicdpjiZ/EkJDRf6kUAQqBaUij+UcpVnC4wTw0w2O+/N29iD7Vf4a0ZdtPjyuR7bBtuVmxPaNz78rxw2h95nd83KY4bhzLz4CMStPJgWEWilRBnrlov63El878x9+lQ8v4r0Nrg3clnwgC4wzpsfQj60A5FLIMfhdtqYVf8Sq3fiGejXg1UfK3ReOaVk/dmhVd6BMywTjsgtzHmaA5Gocb6rKj1vKtvBuvfhTZ2OMcFRPgANlyT2ljeSKmw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(478600001)(4326008)(6916009)(66946007)(8936002)(316002)(31686004)(83380400001)(6506007)(26005)(53546011)(41300700001)(66476007)(66556008)(2906002)(36756003)(5660300002)(8676002)(2616005)(38100700002)(6512007)(6486002)(86362001)(31696002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGppb3habWFTTWNyalpjSDRKTkJJb04ya2hiWkxWdDE5dDgyckoyWHFGbHFw?=
 =?utf-8?B?VTJRaWEvTjNFK0JnYXdXN3BJbnZGODIzMTRlRTJiZkMvSTNPTEZianNqL1Q0?=
 =?utf-8?B?NzNNV2l3YjA3Nm5RTkt2Y0RzRFNMTStyZmNBam4xNzVFMFVsTXNvdStmbXRY?=
 =?utf-8?B?UHAyWmRNTWlZczBRUVVVWGVwckFiaHVGT3pPTjZQNlI3SndJa2hGLzg0WC81?=
 =?utf-8?B?dHFDZFNsL0dPNk9pc0JITjNLQVQyV01EdFBJYmZPeFhJUlRucC91L1BNK1hL?=
 =?utf-8?B?aXVURUZMRmFSdkZ2L2h5TVdEQUdEQ1NkTTJrdU0wbDltaEFSdWQwd2NSOFpU?=
 =?utf-8?B?WGR5TWhGZmJVNTNBeXlHSXJzZlR1VWw4S3FCR1FjM0hUV2R2cW9iaHdlc21T?=
 =?utf-8?B?OVJHalVzUlF5QStCMDV4U1V2eS9ycjJsdnFjdzM2bDF0ckhQTUl0NFFVT2NZ?=
 =?utf-8?B?R095TnJuYWxxcUxOYTFpZjVka0xwSE5DZVZMSUFsNUNPTXhKQWFLNWlhMW5B?=
 =?utf-8?B?MmsxYzVVOHRTSWtad0J3NFZtS2RLSlAzNkRiSGlJMGo3MVB5a0pxR3RWMW00?=
 =?utf-8?B?QmJpbFhFWFlJYVl2SWVHOEZxdy9OMS9hVEUzQ2lmWnEvVXFUVCtxZnhlajZh?=
 =?utf-8?B?TTRqVTEvVHBTcGVNRTBPM3JuNTVyMnFtbER5ZFptNXFFdnZwZXVxWm56OHFF?=
 =?utf-8?B?Z2FNbnN3M1E3SWY2TVlyNUlwM2pNdm1HZllvd2FOZWcramRpT2gzSDluVzRw?=
 =?utf-8?B?RHFMc05kNFQ0S3lFbTJqMnk0WWtOSHY3OTFBWE9Cc2NnZTRDcFYwakhXUE9X?=
 =?utf-8?B?Qi83VktZY1djSSsyUUJwUWRhUUFpNGtMdjhBelNheUQzWlJ6TkNCVW9rL2NR?=
 =?utf-8?B?Rk5EMkNwZ3A5UHJoSmJDTmY1Vlp0Z0twT3U3YWV6Y09SSHNwNFdXajlIZE5S?=
 =?utf-8?B?YXphcnNWK2syd3ZLZGJ6M3lXS1hIdTZETGxJNnY5aFZxSEY2aFVkV0ZWcE1K?=
 =?utf-8?B?NWwzOVlLVWVkM29pVHQvZXdzTC8vYzRtc1lOSkorSk0zR3NyZExTZzJnRzk2?=
 =?utf-8?B?UGJiN1BzdFlzVjhmQmcyRWI1KzMvVlBNd3RpcFJBZjllMGVKQW56RmVycUxE?=
 =?utf-8?B?Q1QvWHNaMUVRZVpxTzR3N0U4NytWbDFKZDNwZi9IcnFUQlpWOGtndW9tcHg4?=
 =?utf-8?B?elNHVzVoQlRQMWhoSW9LazFqUy9ndnBudUpKRFJmc1Y1RUpqRTMvbDZPODVX?=
 =?utf-8?B?RmdEb1R4UGlTOCtlZllHRjhuTkpHbXBYWnJuem9LNDdhcUlTcVV3OFRZUWV0?=
 =?utf-8?B?d3FwV2UxMjk4cnl0MWZZOUlnait5UVlROXZ0b1lKaU1YdDRld3VDVjE1WE1N?=
 =?utf-8?B?UjZkZ1lQWjBWQ1E2Z2xoVlRVYnVjNlEyY2VzUVF5K0NWcWlsVlpsSzlTOGZO?=
 =?utf-8?B?ZEd2OEpKMWo4MmpUZUluZitKRjRFUUU4ZU5VYlZrV2RKblNPbVYvWHpRN3NY?=
 =?utf-8?B?ZXFlUUF1OStXdm93SGZZRmVZSEtDZCtUNEd0eEVoZWZDVEVoSHFvTFJWVWQr?=
 =?utf-8?B?VTFhNjFGTTMrUmpTVW1ydE5CS3RIN0liUnhKdHVObjNSSjE3djYrV1dJZXBQ?=
 =?utf-8?B?Skg2SHBKZHlmMk40dkZheXlFdHlIZXR4ZkxBMktZeU1EOFVPamV3elN3ODJw?=
 =?utf-8?B?Szd4ekxFMmVJU1pUNGZ5dXRCaVBRSDBpcnlxTDVsbGR2M0pTYUtBRmtCT29Y?=
 =?utf-8?B?eXhWQVZGVFg2L0pkYWIwWU1EbzBZd0dWTHZwamhJRFlwVDc5WEgzUGhqcG1F?=
 =?utf-8?B?L0hYd2FnV25taTE5N0doSXhoSm9kNzkwQ0xPOWw4WWoyMktVbzJIc1ZqVklR?=
 =?utf-8?B?RnR5djhRR2l4TU8wSzJQYUs0ak9lQ3FIUkk5M3VoNkxCcHAza0JpOEJBRGlK?=
 =?utf-8?B?dTUwK295bHRnb0Zxa3JyZ0UyQVFWcHlRd0J0aDhscytpbW1QMVEyZVA0U3lB?=
 =?utf-8?B?TFZqeklVdkxxTmZkWStBRlhkVUJCeGVpY2g4cTJaT01WNTN0NzlEcC9XVGNZ?=
 =?utf-8?B?aUg2eWFtcG0xUTZ4U2p2SmZxR09ETHZaTGd2ZEE0ZitoRE5ZYU9PVS8vVy84?=
 =?utf-8?Q?qUJshVtW8KH5yn6h0Cb2kuSlP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced3dff2-dde4-483c-5314-08db9d9e3347
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 14:44:59.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJSISZtGAMwA688eOuvFGCaoyV4st79uQVVPoo12bUezx2v/LPA+vcf8311NaInNzCnYxAqB736wJJymdKtikg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7313

On 15.08.2023 16:28, Andrew Cooper wrote:
> On 15/08/2023 3:26 pm, Anthony PERARD wrote:
>> On Tue, Aug 15, 2023 at 02:35:55PM +0200, Jan Beulich wrote:
>>> The "cpuid_empty" label is also (in principle; maybe only for rubbish
>>> input) reachable in the "cpuid_only" case. Hence the label needs to live
>>> ahead of the check of the variable.
>>>
>>> Fixes: 5b80cecb747b ("libxl: introduce MSR data in libxl_cpuid_policy")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Hmm - this was included in the security backports.  I guess it ought to
> go back to 4.15 (now that 4.14 is properly dead).

Depends on whether this is just a theoretical issue, I would say. Can
legacy format input legitimately be empty? If not, I wouldn't bother
putting this onto the security-only branches. (Guess how I found it.
For the 4.13 backport much of this needed quite a bit of adjustment.
Pulling in more stuff from 4.14 isn't really an option, not the least
since I will need to [at least try to] go further back.)

Jan

