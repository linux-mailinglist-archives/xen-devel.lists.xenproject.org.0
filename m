Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDF476F9B5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 07:54:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576822.903391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnkj-0001Yj-HK; Fri, 04 Aug 2023 05:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576822.903391; Fri, 04 Aug 2023 05:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRnkj-0001Wn-Eb; Fri, 04 Aug 2023 05:53:33 +0000
Received: by outflank-mailman (input) for mailman id 576822;
 Fri, 04 Aug 2023 05:53:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRnkh-0001Wh-AJ
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 05:53:31 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c12cff4-328b-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 07:53:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB10073.eurprd04.prod.outlook.com (2603:10a6:800:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 05:53:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 05:53:24 +0000
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
X-Inumbo-ID: 3c12cff4-328b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBLLS/20mRirAEBG9EDPkq/NdabbcfAO0phaxPSaOXccad7Q0xA4aiSP+FUzXLSfb6mRw28aqUlik6dhVdvTzxRdQBfxCL1bPtB/vR4VRbXGWG7wjuApT14m5qimXkuUDh5047IHefXo/hg4tUriFExqQfqnAtsjJ9Yw9l7Y+OIBKUAS2gjtUls2pe/HEq5k58GLPnB1uL0rb+deUqdJOVpx6ciD4Ulr7AkqFGl+GpQrL1AQAN9bXq0KqCbq2htCNtaD7lcfQRhZ5xJ+L7v97BziJcWxkvZ512L7LDkRf5o/8Hxu9N6bN8zFc6A6Cg7E22c7P1X+XSMxJOsG3iI50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K28Xp1Ea3H7jAy+erQruHUf+De5WEFjuI4sZ1DTcCww=;
 b=ZOhpgo1JKBJ/i1rlLgxTX0JdeGc6ahTmLaJXONoZ32P2ZaY5IbbaVp78sNQ0+o4mKIWYJCNRQWtvFh/j1dysStY0D+4PkmykAWkYBNBCWb4QMchmIqmWMgG6bL17aD86FpxRjAa5vA4bSMCLoSMLbsKocLaY628GRMOmj4AztBQcNo8daXltGvgHNRs1DcPL+ZFLK2w771idN4guP92F3GrqzOY0Z8wJZuNS7YpphUOya1x5cY3K0veFK6wzZZdBmmHbopyY360E9KmN8TLQ+PfpadecWPZ9j1l8aoitjtH9JvdF3jjb/xmCulkaK+YZ2NAdtBhsxkQB/ddfwQt7Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K28Xp1Ea3H7jAy+erQruHUf+De5WEFjuI4sZ1DTcCww=;
 b=HsJn/YF3WS4b0cRRDejZiRko6BsgvMf0wmYLGd8QIAoe2OSndlcgj1mCdPNrMgy7GaAvTE8DM2vedTcdZSBMnf151n6Xm2+Hp6QojJCpNS4PF6XWEkgTLWX8YoUmra6repWKMzZAOzzR6I1kivF32p6WpxYlqYl297mrbVWbTvE2jPWUehIqIHymc+5hQIyQdmDcU2KlnVub1jVjvGztxVfZOdpt8T3abUdI4x/UWwY1w8hL3Duop3VMIdl7LEKht/LIBQGIrJw+9yOHSUNsLiN4FpQD36OcAG+WjDlOG2FeJiyz4McEyLwctxFTLyf+6vGyTtaDjMazVuZywyMiwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfc55215-48e5-3a39-4b32-67031ee35c6b@suse.com>
Date: Fri, 4 Aug 2023 07:53:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 00/22] Cleanup and splitting of xl.cfg parsing
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <cover.1690990427.git.ehem+xen@m5p.com>
 <673c6ba4-6d1e-6e51-0da4-fb8996cde4a2@suse.com>
 <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZMvSHuEQzGYyVJ49@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af6f497-578c-4401-fc86-08db94af1d69
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GMIGHP4E4I/yZ/QlW5Bg/wZxZxT9flXIMpzqdSPmOcPzEvkwIgbitX3N7z6Te/NE/qtqTp48W+FiuptWpEe38NDrFicqWVymQATe7Z9VkgTdrCUyeZYomUYNly5nZ/Uv3jei45VG36xHDnDv9Sf5aVehi1nZRmCeeQ1F/g9uOp7sx70hDzVYzkbsH1G2u+rucMJE7QlW2b3QcGWZg3z8APL3BLmJuUh5e1DryFAbfZI2L3qZZH90MMd0Z6IC6itHLPlI+5k4EwnTPHsmVzshpAOs24KZybMdfNOFy15yfwcMz9k4qR0i1ffG7dh0mlEaEQGiwBQ8+4xwMNpelGCgkaEsjEbNh1fgYJI/R8tI2E/k2Pc2pdgFRnu95IHfS77+HszLx3aSSI5j87K5NZC/De/p3/9fpMJDawN6I57EE+7NSKAy2LRsQMWK2VNg/o06O8NeFcgULc4QFe79HbUzPrHGM6x1tqcP/hfyM/Xburz0oD4FggVX+Ekd2hpXGl/ofDenqa5oyGlCGWc7zik70nrv4m4zcG2LfSNoukWSaN3Zt4KyU8M3QIKwWGR3DXwpY+eDF54+c8+S9iYgxyH6k843YraIcm4ak88o9FQWVsdadknEiL4oCnovdp6PgE2zhrPnLYlpt3GbdLY3a9JcKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(1800799003)(186006)(2616005)(53546011)(8676002)(26005)(6506007)(66476007)(2906002)(316002)(4326008)(66946007)(5660300002)(66556008)(8936002)(41300700001)(6666004)(6486002)(6512007)(478600001)(54906003)(38100700002)(31696002)(36756003)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnZtbExxMURLNktUZm14RE1tUnJkbldHV3R5Z2JHdlRoQkd0bUs5dWdyZXEy?=
 =?utf-8?B?WGUwSFhCTTlqNVQ2V0ZqUFpjTzJpYU5DYndTS1VLWUg5N0pOOS9DTE1DTGJD?=
 =?utf-8?B?Q04wclpYTHFzQ2hOQUkwOExab21IbWpWeko5ZXRyaUUvNi9MbTExVURhNUV3?=
 =?utf-8?B?QlNhUzZVb3lkNW1hVW1Md3ErYmRsUUY2Zzh0VllwUEdFbjZCc3lFNkVmS3k0?=
 =?utf-8?B?bktsZkl6L0taY2wzUDNITVlQZEM2cElReVU1b05vQitYNnFhODg5QUNWdDl2?=
 =?utf-8?B?TmMyK2s3UFJkb2w0VHljcW83bkJ6UUZyS3h0Z3JNWFZtQ2JNTHpmVTlrNk84?=
 =?utf-8?B?T3hLaEtDaFVVS0JVSkN2b2pIRDlZS2lzK2N1RytGVytQMmI3TG1CTGJQVGdY?=
 =?utf-8?B?RHBKR3p1eUVhMFBjeFQ0UzB1TGltWlZiL2lLZXFORmU4QlVtNXovSnhNL29S?=
 =?utf-8?B?bHBkdENEenBKWCtZSkRGQWplVkREZ2pWWlJrY0J3czVoR2NRSk1jVDg4YWYz?=
 =?utf-8?B?TE9md05FTTZqYnN5eTdtdGliV1pZeEc4MWFBcG0vUTRHQ3VlMnZrRGtISlY4?=
 =?utf-8?B?WlFJRUxRR0hJa2dtUmRpdWVaUUwrNWpUMnZMZklhTFNSMU9zS3BKUnlna24r?=
 =?utf-8?B?Zi9nd3JGL2RGV052VlR0M08rck5HcUlPczQwQm5aMWhqNXJCdU0rbG91L3U2?=
 =?utf-8?B?SHZ6L0Q2UENIMjliampNTnFydnAwZDEyaTg1ajNLaXNxMzFPbzJPc1RrU0xO?=
 =?utf-8?B?MHdYWHMwVk8vVVd4alMrRGg2R2gvWENMVlpEUHBPVENxRzJPaVBCTWhsWVpt?=
 =?utf-8?B?QmRyajJSK2swbmxmZjVtbk83TWFnT3VQUEplZXdYb3lqNjZUZXJFSGlKczFJ?=
 =?utf-8?B?K2lyTlpJd1BPV2dZZ0sveGl5YlBtdC9kY0ZjMElQUTE3b3FtTFRQWkQzZDhX?=
 =?utf-8?B?aDMxUnlTTzJpRkNRaE01R2FDMDJjWGlNbU5BQW5VdGtqQ1pQZFF1dmhjSWJE?=
 =?utf-8?B?M0pWMXBRNXRoQXBMcCs1VDRHb3NET2dMK2ZlcHNnNjI3SmNicE9iR1poZG1p?=
 =?utf-8?B?UnJFdGthQ3k1dTNNeHhpZEZDVlFNbzNVUUgraldGa09yMjdKTjZTZGNibXJC?=
 =?utf-8?B?eXMxR0NUcGphakovODJHQjZIblg4YWlOUjJlNS94bVBmQUQvdVJnQ1dxRUhR?=
 =?utf-8?B?V0REcWNtME5MT0NjclhZazE4WVYyRnEzcCsrbmY0TG85NjY3YlhDMU8vRWY5?=
 =?utf-8?B?TFBtZjgrTUFIUG9ETUFqMlNiR1U3TEdRbWtWakVWaXljWmJodW9lS1N5NVRm?=
 =?utf-8?B?R2pveVprRjJmcGRSUDM4RnVmS1F5a2padTl0U0NCWjhMOG9DSVVEd1J5MUVx?=
 =?utf-8?B?YklqNllMem0xaEZRR1JBc1diV3p0QUNkWnRpMnBBMUlVdFhiai90aFkzZVJk?=
 =?utf-8?B?SGRmTlJJc3FpcXBwNVJ4UWkxRGxjZzBjd0ZPS2Z1QkVNWFNocmFoL3hwQ0wr?=
 =?utf-8?B?OVEzaDJXVzhnRFVvcUFCR2JnNy9NcEUzVkUzSFdRZHBDeWhKVmJxRHltTzVk?=
 =?utf-8?B?U1l4MEYrUVc3T2c5bU0wQUZPVzFUYXRjeUFCd1hSOWgxNGhJMmpiV3ZhZHYr?=
 =?utf-8?B?TjluMnF1VDFVeDRoandmWnRmN0MxZGY2eDAvVEU4WWVKZkhXRGdiV1dDY1BF?=
 =?utf-8?B?cU9vZzNaT2FGSzFNNmtFQ3lxT2U3d0o4VFdPdUZTQmNYWGhhT1BkRUtvWjFM?=
 =?utf-8?B?ZXMvdDVrTTZGa0VKQU1GVDdGck9WN3UyNEdQeUJQUmZXS2FCU0I5ZlpiQjFj?=
 =?utf-8?B?a2Z6TlNkeU4rc0pHL1g0V21wTGl5RFpKclBYTjNCZ0U5c1lnWjVRQkY3cVA0?=
 =?utf-8?B?UW5tajZpZHY0M3cvR3dPc3RDZy9LdXFMUXhwNnUybnpyQkp5OW5qM1Jncnk0?=
 =?utf-8?B?TVlMbGMvZ1E3QjEwZWJ1NWEySFJ5clRDWnpDV2R0RGVraFptNDA3RldLeE93?=
 =?utf-8?B?QmE4YkJxM1c4aDRzVXpsbi9kMkNKN0dnaHBaYWRVV3AyY1NnWHdCS2IyOWdM?=
 =?utf-8?B?OVB6MSsxQmpxZ1kxUjlqM2dwS3RKU2lPMWFPZnlsK245ZmJoNmZuY0g5Njh0?=
 =?utf-8?Q?fOCoYYHI48ALwVbNOuftyNfwN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af6f497-578c-4401-fc86-08db94af1d69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 05:53:23.8333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bocY0SbTuyEGcz22zlzefh3qCA/CtA0v1zFEvOcU/g3Qp8eeo0XfiuSVVd7mSv81Bgu2gRR2xjgWh7MaC6+ihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10073

On 03.08.2023 18:13, Elliott Mitchell wrote:
> On Thu, Aug 03, 2023 at 10:35:53AM +0200, Jan Beulich wrote:
>>
>> Some of the patches looks to have been posted previously as a 7-patch
>> series. It would have been nice if therefore this one was marked as
>> v2, indicating in a revision log what the differences are. It appears
>> as if at least one out of those 7 earlier patches was dropped (or
>> maybe assimilated into another one).
> 
> Indeed.  Problem is several tags could potentially have been used.
> Should I have used all of them simultaneously?  Should I have used only
> some of them?  Which subset?
> 
> Several were mildly adjusted, so it could have been marked "v2".
> 
> No one responded at all to the previous round, so this could have been
> marked "RESEND".
> 
> Yet the refinements and general changes are large enough for the series
> to be pretty distinct.
> 
> I didn't know which way to go, so with no idea which option to choose the
> last one ended up winning out.  Perhaps that was wrong yet I've still no
> feedback on the actual patches.

As, for this series, being just in the role of a committer, without clearly
identifying that some earlier patches can now be dropped from the list of
things which need monitoring, you're making my (in that regard) supposedly
purely mechanical job harder (and presumably every other committer's as
well). As to not getting feedback: Your posting (at least the cover letter)
dates back to July 19. That's not all that long compared to other series.
Plus if you were concerned, you could have pinged the respective
maintainers.

Jan

