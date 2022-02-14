Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C94D4B5206
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:43:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272261.467031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbdI-00010d-Ad; Mon, 14 Feb 2022 13:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272261.467031; Mon, 14 Feb 2022 13:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbdI-0000xu-6r; Mon, 14 Feb 2022 13:43:12 +0000
Received: by outflank-mailman (input) for mailman id 272261;
 Mon, 14 Feb 2022 13:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KkXt=S5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJbdG-0000xo-JL
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:43:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bc4ce9e-8d9c-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:43:09 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-SkjtdDXyOgi9PC3ifHHKbQ-1; Mon, 14 Feb 2022 14:43:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB4892.eurprd04.prod.outlook.com (2603:10a6:10:14::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.16; Mon, 14 Feb
 2022 13:43:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Mon, 14 Feb 2022
 13:43:05 +0000
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
X-Inumbo-ID: 0bc4ce9e-8d9c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644846189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rpjvohe7/2DY3uLEpHfm43hJQI2ASb+gesXx34lCGsQ=;
	b=fcblCHBS2FQG9ZIrP3grdHrMe0uyBec1Y91nL3CbaWbZk9QkgbX9uXqxGs8esTAqGFo8IX
	QzDXjxxPporfaZ6SW/ysysN+1cvDWft09jtpdbuvbb+ylK/N3cGVJDdAl7AJAy6ikXzMJv
	LrAOyyadLFOT47JBp+arL//KgPuv3Fw=
X-MC-Unique: SkjtdDXyOgi9PC3ifHHKbQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHKefa2c73GIXz3YHpSEJaDMFQMga/B8t1IxV9jFkM4R1ll/nUK3gsrrVAsI8NSKfvy27rog+SEixqjfuuWHiKu6AvLKMn10JKKcGldhpDKUV6y2HxUBctYi8C9Uk7cfQsX2Q4HdjXkGhofgHRiw6D6rM7VZwmfrUCp6ZCd8+doB+fWiAkpqZcOS2I79Mc6P0UJ/vr5DWMtKD44VJ8eNGpShLCwPY1EaTashdyAzMc9YxI+CCXYH4jgoQVngKn3oGXbzwQIy94fvkRVFxIpC2EsbnbZxF57prkXk4mraEM9mFg/fxu5FUqvPOmUgpTrmzSFhzdxcbyNLFjdAKAXGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpjvohe7/2DY3uLEpHfm43hJQI2ASb+gesXx34lCGsQ=;
 b=D5x1aM7o34ZpCF73SMpXPoX48SuD23XrE6GTJjP9TkqEt/p5yk2HS6qbKa5j3iNFmG6bsiJB4a++SruYZZZY29MebrsVuaFhenwJNqBJkOEZToamtQUFV/1RTVkVInfGe4IVJo8gqWJeDxroTcsQKe11hxNzK4tZY8uHLKbgIlEajJ9B2UzkJv2FeziixLRBGDkB46+YBRaDu6QWmGo7HYQsa2tePTiiF/u+KtqAIrwUaozRvuI2Uc8sv9hwWqvPuorSOSG0FhgolWUjAFILVS0Yhl1KzNoSW7GoIRKlUvTkUrWLLV/Wtc2Vf/ArA0NSH1gOdAp9TTb9tIRFeGgE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <218de2dc-6dd8-4e13-3288-36448e47de7f@suse.com>
Date: Mon, 14 Feb 2022 14:43:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 00/70] x86: Support for CET Indirect Branch Tracking
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Daniel Smith
 <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c471dcc2-8a91-60b8-ba5d-58874752e4d7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bd81eed-92c7-4ade-cec6-08d9efbfed53
X-MS-TrafficTypeDiagnostic: DB7PR04MB4892:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB48922BB0ADCC29862E0E1AEDB3339@DB7PR04MB4892.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3b9UxjHBqKs5s+lo/Um7Ap+MLM5uVVEpN8Aor3or2CW7l8gbGMxgvlcfqpFQpxg4FtjIMKHeYiKnI5T3XfSgQg9IXXqCkd0JnqlrYmtov895LUKeeNFf/t/YBTctf+NHdtIoPREgBHhuZ2kAuNApjFfGEcAoP+9nzc+LkLJadLdt8DQEliGMzxe010GUfsgkuza5mBoMpHP3MsNZCGDEqnio/Qxn2771EIB9x+eyBfi/L/wBf2PIIhQdInjsx2gPnnQgVmpjtwcN3fZ1EGxtxThKN5VWlnPLHcYh/yuCqjbDv6dsV21DFy3x+zgiFb0cWgGwIm6m91QyhBN9skliyXK56EzzWQGCy07MvbAMenh6eBmnLDW9xsP2FXFiGPpaXM/LpyCunZQgBDX7qaFqTOkmOfVcOsl60L3M0CGdUkYXPWTkx2E/VtVnmtRap/yNA0vnpXT8rm4D91Vvxa74evuzo799GHyCC2c6krkMWEduoosO47i7SYPcifwT3PpK24mTrqc+8gRHmfNlKTWGBtGsAjbsH8cwtjPym9Q6ZSFk4waVV/5SRMl2WY6IMUVKp6otQ83gi2s5oJgLFby7yTehNhFm4h4a0+xzRYCrwopCm8LeK48mYtUE7EPHowlrIji/vOVLYO+jx+65bUCBdvCkwslJ1n6VrHgfeLfnpLi+Xp7zDdAR51cU+G8MkdMXc2aPrQsH/TGmy3TDtla7zEb2352nZ7T+Qrris650xsua5VXuPbcCzSafK9JEqCCQoGdSkOB/yqyoTUXcvcWYib3wWpruXzPu9ubV4dtEwuHQ9VNJsLJCVlipk4JkSNMZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(8936002)(316002)(66476007)(66556008)(2906002)(8676002)(66946007)(4326008)(36756003)(6486002)(31696002)(31686004)(86362001)(26005)(186003)(6512007)(6506007)(53546011)(2616005)(966005)(508600001)(6916009)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3NWS0d5VjlOM0pFR1lKTTRLNWdBQVdLZDNQSXg3UllyalFmUXBOZjlUaXlK?=
 =?utf-8?B?WitmMXFCT2gvdlhJai9tLzB2VGpxOHJCcU5PRDJNZGNhU0JTMDlEdzhXNzJJ?=
 =?utf-8?B?N1hLMEpTV2hON0RHTFhMS1dseEp0c1JCVkRWRGpOUWtWS2JOWDBkOG14dndT?=
 =?utf-8?B?WDFQMTJFYzhHRjJpb203L0ZObmZYT3RCdlpTY3pNcko1clUrUGxHZFkwTER1?=
 =?utf-8?B?Sm9PWXNuN1dRSW9naEVKeWFHeWpUcjI4d2lVbnorUldBaVBFempTQmt4UlhN?=
 =?utf-8?B?V2tmQmNjclNOOG9pTHIxY0ZZSzQrOEJ2TUxiU0puTHhHNVFqd05BTGJZUmdT?=
 =?utf-8?B?WlJldUw1YTBmTWltdFRlVE9yR2lEZ2VtTGI1Y255cUxTL3FKUmNBNVcwWldM?=
 =?utf-8?B?Zmx3eDV5N21vVmdhQlJRakpUNjVVUFc2anoyS2sxZFBjYkQ3c2hGelFDKzlv?=
 =?utf-8?B?bFNuUEo2TGluTzJxNjFsNHljMkFMSHBvYWhvZEVxVUVGR0xxaWR0MDVSbG9U?=
 =?utf-8?B?aWtNQVhGWGJHYmE0clQ5blc2ZWdkb1RiWWF2dkdUZ0lLZkkxTnJFRzlRSytn?=
 =?utf-8?B?UU9nMjNpYmZyY00xcHdlTFlNaHducVBmOEVHRVZsbFpUNlFtVWdXL1UzN2lH?=
 =?utf-8?B?RjdLKzQvTTZhMEVtRmRFZzJ0SWpxUjBsaEdKemVYOExWTTFJUC8vSm1vQmdr?=
 =?utf-8?B?RG0yUjNla1hFWUtaSytGM3NOY0R0UTFOZ2RrV2xxVk1YK3VIVHhUODU1TTlQ?=
 =?utf-8?B?bWRKL0FBV1VKbGdhRktrK1NwczAvNGhBbDBMMDlyWkVDUjFzZVYrbXUyUVFJ?=
 =?utf-8?B?RkVqd2RKSFV1SldvdEJWbzc5UUtDMWVaVWZRRXZKNTBrR3FlbytKTEg4a2E5?=
 =?utf-8?B?V0dieFJyZjkvS282QnduaVNlMjJRcTJNSGVoZWFrRFVEZVQ0b1oyRGlJeWFJ?=
 =?utf-8?B?eEltZkZjcExqaTlXQ2dBUksrNnZNNHZ4M09CbFVweW84S3dqVHBpSWlNTzJ3?=
 =?utf-8?B?ZWQzdVM4VENJYk4wekVuckN5NmlyYmZveGVkTVJlR3I1cFhESTd3T0l6NThh?=
 =?utf-8?B?U1dVVGVtNVZieFlZQ3piS01tSjc1SUMvL3ZsNnlrbERsVUxyZFRqODk3UUhQ?=
 =?utf-8?B?di9nYWxXRFNqSzhTV0JFd0NlaFBjRFR5SVgvZTN3S0JoR3BjVjVkWnV0MFo2?=
 =?utf-8?B?VzgvZW4zcVpiOVF6Sk9sSXpteWQwbk5URDh1T2RER0VOYm5GWjVhYmdwN0Fj?=
 =?utf-8?B?cXJ2K2xTZFc2SXI4V1k2b1B3QnpzOHFTcTlYbjBuTVh4VE9XcEhtTVFXQkY5?=
 =?utf-8?B?SGxtYzAzajZBVTN1ak1GQVBkOWZjMXNJUEd2STZJdkJxQ0xCdVI2eEgvNGJ6?=
 =?utf-8?B?NkpsdGJxU0xValpSS0FyOXpVY3c2THFPV1NOZnJUaElkS0xtZGlyN1FtaUZj?=
 =?utf-8?B?aGdNWkRoOUhZcFVRNEtuUC90eEp1RTBNeVl1cVZ5R0taNm9uRVJvTnhEL0h1?=
 =?utf-8?B?YWJtRTZkbWdsT00zZUtQRGRDWTh1T0JKeEtMdStaUjNOR2hweGh6NWUzMXY4?=
 =?utf-8?B?NzVJeDJsKzhSQmFUZkpqNjF2OW8rZ0tWbHVIeDdzYkJURzgrRXRvclErQnk1?=
 =?utf-8?B?K3I5SVNSU3N6U3F4U2dNcW5LL2tGdnRNelNyd2QxYkZRQ25HOWdWV1k0QTE5?=
 =?utf-8?B?bkUzc3F2QjRiNHZHYlVFOFBxRVArUS9ydURxSEVHNHFWMmNzNTE0WnFqaVds?=
 =?utf-8?B?UUVTZ0tvTHoyWFpXYzBZVnFJb3hPb2l5Y0pJQm43YzFEU2hZSDQyTjhGcGRL?=
 =?utf-8?B?K1VSQzNlRzE2UHRFNHFzK0wwTDhXN1ZxQTM4dmZyakt1UXd4TzErTlU2TTk5?=
 =?utf-8?B?YWpVMU8xQW9BTzQrWGU1L2l0bGtrWmUwQTQ1emlZNEM5RHluTVZkdS9PbUwy?=
 =?utf-8?B?UWZjZTUrekxMb0VjYTc1OFFKcDlOdDNXanJNVEhSWkpvblZJMFRibS9Ccitr?=
 =?utf-8?B?SzZVdFhOM0xMY1U3ZDAxako5Y3JSRGFlYm9neUtvVytaTmJOVTFYWUszUXVz?=
 =?utf-8?B?RkgvcHM3Skk3SnpTVnZDVUFKVXJ6dXFsUUpEZ2IwUE1vb2RKU29RWm9ERkpO?=
 =?utf-8?B?OGZ2ZUdWQ09MR1dVeXJyNXR6SFFzTEFzcnVkMXVkckJNQ29CdUVHOXhmUlZ0?=
 =?utf-8?Q?AwKOLBlwT2gnL89Y1xnqLmw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd81eed-92c7-4ade-cec6-08d9efbfed53
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 13:43:05.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPNLTwYwyiSf2N8TnjySIuVK9VYASxWm6PeWL13pA8XSi5I7a7k3zWjWRw1y69pJ/Ko0fzDCFisyTi/U+MBGGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4892

On 14.02.2022 14:10, Andrew Cooper wrote:
> On 14/02/2022 12:50, Andrew Cooper wrote:
>> CET Indirect Branch Tracking is a hardware feature designed to protect against
>> forward-edge control flow hijacking (Call/Jump oriented programming), and is a
>> companion feature to CET Shadow Stacks added in Xen 4.14.
>>
>> Patches 1 thru 5 are prerequisites.  Patches 6 thru 60 are fairly mechanical
>> annotations of function pointer targets.  Patches 61 thru 70 are the final
>> enablement of CET-IBT.
>>
>> This series functions correctly with GCC 9 and later, although an experimental
>> GCC patch is required to get more helpful typechecking at build time.
>>
>> Tested on a TigerLake NUC.
>>
>> CI pipelines:
>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/470453652
>>   https://cirrus-ci.com/build/4962308362338304
>>
>> Major changes from v1:
>>  * Boilerplate for mechanical commits
>>  * UEFI runtime services unconditionally disable IBT
>>  * Comprehensive build time check for embedded endbr's
> 
> There's one thing I considered, and wanted to discuss.
> 
> I'm tempted to rename cf_check to cfi for the function annotation, as
> it's shorter without reducing clarity.

What would the 'i' stand for in this acronym? Irrespective of the answer
I'd like to point out the name collision with the CFI directives at
assembler level. This isn't necessarily an objection (I'm certainly for
shortening), but we want to avoid introducing confusion.

Jan


