Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD65BE9AF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 17:08:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409493.652446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeqT-0007Vp-5T; Tue, 20 Sep 2022 15:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409493.652446; Tue, 20 Sep 2022 15:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaeqT-0007T9-2D; Tue, 20 Sep 2022 15:07:33 +0000
Received: by outflank-mailman (input) for mailman id 409493;
 Tue, 20 Sep 2022 15:07:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaeqS-0007Sw-1p
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 15:07:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60040.outbound.protection.outlook.com [40.107.6.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2ecfc2c-38f5-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 17:07:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9275.eurprd04.prod.outlook.com (2603:10a6:10:356::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 15:07:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 15:07:29 +0000
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
X-Inumbo-ID: f2ecfc2c-38f5-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcQJZ2nZGwIFja0/hZKWunTk7fDzpl0Q1Xy/PqbfdZrcfpJ0wR+Qhy26tsfP3esQkpN2SWJd62xL3/pHWSQ6xtsAMNbJSsZu9JzrRPdgm93+xWHlZWI7MKTweCwTLSZlbEGfdqceyDa8ePcf/WWogkPjmAqIzEbW6RBEOfgU4PBgZod8auxC3XNgnns4+DPJT/O+GCizK5+85pNiif4T2SyBFbhKSS4Dtk645bN7pcrxVbHhZ52pc/aTiA0LtKncAxMiwoP2uPPO84Gqt3VD3P28yzXny9KOYNFhCDSCLiHFL5fi6sRHS0NMT1r05LcZ0vBj7gLXFTGtdOoROt+ITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLQZ1v9tg6/y3zJlbU3z5OIg0nk4F3+Y+hEuVefgAtU=;
 b=Aoje1JYvo/FgzrvD3tr0THMIBRGGTOCDRcTH8lda8Mt4kc9mHKqbIlyNOv7I+kEHnflkx3isNUiqEFuw5M2mn4qDKH4Szc+u/5YYoIe1j5Qn0snZ2YMpI6phj9Fh9SgcoKO81ejWqmBNlc2VJNKmPMLkoysoTe+X0rssfZ+b4gWyhkvnlyzv+TGzeGentB3ZXE7zsCWO9rG0lwYjqk59dNcuQgcGzfZyWScNz9Jw0uMDC9ESQswErqkUI05hd32682+1IfEsnG7oXsJ/x7H1a9AgKWnuMX9b8fL1iulHQCMNS8Q9yf23l3XAG9Ipox7pbIcIGCO+NVm7udIJELPoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLQZ1v9tg6/y3zJlbU3z5OIg0nk4F3+Y+hEuVefgAtU=;
 b=OCip7ltvMSfPImRapVVj3ISagnSOG1y/gX3YLAbD1wPkrg9We7Lc8F1xh7+UPDvADts6+Go+chJy2ehyGM5v19i0j2PH0EKvjW9EV11hBfbpIP6IFK+hhYSZHC7M7PJfw+f38gJ4szCE7y9CmERymB46todxK/nr597HIFJpnTkNmpOmbziNLoMWeXABcspWu4bu3k3uS2Zq5YgL4ZqMgpbR1nSi7SB3RkQTqKYfJ22in8mixyTjQN8E1m2m4nydf/Qa1spHsglwoYkJE8Xq08bNJ5r7tZoSHXjfxpWZIKfrMnmkqOn8C3OH4zNN/K2R0bTNsHjmDz63yp4J9LuzLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5d935f7e-deb5-6fe3-617e-b65c26a99bed@suse.com>
Date: Tue, 20 Sep 2022 17:07:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 10/11] drivers/char: suspend handling in XHCI console
 driver
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <927d01aa54cf6f5291e506179e3d15dc32ebad40.1663383053.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <927d01aa54cf6f5291e506179e3d15dc32ebad40.1663383053.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: daf1215d-d64e-4db4-224b-08da9b19d63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vGcE5nPtcF5Md7DPPR3WXlwiTdezA1gOaIWK5WSpMneLlmIRc5wE/DRqfmIzecHqaxBJq0qY1ueY1zza4bxJ5bbvpDbJgol4oDIqMnZAhG3QgQuvXuRsXW+0jehRYhIqjb36hVyo7EwXLwBbPIh5TfNOUQLUlEofQm5m15abNmOiPjYxOd4LQ1ZlpB2entv9fFYVQlI4jbNWxhCflM5YfDmJiMuvZH+zr4DxUwxM1q68KRjviPr+ptZEdFbjFO2seljp7htI08a2FJ6/Gt1lZwkTR3BahVpj3AxgOIVuWxdrJu7gX7YeIL8gQpkA1BZf+oXCitMuPXXu1V0G0X8cHqV+sT1OZ+xH5Wha7CqKTJfJw6g3oC/5hX7AGcfmaYM9+PUWMgZ1EO/r82Ym/uCF8UDGM1JpDG5ZS2cIcV5+hxgUvtctGdwYyfoio82YWqML+LKMi8HutkGlfC4vJf84B+ATfw5aI1L2UN0Alu2jUBehe8OJOsI6VjyEvdl4OL03F+w37FqzI3w7/zyMi74RYNq4k5BIW1iqbMsBNKsd58BNPWUeY2wi2uI7p4OAMDdzFM8yhrktCkRgEgEOJ59pKiUMr0q0mgWeCzxRRusBW2aO4Vh7kwlaLJLjToA0DJMmyWGDdyRvygbN0xrG3sBsEbFPC4IiCH+WCzNV/VnpIDRrH7oGSM0d1wmLPCIOnUZ7dJ3B0ka5CerAHD8nC15wTaRAtRDyZ6U679/o9ZiyAeS03HhYT7FRQKIfXBAU/8C2ncmIdciRd2Kmkvknqi5dajq+dlKuQ2wXUUFUNs6KmLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(39850400004)(366004)(451199015)(6506007)(53546011)(31696002)(86362001)(41300700001)(4326008)(8676002)(8936002)(26005)(66476007)(66556008)(6486002)(478600001)(36756003)(66946007)(6916009)(54906003)(316002)(186003)(2906002)(15650500001)(2616005)(66574015)(5660300002)(6512007)(83380400001)(38100700002)(4744005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXN4YVRWUlFIc0lpOFJzYTJLaDRFRm8rVWdXblpYSHBzYXFRUFA5NE5XRVhz?=
 =?utf-8?B?VWQxMXQ5d0FSakl0TkJ5NElQalVRVnNRVUJpdEs2a0YxSXgxK012dDhzdXJF?=
 =?utf-8?B?V0VEbG5CZ2UrWlNIMUs1ZitIR2NadHd1VWUyUGJMaVVUWGNrWHRwWU9mdjNI?=
 =?utf-8?B?UXlsajV0ZWR3dG8yR2dzdlJmRENGOEdaT3VxR0N0UFp5L3NjZFJBM29ydTBt?=
 =?utf-8?B?WlREbWpMRmZBcG1jWUozbHd1SHNJRlJWSFptYmpLOWZRUEwxMzEzcUVuVTRU?=
 =?utf-8?B?czZ3RW5ESE9nVEtaeE84dHBiUDZtd1I1dnJkd0gwaUF2ZmdvUzZjVUdqZjI3?=
 =?utf-8?B?M0hIeEtEUitKZlB4eURkYlM3S29QektLUVIwdHJCejB4V2Yyb3NkcjJSNXJu?=
 =?utf-8?B?NzJicXR1UTBWVDIwcm03dXhOSW1UdmVzc3BNZE96Tm1PUVp4VURaMS9pSkpP?=
 =?utf-8?B?cTZxdjkzYlNDbUp5V2k0T2dxZmtiTDQyYTA0TVVBdUgzL25BamxVRGM4ZC9w?=
 =?utf-8?B?Um85dVBSUEZ5WHdBdXZ4YU5IMFZKQXpOa05vN2ZTckJrVVMrTVM4dzNqZkVo?=
 =?utf-8?B?QU02ZHh6dGNwQ2lHdzV1cmtBU1dBQ1Z3ZFpyMHJreFdwYzlBR0U4RHgyUFdV?=
 =?utf-8?B?c0huZExkYi9qY3RianJyeWRGTWxVVU53QzR2STEwNFByYS9DaU5lSEtRdTA0?=
 =?utf-8?B?VnoyL1hZVldqV01vdWo3Z2FiSkRDOWFjaEd0R1ZVbXBhaGF5U0ZFODJCdURu?=
 =?utf-8?B?ZVNKZEo1ejNLd3hyR3ZYWFNOOCs2NW5EN0pUOS8xMEM5cFJoTlMrek5uKzRy?=
 =?utf-8?B?ZzR0eDQ5cXR3ZDZkWjJZQ0o2TkhuRGg0RkN0MjE5Ly8ybmJoOVVEdFhGZjJo?=
 =?utf-8?B?YVU4dDZLSUd0QkQyc05ITktZWUlZZkJTbFh5d3BzWDlzejYvK29UOHFjcUs3?=
 =?utf-8?B?dk1XckFXczZDWDRaSUFXYTFPRXlCS2Y2WE5PQVhQVldEMTB1MUZlZkxBUjg4?=
 =?utf-8?B?ZWxnWlBRSzdhVXEyM3J5OU5WSFVpUjFYUmlRSTVZWkVBSFlpU1J1ZUdxeEZ0?=
 =?utf-8?B?Wis3U2FzbW1jeVBLMFM2VXdYeDdSOS9IcjVoaEtySDBnNEd1Nk9PdDV6SS9F?=
 =?utf-8?B?K2dNTi9yMFR3TDg4N2lWUjBqSHUxM0t0cmZZTkFLWTBuN1pzblRHTHJPNzhY?=
 =?utf-8?B?aTZiSzIrdDYrRnNpOThuclN6eElUUVQ0SzBhWVF0eis3NVpYWjVycW41THlz?=
 =?utf-8?B?WE5KN3c0MDk4SVRMY3A2a2w0THdQbDZHSElLbGhuTG1URFVkTjdYbVZDbXp5?=
 =?utf-8?B?OStmMko5UjNjdVAwb3Z1L3JLZ2ZZZkRKSGhNQnhKSUtVOGZqbDhEdWxLMlFT?=
 =?utf-8?B?NmcwcDU1SGRweVhMY2p0ekpGTUZLU3BQMDVGS1B4R0JrS2MzVXVQaU1RV2hn?=
 =?utf-8?B?dmtqWHdHN2k5RzhVTm5rQUpETTIvNkwvTEcxOWxZWm9hYjg2dDVCUHBjYUlG?=
 =?utf-8?B?Q2cxbDRnT0ErdisybSt5dnpzc1Vna2h6aWplSndvcC9veHFTSjZjNmZBNlJT?=
 =?utf-8?B?NFZRWGppUExUZmgvZ3lvOGV0SThoNzd4TzQ4ZFE0YzdBVkFlSEs3U0ZWcjNB?=
 =?utf-8?B?NlN3YVRpUDl3TFJyY0RxK3dHWk5jdWM2K3Q0VkxzQ1poNGIyUlZ5dkFsS3Vy?=
 =?utf-8?B?bUJrcFRmOXBqaHoyc3FNT0k0NHk3TlBwemZBcUFFTjJtZEpVWTJTTlBkZDJn?=
 =?utf-8?B?SWQwMTd1MnFkdHZhTFRXNkZMdXhtVG1hM3dUc3Z6dHNRNW5KMklPTHh6a0d0?=
 =?utf-8?B?YTc5MnJJQkI1a2h0VkpsYUZ2MzhsR1JxRXM2U05UY3NheklFZm5CRXBmR24y?=
 =?utf-8?B?WGRza1VyZ2lGenNlMklncFRwRklyQnl6VmlqZWtPSEFEamdDUVBUQ0FrQW12?=
 =?utf-8?B?VktVTlR6eGVoVDh6aE5nSHFjWkhHcXJlek9xcG9WckZPWVhiTWYzSkdoSFJh?=
 =?utf-8?B?OGpRQUphdGZFcHlvQzZveFlScUVOTmhlNGFxY3d3Ym5DRlA1ZDJkY04zMTMw?=
 =?utf-8?B?ZnRldmlTbHJXZTFURDc5T0RtMFhJMm9LMndkRzZTV041WGxXMXg1OVNLVVBE?=
 =?utf-8?Q?/jTOxK0ynJsNngWf134apS1X3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daf1215d-d64e-4db4-224b-08da9b19d63c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 15:07:29.8661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDj+c/lFvxWxZaZoj8rSXsBF4UdgIiD7dREd1DHxU2idrSBdMG1pQq9NrqtWFLZksEddUBmJstwf884TvLbSMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9275

On 17.09.2022 04:51, Marek Marczykowski-Górecki wrote:
> @@ -259,6 +259,9 @@ struct dbc {
>      bool open;
>      enum xhci_share share;
>      unsigned int xhc_num; /* look for n-th xhc */
> +    /* state saved across suspend */
> +    bool suspended;
> +    uint16_t pci_cr;
>  };

While perhaps of limited relevance right here, may I nevertheless
suggest to move the new boolean next to the other one in context.
That's both to avoid setting a bad precedent (of not using available
padding slots for data like this) and because imo the comment also
isn't really applicable to this field (but just the other one you
add). Preferably with that adjustment
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

