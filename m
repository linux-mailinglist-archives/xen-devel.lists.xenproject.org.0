Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D9D4904A3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 10:13:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258033.443878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9O4T-0007Ew-1z; Mon, 17 Jan 2022 09:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258033.443878; Mon, 17 Jan 2022 09:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9O4S-0007CV-Uq; Mon, 17 Jan 2022 09:13:00 +0000
Received: by outflank-mailman (input) for mailman id 258033;
 Mon, 17 Jan 2022 09:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9O4R-0007CP-CB
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 09:12:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a934fe8e-7775-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 10:12:58 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-XiSOLBP4OnmsRXDz5lW6uA-1; Mon, 17 Jan 2022 10:12:56 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0402MB2860.eurprd04.prod.outlook.com (2603:10a6:3:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 09:12:54 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 09:12:54 +0000
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
X-Inumbo-ID: a934fe8e-7775-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642410777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=43vWvcECMvRjGAhOZ+emyf/YwVuj0pETzGdu/vsehgs=;
	b=eyb6VIC0jNBMgXM6JhhVvcKtlSu4He5+ACPftRpqyr3NTJzLxDa+ylDiS/UvLvfytiUTQK
	IOop/F6DjbmlyqdhEWRC2EFwb+SWeALSxQ4aOjjOc030NFzEReZ3bp8ueBX+WkZeVsAPIy
	Kfk1KNOpJ7Sj3bfVHpOexYH9/PmmmAs=
X-MC-Unique: XiSOLBP4OnmsRXDz5lW6uA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdO3+BiJj2+SPOBu8smrpUpLlTVtX4NkmXOqKMLVWjHj8lg0vBIFZB+/CRALYB2ig6ZPaxWsb7S50YUd9DqKD6ljy0NXgsy1au2cvdQvhkO7A1TLsoePtYylSaZFJvB0SXQ9Hujl+dEgQ9+tiPoTUTC8QE5uvHqBrFhwPmIoUSruh0sXCPEAOTAcWFDKKgHCdsAswb63opZuJFnx9TfURkEH1F5sYLgoqtCXItwTAIOSSpFz95W+CsaVw66cKiixDdjzro1tdjHp1RYkVpvzOVCOSQK3GaUJuMcRwQbaw4CvtstIug7RpAu8uPzW2JTqKQ3n8ePFI8nVFil+xLAsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43vWvcECMvRjGAhOZ+emyf/YwVuj0pETzGdu/vsehgs=;
 b=FlL2fiuVvwyKjlatTEmd6WyVe6jbbRyilMLAAEUaEYCUjkSpTXyNqjVwZdr/6TJHX9H/CFSZuucikRlNJ3/r2xq0g3k8PoSvq0p+CywlEHaTQZytzU97SnZtf2CzmXqLVe4FSmUNcHzMfTR/2NFPyJHgp8en4A6ojFmSS1O6Z0GopQSYE0bj2Qys+VcREnAdAfAqjXr373fB+Fw+9vKnDyDSxOtBBpPw1xhfwMWMvlQuUVoy8rCztqHh+G+pY1pncRD7+9KV7kLfWJ+Ci8HcwC1fb/zAJIi2rTZV8LtkJ77SZP9A9yFuq9bpPBIdkcCRHJ/rSp6WNvvc7eCmW3fZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <369d9b15-d960-e71a-1338-1e53201842c3@suse.com>
Date: Mon, 17 Jan 2022 10:12:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Config.mk: update seabios to 1.15.0
Content-Language: en-US
To: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen Development List <xen-devel@lists.xenproject.org>
References: <20220116125648.1200259-1-wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220116125648.1200259-1-wl@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0080.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b07aa42-1af9-4285-7916-08d9d9998b61
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2860:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB28608D66B940FE3E942363DFB3579@HE1PR0402MB2860.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ywI9dwQAsS8hczB2zqGhQ9pqn+uG/fFaKFe11QZVJJIj/WjpvL/lf/D56N8lMuSXMLmSxZe5nV1SYxxTdTOK8RXzpGxGtLhiRCTdFe3+GhNqgrb1weF0qZAFcFen5ThgTeJX8eoWeJHJjphcoxE3LB8x+33c2ZovH/VH3TTUlO4bYJkhk+HpFvBfVaIhejh5hE9NAoCP6R0XAw7/ID0pr8MCFXDRuVLiOb6sm6YzsJZO5jjpHQUpBEUArxiGyNPB+xvkbmIRf0hjV/T7Zn/YV/zz4H26R9e77vsyvs2SgOPUncCPTZ/vIaGb6ffQuhIX5UFmCWVlp8TGhHZwxR5vXNglB6cCk09m8555AYxjHujNyz7poYdAZ4UKUa06JQVPmUu7itnaromTQ9m0Zq7ILXysz7Fd9AXn3AL4NpfGcmAgxM0KTFeBSGZQAv0kMd7AgknbZEm2GARVn2L8jyaH/QQAaAVN14ZYUiLfBApHTdHWiTmVCFc3xQ+xeWBLoan132H4YWpPBywgngkeF5A/2hJ93GwZys7OipIvtypKMx/PfMj44QyKAOw4+joia6MRSUmkUKWd5D3ygJRrTm+2rLeAO5BSIWdVrzhWznJ7bwZWtzCrzC77lbDlBYk9lBjWMo9cTow3MUKzB2ynI9v2KSHlHv9yC3cIZ1uwvGSn/go9zrE8rGFRJStwtAwOIjOqK6Dz7u/iv8RPW0j8Xne+u6tU1GJQWT1DwJObX36BlZ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(186003)(26005)(54906003)(8676002)(6916009)(5660300002)(53546011)(6506007)(2906002)(8936002)(316002)(31696002)(86362001)(31686004)(558084003)(2616005)(38100700002)(6512007)(66476007)(66556008)(36756003)(66946007)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RldPZTdJSXJwNnkyc0xpZDRFQmd6bHV6MWx4VGprbVJaTC9QV1EyZnJ3ejB2?=
 =?utf-8?B?M1gyTHVpSnNucGtxU2dNdCtiWDF6TGNYaHliY3JZeUd3dFBiY055dURzSjk4?=
 =?utf-8?B?TUFUeVpTZnpsVitEakE1emZDRkNtNXpuVnFuZW9iajIxR1ZjVWJFcjBreHpZ?=
 =?utf-8?B?T1VCL3ZGRjhZUjYvSW5pUWRKR0N2RTBJREFrQXA1bFBlRVgrdThJRS9XV3M2?=
 =?utf-8?B?dnBGL3dwRUluK0FBMjRBVlRpQjBlcDRIakhVUG0zcysxcDJuellTMHZUbXdZ?=
 =?utf-8?B?bSs0TjVHM2FSanUzblIrL3o3OENYeXkxbUZIRzZBcHJ5aUxONUJmc0lDOFor?=
 =?utf-8?B?Um5nUmxobHh6QldtS0VhcXpHLzlTSlprdWJaWjNOZDdoSTVWa3ErYnBIeUZ0?=
 =?utf-8?B?bDVzSzhZSkgxOVdVUEZGTjhxdm5sTW9kUWEzamd1V240cm5pakNCNERkZVBI?=
 =?utf-8?B?QWErYXZuZmMxVFJaVW9Ec2pkaTYrelRhUnBpMXh2Wi9QWlNDYW9RVWdkQmRC?=
 =?utf-8?B?RWpyWGZ4dFdCWHBwK1RhUlZvNnozMlI2WmVPMmxvZWc0dnFvWDFYWEk4R0RO?=
 =?utf-8?B?VXVEOWdXYzBwTU1ia1NWaXlFUkk3WWFTQkJYTnFQNW5Xeit5Q3orSWJrODlP?=
 =?utf-8?B?OVdCYytHYUIwZlpmUjVLYVBoZ0IvMWZZcVZKZ2JzWkM3VXdYWmltM3dYTzcz?=
 =?utf-8?B?aXZOS2V1aVF3Q0k2c2MxbFpMcGVHRmVkWmRJV0pWdk9JekhBRVFuQkowNDRj?=
 =?utf-8?B?R3BqV0M5dEtpU0V6ZEhzNStoblRyZDJBVTZ5RmJ0S21IUGJBUXFWcFNvQy9Q?=
 =?utf-8?B?ZWlTemlBcUtOWGJiZ0JFRHBta0NMeTU5eHZoUTNHQXVCeGttRlZ0S3gvcmtm?=
 =?utf-8?B?ZHZjUUtoTTJ0WUlkVlkzTlllVDBCVnRtWjJkbGpZRjdvcVNuVmUxMnBRNjVx?=
 =?utf-8?B?S25vdXpzY0NJTGtZQlFOTHdFOFp3Rk5mRUNNTDJhZk5ibHM0dXNrcitvTDBy?=
 =?utf-8?B?eVZPNTJ4U0pXRGV5T0lpaFJxN0xvQ2JTUGxKazZtU1Bxc2I2M05BV2IxWkpz?=
 =?utf-8?B?MEo5WG5XdzRaMzd5TEJsTzluREFwMFk5aFBIOE9waTJqWkhtaUtuVVJLUTBX?=
 =?utf-8?B?cnhDNURhR0xSeTNQT3RNZWw2Q0puWWRYZDRKcHRsbnp4M1o3OENvbHNyWUJ4?=
 =?utf-8?B?QXBMblpRZFpTODRiNTJXNFBaYi95MitSV2p5cURlUkoybXlzdlozV0thdnF6?=
 =?utf-8?B?TkpYTHUxcU5WMGZqU0VTYmFBOXhpTUVXeFJkZEdoZVNCWEF6bXJGanRMRmgz?=
 =?utf-8?B?S0owNEM2aGRjMjVEREZsRmtKbjZJZ3FLNzVpaXFodzFwMDB2djQ1MDZpVGNQ?=
 =?utf-8?B?eUJ4VlZaa3RWa2JYNDdrTEg3T2FLT1BIMEROTlJvTzY4eGROWTBCSVJyRTMv?=
 =?utf-8?B?dWhLMk53VGdCbC9lSzVUZVcxSVZKVDhKd0pnNnNmSXhCSTVDeFJ3WnNCdDh4?=
 =?utf-8?B?amFCUjZIdm5FT0RIa2dJVEp2U2ljMGFYVkFXR2t0d2o0YnpvUVIvcFdZVzFP?=
 =?utf-8?B?M2R0YU9Ta0tPcUNvcDljMC9wYXJGckNWUWVtd0c4WlAyTldlM3BKOVRvc2ow?=
 =?utf-8?B?SDQrM0doS2VEQ2tvMFEyVGJUcjU5NW9sa1hNL3p6VFNuL3huM2E3Yy9sdHRa?=
 =?utf-8?B?KzdpY2VFVFNUekF1VC8xU2RELzcyd0VaOFN4MHhKWjZlZkpvQ09LOXN5cTVt?=
 =?utf-8?B?bTlQUit4ejhCR3MyM0VQNU1OWEVNQkdkUjhldnF1NXd0dmgzMFNyNVJtM2E3?=
 =?utf-8?B?bnlOMXcyVXkyNVBVWGpmN3dDa1FwUFlHa3ovbFV1L3djWDZsbmVvZWc4M0N5?=
 =?utf-8?B?bTVFK3hQTnBzaW1pUTVkTGtkdjFKQURBZGRPc3UydjN1bVlwN3B6YmczSU9n?=
 =?utf-8?B?Znk4czNzTml0OFRBNnRsYmQyS0hoVUlpY1l1RENLUmM5YnVYNjFtc0IxVnNQ?=
 =?utf-8?B?QWgxMjNZeEFYN0dyVlZSaW5JVWtheHZPUXJtYWhiYUc4VzlYUUk2UU9Eb2lL?=
 =?utf-8?B?bWNWQ0VGQUNJVVhYUFJDYlJvMlNRRUQvK0hSd3lBVVZuVGhudFhjTkhFMG9m?=
 =?utf-8?B?YVBBMG1XcVgyc2FDNGtLVFhYUTlWb3JpRGFqNEc2dkEzWGFoTGFqVTlQSXA0?=
 =?utf-8?Q?Fr2wV4w3KAWOzByb90sUgS4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b07aa42-1af9-4285-7916-08d9d9998b61
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 09:12:54.4218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGNhVWkg1l/S9SQmrgfYWFUxUsZ+VbQyO77E0+pytE/pimcxmu3VUeJBSUknGkzAQKIxFtGSq/yIXt0CVe9/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2860

On 16.01.2022 13:56, Wei Liu wrote:
> Signed-off-by: Wei Liu <wl@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>
(In case such is needed at all for things like this.)

Thanks, Jan


