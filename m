Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8067CA69F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 13:21:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617474.960088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLeo-0007lZ-Pr; Mon, 16 Oct 2023 11:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617474.960088; Mon, 16 Oct 2023 11:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLeo-0007hv-Li; Mon, 16 Oct 2023 11:21:10 +0000
Received: by outflank-mailman (input) for mailman id 617474;
 Mon, 16 Oct 2023 11:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsLem-0007hp-EL
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 11:21:08 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 166c38ff-6c16-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 13:21:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Mon, 16 Oct
 2023 11:20:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:20:31 +0000
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
X-Inumbo-ID: 166c38ff-6c16-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY8qP2lzFJHotdp5KaNhk4JoVPk/azhcQ9Myq/jEPRZdPvA/QtwLA1cbSnpLx0Hs5AtpV+cZqEmsTPYmnBJzkvou3rPS5rercr3e3vMfbr9AGSzpve5+CW45YlycAEmKOkTZeLD82qUX4n3SBVLVbrAyOwSNeADpoe8diVveyld9XnfbO72+zBh4p6er8cQh8Jr78CyQPzwjcJf2XKZSJbfdkigT4s4CtVRT1VrVnt9Ezu6h1KTrUP3TLOXIlYEyF4AuRN38To7PY40vDPZd5SQ1aq0QEgOOzWeTzvt47jHxO5X/+ONMFFhfjbwiMXO/0nc8D8zrtXGD7JNO3fiQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TbBq8pRSxRP44XmGxkT84V0CiQz4ir70N6Vc0YoZsNc=;
 b=FjCKPMe65Dz3DTglUzbFxUSGUB+DSgpOMzvlRlQQMtsGnPxHfhzQekQ4xXhk3cH5YFiAr7WKRAUEQVa+w5CBtPrsy6jUdeKonBpKGVmxGC808Neqy8fjSCXIiAIHF23HodQ1lRFg6Gg58HDKmsIoWF5OIpCy32+vkM7t8ywI6Q2Q+74bo+kn+NzI8IcFjSWtOT43Gmv7a6ncB+mcMF6f0vBpptEIoVBaev3wnOYAEftKJY8qVyUcnwNLJbjU+ML6bFdEfBbi2hdKQVRMbwKedheV5B9L73x89CoWZ3urYEL2gdvBUxB7R4a4XzKkiVsDTFEzrOyxiYyzKWllvEJxHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TbBq8pRSxRP44XmGxkT84V0CiQz4ir70N6Vc0YoZsNc=;
 b=WECXU9asBSIzLPeg65RSIj/8YtrvJd9XKc5bvxE5G1uof7zGADPHw5wsB9ODNyP31fVqqJ5JGVK3zGC5AgvGoCb7PkSc1IIxVo+0+GWkCNfzgG8diZNuIwW5xo7uFGGEw2g1griMGDEa9AFIM545937fs7+k4hliHWBDf4Ed4CHEpCefgzmG0htNNBryYb/zNUldk0e+ueluNDsKHO1DWQbSAuDd9KALQh8DXb6nbmtCOCjymWSQUQthCVkUHl2bd8tvpkcJIF0GT2e3N8qbKs2on4MN4GjqbxfLHOJM78lo50LP7UyA4dCIDEsFyLc0eSRi10PKvHcC/iC9O4E+2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <83e078c0-49f5-8c76-8ee3-30088f41a65c@suse.com>
Date: Mon, 16 Oct 2023 13:20:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Definition of mfn_t in x86's hvm/grant_table.h
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <a4b6710b66ed05292388ac6882b940ec@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4b6710b66ed05292388ac6882b940ec@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 7386e590-12cd-4290-9ba8-08dbce39e8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bawa3D8UzXjeDLFh/EEaSzrIlgs6uoLpxrckDdfc2hwEAT9YHBCpkJ9rMLedrpqFffsC9tpivnaHTO7oZi5OUQRIPOZhaEkZv/vS1hAU9PQwh3bKB3qeWRnGyY5q+XcR0L+RvsVPUb+549bLUx5x3dBiJnFaozAhDU2zxrxaqcbPUUvtd4sWiAxZV4GsxNeYgOEVu1zX3UoAmv1SdqDnNdUmOcyuMYxknU9CLsN/Ri0LnvepWYvFynVzJ7zMA6F9BkDmzmMtzoc6O2OqUqZKl2xEls6YT1DoDPGITBImIf4HmShStQHvRch2LqoJq/yjQQA76yhBlEEc20990qPqThgHLDSAKaDuuVep3Fk6JYVV06JJIgRgE4SF/0oxwA80q5YwnSrQH6sW1vElCH9FIdBD/fq6VwR6PFNQIyhiQ2ZpGTZLGjbNuigZu4mXt4RHzPBJg/uRofdIpPrTPEC9RHsrnLkXPnT9GcOt1Cc2yc++IrsNOPp64Hf1DBSQjfXdNxuBgqD8eJpYfp9lXGNCyNL16SeCAFATZdLOePpiIBCdFdDa666vX/WcDiwP86CuyWENabtlCVnrav6wBFLkDLnraFMAHyhzUiITvrPm6z54Z2tVsr53ldwwIIs7V6afIIhYEpXx/4M0xEU4aem0fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(31686004)(53546011)(6512007)(478600001)(6506007)(6486002)(86362001)(31696002)(38100700002)(36756003)(4744005)(2906002)(2616005)(26005)(4326008)(316002)(54906003)(66946007)(5660300002)(66476007)(66556008)(41300700001)(6916009)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEt5bWdUczNxMVhkNVlUdjVhZElIOTJGY1lSVE9DWXZrRHlHeUZsZTRCeTNx?=
 =?utf-8?B?YVRjNGZjeEZ3YWtKeEtUOWEyZk9WSmhBQXo5N0c2RElhZlpaeWY0WHp3WENk?=
 =?utf-8?B?cHZGekVudVB0MzFjb0Qzdlp4Q0hVT2x3L3F3RWdtenlvajQ0SCtEQ1Y3RTFY?=
 =?utf-8?B?UGZTN0p2Qmw2b3RrNnEvQUNrVGRCeDVYaEd2cGVhMDlNZ2o2UEU1ZFYxRHVu?=
 =?utf-8?B?c2xQT2gySXNwT1hNa3p0c3lvRkR3NnBvRHY0QVRjRlNUN1l5bXJmMllHL3Zw?=
 =?utf-8?B?NUNJWGx4OUhYN1JGdlUwcEZQcUxSSWV1RDNKOUpFc2FPTUJ0RnNmcnoveHVr?=
 =?utf-8?B?aVlhMXJ1ZDRmb2E0R01yNWlmM3liUjMyQmJvSTBjbmtrZUsrM1A0djVWdDJ6?=
 =?utf-8?B?QmFEYlQ3a3JiWTRmSWVxMWNqTHNlVFZ5MjVsbjk5R2haSS9NamhtdmJtV1pS?=
 =?utf-8?B?Z0hEYTBPejY1K0FJZ290UE15WkdpK3RWYS9wazlLUmY3cW5oZXE2NVVCdUR0?=
 =?utf-8?B?Q0x2T0REWW1aZHZKSWNWbHpEbWFEQURQby9SSDZlZ0paclhtVm12dU1aK2pk?=
 =?utf-8?B?VUVFUmlHWTEvWnlXMlBpVW9salhMNmpoa0RwOGVwYzlBK2J4b091WG1MWmpv?=
 =?utf-8?B?S3MwbjArK1BUYkRKdzU2K1NlV1ZXSmtKMmFHTGpxdkJRTGR3a1B4ZGJ4SDd5?=
 =?utf-8?B?YVF2OGtxRHRweHJQanRKTkRSZ3FrSTduditmR2hhVVpFRE5uY3ZDcDlMVEF6?=
 =?utf-8?B?WWtQZERlTmc4TldLakNmajBWQWMxaUdzTlAwOTZESVB2aUl6MDZpUXdwSGlJ?=
 =?utf-8?B?b3hQZmlLdW5KWG1xNkVFMmNERGdhYXVRZFh6cHVkSTBkM25oUG1jOXJwUFNM?=
 =?utf-8?B?c0hVVjlHZExSbU5jKytPK1dGalhzUDQ2bGNtclBYK202b2JCNEk4S1R1c2tR?=
 =?utf-8?B?V0cvM0dZOFJGT0paQzVBU2dpZDk2NlUvZ3QySkdFNmRJSUFxVzhSeC8yRndr?=
 =?utf-8?B?U1cyaG9UNlFqTnIwSVZFSGQ2NFVLNG41MGVwTHoySEVSeWpQdnE2c3U2V0ox?=
 =?utf-8?B?amtpeG9lU1VKTnN3OHdCQllBRkpCMVVZZ1pERFdKSDF3ZEUyU1pYTHBuOWdh?=
 =?utf-8?B?Yk5vMGVHTTd4cm9ZV0kwNVFyb2t3cUVBdDZwbmp3QVUwSkZFT3FuMVZtVTJL?=
 =?utf-8?B?VWhvQWZVVWtpQ3NadkdCVEQyZjFjN3BHeldvVkVxRFV6RENhWDI4S1owM2FM?=
 =?utf-8?B?VmtMdXZaemZybW1sYkVua2gwNjQrNGxLYldJODlxN2Jka2E5Wkp5eHZ0am5D?=
 =?utf-8?B?cUpsQUV0RkV2dWZHWC96WGdYbEZtUlcxZytkb0x6cGFTaDFQRkh4eUQ3bC9k?=
 =?utf-8?B?Z0YwS2lGbWM2WEtEelRqd1NiNGV1UkFBUkpHenRVeXRicG5LbGJhTnRGZ3hL?=
 =?utf-8?B?cmRacmh5Ui9td2liSUtHSTBnQlVJbGhNekNlNFdmWkY2VVpLTkV4QUJyL1pL?=
 =?utf-8?B?czJwWmEvNVY2YTdud2Vscy9sZFBYcDlDNW52dU9nRzhnWVlQdkpRK08vcnZp?=
 =?utf-8?B?YzFpd21xNXBSZFVISnNiVk1hUTVnejBTbkJ2VmNUYU5Ic2Fmb3VBK3dpcG5S?=
 =?utf-8?B?SFdwRGtpd1g1YnRTNE00UTV2OGlNMFBwYjFVVGpWb3AvYWo1bHZVWis4VU9w?=
 =?utf-8?B?UE5qa05XS1ZZNUxONE1IR3BnTXQ2V1g0YnNiRFVseVRCMHN3VDVTOGxWbHN4?=
 =?utf-8?B?L0dqSW05bGo0MHN4eFo3aCtkN1BuSUhOejQwVm9NU1RCeWJ5K2Z4aVI5QkQz?=
 =?utf-8?B?cXhtcXVobk9DNXFtMFZCS2RZdnZWTzVqVmxnTnUrN0VwZ0M1WFBERmRqNHNS?=
 =?utf-8?B?Q2ZFMm1DY291bFJXZlJMbTdVYmlKd1FlbXJTSTZrRDBRNWVYMjdBMjhmUFFs?=
 =?utf-8?B?dENoRUNwVkpkS3hpbUdVOTFoQTJZSHZuRlRRUGpEb0FneHdpTCtlZFJ0YVRv?=
 =?utf-8?B?THA1NFlVZ0YrTVQ4L1Q2aUhhaVl0b3JyTGR2WG1WU01Wak5QcmxkNTVwRHc0?=
 =?utf-8?B?eHoxdVErMHlsQkY5Ymlsb2dhb09OeXF4L1RPQ05ZZzg4dGFzdEhvSkx2WEJJ?=
 =?utf-8?Q?u7RYZ4+bppI45dJKgTmoOpPD+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7386e590-12cd-4290-9ba8-08dbce39e8b1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:20:31.7165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3AOl0/huWUUNfoFHxleWWEyimyGfzBm47q2OdLU280hF9NUn4rCawH4irjo+/W+/ogPsCEr6ZDGwO2rTZdOuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161

On 29.09.2023 10:51, Nicola Vetrini wrote:
> while fixing a violation of R8.4 related to a missing include in 
> x86/hvm/grant_table.c
> I included <asm/hvm/grant_table.h>, since that file contains just the 
> declarations needed
> by the .c file. However, since the declaration uses the type mfn_t, 
> which is defined in an
> header not included from hvm/grant_table.h I'm wondering what is 
> preferred:
> 1. include #include <asm/paging.h> in asm/hvm/grant_table.h, so that 
> mfn_t can be used
>    without relying on other headers using this one to provide it.
> 2. include <asm/grant_table.h> in x86/hvm/grant_table.c, which includes 
> more declarations
>    than needed, but has all type definitions.
> 
> I prefer (1), but (2) does not have major downsides either.

Why asm/paging.h? xen/mm-frame.h is what you need for mfn_t. I'd be fine
with (1) in that case, but if it was asm/paging.h that's needed (for
another reason) I guess I'd prefer (2).

Jan

