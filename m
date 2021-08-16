Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8863ED529
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 15:09:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167336.305435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFcMC-00022O-3m; Mon, 16 Aug 2021 13:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167336.305435; Mon, 16 Aug 2021 13:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFcMB-00020Y-Uy; Mon, 16 Aug 2021 13:08:47 +0000
Received: by outflank-mailman (input) for mailman id 167336;
 Mon, 16 Aug 2021 13:08:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFcM9-00020S-UX
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 13:08:45 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 151284de-fe93-11eb-a45e-12813bfff9fa;
 Mon, 16 Aug 2021 13:08:44 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-o_Wpqe2UNCKzYaEpvF7NKw-1; Mon, 16 Aug 2021 15:08:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 13:08:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 13:08:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0236.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Mon, 16 Aug 2021 13:08:36 +0000
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
X-Inumbo-ID: 151284de-fe93-11eb-a45e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629119323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5azVcgwWP9+6tMcIcckGSE2Y3aiVNJlyXCWibodJzg=;
	b=lWriwrJLJZRkMupviypgyAz27BiWoSyOQZM4RJzKEz6UJsZ8KtIlFwPLzO7jAv2Ldcm5qE
	weirD7y+EaTLsNDsHI5EvKDV0gxILTBVh33JAjItcOrP6Vojli8iQt7x5ddF+EikNX5uX8
	GB8WV+zyAoTX9ozcJkqimNElZbqo0+I=
X-MC-Unique: o_Wpqe2UNCKzYaEpvF7NKw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0wfOwkGK83Cj2XqMUBu1PFG8M2rnpEJnlgntUuGEYO6R22JOaVVY5YtZU0iwx+z1d/tQv2rn4JOYwRja2SlIp2qlTpQ2r0TDxFbnb0TDnEE+ZyJQB482dEAYjj+Iq+2ZJraXXttHoUI/wf14vxes8Q9A/JABMMPYH/8wbv+z+bRntOXKCGWYh3wPtNsQmu2H6j21XBhu+Ks9U1pZdaxWClBysCs6PgP7gnlsivj/H2u3GlyUp3l2u/gKNrj1QqBOFSobAja2aBMsePFdF0UtnAJZfKTatvjZMwIW2ZRQy2qkgSaYOMiIVQoikLSI5qZM/gnYWFW0RfGPp05zYWNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5azVcgwWP9+6tMcIcckGSE2Y3aiVNJlyXCWibodJzg=;
 b=jECgMyNh76l3y5S+0qgPSCHRphfnde4Zhbh8DqVGrbVFxPIoOVuU5cS+Sl+eIMKDet5ARQ2G2UQXwkpZX7McVEXt2GK+LK7I1ctTOAdpkVsDleO5eGs3x3HEQYy60meXoE/2VW2A10dXQM9tAX/szKYxvQ2hLN+zBQvmvkourYmWynq/9qIvfKL1LRIRv+52BlnLuEze/cLY7vVjrXV/IXBb4ZFrBpXKqN7VkfN5A71PJezl4CbEfTq7h5F8Jy2L8ug4KpwB00QvBilPa5grOQ5KUw8ecCVQ7JFd5d6l6kyycYwapUy1au58PvAt1VlWZxcumwmwHWE5+4JS6aWpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3] x86/ioapic: Remove use of TRUE/FALSE/1/0
To: Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210816124255.27405-1-kevin.stefanov@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <57dbe75c-4dfa-f640-ad8f-1ba5c5af628c@suse.com>
Date: Mon, 16 Aug 2021 15:08:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210816124255.27405-1-kevin.stefanov@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0236.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf5edc70-51bc-404d-2bf1-08d960b6f5d5
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2446F1B087DB498F653CF347B3FD9@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qE8YH14ArMCkebbv/55VXqtcwOh2Pr+mqrPl6sPwKnsIPAo0fpHxpglwPVGlCYAKoF07SQBeYJqXp05EsyPN6AbhkWk/KELcQ/IpPMpmytTZOJ8f1RKUP26BTi0ny/3Bcp/nvWRptGe9WNZrPoUIzd381ax/jRcqOtSF5coy9KBgiBbSOazVXJXaJJUVK5bJ9rYmzQoputWA4NcYCCBMOPWkfyhwUTBqnA/fkV7bL52qLcvKj3y+PYlxJ/+npgLoqNxaWdbQBFWginlcNI2ifAlQ04CRMuQMZ0yBWgquYDjtArmH83s5rvhYyJLGU+lCshdIzsdGchdQvXuY52uI9gi3K03oArmfhNnpwPvwNclFpuE9VQ9f7Azsuc06flFvJBhb80R4DqZHvLLkem8gLUuN6m9cFAUcHhmbBWyGhSMcchdrflV/uxhwLEEd24Lj79pUSfGoKmLjkxemOxX2XvZo2KubZI4KJ7eJ9ZF+nk45LLsanzMjhIEY4xmMGwlzTwEtTehoC37HEwbZDaAwFmLJtkHQC9NbgPaF63//KzDeLEUWS1435QmF4iaU/kqp9oGlc3pzzBJeu0itxq5zJRkj828jOZi3906RRhWa/RZOM4okKVSP2+dOEfxApL5heB45Q+JTqI2mHZtOpjyrTXxYKcAk0+fWzrejceZMwPfqMVYTjeKwLR/7vpdtrT50Cauo55cZN/+jx+56Y0x1wbP9X0lNV3Vru8Zoq3nccqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(26005)(66946007)(53546011)(16576012)(2906002)(8936002)(31696002)(4326008)(478600001)(5660300002)(316002)(66556008)(86362001)(66476007)(54906003)(186003)(8676002)(31686004)(38100700002)(2616005)(558084003)(6916009)(956004)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhwR0xmeDdHTVBOTzhJaHI2VTJSRXBpejIrblNwdVFOQ0h3d2xLb0MxZW1u?=
 =?utf-8?B?TVZ1c2NuRS9MUU02aitpMTloRFNVM051VWNnbUVUakRoZ3NWSnByc3hleWRm?=
 =?utf-8?B?Rk9BaWVoSVVjbVRhL2xRVEl5QjFteTN3Y0E0eDBoWHIyZm1scEtsWXVjczZW?=
 =?utf-8?B?TDlURFVlMHN6OFdZclNJOTRQSlBFYm5KWWxta01VOGJpWGUvZ2VaUEZyeXVT?=
 =?utf-8?B?M0tTdkJSS084S0lDREtHOGFIdjAraXBPSXFha0N1TndETzFJSFZrdFZUS0JI?=
 =?utf-8?B?R09iZ2g4ZXFUaTIwUFJaYWxBUVp4R1RxNlRSV3dWWHZuYmpTS3hsU0FsWDNC?=
 =?utf-8?B?aGc1dHU4MnBZQWNCdndKSktLQ1oxblJ4RXB4Rk9EMnMzTmFVS2MyMWc4UnRn?=
 =?utf-8?B?OC9qZGxRMXVTS056cGJIQ3NPd3dKWXU4NEprUUIvS3FOUksvMGp3eU5kVkRw?=
 =?utf-8?B?Sm90ZWw5a3VsUFRCUG1IYys3QWV5Q2VCbCszQ3lueVM2SG1uZXo1ZGZXakR5?=
 =?utf-8?B?YUhLNXhYaTFXamdjRG9xSjJNRnJZU3NCUStzRVRmYlBSRE9xN0RNbGJlMU5w?=
 =?utf-8?B?ZUd6YW5wTGo5ZERRUkFyeFd5eTBnUkVTQ0QzTHJTVmFwcGorWXgwc3NyTk93?=
 =?utf-8?B?ZkhEVm1VRkFMdTNSUElwaHZoQ3FBTHFBa21IOXpTU3I2SExvQldrMkxwa1Fo?=
 =?utf-8?B?VzFPWXNSK3FwbkI2c0dacGdDK0hYMU44ektkLy9KVTc4eS9HelR6dlVKcjBU?=
 =?utf-8?B?alJaOGdXWDZLR2UwV3ZxZUZ6ZnpzVU5RV3NMdUFjeVRrbFBPb0h3anNJWS9j?=
 =?utf-8?B?Zi9YMVROVlV1NGVGeFIwa3IrRXNENTV0N01RNk9td1IwOG1hNCt2bW41NkRP?=
 =?utf-8?B?dE0yVTVrQkZvU1gzUWVud2hQVERSbXliZVBWV2dxQVFlLytuLzVER2FkNnlu?=
 =?utf-8?B?VWI3c25PODBTTFU5ZnVVNnhOTEIxY2RnK0VVMmJLSHFEKzBtcHo1U3o2akhC?=
 =?utf-8?B?anBwR3pYRTlLbDFlM0NjSUlrWUFNM05ndFRqbnVmUVo2eE9ZTStCMTV5Y3N4?=
 =?utf-8?B?ZWlCL3RtY1d5QktQcFFDVUJJL3M3U2owMUVCY1J1ZlBDU1M3STFUeSswaFBB?=
 =?utf-8?B?UWkvY21QYWE3NVVqKzJaU05LSlRDbHJONU1aRUZLQ2M4V3RjaUdUN0ZvTndG?=
 =?utf-8?B?VGh0SXUzeitxUzlaQlBDMmpkc3UxdG4wblZKTTZQZlRQcWhEQm5rMk9aR2N5?=
 =?utf-8?B?RmtGdkh4bFpGL2xVdHEwSS9ZRmVMSHJ2eTJBcGVVK0pRb2hiYXRwejRmZzBy?=
 =?utf-8?B?UHpsVlFOOUY0QjQ5b3VvVWdFYW9iaDVpNXFLWDRFVXRod2J6aEw0ZU1KTDZz?=
 =?utf-8?B?YnZmb1UzME9FZnplcjNkcjVsbTFNRmhpay9ybVpwRmxlQTlraVhTeTJwTEFx?=
 =?utf-8?B?cmQzMTVsMTdUU0VZWUU2dFVhMlhVTnBvZ2lRRVJTMzlLZ1RmamVpemtYNFEv?=
 =?utf-8?B?NC9pbG9LUHhDZkE3eDBGL2p3UERqbG5RZ0lvVDhGdk8zQjU1M0k0S2RlQ01s?=
 =?utf-8?B?Tk1jQVlxZzlQeWNTU3Rnc2pGdnUyMHlodHZVYWZTaVZQS3JwMkVyQ3AwanRv?=
 =?utf-8?B?NmEwbE5IYi9HTmhScDRjWTJZdzBuaG5INGhUOEFvT3FEMVhPVk5qMjlkOTFh?=
 =?utf-8?B?UUxqb0MwZ3VQNGQ3bjAwa25ITlMwbTlVSjhNc2FTZlBqVTZFdWR1UkJGeERj?=
 =?utf-8?Q?OHHGTevKcU67LWhg3ZZVKGKokSlnpsth3cq5PXM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5edc70-51bc-404d-2bf1-08d960b6f5d5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 13:08:37.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpKRKbGFauwtTKmV4AercELfiaajnnqgr9F93XLbNAvFCrrf0u+xwS66967ujMawTxGrVtmwgLwko8b3gFgvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 16.08.2021 14:42, Kevin Stefanov wrote:
> Also fix stray usage in VT-d.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


