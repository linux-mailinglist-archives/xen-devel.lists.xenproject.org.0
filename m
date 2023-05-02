Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811946F4288
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 13:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528533.821827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto2i-0006vY-5T; Tue, 02 May 2023 11:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528533.821827; Tue, 02 May 2023 11:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pto2i-0006tM-2g; Tue, 02 May 2023 11:19:36 +0000
Received: by outflank-mailman (input) for mailman id 528533;
 Tue, 02 May 2023 11:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pto2g-0006tC-2p
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 11:19:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3659de89-e8db-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 13:19:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8059.eurprd04.prod.outlook.com (2603:10a6:10:1e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 11:19:31 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 11:19:31 +0000
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
X-Inumbo-ID: 3659de89-e8db-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jID5z2WgZrRDtW+1/yKgjHYLFz2ny9PK9aPg2Kt08wXviM4LEfKr/zRfx0wNgIcj8vKAZqsCaZxt5RoWUI5YL7mTnlZLEX+rva9S0UPWVrb/3Ean5vPCNsHqTxsYzEEaD5WWqZO/sejzO0+IvSgKc+xJnUsniVT2OL5knp8QHVWYcOh8bG5rgteOlCpAWct6xetvWpT2dWpiT3zoNCH+r/jARA3EGQuiJDGOXOi2OWL6s7gJYS3CiRllIBgGbBZIrhxsIlGLu1sFHJ28H7sie/vVbSmobEzBh84iNnyfLPq9hcERJRq5E7KHKbSP6i1s169EAKEyVNQi/2duO9kWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqbuaeoXW+5rsCtxwnigwiHezoJP/GDY0KCe4Lwn3+U=;
 b=bkzry4NfrkR7rO4I3Fj5vuBUw2OKeBvjf3yPhipQtFicznNQ2SWHuwvj7W/+ImA7VZDXbJpJmYHygCFkezNkyk+XfW/z9yZzbjXTYOAc3+/ZfDU4h0DGaIGyfmpa00tudyhOHKhqBgKXhN2UStx921f+SiElAyFD118cdPudfQMEU+8UAs/kWmaUD6SFc5bcJc7NTfD/dlDCp2amPwZ4p5mckori7tmCj4JnVVpSuUQocQcCV2GknZPLCaZMU1FXOEKbXUm2U1r9/7+ymZTArOHbDcCyI80nOzm+pvL1S+fTs8phddpfXrhbtaajdRbGvpTQXkCkZphxpqEP6UuGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqbuaeoXW+5rsCtxwnigwiHezoJP/GDY0KCe4Lwn3+U=;
 b=AlyBTDydX9F3w8Qoz0dXWsSJEmS84f/RtjZUnYZ7VotYpKg/ebrufffMQ6BTckau69QVWipukZhnuwRHlX6WMMUFox6JNrhRfmtGlVRxsrJ2UP9fkhWQqCGrrT3OMS2qXmnSB/v0tjgIID2jn3Sfo3FlTb0PT4IM2lbRmVSilNagrDtbJVFDuTFRZ0O/P/C1HplhWt/z/1QwSgP58DOb3EW1PVB6NyLqDyKnfoQj5ymrK9j54d3sGgXXj5sPoSPVwQTsyg9e1ri1c6ZIYf/2Lks3T9OWA3quNT/apEluj08JjPVoGmgK/nuflG79LkNBIO3Q8v15oPa1ZEaE6CKW9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b5292073-c675-587e-e19c-cbbeead41a7c@suse.com>
Date: Tue, 2 May 2023 13:19:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC] SUPPORT.md: Make all security support explicit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper@cloud.com>,
 Roger Pau Monne <roger.pau@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230428081231.2464275-1-george.dunlap@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230428081231.2464275-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b311c6-ddd0-4f5c-7845-08db4aff19b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8OPGBh78YVedYFLA78k5cbmGYko1lrNg1ewCqx+lq4fjSfbxfscm9R5eKRpmjLo8et6XcEnveif18bM3qdXT1dOnWhi6RDdjcXdBfmk/6JP1+fqDsJXCd6bLbUBDoYLuKEM8bHmc3VNh4IcuvONh83kjxf9DCnb94fG+OtL0Or+vaS/u4rJ9eA93TAbIPY9ttMd3Ssvifg5xUVel2RO01158ygQicP3v+Op4iO0VwEp2nmyrFRFkaeLxXZUuymAGrftN2weN1u7344jgk5Yhj2FsM2joJWobgHNc6D1Ru7HR38DOt9rD9mfvK4Zuy3iFgJjdj5g5ZDWEp0CD3ZDBKo8i8RnTNJ6T7LWab7V4KjTzTu8/Uk7l6saHuhWFIIRXYayWtC6PciA4F+50uiAvT0w6PaVrpAq9mGGiKG/Fww6cx+m4E9h1WSYe9734XcyNrfOWHrRFoaGR4U8bukivfPhR2TWLk+BXmsm7JrmY2YCNez/uKzO9J+69RaH/OUT6XTynEbCbxQto+V21ATIFsSHgTrA9mHp+x4d+DrQJ8FZnzlL0qylJCZZvKofq2AWrfGJ2x834/x/N1oxvIwn6ALc4hSy+ND0dVH+licLPFRqnUM3Flc+BU079/MBSa6WPTmsgQdUXG10Q6Ibq44yIwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(478600001)(26005)(6506007)(6512007)(53546011)(86362001)(31696002)(6486002)(83380400001)(54906003)(186003)(2616005)(31686004)(36756003)(66946007)(66556008)(66476007)(2906002)(316002)(6916009)(4326008)(38100700002)(8936002)(8676002)(5660300002)(166002)(15650500001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1XVEczYjdGOU5zT1hOTDZSS05BMU5ReU50Y2YvdXREL2g4KzJya2VGMmJL?=
 =?utf-8?B?WWlzNHhxK3ROMUZzNVVPdjIvWUhvNW82NTRkQmFrRytuRllTREt5bzB1QnBh?=
 =?utf-8?B?bVo5cS9rNlgxL09mQyt0dFhVMGdSUUdKMndZR2oyam5JbjVhdllMMTRoRS81?=
 =?utf-8?B?cUs3Y3hCZ1VndWMxSTU2ajdCSklaY1lZSmNDWG8vNnFBQUlXOFErNWErc2o5?=
 =?utf-8?B?NTVvZnBUaFhPZXNsWlB4aGtScEFMbEpkcGV3QTFnZndsSy95SGhFQXM4Ujk0?=
 =?utf-8?B?MzhXT3hXWlh1QW9FSkVtVGQ1R3FDWEI4bHlZeXo1VWNyWUhKaElFdTk5UE1h?=
 =?utf-8?B?NVhJK1pEbWVHeCtJQWE1cVd1UXdEaHczSTRPUnN4UkpPWHgzYzBmN0JMclkx?=
 =?utf-8?B?ZERvTWM2NllSU0FqWlpHeWFBOUIwTTNOcjBnenlwZ3UrdExuQkxiT29FU1NK?=
 =?utf-8?B?d2R4dVNnTlowVmZQd1RaYk5RMjk4MDdzMkJKVkx4a2ppNWJUd3hiRFB0VTF4?=
 =?utf-8?B?R0pCTEgyQUpQK1pvak5PVnhHWWN5TTV2M3prdkx6OC9nUEZFQUpEME8rR3k0?=
 =?utf-8?B?MHlkT3NveithRUNPZWhkS1JpZk1YOFNOa2wvaXRadkZ3ZEhpQ1l5YlhKUG13?=
 =?utf-8?B?K0d5Qy96SGZFb1NvV1pranU0TExHWTNHRFV2MisvZ0o3eUttZ0pkQS9GSGIy?=
 =?utf-8?B?aXpPZnVUYU1EY2J1dE81ckdXeVRiZ001Rmo3OExDMHQ3aVdGczBLNTh4S3VQ?=
 =?utf-8?B?cGwvZXZucjI1UFNhSVdRaStYRDBnUTkraUFMVTJPbGMzc3lZZ3dwOW45OXZV?=
 =?utf-8?B?TmJzSzkzSEpWTUJVS3krWTJid2d5SDFsdFZxaFlRNTRvNzA0N0F4cGZlaXVV?=
 =?utf-8?B?bzkzZnQyRXhXalcrR01ZM1dJckhqNUJNcXcyZnMzTU5YbFNWT1dLa0JFNFlt?=
 =?utf-8?B?NXdTKzk5TWdhbWRXZ3RleVFqbWFqN0lmbmJSMmlMbnBVdFFLNDlWS3NvSGoy?=
 =?utf-8?B?Um9aUE16RGtCN1dHbTlmdG5sa09XbnZOL2ovWGdPQnRGL0hlS0VieTRpWGxa?=
 =?utf-8?B?TUVEbElLSHMzc3I1MHorSm5ENWxoZVF6WVN4bHlZckxyNk1WVHVwN2RtSXMy?=
 =?utf-8?B?Tks0SWo3UjU1OXZjcWE2YnZuTjYxQ2M2blBwbjhJdkNTQk9ZNW9iaVZKVTI1?=
 =?utf-8?B?cWYvZlZaSGFnd3puOCtYQWk3T0dNdG9mejFudlBpTHJIWVh5QXhLdjBtYU5y?=
 =?utf-8?B?anVYOVhLeS9PME93ek9QcHprTDFDWDNvTjFVSFdiK3lEZ0JDQVVEUnRJRTd1?=
 =?utf-8?B?bFM0SHhJZ3FvQ213MUI3SWEwSHgyNllVdnFBRXBLa3pyd0Nud1BKeHR5Wkt2?=
 =?utf-8?B?R1BXd1JZS2ZYNjR2U0lTWkFKN01iRlBOKzk4eFBVbHdTdzlTSytLemJuMGl1?=
 =?utf-8?B?R3ZmSUF0cHY2bTVqR2lNT2dpU2FVbk5OVWdJK1V1dFFHaHE0TDJ5dGdHd2Ro?=
 =?utf-8?B?VW51dzc4dnJrT2tHSGFqK3dPaVNoaDNNaVdNSzAza05LcUNuN1hDekJ1ZWVM?=
 =?utf-8?B?S3phZGNKWkZhQmc0Q3UxNU5aaTg1bklrMzNFYjF5TTM5YlZXV3lBYUFZYVZw?=
 =?utf-8?B?L3RFZU8zc0ZKbXlHY2NqRm51TVg0eE0yTDNJaWN5YmgzZnZnellFV04yRlJK?=
 =?utf-8?B?ZkdQNzNOYThlMlhuTlhGTlIycnVJdVhSU2M3QnpwejhXMFNQVkI2M0h3eXVO?=
 =?utf-8?B?TExFcFJlZnNHNktNU0RnbEkvOG5zekhOaEJVQWxKNlFzejdqSkpYZTZEZkxu?=
 =?utf-8?B?dThnTENMVVRhWUp1Z2FpZVpuRnVCOFdNQjkxNnRPd0dBQ0VXbXdEeTJBUEJ1?=
 =?utf-8?B?cDNnRTVrdDFmNFlER1RubUNVeG43NTBqWHlXajd5R2NZdVJwbHJCM1BENlRm?=
 =?utf-8?B?UTg1L2hKZUNaUWdqbmRBUWlGbzkyVGpEY1o5ZEZFeEpmU0poc2Q3d1hQUXdl?=
 =?utf-8?B?cUdSc3ZiMFNPd0V2a29vUFBsQzU4Wi8va3phUkd6RVdUZ0E1RlBqZjRwYWtD?=
 =?utf-8?B?cXNabGNtOXd0bEl4U2g4NnIyN3hlbW9SQjBtNkFQM1BLTnlPMWY5RzJvQlc4?=
 =?utf-8?Q?k23PPNjTdFFL+TBWmvUsIAIXF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b311c6-ddd0-4f5c-7845-08db4aff19b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:19:31.2615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jEwhyosF+CcD3YKWI3wdlqqOcscKeRzRiALSCbhl+RuVB3kNEzFQGLh7Cgc5jKwRS4U4AiVPFAkRCAyCLKAhMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8059

On 28.04.2023 10:12, George Dunlap wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -17,6 +17,36 @@ for the definitions of the support status levels etc.
>  Release Notes
>  : <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
>  
> +# General security support
> +
> +An XSA will always be issued for security-related bugs which are
> +present in a "plain vanilla" configuration.  A "plain vanilla"
> +configuration is defined as follows:
> +
> +* The Xen hypervisor is built from a tagged release of Xen, or a
> +  commit which was on the tip of one of the supported stable branches.
> +
> +* The Xen hypervisor was built with the default config for the platform
> +
> +* No Xen command-line parameters were specified
> +
> +* No parameters for Xen-related drivers in the Linux kernel were specified
> +
> +* No modifications were made to the default xl.conf
> +
> +* xl.cfg files use only core functionality
> +
> +* Alternate toolstacks only activate functionality activated by the
> +  core functionality of xl.cfg files.
> +
> +Any system outside this configuration will only be considered security
> +supported if the functionality is explicitly listed as supported in
> +this document.
> +
> +If a security-related bug exits only in a configuration listed as not
> +security supported, the security team will generally not issue an XSA;
> +the bug will simply be handled in public.

In this last paragraph, did you perhaps mean "not listed as security
supported"? Otherwise we wouldn't improve our situation, unless I'm
misunderstanding and word order doesn't matter here in English. In which
case some unambiguous wording would need to be found.

Jan

