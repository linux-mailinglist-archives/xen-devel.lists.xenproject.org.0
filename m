Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE5447798A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248096.427913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxttN-0005eY-Uz; Thu, 16 Dec 2021 16:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248096.427913; Thu, 16 Dec 2021 16:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxttN-0005bf-Rl; Thu, 16 Dec 2021 16:46:05 +0000
Received: by outflank-mailman (input) for mailman id 248096;
 Thu, 16 Dec 2021 16:46:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxttL-0005I8-Vj
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:46:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a79b7e07-5e8f-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 17:46:03 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-W92wN3llPqOgmPpkdyuwtQ-1; Thu, 16 Dec 2021 17:46:01 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4787.eurprd04.prod.outlook.com (2603:10a6:208:c8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:46:00 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::9959:195e:46a5:d015%7]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:45:59 +0000
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
X-Inumbo-ID: a79b7e07-5e8f-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639673162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I5oa3OCi82tSIPEPIb9pAdy2lDg3SCyuLi91/DtcXSY=;
	b=mnYjLmfH10mQXviv4MCYT8VSaREhQj0idLIUkLqqXeOyqrrVImccE8Q4ffycBFiSbsyzaA
	rPFead+eoxw1Q6BKIauPcEl3TT1pr6E0jetVMRZYywYIaQkoNvG1izYTxYL/gh8HQ7FY91
	lYoIgrImMnNXr811vImdJ8+RT8X5ShM=
X-MC-Unique: W92wN3llPqOgmPpkdyuwtQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9ovmu//guZPzwWygURPyCp7NbrInc6QYWSX5saps8eY+Jhkzgz2e0OVa55ALWghpVh7dajKQ+ljenZZSNBQX+xPwdqnb4JEckf7GZ6tCGS2IT5Ie3A7jPqgurqT8L0tAnkiTVw9Fzod3RK0hNO3lKeevXqj1QWf6BMpNa2v30K01+ZIgGWRNRNkbjXGcZumhZ+585UWprF6F8nwbj8O0z33DUuBlaCKiNhEo4IUOqjfsRNYSz1xnTxIGVJadd0jFtlYup8faXe5j0v4bxZ4TCmGtda55o2jtyb7q4WwWz0ufwBPooexZyNSlck8vbnGsKu2fkPgfgBDYGSp5wciCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5oa3OCi82tSIPEPIb9pAdy2lDg3SCyuLi91/DtcXSY=;
 b=cxZuI/zc1Hc3fov69KpK/TLaNKvGHQXeImOQolcMs+gweMxzbUon3Zdnv2O+hCW0+8uZEsbNor17Dpn24GX/3+QPFPWb7Cv10Gi9NL6hk8JKhxKAMwthbz8A+lT0cajEuF24NivFqN7TyFFrgT2vHwWzHmCWlrlhE+Ybi85+iTTEQiD1yRvPRgi9pFt7Sq8IpCyyRlBeBIGq6jtw0OgefMICh9sVm7j0J3kvAkx7HQityH1mwI+z7UdOY0vdo785eqiwFjytj0uJDOAJpY7sF4kOW5K4tNGC/6z0cybUMNxP7k1KOyDSzN8Pgdz74J2G89JZDrcxxceenVeBaokx+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0533588-6455-2824-f959-90d3c60f57f9@suse.com>
Date: Thu, 16 Dec 2021 17:45:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 3/4] x86/cpuid: Introduce dom0-cpuid command line
 option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211215222115.6829-1-andrew.cooper3@citrix.com>
 <20211215222115.6829-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211215222115.6829-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::9) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 915ccf8b-9d19-4a5e-12a3-08d9c0b38a10
X-MS-TrafficTypeDiagnostic: AM0PR04MB4787:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4787916E8566C1F28A37515DB3779@AM0PR04MB4787.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Od4QMZSrkd99qREO5yFbGN7LAhTa576ykRUIf5/AvrqkEppxUg3dBFZAEySymxHOxgdeH1YpsJ8zDPFzBKVHszE3XeZP0mhTAbZQy0yPTuHwGqTps50tfgaTZhXThPud3/Ng+WShNb4nUc147r82yIWpHe6Nz+uuu8n528UaUkplkLerIrc8KU3BzZOedmGUYFEuUl3kg6Ej9fuEQusJWmgF/7eX1e5vsa7XF8lry4BkSABoUoeQKSUIOCWhAEK8GB7CALWyzMly4Ohkd7OSVlAEEt5RgLedcqTmqaJoVr7i0Gx/NnKvd+LK7Bd2EEIAsX75Go3et7erc1XmdLWjiH1j9Hfqo+RFok7FduCGbtwJQofNI8KxEaO8thIxwu1Iu3CUd02cu8ZkH3H4SvVHzzYPfxPl0608O0Dm2s3j9DoX6x5LPHdZ5V8wr4pDwuA4b+2zXRVmuMrLNkzu60OwrqkrjJxEMjYrvmKX7c+FrjSPpAzzF7/5cQbOi1+dIz/jzl4iJcTeG4IW3QOeVhLjhXMlvZvOorKf3IpTBuWxjEpPm5l5iiIdecf+xz3VmdcX6fLwWg5soWvNeCF7KsH/NlBZtV8hzFLwxgM80rszgjiWWET0UoswM0/BdTzbfxmDjSal8fBU0cGRzOXhDZU8LCh71sVd+Sn56Kbv+HozE7aD85isssmBlPaP3LHLXS47FDKHMT00kHPu79eM8qPAKGvt9YPAtg3NO5KWKNoFGF4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(2906002)(66556008)(316002)(4744005)(31686004)(31696002)(38100700002)(6916009)(54906003)(6506007)(53546011)(86362001)(6486002)(4326008)(8676002)(36756003)(508600001)(5660300002)(186003)(2616005)(66946007)(6512007)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2xBcFYrQmFMWGxhMk5mTWlLUDYwS1lvbDM2dkx0VlhrSnpiSVB2SjRiTytH?=
 =?utf-8?B?ckVLOFRkeHIxOExJSHhhdFpiNmViT1pMRzdKVlhtVTE0a3lPK1lGU1JneFh2?=
 =?utf-8?B?ZlBib0p4QzJFTC9tZ1N1RUZpL0hwbnlZV0VSYm1MSEQrZ3NvLzBOMlUvV3Nj?=
 =?utf-8?B?SFRWN3ROVW92eXFtQVlmcXVpQnY5cldHclZzWUk2azlQTHpYRGtkVDc1R0w3?=
 =?utf-8?B?Um5TTmhpQ1VzT1J4NVVocS82UkRHdDNMK1V2RlNacU9remtReUJlMm9WY1lx?=
 =?utf-8?B?OTNxRmlkd2ozdFhyYi9yYnNkMHBWdGMzMG1hMElrKzd1UFJwR3JOQTM2aFBt?=
 =?utf-8?B?WW5ObUNhNlJpQTlvT1V5d1FLbmE3SW5nSDd3Z1R6SjBpbGR1Yk5yWUdTQzYv?=
 =?utf-8?B?aVQ3TzlFd04waWhMVTVjSHNQa0IxN1ZFQVJkUDJud25EV0VQWFZRcDhoWEZl?=
 =?utf-8?B?RjRKY1QwaTVFYzBCNnFJNXhSUmkzaFlKUXl2MnFUVUFudHJTVGZ1UXRQM01r?=
 =?utf-8?B?UEdZWWM2YWM1TmxSdzRvY0w3dXJIWVZUTEtGZGdnSkhwZ1lIQ2crNitMa0x0?=
 =?utf-8?B?YncyakJPVkE5T1Nub3lGbko4WVFERS94QWVReU5UUDM2VGdvV3NYd0w2ZG1E?=
 =?utf-8?B?Z2wrb3ZyUHVMQ2F2c3R0SVBMSTEwaEFTdGd5ZHdTNDdKdlRGdEZVT1VRSC9h?=
 =?utf-8?B?OG5DdUR5NE5Pd3ZFcVZubWxLYytYZXZDd1RGTXZ3TlpkN1dOOU1EcnlKTnhF?=
 =?utf-8?B?cHpUT2Q3b0Fxd0JjYW1mV0JjeTZUVFAzTUhjTWV4RzVwanFjdSsxMXJXQk5N?=
 =?utf-8?B?cmtWNXhTRk5oOXg2SW1zellPbkh2UE9JN0lxSlNLcTh4ZER4dnJmQW8yMTQ4?=
 =?utf-8?B?VWRuT3F0MGdJVGl0aEJ2MzF4bHJnTnUvQ1FndTRIejVhT2hmN3JYeGt3NVpB?=
 =?utf-8?B?K0kxaG5HUVE2MkY5ZnBRc1lyZjVFcC9iZCtYMEhaRm91Vlp5blVNd2trWUwr?=
 =?utf-8?B?NUcyRGxET3JZaVJyOWpyNnZwQVhQRlhzZ2VrUTFUeUwvRWFlNnA0b3cxd3d0?=
 =?utf-8?B?NnlLR0RtaHZZbW8vVExXYVdWRnc3YTBLa0FwdWJOeTNwc0V2YklsUHRCekF5?=
 =?utf-8?B?L3JVSGRmaFYzcXcvNHFHdDJjOS9FUVlETERjSzVPcWoyVUllWVpiMFJpbERL?=
 =?utf-8?B?QXdhbGQ1OVJzOStMQnowTVovUkZBMWJjZFdqTVNQYjdETk9vdGFlZno2SU1m?=
 =?utf-8?B?ZnAvZkNRL0VQYWcwUFRETXc1UW5EOStWWDYrNEpBM3gvMEFpdWt4VGo4NG1Q?=
 =?utf-8?B?T252ZTliYmNGeTk2OWRPRkhLMlRGNU1zY3BiaDVFcHhYTStBN1RKTGhMeFdl?=
 =?utf-8?B?eFpOb041MC96d21zSVplb3RFTm5JV01mWmU4OHo1QkgrMlZrOE03UmxsZmd4?=
 =?utf-8?B?blE3R3lDVGlvUlk4SzRNTE1qeVdRODZNS0VYOGdIWXd1WVo4UXpXUkhmaTdw?=
 =?utf-8?B?dEhVZmlrYlIwdTlEY1kxQ3JVME9jZmhzYnYyaE5BR1pHSFd5ZlpwUmNlT3BW?=
 =?utf-8?B?NENBdTNpVkNwTmJZWnZCNU9HZHowNmYvUU5tdHA5U3lJME1uYVNNU0pZMmFT?=
 =?utf-8?B?UHorWWlWeWlRSXBIYmZZcHFReGtIeDQwNVAzQ29TN0Jubk5OMUlCdk90T3Bm?=
 =?utf-8?B?OUJGRmNmaituUjROSHU1T2l1dUVHSVY3dWNuZEdid2RvWENaWlJsOWw2ejU0?=
 =?utf-8?B?RExWd3YxaTVsaTlDS1BGazBGTTU1WUo0RnNEOExQTmxHZU8rbE8zMTYrdk1w?=
 =?utf-8?B?NXZKK0ZibXJBdWczR0RLcVRWTkR5NWJ4aTYzV0o4bWxOVFdxOWJmd3NnS1hU?=
 =?utf-8?B?S0lJajJJVVQzanNtRlNrRGg2aXVydGRmUE9QM3ZFOE9TUWt5N2p2dkhYaHl1?=
 =?utf-8?B?KzlaSHF4VmVwd2ljZkczNittRS9Ec3M0YzRSZUw2V3hVR1lXWG5tMkM3VDhF?=
 =?utf-8?B?SFJrL1hGVUtUUlFLQzhqbkF0RGVPVXJVeDA2RkpHV1VhR1gxUlZIdFJ2bHYx?=
 =?utf-8?B?SGNVMFgwT1BuY0N2QnhQYkFxZTRRazlrTk1sek5iSVdBSXBlM0orUFdiSis1?=
 =?utf-8?B?cVRMcHNiQXkxejhhOG03QURXUElaRm45RGZsTGcwc0ZvUEYzelhMOS9MT1Zi?=
 =?utf-8?Q?GSGn/2eDVCzNXeo9g4euzeA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915ccf8b-9d19-4a5e-12a3-08d9c0b38a10
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:45:59.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9TWG4s3c0te25PMNq6ezaF2TC/U/RAVpIqBBl6ksa+Js08ssvH/T1wJfY/HXNj4NyTkzfC1dIv/JAqoDQHGWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4787

On 15.12.2021 23:21, Andrew Cooper wrote:
> Specifically, this lets the user opt in to non-default for dom0.
> 
> Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply it
> to dom0's policy when other tweaks are being made.
> 
> As recalculate_cpuid_policy() is an expensive action, and dom0-cpuid= is
> likely to only be used by the x86 maintainers for development purposes, forgo
> the recalculation in the general case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


