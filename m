Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08142DAE9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 15:55:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209362.365806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1CE-0004EO-DA; Thu, 14 Oct 2021 13:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209362.365806; Thu, 14 Oct 2021 13:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1CE-0004Ap-9C; Thu, 14 Oct 2021 13:54:58 +0000
Received: by outflank-mailman (input) for mailman id 209362;
 Thu, 14 Oct 2021 13:54:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mb1CC-0004A6-Kc
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 13:54:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f592896-2cf6-11ec-81c2-12813bfff9fa;
 Thu, 14 Oct 2021 13:54:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-Abi1ZGXPPvijgR-RibTANQ-1; Thu, 14 Oct 2021 15:54:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2829.eurprd04.prod.outlook.com (2603:10a6:800:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Thu, 14 Oct
 2021 13:54:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 13:54:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:20b:462::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 13:54:49 +0000
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
X-Inumbo-ID: 4f592896-2cf6-11ec-81c2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634219694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au4/intUNt1F1RcZPZkdcG/pzO04E91WYBj/x6LLBs4=;
	b=XGbu7y+Ichq7pwDGY8dhDaWnfMVuVGuSIrH5+L0CLxejup2Y/HCsUqHtAJ0F7k7+Rk+r2W
	5G2rIOTjHO0wUCLm1JObM2PIj4HwwLWKEuQ1Bl2sTGcsxtiRCjD23Lmp/26XWnvYuuHOSo
	hX2TRwpGehb8JxlttH67pu9tsqOwO60=
X-MC-Unique: Abi1ZGXPPvijgR-RibTANQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxZeJbcxnjugx7NpTTTxo/6ytnpR4b8MjmkTtlKEOB2wgZAYVoskYdWi4zcbm8ZuMD4XSghPH12IWo+/1sc5lyoJ61jWiIITRNjQxwdRmdTU5PDaN2NCd/lifWotXDsR2ZFmCoNuPLkPx0EPLiYVuXSS3XFeOkMJpxw0qhTfHJUdz2zTMIoxkHPUEUaJw5QIZiyeTUyrAxFMFPUjEBEbUlOwTWzZH760qMTEau7Qxg/SQ5V3d4uQ2rkjOJOj5k+qLEPh9CYemZ9zZnsQxvZD/xM9BIiYyV1NkQP5uwEMtJhp6wVtili3HQ4e+UyW+xYUeLZcZ4DhCxYEqU9JqCCmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au4/intUNt1F1RcZPZkdcG/pzO04E91WYBj/x6LLBs4=;
 b=YWUUlp9NlABgAa2IY6lbcS82MXGHg3sbewSpuj+77Lq2TSxoQD+6gC/1J+q8CO8Y2imuaLeEpOl27QwEDhD+5eczk8AMMiKS7ekUl+K6W3t3af6nDTCqtUI/vgq26zmf0ZvGhTsltyNBk5DpxUGEFqqYr+y/gsMF+Cx2F6WdVsk7gigt0y5FffTBsMPTqZ4nJPhiB8ixyIzSNnj628MgjNU686oaApluCm1eepLt9L1tDx/+ODLdZvtM0/bWzNe0A5mkIZmapiUZVt4ZutTpJLcx/wHus84//DlEPgQzGf97Pde6ZyneXDV7WGJuAkdxobYbzIU6Ef19eUNk3fSLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 26/51] build: build everything from the root dir,
 use obj=$subdir
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-27-anthony.perard@citrix.com>
 <eca3f533-9841-e4a8-dfde-840451ed8aef@suse.com> <YWbsGlcDZSSXsJlx@perard>
 <YWgxwszDto5E9aoO@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <940a9939-079c-16ca-46bc-63ba0a10d5b5@suse.com>
Date: Thu, 14 Oct 2021 15:54:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YWgxwszDto5E9aoO@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0012.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8906127c-d068-4942-f748-08d98f1a316e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2829:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB282993929406D7BEE1D602D1B3B89@VI1PR0402MB2829.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zQdPwcKC6TnP8to4VVnpIwxZr3OVic3mvwXwpctpUqLMFKNsr0w2djJc5O8TiCbf6Vae+rnIaqVdgn/uWPptYshH9hzRPiNfEnh4owFVspwGeJYNEQS+dd+XjNU1QTtXF+obQASqaXYCaQlAZHQKzgON2l61eqUK/DRUUOlJ2IuEjztjDn3V3YYixKFEBfSLHrXvj1Lqmw7Dug7CUbMIvZtW4n43ghEUKiGIuyC5FPA9S3QwXDy914fMcPJBixa3BxHw40qqRMhhUOwkxQGspTpT7oUoxFm2aT3WsyDaVi6nzFia/g6Cb+lfBHho0WhAxLNICTBTzDMzlJXgZU1GY/LoFTA15H8w6FScSfkRhr/pzdfnjCCOFoTYIarsF+ppq5eJIt2QBSPY8jFKtElygmWfmWqRe5X/gEtWF1KbaaLOz0S9der9t86qXJiP2L+i746PKEIECgxQLe/gSyKaI+pGobddg4Uzdb7XvWnM0o/RkbaXlZWeHl+/0AOwjSmWRPMh14oMrFy8qIRBXuvXDI3tpt8I28Ct9FTyQ4R0ngdgOglYN4D0Rb4tgS3u5QvsqEE9qnELWhpjF3dxq8ALQCPLKKb2BrwjhdyUZ49TwsH8WXxJ6OdYXV4veCMtot8mrWF5zq2Yq06wQX485/wR0jXIkWqC/yofOLAEljgTzd4j2YZWtcJKi4V4WwCQULk49vBXelG0kxIodhZZeyXUzZx/robwgSXRpn7ym3HvxgkeqexnzlTNJb7tbi68/iB4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8676002)(66556008)(956004)(86362001)(4326008)(5660300002)(7416002)(316002)(2616005)(31686004)(2906002)(6916009)(66946007)(16576012)(508600001)(6486002)(54906003)(66476007)(8936002)(53546011)(186003)(26005)(38100700002)(31696002)(155303001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVRbGpNdEdpdnZ3Unh3WDBkZFc0ZjhEanRLUThoc3IvMzVwR2U3dFYxQ1BV?=
 =?utf-8?B?RGVOVjNsZHMvZjVCWlR1VzhybUt2cnVZeldwbytzay8vaHNJTm1HTDROTWFp?=
 =?utf-8?B?R3JwWENsUjRub1NpK2RxcHB2Z2JwRlYybmhrMEFXQ0Y3ZVd6NUU5SnY5MXND?=
 =?utf-8?B?MVY1STVuSjAxRnNlNDZQbWNDY1IreW1hYSs2Z08vWU9LUFcrT3Z4Lzg4Smhk?=
 =?utf-8?B?UjlYNGhubVRad0x1TUx0aXVzMTI5OGkrL1RKTXhOQ1YzMFlMVlYxMU96VjEx?=
 =?utf-8?B?TWZtcW5Zd1VPVXVPZnRiWDZKOEYwcEN1czBvTnRqRmoxY3V0Y2QzNEM1eXEx?=
 =?utf-8?B?WkJkdVl2SUsyYTVrRE5yVlNEZUJXWXh3d2J4d1BYQlgydkFmOWJQK2xSQVRh?=
 =?utf-8?B?eDdIb3k3ZGRKb2VySDJ5SmowWC95RTlQbDJ6b3FTd2xTVXlJeFZIWDRGUGVD?=
 =?utf-8?B?bDJTRXowOWs5bUVUK3FXd2kvY05hejlRTU1GOXV1S2l6cmpvT0VMYVZ3b3ZT?=
 =?utf-8?B?SDAycmNqUldVYUxxaW5rTHhFVDlUTFVnTWsrY2k1TDBQWU5aQXpwTWc0emJG?=
 =?utf-8?B?SDNGOEVaYkJ0OUNaaG9xd0ErWjFRTHdiNWRJbGIwK3JOTVhnalBUREEvVGM5?=
 =?utf-8?B?WGRBb0hTcEQrWkNlcHNXcnV1THFMMEVxbGI2MFVPNkxFV1lWQkROcFA5V1ND?=
 =?utf-8?B?M0ZmU2VGWDdEWGlYN2lHMUw4SklKWU45WFhwWDRzTkJpeTNpTEJNRk9rQ3dZ?=
 =?utf-8?B?TXVrYXU5ZGV1R0VkeDJnRFYzeVJqaDJPK2cwUE43aUFod0xLbTA4QWRoYzJ6?=
 =?utf-8?B?eUFBbWJtN0hWVGtRTEZhL2tWakVndWhMNHg5Y2pjczk5ZFI4R1dCSlkySmJl?=
 =?utf-8?B?M0JGcDFYZkJQVlVEYTRXakN2TXZsRFlQN0lpaVFCWmRsZjMxOTRFckQyZFpO?=
 =?utf-8?B?cVlhdFY0NnJQWTdjbFJpdHErcWt5Q2FwZmlaMkNBanJrSXdQd040bTl4MVJN?=
 =?utf-8?B?WFhHRCs0N1pqK25nOGZiVGp3TzI5Z1BOaEwvblI1RXJrZG90UE85eG5jZWxO?=
 =?utf-8?B?V1owTi85RXFaczFHSm84ejFubUtDdkdUTHBnVXBpRW8vYUs1Z3dIY2JJd1lG?=
 =?utf-8?B?VU5DMWhtUkRyZmhVZHZPTHljWE1qcFZRUkVHckYwNUI5UzBEUVI2SHhrNmpZ?=
 =?utf-8?B?dnQrOWJpNk5GeWxoUncrM3U3OW5GKzNvYkVETVBQUHV3Mld6cGh2YXpsaFh4?=
 =?utf-8?B?NGRCQjRXbm5ibGRsYmlmdjRJcWliM20xTDJqWGZSQi9WdFlDK0g3K3FmanRt?=
 =?utf-8?B?TWFZcVUxMHVVRTRzVkJuZkNlQUJkTjlEejYveForYnQxbDcybWl4eXZOZEJI?=
 =?utf-8?B?a2NJSzRpWjYvbFdpYkMvN2RmWkJqaURKU3huVTEzWjIrNEc2QVBQZVo0YVZt?=
 =?utf-8?B?OEtTTGluM3ZIMVQ3VXhUcG9LTVVhd2p0QWFkR3dRRGhrOHg4VEFyR2tVdkIw?=
 =?utf-8?B?V2xaNmNkOWc0OGpuWENyYkdvcjBPMnZKVlhPMzBIQ01HL0dWODBUbjVWWHlS?=
 =?utf-8?B?UVNTa2VvamZhdWNCWklzOGlZWnNVWkh4cWRxd0hkcUZyTWtnUERudFJlWm1s?=
 =?utf-8?B?V1lYZUFEbzBZcXl3Y1JaUm10UE5jdGNJenJTSitGQnFzVitFM002UFkvSUkr?=
 =?utf-8?B?R1FudVhFNnAyVjgvNUtrNTYvYUZRZWpsWDhObVVWZkVVTmtTSzdLL1AyUHhF?=
 =?utf-8?Q?QDaH+Ikf0F3O2YObffzth2JcaBN7fdne797HW4L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8906127c-d068-4942-f748-08d98f1a316e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 13:54:51.3212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jtz/j9UsL6exFWjyI/Ckatq4e3gAL2E9V+AFvnvaMtxIKNMSXVAMqehSzkd4cZvOY26+FpQ/WpoEfGTRgif7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2829

On 14.10.2021 15:33, Anthony PERARD wrote:
> On Wed, Oct 13, 2021 at 03:24:31PM +0100, Anthony PERARD wrote:
>> On Mon, Oct 11, 2021 at 04:02:22PM +0200, Jan Beulich wrote:
>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>  ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
>>>>      cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
>>>>      ifeq ($(CONFIG_CC_IS_CLANG),y)
>>>> -        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
>>>> +        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
>>>
>>> Are you sure about the $< => $(<F) transformation here? Previoiusly it
>>> was present only ...
>>
>> I have to check again. Maybe $< didn't work and it's more obvious with
>> this patch. Or maybe that depends on the version of clang.
> 
> With clang 12, the original line doesn't work for the few objects that
> are built from "subdir/source.c". I guess it is just by luck that they
> aren't any duplicated symbols.

Well, I recall that there was different behavior and hence different
treatment was needed. If that's no longer the case with your changes,
then that's certainly fine, but will want explaining in the description.

Jan


