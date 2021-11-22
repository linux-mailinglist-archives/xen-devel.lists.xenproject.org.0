Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E06458A69
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 09:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228615.395648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Xj-0004Er-MG; Mon, 22 Nov 2021 08:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228615.395648; Mon, 22 Nov 2021 08:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp4Xj-0004Bf-J7; Mon, 22 Nov 2021 08:19:15 +0000
Received: by outflank-mailman (input) for mailman id 228615;
 Mon, 22 Nov 2021 08:19:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mp4Xi-0004BZ-Dz
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 08:19:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0284d31-4b6c-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 09:19:13 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-2-T0X5JWONiaPyncBsMOhA-1; Mon, 22 Nov 2021 09:19:12 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 08:19:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 08:19:10 +0000
Received: from [IPV6:2003:ca:b712:7ba9:201a:362a:8f72:2ea6]
 (2003:ca:b712:7ba9:201a:362a:8f72:2ea6) by
 AS8PR04CA0172.eurprd04.prod.outlook.com (2603:10a6:20b:331::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 08:19:10 +0000
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
X-Inumbo-ID: e0284d31-4b6c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637569153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=39/0g2SzU8HUJukvSuZg7AOZ8QyIF2Obt+fhEhbSBfg=;
	b=MCOI1pgDLXejvMq7MYpc0+sqv7fI+wLb974ukm/mzchE3woG4mEc6XeY0gNkrKrV1CXxv9
	ZUy2mQq9Eq0aOiLwRtbG0njYzeTSWDyuAL7lsPKL2HU1IprQTnTFcdTrdeX3QMcp4G0dkT
	NjFzamTbwuLaGRh/QRNwl9eZpG8VLtI=
X-MC-Unique: 2-T0X5JWONiaPyncBsMOhA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoR62OLPOrhBTMWtqE13q/f+hRcFxzt06/DkecGukR5z39WHwhC9tY3qvo/D6Ec51N7aFJXmLF/ZNER0IKAQ5NgAki8nMuQzh5x9koL4EnM8WH/51bqFUfRLX5PIHL49tIshPhChxyz2H/hN5J3dE29MDjPfTaglReBqlg8SNiVTUyg6zeFEtPpwn3N7lg7PYdbj4JOcXNoubLJQvzq15CGlCrBH8Ca4eMWWslQy966AvC5RnkDB1GboOmOKziiP1UBuOym/o24yOvMgME7JmHhfiv71IPqFEdYNttpF9zmycoFodrDjp219ygoSMmZAHGw2LkAH9H2okHFl0InSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39/0g2SzU8HUJukvSuZg7AOZ8QyIF2Obt+fhEhbSBfg=;
 b=nKfb5rlLSCMwePYegfB7fy/bPlBYEOk4pz0YBxKc7RyKcHkLRuyaSUHWHS4Kmg1YrfoIDVAOjY+8B0OCN+ptMto9W6nVIRMARuE29KV1BgATC/xyqhpQ7esPFZtEUI/nWXUiH4k3M6b6tFmXU8Q6bhMGISlB2A2LnMZ8xlyC1LXNnYYCP9OCI7PcNe7dPyO5muRZSi6CiQAYnEt5wbESv8zv7/D5oBLZYxQqCVAqxDHUKjYVxAhpIRheYM4O1cGtQAOpK11XIIhue4iKEWurFTrwkBG9E8h8uulmCEUZcz5fCc+1Oxh2q14TzHeB/BzHiF2rw0POym+ljU9OInp6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45473e8c-4466-d847-3442-73aeb8250875@suse.com>
Date: Mon, 22 Nov 2021 09:19:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Xen 4.16 development update - tree status
Content-Language: en-US
To: Ian Jackson <iwj@xenproject.org>
Cc: committers@xenproject.org, xen-devel@lists.xenproject.org
References: <24983.49015.777430.780265@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <24983.49015.777430.780265@mariner.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0172.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac1b839-1b44-42bd-3655-08d9ad90c2c1
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5325D8379D1809B493AA4DE9B39F9@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oosY3oTLPDDLihR7drBcdUE+qJAHFdJHusA+ySm5PruyjWJrAvBpn2Fvah2kju0eMpZOe5hLXP2+/4WWqN7rG6HpYTkyrOvYAFGBKFF/YOZ7pqUPeW/rlU5IxCGYoqnyR0/yh5BRNo9UeQWGwdPN6xqxLM6yCJ7/fwV8ouj7MlOyjTlubicy7ui/fin2o6/2dHQihOr09FOpqwET8y1lGen5+JuT4G6YkSKyWYl1Lh8fuw47xmXx/THawsPGbVgVvDDu8y81qBrOgB6Q133K3g3Hr0dv3SDODKBNxzp8raErA1W6Nwi5xlyN1y6QWpTgn5gb1XV1laoBXTp3sYf6U1ziD//HlUPWv6JtpK5m8XFNYuIYp/vcaY9PrBrCajEPCztEOUU9tgQC16Ce+wuxOQlbiyNzT+sr5hDSFZeAJT/SbhiVuXe5VuVy5FjWJELWgYz+prlGaZLHGHL+FXUaqDqW3MBljjgk48UIvx5zFZKYFJXMgZ457q3U7BFadtohizkks4aaE+lSbCKUES2z4/H2axQddJGsBSp9YRV/EZXW0vJiJgeYU9XgUOaV0xzRmbMSFAvthzJ7bOuxFVHPfiYVRs47+/dP1d9P6d/+h0ADHsOn3aLjCqoTvJkV9j3vUAc2RGaqa3G4gcf+o6fKkxuJ9nZ6MFQdV45RVqOdHQ3NtYrnLR1skQo5Da6m5tCYi0/sntKMHhZK4c+Fhd54b5+ug6Q6DOgjdu/WC8nDeB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4744005)(86362001)(6916009)(66476007)(66946007)(53546011)(31686004)(4326008)(508600001)(316002)(2906002)(2616005)(36756003)(186003)(5660300002)(6486002)(8936002)(38100700002)(8676002)(66556008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzV5TnlnMW4rRFZhNWk1czBManl1QytVTU5EZlZFS01lWXRnUlFGNWJXNkNF?=
 =?utf-8?B?alNXSk5IamtjaWpmUXRHUjQwc0U2R3JHODRSUERJek14d1lXeURtWTVKWS9n?=
 =?utf-8?B?aWxPcldia2lDNmdDTXlndGhQZi9EYllDcUpHLzlFU1lyYlBjbGlLd0pTZldH?=
 =?utf-8?B?VHN4Mmk5OUQyc1lkY24zUW05aENWYkhEZTZJeXFLZldSaXkwRGYwZnJmdGRK?=
 =?utf-8?B?RHRvem4wdWJCZkFDRy9OVmhFNHc0Wm9nM3ZBSmExL0tRaXdYbmtYL3VmbEZr?=
 =?utf-8?B?Q3IySXlzUEx2SkpZZUM1U29ZWXMydW9oN3RqaXBUNCtscXRQVGUvY1ZvckdJ?=
 =?utf-8?B?ZkhuU2FBam9QajN3aHFLYmdoczhLdEtUcmVCZ0hwbDQrTDlDZEkvTTZ3UEd3?=
 =?utf-8?B?OHFUSXAvaHcwWmtJR2s5cHA4K3BUY2lqclE3MkV1bUJVZ2tBZGJ5TGFtTUlH?=
 =?utf-8?B?UDJYempjUnBDUU1MT1F0WEs0a3ppYmVaSFcvYVlWVzQ3bVNPemZXdFFGamhl?=
 =?utf-8?B?SlRrQmRFUkZad05RSXR6YVRRbkExQ1ozandZaElENzdkTytZTzFoWjI1dnQv?=
 =?utf-8?B?ZUJrcjdHYjAwbXJsZnNxTFJUK0RldUJGMFR2ZHZsMmRwYWhlV1FnZkxHZnBN?=
 =?utf-8?B?YXdIT0R2OVkxRDhFbVFndDcveURBL1hRMStqZGFjZ2tnMERnOXJMNFZQMGRQ?=
 =?utf-8?B?ZE1JL0hFUTlsSkFwU2IxSFdERDJNUVZ2bVBqZ0hzcFVOOWFQVnByalJkb0Yx?=
 =?utf-8?B?STlkYm50dmVVR0pnQmFRb3B0eFI4aXMwbkhWWW1oSlJaa215bUJxSXZWTG1l?=
 =?utf-8?B?K0x4TVVYeUpvekp0YWpPQTJseklRNWxCeUlrMmlSUDl1ckpJRENzNHNXOVds?=
 =?utf-8?B?VXViS2JuT2JobDAwa3RXS3ExWGMwTURBRmVUTXdGbTdRR0JWbWl5dDkyUHNa?=
 =?utf-8?B?N0FrY0hoeGtOQm53MUlmaDFZdVpNOGE3UndqNkI2bnhoOW1aUmFneTlCY2I0?=
 =?utf-8?B?N0hTb3U2L05ieDZMcGFPc3RNbTd2TmZpRE1tNFBMV0J2dG9JSDkzdW82R3ZJ?=
 =?utf-8?B?STk3U1BndVAraEtmK0MzQ2dNZUZxTTNLVFFXY2wzdVU5bml2cUNBSnV5WERz?=
 =?utf-8?B?a0xmT1psbkg0Q3RiWmNlalZaMXpncGJXRXRhZjBERWxvRG9OYmdzc3JoQnht?=
 =?utf-8?B?R0w4ZW4vQ1hpOVdEZXNZOFRVSWRpRkZydWdjVHN3QW9wNXV2Y0xKTUVxdGdI?=
 =?utf-8?B?akl2dysrK2NNc3g1RVU4TkhuM3BxNkFGNjhHVmFKVkhMYjRZcnBnb01IT1N5?=
 =?utf-8?B?YkVndmlsRnNsbEE3RFRpb0ZQazVZMllMOEZOcnR3U0tqWWE3dXVEZzRFSzEv?=
 =?utf-8?B?bEZOTEFIaGtmV3dRdDNId0lxc21QZ3R1MGZMcytVMEZtZmZkWERRMEhnaHB5?=
 =?utf-8?B?WjBIMGFtbW0vUFJLS1VIVVdjdDhZdm45TDFpSEVjMlFRZTJsRXRjQ1pIR1lT?=
 =?utf-8?B?VnpWRzRhL0Q1cTRkeWJpekhCU0krR0Nkb1RUUGp5bllIZXVReS9DeGNmVTdm?=
 =?utf-8?B?ell3eFd6MG9OVmswN1lOODN3V0lLYVR5ZXRZZFVJNE0yRXVZak1SM1U2TG1W?=
 =?utf-8?B?TjRhdWtYSzdLWFZOZURXUVVtdklqMmdoRkxxWlBSaXNPM1M2NmFVek5JS2ZW?=
 =?utf-8?B?ZFp1NW82MGdjMThuaHIyMlR0eHo5YkxaZmNEZ3dRWjRWeE9TTElOMS9ETCtW?=
 =?utf-8?B?UVhXV1B5OVR6SUJFTVhIK3lQS3M5UTA3MGRSM2ZpbTRsNU1SY0NzUkF1OWNU?=
 =?utf-8?B?dnRCZis1ZFNTU2E5K1JVOWE2ejhuTGQ3d0tmSUxpcGtmbWJkN3NSYWtKNG9V?=
 =?utf-8?B?MDVud3Y5VXdNL1g3eHZYTmx0c2g3b2RSeDdXUzZSdjcxNjhIREp6RTZIUGlQ?=
 =?utf-8?B?ZXNZSjYxdFhhekN6UmI1RDMxSE1tdUtrZEg1Lzkya3pHa2J6dFlWSzRJaW5J?=
 =?utf-8?B?djZUN2dRVmNXWGNGS3JYZmxqNjdkZ0pEdFcrZ3ZoajhFVmUxOFE3ZWNxNUJZ?=
 =?utf-8?B?b3JHTDRwNThpQVB4WUFNTjZmZGRtbE4xeFBPdExVN2RBUW11ZmlpSCtySGo2?=
 =?utf-8?B?SUFoQVllenUrRnpEb09sSlU0YXh2SnlIRlhIWnBHWUtDb0w2YkJPQkgrM2U4?=
 =?utf-8?B?S0xObHpFNllyc2xMemxUYms2TDhwZTkxZ05hUXgyRnBFakVLRTJEbjhjdmxV?=
 =?utf-8?Q?RKBypbGuyff+1VnL4KGBlWT1V65Ds8FpIokhW6fOaY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac1b839-1b44-42bd-3655-08d9ad90c2c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 08:19:10.5513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWBtXhdbZA3Nn7zvjGJGI5EIqVHJx9GF8o5dyiBpNsuZTO3JFRzav5JEAcPD1Mm6gQAyDRhYazmKh4Ewe96+LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 19.11.2021 16:15, Ian Jackson wrote:
> Tree status
> ===========
> 
> We are now in deep code freeze, during which we will try to discover
> and eliminate serious bugs and regressions.
> 
> All patches other than documentation patches need a Release-Ack.
> Fixes for serious bugs, and test improvements, will get such an ack.
> 
> I have decided to branch on Monday at the same time as cutting RC4.

May I suggest to consider doing both branching and RC4 after the XSA
batch has got committed on Tuesday? Or perhaps you did consider and
found good reasons not to?

Jan


