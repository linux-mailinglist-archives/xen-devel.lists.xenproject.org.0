Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D97683309
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 17:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487748.755439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtr1-0003ie-Hm; Tue, 31 Jan 2023 16:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487748.755439; Tue, 31 Jan 2023 16:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMtr1-0003gx-EO; Tue, 31 Jan 2023 16:51:31 +0000
Received: by outflank-mailman (input) for mailman id 487748;
 Tue, 31 Jan 2023 16:51:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMtr0-0003gp-7b
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 16:51:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e1c70a-a187-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 17:51:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7205.eurprd04.prod.outlook.com (2603:10a6:10:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 16:51:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 16:51:25 +0000
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
X-Inumbo-ID: 80e1c70a-a187-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2ep+/ELOFpDyYX9mEJIPQMx4az626oq7ZmSeX4pPL541UqmQlRVIRQtthQP0Nb0ZPOAnf4wuNg64oWzsmqEFGpIX6jcUAWxPN7XENCxytBiF5wV52ARu9VsCxP/M15YZSb6Ngi52FRlAREiiS50jdVEoInaeqScqgD+J4VaVg4GgvdexPeoPkyuyGwZsYGS+pbpYKXHOAPMAOkF6sZSERLAgD6bj6zf9TlOtyjjIDbO3UVO402pe+I9p0sO/CbwAgq6QUvKcjpTcUvL2unGmYLFY6NVsqJJZ01bxI3x0NLZUxjZ7ztG9MpbvCVhROp9G2jFJBaQH1k2UmRqZUz6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EruNCHzPhzQ4V1UOEwvU5gmSguaQemeDD1dhPH6CeEE=;
 b=cuSBYwJnXVaJHaSfreQmjYG8ogc4gFGe3ItVado3XCg8P5crxea+0IqHO1/Eq7b/PpcKjZ8BXj5Dk3mzfTd3jcoerZbKpclZIsUNP50Vac315XGH5hYqJLZ/JhrFUA9kw4fV0Is4/ayw6Wez9KIl2dl7pymoo8iC1dQctKhmoUceQocn5pOu1W4BOvVXWyTpXkCmLO4TyLjvtYRAfOiC1ArfahqSlekhi/QRK0mvW7QCVTbgfuwhn7pHRIII9EgumXF1DEwwkG9aP2MDR//zTGeXNHxvnARv2o4xzUFbSc+bgZ3owMQDynik6TTXJjuX2FwMkWZwFvDOtARBsMdRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EruNCHzPhzQ4V1UOEwvU5gmSguaQemeDD1dhPH6CeEE=;
 b=X/WpDXpSk9eEEMTbqGp+CLQqqG9dv2QFROkVzKvixmq2s4fldsXM9U/1owIrwD1e8zcm7EEo4CbU3Q/QIeeb5FbBdZY5QIzmH1FyXZC7eve/IBBH/Z5QMThD9bde2zNpI/m0on0zZGElT5H05QEOhQCH53d2xX3he/5Ge2Cm0aJfZhzdZuV34+WFudrts6dPWN6dsz1tFguPw2dUvjCxoxmTBe8VniJtC9d3o7Kcyg131c2EfWcBFblBLKP6p9b1tqxYot9qFuqGAyjrO8qT5qeUqE2/0h672VYGq7o5vm1WGvn93dsCyUNWmasB7l+Na/AUkQSKX05NwggeDGYCAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea7dce71-17fd-467a-3f09-c07da48997a5@suse.com>
Date: Tue, 31 Jan 2023 17:51:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH] .gitignore: Only ignore hidden dependency files
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230131154235.19845-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230131154235.19845-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 84771236-7190-48d2-0940-08db03ab63da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5NPLupF7H3jT2sYm8lQbj6fTHBLS5FdwPqvfwADVnHgcmApqmQCjX8Sipg1JQLbmVdADDMuFHFzZN0BdqcgV57g9B7Ijcs6/rb3UTob6IYRlX7F3a5tZESdW4M5ED+iK/jKZneWuB13PaT0ZJJ0lmm67Bn9Bl93GrYLFSExW/9caqnWuH26xXcIEW8NKv/kJlpH/lBEFmMwoUa93B59iF3hRJe3atcvzZsSGY87rb1CxMUwmTwke0UtkCaFvkQBBjebz3V3vjQrMdNNi0uobJ2cO/WxDk+PUzeQ+8EguFO1eb/O9bW9tPe/ouHuhaHYenS/EMwrFleOMoAMUw2DGjjUY+1zXwQBedkyhT7eZphoYhgliEsJO/AqmFv0rnHZr6PV5OcPnL2IY2ZXs/Dtcxet+YJnYM9YkwLUpeIf+J4PrwvyjXUG3XnNV3zGHC/0b0+SUEW4NwZ3WtLke4aDt0cBAXbeORbwk6BZ1b8jIwox+qttDxeA7dtflb6KJJcAtEdiG/yzRTZDlaSh6RH2dH4EOSZ3TuWZAEw6d+LQwv7/4GaLkB/H/52cC11zDLruEwAKCjgpgoV+9Bmao2luxYwIFxorfNjxjKnX10SR1mbxlz5D0wKBatrGx/bdeJz0Z+Vq+7jkDB5+kP+5GqZf6F+7Nq6M5BR4tSNokqg5fRKN/b1kKG8MrGyZpwDzAgse81K9VdhZ4msDXAofK8YKKziOd20djuxGStiLu5B7+y70=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199018)(478600001)(6486002)(31696002)(86362001)(38100700002)(26005)(2616005)(186003)(6512007)(36756003)(53546011)(5660300002)(54906003)(66556008)(316002)(66476007)(66946007)(8936002)(8676002)(6916009)(4326008)(31686004)(2906002)(41300700001)(6506007)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG9JaDJQTUlncVVyRlNrdGN3VmVUWWdMdlZESnhPdCtxZnoybm12bTBNR1Ft?=
 =?utf-8?B?VHBrNHh4cWZDSUowNS8zam1TUVNyaUJTZDJ5VUt4QTlndzVYRksrRVRsbHJa?=
 =?utf-8?B?bll6ZTZQTjZDRnFrYnc5MVdsVXFwYlhzYTVqTnIyQ1ZSbVRZRTNVQkpFbXkx?=
 =?utf-8?B?dTBOdm1KVTVqdTdRMXQ3OFpDdTQxdWdZK3VsVFpoWWt2TnoxcUpkb3hkS0hm?=
 =?utf-8?B?dEs2eCtvdUNBWk5hWVBuY1VjL3pwTmVVcnVmbFBQWlRwc2w1YjQ2MlRvZW5y?=
 =?utf-8?B?RUlwQmQ3OE5TdG9oV2lIV3hZTU04SlQzdjNReE4raTRnYWFVSHdkT1g1VkYv?=
 =?utf-8?B?aDVONTNNd3Eyd1ZXaTRmWHM3MUN2S1BMa1QraXYrL2Y1R2FhVERpMDBYT2JZ?=
 =?utf-8?B?NUlLSmE1Nk1vczVvNHVUU09BWHdoR2RIekh6cENBMUc1cXhLZDZOYVdqUVZV?=
 =?utf-8?B?SjVuYXZaT3NPSU1lK0FmeW5CSTFhK2cxRXNVNkdaT0VFMFRNNWtTVkliSGkz?=
 =?utf-8?B?SFpaaEJLS0MzZnh6SUlkUFh1czMyYzNTbkNYSk9CVVVyQUsxQURPZ25tQ2dV?=
 =?utf-8?B?KzhESTBBOUl2UVNhWFJGN1BVN2FaSWJ1M2F6K2lyd0NzSzZFVGpoYVdKUG1k?=
 =?utf-8?B?NlR0Vkg3SGNaSFA5cWZObGYzWG9Jb01tOWlBbmNLajlFdzdqMXgxNzkwVmd5?=
 =?utf-8?B?SHpmdGs1U0NKdXQyWG9LY2g5RlAwS0c2UkNuNWg4L01WWnZiQjVwc2VRMlBK?=
 =?utf-8?B?WEhZb1EzalhHY2xyTHlxby94aWpRSXlLbzdGVEFPRjRsWm1QaUNIdjh5QnBH?=
 =?utf-8?B?UEFZWTQwVW1jOU1pYk1LZ0M3cEZneFNneXNVYTJtZmRqMDZkNEVBM3BKWTM2?=
 =?utf-8?B?TnlVTFVPdzAraTBhbnozNVU2Wk9ZZ3RUenRocXo0NlpoUDNQYXIxWVlRei9j?=
 =?utf-8?B?cCtkU28vaVB1bnlPQU1BT2dKemxWL1Vod1dGWXpZQmhLb295a3VnZWlRZDN4?=
 =?utf-8?B?b1JMU0E4YXlUUkVvNGFBNVhYaU9DUW5mSmlwdXpBallYWlRaTkpubW5uT2d2?=
 =?utf-8?B?eWF2b2szNGN6Vm5ibk5qNGl3TXV2cUJvZTV0RS9maEFNN1BwWXlRT2VQUmlr?=
 =?utf-8?B?QVJhVjBVenJqSGhWRFZsNVdvU21tNnVDZ0ZmcDYrNzMrcGwzZWJ5MnNwUGRS?=
 =?utf-8?B?OHRsL1lsR2g5WnZNVzdGTklWR2I1TVBnTENwTDNZUVhSOVdMODFUQzk3RVJx?=
 =?utf-8?B?cXU1Q3g1S2FBMEtneDdQWFJIUTRQVnlzSzdOVW1WbkJJVXl3aXBIMGhLbmxM?=
 =?utf-8?B?QkFkbEthNCtXdHNqRHQ3T2UrZ3paRW1xY3BwRUhVWDdUUG1HQ0ErNEcyeDlv?=
 =?utf-8?B?NFJIQUtpd05NMmt0Rk1pcksyRzV1b2xQN01BYURSQjg5aEo4UTRwM3RESUoz?=
 =?utf-8?B?MmU1VTNsZVdFLzJMeWp1STZQMjVPV3ZLRFo3VnRJY21OQkdLNGF4TkFPVlNv?=
 =?utf-8?B?VUFHNXhhNTBUbUo5U09UdTZEZEtkbTBEM2dHUW5Udmw5YzFKNjAyNzlLUExw?=
 =?utf-8?B?Nk1tUnZqeFBGMkUySzJlZDdVWlJWT3M5aEFwZWUySE4valQ4SHlwNWRON1Q1?=
 =?utf-8?B?SXQ4V2M4VXdmMTdVSk1vWWRIbWY1TmtMRU44TmZrRUlUK3BCYy85VFp2dVlQ?=
 =?utf-8?B?eG5hNURDN01sTm5vV0lRM3ZFcmt1VEJwZ1MwRktudHBuRWNYZGN1MDhmbzA1?=
 =?utf-8?B?QWpoWE14ZFc3WVFMcSszd3R5YzE2aHB6b0lPaU44RGw5T2pCWlZhdGQ3TUE2?=
 =?utf-8?B?Zks2YTErdm1qaUJVYTV3a3M3Qk9IOFZYUEpwV0w2TDlJNkhtdkkyWFNpUUUy?=
 =?utf-8?B?NHR5RWNENEZZMHBaSlMxV1UzQ0E3V0F0REdic3pDbEMyK3pYdFQ3TFFQV2Jk?=
 =?utf-8?B?TlJ0UnVWWFMra2lBSmI1Tno0aWp1d1pSS3hjOEJ0b1gxMHNLZm13U0ozNmR4?=
 =?utf-8?B?SG1vTGsyWlFUS3NhNitmVU5TVml0V3UwUnArS2pJSFZucEdtcnlGR3BPdVBs?=
 =?utf-8?B?UzdENVVZTHpkM2xCMTFNeTRmc2YxSzI1M2tKaWpQa3cxbldhanBMQ2pycXRq?=
 =?utf-8?Q?IB7QhdcmzGDCvBwMxQJNt7sLI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84771236-7190-48d2-0940-08db03ab63da
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 16:51:25.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKNlEk1COGJ/qbl2kswi89/PVJRtV62q4+9exwyfmV/DxtijtQxso7VMNaN+bTGejghjKajr28L5Qe2xqu7hTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7205

On 31.01.2023 16:42, Anthony PERARD wrote:
> The current pattern also ignores directories suffixed with ".d", like:
>     tools/hotplug/*/rc.d
>     tools/hotplug/*/init.d
> 
> Avoid this by only ignoring "hidden" files, for which name starts with
> a dot.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



